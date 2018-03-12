;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Mon Mar 12 12:44:09 2018
;--------------------------------------------------------
	.module display
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _display_char
	.globl _memcpy
	.globl _timer
	.globl _pending_update
	.globl _pending_display_data
	.globl _display_data
	.globl _display_idx
	.globl _display_refresh
	.globl _display_show
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_display_idx::
	.ds 1
_display_data::
	.ds 4
_pending_display_data::
	.ds 4
_pending_update::
	.ds 1
_timer::
	.ds 2
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
;	display.c: 60: void display_refresh(void)
;	-----------------------------------------
;	 function display_refresh
;	-----------------------------------------
_display_refresh:
	sub	sp, #7
;	display.c: 62: int i = display_idx++;
	ld	a, _display_idx+0
	ld	xl, a
	inc	_display_idx+0
	clr	a
	ld	xh, a
	ldw	(0x06, sp), x
;	display.c: 63: uint8_t bit = 8+(i*2);
	ld	a, (0x07, sp)
	sll	a
	add	a, #0x08
;	display.c: 64: uint16_t digit = 0xFF00 ^ (3<<bit);
	ldw	x, #0x0003
	tnz	a
	jreq	00156$
00155$:
	sllw	x
	dec	a
	jrne	00155$
00156$:
	ld	a, xh
	cpl	a
	ld	xh, a
	ldw	(0x04, sp), x
;	display.c: 66: if (timer > 0)
	ldw	x, _timer+0
	jreq	00102$
;	display.c: 67: timer--;
	ldw	x, _timer+0
	decw	x
	ldw	_timer+0, x
00102$:
;	display.c: 68: if (pending_update && timer == 0) {
	tnz	_pending_update+0
	jreq	00104$
	ldw	x, _timer+0
	jrne	00104$
;	display.c: 69: memcpy(display_data, pending_display_data, sizeof(display_data));
	ldw	x, #_pending_display_data+0
	ldw	y, #_display_data+0
	push	#0x04
	push	#0x00
	pushw	x
	pushw	y
	call	_memcpy
	addw	sp, #6
;	display.c: 70: pending_update = 0;
	clr	_pending_update+0
;	display.c: 71: timer = 1500; // 1/2 of a second, approximately
	ldw	x, #0x05dc
	ldw	_timer+0, x
00104$:
;	display.c: 74: display_word(digit | display_data[i]);
	ldw	x, #_display_data+0
	addw	x, (0x06, sp)
	ld	a, (x)
	clrw	x
	ld	xl, a
	or	a, (0x05, sp)
	rlwa	x
	or	a, (0x04, sp)
	ld	xh, a
	ldw	(0x02, sp), x
;	display.c: 51: for (i = 0; i < 16; i++) {
	clr	(0x01, sp)
00122$:
;	display.c: 52: uint8_t bit = word & 1;
	ld	a, (0x03, sp)
	and	a, #0x01
	ld	yl, a
	clr	a
;	display.c: 53: word >>= 1;
	ldw	x, (0x02, sp)
	srlw	x
	ldw	(0x02, sp), x
;	display.c: 54: SET_DATA(bit);
	ldw	x, #0x500f
	ld	a, (x)
	exg	a, yl
	tnz	a
	exg	a, yl
	jreq	00109$
	or	a, #0x10
	ldw	x, #0x500f
	ld	(x), a
	jra	00112$
00109$:
	and	a, #0xef
	ldw	x, #0x500f
	ld	(x), a
00112$:
;	display.c: 55: PULSE_CLOCK();
	ldw	x, #0x5000
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
	ldw	x, #0x5000
	ld	a, (x)
	and	a, #0xfd
	ld	(x), a
;	display.c: 51: for (i = 0; i < 16; i++) {
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x10
	jrc	00122$
;	display.c: 57: SAVE_DATA();
	ldw	x, #0x5000
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
	ldw	x, #0x5000
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	display.c: 76: if (display_idx == 4)
	ld	a, _display_idx+0
	cp	a, #0x04
	jrne	00124$
;	display.c: 77: display_idx = 0;
	clr	_display_idx+0
00124$:
	addw	sp, #7
	ret
;	display.c: 80: uint8_t display_char(uint8_t ch, uint8_t dot)
;	-----------------------------------------
;	 function display_char
;	-----------------------------------------
_display_char:
	sub	sp, #4
;	display.c: 82: if (dot)
	tnz	(0x08, sp)
	jreq	00102$
;	display.c: 83: dot = 1;
	ld	a, #0x01
	ld	(0x08, sp), a
00102$:
;	display.c: 84: if (ch >= '0' && ch <= '9')
	ld	a, (0x07, sp)
	cp	a, #0x30
	jrc	00104$
	ld	a, (0x07, sp)
	cp	a, #0x39
	jrugt	00104$
;	display.c: 85: return display_number[ch-'0'] | dot;
	ldw	x, #_display_number+0
	ldw	(0x03, sp), x
	ld	a, (0x07, sp)
	sub	a, #0x30
	ld	xl, a
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	xh, a
	sllw	x
	addw	x, (0x03, sp)
	ldw	x, (x)
	ld	a, (0x08, sp)
	clr	(0x01, sp)
	pushw	x
	or	a, (2, sp)
	popw	x
	push	a
	ld	a, xh
	or	a, (0x02, sp)
	ld	xh, a
	pop	a
	jra	00106$
00104$:
;	display.c: 86: return dot;
	ld	a, (0x08, sp)
00106$:
	addw	sp, #4
	ret
;	display.c: 89: void display_show(uint8_t ch1, uint8_t dot1, uint8_t ch2, uint8_t dot2, uint8_t ch3, uint8_t dot3, uint8_t ch4, uint8_t dot4)
;	-----------------------------------------
;	 function display_show
;	-----------------------------------------
_display_show:
	pushw	x
;	display.c: 91: pending_display_data[3] = display_char(ch1, dot1);
	ldw	x, #_pending_display_data+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	addw	x, #0x0003
	pushw	x
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	call	_display_char
	addw	sp, #4
	ld	(x), a
;	display.c: 92: pending_display_data[2] = display_char(ch2, dot2);
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	pushw	x
	ld	a, (0x0a, sp)
	push	a
	ld	a, (0x0a, sp)
	push	a
	call	_display_char
	addw	sp, #4
	ld	(x), a
;	display.c: 93: pending_display_data[1] = display_char(ch3, dot3);
	ldw	x, (0x01, sp)
	incw	x
	pushw	x
	ld	a, (0x0c, sp)
	push	a
	ld	a, (0x0c, sp)
	push	a
	call	_display_char
	addw	sp, #4
	ld	(x), a
;	display.c: 94: pending_display_data[0] = display_char(ch4, dot4);
	ld	a, (0x0c, sp)
	push	a
	ld	a, (0x0c, sp)
	push	a
	call	_display_char
	popw	x
	ldw	x, (0x01, sp)
	ld	(x), a
;	display.c: 95: pending_update = 1;
	mov	_pending_update+0, #0x01
	popw	x
	ret
	.area CODE
_display_number:
	.dw #0x00FC
	.dw #0x0060
	.dw #0x00DA
	.dw #0x00F2
	.dw #0x0066
	.dw #0x00B6
	.dw #0x00BE
	.dw #0x00E0
	.dw #0x00FE
	.dw #0x00F6
	.area INITIALIZER
	.area CABS (ABS)
