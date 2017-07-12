///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     12/Jul/2017  11:50:11 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\SDCARD\SDCARD.C                 /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\SDCARD\SDCARD.C -lC             /
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
//                    pocaG2\SOFTWARE\Debug\List\SDCARD.s                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME SDCARD

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN SPI_CS_High
        EXTERN SPI_CS_Low
        EXTERN SPI_ConfigClockRate
        EXTERN SPI_Init
        EXTERN SPI_RecvByte
        EXTERN SPI_SendByte

        PUBLIC CardConfig
        PUBLIC CardType
        PUBLIC SD_Init
        PUBLIC SD_ReadConfiguration
        PUBLIC SD_ReadSector
        PUBLIC SD_RecvDataBlock
        PUBLIC SD_SendACommand
        PUBLIC SD_SendCommand
        PUBLIC SD_SendDataBlock
        PUBLIC SD_WaitForReady
        PUBLIC SD_WriteSector
        PUBLIC disk_timerproc
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\SDCARD\SDCARD.C
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
//   17 |       Arquivo            :
//   18 |       Descrição          :
//   19 | 
//   20 |       Autor              :
//   21 |       Data criação       :
//   22 |
//   23 |       Revisões           :
//   24 |
//   25 |
//   26 | __________________________________________________________________________________
//   27 */
//   28 
//   29 #include "spi_wrapper_sd.h"
//   30 #include "sdcard.h"
//   31 
//   32 /* Command definitions in SPI bus mode */
//   33 #define GO_IDLE_STATE           0
//   34 #define SEND_OP_COND            1
//   35 #define SWITCH_FUNC             6
//   36 #define SEND_IF_COND            8
//   37 #define SEND_CSD                9
//   38 #define SEND_CID                10
//   39 #define STOP_TRANSMISSION       12
//   40 #define SEND_STATUS             13
//   41 #define SET_BLOCKLEN            16
//   42 #define READ_SINGLE_BLOCK       17
//   43 #define READ_MULTIPLE_BLOCK     18
//   44 #define WRITE_SINGLE_BLOCK      24
//   45 #define WRITE_MULTIPLE_BLOCK    25
//   46 #define APP_CMD                 55
//   47 #define READ_OCR                58
//   48 #define CRC_ON_OFF              59
//   49 
//   50 /* Application specific commands supported by SD.
//   51 All these commands shall be preceded with APP_CMD (CMD55). */
//   52 #define SD_STATUS               13
//   53 #define SD_SEND_OP_COND         41
//   54 
//   55 /* R1 response bit flag definition */
//   56 #define R1_NO_ERROR         0x00
//   57 #define R1_IN_IDLE_STATE    0x01
//   58 #define R1_ERASE_RESET      0x02
//   59 #define R1_ILLEGAL_CMD      0x04
//   60 #define R1_COM_CRC_ERROR    0x08
//   61 #define R1_ERASE_SEQ_ERROR  0x10
//   62 #define R1_ADDRESS_ERROR    0x20
//   63 #define R1_PARA_ERROR       0x40
//   64 #define R1_MASK             0x7F
//   65 
//   66 /* The sector size is fixed to 512bytes in most applications. */
//   67 #define SECTOR_SIZE 512
//   68 
//   69 
//   70 /* Global variables */

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   71 unsigned char CardType;          /* card type */ 
CardType:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   72 CARDCONFIG CardConfig;      /* Card configuration */
CardConfig:
        DS8 48
//   73 
//   74 /* Local variables */

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   75 static volatile unsigned int Timer1, Timer2;	/* 100Hz decrement timer stopped at zero (disk_timerproc()) */
Timer1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Timer2:
        DS8 4
//   76 
//   77 /** Select the card */
//   78 #define SD_Select()  do {SPI_CS_Low();} while (0)
//   79 /** DeSelect the card */
//   80 #define SD_DeSelect() do { SPI_CS_High ();SPI_RecvByte();} while (0)
//   81 
//   82 /* Local functions */
//   83 SD_BOOL     SD_Init (void);
//   84 SD_BOOL     SD_ReadSector (unsigned int sect, unsigned char *buf, unsigned int cnt);
//   85 SD_BOOL     SD_WriteSector (unsigned int sect, const unsigned char *buf, unsigned int cnt);
//   86 SD_BOOL     SD_ReadConfiguration (void);
//   87 unsigned char     SD_SendCommand (unsigned char cmd, unsigned int arg, unsigned char *buf, unsigned int len);
//   88 unsigned char     SD_SendACommand (unsigned char cmd, unsigned int arg, unsigned char *buf, unsigned int len);
//   89 SD_BOOL     SD_RecvDataBlock (unsigned char *buf, unsigned int len);
//   90 SD_BOOL     SD_SendDataBlock (const unsigned char *buf, unsigned char tkn, unsigned int len) ;
//   91 SD_BOOL     SD_WaitForReady (void);
//   92 
//   93 /***********************************************************************************
//   94 *     Descrição     :   Função de temporização da biblioteca, deve
//   95 *                       ser executada a cada 10ms
//   96 *     Parametros    :   nenhum
//   97 *     Retorno       :   nenhum
//   98 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function disk_timerproc
          CFI NoCalls
        THUMB
//   99 void disk_timerproc (void){ 
//  100     static unsigned char counter=10;
//  101     unsigned int n;
//  102     
//  103     if(counter){
disk_timerproc:
        LDR.W    R0,??DataTable7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??disk_timerproc_0
//  104       counter--;
        LDR.W    R0,??DataTable7
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable7
        STRB     R0,[R1, #+0]
//  105       return;
        B.N      ??disk_timerproc_1
//  106     }
//  107     
//  108     counter=10;
??disk_timerproc_0:
        LDR.W    R0,??DataTable7
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  109     
//  110     n = Timer1;						/* 100Hz decrement timer stopped at 0 */
        LDR.W    R0,??DataTable7_1
        LDR      R0,[R0, #+0]
//  111     if (n) Timer1 = --n;
        CMP      R0,#+0
        BEQ.N    ??disk_timerproc_2
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable7_1
        STR      R0,[R1, #+0]
//  112     n = Timer2;
??disk_timerproc_2:
        LDR.W    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
//  113     if (n) Timer2 = --n;               
        CMP      R0,#+0
        BEQ.N    ??disk_timerproc_3
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable7_2
        STR      R0,[R1, #+0]
//  114 }
??disk_timerproc_3:
??disk_timerproc_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0

        SECTION `.data`:DATA:REORDER:NOROOT(0)
??counter:
        DATA
        DC8 10
//  115 /***********************************************************************************
//  116 *     Descrição   :     Inicialização do módulo
//  117 *     Parametros  :     nenhum
//  118 *     Retorno     :     nenhum
//  119 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SD_Init
        THUMB
//  120 SD_BOOL SD_Init (void)
//  121 {
SD_Init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  122     unsigned int i;
//  123     unsigned char  r1, buf[4];
//  124 
//  125     /* Set card type to unknown */
//  126     CardType = CARDTYPE_UNKNOWN;
        LDR.W    R0,??DataTable7_3
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  127 
//  128     /* Init SPI interface */
//  129     SPI_Init ();
          CFI FunCall SPI_Init
        BL       SPI_Init
//  130 
//  131     /* Before reset, Send at least 74 clocks at low frequency 
//  132     (between 100kHz and 400kHz) with CS high and DI (MISO) high. */
//  133     SD_DeSelect();
          CFI FunCall SPI_CS_High
        BL       SPI_CS_High
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
//  134     SPI_ConfigClockRate (SPI_CLOCKRATE_LOW);
        LDR.W    R0,??DataTable7_4  ;; 0x3d0900
          CFI FunCall SPI_ConfigClockRate
        BL       SPI_ConfigClockRate
//  135     for (i = 0; i < 10; i++)    SPI_SendByte (0xFF);
        MOVS     R4,#+0
        B.N      ??SD_Init_0
??SD_Init_1:
        MOVS     R0,#+255
          CFI FunCall SPI_SendByte
        BL       SPI_SendByte
        ADDS     R4,R4,#+1
??SD_Init_0:
        CMP      R4,#+10
        BCC.N    ??SD_Init_1
//  136 
//  137     /* Send CMD0 with CS low to enter SPI mode and reset the card.
//  138     The card will enter SPI mode if CS is low during the reception of CMD0. 
//  139     Since the CMD0 (and CMD8) must be sent as a native command, the CRC field
//  140     must have a valid value. */
//  141     if (SD_SendCommand (GO_IDLE_STATE, 0, NULL, 0) != R1_IN_IDLE_STATE) // CMD0
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
        CMP      R0,#+1
        BNE.W    ??SD_Init_2
//  142     {
//  143         goto  init_end;
//  144     }
//  145 
//  146     /* Now the card enters IDLE state. */
//  147 
//  148     /* Card type identification Start ... */
//  149 
//  150     /* Check the card type, needs around 1000ms */    
//  151     r1 = SD_SendCommand (SEND_IF_COND, 0x1AA, buf, 4);  // CMD8
??SD_Init_3:
        MOVS     R3,#+4
        ADD      R2,SP,#+0
        MOV      R1,#+426
        MOVS     R0,#+8
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
//  152     if (r1 & 0x80) goto init_end;
        LSLS     R1,R0,#+24
        BMI.W    ??SD_Init_2
//  153 
//  154     Timer1 = 100; // 1000ms
??SD_Init_4:
        LDR.W    R1,??DataTable7_1
        MOVS     R2,#+100
        STR      R2,[R1, #+0]
//  155     if (r1 == R1_IN_IDLE_STATE) { /* It's V2.0 or later SD card */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??SD_Init_5
//  156         if (buf[2]!= 0x01 || buf[3]!=0xAA) goto init_end; 
        LDRB     R0,[SP, #+2]
        CMP      R0,#+1
        BNE.N    ??SD_Init_6
        LDRB     R0,[SP, #+3]
        CMP      R0,#+170
        BEQ.N    ??SD_Init_7
??SD_Init_6:
        B.N      ??SD_Init_2
//  157 
//  158         /* The card is SD V2 and can work at voltage range of 2.7 to 3.6V */
//  159 
//  160         do {
//  161             r1 = SD_SendACommand (SD_SEND_OP_COND, 0x40000000, NULL, 0);  // ACMD41
??SD_Init_7:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+1073741824
        MOVS     R0,#+41
          CFI FunCall SD_SendACommand
        BL       SD_SendACommand
//  162             if      (r1 == 0x00) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SD_Init_8
//  163             else if (r1 > 0x01)  goto init_end;            
??SD_Init_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BGE.N    ??SD_Init_2
//  164         } while (Timer1);
??SD_Init_10:
        LDR.W    R0,??DataTable7_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SD_Init_7
//  165 
//  166         if (Timer1 && SD_SendCommand (READ_OCR, 0, buf, 4)==R1_NO_ERROR)  // CMD58
??SD_Init_8:
        LDR.W    R0,??DataTable7_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SD_Init_11
        MOVS     R3,#+4
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+58
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
        CMP      R0,#+0
        BNE.N    ??SD_Init_11
//  167             CardType = (buf[0] & 0x40) ? CARDTYPE_SDV2_HC : CARDTYPE_SDV2_SC;
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??SD_Init_12
        MOVS     R0,#+4
        B.N      ??SD_Init_13
??SD_Init_12:
        MOVS     R0,#+3
??SD_Init_13:
        LDR.W    R1,??DataTable7_3
        STRB     R0,[R1, #+0]
        B.N      ??SD_Init_11
//  168          
//  169     } else { /* It's Ver1.x SD card or MMC card */
//  170 
//  171         /* Check if it is SD card */
//  172         if (SD_SendCommand (APP_CMD, 0, NULL, 0) & R1_ILLEGAL_CMD)
??SD_Init_5:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+55
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
        LSLS     R0,R0,#+29
        BPL.N    ??SD_Init_14
//  173         {   
//  174             CardType = CARDTYPE_MMC; 
        LDR.W    R0,??DataTable7_3
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  175             while (Timer1 && SD_SendCommand (SEND_OP_COND, 0, NULL, 0));
??SD_Init_15:
        LDR.W    R0,??DataTable7_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SD_Init_16
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
        CMP      R0,#+0
        BNE.N    ??SD_Init_15
        B.N      ??SD_Init_16
//  176         }  
//  177         else 
//  178         {   
//  179             CardType = CARDTYPE_SDV1; 
??SD_Init_14:
        LDR.W    R0,??DataTable7_3
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  180             while (Timer1 && SD_SendACommand (SD_SEND_OP_COND, 0, NULL, 0));
??SD_Init_17:
        LDR.W    R0,??DataTable7_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SD_Init_16
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+41
          CFI FunCall SD_SendACommand
        BL       SD_SendACommand
        CMP      R0,#+0
        BNE.N    ??SD_Init_17
//  181         }
//  182 
//  183         if (Timer1 == 0) CardType = CARDTYPE_UNKNOWN;
??SD_Init_16:
        LDR.W    R0,??DataTable7_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SD_Init_11
        LDR.W    R0,??DataTable7_3
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  184     }
//  185 
//  186     /* For SDHC or SDXC, block length is fixed to 512 bytes, for others,
//  187     the block length is set to 512 manually. */
//  188     if (CardType == CARDTYPE_MMC ||
//  189         CardType == CARDTYPE_SDV1 ||
//  190         CardType == CARDTYPE_SDV2_SC )
??SD_Init_11:
        LDR.W    R0,??DataTable7_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??SD_Init_18
        LDR.W    R0,??DataTable7_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BEQ.N    ??SD_Init_18
        LDR.W    R0,??DataTable7_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??SD_Init_2
//  191     {
//  192         if (SD_SendCommand (SET_BLOCKLEN, SECTOR_SIZE, NULL, 0) != R1_NO_ERROR)
??SD_Init_18:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOV      R1,#+512
        MOVS     R0,#+16
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
        CMP      R0,#+0
        BEQ.N    ??SD_Init_2
//  193             CardType = CARDTYPE_UNKNOWN;
        LDR.W    R0,??DataTable7_3
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  194     }
//  195 
//  196 init_end:              
//  197    SD_DeSelect();
??SD_Init_2:
          CFI FunCall SPI_CS_High
        BL       SPI_CS_High
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
//  198 
//  199     if (CardType == CARDTYPE_UNKNOWN)
        LDR.W    R0,??DataTable7_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SD_Init_19
//  200     {
//  201         return (SD_FALSE);
        MOVS     R0,#+0
        B.N      ??SD_Init_20
//  202     }
//  203     else     /* Init OK. use high speed during data transaction stage. */
//  204     {
//  205         SPI_ConfigClockRate (SPI_CLOCKRATE_HIGH);
??SD_Init_19:
        LDR.W    R0,??DataTable7_5  ;; 0x17d7840
          CFI FunCall SPI_ConfigClockRate
        BL       SPI_ConfigClockRate
//  206         return (SD_TRUE);
        MOVS     R0,#+1
??SD_Init_20:
        POP      {R1,R2,R4,PC}    ;; return
          CFI EndBlock cfiBlock1
//  207     }
//  208 }
//  209 /***********************************************************************************
//  210 * @brief  Wait for the card is ready. 
//  211 *
//  212 * @param  None
//  213 * @retval SD_TRUE: Card is ready for read commands.
//  214 *         SD_FALSE: Card is not ready 
//  215 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SD_WaitForReady
        THUMB
//  216 SD_BOOL SD_WaitForReady (void)
//  217 {
SD_WaitForReady:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  218     Timer2 = 50;    // 500ms
        LDR.W    R0,??DataTable7_2
        MOVS     R1,#+50
        STR      R1,[R0, #+0]
//  219     SPI_RecvByte(); /* Read a byte (Force enable DO output) */
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
//  220     do {
//  221         if (SPI_RecvByte () == 0xFF) return SD_TRUE;
??SD_WaitForReady_0:
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
        CMP      R0,#+255
        BNE.N    ??SD_WaitForReady_1
        MOVS     R0,#+1
        B.N      ??SD_WaitForReady_2
//  222     } while (Timer2);
??SD_WaitForReady_1:
        LDR.W    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SD_WaitForReady_0
//  223 
//  224     return SD_FALSE;    
        MOVS     R0,#+0
??SD_WaitForReady_2:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock2
//  225 }
//  226 /***********************************************************************************
//  227 * @brief  Send a command and receive a response with specified format. 
//  228 *
//  229 * @param  cmd: Specifies the command index.
//  230 * @param  arg: Specifies the argument.
//  231 * @param  buf: Pointer to byte array to store the response content.
//  232 * @param  len: Specifies the byte number to be received after R1 response.
//  233 * @retval Value below 0x80 is the normal R1 response (0x0 means no error) 
//  234 *         Value above 0x80 is the additional returned status code.
//  235 *             0x81: Card is not ready
//  236 *             0x82: command response time out error
//  237 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SD_SendCommand
        THUMB
//  238 unsigned char SD_SendCommand (unsigned char cmd, unsigned int arg, unsigned char *buf, unsigned int len) 
//  239 {
SD_SendCommand:
        PUSH     {R3-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  240     unsigned int r1,i;
//  241     unsigned char crc_stop;
//  242 
//  243     /* The CS signal must be kept low during a transaction */
//  244     SD_Select();
          CFI FunCall SPI_CS_Low
        BL       SPI_CS_Low
//  245 
//  246     /* Wait until the card is ready to read (DI signal is High) */
//  247     if (SD_WaitForReady() == SD_FALSE) return 0x81;
          CFI FunCall SD_WaitForReady
        BL       SD_WaitForReady
        CMP      R0,#+0
        BNE.N    ??SD_SendCommand_0
        MOVS     R0,#+129
        B.N      ??SD_SendCommand_1
//  248 
//  249     /* Prepare CRC7 + stop bit. For cmd GO_IDLE_STATE and SEND_IF_COND, 
//  250     the CRC7 should be valid, otherwise, the CRC7 will be ignored. */
//  251     if      (cmd == GO_IDLE_STATE)  crc_stop = 0x95; /* valid CRC7 + stop bit */
??SD_SendCommand_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??SD_SendCommand_2
        MOVS     R9,#+149
        B.N      ??SD_SendCommand_3
//  252     else if (cmd == SEND_IF_COND)   crc_stop = 0x87; /* valid CRC7 + stop bit */
??SD_SendCommand_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BNE.N    ??SD_SendCommand_4
        MOVS     R9,#+135
        B.N      ??SD_SendCommand_3
//  253     else                            crc_stop = 0x01; /* dummy CRC7 + Stop bit */
??SD_SendCommand_4:
        MOVS     R9,#+1
//  254 
//  255     /* Send 6-byte command with CRC. */ 
//  256     SPI_SendByte (cmd | 0x40);
??SD_SendCommand_3:
        ORRS     R0,R4,#0x40
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPI_SendByte
        BL       SPI_SendByte
//  257     SPI_SendByte (arg >> 24);
        LSRS     R0,R5,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPI_SendByte
        BL       SPI_SendByte
//  258     SPI_SendByte (arg >> 16);
        LSRS     R0,R5,#+16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPI_SendByte
        BL       SPI_SendByte
//  259     SPI_SendByte (arg >> 8);
        LSRS     R0,R5,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPI_SendByte
        BL       SPI_SendByte
//  260     SPI_SendByte (arg);
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPI_SendByte
        BL       SPI_SendByte
//  261     SPI_SendByte (crc_stop); /* Valid or dummy CRC plus stop bit */
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPI_SendByte
        BL       SPI_SendByte
//  262 
//  263    
//  264     /* The command response time (Ncr) is 0 to 8 bytes for SDC, 
//  265     1 to 8 bytes for MMC. */
//  266     for (i = 8; i; i--)
        MOVS     R4,#+8
        B.N      ??SD_SendCommand_5
??SD_SendCommand_6:
        SUBS     R4,R4,#+1
??SD_SendCommand_5:
        CMP      R4,#+0
        BEQ.N    ??SD_SendCommand_7
//  267     {
//  268         r1 = SPI_RecvByte ();
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
        MOV      R8,R0
//  269         if (r1 != 0xFF) break;   /* received valid response */      
        CMP      R8,#+255
        BEQ.N    ??SD_SendCommand_6
//  270     }
//  271     if (i == 0)  return (0x82); /* command response time out error */
??SD_SendCommand_7:
        CMP      R4,#+0
        BNE.N    ??SD_SendCommand_8
        MOVS     R0,#+130
        B.N      ??SD_SendCommand_1
//  272 
//  273     /* Read remaining bytes after R1 response */
//  274     if (buf && len)
??SD_SendCommand_8:
        CMP      R6,#+0
        BEQ.N    ??SD_SendCommand_9
        CMP      R7,#+0
        BEQ.N    ??SD_SendCommand_9
//  275     {
//  276         do {   
//  277             *buf++ = SPI_RecvByte ();
??SD_SendCommand_10:
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
        STRB     R0,[R6, #+0]
        ADDS     R6,R6,#+1
//  278         } while (--len);
        SUBS     R7,R7,#+1
        CMP      R7,#+0
        BNE.N    ??SD_SendCommand_10
//  279     }
//  280 
//  281     return (r1);
??SD_SendCommand_9:
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??SD_SendCommand_1:
        POP      {R1,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock3
//  282 }
//  283 /***********************************************************************************
//  284 * @brief  Send an application specific command for SD card 
//  285 *         and receive a response with specified format. 
//  286 *
//  287 * @param  cmd: Specifies the command index.
//  288 * @param  arg: Specifies the argument.
//  289 * @param  buf: Pointer to byte array to store the response content.
//  290 * @param  len: Specifies the byte number to be received after R1 response.
//  291 * @retval Value below 0x80 is the normal R1 response(0x0 means no error)
//  292 *         Value above 0x80 is the additional returned status code.
//  293 *             0x81: Card is not ready
//  294 *             0x82: command response time out error
//  295 *
//  296 * Note: All the application specific commands should be precdeded with APP_CMD
//  297 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SD_SendACommand
        THUMB
//  298 unsigned char SD_SendACommand (unsigned char cmd, unsigned int arg, unsigned char *buf, unsigned int len)
//  299 {
SD_SendACommand:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  300     unsigned char r1;
//  301 
//  302     /* Send APP_CMD (CMD55) first */
//  303 	r1 = SD_SendCommand(APP_CMD, 0, NULL, 0);
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+55
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
//  304 	if (r1 > 1) return r1;    
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BLT.N    ??SD_SendACommand_0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??SD_SendACommand_1
//  305     
//  306     return (SD_SendCommand (cmd, arg, buf, len));
??SD_SendACommand_0:
        MOVS     R3,R7
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
??SD_SendACommand_1:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock4
//  307 }
//  308 /***********************************************************************************
//  309 *   @brief  Read single or multiple sector(s) from memory card.
//  310 *
//  311 *   @param  sect: Specifies the starting sector index to read
//  312 *   @param  buf:  Pointer to byte array to store the data
//  313 *   @param  cnt:  Specifies the count of sectors to read
//  314 *   @retval SD_TRUE or SD_FALSE. 
//  315 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SD_ReadSector
        THUMB
//  316 SD_BOOL SD_ReadSector (unsigned int sect, unsigned char *buf, unsigned int cnt)
//  317 {
SD_ReadSector:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R1
        MOVS     R5,R2
//  318     SD_BOOL flag;
//  319 
//  320     /* Convert sector-based address to byte-based address for non SDHC */
//  321     if (CardType != CARDTYPE_SDV2_HC) sect <<= 9;
        LDR.W    R1,??DataTable7_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+4
        BEQ.N    ??SD_ReadSector_0
        LSLS     R0,R0,#+9
//  322 
//  323     flag = SD_FALSE;
??SD_ReadSector_0:
        MOVS     R6,#+0
//  324 
//  325     if (cnt > 1) /* Read multiple block */
        CMP      R5,#+2
        BCC.N    ??SD_ReadSector_1
//  326     {
//  327 		if (SD_SendCommand(READ_MULTIPLE_BLOCK, sect, NULL, 0) == R1_NO_ERROR) 
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,R0
        MOVS     R0,#+18
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
        CMP      R0,#+0
        BNE.N    ??SD_ReadSector_2
//  328         {            
//  329 			do {
//  330 				if (SD_RecvDataBlock(buf, SECTOR_SIZE) == SD_FALSE) break;
??SD_ReadSector_3:
        MOV      R1,#+512
        MOVS     R0,R4
          CFI FunCall SD_RecvDataBlock
        BL       SD_RecvDataBlock
        CMP      R0,#+0
        BEQ.N    ??SD_ReadSector_4
//  331 				buf += SECTOR_SIZE;
??SD_ReadSector_5:
        ADDS     R4,R4,#+512
//  332 			} while (--cnt);
        SUBS     R5,R5,#+1
        CMP      R5,#+0
        BNE.N    ??SD_ReadSector_3
//  333 
//  334 			/* Stop transmission */
//  335             SD_SendCommand(STOP_TRANSMISSION, 0, NULL, 0);				
??SD_ReadSector_4:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+12
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
//  336 
//  337             /* Wait for the card is ready */
//  338             if (SD_WaitForReady() && cnt==0) flag = SD_TRUE;
          CFI FunCall SD_WaitForReady
        BL       SD_WaitForReady
        CMP      R0,#+0
        BEQ.N    ??SD_ReadSector_2
        CMP      R5,#+0
        BNE.N    ??SD_ReadSector_2
        MOVS     R6,#+1
        B.N      ??SD_ReadSector_2
//  339         }
//  340     }
//  341     else   /* Read single block */
//  342     {        
//  343         if ((SD_SendCommand(READ_SINGLE_BLOCK, sect, NULL, 0)==R1_NO_ERROR) &&
//  344             SD_RecvDataBlock(buf, SECTOR_SIZE)==SD_TRUE)    
??SD_ReadSector_1:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,R0
        MOVS     R0,#+17
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
        CMP      R0,#+0
        BNE.N    ??SD_ReadSector_2
        MOV      R1,#+512
        MOVS     R0,R4
          CFI FunCall SD_RecvDataBlock
        BL       SD_RecvDataBlock
        CMP      R0,#+1
        BNE.N    ??SD_ReadSector_2
//  345             flag = SD_TRUE;        
        MOVS     R6,#+1
//  346     }
//  347 
//  348     /* De-select the card */
//  349     SD_DeSelect();
??SD_ReadSector_2:
          CFI FunCall SPI_CS_High
        BL       SPI_CS_High
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
//  350 
//  351     return (flag);
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock5
//  352 }
//  353 /***********************************************************************************
//  354 * @brief  Write single or multiple sectors to SD/MMC. 
//  355 *
//  356 * @param  sect: Specifies the starting sector index to write
//  357 * @param  buf: Pointer to the data array to be written
//  358 * @param  cnt: Specifies the number sectors to be written
//  359 * @retval SD_TRUE or SD_FALSE
//  360 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SD_WriteSector
        THUMB
//  361 SD_BOOL SD_WriteSector (unsigned int sect, const unsigned char *buf, unsigned int cnt)
//  362 {
SD_WriteSector:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R1
        MOVS     R5,R2
//  363     SD_BOOL flag;
//  364 
//  365     /* Convert sector-based address to byte-based address for non SDHC */
//  366     if (CardType != CARDTYPE_SDV2_HC) sect <<= 9; 
        LDR.N    R1,??DataTable7_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+4
        BEQ.N    ??SD_WriteSector_0
        LSLS     R0,R0,#+9
//  367 
//  368     flag = SD_FALSE;
??SD_WriteSector_0:
        MOVS     R6,#+0
//  369     if (cnt > 1)  /* write multiple block */
        CMP      R5,#+2
        BCC.N    ??SD_WriteSector_1
//  370     { 
//  371         if (SD_SendCommand (WRITE_MULTIPLE_BLOCK, sect, NULL, 0) == R1_NO_ERROR)
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,R0
        MOVS     R0,#+25
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
        CMP      R0,#+0
        BNE.N    ??SD_WriteSector_2
//  372         {
//  373             do {
//  374                 if (SD_SendDataBlock (buf, 0xFC, SECTOR_SIZE) == SD_FALSE)  break;
??SD_WriteSector_3:
        MOV      R2,#+512
        MOVS     R1,#+252
        MOVS     R0,R4
          CFI FunCall SD_SendDataBlock
        BL       SD_SendDataBlock
        CMP      R0,#+0
        BEQ.N    ??SD_WriteSector_4
//  375                 buf += SECTOR_SIZE;
??SD_WriteSector_5:
        ADDS     R4,R4,#+512
//  376             } while (--cnt);
        SUBS     R5,R5,#+1
        CMP      R5,#+0
        BNE.N    ??SD_WriteSector_3
//  377 
//  378             /* Send Stop Transmission Token. */
//  379             SPI_SendByte (0xFD);
??SD_WriteSector_4:
        MOVS     R0,#+253
          CFI FunCall SPI_SendByte
        BL       SPI_SendByte
//  380         
//  381             /* Wait for complete */
//  382             if (SD_WaitForReady() && cnt==0) flag = SD_TRUE;
          CFI FunCall SD_WaitForReady
        BL       SD_WaitForReady
        CMP      R0,#+0
        BEQ.N    ??SD_WriteSector_2
        CMP      R5,#+0
        BNE.N    ??SD_WriteSector_2
        MOVS     R6,#+1
        B.N      ??SD_WriteSector_2
//  383         }
//  384     }
//  385     else  /* write single block */
//  386     {
//  387     
//  388         if ( (SD_SendCommand (WRITE_SINGLE_BLOCK, sect, NULL, 0) == R1_NO_ERROR) &&
//  389             (SD_SendDataBlock (buf, 0xFE, SECTOR_SIZE) == SD_TRUE))
??SD_WriteSector_1:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,R0
        MOVS     R0,#+24
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
        CMP      R0,#+0
        BNE.N    ??SD_WriteSector_2
        MOV      R2,#+512
        MOVS     R1,#+254
        MOVS     R0,R4
          CFI FunCall SD_SendDataBlock
        BL       SD_SendDataBlock
        CMP      R0,#+1
        BNE.N    ??SD_WriteSector_2
//  390             flag = SD_TRUE;
        MOVS     R6,#+1
//  391     }
//  392 
//  393     /* De-select the card */
//  394     SD_DeSelect();
??SD_WriteSector_2:
          CFI FunCall SPI_CS_High
        BL       SPI_CS_High
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
//  395 
//  396     return (flag);
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock6
//  397 }
//  398 /***********************************************************************************
//  399 * @brief  Read card configuration and fill structure CardConfig.
//  400 *
//  401 * @param  None
//  402 * @retval SD_TRUE or SD_FALSE. 
//  403 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SD_ReadConfiguration
        THUMB
//  404 SD_BOOL SD_ReadConfiguration ()
//  405 {
SD_ReadConfiguration:
        PUSH     {R0-R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+24
//  406     unsigned char buf[16];
//  407     unsigned int i, c_size, c_size_mult, read_bl_len;
//  408     SD_BOOL retv;
//  409   
//  410     retv = SD_FALSE;
        MOVS     R4,#+0
//  411 
//  412     /* Read OCR */
//  413     if (SD_SendCommand(READ_OCR, 0, CardConfig.ocr, 4) != R1_NO_ERROR) goto end;
        MOVS     R3,#+4
        LDR.N    R2,??DataTable7_6
        MOVS     R1,#+0
        MOVS     R0,#+58
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
        CMP      R0,#+0
        BNE.W    ??SD_ReadConfiguration_0
//  414 
//  415     /* Read CID */
//  416     if ((SD_SendCommand(SEND_CID, 0, NULL, 0) != R1_NO_ERROR) ||
//  417         SD_RecvDataBlock (CardConfig.cid, 16)==SD_FALSE) goto end;
??SD_ReadConfiguration_1:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+10
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
        CMP      R0,#+0
        BNE.N    ??SD_ReadConfiguration_2
        MOVS     R1,#+16
        LDR.N    R0,??DataTable7_7
          CFI FunCall SD_RecvDataBlock
        BL       SD_RecvDataBlock
        CMP      R0,#+0
        BNE.N    ??SD_ReadConfiguration_3
??SD_ReadConfiguration_2:
        B.N      ??SD_ReadConfiguration_0
//  418 
//  419     /* Read CSD */
//  420     if ((SD_SendCommand(SEND_CSD, 0, NULL, 0) != R1_NO_ERROR) ||
//  421         SD_RecvDataBlock (CardConfig.csd, 16)==SD_FALSE) goto end;
??SD_ReadConfiguration_3:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+9
          CFI FunCall SD_SendCommand
        BL       SD_SendCommand
        CMP      R0,#+0
        BNE.N    ??SD_ReadConfiguration_4
        MOVS     R1,#+16
        LDR.N    R0,??DataTable7_8
          CFI FunCall SD_RecvDataBlock
        BL       SD_RecvDataBlock
        CMP      R0,#+0
        BNE.N    ??SD_ReadConfiguration_5
??SD_ReadConfiguration_4:
        B.N      ??SD_ReadConfiguration_0
//  422 
//  423     /* sector size */
//  424     CardConfig.sectorsize = 512;
??SD_ReadConfiguration_5:
        LDR.N    R0,??DataTable7_9
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//  425     
//  426     /* sector count */
//  427     if (((CardConfig.csd[0]>>6) & 0x3) == 0x1) /* CSD V2.0 (for High/eXtended Capacity) */
        LDR.N    R0,??DataTable7_9
        LDRB     R0,[R0, #+32]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??SD_ReadConfiguration_6
//  428     {
//  429         /* Read C_SIZE */
//  430         c_size =  (((unsigned int)CardConfig.csd[7]<<16) + ((unsigned int)CardConfig.csd[8]<<8) + CardConfig.csd[9]) & 0x3FFFFF;
        LDR.N    R0,??DataTable7_9
        LDRB     R0,[R0, #+39]
        LDR.N    R1,??DataTable7_9
        LDRB     R1,[R1, #+40]
        LSLS     R1,R1,#+8
        ADDS     R0,R1,R0, LSL #+16
        LDR.N    R1,??DataTable7_9
        LDRB     R1,[R1, #+41]
        ADDS     R0,R1,R0
        LSLS     R0,R0,#+10       ;; ZeroExtS R0,R0,#+10,#+10
        LSRS     R0,R0,#+10
//  431         /* Calculate sector count */
//  432        CardConfig.sectorcnt = (c_size + 1) * 1024;
        ADDS     R0,R0,#+1
        MOV      R1,#+1024
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable7_9
        STR      R0,[R1, #+4]
        B.N      ??SD_ReadConfiguration_7
//  433 
//  434     } else   /* CSD V1.0 (for Standard Capacity) */
//  435     {
//  436         /* C_SIZE */
//  437         c_size = (((unsigned int)(CardConfig.csd[6]&0x3)<<10) + ((unsigned int)CardConfig.csd[7]<<2) + (CardConfig.csd[8]>>6)) & 0xFFF;
??SD_ReadConfiguration_6:
        LDR.N    R0,??DataTable7_9
        LDRB     R0,[R0, #+38]
        LDR.N    R1,??DataTable7_9
        LDRB     R1,[R1, #+39]
        LSLS     R1,R1,#+2
        ADDS     R0,R1,R0, LSL #+10
        LDR.N    R1,??DataTable7_9
        LDRB     R1,[R1, #+40]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R1,R0
        LSLS     R0,R0,#+20       ;; ZeroExtS R0,R0,#+20,#+20
        LSRS     R0,R0,#+20
//  438         /* C_SIZE_MUTE */
//  439         c_size_mult = ((CardConfig.csd[9]&0x3)<<1) + ((CardConfig.csd[10]&0x80)>>7);
        LDR.N    R1,??DataTable7_9
        LDRB     R1,[R1, #+41]
        ANDS     R1,R1,#0x3
        LDR.N    R2,??DataTable7_9
        LDRB     R2,[R2, #+42]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSRS     R2,R2,#+7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R1,R2,R1, LSL #+1
//  440         /* READ_BL_LEN */
//  441         read_bl_len = CardConfig.csd[5] & 0xF;
        LDR.N    R2,??DataTable7_9
        LDRB     R2,[R2, #+37]
        ANDS     R2,R2,#0xF
//  442         /* sector count = BLOCKNR*BLOCK_LEN/512, we manually set SECTOR_SIZE to 512*/
//  443         //CardConfig.sectorcnt = (c_size+1)*(1<<read_bl_len) * (1<<(c_size_mult+2)) / 512;
//  444         CardConfig.sectorcnt = (c_size+1) << (read_bl_len + c_size_mult - 7);        
        ADDS     R0,R0,#+1
        ADDS     R1,R1,R2
        SUBS     R1,R1,#+7
        LSLS     R0,R0,R1
        LDR.N    R1,??DataTable7_9
        STR      R0,[R1, #+4]
//  445     }
//  446 
//  447     /* Get erase block size in unit of sector */
//  448     switch (CardType)
??SD_ReadConfiguration_7:
        LDR.N    R0,??DataTable7_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??SD_ReadConfiguration_8
        BCC.N    ??SD_ReadConfiguration_9
        CMP      R0,#+3
        BEQ.N    ??SD_ReadConfiguration_10
        BCC.N    ??SD_ReadConfiguration_11
        CMP      R0,#+4
        BNE.N    ??SD_ReadConfiguration_9
//  449     {
//  450         case CARDTYPE_SDV2_SC:
//  451         case CARDTYPE_SDV2_HC:
//  452             if ((SD_SendACommand (SD_STATUS, 0, buf, 1) !=  R1_NO_ERROR) ||
//  453                 SD_RecvDataBlock(buf, 16) == SD_FALSE) goto end;      /* Read partial block */    
??SD_ReadConfiguration_10:
        MOVS     R3,#+1
        ADD      R2,SP,#+0
        MOVS     R1,#+0
        MOVS     R0,#+13
          CFI FunCall SD_SendACommand
        BL       SD_SendACommand
        CMP      R0,#+0
        BNE.N    ??SD_ReadConfiguration_12
        MOVS     R1,#+16
        ADD      R0,SP,#+0
          CFI FunCall SD_RecvDataBlock
        BL       SD_RecvDataBlock
        CMP      R0,#+0
        BNE.N    ??SD_ReadConfiguration_13
??SD_ReadConfiguration_12:
        B.N      ??SD_ReadConfiguration_0
//  454             for (i=64-16;i;i--) SPI_RecvByte();  /* Purge trailing data */            
??SD_ReadConfiguration_13:
        MOVS     R4,#+48
        B.N      ??SD_ReadConfiguration_14
??SD_ReadConfiguration_15:
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
        SUBS     R4,R4,#+1
??SD_ReadConfiguration_14:
        CMP      R4,#+0
        BNE.N    ??SD_ReadConfiguration_15
//  455             CardConfig.blocksize = 16UL << (buf[10] >> 4); /* Calculate block size based on AU size */
        MOVS     R0,#+16
        LDRB     R1,[SP, #+10]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+4
        LSLS     R0,R0,R1
        LDR.N    R1,??DataTable7_9
        STR      R0,[R1, #+8]
//  456             break;
//  457         case CARDTYPE_MMC:
//  458             CardConfig.blocksize = ((unsigned short int)((CardConfig.csd[10] & 124) >> 2) + 1) * (((CardConfig.csd[10] & 3) << 3) + ((CardConfig.csd[11] & 224) >> 5) + 1);
//  459             break;
//  460         case CARDTYPE_SDV1:
//  461             CardConfig.blocksize = (((CardConfig.csd[10] & 63) << 1) + ((unsigned short int)(CardConfig.csd[11] & 128) >> 7) + 1) << ((CardConfig.csd[13] >> 6) - 1);
//  462             break;
//  463         default:
//  464             goto end;                
//  465     }
//  466 
//  467     retv = SD_TRUE;
??SD_ReadConfiguration_16:
        MOVS     R4,#+1
//  468 end:
//  469     SD_DeSelect ();
??SD_ReadConfiguration_0:
          CFI FunCall SPI_CS_High
        BL       SPI_CS_High
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
//  470 
//  471     return retv;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+16
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI CFA R13+24
??SD_ReadConfiguration_8:
        LDR.N    R0,??DataTable7_9
        LDRB     R0,[R0, #+42]
        UBFX     R0,R0,#+2,#+5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable7_9
        LDRB     R1,[R1, #+42]
        ANDS     R1,R1,#0x3
        LDR.N    R2,??DataTable7_9
        LDRB     R2,[R2, #+43]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSRS     R2,R2,#+5
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R1,R2,R1, LSL #+3
        ADDS     R1,R1,#+1
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable7_9
        STR      R0,[R1, #+8]
        B.N      ??SD_ReadConfiguration_16
??SD_ReadConfiguration_11:
        LDR.N    R0,??DataTable7_9
        LDRB     R0,[R0, #+42]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable7_9
        LDRB     R1,[R1, #+43]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R1,R0, LSL #+1
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable7_9
        LDRB     R1,[R1, #+45]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+6
        SUBS     R1,R1,#+1
        LSLS     R0,R0,R1
        LDR.N    R1,??DataTable7_9
        STR      R0,[R1, #+8]
        B.N      ??SD_ReadConfiguration_16
??SD_ReadConfiguration_9:
        B.N      ??SD_ReadConfiguration_0
          CFI EndBlock cfiBlock7
//  472 }
//  473 /***********************************************************************************
//  474 *   @brief  Receive a data block with specified length from SD/MMC. 
//  475 *
//  476 *   @param  buf: Pointer to the data array to store the received data
//  477 *   @param  len: Specifies the length (in byte) to be received.
//  478 *              The value should be a multiple of 4.
//  479 *   @retval SD_TRUE or SD_FALSE
//  480 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function SD_RecvDataBlock
        THUMB
//  481 SD_BOOL SD_RecvDataBlock (unsigned char *buf, unsigned int len)
//  482 {
SD_RecvDataBlock:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  483     unsigned char datatoken;
//  484     unsigned int i;
//  485 
//  486     /* Read data token (0xFE) */
//  487 	Timer1 = 10;   /* Data Read Timerout: 100ms */
        LDR.N    R0,??DataTable7_1
        MOVS     R1,#+10
        STR      R1,[R0, #+0]
//  488 	do {							
//  489 		datatoken = SPI_RecvByte ();
??SD_RecvDataBlock_0:
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
//  490         if (datatoken == 0xFE) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+254
        BEQ.N    ??SD_RecvDataBlock_1
//  491 	} while (Timer1);
??SD_RecvDataBlock_2:
        LDR.N    R1,??DataTable7_1
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??SD_RecvDataBlock_0
//  492 	if(datatoken != 0xFE) return (SD_FALSE);	/* data read timeout */
??SD_RecvDataBlock_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+254
        BEQ.N    ??SD_RecvDataBlock_3
        MOVS     R0,#+0
        B.N      ??SD_RecvDataBlock_4
//  493 
//  494     /* Read data block */
//  495     for (i = 0; i < len; i++) {
??SD_RecvDataBlock_3:
        MOVS     R6,#+0
        B.N      ??SD_RecvDataBlock_5
//  496         buf[i] = SPI_RecvByte ();
??SD_RecvDataBlock_6:
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
        STRB     R0,[R6, R4]
//  497     }
        ADDS     R6,R6,#+1
??SD_RecvDataBlock_5:
        CMP      R6,R5
        BCC.N    ??SD_RecvDataBlock_6
//  498 
//  499     /* 2 bytes CRC will be discarded. */
//  500     SPI_RecvByte ();
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
//  501     SPI_RecvByte ();
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
//  502 
//  503     return (SD_TRUE);
        MOVS     R0,#+1
??SD_RecvDataBlock_4:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock8
//  504 }
//  505 /***********************************************************************************
//  506 * @brief  Send a data block with specified length to SD/MMC. 
//  507 *
//  508 * @param  buf: Pointer to the data array to store the received data
//  509 * @param  tkn: Specifies the token to send before the data block
//  510 * @param  len: Specifies the length (in byte) to send.
//  511 *              The value should be 512 for memory card.
//  512 * @retval SD_TRUE or SD_FALSE
//  513 ***********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function SD_SendDataBlock
        THUMB
//  514 SD_BOOL SD_SendDataBlock (const unsigned char *buf, unsigned char tkn, unsigned int len) 
//  515 {
SD_SendDataBlock:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R0,R1
        MOVS     R5,R2
//  516     unsigned char recv;
//  517     unsigned int i;
//  518     
//  519     /* Send Start Block Token */
//  520     SPI_SendByte (tkn);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SPI_SendByte
        BL       SPI_SendByte
//  521 
//  522     /* Send data block */
//  523     for (i = 0; i < len; i++) 
        MOVS     R6,#+0
        B.N      ??SD_SendDataBlock_0
//  524     {
//  525       SPI_SendByte (buf[i]);
??SD_SendDataBlock_1:
        LDRB     R0,[R6, R4]
          CFI FunCall SPI_SendByte
        BL       SPI_SendByte
//  526     }
        ADDS     R6,R6,#+1
??SD_SendDataBlock_0:
        CMP      R6,R5
        BCC.N    ??SD_SendDataBlock_1
//  527 
//  528     /* Send 2 bytes dummy CRC */
//  529     SPI_SendByte (0xFF);
        MOVS     R0,#+255
          CFI FunCall SPI_SendByte
        BL       SPI_SendByte
//  530     SPI_SendByte (0xFF);
        MOVS     R0,#+255
          CFI FunCall SPI_SendByte
        BL       SPI_SendByte
//  531 
//  532     /* Read data response to check if the data block has been accepted. */
//  533     if (( (SPI_RecvByte ()) & 0x0F) != 0x05)
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
        ANDS     R0,R0,#0xF
        CMP      R0,#+5
        BEQ.N    ??SD_SendDataBlock_2
//  534         return (SD_FALSE); /* write error */
        MOVS     R0,#+0
        B.N      ??SD_SendDataBlock_3
//  535 
//  536     /* Wait for wirte complete. */
//  537     Timer1 = 20;  // 200ms
??SD_SendDataBlock_2:
        LDR.N    R0,??DataTable7_1
        MOVS     R1,#+20
        STR      R1,[R0, #+0]
//  538     do {
//  539         recv = SPI_RecvByte();
??SD_SendDataBlock_4:
          CFI FunCall SPI_RecvByte
        BL       SPI_RecvByte
//  540         if (recv == 0xFF) break;  
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+255
        BEQ.N    ??SD_SendDataBlock_5
//  541     } while (Timer1);
??SD_SendDataBlock_6:
        LDR.N    R1,??DataTable7_1
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??SD_SendDataBlock_4
//  542 
//  543     if (recv == 0xFF) return SD_TRUE;       /* write complete */
??SD_SendDataBlock_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+255
        BNE.N    ??SD_SendDataBlock_7
        MOVS     R0,#+1
        B.N      ??SD_SendDataBlock_3
//  544     else              return (SD_FALSE);    /* write time out */
??SD_SendDataBlock_7:
        MOVS     R0,#+0
??SD_SendDataBlock_3:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock9
//  545 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     ??counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     Timer1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     Timer2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     CardType

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x3d0900

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     0x17d7840

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     CardConfig+0xC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     CardConfig+0x10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     CardConfig+0x20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     CardConfig

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  546 /***********************************************************************************
//  547 *   Fim do arquivo
//  548 ***********************************************************************************/
// 
//    57 bytes in section .bss
//     1 byte  in section .data
// 1 630 bytes in section .text
// 
// 1 630 bytes of CODE memory
//    58 bytes of DATA memory
//
//Errors: none
//Warnings: none
