/****************************************************************************/
/*                                                                          */
/*              广州创龙电子科技有限公司                                    */
/*                                                                          */
/*              Copyright 2015 Tronlong All rights reserved                 */
/*                                                                          */
/****************************************************************************/
/****************************************************************************/
/*                                                                          */
/*              底板 LED                                                    */
/*                                                                          */
/*              2014年09月15日                                              */
/*                                                                          */
/****************************************************************************/
#include "main.h"

// 延时（非精确）
void Delay(unsigned int n)
{
	unsigned int i;

	for(i = n; i > 0; i--);
}

void main(void)
{
	// 管脚复用配置
	SYSCFG0Regs.PINMUX1.bit.PINMUX1_31_28 = 8;
	SYSCFG0Regs.PINMUX1.bit.PINMUX1_27_24 = 8;
	SYSCFG0Regs.PINMUX1.bit.PINMUX1_23_20 = 8;
	SYSCFG0Regs.PINMUX1.bit.PINMUX1_11_8  = 8;

	// 配置为输出口
	GPIORegs.DIR01.bit.GP0P0 = 0;
	GPIORegs.DIR01.bit.GP0P1 = 0;
	GPIORegs.DIR01.bit.GP0P2 = 0;
	GPIORegs.DIR01.bit.GP0P5 = 0;

	// 循环点亮 LED
	for(;;)
	{
		GPIORegs.OUT_DATA01.all = 0;
		GPIORegs.OUT_DATA01.bit.GP0P0 = 1;
		Delay(0x00FFFFFF);

		GPIORegs.OUT_DATA01.all = 0;
		GPIORegs.OUT_DATA01.bit.GP0P5 = 1;
		Delay(0x00FFFFFF);

		GPIORegs.OUT_DATA01.all = 0;
		GPIORegs.OUT_DATA01.bit.GP0P1 = 1;
		Delay(0x00FFFFFF);

		GPIORegs.OUT_DATA01.all = 0;
		GPIORegs.OUT_DATA01.bit.GP0P2 = 1;
		Delay(0x00FFFFFF);
	}
}
