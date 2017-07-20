///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  11:07:29 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Teclado\Teclado.c               /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\Teclado\Teclado.c -lC           /
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
//                    pocaG2\SOFTWARE\Debug\List\Teclado.s                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Teclado

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC TECLADO_bufferAmostragem
        PUBLIC TECLADO_contadorRepeticao
        PUBLIC TECLADO_contadorTimeout
        PUBLIC TECLADO_eTecla_to_String
        PUBLIC TECLADO_getChavePorta
        PUBLIC TECLADO_getChaveReservaPapel
        PUBLIC TECLADO_getContadorInatividade
        PUBLIC TECLADO_getch
        PUBLIC TECLADO_ini
        PUBLIC TECLADO_timerTick
        PUBLIC _A_FIO1PIN
        PUBLIC _A_FIO3PIN
        PUBLIC nomeTeclas
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\Teclado\Teclado.c
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
//   17 |       Arquivo            :  Teclado.c
//   18 |       Descrição          :  módulo principal do sistema
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  10/02/2015
//   22 |
//   23 |       Revisões           :  1.0.0.0
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 /***********************************************************************************
//   29 *       Includes
//   30 ***********************************************************************************/
//   31 #include <nxp\iolpc1768.h>

        ASEGN `.noinit`:DATA:NOROOT,02009c034H
        SECTION_GROUP _A_FIO1PIN
// __absolute union <unnamed> volatile _A_FIO1PIN
_A_FIO1PIN:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c074H
        SECTION_GROUP _A_FIO3PIN
// __absolute union <unnamed> volatile _A_FIO3PIN
_A_FIO3PIN:
        DS8 4
//   32 #include "teclado.h"
//   33 #include "..\..\includes.h"
//   34 
//   35 /***********************************************************************************
//   36 *       Definições
//   37 ***********************************************************************************/
//   38 #define TECLA_ESC_PIN                   (0x01)<<8
//   39 #define TECLA_INC_PIN                   (0x01)<<9
//   40 #define TECLA_DEC_PIN                   (0x01)<<10
//   41 #define TECLA_ENTER_PIN                 (0x01)<<14
//   42 #define TECLA_GRATIS_PIN                (0x01)<<25        
//   43 #define CHAVE_FIM_PAPEL                 (unsigned int)(0x01)<<31
//   44 #define CHAVE_PORTA_ABERTA              (unsigned int)(0x01)<<30
//   45 
//   46 #define GET_TECLA_ESC()                 (FIO1PIN&TECLA_ESC_PIN)?0:1
//   47 #define GET_TECLA_INC()                 (FIO1PIN&TECLA_INC_PIN)?0:2
//   48 #define GET_TECLA_DEC()                 (FIO1PIN&TECLA_DEC_PIN)?0:4
//   49 #define GET_TECLA_ENTER()               (FIO1PIN&TECLA_ENTER_PIN)?0:8        
//   50 #define GET_TECLA_GRATIS()              (FIO3PIN&TECLA_GRATIS_PIN)?0:16
//   51 
//   52 #define TAM_BUF_TECLADO                 8
//   53 #define CICLOS_TECLADO                  50/8
//   54 #define RELOAD_CONTADOR_REPETICAO       2000
//   55 #define RELOAD_REPETICAO                50        
//   56 
//   57 #define RELOAD_CONTADOR_TIMEOUT         60000
//   58 /***********************************************************************************
//   59 *       Constantes
//   60 ***********************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   61 const char *nomeTeclas[6]={
nomeTeclas:
        DATA
        DC32 `?<Constant "NENHUMA">`, `?<Constant "ESC    ">`
        DC32 `?<Constant "DEC    ">`, `?<Constant "INC    ">`
        DC32 `?<Constant "ENTER  ">`, `?<Constant "GRATIS">`
//   62   "NENHUMA",
//   63   "ESC    ",
//   64   "DEC    ",  
//   65   "INC    ",
//   66   "ENTER  ",
//   67   "GRATIS"
//   68 };
//   69 
//   70 
//   71 /***********************************************************************************
//   72 *       Variaveis locais
//   73 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   74 unsigned char TECLADO_bufferAmostragem[TAM_BUF_TECLADO];
TECLADO_bufferAmostragem:
        DS8 8

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   75 unsigned short int TECLADO_contadorRepeticao=1;
TECLADO_contadorRepeticao:
        DATA
        DC16 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   76 unsigned int TECLADO_contadorTimeout=0;
TECLADO_contadorTimeout:
        DS8 4
//   77 
//   78 /***********************************************************************************
//   79 *       Funções locais
//   80 ***********************************************************************************/
//   81 
//   82 /***********************************************************************************
//   83 *       Descrição       :       inicialização da biblioteca
//   84 *       Parametros      :       nenhum
//   85 *       Retorno         :       nenhum
//   86 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function TECLADO_ini
          CFI NoCalls
        THUMB
//   87 void TECLADO_ini(void){
//   88   
//   89   
//   90   
//   91 }
TECLADO_ini:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   92 /***********************************************************************************
//   93 *       Descrição       :       Tick de timer da biblioteca do teclado
//   94 *       Parametros      :       nenhum
//   95 *       Retorno         :       nenhum
//   96 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function TECLADO_timerTick
          CFI NoCalls
        THUMB
//   97 void TECLADO_timerTick(void){
//   98   static unsigned char indice=0;
//   99   static unsigned short int ciclos=1;
//  100   
//  101   if(TECLADO_contadorTimeout)
TECLADO_timerTick:
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??TECLADO_timerTick_0
//  102     TECLADO_contadorTimeout--;
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable5
        STR      R0,[R1, #+0]
//  103   
//  104   if(TECLADO_contadorRepeticao)
??TECLADO_timerTick_0:
        LDR.N    R0,??DataTable5_1
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??TECLADO_timerTick_1
//  105     TECLADO_contadorRepeticao--;
        LDR.N    R0,??DataTable5_1
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable5_1
        STRH     R0,[R1, #+0]
//  106   
//  107   if(ciclos)
??TECLADO_timerTick_1:
        LDR.N    R0,??DataTable5_2
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??TECLADO_timerTick_2
//  108     ciclos--;
        LDR.N    R0,??DataTable5_2
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable5_2
        STRH     R0,[R1, #+0]
        B.N      ??TECLADO_timerTick_3
//  109   else{
//  110     TECLADO_bufferAmostragem[indice] = 0;
??TECLADO_timerTick_2:
        LDR.N    R0,??DataTable5_3
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable5_4
        MOVS     R2,#+0
        STRB     R2,[R0, R1]
//  111     TECLADO_bufferAmostragem[indice] |= GET_TECLA_ESC();  
        LDR.N    R0,??DataTable5_3
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable5_4
        LDRB     R0,[R0, R1]
        LDR.N    R1,??DataTable5_5  ;; 0x2009c034
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+8,#+1
        ANDS     R1,R1,#0x1
        EORS     R1,R1,#0x1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable5_3
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable5_4
        STRB     R0,[R1, R2]
//  112     TECLADO_bufferAmostragem[indice] |= GET_TECLA_INC();  
        LDR.N    R0,??DataTable5_5  ;; 0x2009c034
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+22
        BPL.N    ??TECLADO_timerTick_4
        MOVS     R0,#+0
        B.N      ??TECLADO_timerTick_5
??TECLADO_timerTick_4:
        MOVS     R0,#+2
??TECLADO_timerTick_5:
        LDR.N    R1,??DataTable5_3
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable5_4
        LDRB     R1,[R1, R2]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable5_3
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable5_4
        STRB     R0,[R1, R2]
//  113     TECLADO_bufferAmostragem[indice] |= GET_TECLA_DEC();
        LDR.N    R0,??DataTable5_5  ;; 0x2009c034
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+21
        BPL.N    ??TECLADO_timerTick_6
        MOVS     R0,#+0
        B.N      ??TECLADO_timerTick_7
??TECLADO_timerTick_6:
        MOVS     R0,#+4
??TECLADO_timerTick_7:
        LDR.N    R1,??DataTable5_3
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable5_4
        LDRB     R1,[R1, R2]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable5_3
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable5_4
        STRB     R0,[R1, R2]
//  114     TECLADO_bufferAmostragem[indice] |= GET_TECLA_ENTER();
        LDR.N    R0,??DataTable5_5  ;; 0x2009c034
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+17
        BPL.N    ??TECLADO_timerTick_8
        MOVS     R0,#+0
        B.N      ??TECLADO_timerTick_9
??TECLADO_timerTick_8:
        MOVS     R0,#+8
??TECLADO_timerTick_9:
        LDR.N    R1,??DataTable5_3
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable5_4
        LDRB     R1,[R1, R2]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable5_3
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable5_4
        STRB     R0,[R1, R2]
//  115     TECLADO_bufferAmostragem[indice] |= GET_TECLA_GRATIS();
        LDR.N    R0,??DataTable5_6  ;; 0x2009c074
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+6
        BPL.N    ??TECLADO_timerTick_10
        MOVS     R0,#+0
        B.N      ??TECLADO_timerTick_11
??TECLADO_timerTick_10:
        MOVS     R0,#+16
??TECLADO_timerTick_11:
        LDR.N    R1,??DataTable5_3
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable5_4
        LDRB     R1,[R1, R2]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable5_3
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??DataTable5_4
        STRB     R0,[R1, R2]
//  116   
//  117     indice = (indice + 1) % TAM_BUF_TECLADO;    
        LDR.N    R0,??DataTable5_3
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+8
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.N    R0,??DataTable5_3
        STRB     R2,[R0, #+0]
//  118     ciclos = CICLOS_TECLADO;
        LDR.N    R0,??DataTable5_2
        MOVS     R1,#+6
        STRH     R1,[R0, #+0]
//  119   }
//  120 }
??TECLADO_timerTick_3:
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_FIO1PIN
        REQUIRE _A_FIO3PIN

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??indice:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(1)
??ciclos:
        DATA
        DC16 1
//  121 /***********************************************************************************
//  122 *       Descrição       :       Verifica se uma determinada tecla foi pressionada
//  123 *       Parametros      :       nenhum
//  124 *       Retorno         :       (eTECLA) código da tecla pressionada
//  125 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function TECLADO_getch
          CFI NoCalls
        THUMB
//  126 eTECLA TECLADO_getch(void){
TECLADO_getch:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  127   unsigned char contador;
//  128   static unsigned char teclaLivre=0;
//  129   
//  130   contador=0;
        MOVS     R1,#+0
//  131   for(unsigned char i=0;i<TAM_BUF_TECLADO;i++)    
        MOVS     R0,#+0
        B.N      ??TECLADO_getch_0
//  132     if((TECLADO_bufferAmostragem[i]&0x09)==0x09)
??TECLADO_getch_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable5_4
        LDRB     R2,[R0, R2]
        ANDS     R2,R2,#0x9
        CMP      R2,#+9
        BNE.N    ??TECLADO_getch_2
//  133       contador++;
        ADDS     R1,R1,#+1
??TECLADO_getch_2:
        ADDS     R0,R0,#+1
??TECLADO_getch_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+8
        BLT.N    ??TECLADO_getch_1
//  134   
//  135   if(contador>(TAM_BUF_TECLADO>>1))
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+5
        BLT.N    ??TECLADO_getch_3
//  136     return TECLA_MENU_AVANCADO;
        MOVS     R0,#+8
        B.N      ??TECLADO_getch_4
//  137     
//  138   for(unsigned char i=0;i<5;i++){
??TECLADO_getch_3:
        MOVS     R0,#+0
        B.N      ??TECLADO_getch_5
??TECLADO_getch_6:
        ADDS     R0,R0,#+1
??TECLADO_getch_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BGE.N    ??TECLADO_getch_7
//  139     // inicia a contagem em zero
//  140     contador=0;
        MOVS     R1,#+0
//  141     // Conta as ocorrências da 
//  142     // tecla no buffer
//  143     for(unsigned char j=0;j<TAM_BUF_TECLADO;j++)
        MOVS     R2,#+0
        B.N      ??TECLADO_getch_8
//  144       if(TECLADO_bufferAmostragem[j]&(0x01<<i))
??TECLADO_getch_9:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.N    R3,??DataTable5_4
        LDRB     R3,[R2, R3]
        MOVS     R4,#+1
        LSLS     R4,R4,R0
        TST      R3,R4
        BEQ.N    ??TECLADO_getch_10
//  145         contador++;
        ADDS     R1,R1,#+1
??TECLADO_getch_10:
        ADDS     R2,R2,#+1
??TECLADO_getch_8:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+8
        BLT.N    ??TECLADO_getch_9
//  146       
//  147      if(contador>(TAM_BUF_TECLADO>>1)){
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+5
        BLT.N    ??TECLADO_getch_6
//  148                      
//  149        if(!TECLADO_contadorRepeticao){                 
        LDR.N    R1,??DataTable5_1
        LDRH     R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??TECLADO_getch_11
//  150          if(teclaLivre){
        LDR.N    R1,??DataTable5_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??TECLADO_getch_12
//  151             teclaLivre = 0;
        LDR.N    R1,??DataTable5_7
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
//  152             TECLADO_contadorRepeticao = RELOAD_CONTADOR_REPETICAO;
        LDR.N    R1,??DataTable5_1
        MOV      R2,#+2000
        STRH     R2,[R1, #+0]
//  153             TECLADO_contadorTimeout = RELOAD_CONTADOR_TIMEOUT;
        LDR.N    R1,??DataTable5
        MOVW     R2,#+60000
        STR      R2,[R1, #+0]
//  154             //ultimaTecla = (eTECLA)(i+1);           
//  155             return (eTECLA)(i+1);           
        ADDS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??TECLADO_getch_4
//  156          }
//  157          else{
//  158             TECLADO_contadorRepeticao = RELOAD_REPETICAO;
??TECLADO_getch_12:
        LDR.N    R1,??DataTable5_1
        MOVS     R2,#+50
        STRH     R2,[R1, #+0]
//  159             TECLADO_contadorTimeout = RELOAD_CONTADOR_TIMEOUT;
        LDR.N    R1,??DataTable5
        MOVW     R2,#+60000
        STR      R2,[R1, #+0]
//  160             //ultimaTecla = (eTECLA)(i+1);           
//  161             return (eTECLA)(i+1);           
        ADDS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??TECLADO_getch_4
//  162          }
//  163        }
//  164        else{
//  165          if(teclaLivre){
??TECLADO_getch_11:
        LDR.N    R1,??DataTable5_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??TECLADO_getch_13
//  166             teclaLivre = 0;
        LDR.N    R1,??DataTable5_7
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
//  167             TECLADO_contadorRepeticao = RELOAD_CONTADOR_REPETICAO;
        LDR.N    R1,??DataTable5_1
        MOV      R2,#+2000
        STRH     R2,[R1, #+0]
//  168             TECLADO_contadorTimeout = RELOAD_CONTADOR_TIMEOUT;
        LDR.N    R1,??DataTable5
        MOVW     R2,#+60000
        STR      R2,[R1, #+0]
//  169             //ultimaTecla = (eTECLA)(i+1);           
//  170             return (eTECLA)(i+1);                      
        ADDS     R0,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??TECLADO_getch_4
//  171          }
//  172          else
//  173            return NENHUMA_TECLA;       
??TECLADO_getch_13:
        MOVS     R0,#+0
        B.N      ??TECLADO_getch_4
//  174        }
//  175      }
//  176   }       
//  177   
//  178   //ultimaTecla = NENHUMA_TECLA;
//  179   teclaLivre = 1;
??TECLADO_getch_7:
        LDR.N    R0,??DataTable5_7
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  180   return NENHUMA_TECLA;
        MOVS     R0,#+0
??TECLADO_getch_4:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  181 }

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??teclaLivre:
        DS8 1
//  182 /***********************************************************************************
//  183 *       Descrição       :       Converte uma tecla para string
//  184 *       Parametros      :       (eTECLA) código da tecla
//  185 *       Retorno         :       (char*) nome da tecla
//  186 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function TECLADO_eTecla_to_String
          CFI NoCalls
        THUMB
//  187 char* TECLADO_eTecla_to_String(eTECLA tecla){
//  188   
//  189   return (char*)nomeTeclas[(unsigned char)tecla];
TECLADO_eTecla_to_String:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable5_8
        LDR      R0,[R1, R0, LSL #+2]
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  190 }
//  191 /***********************************************************************************
//  192 *       Descrição       :       Getter para o contador de inatividade do teclado
//  193 *       Parametros      :       nenhum
//  194 *       Retorno         :       (unsigned int) maior do que zero se 
//  195 *                                              o contador for maior do que zero
//  196 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function TECLADO_getContadorInatividade
          CFI NoCalls
        THUMB
//  197 unsigned int TECLADO_getContadorInatividade(void){
//  198   
//  199   return TECLADO_contadorTimeout;  
TECLADO_getContadorInatividade:
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  200 }
//  201 /***********************************************************************************
//  202 *       Descrição       :       Getter para os sinais da chave de porta 
//  203 *                               aberta
//  204 *       Parametros      :       nenhum
//  205 *       Retorno         :       (unsigned char) maior do que zero se a chave
//  206 *                                               de porta aberta estiver 
//  207 *                                               pressionada
//  208 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function TECLADO_getChavePorta
          CFI NoCalls
        THUMB
//  209 unsigned char TECLADO_getChavePorta(void){
//  210   unsigned char soma=0;
TECLADO_getChavePorta:
        MOVS     R0,#+0
//  211   
//  212   for(unsigned char i=0;i<TAM_BUF_TECLADO;i++)
        MOVS     R1,#+0
        B.N      ??TECLADO_getChavePorta_0
//  213     if(TECLADO_bufferAmostragem[i]&64)
??TECLADO_getChavePorta_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R2,??DataTable5_4
        LDRB     R2,[R1, R2]
        LSLS     R2,R2,#+25
        BPL.N    ??TECLADO_getChavePorta_2
//  214       soma++;
        ADDS     R0,R0,#+1
??TECLADO_getChavePorta_2:
        ADDS     R1,R1,#+1
??TECLADO_getChavePorta_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+8
        BLT.N    ??TECLADO_getChavePorta_1
//  215   
//  216   return (soma>(TAM_BUF_TECLADO>>1));
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BLT.N    ??TECLADO_getChavePorta_3
        MOVS     R0,#+1
        B.N      ??TECLADO_getChavePorta_4
??TECLADO_getChavePorta_3:
        MOVS     R0,#+0
??TECLADO_getChavePorta_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  217 }
//  218 /***********************************************************************************
//  219 *       Descrição       :       Getter para o sinal da chave de reserva do papel
//  220 *       Parametros      :       nenhum
//  221 *       Retorno         :       (unsigned char) maior do que zero se a chave
//  222 *                               de reserva do papel estiver pressionada
//  223 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function TECLADO_getChaveReservaPapel
          CFI NoCalls
        THUMB
//  224 unsigned char TECLADO_getChaveReservaPapel(void){
//  225   unsigned char soma=0;
TECLADO_getChaveReservaPapel:
        MOVS     R0,#+0
//  226   
//  227   for(unsigned char i=0;i<TAM_BUF_TECLADO;i++)
        MOVS     R1,#+0
        B.N      ??TECLADO_getChaveReservaPapel_0
//  228     if(TECLADO_bufferAmostragem[i]&32)
??TECLADO_getChaveReservaPapel_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R2,??DataTable5_4
        LDRB     R2,[R1, R2]
        LSLS     R2,R2,#+26
        BPL.N    ??TECLADO_getChaveReservaPapel_2
//  229       soma++;
        ADDS     R0,R0,#+1
??TECLADO_getChaveReservaPapel_2:
        ADDS     R1,R1,#+1
??TECLADO_getChaveReservaPapel_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+8
        BLT.N    ??TECLADO_getChaveReservaPapel_1
//  230   
//  231   return (soma>(TAM_BUF_TECLADO>>1)); 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BLT.N    ??TECLADO_getChaveReservaPapel_3
        MOVS     R0,#+1
        B.N      ??TECLADO_getChaveReservaPapel_4
??TECLADO_getChaveReservaPapel_3:
        MOVS     R0,#+0
??TECLADO_getChaveReservaPapel_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  232 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     TECLADO_contadorTimeout

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     TECLADO_contadorRepeticao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     ??ciclos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     ??indice

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     TECLADO_bufferAmostragem

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x2009c034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x2009c074

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     ??teclaLivre

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     nomeTeclas

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "NENHUMA">`:
        DATA
        DC8 "NENHUMA"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ESC    ">`:
        DATA
        DC8 "ESC    "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "DEC    ">`:
        DATA
        DC8 "DEC    "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "INC    ">`:
        DATA
        DC8 "INC    "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "ENTER  ">`:
        DATA
        DC8 "ENTER  "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "GRATIS">`:
        DATA
        DC8 "GRATIS"
        DC8 0

        END
//  233 /***********************************************************************************
//  234 *       Fim do arquivo
//  235 ***********************************************************************************/
// 
//  14 bytes in section .bss
//  28 bytes in section .data
//   8 bytes in section .noinit (abs)
//  48 bytes in section .rodata
// 602 bytes in section .text
// 
// 602 bytes of CODE  memory
//  48 bytes of CONST memory
//  42 bytes of DATA  memory (+ 8 bytes shared)
//
//Errors: none
//Warnings: none
