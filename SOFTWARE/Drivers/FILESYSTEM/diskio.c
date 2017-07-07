/*__________________________________________________________________________________
|	Chave Digital Tecnologia Eletronica Ltda. 
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
|       Arquivo            :  diskio.c
|       Descrição          :  Middleware para o acesso à memória física
|                             DATAFLASH OU SDCARD
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
#include "sd_diskio.h"
#include "..\rtc\rtc.h"
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
DSTATUS disk_initialize(unsigned char drv){
  
  switch(drv){
   case DRIVE_SD        : return (DSTATUS)SD_disk_initialize();               
//   case DRIVE_DATAFLASH : return (DSTATUS)DataFlash_initialize();
  }
  
  return STA_NOINIT;  
}
/***********************************************************************************
*     Descrição   :   Lê o status do disco passado no parametro
*     Parametros  :   (unsigned char) número do drive
*     Retorno     :   nenhum
***********************************************************************************/
DSTATUS disk_status (unsigned char drv){

  switch(drv){
   case DRIVE_SD        : return (DSTATUS)SD_disk_status();               
//   case DRIVE_DATAFLASH : return (DSTATUS)DataFlash_status();
  }  
  
  return STA_NOINIT;  
}
/***********************************************************************************
*     Descrição   :   Lê um setor de uma das unidades de disco
*     Parametros  :   (unsigned char) drive
*                     (unsigned char*) buffer
*                     (unsigned long int) setor
*                     (unsigned char) tamanho do bloco lido
*     Retorno     :   (DRESULT)
***********************************************************************************/
DRESULT disk_read (unsigned char drv,unsigned char *buffer,
                   DWORD sector,unsigned char count){/* Physical drive number (0) */

  switch(drv){
   case DRIVE_SD        : return (DRESULT)SD_disk_read(buffer,sector,count);
//   case DRIVE_DATAFLASH : return (DRESULT)DataFlash_read(buffer,sector,count);
  }                     
  
  return RES_NOTRDY;  
}
/***********************************************************************************
*     Descrição   :   Escreve em um setor de um determinado disco
*     Parametros  :   (unsigned char) drive
*                     (unsigned char*) buffer
*                     (unsigned int) número do setor
*                     (unsigned char) tamanho do bloco escrito
*     Retorno     :   (DRESULT)
***********************************************************************************/
DRESULT disk_write(unsigned char drv,const unsigned char *buff,
                   DWORD sector,unsigned char byte){

  switch(drv){
   case DRIVE_SD        : return (DRESULT)SD_disk_write((unsigned char*)buff,sector,byte);              
//   case DRIVE_DATAFLASH : return (DRESULT)DataFlash_write((unsigned char*)buff,sector,byte);              
  }                     
  
  return RES_NOTRDY;
}
/***********************************************************************************
*   Descrição   :   Controle de funções específicas do disco
*   Parametros  :   (unsigned char) drive
*                   (unsigned char) comando
*                   (void*) ponteiro para a estrutura de controle do 
*                   comando que será executado
*   Retorno     :   nenhum
***********************************************************************************/
DRESULT disk_ioctl(unsigned char drv,unsigned char ctrl,void *buff){

  switch(drv){
   case DRIVE_SD        : return (DRESULT)SD_disk_ioctl(ctrl,buff);               
//   case DRIVE_DATAFLASH : return (DRESULT)DataFlash_ioctl(ctrl,buff);  
  }  
  
  return RES_NOTRDY;
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
*		Fim do arquivo
***********************************************************************************/
