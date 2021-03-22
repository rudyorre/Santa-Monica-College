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

		include	'x_table.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'x_table.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'x_table.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'x_table.consts.inc'

		include	'x_table.ro.inc'

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
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_start_value__hla_+0], eax	;/* start_value */
		pop	eax
		push	dword ptr [L806_start_value__hla_+0]	;/* start_value */
		pop	dword ptr [L807_increment_value__hla_+0]	;/* increment_value */
		push	L843_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_start_value__hla_+0]	; (type int32 start_value)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		push	L867_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		push	dword ptr [L806_start_value__hla_+0]	; (type int32 start_value)
		call	STDOUT_PUTI32	; puti32
		push	L897_str__hla_
		call	STDOUT_PUTS	; puts
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L917_str__hla_
		call	STDOUT_PUTS	; puts
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L937_str__hla_
		call	STDOUT_PUTS	; puts
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L957_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_start_value__hla_+0]	; (type int32 start_value)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L996_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_start_value__hla_+0]	; (type int32 start_value)
		call	STDOUT_PUTI32	; puti32
		push	L1016_str__hla_
		call	STDOUT_PUTS	; puts
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L1036_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_start_value__hla_+0]	; (type int32 start_value)
		call	STDOUT_PUTI32	; puti32
		push	L1056_str__hla_
		call	STDOUT_PUTS	; puts
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L1076_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L1100_str__hla_
		call	STDOUT_PUTS	; puts
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L1120_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_start_value__hla_+0]	; (type int32 start_value)
		call	STDOUT_PUTI32	; puti32
		push	L1140_str__hla_
		call	STDOUT_PUTS	; puts
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L1160_str__hla_
		call	STDOUT_PUTS	; puts
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L1180_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L1204_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_start_value__hla_+0]	; (type int32 start_value)
		call	STDOUT_PUTI32	; puti32
		push	L1224_str__hla_
		call	STDOUT_PUTS	; puts
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L1244_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_start_value__hla_+0]	; (type int32 start_value)
		call	STDOUT_PUTI32	; puti32
		push	L1264_str__hla_
		call	STDOUT_PUTS	; puts
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L1284_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	dword ptr [L806_start_value__hla_+0]	; (type int32 start_value)
		call	STDOUT_PUTI32	; puti32
		push	L1308_str__hla_
		call	STDOUT_PUTS	; puts
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L1328_str__hla_
		call	STDOUT_PUTS	; puts
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L1348_str__hla_
		call	STDOUT_PUTS	; puts
		add	dword ptr [L807_increment_value__hla_+0], 1	;/* increment_value */
		push	dword ptr [L807_increment_value__hla_+0]	; (type int32 increment_value)
		call	STDOUT_PUTI32	; puti32
		push	L1368_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_start_value__hla_+0]	; (type int32 start_value)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


