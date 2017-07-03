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
|       Arquivo            :  faturamento.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  (06/03/2017)
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "..\includes.h"

/***********************************************************************************
*       Definições
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Funções locais
***********************************************************************************/


/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Getter para a contagem parcial
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) contagem parcial de unidades
*                               vendidas
***********************************************************************************/
unsigned int FATURAMENTO_get_contagem_parcial(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_CONTAGEM_UNIDADES_PARCIAL,(void*)&temp);
  
  return temp;  
}
/***********************************************************************************
*       Descrição       :       Getter para a arrecadação parcial
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) arrecadação parcial
***********************************************************************************/
unsigned int FATURAMENTO_get_arrecadacao_parcial(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_MOEDA_PARCIAL,(void*)&temp);
  
  return temp;
}
/***********************************************************************************
*       Descrição       :       Getter para a contagem parcial
*                               do cartão de crédito
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) ccontagem parcial do cartão
***********************************************************************************/
unsigned int FATURAMENTO_get_contagem_cartao_parcial(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_UNIDADES_CARTAO_PARCIAL,(void*)&temp);
  
  return temp;
}
/***********************************************************************************
*       Descrição       :       Getter para a arrecadação parcial do cartão
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) arrecadacao parcial do cartão
***********************************************************************************/
unsigned int FATURAMENTO_get_arrecadacao_cartao_parcial(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_CARTAO_PARCIAL,(void*)&temp);
  
  return temp;
}
/***********************************************************************************
*       Descrição       :       Getter para a contagem total das unidades
*                               vendidas
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) contagem total 
***********************************************************************************/
unsigned int FATURAMENTO_get_contagem_total(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_CONTAGEM_UNIDADES_TOTAL,(void*)&temp);
  
  return temp;
}
/***********************************************************************************
*       Descrição       :       Getter para a arrecadação total
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) arrecadacao total
***********************************************************************************/
unsigned int FATURAMENTO_get_arrecadacao_total(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_MOEDA_TOTAL,(void*)&temp);
  
  return temp;
}
/***********************************************************************************
*       Descrição       :       Getter paraa contagem do cartão de crédito
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) contagem do cartão de crédito
***********************************************************************************/
unsigned int FATURAMENTO_get_contagem_cartao_total(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_UNIDADES_CARTAO_TOTAL,(void*)&temp);
  
  return temp;
}
/***********************************************************************************
*       Descrição       :       Getter para a arrecadacao total do cartão
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) arrecadacao total do cartão
***********************************************************************************/
unsigned int FATURAMENTO_get_arrecadacao_cartao_total(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_CARTAO_TOTAL,(void*)&temp);
  
  return temp;
}
/***********************************************************************************
*       Descrição       :       Setter para a contagem parcial 
*       Parametros      :       (unsigned int) contagem
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_contagem_parcial(unsigned int contagem){
    
  PARAMETROS_grava(ADR_CONTAGEM_UNIDADES_PARCIAL,(void*)&contagem);
}
/***********************************************************************************
*       Descrição       :       Setter para a arrecadação 
*       Parametros      :       (unsigned int) arrecadacao
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_arrecadacao_parcial(unsigned int arrecadacao){
  
  PARAMETROS_grava(ADR_MOEDA_PARCIAL,(void*)&arrecadacao);
}
/***********************************************************************************
*       Descrição       :       Setter para a contagem parcial do cartão
*       Parametros      :       (unsigned int) contagem
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_contagem_cartao_parcial(unsigned int contagem){
  
  PARAMETROS_grava(ADR_UNIDADES_CARTAO_PARCIAL,(void*)&contagem);
}
/***********************************************************************************
*       Descrição       :       Setter para a contagem parcial do cartão
*       Parametros      :       (unsigned int) arrecadação parcial do
*                                              cartão
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_arrecadacao_cartao_parcial(unsigned int arrecadacao){
  
  PARAMETROS_grava(ADR_CARTAO_PARCIAL,(void*)&arrecadacao);
}
/***********************************************************************************
*       Descrição       :       Setter para a contagem de unidades vendidas
*       Parametros      :       (unsigned int) contagem
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_contagem_total(unsigned int contagem){
  
  PARAMETROS_grava(ADR_CONTAGEM_UNIDADES_TOTAL,(void*)&contagem);
}
/***********************************************************************************
*       Descrição       :       Setter para a arrecadação 
*       Parametros      :       (unsigned int) arrecadacao
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_arrecadacao_total(unsigned int arrecadacao){
  
  PARAMETROS_grava(ADR_MOEDA_TOTAL,(void*)&arrecadacao);
}
/***********************************************************************************
*       Descrição       :       Setter para a contagem do cartão
*       Parametros      :       (unsigned int) contagem
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_contagem_cartao_total(unsigned int contagem){
  
   PARAMETROS_grava(ADR_UNIDADES_CARTAO_TOTAL,(void*)&contagem); 
}
/***********************************************************************************
*       Descrição       :       Setter para a arrecadacação do cartão
*       Parametros      :       (unsigned int) arrecadacao total do cartão
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_arrecadacao_cartao_total(unsigned int arrecadacao){
  
  PARAMETROS_grava(ADR_CARTAO_TOTAL,(void*)&arrecadacao); 
}
/***********************************************************************************
*       Descrição       :       Adicionar uma contagem ao contador parcial
*       Parametros      :       (unsigned int) contagem para adicionar
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_add_contagem_parcial(unsigned int contagem){
  unsigned int temp;

  PARAMETROS_le(ADR_CONTAGEM_UNIDADES_PARCIAL,(void*)&temp);
  temp+=contagem;
  PARAMETROS_grava(ADR_CONTAGEM_UNIDADES_PARCIAL,(void*)&temp);  
}
/***********************************************************************************
*       Descrição       :       Adicionar uma contagem à arrecadação parcial
*       Parametros      :       (unsigned int) arrecadacao
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_add_arrecadacao_parcial(unsigned int arrecadacao){
  unsigned int temp;

  PARAMETROS_le(ADR_MOEDA_PARCIAL,(void*)&temp);
  temp+=arrecadacao;
  PARAMETROS_grava(ADR_MOEDA_PARCIAL,(void*)&temp);  
}
/***********************************************************************************
*       Descrição       :       Adiciona contagem ao cartão parcial
*       Parametros      :       (unsigned int) cartão parcial
*       Retorno                 nenhum
***********************************************************************************/
void FATURAMENTO_add_contagem_cartao_parcial(unsigned int contagem){
  unsigned int temp;

  PARAMETROS_le(ADR_UNIDADES_CARTAO_PARCIAL,(void*)&temp);
  temp+=contagem;
  PARAMETROS_grava(ADR_UNIDADES_CARTAO_PARCIAL,(void*)&temp);  
}
/***********************************************************************************
*       Descrição        :    Adiciona um valor à arrecadação do cartão
*       Parametros       :    (unsigned int) cartão parcial
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_add_arrecadacao_cartao_parcial(unsigned int arrecadacao){
  unsigned int temp;

  PARAMETROS_le(ADR_CARTAO_PARCIAL,(void*)&temp);
  temp+=arrecadacao;
  PARAMETROS_grava(ADR_CARTAO_PARCIAL,(void*)&temp);  
}
/***********************************************************************************
*       Descrição       :      Adiciona um valor a contagem total de unidades
*                              vendidas
*       Parametros      :      (unsigned int) contagem
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_add_contagem_total(unsigned int contagem){
  unsigned int temp;

  PARAMETROS_le(ADR_CONTAGEM_UNIDADES_TOTAL,(void*)&temp);
  temp+=contagem;
  PARAMETROS_grava(ADR_CONTAGEM_UNIDADES_TOTAL,(void*)&temp);  
}
/***********************************************************************************
*       Descrição       :       Adiciona um valor a contagem total de unidades
*                               vendidas
*       Parametros      :       (unsigned int) contagem
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_add_arrecadacao_total(unsigned int arrecadacao){
  unsigned int temp;

  PARAMETROS_le(ADR_MOEDA_TOTAL,(void*)&temp);
  temp+=arrecadacao;
  PARAMETROS_grava(ADR_MOEDA_TOTAL,(void*)&temp);  
}
/***********************************************************************************
*       Descrição       :       Adiciona um valor a contagem total do 
*                               cartão
*       Parametros      :       (unsigned int) contagem
*       Retorno         :       nennhum
***********************************************************************************/
void FATURAMENTO_add_contagem_cartao_total(unsigned int contagem){
  unsigned int temp;

  PARAMETROS_le(ADR_UNIDADES_CARTAO_TOTAL,(void*)&temp);
  temp+=contagem;
  PARAMETROS_grava(ADR_UNIDADES_CARTAO_TOTAL,(void*)&temp);  
}
/***********************************************************************************
*       Descrição       :       Adiciona um valor à contagem total do cartão
*       Parametros      :       (unsigned int) contagem
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_add_arrecadacao_cartao_total(unsigned int arrecadacao){
  unsigned int temp;

  PARAMETROS_le(ADR_CARTAO_TOTAL,(void*)&temp);
  temp+=arrecadacao;
  PARAMETROS_grava(ADR_CARTAO_TOTAL,(void*)&temp);  
}
/***********************************************************************************
*       Descrição       :       Reinicia a contagem do contador de 
*                               pipocas preparada na tela de teste
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_reinicia_pipocas_teste(void){
  unsigned int temp;
  
  temp = 0;
  PARAMETROS_grava(ADR_CONTADOR_PIPOCAS_TESTE,(void*)&temp);    
}
/***********************************************************************************
*       Descrição       :       Incrementa o contador de pipocas
*                               teste
*       Parametros      :       nennhum
*       Retorno         :       nennhum
***********************************************************************************/
void FATURAMENTO_inc_contador_pipocas_teste(void){
  unsigned int temp;
  
   PARAMETROS_le(ADR_CONTADOR_PIPOCAS_TESTE,(void*)&temp);
   temp+=1;
   PARAMETROS_grava(ADR_CONTADOR_PIPOCAS_TESTE,(void*)&temp);  
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/