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
/**********************************************************************************
*       Includes
**********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "diskio.h"
#include "integer.h"
#include "..\..\includes.h"

/**********************************************************************************
*       Definições
**********************************************************************************/
#define DF_SECTOR_SIZE                  4096

/**********************************************************************************
*       Variaveis locais
**********************************************************************************/
DSTATUS dfStatus=STA_NOINIT;

/**********************************************************************************
*       Funções locais
**********************************************************************************/


/**********************************************************************************
*       Implementação das funções
**********************************************************************************/

/***********************************************************************************
*   Descrição   :   Inicialização dos drives do sistema
*   Parametros  :   (unsigned char) número do drive
*   Retorno     :   (DSTATUS) 
***********************************************************************************/
unsigned int DF_disk_initialize(void){
  
  //if( SD_Init()){
//     sdStatus &= ~STA_NOINIT;
//     return 0;
//  }
  
  dfStatus |= STA_NOINIT;    
  return STA_NOINIT;
   //ToDo: Inserir verificação do flag de proteção de escrita
}
/***********************************************************************************
*     Descrição   :   Lê o status do disco passado no parametro
*     Parametros  :   (unsigned char) número do drive
*     Retorno     :   nenhum
***********************************************************************************/
DSTATUS DF_disk_status (void){

  return dfStatus;
}
/***********************************************************************************
*     Descrição   :   Lê um setor de uma das unidades de disco
*     Parametros  :   (unsigned char) drive
*                     (unsigned char*) buffer
*                     (unsigned long int) setor
*                     (unsigned char) tamanho do bloco lido
*     Retorno     :   (DRESULT)
***********************************************************************************/
DRESULT DF_disk_read (unsigned char *buffer,DWORD sector,unsigned char count){
  
  MEMORYWRAPPER_readBytes(sector*DF_SECTOR_SIZE,buffer,count);
  return RES_OK;  
}
/***********************************************************************************
*     Descrição   :   Escreve em um setor de um determinado disco
*     Parametros  :   (unsigned char) drive
*                     (unsigned char*) buffer
*                     (unsigned int) número do setor
*                     (unsigned char) tamanho do bloco escrito
*     Retorno     :   (DRESULT)
***********************************************************************************/
DRESULT DF_disk_write(unsigned char *buff,DWORD sector,unsigned char byte){

  MEMORYWRAPPER_writeBytes(sector*DF_SECTOR_SIZE,buff,byte);
  return RES_OK;  
}
/***********************************************************************************
*   Descrição   :   Controle de funções específicas do disco
*   Parametros  :   (unsigned char) drive
*                   (unsigned char) comando
*                   (void*) ponteiro para a estrutura de controle do 
*                   comando que será executado
*   Retorno     :   nenhum
***********************************************************************************/
DRESULT DF_disk_ioctl(unsigned char ctrl,void *buff){

  if(ctrl==GET_BLOCK_SIZE)
    *(unsigned int*)buff = DF_SECTOR_SIZE;
  
  return RES_ERROR;
}
/**********************************************************************************
*       Fim do arquivo
**********************************************************************************/