/*__________________________________________________________________________________
|	Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Balenário Camboriú - SC
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
|       Arquivo            :  mapa_memoria.h
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  23/02/2014
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _MAPA_MEMORIA_H_
#define _MAPA_MEMORIA_H_





#define AREA_TESTE                      0
#define FIM_AREA_TESTE                  0xFFF

#define AREA_TABELA                     0x0E00

#define AREA_PARAMETROS                 0x1000
#define FIM_AREA_PARAMETROS             0x2FFF

#define AREA_AUDIO                      0x3000
#define FIM_AREA_AUDIO                  0x0001FFFFF


/////////////////////////////////////////////////////////////////////////////////
// Área dos parametros                                                         //
/////////////////////////////////////////////////////////////////////////////////

#define ADR_INDICE_MUSICA               0x1000
#define ADR_INDICE_PROPAGANDA           0x1009
#define ADR_INCICE_PEGUE_O_PACOTE       0x1013
#define ADR_INDICE_PEGUE_AS_PIPOCAS     0x101B
/*
#define ADR_TEMPO_PREPARO               0x1100
#define ADR_TEMPERATURA_PREPARO         0x1104
#define ADR_VELOCIDADE_PREPARO          0x1108
#define ADR_VELOCIDADE_EXPULSAO         0x110c        
#define ADR_ATRASO_PACOTE               0x1110
#define ADR_VALOR_PIPOCA                0x1114
#define ADR_BETA                        0x1118
#define ADR_RT                          0x111E
#define ADR_TIPO_CEDULAS                0x1128
#define ADR_CONTADOR_VENDAS             0x2000
#define ADR_CONTADOR_DINHEIRO           0x1500
#define ADR_CONTADOR_PERMANENTE         0x1550
#define ADR_TEMPO_PROPAGANDA            0x1570
#define ADR_FITA_LED                    0x1580
#define ADR_TEMPERATURA_PRE_PROCESSO    0x1590
#define ADR_VELOCIDADE_INICIAL_EXP      0x1595
#define ADR_VELOCIDADE_FINAL_EXP        0x15A0   
#define ADR_VOLUME_SOM                  0x15A5
#define ADR_FATOR_TEMP                  0x15B0
#define ADR_VELOCIDADE_LIMPEZA          0x15B5
#define ADR_VELOCIDADE_AQUECIMENTO      0x15C0
*/
//#define ADR_VOLUME_VOZ                  0x15C5

/*
#define ADR_FITA_PREPARO                0x15D0
#define ADR_COMISSAO_PONTO              0x15D4
#define ADR_CONTADOR_VENDAS_PARCIAL     0x15D8
#define ADR_COPIA_PARAMETROS            0x15DA
#define ADR_FLAG_LOCACAO                0x1600        
#define ADR_TEMP_INICIAL                0x1610
#define ADR_TEMPO_PRE_AQUECIMENTO       0x1608
#define ADR_MENSAGENS_TEXTO             0x1700
#define ADR_FLAG_DESUMIDIFICACAO        0x1900
#define ADR_VEL_DESUMIDIFICACAO         0x1904
#define ADR_TEMP_DESUMIDIFICACAO        0x1908
#define ADR_ASSINATURA                  0x1A00
#define FIM_ADR_ASSINATURA              0x1B00
#define AREA_HORIMETRO                  0x1C00
#define FIM_AREA_HORIMETRO              0x1F00
#define ADR_CONTADOR_PIPOCAS_TESTE      0x1F20
#define ADR_TIPO_NOTEIRO                0x1F80      
#define ADR_TIPO_IMPRESSORA             0x1FB0
#define ADR_OPERACOES_CARTAO            0x1FC0
#define ADR_TIPO_MOEDEIRO               0x2010
#define ADR_NUMERO_SERIE                0x2020
#define ADR_FAT_CARTAO_PARCIAL          0x2030
#define ADR_FAT_CARTAO_TOTAL            0x2040
#define ADR_SENHA_ROOT                  0x2050
*/
#endif//_MAPA_MEMORIA_H_