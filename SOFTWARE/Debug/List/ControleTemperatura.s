///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     07/Jul/2017  16:29:30 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Potencia\ControleTemperatura.c          /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Potencia\ControleTemperatura.c -lC      /
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
//                    pocaG2\SOFTWARE\Debug\List\ControleTemperatura.s        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ControleTemperatura

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN AA_calculaTemperatura

        PUBLIC CT_ini
        PUBLIC CT_preset_temperatura
        PUBLIC CT_set_temperatura
        PUBLIC CT_timer_tick
        PUBLIC _A_FIO2CLR
        PUBLIC _A_FIO2DIR
        PUBLIC _A_FIO2SET
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Potencia\ControleTemperatura.c
//    1 /*__________________________________________________________________________________
//    2 |	DEXTRO SOLUÇÕES TECNOLÓGICAS
//    3 |       
//    4 |       ITAJAÍ - SC
//    5 |       www.dextro.ind.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by DEXTRO  and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by DEXTRO 
//   10 |       or its distributors.
//   11 |
//   12 |       Este código é propriedade da DEXTRO  e não pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       DEXTRO  ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :  ControleTemperatura.c
//   18 |       Descrição          :  Menu para configuração do sistema
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  22/02/2017
//   22 |
//   23 |       Revisões           :  1.0.0.0
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 
//   29 /***********************************************************************************
//   30 *       Includes
//   31 ***********************************************************************************/
//   32 #include <stdio.h>
//   33 #include <stdlib.h>
//   34 #include <string.h>
//   35 #include <nxp\iolpc1768.h>

        ASEGN `.noinit`:DATA:NOROOT,02009c040H
        SECTION_GROUP _A_FIO2DIR
// __absolute union <unnamed> volatile _A_FIO2DIR
_A_FIO2DIR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c058H
        SECTION_GROUP _A_FIO2SET
// __absolute union <unnamed> volatile _A_FIO2SET
_A_FIO2SET:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c05cH
        SECTION_GROUP _A_FIO2CLR
// __absolute union <unnamed> volatile _A_FIO2CLR
_A_FIO2CLR:
        DS8 4
//   36 #include "..\includes.h"
//   37 #include "ControleTemperatura.h"
//   38 
//   39 /***********************************************************************************
//   40 *       Definições
//   41 ***********************************************************************************/
//   42 #define PULSO_RESISTENCIA_PIN           (0x01)<<2
//   43 #define INI_PULSO_RESISTENCIA()         FIO2DIR|=PULSO_RESISTENCIA_PIN
//   44 #define SET_PULSO_RESISTENCIA(X)        X?(FIO2SET|=PULSO_RESISTENCIA_PIN):(FIO2CLR|=PULSO_RESISTENCIA_PIN)
//   45 
//   46 /***********************************************************************************
//   47 *       Constantes
//   48 ***********************************************************************************/
//   49 
//   50 
//   51 /***********************************************************************************
//   52 *       Variaveis locais
//   53 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   54 unsigned char CT_preset_temperatura=0;
CT_preset_temperatura:
        DS8 1
//   55 
//   56 /***********************************************************************************
//   57 *       Funções locais
//   58 ***********************************************************************************/
//   59 
//   60 /***********************************************************************************
//   61 *       Descrição       :       Inicializa o módulo de controle da temperatura
//   62 *       Parametros      :       nenhum
//   63 *       Retorno         :       nenhum
//   64 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function CT_ini
          CFI NoCalls
        THUMB
//   65 void CT_ini(void){
//   66   
//   67   INI_PULSO_RESISTENCIA();
CT_ini:
        LDR.N    R0,??DataTable2  ;; 0x2009c040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable2  ;; 0x2009c040
        STR      R0,[R1, #+0]
//   68 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_FIO2DIR
//   69 /***********************************************************************************
//   70 *       Descrição       :       Timer tick para controle da temperatura
//   71 *       Parametros      :       nenhum
//   72 *       Retorno         :       nenhum
//   73 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function CT_timer_tick
        THUMB
//   74 void CT_timer_tick(void){
CT_timer_tick:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   75   unsigned short int temperatura;
//   76   
//   77   if(CT_preset_temperatura){    
        LDR.N    R0,??DataTable2_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??CT_timer_tick_0
//   78     temperatura = AA_calculaTemperatura();
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
//   79     if(temperatura>CT_preset_temperatura)
        LDR.N    R1,??DataTable2_1
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BCS.N    ??CT_timer_tick_1
//   80       SET_PULSO_RESISTENCIA(0);
        LDR.N    R0,??DataTable2_2  ;; 0x2009c05c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable2_2  ;; 0x2009c05c
        STR      R0,[R1, #+0]
        B.N      ??CT_timer_tick_2
//   81     else
//   82       SET_PULSO_RESISTENCIA(1);
??CT_timer_tick_1:
        LDR.N    R0,??DataTable2_3  ;; 0x2009c058
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable2_3  ;; 0x2009c058
        STR      R0,[R1, #+0]
        B.N      ??CT_timer_tick_2
//   83   }  
//   84   else
//   85     SET_PULSO_RESISTENCIA(0);
??CT_timer_tick_0:
        LDR.N    R0,??DataTable2_2  ;; 0x2009c05c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable2_2  ;; 0x2009c05c
        STR      R0,[R1, #+0]
//   86 }
??CT_timer_tick_2:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_FIO2CLR
        REQUIRE _A_FIO2SET
//   87 /***********************************************************************************
//   88 *       Descrição       :       Setter para o preset da temperatura
//   89 *       Parametros      :       (unsigned short int) temperatura
//   90 *       Retorno         :       nenhum
//   91 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function CT_set_temperatura
          CFI NoCalls
        THUMB
//   92 void CT_set_temperatura(unsigned short int temperatura){
//   93   
//   94   CT_preset_temperatura = temperatura;
CT_set_temperatura:
        LDR.N    R1,??DataTable2_1
        STRB     R0,[R1, #+0]
//   95 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x2009c040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     CT_preset_temperatura

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x2009c05c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x2009c058

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   96 /***********************************************************************************
//   97 *       Fim do arquivo
//   98 ***********************************************************************************/
// 
//   1 byte  in section .bss
//  12 bytes in section .noinit (abs)
// 104 bytes in section .text
// 
// 104 bytes of CODE memory
//   1 byte  of DATA memory (+ 12 bytes shared)
//
//Errors: none
//Warnings: none
