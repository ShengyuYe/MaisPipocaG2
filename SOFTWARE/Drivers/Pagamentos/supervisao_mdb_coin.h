/*__________________________________________________________________________________
|	Dextro Soluções Tecnológicas
|       
|       Balneário Camboriú - SC
|       www.dextro-st.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Dextro  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Quark 
|       or its distributors.
|
|       Este código é propriedade da Dextro  e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Dextro ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  supervisao_mdb_coin.h
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

#ifndef _SUPERVISAO_COIN_H_
#define _SUPERVISAO_COIN_H_



void SMDBCOIN_set_flag_bloqueio(unsigned char flag);

void SMDBCOIN_tick(void);

unsigned char SMDBCOIN_verifica_net_status(void);

/************************************************************************************
*       Fim do arquivo
************************************************************************************/
#endif//_SUPERVISAO_COIN_H_