/*__________________________________________________________________________________
|	Marcos Aquino Projetos Exclusivos
|       
|       Balne�rio Cambori� - SC
|       www.aquino.eng.br
| __________________________________________________________________________________
|
|       This source code was developed by Chave Digital and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Chave Digital
|       or its distributors.
|
|       Este c�digo � propriedade da Chave Digital e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Chave Digital ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  Teclado.h
|       Descri��o          :  m�dulo principal do sistema
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  10/02/2015
|
|       Revis�es           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _TECLADO_H_
#define _TECLADO_H_

typedef enum{
  NENHUMA_TECLA,
  TECLA_ESC,
  TECLA_INC,  
  TECLA_DEC,
  TECLA_ENTER,
  TECLA_GRATIS,
  CHAVE_FIM_PAPEL,
  CHAVE_PORTA_ABERTA,
  TECLA_MENU_AVANCADO
}eTECLA;

void TECLADO_ini(void);
void TECLADO_timerTick(void);
eTECLA TECLADO_getch(void);
char* TECLADO_eTecla_to_String(eTECLA tecla);
unsigned int TECLADO_getContadorInatividade(void);
unsigned char TECLADO_getChavePorta(void);
unsigned char TECLADO_getChaveReservaPapel(void);

/************************************************************************************
*       Fim do arquivo
************************************************************************************/
#endif//_TECLADO_H_