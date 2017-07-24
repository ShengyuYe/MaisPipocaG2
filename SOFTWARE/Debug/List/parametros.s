///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     24/Jul/2017  16:53:22 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Parametros\parametros.c                 /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Parametros\parametros.c -lC             /
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
//                    pocaG2\SOFTWARE\Debug\List\parametros.s                 /
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Parametros\parametros.c
//    1 /*__________________________________________________________________________________
//    2 |	Dextro Soluções Tecnológicas
//    3 |       
//    4 |       Itajaí/SC
//    5 |       www.dextro-st.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Dextro  and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Dextro
//   10 |       or its distributors.
//   11 |
//   12 |       Este código é propriedade da Dextro e não pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       Dextro ou por um de seus distribuidores.
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
//   32 #include <stdio.h>
//   33 #include <stdlib.h>
//   34 #include <string.h>

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
//   35 #include "..\includes.h"
//   36 #include "parametros.h"
//   37 #include "tabela_parametros.h"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute struct <unnamed> const tabela_parametros[46]
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
        DC8 4EH, 55H, 4DH
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
        DC8 "COMP_ERRO_MOTOR"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 4EH, 55H, 4DH
        DC8 0, 0, 0
        DC32 0H
        DC16 4
        DC8 "COMP_TEMP"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 4EH, 55H, 4DH
        DC8 0, 0, 0
//   38 
//   39 
//   40 /***********************************************************************************
//   41 *       Constantes
//   42 ***********************************************************************************/
//   43 
//   44 
//   45 /***********************************************************************************
//   46 *       Definições
//   47 ***********************************************************************************/
//   48 
//   49 
//   50 /***********************************************************************************
//   51 *       Variaveis locais
//   52 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   53 unsigned char PARAMETROS_buffer[2][64];
PARAMETROS_buffer:
        DS8 128
//   54 
//   55 /***********************************************************************************
//   56 *       Funções locais
//   57 ***********************************************************************************/
//   58 
//   59 
//   60 /***********************************************************************************
//   61 *       Implementação das funções
//   62 ***********************************************************************************/
//   63 
//   64 /***********************************************************************************
//   65 *       Descrição       :       Inicialização do gerenciador de parametros
//   66 *       Parametros      :       nenhum
//   67 *       Retorno         :       nenhum
//   68 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PARAMETROS_ini
        THUMB
//   69 void PARAMETROS_ini(void){
PARAMETROS_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   70   
//   71   MEMORYWRAPPER_init();
          CFI FunCall MEMORYWRAPPER_init
        BL       MEMORYWRAPPER_init
//   72 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   73 /***********************************************************************************
//   74 *       Descrição       :       Resolve o endereço lógico para o físico
//   75 *       Parametros      :       (unsigned int) endereço físico do parâmetro
//   76 *       Retorno         :       (unsigned int) endereço lógico do parâmetro
//   77 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PARAMETROS_resolve_endereco
          CFI NoCalls
        THUMB
//   78 unsigned int PARAMETROS_resolve_endereco(unsigned int endereco){
PARAMETROS_resolve_endereco:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//   79   unsigned int endereco_fisico=0;
        MOVS     R1,#+0
//   80 
//   81   for(unsigned int i=0;i<endereco;i++)
        MOVS     R2,#+0
        B.N      ??PARAMETROS_resolve_endereco_0
//   82     endereco_fisico+=(tabela_parametros[i].length+2); // 2 = CRC
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
//   83 
//   84   return endereco_fisico;  
        MOVS     R0,R1
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//   85 }
//   86 /***********************************************************************************
//   87 *       Descrição       :       Parametros      
//   88 *       Parametros      :       (unsigned int) endereço
//   89 *                               (void*) parametro
//   90 *       Retorno         :       nenhum
//   91 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PARAMETROS_grava
        THUMB
//   92 void PARAMETROS_grava(unsigned int endereco,void*parametro){
PARAMETROS_grava:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   93   unsigned short int crc;  
//   94   
//   95   memcpy(&PARAMETROS_buffer[0][0],parametro,tabela_parametros[endereco].length);
        MOVS     R0,#+44
        LDR.N    R2,??DataTable4
        MLA      R0,R0,R4,R2
        LDRH     R2,[R0, #+4]
        LDR.N    R0,??DataTable4_1
          CFI FunCall memcpy
        BL       memcpy
//   96   crc = CCTALK_calculaCRC(&PARAMETROS_buffer[0][0],0,tabela_parametros[endereco].length);
        MOVS     R0,#+44
        LDR.N    R1,??DataTable4
        MLA      R0,R0,R4,R1
        LDRH     R2,[R0, #+4]
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_1
          CFI FunCall CCTALK_calculaCRC
        BL       CCTALK_calculaCRC
//   97   PARAMETROS_buffer[0][tabela_parametros[endereco].length]   = crc>>8;
        MOVS     R1,#+44
        LDR.N    R2,??DataTable4
        MLA      R1,R1,R4,R2
        LDRH     R1,[R1, #+4]
        LDR.N    R2,??DataTable4_1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R3,R0,#+8
        STRB     R3,[R1, R2]
//   98   PARAMETROS_buffer[0][tabela_parametros[endereco].length+1] = crc;
        MOVS     R1,#+44
        LDR.N    R2,??DataTable4
        MLA      R1,R1,R4,R2
        LDRH     R1,[R1, #+4]
        LDR.N    R2,??DataTable4_1
        ADDS     R1,R1,R2
        STRB     R0,[R1, #+1]
//   99  
//  100   MEMORYWRAPPER_writeBytes(PARAMETROS_resolve_endereco(endereco),
//  101                            &PARAMETROS_buffer[0][0],
//  102                            tabela_parametros[endereco].length+2);
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
//  103 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3
//  104 /***********************************************************************************
//  105 *       Descrição       :       Parâmetros
//  106 *       Parametros      :       (unsigned int) endereço
//  107 *                               (void*) dados do parâmetro
//  108 *       Retorno         :       nenhum
//  109 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PARAMETROS_le
        THUMB
//  110 void PARAMETROS_le(unsigned int endereco,void*parametro){
PARAMETROS_le:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  111   unsigned short int crc;
//  112   
//  113   MEMORYWRAPPER_readBytes(PARAMETROS_resolve_endereco(endereco),
//  114                           &PARAMETROS_buffer[1][0],
//  115                           tabela_parametros[endereco].length+2);
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
//  116   
//  117   crc = CCTALK_calculaCRC(&PARAMETROS_buffer[1][0],0,tabela_parametros[endereco].length);
        MOVS     R0,#+44
        LDR.N    R1,??DataTable4
        MLA      R0,R0,R4,R1
        LDRH     R2,[R0, #+4]
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_2
          CFI FunCall CCTALK_calculaCRC
        BL       CCTALK_calculaCRC
//  118   if(crc==(PARAMETROS_buffer[1][tabela_parametros[endereco].length]<<8 | PARAMETROS_buffer[1][tabela_parametros[endereco].length+1]))
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
//  119     memcpy(parametro,&PARAMETROS_buffer[1][0],tabela_parametros[endereco].length);      
        MOVS     R0,#+44
        LDR.N    R1,??DataTable4
        MLA      R0,R0,R4,R1
        LDRH     R2,[R0, #+4]
        LDR.N    R1,??DataTable4_2
        MOVS     R0,R5
          CFI FunCall memcpy
        BL       memcpy
        B.N      ??PARAMETROS_le_1
//  120   else{
//  121     unsigned char *ptr = (unsigned char*)parametro;
//  122     unsigned char *vlr = (unsigned char*)&tabela_parametros[endereco].default_value;
??PARAMETROS_le_0:
        MOVS     R0,#+44
        LDR.N    R1,??DataTable4
        MLA      R0,R0,R4,R1
//  123     
//  124     for(unsigned char i=0;i<tabela_parametros[endereco].length;i++)
        MOVS     R1,#+0
        B.N      ??PARAMETROS_le_2
//  125       ptr[i] = vlr[i];    
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
//  126   }
//  127 }
??PARAMETROS_le_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock4
//  128 /***********************************************************************************
//  129 *       Descrição       :       Getter para o tamanho total da lista 
//  130 *                               de parâmetros
//  131 *       Parametros      :       nenhum
//  132 *       Retorno         :       (unsigned short int) tamanho da lista
//  133 *                               de parâmetros
//  134 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function PARAMETROS_get_tamanho_lista
          CFI NoCalls
        THUMB
//  135 unsigned short int PARAMETROS_get_tamanho_lista(void){
//  136   
//  137   return TAMANHO_PARAMETROS;
PARAMETROS_get_tamanho_lista:
        MOVS     R0,#+46
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  138 }
//  139 /***********************************************************************************
//  140 *       Descrição       :       Lê as informações referentes a um 
//  141 *                               determinado parâmetro
//  142 *       Parametros      :       (unsigned short int) indice
//  143 *                       :       (unsigned short int*)tamanho
//  144 *                               (char*) nome
//  145 *                               (char*) extensao
//  146 *                               (void*) valor 
//  147 *       Retorno         :       nenhum
//  148 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function PARAMETROS_get_parametro_rec
        THUMB
//  149 void PARAMETROS_get_parametro_rec(unsigned short int indice,unsigned short int *tamanho,
//  150                                   char *nome,char *extensao,void *valor){
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
//  151                                     
//  152   *tamanho = tabela_parametros[indice].length;
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R2,#+44
        LDR.N    R3,??DataTable4
        MLA      R2,R2,R4,R3
        LDRH     R2,[R2, #+4]
        STRH     R2,[R1, #+0]
//  153   memcpy(nome,tabela_parametros[indice].nome,16);
        MOVS     R2,#+16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R1,#+44
        LDR.N    R3,??DataTable4
        MLA      R1,R1,R4,R3
        ADDS     R1,R1,#+6
          CFI FunCall memcpy
        BL       memcpy
//  154   memcpy(extensao,tabela_parametros[indice].ext,3);  
        MOVS     R2,#+3
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+44
        LDR.N    R1,??DataTable4
        MLA      R0,R0,R4,R1
        ADDS     R1,R0,#+38
        MOVS     R0,R5
          CFI FunCall memcpy
        BL       memcpy
//  155   PARAMETROS_le(indice,valor);
        MOVS     R1,R6
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,R4
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  156 }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock6
//  157 /***********************************************************************************
//  158 *       Descrição       :       Escreve as informações referentes a um
//  159 *                               determinado parâmetro
//  160 *       Parametros      :       (unsigned short int) indice
//  161 *                               (unsigned short int) quantidade de octetos
//  162 *                               (unsigned char*) ponteiro para o buffer
//  163 *                                               de dados
//  164 *       Retorno         :       nenhum
//  165 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function PARAMETROS_set_parametro_rec
        THUMB
//  166 void PARAMETROS_set_parametro_rec(unsigned short int indice,unsigned short int tamanho,
//  167                                   unsigned char *pData){
PARAMETROS_set_parametro_rec:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  168                                     
//  169   if(tabela_parametros[indice].length>PAR_DOUBLE_WORD){
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R3,#+44
        LDR.N    R4,??DataTable4
        MLA      R3,R3,R0,R4
        LDRH     R3,[R3, #+4]
        CMP      R3,#+5
        BLT.N    ??PARAMETROS_set_parametro_rec_0
//  170     for(unsigned char i=tamanho-1;i<tabela_parametros[indice].length;i++)
        SUBS     R1,R1,#+1
        B.N      ??PARAMETROS_set_parametro_rec_1
//  171       pData[i] = ' ';
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
//  172   }
//  173   
//  174   PARAMETROS_grava(indice,pData);                                     
??PARAMETROS_set_parametro_rec_0:
        MOVS     R1,R2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  175 }
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
//  176 /***********************************************************************************
//  177 *       Fim do arquivo
//  178 ***********************************************************************************/
// 
//   128 bytes in section .bss
// 2 044 bytes in section .rodata
//   466 bytes in section .text
// 
//   452 bytes of CODE  memory (+ 14 bytes shared)
// 2 044 bytes of CONST memory
//   128 bytes of DATA  memory
//
//Errors: none
//Warnings: none
