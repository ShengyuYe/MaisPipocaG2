///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     13/Sep/2017  18:09:22 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\MDB\mdb.c /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\MDB\mdb.c /
//                     -lC C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\  /
//                    -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\   /
//                    -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Obj\     /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\mdb.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME mdb

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN MDBAURT_sleep
        EXTERN MDBCOIN_coin_dispense
        EXTERN MDBCOIN_coin_type_setup
        EXTERN MDBCOIN_get_setup_from_device
        EXTERN MDBCOIN_get_tube_status_from_device
        EXTERN MDBCOIN_poll
        EXTERN MDBCOIN_reset_device
        EXTERN MDBUART_envia_pacote
        EXTERN MDBUART_get_bytes_recebidos
        EXTERN MDBUART_has_new_package
        EXTERN MDBUART_ini
        EXTERN MDBUART_le_pacote
        EXTERN PARAMETROS_le
        EXTERN SMDBCOIN_verifica_net_status
        EXTERN SMDBILL_get_net_status
        EXTERN SMDB_release
        EXTERN SMDB_wait
        EXTERN __aeabi_memcpy
        EXTERN vTaskDelay

        PUBLIC MDB_buffer_stream
        PUBLIC MDB_checa_dispositivos
        PUBLIC MDB_checa_troco
        PUBLIC MDB_checa_valor_moedas
        PUBLIC MDB_chk_generate
        PUBLIC MDB_coin_check_tubes
        PUBLIC MDB_coin_dispenser
        PUBLIC MDB_ini
        PUBLIC MDB_main
        PUBLIC MDB_send_ack
        PUBLIC MDB_send_package
        PUBLIC MDB_send_package_long
        PUBLIC MDB_tube_counter
        PUBLIC MDB_tube_status
        PUBLIC coin_casas_decimais
        PUBLIC coin_country
        PUBLIC coin_credit
        PUBLIC coin_fator_escala
        PUBLIC coin_message_level
        PUBLIC coin_quantidade_tubo
        PUBLIC coin_status
        PUBLIC coin_tipo_evento
        PUBLIC coin_tipo_moeda
        PUBLIC coin_types_routing
        PUBLIC memcpy
        
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\MDB\mdb.c
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
//   17 |       Arquivo            :  mdb.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  25/02/2017
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
//   31 #include <nxp\iolpc1768.h>
//   32 #include <stdio.h>
//   33 #include <stdlib.h>
//   34 #include <string.h>

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP memcpy
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function memcpy
        THUMB
// __intrinsic __nounwind __interwork __softfp void *memcpy(void *, void const *, size_t)
memcpy:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock0
//   35 
//   36 #include "mdb.h"
//   37 #include "mdb_uart.h"
//   38 #include "mdb_bill.h"
//   39 #include "mdb_coin.h"
//   40 #include "mdb_cashless.h"
//   41 
//   42 #include "..\..\includes.h"
//   43 
//   44 /***********************************************************************************
//   45 *       Definiões locais
//   46 ***********************************************************************************/
//   47 #define TIMEOUT_WAIT_MESSAGE                    100//50
//   48 #define MAX_PACKAGE_SIZE                        36
//   49 
//   50 /***********************************************************************************
//   51 *       variaveis locais
//   52 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   53 unsigned char MDB_buffer_stream[MAX_PACKAGE_SIZE];
MDB_buffer_stream:
        DS8 36

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   54 unsigned short int MDB_tube_status;
MDB_tube_status:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   55 unsigned char MDB_tube_counter[16];
MDB_tube_counter:
        DS8 16
//   56 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   57 unsigned char coin_message_level;
coin_message_level:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   58 unsigned short int coin_country;
coin_country:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   59 unsigned char coin_fator_escala;
coin_fator_escala:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   60 unsigned char coin_casas_decimais;
coin_casas_decimais:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   61 unsigned short int coin_types_routing;
coin_types_routing:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   62 unsigned char coin_credit[16];
coin_credit:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   63 eMDB_COIN_POOL_TYPE coin_tipo_evento;
coin_tipo_evento:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   64 eMDB_COIN_POOL_STATUS coin_status;
coin_status:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   65 unsigned char coin_tipo_moeda;
coin_tipo_moeda:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   66 unsigned char coin_quantidade_tubo;
coin_quantidade_tubo:
        DS8 1
//   67 /***********************************************************************************
//   68 *       Funções locais
//   69 ***********************************************************************************/
//   70 
//   71 
//   72 /***********************************************************************************
//   73 *       Implementação das funções
//   74 ***********************************************************************************/
//   75 
//   76 /***********************************************************************************
//   77 *       Descrição       :       Inicialização do módulo
//   78 *       Parametros      :       nenhum
//   79 *       Retorno         :       nenhum
//   80 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MDB_ini
        THUMB
//   81 void MDB_ini(void){
MDB_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   82     
//   83   MDBUART_ini();     
          CFI FunCall MDBUART_ini
        BL       MDBUART_ini
//   84 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   85 /***********************************************************************************
//   86 *       Descrição       :       Task principal da biblioteca MDB
//   87 *       Parametros      :       nenhum
//   88 *       Retorno         :       nenhum
//   89 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MDB_main
        THUMB
//   90 void MDB_main(void*pPAR){
MDB_main:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
        MOVS     R4,R0
//   91   
//   92   vTaskDelay(5000);
        MOVW     R0,#+5000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   93   
//   94   SMDB_wait();    
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//   95   MDBCOIN_reset_device();
          CFI FunCall MDBCOIN_reset_device
        BL       MDBCOIN_reset_device
//   96   SMDB_release();  
          CFI FunCall SMDB_release
        BL       SMDB_release
//   97   
//   98   for(;;){
//   99     
//  100     SMDB_wait();
??MDB_main_0:
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  101     
//  102 
//  103    MDBCOIN_get_setup_from_device(&coin_message_level,
//  104                                  &coin_country,
//  105                                  &coin_fator_escala,
//  106                                  &coin_casas_decimais,
//  107                                  &coin_types_routing,
//  108                                  coin_credit);
        LDR.N    R0,??DataTable3
        STR      R0,[SP, #+4]
        LDR.N    R0,??DataTable3_1
        STR      R0,[SP, #+0]
        LDR.N    R3,??DataTable3_2
        LDR.N    R2,??DataTable3_3
        LDR.N    R1,??DataTable3_4
        LDR.N    R0,??DataTable3_5
          CFI FunCall MDBCOIN_get_setup_from_device
        BL       MDBCOIN_get_setup_from_device
//  109                                                                                                    
//  110     MDBCOIN_get_tube_status_from_device(&MDB_tube_status,MDB_tube_counter);            
        LDR.N    R1,??DataTable3_6
        LDR.N    R0,??DataTable3_7
          CFI FunCall MDBCOIN_get_tube_status_from_device
        BL       MDBCOIN_get_tube_status_from_device
//  111     MDBCOIN_coin_type_setup(0x0F,0x0F);
        MOVS     R1,#+15
        MOVS     R0,#+15
          CFI FunCall MDBCOIN_coin_type_setup
        BL       MDBCOIN_coin_type_setup
//  112     
//  113     /*
//  114     if(dispensa){
//  115       MDBCOIN_coin_dispense(2,2);
//  116       dispensa = 0;
//  117     }
//  118     */
//  119     
//  120     MDBCOIN_poll(&coin_tipo_evento,
//  121                  &coin_status,
//  122                  &coin_tipo_moeda,
//  123                  &coin_quantidade_tubo);    
        LDR.N    R3,??DataTable3_8
        LDR.N    R2,??DataTable3_9
        LDR.N    R1,??DataTable3_10
        LDR.N    R0,??DataTable3_11
          CFI FunCall MDBCOIN_poll
        BL       MDBCOIN_poll
//  124     
//  125     
//  126     SMDB_release();
          CFI FunCall SMDB_release
        BL       SMDB_release
//  127     
//  128     vTaskDelay(100);
        MOVS     R0,#+100
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??MDB_main_0
          CFI EndBlock cfiBlock2
//  129   }
//  130 }
//  131 /***********************************************************************************
//  132 *       Descrição       :       Calcula o CHK do pacote MDB
//  133 *       Parametros      :       (unsigned char*) pacote
//  134 *                               (unsigned char) tamanho
//  135 *       Retorno         :       (unsigned char) CHK do pacote
//  136 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MDB_chk_generate
          CFI NoCalls
        THUMB
//  137 unsigned char MDB_chk_generate(unsigned char *pData,unsigned char size){
MDB_chk_generate:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
//  138   unsigned char chk=0;
        MOVS     R0,#+0
//  139   
//  140   for(unsigned char i=0;i<size;i++)
        MOVS     R3,#+0
??MDB_chk_generate_0:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R3,R1
        BCS.N    ??MDB_chk_generate_1
//  141     chk+=pData[i];
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R4,[R3, R2]
        ADDS     R0,R4,R0
        ADDS     R3,R3,#+1
        B.N      ??MDB_chk_generate_0
//  142   
//  143   return chk;
??MDB_chk_generate_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  144 }
//  145 /***********************************************************************************
//  146 *       Descrição       :       Envia um pacote para um dispositivo
//  147 *       Parametros      :       (unsigned char) pacote com endereço
//  148 *                               (unsigned char*) dados
//  149 *                               (unsigned char) tamanho
//  150 *                               (unsigned char) enviar ao ACK ao final 
//  151 *                               (unsigned char*) dados recebidos
//  152 *                               (unsigned char*) quantidade de bytes recebidos
//  153 *       Retorno         :       (eMDB_reply) resultado da operação
//  154 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MDB_send_package
        THUMB
//  155 eMDB_reply MDB_send_package(unsigned char first_is_address,
//  156                             unsigned char *pData,unsigned char data_length,
//  157                             unsigned char send_ack,
//  158                             unsigned char *pRx,unsigned char *rx_length){
MDB_send_package:
        PUSH     {R0,R3-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+44
        SUB      SP,SP,#+4
          CFI CFA R13+48
        MOVS     R4,R1
        MOVS     R5,R2
        LDR      R6,[SP, #+48]
        LDR      R7,[SP, #+52]
//  159   unsigned short int time_out=TIMEOUT_WAIT_MESSAGE;
        MOVS     R9,#+100
//  160   unsigned char flag;  
//  161   
//  162   //flag = U2RBR;
//  163   //flag = U2LSR;  
//  164   //U2FCR |= (0x02);  
//  165     
//  166   memcpy(MDB_buffer_stream,pData,data_length);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,R5
        MOVS     R1,R4
        LDR.N    R0,??DataTable3_12
          CFI FunCall memcpy
        BL       memcpy
//  167   MDB_buffer_stream[data_length] = MDB_chk_generate(pData,data_length);
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
          CFI FunCall MDB_chk_generate
        BL       MDB_chk_generate
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R1,??DataTable3_12
        STRB     R0,[R5, R1]
//  168       
//  169   MDBUART_envia_pacote(first_is_address,MDB_buffer_stream,data_length+1);     
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R2,R5,#+1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR.N    R1,??DataTable3_12
        LDRB     R0,[SP, #+4]
          CFI FunCall MDBUART_envia_pacote
        BL       MDBUART_envia_pacote
//  170   
//  171   do{
//  172     flag = MDBUART_has_new_package();
??MDB_send_package_0:
          CFI FunCall MDBUART_has_new_package
        BL       MDBUART_has_new_package
        MOV      R8,R0
//  173     MDBAURT_sleep(1);
        MOVS     R0,#+1
          CFI FunCall MDBAURT_sleep
        BL       MDBAURT_sleep
//  174   }
//  175   while(!flag && time_out--);
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??MDB_send_package_1
        MOV      R0,R9
        SUBS     R9,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??MDB_send_package_0
//  176                      
//  177   if(flag){
??MDB_send_package_1:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??MDB_send_package_2
//  178     
//  179     unsigned char recebidos = MDBUART_get_bytes_recebidos();
          CFI FunCall MDBUART_get_bytes_recebidos
        BL       MDBUART_get_bytes_recebidos
        MOV      R10,R0
//  180     
//  181     MDBUART_le_pacote(MDB_buffer_stream,recebidos>MAX_PACKAGE_SIZE?MAX_PACKAGE_SIZE:recebidos);          
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+37
        BLT.N    ??MDB_send_package_3
        MOVS     R1,#+36
        B.N      ??MDB_send_package_4
??MDB_send_package_3:
        MOV      R1,R10
??MDB_send_package_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable3_12
          CFI FunCall MDBUART_le_pacote
        BL       MDBUART_le_pacote
//  182         
//  183     unsigned char checksum = MDB_chk_generate(MDB_buffer_stream,recebidos-1);
        SUBS     R1,R10,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable3_12
          CFI FunCall MDB_chk_generate
        BL       MDB_chk_generate
        MOV      R11,R0
//  184       
//  185     memcpy(pRx,MDB_buffer_stream,recebidos>MAX_PACKAGE_SIZE?MAX_PACKAGE_SIZE:recebidos);
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+37
        BLT.N    ??MDB_send_package_5
        MOVS     R2,#+36
        B.N      ??MDB_send_package_6
??MDB_send_package_5:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOV      R2,R10
??MDB_send_package_6:
        LDR.N    R1,??DataTable3_12
        MOVS     R0,R6
          CFI FunCall memcpy
        BL       memcpy
//  186     *rx_length = recebidos>MAX_PACKAGE_SIZE?MAX_PACKAGE_SIZE:(recebidos-1);
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+37
        BLT.N    ??MDB_send_package_7
        MOVS     R0,#+36
        B.N      ??MDB_send_package_8
??MDB_send_package_7:
        SUBS     R0,R10,#+1
??MDB_send_package_8:
        STRB     R0,[R7, #+0]
//  187      
//  188     if(send_ack)     
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BEQ.N    ??MDB_send_package_9
//  189       MDB_send_ack();              
          CFI FunCall MDB_send_ack
        BL       MDB_send_ack
//  190     
//  191     if(recebidos || MDB_buffer_stream[recebidos-1] == checksum)
??MDB_send_package_9:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BNE.N    ??MDB_send_package_10
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        LDR.N    R0,??DataTable3_12
        ADDS     R0,R10,R0
        LDRB     R0,[R0, #-1]
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R0,R11
        BNE.N    ??MDB_send_package_11
//  192       return MDB_OK;     
??MDB_send_package_10:
        MOVS     R0,#+0
        B.N      ??MDB_send_package_12
//  193     
//  194     return MDB_ERROR;
??MDB_send_package_11:
        MOVS     R0,#+1
        B.N      ??MDB_send_package_12
//  195   }
//  196   
//  197   return MDB_TIMEOUT;
??MDB_send_package_2:
        MOVS     R0,#+2
??MDB_send_package_12:
        POP      {R1-R11,PC}      ;; return
          CFI EndBlock cfiBlock4
//  198 }
//  199 /***********************************************************************************
//  200 *       Descrição       :       Envia um pacote para um dispositivo
//  201 *       Parametros      :       (unsigned char) pacote com endereço
//  202 *                               (unsigned char*) dados
//  203 *                               (unsigned char) tamanho
//  204 *                               (unsigned char) enviar ao ACK ao final 
//  205 *                               (unsigned char*) dados recebidos
//  206 *                               (unsigned char*) quantidade de bytes recebidos
//  207 *       Retorno         :       (eMDB_reply) resultado da operação
//  208 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MDB_send_package_long
        THUMB
//  209 eMDB_reply MDB_send_package_long(unsigned char first_is_address,
//  210                                  unsigned char *pData,unsigned char data_length,
//  211                                  unsigned char send_ack,
//  212                                  unsigned char *pRx,unsigned char *rx_length){
MDB_send_package_long:
        PUSH     {R0,R3-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+44
        SUB      SP,SP,#+4
          CFI CFA R13+48
        MOVS     R4,R1
        MOVS     R5,R2
        LDR      R6,[SP, #+48]
        LDR      R7,[SP, #+52]
//  213   unsigned short int time_out=10000;
        MOVW     R9,#+10000
//  214   unsigned char flag;  
//  215                               
//  216   memcpy(MDB_buffer_stream,pData,data_length);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,R5
        MOVS     R1,R4
        LDR.N    R0,??DataTable3_12
          CFI FunCall memcpy
        BL       memcpy
//  217   MDB_buffer_stream[data_length] = MDB_chk_generate(pData,data_length);
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
          CFI FunCall MDB_chk_generate
        BL       MDB_chk_generate
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R1,??DataTable3_12
        STRB     R0,[R5, R1]
//  218   
//  219   MDBUART_envia_pacote(first_is_address,MDB_buffer_stream,data_length+1);     
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R2,R5,#+1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR.N    R1,??DataTable3_12
        LDRB     R0,[SP, #+4]
          CFI FunCall MDBUART_envia_pacote
        BL       MDBUART_envia_pacote
//  220   
//  221   do{
//  222     flag = MDBUART_has_new_package();
??MDB_send_package_long_0:
          CFI FunCall MDBUART_has_new_package
        BL       MDBUART_has_new_package
        MOV      R8,R0
//  223     MDBAURT_sleep(1);
        MOVS     R0,#+1
          CFI FunCall MDBAURT_sleep
        BL       MDBAURT_sleep
//  224   }
//  225   while(!flag && time_out--);
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??MDB_send_package_long_1
        MOV      R0,R9
        SUBS     R9,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??MDB_send_package_long_0
//  226                      
//  227   if(flag){
??MDB_send_package_long_1:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??MDB_send_package_long_2
//  228     
//  229     unsigned char recebidos = MDBUART_get_bytes_recebidos();
          CFI FunCall MDBUART_get_bytes_recebidos
        BL       MDBUART_get_bytes_recebidos
        MOV      R10,R0
//  230     
//  231     MDBUART_le_pacote(MDB_buffer_stream,recebidos>MAX_PACKAGE_SIZE?MAX_PACKAGE_SIZE:recebidos);          
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+37
        BLT.N    ??MDB_send_package_long_3
        MOVS     R1,#+36
        B.N      ??MDB_send_package_long_4
??MDB_send_package_long_3:
        MOV      R1,R10
??MDB_send_package_long_4:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable3_12
          CFI FunCall MDBUART_le_pacote
        BL       MDBUART_le_pacote
//  232         
//  233     unsigned char checksum = MDB_chk_generate(MDB_buffer_stream,recebidos-1);
        SUBS     R1,R10,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable3_12
          CFI FunCall MDB_chk_generate
        BL       MDB_chk_generate
        MOV      R11,R0
//  234       
//  235     memcpy(pRx,MDB_buffer_stream,recebidos>MAX_PACKAGE_SIZE?MAX_PACKAGE_SIZE:recebidos);
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+37
        BLT.N    ??MDB_send_package_long_5
        MOVS     R2,#+36
        B.N      ??MDB_send_package_long_6
??MDB_send_package_long_5:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOV      R2,R10
??MDB_send_package_long_6:
        LDR.N    R1,??DataTable3_12
        MOVS     R0,R6
          CFI FunCall memcpy
        BL       memcpy
//  236     *rx_length = recebidos>MAX_PACKAGE_SIZE?MAX_PACKAGE_SIZE:(recebidos-1);
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+37
        BLT.N    ??MDB_send_package_long_7
        MOVS     R0,#+36
        B.N      ??MDB_send_package_long_8
??MDB_send_package_long_7:
        SUBS     R0,R10,#+1
??MDB_send_package_long_8:
        STRB     R0,[R7, #+0]
//  237      
//  238     if(send_ack)     
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BEQ.N    ??MDB_send_package_long_9
//  239       MDB_send_ack();              
          CFI FunCall MDB_send_ack
        BL       MDB_send_ack
//  240     
//  241     if(recebidos == 1 || MDB_buffer_stream[recebidos-1] == checksum)
??MDB_send_package_long_9:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+1
        BEQ.N    ??MDB_send_package_long_10
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        LDR.N    R0,??DataTable3_12
        ADDS     R0,R10,R0
        LDRB     R0,[R0, #-1]
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R0,R11
        BNE.N    ??MDB_send_package_long_11
//  242       return MDB_OK;     
??MDB_send_package_long_10:
        MOVS     R0,#+0
        B.N      ??MDB_send_package_long_12
//  243     
//  244     return MDB_ERROR;
??MDB_send_package_long_11:
        MOVS     R0,#+1
        B.N      ??MDB_send_package_long_12
//  245   }
//  246   
//  247   return MDB_TIMEOUT;
??MDB_send_package_long_2:
        MOVS     R0,#+2
??MDB_send_package_long_12:
        POP      {R1-R11,PC}      ;; return
          CFI EndBlock cfiBlock5
//  248 }
//  249 /***********************************************************************************
//  250 *       Descrição       :       envia o ack ao escravo 
//  251 *       Parametros      :       nenhum
//  252 *       Retorno         :       nenhum
//  253 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MDB_send_ack
        THUMB
//  254 void MDB_send_ack(void){
MDB_send_ack:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  255   
//  256   MDB_buffer_stream[0] = MDB_RESP_ACK;
        LDR.N    R0,??DataTable3_12
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  257   MDBUART_envia_pacote(0,MDB_buffer_stream,1);
        MOVS     R2,#+1
        LDR.N    R1,??DataTable3_12
        MOVS     R0,#+0
          CFI FunCall MDBUART_envia_pacote
        BL       MDBUART_envia_pacote
//  258 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     coin_credit

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     coin_types_routing

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     coin_casas_decimais

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     coin_fator_escala

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     coin_country

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     coin_message_level

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     MDB_tube_counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     MDB_tube_status

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     coin_quantidade_tubo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     coin_tipo_moeda

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     coin_status

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     coin_tipo_evento

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     MDB_buffer_stream
//  259 /***********************************************************************************
//  260 *       Descrição       :       Libera troco no moedeiro
//  261 *       Parametros      :       (unsigned char) tipo da moeda
//  262 *                               (unsigned char) quantidade
//  263 *       Retorno         :       (unsigned chra) maior do que zero
//  264 *                                               se conseguir realizar
//  265 *                                               a operação
//  266 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function MDB_coin_dispenser
        THUMB
//  267 unsigned char MDB_coin_dispenser(unsigned char tipo,unsigned char quantidade){
MDB_coin_dispenser:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  268   eMDB_reply flag;
//  269   
//  270   SMDB_wait();
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  271   
//  272   vTaskDelay(3000);
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  273   flag = MDBCOIN_coin_dispense(quantidade,tipo);
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall MDBCOIN_coin_dispense
        BL       MDBCOIN_coin_dispense
        MOVS     R6,R0
//  274     
//  275   SMDB_release();
          CFI FunCall SMDB_release
        BL       SMDB_release
//  276   
//  277   if(flag==MDB_OK)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??MDB_coin_dispenser_0
//  278     return 1;
        MOVS     R0,#+1
        B.N      ??MDB_coin_dispenser_1
//  279   
//  280   return 0;
??MDB_coin_dispenser_0:
        MOVS     R0,#+0
??MDB_coin_dispenser_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock7
//  281 }
//  282 /***********************************************************************************
//  283 *       Descrição       :       Verifia o estado dos tubos de moedas
//  284 *       Parametros      :       (unsigned char*) tubos
//  285 *       Retorno         :       (unsigned char) maior do que zero se conseguir
//  286 *                               realizar a operação
//  287 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function MDB_coin_check_tubes
        THUMB
//  288 unsigned char MDB_coin_check_tubes(unsigned char* tubes){
MDB_coin_check_tubes:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+24
          CFI CFA R13+40
        MOVS     R4,R0
//  289   unsigned char tubos[16];
//  290   unsigned char tentativas=10;
        MOVS     R5,#+10
//  291   unsigned short int status;
//  292   eMDB_reply flag;
//  293   
//  294   SMDB_wait();
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  295   
//  296   do flag = MDBCOIN_get_tube_status_from_device(&status,tubos);
??MDB_coin_check_tubes_0:
        ADD      R1,SP,#+4
        ADD      R0,SP,#+0
          CFI FunCall MDBCOIN_get_tube_status_from_device
        BL       MDBCOIN_get_tube_status_from_device
        MOVS     R6,R0
//  297   while(flag!=MDB_OK && --tentativas);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??MDB_coin_check_tubes_1
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??MDB_coin_check_tubes_0
//  298   
//  299   SMDB_release();
??MDB_coin_check_tubes_1:
          CFI FunCall SMDB_release
        BL       SMDB_release
//  300   
//  301   if(flag==MDB_OK){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??MDB_coin_check_tubes_2
//  302     
//  303     for(unsigned char i=0;i<16;i++)
        MOVS     R0,#+0
??MDB_coin_check_tubes_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BGE.N    ??MDB_coin_check_tubes_4
//  304       tubes[i] = tubos[i];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+4
        LDRB     R1,[R0, R1]
        STRB     R1,[R0, R4]
        ADDS     R0,R0,#+1
        B.N      ??MDB_coin_check_tubes_3
//  305     return 1;
??MDB_coin_check_tubes_4:
        MOVS     R0,#+1
        B.N      ??MDB_coin_check_tubes_5
//  306   }  
//  307   
//  308   return 0;
??MDB_coin_check_tubes_2:
        MOVS     R0,#+0
??MDB_coin_check_tubes_5:
        ADD      SP,SP,#+24
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock8
//  309 }
//  310 /***********************************************************************************
//  311 *       Descrição       :       Veririca se os dispositivos MDB habilitados
//  312 *                               estão presentes no barramento
//  313 *       Parametros      :       nenhum
//  314 *       Retorno         :       nenhum
//  315 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function MDB_checa_dispositivos
        THUMB
//  316 eMDB_RESULTADO_SCAN MDB_checa_dispositivos(void){
MDB_checa_dispositivos:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  317   unsigned char flag_coin,flag_bill;
//  318   
//  319   PARAMETROS_le(ADR_FLAG_MDB_BIL,(void*)&flag_bill);
        ADD      R1,SP,#+0
        MOVS     R0,#+4
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  320   PARAMETROS_le(ADR_FLAG_MDB_COIN,(void*)&flag_coin);
        ADD      R1,SP,#+1
        MOVS     R0,#+5
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  321   
//  322   SMDB_wait();
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  323   
//  324   if(flag_bill && !SMDBILL_get_net_status()){
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??MDB_checa_dispositivos_0
          CFI FunCall SMDBILL_get_net_status
        BL       SMDBILL_get_net_status
        CMP      R0,#+0
        BNE.N    ??MDB_checa_dispositivos_0
//  325     SMDB_release(); 
          CFI FunCall SMDB_release
        BL       SMDB_release
//  326     return MDB_BILL_OFFLINE;
        MOVS     R0,#+1
        B.N      ??MDB_checa_dispositivos_1
//  327   }
//  328   
//  329   if(flag_coin && !SMDBCOIN_verifica_net_status()){
??MDB_checa_dispositivos_0:
        LDRB     R0,[SP, #+1]
        CMP      R0,#+0
        BEQ.N    ??MDB_checa_dispositivos_2
          CFI FunCall SMDBCOIN_verifica_net_status
        BL       SMDBCOIN_verifica_net_status
        CMP      R0,#+0
        BNE.N    ??MDB_checa_dispositivos_2
//  330     SMDB_release(); 
          CFI FunCall SMDB_release
        BL       SMDB_release
//  331     return MDB_COIN_OFFLINE;
        MOVS     R0,#+2
        B.N      ??MDB_checa_dispositivos_1
//  332   }
//  333  
//  334   SMDB_release(); 
??MDB_checa_dispositivos_2:
          CFI FunCall SMDB_release
        BL       SMDB_release
//  335   
//  336   return MDB_TODOS_ONLINE;
        MOVS     R0,#+0
??MDB_checa_dispositivos_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock9
//  337 }
//  338 /***********************************************************************************
//  339 *       Descrição       :       Veririca se os dispositivos MDB habilitados
//  340 *                               estão presentes no barramento
//  341 *       Parametros      :       nenhum
//  342 *       Retorno         :       nenhum
//  343 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function MDB_checa_valor_moedas
        THUMB
//  344 eMDB_reply MDB_checa_valor_moedas(unsigned char *escala,unsigned char *canais){
MDB_checa_valor_moedas:
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
        MOVS     R5,R1
//  345   eMDB_reply res;
//  346   unsigned char tentativas=10;
        MOVS     R7,#+10
//  347   unsigned char level;
//  348   unsigned short int pais;
//  349   unsigned char casas_decimais;
//  350   unsigned short int roteamento;
//  351   
//  352   SMDB_wait();
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  353   
//  354   do res = MDBCOIN_get_setup_from_device(&level,&pais,escala,&casas_decimais,&roteamento,canais);
??MDB_checa_valor_moedas_0:
        STR      R5,[SP, #+4]
        ADD      R0,SP,#+10
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+8
        MOVS     R2,R4
        ADD      R1,SP,#+12
        ADD      R0,SP,#+9
          CFI FunCall MDBCOIN_get_setup_from_device
        BL       MDBCOIN_get_setup_from_device
        MOVS     R6,R0
//  355   while(res!=MDB_OK && tentativas--);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??MDB_checa_valor_moedas_1
        MOVS     R0,R7
        SUBS     R7,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??MDB_checa_valor_moedas_0
//  356    
//  357   SMDB_release();   
??MDB_checa_valor_moedas_1:
          CFI FunCall SMDB_release
        BL       SMDB_release
//  358   
//  359   return res;
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock10
//  360 }
//  361 /***********************************************************************************
//  362 *       Descrição       :       Verifica a quantidade de troco disponível
//  363 *                               no moedeiro
//  364 *       Parametros      :       nenhum
//  365 *       Retorno         :       (unsigned char) maior do que zero se
//  366 *                                               houver resposta do moedeiro
//  367 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function MDB_checa_troco
        THUMB
//  368 unsigned char MDB_checa_troco(unsigned int *troco){
MDB_checa_troco:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+36
          CFI CFA R13+56
        MOVS     R4,R0
//  369   unsigned char escala;
//  370   unsigned char canais[16];
//  371   unsigned char tubos[16];
//  372   unsigned char tentativas;
//  373   eMDB_reply res;
//  374   unsigned char flag;
//  375   
//  376   *troco = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
//  377   
//  378   tentativas=10;
        MOVS     R0,#+10
        MOVS     R7,R0
//  379   do flag = MDB_coin_check_tubes(tubos);
??MDB_checa_troco_0:
        ADD      R0,SP,#+4
          CFI FunCall MDB_coin_check_tubes
        BL       MDB_coin_check_tubes
        MOVS     R6,R0
//  380   while(!flag && --tentativas);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??MDB_checa_troco_1
        SUBS     R7,R7,#+1
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??MDB_checa_troco_0
//  381 
//  382   if(!flag)
??MDB_checa_troco_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??MDB_checa_troco_2
//  383     return 0;
        MOVS     R0,#+0
        B.N      ??MDB_checa_troco_3
//  384 
//  385   tentativas=10;  
??MDB_checa_troco_2:
        MOVS     R0,#+10
        MOVS     R7,R0
//  386   do res = MDB_checa_valor_moedas(&escala,canais);
??MDB_checa_troco_4:
        ADD      R1,SP,#+20
        ADD      R0,SP,#+0
          CFI FunCall MDB_checa_valor_moedas
        BL       MDB_checa_valor_moedas
        MOVS     R5,R0
//  387   while(res!=MDB_OK && --tentativas);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??MDB_checa_troco_5
        SUBS     R7,R7,#+1
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??MDB_checa_troco_4
//  388   
//  389   if(res==MDB_OK){
??MDB_checa_troco_5:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??MDB_checa_troco_6
//  390     
//  391     for(unsigned char i=0;i<16;i++)
        MOVS     R0,#+0
??MDB_checa_troco_7:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BGE.N    ??MDB_checa_troco_8
//  392       *troco+= tubos[i]*canais[i]*escala;
        LDR      R1,[R4, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R2,SP,#+4
        LDRB     R2,[R0, R2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R3,SP,#+20
        LDRB     R3,[R0, R3]
        MULS     R2,R3,R2
        LDRB     R3,[SP, #+0]
        MLA      R1,R3,R2,R1
        STR      R1,[R4, #+0]
        ADDS     R0,R0,#+1
        B.N      ??MDB_checa_troco_7
//  393     
//  394     return 255;  
??MDB_checa_troco_8:
        MOVS     R0,#+255
        B.N      ??MDB_checa_troco_3
//  395   }  
//  396   
//  397   return 0;  
??MDB_checa_troco_6:
        MOVS     R0,#+0
??MDB_checa_troco_3:
        ADD      SP,SP,#+36
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock11
//  398 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  399 /***********************************************************************************
//  400 *       Fim do arquivo
//  401 ***********************************************************************************/
// 
//    81 bytes in section .bss
// 1 142 bytes in section .text
// 
// 1 120 bytes of CODE memory (+ 22 bytes shared)
//    81 bytes of DATA memory
//
//Errors: none
//Warnings: 2
