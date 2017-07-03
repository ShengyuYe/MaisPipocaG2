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
|       Arquivo            :  strings.h
|       Descri��o          :  declara��o de todas as mensagens utilizadas
|                             no display
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  15/02/2017
|
|       Revis�es           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _STRINGS_H_
#define _STRINGS_H_

#define QTY_OF_LANGUAGES                        7          

typedef enum{
  BRASIL,
  URUGUAI,
  ARGENTINA,
  PARAGUAI,
  PERU,
  EUA,
  CANADA
}eIDIOMA;

typedef enum{
  CLEAR_DISPLAY=0,
  NO_CLEAR
}eCLEAR;


//
// Fun��es e procedimentos
//
char *STRING_idioma_to_string(eIDIOMA idioma);
void STRING_write_to_internal(eCLEAR clear,char* l1,char* l2);
void STRING_write_to_external(eCLEAR clear,char* l1,char* l2);

// Declara��o das strings









/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
#endif//_STRINGS_H_