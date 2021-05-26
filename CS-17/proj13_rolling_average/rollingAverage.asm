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

		include	'rollingAverage.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'rollingAverage.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'rollingAverage.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'rollingAverage.consts.inc'

		include	'rollingAverage.ro.inc'

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



L812_whileLoop__hla_:

L813_whileCondition__hla_:
		mov	bl, byte ptr [L806_more__hla_+0]	;/* more */
		cmp	bl, 121
		jne	L814_whileEnd__hla_

L815_whileBody__hla_:
		push	L829_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L807_data__hla_+0]	;/* data */
		pop	eax
		push	dword ptr [L808_average__hla_+0]	;/* average */
		pop	dword ptr [L809_prev_average__hla_+0]	;/* prev_average */
		finit
		fld	dword ptr [L810_n__hla_+0]	;/* n */
		fld	dword ptr [L809_prev_average__hla_+0]	;/* prev_average */
		fmulp
		fld	dword ptr [L807_data__hla_+0]	;/* data */
		faddp
		fld	dword ptr [L810_n__hla_+0]	;/* n */
		fld	dword ptr [L811_one__hla_+0]	;/* one */
		faddp
		fdivp
		fstp	dword ptr [L808_average__hla_+0]	;/* average */
		fld	dword ptr [L810_n__hla_+0]	;/* n */
		fld	dword ptr [L811_one__hla_+0]	;/* one */
		faddp
		fstp	dword ptr [L810_n__hla_+0]	;/* n */
		push	L851_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L808_average__hla_+0]	; average
		push	dword 06h
		push	dword 03h
		call	STDOUT_PUTR32	; putr32
		call	STDOUT_NEWLN	; newln
		push	L869_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_FLUSHINPUT	; flushInput
		call	STDIN_GETC	; getc
		mov	byte ptr [L806_more__hla_+0], al	;/* more */
		jmp	L813_whileCondition__hla_

L814_whileEnd__hla_:
		push	L883_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L808_average__hla_+0]	; average
		push	dword 06h
		push	dword 03h
		call	STDOUT_PUTR32	; putr32
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


