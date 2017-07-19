/*__________________________________________________________________________________
|	Quark Tecnologia Eletrônica Embarcada
|       
|       Itapema - SC
|       www.quarktee.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Quark  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Quark 
|       or its distributors.
|
|       Este código é propriedade da Quark  e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Quark  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  mensagens.h
|       Descrição          :  declaração de todas as mensagens utilizadas
|                             no display
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  15/02/2017
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _MENSAGENS_H_
#define _MENSAGENS_H_

#define TAM_OPCOES_CFG                  10
#define TAM_OPCOES_IDIOMA               7
#define TAM_OPCOES_HARDWARE             16
#define QTD_OPCOES_OPERACAO             16
#define QTD_CEDULAS                     6
#define TAM_OPCOES_ACESSORIOS           8
#define TAM_OPCOES_MDB                  5
#define QTD_LINHAS_IMPRESSAO_TESTE      4
#define QTD_OPCOES_FATURAMENTO          6
#define QTD_OPCOES_PREPARACAO           3
#define QTD_OPCOES_SERVICO              6
#define QTD_OPCOES_AVANCADO             7

#ifdef _GLOBAL_STRING_

//
// Mensagem de saudação 
// no display
//

const char *STRING_splash[QTY_OF_LANGUAGES][2]={
  [BRASIL]    = {"GRUPO ALTECH","VER. 2.1.3"},
  [URUGUAI]   = {"GRUPO ALTECH","VER. 2.1.3"},
  [ARGENTINA] = {"GRUPO ALTECH","VER. 2.1.3"},
  [PARAGUAI]  = {"GRUPO ALTECH","VER. 2.1.3"},
  [PERU]      = {"GRUPO ALTECH","VER. 2.1.3"},
  [EUA]       = {"  HEY POP   ","VER. 2.1.3"},
  [CANADA]    = {"GRUPO ALTECH","VER. 2.1.3"}
};

const char *STRING_titulo_menu_configuracao[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"CONFIGURACOES"},
  [URUGUAI]   = {"CONFIGURACIONS"},
  [ARGENTINA] = {"CONFIGURACIONS"},
  [PARAGUAI]  = {"CONFIGURACIONS"},
  [PERU]      = {"CONFIGURACIONS"},
  [EUA]       = {"SETUP"},
  [CANADA]    = {"SETUP"}
};

const char *STRING_menu_configuracao[QTY_OF_LANGUAGES][TAM_OPCOES_CFG]={
  //              1234567890123456
  //-------------------------------
  [BRASIL]    = {"(1)OPERACAO     ",
                 "(2)FATURAMENTO  ",
                 "(3)PREPARACAO   ",
                 "(4)ACESSORIOS   ",
                 "(5)TELEMETRIA   ",
                 "(6)TESTE HW     ",
                 "(7)REGIAO       ",
                 "(8)SERVICO      ",
                 "(9)AVANCADO     ",
                 "(10)SAIR        "},
   //-------------------------------
  [URUGUAI]   = {"(1)OPERACAO     ",
                 "(2)FATURAMENTO  ",
                 "(3)PREPARACAO   ",
                 "(4)ACESSORIOS   ",
                 "(5)TELEMETRIA   ",
                 "(6)TESTE HW     ",
                 "(7)REGIAO       ",
                 "(8)SERVICO      ",
                 "(9)AVANCADO     ",
                 "(10)SAIR        "},
  //-------------------------------   
  [ARGENTINA] = {"(1)OPERACAO     ",
                 "(2)FATURAMENTO  ",
                 "(3)PREPARACAO   ",
                 "(4)ACESSORIOS   ",
                 "(5)TELEMETRIA   ",
                 "(6)TESTE HW     ",
                 "(7)REGIAO       ",
                 "(8)SERVICO      ",
                 "(9)AVANCADO     ",
                 "(10)SAIR        "},
   //-------------------------------   
  [PARAGUAI]  = {"(1)OPERACAO     ",
                 "(2)FATURAMENTO  ",
                 "(3)PREPARACAO   ",
                 "(4)ACESSORIOS   ",
                 "(5)TELEMETRIA   ",
                 "(6)TESTE HW     ",
                 "(7)REGIAO       ",
                 "(8)SERVICO      ",
                 "(9)AVANCADO     ",
                 "(10)SAIR        "},
  //-------------------------------
  [PERU]      = {"(1)OPERACAO     ",
                 "(2)FATURAMENTO  ",
                 "(3)PREPARACAO   ",
                 "(4)ACESSORIOS   ",
                 "(5)TELEMETRIA   ",
                 "(6)TESTE HW     ",
                 "(7)REGIAO       ",
                 "(8)SERVICO      ",
                 "(9)AVANCADO     ",
                 "(10)SAIR        "},
  //-------------------------------
  [EUA]       = {"(1)OPERATION    ",
                 "(2)BILLING      ",
                 "(3)PREPARATION  ",
                 "(4)ACCESSORIES  ",
                 "(5)TELEMETRY    ",
                 "(6)TESTE HW     ",
                 "(7)REGION       ",
                 "(8)SERVICE      ",
                 "(9)TECHNICAL    ",
                 "(10)EXIT        "},
  //-------------------------------
  [CANADA]    = {"(1)OPERACAO     ",
                 "(2)FATURAMENTO  ",
                 "(3)PREPARACAO   ",
                 "(4)ACESSORIOS   ",
                 "(5)TELEMETRIA   ",
                 "(6)TESTE HW     ",
                 "(7)REGIAO       ",
                 "(8)SERVICO      ",
                 "(9)AVANCADO     ",
                 "(10)SAIR        "},
};

/// Mensagens da tela de configuração
// do idioma
const char *STRING_tela_sel_idioma[TAM_OPCOES_IDIOMA][TAM_OPCOES_IDIOMA]={
  //              1234567890123456
  //-------------------------------
  [BRASIL]    = {"BRASIL       ",
                 "URUGUAY      ",
                 "ARGENTINA    ",
                 "PARAGUAY     ",
                 "PERU         ",
                 "EUA          ",
                 "CANADA       "},
   //-------------------------------
  [URUGUAI]   = {"BRASIL       ",
                 "URUGUAY      ",
                 "ARGENTINA    ",
                 "PARAGUAY     ",
                 "PERU         ",
                 "USA          ",
                 "CANADA       "},
  //-------------------------------   
  [ARGENTINA] = {"BRASIL       ",
                 "URUGUAY      ",
                 "ARGENTINA    ",
                 "PARAGUAY     ",
                 "PERU         ",
                 "USA          ",
                 "CANADA       "},
   //-------------------------------   
  [PARAGUAI]  = {"BRASIL       ",
                 "URUGUAY      ",
                 "ARGENTINA    ",
                 "PARAGUAY     ",
                 "PERU         ",
                 "USA          ",
                 "CANADA       "},
  //-------------------------------
  [PERU]      = {"BRASIL       ",
                 "URUGUAY      ",
                 "ARGENTINA    ",
                 "PARAGUAY     ",
                 "PERU         ",
                 "USA          ",
                 "CANADA       "},
  //-------------------------------
  [EUA]       = {"BRAZIL       ",
                 "URUGUAY      ",
                 "ARGENTINA    ",
                 "PARAGUAY     ",
                 "PERU         ",
                 "USA          ",
                 "CANADA       "},
  //-------------------------------
  [CANADA]    = {"BRASIL       ",
                 "URUGUAY      ",
                 "ARGENTINA    ",
                 "PARAGUAY     ",
                 "PERU         ",
                 "USA          ",
                 "CANADA       "}
};

const char *STRING_titulo_teste_hardware[QTY_OF_LANGUAGES]={
               //1234567890123456
  [BRASIL]    = {"TESTE DO HW"},
  [URUGUAI]   = {"TESTE DO HD"},
  [ARGENTINA] = {"TESTE DO HW"},
  [PARAGUAI]  = {"TESTE DO HW"},
  [PERU]      = {"TESTE DO HW"},
  [EUA]       = {"TEST OF HW "},
  [CANADA]    = {"TESTE DO HW"}
};

///
/// Mensagens no display dentro do menu
/// teste do hardware
///
const char *STRING_menu_teste_hardware[QTY_OF_LANGUAGES][TAM_OPCOES_HARDWARE]={
  
  [BRASIL]={
    //1234567890123456
     "(1)HORA/DATA    ",
     "(2)DATAFLASH    ",
     "(3)DISP. PAPEL  ",
     "(4)DOSADOR MILHO",
     "(5)VENTILADOR   ",
     "(6)RESISTENCIA  ",
     "(7)CCTALK       ",
     "(8)MOEDEIRO PULS",
     "(9)NOTEIRO PULSO",
     "(10)MDB         ",
     "(11)IMPRESSORA  ",
     "(12)MUSICA      ",
     "(13)LOCUCOES    ",
     "(14)LEDS        ",
     "(15)LCD EXTERNO ",
     "(16)VOLTAR      "
  },
  [URUGUAI]={
    //1234567890123456
     "(1)HORA/DATA    ",
     "(2)DATAFLASH    ",
     "(3)DISP. PAPEL  ",
     "(4)DOSADOR MILHO",
     "(5)VENTILADOR   ",
     "(6)RESISTENCIA  ",
     "(7)CCTALK       ",
     "(8)MOEDEIRO PULS",
     "(9)NOTEIRO PULSO",
     "(10)MDB         ",
     "(11)IMPRESSORA  ",
     "(12)MUSICA      ",
     "(13)LOCUCOES    ",
     "(14)LEDS        ",
     "(15)LCD EXTERNO ",
     "(16)VOLTAR      "
  },
  [ARGENTINA]={
    //1234567890123456
     "(1)HORA/DATA    ",
     "(2)DATAFLASH    ",
     "(3)DISP. PAPEL  ",
     "(4)DOSADOR MILHO",
     "(5)VENTILADOR   ",
     "(6)RESISTENCIA  ",
     "(7)CCTALK       ",
     "(8)MOEDEIRO PULS",
     "(9)NOTEIRO PULSO",
     "(10)MDB         ",
     "(11)IMPRESSORA  ",
     "(12)MUSICA      ",
     "(13)LOCUCOES    ",
     "(14)LEDS        ",
     "(15)LCD EXTERNO ",
     "(16)VOLTAR      "
  },
  [PARAGUAI]={
    //1234567890123456
     "(1)HORA/DATA    ",
     "(2)DATAFLASH    ",
     "(3)DISP. PAPEL  ",
     "(4)DOSADOR MILHO",
     "(5)VENTILADOR   ",
     "(6)RESISTENCIA  ",
     "(7)CCTALK       ",
     "(8)MOEDEIRO PULS",
     "(9)NOTEIRO PULSO",
     "(10)MDB         ",
     "(11)IMPRESSORA  ",
     "(12)MUSICA      ",
     "(13)LOCUCOES    ",
     "(14)LEDS        ",
     "(15)LCD EXTERNO ",
     "(16)VOLTAR      "
  },
  [PERU]={
    //1234567890123456
     "(1)HORA/DATA    ",
     "(2)DATAFLASH    ",
     "(3)DISP. PAPEL  ",
     "(4)DOSADOR MILHO",
     "(5)VENTILADOR   ",
     "(6)RESISTENCIA  ",
     "(7)CCTALK       ",
     "(8)MOEDEIRO PULS",
     "(9)NOTEIRO PULSO",
     "(10)MDB         ",
     "(11)IMPRESSORA  ",
     "(12)MUSICA      ",
     "(13)LOCUCOES    ",
     "(14)LEDS        ",
     "(15)LCD EXTERNO ",
     "(16)VOLTAR      "
  },
  [EUA]={
    //1234567890123456
     "(1)HOUR/DATE    ",
     "(2)DATAFLASH    ",
     "(3)CUP DISPENSER",
     "(4)CORN PORTION ",
     "(5)BLOWER       ",
     "(6)HEATING      ",
     "(7)CCTALK       ",
     "(8)COIN PULSE   ",
     "(9)BILL PULSE   ",
     "(10)MDB         ",
     "(11)PRINTER     ",
     "(12)MUSIC       ",
     "(13)VOICE       ",
     "(14)LEDS        ",
     "(15)EXTERNAL LCD",
     "(16)EXIT        "
  },
  [CANADA]={
    //1234567890123456
     "(1)HORA/DATA    ",
     "(2)DATAFLASH    ",
     "(3)DISP. PAPEL  ",
     "(4)DOSADOR MILHO",
     "(5)VENTILADOR   ",
     "(6)RESISTENCIA  ",
     "(7)CCTALK       ",
     "(8)MOEDEIRO PULS",
     "(9)NOTEIRO PULSO",
     "(10)MDB         ",
     "(11)IMPRESSORA  ",
     "(12)MUSICA      ",
     "(13)LOCUCOES    ",
     "(14)LEDS        ",
     "(15)LCD EXTERNO ",
     "(16)VOLTAR      "
  },  
};

const char *STRING_teste_rtc[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"TESTE RTC"},
  [URUGUAI]  = {"TESTE RTC"},
  [ARGENTINA]= {"TESTE RTC"},
  [PARAGUAI] = {"TESTE RTC"},
  [PERU]     = {"TESTE RTC"},
  [EUA]      = {"TEST RTC"},
  [CANADA]   = {"TESTE RTC"},
};

const char *STRING_teste_data_flash[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"TESTE DFLASH"},
  [URUGUAI]  = {"TESTE DFLASH"},
  [ARGENTINA]= {"TESTE DFLASH"},
  [PARAGUAI] = {"TESTE DFLASH"},
  [PERU]     = {"TESTE DFLASH"},
  [EUA]      = {"TEST DFLASH"},
  [CANADA]   = {"TESTE DFLASH"}, 
};

const char *STRING_passos_teste_dataflash[QTY_OF_LANGUAGES][4]={
  [BRASIL]   = 
  {
    "ESCREVENDO",
    "LENDO     ",
    "SUCESSO   ",
    "FALHA     "
   },
  [URUGUAI]  = 
  {
    "ESCREVENDO",
    "LEND      ",
    "SUCESSO   ",
    "FALHA     "
   },    
  [ARGENTINA]= 
  {
    "ESCREVENDO",
    "LEND      ",
    "SUCESSO   ",
    "FALHA     "
   },    
  [PARAGUAI] = 
  {
    "ESCREVENDO",
    "LEND      ",
    "SUCESSO   ",
    "FALHA     "
   },    
  [PERU]     = 
  {
    "ESCREVENDO",
    "LEND      ",
    "SUCESSO   ",
    "FALHA     "
   },    
  [EUA]      = 
  {
    "WRITING",
    "READING",
    "SUCESS",
    "FAIL"
   },    
  [CANADA]   =
  {
    "ESCREVENDO",
    "LEND      ",
    "SUCESSO   ",
    "FALHA     "
   },    
};

// Mensagem para a tela de teste do dispensador de papel
const char *STRING_tela_teste_dispensador_papel[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"DISP. EMB."},
  [URUGUAI]  = {"DISP. CUEPOS"},
  [ARGENTINA]= {"DISP. CUEPOS"},
  [PARAGUAI] = {"LOS COPOS"},
  [PERU]     = {"EL COPOS"},
  [EUA]      = {"CUP DISPENSER"},
  [CANADA]   = {"CUPS,PLEASE"}
};


const char *STRING_tela_teste_dosador[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"DOSADOR MILHO"},
  [URUGUAI]  = {"DOSADOR MILHO"},
  [ARGENTINA]= {"DOSADOR MILHO"},
  [PARAGUAI] = {"DOSADOR MILHO"},
  [PERU]     = {"DOSADOR MILHO"},
  [EUA]      = {"CORN PORTION"},
  [CANADA]   = {"DOSADOR MILHO"}
};

const char *STRING_texto_teste_motor[QTY_OF_LANGUAGES][3]={
  [BRASIL]   = {"PARADO ",
                "DOSANDO",
                "REVERSO"
  },
  [URUGUAI]  = {"PARADO ",
                "DOSANDO",
                "REVERSO"
  },
  [ARGENTINA]= {"PARADO ",
                "DOSANDO",
                "REVERSO"
  },
  [PARAGUAI] = {"PARADO ",
                "DOSANDO",
                "REVERSO"
  },
  [PERU]     = {"PARADO ",
                "DOSING",
                "REVERSE"
  },
  [EUA]      = {"STOP",
                "DOSANDO",
                "REVERSO"
  },
  [CANADA]   = {"PARADO ",
                "DOSANDO",
                "REVERSO"
  },
};

const char *STRING_teste_ventilador[QTY_OF_LANGUAGES]={  
  [BRASIL]   = {"TESTE MOTOR"},
  [URUGUAI]  = {"TESTE MOTOR"},
  [ARGENTINA]= {"TESTE MOTOR"},
  [PARAGUAI] = {"TESTE MOTOR"},
  [PERU]     = {"TESTE MOTOR"},
  [EUA]      = {"MOTOR TEST"},
  [CANADA]   = {"TESTE MOTOR"},
};

const char *STRING_teste_panela[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"TESTE PANELA"},
  [URUGUAI]  = {"TESTE PANELA"},
  [ARGENTINA]= {"TESTE PANELA"},
  [PARAGUAI] = {"TESTE PANELA"},
  [PERU]     = {"TESTE PANELA"},
  [EUA]      = {"HEATING TESTE"},
  [CANADA]   = {"TESTE PANELA"}, 
};

const char *STRING_titulo_menu_operacao[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"OPERACAO"},
  [URUGUAI]  = {"OPERACAO"},
  [ARGENTINA]= {"OPERACAO"},
  [PARAGUAI] = {"OPERACAO"},
  [PERU]     = {"OPERACAO"},
  [EUA]      = {"OPERATION"},
  [CANADA]   = {"OPERACAO"},  
};

const char *STRING_menu_configuracao_operacao[QTY_OF_LANGUAGES][QTD_OPCOES_OPERACAO]={
  //              1234567890123456 
  [BRASIL]    = {"(1) VALOR       ",
                 "(2) CEDULAS     ",
                 "(3) GRATIS      ",
                 "(4) FITA LED    ",
                 "(5) VOLUME MUS. ",
                 "(6) VOLUME VOZ  ",
                 "(7) PROPAGANDA  ",
                 "(8) TEMPO EMB.  ",
                 "(9) TROCO       ",
                 "(10)COMISSAO    ",
                 "(11)MENSAGEM 01 ",
                 "(12)MENSAGEM 02 ",
                 "(13)MENSAGEM 03 ",
                 "(14)MENSAGEM 04 ",                                  
                 "(15)DESUMIDIF.  ",
                 "(16)VOLTAR      "
  },
  [URUGUAI]   = {"(1) VALOR       ",
                 "(2) CEDULAS     ",
                 "(3) GRATIS      ",
                 "(4) FITA LED    ",
                 "(5) VOLUME MUS. ",
                 "(6) VOLUME VOZ  ",
                 "(7) PROPAGANDA  ",
                 "(8) TEMPO EMB.  ",
                 "(9) TROCO       ",
                 "(10)COMISSAO    ",
                 "(11)MENSAGEM 01 ",
                 "(12)MENSAGEM 02 ",
                 "(13)MENSAGEM 03 ",
                 "(14)MENSAGEM 04 ",                                  
                 "(15)DESUMIDIF.  ",
                 "(16)VOLTAR      "
  },
  [ARGENTINA] = {"(1) VALOR       ",
                 "(2) CEDULAS     ",
                 "(3) GRATIS      ",
                 "(4) FITA LED    ",
                 "(5) VOLUME MUS. ",
                 "(6) VOLUME VOZ  ",
                 "(7) PROPAGANDA  ",
                 "(8) TEMPO EMB.  ",
                 "(9) TROCO       ",
                 "(10)COMISSAO    ",
                 "(11)MENSAGEM 01 ",
                 "(12)MENSAGEM 02 ",
                 "(13)MENSAGEM 03 ",
                 "(14)MENSAGEM 04 ",                                  
                 "(15)DESUMIDIF.  ",
                 "(16)VOLTAR      "
  },
  [PARAGUAI]  = {"(1) VALOR       ",
                 "(2) CEDULAS     ",
                 "(3) GRATIS      ",
                 "(4) FITA LED    ",
                 "(5) VOLUME MUS. ",
                 "(6) VOLUME VOZ  ",
                 "(7) PROPAGANDA  ",
                 "(8) TEMPO EMB.  ",
                 "(9) TROCO       ",
                 "(10)COMISSAO    ",
                 "(11)MENSAGEM 01 ",
                 "(12)MENSAGEM 02 ",
                 "(13)MENSAGEM 03 ",
                 "(14)MENSAGEM 04 ",                                  
                 "(15)DESUMIDIF.  ",
                 "(16)VOLTAR      "
  },
  [PERU]      = {"(1) VALOR       ",
                 "(2) CEDULAS     ",
                 "(3) GRATIS      ",
                 "(4) FITA LED    ",
                 "(5) VOLUME MUS. ",
                 "(6) VOLUME VOZ  ",
                 "(7) PROPAGANDA  ",
                 "(8) TEMPO EMB.  ",
                 "(9) TROCO       ",
                 "(10)COMISSAO    ",
                 "(11)MENSAGEM 01 ",
                 "(12)MENSAGEM 02 ",
                 "(13)MENSAGEM 03 ",
                 "(14)MENSAGEM 04 ",                                  
                 "(15)DESUMIDIF.  ",
                 "(16)VOLTAR      "
  },
  [EUA]       = {"(1) PRICE       ",
                 "(2) BILLING     ",
                 "(3) FREE        ",
                 "(4) LED STRIP   ",
                 "(5) MUSIC LEVEL ",
                 "(6) VOICE LEVEL ",
                 "(7) ADVERTISING ",
                 "(8) CUP TIME    ",
                 "(9) CHANGE      ",
                 "(10)COMMITTEE   ",
                 "(11)MESSAGE 01  ",
                 "(12)MESSAGE 02  ",
                 "(13)MESSAGE 03  ",
                 "(14)MESSAGE 03  ",                                  
                 "(15)DEHUMIDIFIER",
                 "(16)EXIT        "
  },
  [CANADA]    = {"(1) VALOR       ",
                 "(2) CEDULAS     ",
                 "(3) GRATIS      ",
                 "(4) FITA LED    ",
                 "(5) VOLUME MUS. ",
                 "(6) VOLUME VOZ  ",
                 "(7) PROPAGANDA  ",
                 "(8) TEMPO EMB.  ",
                 "(9) TROCO       ",
                 "(10)COMISSAO    ",
                 "(11)MENSAGEM 01 ",
                 "(12)MENSAGEM 02 ",
                 "(13)MENSAGEM 03 ",
                 "(14)MENSAGEM 04 ",                                  
                 "(15)DESUMIDIF.  ",
                 "(16)VOLTAR      "
  },
};


const char *STRING_titulo_ajusta_valor[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"VALOR PIPOCA"},
  [URUGUAI]  = {"VALOR PIPOCA"},
  [ARGENTINA]= {"VALOR PIPOCA"},
  [PARAGUAI] = {"VALOR PIPOCA"},
  [PERU]     = {"VALOR PIPOCA"},
  [EUA]      = {"POPCORN PRICE"},
  [CANADA]   = {"VALOR PIPOCA"},
};

const char *STRING_simbolo_moeda[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"R$"},
  [URUGUAI]  = {"$"},
  [ARGENTINA]= {"$"},
  [PARAGUAI] = {"G$"},
  [PERU]     = {"S/"},
  [EUA]      = {"US$"},
  [CANADA]   = {"C$"},    
};

const char *STRING_titulo_configuracao_notas[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"NOTAS"},
  [URUGUAI]  = {"NOTAS"},
  [ARGENTINA]= {"NOTAS"},
  [PARAGUAI] = {"NOTAS"},
  [PERU]     = {"NOTAS"},
  [EUA]      = {"BILLS"},
  [CANADA]   = {"NOTAS"}
};

const char *STRING_tabela_cedulas_canais[QTY_OF_LANGUAGES][QTD_CEDULAS]={
  [BRASIL]   = {"R$ 2,00  ",
                "R$ 5,00  ",
                "R$ 10,00 ",
                "R$ 20,00 ",
                "R$ 50,00 ",
                "R$ 100,00"
  },
  [URUGUAI] = {"R$ 2,00  ",
               "R$ 5,00  ",
               "R$ 10,00 ",
               "R$ 20,00 ",
               "R$ 50,00 ",
               "R$ 100,00"
  },
  [ARGENTINA] = {"R$ 2,00  ",
                 "R$ 5,00  ",
                 "R$ 10,00 ",
                 "R$ 20,00 ",
                 "R$ 50,00 ",
                 "R$ 100,00"
  },
  [PARAGUAI]  = {"R$ 2,00  ",
                 "R$ 5,00  ",
                 "R$ 10,00 ",
                 "R$ 20,00 ",
                 "R$ 50,00 ",
                 "R$ 100,00"
  },
  [PERU]   = {"R$ 2,00  ",
              "R$ 5,00  ",
              "R$ 10,00 ",
              "R$ 20,00 ",
              "R$ 50,00 ",
              "R$ 100,00"
  },
  [EUA]    = {"U$ 1,00  ",
              "U$ 2,00  ",
              "U$ 5,00  ",
              "U$ 10,00 ",
              "U$ 20,00 ",
              "U$ 50,00 "
  },
  [CANADA] = {"R$ 2,00  ",
              "R$ 5,00  ",
              "R$ 10,00 ",
              "R$ 20,00 ",
              "R$ 50,00 ",
              "R$ 100,00"
  }
};

const char *STRING_mensagem_teste_BV20[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"TESTE CCTALK"},
  [URUGUAI]  = {"TESTE CCTALK"},
  [ARGENTINA]= {"TESTE CCTALK"},
  [PARAGUAI] = {"TESTE CCTALK"},
  [PERU]     = {"TESTE CCTALK"},
  [EUA]      = {"CCTALK TEST"}, 
  [CANADA]   = {"TESTE CCTALK"},    
};

const char *STRING_mensagem_teste_uca1[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"MOEDEIRO PULSO"},
  [URUGUAI]  = {"MOEDEIRO PULSO"},
  [ARGENTINA]= {"MOEDEIRO PULSO"},
  [PARAGUAI] = {"MOEDEIRO PULSO"},
  [PERU]     = {"MOEDEIRO PULSO"},
  [EUA]      = {"COIN PULSE"},
  [CANADA]   = {"MOEDEIRO PULSO"},  
};

const char *STRING_mensagem_teste_P70[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"NOTEIRO PULSO"},
  [URUGUAI]  = {"NOTEIRO PULSO"},
  [ARGENTINA]= {"NOTEIRO PULSO"},
  [PARAGUAI] = {"NOTEIRO PULSO"},
  [PERU]     = {"NOTEIRO PULSO"},
  [EUA]      = {"BILL PULSE"},
  [CANADA]   = {"NOTEIRO PULSO"}, 
};

const char *STRING_mensagem_teste_led_instrucao[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"LED INSTRUCAO"},
  [URUGUAI]  = {"LED INSTRUCAO"},
  [ARGENTINA]= {"LED INSTRUCAO"},
  [PARAGUAI] = {"LED INSTRUCAO"},
  [PERU]     = {"LED INSTRUCAO"},
  [EUA]      = {"INSTRUC. LED"},
  [CANADA]   = {"LED INSTRUCAO"},
};

const char *STRING_opcoes_menu_acessorios[QTY_OF_LANGUAGES][TAM_OPCOES_ACESSORIOS]={
   //            1234567890123456
  [BRASIL]   = {"(1)IMPRESSORA   ",
                "(2)BILL CCTALK  ",
                "(3)BILL MDB     ",
                "(4)COIN MDB     ",
                "(5)CASHLESS MDB ",
                "(6)VALOR PUL. M ",
                "(7)VALOR PUL. N ",
                "(8)VOLTAR       "},  
  [URUGUAI]  = {"(1)IMPRESSORA   ",
                "(2)BILL CCTALK  ",
                "(3)BILL MDB     ",
                "(4)COIN MDB     ",
                "(5)CASHLESS MDB ",
                "(6)VALOR PUL. M ",
                "(7)VALOR PUL. N ",
                "(8)VOLTAR       "},
  [ARGENTINA]= {"(1)IMPRESSORA   ",
                "(2)BILL CCTALK  ",
                "(3)BILL MDB     ",
                "(4)COIN MDB     ",
                "(5)CASHLESS MDB ",
                "(6)VALOR PUL. M ",
                "(7)VALOR PUL. N ",
                "(8)VOLTAR       "},
  [PARAGUAI] = {"(1)IMPRESSORA   ",
                "(2)BILL CCTALK  ",
                "(3)BILL MDB     ",
                "(4)COIN MDB     ",
                "(5)CASHLESS MDB ",
                "(6)VALOR PUL. M ",
                "(7)VALOR PUL. N ",
                "(8)VOLTAR       "},
  [PERU]     = {"(1)IMPRESSORA   ",
                "(2)BILL CCTALK  ",
                "(3)BILL MDB     ",
                "(4)COIN MDB     ",
                "(5)CASHLESS MDB ",
                "(6)VALOR PUL. M ",
                "(7)VALOR PUL. N ",
                "(8)VOLTAR       "},
  [EUA]      = {"(1) PRINTER     ",
                "(2)BILL CCTALK  ",
                "(3)BILL MDB     ",
                "(4)COIN MDB     ",
                "(5)CASHLESS MDB ",
                "(6)VALUE COIN P ",
                "(7)VALUE BILL P ",
                "(8)EXIT         "},
  [CANADA]   = {"(1)IMPRESSORA   ",
                "(2)BILL CCTALK  ",
                "(3)BILL MDB     ",
                "(4)COIN MDB     ",
                "(5)CASHLESS MDB ",
                "(6)VALOR PUL. M ",
                "(7)VALOR PUL. N ",
                "(8)VOLTAR       "},
};

const char *STRING_titulo_menu_acessorios[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"ACESSORIOS"},
  [URUGUAI]  = {"ACESSORIOS"},
  [ARGENTINA]= {"ACESSORIOS"},
  [PARAGUAI] = {"ACESSORIOS"},
  [PERU]     = {"ACESSORIOS"},
  [EUA]      = {"ACESSORIES"},
  [CANADA]   = {"ACESSORIOS"}, 
};

const char *STRING_tela_edita_flag_BV20[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"BV20 CCTALK"},
  [URUGUAI]  = {"BV20 CCTALK"},
  [ARGENTINA]= {"BV20 CCTALK"},
  [PARAGUAI] = {"BV20 CCTALK"},
  [PERU]     = {"BV20 CCTALK"},
  [EUA]      = {"BV20 CCTALK"},
  [CANADA]   = {"BV20 CCTALK"}
};

const char *STRING_titulo_edita_flag_mdb_bill[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"MDB BILL"},
  [URUGUAI]  = {"MDB BILL"},
  [ARGENTINA]= {"MDB BILL"},
  [PARAGUAI] = {"MDB BILL"},
  [PERU]     = {"MDB BILL"},
  [EUA]      = {"MDB BILL"},
  [CANADA]   = {"MDB BILL"},
};

const char *STRING_titulo_edita_flag_mdb_coin[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"MDB COIN"},
  [URUGUAI]  = {"MDB COIN"},
  [ARGENTINA]= {"MDB COIN"},
  [PARAGUAI] = {"MDB COIN"},
  [PERU]     = {"MDB COIN"},
  [EUA]      = {"MDB COIN"},
  [CANADA]   = {"MDB COIN"},  
};

const char *STRING_titulo_edita_flag_mdb_cashless[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"MDB CASHLESS"},
  [URUGUAI]  = {"MDB CASHLESS"},
  [ARGENTINA]= {"MDB CASHLESS"},
  [PARAGUAI] = {"MDB CASHLESS"},
  [PERU]     = {"MDB CASHLESS"},
  [EUA]      = {"MDB CASHLESS"},
  [CANADA]   = {"MDB CASHLESS"},    
};

const char *STRING_titulo_edita_baudrate[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"BAUD IMPRESSORA"},
  [URUGUAI]  = {"BAUD IMPRESSORA"},
  [ARGENTINA]= {"BAUD IMPRESSORA"},
  [PARAGUAI] = {"BAUD IMPRESSORA"},
  [PERU]     = {"BAUD IMPRESSORA"},
  [EUA]      = {"BAUD PRINTER"},
  [CANADA]   = {"BAUD IMPRESSORA"},
};

const char *STRING_titulo_edita_pulso_moeda[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"PULSO MOEDEIRO"},
  [URUGUAI]  = {"PULSO MOEDEIRO"},
  [ARGENTINA]= {"PULSO MOEDEIRO"},
  [PARAGUAI] = {"PULSO MOEDEIRO"},
  [PERU]     = {"PULSO MOEDEIRO"},
  [EUA]      = {"COIN PULSE"},
  [CANADA]   = {"PULSO MOEDEIRO"},
};

const char *STRING_titulo_edita_pulso_noteiro[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"PULSO NOTEIRO"},
  [URUGUAI]  = {"PULSO NOTEIRO"},
  [ARGENTINA]= {"PULSO NOTEIRO"},
  [PARAGUAI] = {"PULSO NOTEIRO"},
  [PERU]     = {"PULSO NOTEIRO"},
  [EUA]      = {"BILL PULSE"},
  [CANADA]   = {"PULSO NOTEIRO"},  
};

const char *STRING_opcoes_menu_mdb[QTY_OF_LANGUAGES][TAM_OPCOES_MDB]={
  [BRASIL]   = {"(1) MDB DEVICES ",
                "(2) BILL        ",
                "(3) COIN        ",
                "(4) CASHLESS    ",
                "(5) VOLTAR      "},
  [URUGUAI]  = {"(1) MDB DEVICES ",
                "(2) BILL        ",
                "(3) COIN        ",
                "(4) CASHLESS    ",
                "(5) VOLTAR      "},
  [ARGENTINA]= {"(1) MDB DEVICES ",
                "(2) BILL        ",
                "(3) COIN        ",
                "(4) CASHLESS    ",
                "(5) VOLTAR      "},
  [PARAGUAI] = {"(1) MDB DEVICES ",
                "(2) BILL        ",
                "(3) COIN        ",
                "(4) CASHLESS    ",
                "(5) VOLTAR      "},
  [PERU]     = {"(1) MDB DEVICES ",
                "(2) BILL        ",
                "(3) COIN        ",
                "(4) CASHLESS    ",
                "(5) VOLTAR      "},
  [EUA]      = {"(1) MDB DEVICES ",
                "(2) BILL        ",
                "(3) COIN        ",
                "(4) CASHLESS    ",
                "(5) EXIT        "},
  [CANADA]   = {"(1) MDB DEVICES ",
                "(2) BILL        ",
                "(3) COIN        ",
                "(4) CASHLESS    ",
                "(5) VOLTAR      "},
};

const char *STRING_titulo_teste_devices_mdb[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"DEVICES MDB"},
  [URUGUAI]  = {"DEVICES MDB"},
  [ARGENTINA]= {"DEVICES MDB"},
  [PARAGUAI] = {"DEVICES MDB"},
  [PERU]     = {"DEVICES MDB"},
  [EUA]      = {"DEVICES MDB"},
  [CANADA]   = {"DEVICES MDB"},
};

const char *STRING_titulo_teste_bill_mdb[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"BILL MDB"},
  [URUGUAI]  = {"BILL MDB"},
  [ARGENTINA]= {"BILL MDB"},
  [PARAGUAI] = {"BILL MDB"},
  [PERU]     = {"BILL MDB"},
  [EUA]      = {"BILL MDB"},
  [CANADA]   = {"BILL MDB"},  
};

const char *STRING_titulo_teste_coin_mdb[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"COIN MDB"},
  [URUGUAI]  = {"COIN MDB"},
  [ARGENTINA]= {"COIN MDB"},
  [PARAGUAI] = {"COIN MDB"},
  [PERU]     = {"COIN MDB"},
  [EUA]      = {"COIN MDB"},
  [CANADA]   = {"COIN MDB"},   
};

const char *STRING_titulo_teste_coin_changer_mdb[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"TROCO MDB"},
  [URUGUAI]  = {"COIN MDB"},
  [ARGENTINA]= {"COIN MDB"},
  [PARAGUAI] = {"COIN MDB"},
  [PERU]     = {"COIN MDB"},
  [EUA]      = {"COIN MDB"},
  [CANADA]   = {"COIN MDB"},   
};

const char *STRING_titulo_teste_cashless_mdb[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"CASHLESS MDB"},
  [URUGUAI]  = {"CASHLESS MDB"},
  [ARGENTINA]= {"CASHLESS MDB"},
  [PARAGUAI] = {"CASHLESS MDB"},
  [PERU]     = {"CASHLESS MDB"},
  [EUA]      = {"CASHLESS MDB"},
  [CANADA]   = {"CASHLESS MDB"},       
};

const char *STRING_titulo_menu_mdb[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"TESTE MDB"},
  [URUGUAI]  = {"TESTE MDB"},
  [ARGENTINA]= {"TESTE MDB"},
  [PARAGUAI] = {"TESTE MDB"},
  [PERU]     = {"TESTE MDB"},
  [EUA]      = {"MDB TEST"},
  [CANADA]   = {"TESTE MDB"},     
};

const char *STRING_mensagem_saudacao_maquina[QTY_OF_LANGUAGES][2]={
  [BRASIL]   = {"Mais Pipoca","Grupo Altech"},
  [URUGUAI]  = {"Mais Pipoca","Grupo Altech"},
  [ARGENTINA]= {"Mais Pipoca","Grupo Altech"},
  [PARAGUAI] = {"Mais Pipoca","Grupo Altech"},
  [PERU]     = {"Mais Pipoca","Grupo Altech"},
  [EUA]      = {"-|HEY POP|-","            "},
  [CANADA]   = {"Mais Pipoca","Grupo Altech"},
};

const char *STRING_titulo_teste_lcd_externo[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"TESTE LCD EXT"},
  [URUGUAI]  = {"TESTE LCD EXT"},
  [ARGENTINA]= {"TESTE LCD EXT"},
  [PARAGUAI] = {"TESTE LCD EXT"},
  [PERU]     = {"TESTE LCD EXT"},
  [EUA]      = {"EXT LCD TEST"},
  [CANADA]   = {"TESTE LCD EXT"}, 
};

const char *STRING_impressao_teste[QTY_OF_LANGUAGES][QTD_LINHAS_IMPRESSAO_TESTE]={  
  //             123456789012345678901234567890123456789
  [BRASIL]   = {"TESTE DA IMPRESSORA\n\r",
                "GRUPO ALTECH 2017\n\r",
                "MAIS PIPOCA E\n\r",
                "\n\r\n\r\n\r\n\r"},
  [URUGUAI]  = {"TESTE DA IMPRESSORA\n\r",
                "GRUPO ALTECH 2017\n\r",
                "MAIS PIPOCA E\n\r",
                "\n\r\n\r\n\r\n\r"},
  [ARGENTINA]= {"TESTE DA IMPRESSORA\n\r",
                "GRUPO ALTECH 2017\n\r",
                "MAIS PIPOCA E\n\r",
                "\n\r\n\r\n\r\n\r"},
  [PARAGUAI] = {"TESTE DA IMPRESSORA\n\r",
                "GRUPO ALTECH 2017\n\r",
                "MAIS PIPOCA E\n\r",
                "\n\r\n\r\n\r\n\r"},
  [PERU]     = {"TESTE LCD EXT"},
  [EUA]      = {"PRINTER TESTE      \n\r",
                "GRUPO ALTECH 2017\n\r",
                "MAIS PIPOCA E\n\r",
                "\n\r\n\r\n\r\n\r"},
  [CANADA]   = {"TESTE DA IMPRESSORA\n\r",
                "GRUPO ALTECH 2017\n\r",
                "MAIS PIPOCA E\n\r",
                "\n\r\n\r\n\r\n\r"},
};

const char *STRING_titulo_teste_impresora[QTY_OF_LANGUAGES][2]={
  [BRASIL]   = {"TESTE IMPRESSORA","<enter>IMPRIME"},
  [URUGUAI]  = {"TESTE IMPRESSORA","<enter>IMPRIME"},
  [ARGENTINA]= {"TESTE IMPRESSORA","<enter>IMPRIME"},
  [PARAGUAI] = {"TESTE IMPRESSORA","<enter>IMPRIME"},
  [PERU]     = {"TESTE IMPRESSORA","<enter>IMPRIME"},
  [EUA]      = {"PRINTER TESTE","<enter>PRINT"},
  [CANADA]   = {"TESTE IMPRESSORA","<enter>IMPRIME"}
};


const char *STRING_titulo_menu_faturamento[QTY_OF_LANGUAGES]={
  [BRASIL]   = {"FATURAMENTO"},
  [URUGUAI]  = {"FATURAMENTO"},
  [ARGENTINA]= {"FATURAMENTO"},
  [PARAGUAI] = {"FATURAMENTO"},
  [PERU]     = {"FATURAMENTO"},
  [EUA]      = {"BILLING"},
  [CANADA]   = {"FATURAMENTO"},
};

const char *STRING_opcoes_menu_faturamento[QTY_OF_LANGUAGES][QTD_OPCOES_FATURAMENTO]={
  //             1234567890123456
  [BRASIL]   = {"(1)CONTADOR     ",
                "(2)FATURAMENTO  ",
                "(3)CARTAO       ",
                "(4)RELATORIO    ",
                "(5)ZERAMENTO    ",
                "(6)VOLTAR       "},                
  [URUGUAI]  = {"(1)CONTADOR     ",
                "(2)FATURAMENTO  ",
                "(3)CARTAO       ",
                "(4)RELATORIO    ",
                "(5)ZERAMENTO    ",
                "(6)VOLTAR       "},
  [ARGENTINA]= {"(1)CONTADOR     ",
                "(2)FATURAMENTO  ",
                "(3)CARTAO       ",
                "(4)RELATORIO    ",
                "(5)ZERAMENTO    ",
                "(6)VOLTAR       "},
  [PARAGUAI] = {"(1)CONTADOR     ",
                "(2)FATURAMENTO  ",
                "(3)CARTAO       ",
                "(4)RELATORIO    ",
                "(5)ZERAMENTO    ",
                "(6)VOLTAR       "},
  [PERU]     = {"(1)CONTADOR     ",
                "(2)FATURAMENTO  ",
                "(3)CARTAO       ",
                "(4)RELATORIO    ",
                "(5)ZERAMENTO    ",
                "(6)VOLTAR       "},
  [EUA]      = {"(1)COUNTER      ",
                "(2)BILLING      ",
                "(3)CREDIT CARD  ",
                "(4)REPORT       ",
                "(5)RESET COUNT  ",
                "(6)EXIT         "},
  [CANADA]   = {"(1)CONTADOR     ",
                "(2)FATURAMENTO  ",
                "(3)CARTAO       ",
                "(4)RELATORIO    ",
                "(5)ZERAMENTO    ",
                "(6)VOLTAR       "},
};

const char *STRING_opcoes_menu_preparacao[QTY_OF_LANGUAGES][QTD_OPCOES_PREPARACAO]={
  [BRASIL]    = {"(1) TEMPERATURA ",
                 "(2) VELOCIDADE  ",
                 "(3) VOLTAR      "},
  [URUGUAI]   = {"(1) TEMPERATURA ",
                 "(2) VELOCIDADE  ",
                 "(3) VOLTAR      "},
  [ARGENTINA] = {"(1) TEMPERATURA ",
                 "(2) VELOCIDADE  ",
                 "(3) VOLTAR      "},
  [PARAGUAI]  = {"(1) TEMPERATURA ",
                 "(2) VELOCIDADE  ",
                 "(3) VOLTAR      "},
  [PERU]      = {"(1) TEMPERATURA ",
                 "(2) VELOCIDADE  ",
                 "(3) VOLTAR      "},
  [EUA]       = {"(1) TEMPERATURE ",
                 "(2) BLOWER SPEED",
                 "(3) EXIT        "},
  [CANADA]    = {"(1) TEMPERATURA ",
                 "(2) VELOCIDADE  ",
                 "(3) VOLTAR      "}
};

const char *STRING_titulo_menu_preparacao[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"PREPARACAO"},
  [URUGUAI]   = {"PREPARACAO"},
  [ARGENTINA] = {"PREPARACAO"},
  [PARAGUAI]  = {"PREPARACAO"},
  [PERU]      = {"PREPARACAO"},
  [EUA]       = {"PREPARATION"},
  [CANADA]    = {"PREPARACAO"}
};

const char *STRING_titulo_edita_temperatura[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"TEMPERATURA"},
  [URUGUAI]   = {"TEMPERATURA"},
  [ARGENTINA] = {"TEMPERATURA"},
  [PARAGUAI]  = {"TEMPERATURA"},
  [PERU]      = {"TEMPERATURA"},
  [EUA]       = {"TEMPERATURE"},
  [CANADA]    = {"TEMPERATURA"}
};

const char *STRING_titulo_edita_velocidade[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"VELOCIDADE"},
  [URUGUAI]   = {"VELOCIDADE"},
  [ARGENTINA] = {"VELOCIDADE"},
  [PARAGUAI]  = {"VELOCIDADE"},
  [PERU]      = {"SPEED"},
  [EUA]       = {"SPEED"},
  [CANADA]    = {"VELOCIDADE"}
};

const char *STRING_mensagem_pipocas_prontas[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"   PRONTAS EM  "},
  [URUGUAI]   = {"PRUENTAS EN"},
  [ARGENTINA] = {"VELOCIDADE"},
  [PARAGUAI]  = {"VELOCIDADE"},
  [PERU]      = {"VELOCIDADE"},
  [EUA]       = {"TASTIER IN"},
  [CANADA]    = {"VELOCIDADE"}
};

const char *STRING_mensagem_preco[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"Valor(R$) %3d,%02d"},
  [URUGUAI]   = {"Valor($S) %05d.%02d"},
  [ARGENTINA] = {"VELOCIDADE"},
  [PARAGUAI]  = {"VELOCIDADE"},
  [PERU]      = {"VELOCIDADE"},
  [EUA]       = {"Price(U$) %3d.%02d"},
  [CANADA]    = {"VELOCIDADE"}  
};

const char *STRING_mensagem_pago[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"Pago (R$) %3d,%02d"},
  [URUGUAI]   = {"Pago (R$) %3d,%02d"},
  [ARGENTINA] = {"Pago (R$) %3d,%02d"},
  [PARAGUAI]  = {"Pago (R$) %3d,%02d"},
  [PERU]      = {"Pago (R$) %3d,%02d"},
  [EUA]       = {"Paid (U$) %3d,%02d"},
  [CANADA]    = {"Pago (R$) %3d,%02d"}
};

const char *STRING_mensagem_limpeza[QTY_OF_LANGUAGES][2]={
  [BRASIL]    = {"RETIRE AS","PIPOCAS"},
  [URUGUAI]   = {"RETIRE AS","PIPOCAS"},
  [ARGENTINA] = {"RETIRE AS","PIPOCAS"},
  [PARAGUAI]  = {"RETIRE AS","PIPOCAS"},
  [PERU]      = {"RETIRE AS","PIPOCAS"},
  [EUA]       = {"GET YOUR","POPCORN"},
  [CANADA]    = {"RETIRE AS","PIPOCAS"}
};

const char *STRING_mensagem_resfriando[QTY_OF_LANGUAGES][2]={
  [BRASIL]    = {"   RESFRIANDO  ","   AGUARDE...  "},
  [URUGUAI]   = {"   RESFRIANDO  ","   AGUARDE...  "},
  [ARGENTINA] = {"   RESFRIANDO  ","   AGUARDE...  "},
  [PARAGUAI]  = {"   RESFRIANDO  ","   AGUARDE...  "},
  [PERU]      = {"   RESFRIANDO  ","   AGUARDE...  "},
  [EUA]       = {"   COOLING     ","   HEATING     "},
  [CANADA]    = {"   RESFRIANDO  ","   AGUARDE...  "}
};

const char *STRING_mensagem_inicio_preparacao[QTY_OF_LANGUAGES][2]={
  [BRASIL]    = {"   INICIANDO   ","   PREPARACAO  "},
  [URUGUAI]   = {"   RESFRIANDO  ","   AGUARDE...  "},
  [ARGENTINA] = {"   RESFRIANDO  ","   AGUARDE...  "},
  [PARAGUAI]  = {"   RESFRIANDO  ","   AGUARDE...  "},
  [PERU]      = {"   RESFRIANDO  ","   AGUARDE...  "},
  [EUA]       = {"STARTING","PREPARATION"},
  [CANADA]    = {"   RESFRIANDO  ","   AGUARDE...  "}
};

const char *STRING_mensagem_limpeza_inicial[QTY_OF_LANGUAGES][2]={
  [BRASIL]    = {"LIMPANDO","COMPARTIMENTO"},
  [URUGUAI]   = {"LIMPANDO","COMPARTIMENTO"},
  [ARGENTINA] = {"LIMPANDO","COMPARTIMENTO"},
  [PARAGUAI]  = {"LIMPANDO","COMPARTIMENTO"},
  [PERU]      = {"LIMPANDO","COMPARTIMENTO"},
  [EUA]       = {"CLEANING","HEATING"},
  [CANADA]    = {"LIMPANDO","COMPARTIMENTO"}
};

const char *STRING_mensagem_edita_tempo_embalagem[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"TEMPO MOTOR EMB."},
  [URUGUAI]   = {"TEMPO MOTOR EMB."},
  [ARGENTINA] = {"TEMPO MOTOR EMB."},
  [PARAGUAI]  = {"TEMPO MOTOR EMB."},
  [PERU]      = {"TEMPO MOTOR EMB."},
  [EUA]       = {"TIME CUP MOTOR"},
  [CANADA]    = {"TEMPO MOTOR EMB."},
};

const char *STRING_menu_servico[QTY_OF_LANGUAGES][QTD_OPCOES_SERVICO]={
  //              1234567890123456
  //-------------------------------
  [BRASIL]    = {"(1) LIMPEZA     ",
                 "(2) EMBALAGEM   ",
                 "(3) PORCAO MILHO",
                 "(4) RESFRIAMENTO",
                 "(5) PREPARACAO  ",
                 "(6) VOLTAR      "},
   //-------------------------------
  [URUGUAI]   = {"(1) LIMPEZA     ",
                 "(2) EMBALAGEM   ",
                 "(3) PORCAO MILHO",
                 "(4) RESFRIAMENTO",
                 "(5) PREPARACAO  ",
                 "(6) VOLTAR      "},
  //-------------------------------   
  [ARGENTINA] ={"(1) LIMPEZA     ",
                 "(2) EMBALAGEM   ",
                 "(3) PORCAO MILHO",
                 "(4) RESFRIAMENTO",
                 "(5) PREPARACAO  ",
                 "(6) VOLTAR      "},
   //-------------------------------   
  [PARAGUAI]  = {"(1) LIMPEZA     ",
                 "(2) EMBALAGEM   ",
                 "(3) PORCAO MILHO",
                 "(4) RESFRIAMENTO",
                 "(5) PREPARACAO  ",
                 "(6) VOLTAR      "},
  //-------------------------------
  [PERU]      = {"(1) LIMPEZA     ",
                 "(2) EMBALAGEM   ",
                 "(3) PORCAO MILHO",
                 "(4) RESFRIAMENTO",
                 "(5) PREPARACAO  ",
                 "(6) VOLTAR      "},
  //-------------------------------
  [EUA]       = {"(1) CLEANING    ",
                 "(2) CUP         ",
                 "(3) CORN PORTION",
                 "(4) COOLING     ",
                 "(5) PREPARATION ",
                 "(6) EXIT        "},
  //-------------------------------
  [CANADA]    = {"(1) LIMPEZA     ",
                 "(2) EMBALAGEM   ",
                 "(3) PORCAO MILHO",
                 "(4) RESFRIAMENTO",
                 "(5) PREPARACAO  ",
                 "(6) VOLTAR      "},
};

const char *STRING_titulo_menu_servico[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"MENU SERVICO"},
  [URUGUAI]   = {"MENU SERVICO"},
  [ARGENTINA] = {"MENU SERVICO"},
  [PARAGUAI]  = {"MENU SERVICO"},
  [PERU]      = {"MENU SERVICO"},
  [EUA]       = {"SERVICE"},
  [CANADA]    = {"MENU SERVICO"},
};

const char *STRING_mensagem_libera_embalagem[QTY_OF_LANGUAGES][2]={
  [BRASIL]    = {"LIBERANDO","EMBALAGEM"},
  [URUGUAI]   = {"LIBERANDO","EMBALAGEM"},
  [ARGENTINA] = {"LIBERANDO","EMBALAGEM"},
  [PARAGUAI]  = {"LIBERANDO","EMBALAGEM"},
  [PERU]      = {"LIBERANDO","EMBALAGEM"},
  [EUA]       = {"CUP","DISPENSING"},
  [CANADA]    = {"LIBERANDO","EMBALAGEM"}
};

const char *STRING_mensagem_dosando_milho[QTY_OF_LANGUAGES][2]={
  [BRASIL]    = {"DOSANDO","MILHO"},
  [URUGUAI]   = {"DOSANDO","MILHO"},
  [ARGENTINA] = {"DOSANDO","MILHO"},
  [PARAGUAI]  = {"DOSANDO","MILHO"},
  [PERU]      = {"DOSANDO","MILHO"},
  [EUA]       = {"CORN","PORTION"},
  [CANADA]    = {"DOSANDO","MILHO"},
};

const char *STRING_titulo_menu_teste_musica[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"TESTE MUSICA"},
  [URUGUAI]   = {"TESTE MUSICA"},
  [ARGENTINA] = {"TESTE MUSICA"},
  [PARAGUAI]  = {"TESTE MUSICA"},
  [PERU]      = {"TESTE MUSICA"},
  [EUA]       = {"MUSIC TEST"},
  [CANADA]    = {"TESTE MUSICA"}
};

const char *STRING_titulo_menu_edita_volume_musica[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"VOLUME MUSICA"},
  [URUGUAI]   = {"VOLUME MUSICA"},
  [ARGENTINA] = {"VOLUME MUSICA"},
  [PARAGUAI]  = {"VOLUME MUSICA"},
  [PERU]      = {"VOLUME MUSICA"},
  [EUA]       = {"MUSIC LEVEL"},
  [CANADA]    = {"VOLUME MUSICA"},
};

const char *STRING_titulo_menu_edita_volume_voz[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"VOLUME VOZ"},
  [URUGUAI]   = {"VOLUME VOZ"},
  [ARGENTINA] = {"VOLUME VOZ"},
  [PARAGUAI]  = {"VOLUME VOZ"},
  [PERU]      = {"VOLUME VOZ"},
  [EUA]       = {"VOICE LEVEL"},
  [CANADA]    = {"VOLUME VOZ"},
};

const char *STRING_titulo_menu_teste_vozes[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"TESTE LOCUCOES"},
  [URUGUAI]   = {"TESTE LOCUCOES"},
  [ARGENTINA] = {"TESTE LOCUCOES"},
  [PARAGUAI]  = {"TESTE LOCUCOES"},
  [PERU]      = {"TESTE LOCUCOES"},
  [EUA]       = {"VOICE TESTE"},
  [CANADA]    = {"TESTE LOCUCOES"}
};

const char *STRING_titulo_menu_intervalo_prop[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"TEMPO PROP."},
  [URUGUAI]   = {"TEMPO PROP."},
  [ARGENTINA] = {"TEMPO PROP."},
  [PARAGUAI]  = {"TEMPO PROP."},
  [PERU]      = {"TEMPO PROP."},
  [EUA]       = {"TIME PROP"},
  [CANADA]    = {"TEMPO PROP."}
};

const char *STRING_mensagem_fora_servico[QTY_OF_LANGUAGES]={
  //              1234567890123456
  [BRASIL]    = {"FORA DE SERVICO"},
  [URUGUAI]   = {"FORA DE SERVICO"},
  [ARGENTINA] = {"FORA DE SERVICO"},
  [PARAGUAI]  = {"FORA DE SERVICO"},
  [PERU]      = {"FORA DE SERVICO"},
  [EUA]       = {"OUT OF SERVICE"},
  [CANADA]    = {"FORA DE SERVICO"},
};

const char *STRING_mensagem_inicio_autoteste[QTY_OF_LANGUAGES][2]={
  //              1234567890123456
  [BRASIL]    = {"   EXECUTANDO   ","   AUTOTESTE    "},
  [URUGUAI]   = {"   EXECUTANDO   ","   AUTOTESTE    "},
  [ARGENTINA] = {"   EXECUTANDO   ","   AUTOTESTE    "},
  [PARAGUAI]  = {"   EXECUTANDO   ","   AUTOTESTE    "},
  [PERU]      = {"   EXECUTANDO   ","   AUTOTESTE    "},
  [EUA]       = {"   EXECUTANDO   ","   AUTOTESTE    "},
  [CANADA]    = {"   EXECUTANDO   ","   AUTOTESTE    "},
};

const char *STRING_mensagem_retire_troco[QTY_OF_LANGUAGES][2]={
  [BRASIL]    = {"RETIRE O SEU","TROCO"},
  [URUGUAI]   = {"RETIRE O SEU","TROCO"},
  [ARGENTINA] = {"RETIRE O SEU","TROCO"},
  [PARAGUAI]  = {"RETIRE O SEU","TROCO"},
  [PERU]      = {"RETIRE O SEU","TROCO"},
  [EUA]       = {"GET YOUR","CHANGE"},
  [CANADA]    = {"RETIRE O SEU","TROCO"}
};

const char *STRING_mensagem_sem_troco[QTY_OF_LANGUAGES][2]={
  [BRASIL]   = {"SEM TROCO","PARA INICIAR"},
  [URUGUAI]  = {"J'appelle","Mais Pipoca"},
  [ARGENTINA]= {"J'appelle","Mais Pipoca"},
  [PARAGUAI] = {"J'appelle","Mais Pipoca"},
  [PERU]     = {"J'appelle","Mais Pipoca"},
  [EUA]      = {"NO COINS","FOR CHANGE"},
  [CANADA]   = {"J'appelle","Mais Pipoca"},
};

const char *STRING_mensagem_configura_free[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"MODO GRATIS"},
  [URUGUAI]   = {"FORA DE SERVICO"},
  [ARGENTINA] = {"FORA DE SERVICO"},
  [PARAGUAI]  = {"FORA DE SERVICO"},
  [PERU]      = {"FORA DE SERVICO"},
  [EUA]       = {"FREE MODE"},
  [CANADA]    = {"FORA DE SERVICO"}, 
};

const char *STRING_mensagem_configura_fita_led[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"FITA LED"},
  [URUGUAI]   = {"FORA DE SERVICO"},
  [ARGENTINA] = {"FORA DE SERVICO"},
  [PARAGUAI]  = {"FORA DE SERVICO"},
  [PERU]      = {"FORA DE SERVICO"},
  [EUA]       = {"LED STRIP"},
  [CANADA]    = {"FORA DE SERVICO"},   
};

const char *STRING_mensagem_modo_gratis[QTY_OF_LANGUAGES][2]={
  //             1234567890123456  1234567890123456
  [BRASIL]   = {"PRESSIONE BOTAO","  PARA INICIAR  "},
  [URUGUAI]  = {"J'appelle","Mais Pipoca"},
  [ARGENTINA]= {"J'appelle","Mais Pipoca"},
  [PARAGUAI] = {"J'appelle","Mais Pipoca"},
  [PERU]     = {"J'appelle","Mais Pipoca"},
  [EUA]      = {" PRESS BUTTON  ","     TO START   "},    
  [CANADA]   = {"J'appelle","Mais Pipoca"},
};

const char *STRING_mensagem_noteiro_mdb_offline[QTY_OF_LANGUAGES][2]={
  [BRASIL]   = {"BILL MDB OFFLINE","E20"},
  [URUGUAI]  = {"BILL MDB OFFLINE","E20"},
  [ARGENTINA]= {"BILL MDB OFFLINE","E20"},
  [PARAGUAI] = {"BILL MDB OFFLINE","E20"},
  [PERU]     = {"BILL MDB OFFLINE","E20"},
  [EUA]      = {"BILL MDB OFFLINE","E20"},
  [CANADA]   = {"BILL MDB OFFLINE","E20"},
};

const char *STRING_mensagem_moedeiro_mdb_offline[QTY_OF_LANGUAGES][2]={
  [BRASIL]   = {"COIN MDB OFFLINE","E20"},
  [URUGUAI]  = {"COIN MDB OFFLINE","E20"},
  [ARGENTINA]= {"COIN MDB OFFLINE","E20"},
  [PARAGUAI] = {"COIN MDB OFFLINE","E20"},
  [PERU]     = {"COIN MDB OFFLINE","E20"},
  [EUA]      = {"COIN MDB OFFLINE","E20"},
  [CANADA]   = {"COIN MDB OFFLINE","E20"},
};

const char *STRING_mensagem_cctalk_offline[QTY_OF_LANGUAGES][2]={
  [BRASIL]   = {"CCTALK OFFLINE","E21"},
  [URUGUAI]  = {"CCTALK OFFLINE","E21"},
  [ARGENTINA]= {"CCTALK OFFLINE","E21"},
  [PARAGUAI] = {"CCTALK OFFLINE","E21"},
  [PERU]     = {"CCTALK OFFLINE","E21"},
  [EUA]      = {"CCTALK OFFLINE","E21"},
  [CANADA]   = {"CCTALK OFFLINE","E21"},
};

const char *STRING_titulo_checa_senha[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"SENHA"},
  [URUGUAI]   = {"FORA DE SERVICO"},
  [ARGENTINA] = {"FORA DE SERVICO"},
  [PARAGUAI]  = {"FORA DE SERVICO"},
  [PERU]      = {"FORA DE SERVICO"},
  [EUA]       = {"PASSWORD"},
  [CANADA]    = {"FORA DE SERVICO"},  
};

const char *STRING_titulo_configura_troco[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"USO DE TROCO"},
  [URUGUAI]   = {"USO DE TROCO"},
  [ARGENTINA] = {"USO DE TROCO"},
  [PARAGUAI]  = {"USO DE TROCO"},
  [PERU]      = {"USO DE TROCO"},
  [EUA]       = {"CHANGE USE"},
  [CANADA]    = {"CHANGE USE"}
};
    
///
/// Mensagens no display dentro do menu
/// teste do hardware
///
const char *STRING_menu_avancado[QTY_OF_LANGUAGES][QTD_OPCOES_AVANCADO]={
  
  [BRASIL]={
    //1234567890123456
     "(1) PADRAO FAB. ",
     "(2) SENHA ADMIN ",
     "(3) RESET GERAL ",
     "(4) MOTOR AC    ",
     "(5) NUM SERIE   ",
     "(6) HORA/DATA   ",
     "(7) VOLTAR      "
  },
  [URUGUAI]={
    //1234567890123456
     "(1) PADRAO FAB. ",
     "(2) SENHA ADMIN ",
     "(3) RESET GERAL ",
     "(4) MOTOR AC    ",
     "(5) NUM SERIE   ",
     "(6) HORA/DATA   ",
     "(7) VOLTAR      "
  },
  [ARGENTINA]={
    //1234567890123456
     "(1) PADRAO FAB. ",
     "(2) SENHA ADMIN ",
     "(3) RESET GERAL ",
     "(4) MOTOR AC    ",
     "(5) NUM SERIE   ",
     "(6) HORA/DATA   ",
     "(7) VOLTAR      "
  },
  [PARAGUAI]={
    //1234567890123456
     "(1) PADRAO FAB. ",
     "(2) SENHA ADMIN ",
     "(3) RESET GERAL ",
     "(4) MOTOR AC    ",
     "(5) NUM SERIE   ",
     "(6) HORA/DATA   ",
     "(7) VOLTAR      "
  },
  [PERU]={
    //1234567890123456
     "(1) PADRAO FAB. ",
     "(2) SENHA ADMIN ",
     "(3) RESET GERAL ",
     "(4) MOTOR AC    ",
     "(5) NUM SERIE   ",
     "(6) HORA/DATA   ",
     "(7) VOLTAR      "
  },
  [EUA]={
    //1234567890123456
     "(1) FACTORY SET.",
     "(2) MASTER PWS  ",
     "(3) GERAL RESET ",
     "(4) PID AC MOTOR",
     "(5) SERIAL NUMB.",
     "(6) HOUR/DATE   ",
     "(7) EXIT        "
  },
  [CANADA]={
    //1234567890123456
     "(1) PADRAO FAB. ",
     "(2) SENHA ADMIN ",
     "(3) RESET GERAL ",
     "(4) MOTOR AC    ",
     "(5) NUM SERIE   ",
     "(6) HORA/DATA   ",
     "(7) VOLTAR      "
  },  
};

const char *STRING_titulo_menu_avancado[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"MENU AVANCADO"},
  [URUGUAI]   = {"MENU AVANCADO"},
  [ARGENTINA] = {"MENU AVANCADO"},
  [PARAGUAI]  = {"MENU AVANCADO"},
  [PERU]      = {"MENU AVANCADO"},
  [EUA]       = {"ADVANCED MENU"},
  [CANADA]    = {"MENU AVANCADO"}
};

const char *STRING_titulo_padrao_fabrica[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"PADRAO FABRICA"},
  [URUGUAI]   = {"PADRAO FABRICA"},
  [ARGENTINA] = {"PADRAO FABRICA"},
  [PARAGUAI]  = {"PADRAO FABRICA"},
  [PERU]      = {"PADRAO FABRICA"},
  [EUA]       = {"FACTORY REST."},
  [CANADA]    = {"PADRAO FABRICA"},
};

const char *STRING_mensagem_reset_fabrica[QTY_OF_LANGUAGES][2]={
  [BRASIL]   = {"REINICIANDO","PARAMETROS"},
  [URUGUAI]  = {"REINICIANDO","PARAMETROS"},
  [ARGENTINA]= {"REINICIANDO","PARAMETROS"},
  [PARAGUAI] = {"REINICIANDO","PARAMETROS"},
  [PERU]     = {"REINICIANDO","PARAMETROS"},
  [EUA]      = {"RESTARTING","SETUP"},
  [CANADA]   = {"REINICIANDO","PARAMETROS"},
};

const char *STRING_mensagem_inserir_senha[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"NOVA SENHA"},
  [URUGUAI]   = {"NOVA SENHA"},
  [ARGENTINA] = {"NOVA SENHA"},
  [PARAGUAI]  = {"NOVA SENHA"},
  [PERU]      = {"NOVA SENHA"},
  [EUA]       = {"NEW PSW"},
  [CANADA]    = {"NOVA SENHA"},
};

const char *STRING_mensagem_cadastro_senha[QTY_OF_LANGUAGES][2]={
  [BRASIL]   = {"CADASTRADO","C/ SUCESSO"},
  [URUGUAI]  = {"CADASTRADO","C/ SUCESSO"},
  [ARGENTINA]= {"CADASTRADO","C/ SUCESSO"},
  [PARAGUAI] = {"CADASTRADO","C/ SUCESSO"},
  [PERU]     = {"CADASTRADO","C/ SUCESSO"},
  [EUA]      = {"SUCCESS","NEW PSW"},
  [CANADA]   = {"CADASTRADO","C/ SUCESSO"},
};

const char *STRING_mensagem_cadastro_senha_erro[QTY_OF_LANGUAGES][2]={
  [BRASIL]   = {"SENHAS INF.","SAO DIFERENTES"},
  [URUGUAI]  = {"SENHAS INF.","SAO DIFERENTES"},
  [ARGENTINA]= {"SENHAS INF.","SAO DIFERENTES"},
  [PARAGUAI] = {"SENHAS INF.","SAO DIFERENTES"},
  [PERU]     = {"SENHAS INF.","SAO DIFERENTES"},
  [EUA]      = {"SENHAS INF.","SAO DIFERENTES"},
  [CANADA]   = {"SENHAS INF.","SAO DIFERENTES"},
};

const char *STRING_mensagem_reinicia_totalizadores[QTY_OF_LANGUAGES][2]={
  [BRASIL]   = {"REINICIANDO","TOTALIZADORES"},
  [URUGUAI]  = {"REINICIANDO","TOTALIZADORES"},
  [ARGENTINA]= {"REINICIANDO","TOTALIZADORES"},
  [PARAGUAI] = {"REINICIANDO","TOTALIZADORES"},
  [PERU]     = {"REINICIANDO","TOTALIZADORES"},
  [EUA]      = {"REINICIANDO","TOTALIZADORES"},
  [CANADA]   = {"REINICIANDO","TOTALIZADORES"},
};

const char *STRING_mensagem_reinicia_totalizadores_erro[QTY_OF_LANGUAGES][2]={
  [BRASIL]   = {"CODIGO","INVALIDO"},
  [URUGUAI]  = {"CODIGO","INVALIDO"},
  [ARGENTINA]= {"CODIGO","INVALIDO"},
  [PARAGUAI] = {"CODIGO","INVALIDO"},
  [PERU]     = {"CODIGO","INVALIDO"},
  [EUA]      = {"CODIGO","INVALIDO"},
  [CANADA]   = {"CODIGO","INVALIDO"},
};


const char *STRING_titulo_edita_serial[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"NUMERO SERIE"},
  [URUGUAI]   = {"NUMERO SERIE"},
  [ARGENTINA] = {"NUMERO SERIE"},
  [PARAGUAI]  = {"NUMERO SERIE"},
  [PERU]      = {"NUMERO SERIE"},
  [EUA]       = {"SERIAL NUMB."},
  [CANADA]    = {"NUMERO SERIE"},
};

const char *STRING_titulo_edita_comissao[QTY_OF_LANGUAGES]={
  [BRASIL]    = {"COMISSAO PONTO"},
  [URUGUAI]   = {"COMISSAO PONTO"},
  [ARGENTINA] = {"COMISSAO PONTO"},
  [PARAGUAI]  = {"COMISSAO PONTO"},
  [PERU]      = {"COMISSAO PONTO"},
  [EUA]       = {"COMISSAO PONTO"},
  [CANADA]    = {"COMISSAO PONTO"},
};

const char *STRING_titulo_edita_flag_desumidifcador[QTY_OF_LANGUAGES]={
  [BRASIL]    = {" HABILT. DESUM. "},
  [URUGUAI]   = {" HABILT. DESUM. "},
  [ARGENTINA] = {" HABILT. DESUM. "},
  [PARAGUAI]  = {" HABILT. DESUM. "},
  [PERU]      = {" HABILT. DESUM. "},
  [EUA]       = {" HABILT. DESUM. "},
  [CANADA]    = {" HABILT. DESUM. "},
};


#else

//
// Mensagem de saudação 
// no display
//
extern const char *STRING_splash[QTY_OF_LANGUAGES][2];
extern const char *STRING_menu_configuracao[QTY_OF_LANGUAGES][TAM_OPCOES_CFG];
extern const char *STRING_titulo_menu_configuracao[QTY_OF_LANGUAGES];
extern const char *STRING_tela_sel_idioma[QTY_OF_LANGUAGES][TAM_OPCOES_IDIOMA];
extern const char *STRING_menu_teste_hardware[QTY_OF_LANGUAGES][TAM_OPCOES_HARDWARE];
extern const char *STRING_titulo_teste_hardware[QTY_OF_LANGUAGES];
extern const char *STRING_teste_rtc[QTY_OF_LANGUAGES];
extern const char *STRING_teste_data_flash[QTY_OF_LANGUAGES];
extern const char *STRING_passos_teste_dataflash[QTY_OF_LANGUAGES][4];
extern const char *STRING_tela_teste_dispensador_papel[QTY_OF_LANGUAGES];
extern const char *STRING_tela_teste_dosador[QTY_OF_LANGUAGES];
extern const char *STRING_texto_teste_motor[QTY_OF_LANGUAGES][3];
extern const char *STRING_teste_ventilador[QTY_OF_LANGUAGES];
extern const char *STRING_teste_panela[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_menu_operacao[QTY_OF_LANGUAGES];
extern const char *STRING_menu_configuracao_operacao[QTY_OF_LANGUAGES][QTD_OPCOES_OPERACAO];
extern const char *STRING_titulo_ajusta_valor[QTY_OF_LANGUAGES];
extern const char *STRING_simbolo_moeda[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_configuracao_notas[QTY_OF_LANGUAGES];
extern const char *STRING_tabela_cedulas_canais[QTY_OF_LANGUAGES][QTD_CEDULAS];
extern const char *STRING_mensagem_teste_BV20[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_teste_uca1[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_teste_P70[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_teste_led_instrucao[QTY_OF_LANGUAGES];
extern const char *STRING_opcoes_menu_acessorios[QTY_OF_LANGUAGES][TAM_OPCOES_ACESSORIOS];
extern const char *STRING_titulo_menu_acessorios[QTY_OF_LANGUAGES];
extern const char *STRING_tela_edita_flag_BV20[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_edita_flag_mdb_bill[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_edita_flag_mdb_coin[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_edita_flag_mdb_cashless[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_edita_baudrate[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_edita_pulso_moeda[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_edita_pulso_noteiro[QTY_OF_LANGUAGES];
extern const char *STRING_opcoes_menu_mdb[QTY_OF_LANGUAGES][TAM_OPCOES_MDB];
extern const char *STRING_titulo_teste_devices_mdb[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_teste_bill_mdb[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_teste_coin_mdb[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_teste_cashless_mdb[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_menu_mdb[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_saudacao_maquina[QTY_OF_LANGUAGES][2];
extern const char *STRING_titulo_teste_lcd_externo[QTY_OF_LANGUAGES];
extern const char *STRING_impressao_teste[QTY_OF_LANGUAGES][QTD_LINHAS_IMPRESSAO_TESTE];
extern const char *STRING_titulo_teste_impresora[QTY_OF_LANGUAGES][2];
extern const char *STRING_titulo_menu_faturamento[QTY_OF_LANGUAGES];
extern const char *STRING_opcoes_menu_faturamento[QTY_OF_LANGUAGES][QTD_OPCOES_FATURAMENTO];
extern const char *STRING_titulo_teste_coin_changer_mdb[QTY_OF_LANGUAGES];
extern const char *STRING_opcoes_menu_preparacao[QTY_OF_LANGUAGES][QTD_OPCOES_PREPARACAO];
extern const char *STRING_titulo_menu_preparacao[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_edita_temperatura[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_edita_velocidade[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_pipocas_prontas[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_preco[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_limpeza[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_resfriando[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_inicio_preparacao[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_limpeza_inicial[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_edita_tempo_embalagem[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_pago[QTY_OF_LANGUAGES];
extern const char *STRING_menu_servico[QTY_OF_LANGUAGES][QTD_OPCOES_SERVICO];
extern const char *STRING_titulo_menu_servico[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_libera_embalagem[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_dosando_milho[QTY_OF_LANGUAGES][2];
extern const char *STRING_titulo_menu_teste_musica[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_menu_edita_volume_musica[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_menu_edita_volume_voz[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_menu_teste_vozes[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_menu_intervalo_prop[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_fora_servico[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_inicio_autoteste[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_retire_troco[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_sem_troco[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_configura_free[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_configura_fita_led[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_modo_gratis[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_noteiro_mdb_offline[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_moedeiro_mdb_offline[QTY_OF_LANGUAGES][2];
extern const char *STRING_titulo_checa_senha[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_configura_troco[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_cctalk_offline[QTY_OF_LANGUAGES][2];
extern const char *STRING_menu_avancado[QTY_OF_LANGUAGES][QTD_OPCOES_AVANCADO];
extern const char *STRING_titulo_menu_avancado[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_padrao_fabrica[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_reset_fabrica[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_inserir_senha[QTY_OF_LANGUAGES];
extern const char *STRING_mensagem_cadastro_senha[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_cadastro_senha_erro[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_reinicia_totalizadores[QTY_OF_LANGUAGES][2];
extern const char *STRING_mensagem_reinicia_totalizadores_erro[QTY_OF_LANGUAGES][2];
extern const char *STRING_titulo_edita_serial[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_edita_comissao[QTY_OF_LANGUAGES];
extern const char *STRING_titulo_edita_flag_desumidifcador[QTY_OF_LANGUAGES];

#endif






#endif//_MENSAGENS_H_