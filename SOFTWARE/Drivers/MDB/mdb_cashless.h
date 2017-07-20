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
|       Arquivo            :  mdb_cashless.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  27/02/2017
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

#ifndef _CASHLESS_DEVICE_H_
#define _CASHLESS_DEVICE_H_


typedef enum{
  CASHLESS_RESET   = 0x10,
  CASHLESS_SETUP   = 0x11,
  CASHLESS_POLL    = 0x12,
  CASHLESS_VEND    = 0x13,
  CASHLESS_READER  = 0x14,
  CASHLESS_REVALUE = 0x15,
  CASHLESS_EXPANSION = 0x17,
  CASHLESS_ENABLE    = 0x14  
}eMDB_CASHLESS_COMMANDS;


typedef enum{
  NUMERICO=0,
  ASCII,
  SEM_DISPLAY
}eMDB_DISPLAY_INFO;
    
typedef enum{
  CASHLESS_POOL_JUST_RESET=0,
  CASHLESS_POOL_READER_CONFIG_DATA=1,
  CASHLESS_POOL_DISPLAY_REQUEST=2,
  CASHLESS_POOL_BEGIN_SESSION=3,
  CASHLESS_POOL_SESSION_CANCEL_REQUEST=4,
  CASHLESS_POOL_VEND_APPROVED=5,
  CASHLESS_POOL_VEND_DENIED=6,
  CASHLESS_POOL_END_SESSION=7,
  CASHLESS_POOL_CANCELLED=8,
  CASHLESS_POOL_PERIPHERAL_ID=9,
  CASHLESS_POOL_MALFUNCTION=0xA,
  CASHLESS_POOL_CMD_OUT_OF_SEQUENCE=0x0B,
  CASHLESS_POOL_REVALUE_APPROVED=0x0D,
  CASHLESS_POOL_REVALUE_DENIED=0x0E,
  CASHLESS_POOL_REVALUE_LIMIT_AMOUNT=0x0F,
  CASHLESS_POOL_USER_FILE=0x10,
  CASHLESS_POOL_TIME_DATE_REQUEST=0x11,
  CASHLESS_DATA_ENTRY=0x12
}eMDB_POLL_HEADER;

typedef enum{
  VEND_APPROVED=0x05,
  VEND_DENIED=0x06
}eCASHLESS_VEND_RESULT;

#define REQUEST_VEND                            0x00
#define CANCEL_VEND                             0x01
#define SUCCESS_VEND                            0x02
#define FAILURE_VEND                            0x03
#define SESSION_COMPLETE                        0x04

eMDB_reply CASHLESS_adreess(void);

eMDB_reply CASHLESS_reset_device(void);

eMDB_reply CASHLESS_set_and_get_setup_from_to_device(unsigned char nivel_mdb,
                                                     unsigned char linhas_lcd,
                                                     unsigned char colunas_lcd,
                                                     eMDB_DISPLAY_INFO info_lcd,
                                                     unsigned char *nivel_configurado,
                                                     unsigned short int*pais,
                                                     unsigned char *escala,
                                                     unsigned char *casas_decimais,
                                                     unsigned char *tempo_maximo_transacao,
                                                     unsigned char *opcoes_gerais);

eMDB_reply CASHLESS_set_min_and_max_price_in_device(unsigned short int min,
                                                    unsigned short int max);

eMDB_reply CASHLESS_poll_device(eMDB_POLL_HEADER *heder,unsigned char *args);

eMDB_reply MDBCASHLESS_start_vend(eCASHLESS_VEND_RESULT *resultado,
                                  unsigned short int *pago,
                                  unsigned short int valor,unsigned short int code);

eMDB_reply MDBCASHLESS_vend_cancel(void);

eMDB_reply MDBCASHLESS_vend_success(unsigned short int item);

eMDB_reply MDBCASHLESS_enable_reader(unsigned char flag);

eMDB_reply MDBCASHLESS_session_complete(void);
/************************************************************************************
*       Fim do arquivo
************************************************************************************/
#endif//_CASHLESS_DEVICE_H_