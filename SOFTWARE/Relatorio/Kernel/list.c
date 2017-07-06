/*__________________________________________________________________________________
|	Quark Tecnologia Eletrônica Embarcada
|       
|       Itapema - SC
|       www.quarktee.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Quark  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Quark 
|       or its distributors.
|
|       Este código é propriedade da Quark  e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Quark  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :
|       Descrição          :
| 
|       Autor              :
|       Data criação       :
|
|       Revisões           :
|
|
| __________________________________________________________________________________
*/
/********************************************************************************
*   Includes
********************************************************************************/
#include <stdlib.h>
#include "FreeRTOS.h"
#include "list.h"
/********************************************************************************
*   Implementação
********************************************************************************/

/********************************************************************************
*   Descrição       :   
*   Parametros      :   
*   Retorno         : 
********************************************************************************/
void vListInitialise( xList *pxList ){

    pxList->pxIndex = ( xListItem * ) &( pxList->xListEnd );
    pxList->xListEnd.xItemValue = portMAX_DELAY;
    pxList->xListEnd.pxNext = ( xListItem * ) &( pxList->xListEnd );
    pxList->xListEnd.pxPrevious = ( xListItem * ) &( pxList->xListEnd );
    pxList->uxNumberOfItems = 0;
}
/********************************************************************************
*   Descrição       :   
*   Parametros      :   
*   Retorno         :
********************************************************************************/
void vListInitialiseItem( xListItem *pxItem ){

  pxItem->pvContainer = NULL;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      : 
*   Retorno         : 
********************************************************************************/
void vListInsertEnd( xList *pxList, xListItem *pxNewListItem ){
  volatile xListItem * pxIndex;
	
    pxIndex = pxList->pxIndex;
    pxNewListItem->pxNext = pxIndex->pxNext;
    pxNewListItem->pxPrevious = pxList->pxIndex;
    pxIndex->pxNext->pxPrevious = ( volatile xListItem * ) pxNewListItem;
    pxIndex->pxNext = ( volatile xListItem * ) pxNewListItem;
    pxList->pxIndex = ( volatile xListItem * ) pxNewListItem;
    pxNewListItem->pvContainer = ( void * ) pxList;
    ( pxList->uxNumberOfItems )++;
}
/********************************************************************************
*   Descrição       : 
*   Parametros      : 
*   Retorno         : 
********************************************************************************/
void vListInsert( xList *pxList, xListItem *pxNewListItem ){
  volatile xListItem *pxIterator;
  portTickType xValueOfInsertion;

  xValueOfInsertion = pxNewListItem->xItemValue;

  if( xValueOfInsertion == portMAX_DELAY )
  {
      pxIterator = pxList->xListEnd.pxPrevious;
  }
  else
  {		
      for( pxIterator = ( xListItem * ) &( pxList->xListEnd ); pxIterator->pxNext->xItemValue <= xValueOfInsertion; pxIterator = pxIterator->pxNext )
      {

      }
   }

   pxNewListItem->pxNext = pxIterator->pxNext;
   pxNewListItem->pxNext->pxPrevious = ( volatile xListItem * ) pxNewListItem;
   pxNewListItem->pxPrevious = pxIterator;
   pxIterator->pxNext = ( volatile xListItem * ) pxNewListItem;

   pxNewListItem->pvContainer = ( void * ) pxList;
   ( pxList->uxNumberOfItems )++;
}
/********************************************************************************
*   Descrição     :   
*   Parametros    : 
*   Retorno       : 
********************************************************************************/
void vListRemove( xListItem *pxItemToRemove ){
  xList * pxList;

  pxItemToRemove->pxNext->pxPrevious = pxItemToRemove->pxPrevious;
  pxItemToRemove->pxPrevious->pxNext = pxItemToRemove->pxNext;
	
  pxList = ( xList * ) pxItemToRemove->pvContainer;

  if( pxList->pxIndex == pxItemToRemove )
  {
      pxList->pxIndex = pxItemToRemove->pxPrevious;
  }

  pxItemToRemove->pvContainer = NULL;
  ( pxList->uxNumberOfItems )--;
}
/********************************************************************************
*   Fim do arquivo
********************************************************************************/

