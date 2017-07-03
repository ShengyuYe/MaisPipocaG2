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
|       Arquivo            :  FM25C160B.h
|       Descri��o          :  Biblioteca para uso da mem�ria FM25C160B
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  23/06/2016
|
|       Revis�es           :  1.0.0.0
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