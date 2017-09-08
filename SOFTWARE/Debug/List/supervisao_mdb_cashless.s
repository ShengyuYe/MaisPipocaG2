///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     08/Sep/2017  15:30:11 /
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
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -Ol                 /
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
//  120   if(SMC_flag_bloqueio)
        LDR.N    R0,??DataTable5_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMC_desabilitado_0
//  121     return CASHLESS_STATE_LOCKED;
        MOVS     R0,#+4
        B.N      ??SMC_desabilitado_1
//  122   
//  123   if(flag)
??SMC_desabilitado_0:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMC_desabilitado_2
//  124     return CASHLESS_STATE_SETUP;      
        MOVS     R0,#+1
        B.N      ??SMC_desabilitado_1
//  125   
//  126   return CASHLESS_STATE_DESABILITADO;
??SMC_desabilitado_2:
        MOVS     R0,#+0
??SMC_desabilitado_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock2
//  127 }
//  128 /***********************************************************************************
//  129 *       Descrição       :       Estado em que realiza a configuração da
//  130 *                               interface de cartão
//  131 *       Parametros      :       nenhum
//  132 *       Retorno         :       eCASHLESS_state
//  133 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SMC_setup
        THUMB
//  134 eCASHLESS_state SMC_setup(void){  
SMC_setup:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+36
          CFI CFA R13+40
//  135   unsigned char nivel_configurado;
//  136   unsigned short int pais;
//  137   unsigned char escala;
//  138   unsigned char casas_decimais;
//  139   unsigned char tempo_maximo_transacao;
//  140   unsigned char opcoes_gerais;
//  141   
//  142   CASHLESS_reset_device();
          CFI FunCall CASHLESS_reset_device
        BL       CASHLESS_reset_device
//  143   vTaskDelay(20);
        MOVS     R0,#+20
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  144   
//  145   if(CASHLESS_set_and_get_setup_from_to_device(1,2,16,ASCII,&nivel_configurado,&pais,&escala,&casas_decimais,&tempo_maximo_transacao,&opcoes_gerais)==MDB_OK){
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
//  146     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  147     if(CASHLESS_set_min_and_max_price_in_device(1,100)==MDB_OK){
        MOVS     R1,#+100
        MOVS     R0,#+1
          CFI FunCall CASHLESS_set_min_and_max_price_in_device
        BL       CASHLESS_set_min_and_max_price_in_device
        CMP      R0,#+0
        BNE.N    ??SMC_setup_1
//  148       vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  149       if(MDBCASHLESS_enable_reader(1)==MDB_OK){
        MOVS     R0,#+1
          CFI FunCall MDBCASHLESS_enable_reader
        BL       MDBCASHLESS_enable_reader
        CMP      R0,#+0
        BNE.N    ??SMC_setup_1
//  150         vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  151         SMC_time_out=TEMPO_BUSCA_OFFLINE;     
        LDR.N    R0,??DataTable5_3
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
//  152         return CASHLESS_STATE_POLL;           
        MOVS     R0,#+3
        B.N      ??SMC_setup_2
//  153       }
//  154     }
//  155   }
//  156   else
//  157     if(!SMC_time_out)
??SMC_setup_0:
        LDR.N    R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMC_setup_1
//  158       return CASHLESS_STATE_OFFLINE;    
        MOVS     R0,#+2
        B.N      ??SMC_setup_2
//  159   
//  160   return CASHLESS_STATE_SETUP;  
??SMC_setup_1:
        MOVS     R0,#+1
??SMC_setup_2:
        ADD      SP,SP,#+36
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock3
//  161 }
//  162 /***********************************************************************************
//  163 *       Descrição       :       Estado em que a interface está offline
//  164 *       Parametros      :       nenhum
//  165 *       Retorno         :       eCASHLESS_state
//  166 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SMC_offline_state
        THUMB
//  167 eCASHLESS_state SMC_offline_state(void){
SMC_offline_state:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  168 
//  169   if(CASHLESS_adreess()==MDB_OK)
          CFI FunCall CASHLESS_adreess
        BL       CASHLESS_adreess
        CMP      R0,#+0
        BNE.N    ??SMC_offline_state_0
//  170     return CASHLESS_STATE_DESABILITADO;
        MOVS     R0,#+0
        B.N      ??SMC_offline_state_1
//  171      
//  172   return CASHLESS_STATE_OFFLINE;
??SMC_offline_state_0:
        MOVS     R0,#+2
??SMC_offline_state_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
//  173 }
//  174 /***********************************************************************************
//  175 *       Descrição       :       Estado em que é realizado o poll do
//  176 *                               dispositivo
//  177 *       Parametros      :       nenhum
//  178 *       Retorno         :       eCASHLESS_state
//  179 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SMC_poll_interface
        THUMB
//  180 eCASHLESS_state SMC_poll_interface(void){
SMC_poll_interface:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  181   eMDB_POLL_HEADER header;
//  182   unsigned char args[4];
//  183   eCASHLESS_VEND_RESULT resultado;
//  184   unsigned short int pago;
//  185   
//  186   if(CASHLESS_poll_device(&header,args)==MDB_OK){
        ADD      R1,SP,#+12
        ADD      R0,SP,#+0
          CFI FunCall CASHLESS_poll_device
        BL       CASHLESS_poll_device
        CMP      R0,#+0
        BNE.N    ??SMC_poll_interface_0
//  187     
//  188     switch(header){
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
//  189       case CASHLESS_POOL_DISPLAY_REQUEST:
//  190            break;
??SMC_poll_interface_1:
        B.N      ??SMC_poll_interface_2
//  191       case CASHLESS_POOL_BEGIN_SESSION:
//  192            {
//  193              unsigned int valorPipoca;
//  194              PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
??SMC_poll_interface_4:
        ADD      R1,SP,#+8
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  195              if(MDBCASHLESS_start_vend(&resultado,&pago,valorPipoca,1)==MDB_OK){
        MOVS     R3,#+1
        LDR      R2,[SP, #+8]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADD      R1,SP,#+2
        ADD      R0,SP,#+1
          CFI FunCall MDBCASHLESS_start_vend
        BL       MDBCASHLESS_start_vend
//  196                       
//  197              }
//  198            }
//  199            break;
        B.N      ??SMC_poll_interface_2
//  200       case CASHLESS_POOL_SESSION_CANCEL_REQUEST:
//  201             MDBCASHLESS_session_complete();
??SMC_poll_interface_3:
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  202            break;
        B.N      ??SMC_poll_interface_2
//  203       case CASHLESS_POOL_VEND_APPROVED: 
//  204            if(MDBCASHLESS_vend_success(1)==MDB_OK){
??SMC_poll_interface_6:
        MOVS     R0,#+1
          CFI FunCall MDBCASHLESS_vend_success
        BL       MDBCASHLESS_vend_success
        CMP      R0,#+0
        BNE.N    ??SMC_poll_interface_9
//  205              unsigned int valorPipoca;
//  206              PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  207              PAGAMENTOS_adiciona_valores(valorPipoca);                            
        LDR      R0,[SP, #+4]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_adiciona_valores
        BL       PAGAMENTOS_adiciona_valores
//  208              if(MDBCASHLESS_session_complete()==MDB_OK){
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  209              }
//  210            }
//  211            break;
??SMC_poll_interface_9:
        B.N      ??SMC_poll_interface_2
//  212       case CASHLESS_POOL_VEND_DENIED:
//  213            MDBCASHLESS_session_complete();
??SMC_poll_interface_5:
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  214            break;
        B.N      ??SMC_poll_interface_2
//  215       case CASHLESS_POOL_END_SESSION:
//  216            MDBCASHLESS_session_complete();
??SMC_poll_interface_8:
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  217            break;
        B.N      ??SMC_poll_interface_2
//  218       case CASHLESS_POOL_CANCELLED:
//  219            MDBCASHLESS_session_complete();
??SMC_poll_interface_7:
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  220            break;
//  221     }
//  222     
//  223     SMC_time_out=TEMPO_BUSCA_OFFLINE;    
??SMC_poll_interface_2:
        LDR.N    R0,??DataTable5_3
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
//  224   }
//  225   
//  226   return  CASHLESS_STATE_POLL;
??SMC_poll_interface_0:
        MOVS     R0,#+3
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock5
//  227 }
//  228 /***********************************************************************************
//  229 *       Descrição       :       Estado no qual o dispositivo está bloqueado
//  230 *       Parametros      :       nenhum
//  231 *       Retorno         :       eCASHLESS_state
//  232 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SMC_dispositivo_bloqueado
        THUMB
//  233 eCASHLESS_state SMC_dispositivo_bloqueado(void){
SMC_dispositivo_bloqueado:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  234 
//  235   if(!SMC_flag_bloqueio)
        LDR.N    R0,??DataTable5_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMC_dispositivo_bloqueado_0
//  236     return CASHLESS_STATE_DESABILITADO;
        MOVS     R0,#+0
        B.N      ??SMC_dispositivo_bloqueado_1
//  237   
//  238   if(MDBCASHLESS_enable_reader(0)==MDB_OK){
??SMC_dispositivo_bloqueado_0:
        MOVS     R0,#+0
          CFI FunCall MDBCASHLESS_enable_reader
        BL       MDBCASHLESS_enable_reader
        CMP      R0,#+0
        BNE.N    ??SMC_dispositivo_bloqueado_2
//  239     SMC_time_out=TEMPO_BUSCA_OFFLINE;     
        LDR.N    R0,??DataTable5_3
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
//  240     return CASHLESS_STATE_LOCKED;  
        MOVS     R0,#+4
        B.N      ??SMC_dispositivo_bloqueado_1
//  241   }
//  242   else
//  243     if(!SMC_time_out)
??SMC_dispositivo_bloqueado_2:
        LDR.N    R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMC_dispositivo_bloqueado_3
//  244       return CASHLESS_STATE_OFFLINE;
        MOVS     R0,#+2
        B.N      ??SMC_dispositivo_bloqueado_1
//  245         
//  246   return  CASHLESS_STATE_LOCKED;
??SMC_dispositivo_bloqueado_3:
        MOVS     R0,#+4
??SMC_dispositivo_bloqueado_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock6
//  247 }
//  248 /***********************************************************************************
//  249 *       Descrição       :       Estado em que é iniciada a transação
//  250 *                               de venda
//  251 *       Parametros      :       nenhum
//  252 *       Retorno         :       eCASHLESS_state
//  253 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SMC_inicia_transacao
          CFI NoCalls
        THUMB
//  254 eCASHLESS_state SMC_inicia_transacao(void){
//  255 
//  256   
//  257   return CASHLESS_STATE_INIT_VEND;
SMC_inicia_transacao:
        MOVS     R0,#+5
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  258 }
//  259 /***********************************************************************************
//  260 *       Descrição       :       Estado no qual a venda foi aprovada
//  261 *       Parametros      :       nenhum
//  262 *       Retorno         :       eCASHLESS_state
//  263 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function SMC_transacao_aprovada
          CFI NoCalls
        THUMB
//  264 eCASHLESS_state SMC_transacao_aprovada(void){
//  265 
//  266    
//  267   return CASHLESS_STATE_VEND_APPROVED;
SMC_transacao_aprovada:
        MOVS     R0,#+6
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  268 }
//  269 /***********************************************************************************
//  270 *       Descrição       :       Estado no qual recebeu a configuração
//  271 *                               do crédit
//  272 *       Parametros      :       nenhum
//  273 *       Retorno         :       eCASHLESS_state 
//  274 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function SMC_sucesso_transacao
          CFI NoCalls
        THUMB
//  275 eCASHLESS_state SMC_sucesso_transacao(void){
//  276   
//  277   
//  278   return CASHLESS_STATE_VEND_SUCCESS;
SMC_sucesso_transacao:
        MOVS     R0,#+7
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  279 }
//  280 /***********************************************************************************
//  281 *       Descrição       :       Estado no qual a transação foi completada
//  282 *       Parametros      :       nenhum
//  283 *       Retorno         :       eCASHLESS_state
//  284 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function SMC_transacao_completada
          CFI NoCalls
        THUMB
//  285 eCASHLESS_state SMC_transacao_completada(void){
//  286   
//  287   
//  288   return CASHLESS_STATE_SESSION_COMPLET;
SMC_transacao_completada:
        MOVS     R0,#+8
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  289 }
//  290 /***********************************************************************************
//  291 *       Descrição       :       Setter para o flag de bloqueio do cashless
//  292 *                               device
//  293 *       Parametros      :       (unsigned char) flag
//  294 *       Retorno         :       nenhum
//  295 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function SMC_setter_bloqueio
          CFI NoCalls
        THUMB
//  296 void SMC_setter_bloqueio(unsigned char flag){
//  297   
//  298   SMC_flag_bloqueio = flag;
SMC_setter_bloqueio:
        LDR.N    R1,??DataTable5_2
        STRB     R0,[R1, #+0]
//  299 }
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
//  300 /***********************************************************************************
//  301 *       Fim do arquivo
//  302 ***********************************************************************************/
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
