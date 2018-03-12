;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Mon Mar 12 12:44:10 2018
;--------------------------------------------------------
	.module fixedpoint
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _fixed_round
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	fixedpoint.c: 25: uint32_t fixed_round(uint32_t x)
;	-----------------------------------------
;	 function fixed_round
;	-----------------------------------------
_fixed_round:
;	fixedpoint.c: 29: x >>= FIXED_SHIFT-1;
	ldw	y, (0x05, sp)
	ldw	x, (0x03, sp)
	ld	a, #0x0f
00103$:
	srlw	x
	rrcw	y
	dec	a
	jrne	00103$
	ldw	(0x05, sp), y
	ldw	(0x03, sp), x
;	fixedpoint.c: 31: round = x&1;
	ld	a, (0x06, sp)
	and	a, #0x01
	ld	xh, a
	clrw	y
	clr	a
	ld	a, xh
;	fixedpoint.c: 32: x >>= 1;
	ldw	y, (0x05, sp)
	ldw	x, (0x03, sp)
	srlw	x
	rrcw	y
	ldw	(0x05, sp), y
	ldw	(0x03, sp), x
;	fixedpoint.c: 34: return x+round;
	ld	yl, a
	clr	a
	clrw	x
	ld	yh, a
	addw	y, (0x05, sp)
	ld	a, xl
	adc	a, (0x04, sp)
	rlwa	x
	adc	a, (0x03, sp)
	ld	xh, a
	exgw	x, y
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
