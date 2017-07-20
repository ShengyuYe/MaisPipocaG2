///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  14:40:43 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_avancado.c               /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\menu_avancado.c -lC           /
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
//                    pocaG2\SOFTWARE\Debug\List\menu_avancado.s              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME menu_avancado

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN APLICACAO_carrega_idioma
        EXTERN FATURAMENTO_reinicia_pipocas_teste
        EXTERN FATURAMENTO_set_arrecadacao_cartao_parcial
        EXTERN FATURAMENTO_set_arrecadacao_cartao_total
        EXTERN FATURAMENTO_set_arrecadacao_parcial
        EXTERN FATURAMENTO_set_arrecadacao_total
        EXTERN FATURAMENTO_set_contagem_cartao_parcial
        EXTERN FATURAMENTO_set_contagem_cartao_total
        EXTERN FATURAMENTO_set_contagem_parcial
        EXTERN FATURAMENTO_set_contagem_total
        EXTERN FTP_formata_fila
        EXTERN IAR_entry
        EXTERN MEF_entry
        EXTERN MEI_entry
        EXTERN MENUROLAGEM_show
        EXTERN PARAMETROS_grava
        EXTERN PARAMETROS_le
        EXTERN STRING_mensagem_cadastro_senha
        EXTERN STRING_mensagem_cadastro_senha_erro
        EXTERN STRING_mensagem_inserir_senha
        EXTERN STRING_mensagem_reinicia_totalizadores
        EXTERN STRING_mensagem_reinicia_totalizadores_erro
        EXTERN STRING_mensagem_reset_fabrica
        EXTERN STRING_menu_avancado
        EXTERN STRING_titulo_edita_serial
        EXTERN STRING_titulo_menu_avancado
        EXTERN STRING_titulo_padrao_fabrica
        EXTERN STRING_write_to_internal
        EXTERN TELASENHA_checa_contrasenha
        EXTERN TELASENHA_get_senha
        EXTERN TELASENHA_telaSenha
        EXTERN __aeabi_memcpy4
        EXTERN vTaskDelay

        PUBLIC MENUAVANCADO_cadastra_senha_admin
        PUBLIC MENUAVANCADO_configura_fator_compensavao
        PUBLIC MENUAVANCADO_configura_flag_correcao_erro
        PUBLIC MENUAVANCADO_configura_hora_data
        PUBLIC MENUAVANCADO_configura_numero_serie
        PUBLIC MENUAVANCADO_entry
        PUBLIC MENUAVANCADO_func
        PUBLIC MENUAVANCADO_menu_ganhos_PID
        PUBLIC MENUAVANCADO_padrao_fabrica
        PUBLIC MENUAVANCADO_reset_totalizadores_permanentes
        
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
`?<Constant "   Mais Pipoca  ">`:
        DATA
        DC8 "   Mais Pipoca  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%06d">`:
        DATA
        DC8 "%06d"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ERRO MOTOR">`:
        DATA
        DC8 "ERRO MOTOR"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "ON "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "OFF"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "FATOR TEMP">`:
        DATA
        DC8 "FATOR TEMP"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%1d oC">`:
        DATA
        DC8 "%1d oC"
        DC8 0
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Aplicacao\menu_avancado.c
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
//   17 |       Arquivo            :  menu_avancado.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  30/05/2017
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
//   35 #include "menu_rolagem.h"
//   36 #include "menu_ajuste_relogio.h"
//   37 
//   38 /***********************************************************************************
//   39 *       Definições locais
//   40 ***********************************************************************************/
//   41 
//   42 
//   43 /***********************************************************************************
//   44 *       Macros locais
//   45 ***********************************************************************************/
//   46 
//   47 
//   48 /***********************************************************************************
//   49 *       Constantes locais
//   50 ***********************************************************************************/
//   51 
//   52 
//   53 /***********************************************************************************
//   54 *       Variaveis locais
//   55 ***********************************************************************************/
//   56 
//   57 
//   58 /***********************************************************************************
//   59 *       Funções locais
//   60 ***********************************************************************************/
//   61 void MENUAVANCADO_padrao_fabrica(void);
//   62 void MENUAVANCADO_cadastra_senha_admin(void);
//   63 void MENUAVANCADO_reset_totalizadores_permanentes(void);
//   64 void MENUAVANCADO_configura_numero_serie(void);
//   65 void MENUAVANCADO_menu_ganhos_PID(void);
//   66 void MENUAVANCADO_configura_hora_data(void);
//   67 void MENUAVANCADO_configura_flag_correcao_erro(void);
//   68 void MENUAVANCADO_configura_fator_compensavao(void);
//   69 
//   70 /***********************************************************************************
//   71 *       Tabela de funções
//   72 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   73 void(*const MENUAVANCADO_func[])(void)={
MENUAVANCADO_func:
        DATA
        DC32 MENUAVANCADO_padrao_fabrica, MENUAVANCADO_cadastra_senha_admin
        DC32 MENUAVANCADO_reset_totalizadores_permanentes
        DC32 MENUAVANCADO_menu_ganhos_PID, MENUAVANCADO_configura_numero_serie
        DC32 MENUAVANCADO_configura_hora_data
        DC32 MENUAVANCADO_configura_flag_correcao_erro
        DC32 MENUAVANCADO_configura_fator_compensavao, 0H
//   74   MENUAVANCADO_padrao_fabrica,
//   75   MENUAVANCADO_cadastra_senha_admin,
//   76   MENUAVANCADO_reset_totalizadores_permanentes,
//   77   MENUAVANCADO_menu_ganhos_PID,
//   78   MENUAVANCADO_configura_numero_serie,
//   79   MENUAVANCADO_configura_hora_data,
//   80   MENUAVANCADO_configura_flag_correcao_erro,
//   81   MENUAVANCADO_configura_fator_compensavao,
//   82   NULL
//   83 };
//   84 /***********************************************************************************
//   85 *       Implementação das funções
//   86 ***********************************************************************************/
//   87 
//   88 /***********************************************************************************
//   89 *       Descrição       :       Ponto de entrada para o menu avançado
//   90 *       Parametros      :       nenhum
//   91 *       Retorno         :       nenhum
//   92 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MENUAVANCADO_entry
        THUMB
//   93 void MENUAVANCADO_entry(void){
MENUAVANCADO_entry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   94   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//   95   
//   96   // Senha para acesso,caso inválida
//   97   // não abre o menu
//   98   if(!TELASENHA_telaSenha(SENHA_MENU_AVANCADO))
        MOVW     R0,#+6651
          CFI FunCall TELASENHA_telaSenha
        BL       TELASENHA_telaSenha
        CMP      R0,#+0
        BEQ.N    ??MENUAVANCADO_entry_0
//   99     return;
//  100     
//  101   MENUROLAGEM_show((char*)STRING_titulo_menu_avancado[idioma],
//  102                    (char**)STRING_menu_avancado[idioma],
//  103                    QTD_OPCOES_AVANCADO,
//  104                    (void(**)(void))MENUAVANCADO_func);   
??MENUAVANCADO_entry_1:
        LDR.N    R3,??DataTable7_2
        MOVS     R2,#+9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+36
        LDR.N    R1,??DataTable7_3
        MLA      R1,R0,R4,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_4
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MENUROLAGEM_show
        BL       MENUROLAGEM_show
//  105 }
??MENUAVANCADO_entry_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//  106 /***********************************************************************************
//  107 *       Descrição       :       Restaura as configurações padrão para a memória
//  108 *                               flash da máquina
//  109 *       Parametros      :       nenhum
//  110 *       Retorno         :       nenhum
//  111 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MENUAVANCADO_padrao_fabrica
        THUMB
//  112 void MENUAVANCADO_padrao_fabrica(void){
MENUAVANCADO_padrao_fabrica:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+32
          CFI CFA R13+40
//  113   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  114   unsigned int valor;  
//  115   unsigned char flag;//1234567890123456 
//  116   char msg_padrao[17]="   Mais Pipoca  ";
        ADD      R0,SP,#+8
        LDR.N    R1,??DataTable7_5
        MOVS     R2,#+20
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
//  117   
//  118   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_padrao_fabrica[idioma],NULL);
        MOVS     R2,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_6
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  119     
//  120   if(TELASENHA_telaSenha(SENHA_PADRAO_FABRICA)){
        MOVW     R0,#+3214
          CFI FunCall TELASENHA_telaSenha
        BL       TELASENHA_telaSenha
        CMP      R0,#+0
        BEQ.N    ??MENUAVANCADO_padrao_fabrica_0
//  121     
//  122     STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_reset_fabrica[idioma][0],
//  123                                            (char*)STRING_mensagem_reset_fabrica[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_7
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_7
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  124     
//  125     // Valor da pipoca R$ 4,00
//  126     valor = PADRAO_VALOR_PIPOCA;
        MOV      R0,#+500
        STR      R0,[SP, #+0]
//  127     PARAMETROS_grava(ADR_VALOR_PIPOCA,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  128     
//  129     // Apenas cédula 
//  130     flag = PADRAO_CEDULAS_HABILITADA;
        MOVS     R0,#+3
        STRB     R0,[SP, #+4]
//  131     PARAMETROS_grava(ADR_NOTAS,(void*)&flag);
        ADD      R1,SP,#+4
        MOVS     R0,#+2
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  132                      
//  133     // Configura o tempo em que o motor da embalagem
//  134     // fica ligado
//  135     valor = PADRAO_TEMPO_EMBALAGEM;
        MOV      R0,#+4000
        STR      R0,[SP, #+0]
//  136     PARAMETROS_grava(ADR_TEMPO_EMBALAGEM,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+28
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  137     
//  138     // Configura para a fita led ficar piscando 
//  139     flag = PADRAO_HABILITA_FITA_LED;
        MOVS     R0,#+255
        STRB     R0,[SP, #+4]
//  140     PARAMETROS_grava(ADR_FLAG_FITA_LED,(void*)&flag);
        ADD      R1,SP,#+4
        MOVS     R0,#+33
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  141     
//  142     // Configura para o volume da música para 50%
//  143     valor = PADRAO_VOLUME_MUSICA;
        MOVS     R0,#+50
        STR      R0,[SP, #+0]
//  144     PARAMETROS_grava(ADR_VOLUME_MUSICA,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+29
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  145     
//  146     // Configura para o volume da voz ficar em 50%
//  147     valor = PADRAO_VOLUME_VOZ;
        MOVS     R0,#+50
        STR      R0,[SP, #+0]
//  148     PARAMETROS_grava(ADR_VOLUME_VOZ,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+30
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  149     
//  150     // Configura para a propaganda rodar a cada
//  151     // 30 minutos
//  152     valor = PADRAO_INTERVALO_PROPAGANDA;
        MOVS     R0,#+10
        STR      R0,[SP, #+0]
//  153     PARAMETROS_grava(ADR_INTERVALO_TEMPO_PROP,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+31
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  154     
//  155     // Configura para a máquina não utilizar troco
//  156     flag = PADRAO_FLAG_TROCO;
        MOVS     R0,#+0
        STRB     R0,[SP, #+4]
//  157     PARAMETROS_grava(ADR_FLAG_TROCO,(void*)&flag);
        ADD      R1,SP,#+4
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  158     
//  159     // Configura para não entrar no modo pipoca grátis
//  160     flag = PADRAO_GRATIS;
        MOVS     R0,#+0
        STRB     R0,[SP, #+4]
//  161     PARAMETROS_grava(ADR_FLAG_FREE,(void*)&flag);
        ADD      R1,SP,#+4
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  162     
//  163     // Configura a temperatura de trabalho
//  164     valor = PADRAO_TEMPERATURA;
        MOVS     R0,#+85
        STR      R0,[SP, #+0]
//  165     PARAMETROS_grava(ADR_TEMPERATURA_PREPARACAO,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+26
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  166     
//  167     // Configura a velocidade do motor do ar
//  168     valor = PADRAO_ROTACAO_PREPARO;
        MOVW     R0,#+5700
        STR      R0,[SP, #+0]
//  169     PARAMETROS_grava(ADR_VELOCIDADE_PREPARACAO,(void*)&valor);    
        ADD      R1,SP,#+0
        MOVS     R0,#+27
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  170     
//  171     // Grava as mensagens de cliente como Mais PIpoca
//  172     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_01,(void*)msg_padrao);
        ADD      R1,SP,#+8
        MOVS     R0,#+60
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  173     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_02,(void*)msg_padrao);
        ADD      R1,SP,#+8
        MOVS     R0,#+61
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  174     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_03,(void*)msg_padrao);
        ADD      R1,SP,#+8
        MOVS     R0,#+62
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  175     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_04,(void*)msg_padrao);
        ADD      R1,SP,#+8
        MOVS     R0,#+63
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  176   }
//  177 }
??MENUAVANCADO_padrao_fabrica_0:
        ADD      SP,SP,#+32
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  178 /***********************************************************************************
//  179 *       Descrição       :       Tela para cadastro da nova senha de administrador
//  180 *       Parametros      :       nenhum
//  181 *       Retorno         :       nenhum
//  182 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MENUAVANCADO_cadastra_senha_admin
        THUMB
//  183 void MENUAVANCADO_cadastra_senha_admin(void){
MENUAVANCADO_cadastra_senha_admin:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
//  184   unsigned int senha;
//  185   unsigned int s1,s2;
//  186   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  187   
//  188   PARAMETROS_le(ADR_SENHA_ADMIN,(void*)&senha);
        ADD      R1,SP,#+0
        MOVS     R0,#+35
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  189   
//  190   if(senha>9999)
        LDR      R0,[SP, #+0]
        MOVW     R1,#+10000
        CMP      R0,R1
        BCC.N    ??MENUAVANCADO_cadastra_senha_admin_0
//  191     senha = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  192   
//  193   // Senha para acesso,caso inválida
//  194   // não abre o menu
//  195   if(!TELASENHA_telaSenha(senha))
??MENUAVANCADO_cadastra_senha_admin_0:
        LDR      R0,[SP, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall TELASENHA_telaSenha
        BL       TELASENHA_telaSenha
        CMP      R0,#+0
        BEQ.N    ??MENUAVANCADO_cadastra_senha_admin_1
//  196     return;  
//  197   
//  198   s1 = TELASENHA_get_senha((char*)STRING_mensagem_inserir_senha[idioma]);
??MENUAVANCADO_cadastra_senha_admin_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_8
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall TELASENHA_get_senha
        BL       TELASENHA_get_senha
        STR      R0,[SP, #+4]
//  199   s2 = TELASENHA_get_senha((char*)STRING_mensagem_inserir_senha[idioma]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_8
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall TELASENHA_get_senha
        BL       TELASENHA_get_senha
//  200   
//  201   if(s1 == s2){
        LDR      R1,[SP, #+4]
        CMP      R1,R0
        BNE.N    ??MENUAVANCADO_cadastra_senha_admin_3
//  202     // Desenha a mensagem confirmando a gravação
//  203     // da nova senha
//  204     STRING_write_to_internal(CLEAR_DISPLAY,
//  205                             (char*)STRING_mensagem_cadastro_senha[idioma][0],
//  206                             (char*)STRING_mensagem_cadastro_senha[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_9
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_9
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  207     
//  208     // Grava a nova senha na memória flash
//  209     PARAMETROS_grava(ADR_SENHA_ADMIN,(void*)&s1);    
        ADD      R1,SP,#+4
        MOVS     R0,#+35
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
        B.N      ??MENUAVANCADO_cadastra_senha_admin_4
//  210   }
//  211   else
//  212     STRING_write_to_internal(CLEAR_DISPLAY,
//  213                             (char*)STRING_mensagem_cadastro_senha_erro[idioma][0],
//  214                             (char*)STRING_mensagem_cadastro_senha_erro[idioma][1]);
??MENUAVANCADO_cadastra_senha_admin_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_10
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_10
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  215    
//  216   vTaskDelay(3000);
??MENUAVANCADO_cadastra_senha_admin_4:
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  217 }
??MENUAVANCADO_cadastra_senha_admin_1:
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock2
//  218 /***********************************************************************************
//  219 *       Descrição       :       Faz o reset dos totalizadores permanentes da 
//  220 *                               máquina
//  221 *       Parametros      :       nenhum
//  222 *       Retorno         :       nenhum
//  223 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MENUAVANCADO_reset_totalizadores_permanentes
        THUMB
//  224 void MENUAVANCADO_reset_totalizadores_permanentes(void){
MENUAVANCADO_reset_totalizadores_permanentes:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  225   unsigned char idioma = APLICACAO_carrega_idioma();    
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  226   
//  227   if(TELASENHA_checa_contrasenha(NULL)){    
        MOVS     R0,#+0
          CFI FunCall TELASENHA_checa_contrasenha
        BL       TELASENHA_checa_contrasenha
        CMP      R0,#+0
        BEQ.N    ??MENUAVANCADO_reset_totalizadores_permanentes_0
//  228     STRING_write_to_internal(CLEAR_DISPLAY,
//  229                             (char*)STRING_mensagem_reinicia_totalizadores[idioma][0],
//  230                             (char*)STRING_mensagem_reinicia_totalizadores[idioma][1]);    
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_11
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_11
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  231            
//  232     FATURAMENTO_set_contagem_parcial(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_contagem_parcial
        BL       FATURAMENTO_set_contagem_parcial
//  233     FATURAMENTO_set_arrecadacao_parcial(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_arrecadacao_parcial
        BL       FATURAMENTO_set_arrecadacao_parcial
//  234     FATURAMENTO_set_contagem_cartao_parcial(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_contagem_cartao_parcial
        BL       FATURAMENTO_set_contagem_cartao_parcial
//  235     FATURAMENTO_set_arrecadacao_cartao_parcial(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_arrecadacao_cartao_parcial
        BL       FATURAMENTO_set_arrecadacao_cartao_parcial
//  236         
//  237     FATURAMENTO_set_contagem_total(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_contagem_total
        BL       FATURAMENTO_set_contagem_total
//  238     FATURAMENTO_set_arrecadacao_total(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_arrecadacao_total
        BL       FATURAMENTO_set_arrecadacao_total
//  239     FATURAMENTO_set_contagem_cartao_total(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_contagem_cartao_total
        BL       FATURAMENTO_set_contagem_cartao_total
//  240     FATURAMENTO_set_arrecadacao_cartao_total(0);    
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_arrecadacao_cartao_total
        BL       FATURAMENTO_set_arrecadacao_cartao_total
//  241     
//  242     FTP_formata_fila(); // Apaga os eventos de troca de preço da pipoca
          CFI FunCall FTP_formata_fila
        BL       FTP_formata_fila
//  243     
//  244     FATURAMENTO_reinicia_pipocas_teste();
          CFI FunCall FATURAMENTO_reinicia_pipocas_teste
        BL       FATURAMENTO_reinicia_pipocas_teste
        B.N      ??MENUAVANCADO_reset_totalizadores_permanentes_1
//  245   }
//  246   else{    
//  247     STRING_write_to_internal(CLEAR_DISPLAY,
//  248                             (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][0],
//  249                             (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][1]);            
??MENUAVANCADO_reset_totalizadores_permanentes_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_12
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_12
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  250   }
//  251   
//  252   vTaskDelay(3000);
??MENUAVANCADO_reset_totalizadores_permanentes_1:
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  253 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3
//  254 /***********************************************************************************
//  255 *       Descrição       :       Entra no menu para configuração dos
//  256 *                               ganhos do PID do motor
//  257 *       Parametros      :       nenhum
//  258 *       Retorno         :       nenhum
//  259 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MENUAVANCADO_menu_ganhos_PID
        THUMB
//  260 void MENUAVANCADO_menu_ganhos_PID(void){
MENUAVANCADO_menu_ganhos_PID:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  261   unsigned char idioma = APLICACAO_carrega_idioma();    
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  262   
//  263   // Menu para configuração 
//  264   // dos parâmetros do PID
//  265   // do motor
//  266   if(TELASENHA_checa_contrasenha(NULL)){    
        MOVS     R0,#+0
          CFI FunCall TELASENHA_checa_contrasenha
        BL       TELASENHA_checa_contrasenha
        CMP      R0,#+0
        BNE.N    ??MENUAVANCADO_menu_ganhos_PID_0
//  267     
//  268     
//  269   }
//  270   else{    
//  271     STRING_write_to_internal(CLEAR_DISPLAY,
//  272                             (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][0],
//  273                             (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][1]);            
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_12
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_12
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  274   }
//  275   
//  276   vTaskDelay(3000);
??MENUAVANCADO_menu_ganhos_PID_0:
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  277 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4
//  278 /***********************************************************************************
//  279 *       Descrição       :       Configura o número de série da máquina
//  280 *       Parametros      :       nenhum
//  281 *       Retorno         :       nenhum
//  282 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MENUAVANCADO_configura_numero_serie
        THUMB
//  283 void MENUAVANCADO_configura_numero_serie(void){
MENUAVANCADO_configura_numero_serie:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
//  284   unsigned char idioma = APLICACAO_carrega_idioma();    
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  285   
//  286   if(TELASENHA_checa_contrasenha(NULL)){ 
        MOVS     R0,#+0
          CFI FunCall TELASENHA_checa_contrasenha
        BL       TELASENHA_checa_contrasenha
        CMP      R0,#+0
        BEQ.N    ??MENUAVANCADO_configura_numero_serie_0
//  287             
//  288      unsigned int numero = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
//  289      PARAMETROS_le(ADR_NUMERO_SERIE,(void*)&numero);
        ADD      R1,SP,#+4
        MOVS     R0,#+36
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  290      
//  291      if(numero>999999)
        LDR      R0,[SP, #+4]
        LDR.N    R1,??DataTable7_13  ;; 0xf4240
        CMP      R0,R1
        BCC.N    ??MENUAVANCADO_configura_numero_serie_1
//  292        numero = 100;
        MOVS     R0,#+100
        STR      R0,[SP, #+4]
//  293      
//  294      if(numero<1200)
??MENUAVANCADO_configura_numero_serie_1:
        LDR      R0,[SP, #+4]
        CMP      R0,#+1200
        BCS.N    ??MENUAVANCADO_configura_numero_serie_2
//  295        numero = 1200;
        MOV      R0,#+1200
        STR      R0,[SP, #+4]
//  296      
//  297      numero = MEI_entry((char*)STRING_titulo_edita_serial[idioma],
//  298                         "%06d",
//  299                         numero,
//  300                         1,
//  301                         999999);
??MENUAVANCADO_configura_numero_serie_2:
        LDR.N    R0,??DataTable7_14  ;; 0xf423f
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        LDR      R2,[SP, #+4]
        LDR.N    R1,??DataTable7_15
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_16
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEI_entry
        BL       MEI_entry
        STR      R0,[SP, #+4]
//  302      
//  303      PARAMETROS_grava(ADR_NUMERO_SERIE,(void*)&numero);
        ADD      R1,SP,#+4
        MOVS     R0,#+36
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
        B.N      ??MENUAVANCADO_configura_numero_serie_3
//  304   }
//  305   else{    
//  306     STRING_write_to_internal(CLEAR_DISPLAY,
//  307                             (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][0],
//  308                             (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][1]);            
??MENUAVANCADO_configura_numero_serie_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_12
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable7_12
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  309   }
//  310 }
??MENUAVANCADO_configura_numero_serie_3:
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock5
//  311 /***********************************************************************************
//  312 *       Descrição       :       Tela para configuração da hora e data
//  313 *                               do sistema
//  314 *       Parametros      :       nenhum
//  315 *       Retorno         :       nenhum
//  316 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MENUAVANCADO_configura_hora_data
        THUMB
//  317 void MENUAVANCADO_configura_hora_data(void){
MENUAVANCADO_configura_hora_data:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  318   
//  319   IAR_entry();
          CFI FunCall IAR_entry
        BL       IAR_entry
//  320 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6
//  321 /***********************************************************************************
//  322 *       Descrição       :       Tela para configuração do flag que habilita
//  323 *                               a correção de erro no motor do ar
//  324 *       Parametros      :       nenhum
//  325 *       Retorno         :       nenhum
//  326 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function MENUAVANCADO_configura_flag_correcao_erro
        THUMB
//  327 void MENUAVANCADO_configura_flag_correcao_erro(void){
MENUAVANCADO_configura_flag_correcao_erro:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  328   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  329   unsigned char flag;
//  330   
//  331   PARAMETROS_le(ADR_COMPENSADOR_ERRO_ROTACAO,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+64
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  332   
//  333   flag = MEF_entry("ERRO MOTOR",flag,"ON ","OFF");    
        ADR.N    R3,??DataTable7  ;; "OFF"
        ADR.N    R2,??DataTable7_1  ;; "ON "
        LDRB     R1,[SP, #+0]
        LDR.N    R0,??DataTable7_17
          CFI FunCall MEF_entry
        BL       MEF_entry
        STRB     R0,[SP, #+0]
//  334   
//  335   PARAMETROS_grava(ADR_COMPENSADOR_ERRO_ROTACAO,(void*)&flag);
        ADD      R1,SP,#+0
        MOVS     R0,#+64
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  336 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock7
//  337 /***********************************************************************************
//  338 *       Descrição       :      Tela para configuração do fator de compensação
//  339 *                              do controle de temperatura
//  340 *       Parametros      :       nenhum
//  341 *       Retorno         :       nenhum
//  342 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function MENUAVANCADO_configura_fator_compensavao
        THUMB
//  343 void MENUAVANCADO_configura_fator_compensavao(void){
MENUAVANCADO_configura_fator_compensavao:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+12
          CFI CFA R13+16
//  344   unsigned int valor;
//  345 
//  346   PARAMETROS_le(ADR_FATOR_COMPENSADOR,(void*)&valor);
        ADD      R1,SP,#+4
        MOVS     R0,#+65
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  347 
//  348   valor = MEI_entry("FATOR TEMP","%1d oC",valor,1,3);    
        MOVS     R0,#+3
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        LDR      R2,[SP, #+4]
        LDR.N    R1,??DataTable7_18
        LDR.N    R0,??DataTable7_19
          CFI FunCall MEI_entry
        BL       MEI_entry
        STR      R0,[SP, #+4]
//  349   
//  350   PARAMETROS_grava(ADR_FATOR_COMPENSADOR,(void*)&valor);
        ADD      R1,SP,#+4
        MOVS     R0,#+65
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  351 }
        POP      {R0-R2,PC}       ;; return
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC8      "OFF"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC8      "ON "

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     MENUAVANCADO_func

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     STRING_menu_avancado

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     STRING_titulo_menu_avancado

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     `?<Constant "   Mais Pipoca  ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     STRING_titulo_padrao_fabrica

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     STRING_mensagem_reset_fabrica

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     STRING_mensagem_inserir_senha

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     STRING_mensagem_cadastro_senha

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     STRING_mensagem_cadastro_senha_erro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_11:
        DC32     STRING_mensagem_reinicia_totalizadores

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_12:
        DC32     STRING_mensagem_reinicia_totalizadores_erro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_13:
        DC32     0xf4240

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_14:
        DC32     0xf423f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_15:
        DC32     `?<Constant "%06d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_16:
        DC32     STRING_titulo_edita_serial

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_17:
        DC32     `?<Constant "ERRO MOTOR">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_18:
        DC32     `?<Constant "%1d oC">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_19:
        DC32     `?<Constant "FATOR TEMP">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  352 /***********************************************************************************
//  353 *       Fim do arquivo
//  354 ***********************************************************************************/
// 
// 104 bytes in section .rodata
// 920 bytes in section .text
// 
// 920 bytes of CODE  memory
// 104 bytes of CONST memory
//
//Errors: none
//Warnings: 4
