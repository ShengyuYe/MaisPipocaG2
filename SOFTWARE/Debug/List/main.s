///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     07/Jul/2017  16:29:36 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\main.c                                  /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\main.c -lC                              /
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
//                    pocaG2\SOFTWARE\Debug\List\main.s                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN APLICACAO_main
        EXTERN BOARD_ini
        EXTERN BOARD_main
        EXTERN BV20_main
        EXTERN LEDS_main
        EXTERN PAGAMENTOS_main
        EXTERN PROTOCOLO_main
        EXTERN vTaskStartScheduler
        EXTERN xTaskGenericCreate

        PUBLIC lowLevelInit
        PUBLIC main
        PUBLIC vApplicationStackOverflowHook
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\main.c
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
//   17 |       Arquivo            :  main.c
//   18 |       Descrição          :  módulo principal do sistema
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  15/02/2017
//   22 |
//   23 |       Revisões           :  001
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 /***********************************************************************************
//   29 *       Includes
//   30 ***********************************************************************************/
//   31 #include <nxp\iolpc1768.h>
//   32 #include "includes.h"
//   33 
//   34 /***********************************************************************************
//   35 *       Funções locais
//   36 ***********************************************************************************/
//   37 void lowLevelInit( void );
//   38 
//   39 /***********************************************************************************
//   40 *       Funções externas
//   41 ***********************************************************************************/
//   42 
//   43 
//   44 /***********************************************************************************
//   45 *       Implementação
//   46 ***********************************************************************************/
//   47 
//   48 /***********************************************************************************
//   49 *       Descrição       :       Função principal do sistema
//   50 *       Parametros      :       nenhum
//   51 *       Retorno         :       nenhum
//   52 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function main
        THUMB
//   53 void main(void){
main:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//   54   
//   55   lowLevelInit();
          CFI FunCall lowLevelInit
        BL       lowLevelInit
//   56   BOARD_ini();
          CFI FunCall BOARD_ini
        BL       BOARD_ini
//   57   
//   58   xTaskCreate(APLICACAO_main ,"APLICACAO" ,768,NULL,1,NULL);
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOV      R2,#+768
        LDR.N    R1,??DataTable1_1
        LDR.N    R0,??DataTable1_2
          CFI FunCall xTaskGenericCreate
        BL       xTaskGenericCreate
//   59   xTaskCreate(BOARD_main     ,"IU"        ,128 ,NULL,1,NULL);  
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+128
        ADR.N    R1,??DataTable1  ;; 0x49, 0x55, 0x00, 0x00
        LDR.N    R0,??DataTable1_3
          CFI FunCall xTaskGenericCreate
        BL       xTaskGenericCreate
//   60   xTaskCreate(PAGAMENTOS_main,"PAGAMENTOS",128 ,NULL,1,NULL);  
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+128
        LDR.N    R1,??DataTable1_4
        LDR.N    R0,??DataTable1_5
          CFI FunCall xTaskGenericCreate
        BL       xTaskGenericCreate
//   61   xTaskCreate(BV20_main      ,"BV20"      ,128 ,NULL,1,NULL);  
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+128
        LDR.N    R1,??DataTable1_6
        LDR.N    R0,??DataTable1_7
          CFI FunCall xTaskGenericCreate
        BL       xTaskGenericCreate
//   62   xTaskCreate(LEDS_main      ,"LEDS"      ,128 ,NULL,1,NULL);      
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+128
        LDR.N    R1,??DataTable1_8
        LDR.N    R0,??DataTable1_9
          CFI FunCall xTaskGenericCreate
        BL       xTaskGenericCreate
//   63   xTaskCreate(PROTOCOLO_main ,"PROT"      ,128 ,NULL,1,NULL);      
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+128
        LDR.N    R1,??DataTable1_10
        LDR.N    R0,??DataTable1_11
          CFI FunCall xTaskGenericCreate
        BL       xTaskGenericCreate
//   64   
//   65   //Inicialização do escalonador, essa função nunca retornará
//   66   vTaskStartScheduler();  
          CFI FunCall vTaskStartScheduler
        BL       vTaskStartScheduler
//   67   
//   68   for(;;);
??main_0:
        B.N      ??main_0
          CFI EndBlock cfiBlock0
//   69 }
//   70 /***********************************************************************************
//   71 *       Descrição       :       Inicialização básica do sistema
//   72 *       Parametros      :       nenhum
//   73 *       Retorno         :       nenhum
//   74 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function lowLevelInit
          CFI NoCalls
        THUMB
//   75 void lowLevelInit( void ){
//   76   
//   77   SC->PCONP = 0;            // Disable peripherals power. 
lowLevelInit:
        LDR.N    R0,??DataTable1_12  ;; 0x400fc0c4
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   78   SC->PCONP = PCONP_PCGPIO; // Enable GPIO power. 
        LDR.N    R0,??DataTable1_12  ;; 0x400fc0c4
        MOV      R1,#+32768
        STR      R1,[R0, #+0]
//   79 
//   80   PINCON->PINSEL10 = 0;     //   Disable TPIU.
        LDR.N    R0,??DataTable1_13  ;; 0x4002c028
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   81 
//   82   if ( SC->PLL0STAT & ( 1 << 25 ) )
        LDR.N    R0,??DataTable1_14  ;; 0x400fc088
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+6
        BPL.N    ??lowLevelInit_0
//   83   {
//   84 	/* Enable PLL, disconnected. */
//   85         SC->PLL0CON = 1;			
        LDR.N    R0,??DataTable1_15  ;; 0x400fc080
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
//   86 	SC->PLL0FEED = PLLFEED_FEED1;
        LDR.N    R0,??DataTable1_16  ;; 0x400fc08c
        MOVS     R1,#+170
        STR      R1,[R0, #+0]
//   87 	SC->PLL0FEED = PLLFEED_FEED2;
        LDR.N    R0,??DataTable1_16  ;; 0x400fc08c
        MOVS     R1,#+85
        STR      R1,[R0, #+0]
//   88   }
//   89 	
//   90   /* Disable PLL, disconnected. */
//   91   SC->PLL0CON = 0;				
??lowLevelInit_0:
        LDR.N    R0,??DataTable1_15  ;; 0x400fc080
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   92   SC->PLL0FEED = PLLFEED_FEED1;
        LDR.N    R0,??DataTable1_16  ;; 0x400fc08c
        MOVS     R1,#+170
        STR      R1,[R0, #+0]
//   93   SC->PLL0FEED = PLLFEED_FEED2;
        LDR.N    R0,??DataTable1_16  ;; 0x400fc08c
        MOVS     R1,#+85
        STR      R1,[R0, #+0]
//   94 	
//   95   /* Enable main OSC. */
//   96   SC->SCS |= 0x20;			
        LDR.N    R0,??DataTable1_17  ;; 0x400fc1a0
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable1_17  ;; 0x400fc1a0
        STR      R0,[R1, #+0]
//   97   while( !( SC->SCS & 0x40 ) );
??lowLevelInit_1:
        LDR.N    R0,??DataTable1_17  ;; 0x400fc1a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??lowLevelInit_1
//   98 	
//   99   /* select main OSC, 12MHz, as the PLL clock source. */
//  100   SC->CLKSRCSEL = 0x1;		
        LDR.N    R0,??DataTable1_18  ;; 0x400fc10c
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
//  101 	
//  102   SC->PLL0CFG = 0x20031;
        LDR.N    R0,??DataTable1_19  ;; 0x400fc084
        LDR.N    R1,??DataTable1_20  ;; 0x20031
        STR      R1,[R0, #+0]
//  103   SC->PLL0FEED = PLLFEED_FEED1;
        LDR.N    R0,??DataTable1_16  ;; 0x400fc08c
        MOVS     R1,#+170
        STR      R1,[R0, #+0]
//  104   SC->PLL0FEED = PLLFEED_FEED2;
        LDR.N    R0,??DataTable1_16  ;; 0x400fc08c
        MOVS     R1,#+85
        STR      R1,[R0, #+0]
//  105 	      
//  106   /* Enable PLL, disconnected. */
//  107   SC->PLL0CON = 1;				
        LDR.N    R0,??DataTable1_15  ;; 0x400fc080
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
//  108   SC->PLL0FEED = PLLFEED_FEED1;
        LDR.N    R0,??DataTable1_16  ;; 0x400fc08c
        MOVS     R1,#+170
        STR      R1,[R0, #+0]
//  109   SC->PLL0FEED = PLLFEED_FEED2;
        LDR.N    R0,??DataTable1_16  ;; 0x400fc08c
        MOVS     R1,#+85
        STR      R1,[R0, #+0]
//  110 	
//  111   /* Set clock divider. */
//  112   SC->CCLKCFG = 0x03;
        LDR.N    R0,??DataTable1_21  ;; 0x400fc104
        MOVS     R1,#+3
        STR      R1,[R0, #+0]
//  113 	
//  114   /* Configure flash accelerator. */
//  115   SC->FLASHCFG = 0x603a;
        LDR.N    R0,??DataTable1_22  ;; 0x400fc000
        MOVW     R1,#+24634
        STR      R1,[R0, #+0]
//  116 	
//  117   /* Check lock bit status. */
//  118   while( ( ( SC->PLL0STAT & ( 1 << 26 ) ) == 0 ) );	
??lowLevelInit_2:
        LDR.N    R0,??DataTable1_14  ;; 0x400fc088
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+5
        BPL.N    ??lowLevelInit_2
//  119 	
//  120   /* Enable and connect. */
//  121   SC->PLL0CON = 3;				
        LDR.N    R0,??DataTable1_15  ;; 0x400fc080
        MOVS     R1,#+3
        STR      R1,[R0, #+0]
//  122   SC->PLL0FEED = PLLFEED_FEED1;
        LDR.N    R0,??DataTable1_16  ;; 0x400fc08c
        MOVS     R1,#+170
        STR      R1,[R0, #+0]
//  123   SC->PLL0FEED = PLLFEED_FEED2;
        LDR.N    R0,??DataTable1_16  ;; 0x400fc08c
        MOVS     R1,#+85
        STR      R1,[R0, #+0]
//  124   while( ( ( SC->PLL0STAT & ( 1 << 25 ) ) == 0 ) );	
??lowLevelInit_3:
        LDR.N    R0,??DataTable1_14  ;; 0x400fc088
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+6
        BPL.N    ??lowLevelInit_3
//  125 			
//  126   /* Configure the clock for the USB. */
//  127 
//  128   if( SC->PLL1STAT & ( 1 << 9 ) )
        LDR.N    R0,??DataTable1_23  ;; 0x400fc0a8
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+22
        BPL.N    ??lowLevelInit_4
//  129   {
//  130 	/* Enable PLL, disconnected. */
//  131 	SC->PLL1CON = 1;			
        LDR.N    R0,??DataTable1_24  ;; 0x400fc0a0
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
//  132 	SC->PLL1FEED = PLLFEED_FEED1;
        LDR.N    R0,??DataTable1_25  ;; 0x400fc0ac
        MOVS     R1,#+170
        STR      R1,[R0, #+0]
//  133 	SC->PLL1FEED = PLLFEED_FEED2;
        LDR.N    R0,??DataTable1_25  ;; 0x400fc0ac
        MOVS     R1,#+85
        STR      R1,[R0, #+0]
//  134   }	
//  135   /* Disable PLL, disconnected. */
//  136   SC->PLL1CON = 0;				
??lowLevelInit_4:
        LDR.N    R0,??DataTable1_24  ;; 0x400fc0a0
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  137   SC->PLL1FEED = PLLFEED_FEED1;
        LDR.N    R0,??DataTable1_25  ;; 0x400fc0ac
        MOVS     R1,#+170
        STR      R1,[R0, #+0]
//  138   SC->PLL1FEED = PLLFEED_FEED2;
        LDR.N    R0,??DataTable1_25  ;; 0x400fc0ac
        MOVS     R1,#+85
        STR      R1,[R0, #+0]
//  139 	
//  140   SC->PLL1CFG = 0x23;
        LDR.N    R0,??DataTable1_26  ;; 0x400fc0a4
        MOVS     R1,#+35
        STR      R1,[R0, #+0]
//  141   SC->PLL1FEED = PLLFEED_FEED1;
        LDR.N    R0,??DataTable1_25  ;; 0x400fc0ac
        MOVS     R1,#+170
        STR      R1,[R0, #+0]
//  142   SC->PLL1FEED = PLLFEED_FEED2;
        LDR.N    R0,??DataTable1_25  ;; 0x400fc0ac
        MOVS     R1,#+85
        STR      R1,[R0, #+0]
//  143 	
//  144   /* Enable PLL, disconnected. */
//  145   SC->PLL1CON = 1;				
        LDR.N    R0,??DataTable1_24  ;; 0x400fc0a0
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
//  146   SC->PLL1FEED = PLLFEED_FEED1;
        LDR.N    R0,??DataTable1_25  ;; 0x400fc0ac
        MOVS     R1,#+170
        STR      R1,[R0, #+0]
//  147   SC->PLL1FEED = PLLFEED_FEED2;
        LDR.N    R0,??DataTable1_25  ;; 0x400fc0ac
        MOVS     R1,#+85
        STR      R1,[R0, #+0]
//  148   while( ( ( SC->PLL1STAT & ( 1 << 10 ) ) == 0 ) );
??lowLevelInit_5:
        LDR.N    R0,??DataTable1_23  ;; 0x400fc0a8
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+21
        BPL.N    ??lowLevelInit_5
//  149 	
//  150   /* Enable and connect. */
//  151   SC->PLL1CON = 3;				
        LDR.N    R0,??DataTable1_24  ;; 0x400fc0a0
        MOVS     R1,#+3
        STR      R1,[R0, #+0]
//  152   SC->PLL1FEED = PLLFEED_FEED1;
        LDR.N    R0,??DataTable1_25  ;; 0x400fc0ac
        MOVS     R1,#+170
        STR      R1,[R0, #+0]
//  153   SC->PLL1FEED = PLLFEED_FEED2;
        LDR.N    R0,??DataTable1_25  ;; 0x400fc0ac
        MOVS     R1,#+85
        STR      R1,[R0, #+0]
//  154   while( ( ( SC->PLL1STAT & ( 1 << 9 ) ) == 0 ) );
??lowLevelInit_6:
        LDR.N    R0,??DataTable1_23  ;; 0x400fc0a8
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+22
        BPL.N    ??lowLevelInit_6
//  155 	
//  156   /*  Setup the peripheral bus to be the same as the PLL output (64 MHz). */
//  157   SC->PCLKSEL0 = 0x05555555;
        LDR.N    R0,??DataTable1_27  ;; 0x400fc1a8
        LDR.N    R1,??DataTable1_28  ;; 0x5555555
        STR      R1,[R0, #+0]
//  158 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC8      0x49, 0x55, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     `?<Constant "APLICACAO">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     APLICACAO_main

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     BOARD_main

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     `?<Constant "PAGAMENTOS">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     PAGAMENTOS_main

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     `?<Constant "BV20">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     BV20_main

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     `?<Constant "LEDS">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     LEDS_main

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     `?<Constant "PROT">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     PROTOCOLO_main

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     0x400fc0c4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     0x4002c028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     0x400fc088

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     0x400fc080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     0x400fc08c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     0x400fc1a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     0x400fc10c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_19:
        DC32     0x400fc084

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_20:
        DC32     0x20031

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_21:
        DC32     0x400fc104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_22:
        DC32     0x400fc000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_23:
        DC32     0x400fc0a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_24:
        DC32     0x400fc0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_25:
        DC32     0x400fc0ac

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_26:
        DC32     0x400fc0a4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_27:
        DC32     0x400fc1a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_28:
        DC32     0x5555555
//  159 /***********************************************************************************
//  160 *   Descrição     :  Essa função será chamada se houver estouro no stack pointer
//  161 *   Parametros    : 
//  162 *   Retorno       : 
//  163 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function vApplicationStackOverflowHook
          CFI NoCalls
        THUMB
//  164 void vApplicationStackOverflowHook( xTaskHandle *pxTask, signed char *pcTaskName){
//  165 
//  166   ( void ) pxTask;
//  167   ( void ) pcTaskName;
//  168   
//  169   for( ;; );
vApplicationStackOverflowHook:
??vApplicationStackOverflowHook_0:
        B.N      ??vApplicationStackOverflowHook_0
          CFI EndBlock cfiBlock2
//  170 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "APLICACAO">`:
        DATA
        DC8 "APLICACAO"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "IU"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PAGAMENTOS">`:
        DATA
        DC8 "PAGAMENTOS"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BV20">`:
        DATA
        DC8 "BV20"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "LEDS">`:
        DATA
        DC8 "LEDS"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PROT">`:
        DATA
        DC8 "PROT"
        DC8 0, 0, 0

        END
//  171 /***********************************************************************************
//  172 *       Fim do arquivo
//  173 ***********************************************************************************/
// 
//  52 bytes in section .rodata
// 602 bytes in section .text
// 
// 602 bytes of CODE  memory
//  52 bytes of CONST memory
//
//Errors: none
//Warnings: none
