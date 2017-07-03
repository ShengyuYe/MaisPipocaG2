///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     26/Jun/2017  17:58:08 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\01_mais_ /
//                    pipoca_exp\MaisPipoca - 2.0.11\Aplicacao\faturamento.c  /
//    Command line =  "C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\01_mais /
//                    _pipoca_exp\MaisPipoca - 2.0.11\Aplicacao\faturamento.c /
//                    " -lC "C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\0 /
//                    1_mais_pipoca_exp\MaisPipoca - 2.0.11\Debug\List\" -lA  /
//                    "C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\01_mais /
//                    _pipoca_exp\MaisPipoca - 2.0.11\Debug\List\" -o         /
//                    "C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\01_mais /
//                    _pipoca_exp\MaisPipoca - 2.0.11\Debug\Obj\" --no_cse    /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_clustering --no_scheduling --debug                 /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -Ol                 /
//    List file    =  C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\01_mais_ /
//                    pipoca_exp\MaisPipoca - 2.0.11\Debug\List\faturamento.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME faturamento

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN PARAMETROS_grava
        EXTERN PARAMETROS_le

        PUBLIC FATURAMENTO_add_arrecadacao_cartao_parcial
        PUBLIC FATURAMENTO_add_arrecadacao_cartao_total
        PUBLIC FATURAMENTO_add_arrecadacao_parcial
        PUBLIC FATURAMENTO_add_arrecadacao_total
        PUBLIC FATURAMENTO_add_contagem_cartao_parcial
        PUBLIC FATURAMENTO_add_contagem_cartao_total
        PUBLIC FATURAMENTO_add_contagem_parcial
        PUBLIC FATURAMENTO_add_contagem_total
        PUBLIC FATURAMENTO_get_arrecadacao_cartao_parcial
        PUBLIC FATURAMENTO_get_arrecadacao_cartao_total
        PUBLIC FATURAMENTO_get_arrecadacao_parcial
        PUBLIC FATURAMENTO_get_arrecadacao_total
        PUBLIC FATURAMENTO_get_contagem_cartao_parcial
        PUBLIC FATURAMENTO_get_contagem_cartao_total
        PUBLIC FATURAMENTO_get_contagem_parcial
        PUBLIC FATURAMENTO_get_contagem_total
        PUBLIC FATURAMENTO_inc_contador_pipocas_teste
        PUBLIC FATURAMENTO_reinicia_pipocas_teste
        PUBLIC FATURAMENTO_set_arrecadacao_cartao_parcial
        PUBLIC FATURAMENTO_set_arrecadacao_cartao_total
        PUBLIC FATURAMENTO_set_arrecadacao_parcial
        PUBLIC FATURAMENTO_set_arrecadacao_total
        PUBLIC FATURAMENTO_set_contagem_cartao_parcial
        PUBLIC FATURAMENTO_set_contagem_cartao_total
        PUBLIC FATURAMENTO_set_contagem_parcial
        PUBLIC FATURAMENTO_set_contagem_total
        
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
        
// C:\Users\Marcos\Dropbox\Cli\AlmTec\01-Firmware\01_mais_pipoca_exp\MaisPipoca - 2.0.11\Aplicacao\faturamento.c
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
//   17 |       Arquivo            :  faturamento.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  (06/03/2017)
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
//   35 
//   36 /***********************************************************************************
//   37 *       Definições
//   38 ***********************************************************************************/
//   39 
//   40 
//   41 /***********************************************************************************
//   42 *       Variaveis locais
//   43 ***********************************************************************************/
//   44 
//   45 
//   46 /***********************************************************************************
//   47 *       Funções locais
//   48 ***********************************************************************************/
//   49 
//   50 
//   51 /***********************************************************************************
//   52 *       Implementação das funções
//   53 ***********************************************************************************/
//   54 
//   55 /***********************************************************************************
//   56 *       Descrição       :       Getter para a contagem parcial
//   57 *       Parametros      :       nenhum
//   58 *       Retorno         :       (unsigned int) contagem parcial de unidades
//   59 *                               vendidas
//   60 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function FATURAMENTO_get_contagem_parcial
        THUMB
//   61 unsigned int FATURAMENTO_get_contagem_parcial(void){
FATURAMENTO_get_contagem_parcial:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   62   unsigned int temp;
//   63   
//   64   PARAMETROS_le(ADR_CONTAGEM_UNIDADES_PARCIAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+10
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   65   
//   66   return temp;  
        LDR      R0,[SP, #+0]
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock0
//   67 }
//   68 /***********************************************************************************
//   69 *       Descrição       :       Getter para a arrecadação parcial
//   70 *       Parametros      :       nenhum
//   71 *       Retorno         :       (unsigned int) arrecadação parcial
//   72 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function FATURAMENTO_get_arrecadacao_parcial
        THUMB
//   73 unsigned int FATURAMENTO_get_arrecadacao_parcial(void){
FATURAMENTO_get_arrecadacao_parcial:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   74   unsigned int temp;
//   75   
//   76   PARAMETROS_le(ADR_MOEDA_PARCIAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+12
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   77   
//   78   return temp;
        LDR      R0,[SP, #+0]
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock1
//   79 }
//   80 /***********************************************************************************
//   81 *       Descrição       :       Getter para a contagem parcial
//   82 *                               do cartão de crédito
//   83 *       Parametros      :       nenhum
//   84 *       Retorno         :       (unsigned int) ccontagem parcial do cartão
//   85 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function FATURAMENTO_get_contagem_cartao_parcial
        THUMB
//   86 unsigned int FATURAMENTO_get_contagem_cartao_parcial(void){
FATURAMENTO_get_contagem_cartao_parcial:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   87   unsigned int temp;
//   88   
//   89   PARAMETROS_le(ADR_UNIDADES_CARTAO_PARCIAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+16
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   90   
//   91   return temp;
        LDR      R0,[SP, #+0]
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock2
//   92 }
//   93 /***********************************************************************************
//   94 *       Descrição       :       Getter para a arrecadação parcial do cartão
//   95 *       Parametros      :       nenhum
//   96 *       Retorno         :       (unsigned int) arrecadacao parcial do cartão
//   97 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function FATURAMENTO_get_arrecadacao_cartao_parcial
        THUMB
//   98 unsigned int FATURAMENTO_get_arrecadacao_cartao_parcial(void){
FATURAMENTO_get_arrecadacao_cartao_parcial:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   99   unsigned int temp;
//  100   
//  101   PARAMETROS_le(ADR_CARTAO_PARCIAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+14
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  102   
//  103   return temp;
        LDR      R0,[SP, #+0]
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock3
//  104 }
//  105 /***********************************************************************************
//  106 *       Descrição       :       Getter para a contagem total das unidades
//  107 *                               vendidas
//  108 *       Parametros      :       nenhum
//  109 *       Retorno         :       (unsigned int) contagem total 
//  110 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function FATURAMENTO_get_contagem_total
        THUMB
//  111 unsigned int FATURAMENTO_get_contagem_total(void){
FATURAMENTO_get_contagem_total:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  112   unsigned int temp;
//  113   
//  114   PARAMETROS_le(ADR_CONTAGEM_UNIDADES_TOTAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+11
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  115   
//  116   return temp;
        LDR      R0,[SP, #+0]
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
//  117 }
//  118 /***********************************************************************************
//  119 *       Descrição       :       Getter para a arrecadação total
//  120 *       Parametros      :       nenhum
//  121 *       Retorno         :       (unsigned int) arrecadacao total
//  122 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function FATURAMENTO_get_arrecadacao_total
        THUMB
//  123 unsigned int FATURAMENTO_get_arrecadacao_total(void){
FATURAMENTO_get_arrecadacao_total:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  124   unsigned int temp;
//  125   
//  126   PARAMETROS_le(ADR_MOEDA_TOTAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+13
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  127   
//  128   return temp;
        LDR      R0,[SP, #+0]
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock5
//  129 }
//  130 /***********************************************************************************
//  131 *       Descrição       :       Getter paraa contagem do cartão de crédito
//  132 *       Parametros      :       nenhum
//  133 *       Retorno         :       (unsigned int) contagem do cartão de crédito
//  134 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function FATURAMENTO_get_contagem_cartao_total
        THUMB
//  135 unsigned int FATURAMENTO_get_contagem_cartao_total(void){
FATURAMENTO_get_contagem_cartao_total:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  136   unsigned int temp;
//  137   
//  138   PARAMETROS_le(ADR_UNIDADES_CARTAO_TOTAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+17
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  139   
//  140   return temp;
        LDR      R0,[SP, #+0]
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock6
//  141 }
//  142 /***********************************************************************************
//  143 *       Descrição       :       Getter para a arrecadacao total do cartão
//  144 *       Parametros      :       nenhum
//  145 *       Retorno         :       (unsigned int) arrecadacao total do cartão
//  146 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function FATURAMENTO_get_arrecadacao_cartao_total
        THUMB
//  147 unsigned int FATURAMENTO_get_arrecadacao_cartao_total(void){
FATURAMENTO_get_arrecadacao_cartao_total:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  148   unsigned int temp;
//  149   
//  150   PARAMETROS_le(ADR_CARTAO_TOTAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+15
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  151   
//  152   return temp;
        LDR      R0,[SP, #+0]
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock7
//  153 }
//  154 /***********************************************************************************
//  155 *       Descrição       :       Setter para a contagem parcial 
//  156 *       Parametros      :       (unsigned int) contagem
//  157 *       Retorno         :       nenhum
//  158 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function FATURAMENTO_set_contagem_parcial
        THUMB
//  159 void FATURAMENTO_set_contagem_parcial(unsigned int contagem){
FATURAMENTO_set_contagem_parcial:
        PUSH     {R0,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  160     
//  161   PARAMETROS_grava(ADR_CONTAGEM_UNIDADES_PARCIAL,(void*)&contagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+10
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  162 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8
//  163 /***********************************************************************************
//  164 *       Descrição       :       Setter para a arrecadação 
//  165 *       Parametros      :       (unsigned int) arrecadacao
//  166 *       Retorno         :       nenhum
//  167 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function FATURAMENTO_set_arrecadacao_parcial
        THUMB
//  168 void FATURAMENTO_set_arrecadacao_parcial(unsigned int arrecadacao){
FATURAMENTO_set_arrecadacao_parcial:
        PUSH     {R0,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  169   
//  170   PARAMETROS_grava(ADR_MOEDA_PARCIAL,(void*)&arrecadacao);
        ADD      R1,SP,#+0
        MOVS     R0,#+12
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  171 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9
//  172 /***********************************************************************************
//  173 *       Descrição       :       Setter para a contagem parcial do cartão
//  174 *       Parametros      :       (unsigned int) contagem
//  175 *       Retorno         :       nenhum
//  176 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function FATURAMENTO_set_contagem_cartao_parcial
        THUMB
//  177 void FATURAMENTO_set_contagem_cartao_parcial(unsigned int contagem){
FATURAMENTO_set_contagem_cartao_parcial:
        PUSH     {R0,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  178   
//  179   PARAMETROS_grava(ADR_UNIDADES_CARTAO_PARCIAL,(void*)&contagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+16
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  180 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock10
//  181 /***********************************************************************************
//  182 *       Descrição       :       Setter para a contagem parcial do cartão
//  183 *       Parametros      :       (unsigned int) arrecadação parcial do
//  184 *                                              cartão
//  185 *       Retorno         :       nenhum
//  186 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function FATURAMENTO_set_arrecadacao_cartao_parcial
        THUMB
//  187 void FATURAMENTO_set_arrecadacao_cartao_parcial(unsigned int arrecadacao){
FATURAMENTO_set_arrecadacao_cartao_parcial:
        PUSH     {R0,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  188   
//  189   PARAMETROS_grava(ADR_CARTAO_PARCIAL,(void*)&arrecadacao);
        ADD      R1,SP,#+0
        MOVS     R0,#+14
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  190 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock11
//  191 /***********************************************************************************
//  192 *       Descrição       :       Setter para a contagem de unidades vendidas
//  193 *       Parametros      :       (unsigned int) contagem
//  194 *       Retorno         :       nenhum
//  195 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function FATURAMENTO_set_contagem_total
        THUMB
//  196 void FATURAMENTO_set_contagem_total(unsigned int contagem){
FATURAMENTO_set_contagem_total:
        PUSH     {R0,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  197   
//  198   PARAMETROS_grava(ADR_CONTAGEM_UNIDADES_TOTAL,(void*)&contagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+11
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  199 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock12
//  200 /***********************************************************************************
//  201 *       Descrição       :       Setter para a arrecadação 
//  202 *       Parametros      :       (unsigned int) arrecadacao
//  203 *       Retorno         :       nenhum
//  204 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function FATURAMENTO_set_arrecadacao_total
        THUMB
//  205 void FATURAMENTO_set_arrecadacao_total(unsigned int arrecadacao){
FATURAMENTO_set_arrecadacao_total:
        PUSH     {R0,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  206   
//  207   PARAMETROS_grava(ADR_MOEDA_TOTAL,(void*)&arrecadacao);
        ADD      R1,SP,#+0
        MOVS     R0,#+13
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  208 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock13
//  209 /***********************************************************************************
//  210 *       Descrição       :       Setter para a contagem do cartão
//  211 *       Parametros      :       (unsigned int) contagem
//  212 *       Retorno         :       nenhum
//  213 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function FATURAMENTO_set_contagem_cartao_total
        THUMB
//  214 void FATURAMENTO_set_contagem_cartao_total(unsigned int contagem){
FATURAMENTO_set_contagem_cartao_total:
        PUSH     {R0,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  215   
//  216    PARAMETROS_grava(ADR_UNIDADES_CARTAO_TOTAL,(void*)&contagem); 
        ADD      R1,SP,#+0
        MOVS     R0,#+17
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  217 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock14
//  218 /***********************************************************************************
//  219 *       Descrição       :       Setter para a arrecadacação do cartão
//  220 *       Parametros      :       (unsigned int) arrecadacao total do cartão
//  221 *       Retorno         :       nenhum
//  222 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function FATURAMENTO_set_arrecadacao_cartao_total
        THUMB
//  223 void FATURAMENTO_set_arrecadacao_cartao_total(unsigned int arrecadacao){
FATURAMENTO_set_arrecadacao_cartao_total:
        PUSH     {R0,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  224   
//  225   PARAMETROS_grava(ADR_CARTAO_TOTAL,(void*)&arrecadacao); 
        ADD      R1,SP,#+0
        MOVS     R0,#+15
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  226 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock15
//  227 /***********************************************************************************
//  228 *       Descrição       :       Adicionar uma contagem ao contador parcial
//  229 *       Parametros      :       (unsigned int) contagem para adicionar
//  230 *       Retorno         :       nenhum
//  231 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function FATURAMENTO_add_contagem_parcial
        THUMB
//  232 void FATURAMENTO_add_contagem_parcial(unsigned int contagem){
FATURAMENTO_add_contagem_parcial:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  233   unsigned int temp;
//  234 
//  235   PARAMETROS_le(ADR_CONTAGEM_UNIDADES_PARCIAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+10
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  236   temp+=contagem;
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        STR      R0,[SP, #+0]
//  237   PARAMETROS_grava(ADR_CONTAGEM_UNIDADES_PARCIAL,(void*)&temp);  
        ADD      R1,SP,#+0
        MOVS     R0,#+10
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  238 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock16
//  239 /***********************************************************************************
//  240 *       Descrição       :       Adicionar uma contagem à arrecadação parcial
//  241 *       Parametros      :       (unsigned int) arrecadacao
//  242 *       Retorno         :       nenhum
//  243 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function FATURAMENTO_add_arrecadacao_parcial
        THUMB
//  244 void FATURAMENTO_add_arrecadacao_parcial(unsigned int arrecadacao){
FATURAMENTO_add_arrecadacao_parcial:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  245   unsigned int temp;
//  246 
//  247   PARAMETROS_le(ADR_MOEDA_PARCIAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+12
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  248   temp+=arrecadacao;
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        STR      R0,[SP, #+0]
//  249   PARAMETROS_grava(ADR_MOEDA_PARCIAL,(void*)&temp);  
        ADD      R1,SP,#+0
        MOVS     R0,#+12
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  250 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock17
//  251 /***********************************************************************************
//  252 *       Descrição       :       Adiciona contagem ao cartão parcial
//  253 *       Parametros      :       (unsigned int) cartão parcial
//  254 *       Retorno                 nenhum
//  255 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function FATURAMENTO_add_contagem_cartao_parcial
        THUMB
//  256 void FATURAMENTO_add_contagem_cartao_parcial(unsigned int contagem){
FATURAMENTO_add_contagem_cartao_parcial:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  257   unsigned int temp;
//  258 
//  259   PARAMETROS_le(ADR_UNIDADES_CARTAO_PARCIAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+16
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  260   temp+=contagem;
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        STR      R0,[SP, #+0]
//  261   PARAMETROS_grava(ADR_UNIDADES_CARTAO_PARCIAL,(void*)&temp);  
        ADD      R1,SP,#+0
        MOVS     R0,#+16
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  262 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock18
//  263 /***********************************************************************************
//  264 *       Descrição        :    Adiciona um valor à arrecadação do cartão
//  265 *       Parametros       :    (unsigned int) cartão parcial
//  266 *       Retorno         :       nenhum
//  267 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function FATURAMENTO_add_arrecadacao_cartao_parcial
        THUMB
//  268 void FATURAMENTO_add_arrecadacao_cartao_parcial(unsigned int arrecadacao){
FATURAMENTO_add_arrecadacao_cartao_parcial:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  269   unsigned int temp;
//  270 
//  271   PARAMETROS_le(ADR_CARTAO_PARCIAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+14
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  272   temp+=arrecadacao;
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        STR      R0,[SP, #+0]
//  273   PARAMETROS_grava(ADR_CARTAO_PARCIAL,(void*)&temp);  
        ADD      R1,SP,#+0
        MOVS     R0,#+14
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  274 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock19
//  275 /***********************************************************************************
//  276 *       Descrição       :      Adiciona um valor a contagem total de unidades
//  277 *                              vendidas
//  278 *       Parametros      :      (unsigned int) contagem
//  279 *       Retorno         :       nenhum
//  280 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function FATURAMENTO_add_contagem_total
        THUMB
//  281 void FATURAMENTO_add_contagem_total(unsigned int contagem){
FATURAMENTO_add_contagem_total:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  282   unsigned int temp;
//  283 
//  284   PARAMETROS_le(ADR_CONTAGEM_UNIDADES_TOTAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+11
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  285   temp+=contagem;
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        STR      R0,[SP, #+0]
//  286   PARAMETROS_grava(ADR_CONTAGEM_UNIDADES_TOTAL,(void*)&temp);  
        ADD      R1,SP,#+0
        MOVS     R0,#+11
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  287 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock20
//  288 /***********************************************************************************
//  289 *       Descrição       :       Adiciona um valor a contagem total de unidades
//  290 *                               vendidas
//  291 *       Parametros      :       (unsigned int) contagem
//  292 *       Retorno         :       nenhum
//  293 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function FATURAMENTO_add_arrecadacao_total
        THUMB
//  294 void FATURAMENTO_add_arrecadacao_total(unsigned int arrecadacao){
FATURAMENTO_add_arrecadacao_total:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  295   unsigned int temp;
//  296 
//  297   PARAMETROS_le(ADR_MOEDA_TOTAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+13
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  298   temp+=arrecadacao;
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        STR      R0,[SP, #+0]
//  299   PARAMETROS_grava(ADR_MOEDA_TOTAL,(void*)&temp);  
        ADD      R1,SP,#+0
        MOVS     R0,#+13
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  300 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock21
//  301 /***********************************************************************************
//  302 *       Descrição       :       Adiciona um valor a contagem total do 
//  303 *                               cartão
//  304 *       Parametros      :       (unsigned int) contagem
//  305 *       Retorno         :       nennhum
//  306 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function FATURAMENTO_add_contagem_cartao_total
        THUMB
//  307 void FATURAMENTO_add_contagem_cartao_total(unsigned int contagem){
FATURAMENTO_add_contagem_cartao_total:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  308   unsigned int temp;
//  309 
//  310   PARAMETROS_le(ADR_UNIDADES_CARTAO_TOTAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+17
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  311   temp+=contagem;
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        STR      R0,[SP, #+0]
//  312   PARAMETROS_grava(ADR_UNIDADES_CARTAO_TOTAL,(void*)&temp);  
        ADD      R1,SP,#+0
        MOVS     R0,#+17
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  313 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock22
//  314 /***********************************************************************************
//  315 *       Descrição       :       Adiciona um valor à contagem total do cartão
//  316 *       Parametros      :       (unsigned int) contagem
//  317 *       Retorno         :       nenhum
//  318 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function FATURAMENTO_add_arrecadacao_cartao_total
        THUMB
//  319 void FATURAMENTO_add_arrecadacao_cartao_total(unsigned int arrecadacao){
FATURAMENTO_add_arrecadacao_cartao_total:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  320   unsigned int temp;
//  321 
//  322   PARAMETROS_le(ADR_CARTAO_TOTAL,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+15
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  323   temp+=arrecadacao;
        LDR      R0,[SP, #+0]
        ADDS     R0,R4,R0
        STR      R0,[SP, #+0]
//  324   PARAMETROS_grava(ADR_CARTAO_TOTAL,(void*)&temp);  
        ADD      R1,SP,#+0
        MOVS     R0,#+15
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  325 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock23
//  326 /***********************************************************************************
//  327 *       Descrição       :       Reinicia a contagem do contador de 
//  328 *                               pipocas preparada na tela de teste
//  329 *       Parametros      :       nenhum
//  330 *       Retorno         :       nenhum
//  331 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function FATURAMENTO_reinicia_pipocas_teste
        THUMB
//  332 void FATURAMENTO_reinicia_pipocas_teste(void){
FATURAMENTO_reinicia_pipocas_teste:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  333   unsigned int temp;
//  334   
//  335   temp = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  336   PARAMETROS_grava(ADR_CONTADOR_PIPOCAS_TESTE,(void*)&temp);    
        ADD      R1,SP,#+0
        MOVS     R0,#+39
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  337 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock24
//  338 /***********************************************************************************
//  339 *       Descrição       :       Incrementa o contador de pipocas
//  340 *                               teste
//  341 *       Parametros      :       nennhum
//  342 *       Retorno         :       nennhum
//  343 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function FATURAMENTO_inc_contador_pipocas_teste
        THUMB
//  344 void FATURAMENTO_inc_contador_pipocas_teste(void){
FATURAMENTO_inc_contador_pipocas_teste:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  345   unsigned int temp;
//  346   
//  347    PARAMETROS_le(ADR_CONTADOR_PIPOCAS_TESTE,(void*)&temp);
        ADD      R1,SP,#+0
        MOVS     R0,#+39
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  348    temp+=1;
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
//  349    PARAMETROS_grava(ADR_CONTADOR_PIPOCAS_TESTE,(void*)&temp);  
        ADD      R1,SP,#+0
        MOVS     R0,#+39
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  350 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock25

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  351 /***********************************************************************************
//  352 *       Fim do arquivo
//  353 ***********************************************************************************/
// 
// 490 bytes in section .text
// 
// 490 bytes of CODE memory
//
//Errors: none
//Warnings: none
