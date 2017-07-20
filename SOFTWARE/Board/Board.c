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
|       Arquivo            :  board.c
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
#include <nxp\iolpc1768.h>
#include "..\includes.h"

/***********************************************************************************
*       Definições
***********************************************************************************/
#define TAM_BUFFER_SENSORES             16

#define LED_STATUS_PIN                  (0x01)<<16
#define INI_LED_PINS()                  FIO1DIR|=LED_STATUS_PIN
#define SET_LED_STATUS(X)               X?(FIO1SET|=LED_STATUS_PIN):(FIO1CLR|=LED_STATUS_PIN)

#define SENSOR_BARREIRA_PAPEL_PIN       (0x01)<<25
#define GET_BARREIRA_SAIDA_PAPEL_PIN()  FIO0PIN&SENSOR_BARREIRA_PAPEL_PIN?0:1


#define MOTOR_EMBALAGEM_PIN             (0x01)<<0
#define INI_MOTOR_EMBALAGEM_PIN()       FIO1DIR|=MOTOR_EMBALAGEM_PIN
#define SET_MOTOR_EMBALAGEM_PIN(X)      X?(FIO1SET|=MOTOR_EMBALAGEM_PIN):(FIO1CLR|=MOTOR_EMBALAGEM_PIN)


#define FIM_DO_PAPEL_PIN                (0x01)<<1
#define GET_SENSOR_FIM_PAPEL_PIN()      (FIO1PIN&FIM_DO_PAPEL_PIN)?0:1

#define HIGH_SIDE_ESQUERDA              (0x01)<<28
#define LOW_SIDE_ESQUERDA               (0x01)<<29

#define HIGH_SIDE_DIREITA               (0x01)<<30
#define LOW_SIDE_DIREITA                ((unsigned int)(0x01)<<31)

#define INI_EMBALAGEM_PINS()            FIO1DIR|=HIGH_SIDE_ESQUERDA|LOW_SIDE_ESQUERDA|HIGH_SIDE_DIREITA|LOW_SIDE_DIREITA;FIO1CLR|=HIGH_SIDE_ESQUERDA|LOW_SIDE_ESQUERDA|HIGH_SIDE_DIREITA|LOW_SIDE_DIREITA

#define SET_HIGH_SIDE_ESQUERDA(X)       X?(FIO1SET|=HIGH_SIDE_ESQUERDA):(FIO1CLR|=HIGH_SIDE_ESQUERDA)
#define SET_LOW_SIDE_ESQUERDA(X)        X?(FIO1SET|=LOW_SIDE_ESQUERDA):(FIO1CLR|=LOW_SIDE_ESQUERDA)

#define SET_HIGH_SIDE_DIREITA(X)        X?(FIO1SET|=HIGH_SIDE_DIREITA):(FIO1CLR|=HIGH_SIDE_DIREITA)
#define SET_LOW_SIDE_DIREITA(X)         X?(FIO1SET|=LOW_SIDE_DIREITA):(FIO1CLR|=LOW_SIDE_DIREITA)

#define SENSOR_DOSE_PIN                 (0x01)<<15
#define GET_SENSOR_DOSE_PIN()           (FIO1PIN&SENSOR_DOSE_PIN)?0:1


#define FITA_LED_01_PIN                 (0x01)<<28
#define SET_FITA_LED_01(X)              X?(FIO4SET|=FITA_LED_01_PIN):(FIO4CLR|=FITA_LED_01_PIN)

#define FITA_LED_02_PIN                 (0x01)<<29
#define SET_FITA_LED_02(X)              X?(FIO4SET|=FITA_LED_02_PIN):(FIO4CLR|=FITA_LED_02_PIN)

#define FITA_LED_INI()                  FIO4DIR |= FITA_LED_01_PIN | FITA_LED_02_PIN

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned short int BOARD_buffer_entradas_digitais[TAM_BUFFER_SENSORES]={0};
unsigned int BOARD_general_purpose_counter=0;
extern unsigned int PREPARACAO_cnt_preparo;
extern unsigned int PREPARACAO_cnt_rampa;
unsigned char BOARD_leds_instrucao=1;
eLED_STATE BOARD_estado_leds[8]={APAGADO};
extern unsigned int PAGAMENTOS_timeout_pagamento;
unsigned int BOARD_contador_propaganda=10*60000;
unsigned int BOARD_intervalo_propaganda=0;
unsigned int BOARD_lock_timer;
unsigned int APLICACAO_tempo_compensacao;
extern unsigned int MCS_contadorSemente;
extern unsigned int HD44780_2_tempoRefreshSegundoLCD;
extern unsigned int PREPARACAO_contador_compensacao;
extern unsigned int APLICACAO_tempo_desumidificador;
extern unsigned int SMC_contador;
extern unsigned int APLICACAO_tempo_mensagem;
extern unsigned int PREPARACAO_compensador;

/***********************************************************************************
*       Funções locais
***********************************************************************************/
void BOARD_instrucao_leds(void);

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Inicialização da camada board
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void BOARD_ini(void){  
  INI_MOTOR_EMBALAGEM_PIN();
    
  CCTALK_ini();
  PAGAMENTOS_ini();
  PAGAMENTOS_set_bloqueio(1);
  BOARD_set_motor_dose(PARADO);
  INI_EMBALAGEM_PINS();
  INI_MOTOR_EMBALAGEM_PIN();
  INI_LED_PINS();    
  PARAMETROS_ini();
  AA_ini();
  POTENCIA_ini();
  CT_ini();
  LEDS_ini();
  MDB_ini();
  FITA_LED_INI();
  PLAYERWAVE_ini();
  SERIALMUX_ini();
  // Deixa a porta serial RS232
  // habilitada direto
  SERIALMUX_seleciona(SERIALMUX_RS232);
}
/***********************************************************************************
*       Descrição       :       Tick de timer para o módulo board
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void BOARD_timer_tick(void){
  static unsigned char indice=0;  
  unsigned short int temp=0;
  
  POTENCIA_timerTick();
  TECLADO_timerTick();  
  RTC_init();
  AA_amostragemAnalogica();
  CT_timer_tick();
  PAGAMENTOS_timer_tick();
  
  if(BOARD_general_purpose_counter)
    BOARD_general_purpose_counter--;
  
  if(PREPARACAO_cnt_preparo)
    PREPARACAO_cnt_preparo--;
  
  if(PREPARACAO_cnt_rampa)
    PREPARACAO_cnt_rampa--;
  
  if(PAGAMENTOS_timeout_pagamento)
    PAGAMENTOS_timeout_pagamento--;
  
  if(BOARD_contador_propaganda)
    BOARD_contador_propaganda--;
  
  if(BOARD_lock_timer)
    BOARD_lock_timer--;
  
  if(HD44780_2_tempoRefreshSegundoLCD)
    HD44780_2_tempoRefreshSegundoLCD--;
  
  if(PREPARACAO_contador_compensacao)
    PREPARACAO_contador_compensacao--;
  
  if(APLICACAO_tempo_desumidificador)
    APLICACAO_tempo_desumidificador--;
  
  if(SMC_contador)
    SMC_contador--;
  
  if(APLICACAO_tempo_mensagem)
    APLICACAO_tempo_mensagem--;
  
  if(!APLICACAO_tempo_compensacao){
    APLICACAO_tempo_compensacao = 120000;
    if(PREPARACAO_compensador)
      PREPARACAO_compensador--;
  }
  else
    APLICACAO_tempo_compensacao--;
  
  MCS_contadorSemente++;
  
  // Reedswitch que detecta
  // a posição da dosador do milho
  temp |= GET_SENSOR_DOSE_PIN();
  temp<<=1;
  
  // Sensor da chave de fim de curso
  // que indica a reserva do papel
  temp |= GET_SENSOR_FIM_PAPEL_PIN();
  temp<<=1;
  
  // Sensor da barreira óptica
  temp |= GET_BARREIRA_SAIDA_PAPEL_PIN();  
  
  BOARD_buffer_entradas_digitais[indice] = temp;
  indice = (indice+1) % TAM_BUFFER_SENSORES;
}
/***********************************************************************************
*       Descrição       :       Função principal da thread board
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void BOARD_main(void*pPar){
  unsigned char toggle=0;
  unsigned char flag;
  
  PARAMETROS_le(ADR_INTERVALO_TEMPO_PROP,(void*)&BOARD_intervalo_propaganda);
  if(BOARD_intervalo_propaganda>60)
    BOARD_intervalo_propaganda = 60;
  
  PARAMETROS_le(ADR_FLAG_FITA_LED,(void*)&flag);
  
  for(;;){
  
    toggle ^= 255;
    
    if(flag){
      if(toggle){
        SET_LED_STATUS(1);
        SET_FITA_LED_01(1);
        SET_FITA_LED_02(0);
      }
      else{           
        SET_LED_STATUS(0);
        SET_FITA_LED_01(0);
        SET_FITA_LED_02(1);      
      }
    }
    else{
      SET_FITA_LED_01(0);      
      SET_FITA_LED_02(0);
      SET_LED_STATUS(toggle);
    }
    
    vTaskDelay(250);       
      
    BOARD_instrucao_leds();
    
    // Roda a propaganda no intervalo
    // de tempo programaddo
    if(!BOARD_contador_propaganda){      
      if(BOARD_intervalo_propaganda){
        PLAYERWAVE_iniciaMusica(AUDIO_PROPAGANDA,0);        
      }
      BOARD_contador_propaganda = BOARD_intervalo_propaganda*60000;
    }
    
  }// Fim for(;;)
}
/***********************************************************************************
*       Descrição       :       Verifica se um dos sinais está ativo
*       Parametros      :       (unsigned char) bit
*       Retorno         :       (unsigned char) maior do que zero
*                               se a entrada estiver acionada
***********************************************************************************/
unsigned char BOARD_get_sinal(eSINAL sinal){
  unsigned char contador=0;  
  
  for(unsigned char i=0;i<TAM_BUFFER_SENSORES;i++)
    if(BOARD_buffer_entradas_digitais[i]&(0x01<<sinal))
      contador++;
  
  if(contador>(TAM_BUFFER_SENSORES>>1))
    return 1;
  
  return 0;
}
/***********************************************************************************
*       Descrição       :       Liga o mosfet da saída de embalagem
*       Parametros      :       (unsigned char) valor
*       Retorno         :       nenhum
***********************************************************************************/
void BOARD_set_motor_embalagem(unsigned char flag){
  
  SET_MOTOR_EMBALAGEM_PIN(flag);
}
/***********************************************************************************
*       Descrição       :       Setter para o controle do motor da embalagem
*       Parametros      :       (eMOTOR_DOSE) estado do motor
*       Retorno         :       nenhum
***********************************************************************************/
void BOARD_set_motor_dose(eMOTOR_DOSE sentido){
  
  switch(sentido){
    case PARADO:  
         SET_HIGH_SIDE_ESQUERDA(0);
         SET_LOW_SIDE_ESQUERDA(0);
         SET_HIGH_SIDE_DIREITA(0);
         SET_LOW_SIDE_DIREITA(0);
         break;
    case DOSAR:
         SET_HIGH_SIDE_DIREITA(0);
         SET_LOW_SIDE_ESQUERDA(0);
         vTaskDelay(50);
         SET_HIGH_SIDE_ESQUERDA(1);
         SET_LOW_SIDE_DIREITA(1);
         break;
    case REVERTER:
         SET_HIGH_SIDE_ESQUERDA(0);
         SET_LOW_SIDE_DIREITA(0);     
         vTaskDelay(50);         
         SET_HIGH_SIDE_DIREITA(1);
         SET_LOW_SIDE_ESQUERDA(1);         
         break;
  }
}
/***********************************************************************************
*       Descrição       :       Setter para o contador de uso geral
*       Parametros      :       (unsigned int) valor de preset
*       Retorno         :       nenhum
***********************************************************************************/
void BOARD_setter_general_purpose_counter(unsigned int preset){
  
  BOARD_general_purpose_counter = preset;
}
/***********************************************************************************
*       Descrição       :       Getter para o contador de uso geral
*       Parametros      :       (nenhum)
*       Retorno         :       (unsigned int) valor da contagem
***********************************************************************************/
unsigned int BOARD_getter_general_purpose_counter(void){
  
  return BOARD_general_purpose_counter;
}
/***********************************************************************************
*       Descrição       :       Controla a piscada dos leds da placa de 
*                               instrução
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void BOARD_instrucao_leds(void){
  static unsigned char toggle=0;
  
  if(!BOARD_leds_instrucao)
    return;
  
  toggle ^= 255;
  //---------------------------------------------------
  if(BOARD_estado_leds[LED_INSIRA_DINHEIRO] == APAGADO)
    LEDS_setter_led(LED_INSIRA_DINHEIRO,0);
  else
    if(BOARD_estado_leds[LED_INSIRA_DINHEIRO] == ACESO)
      LEDS_setter_led(LED_INSIRA_DINHEIRO,1);
    else
      LEDS_setter_led(LED_INSIRA_DINHEIRO,toggle);
  //---------------------------------------------------
  if(BOARD_estado_leds[LED_PEGUE_PACOTE] == APAGADO)
    LEDS_setter_led(LED_PEGUE_PACOTE,0);
  else
    if(BOARD_estado_leds[LED_PEGUE_PACOTE] == ACESO)
      LEDS_setter_led(LED_PEGUE_PACOTE,1);
    else
      LEDS_setter_led(LED_PEGUE_PACOTE,toggle);  
  //---------------------------------------------------
  if(BOARD_estado_leds[LED_MONTE_PACOTE] == APAGADO)
    LEDS_setter_led(LED_MONTE_PACOTE,0);
  else
    if(BOARD_estado_leds[LED_MONTE_PACOTE] == ACESO)
      LEDS_setter_led(LED_MONTE_PACOTE,1);
    else
      LEDS_setter_led(LED_MONTE_PACOTE,toggle);      
  //---------------------------------------------------
  if(BOARD_estado_leds[LED_INSIRA_PACOTE] == APAGADO)
    LEDS_setter_led(LED_INSIRA_PACOTE,0);
  else
    if(BOARD_estado_leds[LED_INSIRA_PACOTE] == ACESO)
      LEDS_setter_led(LED_INSIRA_PACOTE,1);
    else
      LEDS_setter_led(LED_INSIRA_PACOTE,toggle);   
  //---------------------------------------------------
  if(BOARD_estado_leds[LED_FORA_SERVICO] == APAGADO)
    LEDS_setter_led(LED_FORA_SERVICO,0);
  else
    if(BOARD_estado_leds[LED_FORA_SERVICO] == ACESO)
      LEDS_setter_led(LED_FORA_SERVICO,1);
    else
      LEDS_setter_led(LED_FORA_SERVICO,toggle);        
   //--------------------------------------------------
   if(BOARD_estado_leds[LED_VERMELHO_GRELHA] == APAGADO)
     LEDS_setter_led(LED_VERMELHO_GRELHA,0);
   else
     if(BOARD_estado_leds[LED_VERMELHO_GRELHA] == ACESO)
       LEDS_setter_led(LED_VERMELHO_GRELHA,1);
     else
       LEDS_setter_led(LED_VERMELHO_GRELHA,toggle);
   //--------------------------------------------------
   if(BOARD_estado_leds[LED_VERDE_GRELHA] == APAGADO)
     LEDS_setter_led(LED_VERDE_GRELHA,0);
   else
     if(BOARD_estado_leds[LED_VERDE_GRELHA] == ACESO)
       LEDS_setter_led(LED_VERDE_GRELHA,1);
     else
       LEDS_setter_led(LED_VERDE_GRELHA,toggle);
   //--------------------------------------------------
     
   if(toggle){
     LEDS_setter_led(LED_VERMELHO_GRELHA,1);
     LEDS_setter_led(LED_VERDE_GRELHA,0);
   }
   else{
     LEDS_setter_led(LED_VERMELHO_GRELHA,0);
     LEDS_setter_led(LED_VERDE_GRELHA,1);     
   }
}
/***********************************************************************************
*       Descrição       :       Setter para a variavel que guarda o estado
*                               dos leds da placa de instrução
*       Parametros      :       (unsigned char) led
*                               (eLED_STATE) estado do led
*       Retorno         :       nenhum
***********************************************************************************/
void BOARD_setter_led_instrucao(unsigned char led,eLED_STATE estado){
  
  BOARD_estado_leds[led] = estado;    
}
/***********************************************************************************
*       Descrição       :       Setter ara a variavel que controla a placa
*                               de instrução
*       Parametros      :       (unsigned char) estado
*       Retorno         :       nenhum
***********************************************************************************/
void BOARD_liga_placa_instrucao(unsigned char flag){
  
  for(unsigned char i=0;i<8;i++)
    LEDS_setter_led(i,0);
  
  if(!flag)
    for(unsigned char i=0;i<8;i++)
      BOARD_estado_leds[i] = APAGADO;
  
  BOARD_leds_instrucao = flag;
}
/***********************************************************************************
*       Descrição       :       Setter para o contador de propaganda
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void BOARD_setter_contador_propaganda(unsigned int contagem){
  
  if(!contagem)
    BOARD_contador_propaganda = 60000*BOARD_intervalo_propaganda;
  else
    BOARD_contador_propaganda = contagem;
}
/***********************************************************************************
*       Descrição       :       Setter para o tempo da propaganda
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void BOARD_reset_tempo_propaganda(void){
  
  BOARD_contador_propaganda = BOARD_intervalo_propaganda*60000;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/