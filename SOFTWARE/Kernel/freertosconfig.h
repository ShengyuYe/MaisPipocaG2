#ifndef FREERTOS_CONFIG_H
#define FREERTOS_CONFIG_H

#define configUSE_PREEMPTION		        1
#define configUSE_IDLE_HOOK			0
#define configMAX_PRIORITIES		        ( ( unsigned portBASE_TYPE ) 5 )
#define configUSE_TICK_HOOK			1
#define configCPU_CLOCK_HZ			( ( unsigned long ) 99000000 )
#define configTICK_RATE_HZ			( ( portTickType ) 1000 )
#define configMINIMAL_STACK_SIZE	        ( ( unsigned short ) 80 )
#define configTOTAL_HEAP_SIZE		        ( ( size_t ) ( 12 * 1024 ) )//( ( size_t ) ( 18 * 1024 ) )
#define configMAX_TASK_NAME_LEN		        ( 12 )
#define configUSE_TRACE_FACILITY	        0
#define configUSE_16_BIT_TICKS		        0
#define configIDLE_SHOULD_YIELD		        0
#define configUSE_CO_ROUTINES 		        0
#define configUSE_MUTEXES			1

#define configMAX_CO_ROUTINE_PRIORITIES         ( 2 )

#define configUSE_COUNTING_SEMAPHORES 	        0
#define configUSE_ALTERNATIVE_API 		0
#define configCHECK_FOR_STACK_OVERFLOW	        2
#define configUSE_RECURSIVE_MUTEXES		1
#define configQUEUE_REGISTRY_SIZE		10
#define configGENERATE_RUN_TIME_STATS	        0


#define INCLUDE_vTaskPrioritySet		1
#define INCLUDE_uxTaskPriorityGet		1
#define INCLUDE_vTaskDelete			1
#define INCLUDE_vTaskCleanUpResources		0
#define INCLUDE_vTaskSuspend			1
#define INCLUDE_vTaskDelayUntil			1
#define INCLUDE_vTaskDelay			1
#define INCLUDE_uxTaskGetStackHighWaterMark	1
	
#define configPRIO_BITS                         5  

#define configKERNEL_INTERRUPT_PRIORITY 	( 31 << (8 - configPRIO_BITS) )
#define configMAX_SYSCALL_INTERRUPT_PRIORITY 	( 5 << (8 - configPRIO_BITS) )

#ifdef __ICCARM__
	#include "LPC17xx.h"
	extern void vConfigureTimerForRunTimeStats( void );
	#define portCONFIGURE_TIMER_FOR_RUN_TIME_STATS() vConfigureTimerForRunTimeStats()
	#define portGET_RUN_TIME_COUNTER_VALUE() TIM0->TC
#endif


#endif /* FREERTOS_CONFIG_H */
