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
|       Module	    : SPI wrapper
|       File	    : SPI_WRAPPER.C
|       Description : Wrapper para funções spi utilizadas em escrita em memórias
|	Author      : Marcos Aquino
|
|       Created on  : 09/06/2009
|
|       History     : 
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*	Includes
***********************************************************************************/
#include "spi_wrapper.h"
#include "..\..\includes.h"

/***********************************************************************************
*	Defines - Local
***********************************************************************************/ 
#define PCLK                    96000000

#define SCK                     (0x01)<<15
#define MISO                    (0x01)<<17
#define MOSI                    (0x01)<<18


#define SCK_FUNC                PINSEL0_bit.P0_15  
#define MISO_FUNC               PINSEL1_bit.P0_17  
#define MOSI_FUNC               PINSEL1_bit.P0_18  

/***********************************************************************************
*	Enumerations - Local
***********************************************************************************/


/***********************************************************************************
*	Structs - Local
***********************************************************************************/


/***********************************************************************************
*	Types - Local
***********************************************************************************/


/***********************************************************************************
*	Variables - Local
***********************************************************************************/
unsigned char dummy;
/***********************************************************************************
*	Functions - Local
***********************************************************************************/


/***********************************************************************************
*	Implementations
***********************************************************************************/

/***********************************************************************************
*       Descrição     : Inicialização do módulo
*       Parametros    : (unsigned int) xtal value
*                       (unsigned int) spi clock
*       Retorno       : nenhum
***********************************************************************************/
void SPIWRAPPER_init(unsigned long int spiClk){
  unsigned int divisor;
    
  divisor = 8;//4;//PCLK/spiClk;
  divisor &=~(0x01); // Aham!!!! Me diga o que isso faz!!!!! Se souber, está contratado!!!!
    
  INIT_CHIP_SELECTS;
  UNSEL_CS_01;
  UNSEL_CS_02;
  
  // Configura a função SPI para os pinos
  SCK_FUNC = 2;
  MISO_FUNC = 2;
  MOSI_FUNC = 2;
  
  PCONP_bit.PCSSP0 = 1; // Ativa a alimentação do periférico
  PCLKSEL1_bit.PCLK_SSP0 = 1; // Ativa o clock do periférico
  
  SSP0CR0_bit.DSS = 0x07; // 8 bits de dados
  SSP0CR0_bit.FRF = 0x00; // Frame em formato SPI
  SSP0CR0_bit.CPOL = 1; // Foi levantado que era assim na firmware da MX-485 
  SSP0CR0_bit.CPHA = 1; // tem que ver pq...
  
  SSP0CR0_bit.SCR = divisor<<8;
  
  SSP0CPSR = divisor;
  
  SSP0CR1_bit.LBM = 0; // Modo normal, sem loopback
  SSP0CR1_bit.SSE = 1; // Módulo habilitado
  SSP0CR1_bit.MS  = 0; // Modo mestre
  SSP0CR1_bit.SOD = 0; // É dummy nesse modo
    
  for(unsigned int i=0;i<8;i++)
    dummy = SSP0DR;  
}
/***********************************************************************************
*       Descrição     :    Escreve um buffer de dados na SPI  
*       Parametros    :   (unsigned char*) buffer de dados
*                         (unsigned int) tamanho do buffer
*       Retorno       :   nenhum
***********************************************************************************/
void SPI_sendBytes(unsigned char *buffer,unsigned int size){
    
  if(size==0){
    return;
  }
  
  while(size){
    
    while(! (SSP0SR & 0x02));//Se está setado é pq o buffer está cheio
    SSP0DR = *buffer;
    while(! (SSP0SR & 0x04));//
    dummy = SSP0DR;
    size--;
    buffer++;                
  }      
}
/***********************************************************************************
*       Descrição     :    Lê um pacote de dados da SPI
*       Parametros    :   (unsigned char*) buffer de dados
*                         (unsigned int) tamanho do buffer
*       Retorno       :   nenhum
***********************************************************************************/
void SPI_getBytes(unsigned char *buffer,unsigned int size){
 
  for(unsigned int i=0;i<size;i++){
   
    SSP0DR = 0xFF;//Dummy write, na verdade gera os clocks para ler os dados
    while( SSP0SR & 0x10);//Aguarda finalizar o envio do byte em questão
    *buffer = SSP0DR;
    buffer++;      
  }     
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/