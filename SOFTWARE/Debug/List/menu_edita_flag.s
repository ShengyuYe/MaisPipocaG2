///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  13:22:14 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_edita_flag.c             /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_edita_flag.c -lC         /
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
//                    pocaG2\SOFTWARE\Debug\List\menu_edita_flag.s            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_edita_flag

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
        EXTERN vTaskDelay

        PUBLIC MEF_entry
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Aplicacao\menu_edita_flag.c
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
//   17 |       Arquivo            :  Menu_edita_flag.c
//   18 |       Descrição          :  Tela para realizar a edição de números inteiros
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  07/11/2016
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
//   35 #include "..\includes.h"
//   36 #include "menu_edita_inteiro.h"
//   37 
//   38 /***********************************************************************************
//   39 *       Constantes
//   40 ***********************************************************************************/
//   41 
//   42 
//   43 /***********************************************************************************
//   44 *       Variaveis locais
//   45 ***********************************************************************************/
//   46 
//   47 
//   48 /***********************************************************************************
//   49 *       Funções locais
//   50 ***********************************************************************************/
//   51 
//   52 
//   53 /***********************************************************************************
//   54 *       Implementação das funções
//   55 ***********************************************************************************/
//   56 
//   57 /***********************************************************************************
//   58 *       Descrição       :       Ponto de entrada do menu de edição
//   59 *                               de inteiro
//   60 *       Parametro       :       (char*) titulo
//   61 *                               (char*) String de formação
//   62 *                               (unsigned int) valor inicial
//   63 *                               (unsigned int) valor mínimo
//   64 *                               (unsigned int) valor máximo
//   65 *       Retorno         :       (unsigned int) valor editado
//   66 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MEF_entry
        THUMB
//   67 unsigned char MEF_entry(char *titulo,unsigned char flag,char *onSTR,char*offSTR){
MEF_entry:
        PUSH     {R4-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+28
        SUB      SP,SP,#+20
          CFI CFA R13+48
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//   68   eTECLA tecla;
//   69   char linha[17];
//   70   unsigned char tam;
//   71   unsigned char ultimo_tam;
//   72   
//   73   tam = strlen(titulo);
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
        MOV      R8,R0
//   74   
//   75   HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//   76   HD44780_posicionaTexto((16-tam)>>1,0);
        MOVS     R1,#+0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        RSBS     R0,R8,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//   77   HD44780_writeString(titulo);
        MOVS     R0,R4
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//   78   
//   79   if(flag) 
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??MEF_entry_0
//   80     flag = 255;
        MOVS     R5,#+255
        B.N      ??MEF_entry_0
//   81   
//   82   for(;TECLADO_getContadorInatividade();){
//   83          
//   84     tecla = TECLADO_getch();
//   85     switch(tecla){
//   86       case TECLA_ENTER:
//   87       case TECLA_ESC:
//   88            return flag;
//   89       case TECLA_INC:
//   90       case TECLA_DEC:        
//   91            flag^=0xFF;
//   92            break;
//   93     }
//   94     
//   95     sprintf(linha,"[%s]",flag?onSTR:offSTR);
??MEF_entry_1:
        MOVS     R2,R7
??MEF_entry_2:
        LDR.N    R1,??MEF_entry_3
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//   96     tam = strlen(linha);
        ADD      R0,SP,#+0
          CFI FunCall strlen
        BL       strlen
        MOV      R8,R0
//   97     if(tam!=ultimo_tam){
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R8,R9
        BEQ.N    ??MEF_entry_4
//   98       HD44780_posicionaTexto(0,1);  
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//   99       HD44780_writeString("                ");
        LDR.N    R0,??MEF_entry_3+0x4
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  100     }
//  101     HD44780_posicionaTexto((16-tam)>>1,1);
??MEF_entry_4:
        MOVS     R1,#+1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        RSBS     R0,R8,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  102     HD44780_writeString(linha);
        ADD      R0,SP,#+0
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  103                         
//  104     ultimo_tam = tam;
        MOV      R9,R8
//  105     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MEF_entry_0:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??MEF_entry_5
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MEF_entry_6
        BCC.N    ??MEF_entry_7
        CMP      R0,#+3
        BEQ.N    ??MEF_entry_8
        BCC.N    ??MEF_entry_8
        CMP      R0,#+4
        BNE.N    ??MEF_entry_7
??MEF_entry_6:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??MEF_entry_9
??MEF_entry_8:
        EORS     R5,R5,#0xFF
??MEF_entry_7:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??MEF_entry_1
        MOVS     R2,R6
        B.N      ??MEF_entry_2
//  106   }                        
//  107                          
//  108   return flag;                         
??MEF_entry_5:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??MEF_entry_9:
        ADD      SP,SP,#+20
          CFI CFA R13+28
        POP      {R4-R9,PC}       ;; return
        Nop      
        DATA
??MEF_entry_3:
        DC32     `?<Constant "[%s]">`
        DC32     `?<Constant "                ">`
          CFI EndBlock cfiBlock0
//  109 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[%s]">`:
        DATA
        DC8 "[%s]"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "                ">`:
        DATA
        DC8 "                "
        DC8 0, 0, 0

        END
//  110 /***********************************************************************************
//  111 *       Fim do arquivo
//  112 ***********************************************************************************/
//  113 
//  114 
//  115 
// 
//  28 bytes in section .rodata
// 208 bytes in section .text
// 
// 208 bytes of CODE  memory
//  28 bytes of CONST memory
//
//Errors: none
//Warnings: none
