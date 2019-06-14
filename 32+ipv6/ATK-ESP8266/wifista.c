#include "common.h"
#include "stdlib.h"
#include "adc.h"
#include "dht11.h"
#include "mpu6050.h"
#include "usmart.h"   
#include "inv_mpu.h"
#include "inv_mpu_dmp_motion_driver.h" 
#include "text.h"
/////////////////////////////////////////////////////////////////////////////////////////////////////////// 
//������ֻ��ѧϰʹ�ã�δ��������ɣ��������������κ���;
//ALIENTEK STM32������
//ATK-ESP8266 WIFIģ�� WIFI STA��������	   
//����ԭ��@ALIENTEK
//������̳:www.openedv.com
//�޸�����:2015/4/3
//�汾��V1.0
//��Ȩ���У�����ؾ���
//Copyright(C) ������������ӿƼ����޹�˾ 2009-2019
//All rights reserved									  
/////////////////////////////////////////////////////////////////////////////////////////////////////////// 

//ATK-ESP8266 WIFI STA����
//���ڲ���TCP/UDP����
//����ֵ:0,����
//    ����,�������

u8 atk_8266_wifista_test()
{
	extern u8 temperature;  	    
	extern u8 humidity;
	extern u8 mpu6050;
	extern u16 adcx0,adcx1;		
	extern float pitch,roll,yaw; 		//ŷ����
	//u8 netpro=0;	//����ģʽ
	u8 key;
	u8 ipbuf[16]; 	//IP����
	u8 *p;
	u16 t=999;		//���ٵ�һ�λ�ȡ����״̬
	u8 res=0;
	u8 netpro=0;	//����ģʽ
	u8 timex=0; 
	u16 rlen=0;
	u8 constate=0;	//����״̬
	p=mymalloc(32);							//����32�ֽ��ڴ�
	atk_8266_send_cmd("AT+CWMODE=1","OK",50);		//����WIFI STAģʽ
	atk_8266_send_cmd("AT+RST","OK",20);		//DHCP�������ر�(��APģʽ��Ч) 
	delay_ms(1000);         //��ʱ3S�ȴ������ɹ�
	delay_ms(1000);
	delay_ms(1000);
	delay_ms(1000);
	//�������ӵ���WIFI��������/���ܷ�ʽ/����,�⼸��������Ҫ�������Լ���·�������ý����޸�!! 
	sprintf((char*)p,"AT+CWJAP=\"%s\",\"%s\"",wifista_ssid,wifista_password);//�������߲���:ssid,����
	while(atk_8266_send_cmd(p,"OK",300));					//����Ŀ��·����,���һ��IP
PRESTA:
	netpro=1;	//ѡ������ģʽ
			
			LCD_Clear(WHITE);
			POINT_COLOR=RED;
			
			LCD_ShowString(30,30,240,16,16,"ATK-ESP WIFI-STA test");
			LCD_ShowString(30,50,200,16,12,"ATK-ESP is being configured,waiting");
			
			if(atk_8266_ip_set("WIFI-STA Զ��IP����",(u8*)ATK_ESP8266_WORKMODE_TBL[netpro],(u8*)portnum,ipbuf))goto PRESTA;	//IP����
		
			atk_8266_send_cmd("AT+CIPMUX=0","OK",20);   //0�������ӣ�1��������
			sprintf((char*)p,"AT+CIPSTART=\"TCP\",\"%s\",%s",ipbuf,(u8*)portnum);    //����Ŀ��TCP������
			LCD_ShowString(30,65,200,12,12,p);
			LCD_Clear(WHITE);
				while(atk_8266_send_cmd(p,"OK",200))
			{
					LCD_Clear(WHITE);
					POINT_COLOR=RED;
					Show_Str_Mid(0,40,"WK_UP:������ѡ",16,240);
					Show_Str_Mid(0,80,"ATK-ESP ����TCP Serverʧ��",12,240); //����ʧ��	
					key=KEY_Scan(0);
					if(key==WKUP_PRES)goto PRESTA;
			}	
			atk_8266_send_cmd("AT+CIPMODE=1","OK",200);      //����ģʽΪ��͸��			
			LCD_Clear(WHITE);
			POINT_COLOR=RED;			
			LCD_ShowString(30,30,240,16,16,"-----------------------");
			LCD_ShowString(30,50,200,16,12,"ATK-ESP is being configured, waiting");			
			LCD_Fill(30,50,239,50+12,WHITE);			//���֮ǰ����ʾ
			LCD_Fill(30,80,239,80+12,WHITE);
	
			
			atk_8266_get_wanip(ipbuf);//������ģʽ,��ȡWAN IP
			sprintf((char*)p,"IP address:%s port:%s",ipbuf,(u8*)portnum);		
			LCD_ShowString(30,65,200,12,12,p);//��ʾIP��ַ�Ͷ˿�
			LCD_ShowString(30,100,200,12,12,"Send :");
			LCD_ShowString(60,120,200,16,16,"temperature:");
			LCD_ShowString(60,140,200,16,16,"humidity:");
			LCD_ShowString(60,160,200,16,16,"MQ2:");
			LCD_ShowString(60,180,200,16,16,"MQ135:");
			atk_8266_wificonf_show(60,220,"������·�������߲���Ϊ:",(u8*)wifista_ssid,(u8*)wifista_encryption,(u8*)wifista_password);
			POINT_COLOR=BLUE;
			Show_Str(120+30,80,200,12,(u8*)ATK_ESP8266_WORKMODE_TBL[netpro],12,0); 		//����״̬
			USART2_RX_STA=0;
			

			while(1)
			{
				
				//��������
				key=KEY_Scan(0);
				if(key==WKUP_PRES)			//WK_UP �˳�����		 
				{ 
					res=0;					
					atk_8266_quit_trans();	//�˳�͸��
					atk_8266_send_cmd("AT+CIPMODE=0","OK",20);   //�ر�͸��ģʽ
					break;												 
				}
				else //��������
				{	
					DHT11_Read_Data(&temperature,&humidity);	//��ȡ��ʪ��ֵ			
					
					LCD_ShowNum(160,120,temperature,2,16);	//��ʾ�¶�     		
					LCD_ShowNum(160,140,humidity,2,16);		//��ʾʪ��	
					
					adcx0=Get_Adc_Average(ADC_Channel_0,10);
					LCD_ShowxNum(150,160,adcx0,4,16,0);//��ʾADC��ֵ(�Ƕ�)
					adcx1=Get_Adc_Average(ADC_Channel_1,10);
					LCD_ShowxNum(150,180,adcx1,4,16,0);//��ʾADC��ֵ
							
					
					atk_8266_quit_trans();
					atk_8266_send_cmd("AT+CIPSEND","OK",20);   
					sprintf((char*)p,"0001:%02d;0002:%02d;0003:%04d;0004:%04d;0005:%01d;\r\n",temperature,humidity,adcx0,adcx1,mpu6050);//��������
						//atk_8266_send_cmd("AT+CIPSEND=0,44","OK",200);  //����ָ�����ȵ�����
						delay_ms(100);
					atk_8266_send_data(p,"OK",100);  //����ָ�����ȵ�����
				};
				atk_8266_at_response(1);
			}		
		
	myfree(p);		//�ͷ��ڴ� 
	return res;		
} 



