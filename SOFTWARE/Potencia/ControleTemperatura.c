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
|       Arquivo            :  ControleTemperatura.c
|       Descrição          :  Menu para configuração do sistema
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  22/02/2017
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
#include <nxp\iolpc1768.h>
#include "..\includes.h"
#include "ControleTemperatura.h"

/***********************************************************************************
*       Definições
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
*       Funções locais
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Inicializa o módulo de controle da temperatura
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void CT_ini(void){
  
  INI_PULSO_RESISTENCIA();
}
/***********************************************************************************
*       Descrição       :       Timer tick para controle da temperatura
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
*       Descrição       :       Setter para o preset da temperatura
*       Parametros      :       (unsigned short int) temperatura
*       Retorno         :       nenhum
***********************************************************************************/
void CT_set_temperatura(unsigned short int temperatura){
  
  CT_preset_temperatura = temperatura;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/