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
|       Arquivo            :  menu_edita_inteiro.h
|       Descrição          :  Tela para realizar a edição de números inteiros
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  07/11/2016
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _MENU_EDITA_INTEIRO_H_
#define _MENU_EDITA_INTEIRO_H_


unsigned int MEI_entry(char *titulo,char* strFmt,unsigned int inicial,
                       unsigned int minimo,unsigned int maximo);

unsigned int MEI_entry_inc(char *titulo,char* strFmt,unsigned int inicial,
                           unsigned int minimo,unsigned int maximo,unsigned int incremento);

#endif//_MENU_EDITA_INTEIRO_H_