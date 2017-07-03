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
|       Arquivo            :  aplicacao.h
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :
|
|       Revis�es           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _APLICACAO_H_
#define _APLICACAO_H_

#define OPERA_SEM_TROCO                         0x00
#define OPERA_COM_TROCO                         0xFF

void APLICACAO_main(void*pPar);
void APLIACAO_wait_lcd(void);
void APLICACAO_release_lcd(void);
unsigned char APLICACAO_carrega_idioma(void);

/***********************************************************************************
*       Fim arquivo
***********************************************************************************/
#endif//_APLICACAO_H_