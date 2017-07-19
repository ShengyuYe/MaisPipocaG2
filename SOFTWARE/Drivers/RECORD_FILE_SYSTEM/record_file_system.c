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
|       Arquivo            :  record_file_system.c
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  17/07/2017
|
|       Revis�es           :  1
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "record_file_system.h"
#include "..\..\includes.h"

/***********************************************************************************
*       Defini��es
***********************************************************************************/
#define ENDERECO_INICIAL_BLOCOS         0x00001000
#define WRITE_BLOCK                     MEMORYWRAPPER_writeBytes
#define READ_BLOCK                      MEMORYWRAPPER_readBytes             

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Fun��es locais
***********************************************************************************/
unsigned char RFS_calcula_checksum(unsigned char *pData,unsigned short int tamanho);

/***********************************************************************************
*       Implementa��o das fun��es
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Resolve o endere�o do bloco de controle
*                               do arquivo
*       Parametros      :       (unsigned int) posi��o
*       Retorno         :       (unsigned int) endere�o f�sico
***********************************************************************************/
unsigned int RFS_resolve_endereco(unsigned char posicao){
  
  return ENDERECO_INICIAL_BLOCOS + ((sizeof(sRECORD_FILE_SYSTEM)+1)*posicao);
}
/***********************************************************************************
*       Descri��o       :       Salva o bloco de controle de arquivo
*                               na mem�ria flash
*       Parametros      :       (unsigned char) posi��o
*                               (sRECORD_FILE_SYSTEM*) arquivo
*       Retorno         :       (eRFS_RESULT) resultado da opera��o
***********************************************************************************/
eRFS_RESULT RFS_grava_bloco_controle(unsigned int posicao,sRECORD_FILE_SYSTEM *file){
  unsigned char buffer[sizeof(sRECORD_FILE_SYSTEM) + 1];  //tamanho da estrutura mais um byte para o checksum
  
  for(unsigned char i=0;i<sizeof(sRECORD_FILE_SYSTEM);i++) // copia os dados da estrutura para o buffer
    buffer[i] = ((unsigned char*)(file))[i]; // faz o casting para o ponteiro
  
  buffer[sizeof(sRECORD_FILE_SYSTEM)] = RFS_calcula_checksum(buffer, sizeof(sRECORD_FILE_SYSTEM)); // adiciona o Checksum ao �ltimo byte do buffer
  
  WRITE_BLOCK( RFS_resolve_endereco(posicao),buffer,sizeof(sRECORD_FILE_SYSTEM) +1 );  //persiste na flash externa
  
  return RFS_OK;
}
/***********************************************************************************
*       Descri��o       :       Carrega o bloco de controle de um dos
*                               arquivos
*       Parametros      :       (unsigned char) posi��o
*                               (sRECORD_FILE_SYSTEM*) arquivo
*       Retorno         :       (eRFS_RESULT) resultado da opera��o
***********************************************************************************/
eRFS_RESULT RFS_carrega_bloco_controle(unsigned int posicao,sRECORD_FILE_SYSTEM *file){
  unsigned char buffer[sizeof(sRECORD_FILE_SYSTEM) + 1];  
  
  READ_BLOCK( RFS_resolve_endereco(posicao),buffer,sizeof(sRECORD_FILE_SYSTEM)+1);    
  for(unsigned char i=0;i<sizeof(sRECORD_FILE_SYSTEM);i++)
    ((unsigned char*)(file))[i] = buffer[i];
  
  if(buffer[sizeof(sRECORD_FILE_SYSTEM)] == RFS_calcula_checksum(buffer,sizeof(sRECORD_FILE_SYSTEM)))
    return RFS_OK;      
  
  return RFS_CHECKSUM_ERROR;
}
/***********************************************************************************
*       Descri��o       :       Cria um novo arquivo na tabela de arquivos
*                               do sistema
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
eRFS_RESULT RFS_create_file(unsigned char position,char nome[8],char ext[3]){
  sRECORD_FILE_SYSTEM file;
    
  file.state = FREE_FOR_WRITE;
  file.block_size = 0;
  file.external_flash_start = 0;
  RTC_getValue(&file.hour,&file.minute,&file.second,&file.hour,&file.month,&file.year);
  memcpy(file.file_name,nome,8);
  memcpy(file.file_extension,ext,3);  
                                                                 
  
  return RFS_OK;  
}
/***********************************************************************************
*       Descri��o       :       Deleta um arquivo da tabela de arquivos
*                               do sistema
*       Parametros      :       nenhum
*       Retorno         :       (eRFS_RESULT) resultado da opera��o
***********************************************************************************/
eRFS_RESULT RFS_delete_file(unsigned char position){
  
  
  return RFS_OK;  
}
/***********************************************************************************
*       Descri��o       :       Carrega 
*       Parametros      :       (unsigned char) indice do arquivo
*       Retorno         :       (eRFS_RESULT) resultado da opera��o
***********************************************************************************/
eRFS_RESULT RFS_open_file_for_write(unsigned char indice){
  
  
  return RFS_OK;  
}
/***********************************************************************************
*       Descri��o       :       Posiciona o ponteiro de leitura/escrita
*                               no in�cio do arquivo
*       Parametros      :       nenhum
*       Retorno         :       (eRFS_RESULT) resultado da opera��o
***********************************************************************************/
eRFS_RESULT RFS_file_seek(void){
  
  
  return RFS_OK;  
}
/***********************************************************************************
*       Descri��o       :       Adiciona um texto ao final do arquivo
*       Parametros      :       (unsigned char*) ponteiro para os dados
*                               (unsigned short int) tamanho do bloco
*       Retorno         :       (eRFS_RESULT) resultado da opera��o
***********************************************************************************/
eRFS_RESULT RFS_append_file(unsigned char *pData,unsigned short int size){
  
  
  
  return RFS_OK;  
}
/***********************************************************************************
*       Descri��o       :       Fecha o arquivo atual
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
eRFS_RESULT RFS_close_file(void){
  
  
  return RFS_OK;  
}
/***********************************************************************************
*       Descri��o       :       Marca o arquivo atual como apenas leitura
*       Parametros      :       (unsigned char) indice
*       Retorno         :       (eRFS_RESULT) resultado da opera��o
***********************************************************************************/
eRFS_RESULT RFS_close_for_write(unsigned char indice){
  
  
  return RFS_OK;
}
/***********************************************************************************
*       Descri��o       :       Faz o c�lculo do checksum do arquivo
*       Parametros      :       (unsigned char*) ponteiro para o buffer de dados
*                               (unsigned short int) tamanho
*       Retorno         :       (unsigned char) checksum
***********************************************************************************/
unsigned char RFS_calcula_checksum(unsigned char *pData,unsigned short int tamanho){
  unsigned char soma=0xFE;  
  
  for(unsigned short int i=0;i<tamanho;i++)
    soma+=pData[i];
  
  return soma;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/

