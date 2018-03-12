;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Mon Mar 12 12:44:09 2018
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _ensure_afr0_set
	.globl _read_state
	.globl _config_load
	.globl _process_input
	.globl _parse_uint
	.globl __parse_uint
	.globl _write_int
	.globl _write_milliamp
	.globl _write_millivolt
	.globl _write_onoff
	.globl _write_str
	.globl _set_autocommit
	.globl _set_current
	.globl _set_voltage
	.globl _set_output
	.globl _autocommit
	.globl _set_name
	.globl _commit_output
	.globl _adc_ready
	.globl _adc_channel
	.globl _adc_read
	.globl _adc_to_volt
	.globl _adc_start
	.globl _adc_init
	.globl _parse_millinum
	.globl _output_check_state
	.globl _output_commit
	.globl _pwm_init
	.globl _config_default_output
	.globl _config_save_output
	.globl _config_load_output
	.globl _config_default_system
	.globl _config_save_system
	.globl _config_load_system
	.globl _eeprom_set_afr0
	.globl _uart_flush_writes
	.globl _uart_drive
	.globl _uart_write_milliamp
	.globl _uart_write_millivolt
	.globl _uart_write_fixed_point
	.globl _uart_write_int32
	.globl _uart_write_int
	.globl _uart_write_str
	.globl _uart_write_ch
	.globl _uart_init
	.globl _display_show
	.globl _display_refresh
	.globl _isprint
	.globl _strcmp
	.globl _memcpy
	.globl _state
	.globl _cfg_output
	.globl _cfg_system
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_cfg_system::
	.ds 61
_cfg_output::
	.ds 9
_state::
	.ds 14
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	main.c: 59: void commit_output()
;	-----------------------------------------
;	 function commit_output
;	-----------------------------------------
_commit_output:
;	main.c: 61: output_commit(&cfg_output, &cfg_system, state.constant_current);
	ldw	x, #_state+12
	ld	a, (x)
	ldw	x, #_cfg_system+0
	ldw	y, #_cfg_output+0
	push	a
	pushw	x
	pushw	y
	call	_output_commit
	addw	sp, #5
	ret
;	main.c: 64: void set_name(uint8_t *name)
;	-----------------------------------------
;	 function set_name
;	-----------------------------------------
_set_name:
	sub	sp, #7
;	main.c: 68: for (idx = 0; name[idx] != 0; idx++) {
	clr	(0x01, sp)
00105$:
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x0a, sp)
	ldw	(0x02, sp), x
	ldw	x, (0x02, sp)
	ld	a, (x)
	cp	a, #0x00
	jreq	00103$
;	main.c: 69: if (!isprint(name[idx]))
	clrw	x
	ld	xl, a
	pushw	x
	call	_isprint
	addw	sp, #2
	tnzw	x
	jrne	00106$
;	main.c: 70: name[idx] = '.'; // Eliminate non-printable chars
	ldw	x, (0x02, sp)
	ld	a, #0x2e
	ld	(x), a
00106$:
;	main.c: 68: for (idx = 0; name[idx] != 0; idx++) {
	inc	(0x01, sp)
	jra	00105$
00103$:
;	main.c: 73: memcpy(cfg_system.name, name, sizeof(cfg_system.name));
	ldw	y, (0x0a, sp)
	ldw	x, #_cfg_system+0
	ldw	(0x06, sp), x
	ldw	x, (0x06, sp)
	incw	x
	ldw	(0x04, sp), x
	ldw	x, (0x04, sp)
	push	#0x11
	push	#0x00
	pushw	y
	pushw	x
	call	_memcpy
	addw	sp, #6
;	main.c: 74: cfg_system.name[sizeof(cfg_system.name)-1] = 0;
	ldw	x, (0x06, sp)
	addw	x, #0x0011
	clr	(x)
;	main.c: 76: uart_write_str("SNAME: ");
	ldw	x, #___str_0+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 77: uart_write_str(cfg_system.name);
	ldw	x, (0x04, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 78: uart_write_str("\r\n");
	ldw	x, #___str_1+0
	pushw	x
	call	_uart_write_str
	addw	sp, #9
	ret
;	main.c: 81: void autocommit(void)
;	-----------------------------------------
;	 function autocommit
;	-----------------------------------------
_autocommit:
;	main.c: 83: if (cfg_system.autocommit) {
	ldw	x, #_cfg_system+20
	ld	a, (x)
	tnz	a
	jreq	00102$
;	main.c: 84: commit_output();
	call	_commit_output
	jra	00104$
00102$:
;	main.c: 86: uart_write_str("AUTOCOMMIT OFF: CHANGE PENDING ON COMMIT\r\n");
	ldw	x, #___str_2+0
	pushw	x
	call	_uart_write_str
	popw	x
00104$:
	ret
;	main.c: 90: void set_output(uint8_t *s)
;	-----------------------------------------
;	 function set_output
;	-----------------------------------------
_set_output:
	pushw	x
;	main.c: 92: if (s[1] != 0) {
	ldw	x, (0x05, sp)
	ld	a, (0x1, x)
	tnz	a
	jreq	00102$
;	main.c: 93: uart_write_str("OUTPUT takes either 0 for OFF or 1 for ON, received: \"");
	ldw	x, #___str_3+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 94: uart_write_str(s);
	ldw	x, (0x05, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 95: uart_write_str("\"\r\n");
	ldw	x, #___str_4+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 96: return;
	jra	00109$
00102$:
;	main.c: 99: if (s[0] == '0') {
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
	ldw	x, (0x01, sp)
	ld	a, (x)
	cp	a, #0x30
	jrne	00107$
;	main.c: 100: cfg_system.output = 0;
	ldw	x, #_cfg_system+19
	clr	(x)
;	main.c: 101: uart_write_str("OUTPUT: OFF\r\n");
	ldw	x, #___str_5+0
	pushw	x
	call	_uart_write_str
	popw	x
	jra	00108$
00107$:
;	main.c: 102: } else if (s[0] == '1') {
	cp	a, #0x31
	jrne	00104$
;	main.c: 103: cfg_system.output = 1;
	ldw	x, #_cfg_system+19
	ld	a, #0x01
	ld	(x), a
;	main.c: 104: uart_write_str("OUTPUT: ON\r\n");
	ldw	x, #___str_6+0
	pushw	x
	call	_uart_write_str
	popw	x
	jra	00108$
00104$:
;	main.c: 106: uart_write_str("OUTPUT takes either 0 for OFF or 1 for ON, received: \"");
	ldw	x, #___str_3+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 107: uart_write_str(s);
	ldw	x, (0x01, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 108: uart_write_str("\"\r\n");
	ldw	x, #___str_4+0
	pushw	x
	call	_uart_write_str
	popw	x
00108$:
;	main.c: 111: autocommit();
	call	_autocommit
00109$:
	popw	x
	ret
;	main.c: 114: void set_voltage(uint8_t *s)
;	-----------------------------------------
;	 function set_voltage
;	-----------------------------------------
_set_voltage:
	sub	sp, #6
;	main.c: 118: val = parse_millinum(s);
	ldw	x, (0x09, sp)
	pushw	x
	call	_parse_millinum
	addw	sp, #2
	ldw	(0x01, sp), x
;	main.c: 119: if (val == 0xFFFF)
	ldw	x, (0x01, sp)
	cpw	x, #0xffff
	jreq	00107$
;	main.c: 120: return;
	jra	00102$
00102$:
;	main.c: 122: if (val > CAP_VMAX) {
	ldw	y, (0x01, sp)
	ldw	(0x05, sp), y
	clr	(0x04, sp)
	clr	(0x03, sp)
	ldw	x, #0x88b8
	cpw	x, (0x05, sp)
	clr	a
	sbc	a, (0x04, sp)
	clr	a
	sbc	a, (0x03, sp)
	jrsge	00104$
;	main.c: 123: uart_write_str("VOLTAGE VALUE TOO HIGH\r\n");
	ldw	x, #___str_7+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 124: return;
	jra	00107$
00104$:
;	main.c: 126: if (val < CAP_VMIN) {
	ldw	x, (0x01, sp)
	cpw	x, #0x000a
	jrnc	00106$
;	main.c: 127: uart_write_str("VOLTAGE VALUE TOO LOW\r\n");
	ldw	x, #___str_8+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 128: return;
	jra	00107$
00106$:
;	main.c: 131: uart_write_str("VOLTAGE: SET ");
	ldw	x, #___str_9+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 132: uart_write_millivolt(val);
	ldw	x, (0x01, sp)
	pushw	x
	call	_uart_write_millivolt
	popw	x
;	main.c: 133: uart_write_str("\r\n");
	ldw	x, #___str_1+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 134: cfg_output.vset = val;
	ldw	x, #_cfg_output+1
	ldw	y, (0x01, sp)
	ldw	(x), y
;	main.c: 136: autocommit();
	call	_autocommit
00107$:
	addw	sp, #6
	ret
;	main.c: 139: void set_current(uint8_t *s)
;	-----------------------------------------
;	 function set_current
;	-----------------------------------------
_set_current:
;	main.c: 143: val = parse_millinum(s);
	ldw	x, (0x03, sp)
	pushw	x
	call	_parse_millinum
	addw	sp, #2
;	main.c: 144: if (val == 0xFFFF)
	cpw	x, #0xffff
	jreq	00107$
;	main.c: 145: return;
	jra	00102$
00102$:
;	main.c: 147: if (val > CAP_CMAX) {
	cpw	x, #0x0bb8
	jrule	00104$
;	main.c: 148: uart_write_str("CURRENT VALUE TOO HIGH\r\n");
	ldw	x, #___str_10+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 149: return;
	jra	00107$
00104$:
;	main.c: 151: if (val < CAP_CMIN) {
	cpw	x, #0x0001
	jrnc	00106$
;	main.c: 152: uart_write_str("CURRENT VALUE TOO LOW\r\n");
	ldw	x, #___str_11+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 153: return;
	jra	00107$
00106$:
;	main.c: 156: uart_write_str("CURRENT: SET ");
	ldw	y, #___str_12+0
	pushw	x
	pushw	y
	call	_uart_write_str
	popw	x
	popw	x
;	main.c: 157: uart_write_milliamp(val);
	pushw	x
	pushw	x
	call	_uart_write_milliamp
	popw	x
	popw	x
;	main.c: 158: uart_write_str("\r\n");
	ldw	y, #___str_1+0
	pushw	x
	pushw	y
	call	_uart_write_str
	popw	x
	popw	x
;	main.c: 159: cfg_output.cset = val;
	ldw	y, #_cfg_output+3
	ldw	(y), x
;	main.c: 161: autocommit();
	call	_autocommit
00107$:
	ret
;	main.c: 164: void set_autocommit(uint8_t *s)
;	-----------------------------------------
;	 function set_autocommit
;	-----------------------------------------
_set_autocommit:
;	main.c: 166: if (strcmp(s, "1") == 0 || strcmp(s, "YES") == 0) {
	ldw	x, #___str_13+0
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jreq	00105$
	ldw	x, #___str_14+0
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00106$
00105$:
;	main.c: 167: cfg_system.autocommit = 1;
	ldw	x, #_cfg_system+20
	ld	a, #0x01
	ld	(x), a
;	main.c: 168: uart_write_str("AUTOCOMMIT: YES\r\n");
	ldw	x, #___str_15+0
	pushw	x
	call	_uart_write_str
	popw	x
	jra	00109$
00106$:
;	main.c: 169: } else if (strcmp(s, "0") == 0 || strcmp(s, "NO") == 0) {
	ldw	x, #___str_16+0
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jreq	00101$
	ldw	x, #___str_17+0
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00102$
00101$:
;	main.c: 170: cfg_system.autocommit = 0;
	ldw	x, #_cfg_system+20
	clr	(x)
;	main.c: 171: uart_write_str("AUTOCOMMIT: NO\r\n");
	ldw	x, #___str_18+0
	pushw	x
	call	_uart_write_str
	popw	x
	jra	00109$
00102$:
;	main.c: 173: uart_write_str("UNKNOWN AUTOCOMMIT ARG: ");
	ldw	x, #___str_19+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 174: uart_write_str(s);
	ldw	x, (0x03, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 175: uart_write_str("\r\n");
	ldw	x, #___str_1+0
	pushw	x
	call	_uart_write_str
	popw	x
00109$:
	ret
;	main.c: 179: void write_str(const char *prefix, const char *val)
;	-----------------------------------------
;	 function write_str
;	-----------------------------------------
_write_str:
;	main.c: 181: uart_write_str(prefix);
	ldw	x, (0x03, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 182: uart_write_str(val);
	ldw	x, (0x05, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 183: uart_write_str("\r\n");
	ldw	x, #___str_1+0
	pushw	x
	call	_uart_write_str
	popw	x
	ret
;	main.c: 186: void write_onoff(const char *prefix, uint8_t on)
;	-----------------------------------------
;	 function write_onoff
;	-----------------------------------------
_write_onoff:
;	main.c: 188: write_str(prefix, on ? "ON" : "OFF");
	tnz	(0x05, sp)
	jreq	00103$
	ldw	x, #___str_20+0
	jra	00104$
00103$:
	ldw	x, #___str_21+0
00104$:
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	call	_write_str
	addw	sp, #4
	ret
;	main.c: 191: void write_millivolt(const char *prefix, uint16_t mv)
;	-----------------------------------------
;	 function write_millivolt
;	-----------------------------------------
_write_millivolt:
;	main.c: 193: uart_write_str(prefix);
	ldw	x, (0x03, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 194: uart_write_millivolt(mv);
	ldw	x, (0x05, sp)
	pushw	x
	call	_uart_write_millivolt
	popw	x
;	main.c: 195: uart_write_str("\r\n");
	ldw	x, #___str_1+0
	pushw	x
	call	_uart_write_str
	popw	x
	ret
;	main.c: 198: void write_milliamp(const char *prefix, uint16_t ma)
;	-----------------------------------------
;	 function write_milliamp
;	-----------------------------------------
_write_milliamp:
;	main.c: 200: uart_write_str(prefix);
	ldw	x, (0x03, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 201: uart_write_milliamp(ma);
	ldw	x, (0x05, sp)
	pushw	x
	call	_uart_write_milliamp
	popw	x
;	main.c: 202: uart_write_str("\r\n");
	ldw	x, #___str_1+0
	pushw	x
	call	_uart_write_str
	popw	x
	ret
;	main.c: 205: void write_int(const char *prefix, uint16_t val)
;	-----------------------------------------
;	 function write_int
;	-----------------------------------------
_write_int:
;	main.c: 207: uart_write_str(prefix);
	ldw	x, (0x03, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 208: uart_write_int(val);
	ldw	x, (0x05, sp)
	pushw	x
	call	_uart_write_int
	popw	x
;	main.c: 209: uart_write_str("\r\n");
	ldw	x, #___str_1+0
	pushw	x
	call	_uart_write_str
	popw	x
	ret
;	main.c: 212: uint32_t _parse_uint(uint8_t *s)
;	-----------------------------------------
;	 function _parse_uint
;	-----------------------------------------
__parse_uint:
	sub	sp, #10
;	main.c: 214: uint32_t val = 0;
	clrw	x
	ldw	(0x03, sp), x
	clrw	y
;	main.c: 225: return val;
	ldw	x, (0x0d, sp)
	ldw	(0x05, sp), x
00107$:
;	main.c: 216: for (; *s; s++) {
	ldw	x, (0x05, sp)
	ld	a, (x)
	tnz	a
	jreq	00105$
;	main.c: 217: uint8_t ch = *s;
;	main.c: 218: if (ch >= '0' && ch <= '9') {
	cp	a, #0x30
	jrc	00102$
	cp	a, #0x39
	jrugt	00102$
;	main.c: 219: val = val*10 + (ch-'0');
	push	a
	ldw	x, (0x04, sp)
	pushw	x
	pushw	y
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x0a, sp), x
	ldw	(0x08, sp), y
	pop	a
	clrw	x
	ld	xl, a
	subw	x, #0x0030
	ld	a, xh
	clrw	y
	tnz	a
	jrpl	00130$
	decw	y
00130$:
	ld	xh, a
	addw	x, (0x09, sp)
	ld	a, yl
	adc	a, (0x08, sp)
	rlwa	y
	adc	a, (0x07, sp)
	ld	yh, a
	ldw	(0x03, sp), x
	jra	00108$
00102$:
;	main.c: 221: return 0xFFFFFFFF;
	ldw	x, #0xffff
	ldw	y, #0xffff
	jra	00109$
00108$:
;	main.c: 216: for (; *s; s++) {
	ldw	x, (0x05, sp)
	incw	x
	ldw	(0x05, sp), x
	jra	00107$
00105$:
;	main.c: 225: return val;
	ldw	x, (0x03, sp)
00109$:
	addw	sp, #10
	ret
;	main.c: 228: void parse_uint(const char *name, uint32_t *pval, uint8_t *s)
;	-----------------------------------------
;	 function parse_uint
;	-----------------------------------------
_parse_uint:
	sub	sp, #4
;	main.c: 230: uint32_t val = _parse_uint(s);
	ldw	x, (0x0b, sp)
	pushw	x
	call	__parse_uint
	addw	sp, #2
	ldw	(0x03, sp), x
;	main.c: 231: if (val == 0xFFFFFFFF) {
	ldw	x, (0x03, sp)
	cpw	x, #0xffff
	jrne	00102$
	cpw	y, #0xffff
	jrne	00102$
;	main.c: 232: uart_write_str("FAILED TO PARSE ");
	ldw	x, #___str_22+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 233: uart_write_str(s);
	ldw	x, (0x0b, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 234: uart_write_str(" FOR ");
	ldw	x, #___str_23+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 235: uart_write_str(name);
	ldw	x, (0x07, sp)
	pushw	x
	call	_uart_write_str
	popw	x
	jra	00103$
00102$:
;	main.c: 237: *pval = val;
	ldw	x, (0x09, sp)
	ld	a, (0x04, sp)
	ld	(0x3, x), a
	ld	a, (0x03, sp)
	ld	(0x2, x), a
	ldw	(x), y
;	main.c: 238: uart_write_str("CALIBRATION SET ");
	ldw	x, #___str_24+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 239: uart_write_str(name);
	ldw	x, (0x07, sp)
	pushw	x
	call	_uart_write_str
	popw	x
00103$:
;	main.c: 241: uart_write_str("\r\n");
	ldw	x, #___str_1+0
	pushw	x
	call	_uart_write_str
	addw	sp, #6
	ret
;	main.c: 244: void process_input()
;	-----------------------------------------
;	 function process_input
;	-----------------------------------------
_process_input:
	sub	sp, #29
;	main.c: 247: uart_read_buf[uart_read_len-1] = 0;
	ldw	x, #_uart_read_buf+0
	ldw	(0x06, sp), x
	ld	a, _uart_read_len+0
	dec	a
	clrw	x
	ld	xl, a
	addw	x, (0x06, sp)
	clr	(x)
;	main.c: 249: if (strcmp(uart_read_buf, "MODEL") == 0) {
	ldw	x, #___str_25+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	jrne	00183$
;	main.c: 250: uart_write_str("MODEL: " MODEL "\r\n");
	ldw	x, #___str_26+0
	pushw	x
	call	_uart_write_str
	popw	x
	jp	00184$
00183$:
;	main.c: 251: } else if (strcmp(uart_read_buf, "VERSION") == 0) {
	ldw	x, #___str_27+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00180$
;	main.c: 252: uart_write_str("VERSION: " FW_VERSION "\r\n");
	ldw	x, #___str_28+0
	pushw	x
	call	_uart_write_str
	popw	x
	jp	00184$
00180$:
;	main.c: 253: } else if (strcmp(uart_read_buf, "SYSTEM") == 0) {
	ldw	x, #___str_29+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00177$
;	main.c: 254: uart_write_str("MODEL: " MODEL "\r\n" "VERSION: " FW_VERSION "\r\n");
	ldw	x, #___str_30+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 256: write_str("NAME: ", cfg_system.name);
	ldw	x, #_cfg_system+0
	ldw	(0x0c, sp), x
	ldw	x, (0x0c, sp)
	incw	x
	ldw	y, #___str_31+0
	pushw	x
	pushw	y
	call	_write_str
	addw	sp, #4
;	main.c: 257: write_onoff("ONSTARTUP: ", cfg_system.default_on);
	ldw	x, (0x0c, sp)
	ld	a, (0x12, x)
	ldw	x, #___str_32+0
	push	a
	pushw	x
	call	_write_onoff
	addw	sp, #3
;	main.c: 258: write_onoff("AUTOCOMMIT: ", cfg_system.autocommit);
	ldw	x, (0x0c, sp)
	ld	a, (0x14, x)
	ldw	x, #___str_33+0
	push	a
	pushw	x
	call	_write_onoff
	addw	sp, #3
	jp	00184$
00177$:
;	main.c: 259: } else if (strcmp(uart_read_buf, "CALIBRATION") == 0) {
	ldw	x, #___str_34+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jreq	00325$
	jp	00174$
00325$:
;	main.c: 260: uart_write_str("CALIBRATE VIN ADC: ");
	ldw	x, #___str_35+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 261: uart_write_fixed_point(cfg_system.vin_adc.a);
	ldw	x, #_cfg_system+0
	ldw	(0x10, sp), x
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x17, x)
	exgw	x, y
	popw	x
	ldw	x, (0x15, x)
	pushw	y
	pushw	x
	call	_uart_write_fixed_point
	addw	sp, #4
;	main.c: 262: uart_write_ch('/');
	push	#0x2f
	call	_uart_write_ch
	pop	a
;	main.c: 263: uart_write_fixed_point(cfg_system.vin_adc.b);
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x1b, x)
	exgw	x, y
	popw	x
	ldw	x, (0x19, x)
	pushw	y
	pushw	x
	call	_uart_write_fixed_point
	addw	sp, #4
;	main.c: 264: uart_write_str("\r\n");
	ldw	x, #___str_1+0
	ldw	(0x18, sp), x
	ldw	x, (0x18, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 265: uart_write_str("CALIBRATE VOUT ADC: ");
	ldw	x, #___str_36+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 266: uart_write_fixed_point(cfg_system.vout_adc.a);
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x1f, x)
	exgw	x, y
	popw	x
	ldw	x, (0x1d, x)
	pushw	y
	pushw	x
	call	_uart_write_fixed_point
	addw	sp, #4
;	main.c: 267: uart_write_ch('/');
	push	#0x2f
	call	_uart_write_ch
	pop	a
;	main.c: 268: uart_write_fixed_point(cfg_system.vout_adc.b);
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x23, x)
	exgw	x, y
	popw	x
	ldw	x, (0x21, x)
	pushw	y
	pushw	x
	call	_uart_write_fixed_point
	addw	sp, #4
;	main.c: 269: uart_write_str("\r\n");
	ldw	x, (0x18, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 270: uart_write_str("CALIBRATE COUT ADC: ");
	ldw	x, #___str_37+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 271: uart_write_fixed_point(cfg_system.cout_adc.a);
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x27, x)
	exgw	x, y
	popw	x
	ldw	x, (0x25, x)
	pushw	y
	pushw	x
	call	_uart_write_fixed_point
	addw	sp, #4
;	main.c: 272: uart_write_ch('/');
	push	#0x2f
	call	_uart_write_ch
	pop	a
;	main.c: 273: uart_write_fixed_point(cfg_system.cout_adc.b);
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x2b, x)
	exgw	x, y
	popw	x
	ldw	x, (0x29, x)
	pushw	y
	pushw	x
	call	_uart_write_fixed_point
	addw	sp, #4
;	main.c: 274: uart_write_str("\r\n");
	ldw	x, (0x18, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 275: uart_write_str("CALIBRATE VOUT PWM: ");
	ldw	x, #___str_38+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 276: uart_write_fixed_point(cfg_system.vout_pwm.a);
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x2f, x)
	exgw	x, y
	popw	x
	ldw	x, (0x2d, x)
	pushw	y
	pushw	x
	call	_uart_write_fixed_point
	addw	sp, #4
;	main.c: 277: uart_write_ch('/');
	push	#0x2f
	call	_uart_write_ch
	pop	a
;	main.c: 278: uart_write_fixed_point(cfg_system.vout_pwm.b);
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x33, x)
	exgw	x, y
	popw	x
	ldw	x, (0x31, x)
	pushw	y
	pushw	x
	call	_uart_write_fixed_point
	addw	sp, #4
;	main.c: 279: uart_write_str("\r\n");
	ldw	x, (0x18, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 280: uart_write_str("CALIBRATE COUT PWM: ");
	ldw	x, #___str_39+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 281: uart_write_fixed_point(cfg_system.cout_pwm.a);
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x37, x)
	exgw	x, y
	popw	x
	ldw	x, (0x35, x)
	pushw	y
	pushw	x
	call	_uart_write_fixed_point
	addw	sp, #4
;	main.c: 282: uart_write_ch('/');
	push	#0x2f
	call	_uart_write_ch
	pop	a
;	main.c: 283: uart_write_fixed_point(cfg_system.cout_pwm.b);
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x3b, x)
	exgw	x, y
	popw	x
	ldw	x, (0x39, x)
	pushw	y
	pushw	x
	call	_uart_write_fixed_point
	addw	sp, #4
;	main.c: 284: uart_write_str("\r\n");
	ldw	x, (0x18, sp)
	pushw	x
	call	_uart_write_str
	popw	x
	jp	00184$
00174$:
;	main.c: 285: } else if (strcmp(uart_read_buf, "RCALIBRATION") == 0) {
	ldw	x, #___str_40+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jreq	00326$
	jp	00171$
00326$:
;	main.c: 286: uart_write_str("CALIBRATE VIN ADC: ");
	ldw	x, #___str_35+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 287: uart_write_int32(cfg_system.vin_adc.a);
	ldw	x, #_cfg_system+0
	ldw	(0x1c, sp), x
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x17, x)
	exgw	x, y
	popw	x
	ldw	x, (0x15, x)
	pushw	y
	pushw	x
	call	_uart_write_int32
	addw	sp, #4
;	main.c: 288: uart_write_ch('/');
	push	#0x2f
	call	_uart_write_ch
	pop	a
;	main.c: 289: uart_write_int32(cfg_system.vin_adc.b);
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x1b, x)
	exgw	x, y
	popw	x
	ldw	x, (0x19, x)
	pushw	y
	pushw	x
	call	_uart_write_int32
	addw	sp, #4
;	main.c: 290: uart_write_str("\r\n");
	ldw	x, #___str_1+0
	ldw	(0x08, sp), x
	ldw	x, (0x08, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 291: uart_write_str("CALIBRATE VOUT ADC: ");
	ldw	x, #___str_36+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 292: uart_write_int32(cfg_system.vout_adc.a);
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x1f, x)
	exgw	x, y
	popw	x
	ldw	x, (0x1d, x)
	pushw	y
	pushw	x
	call	_uart_write_int32
	addw	sp, #4
;	main.c: 293: uart_write_ch('/');
	push	#0x2f
	call	_uart_write_ch
	pop	a
;	main.c: 294: uart_write_int32(cfg_system.vout_adc.b);
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x23, x)
	exgw	x, y
	popw	x
	ldw	x, (0x21, x)
	pushw	y
	pushw	x
	call	_uart_write_int32
	addw	sp, #4
;	main.c: 295: uart_write_str("\r\n");
	ldw	x, (0x08, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 296: uart_write_str("CALIBRATE COUT ADC: ");
	ldw	x, #___str_37+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 297: uart_write_int32(cfg_system.cout_adc.a);
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x27, x)
	exgw	x, y
	popw	x
	ldw	x, (0x25, x)
	pushw	y
	pushw	x
	call	_uart_write_int32
	addw	sp, #4
;	main.c: 298: uart_write_ch('/');
	push	#0x2f
	call	_uart_write_ch
	pop	a
;	main.c: 299: uart_write_int32(cfg_system.cout_adc.b);
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x2b, x)
	exgw	x, y
	popw	x
	ldw	x, (0x29, x)
	pushw	y
	pushw	x
	call	_uart_write_int32
	addw	sp, #4
;	main.c: 300: uart_write_str("\r\n");
	ldw	x, (0x08, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 301: uart_write_str("CALIBRATE VOUT PWM: ");
	ldw	x, #___str_38+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 302: uart_write_int32(cfg_system.vout_pwm.a);
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x2f, x)
	exgw	x, y
	popw	x
	ldw	x, (0x2d, x)
	pushw	y
	pushw	x
	call	_uart_write_int32
	addw	sp, #4
;	main.c: 303: uart_write_ch('/');
	push	#0x2f
	call	_uart_write_ch
	pop	a
;	main.c: 304: uart_write_int32(cfg_system.vout_pwm.b);
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x33, x)
	exgw	x, y
	popw	x
	ldw	x, (0x31, x)
	pushw	y
	pushw	x
	call	_uart_write_int32
	addw	sp, #4
;	main.c: 305: uart_write_str("\r\n");
	ldw	x, (0x08, sp)
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 306: uart_write_str("CALIBRATE COUT PWM: ");
	ldw	x, #___str_39+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 307: uart_write_int32(cfg_system.cout_pwm.a);
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x37, x)
	exgw	x, y
	popw	x
	ldw	x, (0x35, x)
	pushw	y
	pushw	x
	call	_uart_write_int32
	addw	sp, #4
;	main.c: 308: uart_write_ch('/');
	push	#0x2f
	call	_uart_write_ch
	pop	a
;	main.c: 309: uart_write_int32(cfg_system.cout_pwm.b);
	ldw	x, (0x1c, sp)
	pushw	x
	ldw	x, (0x3b, x)
	exgw	x, y
	popw	x
	ldw	x, (0x39, x)
	pushw	y
	pushw	x
	call	_uart_write_int32
	addw	sp, #4
;	main.c: 310: uart_write_ch('\r');
	push	#0x0d
	call	_uart_write_ch
	pop	a
	jp	00184$
00171$:
;	main.c: 311: } else if (strcmp(uart_read_buf, "LIMITS") == 0) {
	ldw	x, #___str_41+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00168$
;	main.c: 312: uart_write_str("LIMITS:\r\n");
	ldw	x, #___str_42+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 313: write_millivolt("VMIN: ", CAP_VMIN);
	ldw	x, #___str_43+0
	push	#0x0a
	push	#0x00
	pushw	x
	call	_write_millivolt
	addw	sp, #4
;	main.c: 314: write_millivolt("VMAX: ", CAP_VMAX);
	ldw	x, #___str_44+0
	push	#0xb8
	push	#0x88
	pushw	x
	call	_write_millivolt
	addw	sp, #4
;	main.c: 315: write_millivolt("VSTEP: ", CAP_VSTEP);
	ldw	x, #___str_45+0
	push	#0x0a
	push	#0x00
	pushw	x
	call	_write_millivolt
	addw	sp, #4
;	main.c: 316: write_milliamp("CMIN: ", CAP_CMIN);
	ldw	x, #___str_46+0
	push	#0x01
	push	#0x00
	pushw	x
	call	_write_milliamp
	addw	sp, #4
;	main.c: 317: write_milliamp("CMAX: ", CAP_CMAX);
	ldw	x, #___str_47+0
	push	#0xb8
	push	#0x0b
	pushw	x
	call	_write_milliamp
	addw	sp, #4
;	main.c: 318: write_milliamp("CSTEP: ", CAP_CSTEP);
	ldw	x, #___str_48+0
	push	#0x01
	push	#0x00
	pushw	x
	call	_write_milliamp
	addw	sp, #4
	jp	00184$
00168$:
;	main.c: 319: } else if (strcmp(uart_read_buf, "CONFIG") == 0) {
	ldw	x, #___str_49+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00165$
;	main.c: 320: uart_write_str("CONFIG:\r\n");
	ldw	x, #___str_50+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 321: write_onoff("OUTPUT: ", cfg_system.output);
	ldw	x, #_cfg_system+19
	ld	a, (x)
	ldw	x, #___str_51+0
	push	a
	pushw	x
	call	_write_onoff
	addw	sp, #3
;	main.c: 322: write_millivolt("VSET: ", cfg_output.vset);
	ldw	x, #_cfg_output+0
	ldw	(0x16, sp), x
	ldw	x, (0x16, sp)
	ldw	x, (0x1, x)
	ldw	y, #___str_52+0
	pushw	x
	pushw	y
	call	_write_millivolt
	addw	sp, #4
;	main.c: 323: write_milliamp("CSET: ", cfg_output.cset);
	ldw	x, (0x16, sp)
	ldw	x, (0x3, x)
	ldw	y, #___str_53+0
	pushw	x
	pushw	y
	call	_write_milliamp
	addw	sp, #4
;	main.c: 324: write_millivolt("VSHUTDOWN: ", cfg_output.vshutdown);
	ldw	x, (0x16, sp)
	ldw	x, (0x5, x)
	ldw	y, #___str_54+0
	pushw	x
	pushw	y
	call	_write_millivolt
	addw	sp, #4
;	main.c: 325: write_millivolt("CSHUTDOWN: ", cfg_output.cshutdown);
	ldw	x, (0x16, sp)
	ldw	x, (0x7, x)
	ldw	y, #___str_55+0
	pushw	x
	pushw	y
	call	_write_millivolt
	addw	sp, #4
	jp	00184$
00165$:
;	main.c: 326: } else if (strcmp(uart_read_buf, "STATUS") == 0) {
	ldw	x, #___str_56+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00162$
;	main.c: 327: uart_write_str("STATUS:\r\n");
	ldw	x, #___str_57+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 328: write_onoff("OUTPUT: ", cfg_system.output);
	ldw	x, #_cfg_system+19
	ld	a, (x)
	ldw	x, #___str_51+0
	push	a
	pushw	x
	call	_write_onoff
	addw	sp, #3
;	main.c: 329: write_millivolt("VIN: ", state.vin);
	ldw	x, #_state+0
	ldw	(0x1a, sp), x
	ldw	x, (0x1a, sp)
	ldw	x, (0x6, x)
	ldw	y, #___str_58+0
	pushw	x
	pushw	y
	call	_write_millivolt
	addw	sp, #4
;	main.c: 330: write_millivolt("VOUT: ", state.vout);
	ldw	x, (0x1a, sp)
	ldw	x, (0x8, x)
	ldw	y, #___str_59+0
	pushw	x
	pushw	y
	call	_write_millivolt
	addw	sp, #4
;	main.c: 331: write_milliamp("COUT: ", state.cout);
	ldw	x, (0x1a, sp)
	ldw	x, (0xa, x)
	ldw	y, #___str_60+0
	pushw	x
	pushw	y
	call	_write_milliamp
	addw	sp, #4
;	main.c: 332: write_str("CONSTANT: ", state.constant_current ? "CURRENT" : "VOLTAGE");
	ldw	x, (0x1a, sp)
	ld	a, (0xc, x)
	ld	(0x05, sp), a
	tnz	(0x05, sp)
	jreq	00190$
	ldw	x, #___str_62+0
	jra	00191$
00190$:
	ldw	x, #___str_63+0
00191$:
	ldw	y, #___str_61+0
	pushw	x
	pushw	y
	call	_write_str
	addw	sp, #4
	jp	00184$
00162$:
;	main.c: 333: } else if (strcmp(uart_read_buf, "RSTATUS") == 0) {
	ldw	x, #___str_64+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jreq	00331$
	jp	00159$
00331$:
;	main.c: 334: uart_write_str("RSTATUS:\r\n");
	ldw	x, #___str_65+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 335: write_onoff("OUTPUT: ", cfg_system.output);
	ldw	x, #_cfg_system+19
	ld	a, (x)
	ldw	x, #___str_51+0
	push	a
	pushw	x
	call	_write_onoff
	addw	sp, #3
;	main.c: 336: write_int("VIN ADC: ", state.vin_raw);
	ldw	x, #_state+0
	ldw	x, (x)
	ldw	y, #___str_66+0
	pushw	x
	pushw	y
	call	_write_int
	addw	sp, #4
;	main.c: 337: write_millivolt("VIN: ", state.vin);
	ldw	x, #_state+0
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	ldw	x, (0x6, x)
	ldw	y, #___str_58+0
	pushw	x
	pushw	y
	call	_write_millivolt
	addw	sp, #4
;	main.c: 338: write_int("VOUT ADC: ", state.vout_raw);
	ldw	x, (0x03, sp)
	ldw	x, (0x2, x)
	ldw	y, #___str_67+0
	pushw	x
	pushw	y
	call	_write_int
	addw	sp, #4
;	main.c: 339: write_millivolt("VOUT: ", state.vout);
	ldw	x, (0x03, sp)
	ldw	x, (0x8, x)
	ldw	y, #___str_59+0
	pushw	x
	pushw	y
	call	_write_millivolt
	addw	sp, #4
;	main.c: 340: write_int("COUT ADC: ", state.cout_raw);
	ldw	x, (0x03, sp)
	ldw	x, (0x4, x)
	ldw	y, #___str_68+0
	pushw	x
	pushw	y
	call	_write_int
	addw	sp, #4
;	main.c: 341: write_milliamp("COUT: ", state.cout);
	ldw	x, (0x03, sp)
	ldw	x, (0xa, x)
	ldw	y, #___str_60+0
	pushw	x
	pushw	y
	call	_write_milliamp
	addw	sp, #4
;	main.c: 342: write_str("CONSTANT: ", state.constant_current ? "CURRENT" : "VOLTAGE");
	ldw	x, (0x03, sp)
	ld	a, (0xc, x)
	ld	(0x0e, sp), a
	tnz	(0x0e, sp)
	jreq	00192$
	ldw	x, #___str_62+0
	jra	00193$
00192$:
	ldw	x, #___str_63+0
00193$:
	ldw	y, #___str_61+0
	pushw	x
	pushw	y
	call	_write_str
	addw	sp, #4
	jp	00184$
00159$:
;	main.c: 343: } else if (strcmp(uart_read_buf, "COMMIT") == 0) {
	ldw	x, #___str_69+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00156$
;	main.c: 344: commit_output();
	call	_commit_output
	jp	00184$
00156$:
;	main.c: 345: } else if (strcmp(uart_read_buf, "SAVE") == 0) {
	ldw	x, #___str_70+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00153$
;	main.c: 346: config_save_system(&cfg_system);
	ldw	x, #_cfg_system+0
	pushw	x
	call	_config_save_system
	popw	x
;	main.c: 347: config_save_output(&cfg_output);
	ldw	x, #_cfg_output+0
	pushw	x
	call	_config_save_output
	popw	x
;	main.c: 348: uart_write_str("SAVED\r\n");
	ldw	x, #___str_71+0
	pushw	x
	call	_uart_write_str
	popw	x
	jp	00184$
00153$:
;	main.c: 349: } else if (strcmp(uart_read_buf, "LOAD") == 0) {
	ldw	x, #___str_72+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00150$
;	main.c: 350: config_load_system(&cfg_system);
	ldw	x, #_cfg_system+0
	pushw	x
	call	_config_load_system
	popw	x
;	main.c: 351: config_load_output(&cfg_output);
	ldw	x, #_cfg_output+0
	pushw	x
	call	_config_load_output
	popw	x
;	main.c: 352: autocommit();
	call	_autocommit
	jp	00184$
00150$:
;	main.c: 353: } else if (strcmp(uart_read_buf, "RESTORE") == 0) {
	ldw	x, #___str_73+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00147$
;	main.c: 354: config_default_system(&cfg_system);
	ldw	x, #_cfg_system+0
	pushw	x
	call	_config_default_system
	popw	x
;	main.c: 355: config_default_output(&cfg_output);
	ldw	x, #_cfg_output+0
	pushw	x
	call	_config_default_output
	popw	x
;	main.c: 356: autocommit();
	call	_autocommit
	jp	00184$
00147$:
;	main.c: 367: uint8_t space_found = 0;
	clr	(0x01, sp)
;	main.c: 369: for (idx = 0; idx < uart_read_len; idx++) {
	clr	(0x02, sp)
	clr	(0x0f, sp)
00186$:
	ld	a, (0x0f, sp)
	cp	a, _uart_read_len+0
	jrnc	00103$
;	main.c: 370: if (uart_read_buf[idx] == ' ') {
	clrw	x
	ld	a, (0x0f, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
	cp	a, #0x20
	jrne	00187$
;	main.c: 371: uart_read_buf[idx] = 0;
	clr	(x)
;	main.c: 372: space_found = 1;
	ld	a, #0x01
	ld	(0x01, sp), a
;	main.c: 373: break;
	jra	00103$
00187$:
;	main.c: 369: for (idx = 0; idx < uart_read_len; idx++) {
	inc	(0x0f, sp)
	ld	a, (0x0f, sp)
	ld	(0x02, sp), a
	jra	00186$
00103$:
;	main.c: 377: if (space_found) {
	tnz	(0x01, sp)
	jrne	00341$
	jp	00144$
00341$:
;	main.c: 378: if (strcmp(uart_read_buf, "SNAME") == 0) {
	ldw	x, #___str_74+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	ldw	(0x12, sp), x
;	main.c: 379: set_name(uart_read_buf + idx + 1);
	clrw	x
	ld	a, (0x02, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	incw	x
	ldw	(0x14, sp), x
;	main.c: 378: if (strcmp(uart_read_buf, "SNAME") == 0) {
	ldw	x, (0x12, sp)
	jrne	00141$
;	main.c: 379: set_name(uart_read_buf + idx + 1);
	ldw	x, (0x14, sp)
	pushw	x
	call	_set_name
	popw	x
	jp	00184$
00141$:
;	main.c: 380: } else if (strcmp(uart_read_buf, "OUTPUT") == 0) {
	ldw	x, #___str_75+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00138$
;	main.c: 381: set_output(uart_read_buf + idx + 1);
	ldw	x, (0x14, sp)
	pushw	x
	call	_set_output
	popw	x
	jp	00184$
00138$:
;	main.c: 382: } else if (strcmp(uart_read_buf, "VOLTAGE") == 0) {
	ldw	x, #___str_63+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00135$
;	main.c: 383: set_voltage(uart_read_buf + idx + 1);
	ldw	x, (0x14, sp)
	pushw	x
	call	_set_voltage
	popw	x
	jp	00184$
00135$:
;	main.c: 384: } else if (strcmp(uart_read_buf, "CURRENT") == 0) {
	ldw	x, #___str_62+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00132$
;	main.c: 385: set_current(uart_read_buf + idx + 1);
	ldw	x, (0x14, sp)
	pushw	x
	call	_set_current
	popw	x
	jp	00184$
00132$:
;	main.c: 386: } else if (strcmp(uart_read_buf, "AUTOCOMMIT") == 0) {
	ldw	x, #___str_76+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00129$
;	main.c: 387: set_autocommit(uart_read_buf + idx + 1);
	ldw	x, (0x14, sp)
	pushw	x
	call	_set_autocommit
	popw	x
	jp	00184$
00129$:
;	main.c: 400: } else if (strcmp(uart_read_buf, "CALVOUTADCA") == 0) {
	ldw	x, #___str_77+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00126$
;	main.c: 401: parse_uint("ADC VOUT A", &cfg_system.vout_adc.a, uart_read_buf+idx+1);
	ldw	y, #_cfg_system+29
	ldw	x, #___str_78+0
	ld	a, (0x15, sp)
	push	a
	ld	a, (0x15, sp)
	push	a
	pushw	y
	pushw	x
	call	_parse_uint
	addw	sp, #6
	jp	00184$
00126$:
;	main.c: 402: } else if (strcmp(uart_read_buf, "CALVOUTADCB") == 0) {
	ldw	x, #___str_79+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00123$
;	main.c: 403: parse_uint("ADC VOUT B", &cfg_system.vout_adc.b, uart_read_buf+idx+1);
	ldw	y, #_cfg_system+33
	ldw	x, #___str_80+0
	ld	a, (0x15, sp)
	push	a
	ld	a, (0x15, sp)
	push	a
	pushw	y
	pushw	x
	call	_parse_uint
	addw	sp, #6
	jp	00184$
00123$:
;	main.c: 404: } else if (strcmp(uart_read_buf, "CALVOUTPWMA") == 0) {
	ldw	x, #___str_81+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00120$
;	main.c: 405: parse_uint("PWM VOUT A", &cfg_system.vout_pwm.a, uart_read_buf+idx+1);
	ldw	y, #_cfg_system+45
	ldw	x, #___str_82+0
	ld	a, (0x15, sp)
	push	a
	ld	a, (0x15, sp)
	push	a
	pushw	y
	pushw	x
	call	_parse_uint
	addw	sp, #6
	jp	00184$
00120$:
;	main.c: 406: } else if (strcmp(uart_read_buf, "CALVOUTPWMB") == 0) {
	ldw	x, #___str_83+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00117$
;	main.c: 407: parse_uint("PWM VOUT B", &cfg_system.vout_pwm.b, uart_read_buf+idx+1);
	ldw	y, #_cfg_system+49
	ldw	x, #___str_84+0
	ld	a, (0x15, sp)
	push	a
	ld	a, (0x15, sp)
	push	a
	pushw	y
	pushw	x
	call	_parse_uint
	addw	sp, #6
	jp	00184$
00117$:
;	main.c: 408: } else if (strcmp(uart_read_buf, "CALCOUTADCA") == 0) {
	ldw	x, #___str_85+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00114$
;	main.c: 409: parse_uint("ADC COUT A", &cfg_system.cout_adc.a, uart_read_buf+idx+1);
	ldw	y, #_cfg_system+37
	ldw	x, #___str_86+0
	ld	a, (0x15, sp)
	push	a
	ld	a, (0x15, sp)
	push	a
	pushw	y
	pushw	x
	call	_parse_uint
	addw	sp, #6
	jp	00184$
00114$:
;	main.c: 410: } else if (strcmp(uart_read_buf, "CALCOUTADCB") == 0) {
	ldw	x, #___str_87+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00111$
;	main.c: 411: parse_uint("ADC COUT B", &cfg_system.cout_adc.b, uart_read_buf+idx+1);
	ldw	y, #_cfg_system+41
	ldw	x, #___str_88+0
	ld	a, (0x15, sp)
	push	a
	ld	a, (0x15, sp)
	push	a
	pushw	y
	pushw	x
	call	_parse_uint
	addw	sp, #6
	jra	00184$
00111$:
;	main.c: 412: } else if (strcmp(uart_read_buf, "CALCOUTPWMA") == 0) {
	ldw	x, #___str_89+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00108$
;	main.c: 413: parse_uint("PWM COUT A", &cfg_system.cout_pwm.a, uart_read_buf+idx+1);
	ldw	y, #_cfg_system+53
	ldw	x, #___str_90+0
	ld	a, (0x15, sp)
	push	a
	ld	a, (0x15, sp)
	push	a
	pushw	y
	pushw	x
	call	_parse_uint
	addw	sp, #6
	jra	00184$
00108$:
;	main.c: 414: } else if (strcmp(uart_read_buf, "CALCOUTPWMB") == 0) {
	ldw	x, #___str_91+0
	ldw	y, (0x06, sp)
	pushw	x
	pushw	y
	call	_strcmp
	addw	sp, #4
	tnzw	x
	jrne	00105$
;	main.c: 415: parse_uint("PWM COUT B", &cfg_system.cout_pwm.b, uart_read_buf+idx+1);
	ldw	y, #_cfg_system+57
	ldw	x, #___str_92+0
	ld	a, (0x15, sp)
	push	a
	ld	a, (0x15, sp)
	push	a
	pushw	y
	pushw	x
	call	_parse_uint
	addw	sp, #6
	jra	00184$
00105$:
;	main.c: 417: uart_write_str("UNKNOWN COMMAND!\r\n");
	ldw	x, #___str_93+0
	pushw	x
	call	_uart_write_str
	popw	x
	jra	00184$
00144$:
;	main.c: 420: uart_write_str("UNKNOWN COMMAND\r\n");
	ldw	x, #___str_94+0
	pushw	x
	call	_uart_write_str
	popw	x
00184$:
;	main.c: 423: uart_write_str("DONE\r\n");
	ldw	x, #___str_95+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 425: uart_read_len = 0;
	clr	_uart_read_len+0
;	main.c: 426: read_newline = 0;
	clr	_read_newline+0
	addw	sp, #29
	ret
;	main.c: 470: void config_load(void)
;	-----------------------------------------
;	 function config_load
;	-----------------------------------------
_config_load:
	sub	sp, #3
;	main.c: 472: config_load_system(&cfg_system);
	ldw	x, #_cfg_system+0
	ldw	(0x02, sp), x
	ldw	x, (0x02, sp)
	pushw	x
	call	_config_load_system
	popw	x
;	main.c: 473: config_load_output(&cfg_output);
	ldw	x, #_cfg_output+0
	pushw	x
	call	_config_load_output
	popw	x
;	main.c: 475: if (cfg_system.default_on)
	ldw	x, (0x02, sp)
	ld	a, (0x12, x)
	ld	(0x01, sp), a
;	main.c: 476: cfg_system.output = 1;
	ldw	x, (0x02, sp)
	addw	x, #0x0013
;	main.c: 475: if (cfg_system.default_on)
	tnz	(0x01, sp)
	jreq	00102$
;	main.c: 476: cfg_system.output = 1;
	ld	a, #0x01
	ld	(x), a
	jra	00103$
00102$:
;	main.c: 478: cfg_system.output = 0;
	clr	(x)
00103$:
;	main.c: 480: state.pc3 = 1;
	ldw	x, #_state+13
	ld	a, #0x01
	ld	(x), a
	addw	sp, #3
	ret
;	main.c: 483: void read_state(void)
;	-----------------------------------------
;	 function read_state
;	-----------------------------------------
_read_state:
	sub	sp, #19
;	main.c: 487: tmp = (PC_IDR & (1<<3)) ? 1 : 0;
	ldw	x, #0x500b
	ld	a, (x)
	bcp	a, #0x08
	jreq	00113$
	ld	a, #0x01
	.byte 0x21
00113$:
	clr	a
00114$:
	ld	(0x13, sp), a
;	main.c: 488: if (state.pc3 != tmp) {
	ldw	x, #_state+0
	ldw	(0x09, sp), x
	ldw	x, (0x09, sp)
	addw	x, #0x000d
	ldw	(0x0d, sp), x
	ldw	x, (0x0d, sp)
	ld	a, (x)
	cp	a, (0x13, sp)
	jreq	00102$
;	main.c: 489: uart_write_str("PC3 is now ");
	ldw	x, #___str_96+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 490: uart_write_ch('0' + tmp);
	ld	a, (0x13, sp)
	add	a, #0x30
	push	a
	call	_uart_write_ch
	pop	a
;	main.c: 491: uart_write_str("\r\n");
	ldw	x, #___str_1+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 492: state.pc3 = tmp;
	ldw	x, (0x0d, sp)
	ld	a, (0x13, sp)
	ld	(x), a
00102$:
;	main.c: 495: tmp = (PB_IDR & (1<<5)) ? 1 : 0;
	ldw	x, #0x5006
	ld	a, (x)
	bcp	a, #0x20
	jreq	00115$
	ld	a, #0x01
	.byte 0x21
00115$:
	clr	a
00116$:
	ld	(0x06, sp), a
;	main.c: 496: if (state.constant_current != tmp) {
	ldw	x, (0x09, sp)
	addw	x, #0x000c
	ld	a, (x)
	cp	a, (0x06, sp)
	jreq	00104$
;	main.c: 497: state.constant_current = tmp;
	ld	a, (0x06, sp)
	ld	(x), a
;	main.c: 498: output_check_state(&cfg_system, state.constant_current);
	ldw	x, #_cfg_system+0
	ld	a, (0x06, sp)
	push	a
	pushw	x
	call	_output_check_state
	addw	sp, #3
00104$:
;	main.c: 501: if (adc_ready()) {
	call	_adc_ready
	tnz	a
	jrne	00157$
	jp	00111$
00157$:
;	main.c: 502: uint16_t val = adc_read();
	call	_adc_read
	ldw	(0x03, sp), x
;	main.c: 503: uint8_t ch = adc_channel();
	call	_adc_channel
	ld	(0x05, sp), a
;	main.c: 505: switch (ch) {
	ld	a, (0x05, sp)
	cp	a, #0x02
	jreq	00105$
	ld	a, (0x05, sp)
	cp	a, #0x03
	jreq	00106$
	ld	a, (0x05, sp)
	cp	a, #0x04
	jreq	00107$
	jp	00108$
;	main.c: 506: case 2:
00105$:
;	main.c: 507: state.cout_raw = val;
	ldw	x, (0x09, sp)
	ldw	y, (0x03, sp)
	ldw	(0x0004, x), y
;	main.c: 509: state.cout = adc_to_volt(val, &cfg_system.cout_adc);
	ldw	x, (0x09, sp)
	addw	x, #0x000a
	ldw	(0x07, sp), x
	ldw	x, #_cfg_system+37
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	call	_adc_to_volt
	addw	sp, #4
	ldw	y, (0x07, sp)
	ldw	(y), x
;	main.c: 510: ch = 3;
	ld	a, #0x03
	ld	(0x05, sp), a
;	main.c: 511: break;
	jp	00108$
;	main.c: 512: case 3:
00106$:
;	main.c: 513: state.vout_raw = val;
	ldw	x, (0x09, sp)
	incw	x
	incw	x
	ldw	y, (0x03, sp)
	ldw	(x), y
;	main.c: 515: state.vout = adc_to_volt(val, &cfg_system.vout_adc);
	ldw	x, (0x09, sp)
	addw	x, #0x0008
	ldw	(0x11, sp), x
	ldw	x, #_cfg_system+29
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	call	_adc_to_volt
	addw	sp, #4
	ldw	y, (0x11, sp)
	ldw	(y), x
;	main.c: 516: ch = 4;
	ld	a, #0x04
	ld	(0x05, sp), a
;	main.c: 517: break;
	jp	00108$
;	main.c: 518: case 4:
00107$:
;	main.c: 519: state.vin_raw = val;
	ldw	x, (0x09, sp)
	ldw	y, (0x03, sp)
	ldw	(x), y
;	main.c: 521: state.vin = adc_to_volt(val, &cfg_system.vin_adc);
	ldw	x, (0x09, sp)
	addw	x, #0x0006
	ldw	(0x0b, sp), x
	ldw	x, #_cfg_system+21
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	call	_adc_to_volt
	addw	sp, #4
	ldw	y, (0x0b, sp)
	ldw	(y), x
;	main.c: 522: ch = 2;
	ld	a, #0x02
	ld	(0x05, sp), a
;	main.c: 529: ch1 = '0' + (val / 10000) % 10;
	ldw	x, (0x03, sp)
	ldw	y, #0x2710
	divw	x, y
	ldw	y, #0x000a
	divw	x, y
	ld	a, yl
	add	a, #0x30
	ld	(0x02, sp), a
;	main.c: 530: ch2 = '0' + (val / 1000) % 10;
	ldw	x, (0x03, sp)
	ldw	y, #0x03e8
	divw	x, y
	ldw	y, #0x000a
	divw	x, y
	ld	a, yl
	add	a, #0x30
	ld	(0x01, sp), a
;	main.c: 531: ch3 = '0' + (val / 100) % 10;
	ldw	x, (0x03, sp)
	ldw	y, #0x0064
	divw	x, y
	ldw	y, #0x000a
	divw	x, y
	ld	a, yl
	add	a, #0x30
	ld	xh, a
;	main.c: 532: ch4 = '0' + (val / 10 ) % 10;
	pushw	x
	ldw	x, (0x05, sp)
	ldw	y, #0x000a
	divw	x, y
	ldw	(0x11, sp), x
	ldw	x, (0x11, sp)
	ldw	y, #0x000a
	divw	x, y
	ld	a, yl
	popw	x
	add	a, #0x30
;	main.c: 534: display_show(ch1, 0, ch2, 1, ch3, 0, ch4, 0);
	push	#0x00
	push	a
	push	#0x00
	ld	a, xh
	push	a
	push	#0x01
	ld	a, (0x06, sp)
	push	a
	push	#0x00
	ld	a, (0x09, sp)
	push	a
	call	_display_show
	addw	sp, #8
;	main.c: 537: }
00108$:
;	main.c: 539: adc_start(ch);
	ld	a, (0x05, sp)
	push	a
	call	_adc_start
	pop	a
00111$:
	addw	sp, #19
	ret
;	main.c: 543: void ensure_afr0_set(void)
;	-----------------------------------------
;	 function ensure_afr0_set
;	-----------------------------------------
_ensure_afr0_set:
;	main.c: 545: if ((OPT2 & 1) == 0) {
	ldw	x, #0x4803
	ld	a, (x)
	srl	a
	jrc	00110$
;	main.c: 546: uart_flush_writes();
	call	_uart_flush_writes
;	main.c: 547: if (eeprom_set_afr0()) {
	call	_eeprom_set_afr0
	tnz	a
	jreq	00105$
;	main.c: 548: uart_write_str("AFR0 set, reseting the unit\r\n");
	ldw	x, #___str_97+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 549: uart_flush_writes();
	call	_uart_flush_writes
;	main.c: 50: IWDG_KR = 0xCC; // Enable IWDG
	mov	0x50e0+0, #0xcc
;	main.c: 551: while (1); // Force a reset in a few msec
00102$:
	jra	00102$
00105$:
;	main.c: 554: uart_write_str("AFR0 not set and programming failed!\r\n");
	ldw	x, #___str_98+0
	pushw	x
	call	_uart_write_str
	popw	x
00110$:
	ret
;	main.c: 559: int main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 439: PA_ODR = 0;
	mov	0x5000+0, #0x00
;	main.c: 440: PA_DDR = (1<<1) | (1<<2);
	mov	0x5002+0, #0x06
;	main.c: 441: PA_CR1 = (1<<1) | (1<<2) | (1<<3);
	mov	0x5003+0, #0x0e
;	main.c: 442: PA_CR2 = (1<<1) | (1<<2) | (1<<3);
	mov	0x5004+0, #0x0e
;	main.c: 446: PB_ODR = (1<<4); // For safety we start with off-state
	mov	0x5005+0, #0x10
;	main.c: 447: PB_DDR = (1<<4);
	mov	0x5007+0, #0x10
;	main.c: 448: PB_CR1 = (1<<4);
	mov	0x5008+0, #0x10
;	main.c: 449: PB_CR2 = 0;
	mov	0x5009+0, #0x00
;	main.c: 456: PC_ODR = 0;
	mov	0x500a+0, #0x00
;	main.c: 457: PC_DDR = (1<<5) || (1<<6);
	mov	0x500c+0, #0x01
;	main.c: 458: PC_CR1 = (1<<7); // For the button
	mov	0x500d+0, #0x80
;	main.c: 459: PC_CR2 = (1<<5) | (1<<6);
	mov	0x500e+0, #0x60
;	main.c: 465: PD_DDR = (1<<4);
	mov	0x5011+0, #0x10
;	main.c: 466: PD_CR1 = (1<<1) | (1<<4); // For the button
	mov	0x5012+0, #0x12
;	main.c: 467: PD_CR2 = (1<<4);
	mov	0x5013+0, #0x10
;	main.c: 431: CLK_CKDIVR = 0x00; // Set the frequency to 16 MHz
	mov	0x50c6+0, #0x00
;	main.c: 565: uart_init();
	call	_uart_init
;	main.c: 566: pwm_init();
	call	_pwm_init
;	main.c: 567: adc_init();
	call	_adc_init
;	main.c: 569: config_load();
	call	_config_load
;	main.c: 571: uart_write_str("\r\n" MODEL " starting: Version " FW_VERSION "\r\n");
	ldw	x, #___str_99+0
	pushw	x
	call	_uart_write_str
	popw	x
;	main.c: 573: ensure_afr0_set();
	call	_ensure_afr0_set
;	main.c: 50: IWDG_KR = 0xCC; // Enable IWDG
	mov	0x50e0+0, #0xcc
;	main.c: 576: adc_start(4);
	push	#0x04
	call	_adc_start
	pop	a
;	main.c: 577: commit_output();
	call	_commit_output
;	main.c: 579: do {
00103$:
;	main.c: 56: IWDG_KR = 0xAA; // Reset the counter
	mov	0x50e0+0, #0xaa
;	main.c: 581: read_state();
	call	_read_state
;	main.c: 582: display_refresh();
	call	_display_refresh
;	main.c: 583: uart_drive();
	call	_uart_drive
;	main.c: 584: if (read_newline) {
	tnz	_read_newline+0
	jreq	00103$
;	main.c: 585: process_input();
	call	_process_input
;	main.c: 587: } while(1);
	jra	00103$
	ret
	.area CODE
___str_0:
	.ascii "SNAME: "
	.db 0x00
___str_1:
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_2:
	.ascii "AUTOCOMMIT OFF: CHANGE PENDING ON COMMIT"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_3:
	.ascii "OUTPUT takes either 0 for OFF or 1 for ON, received: "
	.db 0x22
	.db 0x00
___str_4:
	.db 0x22
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_5:
	.ascii "OUTPUT: OFF"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_6:
	.ascii "OUTPUT: ON"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_7:
	.ascii "VOLTAGE VALUE TOO HIGH"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_8:
	.ascii "VOLTAGE VALUE TOO LOW"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_9:
	.ascii "VOLTAGE: SET "
	.db 0x00
___str_10:
	.ascii "CURRENT VALUE TOO HIGH"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_11:
	.ascii "CURRENT VALUE TOO LOW"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_12:
	.ascii "CURRENT: SET "
	.db 0x00
___str_13:
	.ascii "1"
	.db 0x00
___str_14:
	.ascii "YES"
	.db 0x00
___str_15:
	.ascii "AUTOCOMMIT: YES"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_16:
	.ascii "0"
	.db 0x00
___str_17:
	.ascii "NO"
	.db 0x00
___str_18:
	.ascii "AUTOCOMMIT: NO"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_19:
	.ascii "UNKNOWN AUTOCOMMIT ARG: "
	.db 0x00
___str_20:
	.ascii "ON"
	.db 0x00
___str_21:
	.ascii "OFF"
	.db 0x00
___str_22:
	.ascii "FAILED TO PARSE "
	.db 0x00
___str_23:
	.ascii " FOR "
	.db 0x00
___str_24:
	.ascii "CALIBRATION SET "
	.db 0x00
___str_25:
	.ascii "MODEL"
	.db 0x00
___str_26:
	.ascii "MODEL: B3603"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_27:
	.ascii "VERSION"
	.db 0x00
___str_28:
	.ascii "VERSION: 1.0.1"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_29:
	.ascii "SYSTEM"
	.db 0x00
___str_30:
	.ascii "MODEL: B3603"
	.db 0x0D
	.db 0x0A
	.ascii "VERSION: 1.0.1"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_31:
	.ascii "NAME: "
	.db 0x00
___str_32:
	.ascii "ONSTARTUP: "
	.db 0x00
___str_33:
	.ascii "AUTOCOMMIT: "
	.db 0x00
___str_34:
	.ascii "CALIBRATION"
	.db 0x00
___str_35:
	.ascii "CALIBRATE VIN ADC: "
	.db 0x00
___str_36:
	.ascii "CALIBRATE VOUT ADC: "
	.db 0x00
___str_37:
	.ascii "CALIBRATE COUT ADC: "
	.db 0x00
___str_38:
	.ascii "CALIBRATE VOUT PWM: "
	.db 0x00
___str_39:
	.ascii "CALIBRATE COUT PWM: "
	.db 0x00
___str_40:
	.ascii "RCALIBRATION"
	.db 0x00
___str_41:
	.ascii "LIMITS"
	.db 0x00
___str_42:
	.ascii "LIMITS:"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_43:
	.ascii "VMIN: "
	.db 0x00
___str_44:
	.ascii "VMAX: "
	.db 0x00
___str_45:
	.ascii "VSTEP: "
	.db 0x00
___str_46:
	.ascii "CMIN: "
	.db 0x00
___str_47:
	.ascii "CMAX: "
	.db 0x00
___str_48:
	.ascii "CSTEP: "
	.db 0x00
___str_49:
	.ascii "CONFIG"
	.db 0x00
___str_50:
	.ascii "CONFIG:"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_51:
	.ascii "OUTPUT: "
	.db 0x00
___str_52:
	.ascii "VSET: "
	.db 0x00
___str_53:
	.ascii "CSET: "
	.db 0x00
___str_54:
	.ascii "VSHUTDOWN: "
	.db 0x00
___str_55:
	.ascii "CSHUTDOWN: "
	.db 0x00
___str_56:
	.ascii "STATUS"
	.db 0x00
___str_57:
	.ascii "STATUS:"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_58:
	.ascii "VIN: "
	.db 0x00
___str_59:
	.ascii "VOUT: "
	.db 0x00
___str_60:
	.ascii "COUT: "
	.db 0x00
___str_61:
	.ascii "CONSTANT: "
	.db 0x00
___str_62:
	.ascii "CURRENT"
	.db 0x00
___str_63:
	.ascii "VOLTAGE"
	.db 0x00
___str_64:
	.ascii "RSTATUS"
	.db 0x00
___str_65:
	.ascii "RSTATUS:"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_66:
	.ascii "VIN ADC: "
	.db 0x00
___str_67:
	.ascii "VOUT ADC: "
	.db 0x00
___str_68:
	.ascii "COUT ADC: "
	.db 0x00
___str_69:
	.ascii "COMMIT"
	.db 0x00
___str_70:
	.ascii "SAVE"
	.db 0x00
___str_71:
	.ascii "SAVED"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_72:
	.ascii "LOAD"
	.db 0x00
___str_73:
	.ascii "RESTORE"
	.db 0x00
___str_74:
	.ascii "SNAME"
	.db 0x00
___str_75:
	.ascii "OUTPUT"
	.db 0x00
___str_76:
	.ascii "AUTOCOMMIT"
	.db 0x00
___str_77:
	.ascii "CALVOUTADCA"
	.db 0x00
___str_78:
	.ascii "ADC VOUT A"
	.db 0x00
___str_79:
	.ascii "CALVOUTADCB"
	.db 0x00
___str_80:
	.ascii "ADC VOUT B"
	.db 0x00
___str_81:
	.ascii "CALVOUTPWMA"
	.db 0x00
___str_82:
	.ascii "PWM VOUT A"
	.db 0x00
___str_83:
	.ascii "CALVOUTPWMB"
	.db 0x00
___str_84:
	.ascii "PWM VOUT B"
	.db 0x00
___str_85:
	.ascii "CALCOUTADCA"
	.db 0x00
___str_86:
	.ascii "ADC COUT A"
	.db 0x00
___str_87:
	.ascii "CALCOUTADCB"
	.db 0x00
___str_88:
	.ascii "ADC COUT B"
	.db 0x00
___str_89:
	.ascii "CALCOUTPWMA"
	.db 0x00
___str_90:
	.ascii "PWM COUT A"
	.db 0x00
___str_91:
	.ascii "CALCOUTPWMB"
	.db 0x00
___str_92:
	.ascii "PWM COUT B"
	.db 0x00
___str_93:
	.ascii "UNKNOWN COMMAND!"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_94:
	.ascii "UNKNOWN COMMAND"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_95:
	.ascii "DONE"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_96:
	.ascii "PC3 is now "
	.db 0x00
___str_97:
	.ascii "AFR0 set, reseting the unit"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_98:
	.ascii "AFR0 not set and programming failed!"
	.db 0x0D
	.db 0x0A
	.db 0x00
___str_99:
	.db 0x0D
	.db 0x0A
	.ascii "B3603 starting: Version 1.0.1"
	.db 0x0D
	.db 0x0A
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
