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
|       Arquivo            :  Supervisao_MDB.h
|       Descrição          :  Biblioteca para controle dos meios de pagamento
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  28/02/2017
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _SUPERVISAO_MDB_H_
#define _SUPERVISAO_MDB_H_




void SMDB_ini(void);
void SMDB_tick(void);
void SMDB_wait(void);
void SMDB_release(void);
unsigned char SMDB_cashless_vend(unsigned short int valor,
                                 unsigned short int item);







/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
#endif//_SUPERVISAO_MDB_H_