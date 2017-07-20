///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  14:33:26 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\aplicacao.c                   /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\aplicacao.c -lC               /
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
//                    pocaG2\SOFTWARE\Debug\List\aplicacao.s                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME aplicacao

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", "unknown,flags,widths"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN AA_calculaTemperatura
        EXTERN AA_mediaMovelPapel
        EXTERN BOARD_liga_placa_instrucao
        EXTERN BOARD_reset_tempo_propaganda
        EXTERN BOARD_setter_contador_propaganda
        EXTERN BOARD_setter_led_instrucao
        EXTERN BV20_get_current_state
        EXTERN CT_set_temperatura
        EXTERN HD44780_2_init
        EXTERN HD44780_init
        EXTERN MCFG_entry
        EXTERN MDB_checa_dispositivos
        EXTERN MDB_coin_check_tubes
        EXTERN MDB_coin_dispenser
        EXTERN PAGAMENTOS_adiciona_valores
        EXTERN PAGAMENTOS_get_timeout_pagamento
        EXTERN PAGAMENTOS_get_valor_acumulado
        EXTERN PAGAMENTOS_set_bloqueio
        EXTERN PAGAMENTOS_subtrai_valores
        EXTERN PARAMETROS_le
        EXTERN POST_entry
        EXTERN POST_verificacao_ciclica
        EXTERN POTENCIA_getRPMmedido
        EXTERN POTENCIA_setRPM
        EXTERN POTENCIA_set_neutro
        EXTERN PREPARACAO_entry
        EXTERN PREPARACAO_limpeza_inicial
        EXTERN PREPARACAO_resfriamento
        EXTERN STRING_mensagem_cctalk_offline
        EXTERN STRING_mensagem_fora_servico
        EXTERN STRING_mensagem_modo_gratis
        EXTERN STRING_mensagem_moedeiro_mdb_offline
        EXTERN STRING_mensagem_noteiro_mdb_offline
        EXTERN STRING_mensagem_pago
        EXTERN STRING_mensagem_preco
        EXTERN STRING_mensagem_retire_troco
        EXTERN STRING_mensagem_saudacao_maquina
        EXTERN STRING_mensagem_sem_troco
        EXTERN STRING_splash
        EXTERN STRING_write_to_external
        EXTERN STRING_write_to_internal
        EXTERN TECLADO_getch
        EXTERN WATCHDOG_init
        EXTERN sprintf
        EXTERN vTaskDelay
        EXTERN xQueueCreate
        EXTERN xQueueGenericReceive
        EXTERN xQueueGenericSend

        PUBLIC APLIACAO_wait_lcd
        PUBLIC APLICACACAO_verifica_troco
        PUBLIC APLICACAO_carrega_idioma
        PUBLIC APLICACAO_ciclo_desumidificador
        PUBLIC APLICACAO_devolve_troco
        PUBLIC APLICACAO_exibe_valor
        PUBLIC APLICACAO_ini
        PUBLIC APLICACAO_loop_falha_ciclica
        PUBLIC APLICACAO_main
        PUBLIC APLICACAO_menu_falha
        PUBLIC APLICACAO_release_lcd
        PUBLIC APLICACAO_reset_hardware
        PUBLIC APLICACAO_sem_LCD
        PUBLIC APLICACAO_tela_descanso
        PUBLIC APLICACAO_tempo_desumidificador
        PUBLIC APLICACAO_tempo_mensagem
        PUBLIC APLICACAO_tubos
        PUBLIC APLICACAO_verifica_MDB
        PUBLIC APLICACAO_verifica_cctalk
        PUBLIC APLICACAO_verifica_disponibilidade_troco
        PUBLIC APLICACAO_verifica_post
        PUBLIC APLICACAO_verifica_preparacao
        PUBLIC APLICACAO_verificao_ciclica
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Aplicacao\aplicacao.c
//    1 /*__________________________________________________________________________________
//    2 |	Quark Tecnologia Eletr�nica Embarcada
//    3 |       
//    4 |       Itapema - SC
//    5 |       www.quarktee.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Quark  and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Quark 
//   10 |       or its distributors.
//   11 |
//   12 |       Este c�digo � propriedade da Quark  e n�o pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       Quark  ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :  aplicacao.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data cria��o       :  22/04/2017
//   21 |
//   22 |       Revis�es           :  001
//   23 |
//   24 |                             (22/04/2017) criado m�dulo de controle da prepara��o (Marcos)
//   25 |                             (25/05/2017) alterado para criar o flag que habilita o 
//   26 |                                          uso do troco ou n�o
//   27 |                             (23/07/2017) Alterado para s� rodar o bloco de verifica��o
//   28 |                                          do CCTALK quando ele estiver habilitado
//   29 |                                          nos acess�rios
//   30 |
//   31 | __________________________________________________________________________________
//   32 */
//   33 
//   34 /***********************************************************************************
//   35 *       Includes
//   36 ***********************************************************************************/
//   37 #include <stdio.h>
//   38 #include <stdlib.h>
//   39 #include <string.h>
//   40 #include "aplicacao.h"
//   41 #include "..\includes.h"
//   42 
//   43 /***********************************************************************************
//   44 *       Constantes
//   45 ***********************************************************************************/
//   46 #define TEMPO_DESUMIDIFICADOR                   1000*60*30
//   47 #define TEMPO_MENSAGEM_LINHA_INFERIOR           10000
//   48 
//   49 //#define _DEBUG_PAGAMENTOS_
//   50 
//   51 /***********************************************************************************
//   52 *       Enumera��es
//   53 ***********************************************************************************/
//   54 
//   55 
//   56 /***********************************************************************************
//   57 *       Variaveis 
//   58 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   59 xSemaphoreHandle  APLICACAO_sem_LCD;
APLICACAO_sem_LCD:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   60 unsigned char APLICACAO_tubos[16]={0};
APLICACAO_tubos:
        DS8 16

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   61 unsigned int APLICACAO_tempo_desumidificador=30*60*1000;//TEMPO_DESUMIDIFICADOR;
APLICACAO_tempo_desumidificador:
        DATA
        DC32 1800000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   62 unsigned int APLICACAO_tempo_mensagem=0;
APLICACAO_tempo_mensagem:
        DS8 4
//   63 /***********************************************************************************
//   64 *       Fun��es
//   65 ***********************************************************************************/
//   66 void APLICACAO_ini(void);
//   67 void APLICACAO_tela_descanso(void);
//   68 void APLICACAO_exibe_valor(unsigned char idioma);
//   69 unsigned int APLICACACAO_verifica_troco(void);
//   70 void APLICACAO_verifica_preparacao(unsigned int valor_pipoca,unsigned char idioma,unsigned char troco);
//   71 void APLICACAO_menu_falha(void);
//   72 unsigned char APLICACAO_devolve_troco(void);
//   73 unsigned char APLICACAO_verifica_post(void);
//   74 void APLICACAO_verifica_disponibilidade_troco(unsigned char idioma);
//   75 void APLICACAO_verifica_MDB(void);
//   76 void APLICACAO_verifica_preparacao(unsigned int valor_pipoca,unsigned char idioma,
//   77                                    unsigned char troco);
//   78 void APLICACAO_verifica_cctalk(void);
//   79 void APLICACAO_verificao_ciclica(void);
//   80 void APLICACAO_loop_falha_ciclica(void);
//   81 void APLICACAO_ciclo_desumidificador(unsigned char flag);
//   82 void APLICACAO_reset_hardware(void);
//   83 
//   84 /***********************************************************************************
//   85 *       Implementa��o das fun��es
//   86 ***********************************************************************************/
//   87 
//   88 /***********************************************************************************
//   89 *       Descri��o       :       Fun��o principal da interface de usu�rio
//   90 *       Parametros      :       nenhum
//   91 *       Retorno         :       nenhum
//   92 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function APLICACAO_main
        THUMB
//   93 void APLICACAO_main(void*pPar){
APLICACAO_main:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
//   94   eTECLA tecla;
//   95   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//   96   unsigned int valorPipoca;
//   97   unsigned char modo_gratis;
//   98   unsigned char modo_troco;
//   99   unsigned char flag_desumidificador;
//  100   
//  101   APLICACAO_ini();
          CFI FunCall APLICACAO_ini
        BL       APLICACAO_ini
//  102   
//  103   PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  104   PARAMETROS_le(ADR_FLAG_FREE,(void*)&modo_gratis);
        ADD      R1,SP,#+1
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  105   PARAMETROS_le(ADR_FLAG_TROCO,(void*)&modo_troco);
        ADD      R1,SP,#+0
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  106   PARAMETROS_le(ADR_FLAG_DESUMIDIFICADOR,(void*)&flag_desumidificador);
        ADD      R1,SP,#+2
        MOVS     R0,#+38
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  107   
//  108 #ifndef _DEBUG_PAGAMENTOS_
//  109   vTaskDelay(3000);
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  110   PREPARACAO_limpeza_inicial(idioma);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PREPARACAO_limpeza_inicial
        BL       PREPARACAO_limpeza_inicial
//  111 #endif
//  112   
//  113   
//  114   STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  115   
//  116   BOARD_liga_placa_instrucao(1); // Liga a placa de instru��o  
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  117   
//  118   BOARD_setter_contador_propaganda(0); // Deixa a propaganda agendada para o primeiro ciclo
        MOVS     R0,#+0
          CFI FunCall BOARD_setter_contador_propaganda
        BL       BOARD_setter_contador_propaganda
//  119   
//  120 #ifndef _DEBUG_PAGAMENTOS_  
//  121   APLICACAO_verifica_post();
          CFI FunCall APLICACAO_verifica_post
        BL       APLICACAO_verifica_post
//  122 #endif
//  123     
//  124   PAGAMENTOS_subtrai_valores(PAGAMENTOS_get_valor_acumulado());
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
          CFI FunCall PAGAMENTOS_subtrai_valores
        BL       PAGAMENTOS_subtrai_valores
//  125   PAGAMENTOS_set_bloqueio(0);
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
        B.N      ??APLICACAO_main_0
//  126   
//  127   for(;;){
//  128     
//  129     PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
//  130     PARAMETROS_le(ADR_FLAG_FREE,(void*)&modo_gratis);
//  131     PARAMETROS_le(ADR_FLAG_TROCO,(void*)&modo_troco);    
//  132     
//  133     tecla = TECLADO_getch();
//  134     switch(tecla){
//  135       case TECLA_INC:
//  136            //SMDB_cashless_vend(100,1);
//  137            break;
//  138       case TECLA_DEC:
//  139            break;
//  140       case TECLA_ENTER:
//  141            APLIACAO_wait_lcd();
//  142              BOARD_liga_placa_instrucao(0);
//  143              MCFG_entry();                     
//  144              BOARD_liga_placa_instrucao(1);
//  145              idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
//  146              
//  147              PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
//  148              PARAMETROS_le(ADR_FLAG_FREE,(void*)&modo_gratis);
//  149              PARAMETROS_le(ADR_FLAG_TROCO,(void*)&modo_troco);             
//  150              
//  151              APLICACAO_tempo_desumidificador=30*60*1000;
//  152              
//  153            APLICACAO_release_lcd();  
//  154            
//  155            STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
//  156            
//  157            HD44780_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);       
//  158            HD44780_2_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);              
//  159            
//  160            APLICACAO_reset_hardware();           
//  161            break;
//  162       case TECLA_ESC:
//  163            break;
//  164       case TECLA_GRATIS:
//  165            if(modo_gratis)
//  166              PAGAMENTOS_adiciona_valores(valorPipoca);
//  167            break;      
//  168     }
//  169     
//  170     if(modo_gratis)
//  171       STRING_write_to_external(NO_CLEAR,(void*)STRING_mensagem_modo_gratis[idioma][0],(void*)STRING_mensagem_modo_gratis[idioma][1]);
//  172     else{
//  173       APLICACAO_exibe_valor(idioma);     
??APLICACAO_main_1:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall APLICACAO_exibe_valor
        BL       APLICACAO_exibe_valor
//  174       if(modo_troco)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_main_2
//  175         APLICACAO_verifica_disponibilidade_troco(idioma);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall APLICACAO_verifica_disponibilidade_troco
        BL       APLICACAO_verifica_disponibilidade_troco
//  176       // Verifica a conectividade dos
//  177       // meios de pagamento seriais
//  178       APLICACAO_verifica_MDB();
??APLICACAO_main_2:
          CFI FunCall APLICACAO_verifica_MDB
        BL       APLICACAO_verifica_MDB
//  179       APLICACAO_verifica_cctalk();
          CFI FunCall APLICACAO_verifica_cctalk
        BL       APLICACAO_verifica_cctalk
//  180     }
//  181     
//  182     APLICACAO_verifica_preparacao(valorPipoca,idioma,modo_troco);             
??APLICACAO_main_3:
        LDRB     R2,[SP, #+0]
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R0,[SP, #+4]
          CFI FunCall APLICACAO_verifica_preparacao
        BL       APLICACAO_verifica_preparacao
//  183     BOARD_setter_led_instrucao(LED_INSIRA_DINHEIRO,PISCANDO); // Ativa o modo inserir dinheiro
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  184     APLICACAO_tela_descanso();    
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  185 #ifndef _DEBUG_PAGAMENTOS_    
//  186     APLICACAO_verificao_ciclica();
          CFI FunCall APLICACAO_verificao_ciclica
        BL       APLICACAO_verificao_ciclica
//  187 #endif
//  188     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  189     APLICACAO_ciclo_desumidificador(flag_desumidificador);
        LDRB     R0,[SP, #+2]
          CFI FunCall APLICACAO_ciclo_desumidificador
        BL       APLICACAO_ciclo_desumidificador
??APLICACAO_main_0:
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
        ADD      R1,SP,#+1
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
        ADD      R1,SP,#+0
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_main_4
        BCC.N    ??APLICACAO_main_5
        CMP      R0,#+3
        BEQ.N    ??APLICACAO_main_6
        BCC.N    ??APLICACAO_main_7
        CMP      R0,#+5
        BEQ.N    ??APLICACAO_main_8
        BCC.N    ??APLICACAO_main_9
        B.N      ??APLICACAO_main_5
??APLICACAO_main_7:
        B.N      ??APLICACAO_main_5
??APLICACAO_main_6:
        B.N      ??APLICACAO_main_5
??APLICACAO_main_9:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
          CFI FunCall MCFG_entry
        BL       MCFG_entry
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
        ADD      R1,SP,#+1
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
        ADD      R1,SP,#+0
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
        LDR.W    R0,??DataTable15
        LDR.W    R1,??DataTable15_1  ;; 0x1b7740
        STR      R1,[R0, #+0]
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_init
        BL       HD44780_init
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_2_init
        BL       HD44780_2_init
          CFI FunCall APLICACAO_reset_hardware
        BL       APLICACAO_reset_hardware
        B.N      ??APLICACAO_main_5
??APLICACAO_main_4:
        B.N      ??APLICACAO_main_5
??APLICACAO_main_8:
        LDRB     R0,[SP, #+1]
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_main_10
        LDR      R0,[SP, #+4]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_adiciona_valores
        BL       PAGAMENTOS_adiciona_valores
??APLICACAO_main_10:
??APLICACAO_main_5:
        LDRB     R0,[SP, #+1]
        CMP      R0,#+0
        BEQ.W    ??APLICACAO_main_1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_2
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_2
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
        B.N      ??APLICACAO_main_3
          CFI EndBlock cfiBlock0
//  190   }   
//  191 }
//  192 /***********************************************************************************
//  193 *       Descri��o       :       Inicializa��o do �dulo
//  194 *       Parametros      :       nenhum
//  195 *       Retorno         :       nenhum
//  196 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function APLICACAO_ini
        THUMB
//  197 void APLICACAO_ini(void){
APLICACAO_ini:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  198   eIDIOMA idioma  = BRASIL;
        MOVS     R4,#+0
//  199        
//  200   HD44780_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,
//  201                LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);     
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_init
        BL       HD44780_init
//  202   
//  203   HD44780_2_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,
//  204                  LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);       
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_2_init
        BL       HD44780_2_init
//  205   
//  206   STRING_write_to_internal(CLEAR_DISPLAY,
//  207                            (char*)STRING_splash[idioma][0],
//  208                            (char*)STRING_splash[idioma][1]);      
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_3
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_3
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  209   
//  210   STRING_write_to_external(CLEAR_DISPLAY,
//  211                            (char*)STRING_mensagem_saudacao_maquina[idioma][0],
//  212                            (char*)STRING_mensagem_saudacao_maquina[idioma][1]);      
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_4
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_4
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  213   
//  214   vSemaphoreCreateBinary(APLICACAO_sem_LCD);
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall xQueueCreate
        BL       xQueueCreate
        LDR.W    R1,??DataTable15_5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable15_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_ini_0
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.W    R0,??DataTable15_5
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  215 }
??APLICACAO_ini_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  216 /***********************************************************************************
//  217 *       Descri��o       :       Sem�foro para acessar o LCD
//  218 *       Parametros      :       nenhum
//  219 *       Retorno         :       nenhum
//  220 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function APLIACAO_wait_lcd
        THUMB
//  221 void APLIACAO_wait_lcd(void){
APLIACAO_wait_lcd:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  222   
//  223   while(!xSemaphoreTake(APLICACAO_sem_LCD,portTICK_RATE_MS*1));
??APLIACAO_wait_lcd_0:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.W    R0,??DataTable15_5
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??APLIACAO_wait_lcd_0
//  224 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  225 /***********************************************************************************
//  226 *       Descri��o       :       Libera o sem�foro do LCD
//  227 *       Parametros      :       nenhum
//  228 *       Retorno         :       nenhum
//  229 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function APLICACAO_release_lcd
        THUMB
//  230 void APLICACAO_release_lcd(void){
APLICACAO_release_lcd:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  231   
//  232   xSemaphoreGive(APLICACAO_sem_LCD);
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.W    R0,??DataTable15_5
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  233 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  234 /***********************************************************************************
//  235 *       Descri��o       :       Fun��es para carregar o idioma
//  236 *       Parametros      :       nenhum
//  237 *       Retorno         :       nenhum
//  238 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function APLICACAO_carrega_idioma
        THUMB
//  239 unsigned char APLICACAO_carrega_idioma(void){
APLICACAO_carrega_idioma:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  240   unsigned char idioma  = BRASIL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  241   
//  242   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);  
        ADD      R1,SP,#+0
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  243   if(idioma>QTY_OF_LANGUAGES)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+8
        BLT.N    ??APLICACAO_carrega_idioma_0
//  244     idioma = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  245   
//  246   return idioma;
??APLICACAO_carrega_idioma_0:
        LDRB     R0,[SP, #+0]
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
//  247 }
//  248 /***********************************************************************************
//  249 *       Descri��o       :       Tela de descanso do display interno
//  250 *       Parametros      :       nenhum
//  251 *       Retorno         :       nenhum
//  252 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function APLICACAO_tela_descanso
        THUMB
//  253 void APLICACAO_tela_descanso(void){
APLICACAO_tela_descanso:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+24
          CFI CFA R13+40
//  254   char buffer_linha[17];
//  255   
//  256   sprintf(buffer_linha,"RPM:%05d T%03doC",POTENCIA_getRPMmedido(),AA_calculaTemperatura());
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        MOVS     R4,R0
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R3,R4
        MOVS     R2,R0
        LDR.W    R1,??DataTable15_6
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  257   STRING_write_to_internal(NO_CLEAR,buffer_linha,NULL);    
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  258   
//  259   sprintf(buffer_linha,"P:%04d M:%04d,%02d",AA_mediaMovelPapel(),
//  260                                             PAGAMENTOS_get_valor_acumulado()/100,
//  261                                             PAGAMENTOS_get_valor_acumulado()%100);
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        MOVS     R4,R0
        MOVS     R5,#+100
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        MOVS     R6,R0
          CFI FunCall AA_mediaMovelPapel
        BL       AA_mediaMovelPapel
        SDIV     R1,R4,R5
        MLS      R1,R5,R1,R4
        STR      R1,[SP, #+0]
        MOVS     R1,#+100
        SDIV     R3,R6,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R2,R0
        LDR.W    R1,??DataTable15_7
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  262   
//  263   STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  264 }
        ADD      SP,SP,#+24
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock5
//  265 /***********************************************************************************
//  266 *       Descri��o       :       Exibe o valor da pipoca e 
//  267 *                               o quanto j� foi pago pelo cliente
//  268 *       Parametros      :       nenhum
//  269 *       Retorno         :       nenhum
//  270 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function APLICACAO_exibe_valor
        THUMB
//  271 void APLICACAO_exibe_valor(unsigned char idioma){
APLICACAO_exibe_valor:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
        MOVS     R4,R0
//  272   unsigned int valor;
//  273   char buffer_linha[17];
//  274   static unsigned char indice=0;
//  275   
//  276   PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  277   sprintf(buffer_linha,STRING_mensagem_preco[idioma],valor/100,valor%100);
        LDR      R0,[SP, #+0]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        MLS      R3,R1,R2,R0
        LDR      R0,[SP, #+0]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_8
        LDR      R1,[R0, R4, LSL #+2]
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  278   STRING_write_to_external(NO_CLEAR,buffer_linha,NULL);    
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  279   
//  280   unsigned int pago = PAGAMENTOS_get_valor_acumulado();
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
//  281   
//  282   if(pago){    
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_exibe_valor_0
//  283     sprintf(buffer_linha,STRING_mensagem_pago[idioma],pago/100,pago%100);
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        MLS      R3,R1,R2,R0
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_9
        LDR      R1,[R0, R4, LSL #+2]
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  284     STRING_write_to_external(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
        B.N      ??APLICACAO_exibe_valor_1
//  285   }
//  286   else{
//  287     if(!APLICACAO_tempo_mensagem){
??APLICACAO_exibe_valor_0:
        LDR.W    R0,??DataTable15_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??APLICACAO_exibe_valor_2
//  288       indice = (indice+1) % 4;
        LDR.W    R0,??DataTable15_11
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+4
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.W    R0,??DataTable15_11
        STRB     R2,[R0, #+0]
//  289       APLICACAO_tempo_mensagem = TEMPO_MENSAGEM_LINHA_INFERIOR;
        LDR.W    R0,??DataTable15_10
        MOVW     R1,#+10000
        STR      R1,[R0, #+0]
//  290     }
//  291     PARAMETROS_le(ADR_MENSAGEM_CLIENTE_01+indice,(void*)buffer_linha);
??APLICACAO_exibe_valor_2:
        ADD      R1,SP,#+4
        LDR.W    R0,??DataTable15_11
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+60
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  292     STRING_write_to_external(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  293   }
//  294 }
??APLICACAO_exibe_valor_1:
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock6

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??indice:
        DS8 1
//  295 /***********************************************************************************
//  296 *       Descri��o       :       Verifica a contagem dos tubos de moeda
//  297 *       Parametros      :       nenhum
//  298 *       Retorno         :       (unsigned char) maior do que zero se h� troco
//  299 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function APLICACACAO_verifica_troco
        THUMB
//  300 unsigned int APLICACACAO_verifica_troco(void){
APLICACACAO_verifica_troco:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  301   
//  302   if(MDB_coin_check_tubes(APLICACAO_tubos)){      
        LDR.W    R0,??DataTable15_12
          CFI FunCall MDB_coin_check_tubes
        BL       MDB_coin_check_tubes
        CMP      R0,#+0
        BEQ.N    ??APLICACACAO_verifica_troco_0
//  303     return APLICACAO_tubos[2]*25;
        LDR.W    R0,??DataTable15_12
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+25
        MULS     R0,R1,R0
        B.N      ??APLICACACAO_verifica_troco_1
//  304   }
//  305   
//  306   return 0;
??APLICACACAO_verifica_troco_0:
        MOVS     R0,#+0
??APLICACACAO_verifica_troco_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock7
//  307 }
//  308 /***********************************************************************************
//  309 *       Descri��o       :       Faz a verifica��o dos pagamentos para
//  310 *                               iniciar o ciclo de prepara��o
//  311 *       Parametros      :       (unsigned int) valor da pipoca
//  312 *       Retorno         :       nenhum
//  313 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function APLICACAO_verifica_preparacao
        THUMB
//  314 void APLICACAO_verifica_preparacao(unsigned int valor_pipoca,unsigned char idioma,
//  315                                    unsigned char troco){
APLICACAO_verifica_preparacao:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,R2
//  316    unsigned int ajuste;
//  317   
//  318   if( PAGAMENTOS_get_valor_acumulado()>=valor_pipoca) {      
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        CMP      R0,R5
        BCC.W    ??APLICACAO_verifica_preparacao_0
//  319     
//  320     if(troco==OPERA_SEM_TROCO || APLICACACAO_verifica_troco()>=valor_pipoca){     
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??APLICACAO_verifica_preparacao_1
          CFI FunCall APLICACACAO_verifica_troco
        BL       APLICACACAO_verifica_troco
        CMP      R0,R5
        BCC.N    ??APLICACAO_verifica_preparacao_2
//  321       // Switch para 
//  322       // capturar os resultados da execu��o do processo
//  323       switch(PREPARACAO_entry(&ajuste,CONTABILIZA)){
??APLICACAO_verifica_preparacao_1:
        MOVS     R1,#+1
        ADD      R0,SP,#+0
          CFI FunCall PREPARACAO_entry
        BL       PREPARACAO_entry
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_preparacao_3
        CMP      R0,#+2
        BEQ.N    ??APLICACAO_verifica_preparacao_4
        BCC.N    ??APLICACAO_verifica_preparacao_5
        CMP      R0,#+4
        BEQ.N    ??APLICACAO_verifica_preparacao_6
        BCC.N    ??APLICACAO_verifica_preparacao_7
        B.N      ??APLICACAO_verifica_preparacao_2
//  324         case SUCESSO:
//  325              PAGAMENTOS_subtrai_valores(valor_pipoca);          
??APLICACAO_verifica_preparacao_3:
        MOVS     R0,R5
          CFI FunCall PAGAMENTOS_subtrai_valores
        BL       PAGAMENTOS_subtrai_valores
//  326              // Devolve o troco caso ainda reste valor
//  327              // pago no acumulador de moeda
//  328              if(troco==OPERA_COM_TROCO && PAGAMENTOS_get_valor_acumulado()){               
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+255
        BNE.N    ??APLICACAO_verifica_preparacao_8
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_preparacao_8
//  329                STRING_write_to_external(CLEAR_DISPLAY,
//  330                                         (char*)STRING_mensagem_retire_troco[idioma][0],
//  331                                         (char*)STRING_mensagem_retire_troco[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_13
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_13
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  332                APLICACAO_devolve_troco();      
          CFI FunCall APLICACAO_devolve_troco
        BL       APLICACAO_devolve_troco
//  333              }
//  334              PREPARACAO_resfriamento(idioma);
??APLICACAO_verifica_preparacao_8:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PREPARACAO_resfriamento
        BL       PREPARACAO_resfriamento
//  335              STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);                
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  336              PAGAMENTOS_set_bloqueio(0);
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  337              HD44780_init(LCD_DISPLAY_8X5   | LCD_2_LINHAS,LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);       
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_init
        BL       HD44780_init
//  338              HD44780_2_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);                
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_2_init
        BL       HD44780_2_init
//  339              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  340         case FALHA_VENTILADOR:
//  341              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E0:VENTILADOR");                       
??APLICACAO_verifica_preparacao_5:
        LDR.W    R2,??DataTable15_14
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_15
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  342              APLICACAO_menu_falha();
          CFI FunCall APLICACAO_menu_falha
        BL       APLICACAO_menu_falha
//  343              PAGAMENTOS_set_bloqueio(0);             
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  344              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  345         case FALHA_RESISTENCIA:
//  346              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E1:AQUECIMENTO");
??APLICACAO_verifica_preparacao_4:
        LDR.W    R2,??DataTable15_16
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_15
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  347              APLICACAO_menu_falha();
          CFI FunCall APLICACAO_menu_falha
        BL       APLICACAO_menu_falha
//  348              PAGAMENTOS_set_bloqueio(0);             
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  349              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  350         case FALHA_DOSE:
//  351              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E2:DOSADOR");          
??APLICACAO_verifica_preparacao_7:
        LDR.W    R2,??DataTable15_17
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_15
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  352              APLICACAO_menu_falha();
          CFI FunCall APLICACAO_menu_falha
        BL       APLICACAO_menu_falha
//  353              PAGAMENTOS_set_bloqueio(0);             
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  354              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  355         case FALHA_EMBALAGEM:
//  356              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E3:EMBALAGEM");                                                 
??APLICACAO_verifica_preparacao_6:
        LDR.W    R2,??DataTable15_18
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable15_15
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  357              APLICACAO_menu_falha();
          CFI FunCall APLICACAO_menu_falha
        BL       APLICACAO_menu_falha
//  358              PAGAMENTOS_set_bloqueio(0);
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  359              break;
//  360       }     
//  361     }
//  362          
//  363     STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
??APLICACAO_verifica_preparacao_2:
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  364     BOARD_setter_contador_propaganda(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_setter_contador_propaganda
        BL       BOARD_setter_contador_propaganda
        B.N      ??APLICACAO_verifica_preparacao_9
//  365   }//Fim do inicio do processo de prepara��o
//  366   else
//  367     if(troco==OPERA_COM_TROCO && !PAGAMENTOS_get_timeout_pagamento() && PAGAMENTOS_get_valor_acumulado()){        
??APLICACAO_verifica_preparacao_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+255
        BNE.N    ??APLICACAO_verifica_preparacao_9
          CFI FunCall PAGAMENTOS_get_timeout_pagamento
        BL       PAGAMENTOS_get_timeout_pagamento
        CMP      R0,#+0
        BNE.N    ??APLICACAO_verifica_preparacao_9
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_preparacao_9
//  368       APLICACAO_devolve_troco();
          CFI FunCall APLICACAO_devolve_troco
        BL       APLICACAO_devolve_troco
//  369     }  
//  370 }
??APLICACAO_verifica_preparacao_9:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock8
//  371 /***********************************************************************************
//  372 *       Descri��o       :       Tela quando h� alguma falha na m�quina
//  373 *       Parametros      :       (unsigned char) idioma
//  374 *       Retorno         :       nenhum
//  375 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function APLICACAO_menu_falha
        THUMB
//  376 void APLICACAO_menu_falha(void){
APLICACAO_menu_falha:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  377   eTECLA tecla;
//  378                  
//  379   BOARD_setter_led_instrucao(LED_FORA_SERVICO,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+6
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  380   APLICACAO_devolve_troco(); // Devolve o valor ao cliente
          CFI FunCall APLICACAO_devolve_troco
        BL       APLICACAO_devolve_troco
//  381                              // devido a uma falha no sistema
//  382   
//  383   PAGAMENTOS_set_bloqueio(1);
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
        B.N      ??APLICACAO_menu_falha_0
//  384   
//  385   for(;;){
//  386     
//  387     APLICACAO_tela_descanso();           
//  388     
//  389     tecla = TECLADO_getch();
//  390     switch(tecla){
//  391       case TECLA_ENTER:
//  392           APLIACAO_wait_lcd();
??APLICACAO_menu_falha_1:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  393           BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  394           MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  395           BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  396           APLICACAO_release_lcd();             
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  397           STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);                   
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  398           break;
??APLICACAO_menu_falha_0:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_menu_falha_2
        BCC.N    ??APLICACAO_menu_falha_0
        CMP      R0,#+3
        BEQ.N    ??APLICACAO_menu_falha_3
        BCC.N    ??APLICACAO_menu_falha_4
        CMP      R0,#+4
        BEQ.N    ??APLICACAO_menu_falha_1
        B.N      ??APLICACAO_menu_falha_0
//  399       case TECLA_ESC:
//  400           break;
??APLICACAO_menu_falha_2:
        B.N      ??APLICACAO_menu_falha_0
//  401       case TECLA_INC:
//  402           break;
??APLICACAO_menu_falha_4:
        B.N      ??APLICACAO_menu_falha_0
//  403       case TECLA_DEC:
//  404           break;
??APLICACAO_menu_falha_3:
        B.N      ??APLICACAO_menu_falha_0
          CFI EndBlock cfiBlock9
//  405     }       
//  406   }
//  407 }
//  408 /***********************************************************************************
//  409 *       Descri��o       :       Fun��o para devolver o troco ao cliente
//  410 *       Parametros      :       (void)
//  411 *       Retorno         :       (unsigned char) maior do que zero se
//  412 *                               conseguiu devolver o troco
//  413 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function APLICACAO_devolve_troco
        THUMB
//  414 unsigned char APLICACAO_devolve_troco(void){
APLICACAO_devolve_troco:
        PUSH     {R0-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+32
//  415   unsigned int valor = PAGAMENTOS_get_valor_acumulado();
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        MOVS     R4,R0
//  416   unsigned int desconto = valor;
        MOVS     R5,R4
//  417   unsigned char tubos[16];
//  418   
//  419   PAGAMENTOS_set_bloqueio(0);
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  420   vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  421   
//  422   if(MDB_coin_check_tubes(tubos)){
        ADD      R0,SP,#+0
          CFI FunCall MDB_coin_check_tubes
        BL       MDB_coin_check_tubes
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_devolve_troco_0
//  423       
//  424     valor /= 25;
        MOVS     R0,#+25
        UDIV     R4,R4,R0
//  425     PAGAMENTOS_subtrai_valores(desconto);
        MOVS     R0,R5
          CFI FunCall PAGAMENTOS_subtrai_valores
        BL       PAGAMENTOS_subtrai_valores
//  426         
//  427     unsigned char moedas_15 = valor /15;
        MOVS     R0,#+15
        UDIV     R5,R4,R0
//  428     unsigned char moedas_rest = valor % 15;
        MOVS     R0,#+15
        UDIV     R1,R4,R0
        MLS      R4,R0,R1,R4
//  429         
//  430     for(unsigned char i=0;i<moedas_15;i++){
        MOVS     R6,#+0
        B.N      ??APLICACAO_devolve_troco_1
//  431       MDB_coin_dispenser(2,15);
??APLICACAO_devolve_troco_2:
        MOVS     R1,#+15
        MOVS     R0,#+2
          CFI FunCall MDB_coin_dispenser
        BL       MDB_coin_dispenser
//  432       vTaskDelay(5000);      
        MOVW     R0,#+5000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  433     }
        ADDS     R6,R6,#+1
??APLICACAO_devolve_troco_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R6,R5
        BCC.N    ??APLICACAO_devolve_troco_2
//  434         
//  435     if(moedas_rest){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??APLICACAO_devolve_troco_0
//  436       MDB_coin_dispenser(2,moedas_rest);
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+2
          CFI FunCall MDB_coin_dispenser
        BL       MDB_coin_dispenser
//  437       vTaskDelay(5000);                
        MOVW     R0,#+5000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  438      }
//  439   }
//  440       
//  441   return 1;      
??APLICACAO_devolve_troco_0:
        MOVS     R0,#+1
        ADD      SP,SP,#+16
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock10
//  442 }
//  443 /***********************************************************************************
//  444 *       Descri��o       :       Faz a verifica��o do POST
//  445 *       Parametros      :       nenhum
//  446 *       Retorno         :       nenhum
//  447 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function APLICACAO_verifica_post
        THUMB
//  448 unsigned char APLICACAO_verifica_post(void){
APLICACAO_verifica_post:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  449   ePOST_RESULT post = POST_entry();
          CFI FunCall POST_entry
        BL       POST_entry
        MOVS     R4,R0
//  450   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R5,R0
//  451   
//  452   switch(post){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??APLICACAO_verifica_post_0
//  453     case POST_SUCESSO:
//  454          return 1;
        MOVS     R0,#+1
        POP      {R1,R4,R5,PC}    ;; return
//  455     case POST_FALHA_VENTILADOR:
//  456     case POST_FALHA_RESISTENCIA:
//  457     case POST_FALHA_MDB_BILL:
//  458     case POST_FALHA_MDB_COIN:
//  459     case POST_FALHA_MDB_CASHLESS:
//  460     case POST_FALHA_CCTALK:
//  461     case POST_FALHA_PAPEL:
//  462     default:
//  463          switch(post){
??APLICACAO_verifica_post_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??APLICACAO_verifica_post_1
        BCC.N    ??APLICACAO_verifica_post_2
        CMP      R4,#+3
        BEQ.N    ??APLICACAO_verifica_post_3
        BCC.N    ??APLICACAO_verifica_post_4
        CMP      R4,#+5
        BEQ.N    ??APLICACAO_verifica_post_5
        BCC.N    ??APLICACAO_verifica_post_6
        CMP      R4,#+7
        BEQ.N    ??APLICACAO_verifica_post_7
        BCC.N    ??APLICACAO_verifica_post_8
        B.N      ??APLICACAO_verifica_post_2
//  464            case POST_FALHA_VENTILADOR:
//  465                 STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E0:MOTOR AR");                                    
??APLICACAO_verifica_post_1:
        LDR.W    R2,??DataTable15_19
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable15_15
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  466                 break;
        B.N      ??APLICACAO_verifica_post_2
//  467            case POST_FALHA_RESISTENCIA:
//  468                 STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E1:AQUECIMENTO");                
??APLICACAO_verifica_post_4:
        LDR.W    R2,??DataTable15_16
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable15_15
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  469                 break;
        B.N      ??APLICACAO_verifica_post_2
//  470            case POST_FALHA_MDB_BILL:
//  471                 break;
??APLICACAO_verifica_post_3:
        B.N      ??APLICACAO_verifica_post_2
//  472            case POST_FALHA_MDB_COIN:
//  473                 break;
??APLICACAO_verifica_post_6:
        B.N      ??APLICACAO_verifica_post_2
//  474            case POST_FALHA_MDB_CASHLESS:
//  475                 break;
??APLICACAO_verifica_post_5:
        B.N      ??APLICACAO_verifica_post_2
//  476            case POST_FALHA_CCTALK:
//  477                 break;
??APLICACAO_verifica_post_8:
        B.N      ??APLICACAO_verifica_post_2
//  478            case POST_FALHA_PAPEL:   
//  479                 STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E3:EMBALAGEM");              
??APLICACAO_verifica_post_7:
        LDR.W    R2,??DataTable15_18
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable15_15
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  480                 break;
//  481          }         
//  482          
//  483          PAGAMENTOS_set_bloqueio(1); // Bloqueia os meios de pagamento
??APLICACAO_verifica_post_2:
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  484          BOARD_liga_placa_instrucao(LED_FORA_SERVICO);
        MOVS     R0,#+6
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
        B.N      ??APLICACAO_verifica_post_9
//  485          
//  486          for(;;){
//  487            eTECLA tecla;
//  488            
//  489            tecla = TECLADO_getch();
//  490            
//  491            switch(tecla){
//  492              case TECLA_ENTER:
//  493                   APLIACAO_wait_lcd();
//  494                   BOARD_liga_placa_instrucao(0);
//  495                   MCFG_entry();                     
//  496                   BOARD_liga_placa_instrucao(1);
//  497                   idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
//  498                   APLICACAO_release_lcd();  
//  499            
//  500                   STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);               
//  501                   break;
//  502              case TECLA_ESC:
//  503                   break;
//  504              case TECLA_INC:
//  505                   break;
//  506              case TECLA_DEC: 
//  507                   break;
//  508            }
//  509            
//  510            APLICACAO_tela_descanso();
??APLICACAO_verifica_post_10:
??APLICACAO_verifica_post_11:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
??APLICACAO_verifica_post_9:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_verifica_post_12
        BCC.N    ??APLICACAO_verifica_post_11
        CMP      R0,#+3
        BEQ.N    ??APLICACAO_verifica_post_10
        BCC.N    ??APLICACAO_verifica_post_13
        CMP      R0,#+4
        BNE.N    ??APLICACAO_verifica_post_11
??APLICACAO_verifica_post_14:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
          CFI FunCall MCFG_entry
        BL       MCFG_entry
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R5,R0
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??APLICACAO_verifica_post_11
??APLICACAO_verifica_post_12:
        B.N      ??APLICACAO_verifica_post_11
??APLICACAO_verifica_post_13:
        B.N      ??APLICACAO_verifica_post_11
          CFI EndBlock cfiBlock11
//  511          }       
//  512   }
//  513 }
//  514 /***********************************************************************************
//  515 *       Descri��o       :       Faz a verifica��o de troco para o primeiro
//  516 *                               processo
//  517 *       Parametros      :       nenhum
//  518 *       Retorno         :       (unsigned char) maior do que zero
//  519 *                               se houver troco suficiente
//  520 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function APLICACAO_verifica_disponibilidade_troco
        THUMB
//  521 void APLICACAO_verifica_disponibilidade_troco(unsigned char idioma){
APLICACAO_verifica_disponibilidade_troco:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  522   unsigned char flag_notas;
//  523   unsigned int maior_nota=0;
        MOVS     R5,#+0
//  524   eTECLA tecla;
//  525   
//  526   PARAMETROS_le(ADR_NOTAS,(void*)&flag_notas);
        ADD      R1,SP,#+0
        MOVS     R0,#+2
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  527   if(flag_notas&0x01)
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_0
//  528     maior_nota = 100;
        MOVS     R5,#+100
//  529   if(flag_notas&0x02)
??APLICACAO_verifica_disponibilidade_troco_0:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_1
//  530     maior_nota = 200;
        MOVS     R5,#+200
//  531   if(flag_notas&0x04)
??APLICACAO_verifica_disponibilidade_troco_1:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_2
//  532     maior_nota = 500;
        MOV      R5,#+500
//  533   if(flag_notas&0x08)
??APLICACAO_verifica_disponibilidade_troco_2:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+28
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_3
//  534     maior_nota = 1000;
        MOV      R5,#+1000
//  535   if(flag_notas&0x10)
??APLICACAO_verifica_disponibilidade_troco_3:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_4
//  536     maior_nota = 2000;
        MOV      R5,#+2000
//  537   /*
//  538   if(flag_notas&0x20)
//  539     maior_nota = 5000;
//  540   */
//  541   
//  542   if( APLICACACAO_verifica_troco()<maior_nota){
??APLICACAO_verifica_disponibilidade_troco_4:
          CFI FunCall APLICACACAO_verifica_troco
        BL       APLICACACAO_verifica_troco
        CMP      R0,R5
        BCS.N    ??APLICACAO_verifica_disponibilidade_troco_5
//  543     
//  544     BOARD_setter_led_instrucao(LED_FORA_SERVICO,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+6
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  545     PAGAMENTOS_set_bloqueio(1);
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  546     STRING_write_to_external(CLEAR_DISPLAY,
//  547                              (char*)STRING_mensagem_sem_troco[idioma][0],
//  548                              (char*)STRING_mensagem_sem_troco[idioma][1]);    
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable15_20
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable15_20
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
        B.N      ??APLICACAO_verifica_disponibilidade_troco_6
//  549     
//  550     for(;APLICACACAO_verifica_troco()<maior_nota;){
//  551         
//  552       tecla = TECLADO_getch();
//  553       switch(tecla){
//  554         case TECLA_ENTER:
//  555             APLIACAO_wait_lcd();
//  556             BOARD_liga_placa_instrucao(0);
//  557             MCFG_entry();                     
//  558             BOARD_liga_placa_instrucao(1);
//  559             idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
//  560             APLICACAO_release_lcd();             
//  561             STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);        
//  562             break;
//  563         case TECLA_ESC:
//  564             break;
//  565       }    
//  566       
//  567       APLICACAO_tela_descanso();      
??APLICACAO_verifica_disponibilidade_troco_7:
??APLICACAO_verifica_disponibilidade_troco_8:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
??APLICACAO_verifica_disponibilidade_troco_6:
          CFI FunCall APLICACACAO_verifica_troco
        BL       APLICACACAO_verifica_troco
        CMP      R0,R5
        BCS.N    ??APLICACAO_verifica_disponibilidade_troco_9
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_verifica_disponibilidade_troco_7
        CMP      R0,#+4
        BNE.N    ??APLICACAO_verifica_disponibilidade_troco_8
??APLICACAO_verifica_disponibilidade_troco_10:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
          CFI FunCall MCFG_entry
        BL       MCFG_entry
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??APLICACAO_verifica_disponibilidade_troco_8
//  568     }//Fim do for(;;)        
//  569     PAGAMENTOS_set_bloqueio(0);
??APLICACAO_verifica_disponibilidade_troco_9:
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  570     BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  571     BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  572     BOARD_setter_led_instrucao(LED_INSIRA_DINHEIRO,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  573   }  
//  574 }
??APLICACAO_verifica_disponibilidade_troco_5:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock12
//  575 /***********************************************************************************
//  576 *       Descri��o       :       Verifica o barramento MDB
//  577 *       Parametros      :       nenhum
//  578 *       Retorno         :       nenhum
//  579 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function APLICACAO_verifica_MDB
        THUMB
//  580 void APLICACAO_verifica_MDB(void){
APLICACAO_verifica_MDB:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  581   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  582   
//  583   switch(MDB_checa_dispositivos()){
          CFI FunCall MDB_checa_dispositivos
        BL       MDB_checa_dispositivos
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_MDB_0
        CMP      R0,#+2
        BEQ.N    ??APLICACAO_verifica_MDB_1
        BCC.N    ??APLICACAO_verifica_MDB_2
        B.N      ??APLICACAO_verifica_MDB_3
//  584     case MDB_TODOS_ONLINE:            
//  585          return;
??APLICACAO_verifica_MDB_0:
??APLICACAO_verifica_MDB_4:
        POP      {R4,PC}          ;; return
//  586     case MDB_BILL_OFFLINE:
//  587          STRING_write_to_external(CLEAR_DISPLAY,
//  588                                   (char*)STRING_mensagem_noteiro_mdb_offline[idioma][0],
//  589                                   (char*)STRING_mensagem_noteiro_mdb_offline[idioma][1]);          
??APLICACAO_verifica_MDB_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable15_21
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable15_21
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  590          break;
        B.N      ??APLICACAO_verifica_MDB_3
//  591     case MDB_COIN_OFFLINE:
//  592          STRING_write_to_external(CLEAR_DISPLAY,
//  593                                   (char*)STRING_mensagem_moedeiro_mdb_offline[idioma][0],
//  594                                   (char*)STRING_mensagem_moedeiro_mdb_offline[idioma][1]);           
??APLICACAO_verifica_MDB_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable15_22
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable15_22
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  595          break;
??APLICACAO_verifica_MDB_3:
        B.N      ??APLICACAO_verifica_MDB_5
//  596   }  
//  597   
//  598   eTECLA tecla;
//  599   
//  600   for(;;){
//  601     
//  602     if(MDB_checa_dispositivos()==MDB_TODOS_ONLINE)
//  603       return;
//  604     
//  605     tecla = TECLADO_getch();
//  606     switch(tecla){
//  607       case TECLA_ENTER:
//  608             APLIACAO_wait_lcd();
//  609             BOARD_liga_placa_instrucao(0);
//  610             MCFG_entry();                     
//  611             BOARD_liga_placa_instrucao(1);
//  612             idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
//  613             APLICACAO_release_lcd();             
//  614             STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);              
//  615            break;
//  616       case TECLA_ESC:
//  617            break;
//  618     }    
//  619     APLICACAO_tela_descanso();      
??APLICACAO_verifica_MDB_6:
??APLICACAO_verifica_MDB_7:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  620     vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??APLICACAO_verifica_MDB_5:
          CFI FunCall MDB_checa_dispositivos
        BL       MDB_checa_dispositivos
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_MDB_4
??APLICACAO_verifica_MDB_8:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_verifica_MDB_6
        CMP      R0,#+4
        BNE.N    ??APLICACAO_verifica_MDB_7
??APLICACAO_verifica_MDB_9:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
          CFI FunCall MCFG_entry
        BL       MCFG_entry
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??APLICACAO_verifica_MDB_7
          CFI EndBlock cfiBlock13
//  621   }
//  622 }
//  623 /***********************************************************************************
//  624 *       Descri��o       :       Faz a verifica��o do meio de pagamento
//  625 *                               CCTALK
//  626 *       Parametros      :       nenhum
//  627 *       Retorno         :       nenhum
//  628 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function APLICACAO_verifica_cctalk
        THUMB
//  629 void APLICACAO_verifica_cctalk(void){
APLICACAO_verifica_cctalk:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  630   unsigned char flag;
//  631   
//  632   PARAMETROS_le(ADR_FLAG_BV20,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  633   
//  634   if(!flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??APLICACAO_verifica_cctalk_0
//  635     return;  
??APLICACAO_verifica_cctalk_1:
        POP      {R0,R1,R4,PC}    ;; return
//  636   
//  637   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
??APLICACAO_verifica_cctalk_0:
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  638   eBV20_state estado_atual = BV20_get_current_state();
          CFI FunCall BV20_get_current_state
        BL       BV20_get_current_state
//  639   
//  640   if(estado_atual!=BV20_OFFLINE)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??APLICACAO_verifica_cctalk_1
//  641     return;
//  642   
//  643   STRING_write_to_external(CLEAR_DISPLAY,
//  644                            (char*)STRING_mensagem_cctalk_offline[idioma][0],
//  645                            (char*)STRING_mensagem_cctalk_offline[idioma][1]);       
??APLICACAO_verifica_cctalk_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable15_23
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable15_23
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
        B.N      ??APLICACAO_verifica_cctalk_3
//  646     
//  647   eTECLA tecla;
//  648   
//  649   for(;;){
//  650     
//  651     estado_atual = BV20_get_current_state();
//  652     
//  653     if(estado_atual!=BV20_OFFLINE)
//  654       return;
//  655     
//  656     tecla = TECLADO_getch();
//  657     switch(tecla){
//  658       case TECLA_ENTER:
//  659             BOARD_reset_tempo_propaganda();
//  660             APLIACAO_wait_lcd();
//  661             BOARD_liga_placa_instrucao(0);
//  662             MCFG_entry();                     
//  663             BOARD_liga_placa_instrucao(1);
//  664             idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
//  665             APLICACAO_release_lcd();             
//  666             STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);              
//  667             BOARD_reset_tempo_propaganda();
//  668            break;
//  669       case TECLA_ESC:
//  670            break;
//  671     }    
//  672     APLICACAO_tela_descanso();      
??APLICACAO_verifica_cctalk_4:
??APLICACAO_verifica_cctalk_5:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  673     vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??APLICACAO_verifica_cctalk_3:
          CFI FunCall BV20_get_current_state
        BL       BV20_get_current_state
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??APLICACAO_verifica_cctalk_1
??APLICACAO_verifica_cctalk_6:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_verifica_cctalk_4
        CMP      R0,#+4
        BNE.N    ??APLICACAO_verifica_cctalk_5
??APLICACAO_verifica_cctalk_7:
          CFI FunCall BOARD_reset_tempo_propaganda
        BL       BOARD_reset_tempo_propaganda
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
          CFI FunCall MCFG_entry
        BL       MCFG_entry
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
          CFI FunCall BOARD_reset_tempo_propaganda
        BL       BOARD_reset_tempo_propaganda
        B.N      ??APLICACAO_verifica_cctalk_5
          CFI EndBlock cfiBlock14
//  674   }    
//  675 }
//  676 /***********************************************************************************
//  677 *       Descri��o       :       Faz a verifica��o c�clica dos sinais 
//  678 *                               do papel e do termistor
//  679 *       Parametros      :       nenhum
//  680 *       Retorno         :       nenhum
//  681 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function APLICACAO_verificao_ciclica
        THUMB
//  682 void APLICACAO_verificao_ciclica(void){
APLICACAO_verificao_ciclica:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  683   
//  684   switch(POST_verificacao_ciclica()){
          CFI FunCall POST_verificacao_ciclica
        BL       POST_verificacao_ciclica
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verificao_ciclica_0
        CMP      R0,#+2
        BEQ.N    ??APLICACAO_verificao_ciclica_1
        BCC.N    ??APLICACAO_verificao_ciclica_2
        B.N      ??APLICACAO_verificao_ciclica_3
//  685    case POST_CICLICO_SUCESSO:
//  686         break;
??APLICACAO_verificao_ciclica_0:
        B.N      ??APLICACAO_verificao_ciclica_3
//  687    case POST_CICLICO_FALHA_EMBALAGEM:
//  688         STRING_write_to_external(CLEAR_DISPLAY,"E03:FALTA","EMBALAGEM");
??APLICACAO_verificao_ciclica_2:
        LDR.N    R2,??DataTable15_24
        LDR.N    R1,??DataTable15_25
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  689         APLICACAO_loop_falha_ciclica();
          CFI FunCall APLICACAO_loop_falha_ciclica
        BL       APLICACAO_loop_falha_ciclica
//  690         break;
        B.N      ??APLICACAO_verificao_ciclica_3
//  691    case POST_CICLICO_FALHA_TERMISTOR:
//  692         STRING_write_to_external(CLEAR_DISPLAY,"E04:FALHA","SENS. TEMP.");
??APLICACAO_verificao_ciclica_1:
        LDR.N    R2,??DataTable15_26
        LDR.N    R1,??DataTable15_27
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  693         APLICACAO_loop_falha_ciclica();
          CFI FunCall APLICACAO_loop_falha_ciclica
        BL       APLICACAO_loop_falha_ciclica
//  694         break;
//  695   }  
//  696 }
??APLICACAO_verificao_ciclica_3:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock15
//  697 /***********************************************************************************
//  698 *       Descri��o       :       Menu do loop onde h� a falha no sensor de
//  699 *                               temperatura ou falta de embalagem
//  700 *       Parametros      :       nenhum
//  701 *       Retorno         :       nenhum
//  702 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function APLICACAO_loop_falha_ciclica
        THUMB
//  703 void APLICACAO_loop_falha_ciclica(void){
APLICACAO_loop_falha_ciclica:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  704   eTECLA tecla;
//  705   unsigned char loop=1;
        MOVS     R4,#+1
        B.N      ??APLICACAO_loop_falha_ciclica_0
//  706     
//  707   for(;loop;){
//  708     
//  709     tecla = TECLADO_getch();
//  710     switch(tecla){
//  711       case TECLA_ENTER:
//  712           MCFG_entry();                     
//  713            break;
//  714       case TECLA_ESC:
//  715            loop = 0;
??APLICACAO_loop_falha_ciclica_1:
        MOVS     R4,#+0
//  716            break;
//  717     }      
//  718     
//  719     APLICACAO_tela_descanso();    
??APLICACAO_loop_falha_ciclica_2:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
??APLICACAO_loop_falha_ciclica_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??APLICACAO_loop_falha_ciclica_3
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_loop_falha_ciclica_1
        CMP      R0,#+4
        BNE.N    ??APLICACAO_loop_falha_ciclica_2
??APLICACAO_loop_falha_ciclica_4:
          CFI FunCall MCFG_entry
        BL       MCFG_entry
        B.N      ??APLICACAO_loop_falha_ciclica_2
//  720   }  
//  721   
//  722   STRING_write_to_internal(CLEAR_DISPLAY,"REINICIANDO","VERIFICACAO");
??APLICACAO_loop_falha_ciclica_3:
        LDR.N    R2,??DataTable15_28
        LDR.N    R1,??DataTable15_29
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  723   vTaskDelay(3000);  
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  724 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock16
//  725 /***********************************************************************************
//  726 *       Descri��o       :       Ciclo de desumidifica��o da m�quina
//  727 *       Parametros      :       nenhum
//  728 *       Retorno         :       nenhum
//  729 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function APLICACAO_ciclo_desumidificador
        THUMB
//  730 void APLICACAO_ciclo_desumidificador(unsigned char flag){
APLICACAO_ciclo_desumidificador:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  731   
//  732   if(flag && !APLICACAO_tempo_desumidificador){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_ciclo_desumidificador_0
        LDR.N    R0,??DataTable15
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??APLICACAO_ciclo_desumidificador_0
//  733     
//  734     unsigned int tempo=30000;
        MOVW     R4,#+30000
//  735     
//  736     STRING_write_to_internal(CLEAR_DISPLAY,"CICLO DE","DESUMIDIFICACAO");
        LDR.N    R2,??DataTable15_30
        LDR.N    R1,??DataTable15_31
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  737     STRING_write_to_external(CLEAR_DISPLAY,"CICLO DE","DESUMIDIFICACAO");
        LDR.N    R2,??DataTable15_30
        LDR.N    R1,??DataTable15_31
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  738     
//  739     POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  740     POTENCIA_setRPM(6000);
        MOVW     R0,#+6000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  741     CT_set_temperatura(60);
        MOVS     R0,#+60
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  742     vTaskDelay(3000);
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??APLICACAO_ciclo_desumidificador_1
//  743     
//  744     while(tempo--){
//  745       
//  746       if(POTENCIA_getRPMmedido()<1000){
//  747         CT_set_temperatura(0);
//  748         POTENCIA_setRPM(0);
//  749         POTENCIA_set_neutro(0);        
//  750         return;
//  751       }
//  752       vTaskDelay(1);
??APLICACAO_ciclo_desumidificador_2:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??APLICACAO_ciclo_desumidificador_1:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_ciclo_desumidificador_3
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        CMP      R0,#+1000
        BCS.N    ??APLICACAO_ciclo_desumidificador_2
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
        B.N      ??APLICACAO_ciclo_desumidificador_4
//  753     }
//  754     
//  755     CT_set_temperatura(0);
??APLICACAO_ciclo_desumidificador_3:
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  756     POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  757     POTENCIA_set_neutro(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  758     APLICACAO_verifica_post();
          CFI FunCall APLICACAO_verifica_post
        BL       APLICACAO_verifica_post
//  759     APLICACAO_tempo_desumidificador = TEMPO_DESUMIDIFICADOR;
        LDR.N    R0,??DataTable15
        LDR.N    R1,??DataTable15_1  ;; 0x1b7740
        STR      R1,[R0, #+0]
//  760   }
//  761 }
??APLICACAO_ciclo_desumidificador_0:
??APLICACAO_ciclo_desumidificador_4:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock17
//  762 /***********************************************************************************
//  763 *       Descri��o       :       Tela para reiniciar o sistema
//  764 *       Parametros      :       nenhum
//  765 *       Retorno         :       nenhum
//  766 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function APLICACAO_reset_hardware
        THUMB
//  767 void APLICACAO_reset_hardware(void){
APLICACAO_reset_hardware:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  768   
//  769   STRING_write_to_internal(CLEAR_DISPLAY,"reiniciando","sistema");
        LDR.N    R2,??DataTable15_32
        LDR.N    R1,??DataTable15_33
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  770   STRING_write_to_external(CLEAR_DISPLAY,"reiniciando","sistema");
        LDR.N    R2,??DataTable15_32
        LDR.N    R1,??DataTable15_33
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  771   
//  772   __disable_interrupt();
        CPSID    I
//  773   WATCHDOG_init();
          CFI FunCall WATCHDOG_init
        BL       WATCHDOG_init
//  774   for(;;);  
??APLICACAO_reset_hardware_0:
        B.N      ??APLICACAO_reset_hardware_0
          CFI EndBlock cfiBlock18
//  775 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     APLICACAO_tempo_desumidificador

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_1:
        DC32     0x1b7740

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_2:
        DC32     STRING_mensagem_modo_gratis

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_3:
        DC32     STRING_splash

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_4:
        DC32     STRING_mensagem_saudacao_maquina

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_5:
        DC32     APLICACAO_sem_LCD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_6:
        DC32     `?<Constant "RPM:%05d T%03doC">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_7:
        DC32     `?<Constant "P:%04d M:%04d,%02d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_8:
        DC32     STRING_mensagem_preco

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_9:
        DC32     STRING_mensagem_pago

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_10:
        DC32     APLICACAO_tempo_mensagem

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_11:
        DC32     ??indice

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_12:
        DC32     APLICACAO_tubos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_13:
        DC32     STRING_mensagem_retire_troco

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_14:
        DC32     `?<Constant "E0:VENTILADOR">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_15:
        DC32     STRING_mensagem_fora_servico

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_16:
        DC32     `?<Constant "E1:AQUECIMENTO">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_17:
        DC32     `?<Constant "E2:DOSADOR">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_18:
        DC32     `?<Constant "E3:EMBALAGEM">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_19:
        DC32     `?<Constant "E0:MOTOR AR">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_20:
        DC32     STRING_mensagem_sem_troco

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_21:
        DC32     STRING_mensagem_noteiro_mdb_offline

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_22:
        DC32     STRING_mensagem_moedeiro_mdb_offline

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_23:
        DC32     STRING_mensagem_cctalk_offline

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_24:
        DC32     `?<Constant "EMBALAGEM">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_25:
        DC32     `?<Constant "E03:FALTA">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_26:
        DC32     `?<Constant "SENS. TEMP.">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_27:
        DC32     `?<Constant "E04:FALHA">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_28:
        DC32     `?<Constant "VERIFICACAO">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_29:
        DC32     `?<Constant "REINICIANDO">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_30:
        DC32     `?<Constant "DESUMIDIFICACAO">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_31:
        DC32     `?<Constant "CICLO DE">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_32:
        DC32     `?<Constant "sistema">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_33:
        DC32     `?<Constant "reiniciando">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "RPM:%05d T%03doC">`:
        DATA
        DC8 "RPM:%05d T%03doC"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "P:%04d M:%04d,%02d">`:
        DATA
        DC8 "P:%04d M:%04d,%02d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "E0:VENTILADOR">`:
        DATA
        DC8 "E0:VENTILADOR"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "E1:AQUECIMENTO">`:
        DATA
        DC8 "E1:AQUECIMENTO"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "E2:DOSADOR">`:
        DATA
        DC8 "E2:DOSADOR"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "E3:EMBALAGEM">`:
        DATA
        DC8 "E3:EMBALAGEM"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "E0:MOTOR AR">`:
        DATA
        DC8 "E0:MOTOR AR"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "E03:FALTA">`:
        DATA
        DC8 "E03:FALTA"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "EMBALAGEM">`:
        DATA
        DC8 "EMBALAGEM"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "E04:FALHA">`:
        DATA
        DC8 "E04:FALHA"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SENS. TEMP.">`:
        DATA
        DC8 "SENS. TEMP."

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "REINICIANDO">`:
        DATA
        DC8 "REINICIANDO"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "VERIFICACAO">`:
        DATA
        DC8 "VERIFICACAO"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CICLO DE">`:
        DATA
        DC8 "CICLO DE"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "DESUMIDIFICACAO">`:
        DATA
        DC8 "DESUMIDIFICACAO"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "reiniciando">`:
        DATA
        DC8 "reiniciando"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "sistema">`:
        DATA
        DC8 "sistema"

        END
//  776 /***********************************************************************************
//  777 *       Fim do arquivo
//  778 ***********************************************************************************/
// 
//    25 bytes in section .bss
//     4 bytes in section .data
//   232 bytes in section .rodata
// 2 594 bytes in section .text
// 
// 2 594 bytes of CODE  memory
//   232 bytes of CONST memory
//    29 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
