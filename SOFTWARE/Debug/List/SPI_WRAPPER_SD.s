///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     17/Jul/2017  10:55:07 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\SDCARD\SPI_WRAPPER_SD.C         /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\SDCARD\SPI_WRAPPER_SD.C -lC     /
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
//                    pocaG2\SOFTWARE\Debug\List\SPI_WRAPPER_SD.s             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME SPI_WRAPPER_SD

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC SPI_CS_High
        PUBLIC SPI_CS_Low
        PUBLIC SPI_ConfigClockRate
        PUBLIC SPI_Init
        PUBLIC SPI_RecvByte
        PUBLIC SPI_SendByte
        PUBLIC _A_FIO0CLR
        PUBLIC _A_FIO0DIR
        PUBLIC _A_FIO0SET
        PUBLIC _A_PCLKSEL0
        PUBLIC _A_PCONP
        PUBLIC _A_PINSEL0
        PUBLIC _A_SSP1CPSR
        PUBLIC _A_SSP1CR0
        PUBLIC _A_SSP1CR1
        PUBLIC _A_SSP1DR
        PUBLIC _A_SSP1SR
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\SDCARD\SPI_WRAPPER_SD.C
//    1 /*__________________________________________________________________________________
//    2 |	Chave Digital Tecnologia Eletronica Ltda. 
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
//   17 |       Arquivo            :
//   18 |       Descrição          :
//   19 | 
//   20 |       Autor              :
//   21 |       Data criação       :
//   22 |
//   23 |       Revisões           :
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 
//   29 /***********************************************************************************
//   30 *   Includes
//   31 ***********************************************************************************/
//   32 #include <nxp\iolpc1768.h>

        ASEGN `.noinit`:DATA:NOROOT,0400fc1a8H
        SECTION_GROUP _A_PCLKSEL0
// __absolute union <unnamed> volatile _A_PCLKSEL0
_A_PCLKSEL0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0400fc0c4H
        SECTION_GROUP _A_PCONP
// __absolute union <unnamed> volatile _A_PCONP
_A_PCONP:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04002c000H
        SECTION_GROUP _A_PINSEL0
// __absolute union <unnamed> volatile _A_PINSEL0
_A_PINSEL0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c000H
        SECTION_GROUP _A_FIO0DIR
// __absolute union <unnamed> volatile _A_FIO0DIR
_A_FIO0DIR:
        DS8 4

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

        ASEGN `.noinit`:DATA:NOROOT,040030000H
        SECTION_GROUP _A_SSP1CR0
// __absolute union <unnamed> volatile _A_SSP1CR0
_A_SSP1CR0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040030004H
        SECTION_GROUP _A_SSP1CR1
// __absolute union <unnamed> volatile _A_SSP1CR1
_A_SSP1CR1:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040030008H
        SECTION_GROUP _A_SSP1DR
// __absolute union <unnamed> volatile _A_SSP1DR
_A_SSP1DR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04003000cH
        SECTION_GROUP _A_SSP1SR
// __absolute union <unnamed> const volatile _A_SSP1SR
_A_SSP1SR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040030010H
        SECTION_GROUP _A_SSP1CPSR
// __absolute union <unnamed> volatile _A_SSP1CPSR
_A_SSP1CPSR:
        DS8 4
//   33 #include "spi_wrapper_sd.h"
//   34 
//   35 /***********************************************************************************
//   36 *   Definições
//   37 ***********************************************************************************/
//   38 #define SSP_SR_TFE            ((unsigned int)(1<<0)) 
//   39 #define SSP_SR_TNF            ((unsigned int)(1<<1)) 
//   40 #define SSP_SR_RNE            ((unsigned int)(1<<2)) 
//   41 #define SSP_SR_RFF            ((unsigned int)(1<<3)) 
//   42 #define SSP_SR_BSY            ((unsigned int)(1<<4)) 
//   43 #define SSP_SR_BITMASK	      ((unsigned int)(0x1F)) 
//   44 
//   45 #define CS_PIN_               (0x01)<<6
//   46 #define SPI_PCLK              64000000
//   47 /***********************************************************************************
//   48 *   Implementação
//   49 ***********************************************************************************/
//   50 
//   51 /***********************************************************************************
//   52 * @brief  Initializes the SSP0.
//   53 *
//   54 * @param  None
//   55 * @retval None 
//   56 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SPI_Init
        THUMB
//   57 void SPI_Init (void){
SPI_Init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   58   
//   59   // Liga a energia pro módulo  
//   60   PCONP_bit.PCSSP1 = 1;
        LDR.N    R0,??DataTable4  ;; 0x400fc0c4
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.N    R1,??DataTable4  ;; 0x400fc0c4
        STR      R0,[R1, #+0]
//   61   
//   62   // Inicia o chipselect em nível alto
//   63   FIO0DIR |= CS_PIN_;
        LDR.N    R0,??DataTable4_1  ;; 0x2009c000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable4_1  ;; 0x2009c000
        STR      R0,[R1, #+0]
//   64   FIO0SET |= CS_PIN_;    
        LDR.N    R0,??DataTable4_2  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable4_2  ;; 0x2009c018
        STR      R0,[R1, #+0]
//   65   
//   66   // Configura a função SPI1 para os pinos
//   67   PINSEL0_bit.P0_7 = 0x02;
        MOVS     R0,#+2
        LDR.N    R1,??DataTable4_3  ;; 0x4002c000
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+14,#+2
        LDR.N    R0,??DataTable4_3  ;; 0x4002c000
        STR      R1,[R0, #+0]
//   68   PINSEL0_bit.P0_8 = 0x02;
        MOVS     R0,#+2
        LDR.N    R1,??DataTable4_3  ;; 0x4002c000
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+16,#+2
        LDR.N    R0,??DataTable4_3  ;; 0x4002c000
        STR      R1,[R0, #+0]
//   69   PINSEL0_bit.P0_9 = 0x02;
        MOVS     R0,#+2
        LDR.N    R1,??DataTable4_3  ;; 0x4002c000
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+18,#+2
        LDR.N    R0,??DataTable4_3  ;; 0x4002c000
        STR      R1,[R0, #+0]
//   70     
//   71   /* Configure SSP0_PCLK to CCLK(100MHz), default value is CCLK/4 */    
//   72   //LPC_SC->PCLKSEL1 &= ~(3 << 10);
//   73   //LPC_SC->PCLKSEL1 |=  (1 << 10);  /* SSP0_PCLK=CCLK */
//   74   PCLKSEL0_bit.PCLK_SSP1 = 0;//1;
        LDR.N    R0,??DataTable4_4  ;; 0x400fc1a8
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x300000
        LDR.N    R1,??DataTable4_4  ;; 0x400fc1a8
        STR      R0,[R1, #+0]
//   75     
//   76   /* 8bit, SPI frame format, CPOL=0, CPHA=0, SCR=0 */  
//   77   //LPC_SSP1->CR0 = (0x07 << 0) |     /* data width: 8bit*/
//   78   //                (0x00 << 4) |     /* frame format: SPI */
//   79   //                (0x00 << 6) |     /* CPOL: low level */
//   80   //                (0x00 << 7) |     /* CPHA: first edge */
//   81   //                (0x00 << 8);      /* SCR = 0 */
//   82   SSP1CR0 = (0x07 << 0) |     /* data width: 8bit*/
//   83             (0x00 << 4) |     /* frame format: SPI */
//   84             (0x00 << 6) |     /* CPOL: low level */
//   85             (0x00 << 7) |     /* CPHA: first edge */
//   86             (0x00 << 8);      /* SCR = 0 */
        LDR.N    R0,??DataTable4_5  ;; 0x40030000
        MOVS     R1,#+7
        STR      R1,[R0, #+0]
//   87   
//   88   /* Enable SSP0 as a master */
//   89   //LPC_SSP1->CR1 = (0x00 << 0) |   /* Normal mode */
//   90   //                (0x01 << 1) |   /* Enable SSP0 */
//   91   //                (0x00 << 2) |   /* Master */
//   92   //                (0x00 << 3);    /* slave output disabled */
//   93   
//   94   SSP1CR1 = (0x00 << 0) |   /* Normal mode */
//   95             (0x01 << 1) |   /* Enable SSP0 */
//   96             (0x00 << 2) |   /* Master */
//   97             (0x00 << 3);    /* slave output disabled */    
        LDR.N    R0,??DataTable4_6  ;; 0x40030004
        MOVS     R1,#+2
        STR      R1,[R0, #+0]
//   98 
//   99   /* Configure SSP1 clock rate to 400kHz (100MHz/250) */
//  100   SPI_ConfigClockRate (SPI_CLOCKRATE_LOW);
        LDR.N    R0,??DataTable4_7  ;; 0x3d0900
          CFI FunCall SPI_ConfigClockRate
        BL       SPI_ConfigClockRate
//  101   
//  102   /* Set SSEL to high */
//  103   SPI_CS_High ();
          CFI FunCall SPI_CS_High
        BL       SPI_CS_High
//  104 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_PCONP
        REQUIRE _A_FIO0DIR
        REQUIRE _A_FIO0SET
        REQUIRE _A_PINSEL0
        REQUIRE _A_PCLKSEL0
        REQUIRE _A_SSP1CR0
        REQUIRE _A_SSP1CR1
//  105 /***********************************************************************************
//  106 * @brief  Configure SSP0 clock rate.
//  107 *
//  108 * @param  SPI_CLOCKRATE: Specifies the SPI clock rate.
//  109 *         The value should be SPI_CLOCKRATE_LOW or SPI_CLOCKRATE_HIGH.
//  110 * @retval None 
//  111 *
//  112 * SSP0_CLK = CCLK / SPI_CLOCKRATE
//  113 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SPI_ConfigClockRate
          CFI NoCalls
        THUMB
//  114 void SPI_ConfigClockRate (unsigned int SPI_CLOCKRATE){
//  115   unsigned int divisor;
//  116   
//  117   divisor = SPI_PCLK/SPI_CLOCKRATE;
SPI_ConfigClockRate:
        LDR.N    R1,??DataTable4_8  ;; 0x3d09000
        UDIV     R0,R1,R0
//  118   divisor &=~(0x01); // Aham!!!! Me diga o que isso faz!!!!! Se souber, está contratado!!!!
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
//  119   
//  120   SSP1CR0_bit.SCR = divisor<<8;  
        LSLS     R1,R0,#+8
        LDR.N    R2,??DataTable4_5  ;; 0x40030000
        LDR      R2,[R2, #+0]
        BICS     R2,R2,#0xFF00
        LDR.N    R3,??DataTable4_5  ;; 0x40030000
        STR      R2,[R3, #+0]
//  121   SSP1CPSR = divisor;  
        LDR.N    R2,??DataTable4_9  ;; 0x40030010
        STR      R0,[R2, #+0]
//  122 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_SSP1CR0
        REQUIRE _A_SSP1CPSR
//  123 /***********************************************************************************
//  124 * @brief  Set SSEL to low: select spi slave.
//  125 *
//  126 * @param  None.
//  127 * @retval None 
//  128 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SPI_CS_Low
          CFI NoCalls
        THUMB
//  129 void SPI_CS_Low (void){
//  130 
//  131   FIO0CLR |= CS_PIN_;
SPI_CS_Low:
        LDR.N    R0,??DataTable4_10  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable4_10  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  132 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
        REQUIRE _A_FIO0CLR
//  133 /***********************************************************************************
//  134 * @brief  Set SSEL to high: de-select spi slave.
//  135 *
//  136 * @param  None.
//  137 * @retval None 
//  138 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SPI_CS_High
          CFI NoCalls
        THUMB
//  139 void SPI_CS_High (void){
//  140   
//  141   FIO0SET |= CS_PIN_;
SPI_CS_High:
        LDR.N    R0,??DataTable4_2  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable4_2  ;; 0x2009c018
        STR      R0,[R1, #+0]
//  142 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
        REQUIRE _A_FIO0SET
//  143 /***********************************************************************************
//  144 * @brief  Send one byte via MOSI and simutaniously receive one byte via MISO.
//  145 *
//  146 * @param  data: Specifies the byte to be sent out.
//  147 * @retval Returned byte.
//  148 *
//  149 * Note: Each time send out one byte at MOSI, Rx FIFO will receive one byte. 
//  150 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SPI_SendByte
          CFI NoCalls
        THUMB
//  151 unsigned char SPI_SendByte (unsigned char data){ 
//  152   unsigned char temp;
//  153   
//  154   while(! (SSP1SR & 0x02));//Se está setado é pq o buffer está cheio
SPI_SendByte:
??SPI_SendByte_0:
        LDR.N    R1,??DataTable4_11  ;; 0x4003000c
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+30
        BPL.N    ??SPI_SendByte_0
//  155   SSP1DR = data;
        LDR.N    R1,??DataTable4_12  ;; 0x40030008
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
//  156   while(! (SSP1SR & 0x04));//
??SPI_SendByte_1:
        LDR.N    R0,??DataTable4_11  ;; 0x4003000c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??SPI_SendByte_1
//  157   temp = SSP1DR;  
        LDR.N    R0,??DataTable4_12  ;; 0x40030008
        LDR      R0,[R0, #+0]
//  158   
//  159   return temp;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
        REQUIRE _A_SSP1SR
        REQUIRE _A_SSP1DR
//  160 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x400fc0c4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x2009c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x2009c018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x4002c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x400fc1a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x40030000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x40030004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x3d0900

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     0x3d09000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     0x40030010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     0x2009c01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     0x4003000c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     0x40030008
//  161 /***********************************************************************************
//  162 * @brief  Receive one byte via MISO.
//  163 *
//  164 * @param  None.
//  165 * @retval Returned received byte.
//  166 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SPI_RecvByte
        THUMB
//  167 unsigned char SPI_RecvByte (void){
SPI_RecvByte:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  168 
//  169   return SPI_SendByte (0xFF);
        MOVS     R0,#+255
          CFI FunCall SPI_SendByte
        BL       SPI_SendByte
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock5
//  170 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  171 /***********************************************************************************
//  172 * Fim do arquivo
//  173 ***********************************************************************************/
// 
//  44 bytes in section .noinit (abs)
// 266 bytes in section .text
// 
// 266 bytes of CODE memory
//   0 bytes of DATA memory (+ 44 bytes shared)
//
//Errors: none
//Warnings: none
