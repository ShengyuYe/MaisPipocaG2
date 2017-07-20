///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  11:07:37 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\PlayerWave\PlayerWave.c         /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\PlayerWave\PlayerWave.c -lC     /
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
//                    pocaG2\SOFTWARE\Debug\List\PlayerWave.s                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME PlayerWave

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN MEMORYWRAPPER_readSingle
        EXTERN MEMORYWRAPPER_release
        EXTERN MEMORYWRAPPER_wait
        EXTERN PARAMETROS_le

        PUBLIC PLAYERWAVE_ini
        PUBLIC PLAYERWAVE_iniciaMusica
        PUBLIC PLAYERWAVE_verificaToque
        PUBLIC PLAYER_interrompeMusica
        PUBLIC PLAYRWAVE_rti
        PUBLIC T0MR0
        PUBLIC T0PR
        PUBLIC T0TC
        PUBLIC _A_CLRPEND0
        PUBLIC _A_DACR
        PUBLIC _A_IP0
        PUBLIC _A_PCLKSEL0
        PUBLIC _A_PCONP
        PUBLIC _A_PINSEL1
        PUBLIC _A_SETENA0
        PUBLIC _A_T0CTCR
        PUBLIC _A_T0EMR
        PUBLIC _A_T0IR
        PUBLIC _A_T0MCR
        PUBLIC _A_T0TCR
        PUBLIC bufferMusica
        PUBLIC dadoMusica
        PUBLIC enderecoInicialMusica
        PUBLIC tamanhoMusica
        PUBLIC volume
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\PlayerWave\PlayerWave.c
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
//   17 |       Arquivo            :  PlayerWave.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  22/02/2014
//   21 |
//   22 |       Revisões           :  1.0.0.0
//   23 |
//   24 |
//   25 | __________________________________________________________________________________
//   26 */
//   27 
//   28 /***********************************************************************************
//   29 *       Includes
//   30 ***********************************************************************************/
//   31 #include <nxp\iolpc1768.h>

        ASEGN `.noinit`:DATA:NOROOT,0e000e100H
        SECTION_GROUP _A_SETENA0
// __absolute union <unnamed> volatile _A_SETENA0
_A_SETENA0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0e000e280H
        SECTION_GROUP _A_CLRPEND0
// __absolute union <unnamed> volatile _A_CLRPEND0
_A_CLRPEND0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0e000e400H
        SECTION_GROUP _A_IP0
// __absolute union <unnamed> volatile _A_IP0
_A_IP0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0400fc1a8H
        SECTION_GROUP _A_PCLKSEL0
// __absolute union <unnamed> volatile _A_PCLKSEL0
_A_PCLKSEL0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0400fc0c4H
        SECTION_GROUP _A_PCONP
// __absolute union <unnamed> volatile _A_PCONP
_A_PCONP:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04002c004H
        SECTION_GROUP _A_PINSEL1
// __absolute union <unnamed> volatile _A_PINSEL1
_A_PINSEL1:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040004000H
        SECTION_GROUP _A_T0IR
// __absolute union <unnamed> volatile _A_T0IR
_A_T0IR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040004004H
        SECTION_GROUP _A_T0TCR
// __absolute union <unnamed> volatile _A_T0TCR
_A_T0TCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040004008H
        SECTION_GROUP T0TC
// __absolute unsigned long volatile T0TC
T0TC:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04000400cH
        SECTION_GROUP T0PR
// __absolute unsigned long volatile T0PR
T0PR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040004014H
        SECTION_GROUP _A_T0MCR
// __absolute union <unnamed> volatile _A_T0MCR
_A_T0MCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040004018H
        SECTION_GROUP T0MR0
// __absolute unsigned long volatile T0MR0
T0MR0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04000403cH
        SECTION_GROUP _A_T0EMR
// __absolute union <unnamed> volatile _A_T0EMR
_A_T0EMR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040004070H
        SECTION_GROUP _A_T0CTCR
// __absolute union <unnamed> volatile _A_T0CTCR
_A_T0CTCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04008c000H
        SECTION_GROUP _A_DACR
// __absolute union <unnamed> volatile _A_DACR
_A_DACR:
        DS8 4
//   32 #include "playerWave.h"
//   33 #include "..\..\includes.h"
//   34 
//   35 
//   36 /***********************************************************************************
//   37 *       Definições locais
//   38 ***********************************************************************************/
//   39 #define PR_TIMER_0                      600
//   40 
//   41 #define POWER_WAVE_PIN                  //(0x01)<<26
//   42 #define POWER_WAVE_INIT()               //FIO3DIR |= POWER_WAVE_PIN
//   43 #define POWER_WAVE_SET()                //FIO3SET |= POWER_WAVE_PIN
//   44 #define POWER_WAVE_CLR()                //FIO3CLR |= POWER_WAVE_PIN
//   45 
//   46 #define PINO_DAC                        (0x01)<<26
//   47 #define INI_PIN_DAC()                   FIO0DIR|= PINO_DAC
//   48 #define SET_PINO_DAC(X)                 X?(FIO0SET|=PINO_DAC):(FIO0CLR|=PINO_DAC)
//   49 
//   50 /***********************************************************************************
//   51 *       Variaveis locais
//   52 ***********************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   53 unsigned int enderecoInicialMusica=AREA_AUDIO;
enderecoInicialMusica:
        DATA
        DC32 12288

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   54 unsigned int tamanhoMusica;
tamanhoMusica:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   55 unsigned short int volume;
volume:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   56 unsigned short int dadoMusica;
dadoMusica:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   57 unsigned char bufferMusica;
bufferMusica:
        DS8 1
//   58 /***********************************************************************************
//   59 *       Funções locais
//   60 ***********************************************************************************/
//   61 extern void SST_writeDisable(void);
//   62 extern void SST_highSpeedRead(unsigned int endereco,unsigned char *buffer,
//   63                        unsigned short int size);
//   64 
//   65 /***********************************************************************************
//   66 *       Implementação das funções
//   67 ***********************************************************************************/
//   68 
//   69 /***********************************************************************************
//   70 *       Descrição       :       Inicialização do módulo
//   71 *       Parametros      :       nenhum
//   72 *       Retorno         :       nenhum
//   73 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function PLAYERWAVE_ini
          CFI NoCalls
        THUMB
//   74 void PLAYERWAVE_ini(void){
//   75   
//   76   PCONP_bit.PCTIM0 = 1; // Energiza o periférico
PLAYERWAVE_ini:
        LDR.N    R0,??DataTable4  ;; 0x400fc0c4
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable4  ;; 0x400fc0c4
        STR      R0,[R1, #+0]
//   77   PCLKSEL0_bit.PCLK_TIMER0 = 1; // Seleção do clock
        MOVS     R0,#+1
        LDR.N    R1,??DataTable4_1  ;; 0x400fc1a8
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+2,#+2
        LDR.N    R0,??DataTable4_1  ;; 0x400fc1a8
        STR      R1,[R0, #+0]
//   78   
//   79   IP0_bit.PRI_1 = 1;  
        MOVS     R0,#+1
        LDR.N    R1,??DataTable4_2  ;; 0xe000e400
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+8,#+8
        LDR.N    R0,??DataTable4_2  ;; 0xe000e400
        STR      R1,[R0, #+0]
//   80   SETENA0_bit.SETENA1 = 1; // Habilitação da interrupção do timer 1
        LDR.N    R0,??DataTable4_3  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable4_3  ;; 0xe000e100
        STR      R0,[R1, #+0]
//   81   
//   82   T0TCR_bit.CE = 1;   // Contador Habilitado
        LDR.N    R0,??DataTable4_4  ;; 0x40004004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable4_4  ;; 0x40004004
        STR      R0,[R1, #+0]
//   83   T0TCR_bit.CR = 1;   // Realiza o reset
        LDR.N    R0,??DataTable4_4  ;; 0x40004004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable4_4  ;; 0x40004004
        STR      R0,[R1, #+0]
//   84   T0TCR_bit.CR = 0;   // do contador
        LDR.N    R0,??DataTable4_4  ;; 0x40004004
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.N    R1,??DataTable4_4  ;; 0x40004004
        STR      R0,[R1, #+0]
//   85   
//   86   T0CTCR_bit.CTM = 0x00;
        LDR.N    R0,??DataTable4_5  ;; 0x40004070
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+2
        LSLS     R0,R0,#+2
        LDR.N    R1,??DataTable4_5  ;; 0x40004070
        STR      R0,[R1, #+0]
//   87   T0PR = 12;  
        LDR.N    R0,??DataTable4_6  ;; 0x4000400c
        MOVS     R1,#+12
        STR      R1,[R0, #+0]
//   88   
//   89   T0MCR_bit.MR0I = 0;
        LDR.N    R0,??DataTable4_7  ;; 0x40004014
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable4_7  ;; 0x40004014
        STR      R0,[R1, #+0]
//   90   T0MCR_bit.MR0R = 0;
        LDR.N    R0,??DataTable4_7  ;; 0x40004014
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.N    R1,??DataTable4_7  ;; 0x40004014
        STR      R0,[R1, #+0]
//   91   T0EMR_bit.EM0  = 0; // Não altera nenhum pino  
        LDR.N    R0,??DataTable4_8  ;; 0x4000403c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable4_8  ;; 0x4000403c
        STR      R0,[R1, #+0]
//   92     
//   93   T0EMR_bit.EM0  = 0;
        LDR.N    R0,??DataTable4_8  ;; 0x4000403c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable4_8  ;; 0x4000403c
        STR      R0,[R1, #+0]
//   94   T0EMR_bit.EMC0 = 0;
        LDR.N    R0,??DataTable4_8  ;; 0x4000403c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x30
        LDR.N    R1,??DataTable4_8  ;; 0x4000403c
        STR      R0,[R1, #+0]
//   95   
//   96   T0MR0 = T0TC+1000;
        LDR.N    R0,??DataTable4_9  ;; 0x40004008
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1000
        LDR.N    R1,??DataTable4_10  ;; 0x40004018
        STR      R0,[R1, #+0]
//   97     
//   98   PINSEL1_bit.P0_26 = 2;
        MOVS     R0,#+2
        LDR.N    R1,??DataTable4_11  ;; 0x4002c004
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+20,#+2
        LDR.N    R0,??DataTable4_11  ;; 0x4002c004
        STR      R1,[R0, #+0]
//   99   PCLKSEL0_bit.PCLK_DAC = 1;  
        MOVS     R0,#+1
        LDR.N    R1,??DataTable4_1  ;; 0x400fc1a8
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+22,#+2
        LDR.N    R0,??DataTable4_1  ;; 0x400fc1a8
        STR      R1,[R0, #+0]
//  100   
//  101   POWER_WAVE_INIT();
//  102   POWER_WAVE_CLR();
//  103 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_PCONP
        REQUIRE _A_PCLKSEL0
        REQUIRE _A_IP0
        REQUIRE _A_SETENA0
        REQUIRE _A_T0TCR
        REQUIRE _A_T0CTCR
        REQUIRE T0PR
        REQUIRE _A_T0MCR
        REQUIRE _A_T0EMR
        REQUIRE T0MR0
        REQUIRE T0TC
        REQUIRE _A_PINSEL1
//  104 /***********************************************************************************
//  105 *       Descrição       :      Toca um dos waves salvos na memória
//  106 *       Parametros      :     (unsigned char) indice do arquivo
//  107 *                             (unsigned char) modo 0 - único
//  108 *                                                  1 - loop
//  109 *       Retorno         :       nenhum
//  110 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function PLAYERWAVE_iniciaMusica
        THUMB
//  111 void PLAYERWAVE_iniciaMusica(unsigned char indice,unsigned char modo){
PLAYERWAVE_iniciaMusica:
        PUSH     {R2-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
        MOVS     R4,R0
//  112   unsigned int enderecoInicial;
//  113   unsigned int tamanho;
//  114     
//  115   if(indice==1)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??PLAYERWAVE_iniciaMusica_0
//  116     PARAMETROS_le(ADR_VOLUME_MUSICA,(void*)&volume);
        LDR.N    R1,??DataTable4_12
        MOVS     R0,#+29
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
        B.N      ??PLAYERWAVE_iniciaMusica_1
//  117   else
//  118     PARAMETROS_le(ADR_VOLUME_VOZ,(void*)&volume);
??PLAYERWAVE_iniciaMusica_0:
        LDR.N    R1,??DataTable4_12
        MOVS     R0,#+30
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  119     
//  120   if(volume>100)
??PLAYERWAVE_iniciaMusica_1:
        LDR.N    R0,??DataTable4_12
        LDRH     R0,[R0, #+0]
        CMP      R0,#+101
        BLT.N    ??PLAYERWAVE_iniciaMusica_2
//  121     volume = 100;
        LDR.N    R0,??DataTable4_12
        MOVS     R1,#+100
        STRH     R1,[R0, #+0]
//  122   
//  123   if(!volume)
??PLAYERWAVE_iniciaMusica_2:
        LDR.N    R0,??DataTable4_12
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PLAYERWAVE_iniciaMusica_3
//  124     return;
//  125   
//  126   POWER_WAVE_SET();    
//  127   
//  128   PARAMETROS_le(ADR_INICIO_BLOCO_MUSICA+indice,(void*)&enderecoInicial);
??PLAYERWAVE_iniciaMusica_4:
        ADD      R1,SP,#+4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+18
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  129   PARAMETROS_le(ADR_TAMANHO_BLOCO_MUSICA+indice,(void*)&tamanho);
        ADD      R1,SP,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R4,#+22
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  130   
//  131   enderecoInicialMusica = enderecoInicial;
        LDR.N    R0,??DataTable4_13
        LDR      R1,[SP, #+4]
        STR      R1,[R0, #+0]
//  132   tamanhoMusica = tamanho;
        LDR.N    R0,??DataTable4_14
        LDR      R1,[SP, #+0]
        STR      R1,[R0, #+0]
//  133   
//  134   MEMORYWRAPPER_wait();
          CFI FunCall MEMORYWRAPPER_wait
        BL       MEMORYWRAPPER_wait
//  135   
//  136   T0MR0 = T0TC+1000;  
        LDR.N    R0,??DataTable4_9  ;; 0x40004008
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1000
        LDR.N    R1,??DataTable4_10  ;; 0x40004018
        STR      R0,[R1, #+0]
//  137   T0MCR_bit.MR0I = 1;  
        LDR.N    R0,??DataTable4_7  ;; 0x40004014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable4_7  ;; 0x40004014
        STR      R0,[R1, #+0]
//  138 }
??PLAYERWAVE_iniciaMusica_3:
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock1
        REQUIRE T0MR0
        REQUIRE T0TC
        REQUIRE _A_T0MCR
//  139 /***********************************************************************************
//  140 *       Descrição       :       Para com a reprodução de uma música
//  141 *       Parametros      :       nenhum
//  142 *       Retorno         :       nenhum
//  143 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PLAYER_interrompeMusica
        THUMB
//  144 void PLAYER_interrompeMusica(void){
PLAYER_interrompeMusica:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  145   
//  146   T0MCR_bit.MR0I = 0;   
        LDR.N    R0,??DataTable4_7  ;; 0x40004014
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable4_7  ;; 0x40004014
        STR      R0,[R1, #+0]
//  147   POWER_WAVE_CLR();
//  148   tamanhoMusica = 0;
        LDR.N    R0,??DataTable4_14
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  149   MEMORYWRAPPER_release();
          CFI FunCall MEMORYWRAPPER_release
        BL       MEMORYWRAPPER_release
//  150 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
        REQUIRE _A_T0MCR
//  151 /***********************************************************************************
//  152 *       Descrição       :       Função de interrupção 
//  153 *       Parametros      :       nenhum
//  154 *       Retorno         :       nenhum
//  155 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function PLAYRWAVE_rti
        THUMB
//  156 void PLAYRWAVE_rti(void){ 
PLAYRWAVE_rti:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  157   
//  158   T0MR0 = T0TC+960;
        LDR.N    R0,??DataTable4_9  ;; 0x40004008
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+960
        LDR.N    R1,??DataTable4_10  ;; 0x40004018
        STR      R0,[R1, #+0]
//  159   
//  160   dadoMusica = MEMORYWRAPPER_readSingle(enderecoInicialMusica++)<<2;
        LDR.N    R0,??DataTable4_13
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+1
        LDR.N    R2,??DataTable4_13
        STR      R1,[R2, #+0]
          CFI FunCall MEMORYWRAPPER_readSingle
        BL       MEMORYWRAPPER_readSingle
        LSLS     R0,R0,#+2
        LDR.N    R1,??DataTable4_15
        STRH     R0,[R1, #+0]
//  161   
//  162   if(dadoMusica){
        LDR.N    R0,??DataTable4_15
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PLAYRWAVE_rti_0
//  163     dadoMusica*= volume;
        LDR.N    R0,??DataTable4_15
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable4_12
        LDRH     R1,[R1, #+0]
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable4_15
        STRH     R0,[R1, #+0]
//  164     dadoMusica/= 100;
        LDR.N    R0,??DataTable4_15
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable4_15
        STRH     R0,[R1, #+0]
//  165   }
//  166   
//  167   DACR_bit.VALUE = dadoMusica;
??PLAYRWAVE_rti_0:
        LDR.N    R0,??DataTable4_15
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable4_16  ;; 0x4008c000
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+6,#+10
        LDR.N    R0,??DataTable4_16  ;; 0x4008c000
        STR      R1,[R0, #+0]
//  168   if(tamanhoMusica){
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PLAYRWAVE_rti_1
//  169     tamanhoMusica--;
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable4_14
        STR      R0,[R1, #+0]
//  170     T0MCR_bit.MR0I = 1;    
        LDR.N    R0,??DataTable4_7  ;; 0x40004014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable4_7  ;; 0x40004014
        STR      R0,[R1, #+0]
        B.N      ??PLAYRWAVE_rti_2
//  171   }
//  172   else{
//  173     T0MCR_bit.MR0I = 0;    
??PLAYRWAVE_rti_1:
        LDR.N    R0,??DataTable4_7  ;; 0x40004014
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable4_7  ;; 0x40004014
        STR      R0,[R1, #+0]
//  174     MEMORYWRAPPER_release();
          CFI FunCall MEMORYWRAPPER_release
        BL       MEMORYWRAPPER_release
//  175   }
//  176   
//  177   T0IR_bit.CR0INT = 1;
??PLAYRWAVE_rti_2:
        MOVS     R0,#+1073758208
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        MOVS     R1,#+1073758208
        STR      R0,[R1, #+0]
//  178   CLRPEND0_bit.CLRPEND4 = 1;  
        LDR.N    R0,??DataTable4_17  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable4_17  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  179 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
        REQUIRE T0MR0
        REQUIRE T0TC
        REQUIRE _A_DACR
        REQUIRE _A_T0MCR
        REQUIRE _A_T0IR
        REQUIRE _A_CLRPEND0
//  180 /***********************************************************************************
//  181 *       Descrição       :       Verifica se uma música ainda está sendo
//  182 *                               tocada
//  183 *       Parametros      :       (nenhum)
//  184 *       Retorno         :       (unsigned char) maior do que zero se a música
//  185 *                                               ainda estiver sendo tocada
//  186 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function PLAYERWAVE_verificaToque
        THUMB
//  187 unsigned char PLAYERWAVE_verificaToque(void){
PLAYERWAVE_verificaToque:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  188  
//  189  if(!tamanhoMusica)
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??PLAYERWAVE_verificaToque_0
//  190    MEMORYWRAPPER_release();
          CFI FunCall MEMORYWRAPPER_release
        BL       MEMORYWRAPPER_release
//  191  
//  192  return  tamanhoMusica>0;
??PLAYERWAVE_verificaToque_0:
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??PLAYERWAVE_verificaToque_1
        MOVS     R0,#+1
        B.N      ??PLAYERWAVE_verificaToque_2
??PLAYERWAVE_verificaToque_1:
        MOVS     R0,#+0
??PLAYERWAVE_verificaToque_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
//  193 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x400fc0c4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x400fc1a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x40004004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x40004070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x4000400c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x40004014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     0x4000403c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     0x40004008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     0x40004018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     0x4002c004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     volume

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_13:
        DC32     enderecoInicialMusica

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_14:
        DC32     tamanhoMusica

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_15:
        DC32     dadoMusica

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_16:
        DC32     0x4008c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_17:
        DC32     0xe000e280

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  194 /***********************************************************************************
//  195 *       Fim do arquivo
//  196 ***********************************************************************************/
//  197 
// 
//   9 bytes in section .bss
//   4 bytes in section .data
//  60 bytes in section .noinit (abs)
// 618 bytes in section .text
// 
// 618 bytes of CODE memory
//  13 bytes of DATA memory (+ 60 bytes shared)
//
//Errors: none
//Warnings: none
