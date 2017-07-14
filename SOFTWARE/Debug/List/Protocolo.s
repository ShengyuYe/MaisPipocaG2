///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     14/Jul/2017  15:02:10 /
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
//   64 
//   65 unsigned char PROTOCOLO_checksum(unsigned char*pData,unsigned short int tamanho);
//   66 
//   67 void PROTOCOLO_get_device(void);
//   68 
//   69 void PROTOCOLO_decodifica_tamanho_tabela(void);
//   70 
//   71 void PROTOCOLO_decodifica_le_parametro(unsigned short int indice);
//   72 
//   73 void PROTOCOLO_decodifica_escreve_parametro(unsigned short int endereco,
//   74                                             unsigned short int tamanho,
//   75                                             unsigned char *pData);
//   76 
//   77 /***********************************************************************************
//   78 *       Implementação das funções
//   79 ***********************************************************************************/
//   80 
//   81 /***********************************************************************************
//   82 *       Descrição       :       Inicialização da biblioteca
//   83 *       Parametros      :       nenhum
//   84 *       Retorno         :       nenhum
//   85 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function PROTOCOLO_ini
        THUMB
//   86 void PROTOCOLO_ini(void){
PROTOCOLO_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   87   
//   88   UART_init(3,119200,NULL,NULL,NULL);    
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDR.W    R1,??DataTable9  ;; 0x1d1a0
        MOVS     R0,#+3
          CFI FunCall UART_init
        BL       UART_init
//   89 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   90 /***********************************************************************************
//   91 *       Descrição       :       Função para tratamento da interrupção
//   92 *                               da uart3
//   93 *       Parametros      :       nenhum
//   94 *       Retorno         :       nenhum
//   95 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PROTOCOLO_intVect
          CFI NoCalls
        THUMB
//   96 void PROTOCOLO_intVect(void){  
//   97   static unsigned char ultimoRecebido=0;
//   98   unsigned char dummy;
//   99   
//  100   switch(U3IIR_bit.IID){
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
//  101     case THRE:
//  102                if(PROTOCOLO_bytesParaEnviar){
??PROTOCOLO_intVect_0:
        LDR.W    R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PROTOCOLO_intVect_5
//  103                  U3THR = PROTOCOLO_bufferTx[PROTOCOLO_bytesEnviados++];
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
//  104                  PROTOCOLO_bytesParaEnviar--;
        LDR.W    R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+0]
//  105                }
//  106                break; 
??PROTOCOLO_intVect_5:
        B.N      ??PROTOCOLO_intVect_4
//  107     case RDA : dummy = U3RBR;
??PROTOCOLO_intVect_1:
        LDR.W    R0,??DataTable9_5  ;; 0x4009c000
        LDRB     R0,[R0, #+0]
//  108                switch(dummy){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        CMP      R1,#+2
        BEQ.N    ??PROTOCOLO_intVect_6
        CMP      R1,#+3
        BEQ.N    ??PROTOCOLO_intVect_7
        CMP      R1,#+16
        BEQ.N    ??PROTOCOLO_intVect_8
        B.N      ??PROTOCOLO_intVect_9
//  109                  case STX: // Quando receber [DLE]+[STX] - marca inicio de novo pacote
//  110                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_6:
        LDR.W    R1,??DataTable9_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_10
//  111                              PROTOCOLO_bytesRecebidos = 0;
        LDR.W    R0,??DataTable9_7
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  112                              ultimoRecebido = 255;
        LDR.W    R0,??DataTable9_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_11
//  113                            }
//  114                            else{
//  115                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_10:
        LDR.W    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_12
//  116                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
        LDR.W    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable9_8
        STRB     R0,[R1, R2]
        LDR.W    R0,??DataTable9_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable9_7
        STRB     R0,[R1, #+0]
//  117                              
//  118                              ultimoRecebido = STX;
??PROTOCOLO_intVect_12:
        LDR.W    R0,??DataTable9_6
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  119                            }
//  120                            
//  121                            break;
??PROTOCOLO_intVect_11:
        B.N      ??PROTOCOLO_intVect_13
//  122                  case ETX: // Quando receber [DLE]+[ETX] - marca fim do novo pacote
//  123                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_7:
        LDR.W    R1,??DataTable9_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_14
//  124                              PROTOCOLO_novoPacote = 255;
        LDR.W    R0,??DataTable9_9
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
//  125                              ultimoRecebido = 255;
        LDR.W    R0,??DataTable9_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_15
//  126                            }
//  127                            else{
//  128                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_14:
        LDR.W    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_16
//  129                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
        LDR.N    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable9_8
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable9_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable9_7
        STRB     R0,[R1, #+0]
//  130                              
//  131                              ultimoRecebido = ETX;
??PROTOCOLO_intVect_16:
        LDR.N    R0,??DataTable9_6
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  132                            }                   
//  133                            break;
??PROTOCOLO_intVect_15:
        B.N      ??PROTOCOLO_intVect_13
//  134                  case DLE: // Quando receber [DLE]+[DLE] recebe 0x10 dentro do buffer
//  135                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_8:
        LDR.N    R1,??DataTable9_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_17
//  136                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1))
        LDR.N    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_18
//  137                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;
        LDR.N    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable9_8
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable9_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable9_7
        STRB     R0,[R1, #+0]
//  138                              ultimoRecebido = 255;
??PROTOCOLO_intVect_18:
        LDR.N    R0,??DataTable9_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_19
//  139                            }                      
//  140                            else
//  141                              ultimoRecebido = DLE;
??PROTOCOLO_intVect_17:
        LDR.N    R0,??DataTable9_6
        MOVS     R1,#+16
        STRB     R1,[R0, #+0]
//  142                            break;
??PROTOCOLO_intVect_19:
        B.N      ??PROTOCOLO_intVect_13
//  143                  default :
//  144                            if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_9:
        LDR.N    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_20
//  145                              PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                                            
        LDR.N    R1,??DataTable9_7
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable9_8
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable9_7
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable9_7
        STRB     R0,[R1, #+0]
//  146                            break;
//  147                }
//  148                
//  149                //ultimoRecebido = dummy;
//  150                break;      
??PROTOCOLO_intVect_20:
??PROTOCOLO_intVect_13:
        B.N      ??PROTOCOLO_intVect_4
//  151     case RLS : 
//  152                dummy = U3LSR;
??PROTOCOLO_intVect_2:
        LDR.N    R0,??DataTable9_10  ;; 0x4009c014
        LDRB     R0,[R0, #+0]
//  153                dummy = U3RBR;               
        LDR.N    R1,??DataTable9_5  ;; 0x4009c000
        LDRB     R1,[R1, #+0]
        MOVS     R0,R1
//  154                break;      
        B.N      ??PROTOCOLO_intVect_4
//  155     case CTI :
//  156                break;      
//  157   }  
//  158   
//  159   //Apaga o flag de interrupção pendente
//  160   CLRPEND0 |= (0x01)<<5;       
??PROTOCOLO_intVect_3:
??PROTOCOLO_intVect_4:
        LDR.N    R0,??DataTable9_11  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable9_11  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  161 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE U3RBRTHR
        REQUIRE _A_U3LSR
        REQUIRE _A_U3FCR
        REQUIRE _A_CLRPEND0

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??ultimoRecebido:
        DS8 1
//  162 /***********************************************************************************
//  163 *       Descrição       :       Tick de timer para a biblioteca do protocolo
//  164 *       Parametros      :       nenhum
//  165 *       Retorno         :       nenhum
//  166 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PROTOCOLO_timerTick
          CFI NoCalls
        THUMB
//  167 void PROTOCOLO_timerTick(void){
//  168   
//  169   
//  170   
//  171 }
PROTOCOLO_timerTick:
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  172 /***********************************************************************************
//  173 *       Descrição       :       Calcula o checksum de um pacote de dados
//  174 *       Parametros      :       (unsigned char*) ponteiro para o início do pacote
//  175 *                               (unsigned short int) tamanho do pacote
//  176 *       Retorno         :       (unsigned char) checksum do pacote
//  177 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PROTOCOLO_checksum
          CFI NoCalls
        THUMB
//  178 unsigned char PROTOCOLO_checksum(unsigned char*pData,unsigned short int tamanho){
PROTOCOLO_checksum:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  179   unsigned short int soma=0;
        MOVS     R2,#+0
//  180 
//  181   for(unsigned short int i=0;i<tamanho;i++)
        MOVS     R3,#+0
        B.N      ??PROTOCOLO_checksum_0
//  182     soma+= pData[i];
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
//  183   
//  184   return (unsigned char)(256-soma);    
        RSBS     R0,R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  185 }
//  186 /***********************************************************************************
//  187 *       Descrição       :       Thread do protocolo
//  188 *       Protocolo       :       (void*) pPar
//  189 *       Retorno         :       nenhum
//  190 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PROTOCOLO_main
        THUMB
//  191 void PROTOCOLO_main(void*pPar){
PROTOCOLO_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  192   
//  193   PROTOCOLO_ini();
          CFI FunCall PROTOCOLO_ini
        BL       PROTOCOLO_ini
        B.N      ??PROTOCOLO_main_0
//  194   
//  195   for(;;){        
//  196     
//  197     if(PROTOCOLO_novoPacote){
//  198       
//  199       PROTOCOLO_novoPacote = 0;
//  200       if(PROTOCOLO_checksum(PROTOCOLO_bufferRx,PROTOCOLO_bufferRx[1]-1)==PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos-1]){      
//  201         switch(PROTOCOLO_bufferRx[0]){      
//  202           case DXTNET_GET_DEVICE:
//  203                PROTOCOLO_get_device();
//  204                break;
//  205           case DXTNET_READ_PARAMETERS_TABLE_SIZE:
//  206                PROTOCOLO_decodifica_tamanho_tabela();
//  207                break;
//  208           case DXTNET_READ_PARAMETERS:
//  209                PROTOCOLO_decodifica_le_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3]);
//  210                break;
//  211           case DXTNET_WRITE_PARAMETERS:
//  212                PROTOCOLO_decodifica_escreve_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3],PROTOCOLO_bufferRx[4]<<8 | PROTOCOLO_bufferRx[5],&PROTOCOLO_bufferRx[6]);
//  213                break;
//  214           case DXTNET_READ_FILE_TABLE:
//  215                break;
//  216           case DXTNET_WRITE_FILE_TABLE:
//  217                break;
//  218           case DXTNET_DELETE_FILE_TABLE:
//  219                break;
//  220           case DXTNET_READ_FILE:
//  221                break;
//  222           case DXTNET_WRITE_FILE:
//  223                break;
//  224         }    
//  225       }
//  226     }
//  227     vTaskDelay(1);
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
//  228   }    
//  229 }
//  230 /***********************************************************************************
//  231 *       Descrição       :       Faz a decodificação do comando getdevice
//  232 *       Parametros      :       nenhum
//  233 *       Retorno         :       nenhum
//  234 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function PROTOCOLO_get_device
        THUMB
//  235 void PROTOCOLO_get_device(void){
PROTOCOLO_get_device:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  236   
//  237   PROTOCOLO_bufferTmp[0]  = DXTNET_GET_DEVICE;
        LDR.N    R0,??DataTable9_13
        MOVS     R1,#+16
        STRB     R1,[R0, #+0]
//  238   PROTOCOLO_bufferTmp[2]  = DXTNET_MAIS_PIPOCA_G2;
        LDR.N    R0,??DataTable9_13
        MOVS     R1,#+2
        STRB     R1,[R0, #+2]
//  239   
//  240   sprintf((char*)&PROTOCOLO_bufferTmp[3],STRING_VERSAO_PROTOCOLO);
        LDR.N    R1,??DataTable9_14
        LDR.N    R0,??DataTable9_15
          CFI FunCall sprintf
        BL       sprintf
//  241   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,21);  
        MOVS     R1,#+21
        LDR.N    R0,??DataTable9_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  242 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
//  243 /***********************************************************************************
//  244 *       Descrição       :       Encapsula os dados que serão enviados
//  245 *                               pela rede
//  246 *       Parametros      :       (unsigned char*) ponteiro para os dados que serão
//  247 *                                               enviados
//  248 *       Retorno         :       nenhum
//  249 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function PROTOCOLO_enviaPacote
        THUMB
//  250 void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho){
PROTOCOLO_enviaPacote:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  251   unsigned char indice=0;
        MOVS     R6,#+0
//  252   
//  253   pData[1] = tamanho;
        STRB     R5,[R4, #+1]
//  254   pData[tamanho-1] = PROTOCOLO_checksum(pData,tamanho-1);
        SUBS     R1,R5,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R1,R5,R4
        STRB     R0,[R1, #-1]
//  255   
//  256   PROTOCOLO_bufferTx[indice++] = DLE;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable9_4
        MOVS     R1,#+16
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  257   PROTOCOLO_bufferTx[indice++] = STX;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable9_4
        MOVS     R1,#+2
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  258   for(unsigned char i=0;i<tamanho;i++)
        MOVS     R0,#+0
        B.N      ??PROTOCOLO_enviaPacote_0
//  259     if(pData[i]==DLE){
//  260       PROTOCOLO_bufferTx[indice++] = DLE;
//  261       PROTOCOLO_bufferTx[indice++] = DLE;
//  262     }
//  263     else
//  264       PROTOCOLO_bufferTx[indice++] = pData[i];
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
//  265   
//  266   PROTOCOLO_bufferTx[indice++] = DLE;
??PROTOCOLO_enviaPacote_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable9_4
        MOVS     R1,#+16
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  267   PROTOCOLO_bufferTx[indice++] = ETX;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable9_4
        MOVS     R1,#+3
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  268   
//  269   PROTOCOLO_bytesParaEnviar = indice-1;
        SUBS     R0,R6,#+1
        LDR.N    R1,??DataTable9_2
        STRB     R0,[R1, #+0]
//  270   PROTOCOLO_bytesEnviados = 1;
        LDR.N    R0,??DataTable9_3
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  271   U3THR = PROTOCOLO_bufferTx[0];  
        LDR.N    R0,??DataTable9_5  ;; 0x4009c000
        LDR.N    R1,??DataTable9_4
        LDRB     R1,[R1, #+0]
        STRB     R1,[R0, #+0]
//  272 }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock6
        REQUIRE U3RBRTHR
//  273 /***********************************************************************************
//  274 *       Descrição       :       Verifica se o buffer de transmissão está vazio
//  275 *       Parametros      :       nenhum
//  276 *       Retorno         :       Tamanho do buffer de transmissão
//  277 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function PROTOCOLO_bytesNoBufferTx
          CFI NoCalls
        THUMB
//  278 unsigned short int PROTOCOLO_bytesNoBufferTx(void){
//  279   
//  280   return PROTOCOLO_bytesParaEnviar;
PROTOCOLO_bytesNoBufferTx:
        LDR.N    R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  281 }
//  282 /***********************************************************************************
//  283 *       Descrição       :       envia data direto
//  284 *       Parametros      :       nenhum
//  285 *       Retorno         :       nenhum
//  286 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function PROTOCOLO_enviaDadosDireto
          CFI NoCalls
        THUMB
//  287 void PROTOCOLO_enviaDadosDireto(unsigned char *buffer,unsigned char tamanho){
PROTOCOLO_enviaDadosDireto:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  288   
//  289   for(unsigned char i=0;i<tamanho;i++)
        MOVS     R2,#+0
        B.N      ??PROTOCOLO_enviaDadosDireto_0
//  290     PROTOCOLO_bufferTx[i] = buffer[i];
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
//  291   
//  292   PROTOCOLO_bytesParaEnviar = tamanho-1;
        SUBS     R1,R1,#+1
        LDR.N    R2,??DataTable9_2
        STRB     R1,[R2, #+0]
//  293   PROTOCOLO_bytesEnviados = 1;
        LDR.N    R1,??DataTable9_3
        MOVS     R2,#+1
        STRB     R2,[R1, #+0]
//  294   U3THR = buffer[0];    
        LDR.N    R1,??DataTable9_5  ;; 0x4009c000
        LDRB     R0,[R0, #+0]
        STRB     R0,[R1, #+0]
//  295 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
        REQUIRE U3RBRTHR
//  296 /***********************************************************************************
//  297 *       Descrição       :       Lê a quantidade de parâmetros existentes
//  298 *                               na tabela de parâmetros do sistema
//  299 *       Parametros      :       nenhum
//  300 *       Retorno         :       nenhum
//  301 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_tamanho_tabela
        THUMB
//  302 void PROTOCOLO_decodifica_tamanho_tabela(void){
PROTOCOLO_decodifica_tamanho_tabela:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  303   unsigned short int quantidade = PARAMETROS_get_tamanho_lista();
          CFI FunCall PARAMETROS_get_tamanho_lista
        BL       PARAMETROS_get_tamanho_lista
//  304   
//  305   PROTOCOLO_bufferTmp[0]  = DXTNET_READ_PARAMETERS_TABLE_SIZE;
        LDR.N    R1,??DataTable9_13
        MOVS     R2,#+17
        STRB     R2,[R1, #+0]
//  306   PROTOCOLO_bufferTmp[2]  = quantidade>>8;
        LDR.N    R1,??DataTable9_13
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R2,R0,#+8
        STRB     R2,[R1, #+2]
//  307   PROTOCOLO_bufferTmp[3]  = quantidade;
        LDR.N    R1,??DataTable9_13
        STRB     R0,[R1, #+3]
//  308   
//  309   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,5);    
        MOVS     R1,#+5
        LDR.N    R0,??DataTable9_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  310 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9
//  311 /***********************************************************************************
//  312 *       Descrição       :       Decodifica o comando para leitura
//  313 *                               de um dos parâmetros da tabela
//  314 *       Parametros      :       (unsigned short int) indice
//  315 *       Retorno         :       nenhum
//  316 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_le_parametro
        THUMB
//  317 void PROTOCOLO_decodifica_le_parametro(unsigned short int indice){
PROTOCOLO_decodifica_le_parametro:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+12
          CFI CFA R13+16
//  318   unsigned short int tamanho;
//  319   
//  320   PROTOCOLO_bufferTmp[0] =  DXTNET_READ_PARAMETERS;      
        LDR.N    R1,??DataTable9_13
        MOVS     R2,#+18
        STRB     R2,[R1, #+0]
//  321   PARAMETROS_get_parametro_rec(indice,&tamanho,&PROTOCOLO_bufferTmp[4],&PROTOCOLO_bufferTmp[20],&PROTOCOLO_bufferTmp[23]);
        LDR.N    R1,??DataTable9_16
        STR      R1,[SP, #+0]
        LDR.N    R3,??DataTable9_17
        LDR.N    R2,??DataTable9_18
        ADD      R1,SP,#+4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PARAMETROS_get_parametro_rec
        BL       PARAMETROS_get_parametro_rec
//  322   PROTOCOLO_bufferTmp[2] = tamanho>>8;
        LDR.N    R0,??DataTable9_13
        LDRH     R1,[SP, #+4]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[R0, #+2]
//  323   PROTOCOLO_bufferTmp[3] = tamanho;
        LDR.N    R0,??DataTable9_13
        LDRH     R1,[SP, #+4]
        STRB     R1,[R0, #+3]
//  324   
//  325   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,24+tamanho);
        LDRH     R0,[SP, #+4]
        ADDS     R1,R0,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable9_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  326 }
        POP      {R0-R2,PC}       ;; return
          CFI EndBlock cfiBlock10
//  327 /***********************************************************************************
//  328 *       Descrição       :       Decodifica o comando de escrita em um 
//  329 *                               dos parâmetro da tabela de leitura
//  330 *       Parametros      :       (unsigned short int) endereço
//  331 *                               (unsigned short int) tamanho do parâmetro
//  332 *                               (unsigned char*) ponteiro para o stream
//  333 *
//  334 *       Retorno         :       nenhum
//  335 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_escreve_parametro
        THUMB
//  336 void PROTOCOLO_decodifica_escreve_parametro(unsigned short int endereco,
//  337                                             unsigned short int tamanho,
//  338                                             unsigned char *pData){
PROTOCOLO_decodifica_escreve_parametro:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
//  339                                                     
//  340   PROTOCOLO_bufferTmp[0] = DXTNET_WRITE_PARAMETERS;
        LDR.N    R0,??DataTable9_13
        MOVS     R1,#+19
        STRB     R1,[R0, #+0]
//  341   
//  342   PARAMETROS_set_parametro_rec(endereco,tamanho,pData);
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PARAMETROS_set_parametro_rec
        BL       PARAMETROS_set_parametro_rec
//  343   
//  344   PROTOCOLO_bufferTmp[2] = endereco>>8;
        LDR.N    R0,??DataTable9_13
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LSRS     R1,R5,#+8
        STRB     R1,[R0, #+2]
//  345   PROTOCOLO_bufferTmp[3] = endereco;
        LDR.N    R0,??DataTable9_13
        STRB     R5,[R0, #+3]
//  346   PROTOCOLO_bufferTmp[4] = tamanho>>8;
        LDR.N    R0,??DataTable9_13
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSRS     R1,R4,#+8
        STRB     R1,[R0, #+4]
//  347   PROTOCOLO_bufferTmp[5] = tamanho;
        LDR.N    R0,??DataTable9_13
        STRB     R4,[R0, #+5]
//  348   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,7);
        MOVS     R1,#+7
        LDR.N    R0,??DataTable9_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  349 }
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
//  350 /***********************************************************************************
//  351 *       Fim do arquivo
//  352 ***********************************************************************************/
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
