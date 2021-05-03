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

		include	'double_table.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'double_table.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'double_table.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'double_table.consts.inc'

		include	'double_table.ro.inc'

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


		push	L821_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_starting_value__hla_+0], al	;/* starting_value */
		pop	eax
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L849_str__hla_
		call	STDOUT_PUTS	; puts
		rol	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L869_str__hla_
		call	STDOUT_PUTS	; puts
		rol	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L889_str__hla_
		call	STDOUT_PUTS	; puts
		rol	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
		rol	byte ptr [L806_starting_value__hla_+0], 5	;/* starting_value */
		add	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L928_str__hla_
		call	STDOUT_PUTS	; puts
		rol	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L948_str__hla_
		call	STDOUT_PUTS	; puts
		rol	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L968_str__hla_
		call	STDOUT_PUTS	; puts
		rol	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
		rol	byte ptr [L806_starting_value__hla_+0], 5	;/* starting_value */
		add	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L1007_str__hla_
		call	STDOUT_PUTS	; puts
		rol	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L1027_str__hla_
		call	STDOUT_PUTS	; puts
		rol	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L1047_str__hla_
		call	STDOUT_PUTS	; puts
		rol	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
		rol	byte ptr [L806_starting_value__hla_+0], 5	;/* starting_value */
		add	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L1086_str__hla_
		call	STDOUT_PUTS	; puts
		rol	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L1106_str__hla_
		call	STDOUT_PUTS	; puts
		rol	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L1126_str__hla_
		call	STDOUT_PUTS	; puts
		rol	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_starting_value__hla_+0]	; (type int8 starting_value)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
		rol	byte ptr [L806_starting_value__hla_+0], 5	;/* starting_value */
		add	byte ptr [L806_starting_value__hla_+0], 1	;/* starting_value */
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


