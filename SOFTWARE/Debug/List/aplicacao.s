///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  13:45:29 /
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
//   17 |       Arquivo            :  aplicacao.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  22/04/2017
//   21 |
//   22 |       Revisões           :  001
//   23 |
//   24 |                             (22/04/2017) criado módulo de controle da preparação (Marcos)
//   25 |                             (25/05/2017) alterado para criar o flag que habilita o 
//   26 |                                          uso do troco ou não
//   27 |                             (23/07/2017) Alterado para só rodar o bloco de verificação
//   28 |                                          do CCTALK quando ele estiver habilitado
//   29 |                                          nos acessórios
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
//   52 *       Enumerações
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
//   64 *       Funções
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
//   82 
//   83 /***********************************************************************************
//   84 *       Implementação das funções
//   85 ***********************************************************************************/
//   86 
//   87 /***********************************************************************************
//   88 *       Descrição       :       Função principal da interface de usuário
//   89 *       Parametros      :       nenhum
//   90 *       Retorno         :       nenhum
//   91 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function APLICACAO_main
        THUMB
//   92 void APLICACAO_main(void*pPar){
APLICACAO_main:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
//   93   eTECLA tecla;
//   94   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//   95   unsigned int valorPipoca;
//   96   unsigned char modo_gratis;
//   97   unsigned char modo_troco;
//   98   unsigned char flag_desumidificador;
//   99   
//  100   APLICACAO_ini();
          CFI FunCall APLICACAO_ini
        BL       APLICACAO_ini
//  101   
//  102   PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  103   PARAMETROS_le(ADR_FLAG_FREE,(void*)&modo_gratis);
        ADD      R1,SP,#+1
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  104   PARAMETROS_le(ADR_FLAG_TROCO,(void*)&modo_troco);
        ADD      R1,SP,#+0
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  105   PARAMETROS_le(ADR_FLAG_DESUMIDIFICADOR,(void*)&flag_desumidificador);
        ADD      R1,SP,#+2
        MOVS     R0,#+38
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  106   
//  107 #ifndef _DEBUG_PAGAMENTOS_
//  108   vTaskDelay(3000);
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  109   PREPARACAO_limpeza_inicial(idioma);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PREPARACAO_limpeza_inicial
        BL       PREPARACAO_limpeza_inicial
//  110 #endif
//  111   
//  112   
//  113   STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  114   
//  115   BOARD_liga_placa_instrucao(1); // Liga a placa de instrução  
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  116   
//  117   BOARD_setter_contador_propaganda(0); // Deixa a propaganda agendada para o primeiro ciclo
        MOVS     R0,#+0
          CFI FunCall BOARD_setter_contador_propaganda
        BL       BOARD_setter_contador_propaganda
//  118   
//  119 #ifndef _DEBUG_PAGAMENTOS_  
//  120   APLICACAO_verifica_post();
          CFI FunCall APLICACAO_verifica_post
        BL       APLICACAO_verifica_post
//  121 #endif
//  122     
//  123   PAGAMENTOS_subtrai_valores(PAGAMENTOS_get_valor_acumulado());
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
          CFI FunCall PAGAMENTOS_subtrai_valores
        BL       PAGAMENTOS_subtrai_valores
//  124   PAGAMENTOS_set_bloqueio(0);
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
        B.N      ??APLICACAO_main_0
//  125   
//  126   for(;;){
//  127     
//  128     PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
//  129     PARAMETROS_le(ADR_FLAG_FREE,(void*)&modo_gratis);
//  130     PARAMETROS_le(ADR_FLAG_TROCO,(void*)&modo_troco);    
//  131     
//  132     tecla = TECLADO_getch();
//  133     switch(tecla){
//  134       case TECLA_INC:
//  135            //SMDB_cashless_vend(100,1);
//  136            break;
//  137       case TECLA_DEC:
//  138            break;
//  139       case TECLA_ENTER:
//  140            APLIACAO_wait_lcd();
//  141              BOARD_liga_placa_instrucao(0);
//  142              MCFG_entry();                     
//  143              BOARD_liga_placa_instrucao(1);
//  144              idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
//  145              
//  146              PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
//  147              PARAMETROS_le(ADR_FLAG_FREE,(void*)&modo_gratis);
//  148              PARAMETROS_le(ADR_FLAG_TROCO,(void*)&modo_troco);             
//  149              
//  150              APLICACAO_tempo_desumidificador=30*60*1000;
//  151              
//  152            APLICACAO_release_lcd();  
//  153            
//  154            STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
//  155            
//  156            HD44780_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);       
//  157            HD44780_2_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);              
//  158            break;
//  159       case TECLA_ESC:
//  160            break;
//  161       case TECLA_GRATIS:
//  162            if(modo_gratis)
//  163              PAGAMENTOS_adiciona_valores(valorPipoca);
//  164            break;      
//  165     }
//  166     
//  167     if(modo_gratis)
//  168       STRING_write_to_external(NO_CLEAR,(void*)STRING_mensagem_modo_gratis[idioma][0],(void*)STRING_mensagem_modo_gratis[idioma][1]);
//  169     else{
//  170       APLICACAO_exibe_valor(idioma);     
??APLICACAO_main_1:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall APLICACAO_exibe_valor
        BL       APLICACAO_exibe_valor
//  171       if(modo_troco)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_main_2
//  172         APLICACAO_verifica_disponibilidade_troco(idioma);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall APLICACAO_verifica_disponibilidade_troco
        BL       APLICACAO_verifica_disponibilidade_troco
//  173       // Verifica a conectividade dos
//  174       // meios de pagamento seriais
//  175       APLICACAO_verifica_MDB();
??APLICACAO_main_2:
          CFI FunCall APLICACAO_verifica_MDB
        BL       APLICACAO_verifica_MDB
//  176       APLICACAO_verifica_cctalk();
          CFI FunCall APLICACAO_verifica_cctalk
        BL       APLICACAO_verifica_cctalk
//  177     }
//  178     
//  179     APLICACAO_verifica_preparacao(valorPipoca,idioma,modo_troco);             
??APLICACAO_main_3:
        LDRB     R2,[SP, #+0]
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R0,[SP, #+4]
          CFI FunCall APLICACAO_verifica_preparacao
        BL       APLICACAO_verifica_preparacao
//  180     BOARD_setter_led_instrucao(LED_INSIRA_DINHEIRO,PISCANDO); // Ativa o modo inserir dinheiro
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  181     APLICACAO_tela_descanso();    
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  182 #ifndef _DEBUG_PAGAMENTOS_    
//  183     APLICACAO_verificao_ciclica();
          CFI FunCall APLICACAO_verificao_ciclica
        BL       APLICACAO_verificao_ciclica
//  184 #endif
//  185     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  186     APLICACAO_ciclo_desumidificador(flag_desumidificador);
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
        LDR.W    R0,??DataTable14
        LDR.W    R1,??DataTable14_1  ;; 0x1b7740
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
        LDR.W    R0,??DataTable14_2
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_2
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
        B.N      ??APLICACAO_main_3
          CFI EndBlock cfiBlock0
//  187   }   
//  188 }
//  189 /***********************************************************************************
//  190 *       Descrição       :       Inicialização do ódulo
//  191 *       Parametros      :       nenhum
//  192 *       Retorno         :       nenhum
//  193 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function APLICACAO_ini
        THUMB
//  194 void APLICACAO_ini(void){
APLICACAO_ini:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  195   eIDIOMA idioma  = BRASIL;
        MOVS     R4,#+0
//  196        
//  197   HD44780_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,
//  198                LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);     
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_init
        BL       HD44780_init
//  199   
//  200   HD44780_2_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,
//  201                  LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);       
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_2_init
        BL       HD44780_2_init
//  202   
//  203   STRING_write_to_internal(CLEAR_DISPLAY,
//  204                            (char*)STRING_splash[idioma][0],
//  205                            (char*)STRING_splash[idioma][1]);      
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_3
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_3
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  206   
//  207   STRING_write_to_external(CLEAR_DISPLAY,
//  208                            (char*)STRING_mensagem_saudacao_maquina[idioma][0],
//  209                            (char*)STRING_mensagem_saudacao_maquina[idioma][1]);      
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_4
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_4
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  210   
//  211   vSemaphoreCreateBinary(APLICACAO_sem_LCD);
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall xQueueCreate
        BL       xQueueCreate
        LDR.W    R1,??DataTable14_5
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable14_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_ini_0
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.W    R0,??DataTable14_5
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  212 }
??APLICACAO_ini_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  213 /***********************************************************************************
//  214 *       Descrição       :       Semáforo para acessar o LCD
//  215 *       Parametros      :       nenhum
//  216 *       Retorno         :       nenhum
//  217 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function APLIACAO_wait_lcd
        THUMB
//  218 void APLIACAO_wait_lcd(void){
APLIACAO_wait_lcd:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  219   
//  220   while(!xSemaphoreTake(APLICACAO_sem_LCD,portTICK_RATE_MS*1));
??APLIACAO_wait_lcd_0:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.W    R0,??DataTable14_5
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??APLIACAO_wait_lcd_0
//  221 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  222 /***********************************************************************************
//  223 *       Descrição       :       Libera o semáforo do LCD
//  224 *       Parametros      :       nenhum
//  225 *       Retorno         :       nenhum
//  226 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function APLICACAO_release_lcd
        THUMB
//  227 void APLICACAO_release_lcd(void){
APLICACAO_release_lcd:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  228   
//  229   xSemaphoreGive(APLICACAO_sem_LCD);
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.W    R0,??DataTable14_5
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  230 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  231 /***********************************************************************************
//  232 *       Descrição       :       Funções para carregar o idioma
//  233 *       Parametros      :       nenhum
//  234 *       Retorno         :       nenhum
//  235 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function APLICACAO_carrega_idioma
        THUMB
//  236 unsigned char APLICACAO_carrega_idioma(void){
APLICACAO_carrega_idioma:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  237   unsigned char idioma  = BRASIL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  238   
//  239   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);  
        ADD      R1,SP,#+0
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  240   if(idioma>QTY_OF_LANGUAGES)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+8
        BLT.N    ??APLICACAO_carrega_idioma_0
//  241     idioma = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  242   
//  243   return idioma;
??APLICACAO_carrega_idioma_0:
        LDRB     R0,[SP, #+0]
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
//  244 }
//  245 /***********************************************************************************
//  246 *       Descrição       :       Tela de descanso do display interno
//  247 *       Parametros      :       nenhum
//  248 *       Retorno         :       nenhum
//  249 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function APLICACAO_tela_descanso
        THUMB
//  250 void APLICACAO_tela_descanso(void){
APLICACAO_tela_descanso:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+24
          CFI CFA R13+40
//  251   char buffer_linha[17];
//  252   
//  253   sprintf(buffer_linha,"RPM:%05d T%03doC",POTENCIA_getRPMmedido(),AA_calculaTemperatura());
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        MOVS     R4,R0
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R3,R4
        MOVS     R2,R0
        LDR.W    R1,??DataTable14_6
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  254   STRING_write_to_internal(NO_CLEAR,buffer_linha,NULL);    
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  255   
//  256   sprintf(buffer_linha,"P:%04d M:%04d,%02d",AA_mediaMovelPapel(),
//  257                                             PAGAMENTOS_get_valor_acumulado()/100,
//  258                                             PAGAMENTOS_get_valor_acumulado()%100);
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
        LDR.W    R1,??DataTable14_7
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  259   
//  260   STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  261 }
        ADD      SP,SP,#+24
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock5
//  262 /***********************************************************************************
//  263 *       Descrição       :       Exibe o valor da pipoca e 
//  264 *                               o quanto já foi pago pelo cliente
//  265 *       Parametros      :       nenhum
//  266 *       Retorno         :       nenhum
//  267 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function APLICACAO_exibe_valor
        THUMB
//  268 void APLICACAO_exibe_valor(unsigned char idioma){
APLICACAO_exibe_valor:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
        MOVS     R4,R0
//  269   unsigned int valor;
//  270   char buffer_linha[17];
//  271   static unsigned char indice=0;
//  272   
//  273   PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  274   sprintf(buffer_linha,STRING_mensagem_preco[idioma],valor/100,valor%100);
        LDR      R0,[SP, #+0]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        MLS      R3,R1,R2,R0
        LDR      R0,[SP, #+0]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_8
        LDR      R1,[R0, R4, LSL #+2]
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  275   STRING_write_to_external(NO_CLEAR,buffer_linha,NULL);    
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  276   
//  277   unsigned int pago = PAGAMENTOS_get_valor_acumulado();
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
//  278   
//  279   if(pago){    
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_exibe_valor_0
//  280     sprintf(buffer_linha,STRING_mensagem_pago[idioma],pago/100,pago%100);
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        MLS      R3,R1,R2,R0
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_9
        LDR      R1,[R0, R4, LSL #+2]
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  281     STRING_write_to_external(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
        B.N      ??APLICACAO_exibe_valor_1
//  282   }
//  283   else{
//  284     if(!APLICACAO_tempo_mensagem){
??APLICACAO_exibe_valor_0:
        LDR.W    R0,??DataTable14_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??APLICACAO_exibe_valor_2
//  285       indice = (indice+1) % 4;
        LDR.W    R0,??DataTable14_11
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+4
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.W    R0,??DataTable14_11
        STRB     R2,[R0, #+0]
//  286       APLICACAO_tempo_mensagem = TEMPO_MENSAGEM_LINHA_INFERIOR;
        LDR.W    R0,??DataTable14_10
        MOVW     R1,#+10000
        STR      R1,[R0, #+0]
//  287     }
//  288     PARAMETROS_le(ADR_MENSAGEM_CLIENTE_01+indice,(void*)buffer_linha);
??APLICACAO_exibe_valor_2:
        ADD      R1,SP,#+4
        LDR.W    R0,??DataTable14_11
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+60
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  289     STRING_write_to_external(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  290   }
//  291 }
??APLICACAO_exibe_valor_1:
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock6

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??indice:
        DS8 1
//  292 /***********************************************************************************
//  293 *       Descrição       :       Verifica a contagem dos tubos de moeda
//  294 *       Parametros      :       nenhum
//  295 *       Retorno         :       (unsigned char) maior do que zero se há troco
//  296 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function APLICACACAO_verifica_troco
        THUMB
//  297 unsigned int APLICACACAO_verifica_troco(void){
APLICACACAO_verifica_troco:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  298   
//  299   if(MDB_coin_check_tubes(APLICACAO_tubos)){      
        LDR.W    R0,??DataTable14_12
          CFI FunCall MDB_coin_check_tubes
        BL       MDB_coin_check_tubes
        CMP      R0,#+0
        BEQ.N    ??APLICACACAO_verifica_troco_0
//  300     return APLICACAO_tubos[2]*25;
        LDR.W    R0,??DataTable14_12
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+25
        MULS     R0,R1,R0
        B.N      ??APLICACACAO_verifica_troco_1
//  301   }
//  302   
//  303   return 0;
??APLICACACAO_verifica_troco_0:
        MOVS     R0,#+0
??APLICACACAO_verifica_troco_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock7
//  304 }
//  305 /***********************************************************************************
//  306 *       Descrição       :       Faz a verificação dos pagamentos para
//  307 *                               iniciar o ciclo de preparação
//  308 *       Parametros      :       (unsigned int) valor da pipoca
//  309 *       Retorno         :       nenhum
//  310 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function APLICACAO_verifica_preparacao
        THUMB
//  311 void APLICACAO_verifica_preparacao(unsigned int valor_pipoca,unsigned char idioma,
//  312                                    unsigned char troco){
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
//  313    unsigned int ajuste;
//  314   
//  315   if( PAGAMENTOS_get_valor_acumulado()>=valor_pipoca) {      
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        CMP      R0,R5
        BCC.W    ??APLICACAO_verifica_preparacao_0
//  316     
//  317     if(troco==OPERA_SEM_TROCO || APLICACACAO_verifica_troco()>=valor_pipoca){     
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??APLICACAO_verifica_preparacao_1
          CFI FunCall APLICACACAO_verifica_troco
        BL       APLICACACAO_verifica_troco
        CMP      R0,R5
        BCC.N    ??APLICACAO_verifica_preparacao_2
//  318       // Switch para 
//  319       // capturar os resultados da execução do processo
//  320       switch(PREPARACAO_entry(&ajuste,CONTABILIZA)){
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
//  321         case SUCESSO:
//  322              PAGAMENTOS_subtrai_valores(valor_pipoca);          
??APLICACAO_verifica_preparacao_3:
        MOVS     R0,R5
          CFI FunCall PAGAMENTOS_subtrai_valores
        BL       PAGAMENTOS_subtrai_valores
//  323              // Devolve o troco caso ainda reste valor
//  324              // pago no acumulador de moeda
//  325              if(troco==OPERA_COM_TROCO && PAGAMENTOS_get_valor_acumulado()){               
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+255
        BNE.N    ??APLICACAO_verifica_preparacao_8
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_preparacao_8
//  326                STRING_write_to_external(CLEAR_DISPLAY,
//  327                                         (char*)STRING_mensagem_retire_troco[idioma][0],
//  328                                         (char*)STRING_mensagem_retire_troco[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_13
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_13
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  329                APLICACAO_devolve_troco();      
          CFI FunCall APLICACAO_devolve_troco
        BL       APLICACAO_devolve_troco
//  330              }
//  331              PREPARACAO_resfriamento(idioma);
??APLICACAO_verifica_preparacao_8:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PREPARACAO_resfriamento
        BL       PREPARACAO_resfriamento
//  332              STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);                
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  333              PAGAMENTOS_set_bloqueio(0);
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  334              HD44780_init(LCD_DISPLAY_8X5   | LCD_2_LINHAS,LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);       
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_init
        BL       HD44780_init
//  335              HD44780_2_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);                
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_2_init
        BL       HD44780_2_init
//  336              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  337         case FALHA_VENTILADOR:
//  338              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E0:VENTILADOR");                       
??APLICACAO_verifica_preparacao_5:
        LDR.W    R2,??DataTable14_14
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_15
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  339              APLICACAO_menu_falha();
          CFI FunCall APLICACAO_menu_falha
        BL       APLICACAO_menu_falha
//  340              PAGAMENTOS_set_bloqueio(0);             
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  341              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  342         case FALHA_RESISTENCIA:
//  343              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E1:AQUECIMENTO");
??APLICACAO_verifica_preparacao_4:
        LDR.W    R2,??DataTable14_16
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_15
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  344              APLICACAO_menu_falha();
          CFI FunCall APLICACAO_menu_falha
        BL       APLICACAO_menu_falha
//  345              PAGAMENTOS_set_bloqueio(0);             
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  346              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  347         case FALHA_DOSE:
//  348              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E2:DOSADOR");          
??APLICACAO_verifica_preparacao_7:
        LDR.W    R2,??DataTable14_17
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_15
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  349              APLICACAO_menu_falha();
          CFI FunCall APLICACAO_menu_falha
        BL       APLICACAO_menu_falha
//  350              PAGAMENTOS_set_bloqueio(0);             
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  351              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  352         case FALHA_EMBALAGEM:
//  353              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E3:EMBALAGEM");                                                 
??APLICACAO_verifica_preparacao_6:
        LDR.W    R2,??DataTable14_18
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_15
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  354              APLICACAO_menu_falha();
          CFI FunCall APLICACAO_menu_falha
        BL       APLICACAO_menu_falha
//  355              PAGAMENTOS_set_bloqueio(0);
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  356              break;
//  357       }     
//  358     }
//  359          
//  360     STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
??APLICACAO_verifica_preparacao_2:
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  361     BOARD_setter_contador_propaganda(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_setter_contador_propaganda
        BL       BOARD_setter_contador_propaganda
        B.N      ??APLICACAO_verifica_preparacao_9
//  362   }//Fim do inicio do processo de preparação
//  363   else
//  364     if(troco==OPERA_COM_TROCO && !PAGAMENTOS_get_timeout_pagamento() && PAGAMENTOS_get_valor_acumulado()){        
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
//  365       APLICACAO_devolve_troco();
          CFI FunCall APLICACAO_devolve_troco
        BL       APLICACAO_devolve_troco
//  366     }  
//  367 }
??APLICACAO_verifica_preparacao_9:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock8
//  368 /***********************************************************************************
//  369 *       Descrição       :       Tela quando há alguma falha na máquina
//  370 *       Parametros      :       (unsigned char) idioma
//  371 *       Retorno         :       nenhum
//  372 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function APLICACAO_menu_falha
        THUMB
//  373 void APLICACAO_menu_falha(void){
APLICACAO_menu_falha:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  374   eTECLA tecla;
//  375                  
//  376   BOARD_setter_led_instrucao(LED_FORA_SERVICO,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+6
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  377   APLICACAO_devolve_troco(); // Devolve o valor ao cliente
          CFI FunCall APLICACAO_devolve_troco
        BL       APLICACAO_devolve_troco
//  378                              // devido a uma falha no sistema
//  379   
//  380   PAGAMENTOS_set_bloqueio(1);
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
        B.N      ??APLICACAO_menu_falha_0
//  381   
//  382   for(;;){
//  383     
//  384     APLICACAO_tela_descanso();           
//  385     
//  386     tecla = TECLADO_getch();
//  387     switch(tecla){
//  388       case TECLA_ENTER:
//  389           APLIACAO_wait_lcd();
??APLICACAO_menu_falha_1:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  390           BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  391           MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  392           BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  393           APLICACAO_release_lcd();             
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  394           STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);                   
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  395           break;
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
//  396       case TECLA_ESC:
//  397           break;
??APLICACAO_menu_falha_2:
        B.N      ??APLICACAO_menu_falha_0
//  398       case TECLA_INC:
//  399           break;
??APLICACAO_menu_falha_4:
        B.N      ??APLICACAO_menu_falha_0
//  400       case TECLA_DEC:
//  401           break;
??APLICACAO_menu_falha_3:
        B.N      ??APLICACAO_menu_falha_0
          CFI EndBlock cfiBlock9
//  402     }       
//  403   }
//  404 }
//  405 /***********************************************************************************
//  406 *       Descrição       :       Função para devolver o troco ao cliente
//  407 *       Parametros      :       (void)
//  408 *       Retorno         :       (unsigned char) maior do que zero se
//  409 *                               conseguiu devolver o troco
//  410 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function APLICACAO_devolve_troco
        THUMB
//  411 unsigned char APLICACAO_devolve_troco(void){
APLICACAO_devolve_troco:
        PUSH     {R0-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+32
//  412   unsigned int valor = PAGAMENTOS_get_valor_acumulado();
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        MOVS     R4,R0
//  413   unsigned int desconto = valor;
        MOVS     R5,R4
//  414   unsigned char tubos[16];
//  415   
//  416   PAGAMENTOS_set_bloqueio(0);
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  417   vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  418   
//  419   if(MDB_coin_check_tubes(tubos)){
        ADD      R0,SP,#+0
          CFI FunCall MDB_coin_check_tubes
        BL       MDB_coin_check_tubes
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_devolve_troco_0
//  420       
//  421     valor /= 25;
        MOVS     R0,#+25
        UDIV     R4,R4,R0
//  422     PAGAMENTOS_subtrai_valores(desconto);
        MOVS     R0,R5
          CFI FunCall PAGAMENTOS_subtrai_valores
        BL       PAGAMENTOS_subtrai_valores
//  423         
//  424     unsigned char moedas_15 = valor /15;
        MOVS     R0,#+15
        UDIV     R5,R4,R0
//  425     unsigned char moedas_rest = valor % 15;
        MOVS     R0,#+15
        UDIV     R1,R4,R0
        MLS      R4,R0,R1,R4
//  426         
//  427     for(unsigned char i=0;i<moedas_15;i++){
        MOVS     R6,#+0
        B.N      ??APLICACAO_devolve_troco_1
//  428       MDB_coin_dispenser(2,15);
??APLICACAO_devolve_troco_2:
        MOVS     R1,#+15
        MOVS     R0,#+2
          CFI FunCall MDB_coin_dispenser
        BL       MDB_coin_dispenser
//  429       vTaskDelay(5000);      
        MOVW     R0,#+5000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  430     }
        ADDS     R6,R6,#+1
??APLICACAO_devolve_troco_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R6,R5
        BCC.N    ??APLICACAO_devolve_troco_2
//  431         
//  432     if(moedas_rest){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??APLICACAO_devolve_troco_0
//  433       MDB_coin_dispenser(2,moedas_rest);
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+2
          CFI FunCall MDB_coin_dispenser
        BL       MDB_coin_dispenser
//  434       vTaskDelay(5000);                
        MOVW     R0,#+5000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  435      }
//  436   }
//  437       
//  438   return 1;      
??APLICACAO_devolve_troco_0:
        MOVS     R0,#+1
        ADD      SP,SP,#+16
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock10
//  439 }
//  440 /***********************************************************************************
//  441 *       Descrição       :       Faz a verificação do POST
//  442 *       Parametros      :       nenhum
//  443 *       Retorno         :       nenhum
//  444 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function APLICACAO_verifica_post
        THUMB
//  445 unsigned char APLICACAO_verifica_post(void){
APLICACAO_verifica_post:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  446   ePOST_RESULT post = POST_entry();
          CFI FunCall POST_entry
        BL       POST_entry
        MOVS     R4,R0
//  447   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R5,R0
//  448   
//  449   switch(post){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??APLICACAO_verifica_post_0
//  450     case POST_SUCESSO:
//  451          return 1;
        MOVS     R0,#+1
        POP      {R1,R4,R5,PC}    ;; return
//  452     case POST_FALHA_VENTILADOR:
//  453     case POST_FALHA_RESISTENCIA:
//  454     case POST_FALHA_MDB_BILL:
//  455     case POST_FALHA_MDB_COIN:
//  456     case POST_FALHA_MDB_CASHLESS:
//  457     case POST_FALHA_CCTALK:
//  458     case POST_FALHA_PAPEL:
//  459     default:
//  460          switch(post){
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
//  461            case POST_FALHA_VENTILADOR:
//  462                 STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E0:MOTOR AR");                                    
??APLICACAO_verifica_post_1:
        LDR.W    R2,??DataTable14_19
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_15
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  463                 break;
        B.N      ??APLICACAO_verifica_post_2
//  464            case POST_FALHA_RESISTENCIA:
//  465                 STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E1:AQUECIMENTO");                
??APLICACAO_verifica_post_4:
        LDR.W    R2,??DataTable14_16
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_15
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  466                 break;
        B.N      ??APLICACAO_verifica_post_2
//  467            case POST_FALHA_MDB_BILL:
//  468                 break;
??APLICACAO_verifica_post_3:
        B.N      ??APLICACAO_verifica_post_2
//  469            case POST_FALHA_MDB_COIN:
//  470                 break;
??APLICACAO_verifica_post_6:
        B.N      ??APLICACAO_verifica_post_2
//  471            case POST_FALHA_MDB_CASHLESS:
//  472                 break;
??APLICACAO_verifica_post_5:
        B.N      ??APLICACAO_verifica_post_2
//  473            case POST_FALHA_CCTALK:
//  474                 break;
??APLICACAO_verifica_post_8:
        B.N      ??APLICACAO_verifica_post_2
//  475            case POST_FALHA_PAPEL:   
//  476                 STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E3:EMBALAGEM");              
??APLICACAO_verifica_post_7:
        LDR.W    R2,??DataTable14_18
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_15
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  477                 break;
//  478          }         
//  479          
//  480          PAGAMENTOS_set_bloqueio(1); // Bloqueia os meios de pagamento
??APLICACAO_verifica_post_2:
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  481          BOARD_liga_placa_instrucao(LED_FORA_SERVICO);
        MOVS     R0,#+6
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
        B.N      ??APLICACAO_verifica_post_9
//  482          
//  483          for(;;){
//  484            eTECLA tecla;
//  485            
//  486            tecla = TECLADO_getch();
//  487            
//  488            switch(tecla){
//  489              case TECLA_ENTER:
//  490                   APLIACAO_wait_lcd();
//  491                   BOARD_liga_placa_instrucao(0);
//  492                   MCFG_entry();                     
//  493                   BOARD_liga_placa_instrucao(1);
//  494                   idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
//  495                   APLICACAO_release_lcd();  
//  496            
//  497                   STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);               
//  498                   break;
//  499              case TECLA_ESC:
//  500                   break;
//  501              case TECLA_INC:
//  502                   break;
//  503              case TECLA_DEC: 
//  504                   break;
//  505            }
//  506            
//  507            APLICACAO_tela_descanso();
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
//  508          }       
//  509   }
//  510 }
//  511 /***********************************************************************************
//  512 *       Descrição       :       Faz a verificação de troco para o primeiro
//  513 *                               processo
//  514 *       Parametros      :       nenhum
//  515 *       Retorno         :       (unsigned char) maior do que zero
//  516 *                               se houver troco suficiente
//  517 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function APLICACAO_verifica_disponibilidade_troco
        THUMB
//  518 void APLICACAO_verifica_disponibilidade_troco(unsigned char idioma){
APLICACAO_verifica_disponibilidade_troco:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  519   unsigned char flag_notas;
//  520   unsigned int maior_nota=0;
        MOVS     R5,#+0
//  521   eTECLA tecla;
//  522   
//  523   PARAMETROS_le(ADR_NOTAS,(void*)&flag_notas);
        ADD      R1,SP,#+0
        MOVS     R0,#+2
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  524   if(flag_notas&0x01)
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_0
//  525     maior_nota = 100;
        MOVS     R5,#+100
//  526   if(flag_notas&0x02)
??APLICACAO_verifica_disponibilidade_troco_0:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_1
//  527     maior_nota = 200;
        MOVS     R5,#+200
//  528   if(flag_notas&0x04)
??APLICACAO_verifica_disponibilidade_troco_1:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_2
//  529     maior_nota = 500;
        MOV      R5,#+500
//  530   if(flag_notas&0x08)
??APLICACAO_verifica_disponibilidade_troco_2:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+28
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_3
//  531     maior_nota = 1000;
        MOV      R5,#+1000
//  532   if(flag_notas&0x10)
??APLICACAO_verifica_disponibilidade_troco_3:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_4
//  533     maior_nota = 2000;
        MOV      R5,#+2000
//  534   /*
//  535   if(flag_notas&0x20)
//  536     maior_nota = 5000;
//  537   */
//  538   
//  539   if( APLICACACAO_verifica_troco()<maior_nota){
??APLICACAO_verifica_disponibilidade_troco_4:
          CFI FunCall APLICACACAO_verifica_troco
        BL       APLICACACAO_verifica_troco
        CMP      R0,R5
        BCS.N    ??APLICACAO_verifica_disponibilidade_troco_5
//  540     
//  541     BOARD_setter_led_instrucao(LED_FORA_SERVICO,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+6
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  542     PAGAMENTOS_set_bloqueio(1);
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  543     STRING_write_to_external(CLEAR_DISPLAY,
//  544                              (char*)STRING_mensagem_sem_troco[idioma][0],
//  545                              (char*)STRING_mensagem_sem_troco[idioma][1]);    
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable14_20
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable14_20
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
        B.N      ??APLICACAO_verifica_disponibilidade_troco_6
//  546     
//  547     for(;APLICACACAO_verifica_troco()<maior_nota;){
//  548         
//  549       tecla = TECLADO_getch();
//  550       switch(tecla){
//  551         case TECLA_ENTER:
//  552             APLIACAO_wait_lcd();
//  553             BOARD_liga_placa_instrucao(0);
//  554             MCFG_entry();                     
//  555             BOARD_liga_placa_instrucao(1);
//  556             idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
//  557             APLICACAO_release_lcd();             
//  558             STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);        
//  559             break;
//  560         case TECLA_ESC:
//  561             break;
//  562       }    
//  563       
//  564       APLICACAO_tela_descanso();      
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
//  565     }//Fim do for(;;)        
//  566     PAGAMENTOS_set_bloqueio(0);
??APLICACAO_verifica_disponibilidade_troco_9:
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  567     BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  568     BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  569     BOARD_setter_led_instrucao(LED_INSIRA_DINHEIRO,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  570   }  
//  571 }
??APLICACAO_verifica_disponibilidade_troco_5:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock12
//  572 /***********************************************************************************
//  573 *       Descrição       :       Verifica o barramento MDB
//  574 *       Parametros      :       nenhum
//  575 *       Retorno         :       nenhum
//  576 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function APLICACAO_verifica_MDB
        THUMB
//  577 void APLICACAO_verifica_MDB(void){
APLICACAO_verifica_MDB:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  578   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  579   
//  580   switch(MDB_checa_dispositivos()){
          CFI FunCall MDB_checa_dispositivos
        BL       MDB_checa_dispositivos
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_MDB_0
        CMP      R0,#+2
        BEQ.N    ??APLICACAO_verifica_MDB_1
        BCC.N    ??APLICACAO_verifica_MDB_2
        B.N      ??APLICACAO_verifica_MDB_3
//  581     case MDB_TODOS_ONLINE:            
//  582          return;
??APLICACAO_verifica_MDB_0:
??APLICACAO_verifica_MDB_4:
        POP      {R4,PC}          ;; return
//  583     case MDB_BILL_OFFLINE:
//  584          STRING_write_to_external(CLEAR_DISPLAY,
//  585                                   (char*)STRING_mensagem_noteiro_mdb_offline[idioma][0],
//  586                                   (char*)STRING_mensagem_noteiro_mdb_offline[idioma][1]);          
??APLICACAO_verifica_MDB_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable14_21
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable14_21
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  587          break;
        B.N      ??APLICACAO_verifica_MDB_3
//  588     case MDB_COIN_OFFLINE:
//  589          STRING_write_to_external(CLEAR_DISPLAY,
//  590                                   (char*)STRING_mensagem_moedeiro_mdb_offline[idioma][0],
//  591                                   (char*)STRING_mensagem_moedeiro_mdb_offline[idioma][1]);           
??APLICACAO_verifica_MDB_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable14_22
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable14_22
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  592          break;
??APLICACAO_verifica_MDB_3:
        B.N      ??APLICACAO_verifica_MDB_5
//  593   }  
//  594   
//  595   eTECLA tecla;
//  596   
//  597   for(;;){
//  598     
//  599     if(MDB_checa_dispositivos()==MDB_TODOS_ONLINE)
//  600       return;
//  601     
//  602     tecla = TECLADO_getch();
//  603     switch(tecla){
//  604       case TECLA_ENTER:
//  605             APLIACAO_wait_lcd();
//  606             BOARD_liga_placa_instrucao(0);
//  607             MCFG_entry();                     
//  608             BOARD_liga_placa_instrucao(1);
//  609             idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
//  610             APLICACAO_release_lcd();             
//  611             STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);              
//  612            break;
//  613       case TECLA_ESC:
//  614            break;
//  615     }    
//  616     APLICACAO_tela_descanso();      
??APLICACAO_verifica_MDB_6:
??APLICACAO_verifica_MDB_7:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  617     vTaskDelay(500);
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
//  618   }
//  619 }
//  620 /***********************************************************************************
//  621 *       Descrição       :       Faz a verificação do meio de pagamento
//  622 *                               CCTALK
//  623 *       Parametros      :       nenhum
//  624 *       Retorno         :       nenhum
//  625 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function APLICACAO_verifica_cctalk
        THUMB
//  626 void APLICACAO_verifica_cctalk(void){
APLICACAO_verifica_cctalk:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  627   unsigned char flag;
//  628   
//  629   PARAMETROS_le(ADR_FLAG_BV20,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  630   
//  631   if(!flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??APLICACAO_verifica_cctalk_0
//  632     return;  
??APLICACAO_verifica_cctalk_1:
        POP      {R0,R1,R4,PC}    ;; return
//  633   
//  634   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
??APLICACAO_verifica_cctalk_0:
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  635   eBV20_state estado_atual = BV20_get_current_state();
          CFI FunCall BV20_get_current_state
        BL       BV20_get_current_state
//  636   
//  637   if(estado_atual!=BV20_OFFLINE)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??APLICACAO_verifica_cctalk_1
//  638     return;
//  639   
//  640   STRING_write_to_external(CLEAR_DISPLAY,
//  641                            (char*)STRING_mensagem_cctalk_offline[idioma][0],
//  642                            (char*)STRING_mensagem_cctalk_offline[idioma][1]);       
??APLICACAO_verifica_cctalk_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable14_23
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable14_23
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
        B.N      ??APLICACAO_verifica_cctalk_3
//  643     
//  644   eTECLA tecla;
//  645   
//  646   for(;;){
//  647     
//  648     estado_atual = BV20_get_current_state();
//  649     
//  650     if(estado_atual!=BV20_OFFLINE)
//  651       return;
//  652     
//  653     tecla = TECLADO_getch();
//  654     switch(tecla){
//  655       case TECLA_ENTER:
//  656             BOARD_reset_tempo_propaganda();
//  657             APLIACAO_wait_lcd();
//  658             BOARD_liga_placa_instrucao(0);
//  659             MCFG_entry();                     
//  660             BOARD_liga_placa_instrucao(1);
//  661             idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
//  662             APLICACAO_release_lcd();             
//  663             STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);              
//  664             BOARD_reset_tempo_propaganda();
//  665            break;
//  666       case TECLA_ESC:
//  667            break;
//  668     }    
//  669     APLICACAO_tela_descanso();      
??APLICACAO_verifica_cctalk_4:
??APLICACAO_verifica_cctalk_5:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  670     vTaskDelay(500);
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
//  671   }    
//  672 }
//  673 /***********************************************************************************
//  674 *       Descrição       :       Faz a verificação cíclica dos sinais 
//  675 *                               do papel e do termistor
//  676 *       Parametros      :       nenhum
//  677 *       Retorno         :       nenhum
//  678 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function APLICACAO_verificao_ciclica
        THUMB
//  679 void APLICACAO_verificao_ciclica(void){
APLICACAO_verificao_ciclica:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  680   
//  681   switch(POST_verificacao_ciclica()){
          CFI FunCall POST_verificacao_ciclica
        BL       POST_verificacao_ciclica
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verificao_ciclica_0
        CMP      R0,#+2
        BEQ.N    ??APLICACAO_verificao_ciclica_1
        BCC.N    ??APLICACAO_verificao_ciclica_2
        B.N      ??APLICACAO_verificao_ciclica_3
//  682    case POST_CICLICO_SUCESSO:
//  683         break;
??APLICACAO_verificao_ciclica_0:
        B.N      ??APLICACAO_verificao_ciclica_3
//  684    case POST_CICLICO_FALHA_EMBALAGEM:
//  685         STRING_write_to_external(CLEAR_DISPLAY,"E03:FALTA","EMBALAGEM");
??APLICACAO_verificao_ciclica_2:
        LDR.N    R2,??DataTable14_24
        LDR.N    R1,??DataTable14_25
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  686         APLICACAO_loop_falha_ciclica();
          CFI FunCall APLICACAO_loop_falha_ciclica
        BL       APLICACAO_loop_falha_ciclica
//  687         break;
        B.N      ??APLICACAO_verificao_ciclica_3
//  688    case POST_CICLICO_FALHA_TERMISTOR:
//  689         STRING_write_to_external(CLEAR_DISPLAY,"E04:FALHA","SENS. TEMP.");
??APLICACAO_verificao_ciclica_1:
        LDR.N    R2,??DataTable14_26
        LDR.N    R1,??DataTable14_27
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  690         APLICACAO_loop_falha_ciclica();
          CFI FunCall APLICACAO_loop_falha_ciclica
        BL       APLICACAO_loop_falha_ciclica
//  691         break;
//  692   }  
//  693 }
??APLICACAO_verificao_ciclica_3:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock15
//  694 /***********************************************************************************
//  695 *       Descrição       :       Menu do loop onde há a falha no sensor de
//  696 *                               temperatura ou falta de embalagem
//  697 *       Parametros      :       nenhum
//  698 *       Retorno         :       nenhum
//  699 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function APLICACAO_loop_falha_ciclica
        THUMB
//  700 void APLICACAO_loop_falha_ciclica(void){
APLICACAO_loop_falha_ciclica:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  701   eTECLA tecla;
//  702   unsigned char loop=1;
        MOVS     R4,#+1
        B.N      ??APLICACAO_loop_falha_ciclica_0
//  703     
//  704   for(;loop;){
//  705     
//  706     tecla = TECLADO_getch();
//  707     switch(tecla){
//  708       case TECLA_ENTER:
//  709           MCFG_entry();                     
//  710            break;
//  711       case TECLA_ESC:
//  712            loop = 0;
??APLICACAO_loop_falha_ciclica_1:
        MOVS     R4,#+0
//  713            break;
//  714     }      
//  715     
//  716     APLICACAO_tela_descanso();    
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
//  717   }  
//  718   
//  719   STRING_write_to_internal(CLEAR_DISPLAY,"REINICIANDO","VERIFICACAO");
??APLICACAO_loop_falha_ciclica_3:
        LDR.N    R2,??DataTable14_28
        LDR.N    R1,??DataTable14_29
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  720   vTaskDelay(3000);  
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  721 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock16
//  722 /***********************************************************************************
//  723 *       Descrição       :       Ciclo de desumidificação da máquina
//  724 *       Parametros      :       nenhum
//  725 *       Retorno         :       nenhum
//  726 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function APLICACAO_ciclo_desumidificador
        THUMB
//  727 void APLICACAO_ciclo_desumidificador(unsigned char flag){
APLICACAO_ciclo_desumidificador:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  728   
//  729   if(flag && !APLICACAO_tempo_desumidificador){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_ciclo_desumidificador_0
        LDR.N    R0,??DataTable14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??APLICACAO_ciclo_desumidificador_0
//  730     
//  731     unsigned int tempo=30000;
        MOVW     R4,#+30000
//  732     
//  733     STRING_write_to_internal(CLEAR_DISPLAY,"CICLO DE","DESUMIDIFICACAO");
        LDR.N    R2,??DataTable14_30
        LDR.N    R1,??DataTable14_31
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  734     STRING_write_to_external(CLEAR_DISPLAY,"CICLO DE","DESUMIDIFICACAO");
        LDR.N    R2,??DataTable14_30
        LDR.N    R1,??DataTable14_31
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  735     
//  736     POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  737     POTENCIA_setRPM(6000);
        MOVW     R0,#+6000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  738     CT_set_temperatura(60);
        MOVS     R0,#+60
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  739     vTaskDelay(3000);
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??APLICACAO_ciclo_desumidificador_1
//  740     
//  741     while(tempo--){
//  742       
//  743       if(POTENCIA_getRPMmedido()<1000){
//  744         CT_set_temperatura(0);
//  745         POTENCIA_setRPM(0);
//  746         POTENCIA_set_neutro(0);        
//  747         return;
//  748       }
//  749       vTaskDelay(1);
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
//  750     }
//  751     
//  752     CT_set_temperatura(0);
??APLICACAO_ciclo_desumidificador_3:
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  753     POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  754     POTENCIA_set_neutro(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  755     APLICACAO_verifica_post();
          CFI FunCall APLICACAO_verifica_post
        BL       APLICACAO_verifica_post
//  756     APLICACAO_tempo_desumidificador = TEMPO_DESUMIDIFICADOR;
        LDR.N    R0,??DataTable14
        LDR.N    R1,??DataTable14_1  ;; 0x1b7740
        STR      R1,[R0, #+0]
//  757   }
//  758 }
??APLICACAO_ciclo_desumidificador_0:
??APLICACAO_ciclo_desumidificador_4:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     APLICACAO_tempo_desumidificador

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     0x1b7740

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_2:
        DC32     STRING_mensagem_modo_gratis

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_3:
        DC32     STRING_splash

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_4:
        DC32     STRING_mensagem_saudacao_maquina

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_5:
        DC32     APLICACAO_sem_LCD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_6:
        DC32     `?<Constant "RPM:%05d T%03doC">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_7:
        DC32     `?<Constant "P:%04d M:%04d,%02d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_8:
        DC32     STRING_mensagem_preco

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_9:
        DC32     STRING_mensagem_pago

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_10:
        DC32     APLICACAO_tempo_mensagem

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_11:
        DC32     ??indice

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_12:
        DC32     APLICACAO_tubos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_13:
        DC32     STRING_mensagem_retire_troco

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_14:
        DC32     `?<Constant "E0:VENTILADOR">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_15:
        DC32     STRING_mensagem_fora_servico

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_16:
        DC32     `?<Constant "E1:AQUECIMENTO">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_17:
        DC32     `?<Constant "E2:DOSADOR">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_18:
        DC32     `?<Constant "E3:EMBALAGEM">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_19:
        DC32     `?<Constant "E0:MOTOR AR">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_20:
        DC32     STRING_mensagem_sem_troco

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_21:
        DC32     STRING_mensagem_noteiro_mdb_offline

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_22:
        DC32     STRING_mensagem_moedeiro_mdb_offline

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_23:
        DC32     STRING_mensagem_cctalk_offline

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_24:
        DC32     `?<Constant "EMBALAGEM">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_25:
        DC32     `?<Constant "E03:FALTA">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_26:
        DC32     `?<Constant "SENS. TEMP.">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_27:
        DC32     `?<Constant "E04:FALHA">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_28:
        DC32     `?<Constant "VERIFICACAO">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_29:
        DC32     `?<Constant "REINICIANDO">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_30:
        DC32     `?<Constant "DESUMIDIFICACAO">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_31:
        DC32     `?<Constant "CICLO DE">`

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

        END
//  759 /***********************************************************************************
//  760 *       Fim do arquivo
//  761 ***********************************************************************************/
// 
//    25 bytes in section .bss
//     4 bytes in section .data
//   212 bytes in section .rodata
// 2 552 bytes in section .text
// 
// 2 552 bytes of CODE  memory
//   212 bytes of CONST memory
//    29 bytes of DATA  memory
//
//Errors: none
//Warnings: none
