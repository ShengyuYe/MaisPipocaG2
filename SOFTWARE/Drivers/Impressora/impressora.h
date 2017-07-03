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
|       Arquivo            :  impressora.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  01/03/2017
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _IMPRESSORA_H_
#define _IMPRESSORA_H_




void IMPRESSORA_ini(void);
void IMPRESSORA_gera_relatorio(void);
void IMPRESSORA_impressora_teste(void);
void IMPRESSORA_envia_linha(char *texto);






/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
#endif//_IMPRESSORA_H_