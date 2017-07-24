///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     24/Jul/2017  15:06:56 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Kernel\heap_1.c                         /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Kernel\heap_1.c -lC                     /
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
//                    pocaG2\SOFTWARE\Debug\List\heap_1.s                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME heap_1

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN vTaskSuspendAll
        EXTERN xTaskResumeAll

        PUBLIC pvPortMalloc
        PUBLIC vPortFree
        PUBLIC vPortInitialiseBlocks
        PUBLIC xPortGetFreeHeapSize
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Kernel\heap_1.c
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
//   17 |       Arquivo            :  log_operacoes_falhas.c
//   18 |       Descrição          :  fila com os eventos ocorridos no sistema
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  02/10/2012
//   22 |
//   23 |       Revisões           :  1.0.0.0
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 /***********************************************************************************
//   29 *       Includes
//   30 ***********************************************************************************/
//   31 #define MPU_WRAPPERS_INCLUDED_FROM_API_FILE
//   32 
//   33 #include "FreeRTOS.h"
//   34 #include "task.h"
//   35 
//   36 #undef MPU_WRAPPERS_INCLUDED_FROM_API_FILE
//   37 
//   38 /***********************************************************************************
//   39 *       Estrutura
//   40 ***********************************************************************************/
//   41 /* Allocate the memory for the heap.  The struct is used to force byte
//   42 alignment without using any non-portable code. */
//   43 static union xRTOS_HEAP
//   44 {
//   45 	#if portBYTE_ALIGNMENT == 8
//   46 		volatile portDOUBLE dDummy;
//   47 	#else
//   48 		volatile unsigned long ulDummy;
//   49 	#endif	
//   50 	unsigned char ucHeap[ configTOTAL_HEAP_SIZE ];

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
//   51 } xHeap;
xHeap:
        DS8 10240
//   52 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   53 static size_t xNextFreeByte = ( size_t ) 0;
xNextFreeByte:
        DS8 4
//   54 
//   55 /***********************************************************************************
//   56 *       Descrição       :       Aloca um bloco de memória no
//   57 *                               vetor do "heap" 
//   58 *       Parametros      :       (size_t) tamanho do bloco
//   59 *       Retorno         :       (void*) ponteiro para o bloco
//   60 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function pvPortMalloc
        THUMB
//   61 void *pvPortMalloc( size_t xWantedSize )
//   62 {
pvPortMalloc:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
//   63 void *pvReturn = NULL; 
        MOVS     R4,#+0
//   64 
//   65 	/* Ensure that blocks are always aligned to the required number of bytes. */
//   66 	#if portBYTE_ALIGNMENT != 1
//   67 		if( xWantedSize & portBYTE_ALIGNMENT_MASK )
        TST      R5,#0x7
        BEQ.N    ??pvPortMalloc_0
//   68 		{
//   69 			/* Byte alignment required. */
//   70 			xWantedSize += ( portBYTE_ALIGNMENT - ( xWantedSize & portBYTE_ALIGNMENT_MASK ) );
        ADDS     R0,R5,#+8
        ANDS     R1,R5,#0x7
        SUBS     R5,R0,R1
//   71 		}
//   72 	#endif
//   73 
//   74 	vTaskSuspendAll();
??pvPortMalloc_0:
          CFI FunCall vTaskSuspendAll
        BL       vTaskSuspendAll
//   75 	{
//   76 		/* Check there is enough room left for the allocation. */
//   77 		if( ( ( xNextFreeByte + xWantedSize ) < configTOTAL_HEAP_SIZE ) &&
//   78 			( ( xNextFreeByte + xWantedSize ) > xNextFreeByte )	)/* Check for overflow. */
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
        ADDS     R0,R5,R0
        CMP      R0,#+10240
        BCS.N    ??pvPortMalloc_1
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2
        LDR      R1,[R1, #+0]
        ADDS     R1,R5,R1
        CMP      R0,R1
        BCS.N    ??pvPortMalloc_1
//   79 		{
//   80 			/* Return the next free byte then increment the index past this
//   81 			block. */
//   82 			pvReturn = &( xHeap.ucHeap[ xNextFreeByte ] );
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_1
        ADDS     R4,R0,R1
//   83 			xNextFreeByte += xWantedSize;			
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
        ADDS     R0,R5,R0
        LDR.N    R1,??DataTable2
        STR      R0,[R1, #+0]
//   84 		}	
//   85 	}
//   86 	xTaskResumeAll();
??pvPortMalloc_1:
          CFI FunCall xTaskResumeAll
        BL       xTaskResumeAll
//   87 	
//   88 	#if( configUSE_MALLOC_FAILED_HOOK == 1 )
//   89 	{
//   90 		if( pvReturn == NULL )
//   91 		{
//   92 			extern void vApplicationMallocFailedHook( void );
//   93 			vApplicationMallocFailedHook();
//   94 		}
//   95 	}
//   96 	#endif	
//   97 
//   98 	return pvReturn;
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock0
//   99 }
//  100 /***********************************************************************************
//  101 *       Descrição       :       Libera um bloco de memória
//  102 *       Parametros      :       não implementado nessa versão
//  103 *
//  104 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function vPortFree
          CFI NoCalls
        THUMB
//  105 void vPortFree( void *pv )
//  106 {
//  107 	/* Memory cannot be freed using this scheme.  See heap_2.c and heap_3.c 
//  108 	for alternative implementations, and the memory management pages of 
//  109 	http://www.FreeRTOS.org for more information. */
//  110 	( void ) pv;
//  111 }
vPortFree:
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  112 /***********************************************************************************
//  113 *       
//  114 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function vPortInitialiseBlocks
          CFI NoCalls
        THUMB
//  115 void vPortInitialiseBlocks( void )
//  116 {
//  117 	/* Only required when static memory is not cleared. */
//  118 	xNextFreeByte = ( size_t ) 0;
vPortInitialiseBlocks:
        LDR.N    R0,??DataTable2
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  119 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  120 /***********************************************************************************
//  121 *       Descrição       :       Verifica quanta memória está disponível 
//  122 *                               no heap do sistema
//  123 *       Parametros      :       nenhum
//  124 *       Retorno         :       (size_t) quantidade total de posições
//  125 *                                        disponíveis para alocação
//  126 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function xPortGetFreeHeapSize
          CFI NoCalls
        THUMB
//  127 size_t xPortGetFreeHeapSize( void )
//  128 {
//  129 	return ( configTOTAL_HEAP_SIZE - xNextFreeByte );
xPortGetFreeHeapSize:
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
        RSBS     R0,R0,#+10240
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  130 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     xNextFreeByte

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     xHeap

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  131 /***********************************************************************************
//  132 *       Fim do arquivo
//  133 ***********************************************************************************/
//  134 
//  135 
//  136 
// 
// 10 244 bytes in section .bss
//    106 bytes in section .text
// 
//    106 bytes of CODE memory
// 10 244 bytes of DATA memory
//
//Errors: none
//Warnings: none
