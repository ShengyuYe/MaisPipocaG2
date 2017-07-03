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
|       Arquivo            :  uart.h
|       Data criação       :  26/07/2011
|       Revisões           :  1.0
|
| __________________________________________________________________________________
*/

#ifndef _UART_H_
#define	_UART_H_

#define UART_0        0
#define UART_1        1
#define UART_2        2 
#define UART_3        3

#define THRE                                            0x01
#define RDA                                             0x02
#define RLS                                             0x03
#define CTI                                             0x06

#define IER_RBR                                         0x01
#define IER_THRE                                        0x02
#define IER_RLS                                         0x04

#define IIR_PEND                                        0x01
#define IIR_RLS                                         0x03
#define IIR_RDA                                         0x02
#define IIR_CTI                                         0x06
#define IIR_THRE                                        0x01

#define LSR_RDR                                         0x01
#define LSR_OE                                          0x02
#define LSR_PE                                          0x04
#define LSR_FE                                          0x08
#define LSR_BI                                          0x10
#define LSR_THRE                                        0x20
#define LSR_TEMT                                        0x40
#define LSR_RXFE                                        0x80


void UART_init(unsigned char uart,unsigned long int baudrate,void(*funcRxd)(unsigned char data),
               unsigned char*(*funcTxd)(void),void(*enableFunc)(unsigned char state));

/***********************************************************************************
*		Fim do arquivo
***********************************************************************************/
#endif // _FILE_NAME_H