///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     08/Sep/2017  15:30:38 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Parametros\parame /
//                    tros.c                                                  /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Parametros\parame /
//                    tros.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\ /
//                    List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\L /
//                    ist\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Obj /
//                    \ --no_cse --no_unroll --no_inline --no_code_motion     /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -Ol                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\parame /
//                    tros.s                                                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME parametros

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN CCTALK_calculaCRC
        EXTERN MEMORYWRAPPER_init
        EXTERN MEMORYWRAPPER_readBytes
        EXTERN MEMORYWRAPPER_writeBytes
        EXTERN __aeabi_memcpy

        PUBLIC PARAMETROS_buffer
        PUBLIC PARAMETROS_get_parametro_rec
        PUBLIC PARAMETROS_get_tamanho_lista
        PUBLIC PARAMETROS_grava
        PUBLIC PARAMETROS_ini
        PUBLIC PARAMETROS_le
        PUBLIC PARAMETROS_resolve_endereco
        PUBLIC PARAMETROS_set_parametro_rec
        PUBLIC memcpy
        PUBLIC tabela_parametros
        
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Parametros\parametros.c
//    1 /*__________________________________________________________________________________
//    2 |	DEXTRO SOLUÇÕES TECNOLÓGICAS
//    3 |       
//    4 |       ITAJAÍ - SC
//    5 |       www.dextro.ind.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by DEXTRO  and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by DEXTRO 
//   10 |       or its distributors.
//   11 |
//   12 |       Este código é propriedade da DEXTRO  e não pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       DEXTRO  ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :  parametros.c
//   18 |       Descrição          :  Menu para configuração do sistema
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  30/12/2016
//   22 |
//   23 |       Revisões           :  1.0.0.0
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 
//   29 /***********************************************************************************
//   30 *       Includes
//   31 ***********************************************************************************/
//   32 #include <nxp\iolpc1768.h>
//   33 #include <stdio.h>
//   34 #include <stdlib.h>
//   35 #include <string.h>

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

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  GRUPO ALTECH  ">`:
        DATA
        DC8 "  GRUPO ALTECH  "
        DC8 0, 0, 0
//   36 #include "..\includes.h"
//   37 #include "parametros.h"
//   38 #include "tabela_parametros.h"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute struct <unnamed> const tabela_parametros[45]
tabela_parametros:
        DATA
        DC32 0H
        DC16 1
        DC8 "IDIOMA"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 30H, 38H
        DC8 0, 0, 0
        DC32 0H
        DC16 1
        DC8 "FLAG_BV20"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 30H, 38H
        DC8 0, 0, 0
        DC32 3H
        DC16 1
        DC8 "TIPO_NOTAS"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 30H, 38H
        DC8 0, 0, 0
        DC32 0AH
        DC16 4
        DC8 "VALOR_PIPOCA"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 1
        DC8 "FLAG_MDB_BILL"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 30H, 38H
        DC8 0, 0, 0
        DC32 0H
        DC16 1
        DC8 "FLAG_MDB_COIN"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 30H, 38H
        DC8 0, 0, 0
        DC32 0H
        DC16 1
        DC8 "FLAG_MDB_CSH"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 30H, 38H
        DC8 0, 0, 0
        DC32 0AH
        DC16 4
        DC8 "BAUD_PRINTER"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0AH
        DC16 4
        DC8 "VALOR_PULSO_MOED"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0AH
        DC16 4
        DC8 "VALOR_PULSO_NOT"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "CONTAGEM_PARCIAL"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "CONTAGEM_TOTAL"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "MOEDA_PARCIAL"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "MOEDA_TOTAL"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "CARTAO_PARCIAL"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "CARTAO_TOTAL"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "UNI_CARTAO_PARCIAL"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "UNI_CARTAO_TOTAL"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "INICIO_MUSICA"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "INICIO_PROPAGANDA"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "INICIO_PEGA_PACOTE"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "INICIO_PIPOCAS_PRONTAS"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "TAMANHO_BLOCO_MUSICA"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "TAMANHO_LOCUCAO_PROP"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "TAMANHO_PEGA_PACOTE"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "TAMANHO_PIPOCAS_PRONTAS"
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "TEMPERATURA_PREPARO"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "VELOCIDADE_PREPARAO"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "TEMPO_MOTOR_EMBALAGEM"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "VOLUME_MUSICA"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "VOLUME_LOCUCAO"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "INTERVALO_PROP"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 1
        DC8 "FREE"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 30H, 38H
        DC8 0, 0, 0
        DC32 0H
        DC16 1
        DC8 "FITA_LED"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 30H, 38H
        DC8 0, 0, 0
        DC32 0H
        DC16 1
        DC8 "TROCO_MOEDA"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 30H, 38H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "SENHA_ADMIN"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "NUMERO_SERIE"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "COMISSAO_PONTO"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 0H
        DC16 1
        DC8 "FLG_DESUMID"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 30H, 38H
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "cnt_pip_teste"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 33H, 32H
        DC8 0, 0, 0
        DC32 `?<Constant "  GRUPO ALTECH  ">`
        DC16 16
        DC8 "SG_CLIENTE_01"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 54H, 58H, 54H
        DC8 0, 0, 0
        DC32 `?<Constant "  GRUPO ALTECH  ">`
        DC16 16
        DC8 "SG_CLIENTE_02"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 54H, 58H, 54H
        DC8 0, 0, 0
        DC32 `?<Constant "  GRUPO ALTECH  ">`
        DC16 16
        DC8 "SG_CLIENTE_03"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 54H, 58H, 54H
        DC8 0, 0, 0
        DC32 `?<Constant "  GRUPO ALTECH  ">`
        DC16 16
        DC8 "SG_CLIENTE_04"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 54H, 58H, 54H
        DC8 0, 0, 0
        DC32 0H
        DC16 1
        DC8 "FLG_ERRO_MOTOR"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 49H, 30H, 38H
        DC8 0, 0, 0
//   39 
//   40 
//   41 /***********************************************************************************
//   42 *       Constantes
//   43 ***********************************************************************************/
//   44 
//   45 
//   46 /***********************************************************************************
//   47 *       Definições
//   48 ***********************************************************************************/
//   49 
//   50 
//   51 /***********************************************************************************
//   52 *       Variaveis locais
//   53 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   54 unsigned char PARAMETROS_buffer[2][64];
PARAMETROS_buffer:
        DS8 128
//   55 
//   56 /***********************************************************************************
//   57 *       Funções locais
//   58 ***********************************************************************************/
//   59 
//   60 
//   61 /***********************************************************************************
//   62 *       Implementação das funções
//   63 ***********************************************************************************/
//   64 
//   65 /***********************************************************************************
//   66 *       Descrição       :       Inicialização do gerenciador de parametros
//   67 *       Parametros      :       nenhum
//   68 *       Retorno         :       nenhum
//   69 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PARAMETROS_ini
        THUMB
//   70 void PARAMETROS_ini(void){
PARAMETROS_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   71   
//   72   MEMORYWRAPPER_init();
          CFI FunCall MEMORYWRAPPER_init
        BL       MEMORYWRAPPER_init
//   73 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   74 /***********************************************************************************
//   75 *       Descrição       :       Resolve o endereço lógico para o físico
//   76 *       Parametros      :       (unsigned int) endereço físico do parâmetro
//   77 *       Retorno         :       (unsigned int) endereço lógico do parâmetro
//   78 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PARAMETROS_resolve_endereco
          CFI NoCalls
        THUMB
//   79 unsigned int PARAMETROS_resolve_endereco(unsigned int endereco){
PARAMETROS_resolve_endereco:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//   80   unsigned int endereco_fisico=0;
        MOVS     R1,#+0
//   81 
//   82   for(unsigned int i=0;i<endereco;i++)
        MOVS     R2,#+0
        B.N      ??PARAMETROS_resolve_endereco_0
//   83     endereco_fisico+=(tabela_parametros[i].length+2); // 2 = CRC
??PARAMETROS_resolve_endereco_1:
        MOVS     R3,#+44
        LDR.N    R4,??DataTable4
        MLA      R3,R3,R2,R4
        LDRH     R3,[R3, #+4]
        ADDS     R3,R3,#+2
        ADDS     R1,R3,R1
        ADDS     R2,R2,#+1
??PARAMETROS_resolve_endereco_0:
        CMP      R2,R0
        BCC.N    ??PARAMETROS_resolve_endereco_1
//   84 
//   85   return endereco_fisico;  
        MOVS     R0,R1
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//   86 }
//   87 /***********************************************************************************
//   88 *       Descrição       :       Parametros      
//   89 *       Parametros      :       (unsigned int) endereço
//   90 *                               (void*) parametro
//   91 *       Retorno         :       nenhum
//   92 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PARAMETROS_grava
        THUMB
//   93 void PARAMETROS_grava(unsigned int endereco,void*parametro){
PARAMETROS_grava:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   94   unsigned short int crc;  
//   95   
//   96   memcpy(&PARAMETROS_buffer[0][0],parametro,tabela_parametros[endereco].length);
        MOVS     R0,#+44
        LDR.N    R2,??DataTable4
        MLA      R0,R0,R4,R2
        LDRH     R2,[R0, #+4]
        LDR.N    R0,??DataTable4_1
          CFI FunCall memcpy
        BL       memcpy
//   97   crc = CCTALK_calculaCRC(&PARAMETROS_buffer[0][0],0,tabela_parametros[endereco].length);
        MOVS     R0,#+44
        LDR.N    R1,??DataTable4
        MLA      R0,R0,R4,R1
        LDRH     R2,[R0, #+4]
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_1
          CFI FunCall CCTALK_calculaCRC
        BL       CCTALK_calculaCRC
//   98   PARAMETROS_buffer[0][tabela_parametros[endereco].length]   = crc>>8;
        MOVS     R1,#+44
        LDR.N    R2,??DataTable4
        MLA      R1,R1,R4,R2
        LDRH     R1,[R1, #+4]
        LDR.N    R2,??DataTable4_1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R3,R0,#+8
        STRB     R3,[R1, R2]
//   99   PARAMETROS_buffer[0][tabela_parametros[endereco].length+1] = crc;
        MOVS     R1,#+44
        LDR.N    R2,??DataTable4
        MLA      R1,R1,R4,R2
        LDRH     R1,[R1, #+4]
        LDR.N    R2,??DataTable4_1
        ADDS     R1,R1,R2
        STRB     R0,[R1, #+1]
//  100  
//  101   MEMORYWRAPPER_writeBytes(PARAMETROS_resolve_endereco(endereco),
//  102                            &PARAMETROS_buffer[0][0],
//  103                            tabela_parametros[endereco].length+2);
        MOVS     R0,R4
          CFI FunCall PARAMETROS_resolve_endereco
        BL       PARAMETROS_resolve_endereco
        MOVS     R1,#+44
        LDR.N    R2,??DataTable4
        MLA      R1,R1,R4,R2
        LDRH     R1,[R1, #+4]
        ADDS     R2,R1,#+2
        LDR.N    R1,??DataTable4_1
          CFI FunCall MEMORYWRAPPER_writeBytes
        BL       MEMORYWRAPPER_writeBytes
//  104 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3
//  105 /***********************************************************************************
//  106 *       Descrição       :       Parâmetros
//  107 *       Parametros      :       (unsigned int) endereço
//  108 *                               (void*) dados do parâmetro
//  109 *       Retorno         :       nenhum
//  110 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PARAMETROS_le
        THUMB
//  111 void PARAMETROS_le(unsigned int endereco,void*parametro){
PARAMETROS_le:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  112   unsigned short int crc;
//  113   
//  114   MEMORYWRAPPER_readBytes(PARAMETROS_resolve_endereco(endereco),
//  115                           &PARAMETROS_buffer[1][0],
//  116                           tabela_parametros[endereco].length+2);
        MOVS     R0,R4
          CFI FunCall PARAMETROS_resolve_endereco
        BL       PARAMETROS_resolve_endereco
        MOVS     R1,#+44
        LDR.N    R2,??DataTable4
        MLA      R1,R1,R4,R2
        LDRH     R1,[R1, #+4]
        ADDS     R2,R1,#+2
        LDR.N    R1,??DataTable4_2
          CFI FunCall MEMORYWRAPPER_readBytes
        BL       MEMORYWRAPPER_readBytes
//  117   
//  118   crc = CCTALK_calculaCRC(&PARAMETROS_buffer[1][0],0,tabela_parametros[endereco].length);
        MOVS     R0,#+44
        LDR.N    R1,??DataTable4
        MLA      R0,R0,R4,R1
        LDRH     R2,[R0, #+4]
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_2
          CFI FunCall CCTALK_calculaCRC
        BL       CCTALK_calculaCRC
//  119   if(crc==(PARAMETROS_buffer[1][tabela_parametros[endereco].length]<<8 | PARAMETROS_buffer[1][tabela_parametros[endereco].length+1]))
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R1,#+44
        LDR.N    R2,??DataTable4
        MLA      R1,R1,R4,R2
        LDRH     R1,[R1, #+4]
        LDR.N    R2,??DataTable4_1
        ADDS     R1,R1,R2
        LDRB     R1,[R1, #+64]
        MOVS     R2,#+44
        LDR.N    R3,??DataTable4
        MLA      R2,R2,R4,R3
        LDRH     R2,[R2, #+4]
        LDR.N    R3,??DataTable4_1
        ADDS     R2,R2,R3
        LDRB     R2,[R2, #+65]
        ORRS     R1,R2,R1, LSL #+8
        CMP      R0,R1
        BNE.N    ??PARAMETROS_le_0
//  120     memcpy(parametro,&PARAMETROS_buffer[1][0],tabela_parametros[endereco].length);      
        MOVS     R0,#+44
        LDR.N    R1,??DataTable4
        MLA      R0,R0,R4,R1
        LDRH     R2,[R0, #+4]
        LDR.N    R1,??DataTable4_2
        MOVS     R0,R5
          CFI FunCall memcpy
        BL       memcpy
        B.N      ??PARAMETROS_le_1
//  121   else{
//  122     unsigned char *ptr = (unsigned char*)parametro;
//  123     unsigned char *vlr = (unsigned char*)&tabela_parametros[endereco].default_value;
??PARAMETROS_le_0:
        MOVS     R0,#+44
        LDR.N    R1,??DataTable4
        MLA      R0,R0,R4,R1
//  124     
//  125     for(unsigned char i=0;i<tabela_parametros[endereco].length;i++)
        MOVS     R1,#+0
        B.N      ??PARAMETROS_le_2
//  126       ptr[i] = vlr[i];    
??PARAMETROS_le_3:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDRB     R2,[R1, R0]
        STRB     R2,[R1, R5]
        ADDS     R1,R1,#+1
??PARAMETROS_le_2:
        MOVS     R2,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R3,#+44
        LDR.N    R6,??DataTable4
        MLA      R3,R3,R4,R6
        LDRH     R3,[R3, #+4]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,R3
        BCC.N    ??PARAMETROS_le_3
//  127   }
//  128 }
??PARAMETROS_le_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock4
//  129 /***********************************************************************************
//  130 *       Descrição       :       Getter para o tamanho total da lista 
//  131 *                               de parâmetros
//  132 *       Parametros      :       nenhum
//  133 *       Retorno         :       (unsigned short int) tamanho da lista
//  134 *                               de parâmetros
//  135 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function PARAMETROS_get_tamanho_lista
          CFI NoCalls
        THUMB
//  136 unsigned short int PARAMETROS_get_tamanho_lista(void){
//  137   
//  138   return TAMANHO_PARAMETROS;
PARAMETROS_get_tamanho_lista:
        MOVS     R0,#+44
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  139 }
//  140 /***********************************************************************************
//  141 *       Descrição       :       Lê as informações referentes a um 
//  142 *                               determinado parâmetro
//  143 *       Parametros      :       (unsigned short int) indice
//  144 *                       :       (unsigned short int*)tamanho
//  145 *                               (char*) nome
//  146 *                               (char*) extensao
//  147 *                               (void*) valor 
//  148 *       Retorno         :       nenhum
//  149 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function PARAMETROS_get_parametro_rec
        THUMB
//  150 void PARAMETROS_get_parametro_rec(unsigned short int indice,unsigned short int *tamanho,
//  151                                   char *nome,char *extensao,void *valor){
PARAMETROS_get_parametro_rec:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R0,R2
        MOVS     R5,R3
        LDR      R6,[SP, #+16]
//  152                                     
//  153   *tamanho = tabela_parametros[indice].length;
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R2,#+44
        LDR.N    R3,??DataTable4
        MLA      R2,R2,R4,R3
        LDRH     R2,[R2, #+4]
        STRH     R2,[R1, #+0]
//  154   memcpy(nome,tabela_parametros[indice].nome,16);
        MOVS     R2,#+16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R1,#+44
        LDR.N    R3,??DataTable4
        MLA      R1,R1,R4,R3
        ADDS     R1,R1,#+6
          CFI FunCall memcpy
        BL       memcpy
//  155   memcpy(extensao,tabela_parametros[indice].ext,3);  
        MOVS     R2,#+3
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+44
        LDR.N    R1,??DataTable4
        MLA      R0,R0,R4,R1
        ADDS     R1,R0,#+38
        MOVS     R0,R5
          CFI FunCall memcpy
        BL       memcpy
//  156   PARAMETROS_le(indice,valor);
        MOVS     R1,R6
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,R4
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  157 }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock6
//  158 /***********************************************************************************
//  159 *       Descrição       :       Escreve as informações referentes a um
//  160 *                               determinado parâmetro
//  161 *       Parametros      :       (unsigned short int) indice
//  162 *                               (unsigned short int) quantidade de octetos
//  163 *                               (unsigned char*) ponteiro para o buffer
//  164 *                                               de dados
//  165 *       Retorno         :       nenhum
//  166 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function PARAMETROS_set_parametro_rec
        THUMB
//  167 void PARAMETROS_set_parametro_rec(unsigned short int indice,unsigned short int tamanho,
//  168                                   unsigned char *pData){
PARAMETROS_set_parametro_rec:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  169                                     
//  170   if(tabela_parametros[indice].length>PAR_DOUBLE_WORD){
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R3,#+44
        LDR.N    R4,??DataTable4
        MLA      R3,R3,R0,R4
        LDRH     R3,[R3, #+4]
        CMP      R3,#+5
        BLT.N    ??PARAMETROS_set_parametro_rec_0
//  171     for(unsigned char i=tamanho-1;i<tabela_parametros[indice].length;i++)
        SUBS     R1,R1,#+1
        B.N      ??PARAMETROS_set_parametro_rec_1
//  172       pData[i] = ' ';
??PARAMETROS_set_parametro_rec_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R3,#+32
        STRB     R3,[R1, R2]
        ADDS     R1,R1,#+1
??PARAMETROS_set_parametro_rec_1:
        MOVS     R3,R1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R4,#+44
        LDR.N    R5,??DataTable4
        MLA      R4,R4,R0,R5
        LDRH     R4,[R4, #+4]
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,R4
        BCC.N    ??PARAMETROS_set_parametro_rec_2
//  173   }
//  174   
//  175   PARAMETROS_grava(indice,pData);                                     
??PARAMETROS_set_parametro_rec_0:
        MOVS     R1,R2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  176 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     tabela_parametros

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     PARAMETROS_buffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     PARAMETROS_buffer+0x40

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  177 /***********************************************************************************
//  178 *       Fim do arquivo
//  179 ***********************************************************************************/
// 
//   128 bytes in section .bss
// 2 000 bytes in section .rodata
//   466 bytes in section .text
// 
//   452 bytes of CODE  memory (+ 14 bytes shared)
// 2 000 bytes of CONST memory
//   128 bytes of DATA  memory
//
//Errors: none
//Warnings: none
