///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     10/Jul/2017  15:20:20 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\RTC\RTC.C                       /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\RTC\RTC.C -lC                   /
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
//                    pocaG2\SOFTWARE\Debug\List\RTC.s                        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME RTC

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC RTC_getValue
        PUBLIC RTC_init
        PUBLIC RTC_setValue
        PUBLIC _A_PCONP
        PUBLIC _A_RTCCCR
        PUBLIC _A_RTCDOM
        PUBLIC _A_RTCHOUR
        PUBLIC _A_RTCMIN
        PUBLIC _A_RTCMONTH
        PUBLIC _A_RTCSEC
        PUBLIC _A_RTCYEAR
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\RTC\RTC.C
//    1 /*__________________________________________________________________________________
//    2 |	Quark Tecnologia Eletrônica Ltda.
//    3 |       
//    4 |       Itapema - SC
//    5 |       www.quarktee.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Quark and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Quark
//   10 |       or its distributors.
//   11 |
//   12 |       Este código é propriedade da Quark e não pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       Quark ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :  rtc.c
//   18 |       Descrição          :  Funções para manutenção do rtc do 
//   19 |                             LPC1768
//   20 | 
//   21 |       Autor              :  Marcos Aquino
//   22 |       Data criação       :  28/07/2011
//   23 |
//   24 |       Revisões           :  1.0
//   25 |
//   26 |
//   27 | __________________________________________________________________________________
//   28 */
//   29 /***********************************************************************************
//   30 *     Includes
//   31 ***********************************************************************************/
//   32 #include <nxp\iolpc1768.h>

        ASEGN `.noinit`:DATA:NOROOT,0400fc0c4H
        SECTION_GROUP _A_PCONP
// __absolute union <unnamed> volatile _A_PCONP
_A_PCONP:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040024008H
        SECTION_GROUP _A_RTCCCR
// __absolute union <unnamed> volatile _A_RTCCCR
_A_RTCCCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040024020H
        SECTION_GROUP _A_RTCSEC
// __absolute union <unnamed> volatile _A_RTCSEC
_A_RTCSEC:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040024024H
        SECTION_GROUP _A_RTCMIN
// __absolute union <unnamed> volatile _A_RTCMIN
_A_RTCMIN:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040024028H
        SECTION_GROUP _A_RTCHOUR
// __absolute union <unnamed> volatile _A_RTCHOUR
_A_RTCHOUR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04002402cH
        SECTION_GROUP _A_RTCDOM
// __absolute union <unnamed> volatile _A_RTCDOM
_A_RTCDOM:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040024038H
        SECTION_GROUP _A_RTCMONTH
// __absolute union <unnamed> volatile _A_RTCMONTH
_A_RTCMONTH:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04002403cH
        SECTION_GROUP _A_RTCYEAR
// __absolute union <unnamed> volatile _A_RTCYEAR
_A_RTCYEAR:
        DS8 4
//   33 #include "..\..\includes.h"
//   34 #include "rtc.h"
//   35 
//   36 /***********************************************************************************
//   37 *     Definições com constantes utilizadas no programa
//   38 ***********************************************************************************/ 
//   39 
//   40 
//   41 
//   42 /***********************************************************************************
//   43 *     Enumerações
//   44 ***********************************************************************************/
//   45 
//   46 
//   47 /***********************************************************************************
//   48 *     Estruturas
//   49 ***********************************************************************************/
//   50 
//   51 
//   52 /***********************************************************************************
//   53 *     Uniões
//   54 ***********************************************************************************/
//   55 
//   56 
//   57 /***********************************************************************************
//   58 *     Constantes
//   59 ***********************************************************************************/
//   60 
//   61 
//   62 /***********************************************************************************
//   63 *     Variaveis locais
//   64 ***********************************************************************************/
//   65 
//   66 
//   67 /***********************************************************************************
//   68 *     Funções locais
//   69 ***********************************************************************************/
//   70  
//   71 /***********************************************************************************
//   72 *     Implementação
//   73 ***********************************************************************************/
//   74 
//   75 /***********************************************************************************
//   76 *     Descrição   :   Inicialização do módulo
//   77 *     Parametros  :   nenhum
//   78 *     Retorno     :   nenhum
//   79 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function RTC_init
          CFI NoCalls
        THUMB
//   80 void RTC_init(void){
//   81   
//   82   PCONP_bit.PCRTC = 1; // Habilita a alimentação do periférico    
RTC_init:
        LDR.N    R0,??DataTable2  ;; 0x400fc0c4
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable2  ;; 0x400fc0c4
        STR      R0,[R1, #+0]
//   83   
//   84   RTCCCR = 0x00;
        LDR.N    R0,??DataTable2_1  ;; 0x40024008
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   85   RTCCCR_bit.CLKEN = 1; // Clock habilitado
        LDR.N    R0,??DataTable2_1  ;; 0x40024008
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable2_1  ;; 0x40024008
        STR      R0,[R1, #+0]
//   86   
//   87 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_PCONP
        REQUIRE _A_RTCCCR
//   88 /***********************************************************************************
//   89 *    Descrição    :   Ajusta a hora, minuto e segundo do rtc
//   90 *    Parametros   :   (unsigned char) hora
//   91 *                     (unsigned char) minuto
//   92 *                     (unsigned char) segundos
//   93 *                     (unsigned char) dia
//   94 *                     (unsigned char) mes
//   95 *                     (unsigned int ) ano
//   96 *   Retorno       :   nenhum
//   97 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function RTC_setValue
          CFI NoCalls
        THUMB
//   98 void RTC_setValue(unsigned char hour,unsigned char minute,unsigned char second,
//   99                   unsigned char day,unsigned char month,unsigned int year){
RTC_setValue:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        LDR      R4,[SP, #+12]
        LDR      R5,[SP, #+16]
//  100  
//  101   RTCSEC = second;
        LDR.N    R6,??DataTable2_2  ;; 0x40024020
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STR      R2,[R6, #+0]
//  102   RTCMIN = minute;
        LDR.N    R2,??DataTable2_3  ;; 0x40024024
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R1,[R2, #+0]
//  103   RTCHOUR = hour;
        LDR.N    R1,??DataTable2_4  ;; 0x40024028
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
//  104   RTCDOM = day;
        LDR.N    R0,??DataTable2_5  ;; 0x4002402c
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        STR      R3,[R0, #+0]
//  105   RTCMONTH = month;
        LDR.N    R0,??DataTable2_6  ;; 0x40024038
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R4,[R0, #+0]
//  106   RTCYEAR = year;                                      
        LDR.N    R0,??DataTable2_7  ;; 0x4002403c
        STR      R5,[R0, #+0]
//  107 }
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_RTCSEC
        REQUIRE _A_RTCMIN
        REQUIRE _A_RTCHOUR
        REQUIRE _A_RTCDOM
        REQUIRE _A_RTCMONTH
        REQUIRE _A_RTCYEAR
//  108 /***********************************************************************************
//  109 *    Descrição   :    Lê os valores de hora,minuto,segundo,dia,mes e ano do rtc
//  110 *    Parametros  :    (unsigned char*) hora
//  111 *                     (unsigned char*) minuto
//  112 *                     (unsigned char*) segundo
//  113 *                     (unsigned char*) dia
//  114 *                     (unsigned char*) mes
//  115 *                     (unsigned int*) ano
//  116 *   Retorno     :     nenhum
//  117 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function RTC_getValue
          CFI NoCalls
        THUMB
//  118 void RTC_getValue(unsigned char *hour,unsigned char *minute,unsigned char *second,
//  119                   unsigned char *day,unsigned char *month,unsigned int *year){
RTC_getValue:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        LDR      R5,[SP, #+12]
        LDR      R4,[SP, #+16]
//  120                     
//  121   *second = RTCSEC;
        LDR.N    R6,??DataTable2_2  ;; 0x40024020
        LDR      R6,[R6, #+0]
        STRB     R6,[R2, #+0]
//  122   *minute = RTCMIN;
        LDR.N    R2,??DataTable2_3  ;; 0x40024024
        LDR      R2,[R2, #+0]
        STRB     R2,[R1, #+0]
//  123   *hour = RTCHOUR;
        LDR.N    R1,??DataTable2_4  ;; 0x40024028
        LDR      R1,[R1, #+0]
        STRB     R1,[R0, #+0]
//  124   *day = RTCDOM;
        LDR.N    R0,??DataTable2_5  ;; 0x4002402c
        LDR      R0,[R0, #+0]
        STRB     R0,[R3, #+0]
//  125   *month = RTCMONTH;
        LDR.N    R0,??DataTable2_6  ;; 0x40024038
        LDR      R0,[R0, #+0]
        STRB     R0,[R5, #+0]
//  126   *year = RTCYEAR;                    
        LDR.N    R0,??DataTable2_7  ;; 0x4002403c
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+0]
//  127 }
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
        REQUIRE _A_RTCSEC
        REQUIRE _A_RTCMIN
        REQUIRE _A_RTCHOUR
        REQUIRE _A_RTCDOM
        REQUIRE _A_RTCMONTH
        REQUIRE _A_RTCYEAR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x400fc0c4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x40024008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x40024020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x40024024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x40024028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x4002402c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x40024038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x4002403c

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  128 /***********************************************************************************
//  129 *		Fim do arquivo
//  130 ***********************************************************************************/
// 
//  32 bytes in section .noinit (abs)
// 154 bytes in section .text
// 
// 154 bytes of CODE memory
//   0 bytes of DATA memory (+ 32 bytes shared)
//
//Errors: none
//Warnings: none
