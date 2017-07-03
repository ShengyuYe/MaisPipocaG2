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
|       Arquivo            :  faturamento.h
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  (06/03/2017)
|
|       Revis�es           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _FATURAMENTO_H_
#define _FATURAMENTO_H_


unsigned int FATURAMENTO_get_contagem_parcial(void);
unsigned int FATURAMENTO_get_arrecadacao_parcial(void);
unsigned int FATURAMENTO_get_contagem_cartao_parcial(void);
unsigned int FATURAMENTO_get_arrecadacao_cartao_parcial(void);
unsigned int FATURAMENTO_get_contagem_total(void);
unsigned int FATURAMENTO_get_arrecadacao_total(void);
unsigned int FATURAMENTO_get_contagem_cartao_total(void);
unsigned int FATURAMENTO_get_arrecadacao_cartao_total(void);

void FATURAMENTO_set_contagem_parcial(unsigned int contagem);
void FATURAMENTO_set_arrecadacao_parcial(unsigned int arrecadacao);
void FATURAMENTO_set_contagem_cartao_parcial(unsigned int contagem);
void FATURAMENTO_set_arrecadacao_cartao_parcial(unsigned int arrecadacao);
void FATURAMENTO_set_contagem_total(unsigned int contagem);
void FATURAMENTO_set_arrecadacao_total(unsigned int arrecadacao);
void FATURAMENTO_set_contagem_cartao_total(unsigned int contagem);
void FATURAMENTO_set_arrecadacao_cartao_total(unsigned int arrecadacao);

void FATURAMENTO_add_contagem_parcial(unsigned int contagem);
void FATURAMENTO_add_arrecadacao_parcial(unsigned int arrecadacao);
void FATURAMENTO_add_contagem_cartao_parcial(unsigned int contagem);
void FATURAMENTO_add_arrecadacao_cartao_parcial(unsigned int arrecadacao);
void FATURAMENTO_add_contagem_total(unsigned int contagem);
void FATURAMENTO_add_arrecadacao_total(unsigned int arrecadacao);
void FATURAMENTO_add_contagem_cartao_total(unsigned int contagem);
void FATURAMENTO_add_arrecadacao_cartao_total(unsigned int arrecadacao);

void FATURAMENTO_reinicia_pipocas_teste(void);
void FATURAMENTO_inc_contador_pipocas_teste(void);

/************************************************************************************
*       Fim do arquivo
************************************************************************************/
#endif//_FATURAMENTO_H_