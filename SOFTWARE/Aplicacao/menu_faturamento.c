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
|       Arquivo            :  menu_faturamento.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  06/03/2017
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
#include "menu_faturamento.h"
#include "menu_rolagem.h"

/***********************************************************************************
*       Definições
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Funções locais
***********************************************************************************/
void MENUFAT_exibe_info_int(unsigned int parcial,unsigned int total);
void MENUFAT_exibe_contagem(void);
void MENUFAT_exibe_arrecadacao_moeda(void);
void MENUFAT_exibe_arrecadacao_cartao(void);
void MENUFAT_reinicia_totalizadores(void);
void MENUFAT_reinicia_parcial(void);

/***********************************************************************************
*       Tabela de funções
***********************************************************************************/
void(*const MFAT_entry[])(void)={
  MENUFAT_exibe_contagem,
  MENUFAT_exibe_arrecadacao_moeda,
  MENUFAT_exibe_arrecadacao_cartao,
  MENUFAT_reinicia_parcial,
  MENUFAT_reinicia_totalizadores,
  NULL  
};

/***********************************************************************************
*       Tabela de funções
***********************************************************************************/


/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Ponto de entrada do menu faturament
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUFAT_entry(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  
  MENUROLAGEM_show((char*)STRING_titulo_menu_faturamento[idioma],
                   (char**)STRING_opcoes_menu_faturamento[idioma],
                   QTD_OPCOES_FATURAMENTO,
                   (void(**)(void))MFAT_entry);    
}
/***********************************************************************************
*       Descrição       :       Uma contagem de uma variavel de 32 bits
*                               na tela junto com um título
*       Parametros      :       (unsigned int) valor
*                               (char*) titulo
*       Retorno         :       nenhum
***********************************************************************************/
void MENUFAT_exibe_info_int(unsigned int parcial,unsigned int total){
  eTECLA tecla;
  char buffer_linha[17];
  
  sprintf(buffer_linha,"P:%d,%d",parcial/100,parcial%100);
  STRING_write_to_internal(CLEAR_DISPLAY,buffer_linha,buffer_linha);
  
  sprintf(buffer_linha,"T:%d,%d",total/100,total%100);
  STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);  
  
  for(;TECLADO_getContadorInatividade();){
   
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           break;
    }    
  }    
}
/***********************************************************************************
*       Descrição       :       Exibe o faturamento parcial
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUFAT_exibe_contagem(void){
  unsigned int parcial;
  unsigned int total;

  PARAMETROS_le(ADR_CONTAGEM_UNIDADES_PARCIAL,(void*)&parcial);
  PARAMETROS_le(ADR_CONTAGEM_UNIDADES_TOTAL,(void*)&total);  
  
  MENUFAT_exibe_info_int(parcial*100,total*100);
}
/***********************************************************************************
*       Descrição       :       Exibe a arrecadação em moeda
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUFAT_exibe_arrecadacao_moeda(void){
  unsigned int parcial;
  unsigned int total;

  PARAMETROS_le(ADR_MOEDA_PARCIAL,(void*)&parcial);
  PARAMETROS_le(ADR_MOEDA_TOTAL,(void*)&total);  
  
  MENUFAT_exibe_info_int(parcial,total);
}
/***********************************************************************************
*       Descrição       :       Exibe a arrecadação do cartão
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUFAT_exibe_arrecadacao_cartao(void){
  unsigned int parcial;
  unsigned int total;

  PARAMETROS_le(ADR_CARTAO_PARCIAL,(void*)&parcial);
  PARAMETROS_le(ADR_CARTAO_TOTAL,(void*)&total);  
  
  MENUFAT_exibe_info_int(parcial,total);
}
/***********************************************************************************
*       Descrição       :       Menu para realizar o reset total dos
*                               totalizadores do sistema
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUFAT_reinicia_totalizadores(void){
  unsigned int senha_root;

  PARAMETROS_le(ADR_SENHA_ADMIN,(void*)&senha_root);
  
  if(TELASENHA_telaSenha(senha_root)){
    STRING_write_to_internal(CLEAR_DISPLAY,"APAGANDO","PARCIAL");    
    FATURAMENTO_set_contagem_parcial(0);
    FATURAMENTO_set_arrecadacao_parcial(0);
    FATURAMENTO_set_contagem_cartao_parcial(0);
    FATURAMENTO_set_arrecadacao_cartao_parcial(0);
  }else
    STRING_write_to_internal(CLEAR_DISPLAY,"SENHA","INCORRETA");
  
  vTaskDelay(3000);
}
/***********************************************************************************
*       Descrição       :       Aoaga a contagem parcial
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUFAT_reinicia_parcial(void){
  eTECLA tecla;
  unsigned char loop=1;
  
  STRING_write_to_internal(CLEAR_DISPLAY,"ENTER P/ IMPRIM.","ESC P/ SAIR");
    
  for(;loop;){
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER: RELATORIO_entry();
                        break;
      case TECLA_ESC:   loop = 0;
                        break;
    }  
    
  }  
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/