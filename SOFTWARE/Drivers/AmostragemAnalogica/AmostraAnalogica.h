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
|       Arquivo            :  es.h
|       Descrição          :  Bibiliteca para acesso aos E/S externos da placa
|                             frontal da CPU LPC1768 2011
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  29/05/2014
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _ES_H_
#define _ES_H_

void AA_ini(void);
void ES_tickTimer(void);
float AA_calculaResistor(void);
unsigned short int AA_calculaTemperatura(void);
unsigned short int AA_calculaTemperaturaInteira(void);
unsigned char AA_verificaConexaoTermistor(void);
unsigned short int AA_mediaMovelPapel(void);
void AA_amostragemAnalogica(void);
unsigned short int AA_calculaResistorInteiro(void);

#endif// _ES_H_