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
|       Arquivo            :  serial_mux.c
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  26/05/2017
|
|       Revis�es           :  0001
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
#include "serial_mux.h"
#include "..\..\includes.h"

/***********************************************************************************
*       Constantes
***********************************************************************************/


/***********************************************************************************
*       Defini��es do hardware
***********************************************************************************/
#define SINAL_MUX_A                     (0x01)<<27
#define SINAL_MUX_B                     (0x01)<<22

#define SET_SINAL_MUX_A(X)              X?(FIO1SET|=SINAL_MUX_A):(FIO1CLR|=SINAL_MUX_A)
#define SET_SINAL_MUX_B(X)              X?(FIO0SET|=SINAL_MUX_B):(FIO1CLR|=SINAL_MUX_B)

#define SERIAL_MUX_INI_PINS()           FIO1DIR|=SINAL_MUX_A; FIO0DIR|=SINAL_MUX_B;

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Fun��e locais
***********************************************************************************/


/***********************************************************************************
*       Implementa��o das fun��es
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Inicializa��o do m�dulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void SERIALMUX_ini(void){
  
  SERIAL_MUX_INI_PINS();  
}
/***********************************************************************************
*       Descri��o       :       Seleciona a porta serial que ser� utilizada
*       Parametros      :       (eSERIALMUX) porta serial 
*       Retorno         :       nenhum
***********************************************************************************/
void SERIALMUX_seleciona(eSERIALMUX porta){
    
  switch(porta){
    case SERIALMUX_RS232:
         SET_SINAL_MUX_A(0);
         SET_SINAL_MUX_B(0);
         break;
    case SERIALMUX_DEX:
         SET_SINAL_MUX_A(1);
         SET_SINAL_MUX_B(0);      
         break;
    case SERIALMUX_USB:
         SET_SINAL_MUX_A(0);
         SET_SINAL_MUX_B(1);            
         break;
  }
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/