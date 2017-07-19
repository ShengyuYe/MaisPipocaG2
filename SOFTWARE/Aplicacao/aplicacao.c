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
|       Arquivo            :  aplicacao.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  22/04/2017
|
|       Revisões           :  001
|
|                             (22/04/2017) criado módulo de controle da preparação (Marcos)
|                             (25/05/2017) alterado para criar o flag que habilita o 
|                                          uso do troco ou não
|                             (23/07/2017) Alterado para só rodar o bloco de verificação
|                                          do CCTALK quando ele estiver habilitado
|                                          nos acessórios
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "aplicacao.h"
#include "..\includes.h"

/***********************************************************************************
*       Constantes
***********************************************************************************/
#define TEMPO_DESUMIDIFICADOR                   1000*60*30
#define TEMPO_MENSAGEM_LINHA_INFERIOR           10000

//#define _DEBUG_PAGAMENTOS_

/***********************************************************************************
*       Enumerações
***********************************************************************************/


/***********************************************************************************
*       Variaveis 
***********************************************************************************/
xSemaphoreHandle  APLICACAO_sem_LCD;
unsigned char APLICACAO_tubos[16]={0};
unsigned int APLICACAO_tempo_desumidificador=30*1000;//TEMPO_DESUMIDIFICADOR;
unsigned int APLICACAO_tempo_mensagem=0;
/***********************************************************************************
*       Funções
***********************************************************************************/
void APLICACAO_ini(void);
void APLICACAO_tela_descanso(void);
void APLICACAO_exibe_valor(unsigned char idioma);
unsigned int APLICACACAO_verifica_troco(void);
void APLICACAO_verifica_preparacao(unsigned int valor_pipoca,unsigned char idioma,unsigned char troco);
void APLICACAO_menu_falha(void);
unsigned char APLICACAO_devolve_troco(void);
unsigned char APLICACAO_verifica_post(void);
void APLICACAO_verifica_disponibilidade_troco(unsigned char idioma);
void APLICACAO_verifica_MDB(void);
void APLICACAO_verifica_preparacao(unsigned int valor_pipoca,unsigned char idioma,
                                   unsigned char troco);
void APLICACAO_verifica_cctalk(void);
void APLICACAO_verificao_ciclica(void);
void APLICACAO_loop_falha_ciclica(void);
void APLICACAO_ciclo_desumidificador(unsigned char flag);

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Função principal da interface de usuário
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void APLICACAO_main(void*pPar){
  eTECLA tecla;
  eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
  unsigned int valorPipoca;
  unsigned char modo_gratis;
  unsigned char modo_troco;
  unsigned char flag_desumidificador;
  
  APLICACAO_ini();
  
  PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
  PARAMETROS_le(ADR_FLAG_FREE,(void*)&modo_gratis);
  PARAMETROS_le(ADR_FLAG_TROCO,(void*)&modo_troco);
  PARAMETROS_le(ADR_FLAG_DESUMIDIFICADOR,(void*)&flag_desumidificador);
  
#ifndef _DEBUG_PAGAMENTOS_
  vTaskDelay(3000);
  PREPARACAO_limpeza_inicial(idioma);
#endif
  
  
  STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);
  
  BOARD_liga_placa_instrucao(1); // Liga a placa de instrução  
  
  BOARD_setter_contador_propaganda(0); // Deixa a propaganda agendada para o primeiro ciclo
  
#ifndef _DEBUG_PAGAMENTOS_  
  APLICACAO_verifica_post();
#endif
    
  PAGAMENTOS_subtrai_valores(PAGAMENTOS_get_valor_acumulado());
  PAGAMENTOS_set_bloqueio(0);
  
  for(;;){
    
    PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
    PARAMETROS_le(ADR_FLAG_FREE,(void*)&modo_gratis);
    PARAMETROS_le(ADR_FLAG_TROCO,(void*)&modo_troco);    
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_INC:
           //SMDB_cashless_vend(100,1);
           break;
      case TECLA_DEC:
           break;
      case TECLA_ENTER:
           APLIACAO_wait_lcd();
             BOARD_liga_placa_instrucao(0);
             MCFG_entry();                     
             BOARD_liga_placa_instrucao(1);
             idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
             
             PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
             PARAMETROS_le(ADR_FLAG_FREE,(void*)&modo_gratis);
             PARAMETROS_le(ADR_FLAG_TROCO,(void*)&modo_troco);
             
             APLICACAO_tempo_desumidificador=TEMPO_DESUMIDIFICADOR;
             
           APLICACAO_release_lcd();  
           
           STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
           break;
      case TECLA_ESC:
           break;
      case TECLA_GRATIS:
           if(modo_gratis)
             PAGAMENTOS_adiciona_valores(valorPipoca);
           break;      
    }
    
    if(modo_gratis)
      STRING_write_to_external(NO_CLEAR,(void*)STRING_mensagem_modo_gratis[idioma][0],(void*)STRING_mensagem_modo_gratis[idioma][1]);
    else{
      APLICACAO_exibe_valor(idioma);     
      if(modo_troco)
        APLICACAO_verifica_disponibilidade_troco(idioma);
      // Verifica a conectividade dos
      // meios de pagamento seriais
      APLICACAO_verifica_MDB();
      APLICACAO_verifica_cctalk();
    }
    
    APLICACAO_verifica_preparacao(valorPipoca,idioma,modo_troco);             
    BOARD_setter_led_instrucao(LED_INSIRA_DINHEIRO,PISCANDO); // Ativa o modo inserir dinheiro
    APLICACAO_tela_descanso();    
#ifndef _DEBUG_PAGAMENTOS_    
    APLICACAO_verificao_ciclica();
#endif
    vTaskDelay(50);
    APLICACAO_ciclo_desumidificador(flag_desumidificador);
  }   
}
/***********************************************************************************
*       Descrição       :       Inicialização do ódulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void APLICACAO_ini(void){
  eIDIOMA idioma  = BRASIL;
       
  HD44780_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,
               LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);     
  
  HD44780_2_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,
                 LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);       
  
  STRING_write_to_internal(CLEAR_DISPLAY,
                           (char*)STRING_splash[idioma][0],
                           (char*)STRING_splash[idioma][1]);      
  
  STRING_write_to_external(CLEAR_DISPLAY,
                           (char*)STRING_mensagem_saudacao_maquina[idioma][0],
                           (char*)STRING_mensagem_saudacao_maquina[idioma][1]);      
  
  vSemaphoreCreateBinary(APLICACAO_sem_LCD);
}
/***********************************************************************************
*       Descrição       :       Semáforo para acessar o LCD
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void APLIACAO_wait_lcd(void){
  
  while(!xSemaphoreTake(APLICACAO_sem_LCD,portTICK_RATE_MS*1));
}
/***********************************************************************************
*       Descrição       :       Libera o semáforo do LCD
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void APLICACAO_release_lcd(void){
  
  xSemaphoreGive(APLICACAO_sem_LCD);
}
/***********************************************************************************
*       Descrição       :       Funções para carregar o idioma
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
unsigned char APLICACAO_carrega_idioma(void){
  unsigned char idioma  = BRASIL;
  
  PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);  
  if(idioma>QTY_OF_LANGUAGES)
    idioma = 0;
  
  return idioma;
}
/***********************************************************************************
*       Descrição       :       Tela de descanso do display interno
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void APLICACAO_tela_descanso(void){
  char buffer_linha[17];
  
  sprintf(buffer_linha,"RPM:%05d T%03doC",POTENCIA_getRPMmedido(),AA_calculaTemperatura());
  STRING_write_to_internal(NO_CLEAR,buffer_linha,NULL);    
  
  sprintf(buffer_linha,"P:%04d M:%04d,%02d",AA_mediaMovelPapel(),
                                            PAGAMENTOS_get_valor_acumulado()/100,
                                            PAGAMENTOS_get_valor_acumulado()%100);
  
  STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
}
/***********************************************************************************
*       Descrição       :       Exibe o valor da pipoca e 
*                               o quanto já foi pago pelo cliente
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void APLICACAO_exibe_valor(unsigned char idioma){
  unsigned int valor;
  char buffer_linha[17];
  static unsigned char indice=0;
  
  PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valor);
  sprintf(buffer_linha,STRING_mensagem_preco[idioma],valor/100,valor%100);
  STRING_write_to_external(NO_CLEAR,buffer_linha,NULL);    
  
  unsigned int pago = PAGAMENTOS_get_valor_acumulado();
  
  if(pago){    
    sprintf(buffer_linha,STRING_mensagem_pago[idioma],pago/100,pago%100);
    STRING_write_to_external(NO_CLEAR,NULL,buffer_linha);
  }
  else{
    if(!APLICACAO_tempo_mensagem){
      indice = (indice+1) % 4;
      APLICACAO_tempo_mensagem = TEMPO_MENSAGEM_LINHA_INFERIOR;
    }
    PARAMETROS_le(ADR_MENSAGEM_CLIENTE_01+indice,(void*)buffer_linha);
    STRING_write_to_external(NO_CLEAR,NULL,buffer_linha);
  }
}
/***********************************************************************************
*       Descrição       :       Verifica a contagem dos tubos de moeda
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero se há troco
***********************************************************************************/
unsigned int APLICACACAO_verifica_troco(void){
  
  if(MDB_coin_check_tubes(APLICACAO_tubos)){      
    return APLICACAO_tubos[2]*25;
  }
  
  return 0;
}
/***********************************************************************************
*       Descrição       :       Faz a verificação dos pagamentos para
*                               iniciar o ciclo de preparação
*       Parametros      :       (unsigned int) valor da pipoca
*       Retorno         :       nenhum
***********************************************************************************/
void APLICACAO_verifica_preparacao(unsigned int valor_pipoca,unsigned char idioma,
                                   unsigned char troco){
   unsigned int ajuste;
  
  if( PAGAMENTOS_get_valor_acumulado()>=valor_pipoca) {      
    
    if(troco==OPERA_SEM_TROCO || APLICACACAO_verifica_troco()>=valor_pipoca){     
      // Switch para 
      // capturar os resultados da execução do processo
      switch(PREPARACAO_entry(&ajuste,CONTABILIZA)){
        case SUCESSO:
             PAGAMENTOS_subtrai_valores(valor_pipoca);          
             // Devolve o troco caso ainda reste valor
             // pago no acumulador de moeda
             if(troco==OPERA_COM_TROCO && PAGAMENTOS_get_valor_acumulado()){               
               STRING_write_to_external(CLEAR_DISPLAY,
                                        (char*)STRING_mensagem_retire_troco[idioma][0],
                                        (char*)STRING_mensagem_retire_troco[idioma][1]);
               APLICACAO_devolve_troco();      
             }
             PREPARACAO_resfriamento(idioma);
             STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);                
             PAGAMENTOS_set_bloqueio(0);
             break;
        case FALHA_VENTILADOR:
             STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E0:VENTILADOR");                       
             APLICACAO_menu_falha();
             PAGAMENTOS_set_bloqueio(0);             
             break;
        case FALHA_RESISTENCIA:
             STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E1:AQUECIMENTO");
             APLICACAO_menu_falha();
             PAGAMENTOS_set_bloqueio(0);             
             break;
        case FALHA_DOSE:
             STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E2:DOSADOR");          
             APLICACAO_menu_falha();
             PAGAMENTOS_set_bloqueio(0);             
             break;
        case FALHA_EMBALAGEM:
             STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E3:EMBALAGEM");                                                 
             APLICACAO_menu_falha();
             PAGAMENTOS_set_bloqueio(0);
             break;
      }     
    }
         
    STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
    BOARD_setter_contador_propaganda(0);
  }//Fim do inicio do processo de preparação
  else
    if(troco==OPERA_COM_TROCO && !PAGAMENTOS_get_timeout_pagamento() && PAGAMENTOS_get_valor_acumulado()){        
      APLICACAO_devolve_troco();
    }  
}
/***********************************************************************************
*       Descrição       :       Tela quando há alguma falha na máquina
*       Parametros      :       (unsigned char) idioma
*       Retorno         :       nenhum
***********************************************************************************/
void APLICACAO_menu_falha(void){
  eTECLA tecla;
                 
  BOARD_setter_led_instrucao(LED_FORA_SERVICO,PISCANDO);
  APLICACAO_devolve_troco(); // Devolve o valor ao cliente
                             // devido a uma falha no sistema
  
  PAGAMENTOS_set_bloqueio(1);
  
  for(;;){
    
    APLICACAO_tela_descanso();           
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
          APLIACAO_wait_lcd();
          BOARD_liga_placa_instrucao(0);
          MCFG_entry();                     
          BOARD_liga_placa_instrucao(1);
          APLICACAO_release_lcd();             
          STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);                   
          break;
      case TECLA_ESC:
          break;
      case TECLA_INC:
          break;
      case TECLA_DEC:
          break;
    }       
  }
}
/***********************************************************************************
*       Descrição       :       Função para devolver o troco ao cliente
*       Parametros      :       (void)
*       Retorno         :       (unsigned char) maior do que zero se
*                               conseguiu devolver o troco
***********************************************************************************/
unsigned char APLICACAO_devolve_troco(void){
  unsigned int valor = PAGAMENTOS_get_valor_acumulado();
  unsigned int desconto = valor;
  unsigned char tubos[16];
  
  PAGAMENTOS_set_bloqueio(0);
  vTaskDelay(500);
  
  if(MDB_coin_check_tubes(tubos)){
      
    valor /= 25;
    PAGAMENTOS_subtrai_valores(desconto);
        
    unsigned char moedas_15 = valor /15;
    unsigned char moedas_rest = valor % 15;
        
    for(unsigned char i=0;i<moedas_15;i++){
      MDB_coin_dispenser(2,15);
      vTaskDelay(5000);      
    }
        
    if(moedas_rest){
      MDB_coin_dispenser(2,moedas_rest);
      vTaskDelay(5000);                
     }
  }
      
  return 1;      
}
/***********************************************************************************
*       Descrição       :       Faz a verificação do POST
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
unsigned char APLICACAO_verifica_post(void){
  ePOST_RESULT post = POST_entry();
  eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
  
  switch(post){
    case POST_SUCESSO:
         return 1;
    case POST_FALHA_VENTILADOR:
    case POST_FALHA_RESISTENCIA:
    case POST_FALHA_MDB_BILL:
    case POST_FALHA_MDB_COIN:
    case POST_FALHA_MDB_CASHLESS:
    case POST_FALHA_CCTALK:
    case POST_FALHA_PAPEL:
    default:
         switch(post){
           case POST_FALHA_VENTILADOR:
                STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E0:MOTOR AR");                                    
                break;
           case POST_FALHA_RESISTENCIA:
                STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E1:AQUECIMENTO");                
                break;
           case POST_FALHA_MDB_BILL:
                break;
           case POST_FALHA_MDB_COIN:
                break;
           case POST_FALHA_MDB_CASHLESS:
                break;
           case POST_FALHA_CCTALK:
                break;
           case POST_FALHA_PAPEL:   
                STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E3:EMBALAGEM");              
                break;
         }         
         
         PAGAMENTOS_set_bloqueio(1); // Bloqueia os meios de pagamento
         BOARD_liga_placa_instrucao(LED_FORA_SERVICO);
         
         for(;;){
           eTECLA tecla;
           
           tecla = TECLADO_getch();
           
           switch(tecla){
             case TECLA_ENTER:
                  APLIACAO_wait_lcd();
                  BOARD_liga_placa_instrucao(0);
                  MCFG_entry();                     
                  BOARD_liga_placa_instrucao(1);
                  idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
                  APLICACAO_release_lcd();  
           
                  STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);               
                  break;
             case TECLA_ESC:
                  break;
             case TECLA_INC:
                  break;
             case TECLA_DEC: 
                  break;
           }
           
           APLICACAO_tela_descanso();
         }       
  }
}
/***********************************************************************************
*       Descrição       :       Faz a verificação de troco para o primeiro
*                               processo
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero
*                               se houver troco suficiente
***********************************************************************************/
void APLICACAO_verifica_disponibilidade_troco(unsigned char idioma){
  unsigned char flag_notas;
  unsigned int maior_nota=0;
  eTECLA tecla;
  
  PARAMETROS_le(ADR_NOTAS,(void*)&flag_notas);
  if(flag_notas&0x01)
    maior_nota = 100;
  if(flag_notas&0x02)
    maior_nota = 200;
  if(flag_notas&0x04)
    maior_nota = 500;
  if(flag_notas&0x08)
    maior_nota = 1000;
  if(flag_notas&0x10)
    maior_nota = 2000;
  /*
  if(flag_notas&0x20)
    maior_nota = 5000;
  */
  
  if( APLICACACAO_verifica_troco()<maior_nota){
    
    BOARD_setter_led_instrucao(LED_FORA_SERVICO,PISCANDO);
    PAGAMENTOS_set_bloqueio(1);
    STRING_write_to_external(CLEAR_DISPLAY,
                             (char*)STRING_mensagem_sem_troco[idioma][0],
                             (char*)STRING_mensagem_sem_troco[idioma][1]);    
    
    for(;APLICACACAO_verifica_troco()<maior_nota;){
        
      tecla = TECLADO_getch();
      switch(tecla){
        case TECLA_ENTER:
            APLIACAO_wait_lcd();
            BOARD_liga_placa_instrucao(0);
            MCFG_entry();                     
            BOARD_liga_placa_instrucao(1);
            idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
            APLICACAO_release_lcd();             
            STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);        
            break;
        case TECLA_ESC:
            break;
      }    
      
      APLICACAO_tela_descanso();      
    }//Fim do for(;;)        
    PAGAMENTOS_set_bloqueio(0);
    BOARD_liga_placa_instrucao(0);
    BOARD_liga_placa_instrucao(1);
    BOARD_setter_led_instrucao(LED_INSIRA_DINHEIRO,PISCANDO);
  }  
}
/***********************************************************************************
*       Descrição       :       Verifica o barramento MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void APLICACAO_verifica_MDB(void){
  eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
  
  switch(MDB_checa_dispositivos()){
    case MDB_TODOS_ONLINE:            
         return;
    case MDB_BILL_OFFLINE:
         STRING_write_to_external(CLEAR_DISPLAY,
                                  (char*)STRING_mensagem_noteiro_mdb_offline[idioma][0],
                                  (char*)STRING_mensagem_noteiro_mdb_offline[idioma][1]);          
         break;
    case MDB_COIN_OFFLINE:
         STRING_write_to_external(CLEAR_DISPLAY,
                                  (char*)STRING_mensagem_moedeiro_mdb_offline[idioma][0],
                                  (char*)STRING_mensagem_moedeiro_mdb_offline[idioma][1]);           
         break;
  }  
  
  eTECLA tecla;
  
  for(;;){
    
    if(MDB_checa_dispositivos()==MDB_TODOS_ONLINE)
      return;
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
            APLIACAO_wait_lcd();
            BOARD_liga_placa_instrucao(0);
            MCFG_entry();                     
            BOARD_liga_placa_instrucao(1);
            idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
            APLICACAO_release_lcd();             
            STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);              
           break;
      case TECLA_ESC:
           break;
    }    
    APLICACAO_tela_descanso();      
    vTaskDelay(500);
  }
}
/***********************************************************************************
*       Descrição       :       Faz a verificação do meio de pagamento
*                               CCTALK
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void APLICACAO_verifica_cctalk(void){
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_BV20,(void*)&flag);
  
  if(!flag)
    return;  
  
  eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
  eBV20_state estado_atual = BV20_get_current_state();
  
  if(estado_atual!=BV20_OFFLINE)
    return;
  
  STRING_write_to_external(CLEAR_DISPLAY,
                           (char*)STRING_mensagem_cctalk_offline[idioma][0],
                           (char*)STRING_mensagem_cctalk_offline[idioma][1]);       
    
  eTECLA tecla;
  
  for(;;){
    
    estado_atual = BV20_get_current_state();
    
    if(estado_atual!=BV20_OFFLINE)
      return;
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
            BOARD_reset_tempo_propaganda();
            APLIACAO_wait_lcd();
            BOARD_liga_placa_instrucao(0);
            MCFG_entry();                     
            BOARD_liga_placa_instrucao(1);
            idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
            APLICACAO_release_lcd();             
            STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);              
            BOARD_reset_tempo_propaganda();
           break;
      case TECLA_ESC:
           break;
    }    
    APLICACAO_tela_descanso();      
    vTaskDelay(500);
  }    
}
/***********************************************************************************
*       Descrição       :       Faz a verificação cíclica dos sinais 
*                               do papel e do termistor
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void APLICACAO_verificao_ciclica(void){
  
  switch(POST_verificacao_ciclica()){
   case POST_CICLICO_SUCESSO:
        break;
   case POST_CICLICO_FALHA_EMBALAGEM:
        STRING_write_to_external(CLEAR_DISPLAY,"E03:FALTA","EMBALAGEM");
        APLICACAO_loop_falha_ciclica();
        break;
   case POST_CICLICO_FALHA_TERMISTOR:
        STRING_write_to_external(CLEAR_DISPLAY,"E04:FALHA","SENS. TEMP.");
        APLICACAO_loop_falha_ciclica();
        break;
  }  
}
/***********************************************************************************
*       Descrição       :       Menu do loop onde há a falha no sensor de
*                               temperatura ou falta de embalagem
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void APLICACAO_loop_falha_ciclica(void){
  eTECLA tecla;
  unsigned char loop=1;
    
  for(;loop;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
          MCFG_entry();                     
           break;
      case TECLA_ESC:
           loop = 0;
           break;
    }      
    
    APLICACAO_tela_descanso();    
  }  
  
  STRING_write_to_internal(CLEAR_DISPLAY,"REINICIANDO","VERIFICACAO");
  vTaskDelay(3000);  
}
/***********************************************************************************
*       Descrição       :       Ciclo de desumidificação da máquina
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void APLICACAO_ciclo_desumidificador(unsigned char flag){
  
  if(flag && !APLICACAO_tempo_desumidificador){
    
    unsigned int tempo=30000;
    
    STRING_write_to_internal(CLEAR_DISPLAY,"CICLO DE","DESUMIDIFICACAO");
    STRING_write_to_external(CLEAR_DISPLAY,"CICLO DE","DESUMIDIFICACAO");
    
    POTENCIA_set_neutro(1);
    POTENCIA_setRPM(6000);
    CT_set_temperatura(60);
    vTaskDelay(3000);
    
    while(tempo--){
      
      if(POTENCIA_getRPMmedido()<1000){
        CT_set_temperatura(0);
        POTENCIA_setRPM(0);
        POTENCIA_set_neutro(0);        
        return;
      }
      vTaskDelay(1);
    }
    
    CT_set_temperatura(0);
    POTENCIA_setRPM(0);
    POTENCIA_set_neutro(0);
    APLICACAO_verifica_post();
    APLICACAO_tempo_desumidificador = TEMPO_DESUMIDIFICADOR;
  }
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/