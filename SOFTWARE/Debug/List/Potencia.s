///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     09/Sep/2017  15:56:22 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Potencia\Potencia /
//                    .c                                                      /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Potencia\Potencia /
//                    .c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List /
//                    \ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\ /
//                     -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Obj\    /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\Potenc /
//                    ia.s                                                    /
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
        EXTERN vTaskDelay

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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Potencia\Potencia.c
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
//   71   #define KP                                       4
//   72   #define KI                                       0.2
//   73   #define KD                                       0.2
//   74 #else
//   75   #define KP                                       4
//   76   #define KI                                       0.2
//   77   #define KD                                       0.2
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
        DC32 1024

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   94 const unsigned int kd_const = KD*32768;
kd_const:
        DATA
        DC32 6553

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   95 const unsigned int ki_const = KI*32768;
ki_const:
        DATA
        DC32 6553
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
//  108 
//  109 /***********************************************************************************
//  110 *       Funções locais
//  111 ***********************************************************************************/
//  112 
//  113 /***********************************************************************************
//  114 *       Implementação das funções
//  115 ***********************************************************************************/
//  116 
//  117 /***********************************************************************************
//  118 *       Descrição       :       Inicialização do módulo
//  119 *       Parametros      :       nenhum
//  120 *       Retorno         :       nenhum
//  121 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function POTENCIA_ini
          CFI NoCalls
        THUMB
//  122 void POTENCIA_ini(void){
//  123   
//  124   INI_LIGA_NEUTRO_PIN();  
POTENCIA_ini:
        LDR.W    R0,??DataTable10  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.W    R1,??DataTable10  ;; 0x2009c020
        STR      R0,[R1, #+0]
//  125   INI_PINS;
        LDR.W    R0,??DataTable10_1  ;; 0x2009c040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xC
        LDR.W    R1,??DataTable10_1  ;; 0x2009c040
        STR      R0,[R1, #+0]
//  126   SET_LIGA_NEUTRO_PIN(0);
        LDR.W    R0,??DataTable10_2  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.W    R1,??DataTable10_2  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  127   
//  128   // --------------------------
//  129   // Interrupção externa
//  130   // --------------------------
//  131   PINSEL4_bit.P2_11 = 1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable10_3  ;; 0x4002c010
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+22,#+2
        LDR.W    R0,??DataTable10_3  ;; 0x4002c010
        STR      R1,[R0, #+0]
//  132   EXTMODE_bit.EXTMODE1 = 1;
        LDR.W    R0,??DataTable10_4  ;; 0x400fc148
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_4  ;; 0x400fc148
        STR      R0,[R1, #+0]
//  133   EXTPOLAR_bit.EXTPOLAR1 = 1;    
        LDR.W    R0,??DataTable10_5  ;; 0x400fc14c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_5  ;; 0x400fc14c
        STR      R0,[R1, #+0]
//  134   SETENA0_bit.SETENA19 = 1;      
        LDR.W    R0,??DataTable10_6  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.W    R1,??DataTable10_6  ;; 0xe000e100
        STR      R0,[R1, #+0]
//  135   
//  136   //--------------------------------------------------------------------------//
//  137   //                        Habilita a interrupção                            //
//  138   //                        no NVIC                                           //
//  139   //--------------------------------------------------------------------------//  
//  140   PCONP_bit.PCTIM1 = 1;  
        LDR.W    R0,??DataTable10_7  ;; 0x400fc0c4
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable10_7  ;; 0x400fc0c4
        STR      R0,[R1, #+0]
//  141   IP0_bit.PRI_2 = 0;  
        LDR.W    R0,??DataTable10_8  ;; 0xe000e400
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0xFF0000
        LDR.W    R1,??DataTable10_8  ;; 0xe000e400
        STR      R0,[R1, #+0]
//  142   SETENA0_bit.SETENA2 = 1; // Habilitação da interrupção do timer 1
        LDR.W    R0,??DataTable10_6  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable10_6  ;; 0xe000e100
        STR      R0,[R1, #+0]
//  143   
//  144   T1TCR_bit.CE = 1;   // Contador Habilitado
        LDR.W    R0,??DataTable10_9  ;; 0x40008004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable10_9  ;; 0x40008004
        STR      R0,[R1, #+0]
//  145   T1TCR_bit.CR = 1;   // Realiza o reset
        LDR.W    R0,??DataTable10_9  ;; 0x40008004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_9  ;; 0x40008004
        STR      R0,[R1, #+0]
//  146   T1TCR_bit.CR = 0;   // do contador
        LDR.W    R0,??DataTable10_9  ;; 0x40008004
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_9  ;; 0x40008004
        STR      R0,[R1, #+0]
//  147   
//  148   T1CTCR_bit.CTM = 0x00;
        LDR.W    R0,??DataTable10_10  ;; 0x40008070
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+2
        LSLS     R0,R0,#+2
        LDR.W    R1,??DataTable10_10  ;; 0x40008070
        STR      R0,[R1, #+0]
//  149   T1PR = PR_TIMER;
        LDR.W    R0,??DataTable10_11  ;; 0x4000800c
        MOV      R1,#+300
        STR      R1,[R0, #+0]
//  150    
//  151   PINSEL3_bit.P1_18 = 3;
        LDR.W    R0,??DataTable10_12  ;; 0x4002c00c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x30
        LDR.W    R1,??DataTable10_12  ;; 0x4002c00c
        STR      R0,[R1, #+0]
//  152   
//  153   T1CCR_bit.CAP0RE = 1; // Borda de subida
        LDR.W    R0,??DataTable10_13  ;; 0x40008028
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable10_13  ;; 0x40008028
        STR      R0,[R1, #+0]
//  154   T1CCR_bit.CAP0FE = 0; // Borda de descida  
        LDR.W    R0,??DataTable10_13  ;; 0x40008028
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_13  ;; 0x40008028
        STR      R0,[R1, #+0]
//  155   T1CCR_bit.CAP0I = 1;  // Interrupção por evento no canal
        LDR.W    R0,??DataTable10_13  ;; 0x40008028
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable10_13  ;; 0x40008028
        STR      R0,[R1, #+0]
//  156   
//  157   //-------------------------------------------------------------------------//
//  158   //                    Inicialização do timer 2                             //
//  159   //-------------------------------------------------------------------------//
//  160   PCONP_bit.PCTIM2 = 1; // Energiza o periférico
        LDR.W    R0,??DataTable10_7  ;; 0x400fc0c4
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400000
        LDR.W    R1,??DataTable10_7  ;; 0x400fc0c4
        STR      R0,[R1, #+0]
//  161   PCLKSEL1_bit.PCLK_TIMER2 = 1; // Seleção do clock
        MOVS     R0,#+1
        LDR.W    R1,??DataTable10_14  ;; 0x400fc1ac
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+12,#+2
        LDR.W    R0,??DataTable10_14  ;; 0x400fc1ac
        STR      R1,[R0, #+0]
//  162   
//  163   IP0_bit.PRI_3 = 0;  
        LDR.W    R0,??DataTable10_8  ;; 0xe000e400
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+8        ;; ZeroExtS R0,R0,#+8,#+8
        LSRS     R0,R0,#+8
        LDR.W    R1,??DataTable10_8  ;; 0xe000e400
        STR      R0,[R1, #+0]
//  164   SETENA0_bit.SETENA3 = 1; // Habilitação da interrupção do timer 1
        LDR.W    R0,??DataTable10_6  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable10_6  ;; 0xe000e100
        STR      R0,[R1, #+0]
//  165   
//  166   T2TCR_bit.CE = 1;   // Contador Habilitado
        LDR.W    R0,??DataTable10_15  ;; 0x40090004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable10_15  ;; 0x40090004
        STR      R0,[R1, #+0]
//  167   T2TCR_bit.CR = 1;   // Realiza o reset
        LDR.W    R0,??DataTable10_15  ;; 0x40090004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_15  ;; 0x40090004
        STR      R0,[R1, #+0]
//  168   T2TCR_bit.CR = 0;   // do contador
        LDR.W    R0,??DataTable10_15  ;; 0x40090004
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.W    R1,??DataTable10_15  ;; 0x40090004
        STR      R0,[R1, #+0]
//  169   
//  170   T2CTCR_bit.CTM = 0x00;
        LDR.W    R0,??DataTable10_16  ;; 0x40090070
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+2
        LSLS     R0,R0,#+2
        LDR.N    R1,??DataTable10_16  ;; 0x40090070
        STR      R0,[R1, #+0]
//  171   T2PR = PR_TIMER;  
        LDR.N    R0,??DataTable10_17  ;; 0x4009000c
        MOV      R1,#+300
        STR      R1,[R0, #+0]
//  172   //-------------------------------------------------------------------------//
//  173   //                   Match 0 para o dimmer do motor                        //
//  174   //-------------------------------------------------------------------------// 
//  175   T2MCR_bit.MR0I = 0;
        LDR.N    R0,??DataTable10_18  ;; 0x40090014
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable10_18  ;; 0x40090014
        STR      R0,[R1, #+0]
//  176   T2MCR_bit.MR0R = 0;
        LDR.N    R0,??DataTable10_18  ;; 0x40090014
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.N    R1,??DataTable10_18  ;; 0x40090014
        STR      R0,[R1, #+0]
//  177   T2EMR_bit.EM0  = 0; // Não altera nenhum pino    
        LDR.N    R0,??DataTable10_19  ;; 0x4009003c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable10_19  ;; 0x4009003c
        STR      R0,[R1, #+0]
//  178   T2EMR_bit.EMC0 = 0;
        LDR.N    R0,??DataTable10_19  ;; 0x4009003c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x30
        LDR.N    R1,??DataTable10_19  ;; 0x4009003c
        STR      R0,[R1, #+0]
//  179   
//  180   T2MR0 = T2TC+1000;  
        LDR.N    R0,??DataTable10_20  ;; 0x40090008
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1000
        LDR.N    R1,??DataTable10_21  ;; 0x40090018
        STR      R0,[R1, #+0]
//  181 }
        BX       LR               ;; return
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
//  182 /***********************************************************************************
//  183 *       Descrição       :       Inicializa o neutro de potência
//  184 *       Parametros      :       nenhum
//  185 *       Retorno         :       nenhum
//  186 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function POTENCIA_set_neutro
          CFI NoCalls
        THUMB
//  187 void POTENCIA_set_neutro(unsigned char flag){
//  188   
//  189   SET_LIGA_NEUTRO_PIN(flag);
POTENCIA_set_neutro:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??POTENCIA_set_neutro_0
        LDR.N    R1,??DataTable10_22  ;; 0x2009c038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x80000
        LDR.N    R2,??DataTable10_22  ;; 0x2009c038
        STR      R1,[R2, #+0]
        B.N      ??POTENCIA_set_neutro_1
??POTENCIA_set_neutro_0:
        LDR.N    R1,??DataTable10_2  ;; 0x2009c03c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x80000
        LDR.N    R2,??DataTable10_2  ;; 0x2009c03c
        STR      R1,[R2, #+0]
//  190 }
??POTENCIA_set_neutro_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO1CLR
//  191 /***********************************************************************************
//  192 *       Descrição       :       Interrupção do EINT1
//  193 *       Parametros      :       nenhum
//  194 *       Retorno         :       nenhum
//  195 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function POTENCIA_eintInterrupt
        THUMB
//  196 void POTENCIA_eintInterrupt(void){  
POTENCIA_eintInterrupt:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  197   
//  198   // Evita dois disparos
//  199   // pelo glitch de subida
//  200   // do sinal de 60 Hz
//  201   if(!BOARD_lock_timer){
        LDR.N    R0,??DataTable10_23
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??POTENCIA_eintInterrupt_0
//  202     
//  203     SET_SSR(0);
        LDR.N    R0,??DataTable10_24  ;; 0x2009c05c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable10_24  ;; 0x2009c05c
        STR      R0,[R1, #+0]
//  204     BOARD_lock_timer = 6;
        LDR.N    R0,??DataTable10_23
        MOVS     R1,#+6
        STR      R1,[R0, #+0]
//  205     POTENCIA_controleVelocidade();
          CFI FunCall POTENCIA_controleVelocidade
        BL       POTENCIA_controleVelocidade
//  206   
//  207     POTENCIA_ciclos++;  
        LDR.N    R0,??DataTable10_25
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable10_25
        STR      R0,[R1, #+0]
        B.N      ??POTENCIA_eintInterrupt_1
//  208   }
//  209   else{
//  210     BOARD_lock_timer = BOARD_lock_timer;    
??POTENCIA_eintInterrupt_0:
        LDR.N    R0,??DataTable10_23
        LDR.N    R1,??DataTable10_23
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  211   }
//  212   EXTINT_bit.EINT1 = 1;
??POTENCIA_eintInterrupt_1:
        LDR.N    R0,??DataTable10_26  ;; 0x400fc140
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable10_26  ;; 0x400fc140
        STR      R0,[R1, #+0]
//  213   CLRPEND0_bit.CLRPEND19 = 1;
        LDR.N    R0,??DataTable10_27  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.N    R1,??DataTable10_27  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  214 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
        REQUIRE _A_FIO2CLR
        REQUIRE _A_EXTINT
        REQUIRE _A_CLRPEND0
//  215 /***********************************************************************************
//  216 *       Descrição       :       Tick de timer para a biblioteca de controle
//  217 *                               da velocidade do motor
//  218 *       Parametros      :       nenhum
//  219 *       Retorno         :       nenhum
//  220 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function POTENCIA_timerTick
          CFI NoCalls
        THUMB
//  221 void POTENCIA_timerTick(void){  
//  222   static unsigned short int contador=1;  
//  223   
//  224   if(!--contador){
POTENCIA_timerTick:
        LDR.N    R0,??DataTable10_28
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable10_28
        STRH     R0,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??POTENCIA_timerTick_0
//  225     POTENCIA_frequencia = POTENCIA_ciclos;
        LDR.N    R0,??DataTable10_29
        LDR.N    R1,??DataTable10_25
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  226     POTENCIA_ciclos = 0;
        LDR.N    R0,??DataTable10_25
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  227     contador = 500;
        LDR.N    R0,??DataTable10_28
        MOV      R1,#+500
        STRH     R1,[R0, #+0]
//  228   }    
//  229   
//  230   // Timeout na captura
//  231   // da rotação do motor  
//  232   if(POTENCIA_timeOutCounter){
??POTENCIA_timerTick_0:
        LDR.N    R0,??DataTable10_30
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??POTENCIA_timerTick_1
//  233     if(POTENCIA_timeOutCounter==1){
        LDR.N    R0,??DataTable10_30
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??POTENCIA_timerTick_2
//  234       for(unsigned char i=0;i<TAM_BUF_VELOCIDADE;i++)
        MOVS     R0,#+0
??POTENCIA_timerTick_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BGE.N    ??POTENCIA_timerTick_2
//  235         POTENCIA_bufferRotacao[i] = 0;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable10_31
        MOVS     R2,#+0
        STR      R2,[R1, R0, LSL #+2]
        ADDS     R0,R0,#+1
        B.N      ??POTENCIA_timerTick_3
//  236     }
//  237     POTENCIA_timeOutCounter--;
??POTENCIA_timerTick_2:
        LDR.N    R0,??DataTable10_30
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable10_30
        STR      R0,[R1, #+0]
//  238   }// Fim do contador para timeout no cálculo da rotação do motor
//  239 }
??POTENCIA_timerTick_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock3

        SECTION `.data`:DATA:REORDER:NOROOT(1)
??contador:
        DATA
        DC16 1
//  240 /***********************************************************************************
//  241 *       Descrição       :       Getter para a frequência da rede elétrica
//  242 *       Parametros      :       nenhum
//  243 *       Retorno         :       nenhum
//  244 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function POTENCIA_getFrequenciaRede
          CFI NoCalls
        THUMB
//  245 unsigned short int POTENCIA_getFrequenciaRede(void){
//  246   
//  247   return POTENCIA_frequencia;
POTENCIA_getFrequenciaRede:
        LDR.N    R0,??DataTable10_29
        LDR      R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  248 }
//  249 /***********************************************************************************
//  250 *       Descrição       :       Interrupção do capture
//  251 *       Parametros      :       nenhum
//  252 *       Retorno         :       nenhum
//  253 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function POTENCIA_captureInterrupt
          CFI NoCalls
        THUMB
//  254 void POTENCIA_captureInterrupt(void){
POTENCIA_captureInterrupt:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  255   static unsigned int ultimaLeitura=0;
//  256   unsigned int larguraAtual;
//  257   unsigned int tmp;
//  258   static unsigned int ponteiroLeitura=0;
//  259   
//  260   larguraAtual = tmp = T1CR0;
        LDR.N    R2,??DataTable10_32  ;; 0x4000802c
        LDR      R2,[R2, #+0]
        MOVS     R0,R2
        MOVS     R1,R2
//  261   
//  262   if(larguraAtual>ultimaLeitura)         
        LDR.N    R2,??DataTable10_33
        LDR      R2,[R2, #+0]
        CMP      R2,R1
        BCS.N    ??POTENCIA_captureInterrupt_0
//  263     larguraAtual-=ultimaLeitura;    
        LDR.N    R2,??DataTable10_33
        LDR      R2,[R2, #+0]
        SUBS     R1,R1,R2
        B.N      ??POTENCIA_captureInterrupt_1
//  264   else
//  265     larguraAtual = (0xFFFFFFFF - ultimaLeitura) + larguraAtual;
??POTENCIA_captureInterrupt_0:
        MOVS     R2,#-1
        LDR.N    R3,??DataTable10_33
        LDR      R3,[R3, #+0]
        SUBS     R2,R2,R3
        ADDS     R1,R2,R1
//  266     
//  267   ultimaLeitura = tmp;
??POTENCIA_captureInterrupt_1:
        LDR.N    R2,??DataTable10_33
        STR      R0,[R2, #+0]
//  268   
//  269   T1IR_bit.CR0INT = 1;
        LDR.N    R2,??DataTable10_34  ;; 0x40008000
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x10
        LDR.N    R3,??DataTable10_34  ;; 0x40008000
        STR      R2,[R3, #+0]
//  270   CLRPEND0_bit.CLRPEND2 = 1;
        LDR.N    R2,??DataTable10_27  ;; 0xe000e280
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x4
        LDR.N    R3,??DataTable10_27  ;; 0xe000e280
        STR      R2,[R3, #+0]
//  271   
//  272   POTENCIA_periodoCapturadoMotor = larguraAtual;
        LDR.N    R2,??DataTable10_35
        STR      R1,[R2, #+0]
//  273   POTENCIA_timeOutCounter = RELOAD_TIMEOUT_RRPM;      
        LDR.N    R2,??DataTable10_30
        MOV      R3,#+1000
        STR      R3,[R2, #+0]
//  274   POTENCIA_bufferRotacao[ponteiroLeitura] = POTENCIA_periodoCapturadoMotor;
        LDR.N    R2,??DataTable10_36
        LDR      R2,[R2, #+0]
        LDR.N    R3,??DataTable10_31
        LDR.N    R4,??DataTable10_35
        LDR      R4,[R4, #+0]
        STR      R4,[R3, R2, LSL #+2]
//  275   ponteiroLeitura= (ponteiroLeitura+1) % TAM_BUF_VELOCIDADE;   
        LDR.N    R2,??DataTable10_36
        LDR      R2,[R2, #+0]
        ADDS     R2,R2,#+1
        ANDS     R2,R2,#0x1
        LDR.N    R3,??DataTable10_36
        STR      R2,[R3, #+0]
//  276 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
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
//  277 /***********************************************************************************
//  278 *       Descrição       :       Interrupção do timer 2
//  279 *       Parametros      :       nenhum
//  280 *       Retorno         :       nenhum
//  281 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function POTENCIA_mathTimer2
          CFI NoCalls
        THUMB
//  282 void POTENCIA_mathTimer2(void){
//  283   
//  284   if(T2IR_bit.MR0INT){
POTENCIA_mathTimer2:
        LDR.N    R0,??DataTable10_37  ;; 0x40090000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??POTENCIA_mathTimer2_0
//  285     SET_SSR(1); // Liga o gate
        LDR.N    R0,??DataTable10_38  ;; 0x2009c058
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable10_38  ;; 0x2009c058
        STR      R0,[R1, #+0]
//  286     T2IR_bit.MR0INT = 1;
        LDR.N    R0,??DataTable10_37  ;; 0x40090000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_37  ;; 0x40090000
        STR      R0,[R1, #+0]
//  287     CLRPEND0_bit.CLRPEND3 = 1;
        LDR.N    R0,??DataTable10_27  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable10_27  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  288   }  
//  289 }
??POTENCIA_mathTimer2_0:
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
        REQUIRE _A_T2IR
        REQUIRE _A_FIO2SET
        REQUIRE _A_CLRPEND0
//  290 /***********************************************************************************
//  291 *       Descrição       :       Função que faz o controle da velocidade do 
//  292 *                               motor dentro do timer
//  293 *       Parametros      :       nenhum
//  294 *       Retorno         :       nenhum
//  295 ***********************************************************************************/
//  296 #pragma inline
//  297 void POTENCIA_controleVelocidade(void){
//  298   long long int erro;
//  299   long long int erro_i;
//  300   long long int erro_d;

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        SECTION_GROUP _ZZ27POTENCIA_controleVelocidadeE16referencia_rampa
//  301   static unsigned short int referencia_rampa=0;
_ZZ27POTENCIA_controleVelocidadeE16referencia_rampa:
        DS8 2

        SECTION `.data`:DATA:REORDER:NOROOT(1)
        SECTION_GROUP _ZZ27POTENCIA_controleVelocidadeE6ciclos
//  302   static unsigned short int ciclos=180;
_ZZ27POTENCIA_controleVelocidadeE6ciclos:
        DATA
        DC16 180
//  303   
//  304   if(POTENCIA_ligaMotor){
//  305       
//  306         //----------------------------------------
//  307         // Faz a referência crescer lentamente
//  308         //----------------------------------------
//  309         if(referencia_rampa!=POTENCIA_set_point){
//  310           if(referencia_rampa>POTENCIA_set_point)
//  311             referencia_rampa-=25;//50;
//  312           else
//  313             referencia_rampa+=25;//50;
//  314         }      
//  315         
//  316         if(ciclos){
//  317           // Nos primeiros ciclos trabalha apenas com o erro
//  318           // proporcional
//  319           ciclos--;
//  320           erro = referencia_rampa - POTENCIA_getRPMmedido();
//  321           erro*= kp_const;
//  322           erro>>= 8;   
//  323           POTENCIA_calcula_derivada_erro(referencia_rampa);
//  324           
//  325           SET_ATRASO(POTENCIA_calculaAtrasoGate(erro));
//  326         }
//  327         else{
//  328           // Calcula o erro entre a referência e a rotação medida pelo sensor
//  329           erro = referencia_rampa - POTENCIA_getRPMmedido();
//  330           // Calcula a integral do erro
//  331           erro_i = POTENCIA_calcula_integral_erro(erro,0);                     
//  332           erro_i *= ki_const;
//  333           erro_i >>= 15;
//  334           
//  335           erro_d = POTENCIA_calcula_derivada_erro(erro);
//  336           erro_d *= kd_const;
//  337           erro_d >>= 15;
//  338           
//  339           erro*= kp_const;
//  340           erro>>= 8;          
//  341           erro += erro_i;
//  342           erro += erro_d;
//  343                                  
//  344           SET_ATRASO(POTENCIA_calculaAtrasoGate(erro));          
//  345         }
//  346   }
//  347   else{
//  348     POTENCIA_calcula_integral_erro(0,1);
//  349     referencia_rampa = ATRASO_MAXIMO;
//  350     ciclos = 128;
//  351   }  
//  352 }
//  353 /***********************************************************************************
//  354 *       Descrição       :       Calcula o erro integral 
//  355 *       Parametros      :       (int) erro atual
//  356 *       Retorno         :       (int) erro integral
//  357 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function POTENCIA_calcula_integral_erro
          CFI NoCalls
        THUMB
//  358 int POTENCIA_calcula_integral_erro(int erro,unsigned flush){
POTENCIA_calcula_integral_erro:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R2,R0
//  359   static long int y=0;
//  360   long int abs;    
//  361   
//  362   if(flush){    
        CMP      R1,#+0
        BEQ.N    ??POTENCIA_calcula_integral_erro_0
//  363     y = 0;
        LDR.N    R0,??DataTable10_39
        MOVS     R4,#+0
        STR      R4,[R0, #+0]
//  364     return 0;
        MOVS     R0,#+0
        B.N      ??POTENCIA_calcula_integral_erro_1
//  365   }
//  366   
//  367   y+=erro;
??POTENCIA_calcula_integral_erro_0:
        LDR.N    R0,??DataTable10_39
        LDR      R0,[R0, #+0]
        ADDS     R0,R2,R0
        LDR.N    R4,??DataTable10_39
        STR      R0,[R4, #+0]
//  368   
//  369   abs = erro;
        MOVS     R3,R2
//  370   if(abs<0) abs*= -1;
        CMP      R3,#+0
        BPL.N    ??POTENCIA_calcula_integral_erro_2
        MOVS     R0,#-1
        MULS     R3,R0,R3
//  371   
//  372   if(abs<100000){
??POTENCIA_calcula_integral_erro_2:
        LDR.N    R0,??DataTable10_40  ;; 0x186a0
        CMP      R3,R0
        BGE.N    ??POTENCIA_calcula_integral_erro_3
//  373     y+=erro;
        LDR.N    R0,??DataTable10_39
        LDR      R0,[R0, #+0]
        ADDS     R0,R2,R0
        LDR.N    R4,??DataTable10_39
        STR      R0,[R4, #+0]
        B.N      ??POTENCIA_calcula_integral_erro_4
//  374   }
//  375   else{
//  376     y = 0;
??POTENCIA_calcula_integral_erro_3:
        LDR.N    R0,??DataTable10_39
        MOVS     R4,#+0
        STR      R4,[R0, #+0]
//  377   }
//  378 
//  379   return y;
??POTENCIA_calcula_integral_erro_4:
        LDR.N    R0,??DataTable10_39
        LDR      R0,[R0, #+0]
??POTENCIA_calcula_integral_erro_1:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  380 }

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??y:
        DS8 4
//  381 /***********************************************************************************
//  382 *       Descrição       :       Calcula a derivada do erro
//  383 *       Parametros      :       (int) erro
//  384 *       Retorno         :       (int) derivada do erro
//  385 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function POTENCIA_calcula_derivada_erro
          CFI NoCalls
        THUMB
//  386 int POTENCIA_calcula_derivada_erro(int erro){
//  387   static int ultimo_erro = 0;
//  388   
//  389   erro = erro - ultimo_erro;     
POTENCIA_calcula_derivada_erro:
        LDR.N    R1,??DataTable10_41
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
//  390   ultimo_erro = erro;  
        LDR.N    R1,??DataTable10_41
        STR      R0,[R1, #+0]
//  391   
//  392   //Trunca os limites  
//  393   return erro;
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  394 }

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??ultimo_erro:
        DS8 4
//  395 /***********************************************************************************
//  396 *       Descrição       :       Setter para a rotação do motor
//  397 *       Parametros      :       (unsigned int) rpm do motor
//  398 *       Retorno         :       nenhum
//  399 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function POTENCIA_setRPM
        THUMB
//  400 void POTENCIA_setRPM(unsigned int rpm){
POTENCIA_setRPM:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  401   
//  402   if(!rpm){
        CMP      R4,#+0
        BNE.N    ??POTENCIA_setRPM_0
//  403     POTENCIA_ligaMotor = 0;
        LDR.N    R0,??DataTable10_42
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        B.N      ??POTENCIA_setRPM_1
//  404   }
//  405   else{
//  406     vTaskDelay(100);
??POTENCIA_setRPM_0:
        MOVS     R0,#+100
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  407     POTENCIA_set_point = rpm;
        LDR.N    R0,??DataTable10_43
        STR      R4,[R0, #+0]
//  408     vTaskDelay(2);          // Pra não subir antes de ligar o motor....
        MOVS     R0,#+2
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  409     POTENCIA_ligaMotor = 1;
        LDR.N    R0,??DataTable10_42
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  410   }
//  411 }
??POTENCIA_setRPM_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock9
//  412 /***********************************************************************************
//  413 *       Descrição       :       Calcula o atraso para o gate para uma determinada
//  414 *                               rotação
//  415 *       Parametros      :       (unsigned int) rotação alvo
//  416 *       Retorno         :       (unsigned int) atraso
//  417 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function POTENCIA_calculaAtrasoGate
          CFI NoCalls
        THUMB
//  418 unsigned int POTENCIA_calculaAtrasoGate(int rotacao_rpm){    
POTENCIA_calculaAtrasoGate:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
        MOVS     R4,R0
//  419   
//  420 #ifdef FQ_REDE_60_HZ  
//  421   long long int valor;
//  422   
//  423   valor = rotacao_rpm*4404;
        MOVW     R2,#+4404
        MUL      R2,R2,R4
        ASRS     R3,R2,#+31
        MOVS     R0,R2
        MOVS     R1,R3
//  424   valor>>= 15;
        LSRS     R0,R0,#+15
        ORR      R0,R0,R1, LSL #+17
        ASRS     R1,R1,#+15
//  425   valor = 2499 - valor; 
        MOVW     R2,#+2499
        MOVS     R3,#+0
        SUBS     R0,R2,R0
        SBCS     R1,R3,R1
//  426   
//  427   // trunca os limites
//  428   // do it que gera a interrução
//  429   // para controlar o gate
//  430   // esses valores foram levantado com o scope, então não
//  431   // mudar sem critérios(13/11/2016)
//  432   if(valor<ATRASO_MINIMO)
        CMP      R1,#+0
        BGT.N    ??POTENCIA_calculaAtrasoGate_0
        BLT.N    ??POTENCIA_calculaAtrasoGate_1
        CMP      R0,#+150
        BCS.N    ??POTENCIA_calculaAtrasoGate_0
//  433     valor = ATRASO_MINIMO;
??POTENCIA_calculaAtrasoGate_1:
        MOVS     R2,#+150
        MOVS     R3,#+0
        MOVS     R0,R2
        MOVS     R1,R3
//  434   if(valor>ATRASO_MAXIMO)
??POTENCIA_calculaAtrasoGate_0:
        MOVW     R2,#+2501
        MOVS     R3,#+0
        CMP      R1,R3
        BLT.N    ??POTENCIA_calculaAtrasoGate_2
        BGT.N    ??POTENCIA_calculaAtrasoGate_3
        CMP      R0,R2
        BCC.N    ??POTENCIA_calculaAtrasoGate_2
//  435     valor = ATRASO_MAXIMO;
??POTENCIA_calculaAtrasoGate_3:
        MOVW     R2,#+2500
        MOVS     R3,#+0
        MOVS     R0,R2
        MOVS     R1,R3
//  436   
//  437   return valor;
??POTENCIA_calculaAtrasoGate_2:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  438 #endif
//  439   
//  440 #ifdef FQ_REDE_50_HZ
//  441   long long int valor;
//  442   
//  443   valor = rotacao_rpm * 5757;
//  444   valor>>= 15;
//  445   valor = ATRASO_MAXIMO - valor; 
//  446   
//  447   // trunca os limites
//  448   // do it que gera a interrução
//  449   // para controlar o gate
//  450   // esses valores foram levantado com o scope, então não
//  451   // mudar sem critérios(13/11/2016)
//  452   if(valor<ATRASO_MINIMO)
//  453     valor = ATRASO_MINIMO;
//  454   if(valor>ATRASO_MAXIMO)
//  455     valor = ATRASO_MAXIMO;
//  456   
//  457   return valor;
//  458 #endif  
//  459 }

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function POTENCIA_getRPMmedido
          CFI NoCalls
        THUMB
POTENCIA_getRPMmedido:
        MOVS     R1,#+0
        LDR.N    R0,??DataTable10_35
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??POTENCIA_getRPMmedido_0
        MOVS     R0,#+0
        B.N      ??POTENCIA_getRPMmedido_1
??POTENCIA_getRPMmedido_0:
        MOVS     R0,#+0
??POTENCIA_getRPMmedido_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BGE.N    ??POTENCIA_getRPMmedido_3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable10_31
        LDR      R2,[R2, R0, LSL #+2]
        ADDS     R1,R2,R1
        ADDS     R0,R0,#+1
        B.N      ??POTENCIA_getRPMmedido_2
??POTENCIA_getRPMmedido_3:
        LSRS     R1,R1,#+1
        LDR.N    R0,??DataTable10_44  ;; 0x13098d8
        UDIV     R1,R0,R1
        MOVS     R0,R1
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
        DC32     0x2009c038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_23:
        DC32     BOARD_lock_timer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_24:
        DC32     0x2009c05c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_25:
        DC32     POTENCIA_ciclos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_26:
        DC32     0x400fc140

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_27:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_28:
        DC32     ??contador

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_29:
        DC32     POTENCIA_frequencia

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_30:
        DC32     POTENCIA_timeOutCounter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_31:
        DC32     POTENCIA_bufferRotacao

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_32:
        DC32     0x4000802c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_33:
        DC32     ??ultimaLeitura

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_34:
        DC32     0x40008000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_35:
        DC32     POTENCIA_periodoCapturadoMotor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_36:
        DC32     ??ponteiroLeitura

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_37:
        DC32     0x40090000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_38:
        DC32     0x2009c058

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_39:
        DC32     ??y

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_40:
        DC32     0x186a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_41:
        DC32     ??ultimo_erro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_42:
        DC32     POTENCIA_ligaMotor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_43:
        DC32     POTENCIA_set_point

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_44:
        DC32     0x13098d8

        SECTION `.text`:CODE:REORDER:NOROOT(2)
        SECTION_GROUP POTENCIA_controleVelocidade
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function POTENCIA_controleVelocidade
        THUMB
POTENCIA_controleVelocidade:
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
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0xC
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0xC
        STRH     R0,[R1, #+0]
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x4
        LDRH     R10,[R0, #+0]
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        SUBS     R0,R10,R0
        MOVS     R1,#+0
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x10
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        UMULL    R2,R3,R0,R4
        MLA      R3,R0,R5,R3
        MLA      R3,R1,R4,R3
        MOVS     R4,R2
        MOVS     R5,R3
        LSRS     R4,R4,#+8
        ORR      R4,R4,R5, LSL #+24
        ASRS     R5,R5,#+8
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x4
        LDRH     R0,[R0, #+0]
          CFI FunCall POTENCIA_calcula_derivada_erro
        BL       POTENCIA_calcula_derivada_erro
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x14  ;; 0x40090008
        LDR      R10,[R0, #+0]
        MOVS     R0,R4
          CFI FunCall POTENCIA_calculaAtrasoGate
        BL       POTENCIA_calculaAtrasoGate
        ADDS     R0,R0,R10
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x18  ;; 0x40090018
        STR      R0,[R1, #+0]
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x1C  ;; 0x40090014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x1C  ;; 0x40090014
        STR      R0,[R1, #+0]
        B.N      ??POTENCIA_controleVelocidade_5
??POTENCIA_controleVelocidade_4:
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x4
        LDRH     R10,[R0, #+0]
          CFI FunCall POTENCIA_getRPMmedido
        BL       POTENCIA_getRPMmedido
        SUBS     R0,R10,R0
        MOVS     R1,#+0
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall POTENCIA_calcula_integral_erro
        BL       POTENCIA_calcula_integral_erro
        ASRS     R1,R0,#+31
        MOV      R8,R0
        MOV      R9,R1
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x20
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        UMULL    R2,R3,R0,R8
        MLA      R3,R0,R9,R3
        MLA      R3,R1,R8,R3
        MOV      R8,R2
        MOV      R9,R3
        LSRS     R8,R8,#+15
        ORR      R8,R8,R9, LSL #+17
        ASRS     R9,R9,#+15
        MOVS     R0,R4
          CFI FunCall POTENCIA_calcula_derivada_erro
        BL       POTENCIA_calcula_derivada_erro
        ASRS     R1,R0,#+31
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x24
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        UMULL    R2,R3,R0,R6
        MLA      R3,R0,R7,R3
        MLA      R3,R1,R6,R3
        MOVS     R6,R2
        MOVS     R7,R3
        LSRS     R6,R6,#+15
        ORR      R6,R6,R7, LSL #+17
        ASRS     R7,R7,#+15
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x10
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        UMULL    R2,R3,R0,R4
        MLA      R3,R0,R5,R3
        MLA      R3,R1,R4,R3
        MOVS     R4,R2
        MOVS     R5,R3
        LSRS     R4,R4,#+8
        ORR      R4,R4,R5, LSL #+24
        ASRS     R5,R5,#+8
        ADDS     R4,R4,R8
        ADCS     R5,R5,R9
        ADDS     R4,R4,R6
        ADCS     R5,R5,R7
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x14  ;; 0x40090008
        LDR      R10,[R0, #+0]
        MOVS     R0,R4
          CFI FunCall POTENCIA_calculaAtrasoGate
        BL       POTENCIA_calculaAtrasoGate
        ADDS     R0,R0,R10
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x18  ;; 0x40090018
        STR      R0,[R1, #+0]
        LDR.N    R0,??POTENCIA_controleVelocidade_0+0x1C  ;; 0x40090014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??POTENCIA_controleVelocidade_0+0x1C  ;; 0x40090014
        STR      R0,[R1, #+0]
        B.N      ??POTENCIA_controleVelocidade_5
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
??POTENCIA_controleVelocidade_5:
        POP      {R4-R10,PC}      ;; return
        Nop      
        DATA
??POTENCIA_controleVelocidade_0:
        DC32     POTENCIA_ligaMotor
        DC32     _ZZ27POTENCIA_controleVelocidadeE16referencia_rampa
        DC32     POTENCIA_set_point
        DC32     _ZZ27POTENCIA_controleVelocidadeE6ciclos
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
//  460 /***********************************************************************************
//  461 *       Descrição       :       Lê os RPMs do motor
//  462 *       Parametros      :       nenhum
//  463 *       Retorno         :       (unsigned int) RPM atual do motor
//  464 ***********************************************************************************/
//  465 unsigned int POTENCIA_getRPMmedido(void){  
//  466   unsigned int media=0; 
//  467   
//  468   if(!POTENCIA_periodoCapturadoMotor)
//  469     return 0;
//  470 
//  471   for(unsigned char i=0;i<TAM_BUF_VELOCIDADE;i++)
//  472     media += POTENCIA_bufferRotacao[i];  
//  473   media>>=DIV_MEDIA_VEL;
//  474   
//  475   media = 19962072/media;
//  476    
//  477   return media;
//  478 }
//  479 /***********************************************************************************
//  480 *       Fim do arquivo
//  481 ***********************************************************************************/
// 
//    47 bytes in section .bss
//     4 bytes in section .data
//   120 bytes in section .noinit (abs)
//    12 bytes in section .rodata
// 1 724 bytes in section .text
// 
// 1 300 bytes of CODE  memory (+ 424 bytes shared)
//    12 bytes of CONST memory
//    47 bytes of DATA  memory (+ 124 bytes shared)
//
//Errors: none
//Warnings: 2
