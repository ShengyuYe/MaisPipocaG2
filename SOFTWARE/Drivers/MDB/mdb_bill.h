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
|       Arquivo            :  mdb_bill.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  27/02/2017
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _MDB_BILL_H_
#define _MDB_BILL_H_


typedef enum{
  BILL_RESET=0x30,
  BILL_SETUP=0x31,
  BILL_SECURITY=0x32,
  BILL_POLL=0x33,
  BILL_TYPE=0x34,
  BILL_ESCROW=0x35,
  BILL_STACKER=0x36,
  BILL_EXPANSION_COMMAND=0x37  
}eMDB_BILL_COMMANDS;

typedef enum{
  // Eventos de validação de cédula
  BILL_STACKED=0x8,
  ESCROW_POSITION=0x09,
  BILL_RETURNED=0x0A,
  NOT_USED=0x0B,
  DISABLED_BILL_REJECTED=0x0C,
  // Report do status
  BILL_STATUS=0
}eBILL_ROUTING;

typedef enum{
  DEFECTIVE_MOTOR=1,
  SENSOR_PROBLEM,
  VALIDATOR_BUSY,
  ROM_CHECKSUM_ERROR,
  VALIDATOR_JAMMED,
  VALIDATOR_WAS_RESET,
  BILL_REMOVED,
  CASH_BOX_OUT_POSITION,
  UNIT_DISABLED,
  INVALID_ESCROW_REQUEST,
  BILL_REJECTED,
  POSSIBLE_CREDITED_BILL_REMOVAL,
  CANAL_01,
  CANAL_02,
  CANAL_03,
  CANAL_04,
  CANAL_05,
  CANAL_06,
  CANAL_07,
  CANAL_08,
  CANAL_09,
  CANAL_10,
  CANAL_11,
  CANAL_12,
  CANAL_13,
  CANAL_14,
  CANAL_15,
  CANAL_16,
  BILL_BLANK=0xFF
}eBILL_TYPE;

typedef enum{
  RETURN_BILL,
  STACK_BILL
}eMDB_ESCROW_COMMANDS;

typedef enum{
  EMPITY,
  FULL  
}eMDB_STACKER_STATE;

typedef struct{
  eBILL_ROUTING tipo;
  eBILL_TYPE args;  
}sBILL_event;

eMDB_reply MDBILL_verifica_dispositivo(void);

eMDB_reply MDBILL_reset_device(void);

eMDB_reply MDBILL_get_setup_from_device(unsigned char *level,
                                        unsigned short int *country,
                                        unsigned short int *scaling,
                                        unsigned char *decimal_places,
                                        unsigned short int *stacker_capacity,
                                        unsigned char *scroll_preset,
                                        unsigned short int *security_level,
                                        unsigned char *credit_types);

eMDB_reply MDBILL_get_poll_from_device(sBILL_event *activity,unsigned char *length);

eMDB_reply MDBILL_set_bill_type_on_device(unsigned short int bill_types,
                                          unsigned short int scrolls);

eMDB_reply MDBILL_send_escrow_command(eMDB_ESCROW_COMMANDS cmd);

eMDB_reply MDBILL_get_stacker_state(eMDB_STACKER_STATE *stacker_state);

eMDB_reply MDBILL_get_identification_of_device(char *manufacturer,
                                               char *serial_number,
                                               char *model,
                                               char *firmware_version);

eMDB_reply MDBILL_get_id_with_option_bits(char *manufacturer,
                                          char *serial_number,
                                          char* model,
                                          char* firmware_version,
                                          unsigned char *optional_features);

/************************************************************************************
*       Fim do arquivo
************************************************************************************/
#endif//_MDB_BILL_H_