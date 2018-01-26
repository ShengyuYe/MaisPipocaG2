///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     26/Jan/2018  13:45:22 /
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
        PUBLIC SMC_contador_atividade_cartao
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
//   45 #define CICLOS_ATIVIDADE_CARTAO                         3
//   46 
//   47 /***********************************************************************************
//   48 *       Constantes locais
//   49 ***********************************************************************************/
//   50 
//   51 
//   52 /***********************************************************************************
//   53 *       Variaveis locais
//   54 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   55 unsigned int SMC_contador;
SMC_contador:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   56 unsigned char SMC_ciclos;
SMC_ciclos:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   57 eCASHLESS_state SMC_estado_atual = CASHLESS_STATE_DESABILITADO;
SMC_estado_atual:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   58 unsigned short int SMC_time_out=TEMPO_BUSCA_OFFLINE;
SMC_time_out:
        DATA
        DC16 30000

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   59 unsigned char SMC_flag_bloqueio=1;
SMC_flag_bloqueio:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   60 unsigned int SMC_contador_atividade_cartao=CICLOS_ATIVIDADE_CARTAO;
SMC_contador_atividade_cartao:
        DATA
        DC32 3
//   61 
//   62 /***********************************************************************************
//   63 *       Funções locais
//   64 ***********************************************************************************/
//   65 eCASHLESS_state SMC_desabilitado(void);
//   66 eCASHLESS_state SMC_setup(void);
//   67 eCASHLESS_state SMC_offline_state(void);
//   68 eCASHLESS_state SMC_poll_interface(void);
//   69 eCASHLESS_state SMC_dispositivo_bloqueado(void);
//   70 eCASHLESS_state SMC_inicia_transacao(void);
//   71 eCASHLESS_state SMC_transacao_aprovada(void);
//   72 eCASHLESS_state SMC_sucesso_transacao(void);
//   73 
//   74 /***********************************************************************************
//   75 *       Tabela de funções
//   76 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   77 eCASHLESS_state(*const MDBCASHLESS_funcs[])(void)={
MDBCASHLESS_funcs:
        DATA
        DC32 SMC_desabilitado, SMC_setup, SMC_offline_state, SMC_poll_interface
        DC32 SMC_dispositivo_bloqueado, SMC_inicia_transacao
        DC32 SMC_transacao_aprovada, SMC_sucesso_transacao, 0H
//   78   [CASHLESS_STATE_DESABILITADO]    = SMC_desabilitado,
//   79   [CASHLESS_STATE_SETUP]           = SMC_setup,
//   80   [CASHLESS_STATE_OFFLINE]         = SMC_offline_state,
//   81   [CASHLESS_STATE_POLL]            = SMC_poll_interface,
//   82   [CASHLESS_STATE_LOCKED]          = SMC_dispositivo_bloqueado,
//   83   [CASHLESS_STATE_INIT_VEND]       = SMC_inicia_transacao,
//   84   [CASHLESS_STATE_VEND_APPROVED]   = SMC_transacao_aprovada,
//   85   [CASHLESS_STATE_VEND_SUCCESS]    = SMC_sucesso_transacao,
//   86   [CASHLESS_STATE_SESSION_COMPLET] = NULL
//   87 };
//   88   
//   89 /***********************************************************************************
//   90 *       Implementação das funções
//   91 ***********************************************************************************/
//   92 
//   93 /***********************************************************************************
//   94 *       Descrição       :       Inicialização do módulo
//   95 *       Parametros      :       nenhum
//   96 *       Retorno         :       nenhum
//   97 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SMC_ini
          CFI NoCalls
        THUMB
//   98 void SMC_ini(void){
//   99   
//  100   
//  101   
//  102 }
SMC_ini:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  103 /***********************************************************************************
//  104 *       Descrição       :       Tick da máquina de estados de supervisão
//  105 *                               do cashless MDB
//  106 *       Parametros      :       nenhum
//  107 *       Retorno         :       nenhum
//  108 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SMC_tick
        THUMB
//  109 void SMC_tick(void){
SMC_tick:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  110 
//  111   SMC_estado_atual = MDBCASHLESS_funcs[SMC_estado_atual]();        
        LDR.N    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable5_1
        LDR      R0,[R1, R0, LSL #+2]
          CFI FunCall
        BLX      R0
        LDR.N    R1,??DataTable5
        STRB     R0,[R1, #+0]
//  112 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  113 /***********************************************************************************
//  114 *       Descrição       :       Estado onde o cashless está desabilitado
//  115 *       Parametros      :       nenhum
//  116 *       Retorno         :       eCASHLESS_state
//  117 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SMC_desabilitado
        THUMB
//  118 eCASHLESS_state SMC_desabilitado(void){
SMC_desabilitado:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  119   unsigned char flag;
//  120   
//  121   PARAMETROS_le(ADR_FLAG_MDB_CASHLESS,(void*)&flag);    
        ADD      R1,SP,#+0
        MOVS     R0,#+6
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  122   if(!flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??SMC_desabilitado_0
//  123     return CASHLESS_STATE_DESABILITADO;           
        MOVS     R0,#+0
        B.N      ??SMC_desabilitado_1
//  124   
//  125   if(SMC_flag_bloqueio)
??SMC_desabilitado_0:
        LDR.N    R0,??DataTable5_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMC_desabilitado_2
//  126     return CASHLESS_STATE_LOCKED;
        MOVS     R0,#+4
        B.N      ??SMC_desabilitado_1
//  127   
//  128    
//  129   return CASHLESS_STATE_SETUP;
??SMC_desabilitado_2:
        MOVS     R0,#+1
??SMC_desabilitado_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock2
//  130 }
//  131 /***********************************************************************************
//  132 *       Descrição       :       Estado em que realiza a configuração da
//  133 *                               interface de cartão
//  134 *       Parametros      :       nenhum
//  135 *       Retorno         :       eCASHLESS_state
//  136 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SMC_setup
        THUMB
//  137 eCASHLESS_state SMC_setup(void){  
SMC_setup:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+36
          CFI CFA R13+40
//  138   unsigned char nivel_configurado;
//  139   unsigned short int pais;
//  140   unsigned char escala;
//  141   unsigned char casas_decimais;
//  142   unsigned char tempo_maximo_transacao;
//  143   unsigned char opcoes_gerais;
//  144   
//  145   CASHLESS_reset_device();
          CFI FunCall CASHLESS_reset_device
        BL       CASHLESS_reset_device
//  146   vTaskDelay(20);
        MOVS     R0,#+20
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  147   
//  148   if(CASHLESS_set_and_get_setup_from_to_device(1,2,16,ASCII,&nivel_configurado,&pais,&escala,&casas_decimais,&tempo_maximo_transacao,&opcoes_gerais)==MDB_OK){
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
//  149     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  150     if(CASHLESS_set_min_and_max_price_in_device(1,100)==MDB_OK){
        MOVS     R1,#+100
        MOVS     R0,#+1
          CFI FunCall CASHLESS_set_min_and_max_price_in_device
        BL       CASHLESS_set_min_and_max_price_in_device
        CMP      R0,#+0
        BNE.N    ??SMC_setup_1
//  151       vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  152       if(MDBCASHLESS_enable_reader(1)==MDB_OK){
        MOVS     R0,#+1
          CFI FunCall MDBCASHLESS_enable_reader
        BL       MDBCASHLESS_enable_reader
        CMP      R0,#+0
        BNE.N    ??SMC_setup_1
//  153         vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  154         SMC_time_out=TEMPO_BUSCA_OFFLINE;     
        LDR.N    R0,??DataTable5_3
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
//  155         return CASHLESS_STATE_POLL;           
        MOVS     R0,#+3
        B.N      ??SMC_setup_2
//  156       }
//  157     }
//  158   }
//  159   else
//  160     if(!SMC_time_out)
??SMC_setup_0:
        LDR.N    R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMC_setup_1
//  161       return CASHLESS_STATE_OFFLINE;    
        MOVS     R0,#+2
        B.N      ??SMC_setup_2
//  162   
//  163   return CASHLESS_STATE_SETUP;  
??SMC_setup_1:
        MOVS     R0,#+1
??SMC_setup_2:
        ADD      SP,SP,#+36
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock3
//  164 }
//  165 /***********************************************************************************
//  166 *       Descrição       :       Estado em que a interface está offline
//  167 *       Parametros      :       nenhum
//  168 *       Retorno         :       eCASHLESS_state
//  169 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SMC_offline_state
        THUMB
//  170 eCASHLESS_state SMC_offline_state(void){
SMC_offline_state:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  171 
//  172   if(CASHLESS_adreess()==MDB_OK)
          CFI FunCall CASHLESS_adreess
        BL       CASHLESS_adreess
        CMP      R0,#+0
        BNE.N    ??SMC_offline_state_0
//  173     return CASHLESS_STATE_DESABILITADO;
        MOVS     R0,#+0
        B.N      ??SMC_offline_state_1
//  174      
//  175   return CASHLESS_STATE_OFFLINE;
??SMC_offline_state_0:
        MOVS     R0,#+2
??SMC_offline_state_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
//  176 }
//  177 /***********************************************************************************
//  178 *       Descrição       :       Estado em que é realizado o poll do
//  179 *                               dispositivo
//  180 *       Parametros      :       nenhum
//  181 *       Retorno         :       eCASHLESS_state
//  182 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SMC_poll_interface
        THUMB
//  183 eCASHLESS_state SMC_poll_interface(void){
SMC_poll_interface:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  184   eMDB_POLL_HEADER header;
//  185   unsigned char args[4];
//  186   eCASHLESS_VEND_RESULT resultado;
//  187   unsigned short int pago;
//  188   
//  189   if(CASHLESS_poll_device(&header,args)==MDB_OK){
        ADD      R1,SP,#+12
        ADD      R0,SP,#+0
          CFI FunCall CASHLESS_poll_device
        BL       CASHLESS_poll_device
        CMP      R0,#+0
        BNE.N    ??SMC_poll_interface_0
//  190     
//  191     switch(header){
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
//  192       case CASHLESS_POOL_DISPLAY_REQUEST:
//  193            break;
??SMC_poll_interface_1:
        B.N      ??SMC_poll_interface_2
//  194       case CASHLESS_POOL_BEGIN_SESSION:
//  195            {
//  196              unsigned int valorPipoca;
//  197              PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);                          
??SMC_poll_interface_4:
        ADD      R1,SP,#+8
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  198              if(MDBCASHLESS_start_vend(&resultado,&pago,valorPipoca,1)==MDB_OK){
        MOVS     R3,#+1
        LDR      R2,[SP, #+8]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADD      R1,SP,#+2
        ADD      R0,SP,#+1
          CFI FunCall MDBCASHLESS_start_vend
        BL       MDBCASHLESS_start_vend
//  199                       
//  200              }
//  201            }
//  202            break;
        B.N      ??SMC_poll_interface_2
//  203       case CASHLESS_POOL_SESSION_CANCEL_REQUEST:
//  204             MDBCASHLESS_session_complete();
??SMC_poll_interface_3:
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  205            break;
        B.N      ??SMC_poll_interface_2
//  206       case CASHLESS_POOL_VEND_APPROVED: 
//  207            if(MDBCASHLESS_vend_success(1)==MDB_OK){
??SMC_poll_interface_6:
        MOVS     R0,#+1
          CFI FunCall MDBCASHLESS_vend_success
        BL       MDBCASHLESS_vend_success
        CMP      R0,#+0
        BNE.N    ??SMC_poll_interface_9
//  208              unsigned int valorPipoca;
//  209              PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valorPipoca);
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  210              
//  211              if(!SMC_contador_atividade_cartao)
        LDR.N    R0,??DataTable5_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMC_poll_interface_10
//  212                PAGAMENTOS_adiciona_valores(valorPipoca);  
        LDR      R0,[SP, #+4]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_adiciona_valores
        BL       PAGAMENTOS_adiciona_valores
//  213              SMC_contador_atividade_cartao=CICLOS_ATIVIDADE_CARTAO;          
??SMC_poll_interface_10:
        LDR.N    R0,??DataTable5_4
        MOVS     R1,#+3
        STR      R1,[R0, #+0]
//  214              
//  215              if(MDBCASHLESS_session_complete()==MDB_OK){
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  216              }
//  217            }
//  218            break;
??SMC_poll_interface_9:
        B.N      ??SMC_poll_interface_2
//  219       case CASHLESS_POOL_VEND_DENIED:
//  220            MDBCASHLESS_session_complete();
??SMC_poll_interface_5:
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  221            break;
        B.N      ??SMC_poll_interface_2
//  222       case CASHLESS_POOL_END_SESSION:
//  223            MDBCASHLESS_session_complete();
??SMC_poll_interface_8:
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  224            break;
        B.N      ??SMC_poll_interface_2
//  225       case CASHLESS_POOL_CANCELLED:
//  226            MDBCASHLESS_session_complete();
??SMC_poll_interface_7:
          CFI FunCall MDBCASHLESS_session_complete
        BL       MDBCASHLESS_session_complete
//  227            break;
//  228     }
//  229     
//  230     SMC_time_out=TEMPO_BUSCA_OFFLINE;    
??SMC_poll_interface_2:
        LDR.N    R0,??DataTable5_3
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
//  231   }
//  232   
//  233   return  CASHLESS_STATE_POLL;
??SMC_poll_interface_0:
        MOVS     R0,#+3
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock5
//  234 }
//  235 /***********************************************************************************
//  236 *       Descrição       :       Estado no qual o dispositivo está bloqueado
//  237 *       Parametros      :       nenhum
//  238 *       Retorno         :       eCASHLESS_state
//  239 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SMC_dispositivo_bloqueado
        THUMB
//  240 eCASHLESS_state SMC_dispositivo_bloqueado(void){
SMC_dispositivo_bloqueado:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  241 
//  242   if(!SMC_flag_bloqueio)
        LDR.N    R0,??DataTable5_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMC_dispositivo_bloqueado_0
//  243     return CASHLESS_STATE_DESABILITADO;
        MOVS     R0,#+0
        B.N      ??SMC_dispositivo_bloqueado_1
//  244   
//  245   if(MDBCASHLESS_enable_reader(0)==MDB_OK){
??SMC_dispositivo_bloqueado_0:
        MOVS     R0,#+0
          CFI FunCall MDBCASHLESS_enable_reader
        BL       MDBCASHLESS_enable_reader
        CMP      R0,#+0
        BNE.N    ??SMC_dispositivo_bloqueado_2
//  246     SMC_time_out=TEMPO_BUSCA_OFFLINE;     
        LDR.N    R0,??DataTable5_3
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
//  247     return CASHLESS_STATE_LOCKED;  
        MOVS     R0,#+4
        B.N      ??SMC_dispositivo_bloqueado_1
//  248   }
//  249   else
//  250     if(!SMC_time_out)
??SMC_dispositivo_bloqueado_2:
        LDR.N    R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMC_dispositivo_bloqueado_3
//  251       return CASHLESS_STATE_OFFLINE;
        MOVS     R0,#+2
        B.N      ??SMC_dispositivo_bloqueado_1
//  252         
//  253   return  CASHLESS_STATE_LOCKED;
??SMC_dispositivo_bloqueado_3:
        MOVS     R0,#+4
??SMC_dispositivo_bloqueado_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock6
//  254 }
//  255 /***********************************************************************************
//  256 *       Descrição       :       Estado em que é iniciada a transação
//  257 *                               de venda
//  258 *       Parametros      :       nenhum
//  259 *       Retorno         :       eCASHLESS_state
//  260 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SMC_inicia_transacao
          CFI NoCalls
        THUMB
//  261 eCASHLESS_state SMC_inicia_transacao(void){
//  262 
//  263   
//  264   return CASHLESS_STATE_INIT_VEND;
SMC_inicia_transacao:
        MOVS     R0,#+5
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  265 }
//  266 /***********************************************************************************
//  267 *       Descrição       :       Estado no qual a venda foi aprovada
//  268 *       Parametros      :       nenhum
//  269 *       Retorno         :       eCASHLESS_state
//  270 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function SMC_transacao_aprovada
          CFI NoCalls
        THUMB
//  271 eCASHLESS_state SMC_transacao_aprovada(void){
//  272 
//  273    
//  274   return CASHLESS_STATE_VEND_APPROVED;
SMC_transacao_aprovada:
        MOVS     R0,#+6
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  275 }
//  276 /***********************************************************************************
//  277 *       Descrição       :       Estado no qual recebeu a configuração
//  278 *                               do crédit
//  279 *       Parametros      :       nenhum
//  280 *       Retorno         :       eCASHLESS_state 
//  281 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function SMC_sucesso_transacao
          CFI NoCalls
        THUMB
//  282 eCASHLESS_state SMC_sucesso_transacao(void){
//  283   
//  284   
//  285   return CASHLESS_STATE_VEND_SUCCESS;
SMC_sucesso_transacao:
        MOVS     R0,#+7
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  286 }
//  287 /***********************************************************************************
//  288 *       Descrição       :       Estado no qual a transação foi completada
//  289 *       Parametros      :       nenhum
//  290 *       Retorno         :       eCASHLESS_state
//  291 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function SMC_transacao_completada
          CFI NoCalls
        THUMB
//  292 eCASHLESS_state SMC_transacao_completada(void){
//  293   
//  294   
//  295   return CASHLESS_STATE_SESSION_COMPLET;
SMC_transacao_completada:
        MOVS     R0,#+8
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  296 }
//  297 /***********************************************************************************
//  298 *       Descrição       :       Setter para o flag de bloqueio do cashless
//  299 *                               device
//  300 *       Parametros      :       (unsigned char) flag
//  301 *       Retorno         :       nenhum
//  302 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function SMC_setter_bloqueio
          CFI NoCalls
        THUMB
//  303 void SMC_setter_bloqueio(unsigned char flag){
//  304   
//  305   SMC_flag_bloqueio = flag;
SMC_setter_bloqueio:
        LDR.N    R1,??DataTable5_2
        STRB     R0,[R1, #+0]
//  306 }
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

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     SMC_contador_atividade_cartao

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  307 /***********************************************************************************
//  308 *       Fim do arquivo
//  309 ***********************************************************************************/
// 
//   6 bytes in section .bss
//   7 bytes in section .data
//  36 bytes in section .rodata
// 462 bytes in section .text
// 
// 462 bytes of CODE  memory
//  36 bytes of CONST memory
//  13 bytes of DATA  memory
//
//Errors: none
//Warnings: none
