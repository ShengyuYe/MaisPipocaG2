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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MPU_WRAPPERS_INCLUDED_FROM_API_FILE
  #include "FreeRTOS.h"
  #include "task.h"
  #include "StackMacros.h"
#undef MPU_WRAPPERS_INCLUDED_FROM_API_FILE

/********************************************************************************
*   Definições
********************************************************************************/
#define tskIDLE_STACK_SIZE	configMINIMAL_STACK_SIZE
#define tskSTACK_FILL_BYTE	( 0xa5 )
#define tskBLOCKED_CHAR		( ( signed char ) 'B' )
#define tskREADY_CHAR		( ( signed char ) 'R' )
#define tskDELETED_CHAR		( ( signed char ) 'D' )
#define tskSUSPENDED_CHAR	( ( signed char ) 'S' )
#define vWriteTraceToBuffer()

/********************************************************************************
*   Estruturas
********************************************************************************/
typedef struct tskTaskControlBlock
{
	volatile portSTACK_TYPE	*pxTopOfStack;	
	xListItem xGenericListItem;
	xListItem xEventListItem;
	unsigned portBASE_TYPE	uxPriority;
	portSTACK_TYPE *pxStack;
	signed char pcTaskName[ configMAX_TASK_NAME_LEN ];        
	portSTACK_TYPE *pxEndOfStack;	
	unsigned portBASE_TYPE uxCriticalNesting;
	unsigned portBASE_TYPE uxBasePriority;	
} tskTCB;

/********************************************************************************
*   Variaveis locais
********************************************************************************/
tskTCB *  pxCurrentTCB = NULL;
xList pxReadyTasksLists[ configMAX_PRIORITIES ];
xList xDelayedTaskList1;	
xList xDelayedTaskList2;	
xList *  pxDelayedTaskList ;
xList *  pxOverflowDelayedTaskList;
xList xPendingReadyList;			
xList xTasksWaitingTermination;	
unsigned portBASE_TYPE uxTasksDeleted = ( unsigned portBASE_TYPE ) 0;
xList xSuspendedTaskList;
unsigned portBASE_TYPE uxCurrentNumberOfTasks 	= ( unsigned portBASE_TYPE ) 0;
portTickType xTickCount = ( portTickType ) 0;
unsigned portBASE_TYPE uxTopUsedPriority = tskIDLE_PRIORITY;
unsigned portBASE_TYPE uxTopReadyPriority = tskIDLE_PRIORITY;
signed portBASE_TYPE xSchedulerRunning	= pdFALSE;
unsigned portBASE_TYPE uxSchedulerSuspended = ( unsigned portBASE_TYPE ) pdFALSE;
unsigned portBASE_TYPE uxMissedTicks = ( unsigned portBASE_TYPE ) 0;
portBASE_TYPE xMissedYield = ( portBASE_TYPE ) pdFALSE;
portBASE_TYPE xNumOfOverflows = ( portBASE_TYPE ) 0;
unsigned portBASE_TYPE uxTaskNumber = ( unsigned portBASE_TYPE ) 0;

/********************************************************************************
*   Macros
********************************************************************************/
#define prvAddTaskToReadyQueue( pxTCB )																			\
{																												\
	if( pxTCB->uxPriority > uxTopReadyPriority )																\
	{																											\
		uxTopReadyPriority = pxTCB->uxPriority;																	\
	}																											\
	vListInsertEnd( ( xList * ) &( pxReadyTasksLists[ pxTCB->uxPriority ] ), &( pxTCB->xGenericListItem ) );	\
}

#define prvCheckDelayedTasks()																						\
{																													\
register tskTCB *pxTCB;																								\
																													\
	while( ( pxTCB = ( tskTCB * ) listGET_OWNER_OF_HEAD_ENTRY( pxDelayedTaskList ) ) != NULL )						\
	{																												\
		if( xTickCount < listGET_LIST_ITEM_VALUE( &( pxTCB->xGenericListItem ) ) )									\
		{																											\
			break;																									\
		}																											\
		vListRemove( &( pxTCB->xGenericListItem ) );																\
		if( pxTCB->xEventListItem.pvContainer )																		\
		{																											\
			vListRemove( &( pxTCB->xEventListItem ) );																\
		}																											\
		prvAddTaskToReadyQueue( pxTCB );																			\
	}																												\
}

#define prvGetTCBFromHandle( pxHandle ) ( ( pxHandle == NULL ) ? ( tskTCB * ) pxCurrentTCB : ( tskTCB * ) pxHandle )
/********************************************************************************
*   Funções locais
********************************************************************************/
static void prvInitialiseTCBVariables( tskTCB *pxTCB, const signed char * const pcName, unsigned portBASE_TYPE uxPriority, const xMemoryRegion * const xRegions, unsigned short usStackDepth ) PRIVILEGED_FUNCTION;
static void prvInitialiseTaskLists( void ) PRIVILEGED_FUNCTION;
static portTASK_FUNCTION_PROTO( prvIdleTask, pvParameters );
static void prvDeleteTCB( tskTCB *pxTCB ) PRIVILEGED_FUNCTION;
static void prvCheckTasksWaitingTermination( void ) PRIVILEGED_FUNCTION;
static tskTCB *prvAllocateTCBAndStack( unsigned short usStackDepth, portSTACK_TYPE *puxStackBuffer ) PRIVILEGED_FUNCTION;
static unsigned short usTaskCheckFreeStackSpace( const unsigned char * pucStackByte ) PRIVILEGED_FUNCTION;
/********************************************************************************
*   Implementação
********************************************************************************/

/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
signed portBASE_TYPE xTaskGenericCreate( pdTASK_CODE pxTaskCode, const signed char * const pcName, unsigned short usStackDepth, void *pvParameters, unsigned portBASE_TYPE uxPriority, xTaskHandle *pxCreatedTask, portSTACK_TYPE *puxStackBuffer, const xMemoryRegion * const xRegions )
{
signed portBASE_TYPE xReturn;
tskTCB * pxNewTCB;

	pxNewTCB = prvAllocateTCBAndStack( usStackDepth, puxStackBuffer );

	if( pxNewTCB != NULL )
	{
		portSTACK_TYPE *pxTopOfStack;

		#if( portSTACK_GROWTH < 0 )
		{
			pxTopOfStack = pxNewTCB->pxStack + ( usStackDepth - 1 );
			pxTopOfStack = ( portSTACK_TYPE * ) ( ( ( unsigned long ) pxTopOfStack ) & ( ( unsigned long ) ~portBYTE_ALIGNMENT_MASK  ) );
		}
		#else
		{
			pxTopOfStack = pxNewTCB->pxStack;

			/* If we want to use stack checking on architectures that use
			a positive stack growth direction then we also need to store the
			other extreme of the stack space. */
			pxNewTCB->pxEndOfStack = pxNewTCB->pxStack + ( usStackDepth - 1 );
		}
		#endif

		prvInitialiseTCBVariables( pxNewTCB, pcName, uxPriority, xRegions, usStackDepth );

		/* Initialize the TCB stack to look as if the task was already running,
		but had been interrupted by the scheduler.  The return address is set
		to the start of the task function. Once the stack has been initialised
		the	top of stack variable is updated. */
		#if( portUSING_MPU_WRAPPERS == 1 )
		{
			pxNewTCB->pxTopOfStack = pxPortInitialiseStack( pxTopOfStack, pxTaskCode, pvParameters, xRunPrivileged );
		}
		#else
		{
			pxNewTCB->pxTopOfStack = pxPortInitialiseStack( pxTopOfStack, pxTaskCode, pvParameters );
		}
		#endif

		if( ( void * ) pxCreatedTask != NULL )
		{
			/* Pass the TCB out - in an anonymous way.  The calling function/
			task can use this as a handle to delete the task later if
			required.*/
			*pxCreatedTask = ( xTaskHandle ) pxNewTCB;
		}
		
		/* We are going to manipulate the task queues to add this task to a
		ready list, so must make sure no interrupts occur. */
		portENTER_CRITICAL();
		{
			uxCurrentNumberOfTasks++;
			if( pxCurrentTCB == NULL )
			{
				/* There are no other tasks, or all the other tasks are in
				the suspended state - make this the current task. */
				pxCurrentTCB =  pxNewTCB;

				if( uxCurrentNumberOfTasks == ( unsigned portBASE_TYPE ) 1 )
				{
					/* This is the first task to be created so do the preliminary
					initialisation required.  We will not recover if this call
					fails, but we will report the failure. */
					prvInitialiseTaskLists();
				}
			}
			else
			{
				/* If the scheduler is not already running, make this task the
				current task if it is the highest priority task to be created
				so far. */
				if( xSchedulerRunning == pdFALSE )
				{
					if( pxCurrentTCB->uxPriority <= uxPriority )
					{
						pxCurrentTCB = pxNewTCB;
					}
				}
			}

			/* Remember the top priority to make context switching faster.  Use
			the priority in pxNewTCB as this has been capped to a valid value. */
			if( pxNewTCB->uxPriority > uxTopUsedPriority )
			{
				uxTopUsedPriority = pxNewTCB->uxPriority;
			}

			#if ( configUSE_TRACE_FACILITY == 1 )
			{
				/* Add a counter into the TCB for tracing only. */
				pxNewTCB->uxTCBNumber = uxTaskNumber;
			}
			#endif
			uxTaskNumber++;

			prvAddTaskToReadyQueue( pxNewTCB );

			xReturn = pdPASS;
			traceTASK_CREATE( pxNewTCB );
		}
		portEXIT_CRITICAL();
	}
	else
	{
		xReturn = errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY;
		traceTASK_CREATE_FAILED();
	}

	if( xReturn == pdPASS )
	{
		if( xSchedulerRunning != pdFALSE )
		{
			/* If the created task is of a higher priority than the current task
			then it should run now. */
			if( pxCurrentTCB->uxPriority < uxPriority )
			{
				portYIELD_WITHIN_API();
			}
		}
	}

	return xReturn;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
#if ( INCLUDE_vTaskDelete == 1 )

	void vTaskDelete( xTaskHandle pxTaskToDelete )
	{
	tskTCB *pxTCB;

		portENTER_CRITICAL();
		{
			/* Ensure a yield is performed if the current task is being
			deleted. */
			if( pxTaskToDelete == pxCurrentTCB )
			{
				pxTaskToDelete = NULL;
			}

			/* If null is passed in here then we are deleting ourselves. */
			pxTCB = prvGetTCBFromHandle( pxTaskToDelete );

			/* Remove task from the ready list and place in the	termination list.
			This will stop the task from be scheduled.  The idle task will check
			the termination list and free up any memory allocated by the
			scheduler for the TCB and stack. */
			vListRemove( &( pxTCB->xGenericListItem ) );

			/* Is the task waiting on an event also? */
			if( pxTCB->xEventListItem.pvContainer )
			{
				vListRemove( &( pxTCB->xEventListItem ) );
			}

			vListInsertEnd( ( xList * ) &xTasksWaitingTermination, &( pxTCB->xGenericListItem ) );

			/* Increment the ucTasksDeleted variable so the idle task knows
			there is a task that has been deleted and that it should therefore
			check the xTasksWaitingTermination list. */
			++uxTasksDeleted;

			/* Increment the uxTaskNumberVariable also so kernel aware debuggers
			can detect that the task lists need re-generating. */
			uxTaskNumber++;

			traceTASK_DELETE( pxTCB );
		}
		portEXIT_CRITICAL();

		/* Force a reschedule if we have just deleted the current task. */
		if( xSchedulerRunning != pdFALSE )
		{
			if( ( void * ) pxTaskToDelete == NULL )
			{
				portYIELD_WITHIN_API();
			}
		}
	}

#endif
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
#if ( INCLUDE_vTaskDelayUntil == 1 )

	void vTaskDelayUntil( portTickType * const pxPreviousWakeTime, portTickType xTimeIncrement )
	{
	portTickType xTimeToWake;
	portBASE_TYPE xAlreadyYielded, xShouldDelay = pdFALSE;

		vTaskSuspendAll();
		{
			/* Generate the tick time at which the task wants to wake. */
			xTimeToWake = *pxPreviousWakeTime + xTimeIncrement;

			if( xTickCount < *pxPreviousWakeTime )
			{
				/* The tick count has overflowed since this function was
				lasted called.  In this case the only time we should ever
				actually delay is if the wake time has also	overflowed,
				and the wake time is greater than the tick time.  When this
				is the case it is as if neither time had overflowed. */
				if( ( xTimeToWake < *pxPreviousWakeTime ) && ( xTimeToWake > xTickCount ) )
				{
					xShouldDelay = pdTRUE;
				}
			}
			else
			{
				/* The tick time has not overflowed.  In this case we will
				delay if either the wake time has overflowed, and/or the
				tick time is less than the wake time. */
				if( ( xTimeToWake < *pxPreviousWakeTime ) || ( xTimeToWake > xTickCount ) )
				{
					xShouldDelay = pdTRUE;
				}
			}

			/* Update the wake time ready for the next call. */
			*pxPreviousWakeTime = xTimeToWake;

			if( xShouldDelay )
			{
				traceTASK_DELAY_UNTIL();

				/* We must remove ourselves from the ready list before adding
				ourselves to the blocked list as the same list item is used for
				both lists. */
				vListRemove( ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );

				/* The list item will be inserted in wake time order. */
				listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xGenericListItem ), xTimeToWake );

				if( xTimeToWake < xTickCount )
				{
					/* Wake time has overflowed.  Place this item in the
					overflow list. */
					vListInsert( ( xList * ) pxOverflowDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
				}
				else
				{
					/* The wake time has not overflowed, so we can use the
					current block list. */
					vListInsert( ( xList * ) pxDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
				}
			}
		}
		xAlreadyYielded = xTaskResumeAll();

		/* Force a reschedule if xTaskResumeAll has not already done so, we may
		have put ourselves to sleep. */
		if( !xAlreadyYielded )
		{
			portYIELD_WITHIN_API();
		}
	}

#endif
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
#if ( INCLUDE_vTaskDelay == 1 )

	void vTaskDelay( portTickType xTicksToDelay )
	{
	portTickType xTimeToWake;
	signed portBASE_TYPE xAlreadyYielded = pdFALSE;

		/* A delay time of zero just forces a reschedule. */
		if( xTicksToDelay > ( portTickType ) 0 )
		{
			vTaskSuspendAll();
			{
				traceTASK_DELAY();

				/* A task that is removed from the event list while the
				scheduler is suspended will not get placed in the ready
				list or removed from the blocked list until the scheduler
				is resumed.

				This task cannot be in an event list as it is the currently
				executing task. */

				/* Calculate the time to wake - this may overflow but this is
				not a problem. */
				xTimeToWake = xTickCount + xTicksToDelay;

				/* We must remove ourselves from the ready list before adding
				ourselves to the blocked list as the same list item is used for
				both lists. */
				vListRemove( ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );

				/* The list item will be inserted in wake time order. */
				listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xGenericListItem ), xTimeToWake );

				if( xTimeToWake < xTickCount )
				{
					/* Wake time has overflowed.  Place this item in the
					overflow list. */
					vListInsert( ( xList * ) pxOverflowDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
				}
				else
				{
					/* The wake time has not overflowed, so we can use the
					current block list. */
					vListInsert( ( xList * ) pxDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
				}
			}
			xAlreadyYielded = xTaskResumeAll();
		}

		/* Force a reschedule if xTaskResumeAll has not already done so, we may
		have put ourselves to sleep. */
		if( !xAlreadyYielded )
		{
			portYIELD_WITHIN_API();
		}
	}

#endif
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
unsigned portBASE_TYPE uxTaskPriorityGet( xTaskHandle pxTask )
{
	tskTCB *pxTCB;
	unsigned portBASE_TYPE uxReturn;

		portENTER_CRITICAL();
		{
			pxTCB = prvGetTCBFromHandle( pxTask );
			uxReturn = pxTCB->uxPriority;
		}
		portEXIT_CRITICAL();

		return uxReturn;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
void vTaskPrioritySet( xTaskHandle pxTask, unsigned portBASE_TYPE uxNewPriority )
	{
	tskTCB *pxTCB;
	unsigned portBASE_TYPE uxCurrentPriority, xYieldRequired = pdFALSE;

		if( uxNewPriority >= configMAX_PRIORITIES )
		{
			uxNewPriority = configMAX_PRIORITIES - 1;
		}

		portENTER_CRITICAL();
		{
			if( pxTask == pxCurrentTCB )
			{
				pxTask = NULL;
			}
			pxTCB = prvGetTCBFromHandle( pxTask );

			traceTASK_PRIORITY_SET( pxTask, uxNewPriority );
			uxCurrentPriority = pxTCB->uxBasePriority;
			if( uxCurrentPriority != uxNewPriority )
			{
				if( uxNewPriority > uxCurrentPriority )
				{
					if( pxTask != NULL )
					{
						xYieldRequired = pdTRUE;
					}
				}
				else if( pxTask == NULL )
				{
					xYieldRequired = pdTRUE;
				}


				if( pxTCB->uxBasePriority == pxTCB->uxPriority )
				{
					pxTCB->uxPriority = uxNewPriority;
				}

				pxTCB->uxBasePriority = uxNewPriority;
				listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), ( configMAX_PRIORITIES - ( portTickType ) uxNewPriority ) );

				if( listIS_CONTAINED_WITHIN( &( pxReadyTasksLists[ uxCurrentPriority ] ), &( pxTCB->xGenericListItem ) ) )
				{
					vListRemove( &( pxTCB->xGenericListItem ) );
					prvAddTaskToReadyQueue( pxTCB );
				}

				if( xYieldRequired == pdTRUE )
				{
					portYIELD_WITHIN_API();
				}
			}
		}
		portEXIT_CRITICAL();
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
void vTaskSuspend( xTaskHandle pxTaskToSuspend )
{
    tskTCB *pxTCB;

		portENTER_CRITICAL();
		{
			if( pxTaskToSuspend == pxCurrentTCB )
			{
				pxTaskToSuspend = NULL;
			}
			pxTCB = prvGetTCBFromHandle( pxTaskToSuspend );

			traceTASK_SUSPEND( pxTCB );
			vListRemove( &( pxTCB->xGenericListItem ) );
			if( pxTCB->xEventListItem.pvContainer )
			{
				vListRemove( &( pxTCB->xEventListItem ) );
			}

			vListInsertEnd( ( xList * ) &xSuspendedTaskList, &( pxTCB->xGenericListItem ) );
		}
		portEXIT_CRITICAL();

		if( ( void * ) pxTaskToSuspend == NULL )
		{
			if( xSchedulerRunning != pdFALSE )
			{
				portYIELD_WITHIN_API();
			}
			else
			{
				if( uxCurrentNumberOfTasks == 1 )
				{
					pxCurrentTCB = NULL;
				}
				else
				{
					vTaskSwitchContext();
				}
			}
		}
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
signed portBASE_TYPE xTaskIsTaskSuspended( xTaskHandle xTask )
{
  portBASE_TYPE xReturn = pdFALSE;
  const tskTCB * const pxTCB = ( tskTCB * ) xTask;

		if( listIS_CONTAINED_WITHIN( &xSuspendedTaskList, &( pxTCB->xGenericListItem ) ) != pdFALSE )
		{

			if( listIS_CONTAINED_WITHIN( &xPendingReadyList, &( pxTCB->xEventListItem ) ) != pdTRUE )
			{
				if( listIS_CONTAINED_WITHIN( NULL, &( pxTCB->xEventListItem ) ) == pdTRUE )
				{
					xReturn = pdTRUE;
				}
			}
		}
		return xReturn;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
void vTaskResume( xTaskHandle pxTaskToResume ){
  tskTCB *pxTCB;

  pxTCB = ( tskTCB * ) pxTaskToResume;

  if( ( pxTCB != NULL ) && ( pxTCB != pxCurrentTCB ) ){
      portENTER_CRITICAL();
      {
	if( xTaskIsTaskSuspended( pxTCB ) == pdTRUE )
	{
		traceTASK_RESUME( pxTCB );

		vListRemove(  &( pxTCB->xGenericListItem ) );
		prvAddTaskToReadyQueue( pxTCB );
		if( pxTCB->uxPriority >= pxCurrentTCB->uxPriority )
		{
        	  portYIELD_WITHIN_API();
		}
	}
        }
        portEXIT_CRITICAL();
    }
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
portBASE_TYPE xTaskResumeFromISR( xTaskHandle pxTaskToResume ){
  portBASE_TYPE xYieldRequired = pdFALSE;
  tskTCB *pxTCB;

   pxTCB = ( tskTCB * ) pxTaskToResume;

    if( xTaskIsTaskSuspended( pxTCB ) == pdTRUE )
    {
    	traceTASK_RESUME_FROM_ISR( pxTCB );

	if( uxSchedulerSuspended == ( unsigned portBASE_TYPE ) pdFALSE )
	{
	    xYieldRequired = ( pxTCB->uxPriority >= pxCurrentTCB->uxPriority );
	    vListRemove(  &( pxTCB->xGenericListItem ) );
	    prvAddTaskToReadyQueue( pxTCB );
	}
  	else
	{
            vListInsertEnd( ( xList * ) &( xPendingReadyList ), &( pxTCB->xEventListItem ) );
	}
      }

      return xYieldRequired;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
void vTaskStartScheduler( void ){
  portBASE_TYPE xReturn;

  xReturn = xTaskCreate( prvIdleTask, ( signed char * ) "IDLE", tskIDLE_STACK_SIZE, ( void * ) NULL, ( tskIDLE_PRIORITY | portPRIVILEGE_BIT ), ( xTaskHandle * ) NULL );

  if( xReturn == pdPASS )
  {
      portDISABLE_INTERRUPTS();
      xSchedulerRunning = pdTRUE;
      xTickCount = ( portTickType ) 0;
//		portCONFIGURE_TIMER_FOR_RUN_TIME_STATS();		
       xPortStartScheduler();
  }
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
void vTaskEndScheduler( void )
{
    portDISABLE_INTERRUPTS();
    xSchedulerRunning = pdFALSE;
    vPortEndScheduler();
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
void vTaskSuspendAll( void ){
  
   ++uxSchedulerSuspended;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
signed portBASE_TYPE xTaskResumeAll( void )
{
  register tskTCB *pxTCB;
  signed portBASE_TYPE xAlreadyYielded = pdFALSE;

	portENTER_CRITICAL();
	{
		--uxSchedulerSuspended;

		if( uxSchedulerSuspended == ( unsigned portBASE_TYPE ) pdFALSE )
		{
			if( uxCurrentNumberOfTasks > ( unsigned portBASE_TYPE ) 0 )
			{
				portBASE_TYPE xYieldRequired = pdFALSE;

				while( ( pxTCB = ( tskTCB * ) listGET_OWNER_OF_HEAD_ENTRY(  ( ( xList * ) &xPendingReadyList ) ) ) != NULL )
				{
					vListRemove( &( pxTCB->xEventListItem ) );
					vListRemove( &( pxTCB->xGenericListItem ) );
					prvAddTaskToReadyQueue( pxTCB );

					if( pxTCB->uxPriority >= pxCurrentTCB->uxPriority )
					{
						xYieldRequired = pdTRUE;
					}
				}
				if( uxMissedTicks > ( unsigned portBASE_TYPE ) 0 )
				{
					while( uxMissedTicks > ( unsigned portBASE_TYPE ) 0 )
					{
						vTaskIncrementTick();
						--uxMissedTicks;
					}
					xYieldRequired = pdTRUE;
				}

				if( ( xYieldRequired == pdTRUE ) || ( xMissedYield == pdTRUE ) )
				{
					xAlreadyYielded = pdTRUE;
					xMissedYield = pdFALSE;
					portYIELD_WITHIN_API();
				}
			}
		}
	}
	portEXIT_CRITICAL();

	return xAlreadyYielded;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
portTickType xTaskGetTickCount( void ){
  portTickType xTicks;

  portENTER_CRITICAL();
  {
      xTicks = xTickCount;
  }
  
  portEXIT_CRITICAL();
  return xTicks;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
portTickType xTaskGetTickCountFromISR( void ){
  
    return xTickCount;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
unsigned portBASE_TYPE uxTaskGetNumberOfTasks( void ){
  
  return uxCurrentNumberOfTasks;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
extern void TECLADO_amostragem(void);
extern void ENTRADASDIGITAIS_amostragemSinais(void);
void vTaskIncrementTick( void )
{
    if( uxSchedulerSuspended == ( unsigned portBASE_TYPE ) pdFALSE )
    {
        ++xTickCount;
	if( xTickCount == ( portTickType ) 0 )
	{
	    xList *pxTemp;
	    pxTemp = pxDelayedTaskList;
	    pxDelayedTaskList = pxOverflowDelayedTaskList;
	    pxOverflowDelayedTaskList = pxTemp;
	    xNumOfOverflows++;
	 }
	prvCheckDelayedTasks();
    }
    else
    {
	 ++uxMissedTicks;
    }
    
    traceTASK_INCREMENT_TICK( xTickCount );
    
//   TECLADO_amostragem(); 
//   ENTRADASDIGITAIS_amostragemSinais();
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
void vTaskSwitchContext( void )
{
	if( uxSchedulerSuspended != ( unsigned portBASE_TYPE ) pdFALSE )
	{
		xMissedYield = pdTRUE;
		return;
	}

	traceTASK_SWITCHED_OUT();

	#if ( configGENERATE_RUN_TIME_STATS == 1 )
	{
		unsigned long ulTempCounter;
		
			#ifdef portALT_GET_RUN_TIME_COUNTER_VALUE
				portALT_GET_RUN_TIME_COUNTER_VALUE( ulTempCounter );
			#else
				ulTempCounter = portGET_RUN_TIME_COUNTER_VALUE();
			#endif
			pxCurrentTCB->ulRunTimeCounter += ( ulTempCounter - ulTaskSwitchedInTime );
			ulTaskSwitchedInTime = ulTempCounter;
	}
	#endif

	taskFIRST_CHECK_FOR_STACK_OVERFLOW();
	taskSECOND_CHECK_FOR_STACK_OVERFLOW();

	while( listLIST_IS_EMPTY( &( pxReadyTasksLists[ uxTopReadyPriority ] ) ) )
	{
		--uxTopReadyPriority;
	}
	listGET_OWNER_OF_NEXT_ENTRY( pxCurrentTCB, &( pxReadyTasksLists[ uxTopReadyPriority ] ) );

	traceTASK_SWITCHED_IN();
	vWriteTraceToBuffer();
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
void vTaskPlaceOnEventList( const xList * const pxEventList, portTickType xTicksToWait )
{
portTickType xTimeToWake;

	vListInsert( ( xList * ) pxEventList, ( xListItem * ) &( pxCurrentTCB->xEventListItem ) );

	vListRemove( ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );


	#if ( INCLUDE_vTaskSuspend == 1 )
	{
		if( xTicksToWait == portMAX_DELAY )
		{
			vListInsertEnd( ( xList * ) &xSuspendedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
		}
		else
		{
			xTimeToWake = xTickCount + xTicksToWait;

			listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xGenericListItem ), xTimeToWake );

			if( xTimeToWake < xTickCount )
			{
				vListInsert( ( xList * ) pxOverflowDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
			}
			else
			{
				vListInsert( ( xList * ) pxDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
			}
		}
	}
	#else
	{
			xTimeToWake = xTickCount + xTicksToWait;

			listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xGenericListItem ), xTimeToWake );

			if( xTimeToWake < xTickCount )
			{
				vListInsert( ( xList * ) pxOverflowDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
			}
			else
			{
				vListInsert( ( xList * ) pxDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
			}
	}
	#endif
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
signed portBASE_TYPE xTaskRemoveFromEventList( const xList * const pxEventList )
{
tskTCB *pxUnblockedTCB;
portBASE_TYPE xReturn;

	pxUnblockedTCB = ( tskTCB * ) listGET_OWNER_OF_HEAD_ENTRY( pxEventList );
	vListRemove( &( pxUnblockedTCB->xEventListItem ) );

	if( uxSchedulerSuspended == ( unsigned portBASE_TYPE ) pdFALSE )
	{
		vListRemove( &( pxUnblockedTCB->xGenericListItem ) );
		prvAddTaskToReadyQueue( pxUnblockedTCB );
	}
	else
	{
		vListInsertEnd( ( xList * ) &( xPendingReadyList ), &( pxUnblockedTCB->xEventListItem ) );
	}

	if( pxUnblockedTCB->uxPriority >= pxCurrentTCB->uxPriority )
	{
		xReturn = pdTRUE;
	}
	else
	{
		xReturn = pdFALSE;
	}

	return xReturn;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
void vTaskSetTimeOutState( xTimeOutType * const pxTimeOut )
{
	pxTimeOut->xOverflowCount = xNumOfOverflows;
	pxTimeOut->xTimeOnEntering = xTickCount;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
portBASE_TYPE xTaskCheckForTimeOut( xTimeOutType * const pxTimeOut, portTickType * const pxTicksToWait )
{
portBASE_TYPE xReturn;

	portENTER_CRITICAL();
	{
		#if ( INCLUDE_vTaskSuspend == 1 )
			if( *pxTicksToWait == portMAX_DELAY )
			{
				xReturn = pdFALSE;
			}
			else
		#endif

		if( ( xNumOfOverflows != pxTimeOut->xOverflowCount ) && ( ( portTickType ) xTickCount >= ( portTickType ) pxTimeOut->xTimeOnEntering ) )
		{
			xReturn = pdTRUE;
		}
		else if( ( ( portTickType ) ( ( portTickType ) xTickCount - ( portTickType ) pxTimeOut->xTimeOnEntering ) ) < ( portTickType ) *pxTicksToWait )
		{
			*pxTicksToWait -= ( ( portTickType ) xTickCount - ( portTickType ) pxTimeOut->xTimeOnEntering );
			vTaskSetTimeOutState( pxTimeOut );
			xReturn = pdFALSE;
		}
		else
		{
			xReturn = pdTRUE;
		}
	}
	portEXIT_CRITICAL();

	return xReturn;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
void vTaskMissedYield( void )
{
	xMissedYield = pdTRUE;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
static portTASK_FUNCTION( prvIdleTask, pvParameters )
{
    /* Stop warnings. */
    ( void ) pvParameters;

    for( ;; )
    {
      prvCheckTasksWaitingTermination();

	#if ( configUSE_PREEMPTION == 0 )
		{
			taskYIELD();
		}
		#endif

		#if ( ( configUSE_PREEMPTION == 1 ) && ( configIDLE_SHOULD_YIELD == 1 ) )
		{
			if( listCURRENT_LIST_LENGTH( &( pxReadyTasksLists[ tskIDLE_PRIORITY ] ) ) > ( unsigned portBASE_TYPE ) 1 )
			{
				taskYIELD();
			}
		}
		#endif
	}
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
static void prvInitialiseTCBVariables( tskTCB *pxTCB, const signed char * const pcName, unsigned portBASE_TYPE uxPriority, const xMemoryRegion * const xRegions, unsigned short usStackDepth ){
  
    strncpy( ( char * ) pxTCB->pcTaskName, ( const char * ) pcName, ( unsigned short ) configMAX_TASK_NAME_LEN );
    pxTCB->pcTaskName[ ( unsigned short ) configMAX_TASK_NAME_LEN - ( unsigned short ) 1 ] = '\0';
    if( uxPriority >= configMAX_PRIORITIES )
	uxPriority = configMAX_PRIORITIES - 1;

    pxTCB->uxPriority = uxPriority;
    pxTCB->uxBasePriority = uxPriority;

    vListInitialiseItem( &( pxTCB->xGenericListItem ) );
    vListInitialiseItem( &( pxTCB->xEventListItem ) );
    listSET_LIST_ITEM_OWNER( &( pxTCB->xGenericListItem ), pxTCB );
    listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), configMAX_PRIORITIES - ( portTickType ) uxPriority );
    listSET_LIST_ITEM_OWNER( &( pxTCB->xEventListItem ), pxTCB );
    ( void ) xRegions;
    ( void ) usStackDepth;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
static void prvInitialiseTaskLists( void ){
  unsigned portBASE_TYPE uxPriority;

  for( uxPriority = 0; uxPriority < configMAX_PRIORITIES; uxPriority++ )
  {
      vListInitialise( ( xList * ) &( pxReadyTasksLists[ uxPriority ] ) );
  }

  vListInitialise( ( xList * ) &xDelayedTaskList1 );
  vListInitialise( ( xList * ) &xDelayedTaskList2 );
  vListInitialise( ( xList * ) &xPendingReadyList );
  vListInitialise( ( xList * ) &xTasksWaitingTermination );
  vListInitialise( ( xList * ) &xSuspendedTaskList );
  pxDelayedTaskList = &xDelayedTaskList1;
  pxOverflowDelayedTaskList = &xDelayedTaskList2;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
static void prvCheckTasksWaitingTermination( void )
{
    portBASE_TYPE xListIsEmpty;

    if( uxTasksDeleted > ( unsigned portBASE_TYPE ) 0 )
    {
  	vTaskSuspendAll();
	xListIsEmpty = listLIST_IS_EMPTY( &xTasksWaitingTermination );
	xTaskResumeAll();

        if( !xListIsEmpty )
	{
	    tskTCB *pxTCB;

	    portENTER_CRITICAL();
	    {
		pxTCB = ( tskTCB * ) listGET_OWNER_OF_HEAD_ENTRY( ( ( xList * ) &xTasksWaitingTermination ) );
		vListRemove( &( pxTCB->xGenericListItem ) );
		--uxCurrentNumberOfTasks;
		--uxTasksDeleted;
	     }
	      portEXIT_CRITICAL();

	      prvDeleteTCB( pxTCB );
	}
     }
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
static tskTCB *prvAllocateTCBAndStack( unsigned short usStackDepth, portSTACK_TYPE *puxStackBuffer )
{
  tskTCB *pxNewTCB;

  pxNewTCB = ( tskTCB * ) pvPortMalloc( sizeof( tskTCB ) );

  if( pxNewTCB != NULL )
  {
      pxNewTCB->pxStack = ( portSTACK_TYPE * ) pvPortMallocAligned( ( ( ( size_t )usStackDepth ) * sizeof( portSTACK_TYPE ) ), puxStackBuffer );

      if( pxNewTCB->pxStack == NULL )
      {
        vPortFree( pxNewTCB );
  	pxNewTCB = NULL;
      }
      else
      {
  	memset( pxNewTCB->pxStack, tskSTACK_FILL_BYTE, usStackDepth * sizeof( portSTACK_TYPE ) );
      }
  }
  return pxNewTCB;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
static unsigned short usTaskCheckFreeStackSpace( const unsigned char * pucStackByte ){
  register unsigned short usCount = 0;

  while( *pucStackByte == tskSTACK_FILL_BYTE )
  {
    pucStackByte -= portSTACK_GROWTH;
    usCount++;
  }

  usCount /= sizeof( portSTACK_TYPE );

  return usCount;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
unsigned portBASE_TYPE uxTaskGetStackHighWaterMark( xTaskHandle xTask )	{
  tskTCB *pxTCB;
  unsigned char *pcEndOfStack;
  unsigned portBASE_TYPE uxReturn;

  pxTCB = prvGetTCBFromHandle( xTask );
  pcEndOfStack = ( unsigned char * ) pxTCB->pxStack;

  uxReturn = ( unsigned portBASE_TYPE ) usTaskCheckFreeStackSpace( pcEndOfStack );
  return uxReturn;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
static void prvDeleteTCB( tskTCB *pxTCB ){
  
  vPortFreeAligned( pxTCB->pxStack );
  vPortFree( pxTCB );
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
xTaskHandle xTaskGetCurrentTaskHandle( void ){
  xTaskHandle xReturn;
	
  xReturn = pxCurrentTCB;
  
  return xReturn;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
void vTaskPriorityInherit( xTaskHandle * const pxMutexHolder )	{
  tskTCB * const pxTCB = ( tskTCB * ) pxMutexHolder;

  if( pxTCB->uxPriority < pxCurrentTCB->uxPriority ){
    
    listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), configMAX_PRIORITIES - ( portTickType ) pxCurrentTCB->uxPriority );
    if( listIS_CONTAINED_WITHIN( &( pxReadyTasksLists[ pxTCB->uxPriority ] ), &( pxTCB->xGenericListItem ) ) )			{
      vListRemove( &( pxTCB->xGenericListItem ) );
      pxTCB->uxPriority = pxCurrentTCB->uxPriority;
      prvAddTaskToReadyQueue( pxTCB );
    }
    else
      pxTCB->uxPriority = pxCurrentTCB->uxPriority;
    }
}
/********************************************************************************
*   Descrição       : 
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
void vTaskPriorityDisinherit( xTaskHandle * const pxMutexHolder ){
  tskTCB * const pxTCB = ( tskTCB * ) pxMutexHolder;

  if( pxMutexHolder != NULL )
  {
     if( pxTCB->uxPriority != pxTCB->uxBasePriority )
     {
	vListRemove( &( pxTCB->xGenericListItem ) );
	pxTCB->uxPriority = pxTCB->uxBasePriority;
	listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), configMAX_PRIORITIES - ( portTickType ) pxTCB->uxPriority );
	prvAddTaskToReadyQueue( pxTCB );
      }
   }
}
/********************************************************************************
*     Fim do arquivo
********************************************************************************/




