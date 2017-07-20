///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  15:52:36 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\sst25vf016b\spi_wrapper.c       /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\sst25vf016b\spi_wrapper.c -lC   /
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
//                    pocaG2\SOFTWARE\Debug\List\spi_wrapper.s                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME spi_wrapper

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC SPIWRAPPER_init
        PUBLIC SPI_getBytes
        PUBLIC SPI_sendBytes
        PUBLIC _A_FIO0DIR
        PUBLIC _A_FIO0SET
        PUBLIC _A_PCLKSEL1
        PUBLIC _A_PCONP
        PUBLIC _A_PINSEL0
        PUBLIC _A_PINSEL1
        PUBLIC _A_SSP0CPSR
        PUBLIC _A_SSP0CR0
        PUBLIC _A_SSP0CR1
        PUBLIC _A_SSP0DR
        PUBLIC _A_SSP0SR
        PUBLIC dummy
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\sst25vf016b\spi_wrapper.c
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
//   17 |       Module	    : SPI wrapper
//   18 |       File	    : SPI_WRAPPER.C
//   19 |       Description : Wrapper para funções spi utilizadas em escrita em memórias
//   20 |	Author      : Marcos Aquino
//   21 |
//   22 |       Created on  : 09/06/2009
//   23 |
//   24 |       History     : 
//   25 |
//   26 |
//   27 | __________________________________________________________________________________
//   28 */
//   29 
//   30 /***********************************************************************************
//   31 *	Includes
//   32 ***********************************************************************************/
//   33 #include "spi_wrapper.h"

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

        ASEGN `.noinit`:DATA:NOROOT,04002c004H
        SECTION_GROUP _A_PINSEL1
// __absolute union <unnamed> volatile _A_PINSEL1
_A_PINSEL1:
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

        ASEGN `.noinit`:DATA:NOROOT,040088000H
        SECTION_GROUP _A_SSP0CR0
// __absolute union <unnamed> volatile _A_SSP0CR0
_A_SSP0CR0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040088004H
        SECTION_GROUP _A_SSP0CR1
// __absolute union <unnamed> volatile _A_SSP0CR1
_A_SSP0CR1:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040088008H
        SECTION_GROUP _A_SSP0DR
// __absolute union <unnamed> volatile _A_SSP0DR
_A_SSP0DR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04008800cH
        SECTION_GROUP _A_SSP0SR
// __absolute union <unnamed> const volatile _A_SSP0SR
_A_SSP0SR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040088010H
        SECTION_GROUP _A_SSP0CPSR
// __absolute union <unnamed> volatile _A_SSP0CPSR
_A_SSP0CPSR:
        DS8 4
//   34 #include "..\..\includes.h"
//   35 
//   36 /***********************************************************************************
//   37 *	Defines - Local
//   38 ***********************************************************************************/ 
//   39 #define PCLK                    96000000
//   40 
//   41 #define SCK                     (0x01)<<15
//   42 #define MISO                    (0x01)<<17
//   43 #define MOSI                    (0x01)<<18
//   44 
//   45 
//   46 #define SCK_FUNC                PINSEL0_bit.P0_15  
//   47 #define MISO_FUNC               PINSEL1_bit.P0_17  
//   48 #define MOSI_FUNC               PINSEL1_bit.P0_18  
//   49 
//   50 /***********************************************************************************
//   51 *	Enumerations - Local
//   52 ***********************************************************************************/
//   53 
//   54 
//   55 /***********************************************************************************
//   56 *	Structs - Local
//   57 ***********************************************************************************/
//   58 
//   59 
//   60 /***********************************************************************************
//   61 *	Types - Local
//   62 ***********************************************************************************/
//   63 
//   64 
//   65 /***********************************************************************************
//   66 *	Variables - Local
//   67 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   68 unsigned char dummy;
dummy:
        DS8 1
//   69 /***********************************************************************************
//   70 *	Functions - Local
//   71 ***********************************************************************************/
//   72 
//   73 
//   74 /***********************************************************************************
//   75 *	Implementations
//   76 ***********************************************************************************/
//   77 
//   78 /***********************************************************************************
//   79 *       Descrição     : Inicialização do módulo
//   80 *       Parametros    : (unsigned int) xtal value
//   81 *                       (unsigned int) spi clock
//   82 *       Retorno       : nenhum
//   83 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SPIWRAPPER_init
          CFI NoCalls
        THUMB
//   84 void SPIWRAPPER_init(unsigned long int spiClk){
//   85   unsigned int divisor;
//   86     
//   87   divisor = 8;//4;//PCLK/spiClk;
SPIWRAPPER_init:
        MOVS     R0,#+8
//   88   divisor &=~(0x01); // Aham!!!! Me diga o que isso faz!!!!! Se souber, está contratado!!!!
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
//   89     
//   90   INIT_CHIP_SELECTS;
        LDR.N    R1,??DataTable2  ;; 0x2009c000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10000
        LDR.N    R2,??DataTable2  ;; 0x2009c000
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable2_1  ;; 0x2009c018
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10000
        LDR.N    R2,??DataTable2_1  ;; 0x2009c018
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable2  ;; 0x2009c000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x200000
        LDR.N    R2,??DataTable2  ;; 0x2009c000
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable2_1  ;; 0x2009c018
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x200000
        LDR.N    R2,??DataTable2_1  ;; 0x2009c018
        STR      R1,[R2, #+0]
//   91   UNSEL_CS_01;
        LDR.N    R1,??DataTable2_1  ;; 0x2009c018
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10000
        LDR.N    R2,??DataTable2_1  ;; 0x2009c018
        STR      R1,[R2, #+0]
//   92   UNSEL_CS_02;
        LDR.N    R1,??DataTable2_1  ;; 0x2009c018
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x200000
        LDR.N    R2,??DataTable2_1  ;; 0x2009c018
        STR      R1,[R2, #+0]
//   93   
//   94   // Configura a função SPI para os pinos
//   95   SCK_FUNC = 2;
        MOVS     R1,#+2
        LDR.N    R2,??DataTable2_2  ;; 0x4002c000
        LDR      R2,[R2, #+0]
        BFI      R2,R1,#+30,#+2
        LDR.N    R1,??DataTable2_2  ;; 0x4002c000
        STR      R2,[R1, #+0]
//   96   MISO_FUNC = 2;
        MOVS     R1,#+2
        LDR.N    R2,??DataTable2_3  ;; 0x4002c004
        LDR      R2,[R2, #+0]
        BFI      R2,R1,#+2,#+2
        LDR.N    R1,??DataTable2_3  ;; 0x4002c004
        STR      R2,[R1, #+0]
//   97   MOSI_FUNC = 2;
        MOVS     R1,#+2
        LDR.N    R2,??DataTable2_3  ;; 0x4002c004
        LDR      R2,[R2, #+0]
        BFI      R2,R1,#+4,#+2
        LDR.N    R1,??DataTable2_3  ;; 0x4002c004
        STR      R2,[R1, #+0]
//   98   
//   99   PCONP_bit.PCSSP0 = 1; // Ativa a alimentação do periférico
        LDR.N    R1,??DataTable2_4  ;; 0x400fc0c4
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x200000
        LDR.N    R2,??DataTable2_4  ;; 0x400fc0c4
        STR      R1,[R2, #+0]
//  100   PCLKSEL1_bit.PCLK_SSP0 = 1; // Ativa o clock do periférico
        MOVS     R1,#+1
        LDR.N    R2,??DataTable2_5  ;; 0x400fc1ac
        LDR      R2,[R2, #+0]
        BFI      R2,R1,#+10,#+2
        LDR.N    R1,??DataTable2_5  ;; 0x400fc1ac
        STR      R2,[R1, #+0]
//  101   
//  102   SSP0CR0_bit.DSS = 0x07; // 8 bits de dados
        MOVS     R1,#+7
        LDR.N    R2,??DataTable2_6  ;; 0x40088000
        LDR      R2,[R2, #+0]
        BFI      R2,R1,#+0,#+4
        LDR.N    R1,??DataTable2_6  ;; 0x40088000
        STR      R2,[R1, #+0]
//  103   SSP0CR0_bit.FRF = 0x00; // Frame em formato SPI
        LDR.N    R1,??DataTable2_6  ;; 0x40088000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x30
        LDR.N    R2,??DataTable2_6  ;; 0x40088000
        STR      R1,[R2, #+0]
//  104   SSP0CR0_bit.CPOL = 1; // Foi levantado que era assim na firmware da MX-485 
        LDR.N    R1,??DataTable2_6  ;; 0x40088000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x40
        LDR.N    R2,??DataTable2_6  ;; 0x40088000
        STR      R1,[R2, #+0]
//  105   SSP0CR0_bit.CPHA = 1; // tem que ver pq...
        LDR.N    R1,??DataTable2_6  ;; 0x40088000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x80
        LDR.N    R2,??DataTable2_6  ;; 0x40088000
        STR      R1,[R2, #+0]
//  106   
//  107   SSP0CR0_bit.SCR = divisor<<8;
        LSLS     R1,R0,#+8
        LDR.N    R2,??DataTable2_6  ;; 0x40088000
        LDR      R2,[R2, #+0]
        BICS     R2,R2,#0xFF00
        LDR.N    R3,??DataTable2_6  ;; 0x40088000
        STR      R2,[R3, #+0]
//  108   
//  109   SSP0CPSR = divisor;
        LDR.N    R2,??DataTable2_7  ;; 0x40088010
        STR      R0,[R2, #+0]
//  110   
//  111   SSP0CR1_bit.LBM = 0; // Modo normal, sem loopback
        LDR.N    R0,??DataTable2_8  ;; 0x40088004
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R2,??DataTable2_8  ;; 0x40088004
        STR      R0,[R2, #+0]
//  112   SSP0CR1_bit.SSE = 1; // Módulo habilitado
        LDR.N    R0,??DataTable2_8  ;; 0x40088004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R2,??DataTable2_8  ;; 0x40088004
        STR      R0,[R2, #+0]
//  113   SSP0CR1_bit.MS  = 0; // Modo mestre
        LDR.N    R0,??DataTable2_8  ;; 0x40088004
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R2,??DataTable2_8  ;; 0x40088004
        STR      R0,[R2, #+0]
//  114   SSP0CR1_bit.SOD = 0; // É dummy nesse modo
        LDR.N    R0,??DataTable2_8  ;; 0x40088004
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x8
        LDR.N    R2,??DataTable2_8  ;; 0x40088004
        STR      R0,[R2, #+0]
//  115     
//  116   for(unsigned int i=0;i<8;i++)
        MOVS     R0,#+0
        B.N      ??SPIWRAPPER_init_0
//  117     dummy = SSP0DR;  
??SPIWRAPPER_init_1:
        LDR.N    R1,??DataTable2_9
        LDR.N    R2,??DataTable2_10  ;; 0x40088008
        LDR      R2,[R2, #+0]
        STRB     R2,[R1, #+0]
        ADDS     R0,R0,#+1
??SPIWRAPPER_init_0:
        CMP      R0,#+8
        BCC.N    ??SPIWRAPPER_init_1
//  118 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_FIO0DIR
        REQUIRE _A_FIO0SET
        REQUIRE _A_PINSEL0
        REQUIRE _A_PINSEL1
        REQUIRE _A_PCONP
        REQUIRE _A_PCLKSEL1
        REQUIRE _A_SSP0CR0
        REQUIRE _A_SSP0CPSR
        REQUIRE _A_SSP0CR1
        REQUIRE _A_SSP0DR
//  119 /***********************************************************************************
//  120 *       Descrição     :    Escreve um buffer de dados na SPI  
//  121 *       Parametros    :   (unsigned char*) buffer de dados
//  122 *                         (unsigned int) tamanho do buffer
//  123 *       Retorno       :   nenhum
//  124 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SPI_sendBytes
          CFI NoCalls
        THUMB
//  125 void SPI_sendBytes(unsigned char *buffer,unsigned int size){
//  126     
//  127   if(size==0){
SPI_sendBytes:
        CMP      R1,#+0
        BNE.N    ??SPI_sendBytes_0
//  128     return;
        B.N      ??SPI_sendBytes_1
//  129   }
//  130   
//  131   while(size){
//  132     
//  133     while(! (SSP0SR & 0x02));//Se está setado é pq o buffer está cheio
??SPI_sendBytes_2:
        LDR.N    R2,??DataTable2_11  ;; 0x4008800c
        LDR      R2,[R2, #+0]
        LSLS     R2,R2,#+30
        BPL.N    ??SPI_sendBytes_2
//  134     SSP0DR = *buffer;
        LDRB     R2,[R0, #+0]
        LDR.N    R3,??DataTable2_10  ;; 0x40088008
        STR      R2,[R3, #+0]
//  135     while(! (SSP0SR & 0x04));//
??SPI_sendBytes_3:
        LDR.N    R2,??DataTable2_11  ;; 0x4008800c
        LDR      R2,[R2, #+0]
        LSLS     R2,R2,#+29
        BPL.N    ??SPI_sendBytes_3
//  136     dummy = SSP0DR;
        LDR.N    R2,??DataTable2_9
        LDR.N    R3,??DataTable2_10  ;; 0x40088008
        LDR      R3,[R3, #+0]
        STRB     R3,[R2, #+0]
//  137     size--;
        SUBS     R1,R1,#+1
//  138     buffer++;                
        ADDS     R0,R0,#+1
//  139   }      
??SPI_sendBytes_0:
        CMP      R1,#+0
        BNE.N    ??SPI_sendBytes_2
//  140 }
??SPI_sendBytes_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_SSP0SR
        REQUIRE _A_SSP0DR
//  141 /***********************************************************************************
//  142 *       Descrição     :    Lê um pacote de dados da SPI
//  143 *       Parametros    :   (unsigned char*) buffer de dados
//  144 *                         (unsigned int) tamanho do buffer
//  145 *       Retorno       :   nenhum
//  146 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SPI_getBytes
          CFI NoCalls
        THUMB
//  147 void SPI_getBytes(unsigned char *buffer,unsigned int size){
SPI_getBytes:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  148  
//  149   for(unsigned int i=0;i<size;i++){
        MOVS     R2,#+0
        B.N      ??SPI_getBytes_0
//  150    
//  151     SSP0DR = 0xFF;//Dummy write, na verdade gera os clocks para ler os dados
??SPI_getBytes_1:
        LDR.N    R3,??DataTable2_10  ;; 0x40088008
        MOVS     R4,#+255
        STR      R4,[R3, #+0]
//  152     while( SSP0SR & 0x10);//Aguarda finalizar o envio do byte em questão
??SPI_getBytes_2:
        LDR.N    R3,??DataTable2_11  ;; 0x4008800c
        LDR      R3,[R3, #+0]
        LSLS     R3,R3,#+27
        BMI.N    ??SPI_getBytes_2
//  153     *buffer = SSP0DR;
        LDR.N    R3,??DataTable2_10  ;; 0x40088008
        LDR      R3,[R3, #+0]
        STRB     R3,[R0, #+0]
//  154     buffer++;      
        ADDS     R0,R0,#+1
//  155   }     
        ADDS     R2,R2,#+1
??SPI_getBytes_0:
        CMP      R2,R1
        BCC.N    ??SPI_getBytes_1
//  156 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
        REQUIRE _A_SSP0DR
        REQUIRE _A_SSP0SR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x2009c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x2009c018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x4002c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x4002c004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x400fc0c4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x400fc1ac

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x40088000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x40088010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x40088004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     dummy

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x40088008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x4008800c

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  157 /***********************************************************************************
//  158 *       Fim do arquivo
//  159 ***********************************************************************************/
// 
//   1 byte  in section .bss
//  44 bytes in section .noinit (abs)
// 414 bytes in section .text
// 
// 414 bytes of CODE memory
//   1 byte  of DATA memory (+ 44 bytes shared)
//
//Errors: none
//Warnings: none
