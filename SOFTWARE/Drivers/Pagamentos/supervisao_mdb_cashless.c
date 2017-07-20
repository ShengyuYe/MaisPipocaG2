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
|       Arquivo            :  supervisao_mdb_cashless.c
|       Descri��o          :  M�quina de estados que gerencia o meio de pagamento
|                             MDB BILL
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  13/06/2017
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
#include "supervisao_mdb_cashless.h"

/***********************************************************************************
*       Defini��es
***********************************************************************************/
#define TEMPO_INICILIZACAO_CASHLESS                     60000
#define TENTATIVAS_CASHLESS                             10
#define TEMPO_BUSCA_OFFLINE                             30000

/***********************************************************************************
*       Constantes locais
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned int SMC_contador;
unsigned char SMC_ciclos;
eCASHLESS_state SMC_estado_atual = CASHLESS_STATE_DESABILITADO;
unsigned short int SMC_time_out=TEMPO_BUSCA_OFFLINE;
unsigned char SMC_flag_bloqueio=1;

/***********************************************************************************
*       Fun��es locais
***********************************************************************************/
eCASHLESS_state SMC_desabilitado(void);
eCASHLESS_state SMC_setup(void);
eCASHLESS_state SMC_offline_state(void);
eCASHLESS_state SMC_poll_interface(void);
eCASHLESS_state SMC_dispositivo_bloqueado(void);
eCASHLESS_state SMC_inicia_transacao(void);
eCASHLESS_state SMC_transacao_aprovada(void);
eCASHLESS_state SMC_sucesso_transacao(void);

/***********************************************************************************
*       Tabela de fun��es
***********************************************************************************/
eCASHLESS_state(*const MDBCASHLESS_funcs[])(void)={
  [CASHLESS_STATE_DESABILITADO]    = SMC_desabilitado,
  [CASHLESS_STATE_SETUP]           = SMC_setup,
  [CASHLESS_STATE_OFFLINE]         = SMC_offline_state,
  [CASHLESS_STATE_POLL]            = SMC_poll_interface,
  [CASHLESS_STATE_LOCKED]          = SMC_dispositivo_bloqueado,
  [CASHLESS_STATE_INIT_VEND]       = SMC_inicia_transacao,
  [CASHLESS_STATE_VEND_APPROVED]   = SMC_transacao_aprovada,
  [CASHLESS_STATE_VEND_SUCCESS]    = SMC_sucesso_transacao,
  [CASHLESS_STATE_SESSION_COMPLET] = NULL
};
  
/***********************************************************************************
*       Implementa��o das fun��es
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Inicializa��o do m�dulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void SMC_ini(void){
  
  
  
}
/***********************************************************************************
*       Descri��o       :       Tick da m�quina de estados de supervis�o
*                               do cashless MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void SMC_tick(void){

  SMC_estado_atual = MDBCASHLESS_funcs[SMC_estado_atual]();        
}
/***********************************************************************************
*       Descri��o       :       Estado onde o cashless est� desabilitado
*       Parametros      :       nenhum
*       Retorno         :       eCASHLESS_state
***********************************************************************************/
eCASHLESS_state SMC_desabilitado(void){
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_MDB_CASHLESS,(void*)&flag);  
  if(SMC_flag_bloqueio)
    return CASHLESS_STATE_LOCKED;
  
  if(flag)
    return CASHLESS_STATE_SETUP;      
  
  return CASHLESS_STATE_DESABILITADO;
}
/***********************************************************************************
*       Descri��o       :       Estado em que realiza a configura��o da
*                               interface de cart�o
*       Parametros      :       nenhum
*       Retorno         :       eCASHLESS_state
***********************************************************************************/
eCASHLESS_state SMC_setup(void){  
  unsigned char nivel_configurado;
  unsigned short int pais;
  unsigned char escala;
  unsigned char casas_decimais;
  unsigned char tempo_maximo_transacao;
  unsigned char opcoes_gerais;
  
  CASHLESS_reset_device();
  vTaskDelay(20);
  
  if(CASHLESS_set_and_get_setup_from_to_device(1,2,16,ASCII,&nivel_configurado,&pais,&escala,&casas_decimais,&tempo_maximo_transacao,&opcoes_gerais)==MDB_OK){
    vTaskDelay(50);
    if(CASHLESS_set_min_and_max_price_in_device(1,100)==MDB_OK){
      vTaskDelay(50);
      if(MDBCASHLESS_enable_reader(1)==MDB_OK){
        vTaskDelay(50);
        SMC_time_out=TEMPO_BUSCA_OFFLINE;     
        return CASHLESS_STATE_POLL;           
      }
    }
  }
  else
    if(!SMC_time_out)
      return CASHLESS_STATE_OFFLINE;    
  
  return CASHLESS_STATE_SETUP;  
}
/***********************************************************************************
*       Descri��o       :       Estado em que a interface est� offline
*       Parametros      :       nenhum
*       Retorno         :       eCASHLESS_state
***********************************************************************************/
eCASHLESS_state SMC_offline_state(void){

  if(CASHLESS_adreess()==MDB_OK)
    return CASHLESS_STATE_DESABILITADO;
     
  return CASHLESS_STATE_OFFLINE;
}
/***********************************************************************************
*       Descri��o       :       Estado em que � realizado o poll do
*                               dispositivo
*       Parametros      :       nenhum
*       Retorno         :       eCASHLESS_state
***********************************************************************************/
eCASHLESS_state SMC_poll_interface(void){
  eMDB_POLL_HEADER header;
  unsigned char args[4];
  eCASHLESS_VEND_RESULT resultado;
  unsigned short int pago;
  
  if(CASHLESS_poll_device(&header,args)==MDB_OK){
    
    switch(header){
      case CASHLESS_POOL_DISPLAY_REQUEST:
           break;
      case CASHLESS_POOL_BEGIN_SESSION:
           {
             unsigned int valorPipoca;
             PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
             if(MDBCASHLESS_start_vend(&resultado,&pago,valorPipoca,1)==MDB_OK){
                      
             }
           }
           break;
      case CASHLESS_POOL_SESSION_CANCEL_REQUEST:
            MDBCASHLESS_session_complete();
           break;
      case CASHLESS_POOL_VEND_APPROVED: 
           if(MDBCASHLESS_vend_success(1)==MDB_OK){
             unsigned int valorPipoca;
             PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
             PAGAMENTOS_adiciona_valores(valorPipoca);                            
             if(MDBCASHLESS_session_complete()==MDB_OK){
             }
           }
           break;
      case CASHLESS_POOL_VEND_DENIED:
           MDBCASHLESS_session_complete();
           break;
      case CASHLESS_POOL_END_SESSION:
           MDBCASHLESS_session_complete();
           break;
      case CASHLESS_POOL_CANCELLED:
           MDBCASHLESS_session_complete();
           break;
    }
    
    SMC_time_out=TEMPO_BUSCA_OFFLINE;    
  }
  
  return  CASHLESS_STATE_POLL;
}
/***********************************************************************************
*       Descri��o       :       Estado no qual o dispositivo est� bloqueado
*       Parametros      :       nenhum
*       Retorno         :       eCASHLESS_state
***********************************************************************************/
eCASHLESS_state SMC_dispositivo_bloqueado(void){

  if(!SMC_flag_bloqueio)
    return CASHLESS_STATE_DESABILITADO;
  
  if(MDBCASHLESS_enable_reader(0)==MDB_OK){
    SMC_time_out=TEMPO_BUSCA_OFFLINE;     
    return CASHLESS_STATE_LOCKED;  
  }
  else
    if(!SMC_time_out)
      return CASHLESS_STATE_OFFLINE;
        
  return  CASHLESS_STATE_LOCKED;
}
/***********************************************************************************
*       Descri��o       :       Estado em que � iniciada a transa��o
*                               de venda
*       Parametros      :       nenhum
*       Retorno         :       eCASHLESS_state
***********************************************************************************/
eCASHLESS_state SMC_inicia_transacao(void){

  
  return CASHLESS_STATE_INIT_VEND;
}
/***********************************************************************************
*       Descri��o       :       Estado no qual a venda foi aprovada
*       Parametros      :       nenhum
*       Retorno         :       eCASHLESS_state
***********************************************************************************/
eCASHLESS_state SMC_transacao_aprovada(void){

   
  return CASHLESS_STATE_VEND_APPROVED;
}
/***********************************************************************************
*       Descri��o       :       Estado no qual recebeu a configura��o
*                               do cr�dit
*       Parametros      :       nenhum
*       Retorno         :       eCASHLESS_state 
***********************************************************************************/
eCASHLESS_state SMC_sucesso_transacao(void){
  
  
  return CASHLESS_STATE_VEND_SUCCESS;
}
/***********************************************************************************
*       Descri��o       :       Estado no qual a transa��o foi completada
*       Parametros      :       nenhum
*       Retorno         :       eCASHLESS_state
***********************************************************************************/
eCASHLESS_state SMC_transacao_completada(void){
  
  
  return CASHLESS_STATE_SESSION_COMPLET;
}
/***********************************************************************************
*       Descri��o       :       Setter para o flag de bloqueio do cashless
*                               device
*       Parametros      :       (unsigned char) flag
*       Retorno         :       nenhum
***********************************************************************************/
void SMC_setter_bloqueio(unsigned char flag){
  
  SMC_flag_bloqueio = flag;
}
/***********************************************************************************
*       Descri��o       :       Verifica se o dispositivo cashless est�
*       Parametros      :       (nenhum)
*       Retorno         :       (unsigned char) maior do que zero
*                                               se o cashless estiver online
***********************************************************************************/
unsigned char SMC_get_cashless_online(void){
  
  if(SMC_estado_atual!=CASHLESS_STATE_OFFLINE)
    return 1;
  
  return 0;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/