;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Mon Mar 12 12:44:09 2018
;--------------------------------------------------------
	.module eeprom
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _eeprom_set_afr0
	.globl _eeprom_save_data
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
;	eeprom.c: 22: static uint8_t eeprom_unlock_data(void)
;	-----------------------------------------
;	 function eeprom_unlock_data
;	-----------------------------------------
_eeprom_unlock_data:
;	eeprom.c: 24: FLASH_DUKR = 0xAE; // Enable the flash data writing
	mov	0x5064+0, #0xae
;	eeprom.c: 25: FLASH_DUKR = 0x56;
	mov	0x5064+0, #0x56
;	eeprom.c: 27: return (FLASH_IAPSR & FLASH_IAPSR_DUL); // True if device unlocked
	ldw	x, #0x505f
	ld	a, (x)
	and	a, #0x08
	ret
;	eeprom.c: 35: uint8_t eeprom_set_afr0(void)
;	-----------------------------------------
;	 function eeprom_set_afr0
;	-----------------------------------------
_eeprom_set_afr0:
	pushw	x
;	eeprom.c: 40: if (!eeprom_unlock_data())
	call	_eeprom_unlock_data
	tnz	a
	jrne	00102$
;	eeprom.c: 41: return 0;
	clr	a
	jra	00111$
00102$:
;	eeprom.c: 43: FLASH_CR2 = FLASH_CR2_OPT;// Set the OPT bit
	mov	0x505b+0, #0x80
;	eeprom.c: 44: FLASH_NCR2 = ~FLASH_NCR2_NOPT; // Remove the NOPT bit
	mov	0x505c+0, #0x7f
;	eeprom.c: 46: OPT2 = 1;
	mov	0x4803+0, #0x01
;	eeprom.c: 47: NOPT2 = 0xFE;
	mov	0x4804+0, #0xfe
;	eeprom.c: 48: for (timeout = 0xFFFF; timeout > 0; timeout--) {
	ldw	x, #0xffff
	ldw	(0x01, sp), x
	ldw	x, #0xffff
00109$:
;	eeprom.c: 49: sr = FLASH_IAPSR;
	ldw	y, #0x505f
	ld	a, (y)
;	eeprom.c: 50: if (sr & FLASH_IAPSR_EOP)
	bcp	a, #0x04
	jrne	00105$
;	eeprom.c: 48: for (timeout = 0xFFFF; timeout > 0; timeout--) {
	decw	x
	ldw	(0x01, sp), x
	tnzw	x
	jrne	00109$
00105$:
;	eeprom.c: 54: if (sr & FLASH_IAPSR_WR_PG_DIS)
	srl	a
	jrnc	00107$
;	eeprom.c: 55: timeout = 0; // This will report failure
	clrw	x
	ldw	(0x01, sp), x
00107$:
;	eeprom.c: 57: FLASH_CR2 &= FLASH_CR2_OPT;
	ldw	x, #0x505b
	ld	a, (x)
	and	a, #0x80
	ld	(x), a
;	eeprom.c: 58: FLASH_NCR2 |= FLASH_NCR2_NOPT;
	bset	0x505c, #7
;	eeprom.c: 32: FLASH_IAPSR &= ~FLASH_IAPSR_DUL;
	ldw	x, #0x505f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	eeprom.c: 60: return (timeout > 0) && (OPT2 & 1);
	ldw	x, (0x01, sp)
	jreq	00115$
	ldw	x, #0x4803
	ld	a, (x)
	srl	a
	jrc	00116$
00115$:
	clr	a
	jra	00117$
00116$:
	ld	a, #0x01
00117$:
00111$:
	popw	x
	ret
;	eeprom.c: 63: uint8_t eeprom_save_data(uint8_t *dst, uint8_t *src, uint8_t len)
;	-----------------------------------------
;	 function eeprom_save_data
;	-----------------------------------------
_eeprom_save_data:
	sub	sp, #4
;	eeprom.c: 68: if (!eeprom_unlock_data())
	call	_eeprom_unlock_data
	ld	(0x04, sp), a
	tnz	(0x04, sp)
	jrne	00125$
;	eeprom.c: 69: return 0;
	clr	a
	jra	00115$
00125$:
	ld	a, (0x0b, sp)
	ld	(0x01, sp), a
	ldw	y, (0x07, sp)
	ldw	x, (0x09, sp)
00111$:
;	eeprom.c: 71: for (; len > 0; len--, dst++, src++) {
	tnz	(0x01, sp)
	jreq	00103$
;	eeprom.c: 72: *dst = *src;
	ld	a, (x)
	ld	(y), a
;	eeprom.c: 73: IWDG_KR = 0xAA; // Reset the counter
	mov	0x50e0+0, #0xaa
;	eeprom.c: 71: for (; len > 0; len--, dst++, src++) {
	dec	(0x01, sp)
	incw	y
	incw	x
	jra	00111$
00103$:
;	eeprom.c: 76: for (timeout = 0xFFFF; timeout > 0; timeout--) {
	ldw	x, #0xffff
	ldw	(0x02, sp), x
	ldw	y, #0xffff
00113$:
;	eeprom.c: 77: IWDG_KR = 0xAA; // Reset the counter
	mov	0x50e0+0, #0xaa
;	eeprom.c: 78: sr = FLASH_IAPSR;
	ldw	x, #0x505f
	ld	a, (x)
	ld	xh, a
;	eeprom.c: 79: if (sr & FLASH_IAPSR_EOP)
	bcp	a, #0x04
	jrne	00106$
;	eeprom.c: 76: for (timeout = 0xFFFF; timeout > 0; timeout--) {
	decw	y
	ldw	(0x02, sp), y
	tnzw	y
	jrne	00113$
00106$:
;	eeprom.c: 83: if (sr & FLASH_IAPSR_WR_PG_DIS)
	srl	a
	jrnc	00108$
;	eeprom.c: 84: timeout = 0; // This will report failure
	clr	(0x03, sp)
	clr	(0x02, sp)
00108$:
;	eeprom.c: 32: FLASH_IAPSR &= ~FLASH_IAPSR_DUL;
	ld	a, xh
	and	a, #0xf7
	ldw	x, #0x505f
	ld	(x), a
;	eeprom.c: 87: return (timeout > 0);
	ldw	x, (0x02, sp)
	jreq	00121$
	ld	a, #0x01
	.byte 0x21
00121$:
	clr	a
00122$:
00115$:
	addw	sp, #4
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
