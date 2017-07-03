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
|       Arquivo            :  mdb_bill.c
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
#include "mdb.h"
#include "mdb_uart.h"
#include "mdb_bill.h"

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
*       Descrição       :       Verifica se o dispositivo está conectado
*                               ao barramento
*       Parametros      :       nenhum
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBILL_verifica_dispositivo(void){
  unsigned char buffer[2];
  unsigned char recebidos;
  
  buffer[0] = MDB_BILL_VALIDATOR;
  if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
        
    if(buffer[0]==MDB_RESP_ACK)
      return MDB_OK;
    
    return MDB_ERROR;
  }
    
  return  MDB_TIMEOUT; 
}
/***********************************************************************************
*       Descrição       :       Faz o reset do validador 
*       Parametros      :       nenhum
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBILL_reset_device(void){
  unsigned char buffer[2];
  unsigned char recebidos;
  
  buffer[0] = BILL_RESET;
  if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
        
    if(buffer[0]==MDB_RESP_ACK)
      return MDB_OK;
    
    return MDB_ERROR;
  }
    
  return  MDB_TIMEOUT; 
}
/***********************************************************************************
*       Descrição       :       Solicita as configurações ao noteiro
*       Parametros      :       (unsigned char*)level
*                               (unsigned short int) country
*                               (unsigned short int) bill scaling factor
*                               (unsigned char) casas decimais
*                               (unsigned short int) capacidade do stacker
*                               (unsigned short int) nível de segurança
*                               (unsigned char*) tipo crédito dos canais
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBILL_get_setup_from_device(unsigned char *level,
                                        unsigned short int *country,
                                        unsigned short int *scaling,
                                        unsigned char *decimal_places,
                                        unsigned short int *stacker_capacity,
                                        unsigned char *scroll_preset,
                                        unsigned short int *security_level,
                                        unsigned char *credit_types){
  unsigned char setup[36];
  unsigned char size;
  
  setup[0] = BILL_SETUP;
    
  if(MDB_send_package(1,setup,1,1,setup,&size)==MDB_OK){
    
    if(level!=NULL)
      *level = setup[Z1];
    
    if(country!=NULL)          
      *country = setup[Z2]<<8 | setup[Z3];
    
    if(country!=NULL)
      *scaling = setup[Z4]<<8 | setup[Z5];    
    
    if(decimal_places!=NULL)
      *decimal_places = setup[Z6];
    
    if(stacker_capacity!=NULL)
      *stacker_capacity = setup[Z7]<<8 | setup[Z8];
    
    if(security_level!=NULL)
      *security_level = setup[Z9]<<8 | setup[Z10];  
    
    if(scroll_preset!=NULL)
      *scroll_preset = setup[Z11];
    
    if(credit_types!=NULL)
      memcpy(credit_types,&setup[Z12],16);    
    
    return MDB_OK;
  }              
  
  return MDB_TIMEOUT;
}
/***********************************************************************************
*       Descrição       :      Lê a fila de eventos do validador
*       Parametros      :       (unsigned char*) eventos
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBILL_get_poll_from_device(sBILL_event *activity,unsigned char *length){
  unsigned char poll[16];
  unsigned char size;
  
  poll[0] = BILL_POLL;
  if(MDB_send_package(1,poll,1,1,poll,&size)==MDB_OK){
    
    *length = size;
    
    if(size>1){
      
      for(unsigned char i=0;i<size && size<16;i++){        
         activity->tipo =  (eBILL_ROUTING)(poll[0]>>4);
         activity->args =  (eBILL_TYPE)(poll[0]&0xF);
         if(activity->tipo!=BILL_STATUS)
           activity->args+= (eBILL_TYPE)CANAL_01;
         
         activity++;
      } 
      
      return MDB_OK;     
    }
    else{
      if(poll[0]==MDB_RESP_ACK)
        return MDB_OK;    
      else
        if(poll[0]==MDB_RESP_NAK)
          return MDB_ERROR;
    }
  }
    
  return MDB_TIMEOUT;   
}
/***********************************************************************************
*       Descrição       :       Habilita os tipos de notas que serão utilizados
*                               na aplicação
*       Parametros      :       (unsigned short int) canais
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBILL_set_bill_type_on_device(unsigned short int bill_types,
                                          unsigned short int scrolls){
  unsigned char bills[5];  
  unsigned char size;
   
  bills[0] = BILL_TYPE;
  bills[1] = bill_types>>8;
  bills[2] = bill_types;
  bills[3] = scrolls>>8;
  bills[4] = scrolls;
  
  if(MDB_send_package(1,bills,5,0,bills,&size)==MDB_OK){
    
    if(bills[0]==MDB_RESP_ACK)
      return MDB_OK;
    
    return MDB_ERROR;
  }
  
  return MDB_TIMEOUT; 
}
/***********************************************************************************
*       Descrição       :      Envia o comando para realizar o escrow da nota
*       Parametros      :      (eMDB_ESCROW_COMMANDS) comando para o escrow
*       Retorno         :      (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBILL_send_escrow_command(eMDB_ESCROW_COMMANDS cmd){
  unsigned char escrow[2];
  unsigned char size;

  escrow[0] = BILL_ESCROW;
  escrow[1] = (unsigned char)cmd;  
  
  if(MDB_send_package(1,escrow,2,1,escrow,&size)==MDB_OK){
    //MDBAURT_sleep(3000);
    
    if(escrow[0]==MDB_RESP_ACK)
      return MDB_OK;
    
    return MDB_ERROR;
  }
  
  return MDB_TIMEOUT; 
}
/***********************************************************************************
*       Descrição       :       Verifica se o stacker está cheio
*       Parametros      :       (eMDB_STACKER_STATE) estado do stacker
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBILL_get_stacker_state(eMDB_STACKER_STATE *stacker_state){
  unsigned char stacker[2];
  unsigned char size;

  stacker[0] = BILL_STACKER;
  
  if(MDB_send_package(1,stacker,2,1,stacker,&size)==MDB_OK){
    
    *stacker_state = (eMDB_STACKER_STATE)((stacker[0]&0x80)?STACK_BILL:RETURN_BILL);
    
    return MDB_OK;   
  }
  
  return MDB_TIMEOUT; 
}
/***********************************************************************************
*       Descrição       :       Verifica a identificação do equipamento
*       Parametros      :       (char*) fabricante
*                               (char*) numero de série
*                               (char*) modelo
*                               (char*) versao
*       Retorno         :       (eMDB_reply) resultado da operçaão
***********************************************************************************/
eMDB_reply MDBILL_get_identification_of_device(char *manufacturer,
                                               char *serial_number,
                                               char *model,
                                               char *firmware_version){
  unsigned char ext[36];
  unsigned char size;
  
  ext[0] = BILL_EXPANSION_COMMAND;
  ext[1] = 0x00;
  
  if(MDB_send_package(1,ext,2,1,ext,&size)==MDB_OK){
                                                 
    if(manufacturer!=NULL)
      memcpy(manufacturer,&ext[Z1],3);
    
    if(serial_number!=NULL)
      memcpy(serial_number,&ext[Z4],12);
    
    if(model!=NULL)
      memcpy(model,&ext[Z16],12);
    
    if(firmware_version!=NULL)
      memcpy(firmware_version,&ext[Z28],2);
    
    return MDB_OK;   
  }
  
  return MDB_TIMEOUT;
}
/***********************************************************************************
*       Descrição       :       Lê as opções extras disponóiveis
*       Parametros      :       (char*) fabricante
*                               (char*) serial number
*                               (char*) modelo
*                               (char*) versão do software
*                               (unsigned char*) funções opcionais
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBILL_get_id_with_option_bits(char *manufacturer,
                                          char *serial_number,
                                          char* model,
                                          char* firmware_version,
                                          unsigned char *optional_features){
  unsigned char ext[36];
  unsigned char size;
  
  ext[0] = BILL_EXPANSION_COMMAND;
  ext[1] = 0x02;
  
  if(MDB_send_package(1,ext,2,1,ext,&size)==MDB_OK){
                                                 
    if(manufacturer!=NULL)
      memcpy(manufacturer,&ext[Z1],3);
    
    if(serial_number!=NULL)
      memcpy(serial_number,&ext[Z4],12);
    
    if(model!=NULL)
      memcpy(model,&ext[Z16],12);
    
    if(firmware_version!=NULL)
      memcpy(firmware_version,&ext[Z28],2);
    
    if(optional_features!=NULL)
      memcpy(optional_features,&ext[Z30],4);
    
    return MDB_OK;   
  }
  
  return MDB_TIMEOUT;                                      
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
