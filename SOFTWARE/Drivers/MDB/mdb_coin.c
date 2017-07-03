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
|       Arquivo            :  mdb_coin.c
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
#include "mdb_coin.h"

/***********************************************************************************
*       Definições locais
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
*       Descrição       :       Força o reset do moedeiro
*       Parametros      :       nenhum
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBCOIN_get_device(void){
  unsigned char buffer[2];
  unsigned char recebidos;
  
  buffer[0] = MDB_CHANGER;
  if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
        
    if(buffer[0]==MDB_RESP_ACK)
      return MDB_OK;
    
    return MDB_ERROR;
  }
    
  return  MDB_TIMEOUT; 
}
/***********************************************************************************
*       Descrição       :       Força o reset do moedeiro
*       Parametros      :       nenhum
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBCOIN_reset_device(void){
  unsigned char buffer[2];
  unsigned char recebidos;
  
  buffer[0] = COIN_RESET;
  if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
        
    if(buffer[0]==MDB_RESP_ACK)
      return MDB_OK;
    
    return MDB_ERROR;
  }
    
  return  MDB_TIMEOUT; 
}
/***********************************************************************************
*       Descrição       :       Verifica as configurações do moedeiro
*       Parametros      :       (unsigned char) nivel de implementação MDB
*                               (unsigned short int) código do pai
*                               (unsigned char) fator de escala
*                               (unsigned char) casas decimais
*                               (unsigned short int) direcionamento de moedas
*                               (unsigned short int) valor dos canais
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBCOIN_get_setup_from_device(unsigned char *mdb_message_leve,
                                         unsigned short int *country,
                                         unsigned char *scale_factor,
                                         unsigned char *decimal_places,
                                         unsigned short int *coin_type_routing,
                                         unsigned char *coin_credit){
  unsigned char setup[36];
  unsigned char size;
  
  setup[0] = COIN_SETUP;
    
  if(MDB_send_package(1,setup,1,1,setup,&size)==MDB_OK){
    
    if(mdb_message_leve!=NULL)
      *mdb_message_leve = setup[Z1];
     
    if(country!=NULL)
      *country = setup[Z2]<<8 | setup[Z3];
    
    if(scale_factor!=NULL)
      *scale_factor = setup[Z4];
    
    if(decimal_places!=NULL)
      *decimal_places = setup[Z5];
    
    if(coin_type_routing!=NULL)
      *coin_type_routing = setup[Z6]<<8 | setup[Z7];
    
    if(coin_credit!=NULL)
      memcpy(coin_credit,&setup[Z8],16);    
    
    return MDB_OK;
  }              
  
  return MDB_TIMEOUT;                                        
}
/***********************************************************************************
*       Descrição       :      getter para a quantidade de moedas dentro
*                              dos tubos
*       Parametros      :      (unsiged short int) flag que indica se há 
*                                                  moedas dentro dos tubos
*                              (unsigned char*) contagem com as moedas do 16 tubos
*       Retorno         :      (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBCOIN_get_tube_status_from_device(unsigned short int*tube_full_status,
                                               unsigned char *tubes_counter){
  unsigned char tubes[36];
  unsigned char size;
  
  tubes[0] = COIN_TUBE_STATUS;
    
  if(MDB_send_package(1,tubes,1,1,tubes,&size)==MDB_OK){
    
    if(tube_full_status!=NULL)
      *tube_full_status = tubes[Z1]<<8 | tubes[Z2];
    
    if(tubes_counter!=NULL)
      memcpy(tubes_counter,&tubes[Z3],16);
    
    return MDB_OK;
  }              
  
  return MDB_TIMEOUT;                                              
}
/***********************************************************************************
*       Descrição       :       Habilita os canais do moedeiro e a 
*                               liberação manual das moedas através 
*                               do teclado
*       Parametros      :       (unsigned short int) canais habilitados
*                               (unsigned short int) canais com permissão para
*                                                    dispenser manual
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBCOIN_coin_type_setup(unsigned short int channels,unsigned short int manual_dispense){
  unsigned char types[5];  
  unsigned char size;
  
  types[0] = COIN_TYPE;
  types[1] = (unsigned char)channels>>8;
  types[2] = (unsigned char)channels;
  types[3] = (unsigned char)manual_dispense>>8;
  types[4] = (unsigned char)manual_dispense;
  
  if(MDB_send_package_long(1,types,5,0,types,&size)==MDB_OK){
           
    return MDB_OK;
  }              
  
  return MDB_TIMEOUT;   
}
/***********************************************************************************
*       Descrição       :       Envia o comando para dispensar uma moeda
*                               para o cliente
*       Parametros      :       (unsigned char) moeda
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBCOIN_coin_dispense(unsigned char quantidade,unsigned char coin_code){
  unsigned char coin[2];
  unsigned char size;
  
  coin[0] = COIN_DISPENSE;
  coin[1] = ((quantidade&0x0F)<<4) | (coin_code&0x0F);
    
  if(MDB_send_package_long(1,coin,2,0,coin,&size)==MDB_OK){
           
    return MDB_OK;
  }              
  
  return MDB_TIMEOUT;  
}
/***********************************************************************************
*       Descrição       :       Solicita os eventos para o moedeiro
*       Parametros      :       (eMDB_COIN_POOL_TYPE*) tipo do evento
*                               (eMDB_COIN_POOL_STATUS*) status do evento
*                               (unsigned char*) tipo da moeda
*                               (unsigned char*) quantidade de moedas no tubo
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDBCOIN_poll(eMDB_COIN_POOL_TYPE *tipo_evento,
                        eMDB_COIN_POOL_STATUS *status,
                        unsigned char *tipo_moeda,unsigned char *quantidade_tubo){
  unsigned char poll[18];                          
  unsigned char size;                     
  
  poll[0] = COIN_POLL;  
                          
  if(MDB_send_package(1,poll,1,1,poll,&size)==MDB_OK){
    
    if(!size)
      return MDB_OK;
    
      if(size==2 || size==1){
      // Evento de moeda dispensada
      // pelo teclado do moedeiro
      if(poll[0]&0x80){
        *tipo_evento = COIN_DISPENSE_MANUALLY;
        *status = COIN_POSSIBLE_CREDIT_REMOVAL;
        *tipo_moeda = (poll[0]&0x70)>>4;
        *quantidade_tubo = poll[1];
      }
      else
        // Evento de crédito da moeda
        if(poll[0]&0x40){
          *tipo_evento = COIN_DEPOSITED;
          *status = (eMDB_COIN_POOL_STATUS)((poll[0]&0x03)>>4);
          *tipo_moeda = poll[0]&0x0F;
          *quantidade_tubo = poll[1];
        }      
        else{
          // Evento com alteração
          // no status do moedeiro
          *tipo_evento = COIN_STATUS;
          *status = (eMDB_COIN_POOL_STATUS)poll[0];
          *tipo_moeda = 0;
          *quantidade_tubo = 0;
        }              
      
      return MDB_OK;        
    }    
    
  }              
  
  return MDB_TIMEOUT;                            
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
