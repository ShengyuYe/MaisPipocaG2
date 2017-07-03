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
|       Arquivo            :  menu_rolagem.c
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

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "menu_rolagem.h"
#include "..\includes.h"

/***********************************************************************************
*       Defini��es locais
***********************************************************************************/

/***********************************************************************************
*       Constantes locais
***********************************************************************************/

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/

/***********************************************************************************
*       Fun��es locais
***********************************************************************************/


/***********************************************************************************
*       Implementa��o das fun��es
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Implementa��o do menu de rolagem
*       Parametros      :       (
*       Retorno         :       nenhum
***********************************************************************************/
void MENUROLAGEM_show(char* titulo,char** opcoes,unsigned short int tam_opcoes,
                      void(*funcs[])(void)){
  eTECLA tecla;
  unsigned short int indice=0;
  unsigned char tam = strlen(titulo);
  
  HD44780_clearText();
  HD44780_posicionaTexto((16-tam)>>1,0);
  HD44780_writeString(titulo);
  
  for(;TECLADO_getContadorInatividade();){
    
    HD44780_posicionaTexto((16-tam)>>1,0);
    HD44780_writeString(titulo);
    HD44780_posicionaTexto(0,1);
    HD44780_writeString(opcoes[indice]);
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           if(funcs[indice]!=NULL){
             funcs[indice]();
             HD44780_clearText();
           }
           else
             if(indice==(tam_opcoes-1))
               return;
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           indice = (indice+1) % tam_opcoes;
           break;
      case TECLA_DEC:
           if(indice)
             indice--;
           else
             indice = tam_opcoes-1;
           break;
    }
        
    vTaskDelay(50);
  }  
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
