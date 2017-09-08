///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     08/Sep/2017  15:30:37 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_te /
//                    ste_hardware.c                                          /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_te /
//                    ste_hardware.c -lC C:\repositorios\MaisPipocaG2\SOFTWAR /
//                    E\Debug\List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE /
//                    \Debug\List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\D /
//                    ebug\Obj\ --no_cse --no_unroll --no_inline              /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -Ol                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\menu_t /
//                    este_hardware.s                                         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_teste_hardware

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", "flags,widths"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN AA_calculaResistorInteiro
        EXTERN AA_calculaTemperatura
        EXTERN AA_mediaMovelPapel
        EXTERN APLICACAO_carrega_idioma
        EXTERN BOARD_get_sinal
        EXTERN BOARD_getter_general_purpose_counter
        EXTERN BOARD_set_motor_dose
        EXTERN BOARD_set_motor_embalagem
        EXTERN BOARD_setter_general_purpose_counter
        EXTERN BV20_get_ultimo_evento
        EXTERN BV20_get_valor_acumulador
        EXTERN BV20_subtrai_valor_acumulado
        EXTERN CT_set_temperatura
        EXTERN IMPRESSORA_impressora_teste
        EXTERN LEDS_setter_led
        EXTERN MENUROLAGEM_show
        EXTERN MTMDB_entry
        EXTERN PAGAMENTOS_bloqueia_uca1
        EXTERN PAGAMENTOS_get_contagem_p70
        EXTERN PAGAMENTOS_get_contagem_uca1
        EXTERN PAGAMENTOS_set_inhibit_p70
        EXTERN PAGAMENTOS_subtrai_contagem_p70
        EXTERN PAGAMENTOS_subtrai_contagem_uca1
        EXTERN PLAYERWAVE_iniciaMusica
        EXTERN PLAYERWAVE_verificaToque
        EXTERN PLAYER_interrompeMusica
        EXTERN POTENCIA_getFrequenciaRede
        EXTERN POTENCIA_getRPMmedido
        EXTERN POTENCIA_setRPM
        EXTERN POTENCIA_set_neutro
        EXTERN RTC_getValue
        EXTERN STRING_mensagem_teste_BV20
        EXTERN STRING_mensagem_teste_P70
        EXTERN STRING_mensagem_teste_led_instrucao
        EXTERN STRING_mensagem_teste_uca1
        EXTERN STRING_menu_teste_hardware
        EXTERN STRING_tela_teste_dispensador_papel
        EXTERN STRING_tela_teste_dosador
        EXTERN STRING_teste_data_flash
        EXTERN STRING_teste_panela
        EXTERN STRING_teste_rtc
        EXTERN STRING_teste_ventilador
        EXTERN STRING_texto_teste_motor
        EXTERN STRING_titulo_menu_teste_musica
        EXTERN STRING_titulo_menu_teste_vozes
        EXTERN STRING_titulo_teste_hardware
        EXTERN STRING_titulo_teste_impresora
        EXTERN STRING_titulo_teste_lcd_externo
        EXTERN STRING_write_to_external
        EXTERN STRING_write_to_internal
        EXTERN TECLADO_getch
        EXTERN __aeabi_memclr4
        EXTERN sprintf
        EXTERN srand
        EXTERN vTaskDelay

        PUBLIC MTH_entry
        PUBLIC MTH_funcs
        PUBLIC MTH_passo_teste_data_flash
        PUBLIC MTH_tela_placa_instrucao
        PUBLIC MTH_tela_teste_cctalk
        PUBLIC MTH_tela_teste_impressora
        PUBLIC MTH_tela_teste_lcd_externo
        PUBLIC MTH_tela_teste_p70
        PUBLIC MTH_tela_teste_uca1
        PUBLIC MTH_teste_data_flash
        PUBLIC MTH_teste_dispensador_papel
        PUBLIC MTH_teste_dosador_milho
        PUBLIC MTH_teste_locucoes
        PUBLIC MTH_teste_musica
        PUBLIC MTH_teste_panela
        PUBLIC MTH_teste_rtc
        PUBLIC MTH_teste_ventilador
        
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
        

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%02d:%02d:%02d">`:
        DATA
        DC8 "%02d:%02d:%02d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BP:%01d-NP:%03d-RP:%1d">`:
        DATA
        DC8 "BP:%01d-NP:%03d-RP:%1d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SD:%01d - M:%s">`:
        DATA
        DC8 "SD:%01d - M:%s"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "F:%02dHz-RPM:%05d">`:
        DATA
        DC8 "F:%02dHz-RPM:%05d"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant " SET RPM:%05d  ">`:
        DATA
        DC8 " SET RPM:%05d  "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%05dR-%03doC-R:%01d">`:
        DATA
        DC8 "%05dR-%03doC-R:%01d"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "T=%04d-Ev=%1d">`:
        DATA
        DC8 "T=%04d-Ev=%1d"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%04d-[%s]">`:
        DATA
        DC8 "%04d-[%s]"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "LOCK  ">`:
        DATA
        DC8 "LOCK  "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "UNLOK">`:
        DATA
        DC8 "UNLOK"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "LED:[%01d]">`:
        DATA
        DC8 "LED:[%01d]"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "      ...       ">`:
        DATA
        DC8 "      ...       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[%s]">`:
        DATA
        DC8 "[%s]"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PLAY">`:
        DATA
        DC8 "PLAY"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "STOP">`:
        DATA
        DC8 "STOP"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {0, 2, 3}>`:
        DATA
        DC8 0, 2, 3, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[%s][i:%01d]">`:
        DATA
        DC8 "[%s][i:%01d]"
        DC8 0, 0, 0
// C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_teste_hardware.c
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
//   17 |       Arquivo            :  menu_teste_hardware.c
//   18 |       Descrição          :  Funções do menu de teste do hardware
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  16/02/2017
//   22 |
//   23 |       Revisões           :  001
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 
//   29 /***********************************************************************************
//   30 *       Includes
//   31 ***********************************************************************************/
//   32 #include <stdio.h>
//   33 #include <stdlib.h>
//   34 #include <string.h>
//   35 #include "..\includes.h"
//   36 #include "menu_ajuste_relogio.h"
//   37 #include "menu_configuracao.h"
//   38 #include "menu_edita_flag.h"
//   39 #include "menu_edita_inteiro.h"
//   40 #include "menu_edita_listagem.h"
//   41 #include "menu_info_binaria.h"
//   42 #include "menu_rolagem.h"
//   43 #include "menu_teste_hardware.h"
//   44 #include "menu_teste_mdb.h"
//   45 /***********************************************************************************
//   46 *       Definições locais
//   47 ***********************************************************************************/
//   48 
//   49 
//   50 /***********************************************************************************
//   51 *       Variaveis locais
//   52 ***********************************************************************************/
//   53 
//   54 
//   55 /***********************************************************************************
//   56 *       Funções locais
//   57 ***********************************************************************************/
//   58 void MTH_teste_rtc(void);
//   59 void MTH_teste_data_flash(void);
//   60 void MTH_teste_dispensador_papel(void);
//   61 void MTH_teste_dosador_milho(void);
//   62 void MTH_teste_ventilador(void);
//   63 void MTH_teste_panela(void);
//   64 void MTH_tela_teste_cctalk(void);
//   65 void MTH_tela_teste_uca1(void);
//   66 void MTH_tela_teste_p70(void);
//   67 void MTH_tela_placa_instrucao(void);
//   68 void MTH_tela_teste_lcd_externo(void);
//   69 void MTH_tela_teste_impressora(void);
//   70 void MTH_teste_musica(void);
//   71 void MTH_teste_locucoes(void);
//   72 
//   73 /***********************************************************************************
//   74 *       Tabela de funções
//   75 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   76 void(*const MTH_funcs[TAM_OPCOES_HARDWARE])(void)={
MTH_funcs:
        DATA
        DC32 MTH_teste_rtc, MTH_teste_data_flash, MTH_teste_dispensador_papel
        DC32 MTH_teste_dosador_milho, MTH_teste_ventilador, MTH_teste_panela
        DC32 MTH_tela_teste_cctalk, MTH_tela_teste_uca1, MTH_tela_teste_p70
        DC32 MTMDB_entry, MTH_tela_teste_impressora, MTH_teste_musica
        DC32 MTH_teste_locucoes, MTH_tela_placa_instrucao
        DC32 MTH_tela_teste_lcd_externo, 0H
//   77   MTH_teste_rtc,
//   78   MTH_teste_data_flash,
//   79   MTH_teste_dispensador_papel,
//   80   MTH_teste_dosador_milho,
//   81   MTH_teste_ventilador,
//   82   MTH_teste_panela,
//   83   MTH_tela_teste_cctalk,
//   84   MTH_tela_teste_uca1,
//   85   MTH_tela_teste_p70,
//   86   MTMDB_entry,
//   87   MTH_tela_teste_impressora,
//   88   MTH_teste_musica,
//   89   MTH_teste_locucoes,
//   90   MTH_tela_placa_instrucao,
//   91   MTH_tela_teste_lcd_externo,
//   92   NULL
//   93 };
//   94 
//   95 /***********************************************************************************
//   96 *       Implementação das funções
//   97 ***********************************************************************************/
//   98 
//   99 /***********************************************************************************
//  100 *       Descrição       :       Ponto de entrada do menu de teste do hardware
//  101 *       Parametros      :       nenhum
//  102 *       Retorno         :       nenhum
//  103 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MTH_entry
        THUMB
//  104 void MTH_entry(void){
MTH_entry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  105   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  106   
//  107   MENUROLAGEM_show((char*)STRING_titulo_teste_hardware[idioma],
//  108                    (char**)STRING_menu_teste_hardware[idioma],
//  109                    TAM_OPCOES_HARDWARE,
//  110                    (void(**)(void))MTH_funcs);   
        LDR.W    R3,??DataTable14
        MOVS     R2,#+16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+64
        LDR.W    R4,??DataTable14_1
        MLA      R1,R1,R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R4,??DataTable14_2
        LDR      R0,[R4, R0, LSL #+2]
          CFI FunCall MENUROLAGEM_show
        BL       MENUROLAGEM_show
//  111 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//  112 /***********************************************************************************
//  113 *       Descrição       :       Exibe no display a contagem do RTC
//  114 *       Parametros      :       nenhum
//  115 *       Retorno         :       nenhum
//  116 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MTH_teste_rtc
        THUMB
//  117 void MTH_teste_rtc(void){
MTH_teste_rtc:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+44
          CFI CFA R13+48
//  118   eTECLA tecla;
//  119   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  120   unsigned char hora,minuto,segundo,dia,mes;
//  121   unsigned int ano;
//  122   char buffer_linha[17];
//  123   
//  124   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_rtc[idioma],NULL);  
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable14_3
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_teste_rtc_0
//  125   
//  126   for(;;){
//  127     
//  128     tecla = TECLADO_getch();
//  129     switch(tecla){
//  130       case TECLA_ENTER:
//  131            break;
//  132       case TECLA_ESC:
//  133            return;
//  134       case TECLA_INC:
//  135       case TECLA_DEC:
//  136            break;
//  137     }
//  138     
//  139     RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);    
??MTH_teste_rtc_1:
??MTH_teste_rtc_2:
        ADD      R0,SP,#+16
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+11
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+12
        ADD      R2,SP,#+8
        ADD      R1,SP,#+9
        ADD      R0,SP,#+10
          CFI FunCall RTC_getValue
        BL       RTC_getValue
//  140     sprintf(buffer_linha,"%02d:%02d:%02d",hora,minuto,segundo);
        LDRB     R0,[SP, #+8]
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+9]
        LDRB     R2,[SP, #+10]
        LDR.W    R1,??DataTable14_4
        ADD      R0,SP,#+20
          CFI FunCall sprintf
        BL       sprintf
//  141     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+20
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  142     
//  143     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MTH_teste_rtc_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_teste_rtc_3
        BCC.N    ??MTH_teste_rtc_2
        CMP      R0,#+3
        BEQ.N    ??MTH_teste_rtc_1
        BCC.N    ??MTH_teste_rtc_1
        CMP      R0,#+4
        BNE.N    ??MTH_teste_rtc_2
??MTH_teste_rtc_4:
        B.N      ??MTH_teste_rtc_2
??MTH_teste_rtc_3:
        ADD      SP,SP,#+44
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock1
//  144   }    
//  145 }
//  146 /***********************************************************************************
//  147 *       Descrição       :       Executa um passo no teste da memória dataflash
//  148 *       Parametros      :       (unsigned char) passo atual
//  149 *       Retorno         :       (unsigned char) novo passo
//  150 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MTH_passo_teste_data_flash
          CFI NoCalls
        THUMB
//  151 unsigned char MTH_passo_teste_data_flash(unsigned char idioma,unsigned char passo){  
//  152   /*
//  153   unsigned char buffer[64];
//  154   
//  155   switch(passo){
//  156     case 0:
//  157             STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_passos_teste_dataflash[idioma][0]);
//  158             for(unsigned char i=0;i<64;i++)
//  159               buffer[i] = i;
//  160             MEMORYWRAPPER_writeBytes(ADR_AREA_TESTE,buffer,64);
//  161             passo = 1;
//  162             break;
//  163     case 1:
//  164             STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_passos_teste_dataflash[idioma][1]);
//  165             MEMORYWRAPPER_readBytes(ADR_AREA_TESTE,buffer,64);
//  166             passo = 2;
//  167             for(unsigned char i=0;i<64;i++)
//  168               if(buffer[i]!=i)
//  169                 passo = 3;
//  170             break;
//  171     case 2:
//  172             STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_passos_teste_dataflash[idioma][2]);
//  173             passo = 0;
//  174             break;
//  175     case 3:
//  176             STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_passos_teste_dataflash[idioma][3]);
//  177             passo = 0;
//  178             break;
//  179   }
//  180   
//  181   return passo;
//  182   */
//  183   return 0;
MTH_passo_teste_data_flash:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  184 }
//  185 /***********************************************************************************
//  186 *       Descrição       :       Faz  o teste da memória flash
//  187 *       Parametros      :       nenhum
//  188 *       Retorno         :       nenhum
//  189 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MTH_teste_data_flash
        THUMB
//  190 void MTH_teste_data_flash(void){
MTH_teste_data_flash:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//  191   eTECLA tecla;
//  192   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  193   unsigned char tempo=1;
        MOVS     R5,#+1
//  194   unsigned char passo=0;
        MOVS     R6,#+0
//  195 
//  196   srand(100);  
        MOVS     R0,#+100
          CFI FunCall srand
        BL       srand
//  197   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_data_flash[idioma],NULL);  
        MOVS     R2,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_5
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_teste_data_flash_0
//  198   for(;;){
//  199     
//  200     tecla = TECLADO_getch();
//  201     switch(tecla){
//  202       case TECLA_ENTER:        
//  203            break;
//  204       case TECLA_ESC:
//  205            return;
//  206       case TECLA_INC:
//  207            break;
//  208       case TECLA_DEC:
//  209            break;
//  210     }
//  211     
//  212     // 
//  213     //  Executa o teste
//  214     //
//  215     if(!--tempo){
??MTH_teste_data_flash_1:
??MTH_teste_data_flash_2:
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??MTH_teste_data_flash_3
//  216       tempo = 10;      
        MOVS     R5,#+10
//  217       passo = MTH_passo_teste_data_flash(idioma,passo);      
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall MTH_passo_teste_data_flash
        BL       MTH_passo_teste_data_flash
        MOVS     R6,R0
//  218     }    
//  219     
//  220     vTaskDelay(50);
??MTH_teste_data_flash_3:
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MTH_teste_data_flash_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_teste_data_flash_4
        BCC.N    ??MTH_teste_data_flash_2
        CMP      R0,#+3
        BEQ.N    ??MTH_teste_data_flash_1
        BCC.N    ??MTH_teste_data_flash_5
        CMP      R0,#+4
        BNE.N    ??MTH_teste_data_flash_2
??MTH_teste_data_flash_6:
        B.N      ??MTH_teste_data_flash_2
??MTH_teste_data_flash_4:
        POP      {R4-R6,PC}       ;; return
??MTH_teste_data_flash_5:
        B.N      ??MTH_teste_data_flash_2
          CFI EndBlock cfiBlock3
//  221   }    
//  222 }
//  223 /***********************************************************************************
//  224 *       Descrição       :       Teste do controle do dispensador de
//  225 *                               embalagem
//  226 *       Parametros      :       nenhum
//  227 *       Retorno         :       nenhum
//  228 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MTH_teste_dispensador_papel
        THUMB
//  229 void MTH_teste_dispensador_papel(void){
MTH_teste_dispensador_papel:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+28
          CFI CFA R13+40
//  230   eTECLA tecla;
//  231   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  232   char buffer_linha[17];
//  233 
//  234   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_tela_teste_dispensador_papel[idioma],NULL);  
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable14_6
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_teste_dispensador_papel_0
//  235   for(;;){
//  236     
//  237     tecla = TECLADO_getch();
//  238     switch(tecla){
//  239       case TECLA_ENTER:
//  240            break;
//  241       case TECLA_ESC:
//  242            return;
//  243       case TECLA_INC:
//  244            BOARD_set_motor_embalagem(1);
//  245            break;
//  246       case TECLA_DEC:
//  247            BOARD_set_motor_embalagem(0);
//  248            break;
//  249     }
//  250     
//  251     unsigned char barreira = GET_BARREIRA_SAIDA_PAPEL();
//  252     unsigned int nivelPapel = AA_mediaMovelPapel();
//  253     unsigned char reserva = GET_SENSOR_RESERVA_PAPEL();
//  254     
//  255     nivelPapel *= 100;
//  256     nivelPapel>>= 12;
//  257     
//  258     sprintf(buffer_linha,"BP:%01d-NP:%03d-RP:%1d",barreira==BARREIRA_PAPEL_LIVRE?0:1,nivelPapel,reserva?1:0);
??MTH_teste_dispensador_papel_1:
        MOVS     R2,#+1
??MTH_teste_dispensador_papel_2:
        STR      R0,[SP, #+0]
        MOVS     R3,R4
        LDR.W    R1,??DataTable14_7
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  259     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  260     
//  261     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MTH_teste_dispensador_papel_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_teste_dispensador_papel_3
        BCC.N    ??MTH_teste_dispensador_papel_4
        CMP      R0,#+3
        BEQ.N    ??MTH_teste_dispensador_papel_5
        BCC.N    ??MTH_teste_dispensador_papel_6
        CMP      R0,#+4
        BNE.N    ??MTH_teste_dispensador_papel_4
??MTH_teste_dispensador_papel_7:
        B.N      ??MTH_teste_dispensador_papel_4
??MTH_teste_dispensador_papel_3:
        ADD      SP,SP,#+28
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI CFA R13+40
??MTH_teste_dispensador_papel_6:
        MOVS     R0,#+1
          CFI FunCall BOARD_set_motor_embalagem
        BL       BOARD_set_motor_embalagem
        B.N      ??MTH_teste_dispensador_papel_4
??MTH_teste_dispensador_papel_5:
        MOVS     R0,#+0
          CFI FunCall BOARD_set_motor_embalagem
        BL       BOARD_set_motor_embalagem
??MTH_teste_dispensador_papel_4:
        MOVS     R0,#+0
          CFI FunCall BOARD_get_sinal
        BL       BOARD_get_sinal
        MOVS     R5,R0
          CFI FunCall AA_mediaMovelPapel
        BL       AA_mediaMovelPapel
        MOVS     R4,R0
        MOVS     R0,#+1
          CFI FunCall BOARD_get_sinal
        BL       BOARD_get_sinal
        MOVS     R1,#+100
        MULS     R4,R1,R4
        LSRS     R4,R4,#+12
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??MTH_teste_dispensador_papel_8
        MOVS     R0,#+1
        B.N      ??MTH_teste_dispensador_papel_9
??MTH_teste_dispensador_papel_8:
        MOVS     R0,#+0
??MTH_teste_dispensador_papel_9:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??MTH_teste_dispensador_papel_1
        MOVS     R2,#+0
        B.N      ??MTH_teste_dispensador_papel_2
          CFI EndBlock cfiBlock4
//  262   }    
//  263 }
//  264 /***********************************************************************************
//  265 *       Descriçao       :       Teste do dosador do milho
//  266 *       Parametros      :       nenhum
//  267 *       Retorno         :       nenhum
//  268 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MTH_teste_dosador_milho
        THUMB
//  269 void MTH_teste_dosador_milho(void){
MTH_teste_dosador_milho:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
//  270   eTECLA tecla;  
//  271   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  272   char buffer_linha[17];
//  273   eMOTOR_DOSE estado=PARADO;
        MOVS     R5,#+0
//  274     
//  275   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_tela_teste_dosador[idioma],NULL);    
        MOVS     R2,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_8
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_teste_dosador_milho_0
//  276   
//  277   for(;;){
//  278     
//  279     tecla = TECLADO_getch();
//  280     switch(tecla){
//  281       case TECLA_ENTER:
//  282            BOARD_set_motor_dose(PARADO);
//  283            estado = PARADO;        
//  284            break;
//  285       case TECLA_ESC:
//  286            return;
//  287       case TECLA_INC:
//  288            BOARD_set_motor_dose(DOSAR);
//  289            estado = DOSAR;
//  290            break;
//  291       case TECLA_DEC:
//  292            BOARD_set_motor_dose(REVERTER);
??MTH_teste_dosador_milho_1:
        MOVS     R0,#+2
          CFI FunCall BOARD_set_motor_dose
        BL       BOARD_set_motor_dose
//  293            estado = REVERTER;
        MOVS     R5,#+2
//  294            break;
//  295     }
//  296    
//  297     unsigned char sensor_dose = GET_SENSOR_DOSE();
??MTH_teste_dosador_milho_2:
        MOVS     R0,#+2
          CFI FunCall BOARD_get_sinal
        BL       BOARD_get_sinal
        MOVS     R2,R0
//  298     sprintf(buffer_linha,"SD:%01d - M:%s",sensor_dose,STRING_texto_teste_motor[idioma][estado]);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+12
        LDR.W    R1,??DataTable14_9
        MLA      R0,R0,R4,R1
        LDR      R3,[R0, R5, LSL #+2]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.W    R1,??DataTable14_10
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  299     
//  300     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);    
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  301     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MTH_teste_dosador_milho_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_teste_dosador_milho_3
        BCC.N    ??MTH_teste_dosador_milho_2
        CMP      R0,#+3
        BEQ.N    ??MTH_teste_dosador_milho_1
        BCC.N    ??MTH_teste_dosador_milho_4
        CMP      R0,#+4
        BNE.N    ??MTH_teste_dosador_milho_2
??MTH_teste_dosador_milho_5:
        MOVS     R0,#+0
          CFI FunCall BOARD_set_motor_dose
        BL       BOARD_set_motor_dose
        MOVS     R5,#+0
        B.N      ??MTH_teste_dosador_milho_2
??MTH_teste_dosador_milho_3:
        ADD      SP,SP,#+20
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI CFA R13+32
??MTH_teste_dosador_milho_4:
        MOVS     R0,#+1
          CFI FunCall BOARD_set_motor_dose
        BL       BOARD_set_motor_dose
        MOVS     R5,#+1
        B.N      ??MTH_teste_dosador_milho_2
          CFI EndBlock cfiBlock5
//  302   }   
//  303 }
//  304 /***********************************************************************************
//  305 *       Descrição       :       Teste de controle do motor AC
//  306 *       Parametros      :       nenhum
//  307 *       Retorno         :       nenhum
//  308 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MTH_teste_ventilador
        THUMB
//  309 void MTH_teste_ventilador(void){
MTH_teste_ventilador:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        SUB      SP,SP,#+24
          CFI CFA R13+48
//  310   eTECLA tecla;  
//  311   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  312   char buffer_linha[17];
//  313   unsigned int contagem_atual=4000;
        MOV      R5,#+4000
//  314   unsigned int ultima_contagem=4000;
        MOV      R6,#+4000
//  315     
//  316   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_ventilador[idioma],NULL);      
        MOVS     R2,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_11
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  317   POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  318   BOARD_setter_general_purpose_counter(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_setter_general_purpose_counter
        BL       BOARD_setter_general_purpose_counter
        B.N      ??MTH_teste_ventilador_0
//  319   
//  320   for(;;){
//  321     
//  322     tecla = TECLADO_getch();
//  323     switch(tecla){
//  324       case TECLA_ENTER:
//  325            POTENCIA_setRPM(0);
//  326       case TECLA_ESC:
//  327            POTENCIA_setRPM(0);        
//  328            POTENCIA_set_neutro(0);
//  329            return;
//  330       case TECLA_INC:
//  331            if(contagem_atual<18000)
//  332              contagem_atual+=100;
//  333            BOARD_setter_general_purpose_counter(3000);
//  334            break;
//  335       case TECLA_DEC:
//  336            if(contagem_atual>1000)
//  337              contagem_atual-=100;
//  338            BOARD_setter_general_purpose_counter(3000);
//  339            break;
//  340     }
//  341     
//  342     unsigned short int frequencia=POTENCIA_getFrequenciaRede();
//  343     unsigned short int rotacao = POTENCIA_getRPMmedido();
//  344     
//  345     if(!BOARD_getter_general_purpose_counter()){
//  346       
//  347       if(contagem_atual!=ultima_contagem){
//  348         POTENCIA_setRPM(contagem_atual);
//  349         ultima_contagem = contagem_atual;
//  350         sprintf(buffer_linha,"F:%02dHz-RPM:%05d",frequencia,rotacao);
//  351         STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_ventilador[idioma],buffer_linha);        
//  352       }
//  353       else{        
//  354         sprintf(buffer_linha,"F:%02dHz-RPM:%05d",frequencia,rotacao);
//  355         STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
//  356       }
//  357     }
//  358     else{
//  359       sprintf(buffer_linha," SET RPM:%05d  ",contagem_atual);
??MTH_teste_ventilador_1:
        MOVS     R2,R5
        LDR.W    R1,??DataTable14_12
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  360       STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);            
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  361     }
//  362     
//  363     vTaskDelay(50);
??MTH_teste_ventilador_2:
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MTH_teste_ventilador_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_teste_ventilador_3
        BCC.N    ??MTH_teste_ventilador_4
        CMP      R0,#+3
        BEQ.N    ??MTH_teste_ventilador_5
        BCC.N    ??MTH_teste_ventilador_6
        CMP      R0,#+4
        BNE.N    ??MTH_teste_ventilador_4
??MTH_teste_ventilador_7:
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
??MTH_teste_ventilador_3:
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
        MOVS     R0,#+0
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
        ADD      SP,SP,#+24
          CFI CFA R13+24
        POP      {R4-R8,PC}       ;; return
          CFI CFA R13+48
??MTH_teste_ventilador_6:
        MOVW     R0,#+18000
        CMP      R5,R0
        BCS.N    ??MTH_teste_ventilador_8
        ADDS     R5,R5,#+100
??MTH_teste_ventilador_8:
        MOVW     R0,#+3000
          CFI FunCall BOARD_setter_general_purpose_counter
        BL       BOARD_setter_general_purpose_counter
        B.N      ??MTH_teste_ventilador_4
??MTH_teste_ventilador_5:
        CMP      R5,#+1000
        BLS.N    ??MTH_teste_ventilador_9
        SUBS     R5,R5,#+100
??MTH_teste_ventilador_9:
        MOVW     R0,#+3000
          CFI FunCall BOARD_setter_general_purpose_counter
        BL       BOARD_setter_general_purpose_counter
??MTH_teste_ventilador_4:
          CFI FunCall POTENCIA_getFrequenciaRede
        BL       POTENCIA_getFrequenciaRede
        MOVS     R7,R0
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        MOV      R8,R0
          CFI FunCall BOARD_getter_general_purpose_counter
        BL       BOARD_getter_general_purpose_counter
        CMP      R0,#+0
        BNE.N    ??MTH_teste_ventilador_1
        CMP      R5,R6
        BEQ.N    ??MTH_teste_ventilador_10
        MOVS     R0,R5
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
        MOVS     R6,R5
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R3,R8
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R2,R7
        LDR.W    R1,??DataTable14_13
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
        ADD      R2,SP,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_11
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_teste_ventilador_2
??MTH_teste_ventilador_10:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R3,R8
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R2,R7
        LDR.W    R1,??DataTable14_13
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_teste_ventilador_2
          CFI EndBlock cfiBlock6
//  364   }    
//  365 }
//  366 /***********************************************************************************
//  367 *       Descrição       :       Menu para testar a panela
//  368 *       Parametros      :       nenhum
//  369 *       Retorno         :       nenhum
//  370 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function MTH_teste_panela
        THUMB
//  371 void MTH_teste_panela(void){
MTH_teste_panela:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+24
          CFI CFA R13+40
//  372   eTECLA tecla;
//  373   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  374   char buffer_linha[17];
//  375   unsigned char flag=0;
        MOVS     R4,#+0
//  376   unsigned char trap=0;
        MOVS     R5,#+0
//  377   
//  378   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_panela[idioma],NULL);      
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable14_14
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  379   POTENCIA_setRPM(5000);  
        MOVW     R0,#+5000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
        B.N      ??MTH_teste_panela_0
//  380   
//  381   for(;;){
//  382     
//  383     tecla = TECLADO_getch();
//  384     switch(tecla){
//  385       case TECLA_ENTER:
//  386            trap ^= 255;
//  387            POTENCIA_set_neutro(trap);
//  388            break;
//  389       case TECLA_ESC:
//  390            POTENCIA_setRPM(0);
//  391            return;
//  392       case TECLA_INC:
//  393            flag = 1;
//  394            BOARD_setter_general_purpose_counter(3000);           
//  395            CT_set_temperatura(60);        
//  396            break;
//  397       case TECLA_DEC:
//  398            flag = 0;
??MTH_teste_panela_1:
        MOVS     R4,#+0
//  399            CT_set_temperatura(0);                
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  400            break;
//  401     }
//  402     
//  403     unsigned short int resistencia = AA_calculaResistorInteiro();
??MTH_teste_panela_2:
          CFI FunCall AA_calculaResistorInteiro
        BL       AA_calculaResistorInteiro
        MOVS     R6,R0
//  404     unsigned short int temperatura = AA_calculaTemperatura();
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        MOVS     R3,R0
//  405     
//  406     sprintf(buffer_linha,"%05dR-%03doC-R:%01d",resistencia,temperatura,flag);   
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R4,[SP, #+0]
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R2,R6
        LDR.W    R1,??DataTable14_15
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  407     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
??MTH_teste_panela_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_teste_panela_3
        BCC.N    ??MTH_teste_panela_2
        CMP      R0,#+3
        BEQ.N    ??MTH_teste_panela_1
        BCC.N    ??MTH_teste_panela_4
        CMP      R0,#+4
        BNE.N    ??MTH_teste_panela_2
??MTH_teste_panela_5:
        EORS     R5,R5,#0xFF
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
        B.N      ??MTH_teste_panela_2
??MTH_teste_panela_3:
        MOVS     R0,#+0
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
        ADD      SP,SP,#+24
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI CFA R13+40
??MTH_teste_panela_4:
        MOVS     R4,#+1
        MOVW     R0,#+3000
          CFI FunCall BOARD_setter_general_purpose_counter
        BL       BOARD_setter_general_purpose_counter
        MOVS     R0,#+60
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
        B.N      ??MTH_teste_panela_2
          CFI EndBlock cfiBlock7
//  408   }  
//  409 }
//  410 /***********************************************************************************
//  411 *       Descrição       :       Tela para testar o noteiro CCTALK
//  412 *       Parametros      :       nenhum
//  413 *       Retorno         :       nenhum
//  414 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function MTH_tela_teste_cctalk
        THUMB
//  415 void MTH_tela_teste_cctalk(void){
MTH_tela_teste_cctalk:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
//  416   eTECLA tecla;  
//  417   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  418   char buffer_linha[17];
//  419   
//  420   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_teste_BV20[idioma],NULL);      
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable14_16
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_tela_teste_cctalk_0
//  421   
//  422   for(;;){
//  423     
//  424     tecla = TECLADO_getch();
//  425     switch(tecla){
//  426       case TECLA_ENTER:
//  427            BV20_subtrai_valor_acumulado(BV20_get_valor_acumulador());
??MTH_tela_teste_cctalk_1:
          CFI FunCall BV20_get_valor_acumulador
        BL       BV20_get_valor_acumulador
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall BV20_subtrai_valor_acumulado
        BL       BV20_subtrai_valor_acumulado
//  428            break;
//  429       case TECLA_ESC:
//  430            return;
//  431     }
//  432     
//  433     sprintf(buffer_linha,"T=%04d-Ev=%1d",BV20_get_valor_acumulador(),BV20_get_ultimo_evento());
??MTH_tela_teste_cctalk_2:
          CFI FunCall BV20_get_ultimo_evento
        BL       BV20_get_ultimo_evento
        MOVS     R4,R0
          CFI FunCall BV20_get_valor_acumulador
        BL       BV20_get_valor_acumulador
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R3,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R2,R0
        LDR.W    R1,??DataTable14_17
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  434     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  435     
//  436     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MTH_tela_teste_cctalk_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_tela_teste_cctalk_3
        CMP      R0,#+4
        BEQ.N    ??MTH_tela_teste_cctalk_1
        B.N      ??MTH_tela_teste_cctalk_2
??MTH_tela_teste_cctalk_3:
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock8
//  437   }  
//  438 }
//  439 /***********************************************************************************
//  440 *       Descrição       :       Tela para testar o moedeiro tipo pulso
//  441 *       Parametros      :       nenhum
//  442 *       Retorno         :       nenhum
//  443 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function MTH_tela_teste_uca1
        THUMB
//  444 void MTH_tela_teste_uca1(void){
MTH_tela_teste_uca1:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
//  445   eTECLA tecla;
//  446   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  447   char buffer_linha[17];
//  448   unsigned char flag=0;
        MOVS     R4,#+0
//  449   
//  450   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_teste_uca1[idioma],NULL);     
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable14_18
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_tela_teste_uca1_0
//  451   
//  452   for(;;){
//  453     
//  454     tecla = TECLADO_getch();
//  455     switch(tecla){
//  456       case TECLA_ENTER:
//  457            PAGAMENTOS_subtrai_contagem_uca1(PAGAMENTOS_get_contagem_uca1());
//  458            break;
//  459       case TECLA_ESC:
//  460            return;
//  461       case TECLA_INC:
//  462            flag = 1;
//  463            break;
//  464       case TECLA_DEC:
//  465            flag = 0;
//  466            break;
//  467     }
//  468     
//  469     sprintf(buffer_linha,"%04d-[%s]",PAGAMENTOS_get_contagem_uca1(),flag?"LOCK  ":"UNLOK");
??MTH_tela_teste_uca1_1:
        LDR.W    R5,??DataTable14_19
??MTH_tela_teste_uca1_2:
          CFI FunCall PAGAMENTOS_get_contagem_uca1
        BL       PAGAMENTOS_get_contagem_uca1
        MOVS     R2,R0
        MOVS     R3,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR.W    R1,??DataTable14_20
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  470     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  471     
//  472     PAGAMENTOS_bloqueia_uca1(flag);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PAGAMENTOS_bloqueia_uca1
        BL       PAGAMENTOS_bloqueia_uca1
//  473     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MTH_tela_teste_uca1_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_tela_teste_uca1_3
        BCC.N    ??MTH_tela_teste_uca1_4
        CMP      R0,#+3
        BEQ.N    ??MTH_tela_teste_uca1_5
        BCC.N    ??MTH_tela_teste_uca1_6
        CMP      R0,#+4
        BNE.N    ??MTH_tela_teste_uca1_4
??MTH_tela_teste_uca1_7:
          CFI FunCall PAGAMENTOS_get_contagem_uca1
        BL       PAGAMENTOS_get_contagem_uca1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_subtrai_contagem_uca1
        BL       PAGAMENTOS_subtrai_contagem_uca1
        B.N      ??MTH_tela_teste_uca1_4
??MTH_tela_teste_uca1_3:
        ADD      SP,SP,#+20
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI CFA R13+32
??MTH_tela_teste_uca1_6:
        MOVS     R4,#+1
        B.N      ??MTH_tela_teste_uca1_4
??MTH_tela_teste_uca1_5:
        MOVS     R4,#+0
??MTH_tela_teste_uca1_4:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??MTH_tela_teste_uca1_1
        LDR.W    R5,??DataTable14_21
        B.N      ??MTH_tela_teste_uca1_2
          CFI EndBlock cfiBlock9
//  474   }  
//  475 }
//  476 /***********************************************************************************
//  477 *       Descrição       :       Tela para testar o noteiro pulso
//  478 *       Parametros      :       nenhum
//  479 *       Retorno         :       nenhum
//  480 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function MTH_tela_teste_p70
        THUMB
//  481 void MTH_tela_teste_p70(void){
MTH_tela_teste_p70:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
//  482   eTECLA tecla;
//  483   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  484   char buffer_linha[17];
//  485   unsigned char flag=0;
        MOVS     R4,#+0
//  486   
//  487   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_teste_P70[idioma],NULL);     
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable14_22
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_tela_teste_p70_0
//  488   
//  489   for(;;){
//  490     
//  491     tecla = TECLADO_getch();
//  492     switch(tecla){
//  493       case TECLA_ENTER:
//  494            PAGAMENTOS_subtrai_contagem_p70(PAGAMENTOS_get_contagem_p70());
//  495            break;
//  496       case TECLA_ESC:
//  497            return;
//  498       case TECLA_INC:
//  499            flag = 1;
//  500            break;
//  501       case TECLA_DEC:
//  502            flag = 0;
//  503            break;
//  504     }
//  505     
//  506     sprintf(buffer_linha,"%04d-[%s]",PAGAMENTOS_get_contagem_p70(),flag?"LOCK  ":"UNLOK");
??MTH_tela_teste_p70_1:
        LDR.N    R5,??DataTable14_19
??MTH_tela_teste_p70_2:
          CFI FunCall PAGAMENTOS_get_contagem_p70
        BL       PAGAMENTOS_get_contagem_p70
        MOVS     R2,R0
        MOVS     R3,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR.N    R1,??DataTable14_20
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  507     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  508     
//  509     PAGAMENTOS_set_inhibit_p70(flag);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PAGAMENTOS_set_inhibit_p70
        BL       PAGAMENTOS_set_inhibit_p70
//  510     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MTH_tela_teste_p70_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_tela_teste_p70_3
        BCC.N    ??MTH_tela_teste_p70_4
        CMP      R0,#+3
        BEQ.N    ??MTH_tela_teste_p70_5
        BCC.N    ??MTH_tela_teste_p70_6
        CMP      R0,#+4
        BNE.N    ??MTH_tela_teste_p70_4
??MTH_tela_teste_p70_7:
          CFI FunCall PAGAMENTOS_get_contagem_p70
        BL       PAGAMENTOS_get_contagem_p70
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_subtrai_contagem_p70
        BL       PAGAMENTOS_subtrai_contagem_p70
        B.N      ??MTH_tela_teste_p70_4
??MTH_tela_teste_p70_3:
        ADD      SP,SP,#+20
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI CFA R13+32
??MTH_tela_teste_p70_6:
        MOVS     R4,#+1
        B.N      ??MTH_tela_teste_p70_4
??MTH_tela_teste_p70_5:
        MOVS     R4,#+0
??MTH_tela_teste_p70_4:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??MTH_tela_teste_p70_1
        LDR.N    R5,??DataTable14_21
        B.N      ??MTH_tela_teste_p70_2
          CFI EndBlock cfiBlock10
//  511   }  
//  512 }
//  513 /***********************************************************************************
//  514 *       Descrição       :       Tela para o teste dos leds da placa
//  515 *                               de instrução
//  516 *       Parametros      :       nenhum
//  517 *       Retorno         :       nenhum
//  518 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function MTH_tela_placa_instrucao
        THUMB
//  519 void MTH_tela_placa_instrucao(void){
MTH_tela_placa_instrucao:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
//  520   eTECLA tecla;
//  521   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  522   char buffer_linha[17];
//  523   unsigned char indice=0;
        MOVS     R4,#+0
//  524   
//  525   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_teste_led_instrucao[idioma],NULL);    
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable14_23
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_tela_placa_instrucao_0
//  526   
//  527   for(;;){
//  528     
//  529     tecla = TECLADO_getch();
//  530     switch(tecla){
//  531       case TECLA_ENTER:
//  532            break;
//  533       case TECLA_ESC:
//  534            return;
//  535       case TECLA_INC: 
//  536            for(unsigned char i=0;i<8;i++)
//  537              LEDS_setter_led(i,0);
//  538            indice = (indice+1) % 8;
//  539            LEDS_setter_led(indice,1);
//  540            break;
//  541       case TECLA_DEC:
//  542            for(unsigned char i=0;i<8;i++)
//  543              LEDS_setter_led(i,0);   
//  544            if(indice)
//  545              indice = 7;
//  546            else
//  547              indice--;
??MTH_tela_placa_instrucao_1:
        SUBS     R4,R4,#+1
//  548            LEDS_setter_led(indice,1);
??MTH_tela_placa_instrucao_2:
        MOVS     R1,#+1
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  549            break;
//  550     }
//  551     
//  552     sprintf(buffer_linha,"LED:[%01d]",indice);
??MTH_tela_placa_instrucao_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,R4
        LDR.N    R1,??DataTable14_24
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  553     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  554             
//  555     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MTH_tela_placa_instrucao_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_tela_placa_instrucao_4
        BCC.N    ??MTH_tela_placa_instrucao_3
        CMP      R0,#+3
        BEQ.N    ??MTH_tela_placa_instrucao_5
        BCC.N    ??MTH_tela_placa_instrucao_6
        CMP      R0,#+4
        BNE.N    ??MTH_tela_placa_instrucao_3
??MTH_tela_placa_instrucao_7:
        B.N      ??MTH_tela_placa_instrucao_3
??MTH_tela_placa_instrucao_4:
        ADD      SP,SP,#+20
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI CFA R13+32
??MTH_tela_placa_instrucao_6:
        MOVS     R5,#+0
        B.N      ??MTH_tela_placa_instrucao_8
??MTH_tela_placa_instrucao_9:
        MOVS     R1,#+0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        ADDS     R5,R5,#+1
??MTH_tela_placa_instrucao_8:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BLT.N    ??MTH_tela_placa_instrucao_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+1
        MOVS     R1,#+8
        SDIV     R4,R0,R1
        MLS      R4,R4,R1,R0
        MOVS     R1,#+1
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        B.N      ??MTH_tela_placa_instrucao_3
??MTH_tela_placa_instrucao_5:
        MOVS     R5,#+0
        B.N      ??MTH_tela_placa_instrucao_10
??MTH_tela_placa_instrucao_11:
        MOVS     R1,#+0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
        ADDS     R5,R5,#+1
??MTH_tela_placa_instrucao_10:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BLT.N    ??MTH_tela_placa_instrucao_11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??MTH_tela_placa_instrucao_1
        MOVS     R4,#+7
        B.N      ??MTH_tela_placa_instrucao_2
          CFI EndBlock cfiBlock11
//  556   }
//  557 }
//  558 /***********************************************************************************
//  559 *       Descrição       :       Menu para teste do LCD externo
//  560 *       Parametros      :       nenhum
//  561 *       Retorno         :       nenhum
//  562 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function MTH_tela_teste_lcd_externo
        THUMB
//  563 void MTH_tela_teste_lcd_externo(void){
MTH_tela_teste_lcd_externo:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+24
          CFI CFA R13+40
//  564   eTECLA tecla;
//  565   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  566   char buffer_linha[17]={0};
        ADD      R0,SP,#+0
        MOVS     R1,#+20
          CFI FunCall __aeabi_memclr4
        BL       __aeabi_memclr4
//  567   char first=' ';
        MOVS     R5,#+32
//  568   unsigned char ciclos=1;
        MOVS     R6,#+1
//  569     
//  570   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_lcd_externo[idioma],NULL);    
        MOVS     R2,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable14_25
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_tela_teste_lcd_externo_0
//  571   
//  572   for(;;){
//  573    
//  574     tecla = TECLADO_getch();
//  575     switch(tecla){
//  576       case TECLA_ENTER:
//  577            break;
//  578       case TECLA_ESC:
//  579            return;
//  580       case TECLA_INC:
//  581            break;
//  582       case TECLA_DEC:
//  583            break;
//  584     }       
//  585     
//  586     for(unsigned char i=0;i<16;i++)
//  587       buffer_linha[i] = first;
??MTH_tela_teste_lcd_externo_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+0
        STRB     R5,[R0, R1]
        ADDS     R0,R0,#+1
??MTH_tela_teste_lcd_externo_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BLT.N    ??MTH_tela_teste_lcd_externo_1
//  588         
//  589     STRING_write_to_external(NO_CLEAR,buffer_linha,buffer_linha);
        ADD      R2,SP,#+0
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  590     
//  591     if(!--ciclos){
        SUBS     R6,R6,#+1
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??MTH_tela_teste_lcd_externo_3
//  592       ciclos = 10;
        MOVS     R6,#+10
//  593       first++;      
        ADDS     R5,R5,#+1
//  594     }
//  595     
//  596     vTaskDelay(50);    
??MTH_tela_teste_lcd_externo_3:
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MTH_tela_teste_lcd_externo_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_tela_teste_lcd_externo_4
        BCC.N    ??MTH_tela_teste_lcd_externo_5
        CMP      R0,#+3
        BEQ.N    ??MTH_tela_teste_lcd_externo_6
        BCC.N    ??MTH_tela_teste_lcd_externo_7
        CMP      R0,#+4
        BNE.N    ??MTH_tela_teste_lcd_externo_5
??MTH_tela_teste_lcd_externo_8:
        B.N      ??MTH_tela_teste_lcd_externo_5
??MTH_tela_teste_lcd_externo_4:
        ADD      SP,SP,#+24
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI CFA R13+40
??MTH_tela_teste_lcd_externo_7:
        B.N      ??MTH_tela_teste_lcd_externo_5
??MTH_tela_teste_lcd_externo_6:
??MTH_tela_teste_lcd_externo_5:
        MOVS     R0,#+0
        B.N      ??MTH_tela_teste_lcd_externo_2
          CFI EndBlock cfiBlock12
//  597   }  
//  598 }
//  599 /***********************************************************************************
//  600 *       Descrição       :       Tela para realizar o teste da impressora
//  601 *       Parametros      :       nenhum
//  602 *       Retorno         :       nenhum
//  603 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function MTH_tela_teste_impressora
        THUMB
//  604 void MTH_tela_teste_impressora(void){
MTH_tela_teste_impressora:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  605   eTECLA tecla;
//  606   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  607 
//  608   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_impresora[idioma][0],(char*)STRING_titulo_teste_impresora[idioma][1]);      
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable14_26
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable14_26
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_tela_teste_impressora_0
//  609   
//  610   for(;;){
//  611     
//  612     tecla = TECLADO_getch();
//  613     switch(tecla){
//  614       case TECLA_ENTER:
//  615            STRING_write_to_internal(NO_CLEAR,NULL,"      ...       ");
//  616            IMPRESSORA_impressora_teste();
//  617            STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_titulo_teste_impresora[idioma][1]);               
//  618            break;
//  619       case TECLA_ESC:
//  620            return;
//  621       case TECLA_INC:
//  622            break;
//  623       case TECLA_DEC:
//  624            break;
//  625     }       
//  626     
//  627     vTaskDelay(50);
??MTH_tela_teste_impressora_1:
??MTH_tela_teste_impressora_2:
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MTH_tela_teste_impressora_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_tela_teste_impressora_3
        BCC.N    ??MTH_tela_teste_impressora_2
        CMP      R0,#+3
        BEQ.N    ??MTH_tela_teste_impressora_1
        BCC.N    ??MTH_tela_teste_impressora_4
        CMP      R0,#+4
        BNE.N    ??MTH_tela_teste_impressora_2
??MTH_tela_teste_impressora_5:
        LDR.N    R2,??DataTable14_27
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
          CFI FunCall IMPRESSORA_impressora_teste
        BL       IMPRESSORA_impressora_teste
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable14_26
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_tela_teste_impressora_2
??MTH_tela_teste_impressora_3:
        POP      {R4,PC}          ;; return
??MTH_tela_teste_impressora_4:
        B.N      ??MTH_tela_teste_impressora_2
          CFI EndBlock cfiBlock13
//  628   }  
//  629 }
//  630 /***********************************************************************************
//  631 *       Descrição       :       Interface para teste da música
//  632 *       Parametros      :       nenhum
//  633 *       Retorno         :       nenhum
//  634 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function MTH_teste_musica
        THUMB
//  635 void MTH_teste_musica(void){
MTH_teste_musica:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
//  636   eTECLA tecla;
//  637   char buffer_linha[17];
//  638   unsigned char idioma = APLICACAO_carrega_idioma();    
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  639   unsigned char flag=0;
        MOVS     R4,#+0
//  640   
//  641   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_menu_teste_musica[idioma],NULL);
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable14_28
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_teste_musica_0
//  642       
//  643   for(;;){
//  644             
//  645     tecla = TECLADO_getch();
//  646     switch(tecla){
//  647       case TECLA_ENTER:
//  648            flag ^= 0xFF;
//  649            break;
//  650       case TECLA_ESC:
//  651            PLAYER_interrompeMusica();
//  652            return;
//  653     }
//  654     
//  655     if(!flag && !PLAYERWAVE_verificaToque()){
//  656        PLAYERWAVE_iniciaMusica(1,0); 
//  657     }
//  658     
//  659     sprintf(buffer_linha,"[%s]",PLAYERWAVE_verificaToque()?"PLAY":"STOP");
??MTH_teste_musica_1:
        LDR.N    R2,??DataTable14_29
??MTH_teste_musica_2:
        LDR.N    R1,??DataTable14_30
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  660     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);    
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
??MTH_teste_musica_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_teste_musica_3
        CMP      R0,#+4
        BNE.N    ??MTH_teste_musica_4
??MTH_teste_musica_5:
        EORS     R4,R4,#0xFF
??MTH_teste_musica_4:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??MTH_teste_musica_6
          CFI FunCall PLAYERWAVE_verificaToque
        BL       PLAYERWAVE_verificaToque
        CMP      R0,#+0
        BNE.N    ??MTH_teste_musica_6
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall PLAYERWAVE_iniciaMusica
        BL       PLAYERWAVE_iniciaMusica
??MTH_teste_musica_6:
          CFI FunCall PLAYERWAVE_verificaToque
        BL       PLAYERWAVE_verificaToque
        CMP      R0,#+0
        BEQ.N    ??MTH_teste_musica_1
        LDR.N    R2,??DataTable14_31
        B.N      ??MTH_teste_musica_2
??MTH_teste_musica_3:
          CFI FunCall PLAYER_interrompeMusica
        BL       PLAYER_interrompeMusica
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock14
//  661   }
//  662 }
//  663 /***********************************************************************************
//  664 *       Descrição       :       Interface para realizar o teste das
//  665 *                               locuções
//  666 *       Parametros      :       nenhum
//  667 *       Retorno         :       nenhum
//  668 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function MTH_teste_locucoes
        THUMB
//  669 void MTH_teste_locucoes(void){
MTH_teste_locucoes:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+28
          CFI CFA R13+40
//  670   eTECLA tecla;
//  671   unsigned char idioma = APLICACAO_carrega_idioma();    
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  672   char buffer_linha[17];
//  673   const char toques[3]={0,2,3};
        ADD      R1,SP,#+0
        LDR.N    R2,??DataTable14_32
        LDR      R3,[R2, #0]
        STR      R3,[R1, #+0]
//  674   unsigned char indice=0;
        MOVS     R4,#+0
//  675   unsigned char flag=0;
        MOVS     R5,#+0
//  676   
//  677   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_menu_teste_vozes[idioma],NULL);
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable14_33
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_teste_locucoes_0
//  678   for(;;){
//  679     
//  680     tecla = TECLADO_getch();
//  681     switch(tecla){
//  682       case TECLA_ENTER:
//  683            flag^= 0xFF;
//  684            break;
//  685       case TECLA_ESC:
//  686            PLAYER_interrompeMusica();
//  687            return;
//  688     }
//  689     
//  690     if(flag && !PLAYERWAVE_verificaToque()){      
//  691       PLAYERWAVE_iniciaMusica(toques[indice],0);  
//  692       indice = (indice+1) % 3;
//  693     }
//  694     
//  695     sprintf(buffer_linha,"[%s][i:%01d]",PLAYERWAVE_verificaToque()?"PLAY":"STOP",indice+1);
??MTH_teste_locucoes_1:
        LDR.N    R2,??DataTable14_29
??MTH_teste_locucoes_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R3,R4,#+1
        LDR.N    R1,??DataTable14_34
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  696     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);        
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
??MTH_teste_locucoes_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MTH_teste_locucoes_3
        CMP      R0,#+4
        BNE.N    ??MTH_teste_locucoes_4
??MTH_teste_locucoes_5:
        EORS     R5,R5,#0xFF
??MTH_teste_locucoes_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??MTH_teste_locucoes_6
          CFI FunCall PLAYERWAVE_verificaToque
        BL       PLAYERWAVE_verificaToque
        CMP      R0,#+0
        BNE.N    ??MTH_teste_locucoes_6
        MOVS     R1,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R4, R0]
          CFI FunCall PLAYERWAVE_iniciaMusica
        BL       PLAYERWAVE_iniciaMusica
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+1
        MOVS     R1,#+3
        SDIV     R2,R0,R1
        MLS      R4,R1,R2,R0
??MTH_teste_locucoes_6:
          CFI FunCall PLAYERWAVE_verificaToque
        BL       PLAYERWAVE_verificaToque
        CMP      R0,#+0
        BEQ.N    ??MTH_teste_locucoes_1
        LDR.N    R2,??DataTable14_31
        B.N      ??MTH_teste_locucoes_2
??MTH_teste_locucoes_3:
          CFI FunCall PLAYER_interrompeMusica
        BL       PLAYER_interrompeMusica
        ADD      SP,SP,#+28
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock15
//  697   }  
//  698 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     MTH_funcs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     STRING_menu_teste_hardware

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_2:
        DC32     STRING_titulo_teste_hardware

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_3:
        DC32     STRING_teste_rtc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_4:
        DC32     `?<Constant "%02d:%02d:%02d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_5:
        DC32     STRING_teste_data_flash

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_6:
        DC32     STRING_tela_teste_dispensador_papel

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_7:
        DC32     `?<Constant "BP:%01d-NP:%03d-RP:%1d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_8:
        DC32     STRING_tela_teste_dosador

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_9:
        DC32     STRING_texto_teste_motor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_10:
        DC32     `?<Constant "SD:%01d - M:%s">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_11:
        DC32     STRING_teste_ventilador

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_12:
        DC32     `?<Constant " SET RPM:%05d  ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_13:
        DC32     `?<Constant "F:%02dHz-RPM:%05d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_14:
        DC32     STRING_teste_panela

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_15:
        DC32     `?<Constant "%05dR-%03doC-R:%01d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_16:
        DC32     STRING_mensagem_teste_BV20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_17:
        DC32     `?<Constant "T=%04d-Ev=%1d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_18:
        DC32     STRING_mensagem_teste_uca1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_19:
        DC32     `?<Constant "UNLOK">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_20:
        DC32     `?<Constant "%04d-[%s]">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_21:
        DC32     `?<Constant "LOCK  ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_22:
        DC32     STRING_mensagem_teste_P70

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_23:
        DC32     STRING_mensagem_teste_led_instrucao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_24:
        DC32     `?<Constant "LED:[%01d]">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_25:
        DC32     STRING_titulo_teste_lcd_externo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_26:
        DC32     STRING_titulo_teste_impresora

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_27:
        DC32     `?<Constant "      ...       ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_28:
        DC32     STRING_titulo_menu_teste_musica

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_29:
        DC32     `?<Constant "STOP">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_30:
        DC32     `?<Constant "[%s]">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_31:
        DC32     `?<Constant "PLAY">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_32:
        DC32     `?<Constant {0, 2, 3}>`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_33:
        DC32     STRING_titulo_menu_teste_vozes

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_34:
        DC32     `?<Constant "[%s][i:%01d]">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  699 /***********************************************************************************
//  700 *       Fim do arquivo
//  701 ***********************************************************************************/
// 
//   316 bytes in section .rodata
// 2 118 bytes in section .text
// 
// 2 118 bytes of CODE  memory
//   316 bytes of CONST memory
//
//Errors: none
//Warnings: none
