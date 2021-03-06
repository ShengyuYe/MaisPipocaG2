///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     26/Jan/2018  13:45:12 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\WATCHDOG\ /
//                    WATCHDOG.C                                              /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\WATCHDOG\ /
//                    WATCHDOG.C -lC C:\repositorios\MaisPipocaG2\SOFTWARE\De /
//                    bug\List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Deb /
//                    ug\List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug /
//                    \Obj\ --no_cse --no_unroll --no_inline                  /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\WATCHD /
//                    OG.s                                                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME WATCHDOG

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC WATCHDOG_init
        PUBLIC WDTC
        PUBLIC _A_WDCLKSEL
        PUBLIC _A_WDFEED
        PUBLIC _A_WDMOD
        
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\WATCHDOG\WATCHDOG.C
//    1 /*__________________________________________________________________________________
//    2 |	Chave Digital Tecnologia Eletronica Ltda. 
//    3 |       
//    4 |       Balne?rio Cambori? - SC
//    5 |       www.chavedigital.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Chave Digital and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Chave Digital
//   10 |       or its distributors.
//   11 |
//   12 |       Este c?digo ? propriedade da Chave Digital e n?o pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       Chave Digital ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :  watchdog.c
//   18 |       Descri??o          :  Fun??es para configura??o e controle
//   19 |                             do watchdog dos LPC17XX
//   20 | 
//   21 |       Autor              :  Marcos Aquino
//   22 |       Data cria??o       :  12/12/2011
//   23 |
//   24 |       Revis?es           :  1.0.0.0
//   25 |
//   26 |
//   27 | __________________________________________________________________________________
//   28 */
//   29 /***********************************************************************************
//   30 *   Includes
//   31 ***********************************************************************************/
//   32 #include <nxp\iolpc1768.h>

        ASEGN `.noinit`:DATA:NOROOT,040000000H
        SECTION_GROUP _A_WDMOD
// __absolute union <unnamed> volatile _A_WDMOD
_A_WDMOD:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040000004H
        SECTION_GROUP WDTC
// __absolute unsigned long volatile WDTC
WDTC:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040000008H
        SECTION_GROUP _A_WDFEED
// __absolute union <unnamed> volatile _A_WDFEED
_A_WDFEED:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040000010H
        SECTION_GROUP _A_WDCLKSEL
// __absolute union <unnamed> volatile _A_WDCLKSEL
_A_WDCLKSEL:
        DS8 4
//   33 #include "watchdog.h"
//   34 
//   35 
//   36 /***********************************************************************************
//   37 *   Defini??es com constantes utilizadas no programa
//   38 ***********************************************************************************/ 
//   39 
//   40 
//   41 
//   42 /***********************************************************************************
//   43 *   Enumera??es
//   44 ***********************************************************************************/
//   45 
//   46 
//   47 /***********************************************************************************
//   48 *   Estruturas
//   49 ***********************************************************************************/
//   50 
//   51 
//   52 /***********************************************************************************
//   53 *   Uni?es
//   54 ***********************************************************************************/
//   55 
//   56 
//   57 /***********************************************************************************
//   58 *   Constantes
//   59 ***********************************************************************************/
//   60 
//   61 
//   62 /***********************************************************************************
//   63 *   Variaveis locais
//   64 ***********************************************************************************/
//   65 
//   66 
//   67 /***********************************************************************************
//   68 *   Fun??es locais
//   69 ***********************************************************************************/
//   70  
//   71 /***********************************************************************************
//   72 *   Implementa??o
//   73 ***********************************************************************************/
//   74 
//   75 /***********************************************************************************
//   76 *   Descri??o     :   Inicializa o watchdog
//   77 *   Parametros    :   (unsigned long int) intervalo em milisegundos
//   78 *   Retorno       :   nenhum
//   79 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function WATCHDOG_init
          CFI NoCalls
        THUMB
//   80 void WATCHDOG_init(unsigned int intervalo){
//   81 
//   82   WDMOD_bit.WDEN = 1;  // Habilita o perif?rico    
WATCHDOG_init:
        MOVS     R1,#+1073741824
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1
        MOVS     R2,#+1073741824
        STR      R1,[R2, #+0]
//   83   WDMOD_bit.WDRESET = 1; // Reset do chip quando houver estouro da contagem
        MOVS     R1,#+1073741824
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2
        MOVS     R2,#+1073741824
        STR      R1,[R2, #+0]
//   84   
//   85   WDCLKSEL_bit.WDSEL =   0x00; // Oscilador RC
        LDR.N    R1,??WATCHDOG_init_0  ;; 0x40000010
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+2
        LSLS     R1,R1,#+2
        LDR.N    R2,??WATCHDOG_init_0  ;; 0x40000010
        STR      R1,[R2, #+0]
//   86   WDCLKSEL_bit.WDLOCK = 0x01; // Bloqueio o acesso ao registrador
        LDR.N    R1,??WATCHDOG_init_0  ;; 0x40000010
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x80000000
        LDR.N    R2,??WATCHDOG_init_0  ;; 0x40000010
        STR      R1,[R2, #+0]
//   87   
//   88   WDTC = 2048*2000;
        LDR.N    R1,??WATCHDOG_init_0+0x4  ;; 0x40000004
        MOVS     R2,#+4096000
        STR      R2,[R1, #+0]
//   89   FEEDS_THE_DOG();  
        LDR.N    R1,??WATCHDOG_init_0+0x8  ;; 0x40000008
        MOVS     R2,#+170
        STR      R2,[R1, #+0]
        LDR.N    R1,??WATCHDOG_init_0+0x8  ;; 0x40000008
        MOVS     R2,#+85
        STR      R2,[R1, #+0]
//   90 }
        BX       LR               ;; return
        Nop      
        DATA
??WATCHDOG_init_0:
        DC32     0x40000010
        DC32     0x40000004
        DC32     0x40000008
          CFI EndBlock cfiBlock0
        REQUIRE _A_WDMOD
        REQUIRE _A_WDCLKSEL
        REQUIRE WDTC
        REQUIRE _A_WDFEED

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//   91 /***********************************************************************************
//   92 *   Fim do arquivo
//   93 ***********************************************************************************/
// 
// 16 bytes in section .noinit (abs)
// 92 bytes in section .text
// 
// 92 bytes of CODE memory
//  0 bytes of DATA memory (+ 16 bytes shared)
//
//Errors: none
//Warnings: none
