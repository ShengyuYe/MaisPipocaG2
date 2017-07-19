///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     19/Jul/2017  15:04:22 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\CCTALK\cctalk.c                 /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\CCTALK\cctalk.c -lC             /
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
//                    pocaG2\SOFTWARE\Debug\List\cctalk.s                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME cctalk

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN UART_init
        EXTERN __aeabi_memcpy4
        EXTERN vTaskDelay

        PUBLIC CCTAK_msg_to_string
        PUBLIC CCTALK_bufferRxd
        PUBLIC CCTALK_bufferTxd
        PUBLIC CCTALK_bytesEnviados
        PUBLIC CCTALK_bytesParaEnviar
        PUBLIC CCTALK_calculaCRC
        PUBLIC CCTALK_enviaPacote
        PUBLIC CCTALK_enviaPacoteSerial
        PUBLIC CCTALK_ini
        PUBLIC CCTALK_irqUart
        PUBLIC CCTALK_leFilaEventos
        PUBLIC CCTALK_recebidos
        PUBLIC CCTALK_rotacionaValidador
        PUBLIC CCTALK_setBitsHabilitacaoCanal
        PUBLIC CCTALK_setFlagHabilitacaoGeral
        PUBLIC CCTALK_tick
        PUBLIC U0RBRTHR
        PUBLIC _A_CLRPEND0
        PUBLIC _A_U0FCR
        PUBLIC _A_U0LSR
        PUBLIC crc_ccitt_lockup
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\CCTALK\cctalk.c
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
//   17 |       Arquivo            :  cctalk.c
//   18 |       Descrição          :  Biblioteca do protocolo cctalk mestre
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  17/02/2015
//   22 |
//   23 |       Revisões           :  1.0.0.0
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 
//   29 /***********************************************************************************
//   30 *       Includes
//   31 ***********************************************************************************/
//   32 #include <stdio.h>
//   33 #include <stdlib.h>
//   34 #include <nxp\iolpc1768.h>

        ASEGN `.noinit`:DATA:NOROOT,0e000e280H
        SECTION_GROUP _A_CLRPEND0
// __absolute union <unnamed> volatile _A_CLRPEND0
_A_CLRPEND0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04000c000H
        SECTION_GROUP U0RBRTHR
// __absolute unsigned char volatile U0RBRTHR
U0RBRTHR:
        DS8 1

        ASEGN `.noinit`:DATA:NOROOT,04000c008H
        SECTION_GROUP _A_U0FCR
// __absolute union <unnamed> volatile _A_U0FCR
_A_U0FCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04000c014H
        SECTION_GROUP _A_U0LSR
// __absolute union <unnamed> const volatile _A_U0LSR
_A_U0LSR:
        DS8 1
//   35 #include "cctalk.h"
//   36 #include "..\..\includes.h"
//   37 /***********************************************************************************
//   38 *       Definições locais
//   39 ***********************************************************************************/
//   40 #define TAM_BUF_OUT                             64
//   41 #define TAM_BUF_IN                              64        
//   42 
//   43 /***********************************************************************************
//   44 *       Constantes
//   45 ***********************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   46 unsigned short int crc_ccitt_lockup[256]={
crc_ccitt_lockup:
        DATA
        DC16 0, 4129, 8258, 12387, 16516, 20645, 24774, 28903, 33032, 37161
        DC16 41290, 45419, 49548, 53677, 57806, 61935, 4657, 528, 12915, 8786
        DC16 21173, 17044, 29431, 25302, 37689, 33560, 45947, 41818, 54205
        DC16 50076, 62463, 58334, 9314, 13379, 1056, 5121, 25830, 29895, 17572
        DC16 21637, 42346, 46411, 34088, 38153, 58862, 62927, 50604, 54669
        DC16 13907, 9842, 5649, 1584, 30423, 26358, 22165, 18100, 46939, 42874
        DC16 38681, 34616, 63455, 59390, 55197, 51132, 18628, 22757, 26758
        DC16 30887, 2112, 6241, 10242, 14371, 51660, 55789, 59790, 63919, 35144
        DC16 39273, 43274, 47403, 23285, 19156, 31415, 27286, 6769, 2640, 14899
        DC16 10770, 56317, 52188, 64447, 60318, 39801, 35672, 47931, 43802
        DC16 27814, 31879, 19684, 23749, 11298, 15363, 3168, 7233, 60846, 64911
        DC16 52716, 56781, 44330, 48395, 36200, 40265, 32407, 28342, 24277
        DC16 20212, 15891, 11826, 7761, 3696, 65439, 61374, 57309, 53244, 48923
        DC16 44858, 40793, 36728, 37256, 33193, 45514, 41451, 53516, 49453
        DC16 61774, 57711, 4224, 161, 12482, 8419, 20484, 16421, 28742, 24679
        DC16 33721, 37784, 41979, 46042, 49981, 54044, 58239, 62302, 689, 4752
        DC16 8947, 13010, 16949, 21012, 25207, 29270, 46570, 42443, 38312
        DC16 34185, 62830, 58703, 54572, 50445, 13538, 9411, 5280, 1153, 29798
        DC16 25671, 21540, 17413, 42971, 47098, 34713, 38840, 59231, 63358
        DC16 50973, 55100, 9939, 14066, 1681, 5808, 26199, 30326, 17941, 22068
        DC16 55628, 51565, 63758, 59695, 39368, 35305, 47498, 43435, 22596
        DC16 18533, 30726, 26663, 6336, 2273, 14466, 10403, 52093, 56156, 60223
        DC16 64286, 35833, 39896, 43963, 48026, 19061, 23124, 27191, 31254
        DC16 2801, 6864, 10931, 14994, 64814, 60687, 56684, 52557, 48554, 44427
        DC16 40424, 36297, 31782, 27655, 23652, 19525, 15522, 11395, 7392, 3265
        DC16 61215, 65342, 53085, 57212, 44955, 49082, 36825, 40952, 28183
        DC16 32310, 20053, 24180, 11923, 16050, 3793, 7920
//   47   0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50A5, 0x60C6, 0x70E7,  
//   48   0x8108, 0x9129, 0xA14A, 0xB16B, 0xC18C, 0xD1AD, 0xE1CE, 0xF1EF,  
//   49   0x1231, 0x0210, 0x3273, 0x2252, 0x52B5, 0x4294, 0x72F7, 0x62D6,  
//   50   0x9339, 0x8318, 0xB37B, 0xA35A, 0xD3BD, 0xC39C, 0xF3FF, 0xE3DE,  
//   51   0x2462, 0x3443, 0x0420, 0x1401, 0x64E6, 0x74C7, 0x44A4, 0x5485,  
//   52   0xA56A, 0xB54B, 0x8528, 0x9509, 0xE5EE, 0xF5CF, 0xC5AC, 0xD58D,  
//   53   0x3653, 0x2672, 0x1611, 0x0630, 0x76D7, 0x66F6, 0x5695, 0x46B4,  
//   54   0xB75B, 0xA77A, 0x9719, 0x8738, 0xF7DF, 0xE7FE, 0xD79D, 0xC7BC,  
//   55   0x48C4, 0x58E5, 0x6886, 0x78A7, 0x0840, 0x1861, 0x2802, 0x3823,  
//   56   0xC9CC, 0xD9ED, 0xE98E, 0xF9AF, 0x8948, 0x9969, 0xA90A, 0xB92B,  
//   57   0x5AF5, 0x4AD4, 0x7AB7, 0x6A96, 0x1A71, 0x0A50, 0x3A33, 0x2A12,  
//   58   0xDBFD, 0xCBDC, 0xFBBF, 0xEB9E, 0x9B79, 0x8B58, 0xBB3B, 0xAB1A,  
//   59   0x6CA6, 0x7C87, 0x4CE4, 0x5CC5, 0x2C22, 0x3C03, 0x0C60, 0x1C41,  
//   60   0xEDAE, 0xFD8F, 0xCDEC, 0xDDCD, 0xAD2A, 0xBD0B, 0x8D68, 0x9D49,  
//   61   0x7E97, 0x6EB6, 0x5ED5, 0x4EF4, 0x3E13, 0x2E32, 0x1E51, 0x0E70,  
//   62   0xFF9F, 0xEFBE, 0xDFDD, 0xCFFC, 0xBF1B, 0xAF3A, 0x9F59, 0x8F78,  
//   63   0x9188, 0x81A9, 0xB1CA, 0xA1EB, 0xD10C, 0xC12D, 0xF14E, 0xE16F,  
//   64   0x1080, 0x00A1, 0x30C2, 0x20E3, 0x5004, 0x4025, 0x7046, 0x6067,  
//   65   0x83B9, 0x9398, 0xA3FB, 0xB3DA, 0xC33D, 0xD31C, 0xE37F, 0xF35E,  
//   66   0x02B1, 0x1290, 0x22F3, 0x32D2, 0x4235, 0x5214, 0x6277, 0x7256,  
//   67   0xB5EA, 0xA5CB, 0x95A8, 0x8589, 0xF56E, 0xE54F, 0xD52C, 0xC50D,  
//   68   0x34E2, 0x24C3, 0x14A0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,  
//   69   0xA7DB, 0xB7FA, 0x8799, 0x97B8, 0xE75F, 0xF77E, 0xC71D, 0xD73C,  
//   70   0x26D3, 0x36F2, 0x0691, 0x16B0, 0x6657, 0x7676, 0x4615, 0x5634,  
//   71   0xD94C, 0xC96D, 0xF90E, 0xE92F, 0x99C8, 0x89E9, 0xB98A, 0xA9AB,  
//   72   0x5844, 0x4865, 0x7806, 0x6827, 0x18C0, 0x08E1, 0x3882, 0x28A3,  
//   73   0xCB7D, 0xDB5C, 0xEB3F, 0xFB1E, 0x8BF9, 0x9BD8, 0xABBB, 0xBB9A,  
//   74   0x4A75, 0x5A54, 0x6A37, 0x7A16, 0x0AF1, 0x1AD0, 0x2AB3, 0x3A92,  
//   75   0xFD2E, 0xED0F, 0xDD6C, 0xCD4D, 0xBDAA, 0xAD8B, 0x9DE8, 0x8DC9,  
//   76   0x7C26, 0x6C07, 0x5C64, 0x4C45, 0x3CA2, 0x2C83, 0x1CE0, 0x0CC1,  
//   77   0xEF1F, 0xFF3E, 0xCF5D, 0xDF7C, 0xAF9B, 0xBFBA, 0x8FD9, 0x9FF8,  
//   78   0x6E17, 0x7E36, 0x4E55, 0x5E74, 0x2E93, 0x3EB2, 0x0ED1, 0x1EF0 
//   79 };
//   80 
//   81 /***********************************************************************************
//   82 *       Variaveis globais
//   83 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   84 unsigned char CCTALK_bufferTxd[TAM_BUF_OUT];
CCTALK_bufferTxd:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   85 unsigned char CCTALK_bufferRxd[TAM_BUF_IN];
CCTALK_bufferRxd:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   86 unsigned char CCTALK_bytesParaEnviar=0;
CCTALK_bytesParaEnviar:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   87 unsigned char CCTALK_bytesEnviados=0;
CCTALK_bytesEnviados:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   88 unsigned char CCTALK_recebidos=0;
CCTALK_recebidos:
        DS8 1
//   89 
//   90 /***********************************************************************************
//   91 *       Funções locais
//   92 ***********************************************************************************/
//   93 unsigned char CCTALK_enviaPacote(unsigned char*pacote,unsigned char tamanho,
//   94                                  unsigned char*recebido,unsigned short int *qtdRecebidos);
//   95 void CCTALK_enviaPacoteSerial(unsigned short int tamanho);
//   96 
//   97 /***********************************************************************************
//   98 *       Implementação das funções
//   99 ***********************************************************************************/
//  100 
//  101 /***********************************************************************************
//  102 *       Descrição       :       Inicialização da biblioteca
//  103 *       Parametros      :       nenhum
//  104 *       Retorno         :       nenhum
//  105 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function CCTALK_ini
        THUMB
//  106 void CCTALK_ini(void){
CCTALK_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  107 
//  108   UART_init(0,9600,NULL,NULL,NULL);  
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOV      R1,#+9600
        MOVS     R0,#+0
          CFI FunCall UART_init
        BL       UART_init
//  109 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//  110 /***********************************************************************************
//  111 *       Descrição       :      Faz o calculo do CRC
//  112 *       Parametros      :       (unsigned char*) ponteiro para o buffer
//  113 *                               (unsigned short int) offset
//  114 *                               (unsigned short int) tamanho do pacote
//  115 *       Retorno         :       (unsigned shor int) crc
//  116 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function CCTALK_calculaCRC
          CFI NoCalls
        THUMB
//  117 unsigned short int CCTALK_calculaCRC(unsigned char *pData,unsigned short int offset,
//  118                                      unsigned short int tamanho){
CCTALK_calculaCRC:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//  119   unsigned short int crc=0;
        MOVS     R3,#+0
//  120   
//  121   for(unsigned short int i=0;i<tamanho;i++)
        MOVS     R4,#+0
        B.N      ??CCTALK_calculaCRC_0
//  122     crc = (crc<<8) ^ crc_ccitt_lockup[(crc>>8) ^ pData[i+offset]];
??CCTALK_calculaCRC_1:
        MOVS     R5,R3
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R6,R1,R4
        LDRB     R6,[R6, R0]
        EORS     R5,R6,R5, ASR #+8
        LDR.N    R6,??DataTable4
        LDRH     R5,[R6, R5, LSL #+1]
        EORS     R3,R5,R3, LSL #+8
        ADDS     R4,R4,#+1
??CCTALK_calculaCRC_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R4,R2
        BCC.N    ??CCTALK_calculaCRC_1
//  123                                                                               
//  124   return crc;
        MOVS     R0,R3
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  125 }  
//  126 /***********************************************************************************
//  127 *       Descrição       :    Interrupção da uart 0
//  128 *       Parametrso      :     nenhum
//  129 *       Retorno         :     nenhum
//  130 ***********************************************************************************/  

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function CCTALK_irqUart
          CFI NoCalls
        THUMB
//  131 void CCTALK_irqUart(void){
//  132 
//  133   unsigned char dummy;
//  134   
//  135   switch(U0IIR_bit.IID){
CCTALK_irqUart:
        LDR.N    R0,??DataTable4_1  ;; 0x4000c008
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        ANDS     R0,R0,#0x7
        CMP      R0,#+1
        BEQ.N    ??CCTALK_irqUart_0
        CMP      R0,#+2
        BEQ.N    ??CCTALK_irqUart_1
        CMP      R0,#+3
        BEQ.N    ??CCTALK_irqUart_2
        CMP      R0,#+6
        BEQ.N    ??CCTALK_irqUart_3
        B.N      ??CCTALK_irqUart_4
//  136     case THRE:
//  137                if(CCTALK_bytesParaEnviar){
??CCTALK_irqUart_0:
        LDR.N    R0,??DataTable4_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??CCTALK_irqUart_5
//  138                  U0THR = CCTALK_bufferTxd[CCTALK_bytesEnviados++];
        LDR.N    R0,??DataTable4_3
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable4_4
        LDRB     R0,[R0, R1]
        LDR.N    R1,??DataTable4_5  ;; 0x4000c000
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable4_3
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable4_3
        STRB     R0,[R1, #+0]
//  139                  CCTALK_bytesParaEnviar--;
        LDR.N    R0,??DataTable4_2
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable4_2
        STRB     R0,[R1, #+0]
//  140                }
//  141                break; 
??CCTALK_irqUart_5:
        B.N      ??CCTALK_irqUart_4
//  142     case RDA : dummy = U0RBR;
??CCTALK_irqUart_1:
        LDR.N    R0,??DataTable4_5  ;; 0x4000c000
        LDRB     R0,[R0, #+0]
//  143                if(CCTALK_recebidos<(TAM_BUF_IN-1))
        LDR.N    R1,??DataTable4_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+63
        BGE.N    ??CCTALK_irqUart_6
//  144                  CCTALK_bufferRxd[CCTALK_recebidos++] = dummy;
        LDR.N    R1,??DataTable4_6
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable4_7
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable4_6
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable4_6
        STRB     R0,[R1, #+0]
//  145                
//  146                break;      
??CCTALK_irqUart_6:
        B.N      ??CCTALK_irqUart_4
//  147     case RLS : 
//  148                dummy = U0LSR;
??CCTALK_irqUart_2:
        LDR.N    R0,??DataTable4_8  ;; 0x4000c014
        LDRB     R0,[R0, #+0]
//  149                dummy = U0RBR;               
        LDR.N    R1,??DataTable4_5  ;; 0x4000c000
        LDRB     R1,[R1, #+0]
        MOVS     R0,R1
//  150                break;      
        B.N      ??CCTALK_irqUart_4
//  151     case CTI :
//  152                break;      
//  153   }
//  154   
//  155   //Apaga o flag de interrupção pendente
//  156   CLRPEND0 |= (0x01)<<5;    
??CCTALK_irqUart_3:
??CCTALK_irqUart_4:
        LDR.N    R0,??DataTable4_9  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable4_9  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  157 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
        REQUIRE U0RBRTHR
        REQUIRE _A_U0LSR
        REQUIRE _A_U0FCR
        REQUIRE _A_CLRPEND0
//  158 /***********************************************************************************
//  159 *       Descrição       :       Envia um pacote pelo canal serial
//  160 *       Parametros      :       (unsigned char) tamanho do pacote
//  161 *       Retorno         ;       nenhum
//  162 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function CCTALK_enviaPacoteSerial
          CFI NoCalls
        THUMB
//  163 void CCTALK_enviaPacoteSerial(unsigned short int tamanho){
//  164   
//  165   CCTALK_recebidos = 0;
CCTALK_enviaPacoteSerial:
        LDR.N    R1,??DataTable4_6
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
//  166   
//  167   CCTALK_bytesParaEnviar = tamanho-1;
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable4_2
        STRB     R0,[R1, #+0]
//  168   CCTALK_bytesEnviados = 1;
        LDR.N    R0,??DataTable4_3
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  169   U0THR = CCTALK_bufferTxd[0];    
        LDR.N    R0,??DataTable4_5  ;; 0x4000c000
        LDR.N    R1,??DataTable4_4
        LDRB     R1,[R1, #+0]
        STRB     R1,[R0, #+0]
//  170 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
        REQUIRE U0RBRTHR
//  171 /***********************************************************************************
//  172 *       Descrição       :       Tick de timer da biblioteca
//  173 *       Parametros      :       nenhum
//  174 *       Retorno         :       nenhum
//  175 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function CCTALK_tick
          CFI NoCalls
        THUMB
//  176 void CCTALK_tick(void){
//  177   
//  178   
//  179   
//  180   
//  181 }
CCTALK_tick:
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  182 /***********************************************************************************
//  183 *       Descrição       :       Envia um pacote pelo canal serial
//  184 *       Parametros      :       (unsigned char*) pacote
//  185 *                               (unsigned char*) pacote recebido
//  186 *       Retorno         :       (unsigned char) maior do que zero se receber
//  187 *                                               resposta com CRC válido
//  188 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function CCTALK_enviaPacote
        THUMB
//  189 unsigned char CCTALK_enviaPacote(unsigned char*pacote,unsigned char tamanho,
//  190                                  unsigned char*recebido,unsigned short int *qtdRecebidos){
CCTALK_enviaPacote:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R4,R2
//  191   unsigned short int crc = CCTALK_calculaCRC(pacote, 0, tamanho);
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R2,R7
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,#+0
        MOVS     R0,R6
          CFI FunCall CCTALK_calculaCRC
        BL       CCTALK_calculaCRC
//  192   unsigned short int offset=tamanho+2;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R5,R7,#+2
//  193    
//  194   CCTALK_bufferTxd[0] = pacote[0];
        LDR.N    R1,??DataTable4_4
        LDRB     R2,[R6, #+0]
        STRB     R2,[R1, #+0]
//  195   CCTALK_bufferTxd[1] = pacote[1];
        LDR.N    R1,??DataTable4_4
        LDRB     R2,[R6, #+1]
        STRB     R2,[R1, #+1]
//  196   CCTALK_bufferTxd[2] = (unsigned char)crc;
        LDR.N    R1,??DataTable4_4
        STRB     R0,[R1, #+2]
//  197   CCTALK_bufferTxd[3] = pacote[2];
        LDR.N    R1,??DataTable4_4
        LDRB     R2,[R6, #+2]
        STRB     R2,[R1, #+3]
//  198 
//  199   for(unsigned short int i=0;i<pacote[1];i++)
        MOVS     R1,#+0
        B.N      ??CCTALK_enviaPacote_0
//  200     CCTALK_bufferTxd[4+i] = pacote[3+i];
??CCTALK_enviaPacote_1:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R2,R1,R6
        LDRB     R2,[R2, #+3]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R3,??DataTable4_4
        ADDS     R3,R1,R3
        STRB     R2,[R3, #+4]
        ADDS     R1,R1,#+1
??CCTALK_enviaPacote_0:
        LDRB     R2,[R6, #+1]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R1,R2
        BCC.N    ??CCTALK_enviaPacote_1
//  201 
//  202   CCTALK_bufferTxd[4 + pacote[1]] = (unsigned char)(crc>>8);
        LDRB     R1,[R6, #+1]
        LDR.N    R2,??DataTable4_4
        ADDS     R1,R1,R2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R1, #+4]
//  203   CCTALK_enviaPacoteSerial(tamanho+2);
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R0,R7,#+2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall CCTALK_enviaPacoteSerial
        BL       CCTALK_enviaPacoteSerial
        B.N      ??CCTALK_enviaPacote_2
//  204   
//  205   while(CCTALK_bytesParaEnviar)
//  206     vTaskDelay(1);
??CCTALK_enviaPacote_3:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??CCTALK_enviaPacote_2:
        LDR.N    R0,??DataTable4_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??CCTALK_enviaPacote_3
//  207   
//  208   vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  209   
//  210   unsigned short int timeout=2000;
        MOV      R6,#+2000
        B.N      ??CCTALK_enviaPacote_4
//  211   while(!CCTALK_recebidos && timeout--)
//  212     vTaskDelay(1);
??CCTALK_enviaPacote_5:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??CCTALK_enviaPacote_4:
        LDR.N    R0,??DataTable4_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??CCTALK_enviaPacote_6
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??CCTALK_enviaPacote_5
//  213  
//  214   if(CCTALK_recebidos)
??CCTALK_enviaPacote_6:
        LDR.N    R0,??DataTable4_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??CCTALK_enviaPacote_7
//  215     if(CCTALK_bufferRxd[offset+0]==1 && CCTALK_bufferRxd[offset+3]==0){
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable4_7
        LDRB     R0,[R5, R0]
        CMP      R0,#+1
        BNE.N    ??CCTALK_enviaPacote_7
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable4_7
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+3]
        CMP      R0,#+0
        BNE.N    ??CCTALK_enviaPacote_7
//  216       
//  217       unsigned short int crcRecebido = CCTALK_bufferRxd[CCTALK_recebidos-1]<<8 | CCTALK_bufferRxd[offset+2];
        LDR.N    R0,??DataTable4_6
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable4_7
        ADDS     R0,R0,R1
        LDRB     R0,[R0, #-1]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R1,??DataTable4_7
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+2]
        ORRS     R6,R1,R0, LSL #+8
//  218       
//  219       recebido[0] = CCTALK_bufferRxd[offset+0];
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable4_7
        LDRB     R0,[R5, R0]
        STRB     R0,[R4, #+0]
//  220       recebido[1] = CCTALK_bufferRxd[offset+1];
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable4_7
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        STRB     R0,[R4, #+1]
//  221       recebido[2] = CCTALK_bufferRxd[offset+3];
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable4_7
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+3]
        STRB     R0,[R4, #+2]
//  222       for(unsigned short int i=0;i<CCTALK_bufferRxd[1+offset];i++)
        MOVS     R0,#+0
        B.N      ??CCTALK_enviaPacote_8
//  223         recebido[3+i] = CCTALK_bufferRxd[offset+4+i];
??CCTALK_enviaPacote_9:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADDS     R1,R0,R5
        LDR.N    R2,??DataTable4_7
        ADDS     R1,R1,R2
        LDRB     R1,[R1, #+4]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADDS     R2,R0,R4
        STRB     R1,[R2, #+3]
        ADDS     R0,R0,#+1
??CCTALK_enviaPacote_8:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R1,??DataTable4_7
        ADDS     R1,R5,R1
        LDRB     R1,[R1, #+1]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R0,R1
        BCC.N    ??CCTALK_enviaPacote_9
//  224       
//  225       if(CCTALK_calculaCRC(recebido,0,CCTALK_bufferRxd[1+offset]+3)==crcRecebido)
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable4_7
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        ADDS     R2,R0,#+3
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall CCTALK_calculaCRC
        BL       CCTALK_calculaCRC
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R0,R6
        BNE.N    ??CCTALK_enviaPacote_7
//  226         return 255;           
        MOVS     R0,#+255
        B.N      ??CCTALK_enviaPacote_10
//  227     }
//  228   
//  229   return 0; 
??CCTALK_enviaPacote_7:
        MOVS     R0,#+0
??CCTALK_enviaPacote_10:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock5
//  230 }
//  231 /***********************************************************************************
//  232 *       Descrição       :       Lê a fila de eventos de pagamento
//  233 *       Parametros      :       (unsigned char) endereço do dispositivo
//  234 *                               (unsigned char*) quantidade de eventos
//  235 *                               (unsigned short int*) eventos
//  236 *       Retorno         :       (unsigned char) maior do que zero se conseguir
//  237 *                                               realizar a leitura
//  238 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function CCTALK_leFilaEventos
        THUMB
//  239 unsigned char CCTALK_leFilaEventos(unsigned char endereco,unsigned char*qtdEventos,
//  240                                    unsigned short int *eventos){
CCTALK_leFilaEventos:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+36
          CFI CFA R13+48
        MOVS     R5,R1
        MOVS     R4,R2
//  241   unsigned char buffer[10];
//  242   unsigned char resposta[20];
//  243   unsigned short int recebidos;
//  244   
//  245   buffer[0] = endereco;
        STRB     R0,[SP, #+4]
//  246   buffer[1] = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  247   buffer[2] = (unsigned char)READ_BUFFERED_BILL_EV;
        MOVS     R0,#+159
        STRB     R0,[SP, #+6]
//  248   
//  249   if(CCTALK_enviaPacote(buffer,3,resposta,&recebidos)){
        ADD      R3,SP,#+0
        ADD      R2,SP,#+16
        MOVS     R1,#+3
        ADD      R0,SP,#+4
          CFI FunCall CCTALK_enviaPacote
        BL       CCTALK_enviaPacote
        CMP      R0,#+0
        BEQ.N    ??CCTALK_leFilaEventos_0
//  250     
//  251     *qtdEventos = resposta[3];
        LDRB     R0,[SP, #+19]
        STRB     R0,[R5, #+0]
//  252     
//  253     for(unsigned char i=0,j=0;i<5;i++,j+=2)      
        MOVS     R0,#+0
        MOVS     R1,#+0
        B.N      ??CCTALK_leFilaEventos_1
//  254       eventos[i] = resposta[5+j]<<8 | resposta[4+j];    
??CCTALK_leFilaEventos_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R2,SP,#+16
        ADDS     R2,R1,R2
        LDRB     R2,[R2, #+5]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADD      R3,SP,#+16
        ADDS     R3,R1,R3
        LDRB     R3,[R3, #+4]
        ORRS     R2,R3,R2, LSL #+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRH     R2,[R4, R0, LSL #+1]
        ADDS     R0,R0,#+1
        ADDS     R1,R1,#+2
??CCTALK_leFilaEventos_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BLT.N    ??CCTALK_leFilaEventos_2
//  255     
//  256     return 255;
        MOVS     R0,#+255
        B.N      ??CCTALK_leFilaEventos_3
//  257   }   
//  258   
//  259   return 0;                                     
??CCTALK_leFilaEventos_0:
        MOVS     R0,#+0
??CCTALK_leFilaEventos_3:
        ADD      SP,SP,#+36
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock6
//  260 }
//  261 /***********************************************************************************
//  262 *       Descrição       :       Puxa o dinheiro para dentro do cofre
//  263 *       Parametros      :       (unsigned char) endereço do dispositivo
//  264 *       Retorno         :       (unsigned char) maior do que zero se 
//  265 *                                               obter sucesso na operação
//  266 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function CCTALK_rotacionaValidador
        THUMB
//  267 unsigned char CCTALK_rotacionaValidador(unsigned char endereco){
CCTALK_rotacionaValidador:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  268   unsigned char buffer[4];
//  269   unsigned char resposta[5];
//  270   unsigned short int recebidos;  
//  271   
//  272   buffer[0] = endereco;
        STRB     R0,[SP, #+0]
//  273   buffer[1] = 1;
        MOVS     R0,#+1
        STRB     R0,[SP, #+1]
//  274   buffer[2] = (unsigned char)ROUTE_BILL;
        MOVS     R0,#+154
        STRB     R0,[SP, #+2]
//  275   buffer[3] = 1;
        MOVS     R0,#+1
        STRB     R0,[SP, #+3]
//  276   
//  277   if(CCTALK_enviaPacote(buffer,4,resposta,&recebidos)){
        ADD      R3,SP,#+4
        ADD      R2,SP,#+8
        MOVS     R1,#+4
        ADD      R0,SP,#+0
          CFI FunCall CCTALK_enviaPacote
        BL       CCTALK_enviaPacote
        CMP      R0,#+0
        BEQ.N    ??CCTALK_rotacionaValidador_0
//  278     
//  279      return 255; 
        MOVS     R0,#+255
        B.N      ??CCTALK_rotacionaValidador_1
//  280   } 
//  281   
//  282   return 0x00;
??CCTALK_rotacionaValidador_0:
        MOVS     R0,#+0
??CCTALK_rotacionaValidador_1:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock7
//  283 }
//  284 /***********************************************************************************
//  285 *       Descrição       :       Escreve no registrador de habilitação (inhibit)
//  286 *       Parametros      :       (unsigned char) endereço do dispositivo
//  287 *                               (unsigned short int) dados
//  288 *       Retorno         :       (unsigned char) maior do que zero se conseguir
//  289 *                                               realizar a leitura
//  290 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function CCTALK_setBitsHabilitacaoCanal
        THUMB
//  291 unsigned char CCTALK_setBitsHabilitacaoCanal(unsigned char endereco,
//  292                                              unsigned short int mascara){
CCTALK_setBitsHabilitacaoCanal:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  293   unsigned char buffer[5];                                             
//  294   unsigned char resposta[5];
//  295   unsigned short int recebidos;
//  296   
//  297   buffer[0] = endereco;
        STRB     R0,[SP, #+0]
//  298   buffer[1] = 2;
        MOVS     R0,#+2
        STRB     R0,[SP, #+1]
//  299   buffer[2] = (unsigned char)SET_INHIBITS;
        MOVS     R0,#+231
        STRB     R0,[SP, #+2]
//  300   buffer[3] = mascara;
        MOVS     R0,R1
        STRB     R0,[SP, #+3]
//  301   buffer[4] = mascara>>8;
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R0,R1,#+8
        STRB     R0,[SP, #+4]
//  302   
//  303   if(CCTALK_enviaPacote(buffer,5,resposta,&recebidos)){
        ADD      R3,SP,#+8
        ADD      R2,SP,#+12
        MOVS     R1,#+5
        ADD      R0,SP,#+0
          CFI FunCall CCTALK_enviaPacote
        BL       CCTALK_enviaPacote
        CMP      R0,#+0
        BEQ.N    ??CCTALK_setBitsHabilitacaoCanal_0
//  304     
//  305       
//  306     return 255;
        MOVS     R0,#+255
        B.N      ??CCTALK_setBitsHabilitacaoCanal_1
//  307   }           
//  308   
//  309   return 0x00;
??CCTALK_setBitsHabilitacaoCanal_0:
        MOVS     R0,#+0
??CCTALK_setBitsHabilitacaoCanal_1:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock8
//  310 }
//  311 /***********************************************************************************
//  312 *       Descrição       :       Habilitação geral do aceitador
//  313 *       Parametros      :       (unsigned char) endereço do dispositivo
//  314 *                               (unsigned char) flag de habilitação geral
//  315 *       Retorno         :       (unsigned char) maior do que zero
//  316 *                                               se conseguir obter resposta
//  317 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function CCTALK_setFlagHabilitacaoGeral
        THUMB
//  318 unsigned char CCTALK_setFlagHabilitacaoGeral(unsigned char endereco,
//  319                                              unsigned char flagBloqueio){
CCTALK_setFlagHabilitacaoGeral:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  320   unsigned char buffer[4];
//  321   unsigned char resposta[5];
//  322   unsigned short int recebidos;
//  323   
//  324   buffer[0] = endereco;
        STRB     R0,[SP, #+0]
//  325   buffer[1] = 1;
        MOVS     R0,#+1
        STRB     R0,[SP, #+1]
//  326   buffer[2] = (unsigned char)SET_MASTER_INHIBIT;
        MOVS     R0,#+228
        STRB     R0,[SP, #+2]
//  327   buffer[3] = flagBloqueio;
        STRB     R1,[SP, #+3]
//  328   
//  329   if(CCTALK_enviaPacote(buffer,4,resposta,&recebidos)){
        ADD      R3,SP,#+4
        ADD      R2,SP,#+8
        MOVS     R1,#+4
        ADD      R0,SP,#+0
          CFI FunCall CCTALK_enviaPacote
        BL       CCTALK_enviaPacote
        CMP      R0,#+0
        BEQ.N    ??CCTALK_setFlagHabilitacaoGeral_0
//  330     
//  331     
//  332     return 255; 
        MOVS     R0,#+255
        B.N      ??CCTALK_setFlagHabilitacaoGeral_1
//  333   }
//  334                                                
//  335   return 0;                                              
??CCTALK_setFlagHabilitacaoGeral_0:
        MOVS     R0,#+0
??CCTALK_setFlagHabilitacaoGeral_1:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock9
//  336 }
//  337 /***********************************************************************************
//  338 *       Descrição       :       Converte a enumeração das mensagens
//  339 *                               do noteiro para string
//  340 *       Parametros      :       (CCTALK_BILL_EVENTS) mensagem
//  341 *       Retorno         :       nenhum
//  342 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function CCTAK_msg_to_string
        THUMB
//  343 char* CCTAK_msg_to_string(CCTALK_BILL_EVENTS msg){        
CCTAK_msg_to_string:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+88
          CFI CFA R13+96
        MOVS     R4,R0
//  344   const char *msg_bv20[]={
//  345     "BILL_VALIDATED_OK\n\r",
//  346     "BILL_VALIDATED_OK_AND_SCROW\n\r",
//  347     "MASTER_INHIBIT_ACTIVE\n\r",
//  348     "BILL_RETURNED_FROM_ESCROW\n\r",
//  349     "INVALID_BILL_VALIDATION\n\r",
//  350     "INVALID_BILL_TRANSPORTATION\n\r",
//  351     "INHIBIT_BILL_SERIAL\n\r",
//  352     "INHIBIT_BILL_DIPSWITCH\n\r",
//  353     "BILL_JAMMED_IN_TRANSPORT\n\r",
//  354     "BILL_JAMMED_IN_BACKWARDS\n\r",
//  355     "BILL_TAMPER\n\r",
//  356     "STACKER_OK\n\r",
//  357     "STACKER_INVERTED\n\r",
//  358     "STACKER_FAULTY\n\r",
//  359     "STACKER_FULL\n\r",
//  360     "STACKER_JAMMED\n\r",
//  361     "BILL_JAMMED_IN_TRANSPORT_SAFE\n\r",
//  362     "OPTO_FRAUD_DETECTED\n\r",
//  363     "STRING_FRAUD_DETECTED\n\r",
//  364     "ANTI_STRING_MECHANISM_FAULTY\n\r",
//  365     "BARCODE_DETECTED\n\r",
//  366     "UNKNOWN_BILL_TYPE_STACKED\n\r"  
//  367   };
        ADD      R0,SP,#+0
        LDR.N    R1,??DataTable4_10
        MOVS     R2,#+88
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
//  368   
//  369   return (char*)msg_bv20[(unsigned char)msg];
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+0
        LDR      R0,[R0, R4, LSL #+2]
        ADD      SP,SP,#+88
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock10
//  370 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     crc_ccitt_lockup

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x4000c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     CCTALK_bytesParaEnviar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     CCTALK_bytesEnviados

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     CCTALK_bufferTxd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x4000c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     CCTALK_recebidos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     CCTALK_bufferRxd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     0x4000c014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     `?<Constant {&"BILL_VALIDATED_OK\\n\\r", &"BILL_V`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BILL_VALIDATED_OK\\n\\r">`:
        DATA
        DC8 "BILL_VALIDATED_OK\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BILL_VALIDATED_OK_AND...">`:
        DATA
        DC8 "BILL_VALIDATED_OK_AND_SCROW\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MASTER_INHIBIT_ACTIVE\\n\\r">`:
        DATA
        DC8 "MASTER_INHIBIT_ACTIVE\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BILL_RETURNED_FROM_ES...">`:
        DATA
        DC8 "BILL_RETURNED_FROM_ESCROW\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "INVALID_BILL_VALIDATI...">`:
        DATA
        DC8 "INVALID_BILL_VALIDATION\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "INVALID_BILL_TRANSPOR...">`:
        DATA
        DC8 "INVALID_BILL_TRANSPORTATION\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "INHIBIT_BILL_SERIAL\\n\\r">`:
        DATA
        DC8 "INHIBIT_BILL_SERIAL\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "INHIBIT_BILL_DIPSWITCH\\n\\r">`:
        DATA
        DC8 "INHIBIT_BILL_DIPSWITCH\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BILL_JAMMED_IN_TRANSP...">`:
        DATA
        DC8 "BILL_JAMMED_IN_TRANSPORT\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BILL_JAMMED_IN_BACKWA...">`:
        DATA
        DC8 "BILL_JAMMED_IN_BACKWARDS\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BILL_TAMPER\\n\\r">`:
        DATA
        DC8 "BILL_TAMPER\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "STACKER_OK\\n\\r">`:
        DATA
        DC8 "STACKER_OK\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "STACKER_INVERTED\\n\\r">`:
        DATA
        DC8 "STACKER_INVERTED\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "STACKER_FAULTY\\n\\r">`:
        DATA
        DC8 "STACKER_FAULTY\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "STACKER_FULL\\n\\r">`:
        DATA
        DC8 "STACKER_FULL\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "STACKER_JAMMED\\n\\r">`:
        DATA
        DC8 "STACKER_JAMMED\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BILL_JAMMED_IN_TRANSP...">_1`:
        DATA
        DC8 "BILL_JAMMED_IN_TRANSPORT_SAFE\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "OPTO_FRAUD_DETECTED\\n\\r">`:
        DATA
        DC8 "OPTO_FRAUD_DETECTED\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "STRING_FRAUD_DETECTED\\n\\r">`:
        DATA
        DC8 "STRING_FRAUD_DETECTED\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ANTI_STRING_MECHANISM...">`:
        DATA
        DC8 "ANTI_STRING_MECHANISM_FAULTY\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "BARCODE_DETECTED\\n\\r">`:
        DATA
        DC8 "BARCODE_DETECTED\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "UNKNOWN_BILL_TYPE_STA...">`:
        DATA
        DC8 "UNKNOWN_BILL_TYPE_STACKED\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {&"BILL_VALIDATED_OK\\n\\r", &"BILL_V`:
        DATA
        DC32 `?<Constant "BILL_VALIDATED_OK\\n\\r">`
        DC32 `?<Constant "BILL_VALIDATED_OK_AND...">`
        DC32 `?<Constant "MASTER_INHIBIT_ACTIVE\\n\\r">`
        DC32 `?<Constant "BILL_RETURNED_FROM_ES...">`
        DC32 `?<Constant "INVALID_BILL_VALIDATI...">`
        DC32 `?<Constant "INVALID_BILL_TRANSPOR...">`
        DC32 `?<Constant "INHIBIT_BILL_SERIAL\\n\\r">`
        DC32 `?<Constant "INHIBIT_BILL_DIPSWITCH\\n\\r">`
        DC32 `?<Constant "BILL_JAMMED_IN_TRANSP...">`
        DC32 `?<Constant "BILL_JAMMED_IN_BACKWA...">`
        DC32 `?<Constant "BILL_TAMPER\\n\\r">`
        DC32 `?<Constant "STACKER_OK\\n\\r">`
        DC32 `?<Constant "STACKER_INVERTED\\n\\r">`
        DC32 `?<Constant "STACKER_FAULTY\\n\\r">`
        DC32 `?<Constant "STACKER_FULL\\n\\r">`
        DC32 `?<Constant "STACKER_JAMMED\\n\\r">`
        DC32 `?<Constant "BILL_JAMMED_IN_TRANSP...">_1`
        DC32 `?<Constant "OPTO_FRAUD_DETECTED\\n\\r">`
        DC32 `?<Constant "STRING_FRAUD_DETECTED\\n\\r">`
        DC32 `?<Constant "ANTI_STRING_MECHANISM...">`
        DC32 `?<Constant "BARCODE_DETECTED\\n\\r">`
        DC32 `?<Constant "UNKNOWN_BILL_TYPE_STA...">`

        END
//  371 /***********************************************************************************
//  372 *       Fim do arquivo
//  373 ***********************************************************************************/
//  374 
//  375 
// 
// 131 bytes in section .bss
// 512 bytes in section .data
//  10 bytes in section .noinit (abs)
// 628 bytes in section .rodata
// 872 bytes in section .text
// 
// 872 bytes of CODE  memory
// 628 bytes of CONST memory
// 643 bytes of DATA  memory (+ 10 bytes shared)
//
//Errors: none
//Warnings: none
