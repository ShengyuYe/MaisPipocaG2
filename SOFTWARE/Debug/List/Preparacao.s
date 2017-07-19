///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     19/Jul/2017  15:31:41 /
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
//   48 #define RELOAD_COMPENSADOR              2*60000 // 5 minutos
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
//   90   
//   91   PAGAMENTOS_set_bloqueio(1);
        MOVS     R0,#+1
          CFI FunCall PAGAMENTOS_set_bloqueio
        BL       PAGAMENTOS_set_bloqueio
//   92   
//   93   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
        ADD      R1,SP,#+4
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   94   PARAMETROS_le(ADR_TEMPERATURA_PREPARACAO,(void*)&temperatura_processo);
        ADD      R1,SP,#+0
        MOVS     R0,#+26
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   95   PARAMETROS_le(ADR_VELOCIDADE_PREPARACAO,(void*)&velocidade_processo);
        ADD      R1,SP,#+12
        MOVS     R0,#+27
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   96   PARAMETROS_le(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);
        ADD      R1,SP,#+8
        MOVS     R0,#+28
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   97   PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valor_pipoca);  
        ADD      R1,SP,#+16
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   98 
//   99   //-----------------------------------------------
//  100   // Por falta de testes, deixei esse trecho abaixo
//  101   // para garantir que funcionará mesmo que ocorra
//  102   // uma falha na leitura da memória flash externa
//  103   // Faz a consistência dos parametros
//  104   //**********************************************
//  105   if(temperatura_processo>170)
        LDR      R0,[SP, #+0]
        CMP      R0,#+171
        BCC.N    ??PREPARACAO_entry_0
//  106     temperatura_processo = 85;
        MOVS     R0,#+85
        STR      R0,[SP, #+0]
//  107   if(velocidade_processo>8500)
??PREPARACAO_entry_0:
        LDR      R0,[SP, #+12]
        MOVW     R1,#+8501
        CMP      R0,R1
        BCC.N    ??PREPARACAO_entry_1
//  108     velocidade_processo = 5700;
        MOVW     R0,#+5700
        STR      R0,[SP, #+12]
//  109   if(tempo_embalagem>10000 || !tempo_embalagem)
??PREPARACAO_entry_1:
        LDR      R0,[SP, #+8]
        MOVW     R1,#+10001
        CMP      R0,R1
        BCS.N    ??PREPARACAO_entry_2
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_entry_3
//  110     tempo_embalagem = 4200;
??PREPARACAO_entry_2:
        MOVW     R0,#+4200
        STR      R0,[SP, #+8]
//  111   
//  112   BOARD_setter_led_instrucao(LED_INSIRA_DINHEIRO,ACESO);
??PREPARACAO_entry_3:
        MOVS     R1,#+1
        MOVS     R0,#+2
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  113        
//  114   //Faz o ajuste de compensação da panela
//  115   //unsigned int ajuste = AA_calculaTemperatura();
//  116   if(PREPARACAO_contador_compensacao){
        LDR.W    R0,??DataTable5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PREPARACAO_entry_4
//  117     if(PREPARACAO_compensador<5)
        LDR.W    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+5
        BCS.N    ??PREPARACAO_entry_4
//  118       PREPARACAO_compensador++;
        LDR.W    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  119   }
//  120   
//  121   PREPARACAO_contador_compensacao = RELOAD_COMPENSADOR;  
??PREPARACAO_entry_4:
        LDR.W    R0,??DataTable5
        LDR.W    R1,??DataTable5_2  ;; 0x1d4c0
        STR      R1,[R0, #+0]
//  122   
//  123   temperatura_processo += PREPARACAO_compensador;
        LDR      R0,[SP, #+0]
        LDR.W    R1,??DataTable5_1
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        STR      R0,[SP, #+0]
//  124   
//  125   STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_inicio_preparacao[idioma][0],(char*)STRING_mensagem_inicio_preparacao[idioma][1]);
        LDRB     R0,[SP, #+4]
        LDR.W    R1,??DataTable5_3
        ADDS     R0,R1,R0, LSL #+3
        LDR      R2,[R0, #+4]
        LDRB     R0,[SP, #+4]
        LDR.W    R1,??DataTable5_3
        LDR      R1,[R1, R0, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  126   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_inicio_preparacao[idioma][0],(char*)STRING_mensagem_inicio_preparacao[idioma][1]);
        LDRB     R0,[SP, #+4]
        LDR.W    R1,??DataTable5_3
        ADDS     R0,R1,R0, LSL #+3
        LDR      R2,[R0, #+4]
        LDRB     R0,[SP, #+4]
        LDR.W    R1,??DataTable5_3
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
//  132   POTENCIA_setRPM(2500);//velocidade_processo);
        MOVW     R0,#+2500
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  133 
//  134   PREPARACAO_cnt_preparo = TEMPO_PREPARO;  
        LDR.W    R0,??DataTable5_4
        LDR.W    R1,??DataTable5_5  ;; 0x13880
        STR      R1,[R0, #+0]
//  135   // Faz a verificação do ventilador
//  136   if(!PREPARACAO_verificaVentilador()){
          CFI FunCall PREPARACAO_verificaVentilador
        BL       PREPARACAO_verificaVentilador
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_entry_5
//  137     // Se não detectar o giro
//  138     // desliga a parte de alta-tensão
//  139     // e sinaliza o erro
//  140     POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  141     POTENCIA_set_neutro(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  142     return FALHA_VENTILADOR;
        MOVS     R0,#+1
        B.N      ??PREPARACAO_entry_6
//  143   }
//  144     
//  145   // Inicia o controlador de temperatura
//  146   CT_set_temperatura(temperatura_processo);
??PREPARACAO_entry_5:
        LDR      R0,[SP, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  147   
//  148   // Faz a verificação da resistência
//  149   /*
//  150   if(!PREPARACAO_verifica_resistencia()){
//  151     POTENCIA_setRPM(0);
//  152     POTENCIA_set_neutro(0);
//  153     CT_set_temperatura(0);
//  154     return FALHA_RESISTENCIA;        
//  155   }
//  156   */
//  157   // Aguarda até a temperatura de início de processo
//  158   // chegar ao valor da inicial
//  159   unsigned int timeout=60000;
        MOVW     R6,#+60000
        B.N      ??PREPARACAO_entry_7
//  160   //do vTaskDelay(1);
//  161   while(AA_calculaTemperatura()<temperatura_processo && --timeout){
//  162     vTaskDelay(1);
??PREPARACAO_entry_8:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  163     APLICACAO_tela_descanso();
          CFI FunCall APLICACAO_tela_descanso
        BL       APLICACAO_tela_descanso
//  164   }  
??PREPARACAO_entry_7:
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR      R1,[SP, #+0]
        CMP      R0,R1
        BCS.N    ??PREPARACAO_entry_9
        SUBS     R6,R6,#+1
        CMP      R6,#+0
        BNE.N    ??PREPARACAO_entry_8
//  165   
//  166   if(!timeout){
??PREPARACAO_entry_9:
        CMP      R6,#+0
        BNE.N    ??PREPARACAO_entry_10
//  167     POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  168     POTENCIA_set_neutro(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  169     CT_set_temperatura(0);
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  170     return FALHA_RESISTENCIA;   
        MOVS     R0,#+2
        B.N      ??PREPARACAO_entry_6
//  171   }
//  172   
//  173   //POTENCIA_setRPM(4000);
//  174   //while(POTENCIA_getRPMmedido()>4200);
//  175   
//  176   if(!PREPARACAO_dosagem_milho()){
??PREPARACAO_entry_10:
          CFI FunCall PREPARACAO_dosagem_milho
        BL       PREPARACAO_dosagem_milho
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_entry_11
//  177     POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  178     POTENCIA_set_neutro(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  179     CT_set_temperatura(0);
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  180     return FALHA_DOSE;     
        MOVS     R0,#+3
        B.N      ??PREPARACAO_entry_6
//  181   }
//  182   
//  183   POTENCIA_setRPM(velocidade_processo);
??PREPARACAO_entry_11:
        LDR      R0,[SP, #+12]
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  184   while(POTENCIA_getRPMmedido()<velocidade_processo);
??PREPARACAO_entry_12:
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        LDR      R1,[SP, #+12]
        CMP      R0,R1
        BCC.N    ??PREPARACAO_entry_12
//  185   
//  186   BOARD_setter_led_instrucao(LED_PEGUE_PACOTE,PISCANDO); // Indica na plac ade instrução para pegar a embalagem
        MOVS     R1,#+2
        MOVS     R0,#+3
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  187   //if(
//  188   EMBALAGEM_libera_pacote(tempo_embalagem);//!=EMBALAGEM_LIBERADA);
        LDR      R0,[SP, #+8]
          CFI FunCall EMBALAGEM_libera_pacote
        BL       EMBALAGEM_libera_pacote
//  189   //  POTENCIA_setRPM(0);
//  190   //  POTENCIA_set_neutro(0);
//  191   //  CT_set_temperatura(0);    
//  192   //  return FALHA_EMBALAGEM;
//  193   //}    
//  194   
//  195   PLAYERWAVE_iniciaMusica(AUDIO_PEGA_PACOTE,0);
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall PLAYERWAVE_iniciaMusica
        BL       PLAYERWAVE_iniciaMusica
//  196   while(PLAYERWAVE_verificaToque());
??PREPARACAO_entry_13:
          CFI FunCall PLAYERWAVE_verificaToque
        BL       PLAYERWAVE_verificaToque
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_entry_13
//  197  
//  198   STRING_write_to_external(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  199   STRING_write_to_internal(CLEAR_DISPLAY,NULL,NULL);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  200   PREPARACAO_cnt_rampa = TEMPO_RAMPA;
        LDR.N    R0,??DataTable5_6
        MOVW     R1,#+3000
        STR      R1,[R0, #+0]
//  201   PREPARACAO_cnt_preparo = TEMPO_PREPARO;
        LDR.N    R0,??DataTable5_4
        LDR.N    R1,??DataTable5_5  ;; 0x13880
        STR      R1,[R0, #+0]
//  202   
//  203   PLAYERWAVE_iniciaMusica(MUSICA_PREPARO,0);
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall PLAYERWAVE_iniciaMusica
        BL       PLAYERWAVE_iniciaMusica
        B.N      ??PREPARACAO_entry_14
//  204   //while(PLAYERWAVE_verificaToque());
//  205   
//  206   // Loop de preparação da pipoca
//  207   for(;PREPARACAO_cnt_preparo;){
//  208     
//  209     PREPARACAO_atualiza_info_tempo(idioma,PREPARACAO_cnt_preparo);    
//  210     PREPARACAO_tela_interna();
//  211     
//  212     // Falha no motor do ventilador
//  213     if(POTENCIA_getRPMmedido()<1000){
//  214       POTENCIA_setRPM(0);
//  215       POTENCIA_set_neutro(0);
//  216       CT_set_temperatura(0);   
//  217       return FALHA_VENTILADOR;
//  218     }
//  219         
//  220     // Gera a rampa de aquecimento
//  221     // na preparação da pipoca
//  222     if(!PREPARACAO_cnt_rampa){
//  223       //temperatura_processo;
//  224       if(delta<20)
//  225         delta++;
//  226       CT_set_temperatura(temperatura_processo+delta);
//  227       PREPARACAO_cnt_rampa = TEMPO_RAMPA;
//  228     }
//  229     
//  230     // Controle da placa de instrução
//  231     // do usuário
//  232     if(PREPARACAO_cnt_preparo>TEMPO_ABRIR_PACOTE){
//  233        BOARD_setter_led_instrucao(LED_PEGUE_PACOTE,ACESO);
??PREPARACAO_entry_15:
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  234        BOARD_setter_led_instrucao(LED_MONTE_PACOTE,PISCANDO);
        MOVS     R1,#+2
        MOVS     R0,#+4
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  235     }
??PREPARACAO_entry_14:
        LDR.N    R0,??DataTable5_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PREPARACAO_entry_16
        LDR.N    R0,??DataTable5_4
        LDR      R1,[R0, #+0]
        LDRB     R0,[SP, #+4]
          CFI FunCall PREPARACAO_atualiza_info_tempo
        BL       PREPARACAO_atualiza_info_tempo
          CFI FunCall PREPARACAO_tela_interna
        BL       PREPARACAO_tela_interna
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        CMP      R0,#+1000
        BCS.N    ??PREPARACAO_entry_17
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
        B.N      ??PREPARACAO_entry_6
??PREPARACAO_entry_17:
        LDR.N    R0,??DataTable5_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_entry_18
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+20
        BGE.N    ??PREPARACAO_entry_19
        ADDS     R5,R5,#+1
??PREPARACAO_entry_19:
        LDR      R0,[SP, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
        LDR.N    R0,??DataTable5_6
        MOVW     R1,#+3000
        STR      R1,[R0, #+0]
??PREPARACAO_entry_18:
        LDR.N    R0,??DataTable5_4
        LDR      R0,[R0, #+0]
        MOVW     R1,#+50001
        CMP      R0,R1
        BCS.N    ??PREPARACAO_entry_15
//  236     else{
//  237        BOARD_setter_led_instrucao(LED_MONTE_PACOTE,ACESO);        
        MOVS     R1,#+1
        MOVS     R0,#+4
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  238        BOARD_setter_led_instrucao(LED_INSIRA_PACOTE,PISCANDO);         
        MOVS     R1,#+2
        MOVS     R0,#+5
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
        B.N      ??PREPARACAO_entry_14
//  239     }
//  240   }  
//  241   
//  242   BOARD_setter_led_instrucao(LED_INSIRA_PACOTE,ACESO);
??PREPARACAO_entry_16:
        MOVS     R1,#+1
        MOVS     R0,#+5
          CFI FunCall BOARD_setter_led_instrucao
        BL       BOARD_setter_led_instrucao
//  243       
//  244   // Desliga os controles
//  245   // da potência
//  246   POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  247   POTENCIA_set_neutro(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  248   CT_set_temperatura(0);
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  249   
//  250   PREPARACAO_limpeza(idioma);
        LDRB     R0,[SP, #+4]
          CFI FunCall PREPARACAO_limpeza
        BL       PREPARACAO_limpeza
//  251   
//  252   PLAYER_interrompeMusica();
          CFI FunCall PLAYER_interrompeMusica
        BL       PLAYER_interrompeMusica
//  253   vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  254   PLAYERWAVE_iniciaMusica(AUDIO_PIPOCAS_PRONTAS,0);
        MOVS     R1,#+0
        MOVS     R0,#+2
          CFI FunCall PLAYERWAVE_iniciaMusica
        BL       PLAYERWAVE_iniciaMusica
//  255   while(PLAYERWAVE_verificaToque());  
??PREPARACAO_entry_20:
          CFI FunCall PLAYERWAVE_verificaToque
        BL       PLAYERWAVE_verificaToque
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_entry_20
//  256   vTaskDelay(500); 
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  257   //-----------------------------------------------
//  258   // Local para inserção dos dados no faturamento
//  259   // e liberação do troco
//  260   //-----------------------------------------------
//  261   if(contabiliza==CONTABILIZA){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??PREPARACAO_entry_21
//  262     // Só contabiliza as unidades vendidadas
//  263     // quando houver necessidade
//  264     FATURAMENTO_add_contagem_parcial(1);
        MOVS     R0,#+1
          CFI FunCall FATURAMENTO_add_contagem_parcial
        BL       FATURAMENTO_add_contagem_parcial
//  265     FATURAMENTO_add_arrecadacao_parcial(valor_pipoca);
        LDR      R0,[SP, #+16]
          CFI FunCall FATURAMENTO_add_arrecadacao_parcial
        BL       FATURAMENTO_add_arrecadacao_parcial
//  266     FATURAMENTO_add_contagem_total(1);
        MOVS     R0,#+1
          CFI FunCall FATURAMENTO_add_contagem_total
        BL       FATURAMENTO_add_contagem_total
//  267     FATURAMENTO_add_arrecadacao_total(valor_pipoca);
        LDR      R0,[SP, #+16]
          CFI FunCall FATURAMENTO_add_arrecadacao_total
        BL       FATURAMENTO_add_arrecadacao_total
        B.N      ??PREPARACAO_entry_22
//  268   }
//  269   else
//  270     FATURAMENTO_inc_contador_pipocas_teste();  
??PREPARACAO_entry_21:
          CFI FunCall FATURAMENTO_inc_contador_pipocas_teste
        BL       FATURAMENTO_inc_contador_pipocas_teste
//  271  
//  272   //----------------------------------------------
//  273   // Fim da coleta dos dados de faturamento
//  274   //----------------------------------------------   
//  275   
//  276   BOARD_liga_placa_instrucao(0);
??PREPARACAO_entry_22:
        MOVS     R0,#+0
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  277   BOARD_liga_placa_instrucao(1);  
        MOVS     R0,#+1
          CFI FunCall BOARD_liga_placa_instrucao
        BL       BOARD_liga_placa_instrucao
//  278   
//  279   //PAGAMENTOS_set_bloqueio(0);
//  280   
//  281   return SUCESSO;
        MOVS     R0,#+0
??PREPARACAO_entry_6:
        ADD      SP,SP,#+24
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock0
//  282 }
//  283 /**********************************************************************************
//  284 *       Descrição       :       Atualiza o display frontal com o tempo restante
//  285 *                               do processo de preparo
//  286 *       Parametros      :       nenhum
//  287 *       Retorno         :       nenhum
//  288 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PREPARACAO_atualiza_info_tempo
        THUMB
//  289 void PREPARACAO_atualiza_info_tempo(unsigned char idioma,unsigned int tempo){
PREPARACAO_atualiza_info_tempo:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
        MOVS     R4,R0
//  290   char buffer_linha[17];
//  291   unsigned int minutos;
//  292   unsigned int segundos;
//  293   
//  294   minutos  = PREPARACAO_cnt_preparo/1000;
        LDR.N    R0,??DataTable5_4
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        UDIV     R2,R0,R1
//  295   segundos = minutos % 60;
        MOVS     R0,#+60
        UDIV     R1,R2,R0
        MLS      R3,R0,R1,R2
//  296   minutos  = minutos/60;
        MOVS     R0,#+60
        UDIV     R2,R2,R0
//  297   
//  298   sprintf(buffer_linha,"  %01d:%02d  ",minutos,segundos);
        LDR.N    R1,??DataTable5_7
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  299   STRING_write_to_external(NO_CLEAR,(char*)STRING_mensagem_pipocas_prontas[idioma],buffer_linha);  
        ADD      R2,SP,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_8
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  300 }
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  301 /**********************************************************************************
//  302 *       Descrição       :       Verifica se o ventilador está funcionando
//  303 *       Parametros      :       nenhum
//  304 *       Retorno         :       (unsigned char) maior do que zero se conseguir
//  305 *                               detectar o RPM do motor
//  306 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PREPARACAO_verificaVentilador
        THUMB
//  307 unsigned char PREPARACAO_verificaVentilador(void){
PREPARACAO_verificaVentilador:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  308   unsigned short int tempo=50000;  
        MOVW     R4,#+50000
//  309   
//  310   do{
//  311     
//  312     if(POTENCIA_getRPMmedido()>1000)
??PREPARACAO_verificaVentilador_0:
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        CMP      R0,#+1000
        BLS.N    ??PREPARACAO_verificaVentilador_1
//  313       return 1;
        MOVS     R0,#+1
        B.N      ??PREPARACAO_verificaVentilador_2
//  314     else
//  315       vTaskDelay(1);
??PREPARACAO_verificaVentilador_1:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  316         
//  317   }
//  318   while(tempo--);
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_verificaVentilador_0
//  319   
//  320   return 0; 
        MOVS     R0,#+0
??PREPARACAO_verificaVentilador_2:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
//  321 }
//  322 /**********************************************************************************
//  323 *       Descrição       :       Faz a verificação do aquecimento da resistência
//  324 *       Parametros      :       nenhum
//  325 *       Retorno         :       (unsigned char) maior do que zero se 
//  326 *                               conseguir aquecer a panela 2 graus em até 5 segundos
//  327 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PREPARACAO_verifica_resistencia
        THUMB
//  328 unsigned char PREPARACAO_verifica_resistencia(void){
PREPARACAO_verifica_resistencia:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  329   unsigned int temperaturaInicial;
//  330   unsigned short int tempo = 15000;
        MOVW     R5,#+15000
//  331   
//  332   temperaturaInicial = AA_calculaTemperatura();
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        MOVS     R4,R0
//  333   
//  334   do{
//  335     
//  336     if(AA_calculaTemperatura()>(temperaturaInicial+2))
??PREPARACAO_verifica_resistencia_0:
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        ADDS     R1,R4,#+2
        CMP      R1,R0
        BCS.N    ??PREPARACAO_verifica_resistencia_1
//  337       return 1;
        MOVS     R0,#+1
        B.N      ??PREPARACAO_verifica_resistencia_2
//  338     else
//  339       vTaskDelay(1);
??PREPARACAO_verifica_resistencia_1:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  340     
//  341   }
//  342   while(tempo--);
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_verifica_resistencia_0
//  343   
//  344   return 0;  
        MOVS     R0,#+0
??PREPARACAO_verifica_resistencia_2:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock3
//  345 }
//  346 /**********************************************************************************
//  347 *       Descrição       :       Tela informativa do processo exibida
//  348 *                               no display interno
//  349 *       Parametros      :       nenhum
//  350 *       Retorno         :       nenhum
//  351 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PREPARACAO_tela_interna
        THUMB
//  352 void PREPARACAO_tela_interna(void){
PREPARACAO_tela_interna:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
//  353   char buffer_linha[17];
//  354   
//  355   sprintf(buffer_linha,"%05d RPM-%03doC",POTENCIA_getRPMmedido(),AA_calculaTemperatura());
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
//  356   STRING_write_to_internal(NO_CLEAR,buffer_linha,NULL);
        MOVS     R2,#+0
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  357 }
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4
//  358 /**********************************************************************************
//  359 *       Descrição       :       Libera uma dose de milho na panela
//  360 *       Parametros      :       nenhum
//  361 *       Retorno         :       (unsigned char) maior do que zero
//  362 *                               se conseguir dosar
//  363 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function PREPARACAO_dosagem_milho
        THUMB
//  364 unsigned char PREPARACAO_dosagem_milho(void){
PREPARACAO_dosagem_milho:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  365   unsigned char sensor_dose; 
//  366   unsigned int tempo=2000; 
        MOV      R4,#+2000
//  367   
//  368   BOARD_set_motor_dose(DOSAR);
        MOVS     R0,#+1
          CFI FunCall BOARD_set_motor_dose
        BL       BOARD_set_motor_dose
        B.N      ??PREPARACAO_dosagem_milho_0
//  369   while(GET_SENSOR_DOSE() && tempo--)
//  370     vTaskDelay(1);
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
//  371   
//  372   tempo = 15000;
??PREPARACAO_dosagem_milho_2:
        MOVW     R4,#+15000
//  373         
//  374   do{
//  375     
//  376     sensor_dose = GET_SENSOR_DOSE();  
??PREPARACAO_dosagem_milho_3:
        MOVS     R0,#+2
          CFI FunCall BOARD_get_sinal
        BL       BOARD_get_sinal
//  377     if(sensor_dose){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??PREPARACAO_dosagem_milho_4
//  378       BOARD_set_motor_dose(PARADO);
        MOVS     R0,#+0
          CFI FunCall BOARD_set_motor_dose
        BL       BOARD_set_motor_dose
//  379       return 1;
        MOVS     R0,#+1
        B.N      ??PREPARACAO_dosagem_milho_5
//  380     }
//  381     else
//  382       vTaskDelay(1);
??PREPARACAO_dosagem_milho_4:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  383     
//  384   }
//  385   while(tempo--);
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        CMP      R0,#+0
        BNE.N    ??PREPARACAO_dosagem_milho_3
//  386   
//  387   BOARD_set_motor_dose(PARADO);  
        MOVS     R0,#+0
          CFI FunCall BOARD_set_motor_dose
        BL       BOARD_set_motor_dose
//  388   //BOARD_set_motor_dose(DOSAR);          
//  389   //BOARD_set_motor_dose(REVERTER);
//  390   //BOARD_set_motor_dose(PARADO);
//  391   
//  392   return 0;
        MOVS     R0,#+0
??PREPARACAO_dosagem_milho_5:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
//  393 }
//  394 /**********************************************************************************
//  395 *       Descrição       :       Limpeza da panela e agradecimento pela
//  396 *                               compra
//  397 *       Parametros      :       nenhum
//  398 *       Retorno         :       nenhum
//  399 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function PREPARACAO_limpeza
        THUMB
//  400 void PREPARACAO_limpeza(unsigned char idioma){
PREPARACAO_limpeza:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  401   
//  402   POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  403   POTENCIA_setRPM(13000);
        MOVW     R0,#+13000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  404   
//  405   STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_limpeza[idioma][0],(char*)STRING_mensagem_limpeza[idioma][1]);
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
//  406   vTaskDelay(7000);
        MOVW     R0,#+7000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  407   
//  408   POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  409   POTENCIA_set_neutro(0);  
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  410 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock6
//  411 /**********************************************************************************
//  412 *       Descrição       :       Resfriamento do sistema
//  413 *       Parametros      :       nenhum
//  414 *       Retorno         :       nenhum
//  415 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function PREPARACAO_resfriamento
        THUMB
//  416 void PREPARACAO_resfriamento(unsigned char idioma){
PREPARACAO_resfriamento:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  417   
//  418   POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  419   vTaskDelay(500);  
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  420   POTENCIA_setRPM(6000);
        MOVW     R0,#+6000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  421   
//  422   STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_resfriando[idioma][0],
//  423                                          (char*)STRING_mensagem_resfriando[idioma][1]);
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
//  424   vTaskDelay(30000);
        MOVW     R0,#+30000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  425   
//  426   POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  427   POTENCIA_set_neutro(0);  
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  428 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock7
//  429 /**********************************************************************************
//  430 *       Descrição       :       Limpeza da panela e agradecimento pela
//  431 *                               compra
//  432 *       Parametros      :       nenhum
//  433 *       Retorno         :       nenhum
//  434 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function PREPARACAO_limpeza_inicial
        THUMB
//  435 void PREPARACAO_limpeza_inicial(unsigned char idioma){
PREPARACAO_limpeza_inicial:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  436   
//  437   POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  438   vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  439   POTENCIA_setRPM(12000);
        MOVW     R0,#+12000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  440   
//  441   STRING_write_to_external(CLEAR_DISPLAY,(char*)STRING_mensagem_limpeza_inicial[idioma][0],(char*)STRING_mensagem_limpeza_inicial[idioma][1]);
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
//  442   vTaskDelay(7000);
        MOVW     R0,#+7000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  443   
//  444   POTENCIA_setRPM(0);
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
//  445   POTENCIA_set_neutro(0);  
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  446 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     PREPARACAO_contador_compensacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     PREPARACAO_compensador

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x1d4c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     STRING_mensagem_inicio_preparacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     PREPARACAO_cnt_preparo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x13880

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     PREPARACAO_cnt_rampa

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
//  447 /**********************************************************************************
//  448 *       Fim do arquivo
//  449 **********************************************************************************/
//  450 
// 
//    16 bytes in section .bss
//    32 bytes in section .rodata
// 1 274 bytes in section .text
// 
// 1 274 bytes of CODE  memory
//    32 bytes of CONST memory
//    16 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
