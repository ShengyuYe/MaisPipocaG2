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
|       Arquivo            :  Supervisao_MDB.c
|       Descri��o          :  Biblioteca para controle dos meios de pagamento
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  28/02/2017
|
|       Revis�es           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "..\..\includes.h"
#include "supervisao_mdb.h"
#include "supervisao_mdb_bill.h"
#include "supervisao_mdb_coin.h"
#include "supervisao_mdb_cashless.h"
/***********************************************************************************
*       Defini��es
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
xSemaphoreHandle SMDB_semaforo_barramento;

/***********************************************************************************
*       Fun��es locais
***********************************************************************************/


/***********************************************************************************
*       Implementa��o das fun��es
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Inicializa��o do m�dulo de supervis�o
*                               dos dispositivos MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void SMDB_ini(void){
  
  SMDBILL_set_bloqueio(0);  
  SMC_ini();
  vSemaphoreCreateBinary(SMDB_semaforo_barramento);
}
/***********************************************************************************
*       Descri��o       :       Ponto de entrada da m�quina de estados 
*                               que faz a supervis�o dos dispositivos MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void SMDB_tick(void){
  //unsigned char bill;  
  
  while(!xSemaphoreTake(SMDB_semaforo_barramento,portTICK_RATE_MS*1));     
   
  vTaskDelay(5);  
  SMDBILL_tick(); // dentro do m�dulo ele verifica o bloqueio e habilita��o do perif�rico
  SMDBCOIN_tick(); // 
  SMC_tick(); // Dentro do m�dulo ele verifica o bloqueio e habilita��o do cart�o
   
  xSemaphoreGive(SMDB_semaforo_barramento); 
}
/***********************************************************************************
*       Descri��o       :       Wait para o barramento MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void SMDB_wait(void){
  
  while(!xSemaphoreTake(SMDB_semaforo_barramento,portTICK_RATE_MS*1));    
}
/***********************************************************************************
*       Descri��o       :       Release para o barramento
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void SMDB_release(void){
  
  xSemaphoreGive(SMDB_semaforo_barramento); 
}
/***********************************************************************************
*       Descri��o       :       Inicia uma venda
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero
*                                               se a venda for iniciada
***********************************************************************************/
unsigned char SMDB_cashless_vend(unsigned short int valor,
                                 unsigned short int item){
   unsigned char tentativas=10;
   unsigned char res=0;
   eCASHLESS_VEND_RESULT venda;
   unsigned short int pago;
   
   eMDB_reply flag;
                                   
   SMDB_wait();
   
   do flag = MDBCASHLESS_start_vend(&venda,&pago,valor,item);
   while(flag!=MDB_OK && tentativas--);
   
   if(flag==MDB_OK)
     res = 1;   
   
   SMDB_release();      
   
   return res;
}
/***********************************************************************************
*       Descri��o       :       Envia o comando que faz o cancelamento
*                               da venda
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero
*                               se a venda foi cancelada
***********************************************************************************/
unsigned char SMDB_cancela_venda(void){
   unsigned char tentativas=10;
   unsigned char res=0;
   
   eMDB_reply flag;
                                   
   SMDB_wait();
   
   do flag = MDBCASHLESS_vend_cancel();
   while(flag!=MDB_OK && tentativas--);
   
   if(flag==MDB_OK)
     res = 1;   
   
   SMDB_release();      
   
   return res;  
}
/***********************************************************************************
*       Descri��o       :       Envia o comando de sucesso na venda
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero se conseguir
*                               enviar o comando para a placa
***********************************************************************************/
unsigned char  SMDB_vend_success(unsigned short int item){
   unsigned char tentativas=10;
   unsigned char res=0;
   
   eMDB_reply flag;
                                   
   SMDB_wait();
   
   do flag = MDBCASHLESS_vend_success(item);
   while(flag!=MDB_OK && tentativas--);
   
   if(flag==MDB_OK)
     res = 1;   
   
   SMDB_release();      
   
   return res;  
}
/***********************************************************************************
*       Descri��o       :       Faz uma venda no cart�o
*       Parametros      :       (unsigned int) valor
*       Retorno         :       (unsigned char) maior do que zero se conseguir
*                                               realizar a venda
***********************************************************************************/
unsigned char SMDB_venda_cartao(unsigned short int preco){
  eMDB_reply flag;
  unsigned char tentativas;
  unsigned short int pago;
  eCASHLESS_VEND_RESULT venda;  
  unsigned short int timeout=15000;
  
  SMDB_wait();
  
  tentativas = 5;
  do flag = MDBCASHLESS_start_vend(&venda,&pago,preco,1);
  while(flag!=MDB_OK && tentativas--);
  
  if(flag!=MDB_OK || venda==VEND_DENIED){
    SMDB_release();     
    return 0;
  }
  
  eMDB_POLL_HEADER header;
  
  for(;--timeout;){
    
    tentativas = 10;
    
    do flag = CASHLESS_poll_device(&header,NULL);
    while(flag!=MDB_OK && --tentativas);
      
    if(flag!=MDB_OK){
      SMDB_release();     
      return 0;      
    }else{
      if(header==CASHLESS_POOL_VEND_APPROVED){
        SMDB_release(); 
        return SMDB_vend_success(1);
      }
    }
      
    vTaskDelay(1);
  }
  
  if(!timeout){
    SMDB_release();       
    return 0;
  }      
  
  SMDB_release();       
  return 0;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/