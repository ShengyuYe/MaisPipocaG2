/*__________________________________________________________________________________
|	DEXTRO SOLU��ES TECNOL�GICAS
|       
|       ITAJA� - SC
|       www.dextro.ind.br
| __________________________________________________________________________________
|
|       This source code was developed by DEXTRO  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by DEXTRO 
|       or its distributors.
|
|       Este c�digo � propriedade da DEXTRO  e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       DEXTRO  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  parametros.c
|       Descri��o          :  Menu para configura��o do sistema
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  30/12/2016
|
|       Revis�es           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <nxp\iolpc1768.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "..\includes.h"
#include "parametros.h"
#include "tabela_parametros.h"


/***********************************************************************************
*       Constantes
***********************************************************************************/


/***********************************************************************************
*       Defini��es
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned char PARAMETROS_buffer[2][64];

/***********************************************************************************
*       Fun��es locais
***********************************************************************************/


/***********************************************************************************
*       Implementa��o das fun��es
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Inicializa��o do gerenciador de parametros
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PARAMETROS_ini(void){
  
  MEMORYWRAPPER_init();
}
/***********************************************************************************
*       Descri��o       :       Resolve o endere�o l�gico para o f�sico
*       Parametros      :       (unsigned int) endere�o f�sico do par�metro
*       Retorno         :       (unsigned int) endere�o l�gico do par�metro
***********************************************************************************/
unsigned int PARAMETROS_resolve_endereco(unsigned int endereco){
  unsigned int endereco_fisico=0;

  for(unsigned int i=0;i<endereco;i++)
    endereco_fisico+=(tabela_parametros[i].length+2); // 2 = CRC

  return endereco_fisico;  
}
/***********************************************************************************
*       Descri��o       :       Parametros      
*       Parametros      :       (unsigned int) endere�o
*                               (void*) parametro
*       Retorno         :       nenhum
***********************************************************************************/
void PARAMETROS_grava(unsigned int endereco,void*parametro){
  unsigned short int crc;  
  
  memcpy(&PARAMETROS_buffer[0][0],parametro,tabela_parametros[endereco].length);
  crc = CCTALK_calculaCRC(&PARAMETROS_buffer[0][0],0,tabela_parametros[endereco].length);
  PARAMETROS_buffer[0][tabela_parametros[endereco].length]   = crc>>8;
  PARAMETROS_buffer[0][tabela_parametros[endereco].length+1] = crc;
 
  MEMORYWRAPPER_writeBytes(PARAMETROS_resolve_endereco(endereco),
                           &PARAMETROS_buffer[0][0],
                           tabela_parametros[endereco].length+2);
}
/***********************************************************************************
*       Descri��o       :       Par�metros
*       Parametros      :       (unsigned int) endere�o
*                               (void*) dados do par�metro
*       Retorno         :       nenhum
***********************************************************************************/
void PARAMETROS_le(unsigned int endereco,void*parametro){
  unsigned short int crc;
  
  MEMORYWRAPPER_readBytes(PARAMETROS_resolve_endereco(endereco),
                          &PARAMETROS_buffer[1][0],
                          tabela_parametros[endereco].length+2);
  
  crc = CCTALK_calculaCRC(&PARAMETROS_buffer[1][0],0,tabela_parametros[endereco].length);
  if(crc==(PARAMETROS_buffer[1][tabela_parametros[endereco].length]<<8 | PARAMETROS_buffer[1][tabela_parametros[endereco].length+1]))
    memcpy(parametro,&PARAMETROS_buffer[1][0],tabela_parametros[endereco].length);      
  else{
    unsigned char *ptr = (unsigned char*)parametro;
    unsigned char *vlr = (unsigned char*)&tabela_parametros[endereco].default_value;
    
    for(unsigned char i=0;i<tabela_parametros[endereco].length;i++)
      ptr[i] = vlr[i];    
  }
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
