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
|       Arquivo            :  mdb_cashless.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  27/02/2017
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mdb_uart.h"
#include "mdb.h"
#include "mdb_cashless.h"


/***********************************************************************************
*       Definições
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Funções locais
***********************************************************************************/


/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Verifica se o dispositivo está presente
*                               no barramento
*       Parametros      :       nenhum
*       Retorno         :       (eMDB_reply) resultado
***********************************************************************************/
eMDB_reply CASHLESS_adreess(void){
  unsigned char buffer[2];
  unsigned char recebidos;
  
  buffer[0] = MDB_CASHLESS_DEVICE;
  
  if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
        
    if(buffer[0]==MDB_RESP_ACK)
      return MDB_OK;
    
    return MDB_ERROR;
  }
    
  return  MDB_TIMEOUT; 
}
/***********************************************************************************
*       Descrição       :       Faz o reset da interface de cartão
*       Parametros      :       nenhum
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply CASHLESS_reset_device(void){
  unsigned char buffer[2];
  unsigned char recebidos;
  
  buffer[0] = CASHLESS_RESET;
  
  if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
        
    if(buffer[0]==MDB_RESP_ACK)
      return MDB_OK;
    
    return MDB_ERROR;
  }
    
  return  MDB_TIMEOUT; 
}
/***********************************************************************************
*       Descrição       :     Lê e escreve nas configurações do cashless
*       Parametros      :     (unsigned char) nível mdb
*                             (unsigned char) quantidade de colunas do display
*                             (unsigned char) quantidade de linhas do display
*                             (eMDB_DISPLAY_INFO) informação sobre o display
*                             (unsigned char*) nível configuraod
*                             (unsigned short int*) pais
*                             (unsigned char*) fator de escala
*                             (unsigned char*) casas decimais
*                             (unsigned char*) tempo máximo para transação
*                             (unsigned char*) opções gerais
*       Retorno         :     (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply CASHLESS_set_and_get_setup_from_to_device(unsigned char nivel_mdb,
                                                     unsigned char linhas_lcd,
                                                     unsigned char colunas_lcd,
                                                     eMDB_DISPLAY_INFO info_lcd,                                                     
                                                     unsigned char *nivel_configurado,
                                                     unsigned short int*pais,
                                                     unsigned char *escala,
                                                     unsigned char *casas_decimais,
                                                     unsigned char *tempo_maximo_transacao,
                                                     unsigned char *opcoes_gerais){
  unsigned char buffer[36];
  unsigned char recebidos;
  
  buffer[0] = CASHLESS_SETUP;
  buffer[1] = 0x00;
  buffer[2] = 0x03;
  buffer[3] = 0;
  buffer[4] = 0;
  buffer[5] = 0;
  
  if(MDB_send_package(1,buffer,6,1,buffer,&recebidos)==MDB_OK){
        
    if(buffer[0]==0x01 && recebidos>1){
      
      if(nivel_configurado!=NULL)
        *nivel_configurado = buffer[Z2];
      
      if(pais!=NULL)
        *pais = buffer[Z3]<<8 | buffer[Z4];
      
      if(escala!=NULL)
        *escala = buffer[Z5];
      
      if(casas_decimais!=NULL)
        *casas_decimais = buffer[Z6];
      
      if(tempo_maximo_transacao!=NULL)
        *tempo_maximo_transacao = buffer[Z7];
      
      if(opcoes_gerais!=NULL)
        *opcoes_gerais = buffer[Z8];      
      
      return MDB_OK;  
    }
    
    return MDB_ERROR;
  }
    
  return  MDB_TIMEOUT;                                                                                                  
}
/***********************************************************************************
*       Descrição       :       Configura o preço mínimo e máximo do produto
*       Parametros      :       (unsigned short int) mínimo
*                               (unsigned short int) máximo
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply CASHLESS_set_min_and_max_price_in_device(unsigned short int min,
                                                    unsigned short int max){
  unsigned char buffer[36];
  unsigned char recebidos;
  
  buffer[0] = CASHLESS_SETUP;
  buffer[1] = 0x01;
  buffer[2] = max>>8;
  buffer[3] = max>>16;
  buffer[4] = min>>8;
  buffer[5] = min;
  
  if(MDB_send_package(1,buffer,6,0,buffer,&recebidos)==MDB_OK){
        
    if(buffer[0]==MDB_RESP_ACK)
      return MDB_OK;
    
    return MDB_ERROR;
  }
    
  return  MDB_TIMEOUT;                                                    
}
/***********************************************************************************
*       Descrição       :       Pool do dispositivo
*       Parametros      :       nenhum
*       Retorno         :       (eMDB_reply) resultado da operçaão
***********************************************************************************/
eMDB_reply CASHLESS_poll_device(eMDB_POLL_HEADER *header,unsigned char *args){
  unsigned char buffer[2];
  unsigned char recebidos;
  
  buffer[0] = CASHLESS_POLL;
  
  if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
            
    switch(buffer[0]){
      case CASHLESS_POOL_JUST_RESET:
           *header = CASHLESS_POOL_JUST_RESET;
           break;
      case CASHLESS_POOL_READER_CONFIG_DATA:
           break;
      case CASHLESS_POOL_DISPLAY_REQUEST:
           break;
      case CASHLESS_POOL_BEGIN_SESSION:
           break;
      case CASHLESS_POOL_SESSION_CANCEL_REQUEST:
           break;
      case CASHLESS_POOL_VEND_APPROVED:
           break;
      case CASHLESS_POOL_VEND_DENIED:
           break;
      case CASHLESS_POOL_END_SESSION:
           break;
      case CASHLESS_POOL_CANCELLED:
           break;
      case CASHLESS_POOL_PERIPHERAL_ID:
           break;
      case CASHLESS_POOL_MALFUNCTION:
           break;
      case CASHLESS_POOL_CMD_OUT_OF_SEQUENCE:
           break;
      case CASHLESS_POOL_REVALUE_APPROVED:
           break;
      case CASHLESS_POOL_REVALUE_DENIED:
           break;
      case CASHLESS_POOL_REVALUE_LIMIT_AMOUNT:
           break;
      case CASHLESS_POOL_USER_FILE:
           break;
      case CASHLESS_POOL_TIME_DATE_REQUEST:
           break;
      case CASHLESS_DATA_ENTRY:
           break;
    }
        
    
    return MDB_OK;
  }
    
  return  MDB_TIMEOUT;  
}
/***********************************************************************************
*       Descrição       :       Envia o comando solicitando um inicio de 
*                               transação
*       Parametros      :       (unsigned short int) valor
*                               (unsigned short int) código do produto
*       Retorno         :       (eMDB_reply) maior do que zero se 
***********************************************************************************/
eMDB_reply MDBCASHLESS_start_vend(unsigned short int valor,unsigned short int code){
  unsigned char buffer[6];
  unsigned char recebidos;                      
  
  buffer[0] = CASHLESS_VEND;
  buffer[1] = REQUEST_VEND;
  buffer[2] = (unsigned char)valor>>8;
  buffer[3] = valor;
  buffer[4] = (unsigned char)code>>8;
  buffer[5] = code;
  
  if(MDB_send_package(1,buffer,6,0,buffer,&recebidos)==MDB_OK){
    
    
    
    return MDB_OK;
  }
  
  return MDB_TIMEOUT;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
