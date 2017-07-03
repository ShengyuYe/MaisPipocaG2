/*__________________________________________________________________________________
|	Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Balen�rio Cambori� - SC
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
|       Arquivo            :  PlayerWave.h
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  22/02/2014
|
|       Revis�es           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _PLAYER_WAVE_H_
#define _PLAYER_WAVE_H_


#define MUSICA_PREPARO                  1
#define AUDIO_PEGA_PACOTE               0
#define AUDIO_PIPOCAS_PRONTAS           2
#define AUDIO_PROPAGANDA                3        

void PLAYERWAVE_ini(void);
void PLAYERWAVE_iniciaMusica(unsigned char indice,unsigned char modo);
void PLAYER_interrompeMusica(void);
unsigned char PLAYERWAVE_verificaToque(void);


/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
#endif//_PLAYER_WAVE_H_