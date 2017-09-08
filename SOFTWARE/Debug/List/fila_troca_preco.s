///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     08/Sep/2017  15:30:26 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Historico_precos\ /
//                    fila_troca_preco.c                                      /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Historico_precos\ /
//                    fila_troca_preco.c -lC C:\repositorios\MaisPipocaG2\SOF /
//                    TWARE\Debug\List\ -lA C:\repositorios\MaisPipocaG2\SOFT /
//                    WARE\Debug\List\ -o C:\repositorios\MaisPipocaG2\SOFTWA /
//                    RE\Debug\Obj\ --no_cse --no_unroll --no_inline          /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -Ol                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\fila_t /
//                    roca_preco.s                                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME fila_troca_preco

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN FLASHQUEUE_ajustaPonteiro
        EXTERN FLASHQUEUE_append
        EXTERN FLASHQUEUE_formata
        EXTERN FLASHQUEUE_getRealSize
        EXTERN FLASHQUEUE_getSize
        EXTERN FLASHQUEUE_readFromLast
        EXTERN RTC_getValue

        PUBLIC FTP_ack_novos_eventos
        PUBLIC FTP_fila_troca_preco
        PUBLIC FTP_formata_fila
        PUBLIC FTP_get_quantidade_historico_trocas
        PUBLIC FTP_get_quantidade_novas_trocas
        PUBLIC FTP_get_troca
        PUBLIC FTP_novo_preco
        
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Historico_precos\fila_troca_preco.c
//    1 /*__________________________________________________________________________________
//    2 |	Quark Tecnologia Eletrônica 
//    3 |       
//    4 |       Porto Belo
//    5 | __________________________________________________________________________________
//    6 |
//    7 |       This source code was developed by Dextro and cannot be copied, in part 
//    8 |       or in whole, or used, except when legally licensed by Dextro
//    9 |       or its distributors.
//   10 |
//   11 |       Este código é propriedade da Dextro e não pode ser copiado, em parte 
//   12 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   13 |      Dextro ou por um de seus distribuidores.
//   14 | __________________________________________________________________________________
//   15 |
//   16 |       Arquivo            :  flash_queue.c
//   17 |       Descrição          :  Funções para implementação da fila
//   18 |                             de eventos na memória de massa
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  15/06/2017
//   22 |
//   23 |       Revisões           :  1.0.0.0
//   24 |     
//   25 
//   26 |
//   27 | __________________________________________________________________________________
//   28 */
//   29 
//   30 /***********************************************************************************
//   31 *       Includes
//   32 ***********************************************************************************/
//   33 #include <stdio.h>
//   34 #include <stdlib.h>
//   35 #include <string.h>
//   36 #include "..\includes.h"
//   37 #include "flash_queue.h"
//   38 
//   39 /***********************************************************************************
//   40 *       Definições
//   41 ***********************************************************************************/
//   42 
//   43 
//   44 /***********************************************************************************
//   45 *       Estruturas
//   46 ***********************************************************************************/
//   47 typedef struct{
//   48   unsigned short int novo_preco;
//   49   unsigned short int preco_antigo;
//   50   unsigned char hora,minuto,segundo,dia,mes;
//   51   unsigned  int ano;  
//   52 }sTROCA_PRECO;
//   53 
//   54 /***********************************************************************************
//   55 *       Constantes
//   56 ***********************************************************************************/
//   57 
//   58 
//   59 /***********************************************************************************
//   60 *       Variaveis locais]
//   61 **********************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   62 sFlashQueueData FTP_fila_troca_preco={
FTP_fila_troca_preco:
        DATA
        DC32 3584
        DC16 10
        DC8 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
//   63   .inicio_flash = AREA_TABELA,
//   64   .posicoes = 10,
//   65   .tamanhoBloco = sizeof(sTROCA_PRECO)  
//   66 };
//   67 
//   68 /***********************************************************************************
//   69 *       Funções locais
//   70 ***********************************************************************************/
//   71 
//   72 
//   73 /***********************************************************************************
//   74 *       Tabelas de funções
//   75 ***********************************************************************************/
//   76 
//   77 /***********************************************************************************
//   78 *       Implementação das funções
//   79 ***********************************************************************************/
//   80 
//   81 /***********************************************************************************
//   82 *       Descrição       :       Insere um novo evento de troca de preço
//   83 *                               na fila
//   84 *       Parametros      :       (unsigned short int) novo preço
//   85 *                               (unsigned short int) preço anterior
//   86 *                               (unsigned char ) hora
//   87 *                               (unsigned char) minuto
//   88 *                               (unsigned char) segundo
//   89 *                               (unsigned char) dia
//   90 *                               (unsigned char) mes
//   91 *                               (unsigned short int) ano
//   92 *       Retorno         :       nenhum
//   93 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function FTP_novo_preco
        THUMB
//   94 void FTP_novo_preco(unsigned short int novo_preco,unsigned short int preco_antigo){  
FTP_novo_preco:
        PUSH     {LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+4
        SUB      SP,SP,#+28
          CFI CFA R13+32
//   95   sTROCA_PRECO dados;
//   96                       
//   97   dados.novo_preco = novo_preco;
        STRH     R0,[SP, #+8]
//   98   dados.preco_antigo = preco_antigo;
        STRH     R1,[SP, #+10]
//   99   
//  100   //Carrega o horário da alteração
//  101   RTC_getValue(&dados.hora,&dados.minuto,&dados.segundo,&dados.dia,&dados.mes,&dados.ano);  
        ADD      R0,SP,#+20
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+16
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+15
        ADD      R2,SP,#+14
        ADD      R1,SP,#+13
        ADD      R0,SP,#+12
          CFI FunCall RTC_getValue
        BL       RTC_getValue
//  102   
//  103   //unsigned char FLASHQUEUE_append(sFlashQueueData* queue,void *pData)
//  104   FLASHQUEUE_append(&FTP_fila_troca_preco,(void*)&dados);                      
        ADD      R1,SP,#+8
        LDR.N    R0,??DataTable5
          CFI FunCall FLASHQUEUE_append
        BL       FLASHQUEUE_append
//  105 }
        ADD      SP,SP,#+28
          CFI CFA R13+4
        POP      {PC}             ;; return
          CFI EndBlock cfiBlock0
//  106 /***********************************************************************************
//  107 *       Descrição       :       Verifica quantos novos eventos de troca
//  108 *                               preço existem na fila de eventos
//  109 *       Parametros      :       nenhum
//  110 *       Retorno         :       (usnigned short int) quantidade de novos
//  111 *                                                    eventos
//  112 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function FTP_get_quantidade_novas_trocas
        THUMB
//  113 unsigned short int FTP_get_quantidade_novas_trocas(void){
FTP_get_quantidade_novas_trocas:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  114   
//  115   return FLASHQUEUE_getSize(&FTP_fila_troca_preco);
        LDR.N    R0,??DataTable5
          CFI FunCall FLASHQUEUE_getSize
        BL       FLASHQUEUE_getSize
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock1
//  116 }
//  117 /***********************************************************************************
//  118 *       Descrição       :       Verifiac quantos eventos existem ao total na fila
//  119 *       Parametros      :       nenhum
//  120 *       Retorno         :       (unsigned short int) quantidade total de eventos
//  121 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function FTP_get_quantidade_historico_trocas
        THUMB
//  122 unsigned short int FTP_get_quantidade_historico_trocas(void){
FTP_get_quantidade_historico_trocas:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  123     
//  124   return FLASHQUEUE_getRealSize(&FTP_fila_troca_preco);
        LDR.N    R0,??DataTable5
          CFI FunCall FLASHQUEUE_getRealSize
        BL       FLASHQUEUE_getRealSize
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock2
//  125 }
//  126 /***********************************************************************************
//  127 *       Descrição       :       Lê um evento na fila de eventos
//  128 *       Parametros      :       (unsigned short int) indice do evento
//  129 *                               (unsigned short int*) preço
//  130 *                               (unsigned short int*) preço antigo
//  131 *                               (unsigned char) hora
//  132 *                               (unsigned char) minuto
//  133 *                               (unsigned char) segundo
//  134 *                               (unsigned char) dia
//  135 *                               (unsigned char) mês
//  136 *                               (unsigned short int) ano
//  137 *       Retorno         :       (unsigned char) maior do que zero se existir
//  138 *                                               evento com este indice
//  139 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function FTP_get_troca
        THUMB
//  140 unsigned char FTP_get_troca(unsigned short int indice,unsigned short int *novo_preco,unsigned short int *preco_antigo,
//  141                             unsigned char *hora,unsigned char *minuto,unsigned char *segundo,
//  142                             unsigned char *dia,unsigned char *mes,unsigned int *ano){
FTP_get_troca:
        PUSH     {R4-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+36
        SUB      SP,SP,#+20
          CFI CFA R13+56
        MOVS     R4,R1
        MOVS     R5,R2
        MOVS     R6,R3
        LDR      R7,[SP, #+56]
        LDR      R8,[SP, #+60]
        LDR      R9,[SP, #+64]
        LDR      R10,[SP, #+68]
        LDR      R11,[SP, #+72]
//  143   sTROCA_PRECO dados;
//  144   unsigned char flag;
//  145   
//  146   flag = FLASHQUEUE_readFromLast(&FTP_fila_troca_preco,indice,(void*)&dados);
        ADD      R2,SP,#+0
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable5
          CFI FunCall FLASHQUEUE_readFromLast
        BL       FLASHQUEUE_readFromLast
//  147               
//  148   *novo_preco = dados.novo_preco;
        LDRH     R1,[SP, #+0]
        STRH     R1,[R4, #+0]
//  149   *preco_antigo = dados.preco_antigo;
        LDRH     R1,[SP, #+2]
        STRH     R1,[R5, #+0]
//  150   *hora = dados.hora;
        LDRB     R1,[SP, #+4]
        STRB     R1,[R6, #+0]
//  151   *minuto = dados.minuto;
        LDRB     R1,[SP, #+5]
        STRB     R1,[R7, #+0]
//  152   *segundo = dados.segundo;
        LDRB     R1,[SP, #+6]
        STRB     R1,[R8, #+0]
//  153   *dia = dados.dia;
        LDRB     R1,[SP, #+7]
        STRB     R1,[R9, #+0]
//  154   *mes = dados.mes;
        LDRB     R1,[SP, #+8]
        STRB     R1,[R10, #+0]
//  155   *ano = dados.ano;
        LDR      R1,[SP, #+12]
        STR      R1,[R11, #+0]
//  156   
//  157   return flag;                     
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+20
          CFI CFA R13+36
        POP      {R4-R11,PC}      ;; return
          CFI EndBlock cfiBlock3
//  158 }
//  159 /***********************************************************************************
//  160 *       Descrição       :       Reconhece os novos eventos, como efeito o 
//  161 *                               indice é atualizado para retornar zero em novos eventos
//  162 *       Parametros      :       nenhum
//  163 *       Retorno         :       nenhum
//  164 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function FTP_ack_novos_eventos
        THUMB
//  165 void FTP_ack_novos_eventos(void){
FTP_ack_novos_eventos:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  166     
//  167   FLASHQUEUE_ajustaPonteiro(&FTP_fila_troca_preco,FTP_get_quantidade_novas_trocas());
          CFI FunCall FTP_get_quantidade_novas_trocas
        BL       FTP_get_quantidade_novas_trocas
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable5
          CFI FunCall FLASHQUEUE_ajustaPonteiro
        BL       FLASHQUEUE_ajustaPonteiro
//  168 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  169 /***********************************************************************************
//  170 *       Descrição       :       Formata os dados da fila de eventos de troca
//  171 *                               de preço
//  172 *       Parametros      :       nenhum
//  173 *       Retorno         :       nenhum
//  174 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function FTP_formata_fila
        THUMB
//  175 void FTP_formata_fila(void){
FTP_formata_fila:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  176     
//  177   FLASHQUEUE_formata(&FTP_fila_troca_preco);
        LDR.N    R0,??DataTable5
          CFI FunCall FLASHQUEUE_formata
        BL       FLASHQUEUE_formata
//  178 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     FTP_fila_troca_preco

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  179 /***********************************************************************************
//  180 *       Fim do arquivo
//  181 ***********************************************************************************/
// 
//  28 bytes in section .data
// 206 bytes in section .text
// 
// 206 bytes of CODE memory
//  28 bytes of DATA memory
//
//Errors: none
//Warnings: none
