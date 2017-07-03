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
|       Arquivo            :  Teclado.c
|       Descrição          :  módulo principal do sistema
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  10/02/2015
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
#include "teclado.h"
#include "..\..\includes.h"

/***********************************************************************************
*       Definições
***********************************************************************************/
#define TECLA_ESC_PIN                   (0x01)<<8
#define TECLA_INC_PIN                   (0x01)<<9
#define TECLA_DEC_PIN                   (0x01)<<10
#define TECLA_ENTER_PIN                 (0x01)<<14
#define TECLA_GRATIS_PIN                (0x01)<<25        
#define CHAVE_FIM_PAPEL                 (unsigned int)(0x01)<<31
#define CHAVE_PORTA_ABERTA              (unsigned int)(0x01)<<30

#define GET_TECLA_ESC()                 (FIO1PIN&TECLA_ESC_PIN)?0:1
#define GET_TECLA_INC()                 (FIO1PIN&TECLA_INC_PIN)?0:2
#define GET_TECLA_DEC()                 (FIO1PIN&TECLA_DEC_PIN)?0:4
#define GET_TECLA_ENTER()               (FIO1PIN&TECLA_ENTER_PIN)?0:8        
#define GET_TECLA_GRATIS()              (FIO3PIN&TECLA_GRATIS_PIN)?0:16

#define TAM_BUF_TECLADO                 8
#define CICLOS_TECLADO                  50/8
#define RELOAD_CONTADOR_REPETICAO       2000
#define RELOAD_REPETICAO                50        

#define RELOAD_CONTADOR_TIMEOUT         60000
/***********************************************************************************
*       Constantes
***********************************************************************************/
const char *nomeTeclas[6]={
  "NENHUMA",
  "ESC    ",
  "DEC    ",  
  "INC    ",
  "ENTER  ",
  "GRATIS"
};


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned char TECLADO_bufferAmostragem[TAM_BUF_TECLADO];
unsigned short int TECLADO_contadorRepeticao=1;
unsigned int TECLADO_contadorTimeout=0;

/***********************************************************************************
*       Funções locais
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       inicialização da biblioteca
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void TECLADO_ini(void){
  
  
  
}
/***********************************************************************************
*       Descrição       :       Tick de timer da biblioteca do teclado
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void TECLADO_timerTick(void){
  static unsigned char indice=0;
  static unsigned short int ciclos=1;
  
  if(TECLADO_contadorTimeout)
    TECLADO_contadorTimeout--;
  
  if(TECLADO_contadorRepeticao)
    TECLADO_contadorRepeticao--;
  
  if(ciclos)
    ciclos--;
  else{
    TECLADO_bufferAmostragem[indice] = 0;
    TECLADO_bufferAmostragem[indice] |= GET_TECLA_ESC();  
    TECLADO_bufferAmostragem[indice] |= GET_TECLA_INC();  
    TECLADO_bufferAmostragem[indice] |= GET_TECLA_DEC();
    TECLADO_bufferAmostragem[indice] |= GET_TECLA_ENTER();
    TECLADO_bufferAmostragem[indice] |= GET_TECLA_GRATIS();
  
    indice = (indice + 1) % TAM_BUF_TECLADO;    
    ciclos = CICLOS_TECLADO;
  }
}
/***********************************************************************************
*       Descrição       :       Verifica se uma determinada tecla foi pressionada
*       Parametros      :       nenhum
*       Retorno         :       (eTECLA) código da tecla pressionada
***********************************************************************************/
eTECLA TECLADO_getch(void){
  unsigned char contador;
  static unsigned char teclaLivre=0;
  
  contador=0;
  for(unsigned char i=0;i<TAM_BUF_TECLADO;i++)    
    if((TECLADO_bufferAmostragem[i]&0x09)==0x09)
      contador++;
  
  if(contador>(TAM_BUF_TECLADO>>1))
    return TECLA_MENU_AVANCADO;
    
  for(unsigned char i=0;i<5;i++){
    // inicia a contagem em zero
    contador=0;
    // Conta as ocorrências da 
    // tecla no buffer
    for(unsigned char j=0;j<TAM_BUF_TECLADO;j++)
      if(TECLADO_bufferAmostragem[j]&(0x01<<i))
        contador++;
      
     if(contador>(TAM_BUF_TECLADO>>1)){
                     
       if(!TECLADO_contadorRepeticao){                 
         if(teclaLivre){
            teclaLivre = 0;
            TECLADO_contadorRepeticao = RELOAD_CONTADOR_REPETICAO;
            TECLADO_contadorTimeout = RELOAD_CONTADOR_TIMEOUT;
            //ultimaTecla = (eTECLA)(i+1);           
            return (eTECLA)(i+1);           
         }
         else{
            TECLADO_contadorRepeticao = RELOAD_REPETICAO;
            TECLADO_contadorTimeout = RELOAD_CONTADOR_TIMEOUT;
            //ultimaTecla = (eTECLA)(i+1);           
            return (eTECLA)(i+1);           
         }
       }
       else{
         if(teclaLivre){
            teclaLivre = 0;
            TECLADO_contadorRepeticao = RELOAD_CONTADOR_REPETICAO;
            TECLADO_contadorTimeout = RELOAD_CONTADOR_TIMEOUT;
            //ultimaTecla = (eTECLA)(i+1);           
            return (eTECLA)(i+1);                      
         }
         else
           return NENHUMA_TECLA;       
       }
     }
  }       
  
  //ultimaTecla = NENHUMA_TECLA;
  teclaLivre = 1;
  return NENHUMA_TECLA;
}
/***********************************************************************************
*       Descrição       :       Converte uma tecla para string
*       Parametros      :       (eTECLA) código da tecla
*       Retorno         :       (char*) nome da tecla
***********************************************************************************/
char* TECLADO_eTecla_to_String(eTECLA tecla){
  
  return (char*)nomeTeclas[(unsigned char)tecla];
}
/***********************************************************************************
*       Descrição       :       Getter para o contador de inatividade do teclado
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) maior do que zero se 
*                                              o contador for maior do que zero
***********************************************************************************/
unsigned int TECLADO_getContadorInatividade(void){
  
  return TECLADO_contadorTimeout;  
}
/***********************************************************************************
*       Descrição       :       Getter para os sinais da chave de porta 
*                               aberta
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero se a chave
*                                               de porta aberta estiver 
*                                               pressionada
***********************************************************************************/
unsigned char TECLADO_getChavePorta(void){
  unsigned char soma=0;
  
  for(unsigned char i=0;i<TAM_BUF_TECLADO;i++)
    if(TECLADO_bufferAmostragem[i]&64)
      soma++;
  
  return (soma>(TAM_BUF_TECLADO>>1));
}
/***********************************************************************************
*       Descrição       :       Getter para o sinal da chave de reserva do papel
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero se a chave
*                               de reserva do papel estiver pressionada
***********************************************************************************/
unsigned char TECLADO_getChaveReservaPapel(void){
  unsigned char soma=0;
  
  for(unsigned char i=0;i<TAM_BUF_TECLADO;i++)
    if(TECLADO_bufferAmostragem[i]&32)
      soma++;
  
  return (soma>(TAM_BUF_TECLADO>>1)); 
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
