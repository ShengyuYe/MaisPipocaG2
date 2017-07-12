/*__________________________________________________________________________________
|	    Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Balneário Camboriú - SC
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
|       Arquivo            :  sd_diskio.c
|       Descrição          :  Funções para implementação do driver
|                             FAT no SDCARD
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  01/08/2011
|
|       Revisões           :  1.0
|
|
| __________________________________________________________________________________
*/
/***********************************************************************************
*		Includes
***********************************************************************************/
#include <nxp\iolpc1768.h>
#include "diskio.h"
#include "integer.h"
#include "..\sdcard\sdcard.h"
#include "sd_diskio.h"

/***********************************************************************************
*		Definições com constantes utilizadas no programa
***********************************************************************************/ 



/***********************************************************************************
*		Enumerações
***********************************************************************************/


/***********************************************************************************
*		Estruturas
***********************************************************************************/


/***********************************************************************************
*		Uniões
***********************************************************************************/


/***********************************************************************************
*		Constantes
***********************************************************************************/


/***********************************************************************************
*		Variaveis locais
***********************************************************************************/
DSTATUS sdStatus=STA_NOINIT;

/***********************************************************************************
*		Funções locais
***********************************************************************************/
 
/***********************************************************************************
*		Implementação
***********************************************************************************/

/***********************************************************************************
*   Descrição   :   Inicialização dos drives do sistema
*   Parametros  :   (unsigned char) número do drive
*   Retorno     :   (DSTATUS) 
***********************************************************************************/
unsigned int SD_disk_initialize(void){
  
  if( SD_Init()){
     sdStatus &= ~STA_NOINIT;
     return 0;
  }
  
  sdStatus |= STA_NOINIT;    
  return STA_NOINIT;
   //ToDo: Inserir verificação do flag de proteção de escrita
}
/***********************************************************************************
*     Descrição   :   Lê o status do disco passado no parametro
*     Parametros  :   (unsigned char) número do drive
*     Retorno     :   nenhum
***********************************************************************************/
DSTATUS SD_disk_status (void){

  return sdStatus;
}
/***********************************************************************************
*     Descrição   :   Lê um setor de uma das unidades de disco
*     Parametros  :   (unsigned char) drive
*                     (unsigned char*) buffer
*                     (unsigned long int) setor
*                     (unsigned char) tamanho do bloco lido
*     Retorno     :   (DRESULT)
***********************************************************************************/
DRESULT SD_disk_read (unsigned char *buffer,DWORD sector,unsigned char count){

  if(SD_ReadSector(sector,buffer,count))
    return RES_OK;
  
  return RES_ERROR;  
}
/***********************************************************************************
*     Descrição   :   Escreve em um setor de um determinado disco
*     Parametros  :   (unsigned char) drive
*                     (unsigned char*) buffer
*                     (unsigned int) número do setor
*                     (unsigned char) tamanho do bloco escrito
*     Retorno     :   (DRESULT)
***********************************************************************************/
DRESULT SD_disk_write(unsigned char *buff,DWORD sector,unsigned char byte){

  if(SD_WriteSector(sector,buff,byte))
    return RES_OK;
  
  return RES_ERROR;    
}
/***********************************************************************************
*   Descrição   :   Controle de funções específicas do disco
*   Parametros  :   (unsigned char) drive
*                   (unsigned char) comando
*                   (void*) ponteiro para a estrutura de controle do 
*                   comando que será executado
*   Retorno     :   nenhum
***********************************************************************************/
DRESULT SD_disk_ioctl(unsigned char ctrl,void *buff){

  if(ctrl==GET_BLOCK_SIZE)
    *(unsigned int*)buff = 512;
  
  return RES_ERROR;
}
/***********************************************************************************
*		Fim do arquivo
***********************************************************************************/
