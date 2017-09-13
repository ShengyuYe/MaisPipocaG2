///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     13/Sep/2017  18:10:12 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamento /
//                    s\Pagamentos.c                                          /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamento /
//                    s\Pagamentos.c -lC C:\repositorios\MaisPipocaG2\SOFTWAR /
//                    E\Debug\List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE /
//                    \Debug\List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\D /
//                    ebug\Obj\ --no_cse --no_unroll --no_inline              /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\Pagame /
//                    ntos.s                                                  /
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
        PUBLIC PAGAMENTOS_incremento_p70
        PUBLIC PAGAMENTOS_incremento_uca
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamentos\Pagamentos.c
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

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   60 unsigned int PAGAMENTOS_incremento_uca;
PAGAMENTOS_incremento_uca:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   61 unsigned int PAGAMENTOS_incremento_p70;
PAGAMENTOS_incremento_p70:
        DS8 4
//   62 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   63 int PAGAMENTOS_valor_acumulado_geral=0;
PAGAMENTOS_valor_acumulado_geral:
        DS8 4
//   64 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   65 xSemaphoreHandle PAGAMENTOS_semaforo_pagamentos;
PAGAMENTOS_semaforo_pagamentos:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   66 unsigned PAGAMENTOS_bloqueio_p70=255;
PAGAMENTOS_bloqueio_p70:
        DATA
        DC32 255
//   67 
//   68 /***********************************************************************************
//   69 *       Funções - locais
//   70 ***********************************************************************************/
//   71 void PAGAMENTOS_irq_uca_1(void);
//   72 void PAGAMENTOS_irq_p70(void);
//   73 
//   74 /***********************************************************************************
//   75 *       Implementação das funções
//   76 ***********************************************************************************/
//   77 
//   78 /***********************************************************************************
//   79 *       Descrição       :       Inicializa o módulo
//   80 *       Parametros      :       nenhum
//   81 *       Retorno         :       nenhum
//   82 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function PAGAMENTOS_ini
        THUMB
//   83 void PAGAMENTOS_ini(void){
PAGAMENTOS_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   84   
//   85   INI_INHIBIT_UCA1();
        LDR.W    R0,??DataTable15  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable15  ;; 0x2009c020
        STR      R0,[R1, #+0]
//   86   INI_INHIBIT_P70();
        LDR.W    R0,??DataTable15  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable15  ;; 0x2009c020
        STR      R0,[R1, #+0]
//   87   
//   88   PINSEL4_bit.P2_12 = 1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable15_1  ;; 0x4002c010
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+24,#+2
        LDR.W    R0,??DataTable15_1  ;; 0x4002c010
        STR      R1,[R0, #+0]
//   89   EXTMODE_bit.EXTMODE2 = 1;
        LDR.W    R0,??DataTable15_2  ;; 0x400fc148
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable15_2  ;; 0x400fc148
        STR      R0,[R1, #+0]
//   90   EXTPOLAR_bit.EXTPOLAR2 = 1;    
        LDR.W    R0,??DataTable15_3  ;; 0x400fc14c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable15_3  ;; 0x400fc14c
        STR      R0,[R1, #+0]
//   91   SETENA0_bit.SETENA20 = 1;   
        LDR.W    R0,??DataTable15_4  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100000
        LDR.W    R1,??DataTable15_4  ;; 0xe000e100
        STR      R0,[R1, #+0]
//   92   
//   93   PINSEL4_bit.P2_13 = 1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable15_1  ;; 0x4002c010
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+26,#+2
        LDR.W    R0,??DataTable15_1  ;; 0x4002c010
        STR      R1,[R0, #+0]
//   94   EXTMODE_bit.EXTMODE3 = 1;
        LDR.W    R0,??DataTable15_2  ;; 0x400fc148
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable15_2  ;; 0x400fc148
        STR      R0,[R1, #+0]
//   95   EXTPOLAR_bit.EXTPOLAR3 = 1;    
        LDR.W    R0,??DataTable15_3  ;; 0x400fc14c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable15_3  ;; 0x400fc14c
        STR      R0,[R1, #+0]
//   96   SETENA0_bit.SETENA21 = 1;    
        LDR.W    R0,??DataTable15_4  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200000
        LDR.W    R1,??DataTable15_4  ;; 0xe000e100
        STR      R0,[R1, #+0]
//   97   
//   98   SET_INHIBIT_UCA1(1);
        LDR.W    R0,??DataTable15_5  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable15_5  ;; 0x2009c038
        STR      R0,[R1, #+0]
//   99   SET_INHIBIT_P70(1);
        LDR.W    R0,??DataTable15_5  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable15_5  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  100   vSemaphoreCreateBinary(PAGAMENTOS_semaforo_pagamentos);
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall xQueueCreate
        BL       xQueueCreate
        LDR.W    R1,??DataTable15_6
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_ini_0
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.W    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  101   
//  102   PARAMETROS_le(ADR_VALOR_PULSO_MOEDEIRO,(void*)&PAGAMENTOS_incremento_uca);
??PAGAMENTOS_ini_0:
        LDR.W    R1,??DataTable15_7
        MOVS     R0,#+8
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  103   PARAMETROS_le(ADR_VALOR_PULSO_NOTEIRO,(void*)&PAGAMENTOS_incremento_p70);
        LDR.W    R1,??DataTable15_8
        MOVS     R0,#+9
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  104 
//  105   if(PAGAMENTOS_incremento_uca>1000)
        LDR.W    R0,??DataTable15_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BLS.N    ??PAGAMENTOS_ini_1
//  106     PAGAMENTOS_incremento_uca=1000;
        LDR.W    R0,??DataTable15_7
        MOV      R1,#+1000
        STR      R1,[R0, #+0]
//  107   
//  108   if(PAGAMENTOS_incremento_p70>100000)
??PAGAMENTOS_ini_1:
        LDR.N    R0,??DataTable15_8
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable15_9  ;; 0x186a1
        CMP      R0,R1
        BCC.N    ??PAGAMENTOS_ini_2
//  109   PAGAMENTOS_incremento_p70=100000;
        LDR.N    R0,??DataTable15_8
        LDR.N    R1,??DataTable15_10  ;; 0x186a0
        STR      R1,[R0, #+0]
//  110    
//  111 }
??PAGAMENTOS_ini_2:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_FIO1DIR
        REQUIRE _A_PINSEL4
        REQUIRE _A_EXTMODE
        REQUIRE _A_EXTPOLAR
        REQUIRE _A_SETENA0
        REQUIRE _A_FIO1SET
//  112 /***********************************************************************************
//  113 *       Descrição       :       Tick de timer para o módulo pagamentos
//  114 *       Parametros      :       nenhum
//  115 *       Retorno         :       nenhum
//  116 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PAGAMENTOS_timer_tick
          CFI NoCalls
        THUMB
//  117 void PAGAMENTOS_timer_tick(void){
//  118   
//  119   if(PAGAMENTOS_filtro_uca)
PAGAMENTOS_timer_tick:
        LDR.N    R0,??DataTable15_11
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_timer_tick_0
//  120     PAGAMENTOS_filtro_uca--;
        LDR.N    R0,??DataTable15_11
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable15_11
        STRH     R0,[R1, #+0]
//  121   
//  122   if(PAGAMENTOS_filtro_p70)
??PAGAMENTOS_timer_tick_0:
        LDR.N    R0,??DataTable15_12
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_timer_tick_1
//  123     PAGAMENTOS_filtro_p70--;
        LDR.N    R0,??DataTable15_12
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable15_12
        STRH     R0,[R1, #+0]
//  124 }
??PAGAMENTOS_timer_tick_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  125 /***********************************************************************************
//  126 *       Descrição       :       Função principal do módulo
//  127 *       Parametros      :       nenhum
//  128 *       Retorno         :       nenhum
//  129 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PAGAMENTOS_main
        THUMB
//  130 void PAGAMENTOS_main(void*pPar){
PAGAMENTOS_main:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  131   unsigned int acumulado;
//  132   
//  133   SMDB_ini();  
          CFI FunCall SMDB_ini
        BL       SMDB_ini
//  134   vTaskDelay(3000);
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  135   
//  136   for(;;){    
//  137     
//  138     SMDB_tick();    
??PAGAMENTOS_main_0:
          CFI FunCall SMDB_tick
        BL       SMDB_tick
//  139     acumulado = BV20_get_valor_acumulador();
          CFI FunCall BV20_get_valor_acumulador
        BL       BV20_get_valor_acumulador
        MOVS     R5,R0
//  140     if(acumulado){
        CMP      R5,#+0
        BEQ.N    ??PAGAMENTOS_main_1
//  141       PAGAMENTOS_adiciona_valores(acumulado*100);
        MOVS     R0,#+100
        MUL      R0,R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_adiciona_valores
        BL       PAGAMENTOS_adiciona_valores
//  142       BV20_subtrai_valor_acumulado(acumulado);
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall BV20_subtrai_valor_acumulado
        BL       BV20_subtrai_valor_acumulado
//  143     }
//  144         
//  145     vTaskDelay(10);
??PAGAMENTOS_main_1:
        MOVS     R0,#+10
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??PAGAMENTOS_main_0
          CFI EndBlock cfiBlock2
//  146   }  
//  147 }
//  148 /***********************************************************************************
//  149 *       Descrição       :       Irq para o moedeiro UCA1
//  150 *       Parametros      :       nenhum
//  151 *       Retorno         :       nenhum
//  152 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PAGAMENTOS_irq_uca_1
          CFI NoCalls
        THUMB
//  153 void PAGAMENTOS_irq_uca_1(void){
//  154   
//  155   // Timer para gerar um
//  156   // filtro de limita a frequência máxima
//  157   // dos pulsos
//  158   if(!PAGAMENTOS_filtro_uca){
PAGAMENTOS_irq_uca_1:
        LDR.N    R0,??DataTable15_11
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PAGAMENTOS_irq_uca_1_0
//  159     
//  160     PAGAMENTOS_valor_acumulado_uca+=PAGAMENTOS_incremento_uca;  
        LDR.N    R0,??DataTable15_13
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable15_7
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable15_13
        STRH     R0,[R1, #+0]
//  161     PAGAMENTOS_filtro_uca = RELOAD_FILTRO_UCA;
        LDR.N    R0,??DataTable15_11
        MOVS     R1,#+50
        STRH     R1,[R0, #+0]
//  162   }
//  163   
//  164   EXTINT_bit.EINT2 = 1;
??PAGAMENTOS_irq_uca_1_0:
        LDR.N    R0,??DataTable15_14  ;; 0x400fc140
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable15_14  ;; 0x400fc140
        STR      R0,[R1, #+0]
//  165   CLRPEND0_bit.CLRPEND20 = 1;  
        LDR.N    R0,??DataTable15_15  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100000
        LDR.N    R1,??DataTable15_15  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  166 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
        REQUIRE _A_EXTINT
        REQUIRE _A_CLRPEND0
//  167 /***********************************************************************************
//  168 *       Descrição       :       Valor acumulado no totalizado do UCA1
//  169 *       Parametros      :       nenhum
//  170 *       Retorno         :       nenhum
//  171 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PAGAMENTOS_get_contagem_uca1
          CFI NoCalls
        THUMB
//  172 unsigned short int PAGAMENTOS_get_contagem_uca1(void){
//  173   
//  174   return PAGAMENTOS_valor_acumulado_uca;
PAGAMENTOS_get_contagem_uca1:
        LDR.N    R0,??DataTable15_13
        LDRH     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  175 }
//  176 /***********************************************************************************
//  177 *       Descrição       :       Subtraí um valor do acumulado no UCA1
//  178 *       Parametros      :       (unsigned short int) valor que será
//  179 *                                                    subtraido
//  180 *       Retorno         :       nenhum
//  181 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function PAGAMENTOS_subtrai_contagem_uca1
          CFI NoCalls
        THUMB
//  182 void PAGAMENTOS_subtrai_contagem_uca1(unsigned short int contagem){
//  183   
//  184   if(contagem>=PAGAMENTOS_valor_acumulado_uca)
PAGAMENTOS_subtrai_contagem_uca1:
        LDR.N    R1,??DataTable15_13
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BCC.N    ??PAGAMENTOS_subtrai_contagem_uca1_0
//  185     PAGAMENTOS_valor_acumulado_uca-=contagem;
        LDR.N    R1,??DataTable15_13
        LDRH     R1,[R1, #+0]
        SUBS     R1,R1,R0
        LDR.N    R2,??DataTable15_13
        STRH     R1,[R2, #+0]
        B.N      ??PAGAMENTOS_subtrai_contagem_uca1_1
//  186   else
//  187     PAGAMENTOS_valor_acumulado_uca = 0;
??PAGAMENTOS_subtrai_contagem_uca1_0:
        LDR.N    R1,??DataTable15_13
        MOVS     R2,#+0
        STRH     R2,[R1, #+0]
//  188 }
??PAGAMENTOS_subtrai_contagem_uca1_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  189 /***********************************************************************************
//  190 *       Descrição       :       Liga o bloqueio do UCA1
//  191 *       Parametros      :       (unsigned char) flag 
//  192 *       Retorno         :       nenhum
//  193 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function PAGAMENTOS_bloqueia_uca1
          CFI NoCalls
        THUMB
//  194 void PAGAMENTOS_bloqueia_uca1(unsigned char flag){
//  195   
//  196   SET_INHIBIT_UCA1(flag);
PAGAMENTOS_bloqueia_uca1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_bloqueia_uca1_0
        LDR.N    R1,??DataTable15_5  ;; 0x2009c038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1000000
        LDR.N    R2,??DataTable15_5  ;; 0x2009c038
        STR      R1,[R2, #+0]
        B.N      ??PAGAMENTOS_bloqueia_uca1_1
??PAGAMENTOS_bloqueia_uca1_0:
        LDR.N    R1,??DataTable15_16  ;; 0x2009c03c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1000000
        LDR.N    R2,??DataTable15_16  ;; 0x2009c03c
        STR      R1,[R2, #+0]
//  197 }
??PAGAMENTOS_bloqueia_uca1_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO1CLR
//  198 /***********************************************************************************
//  199 *       Descrição       :       IRQ do noteiro P70
//  200 *       Parametros      :       nenhum
//  201 *       Retorno         :       nenhum
//  202 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function PAGAMENTOS_irq_p70
          CFI NoCalls
        THUMB
//  203 void PAGAMENTOS_irq_p70(void){
//  204   
//  205   if(!PAGAMENTOS_bloqueio_p70 && !PAGAMENTOS_filtro_p70){
PAGAMENTOS_irq_p70:
        LDR.N    R0,??DataTable15_17
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PAGAMENTOS_irq_p70_0
        LDR.N    R0,??DataTable15_12
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PAGAMENTOS_irq_p70_0
//  206     PAGAMENTOS_valor_acumulado_p70+=PAGAMENTOS_incremento_p70;
        LDR.N    R0,??DataTable15_18
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable15_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable15_18
        STRH     R0,[R1, #+0]
//  207     PAGAMENTOS_filtro_p70 = RELOAD_FILTRO_UCA;
        LDR.N    R0,??DataTable15_12
        MOVS     R1,#+50
        STRH     R1,[R0, #+0]
//  208   }  
//  209   
//  210   EXTINT_bit.EINT3 = 1;
??PAGAMENTOS_irq_p70_0:
        LDR.N    R0,??DataTable15_14  ;; 0x400fc140
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable15_14  ;; 0x400fc140
        STR      R0,[R1, #+0]
//  211   CLRPEND0_bit.CLRPEND21 = 1;  
        LDR.N    R0,??DataTable15_15  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200000
        LDR.N    R1,??DataTable15_15  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  212 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
        REQUIRE _A_EXTINT
        REQUIRE _A_CLRPEND0
//  213 /***********************************************************************************
//  214 *       Descrição       :       Setter para o inhibit do noteiro P70
//  215 *       Parametros      :       (unsigned char) inhibit
//  216 *       Retorno         :       nenhum
//  217 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function PAGAMENTOS_set_inhibit_p70
          CFI NoCalls
        THUMB
//  218 void PAGAMENTOS_set_inhibit_p70(unsigned char flag){
//  219   
//  220   SET_INHIBIT_P70(flag);
PAGAMENTOS_set_inhibit_p70:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_set_inhibit_p70_0
        LDR.N    R1,??DataTable15_5  ;; 0x2009c038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2000000
        LDR.N    R2,??DataTable15_5  ;; 0x2009c038
        STR      R1,[R2, #+0]
        B.N      ??PAGAMENTOS_set_inhibit_p70_1
??PAGAMENTOS_set_inhibit_p70_0:
        LDR.N    R1,??DataTable15_16  ;; 0x2009c03c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2000000
        LDR.N    R2,??DataTable15_16  ;; 0x2009c03c
        STR      R1,[R2, #+0]
//  221 }
??PAGAMENTOS_set_inhibit_p70_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO1CLR
//  222 /***********************************************************************************
//  223 *       Descrição       :       Getter para a contagem do P70
//  224 *       Parametros      :       nenhum
//  225 *       Retorno         :       (unsigned short int) contagem do acumulador
//  226 *                               de valores do P70
//  227 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function PAGAMENTOS_get_contagem_p70
          CFI NoCalls
        THUMB
//  228 unsigned short int PAGAMENTOS_get_contagem_p70(void){
//  229   
//  230   return PAGAMENTOS_valor_acumulado_p70;
PAGAMENTOS_get_contagem_p70:
        LDR.N    R0,??DataTable15_18
        LDRH     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  231 }
//  232 /***********************************************************************************
//  233 *       Descrição       :       Subtrai um valor da contagem do P70
//  234 *       Parametros      :       (unsigned short int) valor
//  235 *       Retorno         :       nenhum
//  236 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function PAGAMENTOS_subtrai_contagem_p70
          CFI NoCalls
        THUMB
//  237 void PAGAMENTOS_subtrai_contagem_p70(unsigned short int contagem){
//  238   
//  239   if(contagem>PAGAMENTOS_valor_acumulado_p70)
PAGAMENTOS_subtrai_contagem_p70:
        LDR.N    R1,??DataTable15_18
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BCS.N    ??PAGAMENTOS_subtrai_contagem_p70_0
//  240     PAGAMENTOS_valor_acumulado_p70 -= contagem;
        LDR.N    R1,??DataTable15_18
        LDRH     R1,[R1, #+0]
        SUBS     R1,R1,R0
        LDR.N    R2,??DataTable15_18
        STRH     R1,[R2, #+0]
        B.N      ??PAGAMENTOS_subtrai_contagem_p70_1
//  241   else
//  242     PAGAMENTOS_valor_acumulado_p70 = 0;    
??PAGAMENTOS_subtrai_contagem_p70_0:
        LDR.N    R1,??DataTable15_18
        MOVS     R2,#+0
        STRH     R2,[R1, #+0]
//  243 }
??PAGAMENTOS_subtrai_contagem_p70_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  244 /***********************************************************************************
//  245 *       Descrição       :       Adiciona valores ao acumulador de dinheiro
//  246 *       Parametros      :       (unsigned short int) valor
//  247 *       Retorno         :       nenhum
//  248 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function PAGAMENTOS_adiciona_valores
        THUMB
//  249 void PAGAMENTOS_adiciona_valores(unsigned short int valor){
PAGAMENTOS_adiciona_valores:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  250   
//  251    while(!xSemaphoreTake(PAGAMENTOS_semaforo_pagamentos,portTICK_RATE_MS*1));     
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
//  252    
//  253    PAGAMENTOS_valor_acumulado_geral+=valor;
        LDR.N    R0,??DataTable15_19
        LDR      R0,[R0, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ADDS     R0,R4,R0
        LDR.N    R1,??DataTable15_19
        STR      R0,[R1, #+0]
//  254    PAGAMENTOS_timeout_pagamento = RELOAD_TIMEOUT_PAGAMENTO;
        LDR.N    R0,??DataTable15_20
        MOVW     R1,#+60000
        STR      R1,[R0, #+0]
//  255    
//  256    xSemaphoreGive(PAGAMENTOS_semaforo_pagamentos);   
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  257 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock11
//  258 /***********************************************************************************
//  259 *       Descrição       :       Getter para o acumulador de dinheiro
//  260 *       Parametros      :       (nenhum)
//  261 *       Retorno         :       (int) valor acumulado em moeda
//  262 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function PAGAMENTOS_get_valor_acumulado
        THUMB
//  263 int PAGAMENTOS_get_valor_acumulado(void){
PAGAMENTOS_get_valor_acumulado:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+12
          CFI CFA R13+24
//  264    int valor;
//  265    
//  266    while(!xSemaphoreTake(PAGAMENTOS_semaforo_pagamentos,portTICK_RATE_MS*1));     
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
//  267    
//  268    //Hoock para ler o UCA1
//  269    if(PAGAMENTOS_valor_acumulado_p70){
        LDR.N    R0,??DataTable15_18
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PAGAMENTOS_get_valor_acumulado_1
//  270      
//  271      unsigned int fat_cartao_par;     
//  272      unsigned int fat_cartao_tot;
//  273      unsigned int temp = PAGAMENTOS_valor_acumulado_p70;
        LDR.N    R0,??DataTable15_18
        LDRH     R5,[R0, #+0]
//  274      
//  275      PARAMETROS_le(ADR_CARTAO_PARCIAL,(void*)&fat_cartao_par);
        ADD      R1,SP,#+4
        MOVS     R0,#+14
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  276      PARAMETROS_le(ADR_CARTAO_TOTAL,(void*)&fat_cartao_tot);
        ADD      R1,SP,#+0
        MOVS     R0,#+15
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  277      
//  278      fat_cartao_par+=temp;
        LDR      R0,[SP, #+4]
        ADDS     R0,R5,R0
        STR      R0,[SP, #+4]
//  279      fat_cartao_tot+=temp;
        LDR      R0,[SP, #+0]
        ADDS     R0,R5,R0
        STR      R0,[SP, #+0]
//  280      
//  281      PARAMETROS_grava(ADR_CARTAO_PARCIAL,(void*)&fat_cartao_par);
        ADD      R1,SP,#+4
        MOVS     R0,#+14
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  282      PARAMETROS_grava(ADR_CARTAO_TOTAL,(void*)&fat_cartao_tot);
        ADD      R1,SP,#+0
        MOVS     R0,#+15
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  283      
//  284      valor+= PAGAMENTOS_valor_acumulado_p70;   
        LDR.N    R0,??DataTable15_18
        LDRH     R0,[R0, #+0]
        ADDS     R4,R0,R4
//  285      PAGAMENTOS_valor_acumulado_geral+=temp;
        LDR.N    R0,??DataTable15_19
        LDR      R0,[R0, #+0]
        ADDS     R0,R5,R0
        LDR.N    R1,??DataTable15_19
        STR      R0,[R1, #+0]
//  286      PAGAMENTOS_valor_acumulado_p70 -= temp; // É concorrente!
        LDR.N    R0,??DataTable15_18
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,R5
        LDR.N    R1,??DataTable15_18
        STRH     R0,[R1, #+0]
//  287    }
//  288    
//  289    valor = PAGAMENTOS_valor_acumulado_geral;   
??PAGAMENTOS_get_valor_acumulado_1:
        LDR.N    R0,??DataTable15_19
        LDR      R0,[R0, #+0]
        MOVS     R4,R0
//  290    valor+= PAGAMENTOS_valor_acumulado_uca;   
        LDR.N    R0,??DataTable15_13
        LDRH     R0,[R0, #+0]
        ADDS     R4,R0,R4
//  291    PAGAMENTOS_valor_acumulado_uca = 0;   
        LDR.N    R0,??DataTable15_13
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  292    
//  293    xSemaphoreGive(PAGAMENTOS_semaforo_pagamentos);     
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  294    
//  295    return valor;  
        MOVS     R0,R4
        POP      {R1-R5,PC}       ;; return
          CFI EndBlock cfiBlock12
//  296 }
//  297 /***********************************************************************************
//  298 *       Descrição       :       Subtrai valores do acumulador de moeda
//  299 *       Parametros      :       (usigned int) valor
//  300 *       Retorno         :       nenhum
//  301 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function PAGAMENTOS_subtrai_valores
        THUMB
//  302 void PAGAMENTOS_subtrai_valores(unsigned int valor){
PAGAMENTOS_subtrai_valores:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  303   
//  304    while(!xSemaphoreTake(PAGAMENTOS_semaforo_pagamentos,portTICK_RATE_MS*1));     
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
//  305    
//  306    if(PAGAMENTOS_valor_acumulado_geral>=valor)
        LDR.N    R0,??DataTable15_19
        LDR      R0,[R0, #+0]
        CMP      R0,R4
        BCC.N    ??PAGAMENTOS_subtrai_valores_1
//  307      PAGAMENTOS_valor_acumulado_geral-=valor;
        LDR.N    R0,??DataTable15_19
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,R4
        LDR.N    R1,??DataTable15_19
        STR      R0,[R1, #+0]
        B.N      ??PAGAMENTOS_subtrai_valores_2
//  308    else
//  309      PAGAMENTOS_valor_acumulado_geral = 0;
??PAGAMENTOS_subtrai_valores_1:
        LDR.N    R0,??DataTable15_19
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  310    
//  311    if(PAGAMENTOS_valor_acumulado_geral<0)
??PAGAMENTOS_subtrai_valores_2:
        LDR.N    R0,??DataTable15_19
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??PAGAMENTOS_subtrai_valores_3
//  312      PAGAMENTOS_valor_acumulado_geral = 0;
        LDR.N    R0,??DataTable15_19
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  313    
//  314    xSemaphoreGive(PAGAMENTOS_semaforo_pagamentos);      
??PAGAMENTOS_subtrai_valores_3:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  315 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock13
//  316 /***********************************************************************************
//  317 *       Descrição       :       Setter para o acumulador de dinheiro
//  318 *       Parametros      :       (int valor)
//  319 *       Retorno         :       nenhum
//  320 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function PAGAMENTOS_set_valores
        THUMB
//  321 void PAGAMENTOS_set_valores(int valor){
PAGAMENTOS_set_valores:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  322   
//  323    while(!xSemaphoreTake(PAGAMENTOS_semaforo_pagamentos,portTICK_RATE_MS*1));     
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
//  324    
//  325    PAGAMENTOS_valor_acumulado_geral = valor;
        LDR.N    R0,??DataTable15_19
        STR      R4,[R0, #+0]
//  326    
//  327    xSemaphoreGive(PAGAMENTOS_semaforo_pagamentos);   
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable15_6
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  328 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock14
//  329 /***********************************************************************************
//  330 *       Descrição       :       Setter para o bloqueio dos meios de 
//  331 *                               pagamento
//  332 *       Parametros      :       (unsigned char) maior do que zero indica
//  333 *                               que os meios de pagamento serão bloqueados
//  334 *       Retorno         :       nenhum
//  335 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function PAGAMENTOS_set_bloqueio
        THUMB
//  336 void PAGAMENTOS_set_bloqueio(unsigned char flag){
PAGAMENTOS_set_bloqueio:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  337   
//  338   PAGAMENTOS_bloqueio_p70 = flag;
        LDR.N    R0,??DataTable15_17
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R4,[R0, #+0]
//  339   PAGAMENTOS_bloqueia_uca1(flag);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PAGAMENTOS_bloqueia_uca1
        BL       PAGAMENTOS_bloqueia_uca1
//  340   PAGAMENTOS_set_inhibit_p70(flag);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PAGAMENTOS_set_inhibit_p70
        BL       PAGAMENTOS_set_inhibit_p70
//  341   SMDBILL_set_bloqueio(flag);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
          CFI FunCall SMDBILL_set_bloqueio
        BL       SMDBILL_set_bloqueio
//  342   SMDBCOIN_set_flag_bloqueio(flag);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
          CFI FunCall SMDBCOIN_set_flag_bloqueio
        BL       SMDBCOIN_set_flag_bloqueio
//  343   BV20_setter_bloqueio(flag);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall BV20_setter_bloqueio
        BL       BV20_setter_bloqueio
//  344 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock15
//  345 /***********************************************************************************
//  346 *       Descrição       :       Getter para o contador que indica que
//  347 *                               não há interação com o meio de pagamento
//  348 *       Parametros      :       nenhum
//  349 *       Retorno         :       (unsigned int) contagem do contador
//  350 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function PAGAMENTOS_get_timeout_pagamento
          CFI NoCalls
        THUMB
//  351 unsigned int PAGAMENTOS_get_timeout_pagamento(void){
//  352   
//  353   return PAGAMENTOS_timeout_pagamento;
PAGAMENTOS_get_timeout_pagamento:
        LDR.N    R0,??DataTable15_20
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock16
//  354 }

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
        DC32     PAGAMENTOS_incremento_uca

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_8:
        DC32     PAGAMENTOS_incremento_p70

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_9:
        DC32     0x186a1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_10:
        DC32     0x186a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_11:
        DC32     PAGAMENTOS_filtro_uca

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_12:
        DC32     PAGAMENTOS_filtro_p70

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_13:
        DC32     PAGAMENTOS_valor_acumulado_uca

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_14:
        DC32     0x400fc140

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_15:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_16:
        DC32     0x2009c03c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_17:
        DC32     PAGAMENTOS_bloqueio_p70

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_18:
        DC32     PAGAMENTOS_valor_acumulado_p70

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_19:
        DC32     PAGAMENTOS_valor_acumulado_geral

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_20:
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
//  355 /***********************************************************************************
//  356 *       Fim do arquivo
//  357 ***********************************************************************************/
// 
//    28 bytes in section .bss
//     4 bytes in section .data
//    36 bytes in section .noinit (abs)
// 1 110 bytes in section .text
// 
// 1 110 bytes of CODE memory
//    32 bytes of DATA memory (+ 36 bytes shared)
//
//Errors: none
//Warnings: 3
