///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     06/Jul/2017  16:40:32 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\FILESYSTEM\diskio.c             /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\FILESYSTEM\diskio.c -lC         /
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
//                    pocaG2\SOFTWARE\Debug\List\diskio.s                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME diskio

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN RTC_getValue
        EXTERN SD_disk_initialize
        EXTERN SD_disk_ioctl
        EXTERN SD_disk_read
        EXTERN SD_disk_status
        EXTERN SD_disk_write

        PUBLIC disk_initialize
        PUBLIC disk_ioctl
        PUBLIC disk_read
        PUBLIC disk_status
        PUBLIC disk_write
        PUBLIC get_fattime
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\FILESYSTEM\diskio.c
//    1 /*__________________________________________________________________________________
//    2 |	Chave Digital Tecnologia Eletronica Ltda. 
//    3 |       
//    4 |       Balneário Camboriú - SC
//    5 |       www.chavedigital.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Chave Digital and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Chave Digital
//   10 |       or its distributors.
//   11 |
//   12 |       Este código é propriedade da Chave Digital e não pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       Chave Digital ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :  diskio.c
//   18 |       Descrição          :  Middleware para o acesso à memória física
//   19 |                             DATAFLASH OU SDCARD
//   20 | 
//   21 |       Autor              :  Marcos Aquino
//   22 |       Data criação       :  01/08/2011
//   23 |
//   24 |       Revisões           :  1.0
//   25 |
//   26 |
//   27 | __________________________________________________________________________________
//   28 */
//   29 /***********************************************************************************
//   30 *		Includes
//   31 ***********************************************************************************/
//   32 #include <nxp\iolpc1768.h>
//   33 #include "diskio.h"
//   34 #include "sd_diskio.h"
//   35 #include "..\rtc\rtc.h"
//   36 /***********************************************************************************
//   37 *		Definições com constantes utilizadas no programa
//   38 ***********************************************************************************/ 
//   39 
//   40 
//   41 
//   42 /***********************************************************************************
//   43 *		Enumerações
//   44 ***********************************************************************************/
//   45 
//   46 
//   47 /***********************************************************************************
//   48 *		Estruturas
//   49 ***********************************************************************************/
//   50 
//   51 
//   52 /***********************************************************************************
//   53 *		Uniões
//   54 ***********************************************************************************/
//   55 
//   56 
//   57 /***********************************************************************************
//   58 *		Constantes
//   59 ***********************************************************************************/
//   60 
//   61 
//   62 /***********************************************************************************
//   63 *		Variaveis locais
//   64 ***********************************************************************************/
//   65 
//   66 
//   67 /***********************************************************************************
//   68 *		Funções locais
//   69 ***********************************************************************************/
//   70  
//   71 /***********************************************************************************
//   72 *		Implementação
//   73 ***********************************************************************************/
//   74 
//   75 /***********************************************************************************
//   76 *   Descrição   :   Inicialização dos drives do sistema
//   77 *   Parametros  :   (unsigned char) número do drive
//   78 *   Retorno     :   (DSTATUS) 
//   79 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function disk_initialize
        THUMB
//   80 DSTATUS disk_initialize(unsigned char drv){
disk_initialize:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   81   
//   82   switch(drv){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??disk_initialize_0
//   83    case DRIVE_SD        : return (DSTATUS)SD_disk_initialize();               
          CFI FunCall SD_disk_initialize
        BL       SD_disk_initialize
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_initialize_1
//   84 //   case DRIVE_DATAFLASH : return (DSTATUS)DataFlash_initialize();
//   85   }
//   86   
//   87   return STA_NOINIT;  
??disk_initialize_0:
        MOVS     R0,#+1
??disk_initialize_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock0
//   88 }
//   89 /***********************************************************************************
//   90 *     Descrição   :   Lê o status do disco passado no parametro
//   91 *     Parametros  :   (unsigned char) número do drive
//   92 *     Retorno     :   nenhum
//   93 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function disk_status
        THUMB
//   94 DSTATUS disk_status (unsigned char drv){
disk_status:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   95 
//   96   switch(drv){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??disk_status_0
//   97    case DRIVE_SD        : return (DSTATUS)SD_disk_status();               
          CFI FunCall SD_disk_status
        BL       SD_disk_status
        B.N      ??disk_status_1
//   98 //   case DRIVE_DATAFLASH : return (DSTATUS)DataFlash_status();
//   99   }  
//  100   
//  101   return STA_NOINIT;  
??disk_status_0:
        MOVS     R0,#+1
??disk_status_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock1
//  102 }
//  103 /***********************************************************************************
//  104 *     Descrição   :   Lê um setor de uma das unidades de disco
//  105 *     Parametros  :   (unsigned char) drive
//  106 *                     (unsigned char*) buffer
//  107 *                     (unsigned long int) setor
//  108 *                     (unsigned char) tamanho do bloco lido
//  109 *     Retorno     :   (DRESULT)
//  110 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function disk_read
        THUMB
//  111 DRESULT disk_read (unsigned char drv,unsigned char *buffer,
//  112                    DWORD sector,unsigned char count){/* Physical drive number (0) */
disk_read:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R1
        MOVS     R1,R2
        MOVS     R2,R3
//  113 
//  114   switch(drv){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??disk_read_0
//  115    case DRIVE_SD        : return (DRESULT)SD_disk_read(buffer,sector,count);
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R0,R4
          CFI FunCall SD_disk_read
        BL       SD_disk_read
        B.N      ??disk_read_1
//  116 //   case DRIVE_DATAFLASH : return (DRESULT)DataFlash_read(buffer,sector,count);
//  117   }                     
//  118   
//  119   return RES_NOTRDY;  
??disk_read_0:
        MOVS     R0,#+3
??disk_read_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
//  120 }
//  121 /***********************************************************************************
//  122 *     Descrição   :   Escreve em um setor de um determinado disco
//  123 *     Parametros  :   (unsigned char) drive
//  124 *                     (unsigned char*) buffer
//  125 *                     (unsigned int) número do setor
//  126 *                     (unsigned char) tamanho do bloco escrito
//  127 *     Retorno     :   (DRESULT)
//  128 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function disk_write
        THUMB
//  129 DRESULT disk_write(unsigned char drv,const unsigned char *buff,
//  130                    DWORD sector,unsigned char byte){
disk_write:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R1
        MOVS     R1,R2
        MOVS     R2,R3
//  131 
//  132   switch(drv){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??disk_write_0
//  133    case DRIVE_SD        : return (DRESULT)SD_disk_write((unsigned char*)buff,sector,byte);              
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R0,R4
          CFI FunCall SD_disk_write
        BL       SD_disk_write
        B.N      ??disk_write_1
//  134 //   case DRIVE_DATAFLASH : return (DRESULT)DataFlash_write((unsigned char*)buff,sector,byte);              
//  135   }                     
//  136   
//  137   return RES_NOTRDY;
??disk_write_0:
        MOVS     R0,#+3
??disk_write_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3
//  138 }
//  139 /***********************************************************************************
//  140 *   Descrição   :   Controle de funções específicas do disco
//  141 *   Parametros  :   (unsigned char) drive
//  142 *                   (unsigned char) comando
//  143 *                   (void*) ponteiro para a estrutura de controle do 
//  144 *                   comando que será executado
//  145 *   Retorno     :   nenhum
//  146 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function disk_ioctl
        THUMB
//  147 DRESULT disk_ioctl(unsigned char drv,unsigned char ctrl,void *buff){
disk_ioctl:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        MOVS     R3,R1
        MOVS     R1,R2
//  148 
//  149   switch(drv){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??disk_ioctl_0
//  150    case DRIVE_SD        : return (DRESULT)SD_disk_ioctl(ctrl,buff);               
        MOVS     R0,R3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SD_disk_ioctl
        BL       SD_disk_ioctl
        B.N      ??disk_ioctl_1
//  151 //   case DRIVE_DATAFLASH : return (DRESULT)DataFlash_ioctl(ctrl,buff);  
//  152   }  
//  153   
//  154   return RES_NOTRDY;
??disk_ioctl_0:
        MOVS     R0,#+3
??disk_ioctl_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
//  155 }
//  156 /***********************************************************************************
//  157 *   Descrição   :   Função para leitura do relógio
//  158 *   Parametros  :   nenhum
//  159 *   Retorno     :   nenhum
//  160 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function get_fattime
        THUMB
//  161 DWORD get_fattime(void){
get_fattime:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
//  162   unsigned char hora,minuto,segundo,dia,mes;
//  163   unsigned int ano;  
//  164   DWORD relogio=0;
        MOVS     R4,#+0
//  165   
//  166   RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
        ADD      R0,SP,#+16
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+10
        ADD      R2,SP,#+9
        ADD      R1,SP,#+11
        ADD      R0,SP,#+12
          CFI FunCall RTC_getValue
        BL       RTC_getValue
//  167   
//  168   if(ano>2000)
        LDR      R0,[SP, #+16]
        CMP      R0,#+2000
        BLS.N    ??get_fattime_0
//  169     ano-=2000;
        LDR      R0,[SP, #+16]
        SUBS     R0,R0,#+2000
        STR      R0,[SP, #+16]
        B.N      ??get_fattime_1
//  170   else
//  171     ano = 32;
??get_fattime_0:
        MOVS     R0,#+32
        STR      R0,[SP, #+16]
//  172   ano&= 0x7F;
??get_fattime_1:
        LDR      R0,[SP, #+16]
        ANDS     R0,R0,#0x7F
        STR      R0,[SP, #+16]
//  173   relogio = ano;
        LDR      R4,[SP, #+16]
//  174 
//  175   if(mes>12)
        LDRB     R0,[SP, #+8]
        CMP      R0,#+13
        BLT.N    ??get_fattime_2
//  176     mes = 12;
        MOVS     R0,#+12
        STRB     R0,[SP, #+8]
//  177   mes &= 0x0F;
??get_fattime_2:
        LDRB     R0,[SP, #+8]
        ANDS     R0,R0,#0xF
        STRB     R0,[SP, #+8]
//  178   relogio<<=4;
        LSLS     R4,R4,#+4
//  179   relogio|= mes;
        LDRB     R0,[SP, #+8]
        ORRS     R4,R0,R4
//  180   
//  181   if(dia>31)
        LDRB     R0,[SP, #+10]
        CMP      R0,#+32
        BLT.N    ??get_fattime_3
//  182     dia =31;
        MOVS     R0,#+31
        STRB     R0,[SP, #+10]
//  183   relogio<<=5;
??get_fattime_3:
        LSLS     R4,R4,#+5
//  184   relogio|=dia;
        LDRB     R0,[SP, #+10]
        ORRS     R4,R0,R4
//  185   
//  186   if(hora>23)
        LDRB     R0,[SP, #+12]
        CMP      R0,#+24
        BLT.N    ??get_fattime_4
//  187     hora=23;
        MOVS     R0,#+23
        STRB     R0,[SP, #+12]
//  188   relogio<<=5;
??get_fattime_4:
        LSLS     R4,R4,#+5
//  189   relogio |= hora;
        LDRB     R0,[SP, #+12]
        ORRS     R4,R0,R4
//  190   
//  191   if(minuto>59)
        LDRB     R0,[SP, #+11]
        CMP      R0,#+60
        BLT.N    ??get_fattime_5
//  192     minuto = 59;
        MOVS     R0,#+59
        STRB     R0,[SP, #+11]
//  193   relogio<<=5;
??get_fattime_5:
        LSLS     R4,R4,#+5
//  194   relogio|=minuto;
        LDRB     R0,[SP, #+11]
        ORRS     R4,R0,R4
//  195   
//  196   if(segundo>59)
        LDRB     R0,[SP, #+9]
        CMP      R0,#+60
        BLT.N    ??get_fattime_6
//  197     segundo=59;
        MOVS     R0,#+59
        STRB     R0,[SP, #+9]
//  198   segundo>>=1;
??get_fattime_6:
        LDRB     R0,[SP, #+9]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+1
        STRB     R0,[SP, #+9]
//  199   relogio<<=4;
        LSLS     R4,R4,#+4
//  200   relogio|= segundo;
        LDRB     R0,[SP, #+9]
        ORRS     R4,R0,R4
//  201   
//  202   return relogio; 
        MOVS     R0,R4
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
//  203 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  204 /***********************************************************************************
//  205 *		Fim do arquivo
//  206 ***********************************************************************************/
// 
// 324 bytes in section .text
// 
// 324 bytes of CODE memory
//
//Errors: none
//Warnings: none
