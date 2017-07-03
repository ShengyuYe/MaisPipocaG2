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
|       Arquivo            :  menu_preparacao.c
|       Descrição          :  Menu com opções de preparação da pipoca
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  22/04/2017
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
#include "menu_preparacao.h"
#include "menu_rolagem.h"
#include "menu_edita_inteiro.h"
#include "..\includes.h"

/***********************************************************************************
*       Definições
***********************************************************************************/



/***********************************************************************************
*       Constantes
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Funções locais
***********************************************************************************/
void MPREP_edita_temperatura(void);
void MPREP_edita_velocidade(void);

/***********************************************************************************
*       Tabela de funções
***********************************************************************************/
void(*const MPREP_funcs[QTD_OPCOES_PREPARACAO])(void)={
  MPREP_edita_temperatura,
  MPREP_edita_velocidade,
  NULL  
};

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/**********************************************************************************
*       Descrição       :       Ponto de entrada do menu de configuração
*                               dos parâmetros de preparação
*       Parametros      :       nenhum
*       Retorno         :       nenhum
**********************************************************************************/
void MPREP_entry(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  
  MENUROLAGEM_show((char*)STRING_titulo_menu_preparacao[idioma],
                   (char**)STRING_opcoes_menu_preparacao[idioma],
                   QTD_OPCOES_PREPARACAO,
                   (void(**)(void))MPREP_funcs);   
}
/***********************************************************************************
*       Descrição       :       Tela para edição da temperatura de preparação
*                               das pipocas
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MPREP_edita_temperatura(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned int temperatura;

  PARAMETROS_le(ADR_TEMPERATURA_PREPARACAO,(void*)&temperatura);
  if(temperatura>200)
    temperatura = 60;
  
  temperatura = MEI_entry((char*)STRING_titulo_edita_temperatura[idioma],
                          "%03doC",
                          temperatura,
                          40,
                          200);
  PARAMETROS_grava(ADR_TEMPERATURA_PREPARACAO,(void*)&temperatura);
}
/***********************************************************************************
*       Descrição       :       Tela para edição da velocidade de preparação
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MPREP_edita_velocidade(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned int velocidade;
  
  PARAMETROS_le(ADR_VELOCIDADE_PREPARACAO,(void*)&velocidade);
  if(velocidade>12000)
    velocidade = 4500;
  velocidade = MEI_entry_inc((char*)STRING_titulo_edita_velocidade[idioma],
                             "%05d RPM",
                             velocidade,
                             3500,
                             12000,
                             100);
    
  PARAMETROS_grava(ADR_VELOCIDADE_PREPARACAO,(void*)&velocidade);  
}
/***********************************************************************************
*       fim do arquivo
***********************************************************************************/