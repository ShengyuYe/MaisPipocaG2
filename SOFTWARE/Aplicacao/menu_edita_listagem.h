/*__________________________________________________________________________________
|	DEXTRO SOLU��ES TECNOL�GICAS
|       
|       ITAJA� - SC
|       www.dextro.ind.br
| __________________________________________________________________________________
|
|       This source code was developed by DEXTRO  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by DEXTRO 
|       or its distributors.
|
|       Este c�digo � propriedade da DEXTRO  e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       DEXTRO  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  menu_edita_listagem.h
|       Descri��o          :  Menu para edi��o de uma lista de flags
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  28/11/2016
|
|       Revis�es           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _MENU_EDITA_LISTAGEM_H_
#define _MENU_EDITA_LISTAGEM_H_


void MEL_entry(char *titulo,char** labels,unsigned char *flags,unsigned char size);
void MEL_escreve_flag(char*label,unsigned char flag);






/************************************************************************************
*       Fim do arquivo
************************************************************************************/
#endif//_MENU_EDITA_LISTAGEM_H_