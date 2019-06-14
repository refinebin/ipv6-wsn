#include "timer.h"
#include "led.h"
#include "common.h"
#include "stdlib.h"
#include "adc.h"
#include "dht11.h"
#include "mpu6050.h"

#include "usmart.h"   
#include "inv_mpu.h"
#include "inv_mpu_dmp_motion_driver.h" 
	u8 t=0;
	u8 mpu6050=0;
	u8 temperature;  	    
	u8 humidity;
	u8 door;
	u16 adcx0,adcx1;	
	
	int temp;					//温度	
	unsigned char DefaultKey[6] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}; 
	unsigned char g_ucTempbuf[20];

//////////////////////////////////////////////////////////////////////////////////	 
//本程序只供学习使用，未经作者许可，不得用于其它任何用途
//Mini STM32开发板
//通用定时器 驱动代码			   
//正点原子@ALIENTEK
//技术论坛:www.openedv.com
//修改日期:2010/12/03
//版本：V1.0
//版权所有，盗版必究。
//Copyright(C) 正点原子 2009-2019
//All rights reserved
////////////////////////////////////////////////////////////////////////////////// 	  
 

//通用定时器中断初始化
//这里时钟选择为APB1的2倍，而APB1为36M
//arr：自动重装值。
//psc：时钟预分频数
//这里使用的是定时器3!
void TIM3_Int_Init(u16 arr,u16 psc)
{

   TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
	NVIC_InitTypeDef NVIC_InitStructure;

	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3, ENABLE); //时钟使能

	TIM_TimeBaseStructure.TIM_Period = arr; //设置在下一个更新事件装入活动的自动重装载寄存器周期的值	 计数到5000为500ms
	TIM_TimeBaseStructure.TIM_Prescaler =psc; //设置用来作为TIMx时钟频率除数的预分频值  10Khz的计数频率  
	TIM_TimeBaseStructure.TIM_ClockDivision = 0; //设置时钟分割:TDTS = Tck_tim
	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;  //TIM向上计数模式
	TIM_TimeBaseInit(TIM3, &TIM_TimeBaseStructure); //根据TIM_TimeBaseInitStruct中指定的参数初始化TIMx的时间基数单位
 
	TIM_ITConfig(  //使能或者失能指定的TIM中断
		TIM3, //TIM2
		TIM_IT_Update ,
		ENABLE  //使能
		);
	NVIC_InitStructure.NVIC_IRQChannel = TIM3_IRQn;  //TIM3中断
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;  //先占优先级0级
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 3;  //从优先级3级
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE; //IRQ通道被使能
	NVIC_Init(&NVIC_InitStructure);  //根据NVIC_InitStruct中指定的参数初始化外设NVIC寄存器

	TIM_Cmd(TIM3, ENABLE);  //使能TIMx外设
							 
}

void TIM3_IRQHandler(void)   //TIM3中断
{
		
	if (TIM_GetITStatus(TIM3, TIM_IT_Update) != RESET) //检查指定的TIM中断发生与否:TIM 中断源 
		{
		TIM_ClearITPendingBit(TIM3, TIM_IT_Update  );  //清除TIMx的中断待处理位:TIM 中断源 
		
		if(t>=79){

//				if(mpu_dmp_get_data(&pitch,&roll,&yaw)==0)
//				{ 

//					MPU_Get_Accelerometer(&aacx,&aacy,&aacz);	//得到加速度传感器数据
//					MPU_Get_Gyroscope(&gyrox,&gyroy,&gyroz);	//得到陀螺仪数据		

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
//					t=90;
//					LED1=!LED1;//LED闪烁
//				}

		}t++;
		}
}
		












