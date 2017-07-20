///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  13:21:40 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Strings\strings.c                       /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Strings\strings.c -lC                   /
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
//                    pocaG2\SOFTWARE\Debug\List\strings.s                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME strings

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN HD44780_2_posicionaTexto
        EXTERN HD44780_2_writeChar
        EXTERN HD44780_2_writeString
        EXTERN HD44780_posicionaTexto
        EXTERN HD44780_writeChar
        EXTERN HD44780_writeString
        EXTERN __aeabi_memcpy4
        EXTERN strlen

        PUBLIC STRING_idioma_to_string
        PUBLIC STRING_impressao_teste
        PUBLIC STRING_mensagem_cadastro_senha
        PUBLIC STRING_mensagem_cadastro_senha_erro
        PUBLIC STRING_mensagem_cctalk_offline
        PUBLIC STRING_mensagem_configura_fita_led
        PUBLIC STRING_mensagem_configura_free
        PUBLIC STRING_mensagem_dosando_milho
        PUBLIC STRING_mensagem_edita_tempo_embalagem
        PUBLIC STRING_mensagem_fora_servico
        PUBLIC STRING_mensagem_inicio_autoteste
        PUBLIC STRING_mensagem_inicio_preparacao
        PUBLIC STRING_mensagem_inserir_senha
        PUBLIC STRING_mensagem_libera_embalagem
        PUBLIC STRING_mensagem_limpeza
        PUBLIC STRING_mensagem_limpeza_inicial
        PUBLIC STRING_mensagem_modo_gratis
        PUBLIC STRING_mensagem_moedeiro_mdb_offline
        PUBLIC STRING_mensagem_noteiro_mdb_offline
        PUBLIC STRING_mensagem_pago
        PUBLIC STRING_mensagem_pipocas_prontas
        PUBLIC STRING_mensagem_preco
        PUBLIC STRING_mensagem_reinicia_totalizadores
        PUBLIC STRING_mensagem_reinicia_totalizadores_erro
        PUBLIC STRING_mensagem_reset_fabrica
        PUBLIC STRING_mensagem_resfriando
        PUBLIC STRING_mensagem_retire_troco
        PUBLIC STRING_mensagem_saudacao_maquina
        PUBLIC STRING_mensagem_sem_troco
        PUBLIC STRING_mensagem_teste_BV20
        PUBLIC STRING_mensagem_teste_P70
        PUBLIC STRING_mensagem_teste_led_instrucao
        PUBLIC STRING_mensagem_teste_uca1
        PUBLIC STRING_menu_avancado
        PUBLIC STRING_menu_configuracao
        PUBLIC STRING_menu_configuracao_operacao
        PUBLIC STRING_menu_servico
        PUBLIC STRING_menu_teste_hardware
        PUBLIC STRING_opcoes_menu_acessorios
        PUBLIC STRING_opcoes_menu_faturamento
        PUBLIC STRING_opcoes_menu_mdb
        PUBLIC STRING_opcoes_menu_preparacao
        PUBLIC STRING_passos_teste_dataflash
        PUBLIC STRING_simbolo_moeda
        PUBLIC STRING_splash
        PUBLIC STRING_tabela_cedulas_canais
        PUBLIC STRING_tela_edita_flag_BV20
        PUBLIC STRING_tela_sel_idioma
        PUBLIC STRING_tela_teste_dispensador_papel
        PUBLIC STRING_tela_teste_dosador
        PUBLIC STRING_teste_data_flash
        PUBLIC STRING_teste_panela
        PUBLIC STRING_teste_rtc
        PUBLIC STRING_teste_ventilador
        PUBLIC STRING_texto_teste_motor
        PUBLIC STRING_titulo_ajusta_valor
        PUBLIC STRING_titulo_checa_senha
        PUBLIC STRING_titulo_configura_troco
        PUBLIC STRING_titulo_configuracao_notas
        PUBLIC STRING_titulo_edita_baudrate
        PUBLIC STRING_titulo_edita_comissao
        PUBLIC STRING_titulo_edita_flag_desumidifcador
        PUBLIC STRING_titulo_edita_flag_mdb_bill
        PUBLIC STRING_titulo_edita_flag_mdb_cashless
        PUBLIC STRING_titulo_edita_flag_mdb_coin
        PUBLIC STRING_titulo_edita_pulso_moeda
        PUBLIC STRING_titulo_edita_pulso_noteiro
        PUBLIC STRING_titulo_edita_serial
        PUBLIC STRING_titulo_edita_temperatura
        PUBLIC STRING_titulo_edita_velocidade
        PUBLIC STRING_titulo_menu_acessorios
        PUBLIC STRING_titulo_menu_avancado
        PUBLIC STRING_titulo_menu_configuracao
        PUBLIC STRING_titulo_menu_edita_volume_musica
        PUBLIC STRING_titulo_menu_edita_volume_voz
        PUBLIC STRING_titulo_menu_faturamento
        PUBLIC STRING_titulo_menu_intervalo_prop
        PUBLIC STRING_titulo_menu_mdb
        PUBLIC STRING_titulo_menu_operacao
        PUBLIC STRING_titulo_menu_preparacao
        PUBLIC STRING_titulo_menu_servico
        PUBLIC STRING_titulo_menu_teste_musica
        PUBLIC STRING_titulo_menu_teste_vozes
        PUBLIC STRING_titulo_padrao_fabrica
        PUBLIC STRING_titulo_teste_bill_mdb
        PUBLIC STRING_titulo_teste_cashless_mdb
        PUBLIC STRING_titulo_teste_coin_changer_mdb
        PUBLIC STRING_titulo_teste_coin_mdb
        PUBLIC STRING_titulo_teste_devices_mdb
        PUBLIC STRING_titulo_teste_hardware
        PUBLIC STRING_titulo_teste_impresora
        PUBLIC STRING_titulo_teste_lcd_externo
        PUBLIC STRING_write_to_external
        PUBLIC STRING_write_to_internal
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Strings\strings.c
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
//   17 |       Arquivo            :  strings.c
//   18 |       Descrição          :  declaração de todas as mensagens utilizadas
//   19 |                             no display
//   20 | 
//   21 |       Autor              :  Marcos Aquino
//   22 |       Data criação       :  15/02/2017
//   23 |
//   24 |       Revisões           :  001
//   25 |
//   26 |
//   27 | __________________________________________________________________________________
//   28 */
//   29 #define _GLOBAL_STRING_
//   30 /***********************************************************************************
//   31 *       Includes
//   32 ***********************************************************************************/
//   33 #include <stdio.h>
//   34 #include <stdlib.h>
//   35 #include <string.h>
//   36 #include "strings.h"
//   37 #include "..\includes.h"

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_splash[7][2]
STRING_splash:
        DATA
        DC32 `?<Constant "GRUPO ALTECH">`, `?<Constant "VER. 2.0.15">`
        DC32 `?<Constant "GRUPO ALTECH">`, `?<Constant "VER. 2.0.15">`
        DC32 `?<Constant "GRUPO ALTECH">`, `?<Constant "VER. 2.0.15">`
        DC32 `?<Constant "GRUPO ALTECH">`, `?<Constant "VER. 2.0.15">`
        DC32 `?<Constant "GRUPO ALTECH">`, `?<Constant "VER. 2.0.15">`
        DC32 `?<Constant "POPCORN KING">`, `?<Constant "VER. 1.0.15">`
        DC32 `?<Constant "GRUPO ALTECH">`, `?<Constant "VER. 2.0.15">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_menu_configuracao[7]
STRING_titulo_menu_configuracao:
        DATA
        DC32 `?<Constant "CONFIGURACOES">`, `?<Constant "CONFIGURACIONS">`
        DC32 `?<Constant "CONFIGURACIONS">`, `?<Constant "CONFIGURACIONS">`
        DC32 `?<Constant "CONFIGURACIONS">`, `?<Constant "SETUP">`
        DC32 `?<Constant "SETUP">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_menu_configuracao[7][10]
STRING_menu_configuracao:
        DATA
        DC32 `?<Constant "(1)OPERACAO     ">`, `?<Constant "(2)FATURAMENTO  ">`
        DC32 `?<Constant "(3)PREPARACAO   ">`, `?<Constant "(4)ACESSORIOS   ">`
        DC32 `?<Constant "(5)TELEMETRIA   ">`, `?<Constant "(6)TESTE HW     ">`
        DC32 `?<Constant "(7)REGIAO       ">`, `?<Constant "(8)SERVICO      ">`
        DC32 `?<Constant "(9)AVANCADO     ">`, `?<Constant "(10)SAIR        ">`
        DC32 `?<Constant "(1)OPERACAO     ">`, `?<Constant "(2)FATURAMENTO  ">`
        DC32 `?<Constant "(3)PREPARACAO   ">`, `?<Constant "(4)ACESSORIOS   ">`
        DC32 `?<Constant "(5)TELEMETRIA   ">`, `?<Constant "(6)TESTE HW     ">`
        DC32 `?<Constant "(7)REGIAO       ">`, `?<Constant "(8)SERVICO      ">`
        DC32 `?<Constant "(9)AVANCADO     ">`, `?<Constant "(10)SAIR        ">`
        DC32 `?<Constant "(1)OPERACAO     ">`, `?<Constant "(2)FATURAMENTO  ">`
        DC32 `?<Constant "(3)PREPARACAO   ">`, `?<Constant "(4)ACESSORIOS   ">`
        DC32 `?<Constant "(5)TELEMETRIA   ">`, `?<Constant "(6)TESTE HW     ">`
        DC32 `?<Constant "(7)REGIAO       ">`, `?<Constant "(8)SERVICO      ">`
        DC32 `?<Constant "(9)AVANCADO     ">`, `?<Constant "(10)SAIR        ">`
        DC32 `?<Constant "(1)OPERACAO     ">`, `?<Constant "(2)FATURAMENTO  ">`
        DC32 `?<Constant "(3)PREPARACAO   ">`, `?<Constant "(4)ACESSORIOS   ">`
        DC32 `?<Constant "(5)TELEMETRIA   ">`, `?<Constant "(6)TESTE HW     ">`
        DC32 `?<Constant "(7)REGIAO       ">`, `?<Constant "(8)SERVICO      ">`
        DC32 `?<Constant "(9)AVANCADO     ">`, `?<Constant "(10)SAIR        ">`
        DC32 `?<Constant "(1)OPERACAO     ">`, `?<Constant "(2)FATURAMENTO  ">`
        DC32 `?<Constant "(3)PREPARACAO   ">`, `?<Constant "(4)ACESSORIOS   ">`
        DC32 `?<Constant "(5)TELEMETRIA   ">`, `?<Constant "(6)TESTE HW     ">`
        DC32 `?<Constant "(7)REGIAO       ">`, `?<Constant "(8)SERVICO      ">`
        DC32 `?<Constant "(9)AVANCADO     ">`, `?<Constant "(10)SAIR        ">`
        DC32 `?<Constant "(1)OPERATION    ">`, `?<Constant "(2)BILLING      ">`
        DC32 `?<Constant "(3)PREPARATION  ">`, `?<Constant "(4)ACCESSORIES  ">`
        DC32 `?<Constant "(5)TELEMETRY    ">`, `?<Constant "(6)TESTE HW     ">`
        DC32 `?<Constant "(7)REGION       ">`, `?<Constant "(8)SERVICO      ">`
        DC32 `?<Constant "(9)AVANCADO     ">`, `?<Constant "(10)SAIR        ">`
        DC32 `?<Constant "(1)OPERACAO     ">`, `?<Constant "(2)FATURAMENTO  ">`
        DC32 `?<Constant "(3)PREPARACAO   ">`, `?<Constant "(4)ACESSORIOS   ">`
        DC32 `?<Constant "(5)TELEMETRIA   ">`, `?<Constant "(6)TESTE HW     ">`
        DC32 `?<Constant "(7)REGIAO       ">`, `?<Constant "(8)SERVICO      ">`
        DC32 `?<Constant "(9)AVANCADO     ">`, `?<Constant "(10)SAIR        ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_tela_sel_idioma[7][7]
STRING_tela_sel_idioma:
        DATA
        DC32 `?<Constant "BRASIL       ">`, `?<Constant "URUGUAY      ">`
        DC32 `?<Constant "ARGENTINA    ">`, `?<Constant "PARAGUAY     ">`
        DC32 `?<Constant "PERU         ">`, `?<Constant "EUA          ">`
        DC32 `?<Constant "CANADA       ">`, `?<Constant "BRASIL       ">`
        DC32 `?<Constant "URUGUAY      ">`, `?<Constant "ARGENTINA    ">`
        DC32 `?<Constant "PARAGUAY     ">`, `?<Constant "PERU         ">`
        DC32 `?<Constant "USA          ">`, `?<Constant "CANADA       ">`
        DC32 `?<Constant "BRASIL       ">`, `?<Constant "URUGUAY      ">`
        DC32 `?<Constant "ARGENTINA    ">`, `?<Constant "PARAGUAY     ">`
        DC32 `?<Constant "PERU         ">`, `?<Constant "USA          ">`
        DC32 `?<Constant "CANADA       ">`, `?<Constant "BRASIL       ">`
        DC32 `?<Constant "URUGUAY      ">`, `?<Constant "ARGENTINA    ">`
        DC32 `?<Constant "PARAGUAY     ">`, `?<Constant "PERU         ">`
        DC32 `?<Constant "USA          ">`, `?<Constant "CANADA       ">`
        DC32 `?<Constant "BRASIL       ">`, `?<Constant "URUGUAY      ">`
        DC32 `?<Constant "ARGENTINA    ">`, `?<Constant "PARAGUAY     ">`
        DC32 `?<Constant "PERU         ">`, `?<Constant "USA          ">`
        DC32 `?<Constant "CANADA       ">`, `?<Constant "BRAZIL       ">`
        DC32 `?<Constant "URUGUAY      ">`, `?<Constant "ARGENTINA    ">`
        DC32 `?<Constant "PARAGUAY     ">`, `?<Constant "PERU         ">`
        DC32 `?<Constant "USA          ">`, `?<Constant "CANADA       ">`
        DC32 `?<Constant "BRASIL       ">`, `?<Constant "URUGUAY      ">`
        DC32 `?<Constant "ARGENTINA    ">`, `?<Constant "PARAGUAY     ">`
        DC32 `?<Constant "PERU         ">`, `?<Constant "USA          ">`
        DC32 `?<Constant "CANADA       ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_teste_hardware[7]
STRING_titulo_teste_hardware:
        DATA
        DC32 `?<Constant "TESTE DO HW">`, `?<Constant "TESTE DO HD">`
        DC32 `?<Constant "TESTE DO HW">`, `?<Constant "TESTE DO HW">`
        DC32 `?<Constant "TESTE DO HW">`, `?<Constant "TEST OF HW ">`
        DC32 `?<Constant "TESTE DO HW">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_menu_teste_hardware[7][16]
STRING_menu_teste_hardware:
        DATA
        DC32 `?<Constant "(1)HORA/DATA    ">`, `?<Constant "(2)DATAFLASH    ">`
        DC32 `?<Constant "(3)DISP. PAPEL  ">`, `?<Constant "(4)DOSADOR MILHO">`
        DC32 `?<Constant "(5)VENTILADOR   ">`, `?<Constant "(6)RESISTENCIA  ">`
        DC32 `?<Constant "(7)CCTALK       ">`, `?<Constant "(8)MOEDEIRO PULS">`
        DC32 `?<Constant "(9)NOTEIRO PULSO">`, `?<Constant "(10)MDB         ">`
        DC32 `?<Constant "(11)IMPRESSORA  ">`, `?<Constant "(12)MUSICA      ">`
        DC32 `?<Constant "(13)LOCUCOES    ">`, `?<Constant "(14)LEDS        ">`
        DC32 `?<Constant "(15)LCD EXTERNO ">`, `?<Constant "(16)VOLTAR      ">`
        DC32 `?<Constant "(1)HORA/DATA    ">`, `?<Constant "(2)DATAFLASH    ">`
        DC32 `?<Constant "(3)DISP. PAPEL  ">`, `?<Constant "(4)DOSADOR MILHO">`
        DC32 `?<Constant "(5)VENTILADOR   ">`, `?<Constant "(6)RESISTENCIA  ">`
        DC32 `?<Constant "(7)CCTALK       ">`, `?<Constant "(8)MOEDEIRO PULS">`
        DC32 `?<Constant "(9)NOTEIRO PULSO">`, `?<Constant "(10)MDB         ">`
        DC32 `?<Constant "(11)IMPRESSORA  ">`, `?<Constant "(12)MUSICA      ">`
        DC32 `?<Constant "(13)LOCUCOES    ">`, `?<Constant "(14)LEDS        ">`
        DC32 `?<Constant "(15)LCD EXTERNO ">`, `?<Constant "(16)VOLTAR      ">`
        DC32 `?<Constant "(1)HORA/DATA    ">`, `?<Constant "(2)DATAFLASH    ">`
        DC32 `?<Constant "(3)DISP. PAPEL  ">`, `?<Constant "(4)DOSADOR MILHO">`
        DC32 `?<Constant "(5)VENTILADOR   ">`, `?<Constant "(6)RESISTENCIA  ">`
        DC32 `?<Constant "(7)CCTALK       ">`, `?<Constant "(8)MOEDEIRO PULS">`
        DC32 `?<Constant "(9)NOTEIRO PULSO">`, `?<Constant "(10)MDB         ">`
        DC32 `?<Constant "(11)IMPRESSORA  ">`, `?<Constant "(12)MUSICA      ">`
        DC32 `?<Constant "(13)LOCUCOES    ">`, `?<Constant "(14)LEDS        ">`
        DC32 `?<Constant "(15)LCD EXTERNO ">`, `?<Constant "(16)VOLTAR      ">`
        DC32 `?<Constant "(1)HORA/DATA    ">`, `?<Constant "(2)DATAFLASH    ">`
        DC32 `?<Constant "(3)DISP. PAPEL  ">`, `?<Constant "(4)DOSADOR MILHO">`
        DC32 `?<Constant "(5)VENTILADOR   ">`, `?<Constant "(6)RESISTENCIA  ">`
        DC32 `?<Constant "(7)CCTALK       ">`, `?<Constant "(8)MOEDEIRO PULS">`
        DC32 `?<Constant "(9)NOTEIRO PULSO">`, `?<Constant "(10)MDB         ">`
        DC32 `?<Constant "(11)IMPRESSORA  ">`, `?<Constant "(12)MUSICA      ">`
        DC32 `?<Constant "(13)LOCUCOES    ">`, `?<Constant "(14)LEDS        ">`
        DC32 `?<Constant "(15)LCD EXTERNO ">`, `?<Constant "(16)VOLTAR      ">`
        DC32 `?<Constant "(1)HORA/DATA    ">`, `?<Constant "(2)DATAFLASH    ">`
        DC32 `?<Constant "(3)DISP. PAPEL  ">`, `?<Constant "(4)DOSADOR MILHO">`
        DC32 `?<Constant "(5)VENTILADOR   ">`, `?<Constant "(6)RESISTENCIA  ">`
        DC32 `?<Constant "(7)CCTALK       ">`, `?<Constant "(8)MOEDEIRO PULS">`
        DC32 `?<Constant "(9)NOTEIRO PULSO">`, `?<Constant "(10)MDB         ">`
        DC32 `?<Constant "(11)IMPRESSORA  ">`, `?<Constant "(12)MUSICA      ">`
        DC32 `?<Constant "(13)LOCUCOES    ">`, `?<Constant "(14)LEDS        ">`
        DC32 `?<Constant "(15)LCD EXTERNO ">`, `?<Constant "(16)VOLTAR      ">`
        DC32 `?<Constant "(1)HOUR/DATE    ">`, `?<Constant "(2)DATAFLASH    ">`
        DC32 `?<Constant "(3)CUP DISPENSER">`, `?<Constant "(4)CORN PORTION ">`
        DC32 `?<Constant "(5)BLOWER       ">`, `?<Constant "(6)HEATING      ">`
        DC32 `?<Constant "(7)CCTALK       ">`, `?<Constant "(8)COIN PULSE   ">`
        DC32 `?<Constant "(9)BILL PULSE   ">`, `?<Constant "(10)MDB         ">`
        DC32 `?<Constant "(11)PRINTER     ">`, `?<Constant "(12)MUSIC       ">`
        DC32 `?<Constant "(13)VOICE       ">`, `?<Constant "(14)LEDS        ">`
        DC32 `?<Constant "(15)EXTERNAL LCD">`, `?<Constant "(16)VOLTAR      ">`
        DC32 `?<Constant "(1)HORA/DATA    ">`, `?<Constant "(2)DATAFLASH    ">`
        DC32 `?<Constant "(3)DISP. PAPEL  ">`, `?<Constant "(4)DOSADOR MILHO">`
        DC32 `?<Constant "(5)VENTILADOR   ">`, `?<Constant "(6)RESISTENCIA  ">`
        DC32 `?<Constant "(7)CCTALK       ">`, `?<Constant "(8)MOEDEIRO PULS">`
        DC32 `?<Constant "(9)NOTEIRO PULSO">`, `?<Constant "(10)MDB         ">`
        DC32 `?<Constant "(11)IMPRESSORA  ">`, `?<Constant "(12)MUSICA      ">`
        DC32 `?<Constant "(13)LOCUCOES    ">`, `?<Constant "(14)LEDS        ">`
        DC32 `?<Constant "(15)LCD EXTERNO ">`, `?<Constant "(16)VOLTAR      ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_teste_rtc[7]
STRING_teste_rtc:
        DATA
        DC32 `?<Constant "TESTE RTC">`, `?<Constant "TESTE RTC">`
        DC32 `?<Constant "TESTE RTC">`, `?<Constant "TESTE RTC">`
        DC32 `?<Constant "TESTE RTC">`, `?<Constant "TEST RTC">`
        DC32 `?<Constant "TESTE RTC">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_teste_data_flash[7]
STRING_teste_data_flash:
        DATA
        DC32 `?<Constant "TESTE DFLASH">`, `?<Constant "TESTE DFLASH">`
        DC32 `?<Constant "TESTE DFLASH">`, `?<Constant "TESTE DFLASH">`
        DC32 `?<Constant "TESTE DFLASH">`, `?<Constant "TEST DFLASH">`
        DC32 `?<Constant "TESTE DFLASH">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_passos_teste_dataflash[7][4]
STRING_passos_teste_dataflash:
        DATA
        DC32 `?<Constant "ESCREVENDO">`, `?<Constant "LENDO     ">`
        DC32 `?<Constant "SUCESSO   ">`, `?<Constant "FALHA     ">`
        DC32 `?<Constant "ESCREVENDO">`, `?<Constant "LEND      ">`
        DC32 `?<Constant "SUCESSO   ">`, `?<Constant "FALHA     ">`
        DC32 `?<Constant "ESCREVENDO">`, `?<Constant "LEND      ">`
        DC32 `?<Constant "SUCESSO   ">`, `?<Constant "FALHA     ">`
        DC32 `?<Constant "ESCREVENDO">`, `?<Constant "LEND      ">`
        DC32 `?<Constant "SUCESSO   ">`, `?<Constant "FALHA     ">`
        DC32 `?<Constant "ESCREVENDO">`, `?<Constant "LEND      ">`
        DC32 `?<Constant "SUCESSO   ">`, `?<Constant "FALHA     ">`
        DC32 `?<Constant "WRITING">`, `?<Constant "READING">`
        DC32 `?<Constant "SUCESS">`, `?<Constant "FAIL">`
        DC32 `?<Constant "ESCREVENDO">`, `?<Constant "LEND      ">`
        DC32 `?<Constant "SUCESSO   ">`, `?<Constant "FALHA     ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_tela_teste_dispensador_papel[7]
STRING_tela_teste_dispensador_papel:
        DATA
        DC32 `?<Constant "DISP. EMB.">`, `?<Constant "DISP. CUEPOS">`
        DC32 `?<Constant "DISP. CUEPOS">`, `?<Constant "LOS COPOS">`
        DC32 `?<Constant "EL COPOS">`, `?<Constant "CUP DISPENSER">`
        DC32 `?<Constant "CUPS,PLEASE">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_tela_teste_dosador[7]
STRING_tela_teste_dosador:
        DATA
        DC32 `?<Constant "DOSADOR MILHO">`, `?<Constant "DOSADOR MILHO">`
        DC32 `?<Constant "DOSADOR MILHO">`, `?<Constant "DOSADOR MILHO">`
        DC32 `?<Constant "DOSADOR MILHO">`, `?<Constant "CORN PORTION">`
        DC32 `?<Constant "DOSADOR MILHO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_texto_teste_motor[7][3]
STRING_texto_teste_motor:
        DATA
        DC32 `?<Constant "PARADO ">`, `?<Constant "DOSANDO">`
        DC32 `?<Constant "REVERSO">`, `?<Constant "PARADO ">`
        DC32 `?<Constant "DOSANDO">`, `?<Constant "REVERSO">`
        DC32 `?<Constant "PARADO ">`, `?<Constant "DOSANDO">`
        DC32 `?<Constant "REVERSO">`, `?<Constant "PARADO ">`
        DC32 `?<Constant "DOSANDO">`, `?<Constant "REVERSO">`
        DC32 `?<Constant "PARADO ">`, `?<Constant "DOSING">`
        DC32 `?<Constant "REVERSE">`, `?<Constant "STOP">`
        DC32 `?<Constant "DOSANDO">`, `?<Constant "REVERSO">`
        DC32 `?<Constant "PARADO ">`, `?<Constant "DOSANDO">`
        DC32 `?<Constant "REVERSO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_teste_ventilador[7]
STRING_teste_ventilador:
        DATA
        DC32 `?<Constant "TESTE MOTOR">`, `?<Constant "TESTE MOTOR">`
        DC32 `?<Constant "TESTE MOTOR">`, `?<Constant "TESTE MOTOR">`
        DC32 `?<Constant "TESTE MOTOR">`, `?<Constant "MOTOR TEST">`
        DC32 `?<Constant "TESTE MOTOR">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_teste_panela[7]
STRING_teste_panela:
        DATA
        DC32 `?<Constant "TESTE PANELA">`, `?<Constant "TESTE PANELA">`
        DC32 `?<Constant "TESTE PANELA">`, `?<Constant "TESTE PANELA">`
        DC32 `?<Constant "TESTE PANELA">`, `?<Constant "HEATING TESTE">`
        DC32 `?<Constant "TESTE PANELA">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_menu_operacao[7]
STRING_titulo_menu_operacao:
        DATA
        DC32 `?<Constant "OPERACAO">`, `?<Constant "OPERACAO">`
        DC32 `?<Constant "OPERACAO">`, `?<Constant "OPERACAO">`
        DC32 `?<Constant "OPERACAO">`, `?<Constant "OPERATION">`
        DC32 `?<Constant "OPERACAO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_menu_configuracao_operacao[7][16]
STRING_menu_configuracao_operacao:
        DATA
        DC32 `?<Constant "(1) VALOR       ">`, `?<Constant "(2) CEDULAS     ">`
        DC32 `?<Constant "(3) GRATIS      ">`, `?<Constant "(4) FITA LED    ">`
        DC32 `?<Constant "(5) VOLUME MUS. ">`, `?<Constant "(6) VOLUME VOZ  ">`
        DC32 `?<Constant "(7) PROPAGANDA  ">`, `?<Constant "(8) TEMPO EMB.  ">`
        DC32 `?<Constant "(9) TROCO       ">`, `?<Constant "(10)COMISSAO    ">`
        DC32 `?<Constant "(11)MENSAGEM 01 ">`, `?<Constant "(12)MENSAGEM 02 ">`
        DC32 `?<Constant "(13)MENSAGEM 03 ">`, `?<Constant "(14)MENSAGEM 04 ">`
        DC32 `?<Constant "(15)DESUMIDIF.  ">`, `?<Constant "(16)VOLTAR      ">`
        DC32 `?<Constant "(1) VALOR       ">`, `?<Constant "(2) CEDULAS     ">`
        DC32 `?<Constant "(3) GRATIS      ">`, `?<Constant "(4) FITA LED    ">`
        DC32 `?<Constant "(5) VOLUME MUS. ">`, `?<Constant "(6) VOLUME VOZ  ">`
        DC32 `?<Constant "(7) PROPAGANDA  ">`, `?<Constant "(8) TEMPO EMB.  ">`
        DC32 `?<Constant "(9) TROCO       ">`, `?<Constant "(10)COMISSAO    ">`
        DC32 `?<Constant "(11)MENSAGEM 01 ">`, `?<Constant "(12)MENSAGEM 02 ">`
        DC32 `?<Constant "(13)MENSAGEM 03 ">`, `?<Constant "(14)MENSAGEM 04 ">`
        DC32 `?<Constant "(15)DESUMIDIF.  ">`, `?<Constant "(16)VOLTAR      ">`
        DC32 `?<Constant "(1) VALOR       ">`, `?<Constant "(2) CEDULAS     ">`
        DC32 `?<Constant "(3) GRATIS      ">`, `?<Constant "(4) FITA LED    ">`
        DC32 `?<Constant "(5) VOLUME MUS. ">`, `?<Constant "(6) VOLUME VOZ  ">`
        DC32 `?<Constant "(7) PROPAGANDA  ">`, `?<Constant "(8) TEMPO EMB.  ">`
        DC32 `?<Constant "(9) TROCO       ">`, `?<Constant "(10)COMISSAO    ">`
        DC32 `?<Constant "(11)MENSAGEM 01 ">`, `?<Constant "(12)MENSAGEM 02 ">`
        DC32 `?<Constant "(13)MENSAGEM 03 ">`, `?<Constant "(14)MENSAGEM 04 ">`
        DC32 `?<Constant "(15)DESUMIDIF.  ">`, `?<Constant "(16)VOLTAR      ">`
        DC32 `?<Constant "(1) VALOR       ">`, `?<Constant "(2) CEDULAS     ">`
        DC32 `?<Constant "(3) GRATIS      ">`, `?<Constant "(4) FITA LED    ">`
        DC32 `?<Constant "(5) VOLUME MUS. ">`, `?<Constant "(6) VOLUME VOZ  ">`
        DC32 `?<Constant "(7) PROPAGANDA  ">`, `?<Constant "(8) TEMPO EMB.  ">`
        DC32 `?<Constant "(9) TROCO       ">`, `?<Constant "(10)COMISSAO    ">`
        DC32 `?<Constant "(11)MENSAGEM 01 ">`, `?<Constant "(12)MENSAGEM 02 ">`
        DC32 `?<Constant "(13)MENSAGEM 03 ">`, `?<Constant "(14)MENSAGEM 04 ">`
        DC32 `?<Constant "(15)DESUMIDIF.  ">`, `?<Constant "(16)VOLTAR      ">`
        DC32 `?<Constant "(1) VALOR       ">`, `?<Constant "(2) CEDULAS     ">`
        DC32 `?<Constant "(3) GRATIS      ">`, `?<Constant "(4) FITA LED    ">`
        DC32 `?<Constant "(5) VOLUME MUS. ">`, `?<Constant "(6) VOLUME VOZ  ">`
        DC32 `?<Constant "(7) PROPAGANDA  ">`, `?<Constant "(8) TEMPO EMB.  ">`
        DC32 `?<Constant "(9) TROCO       ">`, `?<Constant "(10)COMISSAO    ">`
        DC32 `?<Constant "(11)MENSAGEM 01 ">`, `?<Constant "(12)MENSAGEM 02 ">`
        DC32 `?<Constant "(13)MENSAGEM 03 ">`, `?<Constant "(14)MENSAGEM 04 ">`
        DC32 `?<Constant "(15)DESUMIDIF.  ">`, `?<Constant "(16)VOLTAR      ">`
        DC32 `?<Constant "(1) PRICE       ">`, `?<Constant "(2) CEDULAS     ">`
        DC32 `?<Constant "(3) GRATIS      ">`, `?<Constant "(4) FITA LED    ">`
        DC32 `?<Constant "(5) VOLUME MUS. ">`, `?<Constant "(6) VOLUME VOZ  ">`
        DC32 `?<Constant "(7) PROPAGANDA  ">`, `?<Constant "(8) TEMPO EMB.  ">`
        DC32 `?<Constant "(9) TROCO       ">`, `?<Constant "(10)COMISSAO    ">`
        DC32 `?<Constant "(11)MENSAGEM 01 ">`, `?<Constant "(12)MENSAGEM 02 ">`
        DC32 `?<Constant "(13)MENSAGEM 03 ">`, `?<Constant "(14)MENSAGEM 04 ">`
        DC32 `?<Constant "(15)DESUMIDIF.  ">`, `?<Constant "(16)VOLTAR      ">`
        DC32 `?<Constant "(1) VALOR       ">`, `?<Constant "(2) CEDULAS     ">`
        DC32 `?<Constant "(3) GRATIS      ">`, `?<Constant "(4) FITA LED    ">`
        DC32 `?<Constant "(5) VOLUME MUS. ">`, `?<Constant "(6) VOLUME VOZ  ">`
        DC32 `?<Constant "(7) PROPAGANDA  ">`, `?<Constant "(8) TEMPO EMB.  ">`
        DC32 `?<Constant "(9) TROCO       ">`, `?<Constant "(10)COMISSAO    ">`
        DC32 `?<Constant "(11)MENSAGEM 01 ">`, `?<Constant "(12)MENSAGEM 02 ">`
        DC32 `?<Constant "(13)MENSAGEM 03 ">`, `?<Constant "(14)MENSAGEM 04 ">`
        DC32 `?<Constant "(15)DESUMIDIF.  ">`, `?<Constant "(16)VOLTAR      ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_ajusta_valor[7]
STRING_titulo_ajusta_valor:
        DATA
        DC32 `?<Constant "VALOR PIPOCA">`, `?<Constant "VALOR PIPOCA">`
        DC32 `?<Constant "VALOR PIPOCA">`, `?<Constant "VALOR PIPOCA">`
        DC32 `?<Constant "VALOR PIPOCA">`, `?<Constant "POPCORN PRICE">`
        DC32 `?<Constant "VALOR PIPOCA">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_simbolo_moeda[7]
STRING_simbolo_moeda:
        DATA
        DC32 `?<Constant "R$">`, `?<Constant "$">`, `?<Constant "$">`
        DC32 `?<Constant "G$">`, `?<Constant "S/">`, `?<Constant "US$">`
        DC32 `?<Constant "C$">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_configuracao_notas[7]
STRING_titulo_configuracao_notas:
        DATA
        DC32 `?<Constant "NOTAS">`, `?<Constant "NOTAS">`
        DC32 `?<Constant "NOTAS">`, `?<Constant "NOTAS">`
        DC32 `?<Constant "NOTAS">`, `?<Constant "BILSS">`
        DC32 `?<Constant "NOTAS">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_tabela_cedulas_canais[7][6]
STRING_tabela_cedulas_canais:
        DATA
        DC32 `?<Constant "R$ 2,00  ">`, `?<Constant "R$ 5,00  ">`
        DC32 `?<Constant "R$ 10,00 ">`, `?<Constant "R$ 20,00 ">`
        DC32 `?<Constant "R$ 50,00 ">`, `?<Constant "R$ 100,00">`
        DC32 `?<Constant "R$ 2,00  ">`, `?<Constant "R$ 5,00  ">`
        DC32 `?<Constant "R$ 10,00 ">`, `?<Constant "R$ 20,00 ">`
        DC32 `?<Constant "R$ 50,00 ">`, `?<Constant "R$ 100,00">`
        DC32 `?<Constant "R$ 2,00  ">`, `?<Constant "R$ 5,00  ">`
        DC32 `?<Constant "R$ 10,00 ">`, `?<Constant "R$ 20,00 ">`
        DC32 `?<Constant "R$ 50,00 ">`, `?<Constant "R$ 100,00">`
        DC32 `?<Constant "R$ 2,00  ">`, `?<Constant "R$ 5,00  ">`
        DC32 `?<Constant "R$ 10,00 ">`, `?<Constant "R$ 20,00 ">`
        DC32 `?<Constant "R$ 50,00 ">`, `?<Constant "R$ 100,00">`
        DC32 `?<Constant "R$ 2,00  ">`, `?<Constant "R$ 5,00  ">`
        DC32 `?<Constant "R$ 10,00 ">`, `?<Constant "R$ 20,00 ">`
        DC32 `?<Constant "R$ 50,00 ">`, `?<Constant "R$ 100,00">`
        DC32 `?<Constant "U$ 1,00  ">`, `?<Constant "U$ 2,00  ">`
        DC32 `?<Constant "U$ 5,00  ">`, `?<Constant "U$ 10,00 ">`
        DC32 `?<Constant "U$ 20,00 ">`, `?<Constant "U$ 50,00 ">`
        DC32 `?<Constant "R$ 2,00  ">`, `?<Constant "R$ 5,00  ">`
        DC32 `?<Constant "R$ 10,00 ">`, `?<Constant "R$ 20,00 ">`
        DC32 `?<Constant "R$ 50,00 ">`, `?<Constant "R$ 100,00">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_teste_BV20[7]
STRING_mensagem_teste_BV20:
        DATA
        DC32 `?<Constant "TESTE CCTALK">`, `?<Constant "TESTE CCTALK">`
        DC32 `?<Constant "TESTE CCTALK">`, `?<Constant "TESTE CCTALK">`
        DC32 `?<Constant "TESTE CCTALK">`, `?<Constant "CCTALK TEST">`
        DC32 `?<Constant "TESTE CCTALK">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_teste_uca1[7]
STRING_mensagem_teste_uca1:
        DATA
        DC32 `?<Constant "MOEDEIRO PULSO">`, `?<Constant "MOEDEIRO PULSO">`
        DC32 `?<Constant "MOEDEIRO PULSO">`, `?<Constant "MOEDEIRO PULSO">`
        DC32 `?<Constant "MOEDEIRO PULSO">`, `?<Constant "COIN PULSE">`
        DC32 `?<Constant "MOEDEIRO PULSO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_teste_P70[7]
STRING_mensagem_teste_P70:
        DATA
        DC32 `?<Constant "NOTEIRO PULSO">`, `?<Constant "NOTEIRO PULSO">`
        DC32 `?<Constant "NOTEIRO PULSO">`, `?<Constant "NOTEIRO PULSO">`
        DC32 `?<Constant "NOTEIRO PULSO">`, `?<Constant "BILL PULSE">`
        DC32 `?<Constant "NOTEIRO PULSO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_teste_led_instrucao[7]
STRING_mensagem_teste_led_instrucao:
        DATA
        DC32 `?<Constant "LED INSTRUCAO">`, `?<Constant "LED INSTRUCAO">`
        DC32 `?<Constant "LED INSTRUCAO">`, `?<Constant "LED INSTRUCAO">`
        DC32 `?<Constant "LED INSTRUCAO">`, `?<Constant "INSTRUC. LED">`
        DC32 `?<Constant "LED INSTRUCAO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_opcoes_menu_acessorios[7][8]
STRING_opcoes_menu_acessorios:
        DATA
        DC32 `?<Constant "(1)IMPRESSORA   ">`, `?<Constant "(2)BILL CCTALK  ">`
        DC32 `?<Constant "(3)BILL MDB     ">`, `?<Constant "(4)COIN MDB     ">`
        DC32 `?<Constant "(5)CASHLESS MDB ">`, `?<Constant "(6)VALOR PUL. M ">`
        DC32 `?<Constant "(7)VALOR PUL. N ">`, `?<Constant "(8)VOLTAR       ">`
        DC32 `?<Constant "(1)IMPRESSORA   ">`, `?<Constant "(2)BILL CCTALK  ">`
        DC32 `?<Constant "(3)BILL MDB     ">`, `?<Constant "(4)COIN MDB     ">`
        DC32 `?<Constant "(5)CASHLESS MDB ">`, `?<Constant "(6)VALOR PUL. M ">`
        DC32 `?<Constant "(7)VALOR PUL. N ">`, `?<Constant "(8)VOLTAR       ">`
        DC32 `?<Constant "(1)IMPRESSORA   ">`, `?<Constant "(2)BILL CCTALK  ">`
        DC32 `?<Constant "(3)BILL MDB     ">`, `?<Constant "(4)COIN MDB     ">`
        DC32 `?<Constant "(5)CASHLESS MDB ">`, `?<Constant "(6)VALOR PUL. M ">`
        DC32 `?<Constant "(7)VALOR PUL. N ">`, `?<Constant "(8)VOLTAR       ">`
        DC32 `?<Constant "(1)IMPRESSORA   ">`, `?<Constant "(2)BILL CCTALK  ">`
        DC32 `?<Constant "(3)BILL MDB     ">`, `?<Constant "(4)COIN MDB     ">`
        DC32 `?<Constant "(5)CASHLESS MDB ">`, `?<Constant "(6)VALOR PUL. M ">`
        DC32 `?<Constant "(7)VALOR PUL. N ">`, `?<Constant "(8)VOLTAR       ">`
        DC32 `?<Constant "(1)IMPRESSORA   ">`, `?<Constant "(2)BILL CCTALK  ">`
        DC32 `?<Constant "(3)BILL MDB     ">`, `?<Constant "(4)COIN MDB     ">`
        DC32 `?<Constant "(5)CASHLESS MDB ">`, `?<Constant "(6)VALOR PUL. M ">`
        DC32 `?<Constant "(7)VALOR PUL. N ">`, `?<Constant "(8)VOLTAR       ">`
        DC32 `?<Constant "(1) PRINTER     ">`, `?<Constant "(2)BILL CCTALK  ">`
        DC32 `?<Constant "(3)BILL MDB     ">`, `?<Constant "(4)COIN MDB     ">`
        DC32 `?<Constant "(5)CASHLESS MDB ">`, `?<Constant "(6)VALUE COIN P ">`
        DC32 `?<Constant "(7)VALUE BILL P ">`, `?<Constant "(8)EXIT         ">`
        DC32 `?<Constant "(1)IMPRESSORA   ">`, `?<Constant "(2)BILL CCTALK  ">`
        DC32 `?<Constant "(3)BILL MDB     ">`, `?<Constant "(4)COIN MDB     ">`
        DC32 `?<Constant "(5)CASHLESS MDB ">`, `?<Constant "(6)VALOR PUL. M ">`
        DC32 `?<Constant "(7)VALOR PUL. N ">`, `?<Constant "(8)VOLTAR       ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_menu_acessorios[7]
STRING_titulo_menu_acessorios:
        DATA
        DC32 `?<Constant "ACESSORIOS">`, `?<Constant "ACESSORIOS">`
        DC32 `?<Constant "ACESSORIOS">`, `?<Constant "ACESSORIOS">`
        DC32 `?<Constant "ACESSORIOS">`, `?<Constant "ACESSORIES">`
        DC32 `?<Constant "ACESSORIOS">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_tela_edita_flag_BV20[7]
STRING_tela_edita_flag_BV20:
        DATA
        DC32 `?<Constant "BV20 CCTALK">`, `?<Constant "BV20 CCTALK">`
        DC32 `?<Constant "BV20 CCTALK">`, `?<Constant "BV20 CCTALK">`
        DC32 `?<Constant "BV20 CCTALK">`, `?<Constant "BV20 CCTALK">`
        DC32 `?<Constant "BV20 CCTALK">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_edita_flag_mdb_bill[7]
STRING_titulo_edita_flag_mdb_bill:
        DATA
        DC32 `?<Constant "MDB BILL">`, `?<Constant "MDB BILL">`
        DC32 `?<Constant "MDB BILL">`, `?<Constant "MDB BILL">`
        DC32 `?<Constant "MDB BILL">`, `?<Constant "MDB BILL">`
        DC32 `?<Constant "MDB BILL">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_edita_flag_mdb_coin[7]
STRING_titulo_edita_flag_mdb_coin:
        DATA
        DC32 `?<Constant "MDB COIN">`, `?<Constant "MDB COIN">`
        DC32 `?<Constant "MDB COIN">`, `?<Constant "MDB COIN">`
        DC32 `?<Constant "MDB COIN">`, `?<Constant "MDB COIN">`
        DC32 `?<Constant "MDB COIN">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_edita_flag_mdb_cashless[7]
STRING_titulo_edita_flag_mdb_cashless:
        DATA
        DC32 `?<Constant "MDB CASHLESS">`, `?<Constant "MDB CASHLESS">`
        DC32 `?<Constant "MDB CASHLESS">`, `?<Constant "MDB CASHLESS">`
        DC32 `?<Constant "MDB CASHLESS">`, `?<Constant "MDB CASHLESS">`
        DC32 `?<Constant "MDB CASHLESS">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_edita_baudrate[7]
STRING_titulo_edita_baudrate:
        DATA
        DC32 `?<Constant "BAUD IMPRESSORA">`, `?<Constant "BAUD IMPRESSORA">`
        DC32 `?<Constant "BAUD IMPRESSORA">`, `?<Constant "BAUD IMPRESSORA">`
        DC32 `?<Constant "BAUD IMPRESSORA">`, `?<Constant "BAUD PRINTER">`
        DC32 `?<Constant "BAUD IMPRESSORA">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_edita_pulso_moeda[7]
STRING_titulo_edita_pulso_moeda:
        DATA
        DC32 `?<Constant "PULSO MOEDEIRO">`, `?<Constant "PULSO MOEDEIRO">`
        DC32 `?<Constant "PULSO MOEDEIRO">`, `?<Constant "PULSO MOEDEIRO">`
        DC32 `?<Constant "PULSO MOEDEIRO">`, `?<Constant "COIN PULSE">`
        DC32 `?<Constant "PULSO MOEDEIRO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_edita_pulso_noteiro[7]
STRING_titulo_edita_pulso_noteiro:
        DATA
        DC32 `?<Constant "PULSO NOTEIRO">`, `?<Constant "PULSO NOTEIRO">`
        DC32 `?<Constant "PULSO NOTEIRO">`, `?<Constant "PULSO NOTEIRO">`
        DC32 `?<Constant "PULSO NOTEIRO">`, `?<Constant "BILL PULSE">`
        DC32 `?<Constant "PULSO NOTEIRO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_opcoes_menu_mdb[7][5]
STRING_opcoes_menu_mdb:
        DATA
        DC32 `?<Constant "(1) MDB DEVICES ">`, `?<Constant "(2) BILL        ">`
        DC32 `?<Constant "(3) COIN        ">`, `?<Constant "(4) CASHLESS    ">`
        DC32 `?<Constant "(5) VOLTAR      ">`, `?<Constant "(1) MDB DEVICES ">`
        DC32 `?<Constant "(2) BILL        ">`, `?<Constant "(3) COIN        ">`
        DC32 `?<Constant "(4) CASHLESS    ">`, `?<Constant "(5) VOLTAR      ">`
        DC32 `?<Constant "(1) MDB DEVICES ">`, `?<Constant "(2) BILL        ">`
        DC32 `?<Constant "(3) COIN        ">`, `?<Constant "(4) CASHLESS    ">`
        DC32 `?<Constant "(5) VOLTAR      ">`, `?<Constant "(1) MDB DEVICES ">`
        DC32 `?<Constant "(2) BILL        ">`, `?<Constant "(3) COIN        ">`
        DC32 `?<Constant "(4) CASHLESS    ">`, `?<Constant "(5) VOLTAR      ">`
        DC32 `?<Constant "(1) MDB DEVICES ">`, `?<Constant "(2) BILL        ">`
        DC32 `?<Constant "(3) COIN        ">`, `?<Constant "(4) CASHLESS    ">`
        DC32 `?<Constant "(5) VOLTAR      ">`, `?<Constant "(1) MDB DEVICES ">`
        DC32 `?<Constant "(2) BILL        ">`, `?<Constant "(3) COIN        ">`
        DC32 `?<Constant "(4) CASHLESS    ">`, `?<Constant "(5) VOLTAR      ">`
        DC32 `?<Constant "(1) MDB DEVICES ">`, `?<Constant "(2) BILL        ">`
        DC32 `?<Constant "(3) COIN        ">`, `?<Constant "(4) CASHLESS    ">`
        DC32 `?<Constant "(5) VOLTAR      ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_teste_devices_mdb[7]
STRING_titulo_teste_devices_mdb:
        DATA
        DC32 `?<Constant "DEVICES MDB">`, `?<Constant "DEVICES MDB">`
        DC32 `?<Constant "DEVICES MDB">`, `?<Constant "DEVICES MDB">`
        DC32 `?<Constant "DEVICES MDB">`, `?<Constant "DEVICES MDB">`
        DC32 `?<Constant "DEVICES MDB">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_teste_bill_mdb[7]
STRING_titulo_teste_bill_mdb:
        DATA
        DC32 `?<Constant "BILL MDB">`, `?<Constant "BILL MDB">`
        DC32 `?<Constant "BILL MDB">`, `?<Constant "BILL MDB">`
        DC32 `?<Constant "BILL MDB">`, `?<Constant "BILL MDB">`
        DC32 `?<Constant "BILL MDB">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_teste_coin_mdb[7]
STRING_titulo_teste_coin_mdb:
        DATA
        DC32 `?<Constant "COIN MDB">`, `?<Constant "COIN MDB">`
        DC32 `?<Constant "COIN MDB">`, `?<Constant "COIN MDB">`
        DC32 `?<Constant "COIN MDB">`, `?<Constant "COIN MDB">`
        DC32 `?<Constant "COIN MDB">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_teste_coin_changer_mdb[7]
STRING_titulo_teste_coin_changer_mdb:
        DATA
        DC32 `?<Constant "TROCO MDB">`, `?<Constant "COIN MDB">`
        DC32 `?<Constant "COIN MDB">`, `?<Constant "COIN MDB">`
        DC32 `?<Constant "COIN MDB">`, `?<Constant "COIN MDB">`
        DC32 `?<Constant "COIN MDB">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_teste_cashless_mdb[7]
STRING_titulo_teste_cashless_mdb:
        DATA
        DC32 `?<Constant "CASHLESS MDB">`, `?<Constant "CASHLESS MDB">`
        DC32 `?<Constant "CASHLESS MDB">`, `?<Constant "CASHLESS MDB">`
        DC32 `?<Constant "CASHLESS MDB">`, `?<Constant "CASHLESS MDB">`
        DC32 `?<Constant "CASHLESS MDB">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_menu_mdb[7]
STRING_titulo_menu_mdb:
        DATA
        DC32 `?<Constant "TESTE MDB">`, `?<Constant "TESTE MDB">`
        DC32 `?<Constant "TESTE MDB">`, `?<Constant "TESTE MDB">`
        DC32 `?<Constant "TESTE MDB">`, `?<Constant "MDB TEST">`
        DC32 `?<Constant "TESTE MDB">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_saudacao_maquina[7][2]
STRING_mensagem_saudacao_maquina:
        DATA
        DC32 `?<Constant "Mais Pipoca">`, `?<Constant "Grupo Altech">`
        DC32 `?<Constant "Mais Pipoca">`, `?<Constant "Grupo Altech">`
        DC32 `?<Constant "Mais Pipoca">`, `?<Constant "Grupo Altech">`
        DC32 `?<Constant "Mais Pipoca">`, `?<Constant "Grupo Altech">`
        DC32 `?<Constant "Mais Pipoca">`, `?<Constant "Grupo Altech">`
        DC32 `?<Constant "Mais Pipoca">`, `?<Constant "Grupo Altech">`
        DC32 `?<Constant "Mais Pipoca">`, `?<Constant "Grupo Altech">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_teste_lcd_externo[7]
STRING_titulo_teste_lcd_externo:
        DATA
        DC32 `?<Constant "TESTE LCD EXT">`, `?<Constant "TESTE LCD EXT">`
        DC32 `?<Constant "TESTE LCD EXT">`, `?<Constant "TESTE LCD EXT">`
        DC32 `?<Constant "TESTE LCD EXT">`, `?<Constant "EXT LCD TEST">`
        DC32 `?<Constant "TESTE LCD EXT">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_impressao_teste[7][4]
STRING_impressao_teste:
        DATA
        DC32 `?<Constant "TESTE DA IMPRESSORA\\n\\r">`
        DC32 `?<Constant "GRUPO ALTECH 2017\\n\\r">`
        DC32 `?<Constant "MAIS PIPOCA E\\n\\r">`
        DC32 `?<Constant "\\n\\r\\n\\r\\n\\r\\n\\r">`
        DC32 `?<Constant "TESTE DA IMPRESSORA\\n\\r">`
        DC32 `?<Constant "GRUPO ALTECH 2017\\n\\r">`
        DC32 `?<Constant "MAIS PIPOCA E\\n\\r">`
        DC32 `?<Constant "\\n\\r\\n\\r\\n\\r\\n\\r">`
        DC32 `?<Constant "TESTE DA IMPRESSORA\\n\\r">`
        DC32 `?<Constant "GRUPO ALTECH 2017\\n\\r">`
        DC32 `?<Constant "MAIS PIPOCA E\\n\\r">`
        DC32 `?<Constant "\\n\\r\\n\\r\\n\\r\\n\\r">`
        DC32 `?<Constant "TESTE DA IMPRESSORA\\n\\r">`
        DC32 `?<Constant "GRUPO ALTECH 2017\\n\\r">`
        DC32 `?<Constant "MAIS PIPOCA E\\n\\r">`
        DC32 `?<Constant "\\n\\r\\n\\r\\n\\r\\n\\r">`
        DC32 `?<Constant "TESTE LCD EXT">`
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC32 `?<Constant "TESTE DA IMPRESSORA\\n\\r">`
        DC32 `?<Constant "GRUPO ALTECH 2017\\n\\r">`
        DC32 `?<Constant "MAIS PIPOCA E\\n\\r">`
        DC32 `?<Constant "\\n\\r\\n\\r\\n\\r\\n\\r">`
        DC32 `?<Constant "TESTE DA IMPRESSORA\\n\\r">`
        DC32 `?<Constant "GRUPO ALTECH 2017\\n\\r">`
        DC32 `?<Constant "MAIS PIPOCA E\\n\\r">`
        DC32 `?<Constant "\\n\\r\\n\\r\\n\\r\\n\\r">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_teste_impresora[7][2]
STRING_titulo_teste_impresora:
        DATA
        DC32 `?<Constant "TESTE IMPRESSORA">`, `?<Constant "<enter>IMPRIME">`
        DC32 `?<Constant "TESTE IMPRESSORA">`, `?<Constant "<enter>IMPRIME">`
        DC32 `?<Constant "TESTE IMPRESSORA">`, `?<Constant "<enter>IMPRIME">`
        DC32 `?<Constant "TESTE IMPRESSORA">`, `?<Constant "<enter>IMPRIME">`
        DC32 `?<Constant "TESTE IMPRESSORA">`, `?<Constant "<enter>IMPRIME">`
        DC32 `?<Constant "PRINTER TESTE">`, `?<Constant "<enter>PRINT">`
        DC32 `?<Constant "TESTE IMPRESSORA">`, `?<Constant "<enter>IMPRIME">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_menu_faturamento[7]
STRING_titulo_menu_faturamento:
        DATA
        DC32 `?<Constant "FATURAMENTO">`, `?<Constant "FATURAMENTO">`
        DC32 `?<Constant "FATURAMENTO">`, `?<Constant "FATURAMENTO">`
        DC32 `?<Constant "FATURAMENTO">`, `?<Constant "BILLING">`
        DC32 `?<Constant "FATURAMENTO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_opcoes_menu_faturamento[7][6]
STRING_opcoes_menu_faturamento:
        DATA
        DC32 `?<Constant "(1)CONTADOR     ">`, `?<Constant "(2)FATURAMENTO  ">`
        DC32 `?<Constant "(3)CARTAO       ">`, `?<Constant "(4)RELATORIO    ">`
        DC32 `?<Constant "(5)ZERAMENTO    ">`, `?<Constant "(6)VOLTAR       ">`
        DC32 `?<Constant "(1)CONTADOR     ">`, `?<Constant "(2)FATURAMENTO  ">`
        DC32 `?<Constant "(3)CARTAO       ">`, `?<Constant "(4)RELATORIO    ">`
        DC32 `?<Constant "(5)ZERAMENTO    ">`, `?<Constant "(6)VOLTAR       ">`
        DC32 `?<Constant "(1)CONTADOR     ">`, `?<Constant "(2)FATURAMENTO  ">`
        DC32 `?<Constant "(3)CARTAO       ">`, `?<Constant "(4)RELATORIO    ">`
        DC32 `?<Constant "(5)ZERAMENTO    ">`, `?<Constant "(6)VOLTAR       ">`
        DC32 `?<Constant "(1)CONTADOR     ">`, `?<Constant "(2)FATURAMENTO  ">`
        DC32 `?<Constant "(3)CARTAO       ">`, `?<Constant "(4)RELATORIO    ">`
        DC32 `?<Constant "(5)ZERAMENTO    ">`, `?<Constant "(6)VOLTAR       ">`
        DC32 `?<Constant "(1)CONTADOR     ">`, `?<Constant "(2)FATURAMENTO  ">`
        DC32 `?<Constant "(3)CARTAO       ">`, `?<Constant "(4)RELATORIO    ">`
        DC32 `?<Constant "(5)ZERAMENTO    ">`, `?<Constant "(6)VOLTAR       ">`
        DC32 `?<Constant "(1)COUNTER      ">`, `?<Constant "(2)BILLING      ">`
        DC32 `?<Constant "(3)CREDIT CARD  ">`, `?<Constant "(4)REPORT       ">`
        DC32 `?<Constant "(5)RESET COUNT  ">`, `?<Constant "(6)EXIT         ">`
        DC32 `?<Constant "(1)CONTADOR     ">`, `?<Constant "(2)FATURAMENTO  ">`
        DC32 `?<Constant "(3)CARTAO       ">`, `?<Constant "(4)RELATORIO    ">`
        DC32 `?<Constant "(5)ZERAMENTO    ">`, `?<Constant "(6)VOLTAR       ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_opcoes_menu_preparacao[7][3]
STRING_opcoes_menu_preparacao:
        DATA
        DC32 `?<Constant "(1) TEMPERATURA ">`, `?<Constant "(2) VELOCIDADE  ">`
        DC32 `?<Constant "(3) VOLTAR      ">`, `?<Constant "(1) TEMPERATURA ">`
        DC32 `?<Constant "(2) VELOCIDADE  ">`, `?<Constant "(3) VOLTAR      ">`
        DC32 `?<Constant "(1) TEMPERATURA ">`, `?<Constant "(2) VELOCIDADE  ">`
        DC32 `?<Constant "(3) VOLTAR      ">`, `?<Constant "(1) TEMPERATURA ">`
        DC32 `?<Constant "(2) VELOCIDADE  ">`, `?<Constant "(3) VOLTAR      ">`
        DC32 `?<Constant "(1) TEMPERATURA ">`, `?<Constant "(2) VELOCIDADE  ">`
        DC32 `?<Constant "(3) VOLTAR      ">`, `?<Constant "(1) TEMPERATURE ">`
        DC32 `?<Constant "(2) BLOWER SPEED">`, `?<Constant "(3) EXIT        ">`
        DC32 `?<Constant "(1) TEMPERATURA ">`, `?<Constant "(2) VELOCIDADE  ">`
        DC32 `?<Constant "(3) VOLTAR      ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_menu_preparacao[7]
STRING_titulo_menu_preparacao:
        DATA
        DC32 `?<Constant "PREPARACAO">`, `?<Constant "PREPARACAO">`
        DC32 `?<Constant "PREPARACAO">`, `?<Constant "PREPARACAO">`
        DC32 `?<Constant "PREPARACAO">`, `?<Constant "PREPARATION">`
        DC32 `?<Constant "PREPARACAO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_edita_temperatura[7]
STRING_titulo_edita_temperatura:
        DATA
        DC32 `?<Constant "TEMPERATURA">`, `?<Constant "TEMPERATURA">`
        DC32 `?<Constant "TEMPERATURA">`, `?<Constant "TEMPERATURA">`
        DC32 `?<Constant "TEMPERATURA">`, `?<Constant "TEMPERATURE">`
        DC32 `?<Constant "TEMPERATURA">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_edita_velocidade[7]
STRING_titulo_edita_velocidade:
        DATA
        DC32 `?<Constant "VELOCIDADE">`, `?<Constant "VELOCIDADE">`
        DC32 `?<Constant "VELOCIDADE">`, `?<Constant "VELOCIDADE">`
        DC32 `?<Constant "SPEED">`, `?<Constant "VELOCIDADE">`
        DC32 `?<Constant "VELOCIDADE">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_pipocas_prontas[7]
STRING_mensagem_pipocas_prontas:
        DATA
        DC32 `?<Constant "   PRONTAS EM  ">`, `?<Constant "PRUENTAS EN">`
        DC32 `?<Constant "VELOCIDADE">`, `?<Constant "VELOCIDADE">`
        DC32 `?<Constant "VELOCIDADE">`, `?<Constant "TASTIER IN">`
        DC32 `?<Constant "VELOCIDADE">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_preco[7]
STRING_mensagem_preco:
        DATA
        DC32 `?<Constant "Valor(R$) %3d,%02d">`
        DC32 `?<Constant "Valor($S) %05d.%02d">`, `?<Constant "VELOCIDADE">`
        DC32 `?<Constant "VELOCIDADE">`, `?<Constant "VELOCIDADE">`
        DC32 `?<Constant "Price(U$) %3d.%02d">`, `?<Constant "VELOCIDADE">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_pago[7]
STRING_mensagem_pago:
        DATA
        DC32 `?<Constant "Pago (R$) %3d,%02d">`
        DC32 `?<Constant "Pago (R$) %3d,%02d">`
        DC32 `?<Constant "Pago (R$) %3d,%02d">`
        DC32 `?<Constant "Pago (R$) %3d,%02d">`
        DC32 `?<Constant "Pago (R$) %3d,%02d">`
        DC32 `?<Constant "Paid (U$) %3d,%02d">`
        DC32 `?<Constant "Pago (R$) %3d,%02d">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_limpeza[7][2]
STRING_mensagem_limpeza:
        DATA
        DC32 `?<Constant "RETIRE AS">`, `?<Constant "PIPOCAS">`
        DC32 `?<Constant "RETIRE AS">`, `?<Constant "PIPOCAS">`
        DC32 `?<Constant "RETIRE AS">`, `?<Constant "PIPOCAS">`
        DC32 `?<Constant "RETIRE AS">`, `?<Constant "PIPOCAS">`
        DC32 `?<Constant "RETIRE AS">`, `?<Constant "PIPOCAS">`
        DC32 `?<Constant "GET YOUR">`, `?<Constant "POPCORN">`
        DC32 `?<Constant "RETIRE AS">`, `?<Constant "PIPOCAS">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_resfriando[7][2]
STRING_mensagem_resfriando:
        DATA
        DC32 `?<Constant "   RESFRIANDO  ">`, `?<Constant "   AGUARDE...  ">`
        DC32 `?<Constant "   RESFRIANDO  ">`, `?<Constant "   AGUARDE...  ">`
        DC32 `?<Constant "   RESFRIANDO  ">`, `?<Constant "   AGUARDE...  ">`
        DC32 `?<Constant "   RESFRIANDO  ">`, `?<Constant "   AGUARDE...  ">`
        DC32 `?<Constant "   RESFRIANDO  ">`, `?<Constant "   AGUARDE...  ">`
        DC32 `?<Constant "   COOLING     ">`, `?<Constant "   HEATING     ">`
        DC32 `?<Constant "   RESFRIANDO  ">`, `?<Constant "   AGUARDE...  ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_inicio_preparacao[7][2]
STRING_mensagem_inicio_preparacao:
        DATA
        DC32 `?<Constant "   INICIANDO   ">`, `?<Constant "   PREPARACAO  ">`
        DC32 `?<Constant "   RESFRIANDO  ">`, `?<Constant "   AGUARDE...  ">`
        DC32 `?<Constant "   RESFRIANDO  ">`, `?<Constant "   AGUARDE...  ">`
        DC32 `?<Constant "   RESFRIANDO  ">`, `?<Constant "   AGUARDE...  ">`
        DC32 `?<Constant "   RESFRIANDO  ">`, `?<Constant "   AGUARDE...  ">`
        DC32 `?<Constant "STARTING">`, `?<Constant "PREPARATION">`
        DC32 `?<Constant "   RESFRIANDO  ">`, `?<Constant "   AGUARDE...  ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_limpeza_inicial[7][2]
STRING_mensagem_limpeza_inicial:
        DATA
        DC32 `?<Constant "LIMPANDO">`, `?<Constant "COMPARTIMENTO">`
        DC32 `?<Constant "LIMPANDO">`, `?<Constant "COMPARTIMENTO">`
        DC32 `?<Constant "LIMPANDO">`, `?<Constant "COMPARTIMENTO">`
        DC32 `?<Constant "LIMPANDO">`, `?<Constant "COMPARTIMENTO">`
        DC32 `?<Constant "LIMPANDO">`, `?<Constant "COMPARTIMENTO">`
        DC32 `?<Constant "CLEANING">`, `?<Constant "HEATING">`
        DC32 `?<Constant "LIMPANDO">`, `?<Constant "COMPARTIMENTO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_edita_tempo_embalagem[7]
STRING_mensagem_edita_tempo_embalagem:
        DATA
        DC32 `?<Constant "TEMPO MOTOR EMB.">`, `?<Constant "TEMPO MOTOR EMB.">`
        DC32 `?<Constant "TEMPO MOTOR EMB.">`, `?<Constant "TEMPO MOTOR EMB.">`
        DC32 `?<Constant "TEMPO MOTOR EMB.">`, `?<Constant "TIME CUP MOTOR">`
        DC32 `?<Constant "TEMPO MOTOR EMB.">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_menu_servico[7][6]
STRING_menu_servico:
        DATA
        DC32 `?<Constant "(1) LIMPEZA     ">`, `?<Constant "(2) EMBALAGEM   ">`
        DC32 `?<Constant "(3) PORCAO MILHO">`, `?<Constant "(4) RESFRIAMENTO">`
        DC32 `?<Constant "(5) PREPARACAO  ">`, `?<Constant "(6) VOLTAR      ">`
        DC32 `?<Constant "(1) LIMPEZA     ">`, `?<Constant "(2) EMBALAGEM   ">`
        DC32 `?<Constant "(3) PORCAO MILHO">`, `?<Constant "(4) RESFRIAMENTO">`
        DC32 `?<Constant "(5) PREPARACAO  ">`, `?<Constant "(6) VOLTAR      ">`
        DC32 `?<Constant "(1) LIMPEZA     ">`, `?<Constant "(2) EMBALAGEM   ">`
        DC32 `?<Constant "(3) PORCAO MILHO">`, `?<Constant "(4) RESFRIAMENTO">`
        DC32 `?<Constant "(5) PREPARACAO  ">`, `?<Constant "(6) VOLTAR      ">`
        DC32 `?<Constant "(1) LIMPEZA     ">`, `?<Constant "(2) EMBALAGEM   ">`
        DC32 `?<Constant "(3) PORCAO MILHO">`, `?<Constant "(4) RESFRIAMENTO">`
        DC32 `?<Constant "(5) PREPARACAO  ">`, `?<Constant "(6) VOLTAR      ">`
        DC32 `?<Constant "(1) LIMPEZA     ">`, `?<Constant "(2) EMBALAGEM   ">`
        DC32 `?<Constant "(3) PORCAO MILHO">`, `?<Constant "(4) RESFRIAMENTO">`
        DC32 `?<Constant "(5) PREPARACAO  ">`, `?<Constant "(6) VOLTAR      ">`
        DC32 `?<Constant "(1) CLEANING    ">`, `?<Constant "(2) CUP         ">`
        DC32 `?<Constant "(3) CORN PORTION">`, `?<Constant "(4) COOLING     ">`
        DC32 `?<Constant "(5) PREPARATION ">`, `?<Constant "(6) EXIT        ">`
        DC32 `?<Constant "(1) LIMPEZA     ">`, `?<Constant "(2) EMBALAGEM   ">`
        DC32 `?<Constant "(3) PORCAO MILHO">`, `?<Constant "(4) RESFRIAMENTO">`
        DC32 `?<Constant "(5) PREPARACAO  ">`, `?<Constant "(6) VOLTAR      ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_menu_servico[7]
STRING_titulo_menu_servico:
        DATA
        DC32 `?<Constant "MENU SERVICO">`, `?<Constant "MENU SERVICO">`
        DC32 `?<Constant "MENU SERVICO">`, `?<Constant "MENU SERVICO">`
        DC32 `?<Constant "MENU SERVICO">`, `?<Constant "SERVICE">`
        DC32 `?<Constant "MENU SERVICO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_libera_embalagem[7][2]
STRING_mensagem_libera_embalagem:
        DATA
        DC32 `?<Constant "LIBERANDO">`, `?<Constant "EMBALAGEM">`
        DC32 `?<Constant "LIBERANDO">`, `?<Constant "EMBALAGEM">`
        DC32 `?<Constant "LIBERANDO">`, `?<Constant "EMBALAGEM">`
        DC32 `?<Constant "LIBERANDO">`, `?<Constant "EMBALAGEM">`
        DC32 `?<Constant "LIBERANDO">`, `?<Constant "EMBALAGEM">`
        DC32 `?<Constant "CUP">`, `?<Constant "DISPENSING">`
        DC32 `?<Constant "LIBERANDO">`, `?<Constant "EMBALAGEM">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_dosando_milho[7][2]
STRING_mensagem_dosando_milho:
        DATA
        DC32 `?<Constant "DOSANDO">`, `?<Constant "MILHO">`
        DC32 `?<Constant "DOSANDO">`, `?<Constant "MILHO">`
        DC32 `?<Constant "DOSANDO">`, `?<Constant "MILHO">`
        DC32 `?<Constant "DOSANDO">`, `?<Constant "MILHO">`
        DC32 `?<Constant "DOSANDO">`, `?<Constant "MILHO">`
        DC32 `?<Constant "CORN">`, `?<Constant "PORTION">`
        DC32 `?<Constant "DOSANDO">`, `?<Constant "MILHO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_menu_teste_musica[7]
STRING_titulo_menu_teste_musica:
        DATA
        DC32 `?<Constant "TESTE MUSICA">`, `?<Constant "TESTE MUSICA">`
        DC32 `?<Constant "TESTE MUSICA">`, `?<Constant "TESTE MUSICA">`
        DC32 `?<Constant "TESTE MUSICA">`, `?<Constant "MUSIC TEST">`
        DC32 `?<Constant "TESTE MUSICA">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_menu_edita_volume_musica[7]
STRING_titulo_menu_edita_volume_musica:
        DATA
        DC32 `?<Constant "VOLUME MUSICA">`, `?<Constant "VOLUME MUSICA">`
        DC32 `?<Constant "VOLUME MUSICA">`, `?<Constant "VOLUME MUSICA">`
        DC32 `?<Constant "VOLUME MUSICA">`, `?<Constant "MUSIC LEVEL">`
        DC32 `?<Constant "VOLUME MUSICA">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_menu_edita_volume_voz[7]
STRING_titulo_menu_edita_volume_voz:
        DATA
        DC32 `?<Constant "VOLUME VOZ">`, `?<Constant "VOLUME VOZ">`
        DC32 `?<Constant "VOLUME VOZ">`, `?<Constant "VOLUME VOZ">`
        DC32 `?<Constant "VOLUME VOZ">`, `?<Constant "VOICE LEVEL">`
        DC32 `?<Constant "VOLUME VOZ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_menu_teste_vozes[7]
STRING_titulo_menu_teste_vozes:
        DATA
        DC32 `?<Constant "TESTE LOCUCOES">`, `?<Constant "TESTE LOCUCOES">`
        DC32 `?<Constant "TESTE LOCUCOES">`, `?<Constant "TESTE LOCUCOES">`
        DC32 `?<Constant "TESTE LOCUCOES">`, `?<Constant "VOICE TESTE">`
        DC32 `?<Constant "TESTE LOCUCOES">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_menu_intervalo_prop[7]
STRING_titulo_menu_intervalo_prop:
        DATA
        DC32 `?<Constant "TEMPO PROP.">`, `?<Constant "TEMPO PROP.">`
        DC32 `?<Constant "TEMPO PROP.">`, `?<Constant "TEMPO PROP.">`
        DC32 `?<Constant "TEMPO PROP.">`, `?<Constant "TIME PROP">`
        DC32 `?<Constant "TEMPO PROP.">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_fora_servico[7]
STRING_mensagem_fora_servico:
        DATA
        DC32 `?<Constant "FORA DE SERVICO">`, `?<Constant "FORA DE SERVICO">`
        DC32 `?<Constant "FORA DE SERVICO">`, `?<Constant "FORA DE SERVICO">`
        DC32 `?<Constant "FORA DE SERVICO">`, `?<Constant "OUT OF SERVICE">`
        DC32 `?<Constant "FORA DE SERVICO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_inicio_autoteste[7][2]
STRING_mensagem_inicio_autoteste:
        DATA
        DC32 `?<Constant "   EXECUTANDO   ">`, `?<Constant "   AUTOTESTE    ">`
        DC32 `?<Constant "   EXECUTANDO   ">`, `?<Constant "   AUTOTESTE    ">`
        DC32 `?<Constant "   EXECUTANDO   ">`, `?<Constant "   AUTOTESTE    ">`
        DC32 `?<Constant "   EXECUTANDO   ">`, `?<Constant "   AUTOTESTE    ">`
        DC32 `?<Constant "   EXECUTANDO   ">`, `?<Constant "   AUTOTESTE    ">`
        DC32 `?<Constant "   EXECUTANDO   ">`, `?<Constant "   AUTOTESTE    ">`
        DC32 `?<Constant "   EXECUTANDO   ">`, `?<Constant "   AUTOTESTE    ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_retire_troco[7][2]
STRING_mensagem_retire_troco:
        DATA
        DC32 `?<Constant "RETIRE O SEU">`, `?<Constant "TROCO">`
        DC32 `?<Constant "RETIRE O SEU">`, `?<Constant "TROCO">`
        DC32 `?<Constant "RETIRE O SEU">`, `?<Constant "TROCO">`
        DC32 `?<Constant "RETIRE O SEU">`, `?<Constant "TROCO">`
        DC32 `?<Constant "RETIRE O SEU">`, `?<Constant "TROCO">`
        DC32 `?<Constant "GET YOUR">`, `?<Constant "CHANGE">`
        DC32 `?<Constant "RETIRE O SEU">`, `?<Constant "TROCO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_sem_troco[7][2]
STRING_mensagem_sem_troco:
        DATA
        DC32 `?<Constant "SEM TROCO">`, `?<Constant "PARA INICIAR">`
        DC32 `?<Constant "J\\'appelle">`, `?<Constant "Mais Pipoca">`
        DC32 `?<Constant "J\\'appelle">`, `?<Constant "Mais Pipoca">`
        DC32 `?<Constant "J\\'appelle">`, `?<Constant "Mais Pipoca">`
        DC32 `?<Constant "J\\'appelle">`, `?<Constant "Mais Pipoca">`
        DC32 `?<Constant "NO COINS">`, `?<Constant "FOR CHANGE">`
        DC32 `?<Constant "J\\'appelle">`, `?<Constant "Mais Pipoca">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_configura_free[7]
STRING_mensagem_configura_free:
        DATA
        DC32 `?<Constant "MODO GRATIS">`, `?<Constant "FORA DE SERVICO">`
        DC32 `?<Constant "FORA DE SERVICO">`, `?<Constant "FORA DE SERVICO">`
        DC32 `?<Constant "FORA DE SERVICO">`, `?<Constant "FREE MODE">`
        DC32 `?<Constant "FORA DE SERVICO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_configura_fita_led[7]
STRING_mensagem_configura_fita_led:
        DATA
        DC32 `?<Constant "FITA LED">`, `?<Constant "FORA DE SERVICO">`
        DC32 `?<Constant "FORA DE SERVICO">`, `?<Constant "FORA DE SERVICO">`
        DC32 `?<Constant "FORA DE SERVICO">`, `?<Constant "LED STRIP">`
        DC32 `?<Constant "FORA DE SERVICO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_modo_gratis[7][2]
STRING_mensagem_modo_gratis:
        DATA
        DC32 `?<Constant "PRESSIONE BOTAO">`, `?<Constant "  PARA INICIAR  ">`
        DC32 `?<Constant "J\\'appelle">`, `?<Constant "Mais Pipoca">`
        DC32 `?<Constant "J\\'appelle">`, `?<Constant "Mais Pipoca">`
        DC32 `?<Constant "J\\'appelle">`, `?<Constant "Mais Pipoca">`
        DC32 `?<Constant "J\\'appelle">`, `?<Constant "Mais Pipoca">`
        DC32 `?<Constant " PRESS BUTTON  ">`, `?<Constant "     TO START   ">`
        DC32 `?<Constant "J\\'appelle">`, `?<Constant "Mais Pipoca">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_noteiro_mdb_offline[7][2]
STRING_mensagem_noteiro_mdb_offline:
        DATA
        DC32 `?<Constant "BILL MDB OFFLINE">`, `?<Constant "E20">`
        DC32 `?<Constant "BILL MDB OFFLINE">`, `?<Constant "E20">`
        DC32 `?<Constant "BILL MDB OFFLINE">`, `?<Constant "E20">`
        DC32 `?<Constant "BILL MDB OFFLINE">`, `?<Constant "E20">`
        DC32 `?<Constant "BILL MDB OFFLINE">`, `?<Constant "E20">`
        DC32 `?<Constant "BILL MDB OFFLINE">`, `?<Constant "E20">`
        DC32 `?<Constant "BILL MDB OFFLINE">`, `?<Constant "E20">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_moedeiro_mdb_offline[7][2]
STRING_mensagem_moedeiro_mdb_offline:
        DATA
        DC32 `?<Constant "COIN MDB OFFLINE">`, `?<Constant "E20">`
        DC32 `?<Constant "COIN MDB OFFLINE">`, `?<Constant "E20">`
        DC32 `?<Constant "COIN MDB OFFLINE">`, `?<Constant "E20">`
        DC32 `?<Constant "COIN MDB OFFLINE">`, `?<Constant "E20">`
        DC32 `?<Constant "COIN MDB OFFLINE">`, `?<Constant "E20">`
        DC32 `?<Constant "COIN MDB OFFLINE">`, `?<Constant "E20">`
        DC32 `?<Constant "COIN MDB OFFLINE">`, `?<Constant "E20">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_cctalk_offline[7][2]
STRING_mensagem_cctalk_offline:
        DATA
        DC32 `?<Constant "CCTALK OFFLINE">`, `?<Constant "E21">`
        DC32 `?<Constant "CCTALK OFFLINE">`, `?<Constant "E21">`
        DC32 `?<Constant "CCTALK OFFLINE">`, `?<Constant "E21">`
        DC32 `?<Constant "CCTALK OFFLINE">`, `?<Constant "E21">`
        DC32 `?<Constant "CCTALK OFFLINE">`, `?<Constant "E21">`
        DC32 `?<Constant "CCTALK OFFLINE">`, `?<Constant "E21">`
        DC32 `?<Constant "CCTALK OFFLINE">`, `?<Constant "E21">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_checa_senha[7]
STRING_titulo_checa_senha:
        DATA
        DC32 `?<Constant "SENHA">`, `?<Constant "FORA DE SERVICO">`
        DC32 `?<Constant "FORA DE SERVICO">`, `?<Constant "FORA DE SERVICO">`
        DC32 `?<Constant "FORA DE SERVICO">`, `?<Constant "PASSWORD">`
        DC32 `?<Constant "FORA DE SERVICO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_configura_troco[7]
STRING_titulo_configura_troco:
        DATA
        DC32 `?<Constant "USO DE TROCO">`, `?<Constant "USO DE TROCO">`
        DC32 `?<Constant "USO DE TROCO">`, `?<Constant "USO DE TROCO">`
        DC32 `?<Constant "USO DE TROCO">`, `?<Constant "CHANGE USE">`
        DC32 `?<Constant "CHANGE USE">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_menu_avancado[7][8]
STRING_menu_avancado:
        DATA
        DC32 `?<Constant "(1) PADRAO FAB. ">`, `?<Constant "(2) SENHA ADMIN ">`
        DC32 `?<Constant "(3) RESET GERAL ">`, `?<Constant "(4) MOTOR AC    ">`
        DC32 `?<Constant "(5) NUM SERIE   ">`, `?<Constant "(6) HORA/DATA   ">`
        DC32 `?<Constant "(7) ERRO MOTOR  ">`, `?<Constant "(8) VOLTAR      ">`
        DC32 `?<Constant "(1) PADRAO FAB. ">`, `?<Constant "(2) SENHA ADMIN ">`
        DC32 `?<Constant "(3) RESET GERAL ">`, `?<Constant "(4) MOTOR AC    ">`
        DC32 `?<Constant "(5) NUM SERIE   ">`, `?<Constant "(6) HORA/DATA   ">`
        DC32 `?<Constant "(7) ERRO MOTOR  ">`, `?<Constant "(8) VOLTAR      ">`
        DC32 `?<Constant "(1) PADRAO FAB. ">`, `?<Constant "(2) SENHA ADMIN ">`
        DC32 `?<Constant "(3) RESET GERAL ">`, `?<Constant "(4) MOTOR AC    ">`
        DC32 `?<Constant "(5) NUM SERIE   ">`, `?<Constant "(6) HORA/DATA   ">`
        DC32 `?<Constant "(7) ERRO MOTOR  ">`, `?<Constant "(8) VOLTAR      ">`
        DC32 `?<Constant "(1) PADRAO FAB. ">`, `?<Constant "(2) SENHA ADMIN ">`
        DC32 `?<Constant "(3) RESET GERAL ">`, `?<Constant "(4) MOTOR AC    ">`
        DC32 `?<Constant "(5) NUM SERIE   ">`, `?<Constant "(6) HORA/DATA   ">`
        DC32 `?<Constant "(7) ERRO MOTOR  ">`, `?<Constant "(8) VOLTAR      ">`
        DC32 `?<Constant "(1) PADRAO FAB. ">`, `?<Constant "(2) SENHA ADMIN ">`
        DC32 `?<Constant "(3) RESET GERAL ">`, `?<Constant "(4) MOTOR AC    ">`
        DC32 `?<Constant "(5) NUM SERIE   ">`, `?<Constant "(6) HORA/DATA   ">`
        DC32 `?<Constant "(7) ERRO MOTOR  ">`, `?<Constant "(8) VOLTAR      ">`
        DC32 `?<Constant "(1) PADRAO FAB. ">`, `?<Constant "(2) SENHA ADMIN ">`
        DC32 `?<Constant "(3) RESET GERAL ">`, `?<Constant "(4) MOTOR AC    ">`
        DC32 `?<Constant "(5) NUM SERIE   ">`, `?<Constant "(6) HORA/DATA   ">`
        DC32 `?<Constant "(7) MOTOR ERROR ">`, `?<Constant "(8) VOLTAR      ">`
        DC32 `?<Constant "(1) PADRAO FAB. ">`, `?<Constant "(2) SENHA ADMIN ">`
        DC32 `?<Constant "(3) RESET GERAL ">`, `?<Constant "(4) MOTOR AC    ">`
        DC32 `?<Constant "(5) NUM SERIE   ">`, `?<Constant "(6) HORA/DATA   ">`
        DC32 `?<Constant "(7) MOTOR ERROR ">`, `?<Constant "(8) VOLTAR      ">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_menu_avancado[7]
STRING_titulo_menu_avancado:
        DATA
        DC32 `?<Constant "MENU AVANCADO">`, `?<Constant "MENU AVANCADO">`
        DC32 `?<Constant "MENU AVANCADO">`, `?<Constant "MENU AVANCADO">`
        DC32 `?<Constant "MENU AVANCADO">`, `?<Constant "MENU AVANCADO">`
        DC32 `?<Constant "MENU AVANCADO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_padrao_fabrica[7]
STRING_titulo_padrao_fabrica:
        DATA
        DC32 `?<Constant "PADRAO FABRICA">`, `?<Constant "PADRAO FABRICA">`
        DC32 `?<Constant "PADRAO FABRICA">`, `?<Constant "PADRAO FABRICA">`
        DC32 `?<Constant "PADRAO FABRICA">`, `?<Constant "PADRAO FABRICA">`
        DC32 `?<Constant "PADRAO FABRICA">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_reset_fabrica[7][2]
STRING_mensagem_reset_fabrica:
        DATA
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "PARAMETROS">`
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "PARAMETROS">`
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "PARAMETROS">`
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "PARAMETROS">`
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "PARAMETROS">`
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "PARAMETROS">`
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "PARAMETROS">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_inserir_senha[7]
STRING_mensagem_inserir_senha:
        DATA
        DC32 `?<Constant "NOVA SENHA">`, `?<Constant "NOVA SENHA">`
        DC32 `?<Constant "NOVA SENHA">`, `?<Constant "NOVA SENHA">`
        DC32 `?<Constant "NOVA SENHA">`, `?<Constant "NOVA SENHA">`
        DC32 `?<Constant "NOVA SENHA">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_cadastro_senha[7][2]
STRING_mensagem_cadastro_senha:
        DATA
        DC32 `?<Constant "CADASTRADO">`, `?<Constant "C/ SUCESSO">`
        DC32 `?<Constant "CADASTRADO">`, `?<Constant "C/ SUCESSO">`
        DC32 `?<Constant "CADASTRADO">`, `?<Constant "C/ SUCESSO">`
        DC32 `?<Constant "CADASTRADO">`, `?<Constant "C/ SUCESSO">`
        DC32 `?<Constant "CADASTRADO">`, `?<Constant "C/ SUCESSO">`
        DC32 `?<Constant "CADASTRADO">`, `?<Constant "C/ SUCESSO">`
        DC32 `?<Constant "CADASTRADO">`, `?<Constant "C/ SUCESSO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_cadastro_senha_erro[7][2]
STRING_mensagem_cadastro_senha_erro:
        DATA
        DC32 `?<Constant "SENHAS INF.">`, `?<Constant "SAO DIFERENTES">`
        DC32 `?<Constant "SENHAS INF.">`, `?<Constant "SAO DIFERENTES">`
        DC32 `?<Constant "SENHAS INF.">`, `?<Constant "SAO DIFERENTES">`
        DC32 `?<Constant "SENHAS INF.">`, `?<Constant "SAO DIFERENTES">`
        DC32 `?<Constant "SENHAS INF.">`, `?<Constant "SAO DIFERENTES">`
        DC32 `?<Constant "SENHAS INF.">`, `?<Constant "SAO DIFERENTES">`
        DC32 `?<Constant "SENHAS INF.">`, `?<Constant "SAO DIFERENTES">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_reinicia_totalizadores[7][2]
STRING_mensagem_reinicia_totalizadores:
        DATA
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "TOTALIZADORES">`
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "TOTALIZADORES">`
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "TOTALIZADORES">`
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "TOTALIZADORES">`
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "TOTALIZADORES">`
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "TOTALIZADORES">`
        DC32 `?<Constant "REINICIANDO">`, `?<Constant "TOTALIZADORES">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_mensagem_reinicia_totalizadores_erro[7][2]
STRING_mensagem_reinicia_totalizadores_erro:
        DATA
        DC32 `?<Constant "CODIGO">`, `?<Constant "INVALIDO">`
        DC32 `?<Constant "CODIGO">`, `?<Constant "INVALIDO">`
        DC32 `?<Constant "CODIGO">`, `?<Constant "INVALIDO">`
        DC32 `?<Constant "CODIGO">`, `?<Constant "INVALIDO">`
        DC32 `?<Constant "CODIGO">`, `?<Constant "INVALIDO">`
        DC32 `?<Constant "CODIGO">`, `?<Constant "INVALIDO">`
        DC32 `?<Constant "CODIGO">`, `?<Constant "INVALIDO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_edita_serial[7]
STRING_titulo_edita_serial:
        DATA
        DC32 `?<Constant "NUMERO SERIE">`, `?<Constant "NUMERO SERIE">`
        DC32 `?<Constant "NUMERO SERIE">`, `?<Constant "NUMERO SERIE">`
        DC32 `?<Constant "NUMERO SERIE">`, `?<Constant "NUMERO SERIE">`
        DC32 `?<Constant "NUMERO SERIE">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_edita_comissao[7]
STRING_titulo_edita_comissao:
        DATA
        DC32 `?<Constant "COMISSAO PONTO">`, `?<Constant "COMISSAO PONTO">`
        DC32 `?<Constant "COMISSAO PONTO">`, `?<Constant "COMISSAO PONTO">`
        DC32 `?<Constant "COMISSAO PONTO">`, `?<Constant "COMISSAO PONTO">`
        DC32 `?<Constant "COMISSAO PONTO">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char const *STRING_titulo_edita_flag_desumidifcador[7]
STRING_titulo_edita_flag_desumidifcador:
        DATA
        DC32 `?<Constant " HABILT. DESUM. ">`, `?<Constant " HABILT. DESUM. ">`
        DC32 `?<Constant " HABILT. DESUM. ">`, `?<Constant " HABILT. DESUM. ">`
        DC32 `?<Constant " HABILT. DESUM. ">`, `?<Constant " HABILT. DESUM. ">`
        DC32 `?<Constant " HABILT. DESUM. ">`
//   38 
//   39 /***********************************************************************************
//   40 *       Constantes
//   41 ***********************************************************************************/
//   42 
//   43 
//   44 
//   45 /***********************************************************************************
//   46 *       Implementação das funções
//   47 ***********************************************************************************/
//   48 
//   49 /***********************************************************************************
//   50 *       Descrição       :       Converte o enum idioma para a representação
//   51 *                               em string
//   52 *       Parametros      :       (eIDIOMA) idioma
//   53 *       Retorno         :       nenhum
//   54 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function STRING_idioma_to_string
        THUMB
//   55 char *STRING_idioma_to_string(eIDIOMA idioma){
STRING_idioma_to_string:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+28
          CFI CFA R13+36
        MOVS     R4,R0
//   56   const char *nome_idiomas[]={
//   57     "BRASIL",
//   58     "URUGUAY",
//   59     "ARGENTINA",
//   60     "PARAGUAY",
//   61     "PERU",
//   62     "EUA",
//   63     "CANADA"  
//   64   };
        ADD      R0,SP,#+0
        LDR.N    R1,??DataTable0
        MOVS     R2,#+28
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
//   65   
//   66   return (char*)nome_idiomas[idioma];
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+0
        LDR      R0,[R0, R4, LSL #+2]
        ADD      SP,SP,#+28
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   67 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     `?<Constant {&"BRASIL", &"URUGUAY", &"ARGENTINA`
//   68 /***********************************************************************************
//   69 *       Descrição       :       Escreve uma mensagem no LCD
//   70 *       Parametros      :       (char*) mensagem primeira linha
//   71 *                               (char*) mensagem da segunda linha
//   72 *       Retorno         :       nenhum
//   73 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function STRING_write_to_internal
        THUMB
//   74 void STRING_write_to_internal(eCLEAR clear,char* l1,char* l2){
STRING_write_to_internal:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R1
        MOVS     R5,R2
//   75   unsigned short int tam;
//   76   
//   77   if(clear==CLEAR_DISPLAY)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??STRING_write_to_internal_0
//   78     HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//   79     
//   80   if(l1!=NULL){
??STRING_write_to_internal_0:
        CMP      R4,#+0
        BEQ.N    ??STRING_write_to_internal_1
//   81     tam = strlen(l1);    
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
//   82     HD44780_posicionaTexto((16-tam)>>1,0);
        MOVS     R1,#+0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        RSBS     R0,R0,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//   83     HD44780_writeString(l1);
        MOVS     R0,R4
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//   84   }
//   85   
//   86   if(l2!=NULL){
??STRING_write_to_internal_1:
        CMP      R5,#+0
        BEQ.N    ??STRING_write_to_internal_2
//   87     tam = strlen(l2);
        MOVS     R0,R5
          CFI FunCall strlen
        BL       strlen
//   88     HD44780_posicionaTexto((16-tam)>>1,1);
        MOVS     R1,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        RSBS     R0,R0,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//   89     HD44780_writeString(l2);
        MOVS     R0,R5
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//   90   }  
//   91 }
??STRING_write_to_internal_2:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock1
//   92 /***********************************************************************************
//   93 *       Descrição       :       Escreve uma mensagem no LCD externo
//   94 *       Parametros      :       (char*) mensagem da primeira linha
//   95 *                               (char*) mensagem da segunda linha
//   96 *       Retorno         :       nenhum
//   97 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function STRING_write_to_external
        THUMB
//   98 void STRING_write_to_external(eCLEAR clear,char* l1,char* l2){
STRING_write_to_external:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R1
        MOVS     R5,R2
//   99   unsigned short int tam;
//  100   
//  101   if(clear==CLEAR_DISPLAY)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??STRING_write_to_external_0
//  102     HD44780_2_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_2_writeChar
        BL       HD44780_2_writeChar
//  103     
//  104   if(l1!=NULL){
??STRING_write_to_external_0:
        CMP      R4,#+0
        BEQ.N    ??STRING_write_to_external_1
//  105     tam = strlen(l1);    
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
//  106     HD44780_2_posicionaTexto((16-tam)>>1,0);
        MOVS     R1,#+0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        RSBS     R0,R0,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_2_posicionaTexto
        BL       HD44780_2_posicionaTexto
//  107     HD44780_2_writeString(l1);
        MOVS     R0,R4
          CFI FunCall HD44780_2_writeString
        BL       HD44780_2_writeString
//  108   }
//  109   
//  110   if(l2!=NULL){
??STRING_write_to_external_1:
        CMP      R5,#+0
        BEQ.N    ??STRING_write_to_external_2
//  111     tam = strlen(l2);
        MOVS     R0,R5
          CFI FunCall strlen
        BL       strlen
//  112     HD44780_2_posicionaTexto((16-tam)>>1,1);
        MOVS     R1,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        RSBS     R0,R0,#+16
        ASRS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_2_posicionaTexto
        BL       HD44780_2_posicionaTexto
//  113     HD44780_2_writeString(l2);
        MOVS     R0,R5
          CFI FunCall HD44780_2_writeString
        BL       HD44780_2_writeString
//  114   }   
//  115 }
??STRING_write_to_external_2:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock2

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "GRUPO ALTECH">`:
        DATA
        DC8 "GRUPO ALTECH"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "VER. 2.0.15">`:
        DATA
        DC8 "VER. 2.0.15"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "POPCORN KING">`:
        DATA
        DC8 "POPCORN KING"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "VER. 1.0.15">`:
        DATA
        DC8 "VER. 1.0.15"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CONFIGURACOES">`:
        DATA
        DC8 "CONFIGURACOES"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CONFIGURACIONS">`:
        DATA
        DC8 "CONFIGURACIONS"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SETUP">`:
        DATA
        DC8 "SETUP"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1)OPERACAO     ">`:
        DATA
        DC8 "(1)OPERACAO     "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(2)FATURAMENTO  ">`:
        DATA
        DC8 "(2)FATURAMENTO  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3)PREPARACAO   ">`:
        DATA
        DC8 "(3)PREPARACAO   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(4)ACESSORIOS   ">`:
        DATA
        DC8 "(4)ACESSORIOS   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(5)TELEMETRIA   ">`:
        DATA
        DC8 "(5)TELEMETRIA   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(6)TESTE HW     ">`:
        DATA
        DC8 "(6)TESTE HW     "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(7)REGIAO       ">`:
        DATA
        DC8 "(7)REGIAO       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(8)SERVICO      ">`:
        DATA
        DC8 "(8)SERVICO      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(9)AVANCADO     ">`:
        DATA
        DC8 "(9)AVANCADO     "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(10)SAIR        ">`:
        DATA
        DC8 "(10)SAIR        "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1)OPERATION    ">`:
        DATA
        DC8 "(1)OPERATION    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(2)BILLING      ">`:
        DATA
        DC8 "(2)BILLING      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3)PREPARATION  ">`:
        DATA
        DC8 "(3)PREPARATION  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(4)ACCESSORIES  ">`:
        DATA
        DC8 "(4)ACCESSORIES  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(5)TELEMETRY    ">`:
        DATA
        DC8 "(5)TELEMETRY    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(7)REGION       ">`:
        DATA
        DC8 "(7)REGION       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BRASIL       ">`:
        DATA
        DC8 "BRASIL       "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "URUGUAY      ">`:
        DATA
        DC8 "URUGUAY      "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ARGENTINA    ">`:
        DATA
        DC8 "ARGENTINA    "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PARAGUAY     ">`:
        DATA
        DC8 "PARAGUAY     "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PERU         ">`:
        DATA
        DC8 "PERU         "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "EUA          ">`:
        DATA
        DC8 "EUA          "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CANADA       ">`:
        DATA
        DC8 "CANADA       "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "USA          ">`:
        DATA
        DC8 "USA          "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BRAZIL       ">`:
        DATA
        DC8 "BRAZIL       "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TESTE DO HW">`:
        DATA
        DC8 "TESTE DO HW"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TESTE DO HD">`:
        DATA
        DC8 "TESTE DO HD"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TEST OF HW ">`:
        DATA
        DC8 "TEST OF HW "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1)HORA/DATA    ">`:
        DATA
        DC8 "(1)HORA/DATA    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(2)DATAFLASH    ">`:
        DATA
        DC8 "(2)DATAFLASH    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3)DISP. PAPEL  ">`:
        DATA
        DC8 "(3)DISP. PAPEL  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(4)DOSADOR MILHO">`:
        DATA
        DC8 "(4)DOSADOR MILHO"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(5)VENTILADOR   ">`:
        DATA
        DC8 "(5)VENTILADOR   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(6)RESISTENCIA  ">`:
        DATA
        DC8 "(6)RESISTENCIA  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(7)CCTALK       ">`:
        DATA
        DC8 "(7)CCTALK       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(8)MOEDEIRO PULS">`:
        DATA
        DC8 "(8)MOEDEIRO PULS"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(9)NOTEIRO PULSO">`:
        DATA
        DC8 "(9)NOTEIRO PULSO"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(10)MDB         ">`:
        DATA
        DC8 "(10)MDB         "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(11)IMPRESSORA  ">`:
        DATA
        DC8 "(11)IMPRESSORA  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(12)MUSICA      ">`:
        DATA
        DC8 "(12)MUSICA      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(13)LOCUCOES    ">`:
        DATA
        DC8 "(13)LOCUCOES    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(14)LEDS        ">`:
        DATA
        DC8 "(14)LEDS        "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(15)LCD EXTERNO ">`:
        DATA
        DC8 "(15)LCD EXTERNO "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(16)VOLTAR      ">`:
        DATA
        DC8 "(16)VOLTAR      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1)HOUR/DATE    ">`:
        DATA
        DC8 "(1)HOUR/DATE    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3)CUP DISPENSER">`:
        DATA
        DC8 "(3)CUP DISPENSER"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(4)CORN PORTION ">`:
        DATA
        DC8 "(4)CORN PORTION "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(5)BLOWER       ">`:
        DATA
        DC8 "(5)BLOWER       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(6)HEATING      ">`:
        DATA
        DC8 "(6)HEATING      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(8)COIN PULSE   ">`:
        DATA
        DC8 "(8)COIN PULSE   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(9)BILL PULSE   ">`:
        DATA
        DC8 "(9)BILL PULSE   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(11)PRINTER     ">`:
        DATA
        DC8 "(11)PRINTER     "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(12)MUSIC       ">`:
        DATA
        DC8 "(12)MUSIC       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(13)VOICE       ">`:
        DATA
        DC8 "(13)VOICE       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(15)EXTERNAL LCD">`:
        DATA
        DC8 "(15)EXTERNAL LCD"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TESTE RTC">`:
        DATA
        DC8 "TESTE RTC"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TEST RTC">`:
        DATA
        DC8 "TEST RTC"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TESTE DFLASH">`:
        DATA
        DC8 "TESTE DFLASH"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TEST DFLASH">`:
        DATA
        DC8 "TEST DFLASH"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ESCREVENDO">`:
        DATA
        DC8 "ESCREVENDO"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "LENDO     ">`:
        DATA
        DC8 "LENDO     "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SUCESSO   ">`:
        DATA
        DC8 "SUCESSO   "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "FALHA     ">`:
        DATA
        DC8 "FALHA     "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "LEND      ">`:
        DATA
        DC8 "LEND      "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "WRITING">`:
        DATA
        DC8 "WRITING"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "READING">`:
        DATA
        DC8 "READING"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SUCESS">`:
        DATA
        DC8 "SUCESS"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "FAIL">`:
        DATA
        DC8 "FAIL"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "DISP. EMB.">`:
        DATA
        DC8 "DISP. EMB."
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "DISP. CUEPOS">`:
        DATA
        DC8 "DISP. CUEPOS"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "LOS COPOS">`:
        DATA
        DC8 "LOS COPOS"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "EL COPOS">`:
        DATA
        DC8 "EL COPOS"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CUP DISPENSER">`:
        DATA
        DC8 "CUP DISPENSER"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CUPS,PLEASE">`:
        DATA
        DC8 "CUPS,PLEASE"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "DOSADOR MILHO">`:
        DATA
        DC8 "DOSADOR MILHO"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CORN PORTION">`:
        DATA
        DC8 "CORN PORTION"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PARADO ">`:
        DATA
        DC8 "PARADO "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "DOSANDO">`:
        DATA
        DC8 "DOSANDO"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "REVERSO">`:
        DATA
        DC8 "REVERSO"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "DOSING">`:
        DATA
        DC8 "DOSING"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "REVERSE">`:
        DATA
        DC8 "REVERSE"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "STOP">`:
        DATA
        DC8 "STOP"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TESTE MOTOR">`:
        DATA
        DC8 "TESTE MOTOR"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MOTOR TEST">`:
        DATA
        DC8 "MOTOR TEST"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TESTE PANELA">`:
        DATA
        DC8 "TESTE PANELA"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "HEATING TESTE">`:
        DATA
        DC8 "HEATING TESTE"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "OPERACAO">`:
        DATA
        DC8 "OPERACAO"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "OPERATION">`:
        DATA
        DC8 "OPERATION"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1) VALOR       ">`:
        DATA
        DC8 "(1) VALOR       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(2) CEDULAS     ">`:
        DATA
        DC8 "(2) CEDULAS     "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3) GRATIS      ">`:
        DATA
        DC8 "(3) GRATIS      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(4) FITA LED    ">`:
        DATA
        DC8 "(4) FITA LED    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(5) VOLUME MUS. ">`:
        DATA
        DC8 "(5) VOLUME MUS. "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(6) VOLUME VOZ  ">`:
        DATA
        DC8 "(6) VOLUME VOZ  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(7) PROPAGANDA  ">`:
        DATA
        DC8 "(7) PROPAGANDA  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(8) TEMPO EMB.  ">`:
        DATA
        DC8 "(8) TEMPO EMB.  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(9) TROCO       ">`:
        DATA
        DC8 "(9) TROCO       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(10)COMISSAO    ">`:
        DATA
        DC8 "(10)COMISSAO    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(11)MENSAGEM 01 ">`:
        DATA
        DC8 "(11)MENSAGEM 01 "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(12)MENSAGEM 02 ">`:
        DATA
        DC8 "(12)MENSAGEM 02 "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(13)MENSAGEM 03 ">`:
        DATA
        DC8 "(13)MENSAGEM 03 "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(14)MENSAGEM 04 ">`:
        DATA
        DC8 "(14)MENSAGEM 04 "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(15)DESUMIDIF.  ">`:
        DATA
        DC8 "(15)DESUMIDIF.  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1) PRICE       ">`:
        DATA
        DC8 "(1) PRICE       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "VALOR PIPOCA">`:
        DATA
        DC8 "VALOR PIPOCA"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "POPCORN PRICE">`:
        DATA
        DC8 "POPCORN PRICE"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "R$">`:
        DATA
        DC8 "R$"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
`?<Constant "$">`:
        DATA
        DC8 "$"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "G$">`:
        DATA
        DC8 "G$"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "S/">`:
        DATA
        DC8 "S/"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "US$">`:
        DATA
        DC8 "US$"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "C$">`:
        DATA
        DC8 "C$"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "NOTAS">`:
        DATA
        DC8 "NOTAS"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BILSS">`:
        DATA
        DC8 "BILSS"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "R$ 2,00  ">`:
        DATA
        DC8 "R$ 2,00  "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "R$ 5,00  ">`:
        DATA
        DC8 "R$ 5,00  "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "R$ 10,00 ">`:
        DATA
        DC8 "R$ 10,00 "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "R$ 20,00 ">`:
        DATA
        DC8 "R$ 20,00 "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "R$ 50,00 ">`:
        DATA
        DC8 "R$ 50,00 "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "R$ 100,00">`:
        DATA
        DC8 "R$ 100,00"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "U$ 1,00  ">`:
        DATA
        DC8 "U$ 1,00  "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "U$ 2,00  ">`:
        DATA
        DC8 "U$ 2,00  "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "U$ 5,00  ">`:
        DATA
        DC8 "U$ 5,00  "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "U$ 10,00 ">`:
        DATA
        DC8 "U$ 10,00 "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "U$ 20,00 ">`:
        DATA
        DC8 "U$ 20,00 "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "U$ 50,00 ">`:
        DATA
        DC8 "U$ 50,00 "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TESTE CCTALK">`:
        DATA
        DC8 "TESTE CCTALK"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CCTALK TEST">`:
        DATA
        DC8 "CCTALK TEST"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MOEDEIRO PULSO">`:
        DATA
        DC8 "MOEDEIRO PULSO"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "COIN PULSE">`:
        DATA
        DC8 "COIN PULSE"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "NOTEIRO PULSO">`:
        DATA
        DC8 "NOTEIRO PULSO"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BILL PULSE">`:
        DATA
        DC8 "BILL PULSE"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "LED INSTRUCAO">`:
        DATA
        DC8 "LED INSTRUCAO"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "INSTRUC. LED">`:
        DATA
        DC8 "INSTRUC. LED"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1)IMPRESSORA   ">`:
        DATA
        DC8 "(1)IMPRESSORA   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(2)BILL CCTALK  ">`:
        DATA
        DC8 "(2)BILL CCTALK  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3)BILL MDB     ">`:
        DATA
        DC8 "(3)BILL MDB     "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(4)COIN MDB     ">`:
        DATA
        DC8 "(4)COIN MDB     "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(5)CASHLESS MDB ">`:
        DATA
        DC8 "(5)CASHLESS MDB "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(6)VALOR PUL. M ">`:
        DATA
        DC8 "(6)VALOR PUL. M "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(7)VALOR PUL. N ">`:
        DATA
        DC8 "(7)VALOR PUL. N "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(8)VOLTAR       ">`:
        DATA
        DC8 "(8)VOLTAR       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1) PRINTER     ">`:
        DATA
        DC8 "(1) PRINTER     "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(6)VALUE COIN P ">`:
        DATA
        DC8 "(6)VALUE COIN P "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(7)VALUE BILL P ">`:
        DATA
        DC8 "(7)VALUE BILL P "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(8)EXIT         ">`:
        DATA
        DC8 "(8)EXIT         "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ACESSORIOS">`:
        DATA
        DC8 "ACESSORIOS"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ACESSORIES">`:
        DATA
        DC8 "ACESSORIES"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BV20 CCTALK">`:
        DATA
        DC8 "BV20 CCTALK"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MDB BILL">`:
        DATA
        DC8 "MDB BILL"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MDB COIN">`:
        DATA
        DC8 "MDB COIN"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MDB CASHLESS">`:
        DATA
        DC8 "MDB CASHLESS"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BAUD IMPRESSORA">`:
        DATA
        DC8 "BAUD IMPRESSORA"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BAUD PRINTER">`:
        DATA
        DC8 "BAUD PRINTER"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PULSO MOEDEIRO">`:
        DATA
        DC8 "PULSO MOEDEIRO"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PULSO NOTEIRO">`:
        DATA
        DC8 "PULSO NOTEIRO"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1) MDB DEVICES ">`:
        DATA
        DC8 "(1) MDB DEVICES "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(2) BILL        ">`:
        DATA
        DC8 "(2) BILL        "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3) COIN        ">`:
        DATA
        DC8 "(3) COIN        "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(4) CASHLESS    ">`:
        DATA
        DC8 "(4) CASHLESS    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(5) VOLTAR      ">`:
        DATA
        DC8 "(5) VOLTAR      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "DEVICES MDB">`:
        DATA
        DC8 "DEVICES MDB"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BILL MDB">`:
        DATA
        DC8 "BILL MDB"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "COIN MDB">`:
        DATA
        DC8 "COIN MDB"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TROCO MDB">`:
        DATA
        DC8 "TROCO MDB"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CASHLESS MDB">`:
        DATA
        DC8 "CASHLESS MDB"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TESTE MDB">`:
        DATA
        DC8 "TESTE MDB"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MDB TEST">`:
        DATA
        DC8 "MDB TEST"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Mais Pipoca">`:
        DATA
        DC8 "Mais Pipoca"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Grupo Altech">`:
        DATA
        DC8 "Grupo Altech"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TESTE LCD EXT">`:
        DATA
        DC8 "TESTE LCD EXT"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "EXT LCD TEST">`:
        DATA
        DC8 "EXT LCD TEST"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TESTE DA IMPRESSORA\\n\\r">`:
        DATA
        DC8 "TESTE DA IMPRESSORA\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "GRUPO ALTECH 2017\\n\\r">`:
        DATA
        DC8 "GRUPO ALTECH 2017\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MAIS PIPOCA E\\n\\r">`:
        DATA
        DC8 "MAIS PIPOCA E\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\r\\n\\r\\n\\r\\n\\r">`:
        DATA
        DC8 "\012\015\012\015\012\015\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TESTE IMPRESSORA">`:
        DATA
        DC8 "TESTE IMPRESSORA"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "<enter>IMPRIME">`:
        DATA
        DC8 "<enter>IMPRIME"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PRINTER TESTE">`:
        DATA
        DC8 "PRINTER TESTE"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "<enter>PRINT">`:
        DATA
        DC8 "<enter>PRINT"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "FATURAMENTO">`:
        DATA
        DC8 "FATURAMENTO"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BILLING">`:
        DATA
        DC8 "BILLING"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1)CONTADOR     ">`:
        DATA
        DC8 "(1)CONTADOR     "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3)CARTAO       ">`:
        DATA
        DC8 "(3)CARTAO       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(4)RELATORIO    ">`:
        DATA
        DC8 "(4)RELATORIO    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(5)ZERAMENTO    ">`:
        DATA
        DC8 "(5)ZERAMENTO    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(6)VOLTAR       ">`:
        DATA
        DC8 "(6)VOLTAR       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1)COUNTER      ">`:
        DATA
        DC8 "(1)COUNTER      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3)CREDIT CARD  ">`:
        DATA
        DC8 "(3)CREDIT CARD  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(4)REPORT       ">`:
        DATA
        DC8 "(4)REPORT       "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(5)RESET COUNT  ">`:
        DATA
        DC8 "(5)RESET COUNT  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(6)EXIT         ">`:
        DATA
        DC8 "(6)EXIT         "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1) TEMPERATURA ">`:
        DATA
        DC8 "(1) TEMPERATURA "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(2) VELOCIDADE  ">`:
        DATA
        DC8 "(2) VELOCIDADE  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3) VOLTAR      ">`:
        DATA
        DC8 "(3) VOLTAR      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1) TEMPERATURE ">`:
        DATA
        DC8 "(1) TEMPERATURE "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(2) BLOWER SPEED">`:
        DATA
        DC8 "(2) BLOWER SPEED"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3) EXIT        ">`:
        DATA
        DC8 "(3) EXIT        "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PREPARACAO">`:
        DATA
        DC8 "PREPARACAO"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PREPARATION">`:
        DATA
        DC8 "PREPARATION"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TEMPERATURA">`:
        DATA
        DC8 "TEMPERATURA"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TEMPERATURE">`:
        DATA
        DC8 "TEMPERATURE"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "VELOCIDADE">`:
        DATA
        DC8 "VELOCIDADE"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SPEED">`:
        DATA
        DC8 "SPEED"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   PRONTAS EM  ">`:
        DATA
        DC8 "   PRONTAS EM  "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PRUENTAS EN">`:
        DATA
        DC8 "PRUENTAS EN"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TASTIER IN">`:
        DATA
        DC8 "TASTIER IN"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Valor(R$) %3d,%02d">`:
        DATA
        DC8 "Valor(R$) %3d,%02d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Valor($S) %05d.%02d">`:
        DATA
        DC8 "Valor($S) %05d.%02d"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Price(U$) %3d.%02d">`:
        DATA
        DC8 "Price(U$) %3d.%02d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Pago (R$) %3d,%02d">`:
        DATA
        DC8 "Pago (R$) %3d,%02d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Paid (U$) %3d,%02d">`:
        DATA
        DC8 "Paid (U$) %3d,%02d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "RETIRE AS">`:
        DATA
        DC8 "RETIRE AS"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PIPOCAS">`:
        DATA
        DC8 "PIPOCAS"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "GET YOUR">`:
        DATA
        DC8 "GET YOUR"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "POPCORN">`:
        DATA
        DC8 "POPCORN"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   RESFRIANDO  ">`:
        DATA
        DC8 "   RESFRIANDO  "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   AGUARDE...  ">`:
        DATA
        DC8 "   AGUARDE...  "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   COOLING     ">`:
        DATA
        DC8 "   COOLING     "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   HEATING     ">`:
        DATA
        DC8 "   HEATING     "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   INICIANDO   ">`:
        DATA
        DC8 "   INICIANDO   "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   PREPARACAO  ">`:
        DATA
        DC8 "   PREPARACAO  "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "STARTING">`:
        DATA
        DC8 "STARTING"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "LIMPANDO">`:
        DATA
        DC8 "LIMPANDO"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "COMPARTIMENTO">`:
        DATA
        DC8 "COMPARTIMENTO"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CLEANING">`:
        DATA
        DC8 "CLEANING"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "HEATING">`:
        DATA
        DC8 "HEATING"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TEMPO MOTOR EMB.">`:
        DATA
        DC8 "TEMPO MOTOR EMB."
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TIME CUP MOTOR">`:
        DATA
        DC8 "TIME CUP MOTOR"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1) LIMPEZA     ">`:
        DATA
        DC8 "(1) LIMPEZA     "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(2) EMBALAGEM   ">`:
        DATA
        DC8 "(2) EMBALAGEM   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3) PORCAO MILHO">`:
        DATA
        DC8 "(3) PORCAO MILHO"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(4) RESFRIAMENTO">`:
        DATA
        DC8 "(4) RESFRIAMENTO"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(5) PREPARACAO  ">`:
        DATA
        DC8 "(5) PREPARACAO  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(6) VOLTAR      ">`:
        DATA
        DC8 "(6) VOLTAR      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1) CLEANING    ">`:
        DATA
        DC8 "(1) CLEANING    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(2) CUP         ">`:
        DATA
        DC8 "(2) CUP         "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3) CORN PORTION">`:
        DATA
        DC8 "(3) CORN PORTION"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(4) COOLING     ">`:
        DATA
        DC8 "(4) COOLING     "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(5) PREPARATION ">`:
        DATA
        DC8 "(5) PREPARATION "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(6) EXIT        ">`:
        DATA
        DC8 "(6) EXIT        "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MENU SERVICO">`:
        DATA
        DC8 "MENU SERVICO"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SERVICE">`:
        DATA
        DC8 "SERVICE"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "LIBERANDO">`:
        DATA
        DC8 "LIBERANDO"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "EMBALAGEM">`:
        DATA
        DC8 "EMBALAGEM"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CUP">`:
        DATA
        DC8 "CUP"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "DISPENSING">`:
        DATA
        DC8 "DISPENSING"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MILHO">`:
        DATA
        DC8 "MILHO"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CORN">`:
        DATA
        DC8 "CORN"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PORTION">`:
        DATA
        DC8 "PORTION"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TESTE MUSICA">`:
        DATA
        DC8 "TESTE MUSICA"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MUSIC TEST">`:
        DATA
        DC8 "MUSIC TEST"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "VOLUME MUSICA">`:
        DATA
        DC8 "VOLUME MUSICA"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MUSIC LEVEL">`:
        DATA
        DC8 "MUSIC LEVEL"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "VOLUME VOZ">`:
        DATA
        DC8 "VOLUME VOZ"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "VOICE LEVEL">`:
        DATA
        DC8 "VOICE LEVEL"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TESTE LOCUCOES">`:
        DATA
        DC8 "TESTE LOCUCOES"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "VOICE TESTE">`:
        DATA
        DC8 "VOICE TESTE"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TEMPO PROP.">`:
        DATA
        DC8 "TEMPO PROP."

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TIME PROP">`:
        DATA
        DC8 "TIME PROP"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "FORA DE SERVICO">`:
        DATA
        DC8 "FORA DE SERVICO"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "OUT OF SERVICE">`:
        DATA
        DC8 "OUT OF SERVICE"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   EXECUTANDO   ">`:
        DATA
        DC8 "   EXECUTANDO   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "   AUTOTESTE    ">`:
        DATA
        DC8 "   AUTOTESTE    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "RETIRE O SEU">`:
        DATA
        DC8 "RETIRE O SEU"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TROCO">`:
        DATA
        DC8 "TROCO"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CHANGE">`:
        DATA
        DC8 "CHANGE"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SEM TROCO">`:
        DATA
        DC8 "SEM TROCO"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PARA INICIAR">`:
        DATA
        DC8 "PARA INICIAR"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "J\\'appelle">`:
        DATA
        DC8 "J'appelle"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "NO COINS">`:
        DATA
        DC8 "NO COINS"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "FOR CHANGE">`:
        DATA
        DC8 "FOR CHANGE"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MODO GRATIS">`:
        DATA
        DC8 "MODO GRATIS"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "FREE MODE">`:
        DATA
        DC8 "FREE MODE"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "FITA LED">`:
        DATA
        DC8 "FITA LED"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "LED STRIP">`:
        DATA
        DC8 "LED STRIP"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PRESSIONE BOTAO">`:
        DATA
        DC8 "PRESSIONE BOTAO"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  PARA INICIAR  ">`:
        DATA
        DC8 "  PARA INICIAR  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant " PRESS BUTTON  ">`:
        DATA
        DC8 " PRESS BUTTON  "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "     TO START   ">`:
        DATA
        DC8 "     TO START   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BILL MDB OFFLINE">`:
        DATA
        DC8 "BILL MDB OFFLINE"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "E20">`:
        DATA
        DC8 "E20"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "COIN MDB OFFLINE">`:
        DATA
        DC8 "COIN MDB OFFLINE"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CCTALK OFFLINE">`:
        DATA
        DC8 "CCTALK OFFLINE"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "E21">`:
        DATA
        DC8 "E21"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SENHA">`:
        DATA
        DC8 "SENHA"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PASSWORD">`:
        DATA
        DC8 "PASSWORD"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "USO DE TROCO">`:
        DATA
        DC8 "USO DE TROCO"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CHANGE USE">`:
        DATA
        DC8 "CHANGE USE"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(1) PADRAO FAB. ">`:
        DATA
        DC8 "(1) PADRAO FAB. "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(2) SENHA ADMIN ">`:
        DATA
        DC8 "(2) SENHA ADMIN "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(3) RESET GERAL ">`:
        DATA
        DC8 "(3) RESET GERAL "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(4) MOTOR AC    ">`:
        DATA
        DC8 "(4) MOTOR AC    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(5) NUM SERIE   ">`:
        DATA
        DC8 "(5) NUM SERIE   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(6) HORA/DATA   ">`:
        DATA
        DC8 "(6) HORA/DATA   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(7) ERRO MOTOR  ">`:
        DATA
        DC8 "(7) ERRO MOTOR  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(8) VOLTAR      ">`:
        DATA
        DC8 "(8) VOLTAR      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "(7) MOTOR ERROR ">`:
        DATA
        DC8 "(7) MOTOR ERROR "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MENU AVANCADO">`:
        DATA
        DC8 "MENU AVANCADO"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PADRAO FABRICA">`:
        DATA
        DC8 "PADRAO FABRICA"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "REINICIANDO">`:
        DATA
        DC8 "REINICIANDO"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PARAMETROS">`:
        DATA
        DC8 "PARAMETROS"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "NOVA SENHA">`:
        DATA
        DC8 "NOVA SENHA"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CADASTRADO">`:
        DATA
        DC8 "CADASTRADO"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "C/ SUCESSO">`:
        DATA
        DC8 "C/ SUCESSO"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SENHAS INF.">`:
        DATA
        DC8 "SENHAS INF."

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "SAO DIFERENTES">`:
        DATA
        DC8 "SAO DIFERENTES"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TOTALIZADORES">`:
        DATA
        DC8 "TOTALIZADORES"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CODIGO">`:
        DATA
        DC8 "CODIGO"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "INVALIDO">`:
        DATA
        DC8 "INVALIDO"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "NUMERO SERIE">`:
        DATA
        DC8 "NUMERO SERIE"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "COMISSAO PONTO">`:
        DATA
        DC8 "COMISSAO PONTO"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant " HABILT. DESUM. ">`:
        DATA
        DC8 " HABILT. DESUM. "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BRASIL">`:
        DATA
        DC8 "BRASIL"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "URUGUAY">`:
        DATA
        DC8 "URUGUAY"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ARGENTINA">`:
        DATA
        DC8 "ARGENTINA"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PARAGUAY">`:
        DATA
        DC8 "PARAGUAY"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PERU">`:
        DATA
        DC8 "PERU"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "EUA">`:
        DATA
        DC8 "EUA"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CANADA">`:
        DATA
        DC8 "CANADA"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {&"BRASIL", &"URUGUAY", &"ARGENTINA`:
        DATA
        DC32 `?<Constant "BRASIL">`, `?<Constant "URUGUAY">`
        DC32 `?<Constant "ARGENTINA">`, `?<Constant "PARAGUAY">`
        DC32 `?<Constant "PERU">`, `?<Constant "EUA">`, `?<Constant "CANADA">`

        END
//  116 /***********************************************************************************
//  117 *       Fim do arquivo
//  118 ***********************************************************************************/
// 
// 5 600 bytes in section .data
// 5 054 bytes in section .rodata
//   200 bytes in section .text
// 
//   200 bytes of CODE  memory
// 5 054 bytes of CONST memory
// 5 600 bytes of DATA  memory
//
//Errors: none
//Warnings: none
