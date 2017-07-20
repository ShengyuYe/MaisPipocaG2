///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  13:21:42 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\sst25vf016b\memoryWrapper.c     /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\sst25vf016b\memoryWrapper.c     /
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
//                    pocaG2\SOFTWARE\Debug\List\memoryWrapper.s              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME memoryWrapper

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN SPIWRAPPER_init
        EXTERN SST25VF_init
        EXTERN SST_erase4kbSector
        EXTERN SST_highSpeedRead
        EXTERN SST_writeAutoAddressInc
        EXTERN __aeabi_memcpy
        EXTERN xQueueCreate
        EXTERN xQueueGenericReceive
        EXTERN xQueueGenericSend

        PUBLIC MEMORYWRAPPER_blockReadAuxSST
        PUBLIC MEMORYWRAPPER_blockWriteAuxSST
        PUBLIC MEMORYWRAPPER_init
        PUBLIC MEMORYWRAPPER_localBuffer
        PUBLIC MEMORYWRAPPER_readBytes
        PUBLIC MEMORYWRAPPER_readSingle
        PUBLIC MEMORYWRAPPER_release
        PUBLIC MEMORYWRAPPER_wait
        PUBLIC MEMORYWRAPPER_writeBufferInSector
        PUBLIC MEMORYWRAPPER_writeBytes
        PUBLIC memcpy
        PUBLIC semDataFlash
        PUBLIC tamanhoPaginas
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\sst25vf016b\memoryWrapper.c
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
//   17 |       Product	    :       
//   18 |       Module	    :   Adapter para memória AT45011 ficar linear
//   19 |       File	    :   memoryWrapper.c
//   20 |       Description :   Cria uma abstração para utilziar a AT45DB011 como memória linear
//   21 |	Author      :   Marcos Aquino
//   22 |
//   23 |       Created on  :   12/06/2009
//   24 |                       25/07/2011 - Inicio da alteração para a funcionar com
//   25 |                       N chips externos, além de resolver o cruzamento
//   26 |                       de endereçamento entre os CHIPs
//   27 |
//   28 |       History     :   
//   29 |
//   30 |
//   31 | __________________________________________________________________________________
//   32 */
//   33 
//   34 /***********************************************************************************
//   35 *	Includes
//   36 ***********************************************************************************/
//   37 #include <nxp\iolpc1768.h>
//   38 #include <string.h>

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
//   39 #include "sst25vf016b.h"
//   40 #include "memoryWrapper.h"
//   41 #include "paginacaoMemoriaFlash.h"
//   42 #include "spi_wrapper.h"
//   43 #include "..\..\includes.h"
//   44 
//   45 /***********************************************************************************
//   46 *	Defines - Local
//   47 ***********************************************************************************/ 
//   48 #define TAMANHO_PAGINA_SST25VF016                           4096
//   49 #define QTD_PAGINAS_SST25VF016                              512 
//   50 
//   51 #define TAMANHO_PAGINA_AT45DB011                            264
//   52 #define QTD_PAGINAS_AT45DB011                               512
//   53 
//   54 /***********************************************************************************
//   55 *       Constantes
//   56 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   57 const unsigned int tamanhoPaginas[3]={
tamanhoPaginas:
        DATA
        DC32 264, 264, 4096
//   58   [0] = TAMANHO_PAGINA_AT45DB011,
//   59   [1] = TAMANHO_PAGINA_AT45DB011,
//   60   [2] = TAMANHO_PAGINA_SST25VF016
//   61 };
//   62 
//   63 /***********************************************************************************
//   64 *	Enumerations - Local
//   65 ***********************************************************************************/
//   66 
//   67 
//   68 /***********************************************************************************
//   69 *	Structs - Local
//   70 ***********************************************************************************/
//   71 
//   72 
//   73 /***********************************************************************************
//   74 *	Types - Local
//   75 ***********************************************************************************/
//   76 
//   77 
//   78 /***********************************************************************************
//   79 *	Variables - Local
//   80 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   81 xSemaphoreHandle semDataFlash;
semDataFlash:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   82 unsigned char MEMORYWRAPPER_localBuffer[TAMANHO_PAGINA_SST25VF016];
MEMORYWRAPPER_localBuffer:
        DS8 4096
//   83 
//   84 
//   85 /***********************************************************************************
//   86 *	Functions - Local
//   87 ***********************************************************************************/
//   88 void MEMORYWRAPPER_writeToAT45Page(unsigned char flash,unsigned int page,
//   89                                    unsigned char *pData,unsigned int size);
//   90 
//   91 /***********************************************************************************
//   92 *	Implementations
//   93 ***********************************************************************************/
//   94 
//   95 /***********************************************************************************
//   96 *       Descrição     : Inicialização do módulo
//   97 *       Parametros    : nenhum
//   98 *       Retorno       : nenhum
//   99 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MEMORYWRAPPER_init
        THUMB
//  100 void MEMORYWRAPPER_init(void){
MEMORYWRAPPER_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  101   
//  102   SPIWRAPPER_init(66000000);
        LDR.N    R0,??DataTable5  ;; 0x3ef1480
          CFI FunCall SPIWRAPPER_init
        BL       SPIWRAPPER_init
//  103   SST25VF_init(1);
        MOVS     R0,#+1
          CFI FunCall SST25VF_init
        BL       SST25VF_init
//  104   vSemaphoreCreateBinary(semDataFlash);
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall xQueueCreate
        BL       xQueueCreate
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??MEMORYWRAPPER_init_0
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  105 }
??MEMORYWRAPPER_init_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  106 /********************************************************************************
//  107 *     Descrição     :   Grava um buffer em um setor da flash
//  108 *     Parametros    :   (unsigned short int) endereco
//  109 *                       (unsigned char*) buffer
//  110 *     Retorno       :   nenhum
//  111 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MEMORYWRAPPER_writeBufferInSector
        THUMB
//  112 void MEMORYWRAPPER_writeBufferInSector(unsigned int startAddress,unsigned char *pData,
//  113                                        unsigned short int offset,unsigned short int size){
MEMORYWRAPPER_writeBufferInSector:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  114                                   
//  115   SST_highSpeedRead(startAddress&0xFFFFF000,MEMORYWRAPPER_localBuffer,TAMANHO_PAGINA_SST25VF016);//Copia o setor para o buffer local
        MOV      R2,#+4096
        LDR.N    R1,??DataTable5_2
        LSRS     R0,R4,#+12
        LSLS     R0,R0,#+12
          CFI FunCall SST_highSpeedRead
        BL       SST_highSpeedRead
//  116   SST_erase4kbSector(startAddress);
        MOVS     R0,R4
          CFI FunCall SST_erase4kbSector
        BL       SST_erase4kbSector
//  117   
//  118   memcpy(&MEMORYWRAPPER_localBuffer[offset],pData,size);//Insere os dados no buffer
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R2,R7
        MOVS     R1,R5
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LDR.N    R0,??DataTable5_2
        ADDS     R0,R6,R0
          CFI FunCall memcpy
        BL       memcpy
//  119   SST_writeAutoAddressInc(startAddress&0xFFFFF000,MEMORYWRAPPER_localBuffer,TAMANHO_PAGINA_SST25VF016);//Grava o buffer no setor    
        MOV      R2,#+4096
        LDR.N    R1,??DataTable5_2
        LSRS     R0,R4,#+12
        LSLS     R0,R0,#+12
          CFI FunCall SST_writeAutoAddressInc
        BL       SST_writeAutoAddressInc
//  120 }
        POP      {R0,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock2
//  121 /********************************************************************************
//  122 *     Descrição     :   Escreve um buffer na flash
//  123 *     Parametros    :   (unsigned int) endereço inicial
//  124 *                       (unsigned char*) referência para o buffer
//  125 *                       (unsigned short int) tamanho do buffer escrito
//  126 *     Retorno       :   nenhum
//  127 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MEMORYWRAPPER_blockWriteAuxSST
        THUMB
//  128 void MEMORYWRAPPER_blockWriteAuxSST(unsigned int startAddress,unsigned char *pData,
//  129                                      unsigned short int size){                        
MEMORYWRAPPER_blockWriteAuxSST:
        PUSH     {R3-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  130   unsigned int pagina = startAddress / TAMANHO_PAGINA_SST25VF016;
        LSRS     R0,R4,#+12
//  131   unsigned int offset = startAddress - (pagina*TAMANHO_PAGINA_SST25VF016); 
        MOV      R1,#+4096
        MLS      R7,R1,R0,R4
//  132   unsigned int toWrite=TAMANHO_PAGINA_SST25VF016-offset,index=0;
        RSBS     R8,R7,#+4096
        MOVS     R9,#+0
//  133   
//  134   
//  135   if( (offset+size) < TAMANHO_PAGINA_SST25VF016)
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R6,R7
        CMP      R0,#+4096
        BCS.N    ??MEMORYWRAPPER_blockWriteAuxSST_0
//  136     MEMORYWRAPPER_writeBufferInSector(startAddress,pData,offset,size);
        MOVS     R3,R6
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R7
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall MEMORYWRAPPER_writeBufferInSector
        BL       MEMORYWRAPPER_writeBufferInSector
//  137   else
//  138     while(size){      
//  139       MEMORYWRAPPER_writeBufferInSector(startAddress,&pData[index],offset,toWrite);
//  140       startAddress+=toWrite;
//  141       index+=toWrite;
//  142       if(offset)
//  143         size-=toWrite;
//  144       else
//  145         if(size>TAMANHO_PAGINA_SST25VF016)
//  146           size-=TAMANHO_PAGINA_SST25VF016;
//  147         else
//  148           size=0;
//  149         
//  150       offset=0;      
//  151       toWrite = size % TAMANHO_PAGINA_SST25VF016;      
//  152     }               
//  153 }
??MEMORYWRAPPER_blockWriteAuxSST_1:
        POP      {R0,R4-R9,PC}    ;; return
??MEMORYWRAPPER_blockWriteAuxSST_2:
        MOVS     R6,#+0
??MEMORYWRAPPER_blockWriteAuxSST_3:
        MOVS     R7,#+0
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOV      R0,#+4096
        SDIV     R8,R6,R0
        MLS      R8,R8,R0,R6
??MEMORYWRAPPER_blockWriteAuxSST_0:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??MEMORYWRAPPER_blockWriteAuxSST_1
        MOV      R3,R8
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R7
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R1,R9,R5
        MOVS     R0,R4
          CFI FunCall MEMORYWRAPPER_writeBufferInSector
        BL       MEMORYWRAPPER_writeBufferInSector
        ADDS     R4,R8,R4
        ADDS     R9,R8,R9
        CMP      R7,#+0
        BEQ.N    ??MEMORYWRAPPER_blockWriteAuxSST_4
        SUBS     R6,R6,R8
        B.N      ??MEMORYWRAPPER_blockWriteAuxSST_3
??MEMORYWRAPPER_blockWriteAuxSST_4:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+4096
        BLE.N    ??MEMORYWRAPPER_blockWriteAuxSST_2
        SUBS     R6,R6,#+4096
        B.N      ??MEMORYWRAPPER_blockWriteAuxSST_3
          CFI EndBlock cfiBlock3
//  154 /********************************************************************************
//  155 *     Descrição     :   Lê um buffer da flash
//  156 *     Parametros    :   (unsigned int) endereço inicial
//  157 *                       (unsigned char*) referência para o buffer
//  158 *                       (unsigned short int) tamanho do buffer para ler
//  159 *     Retorno       :   nenhum
//  160 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MEMORYWRAPPER_blockReadAuxSST
        THUMB
//  161 void MEMORYWRAPPER_blockReadAuxSST(unsigned int startAddress,unsigned char *pData,
//  162                                     unsigned short int size){                     
MEMORYWRAPPER_blockReadAuxSST:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  163   
//  164   SST_highSpeedRead(startAddress,pData,size);  
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
          CFI FunCall SST_highSpeedRead
        BL       SST_highSpeedRead
//  165 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  166 /***********************************************************************************
//  167 *     Descrição     :   Escreve um buffer na dataflash
//  168 *     Parametros    :   (unsigned long int) endereço inicial
//  169 *                       (unsigned char*) ponteiro para os dados
//  170 *                       (unsigned int) tamanho dos dados no buffer
//  171 *     Retorno       :   nenhum
//  172 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MEMORYWRAPPER_writeBytes
        THUMB
//  173 unsigned char MEMORYWRAPPER_writeBytes(unsigned long int enderecoInicial,unsigned char *buffer,
//  174                                        unsigned int size){                                         
MEMORYWRAPPER_writeBytes:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  175                                                                                   
//  176   while(!xSemaphoreTake(semDataFlash,portTICK_RATE_MS*1));
??MEMORYWRAPPER_writeBytes_0:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??MEMORYWRAPPER_writeBytes_0
//  177   
//  178   MEMORYWRAPPER_blockWriteAuxSST(enderecoInicial,buffer,size);
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall MEMORYWRAPPER_blockWriteAuxSST
        BL       MEMORYWRAPPER_blockWriteAuxSST
//  179   
//  180   xSemaphoreGive(semDataFlash); 
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  181   return 0;  
        MOVS     R0,#+0
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock5
//  182   
//  183 }
//  184 /***********************************************************************************
//  185 *       Descrição     : Lê um buffer de dados da memória flash
//  186 *       Parametros    : (unsigned int) Endereço inicial
//  187 *                       (unsigned char*) Ponteiro para o buffer
//  188 *                       (unsigned int) size
//  189 *       Retorno       : nenhum
//  190 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MEMORYWRAPPER_readBytes
        THUMB
//  191 unsigned char MEMORYWRAPPER_readBytes(unsigned long int enderecoInicial,unsigned char *buffer,
//  192                                       unsigned int size){
MEMORYWRAPPER_readBytes:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  193   
//  194   while(!xSemaphoreTake(semDataFlash,portTICK_RATE_MS*1));
??MEMORYWRAPPER_readBytes_0:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??MEMORYWRAPPER_readBytes_0
//  195   
//  196   MEMORYWRAPPER_blockReadAuxSST(enderecoInicial,buffer,size);
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall MEMORYWRAPPER_blockReadAuxSST
        BL       MEMORYWRAPPER_blockReadAuxSST
//  197     
//  198   xSemaphoreGive(semDataFlash);
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  199   return 0;  
        MOVS     R0,#+0
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock6
//  200   
//  201 }
//  202 /***********************************************************************************
//  203 *       Descrição     : Lê um buffer de dados da memória flash
//  204 *       Parametros    : (unsigned int) Endereço inicial
//  205 *                       (unsigned char*) Ponteiro para o buffer
//  206 *                       (unsigned int) size
//  207 *       Retorno       : nenhum
//  208 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function MEMORYWRAPPER_readSingle
        THUMB
//  209 unsigned char MEMORYWRAPPER_readSingle(unsigned long int enderecoInicial){
MEMORYWRAPPER_readSingle:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  210   unsigned char buffer;  
//  211   
//  212   MEMORYWRAPPER_blockReadAuxSST(enderecoInicial,&buffer,1);
        MOVS     R2,#+1
        ADD      R1,SP,#+0
          CFI FunCall MEMORYWRAPPER_blockReadAuxSST
        BL       MEMORYWRAPPER_blockReadAuxSST
//  213     
//  214   return buffer;    
        LDRB     R0,[SP, #+0]
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock7
//  215 }
//  216 /***********************************************************************************
//  217 *       Descrição       :       Inicia o semáforo de acesso a memória flash
//  218 *       Parametros      :       nenhum
//  219 *       Retorno         :       nenhum
//  220 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function MEMORYWRAPPER_wait
        THUMB
//  221 void MEMORYWRAPPER_wait(void){
MEMORYWRAPPER_wait:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  222   
//  223   while(!xSemaphoreTake(semDataFlash,portTICK_RATE_MS*1));
??MEMORYWRAPPER_wait_0:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??MEMORYWRAPPER_wait_0
//  224 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8
//  225 /***********************************************************************************
//  226 *       Descrição       :       Release para o semáforo de acesso a memória
//  227 *                               flash
//  228 *       Parametros      :       nenhum
//  229 *       Retorno         :       nenhum
//  230 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function MEMORYWRAPPER_release
        THUMB
//  231 void MEMORYWRAPPER_release(void){
MEMORYWRAPPER_release:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  232   
//  233   xSemaphoreGive(semDataFlash);  
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  234 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x3ef1480

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     semDataFlash

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     MEMORYWRAPPER_localBuffer

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  235 /***********************************************************************************
//  236 *       Fim do arquivo
//  237 ***********************************************************************************/
// 
// 4 100 bytes in section .bss
//    12 bytes in section .rodata
//   448 bytes in section .text
// 
//   434 bytes of CODE  memory (+ 14 bytes shared)
//    12 bytes of CONST memory
// 4 100 bytes of DATA  memory
//
//Errors: none
//Warnings: none
