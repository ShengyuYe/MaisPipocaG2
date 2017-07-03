/*__________________________________________________________________________________
|	DEXTRO SOLU��ES TECNOL�GICAS
|       
|       ITAJA� - SC
|       www.dextro.ind.br
| __________________________________________________________________________________
|
|       This source code was developed by DEXTRO  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by DEXTRO 
|       or its distributors.
|
|       Este c�digo � propriedade da DEXTRO  e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       DEXTRO  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  POST.c
|       Descri��o          :  Fun��es que executam o autoteste da m�quina
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  25/04/2017
|
|       Revis�es           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _POST_H_
#define _POST_H_

typedef enum{
  POST_SUCESSO=0,
  POST_FALHA_VENTILADOR,
  POST_FALHA_RESISTENCIA,
  POST_FALHA_MDB_BILL,
  POST_FALHA_MDB_COIN,
  POST_FALHA_MDB_CASHLESS,
  POST_FALHA_CCTALK,
  POST_FALHA_PAPEL
}ePOST_RESULT;

typedef enum{
  POST_CICLICO_SUCESSO,
  POST_CICLICO_FALHA_EMBALAGEM,
  POST_CICLICO_FALHA_TERMISTOR
}ePOST_CICLICO_RESULT;


ePOST_RESULT POST_entry(void);
ePOST_CICLICO_RESULT POST_verificacao_ciclica(void);

#endif//_POST_H_