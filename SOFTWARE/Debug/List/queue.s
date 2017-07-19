///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     17/Jul/2017  15:15:32 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Kernel\queue.c                          /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Kernel\queue.c -lC                      /
//                    C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Debug\List\ -lA                         /
//                    C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Debug\List\ -o                          /
//                    C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Debug\Obj\ --no_cse --no_unroll         /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -Ol                 /
//    List file    =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Debug\List\queue.s                      /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME queue

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memcpy
        EXTERN pvPortMalloc
        EXTERN vListInitialise
        EXTERN vPortClearInterruptMask
        EXTERN vPortEnterCritical
        EXTERN vPortExitCritical
        EXTERN vPortFree
        EXTERN vPortSetInterruptMask
        EXTERN vPortYieldFromISR
        EXTERN vTaskMissedYield
        EXTERN vTaskPlaceOnEventList
        EXTERN vTaskPriorityDisinherit
        EXTERN vTaskPriorityInherit
        EXTERN vTaskSetTimeOutState
        EXTERN vTaskSuspendAll
        EXTERN xTaskCheckForTimeOut
        EXTERN xTaskGetCurrentTaskHandle
        EXTERN xTaskRemoveFromEventList
        EXTERN xTaskResumeAll

        PUBLIC memcpy
        PUBLIC uxQueueMessagesWaiting
        PUBLIC uxQueueMessagesWaitingFromISR
        PUBLIC vQueueAddToRegistry
        PUBLIC vQueueDelete
        PUBLIC xQueueCreate
        PUBLIC xQueueCreateMutex
        PUBLIC xQueueGenericReceive
        PUBLIC xQueueGenericSend
        PUBLIC xQueueGenericSendFromISR
        PUBLIC xQueueGiveMutexRecursive
        PUBLIC xQueueIsQueueEmptyFromISR
        PUBLIC xQueueIsQueueFullFromISR
        PUBLIC xQueueReceiveFromISR
        PUBLIC xQueueRegistry
        PUBLIC xQueueTakeMutexRecursive
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Kernel\queue.c
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
//   32 #include <stdlib.h>
//   33 #include <string.h>

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP memcpy
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function memcpy
        THUMB
// __intrinsic __nounwind __interwork __softfp void *memcpy(void *, void const *, size_t)
memcpy:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   34 #define MPU_WRAPPERS_INCLUDED_FROM_API_FILE
//   35   #include "FreeRTOS.h"
//   36   #include "task.h"
//   37 #undef MPU_WRAPPERS_INCLUDED_FROM_API_FILE
//   38 /********************************************************************************
//   39 *   Definições
//   40 ********************************************************************************/
//   41 #define queueUNLOCKED				( ( signed portBASE_TYPE ) -1 )
//   42 #define queueLOCKED_UNMODIFIED			( ( signed portBASE_TYPE ) 0 )
//   43 #define queueERRONEOUS_UNBLOCK			( -1 )
//   44 #define	queueSEND_TO_BACK			( 0 )
//   45 #define	queueSEND_TO_FRONT			( 1 )
//   46 #define pxMutexHolder				pcTail
//   47 #define uxQueueType				pcHead
//   48 #define uxRecursiveCallCount			pcReadFrom
//   49 #define queueQUEUE_IS_MUTEX			NULL
//   50 #define queueSEMAPHORE_QUEUE_ITEM_LENGTH        ( 0 )
//   51 #define queueDONT_BLOCK			        ( ( portTickType ) 0 )
//   52 #define queueMUTEX_GIVE_BLOCK_TIME		( ( portTickType ) 0 )
//   53 /********************************************************************************
//   54 *   Estruturas
//   55 ********************************************************************************/
//   56 typedef struct QueueDefinition{
//   57   signed char *pcHead;
//   58   signed char *pcTail;
//   59   signed char *pcWriteTo;
//   60   signed char *pcReadFrom;
//   61   xList xTasksWaitingToSend;
//   62   xList xTasksWaitingToReceive;
//   63   volatile unsigned portBASE_TYPE uxMessagesWaiting;
//   64   unsigned portBASE_TYPE uxLength;		
//   65   unsigned portBASE_TYPE uxItemSize;		
//   66   signed portBASE_TYPE xRxLock;			
//   67   signed portBASE_TYPE xTxLock;		
//   68 } xQUEUE;
//   69 
//   70 typedef xQUEUE * xQueueHandle;
//   71 
//   72 typedef struct QUEUE_REGISTRY_ITEM
//   73 {
//   74   signed char *pcQueueName;
//   75   xQueueHandle xHandle;
//   76 } xQueueRegistryItem;
//   77 
//   78 /********************************************************************************
//   79 *   Funções locais
//   80 ********************************************************************************/
//   81 xQueueHandle xQueueCreate( unsigned portBASE_TYPE uxQueueLength, unsigned portBASE_TYPE uxItemSize ) PRIVILEGED_FUNCTION;
//   82 signed portBASE_TYPE xQueueGenericSend( xQueueHandle xQueue, const void * const pvItemToQueue, portTickType xTicksToWait, portBASE_TYPE xCopyPosition ) PRIVILEGED_FUNCTION;
//   83 unsigned portBASE_TYPE uxQueueMessagesWaiting( const xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
//   84 void vQueueDelete( xQueueHandle xQueue ) PRIVILEGED_FUNCTION;
//   85 signed portBASE_TYPE xQueueGenericSendFromISR( xQueueHandle pxQueue, const void * const pvItemToQueue, signed portBASE_TYPE *pxHigherPriorityTaskWoken, portBASE_TYPE xCopyPosition ) PRIVILEGED_FUNCTION;
//   86 signed portBASE_TYPE xQueueGenericReceive( xQueueHandle pxQueue, void * const pvBuffer, portTickType xTicksToWait, portBASE_TYPE xJustPeeking ) PRIVILEGED_FUNCTION;
//   87 signed portBASE_TYPE xQueueReceiveFromISR( xQueueHandle pxQueue, void * const pvBuffer, signed portBASE_TYPE *pxTaskWoken ) PRIVILEGED_FUNCTION;
//   88 xQueueHandle xQueueCreateMutex( void ) PRIVILEGED_FUNCTION;
//   89 xQueueHandle xQueueCreateCountingSemaphore( unsigned portBASE_TYPE uxCountValue, unsigned portBASE_TYPE uxInitialCount ) PRIVILEGED_FUNCTION;
//   90 portBASE_TYPE xQueueTakeMutexRecursive( xQueueHandle xMutex, portTickType xBlockTime ) PRIVILEGED_FUNCTION;
//   91 portBASE_TYPE xQueueGiveMutexRecursive( xQueueHandle xMutex ) PRIVILEGED_FUNCTION;
//   92 signed portBASE_TYPE xQueueAltGenericSend( xQueueHandle pxQueue, const void * const pvItemToQueue, portTickType xTicksToWait, portBASE_TYPE xCopyPosition ) PRIVILEGED_FUNCTION;
//   93 signed portBASE_TYPE xQueueAltGenericReceive( xQueueHandle pxQueue, void * const pvBuffer, portTickType xTicksToWait, portBASE_TYPE xJustPeeking ) PRIVILEGED_FUNCTION;
//   94 signed portBASE_TYPE xQueueIsQueueEmptyFromISR( const xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
//   95 signed portBASE_TYPE xQueueIsQueueFullFromISR( const xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
//   96 unsigned portBASE_TYPE uxQueueMessagesWaitingFromISR( const xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
//   97 void vQueueAddToRegistry( xQueueHandle xQueue, signed char *pcQueueName ) PRIVILEGED_FUNCTION;
//   98 static void vQueueUnregisterQueue( xQueueHandle xQueue ) PRIVILEGED_FUNCTION;;
//   99 static void prvUnlockQueue( xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
//  100 static signed portBASE_TYPE prvIsQueueEmpty( const xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
//  101 static signed portBASE_TYPE prvIsQueueFull( const xQueueHandle pxQueue ) PRIVILEGED_FUNCTION;
//  102 static void prvCopyDataToQueue( xQUEUE *pxQueue, const void *pvItemToQueue, portBASE_TYPE xPosition ) PRIVILEGED_FUNCTION;
//  103 static void prvCopyDataFromQueue( xQUEUE * const pxQueue, const void *pvBuffer ) PRIVILEGED_FUNCTION;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  104 xQueueRegistryItem xQueueRegistry[ configQUEUE_REGISTRY_SIZE ];
xQueueRegistry:
        DS8 80
//  105 /********************************************************************************
//  106 *   Macros
//  107 ********************************************************************************/
//  108 #define prvLockQueue( pxQueue )							\ 
//  109 {														\ 
//  110 	taskENTER_CRITICAL();								\ 
//  111 	{													\ 
//  112 		if( pxQueue->xRxLock == queueUNLOCKED )			\ 
//  113 		{												\ 
//  114 			pxQueue->xRxLock = queueLOCKED_UNMODIFIED;	\ 
//  115 		}												\ 
//  116 		if( pxQueue->xTxLock == queueUNLOCKED )			\ 
//  117 		{												\ 
//  118 			pxQueue->xTxLock = queueLOCKED_UNMODIFIED;	\ 
//  119 		}												\ 
//  120 	}													\ 
//  121 	taskEXIT_CRITICAL();								\ 
//  122 }
//  123 /********************************************************************************
//  124 *   Descrição   : 
//  125 *   Parametros  : 
//  126 *   Retorno     : 
//  127 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function xQueueCreate
        THUMB
//  128 xQueueHandle xQueueCreate( unsigned portBASE_TYPE uxQueueLength, unsigned portBASE_TYPE uxItemSize )
//  129 {
xQueueCreate:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  130   xQUEUE *pxNewQueue;
//  131   size_t xQueueSizeInBytes; 
//  132 
//  133   if( uxQueueLength > ( unsigned portBASE_TYPE ) 0 )
        CMP      R4,#+0
        BEQ.N    ??xQueueCreate_0
//  134   {
//  135     pxNewQueue = ( xQUEUE * ) pvPortMalloc( sizeof( xQUEUE ) );
        MOVS     R0,#+76
          CFI FunCall pvPortMalloc
        BL       pvPortMalloc
        MOVS     R6,R0
//  136     if( pxNewQueue != NULL )
        CMP      R6,#+0
        BEQ.N    ??xQueueCreate_0
//  137     {
//  138       xQueueSizeInBytes = ( size_t ) ( uxQueueLength * uxItemSize ) + ( size_t ) 1;
        MUL      R0,R5,R4
        ADDS     R0,R0,#+1
//  139       pxNewQueue->pcHead = ( signed char * ) pvPortMalloc( xQueueSizeInBytes );
          CFI FunCall pvPortMalloc
        BL       pvPortMalloc
        STR      R0,[R6, #+0]
//  140       if( pxNewQueue->pcHead != NULL )
        LDR      R0,[R6, #+0]
        CMP      R0,#+0
        BEQ.N    ??xQueueCreate_1
//  141       { 
//  142         pxNewQueue->pcTail = pxNewQueue->pcHead + ( uxQueueLength * uxItemSize );
        LDR      R0,[R6, #+0]
        MLA      R0,R5,R4,R0
        STR      R0,[R6, #+4]
//  143 	pxNewQueue->uxMessagesWaiting = 0;
        MOVS     R0,#+0
        STR      R0,[R6, #+56]
//  144 	pxNewQueue->pcWriteTo = pxNewQueue->pcHead;
        LDR      R0,[R6, #+0]
        STR      R0,[R6, #+8]
//  145 	pxNewQueue->pcReadFrom = pxNewQueue->pcHead + ( ( uxQueueLength - 1 ) * uxItemSize );
        SUBS     R0,R4,#+1
        LDR      R1,[R6, #+0]
        MLA      R0,R5,R0,R1
        STR      R0,[R6, #+12]
//  146 	pxNewQueue->uxLength = uxQueueLength;
        STR      R4,[R6, #+60]
//  147 	pxNewQueue->uxItemSize = uxItemSize;
        STR      R5,[R6, #+64]
//  148 	pxNewQueue->xRxLock = queueUNLOCKED;
        MOVS     R0,#-1
        STR      R0,[R6, #+68]
//  149 	pxNewQueue->xTxLock = queueUNLOCKED;
        MOVS     R0,#-1
        STR      R0,[R6, #+72]
//  150 
//  151 	vListInitialise( &( pxNewQueue->xTasksWaitingToSend ) );
        ADDS     R0,R6,#+16
          CFI FunCall vListInitialise
        BL       vListInitialise
//  152 	vListInitialise( &( pxNewQueue->xTasksWaitingToReceive ) );
        ADDS     R0,R6,#+36
          CFI FunCall vListInitialise
        BL       vListInitialise
//  153 
//  154 	traceQUEUE_CREATE( pxNewQueue );
//  155 	return  pxNewQueue;
        MOVS     R0,R6
        B.N      ??xQueueCreate_2
//  156       }
//  157       else
//  158       {
//  159           traceQUEUE_CREATE_FAILED();
//  160 	  vPortFree( pxNewQueue );
??xQueueCreate_1:
        MOVS     R0,R6
          CFI FunCall vPortFree
        BL       vPortFree
//  161       } 
//  162     }
//  163   }
//  164 
//  165   return NULL;
??xQueueCreate_0:
        MOVS     R0,#+0
??xQueueCreate_2:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock1
//  166 }
//  167 /********************************************************************************
//  168 *   Descrição     : 
//  169 *   Parametros    : 
//  170 *   Retorno       : 
//  171 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function xQueueCreateMutex
        THUMB
//  172 xQueueHandle xQueueCreateMutex( void )	{
xQueueCreateMutex:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  173     xQUEUE *pxNewQueue;
//  174 
//  175     pxNewQueue = ( xQUEUE * ) pvPortMalloc( sizeof( xQUEUE ) );
        MOVS     R0,#+76
          CFI FunCall pvPortMalloc
        BL       pvPortMalloc
        MOVS     R4,R0
//  176     if( pxNewQueue != NULL )
        CMP      R4,#+0
        BEQ.N    ??xQueueCreateMutex_0
//  177     {
//  178         pxNewQueue->pxMutexHolder = NULL;
        MOVS     R0,#+0
        STR      R0,[R4, #+4]
//  179 	pxNewQueue->uxQueueType = queueQUEUE_IS_MUTEX;
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
//  180 
//  181 	pxNewQueue->pcWriteTo = NULL;
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
//  182 	pxNewQueue->pcReadFrom = NULL;
        MOVS     R0,#+0
        STR      R0,[R4, #+12]
//  183 
//  184 	pxNewQueue->uxMessagesWaiting = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+56]
//  185 	pxNewQueue->uxLength = 1;
        MOVS     R0,#+1
        STR      R0,[R4, #+60]
//  186 	pxNewQueue->uxItemSize = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+64]
//  187 	pxNewQueue->xRxLock = queueUNLOCKED;
        MOVS     R0,#-1
        STR      R0,[R4, #+68]
//  188 	pxNewQueue->xTxLock = queueUNLOCKED;
        MOVS     R0,#-1
        STR      R0,[R4, #+72]
//  189         
//  190 	vListInitialise( &( pxNewQueue->xTasksWaitingToSend ) );
        ADDS     R0,R4,#+16
          CFI FunCall vListInitialise
        BL       vListInitialise
//  191 	vListInitialise( &( pxNewQueue->xTasksWaitingToReceive ) );
        ADDS     R0,R4,#+36
          CFI FunCall vListInitialise
        BL       vListInitialise
//  192 
//  193 	xQueueGenericSend( pxNewQueue, NULL, 0, queueSEND_TO_BACK );
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  194 
//  195 	traceCREATE_MUTEX( pxNewQueue );
//  196     }
//  197     else
//  198     {
//  199 	traceCREATE_MUTEX_FAILED();
//  200     }
//  201 
//  202     return pxNewQueue;
??xQueueCreateMutex_0:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
//  203 }
//  204 /********************************************************************************
//  205 *   Descrição     :   
//  206 *   Parametros    : 
//  207 *   Retorno       : 
//  208 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function xQueueGiveMutexRecursive
        THUMB
//  209 portBASE_TYPE xQueueGiveMutexRecursive( xQueueHandle pxMutex )
//  210 {
xQueueGiveMutexRecursive:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  211     portBASE_TYPE xReturn;
//  212 
//  213     if( pxMutex->pxMutexHolder == xTaskGetCurrentTaskHandle() )
        LDR      R5,[R4, #+4]
          CFI FunCall xTaskGetCurrentTaskHandle
        BL       xTaskGetCurrentTaskHandle
        CMP      R5,R0
        BNE.N    ??xQueueGiveMutexRecursive_0
//  214     {
//  215 	traceGIVE_MUTEX_RECURSIVE( pxMutex );
//  216 
//  217 	( pxMutex->uxRecursiveCallCount )--;
        LDR      R0,[R4, #+12]
        SUBS     R0,R0,#+1
        STR      R0,[R4, #+12]
//  218 	if( pxMutex->uxRecursiveCallCount == 0 )
        LDR      R0,[R4, #+12]
        CMP      R0,#+0
        BNE.N    ??xQueueGiveMutexRecursive_1
//  219 	{
//  220 	    xQueueGenericSend( pxMutex, NULL, queueMUTEX_GIVE_BLOCK_TIME, queueSEND_TO_BACK );
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  221 	}
//  222 	xReturn = pdPASS;
??xQueueGiveMutexRecursive_1:
        MOVS     R0,#+1
        B.N      ??xQueueGiveMutexRecursive_2
//  223     }
//  224     else
//  225     {
//  226 	xReturn = pdFAIL;
??xQueueGiveMutexRecursive_0:
        MOVS     R0,#+0
//  227 
//  228 	traceGIVE_MUTEX_RECURSIVE_FAILED( pxMutex );
//  229     }
//  230     return xReturn;
??xQueueGiveMutexRecursive_2:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock3
//  231 }
//  232 /********************************************************************************
//  233 *   Descrição   :
//  234 *   Parametros  : 
//  235 *   Retorno     : 
//  236 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function xQueueTakeMutexRecursive
        THUMB
//  237 portBASE_TYPE xQueueTakeMutexRecursive( xQueueHandle pxMutex, portTickType xBlockTime )
//  238 {
xQueueTakeMutexRecursive:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  239     portBASE_TYPE xReturn;
//  240 
//  241     traceTAKE_MUTEX_RECURSIVE( pxMutex );
//  242 
//  243     if( pxMutex->pxMutexHolder == xTaskGetCurrentTaskHandle() )
        LDR      R6,[R4, #+4]
          CFI FunCall xTaskGetCurrentTaskHandle
        BL       xTaskGetCurrentTaskHandle
        CMP      R6,R0
        BNE.N    ??xQueueTakeMutexRecursive_0
//  244     {
//  245 	  ( pxMutex->uxRecursiveCallCount )++;
        LDR      R0,[R4, #+12]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+12]
//  246 	    xReturn = pdPASS;
        MOVS     R0,#+1
        B.N      ??xQueueTakeMutexRecursive_1
//  247     }
//  248     else
//  249     {
//  250 	xReturn = xQueueGenericReceive( pxMutex, NULL, xBlockTime, pdFALSE );
??xQueueTakeMutexRecursive_0:
        MOVS     R3,#+0
        MOVS     R2,R5
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
//  251 
//  252         if( xReturn == pdPASS )
        CMP      R0,#+1
        BNE.N    ??xQueueTakeMutexRecursive_1
//  253 	{
//  254 	  ( pxMutex->uxRecursiveCallCount )++;
        LDR      R1,[R4, #+12]
        ADDS     R1,R1,#+1
        STR      R1,[R4, #+12]
//  255 	}
//  256 	else
//  257 	{
//  258 	  traceTAKE_MUTEX_RECURSIVE_FAILED( pxMutex );
//  259 	}
//  260     }
//  261 
//  262     return xReturn;
??xQueueTakeMutexRecursive_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock4
//  263 }
//  264 /********************************************************************************
//  265 *   Descrição     :   
//  266 *   Parametros    : 
//  267 *   Retorno       : 
//  268 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function xQueueGenericSend
        THUMB
//  269 signed portBASE_TYPE xQueueGenericSend( xQueueHandle pxQueue, const void * const pvItemToQueue, portTickType xTicksToWait, portBASE_TYPE xCopyPosition )
//  270 {
xQueueGenericSend:
        PUSH     {R0-R2,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R3
//  271   signed portBASE_TYPE xEntryTimeSet = pdFALSE;
        MOVS     R7,#+0
        B.N      ??xQueueGenericSend_0
//  272   xTimeOutType xTimeOut;
//  273 
//  274   for( ;; )
//  275   {
//  276       taskENTER_CRITICAL();
//  277       {
//  278 	if( pxQueue->uxMessagesWaiting < pxQueue->uxLength )
//  279 	{
//  280 	    traceQUEUE_SEND( pxQueue );
//  281 	    prvCopyDataToQueue( pxQueue, pvItemToQueue, xCopyPosition );
//  282 
//  283 	    if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
//  284 	    {
//  285 		if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) == pdTRUE )
//  286 		{
//  287 		    portYIELD_WITHIN_API();
//  288 		}
//  289 	    }
//  290 
//  291             taskEXIT_CRITICAL();
//  292 
//  293 	return pdPASS;
//  294    }
//  295     else
//  296     {
//  297 	if( xTicksToWait == ( portTickType ) 0 )
//  298 	 {
//  299 	    taskEXIT_CRITICAL();
//  300 
//  301 	    traceQUEUE_SEND_FAILED( pxQueue );
//  302 	    return errQUEUE_FULL;
//  303 	  }
//  304 	else if( xEntryTimeSet == pdFALSE )
//  305 	{
//  306 	    vTaskSetTimeOutState( &xTimeOut );
//  307 	    xEntryTimeSet = pdTRUE;
//  308 	}
//  309     }
//  310   }
//  311   taskEXIT_CRITICAL();
//  312 
//  313    vTaskSuspendAll();
//  314    prvLockQueue( pxQueue );
//  315 
//  316     if( xTaskCheckForTimeOut( &xTimeOut, &xTicksToWait ) == pdFALSE )
//  317     {
//  318 	if( prvIsQueueFull( pxQueue ) )
//  319 	{
//  320 	    traceBLOCKING_ON_QUEUE_SEND( pxQueue );
//  321 	    vTaskPlaceOnEventList( &( pxQueue->xTasksWaitingToSend ), xTicksToWait );
//  322       	    prvUnlockQueue( pxQueue );
//  323     	    if( !xTaskResumeAll() )
//  324 	    {
//  325 		portYIELD_WITHIN_API();
//  326 	    }
//  327 	}
//  328 	else
//  329 	{
//  330 	    prvUnlockQueue( pxQueue );
??xQueueGenericSend_1:
        MOVS     R0,R4
          CFI FunCall prvUnlockQueue
        BL       prvUnlockQueue
//  331 	    ( void ) xTaskResumeAll();
          CFI FunCall xTaskResumeAll
        BL       xTaskResumeAll
//  332 	}
??xQueueGenericSend_0:
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+60]
        CMP      R0,R1
        BCS.N    ??xQueueGenericSend_2
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall prvCopyDataToQueue
        BL       prvCopyDataToQueue
        LDR      R0,[R4, #+36]
        CMP      R0,#+0
        BEQ.N    ??xQueueGenericSend_3
        ADDS     R0,R4,#+36
          CFI FunCall xTaskRemoveFromEventList
        BL       xTaskRemoveFromEventList
        CMP      R0,#+1
        BNE.N    ??xQueueGenericSend_3
          CFI FunCall vPortYieldFromISR
        BL       vPortYieldFromISR
??xQueueGenericSend_3:
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
        MOVS     R0,#+1
        B.N      ??xQueueGenericSend_4
??xQueueGenericSend_2:
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??xQueueGenericSend_5
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
        MOVS     R0,#+0
        B.N      ??xQueueGenericSend_4
??xQueueGenericSend_5:
        CMP      R7,#+0
        BNE.N    ??xQueueGenericSend_6
        ADD      R0,SP,#+0
          CFI FunCall vTaskSetTimeOutState
        BL       vTaskSetTimeOutState
        MOVS     R7,#+1
??xQueueGenericSend_6:
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
          CFI FunCall vTaskSuspendAll
        BL       vTaskSuspendAll
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
        LDR      R0,[R4, #+68]
        CMN      R0,#+1
        BNE.N    ??xQueueGenericSend_7
        MOVS     R0,#+0
        STR      R0,[R4, #+68]
??xQueueGenericSend_7:
        LDR      R0,[R4, #+72]
        CMN      R0,#+1
        BNE.N    ??xQueueGenericSend_8
        MOVS     R0,#+0
        STR      R0,[R4, #+72]
??xQueueGenericSend_8:
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
        ADD      R1,SP,#+8
        ADD      R0,SP,#+0
          CFI FunCall xTaskCheckForTimeOut
        BL       xTaskCheckForTimeOut
        CMP      R0,#+0
        BNE.N    ??xQueueGenericSend_9
        MOVS     R0,R4
          CFI FunCall prvIsQueueFull
        BL       prvIsQueueFull
        CMP      R0,#+0
        BEQ.N    ??xQueueGenericSend_1
        LDR      R1,[SP, #+8]
        ADDS     R0,R4,#+16
          CFI FunCall vTaskPlaceOnEventList
        BL       vTaskPlaceOnEventList
        MOVS     R0,R4
          CFI FunCall prvUnlockQueue
        BL       prvUnlockQueue
          CFI FunCall xTaskResumeAll
        BL       xTaskResumeAll
        CMP      R0,#+0
        BNE.N    ??xQueueGenericSend_0
          CFI FunCall vPortYieldFromISR
        BL       vPortYieldFromISR
        B.N      ??xQueueGenericSend_0
//  333     }
//  334     else
//  335     {
//  336 	prvUnlockQueue( pxQueue );
??xQueueGenericSend_9:
        MOVS     R0,R4
          CFI FunCall prvUnlockQueue
        BL       prvUnlockQueue
//  337 	( void ) xTaskResumeAll();
          CFI FunCall xTaskResumeAll
        BL       xTaskResumeAll
        MOVS     R1,R0
//  338         traceQUEUE_SEND_FAILED( pxQueue );
//  339 	return errQUEUE_FULL;
        MOVS     R0,#+0
??xQueueGenericSend_4:
        POP      {R1-R7,PC}       ;; return
          CFI EndBlock cfiBlock5
//  340     }
//  341   }
//  342 }
//  343 /********************************************************************************
//  344 *     Descrição     : 
//  345 *     Parametros    : 
//  346 *     Retorno       : 
//  347 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function xQueueGenericSendFromISR
        THUMB
//  348 signed portBASE_TYPE xQueueGenericSendFromISR( xQueueHandle pxQueue, const void * const pvItemToQueue, signed portBASE_TYPE *pxHigherPriorityTaskWoken, portBASE_TYPE xCopyPosition )
//  349 {
xQueueGenericSendFromISR:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
        MOVS     R7,R3
//  350   signed portBASE_TYPE xReturn;
//  351   unsigned portBASE_TYPE uxSavedInterruptStatus;
//  352   
//  353     uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
        MOVS     R8,#+0
          CFI FunCall vPortSetInterruptMask
        BL       vPortSetInterruptMask
//  354     {
//  355         if( pxQueue->uxMessagesWaiting < pxQueue->uxLength )
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+60]
        CMP      R0,R1
        BCS.N    ??xQueueGenericSendFromISR_0
//  356 	{
//  357 	    traceQUEUE_SEND_FROM_ISR( pxQueue );
//  358 	    prvCopyDataToQueue( pxQueue, pvItemToQueue, xCopyPosition );
        MOVS     R2,R7
        MOVS     R1,R6
        MOVS     R0,R4
          CFI FunCall prvCopyDataToQueue
        BL       prvCopyDataToQueue
//  359 
//  360 	    if( pxQueue->xTxLock == queueUNLOCKED )
        LDR      R0,[R4, #+72]
        CMN      R0,#+1
        BNE.N    ??xQueueGenericSendFromISR_1
//  361 	    {
//  362 		if( !listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) )
        LDR      R0,[R4, #+36]
        CMP      R0,#+0
        BEQ.N    ??xQueueGenericSendFromISR_2
//  363 		{
//  364       		  if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
        ADDS     R0,R4,#+36
          CFI FunCall xTaskRemoveFromEventList
        BL       xTaskRemoveFromEventList
        CMP      R0,#+0
        BEQ.N    ??xQueueGenericSendFromISR_2
//  365 		  {
//  366 			*pxHigherPriorityTaskWoken = pdTRUE;
        MOVS     R0,#+1
        STR      R0,[R5, #+0]
        B.N      ??xQueueGenericSendFromISR_2
//  367 		  }
//  368 		 }
//  369 	    }
//  370     else
//  371     {
//  372 	++( pxQueue->xTxLock );
??xQueueGenericSendFromISR_1:
        LDR      R0,[R4, #+72]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+72]
//  373     }
//  374 
//  375     xReturn = pdPASS;
??xQueueGenericSendFromISR_2:
        MOVS     R4,#+1
        B.N      ??xQueueGenericSendFromISR_3
//  376     }
//  377     else
//  378     {
//  379 	traceQUEUE_SEND_FROM_ISR_FAILED( pxQueue );
//  380 	xReturn = errQUEUE_FULL;
??xQueueGenericSendFromISR_0:
        MOVS     R4,#+0
//  381     }
//  382     }
//  383     portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
??xQueueGenericSendFromISR_3:
          CFI FunCall vPortClearInterruptMask
        BL       vPortClearInterruptMask
//  384 
//  385     return xReturn;
        MOVS     R0,R4
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock6
//  386 }
//  387 /********************************************************************************
//  388 *   Descrição   : 
//  389 *   Parametros  : 
//  390 *   Retorno     : 
//  391 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function xQueueGenericReceive
        THUMB
//  392 signed portBASE_TYPE xQueueGenericReceive( xQueueHandle pxQueue, void * const pvBuffer, portTickType xTicksToWait, portBASE_TYPE xJustPeeking )
//  393 {
xQueueGenericReceive:
        PUSH     {R0-R2,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R3
//  394 signed portBASE_TYPE xEntryTimeSet = pdFALSE;
        MOVS     R7,#+0
        B.N      ??xQueueGenericReceive_0
//  395 xTimeOutType xTimeOut;
//  396 signed char *pcOriginalReadPosition;
//  397 
//  398 	for( ;; )
//  399 	{
//  400 		taskENTER_CRITICAL();
//  401 		{
//  402 			if( pxQueue->uxMessagesWaiting > ( unsigned portBASE_TYPE ) 0 )
//  403 			{
//  404 				pcOriginalReadPosition = pxQueue->pcReadFrom;
//  405 
//  406 				prvCopyDataFromQueue( pxQueue, pvBuffer );
//  407 
//  408 				if( xJustPeeking == pdFALSE )
//  409 				{
//  410 					traceQUEUE_RECEIVE( pxQueue );
//  411 
//  412 					--( pxQueue->uxMessagesWaiting );
//  413 
//  414 					{
//  415 						if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
//  416 						{
//  417 							/* Record the information required to implement
//  418 							priority inheritance should it become necessary. */
//  419 							pxQueue->pxMutexHolder = xTaskGetCurrentTaskHandle();
//  420 						}
//  421 					}
//  422 
//  423 					if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) == pdFALSE )
//  424 					{
//  425 						if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) == pdTRUE )
//  426 						{
//  427 							portYIELD_WITHIN_API();
//  428 						}
//  429 					}
//  430 				}
//  431 				else
//  432 				{
//  433 					traceQUEUE_PEEK( pxQueue );
//  434 
//  435 					pxQueue->pcReadFrom = pcOriginalReadPosition;
//  436 
//  437 					if( !listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) )
//  438 					{
//  439 						if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
//  440 						{
//  441 							portYIELD_WITHIN_API();
//  442 						}
//  443 					}
//  444 
//  445 				}
//  446 
//  447 				taskEXIT_CRITICAL();
//  448 				return pdPASS;
//  449 			}
//  450 			else
//  451 			{
//  452 				if( xTicksToWait == ( portTickType ) 0 )
//  453 				{
//  454 					taskEXIT_CRITICAL();
//  455 					traceQUEUE_RECEIVE_FAILED( pxQueue );
//  456 					return errQUEUE_EMPTY;
//  457 				}
//  458 				else if( xEntryTimeSet == pdFALSE )
//  459 				{
//  460 					vTaskSetTimeOutState( &xTimeOut );
//  461 					xEntryTimeSet = pdTRUE;
//  462 				}
//  463 			}
//  464 		}
//  465 		taskEXIT_CRITICAL();
//  466 
//  467 		vTaskSuspendAll();
//  468 		prvLockQueue( pxQueue );
//  469 
//  470 		if( xTaskCheckForTimeOut( &xTimeOut, &xTicksToWait ) == pdFALSE )
//  471 		{
//  472 			if( prvIsQueueEmpty( pxQueue ) )
//  473 			{
//  474 				traceBLOCKING_ON_QUEUE_RECEIVE( pxQueue );
//  475 
//  476 				{
//  477 					if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
//  478 					{
//  479 						portENTER_CRITICAL();
//  480 						{
//  481 							vTaskPriorityInherit( ( void * ) pxQueue->pxMutexHolder );
//  482 						}
//  483 						portEXIT_CRITICAL();
//  484 					}
//  485 				}
//  486 
//  487 				vTaskPlaceOnEventList( &( pxQueue->xTasksWaitingToReceive ), xTicksToWait );
//  488 				prvUnlockQueue( pxQueue );
//  489 				if( !xTaskResumeAll() )
//  490 				{
//  491 					portYIELD_WITHIN_API();
//  492 				}
//  493 			}
//  494 			else
//  495 			{
//  496 				prvUnlockQueue( pxQueue );
??xQueueGenericReceive_1:
        MOVS     R0,R4
          CFI FunCall prvUnlockQueue
        BL       prvUnlockQueue
//  497 				( void ) xTaskResumeAll();
          CFI FunCall xTaskResumeAll
        BL       xTaskResumeAll
//  498 			}
??xQueueGenericReceive_0:
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
        LDR      R0,[R4, #+56]
        CMP      R0,#+0
        BEQ.N    ??xQueueGenericReceive_2
        LDR      R7,[R4, #+12]
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall prvCopyDataFromQueue
        BL       prvCopyDataFromQueue
        CMP      R6,#+0
        BNE.N    ??xQueueGenericReceive_3
        LDR      R0,[R4, #+56]
        SUBS     R0,R0,#+1
        STR      R0,[R4, #+56]
        LDR      R0,[R4, #+0]
        CMP      R0,#+0
        BNE.N    ??xQueueGenericReceive_4
          CFI FunCall xTaskGetCurrentTaskHandle
        BL       xTaskGetCurrentTaskHandle
        STR      R0,[R4, #+4]
??xQueueGenericReceive_4:
        LDR      R0,[R4, #+16]
        CMP      R0,#+0
        BEQ.N    ??xQueueGenericReceive_5
        ADDS     R0,R4,#+16
          CFI FunCall xTaskRemoveFromEventList
        BL       xTaskRemoveFromEventList
        CMP      R0,#+1
        BNE.N    ??xQueueGenericReceive_5
          CFI FunCall vPortYieldFromISR
        BL       vPortYieldFromISR
        B.N      ??xQueueGenericReceive_5
??xQueueGenericReceive_3:
        STR      R7,[R4, #+12]
        LDR      R0,[R4, #+36]
        CMP      R0,#+0
        BEQ.N    ??xQueueGenericReceive_5
        ADDS     R0,R4,#+36
          CFI FunCall xTaskRemoveFromEventList
        BL       xTaskRemoveFromEventList
        CMP      R0,#+0
        BEQ.N    ??xQueueGenericReceive_5
          CFI FunCall vPortYieldFromISR
        BL       vPortYieldFromISR
??xQueueGenericReceive_5:
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
        MOVS     R0,#+1
        B.N      ??xQueueGenericReceive_6
??xQueueGenericReceive_2:
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??xQueueGenericReceive_7
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
        MOVS     R0,#+0
        B.N      ??xQueueGenericReceive_6
??xQueueGenericReceive_7:
        CMP      R7,#+0
        BNE.N    ??xQueueGenericReceive_8
        ADD      R0,SP,#+0
          CFI FunCall vTaskSetTimeOutState
        BL       vTaskSetTimeOutState
        MOVS     R7,#+1
??xQueueGenericReceive_8:
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
          CFI FunCall vTaskSuspendAll
        BL       vTaskSuspendAll
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
        LDR      R0,[R4, #+68]
        CMN      R0,#+1
        BNE.N    ??xQueueGenericReceive_9
        MOVS     R0,#+0
        STR      R0,[R4, #+68]
??xQueueGenericReceive_9:
        LDR      R0,[R4, #+72]
        CMN      R0,#+1
        BNE.N    ??xQueueGenericReceive_10
        MOVS     R0,#+0
        STR      R0,[R4, #+72]
??xQueueGenericReceive_10:
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
        ADD      R1,SP,#+8
        ADD      R0,SP,#+0
          CFI FunCall xTaskCheckForTimeOut
        BL       xTaskCheckForTimeOut
        CMP      R0,#+0
        BNE.N    ??xQueueGenericReceive_11
        MOVS     R0,R4
          CFI FunCall prvIsQueueEmpty
        BL       prvIsQueueEmpty
        CMP      R0,#+0
        BEQ.N    ??xQueueGenericReceive_1
        LDR      R0,[R4, #+0]
        CMP      R0,#+0
        BNE.N    ??xQueueGenericReceive_12
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
        LDR      R0,[R4, #+4]
          CFI FunCall vTaskPriorityInherit
        BL       vTaskPriorityInherit
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
??xQueueGenericReceive_12:
        LDR      R1,[SP, #+8]
        ADDS     R0,R4,#+36
          CFI FunCall vTaskPlaceOnEventList
        BL       vTaskPlaceOnEventList
        MOVS     R0,R4
          CFI FunCall prvUnlockQueue
        BL       prvUnlockQueue
          CFI FunCall xTaskResumeAll
        BL       xTaskResumeAll
        CMP      R0,#+0
        BNE.N    ??xQueueGenericReceive_0
          CFI FunCall vPortYieldFromISR
        BL       vPortYieldFromISR
        B.N      ??xQueueGenericReceive_0
//  499 		}
//  500 		else
//  501 		{
//  502 			prvUnlockQueue( pxQueue );
??xQueueGenericReceive_11:
        MOVS     R0,R4
          CFI FunCall prvUnlockQueue
        BL       prvUnlockQueue
//  503 			( void ) xTaskResumeAll();
          CFI FunCall xTaskResumeAll
        BL       xTaskResumeAll
        MOVS     R1,R0
//  504 			traceQUEUE_RECEIVE_FAILED( pxQueue );
//  505 			return errQUEUE_EMPTY;
        MOVS     R0,#+0
??xQueueGenericReceive_6:
        POP      {R1-R7,PC}       ;; return
          CFI EndBlock cfiBlock7
//  506 		}
//  507 	}
//  508 }
//  509 /********************************************************************************
//  510 *   Descrição     :
//  511 *   Parametros    : 
//  512 *   Retorno       : 
//  513 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function xQueueReceiveFromISR
        THUMB
//  514 signed portBASE_TYPE xQueueReceiveFromISR( xQueueHandle pxQueue, void * const pvBuffer, signed portBASE_TYPE *pxTaskWoken )
//  515 {
xQueueReceiveFromISR:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
//  516 signed portBASE_TYPE xReturn;
//  517 unsigned portBASE_TYPE uxSavedInterruptStatus;
//  518 
//  519 	uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
        MOVS     R7,#+0
          CFI FunCall vPortSetInterruptMask
        BL       vPortSetInterruptMask
//  520 	{
//  521 		if( pxQueue->uxMessagesWaiting > ( unsigned portBASE_TYPE ) 0 )
        LDR      R0,[R4, #+56]
        CMP      R0,#+0
        BEQ.N    ??xQueueReceiveFromISR_0
//  522 		{
//  523 			traceQUEUE_RECEIVE_FROM_ISR( pxQueue );
//  524 
//  525 			prvCopyDataFromQueue( pxQueue, pvBuffer );
        MOVS     R1,R6
        MOVS     R0,R4
          CFI FunCall prvCopyDataFromQueue
        BL       prvCopyDataFromQueue
//  526 			--( pxQueue->uxMessagesWaiting );
        LDR      R0,[R4, #+56]
        SUBS     R0,R0,#+1
        STR      R0,[R4, #+56]
//  527 			if( pxQueue->xRxLock == queueUNLOCKED )
        LDR      R0,[R4, #+68]
        CMN      R0,#+1
        BNE.N    ??xQueueReceiveFromISR_1
//  528 			{
//  529 				if( !listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) )
        LDR      R0,[R4, #+16]
        CMP      R0,#+0
        BEQ.N    ??xQueueReceiveFromISR_2
//  530 				{
//  531 					if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) != pdFALSE )
        ADDS     R0,R4,#+16
          CFI FunCall xTaskRemoveFromEventList
        BL       xTaskRemoveFromEventList
        CMP      R0,#+0
        BEQ.N    ??xQueueReceiveFromISR_2
//  532 					{
//  533 						*pxTaskWoken = pdTRUE;
        MOVS     R0,#+1
        STR      R0,[R5, #+0]
        B.N      ??xQueueReceiveFromISR_2
//  534 					}
//  535 				}
//  536 			}
//  537 			else
//  538 			{
//  539 				++( pxQueue->xRxLock );
??xQueueReceiveFromISR_1:
        LDR      R0,[R4, #+68]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+68]
//  540 			}
//  541 
//  542 			xReturn = pdPASS;
??xQueueReceiveFromISR_2:
        MOVS     R4,#+1
        B.N      ??xQueueReceiveFromISR_3
//  543 		}
//  544 		else
//  545 		{
//  546 			xReturn = pdFAIL;
??xQueueReceiveFromISR_0:
        MOVS     R4,#+0
//  547 			traceQUEUE_RECEIVE_FROM_ISR_FAILED( pxQueue );
//  548 		}
//  549 	}
//  550 	portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
??xQueueReceiveFromISR_3:
          CFI FunCall vPortClearInterruptMask
        BL       vPortClearInterruptMask
//  551 
//  552 	return xReturn;
        MOVS     R0,R4
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock8
//  553 }
//  554 /********************************************************************************
//  555 *     Descrição     :   
//  556 *     Parametros    : 
//  557 *     Retorno       : 
//  558 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function uxQueueMessagesWaiting
        THUMB
//  559 unsigned portBASE_TYPE uxQueueMessagesWaiting( const xQueueHandle pxQueue )
//  560 {
uxQueueMessagesWaiting:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  561 unsigned portBASE_TYPE uxReturn;
//  562 
//  563 	taskENTER_CRITICAL();
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
//  564 		uxReturn = pxQueue->uxMessagesWaiting;
        LDR      R4,[R4, #+56]
//  565 	taskEXIT_CRITICAL();
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
//  566 
//  567 	return uxReturn;
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock9
//  568 }
//  569 /********************************************************************************
//  570 *   Descrição      :  
//  571 *   Parametros     :
//  572 *   Retorno        :  
//  573 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function uxQueueMessagesWaitingFromISR
          CFI NoCalls
        THUMB
//  574 unsigned portBASE_TYPE uxQueueMessagesWaitingFromISR( const xQueueHandle pxQueue )
//  575 {
//  576 unsigned portBASE_TYPE uxReturn;
//  577 
//  578 	uxReturn = pxQueue->uxMessagesWaiting;
uxQueueMessagesWaitingFromISR:
        LDR      R0,[R0, #+56]
//  579 
//  580 	return uxReturn;
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  581 }
//  582 /********************************************************************************
//  583 *   Descrição      :  
//  584 *   Parametros     :
//  585 *   Retorno        :  
//  586 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function vQueueDelete
        THUMB
//  587 void vQueueDelete( xQueueHandle pxQueue )
//  588 {
vQueueDelete:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  589 	traceQUEUE_DELETE( pxQueue );
//  590 	vQueueUnregisterQueue( pxQueue );
        MOVS     R0,R4
          CFI FunCall vQueueUnregisterQueue
        BL       vQueueUnregisterQueue
//  591 	vPortFree( pxQueue->pcHead );
        LDR      R0,[R4, #+0]
          CFI FunCall vPortFree
        BL       vPortFree
//  592 	vPortFree( pxQueue );
        MOVS     R0,R4
          CFI FunCall vPortFree
        BL       vPortFree
//  593 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock11
//  594 /********************************************************************************
//  595 *   Descrição      :  
//  596 *   Parametros     :
//  597 *   Retorno        :  
//  598 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function prvCopyDataToQueue
        THUMB
//  599 static void prvCopyDataToQueue( xQUEUE *pxQueue, const void *pvItemToQueue, portBASE_TYPE xPosition )
//  600 {
prvCopyDataToQueue:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  601 	if( pxQueue->uxItemSize == ( unsigned portBASE_TYPE ) 0 )
        LDR      R0,[R4, #+64]
        CMP      R0,#+0
        BNE.N    ??prvCopyDataToQueue_0
//  602 	{
//  603 		{
//  604 			if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
        LDR      R0,[R4, #+0]
        CMP      R0,#+0
        BNE.N    ??prvCopyDataToQueue_1
//  605 			{
//  606 				vTaskPriorityDisinherit( ( void * ) pxQueue->pxMutexHolder );
        LDR      R0,[R4, #+4]
          CFI FunCall vTaskPriorityDisinherit
        BL       vTaskPriorityDisinherit
//  607 				pxQueue->pxMutexHolder = NULL;
        MOVS     R0,#+0
        STR      R0,[R4, #+4]
        B.N      ??prvCopyDataToQueue_1
//  608 			}
//  609 		}
//  610 	}
//  611 	else if( xPosition == queueSEND_TO_BACK )
??prvCopyDataToQueue_0:
        CMP      R2,#+0
        BNE.N    ??prvCopyDataToQueue_2
//  612 	{
//  613 		memcpy( ( void * ) pxQueue->pcWriteTo, pvItemToQueue, ( unsigned ) pxQueue->uxItemSize );
        LDR      R2,[R4, #+64]
        LDR      R0,[R4, #+8]
          CFI FunCall memcpy
        BL       memcpy
//  614 		pxQueue->pcWriteTo += pxQueue->uxItemSize;
        LDR      R0,[R4, #+64]
        LDR      R1,[R4, #+8]
        ADDS     R0,R0,R1
        STR      R0,[R4, #+8]
//  615 		if( pxQueue->pcWriteTo >= pxQueue->pcTail )
        LDR      R0,[R4, #+8]
        LDR      R1,[R4, #+4]
        CMP      R0,R1
        BCC.N    ??prvCopyDataToQueue_1
//  616 		{
//  617 			pxQueue->pcWriteTo = pxQueue->pcHead;
        LDR      R0,[R4, #+0]
        STR      R0,[R4, #+8]
        B.N      ??prvCopyDataToQueue_1
//  618 		}
//  619 	}
//  620 	else
//  621 	{
//  622 		memcpy( ( void * ) pxQueue->pcReadFrom, pvItemToQueue, ( unsigned ) pxQueue->uxItemSize );
??prvCopyDataToQueue_2:
        LDR      R2,[R4, #+64]
        LDR      R0,[R4, #+12]
          CFI FunCall memcpy
        BL       memcpy
//  623 		pxQueue->pcReadFrom -= pxQueue->uxItemSize;
        LDR      R0,[R4, #+64]
        RSBS     R0,R0,#+0
        LDR      R1,[R4, #+12]
        ADDS     R0,R0,R1
        STR      R0,[R4, #+12]
//  624 		if( pxQueue->pcReadFrom < pxQueue->pcHead )
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+0]
        CMP      R0,R1
        BCS.N    ??prvCopyDataToQueue_1
//  625 		{
//  626 			pxQueue->pcReadFrom = ( pxQueue->pcTail - pxQueue->uxItemSize );
        LDR      R0,[R4, #+64]
        RSBS     R0,R0,#+0
        LDR      R1,[R4, #+4]
        ADDS     R0,R0,R1
        STR      R0,[R4, #+12]
//  627 		}
//  628 	}
//  629 
//  630 	++( pxQueue->uxMessagesWaiting );
??prvCopyDataToQueue_1:
        LDR      R0,[R4, #+56]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+56]
//  631 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock12
//  632 /********************************************************************************
//  633 *   Descrição      :  
//  634 *   Parametros     :
//  635 *   Retorno        :  
//  636 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function prvCopyDataFromQueue
        THUMB
//  637 static void prvCopyDataFromQueue( xQUEUE * const pxQueue, const void *pvBuffer )
//  638 {
prvCopyDataFromQueue:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        MOVS     R3,R0
        MOVS     R0,R1
//  639 	if( pxQueue->uxQueueType != queueQUEUE_IS_MUTEX )
        LDR      R1,[R3, #+0]
        CMP      R1,#+0
        BEQ.N    ??prvCopyDataFromQueue_0
//  640 	{
//  641 		pxQueue->pcReadFrom += pxQueue->uxItemSize;
        LDR      R1,[R3, #+64]
        LDR      R2,[R3, #+12]
        ADDS     R1,R1,R2
        STR      R1,[R3, #+12]
//  642 		if( pxQueue->pcReadFrom >= pxQueue->pcTail )
        LDR      R1,[R3, #+12]
        LDR      R2,[R3, #+4]
        CMP      R1,R2
        BCC.N    ??prvCopyDataFromQueue_1
//  643 		{
//  644 			pxQueue->pcReadFrom = pxQueue->pcHead;
        LDR      R1,[R3, #+0]
        STR      R1,[R3, #+12]
//  645 		}
//  646 		memcpy( ( void * ) pvBuffer, ( void * ) pxQueue->pcReadFrom, ( unsigned ) pxQueue->uxItemSize );
??prvCopyDataFromQueue_1:
        LDR      R2,[R3, #+64]
        LDR      R1,[R3, #+12]
          CFI FunCall memcpy
        BL       memcpy
//  647 	}
//  648 }
??prvCopyDataFromQueue_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock13
//  649 /********************************************************************************
//  650 *   Descrição      :  
//  651 *   Parametros     :
//  652 *   Retorno        :  
//  653 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function prvUnlockQueue
        THUMB
//  654 static void prvUnlockQueue( xQueueHandle pxQueue )
//  655 {
prvUnlockQueue:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  656 	taskENTER_CRITICAL();
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
        B.N      ??prvUnlockQueue_0
//  657 	{
//  658 		while( pxQueue->xTxLock > queueLOCKED_UNMODIFIED )
//  659 		{
//  660 			if( !listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) )
//  661 			{
//  662 				if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
??prvUnlockQueue_1:
        ADDS     R0,R4,#+36
          CFI FunCall xTaskRemoveFromEventList
        BL       xTaskRemoveFromEventList
        CMP      R0,#+0
        BEQ.N    ??prvUnlockQueue_2
//  663 				{
//  664 					vTaskMissedYield();
          CFI FunCall vTaskMissedYield
        BL       vTaskMissedYield
//  665 				}
//  666 
//  667 				--( pxQueue->xTxLock );
??prvUnlockQueue_2:
        LDR      R0,[R4, #+72]
        SUBS     R0,R0,#+1
        STR      R0,[R4, #+72]
//  668 			}
??prvUnlockQueue_0:
        LDR      R0,[R4, #+72]
        CMP      R0,#+1
        BLT.N    ??prvUnlockQueue_3
        LDR      R0,[R4, #+36]
        CMP      R0,#+0
        BNE.N    ??prvUnlockQueue_1
//  669 			else
//  670 			{
//  671 				break;
//  672 			}
//  673 		}
//  674 
//  675 		pxQueue->xTxLock = queueUNLOCKED;
??prvUnlockQueue_3:
        MOVS     R0,#-1
        STR      R0,[R4, #+72]
//  676 	}
//  677 	taskEXIT_CRITICAL();
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
//  678 
//  679 	taskENTER_CRITICAL();
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
        B.N      ??prvUnlockQueue_4
//  680 	{
//  681 		while( pxQueue->xRxLock > queueLOCKED_UNMODIFIED )
//  682 		{
//  683 			if( !listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) )
//  684 			{
//  685 				if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) != pdFALSE )
??prvUnlockQueue_5:
        ADDS     R0,R4,#+16
          CFI FunCall xTaskRemoveFromEventList
        BL       xTaskRemoveFromEventList
        CMP      R0,#+0
        BEQ.N    ??prvUnlockQueue_6
//  686 				{
//  687 					vTaskMissedYield();
          CFI FunCall vTaskMissedYield
        BL       vTaskMissedYield
//  688 				}
//  689 
//  690 				--( pxQueue->xRxLock );
??prvUnlockQueue_6:
        LDR      R0,[R4, #+68]
        SUBS     R0,R0,#+1
        STR      R0,[R4, #+68]
//  691 			}
??prvUnlockQueue_4:
        LDR      R0,[R4, #+68]
        CMP      R0,#+1
        BLT.N    ??prvUnlockQueue_7
        LDR      R0,[R4, #+16]
        CMP      R0,#+0
        BNE.N    ??prvUnlockQueue_5
//  692 			else
//  693 			{
//  694 				break;
//  695 			}
//  696 		}
//  697 
//  698 		pxQueue->xRxLock = queueUNLOCKED;
??prvUnlockQueue_7:
        MOVS     R0,#-1
        STR      R0,[R4, #+68]
//  699 	}
//  700 	taskEXIT_CRITICAL();
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
//  701 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock14
//  702 /********************************************************************************
//  703 *   Descrição      :  
//  704 *   Parametros     :
//  705 *   Retorno        :  
//  706 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function prvIsQueueEmpty
        THUMB
//  707 static signed portBASE_TYPE prvIsQueueEmpty( const xQueueHandle pxQueue )
//  708 {
prvIsQueueEmpty:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  709 signed portBASE_TYPE xReturn;
//  710 
//  711 	taskENTER_CRITICAL();
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
//  712 		xReturn = ( pxQueue->uxMessagesWaiting == ( unsigned portBASE_TYPE ) 0 );
        LDR      R0,[R4, #+56]
        CMP      R0,#+0
        BNE.N    ??prvIsQueueEmpty_0
        MOVS     R4,#+1
        B.N      ??prvIsQueueEmpty_1
??prvIsQueueEmpty_0:
        MOVS     R4,#+0
??prvIsQueueEmpty_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
//  713 	taskEXIT_CRITICAL();
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
//  714 
//  715 	return xReturn;
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock15
//  716 }
//  717 /********************************************************************************
//  718 *   Descrição      :  
//  719 *   Parametros     :
//  720 *   Retorno        :  
//  721 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function xQueueIsQueueEmptyFromISR
          CFI NoCalls
        THUMB
//  722 signed portBASE_TYPE xQueueIsQueueEmptyFromISR( const xQueueHandle pxQueue )
//  723 {
//  724 signed portBASE_TYPE xReturn;
//  725 
//  726 	xReturn = ( pxQueue->uxMessagesWaiting == ( unsigned portBASE_TYPE ) 0 );
xQueueIsQueueEmptyFromISR:
        LDR      R0,[R0, #+56]
        CMP      R0,#+0
        BNE.N    ??xQueueIsQueueEmptyFromISR_0
        MOVS     R0,#+1
        B.N      ??xQueueIsQueueEmptyFromISR_1
??xQueueIsQueueEmptyFromISR_0:
        MOVS     R0,#+0
??xQueueIsQueueEmptyFromISR_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
//  727 
//  728 	return xReturn;
        BX       LR               ;; return
          CFI EndBlock cfiBlock16
//  729 }
//  730 /********************************************************************************
//  731 *   Descrição      :  
//  732 *   Parametros     :
//  733 *   Retorno        :  
//  734 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function prvIsQueueFull
        THUMB
//  735 static signed portBASE_TYPE prvIsQueueFull( const xQueueHandle pxQueue )
//  736 {
prvIsQueueFull:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  737 signed portBASE_TYPE xReturn;
//  738 
//  739 	taskENTER_CRITICAL();
          CFI FunCall vPortEnterCritical
        BL       vPortEnterCritical
//  740 		xReturn = ( pxQueue->uxMessagesWaiting == pxQueue->uxLength );
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+60]
        CMP      R0,R1
        BNE.N    ??prvIsQueueFull_0
        MOVS     R4,#+1
        B.N      ??prvIsQueueFull_1
??prvIsQueueFull_0:
        MOVS     R4,#+0
??prvIsQueueFull_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
//  741 	taskEXIT_CRITICAL();
          CFI FunCall vPortExitCritical
        BL       vPortExitCritical
//  742 
//  743 	return xReturn;
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock17
//  744 }
//  745 /********************************************************************************
//  746 *   Descrição      :  
//  747 *   Parametros     :
//  748 *   Retorno        :  
//  749 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function xQueueIsQueueFullFromISR
          CFI NoCalls
        THUMB
//  750 signed portBASE_TYPE xQueueIsQueueFullFromISR( const xQueueHandle pxQueue )
//  751 {
//  752 signed portBASE_TYPE xReturn;
//  753 
//  754 	xReturn = ( pxQueue->uxMessagesWaiting == pxQueue->uxLength );
xQueueIsQueueFullFromISR:
        LDR      R1,[R0, #+56]
        LDR      R0,[R0, #+60]
        CMP      R1,R0
        BNE.N    ??xQueueIsQueueFullFromISR_0
        MOVS     R0,#+1
        B.N      ??xQueueIsQueueFullFromISR_1
??xQueueIsQueueFullFromISR_0:
        MOVS     R0,#+0
??xQueueIsQueueFullFromISR_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
//  755 
//  756 	return xReturn;
        BX       LR               ;; return
          CFI EndBlock cfiBlock18
//  757 }
//  758 /********************************************************************************
//  759 *   Descrição      :  
//  760 *   Parametros     :
//  761 *   Retorno        :  
//  762 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function vQueueAddToRegistry
          CFI NoCalls
        THUMB
//  763 void vQueueAddToRegistry( xQueueHandle xQueue, signed char *pcQueueName )
//  764 {
//  765 unsigned portBASE_TYPE ux;
//  766 
//  767     for( ux = 0; ux < configQUEUE_REGISTRY_SIZE; ux++ )
vQueueAddToRegistry:
        MOVS     R2,#+0
        B.N      ??vQueueAddToRegistry_0
??vQueueAddToRegistry_1:
        ADDS     R2,R2,#+1
??vQueueAddToRegistry_0:
        CMP      R2,#+10
        BCS.N    ??vQueueAddToRegistry_2
//  768     {
//  769 	if( xQueueRegistry[ ux ].pcQueueName == NULL )
        LDR.N    R3,??DataTable1
        LDR      R3,[R3, R2, LSL #+3]
        CMP      R3,#+0
        BNE.N    ??vQueueAddToRegistry_1
//  770 	{
//  771 	    xQueueRegistry[ ux ].pcQueueName = pcQueueName;
        LDR.N    R3,??DataTable1
        STR      R1,[R3, R2, LSL #+3]
//  772 	    xQueueRegistry[ ux ].xHandle = xQueue;
        LDR.N    R1,??DataTable1
        ADDS     R1,R1,R2, LSL #+3
        STR      R0,[R1, #+4]
//  773 	    break;
//  774 	}
//  775     }
//  776 }
??vQueueAddToRegistry_2:
        BX       LR               ;; return
          CFI EndBlock cfiBlock19
//  777 /********************************************************************************
//  778 *   Descrição      :  
//  779 *   Parametros     :
//  780 *   Retorno        :  
//  781 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function vQueueUnregisterQueue
          CFI NoCalls
        THUMB
//  782 static void vQueueUnregisterQueue( xQueueHandle xQueue )
//  783 {
//  784     unsigned portBASE_TYPE ux;
//  785 
//  786 	
//  787     for( ux = 0; ux < configQUEUE_REGISTRY_SIZE; ux++ )
vQueueUnregisterQueue:
        MOVS     R1,#+0
        B.N      ??vQueueUnregisterQueue_0
??vQueueUnregisterQueue_1:
        ADDS     R1,R1,#+1
??vQueueUnregisterQueue_0:
        CMP      R1,#+10
        BCS.N    ??vQueueUnregisterQueue_2
//  788     {
//  789 	if( xQueueRegistry[ ux ].xHandle == xQueue )
        LDR.N    R2,??DataTable1
        ADDS     R2,R2,R1, LSL #+3
        LDR      R2,[R2, #+4]
        CMP      R2,R0
        BNE.N    ??vQueueUnregisterQueue_1
//  790 	{
//  791 	    xQueueRegistry[ ux ].pcQueueName = NULL;
        LDR.N    R0,??DataTable1
        MOVS     R2,#+0
        STR      R2,[R0, R1, LSL #+3]
//  792 	    break;
//  793 	}
//  794     }
//  795 
//  796 }
??vQueueUnregisterQueue_2:
        BX       LR               ;; return
          CFI EndBlock cfiBlock20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     xQueueRegistry

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  797 /********************************************************************************
//  798 *   Fim do arquivo
//  799 ********************************************************************************/
// 
//    80 bytes in section .bss
// 1 436 bytes in section .text
// 
// 1 422 bytes of CODE memory (+ 14 bytes shared)
//    80 bytes of DATA memory
//
//Errors: none
//Warnings: none
