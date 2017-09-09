///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     09/Sep/2017  15:56:38 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Kernel\tasks.c    /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Kernel\tasks.c    /
//                    -lC C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\   /
//                    -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\   /
//                    -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Obj\     /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\tasks. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME tasks

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memset
        EXTERN memcmp
        EXTERN pvPortMalloc
        EXTERN pxPortInitialiseStack
        EXTERN strncpy
        EXTERN vApplicationStackOverflowHook
        EXTERN vListInitialise
        EXTERN vListInitialiseItem
        EXTERN vListInsert
        EXTERN vListInsertEnd
        EXTERN vListRemove
        EXTERN vPortEndScheduler
        EXTERN vPortEnterCritical
        EXTERN vPortExitCritical
        EXTERN vPortFree
        EXTERN vPortSetInterruptMask
        EXTERN vPortYieldFromISR
        EXTERN xPortStartScheduler

        PUBLIC memset
        PUBLIC pxCurrentTCB
        PUBLIC pxDelayedTaskList
        PUBLIC pxOverflowDelayedTaskList
        PUBLIC pxReadyTasksLists
        PUBLIC uxCurrentNumberOfTasks
        PUBLIC uxMissedTicks
        PUBLIC uxSchedulerSuspended
        PUBLIC uxTaskGetNumberOfTasks
        PUBLIC uxTaskGetStackHighWaterMark
        PUBLIC uxTaskNumber
        PUBLIC uxTaskPriorityGet
        PUBLIC uxTasksDeleted
        PUBLIC uxTopReadyPriority
        PUBLIC uxTopUsedPriority
        PUBLIC vTaskDelay
        PUBLIC vTaskDelayUntil
        PUBLIC vTaskDelete
        PUBLIC vTaskEndScheduler
        PUBLIC vTaskIncrementTick
        PUBLIC vTaskMissedYield
        PUBLIC vTaskPlaceOnEventList
        PUBLIC vTaskPriorityDisinherit
        PUBLIC vTaskPriorityInherit
        PUBLIC vTaskPrioritySet
        PUBLIC vTaskResume
        PUBLIC vTaskSetTimeOutState
        PUBLIC vTaskStartScheduler
        PUBLIC vTaskSuspend
        PUBLIC vTaskSuspendAll
        PUBLIC vTaskSwitchContext
        PUBLIC xDelayedTaskList1
        PUBLIC xDelayedTaskList2
        PUBLIC xMissedYield
        PUBLIC xNumOfOverflows
        PUBLIC xPendingReadyList
        PUBLIC xSchedulerRunning
        PUBLIC xSuspendedTaskList
        PUBLIC xTaskCheckForTimeOut
        PUBLIC xTaskGenericCreate
        PUBLIC xTaskGetCurrentTaskHandle
        PUBLIC xTaskGetTickCount
        PUBLIC xTaskGetTickCountFromISR
        PUBLIC xTaskIsTaskSuspended
        PUBLIC xTaskRemoveFromEventList
        PUBLIC xTaskResumeAll
        PUBLIC xTaskResumeFromISR
        PUBLIC xTasksWaitingTermination
        PUBLIC xTickCount
        
          CFI Names cfiNames0
          CFI StackFrame CFA R13 DATA
          CFI Resource R0:32, R1:32, R2:32, R3:32, R4:32, R5:32, R6:32, R7:32
          CFI Resource R8:32, R9:32, R10:32, R11:32, R12:32, R13:32, R14:32
          CFI EndNames cfiNames0
        
          CFI Common cfiCommon0 Using cfiNames0
          CFI CodeAlign 2
          CFI DataAlign 4
          CFI ReturnAddress R14 CODE
          CFI CFA R13+0
          CFI R0 Undefined
          CFI R1 Undefined
          CFI R2 Undefined
          CFI R3 Undefined
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI R8 SameValue
          CFI R9 SameValue
          CFI R10 SameValue
          CFI R11 SameValue
          CFI R12 Undefined
          CFI R14 SameValue
          CFI EndCommon cfiCommon0
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Kernel\tasks.c
//    1 /*__________________________________________________________________________________
//    2 |	Quark Tecnologia Eletrônica Embarcada
//    3 |       
//    4 |       Itapema - SC
//    5 |       www.quarktee.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Quark  and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Quark 
//   10 |       or its distributors.
//   11 |
//   12 |       Este código é propriedade da Quark  e não pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       Quark  ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :
//   18 |       Descrição          :
//   19 | 
//   20 |       Autor              :
//   21 |       Data criação       :
//   22 |
//   23 |       Revisões           :
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 
//   29 /********************************************************************************
//   30 *   Includes
//   31 ********************************************************************************/
//   32 #include <stdio.h>
//   33 #include <stdlib.h>
//   34 #include <string.h>

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP memset
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function memset
        THUMB
// __intrinsic __nounwind __interwork __softfp void *memset(void *, int, size_t)
memset:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,R4
          CFI FunCall __aeabi_memset
        BL       __aeabi_memset
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock0
//   35 #define MPU_WRAPPERS_INCLUDED_FROM_API_FILE
//   36   #include "FreeRTOS.h"
//   37   #include "task.h"
//   38   #include "StackMacros.h"
//   39 #undef MPU_WRAPPERS_INCLUDED_FROM_API_FILE
//   40 
//   41 /********************************************************************************
//   42 *   Definições
//   43 ********************************************************************************/
//   44 #define tskIDLE_STACK_SIZE	configMINIMAL_STACK_SIZE
//   45 #define tskSTACK_FILL_BYTE	( 0xa5 )
//   46 #define tskBLOCKED_CHAR		( ( signed char ) 'B' )
//   47 #define tskREADY_CHAR		( ( signed char ) 'R' )
//   48 #define tskDELETED_CHAR		( ( signed char ) 'D' )
//   49 #define tskSUSPENDED_CHAR	( ( signed char ) 'S' )
//   50 #define vWriteTraceToBuffer()
//   51 
//   52 /********************************************************************************
//   53 *   Estruturas
//   54 ********************************************************************************/
//   55 typedef struct tskTaskControlBlock
//   56 {
//   57 	volatile portSTACK_TYPE	*pxTopOfStack;	
//   58 	xListItem xGenericListItem;
//   59 	xListItem xEventListItem;
//   60 	unsigned portBASE_TYPE	uxPriority;
//   61 	portSTACK_TYPE *pxStack;
//   62 	signed char pcTaskName[ configMAX_TASK_NAME_LEN ];        
//   63 	portSTACK_TYPE *pxEndOfStack;	
//   64 	unsigned portBASE_TYPE uxCriticalNesting;
//   65 	unsigned portBASE_TYPE uxBasePriority;	
//   66 } tskTCB;
//   67 
//   68 /********************************************************************************
//   69 *   Variaveis locais
//   70 ********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   71 tskTCB *  pxCurrentTCB = NULL;
pxCurrentTCB:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   72 xList pxReadyTasksLists[ configMAX_PRIORITIES ];
pxReadyTasksLists:
        DS8 100

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   73 xList xDelayedTaskList1;	
xDelayedTaskList1:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   74 xList xDelayedTaskList2;	
xDelayedTaskList2:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   75 xList *  pxDelayedTaskList ;
pxDelayedTaskList:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   76 xList *  pxOverflowDelayedTaskList;
pxOverflowDelayedTaskList:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   77 xList xPendingReadyList;			
xPendingReadyList:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   78 xList xTasksWaitingTermination;	
xTasksWaitingTermination:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   79 unsigned portBASE_TYPE uxTasksDeleted = ( unsigned portBASE_TYPE ) 0;
uxTasksDeleted:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   80 xList xSuspendedTaskList;
xSuspendedTaskList:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   81 unsigned portBASE_TYPE uxCurrentNumberOfTasks 	= ( unsigned portBASE_TYPE ) 0;
uxCurrentNumberOfTasks:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   82 portTickType xTickCount = ( portTickType ) 0;
xTickCount:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   83 unsigned portBASE_TYPE uxTopUsedPriority = tskIDLE_PRIORITY;
uxTopUsedPriority:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   84 unsigned portBASE_TYPE uxTopReadyPriority = tskIDLE_PRIORITY;
uxTopReadyPriority:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   85 signed portBASE_TYPE xSchedulerRunning	= pdFALSE;
xSchedulerRunning:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   86 unsigned portBASE_TYPE uxSchedulerSuspended = ( unsigned portBASE_TYPE ) pdFALSE;
uxSchedulerSuspended:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   87 unsigned portBASE_TYPE uxMissedTicks = ( unsigned portBASE_TYPE ) 0;
uxMissedTicks:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   88 portBASE_TYPE xMissedYield = ( portBASE_TYPE ) pdFALSE;
xMissedYield:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   89 portBASE_TYPE xNumOfOverflows = ( portBASE_TYPE ) 0;
xNumOfOverflows:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   90 unsigned portBASE_TYPE uxTaskNumber = ( unsigned portBASE_TYPE ) 0;
uxTaskNumber:
        DS8 4
//   91 
//   92 /********************************************************************************
//   93 *   Macros
//   94 ********************************************************************************/
//   95 #define prvAddTaskToReadyQueue( pxTCB )																			\ 
//   96 {																												\ 
//   97 	if( pxTCB->uxPriority > uxTopReadyPriority )																\ 
//   98 	{																											\ 
//   99 		uxTopReadyPriority = pxTCB->uxPriority;																	\ 
//  100 	}																											\ 
//  101 	vListInsertEnd( ( xList * ) &( pxReadyTasksLists[ pxTCB->uxPriority ] ), &( pxTCB->xGenericListItem ) );	\ 
//  102 }
//  103 
//  104 #define prvCheckDelayedTasks()																						\ 
//  105 {																													\ 
//  106 register tskTCB *pxTCB;																								\ 
//  107 																													\ 
//  108 	while( ( pxTCB = ( tskTCB * ) listGET_OWNER_OF_HEAD_ENTRY( pxDelayedTaskList ) ) != NULL )						\ 
//  109 	{																												\ 
//  110 		if( xTickCount < listGET_LIST_ITEM_VALUE( &( pxTCB->xGenericListItem ) ) )									\ 
//  111 		{																											\ 
//  112 			break;																									\ 
//  113 		}																											\ 
//  114 		vListRemove( &( pxTCB->xGenericListItem ) );																\ 
//  115 		if( pxTCB->xEventListItem.pvContainer )																		\ 
//  116 		{																											\ 
//  117 			vListRemove( &( pxTCB->xEventListItem ) );																\ 
//  118 		}																											\ 
//  119 		prvAddTaskToReadyQueue( pxTCB );																			\ 
//  120 	}																												\ 
//  121 }
//  122 
//  123 #define prvGetTCBFromHandle( pxHandle ) ( ( pxHandle == NULL ) ? ( tskTCB * ) pxCurrentTCB : ( tskTCB * ) pxHandle )
//  124 /********************************************************************************
//  125 *   Funções locais
//  126 ********************************************************************************/
//  127 static void prvInitialiseTCBVariables( tskTCB *pxTCB, const signed char * const pcName, unsigned portBASE_TYPE uxPriority, const xMemoryRegion * const xRegions, unsigned short usStackDepth ) PRIVILEGED_FUNCTION;
//  128 static void prvInitialiseTaskLists( void ) PRIVILEGED_FUNCTION;
//  129 static portTASK_FUNCTION_PROTO( prvIdleTask, pvParameters );
//  130 static void prvDeleteTCB( tskTCB *pxTCB ) PRIVILEGED_FUNCTION;
//  131 static void prvCheckTasksWaitingTermination( void ) PRIVILEGED_FUNCTION;
//  132 static tskTCB *prvAllocateTCBAndStack( unsigned short usStackDepth, portSTACK_TYPE *puxStackBuffer ) PRIVILEGED_FUNCTION;
//  133 static unsigned short usTaskCheckFreeStackSpace( const unsigned char * pucStackByte ) PRIVILEGED_FUNCTION;
//  134 /********************************************************************************
//  135 *   Implementação
//  136 ********************************************************************************/
//  137 
//  138 /********************************************************************************
//  139 *   Descrição       : 
//  140 *   Parametros      :   
//  141 *   Retorno         : 
//  142 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function xTaskGenericCreate
        THUMB
//  143 signed portBASE_TYPE xTaskGenericCreate( pdTASK_CODE pxTaskCode, const signed char * const pcName, unsigned short usStackDepth, void *pvParameters, unsigned portBASE_TYPE uxPriority, xTaskHandle *pxCreatedTask, portSTACK_TYPE *puxStackBuffer, const xMemoryRegion * const xRegions )
//  144 {
xTaskGenericCreate:
        PUSH     {R0,R1,R3-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+48
        SUB      SP,SP,#+8
          CFI CFA R13+56
        MOVS     R4,R2
        LDR      R5,[SP, #+56]
        LDR      R6,[SP, #+60]
        LDR      R7,[SP, #+64]
        LDR      R8,[SP, #+68]
//  145 signed portBASE_TYPE xReturn;
//  146 tskTCB * pxNewTCB;
//  147 
//  148 	pxNewTCB = prvAllocateTCBAndStack( usStackDepth, puxStackBuffer );
        MOVS     R1,R7
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall prvAllocateTCBAndStack
        BL       prvAllocateTCBAndStack
        MOV      R10,R0
//  149 
//  150 	if( pxNewTCB != NULL )
        CMP      R10,#+0
        BEQ.N    ??xTaskGenericCreate_0
//  151 	{
//  152 		portSTACK_TYPE *pxTopOfStack;
//  153 
//  154 		#if( portSTACK_GROWTH < 0 )
//  155 		{
//  156 			pxTopOfStack = pxNewTCB->pxStack + ( usStackDepth - 1 );
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LDR      R0,[R10, #+48]
        ADDS     R0,R0,R4, LSL #+2
        SUBS     R0,R0,#+4
        MOV      R11,R0
//  157 			pxTopOfStack = ( portSTACK_TYPE * ) ( ( ( unsigned long ) pxTopOfStack ) & ( ( unsigned long ) ~portBYTE_ALIGNMENT_MASK  ) );
        LSRS     R11,R11,#+3
        LSLS     R11,R11,#+3
//  158 		}
//  159 		#else
//  160 		{
//  161 			pxTopOfStack = pxNewTCB->pxStack;
//  162 
//  163 			/* If we want to use stack checking on architectures that use
//  164 			a positive stack growth direction then we also need to store the
//  165 			other extreme of the stack space. */
//  166 			pxNewTCB->pxEndOfStack = pxNewTCB->pxStack + ( usStackDepth - 1 );
//  167 		}
//  168 		#endif
//  169 
//  170 		prvInitialiseTCBVariables( pxNewTCB, pcName, uxPriority, xRegions, usStackDepth );
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        STR      R4,[SP, #+0]
        MOV      R3,R8
        MOVS     R2,R5
        LDR      R1,[SP, #+12]
        MOV      R0,R10
          CFI FunCall prvInitialiseTCBVariables
        BL       prvInitialiseTCBVariables
//  171 
//  172 		/* Initialize the TCB stack to look as if the task was already running,
//  173 		but had been interrupted by the scheduler.  The return address is set
//  174 		to the start of the task function. Once the stack has been initialised
//  175 		the	top of stack variable is updated. */
//  176 		#if( portUSING_MPU_WRAPPERS == 1 )
//  177 		{
//  178 			pxNewTCB->pxTopOfStack = pxPortInitialiseStack( pxTopOfStack, pxTaskCode, pvParameters, xRunPrivileged );
//  179 		}
//  180 		#else
//  181 		{
//  182 			pxNewTCB->pxTopOfStack = pxPortInitialiseStack( pxTopOfStack, pxTaskCode, pvParameters );
        LDR      R2,[SP, #+16]
        LDR      R1,[SP, #+8]
        MOV      R0,R11
          CFI FunCall pxPortInitialiseStack
        BL       pxPortInitialiseStack
        STR      R0,[R10, #+0]
//  183 		}
//  184 		#endif
//  185 
//  186 		if( ( void * ) pxCreatedTask != NULL )
        CMP      R6,#+0
        BEQ.N    ??xTaskGenericCreate_1
//  187 		{
//  188 			/* Pass the TCB out - in an anonymous way.  The calling function/
//  189 			task can use this as a handle to delete the task later if
//  190 			required.*/
//  191 			*pxCreatedTask = ( xTaskHandle ) pxNewTCB;
        STR      R10,[R6, #+0]
//  192 		}
//  193 		
//  194 		/* We are going to manipulate the task queues to add this task to a
//  195 		ready list, so must make sure no interrupts occur. */
//  196 		portENTER_CRITICAL();
??xTaskGenericCreate_1:
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
//  197 		{
//  198 			uxCurrentNumberOfTasks++;
        LDR.W    R0,??DataTable28
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable28
        STR      R0,[R1, #+0]
//  199 			if( pxCurrentTCB == NULL )
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??xTaskGenericCreate_2
//  200 			{
//  201 				/* There are no other tasks, or all the other tasks are in
//  202 				the suspended state - make this the current task. */
//  203 				pxCurrentTCB =  pxNewTCB;
        LDR.W    R0,??DataTable29
        STR      R10,[R0, #+0]
//  204 
//  205 				if( uxCurrentNumberOfTasks == ( unsigned portBASE_TYPE ) 1 )
        LDR.W    R0,??DataTable28
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??xTaskGenericCreate_3
//  206 				{
//  207 					/* This is the first task to be created so do the preliminary
//  208 					initialisation required.  We will not recover if this call
//  209 					fails, but we will report the failure. */
//  210 					prvInitialiseTaskLists();
          CFI FunCall prvInitialiseTaskLists
        BL       prvInitialiseTaskLists
        B.N      ??xTaskGenericCreate_3
//  211 				}
//  212 			}
//  213 			else
//  214 			{
//  215 				/* If the scheduler is not already running, make this task the
//  216 				current task if it is the highest priority task to be created
//  217 				so far. */
//  218 				if( xSchedulerRunning == pdFALSE )
??xTaskGenericCreate_2:
        LDR.W    R0,??DataTable29_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??xTaskGenericCreate_3
//  219 				{
//  220 					if( pxCurrentTCB->uxPriority <= uxPriority )
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+44]
        CMP      R5,R0
        BCC.N    ??xTaskGenericCreate_3
//  221 					{
//  222 						pxCurrentTCB = pxNewTCB;
        LDR.W    R0,??DataTable29
        STR      R10,[R0, #+0]
//  223 					}
//  224 				}
//  225 			}
//  226 
//  227 			/* Remember the top priority to make context switching faster.  Use
//  228 			the priority in pxNewTCB as this has been capped to a valid value. */
//  229 			if( pxNewTCB->uxPriority > uxTopUsedPriority )
??xTaskGenericCreate_3:
        LDR.W    R0,??DataTable29_2
        LDR      R0,[R0, #+0]
        LDR      R1,[R10, #+44]
        CMP      R0,R1
        BCS.N    ??xTaskGenericCreate_4
//  230 			{
//  231 				uxTopUsedPriority = pxNewTCB->uxPriority;
        LDR      R0,[R10, #+44]
        LDR.W    R1,??DataTable29_2
        STR      R0,[R1, #+0]
//  232 			}
//  233 
//  234 			#if ( configUSE_TRACE_FACILITY == 1 )
//  235 			{
//  236 				/* Add a counter into the TCB for tracing only. */
//  237 				pxNewTCB->uxTCBNumber = uxTaskNumber;
//  238 			}
//  239 			#endif
//  240 			uxTaskNumber++;
??xTaskGenericCreate_4:
        LDR.W    R0,??DataTable29_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable29_3
        STR      R0,[R1, #+0]
//  241 
//  242 			prvAddTaskToReadyQueue( pxNewTCB );
        LDR.W    R0,??DataTable29_4
        LDR      R0,[R0, #+0]
        LDR      R1,[R10, #+44]
        CMP      R0,R1
        BCS.N    ??xTaskGenericCreate_5
        LDR      R0,[R10, #+44]
        LDR.W    R1,??DataTable29_4
        STR      R0,[R1, #+0]
??xTaskGenericCreate_5:
        ADDS     R1,R10,#+4
        LDR      R0,[R10, #+44]
        MOVS     R2,#+20
        LDR.W    R3,??DataTable29_5
        MLA      R0,R2,R0,R3
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
//  243 
//  244 			xReturn = pdPASS;
        MOVS     R0,#+1
        MOV      R9,R0
//  245 			traceTASK_CREATE( pxNewTCB );
//  246 		}
//  247 		portEXIT_CRITICAL();
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
        B.N      ??xTaskGenericCreate_6
//  248 	}
//  249 	else
//  250 	{
//  251 		xReturn = errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY;
??xTaskGenericCreate_0:
        MOVS     R0,#-1
        MOV      R9,R0
//  252 		traceTASK_CREATE_FAILED();
//  253 	}
//  254 
//  255 	if( xReturn == pdPASS )
??xTaskGenericCreate_6:
        CMP      R9,#+1
        BNE.N    ??xTaskGenericCreate_7
//  256 	{
//  257 		if( xSchedulerRunning != pdFALSE )
        LDR.W    R0,??DataTable29_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??xTaskGenericCreate_7
//  258 		{
//  259 			/* If the created task is of a higher priority than the current task
//  260 			then it should run now. */
//  261 			if( pxCurrentTCB->uxPriority < uxPriority )
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+44]
        CMP      R0,R5
        BCS.N    ??xTaskGenericCreate_7
//  262 			{
//  263 				portYIELD_WITHIN_API();
          CFI FunCall vPortYieldFromISR
        BL       vPortYieldFromISR
//  264 			}
//  265 		}
//  266 	}
//  267 
//  268 	return xReturn;
??xTaskGenericCreate_7:
        MOV      R0,R9
        ADD      SP,SP,#+20
          CFI CFA R13+36
        POP      {R4-R11,PC}      ;; return
          CFI EndBlock cfiBlock1
//  269 }
//  270 /********************************************************************************
//  271 *   Descrição       : 
//  272 *   Parametros      :   
//  273 *   Retorno         : 
//  274 ********************************************************************************/
//  275 #if ( INCLUDE_vTaskDelete == 1 )
//  276 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function vTaskDelete
        THUMB
//  277 	void vTaskDelete( xTaskHandle pxTaskToDelete )
//  278 	{
vTaskDelete:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  279 	tskTCB *pxTCB;
//  280 
//  281 		portENTER_CRITICAL();
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
//  282 		{
//  283 			/* Ensure a yield is performed if the current task is being
//  284 			deleted. */
//  285 			if( pxTaskToDelete == pxCurrentTCB )
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        CMP      R4,R0
        BNE.N    ??vTaskDelete_0
//  286 			{
//  287 				pxTaskToDelete = NULL;
        MOVS     R0,#+0
        MOVS     R4,R0
//  288 			}
//  289 
//  290 			/* If null is passed in here then we are deleting ourselves. */
//  291 			pxTCB = prvGetTCBFromHandle( pxTaskToDelete );
??vTaskDelete_0:
        CMP      R4,#+0
        BNE.N    ??vTaskDelete_1
        LDR.W    R0,??DataTable29
        LDR      R5,[R0, #+0]
        B.N      ??vTaskDelete_2
??vTaskDelete_1:
        MOVS     R5,R4
//  292 
//  293 			/* Remove task from the ready list and place in the	termination list.
//  294 			This will stop the task from be scheduled.  The idle task will check
//  295 			the termination list and free up any memory allocated by the
//  296 			scheduler for the TCB and stack. */
//  297 			vListRemove( &( pxTCB->xGenericListItem ) );
??vTaskDelete_2:
        ADDS     R0,R5,#+4
          CFI FunCall vListRemove
        BL       vListRemove
//  298 
//  299 			/* Is the task waiting on an event also? */
//  300 			if( pxTCB->xEventListItem.pvContainer )
        LDR      R0,[R5, #+40]
        CMP      R0,#+0
        BEQ.N    ??vTaskDelete_3
//  301 			{
//  302 				vListRemove( &( pxTCB->xEventListItem ) );
        ADDS     R0,R5,#+24
          CFI FunCall vListRemove
        BL       vListRemove
//  303 			}
//  304 
//  305 			vListInsertEnd( ( xList * ) &xTasksWaitingTermination, &( pxTCB->xGenericListItem ) );
??vTaskDelete_3:
        ADDS     R1,R5,#+4
        LDR.W    R0,??DataTable29_6
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
//  306 
//  307 			/* Increment the ucTasksDeleted variable so the idle task knows
//  308 			there is a task that has been deleted and that it should therefore
//  309 			check the xTasksWaitingTermination list. */
//  310 			++uxTasksDeleted;
        LDR.W    R0,??DataTable29_7
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable29_7
        STR      R0,[R1, #+0]
//  311 
//  312 			/* Increment the uxTaskNumberVariable also so kernel aware debuggers
//  313 			can detect that the task lists need re-generating. */
//  314 			uxTaskNumber++;
        LDR.W    R0,??DataTable29_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable29_3
        STR      R0,[R1, #+0]
//  315 
//  316 			traceTASK_DELETE( pxTCB );
//  317 		}
//  318 		portEXIT_CRITICAL();
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
//  319 
//  320 		/* Force a reschedule if we have just deleted the current task. */
//  321 		if( xSchedulerRunning != pdFALSE )
        LDR.W    R0,??DataTable29_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??vTaskDelete_4
//  322 		{
//  323 			if( ( void * ) pxTaskToDelete == NULL )
        CMP      R4,#+0
        BNE.N    ??vTaskDelete_4
//  324 			{
//  325 				portYIELD_WITHIN_API();
          CFI FunCall vPortYieldFromISR
        BL       vPortYieldFromISR
//  326 			}
//  327 		}
//  328 	}
??vTaskDelete_4:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock2
//  329 
//  330 #endif
//  331 /********************************************************************************
//  332 *   Descrição       : 
//  333 *   Parametros      :   
//  334 *   Retorno         : 
//  335 ********************************************************************************/
//  336 #if ( INCLUDE_vTaskDelayUntil == 1 )
//  337 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function vTaskDelayUntil
        THUMB
//  338 	void vTaskDelayUntil( portTickType * const pxPreviousWakeTime, portTickType xTimeIncrement )
//  339 	{
vTaskDelayUntil:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  340 	portTickType xTimeToWake;
//  341 	portBASE_TYPE xAlreadyYielded, xShouldDelay = pdFALSE;
        MOVS     R8,#+0
//  342 
//  343 		vTaskSuspendAll();
          CFI FunCall vTaskSuspendAll
        BL       vTaskSuspendAll
//  344 		{
//  345 			/* Generate the tick time at which the task wants to wake. */
//  346 			xTimeToWake = *pxPreviousWakeTime + xTimeIncrement;
        LDR      R0,[R4, #+0]
        ADDS     R0,R5,R0
        MOVS     R6,R0
//  347 
//  348 			if( xTickCount < *pxPreviousWakeTime )
        LDR.W    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        LDR      R1,[R4, #+0]
        CMP      R0,R1
        BCS.N    ??vTaskDelayUntil_0
//  349 			{
//  350 				/* The tick count has overflowed since this function was
//  351 				lasted called.  In this case the only time we should ever
//  352 				actually delay is if the wake time has also	overflowed,
//  353 				and the wake time is greater than the tick time.  When this
//  354 				is the case it is as if neither time had overflowed. */
//  355 				if( ( xTimeToWake < *pxPreviousWakeTime ) && ( xTimeToWake > xTickCount ) )
        LDR      R0,[R4, #+0]
        CMP      R6,R0
        BCS.N    ??vTaskDelayUntil_1
        LDR.W    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        CMP      R0,R6
        BCS.N    ??vTaskDelayUntil_1
//  356 				{
//  357 					xShouldDelay = pdTRUE;
        MOVS     R0,#+1
        MOV      R8,R0
        B.N      ??vTaskDelayUntil_1
//  358 				}
//  359 			}
//  360 			else
//  361 			{
//  362 				/* The tick time has not overflowed.  In this case we will
//  363 				delay if either the wake time has overflowed, and/or the
//  364 				tick time is less than the wake time. */
//  365 				if( ( xTimeToWake < *pxPreviousWakeTime ) || ( xTimeToWake > xTickCount ) )
??vTaskDelayUntil_0:
        LDR      R0,[R4, #+0]
        CMP      R6,R0
        BCC.N    ??vTaskDelayUntil_2
        LDR.W    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        CMP      R0,R6
        BCS.N    ??vTaskDelayUntil_1
//  366 				{
//  367 					xShouldDelay = pdTRUE;
??vTaskDelayUntil_2:
        MOVS     R0,#+1
        MOV      R8,R0
//  368 				}
//  369 			}
//  370 
//  371 			/* Update the wake time ready for the next call. */
//  372 			*pxPreviousWakeTime = xTimeToWake;
??vTaskDelayUntil_1:
        STR      R6,[R4, #+0]
//  373 
//  374 			if( xShouldDelay )
        CMP      R8,#+0
        BEQ.N    ??vTaskDelayUntil_3
//  375 			{
//  376 				traceTASK_DELAY_UNTIL();
//  377 
//  378 				/* We must remove ourselves from the ready list before adding
//  379 				ourselves to the blocked list as the same list item is used for
//  380 				both lists. */
//  381 				vListRemove( ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+4
          CFI FunCall vListRemove
        BL       vListRemove
//  382 
//  383 				/* The list item will be inserted in wake time order. */
//  384 				listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xGenericListItem ), xTimeToWake );
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        STR      R6,[R0, #+4]
//  385 
//  386 				if( xTimeToWake < xTickCount )
        LDR.W    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        CMP      R6,R0
        BCS.N    ??vTaskDelayUntil_4
//  387 				{
//  388 					/* Wake time has overflowed.  Place this item in the
//  389 					overflow list. */
//  390 					vListInsert( ( xList * ) pxOverflowDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+4
        LDR.W    R0,??DataTable29_9
        LDR      R0,[R0, #+0]
          CFI FunCall vListInsert
        BL       vListInsert
        B.N      ??vTaskDelayUntil_3
//  391 				}
//  392 				else
//  393 				{
//  394 					/* The wake time has not overflowed, so we can use the
//  395 					current block list. */
//  396 					vListInsert( ( xList * ) pxDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
??vTaskDelayUntil_4:
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+4
        LDR.W    R0,??DataTable29_10
        LDR      R0,[R0, #+0]
          CFI FunCall vListInsert
        BL       vListInsert
//  397 				}
//  398 			}
//  399 		}
//  400 		xAlreadyYielded = xTaskResumeAll();
??vTaskDelayUntil_3:
          CFI FunCall xTaskResumeAll
        BL       xTaskResumeAll
        MOVS     R7,R0
//  401 
//  402 		/* Force a reschedule if xTaskResumeAll has not already done so, we may
//  403 		have put ourselves to sleep. */
//  404 		if( !xAlreadyYielded )
        CMP      R7,#+0
        BNE.N    ??vTaskDelayUntil_5
//  405 		{
//  406 			portYIELD_WITHIN_API();
          CFI FunCall vPortYieldFromISR
        BL       vPortYieldFromISR
//  407 		}
//  408 	}
??vTaskDelayUntil_5:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock3
//  409 
//  410 #endif
//  411 /********************************************************************************
//  412 *   Descrição       : 
//  413 *   Parametros      :   
//  414 *   Retorno         : 
//  415 ********************************************************************************/
//  416 #if ( INCLUDE_vTaskDelay == 1 )
//  417 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function vTaskDelay
        THUMB
//  418 	void vTaskDelay( portTickType xTicksToDelay )
//  419 	{
vTaskDelay:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
//  420 	portTickType xTimeToWake;
//  421 	signed portBASE_TYPE xAlreadyYielded = pdFALSE;
        MOVS     R6,#+0
//  422 
//  423 		/* A delay time of zero just forces a reschedule. */
//  424 		if( xTicksToDelay > ( portTickType ) 0 )
        CMP      R4,#+0
        BEQ.N    ??vTaskDelay_0
//  425 		{
//  426 			vTaskSuspendAll();
          CFI FunCall vTaskSuspendAll
        BL       vTaskSuspendAll
//  427 			{
//  428 				traceTASK_DELAY();
//  429 
//  430 				/* A task that is removed from the event list while the
//  431 				scheduler is suspended will not get placed in the ready
//  432 				list or removed from the blocked list until the scheduler
//  433 				is resumed.
//  434 
//  435 				This task cannot be in an event list as it is the currently
//  436 				executing task. */
//  437 
//  438 				/* Calculate the time to wake - this may overflow but this is
//  439 				not a problem. */
//  440 				xTimeToWake = xTickCount + xTicksToDelay;
        LDR.W    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R4,R0
        MOVS     R5,R0
//  441 
//  442 				/* We must remove ourselves from the ready list before adding
//  443 				ourselves to the blocked list as the same list item is used for
//  444 				both lists. */
//  445 				vListRemove( ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+4
          CFI FunCall vListRemove
        BL       vListRemove
//  446 
//  447 				/* The list item will be inserted in wake time order. */
//  448 				listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xGenericListItem ), xTimeToWake );
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        STR      R5,[R0, #+4]
//  449 
//  450 				if( xTimeToWake < xTickCount )
        LDR.W    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        CMP      R5,R0
        BCS.N    ??vTaskDelay_1
//  451 				{
//  452 					/* Wake time has overflowed.  Place this item in the
//  453 					overflow list. */
//  454 					vListInsert( ( xList * ) pxOverflowDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+4
        LDR.W    R0,??DataTable29_9
        LDR      R0,[R0, #+0]
          CFI FunCall vListInsert
        BL       vListInsert
        B.N      ??vTaskDelay_2
//  455 				}
//  456 				else
//  457 				{
//  458 					/* The wake time has not overflowed, so we can use the
//  459 					current block list. */
//  460 					vListInsert( ( xList * ) pxDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
??vTaskDelay_1:
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+4
        LDR.W    R0,??DataTable29_10
        LDR      R0,[R0, #+0]
          CFI FunCall vListInsert
        BL       vListInsert
//  461 				}
//  462 			}
//  463 			xAlreadyYielded = xTaskResumeAll();
??vTaskDelay_2:
          CFI FunCall xTaskResumeAll
        BL       xTaskResumeAll
        MOVS     R6,R0
//  464 		}
//  465 
//  466 		/* Force a reschedule if xTaskResumeAll has not already done so, we may
//  467 		have put ourselves to sleep. */
//  468 		if( !xAlreadyYielded )
??vTaskDelay_0:
        CMP      R6,#+0
        BNE.N    ??vTaskDelay_3
//  469 		{
//  470 			portYIELD_WITHIN_API();
          CFI FunCall vPortYieldFromISR
        BL       vPortYieldFromISR
//  471 		}
//  472 	}
??vTaskDelay_3:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock4
//  473 
//  474 #endif
//  475 /********************************************************************************
//  476 *   Descrição       : 
//  477 *   Parametros      :   
//  478 *   Retorno         : 
//  479 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function uxTaskPriorityGet
        THUMB
//  480 unsigned portBASE_TYPE uxTaskPriorityGet( xTaskHandle pxTask )
//  481 {
uxTaskPriorityGet:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
//  482 	tskTCB *pxTCB;
//  483 	unsigned portBASE_TYPE uxReturn;
//  484 
//  485 		portENTER_CRITICAL();
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
//  486 		{
//  487 			pxTCB = prvGetTCBFromHandle( pxTask );
        CMP      R4,#+0
        BNE.N    ??uxTaskPriorityGet_0
        LDR.W    R0,??DataTable29
        LDR      R5,[R0, #+0]
        B.N      ??uxTaskPriorityGet_1
??uxTaskPriorityGet_0:
        MOVS     R5,R4
//  488 			uxReturn = pxTCB->uxPriority;
??uxTaskPriorityGet_1:
        LDR      R0,[R5, #+44]
        MOVS     R6,R0
//  489 		}
//  490 		portEXIT_CRITICAL();
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
//  491 
//  492 		return uxReturn;
        MOVS     R0,R6
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock5
//  493 }
//  494 /********************************************************************************
//  495 *   Descrição       : 
//  496 *   Parametros      :   
//  497 *   Retorno         : 
//  498 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function vTaskPrioritySet
        THUMB
//  499 void vTaskPrioritySet( xTaskHandle pxTask, unsigned portBASE_TYPE uxNewPriority )
//  500 	{
vTaskPrioritySet:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  501 	tskTCB *pxTCB;
//  502 	unsigned portBASE_TYPE uxCurrentPriority, xYieldRequired = pdFALSE;
        MOVS     R8,#+0
//  503 
//  504 		if( uxNewPriority >= configMAX_PRIORITIES )
        CMP      R5,#+5
        BCC.N    ??vTaskPrioritySet_0
//  505 		{
//  506 			uxNewPriority = configMAX_PRIORITIES - 1;
        MOVS     R0,#+4
        MOVS     R5,R0
//  507 		}
//  508 
//  509 		portENTER_CRITICAL();
??vTaskPrioritySet_0:
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
//  510 		{
//  511 			if( pxTask == pxCurrentTCB )
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        CMP      R4,R0
        BNE.N    ??vTaskPrioritySet_1
//  512 			{
//  513 				pxTask = NULL;
        MOVS     R0,#+0
        MOVS     R4,R0
//  514 			}
//  515 			pxTCB = prvGetTCBFromHandle( pxTask );
??vTaskPrioritySet_1:
        CMP      R4,#+0
        BNE.N    ??vTaskPrioritySet_2
        LDR.W    R0,??DataTable29
        LDR      R6,[R0, #+0]
        B.N      ??vTaskPrioritySet_3
??vTaskPrioritySet_2:
        MOVS     R6,R4
//  516 
//  517 			traceTASK_PRIORITY_SET( pxTask, uxNewPriority );
//  518 			uxCurrentPriority = pxTCB->uxBasePriority;
??vTaskPrioritySet_3:
        LDR      R0,[R6, #+72]
        MOVS     R7,R0
//  519 			if( uxCurrentPriority != uxNewPriority )
        CMP      R7,R5
        BEQ.N    ??vTaskPrioritySet_4
//  520 			{
//  521 				if( uxNewPriority > uxCurrentPriority )
        CMP      R7,R5
        BCS.N    ??vTaskPrioritySet_5
//  522 				{
//  523 					if( pxTask != NULL )
        CMP      R4,#+0
        BEQ.N    ??vTaskPrioritySet_6
//  524 					{
//  525 						xYieldRequired = pdTRUE;
        MOVS     R0,#+1
        MOV      R8,R0
        B.N      ??vTaskPrioritySet_6
//  526 					}
//  527 				}
//  528 				else if( pxTask == NULL )
??vTaskPrioritySet_5:
        CMP      R4,#+0
        BNE.N    ??vTaskPrioritySet_6
//  529 				{
//  530 					xYieldRequired = pdTRUE;
        MOVS     R0,#+1
        MOV      R8,R0
//  531 				}
//  532 
//  533 
//  534 				if( pxTCB->uxBasePriority == pxTCB->uxPriority )
??vTaskPrioritySet_6:
        LDR      R0,[R6, #+72]
        LDR      R1,[R6, #+44]
        CMP      R0,R1
        BNE.N    ??vTaskPrioritySet_7
//  535 				{
//  536 					pxTCB->uxPriority = uxNewPriority;
        STR      R5,[R6, #+44]
//  537 				}
//  538 
//  539 				pxTCB->uxBasePriority = uxNewPriority;
??vTaskPrioritySet_7:
        STR      R5,[R6, #+72]
//  540 				listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), ( configMAX_PRIORITIES - ( portTickType ) uxNewPriority ) );
        RSBS     R0,R5,#+5
        STR      R0,[R6, #+24]
//  541 
//  542 				if( listIS_CONTAINED_WITHIN( &( pxReadyTasksLists[ uxCurrentPriority ] ), &( pxTCB->xGenericListItem ) ) )
        LDR      R0,[R6, #+20]
        MOVS     R1,#+20
        LDR.W    R2,??DataTable29_5
        MLA      R1,R1,R7,R2
        CMP      R0,R1
        BNE.N    ??vTaskPrioritySet_8
//  543 				{
//  544 					vListRemove( &( pxTCB->xGenericListItem ) );
        ADDS     R0,R6,#+4
          CFI FunCall vListRemove
        BL       vListRemove
//  545 					prvAddTaskToReadyQueue( pxTCB );
        LDR.W    R0,??DataTable29_4
        LDR      R0,[R0, #+0]
        LDR      R1,[R6, #+44]
        CMP      R0,R1
        BCS.N    ??vTaskPrioritySet_9
        LDR      R0,[R6, #+44]
        LDR.W    R1,??DataTable29_4
        STR      R0,[R1, #+0]
??vTaskPrioritySet_9:
        ADDS     R1,R6,#+4
        LDR      R0,[R6, #+44]
        MOVS     R2,#+20
        LDR.W    R3,??DataTable29_5
        MLA      R0,R2,R0,R3
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
//  546 				}
//  547 
//  548 				if( xYieldRequired == pdTRUE )
??vTaskPrioritySet_8:
        CMP      R8,#+1
        BNE.N    ??vTaskPrioritySet_4
//  549 				{
//  550 					portYIELD_WITHIN_API();
          CFI FunCall vPortYieldFromISR
        BL       vPortYieldFromISR
//  551 				}
//  552 			}
//  553 		}
//  554 		portEXIT_CRITICAL();
??vTaskPrioritySet_4:
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
//  555 }
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock6
//  556 /********************************************************************************
//  557 *   Descrição       : 
//  558 *   Parametros      :   
//  559 *   Retorno         : 
//  560 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function vTaskSuspend
        THUMB
//  561 void vTaskSuspend( xTaskHandle pxTaskToSuspend )
//  562 {
vTaskSuspend:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  563     tskTCB *pxTCB;
//  564 
//  565 		portENTER_CRITICAL();
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
//  566 		{
//  567 			if( pxTaskToSuspend == pxCurrentTCB )
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        CMP      R4,R0
        BNE.N    ??vTaskSuspend_0
//  568 			{
//  569 				pxTaskToSuspend = NULL;
        MOVS     R0,#+0
        MOVS     R4,R0
//  570 			}
//  571 			pxTCB = prvGetTCBFromHandle( pxTaskToSuspend );
??vTaskSuspend_0:
        CMP      R4,#+0
        BNE.N    ??vTaskSuspend_1
        LDR.W    R0,??DataTable29
        LDR      R5,[R0, #+0]
        B.N      ??vTaskSuspend_2
??vTaskSuspend_1:
        MOVS     R5,R4
//  572 
//  573 			traceTASK_SUSPEND( pxTCB );
//  574 			vListRemove( &( pxTCB->xGenericListItem ) );
??vTaskSuspend_2:
        ADDS     R0,R5,#+4
          CFI FunCall vListRemove
        BL       vListRemove
//  575 			if( pxTCB->xEventListItem.pvContainer )
        LDR      R0,[R5, #+40]
        CMP      R0,#+0
        BEQ.N    ??vTaskSuspend_3
//  576 			{
//  577 				vListRemove( &( pxTCB->xEventListItem ) );
        ADDS     R0,R5,#+24
          CFI FunCall vListRemove
        BL       vListRemove
//  578 			}
//  579 
//  580 			vListInsertEnd( ( xList * ) &xSuspendedTaskList, &( pxTCB->xGenericListItem ) );
??vTaskSuspend_3:
        ADDS     R1,R5,#+4
        LDR.W    R0,??DataTable29_11
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
//  581 		}
//  582 		portEXIT_CRITICAL();
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
//  583 
//  584 		if( ( void * ) pxTaskToSuspend == NULL )
        CMP      R4,#+0
        BNE.N    ??vTaskSuspend_4
//  585 		{
//  586 			if( xSchedulerRunning != pdFALSE )
        LDR.W    R0,??DataTable29_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??vTaskSuspend_5
//  587 			{
//  588 				portYIELD_WITHIN_API();
          CFI FunCall vPortYieldFromISR
        BL       vPortYieldFromISR
        B.N      ??vTaskSuspend_4
//  589 			}
//  590 			else
//  591 			{
//  592 				if( uxCurrentNumberOfTasks == 1 )
??vTaskSuspend_5:
        LDR.W    R0,??DataTable28
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??vTaskSuspend_6
//  593 				{
//  594 					pxCurrentTCB = NULL;
        LDR.W    R0,??DataTable29
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        B.N      ??vTaskSuspend_4
//  595 				}
//  596 				else
//  597 				{
//  598 					vTaskSwitchContext();
??vTaskSuspend_6:
          CFI FunCall vTaskSwitchContext
        BL       vTaskSwitchContext
//  599 				}
//  600 			}
//  601 		}
//  602 }
??vTaskSuspend_4:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock7
//  603 /********************************************************************************
//  604 *   Descrição       : 
//  605 *   Parametros      :   
//  606 *   Retorno         : 
//  607 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function xTaskIsTaskSuspended
          CFI NoCalls
        THUMB
//  608 signed portBASE_TYPE xTaskIsTaskSuspended( xTaskHandle xTask )
//  609 {
xTaskIsTaskSuspended:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R1,R0
//  610   portBASE_TYPE xReturn = pdFALSE;
        MOVS     R0,#+0
//  611   const tskTCB * const pxTCB = ( tskTCB * ) xTask;
        MOVS     R2,R1
//  612 
//  613 		if( listIS_CONTAINED_WITHIN( &xSuspendedTaskList, &( pxTCB->xGenericListItem ) ) != pdFALSE )
        LDR      R3,[R2, #+20]
        LDR.W    R4,??DataTable29_11
        CMP      R3,R4
        BNE.N    ??xTaskIsTaskSuspended_0
//  614 		{
//  615 
//  616 			if( listIS_CONTAINED_WITHIN( &xPendingReadyList, &( pxTCB->xEventListItem ) ) != pdTRUE )
        LDR      R3,[R2, #+40]
        LDR.W    R4,??DataTable29_12
        CMP      R3,R4
        BEQ.N    ??xTaskIsTaskSuspended_0
//  617 			{
//  618 				if( listIS_CONTAINED_WITHIN( NULL, &( pxTCB->xEventListItem ) ) == pdTRUE )
        LDR      R3,[R2, #+40]
        CMP      R3,#+0
        BNE.N    ??xTaskIsTaskSuspended_0
//  619 				{
//  620 					xReturn = pdTRUE;
        MOVS     R3,#+1
        MOVS     R0,R3
//  621 				}
//  622 			}
//  623 		}
//  624 		return xReturn;
??xTaskIsTaskSuspended_0:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  625 }
//  626 /********************************************************************************
//  627 *   Descrição       : 
//  628 *   Parametros      :   
//  629 *   Retorno         : 
//  630 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function vTaskResume
        THUMB
//  631 void vTaskResume( xTaskHandle pxTaskToResume ){
vTaskResume:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  632   tskTCB *pxTCB;
//  633 
//  634   pxTCB = ( tskTCB * ) pxTaskToResume;
        MOVS     R5,R4
//  635 
//  636   if( ( pxTCB != NULL ) && ( pxTCB != pxCurrentTCB ) ){
        CMP      R5,#+0
        BEQ.N    ??vTaskResume_0
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        CMP      R5,R0
        BEQ.N    ??vTaskResume_0
//  637       portENTER_CRITICAL();
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
//  638       {
//  639 	if( xTaskIsTaskSuspended( pxTCB ) == pdTRUE )
        MOVS     R0,R5
          CFI FunCall xTaskIsTaskSuspended
        BL       xTaskIsTaskSuspended
        CMP      R0,#+1
        BNE.N    ??vTaskResume_1
//  640 	{
//  641 		traceTASK_RESUME( pxTCB );
//  642 
//  643 		vListRemove(  &( pxTCB->xGenericListItem ) );
        ADDS     R0,R5,#+4
          CFI FunCall vListRemove
        BL       vListRemove
//  644 		prvAddTaskToReadyQueue( pxTCB );
        LDR.W    R0,??DataTable29_4
        LDR      R0,[R0, #+0]
        LDR      R1,[R5, #+44]
        CMP      R0,R1
        BCS.N    ??vTaskResume_2
        LDR      R0,[R5, #+44]
        LDR.W    R1,??DataTable29_4
        STR      R0,[R1, #+0]
??vTaskResume_2:
        ADDS     R1,R5,#+4
        LDR      R0,[R5, #+44]
        MOVS     R2,#+20
        LDR.W    R3,??DataTable29_5
        MLA      R0,R2,R0,R3
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
//  645 		if( pxTCB->uxPriority >= pxCurrentTCB->uxPriority )
        LDR      R0,[R5, #+44]
        LDR.W    R1,??DataTable29
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+44]
        CMP      R0,R1
        BCC.N    ??vTaskResume_1
//  646 		{
//  647         	  portYIELD_WITHIN_API();
          CFI FunCall vPortYieldFromISR
        BL       vPortYieldFromISR
//  648 		}
//  649 	}
//  650         }
//  651         portEXIT_CRITICAL();
??vTaskResume_1:
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
//  652     }
//  653 }
??vTaskResume_0:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock9
//  654 /********************************************************************************
//  655 *   Descrição       : 
//  656 *   Parametros      :   
//  657 *   Retorno         : 
//  658 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function xTaskResumeFromISR
        THUMB
//  659 portBASE_TYPE xTaskResumeFromISR( xTaskHandle pxTaskToResume ){
xTaskResumeFromISR:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
//  660   portBASE_TYPE xYieldRequired = pdFALSE;
        MOVS     R5,#+0
//  661   tskTCB *pxTCB;
//  662 
//  663    pxTCB = ( tskTCB * ) pxTaskToResume;
        MOVS     R6,R4
//  664 
//  665     if( xTaskIsTaskSuspended( pxTCB ) == pdTRUE )
        MOVS     R0,R6
          CFI FunCall xTaskIsTaskSuspended
        BL       xTaskIsTaskSuspended
        CMP      R0,#+1
        BNE.N    ??xTaskResumeFromISR_0
//  666     {
//  667     	traceTASK_RESUME_FROM_ISR( pxTCB );
//  668 
//  669 	if( uxSchedulerSuspended == ( unsigned portBASE_TYPE ) pdFALSE )
        LDR.W    R0,??DataTable29_13
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??xTaskResumeFromISR_1
//  670 	{
//  671 	    xYieldRequired = ( pxTCB->uxPriority >= pxCurrentTCB->uxPriority );
        LDR      R0,[R6, #+44]
        LDR.W    R1,??DataTable29
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+44]
        CMP      R0,R1
        BCC.N    ??xTaskResumeFromISR_2
        MOVS     R5,#+1
        B.N      ??xTaskResumeFromISR_3
??xTaskResumeFromISR_2:
        MOVS     R5,#+0
??xTaskResumeFromISR_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
//  672 	    vListRemove(  &( pxTCB->xGenericListItem ) );
        ADDS     R0,R6,#+4
          CFI FunCall vListRemove
        BL       vListRemove
//  673 	    prvAddTaskToReadyQueue( pxTCB );
        LDR.W    R0,??DataTable29_4
        LDR      R0,[R0, #+0]
        LDR      R1,[R6, #+44]
        CMP      R0,R1
        BCS.N    ??xTaskResumeFromISR_4
        LDR      R0,[R6, #+44]
        LDR.W    R1,??DataTable29_4
        STR      R0,[R1, #+0]
??xTaskResumeFromISR_4:
        ADDS     R1,R6,#+4
        LDR      R0,[R6, #+44]
        MOVS     R2,#+20
        LDR.W    R3,??DataTable29_5
        MLA      R0,R2,R0,R3
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
        B.N      ??xTaskResumeFromISR_0
//  674 	}
//  675   	else
//  676 	{
//  677             vListInsertEnd( ( xList * ) &( xPendingReadyList ), &( pxTCB->xEventListItem ) );
??xTaskResumeFromISR_1:
        ADDS     R1,R6,#+24
        LDR.W    R0,??DataTable29_12
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
//  678 	}
//  679       }
//  680 
//  681       return xYieldRequired;
??xTaskResumeFromISR_0:
        MOVS     R0,R5
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock10
//  682 }
//  683 /********************************************************************************
//  684 *   Descrição       : 
//  685 *   Parametros      :   
//  686 *   Retorno         : 
//  687 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function vTaskStartScheduler
        THUMB
//  688 void vTaskStartScheduler( void ){
vTaskStartScheduler:
        PUSH     {R0-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+24
//  689   portBASE_TYPE xReturn;
//  690 
//  691   xReturn = xTaskCreate( prvIdleTask, ( signed char * ) "IDLE", tskIDLE_STACK_SIZE, ( void * ) NULL, ( tskIDLE_PRIORITY | portPRIVILEGE_BIT ), ( xTaskHandle * ) NULL );
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+80
        LDR.W    R1,??DataTable29_14
        ADR.W    R0,prvIdleTask
          CFI FunCall xTaskGenericCreate
        BL       xTaskGenericCreate
        MOVS     R4,R0
//  692 
//  693   if( xReturn == pdPASS )
        CMP      R4,#+1
        BNE.N    ??vTaskStartScheduler_0
//  694   {
//  695       portDISABLE_INTERRUPTS();
          CFI FunCall vPortSetInterruptMask
        BL       vPortSetInterruptMask
//  696       xSchedulerRunning = pdTRUE;
        LDR.W    R0,??DataTable29_1
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
//  697       xTickCount = ( portTickType ) 0;
        LDR.W    R0,??DataTable29_8
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  698 //		portCONFIGURE_TIMER_FOR_RUN_TIME_STATS();		
//  699        xPortStartScheduler();
          CFI FunCall xPortStartScheduler
        BL       xPortStartScheduler
//  700   }
//  701 }
??vTaskStartScheduler_0:
        POP      {R0-R4,PC}       ;; return
          CFI EndBlock cfiBlock11
//  702 /********************************************************************************
//  703 *   Descrição       : 
//  704 *   Parametros      :   
//  705 *   Retorno         : 
//  706 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function vTaskEndScheduler
        THUMB
//  707 void vTaskEndScheduler( void )
//  708 {
vTaskEndScheduler:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  709     portDISABLE_INTERRUPTS();
          CFI FunCall vPortSetInterruptMask
        BL       vPortSetInterruptMask
//  710     xSchedulerRunning = pdFALSE;
        LDR.W    R0,??DataTable29_1
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  711     vPortEndScheduler();
          CFI FunCall vPortEndScheduler
        BL       vPortEndScheduler
//  712 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock12
//  713 /********************************************************************************
//  714 *   Descrição       : 
//  715 *   Parametros      :   
//  716 *   Retorno         : 
//  717 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function vTaskSuspendAll
          CFI NoCalls
        THUMB
//  718 void vTaskSuspendAll( void ){
//  719   
//  720    ++uxSchedulerSuspended;
vTaskSuspendAll:
        LDR.W    R0,??DataTable29_13
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable29_13
        STR      R0,[R1, #+0]
//  721 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock13
//  722 /********************************************************************************
//  723 *   Descrição       : 
//  724 *   Parametros      :   
//  725 *   Retorno         : 
//  726 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function xTaskResumeAll
        THUMB
//  727 signed portBASE_TYPE xTaskResumeAll( void )
//  728 {
xTaskResumeAll:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//  729   register tskTCB *pxTCB;
//  730   signed portBASE_TYPE xAlreadyYielded = pdFALSE;
        MOVS     R5,#+0
//  731 
//  732 	portENTER_CRITICAL();
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
//  733 	{
//  734 		--uxSchedulerSuspended;
        LDR.W    R0,??DataTable29_13
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable29_13
        STR      R0,[R1, #+0]
//  735 
//  736 		if( uxSchedulerSuspended == ( unsigned portBASE_TYPE ) pdFALSE )
        LDR.W    R0,??DataTable29_13
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??xTaskResumeAll_0
//  737 		{
//  738 			if( uxCurrentNumberOfTasks > ( unsigned portBASE_TYPE ) 0 )
        LDR.W    R0,??DataTable28
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??xTaskResumeAll_0
//  739 			{
//  740 				portBASE_TYPE xYieldRequired = pdFALSE;
        MOVS     R6,#+0
//  741 
//  742 				while( ( pxTCB = ( tskTCB * ) listGET_OWNER_OF_HEAD_ENTRY(  ( ( xList * ) &xPendingReadyList ) ) ) != NULL )
??xTaskResumeAll_1:
        LDR.W    R0,??DataTable29_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??xTaskResumeAll_2
        LDR.W    R0,??DataTable29_12
        LDR      R0,[R0, #+12]
        LDR      R4,[R0, #+12]
        B.N      ??xTaskResumeAll_3
??xTaskResumeAll_2:
        MOVS     R4,#+0
??xTaskResumeAll_3:
        CMP      R4,#+0
        BEQ.N    ??xTaskResumeAll_4
//  743 				{
//  744 					vListRemove( &( pxTCB->xEventListItem ) );
        ADDS     R0,R4,#+24
          CFI FunCall vListRemove
        BL       vListRemove
//  745 					vListRemove( &( pxTCB->xGenericListItem ) );
        ADDS     R0,R4,#+4
          CFI FunCall vListRemove
        BL       vListRemove
//  746 					prvAddTaskToReadyQueue( pxTCB );
        LDR.W    R0,??DataTable29_4
        LDR      R0,[R0, #+0]
        LDR      R1,[R4, #+44]
        CMP      R0,R1
        BCS.N    ??xTaskResumeAll_5
        LDR      R0,[R4, #+44]
        LDR.W    R1,??DataTable29_4
        STR      R0,[R1, #+0]
??xTaskResumeAll_5:
        ADDS     R1,R4,#+4
        LDR      R0,[R4, #+44]
        MOVS     R2,#+20
        LDR.W    R3,??DataTable29_5
        MLA      R0,R2,R0,R3
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
//  747 
//  748 					if( pxTCB->uxPriority >= pxCurrentTCB->uxPriority )
        LDR      R0,[R4, #+44]
        LDR.W    R1,??DataTable29
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+44]
        CMP      R0,R1
        BCC.N    ??xTaskResumeAll_1
//  749 					{
//  750 						xYieldRequired = pdTRUE;
        MOVS     R0,#+1
        MOVS     R6,R0
        B.N      ??xTaskResumeAll_1
//  751 					}
//  752 				}
//  753 				if( uxMissedTicks > ( unsigned portBASE_TYPE ) 0 )
??xTaskResumeAll_4:
        LDR.W    R0,??DataTable29_15
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??xTaskResumeAll_6
//  754 				{
//  755 					while( uxMissedTicks > ( unsigned portBASE_TYPE ) 0 )
??xTaskResumeAll_7:
        LDR.W    R0,??DataTable29_15
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??xTaskResumeAll_8
//  756 					{
//  757 						vTaskIncrementTick();
          CFI FunCall vTaskIncrementTick
        BL       vTaskIncrementTick
//  758 						--uxMissedTicks;
        LDR.W    R0,??DataTable29_15
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable29_15
        STR      R0,[R1, #+0]
        B.N      ??xTaskResumeAll_7
//  759 					}
//  760 					xYieldRequired = pdTRUE;
??xTaskResumeAll_8:
        MOVS     R0,#+1
        MOVS     R6,R0
//  761 				}
//  762 
//  763 				if( ( xYieldRequired == pdTRUE ) || ( xMissedYield == pdTRUE ) )
??xTaskResumeAll_6:
        CMP      R6,#+1
        BEQ.N    ??xTaskResumeAll_9
        LDR.W    R0,??DataTable29_16
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??xTaskResumeAll_0
//  764 				{
//  765 					xAlreadyYielded = pdTRUE;
??xTaskResumeAll_9:
        MOVS     R0,#+1
        MOVS     R5,R0
//  766 					xMissedYield = pdFALSE;
        LDR.W    R0,??DataTable29_16
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  767 					portYIELD_WITHIN_API();
          CFI FunCall vPortYieldFromISR
        BL       vPortYieldFromISR
//  768 				}
//  769 			}
//  770 		}
//  771 	}
//  772 	portEXIT_CRITICAL();
??xTaskResumeAll_0:
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
//  773 
//  774 	return xAlreadyYielded;
        MOVS     R0,R5
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock14
//  775 }
//  776 /********************************************************************************
//  777 *   Descrição       : 
//  778 *   Parametros      :   
//  779 *   Retorno         : 
//  780 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function xTaskGetTickCount
        THUMB
//  781 portTickType xTaskGetTickCount( void ){
xTaskGetTickCount:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  782   portTickType xTicks;
//  783 
//  784   portENTER_CRITICAL();
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
//  785   {
//  786       xTicks = xTickCount;
        LDR.W    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        MOVS     R4,R0
//  787   }
//  788   
//  789   portEXIT_CRITICAL();
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
//  790   return xTicks;
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock15
//  791 }
//  792 /********************************************************************************
//  793 *   Descrição       : 
//  794 *   Parametros      :   
//  795 *   Retorno         : 
//  796 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function xTaskGetTickCountFromISR
          CFI NoCalls
        THUMB
//  797 portTickType xTaskGetTickCountFromISR( void ){
//  798   
//  799     return xTickCount;
xTaskGetTickCountFromISR:
        LDR.W    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock16
//  800 }
//  801 /********************************************************************************
//  802 *   Descrição       : 
//  803 *   Parametros      :   
//  804 *   Retorno         : 
//  805 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function uxTaskGetNumberOfTasks
          CFI NoCalls
        THUMB
//  806 unsigned portBASE_TYPE uxTaskGetNumberOfTasks( void ){
//  807   
//  808   return uxCurrentNumberOfTasks;
uxTaskGetNumberOfTasks:
        LDR.W    R0,??DataTable28
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock17
//  809 }
//  810 /********************************************************************************
//  811 *   Descrição       : 
//  812 *   Parametros      :   
//  813 *   Retorno         : 
//  814 ********************************************************************************/
//  815 extern void TECLADO_amostragem(void);
//  816 extern void ENTRADASDIGITAIS_amostragemSinais(void);

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function vTaskIncrementTick
        THUMB
//  817 void vTaskIncrementTick( void )
//  818 {
vTaskIncrementTick:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  819     if( uxSchedulerSuspended == ( unsigned portBASE_TYPE ) pdFALSE )
        LDR.W    R0,??DataTable29_13
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??vTaskIncrementTick_0
//  820     {
//  821         ++xTickCount;
        LDR.W    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable29_8
        STR      R0,[R1, #+0]
//  822 	if( xTickCount == ( portTickType ) 0 )
        LDR.W    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??vTaskIncrementTick_1
//  823 	{
//  824 	    xList *pxTemp;
//  825 	    pxTemp = pxDelayedTaskList;
        LDR.W    R1,??DataTable29_10
        LDR      R1,[R1, #+0]
        MOVS     R0,R1
//  826 	    pxDelayedTaskList = pxOverflowDelayedTaskList;
        LDR.W    R1,??DataTable29_10
        LDR.W    R2,??DataTable29_9
        LDR      R2,[R2, #+0]
        STR      R2,[R1, #+0]
//  827 	    pxOverflowDelayedTaskList = pxTemp;
        LDR.W    R1,??DataTable29_9
        STR      R0,[R1, #+0]
//  828 	    xNumOfOverflows++;
        LDR.W    R1,??DataTable29_17
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR.W    R2,??DataTable29_17
        STR      R1,[R2, #+0]
//  829 	 }
//  830 	prvCheckDelayedTasks();
??vTaskIncrementTick_1:
??vTaskIncrementTick_2:
        LDR.W    R0,??DataTable29_10
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??vTaskIncrementTick_3
        LDR.W    R0,??DataTable29_10
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+12]
        LDR      R4,[R0, #+12]
        B.N      ??vTaskIncrementTick_4
??vTaskIncrementTick_3:
        MOVS     R4,#+0
??vTaskIncrementTick_4:
        CMP      R4,#+0
        BEQ.N    ??vTaskIncrementTick_5
        LDR.W    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        LDR      R1,[R4, #+4]
        CMP      R0,R1
        BCC.N    ??vTaskIncrementTick_5
??vTaskIncrementTick_6:
        ADDS     R0,R4,#+4
          CFI FunCall vListRemove
        BL       vListRemove
        LDR      R0,[R4, #+40]
        CMP      R0,#+0
        BEQ.N    ??vTaskIncrementTick_7
        ADDS     R0,R4,#+24
          CFI FunCall vListRemove
        BL       vListRemove
??vTaskIncrementTick_7:
        LDR.W    R0,??DataTable29_4
        LDR      R0,[R0, #+0]
        LDR      R1,[R4, #+44]
        CMP      R0,R1
        BCS.N    ??vTaskIncrementTick_8
        LDR      R0,[R4, #+44]
        LDR.W    R1,??DataTable29_4
        STR      R0,[R1, #+0]
??vTaskIncrementTick_8:
        ADDS     R1,R4,#+4
        LDR      R0,[R4, #+44]
        MOVS     R2,#+20
        LDR.W    R3,??DataTable29_5
        MLA      R0,R2,R0,R3
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
        B.N      ??vTaskIncrementTick_2
//  831     }
//  832     else
//  833     {
//  834 	 ++uxMissedTicks;
??vTaskIncrementTick_0:
        LDR.W    R0,??DataTable29_15
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable29_15
        STR      R0,[R1, #+0]
//  835     }
//  836     
//  837     traceTASK_INCREMENT_TICK( xTickCount );
//  838     
//  839 //   TECLADO_amostragem(); 
//  840 //   ENTRADASDIGITAIS_amostragemSinais();
//  841 }
??vTaskIncrementTick_5:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock18
//  842 /********************************************************************************
//  843 *   Descrição       : 
//  844 *   Parametros      :   
//  845 *   Retorno         : 
//  846 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function vTaskSwitchContext
        THUMB
//  847 void vTaskSwitchContext( void )
//  848 {
vTaskSwitchContext:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  849 	if( uxSchedulerSuspended != ( unsigned portBASE_TYPE ) pdFALSE )
        LDR.W    R0,??DataTable29_13
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??vTaskSwitchContext_0
//  850 	{
//  851 		xMissedYield = pdTRUE;
        LDR.W    R0,??DataTable29_16
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
//  852 		return;
        B.N      ??vTaskSwitchContext_1
//  853 	}
//  854 
//  855 	traceTASK_SWITCHED_OUT();
//  856 
//  857 	#if ( configGENERATE_RUN_TIME_STATS == 1 )
//  858 	{
//  859 		unsigned long ulTempCounter;
//  860 		
//  861 			#ifdef portALT_GET_RUN_TIME_COUNTER_VALUE
//  862 				portALT_GET_RUN_TIME_COUNTER_VALUE( ulTempCounter );
//  863 			#else
//  864 				ulTempCounter = portGET_RUN_TIME_COUNTER_VALUE();
//  865 			#endif
//  866 			pxCurrentTCB->ulRunTimeCounter += ( ulTempCounter - ulTaskSwitchedInTime );
//  867 			ulTaskSwitchedInTime = ulTempCounter;
//  868 	}
//  869 	#endif
//  870 
//  871 	taskFIRST_CHECK_FOR_STACK_OVERFLOW();
??vTaskSwitchContext_0:
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+48]
        LDR.W    R1,??DataTable29
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BCC.N    ??vTaskSwitchContext_2
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+52
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
          CFI FunCall vApplicationStackOverflowHook
        BL       vApplicationStackOverflowHook
//  872 	taskSECOND_CHECK_FOR_STACK_OVERFLOW();
??vTaskSwitchContext_2:
        MOVS     R2,#+20
        LDR.W    R1,??DataTable29_18
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+48]
          CFI FunCall memcmp
        BL       memcmp
        CMP      R0,#+0
        BEQ.N    ??vTaskSwitchContext_3
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+52
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
          CFI FunCall vApplicationStackOverflowHook
        BL       vApplicationStackOverflowHook
//  873 
//  874 	while( listLIST_IS_EMPTY( &( pxReadyTasksLists[ uxTopReadyPriority ] ) ) )
??vTaskSwitchContext_3:
        LDR.W    R0,??DataTable29_4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+20
        LDR.W    R2,??DataTable29_5
        MLA      R0,R1,R0,R2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??vTaskSwitchContext_4
//  875 	{
//  876 		--uxTopReadyPriority;
        LDR.W    R0,??DataTable29_4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable29_4
        STR      R0,[R1, #+0]
        B.N      ??vTaskSwitchContext_3
//  877 	}
//  878 	listGET_OWNER_OF_NEXT_ENTRY( pxCurrentTCB, &( pxReadyTasksLists[ uxTopReadyPriority ] ) );
??vTaskSwitchContext_4:
        LDR.W    R1,??DataTable29_4
        LDR      R1,[R1, #+0]
        MOVS     R2,#+20
        LDR.W    R3,??DataTable29_5
        MLA      R1,R2,R1,R3
        MOVS     R0,R1
        LDR      R1,[R0, #+4]
        LDR      R1,[R1, #+4]
        STR      R1,[R0, #+4]
        LDR      R1,[R0, #+4]
        ADDS     R2,R0,#+8
        CMP      R1,R2
        BNE.N    ??vTaskSwitchContext_5
        LDR      R1,[R0, #+4]
        LDR      R1,[R1, #+4]
        STR      R1,[R0, #+4]
??vTaskSwitchContext_5:
        LDR      R0,[R0, #+4]
        LDR      R0,[R0, #+12]
        LDR.W    R1,??DataTable29
        STR      R0,[R1, #+0]
//  879 
//  880 	traceTASK_SWITCHED_IN();
//  881 	vWriteTraceToBuffer();
//  882 }
??vTaskSwitchContext_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock19

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "IDLE">`:
        DATA
        DC8 "IDLE"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
??ucExpectedStackBytes:
        DATA
        DC8 165, 165, 165, 165, 165, 165, 165, 165, 165, 165, 165, 165, 165
        DC8 165, 165, 165, 165, 165, 165, 165
//  883 /********************************************************************************
//  884 *   Descrição       : 
//  885 *   Parametros      :   
//  886 *   Retorno         : 
//  887 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function vTaskPlaceOnEventList
        THUMB
//  888 void vTaskPlaceOnEventList( const xList * const pxEventList, portTickType xTicksToWait )
//  889 {
vTaskPlaceOnEventList:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  890 portTickType xTimeToWake;
//  891 
//  892 	vListInsert( ( xList * ) pxEventList, ( xListItem * ) &( pxCurrentTCB->xEventListItem ) );
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+24
        MOVS     R0,R4
          CFI FunCall vListInsert
        BL       vListInsert
//  893 
//  894 	vListRemove( ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+4
          CFI FunCall vListRemove
        BL       vListRemove
//  895 
//  896 
//  897 	#if ( INCLUDE_vTaskSuspend == 1 )
//  898 	{
//  899 		if( xTicksToWait == portMAX_DELAY )
        CMN      R5,#+1
        BNE.N    ??vTaskPlaceOnEventList_0
//  900 		{
//  901 			vListInsertEnd( ( xList * ) &xSuspendedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+4
        LDR.W    R0,??DataTable29_11
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
        B.N      ??vTaskPlaceOnEventList_1
//  902 		}
//  903 		else
//  904 		{
//  905 			xTimeToWake = xTickCount + xTicksToWait;
??vTaskPlaceOnEventList_0:
        LDR.W    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R5,R0
        MOVS     R6,R0
//  906 
//  907 			listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xGenericListItem ), xTimeToWake );
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        STR      R6,[R0, #+4]
//  908 
//  909 			if( xTimeToWake < xTickCount )
        LDR.W    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        CMP      R6,R0
        BCS.N    ??vTaskPlaceOnEventList_2
//  910 			{
//  911 				vListInsert( ( xList * ) pxOverflowDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+4
        LDR.W    R0,??DataTable29_9
        LDR      R0,[R0, #+0]
          CFI FunCall vListInsert
        BL       vListInsert
        B.N      ??vTaskPlaceOnEventList_1
//  912 			}
//  913 			else
//  914 			{
//  915 				vListInsert( ( xList * ) pxDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
??vTaskPlaceOnEventList_2:
        LDR.W    R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+4
        LDR.W    R0,??DataTable29_10
        LDR      R0,[R0, #+0]
          CFI FunCall vListInsert
        BL       vListInsert
//  916 			}
//  917 		}
//  918 	}
//  919 	#else
//  920 	{
//  921 			xTimeToWake = xTickCount + xTicksToWait;
//  922 
//  923 			listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xGenericListItem ), xTimeToWake );
//  924 
//  925 			if( xTimeToWake < xTickCount )
//  926 			{
//  927 				vListInsert( ( xList * ) pxOverflowDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
//  928 			}
//  929 			else
//  930 			{
//  931 				vListInsert( ( xList * ) pxDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
//  932 			}
//  933 	}
//  934 	#endif
//  935 }
??vTaskPlaceOnEventList_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock20
//  936 /********************************************************************************
//  937 *   Descrição       : 
//  938 *   Parametros      :   
//  939 *   Retorno         : 
//  940 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function xTaskRemoveFromEventList
        THUMB
//  941 signed portBASE_TYPE xTaskRemoveFromEventList( const xList * const pxEventList )
//  942 {
xTaskRemoveFromEventList:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
//  943 tskTCB *pxUnblockedTCB;
//  944 portBASE_TYPE xReturn;
//  945 
//  946 	pxUnblockedTCB = ( tskTCB * ) listGET_OWNER_OF_HEAD_ENTRY( pxEventList );
        LDR      R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??xTaskRemoveFromEventList_0
        LDR      R0,[R4, #+12]
        LDR      R6,[R0, #+12]
        B.N      ??xTaskRemoveFromEventList_1
??xTaskRemoveFromEventList_0:
        MOVS     R6,#+0
//  947 	vListRemove( &( pxUnblockedTCB->xEventListItem ) );
??xTaskRemoveFromEventList_1:
        ADDS     R0,R6,#+24
          CFI FunCall vListRemove
        BL       vListRemove
//  948 
//  949 	if( uxSchedulerSuspended == ( unsigned portBASE_TYPE ) pdFALSE )
        LDR.W    R0,??DataTable29_13
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??xTaskRemoveFromEventList_2
//  950 	{
//  951 		vListRemove( &( pxUnblockedTCB->xGenericListItem ) );
        ADDS     R0,R6,#+4
          CFI FunCall vListRemove
        BL       vListRemove
//  952 		prvAddTaskToReadyQueue( pxUnblockedTCB );
        LDR.N    R0,??DataTable29_4
        LDR      R0,[R0, #+0]
        LDR      R1,[R6, #+44]
        CMP      R0,R1
        BCS.N    ??xTaskRemoveFromEventList_3
        LDR      R0,[R6, #+44]
        LDR.N    R1,??DataTable29_4
        STR      R0,[R1, #+0]
??xTaskRemoveFromEventList_3:
        ADDS     R1,R6,#+4
        LDR      R0,[R6, #+44]
        MOVS     R2,#+20
        LDR.N    R3,??DataTable29_5
        MLA      R0,R2,R0,R3
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
        B.N      ??xTaskRemoveFromEventList_4
//  953 	}
//  954 	else
//  955 	{
//  956 		vListInsertEnd( ( xList * ) &( xPendingReadyList ), &( pxUnblockedTCB->xEventListItem ) );
??xTaskRemoveFromEventList_2:
        ADDS     R1,R6,#+24
        LDR.N    R0,??DataTable29_12
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
//  957 	}
//  958 
//  959 	if( pxUnblockedTCB->uxPriority >= pxCurrentTCB->uxPriority )
??xTaskRemoveFromEventList_4:
        LDR      R0,[R6, #+44]
        LDR.N    R1,??DataTable29
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+44]
        CMP      R0,R1
        BCC.N    ??xTaskRemoveFromEventList_5
//  960 	{
//  961 		xReturn = pdTRUE;
        MOVS     R0,#+1
        MOVS     R5,R0
        B.N      ??xTaskRemoveFromEventList_6
//  962 	}
//  963 	else
//  964 	{
//  965 		xReturn = pdFALSE;
??xTaskRemoveFromEventList_5:
        MOVS     R0,#+0
        MOVS     R5,R0
//  966 	}
//  967 
//  968 	return xReturn;
??xTaskRemoveFromEventList_6:
        MOVS     R0,R5
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock21
//  969 }
//  970 /********************************************************************************
//  971 *   Descrição       : 
//  972 *   Parametros      :   
//  973 *   Retorno         : 
//  974 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function vTaskSetTimeOutState
          CFI NoCalls
        THUMB
//  975 void vTaskSetTimeOutState( xTimeOutType * const pxTimeOut )
//  976 {
//  977 	pxTimeOut->xOverflowCount = xNumOfOverflows;
vTaskSetTimeOutState:
        LDR.N    R1,??DataTable29_17
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  978 	pxTimeOut->xTimeOnEntering = xTickCount;
        LDR.N    R1,??DataTable29_8
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+4]
//  979 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock22
//  980 /********************************************************************************
//  981 *   Descrição       : 
//  982 *   Parametros      :   
//  983 *   Retorno         : 
//  984 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function xTaskCheckForTimeOut
        THUMB
//  985 portBASE_TYPE xTaskCheckForTimeOut( xTimeOutType * const pxTimeOut, portTickType * const pxTicksToWait )
//  986 {
xTaskCheckForTimeOut:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  987 portBASE_TYPE xReturn;
//  988 
//  989 	portENTER_CRITICAL();
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
//  990 	{
//  991 		#if ( INCLUDE_vTaskSuspend == 1 )
//  992 			if( *pxTicksToWait == portMAX_DELAY )
        LDR      R0,[R5, #+0]
        CMN      R0,#+1
        BNE.N    ??xTaskCheckForTimeOut_0
//  993 			{
//  994 				xReturn = pdFALSE;
        MOVS     R0,#+0
        MOVS     R6,R0
        B.N      ??xTaskCheckForTimeOut_1
//  995 			}
//  996 			else
//  997 		#endif
//  998 
//  999 		if( ( xNumOfOverflows != pxTimeOut->xOverflowCount ) && ( ( portTickType ) xTickCount >= ( portTickType ) pxTimeOut->xTimeOnEntering ) )
??xTaskCheckForTimeOut_0:
        LDR.N    R0,??DataTable29_17
        LDR      R0,[R0, #+0]
        LDR      R1,[R4, #+0]
        CMP      R0,R1
        BEQ.N    ??xTaskCheckForTimeOut_2
        LDR.N    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        LDR      R1,[R4, #+4]
        CMP      R0,R1
        BCC.N    ??xTaskCheckForTimeOut_2
// 1000 		{
// 1001 			xReturn = pdTRUE;
        MOVS     R0,#+1
        MOVS     R6,R0
        B.N      ??xTaskCheckForTimeOut_1
// 1002 		}
// 1003 		else if( ( ( portTickType ) ( ( portTickType ) xTickCount - ( portTickType ) pxTimeOut->xTimeOnEntering ) ) < ( portTickType ) *pxTicksToWait )
??xTaskCheckForTimeOut_2:
        LDR.N    R0,??DataTable29_8
        LDR      R0,[R0, #+0]
        LDR      R1,[R4, #+4]
        SUBS     R0,R0,R1
        LDR      R1,[R5, #+0]
        CMP      R0,R1
        BCS.N    ??xTaskCheckForTimeOut_3
// 1004 		{
// 1005 			*pxTicksToWait -= ( ( portTickType ) xTickCount - ( portTickType ) pxTimeOut->xTimeOnEntering );
        LDR      R0,[R5, #+0]
        LDR.N    R1,??DataTable29_8
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR      R1,[R4, #+4]
        ADDS     R0,R1,R0
        STR      R0,[R5, #+0]
// 1006 			vTaskSetTimeOutState( pxTimeOut );
        MOVS     R0,R4
          CFI FunCall vTaskSetTimeOutState
        BL       vTaskSetTimeOutState
// 1007 			xReturn = pdFALSE;
        MOVS     R0,#+0
        MOVS     R6,R0
        B.N      ??xTaskCheckForTimeOut_1
// 1008 		}
// 1009 		else
// 1010 		{
// 1011 			xReturn = pdTRUE;
??xTaskCheckForTimeOut_3:
        MOVS     R0,#+1
        MOVS     R6,R0
// 1012 		}
// 1013 	}
// 1014 	portEXIT_CRITICAL();
??xTaskCheckForTimeOut_1:
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
// 1015 
// 1016 	return xReturn;
        MOVS     R0,R6
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock23
// 1017 }
// 1018 /********************************************************************************
// 1019 *   Descrição       : 
// 1020 *   Parametros      :   
// 1021 *   Retorno         : 
// 1022 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function vTaskMissedYield
          CFI NoCalls
        THUMB
// 1023 void vTaskMissedYield( void )
// 1024 {
// 1025 	xMissedYield = pdTRUE;
vTaskMissedYield:
        LDR.N    R0,??DataTable29_16
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
// 1026 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock24
// 1027 /********************************************************************************
// 1028 *   Descrição       : 
// 1029 *   Parametros      :   
// 1030 *   Retorno         : 
// 1031 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function prvIdleTask
        THUMB
// 1032 static portTASK_FUNCTION( prvIdleTask, pvParameters )
// 1033 {
prvIdleTask:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
// 1034     /* Stop warnings. */
// 1035     ( void ) pvParameters;
// 1036 
// 1037     for( ;; )
// 1038     {
// 1039       prvCheckTasksWaitingTermination();
??prvIdleTask_0:
          CFI FunCall prvCheckTasksWaitingTermination
        BL       prvCheckTasksWaitingTermination
        B.N      ??prvIdleTask_0
          CFI EndBlock cfiBlock25
// 1040 
// 1041 	#if ( configUSE_PREEMPTION == 0 )
// 1042 		{
// 1043 			taskYIELD();
// 1044 		}
// 1045 		#endif
// 1046 
// 1047 		#if ( ( configUSE_PREEMPTION == 1 ) && ( configIDLE_SHOULD_YIELD == 1 ) )
// 1048 		{
// 1049 			if( listCURRENT_LIST_LENGTH( &( pxReadyTasksLists[ tskIDLE_PRIORITY ] ) ) > ( unsigned portBASE_TYPE ) 1 )
// 1050 			{
// 1051 				taskYIELD();
// 1052 			}
// 1053 		}
// 1054 		#endif
// 1055 	}
// 1056 }
// 1057 /********************************************************************************
// 1058 *   Descrição       : 
// 1059 *   Parametros      :   
// 1060 *   Retorno         : 
// 1061 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock26 Using cfiCommon0
          CFI Function prvInitialiseTCBVariables
        THUMB
// 1062 static void prvInitialiseTCBVariables( tskTCB *pxTCB, const signed char * const pcName, unsigned portBASE_TYPE uxPriority, const xMemoryRegion * const xRegions, unsigned short usStackDepth ){
prvInitialiseTCBVariables:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
// 1063   
// 1064     strncpy( ( char * ) pxTCB->pcTaskName, ( const char * ) pcName, ( unsigned short ) configMAX_TASK_NAME_LEN );
        MOVS     R2,#+12
        MOVS     R1,R5
        ADDS     R0,R4,#+52
          CFI FunCall strncpy
        BL       strncpy
// 1065     pxTCB->pcTaskName[ ( unsigned short ) configMAX_TASK_NAME_LEN - ( unsigned short ) 1 ] = '\0';
        MOVS     R0,#+0
        STRB     R0,[R4, #+63]
// 1066     if( uxPriority >= configMAX_PRIORITIES )
        CMP      R6,#+5
        BCC.N    ??prvInitialiseTCBVariables_0
// 1067 	uxPriority = configMAX_PRIORITIES - 1;
        MOVS     R0,#+4
        MOVS     R6,R0
// 1068 
// 1069     pxTCB->uxPriority = uxPriority;
??prvInitialiseTCBVariables_0:
        STR      R6,[R4, #+44]
// 1070     pxTCB->uxBasePriority = uxPriority;
        STR      R6,[R4, #+72]
// 1071 
// 1072     vListInitialiseItem( &( pxTCB->xGenericListItem ) );
        ADDS     R0,R4,#+4
          CFI FunCall vListInitialiseItem
        BL       vListInitialiseItem
// 1073     vListInitialiseItem( &( pxTCB->xEventListItem ) );
        ADDS     R0,R4,#+24
          CFI FunCall vListInitialiseItem
        BL       vListInitialiseItem
// 1074     listSET_LIST_ITEM_OWNER( &( pxTCB->xGenericListItem ), pxTCB );
        STR      R4,[R4, #+16]
// 1075     listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), configMAX_PRIORITIES - ( portTickType ) uxPriority );
        RSBS     R0,R6,#+5
        STR      R0,[R4, #+24]
// 1076     listSET_LIST_ITEM_OWNER( &( pxTCB->xEventListItem ), pxTCB );
        STR      R4,[R4, #+36]
// 1077     ( void ) xRegions;
// 1078     ( void ) usStackDepth;
// 1079 }
        POP      {R0,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock26
// 1080 /********************************************************************************
// 1081 *   Descrição       : 
// 1082 *   Parametros      :   
// 1083 *   Retorno         : 
// 1084 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock27 Using cfiCommon0
          CFI Function prvInitialiseTaskLists
        THUMB
// 1085 static void prvInitialiseTaskLists( void ){
prvInitialiseTaskLists:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 1086   unsigned portBASE_TYPE uxPriority;
// 1087 
// 1088   for( uxPriority = 0; uxPriority < configMAX_PRIORITIES; uxPriority++ )
        MOVS     R0,#+0
        MOVS     R4,R0
??prvInitialiseTaskLists_0:
        CMP      R4,#+5
        BCS.N    ??prvInitialiseTaskLists_1
// 1089   {
// 1090       vListInitialise( ( xList * ) &( pxReadyTasksLists[ uxPriority ] ) );
        MOVS     R0,#+20
        LDR.N    R1,??DataTable29_5
        MLA      R0,R0,R4,R1
          CFI FunCall vListInitialise
        BL       vListInitialise
// 1091   }
        ADDS     R4,R4,#+1
        B.N      ??prvInitialiseTaskLists_0
// 1092 
// 1093   vListInitialise( ( xList * ) &xDelayedTaskList1 );
??prvInitialiseTaskLists_1:
        LDR.N    R0,??DataTable29_19
          CFI FunCall vListInitialise
        BL       vListInitialise
// 1094   vListInitialise( ( xList * ) &xDelayedTaskList2 );
        LDR.N    R0,??DataTable29_20
          CFI FunCall vListInitialise
        BL       vListInitialise
// 1095   vListInitialise( ( xList * ) &xPendingReadyList );
        LDR.N    R0,??DataTable29_12
          CFI FunCall vListInitialise
        BL       vListInitialise
// 1096   vListInitialise( ( xList * ) &xTasksWaitingTermination );
        LDR.N    R0,??DataTable29_6
          CFI FunCall vListInitialise
        BL       vListInitialise
// 1097   vListInitialise( ( xList * ) &xSuspendedTaskList );
        LDR.N    R0,??DataTable29_11
          CFI FunCall vListInitialise
        BL       vListInitialise
// 1098   pxDelayedTaskList = &xDelayedTaskList1;
        LDR.N    R0,??DataTable29_10
        LDR.N    R1,??DataTable29_19
        STR      R1,[R0, #+0]
// 1099   pxOverflowDelayedTaskList = &xDelayedTaskList2;
        LDR.N    R0,??DataTable29_9
        LDR.N    R1,??DataTable29_20
        STR      R1,[R0, #+0]
// 1100 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock27
// 1101 /********************************************************************************
// 1102 *   Descrição       : 
// 1103 *   Parametros      :   
// 1104 *   Retorno         : 
// 1105 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock28 Using cfiCommon0
          CFI Function prvCheckTasksWaitingTermination
        THUMB
// 1106 static void prvCheckTasksWaitingTermination( void )
// 1107 {
prvCheckTasksWaitingTermination:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
// 1108     portBASE_TYPE xListIsEmpty;
// 1109 
// 1110     if( uxTasksDeleted > ( unsigned portBASE_TYPE ) 0 )
        LDR.N    R0,??DataTable29_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??prvCheckTasksWaitingTermination_0
// 1111     {
// 1112   	vTaskSuspendAll();
          CFI FunCall vTaskSuspendAll
        BL       vTaskSuspendAll
// 1113 	xListIsEmpty = listLIST_IS_EMPTY( &xTasksWaitingTermination );
        LDR.N    R0,??DataTable29_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??prvCheckTasksWaitingTermination_1
        MOVS     R4,#+1
        B.N      ??prvCheckTasksWaitingTermination_2
??prvCheckTasksWaitingTermination_1:
        MOVS     R4,#+0
??prvCheckTasksWaitingTermination_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
// 1114 	xTaskResumeAll();
          CFI FunCall xTaskResumeAll
        BL       xTaskResumeAll
// 1115 
// 1116         if( !xListIsEmpty )
        CMP      R4,#+0
        BNE.N    ??prvCheckTasksWaitingTermination_0
// 1117 	{
// 1118 	    tskTCB *pxTCB;
// 1119 
// 1120 	    portENTER_CRITICAL();
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
// 1121 	    {
// 1122 		pxTCB = ( tskTCB * ) listGET_OWNER_OF_HEAD_ENTRY( ( ( xList * ) &xTasksWaitingTermination ) );
        LDR.N    R0,??DataTable29_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??prvCheckTasksWaitingTermination_3
        LDR.N    R0,??DataTable29_6
        LDR      R0,[R0, #+12]
        LDR      R5,[R0, #+12]
        B.N      ??prvCheckTasksWaitingTermination_4
??prvCheckTasksWaitingTermination_3:
        MOVS     R5,#+0
// 1123 		vListRemove( &( pxTCB->xGenericListItem ) );
??prvCheckTasksWaitingTermination_4:
        ADDS     R0,R5,#+4
          CFI FunCall vListRemove
        BL       vListRemove
// 1124 		--uxCurrentNumberOfTasks;
        LDR.N    R0,??DataTable28
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable28
        STR      R0,[R1, #+0]
// 1125 		--uxTasksDeleted;
        LDR.N    R0,??DataTable29_7
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable29_7
        STR      R0,[R1, #+0]
// 1126 	     }
// 1127 	      portEXIT_CRITICAL();
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
// 1128 
// 1129 	      prvDeleteTCB( pxTCB );
        MOVS     R0,R5
          CFI FunCall prvDeleteTCB
        BL       prvDeleteTCB
// 1130 	}
// 1131      }
// 1132 }
??prvCheckTasksWaitingTermination_0:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock28
// 1133 /********************************************************************************
// 1134 *   Descrição       : 
// 1135 *   Parametros      :   
// 1136 *   Retorno         : 
// 1137 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock29 Using cfiCommon0
          CFI Function prvAllocateTCBAndStack
        THUMB
// 1138 static tskTCB *prvAllocateTCBAndStack( unsigned short usStackDepth, portSTACK_TYPE *puxStackBuffer )
// 1139 {
prvAllocateTCBAndStack:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
// 1140   tskTCB *pxNewTCB;
// 1141 
// 1142   pxNewTCB = ( tskTCB * ) pvPortMalloc( sizeof( tskTCB ) );
        MOVS     R0,#+76
          CFI FunCall pvPortMalloc
        BL       pvPortMalloc
        MOVS     R6,R0
// 1143 
// 1144   if( pxNewTCB != NULL )
        CMP      R6,#+0
        BEQ.N    ??prvAllocateTCBAndStack_0
// 1145   {
// 1146       pxNewTCB->pxStack = ( portSTACK_TYPE * ) pvPortMallocAligned( ( ( ( size_t )usStackDepth ) * sizeof( portSTACK_TYPE ) ), puxStackBuffer );
        CMP      R5,#+0
        BNE.N    ??prvAllocateTCBAndStack_1
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSLS     R0,R4,#+2
          CFI FunCall pvPortMalloc
        BL       pvPortMalloc
        B.N      ??prvAllocateTCBAndStack_2
??prvAllocateTCBAndStack_1:
        MOVS     R0,R5
??prvAllocateTCBAndStack_2:
        STR      R0,[R6, #+48]
// 1147 
// 1148       if( pxNewTCB->pxStack == NULL )
        LDR      R0,[R6, #+48]
        CMP      R0,#+0
        BNE.N    ??prvAllocateTCBAndStack_3
// 1149       {
// 1150         vPortFree( pxNewTCB );
        MOVS     R0,R6
          CFI FunCall vPortFree
        BL       vPortFree
// 1151   	pxNewTCB = NULL;
        MOVS     R0,#+0
        MOVS     R6,R0
        B.N      ??prvAllocateTCBAndStack_0
// 1152       }
// 1153       else
// 1154       {
// 1155   	memset( pxNewTCB->pxStack, tskSTACK_FILL_BYTE, usStackDepth * sizeof( portSTACK_TYPE ) );
??prvAllocateTCBAndStack_3:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSLS     R2,R4,#+2
        MOVS     R1,#+165
        LDR      R0,[R6, #+48]
          CFI FunCall memset
        BL       memset
// 1156       }
// 1157   }
// 1158   return pxNewTCB;
??prvAllocateTCBAndStack_0:
        MOVS     R0,R6
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock29
// 1159 }
// 1160 /********************************************************************************
// 1161 *   Descrição       : 
// 1162 *   Parametros      :   
// 1163 *   Retorno         : 
// 1164 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock30 Using cfiCommon0
          CFI Function usTaskCheckFreeStackSpace
          CFI NoCalls
        THUMB
// 1165 static unsigned short usTaskCheckFreeStackSpace( const unsigned char * pucStackByte ){
usTaskCheckFreeStackSpace:
        MOVS     R1,R0
// 1166   register unsigned short usCount = 0;
        MOVS     R0,#+0
// 1167 
// 1168   while( *pucStackByte == tskSTACK_FILL_BYTE )
??usTaskCheckFreeStackSpace_0:
        LDRB     R2,[R1, #+0]
        CMP      R2,#+165
        BNE.N    ??usTaskCheckFreeStackSpace_1
// 1169   {
// 1170     pucStackByte -= portSTACK_GROWTH;
        ADDS     R1,R1,#+1
// 1171     usCount++;
        ADDS     R0,R0,#+1
        B.N      ??usTaskCheckFreeStackSpace_0
// 1172   }
// 1173 
// 1174   usCount /= sizeof( portSTACK_TYPE );
??usTaskCheckFreeStackSpace_1:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+2
// 1175 
// 1176   return usCount;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock30
// 1177 }
// 1178 /********************************************************************************
// 1179 *   Descrição       : 
// 1180 *   Parametros      :   
// 1181 *   Retorno         : 
// 1182 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock31 Using cfiCommon0
          CFI Function uxTaskGetStackHighWaterMark
        THUMB
// 1183 unsigned portBASE_TYPE uxTaskGetStackHighWaterMark( xTaskHandle xTask )	{
uxTaskGetStackHighWaterMark:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
// 1184   tskTCB *pxTCB;
// 1185   unsigned char *pcEndOfStack;
// 1186   unsigned portBASE_TYPE uxReturn;
// 1187 
// 1188   pxTCB = prvGetTCBFromHandle( xTask );
        CMP      R4,#+0
        BNE.N    ??uxTaskGetStackHighWaterMark_0
        LDR.N    R0,??DataTable29
        LDR      R5,[R0, #+0]
        B.N      ??uxTaskGetStackHighWaterMark_1
??uxTaskGetStackHighWaterMark_0:
        MOVS     R5,R4
// 1189   pcEndOfStack = ( unsigned char * ) pxTCB->pxStack;
??uxTaskGetStackHighWaterMark_1:
        LDR      R0,[R5, #+48]
        MOVS     R6,R0
// 1190 
// 1191   uxReturn = ( unsigned portBASE_TYPE ) usTaskCheckFreeStackSpace( pcEndOfStack );
        MOVS     R0,R6
          CFI FunCall usTaskCheckFreeStackSpace
        BL       usTaskCheckFreeStackSpace
        MOVS     R7,R0
// 1192   return uxReturn;
        MOVS     R0,R7
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock31
// 1193 }
// 1194 /********************************************************************************
// 1195 *   Descrição       : 
// 1196 *   Parametros      :   
// 1197 *   Retorno         : 
// 1198 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock32 Using cfiCommon0
          CFI Function prvDeleteTCB
        THUMB
// 1199 static void prvDeleteTCB( tskTCB *pxTCB ){
prvDeleteTCB:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
// 1200   
// 1201   vPortFreeAligned( pxTCB->pxStack );
        LDR      R0,[R4, #+48]
          CFI FunCall vPortFree
        BL       vPortFree
// 1202   vPortFree( pxTCB );
        MOVS     R0,R4
          CFI FunCall vPortFree
        BL       vPortFree
// 1203 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock32
// 1204 /********************************************************************************
// 1205 *   Descrição       : 
// 1206 *   Parametros      :   
// 1207 *   Retorno         : 
// 1208 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock33 Using cfiCommon0
          CFI Function xTaskGetCurrentTaskHandle
          CFI NoCalls
        THUMB
// 1209 xTaskHandle xTaskGetCurrentTaskHandle( void ){
// 1210   xTaskHandle xReturn;
// 1211 	
// 1212   xReturn = pxCurrentTCB;
xTaskGetCurrentTaskHandle:
        LDR.N    R1,??DataTable29
        LDR      R1,[R1, #+0]
        MOVS     R0,R1
// 1213   
// 1214   return xReturn;
        BX       LR               ;; return
          CFI EndBlock cfiBlock33
// 1215 }
// 1216 /********************************************************************************
// 1217 *   Descrição       : 
// 1218 *   Parametros      :   
// 1219 *   Retorno         : 
// 1220 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock34 Using cfiCommon0
          CFI Function vTaskPriorityInherit
        THUMB
// 1221 void vTaskPriorityInherit( xTaskHandle * const pxMutexHolder )	{
vTaskPriorityInherit:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
// 1222   tskTCB * const pxTCB = ( tskTCB * ) pxMutexHolder;
        MOVS     R5,R4
// 1223 
// 1224   if( pxTCB->uxPriority < pxCurrentTCB->uxPriority ){
        LDR      R0,[R5, #+44]
        LDR.N    R1,??DataTable29
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+44]
        CMP      R0,R1
        BCS.N    ??vTaskPriorityInherit_0
// 1225     
// 1226     listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), configMAX_PRIORITIES - ( portTickType ) pxCurrentTCB->uxPriority );
        LDR.N    R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+44]
        RSBS     R0,R0,#+5
        STR      R0,[R5, #+24]
// 1227     if( listIS_CONTAINED_WITHIN( &( pxReadyTasksLists[ pxTCB->uxPriority ] ), &( pxTCB->xGenericListItem ) ) )			{
        LDR      R0,[R5, #+20]
        LDR      R1,[R5, #+44]
        MOVS     R2,#+20
        LDR.N    R3,??DataTable29_5
        MLA      R1,R2,R1,R3
        CMP      R0,R1
        BNE.N    ??vTaskPriorityInherit_1
// 1228       vListRemove( &( pxTCB->xGenericListItem ) );
        ADDS     R0,R5,#+4
          CFI FunCall vListRemove
        BL       vListRemove
// 1229       pxTCB->uxPriority = pxCurrentTCB->uxPriority;
        LDR.N    R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+44]
        STR      R0,[R5, #+44]
// 1230       prvAddTaskToReadyQueue( pxTCB );
        LDR.N    R0,??DataTable29_4
        LDR      R0,[R0, #+0]
        LDR      R1,[R5, #+44]
        CMP      R0,R1
        BCS.N    ??vTaskPriorityInherit_2
        LDR      R0,[R5, #+44]
        LDR.N    R1,??DataTable29_4
        STR      R0,[R1, #+0]
??vTaskPriorityInherit_2:
        ADDS     R1,R5,#+4
        LDR      R0,[R5, #+44]
        MOVS     R2,#+20
        LDR.N    R3,??DataTable29_5
        MLA      R0,R2,R0,R3
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
        B.N      ??vTaskPriorityInherit_0
// 1231     }
// 1232     else
// 1233       pxTCB->uxPriority = pxCurrentTCB->uxPriority;
??vTaskPriorityInherit_1:
        LDR.N    R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+44]
        STR      R0,[R5, #+44]
// 1234     }
// 1235 }
??vTaskPriorityInherit_0:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock34

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28:
        DC32     uxCurrentNumberOfTasks
// 1236 /********************************************************************************
// 1237 *   Descrição       : 
// 1238 *   Parametros      :   
// 1239 *   Retorno         : 
// 1240 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock35 Using cfiCommon0
          CFI Function vTaskPriorityDisinherit
        THUMB
// 1241 void vTaskPriorityDisinherit( xTaskHandle * const pxMutexHolder ){
vTaskPriorityDisinherit:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
// 1242   tskTCB * const pxTCB = ( tskTCB * ) pxMutexHolder;
        MOVS     R5,R4
// 1243 
// 1244   if( pxMutexHolder != NULL )
        CMP      R4,#+0
        BEQ.N    ??vTaskPriorityDisinherit_0
// 1245   {
// 1246      if( pxTCB->uxPriority != pxTCB->uxBasePriority )
        LDR      R0,[R5, #+44]
        LDR      R1,[R5, #+72]
        CMP      R0,R1
        BEQ.N    ??vTaskPriorityDisinherit_0
// 1247      {
// 1248 	vListRemove( &( pxTCB->xGenericListItem ) );
        ADDS     R0,R5,#+4
          CFI FunCall vListRemove
        BL       vListRemove
// 1249 	pxTCB->uxPriority = pxTCB->uxBasePriority;
        LDR      R0,[R5, #+72]
        STR      R0,[R5, #+44]
// 1250 	listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), configMAX_PRIORITIES - ( portTickType ) pxTCB->uxPriority );
        LDR      R0,[R5, #+44]
        RSBS     R0,R0,#+5
        STR      R0,[R5, #+24]
// 1251 	prvAddTaskToReadyQueue( pxTCB );
        LDR.N    R0,??DataTable29_4
        LDR      R0,[R0, #+0]
        LDR      R1,[R5, #+44]
        CMP      R0,R1
        BCS.N    ??vTaskPriorityDisinherit_1
        LDR      R0,[R5, #+44]
        LDR.N    R1,??DataTable29_4
        STR      R0,[R1, #+0]
??vTaskPriorityDisinherit_1:
        ADDS     R1,R5,#+4
        LDR      R0,[R5, #+44]
        MOVS     R2,#+20
        LDR.N    R3,??DataTable29_5
        MLA      R0,R2,R0,R3
          CFI FunCall vListInsertEnd
        BL       vListInsertEnd
// 1252       }
// 1253    }
// 1254 }
??vTaskPriorityDisinherit_0:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock35

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29:
        DC32     pxCurrentTCB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_1:
        DC32     xSchedulerRunning

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_2:
        DC32     uxTopUsedPriority

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_3:
        DC32     uxTaskNumber

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_4:
        DC32     uxTopReadyPriority

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_5:
        DC32     pxReadyTasksLists

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_6:
        DC32     xTasksWaitingTermination

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_7:
        DC32     uxTasksDeleted

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_8:
        DC32     xTickCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_9:
        DC32     pxOverflowDelayedTaskList

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_10:
        DC32     pxDelayedTaskList

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_11:
        DC32     xSuspendedTaskList

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_12:
        DC32     xPendingReadyList

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_13:
        DC32     uxSchedulerSuspended

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_14:
        DC32     `?<Constant "IDLE">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_15:
        DC32     uxMissedTicks

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_16:
        DC32     xMissedYield

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_17:
        DC32     xNumOfOverflows

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_18:
        DC32     ??ucExpectedStackBytes

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_19:
        DC32     xDelayedTaskList1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_20:
        DC32     xDelayedTaskList2

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 1255 /********************************************************************************
// 1256 *     Fim do arquivo
// 1257 ********************************************************************************/
// 1258 
// 1259 
// 1260 
// 1261 
// 
//   256 bytes in section .bss
//    28 bytes in section .rodata
// 3 092 bytes in section .text
// 
// 3 070 bytes of CODE  memory (+ 22 bytes shared)
//    28 bytes of CONST memory
//   256 bytes of DATA  memory
//
//Errors: none
//Warnings: none
