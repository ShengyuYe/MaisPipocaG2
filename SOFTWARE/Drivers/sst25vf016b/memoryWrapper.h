 /*__________________________________________________________________________________
|	Chave Digital  
|       Rua Bahia 3942 - Salto Weissbach
|       Balneario Camboriú - SC
|       www.engesul.com  - ped@engesul.com
| __________________________________________________________________________________
|
|       This source code was developed by Engesul and cannot be copied, in part or
|       in whole, or used, except when legally licensed by Engesul or its distributors.
|
|       Este código é propriedade da Engesul e não pode ser copiado, em parte ou
|       em todo, ou utilizado, exceto quando for legalmente licenciado pela Engesul 
|       ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Product	    :       
|       Module	    :   Adapter para memória AT45011 ficar linear
|       File	    :   memoryWrapper.c
|       Description :   Cria uma abstração para utilziar a AT45DB011 como memória linear
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

//  Inicialização do módulo
void MEMORYWRAPPER_init(void);

//  Escreve um buffer de bytes na memória flash
unsigned char MEMORYWRAPPER_writeBytes(unsigned long int enderecoInicial,unsigned char *buffer,
                                       unsigned int size);

//  Lê um buffer de dados da memória flash
unsigned char MEMORYWRAPPER_readBytes(unsigned long int enderecoInicial,unsigned char *buffer,
                                      unsigned int size);

unsigned char MEMORYWRAPPER_readSingle(unsigned long int enderecoInicial);

void MEMORYWRAPPER_wait(void);

void MEMORYWRAPPER_release(void);


/***********************************************************************************
*	End of file
***********************************************************************************/
#endif //MEMORY_WRAPPER_H