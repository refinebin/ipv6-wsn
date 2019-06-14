#ifndef __DHT11_H
#define __DHT11_H 
#include "sys.h"   
//////////////////////////////////////////////////////////////////////////////////	 
//������ֻ��ѧϰʹ�ã�δ��������ɣ��������������κ���;
//ALIENTEKս��STM32������
//DHT11������ʪ�ȴ�������������	   
//����ԭ��@ALIENTEK
//������̳:www.openedv.com
//�޸�����:2012/9/12
//�汾��V1.0
//��Ȩ���У�����ؾ���
//Copyright(C) ������������ӿƼ����޹�˾ 2009-2019
//All rights reserved									  
//////////////////////////////////////////////////////////////////////////////////
 
//IO��������
//ÿ�ĸ�λ����һ��IO
#define DHT11_IO_IN()  {GPIOC->CRL&=0XFFFFFF0F;GPIOC->CRL|=8<<4;}
#define DHT11_IO_OUT() {GPIOC->CRL&=0XFFFFFF0F;GPIOC->CRL|=3<<4;}
////IO��������											   
#define	DHT11_DQ_OUT PCout(1) //���ݶ˿�	
#define	DHT11_DQ_IN  PCin(1)  //���ݶ˿�	


u8 DHT11_Init(void);//��ʼ��DHT11
u8 DHT11_Read_Data(u8 *temp,u8 *humi);//��ȡ��ʪ��
u8 DHT11_Read_Byte(void);//����һ���ֽ�
u8 DHT11_Read_Bit(void);//����һ��λ
u8 DHT11_Check(void);//����Ƿ����DHT11
void DHT11_Rst(void);//��λDHT11    
#endif

