/*__________________________________________________________________________________
|	Quark Tecnologia Eletrônica Ltda.
|       
|       Itapema - SC
|       www.quarktee.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Quark and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Quark
|       or its distributors.
|
|       Este código é propriedade da Quark e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Quark ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Produto            :  Tela para o usuário realizar o ajuste do rtc
|                             
|       Arquivo            :  InterfaceAjusteRelogio.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  19/06/2014
|
|       Revisões           :  1.0 - primeira versão
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
#include "InterfaceAJusteRelogio.h"
#include "..\includes.h"

/***********************************************************************************
*       Definições locais
***********************************************************************************/

/***********************************************************************************
*       Constantes locais
***********************************************************************************/
const unsigned int limites[6][2]={  
  [0]=0,24,
  [1]=0,59,
  [2]=0,59,
  [3]=1,31,
  [4]=1,12,
  [5]=2014,2050
};


const char* tracos[]={
  [0] = "__",
  [1] = "__",
  [2] = "__",
  [3] = "__",
  [4] = "__",
  [5] = "____"
};

const char tamanhos[6]={
  3,
  3,
  3,
  3,
  3,
  6  
};

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Funções locais
***********************************************************************************/
void IAR_desenhaDados(char *linha1,char* linha2);

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Ponto de entrada da interface para ajuste
*                               do relógio
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void IAR_entry(void){
  eTECLA tecla;
  unsigned char hora,minuto,segundo,dia,mes;
  unsigned int ano;
  unsigned int valores[6];
  unsigned char ponteiro=0;
  unsigned char refreshTime=1;
  unsigned char toogle=0x00;
  char strings[6][5];
  char bufferLinhas[2][17];
  
  RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
  
  if(hora>23)
    hora=23;
  if(minuto>59)
    minuto = 59;
  if(segundo>59)
    segundo = 59;
  if(!dia)
    dia = 1;
  if(dia>31)
    dia = 31;
  if(!mes)
    mes = 1;
  if(mes>12)
    mes = 12;
  if(ano<2014)
    ano = 2014;
  if(ano>2050)
    ano = 2050;
               
  valores[0] = hora;
  valores[1] = minuto;
  valores[2] = segundo;
  valores[3] = dia;
  valores[4] = mes;
  valores[5] = ano;
  
  
  HD44780_clearText();
    
  for(;TECLADO_getContadorInatividade();){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_INC:
           (valores[ponteiro]>=limites[ponteiro][1])?(valores[ponteiro]=limites[ponteiro][0]):(valores[ponteiro]++);
           break;
      case TECLA_DEC:
           (valores[ponteiro]<=limites[ponteiro][0])?(valores[ponteiro]=limites[ponteiro][1]):(valores[ponteiro]--);
           break;
      case TECLA_ENTER:
           if(ponteiro<5)
             ponteiro++;
           else{
             hora = valores[0];
             minuto = valores[1];
             segundo = valores[2];
             dia = valores[3];
             mes = valores[4];
             ano = valores[5];
             RTC_setValue(hora,minuto,segundo,dia,mes,ano);
             return;
           }        
           break;
      case TECLA_ESC:
           return;
    }
    
    if(!--refreshTime){
      refreshTime = 2;
      toogle = ~toogle;
      
      sprintf(strings[0],"%02d",valores[0]);
      sprintf(strings[1],"%02d",valores[1]);
      sprintf(strings[2],"%02d",valores[2]);
      sprintf(strings[3],"%02d",valores[3]);
      sprintf(strings[4],"%02d",valores[4]);
      sprintf(strings[5],"%04d",valores[5]);
        
      if(toogle)
        memcpy(strings[ponteiro],tracos[ponteiro],tamanhos[ponteiro]);
        
      sprintf(bufferLinhas[0],"%s:%s:%s",strings[0],strings[1],strings[2]);
      sprintf(bufferLinhas[1],"%s/%s/%s",strings[3],strings[4],strings[5]);
        
      IAR_desenhaDados(bufferLinhas[0],bufferLinhas[1]);
    }
               
    vTaskDelay(50);
    
  }// Fim do for;; 
}
/***********************************************************************************
*       Descrição       :       Desenha os dados no LCD
*       Parametros      :       (char*) linha 1
*                               (char*) linha 2)
*       Retorno         :       nenhum
***********************************************************************************/
void IAR_desenhaDados(char *linha1,char* linha2){
  
  HD44780_posicionaTexto(4,0);
  HD44780_writeString((char*)linha1);
  HD44780_posicionaTexto(3,1);
  HD44780_writeString((char*)linha2);  
}
/***********************************************************************************
*       Descrição       :       Interface para o teste do RTC
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void IAR_testeRTC(void){
  eTECLA tecla;
  unsigned char hora,minuto,segundo,dia,mes;
  unsigned int ano;
  unsigned int valores[6];
  unsigned char ponteiro=0;
  unsigned char refreshTime=1;
  unsigned char toogle=0x00;
  char strings[6][5];
  char bufferLinhas[2][17];
  
  RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
  
  if(hora>23)
    hora=23;
  if(minuto>59)
    minuto = 59;
  if(segundo>59)
    segundo = 59;
  if(!dia)
    dia = 1;
  if(dia>31)
    dia = 31;
  if(!mes)
    mes = 1;
  if(mes>12)
    mes = 12;
  if(ano<2014)
    ano = 2014;
  if(ano>2050)
    ano = 2050;
               
  valores[0] = hora;
  valores[1] = minuto;
  valores[2] = segundo;
  valores[3] = dia;
  valores[4] = mes;
  valores[5] = ano;
  
  
  HD44780_clearText();
    
  for(;TECLADO_getContadorInatividade();){
    
    tecla = TECLADO_getch();
    switch(tecla){      
      case TECLA_ESC:
        return;
    }
    
    RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
    valores[0] = hora;
    valores[1] = minuto;
    valores[2] = segundo;
    valores[3] = dia;
    valores[4] = mes;
    valores[5] = ano;    
    
    if(!--refreshTime){
      refreshTime = 2;
      toogle = ~toogle;
      
      sprintf(strings[0],"%02d",valores[0]);
      sprintf(strings[1],"%02d",valores[1]);
      sprintf(strings[2],"%02d",valores[2]);
      sprintf(strings[3],"%02d",valores[3]);
      sprintf(strings[4],"%02d",valores[4]);
      sprintf(strings[5],"%04d",valores[5]);
        
      if(toogle)
        memcpy(strings[ponteiro],tracos[ponteiro],tamanhos[ponteiro]);
        
      sprintf(bufferLinhas[0],"%s:%s:%s",strings[0],strings[1],strings[2]);
      sprintf(bufferLinhas[1],"%s/%s/%s",strings[3],strings[4],strings[5]);
        
      IAR_desenhaDados(bufferLinhas[0],bufferLinhas[1]);
    }
               
    vTaskDelay(50);
    
  }// Fim do for;; 
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
