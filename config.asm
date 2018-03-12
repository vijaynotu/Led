;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Mon Mar 12 12:44:10 2018
;--------------------------------------------------------
	.module config
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
	.globl _eeprom_save_data
	.globl _default_cfg_output
	.globl _default_cfg_system
	.globl _config_default_system
	.globl _config_load_system
	.globl _config_save_system
	.globl _config_default_output
	.globl _config_load_output
	.globl _config_save_output
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_default_cfg_system::
	.ds 61
_default_cfg_output::
	.ds 9
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
;	config.c: 55: void config_default_system(cfg_system_t *sys)
;	-----------------------------------------
;	 function config_default_system
;	-----------------------------------------
_config_default_system:
;	config.c: 57: memcpy(sys, &default_cfg_system, sizeof(default_cfg_system));
	ldw	x, #_default_cfg_system+0
	ldw	y, (0x03, sp)
	push	#0x3d
	push	#0x00
	pushw	x
	pushw	y
	call	_memcpy
	addw	sp, #6
	ret
;	config.c: 77: void config_load_system(cfg_system_t *sys)
;	-----------------------------------------
;	 function config_load_system
;	-----------------------------------------
_config_load_system:
	sub	sp, #4
;	config.c: 82: memcpy(sys, SYSTEM_CONFIG, sizeof(*sys));
	ldw	x, (0x07, sp)
	push	#0x3d
	push	#0x00
	push	#0x00
	push	#0x40
	pushw	x
	call	_memcpy
	addw	sp, #6
;	config.c: 84: validate_system_config(sys);
	ldw	y, (0x07, sp)
	ldw	(0x03, sp), y
	ldw	y, (0x03, sp)
	ldw	(0x01, sp), y
;	config.c: 62: if (sys->version != SYSTEM_CFG_VERSION ||
	ldw	x, (0x03, sp)
	ld	a, (x)
	cp	a, #0x02
	jrne	00107$
;	config.c: 63: sys->name[0]  ||
	ldw	x, (0x03, sp)
	ld	a, (0x1, x)
	tnz	a
	jrne	00107$
;	config.c: 64: sys->vin_adc.a  ||
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x17, x)
	exgw	x, y
	popw	x
	ldw	x, (0x15, x)
	tnzw	y
	jrne	00107$
	tnzw	x
	jrne	00107$
;	config.c: 65: sys->vout_adc.a  ||
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x1f, x)
	exgw	x, y
	popw	x
	ldw	x, (0x1d, x)
	tnzw	y
	jrne	00107$
	tnzw	x
	jrne	00107$
;	config.c: 66: sys->cout_adc.a  ||
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x27, x)
	exgw	x, y
	popw	x
	ldw	x, (0x25, x)
	tnzw	y
	jrne	00107$
	tnzw	x
	jrne	00107$
;	config.c: 67: sys->vout_pwm.a  ||
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x2f, x)
	exgw	x, y
	popw	x
	ldw	x, (0x2d, x)
	tnzw	y
	jrne	00107$
	tnzw	x
	jrne	00107$
;	config.c: 68: sys->cout_pwm.a
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x37, x)
	exgw	x, y
	popw	x
	ldw	x, (0x35, x)
	tnzw	y
	jrne	00148$
	tnzw	x
	jreq	00110$
00148$:
00107$:
;	config.c: 71: config_default_system(sys);
	ldw	x, (0x01, sp)
	pushw	x
	call	_config_default_system
	popw	x
;	config.c: 84: validate_system_config(sys);
00110$:
	addw	sp, #4
	ret
;	config.c: 87: void config_save_system(cfg_system_t *sys)
;	-----------------------------------------
;	 function config_save_system
;	-----------------------------------------
_config_save_system:
;	config.c: 89: eeprom_save_data((uint8_t*)SYSTEM_CONFIG, (uint8_t*)sys, sizeof(*sys));
	ldw	x, (0x03, sp)
	push	#0x3d
	pushw	x
	push	#0x00
	push	#0x40
	call	_eeprom_save_data
	addw	sp, #5
	ret
;	config.c: 92: void config_default_output(cfg_output_t *cfg)
;	-----------------------------------------
;	 function config_default_output
;	-----------------------------------------
_config_default_output:
;	config.c: 94: memcpy(cfg, &default_cfg_output, sizeof(default_cfg_output));
	ldw	x, #_default_cfg_output+0
	ldw	y, (0x03, sp)
	push	#0x09
	push	#0x00
	pushw	x
	pushw	y
	call	_memcpy
	addw	sp, #6
	ret
;	config.c: 104: void config_load_output(cfg_output_t *cfg)
;	-----------------------------------------
;	 function config_load_output
;	-----------------------------------------
_config_load_output:
	sub	sp, #4
;	config.c: 109: memcpy(cfg, OUTPUT_CONFIG, sizeof(*cfg));
	ldw	x, (0x07, sp)
	push	#0x09
	push	#0x00
	push	#0x40
	push	#0x40
	pushw	x
	call	_memcpy
	addw	sp, #6
;	config.c: 111: validate_output_config(cfg);
	ldw	x, (0x07, sp)
	ldw	(0x01, sp), x
;	config.c: 99: if (cfg->version != OUTPUT_CFG_VERSION || cfg->vset == 0 || cfg->cset == 0) {
	ld	a, (x)
	cp	a, #0x01
	jrne	00103$
	ldw	(0x03, sp), x
	ldw	y, (0x03, sp)
	ldw	y, (0x1, y)
	tnzw	y
	jreq	00103$
	ldw	x, (0x3, x)
	tnzw	x
	jrne	00106$
00103$:
;	config.c: 100: config_default_output(cfg);
	ldw	x, (0x01, sp)
	pushw	x
	call	_config_default_output
	popw	x
;	config.c: 111: validate_output_config(cfg);
00106$:
	addw	sp, #4
	ret
;	config.c: 114: void config_save_output(cfg_output_t *cfg)
;	-----------------------------------------
;	 function config_save_output
;	-----------------------------------------
_config_save_output:
;	config.c: 116: eeprom_save_data((uint8_t*)OUTPUT_CONFIG, (uint8_t*)cfg, sizeof(*cfg));
	ldw	x, (0x03, sp)
	push	#0x09
	pushw	x
	push	#0x40
	push	#0x40
	call	_eeprom_save_data
	addw	sp, #5
	ret
	.area CODE
___str_0:
	.ascii "Unnamed"
	.db 0x00
	.area INITIALIZER
__xinit__default_cfg_system:
	.db #0x02	; 2
	.ascii "Unnamed"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.byte #0x00,#0x06,#0x99,#0x9A	; 432538
	.byte #0x00,#0x00,#0x00,#0x00	; 0
	.byte #0x00,#0x05,#0xA6,#0x93	; 370323
	.byte #0x01,#0xC4,#0x00,#0x00	; 29622272
	.byte #0x00,#0x00,#0x84,#0x00	; 33792
	.byte #0x00,#0xC8,#0x00,#0x00	; 13107200
	.byte #0x00,#0x00,#0x2D,#0x4E	; 11598
	.byte #0x00,#0x21,#0x00,#0x00	; 2162688
	.byte #0x00,#0x01,#0xF0,#0x7C	; 127100
	.byte #0x00,#0xA0,#0x00,#0x00	; 10485760
__xinit__default_cfg_output:
	.db #0x01	; 1
	.dw #0x1388
	.dw #0x01F4
	.dw #0x0000
	.dw #0x0000
	.area CABS (ABS)
