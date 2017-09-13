///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     13/Sep/2017  18:10:08 /
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
//   41 #include "..\includes.h"
//   42 
//   43 /***********************************************************************************
//   44 *       Constantes
//   45 ***********************************************************************************/
//   46 #define TEMPO_DESUMIDIFICADOR                   1000*60*30
//   47 #define TEMPO_MENSAGEM_LINHA_INFERIOR           10000
//   48 
//   49 #define _DEBUG_PAGAMENTOS_
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
//   61 unsigned int APLICACAO_tempo_desumidificador=30*1000;//TEMPO_DESUMIDIFICADOR;
APLICACAO_tempo_desumidificador:
        DATA
        DC32 30000

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
        PUSH     {R2-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+24
        MOVS     R4,R0
//   93   eTECLA tecla;
//   94   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R6,R0
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
//  109   PREPARACAO_limpeza_inicial(idioma);
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
//  125   
//  126   for(;;){
//  127     
//  128     PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
??APLICACAO_main_0:
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  129     PARAMETROS_le(ADR_FLAG_FREE,(void*)&modo_gratis);
        ADD      R1,SP,#+1
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  130     PARAMETROS_le(ADR_FLAG_TROCO,(void*)&modo_troco);    
        ADD      R1,SP,#+0
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  131     
//  132     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R5,R0
//  133     switch(tecla){
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
//  134       case TECLA_INC:
//  135            //SMDB_cashless_vend(100,1);
//  136            break;
??APLICACAO_main_4:
        B.N      ??APLICACAO_main_2
//  137       case TECLA_DEC:
//  138            break;
??APLICACAO_main_3:
        B.N      ??APLICACAO_main_2
//  139       case TECLA_ENTER:
//  140            APLIACAO_wait_lcd();
??APLICACAO_main_6:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  141              BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  142              MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  143              BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  144              idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R6,R0
//  145              
//  146              PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  147              PARAMETROS_le(ADR_FLAG_FREE,(void*)&modo_gratis);
        ADD      R1,SP,#+1
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  148              PARAMETROS_le(ADR_FLAG_TROCO,(void*)&modo_troco);
        ADD      R1,SP,#+0
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  149              
//  150              APLICACAO_tempo_desumidificador=TEMPO_DESUMIDIFICADOR;
        LDR.W    R0,??DataTable14
        LDR.W    R1,??DataTable14_1  ;; 0x1b7740
        STR      R1,[R0, #+0]
//  151              
//  152            APLICACAO_release_lcd();  
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  153            
//  154            STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  155            break;
        B.N      ??APLICACAO_main_2
//  156       case TECLA_ESC:
//  157            break;
??APLICACAO_main_1:
        B.N      ??APLICACAO_main_2
//  158       case TECLA_GRATIS:
//  159            if(modo_gratis)
??APLICACAO_main_5:
        LDRB     R0,[SP, #+1]
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_main_7
//  160              PAGAMENTOS_adiciona_valores(valorPipoca);
        LDR      R0,[SP, #+4]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_adiciona_valores
        BL       PAGAMENTOS_adiciona_valores
//  161            break;      
//  162     }
//  163     
//  164     if(modo_gratis)
??APLICACAO_main_7:
??APLICACAO_main_2:
        LDRB     R0,[SP, #+1]
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_main_8
//  165       STRING_write_to_external(NO_CLEAR,(void*)STRING_mensagem_modo_gratis[idioma][0],(void*)STRING_mensagem_modo_gratis[idioma][1]);
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
        B.N      ??APLICACAO_main_9
//  166     else{
//  167       APLICACAO_exibe_valor(idioma);     
??APLICACAO_main_8:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall APLICACAO_exibe_valor
        BL       APLICACAO_exibe_valor
//  168       if(modo_troco)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_main_10
//  169         APLICACAO_verifica_disponibilidade_troco(idioma);
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall APLICACAO_verifica_disponibilidade_troco
        BL       APLICACAO_verifica_disponibilidade_troco
//  170       // Verifica a conectividade dos
//  171       // meios de pagamento seriais
//  172       APLICACAO_verifica_MDB();
??APLICACAO_main_10:
          CFI FunCall APLICACAO_verifica_MDB
        BL       APLICACAO_verifica_MDB
//  173       APLICACAO_verifica_cctalk();
          CFI FunCall APLICACAO_verifica_cctalk
        BL       APLICACAO_verifica_cctalk
//  174     }
//  175     
//  176     APLICACAO_verifica_preparacao(valorPipoca,idioma,modo_troco);             
??APLICACAO_main_9:
        LDRB     R2,[SP, #+0]
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R0,[SP, #+4]
          CFI FunCall APLICACAO_verifica_preparacao
        BL       APLICACAO_verifica_preparacao
//  177     BOARD_setter_led_instrucao(LED_INSIRA_DINHEIRO,PISCANDO); // Ativa o modo inserir dinheiro
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  178     APLICACAO_tela_descanso();    
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  179 #ifndef _DEBUG_PAGAMENTOS_    
//  180     APLICACAO_verificao_ciclica();
//  181 #endif
//  182     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  183     APLICACAO_ciclo_desumidificador(flag_desumidificador);
        LDRB     R0,[SP, #+2]
          CFI FunCall APLICACAO_ciclo_desumidificador
        BL       APLICACAO_ciclo_desumidificador
        B.N      ??APLICACAO_main_0
          CFI EndBlock cfiBlock0
//  184   }   
//  185 }
//  186 /***********************************************************************************
//  187 *       Descrição       :       Inicialização do ódulo
//  188 *       Parametros      :       nenhum
//  189 *       Retorno         :       nenhum
//  190 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function APLICACAO_ini
        THUMB
//  191 void APLICACAO_ini(void){
APLICACAO_ini:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  192   eIDIOMA idioma  = BRASIL;
        MOVS     R4,#+0
//  193        
//  194   HD44780_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,
//  195                LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);     
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_init
        BL       HD44780_init
//  196   
//  197   HD44780_2_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,
//  198                  LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);       
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_2_init
        BL       HD44780_2_init
//  199   
//  200   STRING_write_to_internal(CLEAR_DISPLAY,
//  201                            (char*)STRING_splash[idioma][0],
//  202                            (char*)STRING_splash[idioma][1]);      
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
//  203   
//  204   STRING_write_to_external(CLEAR_DISPLAY,
//  205                            (char*)STRING_mensagem_saudacao_maquina[idioma][0],
//  206                            (char*)STRING_mensagem_saudacao_maquina[idioma][1]);      
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
//  207   
//  208   vSemaphoreCreateBinary(APLICACAO_sem_LCD);
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
//  209 }
??APLICACAO_ini_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  210 /***********************************************************************************
//  211 *       Descrição       :       Semáforo para acessar o LCD
//  212 *       Parametros      :       nenhum
//  213 *       Retorno         :       nenhum
//  214 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function APLIACAO_wait_lcd
        THUMB
//  215 void APLIACAO_wait_lcd(void){
APLIACAO_wait_lcd:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  216   
//  217   while(!xSemaphoreTake(APLICACAO_sem_LCD,portTICK_RATE_MS*1));
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
//  218 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  219 /***********************************************************************************
//  220 *       Descrição       :       Libera o semáforo do LCD
//  221 *       Parametros      :       nenhum
//  222 *       Retorno         :       nenhum
//  223 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function APLICACAO_release_lcd
        THUMB
//  224 void APLICACAO_release_lcd(void){
APLICACAO_release_lcd:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  225   
//  226   xSemaphoreGive(APLICACAO_sem_LCD);
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.W    R0,??DataTable14_5
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  227 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  228 /***********************************************************************************
//  229 *       Descrição       :       Funções para carregar o idioma
//  230 *       Parametros      :       nenhum
//  231 *       Retorno         :       nenhum
//  232 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function APLICACAO_carrega_idioma
        THUMB
//  233 unsigned char APLICACAO_carrega_idioma(void){
APLICACAO_carrega_idioma:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  234   unsigned char idioma  = BRASIL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  235   
//  236   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);  
        ADD      R1,SP,#+0
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  237   if(idioma>QTY_OF_LANGUAGES)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+8
        BLT.N    ??APLICACAO_carrega_idioma_0
//  238     idioma = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  239   
//  240   return idioma;
??APLICACAO_carrega_idioma_0:
        LDRB     R0,[SP, #+0]
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
//  241 }
//  242 /***********************************************************************************
//  243 *       Descrição       :       Tela de descanso do display interno
//  244 *       Parametros      :       nenhum
//  245 *       Retorno         :       nenhum
//  246 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function APLICACAO_tela_descanso
        THUMB
//  247 void APLICACAO_tela_descanso(void){
APLICACAO_tela_descanso:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+24
          CFI CFA R13+40
//  248   char buffer_linha[17];
//  249   
//  250   sprintf(buffer_linha,"RPM:%05d T%03doC",POTENCIA_getRPMmedido(),AA_calculaTemperatura());
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
//  251   STRING_write_to_internal(NO_CLEAR,buffer_linha,NULL);    
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  252   
//  253   sprintf(buffer_linha,"P:%04d M:%04d,%02d",AA_mediaMovelPapel(),
//  254                                             PAGAMENTOS_get_valor_acumulado()/100,
//  255                                             PAGAMENTOS_get_valor_acumulado()%100);
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
//  256   
//  257   STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  258 }
        ADD      SP,SP,#+24
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock5
//  259 /***********************************************************************************
//  260 *       Descrição       :       Exibe o valor da pipoca e 
//  261 *                               o quanto já foi pago pelo cliente
//  262 *       Parametros      :       nenhum
//  263 *       Retorno         :       nenhum
//  264 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function APLICACAO_exibe_valor
        THUMB
//  265 void APLICACAO_exibe_valor(unsigned char idioma){
APLICACAO_exibe_valor:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+28
          CFI CFA R13+40
        MOVS     R4,R0
//  266   unsigned int valor;
//  267   char buffer_linha[17];
//  268   static unsigned char indice=0;
//  269   
//  270   PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  271   sprintf(buffer_linha,STRING_mensagem_preco[idioma],valor/100,valor%100);
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
//  272   STRING_write_to_external(NO_CLEAR,buffer_linha,NULL);    
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  273   
//  274   unsigned int pago = PAGAMENTOS_get_valor_acumulado();
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        MOVS     R5,R0
//  275   
//  276   if(pago){    
        CMP      R5,#+0
        BEQ.N    ??APLICACAO_exibe_valor_0
//  277     sprintf(buffer_linha,STRING_mensagem_pago[idioma],pago/100,pago%100);
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
//  278     STRING_write_to_external(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
        B.N      ??APLICACAO_exibe_valor_1
//  279   }
//  280   else{
//  281     if(!APLICACAO_tempo_mensagem){
??APLICACAO_exibe_valor_0:
        LDR.W    R0,??DataTable14_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??APLICACAO_exibe_valor_2
//  282       indice = (indice+1) % 4;
        LDR.W    R0,??DataTable14_11
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+4
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.W    R0,??DataTable14_11
        STRB     R2,[R0, #+0]
//  283       APLICACAO_tempo_mensagem = TEMPO_MENSAGEM_LINHA_INFERIOR;
        LDR.W    R0,??DataTable14_10
        MOVW     R1,#+10000
        STR      R1,[R0, #+0]
//  284     }
//  285     PARAMETROS_le(ADR_MENSAGEM_CLIENTE_01+indice,(void*)buffer_linha);
??APLICACAO_exibe_valor_2:
        ADD      R1,SP,#+4
        LDR.W    R0,??DataTable14_11
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+60
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  286     STRING_write_to_external(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  287   }
//  288 }
??APLICACAO_exibe_valor_1:
        ADD      SP,SP,#+28
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock6

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??indice:
        DS8 1
//  289 /***********************************************************************************
//  290 *       Descrição       :       Verifica a contagem dos tubos de moeda
//  291 *       Parametros      :       nenhum
//  292 *       Retorno         :       (unsigned char) maior do que zero se há troco
//  293 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function APLICACACAO_verifica_troco
        THUMB
//  294 unsigned int APLICACACAO_verifica_troco(void){
APLICACACAO_verifica_troco:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  295   unsigned int troco;
//  296   
//  297   if(MDB_checa_troco(&troco))
        ADD      R0,SP,#+0
          CFI FunCall MDB_checa_troco
        BL       MDB_checa_troco
        CMP      R0,#+0
        BEQ.N    ??APLICACACAO_verifica_troco_0
//  298     return troco;
        LDR      R0,[SP, #+0]
        B.N      ??APLICACACAO_verifica_troco_1
//  299   
//  300   return 0;
??APLICACACAO_verifica_troco_0:
        MOVS     R0,#+0
??APLICACACAO_verifica_troco_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock7
//  301 }
//  302 /***********************************************************************************
//  303 *       Descrição       :       Faz a verificação dos pagamentos para
//  304 *                               iniciar o ciclo de preparação
//  305 *       Parametros      :       (unsigned int) valor da pipoca
//  306 *       Retorno         :       nenhum
//  307 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function APLICACAO_verifica_preparacao
        THUMB
//  308 void APLICACAO_verifica_preparacao(unsigned int valor_pipoca,unsigned char idioma,
//  309                                    unsigned char troco){
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
//  310    unsigned int ajuste;
//  311   
//  312   if( PAGAMENTOS_get_valor_acumulado()>=valor_pipoca) {      
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        CMP      R0,R4
        BCC.W    ??APLICACAO_verifica_preparacao_0
//  313     
//  314     if(troco==OPERA_SEM_TROCO || APLICACACAO_verifica_troco()>=valor_pipoca){     
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??APLICACAO_verifica_preparacao_1
          CFI FunCall APLICACACAO_verifica_troco
        BL       APLICACACAO_verifica_troco
        CMP      R0,R4
        BCC.N    ??APLICACAO_verifica_preparacao_2
//  315       // Switch para 
//  316       // capturar os resultados da execução do processo
//  317       switch(PREPARACAO_entry(&ajuste,CONTABILIZA)){
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
//  318         case SUCESSO:
//  319              PAGAMENTOS_subtrai_valores(valor_pipoca);          
??APLICACAO_verifica_preparacao_3:
        MOVS     R0,R4
          CFI FunCall PAGAMENTOS_subtrai_valores
        BL       PAGAMENTOS_subtrai_valores
//  320              // Devolve o troco caso ainda reste valor
//  321              // pago no acumulador de moeda
//  322              if(troco==OPERA_COM_TROCO && PAGAMENTOS_get_valor_acumulado()){               
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+255
        BNE.N    ??APLICACAO_verifica_preparacao_8
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_preparacao_8
//  323                STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  324                
//  325                STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  326                
//  327                STRING_write_to_external(CLEAR_DISPLAY,
//  328                                         (char*)STRING_mensagem_retire_troco[idioma][0],
//  329                                         (char*)STRING_mensagem_retire_troco[idioma][1]);
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
//  330                APLICACAO_devolve_troco();      
          CFI FunCall APLICACAO_devolve_troco
        BL       APLICACAO_devolve_troco
//  331              }
//  332              PREPARACAO_resfriamento(idioma);
??APLICACAO_verifica_preparacao_8:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PREPARACAO_resfriamento
        BL       PREPARACAO_resfriamento
//  333              STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);                
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  334              PAGAMENTOS_set_bloqueio(0);
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  335              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  336         case FALHA_VENTILADOR:
//  337              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E0:VENTILADOR");                       
??APLICACAO_verifica_preparacao_5:
        LDR.W    R2,??DataTable14_13
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_14
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  338              APLICACAO_menu_falha();
          CFI FunCall APLICACAO_menu_falha
        BL       APLICACAO_menu_falha
//  339              PAGAMENTOS_set_bloqueio(0);             
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  340              break;
        B.N      ??APLICACAO_verifica_preparacao_2
//  341         case FALHA_RESISTENCIA:
//  342              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E1:AQUECIMENTO");
??APLICACAO_verifica_preparacao_4:
        LDR.W    R2,??DataTable14_15
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
//  346         case FALHA_DOSE:
//  347              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E2:DOSADOR");          
??APLICACAO_verifica_preparacao_7:
        LDR.W    R2,??DataTable14_16
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
//  351         case FALHA_EMBALAGEM:
//  352              STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E3:EMBALAGEM");                                                 
??APLICACAO_verifica_preparacao_6:
        LDR.W    R2,??DataTable14_17
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
//  356       }     
//  357     }
//  358          
//  359     STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
??APLICACAO_verifica_preparacao_2:
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  360     BOARD_setter_contador_propaganda(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_setter_contador_propaganda
        BL       BOARD_setter_contador_propaganda
        B.N      ??APLICACAO_verifica_preparacao_9
//  361   }//Fim do inicio do processo de preparação
//  362   else
//  363     if(troco==OPERA_COM_TROCO && !PAGAMENTOS_get_timeout_pagamento() && PAGAMENTOS_get_valor_acumulado()){        
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
//  364       APLICACAO_devolve_troco();
          CFI FunCall APLICACAO_devolve_troco
        BL       APLICACAO_devolve_troco
//  365     }  
//  366 }
??APLICACAO_verifica_preparacao_9:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock8
//  367 /***********************************************************************************
//  368 *       Descrição       :       Tela quando há alguma falha na máquina
//  369 *       Parametros      :       (unsigned char) idioma
//  370 *       Retorno         :       nenhum
//  371 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function APLICACAO_menu_falha
        THUMB
//  372 void APLICACAO_menu_falha(void){
APLICACAO_menu_falha:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  373   eTECLA tecla;
//  374                  
//  375   BOARD_setter_led_instrucao(LED_FORA_SERVICO,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+6
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  376   APLICACAO_devolve_troco(); // Devolve o valor ao cliente
          CFI FunCall APLICACAO_devolve_troco
        BL       APLICACAO_devolve_troco
//  377                              // devido a uma falha no sistema
//  378   
//  379   PAGAMENTOS_set_bloqueio(1);
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  380   
//  381   for(;;){
//  382     
//  383     APLICACAO_tela_descanso();           
??APLICACAO_menu_falha_0:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  384     
//  385     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R4,R0
//  386     switch(tecla){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??APLICACAO_menu_falha_1
        BCC.N    ??APLICACAO_menu_falha_0
        CMP      R4,#+3
        BEQ.N    ??APLICACAO_menu_falha_2
        BCC.N    ??APLICACAO_menu_falha_3
        CMP      R4,#+4
        BNE.N    ??APLICACAO_menu_falha_0
//  387       case TECLA_ENTER:
//  388           APLIACAO_wait_lcd();
??APLICACAO_menu_falha_4:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  389           BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  390           MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  391           BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  392           APLICACAO_release_lcd();             
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  393           STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);                   
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  394           break;
        B.N      ??APLICACAO_menu_falha_0
//  395       case TECLA_ESC:
//  396           break;
??APLICACAO_menu_falha_1:
        B.N      ??APLICACAO_menu_falha_0
//  397       case TECLA_INC:
//  398           break;
??APLICACAO_menu_falha_3:
        B.N      ??APLICACAO_menu_falha_0
//  399       case TECLA_DEC:
//  400           break;
??APLICACAO_menu_falha_2:
        B.N      ??APLICACAO_menu_falha_0
          CFI EndBlock cfiBlock9
//  401     }       
//  402   }
//  403 }
//  404 /***********************************************************************************
//  405 *       Descrição       :       Função para devolver o troco ao cliente
//  406 *       Parametros      :       (void)
//  407 *       Retorno         :       (unsigned char) maior do que zero se
//  408 *                               conseguiu devolver o troco
//  409 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function APLICACAO_devolve_troco
        THUMB
//  410 unsigned char APLICACAO_devolve_troco(void){
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
//  411   unsigned int valor = PAGAMENTOS_get_valor_acumulado();
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        MOVS     R4,R0
//  412   unsigned char tubos[16];
//  413   unsigned char escala;
//  414   unsigned char change_coins[16];
//  415   eMDB_reply res;
//  416   unsigned int tentativas;
//  417   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R6,R0
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
//  422   
//  423   // Busca a quantidade de moedas nos tubos
//  424   // e a escala do pais
//  425   tentativas=10;
        MOVS     R0,#+10
        MOVS     R7,R0
//  426   do res = MDB_checa_valor_moedas(&escala,tubos);
??APLICACAO_devolve_troco_0:
        ADD      R1,SP,#+20
        ADD      R0,SP,#+0
          CFI FunCall MDB_checa_valor_moedas
        BL       MDB_checa_valor_moedas
        MOVS     R5,R0
//  427   while(res!=MDB_OK && --tentativas);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??APLICACAO_devolve_troco_1
        SUBS     R7,R7,#+1
        CMP      R7,#+0
        BNE.N    ??APLICACAO_devolve_troco_0
//  428   
//  429   if(res==MDB_OK){
??APLICACAO_devolve_troco_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??APLICACAO_devolve_troco_2
//  430     
//  431     STRING_write_to_external(NO_CLEAR,NULL,(char*)STRING_liberando_troco[(unsigned char)idioma]);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.W    R0,??DataTable14_18
        LDR      R2,[R0, R6, LSL #+2]
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  432           
//  433     SMDB_wait();
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  434   
//  435     tentativas = 10;
        MOVS     R0,#+10
        MOVS     R7,R0
//  436     do res = MDBCOIN_alternative_payout(valor,escala);
??APLICACAO_devolve_troco_3:
        LDRB     R1,[SP, #+0]
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall MDBCOIN_alternative_payout
        BL       MDBCOIN_alternative_payout
        MOVS     R5,R0
//  437     while(res!=MDB_OK && tentativas--);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??APLICACAO_devolve_troco_4
        MOVS     R0,R7
        SUBS     R7,R0,#+1
        CMP      R0,#+0
        BNE.N    ??APLICACAO_devolve_troco_3
//  438     
//  439     SMDB_release();
??APLICACAO_devolve_troco_4:
          CFI FunCall SMDB_release
        BL       SMDB_release
//  440     
//  441     if(res==MDB_OK){      
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??APLICACAO_devolve_troco_2
//  442       //
//  443       //  Loop para descontar o total do troco
//  444       //
//  445       do{
//  446         SMDB_wait();
??APLICACAO_devolve_troco_5:
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  447             
//  448         tentativas = 10;
        MOVS     R0,#+10
        MOVS     R7,R0
//  449         do res = MDBCOIN_get_payout_status(change_coins);
??APLICACAO_devolve_troco_6:
        ADD      R0,SP,#+4
          CFI FunCall MDBCOIN_get_payout_status
        BL       MDBCOIN_get_payout_status
        MOVS     R5,R0
//  450         while(res!=MDB_OK && --tentativas);      
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??APLICACAO_devolve_troco_7
        SUBS     R7,R7,#+1
        CMP      R7,#+0
        BNE.N    ??APLICACAO_devolve_troco_6
//  451       
//  452         SMDB_release();      
??APLICACAO_devolve_troco_7:
          CFI FunCall SMDB_release
        BL       SMDB_release
//  453       
//  454         if(res==MDB_OK){                                      
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??APLICACAO_devolve_troco_8
//  455           unsigned int troco=0;
        MOVS     R8,#+0
//  456           for(unsigned char i=0;i<16;i++)
        MOVS     R0,#+0
??APLICACAO_devolve_troco_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BGE.N    ??APLICACAO_devolve_troco_10
//  457             troco+= (change_coins[i]*escala*tubos[i]);
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
//  458           
//  459             // Confirmação de que o troco liberado
//  460             // corresponde ao valor solicitado
//  461             // assim pode descontar o montante do módulo
//  462             // Pagamentos
//  463             if(troco==valor)
??APLICACAO_devolve_troco_10:
        CMP      R8,R4
        BNE.N    ??APLICACAO_devolve_troco_11
//  464               PAGAMENTOS_subtrai_valores(valor);  
        MOVS     R0,R4
          CFI FunCall PAGAMENTOS_subtrai_valores
        BL       PAGAMENTOS_subtrai_valores
        B.N      ??APLICACAO_devolve_troco_8
//  465             else{
//  466               PAGAMENTOS_subtrai_valores(troco);  
??APLICACAO_devolve_troco_11:
        MOV      R0,R8
          CFI FunCall PAGAMENTOS_subtrai_valores
        BL       PAGAMENTOS_subtrai_valores
//  467               valor-=troco;
        SUBS     R4,R4,R8
//  468             }
//  469         }
//  470       }
//  471       while(PAGAMENTOS_get_valor_acumulado());
??APLICACAO_devolve_troco_8:
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        CMP      R0,#+0
        BNE.N    ??APLICACAO_devolve_troco_5
//  472       
//  473     }
//  474   }        
//  475   
//  476   return 1;      
??APLICACAO_devolve_troco_2:
        MOVS     R0,#+1
        ADD      SP,SP,#+40
          CFI CFA R13+24
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock10
//  477 }
//  478 /***********************************************************************************
//  479 *       Descrição       :       Faz a verificação do POST
//  480 *       Parametros      :       nenhum
//  481 *       Retorno         :       nenhum
//  482 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function APLICACAO_verifica_post
        THUMB
//  483 unsigned char APLICACAO_verifica_post(void){
APLICACAO_verifica_post:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//  484   ePOST_RESULT post = POST_entry();
          CFI FunCall POST_entry
        BL       POST_entry
        MOVS     R4,R0
//  485   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R5,R0
//  486   
//  487   switch(post){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??APLICACAO_verifica_post_0
//  488     case POST_SUCESSO:
//  489          return 1;
        MOVS     R0,#+1
        B.N      ??APLICACAO_verifica_post_1
//  490     case POST_FALHA_VENTILADOR:
//  491     case POST_FALHA_RESISTENCIA:
//  492     case POST_FALHA_MDB_BILL:
//  493     case POST_FALHA_MDB_COIN:
//  494     case POST_FALHA_MDB_CASHLESS:
//  495     case POST_FALHA_CCTALK:
//  496     case POST_FALHA_PAPEL:
//  497     default:
//  498          switch(post){
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
//  499            case POST_FALHA_VENTILADOR:
//  500                 STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E0:MOTOR AR");                                    
??APLICACAO_verifica_post_2:
        LDR.W    R2,??DataTable14_19
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_14
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  501                 break;
        B.N      ??APLICACAO_verifica_post_3
//  502            case POST_FALHA_RESISTENCIA:
//  503                 STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E1:AQUECIMENTO");                
??APLICACAO_verifica_post_5:
        LDR.W    R2,??DataTable14_15
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_14
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  504                 break;
        B.N      ??APLICACAO_verifica_post_3
//  505            case POST_FALHA_MDB_BILL:
//  506                 break;
??APLICACAO_verifica_post_4:
        B.N      ??APLICACAO_verifica_post_3
//  507            case POST_FALHA_MDB_COIN:
//  508                 break;
??APLICACAO_verifica_post_7:
        B.N      ??APLICACAO_verifica_post_3
//  509            case POST_FALHA_MDB_CASHLESS:
//  510                 break;
??APLICACAO_verifica_post_6:
        B.N      ??APLICACAO_verifica_post_3
//  511            case POST_FALHA_CCTALK:
//  512                 break;
??APLICACAO_verifica_post_9:
        B.N      ??APLICACAO_verifica_post_3
//  513            case POST_FALHA_PAPEL:   
//  514                 STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_fora_servico[idioma],"E3:EMBALAGEM");              
??APLICACAO_verifica_post_8:
        LDR.W    R2,??DataTable14_17
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R0,??DataTable14_14
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  515                 break;
//  516          }         
//  517          
//  518          PAGAMENTOS_set_bloqueio(1); // Bloqueia os meios de pagamento
??APLICACAO_verifica_post_3:
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  519          BOARD_liga_placa_instrucao(LED_FORA_SERVICO);
        MOVS     R0,#+6
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  520          
//  521          for(;;){
//  522            eTECLA tecla;
//  523            
//  524            tecla = TECLADO_getch();
??APLICACAO_verifica_post_10:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R6,R0
//  525            
//  526            switch(tecla){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BEQ.N    ??APLICACAO_verifica_post_11
        BCC.N    ??APLICACAO_verifica_post_12
        CMP      R6,#+3
        BEQ.N    ??APLICACAO_verifica_post_13
        BCC.N    ??APLICACAO_verifica_post_14
        CMP      R6,#+4
        BNE.N    ??APLICACAO_verifica_post_12
//  527              case TECLA_ENTER:
//  528                   APLIACAO_wait_lcd();
??APLICACAO_verifica_post_15:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  529                   BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  530                   MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  531                   BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  532                   idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R5,R0
//  533                   APLICACAO_release_lcd();  
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  534            
//  535                   STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);               
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  536                   break;
        B.N      ??APLICACAO_verifica_post_12
//  537              case TECLA_ESC:
//  538                   break;
??APLICACAO_verifica_post_11:
        B.N      ??APLICACAO_verifica_post_12
//  539              case TECLA_INC:
//  540                   break;
??APLICACAO_verifica_post_14:
        B.N      ??APLICACAO_verifica_post_12
//  541              case TECLA_DEC: 
//  542                   break;
//  543            }
//  544            
//  545            APLICACAO_tela_descanso();
??APLICACAO_verifica_post_13:
??APLICACAO_verifica_post_12:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
        B.N      ??APLICACAO_verifica_post_10
//  546          }       
//  547   }
??APLICACAO_verifica_post_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock11
//  548 }
//  549 /***********************************************************************************
//  550 *       Descrição       :       Faz a verificação de troco para o primeiro
//  551 *                               processo
//  552 *       Parametros      :       nenhum
//  553 *       Retorno         :       (unsigned char) maior do que zero
//  554 *                               se houver troco suficiente
//  555 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function APLICACAO_verifica_disponibilidade_troco
        THUMB
//  556 void APLICACAO_verifica_disponibilidade_troco(unsigned char idioma){
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
//  557   unsigned char flag_notas;
//  558   unsigned int maior_nota=0;
        MOVS     R5,#+0
//  559   eTECLA tecla;
//  560   
//  561   PARAMETROS_le(ADR_NOTAS,(void*)&flag_notas);
        ADD      R1,SP,#+0
        MOVS     R0,#+2
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  562   if(flag_notas&0x01)
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_0
//  563     maior_nota = 100;
        MOVS     R0,#+100
        MOVS     R5,R0
//  564   if(flag_notas&0x02)
??APLICACAO_verifica_disponibilidade_troco_0:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_1
//  565     maior_nota = 200;
        MOVS     R0,#+200
        MOVS     R5,R0
//  566   if(flag_notas&0x04)
??APLICACAO_verifica_disponibilidade_troco_1:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_2
//  567     maior_nota = 500;
        MOV      R0,#+500
        MOVS     R5,R0
//  568   if(flag_notas&0x08)
??APLICACAO_verifica_disponibilidade_troco_2:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+28
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_3
//  569     maior_nota = 1000;
        MOV      R0,#+1000
        MOVS     R5,R0
//  570   if(flag_notas&0x10)
??APLICACAO_verifica_disponibilidade_troco_3:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??APLICACAO_verifica_disponibilidade_troco_4
//  571     maior_nota = 2000;
        MOV      R0,#+2000
        MOVS     R5,R0
//  572   /*
//  573   if(flag_notas&0x20)
//  574     maior_nota = 5000;
//  575   */
//  576   
//  577   if( APLICACACAO_verifica_troco()<maior_nota){
??APLICACAO_verifica_disponibilidade_troco_4:
          CFI FunCall APLICACACAO_verifica_troco
        BL       APLICACACAO_verifica_troco
        CMP      R0,R5
        BCS.N    ??APLICACAO_verifica_disponibilidade_troco_5
//  578     
//  579     BOARD_setter_led_instrucao(LED_FORA_SERVICO,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+6
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  580     PAGAMENTOS_set_bloqueio(1);
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  581     STRING_write_to_external(CLEAR_DISPLAY,
//  582                              (char*)STRING_mensagem_sem_troco[idioma][0],
//  583                              (char*)STRING_mensagem_sem_troco[idioma][1]);    
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
//  584     
//  585     for(;APLICACACAO_verifica_troco()<maior_nota;){
??APLICACAO_verifica_disponibilidade_troco_6:
          CFI FunCall APLICACACAO_verifica_troco
        BL       APLICACACAO_verifica_troco
        CMP      R0,R5
        BCS.N    ??APLICACAO_verifica_disponibilidade_troco_7
//  586         
//  587       tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R6,R0
//  588       switch(tecla){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,R6
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_verifica_disponibilidade_troco_8
        CMP      R0,#+4
        BNE.N    ??APLICACAO_verifica_disponibilidade_troco_9
//  589         case TECLA_ENTER:
//  590             APLIACAO_wait_lcd();
??APLICACAO_verifica_disponibilidade_troco_10:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  591             BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  592             MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  593             BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  594             idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  595             APLICACAO_release_lcd();             
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  596             STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);        
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  597             break;
        B.N      ??APLICACAO_verifica_disponibilidade_troco_9
//  598         case TECLA_ESC:
//  599             break;
//  600       }    
//  601       
//  602       APLICACAO_tela_descanso();      
??APLICACAO_verifica_disponibilidade_troco_8:
??APLICACAO_verifica_disponibilidade_troco_9:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
        B.N      ??APLICACAO_verifica_disponibilidade_troco_6
//  603     }//Fim do for(;;)        
//  604     PAGAMENTOS_set_bloqueio(0);
??APLICACAO_verifica_disponibilidade_troco_7:
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//  605     BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  606     BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  607     BOARD_setter_led_instrucao(LED_INSIRA_DINHEIRO,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+2
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  608   }  
//  609 }
??APLICACAO_verifica_disponibilidade_troco_5:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock12
//  610 /***********************************************************************************
//  611 *       Descrição       :       Verifica o barramento MDB
//  612 *       Parametros      :       nenhum
//  613 *       Retorno         :       nenhum
//  614 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function APLICACAO_verifica_MDB
        THUMB
//  615 void APLICACAO_verifica_MDB(void){
APLICACAO_verifica_MDB:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  616   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  617   
//  618   switch(MDB_checa_dispositivos()){
          CFI FunCall MDB_checa_dispositivos
        BL       MDB_checa_dispositivos
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_MDB_0
        CMP      R0,#+2
        BEQ.N    ??APLICACAO_verifica_MDB_1
        BCC.N    ??APLICACAO_verifica_MDB_2
        B.N      ??APLICACAO_verifica_MDB_3
//  619     case MDB_TODOS_ONLINE:            
//  620          return;
??APLICACAO_verifica_MDB_0:
        B.N      ??APLICACAO_verifica_MDB_4
//  621     case MDB_BILL_OFFLINE:
//  622          STRING_write_to_external(CLEAR_DISPLAY,
//  623                                   (char*)STRING_mensagem_noteiro_mdb_offline[idioma][0],
//  624                                   (char*)STRING_mensagem_noteiro_mdb_offline[idioma][1]);          
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
//  625          break;
        B.N      ??APLICACAO_verifica_MDB_3
//  626     case MDB_COIN_OFFLINE:
//  627          STRING_write_to_external(CLEAR_DISPLAY,
//  628                                   (char*)STRING_mensagem_moedeiro_mdb_offline[idioma][0],
//  629                                   (char*)STRING_mensagem_moedeiro_mdb_offline[idioma][1]);           
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
//  630          break;
//  631   }  
//  632   
//  633   eTECLA tecla;
//  634   
//  635   for(;;){
//  636     
//  637     if(MDB_checa_dispositivos()==MDB_TODOS_ONLINE)
??APLICACAO_verifica_MDB_3:
??APLICACAO_verifica_MDB_5:
          CFI FunCall MDB_checa_dispositivos
        BL       MDB_checa_dispositivos
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_MDB_4
//  638       return;
//  639     
//  640     tecla = TECLADO_getch();
??APLICACAO_verifica_MDB_6:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R5,R0
//  641     switch(tecla){
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_verifica_MDB_7
        CMP      R0,#+4
        BNE.N    ??APLICACAO_verifica_MDB_8
//  642       case TECLA_ENTER:
//  643             APLIACAO_wait_lcd();
??APLICACAO_verifica_MDB_9:
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  644             BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  645             MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  646             BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  647             idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  648             APLICACAO_release_lcd();             
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  649             STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);              
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  650            break;
        B.N      ??APLICACAO_verifica_MDB_8
//  651       case TECLA_ESC:
//  652            break;
//  653     }    
//  654     APLICACAO_tela_descanso();      
??APLICACAO_verifica_MDB_7:
??APLICACAO_verifica_MDB_8:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  655     vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??APLICACAO_verifica_MDB_5
//  656   }
??APLICACAO_verifica_MDB_4:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock13
//  657 }
//  658 /***********************************************************************************
//  659 *       Descrição       :       Faz a verificação do meio de pagamento
//  660 *                               CCTALK
//  661 *       Parametros      :       nenhum
//  662 *       Retorno         :       nenhum
//  663 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function APLICACAO_verifica_cctalk
        THUMB
//  664 void APLICACAO_verifica_cctalk(void){
APLICACAO_verifica_cctalk:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
//  665   unsigned char flag;
//  666   
//  667   PARAMETROS_le(ADR_FLAG_BV20,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  668   
//  669   if(!flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verifica_cctalk_0
//  670     return;  
//  671   
//  672   eIDIOMA idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
??APLICACAO_verifica_cctalk_1:
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  673   eBV20_state estado_atual = BV20_get_current_state();
          CFI FunCall BV20_get_current_state
        BL       BV20_get_current_state
        MOVS     R5,R0
//  674   
//  675   if(estado_atual!=BV20_OFFLINE)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+3
        BNE.N    ??APLICACAO_verifica_cctalk_0
//  676     return;
//  677   
//  678   STRING_write_to_external(CLEAR_DISPLAY,
//  679                            (char*)STRING_mensagem_cctalk_offline[idioma][0],
//  680                            (char*)STRING_mensagem_cctalk_offline[idioma][1]);       
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
//  681     
//  682   eTECLA tecla;
//  683   
//  684   for(;;){
//  685     
//  686     estado_atual = BV20_get_current_state();
??APLICACAO_verifica_cctalk_3:
          CFI FunCall BV20_get_current_state
        BL       BV20_get_current_state
        MOVS     R5,R0
//  687     
//  688     if(estado_atual!=BV20_OFFLINE)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+3
        BNE.N    ??APLICACAO_verifica_cctalk_0
//  689       return;
//  690     
//  691     tecla = TECLADO_getch();
??APLICACAO_verifica_cctalk_4:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R6,R0
//  692     switch(tecla){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,R6
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_verifica_cctalk_5
        CMP      R0,#+4
        BNE.N    ??APLICACAO_verifica_cctalk_6
//  693       case TECLA_ENTER:
//  694             BOARD_reset_tempo_propaganda();
??APLICACAO_verifica_cctalk_7:
          CFI FunCall BOARD_reset_tempo_propaganda
        BL       BOARD_reset_tempo_propaganda
//  695             APLIACAO_wait_lcd();
          CFI FunCall APLIACAO_wait_lcd
        BL       APLIACAO_wait_lcd
//  696             BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  697             MCFG_entry();                     
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  698             BOARD_liga_placa_instrucao(1);
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  699             idioma  = (eIDIOMA)APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  700             APLICACAO_release_lcd();             
          CFI FunCall APLICACAO_release_lcd
        BL       APLICACAO_release_lcd
//  701             STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);              
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  702             BOARD_reset_tempo_propaganda();
          CFI FunCall BOARD_reset_tempo_propaganda
        BL       BOARD_reset_tempo_propaganda
//  703            break;
        B.N      ??APLICACAO_verifica_cctalk_6
//  704       case TECLA_ESC:
//  705            break;
//  706     }    
//  707     APLICACAO_tela_descanso();      
??APLICACAO_verifica_cctalk_5:
??APLICACAO_verifica_cctalk_6:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  708     vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??APLICACAO_verifica_cctalk_3
//  709   }    
??APLICACAO_verifica_cctalk_0:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock14
//  710 }
//  711 /***********************************************************************************
//  712 *       Descrição       :       Faz a verificação cíclica dos sinais 
//  713 *                               do papel e do termistor
//  714 *       Parametros      :       nenhum
//  715 *       Retorno         :       nenhum
//  716 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function APLICACAO_verificao_ciclica
        THUMB
//  717 void APLICACAO_verificao_ciclica(void){
APLICACAO_verificao_ciclica:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  718   
//  719   switch(POST_verificacao_ciclica()){
          CFI FunCall POST_verificacao_ciclica
        BL       POST_verificacao_ciclica
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_verificao_ciclica_0
        CMP      R0,#+2
        BEQ.N    ??APLICACAO_verificao_ciclica_1
        BCC.N    ??APLICACAO_verificao_ciclica_2
        B.N      ??APLICACAO_verificao_ciclica_3
//  720    case POST_CICLICO_SUCESSO:
//  721         break;
??APLICACAO_verificao_ciclica_0:
        B.N      ??APLICACAO_verificao_ciclica_3
//  722    case POST_CICLICO_FALHA_EMBALAGEM:
//  723         STRING_write_to_external(CLEAR_DISPLAY,"E03:FALTA","EMBALAGEM");
??APLICACAO_verificao_ciclica_2:
        LDR.N    R2,??DataTable14_24
        LDR.N    R1,??DataTable14_25
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  724         APLICACAO_loop_falha_ciclica();
          CFI FunCall APLICACAO_loop_falha_ciclica
        BL       APLICACAO_loop_falha_ciclica
//  725         break;
        B.N      ??APLICACAO_verificao_ciclica_3
//  726    case POST_CICLICO_FALHA_TERMISTOR:
//  727         STRING_write_to_external(CLEAR_DISPLAY,"E04:FALHA","SENS. TEMP.");
??APLICACAO_verificao_ciclica_1:
        LDR.N    R2,??DataTable14_26
        LDR.N    R1,??DataTable14_27
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  728         APLICACAO_loop_falha_ciclica();
          CFI FunCall APLICACAO_loop_falha_ciclica
        BL       APLICACAO_loop_falha_ciclica
//  729         break;
//  730   }  
//  731 }
??APLICACAO_verificao_ciclica_3:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock15
//  732 /***********************************************************************************
//  733 *       Descrição       :       Menu do loop onde há a falha no sensor de
//  734 *                               temperatura ou falta de embalagem
//  735 *       Parametros      :       nenhum
//  736 *       Retorno         :       nenhum
//  737 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function APLICACAO_loop_falha_ciclica
        THUMB
//  738 void APLICACAO_loop_falha_ciclica(void){
APLICACAO_loop_falha_ciclica:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  739   eTECLA tecla;
//  740   unsigned char loop=1;
        MOVS     R5,#+1
//  741     
//  742   for(;loop;){
??APLICACAO_loop_falha_ciclica_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??APLICACAO_loop_falha_ciclica_1
//  743     
//  744     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R4,R0
//  745     switch(tecla){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        CMP      R0,#+1
        BEQ.N    ??APLICACAO_loop_falha_ciclica_2
        CMP      R0,#+4
        BNE.N    ??APLICACAO_loop_falha_ciclica_3
//  746       case TECLA_ENTER:
//  747           MCFG_entry();                     
??APLICACAO_loop_falha_ciclica_4:
          CFI FunCall MCFG_entry
        BL       MCFG_entry
//  748            break;
        B.N      ??APLICACAO_loop_falha_ciclica_3
//  749       case TECLA_ESC:
//  750            loop = 0;
??APLICACAO_loop_falha_ciclica_2:
        MOVS     R0,#+0
        MOVS     R5,R0
//  751            break;
//  752     }      
//  753     
//  754     APLICACAO_tela_descanso();    
??APLICACAO_loop_falha_ciclica_3:
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
        B.N      ??APLICACAO_loop_falha_ciclica_0
//  755   }  
//  756   
//  757   STRING_write_to_internal(CLEAR_DISPLAY,"REINICIANDO","VERIFICACAO");
??APLICACAO_loop_falha_ciclica_1:
        LDR.N    R2,??DataTable14_28
        LDR.N    R1,??DataTable14_29
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  758   vTaskDelay(3000);  
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  759 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock16
//  760 /***********************************************************************************
//  761 *       Descrição       :       Ciclo de desumidificação da máquina
//  762 *       Parametros      :       nenhum
//  763 *       Retorno         :       nenhum
//  764 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function APLICACAO_ciclo_desumidificador
        THUMB
//  765 void APLICACAO_ciclo_desumidificador(unsigned char flag){
APLICACAO_ciclo_desumidificador:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  766   
//  767   if(flag && !APLICACAO_tempo_desumidificador){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??APLICACAO_ciclo_desumidificador_0
        LDR.N    R0,??DataTable14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??APLICACAO_ciclo_desumidificador_0
//  768     
//  769     unsigned int tempo=30000;
        MOVW     R5,#+30000
//  770     
//  771     STRING_write_to_internal(CLEAR_DISPLAY,"CICLO DE","DESUMIDIFICACAO");
        LDR.N    R2,??DataTable14_30
        LDR.N    R1,??DataTable14_31
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  772     STRING_write_to_external(CLEAR_DISPLAY,"CICLO DE","DESUMIDIFICACAO");
        LDR.N    R2,??DataTable14_30
        LDR.N    R1,??DataTable14_31
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  773     
//  774     POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  775     POTENCIA_setRPM(6000);
        MOVW     R0,#+6000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  776     CT_set_temperatura(60);
        MOVS     R0,#+60
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  777     vTaskDelay(3000);
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  778     
//  779     while(tempo--){
??APLICACAO_ciclo_desumidificador_1:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        CMP      R0,#+0
        BEQ.N    ??APLICACAO_ciclo_desumidificador_2
//  780       
//  781       if(POTENCIA_getRPMmedido()<1000){
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        CMP      R0,#+1000
        BCS.N    ??APLICACAO_ciclo_desumidificador_3
//  782         CT_set_temperatura(0);
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  783         POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  784         POTENCIA_set_neutro(0);        
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  785         return;
        B.N      ??APLICACAO_ciclo_desumidificador_4
//  786       }
//  787       vTaskDelay(1);
??APLICACAO_ciclo_desumidificador_3:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??APLICACAO_ciclo_desumidificador_1
//  788     }
//  789     
//  790     CT_set_temperatura(0);
??APLICACAO_ciclo_desumidificador_2:
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  791     POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  792     POTENCIA_set_neutro(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  793     APLICACAO_verifica_post();
          CFI FunCall APLICACAO_verifica_post
        BL       APLICACAO_verifica_post
//  794     APLICACAO_tempo_desumidificador = TEMPO_DESUMIDIFICADOR;
        LDR.N    R0,??DataTable14
        LDR.N    R1,??DataTable14_1  ;; 0x1b7740
        STR      R1,[R0, #+0]
//  795   }
//  796 }
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
//  797 /***********************************************************************************
//  798 *       Fim do arquivo
//  799 ***********************************************************************************/
// 
//    25 bytes in section .bss
//     4 bytes in section .data
//   212 bytes in section .rodata
// 2 672 bytes in section .text
// 
// 2 672 bytes of CODE  memory
//   212 bytes of CONST memory
//    29 bytes of DATA  memory
//
//Errors: none
//Warnings: none
