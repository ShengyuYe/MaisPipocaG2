/*__________________________________________________________________________________
|	DEXTRO SOLUÇÕES TECNOLÓGICAS
|       
|       ITAJAÍ - SC
|       www.dextro.ind.br
| __________________________________________________________________________________
|
|       This source code was developed by DEXTRO  and cannot be copied, in part 
|       or in whole, or used, except when legally licensed by DEXTRO 
|       or its distributors.
|
|       Este código é propriedade da DEXTRO  e não pode ser copiado, em parte 
|       ou em todo, ou utilizado, exceto quando for legalmente licenciado pela 
|       DEXTRO  ou por um de seus distribuidores.
| __________________________________________________________________________________
|
|       Arquivo            :  parametros.h
|       Descrição          :  Menu para configuração do sistema
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  30/12/2016
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/

#ifndef _PARAMETROS_H_
#define _PARAMETROS_H_

//
// Endereço dos parâmetros
//
#define TAMANHO_PARAMETROS                      26

#define ADR_FLAG_IDIOMA                         0
#define ADR_FLAG_BV20                           1
#define ADR_NOTAS                               2
#define ADR_VALOR_PIPOCA                        3
#define ADR_FLAG_MDB_BIL                        4
#define ADR_FLAG_MDB_COIN                       5
#define ADR_FLAG_MDB_CASHLESS                   6
#define ADR_BAUDRATE_IMPRESSORA                 7
#define ADR_VALOR_PULSO_MOEDEIRO                8
#define ADR_VALOR_PULSO_NOTEIRO                 9
#define ADR_CONTAGEM_UNIDADES_PARCIAL           10
#define ADR_CONTAGEM_UNIDADES_TOTAL             11
#define ADR_MOEDA_PARCIAL                       12
#define ADR_MOEDA_TOTAL                         13
#define ADR_CARTAO_PARCIAL                      14
#define ADR_CARTAO_TOTAL                        15
#define ADR_UNIDADES_CARTAO_PARCIAL             16
#define ADR_UNIDADES_CARTAO_TOTAL               17
#define ADR_INICIO_BLOCO_MUSICA                 18
#define ADR_INICIO_LOCUCAO_PROPAGANDA           19
#define ADR_INICIO_LOCUCAO_PEGA_PACOTE          20
#define ADR_INICIO_LOCUCAO_PIPOCAS_PRONTAS      21
#define ADR_TAMANHO_BLOCO_MUSICA                22
#define ADR_TAMANHO_LOCUCAO_PROPAGANDA          23
#define ADR_TAMANHO_LOCUCAO_PEGA_PACOTE         24
#define ADR_TAMANHO_LOCUCAO_PIPOCAS_PRONTAS     25
#define ADR_TEMPERATURA_PREPARACAO              26
#define ADR_VELOCIDADE_PREPARACAO               27
#define ADR_TEMPO_EMBALAGEM                     28
#define ADR_VOLUME_MUSICA                       29
#define ADR_VOLUME_VOZ                          30
#define ADR_INTERVALO_TEMPO_PROP                31
#define ADR_FLAG_FREE                           32
#define ADR_FLAG_FITA_LED                       33
#define ADR_FLAG_TROCO                          34
#define ADR_SENHA_ADMIN                         35
#define ADR_NUMERO_SERIE                        36
#define ADR_COMISSAO_PONTO                      37
#define ADR_FLAG_DESUMIDIFICADOR                38
#define ADR_CONTADOR_PIPOCAS_TESTE              39
#define ADR_MENSAGEM_CLIENTE_01                 60
#define ADR_MENSAGEM_CLIENTE_02                 61
#define ADR_MENSAGEM_CLIENTE_03                 62
#define ADR_MENSAGEM_CLIENTE_04                 63

#define ADR_AREA_TESTE                          100

#define CARREGA_PARAMETRO(PARAMETRO,TIPO,SAIDA)        TIPO VAR; PARAMETROS_le(PARAMETRO,&VAR); SAIDA = VAR

typedef enum{
  BYTE=1,
  WORD=2,
  DOUBLE_WORD=4,
}ePARAMETRO;

typedef struct{
  void* default_value;
  unsigned short int length;  
  char nome[32];
  char ext[3];
}sPARAMETROS;


void PARAMETROS_ini(void);
void PARAMETROS_grava(unsigned int endereco,void*parametro);
void PARAMETROS_le(unsigned int endereco,void*parametro);


// Legado para a interface requerida pela
// biblioteca protocolo
void PARAMETROS_alteraTabelaIndiceMusicas(unsigned char musica,
                                          unsigned int enderecoInicial,
                                          unsigned int tamanho);

unsigned char PARAMETROS_carregaDadosIndiceMusicas(unsigned char musica,
                                                   unsigned int* enderecoInicial,
                                                   unsigned int* tamanho);

unsigned char PARAMETROS_leVolumeSom(void);

void PARAMETROS_gravaVolumeSom(unsigned char volume);

unsigned char PARAMETROS_leVolumeVoz(void);

void PARAMETROS_gravaVolumeVoz(unsigned char volume);

/**********************************************************************************
*       Fim do arquivo
**********************************************************************************/
#endif//_PARAMETROS_H_