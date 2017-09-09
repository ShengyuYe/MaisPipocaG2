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
|       Arquivo            :  mdb.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  25/02/2017
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _MDB_H_
#define _MDB_H_

typedef enum{
  MDB_OK,
  MDB_ERROR,
  MDB_TIMEOUT,
  MDB_JUST_RESET
}eMDB_reply;

/* MDB protocol bytes */
typedef enum{
 MDB_RESP_ACK  =  0x00,    /* acknowledgemnt/ chksum correct */
 MDB_RESP_RET  =  0xaa,    /* retransmit the last sent data */
 MDB_RESP_NAK  =  0xff    /* use silent 5ms instead */
}eMDB_BYTES;

typedef enum{
  MDB_TODOS_ONLINE=0,
  MDB_BILL_OFFLINE,
  MDB_COIN_OFFLINE,
}eMDB_RESULTADO_SCAN;

typedef enum{
  MDB_VMC=0,
  MDB_CHANGER=0x08,
  MDB_CASHLESS_DEVICE=0x10,
  MDB_COMMUNICATIONS_GATEWAY=0x18,
  MDB_DISPLAY=0x20,
  MDB_ENERGY_MANAGEMET_SYSTEM=0x28,
  MDB_BILL_VALIDATOR=0x30,
  MDB_RESERVED=0x38,
  MDB_UNIVERSAL_SATELLITE_DEVICE_01=0x40,
  MDB_UNIVERSAL_SATELLITE_DEVICE_02=0x48,
  MDB_UNIVERSAL_SATELLITE_DEVICE_03=0x50,
  MDB_COIN_HOPPER=0x58,
  MDB_CASHLESS_DEVICE_02=0x68,
  MDB_EXPERIMENTAL_PERIPHERAL_01=0xE0,
  MDB_EXPERIMENTAL_PERIPHERAL_02=0xE8,
  MDB_MACHINE_SPECIFIC_PERIPHERAL_01=0xF0,
  MDB_MACHINE_SPECIFIC_PERIPHERAL_02=0xF8
}eMDB_ADDRESSES;

typedef enum{
  Z1=0,
  Z2,
  Z3,
  Z4,
  Z5,
  Z6,
  Z7,
  Z8,
  Z9,
  Z10,
  Z11,
  Z12,
  Z13,
  Z14,
  Z15,
  Z16,
  Z17,
  Z18,
  Z19,
  Z20,
  Z21,
  Z22,
  Z23,
  Z24,
  Z25,
  Z26,
  Z27,
  Z28,
  Z29,
  Z30,
  Z31,
  Z32,
  Z33,
  Z34,
  Z35
}eDEVICE_REGISTERS;

  

void MDB_ini(void);

void MDB_main(void*pPAR);

unsigned char MDB_chk_generate(unsigned char *pData,unsigned char size);

eMDB_reply MDB_send_package(unsigned char first_is_address,
                            unsigned char *pData,unsigned char data_length,
                            unsigned char send_ack,
                            unsigned char *pRx,unsigned char *rx_length);

eMDB_reply MDB_send_package_long(unsigned char first_is_address,
                                 unsigned char *pData,unsigned char data_length,
                                 unsigned char send_ack,
                                 unsigned char *pRx,unsigned char *rx_length);

void MDB_send_ack(void);

unsigned char MDB_coin_dispenser(unsigned char tipo,unsigned char quantidade);

unsigned char MDB_coin_check_tubes(unsigned char* tubes);

eMDB_RESULTADO_SCAN MDB_checa_dispositivos(void);

eMDB_reply MDB_checa_valor_moedas(unsigned char *escala,unsigned char *canais);

unsigned char MDB_checa_troco(unsigned int *troco);
/************************************************************************************
*       Fim do arquivo
************************************************************************************/
#endif//_MDB_H_