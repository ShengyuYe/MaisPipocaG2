///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     07/Jul/2017  17:07:47 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\pegabo /
//                    la_g2\FIRMWARE\app\Protocolo\dxt_file_system.c          /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\pegabo /
//                    la_g2\FIRMWARE\app\Protocolo\dxt_file_system.c -lC      /
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
//                    pocaG2\SOFTWARE\Debug\List\dxt_file_system.s            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME dxt_file_system

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN DXF_read_block
        EXTERN DXF_write_block

        PUBLIC DXF_arquivo_aberto
        PUBLIC DXF_close_file
        PUBLIC DXF_deserealiza
        PUBLIC DXF_handler_arquivo_aberto
        PUBLIC DXF_indice_arquivo
        PUBLIC DXF_ini
        PUBLIC DXF_ponteiro_escrita_arquivo
        PUBLIC DXF_ponteiro_leitura_arquivo
        PUBLIC DXF_read
        PUBLIC DXF_serializa
        PUBLIC DXF_write
        PUBLIC DXT_calcula_checksum
        PUBLIC DXT_carrega
        PUBLIC DXT_checksum_check
        PUBLIC DXT_file_checksum_generate
        PUBLIC DXT_grava
        PUBLIC DXT_open_file
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\pegabola_g2\FIRMWARE\app\Protocolo\dxt_file_system.c
//    1 /*__________________________________________________________________________________
//    2 |	Dextro Soluções Tecnológicas
//    3 |       
//    4 |       Itajaí - SC
//    5 |       www.dextro-st.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Dextro  and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Dextro 
//   10 |       or its distributors.
//   11 |
//   12 |       Este código é propriedade da Dextro  e não pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       Dextro  ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :  dxt_file_sustem.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  07/07/2017
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
//   31 #include <stdio.h>
//   32 #include <stdlib.h>
//   33 #include <string.h>
//   34 #include "dxt_file_system.h"
//   35 #include "dxt_file_target.h"
//   36 
//   37 /***********************************************************************************
//   38 *       Definições locais
//   39 ***********************************************************************************/
//   40 #define TAM_BLOCO_DESCRITOR_ARQUIVO                     36
//   41 
//   42 /***********************************************************************************
//   43 *       Constantes locais
//   44 ***********************************************************************************/
//   45 
//   46 
//   47 /***********************************************************************************
//   48 *       Variaveis locais
//   49 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   50 eDXF_file_descritor DXF_handler_arquivo_aberto=NULL;
DXF_handler_arquivo_aberto:
        DS8 40

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   51 unsigned char DXF_arquivo_aberto=0;
DXF_arquivo_aberto:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   52 unsigned char DXF_indice_arquivo;
DXF_indice_arquivo:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   53 unsigned int DXF_ponteiro_escrita_arquivo=0;
DXF_ponteiro_escrita_arquivo:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   54 unsigned int DXF_ponteiro_leitura_arquivo= 0;
DXF_ponteiro_leitura_arquivo:
        DS8 4
//   55 /***********************************************************************************
//   56 *       Funções locais
//   57 ***********************************************************************************/
//   58 void DXF_serializa(eDXF_file_descritor *descritor,unsigned char *pData);
//   59 
//   60 void DXF_deserealiza(eDXF_file_descritor *descritor,unsigned char *pData);
//   61 
//   62 void DXT_grava(unsigned char indice_arquivo,eDXF_file_descritor *descritor);
//   63 
//   64 unsigned char DXT_calcula_checksum(unsigned int endereco_inicial,
//   65                                    unsigned int tamanho);
//   66 
//   67 unsigned char DXT_carrega(unsigned char indice_arquivo,eDXF_file_descritor *descritor);
//   68 
//   69 unsigned char DXT_checksum_check(eDXF_file_descritor *descritor);
//   70 
//   71 void DXT_file_checksum_generate(unsigned char arquivo,eDXF_file_descritor *descritor);
//   72 
//   73 /***********************************************************************************
//   74 *       Implementação das funções
//   75 ***********************************************************************************/
//   76 
//   77 /***********************************************************************************
//   78 *       Descrição       :       Inicialização do módulo
//   79 *       Parametros      :       nenhum
//   80 *       Retorno         :       nenhum
//   81 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function DXF_ini
          CFI NoCalls
        THUMB
//   82 void DXF_ini(void){
//   83   
//   84   
//   85 }
DXF_ini:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   86 /***********************************************************************************
//   87 *       Descrição       :       Serializa o arquivo para um buffer de bytes
//   88 *       Parametros      :       (eDXF_file_descritor*) descritor do arquivo
//   89 *                               (unsigned char*) ponteiro para o vetor
//   90 *       Retorno         :       nenhum
//   91 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function DXF_serializa
          CFI NoCalls
        THUMB
//   92 void DXF_serializa(eDXF_file_descritor *descritor,unsigned char *pData){
DXF_serializa:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//   93   
//   94   pData[0] = descritor->estado_bloco>>24;
        LDR      R2,[R0, #+0]
        LSRS     R2,R2,#+24
        STRB     R2,[R1, #+0]
//   95   pData[1] = descritor->estado_bloco>>16;
        LDR      R2,[R0, #+0]
        LSRS     R2,R2,#+16
        STRB     R2,[R1, #+1]
//   96   pData[2] = descritor->estado_bloco>>8;
        LDR      R2,[R0, #+0]
        LSRS     R2,R2,#+8
        STRB     R2,[R1, #+2]
//   97   pData[3] = descritor->estado_bloco;
        LDR      R2,[R0, #+0]
        STRB     R2,[R1, #+3]
//   98   
//   99   for(unsigned char i=0;i<16;i++)
        MOVS     R2,#+0
        B.N      ??DXF_serializa_0
//  100     pData[4+i] = descritor->nome_arquivo[i+i];
??DXF_serializa_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R3,R2,R2
        ADDS     R3,R3,R0
        LDRB     R3,[R3, #+4]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R4,R2,R1
        STRB     R3,[R4, #+4]
        ADDS     R2,R2,#+1
??DXF_serializa_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+16
        BLT.N    ??DXF_serializa_1
//  101   
//  102   pData[20] = descritor->extensao[0];
        LDRB     R2,[R0, #+20]
        STRB     R2,[R1, #+20]
//  103   pData[21] = descritor->extensao[1];
        LDRB     R2,[R0, #+21]
        STRB     R2,[R1, #+21]
//  104   pData[22] = descritor->extensao[2];
        LDRB     R2,[R0, #+22]
        STRB     R2,[R1, #+22]
//  105   
//  106   pData[23] = descritor->inicio_memoria>>24;
        LDR      R2,[R0, #+24]
        LSRS     R2,R2,#+24
        STRB     R2,[R1, #+23]
//  107   pData[24] = descritor->inicio_memoria>>16;
        LDR      R2,[R0, #+24]
        LSRS     R2,R2,#+16
        STRB     R2,[R1, #+24]
//  108   pData[25] = descritor->inicio_memoria>>8;
        LDR      R2,[R0, #+24]
        LSRS     R2,R2,#+8
        STRB     R2,[R1, #+25]
//  109   pData[26] = descritor->inicio_memoria;
        LDR      R2,[R0, #+24]
        STRB     R2,[R1, #+26]
//  110   
//  111   pData[27] = descritor->tamanho_bloco>>24;
        LDR      R2,[R0, #+28]
        LSRS     R2,R2,#+24
        STRB     R2,[R1, #+27]
//  112   pData[28] = descritor->tamanho_bloco>>16;
        LDR      R2,[R0, #+28]
        LSRS     R2,R2,#+16
        STRB     R2,[R1, #+28]
//  113   pData[29] = descritor->tamanho_bloco>>8;
        LDR      R2,[R0, #+28]
        LSRS     R2,R2,#+8
        STRB     R2,[R1, #+29]
//  114   pData[30] = descritor->tamanho_bloco;
        LDR      R2,[R0, #+28]
        STRB     R2,[R1, #+30]
//  115   
//  116   pData[31] = descritor->time_stamp>>24;
        LDR      R2,[R0, #+32]
        LSRS     R2,R2,#+24
        STRB     R2,[R1, #+31]
//  117   pData[32] = descritor->time_stamp>>16;
        LDR      R2,[R0, #+32]
        LSRS     R2,R2,#+16
        STRB     R2,[R1, #+32]
//  118   pData[33] = descritor->time_stamp>>8;
        LDR      R2,[R0, #+32]
        LSRS     R2,R2,#+8
        STRB     R2,[R1, #+33]
//  119   pData[34] = descritor->time_stamp;
        LDR      R2,[R0, #+32]
        STRB     R2,[R1, #+34]
//  120   
//  121   pData[35] = descritor->checksum;  
        LDRB     R0,[R0, #+36]
        STRB     R0,[R1, #+35]
//  122 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  123 /***********************************************************************************
//  124 *       Descrição       :       Deserealizao os dados contidos em um vetor
//  125 *                               de bytes para um descritor de arquivo
//  126 *       Parametros      :       (eDXF_file_descritor*) descritor
//  127 *                               (unsigned char*) buffer
//  128 *       Retorno         :       nenhum
//  129 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function DXF_deserealiza
          CFI NoCalls
        THUMB
//  130 void DXF_deserealiza(eDXF_file_descritor *descritor,unsigned char *pData){
DXF_deserealiza:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  131   
//  132   descritor->estado_bloco  = pData[0]<<24;
        LDRB     R2,[R1, #+0]
        LSLS     R2,R2,#+24
        STR      R2,[R0, #+0]
//  133   descritor->estado_bloco |= pData[1]<<16;
        LDR      R2,[R0, #+0]
        LDRB     R3,[R1, #+1]
        ORRS     R2,R2,R3, LSL #+16
        STR      R2,[R0, #+0]
//  134   descritor->estado_bloco |= pData[2]<<8;
        LDR      R2,[R0, #+0]
        LDRB     R3,[R1, #+2]
        ORRS     R2,R2,R3, LSL #+8
        STR      R2,[R0, #+0]
//  135   descritor->estado_bloco |= pData[3];
        LDR      R2,[R0, #+0]
        LDRB     R3,[R1, #+3]
        ORRS     R2,R3,R2
        STR      R2,[R0, #+0]
//  136   
//  137   for(unsigned char i=0;i<16;i++)
        MOVS     R2,#+0
        B.N      ??DXF_deserealiza_0
//  138     pData[4+i] = descritor->nome_arquivo[i+i];
??DXF_deserealiza_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R3,R2,R2
        ADDS     R3,R3,R0
        LDRB     R3,[R3, #+4]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R4,R2,R1
        STRB     R3,[R4, #+4]
        ADDS     R2,R2,#+1
??DXF_deserealiza_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+16
        BLT.N    ??DXF_deserealiza_1
//  139   
//  140   descritor->extensao[0] = pData[20];
        LDRB     R2,[R1, #+20]
        STRB     R2,[R0, #+20]
//  141   descritor->extensao[1] = pData[21];
        LDRB     R2,[R1, #+21]
        STRB     R2,[R0, #+21]
//  142   descritor->extensao[2] = pData[22];
        LDRB     R2,[R1, #+22]
        STRB     R2,[R0, #+22]
//  143   
//  144   descritor->inicio_memoria  = pData[23]<<24;
        LDRB     R2,[R1, #+23]
        LSLS     R2,R2,#+24
        STR      R2,[R0, #+24]
//  145   descritor->inicio_memoria |= pData[24]<<16;
        LDR      R2,[R0, #+24]
        LDRB     R3,[R1, #+24]
        ORRS     R2,R2,R3, LSL #+16
        STR      R2,[R0, #+24]
//  146   descritor->inicio_memoria |= pData[25]<<8;
        LDR      R2,[R0, #+24]
        LDRB     R3,[R1, #+25]
        ORRS     R2,R2,R3, LSL #+8
        STR      R2,[R0, #+24]
//  147   descritor->inicio_memoria |= pData[26];
        LDR      R2,[R0, #+24]
        LDRB     R3,[R1, #+26]
        ORRS     R2,R3,R2
        STR      R2,[R0, #+24]
//  148   
//  149   descritor->tamanho_bloco  = pData[27]<<24;
        LDRB     R2,[R1, #+27]
        LSLS     R2,R2,#+24
        STR      R2,[R0, #+28]
//  150   descritor->tamanho_bloco |= pData[28]<<16;
        LDR      R2,[R0, #+28]
        LDRB     R3,[R1, #+28]
        ORRS     R2,R2,R3, LSL #+16
        STR      R2,[R0, #+28]
//  151   descritor->tamanho_bloco |= pData[29]<<8;
        LDR      R2,[R0, #+28]
        LDRB     R3,[R1, #+29]
        ORRS     R2,R2,R3, LSL #+8
        STR      R2,[R0, #+28]
//  152   descritor->tamanho_bloco |= pData[30];
        LDR      R2,[R0, #+28]
        LDRB     R3,[R1, #+30]
        ORRS     R2,R3,R2
        STR      R2,[R0, #+28]
//  153   
//  154   descritor->time_stamp  = pData[31];
        LDRB     R2,[R1, #+31]
        STR      R2,[R0, #+32]
//  155   descritor->time_stamp |= pData[32];
        LDR      R2,[R0, #+32]
        LDRB     R3,[R1, #+32]
        ORRS     R2,R3,R2
        STR      R2,[R0, #+32]
//  156   descritor->time_stamp |= pData[33];
        LDR      R2,[R0, #+32]
        LDRB     R3,[R1, #+33]
        ORRS     R2,R3,R2
        STR      R2,[R0, #+32]
//  157   descritor->time_stamp |= pData[34]; 
        LDR      R2,[R0, #+32]
        LDRB     R3,[R1, #+34]
        ORRS     R2,R3,R2
        STR      R2,[R0, #+32]
//  158   
//  159   descritor->checksum   = pData[35];
        LDRB     R1,[R1, #+35]
        STRB     R1,[R0, #+36]
//  160 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  161 /***********************************************************************************
//  162 *       Descrição       :       Persiste o descritor na tabela de arquivos
//  163 *                               do sistema
//  164 *       Parametros      :       (unsigned char) indice do arquivo
//  165 *                               (eDXF_file_descritor*) descritor do arquivo
//  166 *       Retorno         :       (unsigned char) nenhum
//  167 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function DXT_grava
        THUMB
//  168 void DXT_grava(unsigned char indice_arquivo,eDXF_file_descritor *descritor){
DXT_grava:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+40
          CFI CFA R13+48
        MOVS     R4,R0
        MOVS     R0,R1
//  169   unsigned char buffer[36];
//  170 
//  171   DXF_serializa(descritor,buffer);
        ADD      R1,SP,#+0
          CFI FunCall DXF_serializa
        BL       DXF_serializa
//  172   DXF_write_block(DXT_FILE_SYSTEM_INICIO_TABELA + (TAM_BLOCO_DESCRITOR_ARQUIVO*indice_arquivo),  
//  173                   TAM_BLOCO_DESCRITOR_ARQUIVO,
//  174                   buffer);                  
        ADD      R2,SP,#+0
        MOVS     R1,#+36
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+36
        LDR.N    R3,??DataTable5  ;; 0x77777
        MLA      R0,R0,R4,R3
          CFI FunCall DXF_write_block
        BL       DXF_write_block
//  175 }
        ADD      SP,SP,#+40
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3
//  176 /***********************************************************************************
//  177 *       Descrição       :       Carrega o descritor a partir da tabela de 
//  178 *                               arquivos do sistema
//  179 *       Parametros      :       (unsigned char) indice do arquivo
//  180 *                               (eDXF_file_descritor*) descritor do arquivo
//  181 *       Retorno         :       (unsigned char) maior do que zero se o 
//  182 *                               arquivo estiver com o checksum correto
//  183 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function DXT_carrega
        THUMB
//  184 unsigned char DXT_carrega(unsigned char indice_arquivo,eDXF_file_descritor *descritor){
DXT_carrega:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+36
          CFI CFA R13+48
        MOVS     R4,R1
//  185   unsigned char buffer[36];
//  186 
//  187   DXF_read_block(DXT_FILE_SYSTEM_INICIO_TABELA + (TAM_BLOCO_DESCRITOR_ARQUIVO*indice_arquivo),  
//  188                  TAM_BLOCO_DESCRITOR_ARQUIVO,
//  189                  buffer);       
        ADD      R2,SP,#+0
        MOVS     R1,#+36
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R3,#+36
        LDR.N    R5,??DataTable5  ;; 0x77777
        MLA      R0,R3,R0,R5
          CFI FunCall DXF_read_block
        BL       DXF_read_block
//  190   DXF_deserealiza(descritor,buffer);    
        ADD      R1,SP,#+0
        MOVS     R0,R4
          CFI FunCall DXF_deserealiza
        BL       DXF_deserealiza
//  191   //teria uma consistência auqi, mas não vai ter mais...
//  192   return 1;
        MOVS     R0,#+1
        ADD      SP,SP,#+36
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock4
//  193 }
//  194 /***********************************************************************************
//  195 *       Descrição       :       Calcula o checksum de um arquivo persistido
//  196 *                               na flash
//  197 *       Parametros      :       (unsigned int) endereço inicial
//  198 *                               (unsigned int) tamanho
//  199 *       Retorno         :       (unsigned char) checksum
//  200 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function DXT_calcula_checksum
        THUMB
//  201 unsigned char DXT_calcula_checksum(unsigned int endereco_inicial,
//  202                                    unsigned int tamanho){
DXT_calcula_checksum:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        SUB      SP,SP,#+40
          CFI CFA R13+64
        MOVS     R4,R0
//  203   unsigned char soma=0;                                     
        MOVS     R5,#+0
//  204   unsigned char buffer[36];
//  205   unsigned int loop=tamanho/36;
        MOVS     R0,#+36
        UDIV     R6,R1,R0
//  206   unsigned int resto = tamanho%36;
        MOVS     R0,#+36
        UDIV     R2,R1,R0
        MLS      R7,R0,R2,R1
//  207   
//  208   for(unsigned int i=0;i<loop;i++){
        MOVS     R8,#+0
        B.N      ??DXT_calcula_checksum_0
//  209     DXF_read_block(endereco_inicial,36,buffer);
//  210     for(unsigned char j=0;j<36;j++)
//  211       soma+= buffer[j];
??DXT_calcula_checksum_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+0
        LDRB     R1,[R0, R1]
        ADDS     R5,R1,R5
        ADDS     R0,R0,#+1
??DXT_calcula_checksum_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+36
        BLT.N    ??DXT_calcula_checksum_1
        ADDS     R8,R8,#+1
??DXT_calcula_checksum_0:
        CMP      R8,R6
        BCS.N    ??DXT_calcula_checksum_3
        ADD      R2,SP,#+0
        MOVS     R1,#+36
        MOVS     R0,R4
          CFI FunCall DXF_read_block
        BL       DXF_read_block
        MOVS     R0,#+0
        B.N      ??DXT_calcula_checksum_2
//  212   }
//  213   
//  214   for(unsigned int i=0;i<resto;i++){
??DXT_calcula_checksum_3:
        MOVS     R6,#+0
        B.N      ??DXT_calcula_checksum_4
//  215     DXF_read_block(endereco_inicial,resto,buffer);
//  216     for(unsigned char j=0;j<resto;j++)
//  217       soma+= buffer[j];    
??DXT_calcula_checksum_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+0
        LDRB     R1,[R0, R1]
        ADDS     R5,R1,R5
        ADDS     R0,R0,#+1
??DXT_calcula_checksum_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R7
        BCC.N    ??DXT_calcula_checksum_5
        ADDS     R6,R6,#+1
??DXT_calcula_checksum_4:
        CMP      R6,R7
        BCS.N    ??DXT_calcula_checksum_7
        ADD      R2,SP,#+0
        MOVS     R1,R7
        MOVS     R0,R4
          CFI FunCall DXF_read_block
        BL       DXF_read_block
        MOVS     R0,#+0
        B.N      ??DXT_calcula_checksum_6
//  218   }
//  219   
//  220   return soma;                                    
??DXT_calcula_checksum_7:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+40
          CFI CFA R13+24
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock5
//  221 }
//  222 /***********************************************************************************
//  223 *       Descrição       :       Verifica se o checksum do bloco de dados
//  224 *                               é o mesmo do 
//  225 *       Parametros      :       (eDXF_file_descritor*) descritor
//  226 *       Retorno         :       nenhum
//  227 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function DXT_checksum_check
        THUMB
//  228 unsigned char DXT_checksum_check(eDXF_file_descritor *descritor){
DXT_checksum_check:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  229   
//  230   if(descritor->checksum == DXT_calcula_checksum(descritor->inicio_memoria,descritor->tamanho_bloco))
        LDRB     R4,[R0, #+36]
        LDR      R1,[R0, #+28]
        LDR      R0,[R0, #+24]
          CFI FunCall DXT_calcula_checksum
        BL       DXT_calcula_checksum
        CMP      R4,R0
        BNE.N    ??DXT_checksum_check_0
//  231     return 1;
        MOVS     R0,#+1
        B.N      ??DXT_checksum_check_1
//  232   
//  233   return 0;
??DXT_checksum_check_0:
        MOVS     R0,#+0
??DXT_checksum_check_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock6
//  234 }
//  235 /***********************************************************************************
//  236 *       Decrição        :       Preenche o check de um determinado arquivo
//  237 *                               na tabela
//  238 *       Parametros      :       (unsigned char) arquivo
//  239 *       Retorno         :       nenhum
//  240 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function DXT_file_checksum_generate
        THUMB
//  241 void DXT_file_checksum_generate(unsigned char arquivo,eDXF_file_descritor *descritor){
DXT_file_checksum_generate:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  242   
//  243   descritor->checksum = DXT_calcula_checksum(descritor->inicio_memoria,descritor->tamanho_bloco);
        LDR      R1,[R5, #+28]
        LDR      R0,[R5, #+24]
          CFI FunCall DXT_calcula_checksum
        BL       DXT_calcula_checksum
        STRB     R0,[R5, #+36]
//  244   DXT_grava(arquivo,descritor);
        MOVS     R1,R5
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall DXT_grava
        BL       DXT_grava
//  245 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock7
//  246 /***********************************************************************************
//  247 *       Descrição       :       Abre o arquivo para escrita
//  248 *       Parametros      :       (unsigned char) arquivo
//  249 *       Retorno         :       nenhum
//  250 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function DXT_open_file
        THUMB
//  251 eDXF_file_descritor *DXT_open_file(unsigned char arquivo){
DXT_open_file:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  252   
//  253   DXF_arquivo_aberto = 0xFF;
        LDR.N    R1,??DataTable5_1
        MOVS     R2,#+255
        STRB     R2,[R1, #+0]
//  254   
//  255   DXF_ponteiro_escrita_arquivo=0;
        LDR.N    R1,??DataTable5_2
        MOVS     R2,#+0
        STR      R2,[R1, #+0]
//  256   DXF_ponteiro_leitura_arquivo=0;
        LDR.N    R1,??DataTable5_3
        MOVS     R2,#+0
        STR      R2,[R1, #+0]
//  257 
//  258   DXF_indice_arquivo = arquivo;
        LDR.N    R1,??DataTable5_4
        STRB     R0,[R1, #+0]
//  259   DXT_carrega(arquivo,&DXF_handler_arquivo_aberto);  
        LDR.N    R1,??DataTable5_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall DXT_carrega
        BL       DXT_carrega
//  260   
//  261   return (eDXF_file_descritor*)(&DXF_handler_arquivo_aberto);
        LDR.N    R0,??DataTable5_5
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock8
//  262 }
//  263 /***********************************************************************************
//  264 *       Descrição       :       Getter para o descritor de arquivo da bilioteca
//  265 *       Parametros      :       nenhum
//  266 *       Retorno         :       (eDXF_file_descritor*) descritor do arquivo
//  267 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function DXF_close_file
          CFI NoCalls
        THUMB
//  268 void DXF_close_file(void){
//  269  
//  270   DXF_arquivo_aberto = 0;
DXF_close_file:
        LDR.N    R0,??DataTable5_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  271 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  272 /***********************************************************************************
//  273 *       Descrição       :     Escreve um bloco de dados no arquivo
//  274 *       Parametros      :     (eDXF_file_descritor*) descritor
//  275 *                             (unsigned char*) ponteiro para os dados
//  276 *                       :     (unsigned short int) tamanho do bloco
//  277 *       Retorno         :     (unsigned short int) bytes escritos
//  278 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function DXF_write
        THUMB
//  279 unsigned short int DXF_write(eDXF_file_descritor *descritor,unsigned char *pData,
//  280                              unsigned short int tamanho){
DXF_write:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R2
//  281   unsigned short int escritos=0;                                                   
        MOVS     R5,#+0
//  282   
//  283   if( (descritor->inicio_memoria+descritor->tamanho_bloco) <= (descritor->inicio_memoria+tamanho)){
        LDR      R2,[R0, #+24]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ADDS     R2,R4,R2
        LDR      R3,[R0, #+24]
        LDR      R6,[R0, #+28]
        ADDS     R3,R6,R3
        CMP      R2,R3
        BCC.N    ??DXF_write_0
//  284     DXF_write_block(descritor->inicio_memoria+DXF_ponteiro_escrita_arquivo,tamanho,pData);
        MOVS     R2,R1
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R1,R4
        LDR      R0,[R0, #+24]
        LDR.N    R3,??DataTable5_2
        LDR      R3,[R3, #+0]
        ADDS     R0,R3,R0
          CFI FunCall DXF_write_block
        BL       DXF_write_block
//  285     escritos = tamanho;
        MOVS     R5,R4
//  286     // Ajusta o ponteiro de escrita com os bytes escritos
//  287     DXF_ponteiro_escrita_arquivo+=escritos;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R0,R5,R0
        LDR.N    R1,??DataTable5_2
        STR      R0,[R1, #+0]
        B.N      ??DXF_write_1
//  288   }
//  289   else{
//  290     escritos = (descritor->inicio_memoria+tamanho) - (descritor->inicio_memoria+descritor->tamanho_bloco);
??DXF_write_0:
        LDR      R2,[R0, #+24]
        ADDS     R2,R4,R2
        LDR      R3,[R0, #+24]
        SUBS     R2,R2,R3
        LDR      R3,[R0, #+28]
        SUBS     R5,R2,R3
//  291     DXF_write_block(descritor->inicio_memoria+DXF_ponteiro_escrita_arquivo,DXF_ponteiro_escrita_arquivo,pData);
        MOVS     R2,R1
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, #+24]
        LDR.N    R3,??DataTable5_2
        LDR      R3,[R3, #+0]
        ADDS     R0,R3,R0
          CFI FunCall DXF_write_block
        BL       DXF_write_block
//  292     // Ajusta o ponteiro de escrita com os bytes que foram efetivamente escritos
//  293     DXF_ponteiro_escrita_arquivo+=escritos;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R0,R5,R0
        LDR.N    R1,??DataTable5_2
        STR      R0,[R1, #+0]
//  294   }
//  295                                   
//  296   return escritos;
??DXF_write_1:
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock10
//  297 }
//  298 /***********************************************************************************
//  299 *       Descrição       :       Lê um bloco de dados a partir do bloco
//  300 *                               do arquivo
//  301 *       Parametros      :       (eDXF_file_descritor*) descritor
//  302 *                               (unsigned short int)tamamnho do bloco
//  303 *                               (unsigned short int*) lidos
//  304 *       Retorno         :       nenhum
//  305 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function DXF_read
        THUMB
//  306 void DXF_read(eDXF_file_descritor *descritor,unsigned short int tamanho,unsigned char *pData,
//  307               unsigned short int *lidos){
DXF_read:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R1
        MOVS     R5,R3
//  308   *lidos = 0;
        MOVS     R1,#+0
        STRH     R1,[R5, #+0]
//  309   
//  310   if( (descritor->inicio_memoria+descritor->tamanho_bloco) <= (descritor->inicio_memoria+tamanho)){
        LDR      R1,[R0, #+24]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ADDS     R1,R4,R1
        LDR      R3,[R0, #+24]
        LDR      R6,[R0, #+28]
        ADDS     R3,R6,R3
        CMP      R1,R3
        BCC.N    ??DXF_read_0
//  311     DXF_read_block(descritor->inicio_memoria+DXF_ponteiro_leitura_arquivo,tamanho,pData);
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R1,R4
        LDR      R0,[R0, #+24]
        LDR.N    R3,??DataTable5_3
        LDR      R3,[R3, #+0]
        ADDS     R0,R3,R0
          CFI FunCall DXF_read_block
        BL       DXF_read_block
//  312     // Ajusta o ponteiro da leitura com o tamanho do bloco lido
//  313     DXF_ponteiro_leitura_arquivo+=tamanho;
        LDR.N    R0,??DataTable5_3
        LDR      R0,[R0, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ADDS     R0,R4,R0
        LDR.N    R1,??DataTable5_3
        STR      R0,[R1, #+0]
        B.N      ??DXF_read_1
//  314   }
//  315   else{
//  316     *lidos = (descritor->inicio_memoria+tamanho) - (descritor->inicio_memoria+descritor->tamanho_bloco);
??DXF_read_0:
        LDR      R1,[R0, #+24]
        ADDS     R1,R4,R1
        LDR      R3,[R0, #+24]
        SUBS     R1,R1,R3
        LDR      R3,[R0, #+28]
        SUBS     R1,R1,R3
        STRH     R1,[R5, #+0]
//  317     DXF_write_block(descritor->inicio_memoria+DXF_ponteiro_leitura_arquivo,*lidos,pData);
        LDRH     R1,[R5, #+0]
        LDR      R0,[R0, #+24]
        LDR.N    R3,??DataTable5_3
        LDR      R3,[R3, #+0]
        ADDS     R0,R3,R0
          CFI FunCall DXF_write_block
        BL       DXF_write_block
//  318     // Ajusta o ponteiro de escrita com os bytes que foram efetivamente escritos
//  319     DXF_ponteiro_leitura_arquivo+= *lidos;        
        LDR.N    R0,??DataTable5_3
        LDR      R0,[R0, #+0]
        LDRH     R1,[R5, #+0]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable5_3
        STR      R0,[R1, #+0]
//  320   }
//  321 }
??DXF_read_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x77777

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     DXF_arquivo_aberto

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     DXF_ponteiro_escrita_arquivo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     DXF_ponteiro_leitura_arquivo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     DXF_indice_arquivo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     DXF_handler_arquivo_aberto

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  322 /***********************************************************************************
//  323 *       Fim do arquivo
//  324 ***********************************************************************************/
//  325 
//  326   
// 
//  50 bytes in section .bss
// 860 bytes in section .text
// 
// 860 bytes of CODE memory
//  50 bytes of DATA memory
//
//Errors: none
//Warnings: none
