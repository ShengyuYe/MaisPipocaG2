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
|       Arquivo            :  Protocolo.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  21/02/2014
|
|       Revisões           :  1.0.0.0
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
#include "protocolo.h"
#include "..\..\includes.h"

/***********************************************************************************
*       Definições locais
***********************************************************************************/
#define TAM_BUF_TX                              1024
#define TAM_BUF_RX                              128

#define STX                                     0x02
#define ETX                                     0x03
#define DLE                                     0x10

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned char PROTOCOLO_bufferTx[TAM_BUF_TX];
unsigned char PROTOCOLO_bufferRx[TAM_BUF_RX];
unsigned char PROTOCOLO_bufferTmp[TAM_BUF_TX];
unsigned char PROTOCOLO_bytesRecebidos;
unsigned char PROTOCOLO_bytesParaEnviar;
unsigned char PROTOCOLO_bytesEnviados;
unsigned char PROTOCOLO_novoPacote=0;


/***********************************************************************************
*       Funções locais
***********************************************************************************/
void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho);
unsigned char PROTOCOLO_checksum(unsigned char*pData,unsigned short int tamanho);
void PROTOCOLO_get_device(void);

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Inicialização da biblioteca
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_ini(void){
  
  UART_init(3,119200,NULL,NULL,NULL);    
}
/***********************************************************************************
*       Descrição       :       Função para tratamento da interrupção
*                               da uart3
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_intVect(void){  
  static unsigned char ultimoRecebido=0;
  unsigned char dummy;
  
  switch(U3IIR_bit.IID){
    case THRE:
               if(PROTOCOLO_bytesParaEnviar){
                 U3THR = PROTOCOLO_bufferTx[PROTOCOLO_bytesEnviados++];
                 PROTOCOLO_bytesParaEnviar--;
               }
               break; 
    case RDA : dummy = U3RBR;
               switch(dummy){
                 case STX: // Quando receber [DLE]+[STX] - marca inicio de novo pacote
                           if(ultimoRecebido == DLE){
                             PROTOCOLO_bytesRecebidos = 0;
                             ultimoRecebido = 255;
                           }
                           else{
                             if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
                               PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
                             
                             ultimoRecebido = STX;
                           }
                           
                           break;
                 case ETX: // Quando receber [DLE]+[ETX] - marca fim do novo pacote
                           if(ultimoRecebido == DLE){
                             PROTOCOLO_novoPacote = 255;
                             ultimoRecebido = 255;
                           }
                           else{
                             if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
                               PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
                             
                             ultimoRecebido = ETX;
                           }                   
                           break;
                 case DLE: // Quando receber [DLE]+[DLE] recebe 0x10 dentro do buffer
                           if(ultimoRecebido == DLE){
                             if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1))
                               PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;
                             ultimoRecebido = 255;
                           }                      
                           else
                             ultimoRecebido = DLE;
                           break;
                 default :
                           if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
                             PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                                            
                           break;
               }
               
               //ultimoRecebido = dummy;
               break;      
    case RLS : 
               dummy = U3LSR;
               dummy = U3RBR;               
               break;      
    case CTI :
               break;      
  }  
  
  //Apaga o flag de interrupção pendente
  CLRPEND0 |= (0x01)<<5;       
}
/***********************************************************************************
*       Descrição       :       Tick de timer para a biblioteca do protocolo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_timerTick(void){
  
  
  
}
/***********************************************************************************
*       Descrição       :       Calcula o checksum de um pacote de dados
*       Parametros      :       (unsigned char*) ponteiro para o início do pacote
*                               (unsigned short int) tamanho do pacote
*       Retorno         :       (unsigned char) checksum do pacote
***********************************************************************************/
unsigned char PROTOCOLO_checksum(unsigned char*pData,unsigned short int tamanho){
  unsigned short int soma=0;

  for(unsigned short int i=0;i<tamanho;i++)
    soma+= pData[i];
  
  return (unsigned char)(256-soma);    
}
/***********************************************************************************
*       Descrição       :       Thread do protocolo
*       Protocolo       :       (void*) pPar
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_main(void*pPar){
  
  PROTOCOLO_ini();
  
  for(;;){        
    
    if(PROTOCOLO_novoPacote){
      
      PROTOCOLO_novoPacote = 0;
      if(PROTOCOLO_checksum(PROTOCOLO_bufferRx,PROTOCOLO_bufferRx[1]-1)==PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos-1]){      
        switch(PROTOCOLO_bufferRx[0]){      
          case DXTNET_GET_DEVICE:
               PROTOCOLO_get_device();
               break;
          case DXTNET_READ_PARAMETERS:
               break;
          case DXTNET_WRITE_PARAMETERS:
               break;
          case DXTNET_READ_FILE_TABLE:
               break;
          case DXTNET_WRITE_FILE_TABLE:
               break;
          case DXTNET_DELETE_FILE_TABLE:
               break;
          case DXTNET_READ_FILE:
               break;
          case DXTNET_WRITE_FILE:
               break;
        }    
      }
    }
    vTaskDelay(1);
  }    
}
/***********************************************************************************
*       Descrição       :       Faz a decodificação do comando getdevice
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_get_device(void){
  
  PROTOCOLO_bufferTmp[0]  = DXTNET_GET_DEVICE;
  PROTOCOLO_bufferTmp[2]  = DXTNET_MAIS_PIPOCA_G2;
  
  sprintf((char*)&PROTOCOLO_bufferTmp[3],STRING_VERSAO_PROTOCOLO);
  PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,21);  
}
/***********************************************************************************
*       Descrição       :       Encapsula os dados que serão enviados
*                               pela rede
*       Parametros      :       (unsigned char*) ponteiro para os dados que serão
*                                               enviados
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho){
  unsigned char indice=0;
  
  pData[1] = tamanho;
  pData[tamanho-1] = PROTOCOLO_checksum(pData,tamanho-1);
  
  PROTOCOLO_bufferTx[indice++] = DLE;
  PROTOCOLO_bufferTx[indice++] = STX;
  for(unsigned char i=0;i<tamanho;i++)
    if(pData[i]==DLE){
      PROTOCOLO_bufferTx[indice++] = DLE;
      PROTOCOLO_bufferTx[indice++] = DLE;
    }
    else
      PROTOCOLO_bufferTx[indice++] = pData[i];
  
  PROTOCOLO_bufferTx[indice++] = DLE;
  PROTOCOLO_bufferTx[indice++] = ETX;
  
  PROTOCOLO_bytesParaEnviar = indice-1;
  PROTOCOLO_bytesEnviados = 1;
  U3THR = PROTOCOLO_bufferTx[0];  
}
/***********************************************************************************
*       Descrição       :       Verifica se o buffer de transmissão está vazio
*       Parametros      :       nenhum
*       Retorno         :       Tamanho do buffer de transmissão
***********************************************************************************/
unsigned short int PROTOCOLO_bytesNoBufferTx(void){
  
  return PROTOCOLO_bytesParaEnviar;
}
/***********************************************************************************
*       Descrição       :       envia data direto
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_enviaDadosDireto(unsigned char *buffer,unsigned char tamanho){
  
  for(unsigned char i=0;i<tamanho;i++)
    PROTOCOLO_bufferTx[i] = buffer[i];
  
  PROTOCOLO_bytesParaEnviar = tamanho-1;
  PROTOCOLO_bytesEnviados = 1;
  U3THR = buffer[0];    
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
