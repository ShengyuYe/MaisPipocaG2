///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     08/Sep/2017  20:09:11 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamento /
//                    s\Supervisao_mdb_coin.c                                 /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamento /
//                    s\Supervisao_mdb_coin.c -lC                             /
//                    C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\ -lA   /
//                    C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\ -o    /
//                    C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Obj\        /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\Superv /
//                    isao_mdb_coin.s                                         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Supervisao_mdb_coin

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN MDBCOIN_coin_type_setup
        EXTERN MDBCOIN_get_device
        EXTERN MDBCOIN_get_setup_from_device
        EXTERN MDBCOIN_poll
        EXTERN MDBCOIN_reset_device
        EXTERN PAGAMENTOS_adiciona_valores
        EXTERN PARAMETROS_le

        PUBLIC SMDBCOIN_coin_credit
        PUBLIC SMDBCOIN_contador_timeout
        PUBLIC SMDBCOIN_decimal_places
        PUBLIC SMDBCOIN_estado_atual
        PUBLIC SMDBCOIN_estado_bloqueado
        PUBLIC SMDBCOIN_estado_desabilitado
        PUBLIC SMDBCOIN_estado_offline
        PUBLIC SMDBCOIN_estado_reset
        PUBLIC SMDBCOIN_estado_supervisao
        PUBLIC SMDBCOIN_flag_bloqueio
        PUBLIC SMDBCOIN_func_table
        PUBLIC SMDBCOIN_scale_factor
        PUBLIC SMDBCOIN_set_flag_bloqueio
        PUBLIC SMDBCOIN_tick
        PUBLIC SMDBCOIN_verifica_net_status
        
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamentos\Supervisao_mdb_coin.c
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
//   17 |       Arquivo            :  supervisao_mdb_coin.c
//   18 |       Descrição          :  Máquina de estados que gerencia o meio de pagamento
//   19 |                             MDB BILL
//   20 | 
//   21 |       Autor              :  Marcos Aquino
//   22 |       Data criação       :  28/02/2017
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
//   37 #include "supervisao_mdb_coin.h"
//   38 
//   39 /***********************************************************************************
//   40 *       Definições
//   41 ***********************************************************************************/
//   42 #define RELOAD_COIN_TIMEOUT             30000
//   43 
//   44 /***********************************************************************************
//   45 *       Enumerações
//   46 ***********************************************************************************/
//   47 typedef enum{
//   48   COIN_DISABLED=0,
//   49   COIN_RESET_STATE,
//   50   COIN_LOCKED,
//   51   COIN_SUPERVISAO,
//   52   COIN_OFFLINE
//   53 }eCOIN_SM_STATE;
//   54 
//   55 /***********************************************************************************
//   56 *       Variaveis locais
//   57 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   58 unsigned char SMDBCOIN_flag_bloqueio=0;
SMDBCOIN_flag_bloqueio:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   59 eCOIN_SM_STATE SMDBCOIN_estado_atual;
SMDBCOIN_estado_atual:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   60 unsigned short int SMDBCOIN_contador_timeout=0;
SMDBCOIN_contador_timeout:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   61 unsigned char SMDBCOIN_coin_credit[16]={0};
SMDBCOIN_coin_credit:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   62 unsigned char SMDBCOIN_scale_factor=0x00;
SMDBCOIN_scale_factor:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   63 unsigned char SMDBCOIN_decimal_places;
SMDBCOIN_decimal_places:
        DS8 1
//   64 
//   65 /***********************************************************************************
//   66 *       Funções locais
//   67 ***********************************************************************************/
//   68 eCOIN_SM_STATE SMDBCOIN_estado_desabilitado(eCOIN_SM_STATE estado);
//   69 eCOIN_SM_STATE SMDBCOIN_estado_reset(eCOIN_SM_STATE estado);
//   70 eCOIN_SM_STATE SMDBCOIN_estado_bloqueado(eCOIN_SM_STATE estado);
//   71 eCOIN_SM_STATE SMDBCOIN_estado_supervisao(eCOIN_SM_STATE estado);
//   72 eCOIN_SM_STATE SMDBCOIN_estado_offline(eCOIN_SM_STATE estado);
//   73 
//   74 /***********************************************************************************
//   75 *       Tabela de funções
//   76 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   77 eCOIN_SM_STATE(*const SMDBCOIN_func_table[])(eCOIN_SM_STATE)={
SMDBCOIN_func_table:
        DATA
        DC32 SMDBCOIN_estado_desabilitado, SMDBCOIN_estado_reset
        DC32 SMDBCOIN_estado_bloqueado, SMDBCOIN_estado_supervisao
        DC32 SMDBCOIN_estado_offline
//   78   [COIN_DISABLED]    = SMDBCOIN_estado_desabilitado,
//   79   [COIN_RESET_STATE] = SMDBCOIN_estado_reset,
//   80   [COIN_LOCKED]      = SMDBCOIN_estado_bloqueado,
//   81   [COIN_SUPERVISAO]  = SMDBCOIN_estado_supervisao,
//   82   [COIN_OFFLINE]     = SMDBCOIN_estado_offline
//   83 };
//   84 /***********************************************************************************
//   85 *       Funções locais
//   86 ***********************************************************************************/
//   87 
//   88 
//   89 /***********************************************************************************
//   90 *       Implementação das funções
//   91 ***********************************************************************************/
//   92 
//   93 /***********************************************************************************
//   94 *       Descrição       :       Setter para o flag bloqueio 
//   95 *       Parametros      :       (unsigned char) flag
//   96 *       Retorno         :       nenhum
//   97 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SMDBCOIN_set_flag_bloqueio
          CFI NoCalls
        THUMB
//   98 void SMDBCOIN_set_flag_bloqueio(unsigned char flag){
//   99   
//  100   SMDBCOIN_flag_bloqueio = flag;
SMDBCOIN_set_flag_bloqueio:
        LDR.N    R1,??DataTable5
        STRB     R0,[R1, #+0]
//  101 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  102 /***********************************************************************************
//  103 *       Descrição       :       Função principal da supervisão
//  104 *                               do moedeiro
//  105 *       Parametros      :       nenhum
//  106 *       Retorno         :       nenhum
//  107 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SMDBCOIN_tick
        THUMB
//  108 void SMDBCOIN_tick(void){
SMDBCOIN_tick:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  109   
//  110   SMDBCOIN_estado_atual = SMDBCOIN_func_table[SMDBCOIN_estado_atual](SMDBCOIN_estado_atual);
        LDR.N    R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable5_1
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable5_2
        LDR      R1,[R2, R1, LSL #+2]
          CFI FunCall
        BLX      R1
        LDR.N    R1,??DataTable5_1
        STRB     R0,[R1, #+0]
//  111 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  112 /***********************************************************************************
//  113 *       Descrição       :       Estado onde o moedeiro está
//  114 *                               desabilitado
//  115 *       Parametros      :       (eCOIN_SM_STATE) estado atual
//  116 *                                                       do moedeiro
//  117 *       Retorno         :       (eCOIN_SM_STATE) novo estado
//  118 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SMDBCOIN_estado_desabilitado
        THUMB
//  119 eCOIN_SM_STATE SMDBCOIN_estado_desabilitado(eCOIN_SM_STATE estado){
SMDBCOIN_estado_desabilitado:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  120   unsigned char flag;
//  121   
//  122   PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  123   
//  124   if(flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_desabilitado_0
//  125     return COIN_LOCKED;
        MOVS     R0,#+2
        B.N      ??SMDBCOIN_estado_desabilitado_1
//  126   
//  127   return estado;
??SMDBCOIN_estado_desabilitado_0:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_desabilitado_1:
        POP      {R1,R2,R4,PC}    ;; return
          CFI EndBlock cfiBlock2
//  128 }
//  129 /***********************************************************************************
//  130 *       Descrição       :       Estado onde é realizado o reset do moedeiro
//  131 *       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
//  132 *       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
//  133 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SMDBCOIN_estado_reset
        THUMB
//  134 eCOIN_SM_STATE SMDBCOIN_estado_reset(eCOIN_SM_STATE estado){
SMDBCOIN_estado_reset:
        PUSH     {R0-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+32
        MOVS     R4,R0
//  135   unsigned char tentativas=10;
        MOVS     R6,#+10
//  136   eMDB_reply flag;
//  137   unsigned char mdb_message_leve;
//  138   unsigned short int country;
//  139   unsigned short int coin_type_routing;
//  140   unsigned short int cfg_moedas;
//  141   
//  142   PARAMETROS_le(ADR_TIPOS_MOEDAS,(void*)&cfg_moedas);  
        ADD      R1,SP,#+8
        MOVS     R0,#+64
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  143 
//  144   
//  145   do flag = MDBCOIN_reset_device();   
??SMDBCOIN_estado_reset_0:
          CFI FunCall MDBCOIN_reset_device
        BL       MDBCOIN_reset_device
        MOVS     R5,R0
//  146   while(flag!=MDB_OK && tentativas--);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??SMDBCOIN_estado_reset_1
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_reset_0
//  147   
//  148   if(flag==MDB_OK){
??SMDBCOIN_estado_reset_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??SMDBCOIN_estado_reset_2
//  149     
//  150     tentativas = 10;
        MOVS     R0,#+10
        MOVS     R6,R0
//  151     do flag = MDBCOIN_get_setup_from_device(&mdb_message_leve,&country,&SMDBCOIN_scale_factor,
//  152                                             &SMDBCOIN_decimal_places,&coin_type_routing,SMDBCOIN_coin_credit);
??SMDBCOIN_estado_reset_3:
        LDR.N    R0,??DataTable5_3
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        LDR.N    R3,??DataTable5_4
        LDR.N    R2,??DataTable5_5
        ADD      R1,SP,#+14
        ADD      R0,SP,#+10
          CFI FunCall MDBCOIN_get_setup_from_device
        BL       MDBCOIN_get_setup_from_device
        MOVS     R5,R0
//  153     while(flag!=MDB_OK && --tentativas);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??SMDBCOIN_estado_reset_4
        SUBS     R6,R6,#+1
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_reset_3
//  154     
//  155     if(flag==MDB_OK){      
??SMDBCOIN_estado_reset_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??SMDBCOIN_estado_reset_5
//  156       
//  157       
//  158       
//  159       tentativas = 10;
        MOVS     R0,#+10
        MOVS     R6,R0
//  160       do flag = MDBCOIN_coin_type_setup(cfg_moedas,cfg_moedas);
??SMDBCOIN_estado_reset_6:
        LDRH     R1,[SP, #+8]
        LDRH     R0,[SP, #+8]
          CFI FunCall MDBCOIN_coin_type_setup
        BL       MDBCOIN_coin_type_setup
        MOVS     R5,R0
//  161       while(flag!=MDB_OK && tentativas--);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??SMDBCOIN_estado_reset_7
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_reset_6
//  162       if(flag==MDB_OK){
??SMDBCOIN_estado_reset_7:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??SMDBCOIN_estado_reset_8
//  163         SMDBCOIN_contador_timeout = 10;
        LDR.N    R0,??DataTable5_6
        MOVS     R1,#+10
        STRH     R1,[R0, #+0]
//  164         return COIN_SUPERVISAO;       
        MOVS     R0,#+3
        B.N      ??SMDBCOIN_estado_reset_9
//  165       }
//  166       else
//  167         return COIN_OFFLINE;
??SMDBCOIN_estado_reset_8:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_reset_9
//  168     }
//  169     else
//  170       return COIN_OFFLINE;
??SMDBCOIN_estado_reset_5:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_reset_9
//  171     
//  172   }  
//  173   
//  174   return estado;
??SMDBCOIN_estado_reset_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_reset_9:
        ADD      SP,SP,#+16
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock3
//  175 }
//  176 /***********************************************************************************
//  177 *       Descrição       :       Estado onde o moedeiro está bloqueado
//  178 *       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
//  179 *       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
//  180 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SMDBCOIN_estado_bloqueado
        THUMB
//  181 eCOIN_SM_STATE SMDBCOIN_estado_bloqueado(eCOIN_SM_STATE estado){  
SMDBCOIN_estado_bloqueado:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R4,R0
//  182   unsigned char flag;
//  183   
//  184   PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  185   
//  186   if(!flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_bloqueado_0
//  187     return COIN_DISABLED;
        MOVS     R0,#+0
        B.N      ??SMDBCOIN_estado_bloqueado_1
//  188   
//  189   unsigned char tentativas=5;
??SMDBCOIN_estado_bloqueado_0:
        MOVS     R6,#+5
//  190   eMDB_reply ack;
//  191   
//  192   do ack = MDBCOIN_get_device();
??SMDBCOIN_estado_bloqueado_2:
          CFI FunCall MDBCOIN_get_device
        BL       MDBCOIN_get_device
        MOVS     R5,R0
//  193   while(ack!=MDB_OK && tentativas--);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??SMDBCOIN_estado_bloqueado_3
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_bloqueado_2
//  194   
//  195   if(ack==MDB_OK){
??SMDBCOIN_estado_bloqueado_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??SMDBCOIN_estado_bloqueado_4
//  196     if(!SMDBCOIN_flag_bloqueio)
        LDR.N    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_bloqueado_5
//  197       return COIN_RESET_STATE;         
        MOVS     R0,#+1
        B.N      ??SMDBCOIN_estado_bloqueado_1
//  198     SMDBCOIN_contador_timeout = RELOAD_COIN_TIMEOUT;      
??SMDBCOIN_estado_bloqueado_5:
        LDR.N    R0,??DataTable5_6
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
        B.N      ??SMDBCOIN_estado_bloqueado_6
//  199   }
//  200   else{
//  201     if(SMDBCOIN_contador_timeout)
??SMDBCOIN_estado_bloqueado_4:
        LDR.N    R0,??DataTable5_6
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_bloqueado_7
//  202       SMDBCOIN_contador_timeout--;
        LDR.N    R0,??DataTable5_6
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable5_6
        STRH     R0,[R1, #+0]
        B.N      ??SMDBCOIN_estado_bloqueado_6
//  203     else
//  204       return COIN_OFFLINE;
??SMDBCOIN_estado_bloqueado_7:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_bloqueado_1
//  205   }
//  206   
//  207   return estado;
??SMDBCOIN_estado_bloqueado_6:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_bloqueado_1:
        POP      {R1,R2,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock4
//  208 }
//  209 /***********************************************************************************
//  210 *       Descrição       :       Estado onde realiza a supervisão do moedeiro
//  211 *       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
//  212 *       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
//  213 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SMDBCOIN_estado_supervisao
        THUMB
//  214 eCOIN_SM_STATE SMDBCOIN_estado_supervisao(eCOIN_SM_STATE estado){
SMDBCOIN_estado_supervisao:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+12
          CFI CFA R13+32
        MOVS     R4,R0
//  215   unsigned char flag;
//  216   eMDB_COIN_POOL_TYPE tipo_pacote;
//  217   eMDB_COIN_POOL_STATUS status_pacote;
//  218   unsigned char tipo_moeda;
//  219   unsigned char quantidade_tubo;  
//  220   eMDB_reply ack;
//  221   unsigned char tentativas=10;
        MOVS     R6,#+10
//  222   
//  223   PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);    
        ADD      R1,SP,#+2
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  224   if(!flag)
        LDRB     R0,[SP, #+2]
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_supervisao_0
//  225     return COIN_DISABLED;
        MOVS     R0,#+0
        B.N      ??SMDBCOIN_estado_supervisao_1
//  226   if(SMDBCOIN_flag_bloqueio){
??SMDBCOIN_estado_supervisao_0:
        LDR.N    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_supervisao_2
//  227     
//  228     do ack = MDBCOIN_reset_device();   
??SMDBCOIN_estado_supervisao_3:
          CFI FunCall MDBCOIN_reset_device
        BL       MDBCOIN_reset_device
        MOVS     R5,R0
//  229     while(ack!=MDB_OK && tentativas--);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??SMDBCOIN_estado_supervisao_4
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_supervisao_3
//  230     
//  231     if(ack==MDB_OK)
??SMDBCOIN_estado_supervisao_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??SMDBCOIN_estado_supervisao_5
//  232       return COIN_LOCKED;
        MOVS     R0,#+2
        B.N      ??SMDBCOIN_estado_supervisao_1
//  233     else
//  234       return COIN_OFFLINE;
??SMDBCOIN_estado_supervisao_5:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_supervisao_1
//  235   }
//  236 
//  237   if(MDBCOIN_poll(&tipo_pacote,&status_pacote,&tipo_moeda,&quantidade_tubo)==MDB_OK){
??SMDBCOIN_estado_supervisao_2:
        ADD      R3,SP,#+3
        ADD      R2,SP,#+1
        ADD      R1,SP,#+4
        ADD      R0,SP,#+0
          CFI FunCall MDBCOIN_poll
        BL       MDBCOIN_poll
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_supervisao_6
//  238     
//  239     SMDBCOIN_contador_timeout = RELOAD_COIN_TIMEOUT;     
        LDR.N    R0,??DataTable5_6
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
//  240     if(tipo_pacote!=COIN_ACK){
        LDRB     R0,[SP, #+0]
        CMP      R0,#+3
        BEQ.N    ??SMDBCOIN_estado_supervisao_7
//  241        if(tipo_pacote==COIN_DEPOSITED){
        LDRB     R0,[SP, #+0]
        CMP      R0,#+1
        BNE.N    ??SMDBCOIN_estado_supervisao_7
//  242         //Aqui dentro é onde vem
//  243         // o valor da moeda para somar ao pagamento
//  244         unsigned short int valor = SMDBCOIN_coin_credit[tipo_moeda]*SMDBCOIN_scale_factor;
        LDRB     R0,[SP, #+1]
        LDR.N    R1,??DataTable5_3
        LDRB     R0,[R0, R1]
        LDR.N    R1,??DataTable5_5
        LDRB     R1,[R1, #+0]
        MUL      R7,R1,R0
//  245         PAGAMENTOS_adiciona_valores(valor);
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_adiciona_valores
        BL       PAGAMENTOS_adiciona_valores
//  246         tipo_pacote = COIN_STATUS;
        MOVS     R0,#+2
        STRB     R0,[SP, #+0]
        B.N      ??SMDBCOIN_estado_supervisao_7
//  247       }
//  248     }
//  249   }
//  250   else{
//  251     if(SMDBCOIN_contador_timeout)
??SMDBCOIN_estado_supervisao_6:
        LDR.N    R0,??DataTable5_6
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_supervisao_8
//  252       SMDBCOIN_contador_timeout--;
        LDR.N    R0,??DataTable5_6
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable5_6
        STRH     R0,[R1, #+0]
        B.N      ??SMDBCOIN_estado_supervisao_7
//  253     else
//  254       return COIN_OFFLINE;
??SMDBCOIN_estado_supervisao_8:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_supervisao_1
//  255   }
//  256   
//  257   return estado;
??SMDBCOIN_estado_supervisao_7:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_supervisao_1:
        POP      {R1-R7,PC}       ;; return
          CFI EndBlock cfiBlock5
//  258 }
//  259 /***********************************************************************************
//  260 *       Descrição       :       Estado em que o moedeiro está offline
//  261 *       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
//  262 *       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
//  263 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SMDBCOIN_estado_offline
        THUMB
//  264 eCOIN_SM_STATE SMDBCOIN_estado_offline(eCOIN_SM_STATE estado){
SMDBCOIN_estado_offline:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  265   unsigned char flag;
//  266   
//  267   PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  268   
//  269   if(!flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_offline_0
//  270     return COIN_DISABLED;
        MOVS     R0,#+0
        B.N      ??SMDBCOIN_estado_offline_1
//  271   
//  272   if(MDBCOIN_get_device()==MDB_OK)
??SMDBCOIN_estado_offline_0:
          CFI FunCall MDBCOIN_get_device
        BL       MDBCOIN_get_device
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_offline_2
//  273     return COIN_DISABLED;
        MOVS     R0,#+0
        B.N      ??SMDBCOIN_estado_offline_1
//  274       
//  275   return estado;
??SMDBCOIN_estado_offline_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_offline_1:
        POP      {R1,R2,R4,PC}    ;; return
          CFI EndBlock cfiBlock6
//  276 }
//  277 /***********************************************************************************
//  278 *       Descrição       :       Verifica se há conectivadade do moedeiro
//  279 *       Parametros      :       nenhum
//  280 *       Retorno         :       nenhum
//  281 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SMDBCOIN_verifica_net_status
          CFI NoCalls
        THUMB
//  282 unsigned char SMDBCOIN_verifica_net_status(void){
//  283   
//  284   if(SMDBCOIN_estado_atual != COIN_OFFLINE)
SMDBCOIN_verifica_net_status:
        LDR.N    R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BEQ.N    ??SMDBCOIN_verifica_net_status_0
//  285     return 1;
        MOVS     R0,#+1
        B.N      ??SMDBCOIN_verifica_net_status_1
//  286   
//  287   return 0;
??SMDBCOIN_verifica_net_status_0:
        MOVS     R0,#+0
??SMDBCOIN_verifica_net_status_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  288 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     SMDBCOIN_flag_bloqueio

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     SMDBCOIN_estado_atual

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     SMDBCOIN_func_table

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     SMDBCOIN_coin_credit

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     SMDBCOIN_decimal_places

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     SMDBCOIN_scale_factor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     SMDBCOIN_contador_timeout

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  289 /***********************************************************************************
//  290 *       Fim do arquivo
//  291 ***********************************************************************************/
// 
//  22 bytes in section .bss
//  20 bytes in section .rodata
// 598 bytes in section .text
// 
// 598 bytes of CODE  memory
//  20 bytes of CONST memory
//  22 bytes of DATA  memory
//
//Errors: none
//Warnings: none
