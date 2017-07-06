///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     06/Jul/2017  15:10:08 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Historico_precos\flash_queue.c          /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Historico_precos\flash_queue.c -lC      /
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
//                    pocaG2\SOFTWARE\Debug\List\flash_queue.s                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME flash_queue

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN HD44780_writeChar
        EXTERN HD44780_writeString
        EXTERN MEMORYWRAPPER_readBytes
        EXTERN MEMORYWRAPPER_writeBytes
        EXTERN vTaskDelay

        PUBLIC FLASHQUEUE_ajustaPonteiro
        PUBLIC FLASHQUEUE_append
        PUBLIC FLASHQUEUE_checksum
        PUBLIC FLASHQUEUE_formata
        PUBLIC FLASHQUEUE_getRealSize
        PUBLIC FLASHQUEUE_getSize
        PUBLIC FLASHQUEUE_init
        PUBLIC FLASHQUEUE_loadControl
        PUBLIC FLASHQUEUE_readFromFirst
        PUBLIC FLASHQUEUE_readFromLast
        PUBLIC FLASHQUEUE_saveControl
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Historico_precos\flash_queue.c
//    1 /*__________________________________________________________________________________
//    2 |	Dextro Soluções Tecnológicas
//    3 |       
//    4 |       Itajaí
//    5 |       www.dextro-st.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Dextro and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Dextro
//   10 |       or its distributors.
//   11 |
//   12 |       Este código é propriedade da Dextro e não pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |      Dextro ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :  flash_queue.c
//   18 |       Descrição          :  Funções para implementação da fila
//   19 |                             de eventos na memória de massa
//   20 | 
//   21 |       Autor              :  Marcos Aquino
//   22 |       Data criação       :  25/08/2011
//   23 |
//   24 |       Revisões           :  1.0.0.0
//   25 |     
//   26 |                             1.1.0.0
//   27 |                             ( As funções de implementação da 
//   28 |                               fila tiveram a implementação completamente
//   29 |                               alterada)
//   30 |                             (31/08/2013) por Marcos
//   31 |
//   32 | __________________________________________________________________________________
//   33 */
//   34 /***********************************************************************************
//   35 *     Includes
//   36 ***********************************************************************************/
//   37 #include <stdio.h>
//   38 #include <stdlib.h>
//   39 #include <string.h>
//   40 #include <nxp\iolpc1768.h>
//   41 #include "flash_queue.h"
//   42 #include "..\includes.h"
//   43 
//   44 /***********************************************************************************
//   45 *     Definições com constantes utilizadas no programa
//   46 ***********************************************************************************/ 
//   47 #define LLW_blockRead                   MEMORYWRAPPER_readBytes
//   48 #define LLW_blockWrite                  MEMORYWRAPPER_writeBytes
//   49 
//   50 /***********************************************************************************
//   51 *     Enumerações
//   52 ***********************************************************************************/
//   53 #define PAGE_SIZE                       128
//   54 
//   55 /***********************************************************************************
//   56 *     Estruturas
//   57 ***********************************************************************************/
//   58 
//   59 
//   60 /***********************************************************************************
//   61 *     Uniões
//   62 ***********************************************************************************/
//   63 
//   64 
//   65 /***********************************************************************************
//   66 *     Constantes
//   67 ***********************************************************************************/
//   68 
//   69 
//   70 /***********************************************************************************
//   71 *     Variaveis locais
//   72 ***********************************************************************************/
//   73 
//   74 
//   75 /***********************************************************************************
//   76 *     Funções locais
//   77 ***********************************************************************************/
//   78 void FLASHQUEUE_loadControl(sFlashQueueData *queue);
//   79 void FLASHQUEUE_saveControl(sFlashQueueData *queue);
//   80 
//   81 /***********************************************************************************
//   82 *     Implementação
//   83 ***********************************************************************************/
//   84 
//   85 /***********************************************************************************
//   86 *     Descrição     :   Carrega o bloco de controle de uma fila
//   87 *     Parametros    :   (sFlashQueueData*)Ponteiro para a fila
//   88 *     Retorno       :   nenhum
//   89 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function FLASHQUEUE_loadControl
        THUMB
//   90 void FLASHQUEUE_loadControl(sFlashQueueData *queue){
FLASHQUEUE_loadControl:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//   91     
//   92   LLW_blockRead(queue->inicio_flash,
//   93                 (unsigned char*)&queue->controleFlash[0],
//   94                 sizeof(sFlashQueueControl));
        MOVS     R2,#+10
        ADDS     R1,R4,#+8
        LDR      R0,[R4, #+0]
          CFI FunCall MEMORYWRAPPER_readBytes
        BL       MEMORYWRAPPER_readBytes
//   95   
//   96   // A cópia do bloco de controle
//   97   // fica gravado em uma página
//   98   // diferente da dataflash
//   99   LLW_blockRead(queue->inicio_flash + PAGE_SIZE,
//  100                 (unsigned char*)&queue->controleFlash[1],
//  101                 sizeof(sFlashQueueControl));  
        MOVS     R2,#+10
        ADDS     R1,R4,#+18
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,#+128
          CFI FunCall MEMORYWRAPPER_readBytes
        BL       MEMORYWRAPPER_readBytes
//  102      
//  103   if(queue->controleFlash[0].checksum == FLASHQUEUE_checksum((unsigned char*)&queue->controleFlash[0],
//  104                                                              sizeof(sFlashQueueControl)-2))
        LDRH     R5,[R4, #+16]
        MOVS     R1,#+8
        ADDS     R0,R4,#+8
          CFI FunCall FLASHQUEUE_checksum
        BL       FLASHQUEUE_checksum
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R5,R0
        BEQ.N    ??FLASHQUEUE_loadControl_0
//  105     return;                
//  106   else    
//  107     if(queue->controleFlash[1].checksum == FLASHQUEUE_checksum((unsigned char*)&queue->controleFlash[1],
//  108                                                                sizeof(sFlashQueueControl)-2)){
??FLASHQUEUE_loadControl_1:
        LDRH     R5,[R4, #+26]
        MOVS     R1,#+8
        ADDS     R0,R4,#+18
          CFI FunCall FLASHQUEUE_checksum
        BL       FLASHQUEUE_checksum
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R5,R0
        BNE.N    ??FLASHQUEUE_loadControl_2
//  109       queue->controleFlash[0].indiceBlocoInserido   = queue->controleFlash[1].indiceBlocoInserido;
        LDRH     R0,[R4, #+18]
        STRH     R0,[R4, #+8]
//  110       queue->controleFlash[0].indiceBlocoLido       = queue->controleFlash[1].indiceBlocoLido;
        LDRH     R0,[R4, #+20]
        STRH     R0,[R4, #+10]
//  111       queue->controleFlash[0].quantidadeBlocoFila   = queue->controleFlash[1].quantidadeBlocoFila;
        LDRH     R0,[R4, #+22]
        STRH     R0,[R4, #+12]
//  112       queue->controleFlash[0].quantidadeNovosBlocos = queue->controleFlash[1].quantidadeNovosBlocos;
        LDRH     R0,[R4, #+24]
        STRH     R0,[R4, #+14]
        B.N      ??FLASHQUEUE_loadControl_3
//  113     }
//  114     else{
//  115       //Se os dados forem inconsistentes nas duas entradas, zera tudo...
//  116       queue->controleFlash[0].indiceBlocoInserido = \ 
//  117       queue->controleFlash[0].indiceBlocoLido = \ 
//  118       queue->controleFlash[0].quantidadeBlocoFila = 
//  119       queue->controleFlash[0].quantidadeNovosBlocos = 0;
??FLASHQUEUE_loadControl_2:
        MOVS     R0,#+0
        STRH     R0,[R4, #+14]
        STRH     R0,[R4, #+12]
        STRH     R0,[R4, #+10]
        STRH     R0,[R4, #+8]
//  120             
//  121       HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//  122       HD44780_writeString("MSG:001 - QUEUE INDEX CHANGED");
        LDR.N    R0,??DataTable0
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  123       
//  124       FLASHQUEUE_saveControl(queue);
        MOVS     R0,R4
          CFI FunCall FLASHQUEUE_saveControl
        BL       FLASHQUEUE_saveControl
//  125       
//  126       vTaskDelay(10000);
        MOVW     R0,#+10000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  127     }      
//  128 }
??FLASHQUEUE_loadControl_3:
??FLASHQUEUE_loadControl_0:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     `?<Constant "MSG:001 - QUEUE INDEX...">`
//  129 /***********************************************************************************
//  130 *     Descrição     :   Salva o bloco de controle de uma das filas
//  131 *     Parametros    :   (sFlashQueueData*) ponteiro para a fila
//  132 *     Retorno       :   nenhum
//  133 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function FLASHQUEUE_saveControl
        THUMB
//  134 void FLASHQUEUE_saveControl(sFlashQueueData *queue){
FLASHQUEUE_saveControl:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  135  
//  136   // Deixa os dois blocos de controle com
//  137   // os mesmos dados
//  138   queue->controleFlash[1].indiceBlocoInserido   = queue->controleFlash[0].indiceBlocoInserido;
        LDRH     R0,[R4, #+8]
        STRH     R0,[R4, #+18]
//  139   queue->controleFlash[1].indiceBlocoLido       = queue->controleFlash[0].indiceBlocoLido;
        LDRH     R0,[R4, #+10]
        STRH     R0,[R4, #+20]
//  140   queue->controleFlash[1].quantidadeBlocoFila   = queue->controleFlash[0].quantidadeBlocoFila;
        LDRH     R0,[R4, #+12]
        STRH     R0,[R4, #+22]
//  141   queue->controleFlash[1].quantidadeNovosBlocos = queue->controleFlash[0].quantidadeNovosBlocos;  
        LDRH     R0,[R4, #+14]
        STRH     R0,[R4, #+24]
//  142   
//  143   // Faz o calculo do checksum para o bloco de controle
//  144   // e insere nos dois blocos de controle
//  145   queue->controleFlash[1].checksum = queue->controleFlash[0].checksum = FLASHQUEUE_checksum((unsigned char*)&queue->controleFlash[0],
//  146                                                                                             sizeof(sFlashQueueControl)-2);
        MOVS     R1,#+8
        ADDS     R0,R4,#+8
          CFI FunCall FLASHQUEUE_checksum
        BL       FLASHQUEUE_checksum
        STRH     R0,[R4, #+16]
        STRH     R0,[R4, #+26]
//  147   
//  148   // Na sequência os dois blocos de controles são salvos
//  149   // em operações distintas para evitar que caso a falha
//  150   // em uma das operações resulte na corrupção dos dois
//  151   // indexadores!! Não questinona, aceita!
//  152   
//  153   // Salva o primeiro bloco de controle
//  154   LLW_blockWrite(queue->inicio_flash,
//  155                  (unsigned char*)&queue->controleFlash[0],
//  156                  sizeof(sFlashQueueControl));    
        MOVS     R2,#+10
        ADDS     R1,R4,#+8
        LDR      R0,[R4, #+0]
          CFI FunCall MEMORYWRAPPER_writeBytes
        BL       MEMORYWRAPPER_writeBytes
//  157   
//  158   // Salva o segundo bloco de controle
//  159   LLW_blockWrite(queue->inicio_flash+PAGE_SIZE,
//  160                  (unsigned char*)&queue->controleFlash[1],
//  161                  sizeof(sFlashQueueControl));                             
        MOVS     R2,#+10
        ADDS     R1,R4,#+18
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,#+128
          CFI FunCall MEMORYWRAPPER_writeBytes
        BL       MEMORYWRAPPER_writeBytes
//  162 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//  163 /***********************************************************************************
//  164 *     Descrição     :   Inicializa uma fila em flash
//  165 *     Parametros    :   (sFlashQueueData*) Ponteiro para a fila
//  166 *     Retorno       :   (unsigned char) Igual a zero se conseguir
//  167 *                       inicializar a fila
//  168 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function FLASHQUEUE_init
          CFI NoCalls
        THUMB
//  169 unsigned char FLASHQUEUE_init(sFlashQueueData* queue){
//  170   
//  171   
//  172   return 0;  
FLASHQUEUE_init:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  173 }
//  174 /***********************************************************************************
//  175 *     Descrição     :   Insere um novo evento em uma fila
//  176 *     Parametros    :   (sFlashQueueData*) Ponteiro para a fila
//  177 *                       (void*)bloco de dados que será incluído na fila
//  178 *     Retorno       :   (unsigned char) Igual a zero se conseguir inicializar
//  179 *                       a fila
//  180 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function FLASHQUEUE_append
        THUMB
//  181 unsigned char FLASHQUEUE_append(sFlashQueueData* queue,void *pData){
FLASHQUEUE_append:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  182   
//  183   FLASHQUEUE_loadControl(queue);
        MOVS     R0,R4
          CFI FunCall FLASHQUEUE_loadControl
        BL       FLASHQUEUE_loadControl
//  184   // Após a carga do bloco de controle, o 
//  185   // bloco de indice zero sempre virá com os dados
//  186   // corretos, caso ocorra a perda ele virá zerado
//  187   // mas os dados nele contido serão consistentes
//  188   
//  189   /// A quantidade de posições livres na fila é dado
//  190   /// pelo cálculo QtdLivre = Total - Ocupadas
//  191   /// caso não existam posições livres, não insere o evento...
//  192   //if( (queue->posicoes - queue->controleFlash[0].quantidadeBlocoFila)<=0)
//  193     //return 1;
//  194   
//  195   unsigned int inicioAreaDados = queue->inicio_flash+(PAGE_SIZE<<1);
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,#+256
//  196   
//  197   LLW_blockWrite(inicioAreaDados + (queue->controleFlash[0].indiceBlocoInserido*queue->tamanhoBloco),
//  198                  pData,
//  199                  queue->tamanhoBloco);
        LDRB     R2,[R4, #+6]
        MOVS     R1,R5
        LDRH     R3,[R4, #+8]
        LDRB     R5,[R4, #+6]
        MLA      R0,R5,R3,R0
          CFI FunCall MEMORYWRAPPER_writeBytes
        BL       MEMORYWRAPPER_writeBytes
//  200                  
//  201   queue->controleFlash[0].indiceBlocoInserido = (queue->controleFlash[0].indiceBlocoInserido + 1) % 
//  202                                                  queue->posicoes;
        LDRH     R0,[R4, #+8]
        ADDS     R0,R0,#+1
        LDRH     R1,[R4, #+4]
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        STRH     R0,[R4, #+8]
//  203   queue->controleFlash[0].quantidadeBlocoFila++;
        LDRH     R0,[R4, #+12]
        ADDS     R0,R0,#+1
        STRH     R0,[R4, #+12]
//  204   if(queue->controleFlash[0].quantidadeBlocoFila>queue->posicoes)
        LDRH     R0,[R4, #+4]
        LDRH     R1,[R4, #+12]
        CMP      R0,R1
        BCS.N    ??FLASHQUEUE_append_0
//  205     queue->controleFlash[0].quantidadeBlocoFila = queue->controleFlash[0].quantidadeBlocoFila>queue->posicoes;
        LDRH     R0,[R4, #+4]
        LDRH     R1,[R4, #+12]
        CMP      R0,R1
        BCS.N    ??FLASHQUEUE_append_1
        MOVS     R0,#+1
        B.N      ??FLASHQUEUE_append_2
??FLASHQUEUE_append_1:
        MOVS     R0,#+0
??FLASHQUEUE_append_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRH     R0,[R4, #+12]
//  206   
//  207   /*
//  208   queue->controleFlash[0].quantidadeNovosBlocos = (queue->controleFlash[0].quantidadeNovosBlocos+1) % 
//  209                                                    queue->posicoes;
//  210   */
//  211   
//  212   //Faz uma fila circular com os últimos 10....
//  213   queue->controleFlash[0].quantidadeNovosBlocos++;
??FLASHQUEUE_append_0:
        LDRH     R0,[R4, #+14]
        ADDS     R0,R0,#+1
        STRH     R0,[R4, #+14]
//  214   if(queue->controleFlash[0].quantidadeNovosBlocos > queue->posicoes)
        LDRH     R0,[R4, #+4]
        LDRH     R1,[R4, #+14]
        CMP      R0,R1
        BCS.N    ??FLASHQUEUE_append_3
//  215    queue->controleFlash[0].quantidadeNovosBlocos = queue->posicoes;
        LDRH     R0,[R4, #+4]
        STRH     R0,[R4, #+14]
//  216   
//  217   FLASHQUEUE_saveControl(queue);  
??FLASHQUEUE_append_3:
        MOVS     R0,R4
          CFI FunCall FLASHQUEUE_saveControl
        BL       FLASHQUEUE_saveControl
//  218   
//  219   return 0;
        MOVS     R0,#+0
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock3
//  220 }
//  221 /***********************************************************************************
//  222 *     Descrição     :   Lê o primeiro evento inserido na fila
//  223 *     Parametros    :   (sFlashQueueData*) Ponteiro para a fila
//  224 *                       (unsigned short int) offset desde o primeiro evento novo
//  225 *                       (void*) Ponteiro para o local onde serão recebidos os dados
//  226 *     Retorno       :   (unsigned char) igual a zero se conseguir ler os dados
//  227 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function FLASHQUEUE_readFromFirst
        THUMB
//  228 unsigned char FLASHQUEUE_readFromFirst(sFlashQueueData* queue,unsigned short int offset,
//  229                                        void *pData){
FLASHQUEUE_readFromFirst:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
//  230                                          
//  231   FLASHQUEUE_loadControl(queue);                                         
        MOVS     R0,R4
          CFI FunCall FLASHQUEUE_loadControl
        BL       FLASHQUEUE_loadControl
//  232   if(offset>queue->posicoes-1)
        LDRH     R0,[R4, #+4]
        SUBS     R0,R0,#+1
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R0,R6
        BGE.N    ??FLASHQUEUE_readFromFirst_0
//  233     return 0xFF;
        MOVS     R0,#+255
        B.N      ??FLASHQUEUE_readFromFirst_1
//  234   
//  235   unsigned int indiceHistorico;
//  236  
//  237   if(queue->controleFlash[0].indiceBlocoInserido>offset)
??FLASHQUEUE_readFromFirst_0:
        LDRH     R0,[R4, #+8]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,R0
        BCS.N    ??FLASHQUEUE_readFromFirst_2
//  238     indiceHistorico = (queue->controleFlash[0].indiceBlocoInserido-1) - offset;
        LDRH     R0,[R4, #+8]
        SUBS     R0,R0,#+1
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        SUBS     R0,R0,R6
        B.N      ??FLASHQUEUE_readFromFirst_3
//  239   else
//  240     indiceHistorico = queue->posicoes - (offset - queue->controleFlash[0].indiceBlocoInserido);
??FLASHQUEUE_readFromFirst_2:
        LDRH     R0,[R4, #+4]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        SUBS     R0,R0,R6
        LDRH     R1,[R4, #+8]
        ADDS     R0,R1,R0
//  241    
//  242   unsigned int inicioAreaDados = queue->inicio_flash+(PAGE_SIZE<<1);
??FLASHQUEUE_readFromFirst_3:
        LDR      R1,[R4, #+0]
        ADDS     R3,R1,#+256
//  243   
//  244   LLW_blockRead(inicioAreaDados + (indiceHistorico*queue->tamanhoBloco),
//  245                 (unsigned char*)pData,
//  246                 queue->tamanhoBloco);                                       
        LDRB     R2,[R4, #+6]
        MOVS     R1,R5
        LDRB     R5,[R4, #+6]
        MLA      R0,R5,R0,R3
          CFI FunCall MEMORYWRAPPER_readBytes
        BL       MEMORYWRAPPER_readBytes
//  247                                          
//  248   FLASHQUEUE_saveControl(queue);  
        MOVS     R0,R4
          CFI FunCall FLASHQUEUE_saveControl
        BL       FLASHQUEUE_saveControl
//  249   return 0;  
        MOVS     R0,#+0
??FLASHQUEUE_readFromFirst_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock4
//  250 }
//  251 /***********************************************************************************
//  252 *     Descrição     :   Lê com offset a partir do último evento inserido na fila
//  253 *     Parametros    :   (sFlashQueue*) Ponteiro para a fila
//  254 *                       (unsigned short int) offset desde o ultimo evento inserido
//  255 *                       (void*) Ponteiro para o local onde serão recebidos os dados
//  256 *     Retorno       :   (unsigned char) Igual a zero se conseguir ler os dados
//  257 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function FLASHQUEUE_readFromLast
        THUMB
//  258 unsigned char FLASHQUEUE_readFromLast(sFlashQueueData *queue,unsigned short int offSet,
//  259                                       void *pData){
FLASHQUEUE_readFromLast:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  260   FLASHQUEUE_loadControl(queue);
        MOVS     R0,R4
          CFI FunCall FLASHQUEUE_loadControl
        BL       FLASHQUEUE_loadControl
//  261 
//  262   // Se a quantidade de novos blocos na
//  263   // fila for menor do que a posição
//  264   // do indice não faz a procura
//  265   // na dataflash
//  266   if(queue->controleFlash[0].quantidadeNovosBlocos<offSet)
        LDRH     R0,[R4, #+14]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R0,R5
        BCS.N    ??FLASHQUEUE_readFromLast_0
//  267     return 1;
        MOVS     R0,#+1
        B.N      ??FLASHQUEUE_readFromLast_1
//  268   
//  269   unsigned int inicioAreaDados = queue->inicio_flash+(PAGE_SIZE<<1);
??FLASHQUEUE_readFromLast_0:
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,#+256
//  270   
//  271   LLW_blockRead(inicioAreaDados + ((queue->controleFlash[0].indiceBlocoLido+offSet)*queue->tamanhoBloco),
//  272                 (unsigned char*)pData,
//  273                 queue->tamanhoBloco);                                                                                                                             
        LDRB     R2,[R4, #+6]
        MOVS     R1,R6
        LDRH     R3,[R4, #+10]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R3,R5,R3
        LDRB     R4,[R4, #+6]
        MLA      R0,R4,R3,R0
          CFI FunCall MEMORYWRAPPER_readBytes
        BL       MEMORYWRAPPER_readBytes
//  274   return 0;                                        
        MOVS     R0,#+0
??FLASHQUEUE_readFromLast_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock5
//  275 }
//  276 /***********************************************************************************
//  277 *     Descrição      :    Faz o ajuste do ponteiro de primeiro inserido
//  278 *     Parametros     :    (sFlashQueueData*) Ponteiro para a fila
//  279 *                         (unsigned short int) valor somado ao ponteiro ultimo inserido
//  280 *     Retorno        :    (unsigned char) Igual a zero se conseguir ajustar 
//  281 *                         o ponteiro
//  282 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function FLASHQUEUE_ajustaPonteiro
        THUMB
//  283 unsigned char FLASHQUEUE_ajustaPonteiro(sFlashQueueData* queue,unsigned short int offset){
FLASHQUEUE_ajustaPonteiro:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  284   
//  285   FLASHQUEUE_loadControl(queue);  
        MOVS     R0,R4
          CFI FunCall FLASHQUEUE_loadControl
        BL       FLASHQUEUE_loadControl
//  286   
//  287   
//  288   ///Arrumar isso no futuro!!!!
//  289   if(offset==1){    
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+1
        BNE.N    ??FLASHQUEUE_ajustaPonteiro_0
//  290     if(queue->controleFlash[0].quantidadeNovosBlocos==1){
        LDRH     R0,[R4, #+14]
        CMP      R0,#+1
        BNE.N    ??FLASHQUEUE_ajustaPonteiro_0
//  291         queue->controleFlash[0].indiceBlocoLido = queue->controleFlash[0].indiceBlocoInserido;        
        LDRH     R0,[R4, #+8]
        STRH     R0,[R4, #+10]
//  292         queue->controleFlash[0].quantidadeNovosBlocos = 0;
        MOVS     R0,#+0
        STRH     R0,[R4, #+14]
//  293         FLASHQUEUE_saveControl(queue);   
        MOVS     R0,R4
          CFI FunCall FLASHQUEUE_saveControl
        BL       FLASHQUEUE_saveControl
//  294     }
//  295   }
//  296     
//  297   // Sempre ajusta o bloco lido com o bloco inserido
//  298   // e zera a quantidade de novos blocos 
//  299   // O parametros offset ficou na chamada de funções
//  300   // por questões de compatibilidade com
//  301   // o software que utilizada essa biblioteca
//  302   // como cliente
//  303   // TODO: Remover o parametro da função
//  304   //
//  305   queue->controleFlash[0].indiceBlocoLido = queue->controleFlash[0].indiceBlocoInserido;    
??FLASHQUEUE_ajustaPonteiro_0:
        LDRH     R0,[R4, #+8]
        STRH     R0,[R4, #+10]
//  306   queue->controleFlash[0].quantidadeNovosBlocos = 0;
        MOVS     R0,#+0
        STRH     R0,[R4, #+14]
//  307   
//  308   FLASHQUEUE_saveControl(queue);   
        MOVS     R0,R4
          CFI FunCall FLASHQUEUE_saveControl
        BL       FLASHQUEUE_saveControl
//  309   return 0;  
        MOVS     R0,#+0
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock6
//  310 }
//  311 /***********************************************************************************
//  312 *     Descrição       :   Formata uma das filas para o estado onde não há eventos
//  313 *                         disponíveis
//  314 *     Parametros      :   (sFlashQueue*) Ponteiro para a fila
//  315 *     Retorno         :   (unsigned char) Igual a zero se conseguir formatar 
//  316 *                         a fila
//  317 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function FLASHQUEUE_formata
        THUMB
//  318 unsigned char FLASHQUEUE_formata(sFlashQueueData *queue){
FLASHQUEUE_formata:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  319     
//  320   queue->controleFlash[0].indiceBlocoInserido = 0;
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
//  321   queue->controleFlash[0].indiceBlocoLido = 0;
        MOVS     R1,#+0
        STRH     R1,[R0, #+10]
//  322   queue->controleFlash[0].quantidadeBlocoFila = 0;
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
//  323   queue->controleFlash[0].quantidadeNovosBlocos = 0;  
        MOVS     R1,#+0
        STRH     R1,[R0, #+14]
//  324   
//  325   FLASHQUEUE_saveControl(queue);   
          CFI FunCall FLASHQUEUE_saveControl
        BL       FLASHQUEUE_saveControl
//  326   
//  327   return 0;  
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock7
//  328 }
//  329 /***********************************************************************************
//  330 *     Descrição       :   Faz o calculo do checksum de um buffer qualquer
//  331 *     Parametros      :   (unsigned char*) ponteiro para o buffer
//  332 *                         (unsigned short int) tamanho do buffer
//  333 *     Retorno         :   (unsigned char) checksum do buffer
//  334 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function FLASHQUEUE_checksum
          CFI NoCalls
        THUMB
//  335 unsigned char FLASHQUEUE_checksum(unsigned char *buffer,unsigned short int size){
FLASHQUEUE_checksum:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  336   unsigned short int soma=0;    
        MOVS     R2,#+0
//  337     
//  338   for(unsigned short int i=0;i<size;i++)
        MOVS     R3,#+0
        B.N      ??FLASHQUEUE_checksum_0
//  339     soma+=buffer[i];
??FLASHQUEUE_checksum_1:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRB     R4,[R3, R0]
        ADDS     R2,R4,R2
        ADDS     R3,R3,#+1
??FLASHQUEUE_checksum_0:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R3,R1
        BCC.N    ??FLASHQUEUE_checksum_1
//  340 
//  341   return (unsigned char)((unsigned short int)256 - soma);
        RSBS     R0,R2,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  342 }  
//  343 /***********************************************************************************
//  344 *     Descrição       :   Calcula o tamanho de uma fila
//  345 *     Parametros      :   nenhum
//  346 *     Retorno         :   nenhum
//  347 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function FLASHQUEUE_getSize
        THUMB
//  348 unsigned short int FLASHQUEUE_getSize(sFlashQueueData *queue){
FLASHQUEUE_getSize:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  349   
//  350   FLASHQUEUE_loadControl(queue);  
        MOVS     R0,R4
          CFI FunCall FLASHQUEUE_loadControl
        BL       FLASHQUEUE_loadControl
//  351   return queue->controleFlash[0].quantidadeNovosBlocos;
        LDRH     R0,[R4, #+14]
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock9
//  352 }
//  353 /***********************************************************************************
//  354 *     Descrição       :   Lê o tamanho real de uma fila
//  355 *     Parametros      :   (sFlashQueueData *queue)
//  356 *     Retorno         :   (unsigned short int) tamanho real da fila
//  357 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function FLASHQUEUE_getRealSize
        THUMB
//  358 unsigned short int FLASHQUEUE_getRealSize(sFlashQueueData *queue){
FLASHQUEUE_getRealSize:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  359 
//  360   FLASHQUEUE_loadControl(queue);  
        MOVS     R0,R4
          CFI FunCall FLASHQUEUE_loadControl
        BL       FLASHQUEUE_loadControl
//  361   return queue->controleFlash[0].quantidadeBlocoFila;  
        LDRH     R0,[R4, #+12]
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock10
//  362 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "MSG:001 - QUEUE INDEX...">`:
        DATA
        DC8 "MSG:001 - QUEUE INDEX CHANGED"
        DC8 0, 0

        END
//  363 /***********************************************************************************
//  364 *     Fim do arquivo
//  365 ***********************************************************************************/
// 
//  32 bytes in section .rodata
// 586 bytes in section .text
// 
// 586 bytes of CODE  memory
//  32 bytes of CONST memory
//
//Errors: none
//Warnings: none
