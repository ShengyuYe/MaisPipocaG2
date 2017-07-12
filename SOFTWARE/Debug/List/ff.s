///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     12/Jul/2017  11:51:20 /
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

        PUBLIC clust2sect
        PUBLIC f_chmod
        PUBLIC f_close
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
        PUBLIC f_utime
        PUBLIC f_write
        PUBLIC ff_convert
        PUBLIC ff_wtoupper
        PUBLIC gen_numname
        PUBLIC get_fat
        PUBLIC put_fat
        
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
//    2 /  FatFs - FAT file system module  R0.08b                 (C)ChaN, 2011
//    3 /-----------------------------------------------------------------------------/
//    4 / FatFs module is a generic FAT file system module for small embedded systems.
//    5 / This is a free software that opened for education, research and commercial
//    6 / developments under license policy of following terms.
//    7 /
//    8 /  Copyright (C) 2011, ChaN, all right reserved.
//    9 /
//   10 / * The FatFs module is a free software and there is NO WARRANTY.
//   11 / * No restriction on use. You can use, modify and redistribute it for
//   12 /   personal, non-profit or commercial products UNDER YOUR RESPONSIBILITY.
//   13 / * Redistributions of source code must retain the above copyright notice.
//   14 /
//   15 /-----------------------------------------------------------------------------/
//   16 / Feb 26,'06 R0.00  Prototype.
//   17 /
//   18 / Apr 29,'06 R0.01  First stable version.
//   19 /
//   20 / Jun 01,'06 R0.02  Added FAT12 support.
//   21 /                   Removed unbuffered mode.
//   22 /                   Fixed a problem on small (<32M) partition.
//   23 / Jun 10,'06 R0.02a Added a configuration option (_FS_MINIMUM).
//   24 /
//   25 / Sep 22,'06 R0.03  Added f_rename().
//   26 /                   Changed option _FS_MINIMUM to _FS_MINIMIZE.
//   27 / Dec 11,'06 R0.03a Improved cluster scan algorithm to write files fast.
//   28 /                   Fixed f_mkdir() creates incorrect directory on FAT32.
//   29 /
//   30 / Feb 04,'07 R0.04  Supported multiple drive system.
//   31 /                   Changed some interfaces for multiple drive system.
//   32 /                   Changed f_mountdrv() to f_mount().
//   33 /                   Added f_mkfs().
//   34 / Apr 01,'07 R0.04a Supported multiple partitions on a physical drive.
//   35 /                   Added a capability of extending file size to f_lseek().
//   36 /                   Added minimization level 3.
//   37 /                   Fixed an endian sensitive code in f_mkfs().
//   38 / May 05,'07 R0.04b Added a configuration option _USE_NTFLAG.
//   39 /                   Added FSInfo support.
//   40 /                   Fixed DBCS name can result FR_INVALID_NAME.
//   41 /                   Fixed short seek (<= csize) collapses the file object.
//   42 /
//   43 / Aug 25,'07 R0.05  Changed arguments of f_read(), f_write() and f_mkfs().
//   44 /                   Fixed f_mkfs() on FAT32 creates incorrect FSInfo.
//   45 /                   Fixed f_mkdir() on FAT32 creates incorrect directory.
//   46 / Feb 03,'08 R0.05a Added f_truncate() and f_utime().
//   47 /                   Fixed off by one error at FAT sub-type determination.
//   48 /                   Fixed btr in f_read() can be mistruncated.
//   49 /                   Fixed cached sector is not flushed when create and close without write.
//   50 /
//   51 / Apr 01,'08 R0.06  Added fputc(), fputs(), fprintf() and fgets().
//   52 /                   Improved performance of f_lseek() on moving to the same or following cluster.
//   53 /
//   54 / Apr 01,'09 R0.07  Merged Tiny-FatFs as a configuration option. (_FS_TINY)
//   55 /                   Added long file name feature.
//   56 /                   Added multiple code page feature.
//   57 /                   Added re-entrancy for multitask operation.
//   58 /                   Added auto cluster size selection to f_mkfs().
//   59 /                   Added rewind option to f_readdir().
//   60 /                   Changed result code of critical errors.
//   61 /                   Renamed string functions to avoid name collision.
//   62 / Apr 14,'09 R0.07a Separated out OS dependent code on reentrant cfg.
//   63 /                   Added multiple sector size feature.
//   64 / Jun 21,'09 R0.07c Fixed f_unlink() can return FR_OK on error.
//   65 /                   Fixed wrong cache control in f_lseek().
//   66 /                   Added relative path feature.
//   67 /                   Added f_chdir() and f_chdrive().
//   68 /                   Added proper case conversion to extended char.
//   69 / Nov 03,'09 R0.07e Separated out configuration options from ff.h to ffconf.h.
//   70 /                   Fixed f_unlink() fails to remove a sub-dir on _FS_RPATH.
//   71 /                   Fixed name matching error on the 13 char boundary.
//   72 /                   Added a configuration option, _LFN_UNICODE.
//   73 /                   Changed f_readdir() to return the SFN with always upper case on non-LFN cfg.
//   74 /
//   75 / May 15,'10 R0.08  Added a memory configuration option. (_USE_LFN = 3)
//   76 /                   Added file lock feature. (_FS_SHARE)
//   77 /                   Added fast seek feature. (_USE_FASTSEEK)
//   78 /                   Changed some types on the API, XCHAR->TCHAR.
//   79 /                   Changed fname member in the FILINFO structure on Unicode cfg.
//   80 /                   String functions support UTF-8 encoding files on Unicode cfg.
//   81 / Aug 16,'10 R0.08a Added f_getcwd(). (_FS_RPATH = 2)
//   82 /                   Added sector erase feature. (_USE_ERASE)
//   83 /                   Moved file lock semaphore table from fs object to the bss.
//   84 /                   Fixed a wrong directory entry is created on non-LFN cfg when the given name contains ';'.
//   85 /                   Fixed f_mkfs() creates wrong FAT32 volume.
//   86 / Jan 15,'11 R0.08b Fast seek feature is also applied to f_read() and f_write().
//   87 /                   f_lseek() reports required table size on creating CLMP.
//   88 /                   Extended format syntax of f_printf function.
//   89 /                   Ignores duplicated directory separators in given path names.
//   90 /---------------------------------------------------------------------------*/
//   91 
//   92 #include "ff.h"			/* FatFs configurations and declarations */
//   93 #include "diskio.h"		/* Declarations of low level disk I/O functions */
//   94 
//   95 
//   96 /*--------------------------------------------------------------------------
//   97 
//   98    Module Private Definitions
//   99 
//  100 ---------------------------------------------------------------------------*/
//  101 
//  102 #if _FATFS != 8237
//  103 #error Wrong include file (ff.h).
//  104 #endif
//  105 
//  106 
//  107 /* Definitions on sector size */
//  108 #if _MAX_SS != 512 && _MAX_SS != 1024 && _MAX_SS != 2048 && _MAX_SS != 4096
//  109 #error Wrong sector size.
//  110 #endif
//  111 #if _MAX_SS != 512
//  112 #define	SS(fs)	((fs)->ssize)	/* Multiple sector size */
//  113 #else
//  114 #define	SS(fs)	512U			/* Fixed sector size */
//  115 #endif
//  116 
//  117 
//  118 /* Reentrancy related */
//  119 #if _FS_REENTRANT
//  120 #if _USE_LFN == 1
//  121 #error Static LFN work area must not be used in re-entrant configuration.
//  122 #endif
//  123 #define	ENTER_FF(fs)		{ if (!lock_fs(fs)) return FR_TIMEOUT; }
//  124 #define	LEAVE_FF(fs, res)	{ unlock_fs(fs, res); return res; }
//  125 #else
//  126 #define	ENTER_FF(fs)
//  127 #define LEAVE_FF(fs, res)	return res
//  128 #endif
//  129 
//  130 #define	ABORT(fs, res)		{ fp->flag |= FA__ERROR; LEAVE_FF(fs, res); }
//  131 
//  132 
//  133 /* File shareing feature */
//  134 #if _FS_SHARE
//  135 #if _FS_READONLY
//  136 #error _FS_SHARE must be 0 on read-only cfg.
//  137 #endif
//  138 typedef struct {
//  139 	FATFS *fs;				/* File ID 1, volume (NULL:blank entry) */
//  140 	DWORD clu;				/* File ID 2, directory */
//  141 	WORD idx;				/* File ID 3, directory index */
//  142 	WORD ctr;				/* File open counter, 0:none, 0x01..0xFF:read open count, 0x100:write mode */
//  143 } FILESEM;
//  144 #endif
//  145 
//  146 
//  147 /* Misc definitions */
//  148 #define LD_CLUST(dir)	(((DWORD)LD_WORD(dir+DIR_FstClusHI)<<16) | LD_WORD(dir+DIR_FstClusLO))
//  149 #define ST_CLUST(dir,cl) {ST_WORD(dir+DIR_FstClusLO, cl); ST_WORD(dir+DIR_FstClusHI, (DWORD)cl>>16);}
//  150 
//  151 
//  152 /* DBCS code ranges and SBCS extend char conversion table */
//  153 
//  154 #if _CODE_PAGE == 932	/* Japanese Shift-JIS */
//  155 #define _DF1S	0x81	/* DBC 1st byte range 1 start */
//  156 #define _DF1E	0x9F	/* DBC 1st byte range 1 end */
//  157 #define _DF2S	0xE0	/* DBC 1st byte range 2 start */
//  158 #define _DF2E	0xFC	/* DBC 1st byte range 2 end */
//  159 #define _DS1S	0x40	/* DBC 2nd byte range 1 start */
//  160 #define _DS1E	0x7E	/* DBC 2nd byte range 1 end */
//  161 #define _DS2S	0x80	/* DBC 2nd byte range 2 start */
//  162 #define _DS2E	0xFC	/* DBC 2nd byte range 2 end */
//  163 
//  164 #elif _CODE_PAGE == 936	/* Simplified Chinese GBK */
//  165 #define _DF1S	0x81
//  166 #define _DF1E	0xFE
//  167 #define _DS1S	0x40
//  168 #define _DS1E	0x7E
//  169 #define _DS2S	0x80
//  170 #define _DS2E	0xFE
//  171 
//  172 #elif _CODE_PAGE == 949	/* Korean */
//  173 #define _DF1S	0x81
//  174 #define _DF1E	0xFE
//  175 #define _DS1S	0x41
//  176 #define _DS1E	0x5A
//  177 #define _DS2S	0x61
//  178 #define _DS2E	0x7A
//  179 #define _DS3S	0x81
//  180 #define _DS3E	0xFE
//  181 
//  182 #elif _CODE_PAGE == 950	/* Traditional Chinese Big5 */
//  183 #define _DF1S	0x81
//  184 #define _DF1E	0xFE
//  185 #define _DS1S	0x40
//  186 #define _DS1E	0x7E
//  187 #define _DS2S	0xA1
//  188 #define _DS2E	0xFE
//  189 
//  190 #elif _CODE_PAGE == 437	/* U.S. (OEM) */
//  191 #define _DF1S	0
//  192 #define _EXCVT {0x80,0x9A,0x90,0x41,0x8E,0x41,0x8F,0x80,0x45,0x45,0x45,0x49,0x49,0x49,0x8E,0x8F,0x90,0x92,0x92,0x4F,0x99,0x4F,0x55,0x55,0x59,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  193 				0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  194 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  195 				0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  196 
//  197 #elif _CODE_PAGE == 720	/* Arabic (OEM) */
//  198 #define _DF1S	0
//  199 #define _EXCVT {0x80,0x81,0x45,0x41,0x84,0x41,0x86,0x43,0x45,0x45,0x45,0x49,0x49,0x8D,0x8E,0x8F,0x90,0x92,0x92,0x93,0x94,0x95,0x49,0x49,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  200 				0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  201 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  202 				0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  203 
//  204 #elif _CODE_PAGE == 737	/* Greek (OEM) */
//  205 #define _DF1S	0
//  206 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x92,0x92,0x93,0x94,0x95,0x96,0x97,0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87, \ 
//  207 				0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0xAA,0x92,0x93,0x94,0x95,0x96,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  208 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  209 				0x97,0xEA,0xEB,0xEC,0xE4,0xED,0xEE,0xE7,0xE8,0xF1,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  210 
//  211 #elif _CODE_PAGE == 775	/* Baltic (OEM) */
//  212 #define _DF1S	0
//  213 #define _EXCVT {0x80,0x9A,0x91,0xA0,0x8E,0x95,0x8F,0x80,0xAD,0xED,0x8A,0x8A,0xA1,0x8D,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0x95,0x96,0x97,0x97,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \ 
//  214 				0xA0,0xA1,0xE0,0xA3,0xA3,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  215 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xB5,0xB6,0xB7,0xB8,0xBD,0xBE,0xC6,0xC7,0xA5,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  216 				0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE3,0xE8,0xE8,0xEA,0xEA,0xEE,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  217 
//  218 #elif _CODE_PAGE == 850	/* Multilingual Latin 1 (OEM) */
//  219 #define _DF1S	0
//  220 #define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0xDE,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x59,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \ 
//  221 				0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  222 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  223 				0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE7,0xE9,0xEA,0xEB,0xED,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  224 
//  225 #elif _CODE_PAGE == 852	/* Latin 2 (OEM) */
//  226 #define _DF1S	0
//  227 #define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xDE,0x8F,0x80,0x9D,0xD3,0x8A,0x8A,0xD7,0x8D,0x8E,0x8F,0x90,0x91,0x91,0xE2,0x99,0x95,0x95,0x97,0x97,0x99,0x9A,0x9B,0x9B,0x9D,0x9E,0x9F, \ 
//  228 				0xB5,0xD6,0xE0,0xE9,0xA4,0xA4,0xA6,0xA6,0xA8,0xA8,0xAA,0x8D,0xAC,0xB8,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBD,0xBF, \ 
//  229 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC6,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD2,0xD3,0xD2,0xD5,0xD6,0xD7,0xB7,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  230 				0xE0,0xE1,0xE2,0xE3,0xE3,0xD5,0xE6,0xE6,0xE8,0xE9,0xE8,0xEB,0xED,0xED,0xDD,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xEB,0xFC,0xFC,0xFE,0xFF}
//  231 
//  232 #elif _CODE_PAGE == 855	/* Cyrillic (OEM) */
//  233 #define _DF1S	0
//  234 #define _EXCVT {0x81,0x81,0x83,0x83,0x85,0x85,0x87,0x87,0x89,0x89,0x8B,0x8B,0x8D,0x8D,0x8F,0x8F,0x91,0x91,0x93,0x93,0x95,0x95,0x97,0x97,0x99,0x99,0x9B,0x9B,0x9D,0x9D,0x9F,0x9F, \ 
//  235 				0xA1,0xA1,0xA3,0xA3,0xA5,0xA5,0xA7,0xA7,0xA9,0xA9,0xAB,0xAB,0xAD,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB6,0xB6,0xB8,0xB8,0xB9,0xBA,0xBB,0xBC,0xBE,0xBE,0xBF, \ 
//  236 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD3,0xD3,0xD5,0xD5,0xD7,0xD7,0xDD,0xD9,0xDA,0xDB,0xDC,0xDD,0xE0,0xDF, \ 
//  237 				0xE0,0xE2,0xE2,0xE4,0xE4,0xE6,0xE6,0xE8,0xE8,0xEA,0xEA,0xEC,0xEC,0xEE,0xEE,0xEF,0xF0,0xF2,0xF2,0xF4,0xF4,0xF6,0xF6,0xF8,0xF8,0xFA,0xFA,0xFC,0xFC,0xFD,0xFE,0xFF}
//  238 
//  239 #elif _CODE_PAGE == 857	/* Turkish (OEM) */
//  240 #define _DF1S	0
//  241 #define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0x98,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x98,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9E, \ 
//  242 				0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA6,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  243 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  244 				0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xDE,0x59,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  245 
//  246 #elif _CODE_PAGE == 858	/* Multilingual Latin 1 + Euro (OEM) */
//  247 #define _DF1S	0
//  248 #define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0xDE,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x59,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \ 
//  249 				0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  250 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  251 				0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE7,0xE9,0xEA,0xEB,0xED,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  252 
//  253 #elif _CODE_PAGE == 862	/* Hebrew (OEM) */
//  254 #define _DF1S	0
//  255 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  256 				0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  257 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  258 				0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  259 
//  260 #elif _CODE_PAGE == 866	/* Russian (OEM) */
//  261 #define _DF1S	0
//  262 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  263 				0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  264 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  265 				0x90,0x91,0x92,0x93,0x9d,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F,0xF0,0xF0,0xF2,0xF2,0xF4,0xF4,0xF6,0xF6,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  266 
//  267 #elif _CODE_PAGE == 874	/* Thai (OEM, Windows) */
//  268 #define _DF1S	0
//  269 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  270 				0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  271 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  272 				0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  273 
//  274 #elif _CODE_PAGE == 1250 /* Central Europe (Windows) */
//  275 #define _DF1S	0
//  276 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x8D,0x8E,0x8F, \ 
//  277 				0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xA3,0xB4,0xB5,0xB6,0xB7,0xB8,0xA5,0xAA,0xBB,0xBC,0xBD,0xBC,0xAF, \ 
//  278 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  279 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xFF}
//  280 
//  281 #elif _CODE_PAGE == 1251 /* Cyrillic (Windows) */
//  282 #define _DF1S	0
//  283 #define _EXCVT {0x80,0x81,0x82,0x82,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x80,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x8D,0x8E,0x8F, \ 
//  284 				0xA0,0xA2,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB2,0xA5,0xB5,0xB6,0xB7,0xA8,0xB9,0xAA,0xBB,0xA3,0xBD,0xBD,0xAF, \ 
//  285 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  286 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF}
//  287 
//  288 #elif _CODE_PAGE == 1252 /* Latin 1 (Windows) */
//  289 #define _DF1S	0
//  290 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0xAd,0x9B,0x8C,0x9D,0xAE,0x9F, \ 
//  291 				0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  292 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  293 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0x9F}
//  294 
//  295 #elif _CODE_PAGE == 1253 /* Greek (Windows) */
//  296 #define _DF1S	0
//  297 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  298 				0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  299 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xA2,0xB8,0xB9,0xBA, \ 
//  300 				0xE0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xF2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xFB,0xBC,0xFD,0xBF,0xFF}
//  301 
//  302 #elif _CODE_PAGE == 1254 /* Turkish (Windows) */
//  303 #define _DF1S	0
//  304 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x9D,0x9E,0x9F, \ 
//  305 				0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  306 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  307 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0x9F}
//  308 
//  309 #elif _CODE_PAGE == 1255 /* Hebrew (Windows) */
//  310 #define _DF1S	0
//  311 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  312 				0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  313 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  314 				0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  315 
//  316 #elif _CODE_PAGE == 1256 /* Arabic (Windows) */
//  317 #define _DF1S	0
//  318 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x8C,0x9D,0x9E,0x9F, \ 
//  319 				0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  320 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  321 				0x41,0xE1,0x41,0xE3,0xE4,0xE5,0xE6,0x43,0x45,0x45,0x45,0x45,0xEC,0xED,0x49,0x49,0xF0,0xF1,0xF2,0xF3,0x4F,0xF5,0xF6,0xF7,0xF8,0x55,0xFA,0x55,0x55,0xFD,0xFE,0xFF}
//  322 
//  323 #elif _CODE_PAGE == 1257 /* Baltic (Windows) */
//  324 #define _DF1S	0
//  325 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  326 				0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xA8,0xB9,0xAA,0xBB,0xBC,0xBD,0xBE,0xAF, \ 
//  327 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  328 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xFF}
//  329 
//  330 #elif _CODE_PAGE == 1258 /* Vietnam (OEM, Windows) */
//  331 #define _DF1S	0
//  332 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0xAC,0x9D,0x9E,0x9F, \ 
//  333 				0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  334 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  335 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xEC,0xCD,0xCE,0xCF,0xD0,0xD1,0xF2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xFE,0x9F}
//  336 
//  337 #elif _CODE_PAGE == 1	/* ASCII (for only non-LFN cfg) */
//  338 #if _USE_LFN
//  339 #error Cannot use LFN feature without valid code page.
//  340 #endif
//  341 #define _DF1S	0
//  342 
//  343 #else
//  344 #error Unknown code page
//  345 
//  346 #endif
//  347 
//  348 
//  349 /* Character code support macros */
//  350 #define IsUpper(c)	(((c)>='A')&&((c)<='Z'))
//  351 #define IsLower(c)	(((c)>='a')&&((c)<='z'))
//  352 #define IsDigit(c)	(((c)>='0')&&((c)<='9'))
//  353 
//  354 #if _DF1S		/* Code page is DBCS */
//  355 
//  356 #ifdef _DF2S	/* Two 1st byte areas */
//  357 #define IsDBCS1(c)	(((BYTE)(c) >= _DF1S && (BYTE)(c) <= _DF1E) || ((BYTE)(c) >= _DF2S && (BYTE)(c) <= _DF2E))
//  358 #else			/* One 1st byte area */
//  359 #define IsDBCS1(c)	((BYTE)(c) >= _DF1S && (BYTE)(c) <= _DF1E)
//  360 #endif
//  361 
//  362 #ifdef _DS3S	/* Three 2nd byte areas */
//  363 #define IsDBCS2(c)	(((BYTE)(c) >= _DS1S && (BYTE)(c) <= _DS1E) || ((BYTE)(c) >= _DS2S && (BYTE)(c) <= _DS2E) || ((BYTE)(c) >= _DS3S && (BYTE)(c) <= _DS3E))
//  364 #else			/* Two 2nd byte areas */
//  365 #define IsDBCS2(c)	(((BYTE)(c) >= _DS1S && (BYTE)(c) <= _DS1E) || ((BYTE)(c) >= _DS2S && (BYTE)(c) <= _DS2E))
//  366 #endif
//  367 
//  368 #else			/* Code page is SBCS */
//  369 
//  370 #define IsDBCS1(c)	0
//  371 #define IsDBCS2(c)	0
//  372 
//  373 #endif /* _DF1S */
//  374 
//  375 
//  376 /* Name status flags */
//  377 #define NS			11		/* Index of name status byte in fn[] */
//  378 #define NS_LOSS		0x01	/* Out of 8.3 format */
//  379 #define NS_LFN		0x02	/* Force to create LFN entry */
//  380 #define NS_LAST		0x04	/* Last segment */
//  381 #define NS_BODY		0x08	/* Lower case flag (body) */
//  382 #define NS_EXT		0x10	/* Lower case flag (ext) */
//  383 #define NS_DOT		0x20	/* Dot entry */
//  384 
//  385 
//  386 /* FAT sub-type boundaries */
//  387 /* Note that the FAT spec by Microsoft says 4085 but Windows works with 4087! */
//  388 #define MIN_FAT16	4086	/* Minimum number of clusters for FAT16 */
//  389 #define	MIN_FAT32	65526	/* Minimum number of clusters for FAT32 */
//  390 
//  391 
//  392 /* FatFs refers the members in the FAT structures as byte array instead of
//  393 / structure member because the structure is not binary compatible between
//  394 / different platforms */
//  395 
//  396 #define BS_jmpBoot			0	/* Jump instruction (3) */
//  397 #define BS_OEMName			3	/* OEM name (8) */
//  398 #define BPB_BytsPerSec		11	/* Sector size [byte] (2) */
//  399 #define BPB_SecPerClus		13	/* Cluster size [sector] (1) */
//  400 #define BPB_RsvdSecCnt		14	/* Size of reserved area [sector] (2) */
//  401 #define BPB_NumFATs			16	/* Number of FAT copies (1) */
//  402 #define BPB_RootEntCnt		17	/* Number of root dir entries for FAT12/16 (2) */
//  403 #define BPB_TotSec16		19	/* Volume size [sector] (2) */
//  404 #define BPB_Media			21	/* Media descriptor (1) */
//  405 #define BPB_FATSz16			22	/* FAT size [sector] (2) */
//  406 #define BPB_SecPerTrk		24	/* Track size [sector] (2) */
//  407 #define BPB_NumHeads		26	/* Number of heads (2) */
//  408 #define BPB_HiddSec			28	/* Number of special hidden sectors (4) */
//  409 #define BPB_TotSec32		32	/* Volume size [sector] (4) */
//  410 #define BS_DrvNum			36	/* Physical drive number (2) */
//  411 #define BS_BootSig			38	/* Extended boot signature (1) */
//  412 #define BS_VolID			39	/* Volume serial number (4) */
//  413 #define BS_VolLab			43	/* Volume label (8) */
//  414 #define BS_FilSysType		54	/* File system type (1) */
//  415 #define BPB_FATSz32			36	/* FAT size [sector] (4) */
//  416 #define BPB_ExtFlags		40	/* Extended flags (2) */
//  417 #define BPB_FSVer			42	/* File system version (2) */
//  418 #define BPB_RootClus		44	/* Root dir first cluster (4) */
//  419 #define BPB_FSInfo			48	/* Offset of FSInfo sector (2) */
//  420 #define BPB_BkBootSec		50	/* Offset of backup boot sectot (2) */
//  421 #define BS_DrvNum32			64	/* Physical drive number (2) */
//  422 #define BS_BootSig32		66	/* Extended boot signature (1) */
//  423 #define BS_VolID32			67	/* Volume serial number (4) */
//  424 #define BS_VolLab32			71	/* Volume label (8) */
//  425 #define BS_FilSysType32		82	/* File system type (1) */
//  426 #define	FSI_LeadSig			0	/* FSI: Leading signature (4) */
//  427 #define	FSI_StrucSig		484	/* FSI: Structure signature (4) */
//  428 #define	FSI_Free_Count		488	/* FSI: Number of free clusters (4) */
//  429 #define	FSI_Nxt_Free		492	/* FSI: Last allocated cluster (4) */
//  430 #define MBR_Table			446	/* MBR: Partition table offset (2) */
//  431 #define	SZ_PTE				16	/* MBR: Size of a partition table entry */
//  432 #define BS_55AA				510	/* Boot sector signature (2) */
//  433 
//  434 #define	DIR_Name			0	/* Short file name (11) */
//  435 #define	DIR_Attr			11	/* Attribute (1) */
//  436 #define	DIR_NTres			12	/* NT flag (1) */
//  437 #define	DIR_CrtTime			14	/* Created time (2) */
//  438 #define	DIR_CrtDate			16	/* Created date (2) */
//  439 #define	DIR_FstClusHI		20	/* Higher 16-bit of first cluster (2) */
//  440 #define	DIR_WrtTime			22	/* Modified time (2) */
//  441 #define	DIR_WrtDate			24	/* Modified date (2) */
//  442 #define	DIR_FstClusLO		26	/* Lower 16-bit of first cluster (2) */
//  443 #define	DIR_FileSize		28	/* File size (4) */
//  444 #define	LDIR_Ord			0	/* LFN entry order and LLE flag (1) */
//  445 #define	LDIR_Attr			11	/* LFN attribute (1) */
//  446 #define	LDIR_Type			12	/* LFN type (1) */
//  447 #define	LDIR_Chksum			13	/* Sum of corresponding SFN entry */
//  448 #define	LDIR_FstClusLO		26	/* Filled by zero (0) */
//  449 #define	SZ_DIR				32		/* Size of a directory entry */
//  450 #define	LLE					0x40	/* Last long entry flag in LDIR_Ord */
//  451 #define	DDE					0xE5	/* Deleted directory enrty mark in DIR_Name[0] */
//  452 #define	NDDE				0x05	/* Replacement of a character collides with DDE */
//  453 
//  454 
//  455 /*------------------------------------------------------------*/
//  456 /* Work area                                                  */
//  457 
//  458 #if _VOLUMES
//  459 static

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  460 FATFS *FatFs[_VOLUMES];	/* Pointer to the file system objects (logical drives) */
FatFs:
        DS8 8
//  461 #else
//  462 #error Number of drives must not be 0.
//  463 #endif
//  464 
//  465 static

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//  466 WORD Fsid;				/* File system mount ID */
Fsid:
        DS8 2
//  467 
//  468 #if _FS_RPATH
//  469 static
//  470 BYTE CurrVol;			/* Current drive */
//  471 #endif
//  472 
//  473 #if _FS_SHARE
//  474 static
//  475 FILESEM	Files[_FS_SHARE];	/* File lock semaphores */
//  476 #endif
//  477 
//  478 #if _USE_LFN == 0			/* No LFN */
//  479 #define	DEF_NAMEBUF			BYTE sfn[12]
//  480 #define INIT_BUF(dobj)		(dobj).fn = sfn
//  481 #define	FREE_BUF()
//  482 
//  483 #elif _USE_LFN == 1			/* LFN with static LFN working buffer */

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  484 static WCHAR LfnBuf[_MAX_LFN+1];
LfnBuf:
        DS8 512
//  485 #define	DEF_NAMEBUF			BYTE sfn[12]
//  486 #define INIT_BUF(dobj)		{ (dobj).fn = sfn; (dobj).lfn = LfnBuf; }
//  487 #define	FREE_BUF()
//  488 
//  489 #elif _USE_LFN == 2 		/* LFN with dynamic LFN working buffer on the stack */
//  490 #define	DEF_NAMEBUF			BYTE sfn[12]; WCHAR lbuf[_MAX_LFN+1]
//  491 #define INIT_BUF(dobj)		{ (dobj).fn = sfn; (dobj).lfn = lbuf; }
//  492 #define	FREE_BUF()
//  493 
//  494 #elif _USE_LFN == 3 		/* LFN with dynamic LFN working buffer on the heap */
//  495 #define	DEF_NAMEBUF			BYTE sfn[12]; WCHAR *lfn
//  496 #define INIT_BUF(dobj)		{ lfn = ff_memalloc((_MAX_LFN + 1) * 2); \ 
//  497 							  if (!lfn) LEAVE_FF((dobj).fs, FR_NOT_ENOUGH_CORE); \ 
//  498 							  (dobj).lfn = lfn;	(dobj).fn = sfn; }
//  499 #define	FREE_BUF()			ff_memfree(lfn)
//  500 
//  501 #else
//  502 #error Wrong LFN configuration.
//  503 #endif
//  504 
//  505 
//  506 
//  507 
//  508 /*--------------------------------------------------------------------------
//  509 
//  510    Module Private Functions
//  511 
//  512 ---------------------------------------------------------------------------*/
//  513 
//  514 
//  515 /*-----------------------------------------------------------------------*/
//  516 /* String functions                                                      */
//  517 /*-----------------------------------------------------------------------*/
//  518 
//  519 /* Copy memory to memory */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function mem_cpy
          CFI NoCalls
        THUMB
//  520 static
//  521 void mem_cpy (void* dst, const void* src, UINT cnt) {
//  522 	BYTE *d = (BYTE*)dst;
//  523 	const BYTE *s = (const BYTE*)src;
mem_cpy:
        B.N      ??mem_cpy_0
//  524 
//  525 #if _WORD_ACCESS == 1
//  526 	while (cnt >= sizeof(int)) {
//  527 		*(int*)d = *(int*)s;
//  528 		d += sizeof(int); s += sizeof(int);
//  529 		cnt -= sizeof(int);
//  530 	}
//  531 #endif
//  532 	while (cnt--)
//  533 		*d++ = *s++;
??mem_cpy_1:
        LDRB     R3,[R1, #+0]
        STRB     R3,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
??mem_cpy_0:
        MOVS     R3,R2
        SUBS     R2,R3,#+1
        CMP      R3,#+0
        BNE.N    ??mem_cpy_1
//  534 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  535 
//  536 /* Fill memory */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function mem_set
          CFI NoCalls
        THUMB
//  537 static
//  538 void mem_set (void* dst, int val, UINT cnt) {
//  539 	BYTE *d = (BYTE*)dst;
mem_set:
        B.N      ??mem_set_0
//  540 
//  541 	while (cnt--)
//  542 		*d++ = (BYTE)val;
??mem_set_1:
        STRB     R1,[R0, #+0]
        ADDS     R0,R0,#+1
??mem_set_0:
        MOVS     R3,R2
        SUBS     R2,R3,#+1
        CMP      R3,#+0
        BNE.N    ??mem_set_1
//  543 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  544 
//  545 /* Compare memory to memory */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function mem_cmp
          CFI NoCalls
        THUMB
//  546 static
//  547 int mem_cmp (const void* dst, const void* src, UINT cnt) {
mem_cmp:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  548 	const BYTE *d = (const BYTE *)dst, *s = (const BYTE *)src;
//  549 	int r = 0;
        MOVS     R3,#+0
//  550 
//  551 	while (cnt-- && (r = *d++ - *s++) == 0) ;
??mem_cmp_0:
        MOVS     R4,R2
        SUBS     R2,R4,#+1
        CMP      R4,#+0
        BEQ.N    ??mem_cmp_1
        LDRB     R3,[R0, #+0]
        LDRB     R4,[R1, #+0]
        SUBS     R3,R3,R4
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
        CMP      R3,#+0
        BEQ.N    ??mem_cmp_0
//  552 	return r;
??mem_cmp_1:
        MOVS     R0,R3
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  553 }
//  554 
//  555 /* Check if chr is contained in the string */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function chk_chr
          CFI NoCalls
        THUMB
//  556 static
//  557 int chk_chr (const char* str, int chr) {
chk_chr:
        B.N      ??chk_chr_0
//  558 	while (*str && *str != chr) str++;
??chk_chr_1:
        ADDS     R0,R0,#+1
??chk_chr_0:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??chk_chr_2
        LDRB     R2,[R0, #+0]
        CMP      R2,R1
        BNE.N    ??chk_chr_1
//  559 	return *str;
??chk_chr_2:
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  560 }
//  561 
//  562 
//  563 
//  564 /*-----------------------------------------------------------------------*/
//  565 /* Request/Release grant to access the volume                            */
//  566 /*-----------------------------------------------------------------------*/
//  567 #if _FS_REENTRANT
//  568 
//  569 static
//  570 int lock_fs (
//  571 	FATFS *fs		/* File system object */
//  572 )
//  573 {
//  574 	return ff_req_grant(fs->sobj);
//  575 }
//  576 
//  577 
//  578 static
//  579 void unlock_fs (
//  580 	FATFS *fs,		/* File system object */
//  581 	FRESULT res		/* Result code to be returned */
//  582 )
//  583 {
//  584 	if (res != FR_NOT_ENABLED &&
//  585 		res != FR_INVALID_DRIVE &&
//  586 		res != FR_INVALID_OBJECT &&
//  587 		res != FR_TIMEOUT) {
//  588 		ff_rel_grant(fs->sobj);
//  589 	}
//  590 }
//  591 #endif
//  592 
//  593 
//  594 
//  595 /*-----------------------------------------------------------------------*/
//  596 /* File shareing control functions                                       */
//  597 /*-----------------------------------------------------------------------*/
//  598 #if _FS_SHARE
//  599 
//  600 static
//  601 FRESULT chk_lock (	/* Check if the file can be accessed */
//  602 	DIR* dj,		/* Directory object pointing the file to be checked */
//  603 	int acc			/* Desired access (0:Read, 1:Write, 2:Delete/Rename) */
//  604 )
//  605 {
//  606 	UINT i, be;
//  607 
//  608 	/* Search file semaphore table */
//  609 	for (i = be = 0; i < _FS_SHARE; i++) {
//  610 		if (Files[i].fs) {	/* Existing entry */
//  611 			if (Files[i].fs == dj->fs &&	 	/* Check if the file matched with an open file */
//  612 				Files[i].clu == dj->sclust &&
//  613 				Files[i].idx == dj->index) break;
//  614 		} else {			/* Blank entry */
//  615 			be++;
//  616 		}
//  617 	}
//  618 	if (i == _FS_SHARE)	/* The file is not opened */
//  619 		return (be || acc == 2) ? FR_OK : FR_TOO_MANY_OPEN_FILES;	/* Is there a blank entry for new file? */
//  620 
//  621 	/* The file has been opened. Reject any open against writing file and all write mode open */
//  622 	return (acc || Files[i].ctr == 0x100) ? FR_LOCKED : FR_OK;
//  623 }
//  624 
//  625 
//  626 static
//  627 int enq_lock (	/* Check if an entry is available for a new file */
//  628 	FATFS* fs	/* File system object */
//  629 )
//  630 {
//  631 	UINT i;
//  632 
//  633 	for (i = 0; i < _FS_SHARE && Files[i].fs; i++) ;
//  634 	return (i == _FS_SHARE) ? 0 : 1;
//  635 }
//  636 
//  637 
//  638 static
//  639 UINT inc_lock (	/* Increment file open counter and returns its index (0:int error) */
//  640 	DIR* dj,	/* Directory object pointing the file to register or increment */
//  641 	int acc		/* Desired access mode (0:Read, !0:Write) */
//  642 )
//  643 {
//  644 	UINT i;
//  645 
//  646 
//  647 	for (i = 0; i < _FS_SHARE; i++) {	/* Find the file */
//  648 		if (Files[i].fs == dj->fs &&
//  649 			Files[i].clu == dj->sclust &&
//  650 			Files[i].idx == dj->index) break;
//  651 	}
//  652 
//  653 	if (i == _FS_SHARE) {				/* Not opened. Register it as new. */
//  654 		for (i = 0; i < _FS_SHARE && Files[i].fs; i++) ;
//  655 		if (i == _FS_SHARE) return 0;	/* No space to register (int err) */
//  656 		Files[i].fs = dj->fs;
//  657 		Files[i].clu = dj->sclust;
//  658 		Files[i].idx = dj->index;
//  659 		Files[i].ctr = 0;
//  660 	}
//  661 
//  662 	if (acc && Files[i].ctr) return 0;	/* Access violation (int err) */
//  663 
//  664 	Files[i].ctr = acc ? 0x100 : Files[i].ctr + 1;	/* Set semaphore value */
//  665 
//  666 	return i + 1;
//  667 }
//  668 
//  669 
//  670 static
//  671 FRESULT dec_lock (	/* Decrement file open counter */
//  672 	UINT i			/* Semaphore index */
//  673 )
//  674 {
//  675 	WORD n;
//  676 	FRESULT res;
//  677 
//  678 
//  679 	if (--i < _FS_SHARE) {
//  680 		n = Files[i].ctr;
//  681 		if (n == 0x100) n = 0;
//  682 		if (n) n--;
//  683 		Files[i].ctr = n;
//  684 		if (!n) Files[i].fs = 0;
//  685 		res = FR_OK;
//  686 	} else {
//  687 		res = FR_INT_ERR;
//  688 	}
//  689 	return res;
//  690 }
//  691 
//  692 
//  693 static
//  694 void clear_lock (	/* Clear lock entries of the volume */
//  695 	FATFS *fs
//  696 )
//  697 {
//  698 	UINT i;
//  699 
//  700 	for (i = 0; i < _FS_SHARE; i++) {
//  701 		if (Files[i].fs == fs) Files[i].fs = 0;
//  702 	}
//  703 }
//  704 #endif
//  705 
//  706 
//  707 
//  708 /*-----------------------------------------------------------------------*/
//  709 /* Change window offset                                                  */
//  710 /*-----------------------------------------------------------------------*/
//  711 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function move_window
        THUMB
//  712 static
//  713 FRESULT move_window (
//  714 	FATFS *fs,		/* File system object */
//  715 	DWORD sector	/* Sector number to make appearance in the fs->win[] */
//  716 )					/* Move to zero only writes back dirty window */
//  717 {
move_window:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  718 	DWORD wsect;
//  719 
//  720 
//  721 	wsect = fs->winsect;
        LDR      R6,[R4, #+44]
//  722 	if (wsect != sector) {	/* Changed current window */
        CMP      R6,R5
        BEQ.N    ??move_window_0
//  723 #if !_FS_READONLY
//  724 		if (fs->wflag) {	/* Write back dirty window if needed */
        LDRB     R0,[R4, #+4]
        CMP      R0,#+0
        BEQ.N    ??move_window_1
//  725 			if (disk_write(fs->drv, fs->win, wsect, 1) != RES_OK)
        MOVS     R3,#+1
        MOVS     R2,R6
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??move_window_2
//  726 				return FR_DISK_ERR;
        MOVS     R0,#+1
        B.N      ??move_window_3
//  727 			fs->wflag = 0;
??move_window_2:
        MOVS     R0,#+0
        STRB     R0,[R4, #+4]
//  728 			if (wsect < (fs->fatbase + fs->fsize)) {	/* In FAT area */
        LDR      R0,[R4, #+32]
        LDR      R1,[R4, #+28]
        ADDS     R0,R1,R0
        CMP      R6,R0
        BCS.N    ??move_window_1
//  729 				BYTE nf;
//  730 				for (nf = fs->n_fats; nf > 1; nf--) {	/* Reflect the change to all FAT copies */
        LDRB     R7,[R4, #+3]
        B.N      ??move_window_4
//  731 					wsect += fs->fsize;
??move_window_5:
        LDR      R0,[R4, #+28]
        ADDS     R6,R0,R6
//  732 					disk_write(fs->drv, fs->win, wsect, 1);
        MOVS     R3,#+1
        MOVS     R2,R6
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_write
        BL       disk_write
//  733 				}
        SUBS     R7,R7,#+1
??move_window_4:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+2
        BGE.N    ??move_window_5
//  734 			}
//  735 		}
//  736 #endif
//  737 		if (sector) {
??move_window_1:
        CMP      R5,#+0
        BEQ.N    ??move_window_0
//  738 			if (disk_read(fs->drv, fs->win, sector, 1) != RES_OK)
        MOVS     R3,#+1
        MOVS     R2,R5
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??move_window_6
//  739 				return FR_DISK_ERR;
        MOVS     R0,#+1
        B.N      ??move_window_3
//  740 			fs->winsect = sector;
??move_window_6:
        STR      R5,[R4, #+44]
//  741 		}
//  742 	}
//  743 
//  744 	return FR_OK;
??move_window_0:
        MOVS     R0,#+0
??move_window_3:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock4
//  745 }
//  746 
//  747 
//  748 
//  749 
//  750 /*-----------------------------------------------------------------------*/
//  751 /* Clean-up cached data                                                  */
//  752 /*-----------------------------------------------------------------------*/
//  753 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function sync
        THUMB
//  754 static
//  755 FRESULT sync (	/* FR_OK: successful, FR_DISK_ERR: failed */
//  756 	FATFS *fs	/* File system object */
//  757 )
//  758 {
sync:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  759 	FRESULT res;
//  760 
//  761 
//  762 	res = move_window(fs, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
//  763 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??sync_0
//  764 		/* Update FSInfo sector if needed */
//  765 		if (fs->fs_type == FS_FAT32 && fs->fsi_flag) {
        LDRB     R0,[R4, #+0]
        CMP      R0,#+3
        BNE.N    ??sync_1
        LDRB     R0,[R4, #+5]
        CMP      R0,#+0
        BEQ.N    ??sync_1
//  766 			fs->winsect = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+44]
//  767 			/* Create FSInfo structure */
//  768 			mem_set(fs->win, 0, 512);
        MOV      R2,#+512
        MOVS     R1,#+0
        ADDS     R0,R4,#+48
          CFI FunCall mem_set
        BL       mem_set
//  769 			ST_WORD(fs->win+BS_55AA, 0xAA55);
        MOVS     R0,#+85
        STRB     R0,[R4, #+558]
        MOVS     R0,#+170
        STRB     R0,[R4, #+559]
//  770 			ST_DWORD(fs->win+FSI_LeadSig, 0x41615252);
        MOVS     R0,#+82
        STRB     R0,[R4, #+48]
        MOVS     R0,#+82
        STRB     R0,[R4, #+49]
        MOVS     R0,#+97
        STRB     R0,[R4, #+50]
        MOVS     R0,#+65
        STRB     R0,[R4, #+51]
//  771 			ST_DWORD(fs->win+FSI_StrucSig, 0x61417272);
        MOVS     R0,#+114
        STRB     R0,[R4, #+532]
        MOVS     R0,#+114
        STRB     R0,[R4, #+533]
        MOVS     R0,#+65
        STRB     R0,[R4, #+534]
        MOVS     R0,#+97
        STRB     R0,[R4, #+535]
//  772 			ST_DWORD(fs->win+FSI_Free_Count, fs->free_clust);
        LDR      R0,[R4, #+16]
        STRB     R0,[R4, #+536]
        LDR      R0,[R4, #+16]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R4, #+537]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+16
        STRB     R0,[R4, #+538]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+24
        STRB     R0,[R4, #+539]
//  773 			ST_DWORD(fs->win+FSI_Nxt_Free, fs->last_clust);
        LDR      R0,[R4, #+12]
        STRB     R0,[R4, #+540]
        LDR      R0,[R4, #+12]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R4, #+541]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+16
        STRB     R0,[R4, #+542]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+24
        STRB     R0,[R4, #+543]
//  774 			/* Write it into the FSInfo sector */
//  775 			disk_write(fs->drv, fs->win, fs->fsi_sector, 1);
        MOVS     R3,#+1
        LDR      R2,[R4, #+20]
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_write
        BL       disk_write
//  776 			fs->fsi_flag = 0;
        MOVS     R0,#+0
        STRB     R0,[R4, #+5]
//  777 		}
//  778 		/* Make sure that no pending write process in the physical drive */
//  779 		if (disk_ioctl(fs->drv, CTRL_SYNC, (void*)0) != RES_OK)
??sync_1:
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_ioctl
        BL       disk_ioctl
        CMP      R0,#+0
        BEQ.N    ??sync_0
//  780 			res = FR_DISK_ERR;
        MOVS     R5,#+1
//  781 	}
//  782 
//  783 	return res;
??sync_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock5
//  784 }
//  785 #endif
//  786 
//  787 
//  788 
//  789 
//  790 /*-----------------------------------------------------------------------*/
//  791 /* Get sector# from cluster#                                             */
//  792 /*-----------------------------------------------------------------------*/
//  793 
//  794 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function clust2sect
          CFI NoCalls
        THUMB
//  795 DWORD clust2sect (	/* !=0: Sector number, 0: Failed - invalid cluster# */
//  796 	FATFS *fs,		/* File system object */
//  797 	DWORD clst		/* Cluster# to be converted */
//  798 )
//  799 {
//  800 	clst -= 2;
clust2sect:
        SUBS     R1,R1,#+2
//  801 	if (clst >= (fs->n_fatent - 2)) return 0;		/* Invalid cluster# */
        LDR      R2,[R0, #+24]
        SUBS     R2,R2,#+2
        CMP      R1,R2
        BCC.N    ??clust2sect_0
        MOVS     R0,#+0
        B.N      ??clust2sect_1
//  802 	return clst * fs->csize + fs->database;
??clust2sect_0:
        LDRB     R2,[R0, #+2]
        LDR      R0,[R0, #+40]
        MLA      R0,R2,R1,R0
??clust2sect_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  803 }
//  804 
//  805 
//  806 
//  807 
//  808 /*-----------------------------------------------------------------------*/
//  809 /* FAT access - Read value of a FAT entry                                */
//  810 /*-----------------------------------------------------------------------*/
//  811 
//  812 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function get_fat
        THUMB
//  813 DWORD get_fat (	/* 0xFFFFFFFF:Disk error, 1:Internal error, Else:Cluster status */
//  814 	FATFS *fs,	/* File system object */
//  815 	DWORD clst	/* Cluster# to get the link information */
//  816 )
//  817 {
get_fat:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  818 	UINT wc, bc;
//  819 	BYTE *p;
//  820 
//  821 
//  822 	if (clst < 2 || clst >= fs->n_fatent)	/* Chack range */
        CMP      R5,#+2
        BCC.N    ??get_fat_0
        LDR      R0,[R4, #+24]
        CMP      R5,R0
        BCC.N    ??get_fat_1
//  823 		return 1;
??get_fat_0:
        MOVS     R0,#+1
        B.N      ??get_fat_2
//  824 
//  825 	switch (fs->fs_type) {
??get_fat_1:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+1
        BEQ.N    ??get_fat_3
        BCC.N    ??get_fat_4
        CMP      R0,#+3
        BEQ.N    ??get_fat_5
        BCC.N    ??get_fat_6
        B.N      ??get_fat_4
//  826 	case FS_FAT12 :
//  827 		bc = (UINT)clst; bc += bc / 2;
??get_fat_3:
        MOVS     R6,R5
        ADDS     R6,R6,R6, LSR #+1
//  828 		if (move_window(fs, fs->fatbase + (bc / SS(fs)))) break;
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R6, LSR #+9
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BEQ.N    ??get_fat_7
//  829 		wc = fs->win[bc % SS(fs)]; bc++;
//  830 		if (move_window(fs, fs->fatbase + (bc / SS(fs)))) break;
//  831 		wc |= fs->win[bc % SS(fs)] << 8;
//  832 		return (clst & 1) ? (wc >> 4) : (wc & 0xFFF);
//  833 
//  834 	case FS_FAT16 :
//  835 		if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 2)))) break;
//  836 		p = &fs->win[clst * 2 % SS(fs)];
//  837 		return LD_WORD(p);
//  838 
//  839 	case FS_FAT32 :
//  840 		if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 4)))) break;
//  841 		p = &fs->win[clst * 4 % SS(fs)];
//  842 		return LD_DWORD(p) & 0x0FFFFFFF;
//  843 	}
//  844 
//  845 	return 0xFFFFFFFF;	/* An error occurred at the disk I/O layer */
??get_fat_4:
        MOVS     R0,#-1
??get_fat_2:
        POP      {R1,R4-R7,PC}    ;; return
??get_fat_7:
        MOV      R0,#+512
        UDIV     R1,R6,R0
        MLS      R1,R1,R0,R6
        ADDS     R0,R1,R4
        LDRB     R7,[R0, #+48]
        ADDS     R6,R6,#+1
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R6, LSR #+9
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_4
??get_fat_8:
        MOV      R0,#+512
        UDIV     R1,R6,R0
        MLS      R1,R1,R0,R6
        ADDS     R0,R1,R4
        LDRB     R0,[R0, #+48]
        ORRS     R7,R7,R0, LSL #+8
        LSLS     R0,R5,#+31
        BPL.N    ??get_fat_9
        LSRS     R0,R7,#+4
        B.N      ??get_fat_10
??get_fat_9:
        LSLS     R0,R7,#+20       ;; ZeroExtS R0,R7,#+20,#+20
        LSRS     R0,R0,#+20
??get_fat_10:
        B.N      ??get_fat_2
??get_fat_6:
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R5, LSR #+8
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_4
??get_fat_11:
        LSLS     R0,R5,#+1
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADDS     R0,R2,R4
        ADDS     R0,R0,#+48
        LDRB     R1,[R0, #+1]
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,R1, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        B.N      ??get_fat_2
??get_fat_5:
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R5, LSR #+7
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_4
??get_fat_12:
        LSLS     R0,R5,#+2
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADDS     R0,R2,R4
        ADDS     R0,R0,#+48
        LDRB     R1,[R0, #+3]
        LDRB     R2,[R0, #+2]
        LSLS     R2,R2,#+16
        ORRS     R1,R2,R1, LSL #+24
        LDRB     R2,[R0, #+1]
        ORRS     R1,R1,R2, LSL #+8
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,R1
        LSLS     R0,R0,#+4        ;; ZeroExtS R0,R0,#+4,#+4
        LSRS     R0,R0,#+4
        B.N      ??get_fat_2
          CFI EndBlock cfiBlock7
//  846 }
//  847 
//  848 
//  849 
//  850 
//  851 /*-----------------------------------------------------------------------*/
//  852 /* FAT access - Change value of a FAT entry                              */
//  853 /*-----------------------------------------------------------------------*/
//  854 #if !_FS_READONLY
//  855 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function put_fat
        THUMB
//  856 FRESULT put_fat (
//  857 	FATFS *fs,	/* File system object */
//  858 	DWORD clst,	/* Cluster# to be changed in range of 2 to fs->n_fatent - 1 */
//  859 	DWORD val	/* New value to mark the cluster */
//  860 )
//  861 {
put_fat:
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
//  862 	UINT bc;
//  863 	BYTE *p;
//  864 	FRESULT res;
//  865 
//  866 
//  867 	if (clst < 2 || clst >= fs->n_fatent) {	/* Check range */
        CMP      R5,#+2
        BCC.N    ??put_fat_0
        LDR      R0,[R4, #+24]
        CMP      R5,R0
        BCC.N    ??put_fat_1
//  868 		res = FR_INT_ERR;
??put_fat_0:
        MOVS     R0,#+2
        B.N      ??put_fat_2
//  869 
//  870 	} else {
//  871 		switch (fs->fs_type) {
??put_fat_1:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+1
        BEQ.N    ??put_fat_3
        BCC.N    ??put_fat_4
        CMP      R0,#+3
        BEQ.N    ??put_fat_5
        BCC.N    ??put_fat_6
        B.N      ??put_fat_4
//  872 		case FS_FAT12 :
//  873 			bc = clst; bc += bc / 2;
??put_fat_3:
        MOVS     R7,R5
        ADDS     R7,R7,R7, LSR #+1
//  874 			res = move_window(fs, fs->fatbase + (bc / SS(fs)));
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R7, LSR #+9
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
//  875 			if (res != FR_OK) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??put_fat_7
//  876 			p = &fs->win[bc % SS(fs)];
??put_fat_8:
        MOV      R0,#+512
        UDIV     R1,R7,R0
        MLS      R1,R1,R0,R7
        ADDS     R0,R1,R4
        ADDS     R1,R0,#+48
//  877 			*p = (clst & 1) ? ((*p & 0x0F) | ((BYTE)val << 4)) : (BYTE)val;
        LSLS     R0,R5,#+31
        BPL.N    ??put_fat_9
        LDRB     R0,[R1, #+0]
        ANDS     R0,R0,#0xF
        ORRS     R0,R0,R6, LSL #+4
        B.N      ??put_fat_10
??put_fat_9:
        MOVS     R0,R6
??put_fat_10:
        STRB     R0,[R1, #+0]
//  878 			bc++;
        ADDS     R7,R7,#+1
//  879 			fs->wflag = 1;
        MOVS     R0,#+1
        STRB     R0,[R4, #+4]
//  880 			res = move_window(fs, fs->fatbase + (bc / SS(fs)));
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R7, LSR #+9
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
//  881 			if (res != FR_OK) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??put_fat_7
//  882 			p = &fs->win[bc % SS(fs)];
??put_fat_11:
        MOV      R1,#+512
        UDIV     R2,R7,R1
        MLS      R2,R2,R1,R7
        ADDS     R1,R2,R4
        ADDS     R1,R1,#+48
//  883 			*p = (clst & 1) ? (BYTE)(val >> 4) : ((*p & 0xF0) | ((BYTE)(val >> 8) & 0x0F));
        LSLS     R2,R5,#+31
        BPL.N    ??put_fat_12
        LSRS     R2,R6,#+4
        B.N      ??put_fat_13
??put_fat_12:
        LDRB     R2,[R1, #+0]
        ANDS     R2,R2,#0xF0
        LSRS     R3,R6,#+8
        ANDS     R3,R3,#0xF
        ORRS     R2,R3,R2
??put_fat_13:
        STRB     R2,[R1, #+0]
//  884 			break;
        B.N      ??put_fat_7
//  885 
//  886 		case FS_FAT16 :
//  887 			res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 2)));
??put_fat_6:
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R5, LSR #+8
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
//  888 			if (res != FR_OK) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??put_fat_7
//  889 			p = &fs->win[clst * 2 % SS(fs)];
??put_fat_14:
        LSLS     R1,R5,#+1
        MOV      R2,#+512
        UDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        ADDS     R1,R3,R4
        ADDS     R1,R1,#+48
//  890 			ST_WORD(p, (WORD)val);
        STRB     R6,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R2,R6,#+8
        STRB     R2,[R1, #+1]
//  891 			break;
        B.N      ??put_fat_7
//  892 
//  893 		case FS_FAT32 :
//  894 			res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 4)));
??put_fat_5:
        LDR      R0,[R4, #+32]
        ADDS     R1,R0,R5, LSR #+7
        MOVS     R0,R4
          CFI FunCall move_window
        BL       move_window
//  895 			if (res != FR_OK) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??put_fat_7
//  896 			p = &fs->win[clst * 4 % SS(fs)];
??put_fat_15:
        LSLS     R1,R5,#+2
        MOV      R2,#+512
        UDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        ADDS     R1,R3,R4
        ADDS     R1,R1,#+48
//  897 			val |= LD_DWORD(p) & 0xF0000000;
        LDRB     R2,[R1, #+3]
        LSLS     R2,R2,#+24
        ANDS     R2,R2,#0xF0000000
        ORRS     R6,R2,R6
//  898 			ST_DWORD(p, val);
        STRB     R6,[R1, #+0]
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSRS     R2,R2,#+8
        STRB     R2,[R1, #+1]
        LSRS     R2,R6,#+16
        STRB     R2,[R1, #+2]
        LSRS     R2,R6,#+24
        STRB     R2,[R1, #+3]
//  899 			break;
        B.N      ??put_fat_7
//  900 
//  901 		default :
//  902 			res = FR_INT_ERR;
??put_fat_4:
        MOVS     R0,#+2
//  903 		}
//  904 		fs->wflag = 1;
??put_fat_7:
        MOVS     R1,#+1
        STRB     R1,[R4, #+4]
//  905 	}
//  906 
//  907 	return res;
??put_fat_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock8
//  908 }
//  909 #endif /* !_FS_READONLY */
//  910 
//  911 
//  912 
//  913 
//  914 /*-----------------------------------------------------------------------*/
//  915 /* FAT handling - Remove a cluster chain                                 */
//  916 /*-----------------------------------------------------------------------*/
//  917 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function remove_chain
        THUMB
//  918 static
//  919 FRESULT remove_chain (
//  920 	FATFS *fs,			/* File system object */
//  921 	DWORD clst			/* Cluster# to remove a chain from */
//  922 )
//  923 {
remove_chain:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R6,R1
//  924 	FRESULT res;
//  925 	DWORD nxt;
//  926 #if _USE_ERASE
//  927 	DWORD scl = clst, ecl = clst, resion[2];
//  928 #endif
//  929 
//  930 	if (clst < 2 || clst >= fs->n_fatent) {	/* Check range */
        CMP      R6,#+2
        BCC.N    ??remove_chain_0
        LDR      R0,[R4, #+24]
        CMP      R6,R0
        BCC.N    ??remove_chain_1
//  931 		res = FR_INT_ERR;
??remove_chain_0:
        MOVS     R5,#+2
        B.N      ??remove_chain_2
//  932 
//  933 	} else {
//  934 		res = FR_OK;
??remove_chain_1:
        MOVS     R5,#+0
        B.N      ??remove_chain_3
//  935 		while (clst < fs->n_fatent) {			/* Not a last link? */
//  936 			nxt = get_fat(fs, clst);			/* Get cluster status */
//  937 			if (nxt == 0) break;				/* Empty cluster? */
//  938 			if (nxt == 1) { res = FR_INT_ERR; break; }	/* Internal error? */
//  939 			if (nxt == 0xFFFFFFFF) { res = FR_DISK_ERR; break; }	/* Disk error? */
//  940 			res = put_fat(fs, clst, 0);			/* Mark the cluster "empty" */
//  941 			if (res != FR_OK) break;
//  942 			if (fs->free_clust != 0xFFFFFFFF) {	/* Update FSInfo */
??remove_chain_4:
        LDR      R0,[R4, #+16]
        CMN      R0,#+1
        BEQ.N    ??remove_chain_5
//  943 				fs->free_clust++;
        LDR      R0,[R4, #+16]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+16]
//  944 				fs->fsi_flag = 1;
        MOVS     R0,#+1
        STRB     R0,[R4, #+5]
//  945 			}
//  946 #if _USE_ERASE
//  947 			if (ecl + 1 == nxt) {	/* Next cluster is contiguous */
//  948 				ecl = nxt;
//  949 			} else {				/* End of contiguous clusters */ 
//  950 				resion[0] = clust2sect(fs, scl);					/* Start sector */
//  951 				resion[1] = clust2sect(fs, ecl) + fs->csize - 1;	/* End sector */
//  952 				disk_ioctl(fs->drv, CTRL_ERASE_SECTOR, resion);		/* Erase the block */
//  953 				scl = ecl = nxt;
//  954 			}
//  955 #endif
//  956 			clst = nxt;	/* Next cluster */
??remove_chain_5:
        MOVS     R6,R7
??remove_chain_3:
        LDR      R0,[R4, #+24]
        CMP      R6,R0
        BCS.N    ??remove_chain_2
        MOVS     R1,R6
        MOVS     R0,R4
          CFI FunCall get_fat
        BL       get_fat
        MOVS     R7,R0
        CMP      R7,#+0
        BEQ.N    ??remove_chain_2
??remove_chain_6:
        CMP      R7,#+1
        BNE.N    ??remove_chain_7
        MOVS     R5,#+2
        B.N      ??remove_chain_2
??remove_chain_7:
        CMN      R7,#+1
        BNE.N    ??remove_chain_8
        MOVS     R5,#+1
        B.N      ??remove_chain_2
??remove_chain_8:
        MOVS     R2,#+0
        MOVS     R1,R6
        MOVS     R0,R4
          CFI FunCall put_fat
        BL       put_fat
        MOVS     R5,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??remove_chain_4
//  957 		}
//  958 	}
//  959 
//  960 	return res;
??remove_chain_2:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock9
//  961 }
//  962 #endif
//  963 
//  964 
//  965 
//  966 
//  967 /*-----------------------------------------------------------------------*/
//  968 /* FAT handling - Stretch or Create a cluster chain                      */
//  969 /*-----------------------------------------------------------------------*/
//  970 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function create_chain
        THUMB
//  971 static
//  972 DWORD create_chain (	/* 0:No free cluster, 1:Internal error, 0xFFFFFFFF:Disk error, >=2:New cluster# */
//  973 	FATFS *fs,			/* File system object */
//  974 	DWORD clst			/* Cluster# to stretch. 0 means create a new chain. */
//  975 )
//  976 {
create_chain:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R6,R1
//  977 	DWORD cs, ncl, scl;
//  978 	FRESULT res;
//  979 
//  980 
//  981 	if (clst == 0) {		/* Create a new chain */
        CMP      R6,#+0
        BNE.N    ??create_chain_0
//  982 		scl = fs->last_clust;			/* Get suggested start point */
        LDR      R7,[R4, #+12]
//  983 		if (!scl || scl >= fs->n_fatent) scl = 1;
        CMP      R7,#+0
        BEQ.N    ??create_chain_1
        LDR      R0,[R4, #+24]
        CMP      R7,R0
        BCC.N    ??create_chain_2
??create_chain_1:
        MOVS     R7,#+1
        B.N      ??create_chain_2
//  984 	}
//  985 	else {					/* Stretch the current chain */
//  986 		cs = get_fat(fs, clst);			/* Check the cluster status */
??create_chain_0:
        MOVS     R1,R6
        MOVS     R0,R4
          CFI FunCall get_fat
        BL       get_fat
//  987 		if (cs < 2) return 1;			/* It is an invalid cluster */
        CMP      R0,#+2
        BCS.N    ??create_chain_3
        MOVS     R0,#+1
        B.N      ??create_chain_4
//  988 		if (cs < fs->n_fatent) return cs;	/* It is already followed by next cluster */
??create_chain_3:
        LDR      R1,[R4, #+24]
        CMP      R0,R1
        BCC.N    ??create_chain_4
//  989 		scl = clst;
??create_chain_5:
        MOVS     R7,R6
//  990 	}
//  991 
//  992 	ncl = scl;				/* Start cluster */
??create_chain_2:
        MOVS     R5,R7
//  993 	for (;;) {
//  994 		ncl++;							/* Next cluster */
??create_chain_6:
        ADDS     R5,R5,#+1
//  995 		if (ncl >= fs->n_fatent) {		/* Wrap around */
        LDR      R0,[R4, #+24]
        CMP      R5,R0
        BCC.N    ??create_chain_7
//  996 			ncl = 2;
        MOVS     R5,#+2
//  997 			if (ncl > scl) return 0;	/* No free cluster */
        CMP      R7,R5
        BCS.N    ??create_chain_7
        MOVS     R0,#+0
        B.N      ??create_chain_4
//  998 		}
//  999 		cs = get_fat(fs, ncl);			/* Get the cluster status */
??create_chain_7:
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall get_fat
        BL       get_fat
// 1000 		if (cs == 0) break;				/* Found a free cluster */
        CMP      R0,#+0
        BNE.N    ??create_chain_8
// 1001 		if (cs == 0xFFFFFFFF || cs == 1)/* An error occurred */
// 1002 			return cs;
// 1003 		if (ncl == scl) return 0;		/* No free cluster */
// 1004 	}
// 1005 
// 1006 	res = put_fat(fs, ncl, 0x0FFFFFFF);	/* Mark the new cluster "last link" */
        MVNS     R2,#-268435456
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall put_fat
        BL       put_fat
// 1007 	if (res == FR_OK && clst != 0) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??create_chain_9
        CMP      R6,#+0
        BEQ.N    ??create_chain_9
// 1008 		res = put_fat(fs, clst, ncl);	/* Link it to the previous one if needed */
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,R4
          CFI FunCall put_fat
        BL       put_fat
// 1009 	}
// 1010 	if (res == FR_OK) {
??create_chain_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??create_chain_10
// 1011 		fs->last_clust = ncl;			/* Update FSINFO */
        STR      R5,[R4, #+12]
// 1012 		if (fs->free_clust != 0xFFFFFFFF) {
        LDR      R0,[R4, #+16]
        CMN      R0,#+1
        BEQ.N    ??create_chain_11
// 1013 			fs->free_clust--;
        LDR      R0,[R4, #+16]
        SUBS     R0,R0,#+1
        STR      R0,[R4, #+16]
// 1014 			fs->fsi_flag = 1;
        MOVS     R0,#+1
        STRB     R0,[R4, #+5]
        B.N      ??create_chain_11
// 1015 		}
// 1016 	} else {
??create_chain_8:
        CMN      R0,#+1
        BEQ.N    ??create_chain_12
        CMP      R0,#+1
        BNE.N    ??create_chain_13
??create_chain_12:
        B.N      ??create_chain_4
??create_chain_13:
        CMP      R5,R7
        BNE.N    ??create_chain_6
        MOVS     R0,#+0
        B.N      ??create_chain_4
// 1017 		ncl = (res == FR_DISK_ERR) ? 0xFFFFFFFF : 1;
??create_chain_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??create_chain_14
        MOVS     R5,#-1
        B.N      ??create_chain_11
??create_chain_14:
        MOVS     R5,#+1
// 1018 	}
// 1019 
// 1020 	return ncl;		/* Return new cluster number or error code */
??create_chain_11:
        MOVS     R0,R5
??create_chain_4:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock10
// 1021 }
// 1022 #endif /* !_FS_READONLY */
// 1023 
// 1024 
// 1025 
// 1026 /*-----------------------------------------------------------------------*/
// 1027 /* FAT handling - Convert offset into cluster with link map table        */
// 1028 /*-----------------------------------------------------------------------*/
// 1029 
// 1030 #if _USE_FASTSEEK
// 1031 static
// 1032 DWORD clmt_clust (	/* <2:Error, >=2:Cluster number */
// 1033 	FIL* fp,		/* Pointer to the file object */
// 1034 	DWORD ofs		/* File offset to be converted to cluster# */
// 1035 )
// 1036 {
// 1037 	DWORD cl, ncl, *tbl;
// 1038 
// 1039 
// 1040 	tbl = fp->cltbl + 1;	/* Top of CLMT */
// 1041 	cl = ofs / SS(fp->fs) / fp->fs->csize;	/* Cluster order from top of the file */
// 1042 	for (;;) {
// 1043 		ncl = *tbl++;			/* Number of cluters in the fragment */
// 1044 		if (!ncl) return 0;		/* End of table? (error) */
// 1045 		if (cl < ncl) break;	/* In this fragment? */
// 1046 		cl -= ncl; tbl++;		/* Next fragment */
// 1047 	}
// 1048 	return cl + *tbl;	/* Return the cluster number */
// 1049 }
// 1050 #endif	/* _USE_FASTSEEK */
// 1051 
// 1052 
// 1053 
// 1054 /*-----------------------------------------------------------------------*/
// 1055 /* Directory handling - Set directory index                              */
// 1056 /*-----------------------------------------------------------------------*/
// 1057 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function dir_sdi
        THUMB
// 1058 static
// 1059 FRESULT dir_sdi (
// 1060 	DIR *dj,		/* Pointer to directory object */
// 1061 	WORD idx		/* Directory index number */
// 1062 )
// 1063 {
dir_sdi:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
// 1064 	DWORD clst;
// 1065 	WORD ic;
// 1066 
// 1067 
// 1068 	dj->index = idx;
        STRH     R5,[R4, #+6]
// 1069 	clst = dj->sclust;
        LDR      R0,[R4, #+8]
// 1070 	if (clst == 1 || clst >= dj->fs->n_fatent)	/* Check start cluster range */
        CMP      R0,#+1
        BEQ.N    ??dir_sdi_0
        LDR      R1,[R4, #+0]
        LDR      R1,[R1, #+24]
        CMP      R0,R1
        BCC.N    ??dir_sdi_1
// 1071 		return FR_INT_ERR;
??dir_sdi_0:
        MOVS     R0,#+2
        B.N      ??dir_sdi_2
// 1072 	if (!clst && dj->fs->fs_type == FS_FAT32)	/* Replace cluster# 0 with root cluster# if in FAT32 */
??dir_sdi_1:
        CMP      R0,#+0
        BNE.N    ??dir_sdi_3
        LDR      R1,[R4, #+0]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+3
        BNE.N    ??dir_sdi_3
// 1073 		clst = dj->fs->dirbase;
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+36]
// 1074 
// 1075 	if (clst == 0) {	/* Static table (root-dir in FAT12/16) */
??dir_sdi_3:
        CMP      R0,#+0
        BNE.N    ??dir_sdi_4
// 1076 		dj->clust = clst;
        STR      R0,[R4, #+12]
// 1077 		if (idx >= dj->fs->n_rootdir)		/* Index is out of range */
        LDR      R0,[R4, #+0]
        LDRH     R0,[R0, #+8]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BCC.N    ??dir_sdi_5
// 1078 			return FR_INT_ERR;
        MOVS     R0,#+2
        B.N      ??dir_sdi_2
// 1079 		dj->sect = dj->fs->dirbase + idx / (SS(dj->fs) / SZ_DIR);	/* Sector# */
??dir_sdi_5:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+36]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R0,R0,R5, LSR #+4
        STR      R0,[R4, #+16]
        B.N      ??dir_sdi_6
// 1080 	}
// 1081 	else {				/* Dynamic table (sub-dirs or root-dir in FAT32) */
// 1082 		ic = SS(dj->fs) / SZ_DIR * dj->fs->csize;	/* Entries per cluster */
??dir_sdi_4:
        LDR      R1,[R4, #+0]
        LDRB     R1,[R1, #+2]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSLS     R6,R1,#+4
        B.N      ??dir_sdi_7
// 1083 		while (idx >= ic) {	/* Follow cluster chain */
// 1084 			clst = get_fat(dj->fs, clst);				/* Get next cluster */
// 1085 			if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
// 1086 			if (clst < 2 || clst >= dj->fs->n_fatent)	/* Reached to end of table or int error */
// 1087 				return FR_INT_ERR;
// 1088 			idx -= ic;
??dir_sdi_8:
        SUBS     R5,R5,R6
??dir_sdi_7:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R5,R6
        BCC.N    ??dir_sdi_9
        MOVS     R1,R0
        LDR      R0,[R4, #+0]
          CFI FunCall get_fat
        BL       get_fat
        CMN      R0,#+1
        BNE.N    ??dir_sdi_10
        MOVS     R0,#+1
        B.N      ??dir_sdi_2
??dir_sdi_10:
        CMP      R0,#+2
        BCC.N    ??dir_sdi_11
        LDR      R1,[R4, #+0]
        LDR      R1,[R1, #+24]
        CMP      R0,R1
        BCC.N    ??dir_sdi_8
??dir_sdi_11:
        MOVS     R0,#+2
        B.N      ??dir_sdi_2
// 1089 		}
// 1090 		dj->clust = clst;
??dir_sdi_9:
        STR      R0,[R4, #+12]
// 1091 		dj->sect = clust2sect(dj->fs, clst) + idx / (SS(dj->fs) / SZ_DIR);	/* Sector# */
        MOVS     R1,R0
        LDR      R0,[R4, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R0,R0,R5, LSR #+4
        STR      R0,[R4, #+16]
// 1092 	}
// 1093 
// 1094 	dj->dir = dj->fs->win + (idx % (SS(dj->fs) / SZ_DIR)) * SZ_DIR;	/* Ptr to the entry in the sector */
??dir_sdi_6:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,#+16
        UDIV     R1,R5,R0
        MLS      R1,R1,R0,R5
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,R1, LSL #+5
        ADDS     R0,R0,#+48
        STR      R0,[R4, #+20]
// 1095 
// 1096 	return FR_OK;	/* Seek succeeded */
        MOVS     R0,#+0
??dir_sdi_2:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock11
// 1097 }
// 1098 
// 1099 
// 1100 
// 1101 
// 1102 /*-----------------------------------------------------------------------*/
// 1103 /* Directory handling - Move directory index next                        */
// 1104 /*-----------------------------------------------------------------------*/
// 1105 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function dir_next
        THUMB
// 1106 static
// 1107 FRESULT dir_next (	/* FR_OK:Succeeded, FR_NO_FILE:End of table, FR_DENIED:EOT and could not stretch */
// 1108 	DIR *dj,		/* Pointer to directory object */
// 1109 	int stretch		/* 0: Do not stretch table, 1: Stretch table if needed */
// 1110 )
// 1111 {
dir_next:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
// 1112 	DWORD clst;
// 1113 	WORD i;
// 1114 
// 1115 
// 1116 	i = dj->index + 1;
        LDRH     R0,[R4, #+6]
        ADDS     R6,R0,#+1
// 1117 	if (!i || !dj->sect)	/* Report EOT when index has reached 65535 */
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??dir_next_0
        LDR      R0,[R4, #+16]
        CMP      R0,#+0
        BNE.N    ??dir_next_1
// 1118 		return FR_NO_FILE;
??dir_next_0:
        MOVS     R0,#+4
        B.N      ??dir_next_2
// 1119 
// 1120 	if (!(i % (SS(dj->fs) / SZ_DIR))) {	/* Sector changed? */
??dir_next_1:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,#+16
        UDIV     R1,R6,R0
        MLS      R1,R1,R0,R6
        CMP      R1,#+0
        BNE.N    ??dir_next_3
// 1121 		dj->sect++;					/* Next sector */
        LDR      R0,[R4, #+16]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+16]
// 1122 
// 1123 		if (dj->clust == 0) {	/* Static table */
        LDR      R0,[R4, #+12]
        CMP      R0,#+0
        BNE.N    ??dir_next_4
// 1124 			if (i >= dj->fs->n_rootdir)	/* Report EOT when end of table */
        LDR      R0,[R4, #+0]
        LDRH     R0,[R0, #+8]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,R0
        BCC.N    ??dir_next_3
// 1125 				return FR_NO_FILE;
        MOVS     R0,#+4
        B.N      ??dir_next_2
// 1126 		}
// 1127 		else {					/* Dynamic table */
// 1128 			if (((i / (SS(dj->fs) / SZ_DIR)) & (dj->fs->csize - 1)) == 0) {	/* Cluster changed? */
??dir_next_4:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+2]
        SUBS     R0,R0,#+1
        TST      R0,R6, LSR #+4
        BNE.N    ??dir_next_3
// 1129 				clst = get_fat(dj->fs, dj->clust);				/* Get next cluster */
        LDR      R1,[R4, #+12]
        LDR      R0,[R4, #+0]
          CFI FunCall get_fat
        BL       get_fat
        MOVS     R7,R0
// 1130 				if (clst <= 1) return FR_INT_ERR;
        CMP      R7,#+2
        BCS.N    ??dir_next_5
        MOVS     R0,#+2
        B.N      ??dir_next_2
// 1131 				if (clst == 0xFFFFFFFF) return FR_DISK_ERR;
??dir_next_5:
        CMN      R7,#+1
        BNE.N    ??dir_next_6
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1132 				if (clst >= dj->fs->n_fatent) {					/* When it reached end of dynamic table */
??dir_next_6:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+24]
        CMP      R7,R0
        BCC.N    ??dir_next_7
// 1133 #if !_FS_READONLY
// 1134 					BYTE c;
// 1135 					if (!stretch) return FR_NO_FILE;			/* When do not stretch, report EOT */
        CMP      R5,#+0
        BNE.N    ??dir_next_8
        MOVS     R0,#+4
        B.N      ??dir_next_2
// 1136 					clst = create_chain(dj->fs, dj->clust);		/* Stretch cluster chain */
??dir_next_8:
        LDR      R1,[R4, #+12]
        LDR      R0,[R4, #+0]
          CFI FunCall create_chain
        BL       create_chain
        MOVS     R7,R0
// 1137 					if (clst == 0) return FR_DENIED;			/* No free cluster */
        CMP      R7,#+0
        BNE.N    ??dir_next_9
        MOVS     R0,#+7
        B.N      ??dir_next_2
// 1138 					if (clst == 1) return FR_INT_ERR;
??dir_next_9:
        CMP      R7,#+1
        BNE.N    ??dir_next_10
        MOVS     R0,#+2
        B.N      ??dir_next_2
// 1139 					if (clst == 0xFFFFFFFF) return FR_DISK_ERR;
??dir_next_10:
        CMN      R7,#+1
        BNE.N    ??dir_next_11
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1140 					/* Clean-up stretched table */
// 1141 					if (move_window(dj->fs, 0)) return FR_DISK_ERR;	/* Flush active window */
??dir_next_11:
        MOVS     R1,#+0
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BEQ.N    ??dir_next_12
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1142 					mem_set(dj->fs->win, 0, SS(dj->fs));			/* Clear window buffer */
??dir_next_12:
        MOV      R2,#+512
        MOVS     R1,#+0
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,#+48
          CFI FunCall mem_set
        BL       mem_set
// 1143 					dj->fs->winsect = clust2sect(dj->fs, clst);	/* Cluster start sector */
        MOVS     R1,R7
        LDR      R0,[R4, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        LDR      R1,[R4, #+0]
        STR      R0,[R1, #+44]
// 1144 					for (c = 0; c < dj->fs->csize; c++) {		/* Fill the new cluster with 0 */
        MOVS     R5,#+0
        B.N      ??dir_next_13
// 1145 						dj->fs->wflag = 1;
// 1146 						if (move_window(dj->fs, 0)) return FR_DISK_ERR;
// 1147 						dj->fs->winsect++;
??dir_next_14:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+44]
        ADDS     R0,R0,#+1
        LDR      R1,[R4, #+0]
        STR      R0,[R1, #+44]
        ADDS     R5,R5,#+1
??dir_next_13:
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,R0
        BCS.N    ??dir_next_15
        LDR      R0,[R4, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
        MOVS     R1,#+0
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        CMP      R0,#+0
        BEQ.N    ??dir_next_14
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1148 					}
// 1149 					dj->fs->winsect -= c;						/* Rewind window address */
??dir_next_15:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+44]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        SUBS     R0,R0,R5
        LDR      R1,[R4, #+0]
        STR      R0,[R1, #+44]
// 1150 #else
// 1151 					return FR_NO_FILE;			/* Report EOT */
// 1152 #endif
// 1153 				}
// 1154 				dj->clust = clst;				/* Initialize data for new cluster */
??dir_next_7:
        STR      R7,[R4, #+12]
// 1155 				dj->sect = clust2sect(dj->fs, clst);
        MOVS     R1,R7
        LDR      R0,[R4, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        STR      R0,[R4, #+16]
// 1156 			}
// 1157 		}
// 1158 	}
// 1159 
// 1160 	dj->index = i;
??dir_next_3:
        STRH     R6,[R4, #+6]
// 1161 	dj->dir = dj->fs->win + (i % (SS(dj->fs) / SZ_DIR)) * SZ_DIR;
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,#+16
        UDIV     R1,R6,R0
        MLS      R1,R1,R0,R6
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,R1, LSL #+5
        ADDS     R0,R0,#+48
        STR      R0,[R4, #+20]
// 1162 
// 1163 	return FR_OK;
        MOVS     R0,#+0
??dir_next_2:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock12
// 1164 }

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\"*:<>?|\\177">`:
        DATA
        DC8 "\"*:<>?|\177"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+,;=[]">`:
        DATA
        DC8 "+,;=[]"
        DC8 0
// 1165 
// 1166 
// 1167 
// 1168 
// 1169 /*-----------------------------------------------------------------------*/
// 1170 /* LFN handling - Test/Pick/Fit an LFN segment from/to directory entry   */
// 1171 /*-----------------------------------------------------------------------*/
// 1172 #if _USE_LFN
// 1173 static

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// 1174 const BYTE LfnOfs[] = {1,3,5,7,9,14,16,18,20,22,24,28,30};	/* Offset of LFN chars in the directory entry */
LfnOfs:
        DATA
        DC8 1, 3, 5, 7, 9, 14, 16, 18, 20, 22, 24, 28, 30, 0, 0, 0
// 1175 
// 1176 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function cmp_lfn
        THUMB
// 1177 static
// 1178 int cmp_lfn (			/* 1:Matched, 0:Not matched */
// 1179 	WCHAR *lfnbuf,		/* Pointer to the LFN to be compared */
// 1180 	BYTE *dir			/* Pointer to the directory entry containing a part of LFN */
// 1181 )
// 1182 {
cmp_lfn:
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
// 1183 	UINT i, s;
// 1184 	WCHAR wc, uc;
// 1185 
// 1186 
// 1187 	i = ((dir[LDIR_Ord] & ~LLE) - 1) * 13;	/* Get offset in the LFN buffer */
        LDRB     R0,[R5, #+0]
        BICS     R0,R0,#0x40
        SUBS     R0,R0,#+1
        MOVS     R1,#+13
        MUL      R6,R1,R0
// 1188 	s = 0; wc = 1;
        MOVS     R7,#+0
        MOVS     R8,#+1
// 1189 	do {
// 1190 		uc = LD_WORD(dir+LfnOfs[s]);	/* Pick an LFN character from the entry */
??cmp_lfn_0:
        LDR.W    R0,??DataTable4
        LDRB     R0,[R7, R0]
        ADDS     R0,R0,R5
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable4
        LDRB     R1,[R7, R1]
        LDRB     R1,[R1, R5]
        ORRS     R0,R1,R0, LSL #+8
// 1191 		if (wc) {	/* Last char has not been processed */
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BEQ.N    ??cmp_lfn_1
// 1192 			wc = ff_wtoupper(uc);		/* Convert it to upper case */
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall ff_wtoupper
        BL       ff_wtoupper
        MOV      R8,R0
// 1193 			if (i >= _MAX_LFN || wc != ff_wtoupper(lfnbuf[i++]))	/* Compare it */
        CMP      R6,#+255
        BCS.N    ??cmp_lfn_2
        LDRH     R0,[R4, R6, LSL #+1]
          CFI FunCall ff_wtoupper
        BL       ff_wtoupper
        ADDS     R6,R6,#+1
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R8,R0
        BEQ.N    ??cmp_lfn_3
// 1194 				return 0;				/* Not matched */
??cmp_lfn_2:
        MOVS     R0,#+0
        B.N      ??cmp_lfn_4
// 1195 		} else {
// 1196 			if (uc != 0xFFFF) return 0;	/* Check filler */
??cmp_lfn_1:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVW     R1,#+65535
        CMP      R0,R1
        BEQ.N    ??cmp_lfn_3
        MOVS     R0,#+0
        B.N      ??cmp_lfn_4
// 1197 		}
// 1198 	} while (++s < 13);				/* Repeat until all chars in the entry are checked */
??cmp_lfn_3:
        ADDS     R7,R7,#+1
        CMP      R7,#+13
        BCC.N    ??cmp_lfn_0
// 1199 
// 1200 	if ((dir[LDIR_Ord] & LLE) && wc && lfnbuf[i])	/* Last segment matched but different length */
        LDRB     R0,[R5, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??cmp_lfn_5
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BEQ.N    ??cmp_lfn_5
        LDRH     R0,[R4, R6, LSL #+1]
        CMP      R0,#+0
        BEQ.N    ??cmp_lfn_5
// 1201 		return 0;
        MOVS     R0,#+0
        B.N      ??cmp_lfn_4
// 1202 
// 1203 	return 1;						/* The part of LFN matched */
??cmp_lfn_5:
        MOVS     R0,#+1
??cmp_lfn_4:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock13
// 1204 }
// 1205 
// 1206 
// 1207 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function pick_lfn
          CFI NoCalls
        THUMB
// 1208 static
// 1209 int pick_lfn (			/* 1:Succeeded, 0:Buffer overflow */
// 1210 	WCHAR *lfnbuf,		/* Pointer to the Unicode-LFN buffer */
// 1211 	BYTE *dir			/* Pointer to the directory entry */
// 1212 )
// 1213 {
pick_lfn:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
// 1214 	UINT i, s;
// 1215 	WCHAR wc, uc;
// 1216 
// 1217 
// 1218 	i = ((dir[LDIR_Ord] & 0x3F) - 1) * 13;	/* Offset in the LFN buffer */
        LDRB     R2,[R1, #+0]
        ANDS     R2,R2,#0x3F
        SUBS     R2,R2,#+1
        MOVS     R3,#+13
        MULS     R2,R3,R2
// 1219 
// 1220 	s = 0; wc = 1;
        MOVS     R3,#+0
        MOVS     R4,#+1
// 1221 	do {
// 1222 		uc = LD_WORD(dir+LfnOfs[s]);		/* Pick an LFN character from the entry */
??pick_lfn_0:
        LDR.W    R5,??DataTable4
        LDRB     R5,[R3, R5]
        ADDS     R5,R5,R1
        LDRB     R5,[R5, #+1]
        LDR.W    R6,??DataTable4
        LDRB     R6,[R3, R6]
        LDRB     R6,[R6, R1]
        ORRS     R5,R6,R5, LSL #+8
// 1223 		if (wc) {	/* Last char has not been processed */
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BEQ.N    ??pick_lfn_1
// 1224 			if (i >= _MAX_LFN) return 0;	/* Buffer overflow? */
        CMP      R2,#+255
        BCC.N    ??pick_lfn_2
        MOVS     R0,#+0
        B.N      ??pick_lfn_3
// 1225 			lfnbuf[i++] = wc = uc;			/* Store it */
??pick_lfn_2:
        MOVS     R4,R5
        STRH     R4,[R0, R2, LSL #+1]
        ADDS     R2,R2,#+1
// 1226 		} else {
// 1227 			if (uc != 0xFFFF) return 0;		/* Check filler */
// 1228 		}
// 1229 	} while (++s < 13);						/* Read all character in the entry */
??pick_lfn_4:
        ADDS     R3,R3,#+1
        CMP      R3,#+13
        BCC.N    ??pick_lfn_0
// 1230 
// 1231 	if (dir[LDIR_Ord] & LLE) {				/* Put terminator if it is the last LFN part */
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+25
        BPL.N    ??pick_lfn_5
// 1232 		if (i >= _MAX_LFN) return 0;		/* Buffer overflow? */
        CMP      R2,#+255
        BCC.N    ??pick_lfn_6
        MOVS     R0,#+0
        B.N      ??pick_lfn_3
??pick_lfn_1:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVW     R6,#+65535
        CMP      R5,R6
        BEQ.N    ??pick_lfn_4
        MOVS     R0,#+0
        B.N      ??pick_lfn_3
// 1233 		lfnbuf[i] = 0;
??pick_lfn_6:
        MOVS     R1,#+0
        STRH     R1,[R0, R2, LSL #+1]
// 1234 	}
// 1235 
// 1236 	return 1;
??pick_lfn_5:
        MOVS     R0,#+1
??pick_lfn_3:
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock14
// 1237 }
// 1238 
// 1239 
// 1240 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function fit_lfn
          CFI NoCalls
        THUMB
// 1241 static
// 1242 void fit_lfn (
// 1243 	const WCHAR *lfnbuf,	/* Pointer to the LFN buffer */
// 1244 	BYTE *dir,				/* Pointer to the directory entry */
// 1245 	BYTE ord,				/* LFN order (1-20) */
// 1246 	BYTE sum				/* SFN sum */
// 1247 )
// 1248 {
fit_lfn:
        PUSH     {R4-R7}
          CFI R7 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
// 1249 	UINT i, s;
// 1250 	WCHAR wc;
// 1251 
// 1252 
// 1253 	dir[LDIR_Chksum] = sum;			/* Set check sum */
        STRB     R3,[R1, #+13]
// 1254 	dir[LDIR_Attr] = AM_LFN;		/* Set attribute. LFN entry */
        MOVS     R3,#+15
        STRB     R3,[R1, #+11]
// 1255 	dir[LDIR_Type] = 0;
        MOVS     R3,#+0
        STRB     R3,[R1, #+12]
// 1256 	ST_WORD(dir+LDIR_FstClusLO, 0);
        MOVS     R3,#+0
        STRB     R3,[R1, #+26]
        MOVS     R3,#+0
        STRB     R3,[R1, #+27]
// 1257 
// 1258 	i = (ord - 1) * 13;				/* Get offset in the LFN buffer */
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        SUBS     R3,R2,#+1
        MOVS     R4,#+13
        MULS     R3,R4,R3
// 1259 	s = wc = 0;
        MOVS     R4,#+0
        MOVS     R5,R4
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
// 1260 	do {
// 1261 		if (wc != 0xFFFF) wc = lfnbuf[i++];	/* Get an effective char */
??fit_lfn_0:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVW     R6,#+65535
        CMP      R5,R6
        BEQ.N    ??fit_lfn_1
        LDRH     R5,[R0, R3, LSL #+1]
        ADDS     R3,R3,#+1
// 1262 		ST_WORD(dir+LfnOfs[s], wc);	/* Put it */
??fit_lfn_1:
        LDR.W    R6,??DataTable4
        LDRB     R6,[R4, R6]
        STRB     R5,[R6, R1]
        LDR.W    R6,??DataTable4
        LDRB     R6,[R4, R6]
        ADDS     R6,R6,R1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LSRS     R7,R5,#+8
        STRB     R7,[R6, #+1]
// 1263 		if (!wc) wc = 0xFFFF;		/* Padding chars following last char */
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BNE.N    ??fit_lfn_2
        MOVW     R5,#+65535
// 1264 	} while (++s < 13);
??fit_lfn_2:
        ADDS     R4,R4,#+1
        CMP      R4,#+13
        BCC.N    ??fit_lfn_0
// 1265 	if (wc == 0xFFFF || !lfnbuf[i]) ord |= LLE;	/* Bottom LFN part is the start of LFN sequence */
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVW     R4,#+65535
        CMP      R5,R4
        BEQ.N    ??fit_lfn_3
        LDRH     R0,[R0, R3, LSL #+1]
        CMP      R0,#+0
        BNE.N    ??fit_lfn_4
??fit_lfn_3:
        ORRS     R2,R2,#0x40
// 1266 	dir[LDIR_Ord] = ord;			/* Set the LFN order */
??fit_lfn_4:
        STRB     R2,[R1, #+0]
// 1267 }
        POP      {R4-R7}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock15
// 1268 
// 1269 #endif
// 1270 #endif
// 1271 
// 1272 
// 1273 
// 1274 /*-----------------------------------------------------------------------*/
// 1275 /* Create numbered name                                                  */
// 1276 /*-----------------------------------------------------------------------*/
// 1277 #if _USE_LFN

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function gen_numname
        THUMB
// 1278 void gen_numname (
// 1279 	BYTE *dst,			/* Pointer to generated SFN */
// 1280 	const BYTE *src,	/* Pointer to source SFN to be modified */
// 1281 	const WCHAR *lfn,	/* Pointer to LFN */
// 1282 	WORD seq			/* Sequence number */
// 1283 )
// 1284 {
gen_numname:
        PUSH     {R2-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R6,R2
        MOVS     R5,R3
// 1285 	BYTE ns[8], c;
// 1286 	UINT i, j;
// 1287 
// 1288 
// 1289 	mem_cpy(dst, src, 11);
        MOVS     R2,#+11
        MOVS     R0,R4
          CFI FunCall mem_cpy
        BL       mem_cpy
// 1290 
// 1291 	if (seq > 5) {	/* On many collisions, generate a hash number instead of sequential number */
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+6
        BLT.N    ??gen_numname_0
// 1292 		do seq = (seq >> 1) + (seq << 15) + (WORD)*lfn++; while (*lfn);
??gen_numname_1:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LSLS     R0,R5,#+15
        ADDS     R0,R0,R5, LSR #+1
        LDRH     R1,[R6, #+0]
        ADDS     R5,R1,R0
        ADDS     R6,R6,#+2
        LDRH     R0,[R6, #+0]
        CMP      R0,#+0
        BNE.N    ??gen_numname_1
// 1293 	}
// 1294 
// 1295 	/* itoa (hexdecimal) */
// 1296 	i = 7;
??gen_numname_0:
        MOVS     R0,#+7
// 1297 	do {
// 1298 		c = (seq % 16) + '0';
??gen_numname_2:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R1,#+16
        SDIV     R2,R5,R1
        MLS      R2,R2,R1,R5
        ADDS     R1,R2,#+48
// 1299 		if (c > '9') c += 7;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+58
        BLT.N    ??gen_numname_3
        ADDS     R1,R1,#+7
// 1300 		ns[i--] = c;
??gen_numname_3:
        ADD      R2,SP,#+0
        STRB     R1,[R0, R2]
        SUBS     R0,R0,#+1
// 1301 		seq /= 16;
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R1,#+16
        SDIV     R5,R5,R1
// 1302 	} while (seq);
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BNE.N    ??gen_numname_2
// 1303 	ns[i] = '~';
        ADD      R1,SP,#+0
        MOVS     R2,#+126
        STRB     R2,[R0, R1]
// 1304 
// 1305 	/* Append the number */
// 1306 	for (j = 0; j < i && dst[j] != ' '; j++) {
        MOVS     R1,#+0
        B.N      ??gen_numname_4
// 1307 		if (IsDBCS1(dst[j])) {
// 1308 			if (j == i - 1) break;
// 1309 			j++;
??gen_numname_5:
        ADDS     R1,R1,#+1
??gen_numname_6:
        ADDS     R1,R1,#+1
??gen_numname_4:
        CMP      R1,R0
        BCS.N    ??gen_numname_7
        LDRB     R2,[R1, R4]
        CMP      R2,#+32
        BEQ.N    ??gen_numname_7
        LDRB     R2,[R1, R4]
        SUBS     R2,R2,#+129
        CMP      R2,#+31
        BCC.N    ??gen_numname_8
        LDRB     R2,[R1, R4]
        SUBS     R2,R2,#+224
        CMP      R2,#+29
        BCS.N    ??gen_numname_6
??gen_numname_8:
        SUBS     R2,R0,#+1
        CMP      R1,R2
        BNE.N    ??gen_numname_5
// 1310 		}
// 1311 	}
// 1312 	do {
// 1313 		dst[j++] = (i < 8) ? ns[i++] : ' ';
??gen_numname_7:
        MOVS     R2,R1
        ADDS     R1,R2,#+1
        CMP      R0,#+8
        BCS.N    ??gen_numname_9
        ADD      R3,SP,#+0
        LDRB     R3,[R0, R3]
        ADDS     R0,R0,#+1
        B.N      ??gen_numname_10
??gen_numname_9:
        MOVS     R3,#+32
??gen_numname_10:
        STRB     R3,[R2, R4]
// 1314 	} while (j < 8);
        CMP      R1,#+8
        BCC.N    ??gen_numname_7
// 1315 }
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock16
// 1316 #endif
// 1317 
// 1318 
// 1319 
// 1320 
// 1321 /*-----------------------------------------------------------------------*/
// 1322 /* Calculate sum of an SFN                                               */
// 1323 /*-----------------------------------------------------------------------*/
// 1324 #if _USE_LFN

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function sum_sfn
          CFI NoCalls
        THUMB
// 1325 static
// 1326 BYTE sum_sfn (
// 1327 	const BYTE *dir		/* Ptr to directory entry */
// 1328 )
// 1329 {
// 1330 	BYTE sum = 0;
sum_sfn:
        MOVS     R1,#+0
// 1331 	UINT n = 11;
        MOVS     R2,#+11
// 1332 
// 1333 	do sum = (sum >> 1) + (sum << 7) + *dir++; while (--n);
??sum_sfn_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R3,R1,#+7
        ADDS     R1,R3,R1, LSR #+1
        LDRB     R3,[R0, #+0]
        ADDS     R1,R3,R1
        ADDS     R0,R0,#+1
        SUBS     R2,R2,#+1
        CMP      R2,#+0
        BNE.N    ??sum_sfn_0
// 1334 	return sum;
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
          CFI EndBlock cfiBlock17
// 1335 }
// 1336 #endif
// 1337 
// 1338 
// 1339 
// 1340 
// 1341 /*-----------------------------------------------------------------------*/
// 1342 /* Directory handling - Find an object in the directory                  */
// 1343 /*-----------------------------------------------------------------------*/
// 1344 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock18 Using cfiCommon0
          CFI Function dir_find
        THUMB
// 1345 static
// 1346 FRESULT dir_find (
// 1347 	DIR *dj			/* Pointer to the directory object linked to the file name */
// 1348 )
// 1349 {
dir_find:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R5,R0
// 1350 	FRESULT res;
// 1351 	BYTE c, *dir;
// 1352 #if _USE_LFN
// 1353 	BYTE a, ord, sum;
// 1354 #endif
// 1355 
// 1356 	res = dir_sdi(dj, 0);			/* Rewind directory object */
        MOVS     R1,#+0
        MOVS     R0,R5
          CFI FunCall dir_sdi
        BL       dir_sdi
        MOVS     R4,R0
// 1357 	if (res != FR_OK) return res;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??dir_find_0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??dir_find_1
// 1358 
// 1359 #if _USE_LFN
// 1360 	ord = sum = 0xFF;
??dir_find_0:
        MOVS     R7,#+255
        MOV      R8,R7
// 1361 #endif
// 1362 	do {
// 1363 		res = move_window(dj->fs, dj->sect);
??dir_find_2:
        LDR      R1,[R5, #+16]
        LDR      R0,[R5, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R4,R0
// 1364 		if (res != FR_OK) break;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??dir_find_3
// 1365 		dir = dj->dir;					/* Ptr to the directory entry of current index */
??dir_find_4:
        LDR      R6,[R5, #+20]
// 1366 		c = dir[DIR_Name];
        LDRB     R0,[R6, #+0]
// 1367 		if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??dir_find_5
        MOVS     R4,#+4
        B.N      ??dir_find_3
// 1368 #if _USE_LFN	/* LFN configuration */
// 1369 		a = dir[DIR_Attr] & AM_MASK;
??dir_find_5:
        LDRB     R1,[R6, #+11]
        ANDS     R1,R1,#0x3F
// 1370 		if (c == DDE || ((a & AM_VOL) && a != AM_LFN)) {	/* An entry without valid data */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+229
        BEQ.N    ??dir_find_6
        LSLS     R2,R1,#+28
        BPL.N    ??dir_find_7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+15
        BEQ.N    ??dir_find_7
// 1371 			ord = 0xFF;
??dir_find_6:
        MOVS     R7,#+255
// 1372 		} else {
// 1373 			if (a == AM_LFN) {			/* An LFN entry is found */
// 1374 				if (dj->lfn) {
// 1375 					if (c & LLE) {		/* Is it start of LFN sequence? */
// 1376 						sum = dir[LDIR_Chksum];
// 1377 						c &= ~LLE; ord = c;	/* LFN start order */
// 1378 						dj->lfn_idx = dj->index;
// 1379 					}
// 1380 					/* Check validity of the LFN entry and compare it with given name */
// 1381 					ord = (c == ord && sum == dir[LDIR_Chksum] && cmp_lfn(dj->lfn, dir)) ? ord - 1 : 0xFF;
// 1382 				}
// 1383 			} else {					/* An SFN entry is found */
// 1384 				if (!ord && sum == sum_sfn(dir)) break;	/* LFN matched? */
// 1385 				ord = 0xFF; dj->lfn_idx = 0xFFFF;	/* Reset LFN sequence */
// 1386 				if (!(dj->fn[NS] & NS_LOSS) && !mem_cmp(dir, dj->fn, 11)) break;	/* SFN matched? */
// 1387 			}
// 1388 		}
// 1389 #else		/* Non LFN configuration */
// 1390 		if (!(dir[DIR_Attr] & AM_VOL) && !mem_cmp(dir, dj->fn, 11)) /* Is it a valid entry? */
// 1391 			break;
// 1392 #endif
// 1393 		res = dir_next(dj, 0);		/* Next entry */
??dir_find_8:
        MOVS     R1,#+0
        MOVS     R0,R5
          CFI FunCall dir_next
        BL       dir_next
        MOVS     R4,R0
// 1394 	} while (res == FR_OK);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??dir_find_2
// 1395 
// 1396 	return res;
??dir_find_3:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??dir_find_1:
        POP      {R4-R8,PC}       ;; return
??dir_find_7:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+15
        BNE.N    ??dir_find_9
        LDR      R1,[R5, #+28]
        CMP      R1,#+0
        BEQ.N    ??dir_find_8
        LSLS     R1,R0,#+25
        BPL.N    ??dir_find_10
        LDRB     R8,[R6, #+13]
        ANDS     R0,R0,#0xBF
        MOVS     R7,R0
        LDRH     R1,[R5, #+6]
        STRH     R1,[R5, #+32]
??dir_find_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R0,R7
        BNE.N    ??dir_find_11
        LDRB     R0,[R6, #+13]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,R0
        BNE.N    ??dir_find_11
        MOVS     R1,R6
        LDR      R0,[R5, #+28]
          CFI FunCall cmp_lfn
        BL       cmp_lfn
        CMP      R0,#+0
        BEQ.N    ??dir_find_11
        SUBS     R7,R7,#+1
        B.N      ??dir_find_12
??dir_find_11:
        MOVS     R7,#+255
??dir_find_12:
        B.N      ??dir_find_8
??dir_find_9:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??dir_find_13
        MOVS     R0,R6
          CFI FunCall sum_sfn
        BL       sum_sfn
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,R0
        BEQ.N    ??dir_find_3
??dir_find_13:
        MOVS     R7,#+255
        MOVW     R0,#+65535
        STRH     R0,[R5, #+32]
        LDR      R0,[R5, #+24]
        LDRB     R0,[R0, #+11]
        LSLS     R0,R0,#+31
        BMI.N    ??dir_find_8
        MOVS     R2,#+11
        LDR      R1,[R5, #+24]
        MOVS     R0,R6
          CFI FunCall mem_cmp
        BL       mem_cmp
        CMP      R0,#+0
        BNE.N    ??dir_find_8
        B.N      ??dir_find_3
          CFI EndBlock cfiBlock18
// 1397 }
// 1398 
// 1399 
// 1400 
// 1401 
// 1402 /*-----------------------------------------------------------------------*/
// 1403 /* Read an object from the directory                                     */
// 1404 /*-----------------------------------------------------------------------*/
// 1405 #if _FS_MINIMIZE <= 1

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock19 Using cfiCommon0
          CFI Function dir_read
        THUMB
// 1406 static
// 1407 FRESULT dir_read (
// 1408 	DIR *dj			/* Pointer to the directory object that pointing the entry to be read */
// 1409 )
// 1410 {
dir_read:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
// 1411 	FRESULT res;
// 1412 	BYTE c, *dir;
// 1413 #if _USE_LFN
// 1414 	BYTE a, ord = 0xFF, sum = 0xFF;
        MOVS     R6,#+255
        MOVS     R7,#+255
// 1415 #endif
// 1416 
// 1417 	res = FR_NO_FILE;
        MOVS     R5,#+4
// 1418 	while (dj->sect) {
??dir_read_0:
        LDR      R0,[R4, #+16]
        CMP      R0,#+0
        BEQ.N    ??dir_read_1
// 1419 		res = move_window(dj->fs, dj->sect);
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
// 1420 		if (res != FR_OK) break;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_read_1
// 1421 		dir = dj->dir;					/* Ptr to the directory entry of current index */
??dir_read_2:
        LDR      R0,[R4, #+20]
// 1422 		c = dir[DIR_Name];
        LDRB     R1,[R0, #+0]
// 1423 		if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??dir_read_3
        MOVS     R5,#+4
        B.N      ??dir_read_1
// 1424 #if _USE_LFN	/* LFN configuration */
// 1425 		a = dir[DIR_Attr] & AM_MASK;
??dir_read_3:
        LDRB     R2,[R0, #+11]
        ANDS     R2,R2,#0x3F
// 1426 		if (c == DDE || (!_FS_RPATH && c == '.') || ((a & AM_VOL) && a != AM_LFN)) {	/* An entry without valid data */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+229
        BEQ.N    ??dir_read_4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+46
        BEQ.N    ??dir_read_4
        LSLS     R3,R2,#+28
        BPL.N    ??dir_read_5
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+15
        BEQ.N    ??dir_read_5
// 1427 			ord = 0xFF;
??dir_read_4:
        MOVS     R6,#+255
// 1428 		} else {
// 1429 			if (a == AM_LFN) {			/* An LFN entry is found */
// 1430 				if (c & LLE) {			/* Is it start of LFN sequence? */
// 1431 					sum = dir[LDIR_Chksum];
// 1432 					c &= ~LLE; ord = c;
// 1433 					dj->lfn_idx = dj->index;
// 1434 				}
// 1435 				/* Check LFN validity and capture it */
// 1436 				ord = (c == ord && sum == dir[LDIR_Chksum] && pick_lfn(dj->lfn, dir)) ? ord - 1 : 0xFF;
// 1437 			} else {					/* An SFN entry is found */
// 1438 				if (ord || sum != sum_sfn(dir))	/* Is there a valid LFN? */
// 1439 					dj->lfn_idx = 0xFFFF;		/* It has no LFN. */
// 1440 				break;
// 1441 			}
// 1442 		}
// 1443 #else		/* Non LFN configuration */
// 1444 		if (c != DDE && (_FS_RPATH || c != '.') && !(dir[DIR_Attr] & AM_VOL))	/* Is it a valid entry? */
// 1445 			break;
// 1446 #endif
// 1447 		res = dir_next(dj, 0);				/* Next entry */
??dir_read_6:
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_next
        BL       dir_next
        MOVS     R5,R0
// 1448 		if (res != FR_OK) break;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??dir_read_0
// 1449 	}
// 1450 
// 1451 	if (res != FR_OK) dj->sect = 0;
??dir_read_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??dir_read_7
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
// 1452 
// 1453 	return res;
??dir_read_7:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
??dir_read_5:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+15
        BNE.N    ??dir_read_8
        LSLS     R2,R1,#+25
        BPL.N    ??dir_read_9
        LDRB     R7,[R0, #+13]
        ANDS     R1,R1,#0xBF
        MOVS     R6,R1
        LDRH     R2,[R4, #+6]
        STRH     R2,[R4, #+32]
??dir_read_9:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R1,R6
        BNE.N    ??dir_read_10
        LDRB     R1,[R0, #+13]
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,R1
        BNE.N    ??dir_read_10
        MOVS     R1,R0
        LDR      R0,[R4, #+28]
          CFI FunCall pick_lfn
        BL       pick_lfn
        CMP      R0,#+0
        BEQ.N    ??dir_read_10
        SUBS     R6,R6,#+1
        B.N      ??dir_read_11
??dir_read_10:
        MOVS     R6,#+255
??dir_read_11:
        B.N      ??dir_read_6
??dir_read_8:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??dir_read_12
          CFI FunCall sum_sfn
        BL       sum_sfn
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,R0
        BEQ.N    ??dir_read_13
??dir_read_12:
        MOVW     R0,#+65535
        STRH     R0,[R4, #+32]
??dir_read_13:
        B.N      ??dir_read_1
          CFI EndBlock cfiBlock19
// 1454 }
// 1455 #endif
// 1456 
// 1457 
// 1458 
// 1459 /*-----------------------------------------------------------------------*/
// 1460 /* Register an object to the directory                                   */
// 1461 /*-----------------------------------------------------------------------*/
// 1462 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock20 Using cfiCommon0
          CFI Function dir_register
        THUMB
// 1463 static
// 1464 FRESULT dir_register (	/* FR_OK:Successful, FR_DENIED:No free entry or too many SFN collision, FR_DISK_ERR:Disk error */
// 1465 	DIR *dj				/* Target directory with object name to be created */
// 1466 )
// 1467 {
dir_register:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        SUB      SP,SP,#+16
          CFI CFA R13+40
        MOVS     R4,R0
// 1468 	FRESULT res;
// 1469 	BYTE c, *dir;
// 1470 #if _USE_LFN	/* LFN configuration */
// 1471 	WORD n, ne, is;
// 1472 	BYTE sn[12], *fn, sum;
// 1473 	WCHAR *lfn;
// 1474 
// 1475 
// 1476 	fn = dj->fn; lfn = dj->lfn;
        LDR      R7,[R4, #+24]
        LDR      R6,[R4, #+28]
// 1477 	mem_cpy(sn, fn, 12);
        MOVS     R2,#+12
        MOVS     R1,R7
        ADD      R0,SP,#+0
          CFI FunCall mem_cpy
        BL       mem_cpy
// 1478 
// 1479 	if (_FS_RPATH && (sn[NS] & NS_DOT))		/* Cannot create dot entry */
// 1480 		return FR_INVALID_NAME;
// 1481 
// 1482 	if (sn[NS] & NS_LOSS) {			/* When LFN is out of 8.3 format, generate a numbered name */
        LDRB     R0,[SP, #+11]
        LSLS     R0,R0,#+31
        BPL.N    ??dir_register_0
// 1483 		fn[NS] = 0; dj->lfn = 0;			/* Find only SFN */
        MOVS     R0,#+0
        STRB     R0,[R7, #+11]
        MOVS     R0,#+0
        STR      R0,[R4, #+28]
// 1484 		for (n = 1; n < 100; n++) {
        MOVS     R8,#+1
        B.N      ??dir_register_1
??dir_register_2:
        ADDS     R8,R8,#+1
??dir_register_1:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+100
        BGE.N    ??dir_register_3
// 1485 			gen_numname(fn, sn, lfn, n);	/* Generate a numbered name */
        MOV      R3,R8
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R6
        ADD      R1,SP,#+0
        MOVS     R0,R7
          CFI FunCall gen_numname
        BL       gen_numname
// 1486 			res = dir_find(dj);				/* Check if the name collides with existing SFN */
        MOVS     R0,R4
          CFI FunCall dir_find
        BL       dir_find
        MOVS     R5,R0
// 1487 			if (res != FR_OK) break;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??dir_register_2
// 1488 		}
// 1489 		if (n == 100) return FR_DENIED;		/* Abort if too many collisions */
??dir_register_3:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+100
        BNE.N    ??dir_register_4
        MOVS     R0,#+7
        B.N      ??dir_register_5
// 1490 		if (res != FR_NO_FILE) return res;	/* Abort if the result is other than 'not collided' */
??dir_register_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BEQ.N    ??dir_register_6
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??dir_register_5
// 1491 		fn[NS] = sn[NS]; dj->lfn = lfn;
??dir_register_6:
        LDRB     R0,[SP, #+11]
        STRB     R0,[R7, #+11]
        STR      R6,[R4, #+28]
// 1492 	}
// 1493 
// 1494 	if (sn[NS] & NS_LFN) {			/* When LFN is to be created, reserve an SFN + LFN entries. */
??dir_register_0:
        LDRB     R0,[SP, #+11]
        LSLS     R0,R0,#+30
        BPL.N    ??dir_register_7
// 1495 		for (ne = 0; lfn[ne]; ne++) ;
        MOVS     R7,#+0
        B.N      ??dir_register_8
??dir_register_9:
        ADDS     R7,R7,#+1
??dir_register_8:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRH     R0,[R6, R7, LSL #+1]
        CMP      R0,#+0
        BNE.N    ??dir_register_9
// 1496 		ne = (ne + 25) / 13;
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R0,R7,#+25
        MOVS     R1,#+13
        SDIV     R7,R0,R1
        B.N      ??dir_register_10
// 1497 	} else {						/* Otherwise reserve only an SFN entry. */
// 1498 		ne = 1;
??dir_register_7:
        MOVS     R7,#+1
// 1499 	}
// 1500 
// 1501 	/* Reserve contiguous entries */
// 1502 	res = dir_sdi(dj, 0);
??dir_register_10:
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
        MOVS     R5,R0
// 1503 	if (res != FR_OK) return res;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??dir_register_11
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??dir_register_5
// 1504 	n = is = 0;
??dir_register_11:
        MOVS     R8,#+0
        MOV      R6,R8
// 1505 	do {
// 1506 		res = move_window(dj->fs, dj->sect);
??dir_register_12:
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
// 1507 		if (res != FR_OK) break;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_13
// 1508 		c = *dj->dir;				/* Check the entry status */
??dir_register_14:
        LDR      R0,[R4, #+20]
        LDRB     R0,[R0, #+0]
// 1509 		if (c == DDE || c == 0) {	/* Is it a blank entry? */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+229
        BEQ.N    ??dir_register_15
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??dir_register_16
// 1510 			if (n == 0) is = dj->index;	/* First index of the contiguous entry */
??dir_register_15:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BNE.N    ??dir_register_17
        LDRH     R6,[R4, #+6]
// 1511 			if (++n == ne) break;	/* A contiguous entry that required count is found */
??dir_register_17:
        ADDS     R8,R8,#+1
        MOV      R0,R8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R0,R7
        BNE.N    ??dir_register_18
        B.N      ??dir_register_13
// 1512 		} else {
// 1513 			n = 0;					/* Not a blank entry. Restart to search */
??dir_register_16:
        MOVS     R8,#+0
// 1514 		}
// 1515 		res = dir_next(dj, 1);		/* Next entry with table stretch */
??dir_register_18:
        MOVS     R1,#+1
        MOVS     R0,R4
          CFI FunCall dir_next
        BL       dir_next
        MOVS     R5,R0
// 1516 	} while (res == FR_OK);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??dir_register_12
// 1517 
// 1518 	if (res == FR_OK && ne > 1) {	/* Initialize LFN entry if needed */
??dir_register_13:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_19
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+2
        BLT.N    ??dir_register_19
// 1519 		res = dir_sdi(dj, is);
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
        MOVS     R5,R0
// 1520 		if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_19
// 1521 			sum = sum_sfn(dj->fn);	/* Sum of the SFN tied to the LFN */
        LDR      R0,[R4, #+24]
          CFI FunCall sum_sfn
        BL       sum_sfn
        MOVS     R6,R0
// 1522 			ne--;
        SUBS     R7,R7,#+1
// 1523 			do {					/* Store LFN entries in bottom first */
// 1524 				res = move_window(dj->fs, dj->sect);
??dir_register_20:
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
// 1525 				if (res != FR_OK) break;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_19
// 1526 				fit_lfn(dj->lfn, dj->dir, (BYTE)ne, sum);
??dir_register_21:
        MOVS     R3,R6
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR      R1,[R4, #+20]
        LDR      R0,[R4, #+28]
          CFI FunCall fit_lfn
        BL       fit_lfn
// 1527 				dj->fs->wflag = 1;
        LDR      R0,[R4, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 1528 				res = dir_next(dj, 0);	/* Next entry */
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_next
        BL       dir_next
        MOVS     R5,R0
// 1529 			} while (res == FR_OK && --ne);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_19
        SUBS     R7,R7,#+1
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??dir_register_20
// 1530 		}
// 1531 	}
// 1532 
// 1533 #else	/* Non LFN configuration */
// 1534 	res = dir_sdi(dj, 0);
// 1535 	if (res == FR_OK) {
// 1536 		do {	/* Find a blank entry for the SFN */
// 1537 			res = move_window(dj->fs, dj->sect);
// 1538 			if (res != FR_OK) break;
// 1539 			c = *dj->dir;
// 1540 			if (c == DDE || c == 0) break;	/* Is it a blank entry? */
// 1541 			res = dir_next(dj, 1);			/* Next entry with table stretch */
// 1542 		} while (res == FR_OK);
// 1543 	}
// 1544 #endif
// 1545 
// 1546 	if (res == FR_OK) {		/* Initialize the SFN entry */
??dir_register_19:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_22
// 1547 		res = move_window(dj->fs, dj->sect);
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
// 1548 		if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_22
// 1549 			dir = dj->dir;
        LDR      R6,[R4, #+20]
// 1550 			mem_set(dir, 0, SZ_DIR);	/* Clean the entry */
        MOVS     R2,#+32
        MOVS     R1,#+0
        MOVS     R0,R6
          CFI FunCall mem_set
        BL       mem_set
// 1551 			mem_cpy(dir, dj->fn, 11);	/* Put SFN */
        MOVS     R2,#+11
        LDR      R1,[R4, #+24]
        MOVS     R0,R6
          CFI FunCall mem_cpy
        BL       mem_cpy
// 1552 #if _USE_LFN
// 1553 			dir[DIR_NTres] = *(dj->fn+NS) & (NS_BODY | NS_EXT);	/* Put NT flag */
        LDR      R0,[R4, #+24]
        LDRB     R0,[R0, #+11]
        ANDS     R0,R0,#0x18
        STRB     R0,[R6, #+12]
// 1554 #endif
// 1555 			dj->fs->wflag = 1;
        LDR      R0,[R4, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 1556 		}
// 1557 	}
// 1558 
// 1559 	return res;
??dir_register_22:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??dir_register_5:
        ADD      SP,SP,#+16
          CFI CFA R13+24
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock20
// 1560 }
// 1561 #endif /* !_FS_READONLY */
// 1562 
// 1563 
// 1564 
// 1565 
// 1566 /*-----------------------------------------------------------------------*/
// 1567 /* Remove an object from the directory                                   */
// 1568 /*-----------------------------------------------------------------------*/
// 1569 #if !_FS_READONLY && !_FS_MINIMIZE

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock21 Using cfiCommon0
          CFI Function dir_remove
        THUMB
// 1570 static
// 1571 FRESULT dir_remove (	/* FR_OK: Successful, FR_DISK_ERR: A disk error */
// 1572 	DIR *dj				/* Directory object pointing the entry to be removed */
// 1573 )
// 1574 {
dir_remove:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
// 1575 	FRESULT res;
// 1576 #if _USE_LFN	/* LFN configuration */
// 1577 	WORD i;
// 1578 
// 1579 	i = dj->index;	/* SFN index */
        LDRH     R5,[R4, #+6]
// 1580 	res = dir_sdi(dj, (WORD)((dj->lfn_idx == 0xFFFF) ? i : dj->lfn_idx));	/* Goto the SFN or top of the LFN entries */
        LDRH     R0,[R4, #+32]
        MOVW     R1,#+65535
        CMP      R0,R1
        BNE.N    ??dir_remove_0
        MOVS     R1,R5
        B.N      ??dir_remove_1
??dir_remove_0:
        LDRH     R1,[R4, #+32]
??dir_remove_1:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
// 1581 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??dir_remove_2
// 1582 		do {
// 1583 			res = move_window(dj->fs, dj->sect);
??dir_remove_3:
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
// 1584 			if (res != FR_OK) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??dir_remove_4
// 1585 			*dj->dir = DDE;			/* Mark the entry "deleted" */
??dir_remove_5:
        LDR      R1,[R4, #+20]
        MOVS     R2,#+229
        STRB     R2,[R1, #+0]
// 1586 			dj->fs->wflag = 1;
        LDR      R1,[R4, #+0]
        MOVS     R2,#+1
        STRB     R2,[R1, #+4]
// 1587 			if (dj->index >= i) break;	/* When reached SFN, all entries of the object has been deleted. */
        LDRH     R1,[R4, #+6]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R1,R5
        BCS.N    ??dir_remove_4
// 1588 			res = dir_next(dj, 0);		/* Next entry */
??dir_remove_6:
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_next
        BL       dir_next
// 1589 		} while (res == FR_OK);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??dir_remove_3
// 1590 		if (res == FR_NO_FILE) res = FR_INT_ERR;
??dir_remove_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??dir_remove_2
        MOVS     R0,#+2
// 1591 	}
// 1592 
// 1593 #else			/* Non LFN configuration */
// 1594 	res = dir_sdi(dj, dj->index);
// 1595 	if (res == FR_OK) {
// 1596 		res = move_window(dj->fs, dj->sect);
// 1597 		if (res == FR_OK) {
// 1598 			*dj->dir = DDE;			/* Mark the entry "deleted" */
// 1599 			dj->fs->wflag = 1;
// 1600 		}
// 1601 	}
// 1602 #endif
// 1603 
// 1604 	return res;
??dir_remove_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock21
// 1605 }
// 1606 #endif /* !_FS_READONLY */
// 1607 
// 1608 
// 1609 
// 1610 
// 1611 /*-----------------------------------------------------------------------*/
// 1612 /* Pick a segment and create the object name in directory form           */
// 1613 /*-----------------------------------------------------------------------*/
// 1614 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock22 Using cfiCommon0
          CFI Function create_name
        THUMB
// 1615 static
// 1616 FRESULT create_name (
// 1617 	DIR *dj,			/* Pointer to the directory object */
// 1618 	const TCHAR **path	/* Pointer to pointer to the segment in the path string */
// 1619 )
// 1620 {
create_name:
        PUSH     {R0,R4-R11,LR}
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
        MOV      R9,R1
// 1621 #ifdef _EXCVT
// 1622 	static const BYTE excvt[] = _EXCVT;	/* Upper conversion table for extended chars */
// 1623 #endif
// 1624 
// 1625 #if _USE_LFN	/* LFN configuration */
// 1626 	BYTE b, cf;
// 1627 	WCHAR w, *lfn;
// 1628 	UINT i, ni, si, di;
// 1629 	const TCHAR *p;
// 1630 
// 1631 	/* Create LFN in Unicode */
// 1632 	for (p = *path; *p == '/' || *p == '\\'; p++) ;	/* Strip duplicated separator */
        LDR      R10,[R9, #+0]
        B.N      ??create_name_0
??create_name_1:
        ADDS     R10,R10,#+1
??create_name_0:
        LDRB     R0,[R10, #+0]
        CMP      R0,#+47
        BEQ.N    ??create_name_1
        LDRB     R0,[R10, #+0]
        CMP      R0,#+92
        BEQ.N    ??create_name_1
// 1633 	lfn = dj->lfn;
        LDR      R0,[SP, #+0]
        LDR      R7,[R0, #+28]
// 1634 	si = di = 0;
        MOVS     R5,#+0
        MOVS     R6,R5
        B.N      ??create_name_2
// 1635 	for (;;) {
// 1636 		w = p[si++];					/* Get a character */
// 1637 		if (w < ' ' || w == '/' || w == '\\') break;	/* Break on end of segment */
// 1638 		if (di >= _MAX_LFN)				/* Reject too long name */
// 1639 			return FR_INVALID_NAME;
// 1640 #if !_LFN_UNICODE
// 1641 		w &= 0xFF;
// 1642 		if (IsDBCS1(w)) {				/* Check if it is a DBC 1st byte (always false on SBCS cfg) */
// 1643 			b = (BYTE)p[si++];			/* Get 2nd byte */
// 1644 			if (!IsDBCS2(b))
// 1645 				return FR_INVALID_NAME;	/* Reject invalid sequence */
// 1646 			w = (w << 8) + b;			/* Create a DBC */
// 1647 		}
// 1648 		w = ff_convert(w, 1);			/* Convert ANSI/OEM to Unicode */
// 1649 		if (!w) return FR_INVALID_NAME;	/* Reject invalid code */
// 1650 #endif
// 1651 		if (w < 0x80 && chk_chr("\"*:<>\?|\x7F", w)) /* Reject illegal chars for LFN */
// 1652 			return FR_INVALID_NAME;
// 1653 		lfn[di++] = w;					/* Store the Unicode char */
??create_name_3:
        STRH     R8,[R7, R6, LSL #+1]
        ADDS     R6,R6,#+1
??create_name_2:
        LDRB     R8,[R5, R10]
        ADDS     R5,R5,#+1
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+32
        BLT.N    ??create_name_4
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+47
        BEQ.N    ??create_name_4
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+92
        BNE.N    ??create_name_5
// 1654 	}
// 1655 	*path = &p[si];						/* Return pointer to the next segment */
??create_name_4:
        ADDS     R0,R5,R10
        STR      R0,[R9, #+0]
// 1656 	cf = (w < ' ') ? NS_LAST : 0;		/* Set last segment flag if end of path */
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+32
        BGE.N    ??create_name_6
        MOVS     R9,#+4
        B.N      ??create_name_7
??create_name_5:
        CMP      R6,#+255
        BCC.N    ??create_name_8
        MOVS     R0,#+6
        B.N      ??create_name_9
??create_name_8:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        SUBS     R0,R0,#+129
        CMP      R0,#+31
        BCC.N    ??create_name_10
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        SUBS     R0,R0,#+224
        CMP      R0,#+29
        BCS.N    ??create_name_11
??create_name_10:
        LDRB     R4,[R5, R10]
        ADDS     R5,R5,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        SUBS     R0,R4,#+64
        CMP      R0,#+63
        BCC.N    ??create_name_12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        SUBS     R0,R4,#+128
        CMP      R0,#+125
        BCC.N    ??create_name_12
        MOVS     R0,#+6
        B.N      ??create_name_9
??create_name_12:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R8,R4,R8, LSL #+8
??create_name_11:
        MOVS     R1,#+1
        MOV      R0,R8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall ff_convert
        BL       ff_convert
        MOV      R8,R0
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BNE.N    ??create_name_13
        MOVS     R0,#+6
        B.N      ??create_name_9
??create_name_13:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+128
        BGE.N    ??create_name_3
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R1,R8
        LDR.W    R0,??DataTable7
          CFI FunCall chk_chr
        BL       chk_chr
        CMP      R0,#+0
        BEQ.N    ??create_name_3
        MOVS     R0,#+6
        B.N      ??create_name_9
??create_name_6:
        MOVS     R9,#+0
??create_name_7:
        B.N      ??create_name_14
// 1657 #if _FS_RPATH
// 1658 	if ((di == 1 && lfn[di-1] == '.') || /* Is this a dot entry? */
// 1659 		(di == 2 && lfn[di-1] == '.' && lfn[di-2] == '.')) {
// 1660 		lfn[di] = 0;
// 1661 		for (i = 0; i < 11; i++)
// 1662 			dj->fn[i] = (i < di) ? '.' : ' ';
// 1663 		dj->fn[i] = cf | NS_DOT;		/* This is a dot entry */
// 1664 		return FR_OK;
// 1665 	}
// 1666 #endif
// 1667 	while (di) {						/* Strip trailing spaces and dots */
// 1668 		w = lfn[di-1];
// 1669 		if (w != ' ' && w != '.') break;
// 1670 		di--;
??create_name_15:
        SUBS     R6,R6,#+1
??create_name_14:
        CMP      R6,#+0
        BEQ.N    ??create_name_16
        ADDS     R0,R7,R6, LSL #+1
        LDRH     R8,[R0, #-2]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+32
        BEQ.N    ??create_name_15
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+46
        BEQ.N    ??create_name_15
// 1671 	}
// 1672 	if (!di) return FR_INVALID_NAME;	/* Reject nul string */
??create_name_16:
        CMP      R6,#+0
        BNE.N    ??create_name_17
        MOVS     R0,#+6
        B.N      ??create_name_9
// 1673 
// 1674 	lfn[di] = 0;						/* LFN is created */
??create_name_17:
        MOVS     R0,#+0
        STRH     R0,[R7, R6, LSL #+1]
// 1675 
// 1676 	/* Create SFN in directory form */
// 1677 	mem_set(dj->fn, ' ', 11);
        MOVS     R2,#+11
        MOVS     R1,#+32
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
          CFI FunCall mem_set
        BL       mem_set
// 1678 	for (si = 0; lfn[si] == ' ' || lfn[si] == '.'; si++) ;	/* Strip leading spaces and dots */
        MOVS     R5,#+0
        B.N      ??create_name_18
??create_name_19:
        ADDS     R5,R5,#+1
??create_name_18:
        LDRH     R0,[R7, R5, LSL #+1]
        CMP      R0,#+32
        BEQ.N    ??create_name_19
        LDRH     R0,[R7, R5, LSL #+1]
        CMP      R0,#+46
        BEQ.N    ??create_name_19
// 1679 	if (si) cf |= NS_LOSS | NS_LFN;
        CMP      R5,#+0
        BEQ.N    ??create_name_20
        ORRS     R9,R9,#0x3
        B.N      ??create_name_20
// 1680 	while (di && lfn[di - 1] != '.') di--;	/* Find extension (di<=si: no extension) */
??create_name_21:
        SUBS     R6,R6,#+1
??create_name_20:
        CMP      R6,#+0
        BEQ.N    ??create_name_22
        ADDS     R0,R7,R6, LSL #+1
        LDRH     R0,[R0, #-2]
        CMP      R0,#+46
        BNE.N    ??create_name_21
// 1681 
// 1682 	b = i = 0; ni = 8;
??create_name_22:
        MOVS     R11,#+0
        MOV      R4,R11
        MOVS     R10,#+8
        B.N      ??create_name_23
// 1683 	for (;;) {
// 1684 		w = lfn[si++];					/* Get an LFN char */
// 1685 		if (!w) break;					/* Break on end of the LFN */
// 1686 		if (w == ' ' || (w == '.' && si != di)) {	/* Remove spaces and dots */
// 1687 			cf |= NS_LOSS | NS_LFN; continue;
??create_name_24:
        ORRS     R9,R9,#0x3
// 1688 		}
??create_name_23:
        LDRH     R8,[R7, R5, LSL #+1]
        ADDS     R5,R5,#+1
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BNE.N    ??create_name_25
// 1689 
// 1690 		if (i >= ni || si == di) {		/* Extension or end of SFN */
// 1691 			if (ni == 11) {				/* Long extension */
// 1692 				cf |= NS_LOSS | NS_LFN; break;
// 1693 			}
// 1694 			if (si != di) cf |= NS_LOSS | NS_LFN;	/* Out of 8.3 format */
// 1695 			if (si > di) break;			/* No extension */
// 1696 			si = di; i = 8; ni = 11;	/* Enter extension section */
// 1697 			b <<= 2; continue;
// 1698 		}
// 1699 
// 1700 		if (w >= 0x80) {				/* Non ASCII char */
// 1701 #ifdef _EXCVT
// 1702 			w = ff_convert(w, 0);		/* Unicode -> OEM code */
// 1703 			if (w) w = excvt[w - 0x80];	/* Convert extended char to upper (SBCS) */
// 1704 #else
// 1705 			w = ff_convert(ff_wtoupper(w), 0);	/* Upper converted Unicode -> OEM code */
// 1706 #endif
// 1707 			cf |= NS_LFN;				/* Force create LFN entry */
// 1708 		}
// 1709 
// 1710 		if (_DF1S && w >= 0x100) {		/* Double byte char (always false on SBCS cfg) */
// 1711 			if (i >= ni - 1) {
// 1712 				cf |= NS_LOSS | NS_LFN; i = ni; continue;
// 1713 			}
// 1714 			dj->fn[i++] = (BYTE)(w >> 8);
// 1715 		} else {						/* Single byte char */
// 1716 			if (!w || chk_chr("+,;=[]", w)) {	/* Replace illegal chars for SFN */
// 1717 				w = '_'; cf |= NS_LOSS | NS_LFN;/* Lossy conversion */
// 1718 			} else {
// 1719 				if (IsUpper(w)) {		/* ASCII large capital */
// 1720 					b |= 2;
// 1721 				} else {
// 1722 					if (IsLower(w)) {	/* ASCII small capital */
// 1723 						b |= 1; w -= 0x20;
// 1724 					}
// 1725 				}
// 1726 			}
// 1727 		}
// 1728 		dj->fn[i++] = (BYTE)w;
// 1729 	}
// 1730 
// 1731 	if (dj->fn[0] == DDE) dj->fn[0] = NDDE;	/* If the first char collides with deleted mark, replace it with 0x05 */
??create_name_26:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+229
        BNE.N    ??create_name_27
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        MOVS     R1,#+5
        STRB     R1,[R0, #+0]
// 1732 
// 1733 	if (ni == 8) b <<= 2;
??create_name_27:
        CMP      R10,#+8
        BNE.N    ??create_name_28
        LSLS     R4,R4,#+2
// 1734 	if ((b & 0x0C) == 0x0C || (b & 0x03) == 0x03)	/* Create LFN entry when there are composite capitals */
??create_name_28:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ANDS     R0,R4,#0xC
        CMP      R0,#+12
        BEQ.N    ??create_name_29
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ANDS     R0,R4,#0x3
        CMP      R0,#+3
        BNE.N    ??create_name_30
// 1735 		cf |= NS_LFN;
??create_name_29:
        ORRS     R9,R9,#0x2
// 1736 	if (!(cf & NS_LFN)) {						/* When LFN is in 8.3 format without extended char, NT flags are created */
??create_name_30:
        LSLS     R0,R9,#+30
        BMI.N    ??create_name_31
// 1737 		if ((b & 0x03) == 0x01) cf |= NS_EXT;	/* NT flag (Extension has only small capital) */
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ANDS     R0,R4,#0x3
        CMP      R0,#+1
        BNE.N    ??create_name_32
        ORRS     R9,R9,#0x10
// 1738 		if ((b & 0x0C) == 0x04) cf |= NS_BODY;	/* NT flag (Filename has only small capital) */
??create_name_32:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ANDS     R0,R4,#0xC
        CMP      R0,#+4
        BNE.N    ??create_name_31
        ORRS     R9,R9,#0x8
// 1739 	}
// 1740 
// 1741 	dj->fn[NS] = cf;	/* SFN is created */
??create_name_31:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        STRB     R9,[R0, #+11]
// 1742 
// 1743 	return FR_OK;
        MOVS     R0,#+0
??create_name_9:
        POP      {R1,R4-R11,PC}   ;; return
??create_name_25:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+32
        BEQ.N    ??create_name_24
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+46
        BNE.N    ??create_name_33
        CMP      R5,R6
        BNE.N    ??create_name_24
??create_name_33:
        CMP      R11,R10
        BCS.N    ??create_name_34
        CMP      R5,R6
        BNE.N    ??create_name_35
??create_name_34:
        CMP      R10,#+11
        BNE.N    ??create_name_36
        ORRS     R9,R9,#0x3
        B.N      ??create_name_26
??create_name_36:
        CMP      R5,R6
        BEQ.N    ??create_name_37
        ORRS     R9,R9,#0x3
??create_name_37:
        CMP      R6,R5
        BCC.N    ??create_name_26
??create_name_38:
        MOVS     R5,R6
        MOVS     R11,#+8
        MOVS     R10,#+11
        LSLS     R4,R4,#+2
        B.N      ??create_name_23
??create_name_35:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+128
        BLT.N    ??create_name_39
        MOV      R0,R8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall ff_wtoupper
        BL       ff_wtoupper
        MOVS     R1,#+0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall ff_convert
        BL       ff_convert
        MOV      R8,R0
        ORRS     R9,R9,#0x2
??create_name_39:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+255
        BLE.N    ??create_name_40
        SUBS     R0,R10,#+1
        CMP      R11,R0
        BCC.N    ??create_name_41
        ORRS     R9,R9,#0x3
        MOV      R11,R10
        B.N      ??create_name_23
??create_name_41:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LSRS     R1,R8,#+8
        STRB     R1,[R11, R0]
        ADDS     R11,R11,#+1
        B.N      ??create_name_42
??create_name_40:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BEQ.N    ??create_name_43
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R1,R8
        LDR.W    R0,??DataTable7_1
          CFI FunCall chk_chr
        BL       chk_chr
        CMP      R0,#+0
        BEQ.N    ??create_name_44
??create_name_43:
        MOVS     R8,#+95
        ORRS     R9,R9,#0x3
        B.N      ??create_name_42
??create_name_44:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R0,R8,#+65
        CMP      R0,#+26
        BCS.N    ??create_name_45
        ORRS     R4,R4,#0x2
        B.N      ??create_name_42
??create_name_45:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R0,R8,#+97
        CMP      R0,#+26
        BCS.N    ??create_name_42
        ORRS     R4,R4,#0x1
        SUBS     R8,R8,#+32
??create_name_42:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        STRB     R8,[R11, R0]
        ADDS     R11,R11,#+1
        B.N      ??create_name_23
          CFI EndBlock cfiBlock22
// 1744 
// 1745 
// 1746 #else	/* Non-LFN configuration */
// 1747 	BYTE b, c, d, *sfn;
// 1748 	UINT ni, si, i;
// 1749 	const char *p;
// 1750 
// 1751 	/* Create file name in directory form */
// 1752 	for (p = *path; *p == '/' || *p == '\\'; p++) ;	/* Strip duplicated separator */
// 1753 	sfn = dj->fn;
// 1754 	mem_set(sfn, ' ', 11);
// 1755 	si = i = b = 0; ni = 8;
// 1756 #if _FS_RPATH
// 1757 	if (p[si] == '.') { /* Is this a dot entry? */
// 1758 		for (;;) {
// 1759 			c = (BYTE)p[si++];
// 1760 			if (c != '.' || si >= 3) break;
// 1761 			sfn[i++] = c;
// 1762 		}
// 1763 		if (c != '/' && c != '\\' && c > ' ') return FR_INVALID_NAME;
// 1764 		*path = &p[si];									/* Return pointer to the next segment */
// 1765 		sfn[NS] = (c <= ' ') ? NS_LAST | NS_DOT : NS_DOT;	/* Set last segment flag if end of path */
// 1766 		return FR_OK;
// 1767 	}
// 1768 #endif
// 1769 	for (;;) {
// 1770 		c = (BYTE)p[si++];
// 1771 		if (c <= ' ' || c == '/' || c == '\\') break;	/* Break on end of segment */
// 1772 		if (c == '.' || i >= ni) {
// 1773 			if (ni != 8 || c != '.') return FR_INVALID_NAME;
// 1774 			i = 8; ni = 11;
// 1775 			b <<= 2; continue;
// 1776 		}
// 1777 		if (c >= 0x80) {				/* Extended char? */
// 1778 			b |= 3;						/* Eliminate NT flag */
// 1779 #ifdef _EXCVT
// 1780 			c = excvt[c-0x80];			/* Upper conversion (SBCS) */
// 1781 #else
// 1782 #if !_DF1S	/* ASCII only cfg */
// 1783 			return FR_INVALID_NAME;
// 1784 #endif
// 1785 #endif
// 1786 		}
// 1787 		if (IsDBCS1(c)) {				/* Check if it is a DBC 1st byte (always false on SBCS cfg) */
// 1788 			d = (BYTE)p[si++];			/* Get 2nd byte */
// 1789 			if (!IsDBCS2(d) || i >= ni - 1)	/* Reject invalid DBC */
// 1790 				return FR_INVALID_NAME;
// 1791 			sfn[i++] = c;
// 1792 			sfn[i++] = d;
// 1793 		} else {						/* Single byte code */
// 1794 			if (chk_chr("\"*+,:;<=>\?[]|\x7F", c))	/* Reject illegal chrs for SFN */
// 1795 				return FR_INVALID_NAME;
// 1796 			if (IsUpper(c)) {			/* ASCII large capital? */
// 1797 				b |= 2;
// 1798 			} else {
// 1799 				if (IsLower(c)) {		/* ASCII small capital? */
// 1800 					b |= 1; c -= 0x20;
// 1801 				}
// 1802 			}
// 1803 			sfn[i++] = c;
// 1804 		}
// 1805 	}
// 1806 	*path = &p[si];						/* Return pointer to the next segment */
// 1807 	c = (c <= ' ') ? NS_LAST : 0;		/* Set last segment flag if end of path */
// 1808 
// 1809 	if (!i) return FR_INVALID_NAME;		/* Reject nul string */
// 1810 	if (sfn[0] == DDE) sfn[0] = NDDE;	/* When first char collides with DDE, replace it with 0x05 */
// 1811 
// 1812 	if (ni == 8) b <<= 2;
// 1813 	if ((b & 0x03) == 0x01) c |= NS_EXT;	/* NT flag (Name extension has only small capital) */
// 1814 	if ((b & 0x0C) == 0x04) c |= NS_BODY;	/* NT flag (Name body has only small capital) */
// 1815 
// 1816 	sfn[NS] = c;		/* Store NT flag, File name is created */
// 1817 
// 1818 	return FR_OK;
// 1819 #endif
// 1820 }
// 1821 
// 1822 
// 1823 
// 1824 
// 1825 /*-----------------------------------------------------------------------*/
// 1826 /* Get file information from directory entry                             */
// 1827 /*-----------------------------------------------------------------------*/
// 1828 #if _FS_MINIMIZE <= 1

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock23 Using cfiCommon0
          CFI Function get_fileinfo
        THUMB
// 1829 static
// 1830 void get_fileinfo (		/* No return code */
// 1831 	DIR *dj,			/* Pointer to the directory object */
// 1832 	FILINFO *fno	 	/* Pointer to the file information to be filled */
// 1833 )
// 1834 {
get_fileinfo:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R1
// 1835 	UINT i;
// 1836 	BYTE nt, *dir;
// 1837 	TCHAR *p, c;
// 1838 
// 1839 
// 1840 	p = fno->fname;
        ADDW     R1,R4,#+9
// 1841 	if (dj->sect) {
        LDR      R2,[R0, #+16]
        CMP      R2,#+0
        BEQ.N    ??get_fileinfo_0
// 1842 		dir = dj->dir;
        LDR      R2,[R0, #+20]
// 1843 		nt = dir[DIR_NTres];		/* NT flag */
        LDRB     R3,[R2, #+12]
// 1844 		for (i = 0; i < 8; i++) {	/* Copy name body */
        MOVS     R5,#+0
        B.N      ??get_fileinfo_1
// 1845 			c = dir[i];
// 1846 			if (c == ' ') break;
// 1847 			if (c == NDDE) c = (TCHAR)DDE;
??get_fileinfo_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+5
        BNE.N    ??get_fileinfo_3
        MOVS     R6,#+229
// 1848 			if (_USE_LFN && (nt & NS_BODY) && IsUpper(c)) c += 0x20;
??get_fileinfo_3:
        LSLS     R7,R3,#+28
        BPL.N    ??get_fileinfo_4
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        SUBS     R7,R6,#+65
        CMP      R7,#+26
        BCS.N    ??get_fileinfo_4
        ADDS     R6,R6,#+32
// 1849 #if _LFN_UNICODE
// 1850 			if (IsDBCS1(c) && i < 7 && IsDBCS2(dir[i+1]))
// 1851 				c = (c << 8) | dir[++i];
// 1852 			c = ff_convert(c, 1);
// 1853 			if (!c) c = '?';
// 1854 #endif
// 1855 			*p++ = c;
??get_fileinfo_4:
        STRB     R6,[R1, #+0]
        ADDS     R1,R1,#+1
        ADDS     R5,R5,#+1
??get_fileinfo_1:
        CMP      R5,#+8
        BCS.N    ??get_fileinfo_5
        LDRB     R6,[R5, R2]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+32
        BNE.N    ??get_fileinfo_2
// 1856 		}
// 1857 		if (dir[8] != ' ') {		/* Copy name extension */
??get_fileinfo_5:
        LDRB     R5,[R2, #+8]
        CMP      R5,#+32
        BEQ.N    ??get_fileinfo_6
// 1858 			*p++ = '.';
        MOVS     R5,#+46
        STRB     R5,[R1, #+0]
        ADDS     R1,R1,#+1
// 1859 			for (i = 8; i < 11; i++) {
        MOVS     R5,#+8
        B.N      ??get_fileinfo_7
// 1860 				c = dir[i];
// 1861 				if (c == ' ') break;
// 1862 				if (_USE_LFN && (nt & NS_EXT) && IsUpper(c)) c += 0x20;
??get_fileinfo_8:
        LSLS     R7,R3,#+27
        BPL.N    ??get_fileinfo_9
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        SUBS     R7,R6,#+65
        CMP      R7,#+26
        BCS.N    ??get_fileinfo_9
        ADDS     R6,R6,#+32
// 1863 #if _LFN_UNICODE
// 1864 				if (IsDBCS1(c) && i < 10 && IsDBCS2(dir[i+1]))
// 1865 					c = (c << 8) | dir[++i];
// 1866 				c = ff_convert(c, 1);
// 1867 				if (!c) c = '?';
// 1868 #endif
// 1869 				*p++ = c;
??get_fileinfo_9:
        STRB     R6,[R1, #+0]
        ADDS     R1,R1,#+1
        ADDS     R5,R5,#+1
??get_fileinfo_7:
        CMP      R5,#+11
        BCS.N    ??get_fileinfo_6
        LDRB     R6,[R5, R2]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+32
        BNE.N    ??get_fileinfo_8
// 1870 			}
// 1871 		}
// 1872 		fno->fattrib = dir[DIR_Attr];				/* Attribute */
??get_fileinfo_6:
        LDRB     R3,[R2, #+11]
        STRB     R3,[R4, #+8]
// 1873 		fno->fsize = LD_DWORD(dir+DIR_FileSize);	/* Size */
        LDRB     R3,[R2, #+31]
        LDRB     R5,[R2, #+30]
        LSLS     R5,R5,#+16
        ORRS     R3,R5,R3, LSL #+24
        LDRB     R5,[R2, #+29]
        ORRS     R3,R3,R5, LSL #+8
        LDRB     R5,[R2, #+28]
        ORRS     R3,R5,R3
        STR      R3,[R4, #+0]
// 1874 		fno->fdate = LD_WORD(dir+DIR_WrtDate);		/* Date */
        LDRB     R3,[R2, #+25]
        LDRB     R5,[R2, #+24]
        ORRS     R3,R5,R3, LSL #+8
        STRH     R3,[R4, #+4]
// 1875 		fno->ftime = LD_WORD(dir+DIR_WrtTime);		/* Time */
        LDRB     R3,[R2, #+23]
        LDRB     R2,[R2, #+22]
        ORRS     R2,R2,R3, LSL #+8
        STRH     R2,[R4, #+6]
// 1876 	}
// 1877 	*p = 0;		/* Terminate SFN str by a \0 */
??get_fileinfo_0:
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
// 1878 
// 1879 #if _USE_LFN
// 1880 	if (fno->lfname && fno->lfsize) {
        LDR      R1,[R4, #+24]
        CMP      R1,#+0
        BEQ.N    ??get_fileinfo_10
        LDR      R1,[R4, #+28]
        CMP      R1,#+0
        BEQ.N    ??get_fileinfo_10
// 1881 		TCHAR *tp = fno->lfname;
        LDR      R6,[R4, #+24]
// 1882 		WCHAR w, *lfn;
// 1883 
// 1884 		i = 0;
        MOVS     R5,#+0
// 1885 		if (dj->sect && dj->lfn_idx != 0xFFFF) {/* Get LFN if available */
        LDR      R1,[R0, #+16]
        CMP      R1,#+0
        BEQ.N    ??get_fileinfo_11
        LDRH     R1,[R0, #+32]
        MOVW     R2,#+65535
        CMP      R1,R2
        BEQ.N    ??get_fileinfo_11
// 1886 			lfn = dj->lfn;
        LDR      R7,[R0, #+28]
        B.N      ??get_fileinfo_12
// 1887 			while ((w = *lfn++) != 0) {			/* Get an LFN char */
// 1888 #if !_LFN_UNICODE
// 1889 				w = ff_convert(w, 0);			/* Unicode -> OEM conversion */
// 1890 				if (!w) { i = 0; break; }		/* Could not convert, no LFN */
// 1891 				if (_DF1S && w >= 0x100)		/* Put 1st byte if it is a DBC (always false on SBCS cfg) */
// 1892 					tp[i++] = (TCHAR)(w >> 8);
// 1893 #endif
// 1894 				if (i >= fno->lfsize - 1) { i = 0; break; }	/* Buffer overflow, no LFN */
// 1895 				tp[i++] = (TCHAR)w;
??get_fileinfo_13:
        STRB     R0,[R5, R6]
        ADDS     R5,R5,#+1
??get_fileinfo_12:
        LDRH     R0,[R7, #+0]
        ADDS     R7,R7,#+2
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??get_fileinfo_11
        MOVS     R1,#+0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall ff_convert
        BL       ff_convert
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??get_fileinfo_14
        MOVS     R5,#+0
        B.N      ??get_fileinfo_11
??get_fileinfo_14:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+255
        BLE.N    ??get_fileinfo_15
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R1,R0,#+8
        STRB     R1,[R5, R6]
        ADDS     R5,R5,#+1
??get_fileinfo_15:
        LDR      R1,[R4, #+28]
        SUBS     R1,R1,#+1
        CMP      R5,R1
        BCC.N    ??get_fileinfo_13
        MOVS     R5,#+0
// 1896 			}
// 1897 		}
// 1898 		tp[i] = 0;	/* Terminate the LFN str by a \0 */
??get_fileinfo_11:
        MOVS     R0,#+0
        STRB     R0,[R5, R6]
// 1899 	}
// 1900 #endif
// 1901 }
??get_fileinfo_10:
        POP      {R0,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock23
// 1902 #endif /* _FS_MINIMIZE <= 1 */
// 1903 
// 1904 
// 1905 
// 1906 
// 1907 /*-----------------------------------------------------------------------*/
// 1908 /* Follow a file path                                                    */
// 1909 /*-----------------------------------------------------------------------*/
// 1910 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock24 Using cfiCommon0
          CFI Function follow_path
        THUMB
// 1911 static
// 1912 FRESULT follow_path (	/* FR_OK(0): successful, !=0: error code */
// 1913 	DIR *dj,			/* Directory object to return last directory and found object */
// 1914 	const TCHAR *path	/* Full-path string to find a file or directory */
// 1915 )
// 1916 {
follow_path:
        PUSH     {R0,R1,R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+16
        MOVS     R4,R0
// 1917 	FRESULT res;
// 1918 	BYTE *dir, ns;
// 1919 
// 1920 
// 1921 #if _FS_RPATH
// 1922 	if (*path == '/' || *path == '\\') { /* There is a heading separator */
// 1923 		path++;	dj->sclust = 0;		/* Strip it and start from the root dir */
// 1924 	} else {							/* No heading separator */
// 1925 		dj->sclust = dj->fs->cdir;	/* Start from the current dir */
// 1926 	}
// 1927 #else
// 1928 	if (*path == '/' || *path == '\\')	/* Strip heading separator if exist */
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+47
        BEQ.N    ??follow_path_0
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+92
        BNE.N    ??follow_path_1
// 1929 		path++;
??follow_path_0:
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+4]
// 1930 	dj->sclust = 0;						/* Start from the root dir */
??follow_path_1:
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
// 1931 #endif
// 1932 
// 1933 	if ((UINT)*path < ' ') {			/* Nul path means the start directory itself */
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+32
        BCS.N    ??follow_path_2
// 1934 		res = dir_sdi(dj, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
// 1935 		dj->dir = 0;
        MOVS     R1,#+0
        STR      R1,[R4, #+20]
        B.N      ??follow_path_3
// 1936 
// 1937 	} else {							/* Follow path */
// 1938 		for (;;) {
// 1939 			res = create_name(dj, &path);	/* Get a segment */
// 1940 			if (res != FR_OK) break;
// 1941 			res = dir_find(dj);				/* Find it */
// 1942 			ns = *(dj->fn+NS);
// 1943 			if (res != FR_OK) {				/* Failed to find the object */
// 1944 				if (res != FR_NO_FILE) break;	/* Abort if any hard error occured */
// 1945 				/* Object not found */
// 1946 				if (_FS_RPATH && (ns & NS_DOT)) {	/* If dot entry is not exit */
// 1947 					dj->sclust = 0; dj->dir = 0;	/* It is the root dir */
// 1948 					res = FR_OK;
// 1949 					if (!(ns & NS_LAST)) continue;
// 1950 				} else {							/* Could not find the object */
// 1951 					if (!(ns & NS_LAST)) res = FR_NO_PATH;
// 1952 				}
// 1953 				break;
// 1954 			}
// 1955 			if (ns & NS_LAST) break;			/* Last segment match. Function completed. */
// 1956 			dir = dj->dir;						/* There is next segment. Follow the sub directory */
// 1957 			if (!(dir[DIR_Attr] & AM_DIR)) {	/* Cannot follow because it is a file */
// 1958 				res = FR_NO_PATH; break;
// 1959 			}
// 1960 			dj->sclust = LD_CLUST(dir);
??follow_path_4:
        LDRB     R1,[R0, #+21]
        LDRB     R2,[R0, #+20]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDRB     R2,[R0, #+27]
        LDRB     R0,[R0, #+26]
        ORRS     R0,R0,R2, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ORRS     R0,R0,R1, LSL #+16
        STR      R0,[R4, #+8]
??follow_path_2:
        ADD      R1,SP,#+4
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
        LDR      R1,[R4, #+24]
        LDRB     R1,[R1, #+11]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??follow_path_6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??follow_path_3
??follow_path_7:
        LSLS     R1,R1,#+29
        BMI.N    ??follow_path_8
        MOVS     R0,#+5
??follow_path_8:
        B.N      ??follow_path_3
??follow_path_6:
        LSLS     R1,R1,#+29
        BMI.N    ??follow_path_3
??follow_path_9:
        LDR      R0,[R4, #+20]
        LDRB     R1,[R0, #+11]
        LSLS     R1,R1,#+27
        BMI.N    ??follow_path_4
        MOVS     R0,#+5
// 1961 		}
// 1962 	}
// 1963 
// 1964 	return res;
??follow_path_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4,PC}    ;; return
          CFI EndBlock cfiBlock24
// 1965 }
// 1966 
// 1967 
// 1968 
// 1969 
// 1970 /*-----------------------------------------------------------------------*/
// 1971 /* Load boot record and check if it is an FAT boot record                */
// 1972 /*-----------------------------------------------------------------------*/
// 1973 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock25 Using cfiCommon0
          CFI Function check_fs
        THUMB
// 1974 static
// 1975 BYTE check_fs (	/* 0:The FAT BR, 1:Valid BR but not an FAT, 2:Not a BR, 3:Disk error */
// 1976 	FATFS *fs,	/* File system object */
// 1977 	DWORD sect	/* Sector# (lba) to check if it is an FAT boot record or not */
// 1978 )
// 1979 {
check_fs:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
// 1980 	if (disk_read(fs->drv, fs->win, sect, 1) != RES_OK)	/* Load boot record */
        MOVS     R3,#+1
        MOVS     R2,R1
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??check_fs_0
// 1981 		return 3;
        MOVS     R0,#+3
        B.N      ??check_fs_1
// 1982 	if (LD_WORD(&fs->win[BS_55AA]) != 0xAA55)		/* Check record signature (always placed at offset 510 even if the sector size is >512) */
??check_fs_0:
        LDRB     R0,[R4, #+559]
        LDRB     R1,[R4, #+558]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVW     R1,#+43605
        CMP      R0,R1
        BEQ.N    ??check_fs_2
// 1983 		return 2;
        MOVS     R0,#+2
        B.N      ??check_fs_1
// 1984 
// 1985 	if ((LD_DWORD(&fs->win[BS_FilSysType]) & 0xFFFFFF) == 0x544146)	/* Check "FAT" string */
??check_fs_2:
        LDRB     R0,[R4, #+104]
        LDRB     R1,[R4, #+103]
        LSLS     R1,R1,#+8
        ORRS     R0,R1,R0, LSL #+16
        LDRB     R1,[R4, #+102]
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable10  ;; 0x544146
        CMP      R0,R1
        BNE.N    ??check_fs_3
// 1986 		return 0;
        MOVS     R0,#+0
        B.N      ??check_fs_1
// 1987 	if ((LD_DWORD(&fs->win[BS_FilSysType32]) & 0xFFFFFF) == 0x544146)
??check_fs_3:
        LDRB     R0,[R4, #+132]
        LDRB     R1,[R4, #+131]
        LSLS     R1,R1,#+8
        ORRS     R0,R1,R0, LSL #+16
        LDRB     R1,[R4, #+130]
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable10  ;; 0x544146
        CMP      R0,R1
        BNE.N    ??check_fs_4
// 1988 		return 0;
        MOVS     R0,#+0
        B.N      ??check_fs_1
// 1989 
// 1990 	return 1;
??check_fs_4:
        MOVS     R0,#+1
??check_fs_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock25
// 1991 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     LfnOfs
// 1992 
// 1993 
// 1994 
// 1995 
// 1996 /*-----------------------------------------------------------------------*/
// 1997 /* Check if the file system object is valid or not                       */
// 1998 /*-----------------------------------------------------------------------*/
// 1999 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock26 Using cfiCommon0
          CFI Function chk_mounted
        THUMB
// 2000 static
// 2001 FRESULT chk_mounted (	/* FR_OK(0): successful, !=0: any error occurred */
// 2002 	const TCHAR **path,	/* Pointer to pointer to the path name (drive number) */
// 2003 	FATFS **rfs,		/* Pointer to pointer to the found file system object */
// 2004 	BYTE chk_wp			/* !=0: Check media write protection for write access */
// 2005 )
// 2006 {
chk_mounted:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R5,R2
// 2007 	BYTE fmt, b, *tbl;
// 2008 	UINT vol;
// 2009 	DSTATUS stat;
// 2010 	DWORD bsect, fasize, tsect, sysect, nclst, szbfat;
// 2011 	WORD nrsv;
// 2012 	const TCHAR *p = *path;
        LDR      R2,[R0, #+0]
// 2013 	FATFS *fs;
// 2014 
// 2015 	/* Get logical drive number from the path name */
// 2016 	vol = p[0] - '0';					/* Is there a drive number? */
        LDRB     R3,[R2, #+0]
        SUBS     R6,R3,#+48
// 2017 	if (vol <= 9 && p[1] == ':') {		/* Found a drive number, get and strip it */
        CMP      R6,#+10
        BCS.N    ??chk_mounted_0
        LDRB     R3,[R2, #+1]
        CMP      R3,#+58
        BNE.N    ??chk_mounted_0
// 2018 		p += 2; *path = p;				/* Return pointer to the path name */
        ADDS     R2,R2,#+2
        STR      R2,[R0, #+0]
        B.N      ??chk_mounted_1
// 2019 	} else {							/* No drive number is given */
// 2020 #if _FS_RPATH
// 2021 		vol = CurrVol;					/* Use current drive */
// 2022 #else
// 2023 		vol = 0;						/* Use drive 0 */
??chk_mounted_0:
        MOVS     R6,#+0
// 2024 #endif
// 2025 	}
// 2026 
// 2027 	/* Check if the logical drive is valid or not */
// 2028 	if (vol >= _VOLUMES) 				/* Is the drive number valid? */
??chk_mounted_1:
        CMP      R6,#+2
        BCC.N    ??chk_mounted_2
// 2029 		return FR_INVALID_DRIVE;
        MOVS     R0,#+11
        B.N      ??chk_mounted_3
// 2030 	*rfs = fs = FatFs[vol];				/* Return pointer to the corresponding file system object */
??chk_mounted_2:
        LDR.W    R0,??DataTable10_1
        LDR      R4,[R0, R6, LSL #+2]
        STR      R4,[R1, #+0]
// 2031 	if (!fs) return FR_NOT_ENABLED;		/* Is the file system object available? */
        CMP      R4,#+0
        BNE.N    ??chk_mounted_4
        MOVS     R0,#+12
        B.N      ??chk_mounted_3
// 2032 
// 2033 	ENTER_FF(fs);						/* Lock file system */
// 2034 
// 2035 	if (fs->fs_type) {					/* If the logical drive has been mounted */
??chk_mounted_4:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??chk_mounted_5
// 2036 		stat = disk_status(fs->drv);
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_status
        BL       disk_status
// 2037 		if (!(stat & STA_NOINIT)) {		/* and the physical drive is kept initialized (has not been changed), */
        LSLS     R1,R0,#+31
        BMI.N    ??chk_mounted_5
// 2038 #if !_FS_READONLY
// 2039 			if (chk_wp && (stat & STA_PROTECT))	/* Check write protection if needed */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??chk_mounted_6
        LSLS     R0,R0,#+29
        BPL.N    ??chk_mounted_6
// 2040 				return FR_WRITE_PROTECTED;
        MOVS     R0,#+10
        B.N      ??chk_mounted_3
// 2041 #endif
// 2042 			return FR_OK;				/* The file system object is valid */
??chk_mounted_6:
        MOVS     R0,#+0
        B.N      ??chk_mounted_3
// 2043 		}
// 2044 	}
// 2045 
// 2046 	/* The logical drive must be mounted. */
// 2047 	/* Following code attempts to mount a volume. (analyze BPB and initialize the fs object) */
// 2048 
// 2049 	fs->fs_type = 0;					/* Clear the file system object */
??chk_mounted_5:
        MOVS     R0,#+0
        STRB     R0,[R4, #+0]
// 2050 	fs->drv = (BYTE)LD2PD(vol);			/* Bind the logical drive and a physical drive */
        STRB     R6,[R4, #+1]
// 2051 	stat = disk_initialize(fs->drv);	/* Initialize low level disk I/O layer */
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_initialize
        BL       disk_initialize
// 2052 	if (stat & STA_NOINIT)				/* Check if the initialization succeeded */
        LSLS     R1,R0,#+31
        BPL.N    ??chk_mounted_7
// 2053 		return FR_NOT_READY;			/* Failed to initialize due to no media or hard error */
        MOVS     R0,#+3
        B.N      ??chk_mounted_3
// 2054 #if _MAX_SS != 512						/* Get disk sector size (variable sector size cfg only) */
// 2055 	if (disk_ioctl(fs->drv, GET_SECTOR_SIZE, &fs->ssize) != RES_OK)
// 2056 		return FR_DISK_ERR;
// 2057 #endif
// 2058 #if !_FS_READONLY
// 2059 	if (chk_wp && (stat & STA_PROTECT))	/* Check disk write protection if needed */
??chk_mounted_7:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??chk_mounted_8
        LSLS     R0,R0,#+29
        BPL.N    ??chk_mounted_8
// 2060 		return FR_WRITE_PROTECTED;
        MOVS     R0,#+10
        B.N      ??chk_mounted_3
// 2061 #endif
// 2062 	/* Search FAT partition on the drive. Supports only generic partitionings, FDISK and SFD. */
// 2063 	fmt = check_fs(fs, bsect = 0);		/* Check sector 0 if it is a VBR */
??chk_mounted_8:
        MOVS     R5,#+0
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall check_fs
        BL       check_fs
        MOVS     R6,R0
// 2064 	if (fmt == 1) {						/* Not an FAT-VBR, the disk may be partitioned */
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??chk_mounted_9
// 2065 		/* Check the partition listed in top of the partition table */
// 2066 		tbl = &fs->win[MBR_Table + LD2PT(vol) * SZ_PTE];/* Partition table */
        ADDW     R0,R4,#+494
// 2067 		if (tbl[4]) {									/* Is the partition existing? */
        LDRB     R1,[R0, #+4]
        CMP      R1,#+0
        BEQ.N    ??chk_mounted_9
// 2068 			bsect = LD_DWORD(&tbl[8]);					/* Partition offset in LBA */
        LDRB     R1,[R0, #+11]
        LDRB     R2,[R0, #+10]
        LSLS     R2,R2,#+16
        ORRS     R1,R2,R1, LSL #+24
        LDRB     R2,[R0, #+9]
        ORRS     R1,R1,R2, LSL #+8
        LDRB     R0,[R0, #+8]
        ORRS     R5,R0,R1
// 2069 			fmt = check_fs(fs, bsect);					/* Check the partition */
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall check_fs
        BL       check_fs
        MOVS     R6,R0
// 2070 		}
// 2071 	}
// 2072 	if (fmt == 3) return FR_DISK_ERR;
??chk_mounted_9:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+3
        BNE.N    ??chk_mounted_10
        MOVS     R0,#+1
        B.N      ??chk_mounted_3
// 2073 	if (fmt) return FR_NO_FILESYSTEM;					/* No FAT volume is found */
??chk_mounted_10:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??chk_mounted_11
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2074 
// 2075 	/* Following code initializes the file system object */
// 2076 
// 2077 	if (LD_WORD(fs->win+BPB_BytsPerSec) != SS(fs))		/* (BPB_BytsPerSec must be equal to the physical sector size) */
??chk_mounted_11:
        LDRB     R0,[R4, #+60]
        LDRB     R1,[R4, #+59]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+512
        BEQ.N    ??chk_mounted_12
// 2078 		return FR_NO_FILESYSTEM;
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2079 
// 2080 	fasize = LD_WORD(fs->win+BPB_FATSz16);				/* Number of sectors per FAT */
??chk_mounted_12:
        LDRB     R0,[R4, #+71]
        LDRB     R1,[R4, #+70]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
// 2081 	if (!fasize) fasize = LD_DWORD(fs->win+BPB_FATSz32);
        CMP      R0,#+0
        BNE.N    ??chk_mounted_13
        LDRB     R0,[R4, #+87]
        LDRB     R1,[R4, #+86]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R4, #+85]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R4, #+84]
        ORRS     R0,R1,R0
// 2082 	fs->fsize = fasize;
??chk_mounted_13:
        STR      R0,[R4, #+28]
// 2083 
// 2084 	fs->n_fats = b = fs->win[BPB_NumFATs];				/* Number of FAT copies */
        LDRB     R1,[R4, #+64]
        STRB     R1,[R4, #+3]
// 2085 	if (b != 1 && b != 2) return FR_NO_FILESYSTEM;		/* (Must be 1 or 2) */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BEQ.N    ??chk_mounted_14
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+2
        BEQ.N    ??chk_mounted_14
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2086 	fasize *= b;										/* Number of sectors for FAT area */
??chk_mounted_14:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MULS     R0,R1,R0
// 2087 
// 2088 	fs->csize = b = fs->win[BPB_SecPerClus];			/* Number of sectors per cluster */
        LDRB     R1,[R4, #+61]
        STRB     R1,[R4, #+2]
// 2089 	if (!b || (b & (b - 1))) return FR_NO_FILESYSTEM;	/* (Must be power of 2) */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??chk_mounted_15
        SUBS     R2,R1,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        TST      R1,R2
        BEQ.N    ??chk_mounted_16
??chk_mounted_15:
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2090 
// 2091 	fs->n_rootdir = LD_WORD(fs->win+BPB_RootEntCnt);	/* Number of root directory entries */
??chk_mounted_16:
        LDRB     R1,[R4, #+66]
        LDRB     R2,[R4, #+65]
        ORRS     R1,R2,R1, LSL #+8
        STRH     R1,[R4, #+8]
// 2092 	if (fs->n_rootdir % (SS(fs) / SZ_DIR)) return FR_NO_FILESYSTEM;	/* (BPB_RootEntCnt must be sector aligned) */
        LDRH     R1,[R4, #+8]
        MOVS     R2,#+16
        UDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        CMP      R3,#+0
        BEQ.N    ??chk_mounted_17
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2093 
// 2094 	tsect = LD_WORD(fs->win+BPB_TotSec16);				/* Number of sectors on the volume */
??chk_mounted_17:
        LDRB     R1,[R4, #+68]
        LDRB     R2,[R4, #+67]
        ORRS     R2,R2,R1, LSL #+8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
// 2095 	if (!tsect) tsect = LD_DWORD(fs->win+BPB_TotSec32);
        CMP      R2,#+0
        BNE.N    ??chk_mounted_18
        LDRB     R1,[R4, #+83]
        LDRB     R2,[R4, #+82]
        LSLS     R2,R2,#+16
        ORRS     R1,R2,R1, LSL #+24
        LDRB     R2,[R4, #+81]
        ORRS     R1,R1,R2, LSL #+8
        LDRB     R2,[R4, #+80]
        ORRS     R2,R2,R1
// 2096 
// 2097 	nrsv = LD_WORD(fs->win+BPB_RsvdSecCnt);				/* Number of reserved sectors */
??chk_mounted_18:
        LDRB     R1,[R4, #+63]
        LDRB     R3,[R4, #+62]
        ORRS     R1,R3,R1, LSL #+8
// 2098 	if (!nrsv) return FR_NO_FILESYSTEM;					/* (BPB_RsvdSecCnt must not be 0) */
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BNE.N    ??chk_mounted_19
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2099 
// 2100 	/* Determine the FAT sub type */
// 2101 	sysect = nrsv + fasize + fs->n_rootdir / (SS(fs) / SZ_DIR);	/* RSV+FAT+DIR */
??chk_mounted_19:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R3,R0,R1
        LDRH     R6,[R4, #+8]
        ADDS     R3,R3,R6, LSR #+4
// 2102 	if (tsect < sysect) return FR_NO_FILESYSTEM;		/* (Invalid volume size) */
        CMP      R2,R3
        BCS.N    ??chk_mounted_20
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2103 	nclst = (tsect - sysect) / fs->csize;				/* Number of clusters */
??chk_mounted_20:
        SUBS     R2,R2,R3
        LDRB     R6,[R4, #+2]
        UDIV     R2,R2,R6
// 2104 	if (!nclst) return FR_NO_FILESYSTEM;				/* (Invalid volume size) */
        CMP      R2,#+0
        BNE.N    ??chk_mounted_21
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2105 	fmt = FS_FAT12;
??chk_mounted_21:
        MOVS     R6,#+1
// 2106 	if (nclst >= MIN_FAT16) fmt = FS_FAT16;
        MOVW     R7,#+4086
        CMP      R2,R7
        BCC.N    ??chk_mounted_22
        MOVS     R6,#+2
// 2107 	if (nclst >= MIN_FAT32) fmt = FS_FAT32;
??chk_mounted_22:
        MOVW     R7,#+65526
        CMP      R2,R7
        BCC.N    ??chk_mounted_23
        MOVS     R6,#+3
// 2108 
// 2109 	/* Boundaries and Limits */
// 2110 	fs->n_fatent = nclst + 2;							/* Number of FAT entries */
??chk_mounted_23:
        ADDS     R2,R2,#+2
        STR      R2,[R4, #+24]
// 2111 	fs->database = bsect + sysect;						/* Data start sector */
        ADDS     R2,R3,R5
        STR      R2,[R4, #+40]
// 2112 	fs->fatbase = bsect + nrsv; 						/* FAT start sector */
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R1,R1,R5
        STR      R1,[R4, #+32]
// 2113 	if (fmt == FS_FAT32) {
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+3
        BNE.N    ??chk_mounted_24
// 2114 		if (fs->n_rootdir) return FR_NO_FILESYSTEM;		/* (BPB_RootEntCnt must be 0) */
        LDRH     R0,[R4, #+8]
        CMP      R0,#+0
        BEQ.N    ??chk_mounted_25
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2115 		fs->dirbase = LD_DWORD(fs->win+BPB_RootClus);	/* Root directory start cluster */
??chk_mounted_25:
        LDRB     R0,[R4, #+95]
        LDRB     R1,[R4, #+94]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R4, #+93]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R4, #+92]
        ORRS     R0,R1,R0
        STR      R0,[R4, #+36]
// 2116 		szbfat = fs->n_fatent * 4;						/* (Required FAT size) */
        LDR      R0,[R4, #+24]
        LSLS     R0,R0,#+2
        B.N      ??chk_mounted_26
// 2117 	} else {
// 2118 		if (!fs->n_rootdir)	return FR_NO_FILESYSTEM;	/* (BPB_RootEntCnt must not be 0) */
??chk_mounted_24:
        LDRH     R1,[R4, #+8]
        CMP      R1,#+0
        BNE.N    ??chk_mounted_27
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2119 		fs->dirbase = fs->fatbase + fasize;				/* Root directory start sector */
??chk_mounted_27:
        LDR      R1,[R4, #+32]
        ADDS     R0,R0,R1
        STR      R0,[R4, #+36]
// 2120 		szbfat = (fmt == FS_FAT16) ?					/* (Required FAT size) */
// 2121 			fs->n_fatent * 2 : fs->n_fatent * 3 / 2 + (fs->n_fatent & 1);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+2
        BNE.N    ??chk_mounted_28
        LDR      R0,[R4, #+24]
        LSLS     R0,R0,#+1
        B.N      ??chk_mounted_26
??chk_mounted_28:
        LDR      R0,[R4, #+24]
        MOVS     R1,#+3
        MULS     R0,R1,R0
        LDRB     R1,[R4, #+24]
        ANDS     R1,R1,#0x1
        ADDS     R0,R1,R0, LSR #+1
// 2122 	}
// 2123 	if (fs->fsize < (szbfat + (SS(fs) - 1)) / SS(fs))	/* (BPB_FATSz must not be less than required) */
??chk_mounted_26:
        LDR      R1,[R4, #+28]
        ADDW     R0,R0,#+511
        CMP      R1,R0, LSR #+9
        BCS.N    ??chk_mounted_29
// 2124 		return FR_NO_FILESYSTEM;
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2125 
// 2126 #if !_FS_READONLY
// 2127 	/* Initialize cluster allocation information */
// 2128 	fs->free_clust = 0xFFFFFFFF;
??chk_mounted_29:
        MOVS     R0,#-1
        STR      R0,[R4, #+16]
// 2129 	fs->last_clust = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+12]
// 2130 
// 2131 	/* Get fsinfo if available */
// 2132 	if (fmt == FS_FAT32) {
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+3
        BNE.N    ??chk_mounted_30
// 2133 	 	fs->fsi_flag = 0;
        MOVS     R0,#+0
        STRB     R0,[R4, #+5]
// 2134 		fs->fsi_sector = bsect + LD_WORD(fs->win+BPB_FSInfo);
        LDRB     R0,[R4, #+97]
        LDRB     R1,[R4, #+96]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADDS     R0,R0,R5
        STR      R0,[R4, #+20]
// 2135 		if (disk_read(fs->drv, fs->win, fs->fsi_sector, 1) == RES_OK &&
// 2136 			LD_WORD(fs->win+BS_55AA) == 0xAA55 &&
// 2137 			LD_DWORD(fs->win+FSI_LeadSig) == 0x41615252 &&
// 2138 			LD_DWORD(fs->win+FSI_StrucSig) == 0x61417272) {
        MOVS     R3,#+1
        LDR      R2,[R4, #+20]
        ADDS     R1,R4,#+48
        LDRB     R0,[R4, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BNE.N    ??chk_mounted_30
        LDRB     R0,[R4, #+559]
        LDRB     R1,[R4, #+558]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVW     R1,#+43605
        CMP      R0,R1
        BNE.N    ??chk_mounted_30
        LDRB     R0,[R4, #+51]
        LDRB     R1,[R4, #+50]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R4, #+49]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R4, #+48]
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable11  ;; 0x41615252
        CMP      R0,R1
        BNE.N    ??chk_mounted_30
        LDRB     R0,[R4, #+535]
        LDRB     R1,[R4, #+534]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R4, #+533]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R4, #+532]
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable11_1  ;; 0x61417272
        CMP      R0,R1
        BNE.N    ??chk_mounted_30
// 2139 				fs->last_clust = LD_DWORD(fs->win+FSI_Nxt_Free);
        LDRB     R0,[R4, #+543]
        LDRB     R1,[R4, #+542]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R4, #+541]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R4, #+540]
        ORRS     R0,R1,R0
        STR      R0,[R4, #+12]
// 2140 				fs->free_clust = LD_DWORD(fs->win+FSI_Free_Count);
        LDRB     R0,[R4, #+539]
        LDRB     R1,[R4, #+538]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R4, #+537]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R4, #+536]
        ORRS     R0,R1,R0
        STR      R0,[R4, #+16]
// 2141 		}
// 2142 	}
// 2143 #endif
// 2144 	fs->fs_type = fmt;		/* FAT sub-type */
??chk_mounted_30:
        STRB     R6,[R4, #+0]
// 2145 	fs->id = ++Fsid;		/* File system mount ID */
        LDR.W    R0,??DataTable11_2
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_2
        STRH     R0,[R1, #+0]
        STRH     R0,[R4, #+6]
// 2146 	fs->winsect = 0;		/* Invalidate sector cache */
        MOVS     R0,#+0
        STR      R0,[R4, #+44]
// 2147 	fs->wflag = 0;
        MOVS     R0,#+0
        STRB     R0,[R4, #+4]
// 2148 #if _FS_RPATH
// 2149 	fs->cdir = 0;			/* Current directory (root dir) */
// 2150 #endif
// 2151 #if _FS_SHARE				/* Clear file lock semaphores */
// 2152 	clear_lock(fs);
// 2153 #endif
// 2154 
// 2155 	return FR_OK;
        MOVS     R0,#+0
??chk_mounted_3:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock26
// 2156 }
// 2157 
// 2158 
// 2159 
// 2160 
// 2161 /*-----------------------------------------------------------------------*/
// 2162 /* Check if the file/dir object is valid or not                          */
// 2163 /*-----------------------------------------------------------------------*/
// 2164 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock27 Using cfiCommon0
          CFI Function validate
        THUMB
// 2165 static
// 2166 FRESULT validate (	/* FR_OK(0): The object is valid, !=0: Invalid */
// 2167 	FATFS *fs,		/* Pointer to the file system object */
// 2168 	WORD id			/* Member id of the target object to be checked */
// 2169 )
// 2170 {
validate:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
// 2171 	if (!fs || !fs->fs_type || fs->id != id)
        CMP      R0,#+0
        BEQ.N    ??validate_0
        LDRB     R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??validate_0
        LDRH     R2,[R0, #+6]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R2,R1
        BEQ.N    ??validate_1
// 2172 		return FR_INVALID_OBJECT;
??validate_0:
        MOVS     R0,#+9
        B.N      ??validate_2
// 2173 
// 2174 	ENTER_FF(fs);		/* Lock file system */
// 2175 
// 2176 	if (disk_status(fs->drv) & STA_NOINIT)
??validate_1:
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_status
        BL       disk_status
        LSLS     R0,R0,#+31
        BPL.N    ??validate_3
// 2177 		return FR_NOT_READY;
        MOVS     R0,#+3
        B.N      ??validate_2
// 2178 
// 2179 	return FR_OK;
??validate_3:
        MOVS     R0,#+0
??validate_2:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock27
// 2180 }
// 2181 
// 2182 
// 2183 
// 2184 
// 2185 /*--------------------------------------------------------------------------
// 2186 
// 2187    Public Functions
// 2188 
// 2189 --------------------------------------------------------------------------*/
// 2190 
// 2191 
// 2192 
// 2193 /*-----------------------------------------------------------------------*/
// 2194 /* Mount/Unmount a Logical Drive                                         */
// 2195 /*-----------------------------------------------------------------------*/
// 2196 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock28 Using cfiCommon0
          CFI Function f_mount
          CFI NoCalls
        THUMB
// 2197 FRESULT f_mount (
// 2198 	BYTE vol,		/* Logical drive number to be mounted/unmounted */
// 2199 	FATFS *fs		/* Pointer to new file system object (NULL for unmount)*/
// 2200 )
// 2201 {
// 2202 	FATFS *rfs;
// 2203 
// 2204 
// 2205 	if (vol >= _VOLUMES)			/* Check if the drive number is valid */
f_mount:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BLT.N    ??f_mount_0
// 2206 		return FR_INVALID_DRIVE;
        MOVS     R0,#+11
        B.N      ??f_mount_1
// 2207 	rfs = FatFs[vol];				/* Get current fs object */
??f_mount_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable10_1
        LDR      R2,[R2, R0, LSL #+2]
// 2208 
// 2209 	if (rfs) {
        CMP      R2,#+0
        BEQ.N    ??f_mount_2
// 2210 #if _FS_SHARE
// 2211 		clear_lock(rfs);
// 2212 #endif
// 2213 #if _FS_REENTRANT					/* Discard sync object of the current volume */
// 2214 		if (!ff_del_syncobj(rfs->sobj)) return FR_INT_ERR;
// 2215 #endif
// 2216 		rfs->fs_type = 0;			/* Clear old fs object */
        MOVS     R3,#+0
        STRB     R3,[R2, #+0]
// 2217 	}
// 2218 
// 2219 	if (fs) {
??f_mount_2:
        CMP      R1,#+0
        BEQ.N    ??f_mount_3
// 2220 		fs->fs_type = 0;			/* Clear new fs object */
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
// 2221 #if _FS_REENTRANT					/* Create sync object for the new volume */
// 2222 		if (!ff_cre_syncobj(vol, &fs->sobj)) return FR_INT_ERR;
// 2223 #endif
// 2224 	}
// 2225 	FatFs[vol] = fs;				/* Register new fs object */
??f_mount_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable10_1
        STR      R1,[R2, R0, LSL #+2]
// 2226 
// 2227 	return FR_OK;
        MOVS     R0,#+0
??f_mount_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock28
// 2228 }
// 2229 
// 2230 
// 2231 
// 2232 
// 2233 /*-----------------------------------------------------------------------*/
// 2234 /* Open or Create a File                                                 */
// 2235 /*-----------------------------------------------------------------------*/
// 2236 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock29 Using cfiCommon0
          CFI Function f_open
        THUMB
// 2237 FRESULT f_open (
// 2238 	FIL *fp,			/* Pointer to the blank file object */
// 2239 	const TCHAR *path,	/* Pointer to the file name */
// 2240 	BYTE mode			/* Access mode and file open mode flags */
// 2241 )
// 2242 {
f_open:
        PUSH     {R1,R4-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        SUB      SP,SP,#+48
          CFI CFA R13+80
        MOVS     R4,R0
        MOVS     R5,R2
// 2243 	FRESULT res;
// 2244 	DIR dj;
// 2245 	BYTE *dir;
// 2246 	DEF_NAMEBUF;
// 2247 
// 2248 
// 2249 	fp->fs = 0;			/* Clear file object */
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
// 2250 
// 2251 #if !_FS_READONLY
// 2252 	mode &= FA_READ | FA_WRITE | FA_CREATE_ALWAYS | FA_OPEN_ALWAYS | FA_CREATE_NEW;
        ANDS     R5,R5,#0x1F
// 2253 	res = chk_mounted(&path, &dj.fs, (BYTE)(mode & ~FA_READ));
        ANDS     R2,R5,#0xFE
        ADD      R1,SP,#+0
        ADD      R0,SP,#+48
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOVS     R6,R0
// 2254 #else
// 2255 	mode &= FA_READ;
// 2256 	res = chk_mounted(&path, &dj.fs, 0);
// 2257 #endif
// 2258 	INIT_BUF(dj);
        ADD      R0,SP,#+36
        STR      R0,[SP, #+24]
        LDR.W    R0,??DataTable11_3
        STR      R0,[SP, #+28]
// 2259 	if (res == FR_OK)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_0
// 2260 		res = follow_path(&dj, path);	/* Follow the file path */
        LDR      R1,[SP, #+48]
        ADD      R0,SP,#+0
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R6,R0
// 2261 	dir = dj.dir;
??f_open_0:
        LDR      R7,[SP, #+20]
// 2262 
// 2263 #if !_FS_READONLY	/* R/W configuration */
// 2264 	if (res == FR_OK) {
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_1
// 2265 		if (!dir)	/* Current dir itself */
        CMP      R7,#+0
        BNE.N    ??f_open_1
// 2266 			res = FR_INVALID_NAME;
        MOVS     R6,#+6
// 2267 #if _FS_SHARE
// 2268 		else
// 2269 			res = chk_lock(&dj, (mode & ~FA_READ) ? 1 : 0);
// 2270 #endif
// 2271 	}
// 2272 	/* Create or Open a file */
// 2273 	if (mode & (FA_CREATE_ALWAYS | FA_OPEN_ALWAYS | FA_CREATE_NEW)) {
??f_open_1:
        MOVS     R0,#+28
        TST      R5,R0
        BEQ.N    ??f_open_2
// 2274 		DWORD dw, cl;
// 2275 
// 2276 		if (res != FR_OK) {					/* No file, create new */
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??f_open_3
// 2277 			if (res == FR_NO_FILE)			/* There is no file to open, create a new entry */
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BNE.N    ??f_open_4
// 2278 #if _FS_SHARE
// 2279 				res = enq_lock(dj.fs) ? dir_register(&dj) : FR_TOO_MANY_OPEN_FILES;
// 2280 #else
// 2281 				res = dir_register(&dj);
        ADD      R0,SP,#+0
          CFI FunCall dir_register
        BL       dir_register
        MOVS     R6,R0
// 2282 #endif
// 2283 			mode |= FA_CREATE_ALWAYS;		/* File is created */
??f_open_4:
        ORRS     R5,R5,#0x8
// 2284 			dir = dj.dir;					/* New entry */
        LDR      R7,[SP, #+20]
        B.N      ??f_open_5
// 2285 		}
// 2286 		else {								/* Any object is already existing */
// 2287 			if (dir[DIR_Attr] & (AM_RDO | AM_DIR)) {	/* Cannot overwrite it (R/O or DIR) */
??f_open_3:
        LDRB     R0,[R7, #+11]
        MOVS     R1,#+17
        TST      R0,R1
        BEQ.N    ??f_open_6
// 2288 				res = FR_DENIED;
        MOVS     R6,#+7
        B.N      ??f_open_5
// 2289 			} else {
// 2290 				if (mode & FA_CREATE_NEW)	/* Cannot create as new file */
??f_open_6:
        LSLS     R0,R5,#+29
        BPL.N    ??f_open_5
// 2291 					res = FR_EXIST;
        MOVS     R6,#+8
// 2292 			}
// 2293 		}
// 2294 		if (res == FR_OK && (mode & FA_CREATE_ALWAYS)) {	/* Truncate it if overwrite mode */
??f_open_5:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_7
        LSLS     R0,R5,#+28
        BPL.N    ??f_open_7
// 2295 			dw = get_fattime();					/* Created time */
          CFI FunCall get_fattime
        BL       get_fattime
        MOV      R8,R0
// 2296 			ST_DWORD(dir+DIR_CrtTime, dw);
        STRB     R8,[R7, #+14]
        MOV      R0,R8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R7, #+15]
        LSRS     R0,R8,#+16
        STRB     R0,[R7, #+16]
        LSRS     R0,R8,#+24
        STRB     R0,[R7, #+17]
// 2297 			dir[DIR_Attr] = 0;					/* Reset attribute */
        MOVS     R0,#+0
        STRB     R0,[R7, #+11]
// 2298 			ST_DWORD(dir+DIR_FileSize, 0);		/* size = 0 */
        MOVS     R0,#+0
        STRB     R0,[R7, #+28]
        MOVS     R0,#+0
        STRB     R0,[R7, #+29]
        MOVS     R0,#+0
        STRB     R0,[R7, #+30]
        MOVS     R0,#+0
        STRB     R0,[R7, #+31]
// 2299 			cl = LD_CLUST(dir);					/* Get start cluster */
        LDRB     R0,[R7, #+21]
        LDRB     R1,[R7, #+20]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDRB     R1,[R7, #+27]
        LDRB     R2,[R7, #+26]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R9,R1,R0, LSL #+16
// 2300 			ST_CLUST(dir, 0);					/* cluster = 0 */
        MOVS     R0,#+0
        STRB     R0,[R7, #+26]
        MOVS     R0,#+0
        STRB     R0,[R7, #+27]
        MOVS     R0,#+0
        STRB     R0,[R7, #+20]
        MOVS     R0,#+0
        STRB     R0,[R7, #+21]
// 2301 			dj.fs->wflag = 1;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 2302 			if (cl) {							/* Remove the cluster chain if exist */
        CMP      R9,#+0
        BEQ.N    ??f_open_7
// 2303 				dw = dj.fs->winsect;
        LDR      R0,[SP, #+0]
        LDR      R8,[R0, #+44]
// 2304 				res = remove_chain(dj.fs, cl);
        MOV      R1,R9
        LDR      R0,[SP, #+0]
          CFI FunCall remove_chain
        BL       remove_chain
        MOVS     R6,R0
// 2305 				if (res == FR_OK) {
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_7
// 2306 					dj.fs->last_clust = cl - 1;	/* Reuse the cluster hole */
        LDR      R0,[SP, #+0]
        SUBS     R1,R9,#+1
        STR      R1,[R0, #+12]
// 2307 					res = move_window(dj.fs, dw);
        MOV      R1,R8
        LDR      R0,[SP, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R6,R0
        B.N      ??f_open_7
// 2308 				}
// 2309 			}
// 2310 		}
// 2311 	}
// 2312 	else {	/* Open an existing file */
// 2313 		if (res == FR_OK) {						/* Follow succeeded */
??f_open_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_7
// 2314 			if (dir[DIR_Attr] & AM_DIR) {		/* It is a directory */
        LDRB     R0,[R7, #+11]
        LSLS     R0,R0,#+27
        BPL.N    ??f_open_8
// 2315 				res = FR_NO_FILE;
        MOVS     R6,#+4
        B.N      ??f_open_7
// 2316 			} else {
// 2317 				if ((mode & FA_WRITE) && (dir[DIR_Attr] & AM_RDO)) /* R/O violation */
??f_open_8:
        LSLS     R0,R5,#+30
        BPL.N    ??f_open_7
        LDRB     R0,[R7, #+11]
        LSLS     R0,R0,#+31
        BPL.N    ??f_open_7
// 2318 					res = FR_DENIED;
        MOVS     R6,#+7
// 2319 			}
// 2320 		}
// 2321 	}
// 2322 	if (res == FR_OK) {
??f_open_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_9
// 2323 		if (mode & FA_CREATE_ALWAYS)			/* Set file change flag if created or overwritten */
        LSLS     R0,R5,#+28
        BPL.N    ??f_open_10
// 2324 			mode |= FA__WRITTEN;
        ORRS     R5,R5,#0x20
// 2325 		fp->dir_sect = dj.fs->winsect;			/* Pointer to the directory entry */
??f_open_10:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+44]
        STR      R0,[R4, #+28]
// 2326 		fp->dir_ptr = dir;
        STR      R7,[R4, #+32]
// 2327 #if _FS_SHARE
// 2328 		fp->lockid = inc_lock(&dj, (mode & ~FA_READ) ? 1 : 0);
// 2329 		if (!fp->lockid) res = FR_INT_ERR;
// 2330 #endif
// 2331 	}
// 2332 
// 2333 #else				/* R/O configuration */
// 2334 	if (res == FR_OK) {					/* Follow succeeded */
// 2335 		if (!dir) {						/* Current dir itself */
// 2336 			res = FR_INVALID_NAME;
// 2337 		} else {
// 2338 			if (dir[DIR_Attr] & AM_DIR)	/* It is a directory */
// 2339 				res = FR_NO_FILE;
// 2340 		}
// 2341 	}
// 2342 #endif
// 2343 	FREE_BUF();
// 2344 
// 2345 	if (res == FR_OK) {
??f_open_9:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_11
// 2346 		fp->flag = mode;					/* File access mode */
        STRB     R5,[R4, #+6]
// 2347 		fp->sclust = LD_CLUST(dir);			/* File start cluster */
        LDRB     R0,[R7, #+21]
        LDRB     R1,[R7, #+20]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDRB     R1,[R7, #+27]
        LDRB     R2,[R7, #+26]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R1,R0, LSL #+16
        STR      R0,[R4, #+16]
// 2348 		fp->fsize = LD_DWORD(dir+DIR_FileSize);	/* File size */
        LDRB     R0,[R7, #+31]
        LDRB     R1,[R7, #+30]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R7, #+29]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R7, #+28]
        ORRS     R0,R1,R0
        STR      R0,[R4, #+12]
// 2349 		fp->fptr = 0;						/* File pointer */
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
// 2350 		fp->dsect = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+24]
// 2351 #if _USE_FASTSEEK
// 2352 		fp->cltbl = 0;						/* Normal seek mode */
// 2353 #endif
// 2354 		fp->fs = dj.fs; fp->id = dj.fs->id;	/* Validate file object */
        LDR      R0,[SP, #+0]
        STR      R0,[R4, #+0]
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+6]
        STRH     R0,[R4, #+4]
// 2355 	}
// 2356 
// 2357 	LEAVE_FF(dj.fs, res);
??f_open_11:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+52
          CFI CFA R13+28
        POP      {R4-R9,PC}       ;; return
          CFI EndBlock cfiBlock29
// 2358 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     `?<Constant "\\"*:<>?|\\177">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     `?<Constant "+,;=[]">`
// 2359 
// 2360 
// 2361 
// 2362 
// 2363 /*-----------------------------------------------------------------------*/
// 2364 /* Read File                                                             */
// 2365 /*-----------------------------------------------------------------------*/
// 2366 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock30 Using cfiCommon0
          CFI Function f_read
        THUMB
// 2367 FRESULT f_read (
// 2368 	FIL *fp, 		/* Pointer to the file object */
// 2369 	void *buff,		/* Pointer to data buffer */
// 2370 	UINT btr,		/* Number of bytes to read */
// 2371 	UINT *br		/* Pointer to number of bytes read */
// 2372 )
// 2373 {
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
        MOVS     R5,R0
        MOVS     R6,R2
        MOVS     R7,R3
// 2374 	FRESULT res;
// 2375 	DWORD clst, sect, remain;
// 2376 	UINT rcnt, cc;
// 2377 	BYTE csect, *rbuff = buff;
        MOVS     R4,R1
// 2378 
// 2379 
// 2380 	*br = 0;	/* Initialize byte counter */
        MOVS     R0,#+0
        STR      R0,[R7, #+0]
// 2381 
// 2382 	res = validate(fp->fs, fp->id);				/* Check validity */
        LDRH     R1,[R5, #+4]
        LDR      R0,[R5, #+0]
          CFI FunCall validate
        BL       validate
// 2383 	if (res != FR_OK) LEAVE_FF(fp->fs, res);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??f_read_0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??f_read_1
// 2384 	if (fp->flag & FA__ERROR)					/* Aborted file? */
??f_read_0:
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+24
        BPL.N    ??f_read_2
// 2385 		LEAVE_FF(fp->fs, FR_INT_ERR);
        MOVS     R0,#+2
        B.N      ??f_read_1
// 2386 	if (!(fp->flag & FA_READ)) 					/* Check access mode */
??f_read_2:
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+31
        BMI.N    ??f_read_3
// 2387 		LEAVE_FF(fp->fs, FR_DENIED);
        MOVS     R0,#+7
        B.N      ??f_read_1
// 2388 	remain = fp->fsize - fp->fptr;
??f_read_3:
        LDR      R0,[R5, #+12]
        LDR      R1,[R5, #+8]
        SUBS     R0,R0,R1
// 2389 	if (btr > remain) btr = (UINT)remain;		/* Truncate btr by remaining bytes */
        CMP      R0,R6
        BCS.N    ??f_read_4
        MOVS     R6,R0
        B.N      ??f_read_4
// 2390 
// 2391 	for ( ;  btr;								/* Repeat until all data read */
// 2392 		rbuff += rcnt, fp->fptr += rcnt, *br += rcnt, btr -= rcnt) {
// 2393 		if ((fp->fptr % SS(fp->fs)) == 0) {		/* On the sector boundary? */
// 2394 			csect = (BYTE)(fp->fptr / SS(fp->fs) & (fp->fs->csize - 1));	/* Sector offset in the cluster */
// 2395 			if (!csect) {						/* On the cluster boundary? */
// 2396 				if (fp->fptr == 0) {			/* On the top of the file? */
// 2397 					clst = fp->sclust;			/* Follow from the origin */
// 2398 				} else {						/* Middle or end of the file */
// 2399 #if _USE_FASTSEEK
// 2400 					if (fp->cltbl)
// 2401 						clst = clmt_clust(fp, fp->fptr);	/* Get cluster# from the CLMT */
// 2402 					else
// 2403 #endif
// 2404 						clst = get_fat(fp->fs, fp->clust);	/* Follow cluster chain on the FAT */
// 2405 				}
// 2406 				if (clst < 2) ABORT(fp->fs, FR_INT_ERR);
// 2407 				if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
// 2408 				fp->clust = clst;				/* Update current cluster */
// 2409 			}
// 2410 			sect = clust2sect(fp->fs, fp->clust);	/* Get current sector */
// 2411 			if (!sect) ABORT(fp->fs, FR_INT_ERR);
// 2412 			sect += csect;
// 2413 			cc = btr / SS(fp->fs);				/* When remaining bytes >= sector size, */
// 2414 			if (cc) {							/* Read maximum contiguous sectors directly */
// 2415 				if (csect + cc > fp->fs->csize)	/* Clip at cluster boundary */
// 2416 					cc = fp->fs->csize - csect;
// 2417 				if (disk_read(fp->fs->drv, rbuff, sect, (BYTE)cc) != RES_OK)
// 2418 					ABORT(fp->fs, FR_DISK_ERR);
// 2419 #if !_FS_READONLY && _FS_MINIMIZE <= 2			/* Replace one of the read sectors with cached data if it contains a dirty sector */
// 2420 #if _FS_TINY
// 2421 				if (fp->fs->wflag && fp->fs->winsect - sect < cc)
// 2422 					mem_cpy(rbuff + ((fp->fs->winsect - sect) * SS(fp->fs)), fp->fs->win, SS(fp->fs));
// 2423 #else
// 2424 				if ((fp->flag & FA__DIRTY) && fp->dsect - sect < cc)
// 2425 					mem_cpy(rbuff + ((fp->dsect - sect) * SS(fp->fs)), fp->buf, SS(fp->fs));
// 2426 #endif
// 2427 #endif
// 2428 				rcnt = SS(fp->fs) * cc;			/* Number of bytes transferred */
// 2429 				continue;
// 2430 			}
// 2431 #if !_FS_TINY
// 2432 			if (fp->dsect != sect) {			/* Load data sector if not in cache */
// 2433 #if !_FS_READONLY
// 2434 				if (fp->flag & FA__DIRTY) {		/* Write-back dirty sector cache */
// 2435 					if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
// 2436 						ABORT(fp->fs, FR_DISK_ERR);
// 2437 					fp->flag &= ~FA__DIRTY;
// 2438 				}
// 2439 #endif
// 2440 				if (disk_read(fp->fs->drv, fp->buf, sect, 1) != RES_OK)	/* Fill sector cache */
// 2441 					ABORT(fp->fs, FR_DISK_ERR);
// 2442 			}
// 2443 #endif
// 2444 			fp->dsect = sect;
??f_read_5:
        STR      R9,[R5, #+24]
// 2445 		}
// 2446 		rcnt = SS(fp->fs) - (fp->fptr % SS(fp->fs));	/* Get partial sector data from sector buffer */
??f_read_6:
        LDR      R0,[R5, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        RSBS     R8,R2,#+512
// 2447 		if (rcnt > btr) rcnt = btr;
        CMP      R6,R8
        BCS.N    ??f_read_7
        MOV      R8,R6
// 2448 #if _FS_TINY
// 2449 		if (move_window(fp->fs, fp->dsect))		/* Move sector window */
// 2450 			ABORT(fp->fs, FR_DISK_ERR);
// 2451 		mem_cpy(rbuff, &fp->fs->win[fp->fptr % SS(fp->fs)], rcnt);	/* Pick partial sector */
// 2452 #else
// 2453 		mem_cpy(rbuff, &fp->buf[fp->fptr % SS(fp->fs)], rcnt);	/* Pick partial sector */
??f_read_7:
        MOV      R2,R8
        LDR      R0,[R5, #+8]
        MOV      R1,#+512
        UDIV     R3,R0,R1
        MLS      R3,R3,R1,R0
        ADDS     R0,R3,R5
        ADDS     R1,R0,#+36
        MOVS     R0,R4
          CFI FunCall mem_cpy
        BL       mem_cpy
??f_read_8:
        ADDS     R4,R8,R4
        LDR      R0,[R5, #+8]
        ADDS     R0,R8,R0
        STR      R0,[R5, #+8]
        LDR      R0,[R7, #+0]
        ADDS     R0,R8,R0
        STR      R0,[R7, #+0]
        SUBS     R6,R6,R8
??f_read_4:
        CMP      R6,#+0
        BEQ.W    ??f_read_9
        LDR      R0,[R5, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BNE.N    ??f_read_6
        LDR      R0,[R5, #+8]
        LSRS     R0,R0,#+9
        LDR      R1,[R5, #+0]
        LDRB     R1,[R1, #+2]
        SUBS     R1,R1,#+1
        ANDS     R8,R1,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??f_read_10
        LDR      R0,[R5, #+8]
        CMP      R0,#+0
        BNE.N    ??f_read_11
        LDR      R0,[R5, #+16]
        B.N      ??f_read_12
??f_read_11:
        LDR      R1,[R5, #+20]
        LDR      R0,[R5, #+0]
          CFI FunCall get_fat
        BL       get_fat
??f_read_12:
        CMP      R0,#+2
        BCS.N    ??f_read_13
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+2
        B.N      ??f_read_1
??f_read_13:
        CMN      R0,#+1
        BNE.N    ??f_read_14
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_read_1
??f_read_14:
        STR      R0,[R5, #+20]
??f_read_10:
        LDR      R1,[R5, #+20]
        LDR      R0,[R5, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        MOV      R9,R0
        CMP      R9,#+0
        BNE.N    ??f_read_15
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+2
        B.N      ??f_read_1
??f_read_15:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ADDS     R9,R8,R9
        LSRS     R10,R6,#+9
        CMP      R10,#+0
        BEQ.N    ??f_read_16
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+2]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ADDS     R1,R10,R8
        CMP      R0,R1
        BCS.N    ??f_read_17
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+2]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        SUBS     R10,R0,R8
??f_read_17:
        MOV      R3,R10
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOV      R2,R9
        MOVS     R1,R4
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??f_read_18
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_read_1
??f_read_18:
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_read_19
        LDR      R0,[R5, #+24]
        SUBS     R0,R0,R9
        CMP      R0,R10
        BCS.N    ??f_read_19
        MOV      R2,#+512
        ADDS     R1,R5,#+36
        LDR      R0,[R5, #+24]
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
        LDR      R0,[R5, #+24]
        CMP      R0,R9
        BEQ.W    ??f_read_5
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_read_20
        MOVS     R3,#+1
        LDR      R2,[R5, #+24]
        ADDS     R1,R5,#+36
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_read_21
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_read_1
??f_read_21:
        LDRB     R0,[R5, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R5, #+6]
??f_read_20:
        MOVS     R3,#+1
        MOV      R2,R9
        ADDS     R1,R5,#+36
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.W    ??f_read_5
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_read_1
// 2454 #endif
// 2455 	}
// 2456 
// 2457 	LEAVE_FF(fp->fs, FR_OK);
??f_read_9:
        MOVS     R0,#+0
??f_read_1:
        POP      {R4-R10,PC}      ;; return
          CFI EndBlock cfiBlock30
// 2458 }
// 2459 
// 2460 
// 2461 
// 2462 
// 2463 #if !_FS_READONLY
// 2464 /*-----------------------------------------------------------------------*/
// 2465 /* Write File                                                            */
// 2466 /*-----------------------------------------------------------------------*/
// 2467 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock31 Using cfiCommon0
          CFI Function f_write
        THUMB
// 2468 FRESULT f_write (
// 2469 	FIL *fp,			/* Pointer to the file object */
// 2470 	const void *buff,	/* Pointer to the data to be written */
// 2471 	UINT btw,			/* Number of bytes to write */
// 2472 	UINT *bw			/* Pointer to number of bytes written */
// 2473 )
// 2474 {
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
        MOVS     R5,R0
        MOVS     R6,R2
        MOVS     R7,R3
// 2475 	FRESULT res;
// 2476 	DWORD clst, sect;
// 2477 	UINT wcnt, cc;
// 2478 	const BYTE *wbuff = buff;
        MOVS     R4,R1
// 2479 	BYTE csect;
// 2480 
// 2481 
// 2482 	*bw = 0;	/* Initialize byte counter */
        MOVS     R0,#+0
        STR      R0,[R7, #+0]
// 2483 
// 2484 	res = validate(fp->fs, fp->id);			/* Check validity */
        LDRH     R1,[R5, #+4]
        LDR      R0,[R5, #+0]
          CFI FunCall validate
        BL       validate
// 2485 	if (res != FR_OK) LEAVE_FF(fp->fs, res);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??f_write_0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??f_write_1
// 2486 	if (fp->flag & FA__ERROR)				/* Aborted file? */
??f_write_0:
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+24
        BPL.N    ??f_write_2
// 2487 		LEAVE_FF(fp->fs, FR_INT_ERR);
        MOVS     R0,#+2
        B.N      ??f_write_1
// 2488 	if (!(fp->flag & FA_WRITE))				/* Check access mode */
??f_write_2:
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+30
        BMI.N    ??f_write_3
// 2489 		LEAVE_FF(fp->fs, FR_DENIED);
        MOVS     R0,#+7
        B.N      ??f_write_1
// 2490 	if ((DWORD)(fp->fsize + btw) < fp->fsize) btw = 0;	/* File size cannot reach 4GB */
??f_write_3:
        LDR      R0,[R5, #+12]
        ADDS     R0,R6,R0
        LDR      R1,[R5, #+12]
        CMP      R0,R1
        BCS.N    ??f_write_4
        MOVS     R6,#+0
        B.N      ??f_write_4
// 2491 
// 2492 	for ( ;  btw;							/* Repeat until all data written */
// 2493 		wbuff += wcnt, fp->fptr += wcnt, *bw += wcnt, btw -= wcnt) {
// 2494 		if ((fp->fptr % SS(fp->fs)) == 0) {	/* On the sector boundary? */
// 2495 			csect = (BYTE)(fp->fptr / SS(fp->fs) & (fp->fs->csize - 1));	/* Sector offset in the cluster */
// 2496 			if (!csect) {					/* On the cluster boundary? */
// 2497 				if (fp->fptr == 0) {		/* On the top of the file? */
// 2498 					clst = fp->sclust;		/* Follow from the origin */
// 2499 					if (clst == 0)			/* When no cluster is allocated, */
// 2500 						fp->sclust = clst = create_chain(fp->fs, 0);	/* Create a new cluster chain */
// 2501 				} else {					/* Middle or end of the file */
// 2502 #if _USE_FASTSEEK
// 2503 					if (fp->cltbl)
// 2504 						clst = clmt_clust(fp, fp->fptr);	/* Get cluster# from the CLMT */
// 2505 					else
// 2506 #endif
// 2507 						clst = create_chain(fp->fs, fp->clust);	/* Follow or stretch cluster chain on the FAT */
// 2508 				}
// 2509 				if (clst == 0) break;		/* Could not allocate a new cluster (disk full) */
// 2510 				if (clst == 1) ABORT(fp->fs, FR_INT_ERR);
// 2511 				if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
// 2512 				fp->clust = clst;			/* Update current cluster */
// 2513 			}
// 2514 #if _FS_TINY
// 2515 			if (fp->fs->winsect == fp->dsect && move_window(fp->fs, 0))	/* Write-back sector cache */
// 2516 				ABORT(fp->fs, FR_DISK_ERR);
// 2517 #else
// 2518 			if (fp->flag & FA__DIRTY) {		/* Write-back sector cache */
// 2519 				if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
// 2520 					ABORT(fp->fs, FR_DISK_ERR);
// 2521 				fp->flag &= ~FA__DIRTY;
// 2522 			}
// 2523 #endif
// 2524 			sect = clust2sect(fp->fs, fp->clust);	/* Get current sector */
// 2525 			if (!sect) ABORT(fp->fs, FR_INT_ERR);
// 2526 			sect += csect;
// 2527 			cc = btw / SS(fp->fs);			/* When remaining bytes >= sector size, */
// 2528 			if (cc) {						/* Write maximum contiguous sectors directly */
// 2529 				if (csect + cc > fp->fs->csize)	/* Clip at cluster boundary */
// 2530 					cc = fp->fs->csize - csect;
// 2531 				if (disk_write(fp->fs->drv, wbuff, sect, (BYTE)cc) != RES_OK)
// 2532 					ABORT(fp->fs, FR_DISK_ERR);
// 2533 #if _FS_TINY
// 2534 				if (fp->fs->winsect - sect < cc) {	/* Refill sector cache if it gets invalidated by the direct write */
// 2535 					mem_cpy(fp->fs->win, wbuff + ((fp->fs->winsect - sect) * SS(fp->fs)), SS(fp->fs));
// 2536 					fp->fs->wflag = 0;
// 2537 				}
// 2538 #else
// 2539 				if (fp->dsect - sect < cc) { /* Refill sector cache if it gets invalidated by the direct write */
// 2540 					mem_cpy(fp->buf, wbuff + ((fp->dsect - sect) * SS(fp->fs)), SS(fp->fs));
// 2541 					fp->flag &= ~FA__DIRTY;
// 2542 				}
// 2543 #endif
// 2544 				wcnt = SS(fp->fs) * cc;		/* Number of bytes transferred */
// 2545 				continue;
// 2546 			}
// 2547 #if _FS_TINY
// 2548 			if (fp->fptr >= fp->fsize) {	/* Avoid silly cache filling at growing edge */
// 2549 				if (move_window(fp->fs, 0)) ABORT(fp->fs, FR_DISK_ERR);
// 2550 				fp->fs->winsect = sect;
// 2551 			}
// 2552 #else
// 2553 			if (fp->dsect != sect) {		/* Fill sector cache with file data */
// 2554 				if (fp->fptr < fp->fsize &&
// 2555 					disk_read(fp->fs->drv, fp->buf, sect, 1) != RES_OK)
// 2556 						ABORT(fp->fs, FR_DISK_ERR);
// 2557 			}
// 2558 #endif
// 2559 			fp->dsect = sect;
??f_write_5:
        STR      R9,[R5, #+24]
// 2560 		}
// 2561 		wcnt = SS(fp->fs) - (fp->fptr % SS(fp->fs));/* Put partial sector into file I/O buffer */
??f_write_6:
        LDR      R0,[R5, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        RSBS     R8,R2,#+512
// 2562 		if (wcnt > btw) wcnt = btw;
        CMP      R6,R8
        BCS.N    ??f_write_7
        MOV      R8,R6
// 2563 #if _FS_TINY
// 2564 		if (move_window(fp->fs, fp->dsect))	/* Move sector window */
// 2565 			ABORT(fp->fs, FR_DISK_ERR);
// 2566 		mem_cpy(&fp->fs->win[fp->fptr % SS(fp->fs)], wbuff, wcnt);	/* Fit partial sector */
// 2567 		fp->fs->wflag = 1;
// 2568 #else
// 2569 		mem_cpy(&fp->buf[fp->fptr % SS(fp->fs)], wbuff, wcnt);	/* Fit partial sector */
??f_write_7:
        MOV      R2,R8
        MOVS     R1,R4
        LDR      R0,[R5, #+8]
        MOV      R3,#+512
        UDIV     R12,R0,R3
        MLS      R12,R12,R3,R0
        ADDS     R0,R12,R5
        ADDS     R0,R0,#+36
          CFI FunCall mem_cpy
        BL       mem_cpy
// 2570 		fp->flag |= FA__DIRTY;
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x40
        STRB     R0,[R5, #+6]
??f_write_8:
        ADDS     R4,R8,R4
        LDR      R0,[R5, #+8]
        ADDS     R0,R8,R0
        STR      R0,[R5, #+8]
        LDR      R0,[R7, #+0]
        ADDS     R0,R8,R0
        STR      R0,[R7, #+0]
        SUBS     R6,R6,R8
??f_write_4:
        CMP      R6,#+0
        BEQ.N    ??f_write_9
        LDR      R0,[R5, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BNE.N    ??f_write_6
        LDR      R0,[R5, #+8]
        LSRS     R0,R0,#+9
        LDR      R1,[R5, #+0]
        LDRB     R1,[R1, #+2]
        SUBS     R1,R1,#+1
        ANDS     R8,R1,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??f_write_10
        LDR      R0,[R5, #+8]
        CMP      R0,#+0
        BNE.N    ??f_write_11
        LDR      R0,[R5, #+16]
        CMP      R0,#+0
        BNE.N    ??f_write_12
        MOVS     R1,#+0
        LDR      R0,[R5, #+0]
          CFI FunCall create_chain
        BL       create_chain
        STR      R0,[R5, #+16]
        B.N      ??f_write_12
??f_write_11:
        LDR      R1,[R5, #+20]
        LDR      R0,[R5, #+0]
          CFI FunCall create_chain
        BL       create_chain
??f_write_12:
        CMP      R0,#+0
        BNE.N    ??f_write_13
// 2571 #endif
// 2572 	}
// 2573 
// 2574 	if (fp->fptr > fp->fsize) fp->fsize = fp->fptr;	/* Update file size if needed */
??f_write_9:
        LDR      R0,[R5, #+12]
        LDR      R1,[R5, #+8]
        CMP      R0,R1
        BCS.N    ??f_write_14
        LDR      R0,[R5, #+8]
        STR      R0,[R5, #+12]
// 2575 	fp->flag |= FA__WRITTEN;						/* Set file change flag */
??f_write_14:
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x20
        STRB     R0,[R5, #+6]
// 2576 
// 2577 	LEAVE_FF(fp->fs, FR_OK);
        MOVS     R0,#+0
??f_write_1:
        POP      {R4-R10,PC}      ;; return
??f_write_13:
        CMP      R0,#+1
        BNE.N    ??f_write_15
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+2
        B.N      ??f_write_1
??f_write_15:
        CMN      R0,#+1
        BNE.N    ??f_write_16
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_write_1
??f_write_16:
        STR      R0,[R5, #+20]
??f_write_10:
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_write_17
        MOVS     R3,#+1
        LDR      R2,[R5, #+24]
        ADDS     R1,R5,#+36
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_write_18
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_write_1
??f_write_18:
        LDRB     R0,[R5, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R5, #+6]
??f_write_17:
        LDR      R1,[R5, #+20]
        LDR      R0,[R5, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        MOV      R9,R0
        CMP      R9,#+0
        BNE.N    ??f_write_19
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+2
        B.N      ??f_write_1
??f_write_19:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ADDS     R9,R8,R9
        LSRS     R10,R6,#+9
        CMP      R10,#+0
        BEQ.N    ??f_write_20
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+2]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ADDS     R1,R10,R8
        CMP      R0,R1
        BCS.N    ??f_write_21
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+2]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        SUBS     R10,R0,R8
??f_write_21:
        MOV      R3,R10
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOV      R2,R9
        MOVS     R1,R4
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_write_22
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_write_1
??f_write_22:
        LDR      R0,[R5, #+24]
        SUBS     R0,R0,R9
        CMP      R0,R10
        BCS.N    ??f_write_23
        MOV      R2,#+512
        LDR      R0,[R5, #+24]
        SUBS     R0,R0,R9
        MOV      R1,#+512
        MLA      R1,R1,R0,R4
        ADDS     R0,R5,#+36
          CFI FunCall mem_cpy
        BL       mem_cpy
        LDRB     R0,[R5, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R5, #+6]
??f_write_23:
        MOV      R0,#+512
        MUL      R8,R0,R10
        B.N      ??f_write_8
??f_write_20:
        LDR      R0,[R5, #+24]
        CMP      R0,R9
        BEQ.W    ??f_write_5
        LDR      R0,[R5, #+8]
        LDR      R1,[R5, #+12]
        CMP      R0,R1
        BCS.W    ??f_write_5
        MOVS     R3,#+1
        MOV      R2,R9
        ADDS     R1,R5,#+36
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.W    ??f_write_5
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_write_1
          CFI EndBlock cfiBlock31
// 2578 }
// 2579 
// 2580 
// 2581 
// 2582 
// 2583 /*-----------------------------------------------------------------------*/
// 2584 /* Synchronize the File Object                                           */
// 2585 /*-----------------------------------------------------------------------*/
// 2586 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock32 Using cfiCommon0
          CFI Function f_sync
        THUMB
// 2587 FRESULT f_sync (
// 2588 	FIL *fp		/* Pointer to the file object */
// 2589 )
// 2590 {
f_sync:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
// 2591 	FRESULT res;
// 2592 	DWORD tim;
// 2593 	BYTE *dir;
// 2594 
// 2595 
// 2596 	res = validate(fp->fs, fp->id);		/* Check validity of the object */
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
          CFI FunCall validate
        BL       validate
// 2597 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_sync_0
// 2598 		if (fp->flag & FA__WRITTEN) {	/* Has the file been written? */
        LDRB     R1,[R4, #+6]
        LSLS     R1,R1,#+26
        BPL.N    ??f_sync_0
// 2599 #if !_FS_TINY	/* Write-back dirty buffer */
// 2600 			if (fp->flag & FA__DIRTY) {
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_sync_1
// 2601 				if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
        MOVS     R3,#+1
        LDR      R2,[R4, #+24]
        ADDS     R1,R4,#+36
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_sync_2
// 2602 					LEAVE_FF(fp->fs, FR_DISK_ERR);
        MOVS     R0,#+1
        B.N      ??f_sync_3
// 2603 				fp->flag &= ~FA__DIRTY;
??f_sync_2:
        LDRB     R0,[R4, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R4, #+6]
// 2604 			}
// 2605 #endif
// 2606 			/* Update the directory entry */
// 2607 			res = move_window(fp->fs, fp->dir_sect);
??f_sync_1:
        LDR      R1,[R4, #+28]
        LDR      R0,[R4, #+0]
          CFI FunCall move_window
        BL       move_window
// 2608 			if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_sync_0
// 2609 				dir = fp->dir_ptr;
        LDR      R5,[R4, #+32]
// 2610 				dir[DIR_Attr] |= AM_ARC;					/* Set archive bit */
        LDRB     R0,[R5, #+11]
        ORRS     R0,R0,#0x20
        STRB     R0,[R5, #+11]
// 2611 				ST_DWORD(dir+DIR_FileSize, fp->fsize);		/* Update file size */
        LDR      R0,[R4, #+12]
        STRB     R0,[R5, #+28]
        LDR      R0,[R4, #+12]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+29]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+16
        STRB     R0,[R5, #+30]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+24
        STRB     R0,[R5, #+31]
// 2612 				ST_CLUST(dir, fp->sclust);					/* Update start cluster */
        LDR      R0,[R4, #+16]
        STRB     R0,[R5, #+26]
        LDR      R0,[R4, #+16]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+27]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+16
        STRB     R0,[R5, #+20]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+21]
// 2613 				tim = get_fattime();						/* Update updated time */
          CFI FunCall get_fattime
        BL       get_fattime
// 2614 				ST_DWORD(dir+DIR_WrtTime, tim);
        STRB     R0,[R5, #+22]
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[R5, #+23]
        LSRS     R1,R0,#+16
        STRB     R1,[R5, #+24]
        LSRS     R0,R0,#+24
        STRB     R0,[R5, #+25]
// 2615 				fp->flag &= ~FA__WRITTEN;
        LDRB     R0,[R4, #+6]
        ANDS     R0,R0,#0xDF
        STRB     R0,[R4, #+6]
// 2616 				fp->fs->wflag = 1;
        LDR      R0,[R4, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 2617 				res = sync(fp->fs);
        LDR      R0,[R4, #+0]
          CFI FunCall sync
        BL       sync
// 2618 			}
// 2619 		}
// 2620 	}
// 2621 
// 2622 	LEAVE_FF(fp->fs, res);
??f_sync_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??f_sync_3:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock32
// 2623 }
// 2624 
// 2625 #endif /* !_FS_READONLY */
// 2626 
// 2627 
// 2628 
// 2629 
// 2630 /*-----------------------------------------------------------------------*/
// 2631 /* Close File                                                            */
// 2632 /*-----------------------------------------------------------------------*/
// 2633 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock33 Using cfiCommon0
          CFI Function f_close
        THUMB
// 2634 FRESULT f_close (
// 2635 	FIL *fp		/* Pointer to the file object to be closed */
// 2636 )
// 2637 {
f_close:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
// 2638 	FRESULT res;
// 2639 
// 2640 #if _FS_READONLY
// 2641 	FATFS *fs = fp->fs;
// 2642 	res = validate(fs, fp->id);
// 2643 	if (res == FR_OK) fp->fs = 0;	/* Discard file object */
// 2644 	LEAVE_FF(fs, res);
// 2645 
// 2646 #else
// 2647 	res = f_sync(fp);		/* Flush cached data */
        MOVS     R0,R4
          CFI FunCall f_sync
        BL       f_sync
// 2648 #if _FS_SHARE
// 2649 	if (res == FR_OK) {		/* Decrement open counter */
// 2650 #if _FS_REENTRANT
// 2651 		res = validate(fp->fs, fp->id);
// 2652 		if (res == FR_OK) {
// 2653 			res = dec_lock(fp->lockid);	
// 2654 			unlock_fs(fp->fs, FR_OK);
// 2655 		}
// 2656 #else
// 2657 		res = dec_lock(fp->lockid);
// 2658 #endif
// 2659 	}
// 2660 #endif
// 2661 	if (res == FR_OK) fp->fs = 0;	/* Discard file object */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_close_0
        MOVS     R1,#+0
        STR      R1,[R4, #+0]
// 2662 	return res;
??f_close_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock33
// 2663 #endif
// 2664 }
// 2665 
// 2666 
// 2667 
// 2668 
// 2669 /*-----------------------------------------------------------------------*/
// 2670 /* Current Drive/Directory Handlings                                     */
// 2671 /*-----------------------------------------------------------------------*/
// 2672 
// 2673 #if _FS_RPATH >= 1
// 2674 
// 2675 FRESULT f_chdrive (
// 2676 	BYTE drv		/* Drive number */
// 2677 )
// 2678 {
// 2679 	if (drv >= _VOLUMES) return FR_INVALID_DRIVE;
// 2680 
// 2681 	CurrVol = drv;
// 2682 
// 2683 	return FR_OK;
// 2684 }
// 2685 
// 2686 
// 2687 
// 2688 FRESULT f_chdir (
// 2689 	const TCHAR *path	/* Pointer to the directory path */
// 2690 )
// 2691 {
// 2692 	FRESULT res;
// 2693 	DIR dj;
// 2694 	DEF_NAMEBUF;
// 2695 
// 2696 
// 2697 	res = chk_mounted(&path, &dj.fs, 0);
// 2698 	if (res == FR_OK) {
// 2699 		INIT_BUF(dj);
// 2700 		res = follow_path(&dj, path);		/* Follow the path */
// 2701 		FREE_BUF();
// 2702 		if (res == FR_OK) {					/* Follow completed */
// 2703 			if (!dj.dir) {
// 2704 				dj.fs->cdir = dj.sclust;	/* Start directory itself */
// 2705 			} else {
// 2706 				if (dj.dir[DIR_Attr] & AM_DIR)	/* Reached to the directory */
// 2707 					dj.fs->cdir = LD_CLUST(dj.dir);
// 2708 				else
// 2709 					res = FR_NO_PATH;		/* Reached but a file */
// 2710 			}
// 2711 		}
// 2712 		if (res == FR_NO_FILE) res = FR_NO_PATH;
// 2713 	}
// 2714 
// 2715 	LEAVE_FF(dj.fs, res);
// 2716 }
// 2717 
// 2718 
// 2719 #if _FS_RPATH >= 2
// 2720 FRESULT f_getcwd (
// 2721 	TCHAR *path,	/* Pointer to the directory path */
// 2722 	UINT sz_path	/* Size of path */
// 2723 )
// 2724 {
// 2725 	FRESULT res;
// 2726 	DIR dj;
// 2727 	UINT i, n;
// 2728 	DWORD ccl;
// 2729 	TCHAR *tp;
// 2730 	FILINFO fno;
// 2731 	DEF_NAMEBUF;
// 2732 
// 2733 
// 2734 	*path = 0;
// 2735 	res = chk_mounted((const TCHAR**)&path, &dj.fs, 0);	/* Get current volume */
// 2736 	if (res == FR_OK) {
// 2737 		INIT_BUF(dj);
// 2738 		i = sz_path;		/* Bottom of buffer (dir stack base) */
// 2739 		dj.sclust = dj.fs->cdir;			/* Start to follow upper dir from current dir */
// 2740 		while ((ccl = dj.sclust) != 0) {	/* Repeat while current dir is a sub-dir */
// 2741 			res = dir_sdi(&dj, 1);			/* Get parent dir */
// 2742 			if (res != FR_OK) break;
// 2743 			res = dir_read(&dj);
// 2744 			if (res != FR_OK) break;
// 2745 			dj.sclust = LD_CLUST(dj.dir);	/* Goto parent dir */
// 2746 			res = dir_sdi(&dj, 0);
// 2747 			if (res != FR_OK) break;
// 2748 			do {							/* Find the entry links to the child dir */
// 2749 				res = dir_read(&dj);
// 2750 				if (res != FR_OK) break;
// 2751 				if (ccl == LD_CLUST(dj.dir)) break;	/* Found the entry */
// 2752 				res = dir_next(&dj, 0);	
// 2753 			} while (res == FR_OK);
// 2754 			if (res == FR_NO_FILE) res = FR_INT_ERR;/* It cannot be 'not found'. */
// 2755 			if (res != FR_OK) break;
// 2756 #if _USE_LFN
// 2757 			fno.lfname = path;
// 2758 			fno.lfsize = i;
// 2759 #endif
// 2760 			get_fileinfo(&dj, &fno);		/* Get the dir name and push it to the buffer */
// 2761 			tp = fno.fname;
// 2762 			if (_USE_LFN && *path) tp = path;
// 2763 			for (n = 0; tp[n]; n++) ;
// 2764 			if (i < n + 3) {
// 2765 				res = FR_NOT_ENOUGH_CORE; break;
// 2766 			}
// 2767 			while (n) path[--i] = tp[--n];
// 2768 			path[--i] = '/';
// 2769 		}
// 2770 		tp = path;
// 2771 		if (res == FR_OK) {
// 2772 			*tp++ = '0' + CurrVol;			/* Put drive number */
// 2773 			*tp++ = ':';
// 2774 			if (i == sz_path) {				/* Root-dir */
// 2775 				*tp++ = '/';
// 2776 			} else {						/* Sub-dir */
// 2777 				do		/* Add stacked path str */
// 2778 					*tp++ = path[i++];
// 2779 				while (i < sz_path);
// 2780 			}
// 2781 		}
// 2782 		*tp = 0;
// 2783 		FREE_BUF();
// 2784 	}
// 2785 
// 2786 	LEAVE_FF(dj.fs, res);
// 2787 }
// 2788 #endif /* _FS_RPATH >= 2 */
// 2789 #endif /* _FS_RPATH >= 1 */
// 2790 
// 2791 
// 2792 
// 2793 #if _FS_MINIMIZE <= 2
// 2794 /*-----------------------------------------------------------------------*/
// 2795 /* Seek File R/W Pointer                                                 */
// 2796 /*-----------------------------------------------------------------------*/
// 2797 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock34 Using cfiCommon0
          CFI Function f_lseek
        THUMB
// 2798 FRESULT f_lseek (
// 2799 	FIL *fp,		/* Pointer to the file object */
// 2800 	DWORD ofs		/* File pointer from top of file */
// 2801 )
// 2802 {
f_lseek:
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
// 2803 	FRESULT res;
// 2804 
// 2805 
// 2806 	res = validate(fp->fs, fp->id);		/* Check validity of the object */
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
          CFI FunCall validate
        BL       validate
        MOVS     R6,R0
// 2807 	if (res != FR_OK) LEAVE_FF(fp->fs, res);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??f_lseek_0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??f_lseek_1
// 2808 	if (fp->flag & FA__ERROR)			/* Check abort flag */
??f_lseek_0:
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+24
        BPL.N    ??f_lseek_2
// 2809 		LEAVE_FF(fp->fs, FR_INT_ERR);
        MOVS     R0,#+2
        B.N      ??f_lseek_1
// 2810 
// 2811 #if _USE_FASTSEEK
// 2812 	if (fp->cltbl) {	/* Fast seek */
// 2813 		DWORD cl, pcl, ncl, tcl, dsc, tlen, ulen, *tbl;
// 2814 
// 2815 		if (ofs == CREATE_LINKMAP) {	/* Create CLMT */
// 2816 			tbl = fp->cltbl;
// 2817 			tlen = *tbl++; ulen = 2;	/* Given table size and required table size */
// 2818 			cl = fp->sclust;			/* Top of the chain */
// 2819 			if (cl) {
// 2820 				do {
// 2821 					/* Get a fragment */
// 2822 					tcl = cl; ncl = 0; ulen += 2;	/* Top, length and used items */
// 2823 					do {
// 2824 						pcl = cl; ncl++;
// 2825 						cl = get_fat(fp->fs, cl);
// 2826 						if (cl <= 1) ABORT(fp->fs, FR_INT_ERR);
// 2827 						if (cl == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
// 2828 					} while (cl == pcl + 1);
// 2829 					if (ulen <= tlen) {		/* Store the length and top of the fragment */
// 2830 						*tbl++ = ncl; *tbl++ = tcl;
// 2831 					}
// 2832 				} while (cl < fp->fs->n_fatent);	/* Repeat until end of chain */
// 2833 			}
// 2834 			*fp->cltbl = ulen;	/* Number of items used */
// 2835 			if (ulen <= tlen)
// 2836 				*tbl = 0;		/* Terminate table */
// 2837 			else
// 2838 				res = FR_NOT_ENOUGH_CORE;	/* Given table size is smaller than required */
// 2839 
// 2840 		} else {						/* Fast seek */
// 2841 			if (ofs > fp->fsize)		/* Clip offset at the file size */
// 2842 				ofs = fp->fsize;
// 2843 			fp->fptr = ofs;				/* Set file pointer */
// 2844 			if (ofs) {
// 2845 				fp->clust = clmt_clust(fp, ofs - 1);
// 2846 				dsc = clust2sect(fp->fs, fp->clust);
// 2847 				if (!dsc) ABORT(fp->fs, FR_INT_ERR);
// 2848 				dsc += (ofs - 1) / SS(fp->fs) & (fp->fs->csize - 1);
// 2849 				if (fp->fptr % SS(fp->fs) && dsc != fp->dsect) {	/* Refill sector cache if needed */
// 2850 #if !_FS_TINY
// 2851 #if !_FS_READONLY
// 2852 					if (fp->flag & FA__DIRTY) {		/* Write-back dirty sector cache */
// 2853 						if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
// 2854 							ABORT(fp->fs, FR_DISK_ERR);
// 2855 						fp->flag &= ~FA__DIRTY;
// 2856 					}
// 2857 #endif
// 2858 					if (disk_read(fp->fs->drv, fp->buf, dsc, 1) != RES_OK)	/* Load current sector */
// 2859 						ABORT(fp->fs, FR_DISK_ERR);
// 2860 #endif
// 2861 					fp->dsect = dsc;
// 2862 				}
// 2863 			}
// 2864 		}
// 2865 	} else
// 2866 #endif
// 2867 
// 2868 	/* Normal Seek */
// 2869 	{
// 2870 		DWORD clst, bcs, nsect, ifptr;
// 2871 
// 2872 		if (ofs > fp->fsize					/* In read-only mode, clip offset with the file size */
// 2873 #if !_FS_READONLY
// 2874 			 && !(fp->flag & FA_WRITE)
// 2875 #endif
// 2876 			) ofs = fp->fsize;
??f_lseek_2:
        LDR      R0,[R4, #+12]
        CMP      R0,R5
        BCS.N    ??f_lseek_3
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+30
        BMI.N    ??f_lseek_3
        LDR      R5,[R4, #+12]
// 2877 
// 2878 		ifptr = fp->fptr;
??f_lseek_3:
        LDR      R0,[R4, #+8]
// 2879 		fp->fptr = nsect = 0;
        MOVS     R7,#+0
        STR      R7,[R4, #+8]
// 2880 		if (ofs) {
        CMP      R5,#+0
        BEQ.N    ??f_lseek_4
// 2881 			bcs = (DWORD)fp->fs->csize * SS(fp->fs);	/* Cluster size (byte) */
        LDR      R1,[R4, #+0]
        LDRB     R1,[R1, #+2]
        MOV      R2,#+512
        MUL      R8,R2,R1
// 2882 			if (ifptr > 0 &&
// 2883 				(ofs - 1) / bcs >= (ifptr - 1) / bcs) {	/* When seek to same or following cluster, */
        CMP      R0,#+0
        BEQ.N    ??f_lseek_5
        SUBS     R1,R0,#+1
        UDIV     R1,R1,R8
        SUBS     R2,R5,#+1
        UDIV     R2,R2,R8
        CMP      R2,R1
        BCC.N    ??f_lseek_5
// 2884 				fp->fptr = (ifptr - 1) & ~(bcs - 1);	/* start from the current cluster */
        SUBS     R0,R0,#+1
        SUBS     R1,R8,#+1
        BICS     R0,R0,R1
        STR      R0,[R4, #+8]
// 2885 				ofs -= fp->fptr;
        LDR      R0,[R4, #+8]
        SUBS     R5,R5,R0
// 2886 				clst = fp->clust;
        LDR      R0,[R4, #+20]
        B.N      ??f_lseek_6
// 2887 			} else {									/* When seek to back cluster, */
// 2888 				clst = fp->sclust;						/* start from the first cluster */
??f_lseek_5:
        LDR      R0,[R4, #+16]
// 2889 #if !_FS_READONLY
// 2890 				if (clst == 0) {						/* If no cluster chain, create a new chain */
        CMP      R0,#+0
        BNE.N    ??f_lseek_7
// 2891 					clst = create_chain(fp->fs, 0);
        MOVS     R1,#+0
        LDR      R0,[R4, #+0]
          CFI FunCall create_chain
        BL       create_chain
// 2892 					if (clst == 1) ABORT(fp->fs, FR_INT_ERR);
        CMP      R0,#+1
        BNE.N    ??f_lseek_8
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+2
        B.N      ??f_lseek_1
// 2893 					if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
??f_lseek_8:
        CMN      R0,#+1
        BNE.N    ??f_lseek_9
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
// 2894 					fp->sclust = clst;
??f_lseek_9:
        STR      R0,[R4, #+16]
// 2895 				}
// 2896 #endif
// 2897 				fp->clust = clst;
??f_lseek_7:
        STR      R0,[R4, #+20]
// 2898 			}
// 2899 			if (clst != 0) {
??f_lseek_6:
        CMP      R0,#+0
        BNE.N    ??f_lseek_10
        B.N      ??f_lseek_4
// 2900 				while (ofs > bcs) {						/* Cluster following loop */
// 2901 #if !_FS_READONLY
// 2902 					if (fp->flag & FA_WRITE) {			/* Check if in write mode or not */
// 2903 						clst = create_chain(fp->fs, clst);	/* Force stretch if in write mode */
// 2904 						if (clst == 0) {				/* When disk gets full, clip file size */
// 2905 							ofs = bcs; break;
// 2906 						}
// 2907 					} else
// 2908 #endif
// 2909 						clst = get_fat(fp->fs, clst);	/* Follow cluster chain if not in write mode */
// 2910 					if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
// 2911 					if (clst <= 1 || clst >= fp->fs->n_fatent) ABORT(fp->fs, FR_INT_ERR);
// 2912 					fp->clust = clst;
??f_lseek_11:
        STR      R0,[R4, #+20]
// 2913 					fp->fptr += bcs;
        LDR      R1,[R4, #+8]
        ADDS     R1,R8,R1
        STR      R1,[R4, #+8]
// 2914 					ofs -= bcs;
        SUBS     R5,R5,R8
??f_lseek_10:
        CMP      R8,R5
        BCS.N    ??f_lseek_12
        LDRB     R1,[R4, #+6]
        LSLS     R1,R1,#+30
        BPL.N    ??f_lseek_13
        MOVS     R1,R0
        LDR      R0,[R4, #+0]
          CFI FunCall create_chain
        BL       create_chain
        CMP      R0,#+0
        BNE.N    ??f_lseek_14
        MOV      R5,R8
// 2915 				}
// 2916 				fp->fptr += ofs;
??f_lseek_12:
        LDR      R1,[R4, #+8]
        ADDS     R1,R5,R1
        STR      R1,[R4, #+8]
// 2917 				if (ofs % SS(fp->fs)) {
        MOV      R1,#+512
        UDIV     R2,R5,R1
        MLS      R2,R2,R1,R5
        CMP      R2,#+0
        BEQ.N    ??f_lseek_4
// 2918 					nsect = clust2sect(fp->fs, clst);	/* Current sector */
        MOVS     R1,R0
        LDR      R0,[R4, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        MOVS     R7,R0
// 2919 					if (!nsect) ABORT(fp->fs, FR_INT_ERR);
        CMP      R7,#+0
        BNE.N    ??f_lseek_15
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+2
        B.N      ??f_lseek_1
??f_lseek_13:
        MOVS     R1,R0
        LDR      R0,[R4, #+0]
          CFI FunCall get_fat
        BL       get_fat
??f_lseek_14:
        CMN      R0,#+1
        BNE.N    ??f_lseek_16
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
??f_lseek_16:
        CMP      R0,#+2
        BCC.N    ??f_lseek_17
        LDR      R1,[R4, #+0]
        LDR      R1,[R1, #+24]
        CMP      R0,R1
        BCC.N    ??f_lseek_11
??f_lseek_17:
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+2
        B.N      ??f_lseek_1
// 2920 					nsect += ofs / SS(fp->fs);
??f_lseek_15:
        ADDS     R7,R7,R5, LSR #+9
// 2921 				}
// 2922 			}
// 2923 		}
// 2924 		if (fp->fptr % SS(fp->fs) && nsect != fp->dsect) {	/* Fill sector cache if needed */
??f_lseek_4:
        LDR      R0,[R4, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BEQ.N    ??f_lseek_18
        LDR      R0,[R4, #+24]
        CMP      R7,R0
        BEQ.N    ??f_lseek_18
// 2925 #if !_FS_TINY
// 2926 #if !_FS_READONLY
// 2927 			if (fp->flag & FA__DIRTY) {			/* Write-back dirty sector cache */
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_lseek_19
// 2928 				if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
        MOVS     R3,#+1
        LDR      R2,[R4, #+24]
        ADDS     R1,R4,#+36
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_write
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_lseek_20
// 2929 					ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
// 2930 				fp->flag &= ~FA__DIRTY;
??f_lseek_20:
        LDRB     R0,[R4, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R4, #+6]
// 2931 			}
// 2932 #endif
// 2933 			if (disk_read(fp->fs->drv, fp->buf, nsect, 1) != RES_OK)	/* Fill sector cache */
??f_lseek_19:
        MOVS     R3,#+1
        MOVS     R2,R7
        ADDS     R1,R4,#+36
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
          CFI FunCall disk_read
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??f_lseek_21
// 2934 				ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R4, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
// 2935 #endif
// 2936 			fp->dsect = nsect;
??f_lseek_21:
        STR      R7,[R4, #+24]
// 2937 		}
// 2938 #if !_FS_READONLY
// 2939 		if (fp->fptr > fp->fsize) {			/* Set file change flag if the file size is extended */
??f_lseek_18:
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+8]
        CMP      R0,R1
        BCS.N    ??f_lseek_22
// 2940 			fp->fsize = fp->fptr;
        LDR      R0,[R4, #+8]
        STR      R0,[R4, #+12]
// 2941 			fp->flag |= FA__WRITTEN;
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x20
        STRB     R0,[R4, #+6]
// 2942 		}
// 2943 #endif
// 2944 	}
// 2945 
// 2946 	LEAVE_FF(fp->fs, res);
??f_lseek_22:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??f_lseek_1:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock34
// 2947 }
// 2948 
// 2949 
// 2950 
// 2951 #if _FS_MINIMIZE <= 1
// 2952 /*-----------------------------------------------------------------------*/
// 2953 /* Create a Directroy Object                                             */
// 2954 /*-----------------------------------------------------------------------*/
// 2955 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock35 Using cfiCommon0
          CFI Function f_opendir
        THUMB
// 2956 FRESULT f_opendir (
// 2957 	DIR *dj,			/* Pointer to directory object to create */
// 2958 	const TCHAR *path	/* Pointer to the directory path */
// 2959 )
// 2960 {
f_opendir:
        PUSH     {R1,R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+12
        SUB      SP,SP,#+12
          CFI CFA R13+24
        MOVS     R4,R0
// 2961 	FRESULT res;
// 2962 	DEF_NAMEBUF;
// 2963 
// 2964 
// 2965 	res = chk_mounted(&path, &dj->fs, 0);
        MOVS     R2,#+0
        MOVS     R1,R4
        ADD      R0,SP,#+12
          CFI FunCall chk_mounted
        BL       chk_mounted
// 2966 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_opendir_0
// 2967 		INIT_BUF(*dj);
        ADD      R0,SP,#+0
        STR      R0,[R4, #+24]
        LDR.W    R0,??DataTable11_3
        STR      R0,[R4, #+28]
// 2968 		res = follow_path(dj, path);			/* Follow the path to the directory */
        LDR      R1,[SP, #+12]
        MOVS     R0,R4
          CFI FunCall follow_path
        BL       follow_path
// 2969 		FREE_BUF();
// 2970 		if (res == FR_OK) {						/* Follow completed */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_opendir_1
// 2971 			if (dj->dir) {						/* It is not the root dir */
        LDR      R1,[R4, #+20]
        CMP      R1,#+0
        BEQ.N    ??f_opendir_2
// 2972 				if (dj->dir[DIR_Attr] & AM_DIR) {	/* The object is a directory */
        LDR      R1,[R4, #+20]
        LDRB     R1,[R1, #+11]
        LSLS     R1,R1,#+27
        BPL.N    ??f_opendir_3
// 2973 					dj->sclust = LD_CLUST(dj->dir);
        LDR      R1,[R4, #+20]
        LDRB     R1,[R1, #+21]
        LDR      R2,[R4, #+20]
        LDRB     R2,[R2, #+20]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR      R2,[R4, #+20]
        LDRB     R2,[R2, #+27]
        LDR      R3,[R4, #+20]
        LDRB     R3,[R3, #+26]
        ORRS     R2,R3,R2, LSL #+8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ORRS     R1,R2,R1, LSL #+16
        STR      R1,[R4, #+8]
        B.N      ??f_opendir_2
// 2974 				} else {						/* The object is not a directory */
// 2975 					res = FR_NO_PATH;
??f_opendir_3:
        MOVS     R0,#+5
// 2976 				}
// 2977 			}
// 2978 			if (res == FR_OK) {
??f_opendir_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_opendir_1
// 2979 				dj->id = dj->fs->id;
        LDR      R0,[R4, #+0]
        LDRH     R0,[R0, #+6]
        STRH     R0,[R4, #+4]
// 2980 				res = dir_sdi(dj, 0);			/* Rewind dir */
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
// 2981 			}
// 2982 		}
// 2983 		if (res == FR_NO_FILE) res = FR_NO_PATH;
??f_opendir_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??f_opendir_0
        MOVS     R0,#+5
// 2984 	}
// 2985 
// 2986 	LEAVE_FF(dj->fs, res);
??f_opendir_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+16
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock35
// 2987 }
// 2988 
// 2989 
// 2990 
// 2991 
// 2992 /*-----------------------------------------------------------------------*/
// 2993 /* Read Directory Entry in Sequense                                      */
// 2994 /*-----------------------------------------------------------------------*/
// 2995 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock36 Using cfiCommon0
          CFI Function f_readdir
        THUMB
// 2996 FRESULT f_readdir (
// 2997 	DIR *dj,			/* Pointer to the open directory object */
// 2998 	FILINFO *fno		/* Pointer to file information to return */
// 2999 )
// 3000 {
f_readdir:
        PUSH     {R1-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
// 3001 	FRESULT res;
// 3002 	DEF_NAMEBUF;
// 3003 
// 3004 
// 3005 	res = validate(dj->fs, dj->id);			/* Check validity of the object */
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
          CFI FunCall validate
        BL       validate
// 3006 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_readdir_0
// 3007 		if (!fno) {
        CMP      R5,#+0
        BNE.N    ??f_readdir_1
// 3008 			res = dir_sdi(dj, 0);			/* Rewind the directory object */
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_sdi
        BL       dir_sdi
        B.N      ??f_readdir_0
// 3009 		} else {
// 3010 			INIT_BUF(*dj);
??f_readdir_1:
        ADD      R0,SP,#+0
        STR      R0,[R4, #+24]
        LDR.N    R0,??DataTable11_3
        STR      R0,[R4, #+28]
// 3011 			res = dir_read(dj);				/* Read an directory item */
        MOVS     R0,R4
          CFI FunCall dir_read
        BL       dir_read
// 3012 			if (res == FR_NO_FILE) {		/* Reached end of dir */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??f_readdir_2
// 3013 				dj->sect = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
// 3014 				res = FR_OK;
        MOVS     R0,#+0
// 3015 			}
// 3016 			if (res == FR_OK) {				/* A valid entry is found */
??f_readdir_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_readdir_0
// 3017 				get_fileinfo(dj, fno);		/* Get the object information */
        MOVS     R1,R5
        MOVS     R0,R4
          CFI FunCall get_fileinfo
        BL       get_fileinfo
// 3018 				res = dir_next(dj, 0);		/* Increment index for next */
        MOVS     R1,#+0
        MOVS     R0,R4
          CFI FunCall dir_next
        BL       dir_next
// 3019 				if (res == FR_NO_FILE) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??f_readdir_0
// 3020 					dj->sect = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
// 3021 					res = FR_OK;
        MOVS     R0,#+0
// 3022 				}
// 3023 			}
// 3024 			FREE_BUF();
// 3025 		}
// 3026 	}
// 3027 
// 3028 	LEAVE_FF(dj->fs, res);
??f_readdir_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1-R5,PC}       ;; return
          CFI EndBlock cfiBlock36
// 3029 }
// 3030 
// 3031 
// 3032 
// 3033 #if _FS_MINIMIZE == 0
// 3034 /*-----------------------------------------------------------------------*/
// 3035 /* Get File Status                                                       */
// 3036 /*-----------------------------------------------------------------------*/
// 3037 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock37 Using cfiCommon0
          CFI Function f_stat
        THUMB
// 3038 FRESULT f_stat (
// 3039 	const TCHAR *path,	/* Pointer to the file path */
// 3040 	FILINFO *fno		/* Pointer to file information to return */
// 3041 )
// 3042 {
f_stat:
        PUSH     {R0,R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        SUB      SP,SP,#+48
          CFI CFA R13+64
        MOVS     R4,R1
// 3043 	FRESULT res;
// 3044 	DIR dj;
// 3045 	DEF_NAMEBUF;
// 3046 
// 3047 
// 3048 	res = chk_mounted(&path, &dj.fs, 0);
        MOVS     R2,#+0
        ADD      R1,SP,#+12
        ADD      R0,SP,#+48
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOVS     R5,R0
// 3049 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_stat_0
// 3050 		INIT_BUF(dj);
        ADD      R0,SP,#+0
        STR      R0,[SP, #+36]
        LDR.N    R0,??DataTable11_3
        STR      R0,[SP, #+40]
// 3051 		res = follow_path(&dj, path);	/* Follow the file path */
        LDR      R1,[SP, #+48]
        ADD      R0,SP,#+12
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 3052 		if (res == FR_OK) {				/* Follow completed */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_stat_0
// 3053 			if (dj.dir)		/* Found an object */
        LDR      R0,[SP, #+32]
        CMP      R0,#+0
        BEQ.N    ??f_stat_1
// 3054 				get_fileinfo(&dj, fno);
        MOVS     R1,R4
        ADD      R0,SP,#+12
          CFI FunCall get_fileinfo
        BL       get_fileinfo
        B.N      ??f_stat_0
// 3055 			else			/* It is root dir */
// 3056 				res = FR_INVALID_NAME;
??f_stat_1:
        MOVS     R5,#+6
// 3057 		}
// 3058 		FREE_BUF();
// 3059 	}
// 3060 
// 3061 	LEAVE_FF(dj.fs, res);
??f_stat_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+52
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock37
// 3062 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x544146

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     FatFs
// 3063 
// 3064 
// 3065 
// 3066 #if !_FS_READONLY
// 3067 /*-----------------------------------------------------------------------*/
// 3068 /* Get Number of Free Clusters                                           */
// 3069 /*-----------------------------------------------------------------------*/
// 3070 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock38 Using cfiCommon0
          CFI Function f_getfree
        THUMB
// 3071 FRESULT f_getfree (
// 3072 	const TCHAR *path,	/* Pointer to the logical drive number (root dir) */
// 3073 	DWORD *nclst,		/* Pointer to the variable to return number of free clusters */
// 3074 	FATFS **fatfs		/* Pointer to pointer to corresponding file system object to return */
// 3075 )
// 3076 {
f_getfree:
        PUSH     {R0,R4-R10,LR}
          CFI R14 Frame(CFA, -4)
          CFI R10 Frame(CFA, -8)
          CFI R9 Frame(CFA, -12)
          CFI R8 Frame(CFA, -16)
          CFI R7 Frame(CFA, -20)
          CFI R6 Frame(CFA, -24)
          CFI R5 Frame(CFA, -28)
          CFI R4 Frame(CFA, -32)
          CFI CFA R13+36
        SUB      SP,SP,#+4
          CFI CFA R13+40
        MOVS     R5,R1
        MOVS     R6,R2
// 3077 	FRESULT res;
// 3078 	DWORD n, clst, sect, stat;
// 3079 	UINT i;
// 3080 	BYTE fat, *p;
// 3081 
// 3082 
// 3083 	/* Get drive number */
// 3084 	res = chk_mounted(&path, fatfs, 0);
        MOVS     R2,#+0
        MOVS     R1,R6
        ADD      R0,SP,#+4
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOV      R8,R0
// 3085 	if (res == FR_OK) {
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??f_getfree_0
// 3086 		/* If free_clust is valid, return it without full cluster scan */
// 3087 		if ((*fatfs)->free_clust <= (*fatfs)->n_fatent - 2) {
        LDR      R0,[R6, #+0]
        LDR      R0,[R0, #+24]
        SUBS     R0,R0,#+2
        LDR      R1,[R6, #+0]
        LDR      R1,[R1, #+16]
        CMP      R0,R1
        BCC.N    ??f_getfree_1
// 3088 			*nclst = (*fatfs)->free_clust;
        LDR      R0,[R6, #+0]
        LDR      R0,[R0, #+16]
        STR      R0,[R5, #+0]
        B.N      ??f_getfree_0
// 3089 		} else {
// 3090 			/* Get number of free clusters */
// 3091 			fat = (*fatfs)->fs_type;
??f_getfree_1:
        LDR      R0,[R6, #+0]
        LDRB     R7,[R0, #+0]
// 3092 			n = 0;
        MOVS     R9,#+0
// 3093 			if (fat == FS_FAT12) {
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??f_getfree_2
// 3094 				clst = 2;
        MOVS     R4,#+2
// 3095 				do {
// 3096 					stat = get_fat(*fatfs, clst);
??f_getfree_3:
        MOVS     R1,R4
        LDR      R0,[R6, #+0]
          CFI FunCall get_fat
        BL       get_fat
// 3097 					if (stat == 0xFFFFFFFF) { res = FR_DISK_ERR; break; }
        CMN      R0,#+1
        BNE.N    ??f_getfree_4
        MOVS     R8,#+1
        B.N      ??f_getfree_5
// 3098 					if (stat == 1) { res = FR_INT_ERR; break; }
??f_getfree_4:
        CMP      R0,#+1
        BNE.N    ??f_getfree_6
        MOVS     R8,#+2
        B.N      ??f_getfree_5
// 3099 					if (stat == 0) n++;
??f_getfree_6:
        CMP      R0,#+0
        BNE.N    ??f_getfree_7
        ADDS     R9,R9,#+1
// 3100 				} while (++clst < (*fatfs)->n_fatent);
??f_getfree_7:
        ADDS     R4,R4,#+1
        LDR      R0,[R6, #+0]
        LDR      R0,[R0, #+24]
        CMP      R4,R0
        BCC.N    ??f_getfree_3
        B.N      ??f_getfree_5
// 3101 			} else {
// 3102 				clst = (*fatfs)->n_fatent;
??f_getfree_2:
        LDR      R0,[R6, #+0]
        LDR      R4,[R0, #+24]
// 3103 				sect = (*fatfs)->fatbase;
        LDR      R0,[R6, #+0]
        LDR      R10,[R0, #+32]
// 3104 				i = 0; p = 0;
        MOVS     R1,#+0
        MOVS     R0,#+0
// 3105 				do {
// 3106 					if (!i) {
??f_getfree_8:
        CMP      R1,#+0
        BNE.N    ??f_getfree_9
// 3107 						res = move_window(*fatfs, sect++);
        MOV      R1,R10
        LDR      R0,[R6, #+0]
          CFI FunCall move_window
        BL       move_window
        MOV      R8,R0
        ADDS     R10,R10,#+1
// 3108 						if (res != FR_OK) break;
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??f_getfree_5
// 3109 						p = (*fatfs)->win;
??f_getfree_10:
        LDR      R0,[R6, #+0]
        ADDS     R0,R0,#+48
// 3110 						i = SS(*fatfs);
        MOV      R1,#+512
// 3111 					}
// 3112 					if (fat == FS_FAT16) {
??f_getfree_9:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+2
        BNE.N    ??f_getfree_11
// 3113 						if (LD_WORD(p) == 0) n++;
        LDRB     R2,[R0, #+1]
        LDRB     R3,[R0, #+0]
        ORRS     R2,R3,R2, LSL #+8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BNE.N    ??f_getfree_12
        ADDS     R9,R9,#+1
// 3114 						p += 2; i -= 2;
??f_getfree_12:
        ADDS     R0,R0,#+2
        SUBS     R1,R1,#+2
        B.N      ??f_getfree_13
// 3115 					} else {
// 3116 						if ((LD_DWORD(p) & 0x0FFFFFFF) == 0) n++;
??f_getfree_11:
        LDRB     R2,[R0, #+3]
        LDRB     R3,[R0, #+2]
        LSLS     R3,R3,#+16
        ORRS     R2,R3,R2, LSL #+24
        LDRB     R3,[R0, #+1]
        ORRS     R2,R2,R3, LSL #+8
        LDRB     R3,[R0, #+0]
        ORRS     R2,R3,R2
        LSLS     R2,R2,#+4
        BNE.N    ??f_getfree_14
        ADDS     R9,R9,#+1
// 3117 						p += 4; i -= 4;
??f_getfree_14:
        ADDS     R0,R0,#+4
        SUBS     R1,R1,#+4
// 3118 					}
// 3119 				} while (--clst);
??f_getfree_13:
        SUBS     R4,R4,#+1
        CMP      R4,#+0
        BNE.N    ??f_getfree_8
// 3120 			}
// 3121 			(*fatfs)->free_clust = n;
??f_getfree_5:
        LDR      R0,[R6, #+0]
        STR      R9,[R0, #+16]
// 3122 			if (fat == FS_FAT32) (*fatfs)->fsi_flag = 1;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+3
        BNE.N    ??f_getfree_15
        LDR      R0,[R6, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+5]
// 3123 			*nclst = n;
??f_getfree_15:
        STR      R9,[R5, #+0]
// 3124 		}
// 3125 	}
// 3126 	LEAVE_FF(*fatfs, res);
??f_getfree_0:
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4-R10,PC}  ;; return
          CFI EndBlock cfiBlock38
// 3127 }
// 3128 
// 3129 
// 3130 
// 3131 
// 3132 /*-----------------------------------------------------------------------*/
// 3133 /* Truncate File                                                         */
// 3134 /*-----------------------------------------------------------------------*/
// 3135 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock39 Using cfiCommon0
          CFI Function f_truncate
        THUMB
// 3136 FRESULT f_truncate (
// 3137 	FIL *fp		/* Pointer to the file object */
// 3138 )
// 3139 {
f_truncate:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
// 3140 	FRESULT res;
// 3141 	DWORD ncl;
// 3142 
// 3143 
// 3144 	res = validate(fp->fs, fp->id);		/* Check validity of the object */
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
          CFI FunCall validate
        BL       validate
// 3145 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_truncate_0
// 3146 		if (fp->flag & FA__ERROR) {			/* Check abort flag */
        LDRB     R1,[R4, #+6]
        LSLS     R1,R1,#+24
        BPL.N    ??f_truncate_1
// 3147 			res = FR_INT_ERR;
        MOVS     R0,#+2
        B.N      ??f_truncate_0
// 3148 		} else {
// 3149 			if (!(fp->flag & FA_WRITE))		/* Check access mode */
??f_truncate_1:
        LDRB     R1,[R4, #+6]
        LSLS     R1,R1,#+30
        BMI.N    ??f_truncate_0
// 3150 				res = FR_DENIED;
        MOVS     R0,#+7
// 3151 		}
// 3152 	}
// 3153 	if (res == FR_OK) {
??f_truncate_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_truncate_2
// 3154 		if (fp->fsize > fp->fptr) {
        LDR      R1,[R4, #+8]
        LDR      R2,[R4, #+12]
        CMP      R1,R2
        BCS.N    ??f_truncate_3
// 3155 			fp->fsize = fp->fptr;	/* Set file size to current R/W point */
        LDR      R0,[R4, #+8]
        STR      R0,[R4, #+12]
// 3156 			fp->flag |= FA__WRITTEN;
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x20
        STRB     R0,[R4, #+6]
// 3157 			if (fp->fptr == 0) {	/* When set file size to zero, remove entire cluster chain */
        LDR      R0,[R4, #+8]
        CMP      R0,#+0
        BNE.N    ??f_truncate_4
// 3158 				res = remove_chain(fp->fs, fp->sclust);
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
          CFI FunCall remove_chain
        BL       remove_chain
// 3159 				fp->sclust = 0;
        MOVS     R1,#+0
        STR      R1,[R4, #+16]
        B.N      ??f_truncate_3
// 3160 			} else {				/* When truncate a part of the file, remove remaining clusters */
// 3161 				ncl = get_fat(fp->fs, fp->clust);
??f_truncate_4:
        LDR      R1,[R4, #+20]
        LDR      R0,[R4, #+0]
          CFI FunCall get_fat
        BL       get_fat
        MOVS     R5,R0
// 3162 				res = FR_OK;
        MOVS     R0,#+0
// 3163 				if (ncl == 0xFFFFFFFF) res = FR_DISK_ERR;
        CMN      R5,#+1
        BNE.N    ??f_truncate_5
        MOVS     R0,#+1
// 3164 				if (ncl == 1) res = FR_INT_ERR;
??f_truncate_5:
        CMP      R5,#+1
        BNE.N    ??f_truncate_6
        MOVS     R0,#+2
// 3165 				if (res == FR_OK && ncl < fp->fs->n_fatent) {
??f_truncate_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_truncate_3
        LDR      R1,[R4, #+0]
        LDR      R1,[R1, #+24]
        CMP      R5,R1
        BCS.N    ??f_truncate_3
// 3166 					res = put_fat(fp->fs, fp->clust, 0x0FFFFFFF);
        MVNS     R2,#-268435456
        LDR      R1,[R4, #+20]
        LDR      R0,[R4, #+0]
          CFI FunCall put_fat
        BL       put_fat
// 3167 					if (res == FR_OK) res = remove_chain(fp->fs, ncl);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_truncate_3
        MOVS     R1,R5
        LDR      R0,[R4, #+0]
          CFI FunCall remove_chain
        BL       remove_chain
// 3168 				}
// 3169 			}
// 3170 		}
// 3171 		if (res != FR_OK) fp->flag |= FA__ERROR;
??f_truncate_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??f_truncate_2
        LDRB     R1,[R4, #+6]
        ORRS     R1,R1,#0x80
        STRB     R1,[R4, #+6]
// 3172 	}
// 3173 
// 3174 	LEAVE_FF(fp->fs, res);
??f_truncate_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock39
// 3175 }
// 3176 
// 3177 
// 3178 
// 3179 
// 3180 /*-----------------------------------------------------------------------*/
// 3181 /* Delete a File or Directory                                            */
// 3182 /*-----------------------------------------------------------------------*/
// 3183 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock40 Using cfiCommon0
          CFI Function f_unlink
        THUMB
// 3184 FRESULT f_unlink (
// 3185 	const TCHAR *path		/* Pointer to the file or directory path */
// 3186 )
// 3187 {
f_unlink:
        PUSH     {R0,R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+12
        SUB      SP,SP,#+84
          CFI CFA R13+96
// 3188 	FRESULT res;
// 3189 	DIR dj, sdj;
// 3190 	BYTE *dir;
// 3191 	DWORD dclst;
// 3192 	DEF_NAMEBUF;
// 3193 
// 3194 
// 3195 	res = chk_mounted(&path, &dj.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADD      R0,SP,#+84
          CFI FunCall chk_mounted
        BL       chk_mounted
// 3196 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_0
// 3197 		INIT_BUF(dj);
        ADD      R0,SP,#+36
        STR      R0,[SP, #+24]
        LDR.N    R0,??DataTable11_3
        STR      R0,[SP, #+28]
// 3198 		res = follow_path(&dj, path);		/* Follow the file path */
        LDR      R1,[SP, #+84]
        ADD      R0,SP,#+0
          CFI FunCall follow_path
        BL       follow_path
// 3199 		if (_FS_RPATH && res == FR_OK && (dj.fn[NS] & NS_DOT))
// 3200 			res = FR_INVALID_NAME;			/* Cannot remove dot entry */
// 3201 #if _FS_SHARE
// 3202 		if (res == FR_OK) res = chk_lock(&dj, 2);	/* Cannot remove open file */
// 3203 #endif
// 3204 		if (res == FR_OK) {					/* The object is accessible */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_0
// 3205 			dir = dj.dir;
        LDR      R1,[SP, #+20]
// 3206 			if (!dir) {
        CMP      R1,#+0
        BNE.N    ??f_unlink_1
// 3207 				res = FR_INVALID_NAME;		/* Cannot remove the start directory */
        MOVS     R0,#+6
        B.N      ??f_unlink_2
// 3208 			} else {
// 3209 				if (dir[DIR_Attr] & AM_RDO)
??f_unlink_1:
        LDRB     R2,[R1, #+11]
        LSLS     R2,R2,#+31
        BPL.N    ??f_unlink_2
// 3210 					res = FR_DENIED;		/* Cannot remove R/O object */
        MOVS     R0,#+7
// 3211 			}
// 3212 			dclst = LD_CLUST(dir);
??f_unlink_2:
        LDRB     R2,[R1, #+21]
        LDRB     R3,[R1, #+20]
        ORRS     R2,R3,R2, LSL #+8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDRB     R3,[R1, #+27]
        LDRB     R4,[R1, #+26]
        ORRS     R3,R4,R3, LSL #+8
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ORRS     R4,R3,R2, LSL #+16
// 3213 			if (res == FR_OK && (dir[DIR_Attr] & AM_DIR)) {	/* Is it a sub-dir? */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_3
        LDRB     R1,[R1, #+11]
        LSLS     R1,R1,#+27
        BPL.N    ??f_unlink_3
// 3214 				if (dclst < 2) {
        CMP      R4,#+2
        BCS.N    ??f_unlink_4
// 3215 					res = FR_INT_ERR;
        MOVS     R0,#+2
        B.N      ??f_unlink_3
// 3216 				} else {
// 3217 					mem_cpy(&sdj, &dj, sizeof(DIR));	/* Check if the sub-dir is empty or not */
??f_unlink_4:
        MOVS     R2,#+36
        ADD      R1,SP,#+0
        ADD      R0,SP,#+48
          CFI FunCall mem_cpy
        BL       mem_cpy
// 3218 					sdj.sclust = dclst;
        STR      R4,[SP, #+56]
// 3219 					res = dir_sdi(&sdj, 2);		/* Exclude dot entries */
        MOVS     R1,#+2
        ADD      R0,SP,#+48
          CFI FunCall dir_sdi
        BL       dir_sdi
// 3220 					if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_3
// 3221 						res = dir_read(&sdj);
        ADD      R0,SP,#+48
          CFI FunCall dir_read
        BL       dir_read
// 3222 						if (res == FR_OK			/* Not empty dir */
// 3223 #if _FS_RPATH
// 3224 						|| dclst == sdj.fs->cdir	/* Current dir */
// 3225 #endif
// 3226 						) res = FR_DENIED;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_5
        MOVS     R0,#+7
// 3227 						if (res == FR_NO_FILE) res = FR_OK;	/* Empty */
??f_unlink_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??f_unlink_3
        MOVS     R0,#+0
// 3228 					}
// 3229 				}
// 3230 			}
// 3231 			if (res == FR_OK) {
??f_unlink_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_0
// 3232 				res = dir_remove(&dj);		/* Remove the directory entry */
        ADD      R0,SP,#+0
          CFI FunCall dir_remove
        BL       dir_remove
// 3233 				if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_0
// 3234 					if (dclst)				/* Remove the cluster chain if exist */
        CMP      R4,#+0
        BEQ.N    ??f_unlink_6
// 3235 						res = remove_chain(dj.fs, dclst);
        MOVS     R1,R4
        LDR      R0,[SP, #+0]
          CFI FunCall remove_chain
        BL       remove_chain
// 3236 					if (res == FR_OK) res = sync(dj.fs);
??f_unlink_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_0
        LDR      R0,[SP, #+0]
          CFI FunCall sync
        BL       sync
// 3237 				}
// 3238 			}
// 3239 		}
// 3240 		FREE_BUF();
// 3241 	}
// 3242 	LEAVE_FF(dj.fs, res);
??f_unlink_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+88
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock40
// 3243 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x41615252

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x61417272

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     Fsid

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     LfnBuf
// 3244 
// 3245 
// 3246 
// 3247 
// 3248 /*-----------------------------------------------------------------------*/
// 3249 /* Create a Directory                                                    */
// 3250 /*-----------------------------------------------------------------------*/
// 3251 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock41 Using cfiCommon0
          CFI Function f_mkdir
        THUMB
// 3252 FRESULT f_mkdir (
// 3253 	const TCHAR *path		/* Pointer to the directory path */
// 3254 )
// 3255 {
f_mkdir:
        PUSH     {R0,R4-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        SUB      SP,SP,#+48
          CFI CFA R13+80
// 3256 	FRESULT res;
// 3257 	DIR dj;
// 3258 	BYTE *dir, n;
// 3259 	DWORD dsc, dcl, pcl, tim = get_fattime();
          CFI FunCall get_fattime
        BL       get_fattime
        MOVS     R4,R0
// 3260 	DEF_NAMEBUF;
// 3261 
// 3262 
// 3263 	res = chk_mounted(&path, &dj.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADD      R0,SP,#+48
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOVS     R6,R0
// 3264 	if (res == FR_OK) {
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.W    ??f_mkdir_0
// 3265 		INIT_BUF(dj);
        ADD      R0,SP,#+36
        STR      R0,[SP, #+24]
        LDR.W    R0,??DataTable15
        STR      R0,[SP, #+28]
// 3266 		res = follow_path(&dj, path);			/* Follow the file path */
        LDR      R1,[SP, #+48]
        ADD      R0,SP,#+0
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R6,R0
// 3267 		if (res == FR_OK) res = FR_EXIST;		/* Any object with same name is already existing */
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_mkdir_1
        MOVS     R6,#+8
// 3268 		if (_FS_RPATH && res == FR_NO_FILE && (dj.fn[NS] & NS_DOT))
// 3269 			res = FR_INVALID_NAME;
// 3270 		if (res == FR_NO_FILE) {				/* Can create a new directory */
??f_mkdir_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BNE.W    ??f_mkdir_0
// 3271 			dcl = create_chain(dj.fs, 0);		/* Allocate a cluster for the new directory table */
        MOVS     R1,#+0
        LDR      R0,[SP, #+0]
          CFI FunCall create_chain
        BL       create_chain
        MOVS     R5,R0
// 3272 			res = FR_OK;
        MOVS     R6,#+0
// 3273 			if (dcl == 0) res = FR_DENIED;		/* No space to allocate a new cluster */
        CMP      R5,#+0
        BNE.N    ??f_mkdir_2
        MOVS     R6,#+7
// 3274 			if (dcl == 1) res = FR_INT_ERR;
??f_mkdir_2:
        CMP      R5,#+1
        BNE.N    ??f_mkdir_3
        MOVS     R6,#+2
// 3275 			if (dcl == 0xFFFFFFFF) res = FR_DISK_ERR;
??f_mkdir_3:
        CMN      R5,#+1
        BNE.N    ??f_mkdir_4
        MOVS     R6,#+1
// 3276 			if (res == FR_OK)					/* Flush FAT */
??f_mkdir_4:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_mkdir_5
// 3277 				res = move_window(dj.fs, 0);
        MOVS     R1,#+0
        LDR      R0,[SP, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R6,R0
// 3278 			if (res == FR_OK) {					/* Initialize the new directory table */
??f_mkdir_5:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_mkdir_6
// 3279 				dsc = clust2sect(dj.fs, dcl);
        MOVS     R1,R5
        LDR      R0,[SP, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
        MOVS     R7,R0
// 3280 				dir = dj.fs->win;
        LDR      R0,[SP, #+0]
        ADDS     R8,R0,#+48
// 3281 				mem_set(dir, 0, SS(dj.fs));
        MOV      R2,#+512
        MOVS     R1,#+0
        MOV      R0,R8
          CFI FunCall mem_set
        BL       mem_set
// 3282 				mem_set(dir+DIR_Name, ' ', 8+3);	/* Create "." entry */
        MOVS     R2,#+11
        MOVS     R1,#+32
        MOV      R0,R8
          CFI FunCall mem_set
        BL       mem_set
// 3283 				dir[DIR_Name] = '.';
        MOVS     R0,#+46
        STRB     R0,[R8, #+0]
// 3284 				dir[DIR_Attr] = AM_DIR;
        MOVS     R0,#+16
        STRB     R0,[R8, #+11]
// 3285 				ST_DWORD(dir+DIR_WrtTime, tim);
        STRB     R4,[R8, #+22]
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+23]
        LSRS     R0,R4,#+16
        STRB     R0,[R8, #+24]
        LSRS     R0,R4,#+24
        STRB     R0,[R8, #+25]
// 3286 				ST_CLUST(dir, dcl);
        STRB     R5,[R8, #+26]
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+27]
        LSRS     R0,R5,#+16
        STRB     R0,[R8, #+20]
        LSRS     R0,R5,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+21]
// 3287 				mem_cpy(dir+SZ_DIR, dir, SZ_DIR); 	/* Create ".." entry */
        MOVS     R2,#+32
        MOV      R1,R8
        ADDS     R0,R8,#+32
          CFI FunCall mem_cpy
        BL       mem_cpy
// 3288 				dir[33] = '.'; pcl = dj.sclust;
        MOVS     R0,#+46
        STRB     R0,[R8, #+33]
        LDR      R0,[SP, #+8]
// 3289 				if (dj.fs->fs_type == FS_FAT32 && pcl == dj.fs->dirbase)
        LDR      R1,[SP, #+0]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+3
        BNE.N    ??f_mkdir_7
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+36]
        CMP      R0,R1
        BNE.N    ??f_mkdir_7
// 3290 					pcl = 0;
        MOVS     R0,#+0
// 3291 				ST_CLUST(dir+SZ_DIR, pcl);
??f_mkdir_7:
        STRB     R0,[R8, #+58]
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[R8, #+59]
        LSRS     R1,R0,#+16
        STRB     R1,[R8, #+52]
        LSRS     R0,R0,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+53]
// 3292 				for (n = dj.fs->csize; n; n--) {	/* Write dot entries and clear following sectors */
        LDR      R0,[SP, #+0]
        LDRB     R9,[R0, #+2]
        B.N      ??f_mkdir_8
// 3293 					dj.fs->winsect = dsc++;
// 3294 					dj.fs->wflag = 1;
// 3295 					res = move_window(dj.fs, 0);
// 3296 					if (res != FR_OK) break;
// 3297 					mem_set(dir, 0, SS(dj.fs));
??f_mkdir_9:
        MOV      R2,#+512
        MOVS     R1,#+0
        MOV      R0,R8
          CFI FunCall mem_set
        BL       mem_set
        SUBS     R9,R9,#+1
??f_mkdir_8:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??f_mkdir_6
        LDR      R0,[SP, #+0]
        STR      R7,[R0, #+44]
        ADDS     R7,R7,#+1
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
        MOVS     R1,#+0
        LDR      R0,[SP, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R6,R0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??f_mkdir_9
// 3298 				}
// 3299 			}
// 3300 			if (res == FR_OK) res = dir_register(&dj);	/* Register the object to the directoy */
??f_mkdir_6:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_mkdir_10
        ADD      R0,SP,#+0
          CFI FunCall dir_register
        BL       dir_register
        MOVS     R6,R0
// 3301 			if (res != FR_OK) {
??f_mkdir_10:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??f_mkdir_11
// 3302 				remove_chain(dj.fs, dcl);			/* Could not register, remove cluster chain */
        MOVS     R1,R5
        LDR      R0,[SP, #+0]
          CFI FunCall remove_chain
        BL       remove_chain
        B.N      ??f_mkdir_0
// 3303 			} else {
// 3304 				dir = dj.dir;
??f_mkdir_11:
        LDR      R8,[SP, #+20]
// 3305 				dir[DIR_Attr] = AM_DIR;				/* Attribute */
        MOVS     R0,#+16
        STRB     R0,[R8, #+11]
// 3306 				ST_DWORD(dir+DIR_WrtTime, tim);		/* Created time */
        STRB     R4,[R8, #+22]
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+23]
        LSRS     R0,R4,#+16
        STRB     R0,[R8, #+24]
        LSRS     R0,R4,#+24
        STRB     R0,[R8, #+25]
// 3307 				ST_CLUST(dir, dcl);					/* Table start cluster */
        STRB     R5,[R8, #+26]
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+27]
        LSRS     R0,R5,#+16
        STRB     R0,[R8, #+20]
        LSRS     R0,R5,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+21]
// 3308 				dj.fs->wflag = 1;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 3309 				res = sync(dj.fs);
        LDR      R0,[SP, #+0]
          CFI FunCall sync
        BL       sync
        MOVS     R6,R0
// 3310 			}
// 3311 		}
// 3312 		FREE_BUF();
// 3313 	}
// 3314 
// 3315 	LEAVE_FF(dj.fs, res);
??f_mkdir_0:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+52
          CFI CFA R13+28
        POP      {R4-R9,PC}       ;; return
          CFI EndBlock cfiBlock41
// 3316 }
// 3317 
// 3318 
// 3319 
// 3320 
// 3321 /*-----------------------------------------------------------------------*/
// 3322 /* Change Attribute                                                      */
// 3323 /*-----------------------------------------------------------------------*/
// 3324 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock42 Using cfiCommon0
          CFI Function f_chmod
        THUMB
// 3325 FRESULT f_chmod (
// 3326 	const TCHAR *path,	/* Pointer to the file path */
// 3327 	BYTE value,			/* Attribute bits */
// 3328 	BYTE mask			/* Attribute mask to change */
// 3329 )
// 3330 {
f_chmod:
        PUSH     {R0,R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        SUB      SP,SP,#+48
          CFI CFA R13+64
        MOVS     R5,R1
        MOVS     R4,R2
// 3331 	FRESULT res;
// 3332 	DIR dj;
// 3333 	BYTE *dir;
// 3334 	DEF_NAMEBUF;
// 3335 
// 3336 
// 3337 	res = chk_mounted(&path, &dj.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+12
        ADD      R0,SP,#+48
          CFI FunCall chk_mounted
        BL       chk_mounted
// 3338 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_chmod_0
// 3339 		INIT_BUF(dj);
        ADD      R0,SP,#+0
        STR      R0,[SP, #+36]
        LDR.N    R0,??DataTable15
        STR      R0,[SP, #+40]
// 3340 		res = follow_path(&dj, path);		/* Follow the file path */
        LDR      R1,[SP, #+48]
        ADD      R0,SP,#+12
          CFI FunCall follow_path
        BL       follow_path
// 3341 		FREE_BUF();
// 3342 		if (_FS_RPATH && res == FR_OK && (dj.fn[NS] & NS_DOT))
// 3343 			res = FR_INVALID_NAME;
// 3344 		if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_chmod_0
// 3345 			dir = dj.dir;
        LDR      R0,[SP, #+32]
// 3346 			if (!dir) {						/* Is it a root directory? */
        CMP      R0,#+0
        BNE.N    ??f_chmod_1
// 3347 				res = FR_INVALID_NAME;
        MOVS     R0,#+6
        B.N      ??f_chmod_0
// 3348 			} else {						/* File or sub directory */
// 3349 				mask &= AM_RDO|AM_HID|AM_SYS|AM_ARC;	/* Valid attribute mask */
??f_chmod_1:
        ANDS     R4,R4,#0x27
// 3350 				dir[DIR_Attr] = (value & mask) | (dir[DIR_Attr] & (BYTE)~mask);	/* Apply attribute change */
        ANDS     R1,R4,R5
        LDRB     R2,[R0, #+11]
        BICS     R2,R2,R4
        ORRS     R1,R2,R1
        STRB     R1,[R0, #+11]
// 3351 				dj.fs->wflag = 1;
        LDR      R0,[SP, #+12]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 3352 				res = sync(dj.fs);
        LDR      R0,[SP, #+12]
          CFI FunCall sync
        BL       sync
// 3353 			}
// 3354 		}
// 3355 	}
// 3356 
// 3357 	LEAVE_FF(dj.fs, res);
??f_chmod_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+52
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock42
// 3358 }
// 3359 
// 3360 
// 3361 
// 3362 
// 3363 /*-----------------------------------------------------------------------*/
// 3364 /* Change Timestamp                                                      */
// 3365 /*-----------------------------------------------------------------------*/
// 3366 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock43 Using cfiCommon0
          CFI Function f_utime
        THUMB
// 3367 FRESULT f_utime (
// 3368 	const TCHAR *path,	/* Pointer to the file/directory name */
// 3369 	const FILINFO *fno	/* Pointer to the time stamp to be set */
// 3370 )
// 3371 {
f_utime:
        PUSH     {R0,R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+12
        SUB      SP,SP,#+52
          CFI CFA R13+64
        MOVS     R4,R1
// 3372 	FRESULT res;
// 3373 	DIR dj;
// 3374 	BYTE *dir;
// 3375 	DEF_NAMEBUF;
// 3376 
// 3377 
// 3378 	res = chk_mounted(&path, &dj.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+12
        ADD      R0,SP,#+52
          CFI FunCall chk_mounted
        BL       chk_mounted
// 3379 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_utime_0
// 3380 		INIT_BUF(dj);
        ADD      R0,SP,#+0
        STR      R0,[SP, #+36]
        LDR.N    R0,??DataTable15
        STR      R0,[SP, #+40]
// 3381 		res = follow_path(&dj, path);	/* Follow the file path */
        LDR      R1,[SP, #+52]
        ADD      R0,SP,#+12
          CFI FunCall follow_path
        BL       follow_path
// 3382 		FREE_BUF();
// 3383 		if (_FS_RPATH && res == FR_OK && (dj.fn[NS] & NS_DOT))
// 3384 			res = FR_INVALID_NAME;
// 3385 		if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_utime_0
// 3386 			dir = dj.dir;
        LDR      R0,[SP, #+32]
// 3387 			if (!dir) {					/* Root directory */
        CMP      R0,#+0
        BNE.N    ??f_utime_1
// 3388 				res = FR_INVALID_NAME;
        MOVS     R0,#+6
        B.N      ??f_utime_0
// 3389 			} else {					/* File or sub-directory */
// 3390 				ST_WORD(dir+DIR_WrtTime, fno->ftime);
??f_utime_1:
        LDRH     R1,[R4, #+6]
        STRB     R1,[R0, #+22]
        LDRH     R1,[R4, #+6]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[R0, #+23]
// 3391 				ST_WORD(dir+DIR_WrtDate, fno->fdate);
        LDRH     R1,[R4, #+4]
        STRB     R1,[R0, #+24]
        LDRH     R1,[R4, #+4]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[R0, #+25]
// 3392 				dj.fs->wflag = 1;
        LDR      R0,[SP, #+12]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 3393 				res = sync(dj.fs);
        LDR      R0,[SP, #+12]
          CFI FunCall sync
        BL       sync
// 3394 			}
// 3395 		}
// 3396 	}
// 3397 
// 3398 	LEAVE_FF(dj.fs, res);
??f_utime_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+56
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock43
// 3399 }
// 3400 
// 3401 
// 3402 
// 3403 
// 3404 /*-----------------------------------------------------------------------*/
// 3405 /* Rename File/Directory                                                 */
// 3406 /*-----------------------------------------------------------------------*/
// 3407 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock44 Using cfiCommon0
          CFI Function f_rename
        THUMB
// 3408 FRESULT f_rename (
// 3409 	const TCHAR *path_old,	/* Pointer to the old name */
// 3410 	const TCHAR *path_new	/* Pointer to the new name */
// 3411 )
// 3412 {
f_rename:
        PUSH     {R0,R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        SUB      SP,SP,#+112
          CFI CFA R13+128
        MOVS     R4,R1
// 3413 	FRESULT res;
// 3414 	DIR djo, djn;
// 3415 	BYTE buf[21], *dir;
// 3416 	DWORD dw;
// 3417 	DEF_NAMEBUF;
// 3418 
// 3419 
// 3420 	res = chk_mounted(&path_old, &djo.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+36
        ADD      R0,SP,#+112
          CFI FunCall chk_mounted
        BL       chk_mounted
        MOVS     R5,R0
// 3421 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.W    ??f_rename_0
// 3422 		djn.fs = djo.fs;
        LDR      R0,[SP, #+36]
        STR      R0,[SP, #+0]
// 3423 		INIT_BUF(djo);
        ADD      R0,SP,#+72
        STR      R0,[SP, #+60]
        LDR.N    R0,??DataTable15
        STR      R0,[SP, #+64]
// 3424 		res = follow_path(&djo, path_old);		/* Check old object */
        LDR      R1,[SP, #+112]
        ADD      R0,SP,#+36
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 3425 		if (_FS_RPATH && res == FR_OK && (djo.fn[NS] & NS_DOT))
// 3426 			res = FR_INVALID_NAME;
// 3427 #if _FS_SHARE
// 3428 		if (res == FR_OK) res = chk_lock(&djo, 2);
// 3429 #endif
// 3430 		if (res == FR_OK) {						/* Old object is found */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.W    ??f_rename_0
// 3431 			if (!djo.dir) {						/* Is root dir? */
        LDR      R0,[SP, #+56]
        CMP      R0,#+0
        BNE.N    ??f_rename_1
// 3432 				res = FR_NO_FILE;
        MOVS     R5,#+4
        B.N      ??f_rename_0
// 3433 			} else {
// 3434 				mem_cpy(buf, djo.dir+DIR_Attr, 21);		/* Save the object information except for name */
??f_rename_1:
        MOVS     R2,#+21
        LDR      R0,[SP, #+56]
        ADDS     R1,R0,#+11
        ADD      R0,SP,#+84
          CFI FunCall mem_cpy
        BL       mem_cpy
// 3435 				mem_cpy(&djn, &djo, sizeof(DIR));		/* Check new object */
        MOVS     R2,#+36
        ADD      R1,SP,#+36
        ADD      R0,SP,#+0
          CFI FunCall mem_cpy
        BL       mem_cpy
// 3436 				res = follow_path(&djn, path_new);
        MOVS     R1,R4
        ADD      R0,SP,#+0
          CFI FunCall follow_path
        BL       follow_path
        MOVS     R5,R0
// 3437 				if (res == FR_OK) res = FR_EXIST;		/* The new object name is already existing */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_2
        MOVS     R5,#+8
// 3438 				if (res == FR_NO_FILE) { 				/* Is it a valid path and no name collision? */
??f_rename_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BNE.N    ??f_rename_0
// 3439 /* Start critical section that any interruption or error can cause cross-link */
// 3440 					res = dir_register(&djn);			/* Register the new entry */
        ADD      R0,SP,#+0
          CFI FunCall dir_register
        BL       dir_register
        MOVS     R5,R0
// 3441 					if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_0
// 3442 						dir = djn.dir;					/* Copy object information except for name */
        LDR      R4,[SP, #+20]
// 3443 						mem_cpy(dir+13, buf+2, 19);
        MOVS     R2,#+19
        ADD      R1,SP,#+86
        ADDS     R0,R4,#+13
          CFI FunCall mem_cpy
        BL       mem_cpy
// 3444 						dir[DIR_Attr] = buf[0] | AM_ARC;
        LDRB     R0,[SP, #+84]
        ORRS     R0,R0,#0x20
        STRB     R0,[R4, #+11]
// 3445 						djo.fs->wflag = 1;
        LDR      R0,[SP, #+36]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 3446 						if (djo.sclust != djn.sclust && (dir[DIR_Attr] & AM_DIR)) {		/* Update .. entry in the directory if needed */
        LDR      R0,[SP, #+44]
        LDR      R1,[SP, #+8]
        CMP      R0,R1
        BEQ.N    ??f_rename_3
        LDRB     R0,[R4, #+11]
        LSLS     R0,R0,#+27
        BPL.N    ??f_rename_3
// 3447 							dw = clust2sect(djn.fs, LD_CLUST(dir));
        LDRB     R0,[R4, #+21]
        LDRB     R1,[R4, #+20]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDRB     R1,[R4, #+27]
        LDRB     R2,[R4, #+26]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R1,R1,R0, LSL #+16
        LDR      R0,[SP, #+0]
          CFI FunCall clust2sect
        BL       clust2sect
// 3448 							if (!dw) {
        CMP      R0,#+0
        BNE.N    ??f_rename_4
// 3449 								res = FR_INT_ERR;
        MOVS     R5,#+2
        B.N      ??f_rename_3
// 3450 							} else {
// 3451 								res = move_window(djn.fs, dw);
??f_rename_4:
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
          CFI FunCall move_window
        BL       move_window
        MOVS     R5,R0
// 3452 								dir = djn.fs->win+SZ_DIR;	/* .. entry */
        LDR      R0,[SP, #+0]
        ADDS     R4,R0,#+80
// 3453 								if (res == FR_OK && dir[1] == '.') {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_3
        LDRB     R0,[R4, #+1]
        CMP      R0,#+46
        BNE.N    ??f_rename_3
// 3454 									dw = (djn.fs->fs_type == FS_FAT32 && djn.sclust == djn.fs->dirbase) ? 0 : djn.sclust;
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??f_rename_5
        LDR      R0,[SP, #+8]
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+36]
        CMP      R0,R1
        BNE.N    ??f_rename_5
        MOVS     R0,#+0
        B.N      ??f_rename_6
??f_rename_5:
        LDR      R0,[SP, #+8]
// 3455 									ST_CLUST(dir, dw);
??f_rename_6:
        STRB     R0,[R4, #+26]
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[R4, #+27]
        LSRS     R1,R0,#+16
        STRB     R1,[R4, #+20]
        LSRS     R0,R0,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R4, #+21]
// 3456 									djn.fs->wflag = 1;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 3457 								}
// 3458 							}
// 3459 						}
// 3460 						if (res == FR_OK) {
??f_rename_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_0
// 3461 							res = dir_remove(&djo);		/* Remove old entry */
        ADD      R0,SP,#+36
          CFI FunCall dir_remove
        BL       dir_remove
        MOVS     R5,R0
// 3462 							if (res == FR_OK)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_0
// 3463 								res = sync(djo.fs);
        LDR      R0,[SP, #+36]
          CFI FunCall sync
        BL       sync
        MOVS     R5,R0
// 3464 						}
// 3465 					}
// 3466 /* End critical section */
// 3467 				}
// 3468 			}
// 3469 		}
// 3470 		FREE_BUF();
// 3471 	}
// 3472 	LEAVE_FF(djo.fs, res);
??f_rename_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+116
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock44
// 3473 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     LfnBuf
// 3474 
// 3475 #endif /* !_FS_READONLY */
// 3476 #endif /* _FS_MINIMIZE == 0 */
// 3477 #endif /* _FS_MINIMIZE <= 1 */
// 3478 #endif /* _FS_MINIMIZE <= 2 */
// 3479 
// 3480 
// 3481 
// 3482 /*-----------------------------------------------------------------------*/
// 3483 /* Forward data to the stream directly (available on only tiny cfg)      */
// 3484 /*-----------------------------------------------------------------------*/
// 3485 #if _USE_FORWARD && _FS_TINY
// 3486 
// 3487 FRESULT f_forward (
// 3488 	FIL *fp, 						/* Pointer to the file object */
// 3489 	UINT (*func)(const BYTE*,UINT),	/* Pointer to the streaming function */
// 3490 	UINT btr,						/* Number of bytes to forward */
// 3491 	UINT *bf						/* Pointer to number of bytes forwarded */
// 3492 )
// 3493 {
// 3494 	FRESULT res;
// 3495 	DWORD remain, clst, sect;
// 3496 	UINT rcnt;
// 3497 	BYTE csect;
// 3498 
// 3499 
// 3500 	*bf = 0;	/* Initialize byte counter */
// 3501 
// 3502 	res = validate(fp->fs, fp->id);					/* Check validity of the object */
// 3503 	if (res != FR_OK) LEAVE_FF(fp->fs, res);
// 3504 	if (fp->flag & FA__ERROR)						/* Check error flag */
// 3505 		LEAVE_FF(fp->fs, FR_INT_ERR);
// 3506 	if (!(fp->flag & FA_READ))						/* Check access mode */
// 3507 		LEAVE_FF(fp->fs, FR_DENIED);
// 3508 
// 3509 	remain = fp->fsize - fp->fptr;
// 3510 	if (btr > remain) btr = (UINT)remain;			/* Truncate btr by remaining bytes */
// 3511 
// 3512 	for ( ;  btr && (*func)(0, 0);					/* Repeat until all data transferred or stream becomes busy */
// 3513 		fp->fptr += rcnt, *bf += rcnt, btr -= rcnt) {
// 3514 		csect = (BYTE)(fp->fptr / SS(fp->fs) & (fp->fs->csize - 1));	/* Sector offset in the cluster */
// 3515 		if ((fp->fptr % SS(fp->fs)) == 0) {			/* On the sector boundary? */
// 3516 			if (!csect) {							/* On the cluster boundary? */
// 3517 				clst = (fp->fptr == 0) ?			/* On the top of the file? */
// 3518 					fp->sclust : get_fat(fp->fs, fp->clust);
// 3519 				if (clst <= 1) ABORT(fp->fs, FR_INT_ERR);
// 3520 				if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
// 3521 				fp->clust = clst;					/* Update current cluster */
// 3522 			}
// 3523 		}
// 3524 		sect = clust2sect(fp->fs, fp->clust);		/* Get current data sector */
// 3525 		if (!sect) ABORT(fp->fs, FR_INT_ERR);
// 3526 		sect += csect;
// 3527 		if (move_window(fp->fs, sect))				/* Move sector window */
// 3528 			ABORT(fp->fs, FR_DISK_ERR);
// 3529 		fp->dsect = sect;
// 3530 		rcnt = SS(fp->fs) - (WORD)(fp->fptr % SS(fp->fs));	/* Forward data from sector window */
// 3531 		if (rcnt > btr) rcnt = btr;
// 3532 		rcnt = (*func)(&fp->fs->win[(WORD)fp->fptr % SS(fp->fs)], rcnt);
// 3533 		if (!rcnt) ABORT(fp->fs, FR_INT_ERR);
// 3534 	}
// 3535 
// 3536 	LEAVE_FF(fp->fs, FR_OK);
// 3537 }
// 3538 #endif /* _USE_FORWARD */
// 3539 
// 3540 
// 3541 
// 3542 #if _USE_MKFS && !_FS_READONLY
// 3543 /*-----------------------------------------------------------------------*/
// 3544 /* Create File System on the Drive                                       */
// 3545 /*-----------------------------------------------------------------------*/
// 3546 #define N_ROOTDIR	512		/* Number of root dir entries for FAT12/16 */
// 3547 #define N_FATS		1		/* Number of FAT copies (1 or 2) */
// 3548 
// 3549 
// 3550 FRESULT f_mkfs (
// 3551 	BYTE drv,		/* Logical drive number */
// 3552 	BYTE sfd,		/* Partitioning rule 0:FDISK, 1:SFD */
// 3553 	UINT au			/* Allocation unit size [bytes] */
// 3554 )
// 3555 {
// 3556 	static const WORD vst[] = { 1024,   512,  256,  128,   64,    32,   16,    8,    4,    2,   0};
// 3557 	static const WORD cst[] = {32768, 16384, 8192, 4096, 2048, 16384, 8192, 4096, 2048, 1024, 512};
// 3558 	BYTE fmt, md, *tbl;
// 3559 	DWORD n_clst, vs, n, wsect;
// 3560 	UINT i;
// 3561 	DWORD b_vol, b_fat, b_dir, b_data;	/* Offset (LBA) */
// 3562 	DWORD n_vol, n_rsv, n_fat, n_dir;	/* Size */
// 3563 	FATFS *fs;
// 3564 	DSTATUS stat;
// 3565 
// 3566 
// 3567 	/* Check mounted drive and clear work area */
// 3568 	if (drv >= _VOLUMES) return FR_INVALID_DRIVE;
// 3569 	fs = FatFs[drv];
// 3570 	if (!fs) return FR_NOT_ENABLED;
// 3571 	fs->fs_type = 0;
// 3572 	drv = LD2PD(drv);
// 3573 
// 3574 	/* Get disk statics */
// 3575 	stat = disk_initialize(drv);
// 3576 	if (stat & STA_NOINIT) return FR_NOT_READY;
// 3577 	if (stat & STA_PROTECT) return FR_WRITE_PROTECTED;
// 3578 #if _MAX_SS != 512					/* Get disk sector size */
// 3579 	if (disk_ioctl(drv, GET_SECTOR_SIZE, &SS(fs)) != RES_OK)
// 3580 		return FR_DISK_ERR;
// 3581 #endif
// 3582 	if (disk_ioctl(drv, GET_SECTOR_COUNT, &n_vol) != RES_OK || n_vol < 128)
// 3583 		return FR_DISK_ERR;
// 3584 	b_vol = (sfd) ? 0 : 63;	/* Volume start sector */
// 3585 	n_vol -= b_vol;
// 3586 	if (au & (au - 1)) au = 0;	/* Check validity of the AU size */
// 3587 	if (!au) {					/* AU auto selection */
// 3588 		vs = n_vol / (2000 / (SS(fs) / 512));
// 3589 		for (i = 0; vs < vst[i]; i++) ;
// 3590 		au = cst[i];
// 3591 	}
// 3592 	au /= SS(fs);		/* Number of sectors per cluster */
// 3593 	if (au == 0) au = 1;
// 3594 	if (au > 128) au = 128;
// 3595 
// 3596 	/* Pre-compute number of clusters and FAT syb-type */
// 3597 	n_clst = n_vol / au;
// 3598 	fmt = FS_FAT12;
// 3599 	if (n_clst >= MIN_FAT16) fmt = FS_FAT16;
// 3600 	if (n_clst >= MIN_FAT32) fmt = FS_FAT32;
// 3601 
// 3602 	/* Determine offset and size of FAT structure */
// 3603 	if (fmt == FS_FAT32) {
// 3604 		n_fat = ((n_clst * 4) + 8 + SS(fs) - 1) / SS(fs);
// 3605 		n_rsv = 32;
// 3606 		n_dir = 0;
// 3607 	} else {
// 3608 		n_fat = (fmt == FS_FAT12) ? (n_clst * 3 + 1) / 2 + 3 : (n_clst * 2) + 4;
// 3609 		n_fat = (n_fat + SS(fs) - 1) / SS(fs);
// 3610 		n_rsv = 1;
// 3611 		n_dir = (DWORD)N_ROOTDIR * SZ_DIR / SS(fs);
// 3612 	}
// 3613 	b_fat = b_vol + n_rsv;				/* FAT area start sector */
// 3614 	b_dir = b_fat + n_fat * N_FATS;		/* Directory area start sector */
// 3615 	b_data = b_dir + n_dir;				/* Data area start sector */
// 3616 	if (n_vol < b_data + au) return FR_MKFS_ABORTED;	/* Too small volume */
// 3617 
// 3618 	/* Align data start sector to erase block boundary (for flash memory media) */
// 3619 	if (disk_ioctl(drv, GET_BLOCK_SIZE, &n) != RES_OK || !n || n > 32768) n = 1;
// 3620 	n = (b_data + n - 1) & ~(n - 1);	/* Next nearest erase block from current data start */
// 3621 	n = (n - b_data) / N_FATS;
// 3622 	if (fmt == FS_FAT32) {		/* FAT32: Move FAT offset */
// 3623 		n_rsv += n;
// 3624 		b_fat += n;
// 3625 	} else {					/* FAT12/16: Expand FAT size */
// 3626 		n_fat += n;
// 3627 	}
// 3628 
// 3629 	/* Determine number of clusters and final check of validity of the FAT sub-type */
// 3630 	n_clst = (n_vol - n_rsv - n_fat * N_FATS - n_dir) / au;
// 3631 	if (   (fmt == FS_FAT16 && n_clst < MIN_FAT16)
// 3632 		|| (fmt == FS_FAT32 && n_clst < MIN_FAT32))
// 3633 		return FR_MKFS_ABORTED;
// 3634 
// 3635 	/* Create partition table if required */
// 3636 	if (sfd) {	/* No patition table (SFD) */
// 3637 		md = 0xF0;
// 3638 	} else {	/* With patition table (FDISK) */
// 3639 		DWORD n_disk = b_vol + n_vol;
// 3640 
// 3641 		mem_set(fs->win, 0, SS(fs));
// 3642 		tbl = fs->win+MBR_Table;
// 3643 		ST_DWORD(tbl, 0x00010180);			/* Partition start in CHS */
// 3644 		if (n_disk < 63UL * 255 * 1024) {	/* Partition end in CHS */
// 3645 			n_disk = n_disk / 63 / 255;
// 3646 			tbl[7] = (BYTE)n_disk;
// 3647 			tbl[6] = (BYTE)((n_disk >> 2) | 63);
// 3648 		} else {
// 3649 			ST_WORD(&tbl[6], 0xFFFF);	/* CHS saturated */
// 3650 		}
// 3651 		tbl[5] = 254;
// 3652 		if (fmt != FS_FAT32)				/* System ID */
// 3653 			tbl[4] = (n_vol < 0x10000) ? 0x04 : 0x06;
// 3654 		else
// 3655 			tbl[4] = 0x0c;
// 3656 		ST_DWORD(tbl+8, 63);				/* Partition start in LBA */
// 3657 		ST_DWORD(tbl+12, n_vol);			/* Partition size in LBA */
// 3658 		ST_WORD(fs->win+BS_55AA, 0xAA55);	/* MBR signature */
// 3659 		if (disk_write(drv, fs->win, 0, 1) != RES_OK)	/* Put the MBR into first physical sector */
// 3660 			return FR_DISK_ERR;
// 3661 		md = 0xF8;
// 3662 	}
// 3663 
// 3664 	/* Create volume boot record */
// 3665 	tbl = fs->win;							/* Clear sector */
// 3666 	mem_set(tbl, 0, SS(fs));
// 3667 	mem_cpy(tbl, "\xEB\xFE\x90" "MSDOS5.0", 11);/* Boot jump code, OEM name */
// 3668 	i = SS(fs);								/* Sector size */
// 3669 	ST_WORD(tbl+BPB_BytsPerSec, i);
// 3670 	tbl[BPB_SecPerClus] = (BYTE)au;			/* Sectors per cluster */
// 3671 	ST_WORD(tbl+BPB_RsvdSecCnt, n_rsv);		/* Reserved sectors */
// 3672 	tbl[BPB_NumFATs] = N_FATS;				/* Number of FATs */
// 3673 	i = (fmt == FS_FAT32) ? 0 : N_ROOTDIR;	/* Number of rootdir entries */
// 3674 	ST_WORD(tbl+BPB_RootEntCnt, i);
// 3675 	if (n_vol < 0x10000) {					/* Number of total sectors */
// 3676 		ST_WORD(tbl+BPB_TotSec16, n_vol);
// 3677 	} else {
// 3678 		ST_DWORD(tbl+BPB_TotSec32, n_vol);
// 3679 	}
// 3680 	tbl[BPB_Media] = md;					/* Media descriptor */
// 3681 	ST_WORD(tbl+BPB_SecPerTrk, 63);			/* Number of sectors per track */
// 3682 	ST_WORD(tbl+BPB_NumHeads, 255);			/* Number of heads */
// 3683 	ST_DWORD(tbl+BPB_HiddSec, b_vol);		/* Hidden sectors */
// 3684 	n = get_fattime();						/* Use current time as VSN */
// 3685 	if (fmt == FS_FAT32) {
// 3686 		ST_DWORD(tbl+BS_VolID32, n);		/* VSN */
// 3687 		ST_DWORD(tbl+BPB_FATSz32, n_fat);	/* Number of sectors per FAT */
// 3688 		ST_DWORD(tbl+BPB_RootClus, 2);		/* Root directory start cluster (2) */
// 3689 		ST_WORD(tbl+BPB_FSInfo, 1);			/* FSInfo record offset (VBR+1) */
// 3690 		ST_WORD(tbl+BPB_BkBootSec, 6);		/* Backup boot record offset (VBR+6) */
// 3691 		tbl[BS_DrvNum32] = 0x80;			/* Drive number */
// 3692 		tbl[BS_BootSig32] = 0x29;			/* Extended boot signature */
// 3693 		mem_cpy(tbl+BS_VolLab32, "NO NAME    " "FAT32   ", 19);	/* Volume label, FAT signature */
// 3694 	} else {
// 3695 		ST_DWORD(tbl+BS_VolID, n);			/* VSN */
// 3696 		ST_WORD(tbl+BPB_FATSz16, n_fat);	/* Number of sectors per FAT */
// 3697 		tbl[BS_DrvNum] = 0x80;				/* Drive number */
// 3698 		tbl[BS_BootSig] = 0x29;				/* Extended boot signature */
// 3699 		mem_cpy(tbl+BS_VolLab, "NO NAME    " "FAT     ", 19);	/* Volume label, FAT signature */
// 3700 	}
// 3701 	ST_WORD(tbl+BS_55AA, 0xAA55);			/* Signature (Offset is fixed here regardless of sector size) */
// 3702 	if (disk_write(drv, tbl, b_vol, 1) != RES_OK)	/* Write VBR */
// 3703 		return FR_DISK_ERR;
// 3704 	if (fmt == FS_FAT32)							/* Write backup VBR if needed (VBR+6) */
// 3705 		disk_write(drv, tbl, b_vol + 6, 1);
// 3706 
// 3707 	/* Initialize FAT area */
// 3708 	wsect = b_fat;
// 3709 	for (i = 0; i < N_FATS; i++) {		/* Initialize each FAT copy */
// 3710 		mem_set(tbl, 0, SS(fs));			/* 1st sector of the FAT  */
// 3711 		n = md;								/* Media descriptor byte */
// 3712 		if (fmt != FS_FAT32) {
// 3713 			n |= (fmt == FS_FAT12) ? 0x00FFFF00 : 0xFFFFFF00;
// 3714 			ST_DWORD(tbl+0, n);				/* Reserve cluster #0-1 (FAT12/16) */
// 3715 		} else {
// 3716 			n |= 0xFFFFFF00;
// 3717 			ST_DWORD(tbl+0, n);				/* Reserve cluster #0-1 (FAT32) */
// 3718 			ST_DWORD(tbl+4, 0xFFFFFFFF);
// 3719 			ST_DWORD(tbl+8, 0x0FFFFFFF);	/* Reserve cluster #2 for root dir */
// 3720 		}
// 3721 		if (disk_write(drv, tbl, wsect++, 1) != RES_OK)
// 3722 			return FR_DISK_ERR;
// 3723 		mem_set(tbl, 0, SS(fs));			/* Fill following FAT entries with zero */
// 3724 		for (n = 1; n < n_fat; n++) {		/* This loop may take a time on FAT32 volume due to many single sector writes */
// 3725 			if (disk_write(drv, tbl, wsect++, 1) != RES_OK)
// 3726 				return FR_DISK_ERR;
// 3727 		}
// 3728 	}
// 3729 
// 3730 	/* Initialize root directory */
// 3731 	i = (fmt == FS_FAT32) ? au : n_dir;
// 3732 	do {
// 3733 		if (disk_write(drv, tbl, wsect++, 1) != RES_OK)
// 3734 			return FR_DISK_ERR;
// 3735 	} while (--i);
// 3736 
// 3737 #if _USE_ERASE	/* Erase data area if needed */
// 3738 	{
// 3739 		DWORD eb[2];
// 3740 
// 3741 		eb[0] = wsect; eb[1] = wsect + (n_clst - ((fmt == FS_FAT32) ? 1 : 0)) * au - 1;
// 3742 		disk_ioctl(drv, CTRL_ERASE_SECTOR, eb);
// 3743 	}
// 3744 #endif
// 3745 
// 3746 	/* Create FSInfo if needed */
// 3747 	if (fmt == FS_FAT32) {
// 3748 		ST_DWORD(tbl+FSI_LeadSig, 0x41615252);
// 3749 		ST_DWORD(tbl+FSI_StrucSig, 0x61417272);
// 3750 		ST_DWORD(tbl+FSI_Free_Count, n_clst - 1);	/* Number of free clusters */
// 3751 		ST_DWORD(tbl+FSI_Nxt_Free, 2);				/* Last allocated cluster# */
// 3752 		ST_WORD(tbl+BS_55AA, 0xAA55);
// 3753 		disk_write(drv, tbl, b_vol + 1, 1);	/* Write original (VBR+1) */
// 3754 		disk_write(drv, tbl, b_vol + 7, 1);	/* Write backup (VBR+7) */
// 3755 	}
// 3756 
// 3757 	return (disk_ioctl(drv, CTRL_SYNC, (void*)0) == RES_OK) ? FR_OK : FR_DISK_ERR;
// 3758 }
// 3759 
// 3760 #endif /* _USE_MKFS && !_FS_READONLY */
// 3761 
// 3762 
// 3763 
// 3764 
// 3765 #if _USE_STRFUNC
// 3766 /*-----------------------------------------------------------------------*/
// 3767 /* Get a string from the file                                            */
// 3768 /*-----------------------------------------------------------------------*/
// 3769 TCHAR* f_gets (
// 3770 	TCHAR* buff,	/* Pointer to the string buffer to read */
// 3771 	int len,		/* Size of string buffer (characters) */
// 3772 	FIL* fil		/* Pointer to the file object */
// 3773 )
// 3774 {
// 3775 	int n = 0;
// 3776 	TCHAR c, *p = buff;
// 3777 	BYTE s[2];
// 3778 	UINT rc;
// 3779 
// 3780 
// 3781 	while (n < len - 1) {			/* Read bytes until buffer gets filled */
// 3782 		f_read(fil, s, 1, &rc);
// 3783 		if (rc != 1) break;			/* Break on EOF or error */
// 3784 		c = s[0];
// 3785 #if _LFN_UNICODE					/* Read a character in UTF-8 encoding */
// 3786 		if (c >= 0x80) {
// 3787 			if (c < 0xC0) continue;	/* Skip stray trailer */
// 3788 			if (c < 0xE0) {			/* Two-byte sequense */
// 3789 				f_read(fil, s, 1, &rc);
// 3790 				if (rc != 1) break;
// 3791 				c = ((c & 0x1F) << 6) | (s[0] & 0x3F);
// 3792 				if (c < 0x80) c = '?';
// 3793 			} else {
// 3794 				if (c < 0xF0) {		/* Three-byte sequense */
// 3795 					f_read(fil, s, 2, &rc);
// 3796 					if (rc != 2) break;
// 3797 					c = (c << 12) | ((s[0] & 0x3F) << 6) | (s[1] & 0x3F);
// 3798 					if (c < 0x800) c = '?';
// 3799 				} else {			/* Reject four-byte sequense */
// 3800 					c = '?';
// 3801 				}
// 3802 			}
// 3803 		}
// 3804 #endif
// 3805 #if _USE_STRFUNC >= 2
// 3806 		if (c == '\r') continue;	/* Strip '\r' */
// 3807 #endif
// 3808 		*p++ = c;
// 3809 		n++;
// 3810 		if (c == '\n') break;		/* Break on EOL */
// 3811 	}
// 3812 	*p = 0;
// 3813 	return n ? buff : 0;			/* When no data read (eof or error), return with error. */
// 3814 }
// 3815 
// 3816 
// 3817 
// 3818 #if !_FS_READONLY
// 3819 #include <stdarg.h>
// 3820 /*-----------------------------------------------------------------------*/
// 3821 /* Put a character to the file                                           */
// 3822 /*-----------------------------------------------------------------------*/
// 3823 int f_putc (
// 3824 	TCHAR c,	/* A character to be output */
// 3825 	FIL* fil	/* Pointer to the file object */
// 3826 )
// 3827 {
// 3828 	UINT bw, btw;
// 3829 	BYTE s[3];
// 3830 
// 3831 
// 3832 #if _USE_STRFUNC >= 2
// 3833 	if (c == '\n') f_putc ('\r', fil);	/* LF -> CRLF conversion */
// 3834 #endif
// 3835 
// 3836 #if _LFN_UNICODE	/* Write the character in UTF-8 encoding */
// 3837 	if (c < 0x80) {			/* 7-bit */
// 3838 		s[0] = (BYTE)c;
// 3839 		btw = 1;
// 3840 	} else {
// 3841 		if (c < 0x800) {	/* 11-bit */
// 3842 			s[0] = (BYTE)(0xC0 | (c >> 6));
// 3843 			s[1] = (BYTE)(0x80 | (c & 0x3F));
// 3844 			btw = 2;
// 3845 		} else {			/* 16-bit */
// 3846 			s[0] = (BYTE)(0xE0 | (c >> 12));
// 3847 			s[1] = (BYTE)(0x80 | ((c >> 6) & 0x3F));
// 3848 			s[2] = (BYTE)(0x80 | (c & 0x3F));
// 3849 			btw = 3;
// 3850 		}
// 3851 	}
// 3852 #else				/* Write the character without conversion */
// 3853 	s[0] = (BYTE)c;
// 3854 	btw = 1;
// 3855 #endif
// 3856 	f_write(fil, s, btw, &bw);		/* Write the char to the file */
// 3857 	return (bw == btw) ? 1 : EOF;	/* Return the result */
// 3858 }
// 3859 
// 3860 
// 3861 
// 3862 
// 3863 /*-----------------------------------------------------------------------*/
// 3864 /* Put a string to the file                                              */
// 3865 /*-----------------------------------------------------------------------*/
// 3866 int f_puts (
// 3867 	const TCHAR* str,	/* Pointer to the string to be output */
// 3868 	FIL* fil			/* Pointer to the file object */
// 3869 )
// 3870 {
// 3871 	int n;
// 3872 
// 3873 
// 3874 	for (n = 0; *str; str++, n++) {
// 3875 		if (f_putc(*str, fil) == EOF) return EOF;
// 3876 	}
// 3877 	return n;
// 3878 }
// 3879 
// 3880 
// 3881 
// 3882 
// 3883 /*-----------------------------------------------------------------------*/
// 3884 /* Put a formatted string to the file                                    */
// 3885 /*-----------------------------------------------------------------------*/
// 3886 int f_printf (
// 3887 	FIL* fil,			/* Pointer to the file object */
// 3888 	const TCHAR* str,	/* Pointer to the format string */
// 3889 	...					/* Optional arguments... */
// 3890 )
// 3891 {
// 3892 	va_list arp;
// 3893 	BYTE f, r;
// 3894 	UINT i, j, w;
// 3895 	ULONG v;
// 3896 	TCHAR c, d, s[16], *p;
// 3897 	int res, cc;
// 3898 
// 3899 
// 3900 	va_start(arp, str);
// 3901 
// 3902 	for (cc = res = 0; cc != EOF; res += cc) {
// 3903 		c = *str++;
// 3904 		if (c == 0) break;			/* End of string */
// 3905 		if (c != '%') {				/* Non escape character */
// 3906 			cc = f_putc(c, fil);
// 3907 			if (cc != EOF) cc = 1;
// 3908 			continue;
// 3909 		}
// 3910 		w = f = 0;
// 3911 		c = *str++;
// 3912 		if (c == '0') {				/* Flag: '0' padding */
// 3913 			f = 1; c = *str++;
// 3914 		} else {
// 3915 			if (c == '-') {			/* Flag: left justified */
// 3916 				f = 2; c = *str++;
// 3917 			}
// 3918 		}
// 3919 		while (IsDigit(c)) {		/* Precision */
// 3920 			w = w * 10 + c - '0';
// 3921 			c = *str++;
// 3922 		}
// 3923 		if (c == 'l' || c == 'L') {	/* Prefix: Size is long int */
// 3924 			f |= 4; c = *str++;
// 3925 		}
// 3926 		if (!c) break;
// 3927 		d = c;
// 3928 		if (IsLower(d)) d -= 0x20;
// 3929 		switch (d) {				/* Type is... */
// 3930 		case 'S' :					/* String */
// 3931 			p = va_arg(arp, TCHAR*);
// 3932 			for (j = 0; p[j]; j++) ;
// 3933 			res = 0;
// 3934 			while (!(f & 2) && j++ < w) res += (cc = f_putc(' ', fil));
// 3935 			res += (cc = f_puts(p, fil));
// 3936 			while (j++ < w) res += (cc = f_putc(' ', fil));
// 3937 			if (cc != EOF) cc = res;
// 3938 			continue;
// 3939 		case 'C' :					/* Character */
// 3940 			cc = f_putc((TCHAR)va_arg(arp, int), fil); continue;
// 3941 		case 'B' :					/* Binary */
// 3942 			r = 2; break;
// 3943 		case 'O' :					/* Octal */
// 3944 			r = 8; break;
// 3945 		case 'D' :					/* Signed decimal */
// 3946 		case 'U' :					/* Unsigned decimal */
// 3947 			r = 10; break;
// 3948 		case 'X' :					/* Hexdecimal */
// 3949 			r = 16; break;
// 3950 		default:					/* Unknown type (passthrough) */
// 3951 			cc = f_putc(c, fil); continue;
// 3952 		}
// 3953 
// 3954 		/* Get an argument and put it in numeral */
// 3955 		v = (f & 4) ? va_arg(arp, long) : ((d == 'D') ? (long)va_arg(arp, int) : va_arg(arp, unsigned int));
// 3956 		if (d == 'D' && (v & 0x80000000)) {
// 3957 			v = 0 - v;
// 3958 			f |= 8;
// 3959 		}
// 3960 		i = 0;
// 3961 		do {
// 3962 			d = (TCHAR)(v % r); v /= r;
// 3963 			if (d > 9) d += (c == 'x') ? 0x27 : 0x07;
// 3964 			s[i++] = d + '0';
// 3965 		} while (v && i < sizeof(s) / sizeof(s[0]));
// 3966 		if (f & 8) s[i++] = '-';
// 3967 		j = i; d = (f & 1) ? '0' : ' ';
// 3968 		res = 0;
// 3969 		while (!(f & 2) && j++ < w) res += (cc = f_putc(d, fil));
// 3970 		do res += (cc = f_putc(s[--i], fil)); while(i);
// 3971 		while (j++ < w) res += (cc = f_putc(' ', fil));
// 3972 		if (cc != EOF) cc = res;
// 3973 	}
// 3974 
// 3975 	va_end(arp);
// 3976 	return (cc == EOF) ? cc : res;
// 3977 }
// 3978 
// 3979 //WCHAR ff_convert (WCHAR, UINT);		/* OEM-Unicode bidirectional conversion */
// 3980 //WCHAR ff_wtoupper (WCHAR);			/* Unicode upper-case conversion */
// 3981 
// 3982 #endif /* !_FS_READONLY */
// 3983 #endif /* _USE_STRFUNC */
// 3984 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock45 Using cfiCommon0
          CFI Function ff_wtoupper
          CFI NoCalls
        THUMB
// 3985 WCHAR ff_wtoupper(WCHAR a){
ff_wtoupper:
        MOVS     R1,R0
// 3986   
// 3987   if(a>='a' && a<='z')
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        SUBS     R0,R1,#+97
        CMP      R0,#+26
        BCS.N    ??ff_wtoupper_0
// 3988     return a-=32;
        SUBS     R1,R1,#+32
        MOVS     R0,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        B.N      ??ff_wtoupper_1
// 3989   
// 3990   return a;
??ff_wtoupper_0:
        MOVS     R0,R1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
??ff_wtoupper_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock45
// 3991 }
// 3992 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock46 Using cfiCommon0
          CFI Function ff_convert
          CFI NoCalls
        THUMB
// 3993 WCHAR ff_convert(WCHAR a,UINT b){
// 3994   
// 3995   return a;  
ff_convert:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock46
// 3996 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
//   522 bytes in section .bss
//    36 bytes in section .rodata
// 9 572 bytes in section .text
// 
// 9 572 bytes of CODE  memory
//    36 bytes of CONST memory
//   522 bytes of DATA  memory
//
//Errors: none
//Warnings: none
