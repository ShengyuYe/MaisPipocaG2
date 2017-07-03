/*__________________________________________________________________________________
|	DEXTRO SOLUÇÕES TECNOLÓGICAS
|       
|       ITAJAÍ - SC
|       www.dextro.ind.br
| __________________________________________________________________________________
|
|       This source code was developed by DEXTRO  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by DEXTRO 
|       or its distributors.
|
|       Este código é propriedade da DEXTRO  e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       DEXTRO  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  Potencia.h
|       Descrição          :  Biblioteca para o controle PID do 
|                             motor universal
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  21/02/2017
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/


#ifndef _POTENCIA_H_
#define _POTENCIA_H_


void POTENCIA_ini(void);
void POTENCIA_set_neutro(unsigned char flag);
void POTENCIA_eintInterrupt(void);
void POTENCIA_timerTick(void);
unsigned short int POTENCIA_getFrequenciaRede(void);
void POTENCIA_captureInterrupt(void);
void POTENCIA_controleVelocidade(void);
void POTENCIA_mathTimer2(void);
int POTENCIA_calcula_integral_erro(int erro,unsigned flush);
int POTENCIA_calcula_derivada_erro(int erro);
void POTENCIA_setRPM(unsigned int rpm);
unsigned int POTENCIA_calculaAtrasoGate(int rotacao_rpm);
unsigned int POTENCIA_getRPMmedido(void);
void POTENCIA_set_neutro(unsigned char estado);

/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
#endif//_POTENCIA_H_