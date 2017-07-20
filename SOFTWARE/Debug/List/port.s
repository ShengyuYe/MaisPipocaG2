///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  13:07:19 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Kernel\port.c                           /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Kernel\port.c -lC                       /
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
//                    pocaG2\SOFTWARE\Debug\List\port.s                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME port

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN BOARD_timer_tick
        EXTERN vPortClearInterruptMask
        EXTERN vPortSetInterruptMask
        EXTERN vPortStartFirstTask
        EXTERN vTaskIncrementTick

        PUBLIC pxPortInitialiseStack
        PUBLIC uxCriticalNesting
        PUBLIC vPortEndScheduler
        PUBLIC vPortEnterCritical
        PUBLIC vPortExitCritical
        PUBLIC vPortYieldFromISR
        PUBLIC xPortStartScheduler
        PUBLIC xPortSysTickHandler
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Kernel\port.c
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
//   28 /********************************************************************************
//   29 *   Includes
//   30 ********************************************************************************/
//   31 #include "FreeRTOS.h"
//   32 #include "task.h"
//   33 /********************************************************************************
//   34 *   Definições
//   35 ********************************************************************************/
//   36 #define portNVIC_SYSTICK_CTRL		( ( volatile unsigned long *) 0xe000e010 )
//   37 #define portNVIC_SYSTICK_LOAD		( ( volatile unsigned long *) 0xe000e014 )
//   38 #define portNVIC_INT_CTRL		( ( volatile unsigned long *) 0xe000ed04 )
//   39 #define portNVIC_SYSPRI2		( ( volatile unsigned long *) 0xe000ed20 )
//   40 #define portNVIC_SYSTICK_CLK		0x00000004
//   41 #define portNVIC_SYSTICK_INT		0x00000002
//   42 #define portNVIC_SYSTICK_ENABLE		0x00000001
//   43 #define portNVIC_PENDSVSET		0x10000000
//   44 #define portNVIC_PENDSV_PRI		( ( ( unsigned long ) configKERNEL_INTERRUPT_PRIORITY ) << 16 )
//   45 #define portNVIC_SYSTICK_PRI		( ( ( unsigned long ) configKERNEL_INTERRUPT_PRIORITY ) << 24 )
//   46 #define portINITIAL_XPSR			( 0x01000000 )
//   47 #ifndef configKERNEL_INTERRUPT_PRIORITY
//   48 	#define configKERNEL_INTERRUPT_PRIORITY 0
//   49 #endif
//   50 /********************************************************************************
//   51 *   Variaveis locais
//   52 ********************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   53  unsigned portBASE_TYPE uxCriticalNesting = 0xaaaaaaaa;
uxCriticalNesting:
        DATA
        DC32 2863311530
//   54 
//   55 /********************************************************************************
//   56 *   Funções locais
//   57 ********************************************************************************/
//   58 static void prvSetupTimerInterrupt( void );
//   59 void xPortSysTickHandler( void );
//   60 extern void vPortStartFirstTask(void);
//   61 /********************************************************************************
//   62 *   Funções externas ao módulo
//   63 ********************************************************************************/
//   64 extern void BOARD_timerHook(void);
//   65 extern void MU_timerTick(void);
//   66 /********************************************************************************
//   67 *   Implementação
//   68 ********************************************************************************/
//   69 
//   70 /********************************************************************************
//   71 *   Descrição     :
//   72 *   Parametros    : 
//   73 *   Retorno       : 
//   74 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function pxPortInitialiseStack
          CFI NoCalls
        THUMB
//   75 portSTACK_TYPE *pxPortInitialiseStack( portSTACK_TYPE *pxTopOfStack, pdTASK_CODE pxCode, void *pvParameters )
//   76 {
//   77     pxTopOfStack--; /* Offset added to account for the way the MCU uses the stack on entry/exit of interrupts. */
pxPortInitialiseStack:
        SUBS     R0,R0,#+4
//   78     *pxTopOfStack = portINITIAL_XPSR;	/* xPSR */
        MOVS     R3,#+16777216
        STR      R3,[R0, #+0]
//   79     pxTopOfStack--;
        SUBS     R0,R0,#+4
//   80     *pxTopOfStack = ( portSTACK_TYPE ) pxCode;	/* PC */
        STR      R1,[R0, #+0]
//   81     pxTopOfStack--;
        SUBS     R0,R0,#+4
//   82     *pxTopOfStack = 0;	/* LR */
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   83     pxTopOfStack -= 5;	/* R12, R3, R2 and R1. */
        SUBS     R0,R0,#+20
//   84     *pxTopOfStack = ( portSTACK_TYPE ) pvParameters;	/* R0 */
        STR      R2,[R0, #+0]
//   85     pxTopOfStack -= 8;	/* R11, R10, R9, R8, R7, R6, R5 and R4. */
        SUBS     R0,R0,#+32
//   86 
//   87     return pxTopOfStack;
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   88 }
//   89 /********************************************************************************
//   90 *   Descrição     :   
//   91 *   Parametros    : 
//   92 *   Retorno       : 
//   93 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function xPortStartScheduler
        THUMB
//   94 portBASE_TYPE xPortStartScheduler( void )
//   95 {
xPortStartScheduler:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   96     *(portNVIC_SYSPRI2) |= portNVIC_PENDSV_PRI;
        LDR.N    R0,??DataTable5  ;; 0xe000ed20
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF80000
        LDR.N    R1,??DataTable5  ;; 0xe000ed20
        STR      R0,[R1, #+0]
//   97     *(portNVIC_SYSPRI2) |= portNVIC_SYSTICK_PRI;
        LDR.N    R0,??DataTable5  ;; 0xe000ed20
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF8000000
        LDR.N    R1,??DataTable5  ;; 0xe000ed20
        STR      R0,[R1, #+0]
//   98 
//   99     prvSetupTimerInterrupt();	
          CFI FunCall prvSetupTimerInterrupt
        BL       prvSetupTimerInterrupt
//  100     uxCriticalNesting = 0;
        LDR.N    R0,??DataTable5_1
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  101 
//  102     vPortStartFirstTask();
          CFI FunCall vPortStartFirstTask
        BL       vPortStartFirstTask
//  103     return 0;
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock1
//  104 }
//  105 /********************************************************************************
//  106 *   Descrição     : 
//  107 *   Parametros    :
//  108 *   Retorno       : 
//  109 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function vPortEndScheduler
          CFI NoCalls
        THUMB
//  110 void vPortEndScheduler( void )
//  111 {
//  112 
//  113   
//  114 }
vPortEndScheduler:
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  115 /********************************************************************************
//  116 *   Descrição     : 
//  117 *   Parametros    : 
//  118 *   Retorno       : 
//  119 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function vPortYieldFromISR
          CFI NoCalls
        THUMB
//  120 void vPortYieldFromISR( void )
//  121 {
//  122 
//  123     *(portNVIC_INT_CTRL) = portNVIC_PENDSVSET;
vPortYieldFromISR:
        LDR.N    R0,??DataTable5_2  ;; 0xe000ed04
        MOVS     R1,#+268435456
        STR      R1,[R0, #+0]
//  124 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  125 /********************************************************************************
//  126 *   Descrição     : 
//  127 *   Parametros    : 
//  128 *   Retorno       : 
//  129 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function vPortEnterCritical
        THUMB
//  130 void vPortEnterCritical( void )
//  131 {
vPortEnterCritical:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  132 	portDISABLE_INTERRUPTS();
          CFI FunCall vPortSetInterruptMask
        BL       vPortSetInterruptMask
//  133 	uxCriticalNesting++;
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  134 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  135 /********************************************************************************
//  136 *   Descrição     : 
//  137 *   Parametros    : 
//  138 *   Retorno       : 
//  139 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function vPortExitCritical
        THUMB
//  140 void vPortExitCritical( void )
//  141 {
vPortExitCritical:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  142 	uxCriticalNesting--;
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  143 	if( uxCriticalNesting == 0 )
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??vPortExitCritical_0
//  144 	{
//  145 		portENABLE_INTERRUPTS();
          CFI FunCall vPortClearInterruptMask
        BL       vPortClearInterruptMask
//  146 	}
//  147 }
??vPortExitCritical_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
//  148 /********************************************************************************
//  149 *   Descrição     :   
//  150 *   Parametros    :   
//  151 *   Retorno       : 
//  152 ********************************************************************************/
//  153 extern void BOARD_timer_tick(void);
//  154 extern unsigned char MDBUART_bytes_recebidos;
//  155 extern unsigned char MDBUART_novo_pacote;
//  156 extern unsigned char MDBUART_silent_time;
//  157 extern unsigned char MDBUART_buffer_in[50];
//  158 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function xPortSysTickHandler
        THUMB
//  159 void xPortSysTickHandler( void )
//  160 {
xPortSysTickHandler:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  161   unsigned long ulDummy;
//  162     
//  163   BOARD_timer_tick();
          CFI FunCall BOARD_timer_tick
        BL       BOARD_timer_tick
//  164   
//  165 /*
//  166   if(MDBUART_silent_time){
//  167     // Bytes recebidos pela UART1
//  168     if(MDBUART_bytes_recebidos && MDBUART_silent_time==1){
//  169          
//  170       if(!MDBUART_buffer_in[MDBUART_bytes_recebidos-1] || MDBUART_buffer_in[MDBUART_bytes_recebidos-1]==0xFF)
//  171         MDBUART_novo_pacote = 1;
//  172       else{      
//  173         MDBUART_buffer_in[MDBUART_bytes_recebidos++] = 0;
//  174         MDBUART_novo_pacote = 1;
//  175        }     
//  176     }    
//  177     MDBUART_silent_time--;
//  178   }
//  179   */
//  180 
//  181   *(portNVIC_INT_CTRL) = portNVIC_PENDSVSET;	
        LDR.N    R0,??DataTable5_2  ;; 0xe000ed04
        MOVS     R1,#+268435456
        STR      R1,[R0, #+0]
//  182 
//  183     ulDummy = portSET_INTERRUPT_MASK_FROM_ISR();
        MOVS     R4,#+0
          CFI FunCall vPortSetInterruptMask
        BL       vPortSetInterruptMask
//  184     {
//  185 	vTaskIncrementTick();
          CFI FunCall vTaskIncrementTick
        BL       vTaskIncrementTick
//  186     }
//  187     portCLEAR_INTERRUPT_MASK_FROM_ISR( ulDummy );         
          CFI FunCall vPortClearInterruptMask
        BL       vPortClearInterruptMask
//  188 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock6
//  189 /********************************************************************************
//  190 *   Descrição     :   
//  191 *   Parametros    : 
//  192 *   Retorno       : 
//  193 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function prvSetupTimerInterrupt
          CFI NoCalls
        THUMB
//  194 void prvSetupTimerInterrupt( void ){
//  195   
//  196   *(portNVIC_SYSTICK_LOAD) = ( configCPU_CLOCK_HZ / configTICK_RATE_HZ ) - 1UL;
prvSetupTimerInterrupt:
        LDR.N    R0,??DataTable5_3  ;; 0xe000e014
        LDR.N    R1,??DataTable5_4  ;; 0x182b7
        STR      R1,[R0, #+0]
//  197   *(portNVIC_SYSTICK_CTRL) = portNVIC_SYSTICK_CLK | portNVIC_SYSTICK_INT | portNVIC_SYSTICK_ENABLE;
        LDR.N    R0,??DataTable5_5  ;; 0xe000e010
        MOVS     R1,#+7
        STR      R1,[R0, #+0]
//  198 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0xe000ed20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     uxCriticalNesting

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0xe000ed04

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0xe000e014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x182b7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0xe000e010

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  199 /********************************************************************************
//  200 *   Fim do arquivo
//  201 ********************************************************************************/
//  202 
// 
//   4 bytes in section .data
// 194 bytes in section .text
// 
// 194 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none
