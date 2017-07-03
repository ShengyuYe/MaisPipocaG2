/*__________________________________________________________________________________
|	DEXTRO SOLUÇÕES TECNOLÓGICAS
|       
|       ITAJAÍ - SC
|       www.dextro.ind.br
| __________________________________________________________________________________
|
|       This source code was developed by DEXTRO  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by DEXTRO 
|       or its distributors.
|
|       Este código é propriedade da DEXTRO  e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       DEXTRO  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  menu_rolagem.h
|       Descrição          :  implementa um menu de rolagem no 
|                             LCD de caracteres
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  07/11/2016
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _MENU_ROLAGEM_H_
#define _MENU_ROLAGEM_H_

void MENUROLAGEM_show(char* titulos,char** opcoes,unsigned short int tam_opcoes,
                      void(*funcs[])(void));



#endif//_MENU_ROLAGEM_H_