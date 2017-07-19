///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     19/Jul/2017  15:04:01 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Kernel\list.c                           /
//    Command line =  C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPi /
//                    pocaG2\SOFTWARE\Kernel\list.c -lC                       /
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
//                    pocaG2\SOFTWARE\Debug\List\list.s                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME list

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_full_locale_support", "0"
        AAPCS BASE,INTERWORK
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC vListInitialise
        PUBLIC vListInitialiseItem
        PUBLIC vListInsert
        PUBLIC vListInsertEnd
        PUBLIC vListRemove
        
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
        
// C:\Users\Marcos\Dropbox\Reps\Dextro\IBA\Hardware\MaisPipocaG2\SOFTWARE\Kernel\list.c
//    1 /*__________________________________________________________________________________
//    2 |	Quark Tecnologia Eletrônica Embarcada
//    3 |       
//    4 |       Itapema - SC
//    5 |       www.quarktee.com.br
//    6 | __________________________________________________________________________________
//    7 |
//    8 |       This source code was developed by Quark  and cannot be copied, in part 
//    9 |       or in whole, or used, except when legally licensed by Quark 
//   10 |       or its distributors.
//   11 |
//   12 |       Este código é propriedade da Quark  e não pode ser copiado, em parte 
//   13 |       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
//   14 |       Quark  ou por um de seus distribuidores.
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
//   28 /********************************************************************************
//   29 *   Includes
//   30 ********************************************************************************/
//   31 #include <stdlib.h>
//   32 #include "FreeRTOS.h"
//   33 #include "list.h"
//   34 /********************************************************************************
//   35 *   Implementação
//   36 ********************************************************************************/
//   37 
//   38 /********************************************************************************
//   39 *   Descrição       :   
//   40 *   Parametros      :   
//   41 *   Retorno         : 
//   42 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function vListInitialise
          CFI NoCalls
        THUMB
//   43 void vListInitialise( xList *pxList ){
//   44 
//   45     pxList->pxIndex = ( xListItem * ) &( pxList->xListEnd );
vListInitialise:
        ADDS     R1,R0,#+8
        STR      R1,[R0, #+4]
//   46     pxList->xListEnd.xItemValue = portMAX_DELAY;
        MOVS     R1,#-1
        STR      R1,[R0, #+8]
//   47     pxList->xListEnd.pxNext = ( xListItem * ) &( pxList->xListEnd );
        ADDS     R1,R0,#+8
        STR      R1,[R0, #+12]
//   48     pxList->xListEnd.pxPrevious = ( xListItem * ) &( pxList->xListEnd );
        ADDS     R1,R0,#+8
        STR      R1,[R0, #+16]
//   49     pxList->uxNumberOfItems = 0;
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   50 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   51 /********************************************************************************
//   52 *   Descrição       :   
//   53 *   Parametros      :   
//   54 *   Retorno         :
//   55 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function vListInitialiseItem
          CFI NoCalls
        THUMB
//   56 void vListInitialiseItem( xListItem *pxItem ){
//   57 
//   58   pxItem->pvContainer = NULL;
vListInitialiseItem:
        MOVS     R1,#+0
        STR      R1,[R0, #+16]
//   59 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   60 /********************************************************************************
//   61 *   Descrição       : 
//   62 *   Parametros      : 
//   63 *   Retorno         : 
//   64 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function vListInsertEnd
          CFI NoCalls
        THUMB
//   65 void vListInsertEnd( xList *pxList, xListItem *pxNewListItem ){
//   66   volatile xListItem * pxIndex;
//   67 	
//   68     pxIndex = pxList->pxIndex;
vListInsertEnd:
        LDR      R2,[R0, #+4]
//   69     pxNewListItem->pxNext = pxIndex->pxNext;
        LDR      R3,[R2, #+4]
        STR      R3,[R1, #+4]
//   70     pxNewListItem->pxPrevious = pxList->pxIndex;
        LDR      R3,[R0, #+4]
        STR      R3,[R1, #+8]
//   71     pxIndex->pxNext->pxPrevious = ( volatile xListItem * ) pxNewListItem;
        LDR      R3,[R2, #+4]
        STR      R1,[R3, #+8]
//   72     pxIndex->pxNext = ( volatile xListItem * ) pxNewListItem;
        STR      R1,[R2, #+4]
//   73     pxList->pxIndex = ( volatile xListItem * ) pxNewListItem;
        STR      R1,[R0, #+4]
//   74     pxNewListItem->pvContainer = ( void * ) pxList;
        STR      R0,[R1, #+16]
//   75     ( pxList->uxNumberOfItems )++;
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+1
        STR      R1,[R0, #+0]
//   76 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//   77 /********************************************************************************
//   78 *   Descrição       : 
//   79 *   Parametros      : 
//   80 *   Retorno         : 
//   81 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function vListInsert
          CFI NoCalls
        THUMB
//   82 void vListInsert( xList *pxList, xListItem *pxNewListItem ){
vListInsert:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//   83   volatile xListItem *pxIterator;
//   84   portTickType xValueOfInsertion;
//   85 
//   86   xValueOfInsertion = pxNewListItem->xItemValue;
        LDR      R3,[R1, #+0]
//   87 
//   88   if( xValueOfInsertion == portMAX_DELAY )
        CMN      R3,#+1
        BNE.N    ??vListInsert_0
//   89   {
//   90       pxIterator = pxList->xListEnd.pxPrevious;
        LDR      R2,[R0, #+16]
        B.N      ??vListInsert_1
//   91   }
//   92   else
//   93   {		
//   94       for( pxIterator = ( xListItem * ) &( pxList->xListEnd ); pxIterator->pxNext->xItemValue <= xValueOfInsertion; pxIterator = pxIterator->pxNext )
??vListInsert_0:
        ADDS     R2,R0,#+8
        B.N      ??vListInsert_2
??vListInsert_3:
        LDR      R2,[R2, #+4]
??vListInsert_2:
        LDR      R4,[R2, #+4]
        LDR      R4,[R4, #+0]
        CMP      R3,R4
        BCS.N    ??vListInsert_3
//   95       {
//   96 
//   97       }
//   98    }
//   99 
//  100    pxNewListItem->pxNext = pxIterator->pxNext;
??vListInsert_1:
        LDR      R3,[R2, #+4]
        STR      R3,[R1, #+4]
//  101    pxNewListItem->pxNext->pxPrevious = ( volatile xListItem * ) pxNewListItem;
        LDR      R3,[R1, #+4]
        STR      R1,[R3, #+8]
//  102    pxNewListItem->pxPrevious = pxIterator;
        STR      R2,[R1, #+8]
//  103    pxIterator->pxNext = ( volatile xListItem * ) pxNewListItem;
        STR      R1,[R2, #+4]
//  104 
//  105    pxNewListItem->pvContainer = ( void * ) pxList;
        STR      R0,[R1, #+16]
//  106    ( pxList->uxNumberOfItems )++;
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+1
        STR      R1,[R0, #+0]
//  107 }
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  108 /********************************************************************************
//  109 *   Descrição     :   
//  110 *   Parametros    : 
//  111 *   Retorno       : 
//  112 ********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function vListRemove
          CFI NoCalls
        THUMB
//  113 void vListRemove( xListItem *pxItemToRemove ){
//  114   xList * pxList;
//  115 
//  116   pxItemToRemove->pxNext->pxPrevious = pxItemToRemove->pxPrevious;
vListRemove:
        LDR      R1,[R0, #+4]
        LDR      R2,[R0, #+8]
        STR      R2,[R1, #+8]
//  117   pxItemToRemove->pxPrevious->pxNext = pxItemToRemove->pxNext;
        LDR      R1,[R0, #+8]
        LDR      R2,[R0, #+4]
        STR      R2,[R1, #+4]
//  118 	
//  119   pxList = ( xList * ) pxItemToRemove->pvContainer;
        LDR      R1,[R0, #+16]
//  120 
//  121   if( pxList->pxIndex == pxItemToRemove )
        LDR      R2,[R1, #+4]
        CMP      R2,R0
        BNE.N    ??vListRemove_0
//  122   {
//  123       pxList->pxIndex = pxItemToRemove->pxPrevious;
        LDR      R2,[R0, #+8]
        STR      R2,[R1, #+4]
//  124   }
//  125 
//  126   pxItemToRemove->pvContainer = NULL;
??vListRemove_0:
        MOVS     R2,#+0
        STR      R2,[R0, #+16]
//  127   ( pxList->uxNumberOfItems )--;
        LDR      R0,[R1, #+0]
        SUBS     R0,R0,#+1
        STR      R0,[R1, #+0]
//  128 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock4

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  129 /********************************************************************************
//  130 *   Fim do arquivo
//  131 ********************************************************************************/
//  132 
// 
// 154 bytes in section .text
// 
// 154 bytes of CODE memory
//
//Errors: none
//Warnings: none
