/*__________________________________________________________________________________
|	Chave Digital Tecnologia Eletronica Ltda. 
|       
|       Blumenau - SC
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
|       Arquivo            :  SST25VFXX.h
|       Descrição          :  Driver para acesso à memoria
|                             SST25
| 
|       Autor              :  Marcos Aquino
|       Data criação       :  27/04/2012
|
|       Revisões           :  1.0.0.0
|
|
| __________________________________________________________________________________
*/
#ifndef _SST25VFXX_H_
#define _SST25VFXX_H_

/********************************************************************************
*   Estrutura
********************************************************************************/
typedef struct{
  unsigned char busy:1;
  unsigned char wel :1;
  unsigned char bp0 :1;  
  unsigned char bp1 :1;
  unsigned char bp2 :1;
  unsigned char bp3 :1;
  unsigned char aai :1;
  unsigned char bpl :1;    
}SST_status;

/********************************************************************************
*   Funções disponíveis para os outros módulos
********************************************************************************/
void SST25VF_init(unsigned long int busClk);

unsigned short int SST_readID(void);

void SST25VF_readStatus(SST_status* status);
unsigned char SST25VF_writeStatus(SST_status *status);

void SST_writeEnable(void);
void SST_writeDisable(void);

void SST_highSpeedRead(unsigned int endereco,unsigned char *buffer,                       
                       unsigned short int size);

void SST_writeByte(unsigned int endereco,unsigned char valor);
void SST_writeAutoAddressInc(unsigned int endereco,unsigned char *pData,
                             unsigned short int size);

void SST_erase4kbSector(unsigned int sector);
void SST_erase32kbSector(unsigned int sector);
void SST_erase64kbSector(unsigned int sector);
void SST_chipErase(void);

/********************************************************************************
*   Fim do arquivo
********************************************************************************/
#endif//_SST25VFXX_H_