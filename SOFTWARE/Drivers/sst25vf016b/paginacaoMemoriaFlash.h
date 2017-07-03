/*__________________________________________________________________________________
|	Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Balne�rio Cambori� - SC
|       www.chavedigital.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Chave Digital and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Chave Digital
|       or its distributors.
|
|       Este c�digo � propriedade da Chave Digital e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Chave Digital ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  paginacaoMemoriaFlash.h
|       Descri��o          :  Atribui��o dos endere�os na mem�ria
|                             
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  03/09/2014
|
|       Revis�es           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _PAGINACAO_MEMORIA_FLASH_H_
#define _PAGINACAO_MEMORIA_FLASH_H_


#define INICIO_AREA_CS_01        0x000000
#define FIM_AREA_CS_01           0x01FFFF
#define TAMANHO_AREA_CS_01       128*1024

#define INICIO_AREA_CS_02        0x020000
#define FIM_AREA_CS_02           0x03FFFF
#define TAMANHO_AREA_CS_02       128*1024

#define INICIO_AREA_CS_03        0x040000
#define FIM_AREA_CS_03           0x23FFFF
#define TAMANHO_AREA_CS_03       2*1024*1024

#define AREA_TESTE_CS01         0x01FFF0
#define AREA_TESTE_CS02         0x03FFF0
#define AREA_TESTE_CS03         0x23FFF0










#endif// _PAGINACAO_MEMORIA_FLASH_H_