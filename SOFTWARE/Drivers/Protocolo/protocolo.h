/*__________________________________________________________________________________
|	Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Balen�rio Cambori� - SC
|       www.chavedigital.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Chave Digital and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Chave Digital
|       or its distributors.
|
|       Este c�digo � propriedade da Chave Digital e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Chave Digital ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  Protocolo.h
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  21/02/2014
|
|       Revis�es           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/
#ifndef _PROTOCOLO_H_
#define _PROTOCOLO_H_

typedef enum{
   READ_DATA_FLASH_BLOCK=1,
   WRITE_DATA_FLASH_BLOCK,
   FORMAT_AUDIO_FLASH,
   WRITE_MUSIC_TABLE,
   READ_MUSIC_TABLE,
   GET_PARAMETERS_LENGHT,
   GET_PARAMETER_INFO,
   GET_PARAMETER_DATA,
   SET_PARAMETER_DATA
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
