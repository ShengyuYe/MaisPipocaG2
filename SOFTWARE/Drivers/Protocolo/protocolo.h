/*__________________________________________________________________________________
|	Dextro Soluções Tecnológicas
|       
|       Itajaí/SC
|       www.dextro-st.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Dextro  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Dextro
|       or its distributors.
|
|       Este código é propriedade da Dextro e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Dextro ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  Protocolo.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  21/02/2014
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/
#ifndef _PROTOCOLO_H_
#define _PROTOCOLO_H_

#define STRING_VERSAO_PROTOCOLO                 "MPG2-2.1.0-BR-MA"

typedef enum{
  DXTNET_MAIS_PIPOCA_G1 = 1,
  DXTNET_MAIS_PIPOCA_G2 = 2,
  DXTNET_PEGA_BOLA_G2 = 3,  
}eDXT_DEVICE;

typedef enum{
   DXTNET_GET_DEVICE=0x10,
   DXTNET_READ_PARAMETERS_TABLE_SIZE,
   DXTNET_READ_PARAMETERS,
   DXTNET_WRITE_PARAMETERS,
   DXTNET_FILE_FORMAT
}PROTOCOLO_COMMANDS;

typedef enum {
   FALHA_COMUNICACAO,
   ASSINADO_COM_SUCESSO,
   ASSINATURA_INVALIDA
}RESULTADO_ASSINATURA;


void PROTOCOLO_ini(void);
void PROTOCOLO_timerTick(void);
void PROTOCOLO_main(void*pPar);
void PROTOCOLO_enviaDadosDireto(unsigned char *buffer,unsigned char tamanho);
unsigned short int PROTOCOLO_bytesNoBufferTx(void);
void PROTOCOLO_enviaDadosDireto(unsigned char *buffer,unsigned char tamanho);


#endif//_PROTOCOLO_H_
/************************************************************************************
*       Fim do arquivo
************************************************************************************/
