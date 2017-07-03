/*__________________________________________________________________________________
|	DEXTRO SOLU��ES TECNOL�GICAS
|       
|       ITAJA� - SC
|       www.dextro.ind.br
| __________________________________________________________________________________
|
|       This source code was developed by DEXTRO  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by DEXTRO 
|       or its distributors.
|
|       Este c�digo � propriedade da DEXTRO  e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       DEXTRO  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  Potencia.c
|       Descri��o          :  Biblioteca para o controle PID do 
|                             motor universal
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  21/02/2017
|
|       Revis�es           :  1.0.0.0
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
#include "Potencia.h"

#define FQ_REDE_60_HZ
/***********************************************************************************
*       Defini��es locais
***********************************************************************************/
#define LIGA_NEUTRO_PIN                 (0x01)<<19
#define INI_LIGA_NEUTRO_PIN()           FIO1DIR|=LIGA_NEUTRO_PIN
#define SET_LIGA_NEUTRO_PIN(X)          X?(FIO1SET|=LIGA_NEUTRO_PIN):(FIO1CLR|=LIGA_NEUTRO_PIN)

#define RELOAD_TIMEOUT_RRPM             1000  

#define CLK                             96000000
#define PR_TIMER                        300

#define CONTROLE_RESISTENCIA            (0x01)<<2
#define SSR                             (0x01)<<3

#define INI_PINS                        FIO2DIR |= SSR | CONTROLE_RESISTENCIA;

#define SET_SSR(X)                      X?(FIO2SET|=SSR):(FIO2CLR|=SSR)
#define SET_RESISTENCIA(X)              X?(FIO2SET|=CONTROLE_RESISTENCIA):(FIO2CLR|=CONTROLE_RESISTENCIA)

#define SET_ATRASO(X)                   {T2MR0 = T2TC+X; T2MCR_bit.MR0I = 1;}
#define SET_ATRASO_RES(X)               {T2MR1 = T2TC+X; T2MCR_bit.MR1I = 1;}

#define TAM_BUF_VELOCIDADE              2//8//16
#define DIV_MEDIA_VEL                   1//4//4     

/***********************************************************************************
*       Ganhos do PID
***********************************************************************************/
#ifdef FQ_REDE_60_HZ
  #define KP                                       4
  #define KI                                       0.2
  #define KD                                       0.2
#else
  #define KP                                       4
  #define KI                                       0.2
  #define KD                                       0.2
#endif

#ifdef FQ_REDE_60_HZ
  #define ATRASO_MAXIMO                           2500
  #define ATRASO_MINIMO                           150
#endif

#ifdef FQ_REDE_50_HZ
  #define ATRASO_MAXIMO                           3100
  #define ATRASO_MINIMO                           300
#endif

/***********************************************************************************
*       Constantes
***********************************************************************************/
const unsigned int kp_const = KP*256;
const unsigned int kd_const = KD*32768;
const unsigned int ki_const = KI*32768;

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned int POTENCIA_ciclos=0;
unsigned int POTENCIA_frequencia=0;
unsigned int POTENCIA_periodoCapturadoMotor;
unsigned int POTENCIA_timeOutCounter;
unsigned int POTENCIA_bufferRotacao[TAM_BUF_VELOCIDADE]={0};
unsigned char POTENCIA_ligaMotor=0;
unsigned int POTENCIA_set_point=0;
extern unsigned int BOARD_lock_timer;

/***********************************************************************************
*       Fun��es locais
***********************************************************************************/

/***********************************************************************************
*       Implementa��o das fun��es
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Inicializa��o do m�dulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void POTENCIA_ini(void){
  
  INI_LIGA_NEUTRO_PIN();  
  INI_PINS;
  SET_LIGA_NEUTRO_PIN(0);
  
  // --------------------------
  // Interrup��o externa
  // --------------------------
  PINSEL4_bit.P2_11 = 1;
  EXTMODE_bit.EXTMODE1 = 1;
  EXTPOLAR_bit.EXTPOLAR1 = 1;    
  SETENA0_bit.SETENA19 = 1;      
  
  //--------------------------------------------------------------------------//
  //                        Habilita a interrup��o                            //
  //                        no NVIC                                           //
  //--------------------------------------------------------------------------//  
  PCONP_bit.PCTIM1 = 1;  
  IP0_bit.PRI_2 = 0;  
  SETENA0_bit.SETENA2 = 1; // Habilita��o da interrup��o do timer 1
  
  T1TCR_bit.CE = 1;   // Contador Habilitado
  T1TCR_bit.CR = 1;   // Realiza o reset
  T1TCR_bit.CR = 0;   // do contador
  
  T1CTCR_bit.CTM = 0x00;
  T1PR = PR_TIMER;
   
  PINSEL3_bit.P1_18 = 3;
  
  T1CCR_bit.CAP0RE = 1; // Borda de subida
  T1CCR_bit.CAP0FE = 0; // Borda de descida  
  T1CCR_bit.CAP0I = 1;  // Interrup��o por evento no canal
  
  //-------------------------------------------------------------------------//
  //                    Inicializa��o do timer 2                             //
  //-------------------------------------------------------------------------//
  PCONP_bit.PCTIM2 = 1; // Energiza o perif�rico
  PCLKSEL1_bit.PCLK_TIMER2 = 1; // Sele��o do clock
  
  IP0_bit.PRI_3 = 0;  
  SETENA0_bit.SETENA3 = 1; // Habilita��o da interrup��o do timer 1
  
  T2TCR_bit.CE = 1;   // Contador Habilitado
  T2TCR_bit.CR = 1;   // Realiza o reset
  T2TCR_bit.CR = 0;   // do contador
  
  T2CTCR_bit.CTM = 0x00;
  T2PR = PR_TIMER;  
  //-------------------------------------------------------------------------//
  //                   Match 0 para o dimmer do motor                        //
  //-------------------------------------------------------------------------// 
  T2MCR_bit.MR0I = 0;
  T2MCR_bit.MR0R = 0;
  T2EMR_bit.EM0  = 0; // N�o altera nenhum pino    
  T2EMR_bit.EMC0 = 0;
  
  T2MR0 = T2TC+1000;  
}
/***********************************************************************************
*       Descri��o       :       Inicializa o neutro de pot�ncia
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void POTENCIA_set_neutro(unsigned char flag){
  
  SET_LIGA_NEUTRO_PIN(flag);
}
/***********************************************************************************
*       Descri��o       :       Interrup��o do EINT1
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void POTENCIA_eintInterrupt(void){  
  
  // Evita dois disparos
  // pelo glitch de subida
  // do sinal de 60 Hz
  if(!BOARD_lock_timer){
    
    SET_SSR(0);
    BOARD_lock_timer = 6;
    POTENCIA_controleVelocidade();
  
    POTENCIA_ciclos++;  
  }
  else{
    BOARD_lock_timer = BOARD_lock_timer;    
  }
  EXTINT_bit.EINT1 = 1;
  CLRPEND0_bit.CLRPEND19 = 1;
}
/***********************************************************************************
*       Descri��o       :       Tick de timer para a biblioteca de controle
*                               da velocidade do motor
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void POTENCIA_timerTick(void){  
  static unsigned short int contador=1;  
  
  if(!--contador){
    POTENCIA_frequencia = POTENCIA_ciclos;
    POTENCIA_ciclos = 0;
    contador = 500;
  }    
  
  // Timeout na captura
  // da rota��o do motor  
  if(POTENCIA_timeOutCounter){
    if(POTENCIA_timeOutCounter==1){
      for(unsigned char i=0;i<TAM_BUF_VELOCIDADE;i++)
        POTENCIA_bufferRotacao[i] = 0;
    }
    POTENCIA_timeOutCounter--;
  }// Fim do contador para timeout no c�lculo da rota��o do motor
}
/***********************************************************************************
*       Descri��o       :       Getter para a frequ�ncia da rede el�trica
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
unsigned short int POTENCIA_getFrequenciaRede(void){
  
  return POTENCIA_frequencia;
}
/***********************************************************************************
*       Descri��o       :       Interrup��o do capture
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void POTENCIA_captureInterrupt(void){
  static unsigned int ultimaLeitura=0;
  unsigned int larguraAtual;
  unsigned int tmp;
  static unsigned int ponteiroLeitura=0;
  
  larguraAtual = tmp = T1CR0;
  
  if(larguraAtual>ultimaLeitura)         
    larguraAtual-=ultimaLeitura;    
  else
    larguraAtual = (0xFFFFFFFF - ultimaLeitura) + larguraAtual;
    
  ultimaLeitura = tmp;
  
  T1IR_bit.CR0INT = 1;
  CLRPEND0_bit.CLRPEND2 = 1;
  
  POTENCIA_periodoCapturadoMotor = larguraAtual;
  POTENCIA_timeOutCounter = RELOAD_TIMEOUT_RRPM;      
  POTENCIA_bufferRotacao[ponteiroLeitura] = POTENCIA_periodoCapturadoMotor;
  ponteiroLeitura= (ponteiroLeitura+1) % TAM_BUF_VELOCIDADE;   
}
/***********************************************************************************
*       Descri��o       :       Interrup��o do timer 2
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void POTENCIA_mathTimer2(void){
  
  if(T2IR_bit.MR0INT){
    SET_SSR(1); // Liga o gate
    T2IR_bit.MR0INT = 1;
    CLRPEND0_bit.CLRPEND3 = 1;
  }  
}
/***********************************************************************************
*       Descri��o       :       Fun��o que faz o controle da velocidade do 
*                               motor dentro do timer
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
#pragma inline
void POTENCIA_controleVelocidade(void){
  long long int erro;
  long long int erro_i;
  long long int erro_d;
  static unsigned short int referencia_rampa=0;
  static unsigned short int ciclos=180;
  
  if(POTENCIA_ligaMotor){
      
        //----------------------------------------
        // Faz a refer�ncia crescer lentamente
        //----------------------------------------
        if(referencia_rampa!=POTENCIA_set_point){
          if(referencia_rampa>POTENCIA_set_point)
            referencia_rampa-=25;//50;
          else
            referencia_rampa+=25;//50;
        }      
        
        if(ciclos){
          // Nos primeiros ciclos trabalha apenas com o erro
          // proporcional
          ciclos--;
          erro = referencia_rampa - POTENCIA_getRPMmedido();
          erro*= kp_const;
          erro>>= 8;   
          POTENCIA_calcula_derivada_erro(referencia_rampa);
          
          SET_ATRASO(POTENCIA_calculaAtrasoGate(erro));
        }
        else{
          // Calcula o erro entre a refer�ncia e a rota��o medida pelo sensor
          erro = referencia_rampa - POTENCIA_getRPMmedido();
          // Calcula a integral do erro
          erro_i = POTENCIA_calcula_integral_erro(erro,0);                     
          erro_i *= ki_const;
          erro_i >>= 15;
          
          erro_d = POTENCIA_calcula_derivada_erro(erro);
          erro_d *= kd_const;
          erro_d >>= 15;
          
          erro*= kp_const;
          erro>>= 8;          
          erro += erro_i;
          erro += erro_d;
                                 
          SET_ATRASO(POTENCIA_calculaAtrasoGate(erro));          
        }
  }
  else{
    POTENCIA_calcula_integral_erro(0,1);
    referencia_rampa = ATRASO_MAXIMO;
    ciclos = 128;
  }  
}
/***********************************************************************************
*       Descri��o       :       Calcula o erro integral 
*       Parametros      :       (int) erro atual
*       Retorno         :       (int) erro integral
***********************************************************************************/
int POTENCIA_calcula_integral_erro(int erro,unsigned flush){
  static long int y=0;
  long int abs;    
  
  if(flush){    
    y = 0;
    return 0;
  }
  
  y+=erro;
  
  abs = erro;
  if(abs<0) abs*= -1;
  
  if(abs<100000){
    y+=erro;
  }
  else{
    y = 0;
  }

  return y;
}
/***********************************************************************************
*       Descri��o       :       Calcula a derivada do erro
*       Parametros      :       (int) erro
*       Retorno         :       (int) derivada do erro
***********************************************************************************/
int POTENCIA_calcula_derivada_erro(int erro){
  static int ultimo_erro = 0;
  
  erro = erro - ultimo_erro;     
  ultimo_erro = erro;  
  
  //Trunca os limites  
  return erro;
}
/***********************************************************************************
*       Descri��o       :       Setter para a rota��o do motor
*       Parametros      :       (unsigned int) rpm do motor
*       Retorno         :       nenhum
***********************************************************************************/
void POTENCIA_setRPM(unsigned int rpm){
  
  if(!rpm){
    POTENCIA_ligaMotor = 0;
  }
  else{
    vTaskDelay(100);
    POTENCIA_set_point = rpm;
    vTaskDelay(2);          // Pra n�o subir antes de ligar o motor....
    POTENCIA_ligaMotor = 1;
  }
}
/***********************************************************************************
*       Descri��o       :       Calcula o atraso para o gate para uma determinada
*                               rota��o
*       Parametros      :       (unsigned int) rota��o alvo
*       Retorno         :       (unsigned int) atraso
***********************************************************************************/
unsigned int POTENCIA_calculaAtrasoGate(int rotacao_rpm){    
  
#ifdef FQ_REDE_60_HZ  
  long long int valor;
  
  valor = rotacao_rpm*4404;
  valor>>= 15;
  valor = 2499 - valor; 
  
  // trunca os limites
  // do it que gera a interru��o
  // para controlar o gate
  // esses valores foram levantado com o scope, ent�o n�o
  // mudar sem crit�rios(13/11/2016)
  if(valor<ATRASO_MINIMO)
    valor = ATRASO_MINIMO;
  if(valor>ATRASO_MAXIMO)
    valor = ATRASO_MAXIMO;
  
  return valor;
#endif
  
#ifdef FQ_REDE_50_HZ
  long long int valor;
  
  valor = rotacao_rpm * 5757;
  valor>>= 15;
  valor = ATRASO_MAXIMO - valor; 
  
  // trunca os limites
  // do it que gera a interru��o
  // para controlar o gate
  // esses valores foram levantado com o scope, ent�o n�o
  // mudar sem crit�rios(13/11/2016)
  if(valor<ATRASO_MINIMO)
    valor = ATRASO_MINIMO;
  if(valor>ATRASO_MAXIMO)
    valor = ATRASO_MAXIMO;
  
  return valor;
#endif  
}
/***********************************************************************************
*       Descri��o       :       L� os RPMs do motor
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) RPM atual do motor
***********************************************************************************/
unsigned int POTENCIA_getRPMmedido(void){  
  unsigned int media=0; 
  
  if(!POTENCIA_periodoCapturadoMotor)
    return 0;

  for(unsigned char i=0;i<TAM_BUF_VELOCIDADE;i++)
    media += POTENCIA_bufferRotacao[i];  
  media>>=DIV_MEDIA_VEL;
  
  media = 19962072/media;
   
  return media;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/