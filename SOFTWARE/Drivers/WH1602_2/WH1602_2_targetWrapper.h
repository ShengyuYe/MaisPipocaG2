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

#define LCD2_D4_DIR            (0x01)<<8
#define LCD2_D5_DIR            (0x01)<<7
#define LCD2_D6_DIR            (0x01)<<6
#define LCD2_D7_DIR            (0x01)<<9

#define LCD2_RS_DIR            (0x01)<<5
#define LCD2_ENABLE_DIR        (0x01)<<4



#define INIT_2_DIR_PINS         { FIO2DIR |= LCD2_D4_DIR;\
                                  FIO2DIR |= LCD2_D5_DIR;\
                                  FIO2DIR |= LCD2_D6_DIR;\
                                  FIO2DIR |= LCD2_D7_DIR;\
                                  FIO2DIR |= LCD2_RS_DIR;\
                                  FIO2DIR |= LCD2_RS_DIR;\
                                  FIO2DIR |= LCD2_ENABLE_DIR;}

#define LCD_2_WRITE_NIBBLE(X)   { (X & 0x01)?(FIO2SET |= LCD2_D4_DIR):(FIO2CLR |= LCD2_D4_DIR);\
                                  (X & 0x02)?(FIO2SET |= LCD2_D5_DIR):(FIO2CLR |= LCD2_D5_DIR);\
                                  (X & 0x04)?(FIO2SET |= LCD2_D6_DIR):(FIO2CLR |= LCD2_D6_DIR);\
                                  (X & 0x08)?(FIO2SET |= LCD2_D7_DIR):(FIO2CLR |= LCD2_D7_DIR);}
                                
#define SET_LCD_2_RS              FIO2SET |= LCD2_RS_DIR
#define CLR_LCD_2_RS              FIO2CLR |= LCD2_RS_DIR

#define SET_LCD_2_ENABLE          FIO2SET |= LCD2_ENABLE_DIR
#define CLR_LCD_2_ENABLE          FIO2CLR |= LCD2_ENABLE_DIR
                                  
/***********************************************************************************
*		Fim do arquivo
***********************************************************************************/
#endif // _HD44780_TARGET_WRAPPER_H_