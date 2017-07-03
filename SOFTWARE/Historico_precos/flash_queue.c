/*__________________________________________________________________________________
|	Dextro Soluções Tecnológicas
|       
|       Itajaí
|       www.dextro-st.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Dextro and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Dextro
|       or its distributors.
|
|       Este código é propriedade da Dextro e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|      Dextro ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  flash_queue.c
|       Descrição          :  Funções para implementação da fila
|                             de eventos na memória de massa
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  25/08/2011
|
|       Revisões           :  1.0.0.0
|     
|                             1.1.0.0
|                             ( As funções de implementação da 
|                               fila tiveram a implementação completamente
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
*     Definições com constantes utilizadas no programa
***********************************************************************************/ 
#define LLW_blockRead                   MEMORYWRAPPER_readBytes
#define LLW_blockWrite                  MEMORYWRAPPER_writeBytes

/***********************************************************************************
*     Enumerações
***********************************************************************************/
#define PAGE_SIZE                       128

/***********************************************************************************
*     Estruturas
***********************************************************************************/


/***********************************************************************************
*     Uniões
***********************************************************************************/


/***********************************************************************************
*     Constantes
***********************************************************************************/


/***********************************************************************************
*     Variaveis locais
***********************************************************************************/


/***********************************************************************************
*     Funções locais
***********************************************************************************/
void FLASHQUEUE_loadControl(sFlashQueueData *queue);
void FLASHQUEUE_saveControl(sFlashQueueData *queue);

/***********************************************************************************
*     Implementação
***********************************************************************************/

/***********************************************************************************
*     Descrição     :   Carrega o bloco de controle de uma fila
*     Parametros    :   (sFlashQueueData*)Ponteiro para a fila
*     Retorno       :   nenhum
***********************************************************************************/
void FLASHQUEUE_loadControl(sFlashQueueData *queue){
    
  LLW_blockRead(queue->inicio_flash,
                (unsigned char*)&queue->controleFlash[0],
                sizeof(sFlashQueueControl));
  
  // A cópia do bloco de controle
  // fica gravado em uma página
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
*     Descrição     :   Salva o bloco de controle de uma das filas
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
  
  // Na sequência os dois blocos de controles são salvos
  // em operações distintas para evitar que caso a falha
  // em uma das operações resulte na corrupção dos dois
  // indexadores!! Não questinona, aceita!
  
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
*     Descrição     :   Inicializa uma fila em flash
*     Parametros    :   (sFlashQueueData*) Ponteiro para a fila
*     Retorno       :   (unsigned char) Igual a zero se conseguir
*                       inicializar a fila
***********************************************************************************/
unsigned char FLASHQUEUE_init(sFlashQueueData* queue){
  
  
  return 0;  
}
/***********************************************************************************
*     Descrição     :   Insere um novo evento em uma fila
*     Parametros    :   (sFlashQueueData*) Ponteiro para a fila
*                       (void*)bloco de dados que será incluído na fila
*     Retorno       :   (unsigned char) Igual a zero se conseguir inicializar
*                       a fila
***********************************************************************************/
unsigned char FLASHQUEUE_append(sFlashQueueData* queue,void *pData){
  
  FLASHQUEUE_loadControl(queue);
  // Após a carga do bloco de controle, o 
  // bloco de indice zero sempre virá com os dados
  // corretos, caso ocorra a perda ele virá zerado
  // mas os dados nele contido serão consistentes
  
  /// A quantidade de posições livres na fila é dado
  /// pelo cálculo QtdLivre = Total - Ocupadas
  /// caso não existam posições livres, não insere o evento...
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
  
  //Faz uma fila circular com os últimos 10....
  queue->controleFlash[0].quantidadeNovosBlocos++;
  if(queue->controleFlash[0].quantidadeNovosBlocos > queue->posicoes)
   queue->controleFlash[0].quantidadeNovosBlocos = queue->posicoes;
  
  FLASHQUEUE_saveControl(queue);  
  
  return 0;
}
/***********************************************************************************
*     Descrição     :   Lê o primeiro evento inserido na fila
*     Parametros    :   (sFlashQueueData*) Ponteiro para a fila
*                       (unsigned short int) offset desde o primeiro evento novo
*                       (void*) Ponteiro para o local onde serão recebidos os dados
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
*     Descrição     :   Lê com offset a partir do último evento inserido na fila
*     Parametros    :   (sFlashQueue*) Ponteiro para a fila
*                       (unsigned short int) offset desde o ultimo evento inserido
*                       (void*) Ponteiro para o local onde serão recebidos os dados
*     Retorno       :   (unsigned char) Igual a zero se conseguir ler os dados
***********************************************************************************/
unsigned char FLASHQUEUE_readFromLast(sFlashQueueData *queue,unsigned short int offSet,
                                      void *pData){
  FLASHQUEUE_loadControl(queue);

  // Se a quantidade de novos blocos na
  // fila for menor do que a posição
  // do indice não faz a procura
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
*     Descrição      :    Faz o ajuste do ponteiro de primeiro inserido
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
  // O parametros offset ficou na chamada de funções
  // por questões de compatibilidade com
  // o software que utilizada essa biblioteca
  // como cliente
  // TODO: Remover o parametro da função
  //
  queue->controleFlash[0].indiceBlocoLido = queue->controleFlash[0].indiceBlocoInserido;    
  queue->controleFlash[0].quantidadeNovosBlocos = 0;
  
  FLASHQUEUE_saveControl(queue);   
  return 0;  
}
/***********************************************************************************
*     Descrição       :   Formata uma das filas para o estado onde não há eventos
*                         disponíveis
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
*     Descrição       :   Faz o calculo do checksum de um buffer qualquer
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
*     Descrição       :   Calcula o tamanho de uma fila
*     Parametros      :   nenhum
*     Retorno         :   nenhum
***********************************************************************************/
unsigned short int FLASHQUEUE_getSize(sFlashQueueData *queue){
  
  FLASHQUEUE_loadControl(queue);  
  return queue->controleFlash[0].quantidadeNovosBlocos;
}
/***********************************************************************************
*     Descrição       :   Lê o tamanho real de uma fila
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