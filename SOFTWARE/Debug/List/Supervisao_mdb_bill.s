///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     14/Sep/2017  13:22:56 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamento /
//                    s\Supervisao_mdb_bill.c                                 /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamento /
//                    s\Supervisao_mdb_bill.c -lC                             /
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
//                    isao_mdb_bill.s                                         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Supervisao_mdb_bill

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN MDBAURT_sleep
        EXTERN MDBILL_get_poll_from_device
        EXTERN MDBILL_get_setup_from_device
        EXTERN MDBILL_reset_device
        EXTERN MDBILL_send_escrow_command
        EXTERN MDBILL_set_bill_type_on_device
        EXTERN MDBILL_verifica_dispositivo
        EXTERN PAGAMENTOS_adiciona_valores
        EXTERN PARAMETROS_le

        PUBLIC MDBILL_funcs
        PUBLIC SMDBILL_bloqueio
        PUBLIC SMDBILL_capacidade_stacker
        PUBLIC SMDBILL_casas_decimais
        PUBLIC SMDBILL_country
        PUBLIC SMDBILL_envia_comando_scroll
        PUBLIC SMDBILL_escala
        PUBLIC SMDBILL_estado_atual
        PUBLIC SMDBILL_estado_bloqueado
        PUBLIC SMDBILL_estado_desabilitado
        PUBLIC SMDBILL_estado_falha_dispositivo
        PUBLIC SMDBILL_estado_inicializa
        PUBLIC SMDBILL_estado_offline
        PUBLIC SMDBILL_estado_reset
        PUBLIC SMDBILL_estado_supervisao
        PUBLIC SMDBILL_eventos
        PUBLIC SMDBILL_get_contador_timeout
        PUBLIC SMDBILL_get_net_status
        PUBLIC SMDBILL_nivel_seguranca
        PUBLIC SMDBILL_reset_counter
        PUBLIC SMDBILL_scroll_capacide
        PUBLIC SMDBILL_set_bloqueio
        PUBLIC SMDBILL_tick
        PUBLIC SMDBILL_time_out
        PUBLIC SMDBILL_trata_eventos
        PUBLIC SMDBILL_valor_canais
        
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamentos\Supervisao_mdb_bill.c
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
//   17 |       Arquivo            :  supervisao_mdb_bill.c
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
//   37 #include "supervisao_mdb_bill.h"
//   38 
//   39 /***********************************************************************************
//   40 *       Definições
//   41 ***********************************************************************************/
//   42 #define RELOAD_TIMEOUT_BILL                     100
//   43 #define CICLOS_RESET                            2
//   44 /***********************************************************************************
//   45 *       Variaveis locais
//   46 ***********************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   47 unsigned char SMDBILL_bloqueio=0xFF;
SMDBILL_bloqueio:
        DATA
        DC8 255
//   48 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   49 unsigned short SMDBILL_time_out=0;
SMDBILL_time_out:
        DS8 2
//   50 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   51 eBILL_POLL_STATE SMDBILL_estado_atual=BILL_DESABILITADO;
SMDBILL_estado_atual:
        DS8 1
//   52 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   53 sBILL_event SMDBILL_eventos[16];
SMDBILL_eventos:
        DS8 32
//   54 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   55 unsigned char SMDBILL_valor_canais[16]={1,2,5,10,20,50,100,7};
SMDBILL_valor_canais:
        DATA
        DC8 1, 2, 5, 10, 20, 50, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0
//   56 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   57 unsigned short int SMDBILL_country;
SMDBILL_country:
        DS8 2
//   58 

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   59 unsigned short int SMDBILL_escala=1;
SMDBILL_escala:
        DATA
        DC16 1
//   60 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   61 unsigned char SMDBILL_casas_decimais;
SMDBILL_casas_decimais:
        DS8 1
//   62 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   63 unsigned short int SMDBILL_capacidade_stacker;
SMDBILL_capacidade_stacker:
        DS8 2
//   64 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   65 unsigned char SMDBILL_scroll_capacide;
SMDBILL_scroll_capacide:
        DS8 1
//   66 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   67 unsigned short int SMDBILL_nivel_seguranca;
SMDBILL_nivel_seguranca:
        DS8 2
//   68 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   69 unsigned char SMDBILL_reset_counter=CICLOS_RESET;
SMDBILL_reset_counter:
        DATA
        DC8 2
//   70 
//   71 /***********************************************************************************
//   72 *       Funções locais
//   73 ***********************************************************************************/
//   74 eBILL_POLL_STATE SMDBILL_estado_desabilitado(eBILL_POLL_STATE estado);
//   75 
//   76 eBILL_POLL_STATE SMDBILL_estado_bloqueado(eBILL_POLL_STATE estado);
//   77 
//   78 eBILL_POLL_STATE SMDBILL_estado_reset(eBILL_POLL_STATE estado);
//   79 
//   80 eBILL_POLL_STATE SMDBILL_estado_inicializa(eBILL_POLL_STATE estado);
//   81 
//   82 eBILL_POLL_STATE SMDBILL_estado_supervisao(eBILL_POLL_STATE estado);
//   83 
//   84 eBILL_POLL_STATE SMDBILL_estado_offline(eBILL_POLL_STATE estado);
//   85 
//   86 eBILL_POLL_STATE SMDBILL_estado_falha_dispositivo(eBILL_POLL_STATE estado);
//   87 
//   88 unsigned char SMDBILL_trata_eventos(unsigned char quantidade);
//   89 
//   90 unsigned char SMDBILL_envia_comando_scroll(void);
//   91 
//   92 /***********************************************************************************
//   93 *       tabela de funções
//   94 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   95 eBILL_POLL_STATE(*const MDBILL_funcs[])(eBILL_POLL_STATE)={
MDBILL_funcs:
        DATA
        DC32 SMDBILL_estado_desabilitado, SMDBILL_estado_bloqueado
        DC32 SMDBILL_estado_reset, SMDBILL_estado_inicializa
        DC32 SMDBILL_estado_supervisao, SMDBILL_estado_offline
        DC32 SMDBILL_estado_falha_dispositivo
//   96   SMDBILL_estado_desabilitado,
//   97   SMDBILL_estado_bloqueado,
//   98   SMDBILL_estado_reset,
//   99   SMDBILL_estado_inicializa,
//  100   SMDBILL_estado_supervisao,
//  101   SMDBILL_estado_offline,
//  102   SMDBILL_estado_falha_dispositivo
//  103 };
//  104 
//  105 /***********************************************************************************
//  106 *       Implementação das funções
//  107 ***********************************************************************************/
//  108 
//  109 /***********************************************************************************
//  110 *       Descrição       :       Setter para o flag de bloqueio da máquina
//  111 *                               de estados que indica que o dispositivo
//  112 *                               deve ser inibido
//  113 *       Parametros      :       (unsigned char) flag
//  114 *       Retorno         :       nenhum
//  115 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SMDBILL_set_bloqueio
          CFI NoCalls
        THUMB
//  116 void SMDBILL_set_bloqueio(unsigned char bloqueio){
//  117   
//  118   SMDBILL_bloqueio = bloqueio;
SMDBILL_set_bloqueio:
        LDR.W    R1,??DataTable9
        STRB     R0,[R1, #+0]
//  119 
//  120 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  121 /***********************************************************************************
//  122 *       Descrição       :       Função principal da máquiina de estados da
//  123 *                               supervisão do noteiro MDB
//  124 *       Parametros      :       nenhum
//  125 *       Retorno         :       nenhum
//  126 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SMDBILL_tick
        THUMB
//  127 void SMDBILL_tick(void){
SMDBILL_tick:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  128   
//  129   SMDBILL_estado_atual = MDBILL_funcs[SMDBILL_estado_atual](SMDBILL_estado_atual);  
        LDR.W    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable9_1
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable9_2
        LDR      R1,[R2, R1, LSL #+2]
          CFI FunCall
        BLX      R1
        LDR.W    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
//  130 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  131 /***********************************************************************************
//  132 *       Descrição       :       Função para o estado onde o noteiro
//  133 *                               está desabilitado
//  134 *       Parametros      :       (eBILL_POLL_STATE) estado atual
//  135 *       Retorno         :       (eBILL_POLL_STATE) novo estado
//  136 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SMDBILL_estado_desabilitado
        THUMB
//  137 eBILL_POLL_STATE SMDBILL_estado_desabilitado(eBILL_POLL_STATE estado){
SMDBILL_estado_desabilitado:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  138   unsigned char flag;
//  139   
//  140   PARAMETROS_le(ADR_FLAG_MDB_BIL,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+4
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  141   
//  142   if(flag)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBILL_estado_desabilitado_0
//  143     return BILL_BLOQUEADO;
        MOVS     R0,#+1
        B.N      ??SMDBILL_estado_desabilitado_1
//  144   
//  145   
//  146   return BILL_DESABILITADO;  
??SMDBILL_estado_desabilitado_0:
        MOVS     R0,#+0
??SMDBILL_estado_desabilitado_1:
        POP      {R1,R2,R4,PC}    ;; return
          CFI EndBlock cfiBlock2
//  147 }
//  148 /***********************************************************************************
//  149 *       Descrição       :       Função para o estado onde o noteiro está
//  150 *                               bloqueado
//  151 *       Parametros      :       (eBILL_POLL_STATE) estado atual
//  152 *       Retorno         :       (eBILL_POLL_STATE) novo estado
//  153 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SMDBILL_estado_bloqueado
        THUMB
//  154 eBILL_POLL_STATE SMDBILL_estado_bloqueado(eBILL_POLL_STATE estado){
SMDBILL_estado_bloqueado:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R4,R0
//  155   unsigned char tentativas=5;
        MOVS     R5,#+5
//  156   eMDB_reply flag;    
//  157   
//  158   SMDBILL_reset_counter=CICLOS_RESET;
        LDR.W    R0,??DataTable9_3
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  159   
//  160   if(MDBILL_verifica_dispositivo()==MDB_OK){
          CFI FunCall MDBILL_verifica_dispositivo
        BL       MDBILL_verifica_dispositivo
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_bloqueado_0
//  161     SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
        LDR.W    R0,??DataTable9_4
        MOVS     R1,#+100
        STRH     R1,[R0, #+0]
//  162     
//  163     do{
//  164       flag = MDBILL_set_bill_type_on_device(0,0);
??SMDBILL_estado_bloqueado_1:
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall MDBILL_set_bill_type_on_device
        BL       MDBILL_set_bill_type_on_device
        MOVS     R6,R0
//  165       MDBAURT_sleep(1);
        MOVS     R0,#+1
          CFI FunCall MDBAURT_sleep
        BL       MDBAURT_sleep
//  166     
//  167       if(SMDBILL_time_out)
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBILL_estado_bloqueado_2
//  168         SMDBILL_time_out--;      
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable9_4
        STRH     R0,[R1, #+0]
//  169     }
//  170     while(flag!=MDB_OK && --tentativas);
??SMDBILL_estado_bloqueado_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SMDBILL_estado_bloqueado_3
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_bloqueado_1
//  171     
//  172     if(!SMDBILL_time_out)
??SMDBILL_estado_bloqueado_3:
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_bloqueado_4
//  173       return BILL_OFFLINE;
        MOVS     R0,#+5
        B.N      ??SMDBILL_estado_bloqueado_5
//  174     else
//  175       SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
??SMDBILL_estado_bloqueado_4:
        LDR.W    R0,??DataTable9_4
        MOVS     R1,#+100
        STRH     R1,[R0, #+0]
//  176     
//  177     unsigned char enb;  
//  178     // Pula para o desabilitado
//  179     // caso não esteja habilitado
//  180     PARAMETROS_le(ADR_FLAG_MDB_BIL,(void*)&enb);
        ADD      R1,SP,#+0
        MOVS     R0,#+4
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  181     if(!enb)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_bloqueado_6
//  182       return BILL_DESABILITADO; 
        MOVS     R0,#+0
        B.N      ??SMDBILL_estado_bloqueado_5
//  183   
//  184     if(flag!=MDB_OK)
??SMDBILL_estado_bloqueado_6:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SMDBILL_estado_bloqueado_7
//  185       return BILL_OFFLINE;     
        MOVS     R0,#+5
        B.N      ??SMDBILL_estado_bloqueado_5
//  186     
//  187     if(!SMDBILL_bloqueio)
??SMDBILL_estado_bloqueado_7:
        LDR.W    R0,??DataTable9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_bloqueado_8
//  188       return BILL_RESET_AND_CHECK;
        MOVS     R0,#+2
        B.N      ??SMDBILL_estado_bloqueado_5
//  189   }
//  190   else{
//  191     if(SMDBILL_time_out)
??SMDBILL_estado_bloqueado_0:
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBILL_estado_bloqueado_9
//  192       SMDBILL_time_out--;
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable9_4
        STRH     R0,[R1, #+0]
        B.N      ??SMDBILL_estado_bloqueado_8
//  193     else
//  194       return BILL_OFFLINE;
??SMDBILL_estado_bloqueado_9:
        MOVS     R0,#+5
        B.N      ??SMDBILL_estado_bloqueado_5
//  195   }  
//  196   
//  197   return BILL_BLOQUEADO;
??SMDBILL_estado_bloqueado_8:
        MOVS     R0,#+1
??SMDBILL_estado_bloqueado_5:
        POP      {R1,R2,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock3
//  198 }
//  199 /***********************************************************************************
//  200 *       Descrição       :       Função para o teste de reset
//  201 *       Parametros      :       (eBILL_POLL_STATE) estado atual
//  202 *       Retorno         :       (eBILL_POLL_STATE) novo estado
//  203 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SMDBILL_estado_reset
        THUMB
//  204 eBILL_POLL_STATE SMDBILL_estado_reset(eBILL_POLL_STATE estado){
SMDBILL_estado_reset:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R4,R0
//  205   unsigned char tentativas=5;
        MOVS     R5,#+5
//  206   eMDB_reply flag;
//  207   
//  208   do{
//  209     
//  210     flag = MDBILL_reset_device();
??SMDBILL_estado_reset_0:
          CFI FunCall MDBILL_reset_device
        BL       MDBILL_reset_device
        MOVS     R6,R0
//  211     MDBAURT_sleep(1);
        MOVS     R0,#+1
          CFI FunCall MDBAURT_sleep
        BL       MDBAURT_sleep
//  212     
//  213     if(SMDBILL_time_out)
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBILL_estado_reset_1
//  214       SMDBILL_time_out--;
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable9_4
        STRH     R0,[R1, #+0]
//  215     
//  216   }
//  217   while(flag!=MDB_OK && --tentativas);
??SMDBILL_estado_reset_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SMDBILL_estado_reset_2
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_reset_0
//  218   
//  219   // Recomeça o ciclo de timeout se não chegou a zero
//  220   // ou então vai pra o estado bloqueado caso chegou
//  221   if(!SMDBILL_time_out)
??SMDBILL_estado_reset_2:
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_reset_3
//  222     return BILL_BLOQUEADO;
        MOVS     R0,#+1
        B.N      ??SMDBILL_estado_reset_4
//  223   else
//  224     SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
??SMDBILL_estado_reset_3:
        LDR.W    R0,??DataTable9_4
        MOVS     R1,#+100
        STRH     R1,[R0, #+0]
//  225     
//  226   // O reset ocorreu com sucesso
//  227   if(flag==MDB_OK){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??SMDBILL_estado_reset_5
//  228     
//  229     unsigned char tamanho;
//  230     tentativas = 5;
        MOVS     R0,#+5
        MOVS     R5,R0
//  231     
//  232     do{       
//  233        flag = MDBILL_get_poll_from_device((sBILL_event*)SMDBILL_eventos,&tamanho);
??SMDBILL_estado_reset_6:
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable9_5
          CFI FunCall MDBILL_get_poll_from_device
        BL       MDBILL_get_poll_from_device
        MOVS     R6,R0
//  234        MDBAURT_sleep(10);
        MOVS     R0,#+10
          CFI FunCall MDBAURT_sleep
        BL       MDBAURT_sleep
//  235     
//  236        if(SMDBILL_time_out)
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBILL_estado_reset_7
//  237          SMDBILL_time_out--;                  
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable9_4
        STRH     R0,[R1, #+0]
//  238     }
//  239     while(flag!=MDB_OK && --tentativas);
??SMDBILL_estado_reset_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SMDBILL_estado_reset_8
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_reset_6
//  240     
//  241     
//  242     if(!SMDBILL_time_out)
??SMDBILL_estado_reset_8:
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_reset_9
//  243       return BILL_BLOQUEADO;
        MOVS     R0,#+1
        B.N      ??SMDBILL_estado_reset_4
//  244     else
//  245       SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
??SMDBILL_estado_reset_9:
        LDR.W    R0,??DataTable9_4
        MOVS     R1,#+100
        STRH     R1,[R0, #+0]
//  246     
//  247     if(flag==MDB_OK){      
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??SMDBILL_estado_reset_5
//  248         for(unsigned char i=0;i<tamanho;i++)
        MOVS     R0,#+0
??SMDBILL_estado_reset_10:
        LDRB     R1,[SP, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BCS.N    ??SMDBILL_estado_reset_5
//  249           if(SMDBILL_eventos[i].tipo == BILL_STATUS &&  SMDBILL_eventos[i].args == VALIDATOR_WAS_RESET)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable9_5
        LDRB     R1,[R1, R0, LSL #+1]
        CMP      R1,#+0
        BNE.N    ??SMDBILL_estado_reset_11
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable9_5
        ADDS     R1,R1,R0, LSL #+1
        LDRB     R1,[R1, #+1]
        CMP      R1,#+6
        BNE.N    ??SMDBILL_estado_reset_11
//  250             return BILL_INICIALIZA;
        MOVS     R0,#+3
        B.N      ??SMDBILL_estado_reset_4
??SMDBILL_estado_reset_11:
        ADDS     R0,R0,#+1
        B.N      ??SMDBILL_estado_reset_10
//  251     }    
//  252   }  
//  253   
//  254   return BILL_RESET_AND_CHECK;
??SMDBILL_estado_reset_5:
        MOVS     R0,#+2
??SMDBILL_estado_reset_4:
        POP      {R1,R2,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock4
//  255 }
//  256 /***********************************************************************************
//  257 *       Descrição       :       Função para o estado onde está inicializando
//  258 *                               o noteiro
//  259 *       Parametros      :       (eBILL_POLL_STATE) estado atual
//  260 *       Retorno         :       (eBILL_POLL_STATE) novo estado
//  261 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SMDBILL_estado_inicializa
        THUMB
//  262 eBILL_POLL_STATE SMDBILL_estado_inicializa(eBILL_POLL_STATE estado){
SMDBILL_estado_inicializa:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+20
          CFI CFA R13+40
        MOVS     R4,R0
//  263   unsigned char tentativas=5;
        MOVS     R5,#+5
//  264   eMDB_reply flag;
//  265   
//  266   // Faz o reset do dispositivo
//  267   do {
//  268     
//  269     flag = MDBILL_reset_device();
??SMDBILL_estado_inicializa_0:
          CFI FunCall MDBILL_reset_device
        BL       MDBILL_reset_device
        MOVS     R6,R0
//  270     
//  271     MDBAURT_sleep(1);
        MOVS     R0,#+1
          CFI FunCall MDBAURT_sleep
        BL       MDBAURT_sleep
//  272     
//  273     if(SMDBILL_time_out)
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBILL_estado_inicializa_1
//  274       SMDBILL_time_out--;
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable9_4
        STRH     R0,[R1, #+0]
//  275     
//  276   }
//  277   while(flag!=MDB_OK && --tentativas);
??SMDBILL_estado_inicializa_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SMDBILL_estado_inicializa_2
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_inicializa_0
//  278   
//  279   // Saída para o caso de não receber
//  280   // comunicação do dispositivo
//  281   if(!SMDBILL_time_out)
??SMDBILL_estado_inicializa_2:
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_inicializa_3
//  282     return BILL_OFFLINE;
        MOVS     R0,#+5
        B.N      ??SMDBILL_estado_inicializa_4
//  283   else
//  284     SMDBILL_time_out = RELOAD_TIMEOUT_BILL;// se recebeu, inicializa o contador
??SMDBILL_estado_inicializa_3:
        LDR.W    R0,??DataTable9_4
        MOVS     R1,#+100
        STRH     R1,[R0, #+0]
//  285   
//  286   if(flag==MDB_OK){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??SMDBILL_estado_inicializa_5
//  287     
//  288     unsigned char notas;
//  289     PARAMETROS_le(ADR_NOTAS,(void*)&notas);    
        ADD      R1,SP,#+16
        MOVS     R0,#+2
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  290     
//  291     unsigned short int notas_i = notas;
        LDRB     R7,[SP, #+16]
//  292     
//  293     tentativas=5;
        MOVS     R0,#+5
        MOVS     R5,R0
//  294     do{
//  295       flag = MDBILL_set_bill_type_on_device(notas_i,notas_i);
??SMDBILL_estado_inicializa_6:
        MOVS     R1,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall MDBILL_set_bill_type_on_device
        BL       MDBILL_set_bill_type_on_device
        MOVS     R6,R0
//  296       
//  297       MDBAURT_sleep(1);
        MOVS     R0,#+1
          CFI FunCall MDBAURT_sleep
        BL       MDBAURT_sleep
//  298       
//  299       if(SMDBILL_time_out)
        LDR.W    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBILL_estado_inicializa_7
//  300         SMDBILL_time_out--;
        LDR.N    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable9_4
        STRH     R0,[R1, #+0]
//  301     }
//  302     while(flag!=MDB_OK && --tentativas);
??SMDBILL_estado_inicializa_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SMDBILL_estado_inicializa_8
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_inicializa_6
//  303     
//  304     if(!SMDBILL_time_out)
??SMDBILL_estado_inicializa_8:
        LDR.N    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_inicializa_9
//  305       return BILL_OFFLINE;    
        MOVS     R0,#+5
        B.N      ??SMDBILL_estado_inicializa_4
//  306     else
//  307       SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
??SMDBILL_estado_inicializa_9:
        LDR.N    R0,??DataTable9_4
        MOVS     R1,#+100
        STRH     R1,[R0, #+0]
//  308     
//  309     tentativas=5;
        MOVS     R0,#+5
        MOVS     R5,R0
//  310     unsigned char nivel;
//  311     
//  312     do{
//  313       
//  314       flag = MDBILL_get_setup_from_device(&nivel,&SMDBILL_country,&SMDBILL_escala,
//  315                                           &SMDBILL_casas_decimais,&SMDBILL_capacidade_stacker,
//  316                                           &SMDBILL_scroll_capacide,&SMDBILL_nivel_seguranca,SMDBILL_valor_canais);
??SMDBILL_estado_inicializa_10:
        LDR.N    R0,??DataTable9_6
        STR      R0,[SP, #+12]
        LDR.N    R0,??DataTable9_7
        STR      R0,[SP, #+8]
        LDR.N    R0,??DataTable9_8
        STR      R0,[SP, #+4]
        LDR.N    R0,??DataTable9_9
        STR      R0,[SP, #+0]
        LDR.N    R3,??DataTable9_10
        LDR.N    R2,??DataTable9_11
        LDR.N    R1,??DataTable9_12
        ADD      R0,SP,#+17
          CFI FunCall MDBILL_get_setup_from_device
        BL       MDBILL_get_setup_from_device
        MOVS     R6,R0
//  317         
//  318       MDBAURT_sleep(1);
        MOVS     R0,#+1
          CFI FunCall MDBAURT_sleep
        BL       MDBAURT_sleep
//  319       
//  320       if(SMDBILL_time_out)
        LDR.N    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBILL_estado_inicializa_11
//  321         SMDBILL_time_out--;
        LDR.N    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable9_4
        STRH     R0,[R1, #+0]
//  322     }
//  323     while(flag!=MDB_OK && --tentativas);
??SMDBILL_estado_inicializa_11:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SMDBILL_estado_inicializa_12
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_inicializa_10
//  324     
//  325     if(!SMDBILL_time_out)
??SMDBILL_estado_inicializa_12:
        LDR.N    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_inicializa_13
//  326       return BILL_OFFLINE;
        MOVS     R0,#+5
        B.N      ??SMDBILL_estado_inicializa_4
//  327     else
//  328       SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
??SMDBILL_estado_inicializa_13:
        LDR.N    R0,??DataTable9_4
        MOVS     R1,#+100
        STRH     R1,[R0, #+0]
//  329     
//  330     if(flag!=MDB_OK){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SMDBILL_estado_inicializa_5
//  331       // Em caso de falha inicializa os canais com zero
//  332       // para evitar crédito em algum
//  333       // evento que receba da serial
//  334       SMDBILL_valor_canais[0]=SMDBILL_valor_canais[1]=SMDBILL_valor_canais[2]=SMDBILL_valor_canais[3]=SMDBILL_valor_canais[4]=SMDBILL_valor_canais[5] = 0x00;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable9_6
        STRB     R0,[R1, #+5]
        LDR.N    R1,??DataTable9_6
        STRB     R0,[R1, #+4]
        LDR.N    R1,??DataTable9_6
        STRB     R0,[R1, #+3]
        LDR.N    R1,??DataTable9_6
        STRB     R0,[R1, #+2]
        LDR.N    R1,??DataTable9_6
        STRB     R0,[R1, #+1]
        LDR.N    R1,??DataTable9_6
        STRB     R0,[R1, #+0]
//  335     }
//  336     
//  337   }
//  338   
//  339   return BILL_SUPERVISAO;  
??SMDBILL_estado_inicializa_5:
        MOVS     R0,#+4
??SMDBILL_estado_inicializa_4:
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock5
//  340 }
//  341 /***********************************************************************************
//  342 *       Descrição       :       Função para a supervisão do noteiro
//  343 *       Parametros      :       (eBILL_POLL_STATE) estado atual
//  344 *       Retorno         :       (eBILL_POLL_STATE) novo estado
//  345 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SMDBILL_estado_supervisao
        THUMB
//  346 eBILL_POLL_STATE SMDBILL_estado_supervisao(eBILL_POLL_STATE estado){
SMDBILL_estado_supervisao:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R4,R0
//  347   unsigned char tentativas=5;
        MOVS     R5,#+5
//  348   eMDB_reply flag;
//  349   unsigned char tamanho;  
//  350   
//  351   do{
//  352     
//  353     flag = MDBILL_get_poll_from_device((sBILL_event*)SMDBILL_eventos,&tamanho);
??SMDBILL_estado_supervisao_0:
        ADD      R1,SP,#+1
        LDR.N    R0,??DataTable9_5
          CFI FunCall MDBILL_get_poll_from_device
        BL       MDBILL_get_poll_from_device
        MOVS     R6,R0
//  354       
//  355     MDBAURT_sleep(1);
        MOVS     R0,#+1
          CFI FunCall MDBAURT_sleep
        BL       MDBAURT_sleep
//  356     
//  357     if(SMDBILL_time_out)
        LDR.N    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBILL_estado_supervisao_1
//  358       SMDBILL_time_out--;
        LDR.N    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable9_4
        STRH     R0,[R1, #+0]
//  359     
//  360   }
//  361   while(flag!=MDB_OK && --tentativas);
??SMDBILL_estado_supervisao_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SMDBILL_estado_supervisao_2
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_supervisao_0
//  362   
//  363   if(!SMDBILL_time_out)
??SMDBILL_estado_supervisao_2:
        LDR.N    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_supervisao_3
//  364     return BILL_OFFLINE;
        MOVS     R0,#+5
        B.N      ??SMDBILL_estado_supervisao_4
//  365   else
//  366     SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
??SMDBILL_estado_supervisao_3:
        LDR.N    R0,??DataTable9_4
        MOVS     R1,#+100
        STRH     R1,[R0, #+0]
//  367   
//  368   if(flag==MDB_OK){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??SMDBILL_estado_supervisao_5
//  369     // Foi recebido eventos pelo sistema
//  370     if(!SMDBILL_trata_eventos(tamanho))
        LDRB     R0,[SP, #+1]
          CFI FunCall SMDBILL_trata_eventos
        BL       SMDBILL_trata_eventos
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_supervisao_6
//  371       return BILL_DESABILITADO;
        MOVS     R0,#+0
        B.N      ??SMDBILL_estado_supervisao_4
//  372   }
//  373   else
//  374     if(flag==MDB_JUST_RESET){
??SMDBILL_estado_supervisao_5:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+3
        BNE.N    ??SMDBILL_estado_supervisao_6
//  375       // Houve um reset
//  376       // do dispositivo
//  377       return BILL_BLOQUEADO;      
        MOVS     R0,#+1
        B.N      ??SMDBILL_estado_supervisao_4
//  378     }
//  379   
//  380   unsigned char habilita;  
//  381   PARAMETROS_le(ADR_FLAG_MDB_BIL,(void*)&habilita);  
??SMDBILL_estado_supervisao_6:
        ADD      R1,SP,#+0
        MOVS     R0,#+4
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  382   if(!habilita)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_supervisao_7
//  383     return BILL_BLOQUEADO;
        MOVS     R0,#+1
        B.N      ??SMDBILL_estado_supervisao_4
//  384   
//  385   if(SMDBILL_bloqueio)
??SMDBILL_estado_supervisao_7:
        LDR.N    R0,??DataTable9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBILL_estado_supervisao_8
//  386     return BILL_BLOQUEADO;
        MOVS     R0,#+1
        B.N      ??SMDBILL_estado_supervisao_4
//  387   
//  388   return BILL_SUPERVISAO;
??SMDBILL_estado_supervisao_8:
        MOVS     R0,#+4
??SMDBILL_estado_supervisao_4:
        POP      {R1,R2,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock6
//  389 }
//  390 /***********************************************************************************
//  391 *       Descrição       :       Função onde o noteiro está offline
//  392 *       Parametros      :       (eBILL_POLL_STATE) estado atual
//  393 *       Retorno         :       (eBILL_POLL_STATE) novo estado
//  394 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SMDBILL_estado_offline
        THUMB
//  395 eBILL_POLL_STATE SMDBILL_estado_offline(eBILL_POLL_STATE estado){
SMDBILL_estado_offline:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
//  396   unsigned char tentativas=5;
        MOVS     R5,#+5
//  397   eMDB_reply flag;
//  398   
//  399   do{
//  400     
//  401     flag = MDBILL_verifica_dispositivo();
??SMDBILL_estado_offline_0:
          CFI FunCall MDBILL_verifica_dispositivo
        BL       MDBILL_verifica_dispositivo
        MOVS     R6,R0
//  402     MDBAURT_sleep(1);           
        MOVS     R0,#+1
          CFI FunCall MDBAURT_sleep
        BL       MDBAURT_sleep
//  403   }
//  404   while(flag!=MDB_OK && --tentativas);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SMDBILL_estado_offline_1
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBILL_estado_offline_0
//  405   
//  406   
//  407   if(flag==MDB_OK){
??SMDBILL_estado_offline_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??SMDBILL_estado_offline_2
//  408      SMDBILL_time_out = RELOAD_TIMEOUT_BILL;
        LDR.N    R0,??DataTable9_4
        MOVS     R1,#+100
        STRH     R1,[R0, #+0]
//  409      return BILL_BLOQUEADO;
        MOVS     R0,#+1
        B.N      ??SMDBILL_estado_offline_3
//  410   }
//  411   
//  412   return BILL_OFFLINE;
??SMDBILL_estado_offline_2:
        MOVS     R0,#+5
??SMDBILL_estado_offline_3:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock7
//  413 }
//  414 /***********************************************************************************
//  415 *       Descrição       :       Função onde o noteiro está sinalizando
//  416 *                               falha
//  417 *       Parametros      :       (eBILL_POLL_STATE) estado atual
//  418 *       Retorno         :       (eBILL_POLL_STATE) novo estado
//  419 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function SMDBILL_estado_falha_dispositivo
          CFI NoCalls
        THUMB
//  420 eBILL_POLL_STATE SMDBILL_estado_falha_dispositivo(eBILL_POLL_STATE estado){
SMDBILL_estado_falha_dispositivo:
        MOVS     R1,R0
//  421    
//  422   
//  423    return BILL_OFFLINE;
        MOVS     R0,#+5
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  424 }
//  425 /***********************************************************************************
//  426 *       Descrição       :       Getter para o contador de timeout
//  427 *       Parametros      :       nenhum
//  428 *       Retorno         :       (unsigned char) timeout na comunicação
//  429 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function SMDBILL_get_contador_timeout
          CFI NoCalls
        THUMB
//  430 unsigned char SMDBILL_get_contador_timeout(void){
//  431   
//  432   return SMDBILL_time_out;
SMDBILL_get_contador_timeout:
        LDR.N    R0,??DataTable9_4
        LDRH     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  433 }
//  434 /***********************************************************************************
//  435 *       Descrição       :       Trata os eventos do MDBILL
//  436 *       Parametros      :       (unsigned char) tamanho
//  437 *       Retorno         :       nenhum
//  438 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function SMDBILL_trata_eventos
        THUMB
//  439 unsigned char SMDBILL_trata_eventos(unsigned char quantidade){
SMDBILL_trata_eventos:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  440   static unsigned char canal;
//  441   static unsigned char new_scrow=0;
//  442   
//  443   if(!quantidade)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??SMDBILL_trata_eventos_0
//  444     return 1;  
        MOVS     R0,#+1
        B.N      ??SMDBILL_trata_eventos_1
//  445   
//  446   for(unsigned char i=0;i<quantidade;i++){
??SMDBILL_trata_eventos_0:
        MOVS     R5,#+0
??SMDBILL_trata_eventos_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R5,R4
        BCS.N    ??SMDBILL_trata_eventos_3
//  447     
//  448     if(SMDBILL_eventos[i].tipo==BILL_STATUS){
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R0,??DataTable9_5
        LDRB     R0,[R0, R5, LSL #+1]
        CMP      R0,#+0
        BNE.N    ??SMDBILL_trata_eventos_4
//  449       switch(SMDBILL_eventos[i].args){
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R0,??DataTable9_5
        ADDS     R0,R0,R5, LSL #+1
        LDRB     R0,[R0, #+1]
        CMP      R0,#+1
        BEQ.N    ??SMDBILL_trata_eventos_5
        BCC.N    ??SMDBILL_trata_eventos_6
        CMP      R0,#+3
        BEQ.N    ??SMDBILL_trata_eventos_7
        BCC.N    ??SMDBILL_trata_eventos_8
        CMP      R0,#+5
        BEQ.N    ??SMDBILL_trata_eventos_9
        BCC.N    ??SMDBILL_trata_eventos_10
        CMP      R0,#+7
        BEQ.N    ??SMDBILL_trata_eventos_11
        BCC.N    ??SMDBILL_trata_eventos_12
        CMP      R0,#+9
        BEQ.N    ??SMDBILL_trata_eventos_13
        BCC.N    ??SMDBILL_trata_eventos_14
        CMP      R0,#+11
        BEQ.N    ??SMDBILL_trata_eventos_15
        BCC.N    ??SMDBILL_trata_eventos_16
        CMP      R0,#+12
        BEQ.N    ??SMDBILL_trata_eventos_17
        B.N      ??SMDBILL_trata_eventos_6
//  450         case DEFECTIVE_MOTOR:
//  451              break;
??SMDBILL_trata_eventos_5:
        B.N      ??SMDBILL_trata_eventos_6
//  452         case SENSOR_PROBLEM:
//  453              break;
??SMDBILL_trata_eventos_8:
        B.N      ??SMDBILL_trata_eventos_6
//  454         case VALIDATOR_BUSY:
//  455              break;
??SMDBILL_trata_eventos_7:
        B.N      ??SMDBILL_trata_eventos_6
//  456         case ROM_CHECKSUM_ERROR:
//  457              break;
??SMDBILL_trata_eventos_10:
        B.N      ??SMDBILL_trata_eventos_6
//  458         case VALIDATOR_JAMMED:
//  459              break;
??SMDBILL_trata_eventos_9:
        B.N      ??SMDBILL_trata_eventos_6
//  460         case VALIDATOR_WAS_RESET:
//  461              new_scrow = 0;
??SMDBILL_trata_eventos_12:
        LDR.N    R0,??DataTable9_13
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  462              break;
        B.N      ??SMDBILL_trata_eventos_6
//  463         case BILL_REMOVED:
//  464              new_scrow = 0;
??SMDBILL_trata_eventos_11:
        LDR.N    R0,??DataTable9_13
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  465              break;
        B.N      ??SMDBILL_trata_eventos_6
//  466         case CASH_BOX_OUT_POSITION:    
//  467              break;
??SMDBILL_trata_eventos_14:
        B.N      ??SMDBILL_trata_eventos_6
//  468         case UNIT_DISABLED:
//  469              if(canal==255)
??SMDBILL_trata_eventos_13:
        LDR.N    R0,??DataTable9_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BNE.N    ??SMDBILL_trata_eventos_18
//  470                new_scrow = 0;             
        LDR.N    R0,??DataTable9_13
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  471              break;
??SMDBILL_trata_eventos_18:
        B.N      ??SMDBILL_trata_eventos_6
//  472         case INVALID_ESCROW_REQUEST:
//  473              break;
??SMDBILL_trata_eventos_16:
        B.N      ??SMDBILL_trata_eventos_6
//  474         case BILL_REJECTED:
//  475              break;
??SMDBILL_trata_eventos_15:
        B.N      ??SMDBILL_trata_eventos_6
//  476         case POSSIBLE_CREDITED_BILL_REMOVAL:
//  477              break;
??SMDBILL_trata_eventos_17:
        B.N      ??SMDBILL_trata_eventos_6
//  478       }
//  479     }
//  480     else{
//  481       //Switch dos comandos
//  482       switch(SMDBILL_eventos[i].tipo){
??SMDBILL_trata_eventos_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R0,??DataTable9_5
        LDRB     R0,[R0, R5, LSL #+1]
        CMP      R0,#+8
        BEQ.N    ??SMDBILL_trata_eventos_19
        BCC.N    ??SMDBILL_trata_eventos_6
        CMP      R0,#+10
        BEQ.N    ??SMDBILL_trata_eventos_20
        BCC.N    ??SMDBILL_trata_eventos_21
        CMP      R0,#+12
        BEQ.N    ??SMDBILL_trata_eventos_22
        BCC.N    ??SMDBILL_trata_eventos_23
        B.N      ??SMDBILL_trata_eventos_6
//  483         case BILL_STACKED:
//  484              if(new_scrow){
??SMDBILL_trata_eventos_19:
        LDR.N    R0,??DataTable9_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDBILL_trata_eventos_24
//  485                PAGAMENTOS_adiciona_valores(SMDBILL_valor_canais[canal]*100);
        LDR.N    R0,??DataTable9_14
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable9_6
        LDRB     R0,[R0, R1]
        MOVS     R1,#+100
        MULS     R0,R1,R0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PAGAMENTOS_adiciona_valores
        BL       PAGAMENTOS_adiciona_valores
//  486                new_scrow = 0;  
        LDR.N    R0,??DataTable9_13
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  487                canal = 255;
        LDR.N    R0,??DataTable9_14
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
//  488              }             
//  489              break;
??SMDBILL_trata_eventos_24:
        B.N      ??SMDBILL_trata_eventos_6
//  490         case ESCROW_POSITION:  
//  491              if(MDBILL_send_escrow_command(STACK_BILL)==MDB_OK){
??SMDBILL_trata_eventos_21:
        MOVS     R0,#+1
          CFI FunCall MDBILL_send_escrow_command
        BL       MDBILL_send_escrow_command
        CMP      R0,#+0
        BNE.N    ??SMDBILL_trata_eventos_25
//  492                //vTaskDelay(100);
//  493                new_scrow = 1;
        LDR.N    R0,??DataTable9_13
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  494                canal = (unsigned char)(SMDBILL_eventos[i].args-CANAL_01);               
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R0,??DataTable9_5
        ADDS     R0,R0,R5, LSL #+1
        LDRB     R0,[R0, #+1]
        SUBS     R0,R0,#+13
        LDR.N    R1,??DataTable9_14
        STRB     R0,[R1, #+0]
//  495              }
//  496              //else
//  497                //vTaskDelay(1000);
//  498              
//  499              break;
??SMDBILL_trata_eventos_25:
        B.N      ??SMDBILL_trata_eventos_6
//  500         case BILL_RETURNED:
//  501              new_scrow = 0;
??SMDBILL_trata_eventos_20:
        LDR.N    R0,??DataTable9_13
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  502              break;
        B.N      ??SMDBILL_trata_eventos_6
//  503         case NOT_USED:
//  504              break;
??SMDBILL_trata_eventos_23:
        B.N      ??SMDBILL_trata_eventos_6
//  505         case DISABLED_BILL_REJECTED: 
//  506              new_scrow = 0;
??SMDBILL_trata_eventos_22:
        LDR.N    R0,??DataTable9_13
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  507              break;
//  508       }
//  509     }
//  510   }
??SMDBILL_trata_eventos_6:
        ADDS     R5,R5,#+1
        B.N      ??SMDBILL_trata_eventos_2
//  511   
//  512   return 1;
??SMDBILL_trata_eventos_3:
        MOVS     R0,#+1
??SMDBILL_trata_eventos_1:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock10
//  513 }

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??canal:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??new_scrow:
        DS8 1
//  514 /***********************************************************************************
//  515 *       Descrição       :       Envia o comando para fazer o armazenamento
//  516 *                               da nota
//  517 *       Parametros      :       nenhum
//  518 *       Retorno         :       (unsigned char) maior do que zero
//  519 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function SMDBILL_envia_comando_scroll
        THUMB
//  520 unsigned char SMDBILL_envia_comando_scroll(void){
SMDBILL_envia_comando_scroll:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  521   unsigned char tentativas=5;
        MOVS     R4,#+5
//  522   eMDB_reply flag;
//  523   
//  524   
//  525   do{
//  526     
//  527     flag = MDBILL_send_escrow_command(STACK_BILL);
??SMDBILL_envia_comando_scroll_0:
        MOVS     R0,#+1
          CFI FunCall MDBILL_send_escrow_command
        BL       MDBILL_send_escrow_command
        MOVS     R5,R0
//  528     MDBAURT_sleep(1);
        MOVS     R0,#+1
          CFI FunCall MDBAURT_sleep
        BL       MDBAURT_sleep
//  529     
//  530   }
//  531   while(flag!=MDB_OK && --tentativas);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??SMDBILL_envia_comando_scroll_1
        SUBS     R4,R4,#+1
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDBILL_envia_comando_scroll_0
//  532 
//  533   if(flag == MDB_OK)
??SMDBILL_envia_comando_scroll_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??SMDBILL_envia_comando_scroll_2
//  534     return 1;
        MOVS     R0,#+1
        B.N      ??SMDBILL_envia_comando_scroll_3
//  535   
//  536   return 0;
??SMDBILL_envia_comando_scroll_2:
        MOVS     R0,#+0
??SMDBILL_envia_comando_scroll_3:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock11
//  537 }
//  538 /***********************************************************************************
//  539 *       Descrição       :       Getter para verificar se o noteiro está
//  540 *                               online
//  541 *       Parametros      :       nenhum
//  542 *       Retorno         :       (unsigned char) maior do que zero se 
//  543 *                               estiver online
//  544 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function SMDBILL_get_net_status
          CFI NoCalls
        THUMB
//  545 unsigned char SMDBILL_get_net_status(void){
//  546   
//  547   if(SMDBILL_estado_atual != BILL_OFFLINE)
SMDBILL_get_net_status:
        LDR.N    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+5
        BEQ.N    ??SMDBILL_get_net_status_0
//  548     return 1;
        MOVS     R0,#+1
        B.N      ??SMDBILL_get_net_status_1
//  549   
//  550   return 0;
??SMDBILL_get_net_status_0:
        MOVS     R0,#+0
??SMDBILL_get_net_status_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock12
//  551 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     SMDBILL_bloqueio

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     SMDBILL_estado_atual

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     MDBILL_funcs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     SMDBILL_reset_counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     SMDBILL_time_out

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     SMDBILL_eventos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     SMDBILL_valor_canais

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     SMDBILL_nivel_seguranca

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_8:
        DC32     SMDBILL_scroll_capacide

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_9:
        DC32     SMDBILL_capacidade_stacker

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_10:
        DC32     SMDBILL_casas_decimais

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_11:
        DC32     SMDBILL_escala

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_12:
        DC32     SMDBILL_country

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_13:
        DC32     ??new_scrow

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_14:
        DC32     ??canal

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  552 /***********************************************************************************
//  553 *       Fim do arquivo
//  554 ***********************************************************************************/
// 
//    45 bytes in section .bss
//    20 bytes in section .data
//    28 bytes in section .rodata
// 1 402 bytes in section .text
// 
// 1 402 bytes of CODE  memory
//    28 bytes of CONST memory
//    65 bytes of DATA  memory
//
//Errors: none
//Warnings: none
