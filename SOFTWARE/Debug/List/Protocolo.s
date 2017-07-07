///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     07/Jul/2017  16:29:07 /
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
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN UART_init
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
//   32 #include "protocolo.h"
//   33 #include "..\..\includes.h"
//   34 
//   35 /***********************************************************************************
//   36 *       Definições locais
//   37 ***********************************************************************************/
//   38 #define TAM_BUF_TX                              1024
//   39 #define TAM_BUF_RX                              128
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
        DS8 1024

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   49 unsigned char PROTOCOLO_bufferRx[TAM_BUF_RX];
PROTOCOLO_bufferRx:
        DS8 128

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   50 unsigned char PROTOCOLO_bufferTmp[TAM_BUF_TX];
PROTOCOLO_bufferTmp:
        DS8 1024

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
        LDR.N    R0,??DataTable2  ;; 0x4009c008
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
//  104     case THRE:
//  105                if(PROTOCOLO_bytesParaEnviar){
??PROTOCOLO_intVect_0:
        LDR.N    R0,??DataTable2_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PROTOCOLO_intVect_5
//  106                  U3THR = PROTOCOLO_bufferTx[PROTOCOLO_bytesEnviados++];
        LDR.N    R0,??DataTable2_2
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable2_3
        LDRB     R0,[R0, R1]
        LDR.N    R1,??DataTable2_4  ;; 0x4009c000
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable2_2
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable2_2
        STRB     R0,[R1, #+0]
//  107                  PROTOCOLO_bytesParaEnviar--;
        LDR.N    R0,??DataTable2_1
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable2_1
        STRB     R0,[R1, #+0]
//  108                }
//  109                break; 
??PROTOCOLO_intVect_5:
        B.N      ??PROTOCOLO_intVect_4
//  110     case RDA : dummy = U3RBR;
??PROTOCOLO_intVect_1:
        LDR.N    R0,??DataTable2_4  ;; 0x4009c000
        LDRB     R0,[R0, #+0]
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
        LDR.N    R1,??DataTable2_5
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_10
//  114                              PROTOCOLO_bytesRecebidos = 0;
        LDR.N    R0,??DataTable2_6
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  115                              ultimoRecebido = 255;
        LDR.N    R0,??DataTable2_5
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_11
//  116                            }
//  117                            else{
//  118                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_10:
        LDR.N    R1,??DataTable2_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_12
//  119                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
        LDR.N    R1,??DataTable2_6
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable2_7
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable2_6
        STRB     R0,[R1, #+0]
//  120                              
//  121                              ultimoRecebido = STX;
??PROTOCOLO_intVect_12:
        LDR.N    R0,??DataTable2_5
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  122                            }
//  123                            
//  124                            break;
??PROTOCOLO_intVect_11:
        B.N      ??PROTOCOLO_intVect_13
//  125                  case ETX: // Quando receber [DLE]+[ETX] - marca fim do novo pacote
//  126                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_7:
        LDR.N    R1,??DataTable2_5
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_14
//  127                              PROTOCOLO_novoPacote = 255;
        LDR.N    R0,??DataTable2_8
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
//  128                              ultimoRecebido = 255;
        LDR.N    R0,??DataTable2_5
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_15
//  129                            }
//  130                            else{
//  131                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_14:
        LDR.N    R1,??DataTable2_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_16
//  132                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                         
        LDR.N    R1,??DataTable2_6
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable2_7
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable2_6
        STRB     R0,[R1, #+0]
//  133                              
//  134                              ultimoRecebido = ETX;
??PROTOCOLO_intVect_16:
        LDR.N    R0,??DataTable2_5
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  135                            }                   
//  136                            break;
??PROTOCOLO_intVect_15:
        B.N      ??PROTOCOLO_intVect_13
//  137                  case DLE: // Quando receber [DLE]+[DLE] recebe 0x10 dentro do buffer
//  138                            if(ultimoRecebido == DLE){
??PROTOCOLO_intVect_8:
        LDR.N    R1,??DataTable2_5
        LDRB     R1,[R1, #+0]
        CMP      R1,#+16
        BNE.N    ??PROTOCOLO_intVect_17
//  139                              if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1))
        LDR.N    R1,??DataTable2_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_18
//  140                                PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;
        LDR.N    R1,??DataTable2_6
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable2_7
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable2_6
        STRB     R0,[R1, #+0]
//  141                              ultimoRecebido = 255;
??PROTOCOLO_intVect_18:
        LDR.N    R0,??DataTable2_5
        MOVS     R1,#+255
        STRB     R1,[R0, #+0]
        B.N      ??PROTOCOLO_intVect_19
//  142                            }                      
//  143                            else
//  144                              ultimoRecebido = DLE;
??PROTOCOLO_intVect_17:
        LDR.N    R0,??DataTable2_5
        MOVS     R1,#+16
        STRB     R1,[R0, #+0]
//  145                            break;
??PROTOCOLO_intVect_19:
        B.N      ??PROTOCOLO_intVect_13
//  146                  default :
//  147                            if(PROTOCOLO_bytesRecebidos<(TAM_BUF_RX-1)) 
??PROTOCOLO_intVect_9:
        LDR.N    R1,??DataTable2_6
        LDRB     R1,[R1, #+0]
        CMP      R1,#+127
        BGE.N    ??PROTOCOLO_intVect_20
//  148                              PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos++] = dummy;                                                                            
        LDR.N    R1,??DataTable2_6
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable2_7
        STRB     R0,[R1, R2]
        LDR.N    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable2_6
        STRB     R0,[R1, #+0]
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
        LDR.N    R0,??DataTable2_9  ;; 0x4009c014
        LDRB     R0,[R0, #+0]
//  156                dummy = U3RBR;               
        LDR.N    R1,??DataTable2_4  ;; 0x4009c000
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
        LDR.N    R0,??DataTable2_10  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable2_10  ;; 0xe000e280
        STR      R0,[R1, #+0]
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
//  182   unsigned short int soma=0;
        MOVS     R2,#+0
//  183 
//  184   for(unsigned short int i=0;i<tamanho;i++)
        MOVS     R3,#+0
        B.N      ??PROTOCOLO_checksum_0
//  185     soma+= pData[i];
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
//  186   
//  187   return (unsigned char)(256-soma);    
        RSBS     R0,R2,#+0
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
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
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
//  204       /*
//  205       PROTOCOLO_novoPacote = 0;        
//  206       if(PROTOCOLO_checksum(PROTOCOLO_bufferRx,PROTOCOLO_bufferRx[1]-1)==PROTOCOLO_bufferRx[PROTOCOLO_bytesRecebidos-1]){      
//  207         switch(PROTOCOLO_bufferRx[0]){
//  208          case READ_DATA_FLASH_BLOCK:              
//  209               PROTOCOLO_decodeLeBloco     (PROTOCOLO_bufferRx[2]<<24 | PROTOCOLO_bufferRx[3]<<16 | PROTOCOLO_bufferRx[4]<<8 | PROTOCOLO_bufferRx[5],PROTOCOLO_bufferRx[6]);
//  210               break;
//  211          case WRITE_DATA_FLASH_BLOCK:
//  212               PROTOCOLO_decodeEscreveBloco(PROTOCOLO_bufferRx[2]<<24 | PROTOCOLO_bufferRx[3]<<16 | PROTOCOLO_bufferRx[4]<<8 | PROTOCOLO_bufferRx[5],PROTOCOLO_bufferRx[6],&PROTOCOLO_bufferRx[7]);
//  213               break;
//  214          case FORMAT_AUDIO_FLASH:
//  215               PROTOCOLO_decodeFormataAudioFlash();
//  216               break;
//  217          case WRITE_MUSIC_TABLE:
//  218               PROTOCOLO_decodeEscreveTabelaMusicas(PROTOCOLO_bufferRx[2],
//  219                                                    PROTOCOLO_bufferRx[3]<<16 | PROTOCOLO_bufferRx[4]<<8 | PROTOCOLO_bufferRx[5],
//  220                                                    PROTOCOLO_bufferRx[6]<<16 | PROTOCOLO_bufferRx[7]<<8 | PROTOCOLO_bufferRx[8]);
//  221               break;
//  222          case READ_MUSIC_TABLE:
//  223               PROTOCOLO_decodeLeituraTabelaMusicas(PROTOCOLO_bufferRx[2]);
//  224               break;          
//  225          case GET_PARAMETERS_LENGHT:
//  226               PROTOCOLO_decodifica_tamanho_parametros();
//  227               break;
//  228          case GET_PARAMETER_INFO:
//  229               PROTOCOLO_decodifica_info_sobre_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3]);
//  230               break;
//  231          case GET_PARAMETER_DATA:
//  232               PROTOCOLO_decodifica_leitura_valor_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3]);
//  233               break;
//  234          case SET_PARAMETER_DATA:
//  235               PROTOCOLO_decodifica_escrita_valor_parametro(PROTOCOLO_bufferRx[2]<<8 | PROTOCOLO_bufferRx[3],
//  236                                                            PROTOCOLO_bufferRx[4],
//  237                                                           &PROTOCOLO_bufferRx[5]);
//  238               break;
//  239         }
//  240       */
//  241       //}      
//  242     }
//  243     vTaskDelay(1);
??PROTOCOLO_main_0:
        MOVS     R0,#+1
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??PROTOCOLO_main_0
          CFI EndBlock cfiBlock4
//  244   }    
//  245 }
//  246 /***********************************************************************************
//  247 *       Descrição       :       Encapsula os dados que serão enviados
//  248 *                               pela rede
//  249 *       Parametros      :       (unsigned char*) ponteiro para os dados que serão
//  250 *                                               enviados
//  251 *       Retorno         :       nenhum
//  252 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function PROTOCOLO_enviaPacote
          CFI NoCalls
        THUMB
//  253 void PROTOCOLO_enviaPacote(unsigned char *pData,unsigned short int tamanho){
PROTOCOLO_enviaPacote:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  254   unsigned char indice=0;
        MOVS     R2,#+0
//  255   
//  256   PROTOCOLO_bufferTx[indice++] = DLE;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R3,??DataTable2_3
        MOVS     R4,#+16
        STRB     R4,[R2, R3]
        ADDS     R2,R2,#+1
//  257   PROTOCOLO_bufferTx[indice++] = STX;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R3,??DataTable2_3
        MOVS     R4,#+2
        STRB     R4,[R2, R3]
        ADDS     R2,R2,#+1
//  258   for(unsigned char i=0;i<tamanho;i++)
        MOVS     R3,#+0
        B.N      ??PROTOCOLO_enviaPacote_0
//  259     if(pData[i]==DLE){
//  260       PROTOCOLO_bufferTx[indice++] = DLE;
//  261       PROTOCOLO_bufferTx[indice++] = DLE;
//  262     }
//  263     else
//  264       PROTOCOLO_bufferTx[indice++] = pData[i];
??PROTOCOLO_enviaPacote_1:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R4,[R3, R0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R5,??DataTable2_3
        STRB     R4,[R2, R5]
        ADDS     R2,R2,#+1
??PROTOCOLO_enviaPacote_2:
        ADDS     R3,R3,#+1
??PROTOCOLO_enviaPacote_0:
        MOVS     R4,R3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R4,R1
        BCS.N    ??PROTOCOLO_enviaPacote_3
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R4,[R3, R0]
        CMP      R4,#+16
        BNE.N    ??PROTOCOLO_enviaPacote_1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R4,??DataTable2_3
        MOVS     R5,#+16
        STRB     R5,[R2, R4]
        ADDS     R2,R2,#+1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R4,??DataTable2_3
        MOVS     R5,#+16
        STRB     R5,[R2, R4]
        ADDS     R2,R2,#+1
        B.N      ??PROTOCOLO_enviaPacote_2
//  265   
//  266   PROTOCOLO_bufferTx[indice++] = DLE;
??PROTOCOLO_enviaPacote_3:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R0,??DataTable2_3
        MOVS     R1,#+16
        STRB     R1,[R2, R0]
        ADDS     R2,R2,#+1
//  267   PROTOCOLO_bufferTx[indice++] = ETX;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R0,??DataTable2_3
        MOVS     R1,#+3
        STRB     R1,[R2, R0]
        ADDS     R2,R2,#+1
//  268   
//  269   PROTOCOLO_bytesParaEnviar = indice-1;
        SUBS     R0,R2,#+1
        LDR.N    R1,??DataTable2_1
        STRB     R0,[R1, #+0]
//  270   PROTOCOLO_bytesEnviados = 1;
        LDR.N    R0,??DataTable2_2
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  271   U3THR = PROTOCOLO_bufferTx[0];  
        LDR.N    R0,??DataTable2_4  ;; 0x4009c000
        LDR.N    R1,??DataTable2_3
        LDRB     R1,[R1, #+0]
        STRB     R1,[R0, #+0]
//  272 }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
        REQUIRE U3RBRTHR
//  273 /***********************************************************************************
//  274 *       Descrição       :       Lê um bloco de dados da dataflash
//  275 *       Parametros      :       nenhum
//  276 *       Retorno         :       nenhum
//  277 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function PROTOCOLO_decodeLeBloco
          CFI NoCalls
        THUMB
//  278 void PROTOCOLO_decodeLeBloco(unsigned long int endereco,unsigned char tamanho){
//  279                        
//  280   /*
//  281   if(tamanho>128){     
//  282     PROTOCOLO_bufferTmp[0] = READ_DATA_FLASH_BLOCK | 0x80;
//  283     PROTOCOLO_bufferTmp[1] = 4;
//  284     PROTOCOLO_bufferTmp[2] = 1;
//  285     PROTOCOLO_bufferTmp[3] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,3);
//  286     
//  287     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,4);  
//  288   }
//  289   else{
//  290     PROTOCOLO_bufferTmp[0] = READ_DATA_FLASH_BLOCK;
//  291     PROTOCOLO_bufferTmp[1] = tamanho+8;
//  292     PROTOCOLO_bufferTmp[2] = endereco>>24;
//  293     PROTOCOLO_bufferTmp[3] = endereco>>16;
//  294     PROTOCOLO_bufferTmp[4] = endereco>>8;
//  295     PROTOCOLO_bufferTmp[5] = endereco;
//  296     PROTOCOLO_bufferTmp[6] = tamanho;
//  297    
//  298     SST_highSpeedRead(endereco+AREA_AUDIO,&PROTOCOLO_bufferTmp[7],tamanho);
//  299   
//  300     PROTOCOLO_bufferTmp[7+tamanho] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,7+tamanho);
//  301     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,tamanho+8);  
//  302   }
//  303   */
//  304 }
PROTOCOLO_decodeLeBloco:
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  305 /***********************************************************************************
//  306 *       Descrição       :       Escreve um bloco de dados
//  307 *                               na memória de dados
//  308 *       Parametros      :       (unsigned int) endereco inicial da escrita
//  309 *                               (unsigned char) tamanho do bloco
//  310 *                               (unsigned char*) ponteiro para os dados
//  311 *       Retorno         :       nenhum
//  312 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function PROTOCOLO_decodeEscreveBloco
          CFI NoCalls
        THUMB
//  313 void PROTOCOLO_decodeEscreveBloco(unsigned long int endereco,unsigned char tamanho,
//  314                                   unsigned char *dados){
//  315                                     /*
//  316   
//  317   if(tamanho>128){    
//  318     PROTOCOLO_bufferTmp[0] = WRITE_DATA_FLASH_BLOCK | 0x80;
//  319     PROTOCOLO_bufferTmp[1] = 4;
//  320     PROTOCOLO_bufferTmp[2] = 1;
//  321     PROTOCOLO_bufferTmp[3] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,3);
//  322     
//  323     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,4);      
//  324   }
//  325   else{
//  326     PROTOCOLO_bufferTmp[0] = WRITE_DATA_FLASH_BLOCK;
//  327     PROTOCOLO_bufferTmp[1] = 8;
//  328     PROTOCOLO_bufferTmp[2] = endereco>>24;
//  329     PROTOCOLO_bufferTmp[3] = endereco>>16;
//  330     PROTOCOLO_bufferTmp[4] = endereco>>8;
//  331     PROTOCOLO_bufferTmp[5] = endereco;
//  332     PROTOCOLO_bufferTmp[6] = tamanho;
//  333    
//  334     SST_writeAutoAddressInc(endereco+AREA_AUDIO,dados,tamanho);
//  335   
//  336     PROTOCOLO_bufferTmp[7] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,7);
//  337     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,8);  
//  338   }      
//  339                                     */
//  340 }
PROTOCOLO_decodeEscreveBloco:
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  341 /***********************************************************************************
//  342 *       Descrição       :      Formata a área da flash onde são alocados
//  343 *                              os arquivos de audio
//  344 *       Parametros      :      nenhum
//  345 *       Retorno         :      nenhum
//  346 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function PROTOCOLO_decodeFormataAudioFlash
          CFI NoCalls
        THUMB
//  347 void PROTOCOLO_decodeFormataAudioFlash(void){
//  348   /*
//  349   unsigned long int enderecoInicial=AREA_AUDIO;
//  350   
//  351   for(unsigned short int i=0;i<599;i++){
//  352     SST_erase4kbSector(enderecoInicial);
//  353     enderecoInicial+=4096;
//  354     //FEEDS_THE_DOG();
//  355   }
//  356     
//  357   PROTOCOLO_bufferTmp[0] = FORMAT_AUDIO_FLASH;
//  358   PROTOCOLO_bufferTmp[1] = 3;
//  359   PROTOCOLO_bufferTmp[2] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,2);
//  360   
//  361   PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,3);  
//  362   */
//  363 }
PROTOCOLO_decodeFormataAudioFlash:
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  364 /***********************************************************************************
//  365 *       Descrição       :       Escreve valores na tabela de musica do sistema
//  366 *       Parametros      :       (unsigned char) música
//  367 *                               (unsigned long int) endereco inicial
//  368 *                               (unsigned long int) tamanho da música
//  369 *       Retorno         :       nenhum
//  370 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function PROTOCOLO_decodeEscreveTabelaMusicas
          CFI NoCalls
        THUMB
//  371 void PROTOCOLO_decodeEscreveTabelaMusicas(unsigned char musica,
//  372                                           unsigned long int enderecoInicial,
//  373                                           unsigned long int tamanho){
//  374                                             
//  375                                             /*
//  376   if(musica>3){
//  377     PROTOCOLO_bufferTmp[0] = WRITE_MUSIC_TABLE | 0x80;
//  378     PROTOCOLO_bufferTmp[1] = 4;
//  379     PROTOCOLO_bufferTmp[2] = 1;
//  380     PROTOCOLO_bufferTmp[3] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,3);
//  381     
//  382     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,4);                                                    
//  383   } 
//  384   else{
//  385     
//  386     unsigned int temp;
//  387     
//  388     temp = enderecoInicial + AREA_AUDIO;
//  389     PARAMETROS_grava(ADR_INICIO_BLOCO_MUSICA+musica,(void*)&temp);
//  390     
//  391     temp = tamanho;
//  392     PARAMETROS_grava(ADR_TAMANHO_BLOCO_MUSICA+musica,(void*)&temp);
//  393     
//  394     PROTOCOLO_bufferTmp[0] = WRITE_MUSIC_TABLE;
//  395     PROTOCOLO_bufferTmp[1] = 10;
//  396     PROTOCOLO_bufferTmp[2] = musica;
//  397     PROTOCOLO_bufferTmp[3] = enderecoInicial>>16;
//  398     PROTOCOLO_bufferTmp[4] = enderecoInicial>>8;
//  399     PROTOCOLO_bufferTmp[5] = enderecoInicial;
//  400     PROTOCOLO_bufferTmp[6] = tamanho>>16;
//  401     PROTOCOLO_bufferTmp[7] = tamanho>>8;
//  402     PROTOCOLO_bufferTmp[8] = tamanho;
//  403     PROTOCOLO_bufferTmp[9] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,9);
//  404     
//  405     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,10);                      
//  406   }        
//  407                                             */
//  408 }
PROTOCOLO_decodeEscreveTabelaMusicas:
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  409 /***********************************************************************************
//  410 *       Descrição       :       Lê os valores da tabela de música do sistema
//  411 *       Parametros      :       (unsigned char) música
//  412 *       Retorno         :       nenhum
//  413 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function PROTOCOLO_decodeLeituraTabelaMusicas
          CFI NoCalls
        THUMB
//  414 void PROTOCOLO_decodeLeituraTabelaMusicas(unsigned char musica){
//  415   
//  416   /*
//  417   if(musica>3){
//  418     PROTOCOLO_bufferTmp[0] = READ_MUSIC_TABLE | 0x80;
//  419     PROTOCOLO_bufferTmp[1] = 4;
//  420     PROTOCOLO_bufferTmp[2] = 1;
//  421     PROTOCOLO_bufferTmp[3] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,3);
//  422     
//  423     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,4);   
//  424   }
//  425   else{
//  426     unsigned int enderecoInicial;
//  427     unsigned int tamanho;
//  428     
//  429     
//  430     PARAMETROS_le(ADR_INICIO_BLOCO_MUSICA+musica ,(void*)&enderecoInicial);
//  431     PARAMETROS_le(ADR_TAMANHO_BLOCO_MUSICA+musica,(void*)&tamanho);
//  432     
//  433     enderecoInicial -= AREA_AUDIO;
//  434     
//  435     PROTOCOLO_bufferTmp[0] = READ_MUSIC_TABLE;
//  436     PROTOCOLO_bufferTmp[1] = 10;
//  437     PROTOCOLO_bufferTmp[2] = musica;
//  438     PROTOCOLO_bufferTmp[3] = enderecoInicial>>16;
//  439     PROTOCOLO_bufferTmp[4] = enderecoInicial>>8;
//  440     PROTOCOLO_bufferTmp[5] = enderecoInicial;
//  441     PROTOCOLO_bufferTmp[6] = tamanho>>16;
//  442     PROTOCOLO_bufferTmp[7] = tamanho>>8;
//  443     PROTOCOLO_bufferTmp[8] = tamanho;
//  444     PROTOCOLO_bufferTmp[9] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,9);
//  445     
//  446     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,10);   
//  447   }  
//  448   */
//  449 }
PROTOCOLO_decodeLeituraTabelaMusicas:
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  450 /***********************************************************************************
//  451 *       Descrição       :       envia data direto
//  452 *       Parametros      :       nenhum
//  453 *       Retorno         :       nenhum
//  454 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function PROTOCOLO_enviaDadosDireto
          CFI NoCalls
        THUMB
//  455 void PROTOCOLO_enviaDadosDireto(unsigned char *buffer,unsigned char tamanho){
//  456   
//  457   /*
//  458   for(unsigned char i=0;i<tamanho;i++)
//  459     PROTOCOLO_bufferTx[i] = buffer[i];
//  460   
//  461   PROTOCOLO_bytesParaEnviar = tamanho-1;
//  462   PROTOCOLO_bytesEnviados = 1;
//  463   U3THR = buffer[0];    
//  464   */
//  465 }
PROTOCOLO_enviaDadosDireto:
        BX       LR               ;; return
          CFI EndBlock cfiBlock11
//  466 /***********************************************************************************
//  467 *       Descrição       :       Verifica se o buffer de transmissão está vazio
//  468 *       Parametros      :       nenhum
//  469 *       Retorno         :       Tamanho do buffer de transmissão
//  470 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function PROTOCOLO_bytesNoBufferTx
          CFI NoCalls
        THUMB
//  471 unsigned short int PROTOCOLO_bytesNoBufferTx(void){
//  472   
//  473   return PROTOCOLO_bytesParaEnviar;
PROTOCOLO_bytesNoBufferTx:
        LDR.N    R0,??DataTable2_1
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock12
//  474 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x4009c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     PROTOCOLO_bytesParaEnviar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     PROTOCOLO_bytesEnviados

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     PROTOCOLO_bufferTx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x4009c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     ??ultimoRecebido

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     PROTOCOLO_bytesRecebidos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     PROTOCOLO_bufferRx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     PROTOCOLO_novoPacote

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x4009c014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0xe000e280
//  475 /***********************************************************************************
//  476 *       Descrição       :       Decodofica o comando para leitura do tamanho
//  477 *                               da listagem de parâmetros
//  478 *       Parametros      :       nenhum
//  479 *       Retorno         :       nenhum
//  480 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_tamanho_parametros
          CFI NoCalls
        THUMB
//  481 void PROTOCOLO_decodifica_tamanho_parametros(void){
//  482   
//  483   /*
//  484     PROTOCOLO_bufferTmp[0] = GET_PARAMETERS_LENGHT;
//  485     PROTOCOLO_bufferTmp[1] = 6;
//  486     PROTOCOLO_bufferTmp[2] = TAMANHO_PARAMETROS>>8;    
//  487     PROTOCOLO_bufferTmp[3] = TAMANHO_PARAMETROS;
//  488     PROTOCOLO_bufferTmp[4] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,4);
//  489     PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,5);    
//  490   */
//  491 }
PROTOCOLO_decodifica_tamanho_parametros:
        BX       LR               ;; return
          CFI EndBlock cfiBlock13
//  492 /***********************************************************************************
//  493 *       Descrição       :       Decodifica o comando que solocita a informação
//  494 *                               sobre um dos parâmetros
//  495 *       Parametros      :       (unsigned int) parametro
//  496 *       Retorno         :       nenhum
//  497 ***********************************************************************************/
//  498 extern const sPARAMETROS tabela_parametros[];

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_info_sobre_parametro
          CFI NoCalls
        THUMB
//  499 void PROTOCOLO_decodifica_info_sobre_parametro(unsigned short int parametro){
//  500   
//  501   /*
//  502    PROTOCOLO_bufferTmp[0] = GET_PARAMETER_INFO;
//  503    PROTOCOLO_bufferTmp[1] = parametro;
//  504    PROTOCOLO_bufferTmp[2] = tabela_parametros[parametro].length;
//  505    
//  506    for(unsigned char i=0;i<32;i++)    
//  507      PROTOCOLO_bufferTmp[3+i] = tabela_parametros[parametro].nome[i];
//  508    
//  509    PROTOCOLO_bufferTmp[36] = tabela_parametros[parametro].ext[0];
//  510    PROTOCOLO_bufferTmp[37] = tabela_parametros[parametro].ext[1];
//  511    PROTOCOLO_bufferTmp[38] = tabela_parametros[parametro].ext[2];
//  512    PROTOCOLO_bufferTmp[39] = PROTOCOLO_checksum(PROTOCOLO_bufferTmp,39);
//  513    PROTOCOLO_enviaPacote(PROTOCOLO_bufferTmp,40);
//  514   */
//  515 }
PROTOCOLO_decodifica_info_sobre_parametro:
        BX       LR               ;; return
          CFI EndBlock cfiBlock14
//  516 /***********************************************************************************
//  517 *       Descrição       :       Decodifica o comando que solicita a leitura
//  518 *                               de um dos parâmetros do sistema
//  519 *       Parametros      :       (unsigned short int) parâmetro
//  520 8       Retorno         :       nenhum
//  521 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_leitura_valor_parametro
          CFI NoCalls
        THUMB
//  522 void PROTOCOLO_decodifica_leitura_valor_parametro(unsigned short int parametro){
//  523   
//  524   
//  525 }
PROTOCOLO_decodifica_leitura_valor_parametro:
        BX       LR               ;; return
          CFI EndBlock cfiBlock15
//  526 /***********************************************************************************
//  527 *       Descrição       :       Decodifica o comando que solicita a escrita
//  528 *                               de um dos parâmetros do sistema
//  529 *       Parametro       :       (unsigned int) parametro
//  530 *                               (unsigned char) tipo
//  531 *                               (unsigned char*) dados do parâmetro
//  532 *       Retorno         :       nenhum
//  533 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function PROTOCOLO_decodifica_escrita_valor_parametro
          CFI NoCalls
        THUMB
//  534 void PROTOCOLO_decodifica_escrita_valor_parametro(unsigned short int parametro,
//  535                                                   unsigned char tipo,
//  536                                                   unsigned char *valor){
//  537                                             
//  538                                                     
//  539                                                     
//  540                                                     
//  541                                                     
//  542 }
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
//  543 /***********************************************************************************
//  544 *       Fim do arquivo
//  545 ***********************************************************************************/
// 
// 2 181 bytes in section .bss
//    10 bytes in section .noinit (abs)
//   582 bytes in section .text
// 
//   582 bytes of CODE memory
// 2 181 bytes of DATA memory (+ 10 bytes shared)
//
//Errors: none
//Warnings: none
