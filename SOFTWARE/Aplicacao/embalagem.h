/*__________________________________________________________________________________
|	Quark Tecnologia Eletr�nica Embarcada
|       
|       Itapema - SC
|       www.quarktee.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Quark  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Quark 
|       or its distributors.
|
|       Este c�digo � propriedade da Quark  e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Quark  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  embalagem.h
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  22/04/2017
|
|       Revis�es           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _EMBALAGEM_H_
#define _EMBALAGEM_H_

typedef enum{
  EMBALAGEM_LIBERADA,
  EMBALAGEM_SEM_ESTOQUE,
  EMBALAGEM_FALHA_LIBERACAO
}eEMBALAGEM_RESULT;

typedef enum{
  EMBALAGEM_SEM_PACOTES=0,
  EMBALAGEM_DETECTADA
}eEMBALAGEM_ESTOQUE_RESULT;


eEMBALAGEM_RESULT EMBALAGEM_libera_pacote(unsigned int tempo);
eEMBALAGEM_ESTOQUE_RESULT EMBALAGEM_verifica_estoque(void);


/************************************************************************************
*       Fim do arquivo
************************************************************************************/
#endif//_EMBALAGEM_H_