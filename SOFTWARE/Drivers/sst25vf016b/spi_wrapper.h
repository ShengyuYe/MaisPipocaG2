 /*__________________________________________________________________________________
|	Chave Digital 
|       Balneário Camboriú
| __________________________________________________________________________________
|
|       This source code was developed by Chave Digital and cannot be copied, in part or
|       in whole, or used, except when legally licensed by Chave Digital or its distributors.
|
|       Este código é propriedade da Chave Digital e não pode ser copiado, em parte ou
|       em todo, ou utilizado, exceto quando for legalmente licenciado pela Engesul 
|       ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Product	    :        
|       Module	    :  Wrapper para o controladora SPI do lpc2148
|       File	    :  spi_wrapper.h
|       Description :  Adapter para abstração de plataforma de mcu
|
|       Created on  :  09/06/2009
|       Author      :  Marcos Aquino
|
|       History     :
|
|
| __________________________________________________________________________________
*/
#ifndef SPIWRAPPER_H
#define	SPIWRAPPER_H

#include <nxp\iolpc1768.h>


#define CS_01                   (0x01)<<16
#define CS_02                   (0x01)<<21

#define INIT_CHIP_SELECTS       FIO0DIR |= CS_01;\
                                FIO0SET |= CS_01;\
                                FIO0DIR |= CS_02;\
                                FIO0SET |= CS_02;
                                                                 
#define SEL_CS_01               FIO0CLR |= CS_01
#define UNSEL_CS_01             FIO0SET |= CS_01

#define SEL_CS_02               FIO0CLR |= CS_02
#define UNSEL_CS_02             FIO0SET |= CS_02


void SPIWRAPPER_init(unsigned long int spiClk);
void SPI_sendBytes(unsigned char *buffer,unsigned int size);
void SPI_getBytes(unsigned char *buffer,unsigned int size);

/***********************************************************************************
*	End of file
***********************************************************************************/
#endif //SPIWRAPPER_H