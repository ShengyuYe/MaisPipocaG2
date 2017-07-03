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
|       Arquivo            :  menu_acessorios.c
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
#include "menu_edita_inteiro.h"
#include "menu_ajuste_relogio.h"
#include "menu_configuracao.h"
#include "menu_edita_flag.h"
#include "menu_edita_listagem.h"
#include "menu_info_binaria.h"
#include "menu_rolagem.h"
#include "menu_teste_hardware.h"
#include "menu_acessorios.h"
#include "menu_seleciona_lista.h"

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Funções locais
***********************************************************************************/
void MACESS_configura_baud_impressora(void);
void MACESS_configura_bv20(void);
void MACESS_configura_noteiro_mdb(void);
void MACESS_configura_moedeiro_mdb(void);
void MACESS_configura_cartao_mdb(void);
void MACESS_configura_pulso_moeda(void);
void MACESS_configura_pulso_noteiro(void);

/***********************************************************************************
*       Tabela de funções
***********************************************************************************/
void(*const MACESS_func[])(void)={
  MACESS_configura_baud_impressora,
  MACESS_configura_bv20,
  MACESS_configura_noteiro_mdb,
  MACESS_configura_moedeiro_mdb,
  MACESS_configura_cartao_mdb,
  MACESS_configura_pulso_moeda,
  MACESS_configura_pulso_noteiro,
  NULL  
};

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Ponto de entrada do menu de configuração
*                               dos acessórios que serão utilizados
*                               na máquina
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MACESS_entry(void){  
  unsigned char idioma = APLICACAO_carrega_idioma();
  
  MENUROLAGEM_show((char*)STRING_titulo_menu_acessorios[idioma],
                   (char**)STRING_opcoes_menu_acessorios[idioma],
                   TAM_OPCOES_ACESSORIOS,
                   (void(**)(void))MACESS_func);         
}
/***********************************************************************************
*       Descrição       :       Configura o baudrate da impressora
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MACESS_configura_baud_impressora(void){
  unsigned char idioma = APLICACAO_carrega_idioma();  
  unsigned int baud;
  const char *nomes_baud[]={
    "1200","2400","4800","9600","14400","19200","38400","56000","57600","115200",
  };
  unsigned int bauds[]={
    1200  ,2400  ,4800  , 9600, 14400  ,19200  ,38400 ,56000   ,57600  ,115200
  };
  unsigned char flags[10]={0};
  
  PARAMETROS_le(ADR_BAUDRATE_IMPRESSORA,&baud);
  
  switch(baud){
    case 1200:
         flags[0] = 255;
         break;
    case 2400:
         flags[1] = 255;
         break;
    case 4800:
         flags[2] = 255;
         break;
    case 9600:
         flags[3] = 255;
         break;
    case 14400:
         flags[4] = 255;
         break;
    case 19200:
         flags[5] = 255;
         break;
    case 38400:
         flags[6] = 255;
         break;
    case 56000:
         flags[7] = 255;
         break;
    case 57600:
         flags[8] = 255;
         break;
    case 115200:
         flags[9] = 255;
         break;
    default:
         flags[0] = 255;
         break;         
  }
    
  MSL_entry((char*)STRING_titulo_edita_baudrate[idioma],(char**)nomes_baud,flags,10);
  
  baud = 0;
  for(unsigned char i=0;i<10;i++)
    if(flags[i])
      baud=bauds[i];
  
  PARAMETROS_grava(ADR_BAUDRATE_IMPRESSORA,&baud);  
}
/***********************************************************************************
*       Descrição       :       Tela para configuração da utilização do BV20
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MACESS_configura_bv20(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_BV20,&flag);
  
  flag = MEF_entry((char*)STRING_tela_edita_flag_BV20[idioma],flag,"ON ","OFF");    
  
  PARAMETROS_grava(ADR_FLAG_BV20,&flag);
}
/***********************************************************************************
*       Descrição       :       Tela para configuração da utilização do
*                               noteiro MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MACESS_configura_noteiro_mdb(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_MDB_BIL,&flag);
  
  flag = MEF_entry((char*)STRING_titulo_edita_flag_mdb_bill[idioma],flag,"ON ","OFF");    
  
  PARAMETROS_grava(ADR_FLAG_MDB_BIL,&flag);
}
/***********************************************************************************
*       Descrição       :       Tela para configuração da utilização do 
*                               moedeiro MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MACESS_configura_moedeiro_mdb(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_MDB_COIN,&flag);
  
  flag = MEF_entry((char*)STRING_titulo_edita_flag_mdb_coin[idioma],flag,"ON ","OFF");    
  
  PARAMETROS_grava(ADR_FLAG_MDB_COIN,&flag);
}
/***********************************************************************************
*       Descrição       :       Tela para configuração da utilização do
*                               cartão de crédito MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MACESS_configura_cartao_mdb(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_MDB_CASHLESS,&flag);
  
  flag = MEF_entry((char*)STRING_titulo_edita_flag_mdb_cashless[idioma],flag,"ON ","OFF");    
  
  PARAMETROS_grava(ADR_FLAG_MDB_CASHLESS,&flag);
}
/***********************************************************************************
*       Descrição       :       Definie o valor do pulso para a moeda
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MACESS_configura_pulso_moeda(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned int pulso;

  PARAMETROS_le(ADR_VALOR_PULSO_MOEDEIRO,(void*)&pulso);
  if(pulso>9999)
    pulso = 5;
  
  pulso = MEI_entry((char*)STRING_titulo_edita_pulso_moeda[idioma],"%04d",pulso,5,9999);                
    
  PARAMETROS_grava(ADR_VALOR_PULSO_MOEDEIRO,(void*)&pulso);
}
/***********************************************************************************
*       Descrição       :       Tela para configuração do valor do pulso
*                               para o noteiro 
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MACESS_configura_pulso_noteiro(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned int pulso;

  PARAMETROS_le(ADR_VALOR_PULSO_NOTEIRO,(void*)&pulso);
  if(pulso>9999)
    pulso = 5;
  
  pulso = MEI_entry((char*)STRING_titulo_edita_pulso_noteiro[idioma],"%04d",pulso,5,9999);                
    
  PARAMETROS_grava(ADR_VALOR_PULSO_NOTEIRO,(void*)&pulso);
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
