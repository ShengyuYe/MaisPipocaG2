/*__________________________________________________________________________________
|	Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Blumenau - SC
|       www.chavedigital.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Chave Digital and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Chave Digital
|       or its distributors.
|
|       Este código é propriedade da Chave Digital e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Chave Digital ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :
|       Descrição          :
| 
|       Autor              :
|       Data criação       :
|
|       Revisões           :
|
|
| __________________________________________________________________________________
*/
/********************************************************************************
*     Includes
********************************************************************************/
#include <stdlib.h>
#define MPU_WRAPPERS_INCLUDED_FROM_API_FILE
  #include "..\..\include\FreeRTOS.h"
  #include "..\..\include\task.h"
#undef MPU_WRAPPERS_INCLUDED_FROM_API_FILE
/********************************************************************************
*   Variaveis locais
********************************************************************************/
union xRTOS_HEAP {
  volatile portDOUBLE dDummy;
  unsigned char ucHeap[ configTOTAL_HEAP_SIZE ];
} xHeap;

typedef struct A_BLOCK_LINK {
  struct A_BLOCK_LINK *pxNextFreeBlock;	
  size_t xBlockSize;			
} xBlockLink;

const unsigned short  heapSTRUCT_SIZE	= ( sizeof( xBlockLink ) + portBYTE_ALIGNMENT - ( sizeof( xBlockLink ) % portBYTE_ALIGNMENT ) );

#define heapMINIMUM_BLOCK_SIZE	( ( size_t ) ( heapSTRUCT_SIZE * 2 ) )

xBlockLink xStart, xEnd;
size_t xFreeBytesRemaining = configTOTAL_HEAP_SIZE;
/********************************************************************************
*   Macros
********************************************************************************/
#define prvInsertBlockIntoFreeList( pxBlockToInsert )								\
{																					\
xBlockLink *pxIterator;																\
size_t xBlockSize;																	\
																					\
	xBlockSize = pxBlockToInsert->xBlockSize;										\
	for( pxIterator = &xStart; pxIterator->pxNextFreeBlock->xBlockSize < xBlockSize; pxIterator = pxIterator->pxNextFreeBlock )	\
	{																				\
	}																				\
	pxBlockToInsert->pxNextFreeBlock = pxIterator->pxNextFreeBlock;					\
	pxIterator->pxNextFreeBlock = pxBlockToInsert;									\
}

#define prvHeapInit()																\
{																					\
xBlockLink *pxFirstFreeBlock;														\
																					\
	xStart.pxNextFreeBlock = ( void * ) xHeap.ucHeap;								\
	xStart.xBlockSize = ( size_t ) 0;												\
	xEnd.xBlockSize = configTOTAL_HEAP_SIZE;										\
	xEnd.pxNextFreeBlock = NULL;													\
	pxFirstFreeBlock = ( void * ) xHeap.ucHeap;										\
	pxFirstFreeBlock->xBlockSize = configTOTAL_HEAP_SIZE;							\
	pxFirstFreeBlock->pxNextFreeBlock = &xEnd;										\
}
/********************************************************************************
*   Descrição     :   Aloca memória no heap virtual
*   Parametros    :   nenhum
*   Retorno       :   nenhum
********************************************************************************/
void *pvPortMalloc( size_t xWantedSize ){
  xBlockLink *pxBlock, *pxPreviousBlock, *pxNewBlockLink;
  static portBASE_TYPE xHeapHasBeenInitialised = pdFALSE;
  void *pvReturn = NULL;

	vTaskSuspendAll();
	{
		if( xHeapHasBeenInitialised == pdFALSE )
		{
			prvHeapInit();
			xHeapHasBeenInitialised = pdTRUE;
		}
		if( xWantedSize > 0 )
		{
			xWantedSize += heapSTRUCT_SIZE;

			if( xWantedSize & portBYTE_ALIGNMENT_MASK )
			{
				xWantedSize += ( portBYTE_ALIGNMENT - ( xWantedSize & portBYTE_ALIGNMENT_MASK ) );
			}
		}

		if( ( xWantedSize > 0 ) && ( xWantedSize < configTOTAL_HEAP_SIZE ) )
		{
			pxPreviousBlock = &xStart;
			pxBlock = xStart.pxNextFreeBlock;
			while( ( pxBlock->xBlockSize < xWantedSize ) && ( pxBlock->pxNextFreeBlock ) )
			{
				pxPreviousBlock = pxBlock;
				pxBlock = pxBlock->pxNextFreeBlock;
			}

			if( pxBlock != &xEnd )
			{
				pvReturn = ( void * ) ( ( ( unsigned char * ) pxPreviousBlock->pxNextFreeBlock ) + heapSTRUCT_SIZE );

				pxPreviousBlock->pxNextFreeBlock = pxBlock->pxNextFreeBlock;

				if( ( pxBlock->xBlockSize - xWantedSize ) > heapMINIMUM_BLOCK_SIZE )
				{
					pxNewBlockLink = ( void * ) ( ( ( unsigned char * ) pxBlock ) + xWantedSize );
					pxNewBlockLink->xBlockSize = pxBlock->xBlockSize - xWantedSize;
					pxBlock->xBlockSize = xWantedSize;
					prvInsertBlockIntoFreeList( ( pxNewBlockLink ) );
				}
				
				xFreeBytesRemaining -= pxBlock->xBlockSize;
			}
		}
	}
	xTaskResumeAll();
	return pvReturn;
}
/********************************************************************************
*   Descrição       :   Libera memória do heap virtual
*   Parametros      :   nenhum
*   Retorno         :   nenhum
********************************************************************************/
void vPortFree( void *pv ){
  unsigned char *puc = ( unsigned char * ) pv;
  xBlockLink *pxLink;

  if( pv ){
    puc -= heapSTRUCT_SIZE;
    pxLink = ( void * ) puc;

    vTaskSuspendAll();
    {
      prvInsertBlockIntoFreeList( ( ( xBlockLink * ) pxLink ) );
      xFreeBytesRemaining += pxLink->xBlockSize;
    }
    xTaskResumeAll();
   }
}
/********************************************************************************
*     Descrição     :   Verifica a disponibilidade de memória no heap
*     Parametros    :   nenhum
*     Retorno       :   nenhum
********************************************************************************/
size_t xPortGetFreeHeapSize( void ){
  
    return xFreeBytesRemaining;
}
/********************************************************************************
*     Descrição     :   Inicializa o heap
*     Parametros    :   nenhum
*     Retorno       :   nenhum
********************************************************************************/
void vPortInitialiseBlocks( void ){
  
	
}
/********************************************************************************
*     Fim do arquivo
********************************************************************************/
