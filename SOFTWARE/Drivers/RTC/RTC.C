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
|       Arquivo            :  rtc.c
|       Descrição          :  Funções para manutenção do rtc do 
|                             LPC1768
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  28/07/2011
|
|       Revisões           :  1.0
|
|
| __________________________________________________________________________________
*/
/***********************************************************************************
*     Includes
***********************************************************************************/
#include <nxp\iolpc1768.h>
#include "..\..\includes.h"
#include "rtc.h"

/***********************************************************************************
*     Definições com constantes utilizadas no programa
***********************************************************************************/ 



/***********************************************************************************
*     Enumerações
***********************************************************************************/


/***********************************************************************************
*     Estruturas
***********************************************************************************/


/***********************************************************************************
*     Uniões
***********************************************************************************/


/***********************************************************************************
*     Constantes
***********************************************************************************/


/***********************************************************************************
*     Variaveis locais
***********************************************************************************/


/***********************************************************************************
*     Funções locais
***********************************************************************************/
 
/***********************************************************************************
*     Implementação
***********************************************************************************/

/***********************************************************************************
*     Descrição   :   Inicialização do módulo
*     Parametros  :   nenhum
*     Retorno     :   nenhum
***********************************************************************************/
void RTC_init(void){
  
  PCONP_bit.PCRTC = 1; // Habilita a alimentação do periférico    
  
  RTCCCR = 0x00;
  RTCCCR_bit.CLKEN = 1; // Clock habilitado
  
}
/***********************************************************************************
*    Descrição    :   Ajusta a hora, minuto e segundo do rtc
*    Parametros   :   (unsigned char) hora
*                     (unsigned char) minuto
*                     (unsigned char) segundos
*                     (unsigned char) dia
*                     (unsigned char) mes
*                     (unsigned int ) ano
*   Retorno       :   nenhum
***********************************************************************************/
void RTC_setValue(unsigned char hour,unsigned char minute,unsigned char second,
                  unsigned char day,unsigned char month,unsigned int year){
 
  RTCSEC = second;
  RTCMIN = minute;
  RTCHOUR = hour;
  RTCDOM = day;
  RTCMONTH = month;
  RTCYEAR = year;                                      
}
/***********************************************************************************
*    Descrição   :    Lê os valores de hora,minuto,segundo,dia,mes e ano do rtc
*    Parametros  :    (unsigned char*) hora
*                     (unsigned char*) minuto
*                     (unsigned char*) segundo
*                     (unsigned char*) dia
*                     (unsigned char*) mes
*                     (unsigned int*) ano
*   Retorno     :     nenhum
***********************************************************************************/
void RTC_getValue(unsigned char *hour,unsigned char *minute,unsigned char *second,
                  unsigned char *day,unsigned char *month,unsigned int *year){
                    
  *second = RTCSEC;
  *minute = RTCMIN;
  *hour = RTCHOUR;
  *day = RTCDOM;
  *month = RTCMONTH;
  *year = RTCYEAR;                    
}
/***********************************************************************************
*		Fim do arquivo
***********************************************************************************/