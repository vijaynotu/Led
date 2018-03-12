;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Mon Mar 12 12:44:11 2018
;--------------------------------------------------------
	.module adc
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _fixed_round
	.globl _adc_init
	.globl _adc_start
	.globl _adc_to_volt
	.globl _adc_read
	.globl _adc_channel
	.globl _adc_ready
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_sum:
	.ds 4
_count:
	.ds 1
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
;	adc.c: 25: void adc_init(void)
;	-----------------------------------------
;	 function adc_init
;	-----------------------------------------
_adc_init:
;	adc.c: 27: ADC1_CR1 = 0x70; // Power down, clock/18
	mov	0x5401+0, #0x70
;	adc.c: 28: ADC1_CR2 = 0x08; // Right alignment
	mov	0x5402+0, #0x08
;	adc.c: 29: ADC1_CR3 = 0x00;
	mov	0x5403+0, #0x00
;	adc.c: 30: ADC1_CSR = 0x00;
	mov	0x5400+0, #0x00
;	adc.c: 32: ADC1_TDRL = 0x0F;
	mov	0x5407+0, #0x0f
;	adc.c: 34: ADC1_CR1 |= 0x01; // Turn on the ADC
	bset	0x5401, #0
	ret
;	adc.c: 43: void adc_start(uint8_t channel)
;	-----------------------------------------
;	 function adc_start
;	-----------------------------------------
_adc_start:
;	adc.c: 45: uint8_t csr = ADC1_CSR;
	ldw	x, #0x5400
	ld	a, (x)
;	adc.c: 46: csr &= 0x70; // Turn off EOC, Clear Channel
	and	a, #0x70
;	adc.c: 47: csr |= channel; // Select channel
	or	a, (0x03, sp)
;	adc.c: 48: ADC1_CSR = csr;
	ldw	x, #0x5400
	ld	(x), a
;	adc.c: 50: ADC1_CR1 |= 1; // Trigger conversion
	bset	0x5401, #0
;	adc.c: 52: sum = 0;
	clrw	x
	ldw	_sum+2, x
	ldw	_sum+0, x
;	adc.c: 53: count = 0;
	clr	_count+0
	ret
;	adc.c: 56: fixed_t adc_to_volt(uint16_t adc, calibrate_t *cal)
;	-----------------------------------------
;	 function adc_to_volt
;	-----------------------------------------
_adc_to_volt:
	sub	sp, #26
;	adc.c: 60: tmp = adc * cal->a;
	ldw	y, (0x1f, sp)
	ldw	(0x15, sp), y
	ldw	x, (0x15, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	ldw	(0x05, sp), x
	ldw	x, (0x1d, sp)
	ldw	(0x0b, sp), x
	clrw	x
	pushw	y
	ldw	y, (0x07, sp)
	pushw	y
	ldw	y, (0x0f, sp)
	pushw	y
	pushw	x
	call	__mullong
	addw	sp, #8
	ldw	(0x0f, sp), x
	ldw	(0x0d, sp), y
;	adc.c: 62: if (tmp > cal->b)
	ldw	x, (0x15, sp)
	ld	a, (0x7, x)
	ld	(0x14, sp), a
	ld	a, (0x6, x)
	ld	(0x13, sp), a
	ldw	x, (0x4, x)
	ldw	(0x11, sp), x
	ldw	x, (0x13, sp)
	cpw	x, (0x0f, sp)
	ld	a, (0x12, sp)
	sbc	a, (0x0e, sp)
	ld	a, (0x11, sp)
	sbc	a, (0x0d, sp)
	jrnc	00102$
;	adc.c: 63: tmp -= cal->b;
	ldw	x, (0x0f, sp)
	subw	x, (0x13, sp)
	ldw	(0x19, sp), x
	ld	a, (0x0e, sp)
	sbc	a, (0x12, sp)
	ld	(0x18, sp), a
	ld	a, (0x0d, sp)
	sbc	a, (0x11, sp)
	ld	(0x17, sp), a
	ldw	y, (0x19, sp)
	ldw	(0x03, sp), y
	ldw	y, (0x17, sp)
	ldw	(0x01, sp), y
	jra	00103$
00102$:
;	adc.c: 65: tmp = 0;
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
00103$:
;	adc.c: 67: return fixed_round(tmp);
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	call	_fixed_round
	addw	sp, #30
	ret
;	adc.c: 78: uint16_t adc_read(void)
;	-----------------------------------------
;	 function adc_read
;	-----------------------------------------
_adc_read:
;	adc.c: 80: return sum/8;
	ldw	x, _sum+2
	ldw	y, _sum+0
	srlw	y
	rrcw	x
	srlw	y
	rrcw	x
	srlw	y
	rrcw	x
	ret
;	adc.c: 83: uint8_t adc_channel(void)
;	-----------------------------------------
;	 function adc_channel
;	-----------------------------------------
_adc_channel:
;	adc.c: 85: return ADC1_CSR & 0x0F;
	ldw	x, #0x5400
	ld	a, (x)
	and	a, #0x0f
	ret
;	adc.c: 88: uint8_t adc_ready(void)
;	-----------------------------------------
;	 function adc_ready
;	-----------------------------------------
_adc_ready:
	sub	sp, #3
;	adc.c: 90: if (ADC1_CSR & 0x80) {
	ldw	x, #0x5400
	ld	a, (x)
	ld	(0x03, sp), a
	tnz	(0x03, sp)
	jrpl	00105$
;	adc.c: 72: uint16_t val = ADC1_DRL;
	ldw	x, #0x5405
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	(0x01, sp), x
;	adc.c: 73: uint16_t valh = ADC1_DRH;
	ldw	x, #0x5404
	ld	a, (x)
	ld	xh, a
	clr	a
;	adc.c: 75: return val | (valh<<8);
	clr	a
	or	a, (0x02, sp)
	ld	xl, a
	ld	a, xh
	or	a, (0x01, sp)
;	adc.c: 91: sum += _adc_read();
	ld	yh, a
	ld	a, xl
	clrw	x
	ld	yl, a
	addw	y, _sum+2
	ld	a, xl
	adc	a, _sum+1
	rlwa	x
	adc	a, _sum+0
	ld	xh, a
	ldw	_sum+2, y
	ldw	_sum+0, x
;	adc.c: 92: count++;
	ld	a, _count+0
	inc	a
;	adc.c: 93: if (count < 64) {
	ld	_count+0, a
	cp	a, #0x40
	jrnc	00102$
;	adc.c: 39: ADC1_CSR &= 0x7F; // Turn off EOC
	ld	a, (0x03, sp)
	and	a, #0x7f
	ldw	x, #0x5400
	ld	(x), a
;	adc.c: 40: ADC1_CR1 |= 1; // Trigger conversion
	ldw	x, #0x5401
	ld	a, (x)
	or	a, #0x01
	ld	(x), a
;	adc.c: 95: return 0;
	clr	a
	jra	00108$
00102$:
;	adc.c: 97: return 1;
	ld	a, #0x01
;	adc.c: 100: return 0;
	.byte 0x21
00105$:
	clr	a
00108$:
	addw	sp, #3
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
