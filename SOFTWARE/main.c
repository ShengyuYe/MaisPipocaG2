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
|       Arquivo            :  main.c
|       Descri��o          :  m�dulo principal do sistema
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  15/02/2017
|
|       Revis�es           :  001
|
|
| __________________________________________________________________________________
*/
/***********************************************************************************
*       Includes
***********************************************************************************/
#include <nxp\iolpc1768.h>
#include "includes.h"

/***********************************************************************************
*       Fun��es locais
***********************************************************************************/
void lowLevelInit( void );

/***********************************************************************************
*       Fun��es externas
***********************************************************************************/


/***********************************************************************************
*       Implementa��o
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Fun��o principal do sistema
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void main(void){
  
  lowLevelInit();
  BOARD_ini();
  
  xTaskCreate(APLICACAO_main ,"APLICACAO" ,256,NULL,1,NULL);
  xTaskCreate(BOARD_main     ,"IU"        ,128 ,NULL,1,NULL);  
  xTaskCreate(PAGAMENTOS_main,"PAGAMENTOS",128 ,NULL,1,NULL);  
  xTaskCreate(BV20_main      ,"BV20"      ,128 ,NULL,1,NULL);  
  xTaskCreate(LEDS_main      ,"LEDS"      ,128 ,NULL,1,NULL);      
  xTaskCreate(PROTOCOLO_main ,"PROT"      ,128 ,NULL,1,NULL);      
  
  //Inicializa��o do escalonador, essa fun��o nunca retornar�
  vTaskStartScheduler();  
  
  for(;;);
}
/***********************************************************************************
*       Descri��o       :       Inicializa��o b�sica do sistema
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void lowLevelInit( void ){
  
  SC->PCONP = 0;            // Disable peripherals power. 
  SC->PCONP = PCONP_PCGPIO; // Enable GPIO power. 

  PINCON->PINSEL10 = 0;     //   Disable TPIU.

  if ( SC->PLL0STAT & ( 1 << 25 ) )
  {
	/* Enable PLL, disconnected. */
        SC->PLL0CON = 1;			
	SC->PLL0FEED = PLLFEED_FEED1;
	SC->PLL0FEED = PLLFEED_FEED2;
  }
	
  /* Disable PLL, disconnected. */
  SC->PLL0CON = 0;				
  SC->PLL0FEED = PLLFEED_FEED1;
  SC->PLL0FEED = PLLFEED_FEED2;
	
  /* Enable main OSC. */
  SC->SCS |= 0x20;			
  while( !( SC->SCS & 0x40 ) );
	
  /* select main OSC, 12MHz, as the PLL clock source. */
  SC->CLKSRCSEL = 0x1;		
	
  SC->PLL0CFG = 0x20031;
  SC->PLL0FEED = PLLFEED_FEED1;
  SC->PLL0FEED = PLLFEED_FEED2;
	      
  /* Enable PLL, disconnected. */
  SC->PLL0CON = 1;				
  SC->PLL0FEED = PLLFEED_FEED1;
  SC->PLL0FEED = PLLFEED_FEED2;
	
  /* Set clock divider. */
  SC->CCLKCFG = 0x03;
	
  /* Configure flash accelerator. */
  SC->FLASHCFG = 0x603a;
	
  /* Check lock bit status. */
  while( ( ( SC->PLL0STAT & ( 1 << 26 ) ) == 0 ) );	
	
  /* Enable and connect. */
  SC->PLL0CON = 3;				
  SC->PLL0FEED = PLLFEED_FEED1;
  SC->PLL0FEED = PLLFEED_FEED2;
  while( ( ( SC->PLL0STAT & ( 1 << 25 ) ) == 0 ) );	
			
  /* Configure the clock for the USB. */

  if( SC->PLL1STAT & ( 1 << 9 ) )
  {
	/* Enable PLL, disconnected. */
	SC->PLL1CON = 1;			
	SC->PLL1FEED = PLLFEED_FEED1;
	SC->PLL1FEED = PLLFEED_FEED2;
  }	
  /* Disable PLL, disconnected. */
  SC->PLL1CON = 0;				
  SC->PLL1FEED = PLLFEED_FEED1;
  SC->PLL1FEED = PLLFEED_FEED2;
	
  SC->PLL1CFG = 0x23;
  SC->PLL1FEED = PLLFEED_FEED1;
  SC->PLL1FEED = PLLFEED_FEED2;
	
  /* Enable PLL, disconnected. */
  SC->PLL1CON = 1;				
  SC->PLL1FEED = PLLFEED_FEED1;
  SC->PLL1FEED = PLLFEED_FEED2;
  while( ( ( SC->PLL1STAT & ( 1 << 10 ) ) == 0 ) );
	
  /* Enable and connect. */
  SC->PLL1CON = 3;				
  SC->PLL1FEED = PLLFEED_FEED1;
  SC->PLL1FEED = PLLFEED_FEED2;
  while( ( ( SC->PLL1STAT & ( 1 << 9 ) ) == 0 ) );
	
  /*  Setup the peripheral bus to be the same as the PLL output (64 MHz). */
  SC->PCLKSEL0 = 0x05555555;
}
/***********************************************************************************
*   Descri��o     :  Essa fun��o ser� chamada se houver estouro no stack pointer
*   Parametros    : 
*   Retorno       : 
***********************************************************************************/
void vApplicationStackOverflowHook( xTaskHandle *pxTask, signed char *pcTaskName){

  ( void ) pxTask;
  ( void ) pcTaskName;
  
  for( ;; );
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
