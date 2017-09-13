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
|       Arquivo            :  Pagamentos.c
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
#include <nxp\iolpc1768.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "..\..\includes.h"
#include "pagamentos.h"
#include "supervisao_mdb.h"
/***********************************************************************************
*       Definição
***********************************************************************************/
#define INHIBIT_UCA1_PIN                        (0x01)<<24
#define INI_INHIBIT_UCA1()                      FIO1DIR|=INHIBIT_UCA1_PIN
#define SET_INHIBIT_UCA1(X)                     X?(FIO1SET|=INHIBIT_UCA1_PIN):(FIO1CLR|=INHIBIT_UCA1_PIN)

#define INHIBIT_P70_PIN                         (0x01)<<25
#define INI_INHIBIT_P70()                       FIO1DIR|=INHIBIT_P70_PIN
#define SET_INHIBIT_P70(X)                      X?(FIO1SET|=INHIBIT_P70_PIN):(FIO1CLR|=INHIBIT_P70_PIN)

#define RELOAD_FILTRO_UCA                       50
#define RELOAD_TIMEOUT_PAGAMENTO                60*1000
/***********************************************************************************
*       Variaveis - locais
***********************************************************************************/
unsigned short int PAGAMENTOS_valor_acumulado_uca=0;
unsigned short int PAGAMENTOS_filtro_uca=0;
unsigned short int PAGAMENTOS_valor_acumulado_p70=0;
unsigned short int PAGAMENTOS_filtro_p70=0;
unsigned int PAGAMENTOS_timeout_pagamento=0; 
unsigned int PAGAMENTOS_incremento_uca;
unsigned int PAGAMENTOS_incremento_p70;

int PAGAMENTOS_valor_acumulado_geral=0;

xSemaphoreHandle PAGAMENTOS_semaforo_pagamentos;
unsigned PAGAMENTOS_bloqueio_p70=255;

/***********************************************************************************
*       Funções - locais
***********************************************************************************/
void PAGAMENTOS_irq_uca_1(void);
void PAGAMENTOS_irq_p70(void);

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Inicializa o módulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PAGAMENTOS_ini(void){
  
  INI_INHIBIT_UCA1();
  INI_INHIBIT_P70();
  
  PINSEL4_bit.P2_12 = 1;
  EXTMODE_bit.EXTMODE2 = 1;
  EXTPOLAR_bit.EXTPOLAR2 = 1;    
  SETENA0_bit.SETENA20 = 1;   
  
  PINSEL4_bit.P2_13 = 1;
  EXTMODE_bit.EXTMODE3 = 1;
  EXTPOLAR_bit.EXTPOLAR3 = 1;    
  SETENA0_bit.SETENA21 = 1;    
  
  SET_INHIBIT_UCA1(1);
  SET_INHIBIT_P70(1);
  vSemaphoreCreateBinary(PAGAMENTOS_semaforo_pagamentos);
  
  PARAMETROS_le(ADR_VALOR_PULSO_MOEDEIRO,(void*)&PAGAMENTOS_incremento_uca);
  PARAMETROS_le(ADR_VALOR_PULSO_NOTEIRO,(void*)&PAGAMENTOS_incremento_p70);

  if(PAGAMENTOS_incremento_uca>1000)
    PAGAMENTOS_incremento_uca=1000;
  
  if(PAGAMENTOS_incremento_p70>100000)
  PAGAMENTOS_incremento_p70=100000;
   
}
/***********************************************************************************
*       Descrição       :       Tick de timer para o módulo pagamentos
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PAGAMENTOS_timer_tick(void){
  
  if(PAGAMENTOS_filtro_uca)
    PAGAMENTOS_filtro_uca--;
  
  if(PAGAMENTOS_filtro_p70)
    PAGAMENTOS_filtro_p70--;
}
/***********************************************************************************
*       Descrição       :       Função principal do módulo
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PAGAMENTOS_main(void*pPar){
  unsigned int acumulado;
  
  SMDB_ini();  
  vTaskDelay(3000);
  
  for(;;){    
    
    SMDB_tick();    
    acumulado = BV20_get_valor_acumulador();
    if(acumulado){
      PAGAMENTOS_adiciona_valores(acumulado*100);
      BV20_subtrai_valor_acumulado(acumulado);
    }
        
    vTaskDelay(10);
  }  
}
/***********************************************************************************
*       Descrição       :       Irq para o moedeiro UCA1
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PAGAMENTOS_irq_uca_1(void){
  
  // Timer para gerar um
  // filtro de limita a frequência máxima
  // dos pulsos
  if(!PAGAMENTOS_filtro_uca){
    
    PAGAMENTOS_valor_acumulado_uca+=PAGAMENTOS_incremento_uca;  
    PAGAMENTOS_filtro_uca = RELOAD_FILTRO_UCA;
  }
  
  EXTINT_bit.EINT2 = 1;
  CLRPEND0_bit.CLRPEND20 = 1;  
}
/***********************************************************************************
*       Descrição       :       Valor acumulado no totalizado do UCA1
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
unsigned short int PAGAMENTOS_get_contagem_uca1(void){
  
  return PAGAMENTOS_valor_acumulado_uca;
}
/***********************************************************************************
*       Descrição       :       Subtraí um valor do acumulado no UCA1
*       Parametros      :       (unsigned short int) valor que será
*                                                    subtraido
*       Retorno         :       nenhum
***********************************************************************************/
void PAGAMENTOS_subtrai_contagem_uca1(unsigned short int contagem){
  
  if(contagem>=PAGAMENTOS_valor_acumulado_uca)
    PAGAMENTOS_valor_acumulado_uca-=contagem;
  else
    PAGAMENTOS_valor_acumulado_uca = 0;
}
/***********************************************************************************
*       Descrição       :       Liga o bloqueio do UCA1
*       Parametros      :       (unsigned char) flag 
*       Retorno         :       nenhum
***********************************************************************************/
void PAGAMENTOS_bloqueia_uca1(unsigned char flag){
  
  SET_INHIBIT_UCA1(flag);
}
/***********************************************************************************
*       Descrição       :       IRQ do noteiro P70
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void PAGAMENTOS_irq_p70(void){
  
  if(!PAGAMENTOS_bloqueio_p70 && !PAGAMENTOS_filtro_p70){
    PAGAMENTOS_valor_acumulado_p70+=PAGAMENTOS_incremento_p70;
    PAGAMENTOS_filtro_p70 = RELOAD_FILTRO_UCA;
  }  
  
  EXTINT_bit.EINT3 = 1;
  CLRPEND0_bit.CLRPEND21 = 1;  
}
/***********************************************************************************
*       Descrição       :       Setter para o inhibit do noteiro P70
*       Parametros      :       (unsigned char) inhibit
*       Retorno         :       nenhum
***********************************************************************************/
void PAGAMENTOS_set_inhibit_p70(unsigned char flag){
  
  SET_INHIBIT_P70(flag);
}
/***********************************************************************************
*       Descrição       :       Getter para a contagem do P70
*       Parametros      :       nenhum
*       Retorno         :       (unsigned short int) contagem do acumulador
*                               de valores do P70
***********************************************************************************/
unsigned short int PAGAMENTOS_get_contagem_p70(void){
  
  return PAGAMENTOS_valor_acumulado_p70;
}
/***********************************************************************************
*       Descrição       :       Subtrai um valor da contagem do P70
*       Parametros      :       (unsigned short int) valor
*       Retorno         :       nenhum
***********************************************************************************/
void PAGAMENTOS_subtrai_contagem_p70(unsigned short int contagem){
  
  if(contagem>PAGAMENTOS_valor_acumulado_p70)
    PAGAMENTOS_valor_acumulado_p70 -= contagem;
  else
    PAGAMENTOS_valor_acumulado_p70 = 0;    
}
/***********************************************************************************
*       Descrição       :       Adiciona valores ao acumulador de dinheiro
*       Parametros      :       (unsigned short int) valor
*       Retorno         :       nenhum
***********************************************************************************/
void PAGAMENTOS_adiciona_valores(unsigned short int valor){
  
   while(!xSemaphoreTake(PAGAMENTOS_semaforo_pagamentos,portTICK_RATE_MS*1));     
   
   PAGAMENTOS_valor_acumulado_geral+=valor;
   PAGAMENTOS_timeout_pagamento = RELOAD_TIMEOUT_PAGAMENTO;
   
   xSemaphoreGive(PAGAMENTOS_semaforo_pagamentos);   
}
/***********************************************************************************
*       Descrição       :       Getter para o acumulador de dinheiro
*       Parametros      :       (nenhum)
*       Retorno         :       (int) valor acumulado em moeda
***********************************************************************************/
int PAGAMENTOS_get_valor_acumulado(void){
   int valor;
   
   while(!xSemaphoreTake(PAGAMENTOS_semaforo_pagamentos,portTICK_RATE_MS*1));     
   
   //Hoock para ler o UCA1
   if(PAGAMENTOS_valor_acumulado_p70){
     
     unsigned int fat_cartao_par;     
     unsigned int fat_cartao_tot;
     unsigned int temp = PAGAMENTOS_valor_acumulado_p70;
     
     PARAMETROS_le(ADR_CARTAO_PARCIAL,(void*)&fat_cartao_par);
     PARAMETROS_le(ADR_CARTAO_TOTAL,(void*)&fat_cartao_tot);
     
     fat_cartao_par+=temp;
     fat_cartao_tot+=temp;
     
     PARAMETROS_grava(ADR_CARTAO_PARCIAL,(void*)&fat_cartao_par);
     PARAMETROS_grava(ADR_CARTAO_TOTAL,(void*)&fat_cartao_tot);
     
     valor+= PAGAMENTOS_valor_acumulado_p70;   
     PAGAMENTOS_valor_acumulado_geral+=temp;
     PAGAMENTOS_valor_acumulado_p70 -= temp; // É concorrente!
   }
   
   valor = PAGAMENTOS_valor_acumulado_geral;   
   valor+= PAGAMENTOS_valor_acumulado_uca;   
   PAGAMENTOS_valor_acumulado_uca = 0;   
   
   xSemaphoreGive(PAGAMENTOS_semaforo_pagamentos);     
   
   return valor;  
}
/***********************************************************************************
*       Descrição       :       Subtrai valores do acumulador de moeda
*       Parametros      :       (usigned int) valor
*       Retorno         :       nenhum
***********************************************************************************/
void PAGAMENTOS_subtrai_valores(unsigned int valor){
  
   while(!xSemaphoreTake(PAGAMENTOS_semaforo_pagamentos,portTICK_RATE_MS*1));     
   
   if(PAGAMENTOS_valor_acumulado_geral>=valor)
     PAGAMENTOS_valor_acumulado_geral-=valor;
   else
     PAGAMENTOS_valor_acumulado_geral = 0;
   
   if(PAGAMENTOS_valor_acumulado_geral<0)
     PAGAMENTOS_valor_acumulado_geral = 0;
   
   xSemaphoreGive(PAGAMENTOS_semaforo_pagamentos);      
}
/***********************************************************************************
*       Descrição       :       Setter para o acumulador de dinheiro
*       Parametros      :       (int valor)
*       Retorno         :       nenhum
***********************************************************************************/
void PAGAMENTOS_set_valores(int valor){
  
   while(!xSemaphoreTake(PAGAMENTOS_semaforo_pagamentos,portTICK_RATE_MS*1));     
   
   PAGAMENTOS_valor_acumulado_geral = valor;
   
   xSemaphoreGive(PAGAMENTOS_semaforo_pagamentos);   
}
/***********************************************************************************
*       Descrição       :       Setter para o bloqueio dos meios de 
*                               pagamento
*       Parametros      :       (unsigned char) maior do que zero indica
*                               que os meios de pagamento serão bloqueados
*       Retorno         :       nenhum
***********************************************************************************/
void PAGAMENTOS_set_bloqueio(unsigned char flag){
  
  PAGAMENTOS_bloqueio_p70 = flag;
  PAGAMENTOS_bloqueia_uca1(flag);
  PAGAMENTOS_set_inhibit_p70(flag);
  SMDBILL_set_bloqueio(flag);
  SMDBCOIN_set_flag_bloqueio(flag);
  BV20_setter_bloqueio(flag);
}
/***********************************************************************************
*       Descrição       :       Getter para o contador que indica que
*                               não há interação com o meio de pagamento
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) contagem do contador
***********************************************************************************/
unsigned int PAGAMENTOS_get_timeout_pagamento(void){
  
  return PAGAMENTOS_timeout_pagamento;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/