///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     14/Sep/2017  13:22:50 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\aplicac /
//                    ao.c                                                    /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\aplicac /
//                    ao.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Li /
//                    st\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Lis /
//                    t\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Obj\  /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\aplica /
//                    cao.s                                                   /
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
        EXTERN MDBCOIN_alternative_payout
        EXTERN MDBCOIN_get_payout_status
        EXTERN MDB_checa_dispositivos
        EXTERN MDB_checa_troco
        EXTERN MDB_checa_valor_moedas
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
        EXTERN SMDB_release
        EXTERN SMDB_wait
        EXTERN STRING_liberando_troco
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\aplicacao.c
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
//   41 #include <intrinsics.h>
//   42 #include "..\includes.h"
//   43 
//   44 /***********************************************************************************
//   45 *       Constantes
//   46 ***********************************************************************************/
//   47 #define TEMPO_DESUMIDIFICADOR                   1000*60*30
//   48 #define TEMPO_MENSAGEM_LINHA_INFERIOR           10000
//   49 
//   50 //#define _DEBUG_PAGAMENTOS_
//   51 
//   52 /***********************************************************************************
//   53 *       Enumerações
//   54 ***********************************************************************************/
//   55 
//   56 
//   57 /***********************************************************************************
//   58 *       Variaveis 
//   59 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   60 xSemaphoreHandle  APLICACAO_sem_LCD;
APLICACAO_sem_LCD:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   61 unsigned char APLICACAO_tubos[16]={0};
APLICACAO_tubos:
        DS8 16

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   62 unsigned int APLICACAO_tempo_desumidificador=30*1000;//TEMPO_DESUMIDIFICADOR;
APLICACAO_tempo_desumidificador:
        DATA
        DC32 30000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   63 unsigned int APLICACAO_tempo_mensagem=0;
APLICACAO_tempo_mensagem:
        DS8 4
//   64 /***********************************************************************************
//   65 *       Funções
//   66 ***********************************************************************************/
//   67 void APLICACAO_ini(void);
//   68 void APLICACAO_tela_descanso(void);
//   69 void APLICACAO_exibe_valor(unsigned char idioma);
//   70 unsigned int APLICACACAO_verifica_troco(void);
//   71 void APLICACAO_verifica_preparacao(unsigned int valor_pipoca,unsigned char idioma,unsigned char troco);
//   72 void APLICACAO_menu_falha(void);
//   73 unsigned char APLICACAO_devolve_troco(void);
//   74 unsigned char APLICACAO_verifica_post(void);
//   75 void APLICACAO_verifica_disponibilidade_troco(unsigned char idioma);
//   76 void APLICACAO_verifica_MDB(void);
//   77 void APLICACAO_verifica_preparacao(unsigned int valor_pipoca,unsigned char idioma,
//   78                                    unsigned char troco);
//   79 void APLICACAO_verifica_cctalk(void);
//   80 void APLICACAO_verificao_ciclica(void);
//   81 void APLICACAO_loop_falha_ciclica(void);
//   82 void APLICACAO_ciclo_desumidificador(unsigned char flag);
//   83 
//   84 /***********************************************************************************
//   85 *       Implementação das funções
//   86 ***********************************************************************************/
//   87 
//   88 /***********************************************************************************
//   89 *       Descrição       :       Função principal da interface de usuário
//   90 *       Parametros      :       nenhum
//   91 *       Retorno         :       nenhum
//   92 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function APLICACAO_main
        THUMB
//   93 void APLICACAO_main(void*pPar){
APLICACAO_main:
        PUSH     {R2-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+24
        MOVS     R4,R0
//   94   eTECLA tecla;
//   95   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R6,R0
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
        MOVS     R0,R6
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
//  116   BOARD_liga_placa_instrucao(1); // Liga a placa de instrução  
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
//  126   
//  127   for(;;){
//  128     
//  129     PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
??APLICACAO_main_0:
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  130     PARAMETROS_le(ADR_FLAG_FREE,(void*)&modo_gratis);
        ADD      R1,SP,#+1
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  131     PARAMETROS_le(ADR_FLAG_TROCO,(void*)&modo_troco);    
        ADD      R1,SP,#+0
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  132     
//  133     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R5,R0
//  134     switch(tecla){
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BEQ.N    ??APLICACAO_main_1
        BCC.N    ??APLICACAO_main_2
        CMP      R5,#+3
        BEQ.N    ??APLICACAO_main_3
        BCC.N    ??APLICACAO_main_4
        CMP      R5,#+5
        BEQ.N    ??APLICACAO_main_5
        BCC.N    ??APLICACAO_main_6
        B.N      ??APLICACAO_main_2
//  135       case TECLA_INC:
//  136            //SMDB_cashless_vend(100,1);
//  137            break;
??APLICACAO_main_4:
        B.N      ??APLICACAO_main_2
//  138       case TECLA_DEC:
//  139            break;
??APLICACAO_main_3:
        B.N      ??APLICACAO_main_2
//  140       case TECLA_ENTER:
//  141            APLIACAO_wait_lcd();
??APLICACAO_main_6:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  142              BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  143              MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  144              BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  145              idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R6,R0
//  146              
//  147              PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  148              PARAMETROS_le(ADR_FLAG_FREE,(void*)&modo_gratis);
        ADD      R1,SP,#+1
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  149              PARAMETROS_le(ADR_FLAG_TROCO,(void*)&modo_troco);
        ADD      R1,SP,#+0
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  150              
//  151              APLICACAO_tempo_desumidificador=TEMPO_DESUMIDIFICADOR;
        LDR.W    R0,??DataTable14
        LDR.W    R1,??DataTable14_1  ;; 0x1b7740
        STR      R1,[R0, #+0]
//  152              
//  153            APLICACAO_release_lcd();  
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  154            
//  155            STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  156            
//  157            __disable_interrupt();
        CPSID    I
//  158            WATCHDOG_init(0);
        MOVS     R0,#+0
          CFI FunCall WATCHDOG_init
        BL       WATCHDOG_init
//  159            for(;;);
??APLICACAO_main_7:
        B.N      ??APLICACAO_main_7
//  160            break;
//  161       case TECLA_ESC:
//  162            break;
??APLICACAO_main_1:
        B.N      ??APLICACAO_main_2
//  163       case TECLA_GRATIS:
//  164            if(modo_gratis)
??APLICACAO_main_5:
        LDRB     R0,[SP, #+1]
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_main_8
//  165              PAGAMENTOS_adiciona_valores(valorPipoca);
        LDR      R0,[SP, #+4]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_adiciona_valores
        BL       PAGAMENTOS_adiciona_valores
//  166            break;      
//  167     }
//  168     
//  169     if(modo_gratis)
??APLICACAO_main_8:
??APLICACAO_main_2:
        LDRB     R0,[SP, #+1]
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_main_9
//  170       STRING_write_to_external(NO_CLEAR,(void*)STRING_mensagem_modo_gratis[idioma][0],(void*)STRING_mensagem_modo_gratis[idioma][1]);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.W    R0,??DataTable14_2
        ADDS     R0,R0,R6, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.W    R0,??DataTable14_2
        LDR      R1,[R0, R6, LSL #+3]
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
        B.N      ??APLICACAO_main_10
//  171     else{
//  172       APLICACAO_exibe_valor(idioma);     
??APLICACAO_main_9:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall APLICACAO_exibe_valor
        BL       APLICACAO_exibe_valor
//  173       if(modo_troco)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_main_11
//  174         APLICACAO_verifica_disponibilidade_troco(idioma);
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall APLICACAO_verifica_disponibilidade_troco
        BL       APLICACAO_verifica_disponibilidade_troco
//  175       // Verifica a conectividade dos
//  176       // meios de pagamento seriais
//  177       APLICACAO_verifica_MDB();
??APLICACAO_main_11:
          CFI FunCall APLICACAO_verifica_MDB
        BL       APLICACAO_verifica_MDB
//  178       APLICACAO_verifica_cctalk();
          CFI FunCall APLICACAO_verifica_cctalk
        BL       APLICACAO_verifica_cctalk
//  179     }
//  180     
//  181     APLICACAO_verifica_preparacao(valorPipoca,idioma,modo_troco);             
??APLICACAO_main_10:
        LDRB     R2,[SP, #+0]
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R0,[SP, #+4]
          CFI FunCall APLICACAO_verifica_preparacao
        BL       APLICACAO_verifica_preparacao
//  182     BOARD_setter_led_instrucao(LED_INSIRA_DINHEIRO,PISCANDO); // Ativa o modo inserir dinheiro
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  183     APLICACAO_tela_descanso();    
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  184 #ifndef _DEBUG_PAGAMENTOS_    
//  185     APLICACAO_verificao_ciclica();
          CFI FunCall APLICACAO_verificao_ciclica
        BL       APLICACAO_verificao_ciclica
//  186 #endif
//  187     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  188     APLICACAO_ciclo_desumidificador(flag_desumidificador);
        LDRB     R0,[SP, #+2]
          CFI FunCall APLICACAO_ciclo_desumidificador
        BL       APLICACAO_ciclo_desumidificador
        B.N      ??APLICACAO_main_0
          CFI EndBlock cfiBlock0
//  189   }   
//  190 }
//  191 /***********************************************************************************
//  192 *       Descrição       :       Inicialização do ódulo
//  193 *       Parametros      :       nenhum
//  194 *       Retorno         :       nenhum
//  195 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function APLICACAO_ini
        THUMB
//  196 void APLICACAO_ini(void){
APLICACAO_ini:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  197   eIDIOMA idioma  = BRASIL;
        MOVS     R4,#+0
//  198        
//  199   HD44780_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,
//  200                LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);     
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_init
        BL       HD44780_init
//  201   
//  202   HD44780_2_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,
//  203                  LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);       
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_2_init
        BL       HD44780_2_init
//  204   
//  205   STRING_write_to_internal(CLEAR_DISPLAY,
//  206                            (char*)STRING_splash[idioma][0],
//  207                            (char*)STRING_splash[idioma][1]);      
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
//  208   
//  209   STRING_write_to_external(CLEAR_DISPLAY,
//  210                            (char*)STRING_mensagem_saudacao_maquina[idioma][0],
//  211                            (char*)STRING_mensagem_saudacao_maquina[idioma][1]);      
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
//  212   
//  213   vSemaphoreCreateBinary(APLICACAO_sem_LCD);
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
//  214 }
??APLICACAO_ini_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  215 /***********************************************************************************
//  216 *       Descrição       :       Semáforo para acessar o LCD
//  217 *       Parametros      :       nenhum
//  218 *       Retorno         :       nenhum
//  219 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function APLIACAO_wait_lcd
        THUMB
//  220 void APLIACAO_wait_lcd(void){
APLIACAO_wait_lcd:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  221   
//  222   while(!xSemaphoreTake(APLICACAO_sem_LCD,portTICK_RATE_MS*1));
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
//  223 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  224 /***********************************************************************************
//  225 *       Descrição       :       Libera o semáforo do LCD
//  226 *       Parametros      :       nenhum
//  227 *       Retorno         :       nenhum
//  228 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function APLICACAO_release_lcd
        THUMB
//  229 void APLICACAO_release_lcd(void){
APLICACAO_release_lcd:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  230   
//  231   xSemaphoreGive(APLICACAO_sem_LCD);
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.W    R0,??DataTable14_5
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  232 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  233 /***********************************************************************************
//  234 *       Descrição       :       Funções para carregar o idioma
//  235 *       Parametros      :       nenhum
//  236 *       Retorno         :       nenhum
//  237 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function APLICACAO_carrega_idioma
        THUMB
//  238 unsigned char APLICACAO_carrega_idioma(void){
APLICACAO_carrega_idioma:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  239   unsigned char idioma  = BRASIL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  240   
//  241   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);  
        ADD      R1,SP,#+0
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  242   if(idioma>QTY_OF_LANGUAGES)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+8
        BLT.N    ??APLICACAO_carrega_idioma_0
//  243     idioma = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  244   
//  245   return idioma;
??APLICACAO_carrega_idioma_0:
        LDRB     R0,[SP, #+0]
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
//  246 }
//  247 /***********************************************************************************
//  248 *       Descrição       :       Tela de descanso do display interno
//  249 *       Parametros      :       nenhum
//  250 *       Retorno         :       nenhum
//  251 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function APLICACAO_tela_descanso
        THUMB
//  252 void APLICACAO_tela_descanso(void){
APLICACAO_tela_descanso:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+24
          CFI CFA R13+40
//  253   char buffer_linha[17];
//  254   
//  255   sprintf(buffer_linha,"RPM:%05d T%03doC",POTENCIA_getRPMmedido(),AA_calculaTemperatura());
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
//  256   STRING_write_to_internal(NO_CLEAR,buffer_linha,NULL);    
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  257   
//  258   sprintf(buffer_linha,"P:%04d M:%04d,%02d",AA_mediaMovelPapel(),
//  259                                             PAGAMENTOS_get_valor_acumulado()/100,
//  260                                             PAGAMENTOS_get_valor_acumulado()%100);
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
//  261   
//  262   STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  263 }
        ADD      SP,SP,#+24
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock5
//  264 /***********************************************************************************
//  265 *       Descrição       :       Exibe o valor da pipoca e 
//  266 *                               o quanto já foi pago pelo cliente
//  267 *       Parametros      :       nenhum
//  268 *       Retorno         :       nenhum
//  269 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function APLICACAO_exibe_valor
        THUMB
//  270 void APLICACAO_exibe_valor(unsigned char idioma){
APLICACAO_exibe_valor:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+28
          CFI CFA R13+40
        MOVS     R4,R0
//  271   unsigned int valor;
//  272   char buffer_linha[17];
//  273   static unsigned char indice=0;
//  274   
//  275   PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  276   sprintf(buffer_linha,STRING_mensagem_preco[idioma],valor/100,valor%100);
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
//  277   STRING_write_to_external(NO_CLEAR,buffer_linha,NULL);    
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  278   
//  279   unsigned int pago = PAGAMENTOS_get_valor_acumulado();
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        MOVS     R5,R0
//  280   
//  281   if(pago){    
        CMP      R5,#+0
        BEQ.N    ??APLICACAO_exibe_valor_0
//  282     sprintf(buffer_linha,STRING_mensagem_pago[idioma],pago/100,pago%100);
        MOVS     R0,#+100
        UDIV     R1,R5,R0
        MLS      R3,R0,R1,R5
        MOVS     R0,#+100
        UDIV     R2,R5,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_9
        LDR      R1,[R0, R4, LSL #+2]
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  283     STRING_write_to_external(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
        B.N      ??APLICACAO_exibe_valor_1
//  284   }
//  285   else{
//  286     if(!APLICACAO_tempo_mensagem){
??APLICACAO_exibe_valor_0:
        LDR.W    R0,??DataTable14_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??APLICACAO_exibe_valor_2
//  287       indice = (indice+1) % 4;
        LDR.W    R0,??DataTable14_11
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+4
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.W    R0,??DataTable14_11
        STRB     R2,[R0, #+0]
//  288       APLICACAO_tempo_mensagem = TEMPO_MENSAGEM_LINHA_INFERIOR;
        LDR.W    R0,??DataTable14_10
        MOVW     R1,#+10000
        STR      R1,[R0, #+0]
//  289     }
//  290     PARAMETROS_le(ADR_MENSAGEM_CLIENTE_01+indice,(void*)buffer_linha);
??APLICACAO_exibe_valor_2:
        ADD      R1,SP,#+4
        LDR.W    R0,??DataTable14_11
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+60
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  291     STRING_write_to_external(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  292   }
//  293 }
??APLICACAO_exibe_valor_1:
        ADD      SP,SP,#+28
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock6

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??indice:
        DS8 1
//  294 /***********************************************************************************
//  295 *       Descrição       :       Verifica a contagem dos tubos de moeda
//  296 *       Parametros      :       nenhum
//  297 *       Retorno         :       (unsigned char) maior do que zero se há troco
//  298 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function APLICACACAO_verifica_troco
        THUMB
//  299 unsigned int APLICACACAO_verifica_troco(void){
APLICACACAO_verifica_troco:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  300   unsigned int troco;
//  301   
//  302   if(MDB_checa_troco(&troco))
        ADD      R0,SP,#+0
          CFI FunCall MDB_checa_troco
        BL       MDB_checa_troco
        CMP      R0,#+0
        BEQ.N    ??APLICACACAO_verifica_troco_0
//  303     return troco;
        LDR      R0,[SP, #+0]
        B.N      ??APLICACACAO_verifica_troco_1
//  304   
//  305   return 0;
??APLICACACAO_verifica_troco_0:
        MOVS     R0,#+0
??APLICACACAO_verifica_troco_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock7
//  306 }
//  307 /***********************************************************************************
//  308 *       Descrição       :       Faz a verificação dos pagamentos para
//  309 *                               iniciar o ciclo de preparação
//  310 *       Parametros      :       (unsigned int) valor da pipoca
//  311 *       Retorno         :       nenhum
//  312 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function APLICACAO_verifica_preparacao
        THUMB
//  313 void APLICACAO_verifica_preparacao(unsigned int valor_pipoca,unsigned char idioma,
//  314                                    unsigned char troco){
APLICACAO_verifica_preparacao:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  315    unsigned int ajuste;
//  316   
//  317   if( PAGAMENTOS_get_valor_acumulado()>=valor_pipoca) {      
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        CMP      R0,R4
        BCC.W    ??APLICACAO_verifica_preparacao_0
//  318     
//  319     if(troco==OPERA_SEM_TROCO || APLICACACAO_verifica_troco()>=valor_pipoca){     
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??APLICACAO_verifica_preparacao_1
          CFI FunCall APLICACACAO_verifica_troco
        BL       APLICACACAO_verifica_troco
        CMP      R0,R4
        BCC.N    ??APLICACAO_verifica_preparacao_2
//  320       // Switch para 
//  321       // capturar os resultados da execução do processo
//  322       switch(PREPARACAO_entry(&ajuste,CONTABILIZA)){
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
//  323         case SUCESSO:
//  324              PAGAMENTOS_subtrai_valores(valor_pipoca);          
??APLICACAO_verifica_preparacao_3:
        MOVS     R0,R4
          CFI FunCall PAGAMENTOS_subtrai_valores
        BL       PAGAMENTOS_subtrai_valores
//  325              // Devolve o troco caso ainda reste valor
//  326              // pago no acumulador de moeda
//  327              if(troco==OPERA_COM_TROCO && PAGAMENTOS_get_valor_acumulado()){               
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+255
        BNE.N    ??APLICACAO_verifica_preparacao_8
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_preparacao_8
//  328                STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  329                
//  330                STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  331                
//  332                STRING_write_to_external(CLEAR_DISPLAY,
//  333                                         (char*)STRING_mensagem_retire_troco[idioma][0],
//  334                                         (char*)STRING_mensagem_retire_troco[idioma][1]);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_12
        ADDS     R0,R0,R5, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_12
        LDR      R1,[R0, R5, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  335                APLICACAO_devolve_troco();      
          CFI FunCall APLICACAO_devolve_troco
        BL       APLICACAO_devolve_troco
//  336              }
//  337              PREPARACAO_resfriamento(idioma);
??APLICACAO_verifica_preparacao_8:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PREPARACAO_resfriamento
        BL       PREPARACAO_resfriamento
//  338              STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);                
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  339              PAGAMENTOS_set_bloqueio(0);
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  340              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  341         case FALHA_VENTILADOR:
//  342              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E0:VENTILADOR");                       
??APLICACAO_verifica_preparacao_5:
        LDR.W    R2,??DataTable14_13
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_14
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  343              APLICACAO_menu_falha();
          CFI FunCall APLICACAO_menu_falha
        BL       APLICACAO_menu_falha
//  344              PAGAMENTOS_set_bloqueio(0);             
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  345              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  346         case FALHA_RESISTENCIA:
//  347              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E1:AQUECIMENTO");
??APLICACAO_verifica_preparacao_4:
        LDR.W    R2,??DataTable14_15
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_14
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  348              APLICACAO_menu_falha();
          CFI FunCall APLICACAO_menu_falha
        BL       APLICACAO_menu_falha
//  349              PAGAMENTOS_set_bloqueio(0);             
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  350              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  351         case FALHA_DOSE:
//  352              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E2:DOSADOR");          
??APLICACAO_verifica_preparacao_7:
        LDR.W    R2,??DataTable14_16
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_14
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  353              APLICACAO_menu_falha();
          CFI FunCall APLICACAO_menu_falha
        BL       APLICACAO_menu_falha
//  354              PAGAMENTOS_set_bloqueio(0);             
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  355              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  356         case FALHA_EMBALAGEM:
//  357              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E3:EMBALAGEM");                                                 
??APLICACAO_verifica_preparacao_6:
        LDR.W    R2,??DataTable14_17
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_14
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  358              APLICACAO_menu_falha();
          CFI FunCall APLICACAO_menu_falha
        BL       APLICACAO_menu_falha
//  359              PAGAMENTOS_set_bloqueio(0);
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  360              break;
//  361       }     
//  362     }
//  363          
//  364     STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
??APLICACAO_verifica_preparacao_2:
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  365     BOARD_setter_contador_propaganda(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_setter_contador_propaganda
        BL       BOARD_setter_contador_propaganda
        B.N      ??APLICACAO_verifica_preparacao_9
//  366   }//Fim do inicio do processo de preparação
//  367   else
//  368     if(troco==OPERA_COM_TROCO && !PAGAMENTOS_get_timeout_pagamento() && PAGAMENTOS_get_valor_acumulado()){        
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
//  369       APLICACAO_devolve_troco();
          CFI FunCall APLICACAO_devolve_troco
        BL       APLICACAO_devolve_troco
//  370     }  
//  371 }
??APLICACAO_verifica_preparacao_9:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock8
//  372 /***********************************************************************************
//  373 *       Descrição       :       Tela quando há alguma falha na máquina
//  374 *       Parametros      :       (unsigned char) idioma
//  375 *       Retorno         :       nenhum
//  376 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function APLICACAO_menu_falha
        THUMB
//  377 void APLICACAO_menu_falha(void){
APLICACAO_menu_falha:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  378   eTECLA tecla;
//  379                  
//  380   BOARD_setter_led_instrucao(LED_FORA_SERVICO,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+6
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  381   APLICACAO_devolve_troco(); // Devolve o valor ao cliente
          CFI FunCall APLICACAO_devolve_troco
        BL       APLICACAO_devolve_troco
//  382                              // devido a uma falha no sistema
//  383   
//  384   PAGAMENTOS_set_bloqueio(1);
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  385   
//  386   for(;;){
//  387     
//  388     APLICACAO_tela_descanso();           
??APLICACAO_menu_falha_0:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  389     
//  390     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R4,R0
//  391     switch(tecla){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??APLICACAO_menu_falha_1
        BCC.N    ??APLICACAO_menu_falha_0
        CMP      R4,#+3
        BEQ.N    ??APLICACAO_menu_falha_2
        BCC.N    ??APLICACAO_menu_falha_3
        CMP      R4,#+4
        BNE.N    ??APLICACAO_menu_falha_0
//  392       case TECLA_ENTER:
//  393           APLIACAO_wait_lcd();
??APLICACAO_menu_falha_4:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  394           BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  395           MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  396           BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  397           APLICACAO_release_lcd();             
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  398           STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);                   
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  399           break;
        B.N      ??APLICACAO_menu_falha_0
//  400       case TECLA_ESC:
//  401           break;
??APLICACAO_menu_falha_1:
        B.N      ??APLICACAO_menu_falha_0
//  402       case TECLA_INC:
//  403           break;
??APLICACAO_menu_falha_3:
        B.N      ??APLICACAO_menu_falha_0
//  404       case TECLA_DEC:
//  405           break;
??APLICACAO_menu_falha_2:
        B.N      ??APLICACAO_menu_falha_0
          CFI EndBlock cfiBlock9
//  406     }       
//  407   }
//  408 }
//  409 /***********************************************************************************
//  410 *       Descrição       :       Função para devolver o troco ao cliente
//  411 *       Parametros      :       (void)
//  412 *       Retorno         :       (unsigned char) maior do que zero se
//  413 *                               conseguiu devolver o troco
//  414 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function APLICACAO_devolve_troco
        THUMB
//  415 unsigned char APLICACAO_devolve_troco(void){
APLICACAO_devolve_troco:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        SUB      SP,SP,#+40
          CFI CFA R13+64
//  416   unsigned int valor = PAGAMENTOS_get_valor_acumulado();
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        MOVS     R4,R0
//  417   unsigned char tubos[16];
//  418   unsigned char escala;
//  419   unsigned char change_coins[16];
//  420   eMDB_reply res;
//  421   unsigned int tentativas;
//  422   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R6,R0
//  423   
//  424   PAGAMENTOS_set_bloqueio(0);
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  425   vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  426   
//  427   
//  428   // Busca a quantidade de moedas nos tubos
//  429   // e a escala do pais
//  430   tentativas=10;
        MOVS     R0,#+10
        MOVS     R7,R0
//  431   do res = MDB_checa_valor_moedas(&escala,tubos);
??APLICACAO_devolve_troco_0:
        ADD      R1,SP,#+20
        ADD      R0,SP,#+0
          CFI FunCall MDB_checa_valor_moedas
        BL       MDB_checa_valor_moedas
        MOVS     R5,R0
//  432   while(res!=MDB_OK && --tentativas);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??APLICACAO_devolve_troco_1
        SUBS     R7,R7,#+1
        CMP      R7,#+0
        BNE.N    ??APLICACAO_devolve_troco_0
//  433   
//  434   if(res==MDB_OK){
??APLICACAO_devolve_troco_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??APLICACAO_devolve_troco_2
//  435     
//  436     STRING_write_to_external(NO_CLEAR,NULL,(char*)STRING_liberando_troco[(unsigned char)idioma]);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.W    R0,??DataTable14_18
        LDR      R2,[R0, R6, LSL #+2]
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  437           
//  438     SMDB_wait();
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  439   
//  440     tentativas = 10;
        MOVS     R0,#+10
        MOVS     R7,R0
//  441     do res = MDBCOIN_alternative_payout(valor,escala);
??APLICACAO_devolve_troco_3:
        LDRB     R1,[SP, #+0]
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall MDBCOIN_alternative_payout
        BL       MDBCOIN_alternative_payout
        MOVS     R5,R0
//  442     while(res!=MDB_OK && tentativas--);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??APLICACAO_devolve_troco_4
        MOVS     R0,R7
        SUBS     R7,R0,#+1
        CMP      R0,#+0
        BNE.N    ??APLICACAO_devolve_troco_3
//  443     
//  444     SMDB_release();
??APLICACAO_devolve_troco_4:
          CFI FunCall SMDB_release
        BL       SMDB_release
//  445     
//  446     if(res==MDB_OK){      
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??APLICACAO_devolve_troco_2
//  447       //
//  448       //  Loop para descontar o total do troco
//  449       //
//  450       do{
//  451         SMDB_wait();
??APLICACAO_devolve_troco_5:
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  452             
//  453         tentativas = 10;
        MOVS     R0,#+10
        MOVS     R7,R0
//  454         do res = MDBCOIN_get_payout_status(change_coins);
??APLICACAO_devolve_troco_6:
        ADD      R0,SP,#+4
          CFI FunCall MDBCOIN_get_payout_status
        BL       MDBCOIN_get_payout_status
        MOVS     R5,R0
//  455         while(res!=MDB_OK && --tentativas);      
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??APLICACAO_devolve_troco_7
        SUBS     R7,R7,#+1
        CMP      R7,#+0
        BNE.N    ??APLICACAO_devolve_troco_6
//  456       
//  457         SMDB_release();      
??APLICACAO_devolve_troco_7:
          CFI FunCall SMDB_release
        BL       SMDB_release
//  458       
//  459         if(res==MDB_OK){                                      
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??APLICACAO_devolve_troco_8
//  460           unsigned int troco=0;
        MOVS     R8,#+0
//  461           for(unsigned char i=0;i<16;i++)
        MOVS     R0,#+0
??APLICACAO_devolve_troco_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BGE.N    ??APLICACAO_devolve_troco_10
//  462             troco+= (change_coins[i]*escala*tubos[i]);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+4
        LDRB     R1,[R0, R1]
        LDRB     R2,[SP, #+0]
        MULS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R2,SP,#+20
        LDRB     R2,[R0, R2]
        MLA      R8,R2,R1,R8
        ADDS     R0,R0,#+1
        B.N      ??APLICACAO_devolve_troco_9
//  463           
//  464             // Confirmação de que o troco liberado
//  465             // corresponde ao valor solicitado
//  466             // assim pode descontar o montante do módulo
//  467             // Pagamentos
//  468             if(troco==valor)
??APLICACAO_devolve_troco_10:
        CMP      R8,R4
        BNE.N    ??APLICACAO_devolve_troco_11
//  469               PAGAMENTOS_subtrai_valores(valor);  
        MOVS     R0,R4
          CFI FunCall PAGAMENTOS_subtrai_valores
        BL       PAGAMENTOS_subtrai_valores
        B.N      ??APLICACAO_devolve_troco_8
//  470             else{
//  471               PAGAMENTOS_subtrai_valores(troco);  
??APLICACAO_devolve_troco_11:
        MOV      R0,R8
          CFI FunCall PAGAMENTOS_subtrai_valores
        BL       PAGAMENTOS_subtrai_valores
//  472               valor-=troco;
        SUBS     R4,R4,R8
//  473             }
//  474         }
//  475       }
//  476       while(PAGAMENTOS_get_valor_acumulado());
??APLICACAO_devolve_troco_8:
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        CMP      R0,#+0
        BNE.N    ??APLICACAO_devolve_troco_5
//  477       
//  478     }
//  479   }        
//  480   
//  481   return 1;      
??APLICACAO_devolve_troco_2:
        MOVS     R0,#+1
        ADD      SP,SP,#+40
          CFI CFA R13+24
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock10
//  482 }
//  483 /***********************************************************************************
//  484 *       Descrição       :       Faz a verificação do POST
//  485 *       Parametros      :       nenhum
//  486 *       Retorno         :       nenhum
//  487 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function APLICACAO_verifica_post
        THUMB
//  488 unsigned char APLICACAO_verifica_post(void){
APLICACAO_verifica_post:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//  489   ePOST_RESULT post = POST_entry();
          CFI FunCall POST_entry
        BL       POST_entry
        MOVS     R4,R0
//  490   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R5,R0
//  491   
//  492   switch(post){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??APLICACAO_verifica_post_0
//  493     case POST_SUCESSO:
//  494          return 1;
        MOVS     R0,#+1
        B.N      ??APLICACAO_verifica_post_1
//  495     case POST_FALHA_VENTILADOR:
//  496     case POST_FALHA_RESISTENCIA:
//  497     case POST_FALHA_MDB_BILL:
//  498     case POST_FALHA_MDB_COIN:
//  499     case POST_FALHA_MDB_CASHLESS:
//  500     case POST_FALHA_CCTALK:
//  501     case POST_FALHA_PAPEL:
//  502     default:
//  503          switch(post){
??APLICACAO_verifica_post_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??APLICACAO_verifica_post_2
        BCC.N    ??APLICACAO_verifica_post_3
        CMP      R4,#+3
        BEQ.N    ??APLICACAO_verifica_post_4
        BCC.N    ??APLICACAO_verifica_post_5
        CMP      R4,#+5
        BEQ.N    ??APLICACAO_verifica_post_6
        BCC.N    ??APLICACAO_verifica_post_7
        CMP      R4,#+7
        BEQ.N    ??APLICACAO_verifica_post_8
        BCC.N    ??APLICACAO_verifica_post_9
        B.N      ??APLICACAO_verifica_post_3
//  504            case POST_FALHA_VENTILADOR:
//  505                 STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E0:MOTOR AR");                                    
??APLICACAO_verifica_post_2:
        LDR.W    R2,??DataTable14_19
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_14
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  506                 break;
        B.N      ??APLICACAO_verifica_post_3
//  507            case POST_FALHA_RESISTENCIA:
//  508                 STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E1:AQUECIMENTO");                
??APLICACAO_verifica_post_5:
        LDR.W    R2,??DataTable14_15
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_14
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  509                 break;
        B.N      ??APLICACAO_verifica_post_3
//  510            case POST_FALHA_MDB_BILL:
//  511                 break;
??APLICACAO_verifica_post_4:
        B.N      ??APLICACAO_verifica_post_3
//  512            case POST_FALHA_MDB_COIN:
//  513                 break;
??APLICACAO_verifica_post_7:
        B.N      ??APLICACAO_verifica_post_3
//  514            case POST_FALHA_MDB_CASHLESS:
//  515                 break;
??APLICACAO_verifica_post_6:
        B.N      ??APLICACAO_verifica_post_3
//  516            case POST_FALHA_CCTALK:
//  517                 break;
??APLICACAO_verifica_post_9:
        B.N      ??APLICACAO_verifica_post_3
//  518            case POST_FALHA_PAPEL:   
//  519                 STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E3:EMBALAGEM");              
??APLICACAO_verifica_post_8:
        LDR.W    R2,??DataTable14_17
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_14
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  520                 break;
//  521          }         
//  522          
//  523          PAGAMENTOS_set_bloqueio(1); // Bloqueia os meios de pagamento
??APLICACAO_verifica_post_3:
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  524          BOARD_liga_placa_instrucao(LED_FORA_SERVICO);
        MOVS     R0,#+6
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  525          
//  526          for(;;){
//  527            eTECLA tecla;
//  528            
//  529            tecla = TECLADO_getch();
??APLICACAO_verifica_post_10:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R6,R0
//  530            
//  531            switch(tecla){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BEQ.N    ??APLICACAO_verifica_post_11
        BCC.N    ??APLICACAO_verifica_post_12
        CMP      R6,#+3
        BEQ.N    ??APLICACAO_verifica_post_13
        BCC.N    ??APLICACAO_verifica_post_14
        CMP      R6,#+4
        BNE.N    ??APLICACAO_verifica_post_12
//  532              case TECLA_ENTER:
//  533                   APLIACAO_wait_lcd();
??APLICACAO_verifica_post_15:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  534                   BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  535                   MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  536                   BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  537                   idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R5,R0
//  538                   APLICACAO_release_lcd();  
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  539            
//  540                   STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);               
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  541                   break;
        B.N      ??APLICACAO_verifica_post_12
//  542              case TECLA_ESC:
//  543                   break;
??APLICACAO_verifica_post_11:
        B.N      ??APLICACAO_verifica_post_12
//  544              case TECLA_INC:
//  545                   break;
??APLICACAO_verifica_post_14:
        B.N      ??APLICACAO_verifica_post_12
//  546              case TECLA_DEC: 
//  547                   break;
//  548            }
//  549            
//  550            APLICACAO_tela_descanso();
??APLICACAO_verifica_post_13:
??APLICACAO_verifica_post_12:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
        B.N      ??APLICACAO_verifica_post_10
//  551          }       
//  552   }
??APLICACAO_verifica_post_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock11
//  553 }
//  554 /***********************************************************************************
//  555 *       Descrição       :       Faz a verificação de troco para o primeiro
//  556 *                               processo
//  557 *       Parametros      :       nenhum
//  558 *       Retorno         :       (unsigned char) maior do que zero
//  559 *                               se houver troco suficiente
//  560 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function APLICACAO_verifica_disponibilidade_troco
        THUMB
//  561 void APLICACAO_verifica_disponibilidade_troco(unsigned char idioma){
APLICACAO_verifica_disponibilidade_troco:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R4,R0
//  562   unsigned char flag_notas;
//  563   unsigned int maior_nota=0;
        MOVS     R5,#+0
//  564   eTECLA tecla;
//  565   
//  566   PARAMETROS_le(ADR_NOTAS,(void*)&flag_notas);
        ADD      R1,SP,#+0
        MOVS     R0,#+2
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  567   if(flag_notas&0x01)
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_0
//  568     maior_nota = 100;
        MOVS     R0,#+100
        MOVS     R5,R0
//  569   if(flag_notas&0x02)
??APLICACAO_verifica_disponibilidade_troco_0:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_1
//  570     maior_nota = 200;
        MOVS     R0,#+200
        MOVS     R5,R0
//  571   if(flag_notas&0x04)
??APLICACAO_verifica_disponibilidade_troco_1:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_2
//  572     maior_nota = 500;
        MOV      R0,#+500
        MOVS     R5,R0
//  573   if(flag_notas&0x08)
??APLICACAO_verifica_disponibilidade_troco_2:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+28
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_3
//  574     maior_nota = 1000;
        MOV      R0,#+1000
        MOVS     R5,R0
//  575   if(flag_notas&0x10)
??APLICACAO_verifica_disponibilidade_troco_3:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_4
//  576     maior_nota = 2000;
        MOV      R0,#+2000
        MOVS     R5,R0
//  577   /*
//  578   if(flag_notas&0x20)
//  579     maior_nota = 5000;
//  580   */
//  581   
//  582   if( APLICACACAO_verifica_troco()<maior_nota){
??APLICACAO_verifica_disponibilidade_troco_4:
          CFI FunCall APLICACACAO_verifica_troco
        BL       APLICACACAO_verifica_troco
        CMP      R0,R5
        BCS.N    ??APLICACAO_verifica_disponibilidade_troco_5
//  583     
//  584     BOARD_setter_led_instrucao(LED_FORA_SERVICO,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+6
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  585     PAGAMENTOS_set_bloqueio(1);
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  586     STRING_write_to_external(CLEAR_DISPLAY,
//  587                              (char*)STRING_mensagem_sem_troco[idioma][0],
//  588                              (char*)STRING_mensagem_sem_troco[idioma][1]);    
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
//  589     
//  590     for(;APLICACACAO_verifica_troco()<maior_nota;){
??APLICACAO_verifica_disponibilidade_troco_6:
          CFI FunCall APLICACACAO_verifica_troco
        BL       APLICACACAO_verifica_troco
        CMP      R0,R5
        BCS.N    ??APLICACAO_verifica_disponibilidade_troco_7
//  591         
//  592       tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R6,R0
//  593       switch(tecla){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,R6
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_verifica_disponibilidade_troco_8
        CMP      R0,#+4
        BNE.N    ??APLICACAO_verifica_disponibilidade_troco_9
//  594         case TECLA_ENTER:
//  595             APLIACAO_wait_lcd();
??APLICACAO_verifica_disponibilidade_troco_10:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  596             BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  597             MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  598             BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  599             idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  600             APLICACAO_release_lcd();             
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  601             STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);        
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  602             break;
        B.N      ??APLICACAO_verifica_disponibilidade_troco_9
//  603         case TECLA_ESC:
//  604             break;
//  605       }    
//  606       
//  607       APLICACAO_tela_descanso();      
??APLICACAO_verifica_disponibilidade_troco_8:
??APLICACAO_verifica_disponibilidade_troco_9:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
        B.N      ??APLICACAO_verifica_disponibilidade_troco_6
//  608     }//Fim do for(;;)        
//  609     PAGAMENTOS_set_bloqueio(0);
??APLICACAO_verifica_disponibilidade_troco_7:
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  610     BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  611     BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  612     BOARD_setter_led_instrucao(LED_INSIRA_DINHEIRO,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  613   }  
//  614 }
??APLICACAO_verifica_disponibilidade_troco_5:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock12
//  615 /***********************************************************************************
//  616 *       Descrição       :       Verifica o barramento MDB
//  617 *       Parametros      :       nenhum
//  618 *       Retorno         :       nenhum
//  619 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function APLICACAO_verifica_MDB
        THUMB
//  620 void APLICACAO_verifica_MDB(void){
APLICACAO_verifica_MDB:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  621   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  622   
//  623   switch(MDB_checa_dispositivos()){
          CFI FunCall MDB_checa_dispositivos
        BL       MDB_checa_dispositivos
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_MDB_0
        CMP      R0,#+2
        BEQ.N    ??APLICACAO_verifica_MDB_1
        BCC.N    ??APLICACAO_verifica_MDB_2
        B.N      ??APLICACAO_verifica_MDB_3
//  624     case MDB_TODOS_ONLINE:            
//  625          return;
??APLICACAO_verifica_MDB_0:
        B.N      ??APLICACAO_verifica_MDB_4
//  626     case MDB_BILL_OFFLINE:
//  627          STRING_write_to_external(CLEAR_DISPLAY,
//  628                                   (char*)STRING_mensagem_noteiro_mdb_offline[idioma][0],
//  629                                   (char*)STRING_mensagem_noteiro_mdb_offline[idioma][1]);          
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
//  630          break;
        B.N      ??APLICACAO_verifica_MDB_3
//  631     case MDB_COIN_OFFLINE:
//  632          STRING_write_to_external(CLEAR_DISPLAY,
//  633                                   (char*)STRING_mensagem_moedeiro_mdb_offline[idioma][0],
//  634                                   (char*)STRING_mensagem_moedeiro_mdb_offline[idioma][1]);           
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
//  635          break;
//  636   }  
//  637   
//  638   eTECLA tecla;
//  639   
//  640   for(;;){
//  641     
//  642     if(MDB_checa_dispositivos()==MDB_TODOS_ONLINE)
??APLICACAO_verifica_MDB_3:
??APLICACAO_verifica_MDB_5:
          CFI FunCall MDB_checa_dispositivos
        BL       MDB_checa_dispositivos
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_MDB_4
//  643       return;
//  644     
//  645     tecla = TECLADO_getch();
??APLICACAO_verifica_MDB_6:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R5,R0
//  646     switch(tecla){
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_verifica_MDB_7
        CMP      R0,#+4
        BNE.N    ??APLICACAO_verifica_MDB_8
//  647       case TECLA_ENTER:
//  648             APLIACAO_wait_lcd();
??APLICACAO_verifica_MDB_9:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  649             BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  650             MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  651             BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  652             idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  653             APLICACAO_release_lcd();             
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  654             STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);              
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  655            break;
        B.N      ??APLICACAO_verifica_MDB_8
//  656       case TECLA_ESC:
//  657            break;
//  658     }    
//  659     APLICACAO_tela_descanso();      
??APLICACAO_verifica_MDB_7:
??APLICACAO_verifica_MDB_8:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  660     vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??APLICACAO_verifica_MDB_5
//  661   }
??APLICACAO_verifica_MDB_4:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock13
//  662 }
//  663 /***********************************************************************************
//  664 *       Descrição       :       Faz a verificação do meio de pagamento
//  665 *                               CCTALK
//  666 *       Parametros      :       nenhum
//  667 *       Retorno         :       nenhum
//  668 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function APLICACAO_verifica_cctalk
        THUMB
//  669 void APLICACAO_verifica_cctalk(void){
APLICACAO_verifica_cctalk:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
//  670   unsigned char flag;
//  671   
//  672   PARAMETROS_le(ADR_FLAG_BV20,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  673   
//  674   if(!flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_cctalk_0
//  675     return;  
//  676   
//  677   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
??APLICACAO_verifica_cctalk_1:
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  678   eBV20_state estado_atual = BV20_get_current_state();
          CFI FunCall BV20_get_current_state
        BL       BV20_get_current_state
        MOVS     R5,R0
//  679   
//  680   if(estado_atual!=BV20_OFFLINE)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+3
        BNE.N    ??APLICACAO_verifica_cctalk_0
//  681     return;
//  682   
//  683   STRING_write_to_external(CLEAR_DISPLAY,
//  684                            (char*)STRING_mensagem_cctalk_offline[idioma][0],
//  685                            (char*)STRING_mensagem_cctalk_offline[idioma][1]);       
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
//  686     
//  687   eTECLA tecla;
//  688   
//  689   for(;;){
//  690     
//  691     estado_atual = BV20_get_current_state();
??APLICACAO_verifica_cctalk_3:
          CFI FunCall BV20_get_current_state
        BL       BV20_get_current_state
        MOVS     R5,R0
//  692     
//  693     if(estado_atual!=BV20_OFFLINE)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+3
        BNE.N    ??APLICACAO_verifica_cctalk_0
//  694       return;
//  695     
//  696     tecla = TECLADO_getch();
??APLICACAO_verifica_cctalk_4:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R6,R0
//  697     switch(tecla){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,R6
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_verifica_cctalk_5
        CMP      R0,#+4
        BNE.N    ??APLICACAO_verifica_cctalk_6
//  698       case TECLA_ENTER:
//  699             BOARD_reset_tempo_propaganda();
??APLICACAO_verifica_cctalk_7:
          CFI FunCall BOARD_reset_tempo_propaganda
        BL       BOARD_reset_tempo_propaganda
//  700             APLIACAO_wait_lcd();
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  701             BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  702             MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  703             BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  704             idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  705             APLICACAO_release_lcd();             
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  706             STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);              
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  707             BOARD_reset_tempo_propaganda();
          CFI FunCall BOARD_reset_tempo_propaganda
        BL       BOARD_reset_tempo_propaganda
//  708            break;
        B.N      ??APLICACAO_verifica_cctalk_6
//  709       case TECLA_ESC:
//  710            break;
//  711     }    
//  712     APLICACAO_tela_descanso();      
??APLICACAO_verifica_cctalk_5:
??APLICACAO_verifica_cctalk_6:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  713     vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??APLICACAO_verifica_cctalk_3
//  714   }    
??APLICACAO_verifica_cctalk_0:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock14
//  715 }
//  716 /***********************************************************************************
//  717 *       Descrição       :       Faz a verificação cíclica dos sinais 
//  718 *                               do papel e do termistor
//  719 *       Parametros      :       nenhum
//  720 *       Retorno         :       nenhum
//  721 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function APLICACAO_verificao_ciclica
        THUMB
//  722 void APLICACAO_verificao_ciclica(void){
APLICACAO_verificao_ciclica:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  723   
//  724   switch(POST_verificacao_ciclica()){
          CFI FunCall POST_verificacao_ciclica
        BL       POST_verificacao_ciclica
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verificao_ciclica_0
        CMP      R0,#+2
        BEQ.N    ??APLICACAO_verificao_ciclica_1
        BCC.N    ??APLICACAO_verificao_ciclica_2
        B.N      ??APLICACAO_verificao_ciclica_3
//  725    case POST_CICLICO_SUCESSO:
//  726         break;
??APLICACAO_verificao_ciclica_0:
        B.N      ??APLICACAO_verificao_ciclica_3
//  727    case POST_CICLICO_FALHA_EMBALAGEM:
//  728         STRING_write_to_external(CLEAR_DISPLAY,"E03:FALTA","EMBALAGEM");
??APLICACAO_verificao_ciclica_2:
        LDR.N    R2,??DataTable14_24
        LDR.N    R1,??DataTable14_25
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  729         APLICACAO_loop_falha_ciclica();
          CFI FunCall APLICACAO_loop_falha_ciclica
        BL       APLICACAO_loop_falha_ciclica
//  730         break;
        B.N      ??APLICACAO_verificao_ciclica_3
//  731    case POST_CICLICO_FALHA_TERMISTOR:
//  732         STRING_write_to_external(CLEAR_DISPLAY,"E04:FALHA","SENS. TEMP.");
??APLICACAO_verificao_ciclica_1:
        LDR.N    R2,??DataTable14_26
        LDR.N    R1,??DataTable14_27
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  733         APLICACAO_loop_falha_ciclica();
          CFI FunCall APLICACAO_loop_falha_ciclica
        BL       APLICACAO_loop_falha_ciclica
//  734         break;
//  735   }  
//  736 }
??APLICACAO_verificao_ciclica_3:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock15
//  737 /***********************************************************************************
//  738 *       Descrição       :       Menu do loop onde há a falha no sensor de
//  739 *                               temperatura ou falta de embalagem
//  740 *       Parametros      :       nenhum
//  741 *       Retorno         :       nenhum
//  742 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function APLICACAO_loop_falha_ciclica
        THUMB
//  743 void APLICACAO_loop_falha_ciclica(void){
APLICACAO_loop_falha_ciclica:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  744   eTECLA tecla;
//  745   unsigned char loop=1;
        MOVS     R5,#+1
//  746     
//  747   for(;loop;){
??APLICACAO_loop_falha_ciclica_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??APLICACAO_loop_falha_ciclica_1
//  748     
//  749     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R4,R0
//  750     switch(tecla){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_loop_falha_ciclica_2
        CMP      R0,#+4
        BNE.N    ??APLICACAO_loop_falha_ciclica_3
//  751       case TECLA_ENTER:
//  752           MCFG_entry();                     
??APLICACAO_loop_falha_ciclica_4:
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  753            break;
        B.N      ??APLICACAO_loop_falha_ciclica_3
//  754       case TECLA_ESC:
//  755            loop = 0;
??APLICACAO_loop_falha_ciclica_2:
        MOVS     R0,#+0
        MOVS     R5,R0
//  756            break;
//  757     }      
//  758     
//  759     APLICACAO_tela_descanso();    
??APLICACAO_loop_falha_ciclica_3:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
        B.N      ??APLICACAO_loop_falha_ciclica_0
//  760   }  
//  761   
//  762   STRING_write_to_internal(CLEAR_DISPLAY,"REINICIANDO","VERIFICACAO");
??APLICACAO_loop_falha_ciclica_1:
        LDR.N    R2,??DataTable14_28
        LDR.N    R1,??DataTable14_29
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  763   vTaskDelay(3000);  
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  764 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock16
//  765 /***********************************************************************************
//  766 *       Descrição       :       Ciclo de desumidificação da máquina
//  767 *       Parametros      :       nenhum
//  768 *       Retorno         :       nenhum
//  769 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function APLICACAO_ciclo_desumidificador
        THUMB
//  770 void APLICACAO_ciclo_desumidificador(unsigned char flag){
APLICACAO_ciclo_desumidificador:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  771   
//  772   if(flag && !APLICACAO_tempo_desumidificador){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??APLICACAO_ciclo_desumidificador_0
        LDR.N    R0,??DataTable14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??APLICACAO_ciclo_desumidificador_0
//  773     
//  774     unsigned int tempo=30000;
        MOVW     R5,#+30000
//  775     
//  776     STRING_write_to_internal(CLEAR_DISPLAY,"CICLO DE","DESUMIDIFICACAO");
        LDR.N    R2,??DataTable14_30
        LDR.N    R1,??DataTable14_31
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  777     STRING_write_to_external(CLEAR_DISPLAY,"CICLO DE","DESUMIDIFICACAO");
        LDR.N    R2,??DataTable14_30
        LDR.N    R1,??DataTable14_31
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  778     
//  779     POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  780     POTENCIA_setRPM(6000);
        MOVW     R0,#+6000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  781     CT_set_temperatura(60);
        MOVS     R0,#+60
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  782     vTaskDelay(3000);
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  783     
//  784     while(tempo--){
??APLICACAO_ciclo_desumidificador_1:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_ciclo_desumidificador_2
//  785       
//  786       if(POTENCIA_getRPMmedido()<1000){
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        CMP      R0,#+1000
        BCS.N    ??APLICACAO_ciclo_desumidificador_3
//  787         CT_set_temperatura(0);
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  788         POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  789         POTENCIA_set_neutro(0);        
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  790         return;
        B.N      ??APLICACAO_ciclo_desumidificador_4
//  791       }
//  792       vTaskDelay(1);
??APLICACAO_ciclo_desumidificador_3:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??APLICACAO_ciclo_desumidificador_1
//  793     }
//  794     
//  795     CT_set_temperatura(0);
??APLICACAO_ciclo_desumidificador_2:
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  796     POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  797     POTENCIA_set_neutro(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  798     APLICACAO_verifica_post();
          CFI FunCall APLICACAO_verifica_post
        BL       APLICACAO_verifica_post
//  799     APLICACAO_tempo_desumidificador = TEMPO_DESUMIDIFICADOR;
        LDR.N    R0,??DataTable14
        LDR.N    R1,??DataTable14_1  ;; 0x1b7740
        STR      R1,[R0, #+0]
//  800   }
//  801 }
??APLICACAO_ciclo_desumidificador_0:
??APLICACAO_ciclo_desumidificador_4:
        POP      {R0,R4,R5,PC}    ;; return
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
        DC32     STRING_mensagem_retire_troco

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_13:
        DC32     `?<Constant "E0:VENTILADOR">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_14:
        DC32     STRING_mensagem_fora_servico

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_15:
        DC32     `?<Constant "E1:AQUECIMENTO">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_16:
        DC32     `?<Constant "E2:DOSADOR">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_17:
        DC32     `?<Constant "E3:EMBALAGEM">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_18:
        DC32     STRING_liberando_troco

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
//  802 /***********************************************************************************
//  803 *       Fim do arquivo
//  804 ***********************************************************************************/
// 
//    25 bytes in section .bss
//     4 bytes in section .data
//   212 bytes in section .rodata
// 2 704 bytes in section .text
// 
// 2 704 bytes of CODE  memory
//   212 bytes of CONST memory
//    29 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
