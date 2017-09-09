///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     09/Sep/2017  16:48:16 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamento /
//                    s\supervisao_mdb_cashless.c                             /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamento /
//                    s\supervisao_mdb_cashless.c -lC                         /
//                    C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\ -lA   /
//                    C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\ -o    /
//                    C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Obj\        /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\superv /
//                    isao_mdb_cashless.s                                     /
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

        EXTERN CASHLESS_adreess
        EXTERN CASHLESS_poll_device
        EXTERN CASHLESS_reset_device
        EXTERN CASHLESS_set_and_get_setup_from_to_device
        EXTERN CASHLESS_set_min_and_max_price_in_device
        EXTERN MDBCASHLESS_enable_reader
        EXTERN MDBCASHLESS_session_complete
        EXTERN MDBCASHLESS_start_vend
        EXTERN MDBCASHLESS_vend_success
        EXTERN PAGAMENTOS_adiciona_valores
        EXTERN PARAMETROS_le
        EXTERN vTaskDelay

        PUBLIC MDBCASHLESS_funcs
        PUBLIC SMC_ciclos
        PUBLIC SMC_contador
        PUBLIC SMC_desabilitado
        PUBLIC SMC_dispositivo_bloqueado
        PUBLIC SMC_estado_atual
        PUBLIC SMC_flag_bloqueio
        PUBLIC SMC_ini
        PUBLIC SMC_inicia_transacao
        PUBLIC SMC_offline_state
        PUBLIC SMC_poll_interface
        PUBLIC SMC_setter_bloqueio
        PUBLIC SMC_setup
        PUBLIC SMC_sucesso_transacao
        PUBLIC SMC_tick
        PUBLIC SMC_time_out
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamentos\supervisao_mdb_cashless.c
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
//   44 #define TEMPO_BUSCA_OFFLINE                             30000
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

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   57 unsigned short int SMC_time_out=TEMPO_BUSCA_OFFLINE;
SMC_time_out:
        DATA
        DC16 30000

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   58 unsigned char SMC_flag_bloqueio=1;
SMC_flag_bloqueio:
        DATA
        DC8 1
//   59 
//   60 /***********************************************************************************
//   61 *       Funções locais
//   62 ***********************************************************************************/
//   63 eCASHLESS_state SMC_desabilitado(void);
//   64 eCASHLESS_state SMC_setup(void);
//   65 eCASHLESS_state SMC_offline_state(void);
//   66 eCASHLESS_state SMC_poll_interface(void);
//   67 eCASHLESS_state SMC_dispositivo_bloqueado(void);
//   68 eCASHLESS_state SMC_inicia_transacao(void);
//   69 eCASHLESS_state SMC_transacao_aprovada(void);
//   70 eCASHLESS_state SMC_sucesso_transacao(void);
//   71 
//   72 /***********************************************************************************
//   73 *       Tabela de funções
//   74 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   75 eCASHLESS_state(*const MDBCASHLESS_funcs[])(void)={
MDBCASHLESS_funcs:
        DATA
        DC32 SMC_desabilitado, SMC_setup, SMC_offline_state, SMC_poll_interface
        DC32 SMC_dispositivo_bloqueado, SMC_inicia_transacao
        DC32 SMC_transacao_aprovada, SMC_sucesso_transacao, 0H
//   76   [CASHLESS_STATE_DESABILITADO]    = SMC_desabilitado,
//   77   [CASHLESS_STATE_SETUP]           = SMC_setup,
//   78   [CASHLESS_STATE_OFFLINE]         = SMC_offline_state,
//   79   [CASHLESS_STATE_POLL]            = SMC_poll_interface,
//   80   [CASHLESS_STATE_LOCKED]          = SMC_dispositivo_bloqueado,
//   81   [CASHLESS_STATE_INIT_VEND]       = SMC_inicia_transacao,
//   82   [CASHLESS_STATE_VEND_APPROVED]   = SMC_transacao_aprovada,
//   83   [CASHLESS_STATE_VEND_SUCCESS]    = SMC_sucesso_transacao,
//   84   [CASHLESS_STATE_SESSION_COMPLET] = NULL
//   85 };
//   86   
//   87 /***********************************************************************************
//   88 *       Implementação das funções
//   89 ***********************************************************************************/
//   90 
//   91 /***********************************************************************************
//   92 *       Descrição       :       Inicialização do módulo
//   93 *       Parametros      :       nenhum
//   94 *       Retorno         :       nenhum
//   95 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SMC_ini
          CFI NoCalls
        THUMB
//   96 void SMC_ini(void){
//   97   
//   98   
//   99   
//  100 }
SMC_ini:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  101 /***********************************************************************************
//  102 *       Descrição       :       Tick da máquina de estados de supervisão
//  103 *                               do cashless MDB
//  104 *       Parametros      :       nenhum
//  105 *       Retorno         :       nenhum
//  106 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SMC_tick
        THUMB
//  107 void SMC_tick(void){
SMC_tick:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  108 
//  109   SMC_estado_atual = MDBCASHLESS_funcs[SMC_estado_atual]();        
        LDR.N    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable5_1
        LDR      R0,[R1, R0, LSL #+2]
          CFI FunCall
        BLX      R0
        LDR.N    R1,??DataTable5
        STRB     R0,[R1, #+0]
//  110 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  111 /***********************************************************************************
//  112 *       Descrição       :       Estado onde o cashless está desabilitado
//  113 *       Parametros      :       nenhum
//  114 *       Retorno         :       eCASHLESS_state
//  115 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SMC_desabilitado
        THUMB
//  116 eCASHLESS_state SMC_desabilitado(void){
SMC_desabilitado:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  117   unsigned char flag;
//  118   
//  119   PARAMETROS_le(ADR_FLAG_MDB_CASHLESS,(void*)&flag);    
        ADD      R1,SP,#+0
        MOVS     R0,#+6
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  120   if(!flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??SMC_desabilitado_0
//  121     return CASHLESS_STATE_DESABILITADO;           
        MOVS     R0,#+0
        B.N      ??SMC_desabilitado_1
//  122   
//  123   if(SMC_flag_bloqueio)
??SMC_desabilitado_0:
        LDR.N    R0,??DataTable5_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMC_desabilitado_2
//  124     return CASHLESS_STATE_LOCKED;
        MOVS     R0,#+4
        B.N      ??SMC_desabilitado_1
//  125   
//  126    
//  127   return CASHLESS_STATE_SETUP;
??SMC_desabilitado_2:
        MOVS     R0,#+1
??SMC_desabilitado_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock2
//  128 }
//  129 /***********************************************************************************
//  130 *       Descrição       :       Estado em que realiza a configuração da
//  131 *                               interface de cartão
//  132 *       Parametros      :       nenhum
//  133 *       Retorno         :       eCASHLESS_state
//  134 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SMC_setup
        THUMB
//  135 eCASHLESS_state SMC_setup(void){  
SMC_setup:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+36
          CFI CFA R13+40
//  136   unsigned char nivel_configurado;
//  137   unsigned short int pais;
//  138   unsigned char escala;
//  139   unsigned char casas_decimais;
//  140   unsigned char tempo_maximo_transacao;
//  141   unsigned char opcoes_gerais;
//  142   
//  143   CASHLESS_reset_device();
          CFI FunCall CASHLESS_reset_device
        BL       CASHLESS_reset_device
//  144   vTaskDelay(20);
        MOVS     R0,#+20
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  145   
//  146   if(CASHLESS_set_and_get_setup_from_to_device(1,2,16,ASCII,&nivel_configurado,&pais,&escala,&casas_decimais,&tempo_maximo_transacao,&opcoes_gerais)==MDB_OK){
        ADD      R0,SP,#+24
        STR      R0,[SP, #+20]
        ADD      R0,SP,#+25
        STR      R0,[SP, #+16]
        ADD      R0,SP,#+26
        STR      R0,[SP, #+12]
        ADD      R0,SP,#+27
        STR      R0,[SP, #+8]
        ADD      R0,SP,#+30
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+28
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+16
        MOVS     R1,#+2
        MOVS     R0,#+1
          CFI FunCall CASHLESS_set_and_get_setup_from_to_device
        BL       CASHLESS_set_and_get_setup_from_to_device
        CMP      R0,#+0
        BNE.N    ??SMC_setup_0
//  147     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  148     if(CASHLESS_set_min_and_max_price_in_device(1,100)==MDB_OK){
        MOVS     R1,#+100
        MOVS     R0,#+1
          CFI FunCall CASHLESS_set_min_and_max_price_in_device
        BL       CASHLESS_set_min_and_max_price_in_device
        CMP      R0,#+0
        BNE.N    ??SMC_setup_1
//  149       vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  150       if(MDBCASHLESS_enable_reader(1)==MDB_OK){
        MOVS     R0,#+1
          CFI FunCall MDBCASHLESS_enable_reader
        BL       MDBCASHLESS_enable_reader
        CMP      R0,#+0
        BNE.N    ??SMC_setup_1
//  151         vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  152         SMC_time_out=TEMPO_BUSCA_OFFLINE;     
        LDR.N    R0,??DataTable5_3
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
//  153         return CASHLESS_STATE_POLL;           
        MOVS     R0,#+3
        B.N      ??SMC_setup_2
//  154       }
//  155     }
//  156   }
//  157   else
//  158     if(!SMC_time_out)
??SMC_setup_0:
        LDR.N    R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMC_setup_1
//  159       return CASHLESS_STATE_OFFLINE;    
        MOVS     R0,#+2
        B.N      ??SMC_setup_2
//  160   
//  161   return CASHLESS_STATE_SETUP;  
??SMC_setup_1:
        MOVS     R0,#+1
??SMC_setup_2:
        ADD      SP,SP,#+36
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock3
//  162 }
//  163 /***********************************************************************************
//  164 *       Descrição       :       Estado em que a interface está offline
//  165 *       Parametros      :       nenhum
//  166 *       Retorno         :       eCASHLESS_state
//  167 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SMC_offline_state
        THUMB
//  168 eCASHLESS_state SMC_offline_state(void){
SMC_offline_state:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  169 
//  170   if(CASHLESS_adreess()==MDB_OK)
          CFI FunCall CASHLESS_adreess
        BL       CASHLESS_adreess
        CMP      R0,#+0
        BNE.N    ??SMC_offline_state_0
//  171     return CASHLESS_STATE_DESABILITADO;
        MOVS     R0,#+0
        B.N      ??SMC_offline_state_1
//  172      
//  173   return CASHLESS_STATE_OFFLINE;
??SMC_offline_state_0:
        MOVS     R0,#+2
??SMC_offline_state_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
//  174 }
//  175 /***********************************************************************************
//  176 *       Descrição       :       Estado em que é realizado o poll do
//  177 *                               dispositivo
//  178 *       Parametros      :       nenhum
//  179 *       Retorno         :       eCASHLESS_state
//  180 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SMC_poll_interface
        THUMB
//  181 eCASHLESS_state SMC_poll_interface(void){
SMC_poll_interface:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  182   eMDB_POLL_HEADER header;
//  183   unsigned char args[4];
//  184   eCASHLESS_VEND_RESULT resultado;
//  185   unsigned short int pago;
//  186   
//  187   if(CASHLESS_poll_device(&header,args)==MDB_OK){
        ADD      R1,SP,#+12
        ADD      R0,SP,#+0
          CFI FunCall CASHLESS_poll_device
        BL       CASHLESS_poll_device
        CMP      R0,#+0
        BNE.N    ??SMC_poll_interface_0
//  188     
//  189     switch(header){
        LDRB     R0,[SP, #+0]
        CMP      R0,#+2
        BEQ.N    ??SMC_poll_interface_1
        BCC.N    ??SMC_poll_interface_2
        CMP      R0,#+4
        BEQ.N    ??SMC_poll_interface_3
        BCC.N    ??SMC_poll_interface_4
        CMP      R0,#+6
        BEQ.N    ??SMC_poll_interface_5
        BCC.N    ??SMC_poll_interface_6
        CMP      R0,#+8
        BEQ.N    ??SMC_poll_interface_7
        BCC.N    ??SMC_poll_interface_8
        B.N      ??SMC_poll_interface_2
//  190       case CASHLESS_POOL_DISPLAY_REQUEST:
//  191            break;
??SMC_poll_interface_1:
        B.N      ??SMC_poll_interface_2
//  192       case CASHLESS_POOL_BEGIN_SESSION:
//  193            {
//  194              unsigned int valorPipoca;
//  195              PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
??SMC_poll_interface_4:
        ADD      R1,SP,#+8
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  196              if(MDBCASHLESS_start_vend(&resultado,&pago,valorPipoca,1)==MDB_OK){
        MOVS     R3,#+1
        LDR      R2,[SP, #+8]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADD      R1,SP,#+2
        ADD      R0,SP,#+1
          CFI FunCall MDBCASHLESS_start_vend
        BL       MDBCASHLESS_start_vend
//  197                       
//  198              }
//  199            }
//  200            break;
        B.N      ??SMC_poll_interface_2
//  201       case CASHLESS_POOL_SESSION_CANCEL_REQUEST:
//  202             MDBCASHLESS_session_complete();
??SMC_poll_interface_3:
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  203            break;
        B.N      ??SMC_poll_interface_2
//  204       case CASHLESS_POOL_VEND_APPROVED: 
//  205            if(MDBCASHLESS_vend_success(1)==MDB_OK){
??SMC_poll_interface_6:
        MOVS     R0,#+1
          CFI FunCall MDBCASHLESS_vend_success
        BL       MDBCASHLESS_vend_success
        CMP      R0,#+0
        BNE.N    ??SMC_poll_interface_9
//  206              unsigned int valorPipoca;
//  207              PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  208              PAGAMENTOS_adiciona_valores(valorPipoca);                            
        LDR      R0,[SP, #+4]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_adiciona_valores
        BL       PAGAMENTOS_adiciona_valores
//  209              if(MDBCASHLESS_session_complete()==MDB_OK){
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  210              }
//  211            }
//  212            break;
??SMC_poll_interface_9:
        B.N      ??SMC_poll_interface_2
//  213       case CASHLESS_POOL_VEND_DENIED:
//  214            MDBCASHLESS_session_complete();
??SMC_poll_interface_5:
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  215            break;
        B.N      ??SMC_poll_interface_2
//  216       case CASHLESS_POOL_END_SESSION:
//  217            MDBCASHLESS_session_complete();
??SMC_poll_interface_8:
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  218            break;
        B.N      ??SMC_poll_interface_2
//  219       case CASHLESS_POOL_CANCELLED:
//  220            MDBCASHLESS_session_complete();
??SMC_poll_interface_7:
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  221            break;
//  222     }
//  223     
//  224     SMC_time_out=TEMPO_BUSCA_OFFLINE;    
??SMC_poll_interface_2:
        LDR.N    R0,??DataTable5_3
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
//  225   }
//  226   
//  227   return  CASHLESS_STATE_POLL;
??SMC_poll_interface_0:
        MOVS     R0,#+3
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock5
//  228 }
//  229 /***********************************************************************************
//  230 *       Descrição       :       Estado no qual o dispositivo está bloqueado
//  231 *       Parametros      :       nenhum
//  232 *       Retorno         :       eCASHLESS_state
//  233 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SMC_dispositivo_bloqueado
        THUMB
//  234 eCASHLESS_state SMC_dispositivo_bloqueado(void){
SMC_dispositivo_bloqueado:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  235 
//  236   if(!SMC_flag_bloqueio)
        LDR.N    R0,??DataTable5_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMC_dispositivo_bloqueado_0
//  237     return CASHLESS_STATE_DESABILITADO;
        MOVS     R0,#+0
        B.N      ??SMC_dispositivo_bloqueado_1
//  238   
//  239   if(MDBCASHLESS_enable_reader(0)==MDB_OK){
??SMC_dispositivo_bloqueado_0:
        MOVS     R0,#+0
          CFI FunCall MDBCASHLESS_enable_reader
        BL       MDBCASHLESS_enable_reader
        CMP      R0,#+0
        BNE.N    ??SMC_dispositivo_bloqueado_2
//  240     SMC_time_out=TEMPO_BUSCA_OFFLINE;     
        LDR.N    R0,??DataTable5_3
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
//  241     return CASHLESS_STATE_LOCKED;  
        MOVS     R0,#+4
        B.N      ??SMC_dispositivo_bloqueado_1
//  242   }
//  243   else
//  244     if(!SMC_time_out)
??SMC_dispositivo_bloqueado_2:
        LDR.N    R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMC_dispositivo_bloqueado_3
//  245       return CASHLESS_STATE_OFFLINE;
        MOVS     R0,#+2
        B.N      ??SMC_dispositivo_bloqueado_1
//  246         
//  247   return  CASHLESS_STATE_LOCKED;
??SMC_dispositivo_bloqueado_3:
        MOVS     R0,#+4
??SMC_dispositivo_bloqueado_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock6
//  248 }
//  249 /***********************************************************************************
//  250 *       Descrição       :       Estado em que é iniciada a transação
//  251 *                               de venda
//  252 *       Parametros      :       nenhum
//  253 *       Retorno         :       eCASHLESS_state
//  254 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SMC_inicia_transacao
          CFI NoCalls
        THUMB
//  255 eCASHLESS_state SMC_inicia_transacao(void){
//  256 
//  257   
//  258   return CASHLESS_STATE_INIT_VEND;
SMC_inicia_transacao:
        MOVS     R0,#+5
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  259 }
//  260 /***********************************************************************************
//  261 *       Descrição       :       Estado no qual a venda foi aprovada
//  262 *       Parametros      :       nenhum
//  263 *       Retorno         :       eCASHLESS_state
//  264 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function SMC_transacao_aprovada
          CFI NoCalls
        THUMB
//  265 eCASHLESS_state SMC_transacao_aprovada(void){
//  266 
//  267    
//  268   return CASHLESS_STATE_VEND_APPROVED;
SMC_transacao_aprovada:
        MOVS     R0,#+6
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  269 }
//  270 /***********************************************************************************
//  271 *       Descrição       :       Estado no qual recebeu a configuração
//  272 *                               do crédit
//  273 *       Parametros      :       nenhum
//  274 *       Retorno         :       eCASHLESS_state 
//  275 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function SMC_sucesso_transacao
          CFI NoCalls
        THUMB
//  276 eCASHLESS_state SMC_sucesso_transacao(void){
//  277   
//  278   
//  279   return CASHLESS_STATE_VEND_SUCCESS;
SMC_sucesso_transacao:
        MOVS     R0,#+7
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  280 }
//  281 /***********************************************************************************
//  282 *       Descrição       :       Estado no qual a transação foi completada
//  283 *       Parametros      :       nenhum
//  284 *       Retorno         :       eCASHLESS_state
//  285 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function SMC_transacao_completada
          CFI NoCalls
        THUMB
//  286 eCASHLESS_state SMC_transacao_completada(void){
//  287   
//  288   
//  289   return CASHLESS_STATE_SESSION_COMPLET;
SMC_transacao_completada:
        MOVS     R0,#+8
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  290 }
//  291 /***********************************************************************************
//  292 *       Descrição       :       Setter para o flag de bloqueio do cashless
//  293 *                               device
//  294 *       Parametros      :       (unsigned char) flag
//  295 *       Retorno         :       nenhum
//  296 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function SMC_setter_bloqueio
          CFI NoCalls
        THUMB
//  297 void SMC_setter_bloqueio(unsigned char flag){
//  298   
//  299   SMC_flag_bloqueio = flag;
SMC_setter_bloqueio:
        LDR.N    R1,??DataTable5_2
        STRB     R0,[R1, #+0]
//  300 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     SMC_estado_atual

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     MDBCASHLESS_funcs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     SMC_flag_bloqueio

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     SMC_time_out

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  301 /***********************************************************************************
//  302 *       Fim do arquivo
//  303 ***********************************************************************************/
// 
//   6 bytes in section .bss
//   3 bytes in section .data
//  36 bytes in section .rodata
// 444 bytes in section .text
// 
// 444 bytes of CODE  memory
//  36 bytes of CONST memory
//   9 bytes of DATA  memory
//
//Errors: none
//Warnings: none
