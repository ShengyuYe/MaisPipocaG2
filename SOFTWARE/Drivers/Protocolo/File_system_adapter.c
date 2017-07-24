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

/************************************************************************************
*       Includes
************************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "file_system_adapter.h"
#include "..\..\includes.h"

/************************************************************************************
*       Definições locais
************************************************************************************/
#define BLOCK_READ(X,Y,Z)                       MEMORYWRAPPER_readBytes(X,Y,Z)
#define BLOCK_WRITE(X,Y,Z)                      MEMORYWRAPPER_writeBytes(X,Y,Z)



/************************************************************************************
*       Variaveis locais
************************************************************************************/

/************************************************************************************
*       Funções locais
************************************************************************************/

/************************************************************************************
*       Implementação das funções
************************************************************************************/

/************************************************************************************
*       Descrição       :       Escreve na tabela que contém o endereço
*                               do início dos arquivos de áudio
*       Parametros      :       (unsigned char) indice do arquivo
*                               (unsigned int) endereço inicial na flash
*       Retorno         :       nenhum
************************************************************************************/
void FSA_write_start_of_file(unsigned char file_index,
                             unsigned int start_address){
                               
                               
                               
}
/************************************************************************************
*       Descrição       :       Escreve um bloco no endereço inicial
*                               da flash
*       Parametros      :       (unsigned int) endereço inicial
*                               (unsigned char*) ponteiro para os dados
*                               (unsigned short int) tamanho
*       Retorno         :       nenhum
************************************************************************************/
void FSA_write_memory_data(unsigned int start_address,
                           unsigned char *pData,
                           unsigned short int size){
                             
                             
}
/************************************************************************************
*       Descrição       :       Formata a área de memória onde se encontra
*                               o bloco de aúdio
*       Parametros      :       nenhum
*       Retorno         :       nenhum
************************************************************************************/
void FSA_format_audio_memory(void){
  unsigned long int enderecoInicial=AREA_ARQUIVOS;
  
  for(unsigned short int i=0;i<599;i++){
    SST_erase4kbSector(enderecoInicial);
    enderecoInicial+=4096;
  }
}
/************************************************************************************
*       Fim do arquivo
************************************************************************************/