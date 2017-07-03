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
|       Arquivo            :  menu_ajuste_relogio.c
|       Descrição          :  Menu
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  18/01/2017
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
#include "menu_ajuste_relogio.h"

/***********************************************************************************
*       Definições locais
***********************************************************************************/


/***********************************************************************************
*       Constantes
***********************************************************************************/


/***********************************************************************************
*       Variaveis - locais
***********************************************************************************/


/***********************************************************************************
*       Funções locais
***********************************************************************************/


/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Ponto de entrada do menu para configuração
*                               do RTC
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MARTC_entry(void){
  unsigned char hora;
  unsigned char minuto;
  unsigned char segundo;
  unsigned char dia;
  unsigned char mes;
  unsigned int ano;
  eTECLA tecla;
  unsigned int matriz_edicao[6];
  unsigned int limites_inf[6]={0,0,0,1,1,2017};
  unsigned int limites_sup[6]={23,59,59,31,12,2117};  
  unsigned int indice=0;
  char linha[17];
  const unsigned char posicoes[6]={4,7,10,2,5,8};
  
  RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
  if(hora>23) hora = 23;
  if(minuto>59) minuto = 59;
  if(segundo>59) segundo = 59;
  if(!dia || dia>31) dia = 1;
  if(!mes || mes>12) mes = 1;
  if(ano<2017 || ano>2117) ano = 2017;
  
  matriz_edicao[0] = hora;
  matriz_edicao[1] = minuto;
  matriz_edicao[2] = segundo;
  matriz_edicao[3] = dia;
  matriz_edicao[4] = mes;
  matriz_edicao[5] = ano;
  
  HD44780_clearText();
  
  for(;TECLADO_getContadorInatividade();){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER: 
           indice++;
           if(indice>5){
             RTC_setValue(matriz_edicao[0],matriz_edicao[1],matriz_edicao[2],
                          matriz_edicao[3],matriz_edicao[4],matriz_edicao[5]);
           }
           else
             break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           if(matriz_edicao[indice]>=limites_sup[indice])
             matriz_edicao[indice] = limites_inf[indice];
           else
             matriz_edicao[indice]++;
           break;
      case TECLA_DEC:
            if(matriz_edicao[indice]<=limites_inf[indice])
              matriz_edicao[indice] = limites_sup[indice];
            else
              matriz_edicao[indice]--;
           break;
    }
    
    // Escreve a primeira linha no LCD
    sprintf(linha,"%02d:%02d:%02d",matriz_edicao[0],matriz_edicao[1],matriz_edicao[2]);
    HD44780_posicionaTexto(4,0);
    HD44780_writeString(linha);
    
    // Escreve a segunda linha no LCd
    sprintf(linha,"%02d/%02d/%04d",matriz_edicao[3],matriz_edicao[4],matriz_edicao[5]);
    HD44780_posicionaTexto(2,1);
    HD44780_writeString(linha);
    
    // Liga o cursor piscante
    HD44780_ligaCursorPiscante();    
    HD44780_posicionaTexto(posicoes[indice],indice/3);    
    vTaskDelay(150);
    HD44780_desligaCursorPiscante();    
  }     
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
