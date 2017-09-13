///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     13/Sep/2017  16:11:49 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_pr /
//                    eparacao.c                                              /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_pr /
//                    eparacao.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\De /
//                    bug\List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Deb /
//                    ug\List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug /
//                    \Obj\ --no_cse --no_unroll --no_inline                  /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\menu_p /
//                    reparacao.s                                             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_preparacao

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN APLICACAO_carrega_idioma
        EXTERN MEI_entry
        EXTERN MEI_entry_inc
        EXTERN MENUROLAGEM_show
        EXTERN PARAMETROS_grava
        EXTERN PARAMETROS_le
        EXTERN STRING_opcoes_menu_preparacao
        EXTERN STRING_titulo_edita_temperatura
        EXTERN STRING_titulo_edita_velocidade
        EXTERN STRING_titulo_menu_preparacao

        PUBLIC MPREP_edita_temperatura
        PUBLIC MPREP_edita_velocidade
        PUBLIC MPREP_entry
        PUBLIC MPREP_funcs
        
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
        

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%03doC">`:
        DATA
        DC8 "%03doC"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%05d RPM">`:
        DATA
        DC8 "%05d RPM"
        DC8 0, 0, 0
// C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_preparacao.c
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
//   17 |       Arquivo            :  menu_preparacao.c
//   18 |       Descrição          :  Menu com opções de preparação da pipoca
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  22/04/2017
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
//   35 #include "menu_preparacao.h"
//   36 #include "menu_rolagem.h"
//   37 #include "menu_edita_inteiro.h"
//   38 #include "..\includes.h"
//   39 
//   40 /***********************************************************************************
//   41 *       Definições
//   42 ***********************************************************************************/
//   43 
//   44 
//   45 
//   46 /***********************************************************************************
//   47 *       Constantes
//   48 ***********************************************************************************/
//   49 
//   50 
//   51 /***********************************************************************************
//   52 *       Variaveis locais
//   53 ***********************************************************************************/
//   54 
//   55 
//   56 /***********************************************************************************
//   57 *       Funções locais
//   58 ***********************************************************************************/
//   59 void MPREP_edita_temperatura(void);
//   60 void MPREP_edita_velocidade(void);
//   61 
//   62 /***********************************************************************************
//   63 *       Tabela de funções
//   64 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   65 void(*const MPREP_funcs[QTD_OPCOES_PREPARACAO])(void)={
MPREP_funcs:
        DATA
        DC32 MPREP_edita_temperatura, MPREP_edita_velocidade, 0H
//   66   MPREP_edita_temperatura,
//   67   MPREP_edita_velocidade,
//   68   NULL  
//   69 };
//   70 
//   71 /***********************************************************************************
//   72 *       Implementação das funções
//   73 ***********************************************************************************/
//   74 
//   75 /**********************************************************************************
//   76 *       Descrição       :       Ponto de entrada do menu de configuração
//   77 *                               dos parâmetros de preparação
//   78 *       Parametros      :       nenhum
//   79 *       Retorno         :       nenhum
//   80 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MPREP_entry
        THUMB
//   81 void MPREP_entry(void){
MPREP_entry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   82   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//   83   
//   84   MENUROLAGEM_show((char*)STRING_titulo_menu_preparacao[idioma],
//   85                    (char**)STRING_opcoes_menu_preparacao[idioma],
//   86                    QTD_OPCOES_PREPARACAO,
//   87                    (void(**)(void))MPREP_funcs);   
        LDR.N    R3,??DataTable2
        MOVS     R2,#+3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+12
        LDR.N    R1,??DataTable2_1
        MLA      R1,R0,R4,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable2_2
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MENUROLAGEM_show
        BL       MENUROLAGEM_show
//   88 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   89 /***********************************************************************************
//   90 *       Descrição       :       Tela para edição da temperatura de preparação
//   91 *                               das pipocas
//   92 *       Parametros      :       nenhum
//   93 *       Retorno         :       nenhum
//   94 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MPREP_edita_temperatura
        THUMB
//   95 void MPREP_edita_temperatura(void){
MPREP_edita_temperatura:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
//   96   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//   97   unsigned int temperatura;
//   98 
//   99   PARAMETROS_le(ADR_TEMPERATURA_PREPARACAO,(void*)&temperatura);
        ADD      R1,SP,#+4
        MOVS     R0,#+26
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  100   if(temperatura>200)
        LDR      R0,[SP, #+4]
        CMP      R0,#+201
        BCC.N    ??MPREP_edita_temperatura_0
//  101     temperatura = 60;
        MOVS     R0,#+60
        STR      R0,[SP, #+4]
//  102   
//  103   temperatura = MEI_entry((char*)STRING_titulo_edita_temperatura[idioma],
//  104                           "%03doC",
//  105                           temperatura,
//  106                           40,
//  107                           200);
??MPREP_edita_temperatura_0:
        MOVS     R0,#+200
        STR      R0,[SP, #+0]
        MOVS     R3,#+40
        LDR      R2,[SP, #+4]
        LDR.N    R1,??DataTable2_3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable2_4
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEI_entry
        BL       MEI_entry
        STR      R0,[SP, #+4]
//  108   PARAMETROS_grava(ADR_TEMPERATURA_PREPARACAO,(void*)&temperatura);
        ADD      R1,SP,#+4
        MOVS     R0,#+26
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  109 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock1
//  110 /***********************************************************************************
//  111 *       Descrição       :       Tela para edição da velocidade de preparação
//  112 *       Parametros      :       nenhum
//  113 *       Retorno         :       nenhum
//  114 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MPREP_edita_velocidade
        THUMB
//  115 void MPREP_edita_velocidade(void){
MPREP_edita_velocidade:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+16
          CFI CFA R13+24
//  116   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  117   unsigned int velocidade;
//  118   
//  119   PARAMETROS_le(ADR_VELOCIDADE_PREPARACAO,(void*)&velocidade);
        ADD      R1,SP,#+8
        MOVS     R0,#+27
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  120   if(velocidade>12000)
        LDR      R0,[SP, #+8]
        MOVW     R1,#+12001
        CMP      R0,R1
        BCC.N    ??MPREP_edita_velocidade_0
//  121     velocidade = 4500;
        MOVW     R0,#+4500
        STR      R0,[SP, #+8]
//  122   velocidade = MEI_entry_inc((char*)STRING_titulo_edita_velocidade[idioma],
//  123                              "%05d RPM",
//  124                              velocidade,
//  125                              3500,
//  126                              12000,
//  127                              100);
??MPREP_edita_velocidade_0:
        MOVS     R0,#+100
        STR      R0,[SP, #+4]
        MOVW     R0,#+12000
        STR      R0,[SP, #+0]
        MOVW     R3,#+3500
        LDR      R2,[SP, #+8]
        LDR.N    R1,??DataTable2_5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable2_6
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEI_entry_inc
        BL       MEI_entry_inc
        STR      R0,[SP, #+8]
//  128     
//  129   PARAMETROS_grava(ADR_VELOCIDADE_PREPARACAO,(void*)&velocidade);  
        ADD      R1,SP,#+8
        MOVS     R0,#+27
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  130 }
        POP      {R0-R4,PC}       ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     MPREP_funcs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     STRING_opcoes_menu_preparacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     STRING_titulo_menu_preparacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     `?<Constant "%03doC">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     STRING_titulo_edita_temperatura

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     `?<Constant "%05d RPM">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     STRING_titulo_edita_velocidade

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  131 /***********************************************************************************
//  132 *       fim do arquivo
//  133 ***********************************************************************************/
// 
//  32 bytes in section .rodata
// 200 bytes in section .text
// 
// 200 bytes of CODE  memory
//  32 bytes of CONST memory
//
//Errors: none
//Warnings: none
