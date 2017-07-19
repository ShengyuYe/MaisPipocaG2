///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     19/Jul/2017  13:51:51 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\AmostragemAnalogica\AmostraAnal /
//                    ogica.c                                                 /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\AmostragemAnalogica\AmostraAnal /
//                    ogica.c -lC C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Har /
//                    dware\MaisPipocaG2\SOFTWARE\Debug\List\ -lA             /
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
//                    pocaG2\SOFTWARE\Debug\List\AmostraAnalogica.s           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME AmostraAnalogica

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_d2f
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_dsub
        EXTERN __aeabi_f2d
        EXTERN __aeabi_ui2d

        PUBLIC AA_amostragemAnalogica
        PUBLIC AA_bufferEntradasAnalogicas
        PUBLIC AA_bufferSensorPapel
        PUBLIC AA_calculaResistor
        PUBLIC AA_calculaResistorInteiro
        PUBLIC AA_calculaTemperatura
        PUBLIC AA_calculaTemperaturaInteira
        PUBLIC AA_ini
        PUBLIC AA_intertravador
        PUBLIC AA_mediaMovel
        PUBLIC AA_mediaMovelPapel
        PUBLIC AA_verificaConexaoTermistor
        PUBLIC ES_tickTimer
        PUBLIC TABTERM_curva_maximo
        PUBLIC TABTERM_curva_minimo
        PUBLIC _A_AD0CR
        PUBLIC _A_AD0GDR
        PUBLIC _A_PCLKSEL0
        PUBLIC _A_PCONP
        PUBLIC _A_PINSEL1
        PUBLIC _ZZ22AA_amostragemAnalogicaE11indicePapel
        PUBLIC _ZZ22AA_amostragemAnalogicaE13ultimaAmostra
        PUBLIC _ZZ22AA_amostragemAnalogicaE5canal
        PUBLIC _ZZ22AA_amostragemAnalogicaE6indice
        PUBLIC _ZZ22AA_amostragemAnalogicaE7timeOut
        PUBLIC _ZZ22AA_amostragemAnalogicaE8derivada
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\AmostragemAnalogica\AmostraAnalogica.c
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
//   17 |       Arquivo            :  AmostraAnalogica.c
//   18 | 
//   19 |       Autor              :  Marcos Aquino
//   20 |       Data criação       :  19/06/2014
//   21 |
//   22 |       Revisões           :  1.0.0.0
//   23 |
//   24 |
//   25 | __________________________________________________________________________________
//   26 */
//   27 
//   28 /***********************************************************************************
//   29 *       Include
//   30 ***********************************************************************************/
//   31 #include <nxp\iolpc1768.h>

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

        ASEGN `.noinit`:DATA:NOROOT,040034000H
        SECTION_GROUP _A_AD0CR
// __absolute union <unnamed> volatile _A_AD0CR
_A_AD0CR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,040034004H
        SECTION_GROUP _A_AD0GDR
// __absolute union <unnamed> volatile _A_AD0GDR
_A_AD0GDR:
        DS8 4
//   32 #include "..\..\includes.h"
//   33 #include "amostraAnalogica.h"
//   34 #include <math.h>
//   35 #include "tabelaTermistor.h"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned short const TABTERM_curva_minimo[180]
TABTERM_curva_minimo:
        DATA
        DC16 10100, 9729, 9373, 9032, 8706, 8393, 8093, 7805, 7529, 7265, 7011
        DC16 6767, 6534, 6309, 6094, 5887, 5688, 5500, 5313, 5136, 4967, 4804
        DC16 4647, 4496, 4351, 4211, 4076, 3947, 3822, 3702, 3586, 3475, 3367
        DC16 3264, 3164, 3068, 2975, 2886, 2799, 2716, 2636, 2558, 2483, 2411
        DC16 2341, 2273, 2208, 2145, 2084, 2026, 1969, 1914, 1861, 1809, 1760
        DC16 1712, 1665, 1620, 1577, 1534, 1494, 1454, 1416, 1379, 1343, 1308
        DC16 1274, 1242, 1210, 1179, 1149, 1121, 1093, 1065, 1039, 1013, 989
        DC16 965, 941, 918, 896, 875, 854, 834, 814, 795, 777, 759, 741, 724
        DC16 708, 692, 676, 661, 646, 632, 618, 604, 591, 578, 565, 553, 541
        DC16 530, 518, 507, 497, 486, 476, 466, 457, 447, 438, 429, 420, 412
        DC16 404, 396, 388, 380, 372, 365, 358, 351, 344, 338, 331, 325, 319
        DC16 313, 307, 301, 295, 290, 284, 279, 274, 269, 264, 259, 255, 250
        DC16 246, 241, 237, 233, 229, 225, 221, 217, 213, 210, 206, 203, 199
        DC16 196, 193, 189, 186, 183, 180, 177, 174, 171, 169, 166, 163, 161
        DC16 159, 156, 154, 151, 149, 147, 144, 142, 140, 138, 136, 134

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned short const TABTERM_curva_maximo[180]
TABTERM_curva_maximo:
        DATA
        DC16 9900, 9529, 9173, 8833, 8508, 8196, 7897, 7611, 7337, 7074, 6822
        DC16 6580, 6348, 6126, 5912, 5707, 5511, 5322, 5141, 4966, 4799, 4638
        DC16 4484, 4335, 4192, 4055, 3923, 3796, 3673, 3556, 3442, 3333, 3228
        DC16 3127, 3029, 2935, 2845, 2758, 2674, 2592, 2514, 2439, 2366, 2296
        DC16 2228, 2162, 2099, 2038, 1979, 1922, 1867, 1814, 1763, 1713, 1665
        DC16 1619, 1574, 1530, 1488, 1448, 1408, 1370, 1334, 1298, 1264, 1230
        DC16 1198, 1166, 1136, 1107, 1078, 1051, 1024, 998, 973, 948, 925, 902
        DC16 879, 858, 837, 816, 797, 777, 759, 741, 723, 706, 689, 673, 658
        DC16 642, 627, 613, 599, 586, 572, 559, 547, 535, 523, 511, 500, 489
        DC16 479, 468, 458, 448, 439, 429, 420, 412, 403, 395, 386, 378, 371
        DC16 363, 356, 349, 342, 335, 328, 321, 315, 309, 303, 297, 291, 286
        DC16 280, 275, 270, 264, 259, 255, 250, 245, 241, 236, 232, 228, 223
        DC16 219, 215, 212, 208, 204, 200, 197, 193, 190, 187, 184, 180, 177
        DC16 174, 171, 168, 166, 163, 160, 157, 155, 152, 150, 147, 145, 143
        DC16 140, 138, 136, 134, 131, 129, 127, 125, 123, 121, 120
//   36 
//   37 /***********************************************************************************
//   38 *       Definições locais
//   39 ***********************************************************************************/
//   40 #define TAMANHO_BUFFER_ENTRADAS_ANALOGICAS              16
//   41 
//   42 /***********************************************************************************
//   43 *       Definições para o cálculo da temperatura
//   44 ***********************************************************************************/
//   45 // Em 3/08/2015 alterada a curva para o novo termistor que foi
//   46 // enviado pela addtherm
//   47 #define BETA_25_GRAUS                                   3910//3961
//   48 #define RT_NOVO                                         1001//1030
//   49 #define RESISTOR_LIMITADOR                              500
//   50 
//   51 /***********************************************************************************
//   52 *       Variaveis - locais
//   53 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   54 unsigned short int AA_bufferEntradasAnalogicas[TAMANHO_BUFFER_ENTRADAS_ANALOGICAS];
AA_bufferEntradasAnalogicas:
        DS8 32

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   55 unsigned short int AA_bufferSensorPapel[TAMANHO_BUFFER_ENTRADAS_ANALOGICAS];
AA_bufferSensorPapel:
        DS8 32

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   56 unsigned short int AA_intertravador;
AA_intertravador:
        DS8 2
//   57 
//   58 /***********************************************************************************
//   59 *       Funções - locais
//   60 ***********************************************************************************/
//   61 void AA_amostragemAnalogica(void);
//   62 unsigned short int AA_mediaMovel(void);
//   63 
//   64 /***********************************************************************************
//   65 *       Implementação
//   66 ***********************************************************************************/
//   67 
//   68 /***********************************************************************************
//   69 *       Descrição       :       inicialização do módulo
//   70 *       Parametros      :       nenhum
//   71 *       Retorno         :       nenhum
//   72 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function AA_ini
          CFI NoCalls
        THUMB
//   73 void AA_ini(void){   
//   74   
//   75   PCONP_bit.PCAD = 1;
AA_ini:
        LDR.N    R0,??DataTable5  ;; 0x400fc0c4
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable5  ;; 0x400fc0c4
        STR      R0,[R1, #+0]
//   76   PCLKSEL0_bit.PCLK_ADC = 1;  
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_1  ;; 0x400fc1a8
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+24,#+2
        LDR.N    R0,??DataTable5_1  ;; 0x400fc1a8
        STR      R1,[R0, #+0]
//   77   
//   78   PINSEL1_bit.P0_23 = 1;   
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_2  ;; 0x4002c004
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+14,#+2
        LDR.N    R0,??DataTable5_2  ;; 0x4002c004
        STR      R1,[R0, #+0]
//   79   PINSEL1_bit.P0_24 = 1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_2  ;; 0x4002c004
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+16,#+2
        LDR.N    R0,??DataTable5_2  ;; 0x4002c004
        STR      R1,[R0, #+0]
//   80     
//   81   AD0CR_bit.SEL = 0;
        LDR.N    R0,??DataTable5_3  ;; 0x40034000
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+8
        LSLS     R0,R0,#+8
        LDR.N    R1,??DataTable5_3  ;; 0x40034000
        STR      R0,[R1, #+0]
//   82   AD0CR_bit.CLKDIV = 10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable5_3  ;; 0x40034000
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+8,#+8
        LDR.N    R0,??DataTable5_3  ;; 0x40034000
        STR      R1,[R0, #+0]
//   83   AD0CR_bit.BURST = 0;
        LDR.N    R0,??DataTable5_3  ;; 0x40034000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x10000
        LDR.N    R1,??DataTable5_3  ;; 0x40034000
        STR      R0,[R1, #+0]
//   84   AD0CR_bit.PDN = 1;
        LDR.N    R0,??DataTable5_3  ;; 0x40034000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200000
        LDR.N    R1,??DataTable5_3  ;; 0x40034000
        STR      R0,[R1, #+0]
//   85   
//   86   AD0CR_bit.START = 1;     
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_3  ;; 0x40034000
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+24,#+3
        LDR.N    R0,??DataTable5_3  ;; 0x40034000
        STR      R1,[R0, #+0]
//   87 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_PCONP
        REQUIRE _A_PCLKSEL0
        REQUIRE _A_PINSEL1
        REQUIRE _A_AD0CR
//   88 /***********************************************************************************
//   89 *       Descrição       :       Tick de timer do módulo
//   90 *       Parametros      :       nenhum
//   91 *       Retorno         :       nenhum
//   92 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function ES_tickTimer
        THUMB
//   93 void ES_tickTimer(void){
ES_tickTimer:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   94    
//   95   AA_amostragemAnalogica();     // Amostragem das entradas analógicas
          CFI FunCall AA_amostragemAnalogica
        BL       AA_amostragemAnalogica
//   96 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   97 /***********************************************************************************
//   98 *       Descrição       :       Calcula a média das últimas amostras
//   99 *                               do sistema
//  100 *       Parametros      :       (unsigned char) canal
//  101 *       Retorno         :       (unsigned short int) média móvel 
//  102 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function AA_mediaMovel
          CFI NoCalls
        THUMB
//  103 unsigned short int AA_mediaMovel(void){
//  104   unsigned int media=0;
AA_mediaMovel:
        MOVS     R0,#+0
//  105     
//  106   for(unsigned char i=0;i<TAMANHO_BUFFER_ENTRADAS_ANALOGICAS;i++)
        MOVS     R1,#+0
        B.N      ??AA_mediaMovel_0
//  107     media += AA_bufferEntradasAnalogicas[i];
??AA_mediaMovel_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R2,??DataTable5_4
        LDRH     R2,[R2, R1, LSL #+1]
        ADDS     R0,R2,R0
        ADDS     R1,R1,#+1
??AA_mediaMovel_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+16
        BLT.N    ??AA_mediaMovel_1
//  108   
//  109   return (unsigned short int)media>>4;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+4
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  110 }
//  111 /***********************************************************************************
//  112 *       Descrição       :       Faz a amostragem das entradas analógicas
//  113 *       Parametros      :       nenhum
//  114 *       Retorno         :       nenhum
//  115 ***********************************************************************************/
//  116 #pragma inline
//  117 void AA_amostragemAnalogica(void){

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        SECTION_GROUP _ZZ22AA_amostragemAnalogicaE6indice
//  118   static unsigned char indice=0;
_ZZ22AA_amostragemAnalogicaE6indice:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        SECTION_GROUP _ZZ22AA_amostragemAnalogicaE7timeOut
//  119   static unsigned char timeOut=3;
_ZZ22AA_amostragemAnalogicaE7timeOut:
        DATA
        DC8 3

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        SECTION_GROUP _ZZ22AA_amostragemAnalogicaE13ultimaAmostra
//  120   static unsigned int ultimaAmostra;
_ZZ22AA_amostragemAnalogicaE13ultimaAmostra:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        SECTION_GROUP _ZZ22AA_amostragemAnalogicaE8derivada
//  121   static int derivada=0;
_ZZ22AA_amostragemAnalogicaE8derivada:
        DS8 4
//  122   unsigned int temp;

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        SECTION_GROUP _ZZ22AA_amostragemAnalogicaE5canal
//  123   static unsigned char canal=0;
_ZZ22AA_amostragemAnalogicaE5canal:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        SECTION_GROUP _ZZ22AA_amostragemAnalogicaE11indicePapel
//  124   static unsigned char indicePapel=0;
_ZZ22AA_amostragemAnalogicaE11indicePapel:
        DS8 1
//  125      
//  126   if(AD0GDR_bit.DONE){
//  127     canal = ~canal;
//  128     
//  129     if(canal){
//  130       temp = AD0GDR_bit.RESULT;       
//  131       
//  132       derivada = ultimaAmostra - temp;
//  133       if(derivada<0)
//  134         derivada = derivada * -1;
//  135       ultimaAmostra = temp;      
//  136       
//  137       if(derivada<500){
//  138         AA_bufferEntradasAnalogicas[indice]  = temp;
//  139         indice = (indice+1) % TAMANHO_BUFFER_ENTRADAS_ANALOGICAS;        
//  140       }
//  141       
//  142       timeOut = 3;    
//  143       AD0CR_bit.SEL = 2;
//  144       AD0CR_bit.START = 1;        
//  145     }
//  146     else{      
//  147       
//  148       AA_bufferSensorPapel[indicePapel] = AD0GDR_bit.RESULT;            
//  149       indicePapel = (indicePapel+1)%TAMANHO_BUFFER_ENTRADAS_ANALOGICAS;      
//  150       
//  151       timeOut = 3;    
//  152       AD0CR_bit.SEL = 0;
//  153       AD0CR_bit.START = 1;              
//  154     }
//  155     
//  156     
//  157   }//Fim da amostragem
//  158   
//  159   if(timeOut){
//  160     timeOut--;
//  161     if(!timeOut){
//  162       AD0CR_bit.SEL = 0;
//  163       AD0CR_bit.START = 1;         
//  164       timeOut=3;
//  165       canal = 0;
//  166     }      
//  167   }
//  168 }
//  169 /***********************************************************************************
//  170 *       Descrição       :       Calcula o valor da resistência do termistor
//  171 *       Parametros      :       nenhum
//  172 *       Retorno         :       (float) resistência do termistor
//  173 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function AA_calculaResistor
        THUMB
//  174 float AA_calculaResistor(void){
AA_calculaResistor:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//  175   float vx;  
//  176   float resistor;
//  177   
//  178   vx = (AA_mediaMovel()*3.3/4096.0);  
          CFI FunCall AA_mediaMovel
        BL       AA_mediaMovel
          CFI FunCall __aeabi_ui2d
        BL       __aeabi_ui2d
        MOVS     R2,#+1717986918
        LDR.N    R3,??DataTable5_5  ;; 0x400a6666
          CFI FunCall __aeabi_dmul
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable5_6  ;; 0x40b00000
          CFI FunCall __aeabi_ddiv
        BL       __aeabi_ddiv
          CFI FunCall __aeabi_d2f
        BL       __aeabi_d2f
        MOVS     R6,R0
//  179   resistor = (RESISTOR_LIMITADOR*(3.3-vx))/vx;    
        MOVS     R0,R6
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+1717986918
        LDR.N    R1,??DataTable5_5  ;; 0x400a6666
          CFI FunCall __aeabi_dsub
        BL       __aeabi_dsub
        MOVS     R2,#+0
        LDR.N    R3,??DataTable5_7  ;; 0x407f4000
          CFI FunCall __aeabi_dmul
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R6
          CFI FunCall __aeabi_f2d
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
          CFI FunCall __aeabi_ddiv
        BL       __aeabi_ddiv
          CFI FunCall __aeabi_d2f
        BL       __aeabi_d2f
//  180     
//  181   return resistor;
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock3
//  182 }
//  183 /***********************************************************************************
//  184 *       Descrição       :       Faz o calcula da resistência utilizando
//  185 *                               apenas números de ponto fixo
//  186 *       Parametros      :       nenhum
//  187 *       Retorno         :       (unsigned short int) resistência medida
//  188 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function AA_calculaResistorInteiro
        THUMB
//  189 unsigned short int AA_calculaResistorInteiro(void){
AA_calculaResistorInteiro:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  190   unsigned int vmeas;
//  191   unsigned int vx;
//  192   unsigned int rx;
//  193   unsigned int ix;
//  194   
//  195   vmeas = AA_mediaMovel();
          CFI FunCall AA_mediaMovel
        BL       AA_mediaMovel
//  196   
//  197   vx = vmeas*806;
        MOVW     R1,#+806
        MULS     R0,R1,R0
//  198   
//  199   ix  = (3300000 - vx);   // em micro amperes
        LDR.N    R1,??DataTable5_8  ;; 0x325aa0
        SUBS     R1,R1,R0
//  200   ix /= 499;
        MOVW     R0,#+499
        UDIV     R1,R1,R0
//  201   
//  202   vx  = 3300000 - (2*ix*499);
        LDR.N    R0,??DataTable5_8  ;; 0x325aa0
        MOVW     R2,#+998
        MLS      R0,R2,R1,R0
//  203   rx  = vx/ix;
        UDIV     R0,R0,R1
//  204   
//  205   return rx;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
//  206   
//  207   /*
//  208   vx*= 52800;
//  209   vx>>=16;
//  210   
//  211   rx = (1650000-(vx*1000));
//  212   rx/= vx;
//  213   
//  214   return rx;    
//  215   */
//  216 }
//  217 /***********************************************************************************
//  218 *       Descrição       :       Calcula a temperatura do sistema
//  219 *       Parametros      :       nenhum
//  220 *       Retorno         :       (float) temperatura medida
//  221 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function AA_calculaTemperatura
        THUMB
//  222 unsigned short int AA_calculaTemperatura(void){
AA_calculaTemperatura:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  223   unsigned short int resistor = AA_calculaResistorInteiro();
          CFI FunCall AA_calculaResistorInteiro
        BL       AA_calculaResistorInteiro
//  224     
//  225   if(resistor>10000)
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVW     R1,#+10001
        CMP      R0,R1
        BLT.N    ??AA_calculaTemperatura_0
//  226     return 25;
        MOVS     R0,#+25
        B.N      ??AA_calculaTemperatura_1
//  227   
//  228   for(unsigned short int i=0;i<TAMANHO_TABELA_TERMISTOR-1;i++){
??AA_calculaTemperatura_0:
        MOVS     R1,#+0
        B.N      ??AA_calculaTemperatura_2
??AA_calculaTemperatura_3:
        ADDS     R1,R1,#+1
??AA_calculaTemperatura_2:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+179
        BGE.N    ??AA_calculaTemperatura_4
//  229     
//  230     if(resistor<=TABTERM_curva_maximo[i] && resistor>TABTERM_curva_maximo[i+1] ||              
//  231        resistor<=TABTERM_curva_minimo[i] && resistor>TABTERM_curva_maximo[i+1] ) 
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R2,??DataTable5_9
        LDRH     R2,[R2, R1, LSL #+1]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R2,R0
        BCC.N    ??AA_calculaTemperatura_5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R2,??DataTable5_9
        ADDS     R2,R2,R1, LSL #+1
        LDRH     R2,[R2, #+2]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R2,R0
        BCC.N    ??AA_calculaTemperatura_6
??AA_calculaTemperatura_5:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R2,??DataTable5_10
        LDRH     R2,[R2, R1, LSL #+1]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R2,R0
        BCC.N    ??AA_calculaTemperatura_3
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R2,??DataTable5_9
        ADDS     R2,R2,R1, LSL #+1
        LDRH     R2,[R2, #+2]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R2,R0
        BCS.N    ??AA_calculaTemperatura_3
//  232       return 28+i;
??AA_calculaTemperatura_6:
        ADDS     R0,R1,#+28
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        B.N      ??AA_calculaTemperatura_1
//  233   }       
//  234   
//  235   return 500;
??AA_calculaTemperatura_4:
        MOV      R0,#+500
??AA_calculaTemperatura_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock5
//  236 }
//  237 /***********************************************************************************
//  238 *       Descrição       :       Calcula a temperatura utilizando números
//  239 *                               inteiros
//  240 *       Parametros      :       nenhum
//  241 *       Retorno         :       (unsigned short int) temperatura lida do sensor
//  242 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function AA_calculaTemperaturaInteira
        THUMB
//  243 unsigned short int AA_calculaTemperaturaInteira(void){  
AA_calculaTemperaturaInteira:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  244    
//  245   return (unsigned short int)AA_calculaTemperatura();
          CFI FunCall AA_calculaTemperatura
        BL       AA_calculaTemperatura
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock6
//  246 }
//  247 /***********************************************************************************
//  248 *       Descrição       :       Verifica se o termistor está conectado
//  249 *                               ao adc
//  250 *       Parametros      :       nenhum
//  251 *       Retorno         :       (unsigned char) maior do que zero se o 
//  252 *                                               termistor estiver conectado
//  253 *                                               ao adc
//  254 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function AA_verificaConexaoTermistor
        THUMB
//  255 unsigned char AA_verificaConexaoTermistor(void){
AA_verificaConexaoTermistor:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  256   
//  257   if(AA_mediaMovel()>10)
          CFI FunCall AA_mediaMovel
        BL       AA_mediaMovel
        CMP      R0,#+11
        BLT.N    ??AA_verificaConexaoTermistor_0
//  258     return 255;
        MOVS     R0,#+255
        B.N      ??AA_verificaConexaoTermistor_1
//  259   
//  260   return 0;  
??AA_verificaConexaoTermistor_0:
        MOVS     R0,#+0
??AA_verificaConexaoTermistor_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock7
//  261 }

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function AA_mediaMovelPapel
          CFI NoCalls
        THUMB
AA_mediaMovelPapel:
        MOVS     R0,#+0
        MOVS     R1,#+0
        B.N      ??AA_mediaMovelPapel_0
??AA_mediaMovelPapel_1:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R2,??DataTable5_11
        LDRH     R2,[R2, R1, LSL #+1]
        ADDS     R0,R2,R0
        ADDS     R1,R1,#+1
??AA_mediaMovelPapel_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+16
        BLT.N    ??AA_mediaMovelPapel_1
        LSRS     R0,R0,#+4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x400fc0c4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x400fc1a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x4002c004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x40034000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     AA_bufferEntradasAnalogicas

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x400a6666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x40b00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0x407f4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     0x325aa0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     TABTERM_curva_maximo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     TABTERM_curva_minimo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     AA_bufferSensorPapel

        SECTION `.text`:CODE:REORDER:NOROOT(2)
        SECTION_GROUP AA_amostragemAnalogica
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function AA_amostragemAnalogica
          CFI NoCalls
        THUMB
AA_amostragemAnalogica:
        LDR.N    R0,??AA_amostragemAnalogica_0  ;; 0x40034004
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+31
        CMP      R0,#+0
        BEQ.N    ??AA_amostragemAnalogica_1
        LDR.N    R0,??AA_amostragemAnalogica_0+0x4
        LDRB     R0,[R0, #+0]
        MVNS     R0,R0
        LDR.N    R1,??AA_amostragemAnalogica_0+0x4
        STRB     R0,[R1, #+0]
        LDR.N    R0,??AA_amostragemAnalogica_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??AA_amostragemAnalogica_2
        LDR.N    R0,??AA_amostragemAnalogica_0  ;; 0x40034004
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+4,#+12
        LDR.N    R1,??AA_amostragemAnalogica_0+0x8
        LDR      R1,[R1, #+0]
        SUBS     R1,R1,R0
        LDR.N    R2,??AA_amostragemAnalogica_0+0xC
        STR      R1,[R2, #+0]
        LDR.N    R1,??AA_amostragemAnalogica_0+0xC
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BPL.N    ??AA_amostragemAnalogica_3
        LDR.N    R1,??AA_amostragemAnalogica_0+0xC
        LDR      R1,[R1, #+0]
        MOVS     R2,#-1
        MULS     R1,R2,R1
        LDR.N    R2,??AA_amostragemAnalogica_0+0xC
        STR      R1,[R2, #+0]
??AA_amostragemAnalogica_3:
        LDR.N    R1,??AA_amostragemAnalogica_0+0x8
        STR      R0,[R1, #+0]
        LDR.N    R1,??AA_amostragemAnalogica_0+0xC
        LDR      R1,[R1, #+0]
        CMP      R1,#+500
        BGE.N    ??AA_amostragemAnalogica_4
        LDR.N    R1,??AA_amostragemAnalogica_0+0x10
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??AA_amostragemAnalogica_0+0x14
        STRH     R0,[R2, R1, LSL #+1]
        LDR.N    R0,??AA_amostragemAnalogica_0+0x10
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+16
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.N    R0,??AA_amostragemAnalogica_0+0x10
        STRB     R2,[R0, #+0]
??AA_amostragemAnalogica_4:
        LDR.N    R0,??AA_amostragemAnalogica_0+0x18
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
        MOVS     R0,#+2
        LDR.N    R1,??AA_amostragemAnalogica_0+0x1C  ;; 0x40034000
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+0,#+8
        LDR.N    R0,??AA_amostragemAnalogica_0+0x1C  ;; 0x40034000
        STR      R1,[R0, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??AA_amostragemAnalogica_0+0x1C  ;; 0x40034000
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+24,#+3
        LDR.N    R0,??AA_amostragemAnalogica_0+0x1C  ;; 0x40034000
        STR      R1,[R0, #+0]
        B.N      ??AA_amostragemAnalogica_1
??AA_amostragemAnalogica_2:
        LDR.N    R0,??AA_amostragemAnalogica_0  ;; 0x40034004
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+4,#+12
        LDR.N    R1,??AA_amostragemAnalogica_0+0x20
        LDRB     R1,[R1, #+0]
        LDR.N    R2,??AA_amostragemAnalogica_0+0x24
        STRH     R0,[R2, R1, LSL #+1]
        LDR.N    R0,??AA_amostragemAnalogica_0+0x20
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MOVS     R1,#+16
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.N    R0,??AA_amostragemAnalogica_0+0x20
        STRB     R2,[R0, #+0]
        LDR.N    R0,??AA_amostragemAnalogica_0+0x18
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
        LDR.N    R0,??AA_amostragemAnalogica_0+0x1C  ;; 0x40034000
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+8
        LSLS     R0,R0,#+8
        LDR.N    R1,??AA_amostragemAnalogica_0+0x1C  ;; 0x40034000
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??AA_amostragemAnalogica_0+0x1C  ;; 0x40034000
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+24,#+3
        LDR.N    R0,??AA_amostragemAnalogica_0+0x1C  ;; 0x40034000
        STR      R1,[R0, #+0]
??AA_amostragemAnalogica_1:
        LDR.N    R0,??AA_amostragemAnalogica_0+0x18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??AA_amostragemAnalogica_5
        LDR.N    R0,??AA_amostragemAnalogica_0+0x18
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??AA_amostragemAnalogica_0+0x18
        STRB     R0,[R1, #+0]
        LDR.N    R0,??AA_amostragemAnalogica_0+0x18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??AA_amostragemAnalogica_5
        LDR.N    R0,??AA_amostragemAnalogica_0+0x1C  ;; 0x40034000
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+8
        LSLS     R0,R0,#+8
        LDR.N    R1,??AA_amostragemAnalogica_0+0x1C  ;; 0x40034000
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??AA_amostragemAnalogica_0+0x1C  ;; 0x40034000
        LDR      R1,[R1, #+0]
        BFI      R1,R0,#+24,#+3
        LDR.N    R0,??AA_amostragemAnalogica_0+0x1C  ;; 0x40034000
        STR      R1,[R0, #+0]
        LDR.N    R0,??AA_amostragemAnalogica_0+0x18
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
        LDR.N    R0,??AA_amostragemAnalogica_0+0x4
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
??AA_amostragemAnalogica_5:
        BX       LR               ;; return
        DATA
??AA_amostragemAnalogica_0:
        DC32     0x40034004
        DC32     _ZZ22AA_amostragemAnalogicaE5canal
        DC32     _ZZ22AA_amostragemAnalogicaE13ultimaAmostra
        DC32     _ZZ22AA_amostragemAnalogicaE8derivada
        DC32     _ZZ22AA_amostragemAnalogicaE6indice
        DC32     AA_bufferEntradasAnalogicas
        DC32     _ZZ22AA_amostragemAnalogicaE7timeOut
        DC32     0x40034000
        DC32     _ZZ22AA_amostragemAnalogicaE11indicePapel
        DC32     AA_bufferSensorPapel
          CFI EndBlock cfiBlock9
        REQUIRE _A_AD0GDR
        REQUIRE _A_AD0CR

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  262 /***********************************************************************************
//  263 *       Descrição       :       Média da amostragem do papel
//  264 *       Parametros      :       nenhum
//  265 *       Retorno         :       (unsigned short int) média do papel
//  266 ***********************************************************************************/
//  267 unsigned short int AA_mediaMovelPapel(void){
//  268   unsigned int media=0;
//  269 
//  270   for(unsigned short int i=0;i<TAMANHO_BUFFER_ENTRADAS_ANALOGICAS;i++)
//  271     media+= AA_bufferSensorPapel[i];
//  272   
//  273   media>>=4;  
//  274   
//  275   return media;  
//  276 }
//  277 /***********************************************************************************
//  278 *       Fim do arquivo
//  279 ***********************************************************************************/
// 
//  77 bytes in section .bss
//   1 byte  in section .data
//  20 bytes in section .noinit (abs)
// 720 bytes in section .rodata
// 824 bytes in section .text
// 
// 500 bytes of CODE  memory (+ 324 bytes shared)
// 720 bytes of CONST memory
//  66 bytes of DATA  memory (+  32 bytes shared)
//
//Errors: none
//Warnings: none
