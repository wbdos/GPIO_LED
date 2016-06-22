/****************************************************************************/
/*                                                                          */
/* 广州创龙电子科技有限公司                                                 */
/*                                                                          */
/* Copyright (C) 2014-2016 Guangzhou Tronlong Electronic Technology Co.,Ltd */
/*                                                                          */
/****************************************************************************/
//ABCDEF
/****************************************************************************/
/*                                                                          */
/*              底板 LED                                                    */
/*                                                                          */
/*              2014年09月15日                                              */
/*                                                                          */
/****************************************************************************/
// 延时（非精确）
void Delay(unsigned int n)
{
	unsigned int i;

	for(i = n; i > 0; i--);
}

void main(void)
{
	// 管脚复用配置
	*(volatile unsigned int *)(0x01C14124) = 0x88800800;
	// 配置为输出口
	*(volatile unsigned int *)(0x01E26000 + 0x10) &= 0xFFFFFFD8;

	// 循环点亮 LED
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
