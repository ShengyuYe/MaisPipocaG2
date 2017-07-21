/*__________________________________________________________________________________
|	Quark Tecnologia Eletr�nica Embarcada
|       
|       Itapema - SC
|       www.quarktee.com.br
| __________________________________________________________________________________
|
|       This source code was developed by Quark  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by Quark 
|       or its distributors.
|
|       Este c�digo � propriedade da Quark  e n�o pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       Quark  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  menu_avancado.c
| 
|       Autor              :  Marcos Aquino
|       Data cria��o       :  30/05/2017
|
|       Revis�es           :  001
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
#include "menu_rolagem.h"
#include "menu_ajuste_relogio.h"

/***********************************************************************************
*       Defini��es locais
***********************************************************************************/


/***********************************************************************************
*       Macros locais
***********************************************************************************/


/***********************************************************************************
*       Constantes locais
***********************************************************************************/


/***********************************************************************************
*       Variaveis locais
***********************************************************************************/


/***********************************************************************************
*       Fun��es locais
***********************************************************************************/
void MENUAVANCADO_padrao_fabrica(void);
void MENUAVANCADO_cadastra_senha_admin(void);
void MENUAVANCADO_reset_totalizadores_permanentes(void);
void MENUAVANCADO_configura_numero_serie(void);
void MENUAVANCADO_menu_ganhos_PID(void);
void MENUAVANCADO_configura_hora_data(void);
void MENUAVANCADO_configura_flag_correcao_erro(void);
void MENUAVANCADO_configura_fator_compensavao(void);

/***********************************************************************************
*       Tabela de fun��es
***********************************************************************************/
void(*const MENUAVANCADO_func[])(void)={
  MENUAVANCADO_padrao_fabrica,
  MENUAVANCADO_cadastra_senha_admin,
  MENUAVANCADO_reset_totalizadores_permanentes,
  MENUAVANCADO_menu_ganhos_PID,
  MENUAVANCADO_configura_numero_serie,
  MENUAVANCADO_configura_hora_data,
  MENUAVANCADO_configura_flag_correcao_erro,
  MENUAVANCADO_configura_fator_compensavao,
  NULL
};
/***********************************************************************************
*       Implementa��o das fun��es
***********************************************************************************/

/***********************************************************************************
*       Descri��o       :       Ponto de entrada para o menu avan�ado
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUAVANCADO_entry(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  
  // Senha para acesso,caso inv�lida
  // n�o abre o menu
  if(!TELASENHA_telaSenha(SENHA_MENU_AVANCADO))
    return;
    
  MENUROLAGEM_show((char*)STRING_titulo_menu_avancado[idioma],
                   (char**)STRING_menu_avancado[idioma],
                   QTD_OPCOES_AVANCADO,
                   (void(**)(void))MENUAVANCADO_func);   
}
/***********************************************************************************
*       Descri��o       :       Restaura as configura��es padr�o para a mem�ria
*                               flash da m�quina
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUAVANCADO_padrao_fabrica(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned int valor;  
  unsigned char flag;//1234567890123456 
  char msg_padrao[17]=MENSAGEM_PADRAO_FABRICA;
  
  STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_titulo_padrao_fabrica[idioma],NULL);
    
  if(TELASENHA_telaSenha(SENHA_PADRAO_FABRICA)){
    
    STRING_write_to_internal(CLEAR_DISPLAY,(char*)STRING_mensagem_reset_fabrica[idioma][0],
                                           (char*)STRING_mensagem_reset_fabrica[idioma][1]);
    
    // Valor da pipoca R$ 4,00
    valor = PADRAO_VALOR_PIPOCA;
    PARAMETROS_grava(ADR_VALOR_PIPOCA,(void*)&valor);
    
    // Apenas c�dula 
    flag = PADRAO_CEDULAS_HABILITADA;
    PARAMETROS_grava(ADR_NOTAS,(void*)&flag);
                     
    // Configura o tempo em que o motor da embalagem
    // fica ligado
    valor = PADRAO_TEMPO_EMBALAGEM;
    PARAMETROS_grava(ADR_TEMPO_EMBALAGEM,(void*)&valor);
    
    // Configura para a fita led ficar piscando 
    flag = PADRAO_HABILITA_FITA_LED;
    PARAMETROS_grava(ADR_FLAG_FITA_LED,(void*)&flag);
    
    // Configura para o volume da m�sica para 50%
    valor = PADRAO_VOLUME_MUSICA;
    PARAMETROS_grava(ADR_VOLUME_MUSICA,(void*)&valor);
    
    // Configura para o volume da voz ficar em 50%
    valor = PADRAO_VOLUME_VOZ;
    PARAMETROS_grava(ADR_VOLUME_VOZ,(void*)&valor);
    
    // Configura para a propaganda rodar a cada
    // 30 minutos
    valor = PADRAO_INTERVALO_PROPAGANDA;
    PARAMETROS_grava(ADR_INTERVALO_TEMPO_PROP,(void*)&valor);
    
    // Configura para a m�quina n�o utilizar troco
    flag = PADRAO_FLAG_TROCO;
    PARAMETROS_grava(ADR_FLAG_TROCO,(void*)&flag);
    
    // Configura para n�o entrar no modo pipoca gr�tis
    flag = PADRAO_GRATIS;
    PARAMETROS_grava(ADR_FLAG_FREE,(void*)&flag);
    
    // Configura a temperatura de trabalho
    valor = PADRAO_TEMPERATURA;
    PARAMETROS_grava(ADR_TEMPERATURA_PREPARACAO,(void*)&valor);
    
    // Configura a velocidade do motor do ar
    valor = PADRAO_ROTACAO_PREPARO;
    PARAMETROS_grava(ADR_VELOCIDADE_PREPARACAO,(void*)&valor);    
    
    // Grava as mensagens de cliente como Mais PIpoca
    PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_01,(void*)msg_padrao);
    PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_02,(void*)msg_padrao);
    PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_03,(void*)msg_padrao);
    PARAMETROS_grava(ADR_MENSAGEM_CLIENTE_04,(void*)msg_padrao);
    
    valor = 1;
    PARAMETROS_grava(ADR_FATOR_COMPENSADOR,(void*)&valor);
  }
}
/***********************************************************************************
*       Descri��o       :       Tela para cadastro da nova senha de administrador
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUAVANCADO_cadastra_senha_admin(void){
  unsigned int senha;
  unsigned int s1,s2;
  unsigned char idioma = APLICACAO_carrega_idioma();  
  
  PARAMETROS_le(ADR_SENHA_ADMIN,(void*)&senha);
  
  if(senha>9999)
    senha = 0;
  
  // Senha para acesso,caso inv�lida
  // n�o abre o menu
  if(!TELASENHA_telaSenha(senha))
    return;  
  
  s1 = TELASENHA_get_senha((char*)STRING_mensagem_inserir_senha[idioma]);
  s2 = TELASENHA_get_senha((char*)STRING_mensagem_inserir_senha[idioma]);
  
  if(s1 == s2){
    // Desenha a mensagem confirmando a grava��o
    // da nova senha
    STRING_write_to_internal(CLEAR_DISPLAY,
                            (char*)STRING_mensagem_cadastro_senha[idioma][0],
                            (char*)STRING_mensagem_cadastro_senha[idioma][1]);
    
    // Grava a nova senha na mem�ria flash
    PARAMETROS_grava(ADR_SENHA_ADMIN,(void*)&s1);    
  }
  else
    STRING_write_to_internal(CLEAR_DISPLAY,
                            (char*)STRING_mensagem_cadastro_senha_erro[idioma][0],
                            (char*)STRING_mensagem_cadastro_senha_erro[idioma][1]);
   
  vTaskDelay(3000);
}
/***********************************************************************************
*       Descri��o       :       Faz o reset dos totalizadores permanentes da 
*                               m�quina
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUAVANCADO_reset_totalizadores_permanentes(void){
  unsigned char idioma = APLICACAO_carrega_idioma();    
  
  if(TELASENHA_checa_contrasenha(NULL)){    
    STRING_write_to_internal(CLEAR_DISPLAY,
                            (char*)STRING_mensagem_reinicia_totalizadores[idioma][0],
                            (char*)STRING_mensagem_reinicia_totalizadores[idioma][1]);    
           
    FATURAMENTO_set_contagem_parcial(0);
    FATURAMENTO_set_arrecadacao_parcial(0);
    FATURAMENTO_set_contagem_cartao_parcial(0);
    FATURAMENTO_set_arrecadacao_cartao_parcial(0);
        
    FATURAMENTO_set_contagem_total(0);
    FATURAMENTO_set_arrecadacao_total(0);
    FATURAMENTO_set_contagem_cartao_total(0);
    FATURAMENTO_set_arrecadacao_cartao_total(0);    
    
    FTP_formata_fila(); // Apaga os eventos de troca de pre�o da pipoca
    
    FATURAMENTO_reinicia_pipocas_teste();
  }
  else{    
    STRING_write_to_internal(CLEAR_DISPLAY,
                            (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][0],
                            (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][1]);            
  }
  
  vTaskDelay(3000);
}
/***********************************************************************************
*       Descri��o       :       Entra no menu para configura��o dos
*                               ganhos do PID do motor
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUAVANCADO_menu_ganhos_PID(void){
  unsigned char idioma = APLICACAO_carrega_idioma();    
  
  // Menu para configura��o 
  // dos par�metros do PID
  // do motor
  if(TELASENHA_checa_contrasenha(NULL)){    
    
    
  }
  else{    
    STRING_write_to_internal(CLEAR_DISPLAY,
                            (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][0],
                            (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][1]);            
  }
  
  vTaskDelay(3000);
}
/***********************************************************************************
*       Descri��o       :       Configura o n�mero de s�rie da m�quina
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUAVANCADO_configura_numero_serie(void){
  unsigned char idioma = APLICACAO_carrega_idioma();    
  
  if(TELASENHA_checa_contrasenha(NULL)){ 
            
     unsigned int numero = 0;
     PARAMETROS_le(ADR_NUMERO_SERIE,(void*)&numero);
     
     if(numero>999999)
       numero = 100;
     
     if(numero<1200)
       numero = 1200;
     
     numero = MEI_entry((char*)STRING_titulo_edita_serial[idioma],
                        "%06d",
                        numero,
                        1,
                        999999);
     
     PARAMETROS_grava(ADR_NUMERO_SERIE,(void*)&numero);
  }
  else{    
    STRING_write_to_internal(CLEAR_DISPLAY,
                            (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][0],
                            (char*)STRING_mensagem_reinicia_totalizadores_erro[idioma][1]);            
  }
}
/***********************************************************************************
*       Descri��o       :       Tela para configura��o da hora e data
*                               do sistema
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUAVANCADO_configura_hora_data(void){
  
  IAR_entry();
}
/***********************************************************************************
*       Descri��o       :       Tela para configura��o do flag que habilita
*                               a corre��o de erro no motor do ar
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUAVANCADO_configura_flag_correcao_erro(void){
  unsigned char idioma = APLICACAO_carrega_idioma();
  unsigned char flag;
  
  PARAMETROS_le(ADR_COMPENSADOR_ERRO_ROTACAO,(void*)&flag);
  
  flag = MEF_entry("ERRO MOTOR",flag,"ON ","OFF");    
  
  PARAMETROS_grava(ADR_COMPENSADOR_ERRO_ROTACAO,(void*)&flag);
}
/***********************************************************************************
*       Descri��o       :      Tela para configura��o do fator de compensa��o
*                              do controle de temperatura
*       Parametros      :       nenhum
*       Retorno         :       nenhum
***********************************************************************************/
void MENUAVANCADO_configura_fator_compensavao(void){
  unsigned int valor;

  PARAMETROS_le(ADR_FATOR_COMPENSADOR,(void*)&valor);

  valor = MEI_entry("FATOR TEMP","%1d oC",valor,1,3);    
  
  PARAMETROS_grava(ADR_FATOR_COMPENSADOR,(void*)&valor);
}
/***********************************************************************************
*       Fim do arquivo
***********************************************************************************/