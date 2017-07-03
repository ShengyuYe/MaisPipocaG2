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
|       Arquivo            :  74595.c
|       Descrição          :  driver para o chip 74595
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  09/02/2015
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <nxp\iolpc1768.h>
#include <intrinsics.h>
#include "74595.h"
#include "..\..\includes.h"

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
#define LED_DATA                                (0x01)<<18
#define LED_CLOCK                               (0x01)<<28
#define LED_STROBE                              (0x01)<<27
#define SENSOR_PAPEL_PIN_ALIAS                  (0x01)<<30

#define LIMPA_SENSOR_PINO()                     FIO0CLR |= SENSOR_PAPEL_PIN_ALIAS
#define LEDS_PIN_INI()                          FIO0DIR |= LED_CLOCK | LED_STROBE; FIO1DIR |= LED_DATA

#define SET_LED_DATA(X)                         X?(FIO1SET|=LED_DATA):(FIO1CLR|=LED_DATA)
#define SET_LED_CLOCK(X)                        X?(FIO0SET|=LED_CLOCK):(FIO0CLR|=LED_CLOCK)
#define SET_LED_STROBE(X)                       X?(FIO0SET|=LED_STROBE):(FIO0CLR|=LED_STROBE)

#define BLOCO_NOP                               __no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();\
                                                __no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();\
                                                __no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();\
                                                __no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();__no_operation();                                                
                                                
/***********************************************************************************
*       Funções locais
***********************************************************************************/

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Inicialização da biblioteca para
*                               controle do 74595
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void LIB74595_ini(void){
     
  LEDS_PIN_INI();  
}
/***********************************************************************************
*       Descrição       :       Envia um byte para o 74595
*       Parametros      :       (unsigned char) byte
*       Retorno         :       nenhum
***********************************************************************************/
void LIB74595_enviaByte(unsigned char *dado){
  
  for(unsigned char j=0;j<2;j++){
    for(unsigned char i=0;i<8;i++){
      SET_LED_DATA(0);
      if(dado[j]&(0x01<<i))
        SET_LED_DATA(1);
      BLOCO_NOP;
  
      SET_LED_CLOCK(1);
      //vTaskDelay(1);
      BLOCO_NOP;
      
      SET_LED_CLOCK(0);
      //vTaskDelay(1);//
      BLOCO_NOP;
    }
  }
  
  SET_LED_STROBE(1);
  //vTaskDelay(1);//
  BLOCO_NOP;
  SET_LED_STROBE(0);  
  //vTaskDelay(1);//
  BLOCO_NOP;    
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
