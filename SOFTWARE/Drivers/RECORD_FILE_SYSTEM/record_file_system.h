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
|       Arquivo            :  record_file_system.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  17/07/2017
|
|       Revisões           :  1
|
|
| __________________________________________________________________________________
*/

#ifndef _RECORD_FILE_SYSTEM_H_
#define _RECORD_FILE_SYSTEM_H_

typedef enum{
  RFS_OK=0,
  RFS_ERROR,
  RFS_NOT_AVAILABLE_FOR_WRITE,
  RFS_CHECKSUM_ERROR
}eRFS_RESULT;

typedef enum{
  FREE_FILE,
  FREE_FOR_WRITE,
  READ_ONLY
}eRFS_BLOCK_STATE;


typedef struct{
  eRFS_BLOCK_STATE state;
  unsigned int block_size;
  unsigned int external_flash_start;
  unsigned char hour,minute,second,day,month;
  unsigned int year;
  char file_name[8];
  char file_extension[3];    
}sRECORD_FILE_SYSTEM;


eRFS_RESULT RFS_create_file(unsigned char position,char nome[8],char ext[3]);

eRFS_RESULT RFS_delete_file(unsigned char position);
  

eRFS_RESULT RFS_open_file_for_write(unsigned char indice);

eRFS_RESULT RFS_file_seek(void);

eRFS_RESULT RFS_append_file(unsigned char *pData,unsigned short int size);

eRFS_RESULT RFS_close_file(void);

eRFS_RESULT RFS_close_for_write(unsigned char indice);


/**********************************************************************************
*       Fim do arquivo
**********************************************************************************/
#endif//_RECORD_FILE_SYSTEM_H_