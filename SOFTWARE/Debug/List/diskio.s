///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     12/Jul/2017  11:51:17 /
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

        EXTERN DF_disk_initialize
        EXTERN DF_disk_ioctl
        EXTERN DF_disk_read
        EXTERN DF_disk_status
        EXTERN DF_disk_write
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
//   35 #include "dataflash_diskio.h"
//   36 #include "..\rtc\rtc.h"
//   37 /***********************************************************************************
//   38 *		Definições com constantes utilizadas no programa
//   39 ***********************************************************************************/ 
//   40 
//   41 
//   42 
//   43 /***********************************************************************************
//   44 *		Enumerações
//   45 ***********************************************************************************/
//   46 
//   47 
//   48 /***********************************************************************************
//   49 *		Estruturas
//   50 ***********************************************************************************/
//   51 
//   52 
//   53 /***********************************************************************************
//   54 *		Uniões
//   55 ***********************************************************************************/
//   56 
//   57 
//   58 /***********************************************************************************
//   59 *		Constantes
//   60 ***********************************************************************************/
//   61 
//   62 
//   63 /***********************************************************************************
//   64 *		Variaveis locais
//   65 ***********************************************************************************/
//   66 
//   67 
//   68 /***********************************************************************************
//   69 *		Funções locais
//   70 ***********************************************************************************/
//   71  
//   72 /***********************************************************************************
//   73 *		Implementação
//   74 ***********************************************************************************/
//   75 
//   76 /***********************************************************************************
//   77 *   Descrição   :   Inicialização dos drives do sistema
//   78 *   Parametros  :   (unsigned char) número do drive
//   79 *   Retorno     :   (DSTATUS) 
//   80 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function disk_initialize
        THUMB
//   81 DSTATUS disk_initialize(unsigned char drv){
disk_initialize:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   82   
//   83   switch(drv){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_0
        CMP      R0,#+1
        BEQ.N    ??disk_initialize_1
        B.N      ??disk_initialize_2
//   84    case DRIVE_SD        : return (DSTATUS)SD_disk_initialize();               
??disk_initialize_0:
          CFI FunCall SD_disk_initialize
        BL       SD_disk_initialize
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_initialize_3
//   85    case DRIVE_DATAFLASH : return (DSTATUS)DF_disk_initialize();
??disk_initialize_1:
          CFI FunCall DF_disk_initialize
        BL       DF_disk_initialize
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_initialize_3
//   86   }
//   87   
//   88   return STA_NOINIT;  
??disk_initialize_2:
        MOVS     R0,#+1
??disk_initialize_3:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock0
//   89 }
//   90 /***********************************************************************************
//   91 *     Descrição   :   Lê o status do disco passado no parametro
//   92 *     Parametros  :   (unsigned char) número do drive
//   93 *     Retorno     :   nenhum
//   94 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function disk_status
        THUMB
//   95 DSTATUS disk_status (unsigned char drv){
disk_status:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   96 
//   97   switch(drv){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disk_status_0
        CMP      R0,#+1
        BEQ.N    ??disk_status_1
        B.N      ??disk_status_2
//   98    case DRIVE_SD        : return (DSTATUS)SD_disk_status();               
??disk_status_0:
          CFI FunCall SD_disk_status
        BL       SD_disk_status
        B.N      ??disk_status_3
//   99    case DRIVE_DATAFLASH : return (DSTATUS)DF_disk_status();
??disk_status_1:
          CFI FunCall DF_disk_status
        BL       DF_disk_status
        B.N      ??disk_status_3
//  100   }  
//  101   
//  102   return STA_NOINIT;  
??disk_status_2:
        MOVS     R0,#+1
??disk_status_3:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock1
//  103 }
//  104 /***********************************************************************************
//  105 *     Descrição   :   Lê um setor de uma das unidades de disco
//  106 *     Parametros  :   (unsigned char) drive
//  107 *                     (unsigned char*) buffer
//  108 *                     (unsigned long int) setor
//  109 *                     (unsigned char) tamanho do bloco lido
//  110 *     Retorno     :   (DRESULT)
//  111 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function disk_read
        THUMB
//  112 DRESULT disk_read (unsigned char drv,unsigned char *buffer,
//  113                    DWORD sector,unsigned char count){/* Physical drive number (0) */
disk_read:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R1
        MOVS     R1,R2
        MOVS     R2,R3
//  114 
//  115   switch(drv){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disk_read_0
        CMP      R0,#+1
        BEQ.N    ??disk_read_1
        B.N      ??disk_read_2
//  116    case DRIVE_SD        : return (DRESULT)SD_disk_read(buffer,sector,count);
??disk_read_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R0,R4
          CFI FunCall SD_disk_read
        BL       SD_disk_read
        B.N      ??disk_read_3
//  117    case DRIVE_DATAFLASH : return (DRESULT)DF_disk_read(buffer,sector,count);
??disk_read_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R0,R4
          CFI FunCall DF_disk_read
        BL       DF_disk_read
        B.N      ??disk_read_3
//  118   }                     
//  119   
//  120   return RES_NOTRDY;  
??disk_read_2:
        MOVS     R0,#+3
??disk_read_3:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
//  121 }
//  122 /***********************************************************************************
//  123 *     Descrição   :   Escreve em um setor de um determinado disco
//  124 *     Parametros  :   (unsigned char) drive
//  125 *                     (unsigned char*) buffer
//  126 *                     (unsigned int) número do setor
//  127 *                     (unsigned char) tamanho do bloco escrito
//  128 *     Retorno     :   (DRESULT)
//  129 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function disk_write
        THUMB
//  130 DRESULT disk_write(unsigned char drv,const unsigned char *buff,
//  131                    DWORD sector,unsigned char byte){
disk_write:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R1
        MOVS     R1,R2
        MOVS     R2,R3
//  132 
//  133   switch(drv){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disk_write_0
        CMP      R0,#+1
        BEQ.N    ??disk_write_1
        B.N      ??disk_write_2
//  134    case DRIVE_SD        : return (DRESULT)SD_disk_write((unsigned char*)buff,sector,byte);              
??disk_write_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R0,R4
          CFI FunCall SD_disk_write
        BL       SD_disk_write
        B.N      ??disk_write_3
//  135    case DRIVE_DATAFLASH : return (DRESULT)DF_disk_write((unsigned char*)buff,sector,byte);              
??disk_write_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R0,R4
          CFI FunCall DF_disk_write
        BL       DF_disk_write
        B.N      ??disk_write_3
//  136   }                     
//  137   
//  138   return RES_NOTRDY;
??disk_write_2:
        MOVS     R0,#+3
??disk_write_3:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3
//  139 }
//  140 /***********************************************************************************
//  141 *   Descrição   :   Controle de funções específicas do disco
//  142 *   Parametros  :   (unsigned char) drive
//  143 *                   (unsigned char) comando
//  144 *                   (void*) ponteiro para a estrutura de controle do 
//  145 *                   comando que será executado
//  146 *   Retorno     :   nenhum
//  147 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function disk_ioctl
        THUMB
//  148 DRESULT disk_ioctl(unsigned char drv,unsigned char ctrl,void *buff){
disk_ioctl:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
        MOVS     R3,R1
        MOVS     R1,R2
//  149 
//  150   switch(drv){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disk_ioctl_0
        CMP      R0,#+1
        BEQ.N    ??disk_ioctl_1
        B.N      ??disk_ioctl_2
//  151    case DRIVE_SD        : return (DRESULT)SD_disk_ioctl(ctrl,buff);               
??disk_ioctl_0:
        MOVS     R0,R3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SD_disk_ioctl
        BL       SD_disk_ioctl
        B.N      ??disk_ioctl_3
//  152    case DRIVE_DATAFLASH : return (DRESULT)DF_disk_ioctl(ctrl,buff);  
??disk_ioctl_1:
        MOVS     R0,R3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall DF_disk_ioctl
        BL       DF_disk_ioctl
        B.N      ??disk_ioctl_3
//  153   }  
//  154   
//  155   return RES_NOTRDY;
??disk_ioctl_2:
        MOVS     R0,#+3
??disk_ioctl_3:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock4
//  156 }
//  157 /***********************************************************************************
//  158 *   Descrição   :   Função para leitura do relógio
//  159 *   Parametros  :   nenhum
//  160 *   Retorno     :   nenhum
//  161 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function get_fattime
        THUMB
//  162 DWORD get_fattime(void){
get_fattime:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
//  163   unsigned char hora,minuto,segundo,dia,mes;
//  164   unsigned int ano;  
//  165   DWORD relogio=0;
        MOVS     R4,#+0
//  166   
//  167   RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
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
//  168   
//  169   if(ano>2000)
        LDR      R0,[SP, #+16]
        CMP      R0,#+2000
        BLS.N    ??get_fattime_0
//  170     ano-=2000;
        LDR      R0,[SP, #+16]
        SUBS     R0,R0,#+2000
        STR      R0,[SP, #+16]
        B.N      ??get_fattime_1
//  171   else
//  172     ano = 32;
??get_fattime_0:
        MOVS     R0,#+32
        STR      R0,[SP, #+16]
//  173   ano&= 0x7F;
??get_fattime_1:
        LDR      R0,[SP, #+16]
        ANDS     R0,R0,#0x7F
        STR      R0,[SP, #+16]
//  174   relogio = ano;
        LDR      R4,[SP, #+16]
//  175 
//  176   if(mes>12)
        LDRB     R0,[SP, #+8]
        CMP      R0,#+13
        BLT.N    ??get_fattime_2
//  177     mes = 12;
        MOVS     R0,#+12
        STRB     R0,[SP, #+8]
//  178   mes &= 0x0F;
??get_fattime_2:
        LDRB     R0,[SP, #+8]
        ANDS     R0,R0,#0xF
        STRB     R0,[SP, #+8]
//  179   relogio<<=4;
        LSLS     R4,R4,#+4
//  180   relogio|= mes;
        LDRB     R0,[SP, #+8]
        ORRS     R4,R0,R4
//  181   
//  182   if(dia>31)
        LDRB     R0,[SP, #+10]
        CMP      R0,#+32
        BLT.N    ??get_fattime_3
//  183     dia =31;
        MOVS     R0,#+31
        STRB     R0,[SP, #+10]
//  184   relogio<<=5;
??get_fattime_3:
        LSLS     R4,R4,#+5
//  185   relogio|=dia;
        LDRB     R0,[SP, #+10]
        ORRS     R4,R0,R4
//  186   
//  187   if(hora>23)
        LDRB     R0,[SP, #+12]
        CMP      R0,#+24
        BLT.N    ??get_fattime_4
//  188     hora=23;
        MOVS     R0,#+23
        STRB     R0,[SP, #+12]
//  189   relogio<<=5;
??get_fattime_4:
        LSLS     R4,R4,#+5
//  190   relogio |= hora;
        LDRB     R0,[SP, #+12]
        ORRS     R4,R0,R4
//  191   
//  192   if(minuto>59)
        LDRB     R0,[SP, #+11]
        CMP      R0,#+60
        BLT.N    ??get_fattime_5
//  193     minuto = 59;
        MOVS     R0,#+59
        STRB     R0,[SP, #+11]
//  194   relogio<<=5;
??get_fattime_5:
        LSLS     R4,R4,#+5
//  195   relogio|=minuto;
        LDRB     R0,[SP, #+11]
        ORRS     R4,R0,R4
//  196   
//  197   if(segundo>59)
        LDRB     R0,[SP, #+9]
        CMP      R0,#+60
        BLT.N    ??get_fattime_6
//  198     segundo=59;
        MOVS     R0,#+59
        STRB     R0,[SP, #+9]
//  199   segundo>>=1;
??get_fattime_6:
        LDRB     R0,[SP, #+9]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+1
        STRB     R0,[SP, #+9]
//  200   relogio<<=4;
        LSLS     R4,R4,#+4
//  201   relogio|= segundo;
        LDRB     R0,[SP, #+9]
        ORRS     R4,R0,R4
//  202   
//  203   return relogio; 
        MOVS     R0,R4
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
//  204 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  205 /***********************************************************************************
//  206 *		Fim do arquivo
//  207 ***********************************************************************************/
// 
// 398 bytes in section .text
// 
// 398 bytes of CODE memory
//
//Errors: none
//Warnings: none
