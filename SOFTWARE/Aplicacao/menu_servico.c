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
|       Arquivo            :  menu_servico.c
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  23/04/2017
|
|       Revis�es           :  001
|
|                             (23/04/2017) criado menu para acesso �s fun��es
|                              de limpeza, resfriamento, dose e embalagem
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
#include "menu_servico.h"
#include "preparacao.h"

/***********************************************************************************
*       Definfi��es locais
***********************************************************************************/



/***********************************************************************************
*       Constantes
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Fun��es locais
***********************************************************************************/
void MSERVICO_limpeza(void);
void MSERVICO_libera_embalagem(void);
void MSERVICO_dosa_porcao(void);
void MSERVICO_resfriamento(void);
void MSERVICO_preparacao(void);

/***********************************************************************************
*       tabela de fun��es
***********************************************************************************/
void(*const MSERVICO_funcs[])(void)={
  MSERVICO_limpeza,
  MSERVICO_libera_embalagem,
  MSERVICO_dosa_porcao,
  MSERVICO_resfriamento,
  MSERVICO_preparacao,
  NULL  
};

/***********************************************************************************
*       Implementa��o das fun��es
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Ponto de entrada do menu de servi�o
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MSERVICO_entry(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  
  MENUROLAGEM_show((char*)STRING_titulo_menu_servico[idioma],
                   (char**)STRING_menu_servico[idioma],
                   QTD_OPCOES_SERVICO,
                   (void(**)(void))MSERVICO_funcs);   
}
/***********************************************************************************
*       Descri��o       :       Executa a limpeza 
*       Parametors      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MSERVICO_limpeza(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  
  STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_limpeza_inicial[idioma][0],(char*)STRING_mensagem_limpeza_inicial[idioma][1]);
  PREPARACAO_limpeza(idioma);
  STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);  
}
/***********************************************************************************
*       Descri��o       :       Faz o avan�o das embalagens
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MSERVICO_libera_embalagem(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned int tempo;
  
  STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
  STRING_write_to_internal(NO_CLEAR,(char*)STRING_mensagem_libera_embalagem[idioma][0],(char*)STRING_mensagem_libera_embalagem[idioma][1]);
  
  PARAMETROS_le(ADR_TEMPO_EMBALAGEM,(void*)&tempo);
  
  EMBALAGEM_libera_pacote(tempo);  
  STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
}
/***********************************************************************************
*       Descri��o       :       Faz a dosagem de uma por��o de milho
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MSERVICO_dosa_porcao(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
    
  STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
  STRING_write_to_internal(NO_CLEAR,(char*)STRING_mensagem_dosando_milho[idioma][0],(char*)STRING_mensagem_dosando_milho[idioma][1]);
  
  PREPARACAO_dosagem_milho();
  
  STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);    
}
/***********************************************************************************
*       Descri��o       :       Faz o processo de resfriamento da resist�ncia
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MSERVICO_resfriamento(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  
  PREPARACAO_resfriamento(idioma);
}
/***********************************************************************************
*       Descri��o       :       Faz a prepara��o de uma pipoca
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MSERVICO_preparacao(void){
  unsigned int temp;
  unsigned char idioma = APLICACAO_carrega_idioma();  
  ePREPARACAO_RESULT resultado;
  eTECLA tecla;
  
  resultado = PREPARACAO_entry(&temp,NAO_CONTABILIZA);
  
  switch(resultado){
    case FALHA_VENTILADOR:      
         break;
    case FALHA_RESISTENCIA:
         STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E0:VENTILADOR");                       
         break;
    case FALHA_DOSE:
         STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E1:AQUECIMENTO");
         break;
    case FALHA_EMBALAGEM:
         STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E2:DOSADOR");          
         break;
    case FALHA_FALTA_TROCO:
         STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E3:EMBALAGEM");                                                 
         break;
  }
  PREPARACAO_resfriamento(idioma);
  
  STRING_write_to_internal(CLEAR_DISPLAY,"FALHA","PROCESSO");
  
  while(resultado != SUCESSO){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ESC: resultado = SUCESSO;
           break;
    }
  }
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/