///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     09/Sep/2017  15:28:14 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_ac /
//                    essorios.c                                              /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_ac /
//                    essorios.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\De /
//                    bug\List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Deb /
//                    ug\List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug /
//                    \Obj\ --no_cse --no_unroll --no_inline                  /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\menu_a /
//                    cessorios.s                                             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_acessorios

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN APLICACAO_carrega_idioma
        EXTERN MEF_entry
        EXTERN MEI_entry
        EXTERN MENUROLAGEM_show
        EXTERN MSL_entry
        EXTERN PARAMETROS_grava
        EXTERN PARAMETROS_le
        EXTERN STRING_opcoes_menu_acessorios
        EXTERN STRING_tela_edita_flag_BV20
        EXTERN STRING_titulo_edita_baudrate
        EXTERN STRING_titulo_edita_flag_mdb_bill
        EXTERN STRING_titulo_edita_flag_mdb_cashless
        EXTERN STRING_titulo_edita_flag_mdb_coin
        EXTERN STRING_titulo_edita_pulso_moeda
        EXTERN STRING_titulo_edita_pulso_noteiro
        EXTERN STRING_titulo_menu_acessorios
        EXTERN __aeabi_memcpy4

        PUBLIC MACESS_configura_baud_impressora
        PUBLIC MACESS_configura_bv20
        PUBLIC MACESS_configura_cartao_mdb
        PUBLIC MACESS_configura_moedeiro_mdb
        PUBLIC MACESS_configura_noteiro_mdb
        PUBLIC MACESS_configura_pulso_moeda
        PUBLIC MACESS_configura_pulso_noteiro
        PUBLIC MACESS_entry
        PUBLIC MACESS_func
        
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
`?<Constant "1200">`:
        DATA
        DC8 "1200"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "2400">`:
        DATA
        DC8 "2400"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "4800">`:
        DATA
        DC8 "4800"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "9600">`:
        DATA
        DC8 "9600"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "14400">`:
        DATA
        DC8 "14400"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "19200">`:
        DATA
        DC8 "19200"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "38400">`:
        DATA
        DC8 "38400"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "56000">`:
        DATA
        DC8 "56000"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "57600">`:
        DATA
        DC8 "57600"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "115200">`:
        DATA
        DC8 "115200"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {&"1200", &"2400", &"4800", &"9600"`:
        DATA
        DC32 `?<Constant "1200">`, `?<Constant "2400">`, `?<Constant "4800">`
        DC32 `?<Constant "9600">`, `?<Constant "14400">`, `?<Constant "19200">`
        DC32 `?<Constant "38400">`, `?<Constant "56000">`
        DC32 `?<Constant "57600">`, `?<Constant "115200">`

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {1200, 2400, 4800, 9600, 14400, 192`:
        DATA
        DC32 1200, 2400, 4800, 9600, 14400, 19200, 38400, 56000, 57600, 115200

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "ON "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "OFF"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%04d">`:
        DATA
        DC8 "%04d"
        DC8 0, 0, 0
// C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_acessorios.c
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
//   17 |       Arquivo            :  menu_acessorios.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :
//   21 |
//   22 |       Revisões           :  001
//   23 |
//   24 |
//   25 | __________________________________________________________________________________
//   26 */
//   27 
//   28 /***********************************************************************************
//   29 *       Includes
//   30 ***********************************************************************************/
//   31 #include <stdio.h>
//   32 #include <stdlib.h>
//   33 #include <string.h>
//   34 #include "..\includes.h"
//   35 #include "menu_edita_inteiro.h"
//   36 #include "menu_ajuste_relogio.h"
//   37 #include "menu_configuracao.h"
//   38 #include "menu_edita_flag.h"
//   39 #include "menu_edita_listagem.h"
//   40 #include "menu_info_binaria.h"
//   41 #include "menu_rolagem.h"
//   42 #include "menu_teste_hardware.h"
//   43 #include "menu_acessorios.h"
//   44 #include "menu_seleciona_lista.h"
//   45 
//   46 /***********************************************************************************
//   47 *       Variaveis locais
//   48 ***********************************************************************************/
//   49 
//   50 
//   51 /***********************************************************************************
//   52 *       Funções locais
//   53 ***********************************************************************************/
//   54 void MACESS_configura_baud_impressora(void);
//   55 void MACESS_configura_bv20(void);
//   56 void MACESS_configura_noteiro_mdb(void);
//   57 void MACESS_configura_moedeiro_mdb(void);
//   58 void MACESS_configura_cartao_mdb(void);
//   59 void MACESS_configura_pulso_moeda(void);
//   60 void MACESS_configura_pulso_noteiro(void);
//   61 
//   62 /***********************************************************************************
//   63 *       Tabela de funções
//   64 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   65 void(*const MACESS_func[])(void)={
MACESS_func:
        DATA
        DC32 MACESS_configura_baud_impressora, MACESS_configura_bv20
        DC32 MACESS_configura_noteiro_mdb, MACESS_configura_moedeiro_mdb
        DC32 MACESS_configura_cartao_mdb, MACESS_configura_pulso_moeda
        DC32 MACESS_configura_pulso_noteiro, 0H
//   66   MACESS_configura_baud_impressora,
//   67   MACESS_configura_bv20,
//   68   MACESS_configura_noteiro_mdb,
//   69   MACESS_configura_moedeiro_mdb,
//   70   MACESS_configura_cartao_mdb,
//   71   MACESS_configura_pulso_moeda,
//   72   MACESS_configura_pulso_noteiro,
//   73   NULL  
//   74 };
//   75 
//   76 /***********************************************************************************
//   77 *       Implementação das funções
//   78 ***********************************************************************************/
//   79 
//   80 /***********************************************************************************
//   81 *       Descrição       :       Ponto de entrada do menu de configuração
//   82 *                               dos acessórios que serão utilizados
//   83 *                               na máquina
//   84 *       Parametros      :       nenhum
//   85 *       Retorno         :       nenhum
//   86 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MACESS_entry
        THUMB
//   87 void MACESS_entry(void){  
MACESS_entry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   88   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//   89   
//   90   MENUROLAGEM_show((char*)STRING_titulo_menu_acessorios[idioma],
//   91                    (char**)STRING_opcoes_menu_acessorios[idioma],
//   92                    TAM_OPCOES_ACESSORIOS,
//   93                    (void(**)(void))MACESS_func);         
        LDR.N    R3,??DataTable7_2
        MOVS     R2,#+8
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_3
        ADDS     R1,R0,R4, LSL #+5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_4
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MENUROLAGEM_show
        BL       MENUROLAGEM_show
//   94 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   95 /***********************************************************************************
//   96 *       Descrição       :       Configura o baudrate da impressora
//   97 *       Parametros      :       nenhum
//   98 *       Retorno         :       nenhum
//   99 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MACESS_configura_baud_impressora
        THUMB
//  100 void MACESS_configura_baud_impressora(void){
MACESS_configura_baud_impressora:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+96
          CFI CFA R13+104
//  101   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  102   unsigned int baud;
//  103   const char *nomes_baud[]={
//  104     "1200","2400","4800","9600","14400","19200","38400","56000","57600","115200",
//  105   };
        ADD      R0,SP,#+56
        LDR.N    R1,??DataTable7_5
        MOVS     R2,#+40
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
//  106   unsigned int bauds[]={
//  107     1200  ,2400  ,4800  , 9600, 14400  ,19200  ,38400 ,56000   ,57600  ,115200
//  108   };
        ADD      R0,SP,#+16
        LDR.N    R1,??DataTable7_6
        MOVS     R2,#+40
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
//  109   unsigned char flags[10]={0};
        ADD      R0,SP,#+4
        MOVS     R1,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        STM      R0!,{R1-R3}
        SUBS     R0,R0,#+12
//  110   
//  111   PARAMETROS_le(ADR_BAUDRATE_IMPRESSORA,&baud);
        ADD      R1,SP,#+0
        MOVS     R0,#+7
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  112   
//  113   switch(baud){
        LDR      R0,[SP, #+0]
        CMP      R0,#+1200
        BEQ.N    ??MACESS_configura_baud_impressora_0
        CMP      R0,#+2400
        BEQ.N    ??MACESS_configura_baud_impressora_1
        CMP      R0,#+4800
        BEQ.N    ??MACESS_configura_baud_impressora_2
        CMP      R0,#+9600
        BEQ.N    ??MACESS_configura_baud_impressora_3
        CMP      R0,#+14400
        BEQ.N    ??MACESS_configura_baud_impressora_4
        CMP      R0,#+19200
        BEQ.N    ??MACESS_configura_baud_impressora_5
        CMP      R0,#+38400
        BEQ.N    ??MACESS_configura_baud_impressora_6
        MOVW     R1,#+56000
        CMP      R0,R1
        BEQ.N    ??MACESS_configura_baud_impressora_7
        CMP      R0,#+57600
        BEQ.N    ??MACESS_configura_baud_impressora_8
        CMP      R0,#+115200
        BEQ.N    ??MACESS_configura_baud_impressora_9
        B.N      ??MACESS_configura_baud_impressora_10
//  114     case 1200:
//  115          flags[0] = 255;
??MACESS_configura_baud_impressora_0:
        MOVS     R0,#+255
        STRB     R0,[SP, #+4]
//  116          break;
        B.N      ??MACESS_configura_baud_impressora_11
//  117     case 2400:
//  118          flags[1] = 255;
??MACESS_configura_baud_impressora_1:
        MOVS     R0,#+255
        STRB     R0,[SP, #+5]
//  119          break;
        B.N      ??MACESS_configura_baud_impressora_11
//  120     case 4800:
//  121          flags[2] = 255;
??MACESS_configura_baud_impressora_2:
        MOVS     R0,#+255
        STRB     R0,[SP, #+6]
//  122          break;
        B.N      ??MACESS_configura_baud_impressora_11
//  123     case 9600:
//  124          flags[3] = 255;
??MACESS_configura_baud_impressora_3:
        MOVS     R0,#+255
        STRB     R0,[SP, #+7]
//  125          break;
        B.N      ??MACESS_configura_baud_impressora_11
//  126     case 14400:
//  127          flags[4] = 255;
??MACESS_configura_baud_impressora_4:
        MOVS     R0,#+255
        STRB     R0,[SP, #+8]
//  128          break;
        B.N      ??MACESS_configura_baud_impressora_11
//  129     case 19200:
//  130          flags[5] = 255;
??MACESS_configura_baud_impressora_5:
        MOVS     R0,#+255
        STRB     R0,[SP, #+9]
//  131          break;
        B.N      ??MACESS_configura_baud_impressora_11
//  132     case 38400:
//  133          flags[6] = 255;
??MACESS_configura_baud_impressora_6:
        MOVS     R0,#+255
        STRB     R0,[SP, #+10]
//  134          break;
        B.N      ??MACESS_configura_baud_impressora_11
//  135     case 56000:
//  136          flags[7] = 255;
??MACESS_configura_baud_impressora_7:
        MOVS     R0,#+255
        STRB     R0,[SP, #+11]
//  137          break;
        B.N      ??MACESS_configura_baud_impressora_11
//  138     case 57600:
//  139          flags[8] = 255;
??MACESS_configura_baud_impressora_8:
        MOVS     R0,#+255
        STRB     R0,[SP, #+12]
//  140          break;
        B.N      ??MACESS_configura_baud_impressora_11
//  141     case 115200:
//  142          flags[9] = 255;
??MACESS_configura_baud_impressora_9:
        MOVS     R0,#+255
        STRB     R0,[SP, #+13]
//  143          break;
        B.N      ??MACESS_configura_baud_impressora_11
//  144     default:
//  145          flags[0] = 255;
??MACESS_configura_baud_impressora_10:
        MOVS     R0,#+255
        STRB     R0,[SP, #+4]
//  146          break;         
//  147   }
//  148     
//  149   MSL_entry((char*)STRING_titulo_edita_baudrate[idioma],(char**)nomes_baud,flags,10);
??MACESS_configura_baud_impressora_11:
        MOVS     R3,#+10
        ADD      R2,SP,#+4
        ADD      R1,SP,#+56
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_7
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MSL_entry
        BL       MSL_entry
//  150   
//  151   baud = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  152   for(unsigned char i=0;i<10;i++)
        MOVS     R0,#+0
??MACESS_configura_baud_impressora_12:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+10
        BGE.N    ??MACESS_configura_baud_impressora_13
//  153     if(flags[i])
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+4
        LDRB     R1,[R0, R1]
        CMP      R1,#+0
        BEQ.N    ??MACESS_configura_baud_impressora_14
//  154       baud=bauds[i];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+16
        LDR      R1,[R1, R0, LSL #+2]
        STR      R1,[SP, #+0]
??MACESS_configura_baud_impressora_14:
        ADDS     R0,R0,#+1
        B.N      ??MACESS_configura_baud_impressora_12
//  155   
//  156   PARAMETROS_grava(ADR_BAUDRATE_IMPRESSORA,&baud);  
??MACESS_configura_baud_impressora_13:
        ADD      R1,SP,#+0
        MOVS     R0,#+7
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  157 }
        ADD      SP,SP,#+96
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  158 /***********************************************************************************
//  159 *       Descrição       :       Tela para configuração da utilização do BV20
//  160 *       Parametros      :       nenhum
//  161 *       Retorno         :       nenhum
//  162 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MACESS_configura_bv20
        THUMB
//  163 void MACESS_configura_bv20(void){
MACESS_configura_bv20:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  164   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  165   unsigned char flag;
//  166   
//  167   PARAMETROS_le(ADR_FLAG_BV20,&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  168   
//  169   flag = MEF_entry((char*)STRING_tela_edita_flag_BV20[idioma],flag,"ON ","OFF");    
        ADR.N    R3,??DataTable7  ;; "OFF"
        ADR.N    R2,??DataTable7_1  ;; "ON "
        LDRB     R1,[SP, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_8
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEF_entry
        BL       MEF_entry
        STRB     R0,[SP, #+0]
//  170   
//  171   PARAMETROS_grava(ADR_FLAG_BV20,&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  172 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock2
//  173 /***********************************************************************************
//  174 *       Descrição       :       Tela para configuração da utilização do
//  175 *                               noteiro MDB
//  176 *       Parametros      :       nenhum
//  177 *       Retorno         :       nenhum
//  178 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MACESS_configura_noteiro_mdb
        THUMB
//  179 void MACESS_configura_noteiro_mdb(void){
MACESS_configura_noteiro_mdb:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  180   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  181   unsigned char flag;
//  182   
//  183   PARAMETROS_le(ADR_FLAG_MDB_BIL,&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+4
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  184   
//  185   flag = MEF_entry((char*)STRING_titulo_edita_flag_mdb_bill[idioma],flag,"ON ","OFF");    
        ADR.N    R3,??DataTable7  ;; "OFF"
        ADR.N    R2,??DataTable7_1  ;; "ON "
        LDRB     R1,[SP, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_9
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEF_entry
        BL       MEF_entry
        STRB     R0,[SP, #+0]
//  186   
//  187   PARAMETROS_grava(ADR_FLAG_MDB_BIL,&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+4
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  188 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock3
//  189 /***********************************************************************************
//  190 *       Descrição       :       Tela para configuração da utilização do 
//  191 *                               moedeiro MDB
//  192 *       Parametros      :       nenhum
//  193 *       Retorno         :       nenhum
//  194 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MACESS_configura_moedeiro_mdb
        THUMB
//  195 void MACESS_configura_moedeiro_mdb(void){
MACESS_configura_moedeiro_mdb:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  196   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  197   unsigned char flag;
//  198   
//  199   PARAMETROS_le(ADR_FLAG_MDB_COIN,&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  200   
//  201   flag = MEF_entry((char*)STRING_titulo_edita_flag_mdb_coin[idioma],flag,"ON ","OFF");    
        ADR.N    R3,??DataTable7  ;; "OFF"
        ADR.N    R2,??DataTable7_1  ;; "ON "
        LDRB     R1,[SP, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_10
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEF_entry
        BL       MEF_entry
        STRB     R0,[SP, #+0]
//  202   
//  203   PARAMETROS_grava(ADR_FLAG_MDB_COIN,&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  204 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock4
//  205 /***********************************************************************************
//  206 *       Descrição       :       Tela para configuração da utilização do
//  207 *                               cartão de crédito MDB
//  208 *       Parametros      :       nenhum
//  209 *       Retorno         :       nenhum
//  210 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MACESS_configura_cartao_mdb
        THUMB
//  211 void MACESS_configura_cartao_mdb(void){
MACESS_configura_cartao_mdb:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  212   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  213   unsigned char flag;
//  214   
//  215   PARAMETROS_le(ADR_FLAG_MDB_CASHLESS,&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+6
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  216   
//  217   flag = MEF_entry((char*)STRING_titulo_edita_flag_mdb_cashless[idioma],flag,"ON ","OFF");    
        ADR.N    R3,??DataTable7  ;; "OFF"
        ADR.N    R2,??DataTable7_1  ;; "ON "
        LDRB     R1,[SP, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_11
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEF_entry
        BL       MEF_entry
        STRB     R0,[SP, #+0]
//  218   
//  219   PARAMETROS_grava(ADR_FLAG_MDB_CASHLESS,&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+6
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  220 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock5
//  221 /***********************************************************************************
//  222 *       Descrição       :       Definie o valor do pulso para a moeda
//  223 *       Parametros      :       nenhum
//  224 *       Retorno         :       nenhum
//  225 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MACESS_configura_pulso_moeda
        THUMB
//  226 void MACESS_configura_pulso_moeda(void){
MACESS_configura_pulso_moeda:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
//  227   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  228   unsigned int pulso;
//  229 
//  230   PARAMETROS_le(ADR_VALOR_PULSO_MOEDEIRO,(void*)&pulso);
        ADD      R1,SP,#+4
        MOVS     R0,#+8
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  231   if(pulso>9999)
        LDR      R0,[SP, #+4]
        MOVW     R1,#+10000
        CMP      R0,R1
        BCC.N    ??MACESS_configura_pulso_moeda_0
//  232     pulso = 5;
        MOVS     R0,#+5
        STR      R0,[SP, #+4]
//  233   
//  234   pulso = MEI_entry((char*)STRING_titulo_edita_pulso_moeda[idioma],"%04d",pulso,5,9999);                
??MACESS_configura_pulso_moeda_0:
        MOVW     R0,#+9999
        STR      R0,[SP, #+0]
        MOVS     R3,#+5
        LDR      R2,[SP, #+4]
        LDR.N    R1,??DataTable7_12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_13
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEI_entry
        BL       MEI_entry
        STR      R0,[SP, #+4]
//  235     
//  236   PARAMETROS_grava(ADR_VALOR_PULSO_MOEDEIRO,(void*)&pulso);
        ADD      R1,SP,#+4
        MOVS     R0,#+8
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  237 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock6
//  238 /***********************************************************************************
//  239 *       Descrição       :       Tela para configuração do valor do pulso
//  240 *                               para o noteiro 
//  241 *       Parametros      :       nenhum
//  242 *       Retorno         :       nenhum
//  243 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function MACESS_configura_pulso_noteiro
        THUMB
//  244 void MACESS_configura_pulso_noteiro(void){
MACESS_configura_pulso_noteiro:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
//  245   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  246   unsigned int pulso;
//  247 
//  248   PARAMETROS_le(ADR_VALOR_PULSO_NOTEIRO,(void*)&pulso);
        ADD      R1,SP,#+4
        MOVS     R0,#+9
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  249   if(pulso>9999)
        LDR      R0,[SP, #+4]
        MOVW     R1,#+10000
        CMP      R0,R1
        BCC.N    ??MACESS_configura_pulso_noteiro_0
//  250     pulso = 5;
        MOVS     R0,#+5
        STR      R0,[SP, #+4]
//  251   
//  252   pulso = MEI_entry((char*)STRING_titulo_edita_pulso_noteiro[idioma],"%04d",pulso,5,9999);                
??MACESS_configura_pulso_noteiro_0:
        MOVW     R0,#+9999
        STR      R0,[SP, #+0]
        MOVS     R3,#+5
        LDR      R2,[SP, #+4]
        LDR.N    R1,??DataTable7_12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_14
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEI_entry
        BL       MEI_entry
        STR      R0,[SP, #+4]
//  253     
//  254   PARAMETROS_grava(ADR_VALOR_PULSO_NOTEIRO,(void*)&pulso);
        ADD      R1,SP,#+4
        MOVS     R0,#+9
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  255 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC8      "OFF"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC8      "ON "

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     MACESS_func

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     STRING_opcoes_menu_acessorios

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     STRING_titulo_menu_acessorios

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     `?<Constant {&"1200", &"2400", &"4800", &"9600"`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     `?<Constant {1200, 2400, 4800, 9600, 14400, 192`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     STRING_titulo_edita_baudrate

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     STRING_tela_edita_flag_BV20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     STRING_titulo_edita_flag_mdb_bill

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     STRING_titulo_edita_flag_mdb_coin

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_11:
        DC32     STRING_titulo_edita_flag_mdb_cashless

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_12:
        DC32     `?<Constant "%04d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_13:
        DC32     STRING_titulo_edita_pulso_moeda

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_14:
        DC32     STRING_titulo_edita_pulso_noteiro

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  256 /***********************************************************************************
//  257 *       Fim do arquivo
//  258 ***********************************************************************************/
// 
// 220 bytes in section .rodata
// 702 bytes in section .text
// 
// 702 bytes of CODE  memory
// 220 bytes of CONST memory
//
//Errors: none
//Warnings: none
