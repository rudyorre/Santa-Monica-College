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

		include	'gradianConversion.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'gradianConversion.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'gradianConversion.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'gradianConversion.consts.inc'

		include	'gradianConversion.ro.inc'

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


		push	L824_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_number__hla_+0]	;/* number */
		pop	eax
		finit
		fld	dword ptr [L806_number__hla_+0]	;/* number */
		fld	qword ptr [L809_turnConstant__hla_+0]	;/* turnConstant */
		fmulp
		fstp	qword ptr [L807_turnGradian__hla_+0]	;/* turnGradian */
		finit
		fld	dword ptr [L806_number__hla_+0]	;/* number */
		fld	qword ptr [L810_degreeConstant__hla_+0]	;/* degreeConstant */
		fmulp
		fstp	qword ptr [L808_degreeGradian__hla_+0]	;/* degreeGradian */
		push	L846_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_turnGradian__hla_+4]	; turnGradian
		push	dword ptr [L807_turnGradian__hla_+0]	; turnGradian
		push	dword 0ah
		push	dword 03h
		call	STDOUT_PUTR64	; putr64
		call	STDOUT_NEWLN	; newln
		push	L873_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L808_degreeGradian__hla_+4]	; degreeGradian
		push	dword ptr [L808_degreeGradian__hla_+0]	; degreeGradian
		push	dword 0ah
		push	dword 03h
		call	STDOUT_PUTR64	; putr64
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


