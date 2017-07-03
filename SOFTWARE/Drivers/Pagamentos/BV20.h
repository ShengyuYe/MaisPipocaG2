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
|       Arquivo            :  BV20.h
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

#ifndef _BV20_H_
#define _BV20_H_

typedef enum{
  BV20_BLOQUEADO,
  BV20_OFFLINE_BLOQUEADO,
  BV20_INICIALIZACAO,
  BV20_OFFLINE,
  BV20_SUPERVISAO,
  BV20_LE_EVENTO,
  BV20_SEM_EVENTO
}eBV20_state;

typedef struct{
  eBV20_state sinal;  
}sSINAL_PAGAMENTO;


void BV20_ini(void); 
void BV20_main(void*pPar);
unsigned short int BV20_get_valor_acumulador(void);
void BV20_subtrai_valor_acumulado(unsigned short int valor);
CCTALK_BILL_EVENTS BV20_get_ultimo_evento(void);
eBV20_state BV20_get_current_state(void);
void BV20_setter_bloqueio(unsigned char flag);

#endif//_BV20_H_
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/