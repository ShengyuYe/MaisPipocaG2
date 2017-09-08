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
|       Arquivo            :  mdb_coin.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  27/02/2017
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _MDB_COIN_H_
#define _MDB_COIN_H_

#define COIN_DISPENSER_CHANNEL                          2
//------------------------------------------------------------------------------

typedef enum{
  COIN_RESET = 0x08,
  COIN_SETUP = 0x09,
  COIN_TUBE_STATUS = 0x0A,
  COIN_POLL = 0x0B,
  COIN_TYPE = 0x0C,
  COIN_DISPENSE = 0x0D,
  COIN_EXPANSION_COMMAND=0x0F  
}eMDB_COIN_COMMANDS;

typedef enum{
  COIN_ESCROW_REQUEST=1,
  COIN_CHANGER_PAYOUT_BUSY,
  COIN_NO_CREDIT,
  COIN_DEFECTIVE_TUBE_SENSOR,
  COIN_DOUBLE_ARRIAVAL,
  COIN_ACCEPTOR_UNPLUGGED,
  COIN_TUBE_JAM,
  COIN_ROM_CHECKSUM_ERROR,
  COIN_COIN_ROUTING_ERROR,
  COIN_CHANGER_BUSY,
  COIN_CHANGER_WAS_RESET,
  COIN_JAM,
  COIN_POSSIBLE_CREDIT_REMOVAL
}eMDB_COIN_POOL_STATUS;

typedef enum{
  COIN_CASH_BOX=0,
  COIN_TUBES,
  COIN_NOT_USED,
  COIN_REJECT
}eMDB_COIN_POOL_CODE;

typedef enum{
  COIN_DISPENSE_MANUALLY=0,
  COIN_DEPOSITED,
  COIN_STATUS,
  COIN_ACK
}eMDB_COIN_POOL_TYPE;

//------------------------------------------------------------------------------
eMDB_reply MDBCOIN_get_device(void);

eMDB_reply MDBCOIN_reset_device(void);

eMDB_reply MDBCOIN_get_setup_from_device(unsigned char *mdb_message_leve,
                                         unsigned short int *country,
                                         unsigned char *scale_factor,
                                         unsigned char *decimal_places,
                                         unsigned short int *coin_type_routing,
                                         unsigned char *coin_credit);

eMDB_reply MDBCOIN_get_tube_status_from_device(unsigned short int*tube_full_status,
                                               unsigned char *tubes_counter);

eMDB_reply MDBCOIN_coin_type_setup(unsigned short int channels,unsigned short int manual_dispense);

eMDB_reply MDBCOIN_coin_dispense(unsigned char quantidade,unsigned char coin_code);

eMDB_reply MDBCOIN_poll(eMDB_COIN_POOL_TYPE *tipo_evento,eMDB_COIN_POOL_STATUS *status,
                        unsigned char *tipo_moeda,unsigned char *quantidade_tubo);

#endif//_MDB_COIN_H_
/*************************************************************************************
*       Fim do arquivo
*************************************************************************************/