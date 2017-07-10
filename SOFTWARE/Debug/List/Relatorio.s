///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     10/Jul/2017  15:20:21 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Relatorio\Relatorio.c                   /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Relatorio\Relatorio.c -lC               /
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
//                    pocaG2\SOFTWARE\Debug\List\Relatorio.s                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Relatorio

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", "flags,widths"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN FTP_get_quantidade_novas_trocas
        EXTERN FTP_get_troca
        EXTERN IMPRESSORA_envia_linha
        EXTERN PARAMETROS_le
        EXTERN RTC_getValue
        EXTERN SERIALMUX_seleciona
        EXTERN sprintf

        PUBLIC RELATORIO_entry
        PUBLIC RELATORIO_eventos_troca_preco
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Relatorio\Relatorio.c
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
//   17 |       Arquivo            :  Relatorio.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  30/05/2017
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
//   35 #include "relatorio.h"
//   36 #include "relatorio_ptbr.h"
//   37 
//   38 /***********************************************************************************
//   39 *       Definições
//   40 ***********************************************************************************/
//   41 #define LINHA_TROCA_PRECO               "  [Troca de preco]\n\r"
//   42 
//   43 /***********************************************************************************
//   44 *       Constantes
//   45 ***********************************************************************************/
//   46 
//   47 
//   48 /***********************************************************************************
//   49 *       Variaveis
//   50 ***********************************************************************************/
//   51 
//   52 
//   53 /***********************************************************************************
//   54 *       Funções
//   55 ***********************************************************************************/
//   56 void RELATORIO_eventos_troca_preco(void);
//   57 
//   58 /***********************************************************************************
//   59 *       Implementação 
//   60 ***********************************************************************************/
//   61 
//   62 /***********************************************************************************
//   63 *       Descrição       :       ponto de entrada do emissor do relatório
//   64 *       Parametros      :       nenhum
//   65 *       Retorno         :       nenhum
//   66 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function RELATORIO_entry
        THUMB
//   67 void RELATORIO_entry(void){
RELATORIO_entry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+128
          CFI CFA R13+136
//   68   unsigned int numero_serie;
//   69   unsigned int arrecadacao_parcial;
//   70   unsigned int arrecadacao_total;
//   71   unsigned int unidades_parcial;
//   72   unsigned int unidades_total;
//   73   unsigned int cartao_parcial;
//   74   unsigned int cartao_total;
//   75   unsigned char hora,minuto,segundo,dia,mes;
//   76   unsigned int ano;
//   77   unsigned int comissao_ponto;
//   78   unsigned int faturamento_ponto;  
//   79   unsigned int valor;
//   80   char buffer_linha[64];
//   81   unsigned int preparacao_teste;
//   82   
//   83   SERIALMUX_seleciona(SERIALMUX_RS232);
        MOVS     R0,#+0
          CFI FunCall SERIALMUX_seleciona
        BL       SERIALMUX_seleciona
//   84   
//   85   RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
        ADD      R0,SP,#+108
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+9
        ADD      R2,SP,#+10
        ADD      R1,SP,#+11
        ADD      R0,SP,#+12
          CFI FunCall RTC_getValue
        BL       RTC_getValue
//   86   PARAMETROS_le(ADR_NUMERO_SERIE,             (void*)&numero_serie);  
        ADD      R1,SP,#+120
        MOVS     R0,#+36
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   87   PARAMETROS_le(ADR_CONTAGEM_UNIDADES_PARCIAL,(void*)&unidades_parcial);
        ADD      R1,SP,#+116
        MOVS     R0,#+10
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   88   PARAMETROS_le(ADR_CONTAGEM_UNIDADES_TOTAL,  (void*)&unidades_total);
        ADD      R1,SP,#+112
        MOVS     R0,#+11
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   89   PARAMETROS_le(ADR_MOEDA_PARCIAL,            (void*)&arrecadacao_parcial);
        ADD      R1,SP,#+80
        MOVS     R0,#+12
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   90   PARAMETROS_le(ADR_MOEDA_TOTAL,              (void*)&arrecadacao_total);
        ADD      R1,SP,#+100
        MOVS     R0,#+13
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   91   PARAMETROS_le(ADR_CARTAO_PARCIAL,           (void*)&cartao_parcial);
        ADD      R1,SP,#+96
        MOVS     R0,#+14
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   92   PARAMETROS_le(ADR_CARTAO_TOTAL,             (void*)&cartao_total); 
        ADD      R1,SP,#+92
        MOVS     R0,#+15
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   93   PARAMETROS_le(ADR_COMISSAO_PONTO,           (void*)&comissao_ponto);
        ADD      R1,SP,#+88
        MOVS     R0,#+37
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   94   PARAMETROS_le(ADR_VALOR_PIPOCA,             (void*)&valor);
        ADD      R1,SP,#+84
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   95   PARAMETROS_le(ADR_CONTADOR_PIPOCAS_TESTE,   (void*)&preparacao_teste);  
        ADD      R1,SP,#+104
        MOVS     R0,#+39
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   96     
//   97   faturamento_ponto = comissao_ponto * arrecadacao_parcial;
        LDR      R0,[SP, #+88]
        LDR      R1,[SP, #+80]
        MUL      R4,R1,R0
//   98   faturamento_ponto/= 100;
        MOVS     R0,#+100
        UDIV     R4,R4,R0
//   99   
//  100   // Linha 01
//  101   sprintf(buffer_linha,REL_PT_BR_01);
        LDR.W    R1,??DataTable1
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  102   IMPRESSORA_envia_linha(buffer_linha);
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  103   // Linha 02
//  104   sprintf(buffer_linha,REL_PT_BR_02);
        LDR.W    R1,??DataTable1_1
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  105   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  106   // Linha 03
//  107   sprintf(buffer_linha,REL_PT_BR_03);
        LDR.W    R1,??DataTable1
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  108   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  109   // Linha 04
//  110   sprintf(buffer_linha,REL_PT_BR_04);
        LDR.W    R1,??DataTable1_2
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  111   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  112   // Linha 05
//  113   sprintf(buffer_linha,REL_PT_BR_05);
        LDR.W    R1,??DataTable1_3
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  114   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  115   // Linha 06
//  116   sprintf(buffer_linha,REL_PT_BR_06);
        LDR.W    R1,??DataTable1_2
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  117   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  118   // Linha 07
//  119   sprintf(buffer_linha,REL_PT_BR_07);
        LDR.W    R1,??DataTable1
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  120   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  121   // Linha 08
//  122   sprintf(buffer_linha,REL_PT_BR_08);
        LDR.W    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  123   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  124   // Linha 09
//  125   sprintf(buffer_linha,REL_PT_BR_09);
        LDR.W    R1,??DataTable1_5
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  126   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  127   // Linha 10
//  128   sprintf(buffer_linha,REL_PT_BR_10);
        LDR      R2,[SP, #+120]
        LDR.W    R1,??DataTable1_6
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  129   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  130   // Linha 11
//  131   sprintf(buffer_linha,REL_PT_BR_11);
        LDR.W    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  132   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  133   // Linha 12
//  134   sprintf(buffer_linha,REL_PT_BR_12);
        LDR.W    R1,??DataTable1_7
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  135   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  136   // Linha 13
//  137   sprintf(buffer_linha,REL_PT_BR_13);
        LDR      R2,[SP, #+116]
        LDR.W    R1,??DataTable1_8
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  138   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  139   // Linha 14
//  140   sprintf(buffer_linha,REL_PT_BR_14);
        LDR      R0,[SP, #+80]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        MLS      R3,R1,R2,R0
        LDR      R0,[SP, #+80]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        LDR.W    R1,??DataTable1_9
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  141   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  142   // Linha 15
//  143   sprintf(buffer_linha,REL_PT_BR_15);
        LDR.W    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  144   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  145   // Linha 16
//  146   sprintf(buffer_linha,REL_PT_BR_16);
        LDR.W    R1,??DataTable1_10
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  147   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  148   // Linha 17
//  149   sprintf(buffer_linha,REL_PT_BR_17);
        LDR      R2,[SP, #+112]
        LDR.W    R1,??DataTable1_8
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  150   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  151   // Linha 18
//  152   sprintf(buffer_linha,REL_PT_BR_18);
        LDR      R0,[SP, #+100]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        MLS      R3,R1,R2,R0
        LDR      R0,[SP, #+100]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        LDR.W    R1,??DataTable1_9
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  153   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  154   // Linha 19
//  155   sprintf(buffer_linha,REL_PT_BR_19);
        LDR.W    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  156   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  157   // Linha 20
//  158   sprintf(buffer_linha,REL_PT_BR_20);
        LDR.W    R1,??DataTable1_11
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  159   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  160   // Linha 21
//  161   sprintf(buffer_linha,REL_PT_BR_21);
        LDR      R0,[SP, #+96]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        MLS      R3,R1,R2,R0
        LDR      R0,[SP, #+96]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        LDR.W    R1,??DataTable1_12
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  162   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  163   // Linha 22
//  164   sprintf(buffer_linha,REL_PT_BR_22);
        LDR      R0,[SP, #+92]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        MLS      R3,R1,R2,R0
        LDR      R0,[SP, #+92]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        LDR.W    R1,??DataTable1_13
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  165   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  166   // Linha 23
//  167   sprintf(buffer_linha,REL_PT_BR_23);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  168   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  169   // Linha 24
//  170   sprintf(buffer_linha,REL_PT_BR_24);
        LDR.W    R1,??DataTable1_14
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  171   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  172   // Linha 25
//  173   sprintf(buffer_linha,REL_PT_BR_25);
        LDR      R2,[SP, #+88]
        LDR.N    R1,??DataTable1_15
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  174   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  175   // Linha 26
//  176   sprintf(buffer_linha,REL_PT_BR_26);
        MOVS     R0,#+100
        UDIV     R1,R4,R0
        MLS      R3,R0,R1,R4
        MOVS     R0,#+100
        UDIV     R2,R4,R0
        LDR.N    R1,??DataTable1_16
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  177   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  178   // Linha 27
//  179   sprintf(buffer_linha,REL_PT_BR_27);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  180   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  181   // Linha 28
//  182   sprintf(buffer_linha,REL_PT_BR_28);
        LDR.N    R1,??DataTable1_17
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  183   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  184   // Linha 29
//  185   sprintf(buffer_linha,REL_PT_BR_29);
        LDR      R0,[SP, #+108]
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+8]
        LDRB     R2,[SP, #+9]
        LDR.N    R1,??DataTable1_18
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  186   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  187   // Linha 30
//  188   sprintf(buffer_linha,REL_PT_BR_30);
        LDRB     R0,[SP, #+10]
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+11]
        LDRB     R2,[SP, #+12]
        LDR.N    R1,??DataTable1_19
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  189   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  190   // Linha 31
//  191   sprintf(buffer_linha,REL_PT_BR_31);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  192   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  193   // Linha 32
//  194   sprintf(buffer_linha,REL_PT_BR_32);
        LDR.N    R1,??DataTable1_20
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  195   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  196   // Linha 33
//  197   sprintf(buffer_linha,REL_PT_BR_33);
        LDR      R0,[SP, #+84]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        MLS      R3,R1,R2,R0
        LDR      R0,[SP, #+84]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        LDR.N    R1,??DataTable1_21
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  198   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  199   // Linha 34
//  200   sprintf(buffer_linha,REL_PT_BR_34);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  201   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  202   // Linha 35
//  203   sprintf(buffer_linha,REL_PT_BR_35);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  204   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  205   // Linha 36
//  206   sprintf(buffer_linha,REL_PT_BR_36);
        LDR.N    R1,??DataTable1_22
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  207   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  208   // Linha 37
//  209   sprintf(buffer_linha,REL_PT_BR_37);
        LDR      R2,[SP, #+104]
        LDR.N    R1,??DataTable1_23
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  210   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  211   // Linha 38
//  212   sprintf(buffer_linha,REL_PT_BR_38);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  213   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  214   // Linha 39
//  215   sprintf(buffer_linha,REL_PT_BR_39);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  216   IMPRESSORA_envia_linha(buffer_linha);
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  217   
//  218   // Imprime os últimos 10 eventos de troca
//  219   // no preço da pipoca
//  220   RELATORIO_eventos_troca_preco();
          CFI FunCall RELATORIO_eventos_troca_preco
        BL       RELATORIO_eventos_troca_preco
//  221   
//  222   // Linha 40
//  223   sprintf(buffer_linha,REL_PT_BR_40);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  224   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  225   // Linha 41
//  226   sprintf(buffer_linha,REL_PT_BR_41);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  227   IMPRESSORA_envia_linha(buffer_linha);  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  228   // Linha 42
//  229   sprintf(buffer_linha,REL_PT_BR_42);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  230   IMPRESSORA_envia_linha(buffer_linha);    
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  231   // Linha 42
//  232   sprintf(buffer_linha,REL_PT_BR_42);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  233   IMPRESSORA_envia_linha(buffer_linha);    
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  234   // Linha 43
//  235   sprintf(buffer_linha,REL_PT_BR_43);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  236   IMPRESSORA_envia_linha(buffer_linha);    
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  237   // Linha 44
//  238   sprintf(buffer_linha,REL_PT_BR_44);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  239   IMPRESSORA_envia_linha(buffer_linha);    
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  240   // Linha 45
//  241   sprintf(buffer_linha,REL_PT_BR_45);
        LDR.N    R1,??DataTable1_24
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  242   IMPRESSORA_envia_linha(buffer_linha);    
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  243   // Linha 46
//  244   sprintf(buffer_linha,REL_PT_BR_46);
        LDR.N    R1,??DataTable1_25
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  245   IMPRESSORA_envia_linha(buffer_linha);    
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  246   // Linha 47
//  247   sprintf(buffer_linha,REL_PT_BR_47);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  248   IMPRESSORA_envia_linha(buffer_linha);    
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  249   // Linha 48
//  250   sprintf(buffer_linha,REL_PT_BR_48);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  251   IMPRESSORA_envia_linha(buffer_linha);    
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  252   // Linha 49
//  253   sprintf(buffer_linha,REL_PT_BR_49);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  254   IMPRESSORA_envia_linha(buffer_linha);    
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  255   // Linha 50
//  256   sprintf(buffer_linha,REL_PT_BR_50);
        LDR.N    R1,??DataTable1
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  257   IMPRESSORA_envia_linha(buffer_linha);    
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  258   // Linha 51
//  259   sprintf(buffer_linha,REL_PT_BR_51);
        LDR.N    R1,??DataTable1_26
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  260   IMPRESSORA_envia_linha(buffer_linha);    
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  261   // Linha 52
//  262   sprintf(buffer_linha,REL_PT_BR_52);
        LDR.N    R1,??DataTable1_27
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  263   IMPRESSORA_envia_linha(buffer_linha);      
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  264   // Linha 53
//  265   sprintf(buffer_linha,REL_PT_BR_53);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  266   IMPRESSORA_envia_linha(buffer_linha);        
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  267   // Linha 54
//  268   sprintf(buffer_linha,REL_PT_BR_54);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  269   IMPRESSORA_envia_linha(buffer_linha);          
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  270   // Linha 55
//  271   sprintf(buffer_linha,REL_PT_BR_55);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  272   IMPRESSORA_envia_linha(buffer_linha);            
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  273   // Linha 56
//  274   sprintf(buffer_linha,REL_PT_BR_56);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  275   IMPRESSORA_envia_linha(buffer_linha);              
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  276   // Linha 57
//  277   sprintf(buffer_linha,REL_PT_BR_57);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  278   IMPRESSORA_envia_linha(buffer_linha);                
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  279   // Linha 58
//  280   sprintf(buffer_linha,REL_PT_BR_58);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  281   IMPRESSORA_envia_linha(buffer_linha);                  
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  282   // Linha 59
//  283   sprintf(buffer_linha,REL_PT_BR_59);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  284   IMPRESSORA_envia_linha(buffer_linha);                    
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  285   // Linha 60
//  286   sprintf(buffer_linha,REL_PT_BR_60);
        LDR.N    R1,??DataTable1_4
        ADD      R0,SP,#+16
          CFI FunCall sprintf
        BL       sprintf
//  287   IMPRESSORA_envia_linha(buffer_linha);        
        ADD      R0,SP,#+16
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  288   
//  289   SERIALMUX_seleciona(SERIALMUX_USB);
        MOVS     R0,#+2
          CFI FunCall SERIALMUX_seleciona
        BL       SERIALMUX_seleciona
//  290 }
        ADD      SP,SP,#+128
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//  291 /***********************************************************************************
//  292 *       Descrição       :       Verifica se existem eventos de alteração
//  293 *                               no valor da pipoca
//  294 *       Parametros      :       nennhum
//  295 *       Retorno         :       nenhum
//  296 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function RELATORIO_eventos_troca_preco
        THUMB
//  297 void RELATORIO_eventos_troca_preco(void){
RELATORIO_eventos_troca_preco:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+80
          CFI CFA R13+96
//  298   unsigned short int eventos;
//  299   unsigned short int novo_preco;
//  300   unsigned short int preco_antigo;
//  301   unsigned char hora,minuto,segundo;
//  302   unsigned char dia,mes;
//  303   unsigned int ano;
//  304   char buffer_linha[40];
//  305   
//  306   eventos = FTP_get_quantidade_novas_trocas();
          CFI FunCall FTP_get_quantidade_novas_trocas
        BL       FTP_get_quantidade_novas_trocas
        MOVS     R4,R0
//  307   if(eventos){
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BEQ.N    ??RELATORIO_eventos_troca_preco_0
//  308     
//  309     sprintf(buffer_linha,LINHA_TROCA_PRECO);
        LDR.N    R1,??DataTable1_28
        ADD      R0,SP,#+36
          CFI FunCall sprintf
        BL       sprintf
//  310     IMPRESSORA_envia_linha(buffer_linha);                 
        ADD      R0,SP,#+36
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  311         
//  312     for(unsigned short int i=0,indice=eventos-1;i<eventos;i++,indice--){
        MOVS     R5,#+0
        SUBS     R6,R4,#+1
        B.N      ??RELATORIO_eventos_troca_preco_1
//  313       
//  314       FTP_get_troca(indice,&novo_preco,&preco_antigo,&hora,&minuto,&segundo,&dia,&mes,&ano);
??RELATORIO_eventos_troca_preco_2:
        ADD      R0,SP,#+32
        STR      R0,[SP, #+16]
        ADD      R0,SP,#+20
        STR      R0,[SP, #+12]
        ADD      R0,SP,#+21
        STR      R0,[SP, #+8]
        ADD      R0,SP,#+22
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+23
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+24
        ADD      R2,SP,#+26
        ADD      R1,SP,#+28
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall FTP_get_troca
        BL       FTP_get_troca
//  315       
//  316       sprintf(buffer_linha,"  [%02d de %02d]\n\r",i+1,eventos);
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R3,R4
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R2,R5,#+1
        LDR.N    R1,??DataTable1_29
        ADD      R0,SP,#+36
          CFI FunCall sprintf
        BL       sprintf
//  317       IMPRESSORA_envia_linha(buffer_linha);    
        ADD      R0,SP,#+36
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  318       
//  319       sprintf(buffer_linha,"   Preco Antigo: R$ %02d,%02d\n\r\n\r",preco_antigo/100,preco_antigo%100);
        LDRH     R0,[SP, #+26]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R3,R1,R2,R0
        LDRH     R0,[SP, #+26]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        LDR.N    R1,??DataTable1_30
        ADD      R0,SP,#+36
          CFI FunCall sprintf
        BL       sprintf
//  320       IMPRESSORA_envia_linha(buffer_linha);   
        ADD      R0,SP,#+36
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  321       
//  322       sprintf(buffer_linha,"   Novo Preco: R$ %02d,%02d\n\r\n\r",novo_preco/100,novo_preco%100);
        LDRH     R0,[SP, #+28]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R3,R1,R2,R0
        LDRH     R0,[SP, #+28]
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        LDR.N    R1,??DataTable1_31
        ADD      R0,SP,#+36
          CFI FunCall sprintf
        BL       sprintf
//  323       IMPRESSORA_envia_linha(buffer_linha);   
        ADD      R0,SP,#+36
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  324       
//  325       sprintf(buffer_linha,"   Em %02d/%02d/%04d as %02d:%02d:%02d\n\r",dia,mes,ano,hora,minuto,segundo);
        LDRB     R0,[SP, #+22]
        STR      R0,[SP, #+12]
        LDRB     R0,[SP, #+23]
        STR      R0,[SP, #+8]
        LDRB     R0,[SP, #+24]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+32]
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+20]
        LDRB     R2,[SP, #+21]
        LDR.N    R1,??DataTable1_32
        ADD      R0,SP,#+36
          CFI FunCall sprintf
        BL       sprintf
//  326       IMPRESSORA_envia_linha(buffer_linha);   
        ADD      R0,SP,#+36
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  327     }
        ADDS     R5,R5,#+1
        SUBS     R6,R6,#+1
??RELATORIO_eventos_troca_preco_1:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R5,R4
        BCC.N    ??RELATORIO_eventos_troca_preco_2
//  328     
//  329     sprintf(buffer_linha,"\n\r\n\r\n\r\n\r\n\r");
        LDR.N    R1,??DataTable1_33
        ADD      R0,SP,#+36
          CFI FunCall sprintf
        BL       sprintf
//  330     IMPRESSORA_envia_linha(buffer_linha);       
        ADD      R0,SP,#+36
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
//  331   }      
//  332 }
??RELATORIO_eventos_troca_preco_0:
        ADD      SP,SP,#+80
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     `?<Constant "+--------------------...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     `?<Constant "|  GRUPO ALTECH - MAI...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     `?<Constant "+                    ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     `?<Constant "+  RELATORIO DE VENDA...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     `?<Constant "                     ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     `?<Constant "  [Numero de serie]  ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     `?<Constant "  %06d               ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     `?<Constant "  [Faturamento parcia...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     `?<Constant "   unidades   : %d   ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     `?<Constant "   arrecadacao: R$ %d...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     `?<Constant "  [Faturamento total]...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     `?<Constant "  [Faturamento cartao...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     `?<Constant "   parcial    : R$ %d...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     `?<Constant "   total      : R$ %d...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     `?<Constant "  [Comissao do ponto]...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     `?<Constant "   taxa       : %d %%...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     `?<Constant "   montante   : R$ %d...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     `?<Constant "  [Hora/Data do Relat...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     `?<Constant "    %02d/%02d/%04d   ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_19:
        DC32     `?<Constant "    %02d:%02d:%02d   ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_20:
        DC32     `?<Constant "  [Valor da pipoca]  ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_21:
        DC32     `?<Constant "    R$ %d,%02d       ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_22:
        DC32     `?<Constant "  [Pipocas teste]    ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_23:
        DC32     `?<Constant "    preparacoes: %d  ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_24:
        DC32     `?<Constant "  ___________________...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_25:
        DC32     `?<Constant "           Responsave...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_26:
        DC32     `?<Constant "|          www.maispi...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_27:
        DC32     `?<Constant "+--------------------...">_1`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_28:
        DC32     `?<Constant "  [Troca de preco]\\n\\r">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_29:
        DC32     `?<Constant "  [%02d de %02d]\\n\\r">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_30:
        DC32     `?<Constant "   Preco Antigo: R$ %...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_31:
        DC32     `?<Constant "   Novo Preco: R$ %02...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_32:
        DC32     `?<Constant "   Em %02d/%02d/%04d ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_33:
        DC32     `?<Constant "\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+--------------------...">`:
        DATA
        DC8 "+----------------------------------------+\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "|  GRUPO ALTECH - MAI...">`:
        DATA
        DC8 "|  GRUPO ALTECH - MAIS PIPOCA            +\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+                    ...">`:
        DATA
        DC8 "+                                        +\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+  RELATORIO DE VENDA...">`:
        DATA
        DC8 "+  RELATORIO DE VENDAS                   +\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "                     ...">`:
        DATA
        DC8 "                                          \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  [Numero de serie]  ...">`:
        DATA
        DC8 "  [Numero de serie]                       \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  %06d               ...">`:
        DATA
        DC8 "  %06d                                    \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  [Faturamento parcia...">`:
        DATA
        DC8 "  [Faturamento parcial]                   \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   unidades   : %d   ...">`:
        DATA
        DC8 "   unidades   : %d                        \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   arrecadacao: R$ %d...">`:
        DATA
        DC8 "   arrecadacao: R$ %d,%02d                \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  [Faturamento total]...">`:
        DATA
        DC8 "  [Faturamento total]                     \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  [Faturamento cartao...">`:
        DATA
        DC8 "  [Faturamento cartao]                    \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   parcial    : R$ %d...">`:
        DATA
        DC8 "   parcial    : R$ %d,%02d                \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   total      : R$ %d...">`:
        DATA
        DC8 "   total      : R$ %d,%02d                \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  [Comissao do ponto]...">`:
        DATA
        DC8 "  [Comissao do ponto]                     \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   taxa       : %d %%...">`:
        DATA
        DC8 "   taxa       : %d %%                     \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   montante   : R$ %d...">`:
        DATA
        DC8 "   montante   : R$ %d,%02d                \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  [Hora/Data do Relat...">`:
        DATA
        DC8 "  [Hora/Data do Relatorio]                \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "    %02d/%02d/%04d   ...">`:
        DATA
        DC8 "    %02d/%02d/%04d                        \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "    %02d:%02d:%02d   ...">`:
        DATA
        DC8 "    %02d:%02d:%02d                        \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  [Valor da pipoca]  ...">`:
        DATA
        DC8 "  [Valor da pipoca]                       \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "    R$ %d,%02d       ...">`:
        DATA
        DC8 "    R$ %d,%02d                            \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  [Pipocas teste]    ...">`:
        DATA
        DC8 "  [Pipocas teste]                         \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "    preparacoes: %d  ...">`:
        DATA
        DC8 "    preparacoes: %d                       \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  ___________________...">`:
        DATA
        DC8 "  ________________________________________\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "           Responsave...">`:
        DATA
        DC8 "           Responsavel pelo ponto         \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "|          www.maispi...">`:
        DATA
        DC8 "|          www.maispipoca.com.br         |\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+--------------------...">_1`:
        DATA
        DC8 "+----------------------------------------|\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  [Troca de preco]\\n\\r">`:
        DATA
        DC8 "  [Troca de preco]\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  [%02d de %02d]\\n\\r">`:
        DATA
        DC8 "  [%02d de %02d]\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   Preco Antigo: R$ %...">`:
        DATA
        DC8 "   Preco Antigo: R$ %02d,%02d\012\015\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   Novo Preco: R$ %02...">`:
        DATA
        DC8 "   Novo Preco: R$ %02d,%02d\012\015\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   Em %02d/%02d/%04d ...">`:
        DATA
        DC8 "   Em %02d/%02d/%04d as %02d:%02d:%02d\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r">`:
        DATA
        DC8 "\012\015\012\015\012\015\012\015\012\015"
        DC8 0

        END
//  333 /***********************************************************************************
//  334 *       Fim do arquivo
//  335 ***********************************************************************************/
// 
// 1 512 bytes in section .rodata
// 1 582 bytes in section .text
// 
// 1 582 bytes of CODE  memory
// 1 512 bytes of CONST memory
//
//Errors: none
//Warnings: none
