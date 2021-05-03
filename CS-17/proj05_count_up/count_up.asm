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

		include	'count_up.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'count_up.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'count_up.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'count_up.consts.inc'

		include	'count_up.ro.inc'

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


		push	L823_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_n__hla_+0], al	;/* n */
		pop	eax
		push	L845_str__hla_
		call	STDOUT_PUTS	; puts

L846_fl1__hla_:

L847_fl1_init__hla_:
		mov	bl, 1

L848_fl1_test__hla_:
		cmp	bl, byte ptr [L806_n__hla_+0]	;/* n */
		jge	L849_fl1_done__hla_

L850_fl1_body__hla_:

L851_fl2__hla_:

L852_fl2_init__hla_:
		mov	cl, bl

L853_fl2_test__hla_:
		mov	dl, byte ptr [L806_n__hla_+0]	;/* n */
		add	dl, 1
		sub	dl, bl
		cmp	cl, dl
		jg	L854_fl2_done__hla_

L855_fl2_body__hla_:
		push	ecx
		call	STDOUT_PUTI8	; puti8
		inc	cl
		jmp	L853_fl2_test__hla_

L854_fl2_done__hla_:
		inc	bl
		jmp	L848_fl1_test__hla_

L849_fl1_done__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


