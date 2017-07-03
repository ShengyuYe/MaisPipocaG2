/*__________________________________________________________________________________
|	DEXTRO SOLUÇÕES TECNOLÓGICAS
|       
|       ITAJAÍ - SC
|       www.dextro.ind.br
| __________________________________________________________________________________
|
|       This source code was developed by DEXTRO  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by DEXTRO 
|       or its distributors.
|
|       Este código é propriedade da DEXTRO  e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       DEXTRO  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  POST.c
|       Descrição          :  Funções que executam o autoteste da máquina
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  25/04/2017
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
#include "..\includes.h"
#include "post.h"

/***********************************************************************************
*       Definições locais
***********************************************************************************/
#define TEMPO_TESTE_MOTOR                       30000
#define TEMPO_TESTE_RESISTENCIA                 60000
/***********************************************************************************
*       Constantes locais
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Funções locais
***********************************************************************************/


/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Ponto de entrada para o Post do sistema
*       Parametros      :       nenhum
*       Retorno         :       (ePOST_RESULT) resultado do POST
***********************************************************************************/
ePOST_RESULT POST_entry(void){
  unsigned int tempo;
  eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();  


  STRING_write_to_internal(CLEAR_DISPLAY,
                          (char*)STRING_mensagem_inicio_autoteste[idioma][0],
                          (char*)STRING_mensagem_inicio_autoteste[idioma][1]);
    
  STRING_write_to_external(CLEAR_DISPLAY,
                           (char*)STRING_mensagem_inicio_autoteste[idioma][0],
                           (char*)STRING_mensagem_inicio_autoteste[idioma][1]);
                               
  POTENCIA_set_neutro(1);
  vTaskDelay(1000);
  POTENCIA_setRPM(5000);
  
  // Teste do motor
  tempo = TEMPO_TESTE_MOTOR;
  while(POTENCIA_getRPMmedido()<1000 && --tempo)
    vTaskDelay(1);
  
  if(!tempo){
    POTENCIA_set_neutro(0);
    POTENCIA_setRPM(0);
    return POST_FALHA_VENTILADOR;
  }
  
  // Teste da resistência
  unsigned int temperatura_inicial=AA_calculaTemperatura();  
  tempo = TEMPO_TESTE_RESISTENCIA;
  CT_set_temperatura(temperatura_inicial+5);
  while(AA_calculaTemperatura()<(temperatura_inicial+3) && --tempo)
    vTaskDelay(1);

  POTENCIA_set_neutro(0);
  POTENCIA_setRPM(0);
  CT_set_temperatura(0);
    
  if(!tempo)
    return POST_FALHA_VENTILADOR;  
  
  // Verifica se existem embalagens
  // no reservatório
  if(EMBALAGEM_verifica_estoque()==EMBALAGEM_SEM_PACOTES)
    return POST_FALHA_PAPEL;  
          
  return POST_SUCESSO;
}
/***********************************************************************************
*       Descrição       :       Faz a verificação cíclica dos componentes
*       Parametros      :       nenhum
*       Retorno         :      ePOST_CICLICO_RESULT
***********************************************************************************/
ePOST_CICLICO_RESULT POST_verificacao_ciclica(void){
  unsigned int temperatura;
  
  if(EMBALAGEM_verifica_estoque()==EMBALAGEM_SEM_PACOTES)
    return POST_CICLICO_FALHA_EMBALAGEM;
  
  temperatura = AA_calculaTemperatura();
  if(!temperatura || temperatura>=500)
    return POST_CICLICO_FALHA_TERMISTOR;
  
  return POST_CICLICO_SUCESSO;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/