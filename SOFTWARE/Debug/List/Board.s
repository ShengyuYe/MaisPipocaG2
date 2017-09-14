///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     14/Sep/2017  13:24:44 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Board\Board.c     /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Board\Board.c     /
//                    -lC C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\   /
//                    -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\   /
//                    -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Obj\     /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\Board. /
//                    s                                                       /
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
        EXTERN HD44780_tempoRefreshSegundoLCD
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
        EXTERN PREPARACAO_compensador
        EXTERN PREPARACAO_contador_compensacao
        EXTERN RTC_init
        EXTERN SERIALMUX_ini
        EXTERN SERIALMUX_seleciona
        EXTERN SMC_contador
        EXTERN TECLADO_timerTick
        EXTERN vTaskDelay

        PUBLIC APLICACAO_tempo_compensacao
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Board\Board.c
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

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   97 unsigned int APLICACAO_tempo_compensacao;
APLICACAO_tempo_compensacao:
        DS8 4
//   98 extern unsigned int MCS_contadorSemente;
//   99 extern unsigned int HD44780_2_tempoRefreshSegundoLCD;
//  100 extern unsigned int PREPARACAO_contador_compensacao;
//  101 extern unsigned int APLICACAO_tempo_desumidificador;
//  102 extern unsigned int SMC_contador;
//  103 extern unsigned int APLICACAO_tempo_mensagem;
//  104 extern unsigned int PREPARACAO_compensador;
//  105 extern unsigned int HD44780_tempoRefreshSegundoLCD;
//  106 
//  107 /***********************************************************************************
//  108 *       Funções locais
//  109 ***********************************************************************************/
//  110 void BOARD_instrucao_leds(void);
//  111 
//  112 /***********************************************************************************
//  113 *       Implementação das funções
//  114 ***********************************************************************************/
//  115 
//  116 /***********************************************************************************
//  117 *       Descrição       :       Inicialização da camada board
//  118 *       Parametros      :       nenhum
//  119 *       Retorno         :       nenhum
//  120 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function BOARD_ini
        THUMB
//  121 void BOARD_ini(void){  
BOARD_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  122   INI_MOTOR_EMBALAGEM_PIN();
        LDR.W    R0,??DataTable12  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable12  ;; 0x2009c020
        STR      R0,[R1, #+0]
//  123     
//  124   CCTALK_ini();
          CFI FunCall CCTALK_ini
        BL       CCTALK_ini
//  125   //PAGAMENTOS_ini();
//  126   PAGAMENTOS_set_bloqueio(1);
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  127   BOARD_set_motor_dose(PARADO);
        MOVS     R0,#+0
          CFI FunCall BOARD_set_motor_dose
        BL       BOARD_set_motor_dose
//  128   INI_EMBALAGEM_PINS();
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
//  129   INI_MOTOR_EMBALAGEM_PIN();
        LDR.W    R0,??DataTable12  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable12  ;; 0x2009c020
        STR      R0,[R1, #+0]
//  130   INI_LED_PINS();    
        LDR.W    R0,??DataTable12  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12  ;; 0x2009c020
        STR      R0,[R1, #+0]
//  131   PARAMETROS_ini();
          CFI FunCall PARAMETROS_ini
        BL       PARAMETROS_ini
//  132   AA_ini();
          CFI FunCall AA_ini
        BL       AA_ini
//  133   POTENCIA_ini();
          CFI FunCall POTENCIA_ini
        BL       POTENCIA_ini
//  134   CT_ini();
          CFI FunCall CT_ini
        BL       CT_ini
//  135   LEDS_ini();
          CFI FunCall LEDS_ini
        BL       LEDS_ini
//  136   MDB_ini();
          CFI FunCall MDB_ini
        BL       MDB_ini
//  137   FITA_LED_INI();
        LDR.W    R0,??DataTable12_2  ;; 0x2009c080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x30000000
        LDR.W    R1,??DataTable12_2  ;; 0x2009c080
        STR      R0,[R1, #+0]
//  138   PLAYERWAVE_ini();
          CFI FunCall PLAYERWAVE_ini
        BL       PLAYERWAVE_ini
//  139   SERIALMUX_ini();
          CFI FunCall SERIALMUX_ini
        BL       SERIALMUX_ini
//  140   // Deixa a porta serial RS232
//  141   // habilitada direto
//  142   SERIALMUX_seleciona(SERIALMUX_USB);
        MOVS     R0,#+2
          CFI FunCall SERIALMUX_seleciona
        BL       SERIALMUX_seleciona
//  143   PAGAMENTOS_ini();  
          CFI FunCall PAGAMENTOS_ini
        BL       PAGAMENTOS_ini
//  144 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_FIO1DIR
        REQUIRE _A_FIO1CLR
        REQUIRE _A_FIO4DIR
//  145 /***********************************************************************************
//  146 *       Descrição       :       Tick de timer para o módulo board
//  147 *       Parametros      :       nenhum
//  148 *       Retorno         :       nenhum
//  149 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function BOARD_timer_tick
        THUMB
//  150 void BOARD_timer_tick(void){
BOARD_timer_tick:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  151   static unsigned char indice=0;  
//  152   unsigned short int temp=0;
        MOVS     R4,#+0
//  153   
//  154   POTENCIA_timerTick();
          CFI FunCall POTENCIA_timerTick
        BL       POTENCIA_timerTick
//  155   TECLADO_timerTick();  
          CFI FunCall TECLADO_timerTick
        BL       TECLADO_timerTick
//  156   RTC_init();
          CFI FunCall RTC_init
        BL       RTC_init
//  157   AA_amostragemAnalogica();
          CFI FunCall AA_amostragemAnalogica
        BL       AA_amostragemAnalogica
//  158   CT_timer_tick();
          CFI FunCall CT_timer_tick
        BL       CT_timer_tick
//  159   PAGAMENTOS_timer_tick();
          CFI FunCall PAGAMENTOS_timer_tick
        BL       PAGAMENTOS_timer_tick
//  160   
//  161   if(BOARD_general_purpose_counter)
        LDR.W    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_0
//  162     BOARD_general_purpose_counter--;
        LDR.W    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_3
        STR      R0,[R1, #+0]
//  163   
//  164   if(PREPARACAO_cnt_preparo)
??BOARD_timer_tick_0:
        LDR.W    R0,??DataTable12_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_1
//  165     PREPARACAO_cnt_preparo--;
        LDR.W    R0,??DataTable12_4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_4
        STR      R0,[R1, #+0]
//  166   
//  167   if(PREPARACAO_cnt_rampa)
??BOARD_timer_tick_1:
        LDR.W    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_2
//  168     PREPARACAO_cnt_rampa--;
        LDR.W    R0,??DataTable12_5
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_5
        STR      R0,[R1, #+0]
//  169   
//  170   if(PAGAMENTOS_timeout_pagamento)
??BOARD_timer_tick_2:
        LDR.W    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_3
//  171     PAGAMENTOS_timeout_pagamento--;
        LDR.W    R0,??DataTable12_6
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_6
        STR      R0,[R1, #+0]
//  172   
//  173   if(BOARD_contador_propaganda)
??BOARD_timer_tick_3:
        LDR.W    R0,??DataTable12_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_4
//  174     BOARD_contador_propaganda--;
        LDR.W    R0,??DataTable12_7
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_7
        STR      R0,[R1, #+0]
//  175   
//  176   if(BOARD_lock_timer)
??BOARD_timer_tick_4:
        LDR.W    R0,??DataTable12_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_5
//  177     BOARD_lock_timer--;
        LDR.W    R0,??DataTable12_8
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_8
        STR      R0,[R1, #+0]
//  178   
//  179   if(HD44780_2_tempoRefreshSegundoLCD)
??BOARD_timer_tick_5:
        LDR.W    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_6
//  180     HD44780_2_tempoRefreshSegundoLCD--;
        LDR.W    R0,??DataTable12_9
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_9
        STR      R0,[R1, #+0]
//  181   
//  182   if(PREPARACAO_contador_compensacao)
??BOARD_timer_tick_6:
        LDR.W    R0,??DataTable12_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_7
//  183     PREPARACAO_contador_compensacao--;
        LDR.W    R0,??DataTable12_10
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_10
        STR      R0,[R1, #+0]
//  184   
//  185   if(APLICACAO_tempo_desumidificador)
??BOARD_timer_tick_7:
        LDR.W    R0,??DataTable12_11
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_8
//  186     APLICACAO_tempo_desumidificador--;
        LDR.W    R0,??DataTable12_11
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_11
        STR      R0,[R1, #+0]
//  187   
//  188   if(SMC_contador)
??BOARD_timer_tick_8:
        LDR.W    R0,??DataTable12_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_9
//  189     SMC_contador--;
        LDR.W    R0,??DataTable12_12
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_12
        STR      R0,[R1, #+0]
//  190   
//  191   if(APLICACAO_tempo_mensagem)
??BOARD_timer_tick_9:
        LDR.W    R0,??DataTable12_13
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_10
//  192     APLICACAO_tempo_mensagem--;
        LDR.W    R0,??DataTable12_13
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_13
        STR      R0,[R1, #+0]
//  193   
//  194   if(HD44780_tempoRefreshSegundoLCD)
??BOARD_timer_tick_10:
        LDR.W    R0,??DataTable12_14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_11
//  195     HD44780_tempoRefreshSegundoLCD--;
        LDR.W    R0,??DataTable12_14
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_14
        STR      R0,[R1, #+0]
//  196   
//  197   if(!APLICACAO_tempo_compensacao){
??BOARD_timer_tick_11:
        LDR.W    R0,??DataTable12_15
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??BOARD_timer_tick_12
//  198     APLICACAO_tempo_compensacao = 3*60*1000;
        LDR.W    R0,??DataTable12_15
        LDR.W    R1,??DataTable12_16  ;; 0x2bf20
        STR      R1,[R0, #+0]
//  199     if(PREPARACAO_compensador)
        LDR.W    R0,??DataTable12_17
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_timer_tick_13
//  200       PREPARACAO_compensador--;
        LDR.W    R0,??DataTable12_17
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_17
        STR      R0,[R1, #+0]
        B.N      ??BOARD_timer_tick_13
//  201   }
//  202   else
//  203     APLICACAO_tempo_compensacao--;
??BOARD_timer_tick_12:
        LDR.W    R0,??DataTable12_15
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12_15
        STR      R0,[R1, #+0]
//  204   
//  205   MCS_contadorSemente++;
??BOARD_timer_tick_13:
        LDR.W    R0,??DataTable12_18
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12_18
        STR      R0,[R1, #+0]
//  206   
//  207   // Reedswitch que detecta
//  208   // a posição da dosador do milho
//  209   temp |= GET_SENSOR_DOSE_PIN();
        LDR.W    R0,??DataTable12_19  ;; 0x2009c034
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+15,#+1
        ANDS     R0,R0,#0x1
        EORS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R4,R0,R4
//  210   temp<<=1;
        LSLS     R4,R4,#+1
//  211   
//  212   // Sensor da chave de fim de curso
//  213   // que indica a reserva do papel
//  214   temp |= GET_SENSOR_FIM_PAPEL_PIN();
        LDR.W    R0,??DataTable12_19  ;; 0x2009c034
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+1,#+1
        ANDS     R0,R0,#0x1
        EORS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R4,R0,R4
//  215   temp<<=1;
        LSLS     R4,R4,#+1
//  216   
//  217   // Sensor da barreira óptica
//  218   temp |= GET_BARREIRA_SAIDA_PAPEL_PIN();  
        LDR.W    R0,??DataTable12_20  ;; 0x2009c014
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+25,#+1
        ANDS     R0,R0,#0x1
        EORS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R4,R0,R4
//  219   
//  220   BOARD_buffer_entradas_digitais[indice] = temp;
        LDR.W    R0,??DataTable12_21
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable12_22
        STRH     R4,[R1, R0, LSL #+1]
//  221   indice = (indice+1) % TAM_BUFFER_SENSORES;
        LDR.W    R0,??DataTable12_21
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+16
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.W    R0,??DataTable12_21
        STRB     R2,[R0, #+0]
//  222 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_FIO1PIN
        REQUIRE _A_FIO0PIN

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??indice:
        DS8 1
//  223 /***********************************************************************************
//  224 *       Descrição       :       Função principal da thread board
//  225 *       Parametros      :       nenhum
//  226 *       Retorno         :       nenhum
//  227 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function BOARD_main
        THUMB
//  228 void BOARD_main(void*pPar){
BOARD_main:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  229   unsigned char toggle=0;
        MOVS     R5,#+0
//  230   unsigned char flag;
//  231   
//  232   PARAMETROS_le(ADR_INTERVALO_TEMPO_PROP,(void*)&BOARD_intervalo_propaganda);
        LDR.W    R1,??DataTable12_23
        MOVS     R0,#+31
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  233   if(BOARD_intervalo_propaganda>60)
        LDR.W    R0,??DataTable12_23
        LDR      R0,[R0, #+0]
        CMP      R0,#+61
        BCC.N    ??BOARD_main_0
//  234     BOARD_intervalo_propaganda = 60;
        LDR.W    R0,??DataTable12_23
        MOVS     R1,#+60
        STR      R1,[R0, #+0]
//  235   
//  236   PARAMETROS_le(ADR_FLAG_FITA_LED,(void*)&flag);
??BOARD_main_0:
        ADD      R1,SP,#+0
        MOVS     R0,#+33
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  237   
//  238   for(;;){
//  239   
//  240     toggle ^= 255;
??BOARD_main_1:
        EORS     R5,R5,#0xFF
//  241     
//  242     if(flag){
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_main_2
//  243       if(toggle){
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??BOARD_main_3
//  244         SET_LED_STATUS(1);
        LDR.W    R0,??DataTable12_24  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12_24  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  245         SET_FITA_LED_01(1);
        LDR.W    R0,??DataTable12_25  ;; 0x2009c098
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.W    R1,??DataTable12_25  ;; 0x2009c098
        STR      R0,[R1, #+0]
//  246         SET_FITA_LED_02(0);
        LDR.W    R0,??DataTable12_26  ;; 0x2009c09c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.W    R1,??DataTable12_26  ;; 0x2009c09c
        STR      R0,[R1, #+0]
        B.N      ??BOARD_main_4
//  247       }
//  248       else{           
//  249         SET_LED_STATUS(0);
??BOARD_main_3:
        LDR.W    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  250         SET_FITA_LED_01(0);
        LDR.W    R0,??DataTable12_26  ;; 0x2009c09c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.W    R1,??DataTable12_26  ;; 0x2009c09c
        STR      R0,[R1, #+0]
//  251         SET_FITA_LED_02(1);      
        LDR.W    R0,??DataTable12_25  ;; 0x2009c098
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.W    R1,??DataTable12_25  ;; 0x2009c098
        STR      R0,[R1, #+0]
        B.N      ??BOARD_main_4
//  252       }
//  253     }
//  254     else{
//  255       SET_FITA_LED_01(0);      
??BOARD_main_2:
        LDR.W    R0,??DataTable12_26  ;; 0x2009c09c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.W    R1,??DataTable12_26  ;; 0x2009c09c
        STR      R0,[R1, #+0]
//  256       SET_FITA_LED_02(0);
        LDR.W    R0,??DataTable12_26  ;; 0x2009c09c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.W    R1,??DataTable12_26  ;; 0x2009c09c
        STR      R0,[R1, #+0]
//  257       SET_LED_STATUS(toggle);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??BOARD_main_5
        LDR.W    R0,??DataTable12_24  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12_24  ;; 0x2009c038
        STR      R0,[R1, #+0]
        B.N      ??BOARD_main_4
??BOARD_main_5:
        LDR.W    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  258     }
//  259     
//  260     vTaskDelay(250);       
??BOARD_main_4:
        MOVS     R0,#+250
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  261       
//  262     BOARD_instrucao_leds();
          CFI FunCall BOARD_instrucao_leds
        BL       BOARD_instrucao_leds
//  263     
//  264     // Roda a propaganda no intervalo
//  265     // de tempo programaddo
//  266     if(!BOARD_contador_propaganda){      
        LDR.W    R0,??DataTable12_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??BOARD_main_1
//  267       if(BOARD_intervalo_propaganda){
        LDR.W    R0,??DataTable12_23
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_main_6
//  268         PLAYERWAVE_iniciaMusica(AUDIO_PROPAGANDA,0);        
        MOVS     R1,#+0
        MOVS     R0,#+3
          CFI FunCall PLAYERWAVE_iniciaMusica
        BL       PLAYERWAVE_iniciaMusica
//  269       }
//  270       BOARD_contador_propaganda = BOARD_intervalo_propaganda*60000;
??BOARD_main_6:
        LDR.W    R0,??DataTable12_23
        LDR      R0,[R0, #+0]
        MOVW     R1,#+60000
        MULS     R0,R1,R0
        LDR.W    R1,??DataTable12_7
        STR      R0,[R1, #+0]
        B.N      ??BOARD_main_1
          CFI EndBlock cfiBlock2
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO4SET
        REQUIRE _A_FIO4CLR
        REQUIRE _A_FIO1CLR
//  271     }
//  272     
//  273   }// Fim for(;;)
//  274 }
//  275 /***********************************************************************************
//  276 *       Descrição       :       Verifica se um dos sinais está ativo
//  277 *       Parametros      :       (unsigned char) bit
//  278 *       Retorno         :       (unsigned char) maior do que zero
//  279 *                               se a entrada estiver acionada
//  280 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function BOARD_get_sinal
          CFI NoCalls
        THUMB
//  281 unsigned char BOARD_get_sinal(eSINAL sinal){
BOARD_get_sinal:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R1,R0
//  282   unsigned char contador=0;  
        MOVS     R2,#+0
//  283   
//  284   for(unsigned char i=0;i<TAM_BUFFER_SENSORES;i++)
        MOVS     R0,#+0
??BOARD_get_sinal_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BGE.N    ??BOARD_get_sinal_1
//  285     if(BOARD_buffer_entradas_digitais[i]&(0x01<<sinal))
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R3,??DataTable12_22
        LDRH     R3,[R3, R0, LSL #+1]
        MOVS     R4,#+1
        LSLS     R4,R4,R1
        TST      R3,R4
        BEQ.N    ??BOARD_get_sinal_2
//  286       contador++;
        ADDS     R2,R2,#+1
??BOARD_get_sinal_2:
        ADDS     R0,R0,#+1
        B.N      ??BOARD_get_sinal_0
//  287   
//  288   if(contador>(TAM_BUFFER_SENSORES>>1))
??BOARD_get_sinal_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+9
        BLT.N    ??BOARD_get_sinal_3
//  289     return 1;
        MOVS     R0,#+1
        B.N      ??BOARD_get_sinal_4
//  290   
//  291   return 0;
??BOARD_get_sinal_3:
        MOVS     R0,#+0
??BOARD_get_sinal_4:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  292 }
//  293 /***********************************************************************************
//  294 *       Descrição       :       Liga o mosfet da saída de embalagem
//  295 *       Parametros      :       (unsigned char) valor
//  296 *       Retorno         :       nenhum
//  297 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function BOARD_set_motor_embalagem
          CFI NoCalls
        THUMB
//  298 void BOARD_set_motor_embalagem(unsigned char flag){
//  299   
//  300   SET_MOTOR_EMBALAGEM_PIN(flag);
BOARD_set_motor_embalagem:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BOARD_set_motor_embalagem_0
        LDR.W    R1,??DataTable12_24  ;; 0x2009c038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1
        LDR.W    R2,??DataTable12_24  ;; 0x2009c038
        STR      R1,[R2, #+0]
        B.N      ??BOARD_set_motor_embalagem_1
??BOARD_set_motor_embalagem_0:
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1
        LDR.N    R2,??DataTable12_1  ;; 0x2009c03c
        STR      R1,[R2, #+0]
//  301 }
??BOARD_set_motor_embalagem_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO1CLR
//  302 /***********************************************************************************
//  303 *       Descrição       :       Setter para o controle do motor da embalagem
//  304 *       Parametros      :       (eMOTOR_DOSE) estado do motor
//  305 *       Retorno         :       nenhum
//  306 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function BOARD_set_motor_dose
        THUMB
//  307 void BOARD_set_motor_dose(eMOTOR_DOSE sentido){
BOARD_set_motor_dose:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  308   
//  309   switch(sentido){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BOARD_set_motor_dose_0
        CMP      R4,#+2
        BEQ.N    ??BOARD_set_motor_dose_1
        BCC.N    ??BOARD_set_motor_dose_2
        B.N      ??BOARD_set_motor_dose_3
//  310     case PARADO:  
//  311          SET_HIGH_SIDE_ESQUERDA(0);
??BOARD_set_motor_dose_0:
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  312          SET_LOW_SIDE_ESQUERDA(0);
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  313          SET_HIGH_SIDE_DIREITA(0);
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  314          SET_LOW_SIDE_DIREITA(0);
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  315          break;
        B.N      ??BOARD_set_motor_dose_3
//  316     case DOSAR:
//  317          SET_HIGH_SIDE_DIREITA(0);
??BOARD_set_motor_dose_2:
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  318          SET_LOW_SIDE_ESQUERDA(0);
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  319          vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  320          SET_HIGH_SIDE_ESQUERDA(1);
        LDR.N    R0,??DataTable12_24  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable12_24  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  321          SET_LOW_SIDE_DIREITA(1);
        LDR.N    R0,??DataTable12_24  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable12_24  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  322          break;
        B.N      ??BOARD_set_motor_dose_3
//  323     case REVERTER:
//  324          SET_HIGH_SIDE_ESQUERDA(0);
??BOARD_set_motor_dose_1:
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  325          SET_LOW_SIDE_DIREITA(0);     
        LDR.N    R0,??DataTable12_1  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  326          vTaskDelay(50);         
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  327          SET_HIGH_SIDE_DIREITA(1);
        LDR.N    R0,??DataTable12_24  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40000000
        LDR.N    R1,??DataTable12_24  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  328          SET_LOW_SIDE_ESQUERDA(1);         
        LDR.N    R0,??DataTable12_24  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.N    R1,??DataTable12_24  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  329          break;
//  330   }
//  331 }
??BOARD_set_motor_dose_3:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
        REQUIRE _A_FIO1CLR
        REQUIRE _A_FIO1SET
//  332 /***********************************************************************************
//  333 *       Descrição       :       Setter para o contador de uso geral
//  334 *       Parametros      :       (unsigned int) valor de preset
//  335 *       Retorno         :       nenhum
//  336 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function BOARD_setter_general_purpose_counter
          CFI NoCalls
        THUMB
//  337 void BOARD_setter_general_purpose_counter(unsigned int preset){
//  338   
//  339   BOARD_general_purpose_counter = preset;
BOARD_setter_general_purpose_counter:
        LDR.N    R1,??DataTable12_3
        STR      R0,[R1, #+0]
//  340 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  341 /***********************************************************************************
//  342 *       Descrição       :       Getter para o contador de uso geral
//  343 *       Parametros      :       (nenhum)
//  344 *       Retorno         :       (unsigned int) valor da contagem
//  345 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function BOARD_getter_general_purpose_counter
          CFI NoCalls
        THUMB
//  346 unsigned int BOARD_getter_general_purpose_counter(void){
//  347   
//  348   return BOARD_general_purpose_counter;
BOARD_getter_general_purpose_counter:
        LDR.N    R0,??DataTable12_3
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  349 }
//  350 /***********************************************************************************
//  351 *       Descrição       :       Controla a piscada dos leds da placa de 
//  352 *                               instrução
//  353 *       Parametros      :       nenhum
//  354 *       Retorno         :       nenhum
//  355 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function BOARD_instrucao_leds
        THUMB
//  356 void BOARD_instrucao_leds(void){
BOARD_instrucao_leds:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  357   static unsigned char toggle=0;
//  358   
//  359   if(!BOARD_leds_instrucao)
        LDR.N    R0,??DataTable12_27
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??BOARD_instrucao_leds_0
//  360     return;
//  361   
//  362   toggle ^= 255;
??BOARD_instrucao_leds_1:
        LDR.N    R0,??DataTable12_28
        LDRB     R0,[R0, #+0]
        EORS     R0,R0,#0xFF
        LDR.N    R1,??DataTable12_28
        STRB     R0,[R1, #+0]
//  363   //---------------------------------------------------
//  364   if(BOARD_estado_leds[LED_INSIRA_DINHEIRO] == APAGADO)
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+2]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_2
//  365     LEDS_setter_led(LED_INSIRA_DINHEIRO,0);
        MOVS     R1,#+0
        MOVS     R0,#+2
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_3
//  366   else
//  367     if(BOARD_estado_leds[LED_INSIRA_DINHEIRO] == ACESO)
??BOARD_instrucao_leds_2:
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+2]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_4
//  368       LEDS_setter_led(LED_INSIRA_DINHEIRO,1);
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_3
//  369     else
//  370       LEDS_setter_led(LED_INSIRA_DINHEIRO,toggle);
??BOARD_instrucao_leds_4:
        LDR.N    R0,??DataTable12_28
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+2
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  371   //---------------------------------------------------
//  372   if(BOARD_estado_leds[LED_PEGUE_PACOTE] == APAGADO)
??BOARD_instrucao_leds_3:
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+3]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_5
//  373     LEDS_setter_led(LED_PEGUE_PACOTE,0);
        MOVS     R1,#+0
        MOVS     R0,#+3
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_6
//  374   else
//  375     if(BOARD_estado_leds[LED_PEGUE_PACOTE] == ACESO)
??BOARD_instrucao_leds_5:
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+3]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_7
//  376       LEDS_setter_led(LED_PEGUE_PACOTE,1);
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_6
//  377     else
//  378       LEDS_setter_led(LED_PEGUE_PACOTE,toggle);  
??BOARD_instrucao_leds_7:
        LDR.N    R0,??DataTable12_28
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+3
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  379   //---------------------------------------------------
//  380   if(BOARD_estado_leds[LED_MONTE_PACOTE] == APAGADO)
??BOARD_instrucao_leds_6:
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_8
//  381     LEDS_setter_led(LED_MONTE_PACOTE,0);
        MOVS     R1,#+0
        MOVS     R0,#+4
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_9
//  382   else
//  383     if(BOARD_estado_leds[LED_MONTE_PACOTE] == ACESO)
??BOARD_instrucao_leds_8:
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+4]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_10
//  384       LEDS_setter_led(LED_MONTE_PACOTE,1);
        MOVS     R1,#+1
        MOVS     R0,#+4
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_9
//  385     else
//  386       LEDS_setter_led(LED_MONTE_PACOTE,toggle);      
??BOARD_instrucao_leds_10:
        LDR.N    R0,??DataTable12_28
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+4
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  387   //---------------------------------------------------
//  388   if(BOARD_estado_leds[LED_INSIRA_PACOTE] == APAGADO)
??BOARD_instrucao_leds_9:
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+5]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_11
//  389     LEDS_setter_led(LED_INSIRA_PACOTE,0);
        MOVS     R1,#+0
        MOVS     R0,#+5
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_12
//  390   else
//  391     if(BOARD_estado_leds[LED_INSIRA_PACOTE] == ACESO)
??BOARD_instrucao_leds_11:
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+5]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_13
//  392       LEDS_setter_led(LED_INSIRA_PACOTE,1);
        MOVS     R1,#+1
        MOVS     R0,#+5
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_12
//  393     else
//  394       LEDS_setter_led(LED_INSIRA_PACOTE,toggle);   
??BOARD_instrucao_leds_13:
        LDR.N    R0,??DataTable12_28
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+5
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  395   //---------------------------------------------------
//  396   if(BOARD_estado_leds[LED_FORA_SERVICO] == APAGADO)
??BOARD_instrucao_leds_12:
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+6]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_14
//  397     LEDS_setter_led(LED_FORA_SERVICO,0);
        MOVS     R1,#+0
        MOVS     R0,#+6
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_15
//  398   else
//  399     if(BOARD_estado_leds[LED_FORA_SERVICO] == ACESO)
??BOARD_instrucao_leds_14:
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+6]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_16
//  400       LEDS_setter_led(LED_FORA_SERVICO,1);
        MOVS     R1,#+1
        MOVS     R0,#+6
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_15
//  401     else
//  402       LEDS_setter_led(LED_FORA_SERVICO,toggle);        
??BOARD_instrucao_leds_16:
        LDR.N    R0,??DataTable12_28
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+6
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  403    //--------------------------------------------------
//  404    if(BOARD_estado_leds[LED_VERMELHO_GRELHA] == APAGADO)
??BOARD_instrucao_leds_15:
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+1]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_17
//  405      LEDS_setter_led(LED_VERMELHO_GRELHA,0);
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_18
//  406    else
//  407      if(BOARD_estado_leds[LED_VERMELHO_GRELHA] == ACESO)
??BOARD_instrucao_leds_17:
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+1]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_19
//  408        LEDS_setter_led(LED_VERMELHO_GRELHA,1);
        MOVS     R1,#+1
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_18
//  409      else
//  410        LEDS_setter_led(LED_VERMELHO_GRELHA,toggle);
??BOARD_instrucao_leds_19:
        LDR.N    R0,??DataTable12_28
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  411    //--------------------------------------------------
//  412    if(BOARD_estado_leds[LED_VERDE_GRELHA] == APAGADO)
??BOARD_instrucao_leds_18:
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??BOARD_instrucao_leds_20
//  413      LEDS_setter_led(LED_VERDE_GRELHA,0);
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_21
//  414    else
//  415      if(BOARD_estado_leds[LED_VERDE_GRELHA] == ACESO)
??BOARD_instrucao_leds_20:
        LDR.N    R0,??DataTable12_29
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??BOARD_instrucao_leds_22
//  416        LEDS_setter_led(LED_VERDE_GRELHA,1);
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_21
//  417      else
//  418        LEDS_setter_led(LED_VERDE_GRELHA,toggle);
??BOARD_instrucao_leds_22:
        LDR.N    R0,??DataTable12_28
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  419    //--------------------------------------------------
//  420      
//  421    if(toggle){
??BOARD_instrucao_leds_21:
        LDR.N    R0,??DataTable12_28
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BOARD_instrucao_leds_23
//  422      LEDS_setter_led(LED_VERMELHO_GRELHA,1);
        MOVS     R1,#+1
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  423      LEDS_setter_led(LED_VERDE_GRELHA,0);
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??BOARD_instrucao_leds_24
//  424    }
//  425    else{
//  426      LEDS_setter_led(LED_VERMELHO_GRELHA,0);
??BOARD_instrucao_leds_23:
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  427      LEDS_setter_led(LED_VERDE_GRELHA,1);     
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  428    }
//  429 }
??BOARD_instrucao_leds_24:
??BOARD_instrucao_leds_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??toggle:
        DS8 1
//  430 /***********************************************************************************
//  431 *       Descrição       :       Setter para a variavel que guarda o estado
//  432 *                               dos leds da placa de instrução
//  433 *       Parametros      :       (unsigned char) led
//  434 *                               (eLED_STATE) estado do led
//  435 *       Retorno         :       nenhum
//  436 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function BOARD_setter_led_instrucao
          CFI NoCalls
        THUMB
//  437 void BOARD_setter_led_instrucao(unsigned char led,eLED_STATE estado){
//  438   
//  439   BOARD_estado_leds[led] = estado;    
BOARD_setter_led_instrucao:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable12_29
        STRB     R1,[R0, R2]
//  440 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  441 /***********************************************************************************
//  442 *       Descrição       :       Setter ara a variavel que controla a placa
//  443 *                               de instrução
//  444 *       Parametros      :       (unsigned char) estado
//  445 *       Retorno         :       nenhum
//  446 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function BOARD_liga_placa_instrucao
        THUMB
//  447 void BOARD_liga_placa_instrucao(unsigned char flag){
BOARD_liga_placa_instrucao:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  448   
//  449   for(unsigned char i=0;i<8;i++)
        MOVS     R5,#+0
??BOARD_liga_placa_instrucao_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BGE.N    ??BOARD_liga_placa_instrucao_1
//  450     LEDS_setter_led(i,0);
        MOVS     R1,#+0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        ADDS     R5,R5,#+1
        B.N      ??BOARD_liga_placa_instrucao_0
//  451   
//  452   if(!flag)
??BOARD_liga_placa_instrucao_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??BOARD_liga_placa_instrucao_2
//  453     for(unsigned char i=0;i<8;i++)
        MOVS     R0,#+0
??BOARD_liga_placa_instrucao_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+8
        BGE.N    ??BOARD_liga_placa_instrucao_2
//  454       BOARD_estado_leds[i] = APAGADO;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable12_29
        MOVS     R2,#+0
        STRB     R2,[R0, R1]
        ADDS     R0,R0,#+1
        B.N      ??BOARD_liga_placa_instrucao_3
//  455   
//  456   BOARD_leds_instrucao = flag;
??BOARD_liga_placa_instrucao_2:
        LDR.N    R0,??DataTable12_27
        STRB     R4,[R0, #+0]
//  457 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock10
//  458 /***********************************************************************************
//  459 *       Descrição       :       Setter para o contador de propaganda
//  460 *       Parametros      :       nenhum
//  461 *       Retorno         :       nenhum
//  462 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function BOARD_setter_contador_propaganda
          CFI NoCalls
        THUMB
//  463 void BOARD_setter_contador_propaganda(unsigned int contagem){
//  464   
//  465   if(!contagem)
BOARD_setter_contador_propaganda:
        CMP      R0,#+0
        BNE.N    ??BOARD_setter_contador_propaganda_0
//  466     BOARD_contador_propaganda = 60000*BOARD_intervalo_propaganda;
        LDR.N    R1,??DataTable12_23
        LDR      R1,[R1, #+0]
        MOVW     R2,#+60000
        MULS     R1,R2,R1
        LDR.N    R2,??DataTable12_7
        STR      R1,[R2, #+0]
        B.N      ??BOARD_setter_contador_propaganda_1
//  467   else
//  468     BOARD_contador_propaganda = contagem;
??BOARD_setter_contador_propaganda_0:
        LDR.N    R1,??DataTable12_7
        STR      R0,[R1, #+0]
//  469 }
??BOARD_setter_contador_propaganda_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock11
//  470 /***********************************************************************************
//  471 *       Descrição       :       Setter para o tempo da propaganda
//  472 *       Parametros      :       nenhum
//  473 *       Retorno         :       nenhum
//  474 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function BOARD_reset_tempo_propaganda
          CFI NoCalls
        THUMB
//  475 void BOARD_reset_tempo_propaganda(void){
//  476   
//  477   BOARD_contador_propaganda = BOARD_intervalo_propaganda*60000;
BOARD_reset_tempo_propaganda:
        LDR.N    R0,??DataTable12_23
        LDR      R0,[R0, #+0]
        MOVW     R1,#+60000
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable12_7
        STR      R0,[R1, #+0]
//  478 }
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
        DC32     HD44780_tempoRefreshSegundoLCD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_15:
        DC32     APLICACAO_tempo_compensacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_16:
        DC32     0x2bf20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_17:
        DC32     PREPARACAO_compensador

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_18:
        DC32     MCS_contadorSemente

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_19:
        DC32     0x2009c034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_20:
        DC32     0x2009c014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_21:
        DC32     ??indice

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_22:
        DC32     BOARD_buffer_entradas_digitais

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_23:
        DC32     BOARD_intervalo_propaganda

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_24:
        DC32     0x2009c038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_25:
        DC32     0x2009c098

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_26:
        DC32     0x2009c09c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_27:
        DC32     BOARD_leds_instrucao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_28:
        DC32     ??toggle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_29:
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
//  479 /***********************************************************************************
//  480 *       Fim do arquivo
//  481 ***********************************************************************************/
// 
//    58 bytes in section .bss
//     5 bytes in section .data
//    32 bytes in section .noinit (abs)
// 1 850 bytes in section .text
// 
// 1 850 bytes of CODE memory
//    63 bytes of DATA memory (+ 32 bytes shared)
//
//Errors: none
//Warnings: none
