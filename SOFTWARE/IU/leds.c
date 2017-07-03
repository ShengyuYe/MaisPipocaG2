/*__________________________________________________________________________________
|	Quark Tecnologia Eletrônica Embarcada
|       
|       Itapema - SC
|       www.quarktee.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Quark  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Quark 
|       or its distributors.
|
|       Este código é propriedade da Quark  e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Quark  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  leds.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  24/02/2017
|
|       Revisões           :  0001
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

/***********************************************************************************
*       Definições locais
***********************************************************************************/
#define LED_DATA_PIN                            (0x01)<<20
#define LED_CLOCK_PIN                           (0x01)<<22
#define LED_STROBE_PIN                          (0x01)<<21

#define INI_LED_PINS()                          FIO1DIR|=LED_DATA_PIN|LED_CLOCK_PIN|LED_STROBE_PIN

#define SET_LED_DATA(X)                         X?(FIO1SET|=LED_DATA_PIN ): (FIO1CLR|=LED_DATA_PIN)
#define SET_CLOCK(X)                            X?(FIO1SET|=LED_CLOCK_PIN): (FIO1CLR|=LED_CLOCK_PIN)
#define SET_STROBE(X)                           X?(FIO1SET|=LED_STROBE_PIN):(FIO1CLR|=LED_STROBE_PIN)

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned char LEDS_espelho_leds={0};
//unsigned int LEDS_temp=0;

/***********************************************************************************
*       Funções locais
***********************************************************************************/
void LEDS_envia_bitstream(unsigned char valor);

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Inicialização do módulo de controle
*                               dos leds
*       Parametros      :       nenhum
*       Retorno         :       nenhu
***********************************************************************************/
void LEDS_ini(void){
  
  INI_LED_PINS();
}
/***********************************************************************************
*       Descrição       :       Função principal da thread de controle dos
*                               leds
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void LEDS_main(void*pPar){
  
  for(;;){
    
    LEDS_envia_bitstream(LEDS_espelho_leds);
    vTaskDelay(100);
  }  
}
/***********************************************************************************
*       Descrição       :       Envia o dado dos leds para o registrador
*                               de deslocamento
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void LEDS_envia_bitstream(unsigned char valor){
  
  for(unsigned char i=0;i<8;i++){
    
    SET_CLOCK(1);
    
    SET_LED_DATA(0);
    if(valor&(0x01<<i))
      SET_LED_DATA(1);
    
    SET_CLOCK(0);    
  }
  
  SET_STROBE(1);
  vTaskDelay(1);
  SET_STROBE(0);  
}
/***********************************************************************************
*       Descrição       :       Setter para os leds
*       Parametros      :       (unsigned char) led
*                               (unsigned char) estado
*       Retorno         :       nenhum
***********************************************************************************/
void LEDS_setter_led(unsigned char led,unsigned char estado){
  
  if(estado)
    LEDS_espelho_leds |=  (0x01)<<led;
  else
    LEDS_espelho_leds &= ~((0x01)<<led);
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/