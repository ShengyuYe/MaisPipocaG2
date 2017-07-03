/*__________________________________________________________________________________
|	Marcos Aquino Projetos Exclusivos
|       
|       Balneário Camboriú - SC
|       www.aquino.eng.br
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
|       Arquivo            :  cctalk.h
|       Descrição          :  Biblioteca do protocolo cctalk mestre
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  17/02/2015
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/
#ifndef _CCTALK_H_
#define _CCTALK_H_


typedef enum{
  RESET_DEVICE=1,
  REQUEST_COMMS_REVISION=4,
  STORE_ENCRYPTION_CODE=136,
  SWITCH_ENCRYPTION_CODE=137,
  REQUEST_CURRENCY_REVISION=145,
  OPERATE_BI_MOTORS=146,
  STACKER_CYCLE=147,
  REQUEST_BILL_OPERATING_MODE=152,
  MODIFY_BILL_OPERATING_MODE=153,
  ROUTE_BILL=154,
  REQUEST_BILL_POSITION=155,
  REQUEST_COUNTRY_SCALING=156,
  REQUEST_BILL_ID=157,
  READ_BUFFERED_BILL_EV=159,
  REQUEST_ADDRESS_MODE=169,
  REQUEST_BASE_YEAR=170,
  REQUEST_BUILD_CODE=192,
  CALCULATE_ROM_CHECKSUM=197,
  REQUEST_OPTION_FLAGS=213,
  REQUEST_DATA_STORAGE_AVAIL=216,
  REQUEST_ACCEPT_COUNT=225,
  REQUEST_INS_COUNT=226,
  REQ_MASTER_INHIBIT=227,
  SET_MASTER_INHIBIT=228,
  REQ_INHIBITS=230,
  SET_INHIBITS=231,
  PERFORM_SELF_CHECK=232,
  READ_OPTO_STATES=236,
  REQUEST_SOFTWARE_REVISION=241,
  SERIAL_NUMBER=242,
  REQUEST_PRODUCT_CODE=244,
  REQUEST_EQUIP_CAT_ID=245,
  REQUEST_MANF_ID=246,
  REQUEST_POLLING_PRIORITY=249,
  ADDRESS_RANDOM=250,
  ADDRESS_CHANGE=251,
  ADRESS_CLASH=252,
  ADDRESS_POLL=253,
  SIMPLE_POLL =254    
}CCTALK_FUNCTION;

typedef enum{
  BILL_VALIDATED_OK=0,
  BILL_VALIDATED_OK_AND_SCROW,
  MASTER_INHIBIT_ACTIVE,
  BILL_RETURNED_FROM_ESCROW,
  INVALID_BILL_VALIDATION,
  INVALID_BILL_TRANSPORTATION,
  INHIBIT_BILL_SERIAL,
  INHIBIT_BILL_DIPSWITCH,
  BILL_JAMMED_IN_TRANSPORT,
  BILL_JAMMED_IN_BACKWARDS,
  BILL_TAMPER,
  STACKER_OK,
  STACKER_INVERTED,
  STACKER_FAULTY,
  STACKER_FULL,
  STACKER_JAMMED,
  BILL_JAMMED_IN_TRANSPORT_SAFE,
  OPTO_FRAUD_DETECTED,
  STRING_FRAUD_DETECTED,
  ANTI_STRING_MECHANISM_FAULTY,
  BARCODE_DETECTED,
  UNKNOWN_BILL_TYPE_STACKED  
}CCTALK_BILL_EVENTS;

void CCTALK_ini(void);
unsigned short int CCTALK_calculaCRC(unsigned char *pData,unsigned short int offset,
                                     unsigned short int tamanho);
void CCTALK_tick(void);

unsigned char CCTALK_leFilaEventos(unsigned char endereco,unsigned char*qtdEventos,
                                   unsigned short int *eventos);

unsigned char CCTALK_rotacionaValidador(unsigned char endereco);

unsigned char CCTALK_setBitsHabilitacaoCanal(unsigned char endereco,
                                             unsigned short int mascara);

unsigned char CCTALK_setFlagHabilitacaoGeral(unsigned char endereco,
                                             unsigned char flagBloqueio);

char* CCTAK_msg_to_string(CCTALK_BILL_EVENTS msg);
#endif//_CCTALK_H_