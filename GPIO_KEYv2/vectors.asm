* ------------------------------------------------------------------------ *
*                                                                          *
*      程序编写：斌                                                        *
*      最后修改时间：2014年03月20日                                        *
*                  													       *
* ------------------------------------------------------------------------ *

* ------------------------------------------------------------------------ *
*                                                                          *
*      中断向量表                                                          *
*                                                                          *
* ------------------------------------------------------------------------ *

* ------------------------------------------------------------------------ *
*                                                                          *
*      全局符号定义                                                        *
*                                                                          *
* ------------------------------------------------------------------------ *
   .global _vectors
   .global _c_int00
   .global _vector1
   .global _vector2
   .global _vector3
   .global _vector4
   .global _vector5
   .global _vector6
   .global _vector7
   .global _vector8
   .global _vector9	  
   .global _vector10 
   .global _vector11   
   .global _USER0KEYIsr                ; GPIO 中断
   .global _vector13   
   .global _vector14
   .global _vector15

* ------------------------------------------------------------------------ *
*                                                                          *
*      C 语言入口点                                                        *
*                                                                          *
* ------------------------------------------------------------------------ *
   .ref _c_int00

* ------------------------------------------------------------------------ *
*                                                                          *
*      中断指令							                               	   *
*                                                                          *
* ------------------------------------------------------------------------ *
VEC_ENTRY .macro addr
    STW   B0,*--B15						; 保存 B0 数据
    MVKL  addr,B0
    MVKH  addr,B0						; 写入地址到 B0
    B     B0						    ; 跳转到 B0 存储的地址
    LDW   *B15++,B0						; 恢复 B0 数据
    NOP   2
    NOP   
    NOP   
   .endm

* ------------------------------------------------------------------------ *
*                                                                          *
*      未定义的中断服务函数                                                *
*                                                                          *
* ------------------------------------------------------------------------ *
_vec_dummy:
  B    B3						    	; 跳转到 B3 存储的地址
  NOP  5

* ------------------------------------------------------------------------ *
*                                                                          *
*      中断向量表                                                          *
*                                                                          *
* ------------------------------------------------------------------------ *
 .sect ".vectors"				    	; 段定义
 .align 1024				    		; 边界对齐

_vectors:
_vector0:	VEC_ENTRY _c_int00			; 复位 跳转到 C 语言入口点
_vector1:	VEC_ENTRY _vec_dummy		; 不可屏蔽中断
_vector2:	VEC_ENTRY _vec_dummy		; 保留
_vector3:	VEC_ENTRY _vec_dummy		; 保留
_vector4:	VEC_ENTRY _vec_dummy		; DSP 可屏蔽中断 INT4
_vector5:	VEC_ENTRY _vec_dummy		; DSP 可屏蔽中断 INT5
_vector6:	VEC_ENTRY _vec_dummy		; DSP 可屏蔽中断 INT6
_vector7:	VEC_ENTRY _vec_dummy		; DSP 可屏蔽中断 INT7
_vector8:	VEC_ENTRY _vec_dummy		; DSP 可屏蔽中断 INT8
_vector9:	VEC_ENTRY _vec_dummy		; DSP 可屏蔽中断 INT9
_vector10:	VEC_ENTRY _vec_dummy		; DSP 可屏蔽中断 INT10
_vector11:	VEC_ENTRY _vec_dummy		; DSP 可屏蔽中断 INT11
_vector12:	VEC_ENTRY _USER0KEYIsr      ; GPIO 中断
_vector13:	VEC_ENTRY _vec_dummy		; DSP 可屏蔽中断 INT13
_vector14:	VEC_ENTRY _vec_dummy		; DSP 可屏蔽中断 INT14
_vector15:	VEC_ENTRY _vec_dummy		; DSP 可屏蔽中断 INT15
