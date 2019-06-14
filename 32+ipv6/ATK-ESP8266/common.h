#ifndef __COMMON_H__
#define __COMMON_H__	 
#include "sys.h"
#include "usart.h"		
#include "delay.h"	
#include "led.h"   	 
#include "key.h"	 	 	 	 	 
#include "lcd.h"  	   	 
#include "malloc.h"
#include "string.h"    
//#include "text.h"		
#include "usart2.h" 
/////////////////////////////////////////////////////////////////////////////////////////////////////////// 
//������ֻ��ѧϰʹ�ã�δ��������ɣ��������������κ���;
//ALIENTEK STM32������
//ATK-ESP8266 WIFIģ�� ������������	   
//����ԭ��@ALIENTEK
//������̳:www.openedv.com
//�޸�����:2014/4/3
//�汾��V1.0
//��Ȩ���У�����ؾ���
//Copyright(C) ������������ӿƼ����޹�˾ 2009-2019
//All rights reserved									  
/////////////////////////////////////////////////////////////////////////////////////////////////////////// 
	

/////////////////////////////////////////////////////////////////////////////////////////////////////////// 
void atk_8266_init(void);


void atk_8266_at_response(u8 mode);
u8* atk_8266_check_cmd(u8 *str);

u8 atk_8266_send_data(u8 *data,u8 *ack,u16 waittime);
u8 atk_8266_send_cmd(u8 *cmd,u8 *ack,u16 waittime);
u8 atk_8266_quit_trans(void);
u8 atk_8266_consta_check(void);

void atk_8266_get_wanip(u8* ipbuf);
void atk_8266_load_keyboard(u16 x,u16 y);
void atk_8266_test(void);
void atk_8266_wificonf_show(u16 x,u16 y,u8* rmd,u8* ssid,u8* encryption,u8* password);
u8 atk_8266_ip_set(u8* title,u8* mode,u8* port,u8* ip);

u8 atk_8266_wifista_test(void);	//WIFI STA����


//�û����ò���
extern const u8* portnum;			//���Ӷ˿�
 
extern const u8* wifista_ssid;		//WIFI STA SSID
extern const u8* wifista_encryption;//WIFI STA ���ܷ�ʽ
extern const u8* wifista_password; 	//WIFI STA ����

extern const u8* ATK_ESP8266_WORKMODE_TBL[3];

#endif





