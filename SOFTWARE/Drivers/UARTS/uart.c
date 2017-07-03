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
|       Arquivo            :  Uart.c
|       Descrição          :  Funções para acesso às uarts do LPC
| 
|       Autor              :  Marcos 
|       Data criação       :  27/07/2011
|
|       Revisões           :  1.0
|
|
| __________________________________________________________________________________
*/
/***********************************************************************************
*		Includes
***********************************************************************************/
#include <stdio.h>
#include <nxp\iolpc1768.h>
#include "uart.h"
#include "uart_types.h"
#include <intrinsics.h>

/***********************************************************************************
*   Constantes
***********************************************************************************/
#define PCLK                                            99047619
#define RECEIVE_DATA_INTERRUPT                          0x01
#define DATA_TRANSMIT_INTERRUPT                         0x02
#define RX_LINE_INTERRUPT                               0x04



#define ENABLE_TXD_3                                    (0x01)<<27
#define ENABLE_RXD_3                                    (0x01)<<28
 
#define INIT_ENABLES_COM3                               FIO0DIR |= ENABLE_TXD_3 | ENABLE_RXD_3

#define SET_TXD_ENABLE_3                                FIO0SET |= ENABLE_TXD_3;
#define CLR_TXD_ENABLE_3                                FIO0CLR |= ENABLE_TXD_3;
/***********************************************************************************
*   Estruturas
***********************************************************************************/
typedef struct{
  void(*funcaoRxd)(unsigned char dado);
  unsigned char*(*funcaoTxd)(void);
  void(*enableFunction)(unsigned char state);
}sFunctions;

/***********************************************************************************
*   Variaveis globais
***********************************************************************************/
sFunctions UART_funcoesVetores[4];

/***********************************************************************************
*   Funções locais
***********************************************************************************/


/***********************************************************************************
*   Implementação das funções
***********************************************************************************/

/***********************************************************************************
*     Descrição   :   Faz a inicialização de uma das uarts
*     Parametros  :   (unsigned char) número da uart
*                     (unsigned int) baudrate
*                     (void)(*funcaoRxd)(unsigned char dado)
*                     (unsigned char*)(*funcaoTxd)(void)
*                     (void)(*enableFunction)(unsigned char state)
*     Retorno     :   nenhum
***********************************************************************************/
void UART_init(unsigned char uart,unsigned long int baudrate,void(*funcRxd)(unsigned char data),
               unsigned char*(*funcTxd)(void),void(*enableFunc)(unsigned char state)){
  unsigned long int Fdiv;
        
  switch(uart){
    case UART_0: 
                 PINSEL0_bit.P0_2 = 0x01;  // Função alternativa para os pinos da COM 0
                 PINSEL0_bit.P0_3 = 0x01;
  
                 PCONP_bit.PCUART0 = 1;
                 PCLKSEL0_bit.PCLK_UART0 = 1;
                 
                 U0LCR = 0x83;   /* 8 bits, no Parity, 1 Stop bit */
                 Fdiv = ( PCLK / 16 ) / baudrate ;  /*baud rate */
                 U0DLM = Fdiv / 256;
                 U0DLL = Fdiv % 256;
                 U0LCR = 0x03;   /* DLAB = 0 */
                 U0FCR = 0x07;   /* Enable and reset TX and RX FIFO. */

                 SETENA0 |= (0x01)<<5;
                 IP1_bit.PRI_5 = 1;
                 
                 U0IER = IER_RBR | IER_THRE | IER_RLS; /* Enable UART0 interrupt */                   
                 break;
    case UART_1: 
                 PINSEL4_bit.P2_0 = 0x02;  // Função alternativa para os pinos da COM 1
                 PINSEL4_bit.P2_1 = 0x02;  // utilizada no protocolo TELET
  
                 PCONP_bit.PCUART1 = 1;
                 PCLKSEL0_bit.PCLK_UART1 = 1;
                 
                 U1LCR = 0x83;   /* 8 bits, no Parity, 1 Stop bit */
                 Fdiv = ( PCLK / 16 ) / baudrate ;  /*baud rate */
                 U1DLM = Fdiv / 256;
                 U1DLL = Fdiv % 256;
                 U1LCR = 0x03;   /* DLAB = 0 */
                 U1FCR = 0x07;   /* Enable and reset TX and RX FIFO. */

                 SETENA0 |= (0x01)<<6;
                 IP1_bit.PRI_6 = 1;
                 
                 U1IER = IER_RBR | IER_THRE | IER_RLS; /* Enable UART0 interrupt */             
                 break;      
    case UART_2:
                 PINSEL0_bit.P0_10 = 1;
                 PINSEL0_bit.P0_11 = 1;
      
                 PCONP_bit.PCUART2 = 1;
                 PCLKSEL1_bit.PCLK_UART2 = 1;
                 
                 U2LCR = 0x83;   /* 8 bits, no Parity, 1 Stop bit */
                 Fdiv = ( PCLK / 16 ) / baudrate ;  /*baud rate */
                 U2DLM = Fdiv / 256;
                 U2DLL = Fdiv % 256;
                 U2LCR = 0x03;   /* DLAB = 0 */
                 U2FCR = 0x00;

                 SETENA0 |= (0x01)<<7;
                 IP1_bit.PRI_7 = 1;
                 
                 U2IER = IER_RBR | IER_THRE;// | IER_RLS; /* Enable UART0 interrupt */         
                 break;      
    case UART_3:
                 PINSEL0_bit.P0_0 = 0x02;  // Função alternativa para os pinos da com 3
                 PINSEL0_bit.P0_1 = 0x02;
  
                 PCONP_bit.PCUART3 = 1;
                 PCLKSEL1_bit.PCLK_UART3 = 1;
                                  
                 U3LCR = 0x83;   /* 8 bits, no Parity, 1 Stop bit */
                 Fdiv = ( PCLK / 16 ) / baudrate ;  /*baud rate */
                 U3DLM = Fdiv / 256;
                 U3DLL = Fdiv % 256;
                 U3LCR = 0x03;   /* DLAB = 0 */
                 U3FCR = 0x07;   /* Enable and reset TX and RX FIFO. */

                 SETENA0 |= (0x01)<<8;// Habilitação da interrupção...
                 IP2_bit.PRI_8 = 1;
                 
                 U3IER = IER_RBR | IER_THRE | IER_RLS; /* Enable UART0 interrupt */               
                 break;      
  }  
}
/**********************************************************************************
*     Descrição   :   Vetor de interrupção da uart 1
*     Parametros  :   nenhum
*     Retorno     :   nenhum
**********************************************************************************/
void UART_irq_uart_1(void){
  unsigned char dummy,*pointer;
  
  switch(U1IIR_bit.IID){
    case THRE:
               pointer = UART_funcoesVetores[1].funcaoTxd();
               if(pointer != NULL){
                  if(UART_funcoesVetores[1].enableFunction)
                    UART_funcoesVetores[1].enableFunction(0xFF);
                  U1THR = *pointer;
               }
               else
                  if(UART_funcoesVetores[1].enableFunction)
                    UART_funcoesVetores[1].enableFunction(0x00);
               break; 
    case RDA : dummy = U1RBR;
               UART_funcoesVetores[1].funcaoRxd(dummy);
               break;      
    case RLS : 
               dummy = U1LSR;
               dummy = U1RBR;               
               break;      
    case CTI :
               break;      
  }  
  
  //Apaga o flag de interrupção pendente
  CLRPEND0 |= (0x01)<<6;    
}
/**********************************************************************************
*     Descrição   :   Vetor de interrupção da uart 2
*     Parametros  :   nenhum
*     Retorno     :   nenhum
**********************************************************************************/
void UART_irq_uart_2(void){
  /*
  unsigned char dummy,*pointer;
  
  switch(U2IIR_bit.IID){
    case THRE:
               pointer = UART_funcoesVetores[2].funcaoTxd();
               if(pointer != NULL){
                  if(UART_funcoesVetores[2].enableFunction)
                    UART_funcoesVetores[2].enableFunction(0xFF);
                  U2THR = *pointer;
               }
               else
                  if(UART_funcoesVetores[2].enableFunction)
                    UART_funcoesVetores[2].enableFunction(0x00);
               break; 
    case RDA : dummy = U2RBR;
               UART_funcoesVetores[2].funcaoRxd(dummy);
               break;      
    case RLS : 
               dummy = U2LSR;
               dummy = U2RBR;               
               break;      
    case CTI :
               break;      
  }  
  
  //Apaga o flag de interrupção pendente
  CLRPEND0 |= (0x01)<<7;   
  */
}
/*********************************************************************************
*     Descrição   :   Vetor de interrupção da uart 3
*     Parametros  :   nenhum
*     Retorno     :   nenhum
*********************************************************************************/
void UART_irq_uart_3(void){
  unsigned char dummy,*pointer;
  
  switch(U3IIR_bit.IID){
    case THRE:
               pointer = UART_funcoesVetores[3].funcaoTxd();
               if(pointer != NULL){
                  SET_TXD_ENABLE_3;
                  U3THR = *pointer;
               }
               else                 
                 CLR_TXD_ENABLE_3;
               break; 
    case RDA : dummy = U3RBR;
               UART_funcoesVetores[3].funcaoRxd(dummy);
               break;      
    case RLS : 
               dummy = U3LSR;
               dummy = U3RBR;               
               break;      
    case CTI :
               break;      
  }  
  
  //Apaga o flag de interrupção pendente
  CLRPEND0 |= (0x01)<<8;               
}
/*********************************************************************************
*     Fim do arquivo
*********************************************************************************/