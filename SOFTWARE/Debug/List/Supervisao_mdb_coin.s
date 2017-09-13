///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     13/Sep/2017  18:09:14 /
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
        PUBLIC SMDBCOIN_lock_coin
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
//   43 #define RELOAD_LOCK_COIN                250        
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

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   64 unsigned short int SMDBCOIN_lock_coin;
SMDBCOIN_lock_coin:
        DS8 2
//   65 
//   66 /***********************************************************************************
//   67 *       Funções locais
//   68 ***********************************************************************************/
//   69 eCOIN_SM_STATE SMDBCOIN_estado_desabilitado(eCOIN_SM_STATE estado);
//   70 eCOIN_SM_STATE SMDBCOIN_estado_reset(eCOIN_SM_STATE estado);
//   71 eCOIN_SM_STATE SMDBCOIN_estado_bloqueado(eCOIN_SM_STATE estado);
//   72 eCOIN_SM_STATE SMDBCOIN_estado_supervisao(eCOIN_SM_STATE estado);
//   73 eCOIN_SM_STATE SMDBCOIN_estado_offline(eCOIN_SM_STATE estado);
//   74 
//   75 /***********************************************************************************
//   76 *       Tabela de funções
//   77 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   78 eCOIN_SM_STATE(*const SMDBCOIN_func_table[])(eCOIN_SM_STATE)={
SMDBCOIN_func_table:
        DATA
        DC32 SMDBCOIN_estado_desabilitado, SMDBCOIN_estado_reset
        DC32 SMDBCOIN_estado_bloqueado, SMDBCOIN_estado_supervisao
        DC32 SMDBCOIN_estado_offline
//   79   [COIN_DISABLED]    = SMDBCOIN_estado_desabilitado,
//   80   [COIN_RESET_STATE] = SMDBCOIN_estado_reset,
//   81   [COIN_LOCKED]      = SMDBCOIN_estado_bloqueado,
//   82   [COIN_SUPERVISAO]  = SMDBCOIN_estado_supervisao,
//   83   [COIN_OFFLINE]     = SMDBCOIN_estado_offline
//   84 };
//   85 /***********************************************************************************
//   86 *       Funções locais
//   87 ***********************************************************************************/
//   88 
//   89 
//   90 /***********************************************************************************
//   91 *       Implementação das funções
//   92 ***********************************************************************************/
//   93 
//   94 /***********************************************************************************
//   95 *       Descrição       :       Setter para o flag bloqueio 
//   96 *       Parametros      :       (unsigned char) flag
//   97 *       Retorno         :       nenhum
//   98 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SMDBCOIN_set_flag_bloqueio
          CFI NoCalls
        THUMB
//   99 void SMDBCOIN_set_flag_bloqueio(unsigned char flag){
//  100   
//  101   SMDBCOIN_flag_bloqueio = flag;
SMDBCOIN_set_flag_bloqueio:
        LDR.N    R1,??DataTable5
        STRB     R0,[R1, #+0]
//  102 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  103 /***********************************************************************************
//  104 *       Descrição       :       Função principal da supervisão
//  105 *                               do moedeiro
//  106 *       Parametros      :       nenhum
//  107 *       Retorno         :       nenhum
//  108 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SMDBCOIN_tick
        THUMB
//  109 void SMDBCOIN_tick(void){
SMDBCOIN_tick:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  110   
//  111   SMDBCOIN_estado_atual = SMDBCOIN_func_table[SMDBCOIN_estado_atual](SMDBCOIN_estado_atual);
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
//  112 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  113 /***********************************************************************************
//  114 *       Descrição       :       Estado onde o moedeiro está
//  115 *                               desabilitado
//  116 *       Parametros      :       (eCOIN_SM_STATE) estado atual
//  117 *                                                       do moedeiro
//  118 *       Retorno         :       (eCOIN_SM_STATE) novo estado
//  119 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SMDBCOIN_estado_desabilitado
        THUMB
//  120 eCOIN_SM_STATE SMDBCOIN_estado_desabilitado(eCOIN_SM_STATE estado){
SMDBCOIN_estado_desabilitado:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  121   unsigned char flag;
//  122   
//  123   PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  124   
//  125   if(flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_desabilitado_0
//  126     return COIN_LOCKED;
        MOVS     R0,#+2
        B.N      ??SMDBCOIN_estado_desabilitado_1
//  127   
//  128   return estado;
??SMDBCOIN_estado_desabilitado_0:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_desabilitado_1:
        POP      {R1,R2,R4,PC}    ;; return
          CFI EndBlock cfiBlock2
//  129 }
//  130 /***********************************************************************************
//  131 *       Descrição       :       Estado onde é realizado o reset do moedeiro
//  132 *       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
//  133 *       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
//  134 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SMDBCOIN_estado_reset
        THUMB
//  135 eCOIN_SM_STATE SMDBCOIN_estado_reset(eCOIN_SM_STATE estado){
SMDBCOIN_estado_reset:
        PUSH     {R0-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+32
        MOVS     R4,R0
//  136   unsigned char tentativas=10;
        MOVS     R6,#+10
//  137   eMDB_reply flag;
//  138   unsigned char mdb_message_leve;
//  139   unsigned short int country;
//  140   unsigned short int coin_type_routing;
//  141   unsigned short int cfg_moedas;
//  142   
//  143   PARAMETROS_le(ADR_TIPOS_MOEDAS,(void*)&cfg_moedas);  
        ADD      R1,SP,#+8
        MOVS     R0,#+64
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  144 
//  145   
//  146   do flag = MDBCOIN_reset_device();   
??SMDBCOIN_estado_reset_0:
          CFI FunCall MDBCOIN_reset_device
        BL       MDBCOIN_reset_device
        MOVS     R5,R0
//  147   while(flag!=MDB_OK && tentativas--);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??SMDBCOIN_estado_reset_1
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_reset_0
//  148   
//  149   if(flag==MDB_OK){
??SMDBCOIN_estado_reset_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??SMDBCOIN_estado_reset_2
//  150     
//  151     tentativas = 10;
        MOVS     R0,#+10
        MOVS     R6,R0
//  152     do flag = MDBCOIN_get_setup_from_device(&mdb_message_leve,&country,&SMDBCOIN_scale_factor,
//  153                                             &SMDBCOIN_decimal_places,&coin_type_routing,SMDBCOIN_coin_credit);
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
//  154     while(flag!=MDB_OK && --tentativas);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??SMDBCOIN_estado_reset_4
        SUBS     R6,R6,#+1
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_reset_3
//  155     
//  156     if(flag==MDB_OK){      
??SMDBCOIN_estado_reset_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??SMDBCOIN_estado_reset_5
//  157       
//  158       
//  159       
//  160       tentativas = 10;
        MOVS     R0,#+10
        MOVS     R6,R0
//  161       do flag = MDBCOIN_coin_type_setup(cfg_moedas,cfg_moedas);
??SMDBCOIN_estado_reset_6:
        LDRH     R1,[SP, #+8]
        LDRH     R0,[SP, #+8]
          CFI FunCall MDBCOIN_coin_type_setup
        BL       MDBCOIN_coin_type_setup
        MOVS     R5,R0
//  162       while(flag!=MDB_OK && tentativas--);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??SMDBCOIN_estado_reset_7
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_reset_6
//  163       if(flag==MDB_OK){
??SMDBCOIN_estado_reset_7:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??SMDBCOIN_estado_reset_8
//  164         SMDBCOIN_contador_timeout = 10;
        LDR.N    R0,??DataTable5_6
        MOVS     R1,#+10
        STRH     R1,[R0, #+0]
//  165         return COIN_SUPERVISAO;       
        MOVS     R0,#+3
        B.N      ??SMDBCOIN_estado_reset_9
//  166       }
//  167       else
//  168         return COIN_OFFLINE;
??SMDBCOIN_estado_reset_8:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_reset_9
//  169     }
//  170     else
//  171       return COIN_OFFLINE;
??SMDBCOIN_estado_reset_5:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_reset_9
//  172     
//  173   }  
//  174   
//  175   return estado;
??SMDBCOIN_estado_reset_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_reset_9:
        ADD      SP,SP,#+16
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock3
//  176 }
//  177 /***********************************************************************************
//  178 *       Descrição       :       Estado onde o moedeiro está bloqueado
//  179 *       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
//  180 *       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
//  181 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SMDBCOIN_estado_bloqueado
        THUMB
//  182 eCOIN_SM_STATE SMDBCOIN_estado_bloqueado(eCOIN_SM_STATE estado){  
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
//  183   unsigned char flag;
//  184   
//  185   PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  186   
//  187   if(!flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_bloqueado_0
//  188     return COIN_DISABLED;
        MOVS     R0,#+0
        B.N      ??SMDBCOIN_estado_bloqueado_1
//  189   
//  190   unsigned char tentativas=5;
??SMDBCOIN_estado_bloqueado_0:
        MOVS     R6,#+5
//  191   eMDB_reply ack;
//  192   
//  193   do ack = MDBCOIN_get_device();
??SMDBCOIN_estado_bloqueado_2:
          CFI FunCall MDBCOIN_get_device
        BL       MDBCOIN_get_device
        MOVS     R5,R0
//  194   while(ack!=MDB_OK && tentativas--);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??SMDBCOIN_estado_bloqueado_3
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_bloqueado_2
//  195   
//  196   if(ack==MDB_OK){
??SMDBCOIN_estado_bloqueado_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??SMDBCOIN_estado_bloqueado_4
//  197     if(!SMDBCOIN_flag_bloqueio)
        LDR.N    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_bloqueado_5
//  198       return COIN_RESET_STATE;         
        MOVS     R0,#+1
        B.N      ??SMDBCOIN_estado_bloqueado_1
//  199     SMDBCOIN_contador_timeout = RELOAD_COIN_TIMEOUT;      
??SMDBCOIN_estado_bloqueado_5:
        LDR.N    R0,??DataTable5_6
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
        B.N      ??SMDBCOIN_estado_bloqueado_6
//  200   }
//  201   else{
//  202     if(SMDBCOIN_contador_timeout)
??SMDBCOIN_estado_bloqueado_4:
        LDR.N    R0,??DataTable5_6
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_bloqueado_7
//  203       SMDBCOIN_contador_timeout--;
        LDR.N    R0,??DataTable5_6
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable5_6
        STRH     R0,[R1, #+0]
        B.N      ??SMDBCOIN_estado_bloqueado_6
//  204     else
//  205       return COIN_OFFLINE;
??SMDBCOIN_estado_bloqueado_7:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_bloqueado_1
//  206   }
//  207   
//  208   return estado;
??SMDBCOIN_estado_bloqueado_6:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_bloqueado_1:
        POP      {R1,R2,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock4
//  209 }
//  210 /***********************************************************************************
//  211 *       Descrição       :       Estado onde realiza a supervisão do moedeiro
//  212 *       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
//  213 *       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
//  214 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SMDBCOIN_estado_supervisao
        THUMB
//  215 eCOIN_SM_STATE SMDBCOIN_estado_supervisao(eCOIN_SM_STATE estado){
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
//  216   unsigned char flag;
//  217   eMDB_COIN_POOL_TYPE tipo_pacote;
//  218   eMDB_COIN_POOL_STATUS status_pacote;
//  219   unsigned char tipo_moeda;
//  220   unsigned char quantidade_tubo;  
//  221   eMDB_reply ack;
//  222   unsigned char tentativas=10;
        MOVS     R6,#+10
//  223   
//  224   PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);    
        ADD      R1,SP,#+2
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  225   if(!flag)
        LDRB     R0,[SP, #+2]
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_supervisao_0
//  226     return COIN_DISABLED;
        MOVS     R0,#+0
        B.N      ??SMDBCOIN_estado_supervisao_1
//  227   if(SMDBCOIN_flag_bloqueio){
??SMDBCOIN_estado_supervisao_0:
        LDR.N    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_supervisao_2
//  228     
//  229     do ack = MDBCOIN_reset_device();   
??SMDBCOIN_estado_supervisao_3:
          CFI FunCall MDBCOIN_reset_device
        BL       MDBCOIN_reset_device
        MOVS     R5,R0
//  230     while(ack!=MDB_OK && tentativas--);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??SMDBCOIN_estado_supervisao_4
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_supervisao_3
//  231     
//  232     if(ack==MDB_OK)
??SMDBCOIN_estado_supervisao_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??SMDBCOIN_estado_supervisao_5
//  233       return COIN_LOCKED;
        MOVS     R0,#+2
        B.N      ??SMDBCOIN_estado_supervisao_1
//  234     else
//  235       return COIN_OFFLINE;
??SMDBCOIN_estado_supervisao_5:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_supervisao_1
//  236   }
//  237 
//  238   if(!SMDBCOIN_lock_coin && MDBCOIN_poll(&tipo_pacote,&status_pacote,&tipo_moeda,&quantidade_tubo)==MDB_OK){
??SMDBCOIN_estado_supervisao_2:
        LDR.N    R0,??DataTable5_7
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_supervisao_6
        ADD      R3,SP,#+3
        ADD      R2,SP,#+1
        ADD      R1,SP,#+4
        ADD      R0,SP,#+0
          CFI FunCall MDBCOIN_poll
        BL       MDBCOIN_poll
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_supervisao_6
//  239     
//  240     SMDBCOIN_lock_coin=RELOAD_LOCK_COIN;
        LDR.N    R0,??DataTable5_7
        MOVS     R1,#+250
        STRH     R1,[R0, #+0]
//  241     
//  242     SMDBCOIN_contador_timeout = RELOAD_COIN_TIMEOUT;     
        LDR.N    R0,??DataTable5_6
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
//  243     if(tipo_pacote!=COIN_ACK){
        LDRB     R0,[SP, #+0]
        CMP      R0,#+3
        BEQ.N    ??SMDBCOIN_estado_supervisao_7
//  244        if(tipo_pacote==COIN_DEPOSITED){
        LDRB     R0,[SP, #+0]
        CMP      R0,#+1
        BNE.N    ??SMDBCOIN_estado_supervisao_7
//  245         //Aqui dentro é onde vem
//  246         // o valor da moeda para somar ao pagamento
//  247         unsigned short int valor = SMDBCOIN_coin_credit[tipo_moeda]*SMDBCOIN_scale_factor;
        LDRB     R0,[SP, #+1]
        LDR.N    R1,??DataTable5_3
        LDRB     R0,[R0, R1]
        LDR.N    R1,??DataTable5_5
        LDRB     R1,[R1, #+0]
        MUL      R7,R1,R0
//  248         PAGAMENTOS_adiciona_valores(valor);
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_adiciona_valores
        BL       PAGAMENTOS_adiciona_valores
//  249         tipo_pacote = COIN_STATUS;
        MOVS     R0,#+2
        STRB     R0,[SP, #+0]
        B.N      ??SMDBCOIN_estado_supervisao_7
//  250       }
//  251     }
//  252   }
//  253   else{
//  254     if(SMDBCOIN_contador_timeout)
??SMDBCOIN_estado_supervisao_6:
        LDR.N    R0,??DataTable5_6
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_supervisao_8
//  255       SMDBCOIN_contador_timeout--;
        LDR.N    R0,??DataTable5_6
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable5_6
        STRH     R0,[R1, #+0]
        B.N      ??SMDBCOIN_estado_supervisao_7
//  256     else
//  257       return COIN_OFFLINE;
??SMDBCOIN_estado_supervisao_8:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_supervisao_1
//  258   }
//  259   
//  260   return estado;
??SMDBCOIN_estado_supervisao_7:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_supervisao_1:
        POP      {R1-R7,PC}       ;; return
          CFI EndBlock cfiBlock5
//  261 }
//  262 /***********************************************************************************
//  263 *       Descrição       :       Estado em que o moedeiro está offline
//  264 *       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
//  265 *       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
//  266 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SMDBCOIN_estado_offline
        THUMB
//  267 eCOIN_SM_STATE SMDBCOIN_estado_offline(eCOIN_SM_STATE estado){
SMDBCOIN_estado_offline:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  268   unsigned char flag;
//  269   
//  270   PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  271   
//  272   if(!flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_offline_0
//  273     return COIN_DISABLED;
        MOVS     R0,#+0
        B.N      ??SMDBCOIN_estado_offline_1
//  274   
//  275   if(MDBCOIN_get_device()==MDB_OK)
??SMDBCOIN_estado_offline_0:
          CFI FunCall MDBCOIN_get_device
        BL       MDBCOIN_get_device
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_offline_2
//  276     return COIN_DISABLED;
        MOVS     R0,#+0
        B.N      ??SMDBCOIN_estado_offline_1
//  277       
//  278   return estado;
??SMDBCOIN_estado_offline_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_offline_1:
        POP      {R1,R2,R4,PC}    ;; return
          CFI EndBlock cfiBlock6
//  279 }
//  280 /***********************************************************************************
//  281 *       Descrição       :       Verifica se há conectivadade do moedeiro
//  282 *       Parametros      :       nenhum
//  283 *       Retorno         :       nenhum
//  284 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SMDBCOIN_verifica_net_status
          CFI NoCalls
        THUMB
//  285 unsigned char SMDBCOIN_verifica_net_status(void){
//  286   
//  287   if(SMDBCOIN_estado_atual != COIN_OFFLINE)
SMDBCOIN_verifica_net_status:
        LDR.N    R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BEQ.N    ??SMDBCOIN_verifica_net_status_0
//  288     return 1;
        MOVS     R0,#+1
        B.N      ??SMDBCOIN_verifica_net_status_1
//  289   
//  290   return 0;
??SMDBCOIN_verifica_net_status_0:
        MOVS     R0,#+0
??SMDBCOIN_verifica_net_status_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  291 }

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

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     SMDBCOIN_lock_coin

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  292 /***********************************************************************************
//  293 *       Fim do arquivo
//  294 ***********************************************************************************/
// 
//  24 bytes in section .bss
//  20 bytes in section .rodata
// 616 bytes in section .text
// 
// 616 bytes of CODE  memory
//  20 bytes of CONST memory
//  24 bytes of DATA  memory
//
//Errors: none
//Warnings: none
