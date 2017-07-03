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
|       Product	    :       
|       Module	    :   Adapter para mem�ria AT45011 ficar linear
|       File	    :   memoryWrapper.c
|       Description :   Cria uma abstra��o para utilziar a AT45DB011 como mem�ria linear
|	Author      :   Marcos Aquino
|
|       Created on  :   12/06/2009
|                       25/07/2011 - Inicio da altera��o para a funcionar com
|                       N chips externos, al�m de resolver o cruzamento
|                       de endere�amento entre os CHIPs
|
|       History     :   
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*	Includes
***********************************************************************************/
#include <nxp\iolpc1768.h>
#include <string.h>
#include "sst25vf016b.h"
#include "memoryWrapper.h"
#include "paginacaoMemoriaFlash.h"
#include "spi_wrapper.h"
#include "..\..\includes.h"

/***********************************************************************************
*	Defines - Local
***********************************************************************************/ 
#define TAMANHO_PAGINA_SST25VF016                           4096
#define QTD_PAGINAS_SST25VF016                              512 

#define TAMANHO_PAGINA_AT45DB011                            264
#define QTD_PAGINAS_AT45DB011                               512

/***********************************************************************************
*       Constantes
***********************************************************************************/
const unsigned int tamanhoPaginas[3]={
  [0] = TAMANHO_PAGINA_AT45DB011,
  [1] = TAMANHO_PAGINA_AT45DB011,
  [2] = TAMANHO_PAGINA_SST25VF016
};

/***********************************************************************************
*	Enumerations - Local
***********************************************************************************/


/***********************************************************************************
*	Structs - Local
***********************************************************************************/


/***********************************************************************************
*	Types - Local
***********************************************************************************/


/***********************************************************************************
*	Variables - Local
***********************************************************************************/
xSemaphoreHandle semDataFlash;
unsigned char MEMORYWRAPPER_localBuffer[TAMANHO_PAGINA_SST25VF016];


/***********************************************************************************
*	Functions - Local
***********************************************************************************/
void MEMORYWRAPPER_writeToAT45Page(unsigned char flash,unsigned int page,
                                   unsigned char *pData,unsigned int size);

/***********************************************************************************
*	Implementations
***********************************************************************************/

/***********************************************************************************
*       Descri��o     : Inicializa��o do m�dulo
*       Parametros    : nenhum
*       Retorno       : nenhum
***********************************************************************************/
void MEMORYWRAPPER_init(void){
  
  SPIWRAPPER_init(66000000);
  SST25VF_init(1);
  vSemaphoreCreateBinary(semDataFlash);
}
/********************************************************************************
*     Descri��o     :   Grava um buffer em um setor da flash
*     Parametros    :   (unsigned short int) endereco
*                       (unsigned char*) buffer
*     Retorno       :   nenhum
********************************************************************************/
void MEMORYWRAPPER_writeBufferInSector(unsigned int startAddress,unsigned char *pData,
                                       unsigned short int offset,unsigned short int size){
                                  
  SST_highSpeedRead(startAddress&0xFFFFF000,MEMORYWRAPPER_localBuffer,TAMANHO_PAGINA_SST25VF016);//Copia o setor para o buffer local
  SST_erase4kbSector(startAddress);
  
  memcpy(&MEMORYWRAPPER_localBuffer[offset],pData,size);//Insere os dados no buffer
  SST_writeAutoAddressInc(startAddress&0xFFFFF000,MEMORYWRAPPER_localBuffer,TAMANHO_PAGINA_SST25VF016);//Grava o buffer no setor    
}
/********************************************************************************
*     Descri��o     :   Escreve um buffer na flash
*     Parametros    :   (unsigned int) endere�o inicial
*                       (unsigned char*) refer�ncia para o buffer
*                       (unsigned short int) tamanho do buffer escrito
*     Retorno       :   nenhum
********************************************************************************/
void MEMORYWRAPPER_blockWriteAuxSST(unsigned int startAddress,unsigned char *pData,
                                     unsigned short int size){                        
  unsigned int pagina = startAddress / TAMANHO_PAGINA_SST25VF016;
  unsigned int offset = startAddress - (pagina*TAMANHO_PAGINA_SST25VF016); 
  unsigned int toWrite=TAMANHO_PAGINA_SST25VF016-offset,index=0;
  
  
  if( (offset+size) < TAMANHO_PAGINA_SST25VF016)
    MEMORYWRAPPER_writeBufferInSector(startAddress,pData,offset,size);
  else
    while(size){      
      MEMORYWRAPPER_writeBufferInSector(startAddress,&pData[index],offset,toWrite);
      startAddress+=toWrite;
      index+=toWrite;
      if(offset)
        size-=toWrite;
      else
        if(size>TAMANHO_PAGINA_SST25VF016)
          size-=TAMANHO_PAGINA_SST25VF016;
        else
          size=0;
        
      offset=0;      
      toWrite = size % TAMANHO_PAGINA_SST25VF016;      
    }               
}
/********************************************************************************
*     Descri��o     :   L� um buffer da flash
*     Parametros    :   (unsigned int) endere�o inicial
*                       (unsigned char*) refer�ncia para o buffer
*                       (unsigned short int) tamanho do buffer para ler
*     Retorno       :   nenhum
********************************************************************************/
void MEMORYWRAPPER_blockReadAuxSST(unsigned int startAddress,unsigned char *pData,
                                    unsigned short int size){                     
  
  SST_highSpeedRead(startAddress,pData,size);  
}
/***********************************************************************************
*     Descri��o     :   Escreve um buffer na dataflash
*     Parametros    :   (unsigned long int) endere�o inicial
*                       (unsigned char*) ponteiro para os dados
*                       (unsigned int) tamanho dos dados no buffer
*     Retorno       :   nenhum
***********************************************************************************/
unsigned char MEMORYWRAPPER_writeBytes(unsigned long int enderecoInicial,unsigned char *buffer,
                                       unsigned int size){                                         
                                                                                  
  while(!xSemaphoreTake(semDataFlash,portTICK_RATE_MS*1));
  
  MEMORYWRAPPER_blockWriteAuxSST(enderecoInicial,buffer,size);
  
  xSemaphoreGive(semDataFlash); 
  return 0;  
  
}
/***********************************************************************************
*       Descri��o     : L� um buffer de dados da mem�ria flash
*       Parametros    : (unsigned int) Endere�o inicial
*                       (unsigned char*) Ponteiro para o buffer
*                       (unsigned int) size
*       Retorno       : nenhum
***********************************************************************************/
unsigned char MEMORYWRAPPER_readBytes(unsigned long int enderecoInicial,unsigned char *buffer,
                                      unsigned int size){
  
  while(!xSemaphoreTake(semDataFlash,portTICK_RATE_MS*1));
  
  MEMORYWRAPPER_blockReadAuxSST(enderecoInicial,buffer,size);
    
  xSemaphoreGive(semDataFlash);
  return 0;  
  
}
/***********************************************************************************
*       Descri��o     : L� um buffer de dados da mem�ria flash
*       Parametros    : (unsigned int) Endere�o inicial
*                       (unsigned char*) Ponteiro para o buffer
*                       (unsigned int) size
*       Retorno       : nenhum
***********************************************************************************/
unsigned char MEMORYWRAPPER_readSingle(unsigned long int enderecoInicial){
  unsigned char buffer;  
  
  MEMORYWRAPPER_blockReadAuxSST(enderecoInicial,&buffer,1);
    
  return buffer;    
}
/***********************************************************************************
*       Descri��o       :       Inicia o sem�foro de acesso a mem�ria flash
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MEMORYWRAPPER_wait(void){
  
  while(!xSemaphoreTake(semDataFlash,portTICK_RATE_MS*1));
}
/***********************************************************************************
*       Descri��o       :       Release para o sem�foro de acesso a mem�ria
*                               flash
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MEMORYWRAPPER_release(void){
  
  xSemaphoreGive(semDataFlash);  
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
