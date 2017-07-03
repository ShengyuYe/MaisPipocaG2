/*__________________________________________________________________________________
|	    Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Balneário Camboriú - SC
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
|       Arquivo            :  WH1602.H
|       Data criação       :  19/06/2012
|       Revisões	   :  1.0.0.0
|
| __________________________________________________________________________________
*/

#ifndef _WH1602_2_H_
#define	_WH1602_2_H_

/*
#define LCD_CURSOR_LIGADO                 0x02
#define LCD_CURSOR_DESLIGADO              0x00
#define LCD_CURSOR_PISCANTE               0x01
#define LCD_CURSOR_FIXO                   0x00
#define LCD_DISPLAY_LIGADO                0x04
#define LCD_DISPLAY_DESLIGADO             0x00
#define LCD_DISPLAY_8X5                   0x00
#define LCD_DISPLAY_10X5                  0x04
#define LCD_2_LINHAS                      0x08
#define LCD_1_LINHA                       0x00
*/

#define HD44780_2_clearText()               HD44780_2_writeChar('\f')

void HD44780_2_init(unsigned char modo1,unsigned char modo2);
void HD44780_2_posicionaTexto(unsigned char x,unsigned char y);
void HD44780_2_writeChar(char c);
void HD44780_2_writeString(char *string);

void HD44780_2_ligaDisplay(void);
void HD44780_2_desligaDisplay(void);
void HD44780_2_ligaCursor(void);
void HD44780_2_desligaCursor(void);
void HD44780_2_ligaCursorPiscante(void);
void HD44780_2_desligaCursorPiscante(void);


/***********************************************************************************
*		Fim do arquivo
***********************************************************************************/
#endif // _WH1602_H_