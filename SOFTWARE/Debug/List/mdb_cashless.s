///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  13:22:52 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\MDB\mdb_cashless.c              /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\MDB\mdb_cashless.c -lC          /
//                    C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Debug\List\ -lA                         /
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
//                    pocaG2\SOFTWARE\Debug\List\mdb_cashless.s               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME mdb_cashless

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN MDB_send_package

        PUBLIC CASHLESS_adreess
        PUBLIC CASHLESS_poll_device
        PUBLIC CASHLESS_reset_device
        PUBLIC CASHLESS_set_and_get_setup_from_to_device
        PUBLIC CASHLESS_set_min_and_max_price_in_device
        PUBLIC MDBCASHLESS_enable_reader
        PUBLIC MDBCASHLESS_session_complete
        PUBLIC MDBCASHLESS_start_vend
        PUBLIC MDBCASHLESS_vend_cancel
        PUBLIC MDBCASHLESS_vend_success
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\MDB\mdb_cashless.c
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
//   17 |       Arquivo            :  mdb_cashless.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  27/02/2017
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
//   31 #include <stdio.h>
//   32 #include <stdlib.h>
//   33 #include <string.h>
//   34 #include "mdb_uart.h"
//   35 #include "mdb.h"
//   36 #include "mdb_cashless.h"
//   37 
//   38 
//   39 /***********************************************************************************
//   40 *       Definições
//   41 ***********************************************************************************/
//   42 
//   43 
//   44 /***********************************************************************************
//   45 *       Variaveis locais
//   46 ***********************************************************************************/
//   47 
//   48 
//   49 /***********************************************************************************
//   50 *       Funções locais
//   51 ***********************************************************************************/
//   52 
//   53 
//   54 /***********************************************************************************
//   55 *       Implementação das funções
//   56 ***********************************************************************************/
//   57 
//   58 /***********************************************************************************
//   59 *       Descrição       :       Verifica se o dispositivo está presente
//   60 *                               no barramento
//   61 *       Parametros      :       nenhum
//   62 *       Retorno         :       (eMDB_reply) resultado
//   63 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function CASHLESS_adreess
        THUMB
//   64 eMDB_reply CASHLESS_adreess(void){
CASHLESS_adreess:
        PUSH     {R5-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+16
//   65   unsigned char buffer[2];
//   66   unsigned char recebidos;
//   67   
//   68   buffer[0] = MDB_CASHLESS_DEVICE;
        MOVS     R0,#+16
        STRB     R0,[SP, #+8]
//   69   
//   70   if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
        ADD      R0,SP,#+10
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+1
        ADD      R1,SP,#+8
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??CASHLESS_adreess_0
//   71         
//   72     if(buffer[0]==MDB_RESP_ACK)
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??CASHLESS_adreess_1
//   73       return MDB_OK;
        MOVS     R0,#+0
        B.N      ??CASHLESS_adreess_2
//   74     
//   75     return MDB_ERROR;
??CASHLESS_adreess_1:
        MOVS     R0,#+1
        B.N      ??CASHLESS_adreess_2
//   76   }
//   77     
//   78   return  MDB_TIMEOUT; 
??CASHLESS_adreess_0:
        MOVS     R0,#+2
??CASHLESS_adreess_2:
        POP      {R1-R3,PC}       ;; return
          CFI EndBlock cfiBlock0
//   79 }
//   80 /***********************************************************************************
//   81 *       Descrição       :       Faz o reset da interface de cartão
//   82 *       Parametros      :       nenhum
//   83 *       Retorno         :       (eMDB_reply) resultado da operação
//   84 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function CASHLESS_reset_device
        THUMB
//   85 eMDB_reply CASHLESS_reset_device(void){
CASHLESS_reset_device:
        PUSH     {R5-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+16
//   86   unsigned char buffer[2];
//   87   unsigned char recebidos;
//   88   
//   89   buffer[0] = CASHLESS_RESET;
        MOVS     R0,#+16
        STRB     R0,[SP, #+8]
//   90   
//   91   if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
        ADD      R0,SP,#+10
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+1
        ADD      R1,SP,#+8
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??CASHLESS_reset_device_0
//   92         
//   93     if(buffer[0]==MDB_RESP_ACK)
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??CASHLESS_reset_device_1
//   94       return MDB_OK;
        MOVS     R0,#+0
        B.N      ??CASHLESS_reset_device_2
//   95     
//   96     return MDB_ERROR;
??CASHLESS_reset_device_1:
        MOVS     R0,#+1
        B.N      ??CASHLESS_reset_device_2
//   97   }
//   98     
//   99   return  MDB_TIMEOUT; 
??CASHLESS_reset_device_0:
        MOVS     R0,#+2
??CASHLESS_reset_device_2:
        POP      {R1-R3,PC}       ;; return
          CFI EndBlock cfiBlock1
//  100 }
//  101 /***********************************************************************************
//  102 *       Descrição       :     Lê e escreve nas configurações do cashless
//  103 *       Parametros      :     (unsigned char) nível mdb
//  104 *                             (unsigned char) quantidade de colunas do display
//  105 *                             (unsigned char) quantidade de linhas do display
//  106 *                             (eMDB_DISPLAY_INFO) informação sobre o display
//  107 *                             (unsigned char*) nível configuraod
//  108 *                             (unsigned short int*) pais
//  109 *                             (unsigned char*) fator de escala
//  110 *                             (unsigned char*) casas decimais
//  111 *                             (unsigned char*) tempo máximo para transação
//  112 *                             (unsigned char*) opções gerais
//  113 *       Retorno         :     (eMDB_reply) resultado da operação
//  114 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function CASHLESS_set_and_get_setup_from_to_device
        THUMB
//  115 eMDB_reply CASHLESS_set_and_get_setup_from_to_device(unsigned char nivel_mdb,
//  116                                                      unsigned char linhas_lcd,
//  117                                                      unsigned char colunas_lcd,
//  118                                                      eMDB_DISPLAY_INFO info_lcd,                                                     
//  119                                                      unsigned char *nivel_configurado,
//  120                                                      unsigned short int*pais,
//  121                                                      unsigned char *escala,
//  122                                                      unsigned char *casas_decimais,
//  123                                                      unsigned char *tempo_maximo_transacao,
//  124                                                      unsigned char *opcoes_gerais){
CASHLESS_set_and_get_setup_from_to_device:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+52
          CFI CFA R13+56
//  125   unsigned char buffer[36];
//  126   unsigned char recebidos;
//  127   
//  128   buffer[0] = CASHLESS_SETUP;
        MOVS     R0,#+17
        STRB     R0,[SP, #+12]
//  129   buffer[1] = 0x00;// Config DATA
        MOVS     R0,#+0
        STRB     R0,[SP, #+13]
//  130   buffer[2] = 0x01;// Nivel da comunicação
        MOVS     R0,#+1
        STRB     R0,[SP, #+14]
//  131   buffer[3] = 16;   // Colunas do LCD
        MOVS     R0,#+16
        STRB     R0,[SP, #+15]
//  132   buffer[4] = 2;    // Linhas do LCD
        MOVS     R0,#+2
        STRB     R0,[SP, #+16]
//  133   buffer[5] = 1;    // full ascii display
        MOVS     R0,#+1
        STRB     R0,[SP, #+17]
//  134   
//  135   if(MDB_send_package(1,buffer,6,1,buffer,&recebidos)==MDB_OK){
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+6
        ADD      R1,SP,#+12
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??CASHLESS_set_and_get_setup_from_to_device_0
//  136         
//  137     if(buffer[0]==0x01 && recebidos>1){
        LDRB     R0,[SP, #+12]
        CMP      R0,#+1
        BNE.N    ??CASHLESS_set_and_get_setup_from_to_device_1
        LDRB     R0,[SP, #+8]
        CMP      R0,#+2
        BLT.N    ??CASHLESS_set_and_get_setup_from_to_device_1
        LDR      R0,[SP, #+56]
//  138       
//  139       if(nivel_configurado!=NULL)
        CMP      R0,#+0
        BEQ.N    ??CASHLESS_set_and_get_setup_from_to_device_2
//  140         *nivel_configurado = buffer[Z2];
        LDRB     R1,[SP, #+13]
        STRB     R1,[R0, #+0]
??CASHLESS_set_and_get_setup_from_to_device_2:
        LDR      R0,[SP, #+60]
//  141       
//  142       if(pais!=NULL)
        CMP      R0,#+0
        BEQ.N    ??CASHLESS_set_and_get_setup_from_to_device_3
//  143         *pais = buffer[Z3]<<8 | buffer[Z4];
        LDRB     R1,[SP, #+14]
        LDRB     R2,[SP, #+15]
        ORRS     R1,R2,R1, LSL #+8
        STRH     R1,[R0, #+0]
??CASHLESS_set_and_get_setup_from_to_device_3:
        LDR      R0,[SP, #+64]
//  144       
//  145       if(escala!=NULL)
        CMP      R0,#+0
        BEQ.N    ??CASHLESS_set_and_get_setup_from_to_device_4
//  146         *escala = buffer[Z5];
        LDRB     R1,[SP, #+16]
        STRB     R1,[R0, #+0]
??CASHLESS_set_and_get_setup_from_to_device_4:
        LDR      R0,[SP, #+68]
//  147       
//  148       if(casas_decimais!=NULL)
        CMP      R0,#+0
        BEQ.N    ??CASHLESS_set_and_get_setup_from_to_device_5
//  149         *casas_decimais = buffer[Z6];
        LDRB     R1,[SP, #+17]
        STRB     R1,[R0, #+0]
??CASHLESS_set_and_get_setup_from_to_device_5:
        LDR      R0,[SP, #+72]
//  150       
//  151       if(tempo_maximo_transacao!=NULL)
        CMP      R0,#+0
        BEQ.N    ??CASHLESS_set_and_get_setup_from_to_device_6
//  152         *tempo_maximo_transacao = buffer[Z7];
        LDRB     R1,[SP, #+18]
        STRB     R1,[R0, #+0]
??CASHLESS_set_and_get_setup_from_to_device_6:
        LDR      R0,[SP, #+76]
//  153       
//  154       if(opcoes_gerais!=NULL)
        CMP      R0,#+0
        BEQ.N    ??CASHLESS_set_and_get_setup_from_to_device_7
//  155         *opcoes_gerais = buffer[Z8];      
        LDRB     R1,[SP, #+19]
        STRB     R1,[R0, #+0]
//  156       
//  157       return MDB_OK;  
??CASHLESS_set_and_get_setup_from_to_device_7:
        MOVS     R0,#+0
        B.N      ??CASHLESS_set_and_get_setup_from_to_device_8
//  158     }
//  159     
//  160     return MDB_ERROR;
??CASHLESS_set_and_get_setup_from_to_device_1:
        MOVS     R0,#+1
        B.N      ??CASHLESS_set_and_get_setup_from_to_device_8
//  161   }
//  162     
//  163   return  MDB_TIMEOUT;                                                                                                  
??CASHLESS_set_and_get_setup_from_to_device_0:
        MOVS     R0,#+2
??CASHLESS_set_and_get_setup_from_to_device_8:
        ADD      SP,SP,#+52
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock2
//  164 }
//  165 /***********************************************************************************
//  166 *       Descrição       :       Configura o preço mínimo e máximo do produto
//  167 *       Parametros      :       (unsigned short int) mínimo
//  168 *                               (unsigned short int) máximo
//  169 *       Retorno         :       (eMDB_reply) resultado da operação
//  170 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function CASHLESS_set_min_and_max_price_in_device
        THUMB
//  171 eMDB_reply CASHLESS_set_min_and_max_price_in_device(unsigned short int min,
//  172                                                     unsigned short int max){
CASHLESS_set_min_and_max_price_in_device:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+52
          CFI CFA R13+56
//  173   unsigned char buffer[36];
//  174   unsigned char recebidos;
//  175   
//  176   min*=100;
        MOVS     R2,#+100
        MULS     R0,R2,R0
//  177   max*=100;
        MOVS     R2,#+100
        MULS     R1,R2,R1
//  178   
//  179   buffer[0] = CASHLESS_SETUP;
        MOVS     R2,#+17
        STRB     R2,[SP, #+12]
//  180   buffer[1] = 0x01;
        MOVS     R2,#+1
        STRB     R2,[SP, #+13]
//  181   buffer[2] = max>>8;
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[SP, #+14]
//  182   buffer[3] = max>>16;
        MOVS     R1,#+0
        STRB     R1,[SP, #+15]
//  183   buffer[4] = min>>8;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R1,R0,#+8
        STRB     R1,[SP, #+16]
//  184   buffer[5] = min;
        STRB     R0,[SP, #+17]
//  185   
//  186   if(MDB_send_package(1,buffer,6,0,buffer,&recebidos)==MDB_OK){
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+6
        ADD      R1,SP,#+12
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??CASHLESS_set_min_and_max_price_in_device_0
//  187         
//  188     if(buffer[0]==MDB_RESP_ACK)
        LDRB     R0,[SP, #+12]
        CMP      R0,#+0
        BNE.N    ??CASHLESS_set_min_and_max_price_in_device_1
//  189       return MDB_OK;
        MOVS     R0,#+0
        B.N      ??CASHLESS_set_min_and_max_price_in_device_2
//  190     
//  191     return MDB_ERROR;
??CASHLESS_set_min_and_max_price_in_device_1:
        MOVS     R0,#+1
        B.N      ??CASHLESS_set_min_and_max_price_in_device_2
//  192   }
//  193     
//  194   return  MDB_TIMEOUT;                                                    
??CASHLESS_set_min_and_max_price_in_device_0:
        MOVS     R0,#+2
??CASHLESS_set_min_and_max_price_in_device_2:
        ADD      SP,SP,#+52
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock3
//  195 }
//  196 /***********************************************************************************
//  197 *       Descrição       :       Pool do dispositivo
//  198 *       Parametros      :       nenhum
//  199 *       Retorno         :       (eMDB_reply) resultado da operçaão
//  200 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function CASHLESS_poll_device
        THUMB
//  201 eMDB_reply CASHLESS_poll_device(eMDB_POLL_HEADER *header,unsigned char *args){
CASHLESS_poll_device:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+16
          CFI CFA R13+24
        MOVS     R4,R0
//  202   unsigned char buffer[2];
//  203   unsigned char recebidos;
//  204   
//  205   buffer[0] = CASHLESS_POLL;
        MOVS     R0,#+18
        STRB     R0,[SP, #+8]
//  206   
//  207   if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
        ADD      R0,SP,#+10
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+1
        ADD      R1,SP,#+8
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??CASHLESS_poll_device_0
//  208             
//  209     switch(buffer[0]){
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BEQ.N    ??CASHLESS_poll_device_1
        CMP      R0,#+1
        BEQ.N    ??CASHLESS_poll_device_2
        CMP      R0,#+2
        BEQ.N    ??CASHLESS_poll_device_3
        CMP      R0,#+3
        BEQ.N    ??CASHLESS_poll_device_4
        CMP      R0,#+4
        BEQ.N    ??CASHLESS_poll_device_5
        CMP      R0,#+5
        BEQ.N    ??CASHLESS_poll_device_6
        CMP      R0,#+6
        BEQ.N    ??CASHLESS_poll_device_7
        CMP      R0,#+7
        BEQ.N    ??CASHLESS_poll_device_8
        CMP      R0,#+8
        BEQ.N    ??CASHLESS_poll_device_9
        CMP      R0,#+9
        BEQ.N    ??CASHLESS_poll_device_10
        CMP      R0,#+10
        BEQ.N    ??CASHLESS_poll_device_11
        CMP      R0,#+11
        BEQ.N    ??CASHLESS_poll_device_12
        CMP      R0,#+13
        BEQ.N    ??CASHLESS_poll_device_13
        CMP      R0,#+14
        BEQ.N    ??CASHLESS_poll_device_14
        CMP      R0,#+15
        BEQ.N    ??CASHLESS_poll_device_15
        CMP      R0,#+16
        BEQ.N    ??CASHLESS_poll_device_16
        CMP      R0,#+17
        BEQ.N    ??CASHLESS_poll_device_17
        CMP      R0,#+18
        BEQ.N    ??CASHLESS_poll_device_18
        B.N      ??CASHLESS_poll_device_19
//  210       case CASHLESS_POOL_JUST_RESET:
//  211            *header = CASHLESS_POOL_JUST_RESET;
??CASHLESS_poll_device_1:
        MOVS     R0,#+0
        STRB     R0,[R4, #+0]
//  212            break;
        B.N      ??CASHLESS_poll_device_19
//  213       case CASHLESS_POOL_READER_CONFIG_DATA:
//  214            *header = CASHLESS_POOL_READER_CONFIG_DATA;
??CASHLESS_poll_device_2:
        MOVS     R0,#+1
        STRB     R0,[R4, #+0]
//  215            break;
        B.N      ??CASHLESS_poll_device_19
//  216       case CASHLESS_POOL_DISPLAY_REQUEST:
//  217            *header = CASHLESS_POOL_DISPLAY_REQUEST;
??CASHLESS_poll_device_3:
        MOVS     R0,#+2
        STRB     R0,[R4, #+0]
//  218            break;
        B.N      ??CASHLESS_poll_device_19
//  219       case CASHLESS_POOL_BEGIN_SESSION:
//  220            *header = CASHLESS_POOL_BEGIN_SESSION;
??CASHLESS_poll_device_4:
        MOVS     R0,#+3
        STRB     R0,[R4, #+0]
//  221            break;
        B.N      ??CASHLESS_poll_device_19
//  222       case CASHLESS_POOL_SESSION_CANCEL_REQUEST:
//  223            *header = CASHLESS_POOL_SESSION_CANCEL_REQUEST;
??CASHLESS_poll_device_5:
        MOVS     R0,#+4
        STRB     R0,[R4, #+0]
//  224            break;
        B.N      ??CASHLESS_poll_device_19
//  225       case CASHLESS_POOL_VEND_APPROVED:
//  226            *header = CASHLESS_POOL_VEND_APPROVED;
??CASHLESS_poll_device_6:
        MOVS     R0,#+5
        STRB     R0,[R4, #+0]
//  227            break;
        B.N      ??CASHLESS_poll_device_19
//  228       case CASHLESS_POOL_VEND_DENIED:
//  229            *header = CASHLESS_POOL_VEND_DENIED;
??CASHLESS_poll_device_7:
        MOVS     R0,#+6
        STRB     R0,[R4, #+0]
//  230            break;
        B.N      ??CASHLESS_poll_device_19
//  231       case CASHLESS_POOL_END_SESSION:
//  232            *header = CASHLESS_POOL_END_SESSION;
??CASHLESS_poll_device_8:
        MOVS     R0,#+7
        STRB     R0,[R4, #+0]
//  233            break;
        B.N      ??CASHLESS_poll_device_19
//  234       case CASHLESS_POOL_CANCELLED:
//  235            *header = CASHLESS_POOL_CANCELLED;
??CASHLESS_poll_device_9:
        MOVS     R0,#+8
        STRB     R0,[R4, #+0]
//  236            break;
        B.N      ??CASHLESS_poll_device_19
//  237       case CASHLESS_POOL_PERIPHERAL_ID:
//  238            *header = CASHLESS_POOL_PERIPHERAL_ID;
??CASHLESS_poll_device_10:
        MOVS     R0,#+9
        STRB     R0,[R4, #+0]
//  239            break;
        B.N      ??CASHLESS_poll_device_19
//  240       case CASHLESS_POOL_MALFUNCTION:
//  241            *header = CASHLESS_POOL_MALFUNCTION;
??CASHLESS_poll_device_11:
        MOVS     R0,#+10
        STRB     R0,[R4, #+0]
//  242            break;
        B.N      ??CASHLESS_poll_device_19
//  243       case CASHLESS_POOL_CMD_OUT_OF_SEQUENCE:
//  244            *header = CASHLESS_POOL_CMD_OUT_OF_SEQUENCE;
??CASHLESS_poll_device_12:
        MOVS     R0,#+11
        STRB     R0,[R4, #+0]
//  245            break;
        B.N      ??CASHLESS_poll_device_19
//  246       case CASHLESS_POOL_REVALUE_APPROVED:
//  247            *header = CASHLESS_POOL_REVALUE_APPROVED;
??CASHLESS_poll_device_13:
        MOVS     R0,#+13
        STRB     R0,[R4, #+0]
//  248            break;
        B.N      ??CASHLESS_poll_device_19
//  249       case CASHLESS_POOL_REVALUE_DENIED:
//  250            *header = CASHLESS_POOL_REVALUE_DENIED;        
??CASHLESS_poll_device_14:
        MOVS     R0,#+14
        STRB     R0,[R4, #+0]
//  251            break;
        B.N      ??CASHLESS_poll_device_19
//  252       case CASHLESS_POOL_REVALUE_LIMIT_AMOUNT:
//  253            *header = CASHLESS_POOL_REVALUE_LIMIT_AMOUNT;       
??CASHLESS_poll_device_15:
        MOVS     R0,#+15
        STRB     R0,[R4, #+0]
//  254            break;
        B.N      ??CASHLESS_poll_device_19
//  255       case CASHLESS_POOL_USER_FILE:
//  256            *header = CASHLESS_POOL_USER_FILE;  
??CASHLESS_poll_device_16:
        MOVS     R0,#+16
        STRB     R0,[R4, #+0]
//  257            break;
        B.N      ??CASHLESS_poll_device_19
//  258       case CASHLESS_POOL_TIME_DATE_REQUEST:
//  259            *header = CASHLESS_POOL_TIME_DATE_REQUEST;          
??CASHLESS_poll_device_17:
        MOVS     R0,#+17
        STRB     R0,[R4, #+0]
//  260            break;
        B.N      ??CASHLESS_poll_device_19
//  261       case CASHLESS_DATA_ENTRY:
//  262            *header = CASHLESS_DATA_ENTRY;          
??CASHLESS_poll_device_18:
        MOVS     R0,#+18
        STRB     R0,[R4, #+0]
//  263            break;
//  264     }
//  265         
//  266     
//  267     return MDB_OK;
??CASHLESS_poll_device_19:
        MOVS     R0,#+0
        B.N      ??CASHLESS_poll_device_20
//  268   }
//  269     
//  270   return  MDB_TIMEOUT;  
??CASHLESS_poll_device_0:
        MOVS     R0,#+2
??CASHLESS_poll_device_20:
        ADD      SP,SP,#+16
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4
//  271 }
//  272 /***********************************************************************************
//  273 *       Descrição       :       Envia o comando solicitando um inicio de 
//  274 *                               transação
//  275 *       Parametros      :       (unsigned short int) valor
//  276 *                               (unsigned short int) código do produto
//  277 *       Retorno         :       (eMDB_reply) maior do que zero se 
//  278 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MDBCASHLESS_start_vend
        THUMB
//  279 eMDB_reply MDBCASHLESS_start_vend(eCASHLESS_VEND_RESULT *resultado,
//  280                                   unsigned short int *pago,
//  281                                   unsigned short int valor,unsigned short int code){
MDBCASHLESS_start_vend:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
//  282   unsigned char buffer[6];
//  283   unsigned char recebidos;    
//  284   
//  285   
//  286   buffer[0] = CASHLESS_VEND;
        MOVS     R0,#+19
        STRB     R0,[SP, #+12]
//  287   buffer[1] = REQUEST_VEND;
        MOVS     R0,#+0
        STRB     R0,[SP, #+13]
//  288   buffer[2] = (unsigned char)(valor>>8);
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSRS     R0,R2,#+8
        STRB     R0,[SP, #+14]
//  289   buffer[3] = valor;
        STRB     R2,[SP, #+15]
//  290   buffer[4] = (unsigned char)(code>>8);
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LSRS     R0,R3,#+8
        STRB     R0,[SP, #+16]
//  291   buffer[5] = code;
        STRB     R3,[SP, #+17]
//  292   
//  293   *resultado = VEND_DENIED;
        MOVS     R0,#+6
        STRB     R0,[R4, #+0]
//  294   
//  295   if(MDB_send_package(1,buffer,6,0,buffer,&recebidos)==MDB_OK){
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+6
        ADD      R1,SP,#+12
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??MDBCASHLESS_start_vend_0
//  296     
//  297     *resultado = (eCASHLESS_VEND_RESULT)buffer[Z1];    
        LDRB     R0,[SP, #+12]
        STRB     R0,[R4, #+0]
//  298     *pago = buffer[Z2]<<8 | buffer[Z3];
        LDRB     R0,[SP, #+13]
        LDRB     R1,[SP, #+14]
        ORRS     R0,R1,R0, LSL #+8
        STRH     R0,[R5, #+0]
//  299     
//  300     return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBCASHLESS_start_vend_1
//  301   }
//  302   
//  303   return MDB_TIMEOUT;
??MDBCASHLESS_start_vend_0:
        MOVS     R0,#+2
??MDBCASHLESS_start_vend_1:
        ADD      SP,SP,#+20
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock5
//  304 }
//  305 /***********************************************************************************
//  306 *       Descrição       :       Envia o comando para cancelamento da venda
//  307 *       Parametros      :       nenhum
//  308 *       Retorno         :       (eMDB_reply) se receber resposta
//  309 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MDBCASHLESS_vend_cancel
        THUMB
//  310 eMDB_reply MDBCASHLESS_vend_cancel(void){
MDBCASHLESS_vend_cancel:
        PUSH     {R5-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+16
//  311   unsigned char buffer[2]  ;
//  312   unsigned char recebidos;
//  313   
//  314   buffer[Z1] = CASHLESS_VEND;
        MOVS     R0,#+19
        STRB     R0,[SP, #+8]
//  315   buffer[Z2] = CANCEL_VEND;
        MOVS     R0,#+1
        STRB     R0,[SP, #+9]
//  316   
//  317   if(MDB_send_package(1,buffer,2,0,buffer,&recebidos)==MDB_OK){
        ADD      R0,SP,#+10
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+2
        ADD      R1,SP,#+8
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??MDBCASHLESS_vend_cancel_0
//  318    
//  319     if(buffer[Z1] == VEND_DENIED)
        LDRB     R0,[SP, #+8]
        CMP      R0,#+6
        BNE.N    ??MDBCASHLESS_vend_cancel_0
//  320       return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBCASHLESS_vend_cancel_1
//  321   }
//  322   
//  323   return MDB_TIMEOUT;
??MDBCASHLESS_vend_cancel_0:
        MOVS     R0,#+2
??MDBCASHLESS_vend_cancel_1:
        POP      {R1-R3,PC}       ;; return
          CFI EndBlock cfiBlock6
//  324 }
//  325 /***********************************************************************************
//  326 *       Descrição       :       Sucesso na venda
//  327 *       Parametros      :       (unsigned short int) item
//  328 *       Retorno         :       (eMDB_reply) se receber resposta
//  329 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function MDBCASHLESS_vend_success
        THUMB
//  330 eMDB_reply MDBCASHLESS_vend_success(unsigned short int item){
MDBCASHLESS_vend_success:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  331   unsigned char buffer[4];
//  332   unsigned char recebidos;
//  333   
//  334   buffer[Z1] = CASHLESS_VEND;
        MOVS     R1,#+19
        STRB     R1,[SP, #+12]
//  335   buffer[Z2] = SUCCESS_VEND;
        MOVS     R1,#+2
        STRB     R1,[SP, #+13]
//  336   buffer[Z3] = item>>8;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R1,R0,#+8
        STRB     R1,[SP, #+14]
//  337   buffer[Z4] = item;
        STRB     R0,[SP, #+15]
//  338   
//  339   if(MDB_send_package(1,buffer,4,0,buffer,&recebidos)==MDB_OK){
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+4
        ADD      R1,SP,#+12
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??MDBCASHLESS_vend_success_0
//  340    
//  341     
//  342     return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBCASHLESS_vend_success_1
//  343   }
//  344       
//  345   return MDB_TIMEOUT;
??MDBCASHLESS_vend_success_0:
        MOVS     R0,#+2
??MDBCASHLESS_vend_success_1:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock7
//  346 }
//  347 /***********************************************************************************
//  348 *       Descrição       :       Habilita a leitora
//  349 *       Parametros      :       nenhum
//  350 *       Retorno         :       (eMDB_reply) se receber a configurmação
//  351 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function MDBCASHLESS_enable_reader
        THUMB
//  352 eMDB_reply MDBCASHLESS_enable_reader(unsigned char flag){
MDBCASHLESS_enable_reader:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  353   unsigned char buffer[3];
//  354   unsigned char recebidos;
//  355   
//  356   buffer[Z1] = CASHLESS_READER;
        MOVS     R1,#+20
        STRB     R1,[SP, #+12]
//  357   buffer[Z2] = flag?1:0;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??MDBCASHLESS_enable_reader_0
        MOVS     R0,#+1
        B.N      ??MDBCASHLESS_enable_reader_1
??MDBCASHLESS_enable_reader_0:
        MOVS     R0,#+0
??MDBCASHLESS_enable_reader_1:
        STRB     R0,[SP, #+13]
//  358   
//  359   if(MDB_send_package(1,buffer,2,0,buffer,&recebidos)==MDB_OK){
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+2
        ADD      R1,SP,#+12
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??MDBCASHLESS_enable_reader_2
//  360       
//  361     return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBCASHLESS_enable_reader_3
//  362   }
//  363       
//  364   return MDB_TIMEOUT;
??MDBCASHLESS_enable_reader_2:
        MOVS     R0,#+2
??MDBCASHLESS_enable_reader_3:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock8
//  365 }
//  366 /***********************************************************************************
//  367 *       Descrição       :       Sessão completa
//  368 *       Parametros      :       envia o comando se fim da compra
//  369 *       Retorno         :       (eMDB_reply) se receber confirmação
//  370 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function MDBCASHLESS_session_complete
        THUMB
//  371 eMDB_reply MDBCASHLESS_session_complete(void){
MDBCASHLESS_session_complete:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  372   unsigned char buffer[3];
//  373   unsigned char recebidos;
//  374   
//  375   buffer[Z1] = CASHLESS_VEND;
        MOVS     R0,#+19
        STRB     R0,[SP, #+12]
//  376   buffer[Z2] = SESSION_COMPLETE;
        MOVS     R0,#+4
        STRB     R0,[SP, #+13]
//  377   
//  378   if(MDB_send_package(1,buffer,2,0,buffer,&recebidos)==MDB_OK){
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+2
        ADD      R1,SP,#+12
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??MDBCASHLESS_session_complete_0
//  379       
//  380     return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBCASHLESS_session_complete_1
//  381   }
//  382       
//  383   return MDB_TIMEOUT;
??MDBCASHLESS_session_complete_0:
        MOVS     R0,#+2
??MDBCASHLESS_session_complete_1:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock9
//  384 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  385 /***********************************************************************************
//  386 *       Fim do arquivo
//  387 ***********************************************************************************/
// 
// 940 bytes in section .text
// 
// 940 bytes of CODE memory
//
//Errors: none
//Warnings: none
