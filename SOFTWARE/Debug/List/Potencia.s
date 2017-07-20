///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  16:44:36 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Potencia\Potencia.c                     /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Potencia\Potencia.c -lC                 /
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
//                    pocaG2\SOFTWARE\Debug\List\Potencia.s                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Potencia

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN BOARD_lock_timer
        EXTERN PARAMETROS_le
        EXTERN vTaskDelay

        PUBLIC PORTENCIA_correcao_erro
        PUBLIC POTENCIA_bufferRotacao
        PUBLIC POTENCIA_calculaAtrasoGate
        PUBLIC POTENCIA_calcula_derivada_erro
        PUBLIC POTENCIA_calcula_integral_erro
        PUBLIC POTENCIA_captureInterrupt
        PUBLIC POTENCIA_ciclos
        PUBLIC POTENCIA_controleVelocidade
        PUBLIC POTENCIA_eintInterrupt
        PUBLIC POTENCIA_frequencia
        PUBLIC POTENCIA_getFrequenciaRede
        PUBLIC POTENCIA_getRPMmedido
        PUBLIC POTENCIA_ini
        PUBLIC POTENCIA_ligaMotor
        PUBLIC POTENCIA_mathTimer2
        PUBLIC POTENCIA_periodoCapturadoMotor
        PUBLIC POTENCIA_setRPM
        PUBLIC POTENCIA_set_neutro
        PUBLIC POTENCIA_set_point
        PUBLIC POTENCIA_timeOutCounter
        PUBLIC POTENCIA_timerTick
        PUBLIC T1CR0
        PUBLIC T1PR
        PUBLIC T2MR0
        PUBLIC T2PR
        PUBLIC T2TC
        PUBLIC _A_CLRPEND0
        PUBLIC _A_EXTINT
        PUBLIC _A_EXTMODE
        PUBLIC _A_EXTPOLAR
        PUBLIC _A_FIO1CLR
        PUBLIC _A_FIO1DIR
        PUBLIC _A_FIO1SET
        PUBLIC _A_FIO2CLR
        PUBLIC _A_FIO2DIR
        PUBLIC _A_FIO2SET
        PUBLIC _A_IP0
        PUBLIC _A_PCLKSEL1
        PUBLIC _A_PCONP
        PUBLIC _A_PINSEL3
        PUBLIC _A_PINSEL4
        PUBLIC _A_SETENA0
        PUBLIC _A_T1CCR
        PUBLIC _A_T1CTCR
        PUBLIC _A_T1IR
        PUBLIC _A_T1TCR
        PUBLIC _A_T2CTCR
        PUBLIC _A_T2EMR
        PUBLIC _A_T2IR
        PUBLIC _A_T2MCR
        PUBLIC _A_T2TCR
        PUBLIC _ZZ27POTENCIA_controleVelocidadeE16referencia_rampa
        PUBLIC _ZZ27POTENCIA_controleVelocidadeE6ciclos
        PUBLIC kd_const
        PUBLIC ki_const
        PUBLIC kp_const
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Potencia\Potencia.c
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
//   17 |       Arquivo            :  Potencia.c
//   18 |       Descrição          :  Biblioteca para o controle PID do 
//   19 |                             motor universal
//   20 | 
//   21 |       Autor              :  Marcos Aquino
//   22 |       Data criação       :  21/02/2017
//   23 |
//   24 |       Revisões           :  1.0.0.0
//   25 |
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
//   36 #include <nxp\iolpc1768.h>

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

        ASEGN `.noinit`:DATA:NOROOT,0400fc140H
        SECTION_GROUP _A_EXTINT
// __absolute union <unnamed> volatile _A_EXTINT
_A_EXTINT:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0400fc148H
        SECTION_GROUP _A_EXTMODE
// __absolute union <unnamed> volatile _A_EXTMODE
_A_EXTMODE:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0400fc14cH
        SECTION_GROUP _A_EXTPOLAR
// __absolute union <unnamed> volatile _A_EXTPOLAR
_A_EXTPOLAR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0400fc1acH
        SECTION_GROUP _A_PCLKSEL1
// __absolute union <unnamed> volatile _A_PCLKSEL1
_A_PCLKSEL1:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,0400fc0c4H
        SECTION_GROUP _A_PCONP
// __absolute union <unnamed> volatile _A_PCONP
_A_PCONP:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04002c00cH
        SECTION_GROUP _A_PINSEL3
// __absolute union <unnamed> volatile _A_PINSEL3
_A_PINSEL3:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04002c010H
        SECTION_GROUP _A_PINSEL4
// __absolute union <unnamed> volatile _A_PINSEL4
_A_PINSEL4:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c020H
        SECTION_GROUP _A_FIO1DIR
// __absolute union <unnamed> volatile _A_FIO1DIR
_A_FIO1DIR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c038H
        SECTION_GROUP _A_FIO1SET
// __absolute union <unnamed> volatile _A_FIO1SET
_A_FIO1SET:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c03cH
        SECTION_GROUP _A_FIO1CLR
// __absolute union <unnamed> volatile _A_FIO1CLR
_A_FIO1CLR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c040H
        SECTION_GROUP _A_FIO2DIR
// __absolute union <unnamed> volatile _A_FIO2DIR
_A_FIO2DIR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c058H
        SECTION_GROUP _A_FIO2SET
// __absolute union <unnamed> volatile _A_FIO2SET
_A_FIO2SET:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c05cH
        SECTION_GROUP _A_FIO2CLR
// __absolute union <unnamed> volatile _A_FIO2CLR
_A_FIO2CLR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040008000H
        SECTION_GROUP _A_T1IR
// __absolute union <unnamed> volatile _A_T1IR
_A_T1IR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040008004H
        SECTION_GROUP _A_T1TCR
// __absolute union <unnamed> volatile _A_T1TCR
_A_T1TCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04000800cH
        SECTION_GROUP T1PR
// __absolute unsigned long volatile T1PR
T1PR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040008028H
        SECTION_GROUP _A_T1CCR
// __absolute union <unnamed> volatile _A_T1CCR
_A_T1CCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04000802cH
        SECTION_GROUP T1CR0
// __absolute unsigned long const volatile T1CR0
T1CR0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040008070H
        SECTION_GROUP _A_T1CTCR
// __absolute union <unnamed> volatile _A_T1CTCR
_A_T1CTCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040090000H
        SECTION_GROUP _A_T2IR
// __absolute union <unnamed> volatile _A_T2IR
_A_T2IR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040090004H
        SECTION_GROUP _A_T2TCR
// __absolute union <unnamed> volatile _A_T2TCR
_A_T2TCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040090008H
        SECTION_GROUP T2TC
// __absolute unsigned long volatile T2TC
T2TC:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04009000cH
        SECTION_GROUP T2PR
// __absolute unsigned long volatile T2PR
T2PR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040090014H
        SECTION_GROUP _A_T2MCR
// __absolute union <unnamed> volatile _A_T2MCR
_A_T2MCR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040090018H
        SECTION_GROUP T2MR0
// __absolute unsigned long volatile T2MR0
T2MR0:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,04009003cH
        SECTION_GROUP _A_T2EMR
// __absolute union <unnamed> volatile _A_T2EMR
_A_T2EMR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040090070H
        SECTION_GROUP _A_T2CTCR
// __absolute union <unnamed> volatile _A_T2CTCR
_A_T2CTCR:
        DS8 4
//   37 #include "..\includes.h"
//   38 #include "Potencia.h"
//   39 
//   40 #define FQ_REDE_60_HZ
//   41 /***********************************************************************************
//   42 *       Definições locais
//   43 ***********************************************************************************/
//   44 #define LIGA_NEUTRO_PIN                 (0x01)<<19
//   45 #define INI_LIGA_NEUTRO_PIN()           FIO1DIR|=LIGA_NEUTRO_PIN
//   46 #define SET_LIGA_NEUTRO_PIN(X)          X?(FIO1SET|=LIGA_NEUTRO_PIN):(FIO1CLR|=LIGA_NEUTRO_PIN)
//   47 
//   48 #define RELOAD_TIMEOUT_RRPM             1000  
//   49 
//   50 #define CLK                             96000000
//   51 #define PR_TIMER                        300
//   52 
//   53 #define CONTROLE_RESISTENCIA            (0x01)<<2
//   54 #define SSR                             (0x01)<<3
//   55 
//   56 #define INI_PINS                        FIO2DIR |= SSR | CONTROLE_RESISTENCIA;
//   57 
//   58 #define SET_SSR(X)                      X?(FIO2SET|=SSR):(FIO2CLR|=SSR)
//   59 #define SET_RESISTENCIA(X)              X?(FIO2SET|=CONTROLE_RESISTENCIA):(FIO2CLR|=CONTROLE_RESISTENCIA)
//   60 
//   61 #define SET_ATRASO(X)                   {T2MR0 = T2TC+X; T2MCR_bit.MR0I = 1;}
//   62 #define SET_ATRASO_RES(X)               {T2MR1 = T2TC+X; T2MCR_bit.MR1I = 1;}
//   63 
//   64 #define TAM_BUF_VELOCIDADE              2//8//16
//   65 #define DIV_MEDIA_VEL                   1//4//4     
//   66 
//   67 /***********************************************************************************
//   68 *       Ganhos do PID
//   69 ***********************************************************************************/
//   70 #ifdef FQ_REDE_60_HZ
//   71   #define KP                                       2////4
//   72   #define KI                                       0.02
//   73   #define KD                                       0.5
//   74 #else
//   75   #define KP                                       4
//   76   #define KI                                       0.2
//   77   #define KD                                       0.1
//   78 #endif
//   79 
//   80 #ifdef FQ_REDE_60_HZ
//   81   #define ATRASO_MAXIMO                           2500
//   82   #define ATRASO_MINIMO                           150
//   83 #endif
//   84 
//   85 #ifdef FQ_REDE_50_HZ
//   86   #define ATRASO_MAXIMO                           3100
//   87   #define ATRASO_MINIMO                           300
//   88 #endif
//   89 
//   90 /***********************************************************************************
//   91 *       Constantes
//   92 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   93 const unsigned int kp_const = KP*256;
kp_const:
        DATA
        DC32 512

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   94 const unsigned int kd_const = KD*32768;
kd_const:
        DATA
        DC32 16384

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   95 const unsigned int ki_const = KI*32768;
ki_const:
        DATA
        DC32 655
//   96 
//   97 /***********************************************************************************
//   98 *       Variaveis locais
//   99 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  100 unsigned int POTENCIA_ciclos=0;
POTENCIA_ciclos:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  101 unsigned int POTENCIA_frequencia=0;
POTENCIA_frequencia:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  102 unsigned int POTENCIA_periodoCapturadoMotor;
POTENCIA_periodoCapturadoMotor:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  103 unsigned int POTENCIA_timeOutCounter;
POTENCIA_timeOutCounter:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  104 unsigned int POTENCIA_bufferRotacao[TAM_BUF_VELOCIDADE]={0};
POTENCIA_bufferRotacao:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  105 unsigned char POTENCIA_ligaMotor=0;
POTENCIA_ligaMotor:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  106 unsigned int POTENCIA_set_point=0;
POTENCIA_set_point:
        DS8 4
//  107 extern unsigned int BOARD_lock_timer;

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  108 unsigned char PORTENCIA_correcao_erro = 0;
PORTENCIA_correcao_erro:
        DS8 1
//  109 
//  110 /***********************************************************************************
//  111 *       Funções locais
//  112 ***********************************************************************************/
//  113 
//  114 /***********************************************************************************
//  115 *       Implementação das funções
//  116 ***********************************************************************************/
//  117 
//  118 /***********************************************************************************
//  119 *       Descrição       :       Inicialização do módulo
//  120 *       Parametros      :       nenhum
//  121 *       Retorno         :       nenhum
//  122 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function POTENCIA_ini
        THUMB
//  123 void POTENCIA_ini(void){
POTENCIA_ini:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  124   
//  125   INI_LIGA_NEUTRO_PIN();  
        LDR.W    R0,??DataTable10  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.W    R1,??DataTable10  ;; 0x2009c020
        STR      R0,[R1, #+0]
//  126   INI_PINS;
        LDR.W    R0,??DataTable10_1  ;; 0x2009c040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xC
        LDR.W    R1,??DataTable10_1  ;; 0x2009c040
        STR      R0,[R1, #+0]
//  127   SET_LIGA_NEUTRO_PIN(0);
        LDR.W    R0,??DataTable10_2  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.W    R1,??DataTable10_2  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  128   
//  129   // --------------------------
//  130   // Interrupção externa
//  131   // --------------------------
//  132   PINSEL4_bit.P2_11 = 1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable10_3  ;; 0x4002c010
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+22,#+2
        LDR.W    R0,??DataTable10_3  ;; 0x4002c010
        STR      R1,[R0, #+0]
//  133   EXTMODE_bit.EXTMODE1 = 1;
        LDR.W    R0,??DataTable10_4  ;; 0x400fc148
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_4  ;; 0x400fc148
        STR      R0,[R1, #+0]
//  134   EXTPOLAR_bit.EXTPOLAR1 = 1;    
        LDR.W    R0,??DataTable10_5  ;; 0x400fc14c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_5  ;; 0x400fc14c
        STR      R0,[R1, #+0]
//  135   SETENA0_bit.SETENA19 = 1;      
        LDR.W    R0,??DataTable10_6  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.W    R1,??DataTable10_6  ;; 0xe000e100
        STR      R0,[R1, #+0]
//  136   
//  137   //--------------------------------------------------------------------------//
//  138   //                        Habilita a interrupção                            //
//  139   //                        no NVIC                                           //
//  140   //--------------------------------------------------------------------------//  
//  141   PCONP_bit.PCTIM1 = 1;  
        LDR.W    R0,??DataTable10_7  ;; 0x400fc0c4
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable10_7  ;; 0x400fc0c4
        STR      R0,[R1, #+0]
//  142   IP0_bit.PRI_2 = 0;  
        LDR.W    R0,??DataTable10_8  ;; 0xe000e400
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0xFF0000
        LDR.W    R1,??DataTable10_8  ;; 0xe000e400
        STR      R0,[R1, #+0]
//  143   SETENA0_bit.SETENA2 = 1; // Habilitação da interrupção do timer 1
        LDR.W    R0,??DataTable10_6  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable10_6  ;; 0xe000e100
        STR      R0,[R1, #+0]
//  144   
//  145   T1TCR_bit.CE = 1;   // Contador Habilitado
        LDR.W    R0,??DataTable10_9  ;; 0x40008004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable10_9  ;; 0x40008004
        STR      R0,[R1, #+0]
//  146   T1TCR_bit.CR = 1;   // Realiza o reset
        LDR.W    R0,??DataTable10_9  ;; 0x40008004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_9  ;; 0x40008004
        STR      R0,[R1, #+0]
//  147   T1TCR_bit.CR = 0;   // do contador
        LDR.W    R0,??DataTable10_9  ;; 0x40008004
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_9  ;; 0x40008004
        STR      R0,[R1, #+0]
//  148   
//  149   T1CTCR_bit.CTM = 0x00;
        LDR.W    R0,??DataTable10_10  ;; 0x40008070
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+2
        LSLS     R0,R0,#+2
        LDR.W    R1,??DataTable10_10  ;; 0x40008070
        STR      R0,[R1, #+0]
//  150   T1PR = PR_TIMER;
        LDR.W    R0,??DataTable10_11  ;; 0x4000800c
        MOV      R1,#+300
        STR      R1,[R0, #+0]
//  151    
//  152   PINSEL3_bit.P1_18 = 3;
        LDR.W    R0,??DataTable10_12  ;; 0x4002c00c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x30
        LDR.W    R1,??DataTable10_12  ;; 0x4002c00c
        STR      R0,[R1, #+0]
//  153   
//  154   T1CCR_bit.CAP0RE = 1; // Borda de subida
        LDR.W    R0,??DataTable10_13  ;; 0x40008028
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable10_13  ;; 0x40008028
        STR      R0,[R1, #+0]
//  155   T1CCR_bit.CAP0FE = 0; // Borda de descida  
        LDR.W    R0,??DataTable10_13  ;; 0x40008028
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_13  ;; 0x40008028
        STR      R0,[R1, #+0]
//  156   T1CCR_bit.CAP0I = 1;  // Interrupção por evento no canal
        LDR.W    R0,??DataTable10_13  ;; 0x40008028
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable10_13  ;; 0x40008028
        STR      R0,[R1, #+0]
//  157   
//  158   //-------------------------------------------------------------------------//
//  159   //                    Inicialização do timer 2                             //
//  160   //-------------------------------------------------------------------------//
//  161   PCONP_bit.PCTIM2 = 1; // Energiza o periférico
        LDR.W    R0,??DataTable10_7  ;; 0x400fc0c4
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400000
        LDR.W    R1,??DataTable10_7  ;; 0x400fc0c4
        STR      R0,[R1, #+0]
//  162   PCLKSEL1_bit.PCLK_TIMER2 = 1; // Seleção do clock
        MOVS     R0,#+1
        LDR.W    R1,??DataTable10_14  ;; 0x400fc1ac
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+12,#+2
        LDR.W    R0,??DataTable10_14  ;; 0x400fc1ac
        STR      R1,[R0, #+0]
//  163   
//  164   IP0_bit.PRI_3 = 0;  
        LDR.W    R0,??DataTable10_8  ;; 0xe000e400
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+8        ;; ZeroExtS R0,R0,#+8,#+8
        LSRS     R0,R0,#+8
        LDR.W    R1,??DataTable10_8  ;; 0xe000e400
        STR      R0,[R1, #+0]
//  165   SETENA0_bit.SETENA3 = 1; // Habilitação da interrupção do timer 1
        LDR.W    R0,??DataTable10_6  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable10_6  ;; 0xe000e100
        STR      R0,[R1, #+0]
//  166   
//  167   T2TCR_bit.CE = 1;   // Contador Habilitado
        LDR.W    R0,??DataTable10_15  ;; 0x40090004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable10_15  ;; 0x40090004
        STR      R0,[R1, #+0]
//  168   T2TCR_bit.CR = 1;   // Realiza o reset
        LDR.W    R0,??DataTable10_15  ;; 0x40090004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_15  ;; 0x40090004
        STR      R0,[R1, #+0]
//  169   T2TCR_bit.CR = 0;   // do contador
        LDR.W    R0,??DataTable10_15  ;; 0x40090004
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_15  ;; 0x40090004
        STR      R0,[R1, #+0]
//  170   
//  171   T2CTCR_bit.CTM = 0x00;
        LDR.W    R0,??DataTable10_16  ;; 0x40090070
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+2
        LSLS     R0,R0,#+2
        LDR.W    R1,??DataTable10_16  ;; 0x40090070
        STR      R0,[R1, #+0]
//  172   T2PR = PR_TIMER;  
        LDR.W    R0,??DataTable10_17  ;; 0x4009000c
        MOV      R1,#+300
        STR      R1,[R0, #+0]
//  173   //-------------------------------------------------------------------------//
//  174   //                   Match 0 para o dimmer do motor                        //
//  175   //-------------------------------------------------------------------------// 
//  176   T2MCR_bit.MR0I = 0;
        LDR.W    R0,??DataTable10_18  ;; 0x40090014
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable10_18  ;; 0x40090014
        STR      R0,[R1, #+0]
//  177   T2MCR_bit.MR0R = 0;
        LDR.W    R0,??DataTable10_18  ;; 0x40090014
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_18  ;; 0x40090014
        STR      R0,[R1, #+0]
//  178   T2EMR_bit.EM0  = 0; // Não altera nenhum pino    
        LDR.W    R0,??DataTable10_19  ;; 0x4009003c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable10_19  ;; 0x4009003c
        STR      R0,[R1, #+0]
//  179   T2EMR_bit.EMC0 = 0;
        LDR.W    R0,??DataTable10_19  ;; 0x4009003c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x30
        LDR.W    R1,??DataTable10_19  ;; 0x4009003c
        STR      R0,[R1, #+0]
//  180   
//  181   T2MR0 = T2TC+1000;  
        LDR.W    R0,??DataTable10_20  ;; 0x40090008
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1000
        LDR.W    R1,??DataTable10_21  ;; 0x40090018
        STR      R0,[R1, #+0]
//  182   
//  183   PARAMETROS_le(ADR_COMPENSADOR_ERRO_ROTACAO,(void*)&PORTENCIA_correcao_erro);    
        LDR.W    R1,??DataTable10_22
        MOVS     R0,#+64
          CFI FunCall PARAMETROS_le
        BL       PARAMETROS_le
//  184 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_FIO1DIR
        REQUIRE _A_FIO2DIR
        REQUIRE _A_FIO1CLR
        REQUIRE _A_PINSEL4
        REQUIRE _A_EXTMODE
        REQUIRE _A_EXTPOLAR
        REQUIRE _A_SETENA0
        REQUIRE _A_PCONP
        REQUIRE _A_IP0
        REQUIRE _A_T1TCR
        REQUIRE _A_T1CTCR
        REQUIRE T1PR
        REQUIRE _A_PINSEL3
        REQUIRE _A_T1CCR
        REQUIRE _A_PCLKSEL1
        REQUIRE _A_T2TCR
        REQUIRE _A_T2CTCR
        REQUIRE T2PR
        REQUIRE _A_T2MCR
        REQUIRE _A_T2EMR
        REQUIRE T2MR0
        REQUIRE T2TC
//  185 /***********************************************************************************
//  186 *       Descrição       :       Inicializa o neutro de potência
//  187 *       Parametros      :       nenhum
//  188 *       Retorno         :       nenhum
//  189 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function POTENCIA_set_neutro
          CFI NoCalls
        THUMB
//  190 void POTENCIA_set_neutro(unsigned char flag){
//  191   
//  192   SET_LIGA_NEUTRO_PIN(flag);
POTENCIA_set_neutro:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??POTENCIA_set_neutro_0
        LDR.W    R0,??DataTable10_23  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.W    R1,??DataTable10_23  ;; 0x2009c038
        STR      R0,[R1, #+0]
        B.N      ??POTENCIA_set_neutro_1
??POTENCIA_set_neutro_0:
        LDR.N    R0,??DataTable10_2  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.N    R1,??DataTable10_2  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  193 }
??POTENCIA_set_neutro_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO1CLR
//  194 /***********************************************************************************
//  195 *       Descrição       :       Interrupção do EINT1
//  196 *       Parametros      :       nenhum
//  197 *       Retorno         :       nenhum
//  198 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function POTENCIA_eintInterrupt
        THUMB
//  199 void POTENCIA_eintInterrupt(void){  
POTENCIA_eintInterrupt:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  200   
//  201   // Evita dois disparos
//  202   // pelo glitch de subida
//  203   // do sinal de 60 Hz
//  204   if(!BOARD_lock_timer){
        LDR.N    R0,??DataTable10_24
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??POTENCIA_eintInterrupt_0
//  205     
//  206     SET_SSR(0);
        LDR.N    R0,??DataTable10_25  ;; 0x2009c05c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable10_25  ;; 0x2009c05c
        STR      R0,[R1, #+0]
//  207     BOARD_lock_timer = 6;
        LDR.N    R0,??DataTable10_24
        MOVS     R1,#+6
        STR      R1,[R0, #+0]
//  208     POTENCIA_controleVelocidade();
          CFI FunCall POTENCIA_controleVelocidade
        BL       POTENCIA_controleVelocidade
//  209   
//  210     POTENCIA_ciclos++;  
        LDR.N    R0,??DataTable10_26
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable10_26
        STR      R0,[R1, #+0]
        B.N      ??POTENCIA_eintInterrupt_1
//  211   }
//  212   else{
//  213     BOARD_lock_timer = BOARD_lock_timer;    
??POTENCIA_eintInterrupt_0:
        LDR.N    R0,??DataTable10_24
        LDR.N    R1,??DataTable10_24
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  214   }
//  215   EXTINT_bit.EINT1 = 1;
??POTENCIA_eintInterrupt_1:
        LDR.N    R0,??DataTable10_27  ;; 0x400fc140
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable10_27  ;; 0x400fc140
        STR      R0,[R1, #+0]
//  216   CLRPEND0_bit.CLRPEND19 = 1;
        LDR.N    R0,??DataTable10_28  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.N    R1,??DataTable10_28  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  217 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
        REQUIRE _A_FIO2CLR
        REQUIRE _A_EXTINT
        REQUIRE _A_CLRPEND0
//  218 /***********************************************************************************
//  219 *       Descrição       :       Tick de timer para a biblioteca de controle
//  220 *                               da velocidade do motor
//  221 *       Parametros      :       nenhum
//  222 *       Retorno         :       nenhum
//  223 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function POTENCIA_timerTick
          CFI NoCalls
        THUMB
//  224 void POTENCIA_timerTick(void){  
//  225   static unsigned short int contador=1;  
//  226   
//  227   if(!--contador){
POTENCIA_timerTick:
        LDR.N    R0,??DataTable10_29
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable10_29
        STRH     R0,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??POTENCIA_timerTick_0
//  228     POTENCIA_frequencia = POTENCIA_ciclos;
        LDR.N    R0,??DataTable10_30
        LDR.N    R1,??DataTable10_26
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  229     POTENCIA_ciclos = 0;
        LDR.N    R0,??DataTable10_26
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  230     contador = 500;
        LDR.N    R0,??DataTable10_29
        MOV      R1,#+500
        STRH     R1,[R0, #+0]
//  231   }    
//  232   
//  233   // Timeout na captura
//  234   // da rotação do motor  
//  235   if(POTENCIA_timeOutCounter){
??POTENCIA_timerTick_0:
        LDR.N    R0,??DataTable10_31
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??POTENCIA_timerTick_1
//  236     if(POTENCIA_timeOutCounter==1){
        LDR.N    R0,??DataTable10_31
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??POTENCIA_timerTick_2
//  237       for(unsigned char i=0;i<TAM_BUF_VELOCIDADE;i++)
        MOVS     R0,#+0
        B.N      ??POTENCIA_timerTick_3
//  238         POTENCIA_bufferRotacao[i] = 0;
??POTENCIA_timerTick_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable10_32
        MOVS     R2,#+0
        STR      R2,[R1, R0, LSL #+2]
        ADDS     R0,R0,#+1
??POTENCIA_timerTick_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BLT.N    ??POTENCIA_timerTick_4
//  239     }
//  240     POTENCIA_timeOutCounter--;
??POTENCIA_timerTick_2:
        LDR.N    R0,??DataTable10_31
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable10_31
        STR      R0,[R1, #+0]
//  241   }// Fim do contador para timeout no cálculo da rotação do motor
//  242 }
??POTENCIA_timerTick_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock3

        SECTION `.data`:DATA:REORDER:NOROOT(1)
??contador:
        DATA
        DC16 1
//  243 /***********************************************************************************
//  244 *       Descrição       :       Getter para a frequência da rede elétrica
//  245 *       Parametros      :       nenhum
//  246 *       Retorno         :       nenhum
//  247 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function POTENCIA_getFrequenciaRede
          CFI NoCalls
        THUMB
//  248 unsigned short int POTENCIA_getFrequenciaRede(void){
//  249   
//  250   return POTENCIA_frequencia;
POTENCIA_getFrequenciaRede:
        LDR.N    R0,??DataTable10_30
        LDR      R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  251 }
//  252 /***********************************************************************************
//  253 *       Descrição       :       Interrupção do capture
//  254 *       Parametros      :       nenhum
//  255 *       Retorno         :       nenhum
//  256 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function POTENCIA_captureInterrupt
          CFI NoCalls
        THUMB
//  257 void POTENCIA_captureInterrupt(void){
//  258   static unsigned int ultimaLeitura=0;
//  259   unsigned int larguraAtual;
//  260   unsigned int tmp;
//  261   static unsigned int ponteiroLeitura=0;
//  262   
//  263   larguraAtual = tmp = T1CR0;
POTENCIA_captureInterrupt:
        LDR.N    R0,??DataTable10_33  ;; 0x4000802c
        LDR      R0,[R0, #+0]
        MOVS     R1,R0
//  264   
//  265   if(larguraAtual>ultimaLeitura)         
        LDR.N    R2,??DataTable10_34
        LDR      R2,[R2, #+0]
        CMP      R2,R0
        BCS.N    ??POTENCIA_captureInterrupt_0
//  266     larguraAtual-=ultimaLeitura;    
        LDR.N    R2,??DataTable10_34
        LDR      R2,[R2, #+0]
        SUBS     R0,R0,R2
        B.N      ??POTENCIA_captureInterrupt_1
//  267   else
//  268     larguraAtual = (0xFFFFFFFF - ultimaLeitura) + larguraAtual;
??POTENCIA_captureInterrupt_0:
        MOVS     R2,#-1
        LDR.N    R3,??DataTable10_34
        LDR      R3,[R3, #+0]
        SUBS     R2,R2,R3
        ADDS     R0,R2,R0
//  269     
//  270   ultimaLeitura = tmp;
??POTENCIA_captureInterrupt_1:
        LDR.N    R2,??DataTable10_34
        STR      R1,[R2, #+0]
//  271   
//  272   T1IR_bit.CR0INT = 1;
        LDR.N    R1,??DataTable10_35  ;; 0x40008000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10
        LDR.N    R2,??DataTable10_35  ;; 0x40008000
        STR      R1,[R2, #+0]
//  273   CLRPEND0_bit.CLRPEND2 = 1;
        LDR.N    R1,??DataTable10_28  ;; 0xe000e280
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x4
        LDR.N    R2,??DataTable10_28  ;; 0xe000e280
        STR      R1,[R2, #+0]
//  274   
//  275   POTENCIA_periodoCapturadoMotor = larguraAtual;
        LDR.N    R1,??DataTable10_36
        STR      R0,[R1, #+0]
//  276   POTENCIA_timeOutCounter = RELOAD_TIMEOUT_RRPM;      
        LDR.N    R0,??DataTable10_31
        MOV      R1,#+1000
        STR      R1,[R0, #+0]
//  277   POTENCIA_bufferRotacao[ponteiroLeitura] = POTENCIA_periodoCapturadoMotor;
        LDR.N    R0,??DataTable10_37
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable10_32
        LDR.N    R2,??DataTable10_36
        LDR      R2,[R2, #+0]
        STR      R2,[R1, R0, LSL #+2]
//  278   ponteiroLeitura= (ponteiroLeitura+1) % TAM_BUF_VELOCIDADE;   
        LDR.N    R0,??DataTable10_37
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        ANDS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_37
        STR      R0,[R1, #+0]
//  279 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
        REQUIRE T1CR0
        REQUIRE _A_T1IR
        REQUIRE _A_CLRPEND0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??ultimaLeitura:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??ponteiroLeitura:
        DS8 4
//  280 /***********************************************************************************
//  281 *       Descrição       :       Interrupção do timer 2
//  282 *       Parametros      :       nenhum
//  283 *       Retorno         :       nenhum
//  284 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function POTENCIA_mathTimer2
          CFI NoCalls
        THUMB
//  285 void POTENCIA_mathTimer2(void){
//  286   
//  287   if(T2IR_bit.MR0INT){
POTENCIA_mathTimer2:
        LDR.N    R0,??DataTable10_38  ;; 0x40090000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??POTENCIA_mathTimer2_0
//  288     SET_SSR(1); // Liga o gate
        LDR.N    R0,??DataTable10_39  ;; 0x2009c058
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable10_39  ;; 0x2009c058
        STR      R0,[R1, #+0]
//  289     T2IR_bit.MR0INT = 1;
        LDR.N    R0,??DataTable10_38  ;; 0x40090000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_38  ;; 0x40090000
        STR      R0,[R1, #+0]
//  290     CLRPEND0_bit.CLRPEND3 = 1;
        LDR.N    R0,??DataTable10_28  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable10_28  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  291   }  
//  292 }
??POTENCIA_mathTimer2_0:
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
        REQUIRE _A_T2IR
        REQUIRE _A_FIO2SET
        REQUIRE _A_CLRPEND0
//  293 /***********************************************************************************
//  294 *       Descrição       :       Função que faz o controle da velocidade do 
//  295 *                               motor dentro do timer
//  296 *       Parametros      :       nenhum
//  297 *       Retorno         :       nenhum
//  298 ***********************************************************************************/
//  299 #pragma inline
//  300 void POTENCIA_controleVelocidade(void){
//  301   long long int erro;
//  302   long long int erro_i;
//  303   long long int erro_d;

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        SECTION_GROUP _ZZ27POTENCIA_controleVelocidadeE16referencia_rampa
//  304   static unsigned short int referencia_rampa=0;
_ZZ27POTENCIA_controleVelocidadeE16referencia_rampa:
        DS8 2

        SECTION `.data`:DATA:REORDER:NOROOT(1)
        SECTION_GROUP _ZZ27POTENCIA_controleVelocidadeE6ciclos
//  305   static unsigned short int ciclos=180;
_ZZ27POTENCIA_controleVelocidadeE6ciclos:
        DATA
        DC16 180
//  306   
//  307   if(POTENCIA_ligaMotor){
//  308       
//  309         //----------------------------------------
//  310         // Faz a referência crescer lentamente
//  311         //----------------------------------------
//  312         if(referencia_rampa!=POTENCIA_set_point){
//  313           if(referencia_rampa>POTENCIA_set_point)
//  314             referencia_rampa-=25;//50;
//  315           else
//  316             referencia_rampa+=25;//50;          
//  317         }      
//  318         
//  319         if(ciclos){
//  320           // Nos primeiros ciclos trabalha apenas com o erro
//  321           // proporcional
//  322           if(PORTENCIA_correcao_erro){
//  323             //Controla o motor com algortmo 
//  324             ciclos--;
//  325             erro = referencia_rampa - POTENCIA_getRPMmedido();
//  326             erro*= kp_const;
//  327             erro>>= 8;   
//  328             POTENCIA_calcula_derivada_erro(referencia_rampa);
//  329           
//  330             SET_ATRASO(POTENCIA_calculaAtrasoGate(erro));
//  331           }
//  332           else{
//  333             SET_ATRASO(POTENCIA_calculaAtrasoGate(referencia_rampa));            
//  334           }
//  335         }
//  336         else{
//  337           // Calcula o erro entre a referência e a rotação medida pelo sensor
//  338           if(PORTENCIA_correcao_erro){
//  339             // Controle o motor usando a correção
//  340             // de erro com PID
//  341             erro = referencia_rampa - POTENCIA_getRPMmedido();
//  342             // Calcula a integral do erro
//  343             erro_i = POTENCIA_calcula_integral_erro(erro,0);                     
//  344             erro_i *= ki_const;
//  345             erro_i >>= 15;
//  346           
//  347             erro_d = POTENCIA_calcula_derivada_erro(erro);
//  348             erro_d *= kd_const;
//  349             erro_d >>= 15;
//  350            
//  351             erro*= kp_const;
//  352             erro>>= 8;          
//  353             erro += erro_i;
//  354             erro += erro_d;
//  355                                  
//  356             SET_ATRASO(POTENCIA_calculaAtrasoGate(erro));          
//  357           }
//  358           else{
//  359             SET_ATRASO(POTENCIA_calculaAtrasoGate(referencia_rampa));            
//  360           }       
//  361         }
//  362   }
//  363   else{
//  364     POTENCIA_calcula_integral_erro(0,1);
//  365     referencia_rampa = ATRASO_MAXIMO;
//  366     ciclos = 128;
//  367   }  
//  368 }
//  369 /***********************************************************************************
//  370 *       Descrição       :       Calcula o erro integral 
//  371 *       Parametros      :       (int) erro atual
//  372 *       Retorno         :       (int) erro integral
//  373 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function POTENCIA_calcula_integral_erro
          CFI NoCalls
        THUMB
//  374 int POTENCIA_calcula_integral_erro(int erro,unsigned flush){
//  375   static long int y=0;
//  376   long int abs;    
//  377   
//  378   if(flush){    
POTENCIA_calcula_integral_erro:
        CMP      R1,#+0
        BEQ.N    ??POTENCIA_calcula_integral_erro_0
//  379     y = 0;
        LDR.N    R0,??DataTable10_40
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  380     return 0;
        MOVS     R0,#+0
        B.N      ??POTENCIA_calcula_integral_erro_1
//  381   }
//  382   
//  383   y+=erro;
??POTENCIA_calcula_integral_erro_0:
        LDR.N    R1,??DataTable10_40
        LDR      R1,[R1, #+0]
        ADDS     R1,R0,R1
        LDR.N    R2,??DataTable10_40
        STR      R1,[R2, #+0]
//  384   
//  385   abs = erro;
        MOVS     R1,R0
//  386   if(abs<0) abs*= -1;
        CMP      R1,#+0
        BPL.N    ??POTENCIA_calcula_integral_erro_2
        MOVS     R2,#-1
        MULS     R1,R2,R1
//  387   
//  388   if(abs<(0x7FFFFFFFF))
//  389     y+=erro;
??POTENCIA_calcula_integral_erro_2:
        LDR.N    R1,??DataTable10_40
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR.N    R1,??DataTable10_40
        STR      R0,[R1, #+0]
//  390   
//  391   return y;
        LDR.N    R0,??DataTable10_40
        LDR      R0,[R0, #+0]
??POTENCIA_calcula_integral_erro_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  392 }

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??y:
        DS8 4
//  393 /***********************************************************************************
//  394 *       Descrição       :       Calcula a derivada do erro
//  395 *       Parametros      :       (int) erro
//  396 *       Retorno         :       (int) derivada do erro
//  397 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function POTENCIA_calcula_derivada_erro
          CFI NoCalls
        THUMB
//  398 int POTENCIA_calcula_derivada_erro(int erro){
POTENCIA_calcula_derivada_erro:
        MOVS     R1,R0
//  399   static int buffer_z[4];
//  400   static unsigned short int indice=0;
//  401   int y=0;
        MOVS     R0,#+0
//  402   
//  403   buffer_z[indice] = erro;
        LDR.N    R2,??DataTable10_41
        LDRH     R2,[R2, #+0]
        LDR.N    R3,??DataTable10_42
        STR      R1,[R3, R2, LSL #+2]
//  404   
//  405   y+= 11*erro;
        MOVS     R2,#+11
        MLA      R0,R2,R1,R0
//  406   y-= 18*buffer_z[(indice+1)%4];
        LDR.N    R1,??DataTable10_41
        LDRH     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        MOVS     R2,#+4
        SDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        LDR.N    R1,??DataTable10_42
        LDR      R1,[R1, R3, LSL #+2]
        MOVS     R2,#+18
        MLS      R0,R2,R1,R0
//  407   y+=  9*buffer_z[(indice+2)%4];
        LDR.N    R1,??DataTable10_41
        LDRH     R1,[R1, #+0]
        ADDS     R1,R1,#+2
        MOVS     R2,#+4
        SDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        LDR.N    R1,??DataTable10_42
        LDR      R1,[R1, R3, LSL #+2]
        MOVS     R2,#+9
        MLA      R0,R2,R1,R0
//  408   y-=  2*buffer_z[(indice+3)%4];  
        LDR.N    R1,??DataTable10_41
        LDRH     R1,[R1, #+0]
        ADDS     R1,R1,#+3
        MOVS     R2,#+4
        SDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        LDR.N    R1,??DataTable10_42
        LDR      R1,[R1, R3, LSL #+2]
        SUBS     R0,R0,R1, LSL #+1
//  409   indice = (indice+1) % 4;  
        LDR.N    R1,??DataTable10_41
        LDRH     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        MOVS     R2,#+4
        SDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        LDR.N    R1,??DataTable10_41
        STRH     R3,[R1, #+0]
//  410   y/=6;
        MOVS     R1,#+6
        SDIV     R0,R0,R1
//  411   
//  412   if(y>12000)
        MOVW     R1,#+12001
        CMP      R0,R1
        BLT.N    ??POTENCIA_calcula_derivada_erro_0
//  413     y = 12000;
        MOVW     R0,#+12000
//  414   if(y<-12000)
??POTENCIA_calcula_derivada_erro_0:
        LDR.N    R1,??DataTable10_43  ;; 0xffffd120
        CMP      R0,R1
        BGE.N    ??POTENCIA_calcula_derivada_erro_1
//  415     y = -12000;
        LDR.N    R0,??DataTable10_43  ;; 0xffffd120
//  416   
//  417   return y;   
??POTENCIA_calcula_derivada_erro_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  418 }

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??buffer_z:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
??indice:
        DS8 2
//  419 /***********************************************************************************
//  420 *       Descrição       :       Setter para a rotação do motor
//  421 *       Parametros      :       (unsigned int) rpm do motor
//  422 *       Retorno         :       nenhum
//  423 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function POTENCIA_setRPM
        THUMB
//  424 void POTENCIA_setRPM(unsigned int rpm){
POTENCIA_setRPM:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  425   
//  426   if(!rpm){
        CMP      R4,#+0
        BNE.N    ??POTENCIA_setRPM_0
//  427     POTENCIA_ligaMotor = 0;
        LDR.N    R0,??DataTable10_44
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        B.N      ??POTENCIA_setRPM_1
//  428   }
//  429   else{
//  430     vTaskDelay(100);
??POTENCIA_setRPM_0:
        MOVS     R0,#+100
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  431     POTENCIA_set_point = rpm;
        LDR.N    R0,??DataTable10_45
        STR      R4,[R0, #+0]
//  432     vTaskDelay(2);          // Pra não subir antes de ligar o motor....
        MOVS     R0,#+2
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  433     POTENCIA_ligaMotor = 1;
        LDR.N    R0,??DataTable10_44
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  434   }
//  435 }
??POTENCIA_setRPM_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock9
//  436 /***********************************************************************************
//  437 *       Descrição       :       Calcula o atraso para o gate para uma determinada
//  438 *                               rotação
//  439 *       Parametros      :       (unsigned int) rotação alvo
//  440 *       Retorno         :       (unsigned int) atraso
//  441 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function POTENCIA_calculaAtrasoGate
          CFI NoCalls
        THUMB
//  442 unsigned int POTENCIA_calculaAtrasoGate(int rotacao_rpm){    
//  443   
//  444 #ifdef FQ_REDE_60_HZ  
//  445   long long int valor;
//  446   
//  447   valor = rotacao_rpm*2800;//4404;
POTENCIA_calculaAtrasoGate:
        MOV      R1,#+2800
        MULS     R0,R1,R0
        ASRS     R1,R0,#+31
//  448   valor>>= 15;
        LSRS     R0,R0,#+15
        ORR      R0,R0,R1, LSL #+17
        ASRS     R1,R1,#+15
//  449   valor = 2499 - valor; 
        MOVW     R2,#+2499
        MOVS     R3,#+0
        SUBS     R0,R2,R0
        SBCS     R1,R3,R1
//  450   
//  451   // trunca os limites
//  452   // do it que gera a interrução
//  453   // para controlar o gate
//  454   // esses valores foram levantado com o scope, então não
//  455   // mudar sem critérios(13/11/2016)
//  456   if(valor<ATRASO_MINIMO)
        CMP      R1,#+0
        BGT.N    ??POTENCIA_calculaAtrasoGate_0
        BLT.N    ??POTENCIA_calculaAtrasoGate_1
        CMP      R0,#+150
        BCS.N    ??POTENCIA_calculaAtrasoGate_0
//  457     valor = ATRASO_MINIMO;
??POTENCIA_calculaAtrasoGate_1:
        MOVS     R0,#+150
        MOVS     R1,#+0
//  458   if(valor>ATRASO_MAXIMO)
??POTENCIA_calculaAtrasoGate_0:
        MOVW     R2,#+2501
        MOVS     R3,#+0
        CMP      R1,R3
        BLT.N    ??POTENCIA_calculaAtrasoGate_2
        BGT.N    ??POTENCIA_calculaAtrasoGate_3
        CMP      R0,R2
        BCC.N    ??POTENCIA_calculaAtrasoGate_2
//  459     valor = ATRASO_MAXIMO;
??POTENCIA_calculaAtrasoGate_3:
        MOVW     R0,#+2500
        MOVS     R1,#+0
//  460   
//  461   return valor;
??POTENCIA_calculaAtrasoGate_2:
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  462 #endif
//  463   
//  464 #ifdef FQ_REDE_50_HZ
//  465   long long int valor;
//  466   
//  467   valor = rotacao_rpm * 5757;
//  468   valor>>= 15;
//  469   valor = ATRASO_MAXIMO - valor; 
//  470   
//  471   // trunca os limites
//  472   // do it que gera a interrução
//  473   // para controlar o gate
//  474   // esses valores foram levantado com o scope, então não
//  475   // mudar sem critérios(13/11/2016)
//  476   if(valor<ATRASO_MINIMO)
//  477     valor = ATRASO_MINIMO;
//  478   if(valor>ATRASO_MAXIMO)
//  479     valor = ATRASO_MAXIMO;
//  480   
//  481   return valor;
//  482 #endif  
//  483 }

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function POTENCIA_getRPMmedido
          CFI NoCalls
        THUMB
POTENCIA_getRPMmedido:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_36
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??POTENCIA_getRPMmedido_0
        MOVS     R0,#+0
        B.N      ??POTENCIA_getRPMmedido_1
??POTENCIA_getRPMmedido_0:
        MOVS     R1,#+0
        B.N      ??POTENCIA_getRPMmedido_2
??POTENCIA_getRPMmedido_3:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R2,??DataTable10_32
        LDR      R2,[R2, R1, LSL #+2]
        ADDS     R0,R2,R0
        ADDS     R1,R1,#+1
??POTENCIA_getRPMmedido_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+2
        BLT.N    ??POTENCIA_getRPMmedido_3
        LSRS     R0,R0,#+1
        LDR.N    R1,??DataTable10_46  ;; 0x13098d8
        UDIV     R0,R1,R0
??POTENCIA_getRPMmedido_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x2009c020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0x2009c040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0x2009c03c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     0x4002c010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     0x400fc148

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     0x400fc14c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     0x400fc0c4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_9:
        DC32     0x40008004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_10:
        DC32     0x40008070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_11:
        DC32     0x4000800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_12:
        DC32     0x4002c00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_13:
        DC32     0x40008028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_14:
        DC32     0x400fc1ac

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_15:
        DC32     0x40090004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_16:
        DC32     0x40090070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_17:
        DC32     0x4009000c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_18:
        DC32     0x40090014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_19:
        DC32     0x4009003c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_20:
        DC32     0x40090008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_21:
        DC32     0x40090018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_22:
        DC32     PORTENCIA_correcao_erro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_23:
        DC32     0x2009c038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_24:
        DC32     BOARD_lock_timer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_25:
        DC32     0x2009c05c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_26:
        DC32     POTENCIA_ciclos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_27:
        DC32     0x400fc140

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_28:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_29:
        DC32     ??contador

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_30:
        DC32     POTENCIA_frequencia

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_31:
        DC32     POTENCIA_timeOutCounter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_32:
        DC32     POTENCIA_bufferRotacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_33:
        DC32     0x4000802c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_34:
        DC32     ??ultimaLeitura

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_35:
        DC32     0x40008000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_36:
        DC32     POTENCIA_periodoCapturadoMotor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_37:
        DC32     ??ponteiroLeitura

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_38:
        DC32     0x40090000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_39:
        DC32     0x2009c058

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_40:
        DC32     ??y

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_41:
        DC32     ??indice

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_42:
        DC32     ??buffer_z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_43:
        DC32     0xffffd120

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_44:
        DC32     POTENCIA_ligaMotor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_45:
        DC32     POTENCIA_set_point

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_46:
        DC32     0x13098d8

        SECTION `.text`:CODE:REORDER:NOROOT(2)
        SECTION_GROUP POTENCIA_controleVelocidade
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function POTENCIA_controleVelocidade
        THUMB
POTENCIA_controleVelocidade:
        PUSH     {R3-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        LDR.N    R0,??POTENCIA_controleVelocidade_0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??POTENCIA_controleVelocidade_1
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x4
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x8
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ.N    ??POTENCIA_controleVelocidade_2
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x8
        LDR      R0,[R0, #+0]
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x4
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??POTENCIA_controleVelocidade_3
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+25
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x4
        STRH     R0,[R1, #+0]
        B.N      ??POTENCIA_controleVelocidade_2
??POTENCIA_controleVelocidade_3:
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+25
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x4
        STRH     R0,[R1, #+0]
??POTENCIA_controleVelocidade_2:
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0xC
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??POTENCIA_controleVelocidade_4
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??POTENCIA_controleVelocidade_5
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0xC
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0xC
        STRH     R0,[R1, #+0]
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x4
        LDRH     R4,[R0, #+0]
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        SUBS     R4,R4,R0
        MOVS     R5,#+0
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x14
        LDR      R2,[R0, #+0]
        MOVS     R3,#+0
        MOVS     R0,R4
        MOVS     R1,R5
        UMULL    R4,R5,R2,R0
        MLA      R5,R2,R1,R5
        MLA      R5,R3,R0,R5
        LSRS     R4,R4,#+8
        ORR      R4,R4,R5, LSL #+24
        ASRS     R5,R5,#+8
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x4
        LDRH     R0,[R0, #+0]
          CFI FunCall POTENCIA_calcula_derivada_erro
        BL       POTENCIA_calcula_derivada_erro
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x18  ;; 0x40090008
        LDR      R6,[R0, #+0]
        MOVS     R0,R4
          CFI FunCall POTENCIA_calculaAtrasoGate
        BL       POTENCIA_calculaAtrasoGate
        ADDS     R0,R0,R6
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x1C  ;; 0x40090018
        STR      R0,[R1, #+0]
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x20  ;; 0x40090014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x20  ;; 0x40090014
        STR      R0,[R1, #+0]
        B.N      ??POTENCIA_controleVelocidade_6
??POTENCIA_controleVelocidade_5:
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x18  ;; 0x40090008
        LDR      R4,[R0, #+0]
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x4
        LDRH     R0,[R0, #+0]
          CFI FunCall POTENCIA_calculaAtrasoGate
        BL       POTENCIA_calculaAtrasoGate
        ADDS     R0,R0,R4
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x1C  ;; 0x40090018
        STR      R0,[R1, #+0]
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x20  ;; 0x40090014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x20  ;; 0x40090014
        STR      R0,[R1, #+0]
        B.N      ??POTENCIA_controleVelocidade_6
??POTENCIA_controleVelocidade_4:
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??POTENCIA_controleVelocidade_7
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x4
        LDRH     R4,[R0, #+0]
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        SUBS     R4,R4,R0
        MOVS     R5,#+0
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall POTENCIA_calcula_integral_erro
        BL       POTENCIA_calcula_integral_erro
        MOVS     R6,R0
        ASRS     R7,R0,#+31
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x24
        LDR      R2,[R0, #+0]
        MOVS     R3,#+0
        MOVS     R0,R6
        MOVS     R1,R7
        UMULL    R6,R7,R2,R0
        MLA      R7,R2,R1,R7
        MLA      R7,R3,R0,R7
        LSRS     R6,R6,#+15
        ORR      R6,R6,R7, LSL #+17
        ASRS     R7,R7,#+15
        MOVS     R0,R4
          CFI FunCall POTENCIA_calcula_derivada_erro
        BL       POTENCIA_calcula_derivada_erro
        MOVS     R2,R0
        ASRS     R3,R0,#+31
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x28
        LDR      R8,[R0, #+0]
        MOVS     R9,#+0
        MOVS     R0,R2
        MOVS     R1,R3
        UMULL    R2,R3,R8,R0
        MLA      R3,R8,R1,R3
        MLA      R3,R9,R0,R3
        LSRS     R2,R2,#+15
        ORR      R2,R2,R3, LSL #+17
        ASRS     R3,R3,#+15
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x14
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        UMULL    R8,R9,R0,R4
        MLA      R9,R0,R5,R9
        MLA      R9,R1,R4,R9
        MOV      R4,R8
        MOV      R5,R9
        LSRS     R4,R4,#+8
        ORR      R4,R4,R5, LSL #+24
        ASRS     R5,R5,#+8
        ADDS     R4,R4,R6
        ADCS     R5,R5,R7
        ADDS     R4,R4,R2
        ADCS     R5,R5,R3
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x18  ;; 0x40090008
        LDR      R6,[R0, #+0]
        MOVS     R0,R4
          CFI FunCall POTENCIA_calculaAtrasoGate
        BL       POTENCIA_calculaAtrasoGate
        ADDS     R0,R0,R6
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x1C  ;; 0x40090018
        STR      R0,[R1, #+0]
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x20  ;; 0x40090014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x20  ;; 0x40090014
        STR      R0,[R1, #+0]
        B.N      ??POTENCIA_controleVelocidade_6
??POTENCIA_controleVelocidade_7:
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x18  ;; 0x40090008
        LDR      R4,[R0, #+0]
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x4
        LDRH     R0,[R0, #+0]
          CFI FunCall POTENCIA_calculaAtrasoGate
        BL       POTENCIA_calculaAtrasoGate
        ADDS     R0,R0,R4
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x1C  ;; 0x40090018
        STR      R0,[R1, #+0]
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x20  ;; 0x40090014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x20  ;; 0x40090014
        STR      R0,[R1, #+0]
        B.N      ??POTENCIA_controleVelocidade_6
??POTENCIA_controleVelocidade_1:
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall POTENCIA_calcula_integral_erro
        BL       POTENCIA_calcula_integral_erro
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x4
        MOVW     R1,#+2500
        STRH     R1,[R0, #+0]
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0xC
        MOVS     R1,#+128
        STRH     R1,[R0, #+0]
??POTENCIA_controleVelocidade_6:
        POP      {R0,R4-R9,PC}    ;; return
        Nop      
        DATA
??POTENCIA_controleVelocidade_0:
        DC32     POTENCIA_ligaMotor
        DC32     _ZZ27POTENCIA_controleVelocidadeE16referencia_rampa
        DC32     POTENCIA_set_point
        DC32     _ZZ27POTENCIA_controleVelocidadeE6ciclos
        DC32     PORTENCIA_correcao_erro
        DC32     kp_const
        DC32     0x40090008
        DC32     0x40090018
        DC32     0x40090014
        DC32     ki_const
        DC32     kd_const
          CFI EndBlock cfiBlock12
        REQUIRE T2MR0
        REQUIRE T2TC
        REQUIRE _A_T2MCR

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  484 /***********************************************************************************
//  485 *       Descrição       :       Lê os RPMs do motor
//  486 *       Parametros      :       nenhum
//  487 *       Retorno         :       (unsigned int) RPM atual do motor
//  488 ***********************************************************************************/
//  489 unsigned int POTENCIA_getRPMmedido(void){  
//  490   unsigned int media=0; 
//  491   
//  492   if(!POTENCIA_periodoCapturadoMotor)
//  493     return 0;
//  494 
//  495   for(unsigned char i=0;i<TAM_BUF_VELOCIDADE;i++)
//  496     media += POTENCIA_bufferRotacao[i];  
//  497   media>>=DIV_MEDIA_VEL;
//  498   
//  499   media = 19962072/media;
//  500    
//  501   return media;
//  502 }
//  503 /***********************************************************************************
//  504 *       Fim do arquivo
//  505 ***********************************************************************************/
// 
//    62 bytes in section .bss
//     4 bytes in section .data
//   120 bytes in section .noinit (abs)
//    12 bytes in section .rodata
// 1 914 bytes in section .text
// 
// 1 438 bytes of CODE  memory (+ 476 bytes shared)
//    12 bytes of CONST memory
//    62 bytes of DATA  memory (+ 124 bytes shared)
//
//Errors: none
//Warnings: 2
