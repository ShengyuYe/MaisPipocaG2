///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     13/Sep/2017  18:10:01 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Protocolo /
//                    \Protocolo.c                                            /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Protocolo /
//                    \Protocolo.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\ /
//                    Debug\List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\D /
//                    ebug\List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Deb /
//                    ug\Obj\ --no_cse --no_unroll --no_inline                /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\Protoc /
//                    olo.s                                                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Protocolo

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN PARAMETROS_grava
        EXTERN PARAMETROS_le
        EXTERN SST_erase4kbSector
        EXTERN SST_highSpeedRead
        EXTERN SST_writeAutoAddressInc
        EXTERN UART_init
        EXTERN tabela_parametros
        EXTERN vTaskDelay

        PUBLIC PROTOCOLO_bufferRx
        PUBLIC PROTOCOLO_bufferTmp
        PUBLIC PROTOCOLO_bufferTx
        PUBLIC PROTOCOLO_bytesEnviados
        PUBLIC PROTOCOLO_bytesNoBufferTx
        PUBLIC PROTOCOLO_bytesParaEnviar
        PUBLIC PROTOCOLO_bytesRecebidos
        PUBLIC PROTOCOLO_checksum
        PUBLIC PROTOCOLO_decodeEscreveBloco
        PUBLIC PROTOCOLO_decodeEscreveTabelaMusicas
        PUBLIC PROTOCOLO_decodeFormataAudioFlash
        PUBLIC PROTOCOLO_decodeLeBloco
        PUBLIC PROTOCOLO_decodeLeituraTabelaMusicas
        PUBLIC PROTOCOLO_decodifica_escrita_valor_parametro
        PUBLIC PROTOCOLO_decodifica_info_sobre_parametro
        PUBLIC PROTOCOLO_decodifica_leitura_valor_parametro
        PUBLIC PROTOCOLO_decodifica_tamanho_parametros
        PUBLIC PROTOCOLO_enviaDadosDireto
        PUBLIC PROTOCOLO_enviaPacote
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Protocolo\Protocolo.c
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
//   32 #include "protocolo.h"
//   33 #include "..\..\includes.h"
//   34 
//   35 /***********************************************************************************
//   36 *       Definições locais
//   37 ***********************************************************************************/
//   38 #define TAM_BUF_TX                              256
//   39 #define TAM_BUF_RX                              256
//   40 
//   41 #define STX                                     0x02
//   42 #define ETX                                     0x03
//   43 #define DLE                                     0x10
//   44 
//   45 /***********************************************************************************
//   46 *       Variaveis locais
//   47 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   48 unsigned char PROTOCOLO_bufferTx[TAM_BUF_TX];
PROTOCOLO_bufferTx:
        DS8 256

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   49 unsigned char PROTOCOLO_bufferRx[TAM_BUF_RX];
PROTOCOLO_bufferRx:
        DS8 256

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   50 unsigned char PROTOCOLO_bufferTmp[TAM_BUF_TX];
PROTOCOLO_bufferTmp:
        DS8 256

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   51 unsigned char PROTOCOLO_bytesRecebidos;
PROTOCOLO_bytesRecebidos:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   52 unsigned char PROTOCOLO_bytesParaEnviar;
PROTOCOLO_bytesParaEnviar:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   53 unsigned char PROTOCOLO_bytesEnviados;
PROTOCOLO_bytesEnviados:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   54 unsigned char PROTOCOLO_novoPacote=0;
PROTOCOLO_novoPacote:
        DS8 1
//   55 
//   56 
//   57 /***********************************************************************************
//   58 *       Funções locais
//   59 ***********************************************************************************/
//   60 void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho);
//   61 unsigned char PROTOCOLO_checksum(unsigned char*pData,unsigned short int tamanho);
//   62 void PROTOCOLO_decodeLeBloco(unsigned long int endereco,unsigned char tamanho);
//   63 void PROTOCOLO_decodeEscreveBloco(unsigned long int endereco,unsigned char tamanho,unsigned char *dados);
//   64 void PROTOCOLO_decodeFormataAudioFlash(void);
//   65 void PROTOCOLO_decodeEscreveTabelaMusicas(unsigned char musica,
//   66                                           unsigned long int enderecoInicial,
//   67                                           unsigned long int tamanho);
//   68 void PROTOCOLO_decodeLeituraTabelaMusicas(unsigned char musica);
//   69 void PROTOCOLO_decodeEscreveParametro(unsigned char indice,unsigned short int valor);
//   70 void PROTOCOLO_decodeLeParametro(unsigned char indice);
//   71 void PROTOCOLO_decodeMensagemUsuario(unsigned char indice,unsigned char *msg);
//   72 void PROTOCOLO_decodeAssinaPlaca(void);
//   73 void PROTOCOLO_decodifica_tamanho_parametros(void);
//   74 void PROTOCOLO_decodifica_info_sobre_parametro(unsigned short int parametro);
//   75 void PROTOCOLO_decodifica_leitura_valor_parametro(unsigned short int parametro);
//   76 void PROTOCOLO_decodifica_escrita_valor_parametro(unsigned short int parametro,
//   77                                                   unsigned char tipo,
//   78                                                   unsigned char *valor);
//   79 
//   80 /***********************************************************************************
//   81 *       Implementação das funções
//   82 ***********************************************************************************/
//   83 
//   84 /***********************************************************************************
//   85 *       Descrição       :       Inicialização da biblioteca
//   86 *       Parametros      :       nenhum
//   87 *       Retorno         :       nenhum
//   88 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function PROTOCOLO_ini
        THUMB
//   89 void PROTOCOLO_ini(void){
PROTOCOLO_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   90   
//   91   UART_init(3,36600,NULL,NULL,NULL);    
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVW     R1,#+36600
        MOVS     R0,#+3
          CFI FunCall UART_init
        BL       UART_init
//   92 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   93 /***********************************************************************************
//   94 *       Descrição       :       Função para tratamento da interrupção
//   95 *                               da uart3
//   96 *       Parametros      :       nenhum
//   97 *       Retorno         :       nenhum
//   98 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PROTOCOLO_intVect
          CFI NoCalls
        THUMB
//   99 void PROTOCOLO_intVect(void){  
//  100   static unsigned char ultimoRecebido=0;
//  101   unsigned char dummy;
//  102   
//  103   switch(U3IIR_bit.IID){
PROTOCOLO_intVect:
        LDR.W    R1,??DataTable11  ;; 0x4009c008
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+1
        ANDS     R1,R1,#0x7
        CMP      R1,#+1
        BEQ.N    ??PROTOCOLO_intVect_0
        CMP      R1,#+2
        BEQ.N    ??PROTOCOLO_intVect_1
        CMP      R1,#+3
        BEQ.W    ??PROTOCOLO_intVect_2
        CMP      R1,#+6
        BEQ.W    ??PROTOCOLO_intVect_3
        B.N      ??PROTOCOLO_intVect_4
//  104     case THRE:
//  105                if(PROTOCOLO_bytesParaEnviar){
??PROTOCOLO_intVect_0:
        LDR.W    R1,??DataTable11_1
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??PROTOCOLO_intVect_5
//  106                  U3THR = PROTOCOLO_bufferTx[PROTOCOLO_bytesEnviados++];
        LDR.W    R1,??DataTable11_2
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable11_3
        LDRB     R1,[R1, R2]
        LDR.W    R2,??DataTable11_4  ;; 0x4009c000
        STRB     R1,[R2, #+0]
        LDR.W    R1,??DataTable11_2
        LDRB     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR.W    R2,??DataTable11_2
        STRB     R1,[R2, #+0]
//  107                  PROTOCOLO_bytesParaEnviar--;
        LDR.W    R1,??DataTable11_1
        LDRB     R1,[R1, #+0]
        SUBS     R1,R1,#+1
        LDR.W    R2,??DataTable11_1
        STRB     R1,[R2, #+0]
//  108                }
//  109                break; 
??PROTOCOLO_intVect_5:
        B.N      ??PROTOCOLO_intVect_4
//  110     case RDA : dummy = U3RBR;
??PROTOCOLO_intVect_1:
        LDR.W    R1,??DataTable11_4  ;; 0x4009c000
        LDRB     R1,[R1, #+0]
        MOVS     R0,R1
//  111                switch(dummy){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        CMP      R1,#+2
        BEQ.N    ??PROTOCOLO_intVect_6
        CMP      R1,#+3
        BEQ.N    ??PROTOCOLO_intVect_7
        CMP      R1,#+16
        BEQ.N    ??PROTOCOLO_intVect_8
        B.N      ??PROTOCOLO_intVect_9
//  112                  case STX: // Quando receber [DLE]+[STX] - marca inicio de novo pacote
//  113                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_6:
        LDR.W    R1,??DataTable11_5
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_10
//  114                              PROTOCOLO_bytesRecebidos = 0;
        LDR.W    R1,??DataTable11_6
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
//  115                              ultimoRecebido = 255;
        LDR.W    R1,??DataTable11_5
        MOVS     R2,#+255
        STRB     R2,[R1, #+0]
        B.N      ??PROTOCOLO_intVect_11
//  116                            }
//  117                            else{
//  118                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_10:
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??PROTOCOLO_intVect_12
//  119                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable11_7
        STRB     R0,[R1, R2]
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR.W    R2,??DataTable11_6
        STRB     R1,[R2, #+0]
//  120                              
//  121                              ultimoRecebido = STX;
??PROTOCOLO_intVect_12:
        LDR.W    R1,??DataTable11_5
        MOVS     R2,#+2
        STRB     R2,[R1, #+0]
//  122                            }
//  123                            
//  124                            break;
??PROTOCOLO_intVect_11:
        B.N      ??PROTOCOLO_intVect_13
//  125                  case ETX: // Quando receber [DLE]+[ETX] - marca fim do novo pacote
//  126                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_7:
        LDR.W    R1,??DataTable11_5
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_14
//  127                              PROTOCOLO_novoPacote = 255;
        LDR.W    R1,??DataTable11_8
        MOVS     R2,#+255
        STRB     R2,[R1, #+0]
//  128                              ultimoRecebido = 255;
        LDR.W    R1,??DataTable11_5
        MOVS     R2,#+255
        STRB     R2,[R1, #+0]
        B.N      ??PROTOCOLO_intVect_15
//  129                            }
//  130                            else{
//  131                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_14:
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??PROTOCOLO_intVect_16
//  132                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable11_7
        STRB     R0,[R1, R2]
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR.W    R2,??DataTable11_6
        STRB     R1,[R2, #+0]
//  133                              
//  134                              ultimoRecebido = ETX;
??PROTOCOLO_intVect_16:
        LDR.W    R1,??DataTable11_5
        MOVS     R2,#+3
        STRB     R2,[R1, #+0]
//  135                            }                   
//  136                            break;
??PROTOCOLO_intVect_15:
        B.N      ??PROTOCOLO_intVect_13
//  137                  case DLE: // Quando receber [DLE]+[DLE] recebe 0x10 dentro do buffer
//  138                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_8:
        LDR.W    R1,??DataTable11_5
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_17
//  139                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1))
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??PROTOCOLO_intVect_18
//  140                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable11_7
        STRB     R0,[R1, R2]
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR.W    R2,??DataTable11_6
        STRB     R1,[R2, #+0]
//  141                              ultimoRecebido = 255;
??PROTOCOLO_intVect_18:
        LDR.W    R1,??DataTable11_5
        MOVS     R2,#+255
        STRB     R2,[R1, #+0]
        B.N      ??PROTOCOLO_intVect_19
//  142                            }                      
//  143                            else
//  144                              ultimoRecebido = DLE;
??PROTOCOLO_intVect_17:
        LDR.W    R1,??DataTable11_5
        MOVS     R2,#+16
        STRB     R2,[R1, #+0]
//  145                            break;
??PROTOCOLO_intVect_19:
        B.N      ??PROTOCOLO_intVect_13
//  146                  default :
//  147                            if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_9:
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+255
        BEQ.N    ??PROTOCOLO_intVect_20
//  148                              PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                                            
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable11_7
        STRB     R0,[R1, R2]
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR.W    R2,??DataTable11_6
        STRB     R1,[R2, #+0]
//  149                            break;
//  150                }
//  151                
//  152                //ultimoRecebido = dummy;
//  153                break;      
??PROTOCOLO_intVect_20:
??PROTOCOLO_intVect_13:
        B.N      ??PROTOCOLO_intVect_4
//  154     case RLS : 
//  155                dummy = U3LSR;
??PROTOCOLO_intVect_2:
        LDR.W    R1,??DataTable11_9  ;; 0x4009c014
        LDRB     R1,[R1, #+0]
        MOVS     R0,R1
//  156                dummy = U3RBR;               
        LDR.W    R1,??DataTable11_4  ;; 0x4009c000
        LDRB     R1,[R1, #+0]
        MOVS     R0,R1
//  157                break;      
        B.N      ??PROTOCOLO_intVect_4
//  158     case CTI :
//  159                break;      
//  160   }  
//  161   
//  162   //Apaga o flag de interrupção pendente
//  163   CLRPEND0 |= (0x01)<<5;       
??PROTOCOLO_intVect_3:
??PROTOCOLO_intVect_4:
        LDR.W    R1,??DataTable11_10  ;; 0xe000e280
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x20
        LDR.W    R2,??DataTable11_10  ;; 0xe000e280
        STR      R1,[R2, #+0]
//  164 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE U3RBRTHR
        REQUIRE _A_U3LSR
        REQUIRE _A_U3FCR
        REQUIRE _A_CLRPEND0

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??ultimoRecebido:
        DS8 1
//  165 /***********************************************************************************
//  166 *       Descrição       :       Tick de timer para a biblioteca do protocolo
//  167 *       Parametros      :       nenhum
//  168 *       Retorno         :       nenhum
//  169 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PROTOCOLO_timerTick
          CFI NoCalls
        THUMB
//  170 void PROTOCOLO_timerTick(void){
//  171   
//  172   
//  173   
//  174 }
PROTOCOLO_timerTick:
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  175 /***********************************************************************************
//  176 *       Descrição       :       Calcula o checksum de um pacote de dados
//  177 *       Parametros      :       (unsigned char*) ponteiro para o início do pacote
//  178 *                               (unsigned short int) tamanho do pacote
//  179 *       Retorno         :       (unsigned char) checksum do pacote
//  180 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PROTOCOLO_checksum
          CFI NoCalls
        THUMB
//  181 unsigned char PROTOCOLO_checksum(unsigned char*pData,unsigned short int tamanho){
PROTOCOLO_checksum:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
//  182   unsigned short int soma=0;
        MOVS     R0,#+0
//  183 
//  184   for(unsigned short int i=0;i<tamanho;i++)
        MOVS     R3,#+0
??PROTOCOLO_checksum_0:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R3,R1
        BCS.N    ??PROTOCOLO_checksum_1
//  185     soma+= pData[i];
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRB     R4,[R3, R2]
        ADDS     R0,R4,R0
        ADDS     R3,R3,#+1
        B.N      ??PROTOCOLO_checksum_0
//  186   
//  187   return (unsigned char)(256-soma);    
??PROTOCOLO_checksum_1:
        RSBS     R0,R0,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  188 }
//  189 /***********************************************************************************
//  190 *       Descrição       :       Thread do protocolo
//  191 *       Protocolo       :       (void*) pPar
//  192 *       Retorno         :       nenhum
//  193 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PROTOCOLO_main
        THUMB
//  194 void PROTOCOLO_main(void*pPar){
PROTOCOLO_main:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  195   
//  196   PROTOCOLO_ini();
          CFI FunCall PROTOCOLO_ini
        BL       PROTOCOLO_ini
//  197   //WATCHDOG_init(0);  
//  198   
//  199   for(;;){
//  200         
//  201     //FEEDS_THE_DOG();
//  202     
//  203     if(PROTOCOLO_novoPacote){
??PROTOCOLO_main_0:
        LDR.W    R0,??DataTable11_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??PROTOCOLO_main_1
//  204       PROTOCOLO_novoPacote = 0;        
        LDR.W    R0,??DataTable11_8
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  205       if(PROTOCOLO_checksum(PROTOCOLO_bufferRx,PROTOCOLO_bufferRx[1]-1)==PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos-1]){      
        LDR.W    R0,??DataTable11_7
        LDRB     R0,[R0, #+1]
        SUBS     R1,R0,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable11_7
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.W    R1,??DataTable11_6
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable11_7
        ADDS     R1,R1,R2
        LDRB     R1,[R1, #-1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BNE.W    ??PROTOCOLO_main_1
//  206         switch(PROTOCOLO_bufferRx[0]){
        LDR.W    R0,??DataTable11_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??PROTOCOLO_main_2
        BCC.W    ??PROTOCOLO_main_1
        CMP      R0,#+3
        BEQ.N    ??PROTOCOLO_main_3
        BCC.N    ??PROTOCOLO_main_4
        CMP      R0,#+5
        BEQ.N    ??PROTOCOLO_main_5
        BCC.N    ??PROTOCOLO_main_6
        CMP      R0,#+7
        BEQ.N    ??PROTOCOLO_main_7
        BCC.N    ??PROTOCOLO_main_8
        CMP      R0,#+9
        BEQ.N    ??PROTOCOLO_main_9
        BCC.N    ??PROTOCOLO_main_10
        B.N      ??PROTOCOLO_main_1
//  207          case READ_DATA_FLASH_BLOCK:              
//  208               PROTOCOLO_decodeLeBloco     (PROTOCOLO_bufferRx[2]<<24 | PROTOCOLO_bufferRx[3]<<16 | PROTOCOLO_bufferRx[4]<<8 | PROTOCOLO_bufferRx[5],PROTOCOLO_bufferRx[6]);
??PROTOCOLO_main_2:
        LDR.W    R0,??DataTable11_7
        LDRB     R1,[R0, #+6]
        LDR.W    R0,??DataTable11_7
        LDRB     R0,[R0, #+2]
        LDR.W    R2,??DataTable11_7
        LDRB     R2,[R2, #+3]
        LSLS     R2,R2,#+16
        ORRS     R0,R2,R0, LSL #+24
        LDR.W    R2,??DataTable11_7
        LDRB     R2,[R2, #+4]
        ORRS     R0,R0,R2, LSL #+8
        LDR.W    R2,??DataTable11_7
        LDRB     R2,[R2, #+5]
        ORRS     R0,R2,R0
          CFI FunCall PROTOCOLO_decodeLeBloco
        BL       PROTOCOLO_decodeLeBloco
//  209               break;
        B.N      ??PROTOCOLO_main_1
//  210          case WRITE_DATA_FLASH_BLOCK:
//  211               PROTOCOLO_decodeEscreveBloco(PROTOCOLO_bufferRx[2]<<24 | PROTOCOLO_bufferRx[3]<<16 | PROTOCOLO_bufferRx[4]<<8 | PROTOCOLO_bufferRx[5],PROTOCOLO_bufferRx[6],&PROTOCOLO_bufferRx[7]);
??PROTOCOLO_main_4:
        LDR.W    R2,??DataTable11_11
        LDR.W    R0,??DataTable11_7
        LDRB     R1,[R0, #+6]
        LDR.W    R0,??DataTable11_7
        LDRB     R0,[R0, #+2]
        LDR.W    R3,??DataTable11_7
        LDRB     R3,[R3, #+3]
        LSLS     R3,R3,#+16
        ORRS     R0,R3,R0, LSL #+24
        LDR.W    R3,??DataTable11_7
        LDRB     R3,[R3, #+4]
        ORRS     R0,R0,R3, LSL #+8
        LDR.W    R3,??DataTable11_7
        LDRB     R3,[R3, #+5]
        ORRS     R0,R3,R0
          CFI FunCall PROTOCOLO_decodeEscreveBloco
        BL       PROTOCOLO_decodeEscreveBloco
//  212               break;
        B.N      ??PROTOCOLO_main_1
//  213          case FORMAT_AUDIO_FLASH:
//  214               PROTOCOLO_decodeFormataAudioFlash();
??PROTOCOLO_main_3:
          CFI FunCall PROTOCOLO_decodeFormataAudioFlash
        BL       PROTOCOLO_decodeFormataAudioFlash
//  215               break;
        B.N      ??PROTOCOLO_main_1
//  216          case WRITE_MUSIC_TABLE:
//  217               PROTOCOLO_decodeEscreveTabelaMusicas(PROTOCOLO_bufferRx[2],
//  218                                                    PROTOCOLO_bufferRx[3]<<16 | PROTOCOLO_bufferRx[4]<<8 | PROTOCOLO_bufferRx[5],
//  219                                                    PROTOCOLO_bufferRx[6]<<16 | PROTOCOLO_bufferRx[7]<<8 | PROTOCOLO_bufferRx[8]);
??PROTOCOLO_main_6:
        LDR.W    R0,??DataTable11_7
        LDRB     R0,[R0, #+6]
        LDR.W    R1,??DataTable11_7
        LDRB     R1,[R1, #+7]
        LSLS     R1,R1,#+8
        ORRS     R0,R1,R0, LSL #+16
        LDR.W    R1,??DataTable11_7
        LDRB     R1,[R1, #+8]
        ORRS     R2,R1,R0
        LDR.W    R0,??DataTable11_7
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable11_7
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+8
        ORRS     R0,R1,R0, LSL #+16
        LDR.W    R1,??DataTable11_7
        LDRB     R1,[R1, #+5]
        ORRS     R1,R1,R0
        LDR.W    R0,??DataTable11_7
        LDRB     R0,[R0, #+2]
          CFI FunCall PROTOCOLO_decodeEscreveTabelaMusicas
        BL       PROTOCOLO_decodeEscreveTabelaMusicas
//  220               break;
        B.N      ??PROTOCOLO_main_1
//  221          case READ_MUSIC_TABLE:
//  222               PROTOCOLO_decodeLeituraTabelaMusicas(PROTOCOLO_bufferRx[2]);
??PROTOCOLO_main_5:
        LDR.W    R0,??DataTable11_7
        LDRB     R0,[R0, #+2]
          CFI FunCall PROTOCOLO_decodeLeituraTabelaMusicas
        BL       PROTOCOLO_decodeLeituraTabelaMusicas
//  223               break;          
        B.N      ??PROTOCOLO_main_1
//  224          case GET_PARAMETERS_LENGHT:
//  225               PROTOCOLO_decodifica_tamanho_parametros();
??PROTOCOLO_main_8:
          CFI FunCall PROTOCOLO_decodifica_tamanho_parametros
        BL       PROTOCOLO_decodifica_tamanho_parametros
//  226               break;
        B.N      ??PROTOCOLO_main_1
//  227          case GET_PARAMETER_INFO:
//  228               PROTOCOLO_decodifica_info_sobre_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3]);
??PROTOCOLO_main_7:
        LDR.W    R0,??DataTable11_7
        LDRB     R0,[R0, #+2]
        LDR.W    R1,??DataTable11_7
        LDRB     R1,[R1, #+3]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PROTOCOLO_decodifica_info_sobre_parametro
        BL       PROTOCOLO_decodifica_info_sobre_parametro
//  229               break;
        B.N      ??PROTOCOLO_main_1
//  230          case GET_PARAMETER_DATA:
//  231               PROTOCOLO_decodifica_leitura_valor_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3]);
??PROTOCOLO_main_10:
        LDR.W    R0,??DataTable11_7
        LDRB     R0,[R0, #+2]
        LDR.W    R1,??DataTable11_7
        LDRB     R1,[R1, #+3]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PROTOCOLO_decodifica_leitura_valor_parametro
        BL       PROTOCOLO_decodifica_leitura_valor_parametro
//  232               break;
        B.N      ??PROTOCOLO_main_1
//  233          case SET_PARAMETER_DATA:
//  234               PROTOCOLO_decodifica_escrita_valor_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3],
//  235                                                            PROTOCOLO_bufferRx[4],
//  236                                                           &PROTOCOLO_bufferRx[5]);
??PROTOCOLO_main_9:
        LDR.W    R2,??DataTable11_12
        LDR.W    R0,??DataTable11_7
        LDRB     R1,[R0, #+4]
        LDR.W    R0,??DataTable11_7
        LDRB     R0,[R0, #+2]
        LDR.W    R3,??DataTable11_7
        LDRB     R3,[R3, #+3]
        ORRS     R0,R3,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PROTOCOLO_decodifica_escrita_valor_parametro
        BL       PROTOCOLO_decodifica_escrita_valor_parametro
//  237               break;
//  238         }
//  239       }      
//  240     }
//  241     vTaskDelay(1);
??PROTOCOLO_main_1:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??PROTOCOLO_main_0
          CFI EndBlock cfiBlock4
//  242   }    
//  243 }
//  244 /***********************************************************************************
//  245 *       Descrição       :       Encapsula os dados que serão enviados
//  246 *                               pela rede
//  247 *       Parametros      :       (unsigned char*) ponteiro para os dados que serão
//  248 *                                               enviados
//  249 *       Retorno         :       nenhum
//  250 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function PROTOCOLO_enviaPacote
          CFI NoCalls
        THUMB
//  251 void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho){
PROTOCOLO_enviaPacote:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  252   unsigned char indice=0;
        MOVS     R2,#+0
//  253   
//  254   PROTOCOLO_bufferTx[indice++] = DLE;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.W    R3,??DataTable11_3
        MOVS     R4,#+16
        STRB     R4,[R2, R3]
        ADDS     R2,R2,#+1
//  255   PROTOCOLO_bufferTx[indice++] = STX;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.W    R3,??DataTable11_3
        MOVS     R4,#+2
        STRB     R4,[R2, R3]
        ADDS     R2,R2,#+1
//  256   for(unsigned char i=0;i<tamanho;i++)
        MOVS     R3,#+0
??PROTOCOLO_enviaPacote_0:
        MOVS     R4,R3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R4,R1
        BCS.N    ??PROTOCOLO_enviaPacote_1
//  257     if(pData[i]==DLE){
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R4,[R3, R0]
        CMP      R4,#+16
        BNE.N    ??PROTOCOLO_enviaPacote_2
//  258       PROTOCOLO_bufferTx[indice++] = DLE;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.W    R4,??DataTable11_3
        MOVS     R5,#+16
        STRB     R5,[R2, R4]
        ADDS     R2,R2,#+1
//  259       PROTOCOLO_bufferTx[indice++] = DLE;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.W    R4,??DataTable11_3
        MOVS     R5,#+16
        STRB     R5,[R2, R4]
        ADDS     R2,R2,#+1
        B.N      ??PROTOCOLO_enviaPacote_3
//  260     }
//  261     else
//  262       PROTOCOLO_bufferTx[indice++] = pData[i];
??PROTOCOLO_enviaPacote_2:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R4,[R3, R0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.W    R5,??DataTable11_3
        STRB     R4,[R2, R5]
        ADDS     R2,R2,#+1
??PROTOCOLO_enviaPacote_3:
        ADDS     R3,R3,#+1
        B.N      ??PROTOCOLO_enviaPacote_0
//  263   
//  264   PROTOCOLO_bufferTx[indice++] = DLE;
??PROTOCOLO_enviaPacote_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.W    R3,??DataTable11_3
        MOVS     R4,#+16
        STRB     R4,[R2, R3]
        ADDS     R2,R2,#+1
//  265   PROTOCOLO_bufferTx[indice++] = ETX;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.W    R3,??DataTable11_3
        MOVS     R4,#+3
        STRB     R4,[R2, R3]
        ADDS     R2,R2,#+1
//  266   
//  267   PROTOCOLO_bytesParaEnviar = indice-1;
        SUBS     R3,R2,#+1
        LDR.W    R4,??DataTable11_1
        STRB     R3,[R4, #+0]
//  268   PROTOCOLO_bytesEnviados = 1;
        LDR.W    R3,??DataTable11_2
        MOVS     R4,#+1
        STRB     R4,[R3, #+0]
//  269   U3THR = PROTOCOLO_bufferTx[0];  
        LDR.W    R3,??DataTable11_4  ;; 0x4009c000
        LDR.W    R4,??DataTable11_3
        LDRB     R4,[R4, #+0]
        STRB     R4,[R3, #+0]
//  270 }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
        REQUIRE U3RBRTHR
//  271 /***********************************************************************************
//  272 *       Descrição       :       Lê um bloco de dados da dataflash
//  273 *       Parametros      :       nenhum
//  274 *       Retorno         :       nenhum
//  275 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function PROTOCOLO_decodeLeBloco
        THUMB
//  276 void PROTOCOLO_decodeLeBloco(unsigned long int endereco,unsigned char tamanho){
PROTOCOLO_decodeLeBloco:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  277                                     
//  278   if(tamanho>128){     
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+129
        BLT.N    ??PROTOCOLO_decodeLeBloco_0
//  279     PROTOCOLO_bufferTmp[0] = READ_DATA_FLASH_BLOCK | 0x80;
        LDR.W    R0,??DataTable11_13
        MOVS     R1,#+129
        STRB     R1,[R0, #+0]
//  280     PROTOCOLO_bufferTmp[1] = 4;
        LDR.W    R0,??DataTable11_13
        MOVS     R1,#+4
        STRB     R1,[R0, #+1]
//  281     PROTOCOLO_bufferTmp[2] = 1;
        LDR.W    R0,??DataTable11_13
        MOVS     R1,#+1
        STRB     R1,[R0, #+2]
//  282     PROTOCOLO_bufferTmp[3] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,3);
        MOVS     R1,#+3
        LDR.W    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.W    R1,??DataTable11_13
        STRB     R0,[R1, #+3]
//  283     
//  284     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,4);  
        MOVS     R1,#+4
        LDR.W    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
        B.N      ??PROTOCOLO_decodeLeBloco_1
//  285   }
//  286   else{
//  287     PROTOCOLO_bufferTmp[0] = READ_DATA_FLASH_BLOCK;
??PROTOCOLO_decodeLeBloco_0:
        LDR.W    R0,??DataTable11_13
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  288     PROTOCOLO_bufferTmp[1] = tamanho+8;
        LDR.W    R0,??DataTable11_13
        ADDS     R1,R5,#+8
        STRB     R1,[R0, #+1]
//  289     PROTOCOLO_bufferTmp[2] = endereco>>24;
        LSRS     R0,R4,#+24
        LDR.W    R1,??DataTable11_13
        STRB     R0,[R1, #+2]
//  290     PROTOCOLO_bufferTmp[3] = endereco>>16;
        LSRS     R0,R4,#+16
        LDR.W    R1,??DataTable11_13
        STRB     R0,[R1, #+3]
//  291     PROTOCOLO_bufferTmp[4] = endereco>>8;
        LSRS     R0,R4,#+8
        LDR.W    R1,??DataTable11_13
        STRB     R0,[R1, #+4]
//  292     PROTOCOLO_bufferTmp[5] = endereco;
        LDR.W    R0,??DataTable11_13
        STRB     R4,[R0, #+5]
//  293     PROTOCOLO_bufferTmp[6] = tamanho;
        LDR.W    R0,??DataTable11_13
        STRB     R5,[R0, #+6]
//  294    
//  295     SST_highSpeedRead(endereco+AREA_AUDIO,&PROTOCOLO_bufferTmp[7],tamanho);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR.W    R1,??DataTable11_14
        ADDS     R0,R4,#+12288
          CFI FunCall SST_highSpeedRead
        BL       SST_highSpeedRead
//  296   
//  297     PROTOCOLO_bufferTmp[7+tamanho] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,7+tamanho);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R5,#+7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable11_13
        ADDS     R1,R5,R1
        STRB     R0,[R1, #+7]
//  298     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,tamanho+8);  
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R5,#+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  299   }
//  300 }
??PROTOCOLO_decodeLeBloco_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock6
//  301 /***********************************************************************************
//  302 *       Descrição       :       Escreve um bloco de dados
//  303 *                               na memória de dados
//  304 *       Parametros      :       (unsigned int) endereco inicial da escrita
//  305 *                               (unsigned char) tamanho do bloco
//  306 *                               (unsigned char*) ponteiro para os dados
//  307 *       Retorno         :       nenhum
//  308 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function PROTOCOLO_decodeEscreveBloco
        THUMB
//  309 void PROTOCOLO_decodeEscreveBloco(unsigned long int endereco,unsigned char tamanho,
//  310                                   unsigned char *dados){
PROTOCOLO_decodeEscreveBloco:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  311   
//  312   if(tamanho>128){    
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+129
        BLT.N    ??PROTOCOLO_decodeEscreveBloco_0
//  313     PROTOCOLO_bufferTmp[0] = WRITE_DATA_FLASH_BLOCK | 0x80;
        LDR.W    R0,??DataTable11_13
        MOVS     R1,#+130
        STRB     R1,[R0, #+0]
//  314     PROTOCOLO_bufferTmp[1] = 4;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+4
        STRB     R1,[R0, #+1]
//  315     PROTOCOLO_bufferTmp[2] = 1;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+1
        STRB     R1,[R0, #+2]
//  316     PROTOCOLO_bufferTmp[3] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,3);
        MOVS     R1,#+3
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+3]
//  317     
//  318     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,4);      
        MOVS     R1,#+4
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
        B.N      ??PROTOCOLO_decodeEscreveBloco_1
//  319   }
//  320   else{
//  321     PROTOCOLO_bufferTmp[0] = WRITE_DATA_FLASH_BLOCK;
??PROTOCOLO_decodeEscreveBloco_0:
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  322     PROTOCOLO_bufferTmp[1] = 8;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+8
        STRB     R1,[R0, #+1]
//  323     PROTOCOLO_bufferTmp[2] = endereco>>24;
        LSRS     R0,R4,#+24
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+2]
//  324     PROTOCOLO_bufferTmp[3] = endereco>>16;
        LSRS     R0,R4,#+16
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+3]
//  325     PROTOCOLO_bufferTmp[4] = endereco>>8;
        LSRS     R0,R4,#+8
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+4]
//  326     PROTOCOLO_bufferTmp[5] = endereco;
        LDR.N    R0,??DataTable11_13
        STRB     R4,[R0, #+5]
//  327     PROTOCOLO_bufferTmp[6] = tamanho;
        LDR.N    R0,??DataTable11_13
        STRB     R5,[R0, #+6]
//  328    
//  329     SST_writeAutoAddressInc(endereco+AREA_AUDIO,dados,tamanho);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        ADDS     R0,R4,#+12288
          CFI FunCall SST_writeAutoAddressInc
        BL       SST_writeAutoAddressInc
//  330   
//  331     PROTOCOLO_bufferTmp[7] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,7);
        MOVS     R1,#+7
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+7]
//  332     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,8);  
        MOVS     R1,#+8
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  333   }                                    
//  334 }
??PROTOCOLO_decodeEscreveBloco_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock7
//  335 /***********************************************************************************
//  336 *       Descrição       :      Formata a área da flash onde são alocados
//  337 *                              os arquivos de audio
//  338 *       Parametros      :      nenhum
//  339 *       Retorno         :      nenhum
//  340 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function PROTOCOLO_decodeFormataAudioFlash
        THUMB
//  341 void PROTOCOLO_decodeFormataAudioFlash(void){
PROTOCOLO_decodeFormataAudioFlash:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  342   unsigned long int enderecoInicial=AREA_AUDIO;
        MOV      R4,#+12288
//  343   
//  344   for(unsigned short int i=0;i<599;i++){
        MOVS     R5,#+0
??PROTOCOLO_decodeFormataAudioFlash_0:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVW     R0,#+599
        CMP      R5,R0
        BGE.N    ??PROTOCOLO_decodeFormataAudioFlash_1
//  345     SST_erase4kbSector(enderecoInicial);
        MOVS     R0,R4
          CFI FunCall SST_erase4kbSector
        BL       SST_erase4kbSector
//  346     enderecoInicial+=4096;
        ADDS     R4,R4,#+4096
//  347     //FEEDS_THE_DOG();
//  348   }
        ADDS     R5,R5,#+1
        B.N      ??PROTOCOLO_decodeFormataAudioFlash_0
//  349     
//  350   PROTOCOLO_bufferTmp[0] = FORMAT_AUDIO_FLASH;
??PROTOCOLO_decodeFormataAudioFlash_1:
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  351   PROTOCOLO_bufferTmp[1] = 3;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+3
        STRB     R1,[R0, #+1]
//  352   PROTOCOLO_bufferTmp[2] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,2);
        MOVS     R1,#+2
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+2]
//  353   
//  354   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,3);  
        MOVS     R1,#+3
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  355 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock8
//  356 /***********************************************************************************
//  357 *       Descrição       :       Escreve valores na tabela de musica do sistema
//  358 *       Parametros      :       (unsigned char) música
//  359 *                               (unsigned long int) endereco inicial
//  360 *                               (unsigned long int) tamanho da música
//  361 *       Retorno         :       nenhum
//  362 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function PROTOCOLO_decodeEscreveTabelaMusicas
        THUMB
//  363 void PROTOCOLO_decodeEscreveTabelaMusicas(unsigned char musica,
//  364                                           unsigned long int enderecoInicial,
//  365                                           unsigned long int tamanho){
PROTOCOLO_decodeEscreveTabelaMusicas:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  366                                             
//  367   if(musica>3){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??PROTOCOLO_decodeEscreveTabelaMusicas_0
//  368     PROTOCOLO_bufferTmp[0] = WRITE_MUSIC_TABLE | 0x80;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+132
        STRB     R1,[R0, #+0]
//  369     PROTOCOLO_bufferTmp[1] = 4;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+4
        STRB     R1,[R0, #+1]
//  370     PROTOCOLO_bufferTmp[2] = 1;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+1
        STRB     R1,[R0, #+2]
//  371     PROTOCOLO_bufferTmp[3] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,3);
        MOVS     R1,#+3
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+3]
//  372     
//  373     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,4);                                                    
        MOVS     R1,#+4
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
        B.N      ??PROTOCOLO_decodeEscreveTabelaMusicas_1
//  374   } 
//  375   else{
//  376     
//  377     unsigned int temp;
//  378     
//  379     temp = enderecoInicial + AREA_AUDIO;
??PROTOCOLO_decodeEscreveTabelaMusicas_0:
        ADDS     R0,R5,#+12288
        STR      R0,[SP, #+0]
//  380     PARAMETROS_grava(ADR_INICIO_BLOCO_MUSICA+musica,(void*)&temp);
        ADD      R1,SP,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+18
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  381     
//  382     temp = tamanho;
        STR      R6,[SP, #+0]
//  383     PARAMETROS_grava(ADR_TAMANHO_BLOCO_MUSICA+musica,(void*)&temp);
        ADD      R1,SP,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+22
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  384     
//  385     PROTOCOLO_bufferTmp[0] = WRITE_MUSIC_TABLE;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+4
        STRB     R1,[R0, #+0]
//  386     PROTOCOLO_bufferTmp[1] = 10;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+10
        STRB     R1,[R0, #+1]
//  387     PROTOCOLO_bufferTmp[2] = musica;
        LDR.N    R0,??DataTable11_13
        STRB     R4,[R0, #+2]
//  388     PROTOCOLO_bufferTmp[3] = enderecoInicial>>16;
        LSRS     R0,R5,#+16
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+3]
//  389     PROTOCOLO_bufferTmp[4] = enderecoInicial>>8;
        LSRS     R0,R5,#+8
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+4]
//  390     PROTOCOLO_bufferTmp[5] = enderecoInicial;
        LDR.N    R0,??DataTable11_13
        STRB     R5,[R0, #+5]
//  391     PROTOCOLO_bufferTmp[6] = tamanho>>16;
        LSRS     R0,R6,#+16
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+6]
//  392     PROTOCOLO_bufferTmp[7] = tamanho>>8;
        LSRS     R0,R6,#+8
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+7]
//  393     PROTOCOLO_bufferTmp[8] = tamanho;
        LDR.N    R0,??DataTable11_13
        STRB     R6,[R0, #+8]
//  394     PROTOCOLO_bufferTmp[9] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,9);
        MOVS     R1,#+9
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+9]
//  395     
//  396     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,10);                      
        MOVS     R1,#+10
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  397   }                                                                                                                                     
//  398 }
??PROTOCOLO_decodeEscreveTabelaMusicas_1:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock9
//  399 /***********************************************************************************
//  400 *       Descrição       :       Lê os valores da tabela de música do sistema
//  401 *       Parametros      :       (unsigned char) música
//  402 *       Retorno         :       nenhum
//  403 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function PROTOCOLO_decodeLeituraTabelaMusicas
        THUMB
//  404 void PROTOCOLO_decodeLeituraTabelaMusicas(unsigned char musica){
PROTOCOLO_decodeLeituraTabelaMusicas:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
        MOVS     R4,R0
//  405   
//  406   if(musica>3){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??PROTOCOLO_decodeLeituraTabelaMusicas_0
//  407     PROTOCOLO_bufferTmp[0] = READ_MUSIC_TABLE | 0x80;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+133
        STRB     R1,[R0, #+0]
//  408     PROTOCOLO_bufferTmp[1] = 4;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+4
        STRB     R1,[R0, #+1]
//  409     PROTOCOLO_bufferTmp[2] = 1;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+1
        STRB     R1,[R0, #+2]
//  410     PROTOCOLO_bufferTmp[3] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,3);
        MOVS     R1,#+3
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+3]
//  411     
//  412     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,4);   
        MOVS     R1,#+4
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
        B.N      ??PROTOCOLO_decodeLeituraTabelaMusicas_1
//  413   }
//  414   else{
//  415     unsigned int enderecoInicial;
//  416     unsigned int tamanho;
//  417     
//  418     
//  419     PARAMETROS_le(ADR_INICIO_BLOCO_MUSICA+musica ,(void*)&enderecoInicial);
??PROTOCOLO_decodeLeituraTabelaMusicas_0:
        ADD      R1,SP,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+18
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  420     PARAMETROS_le(ADR_TAMANHO_BLOCO_MUSICA+musica,(void*)&tamanho);
        ADD      R1,SP,#+4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+22
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  421     
//  422     enderecoInicial -= AREA_AUDIO;
        LDR      R0,[SP, #+0]
        SUBS     R0,R0,#+12288
        STR      R0,[SP, #+0]
//  423     
//  424     PROTOCOLO_bufferTmp[0] = READ_MUSIC_TABLE;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+5
        STRB     R1,[R0, #+0]
//  425     PROTOCOLO_bufferTmp[1] = 10;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+10
        STRB     R1,[R0, #+1]
//  426     PROTOCOLO_bufferTmp[2] = musica;
        LDR.N    R0,??DataTable11_13
        STRB     R4,[R0, #+2]
//  427     PROTOCOLO_bufferTmp[3] = enderecoInicial>>16;
        LDR      R0,[SP, #+0]
        LSRS     R0,R0,#+16
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+3]
//  428     PROTOCOLO_bufferTmp[4] = enderecoInicial>>8;
        LDR      R0,[SP, #+0]
        LSRS     R0,R0,#+8
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+4]
//  429     PROTOCOLO_bufferTmp[5] = enderecoInicial;
        LDR.N    R0,??DataTable11_13
        LDR      R1,[SP, #+0]
        STRB     R1,[R0, #+5]
//  430     PROTOCOLO_bufferTmp[6] = tamanho>>16;
        LDR      R0,[SP, #+4]
        LSRS     R0,R0,#+16
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+6]
//  431     PROTOCOLO_bufferTmp[7] = tamanho>>8;
        LDR      R0,[SP, #+4]
        LSRS     R0,R0,#+8
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+7]
//  432     PROTOCOLO_bufferTmp[8] = tamanho;
        LDR.N    R0,??DataTable11_13
        LDR      R1,[SP, #+4]
        STRB     R1,[R0, #+8]
//  433     PROTOCOLO_bufferTmp[9] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,9);
        MOVS     R1,#+9
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+9]
//  434     
//  435     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,10);   
        MOVS     R1,#+10
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  436   }  
//  437 }
??PROTOCOLO_decodeLeituraTabelaMusicas_1:
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock10
//  438 /***********************************************************************************
//  439 *       Descrição       :       envia data direto
//  440 *       Parametros      :       nenhum
//  441 *       Retorno         :       nenhum
//  442 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function PROTOCOLO_enviaDadosDireto
          CFI NoCalls
        THUMB
//  443 void PROTOCOLO_enviaDadosDireto(unsigned char *buffer,unsigned char tamanho){
PROTOCOLO_enviaDadosDireto:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  444   
//  445   for(unsigned char i=0;i<tamanho;i++)
        MOVS     R2,#+0
??PROTOCOLO_enviaDadosDireto_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R2,R1
        BCS.N    ??PROTOCOLO_enviaDadosDireto_1
//  446     PROTOCOLO_bufferTx[i] = buffer[i];
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRB     R3,[R2, R0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R4,??DataTable11_3
        STRB     R3,[R2, R4]
        ADDS     R2,R2,#+1
        B.N      ??PROTOCOLO_enviaDadosDireto_0
//  447   
//  448   PROTOCOLO_bytesParaEnviar = tamanho-1;
??PROTOCOLO_enviaDadosDireto_1:
        SUBS     R2,R1,#+1
        LDR.N    R3,??DataTable11_1
        STRB     R2,[R3, #+0]
//  449   PROTOCOLO_bytesEnviados = 1;
        LDR.N    R2,??DataTable11_2
        MOVS     R3,#+1
        STRB     R3,[R2, #+0]
//  450   U3THR = buffer[0];    
        LDR.N    R2,??DataTable11_4  ;; 0x4009c000
        LDRB     R3,[R0, #+0]
        STRB     R3,[R2, #+0]
//  451 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock11
        REQUIRE U3RBRTHR
//  452 /***********************************************************************************
//  453 *       Descrição       :       Verifica se o buffer de transmissão está vazio
//  454 *       Parametros      :       nenhum
//  455 *       Retorno         :       Tamanho do buffer de transmissão
//  456 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function PROTOCOLO_bytesNoBufferTx
          CFI NoCalls
        THUMB
//  457 unsigned short int PROTOCOLO_bytesNoBufferTx(void){
//  458   
//  459   return PROTOCOLO_bytesParaEnviar;
PROTOCOLO_bytesNoBufferTx:
        LDR.N    R0,??DataTable11_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock12
//  460 }
//  461 /***********************************************************************************
//  462 *       Descrição       :       Decodofica o comando para leitura do tamanho
//  463 *                               da listagem de parâmetros
//  464 *       Parametros      :       nenhum
//  465 *       Retorno         :       nenhum
//  466 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_tamanho_parametros
        THUMB
//  467 void PROTOCOLO_decodifica_tamanho_parametros(void){
PROTOCOLO_decodifica_tamanho_parametros:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  468   
//  469     PROTOCOLO_bufferTmp[0] = GET_PARAMETERS_LENGHT;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+6
        STRB     R1,[R0, #+0]
//  470     PROTOCOLO_bufferTmp[1] = 6;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+6
        STRB     R1,[R0, #+1]
//  471     PROTOCOLO_bufferTmp[2] = TAMANHO_PARAMETROS>>8;    
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+0
        STRB     R1,[R0, #+2]
//  472     PROTOCOLO_bufferTmp[3] = TAMANHO_PARAMETROS;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+26
        STRB     R1,[R0, #+3]
//  473     PROTOCOLO_bufferTmp[4] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,4);
        MOVS     R1,#+4
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+4]
//  474     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,5);    
        MOVS     R1,#+5
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  475 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock13
//  476 /***********************************************************************************
//  477 *       Descrição       :       Decodifica o comando que solocita a informação
//  478 *                               sobre um dos parâmetros
//  479 *       Parametros      :       (unsigned int) parametro
//  480 *       Retorno         :       nenhum
//  481 ***********************************************************************************/
//  482 extern const sPARAMETROS tabela_parametros[];

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_info_sobre_parametro
        THUMB
//  483 void PROTOCOLO_decodifica_info_sobre_parametro(unsigned short int parametro){
PROTOCOLO_decodifica_info_sobre_parametro:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  484   
//  485    PROTOCOLO_bufferTmp[0] = GET_PARAMETER_INFO;
        LDR.N    R0,??DataTable11_13
        MOVS     R1,#+7
        STRB     R1,[R0, #+0]
//  486    PROTOCOLO_bufferTmp[1] = parametro;
        LDR.N    R0,??DataTable11_13
        STRB     R4,[R0, #+1]
//  487    PROTOCOLO_bufferTmp[2] = tabela_parametros[parametro].length;
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+44
        LDR.N    R1,??DataTable11_15
        MLA      R0,R0,R4,R1
        LDRH     R0,[R0, #+4]
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+2]
//  488    
//  489    for(unsigned char i=0;i<32;i++)    
        MOVS     R0,#+0
??PROTOCOLO_decodifica_info_sobre_parametro_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+32
        BGE.N    ??PROTOCOLO_decodifica_info_sobre_parametro_1
//  490      PROTOCOLO_bufferTmp[3+i] = tabela_parametros[parametro].nome[i];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R1,#+44
        LDR.N    R2,??DataTable11_15
        MLA      R1,R1,R4,R2
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #+6]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable11_13
        ADDS     R2,R0,R2
        STRB     R1,[R2, #+3]
        ADDS     R0,R0,#+1
        B.N      ??PROTOCOLO_decodifica_info_sobre_parametro_0
//  491    
//  492    PROTOCOLO_bufferTmp[36] = tabela_parametros[parametro].ext[0];
??PROTOCOLO_decodifica_info_sobre_parametro_1:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+44
        LDR.N    R1,??DataTable11_15
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+38]
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+36]
//  493    PROTOCOLO_bufferTmp[37] = tabela_parametros[parametro].ext[1];
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+44
        LDR.N    R1,??DataTable11_15
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+39]
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+37]
//  494    PROTOCOLO_bufferTmp[38] = tabela_parametros[parametro].ext[2];
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+44
        LDR.N    R1,??DataTable11_15
        MLA      R0,R0,R4,R1
        LDRB     R0,[R0, #+40]
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+38]
//  495    PROTOCOLO_bufferTmp[39] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,39);
        MOVS     R1,#+39
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_checksum
        BL       PROTOCOLO_checksum
        LDR.N    R1,??DataTable11_13
        STRB     R0,[R1, #+39]
//  496    PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,40);
        MOVS     R1,#+40
        LDR.N    R0,??DataTable11_13
          CFI FunCall PROTOCOLO_enviaPacote
        BL       PROTOCOLO_enviaPacote
//  497 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x4009c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     PROTOCOLO_bytesParaEnviar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     PROTOCOLO_bytesEnviados

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     PROTOCOLO_bufferTx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     0x4009c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     ??ultimoRecebido

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     PROTOCOLO_bytesRecebidos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_7:
        DC32     PROTOCOLO_bufferRx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_8:
        DC32     PROTOCOLO_novoPacote

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_9:
        DC32     0x4009c014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_10:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_11:
        DC32     PROTOCOLO_bufferRx+0x7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_12:
        DC32     PROTOCOLO_bufferRx+0x5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_13:
        DC32     PROTOCOLO_bufferTmp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_14:
        DC32     PROTOCOLO_bufferTmp+0x7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_15:
        DC32     tabela_parametros
//  498 /***********************************************************************************
//  499 *       Descrição       :       Decodifica o comando que solicita a leitura
//  500 *                               de um dos parâmetros do sistema
//  501 *       Parametros      :       (unsigned short int) parâmetro
//  502 8       Retorno         :       nenhum
//  503 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_leitura_valor_parametro
          CFI NoCalls
        THUMB
//  504 void PROTOCOLO_decodifica_leitura_valor_parametro(unsigned short int parametro){
//  505   
//  506   
//  507 }
PROTOCOLO_decodifica_leitura_valor_parametro:
        BX       LR               ;; return
          CFI EndBlock cfiBlock15
//  508 /***********************************************************************************
//  509 *       Descrição       :       Decodifica o comando que solicita a escrita
//  510 *                               de um dos parâmetros do sistema
//  511 *       Parametro       :       (unsigned int) parametro
//  512 *                               (unsigned char) tipo
//  513 *                               (unsigned char*) dados do parâmetro
//  514 *       Retorno         :       nenhum
//  515 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_escrita_valor_parametro
          CFI NoCalls
        THUMB
//  516 void PROTOCOLO_decodifica_escrita_valor_parametro(unsigned short int parametro,
//  517                                                   unsigned char tipo,
//  518                                                   unsigned char *valor){
//  519                                             
//  520                                                     
//  521                                                     
//  522                                                     
//  523                                                     
//  524 }
PROTOCOLO_decodifica_escrita_valor_parametro:
        BX       LR               ;; return
          CFI EndBlock cfiBlock16

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  525 /***********************************************************************************
//  526 *       Fim do arquivo
//  527 ***********************************************************************************/
// 
//   773 bytes in section .bss
//    10 bytes in section .noinit (abs)
// 2 022 bytes in section .text
// 
// 2 022 bytes of CODE memory
//   773 bytes of DATA memory (+ 10 bytes shared)
//
//Errors: none
//Warnings: none
