/*__________________________________________________________________________________
|	Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Balenário Camboriú - SC
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

typedef enum{
   DXTNET_GET_DEVICE=0x10,
   DXTNET_READ_PARAMETERS,
   DXTNET_WRITE_PARAMETERS,
   DXTNET_READ_FILE_TABLE,
   DXTNET_WRITE_FILE_TABLE,
   DXTNET_DELETE_FILE_TABLE,
   DXTNET_READ_FILE,
   DXTNET_WRITE_FILE
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



#endif//_PROTOCOLO_H_
/************************************************************************************
*       Fim do arquivo
************************************************************************************/
