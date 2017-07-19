///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     19/Jul/2017  15:04:09 /
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
        PUBLIC MDBCASHLESS_start_vend
        
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
//  129   buffer[1] = 0x00;
        MOVS     R0,#+0
        STRB     R0,[SP, #+13]
//  130   buffer[2] = 0x03;
        MOVS     R0,#+3
        STRB     R0,[SP, #+14]
//  131   buffer[3] = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+15]
//  132   buffer[4] = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+16]
//  133   buffer[5] = 0;
        MOVS     R0,#+0
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
//  176   buffer[0] = CASHLESS_SETUP;
        MOVS     R2,#+17
        STRB     R2,[SP, #+12]
//  177   buffer[1] = 0x01;
        MOVS     R2,#+1
        STRB     R2,[SP, #+13]
//  178   buffer[2] = max>>8;
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[SP, #+14]
//  179   buffer[3] = max>>16;
        MOVS     R1,#+0
        STRB     R1,[SP, #+15]
//  180   buffer[4] = min>>8;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R1,R0,#+8
        STRB     R1,[SP, #+16]
//  181   buffer[5] = min;
        STRB     R0,[SP, #+17]
//  182   
//  183   if(MDB_send_package(1,buffer,6,0,buffer,&recebidos)==MDB_OK){
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
//  184         
//  185     if(buffer[0]==MDB_RESP_ACK)
        LDRB     R0,[SP, #+12]
        CMP      R0,#+0
        BNE.N    ??CASHLESS_set_min_and_max_price_in_device_1
//  186       return MDB_OK;
        MOVS     R0,#+0
        B.N      ??CASHLESS_set_min_and_max_price_in_device_2
//  187     
//  188     return MDB_ERROR;
??CASHLESS_set_min_and_max_price_in_device_1:
        MOVS     R0,#+1
        B.N      ??CASHLESS_set_min_and_max_price_in_device_2
//  189   }
//  190     
//  191   return  MDB_TIMEOUT;                                                    
??CASHLESS_set_min_and_max_price_in_device_0:
        MOVS     R0,#+2
??CASHLESS_set_min_and_max_price_in_device_2:
        ADD      SP,SP,#+52
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock3
//  192 }
//  193 /***********************************************************************************
//  194 *       Descrição       :       Pool do dispositivo
//  195 *       Parametros      :       nenhum
//  196 *       Retorno         :       (eMDB_reply) resultado da operçaão
//  197 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function CASHLESS_poll_device
        THUMB
//  198 eMDB_reply CASHLESS_poll_device(eMDB_POLL_HEADER *header,unsigned char *args){
CASHLESS_poll_device:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+16
          CFI CFA R13+24
        MOVS     R4,R0
//  199   unsigned char buffer[2];
//  200   unsigned char recebidos;
//  201   
//  202   buffer[0] = CASHLESS_POLL;
        MOVS     R0,#+18
        STRB     R0,[SP, #+8]
//  203   
//  204   if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
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
//  205             
//  206     switch(buffer[0]){
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
//  207       case CASHLESS_POOL_JUST_RESET:
//  208            *header = CASHLESS_POOL_JUST_RESET;
??CASHLESS_poll_device_1:
        MOVS     R0,#+0
        STRB     R0,[R4, #+0]
//  209            break;
        B.N      ??CASHLESS_poll_device_19
//  210       case CASHLESS_POOL_READER_CONFIG_DATA:
//  211            break;
??CASHLESS_poll_device_2:
        B.N      ??CASHLESS_poll_device_19
//  212       case CASHLESS_POOL_DISPLAY_REQUEST:
//  213            break;
??CASHLESS_poll_device_3:
        B.N      ??CASHLESS_poll_device_19
//  214       case CASHLESS_POOL_BEGIN_SESSION:
//  215            break;
??CASHLESS_poll_device_4:
        B.N      ??CASHLESS_poll_device_19
//  216       case CASHLESS_POOL_SESSION_CANCEL_REQUEST:
//  217            break;
??CASHLESS_poll_device_5:
        B.N      ??CASHLESS_poll_device_19
//  218       case CASHLESS_POOL_VEND_APPROVED:
//  219            break;
??CASHLESS_poll_device_6:
        B.N      ??CASHLESS_poll_device_19
//  220       case CASHLESS_POOL_VEND_DENIED:
//  221            break;
??CASHLESS_poll_device_7:
        B.N      ??CASHLESS_poll_device_19
//  222       case CASHLESS_POOL_END_SESSION:
//  223            break;
??CASHLESS_poll_device_8:
        B.N      ??CASHLESS_poll_device_19
//  224       case CASHLESS_POOL_CANCELLED:
//  225            break;
??CASHLESS_poll_device_9:
        B.N      ??CASHLESS_poll_device_19
//  226       case CASHLESS_POOL_PERIPHERAL_ID:
//  227            break;
??CASHLESS_poll_device_10:
        B.N      ??CASHLESS_poll_device_19
//  228       case CASHLESS_POOL_MALFUNCTION:
//  229            break;
??CASHLESS_poll_device_11:
        B.N      ??CASHLESS_poll_device_19
//  230       case CASHLESS_POOL_CMD_OUT_OF_SEQUENCE:
//  231            break;
??CASHLESS_poll_device_12:
        B.N      ??CASHLESS_poll_device_19
//  232       case CASHLESS_POOL_REVALUE_APPROVED:
//  233            break;
??CASHLESS_poll_device_13:
        B.N      ??CASHLESS_poll_device_19
//  234       case CASHLESS_POOL_REVALUE_DENIED:
//  235            break;
??CASHLESS_poll_device_14:
        B.N      ??CASHLESS_poll_device_19
//  236       case CASHLESS_POOL_REVALUE_LIMIT_AMOUNT:
//  237            break;
??CASHLESS_poll_device_15:
        B.N      ??CASHLESS_poll_device_19
//  238       case CASHLESS_POOL_USER_FILE:
//  239            break;
??CASHLESS_poll_device_16:
        B.N      ??CASHLESS_poll_device_19
//  240       case CASHLESS_POOL_TIME_DATE_REQUEST:
//  241            break;
??CASHLESS_poll_device_17:
        B.N      ??CASHLESS_poll_device_19
//  242       case CASHLESS_DATA_ENTRY:
//  243            break;
//  244     }
//  245         
//  246     
//  247     return MDB_OK;
??CASHLESS_poll_device_18:
??CASHLESS_poll_device_19:
        MOVS     R0,#+0
        B.N      ??CASHLESS_poll_device_20
//  248   }
//  249     
//  250   return  MDB_TIMEOUT;  
??CASHLESS_poll_device_0:
        MOVS     R0,#+2
??CASHLESS_poll_device_20:
        ADD      SP,SP,#+16
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4
//  251 }
//  252 /***********************************************************************************
//  253 *       Descrição       :       Envia o comando solicitando um inicio de 
//  254 *                               transação
//  255 *       Parametros      :       (unsigned short int) valor
//  256 *                               (unsigned short int) código do produto
//  257 *       Retorno         :       (eMDB_reply) maior do que zero se 
//  258 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MDBCASHLESS_start_vend
        THUMB
//  259 eMDB_reply MDBCASHLESS_start_vend(unsigned short int valor,unsigned short int code){
MDBCASHLESS_start_vend:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  260   unsigned char buffer[6];
//  261   unsigned char recebidos;                      
//  262   
//  263   buffer[0] = CASHLESS_VEND;
        MOVS     R2,#+19
        STRB     R2,[SP, #+12]
//  264   buffer[1] = REQUEST_VEND;
        MOVS     R2,#+0
        STRB     R2,[SP, #+13]
//  265   buffer[2] = (unsigned char)valor>>8;
        MOVS     R2,#+0
        STRB     R2,[SP, #+14]
//  266   buffer[3] = valor;
        STRB     R0,[SP, #+15]
//  267   buffer[4] = (unsigned char)code>>8;
        MOVS     R0,#+0
        STRB     R0,[SP, #+16]
//  268   buffer[5] = code;
        STRB     R1,[SP, #+17]
//  269   
//  270   if(MDB_send_package(1,buffer,6,0,buffer,&recebidos)==MDB_OK){
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
//  271     
//  272     
//  273     
//  274     return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBCASHLESS_start_vend_1
//  275   }
//  276   
//  277   return MDB_TIMEOUT;
??MDBCASHLESS_start_vend_0:
        MOVS     R0,#+2
??MDBCASHLESS_start_vend_1:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock5
//  278 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  279 /***********************************************************************************
//  280 *       Fim do arquivo
//  281 ***********************************************************************************/
// 
// 604 bytes in section .text
// 
// 604 bytes of CODE memory
//
//Errors: none
//Warnings: none
