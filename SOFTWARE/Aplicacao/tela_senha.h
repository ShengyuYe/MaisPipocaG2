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
| __________________________________________________________________________________
|
|       Arquivo            :  tela_senha.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  (26/04/2017)
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _TELA_SENHA_H_
#define _TELA_SENHA_H_





unsigned char TELASENHA_telaSenha(unsigned short int senha);
unsigned int TELASENHA_get_senha(char *msg);
unsigned char TELASENHA_checa_contrasenha(char*msg);

/**********************************************************************************
*       Fim do arquivo
**********************************************************************************/
#endif//_TELA_SENHA_H_