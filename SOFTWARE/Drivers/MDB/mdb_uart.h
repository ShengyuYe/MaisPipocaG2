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
|       Arquivo            :  mdb_uart.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  25/02/2017
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _MDB_UART_H_
#define _MDB_UART_H_

#define ENDEREO_TERMINADOR                              1
#define DADO_NORMAL                                     0




void MDBUART_ini(void);

void MDBUART_envia_pacote(unsigned char modo,unsigned char*pacote,
                          unsigned short int tamanho);

void MDBUART_le_pacote(unsigned char *pData,unsigned char tamanho);

unsigned char MDBUART_get_bytes_recebidos(void);

unsigned char MDBUART_has_new_package(void);

void MDBAURT_sleep(unsigned short int cicles);









/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
#endif//_MDB_UART_H_