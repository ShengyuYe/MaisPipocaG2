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
|       Arquivo            :  menu_edita_inteiro.h
|       Descri��o          :  Tela para realizar a edi��o de n�meros inteiros
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  07/11/2016
|
|       Revis�es           :  1.0.0.0
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