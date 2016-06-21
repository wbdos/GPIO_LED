* ------------------------------------------------------------------------ *
*                                                                          *
*      �����д����                                                        *
*      ����޸�ʱ�䣺2014��03��20��                                        *
*                  													       *
* ------------------------------------------------------------------------ *

* ------------------------------------------------------------------------ *
*                                                                          *
*      �ж�������                                                          *
*                                                                          *
* ------------------------------------------------------------------------ *

* ------------------------------------------------------------------------ *
*                                                                          *
*      ȫ�ַ��Ŷ���                                                        *
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
   .global _USER0KEYIsr                ; GPIO �ж�
   .global _vector13   
   .global _vector14
   .global _vector15

* ------------------------------------------------------------------------ *
*                                                                          *
*      C ������ڵ�                                                        *
*                                                                          *
* ------------------------------------------------------------------------ *
   .ref _c_int00

* ------------------------------------------------------------------------ *
*                                                                          *
*      �ж�ָ��							                               	   *
*                                                                          *
* ------------------------------------------------------------------------ *
VEC_ENTRY .macro addr
    STW   B0,*--B15						; ���� B0 ����
    MVKL  addr,B0
    MVKH  addr,B0						; д���ַ�� B0
    B     B0						    ; ��ת�� B0 �洢�ĵ�ַ
    LDW   *B15++,B0						; �ָ� B0 ����
    NOP   2
    NOP   
    NOP   
   .endm

* ------------------------------------------------------------------------ *
*                                                                          *
*      δ������жϷ�����                                                *
*                                                                          *
* ------------------------------------------------------------------------ *
_vec_dummy:
  B    B3						    	; ��ת�� B3 �洢�ĵ�ַ
  NOP  5

* ------------------------------------------------------------------------ *
*                                                                          *
*      �ж�������                                                          *
*                                                                          *
* ------------------------------------------------------------------------ *
 .sect ".vectors"				    	; �ζ���
 .align 1024				    		; �߽����

_vectors:
_vector0:	VEC_ENTRY _c_int00			; ��λ ��ת�� C ������ڵ�
_vector1:	VEC_ENTRY _vec_dummy		; ���������ж�
_vector2:	VEC_ENTRY _vec_dummy		; ����
_vector3:	VEC_ENTRY _vec_dummy		; ����
_vector4:	VEC_ENTRY _vec_dummy		; DSP �������ж� INT4
_vector5:	VEC_ENTRY _vec_dummy		; DSP �������ж� INT5
_vector6:	VEC_ENTRY _vec_dummy		; DSP �������ж� INT6
_vector7:	VEC_ENTRY _vec_dummy		; DSP �������ж� INT7
_vector8:	VEC_ENTRY _vec_dummy		; DSP �������ж� INT8
_vector9:	VEC_ENTRY _vec_dummy		; DSP �������ж� INT9
_vector10:	VEC_ENTRY _vec_dummy		; DSP �������ж� INT10
_vector11:	VEC_ENTRY _vec_dummy		; DSP �������ж� INT11
_vector12:	VEC_ENTRY _USER0KEYIsr      ; GPIO �ж�
_vector13:	VEC_ENTRY _vec_dummy		; DSP �������ж� INT13
_vector14:	VEC_ENTRY _vec_dummy		; DSP �������ж� INT14
_vector15:	VEC_ENTRY _vec_dummy		; DSP �������ж� INT15
