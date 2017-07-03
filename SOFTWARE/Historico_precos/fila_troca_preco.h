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
|       Arquivo            :  flash_queue.h
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

#ifndef _FILA_TROCA_PRECO_H_
#define _FILA_TROCA_PRECO_H_


void FTP_novo_preco(unsigned short int novo_preco,unsigned short int preco_antigo);

unsigned short int FTP_get_quantidade_novas_trocas(void);

unsigned short int FTP_get_quantidade_historico_trocas(void);

unsigned char FTP_get_troca(unsigned short int indice,unsigned short int *novo_preco,unsigned short int *preco_antigo,
                            unsigned char *hora,unsigned char *minuto,unsigned char *segundo,
                            unsigned char *dia,unsigned char *mes,unsigned int *ano);

void FTP_ack_novos_eventos(void);

void FTP_formata_fila(void);

#endif//_FILA_TROCA_PRECO_H_