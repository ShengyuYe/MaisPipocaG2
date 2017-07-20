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
  //SMC_tick(); // Dentro do m�dulo ele verifica o bloqueio e habilita��o do cart�o
   
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
   eMDB_reply flag;
   eCASHLESS_VEND_RESULT resultado;
   unsigned short int pago;                                
   
   SMDB_wait();
   
   do flag = MDBCASHLESS_start_vend(&resultado,&pago,valor,item);
   while(flag!=MDB_OK && tentativas--);
   
   if(flag==MDB_OK)
     res = 1;   
   
   SMDB_release();      
   
   return res;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/