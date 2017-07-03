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
#define TEMPO_BUSCA_OFFLINE                             1000

/***********************************************************************************
*       Constantes locais
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned int SMC_contador;
unsigned char SMC_ciclos;
eCASHLESS_state SMC_estado_atual = CASHLESS_STATE_DESABILITADO;

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
  [CASHLESS_STATE_DESABILITADO]    = NULL,
  [CASHLESS_STATE_SETUP]           = NULL,
  [CASHLESS_STATE_OFFLINE]         = NULL,
  [CASHLESS_STATE_POLL]            = NULL,
  [CASHLESS_STATE_LOCKED]          = NULL,
  [CASHLESS_STATE_INIT_VEND]       = NULL,
  [CASHLESS_STATE_VEND_APPROVED]   = NULL,
  [CASHLESS_STATE_VEND_SUCCESS]    = NULL,
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
  /*
  unsigned char nivel_configurado;
  unsigned short int pais;
  unsigned char escala;
  unsigned char casas_decimais;
  unsigned char tempo_maximo_transacao;
  unsigned char opcoes_gerais;
  
  if(CASHLESS_set_and_get_setup_from_to_device(1,2,16,
                                               ASCII,
                                               &nivel_configurado,
                                               &pais,
                                               &escala,
  */
                                               
  /*
eMDB_reply CASHLESS_set_and_get_setup_from_to_device(unsigned char nivel_mdb,
                                                     unsigned char linhas_lcd,
                                                     unsigned char colunas_lcd,
                                                     eMDB_DISPLAY_INFO info_lcd,                                                     
                                                     unsigned char *nivel_configurado,
                                                     unsigned short int*pais,
                                                     unsigned char *escala,
                                                     unsigned char *casas_decimais,
                                                     unsigned char *tempo_maximo_transacao,
                                                     unsigned char *opcoes_gerais)  
  */
  return CASHLESS_STATE_SETUP;  
}
/***********************************************************************************
*       Descri��o       :       Estado em que a interface est� offline
*       Parametros      :       nenhum
*       Retorno         :       eCASHLESS_state
***********************************************************************************/
eCASHLESS_state SMC_offline_state(void){

  
  return CASHLESS_STATE_OFFLINE;
}
/***********************************************************************************
*       Descri��o       :       Estado em que � realizado o poll do
*                               dispositivo
*       Parametros      :       nenhum
*       Retorno         :       eCASHLESS_state
***********************************************************************************/
eCASHLESS_state SMC_poll_interface(void){

  
  return  CASHLESS_STATE_POLL;
}
/***********************************************************************************
*       Descri��o       :       Estado no qual o dispositivo est� bloqueado
*       Parametros      :       nenhum
*       Retorno         :       eCASHLESS_state
***********************************************************************************/
eCASHLESS_state SMC_dispositivo_bloqueado(void){

  
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
*                               do cr�dito
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
*       Fim do arquivo
***********************************************************************************/