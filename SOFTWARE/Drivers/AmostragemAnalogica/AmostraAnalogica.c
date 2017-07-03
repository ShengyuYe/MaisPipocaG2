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
|       Arquivo            :  AmostraAnalogica.c
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  19/06/2014
|
|       Revis�es           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       Include
***********************************************************************************/
#include <nxp\iolpc1768.h>
#include "..\..\includes.h"
#include "amostraAnalogica.h"
#include <math.h>
#include "tabelaTermistor.h"

/***********************************************************************************
*       Defini��es locais
***********************************************************************************/
#define TAMANHO_BUFFER_ENTRADAS_ANALOGICAS              16

/***********************************************************************************
*       Defini��es para o c�lculo da temperatura
***********************************************************************************/
// Em 3/08/2015 alterada a curva para o novo termistor que foi
// enviado pela addtherm
#define BETA_25_GRAUS                                   3910//3961
#define RT_NOVO                                         1001//1030
#define RESISTOR_LIMITADOR                              500

/***********************************************************************************
*       Variaveis - locais
***********************************************************************************/
unsigned short int AA_bufferEntradasAnalogicas[TAMANHO_BUFFER_ENTRADAS_ANALOGICAS];
unsigned short int AA_bufferSensorPapel[TAMANHO_BUFFER_ENTRADAS_ANALOGICAS];
unsigned short int AA_intertravador;

/***********************************************************************************
*       Fun��es - locais
***********************************************************************************/
void AA_amostragemAnalogica(void);
unsigned short int AA_mediaMovel(void);

/***********************************************************************************
*       Implementa��o
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       inicializa��o do m�dulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void AA_ini(void){   
  
  PCONP_bit.PCAD = 1;
  PCLKSEL0_bit.PCLK_ADC = 1;  
  
  PINSEL1_bit.P0_23 = 1;   
  PINSEL1_bit.P0_24 = 1;
    
  AD0CR_bit.SEL = 0;
  AD0CR_bit.CLKDIV = 10;
  AD0CR_bit.BURST = 0;
  AD0CR_bit.PDN = 1;
  
  AD0CR_bit.START = 1;     
}
/***********************************************************************************
*       Descri��o       :       Tick de timer do m�dulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void ES_tickTimer(void){
   
  AA_amostragemAnalogica();     // Amostragem das entradas anal�gicas
}
/***********************************************************************************
*       Descri��o       :       Calcula a m�dia das �ltimas amostras
*                               do sistema
*       Parametros      :       (unsigned char) canal
*       Retorno         :       (unsigned short int) m�dia m�vel 
***********************************************************************************/
unsigned short int AA_mediaMovel(void){
  unsigned int media=0;
    
  for(unsigned char i=0;i<TAMANHO_BUFFER_ENTRADAS_ANALOGICAS;i++)
    media += AA_bufferEntradasAnalogicas[i];
  
  return (unsigned short int)media>>4;
}
/***********************************************************************************
*       Descri��o       :       Faz a amostragem das entradas anal�gicas
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
#pragma inline
void AA_amostragemAnalogica(void){
  static unsigned char indice=0;
  static unsigned char timeOut=3;
  static unsigned int ultimaAmostra;
  static int derivada=0;
  unsigned int temp;
  static unsigned char canal=0;
  static unsigned char indicePapel=0;
     
  if(AD0GDR_bit.DONE){
    canal = ~canal;
    
    if(canal){
      temp = AD0GDR_bit.RESULT;       
      
      derivada = ultimaAmostra - temp;
      if(derivada<0)
        derivada = derivada * -1;
      ultimaAmostra = temp;      
      
      if(derivada<500){
        AA_bufferEntradasAnalogicas[indice]  = temp;
        indice = (indice+1) % TAMANHO_BUFFER_ENTRADAS_ANALOGICAS;        
      }
      
      timeOut = 3;    
      AD0CR_bit.SEL = 2;
      AD0CR_bit.START = 1;        
    }
    else{      
      
      AA_bufferSensorPapel[indicePapel] = AD0GDR_bit.RESULT;            
      indicePapel = (indicePapel+1)%TAMANHO_BUFFER_ENTRADAS_ANALOGICAS;      
      
      timeOut = 3;    
      AD0CR_bit.SEL = 0;
      AD0CR_bit.START = 1;              
    }
    
    
  }//Fim da amostragem
  
  if(timeOut){
    timeOut--;
    if(!timeOut){
      AD0CR_bit.SEL = 0;
      AD0CR_bit.START = 1;         
      timeOut=3;
      canal = 0;
    }      
  }
}
/***********************************************************************************
*       Descri��o       :       Calcula o valor da resist�ncia do termistor
*       Parametros      :       nenhum
*       Retorno         :       (float) resist�ncia do termistor
***********************************************************************************/
float AA_calculaResistor(void){
  float vx;  
  float resistor;
  
  vx = (AA_mediaMovel()*3.3/4096.0);  
  resistor = (RESISTOR_LIMITADOR*(3.3-vx))/vx;    
    
  return resistor;
}
/***********************************************************************************
*       Descri��o       :       Faz o calcula da resist�ncia utilizando
*                               apenas n�meros de ponto fixo
*       Parametros      :       nenhum
*       Retorno         :       (unsigned short int) resist�ncia medida
***********************************************************************************/
unsigned short int AA_calculaResistorInteiro(void){
  unsigned int vmeas;
  unsigned int vx;
  unsigned int rx;
  unsigned int ix;
  
  vmeas = AA_mediaMovel();
  
  vx = vmeas*806;
  
  ix  = (3300000 - vx);   // em micro amperes
  ix /= 499;
  
  vx  = 3300000 - (2*ix*499);
  rx  = vx/ix;
  
  return rx;
  
  /*
  vx*= 52800;
  vx>>=16;
  
  rx = (1650000-(vx*1000));
  rx/= vx;
  
  return rx;    
  */
}
/***********************************************************************************
*       Descri��o       :       Calcula a temperatura do sistema
*       Parametros      :       nenhum
*       Retorno         :       (float) temperatura medida
***********************************************************************************/
unsigned short int AA_calculaTemperatura(void){
  unsigned short int resistor = AA_calculaResistorInteiro();
    
  if(resistor>10000)
    return 25;
  
  for(unsigned short int i=0;i<TAMANHO_TABELA_TERMISTOR-1;i++){
    
    if(resistor<=TABTERM_curva_maximo[i] && resistor>TABTERM_curva_maximo[i+1] ||              
       resistor<=TABTERM_curva_minimo[i] && resistor>TABTERM_curva_maximo[i+1] ) 
      return 28+i;
  }       
  
  return 500;
}
/***********************************************************************************
*       Descri��o       :       Calcula a temperatura utilizando n�meros
*                               inteiros
*       Parametros      :       nenhum
*       Retorno         :       (unsigned short int) temperatura lida do sensor
***********************************************************************************/
unsigned short int AA_calculaTemperaturaInteira(void){  
   
  return (unsigned short int)AA_calculaTemperatura();
}
/***********************************************************************************
*       Descri��o       :       Verifica se o termistor est� conectado
*                               ao adc
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero se o 
*                                               termistor estiver conectado
*                                               ao adc
***********************************************************************************/
unsigned char AA_verificaConexaoTermistor(void){
  
  if(AA_mediaMovel()>10)
    return 255;
  
  return 0;  
}
/***********************************************************************************
*       Descri��o       :       M�dia da amostragem do papel
*       Parametros      :       nenhum
*       Retorno         :       (unsigned short int) m�dia do papel
***********************************************************************************/
unsigned short int AA_mediaMovelPapel(void){
  unsigned int media=0;

  for(unsigned short int i=0;i<TAMANHO_BUFFER_ENTRADAS_ANALOGICAS;i++)
    media+= AA_bufferSensorPapel[i];
  
  media>>=4;  
  
  return media;  
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
