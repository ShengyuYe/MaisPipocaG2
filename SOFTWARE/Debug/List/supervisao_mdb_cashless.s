///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     17/Jul/2017  16:20:03 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Pagamentos\supervisao_mdb_cashl /
//                    ess.c                                                   /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Pagamentos\supervisao_mdb_cashl /
//                    ess.c -lC C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardw /
//                    are\MaisPipocaG2\SOFTWARE\Debug\List\ -lA               /
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
//                    pocaG2\SOFTWARE\Debug\List\supervisao_mdb_cashless.s    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME supervisao_mdb_cashless

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN PARAMETROS_le

        PUBLIC MDBCASHLESS_funcs
        PUBLIC SMC_ciclos
        PUBLIC SMC_contador
        PUBLIC SMC_desabilitado
        PUBLIC SMC_dispositivo_bloqueado
        PUBLIC SMC_estado_atual
        PUBLIC SMC_ini
        PUBLIC SMC_inicia_transacao
        PUBLIC SMC_offline_state
        PUBLIC SMC_poll_interface
        PUBLIC SMC_setup
        PUBLIC SMC_sucesso_transacao
        PUBLIC SMC_tick
        PUBLIC SMC_transacao_aprovada
        PUBLIC SMC_transacao_completada
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\Pagamentos\supervisao_mdb_cashless.c
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
//   17 |       Arquivo            :  supervisao_mdb_cashless.c
//   18 |       Descrição          :  Máquina de estados que gerencia o meio de pagamento
//   19 |                             MDB BILL
//   20 | 
//   21 |       Autor              :  Marcos Aquino
//   22 |       Data criação       :  13/06/2017
//   23 |
//   24 |       Revisões           :  1.0.0.0
//   25 |
//   26 |
//   27 | __________________________________________________________________________________
//   28 */
//   29 
//   30 /***********************************************************************************
//   31 *       Includes
//   32 ***********************************************************************************/
//   33 #include <stdio.h>
//   34 #include <stdlib.h>
//   35 #include <string.h>
//   36 #include "..\..\includes.h"
//   37 #include "supervisao_mdb_cashless.h"
//   38 
//   39 /***********************************************************************************
//   40 *       Definições
//   41 ***********************************************************************************/
//   42 #define TEMPO_INICILIZACAO_CASHLESS                     60000
//   43 #define TENTATIVAS_CASHLESS                             10
//   44 #define TEMPO_BUSCA_OFFLINE                             1000
//   45 
//   46 /***********************************************************************************
//   47 *       Constantes locais
//   48 ***********************************************************************************/
//   49 
//   50 
//   51 /***********************************************************************************
//   52 *       Variaveis locais
//   53 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   54 unsigned int SMC_contador;
SMC_contador:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   55 unsigned char SMC_ciclos;
SMC_ciclos:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   56 eCASHLESS_state SMC_estado_atual = CASHLESS_STATE_DESABILITADO;
SMC_estado_atual:
        DS8 1
//   57 
//   58 /***********************************************************************************
//   59 *       Funções locais
//   60 ***********************************************************************************/
//   61 eCASHLESS_state SMC_desabilitado(void);
//   62 eCASHLESS_state SMC_setup(void);
//   63 eCASHLESS_state SMC_offline_state(void);
//   64 eCASHLESS_state SMC_poll_interface(void);
//   65 eCASHLESS_state SMC_dispositivo_bloqueado(void);
//   66 eCASHLESS_state SMC_inicia_transacao(void);
//   67 eCASHLESS_state SMC_transacao_aprovada(void);
//   68 eCASHLESS_state SMC_sucesso_transacao(void);
//   69 
//   70 /***********************************************************************************
//   71 *       Tabela de funções
//   72 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   73 eCASHLESS_state(*const MDBCASHLESS_funcs[])(void)={
MDBCASHLESS_funcs:
        DATA
        DC32 0H, 0H, 0H, 0H, 0H, 0H, 0H, 0H, 0H
//   74   [CASHLESS_STATE_DESABILITADO]    = NULL,
//   75   [CASHLESS_STATE_SETUP]           = NULL,
//   76   [CASHLESS_STATE_OFFLINE]         = NULL,
//   77   [CASHLESS_STATE_POLL]            = NULL,
//   78   [CASHLESS_STATE_LOCKED]          = NULL,
//   79   [CASHLESS_STATE_INIT_VEND]       = NULL,
//   80   [CASHLESS_STATE_VEND_APPROVED]   = NULL,
//   81   [CASHLESS_STATE_VEND_SUCCESS]    = NULL,
//   82   [CASHLESS_STATE_SESSION_COMPLET] = NULL
//   83 };
//   84   
//   85 /***********************************************************************************
//   86 *       Implementação das funções
//   87 ***********************************************************************************/
//   88 
//   89 /***********************************************************************************
//   90 *       Descrição       :       Inicialização do módulo
//   91 *       Parametros      :       nenhum
//   92 *       Retorno         :       nenhum
//   93 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SMC_ini
          CFI NoCalls
        THUMB
//   94 void SMC_ini(void){
//   95   
//   96   
//   97   
//   98 }
SMC_ini:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   99 /***********************************************************************************
//  100 *       Descrição       :       Tick da máquina de estados de supervisão
//  101 *                               do cashless MDB
//  102 *       Parametros      :       nenhum
//  103 *       Retorno         :       nenhum
//  104 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SMC_tick
        THUMB
//  105 void SMC_tick(void){
SMC_tick:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  106 
//  107   SMC_estado_atual = MDBCASHLESS_funcs[SMC_estado_atual]();        
        LDR.N    R0,??DataTable0
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable0_1
        LDR      R0,[R1, R0, LSL #+2]
          CFI FunCall
        BLX      R0
        LDR.N    R1,??DataTable0
        STRB     R0,[R1, #+0]
//  108 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     SMC_estado_atual

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     MDBCASHLESS_funcs
//  109 /***********************************************************************************
//  110 *       Descrição       :       Estado onde o cashless está desabilitado
//  111 *       Parametros      :       nenhum
//  112 *       Retorno         :       eCASHLESS_state
//  113 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SMC_desabilitado
        THUMB
//  114 eCASHLESS_state SMC_desabilitado(void){
SMC_desabilitado:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  115   unsigned char flag;
//  116   
//  117   PARAMETROS_le(ADR_FLAG_MDB_CASHLESS,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+6
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  118   if(flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMC_desabilitado_0
//  119     return CASHLESS_STATE_SETUP;      
        MOVS     R0,#+1
        B.N      ??SMC_desabilitado_1
//  120   
//  121   return CASHLESS_STATE_DESABILITADO;
??SMC_desabilitado_0:
        MOVS     R0,#+0
??SMC_desabilitado_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock2
//  122 }
//  123 /***********************************************************************************
//  124 *       Descrição       :       Estado em que realiza a configuração da
//  125 *                               interface de cartão
//  126 *       Parametros      :       nenhum
//  127 *       Retorno         :       eCASHLESS_state
//  128 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SMC_setup
          CFI NoCalls
        THUMB
//  129 eCASHLESS_state SMC_setup(void){
//  130   /*
//  131   unsigned char nivel_configurado;
//  132   unsigned short int pais;
//  133   unsigned char escala;
//  134   unsigned char casas_decimais;
//  135   unsigned char tempo_maximo_transacao;
//  136   unsigned char opcoes_gerais;
//  137   
//  138   if(CASHLESS_set_and_get_setup_from_to_device(1,2,16,
//  139                                                ASCII,
//  140                                                &nivel_configurado,
//  141                                                &pais,
//  142                                                &escala,
//  143   */
//  144                                                
//  145   /*
//  146 eMDB_reply CASHLESS_set_and_get_setup_from_to_device(unsigned char nivel_mdb,
//  147                                                      unsigned char linhas_lcd,
//  148                                                      unsigned char colunas_lcd,
//  149                                                      eMDB_DISPLAY_INFO info_lcd,                                                     
//  150                                                      unsigned char *nivel_configurado,
//  151                                                      unsigned short int*pais,
//  152                                                      unsigned char *escala,
//  153                                                      unsigned char *casas_decimais,
//  154                                                      unsigned char *tempo_maximo_transacao,
//  155                                                      unsigned char *opcoes_gerais)  
//  156   */
//  157   return CASHLESS_STATE_SETUP;  
SMC_setup:
        MOVS     R0,#+1
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  158 }
//  159 /***********************************************************************************
//  160 *       Descrição       :       Estado em que a interface está offline
//  161 *       Parametros      :       nenhum
//  162 *       Retorno         :       eCASHLESS_state
//  163 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SMC_offline_state
          CFI NoCalls
        THUMB
//  164 eCASHLESS_state SMC_offline_state(void){
//  165 
//  166   
//  167   return CASHLESS_STATE_OFFLINE;
SMC_offline_state:
        MOVS     R0,#+2
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  168 }
//  169 /***********************************************************************************
//  170 *       Descrição       :       Estado em que é realizado o poll do
//  171 *                               dispositivo
//  172 *       Parametros      :       nenhum
//  173 *       Retorno         :       eCASHLESS_state
//  174 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SMC_poll_interface
          CFI NoCalls
        THUMB
//  175 eCASHLESS_state SMC_poll_interface(void){
//  176 
//  177   
//  178   return  CASHLESS_STATE_POLL;
SMC_poll_interface:
        MOVS     R0,#+3
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  179 }
//  180 /***********************************************************************************
//  181 *       Descrição       :       Estado no qual o dispositivo está bloqueado
//  182 *       Parametros      :       nenhum
//  183 *       Retorno         :       eCASHLESS_state
//  184 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SMC_dispositivo_bloqueado
          CFI NoCalls
        THUMB
//  185 eCASHLESS_state SMC_dispositivo_bloqueado(void){
//  186 
//  187   
//  188   return  CASHLESS_STATE_LOCKED;
SMC_dispositivo_bloqueado:
        MOVS     R0,#+4
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  189 }
//  190 /***********************************************************************************
//  191 *       Descrição       :       Estado em que é iniciada a transação
//  192 *                               de venda
//  193 *       Parametros      :       nenhum
//  194 *       Retorno         :       eCASHLESS_state
//  195 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SMC_inicia_transacao
          CFI NoCalls
        THUMB
//  196 eCASHLESS_state SMC_inicia_transacao(void){
//  197 
//  198   
//  199   return CASHLESS_STATE_INIT_VEND;
SMC_inicia_transacao:
        MOVS     R0,#+5
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  200 }
//  201 /***********************************************************************************
//  202 *       Descrição       :       Estado no qual a venda foi aprovada
//  203 *       Parametros      :       nenhum
//  204 *       Retorno         :       eCASHLESS_state
//  205 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function SMC_transacao_aprovada
          CFI NoCalls
        THUMB
//  206 eCASHLESS_state SMC_transacao_aprovada(void){
//  207 
//  208   
//  209   return CASHLESS_STATE_VEND_APPROVED;
SMC_transacao_aprovada:
        MOVS     R0,#+6
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  210 }
//  211 /***********************************************************************************
//  212 *       Descrição       :       Estado no qual recebeu a configuração
//  213 *                               do crédito
//  214 *       Parametros      :       nenhum
//  215 *       Retorno         :       eCASHLESS_state 
//  216 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function SMC_sucesso_transacao
          CFI NoCalls
        THUMB
//  217 eCASHLESS_state SMC_sucesso_transacao(void){
//  218   
//  219   
//  220   return CASHLESS_STATE_VEND_SUCCESS;
SMC_sucesso_transacao:
        MOVS     R0,#+7
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  221 }
//  222 /***********************************************************************************
//  223 *       Descrição       :       Estado no qual a transação foi completada
//  224 *       Parametros      :       nenhum
//  225 *       Retorno         :       eCASHLESS_state
//  226 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function SMC_transacao_completada
          CFI NoCalls
        THUMB
//  227 eCASHLESS_state SMC_transacao_completada(void){
//  228   
//  229   
//  230   return CASHLESS_STATE_SESSION_COMPLET;
SMC_transacao_completada:
        MOVS     R0,#+8
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  231 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  232 /***********************************************************************************
//  233 *       Fim do arquivo
//  234 ***********************************************************************************/
// 
//  6 bytes in section .bss
// 36 bytes in section .rodata
// 88 bytes in section .text
// 
// 88 bytes of CODE  memory
// 36 bytes of CONST memory
//  6 bytes of DATA  memory
//
//Errors: none
//Warnings: none
