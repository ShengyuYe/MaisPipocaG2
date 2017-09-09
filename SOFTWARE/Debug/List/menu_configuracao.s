///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     09/Sep/2017  16:47:25 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_co /
//                    nfiguracao.c                                            /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_co /
//                    nfiguracao.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\ /
//                    Debug\List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\D /
//                    ebug\List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Deb /
//                    ug\Obj\ --no_cse --no_unroll --no_inline                /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\menu_c /
//                    onfiguracao.s                                           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_configuracao

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN APLICACAO_carrega_idioma
        EXTERN MACESS_entry
        EXTERN MENUAVANCADO_entry
        EXTERN MENUFAT_entry
        EXTERN MENUOP_entry
        EXTERN MENUROLAGEM_show
        EXTERN MPREP_entry
        EXTERN MSERVICO_entry
        EXTERN MSL_entry
        EXTERN MTH_entry
        EXTERN PARAMETROS_grava
        EXTERN STRING_menu_configuracao
        EXTERN STRING_tela_sel_idioma
        EXTERN STRING_titulo_menu_configuracao

        PUBLIC MCFG_entry
        PUBLIC MCFG_seleciona_idioma
        PUBLIC MCF_funcoes
        
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
        

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "LOCATION">`:
        DATA
        DC8 "LOCATION"
        DC8 0, 0, 0
// C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_configuracao.c
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
//   17 |       Arquivo            :  menu_configuracao.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :
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
//   34 #include "..\includes.h"
//   35 #include "menu_ajuste_relogio.h"
//   36 #include "menu_edita_flag.h"
//   37 #include "menu_edita_inteiro.h"
//   38 #include "menu_edita_listagem.h"
//   39 #include "menu_info_binaria.h"
//   40 #include "menu_rolagem.h"
//   41 #include "menu_teste_hardware.h"
//   42 #include "menu_operacao.h"
//   43 #include "menu_acessorios.h"
//   44 #include "menu_faturamento.h"
//   45 #include "menu_seleciona_lista.h"
//   46 #include "menu_servico.h"
//   47 #include "menu_avancado.h"
//   48 
//   49 /***********************************************************************************
//   50 *       Constantes
//   51 ***********************************************************************************/
//   52 
//   53 
//   54 /***********************************************************************************
//   55 *       Variaveis 
//   56 ***********************************************************************************/
//   57 
//   58 
//   59 /***********************************************************************************
//   60 *       Funções
//   61 ***********************************************************************************/
//   62 void MCFG_seleciona_idioma(void);
//   63 
//   64 /***********************************************************************************
//   65 *       Tabela de funções
//   66 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   67 void(*const MCF_funcoes[TAM_OPCOES_CFG])(void)={
MCF_funcoes:
        DATA
        DC32 MENUOP_entry, MENUFAT_entry, MPREP_entry, MACESS_entry, 0H
        DC32 MTH_entry, MCFG_seleciona_idioma, MSERVICO_entry
        DC32 MENUAVANCADO_entry, 0H
//   68   MENUOP_entry,
//   69   MENUFAT_entry,
//   70   MPREP_entry,
//   71   MACESS_entry,
//   72   NULL,
//   73   MTH_entry,
//   74   MCFG_seleciona_idioma,
//   75   MSERVICO_entry,
//   76   MENUAVANCADO_entry,
//   77   NULL
//   78 };
//   79 
//   80 /***********************************************************************************
//   81 *       Implementação
//   82 ***********************************************************************************/
//   83 
//   84 /***********************************************************************************
//   85 *       Descrição       :       Ponto de entrada do menu de configuração
//   86 *                               do sistema
//   87 *       Parametros      :       nenhum
//   88 *       Retorno         :       nenhum
//   89 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MCFG_entry
        THUMB
//   90 void MCFG_entry(void){
MCFG_entry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   91   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//   92   
//   93   MENUROLAGEM_show((char*)STRING_titulo_menu_configuracao[idioma],
//   94                    (char**)STRING_menu_configuracao[idioma],
//   95                    TAM_OPCOES_CFG,
//   96                    (void(**)(void))MCF_funcoes);                                  
        LDR.N    R3,??DataTable1
        MOVS     R2,#+10
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+40
        LDR.N    R1,??DataTable1_1
        MLA      R1,R0,R4,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable1_2
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MENUROLAGEM_show
        BL       MENUROLAGEM_show
//   97 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   98 /***********************************************************************************
//   99 *       Descrição       :       Função para selecionar o idioma da placa
//  100 *       Parametros      :       nenhum
//  101 *       Retorno         :       nenhum
//  102 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MCFG_seleciona_idioma
        THUMB
//  103 void MCFG_seleciona_idioma(void){
MCFG_seleciona_idioma:
        PUSH     {R5-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+16
//  104   unsigned char idioma;
//  105   unsigned char flags[8]={0};  
        ADD      R0,SP,#+4
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
//  106   
//  107   idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        STRB     R0,[SP, #+0]
//  108   
//  109   if(idioma>QTY_OF_LANGUAGES)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+8
        BLT.N    ??MCFG_seleciona_idioma_0
//  110     idioma = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  111   
//  112   flags[idioma] = 255;
??MCFG_seleciona_idioma_0:
        LDRB     R0,[SP, #+0]
        ADD      R1,SP,#+4
        MOVS     R2,#+255
        STRB     R2,[R0, R1]
//  113     
//  114   MSL_entry("LOCATION",(char**)&STRING_tela_sel_idioma[0][0],flags,TAM_OPCOES_IDIOMA);
        MOVS     R3,#+7
        ADD      R2,SP,#+4
        LDR.N    R1,??DataTable1_3
        LDR.N    R0,??DataTable1_4
          CFI FunCall MSL_entry
        BL       MSL_entry
//  115   
//  116   idioma = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  117   for(unsigned char i=0;i<QTY_OF_LANGUAGES;i++)
        MOVS     R0,#+0
??MCFG_seleciona_idioma_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+7
        BGE.N    ??MCFG_seleciona_idioma_2
//  118     if(flags[i])
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+4
        LDRB     R1,[R0, R1]
        CMP      R1,#+0
        BEQ.N    ??MCFG_seleciona_idioma_3
//  119       idioma = i;      
        STRB     R0,[SP, #+0]
??MCFG_seleciona_idioma_3:
        ADDS     R0,R0,#+1
        B.N      ??MCFG_seleciona_idioma_1
//  120 
//  121   PARAMETROS_grava(ADR_FLAG_IDIOMA,(void*)&idioma);      
??MCFG_seleciona_idioma_2:
        ADD      R1,SP,#+0
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  122 }
        POP      {R0-R2,PC}       ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     MCF_funcoes

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     STRING_menu_configuracao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     STRING_titulo_menu_configuracao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     STRING_tela_sel_idioma

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     `?<Constant "LOCATION">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  123 /***********************************************************************************
//  124 *       Fim do arquivo
//  125 ***********************************************************************************/
// 
//  60 bytes in section .rodata
// 154 bytes in section .text
// 
// 154 bytes of CODE  memory
//  60 bytes of CONST memory
//
//Errors: none
//Warnings: none
