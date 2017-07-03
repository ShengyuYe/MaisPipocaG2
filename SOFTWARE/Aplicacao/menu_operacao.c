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
|       Arquivo            :  menu_operacao.c
| 
|       Autor              :  Marcos Aquino
|       Data criação       :
|
|       Revisões           :  001
|
|
| __________________________________________________________________________________
*/

/***********************************************************************************
*       Includes
***********************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "..\includes.h"
#include "menu_operacao.h"
#include "menu_rolagem.h"
#include "menu_edita_listagem.h"
#include "menu_edita_inteiro.h"
#include "menu_edita_flag.h"

/***********************************************************************************
*       Definições - locais
***********************************************************************************/


/***********************************************************************************
*       Variaveis - locais
***********************************************************************************/


/***********************************************************************************
*       Funções - locais
***********************************************************************************/
void MENUOP_configura_valor(void);
void MENUOP_configura_notas(void);
void MENUOP_configura_tempo_embalagem(void);
void MENUOP_configura_volume_musica(void);
void MENUOP_configura_volume_locucoes(void);
void MENUOP_configura_intervalo_propaganda(void);
void MENUOP_configura_modo_free(void);
void MENUOP_configura_fita_led(void);
void MENUOP_configura_troco(void);
void MENUOP_configura_comissao(void);
void MENUOP_configura_flag_desumidificador(void);
unsigned char MENUOP_edita_mensagem(char *titulo,char* msg);
void MENUOP_configura_mensagem_cliente(void);
void MENUOP_configura_mensagem_cliente_02(void);
void MENUOP_configura_mensagem_cliente_03(void);
void MENUOP_configura_mensagem_cliente_04(void);

/***********************************************************************************
*       Tabela de funções
***********************************************************************************/
void(*MENUOP_funcs[])(void)={
  MENUOP_configura_valor,
  MENUOP_configura_notas,
  MENUOP_configura_modo_free,
  MENUOP_configura_fita_led,
  MENUOP_configura_volume_musica,
  MENUOP_configura_volume_locucoes,
  MENUOP_configura_intervalo_propaganda,
  MENUOP_configura_tempo_embalagem,
  MENUOP_configura_troco,
  MENUOP_configura_comissao,
  MENUOP_configura_mensagem_cliente,
  MENUOP_configura_mensagem_cliente_02,
  MENUOP_configura_mensagem_cliente_03,
  MENUOP_configura_mensagem_cliente_04,
  MENUOP_configura_flag_desumidificador,
  NULL  
};

/***********************************************************************************
*       Implementação das funções
***********************************************************************************/

/***********************************************************************************
*       Descrição       :       Ponto de entrada do menu de configuração
*                               do sistema
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_entry(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  
  MENUROLAGEM_show((char*)STRING_titulo_menu_operacao[idioma],
                   (char**)STRING_menu_configuracao_operacao[idioma],
                   QTD_OPCOES_OPERACAO,
                   MENUOP_funcs);    
}
/***********************************************************************************
*       Descrição       :       Menu para configuração do valor da pipoca
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_valor(void){
  unsigned char idioma = APLICACAO_carrega_idioma();  
  unsigned int valor;
  char buffer_linha[17];
  eTECLA tecla;
  unsigned char tamanho=0;
  unsigned char ultimo_tamanho=0;
  unsigned int valor_anterior;
  
  PARAMETROS_le(ADR_VALOR_PIPOCA,(void*)&valor);
  if(valor>99990)
    valor = 5;
  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_ajusta_valor[idioma],NULL);
  
  valor_anterior = valor;
  
  for(;TECLADO_getContadorInatividade();){
  
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           PARAMETROS_grava(ADR_VALOR_PIPOCA,(void*)&valor);        
           // Novo evento de troca
           // de preço
           if(valor_anterior!=valor)
             FTP_novo_preco(valor,valor_anterior);           
      case TECLA_ESC:
           return;
      case TECLA_INC:
           if(valor<99990)
             valor+=5;
           break;
      case TECLA_DEC:
           if(valor>5)
             valor-=5;
           break;
    }
    
    sprintf(buffer_linha,"%s %d,%02d",(char*)STRING_simbolo_moeda[idioma],valor/100,valor%100);
    tamanho = strlen(buffer_linha);
    if(tamanho!=ultimo_tamanho){
      STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_ajusta_valor[idioma],buffer_linha);    
      ultimo_tamanho = tamanho;
    }
    else
      STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);    
  }  
}
/***********************************************************************************
*       Descrição       :       Configura as cédulas que serão aceitas
*                               pelo meio de pagamento, quando serial ou CCTALK
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_notas(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned char flags[6]={0};
  unsigned char cedulas;
  
  PARAMETROS_le(ADR_NOTAS,(void*)&cedulas);
  for(unsigned char i=0;i<6;i++)
    if(cedulas&(0x01<<i))
      flags[i] = 255;  
  
  MEL_entry((char*)STRING_titulo_configuracao_notas[idioma],
            (char**)STRING_tabela_cedulas_canais[idioma],
            flags,
            6);
  
  cedulas = 0;
  for(unsigned char i=0;i<6;i++)
    if(flags[i])
      cedulas|= (0x01)<<i;
  
  PARAMETROS_grava(ADR_NOTAS,(void*)&cedulas);     
}
/***********************************************************************************
*       Descrição       :       Tela que faz o teste da liberação de uma embalagem
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_testa_liberacao_embalagem(unsigned int tempo){
  
  STRING_write_to_internal(CLEAR_DISPLAY,"Liberando","Embalagem");  
  EMBALAGEM_libera_pacote(tempo);    
}
/***********************************************************************************
*       Descrição       :       Faz o ajuste do intervalo de tempo em que
*                               o motor da embalagem fica ligado
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_tempo_embalagem(void){
  unsigned int tempo_embalagem;
  eTECLA tecla;
  char buffer_linha[17];
  
  PARAMETROS_le(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);
  if(tempo_embalagem>10000)
    tempo_embalagem = 500;
  
  STRING_write_to_internal(CLEAR_DISPLAY,"T. Motor Emb.",NULL);
  
  for(;;){
    tecla = TECLADO_getch();
    
    switch(tecla){
      case TECLA_ENTER:
           MENUOP_testa_liberacao_embalagem(tempo_embalagem);
           STRING_write_to_internal(CLEAR_DISPLAY,"T. Motor Emb.",NULL);           
           break;
      case TECLA_ESC:
           STRING_write_to_internal(CLEAR_DISPLAY,"Salvando","na FLASH");
           PARAMETROS_grava(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);
           vTaskDelay(3000);
           return;
      case TECLA_INC:
           if(tempo_embalagem<10000)
             tempo_embalagem+=100;
           break;
      case TECLA_DEC:
           if(tempo_embalagem>500)
             tempo_embalagem-=100;
           break;
    }
        
    sprintf(buffer_linha,"%05d ms",tempo_embalagem);
    STRING_write_to_internal(NO_CLEAR,NULL,buffer_linha);
  }
  /*
  unsigned int tempo_embalagem;
  unsigned char idioma;
  
  PARAMETROS_le(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);
  PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
  
  if(tempo_embalagem>10000)
    tempo_embalagem = 100;
  
  tempo_embalagem = MEI_entry_inc((char*)STRING_mensagem_edita_tempo_embalagem[idioma],
                                  "%05d ms",
                                  tempo_embalagem,
                                  100,
                                  10000,
                                  100);
  
  PARAMETROS_grava(ADR_TEMPO_EMBALAGEM,(void*)&tempo_embalagem);  
  */
}
/***********************************************************************************
*       Descrição       :       Configura o volume utilizado pela música
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_volume_musica(void){
  unsigned int volume;
  unsigned char idioma;  
  
  PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
  PARAMETROS_le(ADR_VOLUME_MUSICA,(void*)&volume);
  
  if(volume>100)
    volume = 100;
  
  volume = MEI_entry_inc((char*)STRING_titulo_menu_edita_volume_musica[idioma],
                         "%03d",
                         volume,
                         1,
                         100,
                         1);
  PARAMETROS_grava(ADR_VOLUME_MUSICA,(void*)&volume);    
}
/***********************************************************************************
*       Descrição       :       Confiura o volume das locuções
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_volume_locucoes(void){
  unsigned int volume;
  unsigned char idioma;  
  
  PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
  PARAMETROS_le(ADR_VOLUME_VOZ,(void*)&volume);
  
  if(volume>100)
    volume = 100;
  
  volume = MEI_entry_inc((char*)STRING_titulo_menu_edita_volume_voz[idioma],
                         "%03d",
                         volume,
                         1,
                         100,
                         1);
  PARAMETROS_grava(ADR_VOLUME_VOZ,(void*)&volume);  
}
/***********************************************************************************
*       Descrição       :       Configura o intervalo para a propaganda
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_intervalo_propaganda(void){
  unsigned char idioma;
  unsigned int intervalo;
  
  PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
  PARAMETROS_le(ADR_INTERVALO_TEMPO_PROP,(void*)&intervalo);
  
  if(intervalo>60)
    intervalo = 60;
  
  intervalo = MEI_entry_inc((char*)STRING_titulo_menu_intervalo_prop[idioma],
                            "%02d min",
                             intervalo,
                             10,
                             60,
                             10);  
  
  PARAMETROS_grava(ADR_INTERVALO_TEMPO_PROP,(void*)&intervalo);    
}
/***********************************************************************************
*       Descrição       :       Tela para configuração do modo free
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_modo_free(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_FREE,(void*)&flag);
  
  flag = MEF_entry((char*)STRING_mensagem_configura_free[idioma],flag,"ON ","OFF");    
  
  PARAMETROS_grava(ADR_FLAG_FREE,(void*)&flag);
}
/***********************************************************************************
*       Descrição       :       Tela para configuração do uso da fita-led
*                               durante a espera da máquina
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_fita_led(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_FITA_LED,(void*)&flag);
  
  flag = MEF_entry((char*)STRING_mensagem_configura_fita_led[idioma],flag,"ON ","OFF");    
  
  PARAMETROS_grava(ADR_FLAG_FITA_LED,(void*)&flag);
}
/***********************************************************************************
*       Descrição       :       Tela para configuração do uso de troco
*                               pela máquina
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_troco(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_TROCO,(void*)&flag);
  
  flag = MEF_entry((char*)STRING_titulo_configura_troco[idioma],flag,"ON ","OFF");    
  
  PARAMETROS_grava(ADR_FLAG_TROCO,(void*)&flag);         
}
/***********************************************************************************
*       Descrição       :       Tela para configurar a comissão do ponto
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_comissao(void){
  unsigned int comissao;
  unsigned char idioma;
  
  PARAMETROS_le(ADR_COMISSAO_PONTO,(void*)&comissao);
  PARAMETROS_le(ADR_FLAG_IDIOMA,(void*)&idioma);
  
  if(comissao>100)
    comissao = 20;
  
  comissao = MEI_entry_inc((char*)STRING_titulo_edita_comissao[idioma],
                           "%03d %%",
                            comissao,
                            1,
                            100,
                            1);
  
  PARAMETROS_grava(ADR_COMISSAO_PONTO,(void*)&comissao);  
}
/***********************************************************************************
*       Descrição       :       Tela para configurar a mensagem de cliente
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_mensagem_cliente(void){
  char buffer_mensagem[17];
  
  PARAMETROS_le(ADR_MENSAGEM_CLIENTE_01,(void*)buffer_mensagem);
  if(MENUOP_edita_mensagem("MSG CLIENTE 01",buffer_mensagem)){
    PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_01,(void*)buffer_mensagem);
  }
}
/***********************************************************************************
*       Descrição       :       Tela para configurar a mensagem do cliente
*                               de número 02
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_mensagem_cliente_02(void){
  char buffer_mensagem[17];
  
  PARAMETROS_le(ADR_MENSAGEM_CLIENTE_02,(void*)buffer_mensagem);
  if(MENUOP_edita_mensagem("MSG CLIENTE 02",buffer_mensagem)){
    PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_02,(void*)buffer_mensagem);
  }
}
/***********************************************************************************
*       Descrição       :       Tela para configurar a mensagem do cliente
*                               de número 03
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_mensagem_cliente_03(void){
  char buffer_mensagem[17];
  
  PARAMETROS_le(ADR_MENSAGEM_CLIENTE_03,(void*)buffer_mensagem);
  if(MENUOP_edita_mensagem("MSG CLIENTE 03",buffer_mensagem)){
    PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_03,(void*)buffer_mensagem);
  }
}
/***********************************************************************************
*       Descrição       :       Tela para configurar a mensagem do cliente
*                               de número 04
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_mensagem_cliente_04(void){
  char buffer_mensagem[17];
  
  PARAMETROS_le(ADR_MENSAGEM_CLIENTE_04,(void*)buffer_mensagem);
  if(MENUOP_edita_mensagem("MSG CLIENTE 04",buffer_mensagem)){
    PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_04,(void*)buffer_mensagem);
  }   
}
/***********************************************************************************
*       Descrição       :       Tela para editar o flag que liga o 
*                               desumidificador
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUOP_configura_flag_desumidificador(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned char flag;
  
  PARAMETROS_le(ADR_FLAG_DESUMIDIFICADOR,(void*)&flag);
  
  flag = MEF_entry((char*)STRING_titulo_edita_flag_desumidifcador[idioma],
                   flag,
                   "ON ","OFF");    
  
  PARAMETROS_grava(ADR_FLAG_DESUMIDIFICADOR,(void*)&flag);    
}
/***********************************************************************************
*       Descrição       :       Tela para configuração de uma mensagem no LCD
*       Parametros      :       (char*) título da tela
*                               (char*) mensagem inicial
*       Retorno         :       (unsigned char) maior do que zero se 
*                               a mensagem original sofreu alteração
***********************************************************************************/
unsigned char MENUOP_edita_mensagem(char *titulo,char* buffer_mensagem){
  eTECLA tecla;
  char buffer_temp[17]={0};
  unsigned char toggle=0;
  unsigned char tempo=1;
  unsigned char indice=0;
  unsigned char res=0;
  
  buffer_mensagem[16] = 0;
    
  for(unsigned char i=0;i<16;i++)
    if(buffer_mensagem[i]<' ' || buffer_mensagem[i]>'z')
      buffer_mensagem[i] = ' ';
  
  STRING_write_to_internal(CLEAR_DISPLAY,titulo,NULL);
  
  for(;;){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           indice++;
           if(indice>15){             
             return res;
           }
           break;
      case TECLA_ESC:           
           return res;
      case TECLA_INC:
           res = 1;
           if(buffer_mensagem[indice]>'z')
             buffer_mensagem[indice] = ' ';
           else
             buffer_mensagem[indice]++;
           break;
      case TECLA_DEC:
           res = 1;
           if(buffer_mensagem[indice]>' ')
             buffer_mensagem[indice]--;
           else
             buffer_mensagem[indice] = 'z';
           break;
    }
    
    if(!--tempo){
      tempo = 5;
      toggle ^= 255;
    }
    
    if(toggle)
      STRING_write_to_internal(NO_CLEAR,NULL,buffer_mensagem);
    else{
      memcpy(buffer_temp,buffer_mensagem,16);
      buffer_temp[indice] = '_';
      STRING_write_to_internal(NO_CLEAR,NULL,buffer_temp);
    }
    
    vTaskDelay(50);
  }      
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/