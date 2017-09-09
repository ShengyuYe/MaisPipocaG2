///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     09/Sep/2017  15:56:37 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\SERIAL_MU /
//                    X\serial_mux.c                                          /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\SERIAL_MU /
//                    X\serial_mux.c -lC C:\repositorios\MaisPipocaG2\SOFTWAR /
//                    E\Debug\List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE /
//                    \Debug\List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\D /
//                    ebug\Obj\ --no_cse --no_unroll --no_inline              /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\serial /
//                    _mux.s                                                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME serial_mux

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC SERIALMUX_ini
        PUBLIC SERIALMUX_seleciona
        PUBLIC _A_FIO0DIR
        PUBLIC _A_FIO0SET
        PUBLIC _A_FIO1CLR
        PUBLIC _A_FIO1DIR
        PUBLIC _A_FIO1SET
        
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\SERIAL_MUX\serial_mux.c
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
//   17 |       Arquivo            :  serial_mux.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  26/05/2017
//   21 |
//   22 |       Revisões           :  0001
//   23 |
//   24 |
//   25 | __________________________________________________________________________________
//   26 */
//   27 
//   28 /***********************************************************************************
//   29 *       Includes
//   30 ***********************************************************************************/
//   31 #include <stdio.h>
//   32 #include <stdlib.h>
//   33 #include <string.h>
//   34 #include <nxp\iolpc1768.h>

        ASEGN `.noinit`:DATA:NOROOT,02009c000H
        SECTION_GROUP _A_FIO0DIR
// __absolute union <unnamed> volatile _A_FIO0DIR
_A_FIO0DIR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c018H
        SECTION_GROUP _A_FIO0SET
// __absolute union <unnamed> volatile _A_FIO0SET
_A_FIO0SET:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c020H
        SECTION_GROUP _A_FIO1DIR
// __absolute union <unnamed> volatile _A_FIO1DIR
_A_FIO1DIR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c038H
        SECTION_GROUP _A_FIO1SET
// __absolute union <unnamed> volatile _A_FIO1SET
_A_FIO1SET:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c03cH
        SECTION_GROUP _A_FIO1CLR
// __absolute union <unnamed> volatile _A_FIO1CLR
_A_FIO1CLR:
        DS8 4
//   35 #include "serial_mux.h"
//   36 #include "..\..\includes.h"
//   37 
//   38 /***********************************************************************************
//   39 *       Constantes
//   40 ***********************************************************************************/
//   41 
//   42 
//   43 /***********************************************************************************
//   44 *       Definições do hardware
//   45 ***********************************************************************************/
//   46 #define SINAL_MUX_A                     (0x01)<<27
//   47 #define SINAL_MUX_B                     (0x01)<<22
//   48 
//   49 #define SET_SINAL_MUX_A(X)              X?(FIO1SET|=SINAL_MUX_A):(FIO1CLR|=SINAL_MUX_A)
//   50 #define SET_SINAL_MUX_B(X)              X?(FIO0SET|=SINAL_MUX_B):(FIO1CLR|=SINAL_MUX_B)
//   51 
//   52 #define SERIAL_MUX_INI_PINS()           FIO1DIR|=SINAL_MUX_A; FIO0DIR|=SINAL_MUX_B;
//   53 
//   54 /***********************************************************************************
//   55 *       Variaveis locais
//   56 ***********************************************************************************/
//   57 
//   58 
//   59 /***********************************************************************************
//   60 *       Funçõe locais
//   61 ***********************************************************************************/
//   62 
//   63 
//   64 /***********************************************************************************
//   65 *       Implementação das funções
//   66 ***********************************************************************************/
//   67 
//   68 /***********************************************************************************
//   69 *       Descrição       :       Inicialização do módulo
//   70 *       Parametros      :       nenhum
//   71 *       Retorno         :       nenhum
//   72 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SERIALMUX_ini
          CFI NoCalls
        THUMB
//   73 void SERIALMUX_ini(void){
//   74   
//   75   SERIAL_MUX_INI_PINS();  
SERIALMUX_ini:
        LDR.N    R0,??DataTable1  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.N    R1,??DataTable1  ;; 0x2009c020
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable1_1  ;; 0x2009c000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400000
        LDR.N    R1,??DataTable1_1  ;; 0x2009c000
        STR      R0,[R1, #+0]
//   76 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_FIO1DIR
        REQUIRE _A_FIO0DIR
//   77 /***********************************************************************************
//   78 *       Descrição       :       Seleciona a porta serial que será utilizada
//   79 *       Parametros      :       (eSERIALMUX) porta serial 
//   80 *       Retorno         :       nenhum
//   81 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SERIALMUX_seleciona
          CFI NoCalls
        THUMB
//   82 void SERIALMUX_seleciona(eSERIALMUX porta){
//   83     
//   84   switch(porta){
SERIALMUX_seleciona:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SERIALMUX_seleciona_0
        CMP      R0,#+2
        BEQ.N    ??SERIALMUX_seleciona_1
        BCC.N    ??SERIALMUX_seleciona_2
        B.N      ??SERIALMUX_seleciona_3
//   85     case SERIALMUX_RS232:
//   86          SET_SINAL_MUX_A(0);
??SERIALMUX_seleciona_0:
        LDR.N    R1,??DataTable1_2  ;; 0x2009c03c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x8000000
        LDR.N    R2,??DataTable1_2  ;; 0x2009c03c
        STR      R1,[R2, #+0]
//   87          SET_SINAL_MUX_B(0);
        LDR.N    R1,??DataTable1_2  ;; 0x2009c03c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x400000
        LDR.N    R2,??DataTable1_2  ;; 0x2009c03c
        STR      R1,[R2, #+0]
//   88          break;
        B.N      ??SERIALMUX_seleciona_3
//   89     case SERIALMUX_DEX:
//   90          SET_SINAL_MUX_A(1);
??SERIALMUX_seleciona_2:
        LDR.N    R1,??DataTable1_3  ;; 0x2009c038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x8000000
        LDR.N    R2,??DataTable1_3  ;; 0x2009c038
        STR      R1,[R2, #+0]
//   91          SET_SINAL_MUX_B(0);      
        LDR.N    R1,??DataTable1_2  ;; 0x2009c03c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x400000
        LDR.N    R2,??DataTable1_2  ;; 0x2009c03c
        STR      R1,[R2, #+0]
//   92          break;
        B.N      ??SERIALMUX_seleciona_3
//   93     case SERIALMUX_USB:
//   94          SET_SINAL_MUX_A(0);
??SERIALMUX_seleciona_1:
        LDR.N    R1,??DataTable1_2  ;; 0x2009c03c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x8000000
        LDR.N    R2,??DataTable1_2  ;; 0x2009c03c
        STR      R1,[R2, #+0]
//   95          SET_SINAL_MUX_B(1);            
        LDR.N    R1,??DataTable1_4  ;; 0x2009c018
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x400000
        LDR.N    R2,??DataTable1_4  ;; 0x2009c018
        STR      R1,[R2, #+0]
//   96          break;
//   97   }
//   98 }
??SERIALMUX_seleciona_3:
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_FIO1CLR
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO0SET

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x2009c020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x2009c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x2009c03c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x2009c038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x2009c018

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   99 /***********************************************************************************
//  100 *       Fim do arquivo
//  101 ***********************************************************************************/
// 
//  20 bytes in section .noinit (abs)
// 138 bytes in section .text
// 
// 138 bytes of CODE memory
//   0 bytes of DATA memory (+ 20 bytes shared)
//
//Errors: none
//Warnings: none
