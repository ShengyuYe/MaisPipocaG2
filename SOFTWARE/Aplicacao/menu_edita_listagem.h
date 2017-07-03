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
|       Arquivo            :  menu_edita_listagem.h
|       Descrição          :  Menu para edição de uma lista de flags
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  28/11/2016
|
|       Revisões           :  1.0.0.0
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