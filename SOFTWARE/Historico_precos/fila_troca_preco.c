/*__________________________________________________________________________________
|	Quark Tecnologia Eletrônica 
|       
|       Porto Belo
| __________________________________________________________________________________
|
|       This source code was developed by Dextro and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Dextro
|       or its distributors.
|
|       Este código é propriedade da Dextro e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|      Dextro ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  flash_queue.c
|       Descrição          :  Funções para implementação da fila
|                             de eventos na memória de massa
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  15/06/2017
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
#include "flash_queue.h"

/***********************************************************************************
*       Definições
***********************************************************************************/


/***********************************************************************************
*       Estruturas
***********************************************************************************/
typedef struct{
  unsigned short int novo_preco;
  unsigned short int preco_antigo;
  unsigned char hora,minuto,segundo,dia,mes;
  unsigned  int ano;  
}sTROCA_PRECO;

/***********************************************************************************
*       Constantes
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais]
**********************************************************************************/
sFlashQueueData FTP_fila_troca_preco={
  .inicio_flash = AREA_TABELA,
  .posicoes = 10,
  .tamanhoBloco = sizeof(sTROCA_PRECO)  
};

/***********************************************************************************
*       Funções locais
***********************************************************************************/


/***********************************************************************************
*       Tabelas de funções
***********************************************************************************/

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Insere um novo evento de troca de preço
*                               na fila
*       Parametros      :       (unsigned short int) novo preço
*                               (unsigned short int) preço anterior
*                               (unsigned char ) hora
*                               (unsigned char) minuto
*                               (unsigned char) segundo
*                               (unsigned char) dia
*                               (unsigned char) mes
*                               (unsigned short int) ano
*       Retorno         :       nenhum
***********************************************************************************/
void FTP_novo_preco(unsigned short int novo_preco,unsigned short int preco_antigo){  
  sTROCA_PRECO dados;
                      
  dados.novo_preco = novo_preco;
  dados.preco_antigo = preco_antigo;
  
  //Carrega o horário da alteração
  RTC_getValue(&dados.hora,&dados.minuto,&dados.segundo,&dados.dia,&dados.mes,&dados.ano);  
  
  //unsigned char FLASHQUEUE_append(sFlashQueueData* queue,void *pData)
  FLASHQUEUE_append(&FTP_fila_troca_preco,(void*)&dados);                      
}
/***********************************************************************************
*       Descrição       :       Verifica quantos novos eventos de troca
*                               preço existem na fila de eventos
*       Parametros      :       nenhum
*       Retorno         :       (usnigned short int) quantidade de novos
*                                                    eventos
***********************************************************************************/
unsigned short int FTP_get_quantidade_novas_trocas(void){
  
  return FLASHQUEUE_getSize(&FTP_fila_troca_preco);
}
/***********************************************************************************
*       Descrição       :       Verifiac quantos eventos existem ao total na fila
*       Parametros      :       nenhum
*       Retorno         :       (unsigned short int) quantidade total de eventos
***********************************************************************************/
unsigned short int FTP_get_quantidade_historico_trocas(void){
    
  return FLASHQUEUE_getRealSize(&FTP_fila_troca_preco);
}
/***********************************************************************************
*       Descrição       :       Lê um evento na fila de eventos
*       Parametros      :       (unsigned short int) indice do evento
*                               (unsigned short int*) preço
*                               (unsigned short int*) preço antigo
*                               (unsigned char) hora
*                               (unsigned char) minuto
*                               (unsigned char) segundo
*                               (unsigned char) dia
*                               (unsigned char) mês
*                               (unsigned short int) ano
*       Retorno         :       (unsigned char) maior do que zero se existir
*                                               evento com este indice
***********************************************************************************/
unsigned char FTP_get_troca(unsigned short int indice,unsigned short int *novo_preco,unsigned short int *preco_antigo,
                            unsigned char *hora,unsigned char *minuto,unsigned char *segundo,
                            unsigned char *dia,unsigned char *mes,unsigned int *ano){
  sTROCA_PRECO dados;
  unsigned char flag;
  
  flag = FLASHQUEUE_readFromLast(&FTP_fila_troca_preco,indice,(void*)&dados);
              
  *novo_preco = dados.novo_preco;
  *preco_antigo = dados.preco_antigo;
  *hora = dados.hora;
  *minuto = dados.minuto;
  *segundo = dados.segundo;
  *dia = dados.dia;
  *mes = dados.mes;
  *ano = dados.ano;
  
  return flag;                     
}
/***********************************************************************************
*       Descrição       :       Reconhece os novos eventos, como efeito o 
*                               indice é atualizado para retornar zero em novos eventos
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void FTP_ack_novos_eventos(void){
    
  FLASHQUEUE_ajustaPonteiro(&FTP_fila_troca_preco,FTP_get_quantidade_novas_trocas());
}
/***********************************************************************************
*       Descrição       :       Formata os dados da fila de eventos de troca
*                               de preço
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void FTP_formata_fila(void){
    
  FLASHQUEUE_formata(&FTP_fila_troca_preco);
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/