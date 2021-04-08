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

		include	'magic_number_game.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'magic_number_game.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'magic_number_game.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'magic_number_game.consts.inc'

		include	'magic_number_game.ro.inc'

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
		mov	byte ptr [L806_magic_number__hla_+0], al	;/* magic_number */
		pop	eax
		jmp	L830_fl__hla_

L831_first_input__hla_:
		push	L845_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L846_input_done__hla_

L847_other_input__hla_:
		call	STDOUT_NEWLN	; newln
		push	L865_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L846_input_done__hla_

L866_last_try__hla_:
		call	STDOUT_NEWLN	; newln
		push	L884_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L885_last_try_done__hla_

L886_lower_response__hla_:
		push	L900_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L901_response_done__hla_

L902_higher_response__hla_:
		push	L916_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L901_response_done__hla_

L917_correct_response__hla_:
		push	L931_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L932_game_done__hla_

L830_fl__hla_:

L933_fl_init__hla_:
		mov	bl, 0
		mov	cl, byte ptr [L806_magic_number__hla_+0]	;/* magic_number */

L934_fl_test__hla_:
		cmp	bl, 5
		jge	L935_fl_done__hla_

L936_fl_body__hla_:
		cmp	bl, 4
		jz	L866_last_try__hla_

L885_last_try_done__hla_:
		cmp	bl, 0
		jz	L831_first_input__hla_
		jnz	L847_other_input__hla_

L846_input_done__hla_:
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L807_guess_number__hla_+0], al	;/* guess_number */
		pop	eax
		cmp	cl, byte ptr [L807_guess_number__hla_+0]	;/* guess_number */
		jz	L917_correct_response__hla_
		cmp	bl, 4
		jz	L935_fl_done__hla_
		cmp	cl, byte ptr [L807_guess_number__hla_+0]	;/* guess_number */
		jl	L886_lower_response__hla_
		jg	L902_higher_response__hla_

L901_response_done__hla_:
		inc	bl
		jmp	L934_fl_test__hla_

L935_fl_done__hla_:
		push	L958_str__hla_
		call	STDOUT_PUTS	; puts

L932_game_done__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


