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
|       Arquivo            :  Relatorio.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  30/05/2017
|
|       Revisões           :  001
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
#include "..\includes.h"
#include "relatorio.h"
#include "relatorio_ptbr.h"

/***********************************************************************************
*       Definições
***********************************************************************************/
#define LINHA_TROCA_PRECO               "  [Troca de preco]\n\r"

/***********************************************************************************
*       Constantes
***********************************************************************************/


/***********************************************************************************
*       Variaveis
***********************************************************************************/


/***********************************************************************************
*       Funções
***********************************************************************************/
void RELATORIO_eventos_troca_preco(void);

/***********************************************************************************
*       Implementação 
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       ponto de entrada do emissor do relatório
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void RELATORIO_entry(void){
  unsigned int numero_serie;
  unsigned int arrecadacao_parcial;
  unsigned int arrecadacao_total;
  unsigned int unidades_parcial;
  unsigned int unidades_total;
  unsigned int cartao_parcial;
  unsigned int cartao_total;
  unsigned char hora,minuto,segundo,dia,mes;
  unsigned int ano;
  unsigned int comissao_ponto;
  unsigned int faturamento_ponto;  
  unsigned int valor;
  char buffer_linha[64];
  unsigned int preparacao_teste;
  
  RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
  PARAMETROS_le(ADR_NUMERO_SERIE,             (void*)&numero_serie);  
  PARAMETROS_le(ADR_CONTAGEM_UNIDADES_PARCIAL,(void*)&unidades_parcial);
  PARAMETROS_le(ADR_CONTAGEM_UNIDADES_TOTAL,  (void*)&unidades_total);
  PARAMETROS_le(ADR_MOEDA_PARCIAL,            (void*)&arrecadacao_parcial);
  PARAMETROS_le(ADR_MOEDA_TOTAL,              (void*)&arrecadacao_total);
  PARAMETROS_le(ADR_CARTAO_PARCIAL,           (void*)&cartao_parcial);
  PARAMETROS_le(ADR_CARTAO_TOTAL,             (void*)&cartao_total); 
  PARAMETROS_le(ADR_COMISSAO_PONTO,           (void*)&comissao_ponto);
  PARAMETROS_le(ADR_VALOR_PIPOCA,             (void*)&valor);
  PARAMETROS_le(ADR_CONTADOR_PIPOCAS_TESTE,   (void*)&preparacao_teste);  
    
  faturamento_ponto = comissao_ponto * arrecadacao_parcial;
  faturamento_ponto/= 100;
  
  // Linha 01
  sprintf(buffer_linha,REL_PT_BR_01);
  IMPRESSORA_envia_linha(buffer_linha);
  // Linha 02
  sprintf(buffer_linha,REL_PT_BR_02);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 03
  sprintf(buffer_linha,REL_PT_BR_03);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 04
  sprintf(buffer_linha,REL_PT_BR_04);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 05
  sprintf(buffer_linha,REL_PT_BR_05);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 06
  sprintf(buffer_linha,REL_PT_BR_06);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 07
  sprintf(buffer_linha,REL_PT_BR_07);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 08
  sprintf(buffer_linha,REL_PT_BR_08);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 09
  sprintf(buffer_linha,REL_PT_BR_09);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 10
  sprintf(buffer_linha,REL_PT_BR_10);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 11
  sprintf(buffer_linha,REL_PT_BR_11);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 12
  sprintf(buffer_linha,REL_PT_BR_12);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 13
  sprintf(buffer_linha,REL_PT_BR_13);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 14
  sprintf(buffer_linha,REL_PT_BR_14);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 15
  sprintf(buffer_linha,REL_PT_BR_15);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 16
  sprintf(buffer_linha,REL_PT_BR_16);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 17
  sprintf(buffer_linha,REL_PT_BR_17);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 18
  sprintf(buffer_linha,REL_PT_BR_18);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 19
  sprintf(buffer_linha,REL_PT_BR_19);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 20
  sprintf(buffer_linha,REL_PT_BR_20);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 21
  sprintf(buffer_linha,REL_PT_BR_21);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 22
  sprintf(buffer_linha,REL_PT_BR_22);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 23
  sprintf(buffer_linha,REL_PT_BR_23);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 24
  sprintf(buffer_linha,REL_PT_BR_24);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 25
  sprintf(buffer_linha,REL_PT_BR_25);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 26
  sprintf(buffer_linha,REL_PT_BR_26);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 27
  sprintf(buffer_linha,REL_PT_BR_27);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 28
  sprintf(buffer_linha,REL_PT_BR_28);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 29
  sprintf(buffer_linha,REL_PT_BR_29);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 30
  sprintf(buffer_linha,REL_PT_BR_30);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 31
  sprintf(buffer_linha,REL_PT_BR_31);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 32
  sprintf(buffer_linha,REL_PT_BR_32);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 33
  sprintf(buffer_linha,REL_PT_BR_33);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 34
  sprintf(buffer_linha,REL_PT_BR_34);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 35
  sprintf(buffer_linha,REL_PT_BR_35);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 36
  sprintf(buffer_linha,REL_PT_BR_36);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 37
  sprintf(buffer_linha,REL_PT_BR_37);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 38
  sprintf(buffer_linha,REL_PT_BR_38);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 39
  sprintf(buffer_linha,REL_PT_BR_39);
  IMPRESSORA_envia_linha(buffer_linha);
  
  // Imprime os últimos 10 eventos de troca
  // no preço da pipoca
  RELATORIO_eventos_troca_preco();
  
  // Linha 40
  sprintf(buffer_linha,REL_PT_BR_40);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 41
  sprintf(buffer_linha,REL_PT_BR_41);
  IMPRESSORA_envia_linha(buffer_linha);  
  // Linha 42
  sprintf(buffer_linha,REL_PT_BR_42);
  IMPRESSORA_envia_linha(buffer_linha);    
  // Linha 42
  sprintf(buffer_linha,REL_PT_BR_42);
  IMPRESSORA_envia_linha(buffer_linha);    
  // Linha 43
  sprintf(buffer_linha,REL_PT_BR_43);
  IMPRESSORA_envia_linha(buffer_linha);    
  // Linha 44
  sprintf(buffer_linha,REL_PT_BR_44);
  IMPRESSORA_envia_linha(buffer_linha);    
  // Linha 45
  sprintf(buffer_linha,REL_PT_BR_45);
  IMPRESSORA_envia_linha(buffer_linha);    
  // Linha 46
  sprintf(buffer_linha,REL_PT_BR_46);
  IMPRESSORA_envia_linha(buffer_linha);    
  // Linha 47
  sprintf(buffer_linha,REL_PT_BR_47);
  IMPRESSORA_envia_linha(buffer_linha);    
  // Linha 48
  sprintf(buffer_linha,REL_PT_BR_48);
  IMPRESSORA_envia_linha(buffer_linha);    
  // Linha 49
  sprintf(buffer_linha,REL_PT_BR_49);
  IMPRESSORA_envia_linha(buffer_linha);    
  // Linha 50
  sprintf(buffer_linha,REL_PT_BR_50);
  IMPRESSORA_envia_linha(buffer_linha);    
  // Linha 51
  sprintf(buffer_linha,REL_PT_BR_51);
  IMPRESSORA_envia_linha(buffer_linha);    
  // Linha 52
  sprintf(buffer_linha,REL_PT_BR_52);
  IMPRESSORA_envia_linha(buffer_linha);      
  // Linha 53
  sprintf(buffer_linha,REL_PT_BR_53);
  IMPRESSORA_envia_linha(buffer_linha);        
  // Linha 54
  sprintf(buffer_linha,REL_PT_BR_54);
  IMPRESSORA_envia_linha(buffer_linha);          
  // Linha 55
  sprintf(buffer_linha,REL_PT_BR_55);
  IMPRESSORA_envia_linha(buffer_linha);            
  // Linha 56
  sprintf(buffer_linha,REL_PT_BR_56);
  IMPRESSORA_envia_linha(buffer_linha);              
  // Linha 57
  sprintf(buffer_linha,REL_PT_BR_57);
  IMPRESSORA_envia_linha(buffer_linha);                
  // Linha 58
  sprintf(buffer_linha,REL_PT_BR_58);
  IMPRESSORA_envia_linha(buffer_linha);                  
  // Linha 59
  sprintf(buffer_linha,REL_PT_BR_59);
  IMPRESSORA_envia_linha(buffer_linha);                    
  // Linha 60
  sprintf(buffer_linha,REL_PT_BR_60);
  IMPRESSORA_envia_linha(buffer_linha);                      
}
/***********************************************************************************
*       Descrição       :       Verifica se existem eventos de alteração
*                               no valor da pipoca
*       Parametros      :       nennhum
*       Retorno         :       nenhum
***********************************************************************************/
void RELATORIO_eventos_troca_preco(void){
  unsigned short int eventos;
  unsigned short int novo_preco;
  unsigned short int preco_antigo;
  unsigned char hora,minuto,segundo;
  unsigned char dia,mes;
  unsigned int ano;
  char buffer_linha[40];
  
  eventos = FTP_get_quantidade_novas_trocas();
  if(eventos){
    
    sprintf(buffer_linha,LINHA_TROCA_PRECO);
    IMPRESSORA_envia_linha(buffer_linha);                 
        
    for(unsigned short int i=0,indice=eventos-1;i<eventos;i++,indice--){
      
      FTP_get_troca(indice,&novo_preco,&preco_antigo,&hora,&minuto,&segundo,&dia,&mes,&ano);
      
      sprintf(buffer_linha,"  [%02d de %02d]\n\r",i+1,eventos);
      IMPRESSORA_envia_linha(buffer_linha);    
      
      sprintf(buffer_linha,"   Preco Antigo: R$ %02d,%02d\n\r\n\r",preco_antigo/100,preco_antigo%100);
      IMPRESSORA_envia_linha(buffer_linha);   
      
      sprintf(buffer_linha,"   Novo Preco: R$ %02d,%02d\n\r\n\r",novo_preco/100,novo_preco%100);
      IMPRESSORA_envia_linha(buffer_linha);   
      
      sprintf(buffer_linha,"   Em %02d/%02d/%04d as %02d:%02d:%02d\n\r",dia,mes,ano,hora,minuto,segundo);
      IMPRESSORA_envia_linha(buffer_linha);   
    }
    
    sprintf(buffer_linha,"\n\r\n\r\n\r\n\r\n\r");
    IMPRESSORA_envia_linha(buffer_linha);       
  }      
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
