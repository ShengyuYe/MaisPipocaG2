///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     17/Jul/2017  11:20:05 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\FILESYSTEM\ff.c                 /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\FILESYSTEM\ff.c -lC             /
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
//                    pocaG2\SOFTWARE\Debug\List\ff.s                         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ff

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN disk_initialize
        EXTERN disk_ioctl
        EXTERN disk_read
        EXTERN disk_status
        EXTERN disk_write
        EXTERN get_fattime

        PUBLIC f_close
        PUBLIC f_closedir
        PUBLIC f_getfree
        PUBLIC f_lseek
        PUBLIC f_mkdir
        PUBLIC f_mount
        PUBLIC f_open
        PUBLIC f_opendir
        PUBLIC f_read
        PUBLIC f_readdir
        PUBLIC f_rename
        PUBLIC f_stat
        PUBLIC f_sync
        PUBLIC f_truncate
        PUBLIC f_unlink
        PUBLIC f_write
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\FILESYSTEM\ff.c
//    1 /*----------------------------------------------------------------------------/
//    2 /  FatFs - Generic FAT Filesystem Module  R0.13                               /
//    3 /-----------------------------------------------------------------------------/
//    4 /
//    5 / Copyright (C) 2017, ChaN, all right reserved.
//    6 /
//    7 / FatFs module is an open source software. Redistribution and use of FatFs in
//    8 / source and binary forms, with or without modification, are permitted provided
//    9 / that the following condition is met:
//   10 /
//   11 / 1. Redistributions of source code must retain the above copyright notice,
//   12 /    this condition and the following disclaimer.
//   13 /
//   14 / This software is provided by the copyright holder and contributors "AS IS"
//   15 / and any warranties related to this software are DISCLAIMED.
//   16 / The copyright owner or contributors be NOT LIABLE for any damages caused
//   17 / by use of this software.
//   18 /
//   19 /----------------------------------------------------------------------------*/
//   20 
//   21 
//   22 #include "ff.h"			/* Declarations of FatFs API */
//   23 #include "diskio.h"		/* Declarations of device I/O functions */
//   24 
//   25 
//   26 /*--------------------------------------------------------------------------
//   27 
//   28    Module Private Definitions
//   29 
//   30 ---------------------------------------------------------------------------*/
//   31 
//   32 #if FF_DEFINED != 87030	/* Revision ID */
//   33 #error Wrong include file (ff.h).
//   34 #endif
//   35 
//   36 
//   37 /* ASCII code support macros */
//   38 #define IsUpper(c)	((c) >= 'A' && (c) <= 'Z')
//   39 #define IsLower(c)	((c) >= 'a' && (c) <= 'z')
//   40 #define IsDigit(c)	((c) >= '0' && (c) <= '9')
//   41 
//   42 
//   43 /* Additional file attribute bits for internal use */
//   44 #define AM_VOL		0x08	/* Volume label */
//   45 #define AM_LFN		0x0F	/* LFN entry */
//   46 #define AM_MASK		0x3F	/* Mask of defined bits */
//   47 
//   48 
//   49 /* Additional file access control and file status flags for internal use */
//   50 #define FA_SEEKEND	0x20	/* Seek to end of the file on file open */
//   51 #define FA_MODIFIED	0x40	/* File has been modified */
//   52 #define FA_DIRTY	0x80	/* FIL.buf[] needs to be written-back */
//   53 
//   54 
//   55 /* Name status flags in fn[11] */
//   56 #define NSFLAG		11		/* Index of the name status byte */
//   57 #define NS_LOSS		0x01	/* Out of 8.3 format */
//   58 #define NS_LFN		0x02	/* Force to create LFN entry */
//   59 #define NS_LAST		0x04	/* Last segment */
//   60 #define NS_BODY		0x08	/* Lower case flag (body) */
//   61 #define NS_EXT		0x10	/* Lower case flag (ext) */
//   62 #define NS_DOT		0x20	/* Dot entry */
//   63 #define NS_NOLFN	0x40	/* Do not find LFN */
//   64 #define NS_NONAME	0x80	/* Not followed */
//   65 
//   66 
//   67 /* Limits and boundaries */
//   68 #define MAX_DIR		0x200000		/* Max size of FAT directory */
//   69 #define MAX_DIR_EX	0x10000000		/* Max size of exFAT directory */
//   70 #define MAX_FAT12	0xFF5			/* Max FAT12 clusters (differs from specs, but correct for real DOS/Windows behavior) */
//   71 #define MAX_FAT16	0xFFF5			/* Max FAT16 clusters (differs from specs, but correct for real DOS/Windows behavior) */
//   72 #define MAX_FAT32	0x0FFFFFF5		/* Max FAT32 clusters (not specified, practical limit) */
//   73 #define MAX_EXFAT	0x7FFFFFFD		/* Max exFAT clusters (differs from specs, implementation limit) */
//   74 
//   75 
//   76 /* FatFs refers the FAT structure as simple byte array instead of structure member
//   77 / because the C structure is not binary compatible between different platforms */
//   78 
//   79 #define BS_JmpBoot			0		/* x86 jump instruction (3-byte) */
//   80 #define BS_OEMName			3		/* OEM name (8-byte) */
//   81 #define BPB_BytsPerSec		11		/* Sector size [byte] (WORD) */
//   82 #define BPB_SecPerClus		13		/* Cluster size [sector] (BYTE) */
//   83 #define BPB_RsvdSecCnt		14		/* Size of reserved area [sector] (WORD) */
//   84 #define BPB_NumFATs			16		/* Number of FATs (BYTE) */
//   85 #define BPB_RootEntCnt		17		/* Size of root directory area for FAT [entry] (WORD) */
//   86 #define BPB_TotSec16		19		/* Volume size (16-bit) [sector] (WORD) */
//   87 #define BPB_Media			21		/* Media descriptor byte (BYTE) */
//   88 #define BPB_FATSz16			22		/* FAT size (16-bit) [sector] (WORD) */
//   89 #define BPB_SecPerTrk		24		/* Number of sectors per track for int13h [sector] (WORD) */
//   90 #define BPB_NumHeads		26		/* Number of heads for int13h (WORD) */
//   91 #define BPB_HiddSec			28		/* Volume offset from top of the drive (DWORD) */
//   92 #define BPB_TotSec32		32		/* Volume size (32-bit) [sector] (DWORD) */
//   93 #define BS_DrvNum			36		/* Physical drive number for int13h (BYTE) */
//   94 #define BS_NTres			37		/* WindowsNT error flag (BYTE) */
//   95 #define BS_BootSig			38		/* Extended boot signature (BYTE) */
//   96 #define BS_VolID			39		/* Volume serial number (DWORD) */
//   97 #define BS_VolLab			43		/* Volume label string (8-byte) */
//   98 #define BS_FilSysType		54		/* Filesystem type string (8-byte) */
//   99 #define BS_BootCode			62		/* Boot code (448-byte) */
//  100 #define BS_55AA				510		/* Signature word (WORD) */
//  101 
//  102 #define BPB_FATSz32			36		/* FAT32: FAT size [sector] (DWORD) */
//  103 #define BPB_ExtFlags32		40		/* FAT32: Extended flags (WORD) */
//  104 #define BPB_FSVer32			42		/* FAT32: Filesystem version (WORD) */
//  105 #define BPB_RootClus32		44		/* FAT32: Root directory cluster (DWORD) */
//  106 #define BPB_FSInfo32		48		/* FAT32: Offset of FSINFO sector (WORD) */
//  107 #define BPB_BkBootSec32		50		/* FAT32: Offset of backup boot sector (WORD) */
//  108 #define BS_DrvNum32			64		/* FAT32: Physical drive number for int13h (BYTE) */
//  109 #define BS_NTres32			65		/* FAT32: Error flag (BYTE) */
//  110 #define BS_BootSig32		66		/* FAT32: Extended boot signature (BYTE) */
//  111 #define BS_VolID32			67		/* FAT32: Volume serial number (DWORD) */
//  112 #define BS_VolLab32			71		/* FAT32: Volume label string (8-byte) */
//  113 #define BS_FilSysType32		82		/* FAT32: Filesystem type string (8-byte) */
//  114 #define BS_BootCode32		90		/* FAT32: Boot code (420-byte) */
//  115 
//  116 #define BPB_ZeroedEx		11		/* exFAT: MBZ field (53-byte) */
//  117 #define BPB_VolOfsEx		64		/* exFAT: Volume offset from top of the drive [sector] (QWORD) */
//  118 #define BPB_TotSecEx		72		/* exFAT: Volume size [sector] (QWORD) */
//  119 #define BPB_FatOfsEx		80		/* exFAT: FAT offset from top of the volume [sector] (DWORD) */
//  120 #define BPB_FatSzEx			84		/* exFAT: FAT size [sector] (DWORD) */
//  121 #define BPB_DataOfsEx		88		/* exFAT: Data offset from top of the volume [sector] (DWORD) */
//  122 #define BPB_NumClusEx		92		/* exFAT: Number of clusters (DWORD) */
//  123 #define BPB_RootClusEx		96		/* exFAT: Root directory start cluster (DWORD) */
//  124 #define BPB_VolIDEx			100		/* exFAT: Volume serial number (DWORD) */
//  125 #define BPB_FSVerEx			104		/* exFAT: Filesystem version (WORD) */
//  126 #define BPB_VolFlagEx		106		/* exFAT: Volume flags (BYTE) */
//  127 #define BPB_ActFatEx		107		/* exFAT: Active FAT flags (BYTE) */
//  128 #define BPB_BytsPerSecEx	108		/* exFAT: Log2 of sector size in unit of byte (BYTE) */
//  129 #define BPB_SecPerClusEx	109		/* exFAT: Log2 of cluster size in unit of sector (BYTE) */
//  130 #define BPB_NumFATsEx		110		/* exFAT: Number of FATs (BYTE) */
//  131 #define BPB_DrvNumEx		111		/* exFAT: Physical drive number for int13h (BYTE) */
//  132 #define BPB_PercInUseEx		112		/* exFAT: Percent in use (BYTE) */
//  133 #define BPB_RsvdEx			113		/* exFAT: Reserved (7-byte) */
//  134 #define BS_BootCodeEx		120		/* exFAT: Boot code (390-byte) */
//  135 
//  136 #define DIR_Name			0		/* Short file name (11-byte) */
//  137 #define DIR_Attr			11		/* Attribute (BYTE) */
//  138 #define DIR_NTres			12		/* Lower case flag (BYTE) */
//  139 #define DIR_CrtTime10		13		/* Created time sub-second (BYTE) */
//  140 #define DIR_CrtTime			14		/* Created time (DWORD) */
//  141 #define DIR_LstAccDate		18		/* Last accessed date (WORD) */
//  142 #define DIR_FstClusHI		20		/* Higher 16-bit of first cluster (WORD) */
//  143 #define DIR_ModTime			22		/* Modified time (DWORD) */
//  144 #define DIR_FstClusLO		26		/* Lower 16-bit of first cluster (WORD) */
//  145 #define DIR_FileSize		28		/* File size (DWORD) */
//  146 #define LDIR_Ord			0		/* LFN: LFN order and LLE flag (BYTE) */
//  147 #define LDIR_Attr			11		/* LFN: LFN attribute (BYTE) */
//  148 #define LDIR_Type			12		/* LFN: Entry type (BYTE) */
//  149 #define LDIR_Chksum			13		/* LFN: Checksum of the SFN (BYTE) */
//  150 #define LDIR_FstClusLO		26		/* LFN: MBZ field (WORD) */
//  151 #define XDIR_Type			0		/* exFAT: Type of exFAT directory entry (BYTE) */
//  152 #define XDIR_NumLabel		1		/* exFAT: Number of volume label characters (BYTE) */
//  153 #define XDIR_Label			2		/* exFAT: Volume label (11-WORD) */
//  154 #define XDIR_CaseSum		4		/* exFAT: Sum of case conversion table (DWORD) */
//  155 #define XDIR_NumSec			1		/* exFAT: Number of secondary entries (BYTE) */
//  156 #define XDIR_SetSum			2		/* exFAT: Sum of the set of directory entries (WORD) */
//  157 #define XDIR_Attr			4		/* exFAT: File attribute (WORD) */
//  158 #define XDIR_CrtTime		8		/* exFAT: Created time (DWORD) */
//  159 #define XDIR_ModTime		12		/* exFAT: Modified time (DWORD) */
//  160 #define XDIR_AccTime		16		/* exFAT: Last accessed time (DWORD) */
//  161 #define XDIR_CrtTime10		20		/* exFAT: Created time subsecond (BYTE) */
//  162 #define XDIR_ModTime10		21		/* exFAT: Modified time subsecond (BYTE) */
//  163 #define XDIR_CrtTZ			22		/* exFAT: Created timezone (BYTE) */
//  164 #define XDIR_ModTZ			23		/* exFAT: Modified timezone (BYTE) */
//  165 #define XDIR_AccTZ			24		/* exFAT: Last accessed timezone (BYTE) */
//  166 #define XDIR_GenFlags		33		/* exFAT: General secondary flags (BYTE) */
//  167 #define XDIR_NumName		35		/* exFAT: Number of file name characters (BYTE) */
//  168 #define XDIR_NameHash		36		/* exFAT: Hash of file name (WORD) */
//  169 #define XDIR_ValidFileSize	40		/* exFAT: Valid file size (QWORD) */
//  170 #define XDIR_FstClus		52		/* exFAT: First cluster of the file data (DWORD) */
//  171 #define XDIR_FileSize		56		/* exFAT: File/Directory size (QWORD) */
//  172 
//  173 #define SZDIRE				32		/* Size of a directory entry */
//  174 #define DDEM				0xE5	/* Deleted directory entry mark set to DIR_Name[0] */
//  175 #define RDDEM				0x05	/* Replacement of the character collides with DDEM */
//  176 #define LLEF				0x40	/* Last long entry flag in LDIR_Ord */
//  177 
//  178 #define FSI_LeadSig			0		/* FAT32 FSI: Leading signature (DWORD) */
//  179 #define FSI_StrucSig		484		/* FAT32 FSI: Structure signature (DWORD) */
//  180 #define FSI_Free_Count		488		/* FAT32 FSI: Number of free clusters (DWORD) */
//  181 #define FSI_Nxt_Free		492		/* FAT32 FSI: Last allocated cluster (DWORD) */
//  182 
//  183 #define MBR_Table			446		/* MBR: Offset of partition table in the MBR */
//  184 #define SZ_PTE				16		/* MBR: Size of a partition table entry */
//  185 #define PTE_Boot			0		/* MBR PTE: Boot indicator */
//  186 #define PTE_StHead			1		/* MBR PTE: Start head */
//  187 #define PTE_StSec			2		/* MBR PTE: Start sector */
//  188 #define PTE_StCyl			3		/* MBR PTE: Start cylinder */
//  189 #define PTE_System			4		/* MBR PTE: System ID */
//  190 #define PTE_EdHead			5		/* MBR PTE: End head */
//  191 #define PTE_EdSec			6		/* MBR PTE: End sector */
//  192 #define PTE_EdCyl			7		/* MBR PTE: End cylinder */
//  193 #define PTE_StLba			8		/* MBR PTE: Start in LBA */
//  194 #define PTE_SizLba			12		/* MBR PTE: Size in LBA */
//  195 
//  196 
//  197 /* Post process after fatal error on file operation */
//  198 #define ABORT(fs, res)		{ fp->err = (BYTE)(res); LEAVE_FF(fs, res); }
//  199 
//  200 
//  201 /* Reentrancy related */
//  202 #if FF_FS_REENTRANT
//  203 #if FF_USE_LFN == 1
//  204 #error Static LFN work area cannot be used at thread-safe configuration
//  205 #endif
//  206 #define LEAVE_FF(fs, res)	{ unlock_fs(fs, res); return res; }
//  207 #else
//  208 #define LEAVE_FF(fs, res)	return res
//  209 #endif
//  210 
//  211 
//  212 /* Definitions of volume - partition conversion */
//  213 #if FF_MULTI_PARTITION
//  214 #define LD2PD(vol) VolToPart[vol].pd	/* Get physical drive number */
//  215 #define LD2PT(vol) VolToPart[vol].pt	/* Get partition index */
//  216 #else
//  217 #define LD2PD(vol) (BYTE)(vol)	/* Each logical drive is bound to the same physical drive number */
//  218 #define LD2PT(vol) 0			/* Find first valid partition or in SFD */
//  219 #endif
//  220 
//  221 
//  222 /* Definitions of sector size */
//  223 #if (FF_MAX_SS < FF_MIN_SS) || (FF_MAX_SS != 512 && FF_MAX_SS != 1024 && FF_MAX_SS != 2048 && FF_MAX_SS != 4096) || (FF_MIN_SS != 512 && FF_MIN_SS != 1024 && FF_MIN_SS != 2048 && FF_MIN_SS != 4096)
//  224 #error Wrong sector size configuration
//  225 #endif
//  226 #if FF_MAX_SS == FF_MIN_SS
//  227 #define SS(fs)	((UINT)FF_MAX_SS)	/* Fixed sector size */
//  228 #else
//  229 #define SS(fs)	((fs)->ssize)	/* Variable sector size */
//  230 #endif
//  231 
//  232 
//  233 /* Timestamp */
//  234 #if FF_FS_NORTC == 1
//  235 #if FF_NORTC_YEAR < 1980 || FF_NORTC_YEAR > 2107 || FF_NORTC_MON < 1 || FF_NORTC_MON > 12 || FF_NORTC_MDAY < 1 || FF_NORTC_MDAY > 31
//  236 #error Invalid FF_FS_NORTC settings
//  237 #endif
//  238 #define GET_FATTIME()	((DWORD)(FF_NORTC_YEAR - 1980) << 25 | (DWORD)FF_NORTC_MON << 21 | (DWORD)FF_NORTC_MDAY << 16)
//  239 #else
//  240 #define GET_FATTIME()	get_fattime()
//  241 #endif
//  242 
//  243 
//  244 /* File lock controls */
//  245 #if FF_FS_LOCK != 0
//  246 #if FF_FS_READONLY
//  247 #error FF_FS_LOCK must be 0 at read-only configuration
//  248 #endif
//  249 typedef struct {
//  250 	FATFS *fs;		/* Object ID 1, volume (NULL:blank entry) */
//  251 	DWORD clu;		/* Object ID 2, containing directory (0:root) */
//  252 	DWORD ofs;		/* Object ID 3, offset in the directory */
//  253 	WORD ctr;		/* Object open counter, 0:none, 0x01..0xFF:read mode open count, 0x100:write mode */
//  254 } FILESEM;
//  255 #endif
//  256 
//  257 
//  258 /* SBCS up-case tables (\x80-\xFF) */
//  259 #define TBL_CT437  {0x80,0x9A,0x45,0x41,0x8E,0x41,0x8F,0x80,0x45,0x45,0x45,0x49,0x49,0x49,0x8E,0x8F, \ 
//  260 					0x90,0x92,0x92,0x4F,0x99,0x4F,0x55,0x55,0x59,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  261 					0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF, \ 
//  262 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  263 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  264 					0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  265 					0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF, \ 
//  266 					0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  267 #define TBL_CT720  {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F, \ 
//  268 					0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  269 					0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF, \ 
//  270 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  271 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  272 					0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  273 					0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF, \ 
//  274 					0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  275 #define TBL_CT737  {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F, \ 
//  276 					0x90,0x92,0x92,0x93,0x94,0x95,0x96,0x97,0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87, \ 
//  277 					0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0xAA,0x92,0x93,0x94,0x95,0x96, \ 
//  278 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  279 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  280 					0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  281 					0x97,0xEA,0xEB,0xEC,0xE4,0xED,0xEE,0xEF,0xF5,0xF0,0xEA,0xEB,0xEC,0xED,0xEE,0xEF, \ 
//  282 					0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  283 #define TBL_CT771  {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F, \ 
//  284 					0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  285 					0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F, \ 
//  286 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  287 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  288 					0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDC,0xDE,0xDE, \ 
//  289 					0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  290 					0xF0,0xF0,0xF2,0xF2,0xF4,0xF4,0xF6,0xF6,0xF8,0xF8,0xFA,0xFA,0xFC,0xFC,0xFE,0xFF}
//  291 #define TBL_CT775  {0x80,0x9A,0x91,0xA0,0x8E,0x95,0x8F,0x80,0xAD,0xED,0x8A,0x8A,0xA1,0x8D,0x8E,0x8F, \ 
//  292 					0x90,0x92,0x92,0xE2,0x99,0x95,0x96,0x97,0x97,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \ 
//  293 					0xA0,0xA1,0xE0,0xA3,0xA3,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF, \ 
//  294 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  295 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  296 					0xB5,0xB6,0xB7,0xB8,0xBD,0xBE,0xC6,0xC7,0xA5,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  297 					0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE3,0xE8,0xE8,0xEA,0xEA,0xEE,0xED,0xEE,0xEF, \ 
//  298 					0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  299 #define TBL_CT850  {0x43,0x55,0x45,0x41,0x41,0x41,0x41,0x43,0x45,0x45,0x45,0x49,0x49,0x49,0x41,0x41, \ 
//  300 					0x45,0x92,0x92,0x4F,0x4F,0x4F,0x55,0x55,0x59,0x4F,0x55,0x4F,0x9C,0x4F,0x9E,0x9F, \ 
//  301 					0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF, \ 
//  302 					0xB0,0xB1,0xB2,0xB3,0xB4,0x41,0x41,0x41,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  303 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0x41,0x41,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  304 					0xD1,0xD1,0x45,0x45,0x45,0x49,0x49,0x49,0x49,0xD9,0xDA,0xDB,0xDC,0xDD,0x49,0xDF, \ 
//  305 					0x4F,0xE1,0x4F,0x4F,0x4F,0x4F,0xE6,0xE8,0xE8,0x55,0x55,0x55,0x59,0x59,0xEE,0xEF, \ 
//  306 					0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  307 #define TBL_CT852  {0x80,0x9A,0x90,0xB6,0x8E,0xDE,0x8F,0x80,0x9D,0xD3,0x8A,0x8A,0xD7,0x8D,0x8E,0x8F, \ 
//  308 					0x90,0x91,0x91,0xE2,0x99,0x95,0x95,0x97,0x97,0x99,0x9A,0x9B,0x9B,0x9D,0x9E,0xAC, \ 
//  309 					0xB5,0xD6,0xE0,0xE9,0xA4,0xA4,0xA6,0xA6,0xA8,0xA8,0xAA,0x8D,0xAC,0xB8,0xAE,0xAF, \ 
//  310 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBD,0xBF, \ 
//  311 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC6,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  312 					0xD1,0xD1,0xD2,0xD3,0xD2,0xD5,0xD6,0xD7,0xB7,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  313 					0xE0,0xE1,0xE2,0xE3,0xE3,0xD5,0xE6,0xE6,0xE8,0xE9,0xE8,0xEB,0xED,0xED,0xDD,0xEF, \ 
//  314 					0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xEB,0xFC,0xFC,0xFE,0xFF}
//  315 #define TBL_CT855  {0x81,0x81,0x83,0x83,0x85,0x85,0x87,0x87,0x89,0x89,0x8B,0x8B,0x8D,0x8D,0x8F,0x8F, \ 
//  316 					0x91,0x91,0x93,0x93,0x95,0x95,0x97,0x97,0x99,0x99,0x9B,0x9B,0x9D,0x9D,0x9F,0x9F, \ 
//  317 					0xA1,0xA1,0xA3,0xA3,0xA5,0xA5,0xA7,0xA7,0xA9,0xA9,0xAB,0xAB,0xAD,0xAD,0xAE,0xAF, \ 
//  318 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB6,0xB6,0xB8,0xB8,0xB9,0xBA,0xBB,0xBC,0xBE,0xBE,0xBF, \ 
//  319 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  320 					0xD1,0xD1,0xD3,0xD3,0xD5,0xD5,0xD7,0xD7,0xDD,0xD9,0xDA,0xDB,0xDC,0xDD,0xE0,0xDF, \ 
//  321 					0xE0,0xE2,0xE2,0xE4,0xE4,0xE6,0xE6,0xE8,0xE8,0xEA,0xEA,0xEC,0xEC,0xEE,0xEE,0xEF, \ 
//  322 					0xF0,0xF2,0xF2,0xF4,0xF4,0xF6,0xF6,0xF8,0xF8,0xFA,0xFA,0xFC,0xFC,0xFD,0xFE,0xFF}
//  323 #define TBL_CT857  {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0x49,0x8E,0x8F, \ 
//  324 					0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x98,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9E, \ 
//  325 					0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA6,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF, \ 
//  326 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  327 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  328 					0xD0,0xD1,0xD2,0xD3,0xD4,0x49,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  329 					0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xDE,0xED,0xEE,0xEF, \ 
//  330 					0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  331 #define TBL_CT860  {0x80,0x9A,0x90,0x8F,0x8E,0x91,0x86,0x80,0x89,0x89,0x92,0x8B,0x8C,0x98,0x8E,0x8F, \ 
//  332 					0x90,0x91,0x92,0x8C,0x99,0xA9,0x96,0x9D,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  333 					0x86,0x8B,0x9F,0x96,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF, \ 
//  334 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  335 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  336 					0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  337 					0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF, \ 
//  338 					0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  339 #define TBL_CT861  {0x80,0x9A,0x90,0x41,0x8E,0x41,0x8F,0x80,0x45,0x45,0x45,0x8B,0x8B,0x8D,0x8E,0x8F, \ 
//  340 					0x90,0x92,0x92,0x4F,0x99,0x8D,0x55,0x97,0x97,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \ 
//  341 					0xA4,0xA5,0xA6,0xA7,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF, \ 
//  342 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  343 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  344 					0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  345 					0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF, \ 
//  346 					0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  347 #define TBL_CT862  {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F, \ 
//  348 					0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  349 					0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF, \ 
//  350 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  351 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  352 					0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  353 					0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF, \ 
//  354 					0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  355 #define TBL_CT863  {0x43,0x55,0x45,0x41,0x41,0x41,0x86,0x43,0x45,0x45,0x45,0x49,0x49,0x8D,0x41,0x8F, \ 
//  356 					0x45,0x45,0x45,0x4F,0x45,0x49,0x55,0x55,0x98,0x4F,0x55,0x9B,0x9C,0x55,0x55,0x9F, \ 
//  357 					0xA0,0xA1,0x4F,0x55,0xA4,0xA5,0xA6,0xA7,0x49,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF, \ 
//  358 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  359 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  360 					0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  361 					0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF, \ 
//  362 					0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  363 #define TBL_CT864  {0x80,0x9A,0x45,0x41,0x8E,0x41,0x8F,0x80,0x45,0x45,0x45,0x49,0x49,0x49,0x8E,0x8F, \ 
//  364 					0x90,0x92,0x92,0x4F,0x99,0x4F,0x55,0x55,0x59,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  365 					0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF, \ 
//  366 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  367 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  368 					0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  369 					0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF, \ 
//  370 					0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  371 #define TBL_CT865  {0x80,0x9A,0x90,0x41,0x8E,0x41,0x8F,0x80,0x45,0x45,0x45,0x49,0x49,0x49,0x8E,0x8F, \ 
//  372 					0x90,0x92,0x92,0x4F,0x99,0x4F,0x55,0x55,0x59,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  373 					0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF, \ 
//  374 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  375 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  376 					0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  377 					0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF, \ 
//  378 					0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  379 #define TBL_CT866  {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F, \ 
//  380 					0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  381 					0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F, \ 
//  382 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  383 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  384 					0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  385 					0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  386 					0xF0,0xF0,0xF2,0xF2,0xF4,0xF4,0xF6,0xF6,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  387 #define TBL_CT869  {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F, \ 
//  388 					0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x86,0x9C,0x8D,0x8F,0x90, \ 
//  389 					0x91,0x90,0x92,0x95,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF, \ 
//  390 					0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  391 					0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF, \ 
//  392 					0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xA4,0xA5,0xA6,0xD9,0xDA,0xDB,0xDC,0xA7,0xA8,0xDF, \ 
//  393 					0xA9,0xAA,0xAC,0xAD,0xB5,0xB6,0xB7,0xB8,0xBD,0xBE,0xC6,0xC7,0xCF,0xCF,0xD0,0xEF, \ 
//  394 					0xF0,0xF1,0xD1,0xD2,0xD3,0xF5,0xD4,0xF7,0xF8,0xF9,0xD5,0x96,0x95,0x98,0xFE,0xFF}
//  395 
//  396 
//  397 /* DBCS code range |----- 1st byte -----|  |----------- 2nd byte -----------| */
//  398 #define TBL_DC932 {0x81, 0x9F, 0xE0, 0xFC, 0x40, 0x7E, 0x80, 0xFC, 0x00, 0x00}
//  399 #define TBL_DC936 {0x81, 0xFE, 0x00, 0x00, 0x40, 0x7E, 0x80, 0xFE, 0x00, 0x00}
//  400 #define TBL_DC949 {0x81, 0xFE, 0x00, 0x00, 0x41, 0x5A, 0x61, 0x7A, 0x81, 0xFE}
//  401 #define TBL_DC950 {0x81, 0xFE, 0x00, 0x00, 0x40, 0x7E, 0xA1, 0xFE, 0x00, 0x00}
//  402 
//  403 
//  404 /* Macros for table definitions */
//  405 #define MERGE_2STR(a, b) a ## b
//  406 #define MKCVTBL(hd, cp) MERGE_2STR(hd, cp)
//  407 
//  408 
//  409 
//  410 
//  411 /*--------------------------------------------------------------------------
//  412 
//  413    Module Private Work Area
//  414 
//  415 ---------------------------------------------------------------------------*/
//  416 /* Remark: Variables defined here without initial value shall be guaranteed
//  417 /  zero/null at start-up. If not, the linker option or start-up routine is
//  418 /  not compliance with C standard. */
//  419 
//  420 /*--------------------------------*/
//  421 /* File/Volume controls           */
//  422 /*--------------------------------*/
//  423 
//  424 #if FF_VOLUMES < 1 || FF_VOLUMES > 10
//  425 #error Wrong FF_VOLUMES setting
//  426 #endif

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  427 static FATFS *FatFs[FF_VOLUMES];	/* Pointer to the filesystem objects (logical drives) */
FatFs:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//  428 static WORD Fsid;					/* File system mount ID */
Fsid:
        DS8 2

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\"*+,:;<=>?[]|\\177">`:
        DATA
        DC8 "\"*+,:;<=>?[]|\177"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "FAT"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "FAT32">`:
        DATA
        DC8 "FAT32"
        DC8 0, 0
//  429 
//  430 #if FF_FS_RPATH != 0 && FF_VOLUMES >= 2
//  431 static BYTE CurrVol;				/* Current drive */
//  432 #endif
//  433 
//  434 #if FF_FS_LOCK != 0
//  435 static FILESEM Files[FF_FS_LOCK];	/* Open object lock semaphores */
//  436 #endif
//  437 
//  438 
//  439 /*--------------------------------*/
//  440 /* LFN/Directory working buffer   */
//  441 /*--------------------------------*/
//  442 
//  443 #if FF_USE_LFN == 0		/* Non-LFN configuration */
//  444 #define DEF_NAMBUF
//  445 #define INIT_NAMBUF(fs)
//  446 #define FREE_NAMBUF()
//  447 
//  448 #else					/* LFN configurations */
//  449 #if FF_MAX_LFN < 12 || FF_MAX_LFN > 255
//  450 #error Wrong FF_MAX_LFN setting
//  451 #endif
//  452 static const BYTE LfnOfs[] = {1,3,5,7,9,14,16,18,20,22,24,28,30};	/* FAT: Offset of LFN characters in the directory entry */
//  453 #define MAXDIRB(nc)	((nc + 44U) / 15 * SZDIRE)	/* exFAT: Size of directory entry block scratchpad buffer needed for the max name length */
//  454 
//  455 #if FF_USE_LFN == 1		/* LFN enabled with static working buffer */
//  456 #if FF_FS_EXFAT
//  457 static BYTE	DirBuf[MAXDIRB(FF_MAX_LFN)];	/* Directory entry block scratchpad buffer */
//  458 #endif
//  459 static WCHAR LfnBuf[FF_MAX_LFN + 1];		/* LFN working buffer */
//  460 #define DEF_NAMBUF
//  461 #define INIT_NAMBUF(fs)
//  462 #define FREE_NAMBUF()
//  463 
//  464 #elif FF_USE_LFN == 2 	/* LFN enabled with dynamic working buffer on the stack */
//  465 #if FF_FS_EXFAT
//  466 #define DEF_NAMBUF		WCHAR lbuf[FF_MAX_LFN+1]; BYTE dbuf[MAXDIRB(FF_MAX_LFN)];	/* LFN working buffer and directory entry block scratchpad buffer */
//  467 #define INIT_NAMBUF(fs)	{ (fs)->lfnbuf = lbuf; (fs)->dirbuf = dbuf; }
//  468 #define FREE_NAMBUF()
//  469 #else
//  470 #define DEF_NAMBUF		WCHAR lbuf[FF_MAX_LFN+1];	/* LFN working buffer */
//  471 #define INIT_NAMBUF(fs)	{ (fs)->lfnbuf = lbuf; }
//  472 #define FREE_NAMBUF()
//  473 #endif
//  474 
//  475 #elif FF_USE_LFN == 3 	/* LFN enabled with dynamic working buffer on the heap */
//  476 #if FF_FS_EXFAT
//  477 #define DEF_NAMBUF		WCHAR *lfn;	/* Pointer to LFN working buffer and directory entry block scratchpad buffer */
//  478 #define INIT_NAMBUF(fs)	{ lfn = ff_memalloc((FF_MAX_LFN+1)*2 + MAXDIRB(FF_MAX_LFN)); if (!lfn) LEAVE_FF(fs, FR_NOT_ENOUGH_CORE); (fs)->lfnbuf = lfn; (fs)->dirbuf = (BYTE*)(lfn+FF_MAX_LFN+1); }
//  479 #define FREE_NAMBUF()	ff_memfree(lfn)
//  480 #else
//  481 #define DEF_NAMBUF		WCHAR *lfn;	/* Pointer to LFN working buffer */
//  482 #define INIT_NAMBUF(fs)	{ lfn = ff_memalloc((FF_MAX_LFN+1)*2); if (!lfn) LEAVE_FF(fs, FR_NOT_ENOUGH_CORE); (fs)->lfnbuf = lfn; }
//  483 #define FREE_NAMBUF()	ff_memfree(lfn)
//  484 #endif
//  485 
//  486 #else
//  487 #error Wrong FF_USE_LFN setting
//  488 
//  489 #endif
//  490 #endif
//  491 
//  492 
//  493 /*--------------------------------*/
//  494 /* Code conversion tables         */
//  495 /*--------------------------------*/
//  496 
//  497 #if FF_CODE_PAGE == 0		/* Run-time code page configuration */
//  498 #define CODEPAGE CodePage
//  499 static WORD CodePage;	/* Current code page */
//  500 static const BYTE *ExCvt, *DbcTbl;	/* Pointer to current SBCS up-case table and DBCS code range table below */
//  501 static const BYTE Ct437[] = TBL_CT437;
//  502 static const BYTE Ct720[] = TBL_CT720;
//  503 static const BYTE Ct737[] = TBL_CT737;
//  504 static const BYTE Ct771[] = TBL_CT771;
//  505 static const BYTE Ct775[] = TBL_CT775;
//  506 static const BYTE Ct850[] = TBL_CT850;
//  507 static const BYTE Ct852[] = TBL_CT852;
//  508 static const BYTE Ct855[] = TBL_CT855;
//  509 static const BYTE Ct857[] = TBL_CT857;
//  510 static const BYTE Ct860[] = TBL_CT860;
//  511 static const BYTE Ct861[] = TBL_CT861;
//  512 static const BYTE Ct862[] = TBL_CT862;
//  513 static const BYTE Ct863[] = TBL_CT863;
//  514 static const BYTE Ct864[] = TBL_CT864;
//  515 static const BYTE Ct865[] = TBL_CT865;
//  516 static const BYTE Ct866[] = TBL_CT866;
//  517 static const BYTE Ct869[] = TBL_CT869;
//  518 static const BYTE Dc932[] = TBL_DC932;
//  519 static const BYTE Dc936[] = TBL_DC936;
//  520 static const BYTE Dc949[] = TBL_DC949;
//  521 static const BYTE Dc950[] = TBL_DC950;
//  522 
//  523 #elif FF_CODE_PAGE < 900	/* Static code page configuration (SBCS) */
//  524 #define CODEPAGE FF_CODE_PAGE
//  525 static const BYTE ExCvt[] = MKCVTBL(TBL_CT, FF_CODE_PAGE);
//  526 
//  527 #else					/* Static code page configuration (DBCS) */
//  528 #define CODEPAGE FF_CODE_PAGE

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//  529 static const BYTE DbcTbl[] = MKCVTBL(TBL_DC, FF_CODE_PAGE);
DbcTbl:
        DATA
        DC8 129, 159, 224, 252, 64, 126, 128, 252, 0, 0, 0, 0
//  530 
//  531 #endif
//  532 
//  533 
//  534 
//  535 
//  536 /*--------------------------------------------------------------------------
//  537 
//  538    Module Private Functions
//  539 
//  540 ---------------------------------------------------------------------------*/
//  541 
//  542 
//  543 /*-----------------------------------------------------------------------*/
//  544 /* Load/Store multi-byte word in the FAT structure                       */
//  545 /*-----------------------------------------------------------------------*/
//  546 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function ld_word
          CFI NoCalls
        THUMB
//  547 static
//  548 WORD ld_word (const BYTE* ptr)	/*	 Load a 2-byte little-endian word */
//  549 {
//  550 	WORD rv;
//  551 
//  552 	rv = ptr[1];
ld_word:
        LDRB     R1,[R0, #+1]
//  553 	rv = rv << 8 | ptr[0];
        LDRB     R0,[R0, #+0]
        ORRS     R1,R0,R1, LSL #+8
//  554 	return rv;
        MOVS     R0,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  555 }
//  556 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function ld_dword
          CFI NoCalls
        THUMB
//  557 static
//  558 DWORD ld_dword (const BYTE* ptr)	/* Load a 4-byte little-endian word */
//  559 {
//  560 	DWORD rv;
//  561 
//  562 	rv = ptr[3];
ld_dword:
        LDRB     R1,[R0, #+3]
//  563 	rv = rv << 8 | ptr[2];
        LDRB     R2,[R0, #+2]
        ORRS     R1,R2,R1, LSL #+8
//  564 	rv = rv << 8 | ptr[1];
        LDRB     R2,[R0, #+1]
        ORRS     R1,R2,R1, LSL #+8
//  565 	rv = rv << 8 | ptr[0];
        LDRB     R0,[R0, #+0]
        ORRS     R1,R0,R1, LSL #+8
//  566 	return rv;
        MOVS     R0,R1
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  567 }
//  568 
//  569 #if FF_FS_EXFAT
//  570 static
//  571 QWORD ld_qword (const BYTE* ptr)	/* Load an 8-byte little-endian word */
//  572 {
//  573 	QWORD rv;
//  574 
//  575 	rv = ptr[7];
//  576 	rv = rv << 8 | ptr[6];
//  577 	rv = rv << 8 | ptr[5];
//  578 	rv = rv << 8 | ptr[4];
//  579 	rv = rv << 8 | ptr[3];
//  580 	rv = rv << 8 | ptr[2];
//  581 	rv = rv << 8 | ptr[1];
//  582 	rv = rv << 8 | ptr[0];
//  583 	return rv;
//  584 }
//  585 #endif
//  586 
//  587 #if !FF_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function st_word
          CFI NoCalls
        THUMB
//  588 static
//  589 void st_word (BYTE* ptr, WORD val)	/* Store a 2-byte word in little-endian */
//  590 {
//  591 	*ptr++ = (BYTE)val; val >>= 8;
st_word:
        STRB     R1,[R0, #+0]
        ADDS     R0,R0,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
//  592 	*ptr++ = (BYTE)val;
        STRB     R1,[R0, #+0]
        ADDS     R0,R0,#+1
//  593 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  594 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function st_dword
          CFI NoCalls
        THUMB
//  595 static
//  596 void st_dword (BYTE* ptr, DWORD val)	/* Store a 4-byte word in little-endian */
//  597 {
//  598 	*ptr++ = (BYTE)val; val >>= 8;
st_dword:
        STRB     R1,[R0, #+0]
        ADDS     R0,R0,#+1
        LSRS     R1,R1,#+8
//  599 	*ptr++ = (BYTE)val; val >>= 8;
        STRB     R1,[R0, #+0]
        ADDS     R0,R0,#+1
        LSRS     R1,R1,#+8
//  600 	*ptr++ = (BYTE)val; val >>= 8;
        STRB     R1,[R0, #+0]
        ADDS     R0,R0,#+1
        LSRS     R1,R1,#+8
//  601 	*ptr++ = (BYTE)val;
        STRB     R1,[R0, #+0]
        ADDS     R0,R0,#+1
//  602 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  603 
//  604 #if FF_FS_EXFAT
//  605 static
//  606 void st_qword (BYTE* ptr, QWORD val)	/* Store an 8-byte word in little-endian */
//  607 {
//  608 	*ptr++ = (BYTE)val; val >>= 8;
//  609 	*ptr++ = (BYTE)val; val >>= 8;
//  610 	*ptr++ = (BYTE)val; val >>= 8;
//  611 	*ptr++ = (BYTE)val; val >>= 8;
//  612 	*ptr++ = (BYTE)val; val >>= 8;
//  613 	*ptr++ = (BYTE)val; val >>= 8;
//  614 	*ptr++ = (BYTE)val; val >>= 8;
//  615 	*ptr++ = (BYTE)val;
//  616 }
//  617 #endif
//  618 #endif	/* !FF_FS_READONLY */
//  619 
//  620 
//  621 
//  622 /*-----------------------------------------------------------------------*/
//  623 /* String functions                                                      */
//  624 /*-----------------------------------------------------------------------*/
//  625 
//  626 /* Copy memory to memory */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function mem_cpy
          CFI NoCalls
        THUMB
//  627 static
//  628 void mem_cpy (void* dst, const void* src, UINT cnt)
//  629 {
//  630 	BYTE *d = (BYTE*)dst;
//  631 	const BYTE *s = (const BYTE*)src;
//  632 
//  633 	if (cnt != 0) {
mem_cpy:
        CMP      R2,#+0
        BEQ.N    ??mem_cpy_0
//  634 		do {
//  635 			*d++ = *s++;
??mem_cpy_1:
        LDRB     R3,[R1, #+0]
        STRB     R3,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
//  636 		} while (--cnt);
        SUBS     R2,R2,#+1
        CMP      R2,#+0
        BNE.N    ??mem_cpy_1
//  637 	}
//  638 }
??mem_cpy_0:
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  639 
//  640 
//  641 /* Fill memory block */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function mem_set
          CFI NoCalls
        THUMB
//  642 static
//  643 void mem_set (void* dst, int val, UINT cnt)
//  644 {
//  645 	BYTE *d = (BYTE*)dst;
//  646 
//  647 	do {
//  648 		*d++ = (BYTE)val;
mem_set:
??mem_set_0:
        STRB     R1,[R0, #+0]
        ADDS     R0,R0,#+1
//  649 	} while (--cnt);
        SUBS     R2,R2,#+1
        CMP      R2,#+0
        BNE.N    ??mem_set_0
//  650 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  651 
//  652 
//  653 /* Compare memory block */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function mem_cmp
          CFI NoCalls
        THUMB
//  654 static
//  655 int mem_cmp (const void* dst, const void* src, UINT cnt)	/* ZR:same, NZ:different */
//  656 {
mem_cmp:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  657 	const BYTE *d = (const BYTE *)dst, *s = (const BYTE *)src;
//  658 	int r = 0;
        MOVS     R3,#+0
//  659 
//  660 	do {
//  661 		r = *d++ - *s++;
??mem_cmp_0:
        LDRB     R3,[R0, #+0]
        LDRB     R4,[R1, #+0]
        SUBS     R3,R3,R4
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
//  662 	} while (--cnt && r == 0);
        SUBS     R2,R2,#+1
        CMP      R2,#+0
        BEQ.N    ??mem_cmp_1
        CMP      R3,#+0
        BEQ.N    ??mem_cmp_0
//  663 
//  664 	return r;
??mem_cmp_1:
        MOVS     R0,R3
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  665 }
//  666 
//  667 
//  668 /* Check if chr is contained in the string */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function chk_chr
          CFI NoCalls
        THUMB
//  669 static
//  670 int chk_chr (const char* str, int chr)	/* NZ:contained, ZR:not contained */
//  671 {
chk_chr:
        B.N      ??chk_chr_0
//  672 	while (*str && *str != chr) str++;
??chk_chr_1:
        ADDS     R0,R0,#+1
??chk_chr_0:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??chk_chr_2
        LDRB     R2,[R0, #+0]
        CMP      R2,R1
        BNE.N    ??chk_chr_1
//  673 	return *str;
??chk_chr_2:
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  674 }
//  675 
//  676 
//  677 /* Test if the character is DBC 1st byte */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function dbc_1st
          CFI NoCalls
        THUMB
//  678 static
//  679 int dbc_1st (BYTE c)
//  680 {
//  681 #if FF_CODE_PAGE == 0		/* Variable code page */
//  682 	if (DbcTbl && c >= DbcTbl[0]) {
//  683 		if (c <= DbcTbl[1]) return 1;					/* 1st byte range 1 */
//  684 		if (c >= DbcTbl[2] && c <= DbcTbl[3]) return 1;	/* 1st byte range 2 */
//  685 	}
//  686 #elif FF_CODE_PAGE >= 900	/* DBCS fixed code page */
//  687 	if (c >= DbcTbl[0]) {
dbc_1st:
        LDR.W    R1,??DataTable4
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BCC.N    ??dbc_1st_0
//  688 		if (c <= DbcTbl[1]) return 1;
        LDR.W    R1,??DataTable4
        LDRB     R1,[R1, #+1]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCC.N    ??dbc_1st_1
        MOVS     R0,#+1
        B.N      ??dbc_1st_2
//  689 		if (c >= DbcTbl[2] && c <= DbcTbl[3]) return 1;
??dbc_1st_1:
        LDR.W    R1,??DataTable4
        LDRB     R1,[R1, #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BCC.N    ??dbc_1st_0
        LDR.W    R1,??DataTable4
        LDRB     R1,[R1, #+3]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCC.N    ??dbc_1st_0
        MOVS     R0,#+1
        B.N      ??dbc_1st_2
//  690 	}
//  691 #else					/* SBCS fixed code page */
//  692 	if (c) return 0;	/* Always false */
//  693 #endif
//  694 	return 0;
??dbc_1st_0:
        MOVS     R0,#+0
??dbc_1st_2:
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  695 }
//  696 
//  697 
//  698 /* Test if the character is DBC 2nd byte */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function dbc_2nd
          CFI NoCalls
        THUMB
//  699 static
//  700 int dbc_2nd (BYTE c)
//  701 {
//  702 #if FF_CODE_PAGE == 0		/* Variable code page */
//  703 	if (DbcTbl && c >= DbcTbl[4]) {
//  704 		if (c <= DbcTbl[5]) return 1;					/* 2nd byte range 1 */
//  705 		if (c >= DbcTbl[6] && c <= DbcTbl[7]) return 1;	/* 2nd byte range 2 */
//  706 		if (c >= DbcTbl[8] && c <= DbcTbl[9]) return 1;	/* 2nd byte range 3 */
//  707 	}
//  708 #elif FF_CODE_PAGE >= 900	/* DBCD fixed code page */
//  709 	if (c >= DbcTbl[4]) {
dbc_2nd:
        LDR.W    R1,??DataTable4
        LDRB     R1,[R1, #+4]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BCC.N    ??dbc_2nd_0
//  710 		if (c <= DbcTbl[5]) return 1;
        LDR.W    R1,??DataTable4
        LDRB     R1,[R1, #+5]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCC.N    ??dbc_2nd_1
        MOVS     R0,#+1
        B.N      ??dbc_2nd_2
//  711 		if (c >= DbcTbl[6] && c <= DbcTbl[7]) return 1;
??dbc_2nd_1:
        LDR.W    R1,??DataTable4
        LDRB     R1,[R1, #+6]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BCC.N    ??dbc_2nd_3
        LDR.W    R1,??DataTable4
        LDRB     R1,[R1, #+7]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCC.N    ??dbc_2nd_3
        MOVS     R0,#+1
        B.N      ??dbc_2nd_2
//  712 		if (c >= DbcTbl[8] && c <= DbcTbl[9]) return 1;
??dbc_2nd_3:
        LDR.W    R1,??DataTable4
        LDRB     R1,[R1, #+8]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BCC.N    ??dbc_2nd_0
        LDR.W    R1,??DataTable4
        LDRB     R1,[R1, #+9]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0
        BCC.N    ??dbc_2nd_0
        MOVS     R0,#+1
        B.N      ??dbc_2nd_2
//  713 	}
//  714 #else					/* SBCS fixed code page */
//  715 	if (c) return 0;	/* Always false */
//  716 #endif
//  717 	return 0;
??dbc_2nd_0:
        MOVS     R0,#+0
??dbc_2nd_2:
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  718 }
//  719 
//  720 
//  721 
//  722 #if FF_FS_REENTRANT
//  723 /*-----------------------------------------------------------------------*/
//  724 /* Request/Release grant to access the volume                            */
//  725 /*-----------------------------------------------------------------------*/
//  726 static
//  727 int lock_fs (		/* 1:Ok, 0:timeout */
//  728 	FATFS* fs		/* Filesystem object */
//  729 )
//  730 {
//  731 	return ff_req_grant(fs->sobj);
//  732 }
//  733 
//  734 
//  735 static
//  736 void unlock_fs (
//  737 	FATFS* fs,		/* Filesystem object */
//  738 	FRESULT res		/* Result code to be returned */
//  739 )
//  740 {
//  741 	if (fs && res != FR_NOT_ENABLED && res != FR_INVALID_DRIVE && res != FR_TIMEOUT) {
//  742 		ff_rel_grant(fs->sobj);
//  743 	}
//  744 }
//  745 
//  746 #endif
//  747 
//  748 
//  749 
//  750 #if FF_FS_LOCK != 0
//  751 /*-----------------------------------------------------------------------*/
//  752 /* File lock control functions                                           */
//  753 /*-----------------------------------------------------------------------*/
//  754 
//  755 static
//  756 FRESULT chk_lock (	/* Check if the file can be accessed */
//  757 	DIR* dp,		/* Directory object pointing the file to be checked */
//  758 	int acc			/* Desired access type (0:Read mode open, 1:Write mode open, 2:Delete or rename) */
//  759 )
//  760 {
//  761 	UINT i, be;
//  762 
//  763 	/* Search open object table for the object */
//  764 	be = 0;
//  765 	for (i = 0; i < FF_FS_LOCK; i++) {
//  766 		if (Files[i].fs) {	/* Existing entry */
//  767 			if (Files[i].fs == dp->obj.fs &&	 	/* Check if the object matches with an open object */
//  768 				Files[i].clu == dp->obj.sclust &&
//  769 				Files[i].ofs == dp->dptr) break;
//  770 		} else {			/* Blank entry */
//  771 			be = 1;
//  772 		}
//  773 	}
//  774 	if (i == FF_FS_LOCK) {	/* The object has not been opened */
//  775 		return (!be && acc != 2) ? FR_TOO_MANY_OPEN_FILES : FR_OK;	/* Is there a blank entry for new object? */
//  776 	}
//  777 
//  778 	/* The object was opened. Reject any open against writing file and all write mode open */
//  779 	return (acc != 0 || Files[i].ctr == 0x100) ? FR_LOCKED : FR_OK;
//  780 }
//  781 
//  782 
//  783 static
//  784 int enq_lock (void)	/* Check if an entry is available for a new object */
//  785 {
//  786 	UINT i;
//  787 
//  788 	for (i = 0; i < FF_FS_LOCK && Files[i].fs; i++) ;
//  789 	return (i == FF_FS_LOCK) ? 0 : 1;
//  790 }
//  791 
//  792 
//  793 static
//  794 UINT inc_lock (	/* Increment object open counter and returns its index (0:Internal error) */
//  795 	DIR* dp,	/* Directory object pointing the file to register or increment */
//  796 	int acc		/* Desired access (0:Read, 1:Write, 2:Delete/Rename) */
//  797 )
//  798 {
//  799 	UINT i;
//  800 
//  801 
//  802 	for (i = 0; i < FF_FS_LOCK; i++) {	/* Find the object */
//  803 		if (Files[i].fs == dp->obj.fs &&
//  804 			Files[i].clu == dp->obj.sclust &&
//  805 			Files[i].ofs == dp->dptr) break;
//  806 	}
//  807 
//  808 	if (i == FF_FS_LOCK) {				/* Not opened. Register it as new. */
//  809 		for (i = 0; i < FF_FS_LOCK && Files[i].fs; i++) ;
//  810 		if (i == FF_FS_LOCK) return 0;	/* No free entry to register (int err) */
//  811 		Files[i].fs = dp->obj.fs;
//  812 		Files[i].clu = dp->obj.sclust;
//  813 		Files[i].ofs = dp->dptr;
//  814 		Files[i].ctr = 0;
//  815 	}
//  816 
//  817 	if (acc && Files[i].ctr) return 0;	/* Access violation (int err) */
//  818 
//  819 	Files[i].ctr = acc ? 0x100 : Files[i].ctr + 1;	/* Set semaphore value */
//  820 
//  821 	return i + 1;	/* Index number origin from 1 */
//  822 }
//  823 
//  824 
//  825 static
//  826 FRESULT dec_lock (	/* Decrement object open counter */
//  827 	UINT i			/* Semaphore index (1..) */
//  828 )
//  829 {
//  830 	WORD n;
//  831 	FRESULT res;
//  832 
//  833 
//  834 	if (--i < FF_FS_LOCK) {	/* Index number origin from 0 */
//  835 		n = Files[i].ctr;
//  836 		if (n == 0x100) n = 0;		/* If write mode open, delete the entry */
//  837 		if (n > 0) n--;				/* Decrement read mode open count */
//  838 		Files[i].ctr = n;
//  839 		if (n == 0) Files[i].fs = 0;	/* Delete the entry if open count gets zero */
//  840 		res = FR_OK;
//  841 	} else {
//  842 		res = FR_INT_ERR;			/* Invalid index nunber */
//  843 	}
//  844 	return res;
//  845 }
//  846 
//  847 
//  848 static
//  849 void clear_lock (	/* Clear lock entries of the volume */
//  850 	FATFS *fs
//  851 )
//  852 {
//  853 	UINT i;
//  854 
//  855 	for (i = 0; i < FF_FS_LOCK; i++) {
//  856 		if (Files[i].fs == fs) Files[i].fs = 0;
//  857 	}
//  858 }
//  859 
//  860 #endif	/* FF_FS_LOCK != 0 */
//  861 
//  862 
//  863 
//  864 /*-----------------------------------------------------------------------*/
//  865 /* Move/Flush disk access window in the filesystem object                */
//  866 /*-----------------------------------------------------------------------*/
//  867 #if !FF_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function sync_window
        THUMB
//  868 static
//  869 FRESULT sync_window (	/* Returns FR_OK or FR_DISK_ERR */
//  870 	FATFS* fs			/* Filesystem object */
//  871 )
//  872 {
sync_window:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  873 	FRESULT res = FR_OK;
        MOVS     R5,#+0
//  874 
//  875 
//  876 	if (fs->wflag) {	/* Is the disk access window dirty */
        LDRB     R0,[R4, #+3]
        CMP      R0,#+0
        BEQ.N    ??sync_window_0
//  877 		if (disk_write(fs->pdrv, fs->win, fs->winsect, 1) == RES_OK) {	/* Write back the window */
        MOVS     R3,#+1
        LDR      R2,[R4, #+44]
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BNE.N    ??sync_window_1
//  878 			fs->wflag = 0;	/* Clear window dirty flag */
        MOVS     R0,#+0
        STRB     R0,[R4, #+3]
//  879 			if (fs->winsect - fs->fatbase < fs->fsize) {	/* Is it in the 1st FAT? */
        LDR      R0,[R4, #+44]
        LDR      R1,[R4, #+32]
        SUBS     R0,R0,R1
        LDR      R1,[R4, #+24]
        CMP      R0,R1
        BCS.N    ??sync_window_0
//  880 				if (fs->n_fats == 2) disk_write(fs->pdrv, fs->win, fs->winsect + fs->fsize, 1);	/* Reflect it to 2nd FAT if needed */
        LDRB     R0,[R4, #+2]
        CMP      R0,#+2
        BNE.N    ??sync_window_0
        MOVS     R3,#+1
        LDR      R0,[R4, #+44]
        LDR      R1,[R4, #+24]
        ADDS     R2,R1,R0
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_write
        BL       disk_write
        B.N      ??sync_window_0
//  881 			}
//  882 		} else {
//  883 			res = FR_DISK_ERR;
??sync_window_1:
        MOVS     R5,#+1
//  884 		}
//  885 	}
//  886 	return res;
??sync_window_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock10
//  887 }
//  888 #endif
//  889 
//  890 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function move_window
        THUMB
//  891 static
//  892 FRESULT move_window (	/* Returns FR_OK or FR_DISK_ERR */
//  893 	FATFS* fs,			/* Filesystem object */
//  894 	DWORD sector		/* Sector number to make appearance in the fs->win[] */
//  895 )
//  896 {
move_window:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  897 	FRESULT res = FR_OK;
        MOVS     R6,#+0
//  898 
//  899 
//  900 	if (sector != fs->winsect) {	/* Window offset changed? */
        LDR      R0,[R4, #+44]
        CMP      R5,R0
        BEQ.N    ??move_window_0
//  901 #if !FF_FS_READONLY
//  902 		res = sync_window(fs);		/* Write-back changes */
        MOVS     R0,R4
          CFI FunCall sync_window
        BL       sync_window
        MOVS     R6,R0
//  903 #endif
//  904 		if (res == FR_OK) {			/* Fill sector window with new data */
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??move_window_0
//  905 			if (disk_read(fs->pdrv, fs->win, sector, 1) != RES_OK) {
        MOVS     R3,#+1
        MOVS     R2,R5
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??move_window_1
//  906 				sector = 0xFFFFFFFF;	/* Invalidate window if read data is not valid */
        MOVS     R5,#-1
//  907 				res = FR_DISK_ERR;
        MOVS     R6,#+1
//  908 			}
//  909 			fs->winsect = sector;
??move_window_1:
        STR      R5,[R4, #+44]
//  910 		}
//  911 	}
//  912 	return res;
??move_window_0:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock11
//  913 }
//  914 
//  915 
//  916 
//  917 
//  918 #if !FF_FS_READONLY
//  919 /*-----------------------------------------------------------------------*/
//  920 /* Synchronize filesystem and data on the storage                        */
//  921 /*-----------------------------------------------------------------------*/
//  922 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function sync_fs
        THUMB
//  923 static
//  924 FRESULT sync_fs (	/* Returns FR_OK or FR_DISK_ERR */
//  925 	FATFS* fs		/* Filesystem object */
//  926 )
//  927 {
sync_fs:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  928 	FRESULT res;
//  929 
//  930 
//  931 	res = sync_window(fs);
        MOVS     R0,R4
          CFI FunCall sync_window
        BL       sync_window
        MOVS     R5,R0
//  932 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??sync_fs_0
//  933 		if (fs->fs_type == FS_FAT32 && fs->fsi_flag == 1) {	/* FAT32: Update FSInfo sector if needed */
        LDRB     R0,[R4, #+0]
        CMP      R0,#+3
        BNE.N    ??sync_fs_1
        LDRB     R0,[R4, #+4]
        CMP      R0,#+1
        BNE.N    ??sync_fs_1
//  934 			/* Create FSInfo structure */
//  935 			mem_set(fs->win, 0, SS(fs));
        MOV      R2,#+512
        MOVS     R1,#+0
        ADDS     R0,R4,#+48
          CFI FunCall mem_set
        BL       mem_set
//  936 			st_word(fs->win + BS_55AA, 0xAA55);
        MOVW     R1,#+43605
        ADDW     R0,R4,#+558
          CFI FunCall st_word
        BL       st_word
//  937 			st_dword(fs->win + FSI_LeadSig, 0x41615252);
        LDR.W    R1,??DataTable4_1  ;; 0x41615252
        ADDS     R0,R4,#+48
          CFI FunCall st_dword
        BL       st_dword
//  938 			st_dword(fs->win + FSI_StrucSig, 0x61417272);
        LDR.W    R1,??DataTable4_2  ;; 0x61417272
        ADDS     R0,R4,#+532
          CFI FunCall st_dword
        BL       st_dword
//  939 			st_dword(fs->win + FSI_Free_Count, fs->free_clst);
        LDR      R1,[R4, #+16]
        ADDS     R0,R4,#+536
          CFI FunCall st_dword
        BL       st_dword
//  940 			st_dword(fs->win + FSI_Nxt_Free, fs->last_clst);
        LDR      R1,[R4, #+12]
        ADDS     R0,R4,#+540
          CFI FunCall st_dword
        BL       st_dword
//  941 			/* Write it into the FSInfo sector */
//  942 			fs->winsect = fs->volbase + 1;
        LDR      R0,[R4, #+28]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+44]
//  943 			disk_write(fs->pdrv, fs->win, fs->winsect, 1);
        MOVS     R3,#+1
        LDR      R2,[R4, #+44]
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_write
        BL       disk_write
//  944 			fs->fsi_flag = 0;
        MOVS     R0,#+0
        STRB     R0,[R4, #+4]
//  945 		}
//  946 		/* Make sure that no pending write process in the lower layer */
//  947 		if (disk_ioctl(fs->pdrv, CTRL_SYNC, 0) != RES_OK) res = FR_DISK_ERR;
??sync_fs_1:
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_ioctl
        BL       disk_ioctl
        CMP      R0,#+0
        BEQ.N    ??sync_fs_0
        MOVS     R5,#+1
//  948 	}
//  949 
//  950 	return res;
??sync_fs_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock12
//  951 }
//  952 
//  953 #endif
//  954 
//  955 
//  956 
//  957 /*-----------------------------------------------------------------------*/
//  958 /* Get physical sector number from cluster number                        */
//  959 /*-----------------------------------------------------------------------*/
//  960 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function clst2sect
          CFI NoCalls
        THUMB
//  961 static
//  962 DWORD clst2sect (	/* !=0:Sector number, 0:Failed (invalid cluster#) */
//  963 	FATFS* fs,		/* Filesystem object */
//  964 	DWORD clst		/* Cluster# to be converted */
//  965 )
//  966 {
//  967 	clst -= 2;		/* Cluster number is origin from 2 */
clst2sect:
        SUBS     R1,R1,#+2
//  968 	if (clst >= fs->n_fatent - 2) return 0;		/* Is it invalid cluster number? */
        LDR      R2,[R0, #+20]
        SUBS     R2,R2,#+2
        CMP      R1,R2
        BCC.N    ??clst2sect_0
        MOVS     R0,#+0
        B.N      ??clst2sect_1
//  969 	return fs->database + fs->csize * clst;		/* Start sector number of the cluster */
??clst2sect_0:
        LDR      R2,[R0, #+40]
        LDRH     R0,[R0, #+10]
        MLA      R0,R1,R0,R2
??clst2sect_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock13
//  970 }
//  971 
//  972 
//  973 
//  974 
//  975 /*-----------------------------------------------------------------------*/
//  976 /* FAT access - Read value of a FAT entry                                */
//  977 /*-----------------------------------------------------------------------*/
//  978 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function get_fat
        THUMB
//  979 static
//  980 DWORD get_fat (		/* 0xFFFFFFFF:Disk error, 1:Internal error, 2..0x7FFFFFFF:Cluster status */
//  981 	FFOBJID* obj,	/* Corresponding object */
//  982 	DWORD clst		/* Cluster number to get the value */
//  983 )
//  984 {
get_fat:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R1
//  985 	UINT wc, bc;
//  986 	DWORD val;
//  987 	FATFS *fs = obj->fs;
        LDR      R5,[R0, #+0]
//  988 
//  989 
//  990 	if (clst < 2 || clst >= fs->n_fatent) {	/* Check if in valid range */
        CMP      R4,#+2
        BCC.N    ??get_fat_0
        LDR      R0,[R5, #+20]
        CMP      R4,R0
        BCC.N    ??get_fat_1
//  991 		val = 1;	/* Internal error */
??get_fat_0:
        MOVS     R6,#+1
        B.N      ??get_fat_2
//  992 
//  993 	} else {
//  994 		val = 0xFFFFFFFF;	/* Default value falls on disk error */
??get_fat_1:
        MOVS     R6,#-1
//  995 
//  996 		switch (fs->fs_type) {
        LDRB     R0,[R5, #+0]
        CMP      R0,#+1
        BEQ.N    ??get_fat_3
        BCC.N    ??get_fat_4
        CMP      R0,#+3
        BEQ.N    ??get_fat_5
        BCC.N    ??get_fat_6
        B.N      ??get_fat_4
//  997 		case FS_FAT12 :
//  998 			bc = (UINT)clst; bc += bc / 2;
??get_fat_3:
        MOVS     R7,R4
        ADDS     R7,R7,R7, LSR #+1
//  999 			if (move_window(fs, fs->fatbase + (bc / SS(fs))) != FR_OK) break;
        LDR      R0,[R5, #+32]
        ADDS     R1,R0,R7, LSR #+9
        MOVS     R0,R5
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_2
// 1000 			wc = fs->win[bc++ % SS(fs)];		/* Get 1st byte of the entry */
??get_fat_7:
        MOV      R0,#+512
        UDIV     R1,R7,R0
        MLS      R1,R1,R0,R7
        ADDS     R0,R1,R5
        LDRB     R8,[R0, #+48]
        ADDS     R7,R7,#+1
// 1001 			if (move_window(fs, fs->fatbase + (bc / SS(fs))) != FR_OK) break;
        LDR      R0,[R5, #+32]
        ADDS     R1,R0,R7, LSR #+9
        MOVS     R0,R5
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_2
// 1002 			wc |= fs->win[bc % SS(fs)] << 8;	/* Merge 2nd byte of the entry */
??get_fat_8:
        MOV      R0,#+512
        UDIV     R1,R7,R0
        MLS      R1,R1,R0,R7
        ADDS     R0,R1,R5
        LDRB     R0,[R0, #+48]
        ORRS     R8,R8,R0, LSL #+8
// 1003 			val = (clst & 1) ? (wc >> 4) : (wc & 0xFFF);	/* Adjust bit position */
        LSLS     R0,R4,#+31
        BPL.N    ??get_fat_9
        LSRS     R6,R8,#+4
        B.N      ??get_fat_10
??get_fat_9:
        LSLS     R6,R8,#+20       ;; ZeroExtS R6,R8,#+20,#+20
        LSRS     R6,R6,#+20
// 1004 			break;
??get_fat_10:
        B.N      ??get_fat_2
// 1005 
// 1006 		case FS_FAT16 :
// 1007 			if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 2))) != FR_OK) break;
??get_fat_6:
        LDR      R0,[R5, #+32]
        ADDS     R1,R0,R4, LSR #+8
        MOVS     R0,R5
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_2
// 1008 			val = ld_word(fs->win + clst * 2 % SS(fs));		/* Simple WORD array */
??get_fat_11:
        LSLS     R0,R4,#+1
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADDS     R0,R2,R5
        ADDS     R0,R0,#+48
          CFI FunCall ld_word
        BL       ld_word
        MOVS     R6,R0
// 1009 			break;
        B.N      ??get_fat_2
// 1010 
// 1011 		case FS_FAT32 :
// 1012 			if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 4))) != FR_OK) break;
??get_fat_5:
        LDR      R0,[R5, #+32]
        ADDS     R1,R0,R4, LSR #+7
        MOVS     R0,R5
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_2
// 1013 			val = ld_dword(fs->win + clst * 4 % SS(fs)) & 0x0FFFFFFF;	/* Simple DWORD array but mask out upper 4 bits */
??get_fat_12:
        LSLS     R0,R4,#+2
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADDS     R0,R2,R5
        ADDS     R0,R0,#+48
          CFI FunCall ld_dword
        BL       ld_dword
        LSLS     R6,R0,#+4        ;; ZeroExtS R6,R0,#+4,#+4
        LSRS     R6,R6,#+4
// 1014 			break;
        B.N      ??get_fat_2
// 1015 #if FF_FS_EXFAT
// 1016 		case FS_EXFAT :
// 1017 			if (obj->objsize != 0) {
// 1018 				DWORD cofs = clst - obj->sclust;	/* Offset from start cluster */
// 1019 				DWORD clen = (DWORD)((obj->objsize - 1) / SS(fs)) / fs->csize;	/* Number of clusters - 1 */
// 1020 
// 1021 				if (obj->stat == 2 && cofs <= clen) {	/* Is it a contiguous chain? */
// 1022 					val = (cofs == clen) ? 0x7FFFFFFF : clst + 1;	/* No data on the FAT, generate the value */
// 1023 					break;
// 1024 				}
// 1025 				if (obj->stat == 3 && cofs < obj->n_cont) {	/* Is it in the 1st fragment? */
// 1026 					val = clst + 1; 	/* Generate the value */
// 1027 					break;
// 1028 				}
// 1029 				if (obj->stat != 2) {	/* Get value from FAT if FAT chain is valid */
// 1030 					if (obj->n_frag != 0) {	/* Is it on the growing edge? */
// 1031 						val = 0x7FFFFFFF;	/* Generate EOC */
// 1032 					} else {
// 1033 						if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 4))) != FR_OK) break;
// 1034 						val = ld_dword(fs->win + clst * 4 % SS(fs)) & 0x7FFFFFFF;
// 1035 					}
// 1036 					break;
// 1037 				}
// 1038 			}
// 1039 			/* go to default */
// 1040 #endif
// 1041 		default:
// 1042 			val = 1;	/* Internal error */
??get_fat_4:
        MOVS     R6,#+1
// 1043 		}
// 1044 	}
// 1045 
// 1046 	return val;
??get_fat_2:
        MOVS     R0,R6
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock14
// 1047 }
// 1048 
// 1049 
// 1050 
// 1051 
// 1052 #if !FF_FS_READONLY
// 1053 /*-----------------------------------------------------------------------*/
// 1054 /* FAT access - Change value of a FAT entry                              */
// 1055 /*-----------------------------------------------------------------------*/
// 1056 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function put_fat
        THUMB
// 1057 static
// 1058 FRESULT put_fat (	/* FR_OK(0):succeeded, !=0:error */
// 1059 	FATFS* fs,		/* Corresponding filesystem object */
// 1060 	DWORD clst,		/* FAT index number (cluster number) to be changed */
// 1061 	DWORD val		/* New value to be set to the entry */
// 1062 )
// 1063 {
put_fat:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
// 1064 	UINT bc;
// 1065 	BYTE *p;
// 1066 	FRESULT res = FR_INT_ERR;
        MOVS     R7,#+2
// 1067 
// 1068 
// 1069 	if (clst >= 2 && clst < fs->n_fatent) {	/* Check if in valid range */
        CMP      R5,#+2
        BCC.W    ??put_fat_0
        LDR      R0,[R4, #+20]
        CMP      R5,R0
        BCS.W    ??put_fat_0
// 1070 		switch (fs->fs_type) {
        LDRB     R0,[R4, #+0]
        CMP      R0,#+1
        BEQ.N    ??put_fat_1
        BCC.W    ??put_fat_0
        CMP      R0,#+3
        BEQ.N    ??put_fat_2
        BCC.N    ??put_fat_3
        B.N      ??put_fat_0
// 1071 		case FS_FAT12 :
// 1072 			bc = (UINT)clst; bc += bc / 2;	/* bc: byte offset of the entry */
??put_fat_1:
        MOV      R8,R5
        ADDS     R8,R8,R8, LSR #+1
// 1073 			res = move_window(fs, fs->fatbase + (bc / SS(fs)));
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R8, LSR #+9
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        MOVS     R7,R0
// 1074 			if (res != FR_OK) break;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??put_fat_0
// 1075 			p = fs->win + bc++ % SS(fs);
??put_fat_4:
        MOV      R0,#+512
        UDIV     R1,R8,R0
        MLS      R1,R1,R0,R8
        ADDS     R0,R1,R4
        ADDS     R0,R0,#+48
        ADDS     R8,R8,#+1
// 1076 			*p = (clst & 1) ? ((*p & 0x0F) | ((BYTE)val << 4)) : (BYTE)val;		/* Put 1st byte */
        LSLS     R1,R5,#+31
        BPL.N    ??put_fat_5
        LDRB     R1,[R0, #+0]
        ANDS     R1,R1,#0xF
        ORRS     R1,R1,R6, LSL #+4
        B.N      ??put_fat_6
??put_fat_5:
        MOVS     R1,R6
??put_fat_6:
        STRB     R1,[R0, #+0]
// 1077 			fs->wflag = 1;
        MOVS     R0,#+1
        STRB     R0,[R4, #+3]
// 1078 			res = move_window(fs, fs->fatbase + (bc / SS(fs)));
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R8, LSR #+9
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        MOVS     R7,R0
// 1079 			if (res != FR_OK) break;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??put_fat_0
// 1080 			p = fs->win + bc % SS(fs);
??put_fat_7:
        MOV      R0,#+512
        UDIV     R1,R8,R0
        MLS      R1,R1,R0,R8
        ADDS     R0,R1,R4
        ADDS     R0,R0,#+48
// 1081 			*p = (clst & 1) ? (BYTE)(val >> 4) : ((*p & 0xF0) | ((BYTE)(val >> 8) & 0x0F));	/* Put 2nd byte */
        LSLS     R1,R5,#+31
        BPL.N    ??put_fat_8
        LSRS     R1,R6,#+4
        B.N      ??put_fat_9
??put_fat_8:
        LDRB     R1,[R0, #+0]
        ANDS     R1,R1,#0xF0
        LSRS     R2,R6,#+8
        ANDS     R2,R2,#0xF
        ORRS     R1,R2,R1
??put_fat_9:
        STRB     R1,[R0, #+0]
// 1082 			fs->wflag = 1;
        MOVS     R0,#+1
        STRB     R0,[R4, #+3]
// 1083 			break;
        B.N      ??put_fat_0
// 1084 
// 1085 		case FS_FAT16 :
// 1086 			res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 2)));
??put_fat_3:
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R5, LSR #+8
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        MOVS     R7,R0
// 1087 			if (res != FR_OK) break;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??put_fat_0
// 1088 			st_word(fs->win + clst * 2 % SS(fs), (WORD)val);	/* Simple WORD array */
??put_fat_10:
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSLS     R0,R5,#+1
        MOV      R2,#+512
        UDIV     R3,R0,R2
        MLS      R3,R3,R2,R0
        ADDS     R0,R3,R4
        ADDS     R0,R0,#+48
          CFI FunCall st_word
        BL       st_word
// 1089 			fs->wflag = 1;
        MOVS     R0,#+1
        STRB     R0,[R4, #+3]
// 1090 			break;
        B.N      ??put_fat_0
// 1091 
// 1092 		case FS_FAT32 :
// 1093 #if FF_FS_EXFAT
// 1094 		case FS_EXFAT :
// 1095 #endif
// 1096 			res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 4)));
??put_fat_2:
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R5, LSR #+7
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        MOVS     R7,R0
// 1097 			if (res != FR_OK) break;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??put_fat_0
// 1098 			if (!FF_FS_EXFAT || fs->fs_type != FS_EXFAT) {
// 1099 				val = (val & 0x0FFFFFFF) | (ld_dword(fs->win + clst * 4 % SS(fs)) & 0xF0000000);
??put_fat_11:
        LSLS     R0,R5,#+2
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADDS     R0,R2,R4
        ADDS     R0,R0,#+48
          CFI FunCall ld_dword
        BL       ld_dword
        LSRS     R0,R0,#+28
        BFI      R6,R0,#+28,#+4
// 1100 			}
// 1101 			st_dword(fs->win + clst * 4 % SS(fs), val);
        MOVS     R1,R6
        LSLS     R0,R5,#+2
        MOV      R2,#+512
        UDIV     R3,R0,R2
        MLS      R3,R3,R2,R0
        ADDS     R0,R3,R4
        ADDS     R0,R0,#+48
          CFI FunCall st_dword
        BL       st_dword
// 1102 			fs->wflag = 1;
        MOVS     R0,#+1
        STRB     R0,[R4, #+3]
// 1103 			break;
// 1104 		}
// 1105 	}
// 1106 	return res;
??put_fat_0:
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock15
// 1107 }
// 1108 
// 1109 #endif /* !FF_FS_READONLY */
// 1110 
// 1111 
// 1112 
// 1113 
// 1114 #if FF_FS_EXFAT && !FF_FS_READONLY
// 1115 /*-----------------------------------------------------------------------*/
// 1116 /* exFAT: Accessing FAT and Allocation Bitmap                            */
// 1117 /*-----------------------------------------------------------------------*/
// 1118 
// 1119 /*--------------------------------------*/
// 1120 /* Find a contiguous free cluster block */
// 1121 /*--------------------------------------*/
// 1122 
// 1123 static
// 1124 DWORD find_bitmap (	/* 0:Not found, 2..:Cluster block found, 0xFFFFFFFF:Disk error */
// 1125 	FATFS* fs,	/* Filesystem object */
// 1126 	DWORD clst,	/* Cluster number to scan from */
// 1127 	DWORD ncl	/* Number of contiguous clusters to find (1..) */
// 1128 )
// 1129 {
// 1130 	BYTE bm, bv;
// 1131 	UINT i;
// 1132 	DWORD val, scl, ctr;
// 1133 
// 1134 
// 1135 	clst -= 2;	/* The first bit in the bitmap corresponds to cluster #2 */
// 1136 	if (clst >= fs->n_fatent - 2) clst = 0;
// 1137 	scl = val = clst; ctr = 0;
// 1138 	for (;;) {
// 1139 		if (move_window(fs, fs->database + val / 8 / SS(fs)) != FR_OK) return 0xFFFFFFFF;	/* (assuming bitmap is located top of the cluster heap) */
// 1140 		i = val / 8 % SS(fs); bm = 1 << (val % 8);
// 1141 		do {
// 1142 			do {
// 1143 				bv = fs->win[i] & bm; bm <<= 1;		/* Get bit value */
// 1144 				if (++val >= fs->n_fatent - 2) {	/* Next cluster (with wrap-around) */
// 1145 					val = 0; bm = 0; i = SS(fs);
// 1146 				}
// 1147 				if (!bv) {	/* Is it a free cluster? */
// 1148 					if (++ctr == ncl) return scl + 2;	/* Check if run length is sufficient for required */
// 1149 				} else {
// 1150 					scl = val; ctr = 0;		/* Encountered a cluster in-use, restart to scan */
// 1151 				}
// 1152 				if (val == clst) return 0;	/* All cluster scanned? */
// 1153 			} while (bm);
// 1154 			bm = 1;
// 1155 		} while (++i < SS(fs));
// 1156 	}
// 1157 }
// 1158 
// 1159 
// 1160 /*----------------------------------------*/
// 1161 /* Set/Clear a block of allocation bitmap */
// 1162 /*----------------------------------------*/
// 1163 
// 1164 static
// 1165 FRESULT change_bitmap (
// 1166 	FATFS* fs,	/* Filesystem object */
// 1167 	DWORD clst,	/* Cluster number to change from */
// 1168 	DWORD ncl,	/* Number of clusters to be changed */
// 1169 	int bv		/* bit value to be set (0 or 1) */
// 1170 )
// 1171 {
// 1172 	BYTE bm;
// 1173 	UINT i;
// 1174 	DWORD sect;
// 1175 
// 1176 
// 1177 	clst -= 2;	/* The first bit corresponds to cluster #2 */
// 1178 	sect = fs->database + clst / 8 / SS(fs);	/* Sector address (assuming bitmap is located top of the cluster heap) */
// 1179 	i = clst / 8 % SS(fs);						/* Byte offset in the sector */
// 1180 	bm = 1 << (clst % 8);						/* Bit mask in the byte */
// 1181 	for (;;) {
// 1182 		if (move_window(fs, sect++) != FR_OK) return FR_DISK_ERR;
// 1183 		do {
// 1184 			do {
// 1185 				if (bv == (int)((fs->win[i] & bm) != 0)) return FR_INT_ERR;	/* Is the bit expected value? */
// 1186 				fs->win[i] ^= bm;	/* Flip the bit */
// 1187 				fs->wflag = 1;
// 1188 				if (--ncl == 0) return FR_OK;	/* All bits processed? */
// 1189 			} while (bm <<= 1);		/* Next bit */
// 1190 			bm = 1;
// 1191 		} while (++i < SS(fs));		/* Next byte */
// 1192 		i = 0;
// 1193 	}
// 1194 }
// 1195 
// 1196 
// 1197 /*---------------------------------------------*/
// 1198 /* Fill the first fragment of the FAT chain    */
// 1199 /*---------------------------------------------*/
// 1200 
// 1201 static
// 1202 FRESULT fill_first_frag (
// 1203 	FFOBJID* obj	/* Pointer to the corresponding object */
// 1204 )
// 1205 {
// 1206 	FRESULT res;
// 1207 	DWORD cl, n;
// 1208 
// 1209 
// 1210 	if (obj->stat == 3) {	/* Has the object been changed 'fragmented' in this session? */
// 1211 		for (cl = obj->sclust, n = obj->n_cont; n; cl++, n--) {	/* Create cluster chain on the FAT */
// 1212 			res = put_fat(obj->fs, cl, cl + 1);
// 1213 			if (res != FR_OK) return res;
// 1214 		}
// 1215 		obj->stat = 0;	/* Change status 'FAT chain is valid' */
// 1216 	}
// 1217 	return FR_OK;
// 1218 }
// 1219 
// 1220 
// 1221 /*---------------------------------------------*/
// 1222 /* Fill the last fragment of the FAT chain     */
// 1223 /*---------------------------------------------*/
// 1224 
// 1225 static
// 1226 FRESULT fill_last_frag (
// 1227 	FFOBJID* obj,	/* Pointer to the corresponding object */
// 1228 	DWORD lcl,		/* Last cluster of the fragment */
// 1229 	DWORD term		/* Value to set the last FAT entry */
// 1230 )
// 1231 {
// 1232 	FRESULT res;
// 1233 
// 1234 
// 1235 	while (obj->n_frag > 0) {	/* Create the last chain on the FAT */
// 1236 		res = put_fat(obj->fs, lcl - obj->n_frag + 1, (obj->n_frag > 1) ? lcl - obj->n_frag + 2 : term);
// 1237 		if (res != FR_OK) return res;
// 1238 		obj->n_frag--;
// 1239 	}
// 1240 	return FR_OK;
// 1241 }
// 1242 
// 1243 #endif	/* FF_FS_EXFAT && !FF_FS_READONLY */
// 1244 
// 1245 
// 1246 
// 1247 #if !FF_FS_READONLY
// 1248 /*-----------------------------------------------------------------------*/
// 1249 /* FAT handling - Remove a cluster chain                                 */
// 1250 /*-----------------------------------------------------------------------*/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function remove_chain
        THUMB
// 1251 static
// 1252 FRESULT remove_chain (	/* FR_OK(0):succeeded, !=0:error */
// 1253 	FFOBJID* obj,		/* Corresponding object */
// 1254 	DWORD clst,			/* Cluster to remove a chain from */
// 1255 	DWORD pclst			/* Previous cluster of clst (0:entire chain) */
// 1256 )
// 1257 {
remove_chain:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R1,R2
// 1258 	FRESULT res = FR_OK;
        MOVS     R0,#+0
// 1259 	DWORD nxt;
// 1260 	FATFS *fs = obj->fs;
        LDR      R5,[R4, #+0]
// 1261 #if FF_FS_EXFAT || FF_USE_TRIM
// 1262 	DWORD scl = clst, ecl = clst;
// 1263 #endif
// 1264 #if FF_USE_TRIM
// 1265 	DWORD rt[2];
// 1266 #endif
// 1267 
// 1268 	if (clst < 2 || clst >= fs->n_fatent) return FR_INT_ERR;	/* Check if in valid range */
        CMP      R7,#+2
        BCC.N    ??remove_chain_0
        LDR      R0,[R5, #+20]
        CMP      R7,R0
        BCC.N    ??remove_chain_1
??remove_chain_0:
        MOVS     R0,#+2
        B.N      ??remove_chain_2
// 1269 
// 1270 	/* Mark the previous cluster 'EOC' on the FAT if it exists */
// 1271 	if (pclst != 0 && (!FF_FS_EXFAT || fs->fs_type != FS_EXFAT || obj->stat != 2)) {
??remove_chain_1:
        CMP      R1,#+0
        BEQ.N    ??remove_chain_3
// 1272 		res = put_fat(fs, pclst, 0xFFFFFFFF);
        MOVS     R2,#-1
        MOVS     R0,R5
          CFI FunCall put_fat
        BL       put_fat
// 1273 		if (res != FR_OK) return res;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??remove_chain_3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??remove_chain_2
// 1274 	}
// 1275 
// 1276 	/* Remove the chain */
// 1277 	do {
// 1278 		nxt = get_fat(obj, clst);			/* Get cluster status */
??remove_chain_3:
        MOVS     R1,R7
        MOVS     R0,R4
          CFI FunCall get_fat
        BL       get_fat
        MOVS     R6,R0
// 1279 		if (nxt == 0) break;				/* Empty cluster? */
        CMP      R6,#+0
        BEQ.N    ??remove_chain_4
// 1280 		if (nxt == 1) return FR_INT_ERR;	/* Internal error? */
??remove_chain_5:
        CMP      R6,#+1
        BNE.N    ??remove_chain_6
        MOVS     R0,#+2
        B.N      ??remove_chain_2
// 1281 		if (nxt == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error? */
??remove_chain_6:
        CMN      R6,#+1
        BNE.N    ??remove_chain_7
        MOVS     R0,#+1
        B.N      ??remove_chain_2
// 1282 		if (!FF_FS_EXFAT || fs->fs_type != FS_EXFAT) {
// 1283 			res = put_fat(fs, clst, 0);		/* Mark the cluster 'free' on the FAT */
??remove_chain_7:
        MOVS     R2,#+0
        MOVS     R1,R7
        MOVS     R0,R5
          CFI FunCall put_fat
        BL       put_fat
// 1284 			if (res != FR_OK) return res;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??remove_chain_8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??remove_chain_2
// 1285 		}
// 1286 		if (fs->free_clst < fs->n_fatent - 2) {	/* Update FSINFO */
??remove_chain_8:
        LDR      R0,[R5, #+16]
        LDR      R1,[R5, #+20]
        SUBS     R1,R1,#+2
        CMP      R0,R1
        BCS.N    ??remove_chain_9
// 1287 			fs->free_clst++;
        LDR      R0,[R5, #+16]
        ADDS     R0,R0,#+1
        STR      R0,[R5, #+16]
// 1288 			fs->fsi_flag |= 1;
        LDRB     R0,[R5, #+4]
        ORRS     R0,R0,#0x1
        STRB     R0,[R5, #+4]
// 1289 		}
// 1290 #if FF_FS_EXFAT || FF_USE_TRIM
// 1291 		if (ecl + 1 == nxt) {	/* Is next cluster contiguous? */
// 1292 			ecl = nxt;
// 1293 		} else {				/* End of contiguous cluster block */
// 1294 #if FF_FS_EXFAT
// 1295 			if (fs->fs_type == FS_EXFAT) {
// 1296 				res = change_bitmap(fs, scl, ecl - scl + 1, 0);	/* Mark the cluster block 'free' on the bitmap */
// 1297 				if (res != FR_OK) return res;
// 1298 			}
// 1299 #endif
// 1300 #if FF_USE_TRIM
// 1301 			rt[0] = clst2sect(fs, scl);					/* Start of data area freed */
// 1302 			rt[1] = clst2sect(fs, ecl) + fs->csize - 1;	/* End of data area freed */
// 1303 			disk_ioctl(fs->pdrv, CTRL_TRIM, rt);		/* Inform device the data in the block is no longer needed */
// 1304 #endif
// 1305 			scl = ecl = nxt;
// 1306 		}
// 1307 #endif
// 1308 		clst = nxt;					/* Next cluster */
??remove_chain_9:
        MOVS     R7,R6
// 1309 	} while (clst < fs->n_fatent);	/* Repeat while not the last link */
        LDR      R0,[R5, #+20]
        CMP      R7,R0
        BCC.N    ??remove_chain_3
// 1310 
// 1311 #if FF_FS_EXFAT
// 1312 	/* Some post processes for chain status */
// 1313 	if (fs->fs_type == FS_EXFAT) {
// 1314 		if (pclst == 0) {	/* Has the entire chain been removed? */
// 1315 			obj->stat = 0;		/* Change the chain status 'initial' */
// 1316 		} else {
// 1317 			if (obj->stat == 0) {	/* Is it a fragmented chain from the beginning of this session? */
// 1318 				clst = obj->sclust;		/* Follow the chain to check if it gets contiguous */
// 1319 				while (clst != pclst) {
// 1320 					nxt = get_fat(obj, clst);
// 1321 					if (nxt < 2) return FR_INT_ERR;
// 1322 					if (nxt == 0xFFFFFFFF) return FR_DISK_ERR;
// 1323 					if (nxt != clst + 1) break;	/* Not contiguous? */
// 1324 					clst++;
// 1325 				}
// 1326 				if (clst == pclst) {	/* Has the chain got contiguous again? */
// 1327 					obj->stat = 2;		/* Change the chain status 'contiguous' */
// 1328 				}
// 1329 			} else {
// 1330 				if (obj->stat == 3 && pclst >= obj->sclust && pclst <= obj->sclust + obj->n_cont) {	/* Was the chain fragmented in this session and got contiguous again? */
// 1331 					obj->stat = 2;	/* Change the chain status 'contiguous' */
// 1332 				}
// 1333 			}
// 1334 		}
// 1335 	}
// 1336 #endif
// 1337 	return FR_OK;
??remove_chain_4:
        MOVS     R0,#+0
??remove_chain_2:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock16
// 1338 }
// 1339 
// 1340 
// 1341 
// 1342 
// 1343 /*-----------------------------------------------------------------------*/
// 1344 /* FAT handling - Stretch a chain or Create a new chain                  */
// 1345 /*-----------------------------------------------------------------------*/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function create_chain
        THUMB
// 1346 static
// 1347 DWORD create_chain (	/* 0:No free cluster, 1:Internal error, 0xFFFFFFFF:Disk error, >=2:New cluster# */
// 1348 	FFOBJID* obj,		/* Corresponding object */
// 1349 	DWORD clst			/* Cluster# to stretch, 0:Create a new chain */
// 1350 )
// 1351 {
create_chain:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R6,R0
        MOVS     R4,R1
// 1352 	DWORD cs, ncl, scl;
// 1353 	FRESULT res;
// 1354 	FATFS *fs = obj->fs;
        LDR      R5,[R6, #+0]
// 1355 
// 1356 
// 1357 	if (clst == 0) {	/* Create a new chain */
        CMP      R4,#+0
        BNE.N    ??create_chain_0
// 1358 		scl = fs->last_clst;				/* Suggested cluster to start to find */
        LDR      R7,[R5, #+12]
// 1359 		if (scl == 0 || scl >= fs->n_fatent) scl = 1;
        CMP      R7,#+0
        BEQ.N    ??create_chain_1
        LDR      R0,[R5, #+20]
        CMP      R7,R0
        BCC.N    ??create_chain_2
??create_chain_1:
        MOVS     R7,#+1
        B.N      ??create_chain_2
// 1360 	}
// 1361 	else {				/* Stretch a chain */
// 1362 		cs = get_fat(obj, clst);			/* Check the cluster status */
??create_chain_0:
        MOVS     R1,R4
        MOVS     R0,R6
          CFI FunCall get_fat
        BL       get_fat
// 1363 		if (cs < 2) return 1;				/* Test for insanity */
        CMP      R0,#+2
        BCS.N    ??create_chain_3
        MOVS     R0,#+1
        B.N      ??create_chain_4
// 1364 		if (cs == 0xFFFFFFFF) return cs;	/* Test for disk error */
??create_chain_3:
        CMN      R0,#+1
        BEQ.N    ??create_chain_4
// 1365 		if (cs < fs->n_fatent) return cs;	/* It is already followed by next cluster */
??create_chain_5:
        LDR      R1,[R5, #+20]
        CMP      R0,R1
        BCC.N    ??create_chain_4
// 1366 		scl = clst;							/* Cluster to start to find */
??create_chain_6:
        MOVS     R7,R4
// 1367 	}
// 1368 	if (fs->free_clst == 0) return 0;		/* No free cluster */
??create_chain_2:
        LDR      R0,[R5, #+16]
        CMP      R0,#+0
        BNE.N    ??create_chain_7
        MOVS     R0,#+0
        B.N      ??create_chain_4
// 1369 
// 1370 #if FF_FS_EXFAT
// 1371 	if (fs->fs_type == FS_EXFAT) {	/* On the exFAT volume */
// 1372 		ncl = find_bitmap(fs, scl, 1);				/* Find a free cluster */
// 1373 		if (ncl == 0 || ncl == 0xFFFFFFFF) return ncl;	/* No free cluster or hard error? */
// 1374 		res = change_bitmap(fs, ncl, 1, 1);			/* Mark the cluster 'in use' */
// 1375 		if (res == FR_INT_ERR) return 1;
// 1376 		if (res == FR_DISK_ERR) return 0xFFFFFFFF;
// 1377 		if (clst == 0) {							/* Is it a new chain? */
// 1378 			obj->stat = 2;							/* Set status 'contiguous' */
// 1379 		} else {									/* It is a stretched chain */
// 1380 			if (obj->stat == 2 && ncl != scl + 1) {	/* Is the chain got fragmented? */
// 1381 				obj->n_cont = scl - obj->sclust;	/* Set size of the contiguous part */
// 1382 				obj->stat = 3;						/* Change status 'just fragmented' */
// 1383 			}
// 1384 		}
// 1385 		if (obj->stat != 2) {	/* Is the file non-contiguous? */
// 1386 			if (ncl == clst + 1) {	/* Is the cluster next to previous one? */
// 1387 				obj->n_frag = obj->n_frag ? obj->n_frag + 1 : 2;	/* Increment size of last framgent */
// 1388 			} else {				/* New fragment */
// 1389 				if (obj->n_frag == 0) obj->n_frag = 1;
// 1390 				res = fill_last_frag(obj, clst, ncl);	/* Fill last fragment on the FAT and link it to new one */
// 1391 				if (res == FR_OK) obj->n_frag = 1;
// 1392 			}
// 1393 		}
// 1394 	} else
// 1395 #endif
// 1396 	{	/* On the FAT/FAT32 volume */
// 1397 		ncl = 0;
??create_chain_7:
        MOVS     R8,#+0
// 1398 		if (scl == clst) {						/* Stretching an existing chain? */
        CMP      R7,R4
        BNE.N    ??create_chain_8
// 1399 			ncl = scl + 1;						/* Test if next cluster is free */
        ADDS     R8,R7,#+1
// 1400 			if (ncl >= fs->n_fatent) ncl = 2;
        LDR      R0,[R5, #+20]
        CMP      R8,R0
        BCC.N    ??create_chain_9
        MOVS     R8,#+2
// 1401 			cs = get_fat(obj, ncl);				/* Get next cluster status */
??create_chain_9:
        MOV      R1,R8
        MOVS     R0,R6
          CFI FunCall get_fat
        BL       get_fat
// 1402 			if (cs == 1 || cs == 0xFFFFFFFF) return cs;	/* Test for error */
        CMP      R0,#+1
        BEQ.N    ??create_chain_10
        CMN      R0,#+1
        BNE.N    ??create_chain_11
??create_chain_10:
        B.N      ??create_chain_4
// 1403 			if (cs != 0) {						/* Not free? */
??create_chain_11:
        CMP      R0,#+0
        BEQ.N    ??create_chain_8
// 1404 				cs = fs->last_clst;				/* Start at suggested cluster if it is valid */
        LDR      R0,[R5, #+12]
// 1405 				if (cs >= 2 && cs < fs->n_fatent) scl = cs;
        CMP      R0,#+2
        BCC.N    ??create_chain_12
        LDR      R1,[R5, #+20]
        CMP      R0,R1
        BCS.N    ??create_chain_12
        MOVS     R7,R0
// 1406 				ncl = 0;
??create_chain_12:
        MOVS     R8,#+0
// 1407 			}
// 1408 		}
// 1409 		if (ncl == 0) {	/* The new cluster cannot be contiguous and find another fragment */
??create_chain_8:
        CMP      R8,#+0
        BNE.N    ??create_chain_13
// 1410 			ncl = scl;	/* Start cluster */
        MOV      R8,R7
// 1411 			for (;;) {
// 1412 				ncl++;							/* Next cluster */
??create_chain_14:
        ADDS     R8,R8,#+1
// 1413 				if (ncl >= fs->n_fatent) {		/* Check wrap-around */
        LDR      R0,[R5, #+20]
        CMP      R8,R0
        BCC.N    ??create_chain_15
// 1414 					ncl = 2;
        MOVS     R8,#+2
// 1415 					if (ncl > scl) return 0;	/* No free cluster found? */
        CMP      R7,R8
        BCS.N    ??create_chain_15
        MOVS     R0,#+0
        B.N      ??create_chain_4
// 1416 				}
// 1417 				cs = get_fat(obj, ncl);			/* Get the cluster status */
??create_chain_15:
        MOV      R1,R8
        MOVS     R0,R6
          CFI FunCall get_fat
        BL       get_fat
// 1418 				if (cs == 0) break;				/* Found a free cluster? */
        CMP      R0,#+0
        BNE.N    ??create_chain_16
// 1419 				if (cs == 1 || cs == 0xFFFFFFFF) return cs;	/* Test for error */
// 1420 				if (ncl == scl) return 0;		/* No free cluster found? */
// 1421 			}
// 1422 		}
// 1423 		res = put_fat(fs, ncl, 0xFFFFFFFF);		/* Mark the new cluster 'EOC' */
??create_chain_13:
        MOVS     R2,#-1
        MOV      R1,R8
        MOVS     R0,R5
          CFI FunCall put_fat
        BL       put_fat
// 1424 		if (res == FR_OK && clst != 0) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??create_chain_17
        CMP      R4,#+0
        BEQ.N    ??create_chain_17
// 1425 			res = put_fat(fs, clst, ncl);		/* Link it from the previous one if needed */
        MOV      R2,R8
        MOVS     R1,R4
        MOVS     R0,R5
          CFI FunCall put_fat
        BL       put_fat
// 1426 		}
// 1427 	}
// 1428 
// 1429 	if (res == FR_OK) {			/* Update FSINFO if function succeeded. */
??create_chain_17:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??create_chain_18
// 1430 		fs->last_clst = ncl;
        STR      R8,[R5, #+12]
// 1431 		if (fs->free_clst <= fs->n_fatent - 2) fs->free_clst--;
        LDR      R0,[R5, #+20]
        SUBS     R0,R0,#+2
        LDR      R1,[R5, #+16]
        CMP      R0,R1
        BCC.N    ??create_chain_19
        LDR      R0,[R5, #+16]
        SUBS     R0,R0,#+1
        STR      R0,[R5, #+16]
// 1432 		fs->fsi_flag |= 1;
??create_chain_19:
        LDRB     R0,[R5, #+4]
        ORRS     R0,R0,#0x1
        STRB     R0,[R5, #+4]
        B.N      ??create_chain_20
// 1433 	} else {
??create_chain_16:
        CMP      R0,#+1
        BEQ.N    ??create_chain_21
        CMN      R0,#+1
        BNE.N    ??create_chain_22
??create_chain_21:
        B.N      ??create_chain_4
??create_chain_22:
        CMP      R8,R7
        BNE.N    ??create_chain_14
        MOVS     R0,#+0
        B.N      ??create_chain_4
// 1434 		ncl = (res == FR_DISK_ERR) ? 0xFFFFFFFF : 1;	/* Failed. Generate error status */
??create_chain_18:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??create_chain_23
        MOVS     R8,#-1
        B.N      ??create_chain_20
??create_chain_23:
        MOVS     R8,#+1
// 1435 	}
// 1436 
// 1437 	return ncl;		/* Return new cluster number or error status */
??create_chain_20:
        MOV      R0,R8
??create_chain_4:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock17
// 1438 }
// 1439 
// 1440 #endif /* !FF_FS_READONLY */
// 1441 
// 1442 
// 1443 
// 1444 
// 1445 #if FF_USE_FASTSEEK
// 1446 /*-----------------------------------------------------------------------*/
// 1447 /* FAT handling - Convert offset into cluster with link map table        */
// 1448 /*-----------------------------------------------------------------------*/
// 1449 
// 1450 static
// 1451 DWORD clmt_clust (	/* <2:Error, >=2:Cluster number */
// 1452 	FIL* fp,		/* Pointer to the file object */
// 1453 	FSIZE_t ofs		/* File offset to be converted to cluster# */
// 1454 )
// 1455 {
// 1456 	DWORD cl, ncl, *tbl;
// 1457 	FATFS *fs = fp->obj.fs;
// 1458 
// 1459 
// 1460 	tbl = fp->cltbl + 1;	/* Top of CLMT */
// 1461 	cl = (DWORD)(ofs / SS(fs) / fs->csize);	/* Cluster order from top of the file */
// 1462 	for (;;) {
// 1463 		ncl = *tbl++;			/* Number of cluters in the fragment */
// 1464 		if (ncl == 0) return 0;	/* End of table? (error) */
// 1465 		if (cl < ncl) break;	/* In this fragment? */
// 1466 		cl -= ncl; tbl++;		/* Next fragment */
// 1467 	}
// 1468 	return cl + *tbl;	/* Return the cluster number */
// 1469 }
// 1470 
// 1471 #endif	/* FF_USE_FASTSEEK */
// 1472 
// 1473 
// 1474 
// 1475 
// 1476 /*-----------------------------------------------------------------------*/
// 1477 /* Directory handling - Fill a cluster with zeros                        */
// 1478 /*-----------------------------------------------------------------------*/
// 1479 
// 1480 #if !FF_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function dir_clear
        THUMB
// 1481 static
// 1482 FRESULT dir_clear (	/* Returns FR_OK or FR_DISK_ERR */
// 1483 	FATFS *fs,		/* Filesystem object */
// 1484 	DWORD clst		/* Directory table to clear */
// 1485 )
// 1486 {
dir_clear:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
// 1487 	DWORD sect;
// 1488 	UINT n, szb;
// 1489 	BYTE *ibuf;
// 1490 
// 1491 
// 1492 	if (sync_window(fs) != FR_OK) return FR_DISK_ERR;	/* Flush disk access window */
        MOVS     R0,R4
          CFI FunCall sync_window
        BL       sync_window
        CMP      R0,#+0
        BEQ.N    ??dir_clear_0
        MOVS     R0,#+1
        B.N      ??dir_clear_1
// 1493 	sect = clst2sect(fs, clst);		/* Top of the cluster */
??dir_clear_0:
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall clst2sect
        BL       clst2sect
        MOVS     R5,R0
// 1494 	fs->winsect = sect;				/* Set window to top of the cluster */
        STR      R5,[R4, #+44]
// 1495 	mem_set(fs->win, 0, SS(fs));	/* Clear window buffer */
        MOV      R2,#+512
        MOVS     R1,#+0
        ADDS     R0,R4,#+48
          CFI FunCall mem_set
        BL       mem_set
// 1496 #if FF_USE_LFN == 3		/* Quick table clear by using multi-secter write */
// 1497 	/* Allocate a temporary buffer (32 KB max) */
// 1498 	for (szb = ((DWORD)fs->csize * SS(fs) >= 0x8000) ? 0x8000 : fs->csize * SS(fs); szb > SS(fs) && !(ibuf = ff_memalloc(szb)); szb /= 2) ;
// 1499 	if (szb > SS(fs)) {		/* Buffer allocated? */
// 1500 		mem_set(ibuf, 0, szb);
// 1501 		szb /= SS(fs);		/* Bytes -> Sectors */
// 1502 		for (n = 0; n < fs->csize && disk_write(fs->pdrv, ibuf, sect + n, szb) == RES_OK; n += szb) ;	/* Fill the cluster with 0 */
// 1503 		ff_memfree(ibuf);
// 1504 	} else
// 1505 #endif
// 1506 	{
// 1507 		ibuf = fs->win; szb = 1;	/* Use window buffer (single-sector writes may take a time) */
        ADDS     R8,R4,#+48
        MOVS     R7,#+1
// 1508 		for (n = 0; n < fs->csize && disk_write(fs->pdrv, ibuf, sect + n, szb) == RES_OK; n += szb) ;	/* Fill the cluster with 0 */
        MOVS     R6,#+0
        B.N      ??dir_clear_2
??dir_clear_3:
        ADDS     R6,R7,R6
??dir_clear_2:
        LDRH     R0,[R4, #+10]
        CMP      R6,R0
        BCS.N    ??dir_clear_4
        MOVS     R3,R7
        ADDS     R2,R6,R5
        MOV      R1,R8
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??dir_clear_3
// 1509 	}
// 1510 	return (n == fs->csize) ? FR_OK : FR_DISK_ERR;
??dir_clear_4:
        LDRH     R0,[R4, #+10]
        CMP      R6,R0
        BNE.N    ??dir_clear_5
        MOVS     R0,#+0
        B.N      ??dir_clear_6
??dir_clear_5:
        MOVS     R0,#+1
??dir_clear_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??dir_clear_1:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock18
// 1511 }
// 1512 #endif	/* !FF_FS_READONLY */
// 1513 
// 1514 
// 1515 
// 1516 
// 1517 /*-----------------------------------------------------------------------*/
// 1518 /* Directory handling - Set directory index                              */
// 1519 /*-----------------------------------------------------------------------*/
// 1520 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function dir_sdi
        THUMB
// 1521 static
// 1522 FRESULT dir_sdi (	/* FR_OK(0):succeeded, !=0:error */
// 1523 	DIR* dp,		/* Pointer to directory object */
// 1524 	DWORD ofs		/* Offset of directory table */
// 1525 )
// 1526 {
dir_sdi:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
// 1527 	DWORD csz, clst;
// 1528 	FATFS *fs = dp->obj.fs;
        LDR      R6,[R4, #+0]
// 1529 
// 1530 
// 1531 	if (ofs >= (DWORD)((FF_FS_EXFAT && fs->fs_type == FS_EXFAT) ? MAX_DIR_EX : MAX_DIR) || ofs % SZDIRE) {	/* Check range of offset and alignment */
        CMP      R5,#+2097152
        BCS.N    ??dir_sdi_0
        MOVS     R0,#+32
        UDIV     R1,R5,R0
        MLS      R1,R1,R0,R5
        CMP      R1,#+0
        BEQ.N    ??dir_sdi_1
// 1532 		return FR_INT_ERR;
??dir_sdi_0:
        MOVS     R0,#+2
        B.N      ??dir_sdi_2
// 1533 	}
// 1534 	dp->dptr = ofs;				/* Set current offset */
??dir_sdi_1:
        STR      R5,[R4, #+16]
// 1535 	clst = dp->obj.sclust;		/* Table start cluster (0:root) */
        LDR      R7,[R4, #+8]
// 1536 	if (clst == 0 && fs->fs_type >= FS_FAT32) {	/* Replace cluster# 0 with root cluster# */
        CMP      R7,#+0
        BNE.N    ??dir_sdi_3
        LDRB     R0,[R6, #+0]
        CMP      R0,#+3
        BLT.N    ??dir_sdi_3
// 1537 		clst = fs->dirbase;
        LDR      R7,[R6, #+36]
// 1538 		if (FF_FS_EXFAT) dp->obj.stat = 0;	/* exFAT: Root dir has an FAT chain */
// 1539 	}
// 1540 
// 1541 	if (clst == 0) {	/* Static table (root-directory on the FAT volume) */
??dir_sdi_3:
        CMP      R7,#+0
        BNE.N    ??dir_sdi_4
// 1542 		if (ofs / SZDIRE >= fs->n_rootdir) return FR_INT_ERR;	/* Is index out of range? */
        LSRS     R0,R5,#+5
        LDRH     R1,[R6, #+8]
        CMP      R0,R1
        BCC.N    ??dir_sdi_5
        MOVS     R0,#+2
        B.N      ??dir_sdi_2
// 1543 		dp->sect = fs->dirbase;
??dir_sdi_5:
        LDR      R0,[R6, #+36]
        STR      R0,[R4, #+24]
        B.N      ??dir_sdi_6
// 1544 
// 1545 	} else {			/* Dynamic table (sub-directory or root-directory on the FAT32/exFAT volume) */
// 1546 		csz = (DWORD)fs->csize * SS(fs);	/* Bytes per cluster */
??dir_sdi_4:
        LDRH     R0,[R6, #+10]
        MOV      R1,#+512
        MUL      R8,R1,R0
        B.N      ??dir_sdi_7
// 1547 		while (ofs >= csz) {				/* Follow cluster chain */
// 1548 			clst = get_fat(&dp->obj, clst);				/* Get next cluster */
// 1549 			if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
// 1550 			if (clst < 2 || clst >= fs->n_fatent) return FR_INT_ERR;	/* Reached to end of table or internal error */
// 1551 			ofs -= csz;
??dir_sdi_8:
        SUBS     R5,R5,R8
??dir_sdi_7:
        CMP      R5,R8
        BCC.N    ??dir_sdi_9
        MOVS     R1,R7
        MOVS     R0,R4
          CFI FunCall get_fat
        BL       get_fat
        MOVS     R7,R0
        CMN      R7,#+1
        BNE.N    ??dir_sdi_10
        MOVS     R0,#+1
        B.N      ??dir_sdi_2
??dir_sdi_10:
        CMP      R7,#+2
        BCC.N    ??dir_sdi_11
        LDR      R0,[R6, #+20]
        CMP      R7,R0
        BCC.N    ??dir_sdi_8
??dir_sdi_11:
        MOVS     R0,#+2
        B.N      ??dir_sdi_2
// 1552 		}
// 1553 		dp->sect = clst2sect(fs, clst);
??dir_sdi_9:
        MOVS     R1,R7
        MOVS     R0,R6
          CFI FunCall clst2sect
        BL       clst2sect
        STR      R0,[R4, #+24]
// 1554 	}
// 1555 	dp->clust = clst;					/* Current cluster# */
??dir_sdi_6:
        STR      R7,[R4, #+20]
// 1556 	if (dp->sect == 0) return FR_INT_ERR;
        LDR      R0,[R4, #+24]
        CMP      R0,#+0
        BNE.N    ??dir_sdi_12
        MOVS     R0,#+2
        B.N      ??dir_sdi_2
// 1557 	dp->sect += ofs / SS(fs);			/* Sector# of the directory entry */
??dir_sdi_12:
        LDR      R0,[R4, #+24]
        ADDS     R0,R0,R5, LSR #+9
        STR      R0,[R4, #+24]
// 1558 	dp->dir = fs->win + (ofs % SS(fs));	/* Pointer to the entry in the win[] */
        MOV      R0,#+512
        UDIV     R1,R5,R0
        MLS      R1,R1,R0,R5
        ADDS     R0,R1,R6
        ADDS     R0,R0,#+48
        STR      R0,[R4, #+28]
// 1559 
// 1560 	return FR_OK;
        MOVS     R0,#+0
??dir_sdi_2:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock19
// 1561 }
// 1562 
// 1563 
// 1564 
// 1565 
// 1566 /*-----------------------------------------------------------------------*/
// 1567 /* Directory handling - Move directory table index next                  */
// 1568 /*-----------------------------------------------------------------------*/
// 1569 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function dir_next
        THUMB
// 1570 static
// 1571 FRESULT dir_next (	/* FR_OK(0):succeeded, FR_NO_FILE:End of table, FR_DENIED:Could not stretch */
// 1572 	DIR* dp,		/* Pointer to the directory object */
// 1573 	int stretch		/* 0: Do not stretch table, 1: Stretch table if needed */
// 1574 )
// 1575 {
dir_next:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
// 1576 	DWORD ofs, clst;
// 1577 	FATFS *fs = dp->obj.fs;
        LDR      R6,[R4, #+0]
// 1578 
// 1579 
// 1580 	ofs = dp->dptr + SZDIRE;	/* Next entry */
        LDR      R0,[R4, #+16]
        ADDS     R7,R0,#+32
// 1581 	if (dp->sect == 0 || ofs >= (DWORD)((FF_FS_EXFAT && fs->fs_type == FS_EXFAT) ? MAX_DIR_EX : MAX_DIR)) return FR_NO_FILE;	/* Report EOT when offset has reached max value */
        LDR      R0,[R4, #+24]
        CMP      R0,#+0
        BEQ.N    ??dir_next_0
        CMP      R7,#+2097152
        BCC.N    ??dir_next_1
??dir_next_0:
        MOVS     R0,#+4
        B.N      ??dir_next_2
// 1582 
// 1583 	if (ofs % SS(fs) == 0) {	/* Sector changed? */
??dir_next_1:
        MOV      R0,#+512
        UDIV     R1,R7,R0
        MLS      R1,R1,R0,R7
        CMP      R1,#+0
        BNE.N    ??dir_next_3
// 1584 		dp->sect++;				/* Next sector */
        LDR      R0,[R4, #+24]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+24]
// 1585 
// 1586 		if (dp->clust == 0) {	/* Static table */
        LDR      R0,[R4, #+20]
        CMP      R0,#+0
        BNE.N    ??dir_next_4
// 1587 			if (ofs / SZDIRE >= fs->n_rootdir) {	/* Report EOT if it reached end of static table */
        LSRS     R0,R7,#+5
        LDRH     R1,[R6, #+8]
        CMP      R0,R1
        BCC.N    ??dir_next_3
// 1588 				dp->sect = 0; return FR_NO_FILE;
        MOVS     R0,#+0
        STR      R0,[R4, #+24]
        MOVS     R0,#+4
        B.N      ??dir_next_2
// 1589 			}
// 1590 		}
// 1591 		else {					/* Dynamic table */
// 1592 			if ((ofs / SS(fs) & (fs->csize - 1)) == 0) {	/* Cluster changed? */
??dir_next_4:
        LDRH     R0,[R6, #+10]
        SUBS     R0,R0,#+1
        TST      R0,R7, LSR #+9
        BNE.N    ??dir_next_3
// 1593 				clst = get_fat(&dp->obj, dp->clust);		/* Get next cluster */
        LDR      R1,[R4, #+20]
        MOVS     R0,R4
          CFI FunCall get_fat
        BL       get_fat
        MOV      R8,R0
// 1594 				if (clst <= 1) return FR_INT_ERR;			/* Internal error */
        CMP      R8,#+2
        BCS.N    ??dir_next_5
        MOVS     R0,#+2
        B.N      ??dir_next_2
// 1595 				if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
??dir_next_5:
        CMN      R8,#+1
        BNE.N    ??dir_next_6
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1596 				if (clst >= fs->n_fatent) {					/* It reached end of dynamic table */
??dir_next_6:
        LDR      R0,[R6, #+20]
        CMP      R8,R0
        BCC.N    ??dir_next_7
// 1597 #if !FF_FS_READONLY
// 1598 					if (!stretch) {								/* If no stretch, report EOT */
        CMP      R5,#+0
        BNE.N    ??dir_next_8
// 1599 						dp->sect = 0; return FR_NO_FILE;
        MOVS     R0,#+0
        STR      R0,[R4, #+24]
        MOVS     R0,#+4
        B.N      ??dir_next_2
// 1600 					}
// 1601 					clst = create_chain(&dp->obj, dp->clust);	/* Allocate a cluster */
??dir_next_8:
        LDR      R1,[R4, #+20]
        MOVS     R0,R4
          CFI FunCall create_chain
        BL       create_chain
        MOV      R8,R0
// 1602 					if (clst == 0) return FR_DENIED;			/* No free cluster */
        CMP      R8,#+0
        BNE.N    ??dir_next_9
        MOVS     R0,#+7
        B.N      ??dir_next_2
// 1603 					if (clst == 1) return FR_INT_ERR;			/* Internal error */
??dir_next_9:
        CMP      R8,#+1
        BNE.N    ??dir_next_10
        MOVS     R0,#+2
        B.N      ??dir_next_2
// 1604 					if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
??dir_next_10:
        CMN      R8,#+1
        BNE.N    ??dir_next_11
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1605 					if (dir_clear(fs, clst) != FR_OK) return FR_DISK_ERR;	/* Clean up the stretched table */
??dir_next_11:
        MOV      R1,R8
        MOVS     R0,R6
          CFI FunCall dir_clear
        BL       dir_clear
        CMP      R0,#+0
        BEQ.N    ??dir_next_12
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1606 					if (FF_FS_EXFAT) dp->obj.stat |= 4;			/* exFAT: The directory has been stretched */
// 1607 #else
// 1608 					if (!stretch) dp->sect = 0;					/* (this line is to suppress compiler warning) */
// 1609 					dp->sect = 0; return FR_NO_FILE;			/* Report EOT */
// 1610 #endif
// 1611 				}
// 1612 				dp->clust = clst;		/* Initialize data for new cluster */
??dir_next_12:
??dir_next_7:
        STR      R8,[R4, #+20]
// 1613 				dp->sect = clst2sect(fs, clst);
        MOV      R1,R8
        MOVS     R0,R6
          CFI FunCall clst2sect
        BL       clst2sect
        STR      R0,[R4, #+24]
// 1614 			}
// 1615 		}
// 1616 	}
// 1617 	dp->dptr = ofs;						/* Current entry */
??dir_next_3:
        STR      R7,[R4, #+16]
// 1618 	dp->dir = fs->win + ofs % SS(fs);	/* Pointer to the entry in the win[] */
        MOV      R0,#+512
        UDIV     R1,R7,R0
        MLS      R1,R1,R0,R7
        ADDS     R0,R1,R6
        ADDS     R0,R0,#+48
        STR      R0,[R4, #+28]
// 1619 
// 1620 	return FR_OK;
        MOVS     R0,#+0
??dir_next_2:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock20
// 1621 }
// 1622 
// 1623 
// 1624 
// 1625 
// 1626 #if !FF_FS_READONLY
// 1627 /*-----------------------------------------------------------------------*/
// 1628 /* Directory handling - Reserve a block of directory entries             */
// 1629 /*-----------------------------------------------------------------------*/
// 1630 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function dir_alloc
        THUMB
// 1631 static
// 1632 FRESULT dir_alloc (	/* FR_OK(0):succeeded, !=0:error */
// 1633 	DIR* dp,		/* Pointer to the directory object */
// 1634 	UINT nent		/* Number of contiguous entries to allocate */
// 1635 )
// 1636 {
dir_alloc:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
// 1637 	FRESULT res;
// 1638 	UINT n;
// 1639 	FATFS *fs = dp->obj.fs;
        LDR      R7,[R4, #+0]
// 1640 
// 1641 
// 1642 	res = dir_sdi(dp, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
// 1643 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??dir_alloc_0
// 1644 		n = 0;
        MOVS     R6,#+0
// 1645 		do {
// 1646 			res = move_window(fs, dp->sect);
??dir_alloc_1:
        LDR      R1,[R4, #+24]
        MOVS     R0,R7
          CFI FunCall move_window
        BL       move_window
// 1647 			if (res != FR_OK) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??dir_alloc_0
// 1648 #if FF_FS_EXFAT
// 1649 			if ((fs->fs_type == FS_EXFAT) ? (int)((dp->dir[XDIR_Type] & 0x80) == 0) : (int)(dp->dir[DIR_Name] == DDEM || dp->dir[DIR_Name] == 0)) {
// 1650 #else
// 1651 			if (dp->dir[DIR_Name] == DDEM || dp->dir[DIR_Name] == 0) {
??dir_alloc_2:
        LDR      R1,[R4, #+28]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+229
        BEQ.N    ??dir_alloc_3
        LDR      R1,[R4, #+28]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??dir_alloc_4
// 1652 #endif
// 1653 				if (++n == nent) break;	/* A block of contiguous free entries is found */
??dir_alloc_3:
        ADDS     R6,R6,#+1
        CMP      R6,R5
        BNE.N    ??dir_alloc_5
        B.N      ??dir_alloc_0
// 1654 			} else {
// 1655 				n = 0;					/* Not a blank entry. Restart to search */
??dir_alloc_4:
        MOVS     R6,#+0
// 1656 			}
// 1657 			res = dir_next(dp, 1);
??dir_alloc_5:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall dir_next
        BL       dir_next
// 1658 		} while (res == FR_OK);	/* Next entry with table stretch enabled */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??dir_alloc_1
// 1659 	}
// 1660 
// 1661 	if (res == FR_NO_FILE) res = FR_DENIED;	/* No directory entry to allocate */
??dir_alloc_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??dir_alloc_6
        MOVS     R0,#+7
// 1662 	return res;
??dir_alloc_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock21
// 1663 }
// 1664 
// 1665 #endif	/* !FF_FS_READONLY */
// 1666 
// 1667 
// 1668 
// 1669 
// 1670 /*-----------------------------------------------------------------------*/
// 1671 /* FAT: Directory handling - Load/Store start cluster number             */
// 1672 /*-----------------------------------------------------------------------*/
// 1673 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function ld_clust
        THUMB
// 1674 static
// 1675 DWORD ld_clust (	/* Returns the top cluster value of the SFN entry */
// 1676 	FATFS* fs,		/* Pointer to the fs object */
// 1677 	const BYTE* dir	/* Pointer to the key entry */
// 1678 )
// 1679 {
ld_clust:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
// 1680 	DWORD cl;
// 1681 
// 1682 	cl = ld_word(dir + DIR_FstClusLO);
        ADDS     R0,R5,#+26
          CFI FunCall ld_word
        BL       ld_word
        MOVS     R6,R0
// 1683 	if (fs->fs_type == FS_FAT32) {
        LDRB     R0,[R4, #+0]
        CMP      R0,#+3
        BNE.N    ??ld_clust_0
// 1684 		cl |= (DWORD)ld_word(dir + DIR_FstClusHI) << 16;
        ADDS     R0,R5,#+20
          CFI FunCall ld_word
        BL       ld_word
        ORRS     R6,R6,R0, LSL #+16
// 1685 	}
// 1686 
// 1687 	return cl;
??ld_clust_0:
        MOVS     R0,R6
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock22
// 1688 }
// 1689 
// 1690 
// 1691 #if !FF_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function st_clust
        THUMB
// 1692 static
// 1693 void st_clust (
// 1694 	FATFS* fs,	/* Pointer to the fs object */
// 1695 	BYTE* dir,	/* Pointer to the key entry */
// 1696 	DWORD cl	/* Value to be set */
// 1697 )
// 1698 {
st_clust:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
// 1699 	st_word(dir + DIR_FstClusLO, (WORD)cl);
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R5,#+26
          CFI FunCall st_word
        BL       st_word
// 1700 	if (fs->fs_type == FS_FAT32) {
        LDRB     R0,[R4, #+0]
        CMP      R0,#+3
        BNE.N    ??st_clust_0
// 1701 		st_word(dir + DIR_FstClusHI, (WORD)(cl >> 16));
        LSRS     R1,R6,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R5,#+20
          CFI FunCall st_word
        BL       st_word
// 1702 	}
// 1703 }
??st_clust_0:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock23
// 1704 #endif
// 1705 
// 1706 
// 1707 
// 1708 #if FF_USE_LFN
// 1709 /*--------------------------------------------------------*/
// 1710 /* FAT-LFN: Compare a part of file name with an LFN entry */
// 1711 /*--------------------------------------------------------*/
// 1712 static
// 1713 int cmp_lfn (				/* 1:matched, 0:not matched */
// 1714 	const WCHAR* lfnbuf,	/* Pointer to the LFN working buffer to be compared */
// 1715 	BYTE* dir				/* Pointer to the directory entry containing the part of LFN */
// 1716 )
// 1717 {
// 1718 	UINT i, s;
// 1719 	WCHAR wc, uc;
// 1720 
// 1721 
// 1722 	if (ld_word(dir + LDIR_FstClusLO) != 0) return 0;	/* Check LDIR_FstClusLO */
// 1723 
// 1724 	i = ((dir[LDIR_Ord] & 0x3F) - 1) * 13;	/* Offset in the LFN buffer */
// 1725 
// 1726 	for (wc = 1, s = 0; s < 13; s++) {		/* Process all characters in the entry */
// 1727 		uc = ld_word(dir + LfnOfs[s]);		/* Pick an LFN character */
// 1728 		if (wc) {
// 1729 			if (i >= FF_MAX_LFN || ff_wtoupper(uc) != ff_wtoupper(lfnbuf[i++])) {	/* Compare it */
// 1730 				return 0;					/* Not matched */
// 1731 			}
// 1732 			wc = uc;
// 1733 		} else {
// 1734 			if (uc != 0xFFFF) return 0;		/* Check filler */
// 1735 		}
// 1736 	}
// 1737 
// 1738 	if ((dir[LDIR_Ord] & LLEF) && wc && lfnbuf[i]) return 0;	/* Last segment matched but different length */
// 1739 
// 1740 	return 1;		/* The part of LFN matched */
// 1741 }
// 1742 
// 1743 
// 1744 #if FF_FS_MINIMIZE <= 1 || FF_FS_RPATH >= 2 || FF_USE_LABEL || FF_FS_EXFAT
// 1745 /*-----------------------------------------------------*/
// 1746 /* FAT-LFN: Pick a part of file name from an LFN entry */
// 1747 /*-----------------------------------------------------*/
// 1748 static
// 1749 int pick_lfn (			/* 1:succeeded, 0:buffer overflow or invalid LFN entry */
// 1750 	WCHAR* lfnbuf,		/* Pointer to the LFN working buffer */
// 1751 	BYTE* dir			/* Pointer to the LFN entry */
// 1752 )
// 1753 {
// 1754 	UINT i, s;
// 1755 	WCHAR wc, uc;
// 1756 
// 1757 
// 1758 	if (ld_word(dir + LDIR_FstClusLO) != 0) return 0;	/* Check LDIR_FstClusLO is 0 */
// 1759 
// 1760 	i = ((dir[LDIR_Ord] & ~LLEF) - 1) * 13;	/* Offset in the LFN buffer */
// 1761 
// 1762 	for (wc = 1, s = 0; s < 13; s++) {		/* Process all characters in the entry */
// 1763 		uc = ld_word(dir + LfnOfs[s]);		/* Pick an LFN character */
// 1764 		if (wc) {
// 1765 			if (i >= FF_MAX_LFN) return 0;	/* Buffer overflow? */
// 1766 			lfnbuf[i++] = wc = uc;			/* Store it */
// 1767 		} else {
// 1768 			if (uc != 0xFFFF) return 0;		/* Check filler */
// 1769 		}
// 1770 	}
// 1771 
// 1772 	if (dir[LDIR_Ord] & LLEF) {				/* Put terminator if it is the last LFN part */
// 1773 		if (i >= FF_MAX_LFN) return 0;		/* Buffer overflow? */
// 1774 		lfnbuf[i] = 0;
// 1775 	}
// 1776 
// 1777 	return 1;		/* The part of LFN is valid */
// 1778 }
// 1779 #endif
// 1780 
// 1781 
// 1782 #if !FF_FS_READONLY
// 1783 /*-----------------------------------------*/
// 1784 /* FAT-LFN: Create an entry of LFN entries */
// 1785 /*-----------------------------------------*/
// 1786 static
// 1787 void put_lfn (
// 1788 	const WCHAR* lfn,	/* Pointer to the LFN */
// 1789 	BYTE* dir,			/* Pointer to the LFN entry to be created */
// 1790 	BYTE ord,			/* LFN order (1-20) */
// 1791 	BYTE sum			/* Checksum of the corresponding SFN */
// 1792 )
// 1793 {
// 1794 	UINT i, s;
// 1795 	WCHAR wc;
// 1796 
// 1797 
// 1798 	dir[LDIR_Chksum] = sum;			/* Set checksum */
// 1799 	dir[LDIR_Attr] = AM_LFN;		/* Set attribute. LFN entry */
// 1800 	dir[LDIR_Type] = 0;
// 1801 	st_word(dir + LDIR_FstClusLO, 0);
// 1802 
// 1803 	i = (ord - 1) * 13;				/* Get offset in the LFN working buffer */
// 1804 	s = wc = 0;
// 1805 	do {
// 1806 		if (wc != 0xFFFF) wc = lfn[i++];	/* Get an effective character */
// 1807 		st_word(dir + LfnOfs[s], wc);		/* Put it */
// 1808 		if (wc == 0) wc = 0xFFFF;		/* Padding characters for left locations */
// 1809 	} while (++s < 13);
// 1810 	if (wc == 0xFFFF || !lfn[i]) ord |= LLEF;	/* Last LFN part is the start of LFN sequence */
// 1811 	dir[LDIR_Ord] = ord;			/* Set the LFN order */
// 1812 }
// 1813 
// 1814 #endif	/* !FF_FS_READONLY */
// 1815 #endif	/* FF_USE_LFN */
// 1816 
// 1817 
// 1818 
// 1819 #if FF_USE_LFN && !FF_FS_READONLY
// 1820 /*-----------------------------------------------------------------------*/
// 1821 /* FAT-LFN: Create a Numbered SFN                                        */
// 1822 /*-----------------------------------------------------------------------*/
// 1823 
// 1824 static
// 1825 void gen_numname (
// 1826 	BYTE* dst,			/* Pointer to the buffer to store numbered SFN */
// 1827 	const BYTE* src,	/* Pointer to SFN */
// 1828 	const WCHAR* lfn,	/* Pointer to LFN */
// 1829 	UINT seq			/* Sequence number */
// 1830 )
// 1831 {
// 1832 	BYTE ns[8], c;
// 1833 	UINT i, j;
// 1834 	WCHAR wc;
// 1835 	DWORD sr;
// 1836 
// 1837 
// 1838 	mem_cpy(dst, src, 11);
// 1839 
// 1840 	if (seq > 5) {	/* In case of many collisions, generate a hash number instead of sequential number */
// 1841 		sr = seq;
// 1842 		while (*lfn) {	/* Create a CRC */
// 1843 			wc = *lfn++;
// 1844 			for (i = 0; i < 16; i++) {
// 1845 				sr = (sr << 1) + (wc & 1);
// 1846 				wc >>= 1;
// 1847 				if (sr & 0x10000) sr ^= 0x11021;
// 1848 			}
// 1849 		}
// 1850 		seq = (UINT)sr;
// 1851 	}
// 1852 
// 1853 	/* itoa (hexdecimal) */
// 1854 	i = 7;
// 1855 	do {
// 1856 		c = (BYTE)((seq % 16) + '0');
// 1857 		if (c > '9') c += 7;
// 1858 		ns[i--] = c;
// 1859 		seq /= 16;
// 1860 	} while (seq);
// 1861 	ns[i] = '~';
// 1862 
// 1863 	/* Append the number to the SFN body */
// 1864 	for (j = 0; j < i && dst[j] != ' '; j++) {
// 1865 		if (dbc_1st(dst[j])) {
// 1866 			if (j == i - 1) break;
// 1867 			j++;
// 1868 		}
// 1869 	}
// 1870 	do {
// 1871 		dst[j++] = (i < 8) ? ns[i++] : ' ';
// 1872 	} while (j < 8);
// 1873 }
// 1874 #endif	/* FF_USE_LFN && !FF_FS_READONLY */
// 1875 
// 1876 
// 1877 
// 1878 #if FF_USE_LFN
// 1879 /*-----------------------------------------------------------------------*/
// 1880 /* FAT-LFN: Calculate checksum of an SFN entry                           */
// 1881 /*-----------------------------------------------------------------------*/
// 1882 
// 1883 static
// 1884 BYTE sum_sfn (
// 1885 	const BYTE* dir		/* Pointer to the SFN entry */
// 1886 )
// 1887 {
// 1888 	BYTE sum = 0;
// 1889 	UINT n = 11;
// 1890 
// 1891 	do {
// 1892 		sum = (sum >> 1) + (sum << 7) + *dir++;
// 1893 	} while (--n);
// 1894 	return sum;
// 1895 }
// 1896 
// 1897 #endif	/* FF_USE_LFN */
// 1898 
// 1899 
// 1900 
// 1901 #if FF_FS_EXFAT
// 1902 /*-----------------------------------------------------------------------*/
// 1903 /* exFAT: Checksum                                                       */
// 1904 /*-----------------------------------------------------------------------*/
// 1905 
// 1906 static
// 1907 WORD xdir_sum (			/* Get checksum of the directoly entry block */
// 1908 	const BYTE* dir		/* Directory entry block to be calculated */
// 1909 )
// 1910 {
// 1911 	UINT i, szblk;
// 1912 	WORD sum;
// 1913 
// 1914 
// 1915 	szblk = (dir[XDIR_NumSec] + 1) * SZDIRE;
// 1916 	for (i = sum = 0; i < szblk; i++) {
// 1917 		if (i == XDIR_SetSum) {	/* Skip sum field */
// 1918 			i++;
// 1919 		} else {
// 1920 			sum = ((sum & 1) ? 0x8000 : 0) + (sum >> 1) + dir[i];
// 1921 		}
// 1922 	}
// 1923 	return sum;
// 1924 }
// 1925 
// 1926 
// 1927 
// 1928 static
// 1929 WORD xname_sum (		/* Get check sum (to be used as hash) of the name */
// 1930 	const WCHAR* name	/* File name to be calculated */
// 1931 )
// 1932 {
// 1933 	WCHAR chr;
// 1934 	WORD sum = 0;
// 1935 
// 1936 
// 1937 	while ((chr = *name++) != 0) {
// 1938 		chr = ff_wtoupper(chr);		/* File name needs to be upper-case converted */
// 1939 		sum = ((sum & 1) ? 0x8000 : 0) + (sum >> 1) + (chr & 0xFF);
// 1940 		sum = ((sum & 1) ? 0x8000 : 0) + (sum >> 1) + (chr >> 8);
// 1941 	}
// 1942 	return sum;
// 1943 }
// 1944 
// 1945 
// 1946 #if !FF_FS_READONLY && FF_USE_MKFS
// 1947 static
// 1948 DWORD xsum32 (
// 1949 	BYTE  dat,	/* Byte to be calculated */
// 1950 	DWORD sum	/* Previous sum */
// 1951 )
// 1952 {
// 1953 	sum = ((sum & 1) ? 0x80000000 : 0) + (sum >> 1) + dat;
// 1954 	return sum;
// 1955 }
// 1956 #endif
// 1957 
// 1958 
// 1959 #if FF_FS_MINIMIZE <= 1 || FF_FS_RPATH >= 2
// 1960 /*------------------------------------------------------*/
// 1961 /* exFAT: Get object information from a directory block */
// 1962 /*------------------------------------------------------*/
// 1963 
// 1964 static
// 1965 void get_xdir_info (
// 1966 	BYTE* dirb,			/* Pointer to the direcotry entry block 85+C0+C1s */
// 1967 	FILINFO* fno		/* Buffer to store the extracted file information */
// 1968 )
// 1969 {
// 1970 	WCHAR w;
// 1971 	UINT di, si, nc;
// 1972 
// 1973 	/* Get file name */
// 1974 	for (si = SZDIRE * 2, nc = di = 0; nc < dirb[XDIR_NumName]; si += 2, nc++) {
// 1975 		if ((si % SZDIRE) == 0) si += 2;		/* Skip entry type field */
// 1976 		w = ld_word(dirb + si);					/* Get a character */
// 1977 #if !FF_LFN_UNICODE		/* ANSI/OEM API */
// 1978 		w = ff_uni2oem(w, CODEPAGE);			/* Convert it to OEM code */
// 1979 		if (w >= 0x100) {						/* Is it a double byte char? */
// 1980 			fno->fname[di++] = (char)(w >> 8);	/* Store 1st byte of the DBC */
// 1981 		}
// 1982 #endif
// 1983 		if (w == 0 || di >= FF_MAX_LFN) { di = 0; break; }	/* Invalid char or buffer overflow --> inaccessible object name */
// 1984 		fno->fname[di++] = (TCHAR)w;			/* Store the character */
// 1985 	}
// 1986 	if (di == 0) fno->fname[di++] = '?';	/* Inaccessible object name? */
// 1987 	fno->fname[di] = 0;						/* Terminate file name */
// 1988 
// 1989 	fno->altname[0] = 0;					/* No SFN */
// 1990 	fno->fattrib = dirb[XDIR_Attr];			/* Attribute */
// 1991 	fno->fsize = (fno->fattrib & AM_DIR) ? 0 : ld_qword(dirb + XDIR_FileSize);	/* Size */
// 1992 	fno->ftime = ld_word(dirb + XDIR_ModTime + 0);	/* Time */
// 1993 	fno->fdate = ld_word(dirb + XDIR_ModTime + 2);	/* Date */
// 1994 }
// 1995 
// 1996 #endif	/* FF_FS_MINIMIZE <= 1 || FF_FS_RPATH >= 2 */
// 1997 
// 1998 
// 1999 /*-----------------------------------*/
// 2000 /* exFAT: Get a directry entry block */
// 2001 /*-----------------------------------*/
// 2002 
// 2003 static
// 2004 FRESULT load_xdir (	/* FR_INT_ERR: invalid entry block */
// 2005 	DIR* dp			/* Reading direcotry object pointing top of the entry block to load */
// 2006 )
// 2007 {
// 2008 	FRESULT res;
// 2009 	UINT i, sz_ent;
// 2010 	BYTE* dirb = dp->obj.fs->dirbuf;	/* Pointer to the on-memory direcotry entry block 85+C0+C1s */
// 2011 
// 2012 
// 2013 	/* Load 85 entry */
// 2014 	res = move_window(dp->obj.fs, dp->sect);
// 2015 	if (res != FR_OK) return res;
// 2016 	if (dp->dir[XDIR_Type] != 0x85) return FR_INT_ERR;	/* Invalid order */
// 2017 	mem_cpy(dirb + 0 * SZDIRE, dp->dir, SZDIRE);
// 2018 	sz_ent = (dirb[XDIR_NumSec] + 1) * SZDIRE;
// 2019 	if (sz_ent < 3 * SZDIRE || sz_ent > 19 * SZDIRE) return FR_INT_ERR;
// 2020 
// 2021 	/* Load C0 entry */
// 2022 	res = dir_next(dp, 0);
// 2023 	if (res == FR_NO_FILE) res = FR_INT_ERR;	/* It cannot be */
// 2024 	if (res != FR_OK) return res;
// 2025 	res = move_window(dp->obj.fs, dp->sect);
// 2026 	if (res != FR_OK) return res;
// 2027 	if (dp->dir[XDIR_Type] != 0xC0) return FR_INT_ERR;	/* Invalid order */
// 2028 	mem_cpy(dirb + 1 * SZDIRE, dp->dir, SZDIRE);
// 2029 	if (MAXDIRB(dirb[XDIR_NumName]) > sz_ent) return FR_INT_ERR;
// 2030 
// 2031 	/* Load C1 entries */
// 2032 	i = 2 * SZDIRE;	/* C1 offset to load */
// 2033 	do {
// 2034 		res = dir_next(dp, 0);
// 2035 		if (res == FR_NO_FILE) res = FR_INT_ERR;	/* It cannot be */
// 2036 		if (res != FR_OK) return res;
// 2037 		res = move_window(dp->obj.fs, dp->sect);
// 2038 		if (res != FR_OK) return res;
// 2039 		if (dp->dir[XDIR_Type] != 0xC1) return FR_INT_ERR;	/* Invalid order */
// 2040 		if (i < MAXDIRB(FF_MAX_LFN)) mem_cpy(dirb + i, dp->dir, SZDIRE);
// 2041 	} while ((i += SZDIRE) < sz_ent);
// 2042 
// 2043 	/* Sanity check (do it for only accessible object) */
// 2044 	if (i <= MAXDIRB(FF_MAX_LFN)) {
// 2045 		if (xdir_sum(dirb) != ld_word(dirb + XDIR_SetSum)) return FR_INT_ERR;
// 2046 	}
// 2047 	return FR_OK;
// 2048 }
// 2049 
// 2050 
// 2051 #if !FF_FS_READONLY || FF_FS_RPATH != 0
// 2052 /*------------------------------------------------*/
// 2053 /* exFAT: Load the object's directory entry block */
// 2054 /*------------------------------------------------*/
// 2055 static
// 2056 FRESULT load_obj_xdir (	
// 2057 	DIR* dp,			/* Blank directory object to be used to access containing direcotry */
// 2058 	const FFOBJID* obj	/* Object with its containing directory information */
// 2059 )
// 2060 {
// 2061 	FRESULT res;
// 2062 
// 2063 	/* Open object containing directory */
// 2064 	dp->obj.fs = obj->fs;
// 2065 	dp->obj.sclust = obj->c_scl;
// 2066 	dp->obj.stat = (BYTE)obj->c_size;
// 2067 	dp->obj.objsize = obj->c_size & 0xFFFFFF00;
// 2068 	dp->obj.n_frag = 0;
// 2069 	dp->blk_ofs = obj->c_ofs;
// 2070 
// 2071 	res = dir_sdi(dp, dp->blk_ofs);	/* Goto object's entry block */
// 2072 	if (res == FR_OK) {
// 2073 		res = load_xdir(dp);		/* Load the object's entry block */
// 2074 	}
// 2075 	return res;
// 2076 }
// 2077 #endif
// 2078 
// 2079 
// 2080 #if !FF_FS_READONLY
// 2081 /*----------------------------------------*/
// 2082 /* exFAT: Store the directory entry block */
// 2083 /*----------------------------------------*/
// 2084 static
// 2085 FRESULT store_xdir (
// 2086 	DIR* dp				/* Pointer to the direcotry object */
// 2087 )
// 2088 {
// 2089 	FRESULT res;
// 2090 	UINT nent;
// 2091 	BYTE* dirb = dp->obj.fs->dirbuf;	/* Pointer to the direcotry entry block 85+C0+C1s */
// 2092 
// 2093 	/* Create set sum */
// 2094 	st_word(dirb + XDIR_SetSum, xdir_sum(dirb));
// 2095 	nent = dirb[XDIR_NumSec] + 1;
// 2096 
// 2097 	/* Store the direcotry entry block to the directory */
// 2098 	res = dir_sdi(dp, dp->blk_ofs);
// 2099 	while (res == FR_OK) {
// 2100 		res = move_window(dp->obj.fs, dp->sect);
// 2101 		if (res != FR_OK) break;
// 2102 		mem_cpy(dp->dir, dirb, SZDIRE);
// 2103 		dp->obj.fs->wflag = 1;
// 2104 		if (--nent == 0) break;
// 2105 		dirb += SZDIRE;
// 2106 		res = dir_next(dp, 0);
// 2107 	}
// 2108 	return (res == FR_OK || res == FR_DISK_ERR) ? res : FR_INT_ERR;
// 2109 }
// 2110 
// 2111 
// 2112 
// 2113 /*-------------------------------------------*/
// 2114 /* exFAT: Create a new directory enrty block */
// 2115 /*-------------------------------------------*/
// 2116 
// 2117 static
// 2118 void create_xdir (
// 2119 	BYTE* dirb,			/* Pointer to the direcotry entry block buffer */
// 2120 	const WCHAR* lfn	/* Pointer to the object name */
// 2121 )
// 2122 {
// 2123 	UINT i;
// 2124 	BYTE nc1, nlen;
// 2125 	WCHAR chr;
// 2126 
// 2127 
// 2128 	/* Create 85+C0 entry */
// 2129 	mem_set(dirb, 0, 2 * SZDIRE);
// 2130 	dirb[0 * SZDIRE + XDIR_Type] = 0x85;
// 2131 	dirb[1 * SZDIRE + XDIR_Type] = 0xC0;
// 2132 
// 2133 	/* Create C1 entries */
// 2134 	nlen = nc1 = 0; chr = 1; i = SZDIRE * 2;
// 2135 	do {
// 2136 		dirb[i++] = 0xC1; dirb[i++] = 0;	/* Entry type C1 */
// 2137 		do {	/* Fill name field */
// 2138 			if (chr && (chr = lfn[nlen]) != 0) nlen++;	/* Get a character if exist */
// 2139 			st_word(dirb + i, chr); 		/* Store it */
// 2140 			i += 2;
// 2141 		} while (i % SZDIRE != 0);
// 2142 		nc1++;
// 2143 	} while (lfn[nlen]);	/* Fill next entry if any char follows */
// 2144 
// 2145 	dirb[XDIR_NumName] = nlen;		/* Set name length */
// 2146 	dirb[XDIR_NumSec] = 1 + nc1;	/* Set secondary count */
// 2147 	st_word(dirb + XDIR_NameHash, xname_sum(lfn));	/* Set name hash */
// 2148 }
// 2149 
// 2150 #endif	/* !FF_FS_READONLY */
// 2151 #endif	/* FF_FS_EXFAT */
// 2152 
// 2153 
// 2154 
// 2155 #if FF_FS_MINIMIZE <= 1 || FF_FS_RPATH >= 2 || FF_USE_LABEL || FF_FS_EXFAT
// 2156 /*-----------------------------------------------------------------------*/
// 2157 /* Read an object from the directory                                     */
// 2158 /*-----------------------------------------------------------------------*/
// 2159 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function dir_read
        THUMB
// 2160 static
// 2161 FRESULT dir_read (
// 2162 	DIR* dp,		/* Pointer to the directory object */
// 2163 	int vol			/* Filtered by 0:file/directory or 1:volume label */
// 2164 )
// 2165 {
dir_read:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
// 2166 	FRESULT res = FR_NO_FILE;
        MOVS     R0,#+4
// 2167 	FATFS *fs = dp->obj.fs;
        LDR      R6,[R4, #+0]
// 2168 	BYTE a, c;
// 2169 #if FF_USE_LFN
// 2170 	BYTE ord = 0xFF, sum = 0xFF;
// 2171 #endif
// 2172 
// 2173 	while (dp->sect) {
??dir_read_0:
        LDR      R1,[R4, #+24]
        CMP      R1,#+0
        BEQ.N    ??dir_read_1
// 2174 		res = move_window(fs, dp->sect);
        LDR      R1,[R4, #+24]
        MOVS     R0,R6
          CFI FunCall move_window
        BL       move_window
// 2175 		if (res != FR_OK) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??dir_read_1
// 2176 		c = dp->dir[DIR_Name];	/* Test for the entry type */
??dir_read_2:
        LDR      R1,[R4, #+28]
        LDRB     R2,[R1, #+0]
// 2177 		if (c == 0) {
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BNE.N    ??dir_read_3
// 2178 			res = FR_NO_FILE; break; /* Reached to end of the directory */
        MOVS     R0,#+4
        B.N      ??dir_read_1
// 2179 		}
// 2180 #if FF_FS_EXFAT
// 2181 		if (fs->fs_type == FS_EXFAT) {	/* On the exFAT volume */
// 2182 			if (FF_USE_LABEL && vol) {
// 2183 				if (c == 0x83) break;	/* Volume label entry? */
// 2184 			} else {
// 2185 				if (c == 0x85) {		/* Start of the file entry block? */
// 2186 					dp->blk_ofs = dp->dptr;	/* Get location of the block */
// 2187 					res = load_xdir(dp);	/* Load the entry block */
// 2188 					if (res == FR_OK) {
// 2189 						dp->obj.attr = fs->dirbuf[XDIR_Attr] & AM_MASK;	/* Get attribute */
// 2190 					}
// 2191 					break;
// 2192 				}
// 2193 			}
// 2194 		} else
// 2195 #endif
// 2196 		{	/* On the FAT/FAT32 volume */
// 2197 			dp->obj.attr = a = dp->dir[DIR_Attr] & AM_MASK;	/* Get attribute */
??dir_read_3:
        LDR      R1,[R4, #+28]
        LDRB     R1,[R1, #+11]
        ANDS     R1,R1,#0x3F
        STRB     R1,[R4, #+6]
// 2198 #if FF_USE_LFN		/* LFN configuration */
// 2199 			if (c == DDEM || c == '.' || (int)((a & ~AM_ARC) == AM_VOL) != vol) {	/* An entry without valid data */
// 2200 				ord = 0xFF;
// 2201 			} else {
// 2202 				if (a == AM_LFN) {			/* An LFN entry is found */
// 2203 					if (c & LLEF) {			/* Is it start of an LFN sequence? */
// 2204 						sum = dp->dir[LDIR_Chksum];
// 2205 						c &= (BYTE)~LLEF; ord = c;
// 2206 						dp->blk_ofs = dp->dptr;
// 2207 					}
// 2208 					/* Check LFN validity and capture it */
// 2209 					ord = (c == ord && sum == dp->dir[LDIR_Chksum] && pick_lfn(fs->lfnbuf, dp->dir)) ? ord - 1 : 0xFF;
// 2210 				} else {					/* An SFN entry is found */
// 2211 					if (ord || sum != sum_sfn(dp->dir)) {	/* Is there a valid LFN? */
// 2212 						dp->blk_ofs = 0xFFFFFFFF;			/* It has no LFN. */
// 2213 					}
// 2214 					break;
// 2215 				}
// 2216 			}
// 2217 #else		/* Non LFN configuration */
// 2218 			if (c != DDEM && c != '.' && a != AM_LFN && (int)((a & ~AM_ARC) == AM_VOL) == vol) {	/* Is it a valid entry? */
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+229
        BEQ.N    ??dir_read_4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+46
        BEQ.N    ??dir_read_4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+15
        BEQ.N    ??dir_read_4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        BICS     R1,R1,#0x20
        CMP      R1,#+8
        BNE.N    ??dir_read_5
        MOVS     R1,#+1
        B.N      ??dir_read_6
??dir_read_5:
        MOVS     R1,#+0
??dir_read_6:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,R5
        BEQ.N    ??dir_read_1
// 2219 				break;
// 2220 			}
// 2221 #endif
// 2222 		}
// 2223 		res = dir_next(dp, 0);		/* Next entry */
??dir_read_4:
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_next
        BL       dir_next
// 2224 		if (res != FR_OK) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??dir_read_0
// 2225 	}
// 2226 
// 2227 	if (res != FR_OK) dp->sect = 0;		/* Terminate the read operation on error or EOT */
??dir_read_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??dir_read_7
        MOVS     R1,#+0
        STR      R1,[R4, #+24]
// 2228 	return res;
??dir_read_7:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock24
// 2229 }
// 2230 
// 2231 #endif	/* FF_FS_MINIMIZE <= 1 || FF_USE_LABEL || FF_FS_RPATH >= 2 */
// 2232 
// 2233 
// 2234 
// 2235 /*-----------------------------------------------------------------------*/
// 2236 /* Directory handling - Find an object in the directory                  */
// 2237 /*-----------------------------------------------------------------------*/
// 2238 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function dir_find
        THUMB
// 2239 static
// 2240 FRESULT dir_find (	/* FR_OK(0):succeeded, !=0:error */
// 2241 	DIR* dp			/* Pointer to the directory object with the file name */
// 2242 )
// 2243 {
dir_find:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R5,R0
// 2244 	FRESULT res;
// 2245 	FATFS *fs = dp->obj.fs;
        LDR      R6,[R5, #+0]
// 2246 	BYTE c;
// 2247 #if FF_USE_LFN
// 2248 	BYTE a, ord, sum;
// 2249 #endif
// 2250 
// 2251 	res = dir_sdi(dp, 0);			/* Rewind directory object */
        MOVS     R1,#+0
        MOVS     R0,R5
          CFI FunCall dir_sdi
        BL       dir_sdi
        MOVS     R4,R0
// 2252 	if (res != FR_OK) return res;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??dir_find_0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??dir_find_1
// 2253 #if FF_FS_EXFAT
// 2254 	if (fs->fs_type == FS_EXFAT) {	/* On the exFAT volume */
// 2255 		BYTE nc;
// 2256 		UINT di, ni;
// 2257 		WORD hash = xname_sum(fs->lfnbuf);		/* Hash value of the name to find */
// 2258 
// 2259 		while ((res = dir_read(dp, 0)) == FR_OK) {	/* Read an item */
// 2260 #if FF_MAX_LFN < 255
// 2261 			if (fs->dirbuf[XDIR_NumName] > FF_MAX_LFN) continue;			/* Skip comparison if inaccessible object name */
// 2262 #endif
// 2263 			if (ld_word(fs->dirbuf + XDIR_NameHash) != hash) continue;	/* Skip comparison if hash mismatched */
// 2264 			for (nc = fs->dirbuf[XDIR_NumName], di = SZDIRE * 2, ni = 0; nc; nc--, di += 2, ni++) {	/* Compare the name */
// 2265 				if ((di % SZDIRE) == 0) di += 2;
// 2266 				if (ff_wtoupper(ld_word(fs->dirbuf + di)) != ff_wtoupper(fs->lfnbuf[ni])) break;
// 2267 			}
// 2268 			if (nc == 0 && !fs->lfnbuf[ni]) break;	/* Name matched? */
// 2269 		}
// 2270 		return res;
// 2271 	}
// 2272 #endif
// 2273 	/* On the FAT/FAT32 volume */
// 2274 #if FF_USE_LFN
// 2275 	ord = sum = 0xFF; dp->blk_ofs = 0xFFFFFFFF;	/* Reset LFN sequence */
// 2276 #endif
// 2277 	do {
// 2278 		res = move_window(fs, dp->sect);
??dir_find_0:
        LDR      R1,[R5, #+24]
        MOVS     R0,R6
          CFI FunCall move_window
        BL       move_window
        MOVS     R4,R0
// 2279 		if (res != FR_OK) break;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??dir_find_2
// 2280 		c = dp->dir[DIR_Name];
??dir_find_3:
        LDR      R0,[R5, #+28]
        LDRB     R0,[R0, #+0]
// 2281 		if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??dir_find_4
        MOVS     R4,#+4
        B.N      ??dir_find_2
// 2282 #if FF_USE_LFN		/* LFN configuration */
// 2283 		dp->obj.attr = a = dp->dir[DIR_Attr] & AM_MASK;
// 2284 		if (c == DDEM || ((a & AM_VOL) && a != AM_LFN)) {	/* An entry without valid data */
// 2285 			ord = 0xFF; dp->blk_ofs = 0xFFFFFFFF;	/* Reset LFN sequence */
// 2286 		} else {
// 2287 			if (a == AM_LFN) {			/* An LFN entry is found */
// 2288 				if (!(dp->fn[NSFLAG] & NS_NOLFN)) {
// 2289 					if (c & LLEF) {		/* Is it start of LFN sequence? */
// 2290 						sum = dp->dir[LDIR_Chksum];
// 2291 						c &= (BYTE)~LLEF; ord = c;	/* LFN start order */
// 2292 						dp->blk_ofs = dp->dptr;	/* Start offset of LFN */
// 2293 					}
// 2294 					/* Check validity of the LFN entry and compare it with given name */
// 2295 					ord = (c == ord && sum == dp->dir[LDIR_Chksum] && cmp_lfn(fs->lfnbuf, dp->dir)) ? ord - 1 : 0xFF;
// 2296 				}
// 2297 			} else {					/* An SFN entry is found */
// 2298 				if (!ord && sum == sum_sfn(dp->dir)) break;	/* LFN matched? */
// 2299 				if (!(dp->fn[NSFLAG] & NS_LOSS) && !mem_cmp(dp->dir, dp->fn, 11)) break;	/* SFN matched? */
// 2300 				ord = 0xFF; dp->blk_ofs = 0xFFFFFFFF;	/* Reset LFN sequence */
// 2301 			}
// 2302 		}
// 2303 #else		/* Non LFN configuration */
// 2304 		dp->obj.attr = dp->dir[DIR_Attr] & AM_MASK;
??dir_find_4:
        LDR      R0,[R5, #+28]
        LDRB     R0,[R0, #+11]
        ANDS     R0,R0,#0x3F
        STRB     R0,[R5, #+6]
// 2305 		if (!(dp->dir[DIR_Attr] & AM_VOL) && !mem_cmp(dp->dir, dp->fn, 11)) break;	/* Is it a valid entry? */
        LDR      R0,[R5, #+28]
        LDRB     R0,[R0, #+11]
        LSLS     R0,R0,#+28
        BMI.N    ??dir_find_5
        MOVS     R2,#+11
        ADDS     R1,R5,#+32
        LDR      R0,[R5, #+28]
          CFI FunCall mem_cmp
        BL       mem_cmp
        CMP      R0,#+0
        BEQ.N    ??dir_find_2
// 2306 #endif
// 2307 		res = dir_next(dp, 0);	/* Next entry */
??dir_find_5:
        MOVS     R1,#+0
        MOVS     R0,R5
          CFI FunCall dir_next
        BL       dir_next
        MOVS     R4,R0
// 2308 	} while (res == FR_OK);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??dir_find_0
// 2309 
// 2310 	return res;
??dir_find_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??dir_find_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock25
// 2311 }
// 2312 
// 2313 
// 2314 
// 2315 
// 2316 #if !FF_FS_READONLY
// 2317 /*-----------------------------------------------------------------------*/
// 2318 /* Register an object to the directory                                   */
// 2319 /*-----------------------------------------------------------------------*/
// 2320 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock26 Using cfiCommon0
          CFI Function dir_register
        THUMB
// 2321 static
// 2322 FRESULT dir_register (	/* FR_OK:succeeded, FR_DENIED:no free entry or too many SFN collision, FR_DISK_ERR:disk error */
// 2323 	DIR* dp				/* Target directory with object name to be created */
// 2324 )
// 2325 {
dir_register:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
// 2326 	FRESULT res;
// 2327 	FATFS *fs = dp->obj.fs;
        LDR      R6,[R4, #+0]
// 2328 #if FF_USE_LFN		/* LFN configuration */
// 2329 	UINT n, nlen, nent;
// 2330 	BYTE sn[12], sum;
// 2331 
// 2332 
// 2333 	if (dp->fn[NSFLAG] & (NS_DOT | NS_NONAME)) return FR_INVALID_NAME;	/* Check name validity */
// 2334 	for (nlen = 0; fs->lfnbuf[nlen]; nlen++) ;	/* Get lfn length */
// 2335 
// 2336 #if FF_FS_EXFAT
// 2337 	if (fs->fs_type == FS_EXFAT) {	/* On the exFAT volume */
// 2338 		nent = (nlen + 14) / 15 + 2;	/* Number of entries to allocate (85+C0+C1s) */
// 2339 		res = dir_alloc(dp, nent);		/* Allocate entries */
// 2340 		if (res != FR_OK) return res;
// 2341 		dp->blk_ofs = dp->dptr - SZDIRE * (nent - 1);	/* Set the allocated entry block offset */
// 2342 
// 2343 		if (dp->obj.stat & 4) {			/* Has the directory been stretched? */
// 2344 			dp->obj.stat &= ~4;
// 2345 			res = fill_first_frag(&dp->obj);	/* Fill the first fragment on the FAT if needed */
// 2346 			if (res != FR_OK) return res;
// 2347 			res = fill_last_frag(&dp->obj, dp->clust, 0xFFFFFFFF);	/* Fill the last fragment on the FAT if needed */
// 2348 			if (res != FR_OK) return res;
// 2349 			if (dp->obj.sclust != 0) {		/* Is it a sub directory? */
// 2350 				DIR dj;
// 2351 
// 2352 				res = load_obj_xdir(&dj, &dp->obj);	/* Load the object status */
// 2353 				if (res != FR_OK) return res;
// 2354 				dp->obj.objsize += (DWORD)fs->csize * SS(fs);			/* Increase the directory size by cluster size */
// 2355 				st_qword(fs->dirbuf + XDIR_FileSize, dp->obj.objsize);	/* Update the allocation status */
// 2356 				st_qword(fs->dirbuf + XDIR_ValidFileSize, dp->obj.objsize);
// 2357 				fs->dirbuf[XDIR_GenFlags] = dp->obj.stat | 1;
// 2358 				res = store_xdir(&dj);				/* Store the object status */
// 2359 				if (res != FR_OK) return res;
// 2360 			}
// 2361 		}
// 2362 
// 2363 		create_xdir(fs->dirbuf, fs->lfnbuf);	/* Create on-memory directory block to be written later */
// 2364 		return FR_OK;
// 2365 	}
// 2366 #endif
// 2367 	/* On the FAT/FAT32 volume */
// 2368 	mem_cpy(sn, dp->fn, 12);
// 2369 	if (sn[NSFLAG] & NS_LOSS) {			/* When LFN is out of 8.3 format, generate a numbered name */
// 2370 		dp->fn[NSFLAG] = NS_NOLFN;		/* Find only SFN */
// 2371 		for (n = 1; n < 100; n++) {
// 2372 			gen_numname(dp->fn, sn, fs->lfnbuf, n);	/* Generate a numbered name */
// 2373 			res = dir_find(dp);				/* Check if the name collides with existing SFN */
// 2374 			if (res != FR_OK) break;
// 2375 		}
// 2376 		if (n == 100) return FR_DENIED;		/* Abort if too many collisions */
// 2377 		if (res != FR_NO_FILE) return res;	/* Abort if the result is other than 'not collided' */
// 2378 		dp->fn[NSFLAG] = sn[NSFLAG];
// 2379 	}
// 2380 
// 2381 	/* Create an SFN with/without LFNs. */
// 2382 	nent = (sn[NSFLAG] & NS_LFN) ? (nlen + 12) / 13 + 1 : 1;	/* Number of entries to allocate */
// 2383 	res = dir_alloc(dp, nent);		/* Allocate entries */
// 2384 	if (res == FR_OK && --nent) {	/* Set LFN entry if needed */
// 2385 		res = dir_sdi(dp, dp->dptr - nent * SZDIRE);
// 2386 		if (res == FR_OK) {
// 2387 			sum = sum_sfn(dp->fn);	/* Checksum value of the SFN tied to the LFN */
// 2388 			do {					/* Store LFN entries in bottom first */
// 2389 				res = move_window(fs, dp->sect);
// 2390 				if (res != FR_OK) break;
// 2391 				put_lfn(fs->lfnbuf, dp->dir, (BYTE)nent, sum);
// 2392 				fs->wflag = 1;
// 2393 				res = dir_next(dp, 0);	/* Next entry */
// 2394 			} while (res == FR_OK && --nent);
// 2395 		}
// 2396 	}
// 2397 
// 2398 #else	/* Non LFN configuration */
// 2399 	res = dir_alloc(dp, 1);		/* Allocate an entry for SFN */
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall dir_alloc
        BL       dir_alloc
        MOVS     R5,R0
// 2400 
// 2401 #endif
// 2402 
// 2403 	/* Set SFN entry */
// 2404 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_0
// 2405 		res = move_window(fs, dp->sect);
        LDR      R1,[R4, #+24]
        MOVS     R0,R6
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
// 2406 		if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_0
// 2407 			mem_set(dp->dir, 0, SZDIRE);	/* Clean the entry */
        MOVS     R2,#+32
        MOVS     R1,#+0
        LDR      R0,[R4, #+28]
          CFI FunCall mem_set
        BL       mem_set
// 2408 			mem_cpy(dp->dir + DIR_Name, dp->fn, 11);	/* Put SFN */
        MOVS     R2,#+11
        ADDS     R1,R4,#+32
        LDR      R0,[R4, #+28]
          CFI FunCall mem_cpy
        BL       mem_cpy
// 2409 #if FF_USE_LFN
// 2410 			dp->dir[DIR_NTres] = dp->fn[NSFLAG] & (NS_BODY | NS_EXT);	/* Put NT flag */
// 2411 #endif
// 2412 			fs->wflag = 1;
        MOVS     R0,#+1
        STRB     R0,[R6, #+3]
// 2413 		}
// 2414 	}
// 2415 
// 2416 	return res;
??dir_register_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock26
// 2417 }
// 2418 
// 2419 #endif /* !FF_FS_READONLY */
// 2420 
// 2421 
// 2422 
// 2423 #if !FF_FS_READONLY && FF_FS_MINIMIZE == 0
// 2424 /*-----------------------------------------------------------------------*/
// 2425 /* Remove an object from the directory                                   */
// 2426 /*-----------------------------------------------------------------------*/
// 2427 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock27 Using cfiCommon0
          CFI Function dir_remove
        THUMB
// 2428 static
// 2429 FRESULT dir_remove (	/* FR_OK:Succeeded, FR_DISK_ERR:A disk error */
// 2430 	DIR* dp				/* Directory object pointing the entry to be removed */
// 2431 )
// 2432 {
dir_remove:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
// 2433 	FRESULT res;
// 2434 	FATFS *fs = dp->obj.fs;
        LDR      R5,[R4, #+0]
// 2435 #if FF_USE_LFN		/* LFN configuration */
// 2436 	DWORD last = dp->dptr;
// 2437 
// 2438 	res = (dp->blk_ofs == 0xFFFFFFFF) ? FR_OK : dir_sdi(dp, dp->blk_ofs);	/* Goto top of the entry block if LFN is exist */
// 2439 	if (res == FR_OK) {
// 2440 		do {
// 2441 			res = move_window(fs, dp->sect);
// 2442 			if (res != FR_OK) break;
// 2443 			/* Mark an entry 'deleted' */
// 2444 			if (FF_FS_EXFAT && fs->fs_type == FS_EXFAT) {	/* On the exFAT volume */
// 2445 				dp->dir[XDIR_Type] &= 0x7F;
// 2446 			} else {									/* On the FAT/FAT32 volume */
// 2447 				dp->dir[DIR_Name] = DDEM;
// 2448 			}
// 2449 			fs->wflag = 1;
// 2450 			if (dp->dptr >= last) break;	/* If reached last entry then all entries of the object has been deleted. */
// 2451 			res = dir_next(dp, 0);	/* Next entry */
// 2452 		} while (res == FR_OK);
// 2453 		if (res == FR_NO_FILE) res = FR_INT_ERR;
// 2454 	}
// 2455 #else			/* Non LFN configuration */
// 2456 
// 2457 	res = move_window(fs, dp->sect);
        LDR      R1,[R4, #+24]
        MOVS     R0,R5
          CFI FunCall move_window
        BL       move_window
// 2458 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??dir_remove_0
// 2459 		dp->dir[DIR_Name] = DDEM;
        LDR      R1,[R4, #+28]
        MOVS     R2,#+229
        STRB     R2,[R1, #+0]
// 2460 		fs->wflag = 1;
        MOVS     R1,#+1
        STRB     R1,[R5, #+3]
// 2461 	}
// 2462 #endif
// 2463 
// 2464 	return res;
??dir_remove_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock27
// 2465 }
// 2466 
// 2467 #endif /* !FF_FS_READONLY && FF_FS_MINIMIZE == 0 */
// 2468 
// 2469 
// 2470 
// 2471 #if FF_FS_MINIMIZE <= 1 || FF_FS_RPATH >= 2
// 2472 /*-----------------------------------------------------------------------*/
// 2473 /* Get file information from directory entry                             */
// 2474 /*-----------------------------------------------------------------------*/
// 2475 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock28 Using cfiCommon0
          CFI Function get_fileinfo
        THUMB
// 2476 static
// 2477 void get_fileinfo (		/* No return code */
// 2478 	DIR* dp,			/* Pointer to the directory object */
// 2479 	FILINFO* fno	 	/* Pointer to the file information to be filled */
// 2480 )
// 2481 {
get_fileinfo:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
// 2482 	UINT i, j;
// 2483 	TCHAR c;
// 2484 	DWORD tm;
// 2485 #if FF_USE_LFN
// 2486 	WCHAR w, lfv;
// 2487 	FATFS *fs = dp->obj.fs;
// 2488 #endif
// 2489 
// 2490 
// 2491 	fno->fname[0] = 0;			/* Invaidate file info */
        MOVS     R0,#+0
        STRB     R0,[R5, #+9]
// 2492 	if (dp->sect == 0) return;	/* Exit if read pointer has reached end of directory */
        LDR      R0,[R4, #+24]
        CMP      R0,#+0
        BEQ.N    ??get_fileinfo_0
// 2493 
// 2494 #if FF_USE_LFN		/* LFN configuration */
// 2495 #if FF_FS_EXFAT
// 2496 	if (fs->fs_type == FS_EXFAT) {	/* On the exFAT volume */
// 2497 		get_xdir_info(fs->dirbuf, fno);
// 2498 		return;
// 2499 	} else
// 2500 #endif
// 2501 	{	/* On the FAT/FAT32 volume */
// 2502 		if (dp->blk_ofs != 0xFFFFFFFF) {	/* Get LFN if available */
// 2503 			i = j = 0;
// 2504 			while ((w = fs->lfnbuf[j++]) != 0) {	/* Get an LFN character */
// 2505 #if !FF_LFN_UNICODE	/* ANSI/OEM API */
// 2506 				w = ff_uni2oem(w, CODEPAGE);	/* Unicode -> OEM */
// 2507 				if (w == 0) { i = 0; break; }	/* No LFN if it could not be converted */
// 2508 				if (w >= 0x100) {				/* Put 1st byte if it is a DBC */
// 2509 					fno->fname[i++] = (char)(w >> 8);
// 2510 				}
// 2511 #endif
// 2512 				if (i >= FF_MAX_LFN) { i = 0; break; }	/* No LFN if buffer overflow */
// 2513 				fno->fname[i++] = (TCHAR)w;
// 2514 			}
// 2515 			fno->fname[i] = 0;	/* Terminate the LFN */
// 2516 		}
// 2517 	}
// 2518 
// 2519 	i = j = 0;
// 2520 	lfv = fno->fname[i];	/* LFN is exist if non-zero */
// 2521 	while (i < 11) {		/* Copy name body and extension */
// 2522 		c = (TCHAR)dp->dir[i++];
// 2523 		if (c == ' ') continue;				/* Skip padding spaces */
// 2524 		if (c == RDDEM) c = (TCHAR)DDEM;	/* Restore replaced DDEM character */
// 2525 		if (i == 9) {						/* Insert a . if extension is exist */
// 2526 			if (!lfv) fno->fname[j] = '.';
// 2527 			fno->altname[j++] = '.';
// 2528 		}
// 2529 #if FF_LFN_UNICODE	/* Unicode API */
// 2530 		if (dbc_1st((BYTE)c) && i != 8 && i != 11 && dbc_2nd(dp->dir[i])) {
// 2531 			c = c << 8 | dp->dir[i++];
// 2532 		}
// 2533 		c = ff_oem2uni(c, CODEPAGE);	/* OEM -> Unicode */
// 2534 		if (!c) c = '?';
// 2535 #endif
// 2536 		fno->altname[j] = c;
// 2537 		if (!lfv) {
// 2538 			if (IsUpper(c) && (dp->dir[DIR_NTres] & ((i >= 9) ? NS_EXT : NS_BODY))) {
// 2539 				c += 0x20;			/* To lower */
// 2540 			}
// 2541 			fno->fname[j] = c;
// 2542 		}
// 2543 		j++;
// 2544 	}
// 2545 	if (!lfv) {
// 2546 		fno->fname[j] = 0;
// 2547 		if (!dp->dir[DIR_NTres]) j = 0;	/* Altname is no longer needed if neither LFN nor case info is exist. */
// 2548 	}
// 2549 	fno->altname[j] = 0;	/* Terminate the SFN */
// 2550 
// 2551 #else	/* Non-LFN configuration */
// 2552 	i = j = 0;
??get_fileinfo_1:
        MOVS     R0,#+0
        MOVS     R1,R0
        B.N      ??get_fileinfo_2
// 2553 	while (i < 11) {		/* Copy name body and extension */
// 2554 		c = (TCHAR)dp->dir[i++];
// 2555 		if (c == ' ') continue;				/* Skip padding spaces */
??get_fileinfo_3:
??get_fileinfo_2:
        CMP      R0,#+11
        BCS.N    ??get_fileinfo_4
        LDR      R2,[R4, #+28]
        LDRB     R2,[R0, R2]
        ADDS     R0,R0,#+1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+32
        BEQ.N    ??get_fileinfo_3
// 2556 		if (c == RDDEM) c = (TCHAR)DDEM;	/* Restore replaced DDEM character */
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+5
        BNE.N    ??get_fileinfo_5
        MOVS     R2,#+229
// 2557 		if (i == 9) fno->fname[j++] = '.';	/* Insert a . if extension is exist */
??get_fileinfo_5:
        CMP      R0,#+9
        BNE.N    ??get_fileinfo_6
        ADDS     R3,R1,R5
        MOVS     R6,#+46
        STRB     R6,[R3, #+9]
        ADDS     R1,R1,#+1
// 2558 		fno->fname[j++] = c;
??get_fileinfo_6:
        ADDS     R3,R1,R5
        STRB     R2,[R3, #+9]
        ADDS     R1,R1,#+1
        B.N      ??get_fileinfo_2
// 2559 	}
// 2560 	fno->fname[j] = 0;
??get_fileinfo_4:
        ADDS     R0,R1,R5
        MOVS     R1,#+0
        STRB     R1,[R0, #+9]
// 2561 #endif
// 2562 
// 2563 	fno->fattrib = dp->dir[DIR_Attr];				/* Attribute */
        LDR      R0,[R4, #+28]
        LDRB     R0,[R0, #+11]
        STRB     R0,[R5, #+8]
// 2564 	fno->fsize = ld_dword(dp->dir + DIR_FileSize);	/* Size */
        LDR      R0,[R4, #+28]
        ADDS     R0,R0,#+28
          CFI FunCall ld_dword
        BL       ld_dword
        STR      R0,[R5, #+0]
// 2565 	tm = ld_dword(dp->dir + DIR_ModTime);			/* Timestamp */
        LDR      R0,[R4, #+28]
        ADDS     R0,R0,#+22
          CFI FunCall ld_dword
        BL       ld_dword
// 2566 	fno->ftime = (WORD)tm; fno->fdate = (WORD)(tm >> 16);
        STRH     R0,[R5, #+6]
        LSRS     R0,R0,#+16
        STRH     R0,[R5, #+4]
// 2567 }
??get_fileinfo_0:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock28
// 2568 
// 2569 #endif /* FF_FS_MINIMIZE <= 1 || FF_FS_RPATH >= 2 */
// 2570 
// 2571 
// 2572 
// 2573 #if FF_USE_FIND && FF_FS_MINIMIZE <= 1
// 2574 /*-----------------------------------------------------------------------*/
// 2575 /* Pattern matching                                                      */
// 2576 /*-----------------------------------------------------------------------*/
// 2577 
// 2578 static
// 2579 WCHAR get_achar (		/* Get a character and advances ptr 1 or 2 */
// 2580 	const TCHAR** ptr	/* Pointer to pointer to the SBCS/DBCS/Unicode string */
// 2581 )
// 2582 {
// 2583 	WCHAR chr;
// 2584 
// 2585 #if FF_LFN_UNICODE && FF_USE_LFN	/* Unicode API */
// 2586 	chr = ff_wtoupper(*(*ptr)++);			/* Get a Unicode char and to upper */
// 2587 #else								/* ANSI/OEM API */
// 2588 	chr = (BYTE)*(*ptr)++;					/* Get a byte */
// 2589 	if (IsLower(chr)) chr -= 0x20;			/* To upper ASCII char */
// 2590 #if FF_CODE_PAGE == 0
// 2591 	if (ExCvt && chr >= 0x80) chr = ExCvt[chr - 0x80];	/* To upper SBCS extended char */
// 2592 #elif FF_CODE_PAGE < 900
// 2593 	if (chr >= 0x80) chr = ExCvt[chr - 0x80];	/* To upper SBCS extended char */
// 2594 #endif
// 2595 #if FF_CODE_PAGE == 0 || FF_CODE_PAGE >= 900
// 2596 	if (dbc_1st((BYTE)chr) && dbc_2nd((BYTE)**ptr)) {	/* Get DBC 2nd byte if needed */
// 2597 		chr = chr << 8 | (BYTE)*(*ptr)++;
// 2598 	}
// 2599 #endif
// 2600 #endif
// 2601 	return chr;
// 2602 }
// 2603 
// 2604 
// 2605 static
// 2606 int pattern_matching (	/* 0:not matched, 1:matched */
// 2607 	const TCHAR* pat,	/* Matching pattern */
// 2608 	const TCHAR* nam,	/* String to be tested */
// 2609 	int skip,			/* Number of pre-skip chars (number of ?s) */
// 2610 	int inf				/* Infinite search (* specified) */
// 2611 )
// 2612 {
// 2613 	const TCHAR *pp, *np;
// 2614 	WCHAR pc, nc;
// 2615 	int nm, nx;
// 2616 
// 2617 
// 2618 	while (skip--) {				/* Pre-skip name chars */
// 2619 		if (!get_achar(&nam)) return 0;	/* Branch mismatched if less name chars */
// 2620 	}
// 2621 	if (!*pat && inf) return 1;		/* (short circuit) */
// 2622 
// 2623 	do {
// 2624 		pp = pat; np = nam;			/* Top of pattern and name to match */
// 2625 		for (;;) {
// 2626 			if (*pp == '?' || *pp == '*') {	/* Wildcard? */
// 2627 				nm = nx = 0;
// 2628 				do {				/* Analyze the wildcard chars */
// 2629 					if (*pp++ == '?') nm++; else nx = 1;
// 2630 				} while (*pp == '?' || *pp == '*');
// 2631 				if (pattern_matching(pp, np, nm, nx)) return 1;	/* Test new branch (recurs upto number of wildcard blocks in the pattern) */
// 2632 				nc = *np; break;	/* Branch mismatched */
// 2633 			}
// 2634 			pc = get_achar(&pp);	/* Get a pattern char */
// 2635 			nc = get_achar(&np);	/* Get a name char */
// 2636 			if (pc != nc) break;	/* Branch mismatched? */
// 2637 			if (pc == 0) return 1;	/* Branch matched? (matched at end of both strings) */
// 2638 		}
// 2639 		get_achar(&nam);			/* nam++ */
// 2640 	} while (inf && nc);			/* Retry until end of name if infinite search is specified */
// 2641 
// 2642 	return 0;
// 2643 }
// 2644 
// 2645 #endif /* FF_USE_FIND && FF_FS_MINIMIZE <= 1 */
// 2646 
// 2647 
// 2648 
// 2649 /*-----------------------------------------------------------------------*/
// 2650 /* Pick a top segment and create the object name in directory form       */
// 2651 /*-----------------------------------------------------------------------*/
// 2652 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock29 Using cfiCommon0
          CFI Function create_name
        THUMB
// 2653 static
// 2654 FRESULT create_name (	/* FR_OK: successful, FR_INVALID_NAME: could not create */
// 2655 	DIR* dp,			/* Pointer to the directory object */
// 2656 	const TCHAR** path	/* Pointer to pointer to the segment in the path string */
// 2657 )
// 2658 {
create_name:
        PUSH     {R3-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+40
        MOVS     R5,R1
// 2659 #if FF_USE_LFN		/* LFN configuration */
// 2660 	BYTE b, cf;
// 2661 	WCHAR w, *lfn;
// 2662 	UINT i, ni, si, di;
// 2663 	const TCHAR *p;
// 2664 
// 2665 
// 2666 	/* Create LFN in Unicode */
// 2667 	p = *path; lfn = dp->obj.fs->lfnbuf; si = di = 0;
// 2668 	for (;;) {
// 2669 		w = p[si++];					/* Get a character */
// 2670 		if (w < ' ') break;				/* Break if end of the path name */
// 2671 		if (w == '/' || w == '\\') {	/* Break if a separator is found */
// 2672 			while (p[si] == '/' || p[si] == '\\') si++;	/* Skip duplicated separator if exist */
// 2673 			break;
// 2674 		}
// 2675 		if (di >= FF_MAX_LFN) return FR_INVALID_NAME;	/* Reject too long name */
// 2676 #if !FF_LFN_UNICODE		/* ANSI/OEM API */
// 2677 		w &= 0xFF;
// 2678 		if (dbc_1st((BYTE)w)) {			/* Check if it is a DBC 1st byte */
// 2679 			b = (BYTE)p[si++];			/* Get 2nd byte */
// 2680 			w = (w << 8) + b;			/* Create a DBC */
// 2681 			if (!dbc_2nd(b)) return FR_INVALID_NAME;	/* Reject invalid sequence */
// 2682 		}
// 2683 		w = ff_oem2uni(w, CODEPAGE);	/* Convert ANSI/OEM to Unicode */
// 2684 		if (!w) return FR_INVALID_NAME;	/* Reject invalid code */
// 2685 #endif
// 2686 		if (w < 0x80 && chk_chr("\"*:<>\?|\x7F", w)) return FR_INVALID_NAME;	/* Reject illegal characters for LFN */
// 2687 		lfn[di++] = w;					/* Store the Unicode character */
// 2688 	}
// 2689 	*path = &p[si];						/* Return pointer to the next segment */
// 2690 	cf = (w < ' ') ? NS_LAST : 0;		/* Set last segment flag if end of the path */
// 2691 #if FF_FS_RPATH != 0
// 2692 	if ((di == 1 && lfn[di - 1] == '.') ||
// 2693 		(di == 2 && lfn[di - 1] == '.' && lfn[di - 2] == '.')) {	/* Is this segment a dot name? */
// 2694 		lfn[di] = 0;
// 2695 		for (i = 0; i < 11; i++)		/* Create dot name for SFN entry */
// 2696 			dp->fn[i] = (i < di) ? '.' : ' ';
// 2697 		dp->fn[i] = cf | NS_DOT;		/* This is a dot entry */
// 2698 		return FR_OK;
// 2699 	}
// 2700 #endif
// 2701 	while (di) {						/* Snip off trailing spaces and dots if exist */
// 2702 		w = lfn[di - 1];
// 2703 		if (w != ' ' && w != '.') break;
// 2704 		di--;
// 2705 	}
// 2706 	lfn[di] = 0;						/* LFN is created */
// 2707 	if (di == 0) return FR_INVALID_NAME;	/* Reject nul name */
// 2708 
// 2709 	/* Create SFN in directory form */
// 2710 	mem_set(dp->fn, ' ', 11);
// 2711 	for (si = 0; lfn[si] == ' ' || lfn[si] == '.'; si++) ;	/* Strip leading spaces and dots */
// 2712 	if (si > 0) cf |= NS_LOSS | NS_LFN;
// 2713 	while (di > 0 && lfn[di - 1] != '.') di--;	/* Find extension (di<=si: no extension) */
// 2714 
// 2715 	i = b = 0; ni = 8;
// 2716 	for (;;) {
// 2717 		w = lfn[si++];					/* Get an LFN character */
// 2718 		if (!w) break;					/* Break on end of the LFN */
// 2719 		if (w == ' ' || (w == '.' && si != di)) {	/* Remove spaces and dots */
// 2720 			cf |= NS_LOSS | NS_LFN;
// 2721 			continue;
// 2722 		}
// 2723 
// 2724 		if (i >= ni || si == di) {		/* Entered extension or end of SFN */
// 2725 			if (ni == 11) {				/* Extension fileld overflow? */
// 2726 				cf |= NS_LOSS | NS_LFN;
// 2727 				break;
// 2728 			}
// 2729 			if (si != di) cf |= NS_LOSS | NS_LFN;	/* Out of 8.3 format */
// 2730 			if (si > di) break;			/* No extension */
// 2731 			si = di; i = 8; ni = 11;	/* Enter extension fileld */
// 2732 			b <<= 2; continue;
// 2733 		}
// 2734 
// 2735 		if (w >= 0x80) {				/* Is this a non-ASCII character? */
// 2736 			cf |= NS_LFN;				/* Force to create LFN entry */
// 2737 #if FF_CODE_PAGE == 0
// 2738 			if (ExCvt) {	/* In SBCS */
// 2739 				w = ff_uni2oem(w, CODEPAGE);	/* Unicode -> OEM code */
// 2740 				if (w & 0x80) w = ExCvt[w & 0x7F];	/* Convert extended character to upper (SBCS) */
// 2741 			} else {		/* In DBCS */
// 2742 				w = ff_uni2oem(ff_wtoupper(w), CODEPAGE);	/* Upper converted Unicode -> OEM code */
// 2743 			}
// 2744 #elif FF_CODE_PAGE < 900	/* SBCS cfg */
// 2745 			w = ff_uni2oem(w, CODEPAGE);	/* Unicode -> OEM code */
// 2746 			if (w & 0x80) w = ExCvt[w & 0x7F];	/* Convert extended character to upper (SBCS) */
// 2747 #else					/* DBCS cfg */
// 2748 			w = ff_uni2oem(ff_wtoupper(w), CODEPAGE);	/* Upper converted Unicode -> OEM code */
// 2749 #endif
// 2750 		}
// 2751 
// 2752 		if (w >= 0x100) {				/* Is this a DBC? */
// 2753 			if (i >= ni - 1) {			/* Field overflow? */
// 2754 				cf |= NS_LOSS | NS_LFN;
// 2755 				i = ni; continue;		/* Next field */
// 2756 			}
// 2757 			dp->fn[i++] = (BYTE)(w >> 8);	/* Put 1st byte */
// 2758 		} else {						/* SBC */
// 2759 			if (!w || chk_chr("+,;=[]", w)) {	/* Replace illegal characters for SFN */
// 2760 				w = '_'; cf |= NS_LOSS | NS_LFN;/* Lossy conversion */
// 2761 			} else {
// 2762 				if (IsUpper(w)) {		/* ASCII large capital */
// 2763 					b |= 2;
// 2764 				} else {
// 2765 					if (IsLower(w)) {	/* ASCII small capital */
// 2766 						b |= 1; w -= 0x20;
// 2767 					}
// 2768 				}
// 2769 			}
// 2770 		}
// 2771 		dp->fn[i++] = (BYTE)w;
// 2772 	}
// 2773 
// 2774 	if (dp->fn[0] == DDEM) dp->fn[0] = RDDEM;	/* If the first character collides with DDEM, replace it with RDDEM */
// 2775 
// 2776 	if (ni == 8) b <<= 2;
// 2777 	if ((b & 0x0C) == 0x0C || (b & 0x03) == 0x03) cf |= NS_LFN;	/* Create LFN entry when there are composite capitals */
// 2778 	if (!(cf & NS_LFN)) {						/* When LFN is in 8.3 format without extended character, NT flags are created */
// 2779 		if ((b & 0x03) == 0x01) cf |= NS_EXT;	/* NT flag (Extension has only small capital) */
// 2780 		if ((b & 0x0C) == 0x04) cf |= NS_BODY;	/* NT flag (Filename has only small capital) */
// 2781 	}
// 2782 
// 2783 	dp->fn[NSFLAG] = cf;	/* SFN is created */
// 2784 
// 2785 	return FR_OK;
// 2786 
// 2787 
// 2788 #else	/* FF_USE_LFN : Non-LFN configuration */
// 2789 	BYTE c, d, *sfn;
// 2790 	UINT ni, si, i;
// 2791 	const char *p;
// 2792 
// 2793 	/* Create file name in directory form */
// 2794 	p = *path; sfn = dp->fn;
        LDR      R9,[R5, #+0]
        ADDS     R4,R0,#+32
// 2795 	mem_set(sfn, ' ', 11);
        MOVS     R2,#+11
        MOVS     R1,#+32
        MOVS     R0,R4
          CFI FunCall mem_set
        BL       mem_set
// 2796 	si = i = 0; ni = 8;
        MOVS     R8,#+0
        MOV      R6,R8
        MOVS     R10,#+8
        B.N      ??create_name_0
// 2797 #if FF_FS_RPATH != 0
// 2798 	if (p[si] == '.') { /* Is this a dot entry? */
// 2799 		for (;;) {
// 2800 			c = (BYTE)p[si++];
// 2801 			if (c != '.' || si >= 3) break;
// 2802 			sfn[i++] = c;
// 2803 		}
// 2804 		if (c != '/' && c != '\\' && c > ' ') return FR_INVALID_NAME;
// 2805 		*path = p + si;								/* Return pointer to the next segment */
// 2806 		sfn[NSFLAG] = (c <= ' ') ? NS_LAST | NS_DOT : NS_DOT;	/* Set last segment flag if end of the path */
// 2807 		return FR_OK;
// 2808 	}
// 2809 #endif
// 2810 	for (;;) {
// 2811 		c = (BYTE)p[si++];
// 2812 		if (c <= ' ') break; 			/* Break if end of the path name */
// 2813 		if (c == '/' || c == '\\') {	/* Break if a separator is found */
// 2814 			while (p[si] == '/' || p[si] == '\\') si++;	/* Skip duplicated separator if exist */
// 2815 			break;
// 2816 		}
// 2817 		if (c == '.' || i >= ni) {		/* End of body or over size? */
// 2818 			if (ni == 11 || c != '.') return FR_INVALID_NAME;	/* Over size or invalid dot */
// 2819 			i = 8; ni = 11;				/* Goto extension */
??create_name_1:
        MOVS     R6,#+8
        MOVS     R10,#+11
// 2820 			continue;
??create_name_0:
        LDRB     R7,[R8, R9]
        ADDS     R8,R8,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+33
        BGE.N    ??create_name_2
// 2821 		}
// 2822 #if FF_CODE_PAGE == 0
// 2823 		if (ExCvt && c >= 0x80) {		/* Is SBC extended character? */
// 2824 			c = ExCvt[c - 0x80];		/* To upper SBC extended character */
// 2825 		}
// 2826 #elif FF_CODE_PAGE < 900
// 2827 		if (c >= 0x80) {				/* Is SBC extended character? */
// 2828 			c = ExCvt[c - 0x80];		/* To upper SBC extended character */
// 2829 		}
// 2830 #endif
// 2831 		if (dbc_1st(c)) {				/* Check if it is a DBC 1st byte */
// 2832 			d = (BYTE)p[si++];			/* Get 2nd byte */
// 2833 			if (!dbc_2nd(d) || i >= ni - 1) return FR_INVALID_NAME;	/* Reject invalid DBC */
// 2834 			sfn[i++] = c;
// 2835 			sfn[i++] = d;
// 2836 		} else {						/* SBC */
// 2837 			if (chk_chr("\"*+,:;<=>\?[]|\x7F", c)) return FR_INVALID_NAME;	/* Reject illegal chrs for SFN */
// 2838 			if (IsLower(c)) c -= 0x20;	/* To upper */
// 2839 			sfn[i++] = c;
// 2840 		}
// 2841 	}
// 2842 	*path = p + si;						/* Return pointer to the next segment */
??create_name_3:
        ADDS     R0,R8,R9
        STR      R0,[R5, #+0]
// 2843 	if (i == 0) return FR_INVALID_NAME;	/* Reject nul string */
        CMP      R6,#+0
        BNE.N    ??create_name_4
        MOVS     R0,#+6
        B.N      ??create_name_5
??create_name_2:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+47
        BEQ.N    ??create_name_6
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+92
        BNE.N    ??create_name_7
??create_name_6:
        LDRB     R0,[R8, R9]
        CMP      R0,#+47
        BEQ.N    ??create_name_8
        LDRB     R0,[R8, R9]
        CMP      R0,#+92
        BNE.N    ??create_name_9
??create_name_8:
        ADDS     R8,R8,#+1
        B.N      ??create_name_6
??create_name_9:
        B.N      ??create_name_3
??create_name_7:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+46
        BEQ.N    ??create_name_10
        CMP      R6,R10
        BCC.N    ??create_name_11
??create_name_10:
        CMP      R10,#+11
        BEQ.N    ??create_name_12
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+46
        BEQ.N    ??create_name_1
??create_name_12:
        MOVS     R0,#+6
        B.N      ??create_name_5
??create_name_11:
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall dbc_1st
        BL       dbc_1st
        CMP      R0,#+0
        BEQ.N    ??create_name_13
        LDRB     R11,[R8, R9]
        ADDS     R8,R8,#+1
        MOV      R0,R11
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall dbc_2nd
        BL       dbc_2nd
        CMP      R0,#+0
        BEQ.N    ??create_name_14
        SUBS     R0,R10,#+1
        CMP      R6,R0
        BCC.N    ??create_name_15
??create_name_14:
        MOVS     R0,#+6
        B.N      ??create_name_5
??create_name_15:
        STRB     R7,[R6, R4]
        ADDS     R6,R6,#+1
        STRB     R11,[R6, R4]
        ADDS     R6,R6,#+1
        B.N      ??create_name_0
??create_name_13:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R1,R7
        LDR.W    R0,??DataTable6
          CFI FunCall chk_chr
        BL       chk_chr
        CMP      R0,#+0
        BEQ.N    ??create_name_16
        MOVS     R0,#+6
        B.N      ??create_name_5
??create_name_16:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        SUBS     R0,R7,#+97
        CMP      R0,#+26
        BCS.N    ??create_name_17
        SUBS     R7,R7,#+32
??create_name_17:
        STRB     R7,[R6, R4]
        ADDS     R6,R6,#+1
        B.N      ??create_name_0
// 2844 
// 2845 	if (sfn[0] == DDEM) sfn[0] = RDDEM;	/* If the first character collides with DDEM, replace it with RDDEM */
??create_name_4:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+229
        BNE.N    ??create_name_18
        MOVS     R0,#+5
        STRB     R0,[R4, #+0]
// 2846 	sfn[NSFLAG] = (c <= ' ') ? NS_LAST : 0;		/* Set last segment flag if end of the path */
??create_name_18:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+33
        BGE.N    ??create_name_19
        MOVS     R0,#+4
        B.N      ??create_name_20
??create_name_19:
        MOVS     R0,#+0
??create_name_20:
        STRB     R0,[R4, #+11]
// 2847 
// 2848 	return FR_OK;
        MOVS     R0,#+0
??create_name_5:
        POP      {R1,R4-R11,PC}   ;; return
          CFI EndBlock cfiBlock29
// 2849 #endif /* FF_USE_LFN */
// 2850 }
// 2851 
// 2852 
// 2853 
// 2854 
// 2855 /*-----------------------------------------------------------------------*/
// 2856 /* Follow a file path                                                    */
// 2857 /*-----------------------------------------------------------------------*/
// 2858 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock30 Using cfiCommon0
          CFI Function follow_path
        THUMB
// 2859 static
// 2860 FRESULT follow_path (	/* FR_OK(0): successful, !=0: error code */
// 2861 	DIR* dp,			/* Directory object to return last directory and found object */
// 2862 	const TCHAR* path	/* Full-path string to find a file or directory */
// 2863 )
// 2864 {
follow_path:
        PUSH     {R1,R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
// 2865 	FRESULT res;
// 2866 	BYTE ns;
// 2867 	FATFS *fs = dp->obj.fs;
        LDR      R5,[R4, #+0]
        B.N      ??follow_path_0
// 2868 
// 2869 
// 2870 #if FF_FS_RPATH != 0
// 2871 	if (*path != '/' && *path != '\\') {	/* Without heading separator */
// 2872 		dp->obj.sclust = fs->cdir;				/* Start from current directory */
// 2873 	} else
// 2874 #endif
// 2875 	{										/* With heading separator */
// 2876 		while (*path == '/' || *path == '\\') path++;	/* Strip heading separator */
??follow_path_1:
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
??follow_path_0:
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+47
        BEQ.N    ??follow_path_1
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+92
        BEQ.N    ??follow_path_1
// 2877 		dp->obj.sclust = 0;					/* Start from root directory */
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
// 2878 	}
// 2879 #if FF_FS_EXFAT
// 2880 	dp->obj.n_frag = 0;	/* Invalidate last fragment counter of the object */
// 2881 #if FF_FS_RPATH != 0
// 2882 	if (fs->fs_type == FS_EXFAT && dp->obj.sclust) {	/* exFAT: Retrieve the sub-directory's status */
// 2883 		DIR dj;
// 2884 
// 2885 		dp->obj.c_scl = fs->cdc_scl;
// 2886 		dp->obj.c_size = fs->cdc_size;
// 2887 		dp->obj.c_ofs = fs->cdc_ofs;
// 2888 		res = load_obj_xdir(&dj, &dp->obj);
// 2889 		if (res != FR_OK) return res;
// 2890 		dp->obj.objsize = ld_dword(fs->dirbuf + XDIR_FileSize);
// 2891 		dp->obj.stat = fs->dirbuf[XDIR_GenFlags] & 2;
// 2892 	}
// 2893 #endif
// 2894 #endif
// 2895 
// 2896 	if ((UINT)*path < ' ') {				/* Null path name is the origin directory itself */
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+32
        BCS.N    ??follow_path_2
// 2897 		dp->fn[NSFLAG] = NS_NONAME;
        MOVS     R0,#+128
        STRB     R0,[R4, #+43]
// 2898 		res = dir_sdi(dp, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
        B.N      ??follow_path_3
// 2899 
// 2900 	} else {								/* Follow path */
// 2901 		for (;;) {
// 2902 			res = create_name(dp, &path);	/* Get a segment name of the path */
// 2903 			if (res != FR_OK) break;
// 2904 			res = dir_find(dp);				/* Find an object with the segment name */
// 2905 			ns = dp->fn[NSFLAG];
// 2906 			if (res != FR_OK) {				/* Failed to find the object */
// 2907 				if (res == FR_NO_FILE) {	/* Object is not found */
// 2908 					if (FF_FS_RPATH && (ns & NS_DOT)) {	/* If dot entry is not exist, stay there */
// 2909 						if (!(ns & NS_LAST)) continue;	/* Continue to follow if not last segment */
// 2910 						dp->fn[NSFLAG] = NS_NONAME;
// 2911 						res = FR_OK;
// 2912 					} else {							/* Could not find the object */
// 2913 						if (!(ns & NS_LAST)) res = FR_NO_PATH;	/* Adjust error code if not last segment */
// 2914 					}
// 2915 				}
// 2916 				break;
// 2917 			}
// 2918 			if (ns & NS_LAST) break;			/* Last segment matched. Function completed. */
// 2919 			/* Get into the sub-directory */
// 2920 			if (!(dp->obj.attr & AM_DIR)) {		/* It is not a sub-directory and cannot follow */
// 2921 				res = FR_NO_PATH; break;
// 2922 			}
// 2923 #if FF_FS_EXFAT
// 2924 			if (fs->fs_type == FS_EXFAT) {		/* Save containing directory information for next dir */
// 2925 				dp->obj.c_scl = dp->obj.sclust;
// 2926 				dp->obj.c_size = ((DWORD)dp->obj.objsize & 0xFFFFFF00) | dp->obj.stat;
// 2927 				dp->obj.c_ofs = dp->blk_ofs;
// 2928 				dp->obj.sclust = ld_dword(fs->dirbuf + XDIR_FstClus);	/* Open next directory */
// 2929 				dp->obj.stat = fs->dirbuf[XDIR_GenFlags] & 2;
// 2930 				dp->obj.objsize = ld_qword(fs->dirbuf + XDIR_FileSize);
// 2931 			} else
// 2932 #endif
// 2933 			{
// 2934 				dp->obj.sclust = ld_clust(fs, fs->win + dp->dptr % SS(fs));	/* Open next directory */
??follow_path_4:
        LDR      R0,[R4, #+16]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADDS     R0,R2,R5
        ADDS     R1,R0,#+48
        MOVS     R0,R5
          CFI FunCall ld_clust
        BL       ld_clust
        STR      R0,[R4, #+8]
// 2935 			}
??follow_path_2:
        ADD      R1,SP,#+0
        MOVS     R0,R4
          CFI FunCall create_name
        BL       create_name
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??follow_path_3
??follow_path_5:
        MOVS     R0,R4
          CFI FunCall dir_find
        BL       dir_find
        LDRB     R1,[R4, #+43]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??follow_path_6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??follow_path_7
        LSLS     R1,R1,#+29
        BMI.N    ??follow_path_7
        MOVS     R0,#+5
??follow_path_7:
        B.N      ??follow_path_3
??follow_path_6:
        LSLS     R1,R1,#+29
        BMI.N    ??follow_path_3
??follow_path_8:
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+27
        BMI.N    ??follow_path_4
        MOVS     R0,#+5
// 2936 		}
// 2937 	}
// 2938 
// 2939 	return res;
??follow_path_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock30
// 2940 }
// 2941 
// 2942 
// 2943 
// 2944 
// 2945 /*-----------------------------------------------------------------------*/
// 2946 /* Get logical drive number from path name                               */
// 2947 /*-----------------------------------------------------------------------*/
// 2948 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock31 Using cfiCommon0
          CFI Function get_ldnumber
          CFI NoCalls
        THUMB
// 2949 static
// 2950 int get_ldnumber (		/* Returns logical drive number (-1:invalid drive) */
// 2951 	const TCHAR** path	/* Pointer to pointer to the path name */
// 2952 )
// 2953 {
get_ldnumber:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
// 2954 	const TCHAR *tp, *tt;
// 2955 	UINT i;
// 2956 	int vol = -1;
        MOVS     R1,#-1
// 2957 #if FF_STR_VOLUME_ID		/* Find string drive id */
// 2958 	static const char* const volid[] = {FF_VOLUME_STRS};
// 2959 	const char *sp;
// 2960 	char c;
// 2961 	TCHAR tc;
// 2962 #endif
// 2963 
// 2964 
// 2965 	if (*path) {	/* If the pointer is not a null */
        LDR      R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??get_ldnumber_0
// 2966 		for (tt = *path; (UINT)*tt >= (FF_USE_LFN ? ' ' : '!') && *tt != ':'; tt++) ;	/* Find a colon in the path */
        LDR      R3,[R0, #+0]
        B.N      ??get_ldnumber_1
??get_ldnumber_2:
        ADDS     R3,R3,#+1
??get_ldnumber_1:
        LDRB     R2,[R3, #+0]
        CMP      R2,#+33
        BCC.N    ??get_ldnumber_3
        LDRB     R2,[R3, #+0]
        CMP      R2,#+58
        BNE.N    ??get_ldnumber_2
// 2967 		if (*tt == ':') {	/* If a colon is exist in the path name */
??get_ldnumber_3:
        LDRB     R2,[R3, #+0]
        CMP      R2,#+58
        BNE.N    ??get_ldnumber_4
// 2968 			tp = *path;
        LDR      R2,[R0, #+0]
// 2969 			i = *tp++;
        LDRB     R4,[R2, #+0]
        ADDS     R2,R2,#+1
// 2970 			if (IsDigit(i) && tp == tt) {	/* Is there a numeric drive id + colon? */
        SUBS     R5,R4,#+48
        CMP      R5,#+10
        BCS.N    ??get_ldnumber_0
        CMP      R2,R3
        BNE.N    ??get_ldnumber_0
// 2971 				if ((i -= '0') < FF_VOLUMES) {	/* If drive id is found, get the value and strip it */
        SUBS     R4,R4,#+48
        CMP      R4,#+0
        BNE.N    ??get_ldnumber_0
// 2972 					vol = (int)i;
        MOVS     R1,R4
// 2973 					*path = ++tt;
        ADDS     R3,R3,#+1
        STR      R3,[R0, #+0]
        B.N      ??get_ldnumber_0
// 2974 				}
// 2975 			}
// 2976 #if FF_STR_VOLUME_ID
// 2977 			 else {	/* No numeric drive number, find string drive id */
// 2978 				i = 0; tt++;
// 2979 				do {
// 2980 					sp = volid[i]; tp = *path;
// 2981 					do {	/* Compare a string drive id with path name */
// 2982 						c = *sp++; tc = *tp++;
// 2983 						if (IsLower(tc)) tc -= 0x20;
// 2984 					} while (c && (TCHAR)c == tc);
// 2985 				} while ((c || tp != tt) && ++i < FF_VOLUMES);	/* Repeat for each id until pattern match */
// 2986 				if (i < FF_VOLUMES) {	/* If a drive id is found, get the value and strip it */
// 2987 					vol = (int)i;
// 2988 					*path = tt;
// 2989 				}
// 2990 			}
// 2991 #endif
// 2992 		} else {	/* No volume id and use default drive */
// 2993 #if FF_FS_RPATH != 0 && FF_VOLUMES >= 2
// 2994 			vol = CurrVol;	/* Current drive */
// 2995 #else
// 2996 			vol = 0;		/* Drive 0 */
??get_ldnumber_4:
        MOVS     R1,#+0
// 2997 #endif
// 2998 		}
// 2999 	}
// 3000 	return vol;
??get_ldnumber_0:
        MOVS     R0,R1
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock31
// 3001 }
// 3002 
// 3003 
// 3004 
// 3005 
// 3006 /*-----------------------------------------------------------------------*/
// 3007 /* Load a sector and check if it is an FAT VBR                           */
// 3008 /*-----------------------------------------------------------------------*/
// 3009 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock32 Using cfiCommon0
          CFI Function check_fs
        THUMB
// 3010 static
// 3011 BYTE check_fs (	/* 0:FAT, 1:exFAT, 2:Valid BS but not FAT, 3:Not a BS, 4:Disk error */
// 3012 	FATFS* fs,	/* Filesystem object */
// 3013 	DWORD sect	/* Sector# (lba) to load and check if it is an FAT-VBR or not */
// 3014 )
// 3015 {
check_fs:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
// 3016 	fs->wflag = 0; fs->winsect = 0xFFFFFFFF;		/* Invaidate window */
        MOVS     R0,#+0
        STRB     R0,[R4, #+3]
        MOVS     R0,#-1
        STR      R0,[R4, #+44]
// 3017 	if (move_window(fs, sect) != FR_OK) return 4;	/* Load boot record */
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BEQ.N    ??check_fs_0
        MOVS     R0,#+4
        B.N      ??check_fs_1
// 3018 
// 3019 	if (ld_word(fs->win + BS_55AA) != 0xAA55) return 3;	/* Check boot record signature (always placed here even if the sector size is >512) */
??check_fs_0:
        ADDW     R0,R4,#+558
          CFI FunCall ld_word
        BL       ld_word
        MOVW     R1,#+43605
        CMP      R0,R1
        BEQ.N    ??check_fs_2
        MOVS     R0,#+3
        B.N      ??check_fs_1
// 3020 
// 3021 #if FF_FS_EXFAT
// 3022 	if (!mem_cmp(fs->win + BS_JmpBoot, "\xEB\x76\x90" "EXFAT   ", 11)) return 1;	/* Check if exFAT VBR */
// 3023 #endif
// 3024 	if (fs->win[BS_JmpBoot] == 0xE9 || (fs->win[BS_JmpBoot] == 0xEB && fs->win[BS_JmpBoot + 2] == 0x90)) {	/* Valid JumpBoot code? */
??check_fs_2:
        LDRB     R0,[R4, #+48]
        CMP      R0,#+233
        BEQ.N    ??check_fs_3
        LDRB     R0,[R4, #+48]
        CMP      R0,#+235
        BNE.N    ??check_fs_4
        LDRB     R0,[R4, #+50]
        CMP      R0,#+144
        BNE.N    ??check_fs_4
// 3025 		if (!mem_cmp(fs->win + BS_FilSysType, "FAT", 3)) return 0;		/* Is it an FAT VBR? */
??check_fs_3:
        MOVS     R2,#+3
        ADR.N    R1,??DataTable5  ;; "FAT"
        ADDS     R0,R4,#+102
          CFI FunCall mem_cmp
        BL       mem_cmp
        CMP      R0,#+0
        BNE.N    ??check_fs_5
        MOVS     R0,#+0
        B.N      ??check_fs_1
// 3026 		if (!mem_cmp(fs->win + BS_FilSysType32, "FAT32", 5)) return 0;	/* Is it an FAT32 VBR? */
??check_fs_5:
        MOVS     R2,#+5
        LDR.W    R1,??DataTable6_1
        ADDS     R0,R4,#+130
          CFI FunCall mem_cmp
        BL       mem_cmp
        CMP      R0,#+0
        BNE.N    ??check_fs_4
        MOVS     R0,#+0
        B.N      ??check_fs_1
// 3027 	}
// 3028 	return 2;	/* Valid BS but not FAT */
??check_fs_4:
        MOVS     R0,#+2
??check_fs_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock32
// 3029 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     DbcTbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x41615252

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x61417272
// 3030 
// 3031 
// 3032 
// 3033 
// 3034 /*-----------------------------------------------------------------------*/
// 3035 /* Find logical drive and check if the volume is mounted                 */
// 3036 /*-----------------------------------------------------------------------*/
// 3037 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock33 Using cfiCommon0
          CFI Function find_volume
        THUMB
// 3038 static
// 3039 FRESULT find_volume (	/* FR_OK(0): successful, !=0: any error occurred */
// 3040 	const TCHAR** path,	/* Pointer to pointer to the path name (drive number) */
// 3041 	FATFS** rfs,		/* Pointer to pointer to the found filesystem object */
// 3042 	BYTE mode			/* !=0: Check write protection for write access */
// 3043 )
// 3044 {
find_volume:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+20
          CFI CFA R13+40
        MOVS     R7,R1
        MOVS     R5,R2
// 3045 	BYTE fmt, *pt;
// 3046 	int vol;
// 3047 	DSTATUS stat;
// 3048 	DWORD bsect, fasize, tsect, sysect, nclst, szbfat, br[4];
// 3049 	WORD nrsv;
// 3050 	FATFS *fs;
// 3051 	UINT i;
// 3052 
// 3053 
// 3054 	/* Get logical drive number */
// 3055 	*rfs = 0;
        MOVS     R1,#+0
        STR      R1,[R7, #+0]
// 3056 	vol = get_ldnumber(path);
          CFI FunCall get_ldnumber
        BL       get_ldnumber
        MOVS     R6,R0
// 3057 	if (vol < 0) return FR_INVALID_DRIVE;
        CMP      R6,#+0
        BPL.N    ??find_volume_0
        MOVS     R0,#+11
        B.N      ??find_volume_1
// 3058 
// 3059 	/* Check if the filesystem object is valid or not */
// 3060 	fs = FatFs[vol];					/* Get pointer to the filesystem object */
??find_volume_0:
        LDR.W    R0,??DataTable6_2
        LDR      R4,[R0, R6, LSL #+2]
// 3061 	if (!fs) return FR_NOT_ENABLED;		/* Is the filesystem object available? */
        CMP      R4,#+0
        BNE.N    ??find_volume_2
        MOVS     R0,#+12
        B.N      ??find_volume_1
// 3062 #if FF_FS_REENTRANT
// 3063 	if (!lock_fs(fs)) return FR_TIMEOUT;	/* Lock the volume */
// 3064 #endif
// 3065 	*rfs = fs;							/* Return pointer to the filesystem object */
??find_volume_2:
        STR      R4,[R7, #+0]
// 3066 
// 3067 	mode &= (BYTE)~FA_READ;				/* Desired access mode, write access or not */
        ANDS     R5,R5,#0xFE
// 3068 	if (fs->fs_type != 0) {				/* If the volume has been mounted */
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??find_volume_3
// 3069 		stat = disk_status(fs->pdrv);
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_status
        BL       disk_status
// 3070 		if (!(stat & STA_NOINIT)) {		/* and the physical drive is kept initialized */
        LSLS     R1,R0,#+31
        BMI.N    ??find_volume_3
// 3071 			if (!FF_FS_READONLY && mode && (stat & STA_PROTECT)) {	/* Check write protection if needed */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??find_volume_4
        LSLS     R0,R0,#+29
        BPL.N    ??find_volume_4
// 3072 				return FR_WRITE_PROTECTED;
        MOVS     R0,#+10
        B.N      ??find_volume_1
// 3073 			}
// 3074 			return FR_OK;				/* The filesystem object is valid */
??find_volume_4:
        MOVS     R0,#+0
        B.N      ??find_volume_1
// 3075 		}
// 3076 	}
// 3077 
// 3078 	/* The filesystem object is not valid. */
// 3079 	/* Following code attempts to mount the volume. (analyze BPB and initialize the filesystem object) */
// 3080 
// 3081 	fs->fs_type = 0;					/* Clear the filesystem object */
??find_volume_3:
        MOVS     R0,#+0
        STRB     R0,[R4, #+0]
// 3082 	fs->pdrv = LD2PD(vol);				/* Bind the logical drive and a physical drive */
        STRB     R6,[R4, #+1]
// 3083 	stat = disk_initialize(fs->pdrv);	/* Initialize the physical drive */
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_initialize
        BL       disk_initialize
// 3084 	if (stat & STA_NOINIT) { 			/* Check if the initialization succeeded */
        LSLS     R1,R0,#+31
        BPL.N    ??find_volume_5
// 3085 		return FR_NOT_READY;			/* Failed to initialize due to no medium or hard error */
        MOVS     R0,#+3
        B.N      ??find_volume_1
// 3086 	}
// 3087 	if (!FF_FS_READONLY && mode && (stat & STA_PROTECT)) { /* Check disk write protection if needed */
??find_volume_5:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??find_volume_6
        LSLS     R0,R0,#+29
        BPL.N    ??find_volume_6
// 3088 		return FR_WRITE_PROTECTED;
        MOVS     R0,#+10
        B.N      ??find_volume_1
// 3089 	}
// 3090 #if FF_MAX_SS != FF_MIN_SS				/* Get sector size (multiple sector size cfg only) */
// 3091 	if (disk_ioctl(fs->pdrv, GET_SECTOR_SIZE, &SS(fs)) != RES_OK) return FR_DISK_ERR;
// 3092 	if (SS(fs) > FF_MAX_SS || SS(fs) < FF_MIN_SS || (SS(fs) & (SS(fs) - 1))) return FR_DISK_ERR;
// 3093 #endif
// 3094 
// 3095 	/* Find an FAT partition on the drive. Supports only generic partitioning rules, FDISK and SFD. */
// 3096 	bsect = 0;
??find_volume_6:
        MOVS     R5,#+0
// 3097 	fmt = check_fs(fs, bsect);			/* Load sector 0 and check if it is an FAT-VBR as SFD */
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall check_fs
        BL       check_fs
        MOVS     R6,R0
// 3098 	if (fmt == 2 || (fmt < 2 && LD2PT(vol) != 0)) {	/* Not an FAT-VBR or forced partition number */
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+2
        BNE.N    ??find_volume_7
// 3099 		for (i = 0; i < 4; i++) {		/* Get partition offset */
        MOVS     R7,#+0
        B.N      ??find_volume_8
// 3100 			pt = fs->win + (MBR_Table + i * SZ_PTE);
// 3101 			br[i] = pt[PTE_System] ? ld_dword(pt + PTE_StLba) : 0;
??find_volume_9:
        MOVS     R0,#+0
??find_volume_10:
        ADD      R1,SP,#+0
        STR      R0,[R1, R7, LSL #+2]
        ADDS     R7,R7,#+1
??find_volume_8:
        CMP      R7,#+4
        BCS.N    ??find_volume_11
        ADDS     R0,R4,R7, LSL #+4
        ADDW     R0,R0,#+494
        LDRB     R1,[R0, #+4]
        CMP      R1,#+0
        BEQ.N    ??find_volume_9
        ADDS     R0,R0,#+8
          CFI FunCall ld_dword
        BL       ld_dword
        B.N      ??find_volume_10
// 3102 		}
// 3103 		i = LD2PT(vol);					/* Partition number: 0:auto, 1-4:forced */
??find_volume_11:
        MOVS     R7,#+0
// 3104 		if (i != 0) i--;
        CMP      R7,#+0
        BEQ.N    ??find_volume_12
        SUBS     R7,R7,#+1
// 3105 		do {							/* Find an FAT volume */
// 3106 			bsect = br[i];
??find_volume_12:
        ADD      R0,SP,#+0
        LDR      R5,[R0, R7, LSL #+2]
// 3107 			fmt = bsect ? check_fs(fs, bsect) : 3;	/* Check the partition */
        CMP      R5,#+0
        BEQ.N    ??find_volume_13
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall check_fs
        BL       check_fs
        MOVS     R6,R0
        B.N      ??find_volume_14
??find_volume_13:
        MOVS     R6,#+3
// 3108 		} while (LD2PT(vol) == 0 && fmt >= 2 && ++i < 4);
??find_volume_14:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+2
        BLT.N    ??find_volume_7
        ADDS     R7,R7,#+1
        CMP      R7,#+4
        BCC.N    ??find_volume_12
// 3109 	}
// 3110 	if (fmt == 4) return FR_DISK_ERR;		/* An error occured in the disk I/O layer */
??find_volume_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BNE.N    ??find_volume_15
        MOVS     R0,#+1
        B.N      ??find_volume_1
// 3111 	if (fmt >= 2) return FR_NO_FILESYSTEM;	/* No FAT volume is found */
??find_volume_15:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+2
        BLT.N    ??find_volume_16
        MOVS     R0,#+13
        B.N      ??find_volume_1
// 3112 
// 3113 	/* An FAT volume is found (bsect). Following code initializes the filesystem object */
// 3114 
// 3115 #if FF_FS_EXFAT
// 3116 	if (fmt == 1) {
// 3117 		QWORD maxlba;
// 3118 
// 3119 		for (i = BPB_ZeroedEx; i < BPB_ZeroedEx + 53 && fs->win[i] == 0; i++) ;	/* Check zero filler */
// 3120 		if (i < BPB_ZeroedEx + 53) return FR_NO_FILESYSTEM;
// 3121 
// 3122 		if (ld_word(fs->win + BPB_FSVerEx) != 0x100) return FR_NO_FILESYSTEM;	/* Check exFAT version (must be version 1.0) */
// 3123 
// 3124 		if (1 << fs->win[BPB_BytsPerSecEx] != SS(fs)) {	/* (BPB_BytsPerSecEx must be equal to the physical sector size) */
// 3125 			return FR_NO_FILESYSTEM;
// 3126 		}
// 3127 
// 3128 		maxlba = ld_qword(fs->win + BPB_TotSecEx) + bsect;	/* Last LBA + 1 of the volume */
// 3129 		if (maxlba >= 0x100000000) return FR_NO_FILESYSTEM;	/* (It cannot be handled in 32-bit LBA) */
// 3130 
// 3131 		fs->fsize = ld_dword(fs->win + BPB_FatSzEx);	/* Number of sectors per FAT */
// 3132 
// 3133 		fs->n_fats = fs->win[BPB_NumFATsEx];			/* Number of FATs */
// 3134 		if (fs->n_fats != 1) return FR_NO_FILESYSTEM;	/* (Supports only 1 FAT) */
// 3135 
// 3136 		fs->csize = 1 << fs->win[BPB_SecPerClusEx];		/* Cluster size */
// 3137 		if (fs->csize == 0)	return FR_NO_FILESYSTEM;	/* (Must be 1..32768) */
// 3138 
// 3139 		nclst = ld_dword(fs->win + BPB_NumClusEx);		/* Number of clusters */
// 3140 		if (nclst > MAX_EXFAT) return FR_NO_FILESYSTEM;	/* (Too many clusters) */
// 3141 		fs->n_fatent = nclst + 2;
// 3142 
// 3143 		/* Boundaries and Limits */
// 3144 		fs->volbase = bsect;
// 3145 		fs->database = bsect + ld_dword(fs->win + BPB_DataOfsEx);
// 3146 		fs->fatbase = bsect + ld_dword(fs->win + BPB_FatOfsEx);
// 3147 		if (maxlba < (QWORD)fs->database + nclst * fs->csize) return FR_NO_FILESYSTEM;	/* (Volume size must not be smaller than the size requiered) */
// 3148 		fs->dirbase = ld_dword(fs->win + BPB_RootClusEx);
// 3149 
// 3150 		/* Check if bitmap location is in assumption (at the first cluster) */
// 3151 		if (move_window(fs, clst2sect(fs, fs->dirbase)) != FR_OK) return FR_DISK_ERR;
// 3152 		for (i = 0; i < SS(fs); i += SZDIRE) {
// 3153 			if (fs->win[i] == 0x81 && ld_dword(fs->win + i + 20) == 2) break;	/* 81 entry with cluster #2? */
// 3154 		}
// 3155 		if (i == SS(fs)) return FR_NO_FILESYSTEM;
// 3156 #if !FF_FS_READONLY
// 3157 		fs->last_clst = fs->free_clst = 0xFFFFFFFF;		/* Initialize cluster allocation information */
// 3158 #endif
// 3159 		fmt = FS_EXFAT;			/* FAT sub-type */
// 3160 	} else
// 3161 #endif	/* FF_FS_EXFAT */
// 3162 	{
// 3163 		if (ld_word(fs->win + BPB_BytsPerSec) != SS(fs)) return FR_NO_FILESYSTEM;	/* (BPB_BytsPerSec must be equal to the physical sector size) */
??find_volume_16:
        ADDS     R0,R4,#+59
          CFI FunCall ld_word
        BL       ld_word
        CMP      R0,#+512
        BEQ.N    ??find_volume_17
        MOVS     R0,#+13
        B.N      ??find_volume_1
// 3164 
// 3165 		fasize = ld_word(fs->win + BPB_FATSz16);		/* Number of sectors per FAT */
??find_volume_17:
        ADDS     R0,R4,#+70
          CFI FunCall ld_word
        BL       ld_word
        MOVS     R7,R0
// 3166 		if (fasize == 0) fasize = ld_dword(fs->win + BPB_FATSz32);
        CMP      R7,#+0
        BNE.N    ??find_volume_18
        ADDS     R0,R4,#+84
          CFI FunCall ld_dword
        BL       ld_dword
        MOVS     R7,R0
// 3167 		fs->fsize = fasize;
??find_volume_18:
        STR      R7,[R4, #+24]
// 3168 
// 3169 		fs->n_fats = fs->win[BPB_NumFATs];				/* Number of FATs */
        LDRB     R0,[R4, #+64]
        STRB     R0,[R4, #+2]
// 3170 		if (fs->n_fats != 1 && fs->n_fats != 2) return FR_NO_FILESYSTEM;	/* (Must be 1 or 2) */
        LDRB     R0,[R4, #+2]
        CMP      R0,#+1
        BEQ.N    ??find_volume_19
        LDRB     R0,[R4, #+2]
        CMP      R0,#+2
        BEQ.N    ??find_volume_19
        MOVS     R0,#+13
        B.N      ??find_volume_1
// 3171 		fasize *= fs->n_fats;							/* Number of sectors for FAT area */
??find_volume_19:
        LDRB     R0,[R4, #+2]
        MULS     R7,R0,R7
// 3172 
// 3173 		fs->csize = fs->win[BPB_SecPerClus];			/* Cluster size */
        LDRB     R0,[R4, #+61]
        STRH     R0,[R4, #+10]
// 3174 		if (fs->csize == 0 || (fs->csize & (fs->csize - 1))) return FR_NO_FILESYSTEM;	/* (Must be power of 2) */
        LDRH     R0,[R4, #+10]
        CMP      R0,#+0
        BEQ.N    ??find_volume_20
        LDRH     R0,[R4, #+10]
        LDRH     R1,[R4, #+10]
        SUBS     R1,R1,#+1
        TST      R0,R1
        BEQ.N    ??find_volume_21
??find_volume_20:
        MOVS     R0,#+13
        B.N      ??find_volume_1
// 3175 
// 3176 		fs->n_rootdir = ld_word(fs->win + BPB_RootEntCnt);	/* Number of root directory entries */
??find_volume_21:
        ADDS     R0,R4,#+65
          CFI FunCall ld_word
        BL       ld_word
        STRH     R0,[R4, #+8]
// 3177 		if (fs->n_rootdir % (SS(fs) / SZDIRE)) return FR_NO_FILESYSTEM;	/* (Must be sector aligned) */
        LDRH     R0,[R4, #+8]
        MOVS     R1,#+16
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BEQ.N    ??find_volume_22
        MOVS     R0,#+13
        B.N      ??find_volume_1
// 3178 
// 3179 		tsect = ld_word(fs->win + BPB_TotSec16);		/* Number of sectors on the volume */
??find_volume_22:
        ADDS     R0,R4,#+67
          CFI FunCall ld_word
        BL       ld_word
        MOVS     R6,R0
// 3180 		if (tsect == 0) tsect = ld_dword(fs->win + BPB_TotSec32);
        CMP      R6,#+0
        BNE.N    ??find_volume_23
        ADDS     R0,R4,#+80
          CFI FunCall ld_dword
        BL       ld_dword
        MOVS     R6,R0
// 3181 
// 3182 		nrsv = ld_word(fs->win + BPB_RsvdSecCnt);		/* Number of reserved sectors */
??find_volume_23:
        ADDS     R0,R4,#+62
          CFI FunCall ld_word
        BL       ld_word
// 3183 		if (nrsv == 0) return FR_NO_FILESYSTEM;			/* (Must not be 0) */
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??find_volume_24
        MOVS     R0,#+13
        B.N      ??find_volume_1
// 3184 
// 3185 		/* Determine the FAT sub type */
// 3186 		sysect = nrsv + fasize + fs->n_rootdir / (SS(fs) / SZDIRE);	/* RSV + FAT + DIR */
??find_volume_24:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADDS     R1,R7,R0
        LDRH     R2,[R4, #+8]
        ADDS     R1,R1,R2, LSR #+4
// 3187 		if (tsect < sysect) return FR_NO_FILESYSTEM;	/* (Invalid volume size) */
        CMP      R6,R1
        BCS.N    ??find_volume_25
        MOVS     R0,#+13
        B.N      ??find_volume_1
// 3188 		nclst = (tsect - sysect) / fs->csize;			/* Number of clusters */
??find_volume_25:
        SUBS     R2,R6,R1
        LDRH     R3,[R4, #+10]
        UDIV     R2,R2,R3
// 3189 		if (nclst == 0) return FR_NO_FILESYSTEM;		/* (Invalid volume size) */
        CMP      R2,#+0
        BNE.N    ??find_volume_26
        MOVS     R0,#+13
        B.N      ??find_volume_1
// 3190 		fmt = 0;
??find_volume_26:
        MOVS     R6,#+0
// 3191 		if (nclst <= MAX_FAT32) fmt = FS_FAT32;
        LDR.N    R3,??DataTable6_3  ;; 0xffffff6
        CMP      R2,R3
        BCS.N    ??find_volume_27
        MOVS     R6,#+3
// 3192 		if (nclst <= MAX_FAT16) fmt = FS_FAT16;
??find_volume_27:
        MOVW     R3,#+65526
        CMP      R2,R3
        BCS.N    ??find_volume_28
        MOVS     R6,#+2
// 3193 		if (nclst <= MAX_FAT12) fmt = FS_FAT12;
??find_volume_28:
        MOVW     R3,#+4086
        CMP      R2,R3
        BCS.N    ??find_volume_29
        MOVS     R6,#+1
// 3194 		if (fmt == 0) return FR_NO_FILESYSTEM;
??find_volume_29:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??find_volume_30
        MOVS     R0,#+13
        B.N      ??find_volume_1
// 3195 
// 3196 		/* Boundaries and Limits */
// 3197 		fs->n_fatent = nclst + 2;						/* Number of FAT entries */
??find_volume_30:
        ADDS     R2,R2,#+2
        STR      R2,[R4, #+20]
// 3198 		fs->volbase = bsect;							/* Volume start sector */
        STR      R5,[R4, #+28]
// 3199 		fs->fatbase = bsect + nrsv; 					/* FAT start sector */
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADDS     R0,R0,R5
        STR      R0,[R4, #+32]
// 3200 		fs->database = bsect + sysect;					/* Data start sector */
        ADDS     R0,R1,R5
        STR      R0,[R4, #+40]
// 3201 		if (fmt == FS_FAT32) {
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+3
        BNE.N    ??find_volume_31
// 3202 			if (ld_word(fs->win + BPB_FSVer32) != 0) return FR_NO_FILESYSTEM;	/* (Must be FAT32 revision 0.0) */
        ADDS     R0,R4,#+90
          CFI FunCall ld_word
        BL       ld_word
        CMP      R0,#+0
        BEQ.N    ??find_volume_32
        MOVS     R0,#+13
        B.N      ??find_volume_1
// 3203 			if (fs->n_rootdir != 0) return FR_NO_FILESYSTEM;	/* (BPB_RootEntCnt must be 0) */
??find_volume_32:
        LDRH     R0,[R4, #+8]
        CMP      R0,#+0
        BEQ.N    ??find_volume_33
        MOVS     R0,#+13
        B.N      ??find_volume_1
// 3204 			fs->dirbase = ld_dword(fs->win + BPB_RootClus32);	/* Root directory start cluster */
??find_volume_33:
        ADDS     R0,R4,#+92
          CFI FunCall ld_dword
        BL       ld_dword
        STR      R0,[R4, #+36]
// 3205 			szbfat = fs->n_fatent * 4;					/* (Needed FAT size) */
        LDR      R0,[R4, #+20]
        LSLS     R0,R0,#+2
        B.N      ??find_volume_34
// 3206 		} else {
// 3207 			if (fs->n_rootdir == 0)	return FR_NO_FILESYSTEM;	/* (BPB_RootEntCnt must not be 0) */
??find_volume_31:
        LDRH     R0,[R4, #+8]
        CMP      R0,#+0
        BNE.N    ??find_volume_35
        MOVS     R0,#+13
        B.N      ??find_volume_1
// 3208 			fs->dirbase = fs->fatbase + fasize;			/* Root directory start sector */
??find_volume_35:
        LDR      R0,[R4, #+32]
        ADDS     R0,R7,R0
        STR      R0,[R4, #+36]
// 3209 			szbfat = (fmt == FS_FAT16) ?				/* (Needed FAT size) */
// 3210 				fs->n_fatent * 2 : fs->n_fatent * 3 / 2 + (fs->n_fatent & 1);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+2
        BNE.N    ??find_volume_36
        LDR      R0,[R4, #+20]
        LSLS     R0,R0,#+1
        B.N      ??find_volume_34
??find_volume_36:
        LDR      R0,[R4, #+20]
        MOVS     R1,#+3
        MULS     R0,R1,R0
        LDRB     R1,[R4, #+20]
        ANDS     R1,R1,#0x1
        ADDS     R0,R1,R0, LSR #+1
// 3211 		}
// 3212 		if (fs->fsize < (szbfat + (SS(fs) - 1)) / SS(fs)) return FR_NO_FILESYSTEM;	/* (BPB_FATSz must not be less than the size needed) */
??find_volume_34:
        LDR      R1,[R4, #+24]
        ADDW     R0,R0,#+511
        CMP      R1,R0, LSR #+9
        BCS.N    ??find_volume_37
        MOVS     R0,#+13
        B.N      ??find_volume_1
// 3213 
// 3214 #if !FF_FS_READONLY
// 3215 		/* Get FSInfo if available */
// 3216 		fs->last_clst = fs->free_clst = 0xFFFFFFFF;		/* Initialize cluster allocation information */
??find_volume_37:
        MOVS     R0,#-1
        STR      R0,[R4, #+16]
        STR      R0,[R4, #+12]
// 3217 		fs->fsi_flag = 0x80;
        MOVS     R0,#+128
        STRB     R0,[R4, #+4]
// 3218 #if (FF_FS_NOFSINFO & 3) != 3
// 3219 		if (fmt == FS_FAT32				/* Allow to update FSInfo only if BPB_FSInfo32 == 1 */
// 3220 			&& ld_word(fs->win + BPB_FSInfo32) == 1
// 3221 			&& move_window(fs, bsect + 1) == FR_OK)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+3
        BNE.N    ??find_volume_38
        ADDS     R0,R4,#+96
          CFI FunCall ld_word
        BL       ld_word
        CMP      R0,#+1
        BNE.N    ??find_volume_38
        ADDS     R1,R5,#+1
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??find_volume_38
// 3222 		{
// 3223 			fs->fsi_flag = 0;
        MOVS     R0,#+0
        STRB     R0,[R4, #+4]
// 3224 			if (ld_word(fs->win + BS_55AA) == 0xAA55	/* Load FSInfo data if available */
// 3225 				&& ld_dword(fs->win + FSI_LeadSig) == 0x41615252
// 3226 				&& ld_dword(fs->win + FSI_StrucSig) == 0x61417272)
        ADDW     R0,R4,#+558
          CFI FunCall ld_word
        BL       ld_word
        MOVW     R1,#+43605
        CMP      R0,R1
        BNE.N    ??find_volume_38
        ADDS     R0,R4,#+48
          CFI FunCall ld_dword
        BL       ld_dword
        LDR.N    R1,??DataTable6_4  ;; 0x41615252
        CMP      R0,R1
        BNE.N    ??find_volume_38
        ADDS     R0,R4,#+532
          CFI FunCall ld_dword
        BL       ld_dword
        LDR.N    R1,??DataTable6_5  ;; 0x61417272
        CMP      R0,R1
        BNE.N    ??find_volume_38
// 3227 			{
// 3228 #if (FF_FS_NOFSINFO & 1) == 0
// 3229 				fs->free_clst = ld_dword(fs->win + FSI_Free_Count);
        ADDS     R0,R4,#+536
          CFI FunCall ld_dword
        BL       ld_dword
        STR      R0,[R4, #+16]
// 3230 #endif
// 3231 #if (FF_FS_NOFSINFO & 2) == 0
// 3232 				fs->last_clst = ld_dword(fs->win + FSI_Nxt_Free);
        ADDS     R0,R4,#+540
          CFI FunCall ld_dword
        BL       ld_dword
        STR      R0,[R4, #+12]
// 3233 #endif
// 3234 			}
// 3235 		}
// 3236 #endif	/* (FF_FS_NOFSINFO & 3) != 3 */
// 3237 #endif	/* !FF_FS_READONLY */
// 3238 	}
// 3239 
// 3240 	fs->fs_type = fmt;		/* FAT sub-type */
??find_volume_38:
        STRB     R6,[R4, #+0]
// 3241 	fs->id = ++Fsid;		/* Volume mount ID */
        LDR.N    R0,??DataTable6_6
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_6
        STRH     R0,[R1, #+0]
        STRH     R0,[R4, #+6]
// 3242 #if FF_USE_LFN == 1
// 3243 	fs->lfnbuf = LfnBuf;	/* Static LFN working buffer */
// 3244 #if FF_FS_EXFAT
// 3245 	fs->dirbuf = DirBuf;	/* Static directory block scratchpad buuffer */
// 3246 #endif
// 3247 #endif
// 3248 #if FF_FS_RPATH != 0
// 3249 	fs->cdir = 0;			/* Initialize current directory */
// 3250 #endif
// 3251 #if FF_FS_LOCK != 0			/* Clear file lock semaphores */
// 3252 	clear_lock(fs);
// 3253 #endif
// 3254 	return FR_OK;
        MOVS     R0,#+0
??find_volume_1:
        ADD      SP,SP,#+20
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock33
// 3255 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC8      "FAT"
// 3256 
// 3257 
// 3258 
// 3259 
// 3260 /*-----------------------------------------------------------------------*/
// 3261 /* Check if the file/directory object is valid or not                    */
// 3262 /*-----------------------------------------------------------------------*/
// 3263 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock34 Using cfiCommon0
          CFI Function validate
        THUMB
// 3264 static
// 3265 FRESULT validate (	/* Returns FR_OK or FR_INVALID_OBJECT */
// 3266 	FFOBJID* obj,	/* Pointer to the FFOBJID, the 1st member in the FIL/DIR object, to check validity */
// 3267 	FATFS** rfs		/* Pointer to pointer to the owner filesystem object to return */
// 3268 )
// 3269 {
validate:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R6,R0
        MOVS     R4,R1
// 3270 	FRESULT res = FR_INVALID_OBJECT;
        MOVS     R5,#+9
// 3271 
// 3272 
// 3273 	if (obj && obj->fs && obj->fs->fs_type && obj->id == obj->fs->id) {	/* Test if the object is valid */
        CMP      R6,#+0
        BEQ.N    ??validate_0
        LDR      R0,[R6, #+0]
        CMP      R0,#+0
        BEQ.N    ??validate_0
        LDR      R0,[R6, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??validate_0
        LDRH     R0,[R6, #+4]
        LDR      R1,[R6, #+0]
        LDRH     R1,[R1, #+6]
        CMP      R0,R1
        BNE.N    ??validate_0
// 3274 #if FF_FS_REENTRANT
// 3275 		if (lock_fs(obj->fs)) {	/* Obtain the filesystem object */
// 3276 			if (!(disk_status(obj->fs->pdrv) & STA_NOINIT)) { /* Test if the phsical drive is kept initialized */
// 3277 				res = FR_OK;
// 3278 			} else {
// 3279 				unlock_fs(obj->fs, FR_OK);
// 3280 			}
// 3281 		} else {
// 3282 			res = FR_TIMEOUT;
// 3283 		}
// 3284 #else
// 3285 		if (!(disk_status(obj->fs->pdrv) & STA_NOINIT)) { /* Test if the phsical drive is kept initialized */
        LDR      R0,[R6, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_status
        BL       disk_status
        LSLS     R0,R0,#+31
        BMI.N    ??validate_0
// 3286 			res = FR_OK;
        MOVS     R5,#+0
// 3287 		}
// 3288 #endif
// 3289 	}
// 3290 	*rfs = (res == FR_OK) ? obj->fs : 0;	/* Corresponding filesystem object */
??validate_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??validate_1
        LDR      R0,[R6, #+0]
        B.N      ??validate_2
??validate_1:
        MOVS     R0,#+0
??validate_2:
        STR      R0,[R4, #+0]
// 3291 	return res;
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock34
// 3292 }
// 3293 
// 3294 
// 3295 
// 3296 
// 3297 /*---------------------------------------------------------------------------
// 3298 
// 3299    Public Functions (FatFs API)
// 3300 
// 3301 ----------------------------------------------------------------------------*/
// 3302 
// 3303 
// 3304 
// 3305 /*-----------------------------------------------------------------------*/
// 3306 /* Mount/Unmount a Logical Drive                                         */
// 3307 /*-----------------------------------------------------------------------*/
// 3308 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock35 Using cfiCommon0
          CFI Function f_mount
        THUMB
// 3309 FRESULT f_mount (
// 3310 	FATFS* fs,			/* Pointer to the filesystem object (NULL:unmount)*/
// 3311 	const TCHAR* path,	/* Logical drive number to be mounted/unmounted */
// 3312 	BYTE opt			/* Mode option 0:Do not mount (delayed mount), 1:Mount immediately */
// 3313 )
// 3314 {
f_mount:
        PUSH     {R0,R1,R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R4,R2
// 3315 	FATFS *cfs;
// 3316 	int vol;
// 3317 	FRESULT res;
// 3318 	const TCHAR *rp = path;
        LDR      R0,[SP, #+12]
        STR      R0,[SP, #+0]
// 3319 
// 3320 
// 3321 	/* Get logical drive number */
// 3322 	vol = get_ldnumber(&rp);
        ADD      R0,SP,#+0
          CFI FunCall get_ldnumber
        BL       get_ldnumber
// 3323 	if (vol < 0) return FR_INVALID_DRIVE;
        CMP      R0,#+0
        BPL.N    ??f_mount_0
        MOVS     R0,#+11
        B.N      ??f_mount_1
// 3324 	cfs = FatFs[vol];					/* Pointer to fs object */
??f_mount_0:
        LDR.N    R1,??DataTable6_2
        LDR      R1,[R1, R0, LSL #+2]
// 3325 
// 3326 	if (cfs) {
        CMP      R1,#+0
        BEQ.N    ??f_mount_2
// 3327 #if FF_FS_LOCK != 0
// 3328 		clear_lock(cfs);
// 3329 #endif
// 3330 #if FF_FS_REENTRANT						/* Discard sync object of the current volume */
// 3331 		if (!ff_del_syncobj(cfs->sobj)) return FR_INT_ERR;
// 3332 #endif
// 3333 		cfs->fs_type = 0;				/* Clear old fs object */
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
// 3334 	}
// 3335 
// 3336 	if (fs) {
??f_mount_2:
        LDR      R1,[SP, #+8]
        CMP      R1,#+0
        BEQ.N    ??f_mount_3
// 3337 		fs->fs_type = 0;				/* Clear new fs object */
        LDR      R1,[SP, #+8]
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
// 3338 #if FF_FS_REENTRANT						/* Create sync object for the new volume */
// 3339 		if (!ff_cre_syncobj((BYTE)vol, &fs->sobj)) return FR_INT_ERR;
// 3340 #endif
// 3341 	}
// 3342 	FatFs[vol] = fs;					/* Register new fs object */
??f_mount_3:
        LDR.N    R1,??DataTable6_2
        LDR      R2,[SP, #+8]
        STR      R2,[R1, R0, LSL #+2]
// 3343 
// 3344 	if (opt == 0) return FR_OK;			/* Do not mount now, it will be mounted later */
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_mount_4
        MOVS     R0,#+0
        B.N      ??f_mount_1
// 3345 
// 3346 	res = find_volume(&path, &fs, 0);	/* Force mounted the volume */
??f_mount_4:
        MOVS     R2,#+0
        ADD      R1,SP,#+8
        ADD      R0,SP,#+12
          CFI FunCall find_volume
        BL       find_volume
// 3347 	LEAVE_FF(fs, res);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??f_mount_1:
        ADD      SP,SP,#+16
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock35
// 3348 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     `?<Constant "\\"*+,:;<=>?[]|\\177">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     `?<Constant "FAT32">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     FatFs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0xffffff6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x41615252

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x61417272

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     Fsid
// 3349 
// 3350 
// 3351 
// 3352 
// 3353 /*-----------------------------------------------------------------------*/
// 3354 /* Open or Create a File                                                 */
// 3355 /*-----------------------------------------------------------------------*/
// 3356 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock36 Using cfiCommon0
          CFI Function f_open
        THUMB
// 3357 FRESULT f_open (
// 3358 	FIL* fp,			/* Pointer to the blank file object */
// 3359 	const TCHAR* path,	/* Pointer to the file name */
// 3360 	BYTE mode			/* Access mode and file open mode flags */
// 3361 )
// 3362 {
f_open:
        PUSH     {R1,R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+28
        SUB      SP,SP,#+52
          CFI CFA R13+80
        MOVS     R4,R0
        MOVS     R6,R2
// 3363 	FRESULT res;
// 3364 	DIR dj;
// 3365 	FATFS *fs;
// 3366 #if !FF_FS_READONLY
// 3367 	DWORD dw, cl, bcs, clst, sc;
// 3368 	FSIZE_t ofs;
// 3369 #endif
// 3370 	DEF_NAMBUF
// 3371 
// 3372 
// 3373 	if (!fp) return FR_INVALID_OBJECT;
        CMP      R4,#+0
        BNE.N    ??f_open_0
        MOVS     R0,#+9
        B.N      ??f_open_1
// 3374 
// 3375 	/* Get logical drive */
// 3376 	mode &= FF_FS_READONLY ? FA_READ : FA_READ | FA_WRITE | FA_CREATE_ALWAYS | FA_CREATE_NEW | FA_OPEN_ALWAYS | FA_OPEN_APPEND | FA_SEEKEND;
??f_open_0:
        ANDS     R6,R6,#0x3F
// 3377 	res = find_volume(&path, &fs, mode);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADD      R1,SP,#+0
        ADD      R0,SP,#+52
          CFI FunCall find_volume
        BL       find_volume
        MOVS     R5,R0
// 3378 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.W    ??f_open_2
// 3379 		dj.obj.fs = fs;
        LDR      R0,[SP, #+0]
        STR      R0,[SP, #+4]
// 3380 		INIT_NAMBUF(fs);
// 3381 		res = follow_path(&dj, path);	/* Follow the file path */
        LDR      R1,[SP, #+52]
        ADD      R0,SP,#+4
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 3382 #if !FF_FS_READONLY	/* Read/Write configuration */
// 3383 		if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_3
// 3384 			if (dj.fn[NSFLAG] & NS_NONAME) {	/* Origin directory itself? */
        LDRB     R0,[SP, #+47]
        LSLS     R0,R0,#+24
        BPL.N    ??f_open_3
// 3385 				res = FR_INVALID_NAME;
        MOVS     R5,#+6
// 3386 			}
// 3387 #if FF_FS_LOCK != 0
// 3388 			else {
// 3389 				res = chk_lock(&dj, (mode & ~FA_READ) ? 1 : 0);		/* Check if the file can be used */
// 3390 			}
// 3391 #endif
// 3392 		}
// 3393 		/* Create or Open a file */
// 3394 		if (mode & (FA_CREATE_ALWAYS | FA_OPEN_ALWAYS | FA_CREATE_NEW)) {
??f_open_3:
        MOVS     R0,#+28
        TST      R6,R0
        BEQ.N    ??f_open_4
// 3395 			if (res != FR_OK) {					/* No file, create new */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??f_open_5
// 3396 				if (res == FR_NO_FILE) {		/* There is no file to open, create a new entry */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BNE.N    ??f_open_6
// 3397 #if FF_FS_LOCK != 0
// 3398 					res = enq_lock() ? dir_register(&dj) : FR_TOO_MANY_OPEN_FILES;
// 3399 #else
// 3400 					res = dir_register(&dj);
        ADD      R0,SP,#+4
          CFI FunCall dir_register
        BL       dir_register
        MOVS     R5,R0
// 3401 #endif
// 3402 				}
// 3403 				mode |= FA_CREATE_ALWAYS;		/* File is created */
??f_open_6:
        ORRS     R6,R6,#0x8
        B.N      ??f_open_7
// 3404 			}
// 3405 			else {								/* Any object with the same name is already existing */
// 3406 				if (dj.obj.attr & (AM_RDO | AM_DIR)) {	/* Cannot overwrite it (R/O or DIR) */
??f_open_5:
        LDRB     R0,[SP, #+10]
        MOVS     R1,#+17
        TST      R0,R1
        BEQ.N    ??f_open_8
// 3407 					res = FR_DENIED;
        MOVS     R5,#+7
        B.N      ??f_open_7
// 3408 				} else {
// 3409 					if (mode & FA_CREATE_NEW) res = FR_EXIST;	/* Cannot create as new file */
??f_open_8:
        LSLS     R0,R6,#+29
        BPL.N    ??f_open_7
        MOVS     R5,#+8
// 3410 				}
// 3411 			}
// 3412 			if (res == FR_OK && (mode & FA_CREATE_ALWAYS)) {	/* Truncate the file if overwrite mode */
??f_open_7:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_9
        LSLS     R0,R6,#+28
        BPL.N    ??f_open_9
// 3413 #if FF_FS_EXFAT
// 3414 				if (fs->fs_type == FS_EXFAT) {
// 3415 					/* Get current allocation info */
// 3416 					fp->obj.fs = fs;
// 3417 					fp->obj.sclust = cl = ld_dword(fs->dirbuf + XDIR_FstClus);
// 3418 					fp->obj.objsize = ld_qword(fs->dirbuf + XDIR_FileSize);
// 3419 					fp->obj.stat = fs->dirbuf[XDIR_GenFlags] & 2;
// 3420 					fp->obj.n_frag = 0;
// 3421 					/* Set directory entry block initial state */
// 3422 					mem_set(fs->dirbuf + 2, 0, 30);		/* Clear 85 entry except for NumSec */
// 3423 					mem_set(fs->dirbuf + 38, 0, 26);	/* Clear C0 entry except for NumName and NameHash */
// 3424 					fs->dirbuf[XDIR_Attr] = AM_ARC;
// 3425 					st_dword(fs->dirbuf + XDIR_CrtTime, GET_FATTIME());
// 3426 					fs->dirbuf[XDIR_GenFlags] = 1;
// 3427 					res = store_xdir(&dj);
// 3428 					if (res == FR_OK && cl != 0) {		/* Remove the cluster chain if exist */
// 3429 						res = remove_chain(&fp->obj, cl, 0);
// 3430 						fs->last_clst = cl - 1;			/* Reuse the cluster hole */
// 3431 					}
// 3432 				} else
// 3433 #endif
// 3434 				{
// 3435 					/* Set directory entry initial state */
// 3436 					cl = ld_clust(fs, dj.dir);			/* Get current cluster chain */
        LDR      R1,[SP, #+32]
        LDR      R0,[SP, #+0]
          CFI FunCall ld_clust
        BL       ld_clust
        MOVS     R7,R0
// 3437 					st_dword(dj.dir + DIR_CrtTime, GET_FATTIME());	/* Set created time */
          CFI FunCall get_fattime
        BL       get_fattime
        MOVS     R1,R0
        LDR      R0,[SP, #+32]
        ADDS     R0,R0,#+14
          CFI FunCall st_dword
        BL       st_dword
// 3438 					dj.dir[DIR_Attr] = AM_ARC;			/* Reset attribute */
        LDR      R0,[SP, #+32]
        MOVS     R1,#+32
        STRB     R1,[R0, #+11]
// 3439 					st_clust(fs, dj.dir, 0);			/* Reset file allocation info */
        MOVS     R2,#+0
        LDR      R1,[SP, #+32]
        LDR      R0,[SP, #+0]
          CFI FunCall st_clust
        BL       st_clust
// 3440 					st_dword(dj.dir + DIR_FileSize, 0);
        MOVS     R1,#+0
        LDR      R0,[SP, #+32]
        ADDS     R0,R0,#+28
          CFI FunCall st_dword
        BL       st_dword
// 3441 					fs->wflag = 1;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+3]
// 3442 					if (cl != 0) {						/* Remove the cluster chain if exist */
        CMP      R7,#+0
        BEQ.N    ??f_open_9
// 3443 						dw = fs->winsect;
        LDR      R0,[SP, #+0]
        LDR      R8,[R0, #+44]
// 3444 						res = remove_chain(&dj.obj, cl, 0);
        MOVS     R2,#+0
        MOVS     R1,R7
        ADD      R0,SP,#+4
          CFI FunCall remove_chain
        BL       remove_chain
        MOVS     R5,R0
// 3445 						if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_9
// 3446 							res = move_window(fs, dw);
        MOV      R1,R8
        LDR      R0,[SP, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
// 3447 							fs->last_clst = cl - 1;		/* Reuse the cluster hole */
        LDR      R0,[SP, #+0]
        SUBS     R1,R7,#+1
        STR      R1,[R0, #+12]
        B.N      ??f_open_9
// 3448 						}
// 3449 					}
// 3450 				}
// 3451 			}
// 3452 		}
// 3453 		else {	/* Open an existing file */
// 3454 			if (res == FR_OK) {					/* Is the object exsiting? */
??f_open_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_9
// 3455 				if (dj.obj.attr & AM_DIR) {		/* File open against a directory */
        LDRB     R0,[SP, #+10]
        LSLS     R0,R0,#+27
        BPL.N    ??f_open_10
// 3456 					res = FR_NO_FILE;
        MOVS     R5,#+4
        B.N      ??f_open_9
// 3457 				} else {
// 3458 					if ((mode & FA_WRITE) && (dj.obj.attr & AM_RDO)) { /* Write mode open against R/O file */
??f_open_10:
        LSLS     R0,R6,#+30
        BPL.N    ??f_open_9
        LDRB     R0,[SP, #+10]
        LSLS     R0,R0,#+31
        BPL.N    ??f_open_9
// 3459 						res = FR_DENIED;
        MOVS     R5,#+7
// 3460 					}
// 3461 				}
// 3462 			}
// 3463 		}
// 3464 		if (res == FR_OK) {
??f_open_9:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_11
// 3465 			if (mode & FA_CREATE_ALWAYS) mode |= FA_MODIFIED;	/* Set file change flag if created or overwritten */
        LSLS     R0,R6,#+28
        BPL.N    ??f_open_12
        ORRS     R6,R6,#0x40
// 3466 			fp->dir_sect = fs->winsect;			/* Pointer to the directory entry */
??f_open_12:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+44]
        STR      R0,[R4, #+32]
// 3467 			fp->dir_ptr = dj.dir;
        LDR      R0,[SP, #+32]
        STR      R0,[R4, #+36]
// 3468 #if FF_FS_LOCK != 0
// 3469 			fp->obj.lockid = inc_lock(&dj, (mode & ~FA_READ) ? 1 : 0);	/* Lock the file for this session */
// 3470 			if (!fp->obj.lockid) res = FR_INT_ERR;
// 3471 #endif
// 3472 		}
// 3473 #else		/* R/O configuration */
// 3474 		if (res == FR_OK) {
// 3475 			if (dj.fn[NSFLAG] & NS_NONAME) {	/* Is it origin directory itself? */
// 3476 				res = FR_INVALID_NAME;
// 3477 			} else {
// 3478 				if (dj.obj.attr & AM_DIR) {		/* Is it a directory? */
// 3479 					res = FR_NO_FILE;
// 3480 				}
// 3481 			}
// 3482 		}
// 3483 #endif
// 3484 
// 3485 		if (res == FR_OK) {
??f_open_11:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_2
// 3486 #if FF_FS_EXFAT
// 3487 			if (fs->fs_type == FS_EXFAT) {
// 3488 				fp->obj.c_scl = dj.obj.sclust;							/* Get containing directory info */
// 3489 				fp->obj.c_size = ((DWORD)dj.obj.objsize & 0xFFFFFF00) | dj.obj.stat;
// 3490 				fp->obj.c_ofs = dj.blk_ofs;
// 3491 				fp->obj.sclust = ld_dword(fs->dirbuf + XDIR_FstClus);	/* Get object allocation info */
// 3492 				fp->obj.objsize = ld_qword(fs->dirbuf + XDIR_FileSize);
// 3493 				fp->obj.stat = fs->dirbuf[XDIR_GenFlags] & 2;
// 3494 				fp->obj.n_frag = 0;
// 3495 			} else
// 3496 #endif
// 3497 			{
// 3498 				fp->obj.sclust = ld_clust(fs, dj.dir);					/* Get object allocation info */
        LDR      R1,[SP, #+32]
        LDR      R0,[SP, #+0]
          CFI FunCall ld_clust
        BL       ld_clust
        STR      R0,[R4, #+8]
// 3499 				fp->obj.objsize = ld_dword(dj.dir + DIR_FileSize);
        LDR      R0,[SP, #+32]
        ADDS     R0,R0,#+28
          CFI FunCall ld_dword
        BL       ld_dword
        STR      R0,[R4, #+12]
// 3500 			}
// 3501 #if FF_USE_FASTSEEK
// 3502 			fp->cltbl = 0;			/* Disable fast seek mode */
// 3503 #endif
// 3504 			fp->obj.fs = fs;	 	/* Validate the file object */
        LDR      R0,[SP, #+0]
        STR      R0,[R4, #+0]
// 3505 			fp->obj.id = fs->id;
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+6]
        STRH     R0,[R4, #+4]
// 3506 			fp->flag = mode;		/* Set file access mode */
        STRB     R6,[R4, #+16]
// 3507 			fp->err = 0;			/* Clear error flag */
        MOVS     R0,#+0
        STRB     R0,[R4, #+17]
// 3508 			fp->sect = 0;			/* Invalidate current data sector */
        MOVS     R0,#+0
        STR      R0,[R4, #+28]
// 3509 			fp->fptr = 0;			/* Set file pointer top of the file */
        MOVS     R0,#+0
        STR      R0,[R4, #+20]
// 3510 #if !FF_FS_READONLY
// 3511 #if !FF_FS_TINY
// 3512 			mem_set(fp->buf, 0, FF_MAX_SS);	/* Clear sector buffer */
        MOV      R2,#+512
        MOVS     R1,#+0
        ADDS     R0,R4,#+40
          CFI FunCall mem_set
        BL       mem_set
// 3513 #endif
// 3514 			if ((mode & FA_SEEKEND) && fp->obj.objsize > 0) {	/* Seek to end of file if FA_OPEN_APPEND is specified */
        LSLS     R0,R6,#+26
        BPL.N    ??f_open_2
        LDR      R0,[R4, #+12]
        CMP      R0,#+0
        BEQ.N    ??f_open_2
// 3515 				fp->fptr = fp->obj.objsize;			/* Offset to seek */
        LDR      R0,[R4, #+12]
        STR      R0,[R4, #+20]
// 3516 				bcs = (DWORD)fs->csize * SS(fs);	/* Cluster size in byte */
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+10]
        MOV      R1,#+512
        MUL      R6,R1,R0
// 3517 				clst = fp->obj.sclust;				/* Follow the cluster chain */
        LDR      R0,[R4, #+8]
// 3518 				for (ofs = fp->obj.objsize; res == FR_OK && ofs > bcs; ofs -= bcs) {
        LDR      R7,[R4, #+12]
        B.N      ??f_open_13
// 3519 					clst = get_fat(&fp->obj, clst);
??f_open_14:
        MOVS     R1,R0
        MOVS     R0,R4
          CFI FunCall get_fat
        BL       get_fat
// 3520 					if (clst <= 1) res = FR_INT_ERR;
        CMP      R0,#+2
        BCS.N    ??f_open_15
        MOVS     R5,#+2
// 3521 					if (clst == 0xFFFFFFFF) res = FR_DISK_ERR;
??f_open_15:
        CMN      R0,#+1
        BNE.N    ??f_open_16
        MOVS     R5,#+1
// 3522 				}
??f_open_16:
        SUBS     R7,R7,R6
??f_open_13:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_17
        CMP      R6,R7
        BCC.N    ??f_open_14
// 3523 				fp->clust = clst;
??f_open_17:
        STR      R0,[R4, #+24]
// 3524 				if (res == FR_OK && ofs % SS(fs)) {	/* Fill sector buffer if not on the sector boundary */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_open_2
        MOV      R1,#+512
        UDIV     R2,R7,R1
        MLS      R2,R2,R1,R7
        CMP      R2,#+0
        BEQ.N    ??f_open_2
// 3525 					if ((sc = clst2sect(fs, clst)) == 0) {
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
          CFI FunCall clst2sect
        BL       clst2sect
        CMP      R0,#+0
        BNE.N    ??f_open_18
// 3526 						res = FR_INT_ERR;
        MOVS     R5,#+2
        B.N      ??f_open_2
// 3527 					} else {
// 3528 						fp->sect = sc + (DWORD)(ofs / SS(fs));
??f_open_18:
        ADDS     R0,R0,R7, LSR #+9
        STR      R0,[R4, #+28]
// 3529 #if !FF_FS_TINY
// 3530 						if (disk_read(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) res = FR_DISK_ERR;
        MOVS     R3,#+1
        LDR      R2,[R4, #+28]
        ADDS     R1,R4,#+40
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??f_open_2
        MOVS     R5,#+1
// 3531 #endif
// 3532 					}
// 3533 				}
// 3534 			}
// 3535 #endif
// 3536 		}
// 3537 
// 3538 		FREE_NAMBUF();
// 3539 	}
// 3540 
// 3541 	if (res != FR_OK) fp->obj.fs = 0;	/* Invalidate file object on error */
??f_open_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??f_open_19
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
// 3542 
// 3543 	LEAVE_FF(fs, res);
??f_open_19:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??f_open_1:
        ADD      SP,SP,#+56
          CFI CFA R13+24
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock36
// 3544 }
// 3545 
// 3546 
// 3547 
// 3548 
// 3549 /*-----------------------------------------------------------------------*/
// 3550 /* Read File                                                             */
// 3551 /*-----------------------------------------------------------------------*/
// 3552 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock37 Using cfiCommon0
          CFI Function f_read
        THUMB
// 3553 FRESULT f_read (
// 3554 	FIL* fp, 	/* Pointer to the file object */
// 3555 	void* buff,	/* Pointer to data buffer */
// 3556 	UINT btr,	/* Number of bytes to read */
// 3557 	UINT* br	/* Pointer to number of bytes read */
// 3558 )
// 3559 {
f_read:
        PUSH     {R4-R10,LR}
          CFI R14 Frame(CFA, -4)
          CFI R10 Frame(CFA, -8)
          CFI R9 Frame(CFA, -12)
          CFI R8 Frame(CFA, -16)
          CFI R7 Frame(CFA, -20)
          CFI R6 Frame(CFA, -24)
          CFI R5 Frame(CFA, -28)
          CFI R4 Frame(CFA, -32)
          CFI CFA R13+32
        SUB      SP,SP,#+8
          CFI CFA R13+40
        MOVS     R5,R0
        MOVS     R6,R2
        MOVS     R7,R3
// 3560 	FRESULT res;
// 3561 	FATFS *fs;
// 3562 	DWORD clst, sect;
// 3563 	FSIZE_t remain;
// 3564 	UINT rcnt, cc, csect;
// 3565 	BYTE *rbuff = (BYTE*)buff;
        MOVS     R4,R1
// 3566 
// 3567 
// 3568 	*br = 0;	/* Clear read byte counter */
        MOVS     R0,#+0
        STR      R0,[R7, #+0]
// 3569 	res = validate(&fp->obj, &fs);				/* Check validity of the file object */
        ADD      R1,SP,#+0
        MOVS     R0,R5
          CFI FunCall validate
        BL       validate
// 3570 	if (res != FR_OK || (res = (FRESULT)fp->err) != FR_OK) LEAVE_FF(fs, res);	/* Check validity */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_read_0
        LDRB     R0,[R5, #+17]
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??f_read_1
??f_read_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??f_read_2
// 3571 	if (!(fp->flag & FA_READ)) LEAVE_FF(fs, FR_DENIED); /* Check access mode */
??f_read_1:
        LDRB     R0,[R5, #+16]
        LSLS     R0,R0,#+31
        BMI.N    ??f_read_3
        MOVS     R0,#+7
        B.N      ??f_read_2
// 3572 	remain = fp->obj.objsize - fp->fptr;
??f_read_3:
        LDR      R0,[R5, #+12]
        LDR      R1,[R5, #+20]
        SUBS     R0,R0,R1
// 3573 	if (btr > remain) btr = (UINT)remain;		/* Truncate btr by remaining bytes */
        CMP      R0,R6
        BCS.N    ??f_read_4
        MOVS     R6,R0
        B.N      ??f_read_4
// 3574 
// 3575 	for ( ;  btr;								/* Repeat until all data read */
// 3576 		btr -= rcnt, *br += rcnt, rbuff += rcnt, fp->fptr += rcnt) {
// 3577 		if (fp->fptr % SS(fs) == 0) {			/* On the sector boundary? */
// 3578 			csect = (UINT)(fp->fptr / SS(fs) & (fs->csize - 1));	/* Sector offset in the cluster */
// 3579 			if (csect == 0) {					/* On the cluster boundary? */
// 3580 				if (fp->fptr == 0) {			/* On the top of the file? */
// 3581 					clst = fp->obj.sclust;		/* Follow cluster chain from the origin */
// 3582 				} else {						/* Middle or end of the file */
// 3583 #if FF_USE_FASTSEEK
// 3584 					if (fp->cltbl) {
// 3585 						clst = clmt_clust(fp, fp->fptr);	/* Get cluster# from the CLMT */
// 3586 					} else
// 3587 #endif
// 3588 					{
// 3589 						clst = get_fat(&fp->obj, fp->clust);	/* Follow cluster chain on the FAT */
// 3590 					}
// 3591 				}
// 3592 				if (clst < 2) ABORT(fs, FR_INT_ERR);
// 3593 				if (clst == 0xFFFFFFFF) ABORT(fs, FR_DISK_ERR);
// 3594 				fp->clust = clst;				/* Update current cluster */
// 3595 			}
// 3596 			sect = clst2sect(fs, fp->clust);	/* Get current sector */
// 3597 			if (sect == 0) ABORT(fs, FR_INT_ERR);
// 3598 			sect += csect;
// 3599 			cc = btr / SS(fs);					/* When remaining bytes >= sector size, */
// 3600 			if (cc > 0) {						/* Read maximum contiguous sectors directly */
// 3601 				if (csect + cc > fs->csize) {	/* Clip at cluster boundary */
// 3602 					cc = fs->csize - csect;
// 3603 				}
// 3604 				if (disk_read(fs->pdrv, rbuff, sect, cc) != RES_OK) ABORT(fs, FR_DISK_ERR);
// 3605 #if !FF_FS_READONLY && FF_FS_MINIMIZE <= 2		/* Replace one of the read sectors with cached data if it contains a dirty sector */
// 3606 #if FF_FS_TINY
// 3607 				if (fs->wflag && fs->winsect - sect < cc) {
// 3608 					mem_cpy(rbuff + ((fs->winsect - sect) * SS(fs)), fs->win, SS(fs));
// 3609 				}
// 3610 #else
// 3611 				if ((fp->flag & FA_DIRTY) && fp->sect - sect < cc) {
// 3612 					mem_cpy(rbuff + ((fp->sect - sect) * SS(fs)), fp->buf, SS(fs));
// 3613 				}
// 3614 #endif
// 3615 #endif
// 3616 				rcnt = SS(fs) * cc;				/* Number of bytes transferred */
// 3617 				continue;
// 3618 			}
// 3619 #if !FF_FS_TINY
// 3620 			if (fp->sect != sect) {			/* Load data sector if not in cache */
// 3621 #if !FF_FS_READONLY
// 3622 				if (fp->flag & FA_DIRTY) {		/* Write-back dirty sector cache */
// 3623 					if (disk_write(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) ABORT(fs, FR_DISK_ERR);
// 3624 					fp->flag &= (BYTE)~FA_DIRTY;
// 3625 				}
// 3626 #endif
// 3627 				if (disk_read(fs->pdrv, fp->buf, sect, 1) != RES_OK)	ABORT(fs, FR_DISK_ERR);	/* Fill sector cache */
// 3628 			}
// 3629 #endif
// 3630 			fp->sect = sect;
??f_read_5:
        STR      R9,[R5, #+28]
// 3631 		}
// 3632 		rcnt = SS(fs) - (UINT)fp->fptr % SS(fs);	/* Number of bytes left in the sector */
??f_read_6:
        LDR      R0,[R5, #+20]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        RSBS     R8,R2,#+512
// 3633 		if (rcnt > btr) rcnt = btr;					/* Clip it by btr if needed */
        CMP      R6,R8
        BCS.N    ??f_read_7
        MOV      R8,R6
// 3634 #if FF_FS_TINY
// 3635 		if (move_window(fs, fp->sect) != FR_OK) ABORT(fs, FR_DISK_ERR);	/* Move sector window */
// 3636 		mem_cpy(rbuff, fs->win + fp->fptr % SS(fs), rcnt);	/* Extract partial sector */
// 3637 #else
// 3638 		mem_cpy(rbuff, fp->buf + fp->fptr % SS(fs), rcnt);	/* Extract partial sector */
??f_read_7:
        MOV      R2,R8
        LDR      R0,[R5, #+20]
        MOV      R1,#+512
        UDIV     R3,R0,R1
        MLS      R3,R3,R1,R0
        ADDS     R0,R3,R5
        ADDS     R1,R0,#+40
        MOVS     R0,R4
          CFI FunCall mem_cpy
        BL       mem_cpy
??f_read_8:
        SUBS     R6,R6,R8
        LDR      R0,[R7, #+0]
        ADDS     R0,R8,R0
        STR      R0,[R7, #+0]
        ADDS     R4,R8,R4
        LDR      R0,[R5, #+20]
        ADDS     R0,R8,R0
        STR      R0,[R5, #+20]
??f_read_4:
        CMP      R6,#+0
        BEQ.W    ??f_read_9
        LDR      R0,[R5, #+20]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BNE.N    ??f_read_6
        LDR      R0,[R5, #+20]
        LDR      R1,[SP, #+0]
        LDRH     R1,[R1, #+10]
        SUBS     R1,R1,#+1
        ANDS     R8,R1,R0, LSR #+9
        CMP      R8,#+0
        BNE.N    ??f_read_10
        LDR      R0,[R5, #+20]
        CMP      R0,#+0
        BNE.N    ??f_read_11
        LDR      R0,[R5, #+8]
        B.N      ??f_read_12
??f_read_11:
        LDR      R1,[R5, #+24]
        MOVS     R0,R5
          CFI FunCall get_fat
        BL       get_fat
??f_read_12:
        CMP      R0,#+2
        BCS.N    ??f_read_13
        MOVS     R0,#+2
        STRB     R0,[R5, #+17]
        MOVS     R0,#+2
        B.N      ??f_read_2
??f_read_13:
        CMN      R0,#+1
        BNE.N    ??f_read_14
        MOVS     R0,#+1
        STRB     R0,[R5, #+17]
        MOVS     R0,#+1
        B.N      ??f_read_2
??f_read_14:
        STR      R0,[R5, #+24]
??f_read_10:
        LDR      R1,[R5, #+24]
        LDR      R0,[SP, #+0]
          CFI FunCall clst2sect
        BL       clst2sect
        MOV      R9,R0
        CMP      R9,#+0
        BNE.N    ??f_read_15
        MOVS     R0,#+2
        STRB     R0,[R5, #+17]
        MOVS     R0,#+2
        B.N      ??f_read_2
??f_read_15:
        ADDS     R9,R8,R9
        LSRS     R10,R6,#+9
        CMP      R10,#+0
        BEQ.N    ??f_read_16
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+10]
        ADDS     R1,R10,R8
        CMP      R0,R1
        BCS.N    ??f_read_17
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+10]
        SUBS     R10,R0,R8
??f_read_17:
        MOV      R3,R10
        MOV      R2,R9
        MOVS     R1,R4
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??f_read_18
        MOVS     R0,#+1
        STRB     R0,[R5, #+17]
        MOVS     R0,#+1
        B.N      ??f_read_2
??f_read_18:
        LDRB     R0,[R5, #+16]
        LSLS     R0,R0,#+24
        BPL.N    ??f_read_19
        LDR      R0,[R5, #+28]
        SUBS     R0,R0,R9
        CMP      R0,R10
        BCS.N    ??f_read_19
        MOV      R2,#+512
        ADDS     R1,R5,#+40
        LDR      R0,[R5, #+28]
        SUBS     R0,R0,R9
        MOV      R3,#+512
        MLA      R0,R3,R0,R4
          CFI FunCall mem_cpy
        BL       mem_cpy
??f_read_19:
        MOV      R0,#+512
        MUL      R8,R0,R10
        B.N      ??f_read_8
??f_read_16:
        LDR      R0,[R5, #+28]
        CMP      R0,R9
        BEQ.W    ??f_read_5
        LDRB     R0,[R5, #+16]
        LSLS     R0,R0,#+24
        BPL.N    ??f_read_20
        MOVS     R3,#+1
        LDR      R2,[R5, #+28]
        ADDS     R1,R5,#+40
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_read_21
        MOVS     R0,#+1
        STRB     R0,[R5, #+17]
        MOVS     R0,#+1
        B.N      ??f_read_2
??f_read_21:
        LDRB     R0,[R5, #+16]
        ANDS     R0,R0,#0x7F
        STRB     R0,[R5, #+16]
??f_read_20:
        MOVS     R3,#+1
        MOV      R2,R9
        ADDS     R1,R5,#+40
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.W    ??f_read_5
        MOVS     R0,#+1
        STRB     R0,[R5, #+17]
        MOVS     R0,#+1
        B.N      ??f_read_2
// 3639 #endif
// 3640 	}
// 3641 
// 3642 	LEAVE_FF(fs, FR_OK);
??f_read_9:
        MOVS     R0,#+0
??f_read_2:
        POP      {R1,R2,R4-R10,PC}  ;; return
          CFI EndBlock cfiBlock37
// 3643 }
// 3644 
// 3645 
// 3646 
// 3647 
// 3648 #if !FF_FS_READONLY
// 3649 /*-----------------------------------------------------------------------*/
// 3650 /* Write File                                                            */
// 3651 /*-----------------------------------------------------------------------*/
// 3652 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock38 Using cfiCommon0
          CFI Function f_write
        THUMB
// 3653 FRESULT f_write (
// 3654 	FIL* fp,			/* Pointer to the file object */
// 3655 	const void* buff,	/* Pointer to the data to be written */
// 3656 	UINT btw,			/* Number of bytes to write */
// 3657 	UINT* bw			/* Pointer to number of bytes written */
// 3658 )
// 3659 {
f_write:
        PUSH     {R4-R10,LR}
          CFI R14 Frame(CFA, -4)
          CFI R10 Frame(CFA, -8)
          CFI R9 Frame(CFA, -12)
          CFI R8 Frame(CFA, -16)
          CFI R7 Frame(CFA, -20)
          CFI R6 Frame(CFA, -24)
          CFI R5 Frame(CFA, -28)
          CFI R4 Frame(CFA, -32)
          CFI CFA R13+32
        SUB      SP,SP,#+8
          CFI CFA R13+40
        MOVS     R5,R0
        MOVS     R6,R2
        MOVS     R7,R3
// 3660 	FRESULT res;
// 3661 	FATFS *fs;
// 3662 	DWORD clst, sect;
// 3663 	UINT wcnt, cc, csect;
// 3664 	const BYTE *wbuff = (const BYTE*)buff;
        MOVS     R4,R1
// 3665 
// 3666 
// 3667 	*bw = 0;	/* Clear write byte counter */
        MOVS     R0,#+0
        STR      R0,[R7, #+0]
// 3668 	res = validate(&fp->obj, &fs);			/* Check validity of the file object */
        ADD      R1,SP,#+0
        MOVS     R0,R5
          CFI FunCall validate
        BL       validate
// 3669 	if (res != FR_OK || (res = (FRESULT)fp->err) != FR_OK) LEAVE_FF(fs, res);	/* Check validity */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_write_0
        LDRB     R0,[R5, #+17]
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??f_write_1
??f_write_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??f_write_2
// 3670 	if (!(fp->flag & FA_WRITE)) LEAVE_FF(fs, FR_DENIED);	/* Check access mode */
??f_write_1:
        LDRB     R0,[R5, #+16]
        LSLS     R0,R0,#+30
        BMI.N    ??f_write_3
        MOVS     R0,#+7
        B.N      ??f_write_2
// 3671 
// 3672 	/* Check fptr wrap-around (file size cannot reach 4 GiB at FAT volume) */
// 3673 	if ((!FF_FS_EXFAT || fs->fs_type != FS_EXFAT) && (DWORD)(fp->fptr + btw) < (DWORD)fp->fptr) {
??f_write_3:
        LDR      R0,[R5, #+20]
        ADDS     R0,R6,R0
        LDR      R1,[R5, #+20]
        CMP      R0,R1
        BCS.N    ??f_write_4
// 3674 		btw = (UINT)(0xFFFFFFFF - (DWORD)fp->fptr);
        MOVS     R0,#-1
        LDR      R1,[R5, #+20]
        SUBS     R6,R0,R1
        B.N      ??f_write_4
// 3675 	}
// 3676 
// 3677 	for ( ;  btw;							/* Repeat until all data written */
// 3678 		btw -= wcnt, *bw += wcnt, wbuff += wcnt, fp->fptr += wcnt, fp->obj.objsize = (fp->fptr > fp->obj.objsize) ? fp->fptr : fp->obj.objsize) {
??f_write_5:
        LDR      R0,[R5, #+12]
??f_write_6:
        STR      R0,[R5, #+12]
??f_write_4:
        CMP      R6,#+0
        BEQ.N    ??f_write_7
// 3679 		if (fp->fptr % SS(fs) == 0) {		/* On the sector boundary? */
        LDR      R0,[R5, #+20]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BNE.W    ??f_write_8
// 3680 			csect = (UINT)(fp->fptr / SS(fs)) & (fs->csize - 1);	/* Sector offset in the cluster */
        LDR      R0,[R5, #+20]
        LDR      R1,[SP, #+0]
        LDRH     R1,[R1, #+10]
        SUBS     R1,R1,#+1
        ANDS     R8,R1,R0, LSR #+9
// 3681 			if (csect == 0) {				/* On the cluster boundary? */
        CMP      R8,#+0
        BNE.N    ??f_write_9
// 3682 				if (fp->fptr == 0) {		/* On the top of the file? */
        LDR      R0,[R5, #+20]
        CMP      R0,#+0
        BNE.N    ??f_write_10
// 3683 					clst = fp->obj.sclust;	/* Follow from the origin */
        LDR      R0,[R5, #+8]
// 3684 					if (clst == 0) {		/* If no cluster is allocated, */
        CMP      R0,#+0
        BNE.N    ??f_write_11
// 3685 						clst = create_chain(&fp->obj, 0);	/* create a new cluster chain */
        MOVS     R1,#+0
        MOVS     R0,R5
          CFI FunCall create_chain
        BL       create_chain
        B.N      ??f_write_11
// 3686 					}
// 3687 				} else {					/* On the middle or end of the file */
// 3688 #if FF_USE_FASTSEEK
// 3689 					if (fp->cltbl) {
// 3690 						clst = clmt_clust(fp, fp->fptr);	/* Get cluster# from the CLMT */
// 3691 					} else
// 3692 #endif
// 3693 					{
// 3694 						clst = create_chain(&fp->obj, fp->clust);	/* Follow or stretch cluster chain on the FAT */
??f_write_10:
        LDR      R1,[R5, #+24]
        MOVS     R0,R5
          CFI FunCall create_chain
        BL       create_chain
// 3695 					}
// 3696 				}
// 3697 				if (clst == 0) break;		/* Could not allocate a new cluster (disk full) */
??f_write_11:
        CMP      R0,#+0
        BNE.N    ??f_write_12
// 3698 				if (clst == 1) ABORT(fs, FR_INT_ERR);
// 3699 				if (clst == 0xFFFFFFFF) ABORT(fs, FR_DISK_ERR);
// 3700 				fp->clust = clst;			/* Update current cluster */
// 3701 				if (fp->obj.sclust == 0) fp->obj.sclust = clst;	/* Set start cluster if the first write */
// 3702 			}
// 3703 #if FF_FS_TINY
// 3704 			if (fs->winsect == fp->sect && sync_window(fs) != FR_OK) ABORT(fs, FR_DISK_ERR);	/* Write-back sector cache */
// 3705 #else
// 3706 			if (fp->flag & FA_DIRTY) {		/* Write-back sector cache */
// 3707 				if (disk_write(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) ABORT(fs, FR_DISK_ERR);
// 3708 				fp->flag &= (BYTE)~FA_DIRTY;
// 3709 			}
// 3710 #endif
// 3711 			sect = clst2sect(fs, fp->clust);	/* Get current sector */
// 3712 			if (sect == 0) ABORT(fs, FR_INT_ERR);
// 3713 			sect += csect;
// 3714 			cc = btw / SS(fs);				/* When remaining bytes >= sector size, */
// 3715 			if (cc > 0) {					/* Write maximum contiguous sectors directly */
// 3716 				if (csect + cc > fs->csize) {	/* Clip at cluster boundary */
// 3717 					cc = fs->csize - csect;
// 3718 				}
// 3719 				if (disk_write(fs->pdrv, wbuff, sect, cc) != RES_OK) ABORT(fs, FR_DISK_ERR);
// 3720 #if FF_FS_MINIMIZE <= 2
// 3721 #if FF_FS_TINY
// 3722 				if (fs->winsect - sect < cc) {	/* Refill sector cache if it gets invalidated by the direct write */
// 3723 					mem_cpy(fs->win, wbuff + ((fs->winsect - sect) * SS(fs)), SS(fs));
// 3724 					fs->wflag = 0;
// 3725 				}
// 3726 #else
// 3727 				if (fp->sect - sect < cc) { /* Refill sector cache if it gets invalidated by the direct write */
// 3728 					mem_cpy(fp->buf, wbuff + ((fp->sect - sect) * SS(fs)), SS(fs));
// 3729 					fp->flag &= (BYTE)~FA_DIRTY;
// 3730 				}
// 3731 #endif
// 3732 #endif
// 3733 				wcnt = SS(fs) * cc;		/* Number of bytes transferred */
// 3734 				continue;
// 3735 			}
// 3736 #if FF_FS_TINY
// 3737 			if (fp->fptr >= fp->obj.objsize) {	/* Avoid silly cache filling on the growing edge */
// 3738 				if (sync_window(fs) != FR_OK) ABORT(fs, FR_DISK_ERR);
// 3739 				fs->winsect = sect;
// 3740 			}
// 3741 #else
// 3742 			if (fp->sect != sect && 		/* Fill sector cache with file data */
// 3743 				fp->fptr < fp->obj.objsize &&
// 3744 				disk_read(fs->pdrv, fp->buf, sect, 1) != RES_OK) {
// 3745 					ABORT(fs, FR_DISK_ERR);
// 3746 			}
// 3747 #endif
// 3748 			fp->sect = sect;
// 3749 		}
// 3750 		wcnt = SS(fs) - (UINT)fp->fptr % SS(fs);	/* Number of bytes left in the sector */
// 3751 		if (wcnt > btw) wcnt = btw;					/* Clip it by btw if needed */
// 3752 #if FF_FS_TINY
// 3753 		if (move_window(fs, fp->sect) != FR_OK) ABORT(fs, FR_DISK_ERR);	/* Move sector window */
// 3754 		mem_cpy(fs->win + fp->fptr % SS(fs), wbuff, wcnt);	/* Fit data to the sector */
// 3755 		fs->wflag = 1;
// 3756 #else
// 3757 		mem_cpy(fp->buf + fp->fptr % SS(fs), wbuff, wcnt);	/* Fit data to the sector */
// 3758 		fp->flag |= FA_DIRTY;
// 3759 #endif
// 3760 	}
// 3761 
// 3762 	fp->flag |= FA_MODIFIED;				/* Set file change flag */
??f_write_7:
        LDRB     R0,[R5, #+16]
        ORRS     R0,R0,#0x40
        STRB     R0,[R5, #+16]
// 3763 
// 3764 	LEAVE_FF(fs, FR_OK);
        MOVS     R0,#+0
??f_write_2:
        POP      {R1,R2,R4-R10,PC}  ;; return
??f_write_12:
        CMP      R0,#+1
        BNE.N    ??f_write_13
        MOVS     R0,#+2
        STRB     R0,[R5, #+17]
        MOVS     R0,#+2
        B.N      ??f_write_2
??f_write_13:
        CMN      R0,#+1
        BNE.N    ??f_write_14
        MOVS     R0,#+1
        STRB     R0,[R5, #+17]
        MOVS     R0,#+1
        B.N      ??f_write_2
??f_write_14:
        STR      R0,[R5, #+24]
        LDR      R1,[R5, #+8]
        CMP      R1,#+0
        BNE.N    ??f_write_9
        STR      R0,[R5, #+8]
??f_write_9:
        LDRB     R0,[R5, #+16]
        LSLS     R0,R0,#+24
        BPL.N    ??f_write_15
        MOVS     R3,#+1
        LDR      R2,[R5, #+28]
        ADDS     R1,R5,#+40
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_write_16
        MOVS     R0,#+1
        STRB     R0,[R5, #+17]
        MOVS     R0,#+1
        B.N      ??f_write_2
??f_write_16:
        LDRB     R0,[R5, #+16]
        ANDS     R0,R0,#0x7F
        STRB     R0,[R5, #+16]
??f_write_15:
        LDR      R1,[R5, #+24]
        LDR      R0,[SP, #+0]
          CFI FunCall clst2sect
        BL       clst2sect
        MOV      R9,R0
        CMP      R9,#+0
        BNE.N    ??f_write_17
        MOVS     R0,#+2
        STRB     R0,[R5, #+17]
        MOVS     R0,#+2
        B.N      ??f_write_2
??f_write_17:
        ADDS     R9,R8,R9
        LSRS     R10,R6,#+9
        CMP      R10,#+0
        BEQ.N    ??f_write_18
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+10]
        ADDS     R1,R10,R8
        CMP      R0,R1
        BCS.N    ??f_write_19
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+10]
        SUBS     R10,R0,R8
??f_write_19:
        MOV      R3,R10
        MOV      R2,R9
        MOVS     R1,R4
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_write_20
        MOVS     R0,#+1
        STRB     R0,[R5, #+17]
        MOVS     R0,#+1
        B.N      ??f_write_2
??f_write_20:
        LDR      R0,[R5, #+28]
        SUBS     R0,R0,R9
        CMP      R0,R10
        BCS.N    ??f_write_21
        MOV      R2,#+512
        LDR      R0,[R5, #+28]
        SUBS     R0,R0,R9
        MOV      R1,#+512
        MLA      R1,R1,R0,R4
        ADDS     R0,R5,#+40
          CFI FunCall mem_cpy
        BL       mem_cpy
        LDRB     R0,[R5, #+16]
        ANDS     R0,R0,#0x7F
        STRB     R0,[R5, #+16]
??f_write_21:
        MOV      R0,#+512
        MUL      R8,R0,R10
        B.N      ??f_write_22
??f_write_18:
        LDR      R0,[R5, #+28]
        CMP      R0,R9
        BEQ.N    ??f_write_23
        LDR      R0,[R5, #+20]
        LDR      R1,[R5, #+12]
        CMP      R0,R1
        BCS.N    ??f_write_23
        MOVS     R3,#+1
        MOV      R2,R9
        ADDS     R1,R5,#+40
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??f_write_23
        MOVS     R0,#+1
        STRB     R0,[R5, #+17]
        MOVS     R0,#+1
        B.N      ??f_write_2
??f_write_23:
        STR      R9,[R5, #+28]
??f_write_8:
        LDR      R0,[R5, #+20]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        RSBS     R8,R2,#+512
        CMP      R6,R8
        BCS.N    ??f_write_24
        MOV      R8,R6
??f_write_24:
        MOV      R2,R8
        MOVS     R1,R4
        LDR      R0,[R5, #+20]
        MOV      R3,#+512
        UDIV     R12,R0,R3
        MLS      R12,R12,R3,R0
        ADDS     R0,R12,R5
        ADDS     R0,R0,#+40
          CFI FunCall mem_cpy
        BL       mem_cpy
        LDRB     R0,[R5, #+16]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+16]
??f_write_22:
        SUBS     R6,R6,R8
        LDR      R0,[R7, #+0]
        ADDS     R0,R8,R0
        STR      R0,[R7, #+0]
        ADDS     R4,R8,R4
        LDR      R0,[R5, #+20]
        ADDS     R0,R8,R0
        STR      R0,[R5, #+20]
        LDR      R0,[R5, #+12]
        LDR      R1,[R5, #+20]
        CMP      R0,R1
        BCS.W    ??f_write_5
        LDR      R0,[R5, #+20]
        B.N      ??f_write_6
          CFI EndBlock cfiBlock38
// 3765 }
// 3766 
// 3767 
// 3768 
// 3769 
// 3770 /*-----------------------------------------------------------------------*/
// 3771 /* Synchronize the File                                                  */
// 3772 /*-----------------------------------------------------------------------*/
// 3773 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock39 Using cfiCommon0
          CFI Function f_sync
        THUMB
// 3774 FRESULT f_sync (
// 3775 	FIL* fp		/* Pointer to the file object */
// 3776 )
// 3777 {
f_sync:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R4,R0
// 3778 	FRESULT res;
// 3779 	FATFS *fs;
// 3780 	DWORD tm;
// 3781 	BYTE *dir;
// 3782 
// 3783 
// 3784 	res = validate(&fp->obj, &fs);	/* Check validity of the file object */
        ADD      R1,SP,#+0
        MOVS     R0,R4
          CFI FunCall validate
        BL       validate
// 3785 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_sync_0
// 3786 		if (fp->flag & FA_MODIFIED) {	/* Is there any change to the file? */
        LDRB     R1,[R4, #+16]
        LSLS     R1,R1,#+25
        BPL.N    ??f_sync_0
// 3787 #if !FF_FS_TINY
// 3788 			if (fp->flag & FA_DIRTY) {	/* Write-back cached data if needed */
        LDRB     R0,[R4, #+16]
        LSLS     R0,R0,#+24
        BPL.N    ??f_sync_1
// 3789 				if (disk_write(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) LEAVE_FF(fs, FR_DISK_ERR);
        MOVS     R3,#+1
        LDR      R2,[R4, #+28]
        ADDS     R1,R4,#+40
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_sync_2
        MOVS     R0,#+1
        B.N      ??f_sync_3
// 3790 				fp->flag &= (BYTE)~FA_DIRTY;
??f_sync_2:
        LDRB     R0,[R4, #+16]
        ANDS     R0,R0,#0x7F
        STRB     R0,[R4, #+16]
// 3791 			}
// 3792 #endif
// 3793 			/* Update the directory entry */
// 3794 			tm = GET_FATTIME();				/* Modified time */
??f_sync_1:
          CFI FunCall get_fattime
        BL       get_fattime
        MOVS     R5,R0
// 3795 #if FF_FS_EXFAT
// 3796 			if (fs->fs_type == FS_EXFAT) {
// 3797 				res = fill_first_frag(&fp->obj);	/* Fill first fragment on the FAT if needed */
// 3798 				if (res == FR_OK) {
// 3799 					res = fill_last_frag(&fp->obj, fp->clust, 0xFFFFFFFF);	/* Fill last fragment on the FAT if needed */
// 3800 				}
// 3801 				if (res == FR_OK) {
// 3802 					DIR dj;
// 3803 					DEF_NAMBUF
// 3804 
// 3805 					INIT_NAMBUF(fs);
// 3806 					res = load_obj_xdir(&dj, &fp->obj);	/* Load directory entry block */
// 3807 					if (res == FR_OK) {
// 3808 						fs->dirbuf[XDIR_Attr] |= AM_ARC;				/* Set archive attribute to indicate that the file has been changed */
// 3809 						fs->dirbuf[XDIR_GenFlags] = fp->obj.stat | 1;	/* Update file allocation information */
// 3810 						st_dword(fs->dirbuf + XDIR_FstClus, fp->obj.sclust);
// 3811 						st_qword(fs->dirbuf + XDIR_FileSize, fp->obj.objsize);
// 3812 						st_qword(fs->dirbuf + XDIR_ValidFileSize, fp->obj.objsize);
// 3813 						st_dword(fs->dirbuf + XDIR_ModTime, tm);		/* Update modified time */
// 3814 						fs->dirbuf[XDIR_ModTime10] = 0;
// 3815 						st_dword(fs->dirbuf + XDIR_AccTime, 0);
// 3816 						res = store_xdir(&dj);	/* Restore it to the directory */
// 3817 						if (res == FR_OK) {
// 3818 							res = sync_fs(fs);
// 3819 							fp->flag &= (BYTE)~FA_MODIFIED;
// 3820 						}
// 3821 					}
// 3822 					FREE_NAMBUF();
// 3823 				}
// 3824 			} else
// 3825 #endif
// 3826 			{
// 3827 				res = move_window(fs, fp->dir_sect);
        LDR      R1,[R4, #+32]
        LDR      R0,[SP, #+0]
          CFI FunCall move_window
        BL       move_window
// 3828 				if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_sync_0
// 3829 					dir = fp->dir_ptr;
        LDR      R6,[R4, #+36]
// 3830 					dir[DIR_Attr] |= AM_ARC;						/* Set archive attribute to indicate that the file has been changed */
        LDRB     R0,[R6, #+11]
        ORRS     R0,R0,#0x20
        STRB     R0,[R6, #+11]
// 3831 					st_clust(fp->obj.fs, dir, fp->obj.sclust);		/* Update file allocation information  */
        LDR      R2,[R4, #+8]
        MOVS     R1,R6
        LDR      R0,[R4, #+0]
          CFI FunCall st_clust
        BL       st_clust
// 3832 					st_dword(dir + DIR_FileSize, (DWORD)fp->obj.objsize);	/* Update file size */
        LDR      R1,[R4, #+12]
        ADDS     R0,R6,#+28
          CFI FunCall st_dword
        BL       st_dword
// 3833 					st_dword(dir + DIR_ModTime, tm);				/* Update modified time */
        MOVS     R1,R5
        ADDS     R0,R6,#+22
          CFI FunCall st_dword
        BL       st_dword
// 3834 					st_word(dir + DIR_LstAccDate, 0);
        MOVS     R1,#+0
        ADDS     R0,R6,#+18
          CFI FunCall st_word
        BL       st_word
// 3835 					fs->wflag = 1;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+3]
// 3836 					res = sync_fs(fs);					/* Restore it to the directory */
        LDR      R0,[SP, #+0]
          CFI FunCall sync_fs
        BL       sync_fs
// 3837 					fp->flag &= (BYTE)~FA_MODIFIED;
        LDRB     R1,[R4, #+16]
        ANDS     R1,R1,#0xBF
        STRB     R1,[R4, #+16]
// 3838 				}
// 3839 			}
// 3840 		}
// 3841 	}
// 3842 
// 3843 	LEAVE_FF(fs, res);
??f_sync_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??f_sync_3:
        POP      {R1,R2,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock39
// 3844 }
// 3845 
// 3846 #endif /* !FF_FS_READONLY */
// 3847 
// 3848 
// 3849 
// 3850 
// 3851 /*-----------------------------------------------------------------------*/
// 3852 /* Close File                                                            */
// 3853 /*-----------------------------------------------------------------------*/
// 3854 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock40 Using cfiCommon0
          CFI Function f_close
        THUMB
// 3855 FRESULT f_close (
// 3856 	FIL* fp		/* Pointer to the file object to be closed */
// 3857 )
// 3858 {
f_close:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
// 3859 	FRESULT res;
// 3860 	FATFS *fs;
// 3861 
// 3862 #if !FF_FS_READONLY
// 3863 	res = f_sync(fp);					/* Flush cached data */
        MOVS     R0,R4
          CFI FunCall f_sync
        BL       f_sync
// 3864 	if (res == FR_OK)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_close_0
// 3865 #endif
// 3866 	{
// 3867 		res = validate(&fp->obj, &fs);	/* Lock volume */
        ADD      R1,SP,#+0
        MOVS     R0,R4
          CFI FunCall validate
        BL       validate
// 3868 		if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_close_0
// 3869 #if FF_FS_LOCK != 0
// 3870 			res = dec_lock(fp->obj.lockid);		/* Decrement file open counter */
// 3871 			if (res == FR_OK) fp->obj.fs = 0;	/* Invalidate file object */
// 3872 #else
// 3873 			fp->obj.fs = 0;	/* Invalidate file object */
        MOVS     R1,#+0
        STR      R1,[R4, #+0]
// 3874 #endif
// 3875 #if FF_FS_REENTRANT
// 3876 			unlock_fs(fs, FR_OK);		/* Unlock volume */
// 3877 #endif
// 3878 		}
// 3879 	}
// 3880 	return res;
??f_close_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4,PC}    ;; return
          CFI EndBlock cfiBlock40
// 3881 }
// 3882 
// 3883 
// 3884 
// 3885 
// 3886 #if FF_FS_RPATH >= 1
// 3887 /*-----------------------------------------------------------------------*/
// 3888 /* Change Current Directory or Current Drive, Get Current Directory      */
// 3889 /*-----------------------------------------------------------------------*/
// 3890 
// 3891 #if FF_VOLUMES >= 2
// 3892 FRESULT f_chdrive (
// 3893 	const TCHAR* path		/* Drive number */
// 3894 )
// 3895 {
// 3896 	int vol;
// 3897 
// 3898 
// 3899 	/* Get logical drive number */
// 3900 	vol = get_ldnumber(&path);
// 3901 	if (vol < 0) return FR_INVALID_DRIVE;
// 3902 
// 3903 	CurrVol = (BYTE)vol;	/* Set it as current volume */
// 3904 
// 3905 	return FR_OK;
// 3906 }
// 3907 #endif
// 3908 
// 3909 
// 3910 FRESULT f_chdir (
// 3911 	const TCHAR* path	/* Pointer to the directory path */
// 3912 )
// 3913 {
// 3914 	FRESULT res;
// 3915 	DIR dj;
// 3916 	FATFS *fs;
// 3917 	DEF_NAMBUF
// 3918 
// 3919 	/* Get logical drive */
// 3920 	res = find_volume(&path, &fs, 0);
// 3921 	if (res == FR_OK) {
// 3922 		dj.obj.fs = fs;
// 3923 		INIT_NAMBUF(fs);
// 3924 		res = follow_path(&dj, path);		/* Follow the path */
// 3925 		if (res == FR_OK) {					/* Follow completed */
// 3926 			if (dj.fn[NSFLAG] & NS_NONAME) {
// 3927 				fs->cdir = dj.obj.sclust;	/* It is the start directory itself */
// 3928 #if FF_FS_EXFAT
// 3929 				if (fs->fs_type == FS_EXFAT) {
// 3930 					fs->cdc_scl = dj.obj.c_scl;
// 3931 					fs->cdc_size = dj.obj.c_size;
// 3932 					fs->cdc_ofs = dj.obj.c_ofs;
// 3933 				}
// 3934 #endif
// 3935 			} else {
// 3936 				if (dj.obj.attr & AM_DIR) {	/* It is a sub-directory */
// 3937 #if FF_FS_EXFAT
// 3938 					if (fs->fs_type == FS_EXFAT) {
// 3939 						fs->cdir = ld_dword(fs->dirbuf + XDIR_FstClus);		/* Sub-directory cluster */
// 3940 						fs->cdc_scl = dj.obj.sclust;						/* Save containing directory information */
// 3941 						fs->cdc_size = ((DWORD)dj.obj.objsize & 0xFFFFFF00) | dj.obj.stat;
// 3942 						fs->cdc_ofs = dj.blk_ofs;
// 3943 					} else
// 3944 #endif
// 3945 					{
// 3946 						fs->cdir = ld_clust(fs, dj.dir);					/* Sub-directory cluster */
// 3947 					}
// 3948 				} else {
// 3949 					res = FR_NO_PATH;		/* Reached but a file */
// 3950 				}
// 3951 			}
// 3952 		}
// 3953 		FREE_NAMBUF();
// 3954 		if (res == FR_NO_FILE) res = FR_NO_PATH;
// 3955 	}
// 3956 
// 3957 	LEAVE_FF(fs, res);
// 3958 }
// 3959 
// 3960 
// 3961 #if FF_FS_RPATH >= 2
// 3962 FRESULT f_getcwd (
// 3963 	TCHAR* buff,	/* Pointer to the directory path */
// 3964 	UINT len		/* Size of path */
// 3965 )
// 3966 {
// 3967 	FRESULT res;
// 3968 	DIR dj;
// 3969 	FATFS *fs;
// 3970 	UINT i, n;
// 3971 	DWORD ccl;
// 3972 	TCHAR *tp;
// 3973 	FILINFO fno;
// 3974 	DEF_NAMBUF
// 3975 
// 3976 
// 3977 	*buff = 0;
// 3978 	/* Get logical drive */
// 3979 	res = find_volume((const TCHAR**)&buff, &fs, 0);	/* Get current volume */
// 3980 	if (res == FR_OK) {
// 3981 		dj.obj.fs = fs;
// 3982 		INIT_NAMBUF(fs);
// 3983 		i = len;			/* Bottom of buffer (directory stack base) */
// 3984 		if (!FF_FS_EXFAT || fs->fs_type != FS_EXFAT) {	/* (Cannot do getcwd on exFAT and returns root path) */
// 3985 			dj.obj.sclust = fs->cdir;				/* Start to follow upper directory from current directory */
// 3986 			while ((ccl = dj.obj.sclust) != 0) {	/* Repeat while current directory is a sub-directory */
// 3987 				res = dir_sdi(&dj, 1 * SZDIRE);	/* Get parent directory */
// 3988 				if (res != FR_OK) break;
// 3989 				res = move_window(fs, dj.sect);
// 3990 				if (res != FR_OK) break;
// 3991 				dj.obj.sclust = ld_clust(fs, dj.dir);	/* Goto parent directory */
// 3992 				res = dir_sdi(&dj, 0);
// 3993 				if (res != FR_OK) break;
// 3994 				do {							/* Find the entry links to the child directory */
// 3995 					res = dir_read(&dj, 0);
// 3996 					if (res != FR_OK) break;
// 3997 					if (ccl == ld_clust(fs, dj.dir)) break;	/* Found the entry */
// 3998 					res = dir_next(&dj, 0);
// 3999 				} while (res == FR_OK);
// 4000 				if (res == FR_NO_FILE) res = FR_INT_ERR;/* It cannot be 'not found'. */
// 4001 				if (res != FR_OK) break;
// 4002 				get_fileinfo(&dj, &fno);		/* Get the directory name and push it to the buffer */
// 4003 				for (n = 0; fno.fname[n]; n++) ;
// 4004 				if (i < n + 3) {
// 4005 					res = FR_NOT_ENOUGH_CORE; break;
// 4006 				}
// 4007 				while (n) buff[--i] = fno.fname[--n];
// 4008 				buff[--i] = '/';
// 4009 			}
// 4010 		}
// 4011 		tp = buff;
// 4012 		if (res == FR_OK) {
// 4013 #if FF_VOLUMES >= 2
// 4014 			*tp++ = '0' + CurrVol;			/* Put drive number */
// 4015 			*tp++ = ':';
// 4016 #endif
// 4017 			if (i == len) {					/* Root-directory */
// 4018 				*tp++ = '/';
// 4019 			} else {						/* Sub-directroy */
// 4020 				do		/* Add stacked path str */
// 4021 					*tp++ = buff[i++];
// 4022 				while (i < len);
// 4023 			}
// 4024 		}
// 4025 		*tp = 0;
// 4026 		FREE_NAMBUF();
// 4027 	}
// 4028 
// 4029 	LEAVE_FF(fs, res);
// 4030 }
// 4031 
// 4032 #endif /* FF_FS_RPATH >= 2 */
// 4033 #endif /* FF_FS_RPATH >= 1 */
// 4034 
// 4035 
// 4036 
// 4037 #if FF_FS_MINIMIZE <= 2
// 4038 /*-----------------------------------------------------------------------*/
// 4039 /* Seek File Read/Write Pointer                                          */
// 4040 /*-----------------------------------------------------------------------*/
// 4041 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock41 Using cfiCommon0
          CFI Function f_lseek
        THUMB
// 4042 FRESULT f_lseek (
// 4043 	FIL* fp,		/* Pointer to the file object */
// 4044 	FSIZE_t ofs		/* File pointer from top of file */
// 4045 )
// 4046 {
f_lseek:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        SUB      SP,SP,#+8
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
// 4047 	FRESULT res;
// 4048 	FATFS *fs;
// 4049 	DWORD clst, bcs, nsect;
// 4050 	FSIZE_t ifptr;
// 4051 #if FF_USE_FASTSEEK
// 4052 	DWORD cl, pcl, ncl, tcl, dsc, tlen, ulen, *tbl;
// 4053 #endif
// 4054 
// 4055 	res = validate(&fp->obj, &fs);		/* Check validity of the file object */
        ADD      R1,SP,#+0
        MOVS     R0,R4
          CFI FunCall validate
        BL       validate
        MOVS     R6,R0
// 4056 	if (res == FR_OK) res = (FRESULT)fp->err;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_lseek_0
        LDRB     R6,[R4, #+17]
// 4057 #if FF_FS_EXFAT && !FF_FS_READONLY
// 4058 	if (res == FR_OK && fs->fs_type == FS_EXFAT) {
// 4059 		res = fill_last_frag(&fp->obj, fp->clust, 0xFFFFFFFF);	/* Fill last fragment on the FAT if needed */
// 4060 	}
// 4061 #endif
// 4062 	if (res != FR_OK) LEAVE_FF(fs, res);
??f_lseek_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??f_lseek_1
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??f_lseek_2
// 4063 
// 4064 #if FF_USE_FASTSEEK
// 4065 	if (fp->cltbl) {	/* Fast seek */
// 4066 		if (ofs == CREATE_LINKMAP) {	/* Create CLMT */
// 4067 			tbl = fp->cltbl;
// 4068 			tlen = *tbl++; ulen = 2;	/* Given table size and required table size */
// 4069 			cl = fp->obj.sclust;		/* Origin of the chain */
// 4070 			if (cl != 0) {
// 4071 				do {
// 4072 					/* Get a fragment */
// 4073 					tcl = cl; ncl = 0; ulen += 2;	/* Top, length and used items */
// 4074 					do {
// 4075 						pcl = cl; ncl++;
// 4076 						cl = get_fat(&fp->obj, cl);
// 4077 						if (cl <= 1) ABORT(fs, FR_INT_ERR);
// 4078 						if (cl == 0xFFFFFFFF) ABORT(fs, FR_DISK_ERR);
// 4079 					} while (cl == pcl + 1);
// 4080 					if (ulen <= tlen) {		/* Store the length and top of the fragment */
// 4081 						*tbl++ = ncl; *tbl++ = tcl;
// 4082 					}
// 4083 				} while (cl < fs->n_fatent);	/* Repeat until end of chain */
// 4084 			}
// 4085 			*fp->cltbl = ulen;	/* Number of items used */
// 4086 			if (ulen <= tlen) {
// 4087 				*tbl = 0;		/* Terminate table */
// 4088 			} else {
// 4089 				res = FR_NOT_ENOUGH_CORE;	/* Given table size is smaller than required */
// 4090 			}
// 4091 		} else {						/* Fast seek */
// 4092 			if (ofs > fp->obj.objsize) ofs = fp->obj.objsize;	/* Clip offset at the file size */
// 4093 			fp->fptr = ofs;				/* Set file pointer */
// 4094 			if (ofs > 0) {
// 4095 				fp->clust = clmt_clust(fp, ofs - 1);
// 4096 				dsc = clst2sect(fs, fp->clust);
// 4097 				if (dsc == 0) ABORT(fs, FR_INT_ERR);
// 4098 				dsc += (DWORD)((ofs - 1) / SS(fs)) & (fs->csize - 1);
// 4099 				if (fp->fptr % SS(fs) && dsc != fp->sect) {	/* Refill sector cache if needed */
// 4100 #if !FF_FS_TINY
// 4101 #if !FF_FS_READONLY
// 4102 					if (fp->flag & FA_DIRTY) {		/* Write-back dirty sector cache */
// 4103 						if (disk_write(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) ABORT(fs, FR_DISK_ERR);
// 4104 						fp->flag &= (BYTE)~FA_DIRTY;
// 4105 					}
// 4106 #endif
// 4107 					if (disk_read(fs->pdrv, fp->buf, dsc, 1) != RES_OK) ABORT(fs, FR_DISK_ERR);	/* Load current sector */
// 4108 #endif
// 4109 					fp->sect = dsc;
// 4110 				}
// 4111 			}
// 4112 		}
// 4113 	} else
// 4114 #endif
// 4115 
// 4116 	/* Normal Seek */
// 4117 	{
// 4118 #if FF_FS_EXFAT
// 4119 		if (fs->fs_type != FS_EXFAT && ofs >= 0x100000000) ofs = 0xFFFFFFFF;	/* Clip at 4 GiB - 1 if at FATxx */
// 4120 #endif
// 4121 		if (ofs > fp->obj.objsize && (FF_FS_READONLY || !(fp->flag & FA_WRITE))) {	/* In read-only mode, clip offset with the file size */
??f_lseek_1:
        LDR      R0,[R4, #+12]
        CMP      R0,R5
        BCS.N    ??f_lseek_3
        LDRB     R0,[R4, #+16]
        LSLS     R0,R0,#+30
        BMI.N    ??f_lseek_3
// 4122 			ofs = fp->obj.objsize;
        LDR      R5,[R4, #+12]
// 4123 		}
// 4124 		ifptr = fp->fptr;
??f_lseek_3:
        LDR      R0,[R4, #+20]
// 4125 		fp->fptr = nsect = 0;
        MOVS     R7,#+0
        STR      R7,[R4, #+20]
// 4126 		if (ofs > 0) {
        CMP      R5,#+0
        BEQ.N    ??f_lseek_4
// 4127 			bcs = (DWORD)fs->csize * SS(fs);	/* Cluster size (byte) */
        LDR      R1,[SP, #+0]
        LDRH     R1,[R1, #+10]
        MOV      R2,#+512
        MUL      R8,R2,R1
// 4128 			if (ifptr > 0 &&
// 4129 				(ofs - 1) / bcs >= (ifptr - 1) / bcs) {	/* When seek to same or following cluster, */
        CMP      R0,#+0
        BEQ.N    ??f_lseek_5
        SUBS     R1,R0,#+1
        UDIV     R1,R1,R8
        SUBS     R2,R5,#+1
        UDIV     R2,R2,R8
        CMP      R2,R1
        BCC.N    ??f_lseek_5
// 4130 				fp->fptr = (ifptr - 1) & ~(FSIZE_t)(bcs - 1);	/* start from the current cluster */
        SUBS     R0,R0,#+1
        SUBS     R1,R8,#+1
        BICS     R0,R0,R1
        STR      R0,[R4, #+20]
// 4131 				ofs -= fp->fptr;
        LDR      R0,[R4, #+20]
        SUBS     R5,R5,R0
// 4132 				clst = fp->clust;
        LDR      R0,[R4, #+24]
        B.N      ??f_lseek_6
// 4133 			} else {									/* When seek to back cluster, */
// 4134 				clst = fp->obj.sclust;					/* start from the first cluster */
??f_lseek_5:
        LDR      R0,[R4, #+8]
// 4135 #if !FF_FS_READONLY
// 4136 				if (clst == 0) {						/* If no cluster chain, create a new chain */
        CMP      R0,#+0
        BNE.N    ??f_lseek_7
// 4137 					clst = create_chain(&fp->obj, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall create_chain
        BL       create_chain
// 4138 					if (clst == 1) ABORT(fs, FR_INT_ERR);
        CMP      R0,#+1
        BNE.N    ??f_lseek_8
        MOVS     R0,#+2
        STRB     R0,[R4, #+17]
        MOVS     R0,#+2
        B.N      ??f_lseek_2
// 4139 					if (clst == 0xFFFFFFFF) ABORT(fs, FR_DISK_ERR);
??f_lseek_8:
        CMN      R0,#+1
        BNE.N    ??f_lseek_9
        MOVS     R0,#+1
        STRB     R0,[R4, #+17]
        MOVS     R0,#+1
        B.N      ??f_lseek_2
// 4140 					fp->obj.sclust = clst;
??f_lseek_9:
        STR      R0,[R4, #+8]
// 4141 				}
// 4142 #endif
// 4143 				fp->clust = clst;
??f_lseek_7:
        STR      R0,[R4, #+24]
// 4144 			}
// 4145 			if (clst != 0) {
??f_lseek_6:
        CMP      R0,#+0
        BNE.N    ??f_lseek_10
        B.N      ??f_lseek_4
// 4146 				while (ofs > bcs) {						/* Cluster following loop */
// 4147 					ofs -= bcs; fp->fptr += bcs;
// 4148 #if !FF_FS_READONLY
// 4149 					if (fp->flag & FA_WRITE) {			/* Check if in write mode or not */
// 4150 						if (FF_FS_EXFAT && fp->fptr > fp->obj.objsize) {	/* No FAT chain object needs correct objsize to generate FAT value */
// 4151 							fp->obj.objsize = fp->fptr;
// 4152 							fp->flag |= FA_MODIFIED;
// 4153 						}
// 4154 						clst = create_chain(&fp->obj, clst);	/* Follow chain with forceed stretch */
// 4155 						if (clst == 0) {				/* Clip file size in case of disk full */
// 4156 							ofs = 0; break;
// 4157 						}
// 4158 					} else
// 4159 #endif
// 4160 					{
// 4161 						clst = get_fat(&fp->obj, clst);	/* Follow cluster chain if not in write mode */
// 4162 					}
// 4163 					if (clst == 0xFFFFFFFF) ABORT(fs, FR_DISK_ERR);
// 4164 					if (clst <= 1 || clst >= fs->n_fatent) ABORT(fs, FR_INT_ERR);
// 4165 					fp->clust = clst;
??f_lseek_11:
        STR      R0,[R4, #+24]
??f_lseek_10:
        CMP      R8,R5
        BCS.N    ??f_lseek_12
        SUBS     R5,R5,R8
        LDR      R1,[R4, #+20]
        ADDS     R1,R8,R1
        STR      R1,[R4, #+20]
        LDRB     R1,[R4, #+16]
        LSLS     R1,R1,#+30
        BPL.N    ??f_lseek_13
        MOVS     R1,R0
        MOVS     R0,R4
          CFI FunCall create_chain
        BL       create_chain
        CMP      R0,#+0
        BNE.N    ??f_lseek_14
        MOVS     R5,#+0
// 4166 				}
// 4167 				fp->fptr += ofs;
??f_lseek_12:
        LDR      R1,[R4, #+20]
        ADDS     R1,R5,R1
        STR      R1,[R4, #+20]
// 4168 				if (ofs % SS(fs)) {
        MOV      R1,#+512
        UDIV     R2,R5,R1
        MLS      R2,R2,R1,R5
        CMP      R2,#+0
        BEQ.N    ??f_lseek_4
// 4169 					nsect = clst2sect(fs, clst);	/* Current sector */
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
          CFI FunCall clst2sect
        BL       clst2sect
        MOVS     R7,R0
// 4170 					if (nsect == 0) ABORT(fs, FR_INT_ERR);
        CMP      R7,#+0
        BNE.N    ??f_lseek_15
        MOVS     R0,#+2
        STRB     R0,[R4, #+17]
        MOVS     R0,#+2
        B.N      ??f_lseek_2
??f_lseek_13:
        MOVS     R1,R0
        MOVS     R0,R4
          CFI FunCall get_fat
        BL       get_fat
??f_lseek_14:
        CMN      R0,#+1
        BNE.N    ??f_lseek_16
        MOVS     R0,#+1
        STRB     R0,[R4, #+17]
        MOVS     R0,#+1
        B.N      ??f_lseek_2
??f_lseek_16:
        CMP      R0,#+2
        BCC.N    ??f_lseek_17
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+20]
        CMP      R0,R1
        BCC.N    ??f_lseek_11
??f_lseek_17:
        MOVS     R0,#+2
        STRB     R0,[R4, #+17]
        MOVS     R0,#+2
        B.N      ??f_lseek_2
// 4171 					nsect += (DWORD)(ofs / SS(fs));
??f_lseek_15:
        ADDS     R7,R7,R5, LSR #+9
// 4172 				}
// 4173 			}
// 4174 		}
// 4175 		if (!FF_FS_READONLY && fp->fptr > fp->obj.objsize) {	/* Set file change flag if the file size is extended */
??f_lseek_4:
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+20]
        CMP      R0,R1
        BCS.N    ??f_lseek_18
// 4176 			fp->obj.objsize = fp->fptr;
        LDR      R0,[R4, #+20]
        STR      R0,[R4, #+12]
// 4177 			fp->flag |= FA_MODIFIED;
        LDRB     R0,[R4, #+16]
        ORRS     R0,R0,#0x40
        STRB     R0,[R4, #+16]
// 4178 		}
// 4179 		if (fp->fptr % SS(fs) && nsect != fp->sect) {	/* Fill sector cache if needed */
??f_lseek_18:
        LDR      R0,[R4, #+20]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BEQ.N    ??f_lseek_19
        LDR      R0,[R4, #+28]
        CMP      R7,R0
        BEQ.N    ??f_lseek_19
// 4180 #if !FF_FS_TINY
// 4181 #if !FF_FS_READONLY
// 4182 			if (fp->flag & FA_DIRTY) {			/* Write-back dirty sector cache */
        LDRB     R0,[R4, #+16]
        LSLS     R0,R0,#+24
        BPL.N    ??f_lseek_20
// 4183 				if (disk_write(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) ABORT(fs, FR_DISK_ERR);
        MOVS     R3,#+1
        LDR      R2,[R4, #+28]
        ADDS     R1,R4,#+40
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_lseek_21
        MOVS     R0,#+1
        STRB     R0,[R4, #+17]
        MOVS     R0,#+1
        B.N      ??f_lseek_2
// 4184 				fp->flag &= (BYTE)~FA_DIRTY;
??f_lseek_21:
        LDRB     R0,[R4, #+16]
        ANDS     R0,R0,#0x7F
        STRB     R0,[R4, #+16]
// 4185 			}
// 4186 #endif
// 4187 			if (disk_read(fs->pdrv, fp->buf, nsect, 1) != RES_OK) ABORT(fs, FR_DISK_ERR);	/* Fill sector cache */
??f_lseek_20:
        MOVS     R3,#+1
        MOVS     R2,R7
        ADDS     R1,R4,#+40
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??f_lseek_22
        MOVS     R0,#+1
        STRB     R0,[R4, #+17]
        MOVS     R0,#+1
        B.N      ??f_lseek_2
// 4188 #endif
// 4189 			fp->sect = nsect;
??f_lseek_22:
        STR      R7,[R4, #+28]
// 4190 		}
// 4191 	}
// 4192 
// 4193 	LEAVE_FF(fs, res);
??f_lseek_19:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??f_lseek_2:
        POP      {R1,R2,R4-R8,PC}  ;; return
          CFI EndBlock cfiBlock41
// 4194 }
// 4195 
// 4196 
// 4197 
// 4198 #if FF_FS_MINIMIZE <= 1
// 4199 /*-----------------------------------------------------------------------*/
// 4200 /* Create a Directory Object                                             */
// 4201 /*-----------------------------------------------------------------------*/
// 4202 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock42 Using cfiCommon0
          CFI Function f_opendir
        THUMB
// 4203 FRESULT f_opendir (
// 4204 	DIR* dp,			/* Pointer to directory object to create */
// 4205 	const TCHAR* path	/* Pointer to the directory path */
// 4206 )
// 4207 {
f_opendir:
        PUSH     {R1,R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        SUB      SP,SP,#+8
          CFI CFA R13+24
        MOVS     R4,R0
// 4208 	FRESULT res;
// 4209 	FATFS *fs;
// 4210 	DEF_NAMBUF
// 4211 
// 4212 
// 4213 	if (!dp) return FR_INVALID_OBJECT;
        CMP      R4,#+0
        BNE.N    ??f_opendir_0
        MOVS     R0,#+9
        B.N      ??f_opendir_1
// 4214 
// 4215 	/* Get logical drive */
// 4216 	res = find_volume(&path, &fs, 0);
??f_opendir_0:
        MOVS     R2,#+0
        ADD      R1,SP,#+0
        ADD      R0,SP,#+8
          CFI FunCall find_volume
        BL       find_volume
        MOVS     R5,R0
// 4217 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_opendir_2
// 4218 		dp->obj.fs = fs;
        LDR      R0,[SP, #+0]
        STR      R0,[R4, #+0]
// 4219 		INIT_NAMBUF(fs);
// 4220 		res = follow_path(dp, path);			/* Follow the path to the directory */
        LDR      R1,[SP, #+8]
        MOVS     R0,R4
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 4221 		if (res == FR_OK) {						/* Follow completed */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_opendir_3
// 4222 			if (!(dp->fn[NSFLAG] & NS_NONAME)) {	/* It is not the origin directory itself */
        LDRB     R0,[R4, #+43]
        LSLS     R0,R0,#+24
        BMI.N    ??f_opendir_4
// 4223 				if (dp->obj.attr & AM_DIR) {		/* This object is a sub-directory */
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+27
        BPL.N    ??f_opendir_5
// 4224 #if FF_FS_EXFAT
// 4225 					if (fs->fs_type == FS_EXFAT) {
// 4226 						dp->obj.c_scl = dp->obj.sclust;							/* Get containing directory inforamation */
// 4227 						dp->obj.c_size = ((DWORD)dp->obj.objsize & 0xFFFFFF00) | dp->obj.stat;
// 4228 						dp->obj.c_ofs = dp->blk_ofs;
// 4229 						dp->obj.sclust = ld_dword(fs->dirbuf + XDIR_FstClus);	/* Get object allocation info */
// 4230 						dp->obj.objsize = ld_qword(fs->dirbuf + XDIR_FileSize);
// 4231 						dp->obj.stat = fs->dirbuf[XDIR_GenFlags] & 2;
// 4232 					} else
// 4233 #endif
// 4234 					{
// 4235 						dp->obj.sclust = ld_clust(fs, dp->dir);	/* Get object allocation info */
        LDR      R1,[R4, #+28]
        LDR      R0,[SP, #+0]
          CFI FunCall ld_clust
        BL       ld_clust
        STR      R0,[R4, #+8]
        B.N      ??f_opendir_4
// 4236 					}
// 4237 				} else {						/* This object is a file */
// 4238 					res = FR_NO_PATH;
??f_opendir_5:
        MOVS     R5,#+5
// 4239 				}
// 4240 			}
// 4241 			if (res == FR_OK) {
??f_opendir_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_opendir_3
// 4242 				dp->obj.id = fs->id;
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+6]
        STRH     R0,[R4, #+4]
// 4243 				res = dir_sdi(dp, 0);			/* Rewind directory */
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
        MOVS     R5,R0
// 4244 #if FF_FS_LOCK != 0
// 4245 				if (res == FR_OK) {
// 4246 					if (dp->obj.sclust != 0) {
// 4247 						dp->obj.lockid = inc_lock(dp, 0);	/* Lock the sub directory */
// 4248 						if (!dp->obj.lockid) res = FR_TOO_MANY_OPEN_FILES;
// 4249 					} else {
// 4250 						dp->obj.lockid = 0;	/* Root directory need not to be locked */
// 4251 					}
// 4252 				}
// 4253 #endif
// 4254 			}
// 4255 		}
// 4256 		FREE_NAMBUF();
// 4257 		if (res == FR_NO_FILE) res = FR_NO_PATH;
??f_opendir_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BNE.N    ??f_opendir_2
        MOVS     R5,#+5
// 4258 	}
// 4259 	if (res != FR_OK) dp->obj.fs = 0;		/* Invalidate the directory object if function faild */
??f_opendir_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??f_opendir_6
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
// 4260 
// 4261 	LEAVE_FF(fs, res);
??f_opendir_6:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??f_opendir_1:
        POP      {R1-R5,PC}       ;; return
          CFI EndBlock cfiBlock42
// 4262 }
// 4263 
// 4264 
// 4265 
// 4266 
// 4267 /*-----------------------------------------------------------------------*/
// 4268 /* Close Directory                                                       */
// 4269 /*-----------------------------------------------------------------------*/
// 4270 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock43 Using cfiCommon0
          CFI Function f_closedir
        THUMB
// 4271 FRESULT f_closedir (
// 4272 	DIR *dp		/* Pointer to the directory object to be closed */
// 4273 )
// 4274 {
f_closedir:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
// 4275 	FRESULT res;
// 4276 	FATFS *fs;
// 4277 
// 4278 
// 4279 	res = validate(&dp->obj, &fs);	/* Check validity of the file object */
        ADD      R1,SP,#+0
        MOVS     R0,R4
          CFI FunCall validate
        BL       validate
// 4280 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_closedir_0
// 4281 #if FF_FS_LOCK != 0
// 4282 		if (dp->obj.lockid) res = dec_lock(dp->obj.lockid);	/* Decrement sub-directory open counter */
// 4283 		if (res == FR_OK) dp->obj.fs = 0;	/* Invalidate directory object */
// 4284 #else
// 4285 		dp->obj.fs = 0;	/* Invalidate directory object */
        MOVS     R1,#+0
        STR      R1,[R4, #+0]
// 4286 #endif
// 4287 #if FF_FS_REENTRANT
// 4288 		unlock_fs(fs, FR_OK);		/* Unlock volume */
// 4289 #endif
// 4290 	}
// 4291 	return res;
??f_closedir_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4,PC}    ;; return
          CFI EndBlock cfiBlock43
// 4292 }
// 4293 
// 4294 
// 4295 
// 4296 
// 4297 /*-----------------------------------------------------------------------*/
// 4298 /* Read Directory Entries in Sequence                                    */
// 4299 /*-----------------------------------------------------------------------*/
// 4300 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock44 Using cfiCommon0
          CFI Function f_readdir
        THUMB
// 4301 FRESULT f_readdir (
// 4302 	DIR* dp,			/* Pointer to the open directory object */
// 4303 	FILINFO* fno		/* Pointer to file information to return */
// 4304 )
// 4305 {
f_readdir:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
// 4306 	FRESULT res;
// 4307 	FATFS *fs;
// 4308 	DEF_NAMBUF
// 4309 
// 4310 
// 4311 	res = validate(&dp->obj, &fs);	/* Check validity of the directory object */
        ADD      R1,SP,#+0
        MOVS     R0,R4
          CFI FunCall validate
        BL       validate
// 4312 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_readdir_0
// 4313 		if (!fno) {
        CMP      R5,#+0
        BNE.N    ??f_readdir_1
// 4314 			res = dir_sdi(dp, 0);			/* Rewind the directory object */
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
        B.N      ??f_readdir_0
// 4315 		} else {
// 4316 			INIT_NAMBUF(fs);
// 4317 			res = dir_read(dp, 0);			/* Read an item */
??f_readdir_1:
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_read
        BL       dir_read
// 4318 			if (res == FR_NO_FILE) res = FR_OK;	/* Ignore end of directory */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??f_readdir_2
        MOVS     R0,#+0
// 4319 			if (res == FR_OK) {				/* A valid entry is found */
??f_readdir_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_readdir_0
// 4320 				get_fileinfo(dp, fno);		/* Get the object information */
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall get_fileinfo
        BL       get_fileinfo
// 4321 				res = dir_next(dp, 0);		/* Increment index for next */
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_next
        BL       dir_next
// 4322 				if (res == FR_NO_FILE) res = FR_OK;	/* Ignore end of directory now */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??f_readdir_0
        MOVS     R0,#+0
// 4323 			}
// 4324 			FREE_NAMBUF();
// 4325 		}
// 4326 	}
// 4327 	LEAVE_FF(fs, res);
??f_readdir_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock44
// 4328 }
// 4329 
// 4330 
// 4331 
// 4332 #if FF_USE_FIND
// 4333 /*-----------------------------------------------------------------------*/
// 4334 /* Find Next File                                                        */
// 4335 /*-----------------------------------------------------------------------*/
// 4336 
// 4337 FRESULT f_findnext (
// 4338 	DIR* dp,		/* Pointer to the open directory object */
// 4339 	FILINFO* fno	/* Pointer to the file information structure */
// 4340 )
// 4341 {
// 4342 	FRESULT res;
// 4343 
// 4344 
// 4345 	for (;;) {
// 4346 		res = f_readdir(dp, fno);		/* Get a directory item */
// 4347 		if (res != FR_OK || !fno || !fno->fname[0]) break;	/* Terminate if any error or end of directory */
// 4348 		if (pattern_matching(dp->pat, fno->fname, 0, 0)) break;		/* Test for the file name */
// 4349 #if FF_USE_LFN && FF_USE_FIND == 2
// 4350 		if (pattern_matching(dp->pat, fno->altname, 0, 0)) break;	/* Test for alternative name if exist */
// 4351 #endif
// 4352 	}
// 4353 	return res;
// 4354 }
// 4355 
// 4356 
// 4357 
// 4358 /*-----------------------------------------------------------------------*/
// 4359 /* Find First File                                                       */
// 4360 /*-----------------------------------------------------------------------*/
// 4361 
// 4362 FRESULT f_findfirst (
// 4363 	DIR* dp,				/* Pointer to the blank directory object */
// 4364 	FILINFO* fno,			/* Pointer to the file information structure */
// 4365 	const TCHAR* path,		/* Pointer to the directory to open */
// 4366 	const TCHAR* pattern	/* Pointer to the matching pattern */
// 4367 )
// 4368 {
// 4369 	FRESULT res;
// 4370 
// 4371 
// 4372 	dp->pat = pattern;		/* Save pointer to pattern string */
// 4373 	res = f_opendir(dp, path);		/* Open the target directory */
// 4374 	if (res == FR_OK) {
// 4375 		res = f_findnext(dp, fno);	/* Find the first item */
// 4376 	}
// 4377 	return res;
// 4378 }
// 4379 
// 4380 #endif	/* FF_USE_FIND */
// 4381 
// 4382 
// 4383 
// 4384 #if FF_FS_MINIMIZE == 0
// 4385 /*-----------------------------------------------------------------------*/
// 4386 /* Get File Status                                                       */
// 4387 /*-----------------------------------------------------------------------*/
// 4388 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock45 Using cfiCommon0
          CFI Function f_stat
        THUMB
// 4389 FRESULT f_stat (
// 4390 	const TCHAR* path,	/* Pointer to the file path */
// 4391 	FILINFO* fno		/* Pointer to file information to return */
// 4392 )
// 4393 {
f_stat:
        PUSH     {R0,R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        SUB      SP,SP,#+48
          CFI CFA R13+64
        MOVS     R4,R1
// 4394 	FRESULT res;
// 4395 	DIR dj;
// 4396 	DEF_NAMBUF
// 4397 
// 4398 
// 4399 	/* Get logical drive */
// 4400 	res = find_volume(&path, &dj.obj.fs, 0);
        MOVS     R2,#+0
        ADD      R1,SP,#+0
        ADD      R0,SP,#+48
          CFI FunCall find_volume
        BL       find_volume
        MOVS     R5,R0
// 4401 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_stat_0
// 4402 		INIT_NAMBUF(dj.obj.fs);
// 4403 		res = follow_path(&dj, path);	/* Follow the file path */
        LDR      R1,[SP, #+48]
        ADD      R0,SP,#+0
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 4404 		if (res == FR_OK) {				/* Follow completed */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_stat_0
// 4405 			if (dj.fn[NSFLAG] & NS_NONAME) {	/* It is origin directory */
        LDRB     R0,[SP, #+43]
        LSLS     R0,R0,#+24
        BPL.N    ??f_stat_1
// 4406 				res = FR_INVALID_NAME;
        MOVS     R5,#+6
        B.N      ??f_stat_0
// 4407 			} else {							/* Found an object */
// 4408 				if (fno) get_fileinfo(&dj, fno);
??f_stat_1:
        CMP      R4,#+0
        BEQ.N    ??f_stat_0
        MOVS     R1,R4
        ADD      R0,SP,#+0
          CFI FunCall get_fileinfo
        BL       get_fileinfo
// 4409 			}
// 4410 		}
// 4411 		FREE_NAMBUF();
// 4412 	}
// 4413 
// 4414 	LEAVE_FF(dj.obj.fs, res);
??f_stat_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+52
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock45
// 4415 }
// 4416 
// 4417 
// 4418 
// 4419 #if !FF_FS_READONLY
// 4420 /*-----------------------------------------------------------------------*/
// 4421 /* Get Number of Free Clusters                                           */
// 4422 /*-----------------------------------------------------------------------*/
// 4423 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock46 Using cfiCommon0
          CFI Function f_getfree
        THUMB
// 4424 FRESULT f_getfree (
// 4425 	const TCHAR* path,	/* Path name of the logical drive number */
// 4426 	DWORD* nclst,		/* Pointer to a variable to return number of free clusters */
// 4427 	FATFS** fatfs		/* Pointer to return pointer to corresponding filesystem object */
// 4428 )
// 4429 {
f_getfree:
        PUSH     {R0,R4-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        SUB      SP,SP,#+24
          CFI CFA R13+56
        MOVS     R4,R1
        MOVS     R6,R2
// 4430 	FRESULT res;
// 4431 	FATFS *fs;
// 4432 	DWORD nfree, clst, sect, stat;
// 4433 	UINT i;
// 4434 	FFOBJID obj;
// 4435 
// 4436 
// 4437 	/* Get logical drive */
// 4438 	res = find_volume(&path, &fs, 0);
        MOVS     R2,#+0
        ADD      R1,SP,#+0
        ADD      R0,SP,#+24
          CFI FunCall find_volume
        BL       find_volume
        MOVS     R5,R0
// 4439 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_getfree_0
// 4440 		*fatfs = fs;				/* Return ptr to the fs object */
        LDR      R0,[SP, #+0]
        STR      R0,[R6, #+0]
// 4441 		/* If free_clst is valid, return it without full FAT scan */
// 4442 		if (fs->free_clst <= fs->n_fatent - 2) {
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+20]
        SUBS     R0,R0,#+2
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+16]
        CMP      R0,R1
        BCC.N    ??f_getfree_1
// 4443 			*nclst = fs->free_clst;
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+16]
        STR      R0,[R4, #+0]
        B.N      ??f_getfree_0
// 4444 		} else {
// 4445 			/* Scan FAT to obtain number of free clusters */
// 4446 			nfree = 0;
??f_getfree_1:
        MOVS     R6,#+0
// 4447 			if (fs->fs_type == FS_FAT12) {	/* FAT12: Scan bit field FAT entries */
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??f_getfree_2
// 4448 				clst = 2; obj.fs = fs;
        MOVS     R7,#+2
        LDR      R0,[SP, #+0]
        STR      R0,[SP, #+4]
// 4449 				do {
// 4450 					stat = get_fat(&obj, clst);
??f_getfree_3:
        MOVS     R1,R7
        ADD      R0,SP,#+4
          CFI FunCall get_fat
        BL       get_fat
// 4451 					if (stat == 0xFFFFFFFF) { res = FR_DISK_ERR; break; }
        CMN      R0,#+1
        BNE.N    ??f_getfree_4
        MOVS     R5,#+1
        B.N      ??f_getfree_5
// 4452 					if (stat == 1) { res = FR_INT_ERR; break; }
??f_getfree_4:
        CMP      R0,#+1
        BNE.N    ??f_getfree_6
        MOVS     R5,#+2
        B.N      ??f_getfree_5
// 4453 					if (stat == 0) nfree++;
??f_getfree_6:
        CMP      R0,#+0
        BNE.N    ??f_getfree_7
        ADDS     R6,R6,#+1
// 4454 				} while (++clst < fs->n_fatent);
??f_getfree_7:
        ADDS     R7,R7,#+1
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+20]
        CMP      R7,R0
        BCC.N    ??f_getfree_3
        B.N      ??f_getfree_5
// 4455 			} else {
// 4456 #if FF_FS_EXFAT
// 4457 				if (fs->fs_type == FS_EXFAT) {	/* exFAT: Scan allocation bitmap */
// 4458 					BYTE bm;
// 4459 					UINT b;
// 4460 
// 4461 					clst = fs->n_fatent - 2;	/* Number of clusters */
// 4462 					sect = fs->database;		/* Assuming bitmap starts at cluster 2 */
// 4463 					i = 0;						/* Offset in the sector */
// 4464 					do {	/* Counts numbuer of bits with zero in the bitmap */
// 4465 						if (i == 0) {
// 4466 							res = move_window(fs, sect++);
// 4467 							if (res != FR_OK) break;
// 4468 						}
// 4469 						for (b = 8, bm = fs->win[i]; b && clst; b--, clst--) {
// 4470 							if (!(bm & 1)) nfree++;
// 4471 							bm >>= 1;
// 4472 						}
// 4473 						i = (i + 1) % SS(fs);
// 4474 					} while (clst);
// 4475 				} else
// 4476 #endif
// 4477 				{	/* FAT16/32: Scan WORD/DWORD FAT entries */
// 4478 					clst = fs->n_fatent;	/* Number of entries */
??f_getfree_2:
        LDR      R0,[SP, #+0]
        LDR      R7,[R0, #+20]
// 4479 					sect = fs->fatbase;		/* Top of the FAT */
        LDR      R0,[SP, #+0]
        LDR      R8,[R0, #+32]
// 4480 					i = 0;					/* Offset in the sector */
        MOVS     R9,#+0
// 4481 					do {	/* Counts numbuer of entries with zero in the FAT */
// 4482 						if (i == 0) {
??f_getfree_8:
        CMP      R9,#+0
        BNE.N    ??f_getfree_9
// 4483 							res = move_window(fs, sect++);
        MOV      R1,R8
        LDR      R0,[SP, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
        ADDS     R8,R8,#+1
// 4484 							if (res != FR_OK) break;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_getfree_5
// 4485 						}
// 4486 						if (fs->fs_type == FS_FAT16) {
??f_getfree_9:
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??f_getfree_10
// 4487 							if (ld_word(fs->win + i) == 0) nfree++;
        LDR      R0,[SP, #+0]
        ADDS     R0,R9,R0
        ADDS     R0,R0,#+48
          CFI FunCall ld_word
        BL       ld_word
        CMP      R0,#+0
        BNE.N    ??f_getfree_11
        ADDS     R6,R6,#+1
// 4488 							i += 2;
??f_getfree_11:
        ADDS     R9,R9,#+2
        B.N      ??f_getfree_12
// 4489 						} else {
// 4490 							if ((ld_dword(fs->win + i) & 0x0FFFFFFF) == 0) nfree++;
??f_getfree_10:
        LDR      R0,[SP, #+0]
        ADDS     R0,R9,R0
        ADDS     R0,R0,#+48
          CFI FunCall ld_dword
        BL       ld_dword
        LSLS     R0,R0,#+4
        BNE.N    ??f_getfree_13
        ADDS     R6,R6,#+1
// 4491 							i += 4;
??f_getfree_13:
        ADDS     R9,R9,#+4
// 4492 						}
// 4493 						i %= SS(fs);
??f_getfree_12:
        MOV      R1,#+512
        MOV      R0,R9
        UDIV     R9,R0,R1
        MLS      R9,R9,R1,R0
// 4494 					} while (--clst);
        SUBS     R7,R7,#+1
        CMP      R7,#+0
        BNE.N    ??f_getfree_8
// 4495 				}
// 4496 			}
// 4497 			*nclst = nfree;			/* Return the free clusters */
??f_getfree_5:
        STR      R6,[R4, #+0]
// 4498 			fs->free_clst = nfree;	/* Now free_clst is valid */
        LDR      R0,[SP, #+0]
        STR      R6,[R0, #+16]
// 4499 			fs->fsi_flag |= 1;		/* FAT32: FSInfo is to be updated */
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+4]
        ORRS     R0,R0,#0x1
        LDR      R1,[SP, #+0]
        STRB     R0,[R1, #+4]
// 4500 		}
// 4501 	}
// 4502 
// 4503 	LEAVE_FF(fs, res);
??f_getfree_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+28
          CFI CFA R13+28
        POP      {R4-R9,PC}       ;; return
          CFI EndBlock cfiBlock46
// 4504 }
// 4505 
// 4506 
// 4507 
// 4508 
// 4509 /*-----------------------------------------------------------------------*/
// 4510 /* Truncate File                                                         */
// 4511 /*-----------------------------------------------------------------------*/
// 4512 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock47 Using cfiCommon0
          CFI Function f_truncate
        THUMB
// 4513 FRESULT f_truncate (
// 4514 	FIL* fp		/* Pointer to the file object */
// 4515 )
// 4516 {
f_truncate:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
// 4517 	FRESULT res;
// 4518 	FATFS *fs;
// 4519 	DWORD ncl;
// 4520 
// 4521 
// 4522 	res = validate(&fp->obj, &fs);	/* Check validity of the file object */
        ADD      R1,SP,#+0
        MOVS     R0,R4
          CFI FunCall validate
        BL       validate
        MOVS     R5,R0
// 4523 	if (res != FR_OK || (res = (FRESULT)fp->err) != FR_OK) LEAVE_FF(fs, res);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_truncate_0
        LDRB     R5,[R4, #+17]
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??f_truncate_1
??f_truncate_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??f_truncate_2
// 4524 	if (!(fp->flag & FA_WRITE)) LEAVE_FF(fs, FR_DENIED);	/* Check access mode */
??f_truncate_1:
        LDRB     R0,[R4, #+16]
        LSLS     R0,R0,#+30
        BMI.N    ??f_truncate_3
        MOVS     R0,#+7
        B.N      ??f_truncate_2
// 4525 
// 4526 	if (fp->fptr < fp->obj.objsize) {	/* Process when fptr is not on the eof */
??f_truncate_3:
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+12]
        CMP      R0,R1
        BCS.N    ??f_truncate_4
// 4527 		if (fp->fptr == 0) {	/* When set file size to zero, remove entire cluster chain */
        LDR      R0,[R4, #+20]
        CMP      R0,#+0
        BNE.N    ??f_truncate_5
// 4528 			res = remove_chain(&fp->obj, fp->obj.sclust, 0);
        MOVS     R2,#+0
        LDR      R1,[R4, #+8]
        MOVS     R0,R4
          CFI FunCall remove_chain
        BL       remove_chain
        MOVS     R5,R0
// 4529 			fp->obj.sclust = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
        B.N      ??f_truncate_6
// 4530 		} else {				/* When truncate a part of the file, remove remaining clusters */
// 4531 			ncl = get_fat(&fp->obj, fp->clust);
??f_truncate_5:
        LDR      R1,[R4, #+24]
        MOVS     R0,R4
          CFI FunCall get_fat
        BL       get_fat
// 4532 			res = FR_OK;
        MOVS     R5,#+0
// 4533 			if (ncl == 0xFFFFFFFF) res = FR_DISK_ERR;
        CMN      R0,#+1
        BNE.N    ??f_truncate_7
        MOVS     R5,#+1
// 4534 			if (ncl == 1) res = FR_INT_ERR;
??f_truncate_7:
        CMP      R0,#+1
        BNE.N    ??f_truncate_8
        MOVS     R5,#+2
// 4535 			if (res == FR_OK && ncl < fs->n_fatent) {
??f_truncate_8:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_truncate_6
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+20]
        CMP      R0,R1
        BCS.N    ??f_truncate_6
// 4536 				res = remove_chain(&fp->obj, ncl, fp->clust);
        LDR      R2,[R4, #+24]
        MOVS     R1,R0
        MOVS     R0,R4
          CFI FunCall remove_chain
        BL       remove_chain
        MOVS     R5,R0
// 4537 			}
// 4538 		}
// 4539 		fp->obj.objsize = fp->fptr;	/* Set file size to current read/write point */
??f_truncate_6:
        LDR      R0,[R4, #+20]
        STR      R0,[R4, #+12]
// 4540 		fp->flag |= FA_MODIFIED;
        LDRB     R0,[R4, #+16]
        ORRS     R0,R0,#0x40
        STRB     R0,[R4, #+16]
// 4541 #if !FF_FS_TINY
// 4542 		if (res == FR_OK && (fp->flag & FA_DIRTY)) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_truncate_9
        LDRB     R0,[R4, #+16]
        LSLS     R0,R0,#+24
        BPL.N    ??f_truncate_9
// 4543 			if (disk_write(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) {
        MOVS     R3,#+1
        LDR      R2,[R4, #+28]
        ADDS     R1,R4,#+40
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_truncate_10
// 4544 				res = FR_DISK_ERR;
        MOVS     R5,#+1
        B.N      ??f_truncate_9
// 4545 			} else {
// 4546 				fp->flag &= (BYTE)~FA_DIRTY;
??f_truncate_10:
        LDRB     R0,[R4, #+16]
        ANDS     R0,R0,#0x7F
        STRB     R0,[R4, #+16]
// 4547 			}
// 4548 		}
// 4549 #endif
// 4550 		if (res != FR_OK) ABORT(fs, res);
??f_truncate_9:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??f_truncate_4
        STRB     R5,[R4, #+17]
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??f_truncate_2
// 4551 	}
// 4552 
// 4553 	LEAVE_FF(fs, res);
??f_truncate_4:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??f_truncate_2:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock47
// 4554 }
// 4555 
// 4556 
// 4557 
// 4558 
// 4559 /*-----------------------------------------------------------------------*/
// 4560 /* Delete a File/Directory                                               */
// 4561 /*-----------------------------------------------------------------------*/
// 4562 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock48 Using cfiCommon0
          CFI Function f_unlink
        THUMB
// 4563 FRESULT f_unlink (
// 4564 	const TCHAR* path		/* Pointer to the file or directory path */
// 4565 )
// 4566 {
f_unlink:
        PUSH     {R0,R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        SUB      SP,SP,#+96
          CFI CFA R13+112
// 4567 	FRESULT res;
// 4568 	DIR dj, sdj;
// 4569 	DWORD dclst = 0;
        MOVS     R4,#+0
// 4570 	FATFS *fs;
// 4571 #if FF_FS_EXFAT
// 4572 	FFOBJID obj;
// 4573 #endif
// 4574 	DEF_NAMBUF
// 4575 
// 4576 
// 4577 	/* Get logical drive */
// 4578 	res = find_volume(&path, &fs, FA_WRITE);
        MOVS     R2,#+2
        ADD      R1,SP,#+0
        ADD      R0,SP,#+96
          CFI FunCall find_volume
        BL       find_volume
        MOVS     R5,R0
// 4579 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_unlink_0
// 4580 		dj.obj.fs = fs;
        LDR      R0,[SP, #+0]
        STR      R0,[SP, #+4]
// 4581 		INIT_NAMBUF(fs);
// 4582 		res = follow_path(&dj, path);		/* Follow the file path */
        LDR      R1,[SP, #+96]
        ADD      R0,SP,#+4
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 4583 		if (FF_FS_RPATH && res == FR_OK && (dj.fn[NSFLAG] & NS_DOT)) {
// 4584 			res = FR_INVALID_NAME;			/* Cannot remove dot entry */
// 4585 		}
// 4586 #if FF_FS_LOCK != 0
// 4587 		if (res == FR_OK) res = chk_lock(&dj, 2);	/* Check if it is an open object */
// 4588 #endif
// 4589 		if (res == FR_OK) {					/* The object is accessible */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_unlink_0
// 4590 			if (dj.fn[NSFLAG] & NS_NONAME) {
        LDRB     R0,[SP, #+47]
        LSLS     R0,R0,#+24
        BPL.N    ??f_unlink_1
// 4591 				res = FR_INVALID_NAME;		/* Cannot remove the origin directory */
        MOVS     R5,#+6
        B.N      ??f_unlink_2
// 4592 			} else {
// 4593 				if (dj.obj.attr & AM_RDO) {
??f_unlink_1:
        LDRB     R0,[SP, #+10]
        LSLS     R0,R0,#+31
        BPL.N    ??f_unlink_2
// 4594 					res = FR_DENIED;		/* Cannot remove R/O object */
        MOVS     R5,#+7
// 4595 				}
// 4596 			}
// 4597 			if (res == FR_OK) {
??f_unlink_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_unlink_3
// 4598 #if FF_FS_EXFAT
// 4599 				obj.fs = fs;
// 4600 				if (fs->fs_type == FS_EXFAT) {
// 4601 					obj.sclust = dclst = ld_dword(fs->dirbuf + XDIR_FstClus);
// 4602 					obj.objsize = ld_qword(fs->dirbuf + XDIR_FileSize);
// 4603 					obj.stat = fs->dirbuf[XDIR_GenFlags] & 2;
// 4604 				} else
// 4605 #endif
// 4606 				{
// 4607 					dclst = ld_clust(fs, dj.dir);
        LDR      R1,[SP, #+32]
        LDR      R0,[SP, #+0]
          CFI FunCall ld_clust
        BL       ld_clust
        MOVS     R4,R0
// 4608 				}
// 4609 				if (dj.obj.attr & AM_DIR) {			/* Is it a sub-directory? */
        LDRB     R0,[SP, #+10]
        LSLS     R0,R0,#+27
        BPL.N    ??f_unlink_3
// 4610 #if FF_FS_RPATH != 0
// 4611 					if (dclst == fs->cdir) {		 	/* Is it the current directory? */
// 4612 						res = FR_DENIED;
// 4613 					} else
// 4614 #endif
// 4615 					{
// 4616 						sdj.obj.fs = fs;				/* Open the sub-directory */
        LDR      R0,[SP, #+0]
        STR      R0,[SP, #+48]
// 4617 						sdj.obj.sclust = dclst;
        STR      R4,[SP, #+56]
// 4618 #if FF_FS_EXFAT
// 4619 						if (fs->fs_type == FS_EXFAT) {
// 4620 							sdj.obj.objsize = obj.objsize;
// 4621 							sdj.obj.stat = obj.stat;
// 4622 						}
// 4623 #endif
// 4624 						res = dir_sdi(&sdj, 0);
        MOVS     R1,#+0
        ADD      R0,SP,#+48
          CFI FunCall dir_sdi
        BL       dir_sdi
        MOVS     R5,R0
// 4625 						if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_unlink_3
// 4626 							res = dir_read(&sdj, 0);			/* Read an item */
        MOVS     R1,#+0
        ADD      R0,SP,#+48
          CFI FunCall dir_read
        BL       dir_read
        MOVS     R5,R0
// 4627 							if (res == FR_OK) res = FR_DENIED;	/* Not empty? */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_unlink_4
        MOVS     R5,#+7
// 4628 							if (res == FR_NO_FILE) res = FR_OK;	/* Empty? */
??f_unlink_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BNE.N    ??f_unlink_3
        MOVS     R5,#+0
// 4629 						}
// 4630 					}
// 4631 				}
// 4632 			}
// 4633 			if (res == FR_OK) {
??f_unlink_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_unlink_0
// 4634 				res = dir_remove(&dj);			/* Remove the directory entry */
        ADD      R0,SP,#+4
          CFI FunCall dir_remove
        BL       dir_remove
        MOVS     R5,R0
// 4635 				if (res == FR_OK && dclst) {	/* Remove the cluster chain if exist */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_unlink_5
        CMP      R4,#+0
        BEQ.N    ??f_unlink_5
// 4636 #if FF_FS_EXFAT
// 4637 					res = remove_chain(&obj, dclst, 0);
// 4638 #else
// 4639 					res = remove_chain(&dj.obj, dclst, 0);
        MOVS     R2,#+0
        MOVS     R1,R4
        ADD      R0,SP,#+4
          CFI FunCall remove_chain
        BL       remove_chain
        MOVS     R5,R0
// 4640 #endif
// 4641 				}
// 4642 				if (res == FR_OK) res = sync_fs(fs);
??f_unlink_5:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_unlink_0
        LDR      R0,[SP, #+0]
          CFI FunCall sync_fs
        BL       sync_fs
        MOVS     R5,R0
// 4643 			}
// 4644 		}
// 4645 		FREE_NAMBUF();
// 4646 	}
// 4647 
// 4648 	LEAVE_FF(fs, res);
??f_unlink_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+100
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock48
// 4649 }
// 4650 
// 4651 
// 4652 
// 4653 
// 4654 /*-----------------------------------------------------------------------*/
// 4655 /* Create a Directory                                                    */
// 4656 /*-----------------------------------------------------------------------*/
// 4657 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock49 Using cfiCommon0
          CFI Function f_mkdir
        THUMB
// 4658 FRESULT f_mkdir (
// 4659 	const TCHAR* path		/* Pointer to the directory path */
// 4660 )
// 4661 {
f_mkdir:
        PUSH     {R0,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        SUB      SP,SP,#+48
          CFI CFA R13+72
// 4662 	FRESULT res;
// 4663 	DIR dj;
// 4664 	FATFS *fs;
// 4665 	BYTE *dir;
// 4666 	DWORD dcl, pcl, tm;
// 4667 	DEF_NAMBUF
// 4668 
// 4669 
// 4670 	/* Get logical drive */
// 4671 	res = find_volume(&path, &fs, FA_WRITE);
        MOVS     R2,#+2
        ADD      R1,SP,#+0
        ADD      R0,SP,#+48
          CFI FunCall find_volume
        BL       find_volume
        MOVS     R6,R0
// 4672 	if (res == FR_OK) {
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.W    ??f_mkdir_0
// 4673 		dj.obj.fs = fs;
        LDR      R0,[SP, #+0]
        STR      R0,[SP, #+4]
// 4674 		INIT_NAMBUF(fs);
// 4675 		res = follow_path(&dj, path);			/* Follow the file path */
        LDR      R1,[SP, #+48]
        ADD      R0,SP,#+4
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R6,R0
// 4676 		if (res == FR_OK) res = FR_EXIST;		/* Any object with same name is already existing */
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_mkdir_1
        MOVS     R6,#+8
// 4677 		if (FF_FS_RPATH && res == FR_NO_FILE && (dj.fn[NSFLAG] & NS_DOT)) {
// 4678 			res = FR_INVALID_NAME;
// 4679 		}
// 4680 		if (res == FR_NO_FILE) {				/* Can create a new directory */
??f_mkdir_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BNE.N    ??f_mkdir_0
// 4681 			dcl = create_chain(&dj.obj, 0);		/* Allocate a cluster for the new directory table */
        MOVS     R1,#+0
        ADD      R0,SP,#+4
          CFI FunCall create_chain
        BL       create_chain
        MOVS     R4,R0
// 4682 			dj.obj.objsize = (DWORD)fs->csize * SS(fs);
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+10]
        MOV      R1,#+512
        MULS     R0,R1,R0
        STR      R0,[SP, #+16]
// 4683 			res = FR_OK;
        MOVS     R6,#+0
// 4684 			if (dcl == 0) res = FR_DENIED;		/* No space to allocate a new cluster */
        CMP      R4,#+0
        BNE.N    ??f_mkdir_2
        MOVS     R6,#+7
// 4685 			if (dcl == 1) res = FR_INT_ERR;
??f_mkdir_2:
        CMP      R4,#+1
        BNE.N    ??f_mkdir_3
        MOVS     R6,#+2
// 4686 			if (dcl == 0xFFFFFFFF) res = FR_DISK_ERR;
??f_mkdir_3:
        CMN      R4,#+1
        BNE.N    ??f_mkdir_4
        MOVS     R6,#+1
// 4687 			if (res == FR_OK) res = sync_window(fs);	/* Flush FAT */
??f_mkdir_4:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_mkdir_5
        LDR      R0,[SP, #+0]
          CFI FunCall sync_window
        BL       sync_window
        MOVS     R6,R0
// 4688 			tm = GET_FATTIME();
??f_mkdir_5:
          CFI FunCall get_fattime
        BL       get_fattime
        MOVS     R5,R0
// 4689 			if (res == FR_OK) {					/* Initialize the new directory table */
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_mkdir_6
// 4690 				res = dir_clear(fs, dcl);		/* Clean up the new table */
        MOVS     R1,R4
        LDR      R0,[SP, #+0]
          CFI FunCall dir_clear
        BL       dir_clear
        MOVS     R6,R0
// 4691 				if (res == FR_OK && (!FF_FS_EXFAT || fs->fs_type != FS_EXFAT)) {	/* Create dot entries (FAT only) */
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_mkdir_6
// 4692 					dir = fs->win;
        LDR      R0,[SP, #+0]
        ADDS     R7,R0,#+48
// 4693 					mem_set(dir + DIR_Name, ' ', 11);	/* Create "." entry */
        MOVS     R2,#+11
        MOVS     R1,#+32
        MOVS     R0,R7
          CFI FunCall mem_set
        BL       mem_set
// 4694 					dir[DIR_Name] = '.';
        MOVS     R0,#+46
        STRB     R0,[R7, #+0]
// 4695 					dir[DIR_Attr] = AM_DIR;
        MOVS     R0,#+16
        STRB     R0,[R7, #+11]
// 4696 					st_dword(dir + DIR_ModTime, tm);
        MOVS     R1,R5
        ADDS     R0,R7,#+22
          CFI FunCall st_dword
        BL       st_dword
// 4697 					st_clust(fs, dir, dcl);
        MOVS     R2,R4
        MOVS     R1,R7
        LDR      R0,[SP, #+0]
          CFI FunCall st_clust
        BL       st_clust
// 4698 					mem_cpy(dir + SZDIRE, dir, SZDIRE); /* Create ".." entry */
        MOVS     R2,#+32
        MOVS     R1,R7
        ADDS     R0,R7,#+32
          CFI FunCall mem_cpy
        BL       mem_cpy
// 4699 					dir[SZDIRE + 1] = '.'; pcl = dj.obj.sclust;
        MOVS     R0,#+46
        STRB     R0,[R7, #+33]
        LDR      R2,[SP, #+12]
// 4700 					st_clust(fs, dir + SZDIRE, pcl);
        ADDS     R1,R7,#+32
        LDR      R0,[SP, #+0]
          CFI FunCall st_clust
        BL       st_clust
// 4701 					fs->wflag = 1;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+3]
// 4702 				}
// 4703 			}
// 4704 			if (res == FR_OK) {
??f_mkdir_6:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_mkdir_7
// 4705 				res = dir_register(&dj);	/* Register the object to the directoy */
        ADD      R0,SP,#+4
          CFI FunCall dir_register
        BL       dir_register
        MOVS     R6,R0
// 4706 			}
// 4707 			if (res == FR_OK) {
??f_mkdir_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_mkdir_8
// 4708 #if FF_FS_EXFAT
// 4709 				if (fs->fs_type == FS_EXFAT) {	/* Initialize directory entry block */
// 4710 					st_dword(fs->dirbuf + XDIR_ModTime, tm);	/* Created time */
// 4711 					st_dword(fs->dirbuf + XDIR_FstClus, dcl);	/* Table start cluster */
// 4712 					st_dword(fs->dirbuf + XDIR_FileSize, (DWORD)dj.obj.objsize);	/* File size needs to be valid */
// 4713 					st_dword(fs->dirbuf + XDIR_ValidFileSize, (DWORD)dj.obj.objsize);
// 4714 					fs->dirbuf[XDIR_GenFlags] = 3;				/* Initialize the object flag */
// 4715 					fs->dirbuf[XDIR_Attr] = AM_DIR;				/* Attribute */
// 4716 					res = store_xdir(&dj);
// 4717 				} else
// 4718 #endif
// 4719 				{
// 4720 					dir = dj.dir;
        LDR      R7,[SP, #+32]
// 4721 					st_dword(dir + DIR_ModTime, tm);	/* Created time */
        MOVS     R1,R5
        ADDS     R0,R7,#+22
          CFI FunCall st_dword
        BL       st_dword
// 4722 					st_clust(fs, dir, dcl);				/* Table start cluster */
        MOVS     R2,R4
        MOVS     R1,R7
        LDR      R0,[SP, #+0]
          CFI FunCall st_clust
        BL       st_clust
// 4723 					dir[DIR_Attr] = AM_DIR;				/* Attribute */
        MOVS     R0,#+16
        STRB     R0,[R7, #+11]
// 4724 					fs->wflag = 1;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+3]
// 4725 				}
// 4726 				if (res == FR_OK) {
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_mkdir_0
// 4727 					res = sync_fs(fs);
        LDR      R0,[SP, #+0]
          CFI FunCall sync_fs
        BL       sync_fs
        MOVS     R6,R0
        B.N      ??f_mkdir_0
// 4728 				}
// 4729 			} else {
// 4730 				remove_chain(&dj.obj, dcl, 0);		/* Could not register, remove cluster chain */
??f_mkdir_8:
        MOVS     R2,#+0
        MOVS     R1,R4
        ADD      R0,SP,#+4
          CFI FunCall remove_chain
        BL       remove_chain
// 4731 			}
// 4732 		}
// 4733 		FREE_NAMBUF();
// 4734 	}
// 4735 
// 4736 	LEAVE_FF(fs, res);
??f_mkdir_0:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+52
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock49
// 4737 }
// 4738 
// 4739 
// 4740 
// 4741 
// 4742 /*-----------------------------------------------------------------------*/
// 4743 /* Rename a File/Directory                                               */
// 4744 /*-----------------------------------------------------------------------*/
// 4745 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock50 Using cfiCommon0
          CFI Function f_rename
        THUMB
// 4746 FRESULT f_rename (
// 4747 	const TCHAR* path_old,	/* Pointer to the object name to be renamed */
// 4748 	const TCHAR* path_new	/* Pointer to the new name */
// 4749 )
// 4750 {
f_rename:
        PUSH     {R0,R1,R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+20
        SUB      SP,SP,#+124
          CFI CFA R13+144
// 4751 	FRESULT res;
// 4752 	DIR djo, djn;
// 4753 	FATFS *fs;
// 4754 	BYTE buf[FF_FS_EXFAT ? SZDIRE * 2 : SZDIRE], *dir;
// 4755 	DWORD dw;
// 4756 	DEF_NAMBUF
// 4757 
// 4758 
// 4759 	get_ldnumber(&path_new);						/* Snip the drive number of new name off */
        ADD      R0,SP,#+128
          CFI FunCall get_ldnumber
        BL       get_ldnumber
// 4760 	res = find_volume(&path_old, &fs, FA_WRITE);	/* Get logical drive of the old object */
        MOVS     R2,#+2
        ADD      R1,SP,#+0
        ADD      R0,SP,#+124
          CFI FunCall find_volume
        BL       find_volume
        MOVS     R4,R0
// 4761 	if (res == FR_OK) {
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.W    ??f_rename_0
// 4762 		djo.obj.fs = fs;
        LDR      R0,[SP, #+0]
        STR      R0,[SP, #+80]
// 4763 		INIT_NAMBUF(fs);
// 4764 		res = follow_path(&djo, path_old);		/* Check old object */
        LDR      R1,[SP, #+124]
        ADD      R0,SP,#+80
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R4,R0
// 4765 		if (res == FR_OK && (djo.fn[NSFLAG] & (NS_DOT | NS_NONAME))) res = FR_INVALID_NAME;	/* Check validity of name */
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_rename_1
        LDRB     R0,[SP, #+123]
        MOVS     R1,#+160
        TST      R0,R1
        BEQ.N    ??f_rename_1
        MOVS     R4,#+6
// 4766 #if FF_FS_LOCK != 0
// 4767 		if (res == FR_OK) {
// 4768 			res = chk_lock(&djo, 2);
// 4769 		}
// 4770 #endif
// 4771 		if (res == FR_OK) {						/* Object to be renamed is found */
??f_rename_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_rename_0
// 4772 #if FF_FS_EXFAT
// 4773 			if (fs->fs_type == FS_EXFAT) {	/* At exFAT volume */
// 4774 				BYTE nf, nn;
// 4775 				WORD nh;
// 4776 
// 4777 				mem_cpy(buf, fs->dirbuf, SZDIRE * 2);	/* Save 85+C0 entry of old object */
// 4778 				mem_cpy(&djn, &djo, sizeof djo);
// 4779 				res = follow_path(&djn, path_new);		/* Make sure if new object name is not in use */
// 4780 				if (res == FR_OK) {						/* Is new name already in use by any other object? */
// 4781 					res = (djn.obj.sclust == djo.obj.sclust && djn.dptr == djo.dptr) ? FR_NO_FILE : FR_EXIST;
// 4782 				}
// 4783 				if (res == FR_NO_FILE) { 				/* It is a valid path and no name collision */
// 4784 					res = dir_register(&djn);			/* Register the new entry */
// 4785 					if (res == FR_OK) {
// 4786 						nf = fs->dirbuf[XDIR_NumSec]; nn = fs->dirbuf[XDIR_NumName];
// 4787 						nh = ld_word(fs->dirbuf + XDIR_NameHash);
// 4788 						mem_cpy(fs->dirbuf, buf, SZDIRE * 2);	/* Restore 85+C0 entry */
// 4789 						fs->dirbuf[XDIR_NumSec] = nf; fs->dirbuf[XDIR_NumName] = nn;
// 4790 						st_word(fs->dirbuf + XDIR_NameHash, nh);
// 4791 						if (!(fs->dirbuf[XDIR_Attr] & AM_DIR)) fs->dirbuf[XDIR_Attr] |= AM_ARC;	/* Set archive attribute if it is a file */
// 4792 /* Start of critical section where an interruption can cause a cross-link */
// 4793 						res = store_xdir(&djn);
// 4794 					}
// 4795 				}
// 4796 			} else
// 4797 #endif
// 4798 			{	/* At FAT/FAT32 volume */
// 4799 				mem_cpy(buf, djo.dir, SZDIRE);			/* Save directory entry of the object */
        MOVS     R2,#+32
        LDR      R1,[SP, #+108]
        ADD      R0,SP,#+4
          CFI FunCall mem_cpy
        BL       mem_cpy
// 4800 				mem_cpy(&djn, &djo, sizeof (DIR));		/* Duplicate the directory object */
        MOVS     R2,#+44
        ADD      R1,SP,#+80
        ADD      R0,SP,#+36
          CFI FunCall mem_cpy
        BL       mem_cpy
// 4801 				res = follow_path(&djn, path_new);		/* Make sure if new object name is not in use */
        LDR      R1,[SP, #+128]
        ADD      R0,SP,#+36
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R4,R0
// 4802 				if (res == FR_OK) {						/* Is new name already in use by any other object? */
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_rename_2
// 4803 					res = (djn.obj.sclust == djo.obj.sclust && djn.dptr == djo.dptr) ? FR_NO_FILE : FR_EXIST;
        LDR      R0,[SP, #+44]
        LDR      R1,[SP, #+88]
        CMP      R0,R1
        BNE.N    ??f_rename_3
        LDR      R0,[SP, #+52]
        LDR      R1,[SP, #+96]
        CMP      R0,R1
        BNE.N    ??f_rename_3
        MOVS     R4,#+4
        B.N      ??f_rename_4
??f_rename_3:
        MOVS     R4,#+8
// 4804 				}
// 4805 				if (res == FR_NO_FILE) { 				/* It is a valid path and no name collision */
??f_rename_4:
??f_rename_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BNE.N    ??f_rename_5
// 4806 					res = dir_register(&djn);			/* Register the new entry */
        ADD      R0,SP,#+36
          CFI FunCall dir_register
        BL       dir_register
        MOVS     R4,R0
// 4807 					if (res == FR_OK) {
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_rename_5
// 4808 						dir = djn.dir;					/* Copy directory entry of the object except name */
        LDR      R5,[SP, #+64]
// 4809 						mem_cpy(dir + 13, buf + 13, SZDIRE - 13);
        MOVS     R2,#+19
        ADD      R1,SP,#+17
        ADDS     R0,R5,#+13
          CFI FunCall mem_cpy
        BL       mem_cpy
// 4810 						dir[DIR_Attr] = buf[DIR_Attr];
        LDRB     R0,[SP, #+15]
        STRB     R0,[R5, #+11]
// 4811 						if (!(dir[DIR_Attr] & AM_DIR)) dir[DIR_Attr] |= AM_ARC;	/* Set archive attribute if it is a file */
        LDRB     R0,[R5, #+11]
        LSLS     R0,R0,#+27
        BMI.N    ??f_rename_6
        LDRB     R0,[R5, #+11]
        ORRS     R0,R0,#0x20
        STRB     R0,[R5, #+11]
// 4812 						fs->wflag = 1;
??f_rename_6:
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+3]
// 4813 						if ((dir[DIR_Attr] & AM_DIR) && djo.obj.sclust != djn.obj.sclust) {	/* Update .. entry in the sub-directory if needed */
        LDRB     R0,[R5, #+11]
        LSLS     R0,R0,#+27
        BPL.N    ??f_rename_5
        LDR      R0,[SP, #+88]
        LDR      R1,[SP, #+44]
        CMP      R0,R1
        BEQ.N    ??f_rename_5
// 4814 							dw = clst2sect(fs, ld_clust(fs, dir));
        MOVS     R1,R5
        LDR      R0,[SP, #+0]
          CFI FunCall ld_clust
        BL       ld_clust
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
          CFI FunCall clst2sect
        BL       clst2sect
        MOVS     R1,R0
// 4815 							if (dw == 0) {
        CMP      R1,#+0
        BNE.N    ??f_rename_7
// 4816 								res = FR_INT_ERR;
        MOVS     R4,#+2
        B.N      ??f_rename_5
// 4817 							} else {
// 4818 /* Start of critical section where an interruption can cause a cross-link */
// 4819 								res = move_window(fs, dw);
??f_rename_7:
        LDR      R0,[SP, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R4,R0
// 4820 								dir = fs->win + SZDIRE * 1;	/* Ptr to .. entry */
        LDR      R0,[SP, #+0]
        ADDS     R5,R0,#+80
// 4821 								if (res == FR_OK && dir[1] == '.') {
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_rename_5
        LDRB     R0,[R5, #+1]
        CMP      R0,#+46
        BNE.N    ??f_rename_5
// 4822 									st_clust(fs, dir, djn.obj.sclust);
        LDR      R2,[SP, #+44]
        MOVS     R1,R5
        LDR      R0,[SP, #+0]
          CFI FunCall st_clust
        BL       st_clust
// 4823 									fs->wflag = 1;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+3]
// 4824 								}
// 4825 							}
// 4826 						}
// 4827 					}
// 4828 				}
// 4829 			}
// 4830 			if (res == FR_OK) {
??f_rename_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_rename_0
// 4831 				res = dir_remove(&djo);		/* Remove old entry */
        ADD      R0,SP,#+80
          CFI FunCall dir_remove
        BL       dir_remove
        MOVS     R4,R0
// 4832 				if (res == FR_OK) {
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??f_rename_0
// 4833 					res = sync_fs(fs);
        LDR      R0,[SP, #+0]
          CFI FunCall sync_fs
        BL       sync_fs
        MOVS     R4,R0
// 4834 				}
// 4835 			}
// 4836 /* End of the critical section */
// 4837 		}
// 4838 		FREE_NAMBUF();
// 4839 	}
// 4840 
// 4841 	LEAVE_FF(fs, res);
??f_rename_0:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+132
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock50
// 4842 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 4843 
// 4844 #endif /* !FF_FS_READONLY */
// 4845 #endif /* FF_FS_MINIMIZE == 0 */
// 4846 #endif /* FF_FS_MINIMIZE <= 1 */
// 4847 #endif /* FF_FS_MINIMIZE <= 2 */
// 4848 
// 4849 
// 4850 
// 4851 #if FF_USE_CHMOD && !FF_FS_READONLY
// 4852 /*-----------------------------------------------------------------------*/
// 4853 /* Change Attribute                                                      */
// 4854 /*-----------------------------------------------------------------------*/
// 4855 
// 4856 FRESULT f_chmod (
// 4857 	const TCHAR* path,	/* Pointer to the file path */
// 4858 	BYTE attr,			/* Attribute bits */
// 4859 	BYTE mask			/* Attribute mask to change */
// 4860 )
// 4861 {
// 4862 	FRESULT res;
// 4863 	DIR dj;
// 4864 	FATFS *fs;
// 4865 	DEF_NAMBUF
// 4866 
// 4867 
// 4868 	res = find_volume(&path, &fs, FA_WRITE);	/* Get logical drive */
// 4869 	if (res == FR_OK) {
// 4870 		dj.obj.fs = fs;
// 4871 		INIT_NAMBUF(fs);
// 4872 		res = follow_path(&dj, path);	/* Follow the file path */
// 4873 		if (res == FR_OK && (dj.fn[NSFLAG] & (NS_DOT | NS_NONAME))) res = FR_INVALID_NAME;	/* Check object validity */
// 4874 		if (res == FR_OK) {
// 4875 			mask &= AM_RDO|AM_HID|AM_SYS|AM_ARC;	/* Valid attribute mask */
// 4876 #if FF_FS_EXFAT
// 4877 			if (fs->fs_type == FS_EXFAT) {
// 4878 				fs->dirbuf[XDIR_Attr] = (attr & mask) | (fs->dirbuf[XDIR_Attr] & (BYTE)~mask);	/* Apply attribute change */
// 4879 				res = store_xdir(&dj);
// 4880 			} else
// 4881 #endif
// 4882 			{
// 4883 				dj.dir[DIR_Attr] = (attr & mask) | (dj.dir[DIR_Attr] & (BYTE)~mask);	/* Apply attribute change */
// 4884 				fs->wflag = 1;
// 4885 			}
// 4886 			if (res == FR_OK) {
// 4887 				res = sync_fs(fs);
// 4888 			}
// 4889 		}
// 4890 		FREE_NAMBUF();
// 4891 	}
// 4892 
// 4893 	LEAVE_FF(fs, res);
// 4894 }
// 4895 
// 4896 
// 4897 
// 4898 
// 4899 /*-----------------------------------------------------------------------*/
// 4900 /* Change Timestamp                                                      */
// 4901 /*-----------------------------------------------------------------------*/
// 4902 
// 4903 FRESULT f_utime (
// 4904 	const TCHAR* path,	/* Pointer to the file/directory name */
// 4905 	const FILINFO* fno	/* Pointer to the timestamp to be set */
// 4906 )
// 4907 {
// 4908 	FRESULT res;
// 4909 	DIR dj;
// 4910 	FATFS *fs;
// 4911 	DEF_NAMBUF
// 4912 
// 4913 
// 4914 	res = find_volume(&path, &fs, FA_WRITE);	/* Get logical drive */
// 4915 	if (res == FR_OK) {
// 4916 		dj.obj.fs = fs;
// 4917 		INIT_NAMBUF(fs);
// 4918 		res = follow_path(&dj, path);	/* Follow the file path */
// 4919 		if (res == FR_OK && (dj.fn[NSFLAG] & (NS_DOT | NS_NONAME))) res = FR_INVALID_NAME;	/* Check object validity */
// 4920 		if (res == FR_OK) {
// 4921 #if FF_FS_EXFAT
// 4922 			if (fs->fs_type == FS_EXFAT) {
// 4923 				st_dword(fs->dirbuf + XDIR_ModTime, (DWORD)fno->fdate << 16 | fno->ftime);
// 4924 				res = store_xdir(&dj);
// 4925 			} else
// 4926 #endif
// 4927 			{
// 4928 				st_dword(dj.dir + DIR_ModTime, (DWORD)fno->fdate << 16 | fno->ftime);
// 4929 				fs->wflag = 1;
// 4930 			}
// 4931 			if (res == FR_OK) {
// 4932 				res = sync_fs(fs);
// 4933 			}
// 4934 		}
// 4935 		FREE_NAMBUF();
// 4936 	}
// 4937 
// 4938 	LEAVE_FF(fs, res);
// 4939 }
// 4940 
// 4941 #endif	/* FF_USE_CHMOD && !FF_FS_READONLY */
// 4942 
// 4943 
// 4944 
// 4945 #if FF_USE_LABEL
// 4946 /*-----------------------------------------------------------------------*/
// 4947 /* Get Volume Label                                                      */
// 4948 /*-----------------------------------------------------------------------*/
// 4949 
// 4950 FRESULT f_getlabel (
// 4951 	const TCHAR* path,	/* Path name of the logical drive number */
// 4952 	TCHAR* label,		/* Pointer to a buffer to store the volume label */
// 4953 	DWORD* vsn			/* Pointer to a variable to store the volume serial number */
// 4954 )
// 4955 {
// 4956 	FRESULT res;
// 4957 	DIR dj;
// 4958 	FATFS *fs;
// 4959 	UINT si, di;
// 4960 #if (FF_LFN_UNICODE && FF_USE_LFN) || FF_FS_EXFAT
// 4961 	WCHAR w;
// 4962 #endif
// 4963 
// 4964 	/* Get logical drive */
// 4965 	res = find_volume(&path, &fs, 0);
// 4966 
// 4967 	/* Get volume label */
// 4968 	if (res == FR_OK && label) {
// 4969 		dj.obj.fs = fs; dj.obj.sclust = 0;	/* Open root directory */
// 4970 		res = dir_sdi(&dj, 0);
// 4971 		if (res == FR_OK) {
// 4972 		 	res = dir_read(&dj, 1);			/* Find a volume label entry */
// 4973 		 	if (res == FR_OK) {
// 4974 #if FF_FS_EXFAT
// 4975 				if (fs->fs_type == FS_EXFAT) {
// 4976 					for (si = di = 0; si < dj.dir[XDIR_NumLabel]; si++) {	/* Extract volume label from 83 entry */
// 4977 						w = ld_word(dj.dir + XDIR_Label + si * 2);
// 4978 #if !FF_LFN_UNICODE		/* ANSI/OEM API */
// 4979 						w = ff_uni2oem(w, CODEPAGE);	/* Unicode -> OEM */
// 4980 						if (w == 0) w = '?';			/* Replace wrong char with '?' */
// 4981 						if (w >= 0x100) label[di++] = (char)(w >> 8);
// 4982 #endif
// 4983 						label[di++] = (TCHAR)w;
// 4984 					}
// 4985 					label[di] = 0;
// 4986 				} else
// 4987 #endif
// 4988 				{
// 4989 					si = di = 0;		/* Extract volume label from AM_VOL entry with code comversion */
// 4990 					do {
// 4991 #if FF_LFN_UNICODE && FF_USE_LFN	/* Unicode API */
// 4992 						w = (si < 11) ? dj.dir[si++] : ' ';
// 4993 						if (dbc_1st((BYTE)w) && si < 11 && dbc_2nd(dj.dir[si])) {
// 4994 							w = w << 8 | dj.dir[si++];
// 4995 						}
// 4996 						label[di++] = ff_oem2uni(w, CODEPAGE);	/* OEM -> Unicode */
// 4997 #else								/* ANSI/OEM API */
// 4998 						label[di++] = dj.dir[si++];
// 4999 #endif
// 5000 					} while (di < 11);
// 5001 					do {				/* Truncate trailing spaces */
// 5002 						label[di] = 0;
// 5003 						if (di == 0) break;
// 5004 					} while (label[--di] == ' ');
// 5005 				}
// 5006 			}
// 5007 		}
// 5008 		if (res == FR_NO_FILE) {	/* No label entry and return nul string */
// 5009 			label[0] = 0;
// 5010 			res = FR_OK;
// 5011 		}
// 5012 	}
// 5013 
// 5014 	/* Get volume serial number */
// 5015 	if (res == FR_OK && vsn) {
// 5016 		res = move_window(fs, fs->volbase);
// 5017 		if (res == FR_OK) {
// 5018 			switch (fs->fs_type) {
// 5019 			case FS_EXFAT:
// 5020 				di = BPB_VolIDEx; break;
// 5021 
// 5022 			case FS_FAT32:
// 5023 				di = BS_VolID32; break;
// 5024 
// 5025 			default:
// 5026 				di = BS_VolID;
// 5027 			}
// 5028 			*vsn = ld_dword(fs->win + di);
// 5029 		}
// 5030 	}
// 5031 
// 5032 	LEAVE_FF(fs, res);
// 5033 }
// 5034 
// 5035 
// 5036 
// 5037 #if !FF_FS_READONLY
// 5038 /*-----------------------------------------------------------------------*/
// 5039 /* Set Volume Label                                                      */
// 5040 /*-----------------------------------------------------------------------*/
// 5041 
// 5042 FRESULT f_setlabel (
// 5043 	const TCHAR* label	/* Pointer to the volume label to set */
// 5044 )
// 5045 {
// 5046 	FRESULT res;
// 5047 	DIR dj;
// 5048 	FATFS *fs;
// 5049 	BYTE dirvn[22];
// 5050 	UINT i, j, slen;
// 5051 	WCHAR w;
// 5052 	static const char badchr[] = "\"*+,.:;<=>\?[]|\x7F";
// 5053 
// 5054 
// 5055 	/* Get logical drive */
// 5056 	res = find_volume(&label, &fs, FA_WRITE);
// 5057 	if (res != FR_OK) LEAVE_FF(fs, res);
// 5058 	dj.obj.fs = fs;
// 5059 
// 5060 	/* Get length of given volume label */
// 5061 	for (slen = 0; (UINT)label[slen] >= ' '; slen++) ;	/* Get name length */
// 5062 
// 5063 #if FF_FS_EXFAT
// 5064 	if (fs->fs_type == FS_EXFAT) {	/* On the exFAT volume */
// 5065 		for (i = j = 0; i < slen; ) {	/* Create volume label in directory form */
// 5066 			w = label[i++];
// 5067 #if !FF_LFN_UNICODE	/* ANSI/OEM API */
// 5068 			if (dbc_1st((BYTE)w)) {
// 5069 				w = (i < slen && dbc_2nd((BYTE)label[i])) ? w << 8 | (BYTE)label[i++] : 0;
// 5070 			}
// 5071 			w = ff_oem2uni(w, CODEPAGE);
// 5072 #endif
// 5073 			if (w == 0 || chk_chr(badchr, w) || j == 22) {	/* Check validity check validity of the volume label */
// 5074 				LEAVE_FF(fs, FR_INVALID_NAME);
// 5075 			}
// 5076 			st_word(dirvn + j, w); j += 2;
// 5077 		}
// 5078 		slen = j;
// 5079 	} else
// 5080 #endif
// 5081 	{	/* On the FAT/FAT32 volume */
// 5082 		for ( ; slen && label[slen - 1] == ' '; slen--) ;	/* Remove trailing spaces */
// 5083 		if (slen != 0) {		/* Is there a volume label to be set? */
// 5084 			dirvn[0] = 0; i = j = 0;	/* Create volume label in directory form */
// 5085 			do {
// 5086 #if FF_LFN_UNICODE && FF_USE_LFN	/* Unicode API */
// 5087 				w = ff_uni2oem(ff_wtoupper(label[i++]), CODEPAGE);
// 5088 #else								/* ANSI/OEM API */
// 5089 				w = (BYTE)label[i++];
// 5090 				if (dbc_1st((BYTE)w)) {
// 5091 					w = (j < 10 && i < slen && dbc_2nd((BYTE)label[i])) ? w << 8 | (BYTE)label[i++] : 0;
// 5092 				}
// 5093 #if FF_USE_LFN
// 5094 				w = ff_uni2oem(ff_wtoupper(ff_oem2uni(w, CODEPAGE)), CODEPAGE);
// 5095 #else
// 5096 				if (IsLower(w)) w -= 0x20;			/* To upper ASCII characters */
// 5097 #if FF_CODE_PAGE == 0
// 5098 				if (ExCvt && w >= 0x80) w = ExCvt[w - 0x80];	/* To upper extended characters (SBCS cfg) */
// 5099 #elif FF_CODE_PAGE < 900
// 5100 				if (w >= 0x80) w = ExCvt[w - 0x80];	/* To upper extended characters (SBCS cfg) */
// 5101 #endif
// 5102 #endif
// 5103 #endif
// 5104 				if (w == 0 || chk_chr(badchr, w) || j >= (UINT)((w >= 0x100) ? 10 : 11)) {	/* Reject invalid characters for volume label */
// 5105 					LEAVE_FF(fs, FR_INVALID_NAME);
// 5106 				}
// 5107 				if (w >= 0x100) dirvn[j++] = (BYTE)(w >> 8);
// 5108 				dirvn[j++] = (BYTE)w;
// 5109 			} while (i < slen);
// 5110 			while (j < 11) dirvn[j++] = ' ';	/* Fill remaining name field */
// 5111 			if (dirvn[0] == DDEM) LEAVE_FF(fs, FR_INVALID_NAME);	/* Reject illegal name (heading DDEM) */
// 5112 		}
// 5113 	}
// 5114 
// 5115 	/* Set volume label */
// 5116 	dj.obj.sclust = 0;		/* Open root directory */
// 5117 	res = dir_sdi(&dj, 0);
// 5118 	if (res == FR_OK) {
// 5119 		res = dir_read(&dj, 1);	/* Get volume label entry */
// 5120 		if (res == FR_OK) {
// 5121 			if (FF_FS_EXFAT && fs->fs_type == FS_EXFAT) {
// 5122 				dj.dir[XDIR_NumLabel] = (BYTE)(slen / 2);	/* Change the volume label */
// 5123 				mem_cpy(dj.dir + XDIR_Label, dirvn, slen);
// 5124 			} else {
// 5125 				if (slen != 0) {
// 5126 					mem_cpy(dj.dir, dirvn, 11);	/* Change the volume label */
// 5127 				} else {
// 5128 					dj.dir[DIR_Name] = DDEM;	/* Remove the volume label */
// 5129 				}
// 5130 			}
// 5131 			fs->wflag = 1;
// 5132 			res = sync_fs(fs);
// 5133 		} else {			/* No volume label entry or an error */
// 5134 			if (res == FR_NO_FILE) {
// 5135 				res = FR_OK;
// 5136 				if (slen != 0) {	/* Create a volume label entry */
// 5137 					res = dir_alloc(&dj, 1);	/* Allocate an entry */
// 5138 					if (res == FR_OK) {
// 5139 						mem_set(dj.dir, 0, SZDIRE);	/* Clear the entry */
// 5140 						if (FF_FS_EXFAT && fs->fs_type == FS_EXFAT) {
// 5141 							dj.dir[XDIR_Type] = 0x83;		/* Create 83 entry */
// 5142 							dj.dir[XDIR_NumLabel] = (BYTE)(slen / 2);
// 5143 							mem_cpy(dj.dir + XDIR_Label, dirvn, slen);
// 5144 						} else {
// 5145 							dj.dir[DIR_Attr] = AM_VOL;		/* Create volume label entry */
// 5146 							mem_cpy(dj.dir, dirvn, 11);
// 5147 						}
// 5148 						fs->wflag = 1;
// 5149 						res = sync_fs(fs);
// 5150 					}
// 5151 				}
// 5152 			}
// 5153 		}
// 5154 	}
// 5155 
// 5156 	LEAVE_FF(fs, res);
// 5157 }
// 5158 
// 5159 #endif /* !FF_FS_READONLY */
// 5160 #endif /* FF_USE_LABEL */
// 5161 
// 5162 
// 5163 
// 5164 #if FF_USE_EXPAND && !FF_FS_READONLY
// 5165 /*-----------------------------------------------------------------------*/
// 5166 /* Allocate a Contiguous Blocks to the File                              */
// 5167 /*-----------------------------------------------------------------------*/
// 5168 
// 5169 FRESULT f_expand (
// 5170 	FIL* fp,		/* Pointer to the file object */
// 5171 	FSIZE_t fsz,	/* File size to be expanded to */
// 5172 	BYTE opt		/* Operation mode 0:Find and prepare or 1:Find and allocate */
// 5173 )
// 5174 {
// 5175 	FRESULT res;
// 5176 	FATFS *fs;
// 5177 	DWORD n, clst, stcl, scl, ncl, tcl, lclst;
// 5178 
// 5179 
// 5180 	res = validate(&fp->obj, &fs);		/* Check validity of the file object */
// 5181 	if (res != FR_OK || (res = (FRESULT)fp->err) != FR_OK) LEAVE_FF(fs, res);
// 5182 	if (fsz == 0 || fp->obj.objsize != 0 || !(fp->flag & FA_WRITE)) LEAVE_FF(fs, FR_DENIED);
// 5183 #if FF_FS_EXFAT
// 5184 	if (fs->fs_type != FS_EXFAT && fsz >= 0x100000000) LEAVE_FF(fs, FR_DENIED);	/* Check if in size limit */
// 5185 #endif
// 5186 	n = (DWORD)fs->csize * SS(fs);	/* Cluster size */
// 5187 	tcl = (DWORD)(fsz / n) + ((fsz & (n - 1)) ? 1 : 0);	/* Number of clusters required */
// 5188 	stcl = fs->last_clst; lclst = 0;
// 5189 	if (stcl < 2 || stcl >= fs->n_fatent) stcl = 2;
// 5190 
// 5191 #if FF_FS_EXFAT
// 5192 	if (fs->fs_type == FS_EXFAT) {
// 5193 		scl = find_bitmap(fs, stcl, tcl);			/* Find a contiguous cluster block */
// 5194 		if (scl == 0) res = FR_DENIED;				/* No contiguous cluster block was found */
// 5195 		if (scl == 0xFFFFFFFF) res = FR_DISK_ERR;
// 5196 		if (res == FR_OK) {	/* A contiguous free area is found */
// 5197 			if (opt) {		/* Allocate it now */
// 5198 				res = change_bitmap(fs, scl, tcl, 1);	/* Mark the cluster block 'in use' */
// 5199 				lclst = scl + tcl - 1;
// 5200 			} else {		/* Set it as suggested point for next allocation */
// 5201 				lclst = scl - 1;
// 5202 			}
// 5203 		}
// 5204 	} else
// 5205 #endif
// 5206 	{
// 5207 		scl = clst = stcl; ncl = 0;
// 5208 		for (;;) {	/* Find a contiguous cluster block */
// 5209 			n = get_fat(&fp->obj, clst);
// 5210 			if (++clst >= fs->n_fatent) clst = 2;
// 5211 			if (n == 1) { res = FR_INT_ERR; break; }
// 5212 			if (n == 0xFFFFFFFF) { res = FR_DISK_ERR; break; }
// 5213 			if (n == 0) {	/* Is it a free cluster? */
// 5214 				if (++ncl == tcl) break;	/* Break if a contiguous cluster block is found */
// 5215 			} else {
// 5216 				scl = clst; ncl = 0;		/* Not a free cluster */
// 5217 			}
// 5218 			if (clst == stcl) { res = FR_DENIED; break; }	/* No contiguous cluster? */
// 5219 		}
// 5220 		if (res == FR_OK) {	/* A contiguous free area is found */
// 5221 			if (opt) {		/* Allocate it now */
// 5222 				for (clst = scl, n = tcl; n; clst++, n--) {	/* Create a cluster chain on the FAT */
// 5223 					res = put_fat(fs, clst, (n == 1) ? 0xFFFFFFFF : clst + 1);
// 5224 					if (res != FR_OK) break;
// 5225 					lclst = clst;
// 5226 				}
// 5227 			} else {		/* Set it as suggested point for next allocation */
// 5228 				lclst = scl - 1;
// 5229 			}
// 5230 		}
// 5231 	}
// 5232 
// 5233 	if (res == FR_OK) {
// 5234 		fs->last_clst = lclst;		/* Set suggested start cluster to start next */
// 5235 		if (opt) {	/* Is it allocated now? */
// 5236 			fp->obj.sclust = scl;		/* Update object allocation information */
// 5237 			fp->obj.objsize = fsz;
// 5238 			if (FF_FS_EXFAT) fp->obj.stat = 2;	/* Set status 'contiguous chain' */
// 5239 			fp->flag |= FA_MODIFIED;
// 5240 			if (fs->free_clst <= fs->n_fatent - 2) {	/* Update FSINFO */
// 5241 				fs->free_clst -= tcl;
// 5242 				fs->fsi_flag |= 1;
// 5243 			}
// 5244 		}
// 5245 	}
// 5246 
// 5247 	LEAVE_FF(fs, res);
// 5248 }
// 5249 
// 5250 #endif /* FF_USE_EXPAND && !FF_FS_READONLY */
// 5251 
// 5252 
// 5253 
// 5254 #if FF_USE_FORWARD
// 5255 /*-----------------------------------------------------------------------*/
// 5256 /* Forward Data to the Stream Directly                                   */
// 5257 /*-----------------------------------------------------------------------*/
// 5258 
// 5259 FRESULT f_forward (
// 5260 	FIL* fp, 						/* Pointer to the file object */
// 5261 	UINT (*func)(const BYTE*,UINT),	/* Pointer to the streaming function */
// 5262 	UINT btf,						/* Number of bytes to forward */
// 5263 	UINT* bf						/* Pointer to number of bytes forwarded */
// 5264 )
// 5265 {
// 5266 	FRESULT res;
// 5267 	FATFS *fs;
// 5268 	DWORD clst, sect;
// 5269 	FSIZE_t remain;
// 5270 	UINT rcnt, csect;
// 5271 	BYTE *dbuf;
// 5272 
// 5273 
// 5274 	*bf = 0;	/* Clear transfer byte counter */
// 5275 	res = validate(&fp->obj, &fs);		/* Check validity of the file object */
// 5276 	if (res != FR_OK || (res = (FRESULT)fp->err) != FR_OK) LEAVE_FF(fs, res);
// 5277 	if (!(fp->flag & FA_READ)) LEAVE_FF(fs, FR_DENIED);	/* Check access mode */
// 5278 
// 5279 	remain = fp->obj.objsize - fp->fptr;
// 5280 	if (btf > remain) btf = (UINT)remain;			/* Truncate btf by remaining bytes */
// 5281 
// 5282 	for ( ;  btf && (*func)(0, 0);					/* Repeat until all data transferred or stream goes busy */
// 5283 		fp->fptr += rcnt, *bf += rcnt, btf -= rcnt) {
// 5284 		csect = (UINT)(fp->fptr / SS(fs) & (fs->csize - 1));	/* Sector offset in the cluster */
// 5285 		if (fp->fptr % SS(fs) == 0) {				/* On the sector boundary? */
// 5286 			if (csect == 0) {						/* On the cluster boundary? */
// 5287 				clst = (fp->fptr == 0) ?			/* On the top of the file? */
// 5288 					fp->obj.sclust : get_fat(&fp->obj, fp->clust);
// 5289 				if (clst <= 1) ABORT(fs, FR_INT_ERR);
// 5290 				if (clst == 0xFFFFFFFF) ABORT(fs, FR_DISK_ERR);
// 5291 				fp->clust = clst;					/* Update current cluster */
// 5292 			}
// 5293 		}
// 5294 		sect = clst2sect(fs, fp->clust);			/* Get current data sector */
// 5295 		if (sect == 0) ABORT(fs, FR_INT_ERR);
// 5296 		sect += csect;
// 5297 #if FF_FS_TINY
// 5298 		if (move_window(fs, sect) != FR_OK) ABORT(fs, FR_DISK_ERR);	/* Move sector window to the file data */
// 5299 		dbuf = fs->win;
// 5300 #else
// 5301 		if (fp->sect != sect) {		/* Fill sector cache with file data */
// 5302 #if !FF_FS_READONLY
// 5303 			if (fp->flag & FA_DIRTY) {		/* Write-back dirty sector cache */
// 5304 				if (disk_write(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) ABORT(fs, FR_DISK_ERR);
// 5305 				fp->flag &= (BYTE)~FA_DIRTY;
// 5306 			}
// 5307 #endif
// 5308 			if (disk_read(fs->pdrv, fp->buf, sect, 1) != RES_OK) ABORT(fs, FR_DISK_ERR);
// 5309 		}
// 5310 		dbuf = fp->buf;
// 5311 #endif
// 5312 		fp->sect = sect;
// 5313 		rcnt = SS(fs) - (UINT)fp->fptr % SS(fs);	/* Number of bytes left in the sector */
// 5314 		if (rcnt > btf) rcnt = btf;					/* Clip it by btr if needed */
// 5315 		rcnt = (*func)(dbuf + ((UINT)fp->fptr % SS(fs)), rcnt);	/* Forward the file data */
// 5316 		if (rcnt == 0) ABORT(fs, FR_INT_ERR);
// 5317 	}
// 5318 
// 5319 	LEAVE_FF(fs, FR_OK);
// 5320 }
// 5321 #endif /* FF_USE_FORWARD */
// 5322 
// 5323 
// 5324 
// 5325 #if FF_USE_MKFS && !FF_FS_READONLY
// 5326 /*-----------------------------------------------------------------------*/
// 5327 /* Create an FAT/exFAT volume                                            */
// 5328 /*-----------------------------------------------------------------------*/
// 5329 
// 5330 FRESULT f_mkfs (
// 5331 	const TCHAR* path,	/* Logical drive number */
// 5332 	BYTE opt,			/* Format option */
// 5333 	DWORD au,			/* Size of allocation unit (cluster) [byte] */
// 5334 	void* work,			/* Pointer to working buffer */
// 5335 	UINT len			/* Size of working buffer */
// 5336 )
// 5337 {
// 5338 	const UINT n_fats = 1;		/* Number of FATs for FAT/FAT32 volume (1 or 2) */
// 5339 	const UINT n_rootdir = 512;	/* Number of root directory entries for FAT volume */
// 5340 	static const WORD cst[] = {1, 4, 16, 64, 256, 512, 0};	/* Cluster size boundary for FAT volume (4Ks unit) */
// 5341 	static const WORD cst32[] = {1, 2, 4, 8, 16, 32, 0};	/* Cluster size boundary for FAT32 volume (128Ks unit) */
// 5342 	BYTE fmt, sys, *buf, *pte, pdrv, part;
// 5343 	WORD ss;
// 5344 	DWORD szb_buf, sz_buf, sz_blk, n_clst, pau, sect, nsect, n;
// 5345 	DWORD b_vol, b_fat, b_data;				/* Base LBA for volume, fat, data */
// 5346 	DWORD sz_vol, sz_rsv, sz_fat, sz_dir;	/* Size for volume, fat, dir, data */
// 5347 	UINT i;
// 5348 	int vol;
// 5349 	DSTATUS stat;
// 5350 #if FF_USE_TRIM || FF_FS_EXFAT
// 5351 	DWORD tbl[3];
// 5352 #endif
// 5353 
// 5354 
// 5355 	/* Check mounted drive and clear work area */
// 5356 	vol = get_ldnumber(&path);					/* Get target logical drive */
// 5357 	if (vol < 0) return FR_INVALID_DRIVE;
// 5358 	if (FatFs[vol]) FatFs[vol]->fs_type = 0;	/* Clear the volume */
// 5359 	pdrv = LD2PD(vol);	/* Physical drive */
// 5360 	part = LD2PT(vol);	/* Partition (0:create as new, 1-4:get from partition table) */
// 5361 
// 5362 	/* Check physical drive status */
// 5363 	stat = disk_initialize(pdrv);
// 5364 	if (stat & STA_NOINIT) return FR_NOT_READY;
// 5365 	if (stat & STA_PROTECT) return FR_WRITE_PROTECTED;
// 5366 	if (disk_ioctl(pdrv, GET_BLOCK_SIZE, &sz_blk) != RES_OK || !sz_blk || sz_blk > 32768 || (sz_blk & (sz_blk - 1))) sz_blk = 1;	/* Erase block to align data area */
// 5367 #if FF_MAX_SS != FF_MIN_SS		/* Get sector size of the medium if variable sector size cfg. */
// 5368 	if (disk_ioctl(pdrv, GET_SECTOR_SIZE, &ss) != RES_OK) return FR_DISK_ERR;
// 5369 	if (ss > FF_MAX_SS || ss < FF_MIN_SS || (ss & (ss - 1))) return FR_DISK_ERR;
// 5370 #else
// 5371 	ss = FF_MAX_SS;
// 5372 #endif
// 5373 	if ((au != 0 && au < ss) || au > 0x1000000 || (au & (au - 1))) return FR_INVALID_PARAMETER;	/* Check if au is valid */
// 5374 	au /= ss;	/* Cluster size in unit of sector */
// 5375 
// 5376 	/* Get working buffer */
// 5377 	buf = (BYTE*)work;		/* Working buffer */
// 5378 	sz_buf = len / ss;		/* Size of working buffer (sector) */
// 5379 	szb_buf = sz_buf * ss;	/* Size of working buffer (byte) */
// 5380 	if (szb_buf == 0) return FR_MKFS_ABORTED;
// 5381 
// 5382 	/* Determine where the volume to be located (b_vol, sz_vol) */
// 5383 	if (FF_MULTI_PARTITION && part != 0) {
// 5384 		/* Get partition information from partition table in the MBR */
// 5385 		if (disk_read(pdrv, buf, 0, 1) != RES_OK) return FR_DISK_ERR;	/* Load MBR */
// 5386 		if (ld_word(buf + BS_55AA) != 0xAA55) return FR_MKFS_ABORTED;	/* Check if MBR is valid */
// 5387 		pte = buf + (MBR_Table + (part - 1) * SZ_PTE);
// 5388 		if (!pte[PTE_System]) return FR_MKFS_ABORTED;	/* No partition? */
// 5389 		b_vol = ld_dword(pte + PTE_StLba);		/* Get volume start sector */
// 5390 		sz_vol = ld_dword(pte + PTE_SizLba);	/* Get volume size */
// 5391 	} else {
// 5392 		/* Create a single-partition in this function */
// 5393 		if (disk_ioctl(pdrv, GET_SECTOR_COUNT, &sz_vol) != RES_OK) return FR_DISK_ERR;
// 5394 		b_vol = (opt & FM_SFD) ? 0 : 63;		/* Volume start sector */
// 5395 		if (sz_vol < b_vol) return FR_MKFS_ABORTED;
// 5396 		sz_vol -= b_vol;						/* Volume size */
// 5397 	}
// 5398 	if (sz_vol < 128) return FR_MKFS_ABORTED;	/* Check if volume size is >=128s */
// 5399 
// 5400 	/* Pre-determine the FAT type */
// 5401 	do {
// 5402 		if (FF_FS_EXFAT && (opt & FM_EXFAT)) {	/* exFAT possible? */
// 5403 			if ((opt & FM_ANY) == FM_EXFAT || sz_vol >= 0x4000000 || au > 128) {	/* exFAT only, vol >= 64Ms or au > 128s ? */
// 5404 				fmt = FS_EXFAT; break;
// 5405 			}
// 5406 		}
// 5407 		if (au > 128) return FR_INVALID_PARAMETER;	/* Too large au for FAT/FAT32 */
// 5408 		if (opt & FM_FAT32) {	/* FAT32 possible? */
// 5409 			if ((opt & FM_ANY) == FM_FAT32 || !(opt & FM_FAT)) {	/* FAT32 only or no-FAT? */
// 5410 				fmt = FS_FAT32; break;
// 5411 			}
// 5412 		}
// 5413 		if (!(opt & FM_FAT)) return FR_INVALID_PARAMETER;	/* no-FAT? */
// 5414 		fmt = FS_FAT16;
// 5415 	} while (0);
// 5416 
// 5417 #if FF_FS_EXFAT
// 5418 	if (fmt == FS_EXFAT) {	/* Create an exFAT volume */
// 5419 		DWORD szb_bit, szb_case, sum, nb, cl;
// 5420 		WCHAR ch, si;
// 5421 		UINT j, st;
// 5422 		BYTE b;
// 5423 
// 5424 		if (sz_vol < 0x1000) return FR_MKFS_ABORTED;	/* Too small volume? */
// 5425 #if FF_USE_TRIM
// 5426 		tbl[0] = b_vol; tbl[1] = b_vol + sz_vol - 1;	/* Inform the device the volume area may be erased */
// 5427 		disk_ioctl(pdrv, CTRL_TRIM, tbl);
// 5428 #endif
// 5429 		/* Determine FAT location, data location and number of clusters */
// 5430 		if (au == 0) {	/* au auto-selection */
// 5431 			au = 8;
// 5432 			if (sz_vol >= 0x80000) au = 64;		/* >= 512Ks */
// 5433 			if (sz_vol >= 0x4000000) au = 256;	/* >= 64Ms */
// 5434 		}
// 5435 		b_fat = b_vol + 32;										/* FAT start at offset 32 */
// 5436 		sz_fat = ((sz_vol / au + 2) * 4 + ss - 1) / ss;			/* Number of FAT sectors */
// 5437 		b_data = (b_fat + sz_fat + sz_blk - 1) & ~(sz_blk - 1);	/* Align data area to the erase block boundary */
// 5438 		if (b_data >= sz_vol / 2) return FR_MKFS_ABORTED;		/* Too small volume? */
// 5439 		n_clst = (sz_vol - (b_data - b_vol)) / au;				/* Number of clusters */
// 5440 		if (n_clst <16) return FR_MKFS_ABORTED;					/* Too few clusters? */
// 5441 		if (n_clst > MAX_EXFAT) return FR_MKFS_ABORTED;			/* Too many clusters? */
// 5442 
// 5443 		szb_bit = (n_clst + 7) / 8;						/* Size of allocation bitmap */
// 5444 		tbl[0] = (szb_bit + au * ss - 1) / (au * ss);	/* Number of allocation bitmap clusters */
// 5445 
// 5446 		/* Create a compressed up-case table */
// 5447 		sect = b_data + au * tbl[0];	/* Table start sector */
// 5448 		sum = 0;						/* Table checksum to be stored in the 82 entry */
// 5449 		st = si = i = j = szb_case = 0;
// 5450 		do {
// 5451 			switch (st) {
// 5452 			case 0:
// 5453 				ch = ff_wtoupper(si);	/* Get an up-case char */
// 5454 				if (ch != si) {
// 5455 					si++; break;		/* Store the up-case char if exist */
// 5456 				}
// 5457 				for (j = 1; (WCHAR)(si + j) && (WCHAR)(si + j) == ff_wtoupper((WCHAR)(si + j)); j++) ;	/* Get run length of no-case block */
// 5458 				if (j >= 128) {
// 5459 					ch = 0xFFFF; st = 2; break;	/* Compress the no-case block if run is >= 128 */
// 5460 				}
// 5461 				st = 1;			/* Do not compress short run */
// 5462 				/* go to next case */
// 5463 			case 1:
// 5464 				ch = si++;		/* Fill the short run */
// 5465 				if (--j == 0) st = 0;
// 5466 				break;
// 5467 
// 5468 			default:
// 5469 				ch = (WCHAR)j; si += j;	/* Number of chars to skip */
// 5470 				st = 0;
// 5471 			}
// 5472 			sum = xsum32(buf[i + 0] = (BYTE)ch, sum);		/* Put it into the write buffer */
// 5473 			sum = xsum32(buf[i + 1] = (BYTE)(ch >> 8), sum);
// 5474 			i += 2; szb_case += 2;
// 5475 			if (si == 0|| i == szb_buf) {		/* Write buffered data when buffer full or end of process */
// 5476 				n = (i + ss - 1) / ss;
// 5477 				if (disk_write(pdrv, buf, sect, n) != RES_OK) return FR_DISK_ERR;
// 5478 				sect += n; i = 0;
// 5479 			}
// 5480 		} while (si);
// 5481 		tbl[1] = (szb_case + au * ss - 1) / (au * ss);	/* Number of up-case table clusters */
// 5482 		tbl[2] = 1;										/* Number of root dir clusters */
// 5483 
// 5484 		/* Initialize the allocation bitmap */
// 5485 		sect = b_data; nsect = (szb_bit + ss - 1) / ss;	/* Start of bitmap and number of sectors */
// 5486 		nb = tbl[0] + tbl[1] + tbl[2];					/* Number of clusters in-use by system */
// 5487 		do {
// 5488 			mem_set(buf, 0, szb_buf);
// 5489 			for (i = 0; nb >= 8 && i < szb_buf; buf[i++] = 0xFF, nb -= 8) ;
// 5490 			for (b = 1; nb != 0 && i < szb_buf; buf[i] |= b, b <<= 1, nb--) ;
// 5491 			n = (nsect > sz_buf) ? sz_buf : nsect;		/* Write the buffered data */
// 5492 			if (disk_write(pdrv, buf, sect, n) != RES_OK) return FR_DISK_ERR;
// 5493 			sect += n; nsect -= n;
// 5494 		} while (nsect);
// 5495 
// 5496 		/* Initialize the FAT */
// 5497 		sect = b_fat; nsect = sz_fat;	/* Start of FAT and number of FAT sectors */
// 5498 		j = nb = cl = 0;
// 5499 		do {
// 5500 			mem_set(buf, 0, szb_buf); i = 0;	/* Clear work area and reset write index */
// 5501 			if (cl == 0) {	/* Set entry 0 and 1 */
// 5502 				st_dword(buf + i, 0xFFFFFFF8); i += 4; cl++;
// 5503 				st_dword(buf + i, 0xFFFFFFFF); i += 4; cl++;
// 5504 			}
// 5505 			do {			/* Create chains of bitmap, up-case and root dir */
// 5506 				while (nb != 0 && i < szb_buf) {			/* Create a chain */
// 5507 					st_dword(buf + i, (nb > 1) ? cl + 1 : 0xFFFFFFFF);
// 5508 					i += 4; cl++; nb--;
// 5509 				}
// 5510 				if (nb == 0 && j < 3) nb = tbl[j++];	/* Next chain */
// 5511 			} while (nb != 0 && i < szb_buf);
// 5512 			n = (nsect > sz_buf) ? sz_buf : nsect;	/* Write the buffered data */
// 5513 			if (disk_write(pdrv, buf, sect, n) != RES_OK) return FR_DISK_ERR;
// 5514 			sect += n; nsect -= n;
// 5515 		} while (nsect);
// 5516 
// 5517 		/* Initialize the root directory */
// 5518 		mem_set(buf, 0, szb_buf);
// 5519 		buf[SZDIRE * 0 + 0] = 0x83;		/* 83 entry (volume label) */
// 5520 		buf[SZDIRE * 1 + 0] = 0x81;		/* 81 entry (allocation bitmap) */
// 5521 		st_dword(buf + SZDIRE * 1 + 20, 2);
// 5522 		st_dword(buf + SZDIRE * 1 + 24, szb_bit);
// 5523 		buf[SZDIRE * 2 + 0] = 0x82;		/* 82 entry (up-case table) */
// 5524 		st_dword(buf + SZDIRE * 2 + 4, sum);
// 5525 		st_dword(buf + SZDIRE * 2 + 20, 2 + tbl[0]);
// 5526 		st_dword(buf + SZDIRE * 2 + 24, szb_case);
// 5527 		sect = b_data + au * (tbl[0] + tbl[1]);	nsect = au;	/* Start of the root directory and number of sectors */
// 5528 		do {	/* Fill root directory sectors */
// 5529 			n = (nsect > sz_buf) ? sz_buf : nsect;
// 5530 			if (disk_write(pdrv, buf, sect, n) != RES_OK) return FR_DISK_ERR;
// 5531 			mem_set(buf, 0, ss);
// 5532 			sect += n; nsect -= n;
// 5533 		} while (nsect);
// 5534 
// 5535 		/* Create two set of the exFAT VBR blocks */
// 5536 		sect = b_vol;
// 5537 		for (n = 0; n < 2; n++) {
// 5538 			/* Main record (+0) */
// 5539 			mem_set(buf, 0, ss);
// 5540 			mem_cpy(buf + BS_JmpBoot, "\xEB\x76\x90" "EXFAT   ", 11);	/* Boot jump code (x86), OEM name */
// 5541 			st_dword(buf + BPB_VolOfsEx, b_vol);					/* Volume offset in the physical drive [sector] */
// 5542 			st_dword(buf + BPB_TotSecEx, sz_vol);					/* Volume size [sector] */
// 5543 			st_dword(buf + BPB_FatOfsEx, b_fat - b_vol);			/* FAT offset [sector] */
// 5544 			st_dword(buf + BPB_FatSzEx, sz_fat);					/* FAT size [sector] */
// 5545 			st_dword(buf + BPB_DataOfsEx, b_data - b_vol);			/* Data offset [sector] */
// 5546 			st_dword(buf + BPB_NumClusEx, n_clst);					/* Number of clusters */
// 5547 			st_dword(buf + BPB_RootClusEx, 2 + tbl[0] + tbl[1]);	/* Root dir cluster # */
// 5548 			st_dword(buf + BPB_VolIDEx, GET_FATTIME());				/* VSN */
// 5549 			st_word(buf + BPB_FSVerEx, 0x100);						/* Filesystem version (1.00) */
// 5550 			for (buf[BPB_BytsPerSecEx] = 0, i = ss; i >>= 1; buf[BPB_BytsPerSecEx]++) ;	/* Log2 of sector size [byte] */
// 5551 			for (buf[BPB_SecPerClusEx] = 0, i = au; i >>= 1; buf[BPB_SecPerClusEx]++) ;	/* Log2 of cluster size [sector] */
// 5552 			buf[BPB_NumFATsEx] = 1;					/* Number of FATs */
// 5553 			buf[BPB_DrvNumEx] = 0x80;				/* Drive number (for int13) */
// 5554 			st_word(buf + BS_BootCodeEx, 0xFEEB);	/* Boot code (x86) */
// 5555 			st_word(buf + BS_55AA, 0xAA55);			/* Signature (placed here regardless of sector size) */
// 5556 			for (i = sum = 0; i < ss; i++) {		/* VBR checksum */
// 5557 				if (i != BPB_VolFlagEx && i != BPB_VolFlagEx + 1 && i != BPB_PercInUseEx) sum = xsum32(buf[i], sum);
// 5558 			}
// 5559 			if (disk_write(pdrv, buf, sect++, 1) != RES_OK) return FR_DISK_ERR;
// 5560 			/* Extended bootstrap record (+1..+8) */
// 5561 			mem_set(buf, 0, ss);
// 5562 			st_word(buf + ss - 2, 0xAA55);	/* Signature (placed at end of sector) */
// 5563 			for (j = 1; j < 9; j++) {
// 5564 				for (i = 0; i < ss; sum = xsum32(buf[i++], sum)) ;	/* VBR checksum */
// 5565 				if (disk_write(pdrv, buf, sect++, 1) != RES_OK) return FR_DISK_ERR;
// 5566 			}
// 5567 			/* OEM/Reserved record (+9..+10) */
// 5568 			mem_set(buf, 0, ss);
// 5569 			for ( ; j < 11; j++) {
// 5570 				for (i = 0; i < ss; sum = xsum32(buf[i++], sum)) ;	/* VBR checksum */
// 5571 				if (disk_write(pdrv, buf, sect++, 1) != RES_OK) return FR_DISK_ERR;
// 5572 			}
// 5573 			/* Sum record (+11) */
// 5574 			for (i = 0; i < ss; i += 4) st_dword(buf + i, sum);		/* Fill with checksum value */
// 5575 			if (disk_write(pdrv, buf, sect++, 1) != RES_OK) return FR_DISK_ERR;
// 5576 		}
// 5577 
// 5578 	} else
// 5579 #endif	/* FF_FS_EXFAT */
// 5580 	{	/* Create an FAT/FAT32 volume */
// 5581 		do {
// 5582 			pau = au;
// 5583 			/* Pre-determine number of clusters and FAT sub-type */
// 5584 			if (fmt == FS_FAT32) {	/* FAT32 volume */
// 5585 				if (pau == 0) {	/* au auto-selection */
// 5586 					n = sz_vol / 0x20000;	/* Volume size in unit of 128KS */
// 5587 					for (i = 0, pau = 1; cst32[i] && cst32[i] <= n; i++, pau <<= 1) ;	/* Get from table */
// 5588 				}
// 5589 				n_clst = sz_vol / pau;	/* Number of clusters */
// 5590 				sz_fat = (n_clst * 4 + 8 + ss - 1) / ss;	/* FAT size [sector] */
// 5591 				sz_rsv = 32;	/* Number of reserved sectors */
// 5592 				sz_dir = 0;		/* No static directory */
// 5593 				if (n_clst <= MAX_FAT16 || n_clst > MAX_FAT32) return FR_MKFS_ABORTED;
// 5594 			} else {				/* FAT volume */
// 5595 				if (pau == 0) {	/* au auto-selection */
// 5596 					n = sz_vol / 0x1000;	/* Volume size in unit of 4KS */
// 5597 					for (i = 0, pau = 1; cst[i] && cst[i] <= n; i++, pau <<= 1) ;	/* Get from table */
// 5598 				}
// 5599 				n_clst = sz_vol / pau;
// 5600 				if (n_clst > MAX_FAT12) {
// 5601 					n = n_clst * 2 + 4;		/* FAT size [byte] */
// 5602 				} else {
// 5603 					fmt = FS_FAT12;
// 5604 					n = (n_clst * 3 + 1) / 2 + 3;	/* FAT size [byte] */
// 5605 				}
// 5606 				sz_fat = (n + ss - 1) / ss;		/* FAT size [sector] */
// 5607 				sz_rsv = 1;						/* Number of reserved sectors */
// 5608 				sz_dir = (DWORD)n_rootdir * SZDIRE / ss;	/* Rootdir size [sector] */
// 5609 			}
// 5610 			b_fat = b_vol + sz_rsv;						/* FAT base */
// 5611 			b_data = b_fat + sz_fat * n_fats + sz_dir;	/* Data base */
// 5612 
// 5613 			/* Align data base to erase block boundary (for flash memory media) */
// 5614 			n = ((b_data + sz_blk - 1) & ~(sz_blk - 1)) - b_data;	/* Next nearest erase block from current data base */
// 5615 			if (fmt == FS_FAT32) {		/* FAT32: Move FAT base */
// 5616 				sz_rsv += n; b_fat += n;
// 5617 			} else {					/* FAT: Expand FAT size */
// 5618 				sz_fat += n / n_fats;
// 5619 			}
// 5620 
// 5621 			/* Determine number of clusters and final check of validity of the FAT sub-type */
// 5622 			if (sz_vol < b_data + pau * 16 - b_vol) return FR_MKFS_ABORTED;	/* Too small volume */
// 5623 			n_clst = (sz_vol - sz_rsv - sz_fat * n_fats - sz_dir) / pau;
// 5624 			if (fmt == FS_FAT32) {
// 5625 				if (n_clst <= MAX_FAT16) {	/* Too few clusters for FAT32 */
// 5626 					if (au == 0 && (au = pau / 2) != 0) continue;	/* Adjust cluster size and retry */
// 5627 					return FR_MKFS_ABORTED;
// 5628 				}
// 5629 			}
// 5630 			if (fmt == FS_FAT16) {
// 5631 				if (n_clst > MAX_FAT16) {	/* Too many clusters for FAT16 */
// 5632 					if (au == 0 && (pau * 2) <= 64) {
// 5633 						au = pau * 2; continue;		/* Adjust cluster size and retry */
// 5634 					}
// 5635 					if ((opt & FM_FAT32)) {
// 5636 						fmt = FS_FAT32; continue;	/* Switch type to FAT32 and retry */
// 5637 					}
// 5638 					if (au == 0 && (au = pau * 2) <= 128) continue;	/* Adjust cluster size and retry */
// 5639 					return FR_MKFS_ABORTED;
// 5640 				}
// 5641 				if  (n_clst <= MAX_FAT12) {	/* Too few clusters for FAT16 */
// 5642 					if (au == 0 && (au = pau * 2) <= 128) continue;	/* Adjust cluster size and retry */
// 5643 					return FR_MKFS_ABORTED;
// 5644 				}
// 5645 			}
// 5646 			if (fmt == FS_FAT12 && n_clst > MAX_FAT12) return FR_MKFS_ABORTED;	/* Too many clusters for FAT12 */
// 5647 
// 5648 			/* Ok, it is the valid cluster configuration */
// 5649 			break;
// 5650 		} while (1);
// 5651 
// 5652 #if FF_USE_TRIM
// 5653 		tbl[0] = b_vol; tbl[1] = b_vol + sz_vol - 1;	/* Inform the device the volume area can be erased */
// 5654 		disk_ioctl(pdrv, CTRL_TRIM, tbl);
// 5655 #endif
// 5656 		/* Create FAT VBR */
// 5657 		mem_set(buf, 0, ss);
// 5658 		mem_cpy(buf + BS_JmpBoot, "\xEB\xFE\x90" "MSDOS5.0", 11);/* Boot jump code (x86), OEM name */
// 5659 		st_word(buf + BPB_BytsPerSec, ss);				/* Sector size [byte] */
// 5660 		buf[BPB_SecPerClus] = (BYTE)pau;				/* Cluster size [sector] */
// 5661 		st_word(buf + BPB_RsvdSecCnt, (WORD)sz_rsv);	/* Size of reserved area */
// 5662 		buf[BPB_NumFATs] = (BYTE)n_fats;				/* Number of FATs */
// 5663 		st_word(buf + BPB_RootEntCnt, (WORD)((fmt == FS_FAT32) ? 0 : n_rootdir));	/* Number of root directory entries */
// 5664 		if (sz_vol < 0x10000) {
// 5665 			st_word(buf + BPB_TotSec16, (WORD)sz_vol);	/* Volume size in 16-bit LBA */
// 5666 		} else {
// 5667 			st_dword(buf + BPB_TotSec32, sz_vol);		/* Volume size in 32-bit LBA */
// 5668 		}
// 5669 		buf[BPB_Media] = 0xF8;							/* Media descriptor byte */
// 5670 		st_word(buf + BPB_SecPerTrk, 63);				/* Number of sectors per track (for int13) */
// 5671 		st_word(buf + BPB_NumHeads, 255);				/* Number of heads (for int13) */
// 5672 		st_dword(buf + BPB_HiddSec, b_vol);				/* Volume offset in the physical drive [sector] */
// 5673 		if (fmt == FS_FAT32) {
// 5674 			st_dword(buf + BS_VolID32, GET_FATTIME());	/* VSN */
// 5675 			st_dword(buf + BPB_FATSz32, sz_fat);		/* FAT size [sector] */
// 5676 			st_dword(buf + BPB_RootClus32, 2);			/* Root directory cluster # (2) */
// 5677 			st_word(buf + BPB_FSInfo32, 1);				/* Offset of FSINFO sector (VBR + 1) */
// 5678 			st_word(buf + BPB_BkBootSec32, 6);			/* Offset of backup VBR (VBR + 6) */
// 5679 			buf[BS_DrvNum32] = 0x80;					/* Drive number (for int13) */
// 5680 			buf[BS_BootSig32] = 0x29;					/* Extended boot signature */
// 5681 			mem_cpy(buf + BS_VolLab32, "NO NAME    " "FAT32   ", 19);	/* Volume label, FAT signature */
// 5682 		} else {
// 5683 			st_dword(buf + BS_VolID, GET_FATTIME());	/* VSN */
// 5684 			st_word(buf + BPB_FATSz16, (WORD)sz_fat);	/* FAT size [sector] */
// 5685 			buf[BS_DrvNum] = 0x80;						/* Drive number (for int13) */
// 5686 			buf[BS_BootSig] = 0x29;						/* Extended boot signature */
// 5687 			mem_cpy(buf + BS_VolLab, "NO NAME    " "FAT     ", 19);	/* Volume label, FAT signature */
// 5688 		}
// 5689 		st_word(buf + BS_55AA, 0xAA55);					/* Signature (offset is fixed here regardless of sector size) */
// 5690 		if (disk_write(pdrv, buf, b_vol, 1) != RES_OK) return FR_DISK_ERR;	/* Write it to the VBR sector */
// 5691 
// 5692 		/* Create FSINFO record if needed */
// 5693 		if (fmt == FS_FAT32) {
// 5694 			disk_write(pdrv, buf, b_vol + 6, 1);		/* Write backup VBR (VBR + 6) */
// 5695 			mem_set(buf, 0, ss);
// 5696 			st_dword(buf + FSI_LeadSig, 0x41615252);
// 5697 			st_dword(buf + FSI_StrucSig, 0x61417272);
// 5698 			st_dword(buf + FSI_Free_Count, n_clst - 1);	/* Number of free clusters */
// 5699 			st_dword(buf + FSI_Nxt_Free, 2);			/* Last allocated cluster# */
// 5700 			st_word(buf + BS_55AA, 0xAA55);
// 5701 			disk_write(pdrv, buf, b_vol + 7, 1);		/* Write backup FSINFO (VBR + 7) */
// 5702 			disk_write(pdrv, buf, b_vol + 1, 1);		/* Write original FSINFO (VBR + 1) */
// 5703 		}
// 5704 
// 5705 		/* Initialize FAT area */
// 5706 		mem_set(buf, 0, (UINT)szb_buf);
// 5707 		sect = b_fat;		/* FAT start sector */
// 5708 		for (i = 0; i < n_fats; i++) {			/* Initialize FATs each */
// 5709 			if (fmt == FS_FAT32) {
// 5710 				st_dword(buf + 0, 0xFFFFFFF8);	/* Entry 0 */
// 5711 				st_dword(buf + 4, 0xFFFFFFFF);	/* Entry 1 */
// 5712 				st_dword(buf + 8, 0x0FFFFFFF);	/* Entry 2 (root directory) */
// 5713 			} else {
// 5714 				st_dword(buf + 0, (fmt == FS_FAT12) ? 0xFFFFF8 : 0xFFFFFFF8);	/* Entry 0 and 1 */
// 5715 			}
// 5716 			nsect = sz_fat;		/* Number of FAT sectors */
// 5717 			do {	/* Fill FAT sectors */
// 5718 				n = (nsect > sz_buf) ? sz_buf : nsect;
// 5719 				if (disk_write(pdrv, buf, sect, (UINT)n) != RES_OK) return FR_DISK_ERR;
// 5720 				mem_set(buf, 0, ss);
// 5721 				sect += n; nsect -= n;
// 5722 			} while (nsect);
// 5723 		}
// 5724 
// 5725 		/* Initialize root directory (fill with zero) */
// 5726 		nsect = (fmt == FS_FAT32) ? pau : sz_dir;	/* Number of root directory sectors */
// 5727 		do {
// 5728 			n = (nsect > sz_buf) ? sz_buf : nsect;
// 5729 			if (disk_write(pdrv, buf, sect, (UINT)n) != RES_OK) return FR_DISK_ERR;
// 5730 			sect += n; nsect -= n;
// 5731 		} while (nsect);
// 5732 	}
// 5733 
// 5734 	/* Determine system ID in the partition table */
// 5735 	if (FF_FS_EXFAT && fmt == FS_EXFAT) {
// 5736 		sys = 0x07;			/* HPFS/NTFS/exFAT */
// 5737 	} else {
// 5738 		if (fmt == FS_FAT32) {
// 5739 			sys = 0x0C;		/* FAT32X */
// 5740 		} else {
// 5741 			if (sz_vol >= 0x10000) {
// 5742 				sys = 0x06;	/* FAT12/16 (large) */
// 5743 			} else {
// 5744 				sys = (fmt == FS_FAT16) ? 0x04 : 0x01;	/* FAT16 : FAT12 */
// 5745 			}
// 5746 		}
// 5747 	}
// 5748 
// 5749 	/* Update partition information */
// 5750 	if (FF_MULTI_PARTITION && part != 0) {	/* Created in the existing partition */
// 5751 		/* Update system ID in the partition table */
// 5752 		if (disk_read(pdrv, buf, 0, 1) != RES_OK) return FR_DISK_ERR;	/* Read the MBR */
// 5753 		buf[MBR_Table + (part - 1) * SZ_PTE + PTE_System] = sys;		/* Set system ID */
// 5754 		if (disk_write(pdrv, buf, 0, 1) != RES_OK) return FR_DISK_ERR;	/* Write it back to the MBR */
// 5755 	} else {								/* Created as a new single partition */
// 5756 		if (!(opt & FM_SFD)) {	/* Create partition table if in FDISK format */
// 5757 			mem_set(buf, 0, ss);
// 5758 			st_word(buf + BS_55AA, 0xAA55);		/* MBR signature */
// 5759 			pte = buf + MBR_Table;				/* Create partition table for single partition in the drive */
// 5760 			pte[PTE_Boot] = 0;					/* Boot indicator */
// 5761 			pte[PTE_StHead] = 1;				/* Start head */
// 5762 			pte[PTE_StSec] = 1;					/* Start sector */
// 5763 			pte[PTE_StCyl] = 0;					/* Start cylinder */
// 5764 			pte[PTE_System] = sys;				/* System type */
// 5765 			n = (b_vol + sz_vol) / (63 * 255);	/* (End CHS may be invalid) */
// 5766 			pte[PTE_EdHead] = 254;				/* End head */
// 5767 			pte[PTE_EdSec] = (BYTE)(n >> 2 | 63);	/* End sector */
// 5768 			pte[PTE_EdCyl] = (BYTE)n;			/* End cylinder */
// 5769 			st_dword(pte + PTE_StLba, b_vol);	/* Start offset in LBA */
// 5770 			st_dword(pte + PTE_SizLba, sz_vol);	/* Size in sectors */
// 5771 			if (disk_write(pdrv, buf, 0, 1) != RES_OK) return FR_DISK_ERR;	/* Write it to the MBR */
// 5772 		}
// 5773 	}
// 5774 
// 5775 	if (disk_ioctl(pdrv, CTRL_SYNC, 0) != RES_OK) return FR_DISK_ERR;
// 5776 
// 5777 	return FR_OK;
// 5778 }
// 5779 
// 5780 
// 5781 
// 5782 #if FF_MULTI_PARTITION
// 5783 /*-----------------------------------------------------------------------*/
// 5784 /* Create Partition Table on the Physical Drive                          */
// 5785 /*-----------------------------------------------------------------------*/
// 5786 
// 5787 FRESULT f_fdisk (
// 5788 	BYTE pdrv,			/* Physical drive number */
// 5789 	const DWORD* szt,	/* Pointer to the size table for each partitions */
// 5790 	void* work			/* Pointer to the working buffer */
// 5791 )
// 5792 {
// 5793 	UINT i, n, sz_cyl, tot_cyl, b_cyl, e_cyl, p_cyl;
// 5794 	BYTE s_hd, e_hd, *p, *buf = (BYTE*)work;
// 5795 	DSTATUS stat;
// 5796 	DWORD sz_disk, sz_part, s_part;
// 5797 
// 5798 
// 5799 	stat = disk_initialize(pdrv);
// 5800 	if (stat & STA_NOINIT) return FR_NOT_READY;
// 5801 	if (stat & STA_PROTECT) return FR_WRITE_PROTECTED;
// 5802 	if (disk_ioctl(pdrv, GET_SECTOR_COUNT, &sz_disk)) return FR_DISK_ERR;
// 5803 
// 5804 	/* Determine the CHS without any consideration of the drive geometry */
// 5805 	for (n = 16; n < 256 && sz_disk / n / 63 > 1024; n *= 2) ;
// 5806 	if (n == 256) n--;
// 5807 	e_hd = n - 1;
// 5808 	sz_cyl = 63 * n;
// 5809 	tot_cyl = sz_disk / sz_cyl;
// 5810 
// 5811 	/* Create partition table */
// 5812 	mem_set(buf, 0, FF_MAX_SS);
// 5813 	p = buf + MBR_Table; b_cyl = 0;
// 5814 	for (i = 0; i < 4; i++, p += SZ_PTE) {
// 5815 		p_cyl = (szt[i] <= 100U) ? (DWORD)tot_cyl * szt[i] / 100 : szt[i] / sz_cyl;	/* Number of cylinders */
// 5816 		if (p_cyl == 0) continue;
// 5817 		s_part = (DWORD)sz_cyl * b_cyl;
// 5818 		sz_part = (DWORD)sz_cyl * p_cyl;
// 5819 		if (i == 0) {	/* Exclude first track of cylinder 0 */
// 5820 			s_hd = 1;
// 5821 			s_part += 63; sz_part -= 63;
// 5822 		} else {
// 5823 			s_hd = 0;
// 5824 		}
// 5825 		e_cyl = b_cyl + p_cyl - 1;	/* End cylinder */
// 5826 		if (e_cyl >= tot_cyl) return FR_INVALID_PARAMETER;
// 5827 
// 5828 		/* Set partition table */
// 5829 		p[1] = s_hd;						/* Start head */
// 5830 		p[2] = (BYTE)((b_cyl >> 2) + 1);	/* Start sector */
// 5831 		p[3] = (BYTE)b_cyl;					/* Start cylinder */
// 5832 		p[4] = 0x07;						/* System type (temporary setting) */
// 5833 		p[5] = e_hd;						/* End head */
// 5834 		p[6] = (BYTE)((e_cyl >> 2) + 63);	/* End sector */
// 5835 		p[7] = (BYTE)e_cyl;					/* End cylinder */
// 5836 		st_dword(p + 8, s_part);			/* Start sector in LBA */
// 5837 		st_dword(p + 12, sz_part);			/* Number of sectors */
// 5838 
// 5839 		/* Next partition */
// 5840 		b_cyl += p_cyl;
// 5841 	}
// 5842 	st_word(p, 0xAA55);
// 5843 
// 5844 	/* Write it to the MBR */
// 5845 	return (disk_write(pdrv, buf, 0, 1) != RES_OK || disk_ioctl(pdrv, CTRL_SYNC, 0) != RES_OK) ? FR_DISK_ERR : FR_OK;
// 5846 }
// 5847 
// 5848 #endif /* FF_MULTI_PARTITION */
// 5849 #endif /* FF_USE_MKFS && !FF_FS_READONLY */
// 5850 
// 5851 
// 5852 
// 5853 
// 5854 #if FF_USE_STRFUNC
// 5855 /*-----------------------------------------------------------------------*/
// 5856 /* Get a String from the File                                            */
// 5857 /*-----------------------------------------------------------------------*/
// 5858 
// 5859 TCHAR* f_gets (
// 5860 	TCHAR* buff,	/* Pointer to the string buffer to read */
// 5861 	int len,		/* Size of string buffer (characters) */
// 5862 	FIL* fp			/* Pointer to the file object */
// 5863 )
// 5864 {
// 5865 	int n = 0;
// 5866 	TCHAR c, *p = buff;
// 5867 	BYTE s[2];
// 5868 	UINT rc;
// 5869 
// 5870 
// 5871 	while (n < len - 1) {	/* Read characters until buffer gets filled */
// 5872 #if FF_LFN_UNICODE && FF_USE_LFN	/* Unicode API */
// 5873 #if FF_STRF_ENCODE == 3		/* Read a character in UTF-8 */
// 5874 		f_read(fp, s, 1, &rc);
// 5875 		if (rc != 1) break;
// 5876 		c = s[0];
// 5877 		if (c >= 0x80) {
// 5878 			if (c < 0xC0) continue;	/* Skip stray trailer */
// 5879 			if (c < 0xE0) {			/* Two-byte sequence (0x80-0x7FF) */
// 5880 				f_read(fp, s, 1, &rc);
// 5881 				if (rc != 1) break;
// 5882 				c = (c & 0x1F) << 6 | (s[0] & 0x3F);
// 5883 				if (c < 0x80) c = '?';	/* Reject invalid code range */
// 5884 			} else {
// 5885 				if (c < 0xF0) {		/* Three-byte sequence (0x800-0xFFFF) */
// 5886 					f_read(fp, s, 2, &rc);
// 5887 					if (rc != 2) break;
// 5888 					c = c << 12 | (s[0] & 0x3F) << 6 | (s[1] & 0x3F);
// 5889 					if (c < 0x800) c = '?';	/* Reject invalid code range */
// 5890 				} else {			/* Reject four-byte sequence */
// 5891 					c = '?';
// 5892 				}
// 5893 			}
// 5894 		}
// 5895 #elif FF_STRF_ENCODE == 2		/* Read a character in UTF-16BE */
// 5896 		f_read(fp, s, 2, &rc);
// 5897 		if (rc != 2) break;
// 5898 		c = s[1] + (s[0] << 8);
// 5899 #elif FF_STRF_ENCODE == 1		/* Read a character in UTF-16LE */
// 5900 		f_read(fp, s, 2, &rc);
// 5901 		if (rc != 2) break;
// 5902 		c = s[0] + (s[1] << 8);
// 5903 #else							/* Read a character in ANSI/OEM */
// 5904 		f_read(fp, s, 1, &rc);
// 5905 		if (rc != 1) break;
// 5906 		c = s[0];
// 5907 		if (dbc_1st((BYTE)c)) {
// 5908 			f_read(fp, s, 1, &rc);
// 5909 			if (rc != 1) break;
// 5910 			c = (c << 8) + s[0];
// 5911 		}
// 5912 		c = ff_oem2uni(c, CODEPAGE);	/* OEM -> Unicode */
// 5913 		if (!c) c = '?';
// 5914 #endif
// 5915 #else						/* ANSI/OEM API: Read a character without conversion */
// 5916 		f_read(fp, s, 1, &rc);
// 5917 		if (rc != 1) break;
// 5918 		c = s[0];
// 5919 #endif
// 5920 		if (FF_USE_STRFUNC == 2 && c == '\r') continue;	/* Strip '\r' */
// 5921 		*p++ = c;
// 5922 		n++;
// 5923 		if (c == '\n') break;		/* Break on EOL */
// 5924 	}
// 5925 	*p = 0;
// 5926 	return n ? buff : 0;			/* When no data read (eof or error), return with error. */
// 5927 }
// 5928 
// 5929 
// 5930 
// 5931 
// 5932 #if !FF_FS_READONLY
// 5933 #include <stdarg.h>
// 5934 /*-----------------------------------------------------------------------*/
// 5935 /* Put a Character to the File                                           */
// 5936 /*-----------------------------------------------------------------------*/
// 5937 
// 5938 typedef struct {
// 5939 	FIL *fp;		/* Ptr to the writing file */
// 5940 	int idx, nchr;	/* Write index of buf[] (-1:error), number of chars written */
// 5941 	BYTE buf[64];	/* Write buffer */
// 5942 } putbuff;
// 5943 
// 5944 
// 5945 static
// 5946 void putc_bfd (		/* Buffered write with code conversion */
// 5947 	putbuff* pb,
// 5948 	TCHAR c
// 5949 )
// 5950 {
// 5951 	UINT bw;
// 5952 	int i;
// 5953 
// 5954 
// 5955 	if (FF_USE_STRFUNC == 2 && c == '\n') {	 /* LF -> CRLF conversion */
// 5956 		putc_bfd(pb, '\r');
// 5957 	}
// 5958 
// 5959 	i = pb->idx;		/* Write index of pb->buf[] */
// 5960 	if (i < 0) return;
// 5961 
// 5962 #if FF_LFN_UNICODE && FF_USE_LFN	/* Unicode API */
// 5963 #if FF_STRF_ENCODE == 3			/* Write a character in UTF-8 */
// 5964 	if (c < 0x80) {				/* 7-bit */
// 5965 		pb->buf[i++] = (BYTE)c;
// 5966 	} else {
// 5967 		if (c < 0x800) {		/* 11-bit */
// 5968 			pb->buf[i++] = (BYTE)(0xC0 | c >> 6);
// 5969 		} else {				/* 16-bit */
// 5970 			pb->buf[i++] = (BYTE)(0xE0 | c >> 12);
// 5971 			pb->buf[i++] = (BYTE)(0x80 | (c >> 6 & 0x3F));
// 5972 		}
// 5973 		pb->buf[i++] = (BYTE)(0x80 | (c & 0x3F));
// 5974 	}
// 5975 #elif FF_STRF_ENCODE == 2			/* Write a character in UTF-16BE */
// 5976 	pb->buf[i++] = (BYTE)(c >> 8);
// 5977 	pb->buf[i++] = (BYTE)c;
// 5978 #elif FF_STRF_ENCODE == 1			/* Write a character in UTF-16LE */
// 5979 	pb->buf[i++] = (BYTE)c;
// 5980 	pb->buf[i++] = (BYTE)(c >> 8);
// 5981 #else							/* Write a character in ANSI/OEM */
// 5982 	c = ff_uni2oem(c, CODEPAGE);	/* Unicode -> OEM */
// 5983 	if (!c) c = '?';
// 5984 	if (c >= 0x100)
// 5985 		pb->buf[i++] = (BYTE)(c >> 8);
// 5986 	pb->buf[i++] = (BYTE)c;
// 5987 #endif
// 5988 #else							/* ANSI/OEM API: Write a character without conversion */
// 5989 	pb->buf[i++] = (BYTE)c;
// 5990 #endif
// 5991 
// 5992 	if (i >= (int)(sizeof pb->buf) - 3) {	/* Write buffered characters to the file */
// 5993 		f_write(pb->fp, pb->buf, (UINT)i, &bw);
// 5994 		i = (bw == (UINT)i) ? 0 : -1;
// 5995 	}
// 5996 	pb->idx = i;
// 5997 	pb->nchr++;
// 5998 }
// 5999 
// 6000 
// 6001 static
// 6002 int putc_flush (		/* Flush left characters in the buffer */
// 6003 	putbuff* pb
// 6004 )
// 6005 {
// 6006 	UINT nw;
// 6007 
// 6008 	if (   pb->idx >= 0	/* Flush buffered characters to the file */
// 6009 		&& f_write(pb->fp, pb->buf, (UINT)pb->idx, &nw) == FR_OK
// 6010 		&& (UINT)pb->idx == nw) return pb->nchr;
// 6011 	return EOF;
// 6012 }
// 6013 
// 6014 
// 6015 static
// 6016 void putc_init (		/* Initialize write buffer */
// 6017 	putbuff* pb,
// 6018 	FIL* fp
// 6019 )
// 6020 {
// 6021 	pb->fp = fp;
// 6022 	pb->nchr = pb->idx = 0;
// 6023 }
// 6024 
// 6025 
// 6026 
// 6027 int f_putc (
// 6028 	TCHAR c,	/* A character to be output */
// 6029 	FIL* fp		/* Pointer to the file object */
// 6030 )
// 6031 {
// 6032 	putbuff pb;
// 6033 
// 6034 
// 6035 	putc_init(&pb, fp);
// 6036 	putc_bfd(&pb, c);	/* Put the character */
// 6037 	return putc_flush(&pb);
// 6038 }
// 6039 
// 6040 
// 6041 
// 6042 
// 6043 /*-----------------------------------------------------------------------*/
// 6044 /* Put a String to the File                                              */
// 6045 /*-----------------------------------------------------------------------*/
// 6046 
// 6047 int f_puts (
// 6048 	const TCHAR* str,	/* Pointer to the string to be output */
// 6049 	FIL* fp				/* Pointer to the file object */
// 6050 )
// 6051 {
// 6052 	putbuff pb;
// 6053 
// 6054 
// 6055 	putc_init(&pb, fp);
// 6056 	while (*str) putc_bfd(&pb, *str++);		/* Put the string */
// 6057 	return putc_flush(&pb);
// 6058 }
// 6059 
// 6060 
// 6061 
// 6062 
// 6063 /*-----------------------------------------------------------------------*/
// 6064 /* Put a Formatted String to the File                                    */
// 6065 /*-----------------------------------------------------------------------*/
// 6066 
// 6067 int f_printf (
// 6068 	FIL* fp,			/* Pointer to the file object */
// 6069 	const TCHAR* fmt,	/* Pointer to the format string */
// 6070 	...					/* Optional arguments... */
// 6071 )
// 6072 {
// 6073 	va_list arp;
// 6074 	putbuff pb;
// 6075 	BYTE f, r;
// 6076 	UINT i, j, w;
// 6077 	DWORD v;
// 6078 	TCHAR c, d, str[32], *p;
// 6079 
// 6080 
// 6081 	putc_init(&pb, fp);
// 6082 
// 6083 	va_start(arp, fmt);
// 6084 
// 6085 	for (;;) {
// 6086 		c = *fmt++;
// 6087 		if (c == 0) break;			/* End of string */
// 6088 		if (c != '%') {				/* Non escape character */
// 6089 			putc_bfd(&pb, c);
// 6090 			continue;
// 6091 		}
// 6092 		w = f = 0;
// 6093 		c = *fmt++;
// 6094 		if (c == '0') {				/* Flag: '0' padding */
// 6095 			f = 1; c = *fmt++;
// 6096 		} else {
// 6097 			if (c == '-') {			/* Flag: left justified */
// 6098 				f = 2; c = *fmt++;
// 6099 			}
// 6100 		}
// 6101 		while (IsDigit(c)) {		/* Precision */
// 6102 			w = w * 10 + c - '0';
// 6103 			c = *fmt++;
// 6104 		}
// 6105 		if (c == 'l' || c == 'L') {	/* Prefix: Size is long int */
// 6106 			f |= 4; c = *fmt++;
// 6107 		}
// 6108 		if (!c) break;
// 6109 		d = c;
// 6110 		if (IsLower(d)) d -= 0x20;
// 6111 		switch (d) {				/* Type is... */
// 6112 		case 'S' :					/* String */
// 6113 			p = va_arg(arp, TCHAR*);
// 6114 			for (j = 0; p[j]; j++) ;
// 6115 			if (!(f & 2)) {						/* Right pad */
// 6116 				while (j++ < w) putc_bfd(&pb, ' ');
// 6117 			}
// 6118 			while (*p) putc_bfd(&pb, *p++);		/* String body */
// 6119 			while (j++ < w) putc_bfd(&pb, ' ');	/* Left pad */
// 6120 			continue;
// 6121 
// 6122 		case 'C' :					/* Character */
// 6123 			putc_bfd(&pb, (TCHAR)va_arg(arp, int)); continue;
// 6124 
// 6125 		case 'B' :					/* Binary */
// 6126 			r = 2; break;
// 6127 
// 6128 		case 'O' :					/* Octal */
// 6129 			r = 8; break;
// 6130 
// 6131 		case 'D' :					/* Signed decimal */
// 6132 		case 'U' :					/* Unsigned decimal */
// 6133 			r = 10; break;
// 6134 
// 6135 		case 'X' :					/* Hexdecimal */
// 6136 			r = 16; break;
// 6137 
// 6138 		default:					/* Unknown type (pass-through) */
// 6139 			putc_bfd(&pb, c); continue;
// 6140 		}
// 6141 
// 6142 		/* Get an argument and put it in numeral */
// 6143 		v = (f & 4) ? (DWORD)va_arg(arp, long) : ((d == 'D') ? (DWORD)(long)va_arg(arp, int) : (DWORD)va_arg(arp, unsigned int));
// 6144 		if (d == 'D' && (v & 0x80000000)) {
// 6145 			v = 0 - v;
// 6146 			f |= 8;
// 6147 		}
// 6148 		i = 0;
// 6149 		do {
// 6150 			d = (TCHAR)(v % r); v /= r;
// 6151 			if (d > 9) d += (c == 'x') ? 0x27 : 0x07;
// 6152 			str[i++] = d + '0';
// 6153 		} while (v && i < sizeof str / sizeof *str);
// 6154 		if (f & 8) str[i++] = '-';
// 6155 		j = i; d = (f & 1) ? '0' : ' ';
// 6156 		if (!(f & 2)) {
// 6157 			while (j++ < w) putc_bfd(&pb, d);	/* Right pad */
// 6158 		}
// 6159 		do {
// 6160 			putc_bfd(&pb, str[--i]);			/* Number body */
// 6161 		} while (i);
// 6162 		while (j++ < w) putc_bfd(&pb, d);		/* Left pad */
// 6163 	}
// 6164 
// 6165 	va_end(arp);
// 6166 
// 6167 	return putc_flush(&pb);
// 6168 }
// 6169 
// 6170 #endif /* !FF_FS_READONLY */
// 6171 #endif /* FF_USE_STRFUNC */
// 6172 
// 6173 
// 6174 
// 6175 #if FF_CODE_PAGE == 0
// 6176 /*-----------------------------------------------------------------------*/
// 6177 /* Set Active Codepage for the Path Name                                 */
// 6178 /*-----------------------------------------------------------------------*/
// 6179 
// 6180 FRESULT f_setcp (
// 6181 	WORD cp		/* Value to be set as active code page */
// 6182 )
// 6183 {
// 6184 	static const WORD       validcp[] = {  437,   720,   737,   771,   775,   850,   852,   857,   860,   861,   862,   863,   864,   865,   866,   869,   932,   936,   949,   950, 0};
// 6185 	static const BYTE *const tables[] = {Ct437, Ct720, Ct737, Ct771, Ct775, Ct850, Ct852, Ct857, Ct860, Ct861, Ct862, Ct863, Ct864, Ct865, Ct866, Ct869, Dc932, Dc936, Dc949, Dc950, 0};
// 6186 	UINT i;
// 6187 
// 6188 
// 6189 	for (i = 0; validcp[i] != 0 && validcp[i] != cp; i++) ;	/* Find the code page */
// 6190 	if (validcp[i] != cp) return FR_INVALID_PARAMETER;
// 6191 
// 6192 	CodePage = cp;
// 6193 	if (cp >= 900) {	/* DBCS */
// 6194 		ExCvt = 0;
// 6195 		DbcTbl = tables[i];
// 6196 	} else {			/* SBCS */
// 6197 		ExCvt = tables[i];
// 6198 		DbcTbl = 0;
// 6199 	}
// 6200 	return FR_OK;
// 6201 }
// 6202 #endif	/* FF_CODE_PAGE == 0 */
// 6203 
// 6204 
// 
//     6 bytes in section .bss
//    40 bytes in section .rodata
// 7 932 bytes in section .text
// 
// 7 932 bytes of CODE  memory
//    40 bytes of CONST memory
//     6 bytes of DATA  memory
//
//Errors: none
//Warnings: none
