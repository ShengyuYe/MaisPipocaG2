///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     13/Sep/2017  18:10:05 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\tela_se /
//                    nha.c                                                   /
//    Command line =  C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\tela_se /
//                    nha.c -lC C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\L /
//                    ist\ -lA C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Li /
//                    st\ -o C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\Obj\ /
//                     --no_cse --no_unroll --no_inline --no_code_motion      /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "C:\Program Files (x86)\IAR               /
//                    Systems\Embedded Workbench                              /
//                    6.5\arm\INC\c\DLib_Config_Normal.h" -On                 /
//    List file    =  C:\repositorios\MaisPipocaG2\SOFTWARE\Debug\List\tela_s /
//                    enha.s                                                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME tela_senha

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
        EXTERN STRING_write_to_internal
        EXTERN TECLADO_getContadorInatividade
        EXTERN TECLADO_getch
        EXTERN __aeabi_memcpy
        EXTERN rand
        EXTERN sprintf
        EXTERN srand
        EXTERN vTaskDelay

        PUBLIC MCS_contadorSemente
        PUBLIC TELASENHA_checa_contrasenha
        PUBLIC TELASENHA_get_senha
        PUBLIC TELASENHA_telaSenha
        PUBLIC memcpy
        
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
        
// C:\repositorios\MaisPipocaG2\SOFTWARE\Aplicacao\tela_senha.c
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
//   17 |       Arquivo            :  parametros.c
//   18 |       Descrição          :  Menu para configuração do sistema
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  30/12/2016
//   22 |
//   23 |       Revisões           :  1.0.0.0
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 
//   29 /************************************************************************************
//   30 *       Includes
//   31 ************************************************************************************/
//   32 #include <stdio.h>
//   33 #include <stdlib.h>
//   34 #include <string.h>

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP memcpy
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function memcpy
        THUMB
// __intrinsic __nounwind __interwork __softfp void *memcpy(void *, void const *, size_t)
memcpy:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall __aeabi_memcpy
        BL       __aeabi_memcpy
        MOVS     R0,R4
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock0
//   35 #include "..\includes.h"
//   36 
//   37 /************************************************************************************
//   38 *       Definições locais
//   39 ************************************************************************************/
//   40 
//   41 
//   42 /************************************************************************************
//   43 *       Constantes
//   44 ************************************************************************************/
//   45 
//   46 
//   47 /************************************************************************************
//   48 *       Variaveis locais
//   49 ************************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   50 unsigned int MCS_contadorSemente=0;
MCS_contadorSemente:
        DS8 4
//   51 
//   52 /************************************************************************************
//   53 *       Funções locais
//   54 ************************************************************************************/
//   55 
//   56 
//   57 /************************************************************************************
//   58 *       Implementação das funções
//   59 ************************************************************************************/
//   60 
//   61 /************************************************************************************
//   62 *       Descrição       :       Tela para o usuário informar uma senha
//   63 *       Parametros      :       (unsigned int) senha de acesso
//   64 *       Retorno         :       nenhum
//   65 ************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function TELASENHA_telaSenha
        THUMB
//   66 unsigned char TELASENHA_telaSenha(unsigned short int senha){
TELASENHA_telaSenha:
        PUSH     {R4-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+28
        SUB      SP,SP,#+20
          CFI CFA R13+48
        MOVS     R4,R0
//   67   eTECLA tecla;
//   68   unsigned char indiceDigito=0;
        MOVS     R6,#+0
//   69   char digitoSenha[5]={"0000"};
        ADD      R0,SP,#+0
        LDR.W    R1,??DataTable2
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//   70   unsigned short int temp;  
//   71   unsigned char toggle=0;
        MOVS     R8,#+0
//   72   unsigned char ciclos=1;
        MOVS     R9,#+1
//   73   char bufferLinha[5];
//   74   
//   75   HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//   76   HD44780_writeString(" Informe a senha");
        LDR.W    R0,??DataTable2_1
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//   77   
//   78   for(;TECLADO_getContadorInatividade();){
??TELASENHA_telaSenha_0:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.W    ??TELASENHA_telaSenha_1
//   79     
//   80     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R5,R0
//   81     switch(tecla){
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BEQ.N    ??TELASENHA_telaSenha_2
        BCC.N    ??TELASENHA_telaSenha_3
        CMP      R5,#+3
        BEQ.N    ??TELASENHA_telaSenha_4
        BCC.N    ??TELASENHA_telaSenha_5
        CMP      R5,#+4
        BNE.N    ??TELASENHA_telaSenha_3
//   82       case TECLA_ENTER:
//   83            indiceDigito++;
??TELASENHA_telaSenha_6:
        ADDS     R6,R6,#+1
//   84            if(indiceDigito>3){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BLT.N    ??TELASENHA_telaSenha_7
//   85              
//   86              temp = ((digitoSenha[0]-'0')*1000) + ((digitoSenha[1]-'0')*100) + ((digitoSenha[2]-'0')*10) + (digitoSenha[3]-'0');
        LDRB     R0,[SP, #+0]
        MOV      R1,#+1000
        LDRB     R2,[SP, #+1]
        MOVS     R3,#+100
        MULS     R2,R3,R2
        MLA      R0,R1,R0,R2
        LDRB     R1,[SP, #+2]
        MOVS     R2,#+10
        MLA      R0,R2,R1,R0
        LDRB     R1,[SP, #+3]
        ADDS     R0,R1,R0
        ADD      R0,R0,#+12032
        ADDS     R0,R0,#+176
        MOVS     R7,R0
//   87              if(temp==senha)
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R7,R4
        BNE.N    ??TELASENHA_telaSenha_8
//   88                return 255;
        MOVS     R0,#+255
        B.N      ??TELASENHA_telaSenha_9
//   89              else{
//   90                
//   91                HD44780_clearText();
??TELASENHA_telaSenha_8:
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//   92                HD44780_writeString("Senha");
        LDR.N    R0,??DataTable2_2
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//   93                HD44780_posicionaTexto(0,1);
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//   94                HD44780_writeString("incorreta!");
        LDR.N    R0,??DataTable2_3
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//   95                
//   96                vTaskDelay(3000);
        MOVW     R0,#+3000
          CFI FunCall vTaskDelay
        BL       vTaskDelay
//   97                
//   98                HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//   99              }             
//  100              return 0;
        MOVS     R0,#+0
        B.N      ??TELASENHA_telaSenha_9
//  101            }
//  102            break;
??TELASENHA_telaSenha_7:
        B.N      ??TELASENHA_telaSenha_3
//  103       case TECLA_ESC:
//  104            return 0;
??TELASENHA_telaSenha_2:
        MOVS     R0,#+0
        B.N      ??TELASENHA_telaSenha_9
//  105       case TECLA_INC:
//  106            digitoSenha[indiceDigito]++;
??TELASENHA_telaSenha_5:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R6, R0]
        ADDS     R0,R0,#+1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R1,SP,#+0
        STRB     R0,[R6, R1]
//  107            if(digitoSenha[indiceDigito]>'9')
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R6, R0]
        CMP      R0,#+58
        BLT.N    ??TELASENHA_telaSenha_10
//  108              digitoSenha[indiceDigito] = '0';
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+0
        MOVS     R1,#+48
        STRB     R1,[R6, R0]
//  109            break;
??TELASENHA_telaSenha_10:
        B.N      ??TELASENHA_telaSenha_3
//  110       case TECLA_DEC:
//  111            digitoSenha[indiceDigito]--;
??TELASENHA_telaSenha_4:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R6, R0]
        SUBS     R0,R0,#+1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R1,SP,#+0
        STRB     R0,[R6, R1]
//  112            if(digitoSenha[indiceDigito]<'0')
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R6, R0]
        CMP      R0,#+48
        BGE.N    ??TELASENHA_telaSenha_11
//  113              digitoSenha[indiceDigito] = '9';
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+0
        MOVS     R1,#+57
        STRB     R1,[R6, R0]
//  114            break;
//  115     }
//  116     
//  117     if(!--ciclos){
??TELASENHA_telaSenha_11:
??TELASENHA_telaSenha_3:
        SUBS     R9,R9,#+1
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??TELASENHA_telaSenha_12
//  118       
//  119       ciclos = 4;
        MOVS     R0,#+4
        MOV      R9,R0
//  120       toggle = ~toggle;
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MVNS     R8,R8
//  121       memcpy(bufferLinha,digitoSenha,4);
        MOVS     R2,#+4
        ADD      R1,SP,#+0
        ADD      R0,SP,#+8
          CFI FunCall memcpy
        BL       memcpy
//  122       bufferLinha[4] = 0x00;
        MOVS     R0,#+0
        STRB     R0,[SP, #+12]
//  123       if(toggle)
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??TELASENHA_telaSenha_13
//  124         bufferLinha[indiceDigito] = '_';
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+8
        MOVS     R1,#+95
        STRB     R1,[R6, R0]
//  125       
//  126       HD44780_posicionaTexto(6,1);
??TELASENHA_telaSenha_13:
        MOVS     R1,#+1
        MOVS     R0,#+6
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  127       HD44780_writeString(bufferLinha);
        ADD      R0,SP,#+8
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  128     }        
//  129     
//  130     vTaskDelay(50);
??TELASENHA_telaSenha_12:
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??TELASENHA_telaSenha_0
//  131   }      
//  132   
//  133   return 0;
??TELASENHA_telaSenha_1:
        MOVS     R0,#+0
??TELASENHA_telaSenha_9:
        ADD      SP,SP,#+20
          CFI CFA R13+28
        POP      {R4-R9,PC}       ;; return
          CFI EndBlock cfiBlock1
//  134 }
//  135 /************************************************************************************
//  136 *       Descrição       :       Tela para o usuário informar uma
//  137 *                               senha 
//  138 *       Parametros      :       nenhum
//  139 *       Retorno         :       (unsigned int) senha digitada
//  140 ************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function TELASENHA_get_senha
        THUMB
//  141 unsigned int TELASENHA_get_senha(char *msg){
TELASENHA_get_senha:
        PUSH     {R4-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+28
        SUB      SP,SP,#+20
          CFI CFA R13+48
        MOVS     R4,R0
//  142   eTECLA tecla;
//  143   unsigned char indiceDigito=0;
        MOVS     R6,#+0
//  144   char digitoSenha[5]={"0000"};
        ADD      R0,SP,#+0
        LDR.N    R1,??DataTable2_4
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  145   unsigned short int temp;  
//  146   unsigned char toggle=0;
        MOVS     R8,#+0
//  147   unsigned char ciclos=1;
        MOVS     R9,#+1
//  148   char bufferLinha[5];
//  149   
//  150   HD44780_clearText();
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//  151   HD44780_writeString(msg);
        MOVS     R0,R4
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  152   
//  153   for(;TECLADO_getContadorInatividade();){
??TELASENHA_get_senha_0:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.N    ??TELASENHA_get_senha_1
//  154     
//  155     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R5,R0
//  156     switch(tecla){
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BEQ.N    ??TELASENHA_get_senha_2
        BCC.N    ??TELASENHA_get_senha_3
        CMP      R5,#+3
        BEQ.N    ??TELASENHA_get_senha_4
        BCC.N    ??TELASENHA_get_senha_5
        CMP      R5,#+4
        BNE.N    ??TELASENHA_get_senha_3
//  157       case TECLA_ENTER:
//  158            indiceDigito++;
??TELASENHA_get_senha_6:
        ADDS     R6,R6,#+1
//  159            if(indiceDigito>3){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BLT.N    ??TELASENHA_get_senha_7
//  160              
//  161              temp = ((digitoSenha[0]-'0')*1000) + ((digitoSenha[1]-'0')*100) + ((digitoSenha[2]-'0')*10) + (digitoSenha[3]-'0');
        LDRB     R0,[SP, #+0]
        MOV      R1,#+1000
        LDRB     R2,[SP, #+1]
        MOVS     R3,#+100
        MULS     R2,R3,R2
        MLA      R0,R1,R0,R2
        LDRB     R1,[SP, #+2]
        MOVS     R2,#+10
        MLA      R0,R2,R1,R0
        LDRB     R1,[SP, #+3]
        ADDS     R0,R1,R0
        ADD      R0,R0,#+12032
        ADDS     R0,R0,#+176
        MOVS     R7,R0
//  162              return temp;
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,R7
        B.N      ??TELASENHA_get_senha_8
//  163            }
//  164            break;
??TELASENHA_get_senha_7:
        B.N      ??TELASENHA_get_senha_3
//  165       case TECLA_ESC:
//  166            return 0;
??TELASENHA_get_senha_2:
        MOVS     R0,#+0
        B.N      ??TELASENHA_get_senha_8
//  167       case TECLA_INC:
//  168            digitoSenha[indiceDigito]++;
??TELASENHA_get_senha_5:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R6, R0]
        ADDS     R0,R0,#+1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R1,SP,#+0
        STRB     R0,[R6, R1]
//  169            if(digitoSenha[indiceDigito]>'9')
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R6, R0]
        CMP      R0,#+58
        BLT.N    ??TELASENHA_get_senha_9
//  170              digitoSenha[indiceDigito] = '0';
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+0
        MOVS     R1,#+48
        STRB     R1,[R6, R0]
//  171            break;
??TELASENHA_get_senha_9:
        B.N      ??TELASENHA_get_senha_3
//  172       case TECLA_DEC:
//  173            digitoSenha[indiceDigito]--;
??TELASENHA_get_senha_4:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R6, R0]
        SUBS     R0,R0,#+1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R1,SP,#+0
        STRB     R0,[R6, R1]
//  174            if(digitoSenha[indiceDigito]<'0')
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R6, R0]
        CMP      R0,#+48
        BGE.N    ??TELASENHA_get_senha_10
//  175              digitoSenha[indiceDigito] = '9';
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+0
        MOVS     R1,#+57
        STRB     R1,[R6, R0]
//  176            break;
//  177     }
//  178     
//  179     if(!--ciclos){
??TELASENHA_get_senha_10:
??TELASENHA_get_senha_3:
        SUBS     R9,R9,#+1
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??TELASENHA_get_senha_11
//  180       
//  181       ciclos = 4;
        MOVS     R0,#+4
        MOV      R9,R0
//  182       toggle = ~toggle;
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MVNS     R8,R8
//  183       memcpy(bufferLinha,digitoSenha,4);
        MOVS     R2,#+4
        ADD      R1,SP,#+0
        ADD      R0,SP,#+8
          CFI FunCall memcpy
        BL       memcpy
//  184       bufferLinha[4] = 0x00;
        MOVS     R0,#+0
        STRB     R0,[SP, #+12]
//  185       if(toggle)
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??TELASENHA_get_senha_12
//  186         bufferLinha[indiceDigito] = '_';
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADD      R0,SP,#+8
        MOVS     R1,#+95
        STRB     R1,[R6, R0]
//  187       
//  188       HD44780_posicionaTexto(6,1);
??TELASENHA_get_senha_12:
        MOVS     R1,#+1
        MOVS     R0,#+6
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  189       HD44780_writeString(bufferLinha);
        ADD      R0,SP,#+8
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  190     }        
//  191     
//  192     vTaskDelay(50);
??TELASENHA_get_senha_11:
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??TELASENHA_get_senha_0
//  193   }      
//  194   
//  195   return 0xFFFF;
??TELASENHA_get_senha_1:
        MOVW     R0,#+65535
??TELASENHA_get_senha_8:
        ADD      SP,SP,#+20
          CFI CFA R13+28
        POP      {R4-R9,PC}       ;; return
          CFI EndBlock cfiBlock2
//  196 }
//  197 /************************************************************************************
//  198 *       Descrição       :       Tela de contrasenha do sistema
//  199 *       Parametros      :       nenhum
//  200 *       Retorno         :       (unsigned char) maior do que zero
//  201 *                                               se validar a contrasenha
//  202 ************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function TELASENHA_checa_contrasenha
        THUMB
//  203 unsigned char TELASENHA_checa_contrasenha(char*msg){
TELASENHA_checa_contrasenha:
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
        SUB      SP,SP,#+44
          CFI CFA R13+80
        MOVS     R5,R0
//  204  eTECLA tecla;
//  205   char bufferLinha[17];
//  206   char bufferTmp[17];
//  207   unsigned char indice=0;
        MOVS     R7,#+0
//  208   unsigned char toggle=0;
        MOVS     R8,#+0
//  209   unsigned char ciclos=1;
        MOVS     R4,#+1
//  210   unsigned short int senha;
//  211   
//  212   srand(MCS_contadorSemente);
        LDR.N    R0,??DataTable2_5
        LDR      R0,[R0, #+0]
          CFI FunCall srand
        BL       srand
//  213   unsigned short int contraSenha = rand()%10000;
          CFI FunCall rand
        BL       rand
        MOVW     R1,#+10000
        SDIV     R2,R0,R1
        MLS      R10,R1,R2,R0
//  214   
//  215   sprintf(bufferLinha,"TOKEN:%04d",contraSenha);  
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        MOV      R2,R10
        LDR.N    R1,??DataTable2_6
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  216   STRING_write_to_internal(CLEAR_DISPLAY,
//  217                            bufferLinha,
//  218                            NULL);
        MOVS     R2,#+0
        ADD      R1,SP,#+0
        MOVS     R0,#+0
          CFI FunCall STRING_write_to_internal
        BL       STRING_write_to_internal
//  219     
//  220   HD44780_posicionaTexto(0,1);
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  221   HD44780_writeString("CODE :");  
        LDR.N    R0,??DataTable2_7
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  222   
//  223   sprintf(bufferLinha,"000000");
        LDR.N    R1,??DataTable2_8
        ADD      R0,SP,#+0
          CFI FunCall sprintf
        BL       sprintf
//  224   
//  225   for(;TECLADO_getContadorInatividade();){
??TELASENHA_checa_contrasenha_0:
          CFI FunCall TECLADO_getContadorInatividade
        BL       TECLADO_getContadorInatividade
        CMP      R0,#+0
        BEQ.W    ??TELASENHA_checa_contrasenha_1
//  226     
//  227     tecla = TECLADO_getch();
          CFI FunCall TECLADO_getch
        BL       TECLADO_getch
        MOVS     R6,R0
//  228     switch(tecla){
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BEQ.N    ??TELASENHA_checa_contrasenha_2
        BCC.N    ??TELASENHA_checa_contrasenha_3
        CMP      R6,#+3
        BEQ.N    ??TELASENHA_checa_contrasenha_4
        BCC.N    ??TELASENHA_checa_contrasenha_5
        CMP      R6,#+4
        BNE.N    ??TELASENHA_checa_contrasenha_3
//  229       case TECLA_ENTER:
//  230            if(indice>4){
??TELASENHA_checa_contrasenha_6:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+5
        BLT.N    ??TELASENHA_checa_contrasenha_7
//  231              
//  232              unsigned int recebido = ((bufferLinha[0]-'0')*100000) + 
//  233                                      ((bufferLinha[1]-'0')*10000) + 
//  234                                      ((bufferLinha[2]-'0')*1000) + 
//  235                                      ((bufferLinha[3]-'0')*100) + 
//  236                                      ((bufferLinha[4]-'0')*10) + 
//  237                                      ((bufferLinha[5]-'0'));
        LDRB     R0,[SP, #+0]
        LDR.N    R1,??DataTable2_9  ;; 0x186a0
        LDRB     R2,[SP, #+1]
        MOVW     R3,#+10000
        MULS     R2,R3,R2
        MLA      R0,R1,R0,R2
        LDRB     R1,[SP, #+2]
        MOV      R2,#+1000
        MLA      R0,R2,R1,R0
        LDRB     R1,[SP, #+3]
        MOVS     R2,#+100
        MLA      R0,R2,R1,R0
        LDRB     R1,[SP, #+4]
        MOVS     R2,#+10
        MLA      R0,R2,R1,R0
        LDRB     R1,[SP, #+5]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable2_10  ;; 0xffae9eb0
        ADDS     R11,R1,R0
//  238              
//  239              recebido &= 0x3FFFF;             
        LSLS     R11,R11,#+14     ;; ZeroExtS R11,R11,#+14,#+14
        LSRS     R11,R11,#+14
//  240              
//  241              senha = ((recebido&0x3FFF)^3004);
        MOV      R0,R11
        LSLS     R0,R0,#+18       ;; ZeroExtS R0,R0,#+18,#+18
        LSRS     R0,R0,#+18
        MOVW     R1,#+3004
        EORS     R0,R1,R0
        MOV      R9,R0
//  242                HD44780_clearText();             
        MOVS     R0,#+12
          CFI FunCall HD44780_writeChar
        BL       HD44780_writeChar
//  243              if(senha==contraSenha){                     
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R9,R10
        BNE.N    ??TELASENHA_checa_contrasenha_8
//  244                return 255;               
        MOVS     R0,#+255
        B.N      ??TELASENHA_checa_contrasenha_9
//  245              }             
//  246              return 0;             
??TELASENHA_checa_contrasenha_8:
        MOVS     R0,#+0
        B.N      ??TELASENHA_checa_contrasenha_9
//  247            }
//  248            else{
//  249              indice++;
??TELASENHA_checa_contrasenha_7:
        ADDS     R7,R7,#+1
//  250              break;
        B.N      ??TELASENHA_checa_contrasenha_3
//  251            }
//  252       case TECLA_ESC:
//  253            return 0;
??TELASENHA_checa_contrasenha_2:
        MOVS     R0,#+0
        B.N      ??TELASENHA_checa_contrasenha_9
//  254       case TECLA_INC:
//  255            bufferLinha[indice]++;
??TELASENHA_checa_contrasenha_5:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R7, R0]
        ADDS     R0,R0,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADD      R1,SP,#+0
        STRB     R0,[R7, R1]
//  256            if(bufferLinha[indice]>'9')
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R7, R0]
        CMP      R0,#+58
        BLT.N    ??TELASENHA_checa_contrasenha_10
//  257              bufferLinha[indice] = '0';
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADD      R0,SP,#+0
        MOVS     R1,#+48
        STRB     R1,[R7, R0]
//  258            break;
??TELASENHA_checa_contrasenha_10:
        B.N      ??TELASENHA_checa_contrasenha_3
//  259       case TECLA_DEC:    
//  260            bufferLinha[indice]--;
??TELASENHA_checa_contrasenha_4:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R7, R0]
        SUBS     R0,R0,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADD      R1,SP,#+0
        STRB     R0,[R7, R1]
//  261            if(bufferLinha[indice]<'0')
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R7, R0]
        CMP      R0,#+48
        BGE.N    ??TELASENHA_checa_contrasenha_11
//  262              bufferLinha[indice] = '9';
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADD      R0,SP,#+0
        MOVS     R1,#+57
        STRB     R1,[R7, R0]
//  263            break;
//  264     }
//  265     
//  266     if(!--ciclos){
??TELASENHA_checa_contrasenha_11:
??TELASENHA_checa_contrasenha_3:
        SUBS     R0,R4,#+1
        MOVS     R4,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??TELASENHA_checa_contrasenha_12
//  267       ciclos = 4;
        MOVS     R0,#+4
        MOVS     R4,R0
//  268       toggle = ~toggle;
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MVNS     R8,R8
//  269       memcpy(bufferTmp,bufferLinha,17);
        MOVS     R2,#+17
        ADD      R1,SP,#+0
        ADD      R0,SP,#+20
          CFI FunCall memcpy
        BL       memcpy
//  270       bufferTmp[7] = 0x00;
        MOVS     R0,#+0
        STRB     R0,[SP, #+27]
//  271       if(toggle)
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??TELASENHA_checa_contrasenha_13
//  272         bufferTmp[indice] = '_';
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADD      R0,SP,#+20
        MOVS     R1,#+95
        STRB     R1,[R7, R0]
//  273               
//  274       HD44780_posicionaTexto(7,1);
??TELASENHA_checa_contrasenha_13:
        MOVS     R1,#+1
        MOVS     R0,#+7
          CFI FunCall HD44780_posicionaTexto
        BL       HD44780_posicionaTexto
//  275       HD44780_writeString(bufferTmp);
        ADD      R0,SP,#+20
          CFI FunCall HD44780_writeString
        BL       HD44780_writeString
//  276     }       
//  277     
//  278     vTaskDelay(50);
??TELASENHA_checa_contrasenha_12:
        MOVS     R0,#+50
          CFI FunCall vTaskDelay
        BL       vTaskDelay
        B.N      ??TELASENHA_checa_contrasenha_0
//  279   }      
//  280   
//  281   return 0;
??TELASENHA_checa_contrasenha_1:
        MOVS     R0,#+0
??TELASENHA_checa_contrasenha_9:
        ADD      SP,SP,#+44
          CFI CFA R13+36
        POP      {R4-R11,PC}      ;; return
          CFI EndBlock cfiBlock3
//  282 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     `?<Constant "0000">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     `?<Constant " Informe a senha">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     `?<Constant "Senha">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     `?<Constant "incorreta!">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     `?<Constant "0000">_1`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     MCS_contadorSemente

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     `?<Constant "TOKEN:%04d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     `?<Constant "CODE :">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     `?<Constant "000000">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x186a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0xffae9eb0

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "0000">`:
        DATA
        DC8 "0000"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant " Informe a senha">`:
        DATA
        DC8 " Informe a senha"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Senha">`:
        DATA
        DC8 "Senha"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "incorreta!">`:
        DATA
        DC8 "incorreta!"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "0000">_1`:
        DATA
        DC8 "0000"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "TOKEN:%04d">`:
        DATA
        DC8 "TOKEN:%04d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CODE :">`:
        DATA
        DC8 "CODE :"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "000000">`:
        DATA
        DC8 "000000"
        DC8 0

        END
//  283 /************************************************************************************
//  284 *       Fim do arquivo
//  285 ************************************************************************************/
// 
//     4 bytes in section .bss
//    84 bytes in section .rodata
// 1 106 bytes in section .text
// 
// 1 084 bytes of CODE  memory (+ 22 bytes shared)
//    84 bytes of CONST memory
//     4 bytes of DATA  memory
//
//Errors: none
//Warnings: none
