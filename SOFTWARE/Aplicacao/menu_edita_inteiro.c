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
|       Arquivo            :  menu_edita_inteiro.c
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
#include "menu_edita_inteiro.h"
#include "..\includes.h"

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
unsigned int MEI_entry(char *titulo,char* strFmt,unsigned int inicial,
                       unsigned int minimo,unsigned int maximo){
  eTECLA tecla;
  char linha[17];
  unsigned char tam;
  
  tam = strlen(titulo);
  
  HD44780_clearText();
  HD44780_posicionaTexto((16-tam)>>1,0);
  HD44780_writeString(titulo);
  
  for(;TECLADO_getContadorInatividade();){
         
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
      case TECLA_ESC:
           return inicial;
      case TECLA_INC:
           if(inicial<maximo)
             inicial++;
           break;
      case TECLA_DEC:
           if(inicial>minimo)
             inicial--;
           break;
    }
    
    sprintf(linha,strFmt,inicial);
    tam = strlen(linha);
    HD44780_posicionaTexto((16-tam)>>1,1);
    HD44780_writeString(linha);
    
    vTaskDelay(50);
  }                        
                         
  return inicial;                         
}
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
unsigned int MEI_entry_inc(char *titulo,char* strFmt,unsigned int inicial,
                           unsigned int minimo,unsigned int maximo,unsigned int incremento){
  eTECLA tecla;
  char linha[17];
  unsigned char tam;
  
  tam = strlen(titulo);
  
  HD44780_clearText();
  HD44780_posicionaTexto((16-tam)>>1,0);
  HD44780_writeString(titulo);
  
  for(;TECLADO_getContadorInatividade();){
         
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
      case TECLA_ESC:
           return inicial;
      case TECLA_INC:
           if(inicial<maximo)
             inicial+=incremento;
           break;
      case TECLA_DEC:
           if(inicial>minimo)
             inicial-=incremento;
           break;
    }
    
    sprintf(linha,strFmt,inicial);
    tam = strlen(linha);
    HD44780_posicionaTexto((16-tam)>>1,1);
    HD44780_writeString(linha);
    
    vTaskDelay(50);
  }                        
                         
  return inicial;                         
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/



