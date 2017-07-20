///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  13:55:25 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\IU\leds.c                               /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\IU\leds.c -lC                           /
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
//                    pocaG2\SOFTWARE\Debug\List\leds.s                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME leds

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN vTaskDelay

        PUBLIC LEDS_envia_bitstream
        PUBLIC LEDS_espelho_leds
        PUBLIC LEDS_ini
        PUBLIC LEDS_main
        PUBLIC LEDS_setter_led
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\IU\leds.c
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
//   17 |       Arquivo            :  leds.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  24/02/2017
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
//   35 #include "..\includes.h"
//   36 
//   37 /***********************************************************************************
//   38 *       Definições locais
//   39 ***********************************************************************************/
//   40 #define LED_DATA_PIN                            (0x01)<<20
//   41 #define LED_CLOCK_PIN                           (0x01)<<22
//   42 #define LED_STROBE_PIN                          (0x01)<<21
//   43 
//   44 #define INI_LED_PINS()                          FIO1DIR|=LED_DATA_PIN|LED_CLOCK_PIN|LED_STROBE_PIN
//   45 
//   46 #define SET_LED_DATA(X)                         X?(FIO1SET|=LED_DATA_PIN ): (FIO1CLR|=LED_DATA_PIN)
//   47 #define SET_CLOCK(X)                            X?(FIO1SET|=LED_CLOCK_PIN): (FIO1CLR|=LED_CLOCK_PIN)
//   48 #define SET_STROBE(X)                           X?(FIO1SET|=LED_STROBE_PIN):(FIO1CLR|=LED_STROBE_PIN)
//   49 
//   50 /***********************************************************************************
//   51 *       Variaveis locais
//   52 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   53 unsigned char LEDS_espelho_leds={0};
LEDS_espelho_leds:
        DS8 1
//   54 //unsigned int LEDS_temp=0;
//   55 
//   56 /***********************************************************************************
//   57 *       Funções locais
//   58 ***********************************************************************************/
//   59 void LEDS_envia_bitstream(unsigned char valor);
//   60 
//   61 /***********************************************************************************
//   62 *       Implementação das funções
//   63 ***********************************************************************************/
//   64 
//   65 /***********************************************************************************
//   66 *       Descrição       :       Inicialização do módulo de controle
//   67 *                               dos leds
//   68 *       Parametros      :       nenhum
//   69 *       Retorno         :       nenhu
//   70 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function LEDS_ini
          CFI NoCalls
        THUMB
//   71 void LEDS_ini(void){
//   72   
//   73   INI_LED_PINS();
LEDS_ini:
        LDR.N    R0,??DataTable3  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x700000
        LDR.N    R1,??DataTable3  ;; 0x2009c020
        STR      R0,[R1, #+0]
//   74 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_FIO1DIR
//   75 /***********************************************************************************
//   76 *       Descrição       :       Função principal da thread de controle dos
//   77 *                               leds
//   78 *       Parametros      :       nenhum
//   79 *       Retorno         :       nenhum
//   80 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function LEDS_main
        THUMB
//   81 void LEDS_main(void*pPar){
LEDS_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   82   
//   83   for(;;){
//   84     
//   85     LEDS_envia_bitstream(LEDS_espelho_leds);
??LEDS_main_0:
        LDR.N    R0,??DataTable3_1
        LDRB     R0,[R0, #+0]
          CFI FunCall LEDS_envia_bitstream
        BL       LEDS_envia_bitstream
//   86     vTaskDelay(100);
        MOVS     R0,#+100
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??LEDS_main_0
          CFI EndBlock cfiBlock1
//   87   }  
//   88 }
//   89 /***********************************************************************************
//   90 *       Descrição       :       Envia o dado dos leds para o registrador
//   91 *                               de deslocamento
//   92 *       Parametros      :       nenhum
//   93 *       Retorno         :       nenhum
//   94 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function LEDS_envia_bitstream
        THUMB
//   95 void LEDS_envia_bitstream(unsigned char valor){
LEDS_envia_bitstream:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   96   
//   97   for(unsigned char i=0;i<8;i++){
        MOVS     R1,#+0
        B.N      ??LEDS_envia_bitstream_0
//   98     
//   99     SET_CLOCK(1);
??LEDS_envia_bitstream_1:
        LDR.N    R2,??DataTable3_2  ;; 0x2009c038
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x400000
        LDR.N    R3,??DataTable3_2  ;; 0x2009c038
        STR      R2,[R3, #+0]
//  100     
//  101     SET_LED_DATA(0);
        LDR.N    R2,??DataTable3_3  ;; 0x2009c03c
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x100000
        LDR.N    R3,??DataTable3_3  ;; 0x2009c03c
        STR      R2,[R3, #+0]
//  102     if(valor&(0x01<<i))
        MOVS     R2,#+1
        LSLS     R2,R2,R1
        MOVS     R3,R0
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        TST      R3,R2
        BEQ.N    ??LEDS_envia_bitstream_2
//  103       SET_LED_DATA(1);
        LDR.N    R2,??DataTable3_2  ;; 0x2009c038
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x100000
        LDR.N    R3,??DataTable3_2  ;; 0x2009c038
        STR      R2,[R3, #+0]
//  104     
//  105     SET_CLOCK(0);    
??LEDS_envia_bitstream_2:
        LDR.N    R2,??DataTable3_3  ;; 0x2009c03c
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x400000
        LDR.N    R3,??DataTable3_3  ;; 0x2009c03c
        STR      R2,[R3, #+0]
//  106   }
        ADDS     R1,R1,#+1
??LEDS_envia_bitstream_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+8
        BLT.N    ??LEDS_envia_bitstream_1
//  107   
//  108   SET_STROBE(1);
        LDR.N    R0,??DataTable3_2  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200000
        LDR.N    R1,??DataTable3_2  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  109   vTaskDelay(1);
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  110   SET_STROBE(0);  
        LDR.N    R0,??DataTable3_3  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200000
        LDR.N    R1,??DataTable3_3  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  111 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO1CLR
//  112 /***********************************************************************************
//  113 *       Descrição       :       Setter para os leds
//  114 *       Parametros      :       (unsigned char) led
//  115 *                               (unsigned char) estado
//  116 *       Retorno         :       nenhum
//  117 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function LEDS_setter_led
          CFI NoCalls
        THUMB
//  118 void LEDS_setter_led(unsigned char led,unsigned char estado){
//  119   
//  120   if(estado)
LEDS_setter_led:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??LEDS_setter_led_0
//  121     LEDS_espelho_leds |=  (0x01)<<led;
        LDR.N    R1,??DataTable3_1
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R0,R2,R0
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+0]
        B.N      ??LEDS_setter_led_1
//  122   else
//  123     LEDS_espelho_leds &= ~((0x01)<<led);
??LEDS_setter_led_0:
        LDR.N    R1,??DataTable3_1
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R0,R2,R0
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+0]
//  124 }
??LEDS_setter_led_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x2009c020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     LEDS_espelho_leds

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x2009c038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x2009c03c

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  125 /***********************************************************************************
//  126 *       Fim do arquivo
//  127 ***********************************************************************************/
// 
//   1 byte  in section .bss
//  12 bytes in section .noinit (abs)
// 198 bytes in section .text
// 
// 198 bytes of CODE memory
//   1 byte  of DATA memory (+ 12 bytes shared)
//
//Errors: none
//Warnings: none
