/*__________________________________________________________________________________
|	Dextro Solu��es Tecnol�gicas
|       
|       Itaja�
|       www.dextro-st.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Dextro and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Dextro
|       or its distributors.
|
|       Este c�digo � propriedade da Dextro e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|      Dextro ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  flash_queue.c
|       Descri��o          :  Fun��es para implementa��o da fila
|                             de eventos na mem�ria de massa
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  25/08/2011
|
|       Revis�es           :  1.0.0.0
|     
|                             1.1.0.0
|                             ( As fun��es de implementa��o da 
|                               fila tiveram a implementa��o completamente
|                               alterada)
|                             (31/08/2013) por Marcos
|
| __________________________________________________________________________________
*/
/***********************************************************************************
*     Includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <nxp\iolpc1768.h>
#include "flash_queue.h"
#include "..\includes.h"

/***********************************************************************************
*     Defini��es com constantes utilizadas no programa
***********************************************************************************/ 
#define LLW_blockRead                   MEMORYWRAPPER_readBytes
#define LLW_blockWrite                  MEMORYWRAPPER_writeBytes

/***********************************************************************************
*     Enumera��es
***********************************************************************************/
#define PAGE_SIZE                       128

/***********************************************************************************
*     Estruturas
***********************************************************************************/


/***********************************************************************************
*     Uni�es
***********************************************************************************/


/***********************************************************************************
*     Constantes
***********************************************************************************/


/***********************************************************************************
*     Variaveis locais
***********************************************************************************/


/***********************************************************************************
*     Fun��es locais
***********************************************************************************/
void FLASHQUEUE_loadControl(sFlashQueueData *queue);
void FLASHQUEUE_saveControl(sFlashQueueData *queue);

/***********************************************************************************
*     Implementa��o
***********************************************************************************/

/***********************************************************************************
*     Descri��o     :   Carrega o bloco de controle de uma fila
*     Parametros    :   (sFlashQueueData*)Ponteiro para a fila
*     Retorno       :   nenhum
***********************************************************************************/
void FLASHQUEUE_loadControl(sFlashQueueData *queue){
    
  LLW_blockRead(queue->inicio_flash,
                (unsigned char*)&queue->controleFlash[0],
                sizeof(sFlashQueueControl));
  
  // A c�pia do bloco de controle
  // fica gravado em uma p�gina
  // diferente da dataflash
  LLW_blockRead(queue->inicio_flash + PAGE_SIZE,
                (unsigned char*)&queue->controleFlash[1],
                sizeof(sFlashQueueControl));  
     
  if(queue->controleFlash[0].checksum == FLASHQUEUE_checksum((unsigned char*)&queue->controleFlash[0],
                                                             sizeof(sFlashQueueControl)-2))
    return;                
  else    
    if(queue->controleFlash[1].checksum == FLASHQUEUE_checksum((unsigned char*)&queue->controleFlash[1],
                                                               sizeof(sFlashQueueControl)-2)){
      queue->controleFlash[0].indiceBlocoInserido   = queue->controleFlash[1].indiceBlocoInserido;
      queue->controleFlash[0].indiceBlocoLido       = queue->controleFlash[1].indiceBlocoLido;
      queue->controleFlash[0].quantidadeBlocoFila   = queue->controleFlash[1].quantidadeBlocoFila;
      queue->controleFlash[0].quantidadeNovosBlocos = queue->controleFlash[1].quantidadeNovosBlocos;
    }
    else{
      //Se os dados forem inconsistentes nas duas entradas, zera tudo...
      queue->controleFlash[0].indiceBlocoInserido = \
      queue->controleFlash[0].indiceBlocoLido = \
      queue->controleFlash[0].quantidadeBlocoFila = 
      queue->controleFlash[0].quantidadeNovosBlocos = 0;
            
      HD44780_clearText();
      HD44780_writeString("MSG:001 - QUEUE INDEX CHANGED");
      
      FLASHQUEUE_saveControl(queue);
      
      vTaskDelay(10000);
    }      
}
/***********************************************************************************
*     Descri��o     :   Salva o bloco de controle de uma das filas
*     Parametros    :   (sFlashQueueData*) ponteiro para a fila
*     Retorno       :   nenhum
***********************************************************************************/
void FLASHQUEUE_saveControl(sFlashQueueData *queue){
 
  // Deixa os dois blocos de controle com
  // os mesmos dados
  queue->controleFlash[1].indiceBlocoInserido   = queue->controleFlash[0].indiceBlocoInserido;
  queue->controleFlash[1].indiceBlocoLido       = queue->controleFlash[0].indiceBlocoLido;
  queue->controleFlash[1].quantidadeBlocoFila   = queue->controleFlash[0].quantidadeBlocoFila;
  queue->controleFlash[1].quantidadeNovosBlocos = queue->controleFlash[0].quantidadeNovosBlocos;  
  
  // Faz o calculo do checksum para o bloco de controle
  // e insere nos dois blocos de controle
  queue->controleFlash[1].checksum = queue->controleFlash[0].checksum = FLASHQUEUE_checksum((unsigned char*)&queue->controleFlash[0],
                                                                                            sizeof(sFlashQueueControl)-2);
  
  // Na sequ�ncia os dois blocos de controles s�o salvos
  // em opera��es distintas para evitar que caso a falha
  // em uma das opera��es resulte na corrup��o dos dois
  // indexadores!! N�o questinona, aceita!
  
  // Salva o primeiro bloco de controle
  LLW_blockWrite(queue->inicio_flash,
                 (unsigned char*)&queue->controleFlash[0],
                 sizeof(sFlashQueueControl));    
  
  // Salva o segundo bloco de controle
  LLW_blockWrite(queue->inicio_flash+PAGE_SIZE,
                 (unsigned char*)&queue->controleFlash[1],
                 sizeof(sFlashQueueControl));                             
}
/***********************************************************************************
*     Descri��o     :   Inicializa uma fila em flash
*     Parametros    :   (sFlashQueueData*) Ponteiro para a fila
*     Retorno       :   (unsigned char) Igual a zero se conseguir
*                       inicializar a fila
***********************************************************************************/
unsigned char FLASHQUEUE_init(sFlashQueueData* queue){
  
  
  return 0;  
}
/***********************************************************************************
*     Descri��o     :   Insere um novo evento em uma fila
*     Parametros    :   (sFlashQueueData*) Ponteiro para a fila
*                       (void*)bloco de dados que ser� inclu�do na fila
*     Retorno       :   (unsigned char) Igual a zero se conseguir inicializar
*                       a fila
***********************************************************************************/
unsigned char FLASHQUEUE_append(sFlashQueueData* queue,void *pData){
  
  FLASHQUEUE_loadControl(queue);
  // Ap�s a carga do bloco de controle, o 
  // bloco de indice zero sempre vir� com os dados
  // corretos, caso ocorra a perda ele vir� zerado
  // mas os dados nele contido ser�o consistentes
  
  /// A quantidade de posi��es livres na fila � dado
  /// pelo c�lculo QtdLivre = Total - Ocupadas
  /// caso n�o existam posi��es livres, n�o insere o evento...
  //if( (queue->posicoes - queue->controleFlash[0].quantidadeBlocoFila)<=0)
    //return 1;
  
  unsigned int inicioAreaDados = queue->inicio_flash+(PAGE_SIZE<<1);
  
  LLW_blockWrite(inicioAreaDados + (queue->controleFlash[0].indiceBlocoInserido*queue->tamanhoBloco),
                 pData,
                 queue->tamanhoBloco);
                 
  queue->controleFlash[0].indiceBlocoInserido = (queue->controleFlash[0].indiceBlocoInserido + 1) % 
                                                 queue->posicoes;
  queue->controleFlash[0].quantidadeBlocoFila++;
  if(queue->controleFlash[0].quantidadeBlocoFila>queue->posicoes)
    queue->controleFlash[0].quantidadeBlocoFila = queue->controleFlash[0].quantidadeBlocoFila>queue->posicoes;
  
  /*
  queue->controleFlash[0].quantidadeNovosBlocos = (queue->controleFlash[0].quantidadeNovosBlocos+1) % 
                                                   queue->posicoes;
  */
  
  //Faz uma fila circular com os �ltimos 10....
  queue->controleFlash[0].quantidadeNovosBlocos++;
  if(queue->controleFlash[0].quantidadeNovosBlocos > queue->posicoes)
   queue->controleFlash[0].quantidadeNovosBlocos = queue->posicoes;
  
  FLASHQUEUE_saveControl(queue);  
  
  return 0;
}
/***********************************************************************************
*     Descri��o     :   L� o primeiro evento inserido na fila
*     Parametros    :   (sFlashQueueData*) Ponteiro para a fila
*                       (unsigned short int) offset desde o primeiro evento novo
*                       (void*) Ponteiro para o local onde ser�o recebidos os dados
*     Retorno       :   (unsigned char) igual a zero se conseguir ler os dados
***********************************************************************************/
unsigned char FLASHQUEUE_readFromFirst(sFlashQueueData* queue,unsigned short int offset,
                                       void *pData){
                                         
  FLASHQUEUE_loadControl(queue);                                         
  if(offset>queue->posicoes-1)
    return 0xFF;
  
  unsigned int indiceHistorico;
 
  if(queue->controleFlash[0].indiceBlocoInserido>offset)
    indiceHistorico = (queue->controleFlash[0].indiceBlocoInserido-1) - offset;
  else
    indiceHistorico = queue->posicoes - (offset - queue->controleFlash[0].indiceBlocoInserido);
   
  unsigned int inicioAreaDados = queue->inicio_flash+(PAGE_SIZE<<1);
  
  LLW_blockRead(inicioAreaDados + (indiceHistorico*queue->tamanhoBloco),
                (unsigned char*)pData,
                queue->tamanhoBloco);                                       
                                         
  FLASHQUEUE_saveControl(queue);  
  return 0;  
}
/***********************************************************************************
*     Descri��o     :   L� com offset a partir do �ltimo evento inserido na fila
*     Parametros    :   (sFlashQueue*) Ponteiro para a fila
*                       (unsigned short int) offset desde o ultimo evento inserido
*                       (void*) Ponteiro para o local onde ser�o recebidos os dados
*     Retorno       :   (unsigned char) Igual a zero se conseguir ler os dados
***********************************************************************************/
unsigned char FLASHQUEUE_readFromLast(sFlashQueueData *queue,unsigned short int offSet,
                                      void *pData){
  FLASHQUEUE_loadControl(queue);

  // Se a quantidade de novos blocos na
  // fila for menor do que a posi��o
  // do indice n�o faz a procura
  // na dataflash
  if(queue->controleFlash[0].quantidadeNovosBlocos<offSet)
    return 1;
  
  unsigned int inicioAreaDados = queue->inicio_flash+(PAGE_SIZE<<1);
  
  LLW_blockRead(inicioAreaDados + ((queue->controleFlash[0].indiceBlocoLido+offSet)*queue->tamanhoBloco),
                (unsigned char*)pData,
                queue->tamanhoBloco);                                                                                                                             
  return 0;                                        
}
/***********************************************************************************
*     Descri��o      :    Faz o ajuste do ponteiro de primeiro inserido
*     Parametros     :    (sFlashQueueData*) Ponteiro para a fila
*                         (unsigned short int) valor somado ao ponteiro ultimo inserido
*     Retorno        :    (unsigned char) Igual a zero se conseguir ajustar 
*                         o ponteiro
***********************************************************************************/
unsigned char FLASHQUEUE_ajustaPonteiro(sFlashQueueData* queue,unsigned short int offset){
  
  FLASHQUEUE_loadControl(queue);  
  
  
  ///Arrumar isso no futuro!!!!
  if(offset==1){    
    if(queue->controleFlash[0].quantidadeNovosBlocos==1){
        queue->controleFlash[0].indiceBlocoLido = queue->controleFlash[0].indiceBlocoInserido;        
        queue->controleFlash[0].quantidadeNovosBlocos = 0;
        FLASHQUEUE_saveControl(queue);   
    }
  }
    
  // Sempre ajusta o bloco lido com o bloco inserido
  // e zera a quantidade de novos blocos 
  // O parametros offset ficou na chamada de fun��es
  // por quest�es de compatibilidade com
  // o software que utilizada essa biblioteca
  // como cliente
  // TODO: Remover o parametro da fun��o
  //
  queue->controleFlash[0].indiceBlocoLido = queue->controleFlash[0].indiceBlocoInserido;    
  queue->controleFlash[0].quantidadeNovosBlocos = 0;
  
  FLASHQUEUE_saveControl(queue);   
  return 0;  
}
/***********************************************************************************
*     Descri��o       :   Formata uma das filas para o estado onde n�o h� eventos
*                         dispon�veis
*     Parametros      :   (sFlashQueue*) Ponteiro para a fila
*     Retorno         :   (unsigned char) Igual a zero se conseguir formatar 
*                         a fila
***********************************************************************************/
unsigned char FLASHQUEUE_formata(sFlashQueueData *queue){
    
  queue->controleFlash[0].indiceBlocoInserido = 0;
  queue->controleFlash[0].indiceBlocoLido = 0;
  queue->controleFlash[0].quantidadeBlocoFila = 0;
  queue->controleFlash[0].quantidadeNovosBlocos = 0;  
  
  FLASHQUEUE_saveControl(queue);   
  
  return 0;  
}
/***********************************************************************************
*     Descri��o       :   Faz o calculo do checksum de um buffer qualquer
*     Parametros      :   (unsigned char*) ponteiro para o buffer
*                         (unsigned short int) tamanho do buffer
*     Retorno         :   (unsigned char) checksum do buffer
***********************************************************************************/
unsigned char FLASHQUEUE_checksum(unsigned char *buffer,unsigned short int size){
  unsigned short int soma=0;    
    
  for(unsigned short int i=0;i<size;i++)
    soma+=buffer[i];

  return (unsigned char)((unsigned short int)256 - soma);
}  
/***********************************************************************************
*     Descri��o       :   Calcula o tamanho de uma fila
*     Parametros      :   nenhum
*     Retorno         :   nenhum
***********************************************************************************/
unsigned short int FLASHQUEUE_getSize(sFlashQueueData *queue){
  
  FLASHQUEUE_loadControl(queue);  
  return queue->controleFlash[0].quantidadeNovosBlocos;
}
/***********************************************************************************
*     Descri��o       :   L� o tamanho real de uma fila
*     Parametros      :   (sFlashQueueData *queue)
*     Retorno         :   (unsigned short int) tamanho real da fila
***********************************************************************************/
unsigned short int FLASHQUEUE_getRealSize(sFlashQueueData *queue){

  FLASHQUEUE_loadControl(queue);  
  return queue->controleFlash[0].quantidadeBlocoFila;  
}
/***********************************************************************************
*     Fim do arquivo
***********************************************************************************/