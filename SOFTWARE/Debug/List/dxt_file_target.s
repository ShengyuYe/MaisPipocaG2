///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     07/Jul/2017  16:53:53 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\pegabo /
//                    la_g2\FIRMWARE\app\Protocolo\dxt_file_target.c          /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\pegabo /
//                    la_g2\FIRMWARE\app\Protocolo\dxt_file_target.c -lC      /
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
//                    pocaG2\SOFTWARE\Debug\List\dxt_file_target.s            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME dxt_file_target

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC DXF_read_block
        PUBLIC DXF_write_block
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\pegabola_g2\FIRMWARE\app\Protocolo\dxt_file_target.c
//    1 /*__________________________________________________________________________________
//    2 |	Dextro Solu��es Tecnol�gicas
//    3 |       
//    4 |       Itaja� - SC
//    5 |       www.dextro-st.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Dextro  and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Dextro 
//   10 |       or its distributors.
//   11 |
//   12 |       Este c�digo � propriedade da Dextro  e n�o pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       Dextro  ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :  dxt_file_target.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data cria��o       :  07/07/2017
//   21 |
//   22 |       Revis�es           :  001
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
//   34 
//   35 
//   36 /***********************************************************************************
//   37 *       Defini��es locais
//   38 ***********************************************************************************/
//   39 
//   40 
//   41 /***********************************************************************************
//   42 *       Constantes
//   43 ***********************************************************************************/
//   44 
//   45 
//   46 /***********************************************************************************
//   47 *       Variaveis locais
//   48 ***********************************************************************************/
//   49 
//   50 
//   51 /***********************************************************************************
//   52 *       Fun��es locais
//   53 ***********************************************************************************/
//   54 
//   55 /***********************************************************************************
//   56 *       Descri��o       :       Escreve um bloco na mem�ria de massa
//   57 *                               do sistema
//   58 *       Parametros      :       (unsigned int) address
//   59 *                               (unsigned int) size
//   60 *                               (unsigned char*) pData
//   61 *       Retorno         :       nenhum
//   62 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function DXF_write_block
          CFI NoCalls
        THUMB
//   63 void DXF_write_block(unsigned int address,unsigned int size,unsigned char *pData){
//   64   
//   65   
//   66   
//   67 }
DXF_write_block:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   68 /***********************************************************************************
//   69 *       Descri��o       :       L� um bloco na mem�ria de massa do sistema
//   70 *       Parametros      :       (unsigned int) address
//   71 *                               (unsigned int) size
//   72 *                               (unsigned char*)pData
//   73 *       Retorno         :       nenhum
//   74 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function DXF_read_block
          CFI NoCalls
        THUMB
//   75 void DXF_read_block(unsigned int address,unsigned int size,unsigned char *pData){
//   76   
//   77   
//   78   
//   79 }
DXF_read_block:
        BX       LR               ;; return
          CFI EndBlock cfiBlock1

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   80 /***********************************************************************************
//   81 *       Fim do arquivo
//   82 ***********************************************************************************/
// 
// 4 bytes in section .text
// 
// 4 bytes of CODE memory
//
//Errors: none
//Warnings: none
