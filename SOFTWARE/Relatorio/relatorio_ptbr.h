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
|       Arquivo            :  Relatorio_PTBR.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  30/05/2017
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _RELATORIO_PTBR_H_
#define _RELATORIO_PTBR_H_


#define REL_PT_BR_01 "+----------------------------+\n\r"
#define REL_PT_BR_02 "|GRUPO ALTECH - MAIS PIPOCA  +\n\r"
#define REL_PT_BR_03 "+----------------------------+\n\r"
#define REL_PT_BR_04 "+                            +\n\r"
#define REL_PT_BR_05 "+  RELATORIO DE VENDAS       +\n\r"
#define REL_PT_BR_06 "+                            +\n\r"
#define REL_PT_BR_07 "+----------------------------+\n\r"
#define REL_PT_BR_08 "                              \n\r"
#define REL_PT_BR_09 "  [Numero de serie]           \n\r"
#define REL_PT_BR_10 "  %06d                        \n\r",numero_serie
#define REL_PT_BR_11 "                              \n\r"
#define REL_PT_BR_12 "  [Faturamento parcial]       \n\r"
#define REL_PT_BR_13 "   unidades   : %d            \n\r",unidades_parcial
#define REL_PT_BR_14 "   arrecadacao: R$ %d,%02d    \n\r",arrecadacao_parcial/100,arrecadacao_parcial%100
#define REL_PT_BR_15 "                              \n\r"
#define REL_PT_BR_16 "  [Faturamento total]         \n\r"
#define REL_PT_BR_17 "   unidades   : %d            \n\r",unidades_total
#define REL_PT_BR_18 "   arrecadacao: R$ %d,%02d    \n\r",arrecadacao_total/100,arrecadacao_total%100
#define REL_PT_BR_19 "                              \n\r"
#define REL_PT_BR_20 "  [Faturamento cartao]        \n\r"
#define REL_PT_BR_21 "   parcial    : R$ %d,%02d    \n\r",cartao_parcial/100,cartao_parcial%100
#define REL_PT_BR_22 "   total      : R$ %d,%02d    \n\r",cartao_total/100,cartao_total%100
#define REL_PT_BR_23 "                              \n\r"
#define REL_PT_BR_24 "  [Comissao do ponto]         \n\r"
#define REL_PT_BR_25 "   taxa       : %d %%         \n\r",comissao_ponto
#define REL_PT_BR_26 "   montante   : R$ %d,%02d    \n\r",faturamento_ponto/100,faturamento_ponto%100
#define REL_PT_BR_27 "                              \n\r"
#define REL_PT_BR_28 "  [Hora/Data do Relatorio]    \n\r"
#define REL_PT_BR_29 "    %02d/%02d/%04d            \n\r",dia,mes,ano
#define REL_PT_BR_30 "    %02d:%02d:%02d            \n\r",hora,minuto,segundo
#define REL_PT_BR_31 "                              \n\r"
#define REL_PT_BR_32 "  [Valor da pipoca]           \n\r"
#define REL_PT_BR_33 "    R$ %d,%02d                \n\r",valor/100,valor%100
#define REL_PT_BR_34 "                              \n\r"
#define REL_PT_BR_35 "                              \n\r"
#define REL_PT_BR_36 "  [Pipocas teste]             \n\r"
#define REL_PT_BR_37 "    preparacoes: %d           \n\r",preparacao_teste
#define REL_PT_BR_38 "                              \n\r"
#define REL_PT_BR_39 "                              \n\r"
#define REL_PT_BR_40 "                              \n\r"
#define REL_PT_BR_41 "                              \n\r"
#define REL_PT_BR_42 "                              \n\r"
#define REL_PT_BR_43 "                              \n\r"
#define REL_PT_BR_44 "                              \n\r"
#define REL_PT_BR_45 "  ____________________________\n\r"
#define REL_PT_BR_46 "     Responsavel pelo ponto   \n\r"
#define REL_PT_BR_47 "                              \n\r"
#define REL_PT_BR_48 "                              \n\r"
#define REL_PT_BR_49 "                              \n\r"
#define REL_PT_BR_50 "                              \n\r"

#endif//_RELATORIO_PTBR_H_