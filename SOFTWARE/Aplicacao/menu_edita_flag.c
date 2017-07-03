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
|       Arquivo            :  Menu_edita_flag.c
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

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "..\includes.h"
#include "menu_edita_inteiro.h"

/***********************************************************************************
*       Constantes
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
*       Descri��o       :       Ponto de entrada do menu de edi��o
*                               de inteiro
*       Parametro       :       (char*) titulo
*                               (char*) String de forma��o
*                               (unsigned int) valor inicial
*                               (unsigned int) valor m�nimo
*                               (unsigned int) valor m�ximo
*       Retorno         :       (unsigned int) valor editado
***********************************************************************************/
unsigned char MEF_entry(char *titulo,unsigned char flag,char *onSTR,char*offSTR){
  eTECLA tecla;
  char linha[17];
  unsigned char tam;
  unsigned char ultimo_tam;
  
  tam = strlen(titulo);
  
  HD44780_clearText();
  HD44780_posicionaTexto((16-tam)>>1,0);
  HD44780_writeString(titulo);
  
  if(flag) 
    flag = 255;
  
  for(;TECLADO_getContadorInatividade();){
         
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
      case TECLA_ESC:
           return flag;
      case TECLA_INC:
      case TECLA_DEC:        
           flag^=0xFF;
           break;
    }
    
    sprintf(linha,"[%s]",flag?onSTR:offSTR);
    tam = strlen(linha);
    if(tam!=ultimo_tam){
      HD44780_posicionaTexto(0,1);  
      HD44780_writeString("                ");
    }
    HD44780_posicionaTexto((16-tam)>>1,1);
    HD44780_writeString(linha);
                        
    ultimo_tam = tam;
    vTaskDelay(50);
  }                        
                         
  return flag;                         
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/



