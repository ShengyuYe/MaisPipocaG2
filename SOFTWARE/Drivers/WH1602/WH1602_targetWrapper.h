/*__________________________________________________________________________________
|	Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Blumenau - SC
|       www.chavedigital.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Chave Digital and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Chave Digital
|       or its distributors.
|
|       Este código é propriedade da Chave Digital e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Chave Digital ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  HD44780_targetWrapper.H
|       Data criação       :  06/05/2010
|       Revisões		       :  1.0 - Inicial
|
| __________________________________________________________________________________
*/
#ifndef _HD44780_TARGET_WRAPPER_H_
#define	_HD44780_TARGET_WRAPPER_H_

#include <nxp\iolpc1768.h>
#include "..\..\includes.h"

#define LCD_D4_DIR            (0x01)<<4 // P1
#define LCD_D5_DIR            (0x01)<<1 // P1
#define LCD_D6_DIR            (0x01)<<5 // P0
#define LCD_D7_DIR            (0x01)<<4 // P0

#define LCD_RS_DIR            (0x01)<<25// P0
#define LCD_ENABLE_DIR        (0x01)<<17// P1


#define INIT_DIR_PINS         { FIO1DIR |= LCD_D4_DIR;\
                                FIO1DIR |= LCD_D5_DIR;\
                                FIO0DIR |= LCD_D6_DIR;\
                                FIO0DIR |= LCD_D7_DIR;\
                                FIO0DIR |= LCD_RS_DIR;\
                                FIO0DIR |= LCD_RS_DIR;\
                                FIO1DIR |= LCD_ENABLE_DIR;}

#define LCD_WRITE_NIBBLE(X)   { (X & 0x01)?(FIO1SET |= LCD_D4_DIR):(FIO1CLR |= LCD_D4_DIR);\
                                (X & 0x02)?(FIO1SET |= LCD_D5_DIR):(FIO1CLR |= LCD_D5_DIR);\
                                (X & 0x04)?(FIO0SET |= LCD_D6_DIR):(FIO0CLR |= LCD_D6_DIR);\
                                (X & 0x08)?(FIO0SET |= LCD_D7_DIR):(FIO0CLR |= LCD_D7_DIR);}
                                
#define SET_LCD_RS          FIO0SET |= LCD_RS_DIR
#define CLR_LCD_RS          FIO0CLR |= LCD_RS_DIR

#define SET_LCD_ENABLE      FIO1SET |= LCD_ENABLE_DIR
#define CLR_LCD_ENABLE      FIO1CLR |= LCD_ENABLE_DIR
                                  
/***********************************************************************************
*		Fim do arquivo
***********************************************************************************/
#endif // _HD44780_TARGET_WRAPPER_H_