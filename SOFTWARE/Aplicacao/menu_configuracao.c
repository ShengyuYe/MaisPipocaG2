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
|       Arquivo            :  menu_configuracao.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :
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
#include "menu_ajuste_relogio.h"
#include "menu_edita_flag.h"
#include "menu_edita_inteiro.h"
#include "menu_edita_listagem.h"
#include "menu_info_binaria.h"
#include "menu_rolagem.h"
#include "menu_teste_hardware.h"
#include "menu_operacao.h"
#include "menu_acessorios.h"
#include "menu_faturamento.h"
#include "menu_seleciona_lista.h"
#include "menu_servico.h"
#include "menu_avancado.h"

/***********************************************************************************
*       Constantes
***********************************************************************************/


/***********************************************************************************
*       Variaveis 
***********************************************************************************/


/***********************************************************************************
*       Funções
***********************************************************************************/
void MCFG_seleciona_idioma(void);

/***********************************************************************************
*       Tabela de funções
***********************************************************************************/
void(*const MCF_funcoes[TAM_OPCOES_CFG])(void)={
  MENUOP_entry,
  MENUFAT_entry,
  MPREP_entry,
  MACESS_entry,
  NULL,
  MTH_entry,
  MCFG_seleciona_idioma,
  MSERVICO_entry,
  MENUAVANCADO_entry,
  NULL
};

/***********************************************************************************
*       Implementação
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Ponto de entrada do menu de configuração
*                               do sistema
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MCFG_entry(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  
  MENUROLAGEM_show((char*)STRING_titulo_menu_configuracao[idioma],
                   (char**)STRING_menu_configuracao[idioma],
                   TAM_OPCOES_CFG,
                   (void(**)(void))MCF_funcoes);                                  
}
/***********************************************************************************
*       Descrição       :       Função para selecionar o idioma da placa
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MCFG_seleciona_idioma(void){
  unsigned char idioma;
  unsigned char flags[8]={0};  
  
  idioma = APLICACAO_carrega_idioma();
  
  if(idioma>QTY_OF_LANGUAGES)
    idioma = 0;
  
  flags[idioma] = 255;
    
  MSL_entry("LOCATION",(char**)&STRING_tela_sel_idioma[0][0],flags,TAM_OPCOES_IDIOMA);
  
  idioma = 0;
  for(unsigned char i=0;i<QTY_OF_LANGUAGES;i++)
    if(flags[i])
      idioma = i;      

  PARAMETROS_grava(ADR_FLAG_IDIOMA,(void*)&idioma);      
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/