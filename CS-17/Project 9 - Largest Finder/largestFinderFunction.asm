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

		include	'largestFinderFunction.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'largestFinderFunction.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'largestFinderFunction.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'largestFinderFunction.consts.inc'

		include	'largestFinderFunction.ro.inc'

; Code begins here:
L810_largestfinder__hla_:
		pop	dword ptr [L811_returnAddress__hla_+0]	;/* returnAddress */
		pop	word ptr [L812_temp__hla_+0]	;/* temp */
		pop	word ptr [ebp+8]	;/* z */
		pop	word ptr [L812_temp__hla_+0]	;/* temp */
		pop	word ptr [ebp+12]	;/* y */
		pop	word ptr [L812_temp__hla_+0]	;/* temp */
		pop	word ptr [ebp+16]	;/* x */
		push	dword ptr [L811_returnAddress__hla_+0]	;/* returnAddress */
		mov	al, 0
		mov	bx, word ptr [ebp+12]	;/* y */
		cmp	word ptr [ebp+16], bx	;/* x */
		jne	L813_endEquals__hla_
		cmp	bx, word ptr [ebp+8]	;/* z */
		jne	L813_endEquals__hla_
		mov	al, 1

L813_endEquals__hla_:
		mov	bx, word ptr [ebp+16]	;/* x */
		cmp	bx, word ptr [ebp+12]	;/* y */
		jge	L814_cmpZ__hla_
		mov	bx, word ptr [ebp+12]	;/* y */

L814_cmpZ__hla_:
		cmp	bx, word ptr [ebp+8]	;/* z */
		jge	L815_endSequence__hla_
		mov	bx, word ptr [ebp+8]	;/* z */

L815_endSequence__hla_:
		ret
xL810_largestfinder__hla___hla_:
;L810_largestfinder__hla_ endp




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


		push	L829_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_a__hla_+0], ax	;/* a */
		pop	eax
		push	L851_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L807_b__hla_+0], ax	;/* b */
		pop	eax
		push	L873_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L808_c__hla_+0], ax	;/* c */
		pop	eax
		push	word ptr [L806_a__hla_+0]	;/* a */
		push	word ptr [L809_d__hla_+0]	;/* d */
		push	word ptr [L807_b__hla_+0]	;/* b */
		push	word ptr [L809_d__hla_+0]	;/* d */
		push	word ptr [L808_c__hla_+0]	;/* c */
		push	word ptr [L809_d__hla_+0]	;/* d */
		call	L810_largestfinder__hla_
		push	L895_str__hla_
		call	STDOUT_PUTS	; puts
		push	ebx
		call	STDOUT_PUTI16	; puti16
		call	STDOUT_NEWLN	; newln
		push	L913_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI8	; puti8
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


