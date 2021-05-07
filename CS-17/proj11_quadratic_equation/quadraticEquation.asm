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

		include	'quadraticEquation.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'quadraticEquation.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'quadraticEquation.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'quadraticEquation.consts.inc'

		include	'quadraticEquation.ro.inc'

; Code begins here:



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
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_a__hla_+0]	;/* a */
		pop	eax
		push	L850_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L807_b__hla_+0]	;/* b */
		pop	eax
		push	L872_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L808_c__hla_+0]	;/* c */
		pop	eax
		finit
		fld	dword ptr [L807_b__hla_+0]	;/* b */
		fld	st0
		fmulp
		fld	dword ptr [L814_four__hla_+0]	;/* four */
		fld	dword ptr [L806_a__hla_+0]	;/* a */
		fmulp
		fld	dword ptr [L808_c__hla_+0]	;/* c */
		fmulp
		fsubp
		fsqrt
		fld	dword ptr [L813_two__hla_+0]	;/* two */
		fld	dword ptr [L806_a__hla_+0]	;/* a */
		fmulp
		fdivp
		fstp	dword ptr [L811_sqrtd__hla_+0]	;/* sqrtd */
		fld	dword ptr [L812_zero__hla_+0]	;/* zero */
		fld	dword ptr [L807_b__hla_+0]	;/* b */
		fsubp
		fld	dword ptr [L813_two__hla_+0]	;/* two */
		fld	dword ptr [L806_a__hla_+0]	;/* a */
		fmulp
		fdivp
		fld	dword ptr [L811_sqrtd__hla_+0]	;/* sqrtd */
		faddp
		fstp	dword ptr [L809_x1__hla_+0]	;/* x1 */
		fld	dword ptr [L812_zero__hla_+0]	;/* zero */
		fld	dword ptr [L807_b__hla_+0]	;/* b */
		fsubp
		fld	dword ptr [L813_two__hla_+0]	;/* two */
		fld	dword ptr [L806_a__hla_+0]	;/* a */
		fmulp
		fdivp
		fld	dword ptr [L811_sqrtd__hla_+0]	;/* sqrtd */
		fsubp
		fstp	dword ptr [L810_x2__hla_+0]	;/* x2 */
		push	L894_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L810_x2__hla_+0]	; x2
		push	dword 06h
		push	dword 03h
		call	STDOUT_PUTR32	; putr32
		push	L908_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L809_x1__hla_+0]	; x1
		push	dword 06h
		push	dword 03h
		call	STDOUT_PUTR32	; putr32
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


