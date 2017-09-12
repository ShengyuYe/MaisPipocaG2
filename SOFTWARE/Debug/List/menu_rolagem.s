///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     12/Sep/2017  15:11:48 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_ro /
//                    lagem.c                                                 /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_ro /
//                    lagem.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\Debug /
//                    \List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\ /
//                    List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Ob /
//                    j\ --no_cse --no_unroll --no_inline --no_code_motion    /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\menu_r /
//                    olagem.s                                                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_rolagem

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN HD44780_posicionaTexto
        EXTERN HD44780_writeChar
        EXTERN HD44780_writeString
        EXTERN TECLADO_getContadorInatividade
        EXTERN TECLADO_getch
        EXTERN strlen
        EXTERN vTaskDelay

        PUBLIC MENUROLAGEM_show
        
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_rolagem.c
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
//   17 |       Arquivo            :  menu_rolagem.c
//   18 |       Descrição          :  implementa um menu de rolagem no 
//   19 |                             LCD de caracteres
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
//   36 #include "menu_rolagem.h"
//   37 #include "..\includes.h"
//   38 
//   39 /***********************************************************************************
//   40 *       Definições locais
//   41 ***********************************************************************************/
//   42 
//   43 /***********************************************************************************
//   44 *       Constantes locais
//   45 ***********************************************************************************/
//   46 
//   47 /***********************************************************************************
//   48 *       Variaveis locais
//   49 ***********************************************************************************/
//   50 
//   51 /***********************************************************************************
//   52 *       Funções locais
//   53 ***********************************************************************************/
//   54 
//   55 
//   56 /***********************************************************************************
//   57 *       Implementação das funções
//   58 ***********************************************************************************/
//   59 
//   60 /***********************************************************************************
//   61 *       Descrição       :       Implementação do menu de rolagem
//   62 *       Parametros      :       (
//   63 *       Retorno         :       nenhum
//   64 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MENUROLAGEM_show
        THUMB
//   65 void MENUROLAGEM_show(char* titulo,char** opcoes,unsigned short int tam_opcoes,
//   66                       void(*funcs[])(void)){
MENUROLAGEM_show:
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
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//   67   eTECLA tecla;
//   68   unsigned short int indice=0;
        MOVS     R10,#+0
//   69   unsigned char tam = strlen(titulo);
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
        MOV      R9,R0
//   70   
//   71   HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//   72   HD44780_posicionaTexto((16-tam)>>1,0);
        MOVS     R1,#+0
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        RSBS     R0,R9,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//   73   HD44780_writeString(titulo);
        MOVS     R0,R4
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//   74   
//   75   for(;TECLADO_getContadorInatividade();){
??MENUROLAGEM_show_0:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??MENUROLAGEM_show_1
//   76     
//   77     HD44780_posicionaTexto((16-tam)>>1,0);
        MOVS     R1,#+0
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        RSBS     R0,R9,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//   78     HD44780_writeString(titulo);
        MOVS     R0,R4
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//   79     HD44780_posicionaTexto(0,1);
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//   80     HD44780_writeString(opcoes[indice]);
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        LDR      R0,[R5, R10, LSL #+2]
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//   81     
//   82     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOV      R8,R0
//   83     switch(tecla){
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BEQ.N    ??MENUROLAGEM_show_2
        BCC.N    ??MENUROLAGEM_show_3
        CMP      R8,#+3
        BEQ.N    ??MENUROLAGEM_show_4
        BCC.N    ??MENUROLAGEM_show_5
        CMP      R8,#+4
        BNE.N    ??MENUROLAGEM_show_3
//   84       case TECLA_ENTER:
//   85            if(funcs[indice]!=NULL){
??MENUROLAGEM_show_6:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        LDR      R0,[R7, R10, LSL #+2]
        CMP      R0,#+0
        BEQ.N    ??MENUROLAGEM_show_7
//   86              funcs[indice]();
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        LDR      R0,[R7, R10, LSL #+2]
          CFI FunCall
        BLX      R0
//   87              HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
        B.N      ??MENUROLAGEM_show_8
//   88            }
//   89            else
//   90              if(indice==(tam_opcoes-1))
??MENUROLAGEM_show_7:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        SUBS     R0,R6,#+1
        CMP      R10,R0
        BEQ.N    ??MENUROLAGEM_show_9
//   91                return;
//   92            break;
??MENUROLAGEM_show_8:
        B.N      ??MENUROLAGEM_show_3
//   93       case TECLA_ESC:
//   94            return;
??MENUROLAGEM_show_2:
        B.N      ??MENUROLAGEM_show_9
//   95       case TECLA_INC:
//   96            indice = (indice+1) % tam_opcoes;
??MENUROLAGEM_show_5:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        ADDS     R0,R10,#+1
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        SDIV     R1,R0,R6
        MLS      R10,R6,R1,R0
//   97            break;
        B.N      ??MENUROLAGEM_show_3
//   98       case TECLA_DEC:
//   99            if(indice)
??MENUROLAGEM_show_4:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+0
        BEQ.N    ??MENUROLAGEM_show_10
//  100              indice--;
        SUBS     R10,R10,#+1
        B.N      ??MENUROLAGEM_show_11
//  101            else
//  102              indice = tam_opcoes-1;
??MENUROLAGEM_show_10:
        SUBS     R0,R6,#+1
        MOV      R10,R0
//  103            break;
//  104     }
//  105         
//  106     vTaskDelay(50);
??MENUROLAGEM_show_11:
??MENUROLAGEM_show_3:
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??MENUROLAGEM_show_0
//  107   }  
//  108 }
??MENUROLAGEM_show_1:
??MENUROLAGEM_show_9:
        POP      {R4-R10,PC}      ;; return
          CFI EndBlock cfiBlock0

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  109 /***********************************************************************************
//  110 *       Fim do arquivo
//  111 ***********************************************************************************/
// 
// 236 bytes in section .text
// 
// 236 bytes of CODE memory
//
//Errors: none
//Warnings: none
