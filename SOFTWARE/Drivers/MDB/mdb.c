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
|       Arquivo            :  mdb.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  25/02/2017
|
|       Revisões           :  001
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

#include "mdb.h"
#include "mdb_uart.h"
#include "mdb_bill.h"
#include "mdb_coin.h"
#include "mdb_cashless.h"

#include "..\..\includes.h"

/***********************************************************************************
*       Definiões locais
***********************************************************************************/
#define TIMEOUT_WAIT_MESSAGE                    50
#define MAX_PACKAGE_SIZE                        36

/***********************************************************************************
*       variaveis locais
***********************************************************************************/
unsigned char MDB_buffer_stream[MAX_PACKAGE_SIZE];
unsigned short int MDB_tube_status;
unsigned char MDB_tube_counter[16];

unsigned char coin_message_level;
unsigned short int coin_country;
unsigned char coin_fator_escala;
unsigned char coin_casas_decimais;
unsigned short int coin_types_routing;
unsigned char coin_credit[16];
eMDB_COIN_POOL_TYPE coin_tipo_evento;
eMDB_COIN_POOL_STATUS coin_status;
unsigned char coin_tipo_moeda;
unsigned char coin_quantidade_tubo;
/***********************************************************************************
*       Funções locais
***********************************************************************************/


/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Inicialização do módulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MDB_ini(void){
    
  MDBUART_ini();     
}
/***********************************************************************************
*       Descrição       :       Task principal da biblioteca MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MDB_main(void*pPAR){
  
  vTaskDelay(5000);
  
  SMDB_wait();    
  MDBCOIN_reset_device();
  SMDB_release();  
  
  for(;;){
    
    SMDB_wait();
    

   MDBCOIN_get_setup_from_device(&coin_message_level,
                                 &coin_country,
                                 &coin_fator_escala,
                                 &coin_casas_decimais,
                                 &coin_types_routing,
                                 coin_credit);
                                                                                                   
    MDBCOIN_get_tube_status_from_device(&MDB_tube_status,MDB_tube_counter);            
    MDBCOIN_coin_type_setup(0x0F,0x0F);
    
    /*
    if(dispensa){
      MDBCOIN_coin_dispense(2,2);
      dispensa = 0;
    }
    */
    
    MDBCOIN_poll(&coin_tipo_evento,
                 &coin_status,
                 &coin_tipo_moeda,
                 &coin_quantidade_tubo);    
    
    
    SMDB_release();
    
    vTaskDelay(100);
  }
}
/***********************************************************************************
*       Descrição       :       Calcula o CHK do pacote MDB
*       Parametros      :       (unsigned char*) pacote
*                               (unsigned char) tamanho
*       Retorno         :       (unsigned char) CHK do pacote
***********************************************************************************/
unsigned char MDB_chk_generate(unsigned char *pData,unsigned char size){
  unsigned char chk=0;
  
  for(unsigned char i=0;i<size;i++)
    chk+=pData[i];
  
  return chk;
}
/***********************************************************************************
*       Descrição       :       Envia um pacote para um dispositivo
*       Parametros      :       (unsigned char) pacote com endereço
*                               (unsigned char*) dados
*                               (unsigned char) tamanho
*                               (unsigned char) enviar ao ACK ao final 
*                               (unsigned char*) dados recebidos
*                               (unsigned char*) quantidade de bytes recebidos
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDB_send_package(unsigned char first_is_address,
                            unsigned char *pData,unsigned char data_length,
                            unsigned char send_ack,
                            unsigned char *pRx,unsigned char *rx_length){
  unsigned short int time_out=TIMEOUT_WAIT_MESSAGE;
  unsigned char flag;  
  
  //flag = U2RBR;
  //flag = U2LSR;  
  //U2FCR |= (0x02);  
    
  memcpy(MDB_buffer_stream,pData,data_length);
  MDB_buffer_stream[data_length] = MDB_chk_generate(pData,data_length);
      
  MDBUART_envia_pacote(first_is_address,MDB_buffer_stream,data_length+1);     
  
  do{
    flag = MDBUART_has_new_package();
    MDBAURT_sleep(1);
  }
  while(!flag && time_out--);
                     
  if(flag){
    
    unsigned char recebidos = MDBUART_get_bytes_recebidos();
    
    MDBUART_le_pacote(MDB_buffer_stream,recebidos>MAX_PACKAGE_SIZE?MAX_PACKAGE_SIZE:recebidos);          
        
    unsigned char checksum = MDB_chk_generate(MDB_buffer_stream,recebidos-1);
      
    memcpy(pRx,MDB_buffer_stream,recebidos>MAX_PACKAGE_SIZE?MAX_PACKAGE_SIZE:recebidos);
    *rx_length = recebidos>MAX_PACKAGE_SIZE?MAX_PACKAGE_SIZE:(recebidos-1);
     
    if(send_ack)     
      MDB_send_ack();              
    
    if(recebidos || MDB_buffer_stream[recebidos-1] == checksum)
      return MDB_OK;     
    
    return MDB_ERROR;
  }
  
  return MDB_TIMEOUT;
}
/***********************************************************************************
*       Descrição       :       Envia um pacote para um dispositivo
*       Parametros      :       (unsigned char) pacote com endereço
*                               (unsigned char*) dados
*                               (unsigned char) tamanho
*                               (unsigned char) enviar ao ACK ao final 
*                               (unsigned char*) dados recebidos
*                               (unsigned char*) quantidade de bytes recebidos
*       Retorno         :       (eMDB_reply) resultado da operação
***********************************************************************************/
eMDB_reply MDB_send_package_long(unsigned char first_is_address,
                                 unsigned char *pData,unsigned char data_length,
                                 unsigned char send_ack,
                                 unsigned char *pRx,unsigned char *rx_length){
  unsigned short int time_out=2000;
  unsigned char flag;  
                              
  memcpy(MDB_buffer_stream,pData,data_length);
  MDB_buffer_stream[data_length] = MDB_chk_generate(pData,data_length);
  
  MDBUART_envia_pacote(first_is_address,MDB_buffer_stream,data_length+1);     
  
  do{
    flag = MDBUART_has_new_package();
    MDBAURT_sleep(1);
  }
  while(!flag && time_out--);
                     
  if(flag){
    
    unsigned char recebidos = MDBUART_get_bytes_recebidos();
    
    MDBUART_le_pacote(MDB_buffer_stream,recebidos>MAX_PACKAGE_SIZE?MAX_PACKAGE_SIZE:recebidos);          
        
    unsigned char checksum = MDB_chk_generate(MDB_buffer_stream,recebidos-1);
      
    memcpy(pRx,MDB_buffer_stream,recebidos>MAX_PACKAGE_SIZE?MAX_PACKAGE_SIZE:recebidos);
    *rx_length = recebidos>MAX_PACKAGE_SIZE?MAX_PACKAGE_SIZE:(recebidos-1);
     
    if(send_ack)     
      MDB_send_ack();              
    
    if(recebidos == 1 || MDB_buffer_stream[recebidos-1] == checksum)
      return MDB_OK;     
    
    return MDB_ERROR;
  }
  
  return MDB_TIMEOUT;
}
/***********************************************************************************
*       Descrição       :       envia o ack ao escravo 
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MDB_send_ack(void){
  
  MDB_buffer_stream[0] = MDB_RESP_ACK;
  MDBUART_envia_pacote(0,MDB_buffer_stream,1);
}
/***********************************************************************************
*       Descrição       :       Libera troco no moedeiro
*       Parametros      :       (unsigned char) tipo da moeda
*                               (unsigned char) quantidade
*       Retorno         :       (unsigned chra) maior do que zero
*                                               se conseguir realizar
*                                               a operação
***********************************************************************************/
unsigned char MDB_coin_dispenser(unsigned char tipo,unsigned char quantidade){
  eMDB_reply flag;
  
  SMDB_wait();
  
  vTaskDelay(3000);
  flag = MDBCOIN_coin_dispense(quantidade,tipo);
    
  SMDB_release();
  
  if(flag==MDB_OK)
    return 1;
  
  return 0;
}
/***********************************************************************************
*       Descrição       :       Verifia o estado dos tubos de moedas
*       Parametros      :       (unsigned char*) tubos
*       Retorno         :       (unsigned char) maior do que zero se conseguir
*                               realizar a operação
***********************************************************************************/
unsigned char MDB_coin_check_tubes(unsigned char* tubes){
  unsigned char tubos[16];
  unsigned char tentativas=10;
  unsigned short int status;
  eMDB_reply flag;
  
  SMDB_wait();
  
  do flag = MDBCOIN_get_tube_status_from_device(&status,tubos);
  while(flag!=MDB_OK && --tentativas);
  
  SMDB_release();
  
  if(flag==MDB_OK){
    
    for(unsigned char i=0;i<16;i++)
      tubes[i] = tubos[i];
    return 1;
  }  
  
  return 0;
}
/***********************************************************************************
*       Descrição       :       Veririca se os dispositivos MDB habilitados
*                               estão presentes no barramento
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
eMDB_RESULTADO_SCAN MDB_checa_dispositivos(void){
  unsigned char flag_coin,flag_bill,flag_cashless;
  
  PARAMETROS_le(ADR_FLAG_MDB_BIL,(void*)&flag_bill);
  PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag_coin);
  PARAMETROS_le(ADR_FLAG_MDB_CASHLESS,(void*)&flag_cashless);
  
  SMDB_wait();
  
  if(flag_bill && !SMDBILL_get_net_status()){
    SMDB_release(); 
    return MDB_BILL_OFFLINE;
  }
  
  if(flag_coin && !SMDBCOIN_verifica_net_status()){
    SMDB_release(); 
    return MDB_COIN_OFFLINE;
  }
  
  if(flag_cashless && !SMC_get_cashless_online()){
    SMDB_release(); 
    return MDB_CASHLESS_OFFLINE;
  }
  
 
  SMDB_release(); 
  
  return MDB_TODOS_ONLINE;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
