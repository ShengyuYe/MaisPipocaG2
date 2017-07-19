/*__________________________________________________________________________________
|	Quark Tecnologia Eletrônica Embarcada
|       
|       Itapema - SC
|       www.quarktee.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Quark  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Quark 
|       or its distributors.
|
|       Este código é propriedade da Quark  e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Quark  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  board.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _BOARD_H_
#define _BOARD_H_

typedef enum{
  SENSOR_BARREIRA_EMBALAGEM=0,
  SENSOR_RESERVA_PAPEL,
  SENSOR_DOSE_MILHO
}eSINAL;

typedef enum{
  PARADO,
  DOSAR,
  REVERTER
}eMOTOR_DOSE;

typedef enum{
  APAGADO=0,
  ACESO,
  PISCANDO
}eLED_STATE;

#define LED_INSIRA_DINHEIRO             2//3
#define LED_PEGUE_PACOTE                3// 4
#define LED_MONTE_PACOTE                4//5
#define LED_INSIRA_PACOTE               5//6
#define LED_FORA_SERVICO                6//7
#define LED_VERMELHO_GRELHA             1
#define LED_VERDE_GRELHA                0

// 
// Macro para ler a barreira óptica da saída do papel
//
#define GET_BARREIRA_SAIDA_PAPEL()                      BOARD_get_sinal(SENSOR_BARREIRA_EMBALAGEM)                 
#define BARREIRA_PAPEL_LIVRE                            0
#define BARREIRA_PAPEL_CORTADA                          1

#define GET_SENSOR_RESERVA_PAPEL()                      BOARD_get_sinal(SENSOR_RESERVA_PAPEL)
#define GET_SENSOR_DOSE()                               BOARD_get_sinal(SENSOR_DOSE_MILHO)

void BOARD_ini(void);
void BOARD_timer_tick(void);
void BOARD_main(void*pPar);
unsigned char BOARD_get_sinal(eSINAL sinal);
void BOARD_set_motor_embalagem(unsigned char flag);
void BOARD_set_motor_dose(eMOTOR_DOSE sentido);
void BOARD_setter_general_purpose_counter(unsigned int preset);
unsigned int BOARD_getter_general_purpose_counter(void);
void BOARD_setter_led_instrucao(unsigned char led,eLED_STATE estado);
void BOARD_liga_placa_instrucao(unsigned char flag);
void BOARD_setter_contador_propaganda(unsigned int contagem);
void BOARD_reset_tempo_propaganda(void);
void BOARD_overshoot_tempo_propaganda(void);

/************************************************************************************
*       Fim do arquivo
************************************************************************************/
#endif//_BOARD_H_