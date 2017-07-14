#ifndef _TABELA_PARAMETROS_H_
#define _TABELA_PARAMETROS_H_



//
// Região de constantes para inicialização padrão dos parâmetros
//


// Tabela com os parâmetros
const sPARAMETROS tabela_parametros[]={
  
  [ADR_FLAG_IDIOMA] = {
       .length = PAR_BYTE,
       .nome = "IDIOMA",
       .ext = "I08",
       .default_value = (void*) 0x00
  },

  [ADR_FLAG_BV20]={
       .length = PAR_BYTE,
       .nome = "FLAG_BV20",
       .ext = "I08",
       .default_value = (void*) 0x00    
  },
  [ADR_NOTAS ]={
       .length = PAR_BYTE,
       .nome = "TIPO_NOTAS",
       .ext = "I08",
       .default_value = (void*) 0x03    
  },
  [ADR_VALOR_PIPOCA]={
       .length = PAR_DOUBLE_WORD,
       .nome = "VALOR_PIPOCA",
       .ext = "I32",
       .default_value = (void*) 0x000000000000000A
  },  
  [ADR_FLAG_MDB_BIL]={
       .length = PAR_BYTE,
       .nome = "FLAG_MDB_BILL",
       .ext = "I08",
       .default_value = (void*) 0x00       
  },
  [ADR_FLAG_MDB_COIN]={
       .length = PAR_BYTE,
       .nome = "FLAG_MDB_COIN",
       .ext = "I08",
       .default_value = (void*) 0x00           
  },
  [ADR_FLAG_MDB_CASHLESS]={
       .length = PAR_BYTE,
       .nome = "FLAG_MDB_CSH",
       .ext = "I08",
       .default_value = (void*) 0x00           
  },
  [ADR_BAUDRATE_IMPRESSORA]={
       .length = PAR_DOUBLE_WORD,
       .nome = "BAUD_PRINTER",
       .ext = "I32",
       .default_value = (void*) 0x000000000000000A   
  },
  [ADR_VALOR_PULSO_MOEDEIRO]={
       .length = PAR_DOUBLE_WORD,
       .nome = "VALOR_PULSO_MOED",
       .ext = "I32",
       .default_value = (void*) 0x000000000000000A
  },
  [ADR_VALOR_PULSO_NOTEIRO]={
       .length = PAR_DOUBLE_WORD,
       .nome = "VALOR_PULSO_NOT",
       .ext = "I32",
       .default_value = (void*) 0x000000000000000A
  },  
  //
  // Registradores para totalização
  // das unidades vendindas  
  // moeda e cartão
  //
  [ADR_CONTAGEM_UNIDADES_PARCIAL]={
       .length = PAR_DOUBLE_WORD,
       .nome = "CONTAGEM_PARCIAL",
       .ext = "I32",
       .default_value = (void*) 0    
  },
 [ADR_CONTAGEM_UNIDADES_TOTAL]={
       .length = PAR_DOUBLE_WORD,
       .nome = "CONTAGEM_TOTAL",
       .ext = "I32",
       .default_value = (void*) 0    
  },       
 [ADR_MOEDA_PARCIAL]={
       .length = PAR_DOUBLE_WORD,
       .nome = "MOEDA_PARCIAL",
       .ext = "I32",
       .default_value = (void*) 0    
  },            
 [ADR_MOEDA_TOTAL]={
       .length = PAR_DOUBLE_WORD,
       .nome = "MOEDA_TOTAL",
       .ext = "I32",
       .default_value = (void*) 0    
  },
 [ADR_CARTAO_PARCIAL]={
       .length = PAR_DOUBLE_WORD,
       .nome = "CARTAO_PARCIAL",
       .ext = "I32",
       .default_value = (void*) 0    
  },
 [ADR_CARTAO_TOTAL]={
       .length = PAR_DOUBLE_WORD,
       .nome = "CARTAO_TOTAL",
       .ext = "I32",
       .default_value = (void*) 0    
  },
  [ADR_UNIDADES_CARTAO_PARCIAL]={
       .length = PAR_DOUBLE_WORD,
       .nome = "UNI_CARTAO_PARCIAL",
       .ext = "I32",
       .default_value = (void*) 0     
  },
  [ADR_UNIDADES_CARTAO_TOTAL]={
       .length = PAR_DOUBLE_WORD,
       .nome = "UNI_CARTAO_TOTAL",
       .ext = "I32",
       .default_value = (void*) 0   
  },  
  //---
  [ADR_INICIO_BLOCO_MUSICA]={
       .length = PAR_DOUBLE_WORD,
       .nome = "INICIO_MUSICA",
       .ext = "I32",
       .default_value = (void*) 0   
  },    
  
  [ADR_INICIO_LOCUCAO_PROPAGANDA]={
       .length = PAR_DOUBLE_WORD,
       .nome = "INICIO_PROPAGANDA",
       .ext = "I32",
       .default_value = (void*) 0       
  },
  
  [ADR_INICIO_LOCUCAO_PEGA_PACOTE]={
       .length = PAR_DOUBLE_WORD,
       .nome = "INICIO_PEGA_PACOTE",
       .ext = "I32",
       .default_value = (void*) 0       
  },
  
  [ADR_INICIO_LOCUCAO_PIPOCAS_PRONTAS]={
       .length = PAR_DOUBLE_WORD,
       .nome = "INICIO_PIPOCAS_PRONTAS",
       .ext = "I32",
       .default_value = (void*) 0          
  },
  
  [ADR_TAMANHO_BLOCO_MUSICA]={
       .length = PAR_DOUBLE_WORD,
       .nome = "TAMANHO_BLOCO_MUSICA",
       .ext = "I32",
       .default_value = (void*) 0       
  },
  
  [ADR_TAMANHO_LOCUCAO_PROPAGANDA]={
       .length = PAR_DOUBLE_WORD,
       .nome = "TAMANHO_LOCUCAO_PROP",
       .ext = "I32",
       .default_value = (void*) 0         
  },
  
  [ADR_TAMANHO_LOCUCAO_PEGA_PACOTE]={
       .length = PAR_DOUBLE_WORD,
       .nome = "TAMANHO_PEGA_PACOTE",
       .ext = "I32",
       .default_value = (void*) 0         
  },
  
  [ADR_TAMANHO_LOCUCAO_PIPOCAS_PRONTAS]={
       .length = PAR_DOUBLE_WORD,
       .nome = "TAMANHO_PIPOCAS_PRONTAS",
       .ext = "I32",
       .default_value = (void*) 0         
  },
  [ADR_TEMPERATURA_PREPARACAO]={
       .length = PAR_DOUBLE_WORD,
       .nome = "TEMPERATURA_PREPARO",
       .ext = "I32",
       .default_value = (void*) 0       
  },
  [ADR_VELOCIDADE_PREPARACAO]={
       .length = PAR_DOUBLE_WORD,
       .nome = "VELOCIDADE_PREPARAO",
       .ext = "I32",
       .default_value = (void*) 0       
  },
  [ADR_TEMPO_EMBALAGEM]={
       .length = PAR_DOUBLE_WORD,
       .nome = "TEMPO_MOTOR_EMBALAGEM",
       .ext = "I32",
       .default_value = (void*) 0     
  },
  [ADR_VOLUME_MUSICA]={
       .length = PAR_DOUBLE_WORD,
       .nome = "VOLUME_MUSICA",
       .ext = "I32",
       .default_value = (void*) 0   
  },
  [ADR_VOLUME_VOZ]={
       .length = PAR_DOUBLE_WORD,
       .nome = "VOLUME_LOCUCAO",
       .ext = "I32",
       .default_value = (void*) 0  
  },
  [ADR_INTERVALO_TEMPO_PROP]={
       .length = PAR_DOUBLE_WORD,
       .nome = "INTERVALO_PROP",
       .ext = "I32",
       .default_value = (void*) 0      
  },
  [ADR_FLAG_FREE]={
       .length = PAR_BYTE,
       .nome = "FREE",
       .ext = "I08",
       .default_value = (void*) 0x00
  },
  [ADR_FLAG_FITA_LED]={
       .length = PAR_BYTE,
       .nome = "FITA_LED",
       .ext = "I08",
       .default_value = (void*) 0x00    
  },
  [ADR_FLAG_TROCO]={
       .length = PAR_BYTE,
       .nome = "TROCO_MOEDA",
       .ext = "I08",
       .default_value = (void*) 0x00     
  },
  [ADR_SENHA_ADMIN]={
       .length = PAR_DOUBLE_WORD,
       .nome = "SENHA_ADMIN",
       .ext = "I32",
       .default_value = (void*) 0x00         
  },
  [ADR_NUMERO_SERIE]={
       .length = PAR_DOUBLE_WORD,
       .nome = "NUMERO_SERIE",
       .ext = "I32",
       .default_value = (void*) 0x00             
  },
  [ADR_COMISSAO_PONTO]={
       .length = PAR_DOUBLE_WORD,
       .nome = "COMISSAO_PONTO",
       .ext = "I32",
       .default_value = (void*) 0x00                 
  },
  [ADR_FLAG_DESUMIDIFICADOR]={
       .length = PAR_BYTE,
       .nome = "FLG_DESUMID",
       .ext = "I08",
       .default_value = (void*) 0x00       
  },
  [ADR_MENSAGEM_CLIENTE_01]={
       .length = 16,
       .nome = "SG_CLIENTE_01",
       .ext = "TXT",
       .default_value = (void*) "  GRUPO ALTECH  "
  },
  [ADR_CONTADOR_PIPOCAS_TESTE]={
       .length = PAR_DOUBLE_WORD,
       .nome = "cnt_pip_teste",
       .ext = "I32",
       .default_value = (void*) 0x00
  },
  [ADR_MENSAGEM_CLIENTE_02]={
       .length = 16,
       .nome = "SG_CLIENTE_02",
       .ext = "TXT",
       .default_value = (void*) "  GRUPO ALTECH  "
  },
  [ADR_MENSAGEM_CLIENTE_03]={
       .length = 16,
       .nome = "SG_CLIENTE_03",
       .ext = "TXT",
       .default_value = (void*) "  GRUPO ALTECH  "    
  },
  [ADR_MENSAGEM_CLIENTE_04]={
       .length = 16,
       .nome = "SG_CLIENTE_04",
       .ext = "TXT",
       .default_value = (void*) "  GRUPO ALTECH  "    
  }
};






#endif//_TABELA_PARAMETROS_H_