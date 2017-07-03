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
|       Arquivo            :  SST25VFXX.c
|       Descrição          :  Driver para acesso à memoria
|                             SST25
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  27/04/2012
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

/********************************************************************************
*   Includes
********************************************************************************/
#include <nxp/iolpc1768.h>
#include "SST25VF016B.h"
#include "SPI_WRAPPER.H"

/********************************************************************************
*   Definições
********************************************************************************/
#define SST_READ                        0x03
#define SST_HIGH_SPEED_READ             0x0B
#define SST_4KB_ERASE                   0x20
#define SST_32KB_ERASE                  0x52
#define SST_64KB_ERASE                  0xD8
#define SST_CHIP_ERASE                  0x60
#define SST_BYTE_PROGRAM                0x02
#define SST_AAI                         0xAD
#define SST_RDSR                        0x05
#define SST_EWSR                        0x50
#define SST_WRITE_STATUS                0x01
#define SST_WRITE_ENABLE                0x06
#define SST_WRITE_DISABLE               0x04
#define SST_READ_ID                     0x90
#define SST_JEDEC_ID                    0x9F
#define SST_EBST                        0x70
#define SST_DBSY                        0x80

/********************************************************************************
*   Funções
********************************************************************************/
void SST_busyWait(void);

/********************************************************************************
*   Implementação
********************************************************************************/

/********************************************************************************
*   Descrição     :   Inicialização do driver
*   Parametros    :   nenhum
*   Retorno       :   nenhum
********************************************************************************/
void SST25VF_init(unsigned long int busClk){
  
  UNSEL_CS_01;  
  UNSEL_CS_02;
}
/********************************************************************************
*   Descrição     :   Faz a leitura do registrador de status da memória
*   Parametros    :   (SST_status*) referência para o status
*   Retorno       :   nenhum
********************************************************************************/
void SST25VF_readStatus(SST_status* status){
  unsigned char buffer;
  
  SEL_CS_01;
  
  buffer = SST_RDSR;  
  
  SPI_sendBytes(&buffer,1);
  SPI_getBytes((unsigned char*)status,1);
  
  UNSEL_CS_01;      
}
/********************************************************************************
*   Descrição     :   Aguarda o sinal de busy ficar zerado
*   Parametors    :   nenhum
*   Retorno       :   nenhum
********************************************************************************/
void SST_busyWait(void){
  
  SST_status status;      
  do SST25VF_readStatus(&status);            
  while(status.busy);   
}
/********************************************************************************
*   Descrição     :   Faz a escrita no registrador de estado
*   Parametros    :   (SST_status*) valor para ser escrito no status
*   Retorno       :   nenhum
********************************************************************************/
unsigned char SST25VF_writeStatus(SST_status *status){
  unsigned char buffer[2];
  SST_status tmp;
  
  SEL_CS_01;
  buffer[0] = SST_EWSR;
  SPI_sendBytes(buffer,1);
  UNSEL_CS_01;
  
  buffer[0] = SST_WRITE_STATUS;
  buffer[1] = *(unsigned char*)status;
  
  SEL_CS_01;
  SPI_sendBytes(buffer,2);    
  UNSEL_CS_01;          
  
  SST25VF_readStatus(&tmp);
  
  if(*(unsigned char*)&tmp == *(unsigned char*)status)
    return 0xFF;
  
  return 0x00;
}     
/********************************************************************************
*   Descrição     :   Lê o ID da memória
*   Parametros    :   nenhum
*   Retorno       :   (unsigned short int) valor lido da memória
********************************************************************************/
unsigned short int SST_readID(void){
  unsigned char buffer[4];
  
  SEL_CS_01;
  
  buffer[0] = SST_READ_ID;
  buffer[1] = 0x00;
  buffer[2] = 0x00;
  buffer[3] = 0x00;
  
  SPI_sendBytes(buffer,4);
  SPI_getBytes(buffer,4);
  
  UNSEL_CS_01;  
   
  return (unsigned short int)buffer[0]<<8 | buffer[1];
}
/********************************************************************************
*   Descrição     :   Habilita a escrita na memoria
*   Parametros    :   nenhum
*   Retorno       :   nenhum
********************************************************************************/
void SST_writeEnable(void){
  unsigned char buffer;
  
  SEL_CS_01;
  buffer = SST_WRITE_ENABLE;
  SPI_sendBytes(&buffer,1);
  UNSEL_CS_01;     
}
/********************************************************************************
*   Descrição     :   Desabilita a escrita na memória
*   Parametros    :   nenhum
*   Retorno       :   nenhum
********************************************************************************/
void SST_writeDisable(void){
  unsigned char buffer;

  SEL_CS_01;
  buffer = SST_WRITE_DISABLE;
  SPI_sendBytes(&buffer,1);  
  UNSEL_CS_01;  
}
/********************************************************************************
*   Descrição     :   Leitura de alta velocidade
*   Parametros    :   (unsigned char*) buffer onde serão alocados os dados lidos
*                     (unsigned short int) número de bytes lidos
*   Retorno       :   nenhum
********************************************************************************/
void SST_highSpeedRead(unsigned int endereco,unsigned char *buffer,
                       unsigned short int size){
  unsigned char comandos[5];
  
  SEL_CS_01;

  comandos[0] = SST_HIGH_SPEED_READ; 
  comandos[1] = (unsigned char)(endereco>>16);
  comandos[2] = (unsigned char)(endereco>>8);
  comandos[3] = (unsigned char)endereco;
  comandos[4] = 0x00;
  SPI_sendBytes(comandos,5);
  SPI_getBytes(buffer,size);
      
  UNSEL_CS_01;  
}
/********************************************************************************
*   Descrição   :   Programa um byte na dataflash
*   Parametros  :   (unsigned int) endereco
*                   (unsigned char) valor
*   Retorno     :   nenhum
********************************************************************************/
void SST_writeByte(unsigned int endereco,unsigned char valor){
  unsigned char comandos[5];    
  
  SST_writeEnable(); // Habilita a escrita na memória
  
  SEL_CS_01;
  
  comandos[0] = SST_BYTE_PROGRAM;
  comandos[1] = (unsigned char)(endereco>>16);
  comandos[2] = (unsigned char)(endereco>>8);
  comandos[3] = (unsigned char) endereco;
  comandos[4] = valor;
  SPI_sendBytes(comandos,5);
  
  UNSEL_CS_01;      
  
  SST_writeDisable(); // Desabilita a escrita na memória
}
/********************************************************************************
*   Descrição   :   Escreve uma sequência de bytes na memória
*   Parametros  :   (unsigned int) endereco inicial
*                   (unsigned char*) buffer que será escrito
*                   (unsigned short int) tamanho do buffer
*   Retorno     :   nenhum
********************************************************************************/
void SST_writeAutoAddressInc(unsigned int endereco,unsigned char *pData,
                             unsigned short int size){
  unsigned char comando[6];
  
  SST_writeEnable();// Habilita a escrita na memória
  
  comando[0] = SST_AAI;
  comando[1] = (unsigned char)(endereco>>16);
  comando[2] = (unsigned char)(endereco>>8);
  comando[3] = (unsigned char)endereco;
  comando[4] = pData[0];
  comando[5] = pData[1];
  
  SEL_CS_01;
  SPI_sendBytes(comando,6);
  
  for(unsigned short int i=0;i<(size-2);i+=2){
      
    SST_busyWait();

    comando[0] = SST_AAI;
    comando[1] = pData[2+i];
    comando[2] = pData[3+i];
          
    SEL_CS_01;
    SPI_sendBytes(comando,3);
    UNSEL_CS_01;
  }
  
  SST_busyWait();  
    
  SST_writeDisable();// Desabilita a escrita na memória
}
/********************************************************************************
*   Descrição     :   Apaga um setor de 4kb na flash
*   Parametros    :   (unsigned short int) número do setor
*   Retorno       :   nenhum
********************************************************************************/
void SST_erase4kbSector(unsigned int sector){
  unsigned char comando[4];
  SST_status status;
  
  SST25VF_readStatus(&status);
  status.bp0 = 0;
  status.bp1 = 0;
  status.bp2 = 0;
  SST25VF_writeStatus(&status); 
  
  SST_writeEnable();  

  SEL_CS_01;

  sector&= ~0xFFF;//Apaga os bits de endereçamento dentro da página
  
  comando[0] =  SST_4KB_ERASE;
  comando[1] = (unsigned char)(sector>>16);
  comando[2] = (unsigned char)(sector>>8);
  comando[3] = (unsigned char) sector;
  SPI_sendBytes(comando,4);
  
  UNSEL_CS_01;      
  
  SST_busyWait();
  
  SST_writeDisable();// Desabilita a escrita na memória  
}
/********************************************************************************
*   Descrição     :   Apaga um setor de 32kb
*   Parametros    :   (unsigned short int) número do setor
*   Retorno       :   nenhum
********************************************************************************/
void SST_erase32kbSector(unsigned int sector){
  unsigned char comando[4];
  
  SST_writeEnable();

  SEL_CS_01;

  comando[0] =  SST_32KB_ERASE;
  comando[1] = (unsigned char)(sector>>16);
  comando[2] = (unsigned char)(sector>>8);
  comando[3] = (unsigned char) sector;
  SPI_sendBytes(comando,4);
  
  UNSEL_CS_01;         
  
  SST_busyWait();
  
  SST_writeDisable();// Desabilita a escrita na memória  
}
/********************************************************************************
*   Descrição     :   Apaga um setor de 64kb
*   Parametros    :   (unsigned short int) número do setor
*   Retorno       :   nenhum
********************************************************************************/
void SST_erase64kbSector(unsigned int sector){
  unsigned char comando[4];
  
  SST_writeEnable();

  SEL_CS_01;

  comando[0] =  SST_64KB_ERASE;
  comando[1] = (unsigned char)(sector>>16);
  comando[2] = (unsigned char)(sector>>8);
  comando[3] = (unsigned char) sector;
  SPI_sendBytes(comando,4);
  
  SST_busyWait();
  
  UNSEL_CS_01;           
  SST_writeDisable();// Desabilita a escrita na memória  
}
/********************************************************************************
*   Descrição     :   Apaga todo o chip
*   Parametros    :   nenhum
*   Retorno       :   nenhum
********************************************************************************/
void SST_chipErase(void){
  unsigned char comando;
  
  SST_writeEnable();

  SEL_CS_01;

  comando =  SST_CHIP_ERASE;
  SPI_sendBytes(&comando,1);
  
  UNSEL_CS_01;           
  SST_busyWait();
  SST_writeDisable();// Desabilita a escrita na memória  
}
/********************************************************************************
*   Fim do arquivo
********************************************************************************/