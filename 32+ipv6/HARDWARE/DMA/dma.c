#include "stm32f10x.h"
#include "dma.h"
extern u8 buf[];
void DMA_Config()
{
	DMA_InitTypeDef DMA_InitStructure;
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1,ENABLE);
	DMA_InitStructure.DMA_PeripheralBaseAddr=(u32) &ADC1->DR;					//�����ַΪADC1�����ݼĴ�����ַ
	DMA_InitStructure.DMA_MemoryBaseAddr=(u32) buf;								//�ڴ��ַΪ����buf�ĵ�ַ
	DMA_InitStructure.DMA_DIR=DMA_DIR_PeripheralSRC; 							//DMA����Ϊ���赽�ڴ�
	DMA_InitStructure.DMA_MemoryInc=DMA_MemoryInc_Enable;						//�ڴ��ַ����
	DMA_InitStructure.DMA_PeripheralInc=DMA_PeripheralInc_Disable;				//�����ַ������	
	DMA_InitStructure.DMA_PeripheralDataSize=DMA_PeripheralDataSize_HalfWord;	//�������ݿ��Ϊ16λ
	DMA_InitStructure.DMA_MemoryDataSize=DMA_MemoryDataSize_HalfWord;			//�ڴ����ݿ��Ϊ16λ
	DMA_InitStructure.DMA_Mode=DMA_Mode_Normal;									//��ͨģʽ��������ģʽ)
	DMA_InitStructure.DMA_Priority=DMA_Priority_Medium;							//�е����ȼ�
	DMA_InitStructure.DMA_M2M=DMA_M2M_Disable;									//��ֹ�ڴ浽�ڴ�ģʽ
	DMA_Init(DMA1_Channel1,&DMA_InitStructure);									//��ʼ��ͨ��1
	
		
}
