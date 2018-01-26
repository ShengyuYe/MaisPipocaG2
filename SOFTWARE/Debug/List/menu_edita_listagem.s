///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     26/Jan/2018  13:45:02 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_ed /
//                    ita_listagem.c                                          /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_ed /
//                    ita_listagem.c -lC C:\repositorios\MaisPipocaG2\SOFTWAR /
//                    E\Debug\List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE /
//                    \Debug\List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\D /
//                    ebug\Obj\ --no_cse --no_unroll --no_inline              /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\menu_e /
//                    dita_listagem.s                                         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_edita_listagem

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

        PUBLIC MEL_entry
        PUBLIC MEL_escreve_flag
        
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_edita_listagem.c
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
//   17 |       Arquivo            :  menu_edita_listagem.c
//   18 |       Descrição          :  Menu para edição de uma lista de flags
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  28/11/2016
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
//   35 #include "menu_edita_listagem.h"
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
//   56 void MEL_escreve_flag(char*label,unsigned char flag);
//   57 
//   58 /***********************************************************************************
//   59 *       Implementação das funções
//   60 ***********************************************************************************/
//   61 
//   62 /***********************************************************************************
//   63 *       Descrição       :       ponto de entrada para a tela de edição
//   64 *                               de listagem de flags
//   65 *       Parametros      :       (char**) labels dos flags
//   66 *                               (unsigned char*) flags
//   67 *                               (unsigned char) tamanho da listagem
//   68 *       Retorno         :       nenhum
//   69 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MEL_entry
        THUMB
//   70 void MEL_entry(char *titulo,char** labels,unsigned char *flags,unsigned char size){
MEL_entry:
        PUSH     {R3-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+40
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//   71   eTECLA tecla;
//   72   unsigned char indice=0;
        MOVS     R9,#+0
//   73   unsigned char ultimoIndice=255;
        MOV      R10,#+255
//   74   
//   75   HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//   76   unsigned char tam = strlen(titulo);
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
        MOV      R11,R0
//   77   HD44780_posicionaTexto((16-tam)>>1,0);
        MOVS     R1,#+0
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        RSBS     R0,R11,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//   78   HD44780_writeString(titulo);
        MOVS     R0,R4
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//   79   
//   80   for(;TECLADO_getContadorInatividade();){
??MEL_entry_0:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??MEL_entry_1
//   81   
//   82     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOV      R8,R0
//   83     switch(tecla){
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BEQ.N    ??MEL_entry_2
        BCC.N    ??MEL_entry_3
        CMP      R8,#+3
        BEQ.N    ??MEL_entry_4
        BCC.N    ??MEL_entry_5
        CMP      R8,#+4
        BNE.N    ??MEL_entry_3
//   84       case TECLA_ENTER:
//   85            flags[indice]?(flags[indice]=0):(flags[indice]=255);
??MEL_entry_6:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R6]
        CMP      R0,#+0
        BEQ.N    ??MEL_entry_7
        MOVS     R0,#+0
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        STRB     R0,[R9, R6]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??MEL_entry_8
??MEL_entry_7:
        MOVS     R0,#+255
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        STRB     R0,[R9, R6]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
//   86            ultimoIndice = 255;
??MEL_entry_8:
        MOVS     R0,#+255
        MOV      R10,R0
//   87            break;
        B.N      ??MEL_entry_3
//   88       case TECLA_ESC:
//   89            return;
??MEL_entry_2:
        B.N      ??MEL_entry_9
//   90       case TECLA_INC:
//   91            indice = (indice+1) % size;
??MEL_entry_5:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        ADDS     R0,R9,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        SDIV     R1,R0,R7
        MLS      R9,R7,R1,R0
//   92            break;
        B.N      ??MEL_entry_3
//   93       case TECLA_DEC: 
//   94            if(indice>0)
??MEL_entry_4:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??MEL_entry_10
//   95              indice--;
        SUBS     R9,R9,#+1
        B.N      ??MEL_entry_11
//   96            else
//   97              indice = size - 1;
??MEL_entry_10:
        SUBS     R0,R7,#+1
        MOV      R9,R0
//   98            break;
//   99     }
//  100      
//  101     if(ultimoIndice!=indice)
??MEL_entry_11:
??MEL_entry_3:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R10,R9
        BEQ.N    ??MEL_entry_12
//  102       MEL_escreve_flag((char*)labels[indice],flags[indice]);    
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R1,[R9, R6]
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDR      R0,[R5, R9, LSL #+2]
          CFI FunCall MEL_escreve_flag
        BL       MEL_escreve_flag
//  103     
//  104     ultimoIndice = indice;
??MEL_entry_12:
        MOV      R10,R9
//  105     
//  106     vTaskDelay(50); 
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??MEL_entry_0
//  107   }  
//  108 }
??MEL_entry_1:
??MEL_entry_9:
        POP      {R0,R4-R11,PC}   ;; return
          CFI EndBlock cfiBlock0
//  109 /***********************************************************************************
//  110 *       Descrição       :       Escreve o flag em uma linha
//  111 *       Parametros      :       (unsigned char*) label
//  112 *                               (unsigned char) flag
//  113 *       Retorno         :       nenhum
//  114 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MEL_escreve_flag
        THUMB
//  115 void MEL_escreve_flag(char*label,unsigned char flag){
MEL_escreve_flag:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
//  116   char linha[17];
//  117 
//  118   HD44780_posicionaTexto(0,1);
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  119   HD44780_writeString("                ");  
        LDR.N    R0,??DataTable0
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  120   sprintf(linha,"[%c] %s",flag?'X':' ',label);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??MEL_escreve_flag_0
        MOVS     R2,#+88
        B.N      ??MEL_escreve_flag_1
??MEL_escreve_flag_0:
        MOVS     R2,#+32
??MEL_escreve_flag_1:
        MOVS     R3,R4
        LDR.N    R1,??DataTable0_1
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  121   HD44780_posicionaTexto(0,1);
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  122   HD44780_writeString(linha); 
        ADD      R0,SP,#+0
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  123 }
        ADD      SP,SP,#+20
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     `?<Constant "                ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     `?<Constant "[%c] %s">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "                ">`:
        DATA
        DC8 "                "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[%c] %s">`:
        DATA
        DC8 "[%c] %s"

        END
//  124 /***********************************************************************************
//  125 *       Fim do arquivo
//  126 ***********************************************************************************/
// 
//  28 bytes in section .rodata
// 300 bytes in section .text
// 
// 300 bytes of CODE  memory
//  28 bytes of CONST memory
//
//Errors: none
//Warnings: none
