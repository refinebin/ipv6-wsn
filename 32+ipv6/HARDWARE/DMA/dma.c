#include "stm32f10x.h"
#include "dma.h"
extern u8 buf[];
void DMA_Config()
{
	DMA_InitTypeDef DMA_InitStructure;
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1,ENABLE);
	DMA_InitStructure.DMA_PeripheralBaseAddr=(u32) &ADC1->DR;					//外设地址为ADC1的数据寄存器地址
	DMA_InitStructure.DMA_MemoryBaseAddr=(u32) buf;								//内存地址为变量buf的地址
	DMA_InitStructure.DMA_DIR=DMA_DIR_PeripheralSRC; 							//DMA方向为外设到内存
	DMA_InitStructure.DMA_MemoryInc=DMA_MemoryInc_Enable;						//内存地址递增
	DMA_InitStructure.DMA_PeripheralInc=DMA_PeripheralInc_Disable;				//外设地址不递增	
	DMA_InitStructure.DMA_PeripheralDataSize=DMA_PeripheralDataSize_HalfWord;	//外设数据宽度为16位
	DMA_InitStructure.DMA_MemoryDataSize=DMA_MemoryDataSize_HalfWord;			//内存数据宽度为16位
	DMA_InitStructure.DMA_Mode=DMA_Mode_Normal;									//普通模式（非连续模式)
	DMA_InitStructure.DMA_Priority=DMA_Priority_Medium;							//中等优先级
	DMA_InitStructure.DMA_M2M=DMA_M2M_Disable;									//禁止内存到内存模式
	DMA_Init(DMA1_Channel1,&DMA_InitStructure);									//初始化通道1
	
		
}
