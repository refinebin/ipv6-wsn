#include "common.h"
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
//�û�������

//���Ӷ˿ں�:8086,�������޸�Ϊ�����˿�.
const u8* portnum="8086";		 

//WIFI STAģʽ,����Ҫȥ���ӵ�·�������߲���,��������Լ���·��������,�����޸�.
const u8* wifista_ssid="TP-LINK_666";			//·����SSID��
const u8* wifista_encryption="wpawpa2_aes";	//wpa/wpa2 aes���ܷ�ʽ
const u8* wifista_password="12345678"; 	//��������

/////////////////////////////////////////////////////////////////////////////////////////////////////////// 
//3�ֹ���ģʽ
const u8 *ATK_ESP8266_WORKMODE_TBL[3]={"TCP server","TCP Client"," UDP "};	//ATK-ESP8266,4�ֹ���ģʽ

/////////////////////////////////////////////////////////////////////////////////////////////////////////// 

//usmart֧�ֲ���
//���յ���ATָ��Ӧ�����ݷ��ظ����Դ���
//mode:0,������USART2_RX_STA;
//     1,����USART2_RX_STA;
void atk_8266_at_response(u8 mode)
{
	if(USART2_RX_STA&0X8000)		//���յ�һ��������
	{ 
		USART2_RX_BUF[USART2_RX_STA&0X7FFF]=0;//��ӽ�����
		printf("%s",USART2_RX_BUF);	//���͵�����
		if(mode)USART2_RX_STA=0;
	} 
}
//ATK-ESP8266���������,�����յ���Ӧ��
//str:�ڴ���Ӧ����
//����ֵ:0,û�еõ��ڴ���Ӧ����
//    ����,�ڴ�Ӧ������λ��(str��λ��)
u8* atk_8266_check_cmd(u8 *str)
{
	
	char *strx=0;
	if(USART2_RX_STA&0X8000)		//���յ�һ��������
	{ 
		USART2_RX_BUF[USART2_RX_STA&0X7FFF]=0;//��ӽ�����
		strx=strstr((const char*)USART2_RX_BUF,(const char*)str);
	} 
	return (u8*)strx;
}
//��ATK-ESP8266��������
//cmd:���͵������ַ���
//ack:�ڴ���Ӧ����,���Ϊ��,���ʾ����Ҫ�ȴ�Ӧ��
//waittime:�ȴ�ʱ��(��λ:10ms)
//����ֵ:0,���ͳɹ�(�õ����ڴ���Ӧ����)
//       1,����ʧ��
u8 atk_8266_send_cmd(u8 *cmd,u8 *ack,u16 waittime)
{
	u8 res=0; 
	USART2_RX_STA=0;
	u2_printf("%s\r\n",cmd);	//��������
	if(ack&&waittime)		//��Ҫ�ȴ�Ӧ��
	{
		while(--waittime)	//�ȴ�����ʱ
		{
			delay_ms(10);
			if(USART2_RX_STA&0X8000)//���յ��ڴ���Ӧ����
			{
				if(atk_8266_check_cmd(ack))
				{
					printf("ack:%s\r\n",(u8*)ack);
					break;//�õ���Ч���� 
				}
					USART2_RX_STA=0;
			} 
		}
		if(waittime==0)res=1; 
	}
	return res;
} 
//��ATK-ESP8266����ָ������
//data:���͵�����(����Ҫ��ӻس���)
//ack:�ڴ���Ӧ����,���Ϊ��,���ʾ����Ҫ�ȴ�Ӧ��
//waittime:�ȴ�ʱ��(��λ:10ms)
//����ֵ:0,���ͳɹ�(�õ����ڴ���Ӧ����)luojian
u8 atk_8266_send_data(u8 *data,u8 *ack,u16 waittime)
{
	u8 res=0; 
	USART2_RX_STA=0;
	u2_printf("%s",data);	//��������
	if(ack&&waittime)		//��Ҫ�ȴ�Ӧ��
	{
		while(--waittime)	//�ȴ�����ʱ
		{
			delay_ms(10);
			if(USART2_RX_STA&0X8000)//���յ��ڴ���Ӧ����
			{
				if(atk_8266_check_cmd(ack))break;//�õ���Ч���� 
				USART2_RX_STA=0;
			} 
		}
		if(waittime==0)res=1; 
	}
	return res;
}
//ATK-ESP8266�˳�͸��ģʽ
//����ֵ:0,�˳��ɹ�;
//       1,�˳�ʧ��
u8 atk_8266_quit_trans(void)
{
	while((USART2->SR&0X40)==0);	//�ȴ����Ϳ�
	USART2->DR='+';      
	delay_ms(15);					//���ڴ�����֡ʱ��(10ms)
	while((USART2->SR&0X40)==0);	//�ȴ����Ϳ�
	USART2->DR='+';      
	delay_ms(15);					//���ڴ�����֡ʱ��(10ms)
	while((USART2->SR&0X40)==0);	//�ȴ����Ϳ�
	USART2->DR='+';      
	delay_ms(500);					//�ȴ�500ms
	return atk_8266_send_cmd("AT","OK",20);//�˳�͸���ж�.
}

//��ȡATK-ESP8266ģ�������״̬
//����ֵ:0,δ����;1,���ӳɹ�.
u8 atk_8266_consta_check(void)
{
	u8 *p;
	u8 res;
	if(atk_8266_quit_trans())return 0;			//�˳�͸�� 
	atk_8266_send_cmd("AT+CIPSTATUS",":",50);	//����AT+CIPSTATUSָ��,��ѯ����״̬
	p=atk_8266_check_cmd("+CIPSTATUS:"); 
	res=*p;		
	return res;
}

//��ȡClient ip��ַ
//ipbuf:ip��ַ���������
void atk_8266_get_wanip(u8* ipbuf)
{
	u8 *p,*p1;
		if(atk_8266_send_cmd("AT+CIFSR","OK",50))//��ȡWAN IP��ַʧ��
		{
			ipbuf[0]=0;
			return;
		}		
		p=atk_8266_check_cmd("\"");
		p1=(u8*)strstr((const char*)(p+1),"\"");
		*p1=0;
		sprintf((char*)ipbuf,"%s",p+1);	
}

//ATK-ESP8266ģ�����������
void atk_8266_test(void)
{

	u8 timex;
	POINT_COLOR=RED;
	LCD_Clear(WHITE);
	while(atk_8266_send_cmd("AT","OK",20))//���WIFIģ���Ƿ�����
	{
		atk_8266_quit_trans();//�˳�͸��
		atk_8266_send_cmd("AT+CIPMODE=0","OK",200);  //�ر�͸��ģʽ	
		LCD_ShowString(40,55,200,16,16,"Undetected module!");
		delay_ms(800);
		LCD_Fill(40,55,200,55+16,WHITE);
		LCD_ShowString(40,55,200,16,16,"Try connection ...");
		
	} 
		while(atk_8266_send_cmd("ATE0","OK",20));//�رջ���
	while(1)
	{
		delay_ms(10); 
		atk_8266_at_response(1);//���ATK-ESP8266ģ�鷢�͹���������,��ʱ�ϴ�������

		
		LCD_ShowString(30,70,240,12,12,"ATK-ESP WIFI-STA test");
		atk_8266_wifista_test();//WIFI STA����

		if((timex%20)==0)LED0=!LED0;//200ms��˸ 
		timex++;	 
	} 
}


//�������
const u8* kbd_tbl[13]={"1","2","3","4","5","6","7","8","9",".","0","#","DEL"}; 
u8* kbd_fn_tbl[2];
//���ؼ��̽��棨�ߴ�Ϊ240*140��
//x,y:������ʼ���꣨320*240�ֱ��ʵ�ʱ��x����Ϊ0��
void atk_8266_load_keyboard(u16 x,u16 y)
{
	u16 i;
	POINT_COLOR=RED; 
	LCD_Fill(x,y,x+240,y+140,WHITE);
	LCD_DrawRectangle(x,y,x+240,y+140);						   
	LCD_DrawRectangle(x+80,y,x+160,y+140);	 
	LCD_DrawRectangle(x,y+28,x+240,y+56);
	LCD_DrawRectangle(x,y+84,x+240,y+112);
	POINT_COLOR=BLUE;
	for(i=0;i<15;i++)
	{
		if(i<13)Show_Str_Mid(x+(i%3)*80,y+6+28*(i/3),(u8*)kbd_tbl[i],16,80);
		else Show_Str_Mid(x+(i%3)*80,y+6+28*(i/3),kbd_fn_tbl[i-13],16,80); 
	}  		 					   
}


//IP����
//title:ip���ñ���
//mode:����ģʽ
//port:�˿ں�
//*ip:ip������(����IP���ϲ㺯��)
//����ֵ:0,ȷ������;1,ȡ������.
u8 atk_8266_ip_set(u8* title,u8* mode,u8* port,u8* ip) 
{
	u8 res=0;
 	u8 key;
	u8 timex=0;  
	u8 iplen=0;			//IP���� 
	LCD_Clear(WHITE);  
	POINT_COLOR=RED; 
	Show_Str_Mid(0,30,title,16,240);		//��ʾ����	 	 	
	Show_Str(30,90,200,16,"moshi:",16,0);	//����ģʽ��ʾ
	Show_Str(30,110,200,16,"IP:",16,0);	//IP��ַ���Լ�������
	Show_Str(30,130,200,16,"DUANkou:",16,0);	//�˿ں�
	kbd_fn_tbl[0]="����";
	kbd_fn_tbl[1]="����"; 
	atk_8266_load_keyboard(0,180);			//��ʾ���� 
	POINT_COLOR=BLUE;
 	Show_Str(30+72,90,200,16,mode,16,0);	//��ʾ����ģʽ	
 	Show_Str(30+40,130,200,16,port,16,0);	//��ʾ�˿� 	
//	ip[0]=kbd_tbl[1-1][0]; 	
//	ip[1]=kbd_tbl[11-1][0];
//	ip[2]=kbd_tbl[10-1][0];
//	ip[3]=kbd_tbl[3-1][0];
//	ip[4]=kbd_tbl[11-1][0];
//	ip[5]=kbd_tbl[10-1][0];
//	ip[6]=kbd_tbl[1-1][0];
//	ip[7]=kbd_tbl[9-1][0];
//	ip[8]=kbd_tbl[10-1][0];
//	ip[9]=kbd_tbl[2-1][0];
//	ip[10]=kbd_tbl[2-1][0];
//	ip[11]=kbd_tbl[8-1][0];
//	ip[12]=0;
//192.168.0.105
	ip[0]=kbd_tbl[1-1][0]; 	
	ip[1]=kbd_tbl[9-1][0];
	ip[2]=kbd_tbl[2-1][0];
	ip[3]=kbd_tbl[10-1][0];
	ip[4]=kbd_tbl[1-1][0];
	ip[5]=kbd_tbl[6-1][0];
	ip[6]=kbd_tbl[8-1][0];
	ip[7]=kbd_tbl[10-1][0];
	ip[8]=kbd_tbl[11-1][0];
	ip[9]=kbd_tbl[10-1][0];
	ip[10]=kbd_tbl[1-1][0];
	ip[11]=kbd_tbl[11-1][0];
	ip[12]=kbd_tbl[5-1][0];
	ip[13]=0;
	Show_Str(30+56,110,200,16,ip,16,0);			//��ʾIP��ַ 
	 
		delay_ms(10);
		atk_8266_at_response(1);//WIFIģ�鷢����������,��ʱ�ϴ�������

	return 0;
}




//ATK-ESP8266ģ��WIFI���ò�����ʾ(��WIFI STA/WIFI APģʽ����ʱʹ��)
//x,y:��ʾ��Ϣ����ʼ����.
//rmd:��ʾ��Ϣ
//ssid,encryption,password:���������SSID,���ܷ�ʽ,����
void atk_8266_wificonf_show(u16 x,u16 y,u8* rmd,u8* ssid,u8* encryption,u8* password)
{ 
	POINT_COLOR=RED;
	Show_Str(x,y+20,240,12,"SSID:",12,0);
	Show_Str(x,y+36,240,12,"jiami:",12,0);
	Show_Str(x,y+52,240,12,"password:",12,0); 
	POINT_COLOR=BLUE;
	Show_Str(x+30,y+20,240,12,ssid,12,0);
	Show_Str(x+54,y+36,240,12,encryption,12,0);
	Show_Str(x+30,y+52,240,12,password,12,0); 	  
}









































