///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     06/Jul/2017  16:40:19 /
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
//   67 
//   68 /***********************************************************************************
//   69 *       Tabela de funções
//   70 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   71 void(*const MENUAVANCADO_func[])(void)={
MENUAVANCADO_func:
        DATA
        DC32 MENUAVANCADO_padrao_fabrica, MENUAVANCADO_cadastra_senha_admin
        DC32 MENUAVANCADO_reset_totalizadores_permanentes
        DC32 MENUAVANCADO_menu_ganhos_PID, MENUAVANCADO_configura_numero_serie
        DC32 MENUAVANCADO_configura_hora_data, 0H
//   72   MENUAVANCADO_padrao_fabrica,
//   73   MENUAVANCADO_cadastra_senha_admin,
//   74   MENUAVANCADO_reset_totalizadores_permanentes,
//   75   MENUAVANCADO_menu_ganhos_PID,
//   76   MENUAVANCADO_configura_numero_serie,
//   77   MENUAVANCADO_configura_hora_data,
//   78   NULL
//   79 };
//   80 /***********************************************************************************
//   81 *       Implementação das funções
//   82 ***********************************************************************************/
//   83 
//   84 /***********************************************************************************
//   85 *       Descrição       :       Ponto de entrada para o menu avançado
//   86 *       Parametros      :       nenhum
//   87 *       Retorno         :       nenhum
//   88 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function MENUAVANCADO_entry
        THUMB
//   89 void MENUAVANCADO_entry(void){
MENUAVANCADO_entry:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   90   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//   91   
//   92   // Senha para acesso,caso inválida
//   93   // não abre o menu
//   94   if(!TELASENHA_telaSenha(SENHA_MENU_AVANCADO))
        MOVW     R0,#+6651
          CFI FunCall TELASENHA_telaSenha
        BL       TELASENHA_telaSenha
        CMP      R0,#+0
        BEQ.N    ??MENUAVANCADO_entry_0
//   95     return;
//   96     
//   97   MENUROLAGEM_show((char*)STRING_titulo_menu_avancado[idioma],
//   98                    (char**)STRING_menu_avancado[idioma],
//   99                    QTD_OPCOES_AVANCADO,
//  100                    (void(**)(void))MENUAVANCADO_func);   
??MENUAVANCADO_entry_1:
        LDR.N    R3,??DataTable5
        MOVS     R2,#+7
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+28
        LDR.N    R1,??DataTable5_1
        MLA      R1,R0,R4,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MENUROLAGEM_show
        BL       MENUROLAGEM_show
//  101 }
??MENUAVANCADO_entry_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//  102 /***********************************************************************************
//  103 *       Descrição       :       Restaura as configurações padrão para a memória
//  104 *                               flash da máquina
//  105 *       Parametros      :       nenhum
//  106 *       Retorno         :       nenhum
//  107 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function MENUAVANCADO_padrao_fabrica
        THUMB
//  108 void MENUAVANCADO_padrao_fabrica(void){
MENUAVANCADO_padrao_fabrica:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+32
          CFI CFA R13+40
//  109   unsigned char idioma = APLICACAO_carrega_idioma();
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  110   unsigned int valor;  
//  111   unsigned char flag;//1234567890123456 
//  112   char msg_padrao[17]="   Mais Pipoca  ";
        ADD      R0,SP,#+8
        LDR.N    R1,??DataTable5_3
        MOVS     R2,#+20
          CFI FunCall __aeabi_memcpy4
        BL       __aeabi_memcpy4
//  113   
//  114   STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_padrao_fabrica[idioma],NULL);
        MOVS     R2,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_4
        LDR      R1,[R0, R4, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  115     
//  116   if(TELASENHA_telaSenha(SENHA_PADRAO_FABRICA)){
        MOVW     R0,#+3214
          CFI FunCall TELASENHA_telaSenha
        BL       TELASENHA_telaSenha
        CMP      R0,#+0
        BEQ.N    ??MENUAVANCADO_padrao_fabrica_0
//  117     
//  118     STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_reset_fabrica[idioma][0],
//  119                                            (char*)STRING_mensagem_reset_fabrica[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_5
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_5
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  120     
//  121     // Valor da pipoca R$ 4,00
//  122     valor = PADRAO_VALOR_PIPOCA;
        MOV      R0,#+500
        STR      R0,[SP, #+0]
//  123     PARAMETROS_grava(ADR_VALOR_PIPOCA,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+3
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  124     
//  125     // Apenas cédula 
//  126     flag = PADRAO_CEDULAS_HABILITADA;
        MOVS     R0,#+3
        STRB     R0,[SP, #+4]
//  127     PARAMETROS_grava(ADR_NOTAS,(void*)&flag);
        ADD      R1,SP,#+4
        MOVS     R0,#+2
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  128                      
//  129     // Configura o tempo em que o motor da embalagem
//  130     // fica ligado
//  131     valor = PADRAO_TEMPO_EMBALAGEM;
        MOV      R0,#+4000
        STR      R0,[SP, #+0]
//  132     PARAMETROS_grava(ADR_TEMPO_EMBALAGEM,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+28
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  133     
//  134     // Configura para a fita led ficar piscando 
//  135     flag = PADRAO_HABILITA_FITA_LED;
        MOVS     R0,#+255
        STRB     R0,[SP, #+4]
//  136     PARAMETROS_grava(ADR_FLAG_FITA_LED,(void*)&flag);
        ADD      R1,SP,#+4
        MOVS     R0,#+33
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  137     
//  138     // Configura para o volume da música para 50%
//  139     valor = PADRAO_VOLUME_MUSICA;
        MOVS     R0,#+50
        STR      R0,[SP, #+0]
//  140     PARAMETROS_grava(ADR_VOLUME_MUSICA,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+29
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  141     
//  142     // Configura para o volume da voz ficar em 50%
//  143     valor = PADRAO_VOLUME_VOZ;
        MOVS     R0,#+50
        STR      R0,[SP, #+0]
//  144     PARAMETROS_grava(ADR_VOLUME_VOZ,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+30
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  145     
//  146     // Configura para a propaganda rodar a cada
//  147     // 30 minutos
//  148     valor = PADRAO_INTERVALO_PROPAGANDA;
        MOVS     R0,#+10
        STR      R0,[SP, #+0]
//  149     PARAMETROS_grava(ADR_INTERVALO_TEMPO_PROP,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+31
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  150     
//  151     // Configura para a máquina não utilizar troco
//  152     flag = PADRAO_FLAG_TROCO;
        MOVS     R0,#+0
        STRB     R0,[SP, #+4]
//  153     PARAMETROS_grava(ADR_FLAG_TROCO,(void*)&flag);
        ADD      R1,SP,#+4
        MOVS     R0,#+34
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  154     
//  155     // Configura para não entrar no modo pipoca grátis
//  156     flag = PADRAO_GRATIS;
        MOVS     R0,#+0
        STRB     R0,[SP, #+4]
//  157     PARAMETROS_grava(ADR_FLAG_FREE,(void*)&flag);
        ADD      R1,SP,#+4
        MOVS     R0,#+32
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  158     
//  159     // Configura a temperatura de trabalho
//  160     valor = PADRAO_TEMPERATURA;
        MOVS     R0,#+85
        STR      R0,[SP, #+0]
//  161     PARAMETROS_grava(ADR_TEMPERATURA_PREPARACAO,(void*)&valor);
        ADD      R1,SP,#+0
        MOVS     R0,#+26
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  162     
//  163     // Configura a velocidade do motor do ar
//  164     valor = PADRAO_ROTACAO_PREPARO;
        MOVW     R0,#+5700
        STR      R0,[SP, #+0]
//  165     PARAMETROS_grava(ADR_VELOCIDADE_PREPARACAO,(void*)&valor);    
        ADD      R1,SP,#+0
        MOVS     R0,#+27
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  166     
//  167     // Grava as mensagens de cliente como Mais PIpoca
//  168     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_01,(void*)msg_padrao);
        ADD      R1,SP,#+8
        MOVS     R0,#+60
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  169     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_02,(void*)msg_padrao);
        ADD      R1,SP,#+8
        MOVS     R0,#+61
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  170     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_03,(void*)msg_padrao);
        ADD      R1,SP,#+8
        MOVS     R0,#+62
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  171     PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_04,(void*)msg_padrao);
        ADD      R1,SP,#+8
        MOVS     R0,#+63
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
//  172   }
//  173 }
??MENUAVANCADO_padrao_fabrica_0:
        ADD      SP,SP,#+32
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  174 /***********************************************************************************
//  175 *       Descrição       :       Tela para cadastro da nova senha de administrador
//  176 *       Parametros      :       nenhum
//  177 *       Retorno         :       nenhum
//  178 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function MENUAVANCADO_cadastra_senha_admin
        THUMB
//  179 void MENUAVANCADO_cadastra_senha_admin(void){
MENUAVANCADO_cadastra_senha_admin:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
//  180   unsigned int senha;
//  181   unsigned int s1,s2;
//  182   unsigned char idioma = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  183   
//  184   PARAMETROS_le(ADR_SENHA_ADMIN,(void*)&senha);
        ADD      R1,SP,#+0
        MOVS     R0,#+35
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  185   
//  186   if(senha>9999)
        LDR      R0,[SP, #+0]
        MOVW     R1,#+10000
        CMP      R0,R1
        BCC.N    ??MENUAVANCADO_cadastra_senha_admin_0
//  187     senha = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  188   
//  189   // Senha para acesso,caso inválida
//  190   // não abre o menu
//  191   if(!TELASENHA_telaSenha(senha))
??MENUAVANCADO_cadastra_senha_admin_0:
        LDR      R0,[SP, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall TELASENHA_telaSenha
        BL       TELASENHA_telaSenha
        CMP      R0,#+0
        BEQ.N    ??MENUAVANCADO_cadastra_senha_admin_1
//  192     return;  
//  193   
//  194   s1 = TELASENHA_get_senha((char*)STRING_mensagem_inserir_senha[idioma]);
??MENUAVANCADO_cadastra_senha_admin_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_6
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall TELASENHA_get_senha
        BL       TELASENHA_get_senha
        STR      R0,[SP, #+4]
//  195   s2 = TELASENHA_get_senha((char*)STRING_mensagem_inserir_senha[idioma]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_6
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall TELASENHA_get_senha
        BL       TELASENHA_get_senha
//  196   
//  197   if(s1 == s2){
        LDR      R1,[SP, #+4]
        CMP      R1,R0
        BNE.N    ??MENUAVANCADO_cadastra_senha_admin_3
//  198     // Desenha a mensagem confirmando a gravação
//  199     // da nova senha
//  200     STRING_write_to_internal(CLEAR_DISPLAY,
//  201                             (char*)STRING_mensagem_cadastro_senha[idioma][0],
//  202                             (char*)STRING_mensagem_cadastro_senha[idioma][1]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_7
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_7
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  203     
//  204     // Grava a nova senha na memória flash
//  205     PARAMETROS_grava(ADR_SENHA_ADMIN,(void*)&s1);    
        ADD      R1,SP,#+4
        MOVS     R0,#+35
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
        B.N      ??MENUAVANCADO_cadastra_senha_admin_4
//  206   }
//  207   else
//  208     STRING_write_to_internal(CLEAR_DISPLAY,
//  209                             (char*)STRING_mensagem_cadastro_senha_erro[idioma][0],
//  210                             (char*)STRING_mensagem_cadastro_senha_erro[idioma][1]);
??MENUAVANCADO_cadastra_senha_admin_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_8
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_8
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  211    
//  212   vTaskDelay(3000);
??MENUAVANCADO_cadastra_senha_admin_4:
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  213 }
??MENUAVANCADO_cadastra_senha_admin_1:
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock2
//  214 /***********************************************************************************
//  215 *       Descrição       :       Faz o reset dos totalizadores permanentes da 
//  216 *                               máquina
//  217 *       Parametros      :       nenhum
//  218 *       Retorno         :       nenhum
//  219 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function MENUAVANCADO_reset_totalizadores_permanentes
        THUMB
//  220 void MENUAVANCADO_reset_totalizadores_permanentes(void){
MENUAVANCADO_reset_totalizadores_permanentes:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  221   unsigned char idioma = APLICACAO_carrega_idioma();    
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  222   
//  223   if(TELASENHA_checa_contrasenha(NULL)){    
        MOVS     R0,#+0
          CFI FunCall TELASENHA_checa_contrasenha
        BL       TELASENHA_checa_contrasenha
        CMP      R0,#+0
        BEQ.N    ??MENUAVANCADO_reset_totalizadores_permanentes_0
//  224     STRING_write_to_internal(CLEAR_DISPLAY,
//  225                             (char*)STRING_mensagem_reinicia_totalizadores[idioma][0],
//  226                             (char*)STRING_mensagem_reinicia_totalizadores[idioma][1]);    
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_9
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_9
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  227            
//  228     FATURAMENTO_set_contagem_parcial(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_contagem_parcial
        BL       FATURAMENTO_set_contagem_parcial
//  229     FATURAMENTO_set_arrecadacao_parcial(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_arrecadacao_parcial
        BL       FATURAMENTO_set_arrecadacao_parcial
//  230     FATURAMENTO_set_contagem_cartao_parcial(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_contagem_cartao_parcial
        BL       FATURAMENTO_set_contagem_cartao_parcial
//  231     FATURAMENTO_set_arrecadacao_cartao_parcial(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_arrecadacao_cartao_parcial
        BL       FATURAMENTO_set_arrecadacao_cartao_parcial
//  232         
//  233     FATURAMENTO_set_contagem_total(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_contagem_total
        BL       FATURAMENTO_set_contagem_total
//  234     FATURAMENTO_set_arrecadacao_total(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_arrecadacao_total
        BL       FATURAMENTO_set_arrecadacao_total
//  235     FATURAMENTO_set_contagem_cartao_total(0);
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_contagem_cartao_total
        BL       FATURAMENTO_set_contagem_cartao_total
//  236     FATURAMENTO_set_arrecadacao_cartao_total(0);    
        MOVS     R0,#+0
          CFI FunCall FATURAMENTO_set_arrecadacao_cartao_total
        BL       FATURAMENTO_set_arrecadacao_cartao_total
//  237     
//  238     FTP_formata_fila(); // Apaga os eventos de troca de preço da pipoca
          CFI FunCall FTP_formata_fila
        BL       FTP_formata_fila
//  239     
//  240     FATURAMENTO_reinicia_pipocas_teste();
          CFI FunCall FATURAMENTO_reinicia_pipocas_teste
        BL       FATURAMENTO_reinicia_pipocas_teste
        B.N      ??MENUAVANCADO_reset_totalizadores_permanentes_1
//  241   }
//  242   else{    
//  243     STRING_write_to_internal(CLEAR_DISPLAY,
//  244                             (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][0],
//  245                             (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][1]);            
??MENUAVANCADO_reset_totalizadores_permanentes_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_10
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_10
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  246   }
//  247   
//  248   vTaskDelay(3000);
??MENUAVANCADO_reset_totalizadores_permanentes_1:
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  249 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3
//  250 /***********************************************************************************
//  251 *       Descrição       :       Entra no menu para configuração dos
//  252 *                               ganhos do PID do motor
//  253 *       Parametros      :       nenhum
//  254 *       Retorno         :       nenhum
//  255 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function MENUAVANCADO_menu_ganhos_PID
        THUMB
//  256 void MENUAVANCADO_menu_ganhos_PID(void){
MENUAVANCADO_menu_ganhos_PID:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  257   unsigned char idioma = APLICACAO_carrega_idioma();    
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  258   
//  259   // Menu para configuração 
//  260   // dos parâmetros do PID
//  261   // do motor
//  262   if(TELASENHA_checa_contrasenha(NULL)){    
        MOVS     R0,#+0
          CFI FunCall TELASENHA_checa_contrasenha
        BL       TELASENHA_checa_contrasenha
        CMP      R0,#+0
        BNE.N    ??MENUAVANCADO_menu_ganhos_PID_0
//  263     
//  264     
//  265   }
//  266   else{    
//  267     STRING_write_to_internal(CLEAR_DISPLAY,
//  268                             (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][0],
//  269                             (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][1]);            
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_10
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_10
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  270   }
//  271   
//  272   vTaskDelay(3000);
??MENUAVANCADO_menu_ganhos_PID_0:
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  273 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4
//  274 /***********************************************************************************
//  275 *       Descrição       :       Configura o número de série da máquina
//  276 *       Parametros      :       nenhum
//  277 *       Retorno         :       nenhum
//  278 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function MENUAVANCADO_configura_numero_serie
        THUMB
//  279 void MENUAVANCADO_configura_numero_serie(void){
MENUAVANCADO_configura_numero_serie:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
//  280   unsigned char idioma = APLICACAO_carrega_idioma();    
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        MOVS     R4,R0
//  281   
//  282   if(TELASENHA_checa_contrasenha(NULL)){ 
        MOVS     R0,#+0
          CFI FunCall TELASENHA_checa_contrasenha
        BL       TELASENHA_checa_contrasenha
        CMP      R0,#+0
        BEQ.N    ??MENUAVANCADO_configura_numero_serie_0
//  283             
//  284      unsigned int numero = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
//  285      PARAMETROS_le(ADR_NUMERO_SERIE,(void*)&numero);
        ADD      R1,SP,#+4
        MOVS     R0,#+36
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  286      
//  287      if(numero>999999)
        LDR      R0,[SP, #+4]
        LDR.N    R1,??DataTable5_11  ;; 0xf4240
        CMP      R0,R1
        BCC.N    ??MENUAVANCADO_configura_numero_serie_1
//  288        numero = 100;
        MOVS     R0,#+100
        STR      R0,[SP, #+4]
//  289      
//  290      if(numero<1200)
??MENUAVANCADO_configura_numero_serie_1:
        LDR      R0,[SP, #+4]
        CMP      R0,#+1200
        BCS.N    ??MENUAVANCADO_configura_numero_serie_2
//  291        numero = 1200;
        MOV      R0,#+1200
        STR      R0,[SP, #+4]
//  292      
//  293      numero = MEI_entry((char*)STRING_titulo_edita_serial[idioma],
//  294                         "%06d",
//  295                         numero,
//  296                         1,
//  297                         999999);
??MENUAVANCADO_configura_numero_serie_2:
        LDR.N    R0,??DataTable5_12  ;; 0xf423f
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        LDR      R2,[SP, #+4]
        LDR.N    R1,??DataTable5_13
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_14
        LDR      R0,[R0, R4, LSL #+2]
          CFI FunCall MEI_entry
        BL       MEI_entry
        STR      R0,[SP, #+4]
//  298      
//  299      PARAMETROS_grava(ADR_NUMERO_SERIE,(void*)&numero);
        ADD      R1,SP,#+4
        MOVS     R0,#+36
          CFI FunCall PARAMETROS_grava
        BL       PARAMETROS_grava
        B.N      ??MENUAVANCADO_configura_numero_serie_3
//  300   }
//  301   else{    
//  302     STRING_write_to_internal(CLEAR_DISPLAY,
//  303                             (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][0],
//  304                             (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][1]);            
??MENUAVANCADO_configura_numero_serie_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_10
        ADDS     R0,R0,R4, LSL #+3
        LDR      R2,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable5_10
        LDR      R1,[R0, R4, LSL #+3]
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  305   }
//  306 }
??MENUAVANCADO_configura_numero_serie_3:
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     MENUAVANCADO_func

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     STRING_menu_avancado

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     STRING_titulo_menu_avancado

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     `?<Constant "   Mais Pipoca  ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     STRING_titulo_padrao_fabrica

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     STRING_mensagem_reset_fabrica

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     STRING_mensagem_inserir_senha

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     STRING_mensagem_cadastro_senha

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     STRING_mensagem_cadastro_senha_erro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     STRING_mensagem_reinicia_totalizadores

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     STRING_mensagem_reinicia_totalizadores_erro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     0xf4240

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     0xf423f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     `?<Constant "%06d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     STRING_titulo_edita_serial
//  307 /***********************************************************************************
//  308 *       Descrição       :       Tela para configuração da hora e data
//  309 *                               do sistema
//  310 *       Parametros      :       nenhum
//  311 *       Retorno         :       nenhum
//  312 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function MENUAVANCADO_configura_hora_data
        THUMB
//  313 void MENUAVANCADO_configura_hora_data(void){
MENUAVANCADO_configura_hora_data:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  314   
//  315   IAR_entry();
          CFI FunCall IAR_entry
        BL       IAR_entry
//  316 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  317 /***********************************************************************************
//  318 *       Fim do arquivo
//  319 ***********************************************************************************/
// 
//  56 bytes in section .rodata
// 814 bytes in section .text
// 
// 814 bytes of CODE  memory
//  56 bytes of CONST memory
//
//Errors: none
//Warnings: 2
