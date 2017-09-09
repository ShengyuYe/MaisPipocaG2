///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     09/Sep/2017  16:47:39 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_op /
//                    eracao.c                                                /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_op /
//                    eracao.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\Debu /
//                    g\List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Debug /
//                    \List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\O /
//                    bj\ --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\menu_o /
//                    peracao.s                                               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_operacao

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", "flags,widths"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN APLICACAO_carrega_idioma
        EXTERN EMBALAGEM_libera_pacote
        EXTERN FTP_novo_preco
        EXTERN MDB_checa_valor_moedas
        EXTERN MEF_entry
        EXTERN MEI_entry_inc
        EXTERN MEL_entry
        EXTERN MENUROLAGEM_show
        EXTERN PARAMETROS_grava
        EXTERN PARAMETROS_le
        EXTERN STRING_mensagem_configura_fita_led
        EXTERN STRING_mensagem_configura_free
        EXTERN STRING_menu_configuracao_operacao
        EXTERN STRING_simbolo_moeda
        EXTERN STRING_tabela_cedulas_canais
        EXTERN STRING_titulo_ajusta_valor
        EXTERN STRING_titulo_configura_troco
        EXTERN STRING_titulo_configuracao_notas
        EXTERN STRING_titulo_edita_comissao
        EXTERN STRING_titulo_edita_flag_desumidifcador
        EXTERN STRING_titulo_menu_edita_volume_musica
        EXTERN STRING_titulo_menu_edita_volume_voz
        EXTERN STRING_titulo_menu_intervalo_prop
        EXTERN STRING_titulo_menu_operacao
        EXTERN STRING_write_to_internal
        EXTERN TECLADO_getContadorInatividade
        EXTERN TECLADO_getch
        EXTERN __aeabi_memclr4
        EXTERN __aeabi_memcpy
        EXTERN sprintf
        EXTERN strlen
        EXTERN vTaskDelay

        PUBLIC MENUOP_configura_canais_moeda
        PUBLIC MENUOP_configura_comissao
        PUBLIC MENUOP_configura_fita_led
        PUBLIC MENUOP_configura_flag_desumidificador
        PUBLIC MENUOP_configura_intervalo_propaganda
        PUBLIC MENUOP_configura_mensagem_cliente
        PUBLIC MENUOP_configura_mensagem_cliente_02
        PUBLIC MENUOP_configura_mensagem_cliente_03
        PUBLIC MENUOP_configura_mensagem_cliente_04
        PUBLIC MENUOP_configura_modo_free
        PUBLIC MENUOP_configura_notas
        PUBLIC MENUOP_configura_tempo_embalagem
        PUBLIC MENUOP_configura_troco
        PUBLIC MENUOP_configura_valor
        PUBLIC MENUOP_configura_volume_locucoes
        PUBLIC MENUOP_configura_volume_musica
        PUBLIC MENUOP_edita_mensagem
        PUBLIC MENUOP_entry
        PUBLIC MENUOP_funcs
        PUBLIC MENUOP_testa_liberacao_embalagem
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\menu_operacao.c
//    1  /*__________________________________________________________________________________
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
//   17 |       Arquivo            :  menu_operacao.c
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

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP memcpy
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function memcpy
        THUMB
// __intrinsic __nounwind __interwork __softfp void *memcpy(void *, void const *, size_t)
memcpy:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock0
//   34 #include "..\includes.h"
//   35 #include "menu_operacao.h"
//   36 #include "menu_rolagem.h"
//   37 #include "menu_edita_listagem.h"
//   38 #include "menu_edita_inteiro.h"
//   39 #include "menu_edita_flag.h"
//   40 
//   41 /***********************************************************************************
//   42 *       Definições - locais
//   43 ***********************************************************************************/
//   44 
//   45 
//   46 /***********************************************************************************
//   47 *       Variaveis - locais
//   48 ***********************************************************************************/
//   49 
//   50 
//   51 /***********************************************************************************
//   52 *       Funções - locais
//   53 ***********************************************************************************/
//   54 void MENUOP_configura_valor(void);
//   55 void MENUOP_configura_notas(void);
//   56 void MENUOP_configura_tempo_embalagem(void);
//   57 void MENUOP_configura_volume_musica(void);
//   58 void MENUOP_configura_volume_locucoes(void);
//   59 void MENUOP_configura_intervalo_propaganda(void);
//   60 void MENUOP_configura_modo_free(void);
//   61 void MENUOP_configura_fita_led(void);
//   62 void MENUOP_configura_troco(void);
//   63 void MENUOP_configura_comissao(void);
//   64 void MENUOP_configura_flag_desumidificador(void);
//   65 unsigned char MENUOP_edita_mensagem(char *titulo,char* msg);
//   66 void MENUOP_configura_mensagem_cliente(void);
//   67 void MENUOP_configura_mensagem_cliente_02(void);
//   68 void MENUOP_configura_mensagem_cliente_03(void);
//   69 void MENUOP_configura_mensagem_cliente_04(void);
//   70 void MENUOP_configura_canais_moeda(void);
//   71 
//   72 /***********************************************************************************
//   73 *       Tabela de funções
//   74 ***********************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   75 void(*MENUOP_funcs[])(void)={
MENUOP_funcs:
        DATA
        DC32 MENUOP_configura_valor, MENUOP_configura_notas
        DC32 MENUOP_configura_canais_moeda, MENUOP_configura_modo_free
        DC32 MENUOP_configura_fita_led, MENUOP_configura_volume_musica
        DC32 MENUOP_configura_volume_locucoes
        DC32 MENUOP_configura_intervalo_propaganda
        DC32 MENUOP_configura_tempo_embalagem, MENUOP_configura_troco
        DC32 MENUOP_configura_comissao, MENUOP_configura_mensagem_cliente
        DC32 MENUOP_configura_mensagem_cliente_02
        DC32 MENUOP_configura_mensagem_cliente_03
        DC32 MENUOP_configura_mensagem_cliente_04
        DC32 MENUOP_configura_flag_desumidificador, 0H
//   76   MENUOP_configura_valor,
//   77   MENUOP_configura_notas,
//   78   MENUOP_configura_canais_moeda,
//   79   MENUOP_configura_modo_free,
//   80   MENUOP_configura_fita_led,
//   81   MENUOP_configura_volume_musica,
//   82   MENUOP_configura_volume_locucoes,
//   83   MENUOP_configura_intervalo_propaganda,
//   84   MENUOP_configura_tempo_embalagem,
//   85   MENUOP_configura_troco,
//   86   MENUOP_configura_comissao,
//   87   MENUOP_configura_mensagem_cliente,
//   88   MENUOP_configura_mensagem_cliente_02,
//   89   MENUOP_configura_mensagem_cliente_03,
//   90   MENUOP_configura_mensagem_cliente_04,
//   91   MENUOP_configura_flag_desumidificador,
//   92   NULL  
//   93 };
//   94 
//   95 /***********************************************************************************
//   96 *       Implementação das funções
//   97 ***********************************************************************************/
//   98 
//   99 /***********************************************************************************
//  100 *       Descrição       :       Ponto de entrada do menu de configuração
//  101 *                               do sistema
//  102 *       Parametros      :       nenhum
//  103 *       Retorno         :       nenhum
//  104 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MENUOP_entry
        THUMB
//  105 void MENUOP_entry(void){
MENUOP_entry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  106   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  107   
//  108   MENUROLAGEM_show((char*)STRING_titulo_menu_operacao[idioma],
//  109                    (char**)STRING_menu_configuracao_operacao[idioma],
//  110                    QTD_OPCOES_OPERACAO,
//  111                    MENUOP_funcs);    
        LDR.W    R3,??DataTable17
        MOVS     R2,#+17
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+68
        LDR.W    R1,??DataTable17_1
        MLA      R1,R0,R4,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable17_2
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MENUROLAGEM_show
        BL       MENUROLAGEM_show
//  112 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  113 /***********************************************************************************
//  114 *       Descrição       :       Menu para configuração do valor da pipoca
//  115 *       Parametros      :       nenhum
//  116 *       Retorno         :       nenhum
//  117 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MENUOP_configura_valor
        THUMB
//  118 void MENUOP_configura_valor(void){
MENUOP_configura_valor:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        SUB      SP,SP,#+32
          CFI CFA R13+56
//  119   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  120   unsigned int valor;
//  121   char buffer_linha[17];
//  122   eTECLA tecla;
//  123   unsigned char tamanho=0;
        MOVS     R6,#+0
//  124   unsigned char ultimo_tamanho=0;
        MOVS     R7,#+0
//  125   unsigned int valor_anterior;
//  126   
//  127   PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valor);
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  128   if(valor>99990)
        LDR      R0,[SP, #+4]
        LDR.W    R1,??DataTable17_3  ;; 0x18697
        CMP      R0,R1
        BCC.N    ??MENUOP_configura_valor_0
//  129     valor = 5;
        MOVS     R0,#+5
        STR      R0,[SP, #+4]
//  130   
//  131   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_ajusta_valor[idioma],NULL);
??MENUOP_configura_valor_0:
        MOVS     R2,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable17_4
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  132   
//  133   valor_anterior = valor;
        LDR      R0,[SP, #+4]
        MOV      R8,R0
//  134   
//  135   for(;TECLADO_getContadorInatividade();){
??MENUOP_configura_valor_1:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??MENUOP_configura_valor_2
//  136   
//  137     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R5,R0
//  138     switch(tecla){
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BEQ.N    ??MENUOP_configura_valor_3
        BCC.N    ??MENUOP_configura_valor_4
        CMP      R5,#+3
        BEQ.N    ??MENUOP_configura_valor_5
        BCC.N    ??MENUOP_configura_valor_6
        CMP      R5,#+4
        BNE.N    ??MENUOP_configura_valor_4
//  139       case TECLA_ENTER:
//  140            PARAMETROS_grava(ADR_VALOR_PIPOCA,(void*)&valor);        
??MENUOP_configura_valor_7:
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  141            // Novo evento de troca
//  142            // de preço
//  143            if(valor_anterior!=valor)
        LDR      R0,[SP, #+4]
        CMP      R8,R0
        BEQ.N    ??MENUOP_configura_valor_3
//  144              FTP_novo_preco(valor,valor_anterior);           
        MOV      R1,R8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR      R0,[SP, #+4]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall FTP_novo_preco
        BL       FTP_novo_preco
//  145       case TECLA_ESC:
//  146            return;
??MENUOP_configura_valor_3:
        B.N      ??MENUOP_configura_valor_8
//  147       case TECLA_INC:
//  148            if(valor<99990)
??MENUOP_configura_valor_6:
        LDR      R0,[SP, #+4]
        LDR.W    R1,??DataTable17_5  ;; 0x18696
        CMP      R0,R1
        BCS.N    ??MENUOP_configura_valor_9
//  149              valor+=5;
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+5
        STR      R0,[SP, #+4]
//  150            break;
??MENUOP_configura_valor_9:
        B.N      ??MENUOP_configura_valor_4
//  151       case TECLA_DEC:
//  152            if(valor>5)
??MENUOP_configura_valor_5:
        LDR      R0,[SP, #+4]
        CMP      R0,#+6
        BCC.N    ??MENUOP_configura_valor_10
//  153              valor-=5;
        LDR      R0,[SP, #+4]
        SUBS     R0,R0,#+5
        STR      R0,[SP, #+4]
//  154            break;
//  155     }
//  156     
//  157     sprintf(buffer_linha,"%s %d,%02d",(char*)STRING_simbolo_moeda[idioma],valor/100,valor%100);
??MENUOP_configura_valor_10:
??MENUOP_configura_valor_4:
        LDR      R0,[SP, #+4]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+4]
        MOVS     R1,#+100
        UDIV     R3,R0,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable17_6
        LDR      R2,[R0, R4, LSL #+2]
        LDR.W    R1,??DataTable17_7
        ADD      R0,SP,#+8
          CFI FunCall sprintf
        BL       sprintf
//  158     tamanho = strlen(buffer_linha);
        ADD      R0,SP,#+8
          CFI FunCall strlen
        BL       strlen
        MOVS     R6,R0
//  159     if(tamanho!=ultimo_tamanho){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R6,R7
        BEQ.N    ??MENUOP_configura_valor_11
//  160       STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_ajusta_valor[idioma],buffer_linha);    
        ADD      R2,SP,#+8
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable17_4
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  161       ultimo_tamanho = tamanho;
        MOVS     R7,R6
        B.N      ??MENUOP_configura_valor_1
//  162     }
//  163     else
//  164       STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);    
??MENUOP_configura_valor_11:
        ADD      R2,SP,#+8
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MENUOP_configura_valor_1
//  165   }  
//  166 }
??MENUOP_configura_valor_2:
??MENUOP_configura_valor_8:
        ADD      SP,SP,#+32
          CFI CFA R13+24
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock2
//  167 /***********************************************************************************
//  168 *       Descrição       :       Configura as cédulas que serão aceitas
//  169 *                               pelo meio de pagamento, quando serial ou CCTALK
//  170 *       Parametros      :       nenhum
//  171 *       Retorno         :       nenhum
//  172 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MENUOP_configura_notas
        THUMB
//  173 void MENUOP_configura_notas(void){
MENUOP_configura_notas:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+16
          CFI CFA R13+24
//  174   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  175   unsigned char flags[6]={0};
        ADD      R0,SP,#+4
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
//  176   unsigned char cedulas;
//  177   
//  178   PARAMETROS_le(ADR_NOTAS,(void*)&cedulas);
        ADD      R1,SP,#+0
        MOVS     R0,#+2
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  179   for(unsigned char i=0;i<6;i++)
        MOVS     R0,#+0
??MENUOP_configura_notas_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BGE.N    ??MENUOP_configura_notas_1
//  180     if(cedulas&(0x01<<i))
        LDRB     R1,[SP, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        TST      R1,R2
        BEQ.N    ??MENUOP_configura_notas_2
//  181       flags[i] = 255;  
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+4
        MOVS     R2,#+255
        STRB     R2,[R0, R1]
??MENUOP_configura_notas_2:
        ADDS     R0,R0,#+1
        B.N      ??MENUOP_configura_notas_0
//  182   
//  183   MEL_entry((char*)STRING_titulo_configuracao_notas[idioma],
//  184             (char**)STRING_tabela_cedulas_canais[idioma],
//  185             flags,
//  186             6);
??MENUOP_configura_notas_1:
        MOVS     R3,#+6
        ADD      R2,SP,#+4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+24
        LDR.W    R1,??DataTable17_8
        MLA      R1,R0,R4,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable17_9
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEL_entry
        BL       MEL_entry
//  187   
//  188   cedulas = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  189   for(unsigned char i=0;i<6;i++)
        MOVS     R0,#+0
??MENUOP_configura_notas_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BGE.N    ??MENUOP_configura_notas_4
//  190     if(flags[i])
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+4
        LDRB     R1,[R0, R1]
        CMP      R1,#+0
        BEQ.N    ??MENUOP_configura_notas_5
//  191       cedulas|= (0x01)<<i;
        LDRB     R1,[SP, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        ORRS     R1,R2,R1
        STRB     R1,[SP, #+0]
??MENUOP_configura_notas_5:
        ADDS     R0,R0,#+1
        B.N      ??MENUOP_configura_notas_3
//  192   
//  193   PARAMETROS_grava(ADR_NOTAS,(void*)&cedulas);     
??MENUOP_configura_notas_4:
        ADD      R1,SP,#+0
        MOVS     R0,#+2
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  194 }
        POP      {R0-R4,PC}       ;; return
          CFI EndBlock cfiBlock3
//  195 /***********************************************************************************
//  196 *       Descrição       :       Tela que faz o teste da liberação de uma embalagem
//  197 *       Parametros      :       nenhum
//  198 *       Retorno         :       nenhum
//  199 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MENUOP_testa_liberacao_embalagem
        THUMB
//  200 void MENUOP_testa_liberacao_embalagem(unsigned int tempo){
MENUOP_testa_liberacao_embalagem:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  201   
//  202   STRING_write_to_internal(CLEAR_DISPLAY,"Liberando","Embalagem");  
        LDR.W    R2,??DataTable17_10
        LDR.W    R1,??DataTable17_11
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  203   EMBALAGEM_libera_pacote(tempo);    
        MOVS     R0,R4
          CFI FunCall EMBALAGEM_libera_pacote
        BL       EMBALAGEM_libera_pacote
//  204 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4
//  205 /***********************************************************************************
//  206 *       Descrição       :       Faz o ajuste do intervalo de tempo em que
//  207 *                               o motor da embalagem fica ligado
//  208 *       Parametros      :       nenhum
//  209 *       Retorno         :       nenhum
//  210 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MENUOP_configura_tempo_embalagem
        THUMB
//  211 void MENUOP_configura_tempo_embalagem(void){
MENUOP_configura_tempo_embalagem:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
//  212   unsigned int tempo_embalagem;
//  213   eTECLA tecla;
//  214   char buffer_linha[17];
//  215   
//  216   PARAMETROS_le(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+28
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  217   if(tempo_embalagem>10000)
        LDR      R0,[SP, #+0]
        MOVW     R1,#+10001
        CMP      R0,R1
        BCC.N    ??MENUOP_configura_tempo_embalagem_0
//  218     tempo_embalagem = 500;
        MOV      R0,#+500
        STR      R0,[SP, #+0]
//  219   
//  220   STRING_write_to_internal(CLEAR_DISPLAY,"T. Motor Emb.",NULL);
??MENUOP_configura_tempo_embalagem_0:
        MOVS     R2,#+0
        LDR.W    R1,??DataTable17_12
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  221   
//  222   for(;;){
//  223     tecla = TECLADO_getch();
??MENUOP_configura_tempo_embalagem_1:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R4,R0
//  224     
//  225     switch(tecla){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??MENUOP_configura_tempo_embalagem_2
        BCC.N    ??MENUOP_configura_tempo_embalagem_3
        CMP      R4,#+3
        BEQ.N    ??MENUOP_configura_tempo_embalagem_4
        BCC.N    ??MENUOP_configura_tempo_embalagem_5
        CMP      R4,#+4
        BNE.N    ??MENUOP_configura_tempo_embalagem_3
//  226       case TECLA_ENTER:
//  227            MENUOP_testa_liberacao_embalagem(tempo_embalagem);
??MENUOP_configura_tempo_embalagem_6:
        LDR      R0,[SP, #+0]
          CFI FunCall MENUOP_testa_liberacao_embalagem
        BL       MENUOP_testa_liberacao_embalagem
//  228            STRING_write_to_internal(CLEAR_DISPLAY,"T. Motor Emb.",NULL);           
        MOVS     R2,#+0
        LDR.W    R1,??DataTable17_12
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  229            break;
        B.N      ??MENUOP_configura_tempo_embalagem_3
//  230       case TECLA_ESC:
//  231            STRING_write_to_internal(CLEAR_DISPLAY,"Salvando","na FLASH");
??MENUOP_configura_tempo_embalagem_2:
        LDR.W    R2,??DataTable17_13
        LDR.W    R1,??DataTable17_14
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  232            PARAMETROS_grava(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+28
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  233            vTaskDelay(3000);
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  234            return;
        B.N      ??MENUOP_configura_tempo_embalagem_7
//  235       case TECLA_INC:
//  236            if(tempo_embalagem<10000)
??MENUOP_configura_tempo_embalagem_5:
        LDR      R0,[SP, #+0]
        MOVW     R1,#+10000
        CMP      R0,R1
        BCS.N    ??MENUOP_configura_tempo_embalagem_8
//  237              tempo_embalagem+=100;
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+100
        STR      R0,[SP, #+0]
//  238            break;
??MENUOP_configura_tempo_embalagem_8:
        B.N      ??MENUOP_configura_tempo_embalagem_3
//  239       case TECLA_DEC:
//  240            if(tempo_embalagem>500)
??MENUOP_configura_tempo_embalagem_4:
        LDR      R0,[SP, #+0]
        CMP      R0,#+500
        BLS.N    ??MENUOP_configura_tempo_embalagem_9
//  241              tempo_embalagem-=100;
        LDR      R0,[SP, #+0]
        SUBS     R0,R0,#+100
        STR      R0,[SP, #+0]
//  242            break;
//  243     }
//  244         
//  245     sprintf(buffer_linha,"%05d ms",tempo_embalagem);
??MENUOP_configura_tempo_embalagem_9:
??MENUOP_configura_tempo_embalagem_3:
        LDR      R2,[SP, #+0]
        LDR.W    R1,??DataTable17_15
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  246     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MENUOP_configura_tempo_embalagem_1
//  247   }
??MENUOP_configura_tempo_embalagem_7:
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
//  248   /*
//  249   unsigned int tempo_embalagem;
//  250   unsigned char idioma;
//  251   
//  252   PARAMETROS_le(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);
//  253   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
//  254   
//  255   if(tempo_embalagem>10000)
//  256     tempo_embalagem = 100;
//  257   
//  258   tempo_embalagem = MEI_entry_inc((char*)STRING_mensagem_edita_tempo_embalagem[idioma],
//  259                                   "%05d ms",
//  260                                   tempo_embalagem,
//  261                                   100,
//  262                                   10000,
//  263                                   100);
//  264   
//  265   PARAMETROS_grava(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);  
//  266   */
//  267 }
//  268 /***********************************************************************************
//  269 *       Descrição       :       Configura o volume utilizado pela música
//  270 *       Parametros      :       nenhum
//  271 *       Retorno         :       nenhum
//  272 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MENUOP_configura_volume_musica
        THUMB
//  273 void MENUOP_configura_volume_musica(void){
MENUOP_configura_volume_musica:
        PUSH     {R0-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+24
//  274   unsigned int volume;
//  275   unsigned char idioma;  
//  276   
//  277   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
        ADD      R1,SP,#+8
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  278   PARAMETROS_le(ADR_VOLUME_MUSICA,(void*)&volume);
        ADD      R1,SP,#+12
        MOVS     R0,#+29
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  279   
//  280   if(volume>100)
        LDR      R0,[SP, #+12]
        CMP      R0,#+101
        BCC.N    ??MENUOP_configura_volume_musica_0
//  281     volume = 100;
        MOVS     R0,#+100
        STR      R0,[SP, #+12]
//  282   
//  283   volume = MEI_entry_inc((char*)STRING_titulo_menu_edita_volume_musica[idioma],
//  284                          "%03d",
//  285                          volume,
//  286                          1,
//  287                          100,
//  288                          1);
??MENUOP_configura_volume_musica_0:
        MOVS     R0,#+1
        STR      R0,[SP, #+4]
        MOVS     R0,#+100
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        LDR      R2,[SP, #+12]
        LDR.W    R1,??DataTable17_16
        LDRB     R0,[SP, #+8]
        LDR.W    R4,??DataTable17_17
        LDR      R0,[R4, R0, LSL #+2]
          CFI FunCall MEI_entry_inc
        BL       MEI_entry_inc
        STR      R0,[SP, #+12]
//  289   PARAMETROS_grava(ADR_VOLUME_MUSICA,(void*)&volume);    
        ADD      R1,SP,#+12
        MOVS     R0,#+29
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  290 }
        POP      {R0-R4,PC}       ;; return
          CFI EndBlock cfiBlock6
//  291 /***********************************************************************************
//  292 *       Descrição       :       Confiura o volume das locuções
//  293 *       Parametros      :       nenhum
//  294 *       Retorno         :       nenhum
//  295 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function MENUOP_configura_volume_locucoes
        THUMB
//  296 void MENUOP_configura_volume_locucoes(void){
MENUOP_configura_volume_locucoes:
        PUSH     {R0-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+24
//  297   unsigned int volume;
//  298   unsigned char idioma;  
//  299   
//  300   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
        ADD      R1,SP,#+8
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  301   PARAMETROS_le(ADR_VOLUME_VOZ,(void*)&volume);
        ADD      R1,SP,#+12
        MOVS     R0,#+30
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  302   
//  303   if(volume>100)
        LDR      R0,[SP, #+12]
        CMP      R0,#+101
        BCC.N    ??MENUOP_configura_volume_locucoes_0
//  304     volume = 100;
        MOVS     R0,#+100
        STR      R0,[SP, #+12]
//  305   
//  306   volume = MEI_entry_inc((char*)STRING_titulo_menu_edita_volume_voz[idioma],
//  307                          "%03d",
//  308                          volume,
//  309                          1,
//  310                          100,
//  311                          1);
??MENUOP_configura_volume_locucoes_0:
        MOVS     R0,#+1
        STR      R0,[SP, #+4]
        MOVS     R0,#+100
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        LDR      R2,[SP, #+12]
        LDR.W    R1,??DataTable17_16
        LDRB     R0,[SP, #+8]
        LDR.W    R4,??DataTable17_18
        LDR      R0,[R4, R0, LSL #+2]
          CFI FunCall MEI_entry_inc
        BL       MEI_entry_inc
        STR      R0,[SP, #+12]
//  312   PARAMETROS_grava(ADR_VOLUME_VOZ,(void*)&volume);  
        ADD      R1,SP,#+12
        MOVS     R0,#+30
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  313 }
        POP      {R0-R4,PC}       ;; return
          CFI EndBlock cfiBlock7
//  314 /***********************************************************************************
//  315 *       Descrição       :       Configura o intervalo para a propaganda
//  316 *       Parametros      :       nenhum
//  317 *       Retorno         :       nenhum
//  318 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function MENUOP_configura_intervalo_propaganda
        THUMB
//  319 void MENUOP_configura_intervalo_propaganda(void){
MENUOP_configura_intervalo_propaganda:
        PUSH     {R0-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+24
//  320   unsigned char idioma;
//  321   unsigned int intervalo;
//  322   
//  323   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
        ADD      R1,SP,#+8
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  324   PARAMETROS_le(ADR_INTERVALO_TEMPO_PROP,(void*)&intervalo);
        ADD      R1,SP,#+12
        MOVS     R0,#+31
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  325   
//  326   if(intervalo>60)
        LDR      R0,[SP, #+12]
        CMP      R0,#+61
        BCC.N    ??MENUOP_configura_intervalo_propaganda_0
//  327     intervalo = 60;
        MOVS     R0,#+60
        STR      R0,[SP, #+12]
//  328   
//  329   intervalo = MEI_entry_inc((char*)STRING_titulo_menu_intervalo_prop[idioma],
//  330                             "%02d min",
//  331                              intervalo,
//  332                              10,
//  333                              60,
//  334                              10);  
??MENUOP_configura_intervalo_propaganda_0:
        MOVS     R0,#+10
        STR      R0,[SP, #+4]
        MOVS     R0,#+60
        STR      R0,[SP, #+0]
        MOVS     R3,#+10
        LDR      R2,[SP, #+12]
        LDR.W    R1,??DataTable17_19
        LDRB     R0,[SP, #+8]
        LDR.W    R4,??DataTable17_20
        LDR      R0,[R4, R0, LSL #+2]
          CFI FunCall MEI_entry_inc
        BL       MEI_entry_inc
        STR      R0,[SP, #+12]
//  335   
//  336   PARAMETROS_grava(ADR_INTERVALO_TEMPO_PROP,(void*)&intervalo);    
        ADD      R1,SP,#+12
        MOVS     R0,#+31
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  337 }
        POP      {R0-R4,PC}       ;; return
          CFI EndBlock cfiBlock8
//  338 /***********************************************************************************
//  339 *       Descrição       :       Tela para configuração do modo free
//  340 *       Parametros      :       nenhum
//  341 *       Retorno         :       nenhum
//  342 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function MENUOP_configura_modo_free
        THUMB
//  343 void MENUOP_configura_modo_free(void){
MENUOP_configura_modo_free:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  344   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  345   unsigned char flag;
//  346   
//  347   PARAMETROS_le(ADR_FLAG_FREE,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  348   
//  349   flag = MEF_entry((char*)STRING_mensagem_configura_free[idioma],flag,"ON ","OFF");    
        ADR.N    R3,??DataTable16  ;; "OFF"
        ADR.N    R2,??DataTable16_1  ;; "ON "
        LDRB     R1,[SP, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable17_21
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEF_entry
        BL       MEF_entry
        STRB     R0,[SP, #+0]
//  350   
//  351   PARAMETROS_grava(ADR_FLAG_FREE,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  352 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock9
//  353 /***********************************************************************************
//  354 *       Descrição       :       Tela para configuração do uso da fita-led
//  355 *                               durante a espera da máquina
//  356 *       Parametros      :       nenhum
//  357 *       Retorno         :       nenhum
//  358 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function MENUOP_configura_fita_led
        THUMB
//  359 void MENUOP_configura_fita_led(void){
MENUOP_configura_fita_led:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  360   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  361   unsigned char flag;
//  362   
//  363   PARAMETROS_le(ADR_FLAG_FITA_LED,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+33
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  364   
//  365   flag = MEF_entry((char*)STRING_mensagem_configura_fita_led[idioma],flag,"ON ","OFF");    
        ADR.N    R3,??DataTable16  ;; "OFF"
        ADR.N    R2,??DataTable16_1  ;; "ON "
        LDRB     R1,[SP, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable17_22
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEF_entry
        BL       MEF_entry
        STRB     R0,[SP, #+0]
//  366   
//  367   PARAMETROS_grava(ADR_FLAG_FITA_LED,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+33
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  368 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock10
//  369 /***********************************************************************************
//  370 *       Descrição       :       Tela para configuração do uso de troco
//  371 *                               pela máquina
//  372 *       Parametros      :       nenhum
//  373 *       Retorno         :       nenhum
//  374 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function MENUOP_configura_troco
        THUMB
//  375 void MENUOP_configura_troco(void){
MENUOP_configura_troco:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  376   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  377   unsigned char flag;
//  378   
//  379   PARAMETROS_le(ADR_FLAG_TROCO,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  380   
//  381   flag = MEF_entry((char*)STRING_titulo_configura_troco[idioma],flag,"ON ","OFF");    
        ADR.N    R3,??DataTable16  ;; "OFF"
        ADR.N    R2,??DataTable16_1  ;; "ON "
        LDRB     R1,[SP, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable17_23
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEF_entry
        BL       MEF_entry
        STRB     R0,[SP, #+0]
//  382   
//  383   PARAMETROS_grava(ADR_FLAG_TROCO,(void*)&flag);         
        ADD      R1,SP,#+0
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  384 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock11
//  385 /***********************************************************************************
//  386 *       Descrição       :       Tela para configurar a comissão do ponto
//  387 *       Parametros      :       nenhum
//  388 *       Retorno         :       nenhum
//  389 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function MENUOP_configura_comissao
        THUMB
//  390 void MENUOP_configura_comissao(void){
MENUOP_configura_comissao:
        PUSH     {R0-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+24
//  391   unsigned int comissao;
//  392   unsigned char idioma;
//  393   
//  394   PARAMETROS_le(ADR_COMISSAO_PONTO,(void*)&comissao);
        ADD      R1,SP,#+12
        MOVS     R0,#+37
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  395   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
        ADD      R1,SP,#+8
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  396   
//  397   if(comissao>100)
        LDR      R0,[SP, #+12]
        CMP      R0,#+101
        BCC.N    ??MENUOP_configura_comissao_0
//  398     comissao = 20;
        MOVS     R0,#+20
        STR      R0,[SP, #+12]
//  399   
//  400   comissao = MEI_entry_inc((char*)STRING_titulo_edita_comissao[idioma],
//  401                            "%03d %%",
//  402                             comissao,
//  403                             1,
//  404                             100,
//  405                             1);
??MENUOP_configura_comissao_0:
        MOVS     R0,#+1
        STR      R0,[SP, #+4]
        MOVS     R0,#+100
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        LDR      R2,[SP, #+12]
        LDR.N    R1,??DataTable17_24
        LDRB     R0,[SP, #+8]
        LDR.N    R4,??DataTable17_25
        LDR      R0,[R4, R0, LSL #+2]
          CFI FunCall MEI_entry_inc
        BL       MEI_entry_inc
        STR      R0,[SP, #+12]
//  406   
//  407   PARAMETROS_grava(ADR_COMISSAO_PONTO,(void*)&comissao);  
        ADD      R1,SP,#+12
        MOVS     R0,#+37
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  408 }
        POP      {R0-R4,PC}       ;; return
          CFI EndBlock cfiBlock12
//  409 /***********************************************************************************
//  410 *       Descrição       :       Tela para configurar a mensagem de cliente
//  411 *       Parametros      :       nenhum
//  412 *       Retorno         :       nenhum
//  413 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function MENUOP_configura_mensagem_cliente
        THUMB
//  414 void MENUOP_configura_mensagem_cliente(void){
MENUOP_configura_mensagem_cliente:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  415   char buffer_mensagem[17];
//  416   
//  417   PARAMETROS_le(ADR_MENSAGEM_CLIENTE_01,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+60
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  418   if(MENUOP_edita_mensagem("MSG CLIENTE 01",buffer_mensagem)){
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable17_26
          CFI FunCall MENUOP_edita_mensagem
        BL       MENUOP_edita_mensagem
        CMP      R0,#+0
        BEQ.N    ??MENUOP_configura_mensagem_cliente_0
//  419     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_01,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+60
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  420   }
//  421 }
??MENUOP_configura_mensagem_cliente_0:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock13
//  422 /***********************************************************************************
//  423 *       Descrição       :       Tela para configurar a mensagem do cliente
//  424 *                               de número 02
//  425 *       Parametros      :       nenhum
//  426 *       Retorno         :       nenhum
//  427 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function MENUOP_configura_mensagem_cliente_02
        THUMB
//  428 void MENUOP_configura_mensagem_cliente_02(void){
MENUOP_configura_mensagem_cliente_02:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  429   char buffer_mensagem[17];
//  430   
//  431   PARAMETROS_le(ADR_MENSAGEM_CLIENTE_02,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+61
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  432   if(MENUOP_edita_mensagem("MSG CLIENTE 02",buffer_mensagem)){
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable17_27
          CFI FunCall MENUOP_edita_mensagem
        BL       MENUOP_edita_mensagem
        CMP      R0,#+0
        BEQ.N    ??MENUOP_configura_mensagem_cliente_02_0
//  433     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_02,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+61
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  434   }
//  435 }
??MENUOP_configura_mensagem_cliente_02_0:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock14
//  436 /***********************************************************************************
//  437 *       Descrição       :       Tela para configurar a mensagem do cliente
//  438 *                               de número 03
//  439 *       Parametros      :       nenhum
//  440 *       Retorno         :       nenhum
//  441 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function MENUOP_configura_mensagem_cliente_03
        THUMB
//  442 void MENUOP_configura_mensagem_cliente_03(void){
MENUOP_configura_mensagem_cliente_03:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  443   char buffer_mensagem[17];
//  444   
//  445   PARAMETROS_le(ADR_MENSAGEM_CLIENTE_03,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+62
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  446   if(MENUOP_edita_mensagem("MSG CLIENTE 03",buffer_mensagem)){
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable17_28
          CFI FunCall MENUOP_edita_mensagem
        BL       MENUOP_edita_mensagem
        CMP      R0,#+0
        BEQ.N    ??MENUOP_configura_mensagem_cliente_03_0
//  447     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_03,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+62
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  448   }
//  449 }
??MENUOP_configura_mensagem_cliente_03_0:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock15
//  450 /***********************************************************************************
//  451 *       Descrição       :       Tela para configurar a mensagem do cliente
//  452 *                               de número 04
//  453 *       Parametros      :       nenhum
//  454 *       Retorno         :       nenhum
//  455 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function MENUOP_configura_mensagem_cliente_04
        THUMB
//  456 void MENUOP_configura_mensagem_cliente_04(void){
MENUOP_configura_mensagem_cliente_04:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  457   char buffer_mensagem[17];
//  458   
//  459   PARAMETROS_le(ADR_MENSAGEM_CLIENTE_04,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+63
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  460   if(MENUOP_edita_mensagem("MSG CLIENTE 04",buffer_mensagem)){
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable17_29
          CFI FunCall MENUOP_edita_mensagem
        BL       MENUOP_edita_mensagem
        CMP      R0,#+0
        BEQ.N    ??MENUOP_configura_mensagem_cliente_04_0
//  461     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_04,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+63
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  462   }   
//  463 }
??MENUOP_configura_mensagem_cliente_04_0:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock16
//  464 /***********************************************************************************
//  465 *       Descrição       :       Tela para editar o flag que liga o 
//  466 *                               desumidificador
//  467 *       Parametros      :       nenhum
//  468 *       Retorno         :       nenhum
//  469 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function MENUOP_configura_flag_desumidificador
        THUMB
//  470 void MENUOP_configura_flag_desumidificador(void){
MENUOP_configura_flag_desumidificador:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  471   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  472   unsigned char flag;
//  473   
//  474   PARAMETROS_le(ADR_FLAG_DESUMIDIFICADOR,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+38
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  475   
//  476   flag = MEF_entry((char*)STRING_titulo_edita_flag_desumidifcador[idioma],
//  477                    flag,
//  478                    "ON ","OFF");    
        ADR.N    R3,??DataTable16  ;; "OFF"
        ADR.N    R2,??DataTable16_1  ;; "ON "
        LDRB     R1,[SP, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable17_30
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEF_entry
        BL       MEF_entry
        STRB     R0,[SP, #+0]
//  479   
//  480   PARAMETROS_grava(ADR_FLAG_DESUMIDIFICADOR,(void*)&flag);    
        ADD      R1,SP,#+0
        MOVS     R0,#+38
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  481 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC8      "OFF"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC8      "ON "
//  482 /***********************************************************************************
//  483 *       Descrição       :       Tela para configuração de uma mensagem no LCD
//  484 *       Parametros      :       (char*) título da tela
//  485 *                               (char*) mensagem inicial
//  486 *       Retorno         :       (unsigned char) maior do que zero se 
//  487 *                               a mensagem original sofreu alteração
//  488 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function MENUOP_edita_mensagem
        THUMB
//  489 unsigned char MENUOP_edita_mensagem(char *titulo,char* buffer_mensagem){
MENUOP_edita_mensagem:
        PUSH     {R4-R10,LR}
          CFI R14 Frame(CFA, -4)
          CFI R10 Frame(CFA, -8)
          CFI R9 Frame(CFA, -12)
          CFI R8 Frame(CFA, -16)
          CFI R7 Frame(CFA, -20)
          CFI R6 Frame(CFA, -24)
          CFI R5 Frame(CFA, -28)
          CFI R4 Frame(CFA, -32)
          CFI CFA R13+32
        SUB      SP,SP,#+24
          CFI CFA R13+56
        MOVS     R4,R0
        MOVS     R5,R1
//  490   eTECLA tecla;
//  491   char buffer_temp[17]={0};
        ADD      R0,SP,#+0
        MOVS     R1,#+20
          CFI FunCall __aeabi_memclr4
        BL       __aeabi_memclr4
//  492   unsigned char toggle=0;
        MOVS     R7,#+0
//  493   unsigned char tempo=1;
        MOVS     R8,#+1
//  494   unsigned char indice=0;
        MOVS     R9,#+0
//  495   unsigned char res=0;
        MOVS     R10,#+0
//  496   
//  497   buffer_mensagem[16] = 0;
        MOVS     R0,#+0
        STRB     R0,[R5, #+16]
//  498     
//  499   for(unsigned char i=0;i<16;i++)
        MOVS     R0,#+0
??MENUOP_edita_mensagem_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BGE.N    ??MENUOP_edita_mensagem_1
//  500     if(buffer_mensagem[i]<' ' || buffer_mensagem[i]>'z')
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R1,[R0, R5]
        CMP      R1,#+32
        BLT.N    ??MENUOP_edita_mensagem_2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R1,[R0, R5]
        CMP      R1,#+123
        BLT.N    ??MENUOP_edita_mensagem_3
//  501       buffer_mensagem[i] = ' ';
??MENUOP_edita_mensagem_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+32
        STRB     R1,[R0, R5]
??MENUOP_edita_mensagem_3:
        ADDS     R0,R0,#+1
        B.N      ??MENUOP_edita_mensagem_0
//  502   
//  503   STRING_write_to_internal(CLEAR_DISPLAY,titulo,NULL);
??MENUOP_edita_mensagem_1:
        MOVS     R2,#+0
        MOVS     R1,R4
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  504   
//  505   for(;;){
//  506     
//  507     tecla = TECLADO_getch();
??MENUOP_edita_mensagem_4:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R6,R0
//  508     switch(tecla){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BEQ.N    ??MENUOP_edita_mensagem_5
        BCC.N    ??MENUOP_edita_mensagem_6
        CMP      R6,#+3
        BEQ.N    ??MENUOP_edita_mensagem_7
        BCC.N    ??MENUOP_edita_mensagem_8
        CMP      R6,#+4
        BNE.N    ??MENUOP_edita_mensagem_6
//  509       case TECLA_ENTER:
//  510            indice++;
??MENUOP_edita_mensagem_9:
        ADDS     R9,R9,#+1
//  511            if(indice>15){             
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+16
        BLT.N    ??MENUOP_edita_mensagem_10
//  512              return res;
        MOV      R0,R10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??MENUOP_edita_mensagem_11
//  513            }
//  514            break;
??MENUOP_edita_mensagem_10:
        B.N      ??MENUOP_edita_mensagem_6
//  515       case TECLA_ESC:           
//  516            return res;
??MENUOP_edita_mensagem_5:
        MOV      R0,R10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??MENUOP_edita_mensagem_11
//  517       case TECLA_INC:
//  518            res = 1;
??MENUOP_edita_mensagem_8:
        MOVS     R0,#+1
        MOV      R10,R0
//  519            if(buffer_mensagem[indice]>'z')
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R5]
        CMP      R0,#+123
        BLT.N    ??MENUOP_edita_mensagem_12
//  520              buffer_mensagem[indice] = ' ';
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        MOVS     R0,#+32
        STRB     R0,[R9, R5]
        B.N      ??MENUOP_edita_mensagem_13
//  521            else
//  522              buffer_mensagem[indice]++;
??MENUOP_edita_mensagem_12:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R5]
        ADDS     R0,R0,#+1
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        STRB     R0,[R9, R5]
//  523            break;
??MENUOP_edita_mensagem_13:
        B.N      ??MENUOP_edita_mensagem_6
//  524       case TECLA_DEC:
//  525            res = 1;
??MENUOP_edita_mensagem_7:
        MOVS     R0,#+1
        MOV      R10,R0
//  526            if(buffer_mensagem[indice]>' ')
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R5]
        CMP      R0,#+33
        BLT.N    ??MENUOP_edita_mensagem_14
//  527              buffer_mensagem[indice]--;
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R5]
        SUBS     R0,R0,#+1
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        STRB     R0,[R9, R5]
        B.N      ??MENUOP_edita_mensagem_15
//  528            else
//  529              buffer_mensagem[indice] = 'z';
??MENUOP_edita_mensagem_14:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        MOVS     R0,#+122
        STRB     R0,[R9, R5]
//  530            break;
//  531     }
//  532     
//  533     if(!--tempo){
??MENUOP_edita_mensagem_15:
??MENUOP_edita_mensagem_6:
        SUBS     R8,R8,#+1
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??MENUOP_edita_mensagem_16
//  534       tempo = 5;
        MOVS     R0,#+5
        MOV      R8,R0
//  535       toggle ^= 255;
        EORS     R7,R7,#0xFF
//  536     }
//  537     
//  538     if(toggle)
??MENUOP_edita_mensagem_16:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??MENUOP_edita_mensagem_17
//  539       STRING_write_to_internal(NO_CLEAR,NULL,buffer_mensagem);
        MOVS     R2,R5
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MENUOP_edita_mensagem_18
//  540     else{
//  541       memcpy(buffer_temp,buffer_mensagem,16);
??MENUOP_edita_mensagem_17:
        MOVS     R2,#+16
        MOVS     R1,R5
        ADD      R0,SP,#+0
          CFI FunCall memcpy
        BL       memcpy
//  542       buffer_temp[indice] = '_';
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        ADD      R0,SP,#+0
        MOVS     R1,#+95
        STRB     R1,[R9, R0]
//  543       STRING_write_to_internal(NO_CLEAR,NULL,buffer_temp);
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  544     }
//  545     
//  546     vTaskDelay(50);
??MENUOP_edita_mensagem_18:
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??MENUOP_edita_mensagem_4
//  547   }      
??MENUOP_edita_mensagem_11:
        ADD      SP,SP,#+24
          CFI CFA R13+32
        POP      {R4-R10,PC}      ;; return
          CFI EndBlock cfiBlock18
//  548 }
//  549 /***********************************************************************************
//  550 *       Descrição       :       Configura os canais de moeda MDB habilitados
//  551 *                               na operação
//  552 *       Parametros      :       nenhum
//  553 *       Retorno         :       nenhum
//  554 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function MENUOP_configura_canais_moeda
        THUMB
//  555 void MENUOP_configura_canais_moeda(void){
MENUOP_configura_canais_moeda:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+52
          CFI CFA R13+72
//  556   unsigned char escala;
//  557   unsigned char canais[16];
//  558 
//  559   if(MDB_checa_valor_moedas(&escala,canais)!=MDB_OK){
        ADD      R1,SP,#+12
        ADD      R0,SP,#+8
          CFI FunCall MDB_checa_valor_moedas
        BL       MDB_checa_valor_moedas
        CMP      R0,#+0
        BEQ.N    ??MENUOP_configura_canais_moeda_0
//  560     STRING_write_to_internal(CLEAR_DISPLAY,"Falha ao","ler MDB COIN");
        LDR.N    R2,??DataTable17_31
        LDR.N    R1,??DataTable17_32
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  561     vTaskDelay(3000);
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  562   }
//  563   
//  564   unsigned short int cfg_moedas;
//  565   PARAMETROS_le(ADR_TIPOS_MOEDAS,(void*)&cfg_moedas);
??MENUOP_configura_canais_moeda_0:
        ADD      R1,SP,#+10
        MOVS     R0,#+64
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  566   eTECLA tecla;
//  567   unsigned char indice=0;
        MOVS     R5,#+0
//  568   char linha[17];
//  569   unsigned char inteiro;
//  570   unsigned char fracionario;
//  571   
//  572   STRING_write_to_internal(CLEAR_DISPLAY,"COINS MDB",NULL);
        MOVS     R2,#+0
        LDR.N    R1,??DataTable17_33
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  573   
//  574   for(;;){
//  575     
//  576     tecla = TECLADO_getch();
??MENUOP_configura_canais_moeda_1:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R4,R0
//  577     switch(tecla){
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??MENUOP_configura_canais_moeda_2
        BCC.N    ??MENUOP_configura_canais_moeda_3
        CMP      R4,#+3
        BEQ.N    ??MENUOP_configura_canais_moeda_4
        BCC.N    ??MENUOP_configura_canais_moeda_5
        CMP      R4,#+4
        BNE.N    ??MENUOP_configura_canais_moeda_3
//  578       case TECLA_ENTER:
//  579            cfg_moedas^=(0x01<<indice);
??MENUOP_configura_canais_moeda_6:
        LDRH     R0,[SP, #+10]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        EORS     R0,R1,R0
        STRH     R0,[SP, #+10]
//  580            break;
        B.N      ??MENUOP_configura_canais_moeda_3
//  581       case TECLA_ESC:
//  582            PARAMETROS_grava(ADR_TIPOS_MOEDAS,(void*)&cfg_moedas); 
??MENUOP_configura_canais_moeda_2:
        ADD      R1,SP,#+10
        MOVS     R0,#+64
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  583            return;
        B.N      ??MENUOP_configura_canais_moeda_7
//  584       case TECLA_INC:
//  585            indice = (indice+1)%16;
??MENUOP_configura_canais_moeda_5:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,#+1
        MOVS     R1,#+16
        SDIV     R5,R0,R1
        MLS      R5,R5,R1,R0
//  586            break;
        B.N      ??MENUOP_configura_canais_moeda_3
//  587       case TECLA_DEC:
//  588            if(indice)
??MENUOP_configura_canais_moeda_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??MENUOP_configura_canais_moeda_8
//  589              indice--;
        SUBS     R5,R5,#+1
        B.N      ??MENUOP_configura_canais_moeda_9
//  590            else
//  591              indice = 15;
??MENUOP_configura_canais_moeda_8:
        MOVS     R0,#+15
        MOVS     R5,R0
//  592            break;
//  593     }        
//  594     
//  595     inteiro = (canais[indice]*escala)/100;
??MENUOP_configura_canais_moeda_9:
??MENUOP_configura_canais_moeda_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADD      R0,SP,#+12
        LDRB     R0,[R5, R0]
        LDRB     R1,[SP, #+8]
        MULS     R0,R1,R0
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        MOVS     R6,R0
//  596     fracionario = (canais[indice]*escala)%100;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADD      R0,SP,#+12
        LDRB     R0,[R5, R0]
        LDRB     R1,[SP, #+8]
        MULS     R0,R1,R0
        MOVS     R1,#+100
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        MOVS     R7,R0
//  597     
//  598     sprintf(linha,"[%c] CH %02d-%01d,%02d",(cfg_moedas&(1<<indice))?'X':' ',indice+1,inteiro,fracionario);
        LDRH     R0,[SP, #+10]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        TST      R0,R1
        BEQ.N    ??MENUOP_configura_canais_moeda_10
        MOVS     R2,#+88
        B.N      ??MENUOP_configura_canais_moeda_11
??MENUOP_configura_canais_moeda_10:
        MOVS     R2,#+32
??MENUOP_configura_canais_moeda_11:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        STR      R7,[SP, #+4]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        STR      R6,[SP, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R3,R5,#+1
        LDR.N    R1,??DataTable17_34
        ADD      R0,SP,#+28
          CFI FunCall sprintf
        BL       sprintf
//  599     STRING_write_to_internal(NO_CLEAR,NULL,linha);
        ADD      R2,SP,#+28
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  600     
//  601     vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??MENUOP_configura_canais_moeda_1
//  602   }           
??MENUOP_configura_canais_moeda_7:
        ADD      SP,SP,#+52
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock19
//  603 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     MENUOP_funcs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_1:
        DC32     STRING_menu_configuracao_operacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_2:
        DC32     STRING_titulo_menu_operacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_3:
        DC32     0x18697

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_4:
        DC32     STRING_titulo_ajusta_valor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_5:
        DC32     0x18696

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_6:
        DC32     STRING_simbolo_moeda

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_7:
        DC32     `?<Constant "%s %d,%02d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_8:
        DC32     STRING_tabela_cedulas_canais

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_9:
        DC32     STRING_titulo_configuracao_notas

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_10:
        DC32     `?<Constant "Embalagem">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_11:
        DC32     `?<Constant "Liberando">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_12:
        DC32     `?<Constant "T. Motor Emb.">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_13:
        DC32     `?<Constant "na FLASH">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_14:
        DC32     `?<Constant "Salvando">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_15:
        DC32     `?<Constant "%05d ms">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_16:
        DC32     `?<Constant "%03d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_17:
        DC32     STRING_titulo_menu_edita_volume_musica

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_18:
        DC32     STRING_titulo_menu_edita_volume_voz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_19:
        DC32     `?<Constant "%02d min">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_20:
        DC32     STRING_titulo_menu_intervalo_prop

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_21:
        DC32     STRING_mensagem_configura_free

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_22:
        DC32     STRING_mensagem_configura_fita_led

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_23:
        DC32     STRING_titulo_configura_troco

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_24:
        DC32     `?<Constant "%03d %%">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_25:
        DC32     STRING_titulo_edita_comissao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_26:
        DC32     `?<Constant "MSG CLIENTE 01">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_27:
        DC32     `?<Constant "MSG CLIENTE 02">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_28:
        DC32     `?<Constant "MSG CLIENTE 03">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_29:
        DC32     `?<Constant "MSG CLIENTE 04">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_30:
        DC32     STRING_titulo_edita_flag_desumidifcador

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_31:
        DC32     `?<Constant "ler MDB COIN">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_32:
        DC32     `?<Constant "Falha ao">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_33:
        DC32     `?<Constant "COINS MDB">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_34:
        DC32     `?<Constant "[%c] CH %02d-%01d,%02d">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%s %d,%02d">`:
        DATA
        DC8 "%s %d,%02d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Liberando">`:
        DATA
        DC8 "Liberando"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Embalagem">`:
        DATA
        DC8 "Embalagem"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "T. Motor Emb.">`:
        DATA
        DC8 "T. Motor Emb."
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Salvando">`:
        DATA
        DC8 "Salvando"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "na FLASH">`:
        DATA
        DC8 "na FLASH"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%05d ms">`:
        DATA
        DC8 "%05d ms"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%03d">`:
        DATA
        DC8 "%03d"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%02d min">`:
        DATA
        DC8 "%02d min"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "ON "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "OFF"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%03d %%">`:
        DATA
        DC8 "%03d %%"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MSG CLIENTE 01">`:
        DATA
        DC8 "MSG CLIENTE 01"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MSG CLIENTE 02">`:
        DATA
        DC8 "MSG CLIENTE 02"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MSG CLIENTE 03">`:
        DATA
        DC8 "MSG CLIENTE 03"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MSG CLIENTE 04">`:
        DATA
        DC8 "MSG CLIENTE 04"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Falha ao">`:
        DATA
        DC8 "Falha ao"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ler MDB COIN">`:
        DATA
        DC8 "ler MDB COIN"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "COINS MDB">`:
        DATA
        DC8 "COINS MDB"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "[%c] CH %02d-%01d,%02d">`:
        DATA
        DC8 "[%c] CH %02d-%01d,%02d"
        DC8 0

        END
//  604 /***********************************************************************************
//  605 *       Fim do arquivo
//  606 ***********************************************************************************/
// 
//    68 bytes in section .data
//   276 bytes in section .rodata
// 1 998 bytes in section .text
// 
// 1 976 bytes of CODE  memory (+ 22 bytes shared)
//   276 bytes of CONST memory
//    68 bytes of DATA  memory
//
//Errors: none
//Warnings: none
