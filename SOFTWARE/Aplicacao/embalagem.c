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
|       Arquivo            :  embalagem.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  22/04/2017
|
|       Revisões           :  001
|
|                             (22/04/2017) - Criação do módulo de controle do dispensador 
|                             da embalagem (Marcos)
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
#include "embalagem.h"
/***********************************************************************************
*       Definições
***********************************************************************************/
#define THRESOLD_NIVEL_PAPEL                    3800

/***********************************************************************************
*       Constantes
***********************************************************************************/


/***********************************************************************************
*       Variaveis 
***********************************************************************************/


/***********************************************************************************
*       Funções
***********************************************************************************/


/***********************************************************************************
*       Tabelas de função
***********************************************************************************/


/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Libera uma embalagem 
*       Parametros      :       nenhum
*       Retorno         :       (eEMBALAGEM_RESULT) resultado da operação
*                                                   de liberação da embalagem
***********************************************************************************/
eEMBALAGEM_RESULT EMBALAGEM_libera_pacote(unsigned int tempo){
  unsigned char automatico = GET_BARREIRA_SAIDA_PAPEL();
  unsigned int timeout=2500;
  
  // Se não houver papel refletindo no sensor
  // nem chega a ligar o motor do dispensador
  if(AA_mediaMovelPapel()>THRESOLD_NIVEL_PAPEL){
    return EMBALAGEM_SEM_ESTOQUE; 
  }
  
  BOARD_set_motor_embalagem(1);
  BOARD_setter_general_purpose_counter(tempo);         
  
  for(;BOARD_getter_general_purpose_counter();){
        
    //if(!GET_BARREIRA_SAIDA_PAPEL()){
    //  vTaskDelay(tempo);
    //  BOARD_set_motor_embalagem(0);
    //  return EMBALAGEM_LIBERADA;
   // }
  }

  while(AA_mediaMovelPapel()>THRESOLD_NIVEL_PAPEL && timeout--)
    vTaskDelay(1);
  
  BOARD_set_motor_embalagem(0);
  
  if(AA_mediaMovelPapel()<THRESOLD_NIVEL_PAPEL)
    return EMBALAGEM_LIBERADA;    
    
  return EMBALAGEM_FALHA_LIBERACAO;
}
/***********************************************************************************
*       Descrição       :       Verifica o estoque de embalagens
*       Parametros      :       nenhum
*       Retorno         :       (eEMBALAGEM_ESTOQUE_RESULT) resultado
*                               da verificação do estoque
***********************************************************************************/
eEMBALAGEM_ESTOQUE_RESULT EMBALAGEM_verifica_estoque(void){
  
  // Se não houver papel refletindo no sensor
  // nem chega a ligar o motor do dispensador
  if(AA_mediaMovelPapel()>THRESOLD_NIVEL_PAPEL){
    return EMBALAGEM_SEM_PACOTES; 
  }
  
  return EMBALAGEM_DETECTADA;
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/