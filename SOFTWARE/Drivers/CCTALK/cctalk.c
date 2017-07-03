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
|       Arquivo            :  cctalk.c
|       Descrição          :  Biblioteca do protocolo cctalk mestre
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  17/02/2015
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <nxp\iolpc1768.h>
#include "cctalk.h"
#include "..\..\includes.h"
/***********************************************************************************
*       Definições locais
***********************************************************************************/
#define TAM_BUF_OUT                             64
#define TAM_BUF_IN                              64        

/***********************************************************************************
*       Constantes
***********************************************************************************/
unsigned short int crc_ccitt_lockup[256]={
  0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50A5, 0x60C6, 0x70E7,  
  0x8108, 0x9129, 0xA14A, 0xB16B, 0xC18C, 0xD1AD, 0xE1CE, 0xF1EF,  
  0x1231, 0x0210, 0x3273, 0x2252, 0x52B5, 0x4294, 0x72F7, 0x62D6,  
  0x9339, 0x8318, 0xB37B, 0xA35A, 0xD3BD, 0xC39C, 0xF3FF, 0xE3DE,  
  0x2462, 0x3443, 0x0420, 0x1401, 0x64E6, 0x74C7, 0x44A4, 0x5485,  
  0xA56A, 0xB54B, 0x8528, 0x9509, 0xE5EE, 0xF5CF, 0xC5AC, 0xD58D,  
  0x3653, 0x2672, 0x1611, 0x0630, 0x76D7, 0x66F6, 0x5695, 0x46B4,  
  0xB75B, 0xA77A, 0x9719, 0x8738, 0xF7DF, 0xE7FE, 0xD79D, 0xC7BC,  
  0x48C4, 0x58E5, 0x6886, 0x78A7, 0x0840, 0x1861, 0x2802, 0x3823,  
  0xC9CC, 0xD9ED, 0xE98E, 0xF9AF, 0x8948, 0x9969, 0xA90A, 0xB92B,  
  0x5AF5, 0x4AD4, 0x7AB7, 0x6A96, 0x1A71, 0x0A50, 0x3A33, 0x2A12,  
  0xDBFD, 0xCBDC, 0xFBBF, 0xEB9E, 0x9B79, 0x8B58, 0xBB3B, 0xAB1A,  
  0x6CA6, 0x7C87, 0x4CE4, 0x5CC5, 0x2C22, 0x3C03, 0x0C60, 0x1C41,  
  0xEDAE, 0xFD8F, 0xCDEC, 0xDDCD, 0xAD2A, 0xBD0B, 0x8D68, 0x9D49,  
  0x7E97, 0x6EB6, 0x5ED5, 0x4EF4, 0x3E13, 0x2E32, 0x1E51, 0x0E70,  
  0xFF9F, 0xEFBE, 0xDFDD, 0xCFFC, 0xBF1B, 0xAF3A, 0x9F59, 0x8F78,  
  0x9188, 0x81A9, 0xB1CA, 0xA1EB, 0xD10C, 0xC12D, 0xF14E, 0xE16F,  
  0x1080, 0x00A1, 0x30C2, 0x20E3, 0x5004, 0x4025, 0x7046, 0x6067,  
  0x83B9, 0x9398, 0xA3FB, 0xB3DA, 0xC33D, 0xD31C, 0xE37F, 0xF35E,  
  0x02B1, 0x1290, 0x22F3, 0x32D2, 0x4235, 0x5214, 0x6277, 0x7256,  
  0xB5EA, 0xA5CB, 0x95A8, 0x8589, 0xF56E, 0xE54F, 0xD52C, 0xC50D,  
  0x34E2, 0x24C3, 0x14A0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,  
  0xA7DB, 0xB7FA, 0x8799, 0x97B8, 0xE75F, 0xF77E, 0xC71D, 0xD73C,  
  0x26D3, 0x36F2, 0x0691, 0x16B0, 0x6657, 0x7676, 0x4615, 0x5634,  
  0xD94C, 0xC96D, 0xF90E, 0xE92F, 0x99C8, 0x89E9, 0xB98A, 0xA9AB,  
  0x5844, 0x4865, 0x7806, 0x6827, 0x18C0, 0x08E1, 0x3882, 0x28A3,  
  0xCB7D, 0xDB5C, 0xEB3F, 0xFB1E, 0x8BF9, 0x9BD8, 0xABBB, 0xBB9A,  
  0x4A75, 0x5A54, 0x6A37, 0x7A16, 0x0AF1, 0x1AD0, 0x2AB3, 0x3A92,  
  0xFD2E, 0xED0F, 0xDD6C, 0xCD4D, 0xBDAA, 0xAD8B, 0x9DE8, 0x8DC9,  
  0x7C26, 0x6C07, 0x5C64, 0x4C45, 0x3CA2, 0x2C83, 0x1CE0, 0x0CC1,  
  0xEF1F, 0xFF3E, 0xCF5D, 0xDF7C, 0xAF9B, 0xBFBA, 0x8FD9, 0x9FF8,  
  0x6E17, 0x7E36, 0x4E55, 0x5E74, 0x2E93, 0x3EB2, 0x0ED1, 0x1EF0 
};

/***********************************************************************************
*       Variaveis globais
***********************************************************************************/
unsigned char CCTALK_bufferTxd[TAM_BUF_OUT];
unsigned char CCTALK_bufferRxd[TAM_BUF_IN];
unsigned char CCTALK_bytesParaEnviar=0;
unsigned char CCTALK_bytesEnviados=0;
unsigned char CCTALK_recebidos=0;

/***********************************************************************************
*       Funções locais
***********************************************************************************/
unsigned char CCTALK_enviaPacote(unsigned char*pacote,unsigned char tamanho,
                                 unsigned char*recebido,unsigned short int *qtdRecebidos);
void CCTALK_enviaPacoteSerial(unsigned short int tamanho);

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Inicialização da biblioteca
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void CCTALK_ini(void){

  UART_init(0,9600,NULL,NULL,NULL);  
}
/***********************************************************************************
*       Descrição       :      Faz o calculo do CRC
*       Parametros      :       (unsigned char*) ponteiro para o buffer
*                               (unsigned short int) offset
*                               (unsigned short int) tamanho do pacote
*       Retorno         :       (unsigned shor int) crc
***********************************************************************************/
unsigned short int CCTALK_calculaCRC(unsigned char *pData,unsigned short int offset,
                                     unsigned short int tamanho){
  unsigned short int crc=0;
  
  for(unsigned short int i=0;i<tamanho;i++)
    crc = (crc<<8) ^ crc_ccitt_lockup[(crc>>8) ^ pData[i+offset]];
                                                                              
  return crc;
}  
/***********************************************************************************
*       Descrição       :    Interrupção da uart 0
*       Parametrso      :     nenhum
*       Retorno         :     nenhum
***********************************************************************************/  
void CCTALK_irqUart(void){

  unsigned char dummy;
  
  switch(U0IIR_bit.IID){
    case THRE:
               if(CCTALK_bytesParaEnviar){
                 U0THR = CCTALK_bufferTxd[CCTALK_bytesEnviados++];
                 CCTALK_bytesParaEnviar--;
               }
               break; 
    case RDA : dummy = U0RBR;
               if(CCTALK_recebidos<(TAM_BUF_IN-1))
                 CCTALK_bufferRxd[CCTALK_recebidos++] = dummy;
               
               break;      
    case RLS : 
               dummy = U0LSR;
               dummy = U0RBR;               
               break;      
    case CTI :
               break;      
  }
  
  //Apaga o flag de interrupção pendente
  CLRPEND0 |= (0x01)<<5;    
}
/***********************************************************************************
*       Descrição       :       Envia um pacote pelo canal serial
*       Parametros      :       (unsigned char) tamanho do pacote
*       Retorno         ;       nenhum
***********************************************************************************/
void CCTALK_enviaPacoteSerial(unsigned short int tamanho){
  
  CCTALK_recebidos = 0;
  
  CCTALK_bytesParaEnviar = tamanho-1;
  CCTALK_bytesEnviados = 1;
  U0THR = CCTALK_bufferTxd[0];    
}
/***********************************************************************************
*       Descrição       :       Tick de timer da biblioteca
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void CCTALK_tick(void){
  
  
  
  
}
/***********************************************************************************
*       Descrição       :       Envia um pacote pelo canal serial
*       Parametros      :       (unsigned char*) pacote
*                               (unsigned char*) pacote recebido
*       Retorno         :       (unsigned char) maior do que zero se receber
*                                               resposta com CRC válido
***********************************************************************************/
unsigned char CCTALK_enviaPacote(unsigned char*pacote,unsigned char tamanho,
                                 unsigned char*recebido,unsigned short int *qtdRecebidos){
  unsigned short int crc = CCTALK_calculaCRC(pacote, 0, tamanho);
  unsigned short int offset=tamanho+2;
   
  CCTALK_bufferTxd[0] = pacote[0];
  CCTALK_bufferTxd[1] = pacote[1];
  CCTALK_bufferTxd[2] = (unsigned char)crc;
  CCTALK_bufferTxd[3] = pacote[2];

  for(unsigned short int i=0;i<pacote[1];i++)
    CCTALK_bufferTxd[4+i] = pacote[3+i];

  CCTALK_bufferTxd[4 + pacote[1]] = (unsigned char)(crc>>8);
  CCTALK_enviaPacoteSerial(tamanho+2);
  
  while(CCTALK_bytesParaEnviar)
    vTaskDelay(1);
  
  vTaskDelay(50);
  
  unsigned short int timeout=2000;
  while(!CCTALK_recebidos && timeout--)
    vTaskDelay(1);
 
  if(CCTALK_recebidos)
    if(CCTALK_bufferRxd[offset+0]==1 && CCTALK_bufferRxd[offset+3]==0){
      
      unsigned short int crcRecebido = CCTALK_bufferRxd[CCTALK_recebidos-1]<<8 | CCTALK_bufferRxd[offset+2];
      
      recebido[0] = CCTALK_bufferRxd[offset+0];
      recebido[1] = CCTALK_bufferRxd[offset+1];
      recebido[2] = CCTALK_bufferRxd[offset+3];
      for(unsigned short int i=0;i<CCTALK_bufferRxd[1+offset];i++)
        recebido[3+i] = CCTALK_bufferRxd[offset+4+i];
      
      if(CCTALK_calculaCRC(recebido,0,CCTALK_bufferRxd[1+offset]+3)==crcRecebido)
        return 255;           
    }
  
  return 0; 
}
/***********************************************************************************
*       Descrição       :       Lê a fila de eventos de pagamento
*       Parametros      :       (unsigned char) endereço do dispositivo
*                               (unsigned char*) quantidade de eventos
*                               (unsigned short int*) eventos
*       Retorno         :       (unsigned char) maior do que zero se conseguir
*                                               realizar a leitura
***********************************************************************************/
unsigned char CCTALK_leFilaEventos(unsigned char endereco,unsigned char*qtdEventos,
                                   unsigned short int *eventos){
  unsigned char buffer[10];
  unsigned char resposta[20];
  unsigned short int recebidos;
  
  buffer[0] = endereco;
  buffer[1] = 0;
  buffer[2] = (unsigned char)READ_BUFFERED_BILL_EV;
  
  if(CCTALK_enviaPacote(buffer,3,resposta,&recebidos)){
    
    *qtdEventos = resposta[3];
    
    for(unsigned char i=0,j=0;i<5;i++,j+=2)      
      eventos[i] = resposta[5+j]<<8 | resposta[4+j];    
    
    return 255;
  }   
  
  return 0;                                     
}
/***********************************************************************************
*       Descrição       :       Puxa o dinheiro para dentro do cofre
*       Parametros      :       (unsigned char) endereço do dispositivo
*       Retorno         :       (unsigned char) maior do que zero se 
*                                               obter sucesso na operação
***********************************************************************************/
unsigned char CCTALK_rotacionaValidador(unsigned char endereco){
  unsigned char buffer[4];
  unsigned char resposta[5];
  unsigned short int recebidos;  
  
  buffer[0] = endereco;
  buffer[1] = 1;
  buffer[2] = (unsigned char)ROUTE_BILL;
  buffer[3] = 1;
  
  if(CCTALK_enviaPacote(buffer,4,resposta,&recebidos)){
    
     return 255; 
  } 
  
  return 0x00;
}
/***********************************************************************************
*       Descrição       :       Escreve no registrador de habilitação (inhibit)
*       Parametros      :       (unsigned char) endereço do dispositivo
*                               (unsigned short int) dados
*       Retorno         :       (unsigned char) maior do que zero se conseguir
*                                               realizar a leitura
***********************************************************************************/
unsigned char CCTALK_setBitsHabilitacaoCanal(unsigned char endereco,
                                             unsigned short int mascara){
  unsigned char buffer[5];                                             
  unsigned char resposta[5];
  unsigned short int recebidos;
  
  buffer[0] = endereco;
  buffer[1] = 2;
  buffer[2] = (unsigned char)SET_INHIBITS;
  buffer[3] = mascara;
  buffer[4] = mascara>>8;
  
  if(CCTALK_enviaPacote(buffer,5,resposta,&recebidos)){
    
      
    return 255;
  }           
  
  return 0x00;
}
/***********************************************************************************
*       Descrição       :       Habilitação geral do aceitador
*       Parametros      :       (unsigned char) endereço do dispositivo
*                               (unsigned char) flag de habilitação geral
*       Retorno         :       (unsigned char) maior do que zero
*                                               se conseguir obter resposta
***********************************************************************************/
unsigned char CCTALK_setFlagHabilitacaoGeral(unsigned char endereco,
                                             unsigned char flagBloqueio){
  unsigned char buffer[4];
  unsigned char resposta[5];
  unsigned short int recebidos;
  
  buffer[0] = endereco;
  buffer[1] = 1;
  buffer[2] = (unsigned char)SET_MASTER_INHIBIT;
  buffer[3] = flagBloqueio;
  
  if(CCTALK_enviaPacote(buffer,4,resposta,&recebidos)){
    
    
    return 255; 
  }
                                               
  return 0;                                              
}
/***********************************************************************************
*       Descrição       :       Converte a enumeração das mensagens
*                               do noteiro para string
*       Parametros      :       (CCTALK_BILL_EVENTS) mensagem
*       Retorno         :       nenhum
***********************************************************************************/
char* CCTAK_msg_to_string(CCTALK_BILL_EVENTS msg){        
  const char *msg_bv20[]={
    "BILL_VALIDATED_OK\n\r",
    "BILL_VALIDATED_OK_AND_SCROW\n\r",
    "MASTER_INHIBIT_ACTIVE\n\r",
    "BILL_RETURNED_FROM_ESCROW\n\r",
    "INVALID_BILL_VALIDATION\n\r",
    "INVALID_BILL_TRANSPORTATION\n\r",
    "INHIBIT_BILL_SERIAL\n\r",
    "INHIBIT_BILL_DIPSWITCH\n\r",
    "BILL_JAMMED_IN_TRANSPORT\n\r",
    "BILL_JAMMED_IN_BACKWARDS\n\r",
    "BILL_TAMPER\n\r",
    "STACKER_OK\n\r",
    "STACKER_INVERTED\n\r",
    "STACKER_FAULTY\n\r",
    "STACKER_FULL\n\r",
    "STACKER_JAMMED\n\r",
    "BILL_JAMMED_IN_TRANSPORT_SAFE\n\r",
    "OPTO_FRAUD_DETECTED\n\r",
    "STRING_FRAUD_DETECTED\n\r",
    "ANTI_STRING_MECHANISM_FAULTY\n\r",
    "BARCODE_DETECTED\n\r",
    "UNKNOWN_BILL_TYPE_STACKED\n\r"  
  };
  
  return (char*)msg_bv20[(unsigned char)msg];
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/


