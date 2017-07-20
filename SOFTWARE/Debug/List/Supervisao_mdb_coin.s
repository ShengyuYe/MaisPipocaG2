///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  11:07:13 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Pagamentos\Supervisao_mdb_coin. /
//                    c                                                       /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Pagamentos\Supervisao_mdb_coin. /
//                    c -lC C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\ /
//                    MaisPipocaG2\SOFTWARE\Debug\List\ -lA                   /
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
//                    pocaG2\SOFTWARE\Debug\List\Supervisao_mdb_coin.s        /
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
        EXTERN MDBCOIN_poll
        EXTERN MDBCOIN_reset_device
        EXTERN PAGAMENTOS_adiciona_valores
        EXTERN PARAMETROS_le
        EXTERN vTaskDelay

        PUBLIC SMDBCOIN_contador_timeout
        PUBLIC SMDBCOIN_estado_atual
        PUBLIC SMDBCOIN_estado_bloqueado
        PUBLIC SMDBCOIN_estado_desabilitado
        PUBLIC SMDBCOIN_estado_offline
        PUBLIC SMDBCOIN_estado_reset
        PUBLIC SMDBCOIN_estado_supervisao
        PUBLIC SMDBCOIN_flag_bloqueio
        PUBLIC SMDBCOIN_func_table
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\Pagamentos\Supervisao_mdb_coin.c
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

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {5, 10, 25, 50, 100}>`:
        DATA
        DC8 5, 10, 25, 50, 100, 0, 0, 0
//   61 
//   62 /***********************************************************************************
//   63 *       Funções locais
//   64 ***********************************************************************************/
//   65 eCOIN_SM_STATE SMDBCOIN_estado_desabilitado(eCOIN_SM_STATE estado);
//   66 eCOIN_SM_STATE SMDBCOIN_estado_reset(eCOIN_SM_STATE estado);
//   67 eCOIN_SM_STATE SMDBCOIN_estado_bloqueado(eCOIN_SM_STATE estado);
//   68 eCOIN_SM_STATE SMDBCOIN_estado_supervisao(eCOIN_SM_STATE estado);
//   69 eCOIN_SM_STATE SMDBCOIN_estado_offline(eCOIN_SM_STATE estado);
//   70 
//   71 /***********************************************************************************
//   72 *       Tabela de funções
//   73 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   74 eCOIN_SM_STATE(*const SMDBCOIN_func_table[])(eCOIN_SM_STATE)={
SMDBCOIN_func_table:
        DATA
        DC32 SMDBCOIN_estado_desabilitado, SMDBCOIN_estado_reset
        DC32 SMDBCOIN_estado_bloqueado, SMDBCOIN_estado_supervisao
        DC32 SMDBCOIN_estado_offline
//   75   [COIN_DISABLED]    = SMDBCOIN_estado_desabilitado,
//   76   [COIN_RESET_STATE] = SMDBCOIN_estado_reset,
//   77   [COIN_LOCKED]      = SMDBCOIN_estado_bloqueado,
//   78   [COIN_SUPERVISAO]  = SMDBCOIN_estado_supervisao,
//   79   [COIN_OFFLINE]     = SMDBCOIN_estado_offline
//   80 };
//   81 /***********************************************************************************
//   82 *       Funções locais
//   83 ***********************************************************************************/
//   84 
//   85 
//   86 /***********************************************************************************
//   87 *       Implementação das funções
//   88 ***********************************************************************************/
//   89 
//   90 /***********************************************************************************
//   91 *       Descrição       :       Setter para o flag bloqueio 
//   92 *       Parametros      :       (unsigned char) flag
//   93 *       Retorno         :       nenhum
//   94 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SMDBCOIN_set_flag_bloqueio
          CFI NoCalls
        THUMB
//   95 void SMDBCOIN_set_flag_bloqueio(unsigned char flag){
//   96   
//   97   SMDBCOIN_flag_bloqueio = flag;
SMDBCOIN_set_flag_bloqueio:
        LDR.N    R1,??DataTable5
        STRB     R0,[R1, #+0]
//   98 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   99 /***********************************************************************************
//  100 *       Descrição       :       Função principal da supervisão
//  101 *                               do moedeiro
//  102 *       Parametros      :       nenhum
//  103 *       Retorno         :       nenhum
//  104 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SMDBCOIN_tick
        THUMB
//  105 void SMDBCOIN_tick(void){
SMDBCOIN_tick:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  106   
//  107   SMDBCOIN_estado_atual = SMDBCOIN_func_table[SMDBCOIN_estado_atual](SMDBCOIN_estado_atual);
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
//  108 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  109 /***********************************************************************************
//  110 *       Descrição       :       Estado onde o moedeiro está
//  111 *                               desabilitado
//  112 *       Parametros      :       (eCOIN_SM_STATE) estado atual
//  113 *                                                       do moedeiro
//  114 *       Retorno         :       (eCOIN_SM_STATE) novo estado
//  115 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SMDBCOIN_estado_desabilitado
        THUMB
//  116 eCOIN_SM_STATE SMDBCOIN_estado_desabilitado(eCOIN_SM_STATE estado){
SMDBCOIN_estado_desabilitado:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  117   unsigned char flag;
//  118   
//  119   PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  120   
//  121   if(flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_desabilitado_0
//  122     return COIN_LOCKED;
        MOVS     R0,#+2
        B.N      ??SMDBCOIN_estado_desabilitado_1
//  123   
//  124   return estado;
??SMDBCOIN_estado_desabilitado_0:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_desabilitado_1:
        POP      {R1,R2,R4,PC}    ;; return
          CFI EndBlock cfiBlock2
//  125 }
//  126 /***********************************************************************************
//  127 *       Descrição       :       Estado onde é realizado o reset do moedeiro
//  128 *       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
//  129 *       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
//  130 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SMDBCOIN_estado_reset
        THUMB
//  131 eCOIN_SM_STATE SMDBCOIN_estado_reset(eCOIN_SM_STATE estado){
SMDBCOIN_estado_reset:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  132   unsigned char tentativas=10;
        MOVS     R5,#+10
//  133   eMDB_reply flag;
//  134   
//  135   do flag = MDBCOIN_reset_device();   
??SMDBCOIN_estado_reset_0:
          CFI FunCall MDBCOIN_reset_device
        BL       MDBCOIN_reset_device
//  136   while(flag!=MDB_OK && tentativas--);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_reset_1
        MOVS     R1,R5
        SUBS     R5,R1,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??SMDBCOIN_estado_reset_0
//  137   
//  138   if(flag==MDB_OK){
??SMDBCOIN_estado_reset_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_reset_2
//  139     tentativas = 10;
        MOVS     R5,#+10
//  140     do flag = MDBCOIN_coin_type_setup(0x0F,0x0F);
??SMDBCOIN_estado_reset_3:
        MOVS     R1,#+15
        MOVS     R0,#+15
          CFI FunCall MDBCOIN_coin_type_setup
        BL       MDBCOIN_coin_type_setup
//  141     while(flag!=MDB_OK && tentativas--);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_reset_4
        MOVS     R1,R5
        SUBS     R5,R1,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??SMDBCOIN_estado_reset_3
//  142     if(flag==MDB_OK){
??SMDBCOIN_estado_reset_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_reset_5
//  143       SMDBCOIN_contador_timeout = 10;
        LDR.N    R0,??DataTable5_3
        MOVS     R1,#+10
        STRH     R1,[R0, #+0]
//  144       return COIN_SUPERVISAO;       
        MOVS     R0,#+3
        B.N      ??SMDBCOIN_estado_reset_6
//  145     }
//  146     else
//  147       return COIN_OFFLINE;
??SMDBCOIN_estado_reset_5:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_reset_6
//  148     
//  149   }  
//  150   
//  151   return estado;
??SMDBCOIN_estado_reset_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_reset_6:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock3
//  152 }
//  153 /***********************************************************************************
//  154 *       Descrição       :       Estado onde o moedeiro está bloqueado
//  155 *       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
//  156 *       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
//  157 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SMDBCOIN_estado_bloqueado
        THUMB
//  158 eCOIN_SM_STATE SMDBCOIN_estado_bloqueado(eCOIN_SM_STATE estado){  
SMDBCOIN_estado_bloqueado:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  159   unsigned char flag;
//  160   
//  161   PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  162   
//  163   if(!flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_bloqueado_0
//  164     return COIN_DISABLED;
        MOVS     R0,#+0
        B.N      ??SMDBCOIN_estado_bloqueado_1
//  165   
//  166   unsigned char tentativas=5;
??SMDBCOIN_estado_bloqueado_0:
        MOVS     R5,#+5
//  167   eMDB_reply ack;
//  168   
//  169   do ack = MDBCOIN_get_device();
??SMDBCOIN_estado_bloqueado_2:
          CFI FunCall MDBCOIN_get_device
        BL       MDBCOIN_get_device
//  170   while(ack!=MDB_OK && tentativas--);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_bloqueado_3
        MOVS     R1,R5
        SUBS     R5,R1,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??SMDBCOIN_estado_bloqueado_2
//  171   
//  172   if(ack==MDB_OK){
??SMDBCOIN_estado_bloqueado_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_bloqueado_4
//  173     if(!SMDBCOIN_flag_bloqueio)
        LDR.N    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_bloqueado_5
//  174       return COIN_RESET_STATE;         
        MOVS     R0,#+1
        B.N      ??SMDBCOIN_estado_bloqueado_1
//  175     SMDBCOIN_contador_timeout = RELOAD_COIN_TIMEOUT;      
??SMDBCOIN_estado_bloqueado_5:
        LDR.N    R0,??DataTable5_3
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
//  176   }
//  177   else{
//  178     if(SMDBCOIN_contador_timeout)
//  179       SMDBCOIN_contador_timeout--;
//  180     else
//  181       return COIN_OFFLINE;
//  182   }
//  183   
//  184   return estado;
??SMDBCOIN_estado_bloqueado_6:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_bloqueado_1:
        POP      {R1,R4,R5,PC}    ;; return
??SMDBCOIN_estado_bloqueado_4:
        LDR.N    R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_bloqueado_7
        LDR.N    R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable5_3
        STRH     R0,[R1, #+0]
        B.N      ??SMDBCOIN_estado_bloqueado_6
??SMDBCOIN_estado_bloqueado_7:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_bloqueado_1
          CFI EndBlock cfiBlock4
//  185 }
//  186 /***********************************************************************************
//  187 *       Descrição       :       Estado onde realiza a supervisão do moedeiro
//  188 *       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
//  189 *       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
//  190 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SMDBCOIN_estado_supervisao
        THUMB
//  191 eCOIN_SM_STATE SMDBCOIN_estado_supervisao(eCOIN_SM_STATE estado){
SMDBCOIN_estado_supervisao:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
        MOVS     R4,R0
//  192   unsigned char flag;
//  193   eMDB_COIN_POOL_TYPE tipo_pacote;
//  194   eMDB_COIN_POOL_STATUS status_pacote;
//  195   unsigned char tipo_moeda;
//  196   unsigned char quantidade_tubo;  
//  197   const unsigned char valores[]={5,10,25,50,100};
        ADD      R0,SP,#+8
        LDR.N    R1,??DataTable5_4
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  198   eMDB_reply ack;
//  199   unsigned char tentativas=10;
        MOVS     R5,#+10
//  200   
//  201   PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);    
        ADD      R1,SP,#+2
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  202   if(!flag)
        LDRB     R0,[SP, #+2]
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_supervisao_0
//  203     return COIN_DISABLED;
        MOVS     R0,#+0
        B.N      ??SMDBCOIN_estado_supervisao_1
//  204   if(SMDBCOIN_flag_bloqueio){
??SMDBCOIN_estado_supervisao_0:
        LDR.N    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_supervisao_2
//  205     
//  206     do ack = MDBCOIN_reset_device();   
??SMDBCOIN_estado_supervisao_3:
          CFI FunCall MDBCOIN_reset_device
        BL       MDBCOIN_reset_device
//  207     while(ack!=MDB_OK && tentativas--);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_supervisao_4
        MOVS     R1,R5
        SUBS     R5,R1,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??SMDBCOIN_estado_supervisao_3
//  208     
//  209     if(ack==MDB_OK)
??SMDBCOIN_estado_supervisao_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_supervisao_5
//  210       return COIN_LOCKED;
        MOVS     R0,#+2
        B.N      ??SMDBCOIN_estado_supervisao_1
//  211     else
//  212       return COIN_OFFLINE;
??SMDBCOIN_estado_supervisao_5:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_supervisao_1
//  213   }
//  214 
//  215   if(MDBCOIN_poll(&tipo_pacote,&status_pacote,&tipo_moeda,&quantidade_tubo)==MDB_OK){
??SMDBCOIN_estado_supervisao_2:
        ADD      R3,SP,#+3
        ADD      R2,SP,#+1
        ADD      R1,SP,#+4
        ADD      R0,SP,#+0
          CFI FunCall MDBCOIN_poll
        BL       MDBCOIN_poll
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_supervisao_6
//  216     
//  217     SMDBCOIN_contador_timeout = RELOAD_COIN_TIMEOUT;     
        LDR.N    R0,??DataTable5_3
        MOVW     R1,#+30000
        STRH     R1,[R0, #+0]
//  218     if(tipo_pacote==COIN_DEPOSITED){
        LDRB     R0,[SP, #+0]
        CMP      R0,#+1
        BNE.N    ??SMDBCOIN_estado_supervisao_7
//  219       //Aqui dentro é onde vem
//  220       // o valor da moeda para somar ao pagamento
//  221       unsigned short int valor = valores[tipo_moeda];
        LDRB     R0,[SP, #+1]
        ADD      R1,SP,#+8
        LDRB     R0,[R0, R1]
//  222       PAGAMENTOS_adiciona_valores(valor);
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_adiciona_valores
        BL       PAGAMENTOS_adiciona_valores
//  223       tipo_pacote = COIN_STATUS;
        MOVS     R0,#+2
        STRB     R0,[SP, #+0]
//  224       vTaskDelay(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  225     }
//  226   }
//  227   else{
//  228     if(SMDBCOIN_contador_timeout)
//  229       SMDBCOIN_contador_timeout--;
//  230     else
//  231       return COIN_OFFLINE;
//  232   }
//  233   
//  234   return estado;
??SMDBCOIN_estado_supervisao_7:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_supervisao_1:
        ADD      SP,SP,#+20
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI CFA R13+32
??SMDBCOIN_estado_supervisao_6:
        LDR.N    R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBCOIN_estado_supervisao_8
        LDR.N    R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable5_3
        STRH     R0,[R1, #+0]
        B.N      ??SMDBCOIN_estado_supervisao_7
??SMDBCOIN_estado_supervisao_8:
        MOVS     R0,#+4
        B.N      ??SMDBCOIN_estado_supervisao_1
          CFI EndBlock cfiBlock5
//  235 }
//  236 /***********************************************************************************
//  237 *       Descrição       :       Estado em que o moedeiro está offline
//  238 *       Parametros      :       (eCOIN_SM_STATE) estado atual do moedeiro
//  239 *       Retorno         :       (eCOIN_SM_STATE) novo estado do moedeiro
//  240 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SMDBCOIN_estado_offline
        THUMB
//  241 eCOIN_SM_STATE SMDBCOIN_estado_offline(eCOIN_SM_STATE estado){
SMDBCOIN_estado_offline:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  242   unsigned char flag;
//  243   
//  244   PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  245   
//  246   if(!flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_offline_0
//  247     return COIN_DISABLED;
        MOVS     R0,#+0
        B.N      ??SMDBCOIN_estado_offline_1
//  248   
//  249   if(MDBCOIN_get_device()==MDB_OK)
??SMDBCOIN_estado_offline_0:
          CFI FunCall MDBCOIN_get_device
        BL       MDBCOIN_get_device
        CMP      R0,#+0
        BNE.N    ??SMDBCOIN_estado_offline_2
//  250     return COIN_DISABLED;
        MOVS     R0,#+0
        B.N      ??SMDBCOIN_estado_offline_1
//  251       
//  252   return estado;
??SMDBCOIN_estado_offline_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SMDBCOIN_estado_offline_1:
        POP      {R1,R2,R4,PC}    ;; return
          CFI EndBlock cfiBlock6
//  253 }
//  254 /***********************************************************************************
//  255 *       Descrição       :       Verifica se há conectivadade do moedeiro
//  256 *       Parametros      :       nenhum
//  257 *       Retorno         :       nenhum
//  258 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SMDBCOIN_verifica_net_status
          CFI NoCalls
        THUMB
//  259 unsigned char SMDBCOIN_verifica_net_status(void){
//  260   
//  261   if(SMDBCOIN_estado_atual != COIN_OFFLINE)
SMDBCOIN_verifica_net_status:
        LDR.N    R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BEQ.N    ??SMDBCOIN_verifica_net_status_0
//  262     return 1;
        MOVS     R0,#+1
        B.N      ??SMDBCOIN_verifica_net_status_1
//  263   
//  264   return 0;
??SMDBCOIN_verifica_net_status_0:
        MOVS     R0,#+0
??SMDBCOIN_verifica_net_status_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  265 }

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
        DC32     SMDBCOIN_contador_timeout

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     `?<Constant {5, 10, 25, 50, 100}>`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  266 /***********************************************************************************
//  267 *       Fim do arquivo
//  268 ***********************************************************************************/
// 
//   4 bytes in section .bss
//  28 bytes in section .rodata
// 508 bytes in section .text
// 
// 508 bytes of CODE  memory
//  28 bytes of CONST memory
//   4 bytes of DATA  memory
//
//Errors: none
//Warnings: none
