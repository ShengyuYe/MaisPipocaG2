///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     19/Jul/2017  15:05:35 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\WH1602\WH1602.C                 /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\WH1602\WH1602.C -lC             /
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
//                    pocaG2\SOFTWARE\Debug\List\WH1602.s                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME WH1602

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN vTaskDelay

        PUBLIC HD44780_desligaCursor
        PUBLIC HD44780_desligaCursorPiscante
        PUBLIC HD44780_desligaDisplay
        PUBLIC HD44780_enviaByte
        PUBLIC HD44780_enviaNibble
        PUBLIC HD44780_init
        PUBLIC HD44780_ligaCursor
        PUBLIC HD44780_ligaCursorPiscante
        PUBLIC HD44780_ligaDisplay
        PUBLIC HD44780_posicionaTexto
        PUBLIC HD44780_writeChar
        PUBLIC HD44780_writeString
        PUBLIC _A_FIO0CLR
        PUBLIC _A_FIO0DIR
        PUBLIC _A_FIO0SET
        PUBLIC _A_FIO1CLR
        PUBLIC _A_FIO1DIR
        PUBLIC _A_FIO1SET
        PUBLIC controleLcd
        PUBLIC teste_lcd
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\WH1602\WH1602.C
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
//   17 |       Arquivo            :  WH1602.C
//   18 |       Descrição          :  Driver para o LCD wh1602 da winstar
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :
//   22 |
//   23 |       Revisões           :  1.0.0.0
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 
//   29 /***********************************************************************************
//   30 *		Includes
//   31 ***********************************************************************************/
//   32 #include <stdio.h>
//   33 #include <stdlib.h>
//   34 #include "WH1602_targetWrapper.h"

        ASEGN `.noinit`:DATA:NOROOT,02009c000H
        SECTION_GROUP _A_FIO0DIR
// __absolute union <unnamed> volatile _A_FIO0DIR
_A_FIO0DIR:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c018H
        SECTION_GROUP _A_FIO0SET
// __absolute union <unnamed> volatile _A_FIO0SET
_A_FIO0SET:
        DS8 4

        ASEGN `.noinit`:DATA:NOROOT,02009c01cH
        SECTION_GROUP _A_FIO0CLR
// __absolute union <unnamed> volatile _A_FIO0CLR
_A_FIO0CLR:
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
//   35 #include "WH1602.H"
//   36 /***********************************************************************************
//   37 *		Constantes
//   38 ***********************************************************************************/
//   39 #define ENDERECO_SEGUNDA_LINHA              0xC0
//   40 #define DELAY_CICLES                        1100
//   41 
//   42 #define HD44780_delay_ms(X)                 vTaskDelay(X)
//   43 /***********************************************************************************
//   44 *		Variaveis locais
//   45 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   46 unsigned char controleLcd=0x00;
controleLcd:
        DS8 1
//   47 
//   48 /***********************************************************************************
//   49 *		Funções locais
//   50 ***********************************************************************************/
//   51 void HD44780_enviaNibble(unsigned char value);
//   52 void HD44780_enviaByte(unsigned char endereco,unsigned char value);
//   53 
//   54 /***********************************************************************************
//   55 *		Implementação
//   56 ***********************************************************************************/
//   57 
//   58 /***********************************************************************************
//   59 *   Descrição   :   Inicialização do módulo
//   60 *   Parametros  :   nenhum
//   61 *   Retorno     :   nenhum
//   62 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function HD44780_init
        THUMB
//   63 void HD44780_init(unsigned char modo1,unsigned char modo2){
HD44780_init:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//   64   unsigned char i;
//   65   
//   66   INIT_DIR_PINS; 
        LDR.N    R0,??DataTable9  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable9  ;; 0x2009c020
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable9  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable9  ;; 0x2009c020
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable9_1  ;; 0x2009c000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable9_1  ;; 0x2009c000
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable9_1  ;; 0x2009c000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable9_1  ;; 0x2009c000
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable9_1  ;; 0x2009c000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable9_1  ;; 0x2009c000
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable9_1  ;; 0x2009c000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable9_1  ;; 0x2009c000
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable9  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9  ;; 0x2009c020
        STR      R0,[R1, #+0]
//   67   
//   68   HD44780_delay_ms(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   69 
//   70   for(i=0;i<3;i++){
        MOVS     R6,#+0
        B.N      ??HD44780_init_0
//   71     HD44780_enviaNibble(0x03);
??HD44780_init_1:
        MOVS     R0,#+3
          CFI FunCall HD44780_enviaNibble
        BL       HD44780_enviaNibble
//   72     HD44780_delay_ms(100);  
        MOVS     R0,#+100
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   73   }
        ADDS     R6,R6,#+1
??HD44780_init_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+3
        BLT.N    ??HD44780_init_1
//   74   
//   75   HD44780_enviaNibble(0x02);
        MOVS     R0,#+2
          CFI FunCall HD44780_enviaNibble
        BL       HD44780_enviaNibble
//   76   HD44780_delay_ms(20);      
        MOVS     R0,#+20
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   77   
//   78   
//   79   HD44780_enviaByte(0,0x20 | modo1);
        ORRS     R1,R4,#0x20
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//   80   HD44780_delay_ms(20);        
        MOVS     R0,#+20
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   81   HD44780_enviaByte(0,0x08 | modo2);
        ORRS     R1,R5,#0x8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//   82   HD44780_delay_ms(20);        
        MOVS     R0,#+20
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   83   
//   84   controleLcd = 0x08 | modo2;
        ORRS     R0,R5,#0x8
        LDR.N    R1,??DataTable9_2
        STRB     R0,[R1, #+0]
//   85   
//   86   HD44780_enviaByte(0,0x10);
        MOVS     R1,#+16
        MOVS     R0,#+0
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//   87   HD44780_delay_ms(10);          
        MOVS     R0,#+10
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   88   HD44780_enviaByte(0,0x06);   
        MOVS     R1,#+6
        MOVS     R0,#+0
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//   89   HD44780_delay_ms(10);          
        MOVS     R0,#+10
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   90 }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_FIO1DIR
        REQUIRE _A_FIO0DIR
//   91 /***********************************************************************************
//   92 *    Descrição   :   Envia um nibble para o controlador do LCD
//   93 *    Parametros  :   (unsigned char) valor que será escrito no display
//   94 *    Retorno     :   nenhum
//   95 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function HD44780_enviaNibble
          CFI NoCalls
        THUMB
//   96 void HD44780_enviaNibble(unsigned char value){
//   97  
//   98   SET_LCD_ENABLE; 
HD44780_enviaNibble:
        LDR.N    R1,??DataTable9_3  ;; 0x2009c038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x20000
        LDR.N    R2,??DataTable9_3  ;; 0x2009c038
        STR      R1,[R2, #+0]
//   99   __no_operation();
        Nop      
//  100   __no_operation();
        Nop      
//  101   __no_operation();
        Nop      
//  102   __no_operation();
        Nop      
//  103   __no_operation();
        Nop      
//  104   __no_operation();  
        Nop      
//  105   LCD_WRITE_NIBBLE(value);      
        LSLS     R1,R0,#+31
        BPL.N    ??HD44780_enviaNibble_0
        LDR.N    R1,??DataTable9_3  ;; 0x2009c038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10
        LDR.N    R2,??DataTable9_3  ;; 0x2009c038
        STR      R1,[R2, #+0]
        B.N      ??HD44780_enviaNibble_1
??HD44780_enviaNibble_0:
        LDR.N    R1,??DataTable9_4  ;; 0x2009c03c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10
        LDR.N    R2,??DataTable9_4  ;; 0x2009c03c
        STR      R1,[R2, #+0]
??HD44780_enviaNibble_1:
        LSLS     R1,R0,#+30
        BPL.N    ??HD44780_enviaNibble_2
        LDR.N    R1,??DataTable9_3  ;; 0x2009c038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2
        LDR.N    R2,??DataTable9_3  ;; 0x2009c038
        STR      R1,[R2, #+0]
        B.N      ??HD44780_enviaNibble_3
??HD44780_enviaNibble_2:
        LDR.N    R1,??DataTable9_4  ;; 0x2009c03c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x2
        LDR.N    R2,??DataTable9_4  ;; 0x2009c03c
        STR      R1,[R2, #+0]
??HD44780_enviaNibble_3:
        LSLS     R1,R0,#+29
        BPL.N    ??HD44780_enviaNibble_4
        LDR.N    R1,??DataTable9_5  ;; 0x2009c018
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x20
        LDR.N    R2,??DataTable9_5  ;; 0x2009c018
        STR      R1,[R2, #+0]
        B.N      ??HD44780_enviaNibble_5
??HD44780_enviaNibble_4:
        LDR.N    R1,??DataTable9_6  ;; 0x2009c01c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x20
        LDR.N    R2,??DataTable9_6  ;; 0x2009c01c
        STR      R1,[R2, #+0]
??HD44780_enviaNibble_5:
        LSLS     R0,R0,#+28
        BPL.N    ??HD44780_enviaNibble_6
        LDR.N    R0,??DataTable9_5  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable9_5  ;; 0x2009c018
        STR      R0,[R1, #+0]
        B.N      ??HD44780_enviaNibble_7
??HD44780_enviaNibble_6:
        LDR.N    R0,??DataTable9_6  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable9_6  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  106   __no_operation();
??HD44780_enviaNibble_7:
        Nop      
//  107   __no_operation();
        Nop      
//  108   __no_operation();
        Nop      
//  109   __no_operation();
        Nop      
//  110   __no_operation();
        Nop      
//  111   __no_operation();  
        Nop      
//  112                          
//  113   CLR_LCD_ENABLE;   
        LDR.N    R0,??DataTable9_4  ;; 0x2009c03c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable9_4  ;; 0x2009c03c
        STR      R0,[R1, #+0]
//  114 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_FIO1SET
        REQUIRE _A_FIO1CLR
        REQUIRE _A_FIO0SET
        REQUIRE _A_FIO0CLR
//  115 /***********************************************************************************
//  116 *    Descrição    :   Envia um byte para o controlador do LCD
//  117 *    Parametros   :   (unsigned char) endereço
//  118 *                     (unsigned char) valor que será escrito no controlador
//  119 *    Retorno      :   nenhum
//  120 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function HD44780_enviaByte
        THUMB
//  121 void HD44780_enviaByte(unsigned char endereco,unsigned char value){
HD44780_enviaByte:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R1
//  122 
//  123   (endereco)?(SET_LCD_RS):(CLR_LCD_RS);                              
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??HD44780_enviaByte_0
        LDR.N    R0,??DataTable9_5  ;; 0x2009c018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable9_5  ;; 0x2009c018
        STR      R0,[R1, #+0]
        B.N      ??HD44780_enviaByte_1
??HD44780_enviaByte_0:
        LDR.N    R0,??DataTable9_6  ;; 0x2009c01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable9_6  ;; 0x2009c01c
        STR      R0,[R1, #+0]
//  124   HD44780_enviaNibble(value>>4);
??HD44780_enviaByte_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSRS     R0,R4,#+4
          CFI FunCall HD44780_enviaNibble
        BL       HD44780_enviaNibble
//  125   HD44780_enviaNibble(value);  
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_enviaNibble
        BL       HD44780_enviaNibble
//  126   
//  127   HD44780_delay_ms(2);  
        MOVS     R0,#+2
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  128 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
        REQUIRE _A_FIO0SET
        REQUIRE _A_FIO0CLR
//  129 /***********************************************************************************
//  130 *    Descrição    :   Delay utilizado dentro do módulo
//  131 *    Parametros   :   (unsigned int) número de iterações
//  132 *    Retorno      :   nenh8um
//  133 ***********************************************************************************/
//  134 /*
//  135 void HD44780_delay_ms(unsigned int delayCyCles){
//  136   unsigned int i,count;
//  137   
//  138   for(i=0;i<delayCyCles;i++)
//  139     for(count=DELAY_CICLES;count;count--);           
//  140 }
//  141 */
//  142 /***********************************************************************************
//  143 *     Descrição   :   Posiciona o cursor em uma determinada linha do display   
//  144 *     Parametros  :   (unsigned char) X
//  145 *                     (unsigned char) Y
//  146 *     Retorno     :   (nenhum)
//  147 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function HD44780_posicionaTexto
        THUMB
//  148 void HD44780_posicionaTexto(unsigned char x,unsigned char y){
HD44780_posicionaTexto:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  149     
//  150   if(x<16 && y==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BGE.N    ??HD44780_posicionaTexto_0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??HD44780_posicionaTexto_0
//  151      HD44780_enviaByte(0,0x80 + x);
        SUBS     R1,R0,#+128
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
        B.N      ??HD44780_posicionaTexto_1
//  152   else
//  153     if(y==1)
??HD44780_posicionaTexto_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??HD44780_posicionaTexto_1
//  154       HD44780_enviaByte(0,0xC0 + x);
        SUBS     R1,R0,#+64
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//  155     
//  156   HD44780_delay_ms(4);      
??HD44780_posicionaTexto_1:
        MOVS     R0,#+4
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  157 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  158 /***********************************************************************************
//  159 *     Descrição    :  Escreve um caracter no display
//  160 *     Parametrs    :  (char)
//  161 *     Retorno      :  nenhum
//  162 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function HD44780_writeChar
        THUMB
//  163 void HD44780_writeChar(char c){
HD44780_writeChar:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  164   
//  165   switch(c){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        CMP      R1,#+10
        BEQ.N    ??HD44780_writeChar_0
        CMP      R1,#+12
        BEQ.N    ??HD44780_writeChar_1
        CMP      R1,#+13
        BEQ.N    ??HD44780_writeChar_0
        B.N      ??HD44780_writeChar_2
//  166     case '\f':  HD44780_enviaByte(0,1);
??HD44780_writeChar_1:
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//  167                 HD44780_delay_ms(12);
        MOVS     R0,#+12
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  168                 break;    
        B.N      ??HD44780_writeChar_3
//  169     case '\n':    
//  170     case '\r':  HD44780_enviaByte(1,2);
??HD44780_writeChar_0:
        MOVS     R1,#+2
        MOVS     R0,#+1
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//  171                 break;    
        B.N      ??HD44780_writeChar_3
//  172     default  :  HD44780_enviaByte(1,c);
??HD44780_writeChar_2:
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+1
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//  173                 break;
//  174   }
//  175 }
??HD44780_writeChar_3:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  176 /***********************************************************************************
//  177 *     Descrição   :   Escreve uma string no display
//  178 *     Parametros  :   (char*) Ponteiro para a string
//  179 *     Retorno     :   nenhum
//  180 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function HD44780_writeString
        THUMB
//  181 void HD44780_writeString(char *string){
HD44780_writeString:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
        B.N      ??HD44780_writeString_0
//  182   
//  183   while(*string)
//  184     HD44780_writeChar(*string++);      
??HD44780_writeString_1:
        LDRB     R0,[R4, #+0]
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
        ADDS     R4,R4,#+1
??HD44780_writeString_0:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BNE.N    ??HD44780_writeString_1
//  185 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
//  186 /***********************************************************************************
//  187 *     Descrição   :   Liga o display
//  188 *     Parametros  :   (nenhum)
//  189 *     Retorno     :   (nenhum)
//  190 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function HD44780_ligaDisplay
        THUMB
//  191 void HD44780_ligaDisplay(void){
HD44780_ligaDisplay:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  192  
//  193   controleLcd |= 0x04;
        LDR.N    R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable9_2
        STRB     R0,[R1, #+0]
//  194   HD44780_enviaByte(0,controleLcd);  
        LDR.N    R0,??DataTable9_2
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//  195 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6
//  196 /***********************************************************************************
//  197 *     Descrição    :    Desliga o display
//  198 *     Parametros   :    (nenhum)
//  199 *     Retorno      :    (nenhum)
//  200 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function HD44780_desligaDisplay
        THUMB
//  201 void HD44780_desligaDisplay(void){
HD44780_desligaDisplay:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  202  
//  203   controleLcd &= 0xFB;
        LDR.N    R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFB
        LDR.N    R1,??DataTable9_2
        STRB     R0,[R1, #+0]
//  204   HD44780_enviaByte(0,controleLcd);
        LDR.N    R0,??DataTable9_2
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//  205 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock7
//  206 /************************************************************************************
//  207 *     Descrição     :   Liga o cursor
//  208 *     Parametros    :   nenhum
//  209 *     Retorno       :   nenhum
//  210 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function HD44780_ligaCursor
        THUMB
//  211 void HD44780_ligaCursor(void){
HD44780_ligaCursor:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  212   
//  213   controleLcd |= 0x02;
        LDR.N    R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable9_2
        STRB     R0,[R1, #+0]
//  214   HD44780_enviaByte(0,controleLcd);  
        LDR.N    R0,??DataTable9_2
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//  215 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8
//  216 /***********************************************************************************
//  217 *     Descrição     :   Desliga o cursor
//  218 *     Parametros    :   nenhum
//  219 *     Retorno       :   nenhum
//  220 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function HD44780_desligaCursor
        THUMB
//  221 void HD44780_desligaCursor(void){
HD44780_desligaCursor:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  222   
//  223   controleLcd &= 0xFD;
        LDR.N    R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFD
        LDR.N    R1,??DataTable9_2
        STRB     R0,[R1, #+0]
//  224   HD44780_enviaByte(0,controleLcd);  
        LDR.N    R0,??DataTable9_2
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//  225 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9
//  226 /***********************************************************************************
//  227 *     Descrição     :   Liga o cursor piscante
//  228 *     Parametros    :   nenhum
//  229 *     Retorno       :   nenhum
//  230 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function HD44780_ligaCursorPiscante
        THUMB
//  231 void HD44780_ligaCursorPiscante(void){
HD44780_ligaCursorPiscante:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  232  
//  233   controleLcd |= 0x01;
        LDR.N    R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_2
        STRB     R0,[R1, #+0]
//  234   HD44780_enviaByte(0,controleLcd); 
        LDR.N    R0,??DataTable9_2
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//  235 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock10
//  236 /***********************************************************************************
//  237 *     Descrição     :   Desliga o cursor piscante
//  238 *     Parametros    :   nenhum
//  239 *     Retorno       :   nenhum
//  240 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function HD44780_desligaCursorPiscante
        THUMB
//  241 void HD44780_desligaCursorPiscante(void){
HD44780_desligaCursorPiscante:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  242  
//  243    controleLcd &= 0xFE;
        LDR.N    R0,??DataTable9_2
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFE
        LDR.N    R1,??DataTable9_2
        STRB     R0,[R1, #+0]
//  244    HD44780_enviaByte(0,controleLcd);
        LDR.N    R0,??DataTable9_2
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall HD44780_enviaByte
        BL       HD44780_enviaByte
//  245 }                                   
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock11
//  246 /***********************************************************************************
//  247 *		Fim do arquivo
//  248 ***********************************************************************************/
//  249 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function teste_lcd
        THUMB
//  250 void teste_lcd(void){
teste_lcd:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  251   
//  252   HD44780_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,
//  253                LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_init
        BL       HD44780_init
//  254   
//  255   FIO1DIR |= (0X01)<<14;
        LDR.N    R0,??DataTable9  ;; 0x2009c020
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4000
        LDR.N    R1,??DataTable9  ;; 0x2009c020
        STR      R0,[R1, #+0]
//  256   FIO1SET |= (0X01)<<14;
        LDR.N    R0,??DataTable9_3  ;; 0x2009c038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4000
        LDR.N    R1,??DataTable9_3  ;; 0x2009c038
        STR      R0,[R1, #+0]
//  257 
//  258   HD44780_writeChar('\f');  
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//  259 
//  260   //                   0123456789012345
//  261   HD44780_writeString("::  Apus REP  ::");
        LDR.N    R0,??DataTable9_7
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  262   HD44780_posicionaTexto(0,1);
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  263   HD44780_writeString("     v1.0       ");
        LDR.N    R0,??DataTable9_8
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  264   
//  265 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock12
        REQUIRE _A_FIO1DIR
        REQUIRE _A_FIO1SET

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x2009c020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0x2009c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     controleLcd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     0x2009c038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     0x2009c03c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     0x2009c018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     0x2009c01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     `?<Constant "::  Apus REP  ::">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_8:
        DC32     `?<Constant "     v1.0       ">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "::  Apus REP  ::">`:
        DATA
        DC8 "::  Apus REP  ::"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "     v1.0       ">`:
        DATA
        DC8 "     v1.0       "
        DC8 0, 0, 0

        END
// 
//   1 byte  in section .bss
//  24 bytes in section .noinit (abs)
//  40 bytes in section .rodata
// 826 bytes in section .text
// 
// 826 bytes of CODE  memory
//  40 bytes of CONST memory
//   1 byte  of DATA  memory (+ 24 bytes shared)
//
//Errors: none
//Warnings: none
