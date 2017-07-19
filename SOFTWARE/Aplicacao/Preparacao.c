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
|       Arquivo            :  Preparacao.c
|       Descrição          :  Interface para a preparação da pipoca
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  22/04/2017
|
|       Revisões           :  001
|
|                             (22/04/2017) Criado módulo que faz a preparação
|                             da pipoca - Marcos
|                    
|
|
| __________________________________________________________________________________
*/

/**********************************************************************************
*       Includes
**********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "..\includes.h"

/**********************************************************************************
*       Definições locais
**********************************************************************************/
#define TEMPO_PREPARO                   80*1000
#define TEMPO_ABRIR_PACOTE              50*1000
#define TEMPO_RAMPA                     3000
#define THRESOLD_RESFRIAMENTO           1
#define RELOAD_COMPENSADOR              2*60000 // 5 minutos
/**********************************************************************************
*       Constantes
**********************************************************************************/


/**********************************************************************************
*       Variaveis locais
**********************************************************************************/
unsigned int PREPARACAO_cnt_preparo=0;
unsigned int PREPARACAO_cnt_rampa=0;
unsigned int PREPARACAO_contador_compensacao=0;
unsigned int PREPARACAO_compensador=0;

/**********************************************************************************
*       Funções locais
**********************************************************************************/
void PREPARACAO_atualiza_info_tempo(unsigned char idioma,unsigned int tempo);
unsigned char PREPARACAO_verificaVentilador(void);
unsigned char PREPARACAO_verifica_resistencia(void);
void PREPARACAO_tela_interna(void);
unsigned char PREPARACAO_dosagem_milho(void);
void PREPARACAO_resfriamento(unsigned char idioma);

/**********************************************************************************
*       Implementação das funções
**********************************************************************************/

/**********************************************************************************
*       Descrição       :       Ponto de entrada do menu da interface para
*                               preparação das pipocas
*       Parametros      :       nenhum
*       Retorno         :       nenhum
**********************************************************************************/
ePREPARACAO_RESULT PREPARACAO_entry(unsigned int *ajuste_out,
                                    eCONTABILIZAR contabiliza){
  unsigned int temperatura_processo;
  unsigned int velocidade_processo;
  unsigned int tempo_embalagem;
  unsigned char idioma;
  unsigned char delta=0;
  unsigned int valor_pipoca;
  
  PAGAMENTOS_set_bloqueio(1);
  
  PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
  PARAMETROS_le(ADR_TEMPERATURA_PREPARACAO,(void*)&temperatura_processo);
  PARAMETROS_le(ADR_VELOCIDADE_PREPARACAO,(void*)&velocidade_processo);
  PARAMETROS_le(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);
  PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valor_pipoca);  

  //-----------------------------------------------
  // Por falta de testes, deixei esse trecho abaixo
  // para garantir que funcionará mesmo que ocorra
  // uma falha na leitura da memória flash externa
  // Faz a consistência dos parametros
  //**********************************************
  if(temperatura_processo>170)
    temperatura_processo = 85;
  if(velocidade_processo>8500)
    velocidade_processo = 5700;
  if(tempo_embalagem>10000 || !tempo_embalagem)
    tempo_embalagem = 4200;
  
  BOARD_setter_led_instrucao(LED_INSIRA_DINHEIRO,ACESO);
       
  //Faz o ajuste de compensação da panela
  //unsigned int ajuste = AA_calculaTemperatura();
  if(PREPARACAO_contador_compensacao){
    if(PREPARACAO_compensador<5)
      PREPARACAO_compensador++;
  }
  else{
    if(PREPARACAO_compensador)
      PREPARACAO_compensador--;
  }
  
  PREPARACAO_contador_compensacao = RELOAD_COMPENSADOR;  
  
  temperatura_processo += PREPARACAO_compensador;
  
  STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_inicio_preparacao[idioma][0],(char*)STRING_mensagem_inicio_preparacao[idioma][1]);
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_inicio_preparacao[idioma][0],(char*)STRING_mensagem_inicio_preparacao[idioma][1]);
  
  // Inicializa o PID de controle
  // da rotação do motor
  POTENCIA_set_neutro(1);
  vTaskDelay(500);
  POTENCIA_setRPM(2500);//velocidade_processo);

  PREPARACAO_cnt_preparo = TEMPO_PREPARO;  
  // Faz a verificação do ventilador
  if(!PREPARACAO_verificaVentilador()){
    // Se não detectar o giro
    // desliga a parte de alta-tensão
    // e sinaliza o erro
    POTENCIA_setRPM(0);
    POTENCIA_set_neutro(0);
    return FALHA_VENTILADOR;
  }
    
  // Inicia o controlador de temperatura
  CT_set_temperatura(temperatura_processo);
  
  // Faz a verificação da resistência
  /*
  if(!PREPARACAO_verifica_resistencia()){
    POTENCIA_setRPM(0);
    POTENCIA_set_neutro(0);
    CT_set_temperatura(0);
    return FALHA_RESISTENCIA;        
  }
  */
  // Aguarda até a temperatura de início de processo
  // chegar ao valor da inicial
  unsigned int timeout=60000;
  //do vTaskDelay(1);
  while(AA_calculaTemperatura()<temperatura_processo && --timeout){
    vTaskDelay(1);
    APLICACAO_tela_descanso();
  }  
  
  if(!timeout){
    POTENCIA_setRPM(0);
    POTENCIA_set_neutro(0);
    CT_set_temperatura(0);
    return FALHA_RESISTENCIA;   
  }
  
  //POTENCIA_setRPM(4000);
  //while(POTENCIA_getRPMmedido()>4200);
  
  if(!PREPARACAO_dosagem_milho()){
    POTENCIA_setRPM(0);
    POTENCIA_set_neutro(0);
    CT_set_temperatura(0);
    return FALHA_DOSE;     
  }
  
  POTENCIA_setRPM(velocidade_processo);
  while(POTENCIA_getRPMmedido()<velocidade_processo);
  
  BOARD_setter_led_instrucao(LED_PEGUE_PACOTE,PISCANDO); // Indica na plac ade instrução para pegar a embalagem
  //if(
  EMBALAGEM_libera_pacote(tempo_embalagem);//!=EMBALAGEM_LIBERADA);
  //  POTENCIA_setRPM(0);
  //  POTENCIA_set_neutro(0);
  //  CT_set_temperatura(0);    
  //  return FALHA_EMBALAGEM;
  //}    
  
  PLAYERWAVE_iniciaMusica(AUDIO_PEGA_PACOTE,0);
  while(PLAYERWAVE_verificaToque());
 
  STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);
  STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
  PREPARACAO_cnt_rampa = TEMPO_RAMPA;
  PREPARACAO_cnt_preparo = TEMPO_PREPARO;
  
  PLAYERWAVE_iniciaMusica(MUSICA_PREPARO,0);
  //while(PLAYERWAVE_verificaToque());
  
  // Loop de preparação da pipoca
  for(;PREPARACAO_cnt_preparo;){
    
    PREPARACAO_atualiza_info_tempo(idioma,PREPARACAO_cnt_preparo);    
    PREPARACAO_tela_interna();
    
    // Falha no motor do ventilador
    if(POTENCIA_getRPMmedido()<1000){
      POTENCIA_setRPM(0);
      POTENCIA_set_neutro(0);
      CT_set_temperatura(0);   
      return FALHA_VENTILADOR;
    }
        
    // Gera a rampa de aquecimento
    // na preparação da pipoca
    if(!PREPARACAO_cnt_rampa){
      //temperatura_processo;
      if(delta<20)
        delta++;
      CT_set_temperatura(temperatura_processo+delta);
      PREPARACAO_cnt_rampa = TEMPO_RAMPA;
    }
    
    // Controle da placa de instrução
    // do usuário
    if(PREPARACAO_cnt_preparo>TEMPO_ABRIR_PACOTE){
       BOARD_setter_led_instrucao(LED_PEGUE_PACOTE,ACESO);
       BOARD_setter_led_instrucao(LED_MONTE_PACOTE,PISCANDO);
    }
    else{
       BOARD_setter_led_instrucao(LED_MONTE_PACOTE,ACESO);        
       BOARD_setter_led_instrucao(LED_INSIRA_PACOTE,PISCANDO);         
    }
  }  
  
  BOARD_setter_led_instrucao(LED_INSIRA_PACOTE,ACESO);
      
  // Desliga os controles
  // da potência
  POTENCIA_setRPM(0);
  POTENCIA_set_neutro(0);
  CT_set_temperatura(0);
  
  PREPARACAO_limpeza(idioma);
  
  PLAYER_interrompeMusica();
  vTaskDelay(500);
  PLAYERWAVE_iniciaMusica(AUDIO_PIPOCAS_PRONTAS,0);
  while(PLAYERWAVE_verificaToque());  
  vTaskDelay(500); 
  //-----------------------------------------------
  // Local para inserção dos dados no faturamento
  // e liberação do troco
  //-----------------------------------------------
  if(contabiliza==CONTABILIZA){
    // Só contabiliza as unidades vendidadas
    // quando houver necessidade
    FATURAMENTO_add_contagem_parcial(1);
    FATURAMENTO_add_arrecadacao_parcial(valor_pipoca);
    FATURAMENTO_add_contagem_total(1);
    FATURAMENTO_add_arrecadacao_total(valor_pipoca);
  }
  else
    FATURAMENTO_inc_contador_pipocas_teste();  
 
  //----------------------------------------------
  // Fim da coleta dos dados de faturamento
  //----------------------------------------------   
  
  BOARD_liga_placa_instrucao(0);
  BOARD_liga_placa_instrucao(1);  
  
  //PAGAMENTOS_set_bloqueio(0);
  
  return SUCESSO;
}
/**********************************************************************************
*       Descrição       :       Atualiza o display frontal com o tempo restante
*                               do processo de preparo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
**********************************************************************************/
void PREPARACAO_atualiza_info_tempo(unsigned char idioma,unsigned int tempo){
  char buffer_linha[17];
  unsigned int minutos;
  unsigned int segundos;
  
  minutos  = PREPARACAO_cnt_preparo/1000;
  segundos = minutos % 60;
  minutos  = minutos/60;
  
  sprintf(buffer_linha,"  %01d:%02d  ",minutos,segundos);
  STRING_write_to_external(NO_CLEAR,(char*)STRING_mensagem_pipocas_prontas[idioma],buffer_linha);  
}
/**********************************************************************************
*       Descrição       :       Verifica se o ventilador está funcionando
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero se conseguir
*                               detectar o RPM do motor
**********************************************************************************/
unsigned char PREPARACAO_verificaVentilador(void){
  unsigned short int tempo=50000;  
  
  do{
    
    if(POTENCIA_getRPMmedido()>1000)
      return 1;
    else
      vTaskDelay(1);
        
  }
  while(tempo--);
  
  return 0; 
}
/**********************************************************************************
*       Descrição       :       Faz a verificação do aquecimento da resistência
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero se 
*                               conseguir aquecer a panela 2 graus em até 5 segundos
**********************************************************************************/
unsigned char PREPARACAO_verifica_resistencia(void){
  unsigned int temperaturaInicial;
  unsigned short int tempo = 15000;
  
  temperaturaInicial = AA_calculaTemperatura();
  
  do{
    
    if(AA_calculaTemperatura()>(temperaturaInicial+2))
      return 1;
    else
      vTaskDelay(1);
    
  }
  while(tempo--);
  
  return 0;  
}
/**********************************************************************************
*       Descrição       :       Tela informativa do processo exibida
*                               no display interno
*       Parametros      :       nenhum
*       Retorno         :       nenhum
**********************************************************************************/
void PREPARACAO_tela_interna(void){
  char buffer_linha[17];
  
  sprintf(buffer_linha,"%05d RPM-%03doC",POTENCIA_getRPMmedido(),AA_calculaTemperatura());
  STRING_write_to_internal(NO_CLEAR,buffer_linha,NULL);
}
/**********************************************************************************
*       Descrição       :       Libera uma dose de milho na panela
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero
*                               se conseguir dosar
**********************************************************************************/
unsigned char PREPARACAO_dosagem_milho(void){
  unsigned char sensor_dose; 
  unsigned int tempo=2000; 
  
  BOARD_set_motor_dose(DOSAR);
  while(GET_SENSOR_DOSE() && tempo--)
    vTaskDelay(1);
  
  tempo = 15000;
        
  do{
    
    sensor_dose = GET_SENSOR_DOSE();  
    if(sensor_dose){
      BOARD_set_motor_dose(PARADO);
      return 1;
    }
    else
      vTaskDelay(1);
    
  }
  while(tempo--);
  
  BOARD_set_motor_dose(PARADO);  
  //BOARD_set_motor_dose(DOSAR);          
  //BOARD_set_motor_dose(REVERTER);
  //BOARD_set_motor_dose(PARADO);
  
  return 0;
}
/**********************************************************************************
*       Descrição       :       Limpeza da panela e agradecimento pela
*                               compra
*       Parametros      :       nenhum
*       Retorno         :       nenhum
**********************************************************************************/
void PREPARACAO_limpeza(unsigned char idioma){
  
  POTENCIA_set_neutro(1);
  POTENCIA_setRPM(13000);
  
  STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_limpeza[idioma][0],(char*)STRING_mensagem_limpeza[idioma][1]);
  vTaskDelay(7000);
  
  POTENCIA_setRPM(0);
  POTENCIA_set_neutro(0);  
}
/**********************************************************************************
*       Descrição       :       Resfriamento do sistema
*       Parametros      :       nenhum
*       Retorno         :       nenhum
**********************************************************************************/
void PREPARACAO_resfriamento(unsigned char idioma){
  
  POTENCIA_set_neutro(1);
  vTaskDelay(500);  
  POTENCIA_setRPM(6000);
  
  STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_resfriando[idioma][0],
                                         (char*)STRING_mensagem_resfriando[idioma][1]);
  vTaskDelay(30000);
  
  POTENCIA_setRPM(0);
  POTENCIA_set_neutro(0);  
}
/**********************************************************************************
*       Descrição       :       Limpeza da panela e agradecimento pela
*                               compra
*       Parametros      :       nenhum
*       Retorno         :       nenhum
**********************************************************************************/
void PREPARACAO_limpeza_inicial(unsigned char idioma){
  
  POTENCIA_set_neutro(1);
  vTaskDelay(500);
  POTENCIA_setRPM(12000);
  
  STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_limpeza_inicial[idioma][0],(char*)STRING_mensagem_limpeza_inicial[idioma][1]);
  vTaskDelay(7000);
  
  POTENCIA_setRPM(0);
  POTENCIA_set_neutro(0);  
}
/**********************************************************************************
*       Fim do arquivo
**********************************************************************************/

