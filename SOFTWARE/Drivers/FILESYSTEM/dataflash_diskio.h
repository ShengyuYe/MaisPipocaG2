/*__________________________________________________________________________________
|	Dextro solu��es tecnol�gicas.
|       
|       Itaja�/SC
|       www.dextro-st.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Dextro and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Dextro
|       or its distributors.
|
|       Este c�digo � propriedade da Dextro e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Dextro ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  flash_diskio.c
|       Descri��o          :  Camada de acesso � mem�ria flash
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  11/07/2017
|
|       Revis�es           :  1.0
|
|
| __________________________________________________________________________________
*/
#ifndef _DATAFLASH_DISK_IO_H_
#define _DATAFLASH_DISK_IO_H_



unsigned int DF_disk_initialize(void);
DSTATUS DF_disk_status (void);
DRESULT DF_disk_read (unsigned char *buffer,DWORD sector,unsigned char count);
DRESULT DF_disk_write(unsigned char *buff,DWORD sector,unsigned char byte);
DRESULT DF_disk_ioctl(unsigned char ctrl,void *buff);








/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
#endif//_DATAFLASH_DISK_IO_H_



