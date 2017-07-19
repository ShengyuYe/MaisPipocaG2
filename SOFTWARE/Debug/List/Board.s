///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     19/Jul/2017  13:51:52 /
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
//  135   // Deixa a porta serial RS232
//  136   // habilitada direto
//  137   SERIALMUX_seleciona(SERIALMUX_RS232);
        MOVS     R0,#+0
          CFI FunCall SERIALMUX_seleciona
        BL       SERIALMUX_seleciona
//  138 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_FIO1DIR
        REQUIRE _A_FIO1CLR
        REQUIRE _A_FIO4DIR
//  139 /***********************************************************************************
//  140 *       Descrição       :       Tick de timer para o módulo board
//  141 *       Parametros      :       nenhum
//  142 *       Retorno         :       nenhum
//  143 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function BOARD_timer_tick
        THUMB
//  144 void BOARD_timer_tick(void){
BOARD_timer_tick:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  145   static unsigned char indice=0;  
//  146   unsigned short int temp=0;
        MOVS     R4,#+0
//  147   
//  148   POTENCIA_timerTick();
          CFI FunCall POTENCIA_timerTick
        BL       POTENCIA_timerTick
//  149   TECLADO_timerTick();  
          CFI FunCall TECLADO_timerTick
        BL       TECLADO_timerTick
//  150   RTC_init();
          CFI FunCall RTC_init
        BL       RTC_init
//  151   AA_amostragemAnalogica();
          CFI FunCall AA_amostragemAnalogica
        BL       AA_amostragemAnalogica
//  152   CT_timer_tick();
          CFI FunCall CT_timer_tick
        BL       CT_timer_tick
//  153   PAGAMENTOS_timer_tick();
          CFI FunCall PAGAMENTOS_timer_tick
        BL       PAGAMENTOS_timer_tick
//  154   
//  155   if(BOARD_general_purpose_counter)
        LDR.W    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_0
//  156     BOARD_general_purpose_counter--;
        LDR.W    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_3
        STR      R0,[R1, #+0]
//  157   
//  158   if(PREPARACAO_cnt_preparo)
??BOARD_timer_tick_0:
        LDR.W    R0,??DataTable12_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_1
//  159     PREPARACAO_cnt_preparo--;
        LDR.W    R0,??DataTable12_4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_4
        STR      R0,[R1, #+0]
//  160   
//  161   if(PREPARACAO_cnt_rampa)
??BOARD_timer_tick_1:
        LDR.W    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_2
//  162     PREPARACAO_cnt_rampa--;
        LDR.W    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_5
        STR      R0,[R1, #+0]
//  163   
//  164   if(PAGAMENTOS_timeout_pagamento)
??BOARD_timer_tick_2:
        LDR.W    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_3
//  165     PAGAMENTOS_timeout_pagamento--;
        LDR.W    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_6
        STR      R0,[R1, #+0]
//  166   
//  167   if(BOARD_contador_propaganda)
??BOARD_timer_tick_3:
        LDR.W    R0,??DataTable12_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_4
//  168     BOARD_contador_propaganda--;
        LDR.W    R0,??DataTable12_7
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_7
        STR      R0,[R1, #+0]
//  169   
//  170   if(BOARD_lock_timer)
??BOARD_timer_tick_4:
        LDR.W    R0,??DataTable12_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_5
//  171     BOARD_lock_timer--;
        LDR.W    R0,??DataTable12_8
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_8
        STR      R0,[R1, #+0]
//  172   
//  173   if(HD44780_2_tempoRefreshSegundoLCD)
??BOARD_timer_tick_5:
        LDR.W    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_6
//  174     HD44780_2_tempoRefreshSegundoLCD--;
        LDR.W    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_9
        STR      R0,[R1, #+0]
//  175   
//  176   if(PREPARACAO_contador_compensacao)
??BOARD_timer_tick_6:
        LDR.W    R0,??DataTable12_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_7
//  177     PREPARACAO_contador_compensacao--;
        LDR.W    R0,??DataTable12_10
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_10
        STR      R0,[R1, #+0]
//  178   
//  179   if(APLICACAO_tempo_desumidificador)
??BOARD_timer_tick_7:
        LDR.W    R0,??DataTable12_11
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_8
//  180     APLICACAO_tempo_desumidificador--;
        LDR.W    R0,??DataTable12_11
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_11
        STR      R0,[R1, #+0]
//  181   
//  182   if(SMC_contador)
??BOARD_timer_tick_8:
        LDR.W    R0,??DataTable12_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_9
//  183     SMC_contador--;
        LDR.W    R0,??DataTable12_12
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_12
        STR      R0,[R1, #+0]
//  184   
//  185   if(APLICACAO_tempo_mensagem)
??BOARD_timer_tick_9:
        LDR.W    R0,??DataTable12_13
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_10
//  186     APLICACAO_tempo_mensagem--;
        LDR.W    R0,??DataTable12_13
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_13
        STR      R0,[R1, #+0]
//  187   
//  188   MCS_contadorSemente++;
??BOARD_timer_tick_10:
        LDR.W    R0,??DataTable12_14
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12_14
        STR      R0,[R1, #+0]
//  189   
//  190   // Reedswitch que detecta
//  191   // a posição da dosador do milho
//  192   temp |= GET_SENSOR_DOSE_PIN();
        LDR.W    R0,??DataTable12_15  ;; 0x2009c034
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+15,#+1
        ANDS     R0,R0,#0x1
        EORS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R4,R0,R4
//  193   temp<<=1;
        LSLS     R4,R4,#+1
//  194   
//  195   // Sensor da chave de fim de curso
//  196   // que indica a reserva do papel
//  197   temp |= GET_SENSOR_FIM_PAPEL_PIN();
        LDR.W    R0,??DataTable12_15  ;; 0x2009c034
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+1,#+1
        ANDS     R0,R0,#0x1
        EORS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R4,R0,R4
//  198   temp<<=1;
        LSLS     R4,R4,#+1
//  199   
//  200   // Sensor da barreira óptica
//  201   temp |= GET_BARREIRA_SAIDA_PAPEL_PIN();  
        LDR.W    R0,??DataTable12_16  ;; 0x2009c014
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+25,#+1
        ANDS     R0,R0,#0x1
        EORS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R4,R0,R4
//  202   
//  203   BOARD_buffer_entradas_digitais[indice] = temp;
        LDR.W    R0,??DataTable12_17
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_18
        STRH     R4,[R1, R0, LSL #+1]
//  204   indice = (indice+1) % TAM_BUFFER_SENSORES;
        LDR.W    R0,??DataTable12_17
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+16
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.W    R0,??DataTable12_17
        STRB     R2,[R0, #+0]
//  205 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_FIO1PIN
        REQUIRE _A_FIO0PIN

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??indice:
        DS8 1
//  206 /***********************************************************************************
//  207 *       Descrição       :       Função principal da thread board
//  208 *       Parametros      :       nenhum
//  209 *       Retorno         :       nenhum
//  210 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function BOARD_main
        THUMB
//  211 void BOARD_main(void*pPar){
BOARD_main:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  212   unsigned char toggle=0;
        MOVS     R4,#+0
//  213   unsigned char flag;
//  214   
//  215   PARAMETROS_le(ADR_INTERVALO_TEMPO_PROP,(void*)&BOARD_intervalo_propaganda);
        LDR.W    R1,??DataTable12_19
        MOVS     R0,#+31
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  216   if(BOARD_intervalo_propaganda>60)
        LDR.W    R0,??DataTable12_19
        LDR      R0,[R0, #+0]
        CMP      R0,#+61
        BCC.N    ??BOARD_main_0
//  217     BOARD_intervalo_propaganda = 60;
        LDR.W    R0,??DataTable12_19
        MOVS     R1,#+60
        STR      R1,[R0, #+0]
//  218   
//  219   PARAMETROS_le(ADR_FLAG_FITA_LED,(void*)&flag);
??BOARD_main_0:
        ADD      R1,SP,#+0
        MOVS     R0,#+33
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
        B.N      ??BOARD_main_1
//  220   
//  221   for(;;){
//  222   
//  223     toggle ^= 255;
//  224     
//  225     if(flag){
//  226       if(toggle){
//  227         SET_LED_STATUS(1);
//  228         SET_FITA_LED_01(1);
//  229         SET_FITA_LED_02(0);
//  230       }
//  231       else{           
//  232         SET_LED_STATUS(0);
//  233         SET_FITA_LED_01(0);
//  234         SET_FITA_LED_02(1);      
//  235       }
//  236     }
//  237     else{
//  238       SET_FITA_LED_01(0);      
//  239       SET_FITA_LED_02(0);
//  240       SET_LED_STATUS(toggle);
??BOARD_main_2:
        LDR.W    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  241     }
//  242     
//  243     vTaskDelay(250);       
??BOARD_main_3:
        MOVS     R0,#+250
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  244       
//  245     BOARD_instrucao_leds();
          CFI FunCall BOARD_instrucao_leds
        BL       BOARD_instrucao_leds
//  246     
//  247     // Roda a propaganda no intervalo
//  248     // de tempo programaddo
//  249     if(!BOARD_contador_propaganda){      
        LDR.W    R0,??DataTable12_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??BOARD_main_1
//  250       if(BOARD_intervalo_propaganda){
        LDR.W    R0,??DataTable12_19
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_main_4
//  251         PLAYERWAVE_iniciaMusica(AUDIO_PROPAGANDA,0);        
        MOVS     R1,#+0
        MOVS     R0,#+3
          CFI FunCall PLAYERWAVE_iniciaMusica
        BL       PLAYERWAVE_iniciaMusica
//  252       }
//  253       BOARD_contador_propaganda = BOARD_intervalo_propaganda*60000;
??BOARD_main_4:
        LDR.W    R0,??DataTable12_19
        LDR      R0,[R0, #+0]
        MOVW     R1,#+60000
        MULS     R0,R1,R0
        LDR.W    R1,??DataTable12_7
        STR      R0,[R1, #+0]
//  254     }
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
//  255     
//  256   }// Fim for(;;)
//  257 }
//  258 /***********************************************************************************
//  259 *       Descrição       :       Verifica se um dos sinais está ativo
//  260 *       Parametros      :       (unsigned char) bit
//  261 *       Retorno         :       (unsigned char) maior do que zero
//  262 *                               se a entrada estiver acionada
//  263 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function BOARD_get_sinal
          CFI NoCalls
        THUMB
//  264 unsigned char BOARD_get_sinal(eSINAL sinal){
BOARD_get_sinal:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  265   unsigned char contador=0;  
        MOVS     R1,#+0
//  266   
//  267   for(unsigned char i=0;i<TAM_BUFFER_SENSORES;i++)
        MOVS     R2,#+0
        B.N      ??BOARD_get_sinal_0
//  268     if(BOARD_buffer_entradas_digitais[i]&(0x01<<sinal))
??BOARD_get_sinal_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.W    R3,??DataTable12_18
        LDRH     R3,[R3, R2, LSL #+1]
        MOVS     R4,#+1
        LSLS     R4,R4,R0
        TST      R3,R4
        BEQ.N    ??BOARD_get_sinal_2
//  269       contador++;
        ADDS     R1,R1,#+1
??BOARD_get_sinal_2:
        ADDS     R2,R2,#+1
??BOARD_get_sinal_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+16
        BLT.N    ??BOARD_get_sinal_1
//  270   
//  271   if(contador>(TAM_BUFFER_SENSORES>>1))
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+9
        BLT.N    ??BOARD_get_sinal_3
//  272     return 1;
        MOVS     R0,#+1
        B.N      ??BOARD_get_sinal_4
//  273   
//  274   return 0;
??BOARD_get_sinal_3:
        MOVS     R0,#+0
??BOARD_get_sinal_4:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  275 }
//  276 /***********************************************************************************
//  277 *       Descrição       :       Liga o mosfet da saída de embalagem
//  278 *       Parametros      :       (unsigned char) valor
//  279 *       Retorno         :       nenhum
//  280 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function BOARD_set_motor_embalagem
          CFI NoCalls
        THUMB
//  281 void BOARD_set_motor_embalagem(unsigned char flag){
//  282   
//  283   SET_MOTOR_EMBALAGEM_PIN(flag);
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
//  284 }
??BOARD_set_motor_embalagem_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO1CLR
//  285 /***********************************************************************************
//  286 *       Descrição       :       Setter para o controle do motor da embalagem
//  287 *       Parametros      :       (eMOTOR_DOSE) estado do motor
//  288 *       Retorno         :       nenhum
//  289 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function BOARD_set_motor_dose
        THUMB
//  290 void BOARD_set_motor_dose(eMOTOR_DOSE sentido){
BOARD_set_motor_dose:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  291   
//  292   switch(sentido){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BOARD_set_motor_dose_0
        CMP      R0,#+2
        BEQ.N    ??BOARD_set_motor_dose_1
        BCC.N    ??BOARD_set_motor_dose_2
        B.N      ??BOARD_set_motor_dose_3
//  293     case PARADO:  
//  294          SET_HIGH_SIDE_ESQUERDA(0);
??BOARD_set_motor_dose_0:
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  295          SET_LOW_SIDE_ESQUERDA(0);
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  296          SET_HIGH_SIDE_DIREITA(0);
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  297          SET_LOW_SIDE_DIREITA(0);
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  298          break;
        B.N      ??BOARD_set_motor_dose_3
//  299     case DOSAR:
//  300          SET_HIGH_SIDE_DIREITA(0);
??BOARD_set_motor_dose_2:
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  301          SET_LOW_SIDE_ESQUERDA(0);
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  302          vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  303          SET_HIGH_SIDE_ESQUERDA(1);
        LDR.N    R0,??DataTable12_20  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable12_20  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  304          SET_LOW_SIDE_DIREITA(1);
        LDR.N    R0,??DataTable12_20  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable12_20  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  305          break;
        B.N      ??BOARD_set_motor_dose_3
//  306     case REVERTER:
//  307          SET_HIGH_SIDE_ESQUERDA(0);
??BOARD_set_motor_dose_1:
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  308          SET_LOW_SIDE_DIREITA(0);     
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  309          vTaskDelay(50);         
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  310          SET_HIGH_SIDE_DIREITA(1);
        LDR.N    R0,??DataTable12_20  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40000000
        LDR.N    R1,??DataTable12_20  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  311          SET_LOW_SIDE_ESQUERDA(1);         
        LDR.N    R0,??DataTable12_20  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.N    R1,??DataTable12_20  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  312          break;
//  313   }
//  314 }
??BOARD_set_motor_dose_3:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
        REQUIRE _A_FIO1CLR
        REQUIRE _A_FIO1SET
//  315 /***********************************************************************************
//  316 *       Descrição       :       Setter para o contador de uso geral
//  317 *       Parametros      :       (unsigned int) valor de preset
//  318 *       Retorno         :       nenhum
//  319 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function BOARD_setter_general_purpose_counter
          CFI NoCalls
        THUMB
//  320 void BOARD_setter_general_purpose_counter(unsigned int preset){
//  321   
//  322   BOARD_general_purpose_counter = preset;
BOARD_setter_general_purpose_counter:
        LDR.N    R1,??DataTable12_3
        STR      R0,[R1, #+0]
//  323 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  324 /***********************************************************************************
//  325 *       Descrição       :       Getter para o contador de uso geral
//  326 *       Parametros      :       (nenhum)
//  327 *       Retorno         :       (unsigned int) valor da contagem
//  328 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function BOARD_getter_general_purpose_counter
          CFI NoCalls
        THUMB
//  329 unsigned int BOARD_getter_general_purpose_counter(void){
//  330   
//  331   return BOARD_general_purpose_counter;
BOARD_getter_general_purpose_counter:
        LDR.N    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  332 }
//  333 /***********************************************************************************
//  334 *       Descrição       :       Controla a piscada dos leds da placa de 
//  335 *                               instrução
//  336 *       Parametros      :       nenhum
//  337 *       Retorno         :       nenhum
//  338 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function BOARD_instrucao_leds
        THUMB
//  339 void BOARD_instrucao_leds(void){
BOARD_instrucao_leds:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  340   static unsigned char toggle=0;
//  341   
//  342   if(!BOARD_leds_instrucao)
        LDR.N    R0,??DataTable12_23
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??BOARD_instrucao_leds_0
//  343     return;
//  344   
//  345   toggle ^= 255;
??BOARD_instrucao_leds_1:
        LDR.N    R0,??DataTable12_24
        LDRB     R0,[R0, #+0]
        EORS     R0,R0,#0xFF
        LDR.N    R1,??DataTable12_24
        STRB     R0,[R1, #+0]
//  346   //---------------------------------------------------
//  347   if(BOARD_estado_leds[LED_INSIRA_DINHEIRO] == APAGADO)
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+2]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_2
//  348     LEDS_setter_led(LED_INSIRA_DINHEIRO,0);
        MOVS     R1,#+0
        MOVS     R0,#+2
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_3
//  349   else
//  350     if(BOARD_estado_leds[LED_INSIRA_DINHEIRO] == ACESO)
??BOARD_instrucao_leds_2:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+2]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_4
//  351       LEDS_setter_led(LED_INSIRA_DINHEIRO,1);
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_3
//  352     else
//  353       LEDS_setter_led(LED_INSIRA_DINHEIRO,toggle);
??BOARD_instrucao_leds_4:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+2
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  354   //---------------------------------------------------
//  355   if(BOARD_estado_leds[LED_PEGUE_PACOTE] == APAGADO)
??BOARD_instrucao_leds_3:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+3]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_5
//  356     LEDS_setter_led(LED_PEGUE_PACOTE,0);
        MOVS     R1,#+0
        MOVS     R0,#+3
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_6
//  357   else
//  358     if(BOARD_estado_leds[LED_PEGUE_PACOTE] == ACESO)
??BOARD_instrucao_leds_5:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+3]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_7
//  359       LEDS_setter_led(LED_PEGUE_PACOTE,1);
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_6
//  360     else
//  361       LEDS_setter_led(LED_PEGUE_PACOTE,toggle);  
??BOARD_instrucao_leds_7:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+3
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  362   //---------------------------------------------------
//  363   if(BOARD_estado_leds[LED_MONTE_PACOTE] == APAGADO)
??BOARD_instrucao_leds_6:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_8
//  364     LEDS_setter_led(LED_MONTE_PACOTE,0);
        MOVS     R1,#+0
        MOVS     R0,#+4
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_9
//  365   else
//  366     if(BOARD_estado_leds[LED_MONTE_PACOTE] == ACESO)
??BOARD_instrucao_leds_8:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+4]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_10
//  367       LEDS_setter_led(LED_MONTE_PACOTE,1);
        MOVS     R1,#+1
        MOVS     R0,#+4
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_9
//  368     else
//  369       LEDS_setter_led(LED_MONTE_PACOTE,toggle);      
??BOARD_instrucao_leds_10:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+4
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  370   //---------------------------------------------------
//  371   if(BOARD_estado_leds[LED_INSIRA_PACOTE] == APAGADO)
??BOARD_instrucao_leds_9:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+5]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_11
//  372     LEDS_setter_led(LED_INSIRA_PACOTE,0);
        MOVS     R1,#+0
        MOVS     R0,#+5
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_12
//  373   else
//  374     if(BOARD_estado_leds[LED_INSIRA_PACOTE] == ACESO)
??BOARD_instrucao_leds_11:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+5]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_13
//  375       LEDS_setter_led(LED_INSIRA_PACOTE,1);
        MOVS     R1,#+1
        MOVS     R0,#+5
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_12
//  376     else
//  377       LEDS_setter_led(LED_INSIRA_PACOTE,toggle);   
??BOARD_instrucao_leds_13:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+5
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  378   //---------------------------------------------------
//  379   if(BOARD_estado_leds[LED_FORA_SERVICO] == APAGADO)
??BOARD_instrucao_leds_12:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+6]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_14
//  380     LEDS_setter_led(LED_FORA_SERVICO,0);
        MOVS     R1,#+0
        MOVS     R0,#+6
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_15
//  381   else
//  382     if(BOARD_estado_leds[LED_FORA_SERVICO] == ACESO)
??BOARD_instrucao_leds_14:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+6]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_16
//  383       LEDS_setter_led(LED_FORA_SERVICO,1);
        MOVS     R1,#+1
        MOVS     R0,#+6
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_15
//  384     else
//  385       LEDS_setter_led(LED_FORA_SERVICO,toggle);        
??BOARD_instrucao_leds_16:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+6
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  386    //--------------------------------------------------
//  387    if(BOARD_estado_leds[LED_VERMELHO_GRELHA] == APAGADO)
??BOARD_instrucao_leds_15:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+1]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_17
//  388      LEDS_setter_led(LED_VERMELHO_GRELHA,0);
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_18
//  389    else
//  390      if(BOARD_estado_leds[LED_VERMELHO_GRELHA] == ACESO)
??BOARD_instrucao_leds_17:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+1]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_19
//  391        LEDS_setter_led(LED_VERMELHO_GRELHA,1);
        MOVS     R1,#+1
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_18
//  392      else
//  393        LEDS_setter_led(LED_VERMELHO_GRELHA,toggle);
??BOARD_instrucao_leds_19:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  394    //--------------------------------------------------
//  395    if(BOARD_estado_leds[LED_VERDE_GRELHA] == APAGADO)
??BOARD_instrucao_leds_18:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_20
//  396      LEDS_setter_led(LED_VERDE_GRELHA,0);
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_21
//  397    else
//  398      if(BOARD_estado_leds[LED_VERDE_GRELHA] == ACESO)
??BOARD_instrucao_leds_20:
        LDR.N    R0,??DataTable12_25
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_22
//  399        LEDS_setter_led(LED_VERDE_GRELHA,1);
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_21
//  400      else
//  401        LEDS_setter_led(LED_VERDE_GRELHA,toggle);
??BOARD_instrucao_leds_22:
        LDR.N    R0,??DataTable12_24
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  402    //--------------------------------------------------
//  403      
//  404    if(toggle){
??BOARD_instrucao_leds_21:
        LDR.N    R0,??DataTable12_24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_instrucao_leds_23
//  405      LEDS_setter_led(LED_VERMELHO_GRELHA,1);
        MOVS     R1,#+1
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  406      LEDS_setter_led(LED_VERDE_GRELHA,0);
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_24
//  407    }
//  408    else{
//  409      LEDS_setter_led(LED_VERMELHO_GRELHA,0);
??BOARD_instrucao_leds_23:
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  410      LEDS_setter_led(LED_VERDE_GRELHA,1);     
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  411    }
//  412 }
??BOARD_instrucao_leds_24:
??BOARD_instrucao_leds_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??toggle:
        DS8 1
//  413 /***********************************************************************************
//  414 *       Descrição       :       Setter para a variavel que guarda o estado
//  415 *                               dos leds da placa de instrução
//  416 *       Parametros      :       (unsigned char) led
//  417 *                               (eLED_STATE) estado do led
//  418 *       Retorno         :       nenhum
//  419 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function BOARD_setter_led_instrucao
          CFI NoCalls
        THUMB
//  420 void BOARD_setter_led_instrucao(unsigned char led,eLED_STATE estado){
//  421   
//  422   BOARD_estado_leds[led] = estado;    
BOARD_setter_led_instrucao:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable12_25
        STRB     R1,[R0, R2]
//  423 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  424 /***********************************************************************************
//  425 *       Descrição       :       Setter ara a variavel que controla a placa
//  426 *                               de instrução
//  427 *       Parametros      :       (unsigned char) estado
//  428 *       Retorno         :       nenhum
//  429 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function BOARD_liga_placa_instrucao
        THUMB
//  430 void BOARD_liga_placa_instrucao(unsigned char flag){
BOARD_liga_placa_instrucao:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  431   
//  432   for(unsigned char i=0;i<8;i++)
        MOVS     R5,#+0
        B.N      ??BOARD_liga_placa_instrucao_0
//  433     LEDS_setter_led(i,0);
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
//  434   
//  435   if(!flag)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??BOARD_liga_placa_instrucao_2
//  436     for(unsigned char i=0;i<8;i++)
        MOVS     R0,#+0
        B.N      ??BOARD_liga_placa_instrucao_3
//  437       BOARD_estado_leds[i] = APAGADO;
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
//  438   
//  439   BOARD_leds_instrucao = flag;
??BOARD_liga_placa_instrucao_2:
        LDR.N    R0,??DataTable12_23
        STRB     R4,[R0, #+0]
//  440 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock10
//  441 /***********************************************************************************
//  442 *       Descrição       :       Setter para o contador de propaganda
//  443 *       Parametros      :       nenhum
//  444 *       Retorno         :       nenhum
//  445 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function BOARD_setter_contador_propaganda
          CFI NoCalls
        THUMB
//  446 void BOARD_setter_contador_propaganda(unsigned int contagem){
//  447   
//  448   if(!contagem)
BOARD_setter_contador_propaganda:
        CMP      R0,#+0
        BNE.N    ??BOARD_setter_contador_propaganda_0
//  449     BOARD_contador_propaganda = 60000*BOARD_intervalo_propaganda;
        LDR.N    R0,??DataTable12_19
        LDR      R0,[R0, #+0]
        MOVW     R1,#+60000
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable12_7
        STR      R0,[R1, #+0]
        B.N      ??BOARD_setter_contador_propaganda_1
//  450   else
//  451     BOARD_contador_propaganda = contagem;
??BOARD_setter_contador_propaganda_0:
        LDR.N    R1,??DataTable12_7
        STR      R0,[R1, #+0]
//  452 }
??BOARD_setter_contador_propaganda_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock11
//  453 /***********************************************************************************
//  454 *       Descrição       :       Setter para o tempo da propaganda
//  455 *       Parametros      :       nenhum
//  456 *       Retorno         :       nenhum
//  457 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function BOARD_reset_tempo_propaganda
          CFI NoCalls
        THUMB
//  458 void BOARD_reset_tempo_propaganda(void){
//  459   
//  460   BOARD_contador_propaganda = BOARD_intervalo_propaganda*60000;
BOARD_reset_tempo_propaganda:
        LDR.N    R0,??DataTable12_19
        LDR      R0,[R0, #+0]
        MOVW     R1,#+60000
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable12_7
        STR      R0,[R1, #+0]
//  461 }
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
//  462 /***********************************************************************************
//  463 *       Fim do arquivo
//  464 ***********************************************************************************/
// 
//    54 bytes in section .bss
//     5 bytes in section .data
//    32 bytes in section .noinit (abs)
// 1 730 bytes in section .text
// 
// 1 730 bytes of CODE memory
//    59 bytes of DATA memory (+ 32 bytes shared)
//
//Errors: none
//Warnings: none
