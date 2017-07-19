///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     17/Jul/2017  11:25:24 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\FILESYSTEM\ffsystem.c           /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Drivers\FILESYSTEM\ffsystem.c -lC       /
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
//                    pocaG2\SOFTWARE\Debug\List\ffsystem.s                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ffsystem

        RTMODEL "__SystemLibrary", "DLib"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1


        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Drivers\FILESYSTEM\ffsystem.c
//    1 /*------------------------------------------------------------------------*/
//    2 /* Sample code of OS dependent controls for FatFs                         */
//    3 /* (C)ChaN, 2017                                                          */
//    4 /*------------------------------------------------------------------------*/
//    5 
//    6 
//    7 #include "ff.h"
//    8 
//    9 
//   10 
//   11 #if FF_USE_LFN == 3	/* Dynamic memory allocation */
//   12 
//   13 /*------------------------------------------------------------------------*/
//   14 /* Allocate a memory block                                                */
//   15 /*------------------------------------------------------------------------*/
//   16 
//   17 void* ff_memalloc (	/* Returns pointer to the allocated memory block (null on not enough core) */
//   18 	UINT msize		/* Number of bytes to allocate */
//   19 )
//   20 {
//   21 	return malloc(msize);	/* Allocate a new memory block with POSIX API */
//   22 }
//   23 
//   24 
//   25 /*------------------------------------------------------------------------*/
//   26 /* Free a memory block                                                    */
//   27 /*------------------------------------------------------------------------*/
//   28 
//   29 void ff_memfree (
//   30 	void* mblock	/* Pointer to the memory block to free */
//   31 )
//   32 {
//   33 	free(mblock);	/* Free the memory block with POSIX API */
//   34 }
//   35 
//   36 #endif
//   37 
//   38 
//   39 
//   40 #if FF_FS_REENTRANT	/* Mutal exclusion */
//   41 
//   42 /*------------------------------------------------------------------------*/
//   43 /* Create a Synchronization Object
//   44 /*------------------------------------------------------------------------*/
//   45 /* This function is called in f_mount() function to create a new
//   46 /  synchronization object for the volume, such as semaphore and mutex.
//   47 /  When a 0 is returned, the f_mount() function fails with FR_INT_ERR.
//   48 */
//   49 
//   50 //const osMutexDef_t Mutex[FF_VOLUMES];	/* CMSIS-RTOS */
//   51 
//   52 
//   53 int ff_cre_syncobj (	/* 1:Function succeeded, 0:Could not create the sync object */
//   54 	BYTE vol,			/* Corresponding volume (logical drive number) */
//   55 	FF_SYNC_t *sobj		/* Pointer to return the created sync object */
//   56 )
//   57 {
//   58 	/* Win32 */
//   59 	*sobj = CreateMutex(NULL, FALSE, NULL);
//   60 	return (int)(*sobj != INVALID_HANDLE_VALUE);
//   61 
//   62 	/* uITRON */
//   63 //	T_CSEM csem = {TA_TPRI,1,1};
//   64 //	*sobj = acre_sem(&csem);
//   65 //	return (int)(*sobj > 0);
//   66 
//   67 	/* uC/OS-II */
//   68 //	OS_ERR err;
//   69 //	*sobj = OSMutexCreate(0, &err);
//   70 //	return (int)(err == OS_NO_ERR);
//   71 
//   72 	/* FreeRTOS */
//   73 	*sobj = xSemaphoreCreateMutex();
//   74 	return (int)(*sobj != NULL);
//   75 
//   76 	/* CMSIS-RTOS */
//   77 //	*sobj = osMutexCreate(Mutex + vol);
//   78 //	return (int)(*sobj != NULL);
//   79 }
//   80 
//   81 
//   82 /*------------------------------------------------------------------------*/
//   83 /* Delete a Synchronization Object                                        */
//   84 /*------------------------------------------------------------------------*/
//   85 /* This function is called in f_mount() function to delete a synchronization
//   86 /  object that created with ff_cre_syncobj() function. When a 0 is returned,
//   87 /  the f_mount() function fails with FR_INT_ERR.
//   88 */
//   89 
//   90 int ff_del_syncobj (	/* 1:Function succeeded, 0:Could not delete due to an error */
//   91 	FF_SYNC_t sobj		/* Sync object tied to the logical drive to be deleted */
//   92 )
//   93 {
//   94 	/* Win32 */
//   95 	return (int)CloseHandle(sobj);
//   96 
//   97 	/* uITRON */
//   98 //	return (int)(del_sem(sobj) == E_OK);
//   99 
//  100 	/* uC/OS-II */
//  101 //	OS_ERR err;
//  102 //	OSMutexDel(sobj, OS_DEL_ALWAYS, &err);
//  103 //	return (int)(err == OS_NO_ERR);
//  104 
//  105 	/* FreeRTOS */
//  106         vSemaphoreDelete(sobj);
//  107 	return 1;
//  108 
//  109 	/* CMSIS-RTOS */
//  110 //	return (int)(osMutexDelete(sobj) == osOK);
//  111 }
//  112 
//  113 
//  114 /*------------------------------------------------------------------------*/
//  115 /* Request Grant to Access the Volume                                     */
//  116 /*------------------------------------------------------------------------*/
//  117 /* This function is called on entering file functions to lock the volume.
//  118 /  When a 0 is returned, the file function fails with FR_TIMEOUT.
//  119 */
//  120 
//  121 int ff_req_grant (	/* 1:Got a grant to access the volume, 0:Could not get a grant */
//  122 	FF_SYNC_t sobj	/* Sync object to wait */
//  123 )
//  124 {
//  125 	/* Win32 */
//  126 	//return (int)(WaitForSingleObject(sobj, FF_FS_TIMEOUT) == WAIT_OBJECT_0);
//  127 
//  128 	/* uITRON */
//  129 //	return (int)(wai_sem(sobj) == E_OK);
//  130 
//  131 	/* uC/OS-II */
//  132 //	OS_ERR err;
//  133 //	OSMutexPend(sobj, FF_FS_TIMEOUT, &err));
//  134 //	return (int)(err == OS_NO_ERR);
//  135 
//  136 	/* FreeRTOS */
//  137 	return (int)(xSemaphoreTake(sobj, FF_FS_TIMEOUT) == pdTRUE);
//  138 
//  139 	/* CMSIS-RTOS */
//  140 //	return (int)(osMutexWait(sobj, FF_FS_TIMEOUT) == osOK);
//  141 }
//  142 
//  143 
//  144 /*------------------------------------------------------------------------*/
//  145 /* Release Grant to Access the Volume                                     */
//  146 /*------------------------------------------------------------------------*/
//  147 /* This function is called on leaving file functions to unlock the volume.
//  148 */
//  149 
//  150 void ff_rel_grant (
//  151 	FF_SYNC_t sobj	/* Sync object to be signaled */
//  152 )
//  153 {
//  154 	/* Win32 */
//  155 //	ReleaseMutex(sobj);
//  156 
//  157 	/* uITRON */
//  158 //	sig_sem(sobj);
//  159 
//  160 	/* uC/OS-II */
//  161 //	OSMutexPost(sobj);
//  162 
//  163 	/* FreeRTOS */
//  164 	xSemaphoreGive(sobj);
//  165 
//  166 	/* CMSIS-RTOS */
//  167 //	osMutexRelease(sobj);
//  168 }
//  169 
//  170 #endif
//  171 
// 
//
// 
//
//
//Errors: none
//Warnings: 1
