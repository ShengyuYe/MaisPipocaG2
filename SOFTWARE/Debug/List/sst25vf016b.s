///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  14:34:07 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\sst25vf016b\sst25vf016b.c       /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\sst25vf016b\sst25vf016b.c -lC   /
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
//                    pocaG2\SOFTWARE\Debug\List\sst25vf016b.s                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME sst25vf016b

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN SPI_getBytes
        EXTERN SPI_sendBytes

        PUBLIC SST25VF_init
        PUBLIC SST25VF_readStatus
        PUBLIC SST25VF_writeStatus
        PUBLIC SST_busyWait
        PUBLIC SST_chipErase
        PUBLIC SST_erase32kbSector
        PUBLIC SST_erase4kbSector
        PUBLIC SST_erase64kbSector
        PUBLIC SST_highSpeedRead
        PUBLIC SST_readID
        PUBLIC SST_writeAutoAddressInc
        PUBLIC SST_writeByte
        PUBLIC SST_writeDisable
        PUBLIC SST_writeEnable
        PUBLIC _A_FIO0CLR
        PUBLIC _A_FIO0SET
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\sst25vf016b\sst25vf016b.c
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
//   17 |       Arquivo            :  SST25VFXX.c
//   18 |       Descrição          :  Driver para acesso à memoria
//   19 |                             SST25
//   20 | 
//   21 |       Autor              :  Marcos Aquino
//   22 |       Data criação       :  27/04/2012
//   23 |
//   24 |       Revisões           :  1.0.0.0
//   25 |
//   26 |
//   27 | __________________________________________________________________________________
//   28 */
//   29 
//   30 /********************************************************************************
//   31 *   Includes
//   32 ********************************************************************************/
//   33 #include <nxp/iolpc1768.h>

        ASEGN `.noinit`:DATA:NOROOT,02009c018H
        SECTION_GROUP _A_FIO0SET
// __absolute union <unnamed> volatile _A_FIO0SET
_A_FIO0SET:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c01cH
        SECTION_GROUP _A_FIO0CLR
// __absolute union <unnamed> volatile _A_FIO0CLR
_A_FIO0CLR:
        DS8 4
//   34 #include "SST25VF016B.h"
//   35 #include "SPI_WRAPPER.H"
//   36 
//   37 /********************************************************************************
//   38 *   Definições
//   39 ********************************************************************************/
//   40 #define SST_READ                        0x03
//   41 #define SST_HIGH_SPEED_READ             0x0B
//   42 #define SST_4KB_ERASE                   0x20
//   43 #define SST_32KB_ERASE                  0x52
//   44 #define SST_64KB_ERASE                  0xD8
//   45 #define SST_CHIP_ERASE                  0x60
//   46 #define SST_BYTE_PROGRAM                0x02
//   47 #define SST_AAI                         0xAD
//   48 #define SST_RDSR                        0x05
//   49 #define SST_EWSR                        0x50
//   50 #define SST_WRITE_STATUS                0x01
//   51 #define SST_WRITE_ENABLE                0x06
//   52 #define SST_WRITE_DISABLE               0x04
//   53 #define SST_READ_ID                     0x90
//   54 #define SST_JEDEC_ID                    0x9F
//   55 #define SST_EBST                        0x70
//   56 #define SST_DBSY                        0x80
//   57 
//   58 /********************************************************************************
//   59 *   Funções
//   60 ********************************************************************************/
//   61 void SST_busyWait(void);
//   62 
//   63 /********************************************************************************
//   64 *   Implementação
//   65 ********************************************************************************/
//   66 
//   67 /********************************************************************************
//   68 *   Descrição     :   Inicialização do driver
//   69 *   Parametros    :   nenhum
//   70 *   Retorno       :   nenhum
//   71 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SST25VF_init
          CFI NoCalls
        THUMB
//   72 void SST25VF_init(unsigned long int busClk){
//   73   
//   74   UNSEL_CS_01;  
SST25VF_init:
        LDR.W    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//   75   UNSEL_CS_02;
        LDR.W    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200000
        LDR.W    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//   76 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_FIO0SET
//   77 /********************************************************************************
//   78 *   Descrição     :   Faz a leitura do registrador de status da memória
//   79 *   Parametros    :   (SST_status*) referência para o status
//   80 *   Retorno       :   nenhum
//   81 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SST25VF_readStatus
        THUMB
//   82 void SST25VF_readStatus(SST_status* status){
SST25VF_readStatus:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//   83   unsigned char buffer;
//   84   
//   85   SEL_CS_01;
        LDR.W    R0,??DataTable12_1  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12_1  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//   86   
//   87   buffer = SST_RDSR;  
        MOVS     R0,#+5
        STRB     R0,[SP, #+0]
//   88   
//   89   SPI_sendBytes(&buffer,1);
        MOVS     R1,#+1
        ADD      R0,SP,#+0
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//   90   SPI_getBytes((unsigned char*)status,1);
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall SPI_getBytes
        BL       SPI_getBytes
//   91   
//   92   UNSEL_CS_01;      
        LDR.W    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//   93 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_FIO0CLR
        REQUIRE _A_FIO0SET
//   94 /********************************************************************************
//   95 *   Descrição     :   Aguarda o sinal de busy ficar zerado
//   96 *   Parametors    :   nenhum
//   97 *   Retorno       :   nenhum
//   98 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SST_busyWait
        THUMB
//   99 void SST_busyWait(void){
SST_busyWait:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  100   
//  101   SST_status status;      
//  102   do SST25VF_readStatus(&status);            
??SST_busyWait_0:
        ADD      R0,SP,#+0
          CFI FunCall SST25VF_readStatus
        BL       SST25VF_readStatus
//  103   while(status.busy);   
        LDRB     R0,[SP, #+0]
        ANDS     R0,R0,#0x1
        CMP      R0,#+0
        BNE.N    ??SST_busyWait_0
//  104 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  105 /********************************************************************************
//  106 *   Descrição     :   Faz a escrita no registrador de estado
//  107 *   Parametros    :   (SST_status*) valor para ser escrito no status
//  108 *   Retorno       :   nenhum
//  109 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SST25VF_writeStatus
        THUMB
//  110 unsigned char SST25VF_writeStatus(SST_status *status){
SST25VF_writeStatus:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
        MOVS     R4,R0
//  111   unsigned char buffer[2];
//  112   SST_status tmp;
//  113   
//  114   SEL_CS_01;
        LDR.W    R0,??DataTable12_1  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.W    R1,??DataTable12_1  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  115   buffer[0] = SST_EWSR;
        MOVS     R0,#+80
        STRB     R0,[SP, #+0]
//  116   SPI_sendBytes(buffer,1);
        MOVS     R1,#+1
        ADD      R0,SP,#+0
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//  117   UNSEL_CS_01;
        LDR.N    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//  118   
//  119   buffer[0] = SST_WRITE_STATUS;
        MOVS     R0,#+1
        STRB     R0,[SP, #+0]
//  120   buffer[1] = *(unsigned char*)status;
        LDRB     R0,[R4, #+0]
        STRB     R0,[SP, #+1]
//  121   
//  122   SEL_CS_01;
        LDR.N    R0,??DataTable12_1  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  123   SPI_sendBytes(buffer,2);    
        MOVS     R1,#+2
        ADD      R0,SP,#+0
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//  124   UNSEL_CS_01;          
        LDR.N    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//  125   
//  126   SST25VF_readStatus(&tmp);
        ADD      R0,SP,#+4
          CFI FunCall SST25VF_readStatus
        BL       SST25VF_readStatus
//  127   
//  128   if(*(unsigned char*)&tmp == *(unsigned char*)status)
        LDRB     R0,[SP, #+4]
        LDRB     R1,[R4, #+0]
        CMP      R0,R1
        BNE.N    ??SST25VF_writeStatus_0
//  129     return 0xFF;
        MOVS     R0,#+255
        B.N      ??SST25VF_writeStatus_1
//  130   
//  131   return 0x00;
??SST25VF_writeStatus_0:
        MOVS     R0,#+0
??SST25VF_writeStatus_1:
        POP      {R1,R2,R4,PC}    ;; return
          CFI EndBlock cfiBlock3
        REQUIRE _A_FIO0CLR
        REQUIRE _A_FIO0SET
//  132 }     
//  133 /********************************************************************************
//  134 *   Descrição     :   Lê o ID da memória
//  135 *   Parametros    :   nenhum
//  136 *   Retorno       :   (unsigned short int) valor lido da memória
//  137 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SST_readID
        THUMB
//  138 unsigned short int SST_readID(void){
SST_readID:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  139   unsigned char buffer[4];
//  140   
//  141   SEL_CS_01;
        LDR.N    R0,??DataTable12_1  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  142   
//  143   buffer[0] = SST_READ_ID;
        MOVS     R0,#+144
        STRB     R0,[SP, #+0]
//  144   buffer[1] = 0x00;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  145   buffer[2] = 0x00;
        MOVS     R0,#+0
        STRB     R0,[SP, #+2]
//  146   buffer[3] = 0x00;
        MOVS     R0,#+0
        STRB     R0,[SP, #+3]
//  147   
//  148   SPI_sendBytes(buffer,4);
        MOVS     R1,#+4
        ADD      R0,SP,#+0
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//  149   SPI_getBytes(buffer,4);
        MOVS     R1,#+4
        ADD      R0,SP,#+0
          CFI FunCall SPI_getBytes
        BL       SPI_getBytes
//  150   
//  151   UNSEL_CS_01;  
        LDR.N    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//  152    
//  153   return (unsigned short int)buffer[0]<<8 | buffer[1];
        LDRB     R0,[SP, #+0]
        LDRB     R1,[SP, #+1]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
        REQUIRE _A_FIO0CLR
        REQUIRE _A_FIO0SET
//  154 }
//  155 /********************************************************************************
//  156 *   Descrição     :   Habilita a escrita na memoria
//  157 *   Parametros    :   nenhum
//  158 *   Retorno       :   nenhum
//  159 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SST_writeEnable
        THUMB
//  160 void SST_writeEnable(void){
SST_writeEnable:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  161   unsigned char buffer;
//  162   
//  163   SEL_CS_01;
        LDR.N    R0,??DataTable12_1  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  164   buffer = SST_WRITE_ENABLE;
        MOVS     R0,#+6
        STRB     R0,[SP, #+0]
//  165   SPI_sendBytes(&buffer,1);
        MOVS     R1,#+1
        ADD      R0,SP,#+0
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//  166   UNSEL_CS_01;     
        LDR.N    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//  167 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
        REQUIRE _A_FIO0CLR
        REQUIRE _A_FIO0SET
//  168 /********************************************************************************
//  169 *   Descrição     :   Desabilita a escrita na memória
//  170 *   Parametros    :   nenhum
//  171 *   Retorno       :   nenhum
//  172 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SST_writeDisable
        THUMB
//  173 void SST_writeDisable(void){
SST_writeDisable:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  174   unsigned char buffer;
//  175 
//  176   SEL_CS_01;
        LDR.N    R0,??DataTable12_1  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  177   buffer = SST_WRITE_DISABLE;
        MOVS     R0,#+4
        STRB     R0,[SP, #+0]
//  178   SPI_sendBytes(&buffer,1);  
        MOVS     R1,#+1
        ADD      R0,SP,#+0
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//  179   UNSEL_CS_01;  
        LDR.N    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//  180 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6
        REQUIRE _A_FIO0CLR
        REQUIRE _A_FIO0SET
//  181 /********************************************************************************
//  182 *   Descrição     :   Leitura de alta velocidade
//  183 *   Parametros    :   (unsigned char*) buffer onde serão alocados os dados lidos
//  184 *                     (unsigned short int) número de bytes lidos
//  185 *   Retorno       :   nenhum
//  186 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SST_highSpeedRead
        THUMB
//  187 void SST_highSpeedRead(unsigned int endereco,unsigned char *buffer,
//  188                        unsigned short int size){
SST_highSpeedRead:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+12
          CFI CFA R13+24
        MOVS     R4,R1
        MOVS     R5,R2
//  189   unsigned char comandos[5];
//  190   
//  191   SEL_CS_01;
        LDR.N    R1,??DataTable12_1  ;; 0x2009c01c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10000
        LDR.N    R2,??DataTable12_1  ;; 0x2009c01c
        STR      R1,[R2, #+0]
//  192 
//  193   comandos[0] = SST_HIGH_SPEED_READ; 
        MOVS     R1,#+11
        STRB     R1,[SP, #+0]
//  194   comandos[1] = (unsigned char)(endereco>>16);
        LSRS     R1,R0,#+16
        STRB     R1,[SP, #+1]
//  195   comandos[2] = (unsigned char)(endereco>>8);
        LSRS     R1,R0,#+8
        STRB     R1,[SP, #+2]
//  196   comandos[3] = (unsigned char)endereco;
        STRB     R0,[SP, #+3]
//  197   comandos[4] = 0x00;
        MOVS     R0,#+0
        STRB     R0,[SP, #+4]
//  198   SPI_sendBytes(comandos,5);
        MOVS     R1,#+5
        ADD      R0,SP,#+0
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//  199   SPI_getBytes(buffer,size);
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall SPI_getBytes
        BL       SPI_getBytes
//  200       
//  201   UNSEL_CS_01;  
        LDR.N    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//  202 }
        POP      {R0-R2,R4,R5,PC}  ;; return
          CFI EndBlock cfiBlock7
        REQUIRE _A_FIO0CLR
        REQUIRE _A_FIO0SET
//  203 /********************************************************************************
//  204 *   Descrição   :   Programa um byte na dataflash
//  205 *   Parametros  :   (unsigned int) endereco
//  206 *                   (unsigned char) valor
//  207 *   Retorno     :   nenhum
//  208 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function SST_writeByte
        THUMB
//  209 void SST_writeByte(unsigned int endereco,unsigned char valor){
SST_writeByte:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+12
          CFI CFA R13+24
        MOVS     R5,R0
        MOVS     R4,R1
//  210   unsigned char comandos[5];    
//  211   
//  212   SST_writeEnable(); // Habilita a escrita na memória
          CFI FunCall SST_writeEnable
        BL       SST_writeEnable
//  213   
//  214   SEL_CS_01;
        LDR.N    R0,??DataTable12_1  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  215   
//  216   comandos[0] = SST_BYTE_PROGRAM;
        MOVS     R0,#+2
        STRB     R0,[SP, #+0]
//  217   comandos[1] = (unsigned char)(endereco>>16);
        LSRS     R0,R5,#+16
        STRB     R0,[SP, #+1]
//  218   comandos[2] = (unsigned char)(endereco>>8);
        LSRS     R0,R5,#+8
        STRB     R0,[SP, #+2]
//  219   comandos[3] = (unsigned char) endereco;
        STRB     R5,[SP, #+3]
//  220   comandos[4] = valor;
        STRB     R4,[SP, #+4]
//  221   SPI_sendBytes(comandos,5);
        MOVS     R1,#+5
        ADD      R0,SP,#+0
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//  222   
//  223   UNSEL_CS_01;      
        LDR.N    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//  224   
//  225   SST_writeDisable(); // Desabilita a escrita na memória
          CFI FunCall SST_writeDisable
        BL       SST_writeDisable
//  226 }
        POP      {R0-R2,R4,R5,PC}  ;; return
          CFI EndBlock cfiBlock8
        REQUIRE _A_FIO0CLR
        REQUIRE _A_FIO0SET
//  227 /********************************************************************************
//  228 *   Descrição   :   Escreve uma sequência de bytes na memória
//  229 *   Parametros  :   (unsigned int) endereco inicial
//  230 *                   (unsigned char*) buffer que será escrito
//  231 *                   (unsigned short int) tamanho do buffer
//  232 *   Retorno     :   nenhum
//  233 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function SST_writeAutoAddressInc
        THUMB
//  234 void SST_writeAutoAddressInc(unsigned int endereco,unsigned char *pData,
//  235                              unsigned short int size){
SST_writeAutoAddressInc:
        PUSH     {R2-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+24
        MOVS     R6,R0
        MOVS     R4,R1
        MOVS     R5,R2
//  236   unsigned char comando[6];
//  237   
//  238   SST_writeEnable();// Habilita a escrita na memória
          CFI FunCall SST_writeEnable
        BL       SST_writeEnable
//  239   
//  240   comando[0] = SST_AAI;
        MOVS     R0,#+173
        STRB     R0,[SP, #+0]
//  241   comando[1] = (unsigned char)(endereco>>16);
        LSRS     R0,R6,#+16
        STRB     R0,[SP, #+1]
//  242   comando[2] = (unsigned char)(endereco>>8);
        LSRS     R0,R6,#+8
        STRB     R0,[SP, #+2]
//  243   comando[3] = (unsigned char)endereco;
        STRB     R6,[SP, #+3]
//  244   comando[4] = pData[0];
        LDRB     R0,[R4, #+0]
        STRB     R0,[SP, #+4]
//  245   comando[5] = pData[1];
        LDRB     R0,[R4, #+1]
        STRB     R0,[SP, #+5]
//  246   
//  247   SEL_CS_01;
        LDR.N    R0,??DataTable12_1  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  248   SPI_sendBytes(comando,6);
        MOVS     R1,#+6
        ADD      R0,SP,#+0
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//  249   
//  250   for(unsigned short int i=0;i<(size-2);i+=2){
        MOVS     R6,#+0
        B.N      ??SST_writeAutoAddressInc_0
//  251       
//  252     SST_busyWait();
??SST_writeAutoAddressInc_1:
          CFI FunCall SST_busyWait
        BL       SST_busyWait
//  253 
//  254     comando[0] = SST_AAI;
        MOVS     R0,#+173
        STRB     R0,[SP, #+0]
//  255     comando[1] = pData[2+i];
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R6,R4
        LDRB     R0,[R0, #+2]
        STRB     R0,[SP, #+1]
//  256     comando[2] = pData[3+i];
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R6,R4
        LDRB     R0,[R0, #+3]
        STRB     R0,[SP, #+2]
//  257           
//  258     SEL_CS_01;
        LDR.N    R0,??DataTable12_1  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  259     SPI_sendBytes(comando,3);
        MOVS     R1,#+3
        ADD      R0,SP,#+0
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//  260     UNSEL_CS_01;
        LDR.N    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//  261   }
        ADDS     R6,R6,#+2
??SST_writeAutoAddressInc_0:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        SUBS     R0,R5,#+2
        CMP      R6,R0
        BLT.N    ??SST_writeAutoAddressInc_1
//  262   
//  263   SST_busyWait();  
          CFI FunCall SST_busyWait
        BL       SST_busyWait
//  264     
//  265   SST_writeDisable();// Desabilita a escrita na memória
          CFI FunCall SST_writeDisable
        BL       SST_writeDisable
//  266 }
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock9
        REQUIRE _A_FIO0CLR
        REQUIRE _A_FIO0SET
//  267 /********************************************************************************
//  268 *   Descrição     :   Apaga um setor de 4kb na flash
//  269 *   Parametros    :   (unsigned short int) número do setor
//  270 *   Retorno       :   nenhum
//  271 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function SST_erase4kbSector
        THUMB
//  272 void SST_erase4kbSector(unsigned int sector){
SST_erase4kbSector:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
        MOVS     R4,R0
//  273   unsigned char comando[4];
//  274   SST_status status;
//  275   
//  276   SST25VF_readStatus(&status);
        ADD      R0,SP,#+0
          CFI FunCall SST25VF_readStatus
        BL       SST25VF_readStatus
//  277   status.bp0 = 0;
        LDRB     R0,[SP, #+0]
        ANDS     R0,R0,#0xFB
        STRB     R0,[SP, #+0]
//  278   status.bp1 = 0;
        LDRB     R0,[SP, #+0]
        ANDS     R0,R0,#0xF7
        STRB     R0,[SP, #+0]
//  279   status.bp2 = 0;
        LDRB     R0,[SP, #+0]
        ANDS     R0,R0,#0xEF
        STRB     R0,[SP, #+0]
//  280   SST25VF_writeStatus(&status); 
        ADD      R0,SP,#+0
          CFI FunCall SST25VF_writeStatus
        BL       SST25VF_writeStatus
//  281   
//  282   SST_writeEnable();  
          CFI FunCall SST_writeEnable
        BL       SST_writeEnable
//  283 
//  284   SEL_CS_01;
        LDR.N    R0,??DataTable12_1  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  285 
//  286   sector&= ~0xFFF;//Apaga os bits de endereçamento dentro da página
        LSRS     R4,R4,#+12
        LSLS     R4,R4,#+12
//  287   
//  288   comando[0] =  SST_4KB_ERASE;
        MOVS     R0,#+32
        STRB     R0,[SP, #+4]
//  289   comando[1] = (unsigned char)(sector>>16);
        LSRS     R0,R4,#+16
        STRB     R0,[SP, #+5]
//  290   comando[2] = (unsigned char)(sector>>8);
        LSRS     R0,R4,#+8
        STRB     R0,[SP, #+6]
//  291   comando[3] = (unsigned char) sector;
        STRB     R4,[SP, #+7]
//  292   SPI_sendBytes(comando,4);
        MOVS     R1,#+4
        ADD      R0,SP,#+4
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//  293   
//  294   UNSEL_CS_01;      
        LDR.N    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//  295   
//  296   SST_busyWait();
          CFI FunCall SST_busyWait
        BL       SST_busyWait
//  297   
//  298   SST_writeDisable();// Desabilita a escrita na memória  
          CFI FunCall SST_writeDisable
        BL       SST_writeDisable
//  299 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock10
        REQUIRE _A_FIO0CLR
        REQUIRE _A_FIO0SET
//  300 /********************************************************************************
//  301 *   Descrição     :   Apaga um setor de 32kb
//  302 *   Parametros    :   (unsigned short int) número do setor
//  303 *   Retorno       :   nenhum
//  304 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function SST_erase32kbSector
        THUMB
//  305 void SST_erase32kbSector(unsigned int sector){
SST_erase32kbSector:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  306   unsigned char comando[4];
//  307   
//  308   SST_writeEnable();
          CFI FunCall SST_writeEnable
        BL       SST_writeEnable
//  309 
//  310   SEL_CS_01;
        LDR.N    R0,??DataTable12_1  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  311 
//  312   comando[0] =  SST_32KB_ERASE;
        MOVS     R0,#+82
        STRB     R0,[SP, #+0]
//  313   comando[1] = (unsigned char)(sector>>16);
        LSRS     R0,R4,#+16
        STRB     R0,[SP, #+1]
//  314   comando[2] = (unsigned char)(sector>>8);
        LSRS     R0,R4,#+8
        STRB     R0,[SP, #+2]
//  315   comando[3] = (unsigned char) sector;
        STRB     R4,[SP, #+3]
//  316   SPI_sendBytes(comando,4);
        MOVS     R1,#+4
        ADD      R0,SP,#+0
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//  317   
//  318   UNSEL_CS_01;         
        LDR.N    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//  319   
//  320   SST_busyWait();
          CFI FunCall SST_busyWait
        BL       SST_busyWait
//  321   
//  322   SST_writeDisable();// Desabilita a escrita na memória  
          CFI FunCall SST_writeDisable
        BL       SST_writeDisable
//  323 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock11
        REQUIRE _A_FIO0CLR
        REQUIRE _A_FIO0SET
//  324 /********************************************************************************
//  325 *   Descrição     :   Apaga um setor de 64kb
//  326 *   Parametros    :   (unsigned short int) número do setor
//  327 *   Retorno       :   nenhum
//  328 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function SST_erase64kbSector
        THUMB
//  329 void SST_erase64kbSector(unsigned int sector){
SST_erase64kbSector:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  330   unsigned char comando[4];
//  331   
//  332   SST_writeEnable();
          CFI FunCall SST_writeEnable
        BL       SST_writeEnable
//  333 
//  334   SEL_CS_01;
        LDR.N    R0,??DataTable12_1  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  335 
//  336   comando[0] =  SST_64KB_ERASE;
        MOVS     R0,#+216
        STRB     R0,[SP, #+0]
//  337   comando[1] = (unsigned char)(sector>>16);
        LSRS     R0,R4,#+16
        STRB     R0,[SP, #+1]
//  338   comando[2] = (unsigned char)(sector>>8);
        LSRS     R0,R4,#+8
        STRB     R0,[SP, #+2]
//  339   comando[3] = (unsigned char) sector;
        STRB     R4,[SP, #+3]
//  340   SPI_sendBytes(comando,4);
        MOVS     R1,#+4
        ADD      R0,SP,#+0
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//  341   
//  342   SST_busyWait();
          CFI FunCall SST_busyWait
        BL       SST_busyWait
//  343   
//  344   UNSEL_CS_01;           
        LDR.N    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//  345   SST_writeDisable();// Desabilita a escrita na memória  
          CFI FunCall SST_writeDisable
        BL       SST_writeDisable
//  346 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock12
        REQUIRE _A_FIO0CLR
        REQUIRE _A_FIO0SET
//  347 /********************************************************************************
//  348 *   Descrição     :   Apaga todo o chip
//  349 *   Parametros    :   nenhum
//  350 *   Retorno       :   nenhum
//  351 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function SST_chipErase
        THUMB
//  352 void SST_chipErase(void){
SST_chipErase:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  353   unsigned char comando;
//  354   
//  355   SST_writeEnable();
          CFI FunCall SST_writeEnable
        BL       SST_writeEnable
//  356 
//  357   SEL_CS_01;
        LDR.N    R0,??DataTable12_1  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12_1  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  358 
//  359   comando =  SST_CHIP_ERASE;
        MOVS     R0,#+96
        STRB     R0,[SP, #+0]
//  360   SPI_sendBytes(&comando,1);
        MOVS     R1,#+1
        ADD      R0,SP,#+0
          CFI FunCall SPI_sendBytes
        BL       SPI_sendBytes
//  361   
//  362   UNSEL_CS_01;           
        LDR.N    R0,??DataTable12  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable12  ;; 0x2009c018
        STR      R0,[R1, #+0]
//  363   SST_busyWait();
          CFI FunCall SST_busyWait
        BL       SST_busyWait
//  364   SST_writeDisable();// Desabilita a escrita na memória  
          CFI FunCall SST_writeDisable
        BL       SST_writeDisable
//  365 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock13
        REQUIRE _A_FIO0CLR
        REQUIRE _A_FIO0SET

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x2009c018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0x2009c01c

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  366 /********************************************************************************
//  367 *   Fim do arquivo
//  368 ********************************************************************************/
// 
//     8 bytes in section .noinit (abs)
// 1 042 bytes in section .text
// 
// 1 042 bytes of CODE memory
//     0 bytes of DATA memory (+ 8 bytes shared)
//
//Errors: none
//Warnings: none
