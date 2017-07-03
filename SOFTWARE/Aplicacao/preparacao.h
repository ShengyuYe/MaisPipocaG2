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
|       Arquivo            :  Preparacao.h
|       Descrição          :  Interface para a preparação da pipoca
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  22/04/2017
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _PREPARACAO_H_
#define _PREPARACAO_H_


typedef enum{
  NAO_CONTABILIZA=0,
  CONTABILIZA
}eCONTABILIZAR;

typedef enum{
  SUCESSO=0,
  FALHA_VENTILADOR,
  FALHA_RESISTENCIA,
  FALHA_DOSE,
  FALHA_EMBALAGEM,  
  FALHA_FALTA_TROCO,
  FALHA_AQUECIMENTO
}ePREPARACAO_RESULT;

ePREPARACAO_RESULT PREPARACAO_entry(unsigned int *ajuste_out,
                                    eCONTABILIZAR contabiliza);

void PREPARACAO_resfriamento(unsigned char idioma);

void PREPARACAO_limpeza_inicial(unsigned char idioma);

void PREPARACAO_limpeza(unsigned char idioma);;


#endif//_PREPARACAO_H_