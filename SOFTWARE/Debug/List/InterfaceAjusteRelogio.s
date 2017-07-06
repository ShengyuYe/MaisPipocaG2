///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     06/Jul/2017  15:09:49 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\InterfaceAjusteRelogio.c      /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Aplicacao\InterfaceAjusteRelogio.c -lC  /
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
//                    pocaG2\SOFTWARE\Debug\List\InterfaceAjusteRelogio.s     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME InterfaceAjusteRelogio

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "0"
        RTMODEL "__dlib_full_locale_support", "0"
        RTMODEL "__iar_require _Printf", "flags,widths"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN HD44780_posicionaTexto
        EXTERN HD44780_writeChar
        EXTERN HD44780_writeString
        EXTERN RTC_getValue
        EXTERN RTC_setValue
        EXTERN TECLADO_getContadorInatividade
        EXTERN TECLADO_getch
        EXTERN __aeabi_memcpy
        EXTERN sprintf
        EXTERN vTaskDelay

        PUBLIC IAR_desenhaDados
        PUBLIC IAR_entry
        PUBLIC IAR_testeRTC
        PUBLIC limites
        PUBLIC memcpy
        PUBLIC tamanhos
        PUBLIC tracos
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Aplicacao\InterfaceAjusteRelogio.c
//    1 /*__________________________________________________________________________________
//    2 |	Quark Tecnologia Eletrônica Ltda.
//    3 |       
//    4 |       Itapema - SC
//    5 |       www.quarktee.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Quark and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Quark
//   10 |       or its distributors.
//   11 |
//   12 |       Este código é propriedade da Quark e não pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       Quark ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Produto            :  Tela para o usuário realizar o ajuste do rtc
//   18 |                             
//   19 |       Arquivo            :  InterfaceAjusteRelogio.c
//   20 | 
//   21 |       Autor              :  Marcos Aquino
//   22 |       Data criação       :  19/06/2014
//   23 |
//   24 |       Revisões           :  1.0 - primeira versão
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

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP memcpy
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function memcpy
        THUMB
// __intrinsic __nounwind __interwork __softfp void *memcpy(void *, void const *, size_t)
memcpy:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "__">`:
        DATA
        DC8 "__"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "____">`:
        DATA
        DC8 "____"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%02d">`:
        DATA
        DC8 "%02d"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%04d">`:
        DATA
        DC8 "%04d"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%s:%s:%s">`:
        DATA
        DC8 "%s:%s:%s"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%s/%s/%s">`:
        DATA
        DC8 "%s/%s/%s"
        DC8 0, 0, 0
//   36 #include "InterfaceAJusteRelogio.h"
//   37 #include "..\includes.h"
//   38 
//   39 /***********************************************************************************
//   40 *       Definições locais
//   41 ***********************************************************************************/
//   42 
//   43 /***********************************************************************************
//   44 *       Constantes locais
//   45 ***********************************************************************************/

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   46 const unsigned int limites[6][2]={  
limites:
        DATA
        DC32 0, 24, 0, 59, 0, 59, 1, 31, 1, 12, 2014, 2050
//   47   [0]=0,24,
//   48   [1]=0,59,
//   49   [2]=0,59,
//   50   [3]=1,31,
//   51   [4]=1,12,
//   52   [5]=2014,2050
//   53 };
//   54 
//   55 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   56 const char* tracos[]={
tracos:
        DATA
        DC32 `?<Constant "__">`, `?<Constant "__">`, `?<Constant "__">`
        DC32 `?<Constant "__">`, `?<Constant "__">`, `?<Constant "____">`
//   57   [0] = "__",
//   58   [1] = "__",
//   59   [2] = "__",
//   60   [3] = "__",
//   61   [4] = "__",
//   62   [5] = "____"
//   63 };
//   64 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   65 const char tamanhos[6]={
tamanhos:
        DATA
        DC8 3, 3, 3, 3, 3, 6, 0, 0
//   66   3,
//   67   3,
//   68   3,
//   69   3,
//   70   3,
//   71   6  
//   72 };
//   73 
//   74 /***********************************************************************************
//   75 *       Variaveis locais
//   76 ***********************************************************************************/
//   77 
//   78 
//   79 /***********************************************************************************
//   80 *       Funções locais
//   81 ***********************************************************************************/
//   82 void IAR_desenhaDados(char *linha1,char* linha2);
//   83 
//   84 /***********************************************************************************
//   85 *       Implementação das funções
//   86 ***********************************************************************************/
//   87 
//   88 /***********************************************************************************
//   89 *       Descrição       :       Ponto de entrada da interface para ajuste
//   90 *                               do relógio
//   91 *       Parametros      :       nenhum
//   92 *       Retorno         :       nenhum
//   93 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function IAR_entry
        THUMB
//   94 void IAR_entry(void){
IAR_entry:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+112
          CFI CFA R13+128
//   95   eTECLA tecla;
//   96   unsigned char hora,minuto,segundo,dia,mes;
//   97   unsigned int ano;
//   98   unsigned int valores[6];
//   99   unsigned char ponteiro=0;
        MOVS     R4,#+0
//  100   unsigned char refreshTime=1;
        MOVS     R5,#+1
//  101   unsigned char toogle=0x00;
        MOVS     R6,#+0
//  102   char strings[6][5];
//  103   char bufferLinhas[2][17];
//  104   
//  105   RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
        ADD      R0,SP,#+16
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+9
        ADD      R2,SP,#+10
        ADD      R1,SP,#+11
        ADD      R0,SP,#+12
          CFI FunCall RTC_getValue
        BL       RTC_getValue
//  106   
//  107   if(hora>23)
        LDRB     R0,[SP, #+12]
        CMP      R0,#+24
        BLT.N    ??IAR_entry_0
//  108     hora=23;
        MOVS     R0,#+23
        STRB     R0,[SP, #+12]
//  109   if(minuto>59)
??IAR_entry_0:
        LDRB     R0,[SP, #+11]
        CMP      R0,#+60
        BLT.N    ??IAR_entry_1
//  110     minuto = 59;
        MOVS     R0,#+59
        STRB     R0,[SP, #+11]
//  111   if(segundo>59)
??IAR_entry_1:
        LDRB     R0,[SP, #+10]
        CMP      R0,#+60
        BLT.N    ??IAR_entry_2
//  112     segundo = 59;
        MOVS     R0,#+59
        STRB     R0,[SP, #+10]
//  113   if(!dia)
??IAR_entry_2:
        LDRB     R0,[SP, #+9]
        CMP      R0,#+0
        BNE.N    ??IAR_entry_3
//  114     dia = 1;
        MOVS     R0,#+1
        STRB     R0,[SP, #+9]
//  115   if(dia>31)
??IAR_entry_3:
        LDRB     R0,[SP, #+9]
        CMP      R0,#+32
        BLT.N    ??IAR_entry_4
//  116     dia = 31;
        MOVS     R0,#+31
        STRB     R0,[SP, #+9]
//  117   if(!mes)
??IAR_entry_4:
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??IAR_entry_5
//  118     mes = 1;
        MOVS     R0,#+1
        STRB     R0,[SP, #+8]
//  119   if(mes>12)
??IAR_entry_5:
        LDRB     R0,[SP, #+8]
        CMP      R0,#+13
        BLT.N    ??IAR_entry_6
//  120     mes = 12;
        MOVS     R0,#+12
        STRB     R0,[SP, #+8]
//  121   if(ano<2014)
??IAR_entry_6:
        LDR      R0,[SP, #+16]
        MOVW     R1,#+2014
        CMP      R0,R1
        BCS.N    ??IAR_entry_7
//  122     ano = 2014;
        MOVW     R0,#+2014
        STR      R0,[SP, #+16]
//  123   if(ano>2050)
??IAR_entry_7:
        LDR      R0,[SP, #+16]
        MOVW     R1,#+2051
        CMP      R0,R1
        BCC.N    ??IAR_entry_8
//  124     ano = 2050;
        MOVW     R0,#+2050
        STR      R0,[SP, #+16]
//  125                
//  126   valores[0] = hora;
??IAR_entry_8:
        LDRB     R0,[SP, #+12]
        STR      R0,[SP, #+20]
//  127   valores[1] = minuto;
        LDRB     R0,[SP, #+11]
        STR      R0,[SP, #+24]
//  128   valores[2] = segundo;
        LDRB     R0,[SP, #+10]
        STR      R0,[SP, #+28]
//  129   valores[3] = dia;
        LDRB     R0,[SP, #+9]
        STR      R0,[SP, #+32]
//  130   valores[4] = mes;
        LDRB     R0,[SP, #+8]
        STR      R0,[SP, #+36]
//  131   valores[5] = ano;
        LDR      R0,[SP, #+16]
        STR      R0,[SP, #+40]
//  132   
//  133   
//  134   HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
        B.N      ??IAR_entry_9
//  135     
//  136   for(;TECLADO_getContadorInatividade();){
//  137     
//  138     tecla = TECLADO_getch();
//  139     switch(tecla){
//  140       case TECLA_INC:
//  141            (valores[ponteiro]>=limites[ponteiro][1])?(valores[ponteiro]=limites[ponteiro][0]):(valores[ponteiro]++);
??IAR_entry_10:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+20
        LDR      R0,[R0, R4, LSL #+2]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable1
        ADDS     R1,R1,R4, LSL #+3
        LDR      R1,[R1, #+4]
        CMP      R0,R1
        BCC.N    ??IAR_entry_11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable1
        LDR      R0,[R0, R4, LSL #+3]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R1,SP,#+20
        STR      R0,[R1, R4, LSL #+2]
        B.N      ??IAR_entry_12
??IAR_entry_11:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+20
        LDR      R0,[R0, R4, LSL #+2]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R1,SP,#+20
        LDR      R1,[R1, R4, LSL #+2]
        ADDS     R1,R1,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R2,SP,#+20
        STR      R1,[R2, R4, LSL #+2]
//  142            break;
//  143       case TECLA_DEC:
//  144            (valores[ponteiro]<=limites[ponteiro][0])?(valores[ponteiro]=limites[ponteiro][1]):(valores[ponteiro]--);
//  145            break;
//  146       case TECLA_ENTER:
//  147            if(ponteiro<5)
//  148              ponteiro++;
//  149            else{
//  150              hora = valores[0];
//  151              minuto = valores[1];
//  152              segundo = valores[2];
//  153              dia = valores[3];
//  154              mes = valores[4];
//  155              ano = valores[5];
//  156              RTC_setValue(hora,minuto,segundo,dia,mes,ano);
//  157              return;
//  158            }        
//  159            break;
//  160       case TECLA_ESC:
//  161            return;
//  162     }
//  163     
//  164     if(!--refreshTime){
??IAR_entry_12:
??IAR_entry_13:
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??IAR_entry_14
//  165       refreshTime = 2;
        MOVS     R5,#+2
//  166       toogle = ~toogle;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MVNS     R6,R6
//  167       
//  168       sprintf(strings[0],"%02d",valores[0]);
        LDR      R2,[SP, #+20]
        LDR.N    R1,??DataTable1_1
        ADD      R0,SP,#+44
          CFI FunCall sprintf
        BL       sprintf
//  169       sprintf(strings[1],"%02d",valores[1]);
        LDR      R2,[SP, #+24]
        LDR.N    R1,??DataTable1_1
        ADD      R0,SP,#+49
          CFI FunCall sprintf
        BL       sprintf
//  170       sprintf(strings[2],"%02d",valores[2]);
        LDR      R2,[SP, #+28]
        LDR.N    R1,??DataTable1_1
        ADD      R0,SP,#+54
          CFI FunCall sprintf
        BL       sprintf
//  171       sprintf(strings[3],"%02d",valores[3]);
        LDR      R2,[SP, #+32]
        LDR.N    R1,??DataTable1_1
        ADD      R0,SP,#+59
          CFI FunCall sprintf
        BL       sprintf
//  172       sprintf(strings[4],"%02d",valores[4]);
        LDR      R2,[SP, #+36]
        LDR.N    R1,??DataTable1_1
        ADD      R0,SP,#+64
          CFI FunCall sprintf
        BL       sprintf
//  173       sprintf(strings[5],"%04d",valores[5]);
        LDR      R2,[SP, #+40]
        LDR.N    R1,??DataTable1_2
        ADD      R0,SP,#+69
          CFI FunCall sprintf
        BL       sprintf
//  174         
//  175       if(toogle)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??IAR_entry_15
//  176         memcpy(strings[ponteiro],tracos[ponteiro],tamanhos[ponteiro]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable1_3
        LDRB     R2,[R4, R0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable1_4
        LDR      R1,[R0, R4, LSL #+2]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+5
        ADD      R3,SP,#+44
        MLA      R0,R0,R4,R3
          CFI FunCall memcpy
        BL       memcpy
//  177         
//  178       sprintf(bufferLinhas[0],"%s:%s:%s",strings[0],strings[1],strings[2]);
??IAR_entry_15:
        ADD      R0,SP,#+54
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+49
        ADD      R2,SP,#+44
        LDR.N    R1,??DataTable1_5
        ADD      R0,SP,#+76
          CFI FunCall sprintf
        BL       sprintf
//  179       sprintf(bufferLinhas[1],"%s/%s/%s",strings[3],strings[4],strings[5]);
        ADD      R0,SP,#+69
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+64
        ADD      R2,SP,#+59
        LDR.N    R1,??DataTable1_6
        ADD      R0,SP,#+93
          CFI FunCall sprintf
        BL       sprintf
//  180         
//  181       IAR_desenhaDados(bufferLinhas[0],bufferLinhas[1]);
        ADD      R1,SP,#+93
        ADD      R0,SP,#+76
          CFI FunCall IAR_desenhaDados
        BL       IAR_desenhaDados
//  182     }
//  183                
//  184     vTaskDelay(50);
??IAR_entry_14:
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??IAR_entry_9:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??IAR_entry_16
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??IAR_entry_17
        BCC.N    ??IAR_entry_13
        CMP      R0,#+3
        BEQ.N    ??IAR_entry_18
        BCC.W    ??IAR_entry_10
        CMP      R0,#+4
        BEQ.N    ??IAR_entry_19
        B.N      ??IAR_entry_13
??IAR_entry_18:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, R4, LSL #+3]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R1,SP,#+20
        LDR      R1,[R1, R4, LSL #+2]
        CMP      R0,R1
        BCC.N    ??IAR_entry_20
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable1
        ADDS     R0,R0,R4, LSL #+3
        LDR      R0,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R1,SP,#+20
        STR      R0,[R1, R4, LSL #+2]
        B.N      ??IAR_entry_21
??IAR_entry_20:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+20
        LDR      R0,[R0, R4, LSL #+2]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R1,SP,#+20
        LDR      R1,[R1, R4, LSL #+2]
        SUBS     R1,R1,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R2,SP,#+20
        STR      R1,[R2, R4, LSL #+2]
??IAR_entry_21:
        B.N      ??IAR_entry_13
??IAR_entry_19:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+5
        BGE.N    ??IAR_entry_22
        ADDS     R4,R4,#+1
        B.N      ??IAR_entry_13
??IAR_entry_22:
        LDR      R0,[SP, #+20]
        STRB     R0,[SP, #+12]
        LDR      R0,[SP, #+24]
        STRB     R0,[SP, #+11]
        LDR      R0,[SP, #+28]
        STRB     R0,[SP, #+10]
        LDR      R0,[SP, #+32]
        STRB     R0,[SP, #+9]
        LDR      R0,[SP, #+36]
        STRB     R0,[SP, #+8]
        LDR      R0,[SP, #+40]
        STR      R0,[SP, #+16]
        LDR      R0,[SP, #+16]
        STR      R0,[SP, #+4]
        LDRB     R0,[SP, #+8]
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+9]
        LDRB     R2,[SP, #+10]
        LDRB     R1,[SP, #+11]
        LDRB     R0,[SP, #+12]
          CFI FunCall RTC_setValue
        BL       RTC_setValue
        B.N      ??IAR_entry_23
??IAR_entry_17:
        B.N      ??IAR_entry_23
//  185     
//  186   }// Fim do for;; 
//  187 }
??IAR_entry_16:
??IAR_entry_23:
        ADD      SP,SP,#+112
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock1
//  188 /***********************************************************************************
//  189 *       Descrição       :       Desenha os dados no LCD
//  190 *       Parametros      :       (char*) linha 1
//  191 *                               (char*) linha 2)
//  192 *       Retorno         :       nenhum
//  193 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function IAR_desenhaDados
        THUMB
//  194 void IAR_desenhaDados(char *linha1,char* linha2){
IAR_desenhaDados:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  195   
//  196   HD44780_posicionaTexto(4,0);
        MOVS     R1,#+0
        MOVS     R0,#+4
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  197   HD44780_writeString((char*)linha1);
        MOVS     R0,R4
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  198   HD44780_posicionaTexto(3,1);
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  199   HD44780_writeString((char*)linha2);  
        MOVS     R0,R5
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  200 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock2
//  201 /***********************************************************************************
//  202 *       Descrição       :       Interface para o teste do RTC
//  203 *       Parametros      :       nenhum
//  204 *       Retorno         :       nenhum
//  205 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function IAR_testeRTC
        THUMB
//  206 void IAR_testeRTC(void){
IAR_testeRTC:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+112
          CFI CFA R13+128
//  207   eTECLA tecla;
//  208   unsigned char hora,minuto,segundo,dia,mes;
//  209   unsigned int ano;
//  210   unsigned int valores[6];
//  211   unsigned char ponteiro=0;
        MOVS     R4,#+0
//  212   unsigned char refreshTime=1;
        MOVS     R5,#+1
//  213   unsigned char toogle=0x00;
        MOVS     R6,#+0
//  214   char strings[6][5];
//  215   char bufferLinhas[2][17];
//  216   
//  217   RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
        ADD      R0,SP,#+16
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+9
        ADD      R2,SP,#+10
        ADD      R1,SP,#+11
        ADD      R0,SP,#+12
          CFI FunCall RTC_getValue
        BL       RTC_getValue
//  218   
//  219   if(hora>23)
        LDRB     R0,[SP, #+12]
        CMP      R0,#+24
        BLT.N    ??IAR_testeRTC_0
//  220     hora=23;
        MOVS     R0,#+23
        STRB     R0,[SP, #+12]
//  221   if(minuto>59)
??IAR_testeRTC_0:
        LDRB     R0,[SP, #+11]
        CMP      R0,#+60
        BLT.N    ??IAR_testeRTC_1
//  222     minuto = 59;
        MOVS     R0,#+59
        STRB     R0,[SP, #+11]
//  223   if(segundo>59)
??IAR_testeRTC_1:
        LDRB     R0,[SP, #+10]
        CMP      R0,#+60
        BLT.N    ??IAR_testeRTC_2
//  224     segundo = 59;
        MOVS     R0,#+59
        STRB     R0,[SP, #+10]
//  225   if(!dia)
??IAR_testeRTC_2:
        LDRB     R0,[SP, #+9]
        CMP      R0,#+0
        BNE.N    ??IAR_testeRTC_3
//  226     dia = 1;
        MOVS     R0,#+1
        STRB     R0,[SP, #+9]
//  227   if(dia>31)
??IAR_testeRTC_3:
        LDRB     R0,[SP, #+9]
        CMP      R0,#+32
        BLT.N    ??IAR_testeRTC_4
//  228     dia = 31;
        MOVS     R0,#+31
        STRB     R0,[SP, #+9]
//  229   if(!mes)
??IAR_testeRTC_4:
        LDRB     R0,[SP, #+8]
        CMP      R0,#+0
        BNE.N    ??IAR_testeRTC_5
//  230     mes = 1;
        MOVS     R0,#+1
        STRB     R0,[SP, #+8]
//  231   if(mes>12)
??IAR_testeRTC_5:
        LDRB     R0,[SP, #+8]
        CMP      R0,#+13
        BLT.N    ??IAR_testeRTC_6
//  232     mes = 12;
        MOVS     R0,#+12
        STRB     R0,[SP, #+8]
//  233   if(ano<2014)
??IAR_testeRTC_6:
        LDR      R0,[SP, #+16]
        MOVW     R1,#+2014
        CMP      R0,R1
        BCS.N    ??IAR_testeRTC_7
//  234     ano = 2014;
        MOVW     R0,#+2014
        STR      R0,[SP, #+16]
//  235   if(ano>2050)
??IAR_testeRTC_7:
        LDR      R0,[SP, #+16]
        MOVW     R1,#+2051
        CMP      R0,R1
        BCC.N    ??IAR_testeRTC_8
//  236     ano = 2050;
        MOVW     R0,#+2050
        STR      R0,[SP, #+16]
//  237                
//  238   valores[0] = hora;
??IAR_testeRTC_8:
        LDRB     R0,[SP, #+12]
        STR      R0,[SP, #+20]
//  239   valores[1] = minuto;
        LDRB     R0,[SP, #+11]
        STR      R0,[SP, #+24]
//  240   valores[2] = segundo;
        LDRB     R0,[SP, #+10]
        STR      R0,[SP, #+28]
//  241   valores[3] = dia;
        LDRB     R0,[SP, #+9]
        STR      R0,[SP, #+32]
//  242   valores[4] = mes;
        LDRB     R0,[SP, #+8]
        STR      R0,[SP, #+36]
//  243   valores[5] = ano;
        LDR      R0,[SP, #+16]
        STR      R0,[SP, #+40]
//  244   
//  245   
//  246   HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
        B.N      ??IAR_testeRTC_9
//  247     
//  248   for(;TECLADO_getContadorInatividade();){
//  249     
//  250     tecla = TECLADO_getch();
//  251     switch(tecla){      
//  252       case TECLA_ESC:
//  253         return;
//  254     }
//  255     
//  256     RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
??IAR_testeRTC_10:
        ADD      R0,SP,#+16
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+9
        ADD      R2,SP,#+10
        ADD      R1,SP,#+11
        ADD      R0,SP,#+12
          CFI FunCall RTC_getValue
        BL       RTC_getValue
//  257     valores[0] = hora;
        LDRB     R0,[SP, #+12]
        STR      R0,[SP, #+20]
//  258     valores[1] = minuto;
        LDRB     R0,[SP, #+11]
        STR      R0,[SP, #+24]
//  259     valores[2] = segundo;
        LDRB     R0,[SP, #+10]
        STR      R0,[SP, #+28]
//  260     valores[3] = dia;
        LDRB     R0,[SP, #+9]
        STR      R0,[SP, #+32]
//  261     valores[4] = mes;
        LDRB     R0,[SP, #+8]
        STR      R0,[SP, #+36]
//  262     valores[5] = ano;    
        LDR      R0,[SP, #+16]
        STR      R0,[SP, #+40]
//  263     
//  264     if(!--refreshTime){
        SUBS     R5,R5,#+1
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??IAR_testeRTC_11
//  265       refreshTime = 2;
        MOVS     R5,#+2
//  266       toogle = ~toogle;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MVNS     R6,R6
//  267       
//  268       sprintf(strings[0],"%02d",valores[0]);
        LDR      R2,[SP, #+20]
        LDR.N    R1,??DataTable1_1
        ADD      R0,SP,#+44
          CFI FunCall sprintf
        BL       sprintf
//  269       sprintf(strings[1],"%02d",valores[1]);
        LDR      R2,[SP, #+24]
        LDR.N    R1,??DataTable1_1
        ADD      R0,SP,#+49
          CFI FunCall sprintf
        BL       sprintf
//  270       sprintf(strings[2],"%02d",valores[2]);
        LDR      R2,[SP, #+28]
        LDR.N    R1,??DataTable1_1
        ADD      R0,SP,#+54
          CFI FunCall sprintf
        BL       sprintf
//  271       sprintf(strings[3],"%02d",valores[3]);
        LDR      R2,[SP, #+32]
        LDR.N    R1,??DataTable1_1
        ADD      R0,SP,#+59
          CFI FunCall sprintf
        BL       sprintf
//  272       sprintf(strings[4],"%02d",valores[4]);
        LDR      R2,[SP, #+36]
        LDR.N    R1,??DataTable1_1
        ADD      R0,SP,#+64
          CFI FunCall sprintf
        BL       sprintf
//  273       sprintf(strings[5],"%04d",valores[5]);
        LDR      R2,[SP, #+40]
        LDR.N    R1,??DataTable1_2
        ADD      R0,SP,#+69
          CFI FunCall sprintf
        BL       sprintf
//  274         
//  275       if(toogle)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??IAR_testeRTC_12
//  276         memcpy(strings[ponteiro],tracos[ponteiro],tamanhos[ponteiro]);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable1_3
        LDRB     R2,[R4, R0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable1_4
        LDR      R1,[R0, R4, LSL #+2]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+5
        ADD      R3,SP,#+44
        MLA      R0,R0,R4,R3
          CFI FunCall memcpy
        BL       memcpy
//  277         
//  278       sprintf(bufferLinhas[0],"%s:%s:%s",strings[0],strings[1],strings[2]);
??IAR_testeRTC_12:
        ADD      R0,SP,#+54
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+49
        ADD      R2,SP,#+44
        LDR.N    R1,??DataTable1_5
        ADD      R0,SP,#+76
          CFI FunCall sprintf
        BL       sprintf
//  279       sprintf(bufferLinhas[1],"%s/%s/%s",strings[3],strings[4],strings[5]);
        ADD      R0,SP,#+69
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+64
        ADD      R2,SP,#+59
        LDR.N    R1,??DataTable1_6
        ADD      R0,SP,#+93
          CFI FunCall sprintf
        BL       sprintf
//  280         
//  281       IAR_desenhaDados(bufferLinhas[0],bufferLinhas[1]);
        ADD      R1,SP,#+93
        ADD      R0,SP,#+76
          CFI FunCall IAR_desenhaDados
        BL       IAR_desenhaDados
//  282     }
//  283                
//  284     vTaskDelay(50);
??IAR_testeRTC_11:
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
??IAR_testeRTC_9:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??IAR_testeRTC_13
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.W    ??IAR_testeRTC_10
        B.N      ??IAR_testeRTC_14
//  285     
//  286   }// Fim do for;; 
//  287 }
??IAR_testeRTC_13:
??IAR_testeRTC_14:
        ADD      SP,SP,#+112
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     limites

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     `?<Constant "%02d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     `?<Constant "%04d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     tamanhos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     tracos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     `?<Constant "%s:%s:%s">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     `?<Constant "%s/%s/%s">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  288 /***********************************************************************************
//  289 *       Fim do arquivo
//  290 ***********************************************************************************/
// 
//    24 bytes in section .data
//   108 bytes in section .rodata
// 1 186 bytes in section .text
// 
// 1 172 bytes of CODE  memory (+ 14 bytes shared)
//   108 bytes of CONST memory
//    24 bytes of DATA  memory
//
//Errors: none
//Warnings: none
