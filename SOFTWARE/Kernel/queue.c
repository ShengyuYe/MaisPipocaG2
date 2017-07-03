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
*   Includes
********************************************************************************/
#include <stdlib.h>
#include <string.h>
#define MPU_WRAPPERS_INCLUDED_FROM_API_FILE
  #include "FreeRTOS.h"
  #include "task.h"
#undef MPU_WRAPPERS_INCLUDED_FROM_API_FILE
/********************************************************************************
*   Definições
********************************************************************************/
#define queueUNLOCKED				( ( signed portBASE_TYPE ) -1 )
#define queueLOCKED_UNMODIFIED			( ( signed portBASE_TYPE ) 0 )
#define queueERRONEOUS_UNBLOCK			( -1 )
#define	queueSEND_TO_BACK			( 0 )
#define	queueSEND_TO_FRONT			( 1 )
#define pxMutexHolder				pcTail
#define uxQueueType				pcHead
#define uxRecursiveCallCount			pcReadFrom
#define queueQUEUE_IS_MUTEX			NULL
#define queueSEMAPHORE_QUEUE_ITEM_LENGTH        ( 0 )
#define queueDONT_BLOCK			        ( ( portTickType ) 0 )
#define queueMUTEX_GIVE_BLOCK_TIME		( ( portTickType ) 0 )
/********************************************************************************
*   Estruturas
********************************************************************************/
typedef struct QueueDefinition{
  signed char *pcHead;
  signed char *pcTail;
  signed char *pcWriteTo;
  signed char *pcReadFrom;
  xList xTasksWaitingToSend;
  xList xTasksWaitingToReceive;
  volatile unsigned portBASE_TYPE uxMessagesWaiting;
  unsigned portBASE_TYPE uxLength;		
  unsigned portBASE_TYPE uxItemSize;		
  signed portBASE_TYPE xRxLock;			
  signed portBASE_TYPE xTxLock;		
} xQUEUE;

typedef xQUEUE * xQueueHandle;

typedef struct QUEUE_REGISTRY_ITEM
{
  signed char *pcQueueName;
  xQueueHandle xHandle;
} xQueueRegistryItem;

/********************************************************************************
*   Funções locais
********************************************************************************/
xQueueHandle xQueueCreate( unsigned portBASE_TYPE uxQueueLength, unsigned portBASE_TYPE uxItemSize ) PRIVILEGED_FUNCTION;
signed portBASE_TYPE xQueueGenericSend( xQueueHandle xQueue, const void * const pvItemToQueue, portTickType xTicksToWait, portBASE_TYPE xCopyPosition ) PRIVILEGED_FUNCTION;
unsigned portBASE_TYPE uxQueueMessagesWaiting( const xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
void vQueueDelete( xQueueHandle xQueue ) PRIVILEGED_FUNCTION;
signed portBASE_TYPE xQueueGenericSendFromISR( xQueueHandle pxQueue, const void * const pvItemToQueue, signed portBASE_TYPE *pxHigherPriorityTaskWoken, portBASE_TYPE xCopyPosition ) PRIVILEGED_FUNCTION;
signed portBASE_TYPE xQueueGenericReceive( xQueueHandle pxQueue, void * const pvBuffer, portTickType xTicksToWait, portBASE_TYPE xJustPeeking ) PRIVILEGED_FUNCTION;
signed portBASE_TYPE xQueueReceiveFromISR( xQueueHandle pxQueue, void * const pvBuffer, signed portBASE_TYPE *pxTaskWoken ) PRIVILEGED_FUNCTION;
xQueueHandle xQueueCreateMutex( void ) PRIVILEGED_FUNCTION;
xQueueHandle xQueueCreateCountingSemaphore( unsigned portBASE_TYPE uxCountValue, unsigned portBASE_TYPE uxInitialCount ) PRIVILEGED_FUNCTION;
portBASE_TYPE xQueueTakeMutexRecursive( xQueueHandle xMutex, portTickType xBlockTime ) PRIVILEGED_FUNCTION;
portBASE_TYPE xQueueGiveMutexRecursive( xQueueHandle xMutex ) PRIVILEGED_FUNCTION;
signed portBASE_TYPE xQueueAltGenericSend( xQueueHandle pxQueue, const void * const pvItemToQueue, portTickType xTicksToWait, portBASE_TYPE xCopyPosition ) PRIVILEGED_FUNCTION;
signed portBASE_TYPE xQueueAltGenericReceive( xQueueHandle pxQueue, void * const pvBuffer, portTickType xTicksToWait, portBASE_TYPE xJustPeeking ) PRIVILEGED_FUNCTION;
signed portBASE_TYPE xQueueIsQueueEmptyFromISR( const xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
signed portBASE_TYPE xQueueIsQueueFullFromISR( const xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
unsigned portBASE_TYPE uxQueueMessagesWaitingFromISR( const xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
void vQueueAddToRegistry( xQueueHandle xQueue, signed char *pcQueueName ) PRIVILEGED_FUNCTION;
static void vQueueUnregisterQueue( xQueueHandle xQueue ) PRIVILEGED_FUNCTION;;
static void prvUnlockQueue( xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
static signed portBASE_TYPE prvIsQueueEmpty( const xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
static signed portBASE_TYPE prvIsQueueFull( const xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
static void prvCopyDataToQueue( xQUEUE *pxQueue, const void *pvItemToQueue, portBASE_TYPE xPosition ) PRIVILEGED_FUNCTION;
static void prvCopyDataFromQueue( xQUEUE * const pxQueue, const void *pvBuffer ) PRIVILEGED_FUNCTION;
xQueueRegistryItem xQueueRegistry[ configQUEUE_REGISTRY_SIZE ];
/********************************************************************************
*   Macros
********************************************************************************/
#define prvLockQueue( pxQueue )							\
{														\
	taskENTER_CRITICAL();								\
	{													\
		if( pxQueue->xRxLock == queueUNLOCKED )			\
		{												\
			pxQueue->xRxLock = queueLOCKED_UNMODIFIED;	\
		}												\
		if( pxQueue->xTxLock == queueUNLOCKED )			\
		{												\
			pxQueue->xTxLock = queueLOCKED_UNMODIFIED;	\
		}												\
	}													\
	taskEXIT_CRITICAL();								\
}
/********************************************************************************
*   Descrição   : 
*   Parametros  : 
*   Retorno     : 
********************************************************************************/
xQueueHandle xQueueCreate( unsigned portBASE_TYPE uxQueueLength, unsigned portBASE_TYPE uxItemSize )
{
  xQUEUE *pxNewQueue;
  size_t xQueueSizeInBytes; 

  if( uxQueueLength > ( unsigned portBASE_TYPE ) 0 )
  {
    pxNewQueue = ( xQUEUE * ) pvPortMalloc( sizeof( xQUEUE ) );
    if( pxNewQueue != NULL )
    {
      xQueueSizeInBytes = ( size_t ) ( uxQueueLength * uxItemSize ) + ( size_t ) 1;
      pxNewQueue->pcHead = ( signed char * ) pvPortMalloc( xQueueSizeInBytes );
      if( pxNewQueue->pcHead != NULL )
      { 
        pxNewQueue->pcTail = pxNewQueue->pcHead + ( uxQueueLength * uxItemSize );
	pxNewQueue->uxMessagesWaiting = 0;
	pxNewQueue->pcWriteTo = pxNewQueue->pcHead;
	pxNewQueue->pcReadFrom = pxNewQueue->pcHead + ( ( uxQueueLength - 1 ) * uxItemSize );
	pxNewQueue->uxLength = uxQueueLength;
	pxNewQueue->uxItemSize = uxItemSize;
	pxNewQueue->xRxLock = queueUNLOCKED;
	pxNewQueue->xTxLock = queueUNLOCKED;

	vListInitialise( &( pxNewQueue->xTasksWaitingToSend ) );
	vListInitialise( &( pxNewQueue->xTasksWaitingToReceive ) );

	traceQUEUE_CREATE( pxNewQueue );
	return  pxNewQueue;
      }
      else
      {
          traceQUEUE_CREATE_FAILED();
	  vPortFree( pxNewQueue );
      } 
    }
  }

  return NULL;
}
/********************************************************************************
*   Descrição     : 
*   Parametros    : 
*   Retorno       : 
********************************************************************************/
xQueueHandle xQueueCreateMutex( void )	{
    xQUEUE *pxNewQueue;

    pxNewQueue = ( xQUEUE * ) pvPortMalloc( sizeof( xQUEUE ) );
    if( pxNewQueue != NULL )
    {
        pxNewQueue->pxMutexHolder = NULL;
	pxNewQueue->uxQueueType = queueQUEUE_IS_MUTEX;

	pxNewQueue->pcWriteTo = NULL;
	pxNewQueue->pcReadFrom = NULL;

	pxNewQueue->uxMessagesWaiting = 0;
	pxNewQueue->uxLength = 1;
	pxNewQueue->uxItemSize = 0;
	pxNewQueue->xRxLock = queueUNLOCKED;
	pxNewQueue->xTxLock = queueUNLOCKED;
        
	vListInitialise( &( pxNewQueue->xTasksWaitingToSend ) );
	vListInitialise( &( pxNewQueue->xTasksWaitingToReceive ) );

	xQueueGenericSend( pxNewQueue, NULL, 0, queueSEND_TO_BACK );

	traceCREATE_MUTEX( pxNewQueue );
    }
    else
    {
	traceCREATE_MUTEX_FAILED();
    }

    return pxNewQueue;
}
/********************************************************************************
*   Descrição     :   
*   Parametros    : 
*   Retorno       : 
********************************************************************************/
portBASE_TYPE xQueueGiveMutexRecursive( xQueueHandle pxMutex )
{
    portBASE_TYPE xReturn;

    if( pxMutex->pxMutexHolder == xTaskGetCurrentTaskHandle() )
    {
	traceGIVE_MUTEX_RECURSIVE( pxMutex );

	( pxMutex->uxRecursiveCallCount )--;
	if( pxMutex->uxRecursiveCallCount == 0 )
	{
	    xQueueGenericSend( pxMutex, NULL, queueMUTEX_GIVE_BLOCK_TIME, queueSEND_TO_BACK );
	}
	xReturn = pdPASS;
    }
    else
    {
	xReturn = pdFAIL;

	traceGIVE_MUTEX_RECURSIVE_FAILED( pxMutex );
    }
    return xReturn;
}
/********************************************************************************
*   Descrição   :
*   Parametros  : 
*   Retorno     : 
********************************************************************************/
portBASE_TYPE xQueueTakeMutexRecursive( xQueueHandle pxMutex, portTickType xBlockTime )
{
    portBASE_TYPE xReturn;

    traceTAKE_MUTEX_RECURSIVE( pxMutex );

    if( pxMutex->pxMutexHolder == xTaskGetCurrentTaskHandle() )
    {
	  ( pxMutex->uxRecursiveCallCount )++;
	    xReturn = pdPASS;
    }
    else
    {
	xReturn = xQueueGenericReceive( pxMutex, NULL, xBlockTime, pdFALSE );

        if( xReturn == pdPASS )
	{
	  ( pxMutex->uxRecursiveCallCount )++;
	}
	else
	{
	  traceTAKE_MUTEX_RECURSIVE_FAILED( pxMutex );
	}
    }

    return xReturn;
}
/********************************************************************************
*   Descrição     :   
*   Parametros    : 
*   Retorno       : 
********************************************************************************/
signed portBASE_TYPE xQueueGenericSend( xQueueHandle pxQueue, const void * const pvItemToQueue, portTickType xTicksToWait, portBASE_TYPE xCopyPosition )
{
  signed portBASE_TYPE xEntryTimeSet = pdFALSE;
  xTimeOutType xTimeOut;

  for( ;; )
  {
      taskENTER_CRITICAL();
      {
	if( pxQueue->uxMessagesWaiting < pxQueue->uxLength )
	{
	    traceQUEUE_SEND( pxQueue );
	    prvCopyDataToQueue( pxQueue, pvItemToQueue, xCopyPosition );

	    if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
	    {
		if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) == pdTRUE )
		{
		    portYIELD_WITHIN_API();
		}
	    }

            taskEXIT_CRITICAL();

	return pdPASS;
   }
    else
    {
	if( xTicksToWait == ( portTickType ) 0 )
	 {
	    taskEXIT_CRITICAL();

	    traceQUEUE_SEND_FAILED( pxQueue );
	    return errQUEUE_FULL;
	  }
	else if( xEntryTimeSet == pdFALSE )
	{
	    vTaskSetTimeOutState( &xTimeOut );
	    xEntryTimeSet = pdTRUE;
	}
    }
  }
  taskEXIT_CRITICAL();

   vTaskSuspendAll();
   prvLockQueue( pxQueue );

    if( xTaskCheckForTimeOut( &xTimeOut, &xTicksToWait ) == pdFALSE )
    {
	if( prvIsQueueFull( pxQueue ) )
	{
	    traceBLOCKING_ON_QUEUE_SEND( pxQueue );
	    vTaskPlaceOnEventList( &( pxQueue->xTasksWaitingToSend ), xTicksToWait );
      	    prvUnlockQueue( pxQueue );
    	    if( !xTaskResumeAll() )
	    {
		portYIELD_WITHIN_API();
	    }
	}
	else
	{
	    prvUnlockQueue( pxQueue );
	    ( void ) xTaskResumeAll();
	}
    }
    else
    {
	prvUnlockQueue( pxQueue );
	( void ) xTaskResumeAll();
        traceQUEUE_SEND_FAILED( pxQueue );
	return errQUEUE_FULL;
    }
  }
}
/********************************************************************************
*     Descrição     : 
*     Parametros    : 
*     Retorno       : 
********************************************************************************/
signed portBASE_TYPE xQueueGenericSendFromISR( xQueueHandle pxQueue, const void * const pvItemToQueue, signed portBASE_TYPE *pxHigherPriorityTaskWoken, portBASE_TYPE xCopyPosition )
{
  signed portBASE_TYPE xReturn;
  unsigned portBASE_TYPE uxSavedInterruptStatus;
  
    uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    {
        if( pxQueue->uxMessagesWaiting < pxQueue->uxLength )
	{
	    traceQUEUE_SEND_FROM_ISR( pxQueue );
	    prvCopyDataToQueue( pxQueue, pvItemToQueue, xCopyPosition );

	    if( pxQueue->xTxLock == queueUNLOCKED )
	    {
		if( !listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) )
		{
      		  if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
		  {
			*pxHigherPriorityTaskWoken = pdTRUE;
		  }
		 }
	    }
    else
    {
	++( pxQueue->xTxLock );
    }

    xReturn = pdPASS;
    }
    else
    {
	traceQUEUE_SEND_FROM_ISR_FAILED( pxQueue );
	xReturn = errQUEUE_FULL;
    }
    }
    portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );

    return xReturn;
}
/********************************************************************************
*   Descrição   : 
*   Parametros  : 
*   Retorno     : 
********************************************************************************/
signed portBASE_TYPE xQueueGenericReceive( xQueueHandle pxQueue, void * const pvBuffer, portTickType xTicksToWait, portBASE_TYPE xJustPeeking )
{
signed portBASE_TYPE xEntryTimeSet = pdFALSE;
xTimeOutType xTimeOut;
signed char *pcOriginalReadPosition;

	for( ;; )
	{
		taskENTER_CRITICAL();
		{
			if( pxQueue->uxMessagesWaiting > ( unsigned portBASE_TYPE ) 0 )
			{
				pcOriginalReadPosition = pxQueue->pcReadFrom;

				prvCopyDataFromQueue( pxQueue, pvBuffer );

				if( xJustPeeking == pdFALSE )
				{
					traceQUEUE_RECEIVE( pxQueue );

					--( pxQueue->uxMessagesWaiting );

					{
						if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
						{
							/* Record the information required to implement
							priority inheritance should it become necessary. */
							pxQueue->pxMutexHolder = xTaskGetCurrentTaskHandle();
						}
					}

					if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) == pdFALSE )
					{
						if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) == pdTRUE )
						{
							portYIELD_WITHIN_API();
						}
					}
				}
				else
				{
					traceQUEUE_PEEK( pxQueue );

					pxQueue->pcReadFrom = pcOriginalReadPosition;

					if( !listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) )
					{
						if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
						{
							portYIELD_WITHIN_API();
						}
					}

				}

				taskEXIT_CRITICAL();
				return pdPASS;
			}
			else
			{
				if( xTicksToWait == ( portTickType ) 0 )
				{
					taskEXIT_CRITICAL();
					traceQUEUE_RECEIVE_FAILED( pxQueue );
					return errQUEUE_EMPTY;
				}
				else if( xEntryTimeSet == pdFALSE )
				{
					vTaskSetTimeOutState( &xTimeOut );
					xEntryTimeSet = pdTRUE;
				}
			}
		}
		taskEXIT_CRITICAL();

		vTaskSuspendAll();
		prvLockQueue( pxQueue );

		if( xTaskCheckForTimeOut( &xTimeOut, &xTicksToWait ) == pdFALSE )
		{
			if( prvIsQueueEmpty( pxQueue ) )
			{
				traceBLOCKING_ON_QUEUE_RECEIVE( pxQueue );

				{
					if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
					{
						portENTER_CRITICAL();
						{
							vTaskPriorityInherit( ( void * ) pxQueue->pxMutexHolder );
						}
						portEXIT_CRITICAL();
					}
				}

				vTaskPlaceOnEventList( &( pxQueue->xTasksWaitingToReceive ), xTicksToWait );
				prvUnlockQueue( pxQueue );
				if( !xTaskResumeAll() )
				{
					portYIELD_WITHIN_API();
				}
			}
			else
			{
				prvUnlockQueue( pxQueue );
				( void ) xTaskResumeAll();
			}
		}
		else
		{
			prvUnlockQueue( pxQueue );
			( void ) xTaskResumeAll();
			traceQUEUE_RECEIVE_FAILED( pxQueue );
			return errQUEUE_EMPTY;
		}
	}
}
/********************************************************************************
*   Descrição     :
*   Parametros    : 
*   Retorno       : 
********************************************************************************/
signed portBASE_TYPE xQueueReceiveFromISR( xQueueHandle pxQueue, void * const pvBuffer, signed portBASE_TYPE *pxTaskWoken )
{
signed portBASE_TYPE xReturn;
unsigned portBASE_TYPE uxSavedInterruptStatus;

	uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
	{
		if( pxQueue->uxMessagesWaiting > ( unsigned portBASE_TYPE ) 0 )
		{
			traceQUEUE_RECEIVE_FROM_ISR( pxQueue );

			prvCopyDataFromQueue( pxQueue, pvBuffer );
			--( pxQueue->uxMessagesWaiting );
			if( pxQueue->xRxLock == queueUNLOCKED )
			{
				if( !listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) )
				{
					if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) != pdFALSE )
					{
						*pxTaskWoken = pdTRUE;
					}
				}
			}
			else
			{
				++( pxQueue->xRxLock );
			}

			xReturn = pdPASS;
		}
		else
		{
			xReturn = pdFAIL;
			traceQUEUE_RECEIVE_FROM_ISR_FAILED( pxQueue );
		}
	}
	portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );

	return xReturn;
}
/********************************************************************************
*     Descrição     :   
*     Parametros    : 
*     Retorno       : 
********************************************************************************/
unsigned portBASE_TYPE uxQueueMessagesWaiting( const xQueueHandle pxQueue )
{
unsigned portBASE_TYPE uxReturn;

	taskENTER_CRITICAL();
		uxReturn = pxQueue->uxMessagesWaiting;
	taskEXIT_CRITICAL();

	return uxReturn;
}
/********************************************************************************
*   Descrição      :  
*   Parametros     :
*   Retorno        :  
********************************************************************************/
unsigned portBASE_TYPE uxQueueMessagesWaitingFromISR( const xQueueHandle pxQueue )
{
unsigned portBASE_TYPE uxReturn;

	uxReturn = pxQueue->uxMessagesWaiting;

	return uxReturn;
}
/********************************************************************************
*   Descrição      :  
*   Parametros     :
*   Retorno        :  
********************************************************************************/
void vQueueDelete( xQueueHandle pxQueue )
{
	traceQUEUE_DELETE( pxQueue );
	vQueueUnregisterQueue( pxQueue );
	vPortFree( pxQueue->pcHead );
	vPortFree( pxQueue );
}
/********************************************************************************
*   Descrição      :  
*   Parametros     :
*   Retorno        :  
********************************************************************************/
static void prvCopyDataToQueue( xQUEUE *pxQueue, const void *pvItemToQueue, portBASE_TYPE xPosition )
{
	if( pxQueue->uxItemSize == ( unsigned portBASE_TYPE ) 0 )
	{
		{
			if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
			{
				vTaskPriorityDisinherit( ( void * ) pxQueue->pxMutexHolder );
				pxQueue->pxMutexHolder = NULL;
			}
		}
	}
	else if( xPosition == queueSEND_TO_BACK )
	{
		memcpy( ( void * ) pxQueue->pcWriteTo, pvItemToQueue, ( unsigned ) pxQueue->uxItemSize );
		pxQueue->pcWriteTo += pxQueue->uxItemSize;
		if( pxQueue->pcWriteTo >= pxQueue->pcTail )
		{
			pxQueue->pcWriteTo = pxQueue->pcHead;
		}
	}
	else
	{
		memcpy( ( void * ) pxQueue->pcReadFrom, pvItemToQueue, ( unsigned ) pxQueue->uxItemSize );
		pxQueue->pcReadFrom -= pxQueue->uxItemSize;
		if( pxQueue->pcReadFrom < pxQueue->pcHead )
		{
			pxQueue->pcReadFrom = ( pxQueue->pcTail - pxQueue->uxItemSize );
		}
	}

	++( pxQueue->uxMessagesWaiting );
}
/********************************************************************************
*   Descrição      :  
*   Parametros     :
*   Retorno        :  
********************************************************************************/
static void prvCopyDataFromQueue( xQUEUE * const pxQueue, const void *pvBuffer )
{
	if( pxQueue->uxQueueType != queueQUEUE_IS_MUTEX )
	{
		pxQueue->pcReadFrom += pxQueue->uxItemSize;
		if( pxQueue->pcReadFrom >= pxQueue->pcTail )
		{
			pxQueue->pcReadFrom = pxQueue->pcHead;
		}
		memcpy( ( void * ) pvBuffer, ( void * ) pxQueue->pcReadFrom, ( unsigned ) pxQueue->uxItemSize );
	}
}
/********************************************************************************
*   Descrição      :  
*   Parametros     :
*   Retorno        :  
********************************************************************************/
static void prvUnlockQueue( xQueueHandle pxQueue )
{
	taskENTER_CRITICAL();
	{
		while( pxQueue->xTxLock > queueLOCKED_UNMODIFIED )
		{
			if( !listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) )
			{
				if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
				{
					vTaskMissedYield();
				}

				--( pxQueue->xTxLock );
			}
			else
			{
				break;
			}
		}

		pxQueue->xTxLock = queueUNLOCKED;
	}
	taskEXIT_CRITICAL();

	taskENTER_CRITICAL();
	{
		while( pxQueue->xRxLock > queueLOCKED_UNMODIFIED )
		{
			if( !listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) )
			{
				if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) != pdFALSE )
				{
					vTaskMissedYield();
				}

				--( pxQueue->xRxLock );
			}
			else
			{
				break;
			}
		}

		pxQueue->xRxLock = queueUNLOCKED;
	}
	taskEXIT_CRITICAL();
}
/********************************************************************************
*   Descrição      :  
*   Parametros     :
*   Retorno        :  
********************************************************************************/
static signed portBASE_TYPE prvIsQueueEmpty( const xQueueHandle pxQueue )
{
signed portBASE_TYPE xReturn;

	taskENTER_CRITICAL();
		xReturn = ( pxQueue->uxMessagesWaiting == ( unsigned portBASE_TYPE ) 0 );
	taskEXIT_CRITICAL();

	return xReturn;
}
/********************************************************************************
*   Descrição      :  
*   Parametros     :
*   Retorno        :  
********************************************************************************/
signed portBASE_TYPE xQueueIsQueueEmptyFromISR( const xQueueHandle pxQueue )
{
signed portBASE_TYPE xReturn;

	xReturn = ( pxQueue->uxMessagesWaiting == ( unsigned portBASE_TYPE ) 0 );

	return xReturn;
}
/********************************************************************************
*   Descrição      :  
*   Parametros     :
*   Retorno        :  
********************************************************************************/
static signed portBASE_TYPE prvIsQueueFull( const xQueueHandle pxQueue )
{
signed portBASE_TYPE xReturn;

	taskENTER_CRITICAL();
		xReturn = ( pxQueue->uxMessagesWaiting == pxQueue->uxLength );
	taskEXIT_CRITICAL();

	return xReturn;
}
/********************************************************************************
*   Descrição      :  
*   Parametros     :
*   Retorno        :  
********************************************************************************/
signed portBASE_TYPE xQueueIsQueueFullFromISR( const xQueueHandle pxQueue )
{
signed portBASE_TYPE xReturn;

	xReturn = ( pxQueue->uxMessagesWaiting == pxQueue->uxLength );

	return xReturn;
}
/********************************************************************************
*   Descrição      :  
*   Parametros     :
*   Retorno        :  
********************************************************************************/
void vQueueAddToRegistry( xQueueHandle xQueue, signed char *pcQueueName )
{
unsigned portBASE_TYPE ux;

    for( ux = 0; ux < configQUEUE_REGISTRY_SIZE; ux++ )
    {
	if( xQueueRegistry[ ux ].pcQueueName == NULL )
	{
	    xQueueRegistry[ ux ].pcQueueName = pcQueueName;
	    xQueueRegistry[ ux ].xHandle = xQueue;
	    break;
	}
    }
}
/********************************************************************************
*   Descrição      :  
*   Parametros     :
*   Retorno        :  
********************************************************************************/
static void vQueueUnregisterQueue( xQueueHandle xQueue )
{
    unsigned portBASE_TYPE ux;

	
    for( ux = 0; ux < configQUEUE_REGISTRY_SIZE; ux++ )
    {
	if( xQueueRegistry[ ux ].xHandle == xQueue )
	{
	    xQueueRegistry[ ux ].pcQueueName = NULL;
	    break;
	}
    }

}
/********************************************************************************
*   Fim do arquivo
********************************************************************************/
