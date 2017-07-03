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
|       Arquivo            :  mdb_uart.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  25/02/2017
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <nxp\iolpc1768.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "..\..\includes.h"

/***********************************************************************************
*       Definições locais
***********************************************************************************/
#define TAM_BUF_IN                              50
#define RELOAD_SILENT_TIME                      5
/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned char *MDBUART_pOut=NULL;
unsigned char MDBUART_bytes_to_send=0;
unsigned char MDBUART_buffer_in[TAM_BUF_IN];
unsigned char MDBUART_bytes_recebidos=0;
unsigned char MDBUART_novo_pacote=0;
unsigned char MDBUART_silent_time=0;
/***********************************************************************************
*       Funções locais
***********************************************************************************/


/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Inicialização do módulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MDBUART_ini(void){
  
  UART_init(2,9600,NULL,NULL,NULL);    
}
/***********************************************************************************
*       Descrição       :       Função de tratamento da interrupção de TX
*                               da uart que atende ao protocolo MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MDBUART_irq(void){  
  unsigned char dummy;
        
  switch(U2IIR_bit.IID){
    case THRE:                  
               U2LCR_bit.PE = 1; // Habilita o bit de paridade
               
               if(MDBUART_bytes_to_send){
                 U2LCR_bit.PS = 0x03; // Força em 0                             
                 MDBUART_bytes_to_send--;
                 U2THR = *MDBUART_pOut++;  
                 MDBUART_silent_time = 250;
               }          
               else{
                 U2LCR_bit.PS = 0x03; // Paridade par
                 MDBUART_silent_time = 250;
               }
               
               break; 
    case RDA : 
               if(U2LSR_bit.PE)
                 MDBUART_novo_pacote = 1;
               
               dummy = U2RBR;               
    
               if(MDBUART_bytes_recebidos<(TAM_BUF_IN-1))
                 MDBUART_buffer_in[MDBUART_bytes_recebidos++] = dummy; 
               
               break;      
    case RLS : 
    case CTI :
               dummy = U2LSR;         
               dummy = U2RBR;         
               break;      
  }  
  
  //Apaga o flag de interrupção pendente
  CLRPEND0 |= (0x01)<<7;               
}
/***********************************************************************************
*       Descrição       :       Envia um pacote de dados através da uart
*                               MDB
*       Parametros      :       (unsigned char*) ponteiro para o buffer
*       Retorno         :       nenhum
***********************************************************************************/
void MDBUART_envia_pacote(unsigned char modo,unsigned char*pacote,
                          unsigned short int tamanho){
                           
  U2LCR_bit.PE = 1; // Habilita o bit de paridade
  if(modo)
    U2LCR_bit.PS = 0x02; // Força em 1
  else
    U2LCR_bit.PS = 0x03; // Força em 0
  
  MDBUART_bytes_recebidos = 0;
  MDBUART_novo_pacote = 0;
  MDBUART_pOut = (pacote+1);
  MDBUART_bytes_to_send = tamanho-1;
  U2THR = *pacote;  
}
/***********************************************************************************
*       Descrição       :       Lê um pacote do buffer do protocolo MDB
*       Parametros      :       (unsigned char*) ponteiro para o buffer
*                               (unsigned char) tamanho da bloco lido
*       Retorno         :      
***********************************************************************************/
void MDBUART_le_pacote(unsigned char *pData,unsigned char tamanho){
  
  for(unsigned char i=0;i<tamanho;i++)
    pData[i] = MDBUART_buffer_in[i];
}
/***********************************************************************************
*       Descrição       :       Getter para o contador de bytes recebidos
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
unsigned char MDBUART_get_bytes_recebidos(void){
  
  return MDBUART_bytes_recebidos;
}
/***********************************************************************************
*       Descrição       :       Getter para o flag que indica que há um novo
*                               pacote no buffer
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero se houver
*                               um novo pacote no buffer
***********************************************************************************/
unsigned char MDBUART_has_new_package(void){
  
  return MDBUART_novo_pacote;
}
/***********************************************************************************
*       Descrição       :       Delay 
*       Parametros      :       N ciclos de 1 milisegundo
*       Retorno         :       nenhum
***********************************************************************************/
void MDBAURT_sleep(unsigned short int cicles){
  
  vTaskDelay(cicles);
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
