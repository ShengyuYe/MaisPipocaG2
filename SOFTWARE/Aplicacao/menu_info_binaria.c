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
|       Arquivo            :  menu_info_binaria.c
|       Descri��o          :  m�dulo com o software de aplica��o da m�quina
|                             de guarda-chuvas
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
*       Descri��o       :       Exibe informa��es de uma fun��o
*                               bin�ria no LCD
*       Parametros      :       (char*) titulo
*                               unsigned char(*)(void)
*                               (char*) string para o valor ON
*                               (char*) string para o valor OFF
*       Retorno         :       nenhum
***********************************************************************************/
void MIB_show(char* titulo,unsigned char(*func)(void),char*strON,char*strOFF){
  eTECLA tecla;
  char linha[17];
  unsigned char tam;
  
  HD44780_clearText();
  HD44780_writeString(titulo);
  
  for(;TECLADO_getContadorInatividade();){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
      case TECLA_ESC:
           return;
    }
    
    if(func())
      sprintf(linha," [%s] ",strON);
    else
      sprintf(linha," [%s] ",strOFF);
    
    tam = strlen(linha);
    HD44780_posicionaTexto((16-tam)>>1,1);
    HD44780_writeString(linha);    
  }    
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/


