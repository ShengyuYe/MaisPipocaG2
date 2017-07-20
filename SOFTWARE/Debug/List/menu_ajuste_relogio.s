///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  13:45:21 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_ajuste_relogio.c         /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_ajuste_relogio.c -lC     /
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
//                    pocaG2\SOFTWARE\Debug\List\menu_ajuste_relogio.s        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_ajuste_relogio

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", "flags,widths"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN HD44780_desligaCursorPiscante
        EXTERN HD44780_ligaCursorPiscante
        EXTERN HD44780_posicionaTexto
        EXTERN HD44780_writeChar
        EXTERN HD44780_writeString
        EXTERN RTC_getValue
        EXTERN RTC_setValue
        EXTERN TECLADO_getContadorInatividade
        EXTERN TECLADO_getch
        EXTERN __aeabi_memcpy4
        EXTERN sprintf
        EXTERN vTaskDelay

        PUBLIC MARTC_entry
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Aplicacao\menu_ajuste_relogio.c
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
//   17 |       Arquivo            :  menu_ajuste_relogio.c
//   18 |       Descrição          :  Menu
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  18/01/2017
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
//   36 #include "menu_ajuste_relogio.h"
//   37 
//   38 /***********************************************************************************
//   39 *       Definições locais
//   40 ***********************************************************************************/
//   41 
//   42 
//   43 /***********************************************************************************
//   44 *       Constantes
//   45 ***********************************************************************************/
//   46 
//   47 
//   48 /***********************************************************************************
//   49 *       Variaveis - locais
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
//   63 *       Descrição       :       Ponto de entrada do menu para configuração
//   64 *                               do RTC
//   65 *       Parametros      :       nenhum
//   66 *       Retorno         :       nenhum
//   67 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MARTC_entry
        THUMB
//   68 void MARTC_entry(void){
MARTC_entry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+120
          CFI CFA R13+128
//   69   unsigned char hora;
//   70   unsigned char minuto;
//   71   unsigned char segundo;
//   72   unsigned char dia;
//   73   unsigned char mes;
//   74   unsigned int ano;
//   75   eTECLA tecla;
//   76   unsigned int matriz_edicao[6];
//   77   unsigned int limites_inf[6]={0,0,0,1,1,2017};
        ADD      R0,SP,#+96
        LDR.N    R1,??MARTC_entry_0
        MOVS     R2,#+24
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
//   78   unsigned int limites_sup[6]={23,59,59,31,12,2117};  
        ADD      R0,SP,#+72
        LDR.N    R1,??MARTC_entry_0+0x4
        MOVS     R2,#+24
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
//   79   unsigned int indice=0;
        MOVS     R4,#+0
//   80   char linha[17];
//   81   const unsigned char posicoes[6]={4,7,10,2,5,8};
        ADD      R0,SP,#+44
        LDR.N    R1,??MARTC_entry_0+0x8
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//   82   
//   83   RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
        ADD      R0,SP,#+16
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+9
        ADD      R2,SP,#+10
        ADD      R1,SP,#+11
        ADD      R0,SP,#+12
          CFI FunCall RTC_getValue
        BL       RTC_getValue
//   84   if(hora>23) hora = 23;
        LDRB     R0,[SP, #+12]
        CMP      R0,#+24
        BLT.N    ??MARTC_entry_1
        MOVS     R0,#+23
        STRB     R0,[SP, #+12]
//   85   if(minuto>59) minuto = 59;
??MARTC_entry_1:
        LDRB     R0,[SP, #+11]
        CMP      R0,#+60
        BLT.N    ??MARTC_entry_2
        MOVS     R0,#+59
        STRB     R0,[SP, #+11]
//   86   if(segundo>59) segundo = 59;
??MARTC_entry_2:
        LDRB     R0,[SP, #+10]
        CMP      R0,#+60
        BLT.N    ??MARTC_entry_3
        MOVS     R0,#+59
        STRB     R0,[SP, #+10]
//   87   if(!dia || dia>31) dia = 1;
??MARTC_entry_3:
        LDRB     R0,[SP, #+9]
        CMP      R0,#+0
        BEQ.N    ??MARTC_entry_4
        LDRB     R0,[SP, #+9]
        CMP      R0,#+32
        BLT.N    ??MARTC_entry_5
??MARTC_entry_4:
        MOVS     R0,#+1
        STRB     R0,[SP, #+9]
//   88   if(!mes || mes>12) mes = 1;
??MARTC_entry_5:
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BEQ.N    ??MARTC_entry_6
        LDRB     R0,[SP, #+8]
        CMP      R0,#+13
        BLT.N    ??MARTC_entry_7
??MARTC_entry_6:
        MOVS     R0,#+1
        STRB     R0,[SP, #+8]
//   89   if(ano<2017 || ano>2117) ano = 2017;
??MARTC_entry_7:
        LDR      R0,[SP, #+16]
        SUBW     R0,R0,#+2017
        CMP      R0,#+101
        BCC.N    ??MARTC_entry_8
        MOVW     R0,#+2017
        STR      R0,[SP, #+16]
//   90   
//   91   matriz_edicao[0] = hora;
??MARTC_entry_8:
        LDRB     R0,[SP, #+12]
        STR      R0,[SP, #+20]
//   92   matriz_edicao[1] = minuto;
        LDRB     R0,[SP, #+11]
        STR      R0,[SP, #+24]
//   93   matriz_edicao[2] = segundo;
        LDRB     R0,[SP, #+10]
        STR      R0,[SP, #+28]
//   94   matriz_edicao[3] = dia;
        LDRB     R0,[SP, #+9]
        STR      R0,[SP, #+32]
//   95   matriz_edicao[4] = mes;
        LDRB     R0,[SP, #+8]
        STR      R0,[SP, #+36]
//   96   matriz_edicao[5] = ano;
        LDR      R0,[SP, #+16]
        STR      R0,[SP, #+40]
//   97   
//   98   HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
        B.N      ??MARTC_entry_9
//   99   
//  100   for(;TECLADO_getContadorInatividade();){
//  101     
//  102     tecla = TECLADO_getch();
//  103     switch(tecla){
//  104       case TECLA_ENTER: 
//  105            indice++;
//  106            if(indice>5){
//  107              RTC_setValue(matriz_edicao[0],matriz_edicao[1],matriz_edicao[2],
//  108                           matriz_edicao[3],matriz_edicao[4],matriz_edicao[5]);
//  109            }
//  110            else
//  111              break;
//  112       case TECLA_ESC:
//  113            return;
//  114       case TECLA_INC:
//  115            if(matriz_edicao[indice]>=limites_sup[indice])
//  116              matriz_edicao[indice] = limites_inf[indice];
//  117            else
//  118              matriz_edicao[indice]++;
//  119            break;
//  120       case TECLA_DEC:
//  121             if(matriz_edicao[indice]<=limites_inf[indice])
//  122               matriz_edicao[indice] = limites_sup[indice];
//  123             else
//  124               matriz_edicao[indice]--;
??MARTC_entry_10:
        ADD      R0,SP,#+20
        LDR      R0,[R0, R4, LSL #+2]
        SUBS     R0,R0,#+1
        ADD      R1,SP,#+20
        STR      R0,[R1, R4, LSL #+2]
//  125            break;
//  126     }
//  127     
//  128     // Escreve a primeira linha no LCD
//  129     sprintf(linha,"%02d:%02d:%02d",matriz_edicao[0],matriz_edicao[1],matriz_edicao[2]);
??MARTC_entry_11:
??MARTC_entry_12:
        LDR      R0,[SP, #+28]
        STR      R0,[SP, #+0]
        LDR      R3,[SP, #+24]
        LDR      R2,[SP, #+20]
        LDR.N    R1,??MARTC_entry_0+0xC
        ADD      R0,SP,#+52
          CFI FunCall sprintf
        BL       sprintf
//  130     HD44780_posicionaTexto(4,0);
        MOVS     R1,#+0
        MOVS     R0,#+4
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  131     HD44780_writeString(linha);
        ADD      R0,SP,#+52
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  132     
//  133     // Escreve a segunda linha no LCd
//  134     sprintf(linha,"%02d/%02d/%04d",matriz_edicao[3],matriz_edicao[4],matriz_edicao[5]);
        LDR      R0,[SP, #+40]
        STR      R0,[SP, #+0]
        LDR      R3,[SP, #+36]
        LDR      R2,[SP, #+32]
        LDR.N    R1,??MARTC_entry_0+0x10
        ADD      R0,SP,#+52
          CFI FunCall sprintf
        BL       sprintf
//  135     HD44780_posicionaTexto(2,1);
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  136     HD44780_writeString(linha);
        ADD      R0,SP,#+52
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  137     
//  138     // Liga o cursor piscante
//  139     HD44780_ligaCursorPiscante();    
          CFI FunCall HD44780_ligaCursorPiscante
        BL       HD44780_ligaCursorPiscante
//  140     HD44780_posicionaTexto(posicoes[indice],indice/3);    
        MOVS     R0,#+3
        UDIV     R1,R4,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R0,SP,#+44
        LDRB     R0,[R4, R0]
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  141     vTaskDelay(150);
        MOVS     R0,#+150
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  142     HD44780_desligaCursorPiscante();    
          CFI FunCall HD44780_desligaCursorPiscante
        BL       HD44780_desligaCursorPiscante
??MARTC_entry_9:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??MARTC_entry_13
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MARTC_entry_14
        BCC.N    ??MARTC_entry_12
        CMP      R0,#+3
        BEQ.N    ??MARTC_entry_15
        BCC.N    ??MARTC_entry_16
        CMP      R0,#+4
        BNE.N    ??MARTC_entry_12
??MARTC_entry_17:
        ADDS     R4,R4,#+1
        CMP      R4,#+6
        BCC.N    ??MARTC_entry_18
        LDR      R0,[SP, #+40]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+36]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[SP, #+0]
        LDR      R3,[SP, #+32]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDR      R2,[SP, #+28]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR      R1,[SP, #+24]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R0,[SP, #+20]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall RTC_setValue
        BL       RTC_setValue
??MARTC_entry_14:
        B.N      ??MARTC_entry_19
??MARTC_entry_18:
        B.N      ??MARTC_entry_12
??MARTC_entry_16:
        ADD      R0,SP,#+20
        LDR      R0,[R0, R4, LSL #+2]
        ADD      R1,SP,#+72
        LDR      R1,[R1, R4, LSL #+2]
        CMP      R0,R1
        BCC.N    ??MARTC_entry_20
        ADD      R0,SP,#+20
        ADD      R1,SP,#+96
        LDR      R1,[R1, R4, LSL #+2]
        STR      R1,[R0, R4, LSL #+2]
        B.N      ??MARTC_entry_21
??MARTC_entry_20:
        ADD      R0,SP,#+20
        LDR      R0,[R0, R4, LSL #+2]
        ADDS     R0,R0,#+1
        ADD      R1,SP,#+20
        STR      R0,[R1, R4, LSL #+2]
??MARTC_entry_21:
        B.N      ??MARTC_entry_12
??MARTC_entry_15:
        ADD      R0,SP,#+96
        LDR      R0,[R0, R4, LSL #+2]
        ADD      R1,SP,#+20
        LDR      R1,[R1, R4, LSL #+2]
        CMP      R0,R1
        BCC.N    ??MARTC_entry_10
        ADD      R0,SP,#+20
        ADD      R1,SP,#+72
        LDR      R1,[R1, R4, LSL #+2]
        STR      R1,[R0, R4, LSL #+2]
        B.N      ??MARTC_entry_11
//  143   }     
//  144 }
??MARTC_entry_13:
??MARTC_entry_19:
        ADD      SP,SP,#+120
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
        Nop      
        DATA
??MARTC_entry_0:
        DC32     `?<Constant {0, 0, 0, 1, 1, 2017}>`
        DC32     `?<Constant {23, 59, 59, 31, 12, 2117}>`
        DC32     `?<Constant {4, 7, 10, 2, 5, 8}>`
        DC32     `?<Constant "%02d:%02d:%02d">`
        DC32     `?<Constant "%02d/%02d/%04d">`
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
`?<Constant {0, 0, 0, 1, 1, 2017}>`:
        DATA
        DC32 0, 0, 0, 1, 1, 2017

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {23, 59, 59, 31, 12, 2117}>`:
        DATA
        DC32 23, 59, 59, 31, 12, 2117

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {4, 7, 10, 2, 5, 8}>`:
        DATA
        DC8 4, 7, 10, 2, 5, 8, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%02d:%02d:%02d">`:
        DATA
        DC8 "%02d:%02d:%02d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%02d/%02d/%04d">`:
        DATA
        DC8 "%02d/%02d/%04d"
        DC8 0

        END
//  145 /***********************************************************************************
//  146 *       Fim do arquivo
//  147 ***********************************************************************************/
// 
//  88 bytes in section .rodata
// 484 bytes in section .text
// 
// 484 bytes of CODE  memory
//  88 bytes of CONST memory
//
//Errors: none
//Warnings: none
