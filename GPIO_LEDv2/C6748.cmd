/****************************************************************************/
/*                                                                          */
/*              OMAPL138 及 DSP C6748 内存空间分配定义                      */
/*                                                                          */
/*              2014年07月05日                                              */
/*                                                                          */
/****************************************************************************/

MEMORY
{
    SHDSPL2ROM   o = 0x11700000  l = 0x00100000  /* 1MB   L2 共享内置 ROM */
    SHDSPL2RAM   o = 0x11800000  l = 0x00040000  /* 256KB L2 共享内置 RAM */

    SHRAM        o = 0x80000000  l = 0x00020000  /* 128KB 共享 RAM */
    DDR2         o = 0xC0000000  l = 0x08000000  /* 128MB DDR2 分配给 DSP */

/****************************************************************************/
/*                                                                          */
/*              外设内存区域                                                */
/*                                                                          */
/****************************************************************************/
    SYSCFG0      o = 0x01C14000  l = 0x00001000  /* 4K    SYSCFG0 */
    uPP          o = 0x01E16000  l = 0x00001000  /* 4K    uPP */
    GPIO         o = 0x01E26000  l = 0x00001000  /* 4K    GPIO */
    McBSP0       o = 0x01D10000  l = 0x00000800  /* 2K    McBSP0 */
    McBSP1       o = 0x01D11000  l = 0x00000800  /* 2K    McBSP1 */
}

SECTIONS
{
    .text			>  SHDSPL2RAM             		 /* 可执行代码 */
    .stack  		>  SHDSPL2RAM 				     /* 软件系统栈 */

    .cio			>  SHDSPL2RAM                    /* C 输入输出缓存 */
    .vectors		>  SHDSPL2RAM      				 /* 中断向量表 */
    .const			>  SHDSPL2RAM                    /* 常量 */
    .data			>  SHDSPL2RAM                    /* 已初始化全局及静态变量 */
    .switch			>  SHDSPL2RAM                    /* 跳转表 */
    .sysmem			>  SHDSPL2RAM                    /* 动态内存分配区域 */

    .args			>  SHDSPL2RAM
    .ppinfo			>  SHDSPL2RAM
    .ppdata			>  SHDSPL2RAM

    /* TI-ABI 或 COFF */
    .pinit			>  SHDSPL2RAM                    /* C++ 结构表 */
    .cinit			>  SHDSPL2RAM                    /* 初始化表 */

    /* EABI */
    .binit			>  SHDSPL2RAM
    .init_array		>  SHDSPL2RAM
    .fardata		>  SHDSPL2RAM

    .c6xabi.exidx	>  SHDSPL2RAM
    .c6xabi.extab	>  SHDSPL2RAM

	.init_array     >  SHDSPL2RAM

	GROUP(NEARDP_DATA)
	{
	   .neardata
	   .rodata
	   .bss
	}               >  SHDSPL2RAM

    .far			>  SHDSPL2RAM

    /* 外设  */
	.Reg_SYSCFG0	>  SYSCFG0
	.Reg_uPP		>  uPP
	.Reg_GPIO		>  GPIO
	.Reg_McBSP0		>  McBSP0
	.Reg_McBSP1		>  McBSP1
}
