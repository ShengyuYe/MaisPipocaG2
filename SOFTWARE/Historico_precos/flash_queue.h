/*__________________________________________________________________________________
|	Dextro Soluções Tecnológicas
|       
|       Itajaí
|       www.dextro-st.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Dextro and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Dextro
|       or its distributors.
|
|       Este código é propriedade da Dextro e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Dextro ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  flash_queue.h
|       Data criação       :  25/08/2011
|       Revisões           :  1.0.0.0
|
| __________________________________________________________________________________
*/

#ifndef _FLASH_QUEUE_H_
#define	_FLASH_QUEUE_H_



typedef struct{
  unsigned short int indiceBlocoInserido;
  unsigned short int indiceBlocoLido;
  unsigned short int quantidadeBlocoFila;
  unsigned short int quantidadeNovosBlocos;
  
  unsigned short int checksum;
}sFlashQueueControl;


typedef struct{
  unsigned int inicio_flash;
  unsigned short int posicoes;
  unsigned char tamanhoBloco; 
  sFlashQueueControl controleFlash[2];
}sFlashQueueData;

unsigned char FLASHQUEUE_append(sFlashQueueData* queue,void *pData);

unsigned char FLASHQUEUE_readFromFirst(sFlashQueueData* queue,unsigned short int offset,
                                       void *pData);

unsigned char FLASHQUEUE_readFromLast(sFlashQueueData *queue,unsigned short int offSet,
                                      void *pData);

unsigned char FLASHQUEUE_ajustaPonteiro(sFlashQueueData* queue,unsigned short int offset);

unsigned char FLASHQUEUE_formata(sFlashQueueData *queue);

unsigned short int FLASHQUEUE_getSize(sFlashQueueData *queue);

unsigned char FLASHQUEUE_checksum(unsigned char *buffer,unsigned short int size);

unsigned short int FLASHQUEUE_getSize(sFlashQueueData *queue);

unsigned short int FLASHQUEUE_getRealSize(sFlashQueueData *queue);

/***********************************************************************************
*		Fim do arquivo
***********************************************************************************/
#endif // _FILE_NAME_H