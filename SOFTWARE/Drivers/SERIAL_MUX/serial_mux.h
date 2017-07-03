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
|       Arquivo            :  serial_mux.h
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  26/05/2017
|
|       Revis�es           :  0001
|
|
| __________________________________________________________________________________
*/

#ifndef _SERIAL_MUX_H_
#define _SERIAL_MUX_H_

typedef enum{
  SERIALMUX_RS232,
  SERIALMUX_DEX,
  SERIALMUX_USB
}eSERIALMUX;


void SERIALMUX_ini(void);
void SERIALMUX_seleciona(eSERIALMUX porta);








#endif//_SERIAL_MUX_H_