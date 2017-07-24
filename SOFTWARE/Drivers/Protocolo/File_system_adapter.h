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
|       Arquivo            :  file_system_adapter.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  24/07/2017
|
|       Revisões           :  1

|
|
| __________________________________________________________________________________
*/
#ifndef _FILE_SYSTEM_ADAPTER_H_
#define _FILE_SYSTEM_ADAPTER_H_


void FSA_write_start_of_file(unsigned char file_index,
                             unsigned int start_address);

void FSA_write_memory_data(unsigned int start_address,
                           unsigned char *pData,
                           unsigned short int size);

void FSA_format_audio_memory(void);
/************************************************************************************
*       Fim do arquivo
************************************************************************************/
#endif//_FILE_SYSTEM_ADAPTER_H_