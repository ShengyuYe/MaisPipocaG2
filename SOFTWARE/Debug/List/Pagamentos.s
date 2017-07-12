///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     12/Jul/2017  11:47:25 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Pagamentos\Pagamentos.c         /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Pagamentos\Pagamentos.c -lC     /
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
//                    pocaG2\SOFTWARE\Debug\List\Pagamentos.s                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Pagamentos

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN BV20_get_valor_acumulador
        EXTERN BV20_setter_bloqueio
        EXTERN BV20_subtrai_valor_acumulado
        EXTERN PARAMETROS_grava
        EXTERN PARAMETROS_le
        EXTERN SMDBCOIN_set_flag_bloqueio
        EXTERN SMDBILL_set_bloqueio
        EXTERN SMDB_ini
        EXTERN SMDB_tick
        EXTERN vTaskDelay
        EXTERN xQueueCreate
        EXTERN xQueueGenericReceive
        EXTERN xQueueGenericSend

        PUBLIC PAGAMENTOS_adiciona_valores
        PUBLIC PAGAMENTOS_bloqueia_uca1
        PUBLIC PAGAMENTOS_bloqueio_p70
        PUBLIC PAGAMENTOS_filtro_p70
        PUBLIC PAGAMENTOS_filtro_uca
        PUBLIC PAGAMENTOS_get_contagem_p70
        PUBLIC PAGAMENTOS_get_contagem_uca1
        PUBLIC PAGAMENTOS_get_timeout_pagamento
        PUBLIC PAGAMENTOS_get_valor_acumulado
        PUBLIC PAGAMENTOS_ini
        PUBLIC PAGAMENTOS_irq_p70
        PUBLIC PAGAMENTOS_irq_uca_1
        PUBLIC PAGAMENTOS_main
        PUBLIC PAGAMENTOS_semaforo_pagamentos
        PUBLIC PAGAMENTOS_set_bloqueio
        PUBLIC PAGAMENTOS_set_inhibit_p70
        PUBLIC PAGAMENTOS_set_valores
        PUBLIC PAGAMENTOS_subtrai_contagem_p70
        PUBLIC PAGAMENTOS_subtrai_contagem_uca1
        PUBLIC PAGAMENTOS_subtrai_valores
        PUBLIC PAGAMENTOS_timeout_pagamento
        PUBLIC PAGAMENTOS_timer_tick
        PUBLIC PAGAMENTOS_valor_acumulado_geral
        PUBLIC PAGAMENTOS_valor_acumulado_p70
        PUBLIC PAGAMENTOS_valor_acumulado_uca
        PUBLIC _A_CLRPEND0
        PUBLIC _A_EXTINT
        PUBLIC _A_EXTMODE
        PUBLIC _A_EXTPOLAR
        PUBLIC _A_FIO1CLR
        PUBLIC _A_FIO1DIR
        PUBLIC _A_FIO1SET
        PUBLIC _A_PINSEL4
        PUBLIC _A_SETENA0
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\Pagamentos\Pagamentos.c
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
//   17 |       Arquivo            :  Pagamentos.c
//   18 |       Descrição          :  Biblioteca para controle dos meios de pagamento
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  22/02/2017
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
//   32 #include <nxp\iolpc1768.h>

        ASEGN `.noinit`:DATA:NOROOT,0e000e100H
        SECTION_GROUP _A_SETENA0
// __absolute union <unnamed> volatile _A_SETENA0
_A_SETENA0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0e000e280H
        SECTION_GROUP _A_CLRPEND0
// __absolute union <unnamed> volatile _A_CLRPEND0
_A_CLRPEND0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0400fc140H
        SECTION_GROUP _A_EXTINT
// __absolute union <unnamed> volatile _A_EXTINT
_A_EXTINT:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0400fc148H
        SECTION_GROUP _A_EXTMODE
// __absolute union <unnamed> volatile _A_EXTMODE
_A_EXTMODE:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0400fc14cH
        SECTION_GROUP _A_EXTPOLAR
// __absolute union <unnamed> volatile _A_EXTPOLAR
_A_EXTPOLAR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04002c010H
        SECTION_GROUP _A_PINSEL4
// __absolute union <unnamed> volatile _A_PINSEL4
_A_PINSEL4:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c020H
        SECTION_GROUP _A_FIO1DIR
// __absolute union <unnamed> volatile _A_FIO1DIR
_A_FIO1DIR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c038H
        SECTION_GROUP _A_FIO1SET
// __absolute union <unnamed> volatile _A_FIO1SET
_A_FIO1SET:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c03cH
        SECTION_GROUP _A_FIO1CLR
// __absolute union <unnamed> volatile _A_FIO1CLR
_A_FIO1CLR:
        DS8 4
//   33 #include <stdio.h>
//   34 #include <stdlib.h>
//   35 #include <string.h>
//   36 #include "..\..\includes.h"
//   37 #include "pagamentos.h"
//   38 #include "supervisao_mdb.h"
//   39 /***********************************************************************************
//   40 *       Definição
//   41 ***********************************************************************************/
//   42 #define INHIBIT_UCA1_PIN                        (0x01)<<24
//   43 #define INI_INHIBIT_UCA1()                      FIO1DIR|=INHIBIT_UCA1_PIN
//   44 #define SET_INHIBIT_UCA1(X)                     X?(FIO1SET|=INHIBIT_UCA1_PIN):(FIO1CLR|=INHIBIT_UCA1_PIN)
//   45 
//   46 #define INHIBIT_P70_PIN                         (0x01)<<25
//   47 #define INI_INHIBIT_P70()                       FIO1DIR|=INHIBIT_P70_PIN
//   48 #define SET_INHIBIT_P70(X)                      X?(FIO1SET|=INHIBIT_P70_PIN):(FIO1CLR|=INHIBIT_P70_PIN)
//   49 
//   50 #define RELOAD_FILTRO_UCA                       50
//   51 #define RELOAD_TIMEOUT_PAGAMENTO                60*1000
//   52 /***********************************************************************************
//   53 *       Variaveis - locais
//   54 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   55 unsigned short int PAGAMENTOS_valor_acumulado_uca=0;
PAGAMENTOS_valor_acumulado_uca:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   56 unsigned short int PAGAMENTOS_filtro_uca=0;
PAGAMENTOS_filtro_uca:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   57 unsigned short int PAGAMENTOS_valor_acumulado_p70=0;
PAGAMENTOS_valor_acumulado_p70:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   58 unsigned short int PAGAMENTOS_filtro_p70=0;
PAGAMENTOS_filtro_p70:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   59 unsigned int PAGAMENTOS_timeout_pagamento=0; 
PAGAMENTOS_timeout_pagamento:
        DS8 4
//   60 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   61 int PAGAMENTOS_valor_acumulado_geral=0;
PAGAMENTOS_valor_acumulado_geral:
        DS8 4
//   62 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   63 xSemaphoreHandle PAGAMENTOS_semaforo_pagamentos;
PAGAMENTOS_semaforo_pagamentos:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   64 unsigned PAGAMENTOS_bloqueio_p70=255;
PAGAMENTOS_bloqueio_p70:
        DATA
        DC32 255
//   65 
//   66 /***********************************************************************************
//   67 *       Funções - locais
//   68 ***********************************************************************************/
//   69 void PAGAMENTOS_irq_uca_1(void);
//   70 void PAGAMENTOS_irq_p70(void);
//   71 
//   72 /***********************************************************************************
//   73 *       Implementação das funções
//   74 ***********************************************************************************/
//   75 
//   76 /***********************************************************************************
//   77 *       Descrição       :       Inicializa o módulo
//   78 *       Parametros      :       nenhum
//   79 *       Retorno         :       nenhum
//   80 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function PAGAMENTOS_ini
        THUMB
//   81 void PAGAMENTOS_ini(void){
PAGAMENTOS_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   82   
//   83   INI_INHIBIT_UCA1();
        LDR.W    R0,??DataTable15  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable15  ;; 0x2009c020
        STR      R0,[R1, #+0]
//   84   INI_INHIBIT_P70();
        LDR.W    R0,??DataTable15  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable15  ;; 0x2009c020
        STR      R0,[R1, #+0]
//   85   
//   86   PINSEL4_bit.P2_12 = 1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable15_1  ;; 0x4002c010
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+24,#+2
        LDR.W    R0,??DataTable15_1  ;; 0x4002c010
        STR      R1,[R0, #+0]
//   87   EXTMODE_bit.EXTMODE2 = 1;
        LDR.W    R0,??DataTable15_2  ;; 0x400fc148
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable15_2  ;; 0x400fc148
        STR      R0,[R1, #+0]
//   88   EXTPOLAR_bit.EXTPOLAR2 = 1;    
        LDR.W    R0,??DataTable15_3  ;; 0x400fc14c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable15_3  ;; 0x400fc14c
        STR      R0,[R1, #+0]
//   89   SETENA0_bit.SETENA20 = 1;   
        LDR.W    R0,??DataTable15_4  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100000
        LDR.W    R1,??DataTable15_4  ;; 0xe000e100
        STR      R0,[R1, #+0]
//   90   
//   91   PINSEL4_bit.P2_13 = 1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable15_1  ;; 0x4002c010
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+26,#+2
        LDR.W    R0,??DataTable15_1  ;; 0x4002c010
        STR      R1,[R0, #+0]
//   92   EXTMODE_bit.EXTMODE3 = 1;
        LDR.W    R0,??DataTable15_2  ;; 0x400fc148
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable15_2  ;; 0x400fc148
        STR      R0,[R1, #+0]
//   93   EXTPOLAR_bit.EXTPOLAR3 = 1;    
        LDR.W    R0,??DataTable15_3  ;; 0x400fc14c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable15_3  ;; 0x400fc14c
        STR      R0,[R1, #+0]
//   94   SETENA0_bit.SETENA21 = 1;    
        LDR.W    R0,??DataTable15_4  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200000
        LDR.W    R1,??DataTable15_4  ;; 0xe000e100
        STR      R0,[R1, #+0]
//   95   
//   96   SET_INHIBIT_UCA1(1);
        LDR.W    R0,??DataTable15_5  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable15_5  ;; 0x2009c038
        STR      R0,[R1, #+0]
//   97   SET_INHIBIT_P70(1);
        LDR.W    R0,??DataTable15_5  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable15_5  ;; 0x2009c038
        STR      R0,[R1, #+0]
//   98   vSemaphoreCreateBinary(PAGAMENTOS_semaforo_pagamentos);
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall xQueueCreate
        BL       xQueueCreate
        LDR.N    R1,??DataTable15_6
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_ini_0
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//   99 }
??PAGAMENTOS_ini_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_FIO1DIR
        REQUIRE _A_PINSEL4
        REQUIRE _A_EXTMODE
        REQUIRE _A_EXTPOLAR
        REQUIRE _A_SETENA0
        REQUIRE _A_FIO1SET
//  100 /***********************************************************************************
//  101 *       Descrição       :       Tick de timer para o módulo pagamentos
//  102 *       Parametros      :       nenhum
//  103 *       Retorno         :       nenhum
//  104 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PAGAMENTOS_timer_tick
          CFI NoCalls
        THUMB
//  105 void PAGAMENTOS_timer_tick(void){
//  106   
//  107   if(PAGAMENTOS_filtro_uca)
PAGAMENTOS_timer_tick:
        LDR.N    R0,??DataTable15_7
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_timer_tick_0
//  108     PAGAMENTOS_filtro_uca--;
        LDR.N    R0,??DataTable15_7
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable15_7
        STRH     R0,[R1, #+0]
//  109   
//  110   if(PAGAMENTOS_filtro_p70)
??PAGAMENTOS_timer_tick_0:
        LDR.N    R0,??DataTable15_8
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_timer_tick_1
//  111     PAGAMENTOS_filtro_p70--;
        LDR.N    R0,??DataTable15_8
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable15_8
        STRH     R0,[R1, #+0]
//  112 }
??PAGAMENTOS_timer_tick_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  113 /***********************************************************************************
//  114 *       Descrição       :       Função principal do módulo
//  115 *       Parametros      :       nenhum
//  116 *       Retorno         :       nenhum
//  117 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PAGAMENTOS_main
        THUMB
//  118 void PAGAMENTOS_main(void*pPar){
PAGAMENTOS_main:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  119   unsigned int acumulado;
//  120   
//  121   SMDB_ini();  
          CFI FunCall SMDB_ini
        BL       SMDB_ini
//  122   vTaskDelay(3000);
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  123   
//  124   for(;;){    
//  125     
//  126     SMDB_tick();    
??PAGAMENTOS_main_0:
          CFI FunCall SMDB_tick
        BL       SMDB_tick
//  127     acumulado = BV20_get_valor_acumulador();
          CFI FunCall BV20_get_valor_acumulador
        BL       BV20_get_valor_acumulador
        MOVS     R4,R0
//  128     if(acumulado){
        CMP      R4,#+0
        BEQ.N    ??PAGAMENTOS_main_1
//  129       PAGAMENTOS_adiciona_valores(acumulado*100);
        MOVS     R0,#+100
        MUL      R0,R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_adiciona_valores
        BL       PAGAMENTOS_adiciona_valores
//  130       BV20_subtrai_valor_acumulado(acumulado);
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall BV20_subtrai_valor_acumulado
        BL       BV20_subtrai_valor_acumulado
//  131     }
//  132         
//  133     vTaskDelay(10);
??PAGAMENTOS_main_1:
        MOVS     R0,#+10
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??PAGAMENTOS_main_0
          CFI EndBlock cfiBlock2
//  134   }  
//  135 }
//  136 /***********************************************************************************
//  137 *       Descrição       :       Irq para o moedeiro UCA1
//  138 *       Parametros      :       nenhum
//  139 *       Retorno         :       nenhum
//  140 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PAGAMENTOS_irq_uca_1
          CFI NoCalls
        THUMB
//  141 void PAGAMENTOS_irq_uca_1(void){
//  142   
//  143   // Timer para gerar um
//  144   // filtro de limita a frequência máxima
//  145   // dos pulsos
//  146   if(!PAGAMENTOS_filtro_uca){
PAGAMENTOS_irq_uca_1:
        LDR.N    R0,??DataTable15_7
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PAGAMENTOS_irq_uca_1_0
//  147     
//  148     PAGAMENTOS_valor_acumulado_uca+=25;  
        LDR.N    R0,??DataTable15_9
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+25
        LDR.N    R1,??DataTable15_9
        STRH     R0,[R1, #+0]
//  149     PAGAMENTOS_filtro_uca = RELOAD_FILTRO_UCA;
        LDR.N    R0,??DataTable15_7
        MOVS     R1,#+50
        STRH     R1,[R0, #+0]
//  150   }
//  151   
//  152   EXTINT_bit.EINT2 = 1;
??PAGAMENTOS_irq_uca_1_0:
        LDR.N    R0,??DataTable15_10  ;; 0x400fc140
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable15_10  ;; 0x400fc140
        STR      R0,[R1, #+0]
//  153   CLRPEND0_bit.CLRPEND20 = 1;  
        LDR.N    R0,??DataTable15_11  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100000
        LDR.N    R1,??DataTable15_11  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  154 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
        REQUIRE _A_EXTINT
        REQUIRE _A_CLRPEND0
//  155 /***********************************************************************************
//  156 *       Descrição       :       Valor acumulado no totalizado do UCA1
//  157 *       Parametros      :       nenhum
//  158 *       Retorno         :       nenhum
//  159 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PAGAMENTOS_get_contagem_uca1
          CFI NoCalls
        THUMB
//  160 unsigned short int PAGAMENTOS_get_contagem_uca1(void){
//  161   
//  162   return PAGAMENTOS_valor_acumulado_uca;
PAGAMENTOS_get_contagem_uca1:
        LDR.N    R0,??DataTable15_9
        LDRH     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  163 }
//  164 /***********************************************************************************
//  165 *       Descrição       :       Subtraí um valor do acumulado no UCA1
//  166 *       Parametros      :       (unsigned short int) valor que será
//  167 *                                                    subtraido
//  168 *       Retorno         :       nenhum
//  169 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function PAGAMENTOS_subtrai_contagem_uca1
          CFI NoCalls
        THUMB
//  170 void PAGAMENTOS_subtrai_contagem_uca1(unsigned short int contagem){
//  171   
//  172   if(contagem>=PAGAMENTOS_valor_acumulado_uca)
PAGAMENTOS_subtrai_contagem_uca1:
        LDR.N    R1,??DataTable15_9
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BCC.N    ??PAGAMENTOS_subtrai_contagem_uca1_0
//  173     PAGAMENTOS_valor_acumulado_uca-=contagem;
        LDR.N    R1,??DataTable15_9
        LDRH     R1,[R1, #+0]
        SUBS     R0,R1,R0
        LDR.N    R1,??DataTable15_9
        STRH     R0,[R1, #+0]
        B.N      ??PAGAMENTOS_subtrai_contagem_uca1_1
//  174   else
//  175     PAGAMENTOS_valor_acumulado_uca = 0;
??PAGAMENTOS_subtrai_contagem_uca1_0:
        LDR.N    R0,??DataTable15_9
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  176 }
??PAGAMENTOS_subtrai_contagem_uca1_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  177 /***********************************************************************************
//  178 *       Descrição       :       Liga o bloqueio do UCA1
//  179 *       Parametros      :       (unsigned char) flag 
//  180 *       Retorno         :       nenhum
//  181 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function PAGAMENTOS_bloqueia_uca1
          CFI NoCalls
        THUMB
//  182 void PAGAMENTOS_bloqueia_uca1(unsigned char flag){
//  183   
//  184   SET_INHIBIT_UCA1(flag);
PAGAMENTOS_bloqueia_uca1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_bloqueia_uca1_0
        LDR.N    R0,??DataTable15_5  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable15_5  ;; 0x2009c038
        STR      R0,[R1, #+0]
        B.N      ??PAGAMENTOS_bloqueia_uca1_1
??PAGAMENTOS_bloqueia_uca1_0:
        LDR.N    R0,??DataTable15_12  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable15_12  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  185 }
??PAGAMENTOS_bloqueia_uca1_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO1CLR
//  186 /***********************************************************************************
//  187 *       Descrição       :       IRQ do noteiro P70
//  188 *       Parametros      :       nenhum
//  189 *       Retorno         :       nenhum
//  190 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function PAGAMENTOS_irq_p70
          CFI NoCalls
        THUMB
//  191 void PAGAMENTOS_irq_p70(void){
//  192   
//  193   if(!PAGAMENTOS_bloqueio_p70 && !PAGAMENTOS_filtro_p70){
PAGAMENTOS_irq_p70:
        LDR.N    R0,??DataTable15_13
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PAGAMENTOS_irq_p70_0
        LDR.N    R0,??DataTable15_8
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PAGAMENTOS_irq_p70_0
//  194     PAGAMENTOS_valor_acumulado_p70+=100;
        LDR.N    R0,??DataTable15_14
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+100
        LDR.N    R1,??DataTable15_14
        STRH     R0,[R1, #+0]
//  195     PAGAMENTOS_filtro_p70 = RELOAD_FILTRO_UCA;
        LDR.N    R0,??DataTable15_8
        MOVS     R1,#+50
        STRH     R1,[R0, #+0]
//  196   }  
//  197   
//  198   EXTINT_bit.EINT3 = 1;
??PAGAMENTOS_irq_p70_0:
        LDR.N    R0,??DataTable15_10  ;; 0x400fc140
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable15_10  ;; 0x400fc140
        STR      R0,[R1, #+0]
//  199   CLRPEND0_bit.CLRPEND21 = 1;  
        LDR.N    R0,??DataTable15_11  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200000
        LDR.N    R1,??DataTable15_11  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  200 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
        REQUIRE _A_EXTINT
        REQUIRE _A_CLRPEND0
//  201 /***********************************************************************************
//  202 *       Descrição       :       Setter para o inhibit do noteiro P70
//  203 *       Parametros      :       (unsigned char) inhibit
//  204 *       Retorno         :       nenhum
//  205 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function PAGAMENTOS_set_inhibit_p70
          CFI NoCalls
        THUMB
//  206 void PAGAMENTOS_set_inhibit_p70(unsigned char flag){
//  207   
//  208   SET_INHIBIT_P70(flag);
PAGAMENTOS_set_inhibit_p70:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_set_inhibit_p70_0
        LDR.N    R0,??DataTable15_5  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable15_5  ;; 0x2009c038
        STR      R0,[R1, #+0]
        B.N      ??PAGAMENTOS_set_inhibit_p70_1
??PAGAMENTOS_set_inhibit_p70_0:
        LDR.N    R0,??DataTable15_12  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable15_12  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  209 }
??PAGAMENTOS_set_inhibit_p70_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO1CLR
//  210 /***********************************************************************************
//  211 *       Descrição       :       Getter para a contagem do P70
//  212 *       Parametros      :       nenhum
//  213 *       Retorno         :       (unsigned short int) contagem do acumulador
//  214 *                               de valores do P70
//  215 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function PAGAMENTOS_get_contagem_p70
          CFI NoCalls
        THUMB
//  216 unsigned short int PAGAMENTOS_get_contagem_p70(void){
//  217   
//  218   return PAGAMENTOS_valor_acumulado_p70;
PAGAMENTOS_get_contagem_p70:
        LDR.N    R0,??DataTable15_14
        LDRH     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  219 }
//  220 /***********************************************************************************
//  221 *       Descrição       :       Subtrai um valor da contagem do P70
//  222 *       Parametros      :       (unsigned short int) valor
//  223 *       Retorno         :       nenhum
//  224 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function PAGAMENTOS_subtrai_contagem_p70
          CFI NoCalls
        THUMB
//  225 void PAGAMENTOS_subtrai_contagem_p70(unsigned short int contagem){
//  226   
//  227   if(contagem>PAGAMENTOS_valor_acumulado_p70)
PAGAMENTOS_subtrai_contagem_p70:
        LDR.N    R1,??DataTable15_14
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BCS.N    ??PAGAMENTOS_subtrai_contagem_p70_0
//  228     PAGAMENTOS_valor_acumulado_p70 -= contagem;
        LDR.N    R1,??DataTable15_14
        LDRH     R1,[R1, #+0]
        SUBS     R0,R1,R0
        LDR.N    R1,??DataTable15_14
        STRH     R0,[R1, #+0]
        B.N      ??PAGAMENTOS_subtrai_contagem_p70_1
//  229   else
//  230     PAGAMENTOS_valor_acumulado_p70 = 0;    
??PAGAMENTOS_subtrai_contagem_p70_0:
        LDR.N    R0,??DataTable15_14
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  231 }
??PAGAMENTOS_subtrai_contagem_p70_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  232 /***********************************************************************************
//  233 *       Descrição       :       Adiciona valores ao acumulador de dinheiro
//  234 *       Parametros      :       (unsigned short int) valor
//  235 *       Retorno         :       nenhum
//  236 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function PAGAMENTOS_adiciona_valores
        THUMB
//  237 void PAGAMENTOS_adiciona_valores(unsigned short int valor){
PAGAMENTOS_adiciona_valores:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  238   
//  239    while(!xSemaphoreTake(PAGAMENTOS_semaforo_pagamentos,portTICK_RATE_MS*1));     
??PAGAMENTOS_adiciona_valores_0:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_adiciona_valores_0
//  240    
//  241    PAGAMENTOS_valor_acumulado_geral+=valor;
        LDR.N    R0,??DataTable15_15
        LDR      R0,[R0, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ADDS     R0,R4,R0
        LDR.N    R1,??DataTable15_15
        STR      R0,[R1, #+0]
//  242    PAGAMENTOS_timeout_pagamento = RELOAD_TIMEOUT_PAGAMENTO;
        LDR.N    R0,??DataTable15_16
        MOVW     R1,#+60000
        STR      R1,[R0, #+0]
//  243    
//  244    xSemaphoreGive(PAGAMENTOS_semaforo_pagamentos);   
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  245 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock11
//  246 /***********************************************************************************
//  247 *       Descrição       :       Getter para o acumulador de dinheiro
//  248 *       Parametros      :       (nenhum)
//  249 *       Retorno         :       (int) valor acumulado em moeda
//  250 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function PAGAMENTOS_get_valor_acumulado
        THUMB
//  251 int PAGAMENTOS_get_valor_acumulado(void){
PAGAMENTOS_get_valor_acumulado:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+12
          CFI CFA R13+24
//  252    int valor;
//  253    
//  254    while(!xSemaphoreTake(PAGAMENTOS_semaforo_pagamentos,portTICK_RATE_MS*1));     
??PAGAMENTOS_get_valor_acumulado_0:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_get_valor_acumulado_0
//  255    
//  256    //Hoock para ler o UCA1
//  257    if(PAGAMENTOS_valor_acumulado_p70){
        LDR.N    R0,??DataTable15_14
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_get_valor_acumulado_1
//  258      
//  259      unsigned int fat_cartao_par;     
//  260      unsigned int fat_cartao_tot;
//  261      unsigned int temp = PAGAMENTOS_valor_acumulado_p70;
        LDR.N    R0,??DataTable15_14
        LDRH     R5,[R0, #+0]
//  262      
//  263      PARAMETROS_le(ADR_CARTAO_PARCIAL,(void*)&fat_cartao_par);
        ADD      R1,SP,#+4
        MOVS     R0,#+14
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  264      PARAMETROS_le(ADR_CARTAO_TOTAL,(void*)&fat_cartao_tot);
        ADD      R1,SP,#+0
        MOVS     R0,#+15
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  265      
//  266      fat_cartao_par+=temp;
        LDR      R0,[SP, #+4]
        ADDS     R0,R5,R0
        STR      R0,[SP, #+4]
//  267      fat_cartao_tot+=temp;
        LDR      R0,[SP, #+0]
        ADDS     R0,R5,R0
        STR      R0,[SP, #+0]
//  268      
//  269      PARAMETROS_grava(ADR_CARTAO_PARCIAL,(void*)&fat_cartao_par);
        ADD      R1,SP,#+4
        MOVS     R0,#+14
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  270      PARAMETROS_grava(ADR_CARTAO_TOTAL,(void*)&fat_cartao_tot);
        ADD      R1,SP,#+0
        MOVS     R0,#+15
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  271      
//  272      valor+= PAGAMENTOS_valor_acumulado_p70;   
        LDR.N    R0,??DataTable15_14
        LDRH     R0,[R0, #+0]
        ADDS     R4,R0,R4
//  273      PAGAMENTOS_valor_acumulado_geral+=temp;
        LDR.N    R0,??DataTable15_15
        LDR      R0,[R0, #+0]
        ADDS     R0,R5,R0
        LDR.N    R1,??DataTable15_15
        STR      R0,[R1, #+0]
//  274      PAGAMENTOS_valor_acumulado_p70 -= temp; // É concorrente!
        LDR.N    R0,??DataTable15_14
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,R5
        LDR.N    R1,??DataTable15_14
        STRH     R0,[R1, #+0]
//  275    }
//  276    
//  277    valor = PAGAMENTOS_valor_acumulado_geral;   
??PAGAMENTOS_get_valor_acumulado_1:
        LDR.N    R0,??DataTable15_15
        LDR      R4,[R0, #+0]
//  278    valor+= PAGAMENTOS_valor_acumulado_uca;   
        LDR.N    R0,??DataTable15_9
        LDRH     R0,[R0, #+0]
        ADDS     R4,R0,R4
//  279    PAGAMENTOS_valor_acumulado_uca = 0;   
        LDR.N    R0,??DataTable15_9
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  280    
//  281    xSemaphoreGive(PAGAMENTOS_semaforo_pagamentos);     
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  282    
//  283    return valor;  
        MOVS     R0,R4
        POP      {R1-R5,PC}       ;; return
          CFI EndBlock cfiBlock12
//  284 }
//  285 /***********************************************************************************
//  286 *       Descrição       :       Subtrai valores do acumulador de moeda
//  287 *       Parametros      :       (usigned int) valor
//  288 *       Retorno         :       nenhum
//  289 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function PAGAMENTOS_subtrai_valores
        THUMB
//  290 void PAGAMENTOS_subtrai_valores(unsigned int valor){
PAGAMENTOS_subtrai_valores:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  291   
//  292    while(!xSemaphoreTake(PAGAMENTOS_semaforo_pagamentos,portTICK_RATE_MS*1));     
??PAGAMENTOS_subtrai_valores_0:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_subtrai_valores_0
//  293    
//  294    if(PAGAMENTOS_valor_acumulado_geral>=valor)
        LDR.N    R0,??DataTable15_15
        LDR      R0,[R0, #+0]
        CMP      R0,R4
        BCC.N    ??PAGAMENTOS_subtrai_valores_1
//  295      PAGAMENTOS_valor_acumulado_geral-=valor;
        LDR.N    R0,??DataTable15_15
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,R4
        LDR.N    R1,??DataTable15_15
        STR      R0,[R1, #+0]
        B.N      ??PAGAMENTOS_subtrai_valores_2
//  296    else
//  297      PAGAMENTOS_valor_acumulado_geral = 0;
??PAGAMENTOS_subtrai_valores_1:
        LDR.N    R0,??DataTable15_15
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  298    
//  299    if(PAGAMENTOS_valor_acumulado_geral<0)
??PAGAMENTOS_subtrai_valores_2:
        LDR.N    R0,??DataTable15_15
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PAGAMENTOS_subtrai_valores_3
//  300      PAGAMENTOS_valor_acumulado_geral = 0;
        LDR.N    R0,??DataTable15_15
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  301    
//  302    xSemaphoreGive(PAGAMENTOS_semaforo_pagamentos);      
??PAGAMENTOS_subtrai_valores_3:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  303 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock13
//  304 /***********************************************************************************
//  305 *       Descrição       :       Setter para o acumulador de dinheiro
//  306 *       Parametros      :       (int valor)
//  307 *       Retorno         :       nenhum
//  308 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function PAGAMENTOS_set_valores
        THUMB
//  309 void PAGAMENTOS_set_valores(int valor){
PAGAMENTOS_set_valores:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  310   
//  311    while(!xSemaphoreTake(PAGAMENTOS_semaforo_pagamentos,portTICK_RATE_MS*1));     
??PAGAMENTOS_set_valores_0:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_set_valores_0
//  312    
//  313    PAGAMENTOS_valor_acumulado_geral = valor;
        LDR.N    R0,??DataTable15_15
        STR      R4,[R0, #+0]
//  314    
//  315    xSemaphoreGive(PAGAMENTOS_semaforo_pagamentos);   
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  316 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock14
//  317 /***********************************************************************************
//  318 *       Descrição       :       Setter para o bloqueio dos meios de 
//  319 *                               pagamento
//  320 *       Parametros      :       (unsigned char) maior do que zero indica
//  321 *                               que os meios de pagamento serão bloqueados
//  322 *       Retorno         :       nenhum
//  323 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function PAGAMENTOS_set_bloqueio
        THUMB
//  324 void PAGAMENTOS_set_bloqueio(unsigned char flag){
PAGAMENTOS_set_bloqueio:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  325   
//  326   PAGAMENTOS_bloqueio_p70 = flag;
        LDR.N    R0,??DataTable15_13
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R4,[R0, #+0]
//  327   PAGAMENTOS_bloqueia_uca1(flag);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PAGAMENTOS_bloqueia_uca1
        BL       PAGAMENTOS_bloqueia_uca1
//  328   PAGAMENTOS_set_inhibit_p70(flag);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PAGAMENTOS_set_inhibit_p70
        BL       PAGAMENTOS_set_inhibit_p70
//  329   SMDBILL_set_bloqueio(flag);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
          CFI FunCall SMDBILL_set_bloqueio
        BL       SMDBILL_set_bloqueio
//  330   SMDBCOIN_set_flag_bloqueio(flag);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
          CFI FunCall SMDBCOIN_set_flag_bloqueio
        BL       SMDBCOIN_set_flag_bloqueio
//  331   BV20_setter_bloqueio(flag);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall BV20_setter_bloqueio
        BL       BV20_setter_bloqueio
//  332 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock15
//  333 /***********************************************************************************
//  334 *       Descrição       :       Getter para o contador que indica que
//  335 *                               não há interação com o meio de pagamento
//  336 *       Parametros      :       nenhum
//  337 *       Retorno         :       (unsigned int) contagem do contador
//  338 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function PAGAMENTOS_get_timeout_pagamento
          CFI NoCalls
        THUMB
//  339 unsigned int PAGAMENTOS_get_timeout_pagamento(void){
//  340   
//  341   return PAGAMENTOS_timeout_pagamento;
PAGAMENTOS_get_timeout_pagamento:
        LDR.N    R0,??DataTable15_16
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock16
//  342 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     0x2009c020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_1:
        DC32     0x4002c010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_2:
        DC32     0x400fc148

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_3:
        DC32     0x400fc14c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_4:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_5:
        DC32     0x2009c038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_6:
        DC32     PAGAMENTOS_semaforo_pagamentos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_7:
        DC32     PAGAMENTOS_filtro_uca

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_8:
        DC32     PAGAMENTOS_filtro_p70

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_9:
        DC32     PAGAMENTOS_valor_acumulado_uca

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_10:
        DC32     0x400fc140

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_11:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_12:
        DC32     0x2009c03c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_13:
        DC32     PAGAMENTOS_bloqueio_p70

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_14:
        DC32     PAGAMENTOS_valor_acumulado_p70

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_15:
        DC32     PAGAMENTOS_valor_acumulado_geral

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_16:
        DC32     PAGAMENTOS_timeout_pagamento

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  343 /***********************************************************************************
//  344 *       Fim do arquivo
//  345 ***********************************************************************************/
// 
//    20 bytes in section .bss
//     4 bytes in section .data
//    36 bytes in section .noinit (abs)
// 1 016 bytes in section .text
// 
// 1 016 bytes of CODE memory
//    24 bytes of DATA memory (+ 36 bytes shared)
//
//Errors: none
//Warnings: 3
