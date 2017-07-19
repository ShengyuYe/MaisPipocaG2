///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     17/Jul/2017  10:55:01 /
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
//    2 |	Dextro soluções tecnológicas.
//    3 |       
//    4 |       Itajaí/SC
//    5 |       www.dextro-st.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Dextro and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Dextro
//   10 |       or its distributors.
//   11 |
//   12 |       Este código é propriedade da Dextro e não pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       Dextro ou por um de seus distribuidores.
//   15 | __________________________________________________________________________________
//   16 |
//   17 |       Arquivo            :  diskio.c
//   18 |       Descrição          :  Camada de acesso à mídia
//   19 | 
//   20 |       Autor              :  Marcos Aquino
//   21 |       Data criação       :  17/07/2017
//   22 |
//   23 |       Revisões           :  1.0
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 
//   29 /***********************************************************************************
//   30 *       Includes
//   31 ***********************************************************************************/
//   32 #include "diskio.h"		/* FatFs lower layer API */
//   33 
//   34 
//   35 
//   36 /***********************************************************************************
//   37 *       Definições
//   38 ***********************************************************************************/
//   39 /* Definitions of physical drive number for each drive */
//   40 #define DEV_RAM		0	/* Example: Map Ramdisk to physical drive 0 */
//   41 #define DEV_MMC		1	/* Example: Map MMC/SD card to physical drive 1 */
//   42 #define DEV_USB		2	/* Example: Map USB MSD to physical drive 2 */
//   43 
//   44 /***********************************************************************************
//   45 *       Implementação das funções
//   46 ***********************************************************************************/
//   47 
//   48 /***********************************************************************************
//   49 *       Descrição       :       Get drive status
//   50 *       Parametros      :       nenhum
//   51 *       Retorno         :       nenhum
//   52 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function disk_status
        THUMB
//   53 DSTATUS disk_status(BYTE pdrv){
disk_status:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   54   DSTATUS stat;
//   55   int result;
//   56 
//   57   switch (pdrv) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disk_status_0
        CMP      R0,#+2
        BEQ.N    ??disk_status_1
        BCC.N    ??disk_status_2
        B.N      ??disk_status_3
//   58     case DEV_RAM :
//   59          return DF_disk_status();
??disk_status_0:
          CFI FunCall DF_disk_status
        BL       DF_disk_status
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_status_4
//   60     case DEV_MMC :
//   61 	 //result = MMC_disk_status();
//   62          // translate the reslut code here
//   63          return stat;
??disk_status_2:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_status_4
//   64     case DEV_USB :
//   65          //result = USB_disk_status();
//   66          // translate the reslut code here
//   67          return stat;
??disk_status_1:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_status_4
//   68    }
//   69   
//   70    return STA_NOINIT;
??disk_status_3:
        MOVS     R0,#+1
??disk_status_4:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock0
//   71 }
//   72 /***********************************************************************************
//   73 *       Descrição       :       Inicialização do disco
//   74 *       Parametros      :       nenhum
//   75 *       Retorno         :       nenhum
//   76 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function disk_initialize
        THUMB
//   77 DSTATUS disk_initialize(BYTE pdrv){
disk_initialize:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   78   DSTATUS stat;
//   79   int result;
//   80 
//   81   switch (pdrv) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_0
        CMP      R0,#+2
        BEQ.N    ??disk_initialize_1
        BCC.N    ??disk_initialize_2
        B.N      ??disk_initialize_3
//   82     case DEV_RAM :
//   83          //result = RAM_disk_initialize();
//   84          // translate the reslut code here
//   85          return DF_disk_initialize();
??disk_initialize_0:
          CFI FunCall DF_disk_initialize
        BL       DF_disk_initialize
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_initialize_4
//   86     case DEV_MMC :
//   87          //result = MMC_disk_initialize();
//   88          // translate the reslut code here
//   89          return stat;
??disk_initialize_2:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_initialize_4
//   90     case DEV_USB :
//   91          //result = USB_disk_initialize();
//   92          // translate the reslut code here
//   93          return stat;
??disk_initialize_1:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_initialize_4
//   94    }
//   95   
//   96    return STA_NOINIT;
??disk_initialize_3:
        MOVS     R0,#+1
??disk_initialize_4:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock1
//   97 }
//   98 /***********************************************************************************
//   99 *       Descrição       :       Lê um bloco do disco
//  100 *       Parametros      :       nenhum
//  101 *       Retorno         :       nenhum
//  102 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function disk_read
        THUMB
//  103 DRESULT disk_read(BYTE pdrv,BYTE *buff,DWORD sector,UINT count){
disk_read:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R1
        MOVS     R1,R2
        MOVS     R2,R3
//  104   DRESULT res;
//  105   int result;
//  106 
//  107   switch (pdrv) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disk_read_0
        CMP      R0,#+2
        BEQ.N    ??disk_read_1
        BCC.N    ??disk_read_2
        B.N      ??disk_read_3
//  108     case DEV_RAM :
//  109                   // translate the arguments here
//  110 		  result = DF_disk_read(buff, sector, count);
??disk_read_0:
        MOVS     R0,R4
          CFI FunCall DF_disk_read
        BL       DF_disk_read
        MOVS     R1,R0
//  111 		  // translate the reslut code here
//  112 		  return res; 
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_read_4
//  113     case DEV_MMC :
//  114 	  	  // translate the arguments here
//  115 		  //result = MMC_disk_read(buff, sector, count);
//  116 		  // translate the reslut code here
//  117 		  return res; 
??disk_read_2:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_read_4
//  118     case DEV_USB :
//  119 	  	  // translate the arguments here
//  120 	          //result = USB_disk_read(buff, sector, count);
//  121 		  // translate the reslut code here
//  122 		  return res;
??disk_read_1:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_read_4
//  123   }
//  124 
//  125   return RES_PARERR;
??disk_read_3:
        MOVS     R0,#+4
??disk_read_4:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock2
//  126 }
//  127 /***********************************************************************************
//  128 *       Descrição       :       Escreve um bloco no disco
//  129 *       Parametros      :       nenhum
//  130 *       Retorno         :       nenhum
//  131 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function disk_write
        THUMB
//  132 DRESULT disk_write(BYTE pdrv,const BYTE *buff,DWORD sector,UINT count){
disk_write:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R1
        MOVS     R1,R2
        MOVS     R2,R3
//  133   DRESULT res;
//  134   int result;
//  135   
//  136   switch (pdrv) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disk_write_0
        CMP      R0,#+2
        BEQ.N    ??disk_write_1
        BCC.N    ??disk_write_2
        B.N      ??disk_write_3
//  137     case DEV_RAM :
//  138 		// translate the arguments here
//  139 		result = DF_disk_write(buff, sector, count);
??disk_write_0:
        MOVS     R0,R4
          CFI FunCall DF_disk_write
        BL       DF_disk_write
        MOVS     R1,R0
//  140 		// translate the reslut code here
//  141 		return res;
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_write_4
//  142     case DEV_MMC :
//  143 		// translate the arguments here
//  144 		//result = MMC_disk_write(buff, sector, count);
//  145 		// translate the reslut code here
//  146 		return res;
??disk_write_2:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_write_4
//  147     case DEV_USB :
//  148 		// translate the arguments here
//  149 		//result = USB_disk_write(buff, sector, count);
//  150 		// translate the reslut code here
//  151 		return res;
??disk_write_1:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_write_4
//  152   }
//  153 
//  154   return RES_PARERR;
??disk_write_3:
        MOVS     R0,#+4
??disk_write_4:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock3
//  155 }
//  156 /***********************************************************************************
//  157 *       Descrição       :       Verifica o status do disco
//  158 *       Parametros      :       nenhum
//  159 *       Retorno         :       nenhum
//  160 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function disk_ioctl
        THUMB
//  161 DRESULT disk_ioctl(BYTE pdrv,BYTE cmd,void *buff){
disk_ioctl:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R3,R0
        MOVS     R4,R1
        MOVS     R1,R2
//  162   DRESULT res;
//  163   int result;
//  164 
//  165   switch (pdrv) {
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.N    ??disk_ioctl_0
        CMP      R3,#+2
        BEQ.N    ??disk_ioctl_1
        BCC.N    ??disk_ioctl_2
        B.N      ??disk_ioctl_3
//  166     case DEV_RAM :
//  167 		// Process of the command for the RAM drive
//  168                 res = DF_disk_ioctl(cmd,buff);
??disk_ioctl_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
          CFI FunCall DF_disk_ioctl
        BL       DF_disk_ioctl
//  169 		return res;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_ioctl_4
//  170     case DEV_MMC :
//  171 		// Process of the command for the MMC/SD card
//  172 		return res; 
??disk_ioctl_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_ioctl_4
//  173     case DEV_USB :
//  174 		// Process of the command the USB drive
//  175 		return res;
??disk_ioctl_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??disk_ioctl_4
//  176   }
//  177 
//  178   return RES_PARERR;
??disk_ioctl_3:
        MOVS     R0,#+4
??disk_ioctl_4:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4
//  179 }
//  180 /***********************************************************************************
//  181 *   Descrição   :   Função para leitura do relógio
//  182 *   Parametros  :   nenhum
//  183 *   Retorno     :   nenhum
//  184 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function get_fattime
        THUMB
//  185 DWORD get_fattime(void){
get_fattime:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+24
          CFI CFA R13+32
//  186   unsigned char hora,minuto,segundo,dia,mes;
//  187   unsigned int ano;  
//  188   DWORD relogio=0;
        MOVS     R4,#+0
//  189   
//  190   RTC_getValue(&hora,&minuto,&segundo,&dia,&mes,&ano);
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
//  191   
//  192   if(ano>2000)
        LDR      R0,[SP, #+16]
        CMP      R0,#+2000
        BLS.N    ??get_fattime_0
//  193     ano-=2000;
        LDR      R0,[SP, #+16]
        SUBS     R0,R0,#+2000
        STR      R0,[SP, #+16]
        B.N      ??get_fattime_1
//  194   else
//  195     ano = 32;
??get_fattime_0:
        MOVS     R0,#+32
        STR      R0,[SP, #+16]
//  196   ano&= 0x7F;
??get_fattime_1:
        LDR      R0,[SP, #+16]
        ANDS     R0,R0,#0x7F
        STR      R0,[SP, #+16]
//  197   relogio = ano;
        LDR      R4,[SP, #+16]
//  198 
//  199   if(mes>12)
        LDRB     R0,[SP, #+8]
        CMP      R0,#+13
        BLT.N    ??get_fattime_2
//  200     mes = 12;
        MOVS     R0,#+12
        STRB     R0,[SP, #+8]
//  201   mes &= 0x0F;
??get_fattime_2:
        LDRB     R0,[SP, #+8]
        ANDS     R0,R0,#0xF
        STRB     R0,[SP, #+8]
//  202   relogio<<=4;
        LSLS     R4,R4,#+4
//  203   relogio|= mes;
        LDRB     R0,[SP, #+8]
        ORRS     R4,R0,R4
//  204   
//  205   if(dia>31)
        LDRB     R0,[SP, #+10]
        CMP      R0,#+32
        BLT.N    ??get_fattime_3
//  206     dia =31;
        MOVS     R0,#+31
        STRB     R0,[SP, #+10]
//  207   relogio<<=5;
??get_fattime_3:
        LSLS     R4,R4,#+5
//  208   relogio|=dia;
        LDRB     R0,[SP, #+10]
        ORRS     R4,R0,R4
//  209   
//  210   if(hora>23)
        LDRB     R0,[SP, #+12]
        CMP      R0,#+24
        BLT.N    ??get_fattime_4
//  211     hora=23;
        MOVS     R0,#+23
        STRB     R0,[SP, #+12]
//  212   relogio<<=5;
??get_fattime_4:
        LSLS     R4,R4,#+5
//  213   relogio |= hora;
        LDRB     R0,[SP, #+12]
        ORRS     R4,R0,R4
//  214   
//  215   if(minuto>59)
        LDRB     R0,[SP, #+11]
        CMP      R0,#+60
        BLT.N    ??get_fattime_5
//  216     minuto = 59;
        MOVS     R0,#+59
        STRB     R0,[SP, #+11]
//  217   relogio<<=5;
??get_fattime_5:
        LSLS     R4,R4,#+5
//  218   relogio|=minuto;
        LDRB     R0,[SP, #+11]
        ORRS     R4,R0,R4
//  219   
//  220   if(segundo>59)
        LDRB     R0,[SP, #+9]
        CMP      R0,#+60
        BLT.N    ??get_fattime_6
//  221     segundo=59;
        MOVS     R0,#+59
        STRB     R0,[SP, #+9]
//  222   segundo>>=1;
??get_fattime_6:
        LDRB     R0,[SP, #+9]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+1
        STRB     R0,[SP, #+9]
//  223   relogio<<=4;
        LSLS     R4,R4,#+4
//  224   relogio|= segundo;
        LDRB     R0,[SP, #+9]
        ORRS     R4,R0,R4
//  225   
//  226   return relogio; 
        MOVS     R0,R4
        ADD      SP,SP,#+24
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
//  227 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  228 /***********************************************************************************
//  229 *       Fim do arquivo
//  230 ***********************************************************************************/
//  231 
// 
// 434 bytes in section .text
// 
// 434 bytes of CODE memory
//
//Errors: none
//Warnings: 16
