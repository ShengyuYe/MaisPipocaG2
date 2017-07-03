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
|       Arquivo            :  leds.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  24/02/2017
|
|       Revisões           :  0001
|
|
| __________________________________________________________________________________
*/

#ifndef _LEDS_H_
#define _LEDS_H_


void LEDS_ini(void);
void LEDS_main(void*pPar);
void LEDS_setter_led(unsigned char led,unsigned char estado);










/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
#endif//_LEDS_H_