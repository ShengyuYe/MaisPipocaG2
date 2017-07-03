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
|       Arquivo            :  FM25C160B.c
|       Descrição          :  Biblioteca para uso da memória FM25C160B
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  23/06/2016
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <nxp\iolpc1768.h>
#include "..\..\includes.h"
#include "FM25C160B.h"

/***********************************************************************************
*       Definições
***********************************************************************************/
#define FM25C_SET_ENABLE                        0x06
#define FM25C_WRITE_DISABLE                     0x04
#define FM25C_READ_STATUS_REGISTER              0x05
#define FM25C_WRITE_STATUS_REGISTER             0x01
#define FM25C_READ_MEMORY_DATA                  0x03      
#define FM25C_WRITE_MEMORY_DATA                 0x02

#define WRITE_ENABLE_LATCH                      0x02
#define BLOCK_PROTECT_BIT_0                     0x04
#define BLOCK_PROTECT_BIT_1                     0x08
#define WRITE_PROTECT_ENABLE                    0x80

#define CS_FRAM                                 (0x01)<<19
#define CS_FRAM_INI()                           FIO0DIR |= CS_FRAM
#define CS_FRAM_SET(X)                          X?(FIO0SET|=CS_FRAM):(FIO0CLR|=CS_FRAM)
/***********************************************************************************
*       Constantes
***********************************************************************************/


/***********************************************************************************
*       Variaveis globais
***********************************************************************************/


/***********************************************************************************
*       Funções externas
***********************************************************************************/
extern void SPI_sendBytes(unsigned char *buffer,unsigned int size);
extern void SPI_getBytes(unsigned char *buffer,unsigned int size);

/***********************************************************************************
*       Funções locais
***********************************************************************************/
unsigned char FM25C_writeEnable(void);

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Inicialização do módulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void FM25C_ini(void){
    
  CS_FRAM_INI();
  CS_FRAM_SET(1);
}
/***********************************************************************************
*       Descrição       :       Escreve um bloco de dados na memória
*                               FRAM
*       Parametros      :       (unsigned short int) endereço inicial
*                                                    da escrita do bloco
*                               (unsigned char*) bloco que será escrito
*                               (unsigned char) tamanho do bloco que será escrito
***********************************************************************************/
void FM25C_writeBlock(unsigned short int address,unsigned char *pData,unsigned char size){
  
  
}
/***********************************************************************************
*       Descrição       :       Lê um bloco de daos na memória FRAM
*       Parametros      :       (unsigned short int) endereço inicial da escrita
*                               (unsigned char*) local onde será alocado o
*                                                valor lido da memória
*                               (unsigned char) tamanho do bloco
***********************************************************************************/
void FM25C_readBlock(unsigned short int address,unsigned char *pData,unsigned char size){

  
}
/***********************************************************************************
*       Descrição       :       Habilita a escrita na memória
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
unsigned char FM25C_writeEnable(void){
  unsigned char buffer[2];

  CS_FRAM_SET(0);
  buffer[0] = FM25C_WRITE_STATUS_REGISTER;
  buffer[1] =  BLOCK_PROTECT_BIT_0 | BLOCK_PROTECT_BIT_1 | WRITE_ENABLE_LATCH;    
  SPI_sendBytes(buffer,2);
  CS_FRAM_SET(1);
  
  vTaskDelay(1);
  
  CS_FRAM_SET(0);
  buffer[0] = FM25C_READ_STATUS_REGISTER;
  SPI_sendBytes(buffer,1);
  SPI_getBytes(buffer,1);
  CS_FRAM_SET(1);
  
  if(buffer[0]&WRITE_ENABLE_LATCH)
    return 1;
  
  return 0;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/