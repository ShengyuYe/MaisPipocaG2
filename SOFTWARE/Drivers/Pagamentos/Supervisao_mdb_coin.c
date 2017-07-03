/*__________________________________________________________________________________
|	Quark Tecnologia Eletr�nica Embarcada
|       
|       Itapema - SC
|       www.quarktee.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Quark  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Quark 
|       or its distributors.
|
|       Este c�digo � propriedade da Quark  e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Quark  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  supervisao_mdb_coin.c
|       Descri��o          :  M�quina de estados que gerencia o meio de pagamento
|                             MDB BILL
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  28/02/2017
|
|       Revis�es           :  1.0.0.0
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
*       Defini��es
***********************************************************************************/
#define RELOAD_COIN_TIMEOUT             30000

/***********************************************************************************
*       Enumera��es
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

/***********************************************************************************
*       Fun��es locais
***********************************************************************************/
eCOIN_SM_STATE SMDBCOIN_estado_desabilitado(eCOIN_SM_STATE estado);
eCOIN_SM_STATE SMDBCOIN_estado_reset(eCOIN_SM_STATE estado);
eCOIN_SM_STATE SMDBCOIN_estado_bloqueado(eCOIN_SM_STATE estado);
eCOIN_SM_STATE SMDBCOIN_estado_supervisao(eCOIN_SM_STATE estado);
eCOIN_SM_STATE SMDBCOIN_estado_offline(eCOIN_SM_STATE estado);

/***********************************************************************************
*       Tabela de fun��es
***********************************************************************************/
eCOIN_SM_STATE(*const SMDBCOIN_func_table[])(eCOIN_SM_STATE)={
  [COIN_DISABLED]    = SMDBCOIN_estado_desabilitado,
  [COIN_RESET_STATE] = SMDBCOIN_estado_reset,
  [COIN_LOCKED]      = SMDBCOIN_estado_bloqueado,
  [COIN_SUPERVISAO]  = SMDBCOIN_estado_supervisao,
  [COIN_OFFLINE]     = SMDBCOIN_estado_offline
};
/***********************************************************************************
*       Fun��es locais
***********************************************************************************/


/***********************************************************************************
*       Implementa��o das fun��es
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Setter para o flag bloqueio 
*       Parametros      :       (unsigned char) flag
*       Retorno         :       nenhum
***********************************************************************************/
void SMDBCOIN_set_flag_bloqueio(unsigned char flag){
  
  SMDBCOIN_flag_bloqueio = flag;
}
/***********************************************************************************
*       Descri��o       :       Fun��o principal da supervis�o
*                               do moedeiro
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void SMDBCOIN_tick(void){
  
  SMDBCOIN_estado_atual = SMDBCOIN_func_table[SMDBCOIN_estado_atual](SMDBCOIN_estado_atual);
}
/***********************************************************************************
*       Descri��o       :       Estado onde o moedeiro est�
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
*       Descri��o       :       Estado onde � realizado o reset do moedeiro
*       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
*       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
***********************************************************************************/
eCOIN_SM_STATE SMDBCOIN_estado_reset(eCOIN_SM_STATE estado){
  unsigned char tentativas=10;
  eMDB_reply flag;
  
  do flag = MDBCOIN_reset_device();   
  while(flag!=MDB_OK && tentativas--);
  
  if(flag==MDB_OK){
    tentativas = 10;
    do flag = MDBCOIN_coin_type_setup(0x0F,0x0F);
    while(flag!=MDB_OK && tentativas--);
    if(flag==MDB_OK){
      SMDBCOIN_contador_timeout = 10;
      return COIN_SUPERVISAO;       
    }
    else
      return COIN_OFFLINE;
    
  }  
  
  return estado;
}
/***********************************************************************************
*       Descri��o       :       Estado onde o moedeiro est� bloqueado
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
*       Descri��o       :       Estado onde realiza a supervis�o do moedeiro
*       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
*       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
***********************************************************************************/
eCOIN_SM_STATE SMDBCOIN_estado_supervisao(eCOIN_SM_STATE estado){
  unsigned char flag;
  eMDB_COIN_POOL_TYPE tipo_pacote;
  eMDB_COIN_POOL_STATUS status_pacote;
  unsigned char tipo_moeda;
  unsigned char quantidade_tubo;  
  const unsigned char valores[]={5,10,25,50,100};
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

  if(MDBCOIN_poll(&tipo_pacote,&status_pacote,&tipo_moeda,&quantidade_tubo)==MDB_OK){
    
    SMDBCOIN_contador_timeout = RELOAD_COIN_TIMEOUT;     
    if(tipo_pacote==COIN_DEPOSITED){
      //Aqui dentro � onde vem
      // o valor da moeda para somar ao pagamento
      unsigned short int valor = valores[tipo_moeda];
      PAGAMENTOS_adiciona_valores(valor);
      tipo_pacote = COIN_STATUS;
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
*       Descri��o       :       Estado em que o moedeiro est� offline
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
*       Descri��o       :       Verifica se h� conectivadade do moedeiro
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
