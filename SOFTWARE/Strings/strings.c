/*__________________________________________________________________________________
|	Quark Tecnologia Eletr�nica Embarcada
|       
|       Itapema - SC
|       www.quarktee.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Quark  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Quark 
|       or its distributors.
|
|       Este c�digo � propriedade da Quark  e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Quark  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  strings.c
|       Descri��o          :  declara��o de todas as mensagens utilizadas
|                             no display
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  15/02/2017
|
|       Revis�es           :  001
|
|
| __________________________________________________________________________________
*/
#define _GLOBAL_STRING_
/***********************************************************************************
*       Includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "strings.h"
#include "..\includes.h"

/***********************************************************************************
*       Constantes
***********************************************************************************/



/***********************************************************************************
*       Implementa��o das fun��es
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Converte o enum idioma para a representa��o
*                               em string
*       Parametros      :       (eIDIOMA) idioma
*       Retorno         :       nenhum
***********************************************************************************/
char *STRING_idioma_to_string(eIDIOMA idioma){
  const char *nome_idiomas[]={
    "BRASIL",
    "URUGUAY",
    "ARGENTINA",
    "PARAGUAY",
    "PERU",
    "EUA",
    "CANADA"  
  };
  
  return (char*)nome_idiomas[idioma];
}
/***********************************************************************************
*       Descri��o       :       Escreve uma mensagem no LCD
*       Parametros      :       (char*) mensagem primeira linha
*                               (char*) mensagem da segunda linha
*       Retorno         :       nenhum
***********************************************************************************/
void STRING_write_to_internal(eCLEAR clear,char* l1,char* l2){
  unsigned short int tam;
  
  if(clear==CLEAR_DISPLAY)
    HD44780_clearText();
    
  if(l1!=NULL){
    tam = strlen(l1);    
    HD44780_posicionaTexto((16-tam)>>1,0);
    HD44780_writeString(l1);
  }
  
  if(l2!=NULL){
    tam = strlen(l2);
    HD44780_posicionaTexto((16-tam)>>1,1);
    HD44780_writeString(l2);
  }  
}
/***********************************************************************************
*       Descri��o       :       Escreve uma mensagem no LCD externo
*       Parametros      :       (char*) mensagem da primeira linha
*                               (char*) mensagem da segunda linha
*       Retorno         :       nenhum
***********************************************************************************/
void STRING_write_to_external(eCLEAR clear,char* l1,char* l2){
  unsigned short int tam;
  
  if(clear==CLEAR_DISPLAY)
    HD44780_2_clearText();
    
  if(l1!=NULL){
    tam = strlen(l1);    
    HD44780_2_posicionaTexto((16-tam)>>1,0);
    HD44780_2_writeString(l1);
  }
  
  if(l2!=NULL){
    tam = strlen(l2);
    HD44780_2_posicionaTexto((16-tam)>>1,1);
    HD44780_2_writeString(l2);
  }   
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
