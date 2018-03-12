;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Mon Mar 12 12:44:10 2018
;--------------------------------------------------------
	.module parse
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _parse_num
	.globl _uart_write_str
	.globl _uart_write_ch
	.globl _parse_millinum
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
;	parse.c: 22: uint16_t parse_num(uint8_t *s, uint8_t **stop, uint8_t *digits_seen)
;	-----------------------------------------
;	 function parse_num
;	-----------------------------------------
_parse_num:
	sub	sp, #6
;	parse.c: 25: uint16_t num = 0;
	clrw	x
	ldw	(0x03, sp), x
;	parse.c: 27: *digits_seen = 0;
	ldw	y, (0x0d, sp)
	ldw	(0x05, sp), y
	ldw	x, (0x05, sp)
	clr	(x)
	ldw	y, (0x09, sp)
00104$:
;	parse.c: 29: for (; *s >= '0' && *s <= '9'; s++) {
	ld	a, (y)
	cp	a, #0x30
	jrc	00101$
	cp	a, #0x39
	jrugt	00101$
;	parse.c: 30: digit = *s - '0';
	sub	a, #0x30
;	parse.c: 31: num *= 10;
	push	a
	pushw	y
	ldw	x, (0x06, sp)
	pushw	x
	push	#0x0a
	push	#0x00
	call	__mulint
	addw	sp, #4
	popw	y
	pop	a
	ldw	(0x01, sp), x
;	parse.c: 32: num += digit;
	clrw	x
	ld	xl, a
	addw	x, (0x01, sp)
	ldw	(0x03, sp), x
;	parse.c: 33: (*digits_seen)++;
	ldw	x, (0x05, sp)
	inc	(x)
;	parse.c: 29: for (; *s >= '0' && *s <= '9'; s++) {
	incw	y
	jra	00104$
00101$:
;	parse.c: 36: *stop = s;
	ldw	x, (0x0b, sp)
	ldw	(x), y
;	parse.c: 37: return num;
	ldw	x, (0x03, sp)
	addw	sp, #6
	ret
;	parse.c: 40: uint16_t parse_millinum(uint8_t *s)
;	-----------------------------------------
;	 function parse_millinum
;	-----------------------------------------
_parse_millinum:
	sub	sp, #27
;	parse.c: 42: uint8_t *t = s;
	ldw	y, (0x1e, sp)
	ldw	(0x0a, sp), y
;	parse.c: 48: whole_digits = parse_num(s, &stop, &digits_seen);
	ldw	x, sp
	incw	x
	ldw	(0x1a, sp), x
	ldw	y, (0x1a, sp)
	ldw	x, sp
	addw	x, #8
	ldw	(0x18, sp), x
	ldw	x, (0x18, sp)
	pushw	y
	pushw	x
	ldw	x, (0x0e, sp)
	pushw	x
	call	_parse_num
	addw	sp, #6
	ldw	(0x16, sp), x
;	parse.c: 49: if (whole_digits > 62 || digits_seen > 2)
	ldw	x, (0x16, sp)
	cpw	x, #0x003e
	jrule	00151$
	jp	00116$
00151$:
	ld	a, (0x01, sp)
	cp	a, #0x02
	jrule	00152$
	jp	00116$
00152$:
;	parse.c: 52: whole_digits *= 1000;
	ldw	x, (0x16, sp)
	pushw	x
	push	#0xe8
	push	#0x03
	call	__mulint
	addw	sp, #4
	ldw	(0x02, sp), x
;	parse.c: 54: if (*stop == '\0')
	ldw	x, (0x08, sp)
	ld	a, (x)
	tnz	a
	jrne	00105$
;	parse.c: 55: return whole_digits;
	ldw	x, (0x02, sp)
	jp	00117$
00105$:
;	parse.c: 57: if (*stop != '.')
	cp	a, #0x2e
	jrne	00116$
;	parse.c: 60: fraction_digits = parse_num(stop+1, &stop, &digits_seen);
	ldw	y, (0x1a, sp)
	ldw	(0x14, sp), y
	ldw	y, (0x18, sp)
	incw	x
	ld	a, (0x15, sp)
	push	a
	ld	a, (0x15, sp)
	push	a
	pushw	y
	pushw	x
	call	_parse_num
	addw	sp, #6
	clrw	y
	ldw	(0x06, sp), x
	ldw	(0x04, sp), y
;	parse.c: 61: if (fraction_digits > 999 || digits_seen > 3)
	ldw	x, #0x03e7
	cpw	x, (0x06, sp)
	clr	a
	sbc	a, (0x05, sp)
	clr	a
	sbc	a, (0x04, sp)
	jrc	00116$
	ld	a, (0x01, sp)
	cp	a, #0x03
	jrugt	00116$
;	parse.c: 64: if (digits_seen == 1)
	ld	a, (0x01, sp)
	cp	a, #0x01
	jrne	00114$
;	parse.c: 65: fraction_digits *= 100;
	ldw	x, (0x06, sp)
	pushw	x
	ldw	x, (0x06, sp)
	pushw	x
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x06, sp), x
	ldw	(0x04, sp), y
	jra	00115$
00114$:
;	parse.c: 66: else if (digits_seen == 2)
	ld	a, (0x01, sp)
	cp	a, #0x02
	jrne	00115$
;	parse.c: 67: fraction_digits *= 10;
	ldw	x, (0x06, sp)
	pushw	x
	ldw	x, (0x06, sp)
	pushw	x
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x06, sp), x
	ldw	(0x04, sp), y
00115$:
;	parse.c: 69: return whole_digits + fraction_digits;
	ldw	x, (0x02, sp)
	clr	a
	clr	(0x10, sp)
	addw	x, (0x06, sp)
	adc	a, (0x05, sp)
	ld	(0x0d, sp), a
	ld	a, (0x10, sp)
	adc	a, (0x04, sp)
	jra	00117$
;	parse.c: 71: invalid_number:
00116$:
;	parse.c: 72: uart_write_str("INVALID NUMBER '");
	ldw	x, #___str_0+0
	pushw	x
	call	_uart_write_str
	popw	x
;	parse.c: 73: uart_write_str(t);
	ldw	x, (0x0a, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	parse.c: 74: uart_write_ch('\'');
	push	#0x27
	call	_uart_write_ch
	pop	a
;	parse.c: 75: uart_write_str("\r\n");
	ldw	x, #___str_1+0
	pushw	x
	call	_uart_write_str
	popw	x
;	parse.c: 76: return 0xFFFF;
	ldw	x, #0xffff
00117$:
	addw	sp, #27
	ret
	.area CODE
___str_0:
	.ascii "INVALID NUMBER '"
	.db 0x00
___str_1:
	.db 0x0D
	.db 0x0A
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
