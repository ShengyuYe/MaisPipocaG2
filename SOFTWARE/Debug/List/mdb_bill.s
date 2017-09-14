///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     14/Sep/2017  13:22:51 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\MDB\mdb_b /
//                    ill.c                                                   /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\MDB\mdb_b /
//                    ill.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\L /
//                    ist\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Li /
//                    st\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Obj\ /
//                     --no_cse --no_unroll --no_inline --no_code_motion      /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\mdb_bi /
//                    ll.s                                                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME mdb_bill

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN MDB_send_package
        EXTERN __aeabi_memcpy

        PUBLIC MDBILL_get_id_with_option_bits
        PUBLIC MDBILL_get_identification_of_device
        PUBLIC MDBILL_get_poll_from_device
        PUBLIC MDBILL_get_setup_from_device
        PUBLIC MDBILL_get_stacker_state
        PUBLIC MDBILL_reset_device
        PUBLIC MDBILL_send_escrow_command
        PUBLIC MDBILL_set_bill_type_on_device
        PUBLIC MDBILL_verifica_dispositivo
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\MDB\mdb_bill.c
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
//   17 |       Arquivo            :  mdb_bill.c
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
//   34 #include "mdb.h"
//   35 #include "mdb_uart.h"
//   36 #include "mdb_bill.h"
//   37 
//   38 /***********************************************************************************
//   39 *       Definições
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
//   58 *       Descrição       :       Verifica se o dispositivo está conectado
//   59 *                               ao barramento
//   60 *       Parametros      :       nenhum
//   61 *       Retorno         :       (eMDB_reply) resultado da operação
//   62 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MDBILL_verifica_dispositivo
        THUMB
//   63 eMDB_reply MDBILL_verifica_dispositivo(void){
MDBILL_verifica_dispositivo:
        PUSH     {R5-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+16
//   64   unsigned char buffer[2];
//   65   unsigned char recebidos;
//   66   
//   67   buffer[0] = MDB_BILL_VALIDATOR;
        MOVS     R0,#+48
        STRB     R0,[SP, #+8]
//   68   if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
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
        BNE.N    ??MDBILL_verifica_dispositivo_0
//   69         
//   70     if(buffer[0]==MDB_RESP_ACK)
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??MDBILL_verifica_dispositivo_1
//   71       return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBILL_verifica_dispositivo_2
//   72     
//   73     return MDB_ERROR;
??MDBILL_verifica_dispositivo_1:
        MOVS     R0,#+1
        B.N      ??MDBILL_verifica_dispositivo_2
//   74   }
//   75     
//   76   return  MDB_TIMEOUT; 
??MDBILL_verifica_dispositivo_0:
        MOVS     R0,#+2
??MDBILL_verifica_dispositivo_2:
        POP      {R1-R3,PC}       ;; return
          CFI EndBlock cfiBlock1
//   77 }
//   78 /***********************************************************************************
//   79 *       Descrição       :       Faz o reset do validador 
//   80 *       Parametros      :       nenhum
//   81 *       Retorno         :       (eMDB_reply) resultado da operação
//   82 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MDBILL_reset_device
        THUMB
//   83 eMDB_reply MDBILL_reset_device(void){
MDBILL_reset_device:
        PUSH     {R5-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+16
//   84   unsigned char buffer[2];
//   85   unsigned char recebidos;
//   86   
//   87   buffer[0] = BILL_RESET;
        MOVS     R0,#+48
        STRB     R0,[SP, #+8]
//   88   if(MDB_send_package(1,buffer,1,0,buffer,&recebidos)==MDB_OK){
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
        BNE.N    ??MDBILL_reset_device_0
//   89         
//   90     if(buffer[0]==MDB_RESP_ACK)
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??MDBILL_reset_device_1
//   91       return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBILL_reset_device_2
//   92     
//   93     return MDB_ERROR;
??MDBILL_reset_device_1:
        MOVS     R0,#+1
        B.N      ??MDBILL_reset_device_2
//   94   }
//   95     
//   96   return  MDB_TIMEOUT; 
??MDBILL_reset_device_0:
        MOVS     R0,#+2
??MDBILL_reset_device_2:
        POP      {R1-R3,PC}       ;; return
          CFI EndBlock cfiBlock2
//   97 }
//   98 /***********************************************************************************
//   99 *       Descrição       :       Solicita as configurações ao noteiro
//  100 *       Parametros      :       (unsigned char*)level
//  101 *                               (unsigned short int) country
//  102 *                               (unsigned short int) bill scaling factor
//  103 *                               (unsigned char) casas decimais
//  104 *                               (unsigned short int) capacidade do stacker
//  105 *                               (unsigned short int) nível de segurança
//  106 *                               (unsigned char*) tipo crédito dos canais
//  107 *       Retorno         :       (eMDB_reply) resultado da operação
//  108 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MDBILL_get_setup_from_device
        THUMB
//  109 eMDB_reply MDBILL_get_setup_from_device(unsigned char *level,
//  110                                         unsigned short int *country,
//  111                                         unsigned short int *scaling,
//  112                                         unsigned char *decimal_places,
//  113                                         unsigned short int *stacker_capacity,
//  114                                         unsigned char *scroll_preset,
//  115                                         unsigned short int *security_level,
//  116                                         unsigned char *credit_types){
MDBILL_get_setup_from_device:
        PUSH     {R4-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+36
        SUB      SP,SP,#+52
          CFI CFA R13+88
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+88]
        LDR      R9,[SP, #+92]
        LDR      R10,[SP, #+96]
        LDR      R11,[SP, #+100]
//  117   unsigned char setup[36];
//  118   unsigned char size;
//  119   
//  120   setup[0] = BILL_SETUP;
        MOVS     R0,#+49
        STRB     R0,[SP, #+12]
//  121     
//  122   if(MDB_send_package(1,setup,1,1,setup,&size)==MDB_OK){
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
        BNE.N    ??MDBILL_get_setup_from_device_0
//  123     
//  124     if(level!=NULL)
        CMP      R4,#+0
        BEQ.N    ??MDBILL_get_setup_from_device_1
//  125       *level = setup[Z1];
        LDRB     R0,[SP, #+12]
        STRB     R0,[R4, #+0]
//  126     
//  127     if(country!=NULL)          
??MDBILL_get_setup_from_device_1:
        CMP      R5,#+0
        BEQ.N    ??MDBILL_get_setup_from_device_2
//  128       *country = setup[Z2]<<8 | setup[Z3];
        LDRB     R0,[SP, #+13]
        LDRB     R1,[SP, #+14]
        ORRS     R0,R1,R0, LSL #+8
        STRH     R0,[R5, #+0]
//  129     
//  130     if(country!=NULL)
??MDBILL_get_setup_from_device_2:
        CMP      R5,#+0
        BEQ.N    ??MDBILL_get_setup_from_device_3
//  131       *scaling = setup[Z4]<<8 | setup[Z5];    
        LDRB     R0,[SP, #+15]
        LDRB     R1,[SP, #+16]
        ORRS     R0,R1,R0, LSL #+8
        STRH     R0,[R6, #+0]
//  132     
//  133     if(decimal_places!=NULL)
??MDBILL_get_setup_from_device_3:
        CMP      R7,#+0
        BEQ.N    ??MDBILL_get_setup_from_device_4
//  134       *decimal_places = setup[Z6];
        LDRB     R0,[SP, #+17]
        STRB     R0,[R7, #+0]
//  135     
//  136     if(stacker_capacity!=NULL)
??MDBILL_get_setup_from_device_4:
        CMP      R8,#+0
        BEQ.N    ??MDBILL_get_setup_from_device_5
//  137       *stacker_capacity = setup[Z7]<<8 | setup[Z8];
        LDRB     R0,[SP, #+18]
        LDRB     R1,[SP, #+19]
        ORRS     R0,R1,R0, LSL #+8
        STRH     R0,[R8, #+0]
//  138     
//  139     if(security_level!=NULL)
??MDBILL_get_setup_from_device_5:
        CMP      R10,#+0
        BEQ.N    ??MDBILL_get_setup_from_device_6
//  140       *security_level = setup[Z9]<<8 | setup[Z10];  
        LDRB     R0,[SP, #+20]
        LDRB     R1,[SP, #+21]
        ORRS     R0,R1,R0, LSL #+8
        STRH     R0,[R10, #+0]
//  141     
//  142     if(scroll_preset!=NULL)
??MDBILL_get_setup_from_device_6:
        CMP      R9,#+0
        BEQ.N    ??MDBILL_get_setup_from_device_7
//  143       *scroll_preset = setup[Z11];
        LDRB     R0,[SP, #+22]
        STRB     R0,[R9, #+0]
//  144     
//  145     if(credit_types!=NULL)
??MDBILL_get_setup_from_device_7:
        CMP      R11,#+0
        BEQ.N    ??MDBILL_get_setup_from_device_8
//  146       memcpy(credit_types,&setup[Z12],16);    
        MOVS     R2,#+16
        ADD      R1,SP,#+23
        MOV      R0,R11
          CFI FunCall memcpy
        BL       memcpy
//  147     
//  148     return MDB_OK;
??MDBILL_get_setup_from_device_8:
        MOVS     R0,#+0
        B.N      ??MDBILL_get_setup_from_device_9
//  149   }              
//  150   
//  151   return MDB_TIMEOUT;
??MDBILL_get_setup_from_device_0:
        MOVS     R0,#+2
??MDBILL_get_setup_from_device_9:
        ADD      SP,SP,#+52
          CFI CFA R13+36
        POP      {R4-R11,PC}      ;; return
          CFI EndBlock cfiBlock3
//  152 }
//  153 /***********************************************************************************
//  154 *       Descrição       :      Lê a fila de eventos do validador
//  155 *       Parametros      :       (unsigned char*) eventos
//  156 *       Retorno         :       (eMDB_reply) resultado da operação
//  157 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MDBILL_get_poll_from_device
        THUMB
//  158 eMDB_reply MDBILL_get_poll_from_device(sBILL_event *activity,unsigned char *length){
MDBILL_get_poll_from_device:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+28
          CFI CFA R13+40
        MOVS     R4,R0
        MOVS     R5,R1
//  159   unsigned char poll[16];
//  160   unsigned char size;
//  161   
//  162   poll[0] = BILL_POLL;
        MOVS     R0,#+51
        STRB     R0,[SP, #+12]
//  163   if(MDB_send_package(1,poll,1,1,poll,&size)==MDB_OK){
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
        BNE.N    ??MDBILL_get_poll_from_device_0
//  164     
//  165     *length = size;
        LDRB     R0,[SP, #+8]
        STRB     R0,[R5, #+0]
//  166     
//  167     if(size>1){
        LDRB     R0,[SP, #+8]
        CMP      R0,#+2
        BLT.N    ??MDBILL_get_poll_from_device_1
//  168       
//  169       for(unsigned char i=0;i<size && size<16;i++){        
        MOVS     R0,#+0
??MDBILL_get_poll_from_device_2:
        LDRB     R1,[SP, #+8]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BCS.N    ??MDBILL_get_poll_from_device_3
        LDRB     R1,[SP, #+8]
        CMP      R1,#+16
        BGE.N    ??MDBILL_get_poll_from_device_3
//  170          activity->tipo =  (eBILL_ROUTING)(poll[0]>>4);
        LDRB     R1,[SP, #+12]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+4
        STRB     R1,[R4, #+0]
//  171          activity->args =  (eBILL_TYPE)(poll[0]&0xF);
        LDRB     R1,[SP, #+12]
        ANDS     R1,R1,#0xF
        STRB     R1,[R4, #+1]
//  172          if(activity->tipo!=BILL_STATUS)
        LDRB     R1,[R4, #+0]
        CMP      R1,#+0
        BEQ.N    ??MDBILL_get_poll_from_device_4
//  173            activity->args+= (eBILL_TYPE)CANAL_01;
        LDRB     R1,[R4, #+1]
        ADDS     R1,R1,#+13
        STRB     R1,[R4, #+1]
//  174          
//  175          activity++;
??MDBILL_get_poll_from_device_4:
        ADDS     R4,R4,#+2
//  176       } 
        ADDS     R0,R0,#+1
        B.N      ??MDBILL_get_poll_from_device_2
//  177       
//  178       return MDB_OK;     
??MDBILL_get_poll_from_device_3:
        MOVS     R0,#+0
        B.N      ??MDBILL_get_poll_from_device_5
//  179     }
//  180     else{
//  181       if(poll[0]==MDB_RESP_ACK)
??MDBILL_get_poll_from_device_1:
        LDRB     R0,[SP, #+12]
        CMP      R0,#+0
        BNE.N    ??MDBILL_get_poll_from_device_6
//  182         return MDB_OK;    
        MOVS     R0,#+0
        B.N      ??MDBILL_get_poll_from_device_5
//  183       else
//  184         if(poll[0]==MDB_RESP_NAK)
??MDBILL_get_poll_from_device_6:
        LDRB     R0,[SP, #+12]
        CMP      R0,#+255
        BNE.N    ??MDBILL_get_poll_from_device_0
//  185           return MDB_ERROR;
        MOVS     R0,#+1
        B.N      ??MDBILL_get_poll_from_device_5
//  186     }
//  187   }
//  188     
//  189   return MDB_TIMEOUT;   
??MDBILL_get_poll_from_device_0:
        MOVS     R0,#+2
??MDBILL_get_poll_from_device_5:
        ADD      SP,SP,#+28
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock4
//  190 }
//  191 /***********************************************************************************
//  192 *       Descrição       :       Habilita os tipos de notas que serão utilizados
//  193 *                               na aplicação
//  194 *       Parametros      :       (unsigned short int) canais
//  195 *       Retorno         :       (eMDB_reply) resultado da operação
//  196 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MDBILL_set_bill_type_on_device
        THUMB
//  197 eMDB_reply MDBILL_set_bill_type_on_device(unsigned short int bill_types,
//  198                                           unsigned short int scrolls){
MDBILL_set_bill_type_on_device:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
//  199   unsigned char bills[5];  
//  200   unsigned char size;
//  201    
//  202   bills[0] = BILL_TYPE;
        MOVS     R0,#+52
        STRB     R0,[SP, #+12]
//  203   bills[1] = bill_types>>8;
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSRS     R0,R4,#+8
        STRB     R0,[SP, #+13]
//  204   bills[2] = bill_types;
        MOVS     R0,R4
        STRB     R0,[SP, #+14]
//  205   bills[3] = scrolls>>8;
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LSRS     R0,R5,#+8
        STRB     R0,[SP, #+15]
//  206   bills[4] = scrolls;
        MOVS     R0,R5
        STRB     R0,[SP, #+16]
//  207   
//  208   if(MDB_send_package(1,bills,5,0,bills,&size)==MDB_OK){
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+5
        ADD      R1,SP,#+12
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??MDBILL_set_bill_type_on_device_0
//  209     
//  210     if(bills[0]==MDB_RESP_ACK)
        LDRB     R0,[SP, #+12]
        CMP      R0,#+0
        BNE.N    ??MDBILL_set_bill_type_on_device_1
//  211       return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBILL_set_bill_type_on_device_2
//  212     
//  213     return MDB_ERROR;
??MDBILL_set_bill_type_on_device_1:
        MOVS     R0,#+1
        B.N      ??MDBILL_set_bill_type_on_device_2
//  214   }
//  215   
//  216   return MDB_TIMEOUT; 
??MDBILL_set_bill_type_on_device_0:
        MOVS     R0,#+2
??MDBILL_set_bill_type_on_device_2:
        ADD      SP,SP,#+20
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock5
//  217 }
//  218 /***********************************************************************************
//  219 *       Descrição       :      Envia o comando para realizar o escrow da nota
//  220 *       Parametros      :      (eMDB_ESCROW_COMMANDS) comando para o escrow
//  221 *       Retorno         :      (eMDB_reply) resultado da operação
//  222 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MDBILL_send_escrow_command
        THUMB
//  223 eMDB_reply MDBILL_send_escrow_command(eMDB_ESCROW_COMMANDS cmd){
MDBILL_send_escrow_command:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+16
          CFI CFA R13+24
        MOVS     R4,R0
//  224   unsigned char escrow[2];
//  225   unsigned char size;
//  226 
//  227   escrow[0] = BILL_ESCROW;
        MOVS     R0,#+53
        STRB     R0,[SP, #+8]
//  228   escrow[1] = (unsigned char)cmd;  
        STRB     R4,[SP, #+9]
//  229   
//  230   if(MDB_send_package(1,escrow,2,1,escrow,&size)==MDB_OK){
        ADD      R0,SP,#+10
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+2
        ADD      R1,SP,#+8
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??MDBILL_send_escrow_command_0
//  231     //MDBAURT_sleep(3000);
//  232     
//  233     if(escrow[0]==MDB_RESP_ACK)
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??MDBILL_send_escrow_command_1
//  234       return MDB_OK;
        MOVS     R0,#+0
        B.N      ??MDBILL_send_escrow_command_2
//  235     
//  236     return MDB_ERROR;
??MDBILL_send_escrow_command_1:
        MOVS     R0,#+1
        B.N      ??MDBILL_send_escrow_command_2
//  237   }
//  238   
//  239   return MDB_TIMEOUT; 
??MDBILL_send_escrow_command_0:
        MOVS     R0,#+2
??MDBILL_send_escrow_command_2:
        ADD      SP,SP,#+16
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock6
//  240 }
//  241 /***********************************************************************************
//  242 *       Descrição       :       Verifica se o stacker está cheio
//  243 *       Parametros      :       (eMDB_STACKER_STATE) estado do stacker
//  244 *       Retorno         :       (eMDB_reply) resultado da operação
//  245 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function MDBILL_get_stacker_state
        THUMB
//  246 eMDB_reply MDBILL_get_stacker_state(eMDB_STACKER_STATE *stacker_state){
MDBILL_get_stacker_state:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+16
          CFI CFA R13+24
        MOVS     R4,R0
//  247   unsigned char stacker[2];
//  248   unsigned char size;
//  249 
//  250   stacker[0] = BILL_STACKER;
        MOVS     R0,#+54
        STRB     R0,[SP, #+8]
//  251   
//  252   if(MDB_send_package(1,stacker,2,1,stacker,&size)==MDB_OK){
        ADD      R0,SP,#+10
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+2
        ADD      R1,SP,#+8
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??MDBILL_get_stacker_state_0
//  253     
//  254     *stacker_state = (eMDB_STACKER_STATE)((stacker[0]&0x80)?STACK_BILL:RETURN_BILL);
        LDRB     R0,[SP, #+8]
        UBFX     R0,R0,#+7,#+1
        STRB     R0,[R4, #+0]
//  255     
//  256     return MDB_OK;   
        MOVS     R0,#+0
        B.N      ??MDBILL_get_stacker_state_1
//  257   }
//  258   
//  259   return MDB_TIMEOUT; 
??MDBILL_get_stacker_state_0:
        MOVS     R0,#+2
??MDBILL_get_stacker_state_1:
        ADD      SP,SP,#+16
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock7
//  260 }
//  261 /***********************************************************************************
//  262 *       Descrição       :       Verifica a identificação do equipamento
//  263 *       Parametros      :       (char*) fabricante
//  264 *                               (char*) numero de série
//  265 *                               (char*) modelo
//  266 *                               (char*) versao
//  267 *       Retorno         :       (eMDB_reply) resultado da operçaão
//  268 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function MDBILL_get_identification_of_device
        THUMB
//  269 eMDB_reply MDBILL_get_identification_of_device(char *manufacturer,
//  270                                                char *serial_number,
//  271                                                char *model,
//  272                                                char *firmware_version){
MDBILL_get_identification_of_device:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+52
          CFI CFA R13+72
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  273   unsigned char ext[36];
//  274   unsigned char size;
//  275   
//  276   ext[0] = BILL_EXPANSION_COMMAND;
        MOVS     R0,#+55
        STRB     R0,[SP, #+12]
//  277   ext[1] = 0x00;
        MOVS     R0,#+0
        STRB     R0,[SP, #+13]
//  278   
//  279   if(MDB_send_package(1,ext,2,1,ext,&size)==MDB_OK){
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+2
        ADD      R1,SP,#+12
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??MDBILL_get_identification_of_device_0
//  280                                                  
//  281     if(manufacturer!=NULL)
        CMP      R4,#+0
        BEQ.N    ??MDBILL_get_identification_of_device_1
//  282       memcpy(manufacturer,&ext[Z1],3);
        MOVS     R2,#+3
        ADD      R1,SP,#+12
        MOVS     R0,R4
          CFI FunCall memcpy
        BL       memcpy
//  283     
//  284     if(serial_number!=NULL)
??MDBILL_get_identification_of_device_1:
        CMP      R5,#+0
        BEQ.N    ??MDBILL_get_identification_of_device_2
//  285       memcpy(serial_number,&ext[Z4],12);
        MOVS     R2,#+12
        ADD      R1,SP,#+15
        MOVS     R0,R5
          CFI FunCall memcpy
        BL       memcpy
//  286     
//  287     if(model!=NULL)
??MDBILL_get_identification_of_device_2:
        CMP      R6,#+0
        BEQ.N    ??MDBILL_get_identification_of_device_3
//  288       memcpy(model,&ext[Z16],12);
        MOVS     R2,#+12
        ADD      R1,SP,#+27
        MOVS     R0,R6
          CFI FunCall memcpy
        BL       memcpy
//  289     
//  290     if(firmware_version!=NULL)
??MDBILL_get_identification_of_device_3:
        CMP      R7,#+0
        BEQ.N    ??MDBILL_get_identification_of_device_4
//  291       memcpy(firmware_version,&ext[Z28],2);
        MOVS     R2,#+2
        ADD      R1,SP,#+39
        MOVS     R0,R7
          CFI FunCall memcpy
        BL       memcpy
//  292     
//  293     return MDB_OK;   
??MDBILL_get_identification_of_device_4:
        MOVS     R0,#+0
        B.N      ??MDBILL_get_identification_of_device_5
//  294   }
//  295   
//  296   return MDB_TIMEOUT;
??MDBILL_get_identification_of_device_0:
        MOVS     R0,#+2
??MDBILL_get_identification_of_device_5:
        ADD      SP,SP,#+52
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock8
//  297 }
//  298 /***********************************************************************************
//  299 *       Descrição       :       Lê as opções extras disponóiveis
//  300 *       Parametros      :       (char*) fabricante
//  301 *                               (char*) serial number
//  302 *                               (char*) modelo
//  303 *                               (char*) versão do software
//  304 *                               (unsigned char*) funções opcionais
//  305 *       Retorno         :       (eMDB_reply) resultado da operação
//  306 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function MDBILL_get_id_with_option_bits
        THUMB
//  307 eMDB_reply MDBILL_get_id_with_option_bits(char *manufacturer,
//  308                                           char *serial_number,
//  309                                           char* model,
//  310                                           char* firmware_version,
//  311                                           unsigned char *optional_features){
MDBILL_get_id_with_option_bits:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        SUB      SP,SP,#+48
          CFI CFA R13+72
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+72]
//  312   unsigned char ext[36];
//  313   unsigned char size;
//  314   
//  315   ext[0] = BILL_EXPANSION_COMMAND;
        MOVS     R0,#+55
        STRB     R0,[SP, #+12]
//  316   ext[1] = 0x02;
        MOVS     R0,#+2
        STRB     R0,[SP, #+13]
//  317   
//  318   if(MDB_send_package(1,ext,2,1,ext,&size)==MDB_OK){
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+2
        ADD      R1,SP,#+12
        MOVS     R0,#+1
          CFI FunCall MDB_send_package
        BL       MDB_send_package
        CMP      R0,#+0
        BNE.N    ??MDBILL_get_id_with_option_bits_0
//  319                                                  
//  320     if(manufacturer!=NULL)
        CMP      R4,#+0
        BEQ.N    ??MDBILL_get_id_with_option_bits_1
//  321       memcpy(manufacturer,&ext[Z1],3);
        MOVS     R2,#+3
        ADD      R1,SP,#+12
        MOVS     R0,R4
          CFI FunCall memcpy
        BL       memcpy
//  322     
//  323     if(serial_number!=NULL)
??MDBILL_get_id_with_option_bits_1:
        CMP      R5,#+0
        BEQ.N    ??MDBILL_get_id_with_option_bits_2
//  324       memcpy(serial_number,&ext[Z4],12);
        MOVS     R2,#+12
        ADD      R1,SP,#+15
        MOVS     R0,R5
          CFI FunCall memcpy
        BL       memcpy
//  325     
//  326     if(model!=NULL)
??MDBILL_get_id_with_option_bits_2:
        CMP      R6,#+0
        BEQ.N    ??MDBILL_get_id_with_option_bits_3
//  327       memcpy(model,&ext[Z16],12);
        MOVS     R2,#+12
        ADD      R1,SP,#+27
        MOVS     R0,R6
          CFI FunCall memcpy
        BL       memcpy
//  328     
//  329     if(firmware_version!=NULL)
??MDBILL_get_id_with_option_bits_3:
        CMP      R7,#+0
        BEQ.N    ??MDBILL_get_id_with_option_bits_4
//  330       memcpy(firmware_version,&ext[Z28],2);
        MOVS     R2,#+2
        ADD      R1,SP,#+39
        MOVS     R0,R7
          CFI FunCall memcpy
        BL       memcpy
//  331     
//  332     if(optional_features!=NULL)
??MDBILL_get_id_with_option_bits_4:
        CMP      R8,#+0
        BEQ.N    ??MDBILL_get_id_with_option_bits_5
//  333       memcpy(optional_features,&ext[Z30],4);
        MOVS     R2,#+4
        ADD      R1,SP,#+41
        MOV      R0,R8
          CFI FunCall memcpy
        BL       memcpy
//  334     
//  335     return MDB_OK;   
??MDBILL_get_id_with_option_bits_5:
        MOVS     R0,#+0
        B.N      ??MDBILL_get_id_with_option_bits_6
//  336   }
//  337   
//  338   return MDB_TIMEOUT;                                      
??MDBILL_get_id_with_option_bits_0:
        MOVS     R0,#+2
??MDBILL_get_id_with_option_bits_6:
        ADD      SP,SP,#+48
          CFI CFA R13+24
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock9
//  339 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  340 /***********************************************************************************
//  341 *       Fim do arquivo
//  342 ***********************************************************************************/
// 
// 954 bytes in section .text
// 
// 932 bytes of CODE memory (+ 22 bytes shared)
//
//Errors: none
//Warnings: none
