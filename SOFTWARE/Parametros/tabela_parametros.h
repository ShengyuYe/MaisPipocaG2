#ifndef _TABELA_PARAMETROS_H_
#define _TABELA_PARAMETROS_H_



//
// Região de constantes para inicialização padrão dos parâmetros
//


// Tabela com os parâmetros
const sPARAMETROS tabela_parametros[]={
  
  [ADR_FLAG_IDIOMA] = {
       .length = BYTE,
       .nome = "IDIOMA",
       .ext = "NUM",
       .default_value = (void*) 0x00
  },

  [ADR_FLAG_BV20]={
       .length = BYTE,
       .nome = "FLAG_BV20",
       .ext = "NUM",
       .default_value = (void*) 0x00    
  },
  [ADR_NOTAS ]={
       .length = BYTE,
       .nome = "TIPO_NOTAS",
       .ext = "NUM",
       .default_value = (void*) 0x03    
  },
  [ADR_VALOR_PIPOCA]={
       .length = DOUBLE_WORD,
       .nome = "VALOR_PIPOCA",
       .ext = "NUM",
       .default_value = (void*) 0x000000000000000A
  },  
  [ADR_FLAG_MDB_BIL]={
       .length = BYTE,
       .nome = "FLAG_MDB_BILL",
       .ext = "NUM",
       .default_value = (void*) 0x00       
  },
  [ADR_FLAG_MDB_COIN]={
       .length = BYTE,
       .nome = "FLAG_MDB_COIN",
       .ext = "NUM",
       .default_value = (void*) 0x00           
  },
  [ADR_FLAG_MDB_CASHLESS]={
       .length = BYTE,
       .nome = "FLAG_MDB_CSH",
       .ext = "NUM",
       .default_value = (void*) 0x00           
  },
  [ADR_BAUDRATE_IMPRESSORA]={
       .length = DOUBLE_WORD,
       .nome = "BAUD_PRINTER",
       .ext = "NUM",
       .default_value = (void*) 0x000000000000000A   
  },
  [ADR_VALOR_PULSO_MOEDEIRO]={
       .length = DOUBLE_WORD,
       .nome = "VALOR_PULSO_MOED",
       .ext = "NUM",
       .default_value = (void*) 0x000000000000000A
  },
  [ADR_VALOR_PULSO_NOTEIRO]={
       .length = DOUBLE_WORD,
       .nome = "VALOR_PULSO_NOT",
       .ext = "NUM",
       .default_value = (void*) 0x000000000000000A
  },  
  //
  // Registradores para totalização
  // das unidades vendindas  
  // moeda e cartão
  //
  [ADR_CONTAGEM_UNIDADES_PARCIAL]={
       .length = DOUBLE_WORD,
       .nome = "CONTAGEM_PARCIAL",
       .ext = "NUM",
       .default_value = (void*) 0    
  },
 [ADR_CONTAGEM_UNIDADES_TOTAL]={
       .length = DOUBLE_WORD,
       .nome = "CONTAGEM_TOTAL",
       .ext = "NUM",
       .default_value = (void*) 0    
  },       
 [ADR_MOEDA_PARCIAL]={
       .length = DOUBLE_WORD,
       .nome = "MOEDA_PARCIAL",
       .ext = "NUM",
       .default_value = (void*) 0    
  },            
 [ADR_MOEDA_TOTAL]={
       .length = DOUBLE_WORD,
       .nome = "MOEDA_TOTAL",
       .ext = "NUM",
       .default_value = (void*) 0    
  },
 [ADR_CARTAO_PARCIAL]={
       .length = DOUBLE_WORD,
       .nome = "CARTAO_PARCIAL",
       .ext = "NUM",
       .default_value = (void*) 0    
  },
 [ADR_CARTAO_TOTAL]={
       .length = DOUBLE_WORD,
       .nome = "CARTAO_TOTAL",
       .ext = "NUM",
       .default_value = (void*) 0    
  },
  [ADR_UNIDADES_CARTAO_PARCIAL]={
       .length = DOUBLE_WORD,
       .nome = "UNI_CARTAO_PARCIAL",
       .ext = "NUM",
       .default_value = (void*) 0     
  },
  [ADR_UNIDADES_CARTAO_TOTAL]={
       .length = DOUBLE_WORD,
       .nome = "UNI_CARTAO_TOTAL",
       .ext = "NUM",
       .default_value = (void*) 0   
  },  
  //---
  [ADR_INICIO_BLOCO_MUSICA]={
       .length = DOUBLE_WORD,
       .nome = "INICIO_MUSICA",
       .ext = "NUM",
       .default_value = (void*) 0   
  },    
  
  [ADR_INICIO_LOCUCAO_PROPAGANDA]={
       .length = DOUBLE_WORD,
       .nome = "INICIO_PROPAGANDA",
       .ext = "NUM",
       .default_value = (void*) 0       
  },
  
  [ADR_INICIO_LOCUCAO_PEGA_PACOTE]={
       .length = DOUBLE_WORD,
       .nome = "INICIO_PEGA_PACOTE",
       .ext = "NUM",
       .default_value = (void*) 0       
  },
  
  [ADR_INICIO_LOCUCAO_PIPOCAS_PRONTAS]={
       .length = DOUBLE_WORD,
       .nome = "INICIO_PIPOCAS_PRONTAS",
       .ext = "NUM",
       .default_value = (void*) 0          
  },
  
  [ADR_TAMANHO_BLOCO_MUSICA]={
       .length = DOUBLE_WORD,
       .nome = "TAMANHO_BLOCO_MUSICA",
       .ext = "NUM",
       .default_value = (void*) 0       
  },
  
  [ADR_TAMANHO_LOCUCAO_PROPAGANDA]={
       .length = DOUBLE_WORD,
       .nome = "TAMANHO_LOCUCAO_PROP",
       .ext = "NUM",
       .default_value = (void*) 0         
  },
  
  [ADR_TAMANHO_LOCUCAO_PEGA_PACOTE]={
       .length = DOUBLE_WORD,
       .nome = "TAMANHO_PEGA_PACOTE",
       .ext = "NUM",
       .default_value = (void*) 0         
  },
  
  [ADR_TAMANHO_LOCUCAO_PIPOCAS_PRONTAS]={
       .length = DOUBLE_WORD,
       .nome = "TAMANHO_PIPOCAS_PRONTAS",
       .ext = "NUM",
       .default_value = (void*) 0         
  },
  [ADR_TEMPERATURA_PREPARACAO]={
       .length = DOUBLE_WORD,
       .nome = "TEMPERATURA_PREPARO",
       .ext = "NUM",
       .default_value = (void*) 0       
  },
  [ADR_VELOCIDADE_PREPARACAO]={
       .length = DOUBLE_WORD,
       .nome = "VELOCIDADE_PREPARAO",
       .ext = "NUM",
       .default_value = (void*) 0       
  },
  [ADR_TEMPO_EMBALAGEM]={
       .length = DOUBLE_WORD,
       .nome = "TEMPO_MOTOR_EMBALAGEM",
       .ext = "NUM",
       .default_value = (void*) 0     
  },
  [ADR_VOLUME_MUSICA]={
       .length = DOUBLE_WORD,
       .nome = "VOLUME_MUSICA",
       .ext = "NUM",
       .default_value = (void*) 0   
  },
  [ADR_VOLUME_VOZ]={
       .length = DOUBLE_WORD,
       .nome = "VOLUME_LOCUCAO",
       .ext = "NUM",
       .default_value = (void*) 0  
  },
  [ADR_INTERVALO_TEMPO_PROP]={
       .length = DOUBLE_WORD,
       .nome = "INTERVALO_PROP",
       .ext = "NUM",
       .default_value = (void*) 0      
  },
  [ADR_FLAG_FREE]={
       .length = BYTE,
       .nome = "FREE",
       .ext = "NUM",
       .default_value = (void*) 0x00
  },
  [ADR_FLAG_FITA_LED]={
       .length = BYTE,
       .nome = "FITA_LED",
       .ext = "NUM",
       .default_value = (void*) 0x00    
  },
  [ADR_FLAG_TROCO]={
       .length = BYTE,
       .nome = "TROCO_MOEDA",
       .ext = "NUM",
       .default_value = (void*) 0x00     
  },
  [ADR_SENHA_ADMIN]={
       .length = DOUBLE_WORD,
       .nome = "SENHA_ADMIN",
       .ext = "NUM",
       .default_value = (void*) 0x00         
  },
  [ADR_NUMERO_SERIE]={
       .length = DOUBLE_WORD,
       .nome = "NUMERO_SERIE",
       .ext = "NUM",
       .default_value = (void*) 0x00             
  },
  [ADR_COMISSAO_PONTO]={
       .length = DOUBLE_WORD,
       .nome = "COMISSAO_PONTO",
       .ext = "NUM",
       .default_value = (void*) 0x00                 
  },
  [ADR_FLAG_DESUMIDIFICADOR]={
       .length = BYTE,
       .nome = "FLG_DESUMID",
       .ext = "NUM",
       .default_value = (void*) 0x00       
  },
  [ADR_MENSAGEM_CLIENTE_01]={
       .length = 16,
       .nome = "SG_CLIENTE_01",
       .ext = "TXT",
       .default_value = (void*) "  GRUPO ALTECH  "
  },
  [ADR_CONTADOR_PIPOCAS_TESTE]={
       .length = DOUBLE_WORD,
       .nome = "cnt_pip_teste",
       .ext = "NUM",
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
  },
  [ADR_TIPOS_MOEDAS]={
       .length = WORD,
       .nome = "TIPOS_MONEADA",
       .ext = "i16",
       .default_value = (void*) "  GRUPO ALTECH  "        
  }
};






#endif//_TABELA_PARAMETROS_H_