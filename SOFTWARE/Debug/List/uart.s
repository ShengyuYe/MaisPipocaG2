///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     19/Jul/2017  13:52:28 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\UARTS\uart.c                    /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\UARTS\uart.c -lC                /
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
//                    pocaG2\SOFTWARE\Debug\List\uart.s                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME uart

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC U0RBRTHR
        PUBLIC U1RBRTHR
        PUBLIC U2RBRTHR
        PUBLIC U3RBRTHR
        PUBLIC UART_funcoesVetores
        PUBLIC UART_init
        PUBLIC UART_irq_uart_1
        PUBLIC UART_irq_uart_2
        PUBLIC UART_irq_uart_3
        PUBLIC _A_CLRPEND0
        PUBLIC _A_FIO0CLR
        PUBLIC _A_FIO0SET
        PUBLIC _A_IP1
        PUBLIC _A_IP2
        PUBLIC _A_PCLKSEL0
        PUBLIC _A_PCLKSEL1
        PUBLIC _A_PCONP
        PUBLIC _A_PINSEL0
        PUBLIC _A_PINSEL4
        PUBLIC _A_SETENA0
        PUBLIC _A_U0FCR
        PUBLIC _A_U0IER
        PUBLIC _A_U0LCR
        PUBLIC _A_U1FCR
        PUBLIC _A_U1IER
        PUBLIC _A_U1LCR
        PUBLIC _A_U1LSR
        PUBLIC _A_U2FCR
        PUBLIC _A_U2IER
        PUBLIC _A_U2LCR
        PUBLIC _A_U3FCR
        PUBLIC _A_U3IER
        PUBLIC _A_U3LCR
        PUBLIC _A_U3LSR
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\UARTS\uart.c
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
//   17 |       Arquivo            :  Uart.c
//   18 |       Descrição          :  Funções para acesso às uarts do LPC
//   19 | 
//   20 |       Autor              :  Marcos 
//   21 |       Data criação       :  27/07/2011
//   22 |
//   23 |       Revisões           :  1.0
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 /***********************************************************************************
//   29 *		Includes
//   30 ***********************************************************************************/
//   31 #include <stdio.h>
//   32 #include <nxp\iolpc1768.h>

        ASEGN `.noinit`:DATA:NOROOT,0e000e100H
        SECTION_GROUP _A_SETENA0
// __absolute union <unnamed> volatile _A_SETENA0
_A_SETENA0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0e000e280H
        SECTION_GROUP _A_CLRPEND0
// __absolute union <unnamed> volatile _A_CLRPEND0
_A_CLRPEND0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0e000e404H
        SECTION_GROUP _A_IP1
// __absolute union <unnamed> volatile _A_IP1
_A_IP1:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0e000e408H
        SECTION_GROUP _A_IP2
// __absolute union <unnamed> volatile _A_IP2
_A_IP2:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0400fc1a8H
        SECTION_GROUP _A_PCLKSEL0
// __absolute union <unnamed> volatile _A_PCLKSEL0
_A_PCLKSEL0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0400fc1acH
        SECTION_GROUP _A_PCLKSEL1
// __absolute union <unnamed> volatile _A_PCLKSEL1
_A_PCLKSEL1:
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

        ASEGN `.noinit`:DATA:NOROOT,04002c010H
        SECTION_GROUP _A_PINSEL4
// __absolute union <unnamed> volatile _A_PINSEL4
_A_PINSEL4:
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

        ASEGN `.noinit`:DATA:NOROOT,04000c000H
        SECTION_GROUP U0RBRTHR
// __absolute unsigned char volatile U0RBRTHR
U0RBRTHR:
        DS8 1

        ASEGN `.noinit`:DATA:NOROOT,04000c004H
        SECTION_GROUP _A_U0IER
// __absolute union <unnamed> volatile _A_U0IER
_A_U0IER:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04000c008H
        SECTION_GROUP _A_U0FCR
// __absolute union <unnamed> volatile _A_U0FCR
_A_U0FCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04000c00cH
        SECTION_GROUP _A_U0LCR
// __absolute union <unnamed> volatile _A_U0LCR
_A_U0LCR:
        DS8 1

        ASEGN `.noinit`:DATA:NOROOT,040010000H
        SECTION_GROUP U1RBRTHR
// __absolute unsigned char volatile U1RBRTHR
U1RBRTHR:
        DS8 1

        ASEGN `.noinit`:DATA:NOROOT,040010004H
        SECTION_GROUP _A_U1IER
// __absolute union <unnamed> volatile _A_U1IER
_A_U1IER:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040010008H
        SECTION_GROUP _A_U1FCR
// __absolute union <unnamed> volatile _A_U1FCR
_A_U1FCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04001000cH
        SECTION_GROUP _A_U1LCR
// __absolute union <unnamed> volatile _A_U1LCR
_A_U1LCR:
        DS8 1

        ASEGN `.noinit`:DATA:NOROOT,040010014H
        SECTION_GROUP _A_U1LSR
// __absolute union <unnamed> const volatile _A_U1LSR
_A_U1LSR:
        DS8 1

        ASEGN `.noinit`:DATA:NOROOT,040098000H
        SECTION_GROUP U2RBRTHR
// __absolute unsigned char volatile U2RBRTHR
U2RBRTHR:
        DS8 1

        ASEGN `.noinit`:DATA:NOROOT,040098004H
        SECTION_GROUP _A_U2IER
// __absolute union <unnamed> volatile _A_U2IER
_A_U2IER:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040098008H
        SECTION_GROUP _A_U2FCR
// __absolute union <unnamed> volatile _A_U2FCR
_A_U2FCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04009800cH
        SECTION_GROUP _A_U2LCR
// __absolute union <unnamed> volatile _A_U2LCR
_A_U2LCR:
        DS8 1

        ASEGN `.noinit`:DATA:NOROOT,04009c000H
        SECTION_GROUP U3RBRTHR
// __absolute unsigned char volatile U3RBRTHR
U3RBRTHR:
        DS8 1

        ASEGN `.noinit`:DATA:NOROOT,04009c004H
        SECTION_GROUP _A_U3IER
// __absolute union <unnamed> volatile _A_U3IER
_A_U3IER:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04009c008H
        SECTION_GROUP _A_U3FCR
// __absolute union <unnamed> volatile _A_U3FCR
_A_U3FCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04009c00cH
        SECTION_GROUP _A_U3LCR
// __absolute union <unnamed> volatile _A_U3LCR
_A_U3LCR:
        DS8 1

        ASEGN `.noinit`:DATA:NOROOT,04009c014H
        SECTION_GROUP _A_U3LSR
// __absolute union <unnamed> const volatile _A_U3LSR
_A_U3LSR:
        DS8 1
//   33 #include "uart.h"
//   34 #include "uart_types.h"
//   35 #include <intrinsics.h>
//   36 
//   37 /***********************************************************************************
//   38 *   Constantes
//   39 ***********************************************************************************/
//   40 #define PCLK                                            99047619
//   41 #define RECEIVE_DATA_INTERRUPT                          0x01
//   42 #define DATA_TRANSMIT_INTERRUPT                         0x02
//   43 #define RX_LINE_INTERRUPT                               0x04
//   44 
//   45 
//   46 
//   47 #define ENABLE_TXD_3                                    (0x01)<<27
//   48 #define ENABLE_RXD_3                                    (0x01)<<28
//   49  
//   50 #define INIT_ENABLES_COM3                               FIO0DIR |= ENABLE_TXD_3 | ENABLE_RXD_3
//   51 
//   52 #define SET_TXD_ENABLE_3                                FIO0SET |= ENABLE_TXD_3;
//   53 #define CLR_TXD_ENABLE_3                                FIO0CLR |= ENABLE_TXD_3;
//   54 /***********************************************************************************
//   55 *   Estruturas
//   56 ***********************************************************************************/
//   57 typedef struct{
//   58   void(*funcaoRxd)(unsigned char dado);
//   59   unsigned char*(*funcaoTxd)(void);
//   60   void(*enableFunction)(unsigned char state);
//   61 }sFunctions;
//   62 
//   63 /***********************************************************************************
//   64 *   Variaveis globais
//   65 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   66 sFunctions UART_funcoesVetores[4];
UART_funcoesVetores:
        DS8 48
//   67 
//   68 /***********************************************************************************
//   69 *   Funções locais
//   70 ***********************************************************************************/
//   71 
//   72 
//   73 /***********************************************************************************
//   74 *   Implementação das funções
//   75 ***********************************************************************************/
//   76 
//   77 /***********************************************************************************
//   78 *     Descrição   :   Faz a inicialização de uma das uarts
//   79 *     Parametros  :   (unsigned char) número da uart
//   80 *                     (unsigned int) baudrate
//   81 *                     (void)(*funcaoRxd)(unsigned char dado)
//   82 *                     (unsigned char*)(*funcaoTxd)(void)
//   83 *                     (void)(*enableFunction)(unsigned char state)
//   84 *     Retorno     :   nenhum
//   85 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function UART_init
          CFI NoCalls
        THUMB
//   86 void UART_init(unsigned char uart,unsigned long int baudrate,void(*funcRxd)(unsigned char data),
//   87                unsigned char*(*funcTxd)(void),void(*enableFunc)(unsigned char state)){
//   88   unsigned long int Fdiv;
//   89         
//   90   switch(uart){
UART_init:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??UART_init_0
        CMP      R0,#+2
        BEQ.W    ??UART_init_1
        BCC.N    ??UART_init_2
        CMP      R0,#+3
        BEQ.W    ??UART_init_3
        B.N      ??UART_init_4
//   91     case UART_0: 
//   92                  PINSEL0_bit.P0_2 = 0x01;  // Função alternativa para os pinos da COM 0
??UART_init_0:
        MOVS     R0,#+1
        LDR.W    R2,??DataTable2  ;; 0x4002c000
        LDR      R2,[R2, #+0]
        BFI      R2,R0,#+4,#+2
        LDR.W    R0,??DataTable2  ;; 0x4002c000
        STR      R2,[R0, #+0]
//   93                  PINSEL0_bit.P0_3 = 0x01;
        MOVS     R0,#+1
        LDR.W    R2,??DataTable2  ;; 0x4002c000
        LDR      R2,[R2, #+0]
        BFI      R2,R0,#+6,#+2
        LDR.W    R0,??DataTable2  ;; 0x4002c000
        STR      R2,[R0, #+0]
//   94   
//   95                  PCONP_bit.PCUART0 = 1;
        LDR.N    R0,??DataTable2_1  ;; 0x400fc0c4
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R2,??DataTable2_1  ;; 0x400fc0c4
        STR      R0,[R2, #+0]
//   96                  PCLKSEL0_bit.PCLK_UART0 = 1;
        MOVS     R0,#+1
        LDR.N    R2,??DataTable2_2  ;; 0x400fc1a8
        LDR      R2,[R2, #+0]
        BFI      R2,R0,#+6,#+2
        LDR.N    R0,??DataTable2_2  ;; 0x400fc1a8
        STR      R2,[R0, #+0]
//   97                  
//   98                  U0LCR = 0x83;   /* 8 bits, no Parity, 1 Stop bit */
        LDR.N    R0,??DataTable2_3  ;; 0x4000c00c
        MOVS     R2,#+131
        STRB     R2,[R0, #+0]
//   99                  Fdiv = ( PCLK / 16 ) / baudrate ;  /*baud rate */
        LDR.N    R0,??DataTable2_4  ;; 0x5e758c
        UDIV     R0,R0,R1
//  100                  U0DLM = Fdiv / 256;
        LSRS     R1,R0,#+8
        LDR.N    R2,??DataTable2_5  ;; 0x4000c004
        STR      R1,[R2, #+0]
//  101                  U0DLL = Fdiv % 256;
        MOV      R1,#+256
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.N    R0,??DataTable2_6  ;; 0x4000c000
        STRB     R2,[R0, #+0]
//  102                  U0LCR = 0x03;   /* DLAB = 0 */
        LDR.N    R0,??DataTable2_3  ;; 0x4000c00c
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  103                  U0FCR = 0x07;   /* Enable and reset TX and RX FIFO. */
        LDR.N    R0,??DataTable2_7  ;; 0x4000c008
        MOVS     R1,#+7
        STR      R1,[R0, #+0]
//  104 
//  105                  SETENA0 |= (0x01)<<5;
        LDR.N    R0,??DataTable2_8  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable2_8  ;; 0xe000e100
        STR      R0,[R1, #+0]
//  106                  IP1_bit.PRI_5 = 1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_9  ;; 0xe000e404
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+8,#+8
        LDR.N    R0,??DataTable2_9  ;; 0xe000e404
        STR      R1,[R0, #+0]
//  107                  
//  108                  U0IER = IER_RBR | IER_THRE | IER_RLS; /* Enable UART0 interrupt */                   
        LDR.N    R0,??DataTable2_5  ;; 0x4000c004
        MOVS     R1,#+7
        STR      R1,[R0, #+0]
//  109                  break;
        B.N      ??UART_init_4
//  110     case UART_1: 
//  111                  PINSEL4_bit.P2_0 = 0x02;  // Função alternativa para os pinos da COM 1
??UART_init_2:
        MOVS     R0,#+2
        LDR.N    R2,??DataTable2_10  ;; 0x4002c010
        LDR      R2,[R2, #+0]
        BFI      R2,R0,#+0,#+2
        LDR.N    R0,??DataTable2_10  ;; 0x4002c010
        STR      R2,[R0, #+0]
//  112                  PINSEL4_bit.P2_1 = 0x02;  // utilizada no protocolo TELET
        MOVS     R0,#+2
        LDR.N    R2,??DataTable2_10  ;; 0x4002c010
        LDR      R2,[R2, #+0]
        BFI      R2,R0,#+2,#+2
        LDR.N    R0,??DataTable2_10  ;; 0x4002c010
        STR      R2,[R0, #+0]
//  113   
//  114                  PCONP_bit.PCUART1 = 1;
        LDR.N    R0,??DataTable2_1  ;; 0x400fc0c4
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R2,??DataTable2_1  ;; 0x400fc0c4
        STR      R0,[R2, #+0]
//  115                  PCLKSEL0_bit.PCLK_UART1 = 1;
        MOVS     R0,#+1
        LDR.N    R2,??DataTable2_2  ;; 0x400fc1a8
        LDR      R2,[R2, #+0]
        BFI      R2,R0,#+8,#+2
        LDR.N    R0,??DataTable2_2  ;; 0x400fc1a8
        STR      R2,[R0, #+0]
//  116                  
//  117                  U1LCR = 0x83;   /* 8 bits, no Parity, 1 Stop bit */
        LDR.N    R0,??DataTable2_11  ;; 0x4001000c
        MOVS     R2,#+131
        STRB     R2,[R0, #+0]
//  118                  Fdiv = ( PCLK / 16 ) / baudrate ;  /*baud rate */
        LDR.N    R0,??DataTable2_4  ;; 0x5e758c
        UDIV     R0,R0,R1
//  119                  U1DLM = Fdiv / 256;
        LSRS     R1,R0,#+8
        LDR.N    R2,??DataTable2_12  ;; 0x40010004
        STR      R1,[R2, #+0]
//  120                  U1DLL = Fdiv % 256;
        MOV      R1,#+256
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.N    R0,??DataTable2_13  ;; 0x40010000
        STRB     R2,[R0, #+0]
//  121                  U1LCR = 0x03;   /* DLAB = 0 */
        LDR.N    R0,??DataTable2_11  ;; 0x4001000c
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  122                  U1FCR = 0x07;   /* Enable and reset TX and RX FIFO. */
        LDR.N    R0,??DataTable2_14  ;; 0x40010008
        MOVS     R1,#+7
        STR      R1,[R0, #+0]
//  123 
//  124                  SETENA0 |= (0x01)<<6;
        LDR.N    R0,??DataTable2_8  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable2_8  ;; 0xe000e100
        STR      R0,[R1, #+0]
//  125                  IP1_bit.PRI_6 = 1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_9  ;; 0xe000e404
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+16,#+8
        LDR.N    R0,??DataTable2_9  ;; 0xe000e404
        STR      R1,[R0, #+0]
//  126                  
//  127                  U1IER = IER_RBR | IER_THRE | IER_RLS; /* Enable UART0 interrupt */             
        LDR.N    R0,??DataTable2_12  ;; 0x40010004
        MOVS     R1,#+7
        STR      R1,[R0, #+0]
//  128                  break;      
        B.N      ??UART_init_4
//  129     case UART_2:
//  130                  PINSEL0_bit.P0_10 = 1;
??UART_init_1:
        MOVS     R0,#+1
        LDR.N    R2,??DataTable2  ;; 0x4002c000
        LDR      R2,[R2, #+0]
        BFI      R2,R0,#+20,#+2
        LDR.N    R0,??DataTable2  ;; 0x4002c000
        STR      R2,[R0, #+0]
//  131                  PINSEL0_bit.P0_11 = 1;
        MOVS     R0,#+1
        LDR.N    R2,??DataTable2  ;; 0x4002c000
        LDR      R2,[R2, #+0]
        BFI      R2,R0,#+22,#+2
        LDR.N    R0,??DataTable2  ;; 0x4002c000
        STR      R2,[R0, #+0]
//  132       
//  133                  PCONP_bit.PCUART2 = 1;
        LDR.N    R0,??DataTable2_1  ;; 0x400fc0c4
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R2,??DataTable2_1  ;; 0x400fc0c4
        STR      R0,[R2, #+0]
//  134                  PCLKSEL1_bit.PCLK_UART2 = 1;
        MOVS     R0,#+1
        LDR.N    R2,??DataTable2_15  ;; 0x400fc1ac
        LDR      R2,[R2, #+0]
        BFI      R2,R0,#+16,#+2
        LDR.N    R0,??DataTable2_15  ;; 0x400fc1ac
        STR      R2,[R0, #+0]
//  135                  
//  136                  U2LCR = 0x83;   /* 8 bits, no Parity, 1 Stop bit */
        LDR.N    R0,??DataTable2_16  ;; 0x4009800c
        MOVS     R2,#+131
        STRB     R2,[R0, #+0]
//  137                  Fdiv = ( PCLK / 16 ) / baudrate ;  /*baud rate */
        LDR.N    R0,??DataTable2_4  ;; 0x5e758c
        UDIV     R0,R0,R1
//  138                  U2DLM = Fdiv / 256;
        LSRS     R1,R0,#+8
        LDR.N    R2,??DataTable2_17  ;; 0x40098004
        STR      R1,[R2, #+0]
//  139                  U2DLL = Fdiv % 256;
        MOV      R1,#+256
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.N    R0,??DataTable2_18  ;; 0x40098000
        STRB     R2,[R0, #+0]
//  140                  U2LCR = 0x03;   /* DLAB = 0 */
        LDR.N    R0,??DataTable2_16  ;; 0x4009800c
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  141                  U2FCR = 0x00;
        LDR.N    R0,??DataTable2_19  ;; 0x40098008
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  142 
//  143                  SETENA0 |= (0x01)<<7;
        LDR.N    R0,??DataTable2_8  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable2_8  ;; 0xe000e100
        STR      R0,[R1, #+0]
//  144                  IP1_bit.PRI_7 = 1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_9  ;; 0xe000e404
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+24,#+8
        LDR.N    R0,??DataTable2_9  ;; 0xe000e404
        STR      R1,[R0, #+0]
//  145                  
//  146                  U2IER = IER_RBR | IER_THRE;// | IER_RLS; /* Enable UART0 interrupt */         
        LDR.N    R0,??DataTable2_17  ;; 0x40098004
        MOVS     R1,#+3
        STR      R1,[R0, #+0]
//  147                  break;      
        B.N      ??UART_init_4
//  148     case UART_3:
//  149                  PINSEL0_bit.P0_0 = 0x02;  // Função alternativa para os pinos da com 3
??UART_init_3:
        MOVS     R0,#+2
        LDR.N    R2,??DataTable2  ;; 0x4002c000
        LDR      R2,[R2, #+0]
        BFI      R2,R0,#+0,#+2
        LDR.N    R0,??DataTable2  ;; 0x4002c000
        STR      R2,[R0, #+0]
//  150                  PINSEL0_bit.P0_1 = 0x02;
        MOVS     R0,#+2
        LDR.N    R2,??DataTable2  ;; 0x4002c000
        LDR      R2,[R2, #+0]
        BFI      R2,R0,#+2,#+2
        LDR.N    R0,??DataTable2  ;; 0x4002c000
        STR      R2,[R0, #+0]
//  151   
//  152                  PCONP_bit.PCUART3 = 1;
        LDR.N    R0,??DataTable2_1  ;; 0x400fc0c4
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R2,??DataTable2_1  ;; 0x400fc0c4
        STR      R0,[R2, #+0]
//  153                  PCLKSEL1_bit.PCLK_UART3 = 1;
        MOVS     R0,#+1
        LDR.N    R2,??DataTable2_15  ;; 0x400fc1ac
        LDR      R2,[R2, #+0]
        BFI      R2,R0,#+18,#+2
        LDR.N    R0,??DataTable2_15  ;; 0x400fc1ac
        STR      R2,[R0, #+0]
//  154                                   
//  155                  U3LCR = 0x83;   /* 8 bits, no Parity, 1 Stop bit */
        LDR.N    R0,??DataTable2_20  ;; 0x4009c00c
        MOVS     R2,#+131
        STRB     R2,[R0, #+0]
//  156                  Fdiv = ( PCLK / 16 ) / baudrate ;  /*baud rate */
        LDR.N    R0,??DataTable2_4  ;; 0x5e758c
        UDIV     R0,R0,R1
//  157                  U3DLM = Fdiv / 256;
        LSRS     R1,R0,#+8
        LDR.N    R2,??DataTable2_21  ;; 0x4009c004
        STR      R1,[R2, #+0]
//  158                  U3DLL = Fdiv % 256;
        MOV      R1,#+256
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.N    R0,??DataTable2_22  ;; 0x4009c000
        STRB     R2,[R0, #+0]
//  159                  U3LCR = 0x03;   /* DLAB = 0 */
        LDR.N    R0,??DataTable2_20  ;; 0x4009c00c
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  160                  U3FCR = 0x07;   /* Enable and reset TX and RX FIFO. */
        LDR.N    R0,??DataTable2_23  ;; 0x4009c008
        MOVS     R1,#+7
        STR      R1,[R0, #+0]
//  161 
//  162                  SETENA0 |= (0x01)<<8;// Habilitação da interrupção...
        LDR.N    R0,??DataTable2_8  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable2_8  ;; 0xe000e100
        STR      R0,[R1, #+0]
//  163                  IP2_bit.PRI_8 = 1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_24  ;; 0xe000e408
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+0,#+8
        LDR.N    R0,??DataTable2_24  ;; 0xe000e408
        STR      R1,[R0, #+0]
//  164                  
//  165                  U3IER = IER_RBR | IER_THRE | IER_RLS; /* Enable UART0 interrupt */               
        LDR.N    R0,??DataTable2_21  ;; 0x4009c004
        MOVS     R1,#+7
        STR      R1,[R0, #+0]
//  166                  break;      
//  167   }  
//  168 }
??UART_init_4:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_PINSEL0
        REQUIRE _A_PCONP
        REQUIRE _A_PCLKSEL0
        REQUIRE _A_U0LCR
        REQUIRE _A_U0IER
        REQUIRE U0RBRTHR
        REQUIRE _A_U0FCR
        REQUIRE _A_SETENA0
        REQUIRE _A_IP1
        REQUIRE _A_PINSEL4
        REQUIRE _A_U1LCR
        REQUIRE _A_U1IER
        REQUIRE U1RBRTHR
        REQUIRE _A_U1FCR
        REQUIRE _A_PCLKSEL1
        REQUIRE _A_U2LCR
        REQUIRE _A_U2IER
        REQUIRE U2RBRTHR
        REQUIRE _A_U2FCR
        REQUIRE _A_U3LCR
        REQUIRE _A_U3IER
        REQUIRE U3RBRTHR
        REQUIRE _A_U3FCR
        REQUIRE _A_IP2
//  169 /**********************************************************************************
//  170 *     Descrição   :   Vetor de interrupção da uart 1
//  171 *     Parametros  :   nenhum
//  172 *     Retorno     :   nenhum
//  173 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function UART_irq_uart_1
        THUMB
//  174 void UART_irq_uart_1(void){
UART_irq_uart_1:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  175   unsigned char dummy,*pointer;
//  176   
//  177   switch(U1IIR_bit.IID){
        LDR.N    R0,??DataTable2_14  ;; 0x40010008
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        ANDS     R0,R0,#0x7
        CMP      R0,#+1
        BEQ.N    ??UART_irq_uart_1_0
        CMP      R0,#+2
        BEQ.N    ??UART_irq_uart_1_1
        CMP      R0,#+3
        BEQ.N    ??UART_irq_uart_1_2
        CMP      R0,#+6
        BEQ.N    ??UART_irq_uart_1_3
        B.N      ??UART_irq_uart_1_4
//  178     case THRE:
//  179                pointer = UART_funcoesVetores[1].funcaoTxd();
??UART_irq_uart_1_0:
        LDR.N    R0,??DataTable2_25
        LDR      R0,[R0, #+16]
          CFI FunCall
        BLX      R0
        MOVS     R4,R0
//  180                if(pointer != NULL){
        CMP      R4,#+0
        BEQ.N    ??UART_irq_uart_1_5
//  181                   if(UART_funcoesVetores[1].enableFunction)
        LDR.N    R0,??DataTable2_25
        LDR      R0,[R0, #+20]
        CMP      R0,#+0
        BEQ.N    ??UART_irq_uart_1_6
//  182                     UART_funcoesVetores[1].enableFunction(0xFF);
        MOVS     R0,#+255
        LDR.N    R1,??DataTable2_25
        LDR      R1,[R1, #+20]
          CFI FunCall
        BLX      R1
//  183                   U1THR = *pointer;
??UART_irq_uart_1_6:
        LDR.N    R0,??DataTable2_13  ;; 0x40010000
        LDRB     R1,[R4, #+0]
        STRB     R1,[R0, #+0]
        B.N      ??UART_irq_uart_1_7
//  184                }
//  185                else
//  186                   if(UART_funcoesVetores[1].enableFunction)
??UART_irq_uart_1_5:
        LDR.N    R0,??DataTable2_25
        LDR      R0,[R0, #+20]
        CMP      R0,#+0
        BEQ.N    ??UART_irq_uart_1_7
//  187                     UART_funcoesVetores[1].enableFunction(0x00);
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_25
        LDR      R1,[R1, #+20]
          CFI FunCall
        BLX      R1
//  188                break; 
??UART_irq_uart_1_7:
        B.N      ??UART_irq_uart_1_4
//  189     case RDA : dummy = U1RBR;
??UART_irq_uart_1_1:
        LDR.N    R0,??DataTable2_13  ;; 0x40010000
        LDRB     R0,[R0, #+0]
//  190                UART_funcoesVetores[1].funcaoRxd(dummy);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable2_25
        LDR      R1,[R1, #+12]
          CFI FunCall
        BLX      R1
//  191                break;      
        B.N      ??UART_irq_uart_1_4
//  192     case RLS : 
//  193                dummy = U1LSR;
??UART_irq_uart_1_2:
        LDR.N    R0,??DataTable2_26  ;; 0x40010014
        LDRB     R0,[R0, #+0]
//  194                dummy = U1RBR;               
        LDR.N    R1,??DataTable2_13  ;; 0x40010000
        LDRB     R1,[R1, #+0]
        MOVS     R0,R1
//  195                break;      
        B.N      ??UART_irq_uart_1_4
//  196     case CTI :
//  197                break;      
//  198   }  
//  199   
//  200   //Apaga o flag de interrupção pendente
//  201   CLRPEND0 |= (0x01)<<6;    
??UART_irq_uart_1_3:
??UART_irq_uart_1_4:
        LDR.N    R0,??DataTable2_27  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable2_27  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  202 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
        REQUIRE U1RBRTHR
        REQUIRE _A_U1LSR
        REQUIRE _A_U1FCR
        REQUIRE _A_CLRPEND0
//  203 /**********************************************************************************
//  204 *     Descrição   :   Vetor de interrupção da uart 2
//  205 *     Parametros  :   nenhum
//  206 *     Retorno     :   nenhum
//  207 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function UART_irq_uart_2
          CFI NoCalls
        THUMB
//  208 void UART_irq_uart_2(void){
//  209   /*
//  210   unsigned char dummy,*pointer;
//  211   
//  212   switch(U2IIR_bit.IID){
//  213     case THRE:
//  214                pointer = UART_funcoesVetores[2].funcaoTxd();
//  215                if(pointer != NULL){
//  216                   if(UART_funcoesVetores[2].enableFunction)
//  217                     UART_funcoesVetores[2].enableFunction(0xFF);
//  218                   U2THR = *pointer;
//  219                }
//  220                else
//  221                   if(UART_funcoesVetores[2].enableFunction)
//  222                     UART_funcoesVetores[2].enableFunction(0x00);
//  223                break; 
//  224     case RDA : dummy = U2RBR;
//  225                UART_funcoesVetores[2].funcaoRxd(dummy);
//  226                break;      
//  227     case RLS : 
//  228                dummy = U2LSR;
//  229                dummy = U2RBR;               
//  230                break;      
//  231     case CTI :
//  232                break;      
//  233   }  
//  234   
//  235   //Apaga o flag de interrupção pendente
//  236   CLRPEND0 |= (0x01)<<7;   
//  237   */
//  238 }
UART_irq_uart_2:
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  239 /*********************************************************************************
//  240 *     Descrição   :   Vetor de interrupção da uart 3
//  241 *     Parametros  :   nenhum
//  242 *     Retorno     :   nenhum
//  243 *********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function UART_irq_uart_3
        THUMB
//  244 void UART_irq_uart_3(void){
UART_irq_uart_3:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  245   unsigned char dummy,*pointer;
//  246   
//  247   switch(U3IIR_bit.IID){
        LDR.N    R0,??DataTable2_23  ;; 0x4009c008
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        ANDS     R0,R0,#0x7
        CMP      R0,#+1
        BEQ.N    ??UART_irq_uart_3_0
        CMP      R0,#+2
        BEQ.N    ??UART_irq_uart_3_1
        CMP      R0,#+3
        BEQ.N    ??UART_irq_uart_3_2
        CMP      R0,#+6
        BEQ.N    ??UART_irq_uart_3_3
        B.N      ??UART_irq_uart_3_4
//  248     case THRE:
//  249                pointer = UART_funcoesVetores[3].funcaoTxd();
??UART_irq_uart_3_0:
        LDR.N    R0,??DataTable2_25
        LDR      R0,[R0, #+40]
          CFI FunCall
        BLX      R0
//  250                if(pointer != NULL){
        CMP      R0,#+0
        BEQ.N    ??UART_irq_uart_3_5
//  251                   SET_TXD_ENABLE_3;
        LDR.N    R1,??DataTable2_28  ;; 0x2009c018
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x8000000
        LDR.N    R2,??DataTable2_28  ;; 0x2009c018
        STR      R1,[R2, #+0]
//  252                   U3THR = *pointer;
        LDR.N    R1,??DataTable2_22  ;; 0x4009c000
        LDRB     R0,[R0, #+0]
        STRB     R0,[R1, #+0]
        B.N      ??UART_irq_uart_3_6
//  253                }
//  254                else                 
//  255                  CLR_TXD_ENABLE_3;
??UART_irq_uart_3_5:
        LDR.N    R0,??DataTable2_29  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.N    R1,??DataTable2_29  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  256                break; 
??UART_irq_uart_3_6:
        B.N      ??UART_irq_uart_3_4
//  257     case RDA : dummy = U3RBR;
??UART_irq_uart_3_1:
        LDR.N    R0,??DataTable2_22  ;; 0x4009c000
        LDRB     R0,[R0, #+0]
//  258                UART_funcoesVetores[3].funcaoRxd(dummy);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable2_25
        LDR      R1,[R1, #+36]
          CFI FunCall
        BLX      R1
//  259                break;      
        B.N      ??UART_irq_uart_3_4
//  260     case RLS : 
//  261                dummy = U3LSR;
??UART_irq_uart_3_2:
        LDR.N    R0,??DataTable2_30  ;; 0x4009c014
        LDRB     R0,[R0, #+0]
//  262                dummy = U3RBR;               
        LDR.N    R1,??DataTable2_22  ;; 0x4009c000
        LDRB     R1,[R1, #+0]
        MOVS     R0,R1
//  263                break;      
        B.N      ??UART_irq_uart_3_4
//  264     case CTI :
//  265                break;      
//  266   }  
//  267   
//  268   //Apaga o flag de interrupção pendente
//  269   CLRPEND0 |= (0x01)<<8;               
??UART_irq_uart_3_3:
??UART_irq_uart_3_4:
        LDR.N    R0,??DataTable2_27  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable2_27  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  270 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
        REQUIRE _A_FIO0SET
        REQUIRE U3RBRTHR
        REQUIRE _A_FIO0CLR
        REQUIRE _A_U3LSR
        REQUIRE _A_U3FCR
        REQUIRE _A_CLRPEND0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x4002c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x400fc0c4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x400fc1a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x4000c00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x5e758c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x4000c004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x4000c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x4000c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0xe000e404

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x4002c010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x4001000c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     0x40010004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     0x40010000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     0x40010008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     0x400fc1ac

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     0x4009800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     0x40098004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     0x40098000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     0x40098008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     0x4009c00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     0x4009c004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_22:
        DC32     0x4009c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_23:
        DC32     0x4009c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_24:
        DC32     0xe000e408

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_25:
        DC32     UART_funcoesVetores

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_26:
        DC32     0x40010014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_27:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_28:
        DC32     0x2009c018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_29:
        DC32     0x2009c01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_30:
        DC32     0x4009c014

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  271 /*********************************************************************************
//  272 *     Fim do arquivo
//  273 *********************************************************************************/
// 
//  48 bytes in section .bss
//  86 bytes in section .noinit (abs)
// 930 bytes in section .text
// 
// 930 bytes of CODE memory
//  48 bytes of DATA memory (+ 86 bytes shared)
//
//Errors: none
//Warnings: none
