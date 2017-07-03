/*__________________________________________________________________________________
|	Quark Tecnologia Eletrônica Embarcada
|       
|       Itapema - SC
|       www.quarktee.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Quark  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Quark 
|       or its distributors.
|
|       Este código é propriedade da Quark  e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Quark  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  impressora.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  01/03/2017
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

/**********************************************************************************
*       Includes
**********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "..\..\includes.h"

/**********************************************************************************
*       Definições
**********************************************************************************/



/**********************************************************************************
*       Variaveis locais
**********************************************************************************/


/**********************************************************************************
*       Funções locais
**********************************************************************************/

/**********************************************************************************
*       Descrição       :       Inicializa o driver da impressora
*       Parametros      :       nenhum
*       Retorno         :       nenhum
**********************************************************************************/
void IMPRESSORA_ini(void){    

  
  
}
/**********************************************************************************
*       Descrição       :       Imprime uma linha na impressora
*       Parametros      :       nenhum
*       Retorno         :       nenhum
**********************************************************************************/
void IMPRESSORA_envia_linha(char *texto){
  unsigned int  baudrate;
  
  PARAMETROS_le(ADR_BAUDRATE_IMPRESSORA,(void*)&baudrate);            
  UART_init(3,baudrate,NULL,NULL,NULL);      
        
  unsigned char tamanho = strlen(texto);
  PROTOCOLO_enviaDadosDireto((unsigned char*)texto,tamanho);
  while(PROTOCOLO_bytesNoBufferTx());
  
  // Volta a configuração normal do 
  // protocolo
  UART_init(3,36600,NULL,NULL,NULL);      
}
/**********************************************************************************
*       Descrição       :       Gera o relatório de faturamento da máquina
*       Parametros      :       nenhum
*       Retorno         :       nenhum
**********************************************************************************/
void IMPRESSORA_gera_relatorio(void){
  unsigned char idioma;
  
  PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma); 
}
/**********************************************************************************
*       Descrição       :       Gera o relatório de teste da impressora
*       Parametros      :       nenhum
*       Retorno         :       nenhum
**********************************************************************************/
void IMPRESSORA_impressora_teste(void){
  unsigned char idioma;
  
  PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);   
  for(unsigned char i=0;i<QTD_LINHAS_IMPRESSAO_TESTE;i++)
    IMPRESSORA_envia_linha((char*)STRING_impressao_teste[idioma][i]);  
}
/**********************************************************************************
*       Fim do arquivo
**********************************************************************************/
