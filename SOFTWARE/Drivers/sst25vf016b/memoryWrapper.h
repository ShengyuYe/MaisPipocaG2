 /*__________________________________________________________________________________
|	Chave Digital  
|       Rua Bahia 3942 - Salto Weissbach
|       Balneario Cambori� - SC
|       www.engesul.com  - ped@engesul.com
| __________________________________________________________________________________
|
|       This source code was developed by Engesul and cannot be copied, in part or
|       in whole, or used, except when legally licensed by Engesul or its distributors.
|
|       Este c�digo � propriedade da Engesul e n�o pode ser copiado, em parte ou
|       em todo, ou utilizado, exceto quando for legalmente licenciado pela Engesul 
|       ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Product	    :       
|       Module	    :   Adapter para mem�ria AT45011 ficar linear
|       File	    :   memoryWrapper.c
|       Description :   Cria uma abstra��o para utilziar a AT45DB011 como mem�ria linear
|	Author      :   Marcos Aquino
|
|       Created on  :   12/06/2009
|
|       History     :
|
|
| __________________________________________________________________________________
*/
#ifndef MEMORY_WRAPPER_H
#define	MEMORY_WRAPPER_H

//  Inicializa��o do m�dulo
void MEMORYWRAPPER_init(void);

//  Escreve um buffer de bytes na mem�ria flash
unsigned char MEMORYWRAPPER_writeBytes(unsigned long int enderecoInicial,unsigned char *buffer,
                                       unsigned int size);

//  L� um buffer de dados da mem�ria flash
unsigned char MEMORYWRAPPER_readBytes(unsigned long int enderecoInicial,unsigned char *buffer,
                                      unsigned int size);

unsigned char MEMORYWRAPPER_readSingle(unsigned long int enderecoInicial);

void MEMORYWRAPPER_wait(void);

void MEMORYWRAPPER_release(void);


/***********************************************************************************
*	End of file
***********************************************************************************/
#endif //MEMORY_WRAPPER_H