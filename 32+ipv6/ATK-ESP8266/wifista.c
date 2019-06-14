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
//本程序只供学习使用，未经作者许可，不得用于其它任何用途
//ALIENTEK STM32开发板
//ATK-ESP8266 WIFI模块 WIFI STA驱动代码	   
//正点原子@ALIENTEK
//技术论坛:www.openedv.com
//修改日期:2015/4/3
//版本：V1.0
//版权所有，盗版必究。
//Copyright(C) 广州市星翼电子科技有限公司 2009-2019
//All rights reserved									  
/////////////////////////////////////////////////////////////////////////////////////////////////////////// 

//ATK-ESP8266 WIFI STA测试
//用于测试TCP/UDP连接
//返回值:0,正常
//    其他,错误代码

u8 atk_8266_wifista_test()
{
	extern u8 temperature;  	    
	extern u8 humidity;
	extern u8 mpu6050;
	extern u16 adcx0,adcx1;		
	extern float pitch,roll,yaw; 		//欧拉角
	//u8 netpro=0;	//网络模式
	u8 key;
	u8 ipbuf[16]; 	//IP缓存
	u8 *p;
	u16 t=999;		//加速第一次获取链接状态
	u8 res=0;
	u8 netpro=0;	//网络模式
	u8 timex=0; 
	u16 rlen=0;
	u8 constate=0;	//连接状态
	p=mymalloc(32);							//申请32字节内存
	atk_8266_send_cmd("AT+CWMODE=1","OK",50);		//设置WIFI STA模式
	atk_8266_send_cmd("AT+RST","OK",20);		//DHCP服务器关闭(仅AP模式有效) 
	delay_ms(1000);         //延时3S等待重启成功
	delay_ms(1000);
	delay_ms(1000);
	delay_ms(1000);
	//设置连接到的WIFI网络名称/加密方式/密码,这几个参数需要根据您自己的路由器设置进行修改!! 
	sprintf((char*)p,"AT+CWJAP=\"%s\",\"%s\"",wifista_ssid,wifista_password);//设置无线参数:ssid,密码
	while(atk_8266_send_cmd(p,"OK",300));					//连接目标路由器,并且获得IP
PRESTA:
	netpro=1;	//选择网络模式
			
			LCD_Clear(WHITE);
			POINT_COLOR=RED;
			
			LCD_ShowString(30,30,240,16,16,"ATK-ESP WIFI-STA test");
			LCD_ShowString(30,50,200,16,12,"ATK-ESP is being configured,waiting");
			
			if(atk_8266_ip_set("WIFI-STA 远端IP设置",(u8*)ATK_ESP8266_WORKMODE_TBL[netpro],(u8*)portnum,ipbuf))goto PRESTA;	//IP输入
		
			atk_8266_send_cmd("AT+CIPMUX=0","OK",20);   //0：单连接，1：多连接
			sprintf((char*)p,"AT+CIPSTART=\"TCP\",\"%s\",%s",ipbuf,(u8*)portnum);    //配置目标TCP服务器
			LCD_ShowString(30,65,200,12,12,p);
			LCD_Clear(WHITE);
				while(atk_8266_send_cmd(p,"OK",200))
			{
					LCD_Clear(WHITE);
					POINT_COLOR=RED;
					Show_Str_Mid(0,40,"WK_UP:返回重选",16,240);
					Show_Str_Mid(0,80,"ATK-ESP 连接TCP Server失败",12,240); //连接失败	
					key=KEY_Scan(0);
					if(key==WKUP_PRES)goto PRESTA;
			}	
			atk_8266_send_cmd("AT+CIPMODE=1","OK",200);      //传输模式为：透传			
			LCD_Clear(WHITE);
			POINT_COLOR=RED;			
			LCD_ShowString(30,30,240,16,16,"-----------------------");
			LCD_ShowString(30,50,200,16,12,"ATK-ESP is being configured, waiting");			
			LCD_Fill(30,50,239,50+12,WHITE);			//清除之前的显示
			LCD_Fill(30,80,239,80+12,WHITE);
	
			
			atk_8266_get_wanip(ipbuf);//服务器模式,获取WAN IP
			sprintf((char*)p,"IP address:%s port:%s",ipbuf,(u8*)portnum);		
			LCD_ShowString(30,65,200,12,12,p);//显示IP地址和端口
			LCD_ShowString(30,100,200,12,12,"Send :");
			LCD_ShowString(60,120,200,16,16,"temperature:");
			LCD_ShowString(60,140,200,16,16,"humidity:");
			LCD_ShowString(60,160,200,16,16,"MQ2:");
			LCD_ShowString(60,180,200,16,16,"MQ135:");
			atk_8266_wificonf_show(60,220,"请设置路由器无线参数为:",(u8*)wifista_ssid,(u8*)wifista_encryption,(u8*)wifista_password);
			POINT_COLOR=BLUE;
			Show_Str(120+30,80,200,12,(u8*)ATK_ESP8266_WORKMODE_TBL[netpro],12,0); 		//连接状态
			USART2_RX_STA=0;
			

			while(1)
			{
				
				//发送数据
				key=KEY_Scan(0);
				if(key==WKUP_PRES)			//WK_UP 退出测试		 
				{ 
					res=0;					
					atk_8266_quit_trans();	//退出透传
					atk_8266_send_cmd("AT+CIPMODE=0","OK",20);   //关闭透传模式
					break;												 
				}
				else //发送数据
				{	
					DHT11_Read_Data(&temperature,&humidity);	//读取温湿度值			
					
					LCD_ShowNum(160,120,temperature,2,16);	//显示温度     		
					LCD_ShowNum(160,140,humidity,2,16);		//显示湿度	
					
					adcx0=Get_Adc_Average(ADC_Channel_0,10);
					LCD_ShowxNum(150,160,adcx0,4,16,0);//显示ADC的值(浊度)
					adcx1=Get_Adc_Average(ADC_Channel_1,10);
					LCD_ShowxNum(150,180,adcx1,4,16,0);//显示ADC的值
							
					
					atk_8266_quit_trans();
					atk_8266_send_cmd("AT+CIPSEND","OK",20);   
					sprintf((char*)p,"0001:%02d;0002:%02d;0003:%04d;0004:%04d;0005:%01d;\r\n",temperature,humidity,adcx0,adcx1,mpu6050);//测试数据
						//atk_8266_send_cmd("AT+CIPSEND=0,44","OK",200);  //发送指定长度的数据
						delay_ms(100);
					atk_8266_send_data(p,"OK",100);  //发送指定长度的数据
				};
				atk_8266_at_response(1);
			}		
		
	myfree(p);		//释放内存 
	return res;		
} 



