///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  13:07:27 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_operacao.c               /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_operacao.c -lC           /
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
//                    pocaG2\SOFTWARE\Debug\List\menu_operacao.s              /
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Aplicacao\menu_operacao.c
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
//   70 
//   71 /***********************************************************************************
//   72 *       Tabela de funções
//   73 ***********************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   74 void(*MENUOP_funcs[])(void)={
MENUOP_funcs:
        DATA
        DC32 MENUOP_configura_valor, MENUOP_configura_notas
        DC32 MENUOP_configura_modo_free, MENUOP_configura_fita_led
        DC32 MENUOP_configura_volume_musica, MENUOP_configura_volume_locucoes
        DC32 MENUOP_configura_intervalo_propaganda
        DC32 MENUOP_configura_tempo_embalagem, MENUOP_configura_troco
        DC32 MENUOP_configura_comissao, MENUOP_configura_mensagem_cliente
        DC32 MENUOP_configura_mensagem_cliente_02
        DC32 MENUOP_configura_mensagem_cliente_03
        DC32 MENUOP_configura_mensagem_cliente_04
        DC32 MENUOP_configura_flag_desumidificador, 0H
//   75   MENUOP_configura_valor,
//   76   MENUOP_configura_notas,
//   77   MENUOP_configura_modo_free,
//   78   MENUOP_configura_fita_led,
//   79   MENUOP_configura_volume_musica,
//   80   MENUOP_configura_volume_locucoes,
//   81   MENUOP_configura_intervalo_propaganda,
//   82   MENUOP_configura_tempo_embalagem,
//   83   MENUOP_configura_troco,
//   84   MENUOP_configura_comissao,
//   85   MENUOP_configura_mensagem_cliente,
//   86   MENUOP_configura_mensagem_cliente_02,
//   87   MENUOP_configura_mensagem_cliente_03,
//   88   MENUOP_configura_mensagem_cliente_04,
//   89   MENUOP_configura_flag_desumidificador,
//   90   NULL  
//   91 };
//   92 
//   93 /***********************************************************************************
//   94 *       Implementação das funções
//   95 ***********************************************************************************/
//   96 
//   97 /***********************************************************************************
//   98 *       Descrição       :       Ponto de entrada do menu de configuração
//   99 *                               do sistema
//  100 *       Parametros      :       nenhum
//  101 *       Retorno         :       nenhum
//  102 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MENUOP_entry
        THUMB
//  103 void MENUOP_entry(void){
MENUOP_entry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  104   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
//  105   
//  106   MENUROLAGEM_show((char*)STRING_titulo_menu_operacao[idioma],
//  107                    (char**)STRING_menu_configuracao_operacao[idioma],
//  108                    QTD_OPCOES_OPERACAO,
//  109                    MENUOP_funcs);    
        LDR.W    R3,??DataTable16_2
        MOVS     R2,#+16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+64
        LDR.W    R4,??DataTable16_3
        MLA      R1,R1,R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R4,??DataTable16_4
        LDR      R0,[R4, R0, LSL #+2]
          CFI FunCall MENUROLAGEM_show
        BL       MENUROLAGEM_show
//  110 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  111 /***********************************************************************************
//  112 *       Descrição       :       Menu para configuração do valor da pipoca
//  113 *       Parametros      :       nenhum
//  114 *       Retorno         :       nenhum
//  115 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MENUOP_configura_valor
        THUMB
//  116 void MENUOP_configura_valor(void){
MENUOP_configura_valor:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+28
          CFI CFA R13+48
//  117   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  118   unsigned int valor;
//  119   char buffer_linha[17];
//  120   eTECLA tecla;
//  121   unsigned char tamanho=0;
        MOVS     R7,#+0
//  122   unsigned char ultimo_tamanho=0;
        MOVS     R5,#+0
//  123   unsigned int valor_anterior;
//  124   
//  125   PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valor);
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  126   if(valor>99990)
        LDR      R0,[SP, #+4]
        LDR.W    R1,??DataTable16_5  ;; 0x18697
        CMP      R0,R1
        BCC.N    ??MENUOP_configura_valor_0
//  127     valor = 5;
        MOVS     R0,#+5
        STR      R0,[SP, #+4]
//  128   
//  129   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_ajusta_valor[idioma],NULL);
??MENUOP_configura_valor_0:
        MOVS     R2,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable16_6
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  130   
//  131   valor_anterior = valor;
        LDR      R6,[SP, #+4]
        B.N      ??MENUOP_configura_valor_1
//  132   
//  133   for(;TECLADO_getContadorInatividade();){
//  134   
//  135     tecla = TECLADO_getch();
//  136     switch(tecla){
//  137       case TECLA_ENTER:
//  138            PARAMETROS_grava(ADR_VALOR_PIPOCA,(void*)&valor);        
//  139            // Novo evento de troca
//  140            // de preço
//  141            if(valor_anterior!=valor)
//  142              FTP_novo_preco(valor,valor_anterior);           
//  143       case TECLA_ESC:
//  144            return;
//  145       case TECLA_INC:
//  146            if(valor<99990)
//  147              valor+=5;
//  148            break;
//  149       case TECLA_DEC:
//  150            if(valor>5)
//  151              valor-=5;
//  152            break;
//  153     }
//  154     
//  155     sprintf(buffer_linha,"%s %d,%02d",(char*)STRING_simbolo_moeda[idioma],valor/100,valor%100);
//  156     tamanho = strlen(buffer_linha);
//  157     if(tamanho!=ultimo_tamanho){
//  158       STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_ajusta_valor[idioma],buffer_linha);    
??MENUOP_configura_valor_2:
        ADD      R2,SP,#+8
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable16_6
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  159       ultimo_tamanho = tamanho;
        MOVS     R5,R7
//  160     }
??MENUOP_configura_valor_1:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??MENUOP_configura_valor_3
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MENUOP_configura_valor_4
        BCC.N    ??MENUOP_configura_valor_5
        CMP      R0,#+3
        BEQ.N    ??MENUOP_configura_valor_6
        BCC.N    ??MENUOP_configura_valor_7
        CMP      R0,#+4
        BNE.N    ??MENUOP_configura_valor_5
??MENUOP_configura_valor_8:
        ADD      R1,SP,#+4
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
        LDR      R0,[SP, #+4]
        CMP      R6,R0
        BEQ.N    ??MENUOP_configura_valor_4
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR      R0,[SP, #+4]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall FTP_novo_preco
        BL       FTP_novo_preco
??MENUOP_configura_valor_4:
        B.N      ??MENUOP_configura_valor_9
??MENUOP_configura_valor_7:
        LDR      R0,[SP, #+4]
        LDR.W    R1,??DataTable16_7  ;; 0x18696
        CMP      R0,R1
        BCS.N    ??MENUOP_configura_valor_10
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+5
        STR      R0,[SP, #+4]
??MENUOP_configura_valor_10:
        B.N      ??MENUOP_configura_valor_5
??MENUOP_configura_valor_6:
        LDR      R0,[SP, #+4]
        CMP      R0,#+6
        BCC.N    ??MENUOP_configura_valor_11
        LDR      R0,[SP, #+4]
        SUBS     R0,R0,#+5
        STR      R0,[SP, #+4]
??MENUOP_configura_valor_11:
??MENUOP_configura_valor_5:
        LDR      R0,[SP, #+4]
        MOVS     R1,#+100
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+4]
        MOVS     R1,#+100
        UDIV     R3,R0,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable16_8
        LDR      R2,[R0, R4, LSL #+2]
        LDR.W    R1,??DataTable16_9
        ADD      R0,SP,#+8
          CFI FunCall sprintf
        BL       sprintf
        ADD      R0,SP,#+8
          CFI FunCall strlen
        BL       strlen
        MOVS     R7,R0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R7,R5
        BNE.N    ??MENUOP_configura_valor_2
//  161     else
//  162       STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);    
        ADD      R2,SP,#+8
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MENUOP_configura_valor_1
//  163   }  
//  164 }
??MENUOP_configura_valor_3:
??MENUOP_configura_valor_9:
        ADD      SP,SP,#+28
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock2
//  165 /***********************************************************************************
//  166 *       Descrição       :       Configura as cédulas que serão aceitas
//  167 *                               pelo meio de pagamento, quando serial ou CCTALK
//  168 *       Parametros      :       nenhum
//  169 *       Retorno         :       nenhum
//  170 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MENUOP_configura_notas
        THUMB
//  171 void MENUOP_configura_notas(void){
MENUOP_configura_notas:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+16
          CFI CFA R13+24
//  172   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  173   unsigned char flags[6]={0};
        ADD      R0,SP,#+4
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
//  174   unsigned char cedulas;
//  175   
//  176   PARAMETROS_le(ADR_NOTAS,(void*)&cedulas);
        ADD      R1,SP,#+0
        MOVS     R0,#+2
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  177   for(unsigned char i=0;i<6;i++)
        MOVS     R0,#+0
        B.N      ??MENUOP_configura_notas_0
//  178     if(cedulas&(0x01<<i))
??MENUOP_configura_notas_1:
        LDRB     R1,[SP, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        TST      R1,R2
        BEQ.N    ??MENUOP_configura_notas_2
//  179       flags[i] = 255;  
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+4
        MOVS     R2,#+255
        STRB     R2,[R0, R1]
??MENUOP_configura_notas_2:
        ADDS     R0,R0,#+1
??MENUOP_configura_notas_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BLT.N    ??MENUOP_configura_notas_1
//  180   
//  181   MEL_entry((char*)STRING_titulo_configuracao_notas[idioma],
//  182             (char**)STRING_tabela_cedulas_canais[idioma],
//  183             flags,
//  184             6);
        MOVS     R3,#+6
        ADD      R2,SP,#+4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+24
        LDR.W    R1,??DataTable16_10
        MLA      R1,R0,R4,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable16_11
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEL_entry
        BL       MEL_entry
//  185   
//  186   cedulas = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  187   for(unsigned char i=0;i<6;i++)
        MOVS     R0,#+0
        B.N      ??MENUOP_configura_notas_3
//  188     if(flags[i])
??MENUOP_configura_notas_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+4
        LDRB     R1,[R0, R1]
        CMP      R1,#+0
        BEQ.N    ??MENUOP_configura_notas_5
//  189       cedulas|= (0x01)<<i;
        LDRB     R1,[SP, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        ORRS     R1,R2,R1
        STRB     R1,[SP, #+0]
??MENUOP_configura_notas_5:
        ADDS     R0,R0,#+1
??MENUOP_configura_notas_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BLT.N    ??MENUOP_configura_notas_4
//  190   
//  191   PARAMETROS_grava(ADR_NOTAS,(void*)&cedulas);     
        ADD      R1,SP,#+0
        MOVS     R0,#+2
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  192 }
        POP      {R0-R4,PC}       ;; return
          CFI EndBlock cfiBlock3
//  193 /***********************************************************************************
//  194 *       Descrição       :       Tela que faz o teste da liberação de uma embalagem
//  195 *       Parametros      :       nenhum
//  196 *       Retorno         :       nenhum
//  197 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MENUOP_testa_liberacao_embalagem
        THUMB
//  198 void MENUOP_testa_liberacao_embalagem(unsigned int tempo){
MENUOP_testa_liberacao_embalagem:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  199   
//  200   STRING_write_to_internal(CLEAR_DISPLAY,"Liberando","Embalagem");  
        LDR.N    R2,??DataTable16_12
        LDR.N    R1,??DataTable16_13
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  201   EMBALAGEM_libera_pacote(tempo);    
        MOVS     R0,R4
          CFI FunCall EMBALAGEM_libera_pacote
        BL       EMBALAGEM_libera_pacote
//  202 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4
//  203 /***********************************************************************************
//  204 *       Descrição       :       Faz o ajuste do intervalo de tempo em que
//  205 *                               o motor da embalagem fica ligado
//  206 *       Parametros      :       nenhum
//  207 *       Retorno         :       nenhum
//  208 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MENUOP_configura_tempo_embalagem
        THUMB
//  209 void MENUOP_configura_tempo_embalagem(void){
MENUOP_configura_tempo_embalagem:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+28
          CFI CFA R13+32
//  210   unsigned int tempo_embalagem;
//  211   eTECLA tecla;
//  212   char buffer_linha[17];
//  213   
//  214   PARAMETROS_le(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+28
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  215   if(tempo_embalagem>10000)
        LDR      R0,[SP, #+0]
        MOVW     R1,#+10001
        CMP      R0,R1
        BCC.N    ??MENUOP_configura_tempo_embalagem_0
//  216     tempo_embalagem = 500;
        MOV      R0,#+500
        STR      R0,[SP, #+0]
//  217   
//  218   STRING_write_to_internal(CLEAR_DISPLAY,"T. Motor Emb.",NULL);
??MENUOP_configura_tempo_embalagem_0:
        MOVS     R2,#+0
        LDR.N    R1,??DataTable16_14
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MENUOP_configura_tempo_embalagem_1
//  219   
//  220   for(;;){
//  221     tecla = TECLADO_getch();
//  222     
//  223     switch(tecla){
//  224       case TECLA_ENTER:
//  225            MENUOP_testa_liberacao_embalagem(tempo_embalagem);
//  226            STRING_write_to_internal(CLEAR_DISPLAY,"T. Motor Emb.",NULL);           
//  227            break;
//  228       case TECLA_ESC:
//  229            STRING_write_to_internal(CLEAR_DISPLAY,"Salvando","na FLASH");
//  230            PARAMETROS_grava(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);
//  231            vTaskDelay(3000);
//  232            return;
//  233       case TECLA_INC:
//  234            if(tempo_embalagem<10000)
//  235              tempo_embalagem+=100;
//  236            break;
//  237       case TECLA_DEC:
//  238            if(tempo_embalagem>500)
??MENUOP_configura_tempo_embalagem_2:
        LDR      R0,[SP, #+0]
        CMP      R0,#+500
        BLS.N    ??MENUOP_configura_tempo_embalagem_3
//  239              tempo_embalagem-=100;
        LDR      R0,[SP, #+0]
        SUBS     R0,R0,#+100
        STR      R0,[SP, #+0]
//  240            break;
//  241     }
//  242         
//  243     sprintf(buffer_linha,"%05d ms",tempo_embalagem);
??MENUOP_configura_tempo_embalagem_3:
??MENUOP_configura_tempo_embalagem_4:
        LDR      R2,[SP, #+0]
        LDR.N    R1,??DataTable16_15
        ADD      R0,SP,#+4
          CFI FunCall sprintf
        BL       sprintf
//  244     STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
        ADD      R2,SP,#+4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
??MENUOP_configura_tempo_embalagem_1:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MENUOP_configura_tempo_embalagem_5
        BCC.N    ??MENUOP_configura_tempo_embalagem_4
        CMP      R0,#+3
        BEQ.N    ??MENUOP_configura_tempo_embalagem_2
        BCC.N    ??MENUOP_configura_tempo_embalagem_6
        CMP      R0,#+4
        BNE.N    ??MENUOP_configura_tempo_embalagem_4
??MENUOP_configura_tempo_embalagem_7:
        LDR      R0,[SP, #+0]
          CFI FunCall MENUOP_testa_liberacao_embalagem
        BL       MENUOP_testa_liberacao_embalagem
        MOVS     R2,#+0
        LDR.N    R1,??DataTable16_14
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MENUOP_configura_tempo_embalagem_4
??MENUOP_configura_tempo_embalagem_5:
        LDR.N    R2,??DataTable16_16
        LDR.N    R1,??DataTable16_17
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        ADD      R1,SP,#+0
        MOVS     R0,#+28
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        ADD      SP,SP,#+28
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI CFA R13+32
??MENUOP_configura_tempo_embalagem_6:
        LDR      R0,[SP, #+0]
        MOVW     R1,#+10000
        CMP      R0,R1
        BCS.N    ??MENUOP_configura_tempo_embalagem_8
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+100
        STR      R0,[SP, #+0]
??MENUOP_configura_tempo_embalagem_8:
        B.N      ??MENUOP_configura_tempo_embalagem_4
          CFI EndBlock cfiBlock5
//  245   }
//  246   /*
//  247   unsigned int tempo_embalagem;
//  248   unsigned char idioma;
//  249   
//  250   PARAMETROS_le(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);
//  251   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
//  252   
//  253   if(tempo_embalagem>10000)
//  254     tempo_embalagem = 100;
//  255   
//  256   tempo_embalagem = MEI_entry_inc((char*)STRING_mensagem_edita_tempo_embalagem[idioma],
//  257                                   "%05d ms",
//  258                                   tempo_embalagem,
//  259                                   100,
//  260                                   10000,
//  261                                   100);
//  262   
//  263   PARAMETROS_grava(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);  
//  264   */
//  265 }
//  266 /***********************************************************************************
//  267 *       Descrição       :       Configura o volume utilizado pela música
//  268 *       Parametros      :       nenhum
//  269 *       Retorno         :       nenhum
//  270 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MENUOP_configura_volume_musica
        THUMB
//  271 void MENUOP_configura_volume_musica(void){
MENUOP_configura_volume_musica:
        PUSH     {R0-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+24
//  272   unsigned int volume;
//  273   unsigned char idioma;  
//  274   
//  275   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
        ADD      R1,SP,#+8
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  276   PARAMETROS_le(ADR_VOLUME_MUSICA,(void*)&volume);
        ADD      R1,SP,#+12
        MOVS     R0,#+29
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  277   
//  278   if(volume>100)
        LDR      R0,[SP, #+12]
        CMP      R0,#+101
        BCC.N    ??MENUOP_configura_volume_musica_0
//  279     volume = 100;
        MOVS     R0,#+100
        STR      R0,[SP, #+12]
//  280   
//  281   volume = MEI_entry_inc((char*)STRING_titulo_menu_edita_volume_musica[idioma],
//  282                          "%03d",
//  283                          volume,
//  284                          1,
//  285                          100,
//  286                          1);
??MENUOP_configura_volume_musica_0:
        MOVS     R0,#+1
        STR      R0,[SP, #+4]
        MOVS     R0,#+100
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        LDR      R2,[SP, #+12]
        LDR.N    R1,??DataTable16_18
        LDRB     R0,[SP, #+8]
        LDR.N    R4,??DataTable16_19
        LDR      R0,[R4, R0, LSL #+2]
          CFI FunCall MEI_entry_inc
        BL       MEI_entry_inc
        STR      R0,[SP, #+12]
//  287   PARAMETROS_grava(ADR_VOLUME_MUSICA,(void*)&volume);    
        ADD      R1,SP,#+12
        MOVS     R0,#+29
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  288 }
        POP      {R0-R4,PC}       ;; return
          CFI EndBlock cfiBlock6
//  289 /***********************************************************************************
//  290 *       Descrição       :       Confiura o volume das locuções
//  291 *       Parametros      :       nenhum
//  292 *       Retorno         :       nenhum
//  293 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function MENUOP_configura_volume_locucoes
        THUMB
//  294 void MENUOP_configura_volume_locucoes(void){
MENUOP_configura_volume_locucoes:
        PUSH     {R0-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+24
//  295   unsigned int volume;
//  296   unsigned char idioma;  
//  297   
//  298   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
        ADD      R1,SP,#+8
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  299   PARAMETROS_le(ADR_VOLUME_VOZ,(void*)&volume);
        ADD      R1,SP,#+12
        MOVS     R0,#+30
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  300   
//  301   if(volume>100)
        LDR      R0,[SP, #+12]
        CMP      R0,#+101
        BCC.N    ??MENUOP_configura_volume_locucoes_0
//  302     volume = 100;
        MOVS     R0,#+100
        STR      R0,[SP, #+12]
//  303   
//  304   volume = MEI_entry_inc((char*)STRING_titulo_menu_edita_volume_voz[idioma],
//  305                          "%03d",
//  306                          volume,
//  307                          1,
//  308                          100,
//  309                          1);
??MENUOP_configura_volume_locucoes_0:
        MOVS     R0,#+1
        STR      R0,[SP, #+4]
        MOVS     R0,#+100
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        LDR      R2,[SP, #+12]
        LDR.N    R1,??DataTable16_18
        LDRB     R0,[SP, #+8]
        LDR.N    R4,??DataTable16_20
        LDR      R0,[R4, R0, LSL #+2]
          CFI FunCall MEI_entry_inc
        BL       MEI_entry_inc
        STR      R0,[SP, #+12]
//  310   PARAMETROS_grava(ADR_VOLUME_VOZ,(void*)&volume);  
        ADD      R1,SP,#+12
        MOVS     R0,#+30
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  311 }
        POP      {R0-R4,PC}       ;; return
          CFI EndBlock cfiBlock7
//  312 /***********************************************************************************
//  313 *       Descrição       :       Configura o intervalo para a propaganda
//  314 *       Parametros      :       nenhum
//  315 *       Retorno         :       nenhum
//  316 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function MENUOP_configura_intervalo_propaganda
        THUMB
//  317 void MENUOP_configura_intervalo_propaganda(void){
MENUOP_configura_intervalo_propaganda:
        PUSH     {R0-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+24
//  318   unsigned char idioma;
//  319   unsigned int intervalo;
//  320   
//  321   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
        ADD      R1,SP,#+8
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  322   PARAMETROS_le(ADR_INTERVALO_TEMPO_PROP,(void*)&intervalo);
        ADD      R1,SP,#+12
        MOVS     R0,#+31
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  323   
//  324   if(intervalo>60)
        LDR      R0,[SP, #+12]
        CMP      R0,#+61
        BCC.N    ??MENUOP_configura_intervalo_propaganda_0
//  325     intervalo = 60;
        MOVS     R0,#+60
        STR      R0,[SP, #+12]
//  326   
//  327   intervalo = MEI_entry_inc((char*)STRING_titulo_menu_intervalo_prop[idioma],
//  328                             "%02d min",
//  329                              intervalo,
//  330                              10,
//  331                              60,
//  332                              10);  
??MENUOP_configura_intervalo_propaganda_0:
        MOVS     R0,#+10
        STR      R0,[SP, #+4]
        MOVS     R0,#+60
        STR      R0,[SP, #+0]
        MOVS     R3,#+10
        LDR      R2,[SP, #+12]
        LDR.N    R1,??DataTable16_21
        LDRB     R0,[SP, #+8]
        LDR.N    R4,??DataTable16_22
        LDR      R0,[R4, R0, LSL #+2]
          CFI FunCall MEI_entry_inc
        BL       MEI_entry_inc
        STR      R0,[SP, #+12]
//  333   
//  334   PARAMETROS_grava(ADR_INTERVALO_TEMPO_PROP,(void*)&intervalo);    
        ADD      R1,SP,#+12
        MOVS     R0,#+31
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  335 }
        POP      {R0-R4,PC}       ;; return
          CFI EndBlock cfiBlock8
//  336 /***********************************************************************************
//  337 *       Descrição       :       Tela para configuração do modo free
//  338 *       Parametros      :       nenhum
//  339 *       Retorno         :       nenhum
//  340 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function MENUOP_configura_modo_free
        THUMB
//  341 void MENUOP_configura_modo_free(void){
MENUOP_configura_modo_free:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  342   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  343   unsigned char flag;
//  344   
//  345   PARAMETROS_le(ADR_FLAG_FREE,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  346   
//  347   flag = MEF_entry((char*)STRING_mensagem_configura_free[idioma],flag,"ON ","OFF");    
        ADR.N    R3,??DataTable16  ;; "OFF"
        ADR.N    R2,??DataTable16_1  ;; "ON "
        LDRB     R1,[SP, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable16_23
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEF_entry
        BL       MEF_entry
        STRB     R0,[SP, #+0]
//  348   
//  349   PARAMETROS_grava(ADR_FLAG_FREE,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  350 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock9
//  351 /***********************************************************************************
//  352 *       Descrição       :       Tela para configuração do uso da fita-led
//  353 *                               durante a espera da máquina
//  354 *       Parametros      :       nenhum
//  355 *       Retorno         :       nenhum
//  356 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function MENUOP_configura_fita_led
        THUMB
//  357 void MENUOP_configura_fita_led(void){
MENUOP_configura_fita_led:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  358   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  359   unsigned char flag;
//  360   
//  361   PARAMETROS_le(ADR_FLAG_FITA_LED,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+33
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  362   
//  363   flag = MEF_entry((char*)STRING_mensagem_configura_fita_led[idioma],flag,"ON ","OFF");    
        ADR.N    R3,??DataTable16  ;; "OFF"
        ADR.N    R2,??DataTable16_1  ;; "ON "
        LDRB     R1,[SP, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable16_24
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEF_entry
        BL       MEF_entry
        STRB     R0,[SP, #+0]
//  364   
//  365   PARAMETROS_grava(ADR_FLAG_FITA_LED,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+33
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  366 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock10
//  367 /***********************************************************************************
//  368 *       Descrição       :       Tela para configuração do uso de troco
//  369 *                               pela máquina
//  370 *       Parametros      :       nenhum
//  371 *       Retorno         :       nenhum
//  372 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function MENUOP_configura_troco
        THUMB
//  373 void MENUOP_configura_troco(void){
MENUOP_configura_troco:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  374   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  375   unsigned char flag;
//  376   
//  377   PARAMETROS_le(ADR_FLAG_TROCO,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  378   
//  379   flag = MEF_entry((char*)STRING_titulo_configura_troco[idioma],flag,"ON ","OFF");    
        ADR.N    R3,??DataTable16  ;; "OFF"
        ADR.N    R2,??DataTable16_1  ;; "ON "
        LDRB     R1,[SP, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable16_25
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEF_entry
        BL       MEF_entry
        STRB     R0,[SP, #+0]
//  380   
//  381   PARAMETROS_grava(ADR_FLAG_TROCO,(void*)&flag);         
        ADD      R1,SP,#+0
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  382 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock11
//  383 /***********************************************************************************
//  384 *       Descrição       :       Tela para configurar a comissão do ponto
//  385 *       Parametros      :       nenhum
//  386 *       Retorno         :       nenhum
//  387 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function MENUOP_configura_comissao
        THUMB
//  388 void MENUOP_configura_comissao(void){
MENUOP_configura_comissao:
        PUSH     {R0-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+24
//  389   unsigned int comissao;
//  390   unsigned char idioma;
//  391   
//  392   PARAMETROS_le(ADR_COMISSAO_PONTO,(void*)&comissao);
        ADD      R1,SP,#+12
        MOVS     R0,#+37
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  393   PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
        ADD      R1,SP,#+8
        MOVS     R0,#+0
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  394   
//  395   if(comissao>100)
        LDR      R0,[SP, #+12]
        CMP      R0,#+101
        BCC.N    ??MENUOP_configura_comissao_0
//  396     comissao = 20;
        MOVS     R0,#+20
        STR      R0,[SP, #+12]
//  397   
//  398   comissao = MEI_entry_inc((char*)STRING_titulo_edita_comissao[idioma],
//  399                            "%03d %%",
//  400                             comissao,
//  401                             1,
//  402                             100,
//  403                             1);
??MENUOP_configura_comissao_0:
        MOVS     R0,#+1
        STR      R0,[SP, #+4]
        MOVS     R0,#+100
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        LDR      R2,[SP, #+12]
        LDR.N    R1,??DataTable16_26
        LDRB     R0,[SP, #+8]
        LDR.N    R4,??DataTable16_27
        LDR      R0,[R4, R0, LSL #+2]
          CFI FunCall MEI_entry_inc
        BL       MEI_entry_inc
        STR      R0,[SP, #+12]
//  404   
//  405   PARAMETROS_grava(ADR_COMISSAO_PONTO,(void*)&comissao);  
        ADD      R1,SP,#+12
        MOVS     R0,#+37
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  406 }
        POP      {R0-R4,PC}       ;; return
          CFI EndBlock cfiBlock12
//  407 /***********************************************************************************
//  408 *       Descrição       :       Tela para configurar a mensagem de cliente
//  409 *       Parametros      :       nenhum
//  410 *       Retorno         :       nenhum
//  411 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function MENUOP_configura_mensagem_cliente
        THUMB
//  412 void MENUOP_configura_mensagem_cliente(void){
MENUOP_configura_mensagem_cliente:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  413   char buffer_mensagem[17];
//  414   
//  415   PARAMETROS_le(ADR_MENSAGEM_CLIENTE_01,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+40
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  416   if(MENUOP_edita_mensagem("MSG CLIENTE 01",buffer_mensagem)){
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable16_28
          CFI FunCall MENUOP_edita_mensagem
        BL       MENUOP_edita_mensagem
        CMP      R0,#+0
        BEQ.N    ??MENUOP_configura_mensagem_cliente_0
//  417     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_01,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+40
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  418   }
//  419 }
??MENUOP_configura_mensagem_cliente_0:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock13
//  420 /***********************************************************************************
//  421 *       Descrição       :       Tela para configurar a mensagem do cliente
//  422 *                               de número 02
//  423 *       Parametros      :       nenhum
//  424 *       Retorno         :       nenhum
//  425 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function MENUOP_configura_mensagem_cliente_02
        THUMB
//  426 void MENUOP_configura_mensagem_cliente_02(void){
MENUOP_configura_mensagem_cliente_02:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  427   char buffer_mensagem[17];
//  428   
//  429   PARAMETROS_le(ADR_MENSAGEM_CLIENTE_02,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+41
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  430   if(MENUOP_edita_mensagem("MSG CLIENTE 02",buffer_mensagem)){
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable16_29
          CFI FunCall MENUOP_edita_mensagem
        BL       MENUOP_edita_mensagem
        CMP      R0,#+0
        BEQ.N    ??MENUOP_configura_mensagem_cliente_02_0
//  431     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_02,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+41
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  432   }
//  433 }
??MENUOP_configura_mensagem_cliente_02_0:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock14
//  434 /***********************************************************************************
//  435 *       Descrição       :       Tela para configurar a mensagem do cliente
//  436 *                               de número 03
//  437 *       Parametros      :       nenhum
//  438 *       Retorno         :       nenhum
//  439 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function MENUOP_configura_mensagem_cliente_03
        THUMB
//  440 void MENUOP_configura_mensagem_cliente_03(void){
MENUOP_configura_mensagem_cliente_03:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  441   char buffer_mensagem[17];
//  442   
//  443   PARAMETROS_le(ADR_MENSAGEM_CLIENTE_03,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+42
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  444   if(MENUOP_edita_mensagem("MSG CLIENTE 03",buffer_mensagem)){
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable16_30
          CFI FunCall MENUOP_edita_mensagem
        BL       MENUOP_edita_mensagem
        CMP      R0,#+0
        BEQ.N    ??MENUOP_configura_mensagem_cliente_03_0
//  445     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_03,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+42
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  446   }
//  447 }
??MENUOP_configura_mensagem_cliente_03_0:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock15
//  448 /***********************************************************************************
//  449 *       Descrição       :       Tela para configurar a mensagem do cliente
//  450 *                               de número 04
//  451 *       Parametros      :       nenhum
//  452 *       Retorno         :       nenhum
//  453 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function MENUOP_configura_mensagem_cliente_04
        THUMB
//  454 void MENUOP_configura_mensagem_cliente_04(void){
MENUOP_configura_mensagem_cliente_04:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+20
          CFI CFA R13+24
//  455   char buffer_mensagem[17];
//  456   
//  457   PARAMETROS_le(ADR_MENSAGEM_CLIENTE_04,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+43
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  458   if(MENUOP_edita_mensagem("MSG CLIENTE 04",buffer_mensagem)){
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable16_31
          CFI FunCall MENUOP_edita_mensagem
        BL       MENUOP_edita_mensagem
        CMP      R0,#+0
        BEQ.N    ??MENUOP_configura_mensagem_cliente_04_0
//  459     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_04,(void*)buffer_mensagem);
        ADD      R1,SP,#+0
        MOVS     R0,#+43
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  460   }   
//  461 }
??MENUOP_configura_mensagem_cliente_04_0:
        ADD      SP,SP,#+20
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock16
//  462 /***********************************************************************************
//  463 *       Descrição       :       Tela para editar o flag que liga o 
//  464 *                               desumidificador
//  465 *       Parametros      :       nenhum
//  466 *       Retorno         :       nenhum
//  467 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function MENUOP_configura_flag_desumidificador
        THUMB
//  468 void MENUOP_configura_flag_desumidificador(void){
MENUOP_configura_flag_desumidificador:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  469   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  470   unsigned char flag;
//  471   
//  472   PARAMETROS_le(ADR_FLAG_DESUMIDIFICADOR,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+38
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  473   
//  474   flag = MEF_entry((char*)STRING_titulo_edita_flag_desumidifcador[idioma],
//  475                    flag,
//  476                    "ON ","OFF");    
        ADR.N    R3,??DataTable16  ;; "OFF"
        ADR.N    R2,??DataTable16_1  ;; "ON "
        LDRB     R1,[SP, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable16_32
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEF_entry
        BL       MEF_entry
        STRB     R0,[SP, #+0]
//  477   
//  478   PARAMETROS_grava(ADR_FLAG_DESUMIDIFICADOR,(void*)&flag);    
        ADD      R1,SP,#+0
        MOVS     R0,#+38
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  479 }
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

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_2:
        DC32     MENUOP_funcs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_3:
        DC32     STRING_menu_configuracao_operacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_4:
        DC32     STRING_titulo_menu_operacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_5:
        DC32     0x18697

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_6:
        DC32     STRING_titulo_ajusta_valor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_7:
        DC32     0x18696

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_8:
        DC32     STRING_simbolo_moeda

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_9:
        DC32     `?<Constant "%s %d,%02d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_10:
        DC32     STRING_tabela_cedulas_canais

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_11:
        DC32     STRING_titulo_configuracao_notas

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_12:
        DC32     `?<Constant "Embalagem">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_13:
        DC32     `?<Constant "Liberando">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_14:
        DC32     `?<Constant "T. Motor Emb.">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_15:
        DC32     `?<Constant "%05d ms">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_16:
        DC32     `?<Constant "na FLASH">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_17:
        DC32     `?<Constant "Salvando">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_18:
        DC32     `?<Constant "%03d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_19:
        DC32     STRING_titulo_menu_edita_volume_musica

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_20:
        DC32     STRING_titulo_menu_edita_volume_voz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_21:
        DC32     `?<Constant "%02d min">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_22:
        DC32     STRING_titulo_menu_intervalo_prop

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_23:
        DC32     STRING_mensagem_configura_free

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_24:
        DC32     STRING_mensagem_configura_fita_led

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_25:
        DC32     STRING_titulo_configura_troco

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_26:
        DC32     `?<Constant "%03d %%">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_27:
        DC32     STRING_titulo_edita_comissao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_28:
        DC32     `?<Constant "MSG CLIENTE 01">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_29:
        DC32     `?<Constant "MSG CLIENTE 02">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_30:
        DC32     `?<Constant "MSG CLIENTE 03">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_31:
        DC32     `?<Constant "MSG CLIENTE 04">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_32:
        DC32     STRING_titulo_edita_flag_desumidifcador
//  480 /***********************************************************************************
//  481 *       Descrição       :       Tela para configuração de uma mensagem no LCD
//  482 *       Parametros      :       (char*) título da tela
//  483 *                               (char*) mensagem inicial
//  484 *       Retorno         :       (unsigned char) maior do que zero se 
//  485 *                               a mensagem original sofreu alteração
//  486 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function MENUOP_edita_mensagem
        THUMB
//  487 unsigned char MENUOP_edita_mensagem(char *titulo,char* buffer_mensagem){
MENUOP_edita_mensagem:
        PUSH     {R4-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+28
        SUB      SP,SP,#+20
          CFI CFA R13+48
        MOVS     R5,R0
        MOVS     R4,R1
//  488   eTECLA tecla;
//  489   char buffer_temp[17]={0};
        ADD      R0,SP,#+0
        MOVS     R1,#+20
          CFI FunCall __aeabi_memclr4
        BL       __aeabi_memclr4
//  490   unsigned char toggle=0;
        MOVS     R6,#+0
//  491   unsigned char tempo=1;
        MOVS     R7,#+1
//  492   unsigned char indice=0;
        MOVS     R8,#+0
//  493   unsigned char res=0;
        MOVS     R9,#+0
//  494   
//  495   buffer_mensagem[16] = 0;
        MOVS     R0,#+0
        STRB     R0,[R4, #+16]
//  496     
//  497   for(unsigned char i=0;i<16;i++)
        MOVS     R0,#+0
        B.N      ??MENUOP_edita_mensagem_0
//  498     if(buffer_mensagem[i]<' ' || buffer_mensagem[i]>'z')
??MENUOP_edita_mensagem_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R1,[R0, R4]
        SUBS     R1,R1,#+32
        CMP      R1,#+91
        BCC.N    ??MENUOP_edita_mensagem_2
//  499       buffer_mensagem[i] = ' ';
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+32
        STRB     R1,[R0, R4]
??MENUOP_edita_mensagem_2:
        ADDS     R0,R0,#+1
??MENUOP_edita_mensagem_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BLT.N    ??MENUOP_edita_mensagem_1
//  500   
//  501   STRING_write_to_internal(CLEAR_DISPLAY,titulo,NULL);
        MOVS     R2,#+0
        MOVS     R1,R5
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MENUOP_edita_mensagem_3
//  502   
//  503   for(;;){
//  504     
//  505     tecla = TECLADO_getch();
//  506     switch(tecla){
//  507       case TECLA_ENTER:
//  508            indice++;
//  509            if(indice>15){             
//  510              return res;
//  511            }
//  512            break;
//  513       case TECLA_ESC:           
//  514            return res;
//  515       case TECLA_INC:
//  516            res = 1;
//  517            if(buffer_mensagem[indice]>'z')
//  518              buffer_mensagem[indice] = ' ';
//  519            else
//  520              buffer_mensagem[indice]++;
//  521            break;
//  522       case TECLA_DEC:
//  523            res = 1;
//  524            if(buffer_mensagem[indice]>' ')
//  525              buffer_mensagem[indice]--;
//  526            else
//  527              buffer_mensagem[indice] = 'z';
//  528            break;
//  529     }
//  530     
//  531     if(!--tempo){
//  532       tempo = 5;
//  533       toggle ^= 255;
//  534     }
//  535     
//  536     if(toggle)
//  537       STRING_write_to_internal(NO_CLEAR,NULL,buffer_mensagem);
//  538     else{
//  539       memcpy(buffer_temp,buffer_mensagem,16);
??MENUOP_edita_mensagem_4:
        MOVS     R2,#+16
        MOVS     R1,R4
        ADD      R0,SP,#+0
          CFI FunCall memcpy
        BL       memcpy
//  540       buffer_temp[indice] = '_';
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ADD      R0,SP,#+0
        MOVS     R1,#+95
        STRB     R1,[R8, R0]
//  541       STRING_write_to_internal(NO_CLEAR,NULL,buffer_temp);
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  542     }
//  543     
//  544     vTaskDelay(50);
??MENUOP_edita_mensagem_5:
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??MENUOP_edita_mensagem_3:
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??MENUOP_edita_mensagem_6
        BCC.N    ??MENUOP_edita_mensagem_7
        CMP      R0,#+3
        BEQ.N    ??MENUOP_edita_mensagem_8
        BCC.N    ??MENUOP_edita_mensagem_9
        CMP      R0,#+4
        BNE.N    ??MENUOP_edita_mensagem_7
??MENUOP_edita_mensagem_10:
        ADDS     R8,R8,#+1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+16
        BLT.N    ??MENUOP_edita_mensagem_11
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??MENUOP_edita_mensagem_12:
        ADD      SP,SP,#+20
          CFI CFA R13+28
        POP      {R4-R9,PC}       ;; return
          CFI CFA R13+48
??MENUOP_edita_mensagem_11:
        B.N      ??MENUOP_edita_mensagem_7
??MENUOP_edita_mensagem_6:
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??MENUOP_edita_mensagem_12
??MENUOP_edita_mensagem_9:
        MOVS     R9,#+1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LDRB     R0,[R8, R4]
        CMP      R0,#+123
        BLT.N    ??MENUOP_edita_mensagem_13
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MOVS     R0,#+32
        STRB     R0,[R8, R4]
        B.N      ??MENUOP_edita_mensagem_14
??MENUOP_edita_mensagem_13:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LDRB     R0,[R8, R4]
        ADDS     R0,R0,#+1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        STRB     R0,[R8, R4]
??MENUOP_edita_mensagem_14:
        B.N      ??MENUOP_edita_mensagem_7
??MENUOP_edita_mensagem_8:
        MOVS     R9,#+1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LDRB     R0,[R8, R4]
        CMP      R0,#+33
        BLT.N    ??MENUOP_edita_mensagem_15
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LDRB     R0,[R8, R4]
        SUBS     R0,R0,#+1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        STRB     R0,[R8, R4]
        B.N      ??MENUOP_edita_mensagem_16
??MENUOP_edita_mensagem_15:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MOVS     R0,#+122
        STRB     R0,[R8, R4]
??MENUOP_edita_mensagem_16:
??MENUOP_edita_mensagem_7:
        SUBS     R7,R7,#+1
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??MENUOP_edita_mensagem_17
        MOVS     R7,#+5
        EORS     R6,R6,#0xFF
??MENUOP_edita_mensagem_17:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??MENUOP_edita_mensagem_4
        MOVS     R2,R4
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
        B.N      ??MENUOP_edita_mensagem_5
          CFI EndBlock cfiBlock18
//  545   }      
//  546 }

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

        END
//  547 /***********************************************************************************
//  548 *       Fim do arquivo
//  549 ***********************************************************************************/
// 
//    64 bytes in section .data
//   212 bytes in section .rodata
// 1 670 bytes in section .text
// 
// 1 656 bytes of CODE  memory (+ 14 bytes shared)
//   212 bytes of CONST memory
//    64 bytes of DATA  memory
//
//Errors: none
//Warnings: none
