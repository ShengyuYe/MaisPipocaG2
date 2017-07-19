///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     19/Jul/2017  15:04:06 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\POST.c                        /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\POST.c -lC                    /
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
//                    pocaG2\SOFTWARE\Debug\List\POST.s                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME POST

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN AA_calculaTemperatura
        EXTERN APLICACAO_carrega_idioma
        EXTERN CT_set_temperatura
        EXTERN EMBALAGEM_verifica_estoque
        EXTERN POTENCIA_getRPMmedido
        EXTERN POTENCIA_setRPM
        EXTERN POTENCIA_set_neutro
        EXTERN STRING_mensagem_inicio_autoteste
        EXTERN STRING_write_to_external
        EXTERN STRING_write_to_internal
        EXTERN vTaskDelay

        PUBLIC POST_entry
        PUBLIC POST_verificacao_ciclica
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Aplicacao\POST.c
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
//   17 |       Arquivo            :  POST.c
//   18 |       Descrição          :  Funções que executam o autoteste da máquina
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  25/04/2017
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
//   36 #include "post.h"
//   37 
//   38 /***********************************************************************************
//   39 *       Definições locais
//   40 ***********************************************************************************/
//   41 #define TEMPO_TESTE_MOTOR                       30000
//   42 #define TEMPO_TESTE_RESISTENCIA                 60000
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
//   56 
//   57 
//   58 /***********************************************************************************
//   59 *       Implementação das funções
//   60 ***********************************************************************************/
//   61 
//   62 /***********************************************************************************
//   63 *       Descrição       :       Ponto de entrada para o Post do sistema
//   64 *       Parametros      :       nenhum
//   65 *       Retorno         :       (ePOST_RESULT) resultado do POST
//   66 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function POST_entry
        THUMB
//   67 ePOST_RESULT POST_entry(void){
POST_entry:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//   68   unsigned int tempo;
//   69   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//   70 
//   71 
//   72   STRING_write_to_internal(CLEAR_DISPLAY,
//   73                           (char*)STRING_mensagem_inicio_autoteste[idioma][0],
//   74                           (char*)STRING_mensagem_inicio_autoteste[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable0
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable0
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//   75     
//   76   STRING_write_to_external(CLEAR_DISPLAY,
//   77                            (char*)STRING_mensagem_inicio_autoteste[idioma][0],
//   78                            (char*)STRING_mensagem_inicio_autoteste[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable0
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable0
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//   79                                
//   80   POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//   81   vTaskDelay(1000);
        MOV      R0,#+1000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   82   POTENCIA_setRPM(5000);
        MOVW     R0,#+5000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//   83   
//   84   // Teste do motor
//   85   tempo = TEMPO_TESTE_MOTOR;
        MOVW     R4,#+30000
        B.N      ??POST_entry_0
//   86   while(POTENCIA_getRPMmedido()<1000 && --tempo)
//   87     vTaskDelay(1);
??POST_entry_1:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??POST_entry_0:
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        CMP      R0,#+1000
        BCS.N    ??POST_entry_2
        SUBS     R4,R4,#+1
        CMP      R4,#+0
        BNE.N    ??POST_entry_1
//   88   
//   89   if(!tempo){
??POST_entry_2:
        CMP      R4,#+0
        BNE.N    ??POST_entry_3
//   90     POTENCIA_set_neutro(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//   91     POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//   92     return POST_FALHA_VENTILADOR;
        MOVS     R0,#+1
        B.N      ??POST_entry_4
//   93   }
//   94   
//   95   // Teste da resistência
//   96   unsigned int temperatura_inicial=AA_calculaTemperatura();  
??POST_entry_3:
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        MOVS     R5,R0
//   97   tempo = TEMPO_TESTE_RESISTENCIA;
        MOVW     R4,#+60000
//   98   CT_set_temperatura(temperatura_inicial+5);
        ADDS     R0,R5,#+5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
        B.N      ??POST_entry_5
//   99   while(AA_calculaTemperatura()<(temperatura_inicial+3) && --tempo)
//  100     vTaskDelay(1);
??POST_entry_6:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??POST_entry_5:
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        ADDS     R1,R5,#+3
        CMP      R0,R1
        BCS.N    ??POST_entry_7
        SUBS     R4,R4,#+1
        CMP      R4,#+0
        BNE.N    ??POST_entry_6
//  101 
//  102   POTENCIA_set_neutro(0);
??POST_entry_7:
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  103   POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  104   CT_set_temperatura(0);
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  105     
//  106   if(!tempo)
        CMP      R4,#+0
        BNE.N    ??POST_entry_8
//  107     return POST_FALHA_VENTILADOR;  
        MOVS     R0,#+1
        B.N      ??POST_entry_4
//  108   
//  109   // Verifica se existem embalagens
//  110   // no reservatório
//  111   if(EMBALAGEM_verifica_estoque()==EMBALAGEM_SEM_PACOTES)
??POST_entry_8:
          CFI FunCall EMBALAGEM_verifica_estoque
        BL       EMBALAGEM_verifica_estoque
        CMP      R0,#+0
        BNE.N    ??POST_entry_9
//  112     return POST_FALHA_PAPEL;  
        MOVS     R0,#+7
        B.N      ??POST_entry_4
//  113           
//  114   return POST_SUCESSO;
??POST_entry_9:
        MOVS     R0,#+0
??POST_entry_4:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock0
//  115 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     STRING_mensagem_inicio_autoteste
//  116 /***********************************************************************************
//  117 *       Descrição       :       Faz a verificação cíclica dos componentes
//  118 *       Parametros      :       nenhum
//  119 *       Retorno         :      ePOST_CICLICO_RESULT
//  120 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function POST_verificacao_ciclica
        THUMB
//  121 ePOST_CICLICO_RESULT POST_verificacao_ciclica(void){
POST_verificacao_ciclica:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  122   unsigned int temperatura;
//  123   
//  124   if(EMBALAGEM_verifica_estoque()==EMBALAGEM_SEM_PACOTES)
          CFI FunCall EMBALAGEM_verifica_estoque
        BL       EMBALAGEM_verifica_estoque
        CMP      R0,#+0
        BNE.N    ??POST_verificacao_ciclica_0
//  125     return POST_CICLICO_FALHA_EMBALAGEM;
        MOVS     R0,#+1
        B.N      ??POST_verificacao_ciclica_1
//  126   
//  127   temperatura = AA_calculaTemperatura();
??POST_verificacao_ciclica_0:
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
//  128   if(!temperatura || temperatura>=500)
        CMP      R0,#+0
        BEQ.N    ??POST_verificacao_ciclica_2
        CMP      R0,#+500
        BCC.N    ??POST_verificacao_ciclica_3
//  129     return POST_CICLICO_FALHA_TERMISTOR;
??POST_verificacao_ciclica_2:
        MOVS     R0,#+2
        B.N      ??POST_verificacao_ciclica_1
//  130   
//  131   return POST_CICLICO_SUCESSO;
??POST_verificacao_ciclica_3:
        MOVS     R0,#+0
??POST_verificacao_ciclica_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock1
//  132 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  133 /***********************************************************************************
//  134 *       Fim do arquivo
//  135 ***********************************************************************************/
// 
// 250 bytes in section .text
// 
// 250 bytes of CODE memory
//
//Errors: none
//Warnings: none
