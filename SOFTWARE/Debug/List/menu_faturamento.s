///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     26/Jun/2017  17:58:32 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\01_mais_ /
//                    pipoca_exp\MaisPipoca - 2.0.11\Aplicacao\menu_faturamen /
//                    to.c                                                    /
//    Command line =  "C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\01_mais /
//                    _pipoca_exp\MaisPipoca - 2.0.11\Aplicacao\menu_faturame /
//                    nto.c" -lC "C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmw /
//                    are\01_mais_pipoca_exp\MaisPipoca -                     /
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
//                    pipoca_exp\MaisPipoca - 2.0.11\Debug\List\menu_faturame /
//                    nto.s                                                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_faturamento

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", ""
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN APLICACAO_carrega_idioma
        EXTERN FATURAMENTO_set_arrecadacao_cartao_parcial
        EXTERN FATURAMENTO_set_arrecadacao_parcial
        EXTERN FATURAMENTO_set_contagem_cartao_parcial
        EXTERN FATURAMENTO_set_contagem_parcial
        EXTERN MENUROLAGEM_show
        EXTERN PARAMETROS_le
        EXTERN RELATORIO_entry
        EXTERN STRING_opcoes_menu_faturamento
        EXTERN STRING_titulo_menu_faturamento
        EXTERN STRING_write_to_internal
        EXTERN TECLADO_getContadorInatividade
        EXTERN TECLADO_getch
        EXTERN TELASENHA_telaSenha
        EXTERN sprintf
        EXTERN vTaskDelay

        PUBLIC MENUFAT_entry
        PUBLIC MENUFAT_exibe_arrecadacao_cartao
        PUBLIC MENUFAT_exibe_arrecadacao_moeda
        PUBLIC MENUFAT_exibe_contagem
        PUBLIC MENUFAT_exibe_info_int
        PUBLIC MENUFAT_reinicia_parcial
        PUBLIC MENUFAT_reinicia_totalizadores
        PUBLIC MFAT_entry
        
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
`?<Constant "P:%d,%d">`:
        DATA
        DC8 "P:%d,%d"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "T:%d,%d">`:
        DATA
        DC8 "T:%d,%d"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "APAGANDO">`:
        DATA
        DC8 "APAGANDO"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PARCIAL">`:
        DATA
        DC8 "PARCIAL"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SENHA">`:
        DATA
        DC8 "SENHA"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "INCORRETA">`:
        DATA
        DC8 "INCORRETA"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ENTER P/ IMPRIM.">`:
        DATA
        DC8 "ENTER P/ IMPRIM."
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ESC P/ SAIR">`:
        DATA
        DC8 "ESC P/ SAIR"
// C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\01_mais_pipoca_exp\MaisPipoca - 2.0.11\Aplicacao\menu_faturamento.c
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
//   17 |       Arquivo            :  menu_faturamento.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  06/03/2017
//   21 |
//   22 |       Revisões           :  001
//   23 |
//   24 |
//   25 | __________________________________________________________________________________
//   26 */
//   27 
//   28 /***********************************************************************************
//   29 *       Includes
//   30 ***********************************************************************************/
//   31 #include <stdio.h>
//   32 #include <stdlib.h>
//   33 #include <string.h>
//   34 #include "..\includes.h"
//   35 #include "menu_faturamento.h"
//   36 #include "menu_rolagem.h"
//   37 
//   38 /***********************************************************************************
//   39 *       Definições
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
//   51 void MENUFAT_exibe_info_int(unsigned int parcial,unsigned int total);
//   52 void MENUFAT_exibe_contagem(void);
//   53 void MENUFAT_exibe_arrecadacao_moeda(void);
//   54 void MENUFAT_exibe_arrecadacao_cartao(void);
//   55 void MENUFAT_reinicia_totalizadores(void);
//   56 void MENUFAT_reinicia_parcial(void);
//   57 
//   58 /***********************************************************************************
//   59 *       Tabela de funções
//   60 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   61 void(*const MFAT_entry[])(void)={
MFAT_entry:
        DATA
        DC32 MENUFAT_exibe_contagem, MENUFAT_exibe_arrecadacao_moeda
        DC32 MENUFAT_exibe_arrecadacao_cartao, MENUFAT_reinicia_parcial
        DC32 MENUFAT_reinicia_totalizadores, 0H
//   62   MENUFAT_exibe_contagem,
//   63   MENUFAT_exibe_arrecadacao_moeda,
//   64   MENUFAT_exibe_arrecadacao_cartao,
//   65   MENUFAT_reinicia_parcial,
//   66   MENUFAT_reinicia_totalizadores,
//   67   NULL  
//   68 };
//   69 
//   70 /***********************************************************************************
//   71 *       Tabela de funções
//   72 ***********************************************************************************/
//   73 
//   74 
//   75 /***********************************************************************************
//   76 *       Implementação das funções
//   77 ***********************************************************************************/
//   78 
//   79 /***********************************************************************************
//   80 *       Descrição       :       Ponto de entrada do menu faturament
//   81 *       Parametros      :       nenhum
//   82 *       Retorno         :       nenhum
//   83 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MENUFAT_entry
        THUMB
//   84 void MENUFAT_entry(void){
MENUFAT_entry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   85   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//   86   
//   87   MENUROLAGEM_show((char*)STRING_titulo_menu_faturamento[idioma],
//   88                    (char**)STRING_opcoes_menu_faturamento[idioma],
//   89                    QTD_OPCOES_FATURAMENTO,
//   90                    (void(**)(void))MFAT_entry);    
        LDR.N    R3,??DataTable3
        MOVS     R2,#+6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+24
        LDR.N    R4,??DataTable3_1
        MLA      R1,R1,R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R4,??DataTable3_2
        LDR      R0,[R4, R0, LSL #+2]
          CFI FunCall MENUROLAGEM_show
        BL       MENUROLAGEM_show
//   91 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   92 /***********************************************************************************
//   93 *       Descrição       :       Uma contagem de uma variavel de 32 bits
//   94 *                               na tela junto com um título
//   95 *       Parametros      :       (unsigned int) valor
//   96 *                               (char*) titulo
//   97 *       Retorno         :       nenhum
//   98 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MENUFAT_exibe_info_int
        THUMB
//   99 void MENUFAT_exibe_info_int(unsigned int parcial,unsigned int total){
MENUFAT_exibe_info_int:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
        MOVS     R4,R1
//  100   eTECLA tecla;
//  101   char buffer_linha[17];
//  102   
//  103   sprintf(buffer_linha,"P:%d,%d",parcial/100,parcial%100);
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        MLS      R3,R1,R2,R0
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        LDR.N    R1,??DataTable3_3
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  104   STRING_write_to_internal(CLEAR_DISPLAY,buffer_linha,buffer_linha);
        ADD      R2,SP,#+0
        ADD      R1,SP,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  105   
//  106   sprintf(buffer_linha,"T:%d,%d",total/100,total%100);
        MOVS     R0,#+100
        UDIV     R1,R4,R0
        MLS      R3,R0,R1,R4
        MOVS     R0,#+100
        UDIV     R2,R4,R0
        LDR.N    R1,??DataTable3_4
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  107   STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);  
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MENUFAT_exibe_info_int_0
//  108   
//  109   for(;TECLADO_getContadorInatividade();){
//  110    
//  111     tecla = TECLADO_getch();
//  112     switch(tecla){
//  113       case TECLA_ENTER:
//  114            break;
??MENUFAT_exibe_info_int_1:
??MENUFAT_exibe_info_int_0:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??MENUFAT_exibe_info_int_2
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MENUFAT_exibe_info_int_3
        CMP      R0,#+2
        BEQ.N    ??MENUFAT_exibe_info_int_4
        CMP      R0,#+4
        BEQ.N    ??MENUFAT_exibe_info_int_1
        B.N      ??MENUFAT_exibe_info_int_0
//  115       case TECLA_ESC:
//  116            return;
??MENUFAT_exibe_info_int_3:
        B.N      ??MENUFAT_exibe_info_int_5
//  117       case TECLA_INC:
//  118            break;
??MENUFAT_exibe_info_int_4:
        B.N      ??MENUFAT_exibe_info_int_0
//  119     }    
//  120   }    
//  121 }
??MENUFAT_exibe_info_int_2:
??MENUFAT_exibe_info_int_5:
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  122 /***********************************************************************************
//  123 *       Descrição       :       Exibe o faturamento parcial
//  124 *       Parametros      :       nenhum
//  125 *       Retorno         :       nenhum
//  126 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MENUFAT_exibe_contagem
        THUMB
//  127 void MENUFAT_exibe_contagem(void){
MENUFAT_exibe_contagem:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+12
          CFI CFA R13+16
//  128   unsigned int parcial;
//  129   unsigned int total;
//  130 
//  131   PARAMETROS_le(ADR_CONTAGEM_UNIDADES_PARCIAL,(void*)&parcial);
        ADD      R1,SP,#+4
        MOVS     R0,#+10
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  132   PARAMETROS_le(ADR_CONTAGEM_UNIDADES_TOTAL,(void*)&total);  
        ADD      R1,SP,#+0
        MOVS     R0,#+11
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  133   
//  134   MENUFAT_exibe_info_int(parcial*100,total*100);
        LDR      R0,[SP, #+0]
        MOVS     R1,#+100
        MUL      R1,R1,R0
        LDR      R0,[SP, #+4]
        MOVS     R2,#+100
        MULS     R0,R2,R0
          CFI FunCall MENUFAT_exibe_info_int
        BL       MENUFAT_exibe_info_int
//  135 }
        POP      {R0-R2,PC}       ;; return
          CFI EndBlock cfiBlock2
//  136 /***********************************************************************************
//  137 *       Descrição       :       Exibe a arrecadação em moeda
//  138 *       Parametros      :       nenhum
//  139 *       Retorno         :       nenhum
//  140 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MENUFAT_exibe_arrecadacao_moeda
        THUMB
//  141 void MENUFAT_exibe_arrecadacao_moeda(void){
MENUFAT_exibe_arrecadacao_moeda:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+12
          CFI CFA R13+16
//  142   unsigned int parcial;
//  143   unsigned int total;
//  144 
//  145   PARAMETROS_le(ADR_MOEDA_PARCIAL,(void*)&parcial);
        ADD      R1,SP,#+4
        MOVS     R0,#+12
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  146   PARAMETROS_le(ADR_MOEDA_TOTAL,(void*)&total);  
        ADD      R1,SP,#+0
        MOVS     R0,#+13
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  147   
//  148   MENUFAT_exibe_info_int(parcial,total);
        LDR      R1,[SP, #+0]
        LDR      R0,[SP, #+4]
          CFI FunCall MENUFAT_exibe_info_int
        BL       MENUFAT_exibe_info_int
//  149 }
        POP      {R0-R2,PC}       ;; return
          CFI EndBlock cfiBlock3
//  150 /***********************************************************************************
//  151 *       Descrição       :       Exibe a arrecadação do cartão
//  152 *       Parametros      :       nenhum
//  153 *       Retorno         :       nenhum
//  154 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MENUFAT_exibe_arrecadacao_cartao
        THUMB
//  155 void MENUFAT_exibe_arrecadacao_cartao(void){
MENUFAT_exibe_arrecadacao_cartao:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+12
          CFI CFA R13+16
//  156   unsigned int parcial;
//  157   unsigned int total;
//  158 
//  159   PARAMETROS_le(ADR_CARTAO_PARCIAL,(void*)&parcial);
        ADD      R1,SP,#+4
        MOVS     R0,#+14
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  160   PARAMETROS_le(ADR_CARTAO_TOTAL,(void*)&total);  
        ADD      R1,SP,#+0
        MOVS     R0,#+15
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  161   
//  162   MENUFAT_exibe_info_int(parcial,total);
        LDR      R1,[SP, #+0]
        LDR      R0,[SP, #+4]
          CFI FunCall MENUFAT_exibe_info_int
        BL       MENUFAT_exibe_info_int
//  163 }
        POP      {R0-R2,PC}       ;; return
          CFI EndBlock cfiBlock4
//  164 /***********************************************************************************
//  165 *       Descrição       :       Menu para realizar o reset total dos
//  166 *                               totalizadores do sistema
//  167 *       Parametros      :       nenhum
//  168 *       Retorno         :       nenhum
//  169 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MENUFAT_reinicia_totalizadores
        THUMB
//  170 void MENUFAT_reinicia_totalizadores(void){
MENUFAT_reinicia_totalizadores:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  171   unsigned int senha_root;
//  172 
//  173   PARAMETROS_le(ADR_SENHA_ADMIN,(void*)&senha_root);
        ADD      R1,SP,#+0
        MOVS     R0,#+35
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  174   
//  175   if(TELASENHA_telaSenha(senha_root)){
        LDR      R0,[SP, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall TELASENHA_telaSenha
        BL       TELASENHA_telaSenha
        CMP      R0,#+0
        BEQ.N    ??MENUFAT_reinicia_totalizadores_0
//  176     STRING_write_to_internal(CLEAR_DISPLAY,"APAGANDO","PARCIAL");    
        LDR.N    R2,??DataTable3_5
        LDR.N    R1,??DataTable3_6
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  177     FATURAMENTO_set_contagem_parcial(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_contagem_parcial
        BL       FATURAMENTO_set_contagem_parcial
//  178     FATURAMENTO_set_arrecadacao_parcial(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_arrecadacao_parcial
        BL       FATURAMENTO_set_arrecadacao_parcial
//  179     FATURAMENTO_set_contagem_cartao_parcial(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_contagem_cartao_parcial
        BL       FATURAMENTO_set_contagem_cartao_parcial
//  180     FATURAMENTO_set_arrecadacao_cartao_parcial(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_arrecadacao_cartao_parcial
        BL       FATURAMENTO_set_arrecadacao_cartao_parcial
        B.N      ??MENUFAT_reinicia_totalizadores_1
//  181   }else
//  182     STRING_write_to_internal(CLEAR_DISPLAY,"SENHA","INCORRETA");
??MENUFAT_reinicia_totalizadores_0:
        LDR.N    R2,??DataTable3_7
        LDR.N    R1,??DataTable3_8
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  183   
//  184   vTaskDelay(3000);
??MENUFAT_reinicia_totalizadores_1:
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  185 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
//  186 /***********************************************************************************
//  187 *       Descrição       :       Aoaga a contagem parcial
//  188 *       Parametros      :       nenhum
//  189 *       Retorno         :       nenhum
//  190 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MENUFAT_reinicia_parcial
        THUMB
//  191 void MENUFAT_reinicia_parcial(void){
MENUFAT_reinicia_parcial:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  192   eTECLA tecla;
//  193   unsigned char loop=1;
        MOVS     R4,#+1
//  194   
//  195   STRING_write_to_internal(CLEAR_DISPLAY,"ENTER P/ IMPRIM.","ESC P/ SAIR");
        LDR.N    R2,??DataTable3_9
        LDR.N    R1,??DataTable3_10
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MENUFAT_reinicia_parcial_0
//  196     
//  197   for(;loop;){
//  198     tecla = TECLADO_getch();
//  199     switch(tecla){
//  200       case TECLA_ENTER: RELATORIO_entry();
??MENUFAT_reinicia_parcial_1:
          CFI FunCall RELATORIO_entry
        BL       RELATORIO_entry
//  201                         break;
??MENUFAT_reinicia_parcial_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??MENUFAT_reinicia_parcial_2
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MENUFAT_reinicia_parcial_3
        CMP      R0,#+4
        BEQ.N    ??MENUFAT_reinicia_parcial_1
        B.N      ??MENUFAT_reinicia_parcial_0
//  202       case TECLA_ESC:   loop = 0;
??MENUFAT_reinicia_parcial_3:
        MOVS     R4,#+0
//  203                         break;
        B.N      ??MENUFAT_reinicia_parcial_0
//  204     }  
//  205     
//  206   }  
//  207 }
??MENUFAT_reinicia_parcial_2:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     MFAT_entry

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     STRING_opcoes_menu_faturamento

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     STRING_titulo_menu_faturamento

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     `?<Constant "P:%d,%d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     `?<Constant "T:%d,%d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     `?<Constant "PARCIAL">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     `?<Constant "APAGANDO">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     `?<Constant "INCORRETA">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     `?<Constant "SENHA">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     `?<Constant "ESC P/ SAIR">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     `?<Constant "ENTER P/ IMPRIM.">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  208 /***********************************************************************************
//  209 *       Fim do arquivo
//  210 ***********************************************************************************/
// 
// 112 bytes in section .rodata
// 416 bytes in section .text
// 
// 416 bytes of CODE  memory
// 112 bytes of CONST memory
//
//Errors: none
//Warnings: 1
