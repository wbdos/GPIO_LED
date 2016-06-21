/****************************************************************************/
/*                                                                          */
/*              ���ݴ������ӿƼ����޹�˾                                    */
/*                                                                          */
/*              Copyright 2015 Tronlong All rights reserved                 */
/*                                                                          */
/****************************************************************************/
/****************************************************************************/
/*                                                                          */
/*              �װ� LED                                                    */
/*                                                                          */
/*              2014��09��15��                                              */
/*                                                                          */
/****************************************************************************/
#include "main.h"

// ��ʱ���Ǿ�ȷ��
void Delay(unsigned int n)
{
	unsigned int i;

	for(i = n; i > 0; i--);
}

void main(void)
{
	// �ܽŸ�������
	SYSCFG0Regs.PINMUX1.bit.PINMUX1_31_28 = 8;
	SYSCFG0Regs.PINMUX1.bit.PINMUX1_27_24 = 8;
	SYSCFG0Regs.PINMUX1.bit.PINMUX1_23_20 = 8;
	SYSCFG0Regs.PINMUX1.bit.PINMUX1_11_8  = 8;

	// ����Ϊ�����
	GPIORegs.DIR01.bit.GP0P0 = 0;
	GPIORegs.DIR01.bit.GP0P1 = 0;
	GPIORegs.DIR01.bit.GP0P2 = 0;
	GPIORegs.DIR01.bit.GP0P5 = 0;

	// ѭ������ LED
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
