; Assembly code emitted by HLA compiler
; Version 1.76 build 9932 (prototype)
; HLA compiler written by Randall Hyde
; FASM compatible output

		format	MS COFF


offset32	equ	 
ptr	equ	 

macro global [symbol]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol
   isextrn = 1
 end if
}

macro global2 [symbol,type]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol:type
   isextrn = 1
 end if
}


ExceptionPtr__hla_	equ	fs:0

		include	'recursiveMultiplyFunction.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'recursiveMultiplyFunction.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'recursiveMultiplyFunction.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'recursiveMultiplyFunction.consts.inc'

		include	'recursiveMultiplyFunction.ro.inc'

; Code begins here:
L808_recursiveMultiply__hla_:
		pop	dword ptr [L809_returnAddress__hla_+0]	;/* returnAddress */
		pop	dword ptr [ebp+8]	;/* j */
		pop	dword ptr [ebp+12]	;/* i */
		push	dword ptr [L809_returnAddress__hla_+0]	;/* returnAddress */
		mov	ebx, 0
		cmp	ebx, dword ptr [ebp+12]	;/* i */
		je	L810_isZero__hla_
		cmp	ebx, dword ptr [ebp+8]	;/* j */
		je	L810_isZero__hla_
		mov	ebx, 1
		cmp	ebx, dword ptr [ebp+12]	;/* i */
		je	L811_iIsOne__hla_
		cmp	ebx, dword ptr [ebp+8]	;/* j */
		je	L812_jIsOne__hla_
		jmp	L813_neither__hla_

L810_isZero__hla_:
		mov	eax, 0
		jmp	L814_endConditions__hla_

L811_iIsOne__hla_:
		mov	eax, dword ptr [ebp+8]	;/* j */
		jmp	L814_endConditions__hla_

L812_jIsOne__hla_:
		mov	eax, dword ptr [ebp+12]	;/* i */
		jmp	L814_endConditions__hla_

L813_neither__hla_:
		dec	dword ptr [ebp+8]	;/* j */
		push	dword ptr [ebp+12]	;/* i */
		push	dword ptr [ebp+8]	;/* j */
		call	L808_recursiveMultiply__hla_
		add	eax, dword ptr [ebp+12]	;/* i */

L814_endConditions__hla_:
		ret
xL808_recursiveMultiply__hla___hla_:
;L808_recursiveMultiply__hla_ endp




;/* HWexcept__hla_ gets called when Windows raises the exception. */

HWexcept__hla_ :
		jmp	HardwareException__hla_
;HWexcept__hla_  endp

DfltExHndlr__hla_:
		jmp	DefaultExceptionHandler__hla_
;DfltExHndlr__hla_ endp



_HLAMain       :


;/* Set up the Structured Exception Handler record */
;/* for this program. */

		call	BuildExcepts__hla_
		pushd	0		;/* No Dynamic Link. */
		mov	ebp, esp	;/* Pointer to Main's locals */
		push	ebp		;/* Main's display. */


		push	L828_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETU32	; getu32
		mov	dword ptr [L806_A__hla_+0], eax	;/* A */
		pop	eax
		push	L850_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETU32	; getu32
		mov	dword ptr [L807_B__hla_+0], eax	;/* B */
		pop	eax
		push	dword ptr [L806_A__hla_+0]	;/* A */
		push	dword ptr [L807_B__hla_+0]	;/* B */
		call	L808_recursiveMultiply__hla_
		push	L872_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTU32	; putu32
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


