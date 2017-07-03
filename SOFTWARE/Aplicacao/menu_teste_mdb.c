/*__________________________________________________________________________________
|	DEXTRO SOLUÇÕES TECNOLÓGICAS
|       
|       ITAJAÍ - SC
|       www.dextro.ind.br
| __________________________________________________________________________________
|
|       This source code was developed by DEXTRO  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by DEXTRO 
|       or its distributors.
|
|       Este código é propriedade da DEXTRO  e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       DEXTRO  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  menu_teste_mdb.c
|       Descrição          :  Menu para realizar o teste dos dispositivos MDB
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  28/02/2017
|
|       Revisões           :  1.0.0.0
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
#include "menu_teste_mdb.h"
#include "menu_ajuste_relogio.h"
#include "menu_configuracao.h"
#include "menu_edita_flag.h"
#include "menu_edita_inteiro.h"
#include "menu_edita_listagem.h"
#include "menu_info_binaria.h"
#include "menu_rolagem.h"
#include "menu_teste_hardware.h"

/***********************************************************************************
*       Definições
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/************************************************************************************
*       Funções locais
***********************************************************************************/
void MTMDB_verifica_dispositivos(void);
void MTMDB_teste_contagem_noteiro(void);
void MTMDB_teste_contagem_moedeiro(void);
void MTMDB_test_contagem_cartao(void);
void MTMDB_libera_troco(void);

/***********************************************************************************
*       Tabela de funções
***********************************************************************************/
void(*const MTMDB_func[])(void)={
  MTMDB_verifica_dispositivos,
  MTMDB_teste_contagem_noteiro,
  MTMDB_teste_contagem_moedeiro,
  MTMDB_test_contagem_cartao,
  NULL
};

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Função principal do menu de teste 
*                               do barramento MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTMDB_entry(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  
  MENUROLAGEM_show((char*)STRING_titulo_menu_mdb[idioma],
                   (char**)STRING_opcoes_menu_mdb[idioma],
                   TAM_OPCOES_MDB,
                   (void(**)(void))MTMDB_func); 
}
/***********************************************************************************
*       Descrição       :       Função para visualizar o flag de comunicação
*                               dos dispositivos MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTMDB_verifica_dispositivos(void){
  eTECLA tecla;
  unsigned char idioma = APLICACAO_carrega_idioma();
  char buffer_linha[17];
  
  SMDB_wait();
  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_devices_mdb[idioma],NULL);    
  
  for(;;){
   
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           break;
      case TECLA_ESC:
           SMDB_release(); 
           return;
      case TECLA_INC:           
           break;
      case TECLA_DEC:
           break;
    }
    
    eMDB_reply bill  = MDBILL_verifica_dispositivo();
    eMDB_reply coin  = MDBCOIN_get_device();
    eMDB_reply cashless = CASHLESS_adreess();
    
    sprintf(buffer_linha,"BV:%01d CA:%01d CD:%01d",bill==MDB_OK?1:0,coin==MDB_OK?1:0,cashless==MDB_OK?1:0);    
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
  }     
}
/***********************************************************************************
*       Descrição       :       Função para pegar o valor adicionado ao
*                               noteiro MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
extern void SMDBILL_set_bloqueio(unsigned char bloqueio);
void MTMDB_teste_contagem_noteiro(void){
  eTECLA tecla;
  unsigned char idioma = APLICACAO_carrega_idioma();
  char buffer_linha[17];  
  unsigned char flag=0;
  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_bill_mdb[idioma],NULL);   
  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           PAGAMENTOS_set_valores(0);
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           flag = 1;
           SMDBILL_set_bloqueio(1);        
           break;
      case TECLA_DEC:
           flag = 0;
           SMDBILL_set_bloqueio(0);        
           break;
    }
    
    unsigned int valor = PAGAMENTOS_get_valor_acumulado();
    sprintf(buffer_linha,"%05d[%s]",valor,flag?" LOCK ":"UNLOCK");
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
  }  
}
/***********************************************************************************
*       Descrição       :       Função para pegar o valor adicionar ao moedeiro
*                               MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
extern void SMDBCOIN_set_flag_bloqueio(unsigned char flag);
void MTMDB_teste_contagem_moedeiro(void){
  eTECLA tecla;
  unsigned char idioma = APLICACAO_carrega_idioma();
  char buffer_linha[17];  
  unsigned char flag=0;
  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_coin_mdb[idioma],NULL);   
  PAGAMENTOS_set_valores(0);
  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           MTMDB_libera_troco();
           STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_coin_mdb[idioma],NULL);              
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           flag = 1;
           SMDBCOIN_set_flag_bloqueio(1);        
           break;
      case TECLA_DEC:
           flag = 0;
           SMDBCOIN_set_flag_bloqueio(0);        
           break;
    }
    
    unsigned int valor = PAGAMENTOS_get_valor_acumulado();
    sprintf(buffer_linha,"%04d,%02d[%s]",valor/100,valor%100,flag?" LOCK ":"UNLOCK");
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
  }   
}
/***********************************************************************************
*       Descrição       :       Tela para o usuário selecionar quantas moedas
*                               serão liberadas no troco
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTMDB_libera_troco(void){
  BOARD_setter_general_purpose_counter(10000);
  eTECLA tecla;  
  unsigned char quantidade=1;
  char buffer_linha[17];
  unsigned char idioma = APLICACAO_carrega_idioma();
    
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_coin_changer_mdb[idioma],NULL);     
  for(;BOARD_getter_general_purpose_counter();){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           MDB_coin_dispenser(2,quantidade);
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
            if(quantidade<16)
              quantidade++;
           break;
      case TECLA_DEC:
           if(quantidade>1)
             quantidade--;
           break;
    }        
    
    sprintf(buffer_linha,"Moedas:%02d",quantidade);
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);    
  }  
}
/***********************************************************************************
*       Descrição       :       Função para pegar o valor adicionar ao cartão
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTMDB_test_contagem_cartao(void){
  
  
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
