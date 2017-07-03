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
|       Arquivo            :  faturamento.c
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  (06/03/2017)
|
|       Revis�es           :  001
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
*       Defini��es
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Fun��es locais
***********************************************************************************/


/***********************************************************************************
*       Implementa��o das fun��es
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Getter para a contagem parcial
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
*       Descri��o       :       Getter para a arrecada��o parcial
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) arrecada��o parcial
***********************************************************************************/
unsigned int FATURAMENTO_get_arrecadacao_parcial(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_MOEDA_PARCIAL,(void*)&temp);
  
  return temp;
}
/***********************************************************************************
*       Descri��o       :       Getter para a contagem parcial
*                               do cart�o de cr�dito
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) ccontagem parcial do cart�o
***********************************************************************************/
unsigned int FATURAMENTO_get_contagem_cartao_parcial(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_UNIDADES_CARTAO_PARCIAL,(void*)&temp);
  
  return temp;
}
/***********************************************************************************
*       Descri��o       :       Getter para a arrecada��o parcial do cart�o
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) arrecadacao parcial do cart�o
***********************************************************************************/
unsigned int FATURAMENTO_get_arrecadacao_cartao_parcial(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_CARTAO_PARCIAL,(void*)&temp);
  
  return temp;
}
/***********************************************************************************
*       Descri��o       :       Getter para a contagem total das unidades
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
*       Descri��o       :       Getter para a arrecada��o total
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) arrecadacao total
***********************************************************************************/
unsigned int FATURAMENTO_get_arrecadacao_total(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_MOEDA_TOTAL,(void*)&temp);
  
  return temp;
}
/***********************************************************************************
*       Descri��o       :       Getter paraa contagem do cart�o de cr�dito
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) contagem do cart�o de cr�dito
***********************************************************************************/
unsigned int FATURAMENTO_get_contagem_cartao_total(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_UNIDADES_CARTAO_TOTAL,(void*)&temp);
  
  return temp;
}
/***********************************************************************************
*       Descri��o       :       Getter para a arrecadacao total do cart�o
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) arrecadacao total do cart�o
***********************************************************************************/
unsigned int FATURAMENTO_get_arrecadacao_cartao_total(void){
  unsigned int temp;
  
  PARAMETROS_le(ADR_CARTAO_TOTAL,(void*)&temp);
  
  return temp;
}
/***********************************************************************************
*       Descri��o       :       Setter para a contagem parcial 
*       Parametros      :       (unsigned int) contagem
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_contagem_parcial(unsigned int contagem){
    
  PARAMETROS_grava(ADR_CONTAGEM_UNIDADES_PARCIAL,(void*)&contagem);
}
/***********************************************************************************
*       Descri��o       :       Setter para a arrecada��o 
*       Parametros      :       (unsigned int) arrecadacao
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_arrecadacao_parcial(unsigned int arrecadacao){
  
  PARAMETROS_grava(ADR_MOEDA_PARCIAL,(void*)&arrecadacao);
}
/***********************************************************************************
*       Descri��o       :       Setter para a contagem parcial do cart�o
*       Parametros      :       (unsigned int) contagem
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_contagem_cartao_parcial(unsigned int contagem){
  
  PARAMETROS_grava(ADR_UNIDADES_CARTAO_PARCIAL,(void*)&contagem);
}
/***********************************************************************************
*       Descri��o       :       Setter para a contagem parcial do cart�o
*       Parametros      :       (unsigned int) arrecada��o parcial do
*                                              cart�o
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_arrecadacao_cartao_parcial(unsigned int arrecadacao){
  
  PARAMETROS_grava(ADR_CARTAO_PARCIAL,(void*)&arrecadacao);
}
/***********************************************************************************
*       Descri��o       :       Setter para a contagem de unidades vendidas
*       Parametros      :       (unsigned int) contagem
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_contagem_total(unsigned int contagem){
  
  PARAMETROS_grava(ADR_CONTAGEM_UNIDADES_TOTAL,(void*)&contagem);
}
/***********************************************************************************
*       Descri��o       :       Setter para a arrecada��o 
*       Parametros      :       (unsigned int) arrecadacao
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_arrecadacao_total(unsigned int arrecadacao){
  
  PARAMETROS_grava(ADR_MOEDA_TOTAL,(void*)&arrecadacao);
}
/***********************************************************************************
*       Descri��o       :       Setter para a contagem do cart�o
*       Parametros      :       (unsigned int) contagem
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_contagem_cartao_total(unsigned int contagem){
  
   PARAMETROS_grava(ADR_UNIDADES_CARTAO_TOTAL,(void*)&contagem); 
}
/***********************************************************************************
*       Descri��o       :       Setter para a arrecadaca��o do cart�o
*       Parametros      :       (unsigned int) arrecadacao total do cart�o
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_set_arrecadacao_cartao_total(unsigned int arrecadacao){
  
  PARAMETROS_grava(ADR_CARTAO_TOTAL,(void*)&arrecadacao); 
}
/***********************************************************************************
*       Descri��o       :       Adicionar uma contagem ao contador parcial
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
*       Descri��o       :       Adicionar uma contagem � arrecada��o parcial
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
*       Descri��o       :       Adiciona contagem ao cart�o parcial
*       Parametros      :       (unsigned int) cart�o parcial
*       Retorno                 nenhum
***********************************************************************************/
void FATURAMENTO_add_contagem_cartao_parcial(unsigned int contagem){
  unsigned int temp;

  PARAMETROS_le(ADR_UNIDADES_CARTAO_PARCIAL,(void*)&temp);
  temp+=contagem;
  PARAMETROS_grava(ADR_UNIDADES_CARTAO_PARCIAL,(void*)&temp);  
}
/***********************************************************************************
*       Descri��o        :    Adiciona um valor � arrecada��o do cart�o
*       Parametros       :    (unsigned int) cart�o parcial
*       Retorno         :       nenhum
***********************************************************************************/
void FATURAMENTO_add_arrecadacao_cartao_parcial(unsigned int arrecadacao){
  unsigned int temp;

  PARAMETROS_le(ADR_CARTAO_PARCIAL,(void*)&temp);
  temp+=arrecadacao;
  PARAMETROS_grava(ADR_CARTAO_PARCIAL,(void*)&temp);  
}
/***********************************************************************************
*       Descri��o       :      Adiciona um valor a contagem total de unidades
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
*       Descri��o       :       Adiciona um valor a contagem total de unidades
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
*       Descri��o       :       Adiciona um valor a contagem total do 
*                               cart�o
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
*       Descri��o       :       Adiciona um valor � contagem total do cart�o
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
*       Descri��o       :       Reinicia a contagem do contador de 
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
*       Descri��o       :       Incrementa o contador de pipocas
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