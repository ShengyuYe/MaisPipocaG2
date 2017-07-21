///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     21/Jul/2017  15:53:28 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\MDB\mdb_uart.c                  /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\MDB\mdb_uart.c -lC              /
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
//                    pocaG2\SOFTWARE\Debug\List\mdb_uart.s                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME mdb_uart

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN UART_init
        EXTERN vTaskDelay

        PUBLIC MDBAURT_sleep
        PUBLIC MDBUART_buffer_in
        PUBLIC MDBUART_bytes_recebidos
        PUBLIC MDBUART_bytes_to_send
        PUBLIC MDBUART_envia_pacote
        PUBLIC MDBUART_get_bytes_recebidos
        PUBLIC MDBUART_has_new_package
        PUBLIC MDBUART_ini
        PUBLIC MDBUART_irq
        PUBLIC MDBUART_le_pacote
        PUBLIC MDBUART_novo_pacote
        PUBLIC MDBUART_pOut
        PUBLIC MDBUART_silent_time
        PUBLIC U2RBRTHR
        PUBLIC _A_CLRPEND0
        PUBLIC _A_U2FCR
        PUBLIC _A_U2LCR
        PUBLIC _A_U2LSR
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\MDB\mdb_uart.c
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
//   17 |       Arquivo            :  mdb_uart.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  25/02/2017
//   21 |
//   22 |       Revisões           :  001
//   23 |
//   24 |
//   25 | __________________________________________________________________________________
//   26 */
//   27 
//   28 /***********************************************************************************
//   29 *       Includes
//   30 ***********************************************************************************/
//   31 #include <nxp\iolpc1768.h>

        ASEGN `.noinit`:DATA:NOROOT,0e000e280H
        SECTION_GROUP _A_CLRPEND0
// __absolute union <unnamed> volatile _A_CLRPEND0
_A_CLRPEND0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040098000H
        SECTION_GROUP U2RBRTHR
// __absolute unsigned char volatile U2RBRTHR
U2RBRTHR:
        DS8 1

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

        ASEGN `.noinit`:DATA:NOROOT,040098014H
        SECTION_GROUP _A_U2LSR
// __absolute union <unnamed> const volatile _A_U2LSR
_A_U2LSR:
        DS8 1
//   32 #include <stdio.h>
//   33 #include <stdlib.h>
//   34 #include <string.h>
//   35 #include "..\..\includes.h"
//   36 
//   37 /***********************************************************************************
//   38 *       Definições locais
//   39 ***********************************************************************************/
//   40 #define TAM_BUF_IN                              50
//   41 #define RELOAD_SILENT_TIME                      5
//   42 /***********************************************************************************
//   43 *       Variaveis locais
//   44 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   45 unsigned char *MDBUART_pOut=NULL;
MDBUART_pOut:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   46 unsigned char MDBUART_bytes_to_send=0;
MDBUART_bytes_to_send:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   47 unsigned char MDBUART_buffer_in[TAM_BUF_IN];
MDBUART_buffer_in:
        DS8 52

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   48 unsigned char MDBUART_bytes_recebidos=0;
MDBUART_bytes_recebidos:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   49 unsigned char MDBUART_novo_pacote=0;
MDBUART_novo_pacote:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   50 unsigned char MDBUART_silent_time=0;
MDBUART_silent_time:
        DS8 1
//   51 /***********************************************************************************
//   52 *       Funções locais
//   53 ***********************************************************************************/
//   54 
//   55 
//   56 /***********************************************************************************
//   57 *       Implementação das funções
//   58 ***********************************************************************************/
//   59 
//   60 /***********************************************************************************
//   61 *       Descrição       :       Inicialização do módulo
//   62 *       Parametros      :       nenhum
//   63 *       Retorno         :       nenhum
//   64 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MDBUART_ini
        THUMB
//   65 void MDBUART_ini(void){
MDBUART_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   66   
//   67   UART_init(2,9600,NULL,NULL,NULL);    
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOV      R1,#+9600
        MOVS     R0,#+2
          CFI FunCall UART_init
        BL       UART_init
//   68 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   69 /***********************************************************************************
//   70 *       Descrição       :       Função de tratamento da interrupção de TX
//   71 *                               da uart que atende ao protocolo MDB
//   72 *       Parametros      :       nenhum
//   73 *       Retorno         :       nenhum
//   74 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MDBUART_irq
          CFI NoCalls
        THUMB
//   75 void MDBUART_irq(void){  
//   76   unsigned char dummy;
//   77         
//   78   switch(U2IIR_bit.IID){
MDBUART_irq:
        LDR.N    R0,??DataTable4  ;; 0x40098008
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        ANDS     R0,R0,#0x7
        CMP      R0,#+1
        BEQ.N    ??MDBUART_irq_0
        CMP      R0,#+2
        BEQ.N    ??MDBUART_irq_1
        CMP      R0,#+3
        BEQ.N    ??MDBUART_irq_2
        CMP      R0,#+6
        BEQ.N    ??MDBUART_irq_2
        B.N      ??MDBUART_irq_3
//   79     case THRE:                  
//   80                U2LCR_bit.PE = 1; // Habilita o bit de paridade
??MDBUART_irq_0:
        LDR.N    R0,??DataTable4_1  ;; 0x4009800c
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable4_1  ;; 0x4009800c
        STRB     R0,[R1, #+0]
//   81                
//   82                if(MDBUART_bytes_to_send){
        LDR.N    R0,??DataTable4_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??MDBUART_irq_4
//   83                  U2LCR_bit.PS = 0x03; // Força em 0                             
        LDR.N    R0,??DataTable4_1  ;; 0x4009800c
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x30
        LDR.N    R1,??DataTable4_1  ;; 0x4009800c
        STRB     R0,[R1, #+0]
//   84                  MDBUART_bytes_to_send--;
        LDR.N    R0,??DataTable4_2
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable4_2
        STRB     R0,[R1, #+0]
//   85                  U2THR = *MDBUART_pOut++;  
        LDR.N    R0,??DataTable4_3  ;; 0x40098000
        LDR.N    R1,??DataTable4_4
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, #+0]
        STRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable4_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable4_4
        STR      R0,[R1, #+0]
//   86                  MDBUART_silent_time = 250;
        LDR.N    R0,??DataTable4_5
        MOVS     R1,#+250
        STRB     R1,[R0, #+0]
        B.N      ??MDBUART_irq_5
//   87                }          
//   88                else{
//   89                  U2LCR_bit.PS = 0x03; // Paridade par
??MDBUART_irq_4:
        LDR.N    R0,??DataTable4_1  ;; 0x4009800c
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x30
        LDR.N    R1,??DataTable4_1  ;; 0x4009800c
        STRB     R0,[R1, #+0]
//   90                  MDBUART_silent_time = 250;
        LDR.N    R0,??DataTable4_5
        MOVS     R1,#+250
        STRB     R1,[R0, #+0]
//   91                }
//   92                
//   93                break; 
??MDBUART_irq_5:
        B.N      ??MDBUART_irq_3
//   94     case RDA : 
//   95                if(U2LSR_bit.PE)
??MDBUART_irq_1:
        LDR.N    R0,??DataTable4_6  ;; 0x40098014
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??MDBUART_irq_6
//   96                  MDBUART_novo_pacote = 1;
        LDR.N    R0,??DataTable4_7
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//   97                
//   98                dummy = U2RBR;               
??MDBUART_irq_6:
        LDR.N    R0,??DataTable4_3  ;; 0x40098000
        LDRB     R0,[R0, #+0]
//   99     
//  100                if(MDBUART_bytes_recebidos<(TAM_BUF_IN-1))
        LDR.N    R1,??DataTable4_8
        LDRB     R1,[R1, #+0]
        CMP      R1,#+49
        BGE.N    ??MDBUART_irq_7
//  101                  MDBUART_buffer_in[MDBUART_bytes_recebidos++] = dummy; 
        LDR.N    R1,??DataTable4_8
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable4_9
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable4_8
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable4_8
        STRB     R0,[R1, #+0]
//  102                
//  103                break;      
??MDBUART_irq_7:
        B.N      ??MDBUART_irq_3
//  104     case RLS : 
//  105     case CTI :
//  106                dummy = U2LSR;         
??MDBUART_irq_2:
        LDR.N    R0,??DataTable4_6  ;; 0x40098014
        LDRB     R0,[R0, #+0]
//  107                dummy = U2RBR;         
        LDR.N    R1,??DataTable4_3  ;; 0x40098000
        LDRB     R1,[R1, #+0]
        MOVS     R0,R1
//  108                break;      
//  109   }  
//  110   
//  111   //Apaga o flag de interrupção pendente
//  112   CLRPEND0 |= (0x01)<<7;               
??MDBUART_irq_3:
        LDR.N    R0,??DataTable4_10  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable4_10  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  113 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_U2LCR
        REQUIRE U2RBRTHR
        REQUIRE _A_U2LSR
        REQUIRE _A_U2FCR
        REQUIRE _A_CLRPEND0
//  114 /***********************************************************************************
//  115 *       Descrição       :       Envia um pacote de dados através da uart
//  116 *                               MDB
//  117 *       Parametros      :       (unsigned char*) ponteiro para o buffer
//  118 *       Retorno         :       nenhum
//  119 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MDBUART_envia_pacote
          CFI NoCalls
        THUMB
//  120 void MDBUART_envia_pacote(unsigned char modo,unsigned char*pacote,
//  121                           unsigned short int tamanho){
MDBUART_envia_pacote:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  122                            
//  123   U2LCR_bit.PE = 1; // Habilita o bit de paridade
        LDR.N    R3,??DataTable4_1  ;; 0x4009800c
        LDRB     R3,[R3, #+0]
        ORRS     R3,R3,#0x8
        LDR.N    R4,??DataTable4_1  ;; 0x4009800c
        STRB     R3,[R4, #+0]
//  124   if(modo)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??MDBUART_envia_pacote_0
//  125     U2LCR_bit.PS = 0x02; // Força em 1
        MOVS     R0,#+2
        LDR.N    R3,??DataTable4_1  ;; 0x4009800c
        LDRB     R3,[R3, #+0]
        BFI      R3,R0,#+4,#+2
        LDR.N    R0,??DataTable4_1  ;; 0x4009800c
        STRB     R3,[R0, #+0]
        B.N      ??MDBUART_envia_pacote_1
//  126   else
//  127     U2LCR_bit.PS = 0x03; // Força em 0
??MDBUART_envia_pacote_0:
        LDR.N    R0,??DataTable4_1  ;; 0x4009800c
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x30
        LDR.N    R3,??DataTable4_1  ;; 0x4009800c
        STRB     R0,[R3, #+0]
//  128   
//  129   MDBUART_bytes_recebidos = 0;
??MDBUART_envia_pacote_1:
        LDR.N    R0,??DataTable4_8
        MOVS     R3,#+0
        STRB     R3,[R0, #+0]
//  130   MDBUART_novo_pacote = 0;
        LDR.N    R0,??DataTable4_7
        MOVS     R3,#+0
        STRB     R3,[R0, #+0]
//  131   MDBUART_pOut = (pacote+1);
        ADDS     R0,R1,#+1
        LDR.N    R3,??DataTable4_4
        STR      R0,[R3, #+0]
//  132   MDBUART_bytes_to_send = tamanho-1;
        SUBS     R0,R2,#+1
        LDR.N    R2,??DataTable4_2
        STRB     R0,[R2, #+0]
//  133   U2THR = *pacote;  
        LDR.N    R0,??DataTable4_3  ;; 0x40098000
        LDRB     R1,[R1, #+0]
        STRB     R1,[R0, #+0]
//  134 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
        REQUIRE _A_U2LCR
        REQUIRE U2RBRTHR
//  135 /***********************************************************************************
//  136 *       Descrição       :       Lê um pacote do buffer do protocolo MDB
//  137 *       Parametros      :       (unsigned char*) ponteiro para o buffer
//  138 *                               (unsigned char) tamanho da bloco lido
//  139 *       Retorno         :      
//  140 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MDBUART_le_pacote
          CFI NoCalls
        THUMB
//  141 void MDBUART_le_pacote(unsigned char *pData,unsigned char tamanho){
//  142   
//  143   for(unsigned char i=0;i<tamanho;i++)
MDBUART_le_pacote:
        MOVS     R2,#+0
        B.N      ??MDBUART_le_pacote_0
//  144     pData[i] = MDBUART_buffer_in[i];
??MDBUART_le_pacote_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R3,??DataTable4_9
        LDRB     R3,[R2, R3]
        STRB     R3,[R2, R0]
        ADDS     R2,R2,#+1
??MDBUART_le_pacote_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R2,R1
        BCC.N    ??MDBUART_le_pacote_1
//  145 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  146 /***********************************************************************************
//  147 *       Descrição       :       Getter para o contador de bytes recebidos
//  148 *       Parametros      :       nenhum
//  149 *       Retorno         :       nenhum
//  150 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MDBUART_get_bytes_recebidos
          CFI NoCalls
        THUMB
//  151 unsigned char MDBUART_get_bytes_recebidos(void){
//  152   
//  153   return MDBUART_bytes_recebidos;
MDBUART_get_bytes_recebidos:
        LDR.N    R0,??DataTable4_8
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  154 }
//  155 /***********************************************************************************
//  156 *       Descrição       :       Getter para o flag que indica que há um novo
//  157 *                               pacote no buffer
//  158 *       Parametros      :       nenhum
//  159 *       Retorno         :       (unsigned char) maior do que zero se houver
//  160 *                               um novo pacote no buffer
//  161 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MDBUART_has_new_package
          CFI NoCalls
        THUMB
//  162 unsigned char MDBUART_has_new_package(void){
//  163   
//  164   return MDBUART_novo_pacote;
MDBUART_has_new_package:
        LDR.N    R0,??DataTable4_7
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  165 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x40098008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x4009800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     MDBUART_bytes_to_send

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40098000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     MDBUART_pOut

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     MDBUART_silent_time

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x40098014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     MDBUART_novo_pacote

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     MDBUART_bytes_recebidos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     MDBUART_buffer_in

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     0xe000e280
//  166 /***********************************************************************************
//  167 *       Descrição       :       Delay 
//  168 *       Parametros      :       N ciclos de 1 milisegundo
//  169 *       Retorno         :       nenhum
//  170 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MDBAURT_sleep
        THUMB
//  171 void MDBAURT_sleep(unsigned short int cicles){
MDBAURT_sleep:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  172   
//  173   vTaskDelay(cicles);
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  174 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  175 /***********************************************************************************
//  176 *       Fim do arquivo
//  177 ***********************************************************************************/
// 
//  60 bytes in section .bss
//  11 bytes in section .noinit (abs)
// 390 bytes in section .text
// 
// 390 bytes of CODE memory
//  60 bytes of DATA memory (+ 11 bytes shared)
//
//Errors: none
//Warnings: none
