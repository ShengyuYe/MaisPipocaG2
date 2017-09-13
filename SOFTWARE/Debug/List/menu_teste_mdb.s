///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     13/Sep/2017  17:11:34 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_te /
//                    ste_mdb.c                                               /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_te /
//                    ste_mdb.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\Deb /
//                    ug\List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Debu /
//                    g\List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\ /
//                    Obj\ --no_cse --no_unroll --no_inline --no_code_motion  /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\menu_t /
//                    este_mdb.s                                              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_teste_mdb

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", "flags,widths"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN APLICACAO_carrega_idioma
        EXTERN BOARD_getter_general_purpose_counter
        EXTERN BOARD_setter_general_purpose_counter
        EXTERN CASHLESS_adreess
        EXTERN MDBCOIN_get_device
        EXTERN MDBILL_verifica_dispositivo
        EXTERN MDB_coin_dispenser
        EXTERN MENUROLAGEM_show
        EXTERN PAGAMENTOS_get_valor_acumulado
        EXTERN PAGAMENTOS_set_valores
        EXTERN SMDBCOIN_set_flag_bloqueio
        EXTERN SMDBILL_set_bloqueio
        EXTERN SMDB_release
        EXTERN SMDB_wait
        EXTERN STRING_opcoes_menu_mdb
        EXTERN STRING_titulo_menu_mdb
        EXTERN STRING_titulo_teste_bill_mdb
        EXTERN STRING_titulo_teste_coin_changer_mdb
        EXTERN STRING_titulo_teste_coin_mdb
        EXTERN STRING_titulo_teste_devices_mdb
        EXTERN STRING_write_to_internal
        EXTERN TECLADO_getch
        EXTERN sprintf

        PUBLIC MTMDB_entry
        PUBLIC MTMDB_func
        PUBLIC MTMDB_libera_troco
        PUBLIC MTMDB_test_contagem_cartao
        PUBLIC MTMDB_teste_contagem_moedeiro
        PUBLIC MTMDB_teste_contagem_noteiro
        PUBLIC MTMDB_verifica_dispositivos
        
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
`?<Constant "BV:%01d CA:%01d CD:%01d">`:
        DATA
        DC8 "BV:%01d CA:%01d CD:%01d"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%05d[%s]">`:
        DATA
        DC8 "%05d[%s]"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant " LOCK ">`:
        DATA
        DC8 " LOCK "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "UNLOCK">`:
        DATA
        DC8 "UNLOCK"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%04d,%02d[%s]">`:
        DATA
        DC8 "%04d,%02d[%s]"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Moedas:%02d">`:
        DATA
        DC8 "Moedas:%02d"
// C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_teste_mdb.c
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
//   17 |       Arquivo            :  menu_teste_mdb.c
//   18 |       Descrição          :  Menu para realizar o teste dos dispositivos MDB
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  28/02/2017
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
//   32 #include <stdio.h>
//   33 #include <stdlib.h>
//   34 #include <string.h>
//   35 #include "..\includes.h"
//   36 #include "menu_teste_mdb.h"
//   37 #include "menu_ajuste_relogio.h"
//   38 #include "menu_configuracao.h"
//   39 #include "menu_edita_flag.h"
//   40 #include "menu_edita_inteiro.h"
//   41 #include "menu_edita_listagem.h"
//   42 #include "menu_info_binaria.h"
//   43 #include "menu_rolagem.h"
//   44 #include "menu_teste_hardware.h"
//   45 
//   46 /***********************************************************************************
//   47 *       Definições
//   48 ***********************************************************************************/
//   49 
//   50 
//   51 /***********************************************************************************
//   52 *       Variaveis locais
//   53 ***********************************************************************************/
//   54 
//   55 
//   56 /************************************************************************************
//   57 *       Funções locais
//   58 ***********************************************************************************/
//   59 void MTMDB_verifica_dispositivos(void);
//   60 void MTMDB_teste_contagem_noteiro(void);
//   61 void MTMDB_teste_contagem_moedeiro(void);
//   62 void MTMDB_test_contagem_cartao(void);
//   63 void MTMDB_libera_troco(void);
//   64 
//   65 /***********************************************************************************
//   66 *       Tabela de funções
//   67 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   68 void(*const MTMDB_func[])(void)={
MTMDB_func:
        DATA
        DC32 MTMDB_verifica_dispositivos, MTMDB_teste_contagem_noteiro
        DC32 MTMDB_teste_contagem_moedeiro, MTMDB_test_contagem_cartao, 0H
//   69   MTMDB_verifica_dispositivos,
//   70   MTMDB_teste_contagem_noteiro,
//   71   MTMDB_teste_contagem_moedeiro,
//   72   MTMDB_test_contagem_cartao,
//   73   NULL
//   74 };
//   75 
//   76 /***********************************************************************************
//   77 *       Implementação das funções
//   78 ***********************************************************************************/
//   79 
//   80 /***********************************************************************************
//   81 *       Descrição       :       Função principal do menu de teste 
//   82 *                               do barramento MDB
//   83 *       Parametros      :       nenhum
//   84 *       Retorno         :       nenhum
//   85 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MTMDB_entry
        THUMB
//   86 void MTMDB_entry(void){
MTMDB_entry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   87   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//   88   
//   89   MENUROLAGEM_show((char*)STRING_titulo_menu_mdb[idioma],
//   90                    (char**)STRING_opcoes_menu_mdb[idioma],
//   91                    TAM_OPCOES_MDB,
//   92                    (void(**)(void))MTMDB_func); 
        LDR.N    R3,??DataTable4
        MOVS     R2,#+5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+20
        LDR.N    R1,??DataTable4_1
        MLA      R1,R0,R4,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable4_2
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MENUROLAGEM_show
        BL       MENUROLAGEM_show
//   93 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   94 /***********************************************************************************
//   95 *       Descrição       :       Função para visualizar o flag de comunicação
//   96 *                               dos dispositivos MDB
//   97 *       Parametros      :       nenhum
//   98 *       Retorno         :       nenhum
//   99 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MTMDB_verifica_dispositivos
        THUMB
//  100 void MTMDB_verifica_dispositivos(void){
MTMDB_verifica_dispositivos:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        SUB      SP,SP,#+24
          CFI CFA R13+48
//  101   eTECLA tecla;
//  102   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R5,R0
//  103   char buffer_linha[17];
//  104   
//  105   SMDB_wait();
          CFI FunCall SMDB_wait
        BL       SMDB_wait
//  106   
//  107   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_devices_mdb[idioma],NULL);    
        MOVS     R2,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R0,??DataTable4_3
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  108   
//  109   for(;;){
//  110    
//  111     tecla = TECLADO_getch();
??MTMDB_verifica_dispositivos_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R4,R0
//  112     switch(tecla){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??MTMDB_verifica_dispositivos_1
        BCC.N    ??MTMDB_verifica_dispositivos_2
        CMP      R4,#+3
        BEQ.N    ??MTMDB_verifica_dispositivos_3
        BCC.N    ??MTMDB_verifica_dispositivos_4
        CMP      R4,#+4
        BNE.N    ??MTMDB_verifica_dispositivos_2
//  113       case TECLA_ENTER:
//  114            break;
??MTMDB_verifica_dispositivos_5:
        B.N      ??MTMDB_verifica_dispositivos_2
//  115       case TECLA_ESC:
//  116            SMDB_release(); 
??MTMDB_verifica_dispositivos_1:
          CFI FunCall SMDB_release
        BL       SMDB_release
//  117            return;
        B.N      ??MTMDB_verifica_dispositivos_6
//  118       case TECLA_INC:           
//  119            break;
??MTMDB_verifica_dispositivos_4:
        B.N      ??MTMDB_verifica_dispositivos_2
//  120       case TECLA_DEC:
//  121            break;
//  122     }
//  123     
//  124     eMDB_reply bill  = MDBILL_verifica_dispositivo();
??MTMDB_verifica_dispositivos_3:
??MTMDB_verifica_dispositivos_2:
          CFI FunCall MDBILL_verifica_dispositivo
        BL       MDBILL_verifica_dispositivo
        MOVS     R6,R0
//  125     eMDB_reply coin  = MDBCOIN_get_device();
          CFI FunCall MDBCOIN_get_device
        BL       MDBCOIN_get_device
        MOVS     R7,R0
//  126     eMDB_reply cashless = CASHLESS_adreess();
          CFI FunCall CASHLESS_adreess
        BL       CASHLESS_adreess
        MOV      R8,R0
//  127     
//  128     sprintf(buffer_linha,"BV:%01d CA:%01d CD:%01d",bill==MDB_OK?1:0,coin==MDB_OK?1:0,cashless==MDB_OK?1:0);    
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??MTMDB_verifica_dispositivos_7
        MOVS     R0,#+1
        B.N      ??MTMDB_verifica_dispositivos_8
??MTMDB_verifica_dispositivos_7:
        MOVS     R0,#+0
??MTMDB_verifica_dispositivos_8:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??MTMDB_verifica_dispositivos_9
        MOVS     R3,#+1
        B.N      ??MTMDB_verifica_dispositivos_10
??MTMDB_verifica_dispositivos_9:
        MOVS     R3,#+0
??MTMDB_verifica_dispositivos_10:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??MTMDB_verifica_dispositivos_11
        MOVS     R2,#+1
        B.N      ??MTMDB_verifica_dispositivos_12
??MTMDB_verifica_dispositivos_11:
        MOVS     R2,#+0
??MTMDB_verifica_dispositivos_12:
        STR      R0,[SP, #+0]
        LDR.N    R1,??DataTable4_4
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  129     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTMDB_verifica_dispositivos_0
//  130   }     
??MTMDB_verifica_dispositivos_6:
        ADD      SP,SP,#+24
          CFI CFA R13+24
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock1
//  131 }
//  132 /***********************************************************************************
//  133 *       Descrição       :       Função para pegar o valor adicionado ao
//  134 *                               noteiro MDB
//  135 *       Parametros      :       nenhum
//  136 *       Retorno         :       nenhum
//  137 ***********************************************************************************/
//  138 extern void SMDBILL_set_bloqueio(unsigned char bloqueio);

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MTMDB_teste_contagem_noteiro
        THUMB
//  139 void MTMDB_teste_contagem_noteiro(void){
MTMDB_teste_contagem_noteiro:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+20
          CFI CFA R13+40
//  140   eTECLA tecla;
//  141   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R5,R0
//  142   char buffer_linha[17];  
//  143   unsigned char flag=0;
        MOVS     R6,#+0
//  144   
//  145   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_bill_mdb[idioma],NULL);   
        MOVS     R2,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R0,??DataTable4_5
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  146   
//  147   for(;;){
//  148     
//  149     tecla = TECLADO_getch();
??MTMDB_teste_contagem_noteiro_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R4,R0
//  150     switch(tecla){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??MTMDB_teste_contagem_noteiro_1
        BCC.N    ??MTMDB_teste_contagem_noteiro_2
        CMP      R4,#+3
        BEQ.N    ??MTMDB_teste_contagem_noteiro_3
        BCC.N    ??MTMDB_teste_contagem_noteiro_4
        CMP      R4,#+4
        BNE.N    ??MTMDB_teste_contagem_noteiro_2
//  151       case TECLA_ENTER:
//  152            PAGAMENTOS_set_valores(0);
??MTMDB_teste_contagem_noteiro_5:
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_valores
        BL       PAGAMENTOS_set_valores
//  153            break;
        B.N      ??MTMDB_teste_contagem_noteiro_2
//  154       case TECLA_ESC:
//  155            return;
??MTMDB_teste_contagem_noteiro_1:
        B.N      ??MTMDB_teste_contagem_noteiro_6
//  156       case TECLA_INC:
//  157            flag = 1;
??MTMDB_teste_contagem_noteiro_4:
        MOVS     R0,#+1
        MOVS     R6,R0
//  158            SMDBILL_set_bloqueio(1);        
        MOVS     R0,#+1
          CFI FunCall SMDBILL_set_bloqueio
        BL       SMDBILL_set_bloqueio
//  159            break;
        B.N      ??MTMDB_teste_contagem_noteiro_2
//  160       case TECLA_DEC:
//  161            flag = 0;
??MTMDB_teste_contagem_noteiro_3:
        MOVS     R0,#+0
        MOVS     R6,R0
//  162            SMDBILL_set_bloqueio(0);        
        MOVS     R0,#+0
          CFI FunCall SMDBILL_set_bloqueio
        BL       SMDBILL_set_bloqueio
//  163            break;
//  164     }
//  165     
//  166     unsigned int valor = PAGAMENTOS_get_valor_acumulado();
??MTMDB_teste_contagem_noteiro_2:
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        MOVS     R7,R0
//  167     sprintf(buffer_linha,"%05d[%s]",valor,flag?" LOCK ":"UNLOCK");
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??MTMDB_teste_contagem_noteiro_7
        LDR.N    R3,??DataTable4_6
        B.N      ??MTMDB_teste_contagem_noteiro_8
??MTMDB_teste_contagem_noteiro_7:
        LDR.N    R3,??DataTable4_7
??MTMDB_teste_contagem_noteiro_8:
        MOVS     R2,R7
        LDR.N    R1,??DataTable4_8
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  168     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTMDB_teste_contagem_noteiro_0
//  169   }  
??MTMDB_teste_contagem_noteiro_6:
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock2
//  170 }
//  171 /***********************************************************************************
//  172 *       Descrição       :       Função para pegar o valor adicionar ao moedeiro
//  173 *                               MDB
//  174 *       Parametros      :       nenhum
//  175 *       Retorno         :       nenhum
//  176 ***********************************************************************************/
//  177 extern void SMDBCOIN_set_flag_bloqueio(unsigned char flag);

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MTMDB_teste_contagem_moedeiro
        THUMB
//  178 void MTMDB_teste_contagem_moedeiro(void){
MTMDB_teste_contagem_moedeiro:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+28
          CFI CFA R13+48
//  179   eTECLA tecla;
//  180   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R5,R0
//  181   char buffer_linha[17];  
//  182   unsigned char flag=0;
        MOVS     R6,#+0
//  183   
//  184   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_coin_mdb[idioma],NULL);   
        MOVS     R2,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R0,??DataTable4_9
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  185   PAGAMENTOS_set_valores(0);
        MOVS     R0,#+0
          CFI FunCall PAGAMENTOS_set_valores
        BL       PAGAMENTOS_set_valores
//  186   
//  187   for(;;){
//  188     
//  189     tecla = TECLADO_getch();
??MTMDB_teste_contagem_moedeiro_0:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R4,R0
//  190     switch(tecla){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??MTMDB_teste_contagem_moedeiro_1
        BCC.N    ??MTMDB_teste_contagem_moedeiro_2
        CMP      R4,#+3
        BEQ.N    ??MTMDB_teste_contagem_moedeiro_3
        BCC.N    ??MTMDB_teste_contagem_moedeiro_4
        CMP      R4,#+4
        BNE.N    ??MTMDB_teste_contagem_moedeiro_2
//  191       case TECLA_ENTER:
//  192            MTMDB_libera_troco();
??MTMDB_teste_contagem_moedeiro_5:
          CFI FunCall MTMDB_libera_troco
        BL       MTMDB_libera_troco
//  193            STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_coin_mdb[idioma],NULL);              
        MOVS     R2,#+0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R0,??DataTable4_9
        LDR      R1,[R0, R5, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  194            break;
        B.N      ??MTMDB_teste_contagem_moedeiro_2
//  195       case TECLA_ESC:
//  196            return;
??MTMDB_teste_contagem_moedeiro_1:
        B.N      ??MTMDB_teste_contagem_moedeiro_6
//  197       case TECLA_INC:
//  198            flag = 1;
??MTMDB_teste_contagem_moedeiro_4:
        MOVS     R0,#+1
        MOVS     R6,R0
//  199            SMDBCOIN_set_flag_bloqueio(1);        
        MOVS     R0,#+1
          CFI FunCall SMDBCOIN_set_flag_bloqueio
        BL       SMDBCOIN_set_flag_bloqueio
//  200            break;
        B.N      ??MTMDB_teste_contagem_moedeiro_2
//  201       case TECLA_DEC:
//  202            flag = 0;
??MTMDB_teste_contagem_moedeiro_3:
        MOVS     R0,#+0
        MOVS     R6,R0
//  203            SMDBCOIN_set_flag_bloqueio(0);        
        MOVS     R0,#+0
          CFI FunCall SMDBCOIN_set_flag_bloqueio
        BL       SMDBCOIN_set_flag_bloqueio
//  204            break;
//  205     }
//  206     
//  207     unsigned int valor = PAGAMENTOS_get_valor_acumulado();
??MTMDB_teste_contagem_moedeiro_2:
          CFI FunCall PAGAMENTOS_get_valor_acumulado
        BL       PAGAMENTOS_get_valor_acumulado
        MOVS     R7,R0
//  208     sprintf(buffer_linha,"%04d,%02d[%s]",valor/100,valor%100,flag?" LOCK ":"UNLOCK");
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??MTMDB_teste_contagem_moedeiro_7
        LDR.N    R0,??DataTable4_6
        B.N      ??MTMDB_teste_contagem_moedeiro_8
??MTMDB_teste_contagem_moedeiro_7:
        LDR.N    R0,??DataTable4_7
??MTMDB_teste_contagem_moedeiro_8:
        MOVS     R1,#+100
        STR      R0,[SP, #+0]
        UDIV     R0,R7,R1
        MLS      R3,R1,R0,R7
        MOVS     R0,#+100
        UDIV     R2,R7,R0
        LDR.N    R1,??DataTable4_10
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  209     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTMDB_teste_contagem_moedeiro_0
//  210   }   
??MTMDB_teste_contagem_moedeiro_6:
        ADD      SP,SP,#+28
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock3
//  211 }
//  212 /***********************************************************************************
//  213 *       Descrição       :       Tela para o usuário selecionar quantas moedas
//  214 *                               serão liberadas no troco
//  215 *       Parametros      :       nenhum
//  216 *       Retorno         :       nenhum
//  217 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MTMDB_libera_troco
        THUMB
//  218 void MTMDB_libera_troco(void){
MTMDB_libera_troco:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+24
          CFI CFA R13+40
//  219   BOARD_setter_general_purpose_counter(10000);
        MOVW     R0,#+10000
          CFI FunCall BOARD_setter_general_purpose_counter
        BL       BOARD_setter_general_purpose_counter
//  220   eTECLA tecla;  
//  221   unsigned char quantidade=1;
        MOVS     R5,#+1
//  222   char buffer_linha[17];
//  223   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R6,R0
//  224     
//  225   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_teste_coin_changer_mdb[idioma],NULL);     
        MOVS     R2,#+0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR.N    R0,??DataTable4_11
        LDR      R1,[R0, R6, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  226   for(;BOARD_getter_general_purpose_counter();){
??MTMDB_libera_troco_0:
          CFI FunCall BOARD_getter_general_purpose_counter
        BL       BOARD_getter_general_purpose_counter
        CMP      R0,#+0
        BEQ.N    ??MTMDB_libera_troco_1
//  227     
//  228     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R4,R0
//  229     switch(tecla){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??MTMDB_libera_troco_2
        BCC.N    ??MTMDB_libera_troco_3
        CMP      R4,#+3
        BEQ.N    ??MTMDB_libera_troco_4
        BCC.N    ??MTMDB_libera_troco_5
        CMP      R4,#+4
        BNE.N    ??MTMDB_libera_troco_3
//  230       case TECLA_ENTER:
//  231            MDB_coin_dispenser(2,quantidade);
??MTMDB_libera_troco_6:
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+2
          CFI FunCall MDB_coin_dispenser
        BL       MDB_coin_dispenser
//  232            break;
        B.N      ??MTMDB_libera_troco_3
//  233       case TECLA_ESC:
//  234            return;
??MTMDB_libera_troco_2:
        B.N      ??MTMDB_libera_troco_7
//  235       case TECLA_INC:
//  236             if(quantidade<16)
??MTMDB_libera_troco_5:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+16
        BGE.N    ??MTMDB_libera_troco_8
//  237               quantidade++;
        ADDS     R5,R5,#+1
//  238            break;
??MTMDB_libera_troco_8:
        B.N      ??MTMDB_libera_troco_3
//  239       case TECLA_DEC:
//  240            if(quantidade>1)
??MTMDB_libera_troco_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+2
        BLT.N    ??MTMDB_libera_troco_9
//  241              quantidade--;
        SUBS     R5,R5,#+1
//  242            break;
//  243     }        
//  244     
//  245     sprintf(buffer_linha,"Moedas:%02d",quantidade);
??MTMDB_libera_troco_9:
??MTMDB_libera_troco_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,R5
        LDR.N    R1,??DataTable4_12
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  246     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);    
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MTMDB_libera_troco_0
//  247   }  
//  248 }
??MTMDB_libera_troco_1:
??MTMDB_libera_troco_7:
        ADD      SP,SP,#+24
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     MTMDB_func

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     STRING_opcoes_menu_mdb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     STRING_titulo_menu_mdb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     STRING_titulo_teste_devices_mdb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     `?<Constant "BV:%01d CA:%01d CD:%01d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     STRING_titulo_teste_bill_mdb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     `?<Constant " LOCK ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     `?<Constant "UNLOCK">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     `?<Constant "%05d[%s]">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     STRING_titulo_teste_coin_mdb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     `?<Constant "%04d,%02d[%s]">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     STRING_titulo_teste_coin_changer_mdb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     `?<Constant "Moedas:%02d">`
//  249 /***********************************************************************************
//  250 *       Descrição       :       Função para pegar o valor adicionar ao cartão
//  251 *       Parametros      :       nenhum
//  252 *       Retorno         :       nenhum
//  253 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MTMDB_test_contagem_cartao
          CFI NoCalls
        THUMB
//  254 void MTMDB_test_contagem_cartao(void){
//  255   
//  256   
//  257 }
MTMDB_test_contagem_cartao:
        BX       LR               ;; return
          CFI EndBlock cfiBlock5

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  258 /***********************************************************************************
//  259 *       Fim do arquivo
//  260 ***********************************************************************************/
// 
// 100 bytes in section .rodata
// 662 bytes in section .text
// 
// 662 bytes of CODE  memory
// 100 bytes of CONST memory
//
//Errors: none
//Warnings: none
