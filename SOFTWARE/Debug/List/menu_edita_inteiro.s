///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     08/Sep/2017  19:51:53 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_ed /
//                    ita_inteiro.c                                           /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_ed /
//                    ita_inteiro.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE /
//                    \Debug\List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\ /
//                    Debug\List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\De /
//                    bug\Obj\ --no_cse --no_unroll --no_inline               /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\menu_e /
//                    dita_inteiro.s                                          /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_edita_inteiro

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", "unknown"
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

        PUBLIC MEI_entry
        PUBLIC MEI_entry_inc
        
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_edita_inteiro.c
//    1 /*__________________________________________________________________________________
//    2 |	DEXTRO SOLU��ES TECNOL�GICAS
//    3 |       
//    4 |       ITAJA� - SC
//    5 |       www.dextro.ind.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by DEXTRO  and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by DEXTRO 
//   10 |       or its distributors.
//   11 |
//   12 |       Este c�digo � propriedade da DEXTRO  e n�o pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       DEXTRO  ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :  menu_edita_inteiro.c
//   18 |       Descri��o          :  Tela para realizar a edi��o de n�meros inteiros
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data cria��o       :  07/11/2016
//   22 |
//   23 |       Revis�es           :  1.0.0.0
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
//   35 #include "menu_edita_inteiro.h"
//   36 #include "..\includes.h"
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
//   49 *       Fun��es locais
//   50 ***********************************************************************************/
//   51 
//   52 
//   53 /***********************************************************************************
//   54 *       Implementa��o das fun��es
//   55 ***********************************************************************************/
//   56 
//   57 /***********************************************************************************
//   58 *       Descri��o       :       Ponto de entrada do menu de edi��o
//   59 *                               de inteiro
//   60 *       Parametro       :       (char*) titulo
//   61 *                               (char*) String de forma��o
//   62 *                               (unsigned int) valor inicial
//   63 *                               (unsigned int) valor m�nimo
//   64 *                               (unsigned int) valor m�ximo
//   65 *       Retorno         :       (unsigned int) valor editado
//   66 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MEI_entry
        THUMB
//   67 unsigned int MEI_entry(char *titulo,char* strFmt,unsigned int inicial,
//   68                        unsigned int minimo,unsigned int maximo){
MEI_entry:
        PUSH     {R4-R10,LR}
          CFI R14 Frame(CFA, -4)
          CFI R10 Frame(CFA, -8)
          CFI R9 Frame(CFA, -12)
          CFI R8 Frame(CFA, -16)
          CFI R7 Frame(CFA, -20)
          CFI R6 Frame(CFA, -24)
          CFI R5 Frame(CFA, -28)
          CFI R4 Frame(CFA, -32)
          CFI CFA R13+32
        SUB      SP,SP,#+24
          CFI CFA R13+56
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R10,R2
        MOVS     R6,R3
        LDR      R7,[SP, #+56]
//   69   eTECLA tecla;
//   70   char linha[17];
//   71   unsigned char tam;
//   72   
//   73   tam = strlen(titulo);
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
        MOV      R9,R0
//   74   
//   75   HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//   76   HD44780_posicionaTexto((16-tam)>>1,0);
        MOVS     R1,#+0
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        RSBS     R0,R9,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//   77   HD44780_writeString(titulo);
        MOVS     R0,R4
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//   78   
//   79   for(;TECLADO_getContadorInatividade();){
??MEI_entry_0:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??MEI_entry_1
//   80          
//   81     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOV      R8,R0
//   82     switch(tecla){
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BEQ.N    ??MEI_entry_2
        BCC.N    ??MEI_entry_3
        CMP      R8,#+3
        BEQ.N    ??MEI_entry_4
        BCC.N    ??MEI_entry_5
        CMP      R8,#+4
        BNE.N    ??MEI_entry_3
//   83       case TECLA_ENTER:
//   84       case TECLA_ESC:
//   85            return inicial;
??MEI_entry_2:
        MOV      R0,R10
        B.N      ??MEI_entry_6
//   86       case TECLA_INC:
//   87            if(inicial<maximo)
??MEI_entry_5:
        CMP      R10,R7
        BCS.N    ??MEI_entry_7
//   88              inicial++;
        ADDS     R10,R10,#+1
//   89            break;
??MEI_entry_7:
        B.N      ??MEI_entry_3
//   90       case TECLA_DEC:
//   91            if(inicial>minimo)
??MEI_entry_4:
        CMP      R6,R10
        BCS.N    ??MEI_entry_8
//   92              inicial--;
        SUBS     R10,R10,#+1
//   93            break;
//   94     }
//   95     
//   96     sprintf(linha,strFmt,inicial);
??MEI_entry_8:
??MEI_entry_3:
        MOV      R2,R10
        MOVS     R1,R5
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//   97     tam = strlen(linha);
        ADD      R0,SP,#+0
          CFI FunCall strlen
        BL       strlen
        MOV      R9,R0
//   98     HD44780_posicionaTexto((16-tam)>>1,1);
        MOVS     R1,#+1
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        RSBS     R0,R9,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//   99     HD44780_writeString(linha);
        ADD      R0,SP,#+0
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  100     
//  101     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??MEI_entry_0
//  102   }                        
//  103                          
//  104   return inicial;                         
??MEI_entry_1:
        MOV      R0,R10
??MEI_entry_6:
        ADD      SP,SP,#+24
          CFI CFA R13+32
        POP      {R4-R10,PC}      ;; return
          CFI EndBlock cfiBlock0
//  105 }
//  106 /***********************************************************************************
//  107 *       Descri��o       :       Ponto de entrada do menu de edi��o
//  108 *                               de inteiro
//  109 *       Parametro       :       (char*) titulo
//  110 *                               (char*) String de forma��o
//  111 *                               (unsigned int) valor inicial
//  112 *                               (unsigned int) valor m�nimo
//  113 *                               (unsigned int) valor m�ximo
//  114 *       Retorno         :       (unsigned int) valor editado
//  115 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MEI_entry_inc
        THUMB
//  116 unsigned int MEI_entry_inc(char *titulo,char* strFmt,unsigned int inicial,
//  117                            unsigned int minimo,unsigned int maximo,unsigned int incremento){
MEI_entry_inc:
        PUSH     {R4-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+36
        SUB      SP,SP,#+20
          CFI CFA R13+56
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+56]
        LDR      R9,[SP, #+60]
//  118   eTECLA tecla;
//  119   char linha[17];
//  120   unsigned char tam;
//  121   
//  122   tam = strlen(titulo);
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
        MOV      R11,R0
//  123   
//  124   HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//  125   HD44780_posicionaTexto((16-tam)>>1,0);
        MOVS     R1,#+0
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        RSBS     R0,R11,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  126   HD44780_writeString(titulo);
        MOVS     R0,R4
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  127   
//  128   for(;TECLADO_getContadorInatividade();){
??MEI_entry_inc_0:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??MEI_entry_inc_1
//  129          
//  130     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOV      R10,R0
//  131     switch(tecla){
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+1
        BEQ.N    ??MEI_entry_inc_2
        BCC.N    ??MEI_entry_inc_3
        CMP      R10,#+3
        BEQ.N    ??MEI_entry_inc_4
        BCC.N    ??MEI_entry_inc_5
        CMP      R10,#+4
        BNE.N    ??MEI_entry_inc_3
//  132       case TECLA_ENTER:
//  133       case TECLA_ESC:
//  134            return inicial;
??MEI_entry_inc_2:
        MOVS     R0,R6
        B.N      ??MEI_entry_inc_6
//  135       case TECLA_INC:
//  136            if(inicial<maximo)
??MEI_entry_inc_5:
        CMP      R6,R8
        BCS.N    ??MEI_entry_inc_7
//  137              inicial+=incremento;
        ADDS     R6,R9,R6
//  138            break;
??MEI_entry_inc_7:
        B.N      ??MEI_entry_inc_3
//  139       case TECLA_DEC:
//  140            if(inicial>minimo)
??MEI_entry_inc_4:
        CMP      R7,R6
        BCS.N    ??MEI_entry_inc_8
//  141              inicial-=incremento;
        SUBS     R6,R6,R9
//  142            break;
//  143     }
//  144     
//  145     sprintf(linha,strFmt,inicial);
??MEI_entry_inc_8:
??MEI_entry_inc_3:
        MOVS     R2,R6
        MOVS     R1,R5
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  146     tam = strlen(linha);
        ADD      R0,SP,#+0
          CFI FunCall strlen
        BL       strlen
        MOV      R11,R0
//  147     HD44780_posicionaTexto((16-tam)>>1,1);
        MOVS     R1,#+1
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        RSBS     R0,R11,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  148     HD44780_writeString(linha);
        ADD      R0,SP,#+0
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  149     
//  150     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??MEI_entry_inc_0
//  151   }                        
//  152                          
//  153   return inicial;                         
??MEI_entry_inc_1:
        MOVS     R0,R6
??MEI_entry_inc_6:
        ADD      SP,SP,#+20
          CFI CFA R13+36
        POP      {R4-R11,PC}      ;; return
          CFI EndBlock cfiBlock1
//  154 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  155 /***********************************************************************************
//  156 *       Fim do arquivo
//  157 ***********************************************************************************/
//  158 
//  159 
//  160 
// 
// 354 bytes in section .text
// 
// 354 bytes of CODE memory
//
//Errors: none
//Warnings: none
