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
|       Arquivo            :  ControleTemperatura.c
|       Descri��o          :  Menu para configura��o do sistema
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  22/02/2017
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
#include <nxp\iolpc1768.h>
#include "..\includes.h"
#include "ControleTemperatura.h"

/***********************************************************************************
*       Defini��es
***********************************************************************************/
#define PULSO_RESISTENCIA_PIN           (0x01)<<2
#define INI_PULSO_RESISTENCIA()         FIO2DIR|=PULSO_RESISTENCIA_PIN
#define SET_PULSO_RESISTENCIA(X)        X?(FIO2SET|=PULSO_RESISTENCIA_PIN):(FIO2CLR|=PULSO_RESISTENCIA_PIN)

/***********************************************************************************
*       Constantes
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned char CT_preset_temperatura=0;

/***********************************************************************************
*       Fun��es locais
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Inicializa o m�dulo de controle da temperatura
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void CT_ini(void){
  
  INI_PULSO_RESISTENCIA();
}
/***********************************************************************************
*       Descri��o       :       Timer tick para controle da temperatura
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void CT_timer_tick(void){
  unsigned short int temperatura;
  
  if(CT_preset_temperatura){    
    temperatura = AA_calculaTemperatura();
    if(temperatura>CT_preset_temperatura)
      SET_PULSO_RESISTENCIA(0);
    else
      SET_PULSO_RESISTENCIA(1);
  }  
  else
    SET_PULSO_RESISTENCIA(0);
}
/***********************************************************************************
*       Descri��o       :       Setter para o preset da temperatura
*       Parametros      :       (unsigned short int) temperatura
*       Retorno         :       nenhum
***********************************************************************************/
void CT_set_temperatura(unsigned short int temperatura){
  
  CT_preset_temperatura = temperatura;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/