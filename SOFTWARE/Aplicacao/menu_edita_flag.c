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
|       Arquivo            :  Menu_edita_flag.c
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
*       Funções locais
***********************************************************************************/


/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Ponto de entrada do menu de edição
*                               de inteiro
*       Parametro       :       (char*) titulo
*                               (char*) String de formação
*                               (unsigned int) valor inicial
*                               (unsigned int) valor mínimo
*                               (unsigned int) valor máximo
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



