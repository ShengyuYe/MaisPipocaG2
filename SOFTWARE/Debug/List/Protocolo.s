///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     10/Jul/2017  15:28:15 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Protocolo\Protocolo.c           /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Protocolo\Protocolo.c -lC       /
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
//                    pocaG2\SOFTWARE\Debug\List\Protocolo.s                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Protocolo

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", ""
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN UART_init
        EXTERN sprintf
        EXTERN vTaskDelay

        PUBLIC PROTOCOLO_bufferRx
        PUBLIC PROTOCOLO_bufferTmp
        PUBLIC PROTOCOLO_bufferTx
        PUBLIC PROTOCOLO_bytesEnviados
        PUBLIC PROTOCOLO_bytesNoBufferTx
        PUBLIC PROTOCOLO_bytesParaEnviar
        PUBLIC PROTOCOLO_bytesRecebidos
        PUBLIC PROTOCOLO_checksum
        PUBLIC PROTOCOLO_enviaDadosDireto
        PUBLIC PROTOCOLO_enviaPacote
        PUBLIC PROTOCOLO_get_device
        PUBLIC PROTOCOLO_ini
        PUBLIC PROTOCOLO_intVect
        PUBLIC PROTOCOLO_main
        PUBLIC PROTOCOLO_novoPacote
        PUBLIC PROTOCOLO_timerTick
        PUBLIC U3RBRTHR
        PUBLIC _A_CLRPEND0
        PUBLIC _A_U3FCR
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\Protocolo\Protocolo.c
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
//   17 |       Arquivo            :  Protocolo.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  21/02/2014
//   21 |
//   22 |       Revisões           :  1.0.0.0
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

        ASEGN `.noinit`:DATA:NOROOT,04009c000H
        SECTION_GROUP U3RBRTHR
// __absolute unsigned char volatile U3RBRTHR
U3RBRTHR:
        DS8 1

        ASEGN `.noinit`:DATA:NOROOT,04009c008H
        SECTION_GROUP _A_U3FCR
// __absolute union <unnamed> volatile _A_U3FCR
_A_U3FCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04009c014H
        SECTION_GROUP _A_U3LSR
// __absolute union <unnamed> const volatile _A_U3LSR
_A_U3LSR:
        DS8 1
//   32 #include <stdio.h>
//   33 #include <stdlib.h>
//   34 #include <string.h>
//   35 #include "protocolo.h"
//   36 #include "..\..\includes.h"
//   37 
//   38 /***********************************************************************************
//   39 *       Definições locais
//   40 ***********************************************************************************/
//   41 #define TAM_BUF_TX                              1024
//   42 #define TAM_BUF_RX                              128
//   43 
//   44 #define STX                                     0x02
//   45 #define ETX                                     0x03
//   46 #define DLE                                     0x10
//   47 
//   48 /***********************************************************************************
//   49 *       Variaveis locais
//   50 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   51 unsigned char PROTOCOLO_bufferTx[TAM_BUF_TX];
PROTOCOLO_bufferTx:
        DS8 1024

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   52 unsigned char PROTOCOLO_bufferRx[TAM_BUF_RX];
PROTOCOLO_bufferRx:
        DS8 128

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   53 unsigned char PROTOCOLO_bufferTmp[TAM_BUF_TX];
PROTOCOLO_bufferTmp:
        DS8 1024

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   54 unsigned char PROTOCOLO_bytesRecebidos;
PROTOCOLO_bytesRecebidos:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   55 unsigned char PROTOCOLO_bytesParaEnviar;
PROTOCOLO_bytesParaEnviar:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   56 unsigned char PROTOCOLO_bytesEnviados;
PROTOCOLO_bytesEnviados:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   57 unsigned char PROTOCOLO_novoPacote=0;
PROTOCOLO_novoPacote:
        DS8 1
//   58 
//   59 
//   60 /***********************************************************************************
//   61 *       Funções locais
//   62 ***********************************************************************************/
//   63 void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho);
//   64 unsigned char PROTOCOLO_checksum(unsigned char*pData,unsigned short int tamanho);
//   65 void PROTOCOLO_get_device(void);
//   66 
//   67 /***********************************************************************************
//   68 *       Implementação das funções
//   69 ***********************************************************************************/
//   70 
//   71 /***********************************************************************************
//   72 *       Descrição       :       Inicialização da biblioteca
//   73 *       Parametros      :       nenhum
//   74 *       Retorno         :       nenhum
//   75 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function PROTOCOLO_ini
        THUMB
//   76 void PROTOCOLO_ini(void){
PROTOCOLO_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   77   
//   78   UART_init(3,119200,NULL,NULL,NULL);    
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDR.N    R1,??DataTable6  ;; 0x1d1a0
        MOVS     R0,#+3
          CFI FunCall UART_init
        BL       UART_init
//   79 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   80 /***********************************************************************************
//   81 *       Descrição       :       Função para tratamento da interrupção
//   82 *                               da uart3
//   83 *       Parametros      :       nenhum
//   84 *       Retorno         :       nenhum
//   85 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PROTOCOLO_intVect
          CFI NoCalls
        THUMB
//   86 void PROTOCOLO_intVect(void){  
//   87   static unsigned char ultimoRecebido=0;
//   88   unsigned char dummy;
//   89   
//   90   switch(U3IIR_bit.IID){
PROTOCOLO_intVect:
        LDR.N    R0,??DataTable6_1  ;; 0x4009c008
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        ANDS     R0,R0,#0x7
        CMP      R0,#+1
        BEQ.N    ??PROTOCOLO_intVect_0
        CMP      R0,#+2
        BEQ.N    ??PROTOCOLO_intVect_1
        CMP      R0,#+3
        BEQ.W    ??PROTOCOLO_intVect_2
        CMP      R0,#+6
        BEQ.W    ??PROTOCOLO_intVect_3
        B.N      ??PROTOCOLO_intVect_4
//   91     case THRE:
//   92                if(PROTOCOLO_bytesParaEnviar){
??PROTOCOLO_intVect_0:
        LDR.N    R0,??DataTable6_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PROTOCOLO_intVect_5
//   93                  U3THR = PROTOCOLO_bufferTx[PROTOCOLO_bytesEnviados++];
        LDR.N    R0,??DataTable6_3
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable6_4
        LDRB     R0,[R0, R1]
        LDR.N    R1,??DataTable6_5  ;; 0x4009c000
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable6_3
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_3
        STRB     R0,[R1, #+0]
//   94                  PROTOCOLO_bytesParaEnviar--;
        LDR.N    R0,??DataTable6_2
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable6_2
        STRB     R0,[R1, #+0]
//   95                }
//   96                break; 
??PROTOCOLO_intVect_5:
        B.N      ??PROTOCOLO_intVect_4
//   97     case RDA : dummy = U3RBR;
??PROTOCOLO_intVect_1:
        LDR.N    R0,??DataTable6_5  ;; 0x4009c000
        LDRB     R0,[R0, #+0]
//   98                switch(dummy){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        CMP      R1,#+2
        BEQ.N    ??PROTOCOLO_intVect_6
        CMP      R1,#+3
        BEQ.N    ??PROTOCOLO_intVect_7
        CMP      R1,#+16
        BEQ.N    ??PROTOCOLO_intVect_8
        B.N      ??PROTOCOLO_intVect_9
//   99                  case STX: // Quando receber [DLE]+[STX] - marca inicio de novo pacote
//  100                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_6:
        LDR.N    R1,??DataTable6_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_10
//  101                              PROTOCOLO_bytesRecebidos = 0;
        LDR.N    R0,??DataTable6_7
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  102                              ultimoRecebido = 255;
        LDR.N    R0,??DataTable6_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_11
//  103                            }
//  104                            else{
//  105                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_10:
        LDR.N    R1,??DataTable6_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_12
//  106                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
        LDR.N    R1,??DataTable6_7
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable6_8
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable6_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
//  107                              
//  108                              ultimoRecebido = STX;
??PROTOCOLO_intVect_12:
        LDR.N    R0,??DataTable6_6
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  109                            }
//  110                            
//  111                            break;
??PROTOCOLO_intVect_11:
        B.N      ??PROTOCOLO_intVect_13
//  112                  case ETX: // Quando receber [DLE]+[ETX] - marca fim do novo pacote
//  113                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_7:
        LDR.N    R1,??DataTable6_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_14
//  114                              PROTOCOLO_novoPacote = 255;
        LDR.N    R0,??DataTable6_9
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
//  115                              ultimoRecebido = 255;
        LDR.N    R0,??DataTable6_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_15
//  116                            }
//  117                            else{
//  118                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_14:
        LDR.N    R1,??DataTable6_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_16
//  119                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
        LDR.N    R1,??DataTable6_7
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable6_8
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable6_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
//  120                              
//  121                              ultimoRecebido = ETX;
??PROTOCOLO_intVect_16:
        LDR.N    R0,??DataTable6_6
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  122                            }                   
//  123                            break;
??PROTOCOLO_intVect_15:
        B.N      ??PROTOCOLO_intVect_13
//  124                  case DLE: // Quando receber [DLE]+[DLE] recebe 0x10 dentro do buffer
//  125                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_8:
        LDR.N    R1,??DataTable6_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_17
//  126                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1))
        LDR.N    R1,??DataTable6_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_18
//  127                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;
        LDR.N    R1,??DataTable6_7
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable6_8
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable6_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
//  128                              ultimoRecebido = 255;
??PROTOCOLO_intVect_18:
        LDR.N    R0,??DataTable6_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_19
//  129                            }                      
//  130                            else
//  131                              ultimoRecebido = DLE;
??PROTOCOLO_intVect_17:
        LDR.N    R0,??DataTable6_6
        MOVS     R1,#+16
        STRB     R1,[R0, #+0]
//  132                            break;
??PROTOCOLO_intVect_19:
        B.N      ??PROTOCOLO_intVect_13
//  133                  default :
//  134                            if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_9:
        LDR.N    R1,??DataTable6_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_20
//  135                              PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                                            
        LDR.N    R1,??DataTable6_7
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable6_8
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable6_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
//  136                            break;
//  137                }
//  138                
//  139                //ultimoRecebido = dummy;
//  140                break;      
??PROTOCOLO_intVect_20:
??PROTOCOLO_intVect_13:
        B.N      ??PROTOCOLO_intVect_4
//  141     case RLS : 
//  142                dummy = U3LSR;
??PROTOCOLO_intVect_2:
        LDR.N    R0,??DataTable6_10  ;; 0x4009c014
        LDRB     R0,[R0, #+0]
//  143                dummy = U3RBR;               
        LDR.N    R1,??DataTable6_5  ;; 0x4009c000
        LDRB     R1,[R1, #+0]
        MOVS     R0,R1
//  144                break;      
        B.N      ??PROTOCOLO_intVect_4
//  145     case CTI :
//  146                break;      
//  147   }  
//  148   
//  149   //Apaga o flag de interrupção pendente
//  150   CLRPEND0 |= (0x01)<<5;       
??PROTOCOLO_intVect_3:
??PROTOCOLO_intVect_4:
        LDR.N    R0,??DataTable6_11  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable6_11  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  151 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE U3RBRTHR
        REQUIRE _A_U3LSR
        REQUIRE _A_U3FCR
        REQUIRE _A_CLRPEND0

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??ultimoRecebido:
        DS8 1
//  152 /***********************************************************************************
//  153 *       Descrição       :       Tick de timer para a biblioteca do protocolo
//  154 *       Parametros      :       nenhum
//  155 *       Retorno         :       nenhum
//  156 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PROTOCOLO_timerTick
          CFI NoCalls
        THUMB
//  157 void PROTOCOLO_timerTick(void){
//  158   
//  159   
//  160   
//  161 }
PROTOCOLO_timerTick:
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  162 /***********************************************************************************
//  163 *       Descrição       :       Calcula o checksum de um pacote de dados
//  164 *       Parametros      :       (unsigned char*) ponteiro para o início do pacote
//  165 *                               (unsigned short int) tamanho do pacote
//  166 *       Retorno         :       (unsigned char) checksum do pacote
//  167 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PROTOCOLO_checksum
          CFI NoCalls
        THUMB
//  168 unsigned char PROTOCOLO_checksum(unsigned char*pData,unsigned short int tamanho){
PROTOCOLO_checksum:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  169   unsigned short int soma=0;
        MOVS     R2,#+0
//  170 
//  171   for(unsigned short int i=0;i<tamanho;i++)
        MOVS     R3,#+0
        B.N      ??PROTOCOLO_checksum_0
//  172     soma+= pData[i];
??PROTOCOLO_checksum_1:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRB     R4,[R3, R0]
        ADDS     R2,R4,R2
        ADDS     R3,R3,#+1
??PROTOCOLO_checksum_0:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R3,R1
        BCC.N    ??PROTOCOLO_checksum_1
//  173   
//  174   return (unsigned char)(256-soma);    
        RSBS     R0,R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  175 }
//  176 /***********************************************************************************
//  177 *       Descrição       :       Thread do protocolo
//  178 *       Protocolo       :       (void*) pPar
//  179 *       Retorno         :       nenhum
//  180 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PROTOCOLO_main
        THUMB
//  181 void PROTOCOLO_main(void*pPar){
PROTOCOLO_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  182   
//  183   PROTOCOLO_ini();
          CFI FunCall PROTOCOLO_ini
        BL       PROTOCOLO_ini
        B.N      ??PROTOCOLO_main_0
//  184   
//  185   for(;;){        
//  186     
//  187     if(PROTOCOLO_novoPacote){
//  188       
//  189       PROTOCOLO_novoPacote = 0;
//  190       if(PROTOCOLO_checksum(PROTOCOLO_bufferRx,PROTOCOLO_bufferRx[1]-1)==PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos-1]){      
//  191         switch(PROTOCOLO_bufferRx[0]){      
//  192           case DXTNET_GET_DEVICE:
//  193                PROTOCOLO_get_device();
//  194                break;
//  195           case DXTNET_READ_PARAMETERS:
//  196                break;
//  197           case DXTNET_WRITE_PARAMETERS:
//  198                break;
//  199           case DXTNET_READ_FILE_TABLE:
//  200                break;
//  201           case DXTNET_WRITE_FILE_TABLE:
//  202                break;
//  203           case DXTNET_DELETE_FILE_TABLE:
//  204                break;
//  205           case DXTNET_READ_FILE:
//  206                break;
//  207           case DXTNET_WRITE_FILE:
//  208                break;
//  209         }    
//  210       }
//  211     }
//  212     vTaskDelay(1);
??PROTOCOLO_main_1:
??PROTOCOLO_main_2:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??PROTOCOLO_main_0:
        LDR.N    R0,??DataTable6_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PROTOCOLO_main_2
        LDR.N    R0,??DataTable6_9
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_8
        LDRB     R0,[R0, #+1]
        SUBS     R1,R0,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable6_8
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.N    R1,??DataTable6_7
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable6_8
        ADDS     R1,R1,R2
        LDRB     R1,[R1, #-1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BNE.N    ??PROTOCOLO_main_2
        LDR.N    R0,??DataTable6_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+16
        BEQ.N    ??PROTOCOLO_main_3
        BCC.N    ??PROTOCOLO_main_2
        CMP      R0,#+18
        BEQ.N    ??PROTOCOLO_main_4
        BCC.N    ??PROTOCOLO_main_5
        CMP      R0,#+20
        BEQ.N    ??PROTOCOLO_main_6
        BCC.N    ??PROTOCOLO_main_7
        CMP      R0,#+22
        BEQ.N    ??PROTOCOLO_main_8
        BCC.N    ??PROTOCOLO_main_9
        CMP      R0,#+23
        BEQ.N    ??PROTOCOLO_main_1
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_3:
          CFI FunCall PROTOCOLO_get_device
        BL       PROTOCOLO_get_device
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_5:
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_4:
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_7:
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_6:
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_9:
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_8:
        B.N      ??PROTOCOLO_main_2
          CFI EndBlock cfiBlock4
//  213   }    
//  214 }
//  215 /***********************************************************************************
//  216 *       Descrição       :       Faz a decodificação do comando getdevice
//  217 *       Parametros      :       nenhum
//  218 *       Retorno         :       nenhum
//  219 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function PROTOCOLO_get_device
        THUMB
//  220 void PROTOCOLO_get_device(void){
PROTOCOLO_get_device:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  221   
//  222   PROTOCOLO_bufferTmp[0]  = DXTNET_GET_DEVICE;
        LDR.N    R0,??DataTable6_12
        MOVS     R1,#+16
        STRB     R1,[R0, #+0]
//  223   PROTOCOLO_bufferTmp[2]  = DXTNET_MAIS_PIPOCA_G2;
        LDR.N    R0,??DataTable6_12
        MOVS     R1,#+2
        STRB     R1,[R0, #+2]
//  224   
//  225   sprintf((char*)&PROTOCOLO_bufferTmp[3],STRING_VERSAO_PROTOCOLO);
        LDR.N    R1,??DataTable6_13
        LDR.N    R0,??DataTable6_14
          CFI FunCall sprintf
        BL       sprintf
//  226   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,21);  
        MOVS     R1,#+21
        LDR.N    R0,??DataTable6_12
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  227 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
//  228 /***********************************************************************************
//  229 *       Descrição       :       Encapsula os dados que serão enviados
//  230 *                               pela rede
//  231 *       Parametros      :       (unsigned char*) ponteiro para os dados que serão
//  232 *                                               enviados
//  233 *       Retorno         :       nenhum
//  234 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function PROTOCOLO_enviaPacote
        THUMB
//  235 void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho){
PROTOCOLO_enviaPacote:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  236   unsigned char indice=0;
        MOVS     R6,#+0
//  237   
//  238   pData[1] = tamanho;
        STRB     R5,[R4, #+1]
//  239   pData[tamanho-1] = PROTOCOLO_checksum(pData,tamanho-1);
        SUBS     R1,R5,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R1,R5,R4
        STRB     R0,[R1, #-1]
//  240   
//  241   PROTOCOLO_bufferTx[indice++] = DLE;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable6_4
        MOVS     R1,#+16
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  242   PROTOCOLO_bufferTx[indice++] = STX;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable6_4
        MOVS     R1,#+2
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  243   for(unsigned char i=0;i<tamanho;i++)
        MOVS     R0,#+0
        B.N      ??PROTOCOLO_enviaPacote_0
//  244     if(pData[i]==DLE){
//  245       PROTOCOLO_bufferTx[indice++] = DLE;
//  246       PROTOCOLO_bufferTx[indice++] = DLE;
//  247     }
//  248     else
//  249       PROTOCOLO_bufferTx[indice++] = pData[i];
??PROTOCOLO_enviaPacote_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R1,[R0, R4]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R2,??DataTable6_4
        STRB     R1,[R6, R2]
        ADDS     R6,R6,#+1
??PROTOCOLO_enviaPacote_2:
        ADDS     R0,R0,#+1
??PROTOCOLO_enviaPacote_0:
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R1,R5
        BCS.N    ??PROTOCOLO_enviaPacote_3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R1,[R0, R4]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_enviaPacote_1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R1,??DataTable6_4
        MOVS     R2,#+16
        STRB     R2,[R6, R1]
        ADDS     R6,R6,#+1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R1,??DataTable6_4
        MOVS     R2,#+16
        STRB     R2,[R6, R1]
        ADDS     R6,R6,#+1
        B.N      ??PROTOCOLO_enviaPacote_2
//  250   
//  251   PROTOCOLO_bufferTx[indice++] = DLE;
??PROTOCOLO_enviaPacote_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable6_4
        MOVS     R1,#+16
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  252   PROTOCOLO_bufferTx[indice++] = ETX;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable6_4
        MOVS     R1,#+3
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  253   
//  254   PROTOCOLO_bytesParaEnviar = indice-1;
        SUBS     R0,R6,#+1
        LDR.N    R1,??DataTable6_2
        STRB     R0,[R1, #+0]
//  255   PROTOCOLO_bytesEnviados = 1;
        LDR.N    R0,??DataTable6_3
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  256   U3THR = PROTOCOLO_bufferTx[0];  
        LDR.N    R0,??DataTable6_5  ;; 0x4009c000
        LDR.N    R1,??DataTable6_4
        LDRB     R1,[R1, #+0]
        STRB     R1,[R0, #+0]
//  257 }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock6
        REQUIRE U3RBRTHR
//  258 /***********************************************************************************
//  259 *       Descrição       :       Verifica se o buffer de transmissão está vazio
//  260 *       Parametros      :       nenhum
//  261 *       Retorno         :       Tamanho do buffer de transmissão
//  262 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function PROTOCOLO_bytesNoBufferTx
          CFI NoCalls
        THUMB
//  263 unsigned short int PROTOCOLO_bytesNoBufferTx(void){
//  264   
//  265   return PROTOCOLO_bytesParaEnviar;
PROTOCOLO_bytesNoBufferTx:
        LDR.N    R0,??DataTable6_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  266 }
//  267 /***********************************************************************************
//  268 *       Descrição       :       envia data direto
//  269 *       Parametros      :       nenhum
//  270 *       Retorno         :       nenhum
//  271 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function PROTOCOLO_enviaDadosDireto
          CFI NoCalls
        THUMB
//  272 void PROTOCOLO_enviaDadosDireto(unsigned char *buffer,unsigned char tamanho){
PROTOCOLO_enviaDadosDireto:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  273   
//  274   for(unsigned char i=0;i<tamanho;i++)
        MOVS     R2,#+0
        B.N      ??PROTOCOLO_enviaDadosDireto_0
//  275     PROTOCOLO_bufferTx[i] = buffer[i];
??PROTOCOLO_enviaDadosDireto_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRB     R3,[R2, R0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R4,??DataTable6_4
        STRB     R3,[R2, R4]
        ADDS     R2,R2,#+1
??PROTOCOLO_enviaDadosDireto_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R2,R1
        BCC.N    ??PROTOCOLO_enviaDadosDireto_1
//  276   
//  277   PROTOCOLO_bytesParaEnviar = tamanho-1;
        SUBS     R1,R1,#+1
        LDR.N    R2,??DataTable6_2
        STRB     R1,[R2, #+0]
//  278   PROTOCOLO_bytesEnviados = 1;
        LDR.N    R1,??DataTable6_3
        MOVS     R2,#+1
        STRB     R2,[R1, #+0]
//  279   U3THR = buffer[0];    
        LDR.N    R1,??DataTable6_5  ;; 0x4009c000
        LDRB     R0,[R0, #+0]
        STRB     R0,[R1, #+0]
//  280 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
        REQUIRE U3RBRTHR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x1d1a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x4009c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     PROTOCOLO_bytesParaEnviar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     PROTOCOLO_bytesEnviados

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     PROTOCOLO_bufferTx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x4009c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     ??ultimoRecebido

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     PROTOCOLO_bytesRecebidos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     PROTOCOLO_bufferRx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     PROTOCOLO_novoPacote

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     0x4009c014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     PROTOCOLO_bufferTmp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     `?<Constant "MPG2-2.1.0-BR-MA">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     PROTOCOLO_bufferTmp+0x3

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MPG2-2.1.0-BR-MA">`:
        DATA
        DC8 "MPG2-2.1.0-BR-MA"
        DC8 0, 0, 0

        END
//  281 /***********************************************************************************
//  282 *       Fim do arquivo
//  283 ***********************************************************************************/
// 
// 2 181 bytes in section .bss
//    10 bytes in section .noinit (abs)
//    20 bytes in section .rodata
//   776 bytes in section .text
// 
//   776 bytes of CODE  memory
//    20 bytes of CONST memory
// 2 181 bytes of DATA  memory (+ 10 bytes shared)
//
//Errors: none
//Warnings: none
