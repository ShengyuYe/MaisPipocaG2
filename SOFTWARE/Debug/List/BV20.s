///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     13/Sep/2017  18:09:20 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamento /
//                    s\BV20.c                                                /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamento /
//                    s\BV20.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\Debu /
//                    g\List\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Debug /
//                    \List\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\O /
//                    bj\ --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\BV20.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME BV20

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN APLICACAO_carrega_idioma
        EXTERN CCTALK_leFilaEventos
        EXTERN CCTALK_rotacionaValidador
        EXTERN CCTALK_setBitsHabilitacaoCanal
        EXTERN CCTALK_setFlagHabilitacaoGeral
        EXTERN PARAMETROS_le
        EXTERN vTaskDelay
        EXTERN xQueueCreate
        EXTERN xQueueGenericReceive
        EXTERN xQueueGenericSend

        PUBLIC BV20_bloqueado
        PUBLIC BV20_decodifica_eventos
        PUBLIC BV20_estado_bloqueio
        PUBLIC BV20_estado_inicializacao
        PUBLIC BV20_estado_le_evento
        PUBLIC BV20_estado_offline
        PUBLIC BV20_estado_supervisao
        PUBLIC BV20_fila_sinais
        PUBLIC BV20_func
        PUBLIC BV20_get_current_state
        PUBLIC BV20_get_ultimo_evento
        PUBLIC BV20_get_valor_acumulador
        PUBLIC BV20_ini
        PUBLIC BV20_inicializNoteiro
        PUBLIC BV20_main
        PUBLIC BV20_mensagemExterna
        PUBLIC BV20_offline_bloqueado
        PUBLIC BV20_quantidade_eventos
        PUBLIC BV20_regiao
        PUBLIC BV20_sem_acumulador_dinheiro
        PUBLIC BV20_setter_bloqueio
        PUBLIC BV20_subtrai_valor_acumulado
        PUBLIC BV20_ultima_quantidade_eventos
        PUBLIC BV20_ultimo_evento
        PUBLIC BV20_valor_acumulado
        PUBLIC BV20_valor_canais
        PUBLIC estado_atual
        
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Drivers\Pagamentos\BV20.c
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
//   17 |       Arquivo            :  BV20.c
//   18 |       Descrição          :  Biblioteca para controle dos meios de pagamento
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  22/02/2017
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
//   35 #include "..\..\includes.h"
//   36 
//   37 /***********************************************************************************
//   38 *       Definições
//   39 ***********************************************************************************/
//   40 #define END_NOTEIRO             40
//   41 
//   42 /***********************************************************************************
//   43 *       Constantes
//   44 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   45 const unsigned short int BV20_valor_canais[QTY_OF_LANGUAGES][7]={
BV20_valor_canais:
        DATA
        DC16 0, 2, 5, 10, 20, 50, 100, 0, 2, 5, 10, 20, 50, 100, 0, 2, 5, 10
        DC16 20, 50, 100, 0, 2, 5, 10, 20, 50, 100, 0, 2, 5, 10, 20, 50, 100, 0
        DC16 2, 5, 10, 20, 50, 100, 0, 2, 5, 10, 20, 50, 100
        DC8 0, 0
//   46   [BRASIL]    = {0,2,5,10,20,50,100},
//   47   [URUGUAI]   = {0,2,5,10,20,50,100},
//   48   [ARGENTINA] = {0,2,5,10,20,50,100},
//   49   [PARAGUAI]  = {0,2,5,10,20,50,100},
//   50   [PERU]      = {0,2,5,10,20,50,100},
//   51   [EUA]       = {0,2,5,10,20,50,100},
//   52   [CANADA]    = {0,2,5,10,20,50,100}
//   53 };
//   54 
//   55 /***********************************************************************************
//   56 *       Variaveis locais
//   57 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   58 unsigned char BV20_regiao=BRASIL;
BV20_regiao:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   59 unsigned short int BV20_ultima_quantidade_eventos=0xFFFF;
BV20_ultima_quantidade_eventos:
        DATA
        DC16 65535

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   60 unsigned char BV20_quantidade_eventos=0;
BV20_quantidade_eventos:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   61 xSemaphoreHandle BV20_sem_acumulador_dinheiro;
BV20_sem_acumulador_dinheiro:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   62 xQueueHandle BV20_fila_sinais;
BV20_fila_sinais:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   63 unsigned short int BV20_valor_acumulado=0;
BV20_valor_acumulado:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   64 CCTALK_BILL_EVENTS BV20_ultimo_evento;
BV20_ultimo_evento:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   65 eBV20_state estado_atual=BV20_INICIALIZACAO;
estado_atual:
        DATA
        DC8 2

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   66 eBV20_state BV20_mensagemExterna=BV20_SEM_EVENTO;
BV20_mensagemExterna:
        DATA
        DC8 6
//   67 
//   68 /***********************************************************************************
//   69 *       Funções locais
//   70 ***********************************************************************************/
//   71 unsigned char BV20_inicializNoteiro(void);
//   72 
//   73 eBV20_state BV20_bloqueado(eBV20_state estado);
//   74 eBV20_state BV20_offline_bloqueado(eBV20_state estado);
//   75 eBV20_state BV20_estado_inicializacao(eBV20_state estado);
//   76 eBV20_state BV20_estado_offline(eBV20_state estado);
//   77 eBV20_state BV20_estado_le_evento(eBV20_state estado);
//   78 eBV20_state BV20_estado_supervisao(eBV20_state estado);
//   79 void BV20_decodifica_eventos(unsigned short int evento);
//   80 void BV20_decodifica_eventos(unsigned short int evento);
//   81 eBV20_state BV20_estado_bloqueio(eBV20_state estado);
//   82 
//   83 /***********************************************************************************
//   84 *       Tabela de funções
//   85 ***********************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   86 eBV20_state(*BV20_func[])(eBV20_state)={
BV20_func:
        DATA
        DC32 BV20_estado_bloqueio, BV20_estado_inicializacao
        DC32 BV20_estado_inicializacao, BV20_estado_offline
        DC32 BV20_estado_supervisao, BV20_estado_le_evento
//   87   BV20_estado_bloqueio,
//   88   BV20_estado_inicializacao,
//   89   BV20_estado_inicializacao,
//   90   BV20_estado_offline,
//   91   BV20_estado_supervisao,
//   92   BV20_estado_le_evento
//   93 };
//   94 
//   95 /***********************************************************************************
//   96 *       Implementação das funções
//   97 ***********************************************************************************/
//   98 
//   99 /***********************************************************************************
//  100 *       Descrição       :       Função principal do módulo
//  101 *       Parametros      :       nenhum
//  102 *       Retorno         :       nenhum
//  103 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function BV20_main
        THUMB
//  104 void BV20_main(void*pPar){  
BV20_main:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  105   
//  106   vTaskDelay(3000);
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  107   BV20_ini();
          CFI FunCall BV20_ini
        BL       BV20_ini
//  108   
//  109   for(;;){
//  110       if(BV20_mensagemExterna==BV20_BLOQUEADO || BV20_mensagemExterna==BV20_INICIALIZACAO){
??BV20_main_0:
        LDR.W    R0,??DataTable9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BV20_main_1
        LDR.W    R0,??DataTable9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??BV20_main_2
//  111         estado_atual = BV20_mensagemExterna;
??BV20_main_1:
        LDR.W    R0,??DataTable9_1
        LDR.W    R1,??DataTable9
        LDRB     R1,[R1, #+0]
        STRB     R1,[R0, #+0]
//  112         BV20_mensagemExterna = BV20_SEM_EVENTO;
        LDR.W    R0,??DataTable9
        MOVS     R1,#+6
        STRB     R1,[R0, #+0]
//  113         
//  114       }
//  115       estado_atual = BV20_func[estado_atual](estado_atual);
??BV20_main_2:
        LDR.W    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable9_1
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable9_2
        LDR      R1,[R2, R1, LSL #+2]
          CFI FunCall
        BLX      R1
        LDR.W    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
//  116       vTaskDelay(50);
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??BV20_main_0
          CFI EndBlock cfiBlock0
//  117   }    
//  118 }
//  119 /***********************************************************************************
//  120 *       Descrição       :       Inicialização do módulo
//  121 *       Parametros      :       nenhum
//  122 *       Retorno         :       nenhum
//  123 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function BV20_ini
        THUMB
//  124 void BV20_ini(void){
BV20_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  125   
//  126   vSemaphoreCreateBinary(BV20_sem_acumulador_dinheiro);
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall xQueueCreate
        BL       xQueueCreate
        LDR.W    R1,??DataTable9_3
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable9_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BV20_ini_0
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.W    R0,??DataTable9_3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  127   BV20_fila_sinais = xQueueCreate(3,sizeof(sSINAL_PAGAMENTO));  
??BV20_ini_0:
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall xQueueCreate
        BL       xQueueCreate
        LDR.W    R1,??DataTable9_4
        STR      R0,[R1, #+0]
//  128   BV20_regiao = APLICACAO_carrega_idioma();  
          CFI FunCall APLICACAO_carrega_idioma
        BL       APLICACAO_carrega_idioma
        LDR.W    R1,??DataTable9_5
        STRB     R0,[R1, #+0]
//  129 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  130 /***********************************************************************************
//  131 *       Descrição       :       Faz a inicialização do noteiro
//  132 *       Parametros      :       nenhum
//  133 *       Retorno         :       (unsigned char) maior do que zero
//  134 *                                               se conseguiu inicializar
//  135 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function BV20_inicializNoteiro
        THUMB
//  136 unsigned char BV20_inicializNoteiro(void){
BV20_inicializNoteiro:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+20
          CFI CFA R13+32
//  137   unsigned char canais=0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  138   unsigned char quantidadeEventos;
//  139   unsigned short int eventos[7];
//  140   
//  141   PARAMETROS_le(ADR_NOTAS,(void*)&canais);
        ADD      R1,SP,#+0
        MOVS     R0,#+2
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  142   
//  143   unsigned short int tentativas=3;
        MOVS     R4,#+3
//  144   unsigned char flag;
//  145   
//  146   do flag = CCTALK_leFilaEventos(END_NOTEIRO,&quantidadeEventos,eventos);
??BV20_inicializNoteiro_0:
        ADD      R2,SP,#+4
        ADD      R1,SP,#+1
        MOVS     R0,#+40
          CFI FunCall CCTALK_leFilaEventos
        BL       CCTALK_leFilaEventos
        MOVS     R5,R0
//  147   while(!flag && tentativas--);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??BV20_inicializNoteiro_1
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??BV20_inicializNoteiro_0
//  148   
//  149   if(!flag)
??BV20_inicializNoteiro_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??BV20_inicializNoteiro_2
//  150     return 0;
        MOVS     R0,#+0
        B.N      ??BV20_inicializNoteiro_3
//  151   
//  152   tentativas=3;
??BV20_inicializNoteiro_2:
        MOVS     R0,#+3
        MOVS     R4,R0
//  153   do flag = CCTALK_setBitsHabilitacaoCanal(END_NOTEIRO,canais);
??BV20_inicializNoteiro_4:
        LDRB     R1,[SP, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,#+40
          CFI FunCall CCTALK_setBitsHabilitacaoCanal
        BL       CCTALK_setBitsHabilitacaoCanal
        MOVS     R5,R0
//  154   while(!flag && tentativas--);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??BV20_inicializNoteiro_5
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??BV20_inicializNoteiro_4
//  155   
//  156   if(!flag)
??BV20_inicializNoteiro_5:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??BV20_inicializNoteiro_6
//  157     return 0;
        MOVS     R0,#+0
        B.N      ??BV20_inicializNoteiro_3
//  158   
//  159   tentativas=3;
??BV20_inicializNoteiro_6:
        MOVS     R0,#+3
        MOVS     R4,R0
//  160   do flag = CCTALK_setFlagHabilitacaoGeral(END_NOTEIRO,255);
??BV20_inicializNoteiro_7:
        MOVS     R1,#+255
        MOVS     R0,#+40
          CFI FunCall CCTALK_setFlagHabilitacaoGeral
        BL       CCTALK_setFlagHabilitacaoGeral
        MOVS     R5,R0
//  161   while(!flag && tentativas--);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??BV20_inicializNoteiro_8
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??BV20_inicializNoteiro_7
//  162   
//  163   if(!flag)
??BV20_inicializNoteiro_8:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??BV20_inicializNoteiro_9
//  164     return 0;
        MOVS     R0,#+0
        B.N      ??BV20_inicializNoteiro_3
//  165     
//  166   return 255;  
??BV20_inicializNoteiro_9:
        MOVS     R0,#+255
??BV20_inicializNoteiro_3:
        ADD      SP,SP,#+20
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock2
//  167 }
//  168 /***********************************************************************************
//  169 *       Descrição       :       Função para o testado onde o noteiro está
//  170 *                               bloqueado
//  171 *       Parametros      :       (eBV20_state) estado
//  172 *       Retorno         :       (eBV20_state) novo estado
//  173 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function BV20_bloqueado
          CFI NoCalls
        THUMB
//  174 eBV20_state BV20_bloqueado(eBV20_state estado){
//  175   
//  176   
//  177   return estado;
BV20_bloqueado:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  178 }
//  179 /***********************************************************************************
//  180 *       Descrição       :       Função para o estado em que o noteiro está
//  181 *                               bloqueado e offline
//  182 *       Parametros      :       (eBV20_state) estado
//  183 *       Retorno         :       (eBV20_state) novo estado
//  184 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function BV20_offline_bloqueado
          CFI NoCalls
        THUMB
//  185 eBV20_state BV20_offline_bloqueado(eBV20_state estado){
//  186   
//  187   
//  188   return estado;
BV20_offline_bloqueado:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  189 }
//  190 /***********************************************************************************
//  191 *       Descrição       :       Função do estado onde ocorre a inicialização
//  192 *                               do noteiro BV20
//  193 *       Parametros      :       (eBV20_state) estado_atual
//  194 *       Retorno         :       (eBV20_state) novo estado
//  195 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function BV20_estado_inicializacao
        THUMB
//  196 eBV20_state BV20_estado_inicializacao(eBV20_state estado){
BV20_estado_inicializacao:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  197   
//  198   if(BV20_inicializNoteiro()){
          CFI FunCall BV20_inicializNoteiro
        BL       BV20_inicializNoteiro
        CMP      R0,#+0
        BEQ.N    ??BV20_estado_inicializacao_0
//  199     return BV20_SUPERVISAO;
        MOVS     R0,#+4
        B.N      ??BV20_estado_inicializacao_1
//  200   }
//  201   
//  202   return BV20_OFFLINE;
??BV20_estado_inicializacao_0:
        MOVS     R0,#+3
??BV20_estado_inicializacao_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
//  203 }
//  204 /***********************************************************************************
//  205 *       Descrição       :       Função para o estado em que o noteiro
//  206 *                               está offline
//  207 *       Parametros      :       (eBV20_state) estado atual
//  208 *       Retorno         :       (eBV20_state) novo estado
//  209 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function BV20_estado_offline
          CFI NoCalls
        THUMB
//  210 eBV20_state BV20_estado_offline(eBV20_state estado){
//  211   
//  212   
//  213   return estado;
BV20_estado_offline:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  214 }
//  215 /***********************************************************************************
//  216 *       Descrição       :       Função em que trata o evento 
//  217 *                               de supervisão
//  218 *       Parametros      :       (eBV20_state) estado atual
//  219 *       Retorno         :       (eBV20_state) novo estado
//  220 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function BV20_estado_supervisao
        THUMB
//  221 eBV20_state BV20_estado_supervisao(eBV20_state estado){
BV20_estado_supervisao:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+16
          CFI CFA R13+24
        MOVS     R4,R0
//  222   unsigned short int eventos[5];
//  223   static unsigned char contador_ciclos=10;
//  224   
//  225   if(CCTALK_leFilaEventos(END_NOTEIRO,&BV20_quantidade_eventos,eventos)){    
        ADD      R2,SP,#+0
        LDR.W    R1,??DataTable9_6
        MOVS     R0,#+40
          CFI FunCall CCTALK_leFilaEventos
        BL       CCTALK_leFilaEventos
        CMP      R0,#+0
        BEQ.N    ??BV20_estado_supervisao_0
//  226     contador_ciclos=10;
        LDR.W    R0,??DataTable9_7
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  227     if(BV20_quantidade_eventos!=BV20_ultima_quantidade_eventos)
        LDR.W    R0,??DataTable9_6
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable9_8
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BEQ.N    ??BV20_estado_supervisao_1
//  228       estado = BV20_LE_EVENTO;
        MOVS     R0,#+5
        MOVS     R4,R0
        B.N      ??BV20_estado_supervisao_2
//  229     else
//  230       estado = BV20_SUPERVISAO;    
??BV20_estado_supervisao_1:
        MOVS     R0,#+4
        MOVS     R4,R0
        B.N      ??BV20_estado_supervisao_2
//  231   }
//  232   else{
//  233     // Se não receber resposta
//  234     // 10 vezes, considera o noteiro
//  235     // OFFLINE
//  236     if(contador_ciclos)
??BV20_estado_supervisao_0:
        LDR.N    R0,??DataTable9_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BV20_estado_supervisao_3
//  237       contador_ciclos--;
        LDR.N    R0,??DataTable9_7
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable9_7
        STRB     R0,[R1, #+0]
        B.N      ??BV20_estado_supervisao_2
//  238     else
//  239       estado = BV20_OFFLINE;    
??BV20_estado_supervisao_3:
        MOVS     R0,#+3
        MOVS     R4,R0
//  240   }
//  241   
//  242   return estado;
??BV20_estado_supervisao_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+16
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock7
//  243 }

        SECTION `.data`:DATA:REORDER:NOROOT(0)
??contador_ciclos:
        DATA
        DC8 10
//  244 /***********************************************************************************
//  245 *       Descrição       :       Função para o estado em que é iniciada 
//  246 *                               a supervisão da fila de eventos
//  247 *                               do BV20
//  248 *       Parametros      :       (eBV20_state) estado atual
//  249 *       Retorno         :       (eBV20_state) novo estado
//  250 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function BV20_estado_le_evento
        THUMB
//  251 eBV20_state BV20_estado_le_evento(eBV20_state estado){
BV20_estado_le_evento:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        SUB      SP,SP,#+16
          CFI CFA R13+40
        MOVS     R4,R0
//  252   unsigned short int eventos[5];
//  253   unsigned char tentativas=5;
        MOVS     R6,#+5
//  254   unsigned char flag;
//  255   
//  256   do flag = CCTALK_leFilaEventos(END_NOTEIRO,&BV20_quantidade_eventos,eventos);
??BV20_estado_le_evento_0:
        ADD      R2,SP,#+0
        LDR.N    R1,??DataTable9_6
        MOVS     R0,#+40
          CFI FunCall CCTALK_leFilaEventos
        BL       CCTALK_leFilaEventos
        MOVS     R5,R0
//  257   while(!flag && --tentativas);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??BV20_estado_le_evento_1
        SUBS     R6,R6,#+1
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??BV20_estado_le_evento_0
//  258     
//  259   if(!tentativas)
??BV20_estado_le_evento_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??BV20_estado_le_evento_2
//  260     return BV20_OFFLINE;
        MOVS     R0,#+3
        B.N      ??BV20_estado_le_evento_3
//  261     
//  262   if(BV20_quantidade_eventos!=BV20_ultima_quantidade_eventos){
??BV20_estado_le_evento_2:
        LDR.N    R0,??DataTable9_6
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable9_8
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BEQ.N    ??BV20_estado_le_evento_4
//  263     
//  264     unsigned short int diferenca;
//  265     if(BV20_quantidade_eventos>BV20_ultima_quantidade_eventos)
        LDR.N    R0,??DataTable9_8
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable9_6
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R0,R1
        BCS.N    ??BV20_estado_le_evento_5
//  266       diferenca = BV20_quantidade_eventos - BV20_ultima_quantidade_eventos;
        LDR.N    R0,??DataTable9_6
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable9_8
        LDRH     R1,[R1, #+0]
        SUBS     R0,R0,R1
        MOVS     R7,R0
        B.N      ??BV20_estado_le_evento_6
//  267     else
//  268       diferenca = (255 - BV20_ultima_quantidade_eventos) + BV20_quantidade_eventos;
??BV20_estado_le_evento_5:
        LDR.N    R0,??DataTable9_8
        LDRH     R0,[R0, #+0]
        RSBS     R0,R0,#+255
        LDR.N    R1,??DataTable9_6
        LDRB     R1,[R1, #+0]
        ADDS     R0,R1,R0
        MOVS     R7,R0
//  269 
//  270     for(unsigned char i=0;i<diferenca && i<5;i++)      
??BV20_estado_le_evento_6:
        MOVS     R8,#+0
??BV20_estado_le_evento_7:
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R0,R7
        BCS.N    ??BV20_estado_le_evento_8
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+5
        BGE.N    ??BV20_estado_le_evento_8
//  271       BV20_decodifica_eventos(eventos[i]);    
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ADD      R0,SP,#+0
        LDRH     R0,[R0, R8, LSL #+1]
          CFI FunCall BV20_decodifica_eventos
        BL       BV20_decodifica_eventos
        ADDS     R8,R8,#+1
        B.N      ??BV20_estado_le_evento_7
//  272     
//  273     BV20_ultima_quantidade_eventos = BV20_quantidade_eventos;    
??BV20_estado_le_evento_8:
        LDR.N    R0,??DataTable9_8
        LDR.N    R1,??DataTable9_6
        LDRB     R1,[R1, #+0]
        STRH     R1,[R0, #+0]
//  274   }
//  275   
//  276   return BV20_SUPERVISAO;
??BV20_estado_le_evento_4:
        MOVS     R0,#+4
??BV20_estado_le_evento_3:
        ADD      SP,SP,#+16
          CFI CFA R13+24
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock8
//  277 }
//  278 /***********************************************************************************
//  279 *       Descrição       :       Decodifica os eventos do BV20
//  280 *       Parametros      :       (unsigned short int) evento
//  281 *       Retorno         :       nenhum
//  282 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function BV20_decodifica_eventos
        THUMB
//  283 void BV20_decodifica_eventos(unsigned short int evento){
BV20_decodifica_eventos:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
//  284   static unsigned short int valorGolpe = 100;
//  285   static CCTALK_BILL_EVENTS last_evento;
//  286   unsigned char i;
//  287   
//  288   switch(evento>>8){
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSRS     R0,R4,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BV20_decodifica_eventos_0
        SUBS     R0,R0,#+1
        BEQ.N    ??BV20_decodifica_eventos_1
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BLS.N    ??BV20_decodifica_eventos_2
        SUBS     R0,R0,#+2
        BEQ.W    ??BV20_decodifica_eventos_3
        SUBS     R0,R0,#+1
        BEQ.W    ??BV20_decodifica_eventos_4
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BLS.W    ??BV20_decodifica_eventos_5
        SUBS     R0,R0,#+2
        CMP      R0,#+2
        BLS.N    ??BV20_decodifica_eventos_3
        SUBS     R0,R0,#+3
        CMP      R0,#+4
        BLS.W    ??BV20_decodifica_eventos_5
        SUBS     R0,R0,#+5
        CMP      R0,#+1
        BLS.N    ??BV20_decodifica_eventos_3
        SUBS     R0,R0,#+2
        CMP      R0,#+3
        BLS.W    ??BV20_decodifica_eventos_5
        B.N      ??BV20_decodifica_eventos_6
//  289     case BILL_VALIDATED_OK:       
//  290          break;
??BV20_decodifica_eventos_0:
        B.N      ??BV20_decodifica_eventos_6
//  291     case BILL_VALIDATED_OK_AND_SCROW:                         
//  292               {
//  293                   unsigned char tentativas=10;
??BV20_decodifica_eventos_1:
        MOVS     R7,#+10
//  294                   unsigned char flag;
//  295                   i = 0;
        MOVS     R0,#+0
        MOVS     R5,R0
//  296                 
//  297                   do flag = CCTALK_rotacionaValidador(END_NOTEIRO);
??BV20_decodifica_eventos_7:
        MOVS     R0,#+40
          CFI FunCall CCTALK_rotacionaValidador
        BL       CCTALK_rotacionaValidador
        MOVS     R6,R0
//  298                   while(!flag && tentativas--);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??BV20_decodifica_eventos_8
        MOVS     R0,R7
        SUBS     R7,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??BV20_decodifica_eventos_7
//  299                 
//  300                   if(flag){                                                                 
??BV20_decodifica_eventos_8:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??BV20_decodifica_eventos_9
//  301                     while(!xSemaphoreTake(BV20_sem_acumulador_dinheiro,portTICK_RATE_MS*1));  
??BV20_decodifica_eventos_10:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable9_3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??BV20_decodifica_eventos_10
//  302                     
//  303                     BV20_valor_acumulado += BV20_valor_canais[BV20_regiao][evento&0xFF];    
        LDR.N    R0,??DataTable9_9
        LDRH     R0,[R0, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTB     R1,R4            ;; ZeroExt  R1,R4,#+24,#+24
        LDR.N    R2,??DataTable9_5
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+14
        LDR.W    R12,??DataTable9_10
        MLA      R2,R3,R2,R12
        LDRH     R1,[R2, R1, LSL #+1]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable9_9
        STRH     R0,[R1, #+0]
//  304                     valorGolpe = BV20_valor_canais[BV20_regiao][evento&0xFF];    
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTB     R0,R4            ;; ZeroExt  R0,R4,#+24,#+24
        LDR.N    R1,??DataTable9_5
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+14
        LDR.N    R3,??DataTable9_10
        MLA      R1,R2,R1,R3
        LDRH     R0,[R1, R0, LSL #+1]
        LDR.N    R1,??DataTable9_11
        STRH     R0,[R1, #+0]
//  305                     
//  306                     xSemaphoreGive(BV20_sem_acumulador_dinheiro); 
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable9_3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  307                   }
//  308                   
//  309                   i++;
??BV20_decodifica_eventos_9:
        ADDS     R5,R5,#+1
//  310                   vTaskDelay(200);
        MOVS     R0,#+200
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  311                }
//  312          break;            
        B.N      ??BV20_decodifica_eventos_6
//  313     case MASTER_INHIBIT_ACTIVE:
//  314     case BILL_RETURNED_FROM_ESCROW:               
//  315          if(last_evento==BILL_VALIDATED_OK_AND_SCROW){
??BV20_decodifica_eventos_2:
        LDR.N    R0,??DataTable9_12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??BV20_decodifica_eventos_11
//  316          
//  317              while(!xSemaphoreTake(BV20_sem_acumulador_dinheiro,portTICK_RATE_MS*1));      
??BV20_decodifica_eventos_12:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable9_3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??BV20_decodifica_eventos_12
//  318                     
//  319              if(BV20_valor_acumulado>=valorGolpe) 
        LDR.N    R0,??DataTable9_9
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable9_11
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BCC.N    ??BV20_decodifica_eventos_13
//  320                BV20_valor_acumulado -= valorGolpe;
        LDR.N    R0,??DataTable9_9
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable9_11
        LDRH     R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR.N    R1,??DataTable9_9
        STRH     R0,[R1, #+0]
        B.N      ??BV20_decodifica_eventos_14
//  321              else
//  322                BV20_valor_acumulado = 0;
??BV20_decodifica_eventos_13:
        LDR.N    R0,??DataTable9_9
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  323                  
//  324              xSemaphoreGive(BV20_sem_acumulador_dinheiro);                  
??BV20_decodifica_eventos_14:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable9_3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  325              valorGolpe = 0;                                               
        LDR.N    R0,??DataTable9_11
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  326                                                      
//  327          }
//  328          break;
??BV20_decodifica_eventos_11:
        B.N      ??BV20_decodifica_eventos_6
//  329     case BILL_JAMMED_IN_TRANSPORT:           
//  330     case BILL_JAMMED_IN_BACKWARDS:                   
//  331     case BILL_TAMPER:                                   
//  332     case INVALID_BILL_VALIDATION:            
//  333     case BILL_JAMMED_IN_TRANSPORT_SAFE:            
//  334     case OPTO_FRAUD_DETECTED:            
//  335          last_evento = UNKNOWN_BILL_TYPE_STACKED;
??BV20_decodifica_eventos_3:
        LDR.N    R0,??DataTable9_12
        MOVS     R1,#+21
        STRB     R1,[R0, #+0]
//  336          {
//  337            while(!xSemaphoreTake(BV20_sem_acumulador_dinheiro,portTICK_RATE_MS*1));   
??BV20_decodifica_eventos_15:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable9_3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??BV20_decodifica_eventos_15
//  338                   
//  339            if(BV20_valor_acumulado) 
        LDR.N    R0,??DataTable9_9
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BV20_decodifica_eventos_16
//  340              BV20_valor_acumulado -= valorGolpe;
        LDR.N    R0,??DataTable9_9
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable9_11
        LDRH     R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR.N    R1,??DataTable9_9
        STRH     R0,[R1, #+0]
//  341                   
//  342            xSemaphoreGive(BV20_sem_acumulador_dinheiro);                  
??BV20_decodifica_eventos_16:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable9_3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  343            valorGolpe = 0;                  
        LDR.N    R0,??DataTable9_11
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  344          } 
//  345          break;
        B.N      ??BV20_decodifica_eventos_6
//  346     case INVALID_BILL_TRANSPORTATION:
//  347          break;
??BV20_decodifica_eventos_4:
        B.N      ??BV20_decodifica_eventos_6
//  348     case INHIBIT_BILL_SERIAL:
//  349     case INHIBIT_BILL_DIPSWITCH:
//  350     case STACKER_OK: 
//  351     case STACKER_INVERTED:   
//  352     case STACKER_FAULTY:     
//  353     case STACKER_FULL:   
//  354     case STACKER_JAMMED:
//  355     case STRING_FRAUD_DETECTED:
//  356     case ANTI_STRING_MECHANISM_FAULTY: 
//  357     case BARCODE_DETECTED:
//  358     case UNKNOWN_BILL_TYPE_STACKED:
//  359          break;            
//  360   }        
//  361   
//  362   last_evento = (CCTALK_BILL_EVENTS)(evento>>8);
??BV20_decodifica_eventos_5:
??BV20_decodifica_eventos_6:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSRS     R0,R4,#+8
        LDR.N    R1,??DataTable9_12
        STRB     R0,[R1, #+0]
//  363   BV20_ultimo_evento = last_evento;
        LDR.N    R0,??DataTable9_13
        LDR.N    R1,??DataTable9_12
        LDRB     R1,[R1, #+0]
        STRB     R1,[R0, #+0]
//  364 }
        POP      {R0,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock9

        SECTION `.data`:DATA:REORDER:NOROOT(1)
??valorGolpe:
        DATA
        DC16 100

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??last_evento:
        DS8 1
//  365 /***********************************************************************************
//  366 *       Descrição       :       Lê o valor acumulado de moeda
//  367 *       Parametros      :       nenhum
//  368 *       Retorno         :       (unsigned short int) valor acumulado
//  369 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function BV20_get_valor_acumulador
        THUMB
//  370 unsigned short int BV20_get_valor_acumulador(void){
BV20_get_valor_acumulador:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  371    unsigned short int valor=0;
        MOVS     R4,#+0
//  372   
//  373    while(!xSemaphoreTake(BV20_sem_acumulador_dinheiro,portTICK_RATE_MS*1));     
??BV20_get_valor_acumulador_0:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable9_3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??BV20_get_valor_acumulador_0
//  374   
//  375    valor = BV20_valor_acumulado;
        LDR.N    R0,??DataTable9_9
        LDRH     R0,[R0, #+0]
        MOVS     R4,R0
//  376    
//  377    xSemaphoreGive(BV20_sem_acumulador_dinheiro);     
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable9_3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  378    
//  379    return valor;
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock10
//  380 }
//  381 /***********************************************************************************
//  382 *       Descrição       :      seter para o acumulado de moeda
//  383 *       Parametros      :      (unsigned short int) subtrai o valor do acumulado
//  384 *       Retorno         :       nenhum
//  385 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function BV20_subtrai_valor_acumulado
        THUMB
//  386 void BV20_subtrai_valor_acumulado(unsigned short int valor){
BV20_subtrai_valor_acumulado:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  387   
//  388    while(!xSemaphoreTake(BV20_sem_acumulador_dinheiro,portTICK_RATE_MS*1));     
??BV20_subtrai_valor_acumulado_0:
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable9_3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericReceive
        BL       xQueueGenericReceive
        CMP      R0,#+0
        BEQ.N    ??BV20_subtrai_valor_acumulado_0
//  389    
//  390    if(valor>=BV20_valor_acumulado)
        LDR.N    R0,??DataTable9_9
        LDRH     R0,[R0, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,R0
        BCC.N    ??BV20_subtrai_valor_acumulado_1
//  391      BV20_valor_acumulado -= valor;
        LDR.N    R0,??DataTable9_9
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,R4
        LDR.N    R1,??DataTable9_9
        STRH     R0,[R1, #+0]
        B.N      ??BV20_subtrai_valor_acumulado_2
//  392    else
//  393      BV20_valor_acumulado = 0;
??BV20_subtrai_valor_acumulado_1:
        LDR.N    R0,??DataTable9_9
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  394    
//  395    xSemaphoreGive(BV20_sem_acumulador_dinheiro); 
??BV20_subtrai_valor_acumulado_2:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable9_3
        LDR      R0,[R0, #+0]
          CFI FunCall xQueueGenericSend
        BL       xQueueGenericSend
//  396 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock11
//  397 /***********************************************************************************
//  398 *       Descrição       :       Getter para o último evento validado pelo
//  399 *                               noteiro
//  400 *       Parametros      :       nenhum
//  401 *       Retorno         :       (CCTALK_BILL_EVENTS) eventos
//  402 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function BV20_get_ultimo_evento
          CFI NoCalls
        THUMB
//  403 CCTALK_BILL_EVENTS BV20_get_ultimo_evento(void){
//  404   
//  405   return BV20_ultimo_evento;
BV20_get_ultimo_evento:
        LDR.N    R0,??DataTable9_13
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock12
//  406 }
//  407 /***********************************************************************************
//  408 *       Descrição       :       Getter para o estado atual da máquina de 
//  409 *                               estados que supervisiona o BV20
//  410 *       Parametros      :       nenhum
//  411 *       Retorno         :       (eBV20_state) estado atual da máquina
//  412 *                                             de estados que supervisona o BV20
//  413 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function BV20_get_current_state
          CFI NoCalls
        THUMB
//  414 eBV20_state BV20_get_current_state(void){
//  415   
//  416   return estado_atual;
BV20_get_current_state:
        LDR.N    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock13
//  417 }
//  418 /***********************************************************************************
//  419 *       Descrição       :       Faz o bloqueio do noteiro
//  420 *       Parametros      :       nenhum
//  421 *       Retorno         :       nenhum
//  422 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function BV20_estado_bloqueio
        THUMB
//  423 eBV20_state BV20_estado_bloqueio(eBV20_state estado){
BV20_estado_bloqueio:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
//  424   unsigned int tentativas=3;
        MOVS     R5,#+3
//  425   unsigned char flag;
//  426   
//  427   do flag = CCTALK_setBitsHabilitacaoCanal(END_NOTEIRO,0);
??BV20_estado_bloqueio_0:
        MOVS     R1,#+0
        MOVS     R0,#+40
          CFI FunCall CCTALK_setBitsHabilitacaoCanal
        BL       CCTALK_setBitsHabilitacaoCanal
        MOVS     R6,R0
//  428   while(!flag && tentativas--);  
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??BV20_estado_bloqueio_1
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        CMP      R0,#+0
        BNE.N    ??BV20_estado_bloqueio_0
//  429   
//  430   return BV20_BLOQUEADO;
??BV20_estado_bloqueio_1:
        MOVS     R0,#+0
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock14
//  431 }
//  432 /***********************************************************************************
//  433 *       Descrição       :       Setter para o bloqueio 
//  434 *       Parametros      :       (unsigned char) flag
//  435 *       Retorno         :       nenhum
//  436 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function BV20_setter_bloqueio
          CFI NoCalls
        THUMB
//  437 void BV20_setter_bloqueio(unsigned char flag){
//  438   
//  439   if(flag)
BV20_setter_bloqueio:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BV20_setter_bloqueio_0
//  440     BV20_mensagemExterna = BV20_BLOQUEADO;
        LDR.N    R1,??DataTable9
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
        B.N      ??BV20_setter_bloqueio_1
//  441   else
//  442     BV20_mensagemExterna = BV20_INICIALIZACAO;
??BV20_setter_bloqueio_0:
        LDR.N    R1,??DataTable9
        MOVS     R2,#+2
        STRB     R2,[R1, #+0]
//  443 }
??BV20_setter_bloqueio_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     BV20_mensagemExterna

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     estado_atual

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     BV20_func

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     BV20_sem_acumulador_dinheiro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     BV20_fila_sinais

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     BV20_regiao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     BV20_quantidade_eventos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     ??contador_ciclos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_8:
        DC32     BV20_ultima_quantidade_eventos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_9:
        DC32     BV20_valor_acumulado

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_10:
        DC32     BV20_valor_canais

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_11:
        DC32     ??valorGolpe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_12:
        DC32     ??last_evento

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_13:
        DC32     BV20_ultimo_evento

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  444 /***********************************************************************************
//  445 *       Fim do arquivo
//  446 ***********************************************************************************/
// 
//    14 bytes in section .bss
//    31 bytes in section .data
//   100 bytes in section .rodata
// 1 220 bytes in section .text
// 
// 1 220 bytes of CODE  memory
//   100 bytes of CONST memory
//    45 bytes of DATA  memory
//
//Errors: none
//Warnings: none
