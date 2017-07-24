/*__________________________________________________________________________________
|	Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Balenário Camboriú - SC
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
|       Arquivo            :  mapa_memoria.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  23/02/2014
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _MAPA_MEMORIA_H_
#define _MAPA_MEMORIA_H_


//#define AREA_TESTE                      0
//#define FIM_AREA_TESTE                  0xFFF

#define AREA_TABELA                       0x0640
#define AREA_ARQUIVOS                     0x2000                
#define FIM_AREA_ARQUIVOS                 0x0001FFFFF        

//#define AREA_PARAMETROS                 0x1000
//#define FIM_AREA_PARAMETROS             0x2FFF

//#define AREA_AUDIO                      0x3000
//#define FIM_AREA_AUDIO                  0x0001FFFFF


/////////////////////////////////////////////////////////////////////////////////
// Área dos parametros                                                         //
/////////////////////////////////////////////////////////////////////////////////

#define ADR_INDICE_MUSICA               0x1000
#define ADR_INDICE_PROPAGANDA           0x1009
#define ADR_INCICE_PEGUE_O_PACOTE       0x1013
#define ADR_INDICE_PEGUE_AS_PIPOCAS     0x101B

#endif//_MAPA_MEMORIA_H_