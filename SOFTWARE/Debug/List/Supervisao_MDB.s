///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     06/Jul/2017  15:09:56 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Pagamentos\Supervisao_MDB.c     /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Pagamentos\Supervisao_MDB.c     /
//                    -lC C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\Ma /
//                    isPipocaG2\SOFTWARE\Debug\List\ -lA                     /
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
//                    pocaG2\SOFTWARE\Debug\List\Supervisao_MDB.s             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Supervisao_MDB

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN CASHLESS_poll_device
        EXTERN MDBCASHLESS_start_vend
        EXTERN MDBCASHLESS_vend_cancel
        EXTERN MDBCASHLESS_vend_success
        EXTERN SMC_ini
        EXTERN SMC_tick
        EXTERN SMDBCOIN_tick
        EXTERN SMDBILL_set_bloqueio
        EXTERN SMDBILL_tick
        EXTERN vTaskDelay
        EXTERN xQueueCreate
        EXTERN xQueueGenericReceive
        EXTERN xQueueGenericSend

        PUBLIC SMDB_cancela_venda
        PUBLIC SMDB_cashless_vend
        PUBLIC SMDB_ini
        PUBLIC SMDB_release
        PUBLIC SMDB_semaforo_barramento
        PUBLIC SMDB_tick
        PUBLIC SMDB_vend_success
        PUBLIC SMDB_venda_cartao
        PUBLIC SMDB_wait
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\Pagamentos\Supervisao_MDB.c
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
//   17 |       Arquivo            :  Supervisao_MDB.c
//   18 |       Descrição          :  Biblioteca para controle dos meios de pagamento
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  28/02/2017
//   22 |
//   23 |       Revisões           :  1.0.0.0
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 
//   29 /***********************************************************************************
//   30 *       Includes
//   31 ***********************************************************************************/
//   32 #include <stdio.h>
//   33 #include <stdlib.h>
//   34 #include <string.h>
//   35 #include "..\..\includes.h"
//   36 #include "supervisao_mdb.h"
//   37 #include "supervisao_mdb_bill.h"
//   38 #include "supervisao_mdb_coin.h"
//   39 #include "supervisao_mdb_cashless.h"
//   40 /***********************************************************************************
//   41 *       Definições
//   42 ***********************************************************************************/
//   43 
//   44 
//   45 /***********************************************************************************
//   46 *       Variaveis locais
//   47 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   48 xSemaphoreHandle SMDB_semaforo_barramento;
SMDB_semaforo_barramento:
        DS8 4
//   49 
//   50 /***********************************************************************************
//   51 *       Funções locais
//   52 ***********************************************************************************/
//   53 
//   54 
//   55 /***********************************************************************************
//   56 *       Implementação das funções
//   57 ***********************************************************************************/
//   58 
//   59 /***********************************************************************************
//   60 *       Descrição       :       Inicialização do módulo de supervisão
//   61 *                               dos dispositivos MDB
//   62 *       Parametros      :       nenhum
//   63 *       Retorno         :       nenhum
//   64 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SMDB_ini
        THUMB
//   65 void SMDB_ini(void){
SMDB_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   66   
//   67   SMDBILL_set_bloqueio(0);  
        MOVS     R0,#+0
          CFI FunCall SMDBILL_set_bloqueio
        BL       SMDBILL_set_bloqueio
//   68   SMC_ini();
          CFI FunCall SMC_ini
        BL       SMC_ini
//   69   vSemaphoreCreateBinary(SMDB_semaforo_barramento);
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall xQueueCreate
        BL       xQueueCreate
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SMDB_ini_0
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//   70 }
??SMDB_ini_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   71 /***********************************************************************************
//   72 *       Descrição       :       Ponto de entrada da máquina de estados 
//   73 *                               que faz a supervisão dos dispositivos MDB
//   74 *       Parametros      :       nenhum
//   75 *       Retorno         :       nenhum
//   76 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SMDB_tick
        THUMB
//   77 void SMDB_tick(void){
SMDB_tick:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   78   //unsigned char bill;  
//   79   
//   80   while(!xSemaphoreTake(SMDB_semaforo_barramento,portTICK_RATE_MS*1));     
??SMDB_tick_0:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??SMDB_tick_0
//   81    
//   82   vTaskDelay(5);  
        MOVS     R0,#+5
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   83   SMDBILL_tick(); // dentro do módulo ele verifica o bloqueio e habilitação do periférico
          CFI FunCall SMDBILL_tick
        BL       SMDBILL_tick
//   84   SMDBCOIN_tick(); // 
          CFI FunCall SMDBCOIN_tick
        BL       SMDBCOIN_tick
//   85   SMC_tick(); // Dentro do módulo ele verifica o bloqueio e habilitação do cartão
          CFI FunCall SMC_tick
        BL       SMC_tick
//   86    
//   87   xSemaphoreGive(SMDB_semaforo_barramento); 
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//   88 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   89 /***********************************************************************************
//   90 *       Descrição       :       Wait para o barramento MDB
//   91 *       Parametros      :       nenhum
//   92 *       Retorno         :       nenhum
//   93 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SMDB_wait
        THUMB
//   94 void SMDB_wait(void){
SMDB_wait:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   95   
//   96   while(!xSemaphoreTake(SMDB_semaforo_barramento,portTICK_RATE_MS*1));    
??SMDB_wait_0:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??SMDB_wait_0
//   97 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//   98 /***********************************************************************************
//   99 *       Descrição       :       Release para o barramento
//  100 *       Parametros      :       nenhum
//  101 *       Retorno         :       nenhum
//  102 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SMDB_release
        THUMB
//  103 void SMDB_release(void){
SMDB_release:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  104   
//  105   xSemaphoreGive(SMDB_semaforo_barramento); 
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  106 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     SMDB_semaforo_barramento
//  107 /***********************************************************************************
//  108 *       Descrição       :       Inicia uma venda
//  109 *       Parametros      :       nenhum
//  110 *       Retorno         :       (unsigned char) maior do que zero
//  111 *                                               se a venda for iniciada
//  112 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SMDB_cashless_vend
        THUMB
//  113 unsigned char SMDB_cashless_vend(unsigned short int valor,
//  114                                  unsigned short int item){
SMDB_cashless_vend:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  115    unsigned char tentativas=10;
        MOVS     R6,#+10
//  116    unsigned char res=0;
        MOVS     R7,#+0
//  117    eCASHLESS_VEND_RESULT venda;
//  118    unsigned short int pago;
//  119    
//  120    eMDB_reply flag;
//  121                                    
//  122    SMDB_wait();
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  123    
//  124    do flag = MDBCASHLESS_start_vend(&venda,&pago,valor,item);
??SMDB_cashless_vend_0:
        MOVS     R3,R5
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADD      R1,SP,#+0
        ADD      R0,SP,#+2
          CFI FunCall MDBCASHLESS_start_vend
        BL       MDBCASHLESS_start_vend
//  125    while(flag!=MDB_OK && tentativas--);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SMDB_cashless_vend_1
        MOVS     R1,R6
        SUBS     R6,R1,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??SMDB_cashless_vend_0
//  126    
//  127    if(flag==MDB_OK)
??SMDB_cashless_vend_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDB_cashless_vend_2
//  128      res = 1;   
        MOVS     R7,#+1
//  129    
//  130    SMDB_release();      
??SMDB_cashless_vend_2:
          CFI FunCall SMDB_release
        BL       SMDB_release
//  131    
//  132    return res;
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock4
//  133 }
//  134 /***********************************************************************************
//  135 *       Descrição       :       Envia o comando que faz o cancelamento
//  136 *                               da venda
//  137 *       Parametros      :       nenhum
//  138 *       Retorno         :       (unsigned char) maior do que zero
//  139 *                               se a venda foi cancelada
//  140 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SMDB_cancela_venda
        THUMB
//  141 unsigned char SMDB_cancela_venda(void){
SMDB_cancela_venda:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  142    unsigned char tentativas=10;
        MOVS     R4,#+10
//  143    unsigned char res=0;
        MOVS     R5,#+0
//  144    
//  145    eMDB_reply flag;
//  146                                    
//  147    SMDB_wait();
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  148    
//  149    do flag = MDBCASHLESS_vend_cancel();
??SMDB_cancela_venda_0:
          CFI FunCall MDBCASHLESS_vend_cancel
        BL       MDBCASHLESS_vend_cancel
//  150    while(flag!=MDB_OK && tentativas--);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SMDB_cancela_venda_1
        MOVS     R1,R4
        SUBS     R4,R1,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??SMDB_cancela_venda_0
//  151    
//  152    if(flag==MDB_OK)
??SMDB_cancela_venda_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDB_cancela_venda_2
//  153      res = 1;   
        MOVS     R5,#+1
//  154    
//  155    SMDB_release();      
??SMDB_cancela_venda_2:
          CFI FunCall SMDB_release
        BL       SMDB_release
//  156    
//  157    return res;  
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock5
//  158 }
//  159 /***********************************************************************************
//  160 *       Descrição       :       Envia o comando de sucesso na venda
//  161 *       Parametros      :       nenhum
//  162 *       Retorno         :       (unsigned char) maior do que zero se conseguir
//  163 *                               enviar o comando para a placa
//  164 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SMDB_vend_success
        THUMB
//  165 unsigned char  SMDB_vend_success(unsigned short int item){
SMDB_vend_success:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
//  166    unsigned char tentativas=10;
        MOVS     R5,#+10
//  167    unsigned char res=0;
        MOVS     R6,#+0
//  168    
//  169    eMDB_reply flag;
//  170                                    
//  171    SMDB_wait();
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  172    
//  173    do flag = MDBCASHLESS_vend_success(item);
??SMDB_vend_success_0:
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall MDBCASHLESS_vend_success
        BL       MDBCASHLESS_vend_success
//  174    while(flag!=MDB_OK && tentativas--);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SMDB_vend_success_1
        MOVS     R1,R5
        SUBS     R5,R1,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??SMDB_vend_success_0
//  175    
//  176    if(flag==MDB_OK)
??SMDB_vend_success_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDB_vend_success_2
//  177      res = 1;   
        MOVS     R6,#+1
//  178    
//  179    SMDB_release();      
??SMDB_vend_success_2:
          CFI FunCall SMDB_release
        BL       SMDB_release
//  180    
//  181    return res;  
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock6
//  182 }
//  183 /***********************************************************************************
//  184 *       Descrição       :       Faz uma venda no cartão
//  185 *       Parametros      :       (unsigned int) valor
//  186 *       Retorno         :       (unsigned char) maior do que zero se conseguir
//  187 *                                               realizar a venda
//  188 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SMDB_venda_cartao
        THUMB
//  189 unsigned char SMDB_venda_cartao(unsigned short int preco){
SMDB_venda_cartao:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R4,R0
//  190   eMDB_reply flag;
//  191   unsigned char tentativas;
//  192   unsigned short int pago;
//  193   eCASHLESS_VEND_RESULT venda;  
//  194   unsigned short int timeout=15000;
        MOVW     R6,#+15000
//  195   
//  196   SMDB_wait();
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  197   
//  198   tentativas = 5;
        MOVS     R5,#+5
//  199   do flag = MDBCASHLESS_start_vend(&venda,&pago,preco,1);
??SMDB_venda_cartao_0:
        MOVS     R3,#+1
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADD      R1,SP,#+2
        ADD      R0,SP,#+1
          CFI FunCall MDBCASHLESS_start_vend
        BL       MDBCASHLESS_start_vend
//  200   while(flag!=MDB_OK && tentativas--);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SMDB_venda_cartao_1
        MOVS     R1,R5
        SUBS     R5,R1,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??SMDB_venda_cartao_0
//  201   
//  202   if(flag!=MDB_OK || venda==VEND_DENIED){
??SMDB_venda_cartao_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SMDB_venda_cartao_2
        LDRB     R0,[SP, #+1]
        CMP      R0,#+6
        BNE.N    ??SMDB_venda_cartao_3
//  203     SMDB_release();     
??SMDB_venda_cartao_2:
          CFI FunCall SMDB_release
        BL       SMDB_release
//  204     return 0;
        MOVS     R0,#+0
        B.N      ??SMDB_venda_cartao_4
//  205   }
??SMDB_venda_cartao_3:
        B.N      ??SMDB_venda_cartao_5
//  206   
//  207   eMDB_POLL_HEADER header;
//  208   
//  209   for(;--timeout;){
//  210     
//  211     tentativas = 10;
//  212     
//  213     do flag = CASHLESS_poll_device(&header,NULL);
//  214     while(flag!=MDB_OK && --tentativas);
//  215       
//  216     if(flag!=MDB_OK){
//  217       SMDB_release();     
//  218       return 0;      
//  219     }else{
//  220       if(header==CASHLESS_POOL_VEND_APPROVED){
//  221         SMDB_release(); 
//  222         return SMDB_vend_success(1);
//  223       }
//  224     }
//  225       
//  226     vTaskDelay(1);
??SMDB_venda_cartao_6:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??SMDB_venda_cartao_5:
        SUBS     R6,R6,#+1
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??SMDB_venda_cartao_7
        MOVS     R5,#+10
??SMDB_venda_cartao_8:
        MOVS     R1,#+0
        ADD      R0,SP,#+0
          CFI FunCall CASHLESS_poll_device
        BL       CASHLESS_poll_device
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SMDB_venda_cartao_9
        SUBS     R5,R5,#+1
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??SMDB_venda_cartao_8
??SMDB_venda_cartao_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SMDB_venda_cartao_10
          CFI FunCall SMDB_release
        BL       SMDB_release
        MOVS     R0,#+0
        B.N      ??SMDB_venda_cartao_4
??SMDB_venda_cartao_10:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+5
        BNE.N    ??SMDB_venda_cartao_6
          CFI FunCall SMDB_release
        BL       SMDB_release
        MOVS     R0,#+1
          CFI FunCall SMDB_vend_success
        BL       SMDB_vend_success
        B.N      ??SMDB_venda_cartao_4
//  227   }
//  228   
//  229   if(!timeout){
??SMDB_venda_cartao_7:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BNE.N    ??SMDB_venda_cartao_11
//  230     SMDB_release();       
          CFI FunCall SMDB_release
        BL       SMDB_release
//  231     return 0;
        MOVS     R0,#+0
        B.N      ??SMDB_venda_cartao_4
//  232   }      
//  233   
//  234   SMDB_release();       
??SMDB_venda_cartao_11:
          CFI FunCall SMDB_release
        BL       SMDB_release
//  235   return 0;
        MOVS     R0,#+0
??SMDB_venda_cartao_4:
        POP      {R1,R2,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock7
//  236 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  237 /***********************************************************************************
//  238 *       Fim do arquivo
//  239 ***********************************************************************************/
// 
//   4 bytes in section .bss
// 486 bytes in section .text
// 
// 486 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none
