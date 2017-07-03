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
|       Arquivo            :  supervisao_mdb_bill.h
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

#ifndef _SUPERVISAO_MDB_BILL_H_
#define _SUPERVISAO_MDB_BILL_H_


typedef enum{
  BILL_DESABILITADO,
  BILL_BLOQUEADO,
  BILL_RESET_AND_CHECK,
  BILL_INICIALIZA,
  BILL_SUPERVISAO,
  BILL_OFFLINE,
  BILL_FALHA
}eBILL_POLL_STATE;


void SMDBILL_set_bloqueio(unsigned char bloqueio);
void SMDBILL_tick(void);
unsigned char SMDBILL_get_contador_timeout(void);
unsigned char SMDBILL_get_net_status(void);

/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
#endif//_SUPERVISAO_MDB_BILL_H_
