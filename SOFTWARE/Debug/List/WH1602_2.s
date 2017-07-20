///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     20/Jul/2017  13:21:47 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\WH1602_2\WH1602_2.C             /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\WH1602_2\WH1602_2.C -lC         /
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
//                    pocaG2\SOFTWARE\Debug\List\WH1602_2.s                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME WH1602_2

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN vTaskDelay

        PUBLIC HD44780_2_desligaCursor
        PUBLIC HD44780_2_desligaCursorPiscante
        PUBLIC HD44780_2_desligaDisplay
        PUBLIC HD44780_2_enviaByte
        PUBLIC HD44780_2_enviaNibble
        PUBLIC HD44780_2_init
        PUBLIC HD44780_2_ligaCursor
        PUBLIC HD44780_2_ligaCursorPiscante
        PUBLIC HD44780_2_ligaDisplay
        PUBLIC HD44780_2_posicionaTexto
        PUBLIC HD44780_2_tempoRefreshSegundoLCD
        PUBLIC HD44780_2_writeChar
        PUBLIC HD44780_2_writeString
        PUBLIC LCD2_controleLcd
        PUBLIC _A_FIO2CLR
        PUBLIC _A_FIO2DIR
        PUBLIC _A_FIO2SET
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\WH1602_2\WH1602_2.C
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
//   15 | _________________________________________________________________________________
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
//   34 #include <intrinsics.h>
//   35 #include "WH1602_2_targetWrapper.h"

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
//   36 #include "WH1602_2.H"
//   37 /***********************************************************************************
//   38 *		Constantes
//   39 ***********************************************************************************/
//   40 #define ENDERECO_SEGUNDA_LINHA              0xC0
//   41 #define DELAY_CICLES                        1100
//   42 
//   43 #define HD44780_2_delay_ms(X)                 vTaskDelay(X)
//   44 
//   45 #define BLOCO_SUPER_NOP                       __no_operation();__no_operation();__no_operation();__no_operation();\ 
//   46                                               __no_operation();__no_operation();__no_operation();__no_operation();\ 
//   47                                               __no_operation();__no_operation();__no_operation();__no_operation();\ 
//   48                                               __no_operation();__no_operation();__no_operation();__no_operation();\ 
//   49                                               __no_operation();__no_operation();__no_operation();__no_operation();\ 
//   50                                               __no_operation();__no_operation();__no_operation();__no_operation();\ 
//   51                                               __no_operation();__no_operation();__no_operation();__no_operation();\ 
//   52                                               __no_operation();__no_operation();__no_operation();__no_operation();\ 
//   53                                               __no_operation();__no_operation();__no_operation();__no_operation();\ 
//   54                                               __no_operation();__no_operation();__no_operation();__no_operation();\ 
//   55                                               __no_operation();__no_operation();__no_operation();__no_operation();\ 
//   56 
//   57 /***********************************************************************************
//   58 *		Variaveis locais
//   59 ***********************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   60 unsigned char LCD2_controleLcd=0x00;
LCD2_controleLcd:
        DS8 1
//   61 extern unsigned short int IU_tempoRefreshSegundoLCD;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   62 unsigned int HD44780_2_tempoRefreshSegundoLCD;
HD44780_2_tempoRefreshSegundoLCD:
        DS8 4
//   63 
//   64 /***********************************************************************************
//   65 *		Funções locais
//   66 ***********************************************************************************/
//   67 void HD44780_2_enviaNibble(unsigned char value);
//   68 void HD44780_2_enviaByte(unsigned char endereco,unsigned char value);
//   69 
//   70 /***********************************************************************************
//   71 *		Implementação
//   72 ***********************************************************************************/
//   73 
//   74 /***********************************************************************************
//   75 *   Descrição   :   Inicialização do módulo
//   76 *   Parametros  :   nenhum
//   77 *   Retorno     :   nenhum
//   78 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function HD44780_2_init
        THUMB
//   79 void HD44780_2_init(unsigned char modo1,unsigned char modo2){
HD44780_2_init:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//   80   unsigned char i;
//   81   
//   82   INIT_2_DIR_PINS; 
        LDR.W    R0,??DataTable9  ;; 0x2009c040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.W    R1,??DataTable9  ;; 0x2009c040
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable9  ;; 0x2009c040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable9  ;; 0x2009c040
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable9  ;; 0x2009c040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.W    R1,??DataTable9  ;; 0x2009c040
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable9  ;; 0x2009c040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.W    R1,??DataTable9  ;; 0x2009c040
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable9  ;; 0x2009c040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable9  ;; 0x2009c040
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable9  ;; 0x2009c040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable9  ;; 0x2009c040
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable9  ;; 0x2009c040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.W    R1,??DataTable9  ;; 0x2009c040
        STR      R0,[R1, #+0]
//   83   
//   84   HD44780_2_delay_ms(500);
        MOV      R0,#+500
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   85 
//   86   for(i=0;i<3;i++){
        MOVS     R6,#+0
        B.N      ??HD44780_2_init_0
//   87     HD44780_2_enviaNibble(0x03);
??HD44780_2_init_1:
        MOVS     R0,#+3
          CFI FunCall HD44780_2_enviaNibble
        BL       HD44780_2_enviaNibble
//   88     HD44780_2_delay_ms(100);  
        MOVS     R0,#+100
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   89   }
        ADDS     R6,R6,#+1
??HD44780_2_init_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+3
        BLT.N    ??HD44780_2_init_1
//   90   
//   91   HD44780_2_enviaNibble(0x02);
        MOVS     R0,#+2
          CFI FunCall HD44780_2_enviaNibble
        BL       HD44780_2_enviaNibble
//   92   HD44780_2_delay_ms(20);      
        MOVS     R0,#+20
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   93   
//   94   
//   95   HD44780_2_enviaByte(0,0x20 | modo1);
        ORRS     R1,R4,#0x20
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//   96   HD44780_2_delay_ms(20);        
        MOVS     R0,#+20
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   97   HD44780_2_enviaByte(0,0x08 | modo2);
        ORRS     R1,R5,#0x8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//   98   HD44780_2_delay_ms(20);        
        MOVS     R0,#+20
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   99   
//  100   LCD2_controleLcd = 0x08 | modo2;
        ORRS     R0,R5,#0x8
        LDR.W    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
//  101   
//  102   HD44780_2_enviaByte(0,0x10);
        MOVS     R1,#+16
        MOVS     R0,#+0
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//  103   HD44780_2_delay_ms(10);          
        MOVS     R0,#+10
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  104   HD44780_2_enviaByte(0,0x06);   
        MOVS     R1,#+6
        MOVS     R0,#+0
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//  105   HD44780_2_delay_ms(10);          
        MOVS     R0,#+10
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  106 }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock0
        REQUIRE _A_FIO2DIR
//  107 /***********************************************************************************
//  108 *    Descrição   :   Envia um nibble para o controlador do LCD
//  109 *    Parametros  :   (unsigned char) valor que será escrito no display
//  110 *    Retorno     :   nenhum
//  111 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function HD44780_2_enviaNibble
          CFI NoCalls
        THUMB
//  112 void HD44780_2_enviaNibble(unsigned char value){
//  113  
//  114   BLOCO_SUPER_NOP;
HD44780_2_enviaNibble:
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
//  115   LCD_2_WRITE_NIBBLE(value);  
        LSLS     R1,R0,#+31
        BPL.N    ??HD44780_2_enviaNibble_0
        LDR.W    R1,??DataTable9_2  ;; 0x2009c058
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x100
        LDR.W    R2,??DataTable9_2  ;; 0x2009c058
        STR      R1,[R2, #+0]
        B.N      ??HD44780_2_enviaNibble_1
??HD44780_2_enviaNibble_0:
        LDR.W    R1,??DataTable9_3  ;; 0x2009c05c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x100
        LDR.N    R2,??DataTable9_3  ;; 0x2009c05c
        STR      R1,[R2, #+0]
??HD44780_2_enviaNibble_1:
        LSLS     R1,R0,#+30
        BPL.N    ??HD44780_2_enviaNibble_2
        LDR.N    R1,??DataTable9_2  ;; 0x2009c058
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x80
        LDR.N    R2,??DataTable9_2  ;; 0x2009c058
        STR      R1,[R2, #+0]
        B.N      ??HD44780_2_enviaNibble_3
??HD44780_2_enviaNibble_2:
        LDR.N    R1,??DataTable9_3  ;; 0x2009c05c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x80
        LDR.N    R2,??DataTable9_3  ;; 0x2009c05c
        STR      R1,[R2, #+0]
??HD44780_2_enviaNibble_3:
        LSLS     R1,R0,#+29
        BPL.N    ??HD44780_2_enviaNibble_4
        LDR.N    R1,??DataTable9_2  ;; 0x2009c058
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x40
        LDR.N    R2,??DataTable9_2  ;; 0x2009c058
        STR      R1,[R2, #+0]
        B.N      ??HD44780_2_enviaNibble_5
??HD44780_2_enviaNibble_4:
        LDR.N    R1,??DataTable9_3  ;; 0x2009c05c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x40
        LDR.N    R2,??DataTable9_3  ;; 0x2009c05c
        STR      R1,[R2, #+0]
??HD44780_2_enviaNibble_5:
        LSLS     R0,R0,#+28
        BPL.N    ??HD44780_2_enviaNibble_6
        LDR.N    R0,??DataTable9_2  ;; 0x2009c058
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable9_2  ;; 0x2009c058
        STR      R0,[R1, #+0]
        B.N      ??HD44780_2_enviaNibble_7
??HD44780_2_enviaNibble_6:
        LDR.N    R0,??DataTable9_3  ;; 0x2009c05c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable9_3  ;; 0x2009c05c
        STR      R0,[R1, #+0]
//  116   BLOCO_SUPER_NOP;
??HD44780_2_enviaNibble_7:
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
//  117   SET_LCD_2_ENABLE;   
        LDR.N    R0,??DataTable9_2  ;; 0x2009c058
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable9_2  ;; 0x2009c058
        STR      R0,[R1, #+0]
//  118   BLOCO_SUPER_NOP;
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
//  119   CLR_LCD_2_ENABLE;   
        LDR.N    R0,??DataTable9_3  ;; 0x2009c05c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable9_3  ;; 0x2009c05c
        STR      R0,[R1, #+0]
//  120   BLOCO_SUPER_NOP;
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
//  121 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
        REQUIRE _A_FIO2SET
        REQUIRE _A_FIO2CLR
//  122 /***********************************************************************************
//  123 *    Descrição    :   Envia um byte para o controlador do LCD
//  124 *    Parametros   :   (unsigned char) endereço
//  125 *                     (unsigned char) valor que será escrito no controlador
//  126 *    Retorno      :   nenhum
//  127 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function HD44780_2_enviaByte
        THUMB
//  128 void HD44780_2_enviaByte(unsigned char endereco,unsigned char value){
HD44780_2_enviaByte:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R1
//  129 
//  130   (endereco)?(SET_LCD_2_RS):(CLR_LCD_2_RS);                              
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??HD44780_2_enviaByte_0
        LDR.N    R0,??DataTable9_2  ;; 0x2009c058
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable9_2  ;; 0x2009c058
        STR      R0,[R1, #+0]
        B.N      ??HD44780_2_enviaByte_1
??HD44780_2_enviaByte_0:
        LDR.N    R0,??DataTable9_3  ;; 0x2009c05c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable9_3  ;; 0x2009c05c
        STR      R0,[R1, #+0]
//  131   HD44780_2_enviaNibble(value>>4);
??HD44780_2_enviaByte_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSRS     R0,R4,#+4
          CFI FunCall HD44780_2_enviaNibble
        BL       HD44780_2_enviaNibble
//  132   BLOCO_SUPER_NOP;
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
        Nop      
//  133   HD44780_2_enviaNibble(value);  
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall HD44780_2_enviaNibble
        BL       HD44780_2_enviaNibble
//  134   
//  135   HD44780_2_delay_ms(2);  
        MOVS     R0,#+2
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  136 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
        REQUIRE _A_FIO2SET
        REQUIRE _A_FIO2CLR
//  137 /***********************************************************************************
//  138 *     Descrição   :   Posiciona o cursor em uma determinada linha do display   
//  139 *     Parametros  :   (unsigned char) X
//  140 *                     (unsigned char) Y
//  141 *     Retorno     :   (nenhum)
//  142 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function HD44780_2_posicionaTexto
        THUMB
//  143 void HD44780_2_posicionaTexto(unsigned char x,unsigned char y){
HD44780_2_posicionaTexto:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  144     
//  145   if(x<16 && y==0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BGE.N    ??HD44780_2_posicionaTexto_0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??HD44780_2_posicionaTexto_0
//  146      HD44780_2_enviaByte(0,0x80 + x);
        SUBS     R1,R0,#+128
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
        B.N      ??HD44780_2_posicionaTexto_1
//  147   else
//  148     if(y==1)
??HD44780_2_posicionaTexto_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??HD44780_2_posicionaTexto_1
//  149       HD44780_2_enviaByte(0,0xC0 + x);
        SUBS     R1,R0,#+64
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//  150     
//  151   HD44780_2_delay_ms(4);      
??HD44780_2_posicionaTexto_1:
        MOVS     R0,#+4
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  152 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//  153 /***********************************************************************************
//  154 *     Descrição    :  Escreve um caracter no display
//  155 *     Parametrs    :  (char)
//  156 *     Retorno      :  nenhum
//  157 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function HD44780_2_writeChar
        THUMB
//  158 void HD44780_2_writeChar(char c){
HD44780_2_writeChar:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  159   
//  160   switch(c){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        CMP      R1,#+10
        BEQ.N    ??HD44780_2_writeChar_0
        CMP      R1,#+12
        BEQ.N    ??HD44780_2_writeChar_1
        CMP      R1,#+13
        BEQ.N    ??HD44780_2_writeChar_0
        B.N      ??HD44780_2_writeChar_2
//  161     case '\f':  HD44780_2_enviaByte(0,1);
??HD44780_2_writeChar_1:
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//  162                 HD44780_2_delay_ms(12);
        MOVS     R0,#+12
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//  163                 break;    
        B.N      ??HD44780_2_writeChar_3
//  164     case '\n':    
//  165     case '\r':  HD44780_2_enviaByte(1,2);
??HD44780_2_writeChar_0:
        MOVS     R1,#+2
        MOVS     R0,#+1
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//  166                 break;    
        B.N      ??HD44780_2_writeChar_3
//  167     default  :  HD44780_2_enviaByte(1,c);
??HD44780_2_writeChar_2:
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+1
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//  168                 break;
//  169   }
//  170 }
??HD44780_2_writeChar_3:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  171 /***********************************************************************************
//  172 *     Descrição   :   Escreve uma string no display
//  173 *     Parametros  :   (char*) Ponteiro para a string
//  174 *     Retorno     :   nenhum
//  175 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function HD44780_2_writeString
        THUMB
//  176 void HD44780_2_writeString(char *string){
HD44780_2_writeString:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  177   
//  178   if(!HD44780_2_tempoRefreshSegundoLCD){
        LDR.N    R0,??DataTable9_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??HD44780_2_writeString_0
//  179     
//  180     HD44780_2_tempoRefreshSegundoLCD = 30000;
        LDR.N    R0,??DataTable9_4
        MOVW     R1,#+30000
        STR      R1,[R0, #+0]
//  181     HD44780_2_init(LCD_DISPLAY_8X5 | LCD_2_LINHAS,
//  182                    LCD_DISPLAY_LIGADO | LCD_CURSOR_DESLIGADO | LCD_CURSOR_FIXO);          
        MOVS     R1,#+4
        MOVS     R0,#+8
          CFI FunCall HD44780_2_init
        BL       HD44780_2_init
//  183     HD44780_2_clearText();    
        MOVS     R0,#+12
          CFI FunCall HD44780_2_writeChar
        BL       HD44780_2_writeChar
        B.N      ??HD44780_2_writeString_0
//  184   }  
//  185   
//  186   while(*string)
//  187     HD44780_2_writeChar(*string++);      
??HD44780_2_writeString_1:
        LDRB     R0,[R4, #+0]
          CFI FunCall HD44780_2_writeChar
        BL       HD44780_2_writeChar
        ADDS     R4,R4,#+1
??HD44780_2_writeString_0:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BNE.N    ??HD44780_2_writeString_1
//  188 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
//  189 /***********************************************************************************
//  190 *     Descrição   :   Liga o display
//  191 *     Parametros  :   (nenhum)
//  192 *     Retorno     :   (nenhum)
//  193 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function HD44780_2_ligaDisplay
        THUMB
//  194 void HD44780_2_ligaDisplay(void){
HD44780_2_ligaDisplay:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  195  
//  196   LCD2_controleLcd |= 0x04;
        LDR.N    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
//  197   HD44780_2_enviaByte(0,LCD2_controleLcd);  
        LDR.N    R0,??DataTable9_1
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//  198 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6
//  199 /***********************************************************************************
//  200 *     Descrição    :    Desliga o display
//  201 *     Parametros   :    (nenhum)
//  202 *     Retorno      :    (nenhum)
//  203 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function HD44780_2_desligaDisplay
        THUMB
//  204 void HD44780_2_desligaDisplay(void){
HD44780_2_desligaDisplay:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  205  
//  206   LCD2_controleLcd &= 0xFB;
        LDR.N    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFB
        LDR.N    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
//  207   HD44780_2_enviaByte(0,LCD2_controleLcd);
        LDR.N    R0,??DataTable9_1
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//  208 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock7
//  209 /************************************************************************************
//  210 *     Descrição     :   Liga o cursor
//  211 *     Parametros    :   nenhum
//  212 *     Retorno       :   nenhum
//  213 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function HD44780_2_ligaCursor
        THUMB
//  214 void HD44780_2_ligaCursor(void){
HD44780_2_ligaCursor:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  215   
//  216   LCD2_controleLcd |= 0x02;
        LDR.N    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
//  217   HD44780_2_enviaByte(0,LCD2_controleLcd);  
        LDR.N    R0,??DataTable9_1
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//  218 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8
//  219 /***********************************************************************************
//  220 *     Descrição     :   Desliga o cursor
//  221 *     Parametros    :   nenhum
//  222 *     Retorno       :   nenhum
//  223 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function HD44780_2_desligaCursor
        THUMB
//  224 void HD44780_2_desligaCursor(void){
HD44780_2_desligaCursor:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  225   
//  226   LCD2_controleLcd &= 0xFD;
        LDR.N    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFD
        LDR.N    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
//  227   HD44780_2_enviaByte(0,LCD2_controleLcd);  
        LDR.N    R0,??DataTable9_1
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//  228 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9
//  229 /***********************************************************************************
//  230 *     Descrição     :   Liga o cursor piscante
//  231 *     Parametros    :   nenhum
//  232 *     Retorno       :   nenhum
//  233 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function HD44780_2_ligaCursorPiscante
        THUMB
//  234 void HD44780_2_ligaCursorPiscante(void){
HD44780_2_ligaCursorPiscante:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  235  
//  236   LCD2_controleLcd |= 0x01;
        LDR.N    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
//  237   HD44780_2_enviaByte(0,LCD2_controleLcd); 
        LDR.N    R0,??DataTable9_1
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//  238 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock10
//  239 /***********************************************************************************
//  240 *     Descrição     :   Desliga o cursor piscante
//  241 *     Parametros    :   nenhum
//  242 *     Retorno       :   nenhum
//  243 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function HD44780_2_desligaCursorPiscante
        THUMB
//  244 void HD44780_2_desligaCursorPiscante(void){
HD44780_2_desligaCursorPiscante:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  245  
//  246    LCD2_controleLcd &= 0xFE;
        LDR.N    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFE
        LDR.N    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
//  247    HD44780_2_enviaByte(0,LCD2_controleLcd);
        LDR.N    R0,??DataTable9_1
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
          CFI FunCall HD44780_2_enviaByte
        BL       HD44780_2_enviaByte
//  248 }                                   
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x2009c040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     LCD2_controleLcd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x2009c058

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     0x2009c05c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     HD44780_2_tempoRefreshSegundoLCD

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  249 /***********************************************************************************
//  250 *		Fim do arquivo
//  251 ***********************************************************************************/
// 
//     5 bytes in section .bss
//    12 bytes in section .noinit (abs)
// 1 230 bytes in section .text
// 
// 1 230 bytes of CODE memory
//     5 bytes of DATA memory (+ 12 bytes shared)
//
//Errors: none
//Warnings: none
