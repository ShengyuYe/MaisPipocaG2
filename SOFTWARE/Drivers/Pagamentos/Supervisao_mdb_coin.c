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
|       Arquivo            :  supervisao_mdb_coin.c
|       Descrição          :  Máquina de estados que gerencia o meio de pagamento
|                             MDB BILL
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  28/02/2017
|
|       Revisões           :  1.0.0.0
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
#include "..\..\includes.h"
#include "supervisao_mdb_coin.h"

/***********************************************************************************
*       Definições
***********************************************************************************/
#define RELOAD_COIN_TIMEOUT             30000
#define RELOAD_LOCK_COIN                250        
/***********************************************************************************
*       Enumerações
***********************************************************************************/
typedef enum{
  COIN_DISABLED=0,
  COIN_RESET_STATE,
  COIN_LOCKED,
  COIN_SUPERVISAO,
  COIN_OFFLINE
}eCOIN_SM_STATE;

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned char SMDBCOIN_flag_bloqueio=0;
eCOIN_SM_STATE SMDBCOIN_estado_atual;
unsigned short int SMDBCOIN_contador_timeout=0;
unsigned char SMDBCOIN_coin_credit[16]={0};
unsigned char SMDBCOIN_scale_factor=0x00;
unsigned char SMDBCOIN_decimal_places;
unsigned short int SMDBCOIN_lock_coin;

/***********************************************************************************
*       Funções locais
***********************************************************************************/
eCOIN_SM_STATE SMDBCOIN_estado_desabilitado(eCOIN_SM_STATE estado);
eCOIN_SM_STATE SMDBCOIN_estado_reset(eCOIN_SM_STATE estado);
eCOIN_SM_STATE SMDBCOIN_estado_bloqueado(eCOIN_SM_STATE estado);
eCOIN_SM_STATE SMDBCOIN_estado_supervisao(eCOIN_SM_STATE estado);
eCOIN_SM_STATE SMDBCOIN_estado_offline(eCOIN_SM_STATE estado);

/***********************************************************************************
*       Tabela de funções
***********************************************************************************/
eCOIN_SM_STATE(*const SMDBCOIN_func_table[])(eCOIN_SM_STATE)={
  [COIN_DISABLED]    = SMDBCOIN_estado_desabilitado,
  [COIN_RESET_STATE] = SMDBCOIN_estado_reset,
  [COIN_LOCKED]      = SMDBCOIN_estado_bloqueado,
  [COIN_SUPERVISAO]  = SMDBCOIN_estado_supervisao,
  [COIN_OFFLINE]     = SMDBCOIN_estado_offline
};
/***********************************************************************************
*       Funções locais
***********************************************************************************/


/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Setter para o flag bloqueio 
*       Parametros      :       (unsigned char) flag
*       Retorno         :       nenhum
***********************************************************************************/
void SMDBCOIN_set_flag_bloqueio(unsigned char flag){
  
  SMDBCOIN_flag_bloqueio = flag;
}
/***********************************************************************************
*       Descrição       :       Função principal da supervisão
*                               do moedeiro
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void SMDBCOIN_tick(void){
  
  SMDBCOIN_estado_atual = SMDBCOIN_func_table[SMDBCOIN_estado_atual](SMDBCOIN_estado_atual);
}
/***********************************************************************************
*       Descrição       :       Estado onde o moedeiro está
*                               desabilitado
*       Parametros      :       (eCOIN_SM_STATE) estado atual
*                                                       do moedeiro
*       Retorno         :       (eCOIN_SM_STATE) novo estado
***********************************************************************************/
eCOIN_SM_STATE SMDBCOIN_estado_desabilitado(eCOIN_SM_STATE estado){
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);
  
  if(flag)
    return COIN_LOCKED;
  
  return estado;
}
/***********************************************************************************
*       Descrição       :       Estado onde é realizado o reset do moedeiro
*       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
*       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
***********************************************************************************/
eCOIN_SM_STATE SMDBCOIN_estado_reset(eCOIN_SM_STATE estado){
  unsigned char tentativas=10;
  eMDB_reply flag;
  unsigned char mdb_message_leve;
  unsigned short int country;
  unsigned short int coin_type_routing;
  unsigned short int cfg_moedas;
  
  PARAMETROS_le(ADR_TIPOS_MOEDAS,(void*)&cfg_moedas);  

  
  do flag = MDBCOIN_reset_device();   
  while(flag!=MDB_OK && tentativas--);
  
  if(flag==MDB_OK){
    
    tentativas = 10;
    do flag = MDBCOIN_get_setup_from_device(&mdb_message_leve,&country,&SMDBCOIN_scale_factor,
                                            &SMDBCOIN_decimal_places,&coin_type_routing,SMDBCOIN_coin_credit);
    while(flag!=MDB_OK && --tentativas);
    
    if(flag==MDB_OK){      
      
      
      
      tentativas = 10;
      do flag = MDBCOIN_coin_type_setup(cfg_moedas,cfg_moedas);
      while(flag!=MDB_OK && tentativas--);
      if(flag==MDB_OK){
        SMDBCOIN_contador_timeout = 10;
        return COIN_SUPERVISAO;       
      }
      else
        return COIN_OFFLINE;
    }
    else
      return COIN_OFFLINE;
    
  }  
  
  return estado;
}
/***********************************************************************************
*       Descrição       :       Estado onde o moedeiro está bloqueado
*       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
*       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
***********************************************************************************/
eCOIN_SM_STATE SMDBCOIN_estado_bloqueado(eCOIN_SM_STATE estado){  
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);
  
  if(!flag)
    return COIN_DISABLED;
  
  unsigned char tentativas=5;
  eMDB_reply ack;
  
  do ack = MDBCOIN_get_device();
  while(ack!=MDB_OK && tentativas--);
  
  if(ack==MDB_OK){
    if(!SMDBCOIN_flag_bloqueio)
      return COIN_RESET_STATE;         
    SMDBCOIN_contador_timeout = RELOAD_COIN_TIMEOUT;      
  }
  else{
    if(SMDBCOIN_contador_timeout)
      SMDBCOIN_contador_timeout--;
    else
      return COIN_OFFLINE;
  }
  
  return estado;
}
/***********************************************************************************
*       Descrição       :       Estado onde realiza a supervisão do moedeiro
*       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
*       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
***********************************************************************************/
eCOIN_SM_STATE SMDBCOIN_estado_supervisao(eCOIN_SM_STATE estado){
  unsigned char flag;
  eMDB_COIN_POOL_TYPE tipo_pacote;
  eMDB_COIN_POOL_STATUS status_pacote;
  unsigned char tipo_moeda;
  unsigned char quantidade_tubo;  
  eMDB_reply ack;
  unsigned char tentativas=10;
  
  PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);    
  if(!flag)
    return COIN_DISABLED;
  if(SMDBCOIN_flag_bloqueio){
    
    do ack = MDBCOIN_reset_device();   
    while(ack!=MDB_OK && tentativas--);
    
    if(ack==MDB_OK)
      return COIN_LOCKED;
    else
      return COIN_OFFLINE;
  }

  if(!SMDBCOIN_lock_coin && MDBCOIN_poll(&tipo_pacote,&status_pacote,&tipo_moeda,&quantidade_tubo)==MDB_OK){
    
    SMDBCOIN_lock_coin=RELOAD_LOCK_COIN;
    
    SMDBCOIN_contador_timeout = RELOAD_COIN_TIMEOUT;     
    if(tipo_pacote!=COIN_ACK){
       if(tipo_pacote==COIN_DEPOSITED){
        //Aqui dentro é onde vem
        // o valor da moeda para somar ao pagamento
        unsigned short int valor = SMDBCOIN_coin_credit[tipo_moeda]*SMDBCOIN_scale_factor;
        PAGAMENTOS_adiciona_valores(valor);
        tipo_pacote = COIN_STATUS;
      }
    }
  }
  else{
    if(SMDBCOIN_contador_timeout)
      SMDBCOIN_contador_timeout--;
    else
      return COIN_OFFLINE;
  }
  
  return estado;
}
/***********************************************************************************
*       Descrição       :       Estado em que o moedeiro está offline
*       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
*       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
***********************************************************************************/
eCOIN_SM_STATE SMDBCOIN_estado_offline(eCOIN_SM_STATE estado){
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);
  
  if(!flag)
    return COIN_DISABLED;
  
  if(MDBCOIN_get_device()==MDB_OK)
    return COIN_DISABLED;
      
  return estado;
}
/***********************************************************************************
*       Descrição       :       Verifica se há conectivadade do moedeiro
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
unsigned char SMDBCOIN_verifica_net_status(void){
  
  if(SMDBCOIN_estado_atual != COIN_OFFLINE)
    return 1;
  
  return 0;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
