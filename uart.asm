;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Mon Mar 12 12:44:09 2018
;--------------------------------------------------------
	.module uart
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _uart_read_to_buf
	.globl _uart_write_from_buf
	.globl _fixed_round
	.globl _digits_buf
	.globl _read_newline
	.globl _uart_read_len
	.globl _uart_read_buf
	.globl _uart_write_len
	.globl _uart_write_start
	.globl _uart_write_buf
	.globl _uart_init
	.globl _uart_write_ch
	.globl _uart_write_str
	.globl _uart_write_int
	.globl _uart_write_int32
	.globl _uart_write_milliamp
	.globl _uart_write_millivolt
	.globl _uart_write_fixed_point
	.globl _uart_drive
	.globl _uart_flush_writes
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_uart_write_buf::
	.ds 255
_uart_write_start::
	.ds 1
_uart_write_len::
	.ds 1
_uart_read_buf::
	.ds 64
_uart_read_len::
	.ds 1
_read_newline::
	.ds 1
_digits_buf::
	.ds 12
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
;	uart.c: 31: void uart_init()
;	-----------------------------------------
;	 function uart_init
;	-----------------------------------------
_uart_init:
;	uart.c: 33: USART1_CR1 = 0; // 8 bits, no parity
	mov	0x5234+0, #0x00
;	uart.c: 34: USART1_CR2 = 0;
	mov	0x5235+0, #0x00
;	uart.c: 35: USART1_CR3 = 0;
	mov	0x5236+0, #0x00
;	uart.c: 37: USART1_BRR2 = 0x1;
	mov	0x5233+0, #0x01
;	uart.c: 38: USART1_BRR1 = 0x1A; // 38400 baud, order important between BRRs, BRR1 must be last
	mov	0x5232+0, #0x1a
;	uart.c: 40: USART1_CR2 = USART_CR2_TEN | USART_CR2_REN; // Allow TX & RX
	mov	0x5235+0, #0x0c
;	uart.c: 42: uart_write_len = 0;
	clr	_uart_write_len+0
;	uart.c: 43: uart_write_start = 0;
	clr	_uart_write_start+0
;	uart.c: 44: uart_read_len = 0;
	clr	_uart_read_len+0
;	uart.c: 45: read_newline = 0;
	clr	_read_newline+0
	ret
;	uart.c: 53: void uart_write_ch(const char ch)
;	-----------------------------------------
;	 function uart_write_ch
;	-----------------------------------------
_uart_write_ch:
	pushw	x
;	uart.c: 55: if (uart_write_len < sizeof(uart_write_buf))
	ld	a, _uart_write_len+0
	cp	a, #0xff
	jrnc	00103$
;	uart.c: 56: uart_write_buf[uart_write_len++] = ch;
	ldw	x, #_uart_write_buf+0
	ldw	(0x01, sp), x
	ld	a, _uart_write_len+0
	ld	xl, a
	inc	_uart_write_len+0
	clr	a
	ld	xh, a
	addw	x, (0x01, sp)
	ld	a, (0x05, sp)
	ld	(x), a
00103$:
	popw	x
	ret
;	uart.c: 59: void uart_write_str(const char *str)
;	-----------------------------------------
;	 function uart_write_str
;	-----------------------------------------
_uart_write_str:
	sub	sp, #5
;	uart.c: 64: if (uart_write_start > 0) {
	tnz	_uart_write_start+0
	jreq	00119$
;	uart.c: 65: for (i = 0; i < uart_write_len; i++) {
	ldw	x, #_uart_write_buf+0
	ldw	(0x04, sp), x
	clr	(0x01, sp)
00106$:
	ld	a, (0x01, sp)
	cp	a, _uart_write_len+0
	jrnc	00101$
;	uart.c: 66: uart_write_buf[i] = uart_write_buf[i+uart_write_start];
	clrw	y
	ld	a, (0x01, sp)
	ld	yl, a
	addw	y, (0x04, sp)
	ld	a, (0x01, sp)
	add	a, _uart_write_start+0
	clrw	x
	ld	xl, a
	addw	x, (0x04, sp)
	ld	a, (x)
	ld	(y), a
;	uart.c: 65: for (i = 0; i < uart_write_len; i++) {
	inc	(0x01, sp)
	jra	00106$
00101$:
;	uart.c: 68: uart_write_start = 0;
	clr	_uart_write_start+0
;	uart.c: 71: for(i = 0; str[i] != 0 && uart_write_len < sizeof(uart_write_buf); i++) {
00119$:
	ldw	x, #_uart_write_buf+0
	ldw	(0x02, sp), x
	clr	(0x01, sp)
00110$:
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x08, sp)
	ld	a, (x)
	ld	yh, a
	cp	a, #0x00
	jreq	00112$
	ld	a, _uart_write_len+0
	cp	a, #0xff
	jrnc	00112$
;	uart.c: 72: uart_write_buf[uart_write_len] = str[i];
	clrw	x
	ld	a, _uart_write_len+0
	ld	xl, a
	addw	x, (0x02, sp)
	ld	a, yh
	ld	(x), a
;	uart.c: 73: uart_write_len++;
	inc	_uart_write_len+0
;	uart.c: 71: for(i = 0; str[i] != 0 && uart_write_len < sizeof(uart_write_buf); i++) {
	inc	(0x01, sp)
	jra	00110$
00112$:
	addw	sp, #5
	ret
;	uart.c: 78: static uint8_t int_to_digits(uint16_t val)
;	-----------------------------------------
;	 function int_to_digits
;	-----------------------------------------
_int_to_digits:
	sub	sp, #5
;	uart.c: 81: uint8_t num_digits = 0;
	clr	(0x05, sp)
;	uart.c: 83: digits_buf[0] = '0';
	ldw	x, #_digits_buf+0
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	ld	a, #0x30
	ld	(x), a
;	uart.c: 85: for (i = 0; i < 6 && val != 0; i++) {
	clr	(0x02, sp)
00106$:
	ld	a, (0x02, sp)
	cp	a, #0x06
	jrnc	00103$
	ldw	x, (0x08, sp)
	cpw	x, #0x0000
	jreq	00103$
;	uart.c: 86: uint8_t digit = val % 10;
	ldw	x, (0x08, sp)
	ldw	y, #0x000a
	divw	x, y
	exg	a, yl
	ld	(0x01, sp), a
	exg	a, yl
;	uart.c: 87: digits_buf[i] = '0' + digit;
	clrw	x
	ld	a, (0x02, sp)
	ld	xl, a
	addw	x, (0x03, sp)
	ld	a, (0x01, sp)
	add	a, #0x30
	ld	(x), a
;	uart.c: 88: val /= 10;
	ldw	x, (0x08, sp)
	ldw	y, #0x000a
	divw	x, y
	ldw	(0x08, sp), x
;	uart.c: 89: if (digit) // We only really want to know about non-zero digits
	tnz	(0x01, sp)
	jreq	00107$
;	uart.c: 90: num_digits = i;
	ld	a, (0x02, sp)
	ld	(0x05, sp), a
00107$:
;	uart.c: 85: for (i = 0; i < 6 && val != 0; i++) {
	inc	(0x02, sp)
	jra	00106$
00103$:
;	uart.c: 93: return num_digits + 1;
	ld	a, (0x05, sp)
	inc	a
	addw	sp, #5
	ret
;	uart.c: 96: void uart_write_int(uint16_t val)
;	-----------------------------------------
;	 function uart_write_int
;	-----------------------------------------
_uart_write_int:
	sub	sp, #3
;	uart.c: 101: highest_nonzero = int_to_digits(val);
	ldw	x, (0x06, sp)
	pushw	x
	call	_int_to_digits
	popw	x
;	uart.c: 103: for (i = highest_nonzero-1; i >= 0; i--) {
	dec	a
	ldw	x, #_digits_buf+0
	ldw	(0x02, sp), x
	ld	(0x01, sp), a
00103$:
	tnz	(0x01, sp)
	jrmi	00105$
;	uart.c: 104: uart_write_ch(digits_buf[i]);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x02, sp)
	ld	a, (x)
	push	a
	call	_uart_write_ch
	pop	a
;	uart.c: 103: for (i = highest_nonzero-1; i >= 0; i--) {
	dec	(0x01, sp)
	jra	00103$
00105$:
	addw	sp, #3
	ret
;	uart.c: 108: static uint8_t int32_to_digits(uint32_t val)
;	-----------------------------------------
;	 function int32_to_digits
;	-----------------------------------------
_int32_to_digits:
	sub	sp, #5
;	uart.c: 111: uint8_t num_digits = 0;
	clr	(0x03, sp)
;	uart.c: 113: digits_buf[0] = '0';
	ldw	x, #_digits_buf+0
	ldw	(0x04, sp), x
	ldw	x, (0x04, sp)
	ld	a, #0x30
	ld	(x), a
;	uart.c: 115: for (i = 0; i < 12 && val != 0; i++) {
	clr	(0x02, sp)
00106$:
	ld	a, (0x02, sp)
	cp	a, #0x0c
	jrnc	00103$
	ldw	x, (0x0a, sp)
	cpw	x, #0x0000
	jrne	00129$
	ldw	x, (0x08, sp)
	cpw	x, #0x0000
	jreq	00103$
00129$:
;	uart.c: 116: uint8_t digit = val % 10;
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, (0x0e, sp)
	pushw	x
	ldw	x, (0x0e, sp)
	pushw	x
	call	__modulong
	addw	sp, #8
	ld	a, xl
	ld	(0x01, sp), a
;	uart.c: 117: digits_buf[i] = '0' + digit;
	clrw	x
	ld	a, (0x02, sp)
	ld	xl, a
	addw	x, (0x04, sp)
	ld	a, (0x01, sp)
	add	a, #0x30
	ld	(x), a
;	uart.c: 118: val /= 10;
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	ldw	x, (0x0e, sp)
	pushw	x
	ldw	x, (0x0e, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x0a, sp), x
	ldw	(0x08, sp), y
;	uart.c: 119: if (digit) // We only really want to know about non-zero digits
	tnz	(0x01, sp)
	jreq	00107$
;	uart.c: 120: num_digits = i;
	ld	a, (0x02, sp)
	ld	(0x03, sp), a
00107$:
;	uart.c: 115: for (i = 0; i < 12 && val != 0; i++) {
	inc	(0x02, sp)
	jra	00106$
00103$:
;	uart.c: 123: return num_digits + 1;
	ld	a, (0x03, sp)
	inc	a
	addw	sp, #5
	ret
;	uart.c: 126: void uart_write_int32(uint32_t val)
;	-----------------------------------------
;	 function uart_write_int32
;	-----------------------------------------
_uart_write_int32:
	sub	sp, #3
;	uart.c: 131: highest_nonzero = int32_to_digits(val);
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	call	_int32_to_digits
	addw	sp, #4
;	uart.c: 133: for (i = highest_nonzero-1; i >= 0; i--) {
	dec	a
	ldw	x, #_digits_buf+0
	ldw	(0x02, sp), x
	ld	(0x01, sp), a
00103$:
	tnz	(0x01, sp)
	jrmi	00105$
;	uart.c: 134: uart_write_ch(digits_buf[i]);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x02, sp)
	ld	a, (x)
	push	a
	call	_uart_write_ch
	pop	a
;	uart.c: 133: for (i = highest_nonzero-1; i >= 0; i--) {
	dec	(0x01, sp)
	jra	00103$
00105$:
	addw	sp, #3
	ret
;	uart.c: 138: void uart_write_milliamp(uint16_t val)
;	-----------------------------------------
;	 function uart_write_milliamp
;	-----------------------------------------
_uart_write_milliamp:
	sub	sp, #3
;	uart.c: 143: highest_nonzero = int_to_digits(val);
	ldw	x, (0x06, sp)
	pushw	x
	call	_int_to_digits
	popw	x
;	uart.c: 145: for (i = highest_nonzero-1; i >= 0; i--) {
	dec	a
	ldw	x, #_digits_buf+0
	ldw	(0x01, sp), x
	ld	(0x03, sp), a
00105$:
	tnz	(0x03, sp)
	jrmi	00107$
;	uart.c: 146: if (i == 2)
	ld	a, (0x03, sp)
	cp	a, #0x02
	jrne	00102$
;	uart.c: 147: uart_write_ch('.');
	push	#0x2e
	call	_uart_write_ch
	pop	a
00102$:
;	uart.c: 148: uart_write_ch(digits_buf[i]);
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
	addw	x, (0x01, sp)
	ld	a, (x)
	push	a
	call	_uart_write_ch
	pop	a
;	uart.c: 145: for (i = highest_nonzero-1; i >= 0; i--) {
	dec	(0x03, sp)
	jra	00105$
00107$:
	addw	sp, #3
	ret
;	uart.c: 152: void uart_write_millivolt(uint16_t val)
;	-----------------------------------------
;	 function uart_write_millivolt
;	-----------------------------------------
_uart_write_millivolt:
	sub	sp, #3
;	uart.c: 157: highest_nonzero = int_to_digits(val);
	ldw	x, (0x06, sp)
	pushw	x
	call	_int_to_digits
	popw	x
;	uart.c: 159: for (i = highest_nonzero-1; i >= 0; i--) {
	dec	a
	ldw	x, #_digits_buf+0
	ldw	(0x02, sp), x
	ld	(0x01, sp), a
00105$:
	tnz	(0x01, sp)
	jrmi	00107$
;	uart.c: 160: if (i == 2)
	ld	a, (0x01, sp)
	cp	a, #0x02
	jrne	00102$
;	uart.c: 161: uart_write_ch('.');
	push	#0x2e
	call	_uart_write_ch
	pop	a
00102$:
;	uart.c: 162: uart_write_ch(digits_buf[i]);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x02, sp)
	ld	a, (x)
	push	a
	call	_uart_write_ch
	pop	a
;	uart.c: 159: for (i = highest_nonzero-1; i >= 0; i--) {
	dec	(0x01, sp)
	jra	00105$
00107$:
	addw	sp, #3
	ret
;	uart.c: 166: void uart_write_fixed_point(uint32_t val)
;	-----------------------------------------
;	 function uart_write_fixed_point
;	-----------------------------------------
_uart_write_fixed_point:
	sub	sp, #4
;	uart.c: 171: tmp = val >> FIXED_SHIFT;
	ldw	y, (0x07, sp)
	clrw	x
;	uart.c: 172: uart_write_int(tmp);
	pushw	y
	call	_uart_write_int
	popw	x
;	uart.c: 173: uart_write_ch('.');
	push	#0x2e
	call	_uart_write_ch
	pop	a
;	uart.c: 176: tmp = val & FIXED_FRACTION_MASK;
	ldw	y, (0x09, sp)
	clrw	x
;	uart.c: 179: tmp = fixed_round(tmp*10000);
	pushw	y
	pushw	x
	push	#0x10
	push	#0x27
	clrw	x
	pushw	x
	call	__mullong
	addw	sp, #8
	pushw	x
	pushw	y
	call	_fixed_round
	addw	sp, #4
	ldw	(0x01, sp), y
;	uart.c: 182: if (tmp < 1000)
	cpw	x, #0x03e8
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	a, (0x01, sp)
	sbc	a, #0x00
	jrnc	00102$
;	uart.c: 183: uart_write_ch('0');
	pushw	x
	push	#0x30
	call	_uart_write_ch
	pop	a
	popw	x
00102$:
;	uart.c: 184: if (tmp < 100)
	cpw	x, #0x0064
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	a, (0x01, sp)
	sbc	a, #0x00
	jrnc	00104$
;	uart.c: 185: uart_write_ch('0');
	pushw	x
	push	#0x30
	call	_uart_write_ch
	pop	a
	popw	x
00104$:
;	uart.c: 186: if (tmp < 10)
	cpw	x, #0x000a
	ld	a, (0x02, sp)
	sbc	a, #0x00
	ld	a, (0x01, sp)
	sbc	a, #0x00
	jrnc	00106$
;	uart.c: 187: uart_write_ch('0');
	pushw	x
	push	#0x30
	call	_uart_write_ch
	pop	a
	popw	x
00106$:
;	uart.c: 190: uart_write_int32(tmp);
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	call	_uart_write_int32
	addw	sp, #8
	ret
;	uart.c: 193: void uart_write_from_buf(void)
;	-----------------------------------------
;	 function uart_write_from_buf
;	-----------------------------------------
_uart_write_from_buf:
;	uart.c: 195: USART1_DR = uart_write_buf[uart_write_start];
	ldw	x, #_uart_write_buf+0
	ld	a, xl
	add	a, _uart_write_start+0
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	ldw	x, #0x5231
	ld	(x), a
;	uart.c: 196: uart_write_start++;
	inc	_uart_write_start+0
;	uart.c: 197: uart_write_len--;
	dec	_uart_write_len+0
;	uart.c: 199: if (uart_write_len == 0)
	tnz	_uart_write_len+0
	jrne	00103$
;	uart.c: 200: uart_write_start = 0;
	clr	_uart_write_start+0
00103$:
	ret
;	uart.c: 208: void uart_read_to_buf(void)
;	-----------------------------------------
;	 function uart_read_to_buf
;	-----------------------------------------
_uart_read_to_buf:
;	uart.c: 211: uint8_t ch = uart_read_ch();
	ldw	x, #0x5231
	ld	a, (x)
	ld	yh, a
;	uart.c: 213: if (ch >= 'a' && ch <= 'z')
	cp	a, #0x61
	jrc	00102$
	cp	a, #0x7a
	jrugt	00102$
;	uart.c: 214: ch = ch - 'a' + 'A'; // Convert letters to uppercase
	add	a, #0xe0
	ld	yh, a
00102$:
;	uart.c: 216: uart_read_buf[uart_read_len] = ch;
	ldw	x, #_uart_read_buf+0
	ld	a, xl
	add	a, _uart_read_len+0
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, yh
	ld	(x), a
;	uart.c: 217: uart_read_len++;
	inc	_uart_read_len+0
;	uart.c: 219: if (ch == '\r' || ch == '\n')
	ld	a, yh
	cp	a, #0x0d
	jreq	00104$
	ld	a, yh
	cp	a, #0x0a
	jrne	00105$
00104$:
;	uart.c: 220: read_newline = 1;
	mov	_read_newline+0, #0x01
00105$:
;	uart.c: 223: if (uart_read_len == sizeof(uart_read_buf) && !read_newline) {
	ld	a, _uart_read_len+0
	cp	a, #0x40
	jrne	00111$
	tnz	_read_newline+0
	jrne	00111$
;	uart.c: 224: uart_read_len = 0;
	clr	_uart_read_len+0
;	uart.c: 225: uart_write_str("READ OVERFLOW\r\n");
	ldw	x, #___str_0+0
	pushw	x
	call	_uart_write_str
	popw	x
00111$:
	ret
;	uart.c: 229: void uart_drive(void)
;	-----------------------------------------
;	 function uart_drive
;	-----------------------------------------
_uart_drive:
;	uart.c: 231: uint8_t sr = USART1_SR;
	ldw	x, #0x5230
	ld	a, (x)
;	uart.c: 233: if (sr & USART_SR_RXNE) {
	bcp	a, #0x20
	jreq	00102$
;	uart.c: 234: uart_read_to_buf();
	push	a
	call	_uart_read_to_buf
	pop	a
00102$:
;	uart.c: 236: if ((sr & USART_SR_TXE) && uart_write_len) {
	tnz	a
	jrpl	00106$
	tnz	_uart_write_len+0
	jreq	00106$
;	uart.c: 237: uart_write_from_buf();
	call	_uart_write_from_buf
00106$:
	ret
;	uart.c: 241: void uart_flush_writes(void)
;	-----------------------------------------
;	 function uart_flush_writes
;	-----------------------------------------
_uart_flush_writes:
;	uart.c: 243: while (uart_write_len > 0)
00101$:
	tnz	_uart_write_len+0
	jreq	00104$
;	uart.c: 244: uart_drive();
	call	_uart_drive
	jra	00101$
00104$:
	ret
	.area CODE
___str_0:
	.ascii "READ OVERFLOW"
	.db 0x0D
	.db 0x0A
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
