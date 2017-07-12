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
*       Defini��es
**********************************************************************************/
#define DF_SECTOR_SIZE                  4096

/**********************************************************************************
*       Variaveis locais
**********************************************************************************/
DSTATUS dfStatus=STA_NOINIT;

/**********************************************************************************
*       Fun��es locais
**********************************************************************************/


/**********************************************************************************
*       Implementa��o das fun��es
**********************************************************************************/

/***********************************************************************************
*   Descri��o   :   Inicializa��o dos drives do sistema
*   Parametros  :   (unsigned char) n�mero do drive
*   Retorno     :   (DSTATUS) 
***********************************************************************************/
unsigned int DF_disk_initialize(void){
  
  //if( SD_Init()){
//     sdStatus &= ~STA_NOINIT;
//     return 0;
//  }
  
  dfStatus |= STA_NOINIT;    
  return STA_NOINIT;
   //ToDo: Inserir verifica��o do flag de prote��o de escrita
}
/***********************************************************************************
*     Descri��o   :   L� o status do disco passado no parametro
*     Parametros  :   (unsigned char) n�mero do drive
*     Retorno     :   nenhum
***********************************************************************************/
DSTATUS DF_disk_status (void){

  return dfStatus;
}
/***********************************************************************************
*     Descri��o   :   L� um setor de uma das unidades de disco
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
*     Descri��o   :   Escreve em um setor de um determinado disco
*     Parametros  :   (unsigned char) drive
*                     (unsigned char*) buffer
*                     (unsigned int) n�mero do setor
*                     (unsigned char) tamanho do bloco escrito
*     Retorno     :   (DRESULT)
***********************************************************************************/
DRESULT DF_disk_write(unsigned char *buff,DWORD sector,unsigned char byte){

  MEMORYWRAPPER_writeBytes(sector*DF_SECTOR_SIZE,buff,byte);
  return RES_OK;  
}
/***********************************************************************************
*   Descri��o   :   Controle de fun��es espec�ficas do disco
*   Parametros  :   (unsigned char) drive
*                   (unsigned char) comando
*                   (void*) ponteiro para a estrutura de controle do 
*                   comando que ser� executado
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