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
|       Arquivo            :  supervisao_mdb_cashless.h
|       Descrição          :  Máquina de estados que gerencia o meio de pagamento
|                             MDB BILL
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  13/06/2017
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _SUPERVISAO_MDB_CASHLESS_H_
#define _SUPERVISAO_MDB_CASHLESS_H_



typedef enum{
  CASHLESS_STATE_DESABILITADO,
  CASHLESS_STATE_SETUP,
  CASHLESS_STATE_OFFLINE,
  CASHLESS_STATE_POLL,
  CASHLESS_STATE_LOCKED,
  CASHLESS_STATE_INIT_VEND,
  CASHLESS_STATE_VEND_APPROVED,
  CASHLESS_STATE_VEND_SUCCESS,
  CASHLESS_STATE_SESSION_COMPLET
}eCASHLESS_state;

void SMC_ini(void);
void SMC_tick(void);
void SMC_setter_bloqueio(unsigned char flag);












/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
#endif//_SUPERVISAO_MDB_CASHLESS_H_