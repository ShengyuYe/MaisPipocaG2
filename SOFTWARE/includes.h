/*__________________________________________________________________________________
|     	Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Balneário Camboriú - SC
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
|       Produto            :  Includes do projeto Apus MP
|                             
|       Arquivo            :  includes.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  22/05/2014
|
|       Revisões           :  1.0 - primeira versão
|
|
| __________________________________________________________________________________
*/

#ifndef _INCLUDES_H_
#define _INCLUDES_H_

// Cabeçalhos para o kernel
// do RTOS
#include "kernel\freertosconfig.h"
#include "kernel\freertos.h"
#include "kernel\list.h"
#include "kernel\task.h"
#include "kernel\semphr.h"
#include "kernel\queue.h"

#include "mapa_memoria.h"
#include "board\board.h"

#include "strings\strings.h"
#include "strings\mensagens.H"

#include "drivers\cctalk\cctalk.h"
#include "drivers\wh1602\wh1602.h"
#include "drivers\WH1602_2\wh1602_2.h"
#include "drivers\teclado\teclado.h"
#include "drivers\rtc\rtc.h"
#include "drivers\sst25vf016b\memoryWrapper.h"
#include "drivers\sst25vf016b\sst25vf016b.h"
#include "drivers\AmostragemAnalogica\AmostraAnalogica.h"
#include "drivers\uarts\uart.h"
#include "drivers\cctalk\cctalk.h"
#include "drivers\Pagamentos\Pagamentos.h"
#include "drivers\pagamentos\bv20.h"
#include "drivers\pagamentos\supervisao_mdb.h"
#include "drivers\mdb\mdb.h"
#include "drivers\mdb\mdb_bill.h"
#include "drivers\mdb\mdb_coin.h"
#include "drivers\mdb\mdb_cashless.h"
#include "drivers\mdb\mdb_uart.h"
#include "drivers\protocolo\protocolo.h"
#include "drivers\impressora\impressora.h"
#include "drivers\playerwave\playerwave.h"
#include "drivers\serial_mux\serial_mux.h"
#include "drivers\filesystem\ff.h"

#include "aplicacao\aplicacao.h"
#include "aplicacao\menu_configuracao.h"
#include "aplicacao\menu_operacao.h"
#include "aplicacao\menu_preparacao.h"
#include "aplicacao\preparacao.h"
#include "aplicacao\embalagem.h"
#include "aplicacao\post.h"
#include "parametros\parametros.h"
#include "aplicacao\faturamento.h"
#include "aplicacao\tela_senha.h"
#include "aplicacao\senhas.h"
#include "aplicacao\parametros_fabrica.h"

#include "potencia\potencia.h"
#include "potencia\controleTemperatura.h"

#include "iu\leds.h"

#include "historico_precos\fila_troca_preco.h"



/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/
#endif//_INCLUDES_H_