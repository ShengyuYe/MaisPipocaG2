///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  15:51:45 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\MDB\mdb_coin.c                  /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\MDB\mdb_coin.c -lC              /
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
//                    pocaG2\SOFTWARE\Debug\List\mdb_coin.s                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME mdb_coin

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN MDB_send_package
        EXTERN MDB_send_package_long
        EXTERN __aeabi_memcpy

        PUBLIC MDBCOIN_coin_dispense
        PUBLIC MDBCOIN_coin_type_setup
        PUBLIC MDBCOIN_get_device
        PUBLIC MDBCOIN_get_setup_from_device
        PUBLIC MDBCOIN_get_tube_status_from_device
        PUBLIC MDBCOIN_poll
        PUBLIC MDBCOIN_reset_device
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\MDB\mdb_coin.c
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
//   17 |       Arquivo            :  mdb_coin.c
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

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP memcpy
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function memcpy
        THUMB
// __intrinsic __nounwind __interwork __softfp void *memcpy(void *, void const *, size_t)
memcpy:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   34 #include "mdb_uart.h"
//   35 #include "mdb.h"
//   36 #include "mdb_coin.h"
//   37 
//   38 /***********************************************************************************
//   39 *       Definições locais
//   40 ***********************************************************************************/
//   41 
//   42 
//   43 /***********************************************************************************
//   44 *       Variaveis locais
//   45 ***********************************************************************************/
//   46 
//   47 
//   48 /***********************************************************************************
//   49 *       Funções locais
//   50 ***********************************************************************************/
//   51 
//   52 
//   53 /***********************************************************************************
//   54 *       Implementação das funções
//   55 ***********************************************************************************/
//   56 
//   57 /***********************************************************************************
//   58 *       Descrição       :       Força o reset do moedeiro
//   59 *       Parametros      :       nenhum
//   60 *       Retorno         :       (eMDB_reply) resultado da operação
//   61 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MDBCOIN_get_device
        THUMB
//   62 eMDB_reply MDBCOIN_get_device(void){
MDBCOIN_get_device:
        PUSH     {R5-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+16
//   63   unsigned char buffer[2];
//   64   unsigned char recebidos;
//   65   
//   66   buffer[0] = MDB_CHANGER;
        MOVS     R0,#+8
        STRB     R0,[SP, #+8]
//   67   if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
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
        BNE.N    ??MDBCOIN_get_device_0
//   68         
//   69     if(buffer[0]==MDB_RESP_ACK)
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??MDBCOIN_get_device_1
//   70       return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBCOIN_get_device_2
//   71     
//   72     return MDB_ERROR;
??MDBCOIN_get_device_1:
        MOVS     R0,#+1
        B.N      ??MDBCOIN_get_device_2
//   73   }
//   74     
//   75   return  MDB_TIMEOUT; 
??MDBCOIN_get_device_0:
        MOVS     R0,#+2
??MDBCOIN_get_device_2:
        POP      {R1-R3,PC}       ;; return
          CFI EndBlock cfiBlock1
//   76 }
//   77 /***********************************************************************************
//   78 *       Descrição       :       Força o reset do moedeiro
//   79 *       Parametros      :       nenhum
//   80 *       Retorno         :       (eMDB_reply) resultado da operação
//   81 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MDBCOIN_reset_device
        THUMB
//   82 eMDB_reply MDBCOIN_reset_device(void){
MDBCOIN_reset_device:
        PUSH     {R5-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+16
//   83   unsigned char buffer[2];
//   84   unsigned char recebidos;
//   85   
//   86   buffer[0] = COIN_RESET;
        MOVS     R0,#+8
        STRB     R0,[SP, #+8]
//   87   if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
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
        BNE.N    ??MDBCOIN_reset_device_0
//   88         
//   89     if(buffer[0]==MDB_RESP_ACK)
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??MDBCOIN_reset_device_1
//   90       return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBCOIN_reset_device_2
//   91     
//   92     return MDB_ERROR;
??MDBCOIN_reset_device_1:
        MOVS     R0,#+1
        B.N      ??MDBCOIN_reset_device_2
//   93   }
//   94     
//   95   return  MDB_TIMEOUT; 
??MDBCOIN_reset_device_0:
        MOVS     R0,#+2
??MDBCOIN_reset_device_2:
        POP      {R1-R3,PC}       ;; return
          CFI EndBlock cfiBlock2
//   96 }
//   97 /***********************************************************************************
//   98 *       Descrição       :       Verifica as configurações do moedeiro
//   99 *       Parametros      :       (unsigned char) nivel de implementação MDB
//  100 *                               (unsigned short int) código do pai
//  101 *                               (unsigned char) fator de escala
//  102 *                               (unsigned char) casas decimais
//  103 *                               (unsigned short int) direcionamento de moedas
//  104 *                               (unsigned short int) valor dos canais
//  105 *       Retorno         :       (eMDB_reply) resultado da operação
//  106 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MDBCOIN_get_setup_from_device
        THUMB
//  107 eMDB_reply MDBCOIN_get_setup_from_device(unsigned char *mdb_message_leve,
//  108                                          unsigned short int *country,
//  109                                          unsigned char *scale_factor,
//  110                                          unsigned char *decimal_places,
//  111                                          unsigned short int *coin_type_routing,
//  112                                          unsigned char *coin_credit){
MDBCOIN_get_setup_from_device:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+52
          CFI CFA R13+72
        MOVS     R7,R0
        MOVS     R4,R1
        MOVS     R5,R2
        MOVS     R6,R3
//  113   unsigned char setup[36];
//  114   unsigned char size;
//  115   
//  116   setup[0] = COIN_SETUP;
        MOVS     R0,#+9
        STRB     R0,[SP, #+12]
//  117     
//  118   if(MDB_send_package(1,setup,1,1,setup,&size)==MDB_OK){
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+1
        ADD      R1,SP,#+12
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??MDBCOIN_get_setup_from_device_0
//  119     
//  120     if(mdb_message_leve!=NULL)
        CMP      R7,#+0
        BEQ.N    ??MDBCOIN_get_setup_from_device_1
//  121       *mdb_message_leve = setup[Z1];
        LDRB     R0,[SP, #+12]
        STRB     R0,[R7, #+0]
//  122      
//  123     if(country!=NULL)
??MDBCOIN_get_setup_from_device_1:
        CMP      R4,#+0
        BEQ.N    ??MDBCOIN_get_setup_from_device_2
//  124       *country = setup[Z2]<<8 | setup[Z3];
        LDRB     R0,[SP, #+13]
        LDRB     R1,[SP, #+14]
        ORRS     R0,R1,R0, LSL #+8
        STRH     R0,[R4, #+0]
//  125     
//  126     if(scale_factor!=NULL)
??MDBCOIN_get_setup_from_device_2:
        CMP      R5,#+0
        BEQ.N    ??MDBCOIN_get_setup_from_device_3
//  127       *scale_factor = setup[Z4];
        LDRB     R0,[SP, #+15]
        STRB     R0,[R5, #+0]
//  128     
//  129     if(decimal_places!=NULL)
??MDBCOIN_get_setup_from_device_3:
        CMP      R6,#+0
        BEQ.N    ??MDBCOIN_get_setup_from_device_4
//  130       *decimal_places = setup[Z5];
        LDRB     R0,[SP, #+16]
        STRB     R0,[R6, #+0]
??MDBCOIN_get_setup_from_device_4:
        LDR      R0,[SP, #+72]
//  131     
//  132     if(coin_type_routing!=NULL)
        CMP      R0,#+0
        BEQ.N    ??MDBCOIN_get_setup_from_device_5
//  133       *coin_type_routing = setup[Z6]<<8 | setup[Z7];
        LDRB     R1,[SP, #+17]
        LDRB     R2,[SP, #+18]
        ORRS     R1,R2,R1, LSL #+8
        STRH     R1,[R0, #+0]
??MDBCOIN_get_setup_from_device_5:
        LDR      R0,[SP, #+76]
//  134     
//  135     if(coin_credit!=NULL)
        CMP      R0,#+0
        BEQ.N    ??MDBCOIN_get_setup_from_device_6
//  136       memcpy(coin_credit,&setup[Z8],16);    
        MOVS     R2,#+16
        ADD      R1,SP,#+19
          CFI FunCall memcpy
        BL       memcpy
//  137     
//  138     return MDB_OK;
??MDBCOIN_get_setup_from_device_6:
        MOVS     R0,#+0
        B.N      ??MDBCOIN_get_setup_from_device_7
//  139   }              
//  140   
//  141   return MDB_TIMEOUT;                                        
??MDBCOIN_get_setup_from_device_0:
        MOVS     R0,#+2
??MDBCOIN_get_setup_from_device_7:
        ADD      SP,SP,#+52
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock3
//  142 }
//  143 /***********************************************************************************
//  144 *       Descrição       :      getter para a quantidade de moedas dentro
//  145 *                              dos tubos
//  146 *       Parametros      :      (unsiged short int) flag que indica se há 
//  147 *                                                  moedas dentro dos tubos
//  148 *                              (unsigned char*) contagem com as moedas do 16 tubos
//  149 *       Retorno         :      (eMDB_reply) resultado da operação
//  150 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MDBCOIN_get_tube_status_from_device
        THUMB
//  151 eMDB_reply MDBCOIN_get_tube_status_from_device(unsigned short int*tube_full_status,
//  152                                                unsigned char *tubes_counter){
MDBCOIN_get_tube_status_from_device:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+52
          CFI CFA R13+64
        MOVS     R4,R0
        MOVS     R5,R1
//  153   unsigned char tubes[36];
//  154   unsigned char size;
//  155   
//  156   tubes[0] = COIN_TUBE_STATUS;
        MOVS     R0,#+10
        STRB     R0,[SP, #+12]
//  157     
//  158   if(MDB_send_package(1,tubes,1,1,tubes,&size)==MDB_OK){
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+1
        ADD      R1,SP,#+12
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??MDBCOIN_get_tube_status_from_device_0
//  159     
//  160     if(tube_full_status!=NULL)
        CMP      R4,#+0
        BEQ.N    ??MDBCOIN_get_tube_status_from_device_1
//  161       *tube_full_status = tubes[Z1]<<8 | tubes[Z2];
        LDRB     R0,[SP, #+12]
        LDRB     R1,[SP, #+13]
        ORRS     R0,R1,R0, LSL #+8
        STRH     R0,[R4, #+0]
//  162     
//  163     if(tubes_counter!=NULL)
??MDBCOIN_get_tube_status_from_device_1:
        CMP      R5,#+0
        BEQ.N    ??MDBCOIN_get_tube_status_from_device_2
//  164       memcpy(tubes_counter,&tubes[Z3],16);
        MOVS     R2,#+16
        ADD      R1,SP,#+14
        MOVS     R0,R5
          CFI FunCall memcpy
        BL       memcpy
//  165     
//  166     return MDB_OK;
??MDBCOIN_get_tube_status_from_device_2:
        MOVS     R0,#+0
        B.N      ??MDBCOIN_get_tube_status_from_device_3
//  167   }              
//  168   
//  169   return MDB_TIMEOUT;                                              
??MDBCOIN_get_tube_status_from_device_0:
        MOVS     R0,#+2
??MDBCOIN_get_tube_status_from_device_3:
        ADD      SP,SP,#+52
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock4
//  170 }
//  171 /***********************************************************************************
//  172 *       Descrição       :       Habilita os canais do moedeiro e a 
//  173 *                               liberação manual das moedas através 
//  174 *                               do teclado
//  175 *       Parametros      :       (unsigned short int) canais habilitados
//  176 *                               (unsigned short int) canais com permissão para
//  177 *                                                    dispenser manual
//  178 *       Retorno         :       (eMDB_reply) resultado da operação
//  179 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MDBCOIN_coin_type_setup
        THUMB
//  180 eMDB_reply MDBCOIN_coin_type_setup(unsigned short int channels,unsigned short int manual_dispense){
MDBCOIN_coin_type_setup:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  181   unsigned char types[5];  
//  182   unsigned char size;
//  183   
//  184   types[0] = COIN_TYPE;
        MOVS     R2,#+12
        STRB     R2,[SP, #+12]
//  185   types[1] = (unsigned char)channels>>8;
        MOVS     R2,#+0
        STRB     R2,[SP, #+13]
//  186   types[2] = (unsigned char)channels;
        STRB     R0,[SP, #+14]
//  187   types[3] = (unsigned char)manual_dispense>>8;
        MOVS     R0,#+0
        STRB     R0,[SP, #+15]
//  188   types[4] = (unsigned char)manual_dispense;
        STRB     R1,[SP, #+16]
//  189   
//  190   if(MDB_send_package_long(1,types,5,0,types,&size)==MDB_OK){
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+5
        ADD      R1,SP,#+12
        MOVS     R0,#+1
          CFI FunCall MDB_send_package_long
        BL       MDB_send_package_long
        CMP      R0,#+0
        BNE.N    ??MDBCOIN_coin_type_setup_0
//  191            
//  192     return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBCOIN_coin_type_setup_1
//  193   }              
//  194   
//  195   return MDB_TIMEOUT;   
??MDBCOIN_coin_type_setup_0:
        MOVS     R0,#+2
??MDBCOIN_coin_type_setup_1:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock5
//  196 }
//  197 /***********************************************************************************
//  198 *       Descrição       :       Envia o comando para dispensar uma moeda
//  199 *                               para o cliente
//  200 *       Parametros      :       (unsigned char) moeda
//  201 *       Retorno         :       (eMDB_reply) resultado da operação
//  202 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MDBCOIN_coin_dispense
        THUMB
//  203 eMDB_reply MDBCOIN_coin_dispense(unsigned char quantidade,unsigned char coin_code){
MDBCOIN_coin_dispense:
        PUSH     {R5-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+16
//  204   unsigned char coin[2];
//  205   unsigned char size;
//  206   
//  207   coin[0] = COIN_DISPENSE;
        MOVS     R2,#+13
        STRB     R2,[SP, #+8]
//  208   coin[1] = ((quantidade&0x0F)<<4) | (coin_code&0x0F);
        ANDS     R1,R1,#0xF
        ORRS     R0,R1,R0, LSL #+4
        STRB     R0,[SP, #+9]
//  209     
//  210   if(MDB_send_package_long(1,coin,2,0,coin,&size)==MDB_OK){
        ADD      R0,SP,#+10
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+2
        ADD      R1,SP,#+8
        MOVS     R0,#+1
          CFI FunCall MDB_send_package_long
        BL       MDB_send_package_long
        CMP      R0,#+0
        BNE.N    ??MDBCOIN_coin_dispense_0
//  211            
//  212     return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBCOIN_coin_dispense_1
//  213   }              
//  214   
//  215   return MDB_TIMEOUT;  
??MDBCOIN_coin_dispense_0:
        MOVS     R0,#+2
??MDBCOIN_coin_dispense_1:
        POP      {R1-R3,PC}       ;; return
          CFI EndBlock cfiBlock6
//  216 }
//  217 /***********************************************************************************
//  218 *       Descrição       :       Solicita os eventos para o moedeiro
//  219 *       Parametros      :       (eMDB_COIN_POOL_TYPE*) tipo do evento
//  220 *                               (eMDB_COIN_POOL_STATUS*) status do evento
//  221 *                               (unsigned char*) tipo da moeda
//  222 *                               (unsigned char*) quantidade de moedas no tubo
//  223 *       Retorno         :       (eMDB_reply) resultado da operação
//  224 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function MDBCOIN_poll
        THUMB
//  225 eMDB_reply MDBCOIN_poll(eMDB_COIN_POOL_TYPE *tipo_evento,
//  226                         eMDB_COIN_POOL_STATUS *status,
//  227                         unsigned char *tipo_moeda,unsigned char *quantidade_tubo){
MDBCOIN_poll:
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
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  228   unsigned char poll[18];                          
//  229   unsigned char size;                     
//  230   
//  231   poll[0] = COIN_POLL;  
        MOVS     R0,#+11
        STRB     R0,[SP, #+12]
//  232                           
//  233   if(MDB_send_package(1,poll,1,1,poll,&size)==MDB_OK){
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+1
        ADD      R1,SP,#+12
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??MDBCOIN_poll_0
//  234     
//  235     if(!size)
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??MDBCOIN_poll_1
//  236       return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBCOIN_poll_2
//  237     
//  238       if(size==2 || size==1){
??MDBCOIN_poll_1:
        LDRB     R0,[SP, #+8]
        CMP      R0,#+2
        BEQ.N    ??MDBCOIN_poll_3
        LDRB     R0,[SP, #+8]
        CMP      R0,#+1
        BNE.N    ??MDBCOIN_poll_0
//  239       // Evento de moeda dispensada
//  240       // pelo teclado do moedeiro
//  241       if(poll[0]&0x80){
??MDBCOIN_poll_3:
        LDRB     R0,[SP, #+12]
        LSLS     R0,R0,#+24
        BPL.N    ??MDBCOIN_poll_4
//  242         *tipo_evento = COIN_DISPENSE_MANUALLY;
        MOVS     R0,#+0
        STRB     R0,[R4, #+0]
//  243         *status = COIN_POSSIBLE_CREDIT_REMOVAL;
        MOVS     R0,#+13
        STRB     R0,[R5, #+0]
//  244         *tipo_moeda = (poll[0]&0x70)>>4;
        LDRB     R0,[SP, #+12]
        UBFX     R0,R0,#+4,#+3
        STRB     R0,[R6, #+0]
//  245         *quantidade_tubo = poll[1];
        LDRB     R0,[SP, #+13]
        STRB     R0,[R7, #+0]
        B.N      ??MDBCOIN_poll_5
//  246       }
//  247       else
//  248         // Evento de crédito da moeda
//  249         if(poll[0]&0x40){
??MDBCOIN_poll_4:
        LDRB     R0,[SP, #+12]
        LSLS     R0,R0,#+25
        BPL.N    ??MDBCOIN_poll_6
//  250           *tipo_evento = COIN_DEPOSITED;
        MOVS     R0,#+1
        STRB     R0,[R4, #+0]
//  251           *status = (eMDB_COIN_POOL_STATUS)((poll[0]&0x03)>>4);
        MOVS     R0,#+0
        STRB     R0,[R5, #+0]
//  252           *tipo_moeda = poll[0]&0x0F;
        LDRB     R0,[SP, #+12]
        ANDS     R0,R0,#0xF
        STRB     R0,[R6, #+0]
//  253           *quantidade_tubo = poll[1];
        LDRB     R0,[SP, #+13]
        STRB     R0,[R7, #+0]
        B.N      ??MDBCOIN_poll_5
//  254         }      
//  255         else{
//  256           // Evento com alteração
//  257           // no status do moedeiro
//  258           *tipo_evento = COIN_STATUS;
??MDBCOIN_poll_6:
        MOVS     R0,#+2
        STRB     R0,[R4, #+0]
//  259           *status = (eMDB_COIN_POOL_STATUS)poll[0];
        LDRB     R0,[SP, #+12]
        STRB     R0,[R5, #+0]
//  260           *tipo_moeda = 0;
        MOVS     R0,#+0
        STRB     R0,[R6, #+0]
//  261           *quantidade_tubo = 0;
        MOVS     R0,#+0
        STRB     R0,[R7, #+0]
//  262         }              
//  263       
//  264       return MDB_OK;        
??MDBCOIN_poll_5:
        MOVS     R0,#+0
        B.N      ??MDBCOIN_poll_2
//  265     }    
//  266     
//  267   }              
//  268   
//  269   return MDB_TIMEOUT;                            
??MDBCOIN_poll_0:
        MOVS     R0,#+2
??MDBCOIN_poll_2:
        ADD      SP,SP,#+36
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock7
//  270 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  271 /***********************************************************************************
//  272 *       Fim do arquivo
//  273 ***********************************************************************************/
// 
// 624 bytes in section .text
// 
// 610 bytes of CODE memory (+ 14 bytes shared)
//
//Errors: none
//Warnings: none
