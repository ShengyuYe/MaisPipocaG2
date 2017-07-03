///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     26/Jun/2017  17:58:33 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\01_mais_ /
//                    pipoca_exp\MaisPipoca - 2.0.11\Aplicacao\menu_info_bina /
//                    ria.c                                                   /
//    Command line =  "C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\01_mais /
//                    _pipoca_exp\MaisPipoca - 2.0.11\Aplicacao\menu_info_bin /
//                    aria.c" -lC "C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firm /
//                    ware\01_mais_pipoca_exp\MaisPipoca -                    /
//                    2.0.11\Debug\List\" -lA "C:\Users\Marcos\Dropbox\Cli\Al /
//                    mTec\01-Firmware\01_mais_pipoca_exp\MaisPipoca -        /
//                    2.0.11\Debug\List\" -o "C:\Users\Marcos\Dropbox\Cli\Alm /
//                    Tec\01-Firmware\01_mais_pipoca_exp\MaisPipoca -         /
//                    2.0.11\Debug\Obj\" --no_cse --no_unroll --no_inline     /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -Ol                 /
//    List file    =  C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\01_mais_ /
//                    pipoca_exp\MaisPipoca - 2.0.11\Debug\List\menu_info_bin /
//                    aria.s                                                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_info_binaria

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", ""
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN HD44780_posicionaTexto
        EXTERN HD44780_writeChar
        EXTERN HD44780_writeString
        EXTERN TECLADO_getContadorInatividade
        EXTERN TECLADO_getch
        EXTERN sprintf
        EXTERN strlen

        PUBLIC MIB_show
        
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
        
// C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\01_mais_pipoca_exp\MaisPipoca - 2.0.11\Aplicacao\menu_info_binaria.c
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
//   17 |       Arquivo            :  menu_info_binaria.c
//   18 |       Descrição          :  módulo com o software de aplicação da máquina
//   19 |                             de guarda-chuvas
//   20 | 
//   21 |       Autor              :  Marcos Aquino
//   22 |       Data criação       :  07/11/2016
//   23 |
//   24 |       Revisões           :  1.0.0.0
//   25 |
//   26 |
//   27 | __________________________________________________________________________________
//   28 */
//   29 
//   30 /***********************************************************************************
//   31 *       Includes
//   32 ***********************************************************************************/
//   33 #include <stdio.h>
//   34 #include <stdlib.h>
//   35 #include <string.h>
//   36 #include "..\includes.h"
//   37 
//   38 /***********************************************************************************
//   39 *       Definições locais
//   40 ***********************************************************************************/
//   41 
//   42 
//   43 /***********************************************************************************
//   44 *       Constantes locais
//   45 ***********************************************************************************/
//   46 
//   47 
//   48 /***********************************************************************************
//   49 *       Variaveis locais
//   50 ***********************************************************************************/
//   51 
//   52 
//   53 /***********************************************************************************
//   54 *       Funções locais
//   55 ***********************************************************************************/
//   56 
//   57 
//   58 /***********************************************************************************
//   59 *       Implementação das funções
//   60 ***********************************************************************************/
//   61 
//   62 /***********************************************************************************
//   63 *       Descrição       :       Exibe informações de uma função
//   64 *                               binária no LCD
//   65 *       Parametros      :       (char*) titulo
//   66 *                               unsigned char(*)(void)
//   67 *                               (char*) string para o valor ON
//   68 *                               (char*) string para o valor OFF
//   69 *       Retorno         :       nenhum
//   70 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MIB_show
        THUMB
//   71 void MIB_show(char* titulo,unsigned char(*func)(void),char*strON,char*strOFF){
MIB_show:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+20
          CFI CFA R13+40
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//   72   eTECLA tecla;
//   73   char linha[17];
//   74   unsigned char tam;
//   75   
//   76   HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//   77   HD44780_writeString(titulo);
        MOVS     R0,R4
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
        B.N      ??MIB_show_0
//   78   
//   79   for(;TECLADO_getContadorInatividade();){
//   80     
//   81     tecla = TECLADO_getch();
//   82     switch(tecla){
//   83       case TECLA_ENTER:
//   84       case TECLA_ESC:
//   85            return;
//   86     }
//   87     
//   88     if(func())
//   89       sprintf(linha," [%s] ",strON);
//   90     else
//   91       sprintf(linha," [%s] ",strOFF);
??MIB_show_1:
        MOVS     R2,R7
        LDR.N    R1,??MIB_show_2
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//   92     
//   93     tam = strlen(linha);
??MIB_show_3:
        ADD      R0,SP,#+0
          CFI FunCall strlen
        BL       strlen
//   94     HD44780_posicionaTexto((16-tam)>>1,1);
        MOVS     R1,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        RSBS     R0,R0,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//   95     HD44780_writeString(linha);    
        ADD      R0,SP,#+0
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
??MIB_show_0:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??MIB_show_4
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MIB_show_5
        CMP      R0,#+4
        BNE.N    ??MIB_show_6
??MIB_show_5:
        B.N      ??MIB_show_7
??MIB_show_6:
          CFI FunCall
        BLX      R5
        CMP      R0,#+0
        BEQ.N    ??MIB_show_1
        MOVS     R2,R6
        LDR.N    R1,??MIB_show_2
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
        B.N      ??MIB_show_3
//   96   }    
//   97 }
??MIB_show_4:
??MIB_show_7:
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
        Nop      
        DATA
??MIB_show_2:
        DC32     `?<Constant " [%s] ">`
          CFI EndBlock cfiBlock0

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant " [%s] ">`:
        DATA
        DC8 " [%s] "
        DC8 0

        END
//   98 /***********************************************************************************
//   99 *       Fim do arquivo
//  100 ***********************************************************************************/
//  101 
//  102 
// 
//   8 bytes in section .rodata
// 116 bytes in section .text
// 
// 116 bytes of CODE  memory
//   8 bytes of CONST memory
//
//Errors: none
//Warnings: none
