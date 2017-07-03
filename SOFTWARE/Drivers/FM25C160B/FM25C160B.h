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
|       Arquivo            :  FM25C160B.h
|       Descrição          :  Biblioteca para uso da memória FM25C160B
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  23/06/2016
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/
 
#ifndef _FM25C160B_H_
#define _FM25C160B_H_


void FM25C_ini(void);
void FM25C_writeBlock(unsigned short int address,unsigned char *pData,unsigned char size);
void FM25C_readBlock(unsigned short int address,unsigned char *pData,unsigned char size);





/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
#endif//_FM25C160B_H_