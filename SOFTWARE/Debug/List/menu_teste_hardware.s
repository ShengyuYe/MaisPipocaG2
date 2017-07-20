///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  11:08:00 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_teste_hardware.c         /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_teste_hardware.c -lC     /
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
//                    pocaG2\SOFTWARE\Debug\List\menu_teste_hardware.s        /
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
        EXTERN RTC_setValue
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
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Aplicacao\menu_teste_hardware.c
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
//  135            RTC_setValue(23,59,30,0,0,0);
//  136            break;
//  137       case TECLA_DEC:
//  138            RTC_setValue(0,0,0,0,0,0);
??MTH_teste_rtc_1:
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall RTC_setValue
        BL       RTC_setValue
//  139            break;
//  140     }
//  141     
//  142     RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);    
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
//  143     sprintf(buffer_linha,"%02d:%02d:%02d",hora,minuto,segundo);
        LDRB     R0,[SP, #+8]
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+9]
        LDRB     R2,[SP, #+10]
        LDR.W    R1,??DataTable14_4
        ADD      R0,SP,#+20
          CFI FunCall sprintf
        BL       sprintf
//  144     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+20
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  145     
//  146     vTaskDelay(50);
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
        BCC.N    ??MTH_teste_rtc_4
        CMP      R0,#+4
        BNE.N    ??MTH_teste_rtc_2
??MTH_teste_rtc_5:
        B.N      ??MTH_teste_rtc_2
??MTH_teste_rtc_3:
        ADD      SP,SP,#+44
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI CFA R13+48
??MTH_teste_rtc_4:
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+30
        MOVS     R1,#+59
        MOVS     R0,#+23
          CFI FunCall RTC_setValue
        BL       RTC_setValue
        B.N      ??MTH_teste_rtc_2
          CFI EndBlock cfiBlock1
//  147   }    
//  148 }
//  149 /***********************************************************************************
//  150 *       Descrição       :       Executa um passo no teste da memória dataflash
//  151 *       Parametros      :       (unsigned char) passo atual
//  152 *       Retorno         :       (unsigned char) novo passo
//  153 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MTH_passo_teste_data_flash
          CFI NoCalls
        THUMB
//  154 unsigned char MTH_passo_teste_data_flash(unsigned char idioma,unsigned char passo){  
//  155   /*
//  156   unsigned char buffer[64];
//  157   
//  158   switch(passo){
//  159     case 0:
//  160             STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_passos_teste_dataflash[idioma][0]);
//  161             for(unsigned char i=0;i<64;i++)
//  162               buffer[i] = i;
//  163             MEMORYWRAPPER_writeBytes(ADR_AREA_TESTE,buffer,64);
//  164             passo = 1;
//  165             break;
//  166     case 1:
//  167             STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_passos_teste_dataflash[idioma][1]);
//  168             MEMORYWRAPPER_readBytes(ADR_AREA_TESTE,buffer,64);
//  169             passo = 2;
//  170             for(unsigned char i=0;i<64;i++)
//  171               if(buffer[i]!=i)
//  172                 passo = 3;
//  173             break;
//  174     case 2:
//  175             STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_passos_teste_dataflash[idioma][2]);
//  176             passo = 0;
//  177             break;
//  178     case 3:
//  179             STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_passos_teste_dataflash[idioma][3]);
//  180             passo = 0;
//  181             break;
//  182   }
//  183   
//  184   return passo;
//  185   */
//  186   return 0;
MTH_passo_teste_data_flash:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  187 }
//  188 /***********************************************************************************
//  189 *       Descrição       :       Faz  o teste da memória flash
//  190 *       Parametros      :       nenhum
//  191 *       Retorno         :       nenhum
//  192 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MTH_teste_data_flash
        THUMB
//  193 void MTH_teste_data_flash(void){
MTH_teste_data_flash:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//  194   eTECLA tecla;
//  195   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  196   unsigned char tempo=1;
        MOVS     R5,#+1
//  197   unsigned char passo=0;
        MOVS     R6,#+0
//  198 
//  199   srand(100);  
        MOVS     R0,#+100
          CFI FunCall srand
        BL       srand
//  200   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_data_flash[idioma],NULL);  
        MOVS     R2,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_5
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_teste_data_flash_0
//  201   for(;;){
//  202     
//  203     tecla = TECLADO_getch();
//  204     switch(tecla){
//  205       case TECLA_ENTER:        
//  206            break;
//  207       case TECLA_ESC:
//  208            return;
//  209       case TECLA_INC:
//  210            break;
//  211       case TECLA_DEC:
//  212            break;
//  213     }
//  214     
//  215     // 
//  216     //  Executa o teste
//  217     //
//  218     if(!--tempo){
??MTH_teste_data_flash_1:
??MTH_teste_data_flash_2:
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??MTH_teste_data_flash_3
//  219       tempo = 10;      
        MOVS     R5,#+10
//  220       passo = MTH_passo_teste_data_flash(idioma,passo);      
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall MTH_passo_teste_data_flash
        BL       MTH_passo_teste_data_flash
        MOVS     R6,R0
//  221     }    
//  222     
//  223     vTaskDelay(50);
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
//  224   }    
//  225 }
//  226 /***********************************************************************************
//  227 *       Descrição       :       Teste do controle do dispensador de
//  228 *                               embalagem
//  229 *       Parametros      :       nenhum
//  230 *       Retorno         :       nenhum
//  231 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MTH_teste_dispensador_papel
        THUMB
//  232 void MTH_teste_dispensador_papel(void){
MTH_teste_dispensador_papel:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+28
          CFI CFA R13+40
//  233   eTECLA tecla;
//  234   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  235   char buffer_linha[17];
//  236 
//  237   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_tela_teste_dispensador_papel[idioma],NULL);  
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable14_6
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_teste_dispensador_papel_0
//  238   for(;;){
//  239     
//  240     tecla = TECLADO_getch();
//  241     switch(tecla){
//  242       case TECLA_ENTER:
//  243            break;
//  244       case TECLA_ESC:
//  245            return;
//  246       case TECLA_INC:
//  247            BOARD_set_motor_embalagem(1);
//  248            break;
//  249       case TECLA_DEC:
//  250            BOARD_set_motor_embalagem(0);
//  251            break;
//  252     }
//  253     
//  254     unsigned char barreira = GET_BARREIRA_SAIDA_PAPEL();
//  255     unsigned int nivelPapel = AA_mediaMovelPapel();
//  256     unsigned char reserva = GET_SENSOR_RESERVA_PAPEL();
//  257     
//  258     nivelPapel *= 100;
//  259     nivelPapel>>= 12;
//  260     
//  261     sprintf(buffer_linha,"BP:%01d-NP:%03d-RP:%1d",barreira==BARREIRA_PAPEL_LIVRE?0:1,nivelPapel,reserva?1:0);
??MTH_teste_dispensador_papel_1:
        MOVS     R2,#+1
??MTH_teste_dispensador_papel_2:
        STR      R0,[SP, #+0]
        MOVS     R3,R4
        LDR.W    R1,??DataTable14_7
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  262     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  263     
//  264     vTaskDelay(50);
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
//  265   }    
//  266 }
//  267 /***********************************************************************************
//  268 *       Descriçao       :       Teste do dosador do milho
//  269 *       Parametros      :       nenhum
//  270 *       Retorno         :       nenhum
//  271 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MTH_teste_dosador_milho
        THUMB
//  272 void MTH_teste_dosador_milho(void){
MTH_teste_dosador_milho:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
//  273   eTECLA tecla;  
//  274   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  275   char buffer_linha[17];
//  276   eMOTOR_DOSE estado=PARADO;
        MOVS     R5,#+0
//  277     
//  278   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_tela_teste_dosador[idioma],NULL);    
        MOVS     R2,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_8
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_teste_dosador_milho_0
//  279   
//  280   for(;;){
//  281     
//  282     tecla = TECLADO_getch();
//  283     switch(tecla){
//  284       case TECLA_ENTER:
//  285            BOARD_set_motor_dose(PARADO);
//  286            estado = PARADO;        
//  287            break;
//  288       case TECLA_ESC:
//  289            return;
//  290       case TECLA_INC:
//  291            BOARD_set_motor_dose(DOSAR);
//  292            estado = DOSAR;
//  293            break;
//  294       case TECLA_DEC:
//  295            BOARD_set_motor_dose(REVERTER);
??MTH_teste_dosador_milho_1:
        MOVS     R0,#+2
          CFI FunCall BOARD_set_motor_dose
        BL       BOARD_set_motor_dose
//  296            estado = REVERTER;
        MOVS     R5,#+2
//  297            break;
//  298     }
//  299    
//  300     unsigned char sensor_dose = GET_SENSOR_DOSE();
??MTH_teste_dosador_milho_2:
        MOVS     R0,#+2
          CFI FunCall BOARD_get_sinal
        BL       BOARD_get_sinal
        MOVS     R2,R0
//  301     sprintf(buffer_linha,"SD:%01d - M:%s",sensor_dose,STRING_texto_teste_motor[idioma][estado]);
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
//  302     
//  303     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);    
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  304     vTaskDelay(50);
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
//  305   }   
//  306 }
//  307 /***********************************************************************************
//  308 *       Descrição       :       Teste de controle do motor AC
//  309 *       Parametros      :       nenhum
//  310 *       Retorno         :       nenhum
//  311 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MTH_teste_ventilador
        THUMB
//  312 void MTH_teste_ventilador(void){
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
//  313   eTECLA tecla;  
//  314   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  315   char buffer_linha[17];
//  316   unsigned int contagem_atual=4000;
        MOV      R5,#+4000
//  317   unsigned int ultima_contagem=4000;
        MOV      R6,#+4000
//  318     
//  319   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_ventilador[idioma],NULL);      
        MOVS     R2,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable14_11
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  320   POTENCIA_set_neutro(1);
        MOVS     R0,#+1
          CFI FunCall POTENCIA_set_neutro
        BL       POTENCIA_set_neutro
//  321   BOARD_setter_general_purpose_counter(0);
        MOVS     R0,#+0
          CFI FunCall BOARD_setter_general_purpose_counter
        BL       BOARD_setter_general_purpose_counter
        B.N      ??MTH_teste_ventilador_0
//  322   
//  323   for(;;){
//  324     
//  325     tecla = TECLADO_getch();
//  326     switch(tecla){
//  327       case TECLA_ENTER:
//  328            POTENCIA_setRPM(0);
//  329       case TECLA_ESC:
//  330            POTENCIA_setRPM(0);        
//  331            POTENCIA_set_neutro(0);
//  332            return;
//  333       case TECLA_INC:
//  334            if(contagem_atual<18000)
//  335              contagem_atual+=100;
//  336            BOARD_setter_general_purpose_counter(3000);
//  337            break;
//  338       case TECLA_DEC:
//  339            if(contagem_atual>1000)
//  340              contagem_atual-=100;
//  341            BOARD_setter_general_purpose_counter(3000);
//  342            break;
//  343     }
//  344     
//  345     unsigned short int frequencia=POTENCIA_getFrequenciaRede();
//  346     unsigned short int rotacao = POTENCIA_getRPMmedido();
//  347     
//  348     if(!BOARD_getter_general_purpose_counter()){
//  349       
//  350       if(contagem_atual!=ultima_contagem){
//  351         POTENCIA_setRPM(contagem_atual);
//  352         ultima_contagem = contagem_atual;
//  353         sprintf(buffer_linha,"F:%02dHz-RPM:%05d",frequencia,rotacao);
//  354         STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_ventilador[idioma],buffer_linha);        
//  355       }
//  356       else{        
//  357         sprintf(buffer_linha,"F:%02dHz-RPM:%05d",frequencia,rotacao);
//  358         STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
//  359       }
//  360     }
//  361     else{
//  362       sprintf(buffer_linha," SET RPM:%05d  ",contagem_atual);
??MTH_teste_ventilador_1:
        MOVS     R2,R5
        LDR.W    R1,??DataTable14_12
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  363       STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);            
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  364     }
//  365     
//  366     vTaskDelay(50);
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
//  367   }    
//  368 }
//  369 /***********************************************************************************
//  370 *       Descrição       :       Menu para testar a panela
//  371 *       Parametros      :       nenhum
//  372 *       Retorno         :       nenhum
//  373 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function MTH_teste_panela
        THUMB
//  374 void MTH_teste_panela(void){
MTH_teste_panela:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+24
          CFI CFA R13+40
//  375   eTECLA tecla;
//  376   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  377   char buffer_linha[17];
//  378   unsigned char flag=0;
        MOVS     R4,#+0
//  379   unsigned char trap=0;
        MOVS     R5,#+0
//  380   
//  381   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_teste_panela[idioma],NULL);      
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable14_14
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  382   POTENCIA_setRPM(5000);  
        MOVW     R0,#+5000
          CFI FunCall POTENCIA_setRPM
        BL       POTENCIA_setRPM
        B.N      ??MTH_teste_panela_0
//  383   
//  384   for(;;){
//  385     
//  386     tecla = TECLADO_getch();
//  387     switch(tecla){
//  388       case TECLA_ENTER:
//  389            trap ^= 255;
//  390            POTENCIA_set_neutro(trap);
//  391            break;
//  392       case TECLA_ESC:
//  393            POTENCIA_setRPM(0);
//  394            return;
//  395       case TECLA_INC:
//  396            flag = 1;
//  397            BOARD_setter_general_purpose_counter(3000);           
//  398            CT_set_temperatura(60);        
//  399            break;
//  400       case TECLA_DEC:
//  401            flag = 0;
??MTH_teste_panela_1:
        MOVS     R4,#+0
//  402            CT_set_temperatura(0);                
        MOVS     R0,#+0
          CFI FunCall CT_set_temperatura
        BL       CT_set_temperatura
//  403            break;
//  404     }
//  405     
//  406     unsigned short int resistencia = AA_calculaResistorInteiro();
??MTH_teste_panela_2:
          CFI FunCall AA_calculaResistorInteiro
        BL       AA_calculaResistorInteiro
        MOVS     R6,R0
//  407     unsigned short int temperatura = AA_calculaTemperatura();
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        MOVS     R3,R0
//  408     
//  409     sprintf(buffer_linha,"%05dR-%03doC-R:%01d",resistencia,temperatura,flag);   
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R4,[SP, #+0]
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R2,R6
        LDR.W    R1,??DataTable14_15
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  410     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
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
//  411   }  
//  412 }
//  413 /***********************************************************************************
//  414 *       Descrição       :       Tela para testar o noteiro CCTALK
//  415 *       Parametros      :       nenhum
//  416 *       Retorno         :       nenhum
//  417 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function MTH_tela_teste_cctalk
        THUMB
//  418 void MTH_tela_teste_cctalk(void){
MTH_tela_teste_cctalk:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
//  419   eTECLA tecla;  
//  420   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  421   char buffer_linha[17];
//  422   
//  423   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_teste_BV20[idioma],NULL);      
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable14_16
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_tela_teste_cctalk_0
//  424   
//  425   for(;;){
//  426     
//  427     tecla = TECLADO_getch();
//  428     switch(tecla){
//  429       case TECLA_ENTER:
//  430            BV20_subtrai_valor_acumulado(BV20_get_valor_acumulador());
??MTH_tela_teste_cctalk_1:
          CFI FunCall BV20_get_valor_acumulador
        BL       BV20_get_valor_acumulador
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall BV20_subtrai_valor_acumulado
        BL       BV20_subtrai_valor_acumulado
//  431            break;
//  432       case TECLA_ESC:
//  433            return;
//  434     }
//  435     
//  436     sprintf(buffer_linha,"T=%04d-Ev=%1d",BV20_get_valor_acumulador(),BV20_get_ultimo_evento());
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
//  437     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  438     
//  439     vTaskDelay(50);
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
//  440   }  
//  441 }
//  442 /***********************************************************************************
//  443 *       Descrição       :       Tela para testar o moedeiro tipo pulso
//  444 *       Parametros      :       nenhum
//  445 *       Retorno         :       nenhum
//  446 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function MTH_tela_teste_uca1
        THUMB
//  447 void MTH_tela_teste_uca1(void){
MTH_tela_teste_uca1:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
//  448   eTECLA tecla;
//  449   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  450   char buffer_linha[17];
//  451   unsigned char flag=0;
        MOVS     R4,#+0
//  452   
//  453   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_teste_uca1[idioma],NULL);     
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable14_18
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_tela_teste_uca1_0
//  454   
//  455   for(;;){
//  456     
//  457     tecla = TECLADO_getch();
//  458     switch(tecla){
//  459       case TECLA_ENTER:
//  460            PAGAMENTOS_subtrai_contagem_uca1(PAGAMENTOS_get_contagem_uca1());
//  461            break;
//  462       case TECLA_ESC:
//  463            return;
//  464       case TECLA_INC:
//  465            flag = 1;
//  466            break;
//  467       case TECLA_DEC:
//  468            flag = 0;
//  469            break;
//  470     }
//  471     
//  472     sprintf(buffer_linha,"%04d-[%s]",PAGAMENTOS_get_contagem_uca1(),flag?"LOCK  ":"UNLOK");
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
//  473     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  474     
//  475     PAGAMENTOS_bloqueia_uca1(flag);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PAGAMENTOS_bloqueia_uca1
        BL       PAGAMENTOS_bloqueia_uca1
//  476     vTaskDelay(50);
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
//  477   }  
//  478 }
//  479 /***********************************************************************************
//  480 *       Descrição       :       Tela para testar o noteiro pulso
//  481 *       Parametros      :       nenhum
//  482 *       Retorno         :       nenhum
//  483 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function MTH_tela_teste_p70
        THUMB
//  484 void MTH_tela_teste_p70(void){
MTH_tela_teste_p70:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
//  485   eTECLA tecla;
//  486   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  487   char buffer_linha[17];
//  488   unsigned char flag=0;
        MOVS     R4,#+0
//  489   
//  490   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_teste_P70[idioma],NULL);     
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable14_22
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_tela_teste_p70_0
//  491   
//  492   for(;;){
//  493     
//  494     tecla = TECLADO_getch();
//  495     switch(tecla){
//  496       case TECLA_ENTER:
//  497            PAGAMENTOS_subtrai_contagem_p70(PAGAMENTOS_get_contagem_p70());
//  498            break;
//  499       case TECLA_ESC:
//  500            return;
//  501       case TECLA_INC:
//  502            flag = 1;
//  503            break;
//  504       case TECLA_DEC:
//  505            flag = 0;
//  506            break;
//  507     }
//  508     
//  509     sprintf(buffer_linha,"%04d-[%s]",PAGAMENTOS_get_contagem_p70(),flag?"LOCK  ":"UNLOK");
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
//  510     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  511     
//  512     PAGAMENTOS_set_inhibit_p70(flag);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall PAGAMENTOS_set_inhibit_p70
        BL       PAGAMENTOS_set_inhibit_p70
//  513     vTaskDelay(50);
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
//  514   }  
//  515 }
//  516 /***********************************************************************************
//  517 *       Descrição       :       Tela para o teste dos leds da placa
//  518 *                               de instrução
//  519 *       Parametros      :       nenhum
//  520 *       Retorno         :       nenhum
//  521 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function MTH_tela_placa_instrucao
        THUMB
//  522 void MTH_tela_placa_instrucao(void){
MTH_tela_placa_instrucao:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
//  523   eTECLA tecla;
//  524   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  525   char buffer_linha[17];
//  526   unsigned char indice=0;
        MOVS     R4,#+0
//  527   
//  528   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_teste_led_instrucao[idioma],NULL);    
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable14_23
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_tela_placa_instrucao_0
//  529   
//  530   for(;;){
//  531     
//  532     tecla = TECLADO_getch();
//  533     switch(tecla){
//  534       case TECLA_ENTER:
//  535            break;
//  536       case TECLA_ESC:
//  537            return;
//  538       case TECLA_INC: 
//  539            for(unsigned char i=0;i<8;i++)
//  540              LEDS_setter_led(i,0);
//  541            indice = (indice+1) % 8;
//  542            LEDS_setter_led(indice,1);
//  543            break;
//  544       case TECLA_DEC:
//  545            for(unsigned char i=0;i<8;i++)
//  546              LEDS_setter_led(i,0);   
//  547            if(indice)
//  548              indice = 7;
//  549            else
//  550              indice--;
??MTH_tela_placa_instrucao_1:
        SUBS     R4,R4,#+1
//  551            LEDS_setter_led(indice,1);
??MTH_tela_placa_instrucao_2:
        MOVS     R1,#+1
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall LEDS_setter_led
        BL       LEDS_setter_led
//  552            break;
//  553     }
//  554     
//  555     sprintf(buffer_linha,"LED:[%01d]",indice);
??MTH_tela_placa_instrucao_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,R4
        LDR.N    R1,??DataTable14_24
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  556     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  557             
//  558     vTaskDelay(50);
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
//  559   }
//  560 }
//  561 /***********************************************************************************
//  562 *       Descrição       :       Menu para teste do LCD externo
//  563 *       Parametros      :       nenhum
//  564 *       Retorno         :       nenhum
//  565 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function MTH_tela_teste_lcd_externo
        THUMB
//  566 void MTH_tela_teste_lcd_externo(void){
MTH_tela_teste_lcd_externo:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+24
          CFI CFA R13+40
//  567   eTECLA tecla;
//  568   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  569   char buffer_linha[17]={0};
        ADD      R0,SP,#+0
        MOVS     R1,#+20
          CFI FunCall __aeabi_memclr4
        BL       __aeabi_memclr4
//  570   char first=' ';
        MOVS     R5,#+32
//  571   unsigned char ciclos=1;
        MOVS     R6,#+1
//  572     
//  573   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_lcd_externo[idioma],NULL);    
        MOVS     R2,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable14_25
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_tela_teste_lcd_externo_0
//  574   
//  575   for(;;){
//  576    
//  577     tecla = TECLADO_getch();
//  578     switch(tecla){
//  579       case TECLA_ENTER:
//  580            break;
//  581       case TECLA_ESC:
//  582            return;
//  583       case TECLA_INC:
//  584            break;
//  585       case TECLA_DEC:
//  586            break;
//  587     }       
//  588     
//  589     for(unsigned char i=0;i<16;i++)
//  590       buffer_linha[i] = first;
??MTH_tela_teste_lcd_externo_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+0
        STRB     R5,[R0, R1]
        ADDS     R0,R0,#+1
??MTH_tela_teste_lcd_externo_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BLT.N    ??MTH_tela_teste_lcd_externo_1
//  591         
//  592     STRING_write_to_external(NO_CLEAR,buffer_linha,buffer_linha);
        ADD      R2,SP,#+0
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_external
        BL       STRING_write_to_external
//  593     
//  594     if(!--ciclos){
        SUBS     R6,R6,#+1
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??MTH_tela_teste_lcd_externo_3
//  595       ciclos = 10;
        MOVS     R6,#+10
//  596       first++;      
        ADDS     R5,R5,#+1
//  597     }
//  598     
//  599     vTaskDelay(50);    
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
//  600   }  
//  601 }
//  602 /***********************************************************************************
//  603 *       Descrição       :       Tela para realizar o teste da impressora
//  604 *       Parametros      :       nenhum
//  605 *       Retorno         :       nenhum
//  606 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function MTH_tela_teste_impressora
        THUMB
//  607 void MTH_tela_teste_impressora(void){
MTH_tela_teste_impressora:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  608   eTECLA tecla;
//  609   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  610 
//  611   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_impresora[idioma][0],(char*)STRING_titulo_teste_impresora[idioma][1]);      
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
//  612   
//  613   for(;;){
//  614     
//  615     tecla = TECLADO_getch();
//  616     switch(tecla){
//  617       case TECLA_ENTER:
//  618            STRING_write_to_internal(NO_CLEAR,NULL,"      ...       ");
//  619            IMPRESSORA_impressora_teste();
//  620            STRING_write_to_internal(NO_CLEAR,NULL,(char*)STRING_titulo_teste_impresora[idioma][1]);               
//  621            break;
//  622       case TECLA_ESC:
//  623            return;
//  624       case TECLA_INC:
//  625            break;
//  626       case TECLA_DEC:
//  627            break;
//  628     }       
//  629     
//  630     vTaskDelay(50);
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
//  631   }  
//  632 }
//  633 /***********************************************************************************
//  634 *       Descrição       :       Interface para teste da música
//  635 *       Parametros      :       nenhum
//  636 *       Retorno         :       nenhum
//  637 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function MTH_teste_musica
        THUMB
//  638 void MTH_teste_musica(void){
MTH_teste_musica:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  639   eTECLA tecla;
//  640   char buffer_linha[17];
//  641   unsigned char idioma = APLICACAO_carrega_idioma();    
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  642   
//  643   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_menu_teste_musica[idioma],NULL);
        MOVS     R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable14_28
        LDR      R1,[R1, R0, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTH_teste_musica_0
//  644       
//  645   for(;;){
//  646             
//  647     tecla = TECLADO_getch();
//  648     switch(tecla){
//  649       case TECLA_ENTER:
//  650            PLAYER_interrompeMusica();
//  651            vTaskDelay(5);
//  652            PLAYERWAVE_iniciaMusica(1,0);           
//  653            break;
//  654       case TECLA_ESC:
//  655            PLAYER_interrompeMusica();
//  656            return;
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
          CFI FunCall PLAYER_interrompeMusica
        BL       PLAYER_interrompeMusica
        MOVS     R0,#+5
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall PLAYERWAVE_iniciaMusica
        BL       PLAYERWAVE_iniciaMusica
??MTH_teste_musica_4:
          CFI FunCall PLAYERWAVE_verificaToque
        BL       PLAYERWAVE_verificaToque
        CMP      R0,#+0
        BEQ.N    ??MTH_teste_musica_1
        LDR.N    R2,??DataTable14_31
        B.N      ??MTH_teste_musica_2
??MTH_teste_musica_3:
          CFI FunCall PLAYER_interrompeMusica
        BL       PLAYER_interrompeMusica
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
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
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
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
//  675   
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
//  683            PLAYER_interrompeMusica();        
//  684            vTaskDelay(5);
//  685            PLAYERWAVE_iniciaMusica(toques[indice],0);  
//  686            break;
//  687       case TECLA_ESC:
//  688            PLAYER_interrompeMusica();
//  689            return;
//  690       case TECLA_INC:
//  691            indice = (indice+1) % 3;
//  692            break;
//  693       case TECLA_DEC:
//  694            if(indice)
//  695              indice--;
//  696            else
//  697              indice = 2;
//  698            break;
//  699     }
//  700     
//  701     sprintf(buffer_linha,"[%s][i:%01d]",PLAYERWAVE_verificaToque()?"PLAY":"STOP",indice+1);
??MTH_teste_locucoes_1:
        LDR.N    R2,??DataTable14_29
??MTH_teste_locucoes_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R3,R4,#+1
        LDR.N    R1,??DataTable14_34
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  702     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);        
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
        BCC.N    ??MTH_teste_locucoes_4
        CMP      R0,#+3
        BEQ.N    ??MTH_teste_locucoes_5
        BCC.N    ??MTH_teste_locucoes_6
        CMP      R0,#+4
        BNE.N    ??MTH_teste_locucoes_4
??MTH_teste_locucoes_7:
          CFI FunCall PLAYER_interrompeMusica
        BL       PLAYER_interrompeMusica
        MOVS     R0,#+5
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        MOVS     R1,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R4, R0]
          CFI FunCall PLAYERWAVE_iniciaMusica
        BL       PLAYERWAVE_iniciaMusica
        B.N      ??MTH_teste_locucoes_4
??MTH_teste_locucoes_3:
          CFI FunCall PLAYER_interrompeMusica
        BL       PLAYER_interrompeMusica
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI CFA R13+32
??MTH_teste_locucoes_6:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+1
        MOVS     R1,#+3
        SDIV     R2,R0,R1
        MLS      R4,R1,R2,R0
        B.N      ??MTH_teste_locucoes_4
??MTH_teste_locucoes_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??MTH_teste_locucoes_8
        SUBS     R4,R4,#+1
        B.N      ??MTH_teste_locucoes_9
??MTH_teste_locucoes_8:
        MOVS     R4,#+2
??MTH_teste_locucoes_9:
??MTH_teste_locucoes_4:
          CFI FunCall PLAYERWAVE_verificaToque
        BL       PLAYERWAVE_verificaToque
        CMP      R0,#+0
        BEQ.N    ??MTH_teste_locucoes_1
        LDR.N    R2,??DataTable14_31
        B.N      ??MTH_teste_locucoes_2
          CFI EndBlock cfiBlock15
//  703   }  
//  704 }

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
//  705 /***********************************************************************************
//  706 *       Fim do arquivo
//  707 ***********************************************************************************/
// 
//   316 bytes in section .rodata
// 2 166 bytes in section .text
// 
// 2 166 bytes of CODE  memory
//   316 bytes of CONST memory
//
//Errors: none
//Warnings: none
