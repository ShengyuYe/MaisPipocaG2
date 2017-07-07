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
|       Arquivo            :  Protocolo.c
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  21/02/2014
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
#include "protocolo.h"
#include "..\..\includes.h"

/***********************************************************************************
*       Defini��es locais
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
*       Fun��es locais
***********************************************************************************/
void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho);
unsigned char PROTOCOLO_checksum(unsigned char*pData,unsigned short int tamanho);
void PROTOCOLO_decodeLeBloco(unsigned long int endereco,unsigned char tamanho);
void PROTOCOLO_decodeEscreveBloco(unsigned long int endereco,unsigned char tamanho,unsigned char *dados);
void PROTOCOLO_decodeFormataAudioFlash(void);
void PROTOCOLO_decodeEscreveTabelaMusicas(unsigned char musica,
                                          unsigned long int enderecoInicial,
                                          unsigned long int tamanho);
void PROTOCOLO_decodeLeituraTabelaMusicas(unsigned char musica);
void PROTOCOLO_decodeEscreveParametro(unsigned char indice,unsigned short int valor);
void PROTOCOLO_decodeLeParametro(unsigned char indice);
void PROTOCOLO_decodeMensagemUsuario(unsigned char indice,unsigned char *msg);
void PROTOCOLO_decodeAssinaPlaca(void);
void PROTOCOLO_decodifica_tamanho_parametros(void);
void PROTOCOLO_decodifica_info_sobre_parametro(unsigned short int parametro);
void PROTOCOLO_decodifica_leitura_valor_parametro(unsigned short int parametro);
void PROTOCOLO_decodifica_escrita_valor_parametro(unsigned short int parametro,
                                                  unsigned char tipo,
                                                  unsigned char *valor);

/***********************************************************************************
*       Implementa��o das fun��es
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Inicializa��o da biblioteca
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_ini(void){
  
  UART_init(3,36600,NULL,NULL,NULL);    
}
/***********************************************************************************
*       Descri��o       :       Fun��o para tratamento da interrup��o
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
  
  //Apaga o flag de interrup��o pendente
  CLRPEND0 |= (0x01)<<5;       
}
/***********************************************************************************
*       Descri��o       :       Tick de timer para a biblioteca do protocolo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_timerTick(void){
  
  
  
}
/***********************************************************************************
*       Descri��o       :       Calcula o checksum de um pacote de dados
*       Parametros      :       (unsigned char*) ponteiro para o in�cio do pacote
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
*       Descri��o       :       Thread do protocolo
*       Protocolo       :       (void*) pPar
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_main(void*pPar){
  
  PROTOCOLO_ini();
  //WATCHDOG_init(0);  
  
  for(;;){
        
    //FEEDS_THE_DOG();
    
    if(PROTOCOLO_novoPacote){
      /*
      PROTOCOLO_novoPacote = 0;        
      if(PROTOCOLO_checksum(PROTOCOLO_bufferRx,PROTOCOLO_bufferRx[1]-1)==PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos-1]){      
        switch(PROTOCOLO_bufferRx[0]){
         case READ_DATA_FLASH_BLOCK:              
              PROTOCOLO_decodeLeBloco     (PROTOCOLO_bufferRx[2]<<24 | PROTOCOLO_bufferRx[3]<<16 | PROTOCOLO_bufferRx[4]<<8 | PROTOCOLO_bufferRx[5],PROTOCOLO_bufferRx[6]);
              break;
         case WRITE_DATA_FLASH_BLOCK:
              PROTOCOLO_decodeEscreveBloco(PROTOCOLO_bufferRx[2]<<24 | PROTOCOLO_bufferRx[3]<<16 | PROTOCOLO_bufferRx[4]<<8 | PROTOCOLO_bufferRx[5],PROTOCOLO_bufferRx[6],&PROTOCOLO_bufferRx[7]);
              break;
         case FORMAT_AUDIO_FLASH:
              PROTOCOLO_decodeFormataAudioFlash();
              break;
         case WRITE_MUSIC_TABLE:
              PROTOCOLO_decodeEscreveTabelaMusicas(PROTOCOLO_bufferRx[2],
                                                   PROTOCOLO_bufferRx[3]<<16 | PROTOCOLO_bufferRx[4]<<8 | PROTOCOLO_bufferRx[5],
                                                   PROTOCOLO_bufferRx[6]<<16 | PROTOCOLO_bufferRx[7]<<8 | PROTOCOLO_bufferRx[8]);
              break;
         case READ_MUSIC_TABLE:
              PROTOCOLO_decodeLeituraTabelaMusicas(PROTOCOLO_bufferRx[2]);
              break;          
         case GET_PARAMETERS_LENGHT:
              PROTOCOLO_decodifica_tamanho_parametros();
              break;
         case GET_PARAMETER_INFO:
              PROTOCOLO_decodifica_info_sobre_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3]);
              break;
         case GET_PARAMETER_DATA:
              PROTOCOLO_decodifica_leitura_valor_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3]);
              break;
         case SET_PARAMETER_DATA:
              PROTOCOLO_decodifica_escrita_valor_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3],
                                                           PROTOCOLO_bufferRx[4],
                                                          &PROTOCOLO_bufferRx[5]);
              break;
        }
      */
      //}      
    }
    vTaskDelay(1);
  }    
}
/***********************************************************************************
*       Descri��o       :       Encapsula os dados que ser�o enviados
*                               pela rede
*       Parametros      :       (unsigned char*) ponteiro para os dados que ser�o
*                                               enviados
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho){
  unsigned char indice=0;
  
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
*       Descri��o       :       L� um bloco de dados da dataflash
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_decodeLeBloco(unsigned long int endereco,unsigned char tamanho){
                       
  /*
  if(tamanho>128){     
    PROTOCOLO_bufferTmp[0] = READ_DATA_FLASH_BLOCK | 0x80;
    PROTOCOLO_bufferTmp[1] = 4;
    PROTOCOLO_bufferTmp[2] = 1;
    PROTOCOLO_bufferTmp[3] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,3);
    
    PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,4);  
  }
  else{
    PROTOCOLO_bufferTmp[0] = READ_DATA_FLASH_BLOCK;
    PROTOCOLO_bufferTmp[1] = tamanho+8;
    PROTOCOLO_bufferTmp[2] = endereco>>24;
    PROTOCOLO_bufferTmp[3] = endereco>>16;
    PROTOCOLO_bufferTmp[4] = endereco>>8;
    PROTOCOLO_bufferTmp[5] = endereco;
    PROTOCOLO_bufferTmp[6] = tamanho;
   
    SST_highSpeedRead(endereco+AREA_AUDIO,&PROTOCOLO_bufferTmp[7],tamanho);
  
    PROTOCOLO_bufferTmp[7+tamanho] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,7+tamanho);
    PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,tamanho+8);  
  }
  */
}
/***********************************************************************************
*       Descri��o       :       Escreve um bloco de dados
*                               na mem�ria de dados
*       Parametros      :       (unsigned int) endereco inicial da escrita
*                               (unsigned char) tamanho do bloco
*                               (unsigned char*) ponteiro para os dados
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_decodeEscreveBloco(unsigned long int endereco,unsigned char tamanho,
                                  unsigned char *dados){
                                    /*
  
  if(tamanho>128){    
    PROTOCOLO_bufferTmp[0] = WRITE_DATA_FLASH_BLOCK | 0x80;
    PROTOCOLO_bufferTmp[1] = 4;
    PROTOCOLO_bufferTmp[2] = 1;
    PROTOCOLO_bufferTmp[3] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,3);
    
    PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,4);      
  }
  else{
    PROTOCOLO_bufferTmp[0] = WRITE_DATA_FLASH_BLOCK;
    PROTOCOLO_bufferTmp[1] = 8;
    PROTOCOLO_bufferTmp[2] = endereco>>24;
    PROTOCOLO_bufferTmp[3] = endereco>>16;
    PROTOCOLO_bufferTmp[4] = endereco>>8;
    PROTOCOLO_bufferTmp[5] = endereco;
    PROTOCOLO_bufferTmp[6] = tamanho;
   
    SST_writeAutoAddressInc(endereco+AREA_AUDIO,dados,tamanho);
  
    PROTOCOLO_bufferTmp[7] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,7);
    PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,8);  
  }      
                                    */
}
/***********************************************************************************
*       Descri��o       :      Formata a �rea da flash onde s�o alocados
*                              os arquivos de audio
*       Parametros      :      nenhum
*       Retorno         :      nenhum
***********************************************************************************/
void PROTOCOLO_decodeFormataAudioFlash(void){
  /*
  unsigned long int enderecoInicial=AREA_AUDIO;
  
  for(unsigned short int i=0;i<599;i++){
    SST_erase4kbSector(enderecoInicial);
    enderecoInicial+=4096;
    //FEEDS_THE_DOG();
  }
    
  PROTOCOLO_bufferTmp[0] = FORMAT_AUDIO_FLASH;
  PROTOCOLO_bufferTmp[1] = 3;
  PROTOCOLO_bufferTmp[2] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,2);
  
  PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,3);  
  */
}
/***********************************************************************************
*       Descri��o       :       Escreve valores na tabela de musica do sistema
*       Parametros      :       (unsigned char) m�sica
*                               (unsigned long int) endereco inicial
*                               (unsigned long int) tamanho da m�sica
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_decodeEscreveTabelaMusicas(unsigned char musica,
                                          unsigned long int enderecoInicial,
                                          unsigned long int tamanho){
                                            
                                            /*
  if(musica>3){
    PROTOCOLO_bufferTmp[0] = WRITE_MUSIC_TABLE | 0x80;
    PROTOCOLO_bufferTmp[1] = 4;
    PROTOCOLO_bufferTmp[2] = 1;
    PROTOCOLO_bufferTmp[3] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,3);
    
    PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,4);                                                    
  } 
  else{
    
    unsigned int temp;
    
    temp = enderecoInicial + AREA_AUDIO;
    PARAMETROS_grava(ADR_INICIO_BLOCO_MUSICA+musica,(void*)&temp);
    
    temp = tamanho;
    PARAMETROS_grava(ADR_TAMANHO_BLOCO_MUSICA+musica,(void*)&temp);
    
    PROTOCOLO_bufferTmp[0] = WRITE_MUSIC_TABLE;
    PROTOCOLO_bufferTmp[1] = 10;
    PROTOCOLO_bufferTmp[2] = musica;
    PROTOCOLO_bufferTmp[3] = enderecoInicial>>16;
    PROTOCOLO_bufferTmp[4] = enderecoInicial>>8;
    PROTOCOLO_bufferTmp[5] = enderecoInicial;
    PROTOCOLO_bufferTmp[6] = tamanho>>16;
    PROTOCOLO_bufferTmp[7] = tamanho>>8;
    PROTOCOLO_bufferTmp[8] = tamanho;
    PROTOCOLO_bufferTmp[9] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,9);
    
    PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,10);                      
  }        
                                            */
}
/***********************************************************************************
*       Descri��o       :       L� os valores da tabela de m�sica do sistema
*       Parametros      :       (unsigned char) m�sica
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_decodeLeituraTabelaMusicas(unsigned char musica){
  
  /*
  if(musica>3){
    PROTOCOLO_bufferTmp[0] = READ_MUSIC_TABLE | 0x80;
    PROTOCOLO_bufferTmp[1] = 4;
    PROTOCOLO_bufferTmp[2] = 1;
    PROTOCOLO_bufferTmp[3] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,3);
    
    PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,4);   
  }
  else{
    unsigned int enderecoInicial;
    unsigned int tamanho;
    
    
    PARAMETROS_le(ADR_INICIO_BLOCO_MUSICA+musica ,(void*)&enderecoInicial);
    PARAMETROS_le(ADR_TAMANHO_BLOCO_MUSICA+musica,(void*)&tamanho);
    
    enderecoInicial -= AREA_AUDIO;
    
    PROTOCOLO_bufferTmp[0] = READ_MUSIC_TABLE;
    PROTOCOLO_bufferTmp[1] = 10;
    PROTOCOLO_bufferTmp[2] = musica;
    PROTOCOLO_bufferTmp[3] = enderecoInicial>>16;
    PROTOCOLO_bufferTmp[4] = enderecoInicial>>8;
    PROTOCOLO_bufferTmp[5] = enderecoInicial;
    PROTOCOLO_bufferTmp[6] = tamanho>>16;
    PROTOCOLO_bufferTmp[7] = tamanho>>8;
    PROTOCOLO_bufferTmp[8] = tamanho;
    PROTOCOLO_bufferTmp[9] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,9);
    
    PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,10);   
  }  
  */
}
/***********************************************************************************
*       Descri��o       :       envia data direto
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_enviaDadosDireto(unsigned char *buffer,unsigned char tamanho){
  
  /*
  for(unsigned char i=0;i<tamanho;i++)
    PROTOCOLO_bufferTx[i] = buffer[i];
  
  PROTOCOLO_bytesParaEnviar = tamanho-1;
  PROTOCOLO_bytesEnviados = 1;
  U3THR = buffer[0];    
  */
}
/***********************************************************************************
*       Descri��o       :       Verifica se o buffer de transmiss�o est� vazio
*       Parametros      :       nenhum
*       Retorno         :       Tamanho do buffer de transmiss�o
***********************************************************************************/
unsigned short int PROTOCOLO_bytesNoBufferTx(void){
  
  return PROTOCOLO_bytesParaEnviar;
}
/***********************************************************************************
*       Descri��o       :       Decodofica o comando para leitura do tamanho
*                               da listagem de par�metros
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_decodifica_tamanho_parametros(void){
  
  /*
    PROTOCOLO_bufferTmp[0] = GET_PARAMETERS_LENGHT;
    PROTOCOLO_bufferTmp[1] = 6;
    PROTOCOLO_bufferTmp[2] = TAMANHO_PARAMETROS>>8;    
    PROTOCOLO_bufferTmp[3] = TAMANHO_PARAMETROS;
    PROTOCOLO_bufferTmp[4] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,4);
    PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,5);    
  */
}
/***********************************************************************************
*       Descri��o       :       Decodifica o comando que solocita a informa��o
*                               sobre um dos par�metros
*       Parametros      :       (unsigned int) parametro
*       Retorno         :       nenhum
***********************************************************************************/
extern const sPARAMETROS tabela_parametros[];
void PROTOCOLO_decodifica_info_sobre_parametro(unsigned short int parametro){
  
  /*
   PROTOCOLO_bufferTmp[0] = GET_PARAMETER_INFO;
   PROTOCOLO_bufferTmp[1] = parametro;
   PROTOCOLO_bufferTmp[2] = tabela_parametros[parametro].length;
   
   for(unsigned char i=0;i<32;i++)    
     PROTOCOLO_bufferTmp[3+i] = tabela_parametros[parametro].nome[i];
   
   PROTOCOLO_bufferTmp[36] = tabela_parametros[parametro].ext[0];
   PROTOCOLO_bufferTmp[37] = tabela_parametros[parametro].ext[1];
   PROTOCOLO_bufferTmp[38] = tabela_parametros[parametro].ext[2];
   PROTOCOLO_bufferTmp[39] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,39);
   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,40);
  */
}
/***********************************************************************************
*       Descri��o       :       Decodifica o comando que solicita a leitura
*                               de um dos par�metros do sistema
*       Parametros      :       (unsigned short int) par�metro
8       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_decodifica_leitura_valor_parametro(unsigned short int parametro){
  
  
}
/***********************************************************************************
*       Descri��o       :       Decodifica o comando que solicita a escrita
*                               de um dos par�metros do sistema
*       Parametro       :       (unsigned int) parametro
*                               (unsigned char) tipo
*                               (unsigned char*) dados do par�metro
*       Retorno         :       nenhum
***********************************************************************************/
void PROTOCOLO_decodifica_escrita_valor_parametro(unsigned short int parametro,
                                                  unsigned char tipo,
                                                  unsigned char *valor){
                                            
                                                    
                                                    
                                                    
                                                    
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
