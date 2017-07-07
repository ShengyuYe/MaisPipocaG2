/**************************************************************************//**
 * @file     lpc17xx_spi.h
 * @brief    Header file for lpc17xx_spi.c.
 * @version  1.0
 * @date     18. Nov. 2010
 *
 * @note
 * Copyright (C) 2010 NXP Semiconductors(NXP). All rights reserved.
 *
 * @par
 * Software that is described herein is for illustrative purposes only
 * which provides customers with programming information regarding the
 * products. This software is supplied "AS IS" without any warranties.
 * NXP Semiconductors assumes no responsibility or liability for the
 * use of the software, conveys no license or title under any patent,
 * copyright, or mask work right to the product. NXP Semiconductors
 * reserves the right to make changes in the software without
 * notification. NXP Semiconductors also make no representation or
 * warranty that such application will be suitable for the specified
 * use without further testing or modification.
 ******************************************************************************/

#ifndef __SPI_WRAPPER_SD_H_
#define __SPI_WRAPPER_SD_H_


/* SPI clock rate setting. 
SSP0_CLK = SystemCoreClock / divider,
The divider must be a even value between 2 and 254!
In SPI mode, max clock speed is 20MHz for MMC and 25MHz for SD */
#define SPI_CLOCKRATE_LOW   (unsigned int) 4000000//400 0000//400000//(250)   /* 100MHz / 250 = 400kHz */
#define SPI_CLOCKRATE_HIGH  (unsigned int) 25000000//25000000//(4)     /* 100MHz / 4 = 25MHz */

/* Public functions */
void SPI_Init (void);
void SPI_ConfigClockRate (unsigned int SPI_CLOCKRATE);
void SPI_CS_Low (void);
void SPI_CS_High (void);
unsigned char SPI_SendByte (unsigned char data);
unsigned char SPI_RecvByte (void);

#endif  // __SPI_WRAPPER_SD_H_

/***********************************************************************************
*   Fim do arquivo
***********************************************************************************/

