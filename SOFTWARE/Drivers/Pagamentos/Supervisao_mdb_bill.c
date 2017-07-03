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
|       Arquivo            :  supervisao_mdb_bill.c
|       Descrição          :  Máquina de estados que gerencia o meio de pagamento
|                             MDB BILL
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  28/02/2017
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
#include <string.h>
#include "..\..\includes.h"
#include "supervisao_mdb_bill.h"

/***********************************************************************************
*       Definições
***********************************************************************************/
#define RELOAD_TIMEOUT_BILL                     100
#define CICLOS_RESET                            2
/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned char SMDBILL_bloqueio=0xFF;

unsigned short SMDBILL_time_out=0;

eBILL_POLL_STATE SMDBILL_estado_atual=BILL_DESABILITADO;

sBILL_event SMDBILL_eventos[16];

unsigned char SMDBILL_valor_canais[16]={1,2,5,10,20,50,100,7};

unsigned short int SMDBILL_country;

unsigned short int SMDBILL_escala=1;

unsigned char SMDBILL_casas_decimais;

unsigned short int SMDBILL_capacidade_stacker;

unsigned char SMDBILL_scroll_capacide;

unsigned short int SMDBILL_nivel_seguranca;

unsigned char SMDBILL_reset_counter=CICLOS_RESET;

/***********************************************************************************
*       Funções locais
***********************************************************************************/
eBILL_POLL_STATE SMDBILL_estado_desabilitado(eBILL_POLL_STATE estado);

eBILL_POLL_STATE SMDBILL_estado_bloqueado(eBILL_POLL_STATE estado);

eBILL_POLL_STATE SMDBILL_estado_reset(eBILL_POLL_STATE estado);

eBILL_POLL_STATE SMDBILL_estado_inicializa(eBILL_POLL_STATE estado);

eBILL_POLL_STATE SMDBILL_estado_supervisao(eBILL_POLL_STATE estado);

eBILL_POLL_STATE SMDBILL_estado_offline(eBILL_POLL_STATE estado);

eBILL_POLL_STATE SMDBILL_estado_falha_dispositivo(eBILL_POLL_STATE estado);

unsigned char SMDBILL_trata_eventos(unsigned char quantidade);

unsigned char SMDBILL_envia_comando_scroll(void);

/***********************************************************************************
*       tabela de funções
***********************************************************************************/
eBILL_POLL_STATE(*const MDBILL_funcs[])(eBILL_POLL_STATE)={
  SMDBILL_estado_desabilitado,
  SMDBILL_estado_bloqueado,
  SMDBILL_estado_reset,
  SMDBILL_estado_inicializa,
  SMDBILL_estado_supervisao,
  SMDBILL_estado_offline,
  SMDBILL_estado_falha_dispositivo
};

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Setter para o flag de bloqueio da máquina
*                               de estados que indica que o dispositivo
*                               deve ser inibido
*       Parametros      :       (unsigned char) flag
*       Retorno         :       nenhum
***********************************************************************************/
void SMDBILL_set_bloqueio(unsigned char bloqueio){
  
  SMDBILL_bloqueio = bloqueio;

}
/***********************************************************************************
*       Descrição       :       Função principal da máquiina de estados da
*                               supervisão do noteiro MDB
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void SMDBILL_tick(void){
  
  SMDBILL_estado_atual = MDBILL_funcs[SMDBILL_estado_atual](SMDBILL_estado_atual);  
}
/***********************************************************************************
*       Descrição       :       Função para o estado onde o noteiro
*                               está desabilitado
*       Parametros      :       (eBILL_POLL_STATE) estado atual
*       Retorno         :       (eBILL_POLL_STATE) novo estado
***********************************************************************************/
eBILL_POLL_STATE SMDBILL_estado_desabilitado(eBILL_POLL_STATE estado){
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_MDB_BIL,(void*)&flag);
  
  if(flag)
    return BILL_BLOQUEADO;
  
  
  return BILL_DESABILITADO;  
}
/***********************************************************************************
*       Descrição       :       Função para o estado onde o noteiro está
*                               bloqueado
*       Parametros      :       (eBILL_POLL_STATE) estado atual
*       Retorno         :       (eBILL_POLL_STATE) novo estado
***********************************************************************************/
eBILL_POLL_STATE SMDBILL_estado_bloqueado(eBILL_POLL_STATE estado){
  unsigned char tentativas=5;
  eMDB_reply flag;    
  
  SMDBILL_reset_counter=CICLOS_RESET;
  
  if(MDBILL_verifica_dispositivo()==MDB_OK){
    SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
    
    do{
      flag = MDBILL_set_bill_type_on_device(0,0);
      MDBAURT_sleep(1);
    
      if(SMDBILL_time_out)
        SMDBILL_time_out--;      
    }
    while(flag!=MDB_OK && --tentativas);
    
    if(!SMDBILL_time_out)
      return BILL_OFFLINE;
    else
      SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
    
    unsigned char enb;  
    // Pula para o desabilitado
    // caso não esteja habilitado
    PARAMETROS_le(ADR_FLAG_MDB_BIL,(void*)&enb);
    if(!enb)
      return BILL_DESABILITADO; 
  
    if(flag!=MDB_OK)
      return BILL_OFFLINE;     
    
    if(!SMDBILL_bloqueio)
      return BILL_RESET_AND_CHECK;
  }
  else{
    if(SMDBILL_time_out)
      SMDBILL_time_out--;
    else
      return BILL_OFFLINE;
  }  
  
  return BILL_BLOQUEADO;
}
/***********************************************************************************
*       Descrição       :       Função para o teste de reset
*       Parametros      :       (eBILL_POLL_STATE) estado atual
*       Retorno         :       (eBILL_POLL_STATE) novo estado
***********************************************************************************/
eBILL_POLL_STATE SMDBILL_estado_reset(eBILL_POLL_STATE estado){
  unsigned char tentativas=5;
  eMDB_reply flag;
  
  do{
    
    flag = MDBILL_reset_device();
    MDBAURT_sleep(1);
    
    if(SMDBILL_time_out)
      SMDBILL_time_out--;
    
  }
  while(flag!=MDB_OK && --tentativas);
  
  // Recomeça o ciclo de timeout se não chegou a zero
  // ou então vai pra o estado bloqueado caso chegou
  if(!SMDBILL_time_out)
    return BILL_BLOQUEADO;
  else
    SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
    
  // O reset ocorreu com sucesso
  if(flag==MDB_OK){
    
    unsigned char tamanho;
    tentativas = 5;
    
    do{       
       flag = MDBILL_get_poll_from_device((sBILL_event*)SMDBILL_eventos,&tamanho);
       MDBAURT_sleep(10);
    
       if(SMDBILL_time_out)
         SMDBILL_time_out--;                  
    }
    while(flag!=MDB_OK && --tentativas);
    
    
    if(!SMDBILL_time_out)
      return BILL_BLOQUEADO;
    else
      SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
    
    if(flag==MDB_OK){      
        for(unsigned char i=0;i<tamanho;i++)
          if(SMDBILL_eventos[i].tipo == BILL_STATUS &&  SMDBILL_eventos[i].args == VALIDATOR_WAS_RESET)
            return BILL_INICIALIZA;
    }    
  }  
  
  return BILL_RESET_AND_CHECK;
}
/***********************************************************************************
*       Descrição       :       Função para o estado onde está inicializando
*                               o noteiro
*       Parametros      :       (eBILL_POLL_STATE) estado atual
*       Retorno         :       (eBILL_POLL_STATE) novo estado
***********************************************************************************/
eBILL_POLL_STATE SMDBILL_estado_inicializa(eBILL_POLL_STATE estado){
  unsigned char tentativas=5;
  eMDB_reply flag;
  
  // Faz o reset do dispositivo
  do {
    
    flag = MDBILL_reset_device();
    
    MDBAURT_sleep(1);
    
    if(SMDBILL_time_out)
      SMDBILL_time_out--;
    
  }
  while(flag!=MDB_OK && --tentativas);
  
  // Saída para o caso de não receber
  // comunicação do dispositivo
  if(!SMDBILL_time_out)
    return BILL_OFFLINE;
  else
    SMDBILL_time_out = RELOAD_TIMEOUT_BILL;// se recebeu, inicializa o contador
  
  if(flag==MDB_OK){
    
    unsigned char notas;
    PARAMETROS_le(ADR_NOTAS,(void*)&notas);    
    
    unsigned short int notas_i = notas;
    
    tentativas=5;
    do{
      flag = MDBILL_set_bill_type_on_device(notas_i,notas_i);
      
      MDBAURT_sleep(1);
      
      if(SMDBILL_time_out)
        SMDBILL_time_out--;
    }
    while(flag!=MDB_OK && --tentativas);
    
    if(!SMDBILL_time_out)
      return BILL_OFFLINE;    
    else
      SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
    
    tentativas=5;
    unsigned char nivel;
    
    do{
      
      flag = MDBILL_get_setup_from_device(&nivel,&SMDBILL_country,&SMDBILL_escala,
                                          &SMDBILL_casas_decimais,&SMDBILL_capacidade_stacker,
                                          &SMDBILL_scroll_capacide,&SMDBILL_nivel_seguranca,SMDBILL_valor_canais);
        
      MDBAURT_sleep(1);
      
      if(SMDBILL_time_out)
        SMDBILL_time_out--;
    }
    while(flag!=MDB_OK && --tentativas);
    
    if(!SMDBILL_time_out)
      return BILL_OFFLINE;
    else
      SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
    
    if(flag!=MDB_OK){
      // Em caso de falha inicializa os canais com zero
      // para evitar crédito em algum
      // evento que receba da serial
      SMDBILL_valor_canais[0]=SMDBILL_valor_canais[1]=SMDBILL_valor_canais[2]=SMDBILL_valor_canais[3]=SMDBILL_valor_canais[4]=SMDBILL_valor_canais[5] = 0x00;
    }
    
  }
  
  return BILL_SUPERVISAO;  
}
/***********************************************************************************
*       Descrição       :       Função para a supervisão do noteiro
*       Parametros      :       (eBILL_POLL_STATE) estado atual
*       Retorno         :       (eBILL_POLL_STATE) novo estado
***********************************************************************************/
eBILL_POLL_STATE SMDBILL_estado_supervisao(eBILL_POLL_STATE estado){
  unsigned char tentativas=5;
  eMDB_reply flag;
  unsigned char tamanho;  
  
  do{
    
    flag = MDBILL_get_poll_from_device((sBILL_event*)SMDBILL_eventos,&tamanho);
      
    MDBAURT_sleep(1);
    
    if(SMDBILL_time_out)
      SMDBILL_time_out--;
    
  }
  while(flag!=MDB_OK && --tentativas);
  
  if(!SMDBILL_time_out)
    return BILL_OFFLINE;
  else
    SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
  
  if(flag==MDB_OK){
    // Foi recebido eventos pelo sistema
    if(!SMDBILL_trata_eventos(tamanho))
      return BILL_DESABILITADO;
  }
  else
    if(flag==MDB_JUST_RESET){
      // Houve um reset
      // do dispositivo
      return BILL_BLOQUEADO;      
    }
  
  unsigned char habilita;  
  PARAMETROS_le(ADR_FLAG_MDB_BIL,(void*)&habilita);  
  if(!habilita)
    return BILL_BLOQUEADO;
  
  if(SMDBILL_bloqueio)
    return BILL_BLOQUEADO;
  
  return BILL_SUPERVISAO;
}
/***********************************************************************************
*       Descrição       :       Função onde o noteiro está offline
*       Parametros      :       (eBILL_POLL_STATE) estado atual
*       Retorno         :       (eBILL_POLL_STATE) novo estado
***********************************************************************************/
eBILL_POLL_STATE SMDBILL_estado_offline(eBILL_POLL_STATE estado){
  unsigned char tentativas=5;
  eMDB_reply flag;
  
  do{
    
    flag = MDBILL_verifica_dispositivo();
    MDBAURT_sleep(1);           
  }
  while(flag!=MDB_OK && --tentativas);
  
  
  if(flag==MDB_OK){
     SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
     return BILL_BLOQUEADO;
  }
  
  return BILL_OFFLINE;
}
/***********************************************************************************
*       Descrição       :       Função onde o noteiro está sinalizando
*                               falha
*       Parametros      :       (eBILL_POLL_STATE) estado atual
*       Retorno         :       (eBILL_POLL_STATE) novo estado
***********************************************************************************/
eBILL_POLL_STATE SMDBILL_estado_falha_dispositivo(eBILL_POLL_STATE estado){
   
  
   return BILL_OFFLINE;
}
/***********************************************************************************
*       Descrição       :       Getter para o contador de timeout
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) timeout na comunicação
***********************************************************************************/
unsigned char SMDBILL_get_contador_timeout(void){
  
  return SMDBILL_time_out;
}
/***********************************************************************************
*       Descrição       :       Trata os eventos do MDBILL
*       Parametros      :       (unsigned char) tamanho
*       Retorno         :       nenhum
***********************************************************************************/
unsigned char SMDBILL_trata_eventos(unsigned char quantidade){
  static unsigned char canal;
  static unsigned char new_scrow=0;
  
  if(!quantidade)
    return 1;  
  
  for(unsigned char i=0;i<quantidade;i++){
    
    if(SMDBILL_eventos[i].tipo==BILL_STATUS){
      switch(SMDBILL_eventos[i].args){
        case DEFECTIVE_MOTOR:
             break;
        case SENSOR_PROBLEM:
             break;
        case VALIDATOR_BUSY:
             break;
        case ROM_CHECKSUM_ERROR:
             break;
        case VALIDATOR_JAMMED:
             break;
        case VALIDATOR_WAS_RESET:
             new_scrow = 0;
             break;
        case BILL_REMOVED:
             new_scrow = 0;
             break;
        case CASH_BOX_OUT_POSITION:    
             break;
        case UNIT_DISABLED:
             if(canal==255)
               new_scrow = 0;             
             break;
        case INVALID_ESCROW_REQUEST:
             break;
        case BILL_REJECTED:
             break;
        case POSSIBLE_CREDITED_BILL_REMOVAL:
             break;
      }
    }
    else{
      //Switch dos comandos
      switch(SMDBILL_eventos[i].tipo){
        case BILL_STACKED:
             if(new_scrow){
               PAGAMENTOS_adiciona_valores(SMDBILL_valor_canais[canal]*100);
               new_scrow = 0;  
               canal = 255;
             }             
             break;
        case ESCROW_POSITION:  
             if(MDBILL_send_escrow_command(STACK_BILL)==MDB_OK){
               //vTaskDelay(100);
               new_scrow = 1;
               canal = (unsigned char)(SMDBILL_eventos[i].args-CANAL_01);               
             }
             //else
               //vTaskDelay(1000);
             
             break;
        case BILL_RETURNED:
             new_scrow = 0;
             break;
        case NOT_USED:
             break;
        case DISABLED_BILL_REJECTED: 
             new_scrow = 0;
             break;
      }
    }
  }
  
  return 1;
}
/***********************************************************************************
*       Descrição       :       Envia o comando para fazer o armazenamento
*                               da nota
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero
***********************************************************************************/
unsigned char SMDBILL_envia_comando_scroll(void){
  unsigned char tentativas=5;
  eMDB_reply flag;
  
  
  do{
    
    flag = MDBILL_send_escrow_command(STACK_BILL);
    MDBAURT_sleep(1);
    
  }
  while(flag!=MDB_OK && --tentativas);

  if(flag == MDB_OK)
    return 1;
  
  return 0;
}
/***********************************************************************************
*       Descrição       :       Getter para verificar se o noteiro está
*                               online
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero se 
*                               estiver online
***********************************************************************************/
unsigned char SMDBILL_get_net_status(void){
  
  if(SMDBILL_estado_atual != BILL_OFFLINE)
    return 1;
  
  return 0;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/