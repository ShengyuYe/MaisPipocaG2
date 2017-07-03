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
| _________________________________________________________________________________
|
|       Arquivo            :  WH1602.C
|       Descrição          :  Driver para o LCD wh1602 da winstar
| 
|       Autor              :  Marcos Aquino
|       Data criação       :
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*		Includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <intrinsics.h>
#include "WH1602_2_targetWrapper.h"
#include "WH1602_2.H"
/***********************************************************************************
*		Constantes
***********************************************************************************/
#define ENDERECO_SEGUNDA_LINHA              0xC0
#define DELAY_CICLES                        1100

#define HD44780_2_delay_ms(X)                 vTaskDelay(X)

#define BLOCO_SUPER_NOP                       __no_operation();__no_operation();__no_operation();__no_operation();\
                                              __no_operation();__no_operation();__no_operation();__no_operation();\
                                              __no_operation();__no_operation();__no_operation();__no_operation();\
                                              __no_operation();__no_operation();__no_operation();__no_operation();\
                                              __no_operation();__no_operation();__no_operation();__no_operation();\
                                              __no_operation();__no_operation();__no_operation();__no_operation();\
                                              __no_operation();__no_operation();__no_operation();__no_operation();\
                                              __no_operation();__no_operation();__no_operation();__no_operation();\
                                              __no_operation();__no_operation();__no_operation();__no_operation();\
                                              __no_operation();__no_operation();__no_operation();__no_operation();\
                                              __no_operation();__no_operation();__no_operation();__no_operation();\

/***********************************************************************************
*		Variaveis locais
***********************************************************************************/
unsigned char LCD2_controleLcd=0x00;
extern unsigned short int IU_tempoRefreshSegundoLCD;
unsigned int HD44780_2_tempoRefreshSegundoLCD;

/***********************************************************************************
*		Funções locais
***********************************************************************************/
void HD44780_2_enviaNibble(unsigned char value);
void HD44780_2_enviaByte(unsigned char endereco,unsigned char value);

/***********************************************************************************
*		Implementação
***********************************************************************************/

/***********************************************************************************
*   Descrição   :   Inicialização do módulo
*   Parametros  :   nenhum
*   Retorno     :   nenhum
***********************************************************************************/
void HD44780_2_init(unsigned char modo1,unsigned char modo2){
  unsigned char i;
  
  INIT_2_DIR_PINS; 
  
  HD44780_2_delay_ms(500);

  for(i=0;i<3;i++){
    HD44780_2_enviaNibble(0x03);
    HD44780_2_delay_ms(100);  
  }
  
  HD44780_2_enviaNibble(0x02);
  HD44780_2_delay_ms(20);      
  
  
  HD44780_2_enviaByte(0,0x20 | modo1);
  HD44780_2_delay_ms(20);        
  HD44780_2_enviaByte(0,0x08 | modo2);
  HD44780_2_delay_ms(20);        
  
  LCD2_controleLcd = 0x08 | modo2;
  
  HD44780_2_enviaByte(0,0x10);
  HD44780_2_delay_ms(10);          
  HD44780_2_enviaByte(0,0x06);   
  HD44780_2_delay_ms(10);          
}
/***********************************************************************************
*    Descrição   :   Envia um nibble para o controlador do LCD
*    Parametros  :   (unsigned char) valor que será escrito no display
*    Retorno     :   nenhum
***********************************************************************************/
void HD44780_2_enviaNibble(unsigned char value){
 
  BLOCO_SUPER_NOP;
  LCD_2_WRITE_NIBBLE(value);  
  BLOCO_SUPER_NOP;
  SET_LCD_2_ENABLE;   
  BLOCO_SUPER_NOP;
  CLR_LCD_2_ENABLE;   
  BLOCO_SUPER_NOP;
}
/***********************************************************************************
*    Descrição    :   Envia um byte para o controlador do LCD
*    Parametros   :   (unsigned char) endereço
*                     (unsigned char) valor que será escrito no controlador
*    Retorno      :   nenhum
***********************************************************************************/
void HD44780_2_enviaByte(unsigned char endereco,unsigned char value){

  (endereco)?(SET_LCD_2_RS):(CLR_LCD_2_RS);                              
  HD44780_2_enviaNibble(value>>4);
  BLOCO_SUPER_NOP;
  HD44780_2_enviaNibble(value);  
  
  HD44780_2_delay_ms(2);  
}
/***********************************************************************************
*     Descrição   :   Posiciona o cursor em uma determinada linha do display   
*     Parametros  :   (unsigned char) X
*                     (unsigned char) Y
*     Retorno     :   (nenhum)
***********************************************************************************/
void HD44780_2_posicionaTexto(unsigned char x,unsigned char y){
    
  if(x<16 && y==0)
     HD44780_2_enviaByte(0,0x80 + x);
  else
    if(y==1)
      HD44780_2_enviaByte(0,0xC0 + x);
    
  HD44780_2_delay_ms(4);      
}
/***********************************************************************************
*     Descrição    :  Escreve um caracter no display
*     Parametrs    :  (char)
*     Retorno      :  nenhum
***********************************************************************************/
void HD44780_2_writeChar(char c){
  
  switch(c){
    case '\f':  HD44780_2_enviaByte(0,1);
                HD44780_2_delay_ms(12);
                break;    
    case '\n':    
    case '\r':  HD44780_2_enviaByte(1,2);
                break;    
    default  :  HD44780_2_enviaByte(1,c);
                break;
  }
}
/***********************************************************************************
*     Descrição   :   Escreve uma string no display
*     Parametros  :   (char*) Ponteiro para a string
*     Retorno     :   nenhum
***********************************************************************************/
void HD44780_2_writeString(char *string){
  
  if(!HD44780_2_tempoRefreshSegundoLCD){
    
    HD44780_2_tempoRefreshSegundoLCD = 30000;
    HD44780_2_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,
                   LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);          
    HD44780_2_clearText();    
  }  
  
  while(*string)
    HD44780_2_writeChar(*string++);      
}
/***********************************************************************************
*     Descrição   :   Liga o display
*     Parametros  :   (nenhum)
*     Retorno     :   (nenhum)
***********************************************************************************/
void HD44780_2_ligaDisplay(void){
 
  LCD2_controleLcd |= 0x04;
  HD44780_2_enviaByte(0,LCD2_controleLcd);  
}
/***********************************************************************************
*     Descrição    :    Desliga o display
*     Parametros   :    (nenhum)
*     Retorno      :    (nenhum)
***********************************************************************************/
void HD44780_2_desligaDisplay(void){
 
  LCD2_controleLcd &= 0xFB;
  HD44780_2_enviaByte(0,LCD2_controleLcd);
}
/************************************************************************************
*     Descrição     :   Liga o cursor
*     Parametros    :   nenhum
*     Retorno       :   nenhum
***********************************************************************************/
void HD44780_2_ligaCursor(void){
  
  LCD2_controleLcd |= 0x02;
  HD44780_2_enviaByte(0,LCD2_controleLcd);  
}
/***********************************************************************************
*     Descrição     :   Desliga o cursor
*     Parametros    :   nenhum
*     Retorno       :   nenhum
***********************************************************************************/
void HD44780_2_desligaCursor(void){
  
  LCD2_controleLcd &= 0xFD;
  HD44780_2_enviaByte(0,LCD2_controleLcd);  
}
/***********************************************************************************
*     Descrição     :   Liga o cursor piscante
*     Parametros    :   nenhum
*     Retorno       :   nenhum
***********************************************************************************/
void HD44780_2_ligaCursorPiscante(void){
 
  LCD2_controleLcd |= 0x01;
  HD44780_2_enviaByte(0,LCD2_controleLcd); 
}
/***********************************************************************************
*     Descrição     :   Desliga o cursor piscante
*     Parametros    :   nenhum
*     Retorno       :   nenhum
***********************************************************************************/
void HD44780_2_desligaCursorPiscante(void){
 
   LCD2_controleLcd &= 0xFE;
   HD44780_2_enviaByte(0,LCD2_controleLcd);
}                                   
/***********************************************************************************
*		Fim do arquivo
***********************************************************************************/