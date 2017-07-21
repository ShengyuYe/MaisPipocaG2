///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     21/Jul/2017  09:35:09 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_servico.c                /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_servico.c -lC            /
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
//                    pocaG2\SOFTWARE\Debug\List\menu_servico.s               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_servico

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN APLICACAO_carrega_idioma
        EXTERN EMBALAGEM_libera_pacote
        EXTERN MENUROLAGEM_show
        EXTERN PARAMETROS_le
        EXTERN PREPARACAO_dosagem_milho
        EXTERN PREPARACAO_entry
        EXTERN PREPARACAO_limpeza
        EXTERN PREPARACAO_resfriamento
        EXTERN STRING_mensagem_dosando_milho
        EXTERN STRING_mensagem_fora_servico
        EXTERN STRING_mensagem_libera_embalagem
        EXTERN STRING_mensagem_limpeza_inicial
        EXTERN STRING_menu_servico
        EXTERN STRING_titulo_menu_servico
        EXTERN STRING_write_to_external
        EXTERN STRING_write_to_internal
        EXTERN TECLADO_getch

        PUBLIC MSERVICO_dosa_porcao
        PUBLIC MSERVICO_entry
        PUBLIC MSERVICO_funcs
        PUBLIC MSERVICO_libera_embalagem
        PUBLIC MSERVICO_limpeza
        PUBLIC MSERVICO_preparacao
        PUBLIC MSERVICO_resfriamento
        
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
`?<Constant "E0:VENTILADOR">`:
        DATA
        DC8 "E0:VENTILADOR"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "E1:AQUECIMENTO">`:
        DATA
        DC8 "E1:AQUECIMENTO"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "E2:DOSADOR">`:
        DATA
        DC8 "E2:DOSADOR"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "E3:EMBALAGEM">`:
        DATA
        DC8 "E3:EMBALAGEM"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "FALHA">`:
        DATA
        DC8 "FALHA"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PROCESSO">`:
        DATA
        DC8 "PROCESSO"
        DC8 0, 0, 0
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Aplicacao\menu_servico.c
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
//   17 |       Arquivo            :  menu_servico.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  23/04/2017
//   21 |
//   22 |       Revisões           :  001
//   23 |
//   24 |                             (23/04/2017) criado menu para acesso às funções
//   25 |                              de limpeza, resfriamento, dose e embalagem
//   26 |
//   27 |
//   28 | __________________________________________________________________________________
//   29 */
//   30 
//   31 /***********************************************************************************
//   32 *       Includes
//   33 ***********************************************************************************/
//   34 #include <stdio.h>
//   35 #include <stdlib.h>
//   36 #include <string.h>
//   37 #include "..\includes.h"
//   38 #include "menu_servico.h"
//   39 #include "preparacao.h"
//   40 
//   41 /***********************************************************************************
//   42 *       Definfições locais
//   43 ***********************************************************************************/
//   44 
//   45 
//   46 
//   47 /***********************************************************************************
//   48 *       Constantes
//   49 ***********************************************************************************/
//   50 
//   51 
//   52 /***********************************************************************************
//   53 *       Variaveis locais
//   54 ***********************************************************************************/
//   55 
//   56 
//   57 /***********************************************************************************
//   58 *       Funções locais
//   59 ***********************************************************************************/
//   60 void MSERVICO_limpeza(void);
//   61 void MSERVICO_libera_embalagem(void);
//   62 void MSERVICO_dosa_porcao(void);
//   63 void MSERVICO_resfriamento(void);
//   64 void MSERVICO_preparacao(void);
//   65 
//   66 /***********************************************************************************
//   67 *       tabela de funções
//   68 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   69 void(*const MSERVICO_funcs[])(void)={
MSERVICO_funcs:
        DATA
        DC32 MSERVICO_limpeza, MSERVICO_libera_embalagem, MSERVICO_dosa_porcao
        DC32 MSERVICO_resfriamento, MSERVICO_preparacao, 0H
//   70   MSERVICO_limpeza,
//   71   MSERVICO_libera_embalagem,
//   72   MSERVICO_dosa_porcao,
//   73   MSERVICO_resfriamento,
//   74   MSERVICO_preparacao,
//   75   NULL  
//   76 };
//   77 
//   78 /***********************************************************************************
//   79 *       Implementação das funções
//   80 ***********************************************************************************/
//   81 
//   82 /***********************************************************************************
//   83 *       Descrição       :       Ponto de entrada do menu de serviço
//   84 *       Parametros      :       nenhum
//   85 *       Retorno         :       nenhum
//   86 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MSERVICO_entry
        THUMB
//   87 void MSERVICO_entry(void){
MSERVICO_entry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   88   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//   89   
//   90   MENUROLAGEM_show((char*)STRING_titulo_menu_servico[idioma],
//   91                    (char**)STRING_menu_servico[idioma],
//   92                    QTD_OPCOES_SERVICO,
//   93                    (void(**)(void))MSERVICO_funcs);   
        LDR.N    R3,??DataTable4
        MOVS     R2,#+6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+24
        LDR.N    R4,??DataTable4_1
        MLA      R1,R1,R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R4,??DataTable4_2
        LDR      R0,[R4, R0, LSL #+2]
          CFI FunCall MENUROLAGEM_show
        BL       MENUROLAGEM_show
//   94 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   95 /***********************************************************************************
//   96 *       Descrição       :       Executa a limpeza 
//   97 *       Parametors      :       nenhum
//   98 *       Retorno         :       nenhum
//   99 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MSERVICO_limpeza
        THUMB
//  100 void MSERVICO_limpeza(void){
MSERVICO_limpeza:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  101   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  102   
//  103   STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_limpeza_inicial[idioma][0],(char*)STRING_mensagem_limpeza_inicial[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_3
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_3
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  104   PREPARACAO_limpeza(idioma);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PREPARACAO_limpeza
        BL       PREPARACAO_limpeza
//  105   STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);  
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  106 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  107 /***********************************************************************************
//  108 *       Descrição       :       Faz o avanço das embalagens
//  109 *       Parametros      :       nenhum
//  110 *       Retorno         :       nenhum
//  111 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MSERVICO_libera_embalagem
        THUMB
//  112 void MSERVICO_libera_embalagem(void){
MSERVICO_libera_embalagem:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  113   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  114   unsigned int tempo;
//  115   
//  116   STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  117   STRING_write_to_internal(NO_CLEAR,(char*)STRING_mensagem_libera_embalagem[idioma][0],(char*)STRING_mensagem_libera_embalagem[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_4
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_4
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  118   
//  119   PARAMETROS_le(ADR_TEMPO_EMBALAGEM,(void*)&tempo);
        ADD      R1,SP,#+0
        MOVS     R0,#+28
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  120   
//  121   EMBALAGEM_libera_pacote(tempo);  
        LDR      R0,[SP, #+0]
          CFI FunCall EMBALAGEM_libera_pacote
        BL       EMBALAGEM_libera_pacote
//  122   STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  123 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock2
//  124 /***********************************************************************************
//  125 *       Descrição       :       Faz a dosagem de uma porção de milho
//  126 *       Parametros      :       nenhum
//  127 *       Retorno         :       nenhum
//  128 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MSERVICO_dosa_porcao
        THUMB
//  129 void MSERVICO_dosa_porcao(void){
MSERVICO_dosa_porcao:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  130   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  131     
//  132   STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  133   STRING_write_to_internal(NO_CLEAR,(char*)STRING_mensagem_dosando_milho[idioma][0],(char*)STRING_mensagem_dosando_milho[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_5
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_5
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  134   
//  135   PREPARACAO_dosagem_milho();
          CFI FunCall PREPARACAO_dosagem_milho
        BL       PREPARACAO_dosagem_milho
//  136   
//  137   STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);    
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  138 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3
//  139 /***********************************************************************************
//  140 *       Descrição       :       Faz o processo de resfriamento da resistência
//  141 *       Parametros      :       nenhum
//  142 *       Retorno         :       nenhum
//  143 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MSERVICO_resfriamento
        THUMB
//  144 void MSERVICO_resfriamento(void){
MSERVICO_resfriamento:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  145   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  146   
//  147   PREPARACAO_resfriamento(idioma);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PREPARACAO_resfriamento
        BL       PREPARACAO_resfriamento
//  148 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  149 /***********************************************************************************
//  150 *       Descrição       :       Faz a preparação de uma pipoca
//  151 *       Parametros      :       nenhum
//  152 *       Retorno         :       nenhum
//  153 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MSERVICO_preparacao
        THUMB
//  154 void MSERVICO_preparacao(void){
MSERVICO_preparacao:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  155   unsigned int temp;
//  156   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  157   ePREPARACAO_RESULT resultado;
//  158   eTECLA tecla;
//  159   
//  160   resultado = PREPARACAO_entry(&temp,NAO_CONTABILIZA);
        MOVS     R1,#+0
        ADD      R0,SP,#+0
          CFI FunCall PREPARACAO_entry
        BL       PREPARACAO_entry
        MOVS     R5,R0
//  161   
//  162   switch(resultado){
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BEQ.N    ??MSERVICO_preparacao_0
        BCC.N    ??MSERVICO_preparacao_1
        CMP      R5,#+3
        BEQ.N    ??MSERVICO_preparacao_2
        BCC.N    ??MSERVICO_preparacao_3
        CMP      R5,#+5
        BEQ.N    ??MSERVICO_preparacao_4
        BCC.N    ??MSERVICO_preparacao_5
        B.N      ??MSERVICO_preparacao_1
//  163     case FALHA_VENTILADOR:      
//  164          break;
??MSERVICO_preparacao_0:
        B.N      ??MSERVICO_preparacao_1
//  165     case FALHA_RESISTENCIA:
//  166          STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E0:VENTILADOR");                       
??MSERVICO_preparacao_3:
        LDR.N    R2,??DataTable4_6
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_7
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  167          break;
        B.N      ??MSERVICO_preparacao_1
//  168     case FALHA_DOSE:
//  169          STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E1:AQUECIMENTO");
??MSERVICO_preparacao_2:
        LDR.N    R2,??DataTable4_8
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_7
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  170          break;
        B.N      ??MSERVICO_preparacao_1
//  171     case FALHA_EMBALAGEM:
//  172          STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E2:DOSADOR");          
??MSERVICO_preparacao_5:
        LDR.N    R2,??DataTable4_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_7
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  173          break;
        B.N      ??MSERVICO_preparacao_1
//  174     case FALHA_FALTA_TROCO:
//  175          STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E3:EMBALAGEM");                                                 
??MSERVICO_preparacao_4:
        LDR.N    R2,??DataTable4_10
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_7
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  176          break;
//  177   }
//  178   PREPARACAO_resfriamento(idioma);
??MSERVICO_preparacao_1:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PREPARACAO_resfriamento
        BL       PREPARACAO_resfriamento
//  179   
//  180   STRING_write_to_internal(CLEAR_DISPLAY,"FALHA","PROCESSO");
        LDR.N    R2,??DataTable4_11
        LDR.N    R1,??DataTable4_12
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MSERVICO_preparacao_6
//  181   
//  182   while(resultado != SUCESSO){
//  183     
//  184     tecla = TECLADO_getch();
??MSERVICO_preparacao_7:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
//  185     switch(tecla){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??MSERVICO_preparacao_6
//  186       case TECLA_ESC: resultado = SUCESSO;
        MOVS     R5,#+0
//  187            break;
//  188     }
//  189   }
??MSERVICO_preparacao_6:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??MSERVICO_preparacao_7
//  190 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     MSERVICO_funcs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     STRING_menu_servico

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     STRING_titulo_menu_servico

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     STRING_mensagem_limpeza_inicial

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     STRING_mensagem_libera_embalagem

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     STRING_mensagem_dosando_milho

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     `?<Constant "E0:VENTILADOR">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     STRING_mensagem_fora_servico

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     `?<Constant "E1:AQUECIMENTO">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     `?<Constant "E2:DOSADOR">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     `?<Constant "E3:EMBALAGEM">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     `?<Constant "PROCESSO">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     `?<Constant "FALHA">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  191 /***********************************************************************************
//  192 *       Fim do arquivo
//  193 ***********************************************************************************/
// 
// 104 bytes in section .rodata
// 432 bytes in section .text
// 
// 432 bytes of CODE  memory
// 104 bytes of CONST memory
//
//Errors: none
//Warnings: 2
