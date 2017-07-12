/*__________________________________________________________________________________
|	Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Blumenau - SC
|       www.chavedigital.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Chave Digital and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Chave Digital
|       or its distributors.
|
|       Este código é propriedade da Chave Digital e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Chave Digital ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  SDCARD.H
|       Data criação       :  01/08/2011
|       Revisões           :  1.0
|
| __________________________________________________________________________________
*/

#ifndef _SDCARD_H_
#define	_SDCARD_H_

/* type defintion */
typedef unsigned char    SD_BOOL;
#define SD_TRUE     1
#define SD_FALSE    0

#ifndef NULL
 #ifdef __cplusplus              // EC++
  #define NULL          0
 #else
  #define NULL          ((void *) 0)
 #endif
#endif

/* Memory card type definitions */
#define CARDTYPE_UNKNOWN        0
#define CARDTYPE_MMC            1   /* MMC */
#define CARDTYPE_SDV1           2   /* V1.x Standard Capacity SD card */
#define CARDTYPE_SDV2_SC        3   /* V2.0 or later Standard Capacity SD card */
#define CARDTYPE_SDV2_HC        4   /* V2.0 or later High/eXtended Capacity SD card */

/* SD/MMC card configuration */
typedef struct tagCARDCONFIG
{
    unsigned int sectorsize;    /* size (in byte) of each sector, fixed to 512bytes */
    unsigned int sectorcnt;     /* total sector number */  
    unsigned int blocksize;     /* erase block size in unit of sector */     
    unsigned char  ocr[4];		/* OCR */
    unsigned char  cid[16];		/* CID */
    unsigned char  csd[16];		/* CSD */
} CARDCONFIG;

/* Public variables */
extern unsigned char CardType;
extern CARDCONFIG CardConfig;


/* Public functions */
SD_BOOL     SD_Init (void);
SD_BOOL     SD_ReadSector (unsigned int sect, unsigned char *buf, unsigned int cnt);
SD_BOOL     SD_WriteSector (unsigned int sect, const unsigned char *buf, unsigned int cnt);
SD_BOOL     SD_ReadConfiguration (void);
void        disk_timerproc (void);

/***********************************************************************************
*		Fim do arquivo
***********************************************************************************/
#endif // _SDCARD_H_