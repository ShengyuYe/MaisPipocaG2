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
|       Arquivo            :  menu_rolagem.h
|       Descri��o          :  implementa um menu de rolagem no 
|                             LCD de caracteres
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  07/11/2016
|
|       Revis�es           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _MENU_ROLAGEM_H_
#define _MENU_ROLAGEM_H_

void MENUROLAGEM_show(char* titulos,char** opcoes,unsigned short int tam_opcoes,
                      void(*funcs[])(void));



#endif//_MENU_ROLAGEM_H_