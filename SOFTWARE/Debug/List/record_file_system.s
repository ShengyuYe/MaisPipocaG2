///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  13:07:36 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\RECORD_FILE_SYSTEM\record_file_ /
//                    system.c                                                /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\RECORD_FILE_SYSTEM\record_file_ /
//                    system.c -lC C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Ha /
//                    rdware\MaisPipocaG2\SOFTWARE\Debug\List\ -lA            /
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
//                    pocaG2\SOFTWARE\Debug\List\record_file_system.s         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME record_file_system

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN MEMORYWRAPPER_readBytes
        EXTERN MEMORYWRAPPER_writeBytes
        EXTERN RTC_getValue
        EXTERN __aeabi_memcpy

        PUBLIC RFS_append_file
        PUBLIC RFS_calcula_checksum
        PUBLIC RFS_carrega_bloco_controle
        PUBLIC RFS_close_file
        PUBLIC RFS_close_for_write
        PUBLIC RFS_create_file
        PUBLIC RFS_delete_file
        PUBLIC RFS_file_seek
        PUBLIC RFS_grava_bloco_controle
        PUBLIC RFS_open_file_for_write
        PUBLIC RFS_resolve_endereco
        PUBLIC memcpy
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\RECORD_FILE_SYSTEM\record_file_system.c
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
//   17 |       Arquivo            :  record_file_system.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  17/07/2017
//   21 |
//   22 |       Revisões           :  1
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

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP memcpy
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function memcpy
        THUMB
// __intrinsic __nounwind __interwork __softfp void *memcpy(void *, void const *, size_t)
memcpy:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   34 #include "record_file_system.h"
//   35 #include "..\..\includes.h"
//   36 
//   37 /***********************************************************************************
//   38 *       Definições
//   39 ***********************************************************************************/
//   40 #define ENDERECO_INICIAL_BLOCOS         0x00001000
//   41 #define WRITE_BLOCK                     MEMORYWRAPPER_writeBytes
//   42 #define READ_BLOCK                      MEMORYWRAPPER_readBytes             
//   43 
//   44 /***********************************************************************************
//   45 *       Variaveis locais
//   46 ***********************************************************************************/
//   47 
//   48 
//   49 /***********************************************************************************
//   50 *       Funções locais
//   51 ***********************************************************************************/
//   52 unsigned char RFS_calcula_checksum(unsigned char *pData,unsigned short int tamanho);
//   53 
//   54 /***********************************************************************************
//   55 *       Implementação das funções
//   56 ***********************************************************************************/
//   57 
//   58 /***********************************************************************************
//   59 *       Descrição       :       Resolve o endereço do bloco de controle
//   60 *                               do arquivo
//   61 *       Parametros      :       (unsigned int) posição
//   62 *       Retorno         :       (unsigned int) endereço físico
//   63 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function RFS_resolve_endereco
          CFI NoCalls
        THUMB
//   64 unsigned int RFS_resolve_endereco(unsigned char posicao){
//   65   
//   66   return ENDERECO_INICIAL_BLOCOS + ((sizeof(sRECORD_FILE_SYSTEM)+1)*posicao);
RFS_resolve_endereco:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+37
        MULS     R0,R1,R0
        ADDS     R0,R0,#+4096
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   67 }
//   68 /***********************************************************************************
//   69 *       Descrição       :       Salva o bloco de controle de arquivo
//   70 *                               na memória flash
//   71 *       Parametros      :       (unsigned char) posição
//   72 *                               (sRECORD_FILE_SYSTEM*) arquivo
//   73 *       Retorno         :       (eRFS_RESULT) resultado da operação
//   74 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function RFS_grava_bloco_controle
        THUMB
//   75 eRFS_RESULT RFS_grava_bloco_controle(unsigned int posicao,sRECORD_FILE_SYSTEM *file){
RFS_grava_bloco_controle:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+40
          CFI CFA R13+48
        MOVS     R4,R0
//   76   unsigned char buffer[sizeof(sRECORD_FILE_SYSTEM) + 1];  //tamanho da estrutura mais um byte para o checksum
//   77   
//   78   for(unsigned char i=0;i<sizeof(sRECORD_FILE_SYSTEM);i++) // copia os dados da estrutura para o buffer
        MOVS     R0,#+0
        B.N      ??RFS_grava_bloco_controle_0
//   79     buffer[i] = ((unsigned char*)(file))[i]; // faz o casting para o ponteiro
??RFS_grava_bloco_controle_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R2,[R0, R1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R3,SP,#+0
        STRB     R2,[R0, R3]
        ADDS     R0,R0,#+1
??RFS_grava_bloco_controle_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+36
        BCC.N    ??RFS_grava_bloco_controle_1
//   80   
//   81   buffer[sizeof(sRECORD_FILE_SYSTEM)] = RFS_calcula_checksum(buffer, sizeof(sRECORD_FILE_SYSTEM)); // adiciona o Checksum ao último byte do buffer
        MOVS     R1,#+36
        ADD      R0,SP,#+0
          CFI FunCall RFS_calcula_checksum
        BL       RFS_calcula_checksum
        STRB     R0,[SP, #+36]
//   82   
//   83   WRITE_BLOCK( RFS_resolve_endereco(posicao),buffer,sizeof(sRECORD_FILE_SYSTEM) +1 );  //persiste na flash externa
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall RFS_resolve_endereco
        BL       RFS_resolve_endereco
        MOVS     R2,#+37
        ADD      R1,SP,#+0
          CFI FunCall MEMORYWRAPPER_writeBytes
        BL       MEMORYWRAPPER_writeBytes
//   84   
//   85   return RFS_OK;
        MOVS     R0,#+0
        ADD      SP,SP,#+40
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
//   86 }
//   87 /***********************************************************************************
//   88 *       Descrição       :       Carrega o bloco de controle de um dos
//   89 *                               arquivos
//   90 *       Parametros      :       (unsigned char) posição
//   91 *                               (sRECORD_FILE_SYSTEM*) arquivo
//   92 *       Retorno         :       (eRFS_RESULT) resultado da operação
//   93 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function RFS_carrega_bloco_controle
        THUMB
//   94 eRFS_RESULT RFS_carrega_bloco_controle(unsigned int posicao,sRECORD_FILE_SYSTEM *file){
RFS_carrega_bloco_controle:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+40
          CFI CFA R13+48
        MOVS     R4,R1
//   95   unsigned char buffer[sizeof(sRECORD_FILE_SYSTEM) + 1];  
//   96   
//   97   READ_BLOCK( RFS_resolve_endereco(posicao),buffer,sizeof(sRECORD_FILE_SYSTEM)+1);    
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall RFS_resolve_endereco
        BL       RFS_resolve_endereco
        MOVS     R2,#+37
        ADD      R1,SP,#+0
          CFI FunCall MEMORYWRAPPER_readBytes
        BL       MEMORYWRAPPER_readBytes
//   98   for(unsigned char i=0;i<sizeof(sRECORD_FILE_SYSTEM);i++)
        MOVS     R0,#+0
        B.N      ??RFS_carrega_bloco_controle_0
//   99     ((unsigned char*)(file))[i] = buffer[i];
??RFS_carrega_bloco_controle_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+0
        LDRB     R1,[R0, R1]
        STRB     R1,[R0, R4]
        ADDS     R0,R0,#+1
??RFS_carrega_bloco_controle_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+36
        BCC.N    ??RFS_carrega_bloco_controle_1
//  100   
//  101   if(buffer[sizeof(sRECORD_FILE_SYSTEM)] == RFS_calcula_checksum(buffer,sizeof(sRECORD_FILE_SYSTEM)))
        MOVS     R1,#+36
        ADD      R0,SP,#+0
          CFI FunCall RFS_calcula_checksum
        BL       RFS_calcula_checksum
        LDRB     R1,[SP, #+36]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BNE.N    ??RFS_carrega_bloco_controle_2
//  102     return RFS_OK;      
        MOVS     R0,#+0
        B.N      ??RFS_carrega_bloco_controle_3
//  103   
//  104   return RFS_CHECKSUM_ERROR;
??RFS_carrega_bloco_controle_2:
        MOVS     R0,#+3
??RFS_carrega_bloco_controle_3:
        ADD      SP,SP,#+40
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3
//  105 }
//  106 /***********************************************************************************
//  107 *       Descrição       :       Cria um novo arquivo na tabela de arquivos
//  108 *                               do sistema
//  109 *       Parametros      :       nenhum
//  110 *       Retorno         :       nenhum
//  111 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function RFS_create_file
        THUMB
//  112 eRFS_RESULT RFS_create_file(unsigned char position,char nome[8],char ext[3]){
RFS_create_file:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+44
          CFI CFA R13+56
        MOVS     R4,R1
        MOVS     R5,R2
//  113   sRECORD_FILE_SYSTEM file;
//  114     
//  115   file.state = FREE_FOR_WRITE;
        MOVS     R0,#+1
        STRB     R0,[SP, #+8]
//  116   file.block_size = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  117   file.external_flash_start = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
//  118   RTC_getValue(&file.hour,&file.minute,&file.second,&file.hour,&file.month,&file.year);
        ADD      R0,SP,#+28
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+24
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+20
        ADD      R2,SP,#+22
        ADD      R1,SP,#+21
        ADD      R0,SP,#+20
          CFI FunCall RTC_getValue
        BL       RTC_getValue
//  119   memcpy(file.file_name,nome,8);
        MOVS     R2,#+8
        MOVS     R1,R4
        ADD      R0,SP,#+32
          CFI FunCall memcpy
        BL       memcpy
//  120   memcpy(file.file_extension,ext,3);  
        MOVS     R2,#+3
        MOVS     R1,R5
        ADD      R0,SP,#+40
          CFI FunCall memcpy
        BL       memcpy
//  121                                                                  
//  122   
//  123   return RFS_OK;  
        MOVS     R0,#+0
        ADD      SP,SP,#+44
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock4
//  124 }
//  125 /***********************************************************************************
//  126 *       Descrição       :       Deleta um arquivo da tabela de arquivos
//  127 *                               do sistema
//  128 *       Parametros      :       nenhum
//  129 *       Retorno         :       (eRFS_RESULT) resultado da operação
//  130 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function RFS_delete_file
          CFI NoCalls
        THUMB
//  131 eRFS_RESULT RFS_delete_file(unsigned char position){
//  132   
//  133   
//  134   return RFS_OK;  
RFS_delete_file:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  135 }
//  136 /***********************************************************************************
//  137 *       Descrição       :       Carrega 
//  138 *       Parametros      :       (unsigned char) indice do arquivo
//  139 *       Retorno         :       (eRFS_RESULT) resultado da operação
//  140 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function RFS_open_file_for_write
          CFI NoCalls
        THUMB
//  141 eRFS_RESULT RFS_open_file_for_write(unsigned char indice){
//  142   
//  143   
//  144   return RFS_OK;  
RFS_open_file_for_write:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  145 }
//  146 /***********************************************************************************
//  147 *       Descrição       :       Posiciona o ponteiro de leitura/escrita
//  148 *                               no início do arquivo
//  149 *       Parametros      :       nenhum
//  150 *       Retorno         :       (eRFS_RESULT) resultado da operação
//  151 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function RFS_file_seek
          CFI NoCalls
        THUMB
//  152 eRFS_RESULT RFS_file_seek(void){
//  153   
//  154   
//  155   return RFS_OK;  
RFS_file_seek:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  156 }
//  157 /***********************************************************************************
//  158 *       Descrição       :       Adiciona um texto ao final do arquivo
//  159 *       Parametros      :       (unsigned char*) ponteiro para os dados
//  160 *                               (unsigned short int) tamanho do bloco
//  161 *       Retorno         :       (eRFS_RESULT) resultado da operação
//  162 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function RFS_append_file
          CFI NoCalls
        THUMB
//  163 eRFS_RESULT RFS_append_file(unsigned char *pData,unsigned short int size){
//  164   
//  165   
//  166   
//  167   return RFS_OK;  
RFS_append_file:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  168 }
//  169 /***********************************************************************************
//  170 *       Descrição       :       Fecha o arquivo atual
//  171 *       Parametros      :       nenhum
//  172 *       Retorno         :       nenhum
//  173 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function RFS_close_file
          CFI NoCalls
        THUMB
//  174 eRFS_RESULT RFS_close_file(void){
//  175   
//  176   
//  177   return RFS_OK;  
RFS_close_file:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  178 }
//  179 /***********************************************************************************
//  180 *       Descrição       :       Marca o arquivo atual como apenas leitura
//  181 *       Parametros      :       (unsigned char) indice
//  182 *       Retorno         :       (eRFS_RESULT) resultado da operação
//  183 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function RFS_close_for_write
          CFI NoCalls
        THUMB
//  184 eRFS_RESULT RFS_close_for_write(unsigned char indice){
//  185   
//  186   
//  187   return RFS_OK;
RFS_close_for_write:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  188 }
//  189 /***********************************************************************************
//  190 *       Descrição       :       Faz o cálculo do checksum do arquivo
//  191 *       Parametros      :       (unsigned char*) ponteiro para o buffer de dados
//  192 *                               (unsigned short int) tamanho
//  193 *       Retorno         :       (unsigned char) checksum
//  194 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function RFS_calcula_checksum
          CFI NoCalls
        THUMB
//  195 unsigned char RFS_calcula_checksum(unsigned char *pData,unsigned short int tamanho){
RFS_calcula_checksum:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  196   unsigned char soma=0xFE;  
        MOVS     R2,#+254
//  197   
//  198   for(unsigned short int i=0;i<tamanho;i++)
        MOVS     R3,#+0
        B.N      ??RFS_calcula_checksum_0
//  199     soma+=pData[i];
??RFS_calcula_checksum_1:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRB     R4,[R3, R0]
        ADDS     R2,R4,R2
        ADDS     R3,R3,#+1
??RFS_calcula_checksum_0:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R3,R1
        BCC.N    ??RFS_calcula_checksum_1
//  200   
//  201   return soma;
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock11
//  202 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  203 /***********************************************************************************
//  204 *       Fim do arquivo
//  205 ***********************************************************************************/
//  206 
// 
// 286 bytes in section .text
// 
// 272 bytes of CODE memory (+ 14 bytes shared)
//
//Errors: none
//Warnings: none
