///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     06/Jul/2017  16:39:45 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Board\Board.c                           /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Board\Board.c -lC                       /
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
//                    pocaG2\SOFTWARE\Debug\List\Board.s                      /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Board

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN AA_amostragemAnalogica
        EXTERN AA_ini
        EXTERN APLICACAO_tempo_desumidificador
        EXTERN APLICACAO_tempo_mensagem
        EXTERN CCTALK_ini
        EXTERN CT_ini
        EXTERN CT_timer_tick
        EXTERN HD44780_2_tempoRefreshSegundoLCD
        EXTERN LEDS_ini
        EXTERN LEDS_setter_led
        EXTERN MCS_contadorSemente
        EXTERN MDB_ini
        EXTERN PAGAMENTOS_ini
        EXTERN PAGAMENTOS_set_bloqueio
        EXTERN PAGAMENTOS_timeout_pagamento
        EXTERN PAGAMENTOS_timer_tick
        EXTERN PARAMETROS_ini
        EXTERN PARAMETROS_le
        EXTERN PLAYERWAVE_ini
        EXTERN PLAYERWAVE_iniciaMusica
        EXTERN POTENCIA_ini
        EXTERN POTENCIA_timerTick
        EXTERN PREPARACAO_cnt_preparo
        EXTERN PREPARACAO_cnt_rampa
        EXTERN PREPARACAO_contador_compensacao
        EXTERN RTC_init
        EXTERN SD_disk_initialize
        EXTERN SERIALMUX_ini
        EXTERN SERIALMUX_seleciona
        EXTERN SMC_contador
        EXTERN TECLADO_timerTick
        EXTERN vTaskDelay

        PUBLIC BOARD_buffer_entradas_digitais
        PUBLIC BOARD_contador_propaganda
        PUBLIC BOARD_estado_leds
        PUBLIC BOARD_general_purpose_counter
        PUBLIC BOARD_get_sinal
        PUBLIC BOARD_getter_general_purpose_counter
        PUBLIC BOARD_ini
        PUBLIC BOARD_instrucao_leds
        PUBLIC BOARD_intervalo_propaganda
        PUBLIC BOARD_leds_instrucao
        PUBLIC BOARD_liga_placa_instrucao
        PUBLIC BOARD_lock_timer
        PUBLIC BOARD_main
        PUBLIC BOARD_reset_tempo_propaganda
        PUBLIC BOARD_set_motor_dose
        PUBLIC BOARD_set_motor_embalagem
        PUBLIC BOARD_setter_contador_propaganda
        PUBLIC BOARD_setter_general_purpose_counter
        PUBLIC BOARD_setter_led_instrucao
        PUBLIC BOARD_timer_tick
        PUBLIC _A_FIO0PIN
        PUBLIC _A_FIO1CLR
        PUBLIC _A_FIO1DIR
        PUBLIC _A_FIO1PIN
        PUBLIC _A_FIO1SET
        PUBLIC _A_FIO4CLR
        PUBLIC _A_FIO4DIR
        PUBLIC _A_FIO4SET
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Board\Board.c
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
//   17 |       Arquivo            :  board.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :
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
//   34 #include <nxp\iolpc1768.h>

        ASEGN `.noinit`:DATA:NOROOT,02009c014H
        SECTION_GROUP _A_FIO0PIN
// __absolute union <unnamed> volatile _A_FIO0PIN
_A_FIO0PIN:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c020H
        SECTION_GROUP _A_FIO1DIR
// __absolute union <unnamed> volatile _A_FIO1DIR
_A_FIO1DIR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c034H
        SECTION_GROUP _A_FIO1PIN
// __absolute union <unnamed> volatile _A_FIO1PIN
_A_FIO1PIN:
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

        ASEGN `.noinit`:DATA:NOROOT,02009c080H
        SECTION_GROUP _A_FIO4DIR
// __absolute union <unnamed> volatile _A_FIO4DIR
_A_FIO4DIR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c098H
        SECTION_GROUP _A_FIO4SET
// __absolute union <unnamed> volatile _A_FIO4SET
_A_FIO4SET:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c09cH
        SECTION_GROUP _A_FIO4CLR
// __absolute union <unnamed> volatile _A_FIO4CLR
_A_FIO4CLR:
        DS8 4
//   35 #include "..\includes.h"
//   36 
//   37 /***********************************************************************************
//   38 *       Definições
//   39 ***********************************************************************************/
//   40 #define TAM_BUFFER_SENSORES             16
//   41 
//   42 #define LED_STATUS_PIN                  (0x01)<<16
//   43 #define INI_LED_PINS()                  FIO1DIR|=LED_STATUS_PIN
//   44 #define SET_LED_STATUS(X)               X?(FIO1SET|=LED_STATUS_PIN):(FIO1CLR|=LED_STATUS_PIN)
//   45 
//   46 #define SENSOR_BARREIRA_PAPEL_PIN       (0x01)<<25
//   47 #define GET_BARREIRA_SAIDA_PAPEL_PIN()  FIO0PIN&SENSOR_BARREIRA_PAPEL_PIN?0:1
//   48 
//   49 
//   50 #define MOTOR_EMBALAGEM_PIN             (0x01)<<0
//   51 #define INI_MOTOR_EMBALAGEM_PIN()       FIO1DIR|=MOTOR_EMBALAGEM_PIN
//   52 #define SET_MOTOR_EMBALAGEM_PIN(X)      X?(FIO1SET|=MOTOR_EMBALAGEM_PIN):(FIO1CLR|=MOTOR_EMBALAGEM_PIN)
//   53 
//   54 
//   55 #define FIM_DO_PAPEL_PIN                (0x01)<<1
//   56 #define GET_SENSOR_FIM_PAPEL_PIN()      (FIO1PIN&FIM_DO_PAPEL_PIN)?0:1
//   57 
//   58 #define HIGH_SIDE_ESQUERDA              (0x01)<<28
//   59 #define LOW_SIDE_ESQUERDA               (0x01)<<29
//   60 
//   61 #define HIGH_SIDE_DIREITA               (0x01)<<30
//   62 #define LOW_SIDE_DIREITA                ((unsigned int)(0x01)<<31)
//   63 
//   64 #define INI_EMBALAGEM_PINS()            FIO1DIR|=HIGH_SIDE_ESQUERDA|LOW_SIDE_ESQUERDA|HIGH_SIDE_DIREITA|LOW_SIDE_DIREITA;FIO1CLR|=HIGH_SIDE_ESQUERDA|LOW_SIDE_ESQUERDA|HIGH_SIDE_DIREITA|LOW_SIDE_DIREITA
//   65 
//   66 #define SET_HIGH_SIDE_ESQUERDA(X)       X?(FIO1SET|=HIGH_SIDE_ESQUERDA):(FIO1CLR|=HIGH_SIDE_ESQUERDA)
//   67 #define SET_LOW_SIDE_ESQUERDA(X)        X?(FIO1SET|=LOW_SIDE_ESQUERDA):(FIO1CLR|=LOW_SIDE_ESQUERDA)
//   68 
//   69 #define SET_HIGH_SIDE_DIREITA(X)        X?(FIO1SET|=HIGH_SIDE_DIREITA):(FIO1CLR|=HIGH_SIDE_DIREITA)
//   70 #define SET_LOW_SIDE_DIREITA(X)         X?(FIO1SET|=LOW_SIDE_DIREITA):(FIO1CLR|=LOW_SIDE_DIREITA)
//   71 
//   72 #define SENSOR_DOSE_PIN                 (0x01)<<15
//   73 #define GET_SENSOR_DOSE_PIN()           (FIO1PIN&SENSOR_DOSE_PIN)?0:1
//   74 
//   75 
//   76 #define FITA_LED_01_PIN                 (0x01)<<28
//   77 #define SET_FITA_LED_01(X)              X?(FIO4SET|=FITA_LED_01_PIN):(FIO4CLR|=FITA_LED_01_PIN)
//   78 
//   79 #define FITA_LED_02_PIN                 (0x01)<<29
//   80 #define SET_FITA_LED_02(X)              X?(FIO4SET|=FITA_LED_02_PIN):(FIO4CLR|=FITA_LED_02_PIN)
//   81 
//   82 #define FITA_LED_INI()                  FIO4DIR |= FITA_LED_01_PIN | FITA_LED_02_PIN
//   83 
//   84 /***********************************************************************************
//   85 *       Variaveis locais
//   86 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   87 unsigned short int BOARD_buffer_entradas_digitais[TAM_BUFFER_SENSORES]={0};
BOARD_buffer_entradas_digitais:
        DS8 32

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   88 unsigned int BOARD_general_purpose_counter=0;
BOARD_general_purpose_counter:
        DS8 4
//   89 extern unsigned int PREPARACAO_cnt_preparo;
//   90 extern unsigned int PREPARACAO_cnt_rampa;

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   91 unsigned char BOARD_leds_instrucao=1;
BOARD_leds_instrucao:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   92 eLED_STATE BOARD_estado_leds[8]={APAGADO};
BOARD_estado_leds:
        DS8 8
//   93 extern unsigned int PAGAMENTOS_timeout_pagamento;

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   94 unsigned int BOARD_contador_propaganda=10*60000;
BOARD_contador_propaganda:
        DATA
        DC32 600000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   95 unsigned int BOARD_intervalo_propaganda=0;
BOARD_intervalo_propaganda:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   96 unsigned int BOARD_lock_timer;
BOARD_lock_timer:
        DS8 4
//   97 extern unsigned int MCS_contadorSemente;
//   98 extern unsigned int HD44780_2_tempoRefreshSegundoLCD;
//   99 extern unsigned int PREPARACAO_contador_compensacao;
//  100 extern unsigned int APLICACAO_tempo_desumidificador;
//  101 extern unsigned int SMC_contador;
//  102 extern unsigned int APLICACAO_tempo_mensagem;
//  103 /***********************************************************************************
//  104 *       Funções locais
//  105 ***********************************************************************************/
//  106 void BOARD_instrucao_leds(void);
//  107 
//  108 /***********************************************************************************
//  109 *       Implementação das funções
//  110 ***********************************************************************************/
//  111 
//  112 /***********************************************************************************
//  113 *       Descrição       :       Inicialização da camada board
//  114 *       Parametros      :       nenhum
//  115 *       Retorno         :       nenhum
//  116 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function BOARD_ini
        THUMB
//  117 void BOARD_ini(void){
BOARD_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  118   
//  119   CCTALK_ini();
          CFI FunCall CCTALK_ini
        BL       CCTALK_ini
//  120   PAGAMENTOS_ini();
          CFI FunCall PAGAMENTOS_ini
        BL       PAGAMENTOS_ini
//  121   PAGAMENTOS_set_bloqueio(1);
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  122   BOARD_set_motor_dose(PARADO);
        MOVS     R0,#+0
          CFI FunCall BOARD_set_motor_dose
        BL       BOARD_set_motor_dose
//  123   INI_EMBALAGEM_PINS();
        LDR.W    R0,??DataTable12  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF0000000
        LDR.W    R1,??DataTable12  ;; 0x2009c020
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF0000000
        LDR.W    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  124   INI_MOTOR_EMBALAGEM_PIN();
        LDR.W    R0,??DataTable12  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable12  ;; 0x2009c020
        STR      R0,[R1, #+0]
//  125   INI_LED_PINS();    
        LDR.W    R0,??DataTable12  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12  ;; 0x2009c020
        STR      R0,[R1, #+0]
//  126   PARAMETROS_ini();
          CFI FunCall PARAMETROS_ini
        BL       PARAMETROS_ini
//  127   AA_ini();
          CFI FunCall AA_ini
        BL       AA_ini
//  128   POTENCIA_ini();
          CFI FunCall POTENCIA_ini
        BL       POTENCIA_ini
//  129   CT_ini();
          CFI FunCall CT_ini
        BL       CT_ini
//  130   LEDS_ini();
          CFI FunCall LEDS_ini
        BL       LEDS_ini
//  131   MDB_ini();
          CFI FunCall MDB_ini
        BL       MDB_ini
//  132   FITA_LED_INI();
        LDR.W    R0,??DataTable12_2  ;; 0x2009c080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x30000000
        LDR.W    R1,??DataTable12_2  ;; 0x2009c080
        STR      R0,[R1, #+0]
//  133   PLAYERWAVE_ini();
          CFI FunCall PLAYERWAVE_ini
        BL       PLAYERWAVE_ini
//  134   SERIALMUX_ini();
          CFI FunCall SERIALMUX_ini
        BL       SERIALMUX_ini
//  135   SD_disk_initialize();
          CFI FunCall SD_disk_initialize
        BL       SD_disk_initialize
//  136   // Deixa a porta serial RS232
//  137   // habilitada direto
//  138   SERIALMUX_seleciona(SERIALMUX_RS232);
        MOVS     R0,#+0
          CFI FunCall SERIALMUX_seleciona
        BL       SERIALMUX_seleciona
//  139 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_FIO1DIR
        REQUIRE _A_FIO1CLR
        REQUIRE _A_FIO4DIR
//  140 /***********************************************************************************
//  141 *       Descrição       :       Tick de timer para o módulo board
//  142 *       Parametros      :       nenhum
//  143 *       Retorno         :       nenhum
//  144 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function BOARD_timer_tick
        THUMB
//  145 void BOARD_timer_tick(void){
BOARD_timer_tick:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  146   static unsigned char indice=0;  
//  147   unsigned short int temp=0;
        MOVS     R4,#+0
//  148   
//  149   POTENCIA_timerTick();
          CFI FunCall POTENCIA_timerTick
        BL       POTENCIA_timerTick
//  150   TECLADO_timerTick();  
          CFI FunCall TECLADO_timerTick
        BL       TECLADO_timerTick
//  151   RTC_init();
          CFI FunCall RTC_init
        BL       RTC_init
//  152   AA_amostragemAnalogica();
          CFI FunCall AA_amostragemAnalogica
        BL       AA_amostragemAnalogica
//  153   CT_timer_tick();
          CFI FunCall CT_timer_tick
        BL       CT_timer_tick
//  154   PAGAMENTOS_timer_tick();
          CFI FunCall PAGAMENTOS_timer_tick
        BL       PAGAMENTOS_timer_tick
//  155   
//  156   if(BOARD_general_purpose_counter)
        LDR.W    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_0
//  157     BOARD_general_purpose_counter--;
        LDR.W    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_3
        STR      R0,[R1, #+0]
//  158   
//  159   if(PREPARACAO_cnt_preparo)
??BOARD_timer_tick_0:
        LDR.W    R0,??DataTable12_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_1
//  160     PREPARACAO_cnt_preparo--;
        LDR.W    R0,??DataTable12_4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_4
        STR      R0,[R1, #+0]
//  161   
//  162   if(PREPARACAO_cnt_rampa)
??BOARD_timer_tick_1:
        LDR.W    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_2
//  163     PREPARACAO_cnt_rampa--;
        LDR.W    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_5
        STR      R0,[R1, #+0]
//  164   
//  165   if(PAGAMENTOS_timeout_pagamento)
??BOARD_timer_tick_2:
        LDR.W    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_3
//  166     PAGAMENTOS_timeout_pagamento--;
        LDR.W    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_6
        STR      R0,[R1, #+0]
//  167   
//  168   if(BOARD_contador_propaganda)
??BOARD_timer_tick_3:
        LDR.W    R0,??DataTable12_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_4
//  169     BOARD_contador_propaganda--;
        LDR.W    R0,??DataTable12_7
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_7
        STR      R0,[R1, #+0]
//  170   
//  171   if(BOARD_lock_timer)
??BOARD_timer_tick_4:
        LDR.W    R0,??DataTable12_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_5
//  172     BOARD_lock_timer--;
        LDR.W    R0,??DataTable12_8
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_8
        STR      R0,[R1, #+0]
//  173   
//  174   if(HD44780_2_tempoRefreshSegundoLCD)
??BOARD_timer_tick_5:
        LDR.W    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_6
//  175     HD44780_2_tempoRefreshSegundoLCD--;
        LDR.W    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_9
        STR      R0,[R1, #+0]
//  176   
//  177   if(PREPARACAO_contador_compensacao)
??BOARD_timer_tick_6:
        LDR.W    R0,??DataTable12_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_7
//  178     PREPARACAO_contador_compensacao--;
        LDR.W    R0,??DataTable12_10
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_10
        STR      R0,[R1, #+0]
//  179   
//  180   if(APLICACAO_tempo_desumidificador)
??BOARD_timer_tick_7:
        LDR.W    R0,??DataTable12_11
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_8
//  181     APLICACAO_tempo_desumidificador--;
        LDR.W    R0,??DataTable12_11
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_11
        STR      R0,[R1, #+0]
//  182   
//  183   if(SMC_contador)
??BOARD_timer_tick_8:
        LDR.W    R0,??DataTable12_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_9
//  184     SMC_contador--;
        LDR.W    R0,??DataTable12_12
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_12
        STR      R0,[R1, #+0]
//  185   
//  186   if(APLICACAO_tempo_mensagem)
??BOARD_timer_tick_9:
        LDR.W    R0,??DataTable12_13
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_10
//  187     APLICACAO_tempo_mensagem--;
        LDR.W    R0,??DataTable12_13
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_13
        STR      R0,[R1, #+0]
//  188   
//  189   MCS_contadorSemente++;
??BOARD_timer_tick_10:
        LDR.W    R0,??DataTable12_14
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12_14
        STR      R0,[R1, #+0]
//  190   
//  191   // Reedswitch que detecta
//  192   // a posição da dosador do milho
//  193   temp |= GET_SENSOR_DOSE_PIN();
        LDR.W    R0,??DataTable12_15  ;; 0x2009c034
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+15,#+1
        ANDS     R0,R0,#0x1
        EORS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R4,R0,R4
//  194   temp<<=1;
        LSLS     R4,R4,#+1
//  195   
//  196   // Sensor da chave de fim de curso
//  197   // que indica a reserva do papel
//  198   temp |= GET_SENSOR_FIM_PAPEL_PIN();
        LDR.W    R0,??DataTable12_15  ;; 0x2009c034
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+1,#+1
        ANDS     R0,R0,#0x1
        EORS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R4,R0,R4
//  199   temp<<=1;
        LSLS     R4,R4,#+1
//  200   
//  201   // Sensor da barreira óptica
//  202   temp |= GET_BARREIRA_SAIDA_PAPEL_PIN();  
        LDR.W    R0,??DataTable12_16  ;; 0x2009c014
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+25,#+1
        ANDS     R0,R0,#0x1
        EORS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R4,R0,R4
//  203   
//  204   BOARD_buffer_entradas_digitais[indice] = temp;
        LDR.W    R0,??DataTable12_17
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_18
        STRH     R4,[R1, R0, LSL #+1]
//  205   indice = (indice+1) % TAM_BUFFER_SENSORES;
        LDR.W    R0,??DataTable12_17
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+16
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.W    R0,??DataTable12_17
        STRB     R2,[R0, #+0]
//  206 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_FIO1PIN
        REQUIRE _A_FIO0PIN

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??indice:
        DS8 1
//  207 /***********************************************************************************
//  208 *       Descrição       :       Função principal da thread board
//  209 *       Parametros      :       nenhum
//  210 *       Retorno         :       nenhum
//  211 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function BOARD_main
        THUMB
//  212 void BOARD_main(void*pPar){
BOARD_main:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  213   unsigned char toggle=0;
        MOVS     R4,#+0
//  214   unsigned char flag;
//  215   
//  216   PARAMETROS_le(ADR_INTERVALO_TEMPO_PROP,(void*)&BOARD_intervalo_propaganda);
        LDR.W    R1,??DataTable12_19
        MOVS     R0,#+31
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  217   if(BOARD_intervalo_propaganda>60)
        LDR.W    R0,??DataTable12_19
        LDR      R0,[R0, #+0]
        CMP      R0,#+61
        BCC.N    ??BOARD_main_0
//  218     BOARD_intervalo_propaganda = 60;
        LDR.W    R0,??DataTable12_19
        MOVS     R1,#+60
        STR      R1,[R0, #+0]
//  219   
//  220   PARAMETROS_le(ADR_FLAG_FITA_LED,(void*)&flag);
??BOARD_main_0:
        ADD      R1,SP,#+0
        MOVS     R0,#+33
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
        B.N      ??BOARD_main_1
//  221   
//  222   for(;;){
//  223   
//  224     toggle ^= 255;
//  225     
//  226     if(flag){
//  227       if(toggle){
//  228         SET_LED_STATUS(1);
//  229         SET_FITA_LED_01(1);
//  230         SET_FITA_LED_02(0);
//  231       }
//  232       else{           
//  233         SET_LED_STATUS(0);
//  234         SET_FITA_LED_01(0);
//  235         SET_FITA_LED_02(1);      
//  236       }
//  237     }
//  238     else{
//  239       SET_FITA_LED_01(0);      
//  240       SET_FITA_LED_02(0);
//  241       SET_LED_STATUS(toggle);
??BOARD_main_2:
        LDR.W    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  242     }
//  243     
//  244     vTaskDelay(250);       
??BOARD_main_3:
        MOVS     R0,#+250
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  245       
//  246     BOARD_instrucao_leds();
          CFI FunCall BOARD_instrucao_leds
        BL       BOARD_instrucao_leds
//  247     
//  248     // Roda a propaganda no intervalo
//  249     // de tempo programaddo
//  250     if(!BOARD_contador_propaganda){      
        LDR.W    R0,??DataTable12_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??BOARD_main_1
//  251       if(BOARD_intervalo_propaganda){
        LDR.W    R0,??DataTable12_19
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_main_4
//  252         PLAYERWAVE_iniciaMusica(AUDIO_PROPAGANDA,0);        
        MOVS     R1,#+0
        MOVS     R0,#+3
          CFI FunCall PLAYERWAVE_iniciaMusica
        BL       PLAYERWAVE_iniciaMusica
//  253       }
//  254       BOARD_contador_propaganda = BOARD_intervalo_propaganda*60000;
??BOARD_main_4:
        LDR.W    R0,??DataTable12_19
        LDR      R0,[R0, #+0]
        MOVW     R1,#+60000
        MULS     R0,R1,R0
        LDR.W    R1,??DataTable12_7
        STR      R0,[R1, #+0]
//  255     }
??BOARD_main_1:
        EORS     R4,R4,#0xFF
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_main_5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BOARD_main_6
        LDR.W    R0,??DataTable12_20  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12_20  ;; 0x2009c038
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable12_21  ;; 0x2009c098
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.W    R1,??DataTable12_21  ;; 0x2009c098
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable12_22  ;; 0x2009c09c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.W    R1,??DataTable12_22  ;; 0x2009c09c
        STR      R0,[R1, #+0]
        B.N      ??BOARD_main_3
??BOARD_main_6:
        LDR.W    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable12_22  ;; 0x2009c09c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.W    R1,??DataTable12_22  ;; 0x2009c09c
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable12_21  ;; 0x2009c098
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.W    R1,??DataTable12_21  ;; 0x2009c098
        STR      R0,[R1, #+0]
        B.N      ??BOARD_main_3
??BOARD_main_5:
        LDR.W    R0,??DataTable12_22  ;; 0x2009c09c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.W    R1,??DataTable12_22  ;; 0x2009c09c
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable12_22  ;; 0x2009c09c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.W    R1,??DataTable12_22  ;; 0x2009c09c
        STR      R0,[R1, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BOARD_main_2
        LDR.W    R0,??DataTable12_20  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12_20  ;; 0x2009c038
        STR      R0,[R1, #+0]
        B.N      ??BOARD_main_3
          CFI EndBlock cfiBlock2
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO4SET
        REQUIRE _A_FIO4CLR
        REQUIRE _A_FIO1CLR
//  256     
//  257   }// Fim for(;;)
//  258 }
//  259 /***********************************************************************************
//  260 *       Descrição       :       Verifica se um dos sinais está ativo
//  261 *       Parametros      :       (unsigned char) bit
//  262 *       Retorno         :       (unsigned char) maior do que zero
//  263 *                               se a entrada estiver acionada
//  264 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function BOARD_get_sinal
          CFI NoCalls
        THUMB
//  265 unsigned char BOARD_get_sinal(eSINAL sinal){
BOARD_get_sinal:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  266   unsigned char contador=0;  
        MOVS     R1,#+0
//  267   
//  268   for(unsigned char i=0;i<TAM_BUFFER_SENSORES;i++)
        MOVS     R2,#+0
        B.N      ??BOARD_get_sinal_0
//  269     if(BOARD_buffer_entradas_digitais[i]&(0x01<<sinal))
??BOARD_get_sinal_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.W    R3,??DataTable12_18
        LDRH     R3,[R3, R2, LSL #+1]
        MOVS     R4,#+1
        LSLS     R4,R4,R0
        TST      R3,R4
        BEQ.N    ??BOARD_get_sinal_2
//  270       contador++;
        ADDS     R1,R1,#+1
??BOARD_get_sinal_2:
        ADDS     R2,R2,#+1
??BOARD_get_sinal_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+16
        BLT.N    ??BOARD_get_sinal_1
//  271   
//  272   if(contador>(TAM_BUFFER_SENSORES>>1))
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+9
        BLT.N    ??BOARD_get_sinal_3
//  273     return 1;
        MOVS     R0,#+1
        B.N      ??BOARD_get_sinal_4
//  274   
//  275   return 0;
??BOARD_get_sinal_3:
        MOVS     R0,#+0
??BOARD_get_sinal_4:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  276 }
//  277 /***********************************************************************************
//  278 *       Descrição       :       Liga o mosfet da saída de embalagem
//  279 *       Parametros      :       (unsigned char) valor
//  280 *       Retorno         :       nenhum
//  281 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function BOARD_set_motor_embalagem
          CFI NoCalls
        THUMB
//  282 void BOARD_set_motor_embalagem(unsigned char flag){
//  283   
//  284   SET_MOTOR_EMBALAGEM_PIN(flag);
BOARD_set_motor_embalagem:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BOARD_set_motor_embalagem_0
        LDR.W    R0,??DataTable12_20  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable12_20  ;; 0x2009c038
        STR      R0,[R1, #+0]
        B.N      ??BOARD_set_motor_embalagem_1
??BOARD_set_motor_embalagem_0:
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  285 }
??BOARD_set_motor_embalagem_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO1CLR
//  286 /***********************************************************************************
//  287 *       Descrição       :       Setter para o controle do motor da embalagem
//  288 *       Parametros      :       (eMOTOR_DOSE) estado do motor
//  289 *       Retorno         :       nenhum
//  290 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function BOARD_set_motor_dose
        THUMB
//  291 void BOARD_set_motor_dose(eMOTOR_DOSE sentido){
BOARD_set_motor_dose:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  292   
//  293   switch(sentido){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BOARD_set_motor_dose_0
        CMP      R0,#+2
        BEQ.N    ??BOARD_set_motor_dose_1
        BCC.N    ??BOARD_set_motor_dose_2
        B.N      ??BOARD_set_motor_dose_3
//  294     case PARADO:  
//  295          SET_HIGH_SIDE_ESQUERDA(0);
??BOARD_set_motor_dose_0:
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  296          SET_LOW_SIDE_ESQUERDA(0);
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  297          SET_HIGH_SIDE_DIREITA(0);
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  298          SET_LOW_SIDE_DIREITA(0);
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  299          break;
        B.N      ??BOARD_set_motor_dose_3
//  300     case DOSAR:
//  301          SET_HIGH_SIDE_DIREITA(0);
??BOARD_set_motor_dose_2:
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  302          SET_LOW_SIDE_ESQUERDA(0);
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  303          vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  304          SET_HIGH_SIDE_ESQUERDA(1);
        LDR.N    R0,??DataTable12_20  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable12_20  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  305          SET_LOW_SIDE_DIREITA(1);
        LDR.N    R0,??DataTable12_20  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable12_20  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  306          break;
        B.N      ??BOARD_set_motor_dose_3
//  307     case REVERTER:
//  308          SET_HIGH_SIDE_ESQUERDA(0);
??BOARD_set_motor_dose_1:
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  309          SET_LOW_SIDE_DIREITA(0);     
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  310          vTaskDelay(50);         
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  311          SET_HIGH_SIDE_DIREITA(1);
        LDR.N    R0,??DataTable12_20  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40000000
        LDR.N    R1,??DataTable12_20  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  312          SET_LOW_SIDE_ESQUERDA(1);         
        LDR.N    R0,??DataTable12_20  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.N    R1,??DataTable12_20  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  313          break;
//  314   }
//  315 }
??BOARD_set_motor_dose_3:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
        REQUIRE _A_FIO1CLR
        REQUIRE _A_FIO1SET
//  316 /***********************************************************************************
//  317 *       Descrição       :       Setter para o contador de uso geral
//  318 *       Parametros      :       (unsigned int) valor de preset
//  319 *       Retorno         :       nenhum
//  320 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function BOARD_setter_general_purpose_counter
          CFI NoCalls
        THUMB
//  321 void BOARD_setter_general_purpose_counter(unsigned int preset){
//  322   
//  323   BOARD_general_purpose_counter = preset;
BOARD_setter_general_purpose_counter:
        LDR.N    R1,??DataTable12_3
        STR      R0,[R1, #+0]
//  324 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  325 /***********************************************************************************
//  326 *       Descrição       :       Getter para o contador de uso geral
//  327 *       Parametros      :       (nenhum)
//  328 *       Retorno         :       (unsigned int) valor da contagem
//  329 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function BOARD_getter_general_purpose_counter
          CFI NoCalls
        THUMB
//  330 unsigned int BOARD_getter_general_purpose_counter(void){
//  331   
//  332   return BOARD_general_purpose_counter;
BOARD_getter_general_purpose_counter:
        LDR.N    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  333 }
//  334 /***********************************************************************************
//  335 *       Descrição       :       Controla a piscada dos leds da placa de 
//  336 *                               instrução
//  337 *       Parametros      :       nenhum
//  338 *       Retorno         :       nenhum
//  339 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function BOARD_instrucao_leds
        THUMB
//  340 void BOARD_instrucao_leds(void){
BOARD_instrucao_leds:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  341   static unsigned char toggle=0;
//  342   
//  343   if(!BOARD_leds_instrucao)
        LDR.N    R0,??DataTable12_23
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??BOARD_instrucao_leds_0
//  344     return;
//  345   
//  346   toggle ^= 255;
??BOARD_instrucao_leds_1:
        LDR.N    R0,??DataTable12_24
        LDRB     R0,[R0, #+0]
        EORS     R0,R0,#0xFF
        LDR.N    R1,??DataTable12_24
        STRB     R0,[R1, #+0]
//  347   //---------------------------------------------------
//  348   if(BOARD_estado_leds[LED_INSIRA_DINHEIRO] == APAGADO)
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+2]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_2
//  349     LEDS_setter_led(LED_INSIRA_DINHEIRO,0);
        MOVS     R1,#+0
        MOVS     R0,#+2
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_3
//  350   else
//  351     if(BOARD_estado_leds[LED_INSIRA_DINHEIRO] == ACESO)
??BOARD_instrucao_leds_2:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+2]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_4
//  352       LEDS_setter_led(LED_INSIRA_DINHEIRO,1);
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_3
//  353     else
//  354       LEDS_setter_led(LED_INSIRA_DINHEIRO,toggle);
??BOARD_instrucao_leds_4:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+2
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  355   //---------------------------------------------------
//  356   if(BOARD_estado_leds[LED_PEGUE_PACOTE] == APAGADO)
??BOARD_instrucao_leds_3:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+3]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_5
//  357     LEDS_setter_led(LED_PEGUE_PACOTE,0);
        MOVS     R1,#+0
        MOVS     R0,#+3
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_6
//  358   else
//  359     if(BOARD_estado_leds[LED_PEGUE_PACOTE] == ACESO)
??BOARD_instrucao_leds_5:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+3]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_7
//  360       LEDS_setter_led(LED_PEGUE_PACOTE,1);
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_6
//  361     else
//  362       LEDS_setter_led(LED_PEGUE_PACOTE,toggle);  
??BOARD_instrucao_leds_7:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+3
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  363   //---------------------------------------------------
//  364   if(BOARD_estado_leds[LED_MONTE_PACOTE] == APAGADO)
??BOARD_instrucao_leds_6:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_8
//  365     LEDS_setter_led(LED_MONTE_PACOTE,0);
        MOVS     R1,#+0
        MOVS     R0,#+4
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_9
//  366   else
//  367     if(BOARD_estado_leds[LED_MONTE_PACOTE] == ACESO)
??BOARD_instrucao_leds_8:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+4]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_10
//  368       LEDS_setter_led(LED_MONTE_PACOTE,1);
        MOVS     R1,#+1
        MOVS     R0,#+4
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_9
//  369     else
//  370       LEDS_setter_led(LED_MONTE_PACOTE,toggle);      
??BOARD_instrucao_leds_10:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+4
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  371   //---------------------------------------------------
//  372   if(BOARD_estado_leds[LED_INSIRA_PACOTE] == APAGADO)
??BOARD_instrucao_leds_9:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+5]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_11
//  373     LEDS_setter_led(LED_INSIRA_PACOTE,0);
        MOVS     R1,#+0
        MOVS     R0,#+5
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_12
//  374   else
//  375     if(BOARD_estado_leds[LED_INSIRA_PACOTE] == ACESO)
??BOARD_instrucao_leds_11:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+5]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_13
//  376       LEDS_setter_led(LED_INSIRA_PACOTE,1);
        MOVS     R1,#+1
        MOVS     R0,#+5
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_12
//  377     else
//  378       LEDS_setter_led(LED_INSIRA_PACOTE,toggle);   
??BOARD_instrucao_leds_13:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+5
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  379   //---------------------------------------------------
//  380   if(BOARD_estado_leds[LED_FORA_SERVICO] == APAGADO)
??BOARD_instrucao_leds_12:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+6]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_14
//  381     LEDS_setter_led(LED_FORA_SERVICO,0);
        MOVS     R1,#+0
        MOVS     R0,#+6
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_15
//  382   else
//  383     if(BOARD_estado_leds[LED_FORA_SERVICO] == ACESO)
??BOARD_instrucao_leds_14:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+6]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_16
//  384       LEDS_setter_led(LED_FORA_SERVICO,1);
        MOVS     R1,#+1
        MOVS     R0,#+6
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_15
//  385     else
//  386       LEDS_setter_led(LED_FORA_SERVICO,toggle);        
??BOARD_instrucao_leds_16:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+6
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  387    //--------------------------------------------------
//  388    if(BOARD_estado_leds[LED_VERMELHO_GRELHA] == APAGADO)
??BOARD_instrucao_leds_15:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+1]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_17
//  389      LEDS_setter_led(LED_VERMELHO_GRELHA,0);
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_18
//  390    else
//  391      if(BOARD_estado_leds[LED_VERMELHO_GRELHA] == ACESO)
??BOARD_instrucao_leds_17:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+1]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_19
//  392        LEDS_setter_led(LED_VERMELHO_GRELHA,1);
        MOVS     R1,#+1
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_18
//  393      else
//  394        LEDS_setter_led(LED_VERMELHO_GRELHA,toggle);
??BOARD_instrucao_leds_19:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  395    //--------------------------------------------------
//  396    if(BOARD_estado_leds[LED_VERDE_GRELHA] == APAGADO)
??BOARD_instrucao_leds_18:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_20
//  397      LEDS_setter_led(LED_VERDE_GRELHA,0);
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_21
//  398    else
//  399      if(BOARD_estado_leds[LED_VERDE_GRELHA] == ACESO)
??BOARD_instrucao_leds_20:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_22
//  400        LEDS_setter_led(LED_VERDE_GRELHA,1);
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_21
//  401      else
//  402        LEDS_setter_led(LED_VERDE_GRELHA,toggle);
??BOARD_instrucao_leds_22:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  403    //--------------------------------------------------
//  404      
//  405    if(toggle){
??BOARD_instrucao_leds_21:
        LDR.N    R0,??DataTable12_24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_instrucao_leds_23
//  406      LEDS_setter_led(LED_VERMELHO_GRELHA,1);
        MOVS     R1,#+1
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  407      LEDS_setter_led(LED_VERDE_GRELHA,0);
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_24
//  408    }
//  409    else{
//  410      LEDS_setter_led(LED_VERMELHO_GRELHA,0);
??BOARD_instrucao_leds_23:
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  411      LEDS_setter_led(LED_VERDE_GRELHA,1);     
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  412    }
//  413 }
??BOARD_instrucao_leds_24:
??BOARD_instrucao_leds_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??toggle:
        DS8 1
//  414 /***********************************************************************************
//  415 *       Descrição       :       Setter para a variavel que guarda o estado
//  416 *                               dos leds da placa de instrução
//  417 *       Parametros      :       (unsigned char) led
//  418 *                               (eLED_STATE) estado do led
//  419 *       Retorno         :       nenhum
//  420 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function BOARD_setter_led_instrucao
          CFI NoCalls
        THUMB
//  421 void BOARD_setter_led_instrucao(unsigned char led,eLED_STATE estado){
//  422   
//  423   BOARD_estado_leds[led] = estado;    
BOARD_setter_led_instrucao:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable12_25
        STRB     R1,[R0, R2]
//  424 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  425 /***********************************************************************************
//  426 *       Descrição       :       Setter ara a variavel que controla a placa
//  427 *                               de instrução
//  428 *       Parametros      :       (unsigned char) estado
//  429 *       Retorno         :       nenhum
//  430 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function BOARD_liga_placa_instrucao
        THUMB
//  431 void BOARD_liga_placa_instrucao(unsigned char flag){
BOARD_liga_placa_instrucao:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  432   
//  433   for(unsigned char i=0;i<8;i++)
        MOVS     R5,#+0
        B.N      ??BOARD_liga_placa_instrucao_0
//  434     LEDS_setter_led(i,0);
??BOARD_liga_placa_instrucao_1:
        MOVS     R1,#+0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        ADDS     R5,R5,#+1
??BOARD_liga_placa_instrucao_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BLT.N    ??BOARD_liga_placa_instrucao_1
//  435   
//  436   if(!flag)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??BOARD_liga_placa_instrucao_2
//  437     for(unsigned char i=0;i<8;i++)
        MOVS     R0,#+0
        B.N      ??BOARD_liga_placa_instrucao_3
//  438       BOARD_estado_leds[i] = APAGADO;
??BOARD_liga_placa_instrucao_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable12_25
        MOVS     R2,#+0
        STRB     R2,[R0, R1]
        ADDS     R0,R0,#+1
??BOARD_liga_placa_instrucao_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+8
        BLT.N    ??BOARD_liga_placa_instrucao_4
//  439   
//  440   BOARD_leds_instrucao = flag;
??BOARD_liga_placa_instrucao_2:
        LDR.N    R0,??DataTable12_23
        STRB     R4,[R0, #+0]
//  441 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock10
//  442 /***********************************************************************************
//  443 *       Descrição       :       Setter para o contador de propaganda
//  444 *       Parametros      :       nenhum
//  445 *       Retorno         :       nenhum
//  446 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function BOARD_setter_contador_propaganda
          CFI NoCalls
        THUMB
//  447 void BOARD_setter_contador_propaganda(unsigned int contagem){
//  448   
//  449   if(!contagem)
BOARD_setter_contador_propaganda:
        CMP      R0,#+0
        BNE.N    ??BOARD_setter_contador_propaganda_0
//  450     BOARD_contador_propaganda = 60000*BOARD_intervalo_propaganda;
        LDR.N    R0,??DataTable12_19
        LDR      R0,[R0, #+0]
        MOVW     R1,#+60000
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable12_7
        STR      R0,[R1, #+0]
        B.N      ??BOARD_setter_contador_propaganda_1
//  451   else
//  452     BOARD_contador_propaganda = contagem;
??BOARD_setter_contador_propaganda_0:
        LDR.N    R1,??DataTable12_7
        STR      R0,[R1, #+0]
//  453 }
??BOARD_setter_contador_propaganda_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock11
//  454 /***********************************************************************************
//  455 *       Descrição       :       Setter para o tempo da propaganda
//  456 *       Parametros      :       nenhum
//  457 *       Retorno         :       nenhum
//  458 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function BOARD_reset_tempo_propaganda
          CFI NoCalls
        THUMB
//  459 void BOARD_reset_tempo_propaganda(void){
//  460   
//  461   BOARD_contador_propaganda = BOARD_intervalo_propaganda*60000;
BOARD_reset_tempo_propaganda:
        LDR.N    R0,??DataTable12_19
        LDR      R0,[R0, #+0]
        MOVW     R1,#+60000
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable12_7
        STR      R0,[R1, #+0]
//  462 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x2009c020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0x2009c03c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     0x2009c080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     BOARD_general_purpose_counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     PREPARACAO_cnt_preparo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     PREPARACAO_cnt_rampa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     PAGAMENTOS_timeout_pagamento

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     BOARD_contador_propaganda

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_8:
        DC32     BOARD_lock_timer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_9:
        DC32     HD44780_2_tempoRefreshSegundoLCD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_10:
        DC32     PREPARACAO_contador_compensacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_11:
        DC32     APLICACAO_tempo_desumidificador

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_12:
        DC32     SMC_contador

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_13:
        DC32     APLICACAO_tempo_mensagem

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_14:
        DC32     MCS_contadorSemente

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_15:
        DC32     0x2009c034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_16:
        DC32     0x2009c014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_17:
        DC32     ??indice

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_18:
        DC32     BOARD_buffer_entradas_digitais

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_19:
        DC32     BOARD_intervalo_propaganda

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_20:
        DC32     0x2009c038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_21:
        DC32     0x2009c098

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_22:
        DC32     0x2009c09c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_23:
        DC32     BOARD_leds_instrucao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_24:
        DC32     ??toggle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_25:
        DC32     BOARD_estado_leds

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  463 /***********************************************************************************
//  464 *       Fim do arquivo
//  465 ***********************************************************************************/
// 
//    54 bytes in section .bss
//     5 bytes in section .data
//    32 bytes in section .noinit (abs)
// 1 734 bytes in section .text
// 
// 1 734 bytes of CODE memory
//    59 bytes of DATA memory (+ 32 bytes shared)
//
//Errors: none
//Warnings: 1
