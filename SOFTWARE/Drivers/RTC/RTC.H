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
|       Arquivo            :  rtc.h
|       Data criação       :  28/07/2011
|       Revisões           :  1.0
|
| __________________________________________________________________________________
*/

#ifndef _RTC_H_
#define	_RTC_H_


void RTC_init(void);

void RTC_setValue(unsigned char hour,unsigned char minute,unsigned char second,
                  unsigned char day,unsigned char month,unsigned int year);

void RTC_getValue(unsigned char *hour,unsigned char *minute,unsigned char *second,
                  unsigned char *day,unsigned char *month,unsigned int *year);

/***********************************************************************************
*		Fim do arquivo
***********************************************************************************/
#endif // _RTC_H_