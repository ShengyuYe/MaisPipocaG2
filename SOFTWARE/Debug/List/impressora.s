///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     06/Jul/2017  15:10:10 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Impressora\impressora.c         /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Impressora\impressora.c -lC     /
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
//                    pocaG2\SOFTWARE\Debug\List\impressora.s                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME impressora

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN PARAMETROS_le
        EXTERN PROTOCOLO_bytesNoBufferTx
        EXTERN PROTOCOLO_enviaDadosDireto
        EXTERN STRING_impressao_teste
        EXTERN UART_init
        EXTERN strlen

        PUBLIC IMPRESSORA_envia_linha
        PUBLIC IMPRESSORA_gera_relatorio
        PUBLIC IMPRESSORA_impressora_teste
        PUBLIC IMPRESSORA_ini
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\Impressora\impressora.c
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
//   17 |       Arquivo            :  impressora.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  01/03/2017
//   21 |
//   22 |       Revisões           :  001
//   23 |
//   24 |
//   25 | __________________________________________________________________________________
//   26 */
//   27 
//   28 /**********************************************************************************
//   29 *       Includes
//   30 **********************************************************************************/
//   31 #include <stdio.h>
//   32 #include <stdlib.h>
//   33 #include <string.h>
//   34 #include "..\..\includes.h"
//   35 
//   36 /**********************************************************************************
//   37 *       Definições
//   38 **********************************************************************************/
//   39 
//   40 
//   41 
//   42 /**********************************************************************************
//   43 *       Variaveis locais
//   44 **********************************************************************************/
//   45 
//   46 
//   47 /**********************************************************************************
//   48 *       Funções locais
//   49 **********************************************************************************/
//   50 
//   51 /**********************************************************************************
//   52 *       Descrição       :       Inicializa o driver da impressora
//   53 *       Parametros      :       nenhum
//   54 *       Retorno         :       nenhum
//   55 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function IMPRESSORA_ini
          CFI NoCalls
        THUMB
//   56 void IMPRESSORA_ini(void){    
//   57 
//   58   
//   59   
//   60 }
IMPRESSORA_ini:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   61 /**********************************************************************************
//   62 *       Descrição       :       Imprime uma linha na impressora
//   63 *       Parametros      :       nenhum
//   64 *       Retorno         :       nenhum
//   65 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function IMPRESSORA_envia_linha
        THUMB
//   66 void IMPRESSORA_envia_linha(char *texto){
IMPRESSORA_envia_linha:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
        MOVS     R4,R0
//   67   unsigned int  baudrate;
//   68   
//   69   PARAMETROS_le(ADR_BAUDRATE_IMPRESSORA,(void*)&baudrate);            
        ADD      R1,SP,#+4
        MOVS     R0,#+7
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   70   UART_init(3,baudrate,NULL,NULL,NULL);      
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDR      R1,[SP, #+4]
        MOVS     R0,#+3
          CFI FunCall UART_init
        BL       UART_init
//   71         
//   72   unsigned char tamanho = strlen(texto);
        MOVS     R0,R4
          CFI FunCall strlen
        BL       strlen
//   73   PROTOCOLO_enviaDadosDireto((unsigned char*)texto,tamanho);
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
          CFI FunCall PROTOCOLO_enviaDadosDireto
        BL       PROTOCOLO_enviaDadosDireto
//   74   while(PROTOCOLO_bytesNoBufferTx());
??IMPRESSORA_envia_linha_0:
          CFI FunCall PROTOCOLO_bytesNoBufferTx
        BL       PROTOCOLO_bytesNoBufferTx
        CMP      R0,#+0
        BNE.N    ??IMPRESSORA_envia_linha_0
//   75   
//   76   // Volta a configuração normal do 
//   77   // protocolo
//   78   UART_init(3,36600,NULL,NULL,NULL);      
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVW     R1,#+36600
        MOVS     R0,#+3
          CFI FunCall UART_init
        BL       UART_init
//   79 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock1
//   80 /**********************************************************************************
//   81 *       Descrição       :       Gera o relatório de faturamento da máquina
//   82 *       Parametros      :       nenhum
//   83 *       Retorno         :       nenhum
//   84 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function IMPRESSORA_gera_relatorio
        THUMB
//   85 void IMPRESSORA_gera_relatorio(void){
IMPRESSORA_gera_relatorio:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   86   unsigned char idioma;
//   87   
//   88   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma); 
        ADD      R1,SP,#+0
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   89 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//   90 /**********************************************************************************
//   91 *       Descrição       :       Gera o relatório de teste da impressora
//   92 *       Parametros      :       nenhum
//   93 *       Retorno         :       nenhum
//   94 **********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function IMPRESSORA_impressora_teste
        THUMB
//   95 void IMPRESSORA_impressora_teste(void){
IMPRESSORA_impressora_teste:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//   96   unsigned char idioma;
//   97   
//   98   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);   
        ADD      R1,SP,#+0
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//   99   for(unsigned char i=0;i<QTD_LINHAS_IMPRESSAO_TESTE;i++)
        MOVS     R4,#+0
        B.N      ??IMPRESSORA_impressora_teste_0
//  100     IMPRESSORA_envia_linha((char*)STRING_impressao_teste[idioma][i]);  
??IMPRESSORA_impressora_teste_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRB     R0,[SP, #+0]
        LDR.N    R1,??DataTable0
        ADDS     R0,R1,R0, LSL #+4
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall IMPRESSORA_envia_linha
        BL       IMPRESSORA_envia_linha
        ADDS     R4,R4,#+1
??IMPRESSORA_impressora_teste_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??IMPRESSORA_impressora_teste_1
//  101 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     STRING_impressao_teste

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  102 /**********************************************************************************
//  103 *       Fim do arquivo
//  104 **********************************************************************************/
// 
// 136 bytes in section .text
// 
// 136 bytes of CODE memory
//
//Errors: none
//Warnings: none
