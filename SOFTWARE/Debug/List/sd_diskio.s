///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     06/Jul/2017  16:40:36 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\FILESYSTEM\sd_diskio.c          /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\FILESYSTEM\sd_diskio.c -lC      /
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
//                    pocaG2\SOFTWARE\Debug\List\sd_diskio.s                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME sd_diskio

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN SD_Init
        EXTERN SD_ReadSector
        EXTERN SD_WriteSector

        PUBLIC SD_disk_initialize
        PUBLIC SD_disk_ioctl
        PUBLIC SD_disk_read
        PUBLIC SD_disk_status
        PUBLIC SD_disk_write
        PUBLIC sdStatus
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\FILESYSTEM\sd_diskio.c
//    1 /*__________________________________________________________________________________
//    2 |	    Chave Digital Tecnologia Eletronica Ltda. 
//    3 |       
//    4 |       Balneário Camboriú - SC
//    5 |       www.chavedigital.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Chave Digital and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Chave Digital
//   10 |       or its distributors.
//   11 |
//   12 |       Este código é propriedade da Chave Digital e não pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       Chave Digital ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :  sd_diskio.c
//   18 |       Descrição          :  Funções para implementação do driver
//   19 |                             FAT no SDCARD
//   20 | 
//   21 |       Autor              :  Marcos Aquino
//   22 |       Data criação       :  01/08/2011
//   23 |
//   24 |       Revisões           :  1.0
//   25 |
//   26 |
//   27 | __________________________________________________________________________________
//   28 */
//   29 /***********************************************************************************
//   30 *		Includes
//   31 ***********************************************************************************/
//   32 #include <nxp\iolpc1768.h>
//   33 #include "diskio.h"
//   34 #include "integer.h"
//   35 #include "..\sd card\sdcard.h"
//   36 #include "sd_diskio.h"
//   37 
//   38 /***********************************************************************************
//   39 *		Definições com constantes utilizadas no programa
//   40 ***********************************************************************************/ 
//   41 
//   42 
//   43 
//   44 /***********************************************************************************
//   45 *		Enumerações
//   46 ***********************************************************************************/
//   47 
//   48 
//   49 /***********************************************************************************
//   50 *		Estruturas
//   51 ***********************************************************************************/
//   52 
//   53 
//   54 /***********************************************************************************
//   55 *		Uniões
//   56 ***********************************************************************************/
//   57 
//   58 
//   59 /***********************************************************************************
//   60 *		Constantes
//   61 ***********************************************************************************/
//   62 
//   63 
//   64 /***********************************************************************************
//   65 *		Variaveis locais
//   66 ***********************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   67 DSTATUS sdStatus=STA_NOINIT;
sdStatus:
        DATA
        DC8 1
//   68 
//   69 /***********************************************************************************
//   70 *		Funções locais
//   71 ***********************************************************************************/
//   72  
//   73 /***********************************************************************************
//   74 *		Implementação
//   75 ***********************************************************************************/
//   76 
//   77 /***********************************************************************************
//   78 *   Descrição   :   Inicialização dos drives do sistema
//   79 *   Parametros  :   (unsigned char) número do drive
//   80 *   Retorno     :   (DSTATUS) 
//   81 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SD_disk_initialize
        THUMB
//   82 unsigned int SD_disk_initialize(void){
SD_disk_initialize:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   83   
//   84   if( SD_Init()){
          CFI FunCall SD_Init
        BL       SD_Init
        CMP      R0,#+0
        BEQ.N    ??SD_disk_initialize_0
//   85      sdStatus &= ~STA_NOINIT;
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFE
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
//   86      return 0;
        MOVS     R0,#+0
        B.N      ??SD_disk_initialize_1
//   87   }
//   88   
//   89   sdStatus |= STA_NOINIT;    
??SD_disk_initialize_0:
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
//   90   return STA_NOINIT;
        MOVS     R0,#+1
??SD_disk_initialize_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock0
//   91    //ToDo: Inserir verificação do flag de proteção de escrita
//   92 }
//   93 /***********************************************************************************
//   94 *     Descrição   :   Lê o status do disco passado no parametro
//   95 *     Parametros  :   (unsigned char) número do drive
//   96 *     Retorno     :   nenhum
//   97 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SD_disk_status
          CFI NoCalls
        THUMB
//   98 DSTATUS SD_disk_status (void){
//   99 
//  100   return sdStatus;
SD_disk_status:
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  101 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     sdStatus
//  102 /***********************************************************************************
//  103 *     Descrição   :   Lê um setor de uma das unidades de disco
//  104 *     Parametros  :   (unsigned char) drive
//  105 *                     (unsigned char*) buffer
//  106 *                     (unsigned long int) setor
//  107 *                     (unsigned char) tamanho do bloco lido
//  108 *     Retorno     :   (DRESULT)
//  109 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SD_disk_read
        THUMB
//  110 DRESULT SD_disk_read (unsigned char *buffer,DWORD sector,unsigned char count){
SD_disk_read:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        MOVS     R3,R1
//  111 
//  112   if(SD_ReadSector(sector,buffer,count))
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R0
        MOVS     R0,R3
          CFI FunCall SD_ReadSector
        BL       SD_ReadSector
        CMP      R0,#+0
        BEQ.N    ??SD_disk_read_0
//  113     return RES_OK;  
        MOVS     R0,#+0
        B.N      ??SD_disk_read_1
//  114   
//  115   return RES_ERROR;  
??SD_disk_read_0:
        MOVS     R0,#+1
??SD_disk_read_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock2
//  116 }
//  117 /***********************************************************************************
//  118 *     Descrição   :   Escreve em um setor de um determinado disco
//  119 *     Parametros  :   (unsigned char) drive
//  120 *                     (unsigned char*) buffer
//  121 *                     (unsigned int) número do setor
//  122 *                     (unsigned char) tamanho do bloco escrito
//  123 *     Retorno     :   (DRESULT)
//  124 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SD_disk_write
        THUMB
//  125 DRESULT SD_disk_write(unsigned char *buff,DWORD sector,unsigned char byte){
SD_disk_write:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        MOVS     R3,R1
//  126 
//  127   if(SD_WriteSector(sector,buff,byte))
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R0
        MOVS     R0,R3
          CFI FunCall SD_WriteSector
        BL       SD_WriteSector
        CMP      R0,#+0
        BEQ.N    ??SD_disk_write_0
//  128     return RES_OK;
        MOVS     R0,#+0
        B.N      ??SD_disk_write_1
//  129   
//  130   return RES_ERROR;    
??SD_disk_write_0:
        MOVS     R0,#+1
??SD_disk_write_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock3
//  131 }
//  132 /***********************************************************************************
//  133 *   Descrição   :   Controle de funções específicas do disco
//  134 *   Parametros  :   (unsigned char) drive
//  135 *                   (unsigned char) comando
//  136 *                   (void*) ponteiro para a estrutura de controle do 
//  137 *                   comando que será executado
//  138 *   Retorno     :   nenhum
//  139 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SD_disk_ioctl
          CFI NoCalls
        THUMB
//  140 DRESULT SD_disk_ioctl(unsigned char ctrl,void *buff){
//  141 
//  142   if(ctrl==GET_BLOCK_SIZE)
SD_disk_ioctl:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??SD_disk_ioctl_0
//  143     *(unsigned int*)buff = 512;
        MOV      R0,#+512
        STR      R0,[R1, #+0]
//  144   
//  145   return RES_ERROR;
??SD_disk_ioctl_0:
        MOVS     R0,#+1
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  146 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  147 /***********************************************************************************
//  148 *		Fim do arquivo
//  149 ***********************************************************************************/
// 
//   1 byte  in section .data
// 120 bytes in section .text
// 
// 120 bytes of CODE memory
//   1 byte  of DATA memory
//
//Errors: none
//Warnings: none
