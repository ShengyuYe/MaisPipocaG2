/*__________________________________________________________________________________
|	Dextro soluções tecnológicas.
|       
|       Itajaí/SC
|       www.dextro-st.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Dextro and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Dextro
|       or its distributors.
|
|       Este código é propriedade da Dextro e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Dextro ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  diskio.c
|       Descrição          :  Camada de acesso à mídia
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  17/07/2017
|
|       Revisões           :  1.0
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       Includes
***********************************************************************************/
#include "diskio.h"		/* FatFs lower layer API */



/***********************************************************************************
*       Definições
***********************************************************************************/
/* Definitions of physical drive number for each drive */
#define DEV_RAM		0	/* Example: Map Ramdisk to physical drive 0 */
#define DEV_MMC		1	/* Example: Map MMC/SD card to physical drive 1 */
#define DEV_USB		2	/* Example: Map USB MSD to physical drive 2 */

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Get drive status
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
DSTATUS disk_status(BYTE pdrv){
  DSTATUS stat;
  int result;

  switch (pdrv) {
    case DEV_RAM :
         return DF_disk_status();
    case DEV_MMC :
	 //result = MMC_disk_status();
         // translate the reslut code here
         return stat;
    case DEV_USB :
         //result = USB_disk_status();
         // translate the reslut code here
         return stat;
   }
  
   return STA_NOINIT;
}
/***********************************************************************************
*       Descrição       :       Inicialização do disco
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
DSTATUS disk_initialize(BYTE pdrv){
  DSTATUS stat;
  int result;

  switch (pdrv) {
    case DEV_RAM :
         //result = RAM_disk_initialize();
         // translate the reslut code here
         return DF_disk_initialize();
    case DEV_MMC :
         //result = MMC_disk_initialize();
         // translate the reslut code here
         return stat;
    case DEV_USB :
         //result = USB_disk_initialize();
         // translate the reslut code here
         return stat;
   }
  
   return STA_NOINIT;
}
/***********************************************************************************
*       Descrição       :       Lê um bloco do disco
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
DRESULT disk_read(BYTE pdrv,BYTE *buff,DWORD sector,UINT count){
  DRESULT res;
  int result;

  switch (pdrv) {
    case DEV_RAM :
                  // translate the arguments here
		  result = DF_disk_read(buff, sector, count);
		  // translate the reslut code here
		  return res; 
    case DEV_MMC :
	  	  // translate the arguments here
		  //result = MMC_disk_read(buff, sector, count);
		  // translate the reslut code here
		  return res; 
    case DEV_USB :
	  	  // translate the arguments here
	          //result = USB_disk_read(buff, sector, count);
		  // translate the reslut code here
		  return res;
  }

  return RES_PARERR;
}
/***********************************************************************************
*       Descrição       :       Escreve um bloco no disco
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
DRESULT disk_write(BYTE pdrv,const BYTE *buff,DWORD sector,UINT count){
  DRESULT res;
  int result;
  
  switch (pdrv) {
    case DEV_RAM :
		// translate the arguments here
		result = DF_disk_write(buff, sector, count);
		// translate the reslut code here
		return res;
    case DEV_MMC :
		// translate the arguments here
		//result = MMC_disk_write(buff, sector, count);
		// translate the reslut code here
		return res;
    case DEV_USB :
		// translate the arguments here
		//result = USB_disk_write(buff, sector, count);
		// translate the reslut code here
		return res;
  }

  return RES_PARERR;
}
/***********************************************************************************
*       Descrição       :       Verifica o status do disco
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
DRESULT disk_ioctl(BYTE pdrv,BYTE cmd,void *buff){
  DRESULT res;
  int result;

  switch (pdrv) {
    case DEV_RAM :
		// Process of the command for the RAM drive
                res = DF_disk_ioctl(cmd,buff);
		return res;
    case DEV_MMC :
		// Process of the command for the MMC/SD card
		return res; 
    case DEV_USB :
		// Process of the command the USB drive
		return res;
  }

  return RES_PARERR;
}
/***********************************************************************************
*   Descrição   :   Função para leitura do relógio
*   Parametros  :   nenhum
*   Retorno     :   nenhum
***********************************************************************************/
DWORD get_fattime(void){
  unsigned char hora,minuto,segundo,dia,mes;
  unsigned int ano;  
  DWORD relogio=0;
  
  RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
  
  if(ano>2000)
    ano-=2000;
  else
    ano = 32;
  ano&= 0x7F;
  relogio = ano;

  if(mes>12)
    mes = 12;
  mes &= 0x0F;
  relogio<<=4;
  relogio|= mes;
  
  if(dia>31)
    dia =31;
  relogio<<=5;
  relogio|=dia;
  
  if(hora>23)
    hora=23;
  relogio<<=5;
  relogio |= hora;
  
  if(minuto>59)
    minuto = 59;
  relogio<<=5;
  relogio|=minuto;
  
  if(segundo>59)
    segundo=59;
  segundo>>=1;
  relogio<<=4;
  relogio|= segundo;
  
  return relogio; 
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/

