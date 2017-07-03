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
|       Arquivo            :  Pagamentos.h
|       Descrição          :  Biblioteca para controle dos meios de pagamento
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  22/02/2017
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/
#ifndef _PAGAMENTOS_H_
#define _PAGAMENTOS_H_


void PAGAMENTOS_ini(void);
void PAGAMENTOS_main(void*pPar);
void PAGAMENTOS_subtrai_contagem_uca1(unsigned short int contagem);
unsigned short int PAGAMENTOS_get_contagem_uca1(void);
void PAGAMENTOS_bloqueia_uca1(unsigned char flag);
void PAGAMENTOS_timer_tick(void);

unsigned short int PAGAMENTOS_get_contagem_p70(void);
void PAGAMENTOS_subtrai_contagem_p70(unsigned short int contagem);
void PAGAMENTOS_set_inhibit_p70(unsigned char flag);

void PAGAMENTOS_adiciona_valores(unsigned short int valor);
int PAGAMENTOS_get_valor_acumulado(void);
void PAGAMENTOS_subtrai_valores(unsigned int valor);
void PAGAMENTOS_set_valores(int valor);

void PAGAMENTOS_set_bloqueio(unsigned char flag);
unsigned int PAGAMENTOS_get_timeout_pagamento(void);

/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
#endif//_PAGAMENTOS_H_