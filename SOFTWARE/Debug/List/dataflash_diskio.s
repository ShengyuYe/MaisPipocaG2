///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     12/Jul/2017  11:51:29 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\FILESYSTEM\dataflash_diskio.c   /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\FILESYSTEM\dataflash_diskio.c   /
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
//                    pocaG2\SOFTWARE\Debug\List\dataflash_diskio.s           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME dataflash_diskio

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN MEMORYWRAPPER_readBytes
        EXTERN MEMORYWRAPPER_writeBytes

        PUBLIC DF_disk_initialize
        PUBLIC DF_disk_ioctl
        PUBLIC DF_disk_read
        PUBLIC DF_disk_status
        PUBLIC DF_disk_write
        PUBLIC dfStatus
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\FILESYSTEM\dataflash_diskio.c
//    1 /*__________________________________________________________________________________
//    2 |	Dextro soluções tecnológicas.
//    3 |       
//    4 |       Itajaí/SC
//    5 |       www.dextro-st.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Dextro and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Dextro
//   10 |       or its distributors.
//   11 |
//   12 |       Este código é propriedade da Dextro e não pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       Dextro ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :  flash_diskio.c
//   18 |       Descrição          :  Camada de acesso à memória flash
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  11/07/2017
//   22 |
//   23 |       Revisões           :  1.0
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 /**********************************************************************************
//   29 *       Includes
//   30 **********************************************************************************/
//   31 #include <stdio.h>
//   32 #include <stdlib.h>
//   33 #include <string.h>
//   34 #include "diskio.h"
//   35 #include "integer.h"
//   36 #include "..\..\includes.h"
//   37 
//   38 /**********************************************************************************
//   39 *       Definições
//   40 **********************************************************************************/
//   41 #define DF_SECTOR_SIZE                  4096
//   42 
//   43 /**********************************************************************************
//   44 *       Variaveis locais
//   45 **********************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   46 DSTATUS dfStatus=STA_NOINIT;
dfStatus:
        DATA
        DC8 1
//   47 
//   48 /**********************************************************************************
//   49 *       Funções locais
//   50 **********************************************************************************/
//   51 
//   52 
//   53 /**********************************************************************************
//   54 *       Implementação das funções
//   55 **********************************************************************************/
//   56 
//   57 /***********************************************************************************
//   58 *   Descrição   :   Inicialização dos drives do sistema
//   59 *   Parametros  :   (unsigned char) número do drive
//   60 *   Retorno     :   (DSTATUS) 
//   61 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function DF_disk_initialize
          CFI NoCalls
        THUMB
//   62 unsigned int DF_disk_initialize(void){
//   63     
//   64   dfStatus |= STA_NOINIT;    
DF_disk_initialize:
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
//   65   return STA_NOINIT;
        MOVS     R0,#+1
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   66    //ToDo: Inserir verificação do flag de proteção de escrita
//   67 }
//   68 /***********************************************************************************
//   69 *     Descrição   :   Lê o status do disco passado no parametro
//   70 *     Parametros  :   (unsigned char) número do drive
//   71 *     Retorno     :   nenhum
//   72 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function DF_disk_status
          CFI NoCalls
        THUMB
//   73 DSTATUS DF_disk_status (void){
//   74 
//   75   return dfStatus;
DF_disk_status:
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   76 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     dfStatus
//   77 /***********************************************************************************
//   78 *     Descrição   :   Lê um setor de uma das unidades de disco
//   79 *     Parametros  :   (unsigned char) drive
//   80 *                     (unsigned char*) buffer
//   81 *                     (unsigned long int) setor
//   82 *                     (unsigned char) tamanho do bloco lido
//   83 *     Retorno     :   (DRESULT)
//   84 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function DF_disk_read
        THUMB
//   85 DRESULT DF_disk_read (unsigned char *buffer,DWORD sector,unsigned char count){
DF_disk_read:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        MOVS     R3,R1
//   86   
//   87   MEMORYWRAPPER_readBytes(sector*DF_SECTOR_SIZE,buffer,count);
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R0
        MOV      R0,#+4096
        MUL      R0,R0,R3
          CFI FunCall MEMORYWRAPPER_readBytes
        BL       MEMORYWRAPPER_readBytes
//   88   return RES_OK;  
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock2
//   89 }
//   90 /***********************************************************************************
//   91 *     Descrição   :   Escreve em um setor de um determinado disco
//   92 *     Parametros  :   (unsigned char) drive
//   93 *                     (unsigned char*) buffer
//   94 *                     (unsigned int) número do setor
//   95 *                     (unsigned char) tamanho do bloco escrito
//   96 *     Retorno     :   (DRESULT)
//   97 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function DF_disk_write
        THUMB
//   98 DRESULT DF_disk_write(unsigned char *buff,DWORD sector,unsigned char byte){
DF_disk_write:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        MOVS     R3,R1
//   99 
//  100   MEMORYWRAPPER_writeBytes(sector*DF_SECTOR_SIZE,buff,byte);
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R0
        MOV      R0,#+4096
        MUL      R0,R0,R3
          CFI FunCall MEMORYWRAPPER_writeBytes
        BL       MEMORYWRAPPER_writeBytes
//  101   return RES_OK;  
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock3
//  102 }
//  103 /***********************************************************************************
//  104 *   Descrição   :   Controle de funções específicas do disco
//  105 *   Parametros  :   (unsigned char) drive
//  106 *                   (unsigned char) comando
//  107 *                   (void*) ponteiro para a estrutura de controle do 
//  108 *                   comando que será executado
//  109 *   Retorno     :   nenhum
//  110 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function DF_disk_ioctl
          CFI NoCalls
        THUMB
//  111 DRESULT DF_disk_ioctl(unsigned char ctrl,void *buff){
//  112 
//  113   if(ctrl==GET_BLOCK_SIZE)
DF_disk_ioctl:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??DF_disk_ioctl_0
//  114     *(unsigned int*)buff = DF_SECTOR_SIZE;
        MOV      R0,#+4096
        STR      R0,[R1, #+0]
//  115   
//  116   return RES_ERROR;
??DF_disk_ioctl_0:
        MOVS     R0,#+1
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  117 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  118 /**********************************************************************************
//  119 *       Fim do arquivo
//  120 **********************************************************************************/
// 
//  1 byte  in section .data
// 90 bytes in section .text
// 
// 90 bytes of CODE memory
//  1 byte  of DATA memory
//
//Errors: none
//Warnings: none
