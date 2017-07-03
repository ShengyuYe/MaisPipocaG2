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
|       Arquivo            :  watchdog.h
|       Data criação       :  12/12/2011
|       Revisões	   :  1.0.0.0
|
| __________________________________________________________________________________
*/

#ifndef _WATCHDOG_H_
#define	_WATCHDOG_H_


#define FEEDS_THE_DOG()               WDFEED = 0xAA; WDFEED = 0x55;

#ifdef __cplusplus
extern "C"{
#endif
  
void WATCHDOG_init(unsigned int intervalo);

#ifdef __cplusplus
}
#endif

/***********************************************************************************
*   Fim do arquivo
***********************************************************************************/
#endif // _WATCHDOG_H_