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
|       Arquivo            :  BV20.c
|       Descrição          :  Biblioteca para controle dos meios de pagamento
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  22/02/2017
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

/***********************************************************************************
*       Definições
***********************************************************************************/
#define END_NOTEIRO             40

/***********************************************************************************
*       Constantes
***********************************************************************************/
const unsigned short int BV20_valor_canais[QTY_OF_LANGUAGES][7]={
  [BRASIL]    = {0,2,5,10,20,50,100},
  [URUGUAI]   = {0,2,5,10,20,50,100},
  [ARGENTINA] = {0,2,5,10,20,50,100},
  [PARAGUAI]  = {0,2,5,10,20,50,100},
  [PERU]      = {0,2,5,10,20,50,100},
  [EUA]       = {0,2,5,10,20,50,100},
  [CANADA]    = {0,2,5,10,20,50,100}
};

/***********************************************************************************
*       Variaveis locais
***********************************************************************************/
unsigned char BV20_regiao=BRASIL;
unsigned short int BV20_ultima_quantidade_eventos=0xFFFF;
unsigned char BV20_quantidade_eventos=0;
xSemaphoreHandle BV20_sem_acumulador_dinheiro;
xQueueHandle BV20_fila_sinais;
unsigned short int BV20_valor_acumulado=0;
CCTALK_BILL_EVENTS BV20_ultimo_evento;
eBV20_state estado_atual=BV20_INICIALIZACAO;
eBV20_state BV20_mensagemExterna=BV20_SEM_EVENTO;

/***********************************************************************************
*       Funções locais
***********************************************************************************/
unsigned char BV20_inicializNoteiro(void);

eBV20_state BV20_bloqueado(eBV20_state estado);
eBV20_state BV20_offline_bloqueado(eBV20_state estado);
eBV20_state BV20_estado_inicializacao(eBV20_state estado);
eBV20_state BV20_estado_offline(eBV20_state estado);
eBV20_state BV20_estado_le_evento(eBV20_state estado);
eBV20_state BV20_estado_supervisao(eBV20_state estado);
void BV20_decodifica_eventos(unsigned short int evento);
void BV20_decodifica_eventos(unsigned short int evento);
eBV20_state BV20_estado_bloqueio(eBV20_state estado);

/***********************************************************************************
*       Tabela de funções
***********************************************************************************/
eBV20_state(*BV20_func[])(eBV20_state)={
  BV20_estado_bloqueio,
  BV20_estado_inicializacao,
  BV20_estado_inicializacao,
  BV20_estado_offline,
  BV20_estado_supervisao,
  BV20_estado_le_evento
};

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Função principal do módulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void BV20_main(void*pPar){  
  
  vTaskDelay(3000);
  BV20_ini();
  
  for(;;){
      if(BV20_mensagemExterna==BV20_BLOQUEADO || BV20_mensagemExterna==BV20_INICIALIZACAO){
        estado_atual = BV20_mensagemExterna;
        BV20_mensagemExterna = BV20_SEM_EVENTO;
        
      }
      estado_atual = BV20_func[estado_atual](estado_atual);
      vTaskDelay(50);
  }    
}
/***********************************************************************************
*       Descrição       :       Inicialização do módulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void BV20_ini(void){
  
  vSemaphoreCreateBinary(BV20_sem_acumulador_dinheiro);
  BV20_fila_sinais = xQueueCreate(3,sizeof(sSINAL_PAGAMENTO));  
  BV20_regiao = APLICACAO_carrega_idioma();  
}
/***********************************************************************************
*       Descrição       :       Faz a inicialização do noteiro
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero
*                                               se conseguiu inicializar
***********************************************************************************/
unsigned char BV20_inicializNoteiro(void){
  unsigned char canais=0;
  unsigned char quantidadeEventos;
  unsigned short int eventos[7];
  
  PARAMETROS_le(ADR_NOTAS,(void*)&canais);
  
  unsigned short int tentativas=3;
  unsigned char flag;
  
  do flag = CCTALK_leFilaEventos(END_NOTEIRO,&quantidadeEventos,eventos);
  while(!flag && tentativas--);
  
  if(!flag)
    return 0;
  
  tentativas=3;
  do flag = CCTALK_setBitsHabilitacaoCanal(END_NOTEIRO,canais);
  while(!flag && tentativas--);
  
  if(!flag)
    return 0;
  
  tentativas=3;
  do flag = CCTALK_setFlagHabilitacaoGeral(END_NOTEIRO,255);
  while(!flag && tentativas--);
  
  if(!flag)
    return 0;
    
  return 255;  
}
/***********************************************************************************
*       Descrição       :       Função para o testado onde o noteiro está
*                               bloqueado
*       Parametros      :       (eBV20_state) estado
*       Retorno         :       (eBV20_state) novo estado
***********************************************************************************/
eBV20_state BV20_bloqueado(eBV20_state estado){
  
  
  return estado;
}
/***********************************************************************************
*       Descrição       :       Função para o estado em que o noteiro está
*                               bloqueado e offline
*       Parametros      :       (eBV20_state) estado
*       Retorno         :       (eBV20_state) novo estado
***********************************************************************************/
eBV20_state BV20_offline_bloqueado(eBV20_state estado){
  
  
  return estado;
}
/***********************************************************************************
*       Descrição       :       Função do estado onde ocorre a inicialização
*                               do noteiro BV20
*       Parametros      :       (eBV20_state) estado_atual
*       Retorno         :       (eBV20_state) novo estado
***********************************************************************************/
eBV20_state BV20_estado_inicializacao(eBV20_state estado){
  
  if(BV20_inicializNoteiro()){
    return BV20_SUPERVISAO;
  }
  
  return BV20_OFFLINE;
}
/***********************************************************************************
*       Descrição       :       Função para o estado em que o noteiro
*                               está offline
*       Parametros      :       (eBV20_state) estado atual
*       Retorno         :       (eBV20_state) novo estado
***********************************************************************************/
eBV20_state BV20_estado_offline(eBV20_state estado){
  
  
  return estado;
}
/***********************************************************************************
*       Descrição       :       Função em que trata o evento 
*                               de supervisão
*       Parametros      :       (eBV20_state) estado atual
*       Retorno         :       (eBV20_state) novo estado
***********************************************************************************/
eBV20_state BV20_estado_supervisao(eBV20_state estado){
  unsigned short int eventos[5];
  static unsigned char contador_ciclos=10;
  
  if(CCTALK_leFilaEventos(END_NOTEIRO,&BV20_quantidade_eventos,eventos)){    
    contador_ciclos=10;
    if(BV20_quantidade_eventos!=BV20_ultima_quantidade_eventos)
      estado = BV20_LE_EVENTO;
    else
      estado = BV20_SUPERVISAO;    
  }
  else{
    // Se não receber resposta
    // 10 vezes, considera o noteiro
    // OFFLINE
    if(contador_ciclos)
      contador_ciclos--;
    else
      estado = BV20_OFFLINE;    
  }
  
  return estado;
}
/***********************************************************************************
*       Descrição       :       Função para o estado em que é iniciada 
*                               a supervisão da fila de eventos
*                               do BV20
*       Parametros      :       (eBV20_state) estado atual
*       Retorno         :       (eBV20_state) novo estado
***********************************************************************************/
eBV20_state BV20_estado_le_evento(eBV20_state estado){
  unsigned short int eventos[5];
  unsigned char tentativas=5;
  unsigned char flag;
  
  do flag = CCTALK_leFilaEventos(END_NOTEIRO,&BV20_quantidade_eventos,eventos);
  while(!flag && --tentativas);
    
  if(!tentativas)
    return BV20_OFFLINE;
    
  if(BV20_quantidade_eventos!=BV20_ultima_quantidade_eventos){
    
    unsigned short int diferenca;
    if(BV20_quantidade_eventos>BV20_ultima_quantidade_eventos)
      diferenca = BV20_quantidade_eventos - BV20_ultima_quantidade_eventos;
    else
      diferenca = (255 - BV20_ultima_quantidade_eventos) + BV20_quantidade_eventos;

    for(unsigned char i=0;i<diferenca && i<5;i++)      
      BV20_decodifica_eventos(eventos[i]);    
    
    BV20_ultima_quantidade_eventos = BV20_quantidade_eventos;    
  }
  
  return BV20_SUPERVISAO;
}
/***********************************************************************************
*       Descrição       :       Decodifica os eventos do BV20
*       Parametros      :       (unsigned short int) evento
*       Retorno         :       nenhum
***********************************************************************************/
void BV20_decodifica_eventos(unsigned short int evento){
  static unsigned short int valorGolpe = 100;
  static CCTALK_BILL_EVENTS last_evento;
  unsigned char i;
  
  switch(evento>>8){
    case BILL_VALIDATED_OK:       
         break;
    case BILL_VALIDATED_OK_AND_SCROW:                         
              {
                  unsigned char tentativas=10;
                  unsigned char flag;
                  i = 0;
                
                  do flag = CCTALK_rotacionaValidador(END_NOTEIRO);
                  while(!flag && tentativas--);
                
                  if(flag){                                                                 
                    while(!xSemaphoreTake(BV20_sem_acumulador_dinheiro,portTICK_RATE_MS*1));  
                    
                    BV20_valor_acumulado += BV20_valor_canais[BV20_regiao][evento&0xFF];    
                    valorGolpe = BV20_valor_canais[BV20_regiao][evento&0xFF];    
                    
                    xSemaphoreGive(BV20_sem_acumulador_dinheiro); 
                  }
                  
                  i++;
                  vTaskDelay(200);
               }
         break;            
    case MASTER_INHIBIT_ACTIVE:
    case BILL_RETURNED_FROM_ESCROW:               
         if(last_evento==BILL_VALIDATED_OK_AND_SCROW){
         
             while(!xSemaphoreTake(BV20_sem_acumulador_dinheiro,portTICK_RATE_MS*1));      
                    
             if(BV20_valor_acumulado>=valorGolpe) 
               BV20_valor_acumulado -= valorGolpe;
             else
               BV20_valor_acumulado = 0;
                 
             xSemaphoreGive(BV20_sem_acumulador_dinheiro);                  
             valorGolpe = 0;                                               
                                                     
         }
         break;
    case BILL_JAMMED_IN_TRANSPORT:           
    case BILL_JAMMED_IN_BACKWARDS:                   
    case BILL_TAMPER:                                   
    case INVALID_BILL_VALIDATION:            
    case BILL_JAMMED_IN_TRANSPORT_SAFE:            
    case OPTO_FRAUD_DETECTED:            
         last_evento = UNKNOWN_BILL_TYPE_STACKED;
         {
           while(!xSemaphoreTake(BV20_sem_acumulador_dinheiro,portTICK_RATE_MS*1));   
                  
           if(BV20_valor_acumulado) 
             BV20_valor_acumulado -= valorGolpe;
                  
           xSemaphoreGive(BV20_sem_acumulador_dinheiro);                  
           valorGolpe = 0;                  
         } 
         break;
    case INVALID_BILL_TRANSPORTATION:
         break;
    case INHIBIT_BILL_SERIAL:
    case INHIBIT_BILL_DIPSWITCH:
    case STACKER_OK: 
    case STACKER_INVERTED:   
    case STACKER_FAULTY:     
    case STACKER_FULL:   
    case STACKER_JAMMED:
    case STRING_FRAUD_DETECTED:
    case ANTI_STRING_MECHANISM_FAULTY: 
    case BARCODE_DETECTED:
    case UNKNOWN_BILL_TYPE_STACKED:
         break;            
  }        
  
  last_evento = (CCTALK_BILL_EVENTS)(evento>>8);
  BV20_ultimo_evento = last_evento;
}
/***********************************************************************************
*       Descrição       :       Lê o valor acumulado de moeda
*       Parametros      :       nenhum
*       Retorno         :       (unsigned short int) valor acumulado
***********************************************************************************/
unsigned short int BV20_get_valor_acumulador(void){
   unsigned short int valor=0;
  
   while(!xSemaphoreTake(BV20_sem_acumulador_dinheiro,portTICK_RATE_MS*1));     
  
   valor = BV20_valor_acumulado;
   
   xSemaphoreGive(BV20_sem_acumulador_dinheiro);     
   
   return valor;
}
/***********************************************************************************
*       Descrição       :      seter para o acumulado de moeda
*       Parametros      :      (unsigned short int) subtrai o valor do acumulado
*       Retorno         :       nenhum
***********************************************************************************/
void BV20_subtrai_valor_acumulado(unsigned short int valor){
  
   while(!xSemaphoreTake(BV20_sem_acumulador_dinheiro,portTICK_RATE_MS*1));     
   
   if(valor>=BV20_valor_acumulado)
     BV20_valor_acumulado -= valor;
   else
     BV20_valor_acumulado = 0;
   
   xSemaphoreGive(BV20_sem_acumulador_dinheiro); 
}
/***********************************************************************************
*       Descrição       :       Getter para o último evento validado pelo
*                               noteiro
*       Parametros      :       nenhum
*       Retorno         :       (CCTALK_BILL_EVENTS) eventos
***********************************************************************************/
CCTALK_BILL_EVENTS BV20_get_ultimo_evento(void){
  
  return BV20_ultimo_evento;
}
/***********************************************************************************
*       Descrição       :       Getter para o estado atual da máquina de 
*                               estados que supervisiona o BV20
*       Parametros      :       nenhum
*       Retorno         :       (eBV20_state) estado atual da máquina
*                                             de estados que supervisona o BV20
***********************************************************************************/
eBV20_state BV20_get_current_state(void){
  
  return estado_atual;
}
/***********************************************************************************
*       Descrição       :       Faz o bloqueio do noteiro
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
eBV20_state BV20_estado_bloqueio(eBV20_state estado){
  unsigned int tentativas=3;
  unsigned char flag;
  
  do flag = CCTALK_setBitsHabilitacaoCanal(END_NOTEIRO,0);
  while(!flag && tentativas--);  
  
  return BV20_BLOQUEADO;
}
/***********************************************************************************
*       Descrição       :       Setter para o bloqueio 
*       Parametros      :       (unsigned char) flag
*       Retorno         :       nenhum
***********************************************************************************/
void BV20_setter_bloqueio(unsigned char flag){
  
  if(flag)
    BV20_mensagemExterna = BV20_BLOQUEADO;
  else
    BV20_mensagemExterna = BV20_INICIALIZACAO;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/