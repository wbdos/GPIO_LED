/****************************************************************************/
/*                                                                          */
/* ���ݴ������ӿƼ����޹�˾                                                 */
/*                                                                          */
/* Copyright (C) 2014-2016 Guangzhou Tronlong Electronic Technology Co.,Ltd */
/*                                                                          */
/****************************************************************************/
//ABCDEF
/****************************************************************************/
/*                                                                          */
/*              �װ� LED                                                    */
/*                                                                          */
/*              2014��09��15��                                              */
/*                                                                          */
/****************************************************************************/
// ��ʱ���Ǿ�ȷ��
void Delay(unsigned int n)
{
	unsigned int i;

	for(i = n; i > 0; i--);
}

void main(void)
{
	// �ܽŸ�������
	*(volatile unsigned int *)(0x01C14124) = 0x88800800;
	// ����Ϊ�����
	*(volatile unsigned int *)(0x01E26000 + 0x10) &= 0xFFFFFFD8;

	// ѭ������ LED
	for(;;)
	{
		*(volatile unsigned int *)(0x01E26000 + 0x14) = 0x00000001;
		Delay(0x00FFFFFF);

		*(volatile unsigned int *)(0x01E26000 + 0x14) = 0x00000020;
		Delay(0x00FFFFFF);

		*(volatile unsigned int *)(0x01E26000 + 0x14) = 0x00000002;
		Delay(0x00FFFFFF);

		*(volatile unsigned int *)(0x01E26000 + 0x14) = 0x00000004;
		Delay(0x00FFFFFF);
	}
}
