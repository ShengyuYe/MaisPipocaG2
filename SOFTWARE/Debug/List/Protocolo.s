///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     24/Jul/2017  16:58:52 /
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

        EXTERN FSA_format_audio_memory
        EXTERN PARAMETROS_get_parametro_rec
        EXTERN PARAMETROS_get_tamanho_lista
        EXTERN PARAMETROS_set_parametro_rec
        EXTERN SST_writeAutoAddressInc
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
        PUBLIC PROTOCOLO_decodifica_format
        PUBLIC PROTOCOLO_decodifica_le_parametro
        PUBLIC PROTOCOLO_decodifica_tamanho_tabela
        PUBLIC PROTOCOLO_decodifica_write_block
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
//   43 #define TAM_BUF_TX                              128
//   44 #define TAM_BUF_RX                              1280
//   45 
//   46 #define STX                                     0x02
//   47 #define ETX                                     0x03
//   48 #define DLE                                     0x10
//   49 
//   50 #define ENDERECO_INICIAL_FLASH                  AREA_ARQUIVOS
//   51 /***********************************************************************************
//   52 *       Variaveis locais
//   53 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   54 unsigned char PROTOCOLO_bufferTx[TAM_BUF_TX];
PROTOCOLO_bufferTx:
        DS8 128

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   55 unsigned char PROTOCOLO_bufferRx[TAM_BUF_RX];
PROTOCOLO_bufferRx:
        DS8 1280

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   56 unsigned char PROTOCOLO_bufferTmp[TAM_BUF_TX];
PROTOCOLO_bufferTmp:
        DS8 128

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

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   60 unsigned short int PROTOCOLO_bytesRecebidos;
PROTOCOLO_bytesRecebidos:
        DS8 2
//   61 
//   62 
//   63 /***********************************************************************************
//   64 *       Funções locais
//   65 ***********************************************************************************/
//   66 void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho);
//   67 
//   68 unsigned char PROTOCOLO_checksum(unsigned char*pData,unsigned short int tamanho);
//   69 
//   70 void PROTOCOLO_get_device(void);
//   71 
//   72 void PROTOCOLO_decodifica_tamanho_tabela(void);
//   73 
//   74 void PROTOCOLO_decodifica_le_parametro(unsigned short int indice);
//   75 
//   76 void PROTOCOLO_decodifica_escreve_parametro(unsigned short int endereco,
//   77                                             unsigned short int tamanho,
//   78                                             unsigned char *pData);
//   79 
//   80 void PROTOCOLO_decodifica_format(void);
//   81 
//   82 void PROTOCOLO_decodifica_write_block(unsigned int endereco,unsigned char *pData,
//   83                                       unsigned short int size);
//   84 /***********************************************************************************
//   85 *       Implementação das funções
//   86 ***********************************************************************************/
//   87 
//   88 /***********************************************************************************
//   89 *       Descrição       :       Inicialização da biblioteca
//   90 *       Parametros      :       nenhum
//   91 *       Retorno         :       nenhum
//   92 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function PROTOCOLO_ini
        THUMB
//   93 void PROTOCOLO_ini(void){
PROTOCOLO_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   94   
//   95   UART_init(3,119200,NULL,NULL,NULL);    
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDR.W    R1,??DataTable11  ;; 0x1d1a0
        MOVS     R0,#+3
          CFI FunCall UART_init
        BL       UART_init
//   96 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   97 /***********************************************************************************
//   98 *       Descrição       :       Função para tratamento da interrupção
//   99 *                               da uart3
//  100 *       Parametros      :       nenhum
//  101 *       Retorno         :       nenhum
//  102 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PROTOCOLO_intVect
          CFI NoCalls
        THUMB
//  103 void PROTOCOLO_intVect(void){  
//  104   static unsigned char ultimoRecebido=0;
//  105   unsigned char dummy;
//  106   
//  107   switch(U3IIR_bit.IID){
PROTOCOLO_intVect:
        LDR.W    R0,??DataTable11_1  ;; 0x4009c008
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
//  108     case THRE:
//  109                if(PROTOCOLO_bytesParaEnviar){
??PROTOCOLO_intVect_0:
        LDR.W    R0,??DataTable11_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PROTOCOLO_intVect_5
//  110                  U3THR = PROTOCOLO_bufferTx[PROTOCOLO_bytesEnviados++];
        LDR.W    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_4
        LDRB     R0,[R0, R1]
        LDR.W    R1,??DataTable11_5  ;; 0x4009c000
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_3
        STRB     R0,[R1, #+0]
//  111                  PROTOCOLO_bytesParaEnviar--;
        LDR.W    R0,??DataTable11_2
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable11_2
        STRB     R0,[R1, #+0]
//  112                }
//  113                break; 
??PROTOCOLO_intVect_5:
        B.N      ??PROTOCOLO_intVect_4
//  114     case RDA : dummy = U3RBR;
??PROTOCOLO_intVect_1:
        LDR.W    R0,??DataTable11_5  ;; 0x4009c000
        LDRB     R0,[R0, #+0]
//  115                switch(dummy){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        CMP      R1,#+2
        BEQ.N    ??PROTOCOLO_intVect_6
        CMP      R1,#+3
        BEQ.N    ??PROTOCOLO_intVect_7
        CMP      R1,#+16
        BEQ.N    ??PROTOCOLO_intVect_8
        B.N      ??PROTOCOLO_intVect_9
//  116                  case STX: // Quando receber [DLE]+[STX] - marca inicio de novo pacote
//  117                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_6:
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_10
//  118                              PROTOCOLO_bytesRecebidos = 0;
        LDR.W    R0,??DataTable11_7
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  119                              ultimoRecebido = 255;
        LDR.W    R0,??DataTable11_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_11
//  120                            }
//  121                            else{
//  122                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_10:
        LDR.W    R1,??DataTable11_7
        LDRH     R1,[R1, #+0]
        MOVW     R2,#+1279
        CMP      R1,R2
        BGE.N    ??PROTOCOLO_intVect_12
//  123                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
        LDR.W    R1,??DataTable11_7
        LDRH     R1,[R1, #+0]
        LDR.W    R2,??DataTable11_8
        STRB     R0,[R1, R2]
        LDR.W    R0,??DataTable11_7
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_7
        STRH     R0,[R1, #+0]
//  124                              
//  125                              ultimoRecebido = STX;
??PROTOCOLO_intVect_12:
        LDR.W    R0,??DataTable11_6
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  126                            }
//  127                            
//  128                            break;
??PROTOCOLO_intVect_11:
        B.N      ??PROTOCOLO_intVect_13
//  129                  case ETX: // Quando receber [DLE]+[ETX] - marca fim do novo pacote
//  130                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_7:
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_14
//  131                              PROTOCOLO_novoPacote = 255;
        LDR.W    R0,??DataTable11_9
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
//  132                              ultimoRecebido = 255;
        LDR.W    R0,??DataTable11_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_15
//  133                            }
//  134                            else{
//  135                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_14:
        LDR.W    R1,??DataTable11_7
        LDRH     R1,[R1, #+0]
        MOVW     R2,#+1279
        CMP      R1,R2
        BGE.N    ??PROTOCOLO_intVect_16
//  136                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
        LDR.W    R1,??DataTable11_7
        LDRH     R1,[R1, #+0]
        LDR.W    R2,??DataTable11_8
        STRB     R0,[R1, R2]
        LDR.W    R0,??DataTable11_7
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_7
        STRH     R0,[R1, #+0]
//  137                              
//  138                              ultimoRecebido = ETX;
??PROTOCOLO_intVect_16:
        LDR.W    R0,??DataTable11_6
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  139                            }                   
//  140                            break;
??PROTOCOLO_intVect_15:
        B.N      ??PROTOCOLO_intVect_13
//  141                  case DLE: // Quando receber [DLE]+[DLE] recebe 0x10 dentro do buffer
//  142                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_8:
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_17
//  143                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1))
        LDR.W    R1,??DataTable11_7
        LDRH     R1,[R1, #+0]
        MOVW     R2,#+1279
        CMP      R1,R2
        BGE.N    ??PROTOCOLO_intVect_18
//  144                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;
        LDR.W    R1,??DataTable11_7
        LDRH     R1,[R1, #+0]
        LDR.W    R2,??DataTable11_8
        STRB     R0,[R1, R2]
        LDR.W    R0,??DataTable11_7
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_7
        STRH     R0,[R1, #+0]
//  145                              ultimoRecebido = 255;
??PROTOCOLO_intVect_18:
        LDR.W    R0,??DataTable11_6
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_19
//  146                            }                      
//  147                            else
//  148                              ultimoRecebido = DLE;
??PROTOCOLO_intVect_17:
        LDR.W    R0,??DataTable11_6
        MOVS     R1,#+16
        STRB     R1,[R0, #+0]
//  149                            break;
??PROTOCOLO_intVect_19:
        B.N      ??PROTOCOLO_intVect_13
//  150                  default :
//  151                            if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_9:
        LDR.W    R1,??DataTable11_7
        LDRH     R1,[R1, #+0]
        MOVW     R2,#+1279
        CMP      R1,R2
        BGE.N    ??PROTOCOLO_intVect_20
//  152                              PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                                            
        LDR.W    R1,??DataTable11_7
        LDRH     R1,[R1, #+0]
        LDR.W    R2,??DataTable11_8
        STRB     R0,[R1, R2]
        LDR.W    R0,??DataTable11_7
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_7
        STRH     R0,[R1, #+0]
//  153                            break;
//  154                }
//  155                
//  156                //ultimoRecebido = dummy;
//  157                break;      
??PROTOCOLO_intVect_20:
??PROTOCOLO_intVect_13:
        B.N      ??PROTOCOLO_intVect_4
//  158     case RLS : 
//  159                dummy = U3LSR;
??PROTOCOLO_intVect_2:
        LDR.W    R0,??DataTable11_10  ;; 0x4009c014
        LDRB     R0,[R0, #+0]
//  160                dummy = U3RBR;               
        LDR.N    R1,??DataTable11_5  ;; 0x4009c000
        LDRB     R1,[R1, #+0]
        MOVS     R0,R1
//  161                break;      
        B.N      ??PROTOCOLO_intVect_4
//  162     case CTI :
//  163                break;      
//  164   }  
//  165   
//  166   //Apaga o flag de interrupção pendente
//  167   CLRPEND0 |= (0x01)<<5;       
??PROTOCOLO_intVect_3:
??PROTOCOLO_intVect_4:
        LDR.N    R0,??DataTable11_11  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable11_11  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  168 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE U3RBRTHR
        REQUIRE _A_U3LSR
        REQUIRE _A_U3FCR
        REQUIRE _A_CLRPEND0

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??ultimoRecebido:
        DS8 1
//  169 /***********************************************************************************
//  170 *       Descrição       :       Tick de timer para a biblioteca do protocolo
//  171 *       Parametros      :       nenhum
//  172 *       Retorno         :       nenhum
//  173 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PROTOCOLO_timerTick
          CFI NoCalls
        THUMB
//  174 void PROTOCOLO_timerTick(void){
//  175   
//  176   
//  177   
//  178 }
PROTOCOLO_timerTick:
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  179 /***********************************************************************************
//  180 *       Descrição       :       Calcula o checksum de um pacote de dados
//  181 *       Parametros      :       (unsigned char*) ponteiro para o início do pacote
//  182 *                               (unsigned short int) tamanho do pacote
//  183 *       Retorno         :       (unsigned char) checksum do pacote
//  184 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PROTOCOLO_checksum
          CFI NoCalls
        THUMB
//  185 unsigned char PROTOCOLO_checksum(unsigned char*pData,unsigned short int tamanho){
PROTOCOLO_checksum:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  186   unsigned short int soma=0;
        MOVS     R2,#+0
//  187 
//  188   for(unsigned short int i=0;i<tamanho;i++)
        MOVS     R3,#+0
        B.N      ??PROTOCOLO_checksum_0
//  189     soma+= pData[i];
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
//  190   
//  191   return (unsigned char)(256-soma);    
        RSBS     R0,R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  192 }
//  193 /***********************************************************************************
//  194 *       Descrição       :       Thread do protocolo
//  195 *       Protocolo       :       (void*) pPar
//  196 *       Retorno         :       nenhum
//  197 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PROTOCOLO_main
        THUMB
//  198 void PROTOCOLO_main(void*pPar){
PROTOCOLO_main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  199   
//  200   PROTOCOLO_ini();
          CFI FunCall PROTOCOLO_ini
        BL       PROTOCOLO_ini
        B.N      ??PROTOCOLO_main_0
//  201   
//  202   for(;;){        
//  203     
//  204     if(PROTOCOLO_novoPacote){
//  205       
//  206       PROTOCOLO_novoPacote = 0;
//  207       if(PROTOCOLO_checksum(PROTOCOLO_bufferRx,PROTOCOLO_bufferRx[1]-1)==PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos-1]){      
//  208         switch(PROTOCOLO_bufferRx[0]){      
//  209           case DXTNET_GET_DEVICE:
//  210                PROTOCOLO_get_device();
//  211                break;
//  212           case DXTNET_READ_PARAMETERS_TABLE_SIZE:
//  213                PROTOCOLO_decodifica_tamanho_tabela();
//  214                break;
//  215           case DXTNET_READ_PARAMETERS:
//  216                PROTOCOLO_decodifica_le_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3]);
//  217                break;
//  218           case DXTNET_WRITE_PARAMETERS:
//  219                PROTOCOLO_decodifica_escreve_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3],PROTOCOLO_bufferRx[4]<<8 | PROTOCOLO_bufferRx[5],&PROTOCOLO_bufferRx[6]);
//  220                break;
//  221           case DXTNET_FILE_FORMAT:
//  222                PROTOCOLO_decodifica_format();
//  223                break;
//  224           case DXTNET_WRITE_BLOCK:
//  225                PROTOCOLO_decodifica_write_block(PROTOCOLO_bufferRx[2]<<24 | PROTOCOLO_bufferRx[3]<<16 | PROTOCOLO_bufferRx[4]<<8 | PROTOCOLO_bufferRx[5],
//  226                                                 &PROTOCOLO_bufferRx[8],
//  227                                                 PROTOCOLO_bufferRx[6]<<8 | PROTOCOLO_bufferRx[7]);
//  228                break;
//  229           case DXTNET_READ_BLOCK:
//  230             
//  231                break;
//  232         }    
//  233       }
//  234     }
//  235     vTaskDelay(1);
??PROTOCOLO_main_1:
??PROTOCOLO_main_2:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??PROTOCOLO_main_0:
        LDR.N    R0,??DataTable11_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PROTOCOLO_main_2
        LDR.N    R0,??DataTable11_9
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable11_8
        LDRB     R0,[R0, #+1]
        SUBS     R1,R0,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable11_8
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.N    R1,??DataTable11_7
        LDRH     R1,[R1, #+0]
        LDR.N    R2,??DataTable11_8
        ADDS     R1,R1,R2
        LDRB     R1,[R1, #-1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BNE.N    ??PROTOCOLO_main_2
        LDR.N    R0,??DataTable11_8
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
        BEQ.N    ??PROTOCOLO_main_1
        BCC.N    ??PROTOCOLO_main_8
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
        LDR.N    R0,??DataTable11_8
        LDRB     R0,[R0, #+2]
        LDR.N    R1,??DataTable11_8
        LDRB     R1,[R1, #+3]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PROTOCOLO_decodifica_le_parametro
        BL       PROTOCOLO_decodifica_le_parametro
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_7:
        LDR.N    R2,??DataTable11_12
        LDR.N    R0,??DataTable11_8
        LDRB     R0,[R0, #+4]
        LDR.N    R1,??DataTable11_8
        LDRB     R1,[R1, #+5]
        ORRS     R1,R1,R0, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable11_8
        LDRB     R0,[R0, #+2]
        LDR.N    R3,??DataTable11_8
        LDRB     R3,[R3, #+3]
        ORRS     R0,R3,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PROTOCOLO_decodifica_escreve_parametro
        BL       PROTOCOLO_decodifica_escreve_parametro
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_6:
          CFI FunCall PROTOCOLO_decodifica_format
        BL       PROTOCOLO_decodifica_format
        B.N      ??PROTOCOLO_main_2
??PROTOCOLO_main_8:
        LDR.N    R0,??DataTable11_8
        LDRB     R0,[R0, #+6]
        LDR.N    R1,??DataTable11_8
        LDRB     R1,[R1, #+7]
        ORRS     R2,R1,R0, LSL #+8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR.N    R1,??DataTable11_13
        LDR.N    R0,??DataTable11_8
        LDRB     R0,[R0, #+2]
        LDR.N    R3,??DataTable11_8
        LDRB     R3,[R3, #+3]
        LSLS     R3,R3,#+16
        ORRS     R0,R3,R0, LSL #+24
        LDR.N    R3,??DataTable11_8
        LDRB     R3,[R3, #+4]
        ORRS     R0,R0,R3, LSL #+8
        LDR.N    R3,??DataTable11_8
        LDRB     R3,[R3, #+5]
        ORRS     R0,R3,R0
          CFI FunCall PROTOCOLO_decodifica_write_block
        BL       PROTOCOLO_decodifica_write_block
        B.N      ??PROTOCOLO_main_2
          CFI EndBlock cfiBlock4
//  236   }    
//  237 }
//  238 /***********************************************************************************
//  239 *       Descrição       :       Faz a decodificação do comando getdevice
//  240 *       Parametros      :       nenhum
//  241 *       Retorno         :       nenhum
//  242 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function PROTOCOLO_get_device
        THUMB
//  243 void PROTOCOLO_get_device(void){
PROTOCOLO_get_device:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  244   
//  245   PROTOCOLO_bufferTmp[0]  = DXTNET_GET_DEVICE;
        LDR.N    R0,??DataTable11_14
        MOVS     R1,#+16
        STRB     R1,[R0, #+0]
//  246   PROTOCOLO_bufferTmp[2]  = DXTNET_MAIS_PIPOCA_G2;
        LDR.N    R0,??DataTable11_14
        MOVS     R1,#+2
        STRB     R1,[R0, #+2]
//  247   
//  248   sprintf((char*)&PROTOCOLO_bufferTmp[3],STRING_VERSAO_PROTOCOLO);
        LDR.N    R1,??DataTable11_15
        LDR.N    R0,??DataTable11_16
          CFI FunCall sprintf
        BL       sprintf
//  249   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,21);  
        MOVS     R1,#+21
        LDR.N    R0,??DataTable11_14
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  250 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
//  251 /***********************************************************************************
//  252 *       Descrição       :       Encapsula os dados que serão enviados
//  253 *                               pela rede
//  254 *       Parametros      :       (unsigned char*) ponteiro para os dados que serão
//  255 *                                               enviados
//  256 *       Retorno         :       nenhum
//  257 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function PROTOCOLO_enviaPacote
        THUMB
//  258 void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho){
PROTOCOLO_enviaPacote:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  259   unsigned char indice=0;
        MOVS     R6,#+0
//  260   
//  261   pData[1] = tamanho;
        STRB     R5,[R4, #+1]
//  262   pData[tamanho-1] = PROTOCOLO_checksum(pData,tamanho-1);
        SUBS     R1,R5,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R1,R5,R4
        STRB     R0,[R1, #-1]
//  263   
//  264   PROTOCOLO_bufferTx[indice++] = DLE;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable11_4
        MOVS     R1,#+16
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  265   PROTOCOLO_bufferTx[indice++] = STX;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable11_4
        MOVS     R1,#+2
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  266   for(unsigned char i=0;i<tamanho;i++)
        MOVS     R0,#+0
        B.N      ??PROTOCOLO_enviaPacote_0
//  267     if(pData[i]==DLE){
//  268       PROTOCOLO_bufferTx[indice++] = DLE;
//  269       PROTOCOLO_bufferTx[indice++] = DLE;
//  270     }
//  271     else
//  272       PROTOCOLO_bufferTx[indice++] = pData[i];
??PROTOCOLO_enviaPacote_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R1,[R0, R4]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R2,??DataTable11_4
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
        LDR.N    R1,??DataTable11_4
        MOVS     R2,#+16
        STRB     R2,[R6, R1]
        ADDS     R6,R6,#+1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R1,??DataTable11_4
        MOVS     R2,#+16
        STRB     R2,[R6, R1]
        ADDS     R6,R6,#+1
        B.N      ??PROTOCOLO_enviaPacote_2
//  273   
//  274   PROTOCOLO_bufferTx[indice++] = DLE;
??PROTOCOLO_enviaPacote_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable11_4
        MOVS     R1,#+16
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  275   PROTOCOLO_bufferTx[indice++] = ETX;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable11_4
        MOVS     R1,#+3
        STRB     R1,[R6, R0]
        ADDS     R6,R6,#+1
//  276   
//  277   PROTOCOLO_bytesParaEnviar = indice-1;
        SUBS     R0,R6,#+1
        LDR.N    R1,??DataTable11_2
        STRB     R0,[R1, #+0]
//  278   PROTOCOLO_bytesEnviados = 1;
        LDR.N    R0,??DataTable11_3
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  279   U3THR = PROTOCOLO_bufferTx[0];  
        LDR.N    R0,??DataTable11_5  ;; 0x4009c000
        LDR.N    R1,??DataTable11_4
        LDRB     R1,[R1, #+0]
        STRB     R1,[R0, #+0]
//  280 }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock6
        REQUIRE U3RBRTHR
//  281 /***********************************************************************************
//  282 *       Descrição       :       Verifica se o buffer de transmissão está vazio
//  283 *       Parametros      :       nenhum
//  284 *       Retorno         :       Tamanho do buffer de transmissão
//  285 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function PROTOCOLO_bytesNoBufferTx
          CFI NoCalls
        THUMB
//  286 unsigned short int PROTOCOLO_bytesNoBufferTx(void){
//  287   
//  288   return PROTOCOLO_bytesParaEnviar;
PROTOCOLO_bytesNoBufferTx:
        LDR.N    R0,??DataTable11_2
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  289 }
//  290 /***********************************************************************************
//  291 *       Descrição       :       envia data direto
//  292 *       Parametros      :       nenhum
//  293 *       Retorno         :       nenhum
//  294 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function PROTOCOLO_enviaDadosDireto
          CFI NoCalls
        THUMB
//  295 void PROTOCOLO_enviaDadosDireto(unsigned char *buffer,unsigned char tamanho){
PROTOCOLO_enviaDadosDireto:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  296   
//  297   for(unsigned char i=0;i<tamanho;i++)
        MOVS     R2,#+0
        B.N      ??PROTOCOLO_enviaDadosDireto_0
//  298     PROTOCOLO_bufferTx[i] = buffer[i];
??PROTOCOLO_enviaDadosDireto_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRB     R3,[R2, R0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R4,??DataTable11_4
        STRB     R3,[R2, R4]
        ADDS     R2,R2,#+1
??PROTOCOLO_enviaDadosDireto_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R2,R1
        BCC.N    ??PROTOCOLO_enviaDadosDireto_1
//  299   
//  300   PROTOCOLO_bytesParaEnviar = tamanho-1;
        SUBS     R1,R1,#+1
        LDR.N    R2,??DataTable11_2
        STRB     R1,[R2, #+0]
//  301   PROTOCOLO_bytesEnviados = 1;
        LDR.N    R1,??DataTable11_3
        MOVS     R2,#+1
        STRB     R2,[R1, #+0]
//  302   U3THR = buffer[0];    
        LDR.N    R1,??DataTable11_5  ;; 0x4009c000
        LDRB     R0,[R0, #+0]
        STRB     R0,[R1, #+0]
//  303 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
        REQUIRE U3RBRTHR
//  304 /***********************************************************************************
//  305 *       Descrição       :       Lê a quantidade de parâmetros existentes
//  306 *                               na tabela de parâmetros do sistema
//  307 *       Parametros      :       nenhum
//  308 *       Retorno         :       nenhum
//  309 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_tamanho_tabela
        THUMB
//  310 void PROTOCOLO_decodifica_tamanho_tabela(void){
PROTOCOLO_decodifica_tamanho_tabela:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  311   unsigned short int quantidade = PARAMETROS_get_tamanho_lista();
          CFI FunCall PARAMETROS_get_tamanho_lista
        BL       PARAMETROS_get_tamanho_lista
//  312   
//  313   PROTOCOLO_bufferTmp[0]  = DXTNET_READ_PARAMETERS_TABLE_SIZE;
        LDR.N    R1,??DataTable11_14
        MOVS     R2,#+17
        STRB     R2,[R1, #+0]
//  314   PROTOCOLO_bufferTmp[2]  = quantidade>>8;
        LDR.N    R1,??DataTable11_14
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R2,R0,#+8
        STRB     R2,[R1, #+2]
//  315   PROTOCOLO_bufferTmp[3]  = quantidade;
        LDR.N    R1,??DataTable11_14
        STRB     R0,[R1, #+3]
//  316   
//  317   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,5);    
        MOVS     R1,#+5
        LDR.N    R0,??DataTable11_14
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  318 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9
//  319 /***********************************************************************************
//  320 *       Descrição       :       Decodifica o comando para leitura
//  321 *                               de um dos parâmetros da tabela
//  322 *       Parametros      :       (unsigned short int) indice
//  323 *       Retorno         :       nenhum
//  324 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_le_parametro
        THUMB
//  325 void PROTOCOLO_decodifica_le_parametro(unsigned short int indice){
PROTOCOLO_decodifica_le_parametro:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+12
          CFI CFA R13+16
//  326   unsigned short int tamanho;
//  327   
//  328   PROTOCOLO_bufferTmp[0] =  DXTNET_READ_PARAMETERS;      
        LDR.N    R1,??DataTable11_14
        MOVS     R2,#+18
        STRB     R2,[R1, #+0]
//  329   PARAMETROS_get_parametro_rec(indice,&tamanho,&PROTOCOLO_bufferTmp[4],&PROTOCOLO_bufferTmp[20],&PROTOCOLO_bufferTmp[23]);
        LDR.N    R1,??DataTable11_17
        STR      R1,[SP, #+0]
        LDR.N    R3,??DataTable11_18
        LDR.N    R2,??DataTable11_19
        ADD      R1,SP,#+4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PARAMETROS_get_parametro_rec
        BL       PARAMETROS_get_parametro_rec
//  330   PROTOCOLO_bufferTmp[2] = tamanho>>8;
        LDR.N    R0,??DataTable11_14
        LDRH     R1,[SP, #+4]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[R0, #+2]
//  331   PROTOCOLO_bufferTmp[3] = tamanho;
        LDR.N    R0,??DataTable11_14
        LDRH     R1,[SP, #+4]
        STRB     R1,[R0, #+3]
//  332   
//  333   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,24+tamanho);
        LDRH     R0,[SP, #+4]
        ADDS     R1,R0,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable11_14
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  334 }
        POP      {R0-R2,PC}       ;; return
          CFI EndBlock cfiBlock10
//  335 /***********************************************************************************
//  336 *       Descrição       :       Decodifica o comando de escrita em um 
//  337 *                               dos parâmetro da tabela de leitura
//  338 *       Parametros      :       (unsigned short int) endereço
//  339 *                               (unsigned short int) tamanho do parâmetro
//  340 *                               (unsigned char*) ponteiro para o stream
//  341 *
//  342 *       Retorno         :       nenhum
//  343 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_escreve_parametro
        THUMB
//  344 void PROTOCOLO_decodifica_escreve_parametro(unsigned short int endereco,
//  345                                             unsigned short int tamanho,
//  346                                             unsigned char *pData){
PROTOCOLO_decodifica_escreve_parametro:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
        MOVS     R4,R1
//  347                                                     
//  348   PROTOCOLO_bufferTmp[0] = DXTNET_WRITE_PARAMETERS;
        LDR.N    R0,??DataTable11_14
        MOVS     R1,#+19
        STRB     R1,[R0, #+0]
//  349   
//  350   PARAMETROS_set_parametro_rec(endereco,tamanho,pData);
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R1,R4
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,R5
          CFI FunCall PARAMETROS_set_parametro_rec
        BL       PARAMETROS_set_parametro_rec
//  351   
//  352   PROTOCOLO_bufferTmp[2] = endereco>>8;
        LDR.N    R0,??DataTable11_14
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LSRS     R1,R5,#+8
        STRB     R1,[R0, #+2]
//  353   PROTOCOLO_bufferTmp[3] = endereco;
        LDR.N    R0,??DataTable11_14
        STRB     R5,[R0, #+3]
//  354   PROTOCOLO_bufferTmp[4] = tamanho>>8;
        LDR.N    R0,??DataTable11_14
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSRS     R1,R4,#+8
        STRB     R1,[R0, #+4]
//  355   PROTOCOLO_bufferTmp[5] = tamanho;
        LDR.N    R0,??DataTable11_14
        STRB     R4,[R0, #+5]
//  356   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,7);
        MOVS     R1,#+7
        LDR.N    R0,??DataTable11_14
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  357 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock11
//  358 /***********************************************************************************
//  359 *       Descrição       :       Decodifica o comando format
//  360 *       Parametros      :       nenhum
//  361 *       Retorno         :       nenhum
//  362 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_format
        THUMB
//  363 void PROTOCOLO_decodifica_format(void){  
PROTOCOLO_decodifica_format:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  364   
//  365   PROTOCOLO_bufferTmp[0] = DXTNET_FILE_FORMAT;
        LDR.N    R0,??DataTable11_14
        MOVS     R1,#+20
        STRB     R1,[R0, #+0]
//  366   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,3);  
        MOVS     R1,#+3
        LDR.N    R0,??DataTable11_14
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  367   
//  368   FSA_format_audio_memory();  
          CFI FunCall FSA_format_audio_memory
        BL       FSA_format_audio_memory
//  369 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock12
//  370 /***********************************************************************************
//  371 *       Descrição       :       Decodifica o comando para escrita de um bloco
//  372 *                               na memória flash de dados
//  373 *       Parametros      :       (unsigned int) endereço
//  374 *                               (unsigned char*) ponteiro para os dados
//  375 *                               (unsigned short int) tamanho do bloco de dados
//  376 *       Retorno         :       nenhum
//  377 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_write_block
        THUMB
//  378 void PROTOCOLO_decodifica_write_block(unsigned int endereco,unsigned char *pData,
//  379                                       unsigned short int size){
PROTOCOLO_decodifica_write_block:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  380                                         
//  381   PROTOCOLO_bufferTmp[0] = DXTNET_WRITE_BLOCK;
        LDR.N    R0,??DataTable11_14
        MOVS     R1,#+21
        STRB     R1,[R0, #+0]
//  382   PROTOCOLO_bufferTmp[2] = (endereco>>24);
        LSRS     R0,R4,#+24
        LDR.N    R1,??DataTable11_14
        STRB     R0,[R1, #+2]
//  383   PROTOCOLO_bufferTmp[3] = (endereco>>16);
        LSRS     R0,R4,#+16
        LDR.N    R1,??DataTable11_14
        STRB     R0,[R1, #+3]
//  384   PROTOCOLO_bufferTmp[4] = (endereco>>8);
        LSRS     R0,R4,#+8
        LDR.N    R1,??DataTable11_14
        STRB     R0,[R1, #+4]
//  385   PROTOCOLO_bufferTmp[5] = endereco;
        LDR.N    R0,??DataTable11_14
        STRB     R4,[R0, #+5]
//  386   PROTOCOLO_bufferTmp[6] = size>>8;
        LDR.N    R0,??DataTable11_14
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R1,R6,#+8
        STRB     R1,[R0, #+6]
//  387   PROTOCOLO_bufferTmp[7] = size;
        LDR.N    R0,??DataTable11_14
        STRB     R6,[R0, #+7]
//  388   
//  389   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,9);  
        MOVS     R1,#+9
        LDR.N    R0,??DataTable11_14
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  390   SST_writeAutoAddressInc(endereco+ENDERECO_INICIAL_FLASH,pData,size);                                        
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R5
        ADDS     R0,R4,#+8192
          CFI FunCall SST_writeAutoAddressInc
        BL       SST_writeAutoAddressInc
//  391 }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x1d1a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x4009c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     PROTOCOLO_bytesParaEnviar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     PROTOCOLO_bytesEnviados

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     PROTOCOLO_bufferTx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     0x4009c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     ??ultimoRecebido

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_7:
        DC32     PROTOCOLO_bytesRecebidos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_8:
        DC32     PROTOCOLO_bufferRx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_9:
        DC32     PROTOCOLO_novoPacote

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_10:
        DC32     0x4009c014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_11:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_12:
        DC32     PROTOCOLO_bufferRx+0x6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_13:
        DC32     PROTOCOLO_bufferRx+0x8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_14:
        DC32     PROTOCOLO_bufferTmp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_15:
        DC32     `?<Constant "MPG2-2.1.0-BR-MA">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_16:
        DC32     PROTOCOLO_bufferTmp+0x3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_17:
        DC32     PROTOCOLO_bufferTmp+0x17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_18:
        DC32     PROTOCOLO_bufferTmp+0x14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_19:
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
//  392 /***********************************************************************************
//  393 *       Fim do arquivo
//  394 ***********************************************************************************/
// 
// 1 542 bytes in section .bss
//    10 bytes in section .noinit (abs)
//    20 bytes in section .rodata
// 1 250 bytes in section .text
// 
// 1 250 bytes of CODE  memory
//    20 bytes of CONST memory
// 1 542 bytes of DATA  memory (+ 10 bytes shared)
//
//Errors: none
//Warnings: 4
