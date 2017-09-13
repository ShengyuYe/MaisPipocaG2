///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     13/Sep/2017  16:35:11 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\embalag /
//                    em.c                                                    /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\embalag /
//                    em.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Li /
//                    st\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Lis /
//                    t\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Obj\  /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\embala /
//                    gem.s                                                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME embalagem

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN AA_mediaMovelPapel
        EXTERN BOARD_get_sinal
        EXTERN BOARD_getter_general_purpose_counter
        EXTERN BOARD_set_motor_embalagem
        EXTERN BOARD_setter_general_purpose_counter
        EXTERN vTaskDelay

        PUBLIC EMBALAGEM_libera_pacote
        PUBLIC EMBALAGEM_verifica_estoque
        
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\embalagem.c
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
//   17 |       Arquivo            :  embalagem.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  22/04/2017
//   21 |
//   22 |       Revisões           :  001
//   23 |
//   24 |                             (22/04/2017) - Criação do módulo de controle do dispensador 
//   25 |                             da embalagem (Marcos)
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
//   38 #include "embalagem.h"
//   39 /***********************************************************************************
//   40 *       Definições
//   41 ***********************************************************************************/
//   42 #define THRESOLD_NIVEL_PAPEL                    3800
//   43 
//   44 /***********************************************************************************
//   45 *       Constantes
//   46 ***********************************************************************************/
//   47 
//   48 
//   49 /***********************************************************************************
//   50 *       Variaveis 
//   51 ***********************************************************************************/
//   52 
//   53 
//   54 /***********************************************************************************
//   55 *       Funções
//   56 ***********************************************************************************/
//   57 
//   58 
//   59 /***********************************************************************************
//   60 *       Tabelas de função
//   61 ***********************************************************************************/
//   62 
//   63 
//   64 /***********************************************************************************
//   65 *       Implementação das funções
//   66 ***********************************************************************************/
//   67 
//   68 /***********************************************************************************
//   69 *       Descrição       :       Libera uma embalagem 
//   70 *       Parametros      :       nenhum
//   71 *       Retorno         :       (eEMBALAGEM_RESULT) resultado da operação
//   72 *                                                   de liberação da embalagem
//   73 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function EMBALAGEM_libera_pacote
        THUMB
//   74 eEMBALAGEM_RESULT EMBALAGEM_libera_pacote(unsigned int tempo){
EMBALAGEM_libera_pacote:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
//   75   unsigned char automatico = GET_BARREIRA_SAIDA_PAPEL();
        MOVS     R0,#+0
          CFI FunCall BOARD_get_sinal
        BL       BOARD_get_sinal
        MOVS     R5,R0
//   76   unsigned int timeout=2500;
        MOVW     R6,#+2500
//   77   
//   78   // Se não houver papel refletindo no sensor
//   79   // nem chega a ligar o motor do dispensador
//   80   if(AA_mediaMovelPapel()>THRESOLD_NIVEL_PAPEL){
          CFI FunCall AA_mediaMovelPapel
        BL       AA_mediaMovelPapel
        MOVW     R1,#+3801
        CMP      R0,R1
        BLT.N    ??EMBALAGEM_libera_pacote_0
//   81     return EMBALAGEM_SEM_ESTOQUE; 
        MOVS     R0,#+1
        B.N      ??EMBALAGEM_libera_pacote_1
//   82   }
//   83   
//   84   BOARD_set_motor_embalagem(1);
??EMBALAGEM_libera_pacote_0:
        MOVS     R0,#+1
          CFI FunCall BOARD_set_motor_embalagem
        BL       BOARD_set_motor_embalagem
//   85   BOARD_setter_general_purpose_counter(tempo);         
        MOVS     R0,R4
          CFI FunCall BOARD_setter_general_purpose_counter
        BL       BOARD_setter_general_purpose_counter
//   86   
//   87   for(;BOARD_getter_general_purpose_counter();){
??EMBALAGEM_libera_pacote_2:
          CFI FunCall BOARD_getter_general_purpose_counter
        BL       BOARD_getter_general_purpose_counter
        CMP      R0,#+0
        BNE.N    ??EMBALAGEM_libera_pacote_2
//   88         
//   89     //if(!GET_BARREIRA_SAIDA_PAPEL()){
//   90     //  vTaskDelay(tempo);
//   91     //  BOARD_set_motor_embalagem(0);
//   92     //  return EMBALAGEM_LIBERADA;
//   93    // }
//   94   }
//   95 
//   96   while(AA_mediaMovelPapel()>THRESOLD_NIVEL_PAPEL && timeout--)
??EMBALAGEM_libera_pacote_3:
          CFI FunCall AA_mediaMovelPapel
        BL       AA_mediaMovelPapel
        MOVW     R1,#+3801
        CMP      R0,R1
        BLT.N    ??EMBALAGEM_libera_pacote_4
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        CMP      R0,#+0
        BEQ.N    ??EMBALAGEM_libera_pacote_4
//   97     vTaskDelay(1);
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??EMBALAGEM_libera_pacote_3
//   98   
//   99   BOARD_set_motor_embalagem(0);
??EMBALAGEM_libera_pacote_4:
        MOVS     R0,#+0
          CFI FunCall BOARD_set_motor_embalagem
        BL       BOARD_set_motor_embalagem
//  100   
//  101   if(AA_mediaMovelPapel()<THRESOLD_NIVEL_PAPEL)
          CFI FunCall AA_mediaMovelPapel
        BL       AA_mediaMovelPapel
        MOVW     R1,#+3800
        CMP      R0,R1
        BGE.N    ??EMBALAGEM_libera_pacote_5
//  102     return EMBALAGEM_LIBERADA;    
        MOVS     R0,#+0
        B.N      ??EMBALAGEM_libera_pacote_1
//  103     
//  104   return EMBALAGEM_FALHA_LIBERACAO;
??EMBALAGEM_libera_pacote_5:
        MOVS     R0,#+2
??EMBALAGEM_libera_pacote_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock0
//  105 }
//  106 /***********************************************************************************
//  107 *       Descrição       :       Verifica o estoque de embalagens
//  108 *       Parametros      :       nenhum
//  109 *       Retorno         :       (eEMBALAGEM_ESTOQUE_RESULT) resultado
//  110 *                               da verificação do estoque
//  111 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function EMBALAGEM_verifica_estoque
        THUMB
//  112 eEMBALAGEM_ESTOQUE_RESULT EMBALAGEM_verifica_estoque(void){
EMBALAGEM_verifica_estoque:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  113   
//  114   // Se não houver papel refletindo no sensor
//  115   // nem chega a ligar o motor do dispensador
//  116   if(AA_mediaMovelPapel()>THRESOLD_NIVEL_PAPEL){
          CFI FunCall AA_mediaMovelPapel
        BL       AA_mediaMovelPapel
        MOVW     R1,#+3801
        CMP      R0,R1
        BLT.N    ??EMBALAGEM_verifica_estoque_0
//  117     return EMBALAGEM_SEM_PACOTES; 
        MOVS     R0,#+0
        B.N      ??EMBALAGEM_verifica_estoque_1
//  118   }
//  119   
//  120   return EMBALAGEM_DETECTADA;
??EMBALAGEM_verifica_estoque_0:
        MOVS     R0,#+1
??EMBALAGEM_verifica_estoque_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock1
//  121 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  122 /***********************************************************************************
//  123 *       Fim do arquivo
//  124 ***********************************************************************************/
// 
// 128 bytes in section .text
// 
// 128 bytes of CODE memory
//
//Errors: none
//Warnings: none
