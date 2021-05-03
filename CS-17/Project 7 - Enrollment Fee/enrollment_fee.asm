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

		include	'enrollment_fee.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'enrollment_fee.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'enrollment_fee.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'enrollment_fee.consts.inc'

		include	'enrollment_fee.ro.inc'

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


		push	L826_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETB	; getb
		mov	cl, al
		pop	eax
		mov	byte ptr [L806_data__hla_+0], cl	;/* data */
		mov	bl, byte ptr [L806_data__hla_+0]	;/* data */
		and	bl, 60
		cmp	bl, 0
		je	L835_badly_formed__hla_

L836_semester_start__hla_:
		mov	bl, byte ptr [L806_data__hla_+0]	;/* data */
		and	bl, 192
		cmp	bl, 0
		jz	L837_Fall__hla_
		cmp	bl, 64
		jz	L838_Winter__hla_
		cmp	bl, 128
		jz	L839_Spring__hla_
		cmp	bl, 192
		jz	L840_Summer__hla_

L841_semester_end__hla_:

L842_unit_start__hla_:
		mov	bl, byte ptr [L806_data__hla_+0]	;/* data */
		and	bl, 60
		ror	bl, 2
		mov	byte ptr [L808_units__hla_+0], bl	;/* units */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L808_units__hla_+0]	; (type int8 units)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L862_str__hla_
		call	STDOUT_PUTS	; puts
		cmp	byte ptr [L808_units__hla_+0], 1	;/* units */
		je	L863_unit_end__hla_
		push	L877_str__hla_
		call	STDOUT_PUTS	; puts

L863_unit_end__hla_:

L878_resident_start__hla_:
		mov	bl, byte ptr [L806_data__hla_+0]	;/* data */
		and	bl, 2
		ror	bl, 1
		mov	byte ptr [L809_resident__hla_+0], bl	;/* resident */
		cmp	byte ptr [L809_resident__hla_+0], 1	;/* resident */
		je	L879_is_resident__hla_
		call	STDOUT_NEWLN	; newln
		push	L897_str__hla_
		call	STDOUT_PUTS	; puts
		mov	word ptr [L811_rate__hla_+0], 370	;/* rate */
		jmp	L898_resident_end__hla_

L879_is_resident__hla_:
		call	STDOUT_NEWLN	; newln
		push	L916_str__hla_
		call	STDOUT_PUTS	; puts
		mov	word ptr [L811_rate__hla_+0], 46	;/* rate */

L898_resident_end__hla_:

L917_ID_start__hla_:
		mov	bl, byte ptr [L806_data__hla_+0]	;/* data */
		and	bl, 1
		mov	byte ptr [L810_ID__hla_+0], bl	;/* ID */
		cmp	byte ptr [L810_ID__hla_+0], 1	;/* ID */
		je	L918_has_ID__hla_
		call	STDOUT_NEWLN	; newln
		push	L936_str__hla_
		call	STDOUT_PUTS	; puts
		sub	word ptr [L812_total_fees__hla_+0], 13	;/* total_fees */
		jmp	L937_ID_end__hla_

L918_has_ID__hla_:
		call	STDOUT_NEWLN	; newln
		push	L955_str__hla_
		call	STDOUT_PUTS	; puts

L937_ID_end__hla_:

L956_fees_start__hla_:
		mov	bl, byte ptr [L808_units__hla_+0]	;/* units */
		and	bl, 1
		cmp	bl, 1
		je	L957_add1__hla_

L958_add1_end__hla_:
		mov	bl, byte ptr [L808_units__hla_+0]	;/* units */
		and	bl, 2
		ror	bl, 1
		cmp	bl, 1
		je	L959_add2__hla_

L960_add2_end__hla_:
		mov	bl, byte ptr [L808_units__hla_+0]	;/* units */
		and	bl, 4
		ror	bl, 2
		cmp	bl, 1
		je	L961_add4__hla_

L962_add4_end__hla_:
		mov	bl, byte ptr [L808_units__hla_+0]	;/* units */
		and	bl, 8
		ror	bl, 3
		cmp	bl, 1
		je	L963_add8__hla_

L964_add8_end__hla_:
		call	STDOUT_NEWLN	; newln
		push	L982_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L812_total_fees__hla_+0]	; (type int16 total_fees)
		call	STDOUT_PUTI16	; puti16

L989_fees_end__hla_:
		jmp	L990_program_done__hla_

L837_Fall__hla_:
		push	L1004_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	word ptr [L812_total_fees__hla_+0], 53	;/* total_fees */
		jmp	L841_semester_end__hla_

L838_Winter__hla_:
		push	L1022_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	word ptr [L812_total_fees__hla_+0], 50	;/* total_fees */
		jmp	L841_semester_end__hla_

L839_Spring__hla_:
		push	L1040_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	word ptr [L812_total_fees__hla_+0], 53	;/* total_fees */
		jmp	L841_semester_end__hla_

L840_Summer__hla_:
		push	L1058_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	word ptr [L812_total_fees__hla_+0], 50	;/* total_fees */
		jmp	L841_semester_end__hla_

L957_add1__hla_:
		mov	dx, word ptr [L811_rate__hla_+0]	;/* rate */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		jmp	L958_add1_end__hla_

L959_add2__hla_:
		mov	dx, word ptr [L811_rate__hla_+0]	;/* rate */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		jmp	L960_add2_end__hla_

L961_add4__hla_:
		mov	dx, word ptr [L811_rate__hla_+0]	;/* rate */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		jmp	L962_add4_end__hla_

L963_add8__hla_:
		mov	dx, word ptr [L811_rate__hla_+0]	;/* rate */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		add	word ptr [L812_total_fees__hla_+0], dx	;/* total_fees */
		jmp	L964_add8_end__hla_

L835_badly_formed__hla_:
		push	L1076_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L990_program_done__hla_

L990_program_done__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


