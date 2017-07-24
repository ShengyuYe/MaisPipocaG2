///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     24/Jul/2017  16:53:36 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Protocolo\File_system_adapter.c /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Protocolo\File_system_adapter.c /
//                     -lC C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\M /
//                    aisPipocaG2\SOFTWARE\Debug\List\ -lA                    /
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
//                    pocaG2\SOFTWARE\Debug\List\File_system_adapter.s        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME File_system_adapter

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN SST_erase4kbSector

        PUBLIC FSA_format_audio_memory
        PUBLIC FSA_write_memory_data
        PUBLIC FSA_write_start_of_file
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\Protocolo\File_system_adapter.c
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
//   17 |       Arquivo            :  file_system_adapter.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  24/07/2017
//   21 |
//   22 |       Revisões           :  1
//   23 
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 
//   29 /************************************************************************************
//   30 *       Includes
//   31 ************************************************************************************/
//   32 #include <stdio.h>
//   33 #include <stdlib.h>
//   34 #include <string.h>
//   35 #include "file_system_adapter.h"
//   36 #include "..\..\includes.h"
//   37 
//   38 /************************************************************************************
//   39 *       Definições locais
//   40 ************************************************************************************/
//   41 #define BLOCK_READ(X,Y,Z)                       MEMORYWRAPPER_readBytes(X,Y,Z)
//   42 #define BLOCK_WRITE(X,Y,Z)                      MEMORYWRAPPER_writeBytes(X,Y,Z)
//   43 
//   44 
//   45 
//   46 /************************************************************************************
//   47 *       Variaveis locais
//   48 ************************************************************************************/
//   49 
//   50 /************************************************************************************
//   51 *       Funções locais
//   52 ************************************************************************************/
//   53 
//   54 /************************************************************************************
//   55 *       Implementação das funções
//   56 ************************************************************************************/
//   57 
//   58 /************************************************************************************
//   59 *       Descrição       :       Escreve na tabela que contém o endereço
//   60 *                               do início dos arquivos de áudio
//   61 *       Parametros      :       (unsigned char) indice do arquivo
//   62 *                               (unsigned int) endereço inicial na flash
//   63 *       Retorno         :       nenhum
//   64 ************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function FSA_write_start_of_file
          CFI NoCalls
        THUMB
//   65 void FSA_write_start_of_file(unsigned char file_index,
//   66                              unsigned int start_address){
//   67                                
//   68                                
//   69                                
//   70 }
FSA_write_start_of_file:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   71 /************************************************************************************
//   72 *       Descrição       :       Escreve um bloco no endereço inicial
//   73 *                               da flash
//   74 *       Parametros      :       (unsigned int) endereço inicial
//   75 *                               (unsigned char*) ponteiro para os dados
//   76 *                               (unsigned short int) tamanho
//   77 *       Retorno         :       nenhum
//   78 ************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function FSA_write_memory_data
          CFI NoCalls
        THUMB
//   79 void FSA_write_memory_data(unsigned int start_address,
//   80                            unsigned char *pData,
//   81                            unsigned short int size){
//   82                              
//   83                              
//   84 }
FSA_write_memory_data:
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   85 /************************************************************************************
//   86 *       Descrição       :       Formata a área de memória onde se encontra
//   87 *                               o bloco de aúdio
//   88 *       Parametros      :       nenhum
//   89 *       Retorno         :       nenhum
//   90 ************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function FSA_format_audio_memory
        THUMB
//   91 void FSA_format_audio_memory(void){
FSA_format_audio_memory:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//   92   unsigned long int enderecoInicial=AREA_ARQUIVOS;
        MOV      R4,#+8192
//   93   
//   94   for(unsigned short int i=0;i<599;i++){
        MOVS     R5,#+0
        B.N      ??FSA_format_audio_memory_0
//   95     SST_erase4kbSector(enderecoInicial);
??FSA_format_audio_memory_1:
        MOVS     R0,R4
          CFI FunCall SST_erase4kbSector
        BL       SST_erase4kbSector
//   96     enderecoInicial+=4096;
        ADDS     R4,R4,#+4096
//   97   }
        ADDS     R5,R5,#+1
??FSA_format_audio_memory_0:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVW     R0,#+599
        CMP      R5,R0
        BLT.N    ??FSA_format_audio_memory_1
//   98 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock2

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   99 /************************************************************************************
//  100 *       Fim do arquivo
//  101 ************************************************************************************/
// 
// 38 bytes in section .text
// 
// 38 bytes of CODE memory
//
//Errors: none
//Warnings: none
