;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Mon Mar 12 12:44:10 2018
;--------------------------------------------------------
	.module outputs
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _pwm_from_set
	.globl _uart_write_int
	.globl _uart_write_str
	.globl _fixed_round
	.globl _pwm_init
	.globl _output_commit
	.globl _output_check_state
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
;	outputs.c: 29: void pwm_init(void)
;	-----------------------------------------
;	 function pwm_init
;	-----------------------------------------
_pwm_init:
;	outputs.c: 32: TIM1_CR1 = 0x10; // Down direction
	mov	0x5250+0, #0x10
;	outputs.c: 33: TIM1_ARRH = PWM_HIGH; // Reload counter = 16384
	mov	0x5262+0, #0x20
;	outputs.c: 34: TIM1_ARRL = PWM_LOW;
	mov	0x5263+0, #0x00
;	outputs.c: 35: TIM1_PSCRH = 0; // Prescaler 0 means division by 1
	mov	0x5260+0, #0x00
;	outputs.c: 36: TIM1_PSCRL = 0;
	mov	0x5261+0, #0x00
;	outputs.c: 37: TIM1_RCR = 0; // Continuous
	mov	0x5264+0, #0x00
;	outputs.c: 39: TIM1_CCMR1 = 0x70;    //  Set up to use PWM mode 2.
	mov	0x5258+0, #0x70
;	outputs.c: 40: TIM1_CCER1 = 0x03;    //  Output is enabled for channel 1, active low
	mov	0x525c+0, #0x03
;	outputs.c: 41: TIM1_CCR1H = 0x00;      //  Start with the PWM signal off
	mov	0x5265+0, #0x00
;	outputs.c: 42: TIM1_CCR1L = 0x00;
	mov	0x5266+0, #0x00
;	outputs.c: 44: TIM1_BKR = 0x80;       //  Enable the main output.
	mov	0x526d+0, #0x80
;	outputs.c: 47: TIM2_ARRH = PWM_HIGH; // Reload counter = 16384
	mov	0x530f+0, #0x20
;	outputs.c: 48: TIM2_ARRL = PWM_LOW;
	mov	0x5310+0, #0x00
;	outputs.c: 49: TIM2_PSCR = 0; // Prescaler 0 means division by 1
	mov	0x530e+0, #0x00
;	outputs.c: 50: TIM2_CR1 = 0x00;
	mov	0x5300+0, #0x00
;	outputs.c: 52: TIM2_CCMR1 = 0x70;    //  Set up to use PWM mode 2.
	mov	0x5307+0, #0x70
;	outputs.c: 53: TIM2_CCER1 = 0x03;    //  Output is enabled for channel 1, active low
	mov	0x530a+0, #0x03
;	outputs.c: 54: TIM2_CCR1H = 0x00;      //  Start with the PWM signal off
	mov	0x5311+0, #0x00
;	outputs.c: 55: TIM2_CCR1L = 0x00;
	mov	0x5312+0, #0x00
	ret
;	outputs.c: 77: uint16_t pwm_from_set(fixed_t set, calibrate_t *cal)
;	-----------------------------------------
;	 function pwm_from_set
;	-----------------------------------------
_pwm_from_set:
	sub	sp, #14
;	outputs.c: 82: tmp = set * cal->a;
	ldw	y, (0x13, sp)
	ldw	(0x0d, sp), y
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x2, x)
	exgw	x, y
	popw	x
	ldw	x, (x)
	ldw	(0x01, sp), x
	ldw	x, (0x11, sp)
	ldw	(0x07, sp), x
	clrw	x
	pushw	y
	ldw	y, (0x03, sp)
	pushw	y
	ldw	y, (0x0b, sp)
	pushw	y
	pushw	x
	call	__mullong
	addw	sp, #8
	ldw	(0x0b, sp), x
	ldw	(0x09, sp), y
;	outputs.c: 85: tmp += cal->b;
	ldw	x, (0x0d, sp)
	pushw	x
	ldw	x, (0x6, x)
	exgw	x, y
	popw	x
	ldw	x, (0x4, x)
	addw	y, (0x0b, sp)
	ld	a, xl
	adc	a, (0x0a, sp)
	rlwa	x
	adc	a, (0x09, sp)
	ld	xh, a
;	outputs.c: 91: return fixed_round(tmp);
	pushw	y
	pushw	x
	call	_fixed_round
	addw	sp, #18
	ret
;	outputs.c: 118: void output_commit(cfg_output_t *cfg, cfg_system_t *sys, uint8_t state_constant_current)
;	-----------------------------------------
;	 function output_commit
;	-----------------------------------------
_output_commit:
	sub	sp, #13
;	outputs.c: 121: if (sys->output) {
	ldw	y, (0x12, sp)
	ldw	(0x03, sp), y
	ldw	x, (0x03, sp)
	ld	a, (0x13, x)
	ld	(0x0b, sp), a
	tnz	(0x0b, sp)
	jrne	00113$
	jp	00102$
00113$:
;	outputs.c: 122: control_voltage(cfg, sys);
	ldw	x, (0x03, sp)
	ldw	y, (0x10, sp)
	ldw	(0x05, sp), y
;	outputs.c: 96: uint16_t ctr = pwm_from_set(cfg->vset, &sys->vout_pwm);
	addw	x, #0x002d
	ldw	y, (0x05, sp)
	ldw	y, (0x1, y)
	pushw	x
	pushw	y
	call	_pwm_from_set
	addw	sp, #4
	ldw	(0x01, sp), x
;	outputs.c: 97: uart_write_str("PWM VOLTAGE ");
	ldw	x, #___str_0+0
	pushw	x
	call	_uart_write_str
	popw	x
;	outputs.c: 98: uart_write_int(ctr);
	ldw	x, (0x01, sp)
	pushw	x
	call	_uart_write_int
	popw	x
;	outputs.c: 99: uart_write_str("\r\n");
	ldw	x, #___str_1+0
	ldw	(0x09, sp), x
	ldw	x, (0x09, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	outputs.c: 101: TIM2_CCR1H = ctr >> 8;
	ld	a, (0x01, sp)
	clr	(0x07, sp)
	ldw	x, #0x5311
	ld	(x), a
;	outputs.c: 102: TIM2_CCR1L = ctr & 0xFF;
	ld	a, (0x02, sp)
	ld	xh, a
	clr	a
	ld	a, xh
	ldw	x, #0x5312
	ld	(x), a
;	outputs.c: 103: TIM2_CR1 |= 0x01; // Enable timer
	ldw	x, #0x5300
	ld	a, (x)
	or	a, #0x01
	ld	(x), a
;	outputs.c: 108: uint16_t ctr = pwm_from_set(cfg->cset, &sys->cout_pwm);
	ldw	x, (0x03, sp)
	addw	x, #0x0035
	ldw	y, (0x05, sp)
	ldw	y, (0x3, y)
	pushw	x
	pushw	y
	call	_pwm_from_set
	addw	sp, #4
	ldw	(0x05, sp), x
;	outputs.c: 109: uart_write_str("PWM CURRENT ");
	ldw	x, #___str_2+0
	pushw	x
	call	_uart_write_str
	popw	x
;	outputs.c: 110: uart_write_int(ctr);
	ldw	x, (0x05, sp)
	pushw	x
	call	_uart_write_int
	popw	x
;	outputs.c: 111: uart_write_str("\r\n");
	ldw	x, (0x09, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	outputs.c: 113: TIM1_CCR1H = ctr >> 8;
	ld	a, (0x05, sp)
	clr	(0x0c, sp)
	ldw	x, #0x5265
	ld	(x), a
;	outputs.c: 114: TIM1_CCR1L = ctr & 0xFF;
	ld	a, (0x06, sp)
	ld	xh, a
	clr	a
	ld	a, xh
	ldw	x, #0x5266
	ld	(x), a
;	outputs.c: 115: TIM1_CR1 |= 0x01; // Enable timer
	bset	0x5250, #0
;	outputs.c: 126: PB_ODR &= ~(1<<4);
	ldw	x, #0x5005
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	outputs.c: 127: output_check_state(sys, state_constant_current);
	ld	a, (0x14, sp)
	push	a
	ldw	x, (0x04, sp)
	pushw	x
	call	_output_check_state
	addw	sp, #3
	jra	00107$
00102$:
;	outputs.c: 130: PB_ODR |= (1<<4);
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	outputs.c: 133: TIM1_CCR1H = 0;
	mov	0x5265+0, #0x00
;	outputs.c: 134: TIM1_CCR1L = 0;
	mov	0x5266+0, #0x00
;	outputs.c: 135: TIM1_CR1 &= 0xFE; // Disable timer
	bres	0x5250, #0
;	outputs.c: 138: TIM2_CCR1H = 0;
	mov	0x5311+0, #0x00
;	outputs.c: 139: TIM2_CCR1L = 0;
	mov	0x5312+0, #0x00
;	outputs.c: 140: TIM2_CR1 &= 0xFE; // Disable timer
	bres	0x5300, #0
;	outputs.c: 74: PA_DDR &= ~(1<<3);
	ldw	x, #0x5002
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	outputs.c: 143: cvcc_led_off();
00107$:
	addw	sp, #13
	ret
;	outputs.c: 147: void output_check_state(cfg_system_t *sys, uint8_t state_constant_current)
;	-----------------------------------------
;	 function output_check_state
;	-----------------------------------------
_output_check_state:
;	outputs.c: 149: if (sys->output) {
	ldw	x, (0x03, sp)
	ld	a, (0x13, x)
	tnz	a
	jreq	00108$
;	outputs.c: 62: PA_ODR |= (1<<3);
	ldw	x, #0x5000
	ld	a, (x)
;	outputs.c: 150: if (state_constant_current)
	tnz	(0x05, sp)
	jreq	00102$
;	outputs.c: 62: PA_ODR |= (1<<3);
	or	a, #0x08
	ldw	x, #0x5000
	ld	(x), a
;	outputs.c: 63: PA_DDR |= (1<<3);
	ldw	x, #0x5002
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	outputs.c: 151: cvcc_led_cc();
	jra	00108$
00102$:
;	outputs.c: 68: PA_ODR &= ~(1<<3);
	and	a, #0xf7
	ldw	x, #0x5000
	ld	(x), a
;	outputs.c: 69: PA_DDR |= (1<<3);
	ldw	x, #0x5002
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	outputs.c: 153: cvcc_led_cv();
00108$:
	ret
	.area CODE
___str_0:
	.ascii "PWM VOLTAGE "
	.db 0x00
___str_1:
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_2:
	.ascii "PWM CURRENT "
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
