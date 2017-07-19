///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     19/Jul/2017  15:05:32 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_seleciona_lista.c        /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_seleciona_lista.c -lC    /
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
//                    pocaG2\SOFTWARE\Debug\List\menu_seleciona_lista.s       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_seleciona_lista

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
        EXTERN MEL_escreve_flag
        EXTERN TECLADO_getContadorInatividade
        EXTERN TECLADO_getch
        EXTERN sprintf
        EXTERN strlen
        EXTERN vTaskDelay

        PUBLIC MSL_entry
        PUBLIC MSL_escreve_flag
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Aplicacao\menu_seleciona_lista.c
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
//   17 |       Arquivo            :  menu_seleciona_lista.c
//   18 |       Descrição          :  Menu para edição de uma lista de flags
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  28/02/2017
//   22 |
//   23 |       Revisões           :  001
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
//   35 #include "menu_seleciona_lista.h"
//   36 #include "menu_edita_listagem.h"
//   37 #include "menu_edita_flag.h"
//   38 #include "..\includes.h"
//   39 
//   40 /***********************************************************************************
//   41 *       Definições locais
//   42 ***********************************************************************************/
//   43 
//   44 
//   45 /***********************************************************************************
//   46 *       Constantes locais
//   47 ***********************************************************************************/
//   48 
//   49 
//   50 /***********************************************************************************
//   51 *       Variaveis locais
//   52 ***********************************************************************************/
//   53 
//   54 
//   55 /***********************************************************************************
//   56 *       Funções locais
//   57 ***********************************************************************************/
//   58 void MSL_escreve_flag(char*label,unsigned char flag);
//   59 
//   60 /***********************************************************************************
//   61 *       Implementação das funções
//   62 ***********************************************************************************/
//   63 
//   64 /***********************************************************************************
//   65 *       Descrição       :       ponto de entrada para a tela de edição
//   66 *                               de listagem de flags
//   67 *       Parametros      :       (char**) labels dos flags
//   68 *                               (unsigned char*) flags
//   69 *                               (unsigned char) tamanho da listagem
//   70 *       Retorno         :       nenhum
//   71 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MSL_entry
        THUMB
//   72 void MSL_entry(char *titulo,char** labels,unsigned char *flags,unsigned char size){
MSL_entry:
        PUSH     {R3-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        MOV      R9,R0
        MOVS     R4,R1
        MOVS     R5,R2
        MOVS     R6,R3
//   73   eTECLA tecla;
//   74   unsigned char indice=0;
        MOVS     R7,#+0
//   75   unsigned char ultimoIndice=255;
        MOV      R8,#+255
//   76   
//   77   HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//   78   unsigned char tam = strlen(titulo);
        MOV      R0,R9
          CFI FunCall strlen
        BL       strlen
//   79   HD44780_posicionaTexto((16-tam)>>1,0);
        MOVS     R1,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        RSBS     R0,R0,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//   80   HD44780_writeString(titulo);
        MOV      R0,R9
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
        B.N      ??MSL_entry_0
//   81   
//   82   for(;TECLADO_getContadorInatividade();){
//   83   
//   84     tecla = TECLADO_getch();
//   85     switch(tecla){
//   86       case TECLA_ENTER:
//   87            for(unsigned char i=0;i<size;i++)
//   88              if(i!=indice)
//   89                flags[i] = 0;
//   90            
//   91            flags[indice]?(flags[indice]=0):(flags[indice]=255);
//   92            ultimoIndice = 255;
//   93            break;
//   94       case TECLA_ESC:
//   95            return;
//   96       case TECLA_INC:
//   97            indice = (indice+1) % size;
//   98            break;
//   99       case TECLA_DEC: 
//  100            if(indice>0)
//  101              indice--;
//  102            else
//  103              indice = size - 1;
??MSL_entry_1:
        SUBS     R7,R6,#+1
//  104            break;
//  105     }
//  106      
//  107     if(ultimoIndice!=indice)
??MSL_entry_2:
??MSL_entry_3:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R8,R7
        BEQ.N    ??MSL_entry_4
//  108       MEL_escreve_flag((char*)labels[indice],flags[indice]);    
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R1,[R7, R5]
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDR      R0,[R4, R7, LSL #+2]
          CFI FunCall MEL_escreve_flag
        BL       MEL_escreve_flag
//  109     
//  110     ultimoIndice = indice;
??MSL_entry_4:
        MOV      R8,R7
//  111     
//  112     vTaskDelay(50); 
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MSL_entry_0:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??MSL_entry_5
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MSL_entry_6
        BCC.N    ??MSL_entry_3
        CMP      R0,#+3
        BEQ.N    ??MSL_entry_7
        BCC.N    ??MSL_entry_8
        CMP      R0,#+4
        BNE.N    ??MSL_entry_3
??MSL_entry_9:
        MOVS     R0,#+0
        B.N      ??MSL_entry_10
??MSL_entry_11:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R0,R7
        BEQ.N    ??MSL_entry_12
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+0
        STRB     R1,[R0, R5]
??MSL_entry_12:
        ADDS     R0,R0,#+1
??MSL_entry_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R0,R6
        BCC.N    ??MSL_entry_11
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R0,[R7, R5]
        CMP      R0,#+0
        BEQ.N    ??MSL_entry_13
        MOVS     R0,#+0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        STRB     R0,[R7, R5]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??MSL_entry_14
??MSL_entry_13:
        MOVS     R0,#+255
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        STRB     R0,[R7, R5]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??MSL_entry_14:
        MOV      R8,#+255
        B.N      ??MSL_entry_3
??MSL_entry_6:
        B.N      ??MSL_entry_15
??MSL_entry_8:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R0,R7,#+1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        SDIV     R1,R0,R6
        MLS      R7,R6,R1,R0
        B.N      ??MSL_entry_3
??MSL_entry_7:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??MSL_entry_1
        SUBS     R7,R7,#+1
        B.N      ??MSL_entry_2
//  113   }  
//  114 }
??MSL_entry_5:
??MSL_entry_15:
        POP      {R0,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock0
//  115 /***********************************************************************************
//  116 *       Descrição       :       Escreve o flag em uma linha
//  117 *       Parametros      :       (unsigned char*) label
//  118 *                               (unsigned char) flag
//  119 *       Retorno         :       nenhum
//  120 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MSL_escreve_flag
        THUMB
//  121 void MSL_escreve_flag(char*label,unsigned char flag){
MSL_escreve_flag:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
//  122   char linha[17];
//  123 
//  124   HD44780_posicionaTexto(0,1);
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  125   HD44780_writeString("                ");  
        LDR.N    R0,??DataTable0
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  126   sprintf(linha,"[%c] %s",flag?'X':' ',label);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??MSL_escreve_flag_0
        MOVS     R2,#+88
        B.N      ??MSL_escreve_flag_1
??MSL_escreve_flag_0:
        MOVS     R2,#+32
??MSL_escreve_flag_1:
        MOVS     R3,R4
        LDR.N    R1,??DataTable0_1
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  127   HD44780_posicionaTexto(0,1);
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  128   HD44780_writeString(linha); 
        ADD      R0,SP,#+0
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  129 }
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
//  130 /***********************************************************************************
//  131 *       Fim do arquivo
//  132 ***********************************************************************************/
// 
//  28 bytes in section .rodata
// 280 bytes in section .text
// 
// 280 bytes of CODE  memory
//  28 bytes of CONST memory
//
//Errors: none
//Warnings: none
