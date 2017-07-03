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
|       Arquivo            :  menu_edita_listagem.c
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

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "menu_edita_listagem.h"
#include "..\includes.h"

/***********************************************************************************
*       Definições locais
***********************************************************************************/


/***********************************************************************************
*       Constantes locais
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Funções locais
***********************************************************************************/
void MEL_escreve_flag(char*label,unsigned char flag);

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       ponto de entrada para a tela de edição
*                               de listagem de flags
*       Parametros      :       (char**) labels dos flags
*                               (unsigned char*) flags
*                               (unsigned char) tamanho da listagem
*       Retorno         :       nenhum
***********************************************************************************/
void MEL_entry(char *titulo,char** labels,unsigned char *flags,unsigned char size){
  eTECLA tecla;
  unsigned char indice=0;
  unsigned char ultimoIndice=255;
  
  HD44780_clearText();
  unsigned char tam = strlen(titulo);
  HD44780_posicionaTexto((16-tam)>>1,0);
  HD44780_writeString(titulo);
  
  for(;TECLADO_getContadorInatividade();){
  
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           flags[indice]?(flags[indice]=0):(flags[indice]=255);
           ultimoIndice = 255;
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           indice = (indice+1) % size;
           break;
      case TECLA_DEC: 
           if(indice>0)
             indice--;
           else
             indice = size - 1;
           break;
    }
     
    if(ultimoIndice!=indice)
      MEL_escreve_flag((char*)labels[indice],flags[indice]);    
    
    ultimoIndice = indice;
    
    vTaskDelay(50); 
  }  
}
/***********************************************************************************
*       Descrição       :       Escreve o flag em uma linha
*       Parametros      :       (unsigned char*) label
*                               (unsigned char) flag
*       Retorno         :       nenhum
***********************************************************************************/
void MEL_escreve_flag(char*label,unsigned char flag){
  char linha[17];

  HD44780_posicionaTexto(0,1);
  HD44780_writeString("                ");  
  sprintf(linha,"[%c] %s",flag?'X':' ',label);
  HD44780_posicionaTexto(0,1);
  HD44780_writeString(linha); 
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
