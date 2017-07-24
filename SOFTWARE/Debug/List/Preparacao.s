///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     24/Jul/2017  16:53:37 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\Preparacao.c                  /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\Preparacao.c -lC              /
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
//                    pocaG2\SOFTWARE\Debug\List\Preparacao.s                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Preparacao

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", "flags,widths"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN AA_calculaTemperatura
        EXTERN APLICACAO_tela_descanso
        EXTERN BOARD_get_sinal
        EXTERN BOARD_liga_placa_instrucao
        EXTERN BOARD_set_motor_dose
        EXTERN BOARD_setter_led_instrucao
        EXTERN CT_set_temperatura
        EXTERN EMBALAGEM_libera_pacote
        EXTERN FATURAMENTO_add_arrecadacao_parcial
        EXTERN FATURAMENTO_add_arrecadacao_total
        EXTERN FATURAMENTO_add_contagem_parcial
        EXTERN FATURAMENTO_add_contagem_total
        EXTERN FATURAMENTO_inc_contador_pipocas_teste
        EXTERN PAGAMENTOS_set_bloqueio
        EXTERN PARAMETROS_le
        EXTERN PLAYERWAVE_iniciaMusica
        EXTERN PLAYERWAVE_verificaToque
        EXTERN PLAYER_interrompeMusica
        EXTERN POTENCIA_getRPMmedido
        EXTERN POTENCIA_setRPM
        EXTERN POTENCIA_set_neutro
        EXTERN STRING_mensagem_inicio_preparacao
        EXTERN STRING_mensagem_limpeza
        EXTERN STRING_mensagem_limpeza_inicial
        EXTERN STRING_mensagem_pipocas_prontas
        EXTERN STRING_mensagem_resfriando
        EXTERN STRING_write_to_external
        EXTERN STRING_write_to_internal
        EXTERN sprintf
        EXTERN vTaskDelay

        PUBLIC PREPARACAO_atualiza_info_tempo
        PUBLIC PREPARACAO_cnt_preparo
        PUBLIC PREPARACAO_cnt_rampa
        PUBLIC PREPARACAO_compensador
        PUBLIC PREPARACAO_contador_compensacao
        PUBLIC PREPARACAO_dosagem_milho
        PUBLIC PREPARACAO_entry
        PUBLIC PREPARACAO_limpeza
        PUBLIC PREPARACAO_limpeza_inicial
        PUBLIC PREPARACAO_resfriamento
        PUBLIC PREPARACAO_tela_interna
        PUBLIC PREPARACAO_verificaVentilador
        PUBLIC PREPARACAO_verifica_resistencia
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Aplicacao\Preparacao.c
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
//   17 |       Arquivo            :  Preparacao.c
//   18 |       Descrição          :  Interface para a preparação da pipoca
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  22/04/2017
//   22 |
//   23 |       Revisões           :  001
//   24 |
//   25 |                             (22/04/2017) Criado módulo que faz a preparação
//   26 |                             da pipoca - Marcos
//   27 |                    
//   28 |
//   29 |
//   30 | __________________________________________________________________________________
//   31 */
//   32 
//   33 /**********************************************************************************
//   34 *       Includes
//   35 **********************************************************************************/
//   36 #include <stdio.h>
//   37 #include <stdlib.h>
//   38 #include <string.h>
//   39 #include "..\includes.h"
//   40 
//   41 /**********************************************************************************
//   42 *       Definições locais
//   43 **********************************************************************************/
//   44 #define TEMPO_PREPARO                   80*1000
//   45 #define TEMPO_ABRIR_PACOTE              50*1000
//   46 #define TEMPO_RAMPA                     3000
//   47 #define THRESOLD_RESFRIAMENTO           1
//   48 #define RELOAD_COMPENSADOR              5*60000 // 5 minutos
//   49 /**********************************************************************************
//   50 *       Constantes
//   51 **********************************************************************************/
//   52 
//   53 
//   54 /**********************************************************************************
//   55 *       Variaveis locais
//   56 **********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   57 unsigned int PREPARACAO_cnt_preparo=0;
PREPARACAO_cnt_preparo:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   58 unsigned int PREPARACAO_cnt_rampa=0;
PREPARACAO_cnt_rampa:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   59 unsigned int PREPARACAO_contador_compensacao=0;
PREPARACAO_contador_compensacao:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   60 unsigned int PREPARACAO_compensador=0;
PREPARACAO_compensador:
        DS8 4
//   61 
//   62 /**********************************************************************************
//   63 *       Funções locais
//   64 **********************************************************************************/
//   65 void PREPARACAO_atualiza_info_tempo(unsigned char idioma,unsigned int tempo);
//   66 unsigned char PREPARACAO_verificaVentilador(void);
//   67 unsigned char PREPARACAO_verifica_resistencia(void);
//   68 void PREPARACAO_tela_interna(void);
//   69 unsigned char PREPARACAO_dosagem_milho(void);
//   70 void PREPARACAO_resfriamento(unsigned char idioma);
//   71 
//   72 /**********************************************************************************
//   73 *       Implementação das funções
//   74 **********************************************************************************/
//   75 
//   76 /**********************************************************************************
//   77 *       Descrição       :       Ponto de entrada do menu da interface para
//   78 *                               preparação das pipocas
//   79 *       Parametros      :       nenhum
//   80 *       Retorno         :       nenhum
//   81 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function PREPARACAO_entry
        THUMB
//   82 ePREPARACAO_RESULT PREPARACAO_entry(unsigned int *ajuste_out,
//   83                                     eCONTABILIZAR contabiliza){
PREPARACAO_entry:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+24
          CFI CFA R13+40
        MOVS     R4,R1
//   84   unsigned int temperatura_processo;
//   85   unsigned int velocidade_processo;
//   86   unsigned int tempo_embalagem;
//   87   unsigned char idioma;
//   88   unsigned char delta=0;
        MOVS     R5,#+0
//   89   unsigned int valor_pipoca;
//   90   unsigned char flag_correcao_erro;
//   91   unsigned int compensador;
//   92   
//   93   PAGAMENTOS_set_bloqueio(1);
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//   94   
//   95   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
        ADD      R1,SP,#+0
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   96   PARAMETROS_le(ADR_TEMPERATURA_PREPARACAO,(void*)&temperatura_processo);
        ADD      R1,SP,#+4
        MOVS     R0,#+26
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   97   PARAMETROS_le(ADR_VELOCIDADE_PREPARACAO,(void*)&velocidade_processo);
        ADD      R1,SP,#+12
        MOVS     R0,#+27
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   98   PARAMETROS_le(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);
        ADD      R1,SP,#+16
        MOVS     R0,#+28
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   99   PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valor_pipoca);  
        ADD      R1,SP,#+20
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  100   PARAMETROS_le(ADR_COMPENSADOR_ERRO_ROTACAO,(void*)&flag_correcao_erro);    
        ADD      R1,SP,#+1
        MOVS     R0,#+44
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  101   PARAMETROS_le(ADR_FATOR_COMPENSADOR,(void*)&compensador);
        ADD      R1,SP,#+8
        MOVS     R0,#+45
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  102 
//  103   //-----------------------------------------------
//  104   // Por falta de testes, deixei esse trecho abaixo
//  105   // para garantir que funcionará mesmo que ocorra
//  106   // uma falha na leitura da memória flash externa
//  107   // Faz a consistência dos parametros
//  108   //**********************************************
//  109   if(temperatura_processo>170)
        LDR      R0,[SP, #+4]
        CMP      R0,#+171
        BCC.N    ??PREPARACAO_entry_0
//  110     temperatura_processo = 85;
        MOVS     R0,#+85
        STR      R0,[SP, #+4]
//  111   if(velocidade_processo>8500)
??PREPARACAO_entry_0:
        LDR      R0,[SP, #+12]
        MOVW     R1,#+8501
        CMP      R0,R1
        BCC.N    ??PREPARACAO_entry_1
//  112     velocidade_processo = 5700;
        MOVW     R0,#+5700
        STR      R0,[SP, #+12]
//  113   if(tempo_embalagem>10000 || !tempo_embalagem)
??PREPARACAO_entry_1:
        LDR      R0,[SP, #+16]
        MOVW     R1,#+10001
        CMP      R0,R1
        BCS.N    ??PREPARACAO_entry_2
        LDR      R0,[SP, #+16]
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_entry_3
//  114     tempo_embalagem = 4200;
??PREPARACAO_entry_2:
        MOVW     R0,#+4200
        STR      R0,[SP, #+16]
//  115   
//  116   BOARD_setter_led_instrucao(LED_INSIRA_DINHEIRO,ACESO);
??PREPARACAO_entry_3:
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  117        
//  118   if(!compensador)
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_entry_4
//  119     compensador=1;
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
//  120   if(compensador>3)
??PREPARACAO_entry_4:
        LDR      R0,[SP, #+8]
        CMP      R0,#+4
        BCC.N    ??PREPARACAO_entry_5
//  121     compensador=3;    
        MOVS     R0,#+3
        STR      R0,[SP, #+8]
//  122   
//  123   temperatura_processo += PREPARACAO_compensador;
??PREPARACAO_entry_5:
        LDR      R0,[SP, #+4]
        LDR.W    R1,??DataTable5
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        STR      R0,[SP, #+4]
//  124   
//  125   STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_inicio_preparacao[idioma][0],(char*)STRING_mensagem_inicio_preparacao[idioma][1]);
        LDRB     R0,[SP, #+0]
        LDR.W    R1,??DataTable5_1
        ADDS     R0,R1,R0, LSL #+3
        LDR      R2,[R0, #+4]
        LDRB     R0,[SP, #+0]
        LDR.W    R1,??DataTable5_1
        LDR      R1,[R1, R0, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  126   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_inicio_preparacao[idioma][0],(char*)STRING_mensagem_inicio_preparacao[idioma][1]);
        LDRB     R0,[SP, #+0]
        LDR.W    R1,??DataTable5_1
        ADDS     R0,R1,R0, LSL #+3
        LDR      R2,[R0, #+4]
        LDRB     R0,[SP, #+0]
        LDR.W    R1,??DataTable5_1
        LDR      R1,[R1, R0, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  127   
//  128   // Inicializa o PID de controle
//  129   // da rotação do motor
//  130   POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  131   vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  132   if(flag_correcao_erro)
        LDRB     R0,[SP, #+1]
        CMP      R0,#+0
        BEQ.N    ??PREPARACAO_entry_6
//  133     POTENCIA_setRPM(2500);
        MOVW     R0,#+2500
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
        B.N      ??PREPARACAO_entry_7
//  134   else
//  135     POTENCIA_setRPM(4000);
??PREPARACAO_entry_6:
        MOV      R0,#+4000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  136 
//  137   PREPARACAO_cnt_preparo = TEMPO_PREPARO;  
??PREPARACAO_entry_7:
        LDR.W    R0,??DataTable5_2
        LDR.W    R1,??DataTable5_3  ;; 0x13880
        STR      R1,[R0, #+0]
//  138   // Faz a verificação do ventilador
//  139   if(!PREPARACAO_verificaVentilador()){
          CFI FunCall PREPARACAO_verificaVentilador
        BL       PREPARACAO_verificaVentilador
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_entry_8
//  140     // Se não detectar o giro
//  141     // desliga a parte de alta-tensão
//  142     // e sinaliza o erro
//  143     POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  144     POTENCIA_set_neutro(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  145     return FALHA_VENTILADOR;
        MOVS     R0,#+1
        B.N      ??PREPARACAO_entry_9
//  146   }
//  147     
//  148   // Inicia o controlador de temperatura
//  149   CT_set_temperatura(temperatura_processo);
??PREPARACAO_entry_8:
        LDR      R0,[SP, #+4]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  150   
//  151   // Aguarda até a temperatura de início de processo
//  152   // chegar ao valor da inicial
//  153   unsigned int timeout=60000;
        MOVW     R6,#+60000
        B.N      ??PREPARACAO_entry_10
//  154   //do vTaskDelay(1);
//  155   while(AA_calculaTemperatura()<temperatura_processo && --timeout){
//  156     vTaskDelay(1);
??PREPARACAO_entry_11:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  157     APLICACAO_tela_descanso();
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  158   }  
??PREPARACAO_entry_10:
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR      R1,[SP, #+4]
        CMP      R0,R1
        BCS.N    ??PREPARACAO_entry_12
        SUBS     R6,R6,#+1
        CMP      R6,#+0
        BNE.N    ??PREPARACAO_entry_11
//  159   
//  160   if(!timeout){
??PREPARACAO_entry_12:
        CMP      R6,#+0
        BNE.N    ??PREPARACAO_entry_13
//  161     POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  162     POTENCIA_set_neutro(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  163     CT_set_temperatura(0);
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  164     return FALHA_RESISTENCIA;   
        MOVS     R0,#+2
        B.N      ??PREPARACAO_entry_9
//  165   }  
//  166   
//  167   if(!PREPARACAO_dosagem_milho()){
??PREPARACAO_entry_13:
          CFI FunCall PREPARACAO_dosagem_milho
        BL       PREPARACAO_dosagem_milho
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_entry_14
//  168     POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  169     POTENCIA_set_neutro(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  170     CT_set_temperatura(0);
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  171     return FALHA_DOSE;     
        MOVS     R0,#+3
        B.N      ??PREPARACAO_entry_9
//  172   }
//  173   
//  174   POTENCIA_setRPM(velocidade_processo);
??PREPARACAO_entry_14:
        LDR      R0,[SP, #+12]
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  175   if(flag_correcao_erro)
        LDRB     R0,[SP, #+1]
        CMP      R0,#+0
        BEQ.N    ??PREPARACAO_entry_15
//  176     while(POTENCIA_getRPMmedido()<velocidade_processo);
??PREPARACAO_entry_16:
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        LDR      R1,[SP, #+12]
        CMP      R0,R1
        BCS.N    ??PREPARACAO_entry_17
        B.N      ??PREPARACAO_entry_16
//  177   else
//  178     while(POTENCIA_getRPMmedido()<(velocidade_processo-1000));
??PREPARACAO_entry_15:
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        LDR      R1,[SP, #+12]
        SUBS     R1,R1,#+1000
        CMP      R0,R1
        BCC.N    ??PREPARACAO_entry_15
//  179   
//  180   BOARD_setter_led_instrucao(LED_PEGUE_PACOTE,PISCANDO); // Indica na plac ade instrução para pegar a embalagem
??PREPARACAO_entry_17:
        MOVS     R1,#+2
        MOVS     R0,#+3
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  181   //if(
//  182   EMBALAGEM_libera_pacote(tempo_embalagem);//!=EMBALAGEM_LIBERADA);
        LDR      R0,[SP, #+16]
          CFI FunCall EMBALAGEM_libera_pacote
        BL       EMBALAGEM_libera_pacote
//  183   //  POTENCIA_setRPM(0);
//  184   //  POTENCIA_set_neutro(0);
//  185   //  CT_set_temperatura(0);    
//  186   //  return FALHA_EMBALAGEM;
//  187   //}    
//  188   
//  189   PLAYERWAVE_iniciaMusica(AUDIO_PEGA_PACOTE,0);
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall PLAYERWAVE_iniciaMusica
        BL       PLAYERWAVE_iniciaMusica
//  190   while(PLAYERWAVE_verificaToque());
??PREPARACAO_entry_18:
          CFI FunCall PLAYERWAVE_verificaToque
        BL       PLAYERWAVE_verificaToque
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_entry_18
//  191  
//  192   STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  193   STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  194   PREPARACAO_cnt_rampa = TEMPO_RAMPA;
        LDR.N    R0,??DataTable5_4
        MOVW     R1,#+3000
        STR      R1,[R0, #+0]
//  195   PREPARACAO_cnt_preparo = TEMPO_PREPARO;
        LDR.N    R0,??DataTable5_2
        LDR.N    R1,??DataTable5_3  ;; 0x13880
        STR      R1,[R0, #+0]
//  196   
//  197   PLAYERWAVE_iniciaMusica(MUSICA_PREPARO,0);
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall PLAYERWAVE_iniciaMusica
        BL       PLAYERWAVE_iniciaMusica
        B.N      ??PREPARACAO_entry_19
//  198   //while(PLAYERWAVE_verificaToque());
//  199   
//  200   // Loop de preparação da pipoca
//  201   for(;PREPARACAO_cnt_preparo;){
//  202     
//  203     PREPARACAO_atualiza_info_tempo(idioma,PREPARACAO_cnt_preparo);    
//  204     PREPARACAO_tela_interna();
//  205     
//  206     // Falha no motor do ventilador
//  207     if(POTENCIA_getRPMmedido()<1000){
//  208       POTENCIA_setRPM(0);
//  209       POTENCIA_set_neutro(0);
//  210       CT_set_temperatura(0);   
//  211       return FALHA_VENTILADOR;
//  212     }
//  213         
//  214     // Gera a rampa de aquecimento
//  215     // na preparação da pipoca
//  216     if(!PREPARACAO_cnt_rampa){
//  217       //temperatura_processo;
//  218       if(delta<20)
//  219         delta++;
//  220       CT_set_temperatura(temperatura_processo+delta);
//  221       PREPARACAO_cnt_rampa = TEMPO_RAMPA;
//  222     }
//  223     
//  224     // Controle da placa de instrução
//  225     // do usuário
//  226     if(PREPARACAO_cnt_preparo>TEMPO_ABRIR_PACOTE){
//  227        BOARD_setter_led_instrucao(LED_PEGUE_PACOTE,ACESO);
??PREPARACAO_entry_20:
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  228        BOARD_setter_led_instrucao(LED_MONTE_PACOTE,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+4
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  229     }
??PREPARACAO_entry_19:
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PREPARACAO_entry_21
        LDR.N    R0,??DataTable5_2
        LDR      R1,[R0, #+0]
        LDRB     R0,[SP, #+0]
          CFI FunCall PREPARACAO_atualiza_info_tempo
        BL       PREPARACAO_atualiza_info_tempo
          CFI FunCall PREPARACAO_tela_interna
        BL       PREPARACAO_tela_interna
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        CMP      R0,#+1000
        BCS.N    ??PREPARACAO_entry_22
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
        MOVS     R0,#+1
        B.N      ??PREPARACAO_entry_9
??PREPARACAO_entry_22:
        LDR.N    R0,??DataTable5_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_entry_23
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+20
        BGE.N    ??PREPARACAO_entry_24
        ADDS     R5,R5,#+1
??PREPARACAO_entry_24:
        LDR      R0,[SP, #+4]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
        LDR.N    R0,??DataTable5_4
        MOVW     R1,#+3000
        STR      R1,[R0, #+0]
??PREPARACAO_entry_23:
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        MOVW     R1,#+50001
        CMP      R0,R1
        BCS.N    ??PREPARACAO_entry_20
//  230     else{
//  231        BOARD_setter_led_instrucao(LED_MONTE_PACOTE,ACESO);        
        MOVS     R1,#+1
        MOVS     R0,#+4
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  232        BOARD_setter_led_instrucao(LED_INSIRA_PACOTE,PISCANDO);         
        MOVS     R1,#+2
        MOVS     R0,#+5
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
        B.N      ??PREPARACAO_entry_19
//  233     }
//  234   }  
//  235   
//  236   BOARD_setter_led_instrucao(LED_INSIRA_PACOTE,ACESO);
??PREPARACAO_entry_21:
        MOVS     R1,#+1
        MOVS     R0,#+5
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  237       
//  238   // Desliga os controles
//  239   // da potência
//  240   POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  241   POTENCIA_set_neutro(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  242   CT_set_temperatura(0);
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  243   
//  244   PREPARACAO_limpeza(idioma);
        LDRB     R0,[SP, #+0]
          CFI FunCall PREPARACAO_limpeza
        BL       PREPARACAO_limpeza
//  245   
//  246   PLAYER_interrompeMusica();
          CFI FunCall PLAYER_interrompeMusica
        BL       PLAYER_interrompeMusica
//  247   vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  248   PLAYERWAVE_iniciaMusica(AUDIO_PIPOCAS_PRONTAS,0);
        MOVS     R1,#+0
        MOVS     R0,#+2
          CFI FunCall PLAYERWAVE_iniciaMusica
        BL       PLAYERWAVE_iniciaMusica
//  249   while(PLAYERWAVE_verificaToque());  
??PREPARACAO_entry_25:
          CFI FunCall PLAYERWAVE_verificaToque
        BL       PLAYERWAVE_verificaToque
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_entry_25
//  250   vTaskDelay(500); 
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  251   //-----------------------------------------------
//  252   // Local para inserção dos dados no faturamento
//  253   // e liberação do troco
//  254   //-----------------------------------------------
//  255   if(contabiliza==CONTABILIZA){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??PREPARACAO_entry_26
//  256     // Só contabiliza as unidades vendidadas
//  257     // quando houver necessidade
//  258     FATURAMENTO_add_contagem_parcial(1);
        MOVS     R0,#+1
          CFI FunCall FATURAMENTO_add_contagem_parcial
        BL       FATURAMENTO_add_contagem_parcial
//  259     FATURAMENTO_add_arrecadacao_parcial(valor_pipoca);
        LDR      R0,[SP, #+20]
          CFI FunCall FATURAMENTO_add_arrecadacao_parcial
        BL       FATURAMENTO_add_arrecadacao_parcial
//  260     FATURAMENTO_add_contagem_total(1);
        MOVS     R0,#+1
          CFI FunCall FATURAMENTO_add_contagem_total
        BL       FATURAMENTO_add_contagem_total
//  261     FATURAMENTO_add_arrecadacao_total(valor_pipoca);
        LDR      R0,[SP, #+20]
          CFI FunCall FATURAMENTO_add_arrecadacao_total
        BL       FATURAMENTO_add_arrecadacao_total
        B.N      ??PREPARACAO_entry_27
//  262   }
//  263   else
//  264     FATURAMENTO_inc_contador_pipocas_teste();  
??PREPARACAO_entry_26:
          CFI FunCall FATURAMENTO_inc_contador_pipocas_teste
        BL       FATURAMENTO_inc_contador_pipocas_teste
//  265  
//  266   //----------------------------------------------
//  267   // Fim da coleta dos dados de faturamento
//  268   //----------------------------------------------    
//  269   //Faz o ajuste de compensação da panela
//  270   //unsigned int ajuste = AA_calculaTemperatura();
//  271   if(PREPARACAO_contador_compensacao){
??PREPARACAO_entry_27:
        LDR.N    R0,??DataTable5_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PREPARACAO_entry_28
//  272     if(PREPARACAO_compensador<=(5*compensador))
        LDR      R0,[SP, #+8]
        MOVS     R1,#+5
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable5
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BCC.N    ??PREPARACAO_entry_28
//  273       PREPARACAO_compensador+=compensador;
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R1,[SP, #+8]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable5
        STR      R0,[R1, #+0]
//  274   }  
//  275   PREPARACAO_contador_compensacao = RELOAD_COMPENSADOR;     
??PREPARACAO_entry_28:
        LDR.N    R0,??DataTable5_5
        LDR.N    R1,??DataTable5_6  ;; 0x493e0
        STR      R1,[R0, #+0]
//  276   BOARD_liga_placa_instrucao(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  277   BOARD_liga_placa_instrucao(1);    
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  278   
//  279   return SUCESSO;
        MOVS     R0,#+0
??PREPARACAO_entry_9:
        ADD      SP,SP,#+24
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock0
//  280 }
//  281 /**********************************************************************************
//  282 *       Descrição       :       Atualiza o display frontal com o tempo restante
//  283 *                               do processo de preparo
//  284 *       Parametros      :       nenhum
//  285 *       Retorno         :       nenhum
//  286 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PREPARACAO_atualiza_info_tempo
        THUMB
//  287 void PREPARACAO_atualiza_info_tempo(unsigned char idioma,unsigned int tempo){
PREPARACAO_atualiza_info_tempo:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
        MOVS     R4,R0
//  288   char buffer_linha[17];
//  289   unsigned int minutos;
//  290   unsigned int segundos;
//  291   
//  292   minutos  = PREPARACAO_cnt_preparo/1000;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        UDIV     R2,R0,R1
//  293   segundos = minutos % 60;
        MOVS     R0,#+60
        UDIV     R1,R2,R0
        MLS      R3,R0,R1,R2
//  294   minutos  = minutos/60;
        MOVS     R0,#+60
        UDIV     R2,R2,R0
//  295   
//  296   sprintf(buffer_linha,"  %01d:%02d  ",minutos,segundos);
        LDR.N    R1,??DataTable5_7
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  297   STRING_write_to_external(NO_CLEAR,(char*)STRING_mensagem_pipocas_prontas[idioma],buffer_linha);  
        ADD      R2,SP,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_8
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  298 }
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  299 /**********************************************************************************
//  300 *       Descrição       :       Verifica se o ventilador está funcionando
//  301 *       Parametros      :       nenhum
//  302 *       Retorno         :       (unsigned char) maior do que zero se conseguir
//  303 *                               detectar o RPM do motor
//  304 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PREPARACAO_verificaVentilador
        THUMB
//  305 unsigned char PREPARACAO_verificaVentilador(void){
PREPARACAO_verificaVentilador:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  306   unsigned short int tempo=50000;  
        MOVW     R4,#+50000
//  307   
//  308   do{
//  309     
//  310     if(POTENCIA_getRPMmedido()>1000)
??PREPARACAO_verificaVentilador_0:
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        CMP      R0,#+1000
        BLS.N    ??PREPARACAO_verificaVentilador_1
//  311       return 1;
        MOVS     R0,#+1
        B.N      ??PREPARACAO_verificaVentilador_2
//  312     else
//  313       vTaskDelay(1);
??PREPARACAO_verificaVentilador_1:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  314         
//  315   }
//  316   while(tempo--);
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_verificaVentilador_0
//  317   
//  318   return 0; 
        MOVS     R0,#+0
??PREPARACAO_verificaVentilador_2:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
//  319 }
//  320 /**********************************************************************************
//  321 *       Descrição       :       Faz a verificação do aquecimento da resistência
//  322 *       Parametros      :       nenhum
//  323 *       Retorno         :       (unsigned char) maior do que zero se 
//  324 *                               conseguir aquecer a panela 2 graus em até 5 segundos
//  325 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PREPARACAO_verifica_resistencia
        THUMB
//  326 unsigned char PREPARACAO_verifica_resistencia(void){
PREPARACAO_verifica_resistencia:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  327   unsigned int temperaturaInicial;
//  328   unsigned short int tempo = 15000;
        MOVW     R5,#+15000
//  329   
//  330   temperaturaInicial = AA_calculaTemperatura();
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        MOVS     R4,R0
//  331   
//  332   do{
//  333     
//  334     if(AA_calculaTemperatura()>(temperaturaInicial+2))
??PREPARACAO_verifica_resistencia_0:
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        ADDS     R1,R4,#+2
        CMP      R1,R0
        BCS.N    ??PREPARACAO_verifica_resistencia_1
//  335       return 1;
        MOVS     R0,#+1
        B.N      ??PREPARACAO_verifica_resistencia_2
//  336     else
//  337       vTaskDelay(1);
??PREPARACAO_verifica_resistencia_1:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  338     
//  339   }
//  340   while(tempo--);
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_verifica_resistencia_0
//  341   
//  342   return 0;  
        MOVS     R0,#+0
??PREPARACAO_verifica_resistencia_2:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock3
//  343 }
//  344 /**********************************************************************************
//  345 *       Descrição       :       Tela informativa do processo exibida
//  346 *                               no display interno
//  347 *       Parametros      :       nenhum
//  348 *       Retorno         :       nenhum
//  349 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PREPARACAO_tela_interna
        THUMB
//  350 void PREPARACAO_tela_interna(void){
PREPARACAO_tela_interna:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
//  351   char buffer_linha[17];
//  352   
//  353   sprintf(buffer_linha,"%05d RPM-%03doC",POTENCIA_getRPMmedido(),AA_calculaTemperatura());
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        MOVS     R4,R0
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R3,R4
        MOVS     R2,R0
        LDR.N    R1,??DataTable5_9
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  354   STRING_write_to_internal(NO_CLEAR,buffer_linha,NULL);
        MOVS     R2,#+0
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  355 }
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4
//  356 /**********************************************************************************
//  357 *       Descrição       :       Libera uma dose de milho na panela
//  358 *       Parametros      :       nenhum
//  359 *       Retorno         :       (unsigned char) maior do que zero
//  360 *                               se conseguir dosar
//  361 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function PREPARACAO_dosagem_milho
        THUMB
//  362 unsigned char PREPARACAO_dosagem_milho(void){
PREPARACAO_dosagem_milho:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  363   unsigned char sensor_dose; 
//  364   unsigned int tempo=2000; 
        MOV      R4,#+2000
//  365   
//  366   BOARD_set_motor_dose(DOSAR);
        MOVS     R0,#+1
          CFI FunCall BOARD_set_motor_dose
        BL       BOARD_set_motor_dose
        B.N      ??PREPARACAO_dosagem_milho_0
//  367   while(GET_SENSOR_DOSE() && tempo--)
//  368     vTaskDelay(1);
??PREPARACAO_dosagem_milho_1:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??PREPARACAO_dosagem_milho_0:
        MOVS     R0,#+2
          CFI FunCall BOARD_get_sinal
        BL       BOARD_get_sinal
        CMP      R0,#+0
        BEQ.N    ??PREPARACAO_dosagem_milho_2
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_dosagem_milho_1
//  369   
//  370   tempo = 15000;
??PREPARACAO_dosagem_milho_2:
        MOVW     R4,#+15000
//  371         
//  372   do{
//  373     
//  374     sensor_dose = GET_SENSOR_DOSE();  
??PREPARACAO_dosagem_milho_3:
        MOVS     R0,#+2
          CFI FunCall BOARD_get_sinal
        BL       BOARD_get_sinal
//  375     if(sensor_dose){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??PREPARACAO_dosagem_milho_4
//  376       BOARD_set_motor_dose(PARADO);
        MOVS     R0,#+0
          CFI FunCall BOARD_set_motor_dose
        BL       BOARD_set_motor_dose
//  377       return 1;
        MOVS     R0,#+1
        B.N      ??PREPARACAO_dosagem_milho_5
//  378     }
//  379     else
//  380       vTaskDelay(1);
??PREPARACAO_dosagem_milho_4:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  381     
//  382   }
//  383   while(tempo--);
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_dosagem_milho_3
//  384   
//  385   BOARD_set_motor_dose(PARADO);  
        MOVS     R0,#+0
          CFI FunCall BOARD_set_motor_dose
        BL       BOARD_set_motor_dose
//  386   //BOARD_set_motor_dose(DOSAR);          
//  387   //BOARD_set_motor_dose(REVERTER);
//  388   //BOARD_set_motor_dose(PARADO);
//  389   
//  390   return 0;
        MOVS     R0,#+0
??PREPARACAO_dosagem_milho_5:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
//  391 }
//  392 /**********************************************************************************
//  393 *       Descrição       :       Limpeza da panela e agradecimento pela
//  394 *                               compra
//  395 *       Parametros      :       nenhum
//  396 *       Retorno         :       nenhum
//  397 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function PREPARACAO_limpeza
        THUMB
//  398 void PREPARACAO_limpeza(unsigned char idioma){
PREPARACAO_limpeza:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  399   
//  400   POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  401   POTENCIA_setRPM(13000);
        MOVW     R0,#+13000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  402   
//  403   STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_limpeza[idioma][0],(char*)STRING_mensagem_limpeza[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_10
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_10
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  404   vTaskDelay(7000);
        MOVW     R0,#+7000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  405   
//  406   POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  407   POTENCIA_set_neutro(0);  
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  408 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock6
//  409 /**********************************************************************************
//  410 *       Descrição       :       Resfriamento do sistema
//  411 *       Parametros      :       nenhum
//  412 *       Retorno         :       nenhum
//  413 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function PREPARACAO_resfriamento
        THUMB
//  414 void PREPARACAO_resfriamento(unsigned char idioma){
PREPARACAO_resfriamento:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  415   
//  416   POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  417   vTaskDelay(500);  
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  418   POTENCIA_setRPM(6000);
        MOVW     R0,#+6000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  419   
//  420   STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_resfriando[idioma][0],
//  421                                          (char*)STRING_mensagem_resfriando[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_11
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_11
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  422   vTaskDelay(30000);
        MOVW     R0,#+30000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  423   
//  424   POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  425   POTENCIA_set_neutro(0);  
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  426 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock7
//  427 /**********************************************************************************
//  428 *       Descrição       :       Limpeza da panela e agradecimento pela
//  429 *                               compra
//  430 *       Parametros      :       nenhum
//  431 *       Retorno         :       nenhum
//  432 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function PREPARACAO_limpeza_inicial
        THUMB
//  433 void PREPARACAO_limpeza_inicial(unsigned char idioma){
PREPARACAO_limpeza_inicial:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  434   
//  435   POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  436   vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  437   POTENCIA_setRPM(12000);
        MOVW     R0,#+12000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  438   
//  439   STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_limpeza_inicial[idioma][0],(char*)STRING_mensagem_limpeza_inicial[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_12
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_12
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  440   vTaskDelay(7000);
        MOVW     R0,#+7000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  441   
//  442   POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  443   POTENCIA_set_neutro(0);  
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  444 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     PREPARACAO_compensador

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     STRING_mensagem_inicio_preparacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     PREPARACAO_cnt_preparo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x13880

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     PREPARACAO_cnt_rampa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     PREPARACAO_contador_compensacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x493e0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     `?<Constant "  %01d:%02d  ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     STRING_mensagem_pipocas_prontas

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     `?<Constant "%05d RPM-%03doC">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     STRING_mensagem_limpeza

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     STRING_mensagem_resfriando

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     STRING_mensagem_limpeza_inicial

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  %01d:%02d  ">`:
        DATA
        DC8 "  %01d:%02d  "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%05d RPM-%03doC">`:
        DATA
        DC8 "%05d RPM-%03doC"

        END
//  445 /**********************************************************************************
//  446 *       Fim do arquivo
//  447 **********************************************************************************/
//  448 
// 
//    16 bytes in section .bss
//    32 bytes in section .rodata
// 1 350 bytes in section .text
// 
// 1 350 bytes of CODE  memory
//    32 bytes of CONST memory
//    16 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
