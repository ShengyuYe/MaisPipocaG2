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
|       Arquivo            :  parametros.c
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

/************************************************************************************
*       Includes
************************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "..\includes.h"

/************************************************************************************
*       Definições locais
************************************************************************************/


/************************************************************************************
*       Constantes
************************************************************************************/


/************************************************************************************
*       Variaveis locais
************************************************************************************/
unsigned int MCS_contadorSemente=0;

/************************************************************************************
*       Funções locais
************************************************************************************/


/************************************************************************************
*       Implementação das funções
************************************************************************************/

/************************************************************************************
*       Descrição       :       Tela para o usuário informar uma senha
*       Parametros      :       (unsigned int) senha de acesso
*       Retorno         :       nenhum
************************************************************************************/
unsigned char TELASENHA_telaSenha(unsigned short int senha){
  eTECLA tecla;
  unsigned char indiceDigito=0;
  char digitoSenha[5]={"0000"};
  unsigned short int temp;  
  unsigned char toggle=0;
  unsigned char ciclos=1;
  char bufferLinha[5];
  
  HD44780_clearText();
  HD44780_writeString(" Informe a senha");
  
  for(;TECLADO_getContadorInatividade();){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           indiceDigito++;
           if(indiceDigito>3){
             
             temp = ((digitoSenha[0]-'0')*1000) + ((digitoSenha[1]-'0')*100) + ((digitoSenha[2]-'0')*10) + (digitoSenha[3]-'0');
             if(temp==senha)
               return 255;
             else{
               
               HD44780_clearText();
               HD44780_writeString("Senha");
               HD44780_posicionaTexto(0,1);
               HD44780_writeString("incorreta!");
               
               vTaskDelay(3000);
               
               HD44780_clearText();
             }             
             return 0;
           }
           break;
      case TECLA_ESC:
           return 0;
      case TECLA_INC:
           digitoSenha[indiceDigito]++;
           if(digitoSenha[indiceDigito]>'9')
             digitoSenha[indiceDigito] = '0';
           break;
      case TECLA_DEC:
           digitoSenha[indiceDigito]--;
           if(digitoSenha[indiceDigito]<'0')
             digitoSenha[indiceDigito] = '9';
           break;
    }
    
    if(!--ciclos){
      
      ciclos = 4;
      toggle = ~toggle;
      memcpy(bufferLinha,digitoSenha,4);
      bufferLinha[4] = 0x00;
      if(toggle)
        bufferLinha[indiceDigito] = '_';
      
      HD44780_posicionaTexto(6,1);
      HD44780_writeString(bufferLinha);
    }        
    
    vTaskDelay(50);
  }      
  
  return 0;
}
/************************************************************************************
*       Descrição       :       Tela para o usuário informar uma
*                               senha 
*       Parametros      :       nenhum
*       Retorno         :       (unsigned int) senha digitada
************************************************************************************/
unsigned int TELASENHA_get_senha(char *msg){
  eTECLA tecla;
  unsigned char indiceDigito=0;
  char digitoSenha[5]={"0000"};
  unsigned short int temp;  
  unsigned char toggle=0;
  unsigned char ciclos=1;
  char bufferLinha[5];
  
  HD44780_clearText();
  HD44780_writeString(msg);
  
  for(;TECLADO_getContadorInatividade();){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           indiceDigito++;
           if(indiceDigito>3){
             
             temp = ((digitoSenha[0]-'0')*1000) + ((digitoSenha[1]-'0')*100) + ((digitoSenha[2]-'0')*10) + (digitoSenha[3]-'0');
             return temp;
           }
           break;
      case TECLA_ESC:
           return 0;
      case TECLA_INC:
           digitoSenha[indiceDigito]++;
           if(digitoSenha[indiceDigito]>'9')
             digitoSenha[indiceDigito] = '0';
           break;
      case TECLA_DEC:
           digitoSenha[indiceDigito]--;
           if(digitoSenha[indiceDigito]<'0')
             digitoSenha[indiceDigito] = '9';
           break;
    }
    
    if(!--ciclos){
      
      ciclos = 4;
      toggle = ~toggle;
      memcpy(bufferLinha,digitoSenha,4);
      bufferLinha[4] = 0x00;
      if(toggle)
        bufferLinha[indiceDigito] = '_';
      
      HD44780_posicionaTexto(6,1);
      HD44780_writeString(bufferLinha);
    }        
    
    vTaskDelay(50);
  }      
  
  return 0xFFFF;
}
/************************************************************************************
*       Descrição       :       Tela de contrasenha do sistema
*       Parametros      :       nenhum
*       Retorno         :       (unsigned char) maior do que zero
*                                               se validar a contrasenha
************************************************************************************/
unsigned char TELASENHA_checa_contrasenha(char*msg){
 eTECLA tecla;
  char bufferLinha[17];
  char bufferTmp[17];
  unsigned char indice=0;
  unsigned char toggle=0;
  unsigned char ciclos=1;
  unsigned short int senha;
  
  srand(MCS_contadorSemente);
  unsigned short int contraSenha = rand()%10000;
  
  sprintf(bufferLinha,"TOKEN:%04d",contraSenha);  
  STRING_write_to_internal(CLEAR_DISPLAY,
                           bufferLinha,
                           NULL);
    
  HD44780_posicionaTexto(0,1);
  HD44780_writeString("CODE :");  
  
  sprintf(bufferLinha,"000000");
  
  for(;TECLADO_getContadorInatividade();){
    
    tecla = TECLADO_getch();
    switch(tecla){
      case TECLA_ENTER:
           if(indice>4){
             
             unsigned int recebido = ((bufferLinha[0]-'0')*100000) + 
                                     ((bufferLinha[1]-'0')*10000) + 
                                     ((bufferLinha[2]-'0')*1000) + 
                                     ((bufferLinha[3]-'0')*100) + 
                                     ((bufferLinha[4]-'0')*10) + 
                                     ((bufferLinha[5]-'0'));
             
             recebido &= 0x3FFFF;             
             
             senha = ((recebido&0x3FFF)^3004);
               HD44780_clearText();             
             if(senha==contraSenha){                     
               return 255;               
             }             
             return 0;             
           }
           else{
             indice++;
             break;
           }
      case TECLA_ESC:
           return 0;
      case TECLA_INC:
           bufferLinha[indice]++;
           if(bufferLinha[indice]>'9')
             bufferLinha[indice] = '0';
           break;
      case TECLA_DEC:    
           bufferLinha[indice]--;
           if(bufferLinha[indice]<'0')
             bufferLinha[indice] = '9';
           break;
    }
    
    if(!--ciclos){
      ciclos = 4;
      toggle = ~toggle;
      memcpy(bufferTmp,bufferLinha,17);
      bufferTmp[7] = 0x00;
      if(toggle)
        bufferTmp[indice] = '_';
              
      HD44780_posicionaTexto(7,1);
      HD44780_writeString(bufferTmp);
    }       
    
    vTaskDelay(50);
  }      
  
  return 0;
}
/************************************************************************************
*       Fim do arquivo
************************************************************************************/