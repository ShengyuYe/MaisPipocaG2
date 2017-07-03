/*__________________________________________________________________________________
|	Quark Tecnologia Eletr�nica Embarcada
|       
|       Itapema - SC
|       www.quarktee.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Quark  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Quark 
|       or its distributors.
|
|       Este c�digo � propriedade da Quark  e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Quark  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  log_operacoes_falhas.c
|       Descri��o          :  fila com os eventos ocorridos no sistema
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  02/10/2012
|
|       Revis�es           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/
/***********************************************************************************
*       Includes
***********************************************************************************/
#define MPU_WRAPPERS_INCLUDED_FROM_API_FILE

#include "FreeRTOS.h"
#include "task.h"

#undef MPU_WRAPPERS_INCLUDED_FROM_API_FILE

/***********************************************************************************
*       Estrutura
***********************************************************************************/
/* Allocate the memory for the heap.  The struct is used to force byte
alignment without using any non-portable code. */
static union xRTOS_HEAP
{
	#if portBYTE_ALIGNMENT == 8
		volatile portDOUBLE dDummy;
	#else
		volatile unsigned long ulDummy;
	#endif	
	unsigned char ucHeap[ configTOTAL_HEAP_SIZE ];
} xHeap;

static size_t xNextFreeByte = ( size_t ) 0;

/***********************************************************************************
*       Descri��o       :       Aloca um bloco de mem�ria no
*                               vetor do "heap" 
*       Parametros      :       (size_t) tamanho do bloco
*       Retorno         :       (void*) ponteiro para o bloco
***********************************************************************************/
void *pvPortMalloc( size_t xWantedSize )
{
void *pvReturn = NULL; 

	/* Ensure that blocks are always aligned to the required number of bytes. */
	#if portBYTE_ALIGNMENT != 1
		if( xWantedSize & portBYTE_ALIGNMENT_MASK )
		{
			/* Byte alignment required. */
			xWantedSize += ( portBYTE_ALIGNMENT - ( xWantedSize & portBYTE_ALIGNMENT_MASK ) );
		}
	#endif

	vTaskSuspendAll();
	{
		/* Check there is enough room left for the allocation. */
		if( ( ( xNextFreeByte + xWantedSize ) < configTOTAL_HEAP_SIZE ) &&
			( ( xNextFreeByte + xWantedSize ) > xNextFreeByte )	)/* Check for overflow. */
		{
			/* Return the next free byte then increment the index past this
			block. */
			pvReturn = &( xHeap.ucHeap[ xNextFreeByte ] );
			xNextFreeByte += xWantedSize;			
		}	
	}
	xTaskResumeAll();
	
	#if( configUSE_MALLOC_FAILED_HOOK == 1 )
	{
		if( pvReturn == NULL )
		{
			extern void vApplicationMallocFailedHook( void );
			vApplicationMallocFailedHook();
		}
	}
	#endif	

	return pvReturn;
}
/***********************************************************************************
*       Descri��o       :       Libera um bloco de mem�ria
*       Parametros      :       n�o implementado nessa vers�o
*
***********************************************************************************/
void vPortFree( void *pv )
{
	/* Memory cannot be freed using this scheme.  See heap_2.c and heap_3.c 
	for alternative implementations, and the memory management pages of 
	http://www.FreeRTOS.org for more information. */
	( void ) pv;
}
/***********************************************************************************
*       
***********************************************************************************/
void vPortInitialiseBlocks( void )
{
	/* Only required when static memory is not cleared. */
	xNextFreeByte = ( size_t ) 0;
}
/***********************************************************************************
*       Descri��o       :       Verifica quanta mem�ria est� dispon�vel 
*                               no heap do sistema
*       Parametros      :       nenhum
*       Retorno         :       (size_t) quantidade total de posi��es
*                                        dispon�veis para aloca��o
***********************************************************************************/
size_t xPortGetFreeHeapSize( void )
{
	return ( configTOTAL_HEAP_SIZE - xNextFreeByte );
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/



