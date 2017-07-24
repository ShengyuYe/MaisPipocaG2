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
|       Arquivo            :  PlayerWave.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  22/02/2014
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <nxp\iolpc1768.h>
#include "playerWave.h"
#include "..\..\includes.h"


/***********************************************************************************
*       Definições locais
***********************************************************************************/
#define PR_TIMER_0                      600

#define POWER_WAVE_PIN                  //(0x01)<<26
#define POWER_WAVE_INIT()               //FIO3DIR |= POWER_WAVE_PIN
#define POWER_WAVE_SET()                //FIO3SET |= POWER_WAVE_PIN
#define POWER_WAVE_CLR()                //FIO3CLR |= POWER_WAVE_PIN

#define PINO_DAC                        (0x01)<<26
#define INI_PIN_DAC()                   FIO0DIR|= PINO_DAC
#define SET_PINO_DAC(X)                 X?(FIO0SET|=PINO_DAC):(FIO0CLR|=PINO_DAC)

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned int enderecoInicialMusica=0;//AREA_AUDIO;
unsigned int tamanhoMusica;
unsigned short int volume;
unsigned short int dadoMusica;
unsigned char bufferMusica;
/***********************************************************************************
*       Funções locais
***********************************************************************************/
extern void SST_writeDisable(void);
extern void SST_highSpeedRead(unsigned int endereco,unsigned char *buffer,
                       unsigned short int size);

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Inicialização do módulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PLAYERWAVE_ini(void){
  
  PCONP_bit.PCTIM0 = 1; // Energiza o periférico
  PCLKSEL0_bit.PCLK_TIMER0 = 1; // Seleção do clock
  
  IP0_bit.PRI_1 = 1;  
  SETENA0_bit.SETENA1 = 1; // Habilitação da interrupção do timer 1
  
  T0TCR_bit.CE = 1;   // Contador Habilitado
  T0TCR_bit.CR = 1;   // Realiza o reset
  T0TCR_bit.CR = 0;   // do contador
  
  T0CTCR_bit.CTM = 0x00;
  T0PR = 12;  
  
  T0MCR_bit.MR0I = 0;
  T0MCR_bit.MR0R = 0;
  T0EMR_bit.EM0  = 0; // Não altera nenhum pino  
    
  T0EMR_bit.EM0  = 0;
  T0EMR_bit.EMC0 = 0;
  
  T0MR0 = T0TC+1000;
    
  PINSEL1_bit.P0_26 = 2;
  PCLKSEL0_bit.PCLK_DAC = 1;  
  
  POWER_WAVE_INIT();
  POWER_WAVE_CLR();
}
/***********************************************************************************
*       Descrição       :      Toca um dos waves salvos na memória
*       Parametros      :     (unsigned char) indice do arquivo
*                             (unsigned char) modo 0 - único
*                                                  1 - loop
*       Retorno         :       nenhum
***********************************************************************************/
void PLAYERWAVE_iniciaMusica(unsigned char indice,unsigned char modo){
  unsigned int enderecoInicial;
  unsigned int tamanho;
    
  if(indice==1)
    PARAMETROS_le(ADR_VOLUME_MUSICA,(void*)&volume);
  else
    PARAMETROS_le(ADR_VOLUME_VOZ,(void*)&volume);
    
  if(volume>100)
    volume = 100;
  
  if(!volume)
    return;
  
  POWER_WAVE_SET();    
  
  PARAMETROS_le(ADR_INICIO_BLOCO_MUSICA+indice,(void*)&enderecoInicial);
  PARAMETROS_le(ADR_TAMANHO_BLOCO_MUSICA+indice,(void*)&tamanho);
  
  enderecoInicialMusica = enderecoInicial;
  tamanhoMusica = tamanho;
  
  MEMORYWRAPPER_wait();
  
  T0MR0 = T0TC+1000;  
  T0MCR_bit.MR0I = 1;  
}
/***********************************************************************************
*       Descrição       :       Para com a reprodução de uma música
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PLAYER_interrompeMusica(void){
  
  T0MCR_bit.MR0I = 0;   
  POWER_WAVE_CLR();
  tamanhoMusica = 0;
  MEMORYWRAPPER_release();
}
/***********************************************************************************
*       Descrição       :       Função de interrupção 
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PLAYRWAVE_rti(void){ 
  
  T0MR0 = T0TC+960;
  
  dadoMusica = MEMORYWRAPPER_readSingle(enderecoInicialMusica++)<<2;
  
  if(dadoMusica){
    dadoMusica*= volume;
    dadoMusica/= 100;
  }
  
  DACR_bit.VALUE = dadoMusica;
  if(tamanhoMusica){
    tamanhoMusica--;
    T0MCR_bit.MR0I = 1;    
  }
  else{
    T0MCR_bit.MR0I = 0;    
    MEMORYWRAPPER_release();
  }
  
  T0IR_bit.CR0INT = 1;
  CLRPEND0_bit.CLRPEND4 = 1;  
}
/***********************************************************************************
*       Descrição       :       Verifica se uma música ainda está sendo
*                               tocada
*       Parametros      :       (nenhum)
*       Retorno         :       (unsigned char) maior do que zero se a música
*                                               ainda estiver sendo tocada
***********************************************************************************/
unsigned char PLAYERWAVE_verificaToque(void){
 
 if(!tamanhoMusica)
   MEMORYWRAPPER_release();
 
 return  tamanhoMusica>0;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/

