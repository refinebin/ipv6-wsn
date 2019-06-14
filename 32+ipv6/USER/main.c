#include "delay.h"
#include "sys.h"
#include "usart.h"
#include "lcd.h"
#include "dht11.h"
#include "usmart.h" 
#include "adc.h"	
#include "common.h" 
#include "dma.h" 
#include "key.h"	
#include "usart2.h"	
#include "mpu6050.h"
#include "usmart.h"   
#include "inv_mpu.h"
#include "inv_mpu_dmp_motion_driver.h" 
#include "timer.h"
#include "spi.h"
#include "24l01.h"  

//ALIENTEK Mini STM32开发板扩展实验15
//ATK-RM04 WIFI模块测试实验
//技术支持：www.openedv.com
//广州市星翼电子科技有限公司  
	u16 buf[5];
	u8 tmp_buf[33];
	float pitch,roll,yaw; 		//欧拉角
	short aacx,aacy,aacz;		//加速度传感器原始数据
	short gyrox,gyroy,gyroz;	//陀螺仪原始数据

 int main(void)
 { 
	extern u8 temperature;  	    
	extern u8 humidity;
	extern u8 mpu6050;
	extern u16 adcx0,adcx1;		
	extern float pitch,roll,yaw; 		//欧拉角
	delay_init();	    	 //延时函数初始化
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2); //设置NVIC中断分组2:2位抢占优先级，2位响应优先级	  
	uart_init(9600);	 	//串口初始化为9600	
	USART2_Init(115200);  //初始化串口2波特率为115200
	usmart_dev.init(72);		//初始化USMART
  LCD_Init();				//初始化液晶 
	KEY_Init();	
	LED_Init();
	DMA_Config();	
	MPU_Init();					//初始化MPU6050
  Adc_Init();
	NRF24L01_Init();    	//初始化NRF24L01  
	TIM3_Int_Init(1999,7199);//10Khz的计数频率，计数到5000为500ms  
	 
	POINT_COLOR=RED;		//设置字体为红色 
//		while(mpu_dmp_init())//6050初始化
// 	{
//		LCD_ShowString(30,130,200,16,16,"MPU6050 Error");
//		delay_ms(200);
//		LCD_Fill(30,130,239,130+16,WHITE);
// 		delay_ms(200);
//	}  
//	
	while(DHT11_Init())	//DHT11初始化	
	{
		LCD_ShowString(30,130,200,16,16,"DHT11 Error");
		delay_ms(200);
		LCD_Fill(30,130,239,130+16,WHITE);
 		delay_ms(200);
	}	
		LCD_Clear(WHITE);
		LCD_ShowString(30,50,200,16,16,"MiniStm STM32");	
		LCD_ShowString(30,100,200,12,12,"Send :");
		LCD_ShowString(60,120,200,16,16,"temperature:");
		LCD_ShowString(60,140,200,16,16,"humidity:");
		LCD_ShowString(60,160,200,16,16,"MQ2:");
		LCD_ShowString(60,180,200,16,16,"MQ7:");
   	LCD_ShowString(60,200,200,16,16,"Receive:");
	while(NRF24L01_Check())	//检查NRF24L01是否在位.	
	{
		LCD_ShowString(60,130,200,16,16,"NRF24L01 Error");
		delay_ms(200);
		LCD_Fill(60,130,239,130+16,WHITE);
 		delay_ms(200);
	}	
		NRF24L01_RX_Mode();		  
		while(1)
		{	  		    		    				 
			if(NRF24L01_RxPacket(tmp_buf)==0)//一旦接收到信息,则显示出来.
			{
				tmp_buf[32]=0;//加入字符串结束符
				LCD_ShowString(160,200,239,32,16,tmp_buf); 
				DHT11_Read_Data(&temperature,&humidity);	//读取温湿度值			
					if(tmp_buf[0]=='1')
						mpu6050=1;
					else
						mpu6050=0;
				LCD_ShowNum(160,120,temperature,2,16);	//显示温度     		
				LCD_ShowNum(160,140,humidity,2,16);		//显示湿度	
				adcx0=Get_Adc_Average(ADC_Channel_0,10);
				LCD_ShowxNum(150,160,adcx0,4,16,0);//显示ADC的值(浊度)
				adcx1=Get_Adc_Average(ADC_Channel_1,10);
				LCD_ShowxNum(150,180,adcx1,4,16,0);//显示ADC的值
				printf("0001:%02d;0002:%02d;0003:%04d;0004:%04d;0005:%01d;\r\n",temperature,humidity,adcx0,adcx1,mpu6050);					




				
			}else delay_us(100);	   			    
		};	
//	 while(1){
//		 	if(mpu_dmp_get_data(&pitch,&roll,&yaw)==0)
//				{ 

//					MPU_Get_Accelerometer(&aacx,&aacy,&aacz);	//得到加速度传感器数据
//					MPU_Get_Gyroscope(&gyrox,&gyroy,&gyroz);	//得到陀螺仪数据	

//					DHT11_Read_Data(&temperature,&humidity);	//读取温湿度值			
//					
//					LCD_ShowNum(160,120,temperature,2,16);	//显示温度     		
//					LCD_ShowNum(160,140,humidity,2,16);		//显示湿度	
//					adcx0=Get_Adc_Average(ADC_Channel_0,10);
//					LCD_ShowxNum(150,160,adcx0,4,16,0);//显示ADC的值(浊度)
//					adcx1=Get_Adc_Average(ADC_Channel_1,10);
//					LCD_ShowxNum(150,180,adcx1,4,16,0);//显示ADC的值
//					printf("0001:%02d;0002:%02d;0003:%04d;0004:%04d;0005:%01d;\r\n",temperature,humidity,adcx0,adcx1,mpu6050);					

//		//报警判断    烟雾 有毒气体浓度过高 温湿度过高  某一条都能触发蜂鸣器
//				if(adcx0>=1500||adcx1>1500||temperature>=45||humidity>=96||pitch>=1.7||roll>=1.7||yaw>=1.7)
//				{
//					LED0=0;         //响 提示报警
//					PAout(15)=1;
//				}else{
//				
//					LED0=1; 						 //不响
//					PAout(15)=0;
//				}
//				
//				if(pitch>=1.7||roll>=1.7||yaw>=1.7)
//				{
//						mpu6050=1;//开门
//						PAout(5)=0;//置低
//					
//						
//				}else{
//						mpu6050=0;//正常
//						PAout(5)=1;//置高
//				}
//				
//					LED1=!LED1;//LED闪烁
//				}
//		 
//		 
//		 
//		 
//		 
//		 
//				delay_ms(100);
//	 }
//	

}
 
