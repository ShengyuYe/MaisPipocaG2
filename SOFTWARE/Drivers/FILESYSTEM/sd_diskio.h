/*__________________________________________________________________________________
|	Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Blumenau - SC
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
|       Arquivo            :  sd_diskio.h
|       Data criação       :  01/08/2011
|       Revisões	   :  1.0.0
|
| __________________________________________________________________________________
*/

#ifndef _SD_DISK_IO_H_
#define	_SD_DISK_IO_H_

unsigned int SD_disk_initialize(void);
DSTATUS SD_disk_status (void);
DRESULT SD_disk_read (unsigned char *buffer,DWORD sector,unsigned char count);
DRESULT SD_disk_write(unsigned char *buff,DWORD sector,unsigned char byte);
DRESULT SD_disk_ioctl(unsigned char ctrl,void *buff);

/***********************************************************************************
*		Fim do arquivo
***********************************************************************************/
#endif // _SD_DISK_IO_H_