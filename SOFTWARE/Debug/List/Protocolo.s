///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     17/Jul/2017  16:18:01 /
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

        EXTERN PARAMETROS_get_parametro_rec
        EXTERN PARAMETROS_get_tamanho_lista
        EXTERN PARAMETROS_set_parametro_rec
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
        PUBLIC PROTOCOLO_decodifica_escreve_parametro
        PUBLIC PROTOCOLO_decodifica_le_parametro
        PUBLIC PROTOCOLO_decodifica_tamanho_tabela
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
//   22 |       Revisões           :  1
//   23 |                             2 (17/07/2017) revisão do protocolo para nova
//   24 |                                            topologia de comandos
//   25 |
//   26 |
//   27 | __________________________________________________________________________________
//   28 */
//   29 
//   30 /***********************************************************************************
//   31 *       Includes
//   32 ***********************************************************************************/
//   33 #include <nxp\iolpc1768.h>

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
//   34 #include <stdio.h>
//   35 #include <stdlib.h>
//   36 #include <string.h>
//   37 #include "protocolo.h"
//   38 #include "..\..\includes.h"
//   39 
//   40 /***********************************************************************************
//   41 *       Definições locais
//   42 ***********************************************************************************/
//   43 #define TAM_BUF_TX                              1024
//   44 #define TAM_BUF_RX                              128
//   45 
//   46 #define STX                                     0x02
//   47 #define ETX                                     0x03
//   48 #define DLE                                     0x10
//   49 
//   50 /***********************************************************************************
//   51 *       Variaveis locais
//   52 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   53 unsigned char PROTOCOLO_bufferTx[TAM_BUF_TX];
PROTOCOLO_bufferTx:
        DS8 1024

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   54 unsigned char PROTOCOLO_bufferRx[TAM_BUF_RX];
PROTOCOLO_bufferRx:
        DS8 128

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   55 unsigned char PROTOCOLO_bufferTmp[TAM_BUF_TX];
PROTOCOLO_bufferTmp:
        DS8 1024

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   56 unsigned char PROTOCOLO_bytesRecebidos;
PROTOCOLO_bytesRecebidos:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   57 unsigned char PROTOCOLO_bytesParaEnviar;
PROTOCOLO_bytesParaEnviar:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   58 unsigned char PROTOCOLO_bytesEnviados;
PROTOCOLO_bytesEnviados:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   59 unsigned char PROTOCOLO_novoPacote=0;
PROTOCOLO_novoPacote:
        DS8 1
//   60 
//   61 
//   62 /***********************************************************************************
//   63 *       Funções locais
//   64 ***********************************************************************************/
//   65 void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho);
//   66 
//   67 unsigned char PROTOCOLO_checksum(unsigned char*pData,unsigned short int tamanho);
//   68 
//   69 void PROTOCOLO_get_device(void);
//   70 
//   71 void PROTOCOLO_decodifica_tamanho_tabela(void);
//   72 
//   73 void PROTOCOLO_decodifica_le_parametro(unsigned short int indice);
//   74 
//   75 void PROTOCOLO_decodifica_escreve_parametro(unsigned short int endereco,
//   76                                             unsigned short int tamanho,
//   77                                             unsigned char *pData);
//   78 
//   79 /***********************************************************************************
//   80 *       Implementação das funções
//   81 ***********************************************************************************/
//   82 
//   83 /***********************************************************************************
//   84 *       Descrição       :       Inicialização da biblioteca
//   85 *       Parametros      :       nenhum
//   86 *       Retorno         :       nenhum
//   87 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function PROTOCOLO_ini
        THUMB
//   88 void PROTOCOLO_ini(void){
PROTOCOLO_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   89   
//   90   UART_init(3,119200,NULL,NULL,NULL);    
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDR.W    R1,??DataTable9  ;; 0x1d1a0
        MOVS     R0,#+3
          CFI FunCall UART_init
        BL       UART_init
//   91 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   92 /***********************************************************************************
//   93 *       Descrição       :       Função para tratamento da interrupção
//   94 *                               da uart3
//   95 *       Parametros      :       nenhum
//   96 *       Retorno         :       nenhum
//   97 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PROTOCOLO_intVect
          CFI NoCalls
        THUMB
//   98 void PROTOCOLO_intVect(void){  
//   99   static unsigned char ultimoRecebido=0;
//  100   unsigned char dummy;
//  101   
//  102   switch(U3IIR_bit.IID){
PROTOCOLO_intVect:
        LDR.W    R0,??DataTable9_1  ;; 0x4009c008
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
//  103     case THRE:
//  104                if(PROTOCOLO_bytesParaEnviar){
??PROTOCOLO_intVect_0:
        LDR.W    R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PROTOCOLO_intVect_5
//  105                  U3THR = PROTOCOLO_bufferTx[PROTOCOLO_bytesEnviados++];
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable9_4
        LDRB     R0,[R0, R1]
        LDR.W    R1,??DataTable9_5  ;; 0x4009c000
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable9_3
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+0]
//  106                  PROTOCOLO_bytesParaEnviar--;
        LDR.W    R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+0]
//  107                }
//  108                break; 
??PROTOCOLO_intVect_5:
        B.N      ??PROTOCOLO_intVect_4
//  109     case RDA : dummy = U3RBR;
??PROTOCOLO_intVect_1:
        LDR.W    R0,??DataTable9_5  ;; 0x4009c000
        LDRB     R0,[R0, #+0]
//  110                switch(dummy){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        CMP      R1,#+2
        BEQ.N    ??PROTOCOLO_intVect_6
        CMP      R1,#+3
        BEQ.N    ??PROTOCOLO_intVect_7
        CMP      R1,#+16
        BEQ.N    ??PROTOCOLO_intVect_8
        B.N      ??PROTOCOLO_intVect_9
//  111                  case STX: // Quando receber [DLE]+[STX] - marca inicio de novo pacote
//  112                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_6:
        LDR.W    R1,??DataTable9_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_10
//  113                              PROTOCOLO_bytesRecebidos = 0;
        LDR.W    R0,??DataTable9_7
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  114                              ultimoRecebido = 255;
        LDR.W    R0,??DataTable9_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_11
//  115                            }
//  116                            else{
//  117                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_10:
        LDR.W    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_12
//  118                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
        LDR.W    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable9_8
        STRB     R0,[R1, R2]
        LDR.W    R0,??DataTable9_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable9_7
        STRB     R0,[R1, #+0]
//  119                              
//  120                              ultimoRecebido = STX;
??PROTOCOLO_intVect_12:
        LDR.W    R0,??DataTable9_6
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  121                            }
//  122                            
//  123                            break;
??PROTOCOLO_intVect_11:
        B.N      ??PROTOCOLO_intVect_13
//  124                  case ETX: // Quando receber [DLE]+[ETX] - marca fim do novo pacote
//  125                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_7:
        LDR.W    R1,??DataTable9_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_14
//  126                              PROTOCOLO_novoPacote = 255;
        LDR.W    R0,??DataTable9_9
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
//  127                              ultimoRecebido = 255;
        LDR.W    R0,??DataTable9_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_15
//  128                            }
//  129                            else{
//  130                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_14:
        LDR.W    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_16
//  131                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
        LDR.N    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable9_8
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable9_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable9_7
        STRB     R0,[R1, #+0]
//  132                              
//  133                              ultimoRecebido = ETX;
??PROTOCOLO_intVect_16:
        LDR.N    R0,??DataTable9_6
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  134                            }                   
//  135                            break;
??PROTOCOLO_intVect_15:
        B.N      ??PROTOCOLO_intVect_13
//  136                  case DLE: // Quando receber [DLE]+[DLE] recebe 0x10 dentro do buffer
//  137                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_8:
        LDR.N    R1,??DataTable9_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_17
//  138                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1))
        LDR.N    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_18
//  139                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;
        LDR.N    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable9_8
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable9_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable9_7
        STRB     R0,[R1, #+0]
//  140                              ultimoRecebido = 255;
??PROTOCOLO_intVect_18:
        LDR.N    R0,??DataTable9_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_19
//  141                            }                      
//  142                            else
//  143                              ultimoRecebido = DLE;
??PROTOCOLO_intVect_17:
        LDR.N    R0,??DataTable9_6
        MOVS     R1,#+16
        STRB     R1,[R0, #+0]
//  144                            break;
??PROTOCOLO_intVect_19:
        B.N      ??PROTOCOLO_intVect_13
//  145                  default :
//  146                            if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_9:
        LDR.N    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_20
//  147                              PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                                            
        LDR.N    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable9_8
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable9_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable9_7
        STRB     R0,[R1, #+0]
//  148                            break;
//  149                }
//  150                
//  151                //ultimoRecebido = dummy;
//  152                break;      
??PROTOCOLO_intVect_20:
??PROTOCOLO_intVect_13:
        B.N      ??PROTOCOLO_intVect_4
//  153     case RLS : 
//  154                dummy = U3LSR;
??PROTOCOLO_intVect_2:
        LDR.N    R0,??DataTable9_10  ;; 0x4009c014
        LDRB     R0,[R0, #+0]
//  155                dummy = U3RBR;               
        LDR.N    R1,??DataTable9_5  ;; 0x4009c000
        LDRB     R1,[R1, #+0]
        MOVS     R0,R1
//  156                break;      
        B.N      ??PROTOCOLO_intVect_4
//  157     case CTI :
//  158                break;      
//  159   }  
//  160   
//  161   //Apaga o flag de interrupção pendente
//  162   CLRPEND0 |= (0x01)<<5;       
??PROTOCOLO_intVect_3:
??PROTOCOLO_intVect_4:
        LDR.N    R0,??DataTable9_11  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable9_11  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  163 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE U3RBRTHR
        REQUIRE _A_U3LSR
        REQUIRE _A_U3FCR
        REQUIRE _A_CLRPEND0

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??ultimoRecebido:
        DS8 1
//  164 /***********************************************************************************
//  165 *       Descrição       :       Tick de timer para a biblioteca do protocolo
//  166 *       Parametros      :       nenhum
//  167 *       Retorno         :       nenhum
//  168 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PROTOCOLO_timerTick
          CFI NoCalls
        THUMB
//  169 void PROTOCOLO_timerTick(void){
//  170   
//  171   
//  172   
//  173 }
PROTOCOLO_timerTick:
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  174 /***********************************************************************************
//  175 *       Descrição       :       Calcula o checksum de um pacote de dados
//  176 *       Parametros      :       (unsigned char*) ponteiro para o início do pacote
//  177 *                               (unsigned short int) tamanho do pacote
//  178 *       Retorno         :       (unsigned char) checksum do pacote
//  179 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PROTOCOLO_checksum
          CFI NoCalls
        THUMB
//  180 unsigned char PROTOCOLO_checksum(unsigned char*pData,unsigned short int tamanho){
PROTOCOLO_checksum:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  181   unsigned short int soma=0;
        MOVS     R2,#+0
//  182 
//  183   for(unsigned short int i=0;i<tamanho;i++)
        MOVS     R3,#+0
        B.N      ??PROTOCOLO_checksum_0
//  184     soma+= pData[i];
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
//  185   
//  186   return (unsigned char)(256-soma);    
        RSBS     R0,R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  187 }
//  188 /***********************************************************************************
//  189 *       Descrição       :       Thread do protocolo
//  190 *       Protocolo       :       (void*) pPar
//  191 *       Retorno         :       nenhum
//  192 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PROTOCOLO_main
        THUMB
//  193 void PROTOCOLO_main(void*pPar){
PROTOCOLO_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  194   
//  195   PROTOCOLO_ini();
          CFI FunCall PROTOCOLO_ini
        BL       PROTOCOLO_ini
        B.N      ??PROTOCOLO_main_0
//  196   
//  197   for(;;){        
//  198     
//  199     if(PROTOCOLO_novoPacote){
//  200       
//  201       PROTOCOLO_novoPacote = 0;
//  202       if(PROTOCOLO_checksum(PROTOCOLO_bufferRx,PROTOCOLO_bufferRx[1]-1)==PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos-1]){      
//  203         switch(PROTOCOLO_bufferRx[0]){      
//  204           case DXTNET_GET_DEVICE:
//  205                PROTOCOLO_get_device();
//  206                break;
//  207           case DXTNET_READ_PARAMETERS_TABLE_SIZE:
//  208                PROTOCOLO_decodifica_tamanho_tabela();
//  209                break;
//  210           case DXTNET_READ_PARAMETERS:
//  211                PROTOCOLO_decodifica_le_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3]);
//  212                break;
//  213           case DXTNET_WRITE_PARAMETERS:
//  214                PROTOCOLO_decodifica_escreve_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3],PROTOCOLO_bufferRx[4]<<8 | PROTOCOLO_bufferRx[5],&PROTOCOLO_bufferRx[6]);
//  215                break;
//  216           case DXTNET_READ_FILE_TABLE:
//  217                break;
//  218           case DXTNET_WRITE_FILE_TABLE:
//  219                break;
//  220           case DXTNET_DELETE_FILE_TABLE:
//  221                break;
//  222           case DXTNET_READ_FILE:
//  223                break;
//  224           case DXTNET_WRITE_FILE:
//  225                break;
//  226         }    
//  227       }
//  228     }
//  229     vTaskDelay(1);
??PROTOCOLO_main_1:
??PROTOCOLO_main_2:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??PROTOCOLO_main_0:
        LDR.N    R0,??DataTable9_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PROTOCOLO_main_2
        LDR.N    R0,??DataTable9_9
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable9_8
        LDRB     R0,[R0, #+1]
        SUBS     R1,R0,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable9_8
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.N    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable9_8
        ADDS     R1,R1,R2
        LDRB     R1,[R1, #-1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BNE.N    ??PROTOCOLO_main_2
        LDR.N    R0,??DataTable9_8
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
        CMP      R0,#+24
        BEQ.N    ??PROTOCOLO_main_1
        BCC.N    ??PROTOCOLO_main_10
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_3:
          CFI FunCall PROTOCOLO_get_device
        BL       PROTOCOLO_get_device
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_5:
          CFI FunCall PROTOCOLO_decodifica_tamanho_tabela
        BL       PROTOCOLO_decodifica_tamanho_tabela
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_4:
        LDR.N    R0,??DataTable9_8
        LDRB     R0,[R0, #+2]
        LDR.N    R1,??DataTable9_8
        LDRB     R1,[R1, #+3]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PROTOCOLO_decodifica_le_parametro
        BL       PROTOCOLO_decodifica_le_parametro
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_7:
        LDR.N    R2,??DataTable9_12
        LDR.N    R0,??DataTable9_8
        LDRB     R0,[R0, #+4]
        LDR.N    R1,??DataTable9_8
        LDRB     R1,[R1, #+5]
        ORRS     R1,R1,R0, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable9_8
        LDRB     R0,[R0, #+2]
        LDR.N    R3,??DataTable9_8
        LDRB     R3,[R3, #+3]
        ORRS     R0,R3,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PROTOCOLO_decodifica_escreve_parametro
        BL       PROTOCOLO_decodifica_escreve_parametro
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_6:
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_9:
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_8:
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_10:
        B.N      ??PROTOCOLO_main_2
          CFI EndBlock cfiBlock4
//  230   }    
//  231 }
//  232 /***********************************************************************************
//  233 *       Descrição       :       Faz a decodificação do comando getdevice
//  234 *       Parametros      :       nenhum
//  235 *       Retorno         :       nenhum
//  236 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function PROTOCOLO_get_device
        THUMB
//  237 void PROTOCOLO_get_device(void){
PROTOCOLO_get_device:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  238   
//  239   PROTOCOLO_bufferTmp[0]  = DXTNET_GET_DEVICE;
        LDR.N    R0,??DataTable9_13
        MOVS     R1,#+16
        STRB     R1,[R0, #+0]
//  240   PROTOCOLO_bufferTmp[2]  = DXTNET_MAIS_PIPOCA_G2;
        LDR.N    R0,??DataTable9_13
        MOVS     R1,#+2
        STRB     R1,[R0, #+2]
//  241   
//  242   sprintf((char*)&PROTOCOLO_bufferTmp[3],STRING_VERSAO_PROTOCOLO);
        LDR.N    R1,??DataTable9_14
        LDR.N    R0,??DataTable9_15
          CFI FunCall sprintf
        BL       sprintf
//  243   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,21);  
        MOVS     R1,#+21
        LDR.N    R0,??DataTable9_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  244 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
//  245 /***********************************************************************************
//  246 *       Descrição       :       Encapsula os dados que serão enviados
//  247 *                               pela rede
//  248 *       Parametros      :       (unsigned char*) ponteiro para os dados que serão
//  249 *                                               enviados
//  250 *       Retorno         :       nenhum
//  251 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function PROTOCOLO_enviaPacote
        THUMB
//  252 void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho){
PROTOCOLO_enviaPacote:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  253   unsigned char indice=0;
        MOVS     R6,#+0
//  254   
//  255   pData[1] = tamanho;
        STRB     R5,[R4, #+1]
//  256   pData[tamanho-1] = PROTOCOLO_checksum(pData,tamanho-1);
        SUBS     R1,R5,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R1,R5,R4
        STRB     R0,[R1, #-1]
//  257   
//  258   PROTOCOLO_bufferTx[indice++] = DLE;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable9_4
        MOVS     R1,#+16
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  259   PROTOCOLO_bufferTx[indice++] = STX;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable9_4
        MOVS     R1,#+2
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  260   for(unsigned char i=0;i<tamanho;i++)
        MOVS     R0,#+0
        B.N      ??PROTOCOLO_enviaPacote_0
//  261     if(pData[i]==DLE){
//  262       PROTOCOLO_bufferTx[indice++] = DLE;
//  263       PROTOCOLO_bufferTx[indice++] = DLE;
//  264     }
//  265     else
//  266       PROTOCOLO_bufferTx[indice++] = pData[i];
??PROTOCOLO_enviaPacote_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R1,[R0, R4]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R2,??DataTable9_4
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
        LDR.N    R1,??DataTable9_4
        MOVS     R2,#+16
        STRB     R2,[R6, R1]
        ADDS     R6,R6,#+1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R1,??DataTable9_4
        MOVS     R2,#+16
        STRB     R2,[R6, R1]
        ADDS     R6,R6,#+1
        B.N      ??PROTOCOLO_enviaPacote_2
//  267   
//  268   PROTOCOLO_bufferTx[indice++] = DLE;
??PROTOCOLO_enviaPacote_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable9_4
        MOVS     R1,#+16
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  269   PROTOCOLO_bufferTx[indice++] = ETX;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable9_4
        MOVS     R1,#+3
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  270   
//  271   PROTOCOLO_bytesParaEnviar = indice-1;
        SUBS     R0,R6,#+1
        LDR.N    R1,??DataTable9_2
        STRB     R0,[R1, #+0]
//  272   PROTOCOLO_bytesEnviados = 1;
        LDR.N    R0,??DataTable9_3
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  273   U3THR = PROTOCOLO_bufferTx[0];  
        LDR.N    R0,??DataTable9_5  ;; 0x4009c000
        LDR.N    R1,??DataTable9_4
        LDRB     R1,[R1, #+0]
        STRB     R1,[R0, #+0]
//  274 }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock6
        REQUIRE U3RBRTHR
//  275 /***********************************************************************************
//  276 *       Descrição       :       Verifica se o buffer de transmissão está vazio
//  277 *       Parametros      :       nenhum
//  278 *       Retorno         :       Tamanho do buffer de transmissão
//  279 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function PROTOCOLO_bytesNoBufferTx
          CFI NoCalls
        THUMB
//  280 unsigned short int PROTOCOLO_bytesNoBufferTx(void){
//  281   
//  282   return PROTOCOLO_bytesParaEnviar;
PROTOCOLO_bytesNoBufferTx:
        LDR.N    R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  283 }
//  284 /***********************************************************************************
//  285 *       Descrição       :       envia data direto
//  286 *       Parametros      :       nenhum
//  287 *       Retorno         :       nenhum
//  288 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function PROTOCOLO_enviaDadosDireto
          CFI NoCalls
        THUMB
//  289 void PROTOCOLO_enviaDadosDireto(unsigned char *buffer,unsigned char tamanho){
PROTOCOLO_enviaDadosDireto:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  290   
//  291   for(unsigned char i=0;i<tamanho;i++)
        MOVS     R2,#+0
        B.N      ??PROTOCOLO_enviaDadosDireto_0
//  292     PROTOCOLO_bufferTx[i] = buffer[i];
??PROTOCOLO_enviaDadosDireto_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRB     R3,[R2, R0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R4,??DataTable9_4
        STRB     R3,[R2, R4]
        ADDS     R2,R2,#+1
??PROTOCOLO_enviaDadosDireto_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R2,R1
        BCC.N    ??PROTOCOLO_enviaDadosDireto_1
//  293   
//  294   PROTOCOLO_bytesParaEnviar = tamanho-1;
        SUBS     R1,R1,#+1
        LDR.N    R2,??DataTable9_2
        STRB     R1,[R2, #+0]
//  295   PROTOCOLO_bytesEnviados = 1;
        LDR.N    R1,??DataTable9_3
        MOVS     R2,#+1
        STRB     R2,[R1, #+0]
//  296   U3THR = buffer[0];    
        LDR.N    R1,??DataTable9_5  ;; 0x4009c000
        LDRB     R0,[R0, #+0]
        STRB     R0,[R1, #+0]
//  297 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
        REQUIRE U3RBRTHR
//  298 /***********************************************************************************
//  299 *       Descrição       :       Lê a quantidade de parâmetros existentes
//  300 *                               na tabela de parâmetros do sistema
//  301 *       Parametros      :       nenhum
//  302 *       Retorno         :       nenhum
//  303 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_tamanho_tabela
        THUMB
//  304 void PROTOCOLO_decodifica_tamanho_tabela(void){
PROTOCOLO_decodifica_tamanho_tabela:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  305   unsigned short int quantidade = PARAMETROS_get_tamanho_lista();
          CFI FunCall PARAMETROS_get_tamanho_lista
        BL       PARAMETROS_get_tamanho_lista
//  306   
//  307   PROTOCOLO_bufferTmp[0]  = DXTNET_READ_PARAMETERS_TABLE_SIZE;
        LDR.N    R1,??DataTable9_13
        MOVS     R2,#+17
        STRB     R2,[R1, #+0]
//  308   PROTOCOLO_bufferTmp[2]  = quantidade>>8;
        LDR.N    R1,??DataTable9_13
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R2,R0,#+8
        STRB     R2,[R1, #+2]
//  309   PROTOCOLO_bufferTmp[3]  = quantidade;
        LDR.N    R1,??DataTable9_13
        STRB     R0,[R1, #+3]
//  310   
//  311   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,5);    
        MOVS     R1,#+5
        LDR.N    R0,??DataTable9_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  312 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9
//  313 /***********************************************************************************
//  314 *       Descrição       :       Decodifica o comando para leitura
//  315 *                               de um dos parâmetros da tabela
//  316 *       Parametros      :       (unsigned short int) indice
//  317 *       Retorno         :       nenhum
//  318 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_le_parametro
        THUMB
//  319 void PROTOCOLO_decodifica_le_parametro(unsigned short int indice){
PROTOCOLO_decodifica_le_parametro:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+12
          CFI CFA R13+16
//  320   unsigned short int tamanho;
//  321   
//  322   PROTOCOLO_bufferTmp[0] =  DXTNET_READ_PARAMETERS;      
        LDR.N    R1,??DataTable9_13
        MOVS     R2,#+18
        STRB     R2,[R1, #+0]
//  323   PARAMETROS_get_parametro_rec(indice,&tamanho,&PROTOCOLO_bufferTmp[4],&PROTOCOLO_bufferTmp[20],&PROTOCOLO_bufferTmp[23]);
        LDR.N    R1,??DataTable9_16
        STR      R1,[SP, #+0]
        LDR.N    R3,??DataTable9_17
        LDR.N    R2,??DataTable9_18
        ADD      R1,SP,#+4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PARAMETROS_get_parametro_rec
        BL       PARAMETROS_get_parametro_rec
//  324   PROTOCOLO_bufferTmp[2] = tamanho>>8;
        LDR.N    R0,??DataTable9_13
        LDRH     R1,[SP, #+4]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[R0, #+2]
//  325   PROTOCOLO_bufferTmp[3] = tamanho;
        LDR.N    R0,??DataTable9_13
        LDRH     R1,[SP, #+4]
        STRB     R1,[R0, #+3]
//  326   
//  327   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,24+tamanho);
        LDRH     R0,[SP, #+4]
        ADDS     R1,R0,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable9_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  328 }
        POP      {R0-R2,PC}       ;; return
          CFI EndBlock cfiBlock10
//  329 /***********************************************************************************
//  330 *       Descrição       :       Decodifica o comando de escrita em um 
//  331 *                               dos parâmetro da tabela de leitura
//  332 *       Parametros      :       (unsigned short int) endereço
//  333 *                               (unsigned short int) tamanho do parâmetro
//  334 *                               (unsigned char*) ponteiro para o stream
//  335 *
//  336 *       Retorno         :       nenhum
//  337 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_escreve_parametro
        THUMB
//  338 void PROTOCOLO_decodifica_escreve_parametro(unsigned short int endereco,
//  339                                             unsigned short int tamanho,
//  340                                             unsigned char *pData){
PROTOCOLO_decodifica_escreve_parametro:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
//  341                                                     
//  342   PROTOCOLO_bufferTmp[0] = DXTNET_WRITE_PARAMETERS;
        LDR.N    R0,??DataTable9_13
        MOVS     R1,#+19
        STRB     R1,[R0, #+0]
//  343   
//  344   PARAMETROS_set_parametro_rec(endereco,tamanho,pData);
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PARAMETROS_set_parametro_rec
        BL       PARAMETROS_set_parametro_rec
//  345   
//  346   PROTOCOLO_bufferTmp[2] = endereco>>8;
        LDR.N    R0,??DataTable9_13
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LSRS     R1,R5,#+8
        STRB     R1,[R0, #+2]
//  347   PROTOCOLO_bufferTmp[3] = endereco;
        LDR.N    R0,??DataTable9_13
        STRB     R5,[R0, #+3]
//  348   PROTOCOLO_bufferTmp[4] = tamanho>>8;
        LDR.N    R0,??DataTable9_13
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSRS     R1,R4,#+8
        STRB     R1,[R0, #+4]
//  349   PROTOCOLO_bufferTmp[5] = tamanho;
        LDR.N    R0,??DataTable9_13
        STRB     R4,[R0, #+5]
//  350   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,7);
        MOVS     R1,#+7
        LDR.N    R0,??DataTable9_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  351 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x1d1a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0x4009c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     PROTOCOLO_bytesParaEnviar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     PROTOCOLO_bytesEnviados

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     PROTOCOLO_bufferTx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     0x4009c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     ??ultimoRecebido

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     PROTOCOLO_bytesRecebidos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_8:
        DC32     PROTOCOLO_bufferRx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_9:
        DC32     PROTOCOLO_novoPacote

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_10:
        DC32     0x4009c014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_11:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_12:
        DC32     PROTOCOLO_bufferRx+0x6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_13:
        DC32     PROTOCOLO_bufferTmp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_14:
        DC32     `?<Constant "MPG2-2.1.0-BR-MA">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_15:
        DC32     PROTOCOLO_bufferTmp+0x3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_16:
        DC32     PROTOCOLO_bufferTmp+0x17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_17:
        DC32     PROTOCOLO_bufferTmp+0x14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_18:
        DC32     PROTOCOLO_bufferTmp+0x4

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
//  352 /***********************************************************************************
//  353 *       Fim do arquivo
//  354 ***********************************************************************************/
// 
// 2 181 bytes in section .bss
//    10 bytes in section .noinit (abs)
//    20 bytes in section .rodata
// 1 056 bytes in section .text
// 
// 1 056 bytes of CODE  memory
//    20 bytes of CONST memory
// 2 181 bytes of DATA  memory (+ 10 bytes shared)
//
//Errors: none
//Warnings: 1
