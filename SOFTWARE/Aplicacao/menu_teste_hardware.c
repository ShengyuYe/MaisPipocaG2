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
|       Arquivo            :  menu_teste_hardware.c
|       Descrição          :  Funções do menu de teste do hardware
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  16/02/2017
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
#include "menu_configuracao.h"
#include "menu_edita_flag.h"
#include "menu_edita_inteiro.h"
#include "menu_edita_listagem.h"
#include "menu_info_binaria.h"
#include "menu_rolagem.h"
#include "menu_teste_hardware.h"
#include "menu_teste_mdb.h"
/***********************************************************************************
*       Definições locais
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Funções locais
***********************************************************************************/
void MTH_teste_rtc(void);
void MTH_teste_data_flash(void);
void MTH_teste_dispensador_papel(void);
void MTH_teste_dosador_milho(void);
void MTH_teste_ventilador(void);
void MTH_teste_panela(void);
void MTH_tela_teste_cctalk(void);
void MTH_tela_teste_uca1(void);
void MTH_tela_teste_p70(void);
void MTH_tela_placa_instrucao(void);
void MTH_tela_teste_lcd_externo(void);
void MTH_tela_teste_impressora(void);
void MTH_teste_musica(void);
void MTH_teste_locucoes(void);

/***********************************************************************************
*       Tabela de funções
***********************************************************************************/
void(*const MTH_funcs[TAM_OPCOES_HARDWARE])(void)={
  MTH_teste_rtc,
  MTH_teste_data_flash,
  MTH_teste_dispensador_papel,
  MTH_teste_dosador_milho,
  MTH_teste_ventilador,
  MTH_teste_panela,
  MTH_tela_teste_cctalk,
  MTH_tela_teste_uca1,
  MTH_tela_teste_p70,
  MTMDB_entry,
  MTH_tela_teste_impressora,
  MTH_teste_musica,
  MTH_teste_locucoes,
  MTH_tela_placa_instrucao,
  MTH_tela_teste_lcd_externo,
  NULL
};

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Ponto de entrada do menu de teste do hardware
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_entry(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  
  MENUROLAGEM_show((char*)STRING_titulo_teste_hardware[idioma],
                   (char**)STRING_menu_teste_hardware[idioma],
                   TAM_OPCOES_HARDWARE,
                   (void(**)(void))MTH_funcs);   
}
/***********************************************************************************
*       Descrição       :       Exibe no display a contagem do RTC
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_teste_rtc(void){
  eTECLA tecla;
  unsigned char idioma = APLICACAO_carrega_idioma();  
  unsigned char hora,minuto,segundo,dia,mes;
  unsigned int ano;
  char buffer_linha[17];
  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_rtc[idioma],NULL);  
  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           RTC_setValue(23,59,30,0,0,0);
           break;
      case TECLA_DEC:
           RTC_setValue(0,0,0,0,0,0);
           break;
    }
    
    RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);    
    sprintf(buffer_linha,"%02d:%02d:%02d",hora,minuto,segundo);
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
    
    vTaskDelay(50);
  }    
}
/***********************************************************************************
*       Descrição       :       Executa um passo no teste da memória dataflash
*       Parametros      :       (unsigned char) passo atual
*       Retorno         :       (unsigned char) novo passo
***********************************************************************************/
unsigned char MTH_passo_teste_data_flash(unsigned char idioma,unsigned char passo){  
  /*
  unsigned char buffer[64];
  
  switch(passo){
    case 0:
            STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_passos_teste_dataflash[idioma][0]);
            for(unsigned char i=0;i<64;i++)
              buffer[i] = i;
            MEMORYWRAPPER_writeBytes(ADR_AREA_TESTE,buffer,64);
            passo = 1;
            break;
    case 1:
            STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_passos_teste_dataflash[idioma][1]);
            MEMORYWRAPPER_readBytes(ADR_AREA_TESTE,buffer,64);
            passo = 2;
            for(unsigned char i=0;i<64;i++)
              if(buffer[i]!=i)
                passo = 3;
            break;
    case 2:
            STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_passos_teste_dataflash[idioma][2]);
            passo = 0;
            break;
    case 3:
            STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_passos_teste_dataflash[idioma][3]);
            passo = 0;
            break;
  }
  
  return passo;
  */
  return 0;
}
/***********************************************************************************
*       Descrição       :       Faz  o teste da memória flash
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_teste_data_flash(void){
  eTECLA tecla;
  unsigned char idioma = APLICACAO_carrega_idioma();  
  unsigned char tempo=1;
  unsigned char passo=0;

  srand(100);  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_data_flash[idioma],NULL);  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:        
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           break;
      case TECLA_DEC:
           break;
    }
    
    // 
    //  Executa o teste
    //
    if(!--tempo){
      tempo = 10;      
      passo = MTH_passo_teste_data_flash(idioma,passo);      
    }    
    
    vTaskDelay(50);
  }    
}
/***********************************************************************************
*       Descrição       :       Teste do controle do dispensador de
*                               embalagem
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_teste_dispensador_papel(void){
  eTECLA tecla;
  unsigned char idioma = APLICACAO_carrega_idioma();  
  char buffer_linha[17];

  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_tela_teste_dispensador_papel[idioma],NULL);  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           BOARD_set_motor_embalagem(1);
           break;
      case TECLA_DEC:
           BOARD_set_motor_embalagem(0);
           break;
    }
    
    unsigned char barreira = GET_BARREIRA_SAIDA_PAPEL();
    unsigned int nivelPapel = AA_mediaMovelPapel();
    unsigned char reserva = GET_SENSOR_RESERVA_PAPEL();
    
    nivelPapel *= 100;
    nivelPapel>>= 12;
    
    sprintf(buffer_linha,"BP:%01d-NP:%03d-RP:%1d",barreira==BARREIRA_PAPEL_LIVRE?0:1,nivelPapel,reserva?1:0);
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
    
    vTaskDelay(50);
  }    
}
/***********************************************************************************
*       Descriçao       :       Teste do dosador do milho
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_teste_dosador_milho(void){
  eTECLA tecla;  
  unsigned char idioma = APLICACAO_carrega_idioma();  
  char buffer_linha[17];
  eMOTOR_DOSE estado=PARADO;
    
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_tela_teste_dosador[idioma],NULL);    
  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           BOARD_set_motor_dose(PARADO);
           estado = PARADO;        
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           BOARD_set_motor_dose(DOSAR);
           estado = DOSAR;
           break;
      case TECLA_DEC:
           BOARD_set_motor_dose(REVERTER);
           estado = REVERTER;
           break;
    }
   
    unsigned char sensor_dose = GET_SENSOR_DOSE();
    sprintf(buffer_linha,"SD:%01d - M:%s",sensor_dose,STRING_texto_teste_motor[idioma][estado]);
    
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);    
    vTaskDelay(50);
  }   
}
/***********************************************************************************
*       Descrição       :       Teste de controle do motor AC
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_teste_ventilador(void){
  eTECLA tecla;  
  unsigned char idioma = APLICACAO_carrega_idioma();  
  char buffer_linha[17];
  unsigned int contagem_atual=4000;
  unsigned int ultima_contagem=4000;
    
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_ventilador[idioma],NULL);      
  POTENCIA_set_neutro(1);
  BOARD_setter_general_purpose_counter(0);
  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           POTENCIA_setRPM(0);
      case TECLA_ESC:
           POTENCIA_setRPM(0);        
           POTENCIA_set_neutro(0);
           return;
      case TECLA_INC:
           if(contagem_atual<18000)
             contagem_atual+=100;
           BOARD_setter_general_purpose_counter(3000);
           break;
      case TECLA_DEC:
           if(contagem_atual>1000)
             contagem_atual-=100;
           BOARD_setter_general_purpose_counter(3000);
           break;
    }
    
    unsigned short int frequencia=POTENCIA_getFrequenciaRede();
    unsigned short int rotacao = POTENCIA_getRPMmedido();
    
    if(!BOARD_getter_general_purpose_counter()){
      
      if(contagem_atual!=ultima_contagem){
        POTENCIA_setRPM(contagem_atual);
        ultima_contagem = contagem_atual;
        sprintf(buffer_linha,"F:%02dHz-RPM:%05d",frequencia,rotacao);
        STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_ventilador[idioma],buffer_linha);        
      }
      else{        
        sprintf(buffer_linha,"F:%02dHz-RPM:%05d",frequencia,rotacao);
        STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
      }
    }
    else{
      sprintf(buffer_linha," SET RPM:%05d  ",contagem_atual);
      STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);            
    }
    
    vTaskDelay(50);
  }    
}
/***********************************************************************************
*       Descrição       :       Menu para testar a panela
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_teste_panela(void){
  eTECLA tecla;
  unsigned char idioma = APLICACAO_carrega_idioma();  
  char buffer_linha[17];
  unsigned char flag=0;
  unsigned char trap=0;
  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_panela[idioma],NULL);      
  POTENCIA_setRPM(5000);  
  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           trap ^= 255;
           POTENCIA_set_neutro(trap);
           break;
      case TECLA_ESC:
           POTENCIA_setRPM(0);
           return;
      case TECLA_INC:
           flag = 1;
           BOARD_setter_general_purpose_counter(3000);           
           CT_set_temperatura(60);        
           break;
      case TECLA_DEC:
           flag = 0;
           CT_set_temperatura(0);                
           break;
    }
    
    unsigned short int resistencia = AA_calculaResistorInteiro();
    unsigned short int temperatura = AA_calculaTemperatura();
    
    sprintf(buffer_linha,"%05dR-%03doC-R:%01d",resistencia,temperatura,flag);   
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
  }  
}
/***********************************************************************************
*       Descrição       :       Tela para testar o noteiro CCTALK
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_tela_teste_cctalk(void){
  eTECLA tecla;  
  unsigned char idioma = APLICACAO_carrega_idioma();  
  char buffer_linha[17];
  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_teste_BV20[idioma],NULL);      
  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           BV20_subtrai_valor_acumulado(BV20_get_valor_acumulador());
           break;
      case TECLA_ESC:
           return;
    }
    
    sprintf(buffer_linha,"T=%04d-Ev=%1d",BV20_get_valor_acumulador(),BV20_get_ultimo_evento());
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
    
    vTaskDelay(50);
  }  
}
/***********************************************************************************
*       Descrição       :       Tela para testar o moedeiro tipo pulso
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_tela_teste_uca1(void){
  eTECLA tecla;
  unsigned char idioma = APLICACAO_carrega_idioma();  
  char buffer_linha[17];
  unsigned char flag=0;
  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_teste_uca1[idioma],NULL);     
  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           PAGAMENTOS_subtrai_contagem_uca1(PAGAMENTOS_get_contagem_uca1());
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           flag = 1;
           break;
      case TECLA_DEC:
           flag = 0;
           break;
    }
    
    sprintf(buffer_linha,"%04d-[%s]",PAGAMENTOS_get_contagem_uca1(),flag?"LOCK  ":"UNLOK");
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
    
    PAGAMENTOS_bloqueia_uca1(flag);
    vTaskDelay(50);
  }  
}
/***********************************************************************************
*       Descrição       :       Tela para testar o noteiro pulso
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_tela_teste_p70(void){
  eTECLA tecla;
  unsigned char idioma = APLICACAO_carrega_idioma();  
  char buffer_linha[17];
  unsigned char flag=0;
  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_teste_P70[idioma],NULL);     
  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           PAGAMENTOS_subtrai_contagem_p70(PAGAMENTOS_get_contagem_p70());
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           flag = 1;
           break;
      case TECLA_DEC:
           flag = 0;
           break;
    }
    
    sprintf(buffer_linha,"%04d-[%s]",PAGAMENTOS_get_contagem_p70(),flag?"LOCK  ":"UNLOK");
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
    
    PAGAMENTOS_set_inhibit_p70(flag);
    vTaskDelay(50);
  }  
}
/***********************************************************************************
*       Descrição       :       Tela para o teste dos leds da placa
*                               de instrução
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_tela_placa_instrucao(void){
  eTECLA tecla;
  unsigned char idioma = APLICACAO_carrega_idioma();  
  char buffer_linha[17];
  unsigned char indice=0;
  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_teste_led_instrucao[idioma],NULL);    
  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC: 
           for(unsigned char i=0;i<8;i++)
             LEDS_setter_led(i,0);
           indice = (indice+1) % 8;
           LEDS_setter_led(indice,1);
           break;
      case TECLA_DEC:
           for(unsigned char i=0;i<8;i++)
             LEDS_setter_led(i,0);   
           if(indice)
             indice = 7;
           else
             indice--;
           LEDS_setter_led(indice,1);
           break;
    }
    
    sprintf(buffer_linha,"LED:[%01d]",indice);
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
            
    vTaskDelay(50);
  }
}
/***********************************************************************************
*       Descrição       :       Menu para teste do LCD externo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_tela_teste_lcd_externo(void){
  eTECLA tecla;
  unsigned char idioma = APLICACAO_carrega_idioma();  
  char buffer_linha[17]={0};
  char first=' ';
  unsigned char ciclos=1;
    
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_lcd_externo[idioma],NULL);    
  
  for(;;){
   
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           break;
      case TECLA_DEC:
           break;
    }       
    
    for(unsigned char i=0;i<16;i++)
      buffer_linha[i] = first;
        
    STRING_write_to_external(NO_CLEAR,buffer_linha,buffer_linha);
    
    if(!--ciclos){
      ciclos = 10;
      first++;      
    }
    
    vTaskDelay(50);    
  }  
}
/***********************************************************************************
*       Descrição       :       Tela para realizar o teste da impressora
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_tela_teste_impressora(void){
  eTECLA tecla;
  unsigned char idioma = APLICACAO_carrega_idioma();  

  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_impresora[idioma][0],(char*)STRING_titulo_teste_impresora[idioma][1]);      
  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           STRING_write_to_internal(NO_CLEAR,NULL,"      ...       ");
           IMPRESSORA_impressora_teste();
           STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_titulo_teste_impresora[idioma][1]);               
           break;
      case TECLA_ESC:
           return;
      case TECLA_INC:
           break;
      case TECLA_DEC:
           break;
    }       
    
    vTaskDelay(50);
  }  
}
/***********************************************************************************
*       Descrição       :       Interface para teste da música
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_teste_musica(void){
  eTECLA tecla;
  char buffer_linha[17];
  unsigned char idioma = APLICACAO_carrega_idioma();    
  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_menu_teste_musica[idioma],NULL);
      
  for(;;){
            
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           PLAYER_interrompeMusica();
           vTaskDelay(5);
           PLAYERWAVE_iniciaMusica(1,0);           
           break;
      case TECLA_ESC:
           PLAYER_interrompeMusica();
           return;
    }
    
    sprintf(buffer_linha,"[%s]",PLAYERWAVE_verificaToque()?"PLAY":"STOP");
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);    
  }
}
/***********************************************************************************
*       Descrição       :       Interface para realizar o teste das
*                               locuções
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MTH_teste_locucoes(void){
  eTECLA tecla;
  unsigned char idioma = APLICACAO_carrega_idioma();    
  char buffer_linha[17];
  const char toques[3]={0,2,3};
  unsigned char indice=0;
  
  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_menu_teste_vozes[idioma],NULL);
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           PLAYER_interrompeMusica();        
           vTaskDelay(5);
           PLAYERWAVE_iniciaMusica(toques[indice],0);  
           break;
      case TECLA_ESC:
           PLAYER_interrompeMusica();
           return;
      case TECLA_INC:
           indice = (indice+1) % 3;
           break;
      case TECLA_DEC:
           if(indice)
             indice--;
           else
             indice = 2;
           break;
    }
    
    sprintf(buffer_linha,"[%s][i:%01d]",PLAYERWAVE_verificaToque()?"PLAY":"STOP",indice+1);
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);        
  }  
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/