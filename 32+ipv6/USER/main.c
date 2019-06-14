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

//ALIENTEK Mini STM32��������չʵ��15
//ATK-RM04 WIFIģ�����ʵ��
//����֧�֣�www.openedv.com
//������������ӿƼ����޹�˾  
	u16 buf[5];
	u8 tmp_buf[33];
	float pitch,roll,yaw; 		//ŷ����
	short aacx,aacy,aacz;		//���ٶȴ�����ԭʼ����
	short gyrox,gyroy,gyroz;	//������ԭʼ����

 int main(void)
 { 
	extern u8 temperature;  	    
	extern u8 humidity;
	extern u8 mpu6050;
	extern u16 adcx0,adcx1;		
	extern float pitch,roll,yaw; 		//ŷ����
	delay_init();	    	 //��ʱ������ʼ��
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2); //����NVIC�жϷ���2:2λ��ռ���ȼ���2λ��Ӧ���ȼ�	  
	uart_init(9600);	 	//���ڳ�ʼ��Ϊ9600	
	USART2_Init(115200);  //��ʼ������2������Ϊ115200
	usmart_dev.init(72);		//��ʼ��USMART
  LCD_Init();				//��ʼ��Һ�� 
	KEY_Init();	
	LED_Init();
	DMA_Config();	
	MPU_Init();					//��ʼ��MPU6050
  Adc_Init();
	NRF24L01_Init();    	//��ʼ��NRF24L01  
	TIM3_Int_Init(1999,7199);//10Khz�ļ���Ƶ�ʣ�������5000Ϊ500ms  
	 
	POINT_COLOR=RED;		//��������Ϊ��ɫ 
//		while(mpu_dmp_init())//6050��ʼ��
// 	{
//		LCD_ShowString(30,130,200,16,16,"MPU6050 Error");
//		delay_ms(200);
//		LCD_Fill(30,130,239,130+16,WHITE);
// 		delay_ms(200);
//	}  
//	
	while(DHT11_Init())	//DHT11��ʼ��	
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
	while(NRF24L01_Check())	//���NRF24L01�Ƿ���λ.	
	{
		LCD_ShowString(60,130,200,16,16,"NRF24L01 Error");
		delay_ms(200);
		LCD_Fill(60,130,239,130+16,WHITE);
 		delay_ms(200);
	}	
		NRF24L01_RX_Mode();		  
		while(1)
		{	  		    		    				 
			if(NRF24L01_RxPacket(tmp_buf)==0)//һ�����յ���Ϣ,����ʾ����.
			{
				tmp_buf[32]=0;//�����ַ���������
				LCD_ShowString(160,200,239,32,16,tmp_buf); 
				DHT11_Read_Data(&temperature,&humidity);	//��ȡ��ʪ��ֵ			
					if(tmp_buf[0]=='1')
						mpu6050=1;
					else
						mpu6050=0;
				LCD_ShowNum(160,120,temperature,2,16);	//��ʾ�¶�     		
				LCD_ShowNum(160,140,humidity,2,16);		//��ʾʪ��	
				adcx0=Get_Adc_Average(ADC_Channel_0,10);
				LCD_ShowxNum(150,160,adcx0,4,16,0);//��ʾADC��ֵ(�Ƕ�)
				adcx1=Get_Adc_Average(ADC_Channel_1,10);
				LCD_ShowxNum(150,180,adcx1,4,16,0);//��ʾADC��ֵ
				printf("0001:%02d;0002:%02d;0003:%04d;0004:%04d;0005:%01d;\r\n",temperature,humidity,adcx0,adcx1,mpu6050);					




				
			}else delay_us(100);	   			    
		};	
//	 while(1){
//		 	if(mpu_dmp_get_data(&pitch,&roll,&yaw)==0)
//				{ 

//					MPU_Get_Accelerometer(&aacx,&aacy,&aacz);	//�õ����ٶȴ���������
//					MPU_Get_Gyroscope(&gyrox,&gyroy,&gyroz);	//�õ�����������	

//					DHT11_Read_Data(&temperature,&humidity);	//��ȡ��ʪ��ֵ			
//					
//					LCD_ShowNum(160,120,temperature,2,16);	//��ʾ�¶�     		
//					LCD_ShowNum(160,140,humidity,2,16);		//��ʾʪ��	
//					adcx0=Get_Adc_Average(ADC_Channel_0,10);
//					LCD_ShowxNum(150,160,adcx0,4,16,0);//��ʾADC��ֵ(�Ƕ�)
//					adcx1=Get_Adc_Average(ADC_Channel_1,10);
//					LCD_ShowxNum(150,180,adcx1,4,16,0);//��ʾADC��ֵ
//					printf("0001:%02d;0002:%02d;0003:%04d;0004:%04d;0005:%01d;\r\n",temperature,humidity,adcx0,adcx1,mpu6050);					

//		//�����ж�    ���� �ж�����Ũ�ȹ��� ��ʪ�ȹ���  ĳһ�����ܴ���������
//				if(adcx0>=1500||adcx1>1500||temperature>=45||humidity>=96||pitch>=1.7||roll>=1.7||yaw>=1.7)
//				{
//					LED0=0;         //�� ��ʾ����
//					PAout(15)=1;
//				}else{
//				
//					LED0=1; 						 //����
//					PAout(15)=0;
//				}
//				
//				if(pitch>=1.7||roll>=1.7||yaw>=1.7)
//				{
//						mpu6050=1;//����
//						PAout(5)=0;//�õ�
//					
//						
//				}else{
//						mpu6050=0;//����
//						PAout(5)=1;//�ø�
//				}
//				
//					LED1=!LED1;//LED��˸
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
 
