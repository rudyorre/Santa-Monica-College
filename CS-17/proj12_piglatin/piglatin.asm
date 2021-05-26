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

		include	'piglatin.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'piglatin.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'piglatin.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'piglatin.consts.inc'

		include	'piglatin.ro.inc'

; Code begins here:
L807_piglatin__hla_:
		mov	dword ptr [L810_EBXvalue__hla_+0], ebx	;/* EBXvalue */
		pop	dword ptr [L808_returnAddress__hla_+0]	;/* returnAddress */
		pop	word ptr [L809_temp16__hla_+0]	;/* temp16 */
		pop	word ptr [L809_temp16__hla_+0]	;/* temp16 */
		mov	bx, word ptr [L809_temp16__hla_+0]	;/* temp16 */
		mov	byte ptr [ebp+8], bl	;/* myCharacter */
		push	dword ptr [L808_returnAddress__hla_+0]	;/* returnAddress */
		push	dword ptr [L810_EBXvalue__hla_+0]	;/* EBXvalue */
		mov	bl, byte ptr [ebp+8]	;/* myCharacter */
		push	L824_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [ebp+8]	; myCharacter
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTC	; putc

L825_ifLowerVowel__hla_:
		cmp	bl, 97
		je	L826_lowerVowel__hla_
		cmp	bl, 101
		je	L826_lowerVowel__hla_
		cmp	bl, 105
		je	L826_lowerVowel__hla_
		cmp	bl, 111
		je	L826_lowerVowel__hla_
		cmp	bl, 117
		je	L826_lowerVowel__hla_

L827_ifUpperVowel__hla_:
		cmp	bl, 65
		je	L828_upperVowel__hla_
		cmp	bl, 69
		je	L828_upperVowel__hla_
		cmp	bl, 73
		je	L828_upperVowel__hla_
		cmp	bl, 79
		je	L828_upperVowel__hla_
		cmp	bl, 85
		je	L828_upperVowel__hla_

L829_ifLowerConsonant__hla_:
		cmp	bl, 97
		jge	L830_ge97__hla_
		jmp	L831_ifUpperConsonant__hla_

L830_ge97__hla_:
		cmp	bl, 122
		jle	L832_lowerConsonant__hla_

L831_ifUpperConsonant__hla_:
		cmp	bl, 65
		jge	L833_ge65__hla_
		jmp	L834_other__hla_

L833_ge65__hla_:
		cmp	bl, 90
		jle	L835_upperConsonant__hla_
		jmp	L834_other__hla_

L826_lowerVowel__hla_:
		push	L849_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L854_exitSequence__hla_

L828_upperVowel__hla_:
		push	L868_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L854_exitSequence__hla_

L832_lowerConsonant__hla_:
		push	L886_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L854_exitSequence__hla_

L835_upperConsonant__hla_:
		push	L904_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L854_exitSequence__hla_

L834_other__hla_:
		call	STDOUT_NEWLN	; newln
		jmp	L854_exitSequence__hla_

L854_exitSequence__hla_:
		pop	ebx
		ret
xL807_piglatin__hla___hla_:
;L807_piglatin__hla_ endp




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


		push	L935_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_FLUSHINPUT	; flushInput
		call	STDIN_GETC	; getc
		mov	byte ptr [L806_data__hla_+0], al	;/* data */
		mov	bx, 0
		mov	bl, byte ptr [L806_data__hla_+0]	;/* data */
		push	bx
		mov	bx, 0
		push	bx
		call	L807_piglatin__hla_
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


