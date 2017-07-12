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
|       Arquivo            :  flash_diskio.c
|       Descrição          :  Camada de acesso à memória flash
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  11/07/2017
|
|       Revisões           :  1.0
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



