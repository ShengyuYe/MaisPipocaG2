/*__________________________________________________________________________________
|	Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Balneário Camboriú - SC
|       www.chavedigital.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Chave Digital and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Chave Digital
|       or its distributors.
|
|       Este código é propriedade da Chave Digital e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Chave Digital ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :
|       Descrição          :
| 
|       Autor              :
|       Data criação       :
|
|       Revisões           :
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*   Includes
***********************************************************************************/
#include <nxp\iolpc1768.h>
#include "spi_wrapper_sd.h"

/***********************************************************************************
*   Definições
***********************************************************************************/
#define SSP_SR_TFE            ((unsigned int)(1<<0)) 
#define SSP_SR_TNF            ((unsigned int)(1<<1)) 
#define SSP_SR_RNE            ((unsigned int)(1<<2)) 
#define SSP_SR_RFF            ((unsigned int)(1<<3)) 
#define SSP_SR_BSY            ((unsigned int)(1<<4)) 
#define SSP_SR_BITMASK	      ((unsigned int)(0x1F)) 

#define CS_PIN_               (0x01)<<6
#define SPI_PCLK              64000000
/***********************************************************************************
*   Implementação
***********************************************************************************/

/***********************************************************************************
* @brief  Initializes the SSP0.
*
* @param  None
* @retval None 
***********************************************************************************/
void SPI_Init (void){
  
  // Liga a energia pro módulo  
  PCONP_bit.PCSSP1 = 1;
  
  // Inicia o chipselect em nível alto
  FIO0DIR |= CS_PIN_;
  FIO0SET |= CS_PIN_;    
  
  // Configura a função SPI1 para os pinos
  PINSEL0_bit.P0_7 = 0x02;
  PINSEL0_bit.P0_8 = 0x02;
  PINSEL0_bit.P0_9 = 0x02;
    
  /* Configure SSP0_PCLK to CCLK(100MHz), default value is CCLK/4 */    
  //LPC_SC->PCLKSEL1 &= ~(3 << 10);
  //LPC_SC->PCLKSEL1 |=  (1 << 10);  /* SSP0_PCLK=CCLK */
  PCLKSEL0_bit.PCLK_SSP1 = 0;//1;
    
  /* 8bit, SPI frame format, CPOL=0, CPHA=0, SCR=0 */  
  //LPC_SSP1->CR0 = (0x07 << 0) |     /* data width: 8bit*/
  //                (0x00 << 4) |     /* frame format: SPI */
  //                (0x00 << 6) |     /* CPOL: low level */
  //                (0x00 << 7) |     /* CPHA: first edge */
  //                (0x00 << 8);      /* SCR = 0 */
  SSP1CR0 = (0x07 << 0) |     /* data width: 8bit*/
            (0x00 << 4) |     /* frame format: SPI */
            (0x00 << 6) |     /* CPOL: low level */
            (0x00 << 7) |     /* CPHA: first edge */
            (0x00 << 8);      /* SCR = 0 */
  
  /* Enable SSP0 as a master */
  //LPC_SSP1->CR1 = (0x00 << 0) |   /* Normal mode */
  //                (0x01 << 1) |   /* Enable SSP0 */
  //                (0x00 << 2) |   /* Master */
  //                (0x00 << 3);    /* slave output disabled */
  
  SSP1CR1 = (0x00 << 0) |   /* Normal mode */
            (0x01 << 1) |   /* Enable SSP0 */
            (0x00 << 2) |   /* Master */
            (0x00 << 3);    /* slave output disabled */    

  /* Configure SSP1 clock rate to 400kHz (100MHz/250) */
  SPI_ConfigClockRate (SPI_CLOCKRATE_LOW);
  
  /* Set SSEL to high */
  SPI_CS_High ();
}
/***********************************************************************************
* @brief  Configure SSP0 clock rate.
*
* @param  SPI_CLOCKRATE: Specifies the SPI clock rate.
*         The value should be SPI_CLOCKRATE_LOW or SPI_CLOCKRATE_HIGH.
* @retval None 
*
* SSP0_CLK = CCLK / SPI_CLOCKRATE
***********************************************************************************/
void SPI_ConfigClockRate (unsigned int SPI_CLOCKRATE){
  unsigned int divisor;
  
  divisor = SPI_PCLK/SPI_CLOCKRATE;
  divisor &=~(0x01); // Aham!!!! Me diga o que isso faz!!!!! Se souber, está contratado!!!!
  
  SSP1CR0_bit.SCR = divisor<<8;  
  SSP1CPSR = divisor;  
}
/***********************************************************************************
* @brief  Set SSEL to low: select spi slave.
*
* @param  None.
* @retval None 
***********************************************************************************/
void SPI_CS_Low (void){

  FIO0CLR |= CS_PIN_;
}
/***********************************************************************************
* @brief  Set SSEL to high: de-select spi slave.
*
* @param  None.
* @retval None 
***********************************************************************************/
void SPI_CS_High (void){
  
  FIO0SET |= CS_PIN_;
}
/***********************************************************************************
* @brief  Send one byte via MOSI and simutaniously receive one byte via MISO.
*
* @param  data: Specifies the byte to be sent out.
* @retval Returned byte.
*
* Note: Each time send out one byte at MOSI, Rx FIFO will receive one byte. 
***********************************************************************************/
unsigned char SPI_SendByte (unsigned char data){ 
  unsigned char temp;
  
  while(! (SSP1SR & 0x02));//Se está setado é pq o buffer está cheio
  SSP1DR = data;
  while(! (SSP1SR & 0x04));//
  temp = SSP1DR;  
  
  return temp;
}
/***********************************************************************************
* @brief  Receive one byte via MISO.
*
* @param  None.
* @retval Returned received byte.
***********************************************************************************/
unsigned char SPI_RecvByte (void){

  return SPI_SendByte (0xFF);
}
/***********************************************************************************
* Fim do arquivo
***********************************************************************************/
