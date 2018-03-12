                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Mon Mar 12 12:44:09 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module main
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _ensure_afr0_set
                                     14 	.globl _read_state
                                     15 	.globl _config_load
                                     16 	.globl _process_input
                                     17 	.globl _parse_uint
                                     18 	.globl __parse_uint
                                     19 	.globl _write_int
                                     20 	.globl _write_milliamp
                                     21 	.globl _write_millivolt
                                     22 	.globl _write_onoff
                                     23 	.globl _write_str
                                     24 	.globl _set_autocommit
                                     25 	.globl _set_current
                                     26 	.globl _set_voltage
                                     27 	.globl _set_output
                                     28 	.globl _autocommit
                                     29 	.globl _set_name
                                     30 	.globl _commit_output
                                     31 	.globl _adc_ready
                                     32 	.globl _adc_channel
                                     33 	.globl _adc_read
                                     34 	.globl _adc_to_volt
                                     35 	.globl _adc_start
                                     36 	.globl _adc_init
                                     37 	.globl _parse_millinum
                                     38 	.globl _output_check_state
                                     39 	.globl _output_commit
                                     40 	.globl _pwm_init
                                     41 	.globl _config_default_output
                                     42 	.globl _config_save_output
                                     43 	.globl _config_load_output
                                     44 	.globl _config_default_system
                                     45 	.globl _config_save_system
                                     46 	.globl _config_load_system
                                     47 	.globl _eeprom_set_afr0
                                     48 	.globl _uart_flush_writes
                                     49 	.globl _uart_drive
                                     50 	.globl _uart_write_milliamp
                                     51 	.globl _uart_write_millivolt
                                     52 	.globl _uart_write_fixed_point
                                     53 	.globl _uart_write_int32
                                     54 	.globl _uart_write_int
                                     55 	.globl _uart_write_str
                                     56 	.globl _uart_write_ch
                                     57 	.globl _uart_init
                                     58 	.globl _display_show
                                     59 	.globl _display_refresh
                                     60 	.globl _isprint
                                     61 	.globl _strcmp
                                     62 	.globl _memcpy
                                     63 	.globl _state
                                     64 	.globl _cfg_output
                                     65 	.globl _cfg_system
                                     66 ;--------------------------------------------------------
                                     67 ; ram data
                                     68 ;--------------------------------------------------------
                                     69 	.area DATA
      000001                         70 _cfg_system::
      000001                         71 	.ds 61
      00003E                         72 _cfg_output::
      00003E                         73 	.ds 9
      000047                         74 _state::
      000047                         75 	.ds 14
                                     76 ;--------------------------------------------------------
                                     77 ; ram data
                                     78 ;--------------------------------------------------------
                                     79 	.area INITIALIZED
                                     80 ;--------------------------------------------------------
                                     81 ; Stack segment in internal ram 
                                     82 ;--------------------------------------------------------
                                     83 	.area	SSEG
      0001FB                         84 __start__stack:
      0001FB                         85 	.ds	1
                                     86 
                                     87 ;--------------------------------------------------------
                                     88 ; absolute external ram data
                                     89 ;--------------------------------------------------------
                                     90 	.area DABS (ABS)
                                     91 ;--------------------------------------------------------
                                     92 ; interrupt vector 
                                     93 ;--------------------------------------------------------
                                     94 	.area HOME
      008000                         95 __interrupt_vect:
      008000 82 00 80 83             96 	int s_GSINIT ;reset
      008004 82 00 00 00             97 	int 0x0000 ;trap
      008008 82 00 00 00             98 	int 0x0000 ;int0
      00800C 82 00 00 00             99 	int 0x0000 ;int1
      008010 82 00 00 00            100 	int 0x0000 ;int2
      008014 82 00 00 00            101 	int 0x0000 ;int3
      008018 82 00 00 00            102 	int 0x0000 ;int4
      00801C 82 00 00 00            103 	int 0x0000 ;int5
      008020 82 00 00 00            104 	int 0x0000 ;int6
      008024 82 00 00 00            105 	int 0x0000 ;int7
      008028 82 00 00 00            106 	int 0x0000 ;int8
      00802C 82 00 00 00            107 	int 0x0000 ;int9
      008030 82 00 00 00            108 	int 0x0000 ;int10
      008034 82 00 00 00            109 	int 0x0000 ;int11
      008038 82 00 00 00            110 	int 0x0000 ;int12
      00803C 82 00 00 00            111 	int 0x0000 ;int13
      008040 82 00 00 00            112 	int 0x0000 ;int14
      008044 82 00 00 00            113 	int 0x0000 ;int15
      008048 82 00 00 00            114 	int 0x0000 ;int16
      00804C 82 00 00 00            115 	int 0x0000 ;int17
      008050 82 00 00 00            116 	int 0x0000 ;int18
      008054 82 00 00 00            117 	int 0x0000 ;int19
      008058 82 00 00 00            118 	int 0x0000 ;int20
      00805C 82 00 00 00            119 	int 0x0000 ;int21
      008060 82 00 00 00            120 	int 0x0000 ;int22
      008064 82 00 00 00            121 	int 0x0000 ;int23
      008068 82 00 00 00            122 	int 0x0000 ;int24
      00806C 82 00 00 00            123 	int 0x0000 ;int25
      008070 82 00 00 00            124 	int 0x0000 ;int26
      008074 82 00 00 00            125 	int 0x0000 ;int27
      008078 82 00 00 00            126 	int 0x0000 ;int28
      00807C 82 00 00 00            127 	int 0x0000 ;int29
                                    128 ;--------------------------------------------------------
                                    129 ; global & static initialisations
                                    130 ;--------------------------------------------------------
                                    131 	.area HOME
                                    132 	.area GSINIT
                                    133 	.area GSFINAL
                                    134 	.area GSINIT
      008083                        135 __sdcc_gs_init_startup:
      008083                        136 __sdcc_init_data:
                                    137 ; stm8_genXINIT() start
      008083 AE 01 B4         [ 2]  138 	ldw x, #l_DATA
      008086 27 07            [ 1]  139 	jreq	00002$
      008088                        140 00001$:
      008088 72 4F 00 00      [ 1]  141 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  142 	decw x
      00808D 26 F9            [ 1]  143 	jrne	00001$
      00808F                        144 00002$:
      00808F AE 00 46         [ 2]  145 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  146 	jreq	00004$
      008094                        147 00003$:
      008094 D6 9F 84         [ 1]  148 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 01 B4         [ 1]  149 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  150 	decw	x
      00809B 26 F7            [ 1]  151 	jrne	00003$
      00809D                        152 00004$:
                                    153 ; stm8_genXINIT() end
                                    154 	.area GSFINAL
      00809D CC 80 80         [ 2]  155 	jp	__sdcc_program_startup
                                    156 ;--------------------------------------------------------
                                    157 ; Home
                                    158 ;--------------------------------------------------------
                                    159 	.area HOME
                                    160 	.area HOME
      008080                        161 __sdcc_program_startup:
      008080 CC 8D 62         [ 2]  162 	jp	_main
                                    163 ;	return from main will return to caller
                                    164 ;--------------------------------------------------------
                                    165 ; code
                                    166 ;--------------------------------------------------------
                                    167 	.area CODE
                                    168 ;	main.c: 59: void commit_output()
                                    169 ;	-----------------------------------------
                                    170 ;	 function commit_output
                                    171 ;	-----------------------------------------
      0080A0                        172 _commit_output:
                                    173 ;	main.c: 61: output_commit(&cfg_output, &cfg_system, state.constant_current);
      0080A0 AE 00 53         [ 2]  174 	ldw	x, #_state+12
      0080A3 F6               [ 1]  175 	ld	a, (x)
      0080A4 AE 00 01         [ 2]  176 	ldw	x, #_cfg_system+0
      0080A7 90 AE 00 3E      [ 2]  177 	ldw	y, #_cfg_output+0
      0080AB 88               [ 1]  178 	push	a
      0080AC 89               [ 2]  179 	pushw	x
      0080AD 90 89            [ 2]  180 	pushw	y
      0080AF CD 98 D1         [ 4]  181 	call	_output_commit
      0080B2 5B 05            [ 2]  182 	addw	sp, #5
      0080B4 81               [ 4]  183 	ret
                                    184 ;	main.c: 64: void set_name(uint8_t *name)
                                    185 ;	-----------------------------------------
                                    186 ;	 function set_name
                                    187 ;	-----------------------------------------
      0080B5                        188 _set_name:
      0080B5 52 07            [ 2]  189 	sub	sp, #7
                                    190 ;	main.c: 68: for (idx = 0; name[idx] != 0; idx++) {
      0080B7 0F 01            [ 1]  191 	clr	(0x01, sp)
      0080B9                        192 00105$:
      0080B9 5F               [ 1]  193 	clrw	x
      0080BA 7B 01            [ 1]  194 	ld	a, (0x01, sp)
      0080BC 97               [ 1]  195 	ld	xl, a
      0080BD 72 FB 0A         [ 2]  196 	addw	x, (0x0a, sp)
      0080C0 1F 02            [ 2]  197 	ldw	(0x02, sp), x
      0080C2 1E 02            [ 2]  198 	ldw	x, (0x02, sp)
      0080C4 F6               [ 1]  199 	ld	a, (x)
      0080C5 A1 00            [ 1]  200 	cp	a, #0x00
      0080C7 27 14            [ 1]  201 	jreq	00103$
                                    202 ;	main.c: 69: if (!isprint(name[idx]))
      0080C9 5F               [ 1]  203 	clrw	x
      0080CA 97               [ 1]  204 	ld	xl, a
      0080CB 89               [ 2]  205 	pushw	x
      0080CC CD 9E 79         [ 4]  206 	call	_isprint
      0080CF 5B 02            [ 2]  207 	addw	sp, #2
      0080D1 5D               [ 2]  208 	tnzw	x
      0080D2 26 05            [ 1]  209 	jrne	00106$
                                    210 ;	main.c: 70: name[idx] = '.'; // Eliminate non-printable chars
      0080D4 1E 02            [ 2]  211 	ldw	x, (0x02, sp)
      0080D6 A6 2E            [ 1]  212 	ld	a, #0x2e
      0080D8 F7               [ 1]  213 	ld	(x), a
      0080D9                        214 00106$:
                                    215 ;	main.c: 68: for (idx = 0; name[idx] != 0; idx++) {
      0080D9 0C 01            [ 1]  216 	inc	(0x01, sp)
      0080DB 20 DC            [ 2]  217 	jra	00105$
      0080DD                        218 00103$:
                                    219 ;	main.c: 73: memcpy(cfg_system.name, name, sizeof(cfg_system.name));
      0080DD 16 0A            [ 2]  220 	ldw	y, (0x0a, sp)
      0080DF AE 00 01         [ 2]  221 	ldw	x, #_cfg_system+0
      0080E2 1F 06            [ 2]  222 	ldw	(0x06, sp), x
      0080E4 1E 06            [ 2]  223 	ldw	x, (0x06, sp)
      0080E6 5C               [ 2]  224 	incw	x
      0080E7 1F 04            [ 2]  225 	ldw	(0x04, sp), x
      0080E9 1E 04            [ 2]  226 	ldw	x, (0x04, sp)
      0080EB 4B 11            [ 1]  227 	push	#0x11
      0080ED 4B 00            [ 1]  228 	push	#0x00
      0080EF 90 89            [ 2]  229 	pushw	y
      0080F1 89               [ 2]  230 	pushw	x
      0080F2 CD 9E 93         [ 4]  231 	call	_memcpy
      0080F5 5B 06            [ 2]  232 	addw	sp, #6
                                    233 ;	main.c: 74: cfg_system.name[sizeof(cfg_system.name)-1] = 0;
      0080F7 1E 06            [ 2]  234 	ldw	x, (0x06, sp)
      0080F9 1C 00 11         [ 2]  235 	addw	x, #0x0011
      0080FC 7F               [ 1]  236 	clr	(x)
                                    237 ;	main.c: 76: uart_write_str("SNAME: ");
      0080FD AE 8D DF         [ 2]  238 	ldw	x, #___str_0+0
      008100 89               [ 2]  239 	pushw	x
      008101 CD 94 79         [ 4]  240 	call	_uart_write_str
      008104 85               [ 2]  241 	popw	x
                                    242 ;	main.c: 77: uart_write_str(cfg_system.name);
      008105 1E 04            [ 2]  243 	ldw	x, (0x04, sp)
      008107 89               [ 2]  244 	pushw	x
      008108 CD 94 79         [ 4]  245 	call	_uart_write_str
      00810B 85               [ 2]  246 	popw	x
                                    247 ;	main.c: 78: uart_write_str("\r\n");
      00810C AE 8D E7         [ 2]  248 	ldw	x, #___str_1+0
      00810F 89               [ 2]  249 	pushw	x
      008110 CD 94 79         [ 4]  250 	call	_uart_write_str
      008113 5B 09            [ 2]  251 	addw	sp, #9
      008115 81               [ 4]  252 	ret
                                    253 ;	main.c: 81: void autocommit(void)
                                    254 ;	-----------------------------------------
                                    255 ;	 function autocommit
                                    256 ;	-----------------------------------------
      008116                        257 _autocommit:
                                    258 ;	main.c: 83: if (cfg_system.autocommit) {
      008116 AE 00 15         [ 2]  259 	ldw	x, #_cfg_system+20
      008119 F6               [ 1]  260 	ld	a, (x)
      00811A 4D               [ 1]  261 	tnz	a
      00811B 27 05            [ 1]  262 	jreq	00102$
                                    263 ;	main.c: 84: commit_output();
      00811D CD 80 A0         [ 4]  264 	call	_commit_output
      008120 20 08            [ 2]  265 	jra	00104$
      008122                        266 00102$:
                                    267 ;	main.c: 86: uart_write_str("AUTOCOMMIT OFF: CHANGE PENDING ON COMMIT\r\n");
      008122 AE 8D EA         [ 2]  268 	ldw	x, #___str_2+0
      008125 89               [ 2]  269 	pushw	x
      008126 CD 94 79         [ 4]  270 	call	_uart_write_str
      008129 85               [ 2]  271 	popw	x
      00812A                        272 00104$:
      00812A 81               [ 4]  273 	ret
                                    274 ;	main.c: 90: void set_output(uint8_t *s)
                                    275 ;	-----------------------------------------
                                    276 ;	 function set_output
                                    277 ;	-----------------------------------------
      00812B                        278 _set_output:
      00812B 89               [ 2]  279 	pushw	x
                                    280 ;	main.c: 92: if (s[1] != 0) {
      00812C 1E 05            [ 2]  281 	ldw	x, (0x05, sp)
      00812E E6 01            [ 1]  282 	ld	a, (0x1, x)
      008130 4D               [ 1]  283 	tnz	a
      008131 27 19            [ 1]  284 	jreq	00102$
                                    285 ;	main.c: 93: uart_write_str("OUTPUT takes either 0 for OFF or 1 for ON, received: \"");
      008133 AE 8E 15         [ 2]  286 	ldw	x, #___str_3+0
      008136 89               [ 2]  287 	pushw	x
      008137 CD 94 79         [ 4]  288 	call	_uart_write_str
      00813A 85               [ 2]  289 	popw	x
                                    290 ;	main.c: 94: uart_write_str(s);
      00813B 1E 05            [ 2]  291 	ldw	x, (0x05, sp)
      00813D 89               [ 2]  292 	pushw	x
      00813E CD 94 79         [ 4]  293 	call	_uart_write_str
      008141 85               [ 2]  294 	popw	x
                                    295 ;	main.c: 95: uart_write_str("\"\r\n");
      008142 AE 8E 4C         [ 2]  296 	ldw	x, #___str_4+0
      008145 89               [ 2]  297 	pushw	x
      008146 CD 94 79         [ 4]  298 	call	_uart_write_str
      008149 85               [ 2]  299 	popw	x
                                    300 ;	main.c: 96: return;
      00814A 20 47            [ 2]  301 	jra	00109$
      00814C                        302 00102$:
                                    303 ;	main.c: 99: if (s[0] == '0') {
      00814C 16 05            [ 2]  304 	ldw	y, (0x05, sp)
      00814E 17 01            [ 2]  305 	ldw	(0x01, sp), y
      008150 1E 01            [ 2]  306 	ldw	x, (0x01, sp)
      008152 F6               [ 1]  307 	ld	a, (x)
      008153 A1 30            [ 1]  308 	cp	a, #0x30
      008155 26 0E            [ 1]  309 	jrne	00107$
                                    310 ;	main.c: 100: cfg_system.output = 0;
      008157 AE 00 14         [ 2]  311 	ldw	x, #_cfg_system+19
      00815A 7F               [ 1]  312 	clr	(x)
                                    313 ;	main.c: 101: uart_write_str("OUTPUT: OFF\r\n");
      00815B AE 8E 50         [ 2]  314 	ldw	x, #___str_5+0
      00815E 89               [ 2]  315 	pushw	x
      00815F CD 94 79         [ 4]  316 	call	_uart_write_str
      008162 85               [ 2]  317 	popw	x
      008163 20 2B            [ 2]  318 	jra	00108$
      008165                        319 00107$:
                                    320 ;	main.c: 102: } else if (s[0] == '1') {
      008165 A1 31            [ 1]  321 	cp	a, #0x31
      008167 26 10            [ 1]  322 	jrne	00104$
                                    323 ;	main.c: 103: cfg_system.output = 1;
      008169 AE 00 14         [ 2]  324 	ldw	x, #_cfg_system+19
      00816C A6 01            [ 1]  325 	ld	a, #0x01
      00816E F7               [ 1]  326 	ld	(x), a
                                    327 ;	main.c: 104: uart_write_str("OUTPUT: ON\r\n");
      00816F AE 8E 5E         [ 2]  328 	ldw	x, #___str_6+0
      008172 89               [ 2]  329 	pushw	x
      008173 CD 94 79         [ 4]  330 	call	_uart_write_str
      008176 85               [ 2]  331 	popw	x
      008177 20 17            [ 2]  332 	jra	00108$
      008179                        333 00104$:
                                    334 ;	main.c: 106: uart_write_str("OUTPUT takes either 0 for OFF or 1 for ON, received: \"");
      008179 AE 8E 15         [ 2]  335 	ldw	x, #___str_3+0
      00817C 89               [ 2]  336 	pushw	x
      00817D CD 94 79         [ 4]  337 	call	_uart_write_str
      008180 85               [ 2]  338 	popw	x
                                    339 ;	main.c: 107: uart_write_str(s);
      008181 1E 01            [ 2]  340 	ldw	x, (0x01, sp)
      008183 89               [ 2]  341 	pushw	x
      008184 CD 94 79         [ 4]  342 	call	_uart_write_str
      008187 85               [ 2]  343 	popw	x
                                    344 ;	main.c: 108: uart_write_str("\"\r\n");
      008188 AE 8E 4C         [ 2]  345 	ldw	x, #___str_4+0
      00818B 89               [ 2]  346 	pushw	x
      00818C CD 94 79         [ 4]  347 	call	_uart_write_str
      00818F 85               [ 2]  348 	popw	x
      008190                        349 00108$:
                                    350 ;	main.c: 111: autocommit();
      008190 CD 81 16         [ 4]  351 	call	_autocommit
      008193                        352 00109$:
      008193 85               [ 2]  353 	popw	x
      008194 81               [ 4]  354 	ret
                                    355 ;	main.c: 114: void set_voltage(uint8_t *s)
                                    356 ;	-----------------------------------------
                                    357 ;	 function set_voltage
                                    358 ;	-----------------------------------------
      008195                        359 _set_voltage:
      008195 52 06            [ 2]  360 	sub	sp, #6
                                    361 ;	main.c: 118: val = parse_millinum(s);
      008197 1E 09            [ 2]  362 	ldw	x, (0x09, sp)
      008199 89               [ 2]  363 	pushw	x
      00819A CD 9B 6F         [ 4]  364 	call	_parse_millinum
      00819D 5B 02            [ 2]  365 	addw	sp, #2
      00819F 1F 01            [ 2]  366 	ldw	(0x01, sp), x
                                    367 ;	main.c: 119: if (val == 0xFFFF)
      0081A1 1E 01            [ 2]  368 	ldw	x, (0x01, sp)
      0081A3 A3 FF FF         [ 2]  369 	cpw	x, #0xffff
      0081A6 27 52            [ 1]  370 	jreq	00107$
                                    371 ;	main.c: 120: return;
      0081A8 20 00            [ 2]  372 	jra	00102$
      0081AA                        373 00102$:
                                    374 ;	main.c: 122: if (val > CAP_VMAX) {
      0081AA 16 01            [ 2]  375 	ldw	y, (0x01, sp)
      0081AC 17 05            [ 2]  376 	ldw	(0x05, sp), y
      0081AE 0F 04            [ 1]  377 	clr	(0x04, sp)
      0081B0 0F 03            [ 1]  378 	clr	(0x03, sp)
      0081B2 AE 88 B8         [ 2]  379 	ldw	x, #0x88b8
      0081B5 13 05            [ 2]  380 	cpw	x, (0x05, sp)
      0081B7 4F               [ 1]  381 	clr	a
      0081B8 12 04            [ 1]  382 	sbc	a, (0x04, sp)
      0081BA 4F               [ 1]  383 	clr	a
      0081BB 12 03            [ 1]  384 	sbc	a, (0x03, sp)
      0081BD 2E 0A            [ 1]  385 	jrsge	00104$
                                    386 ;	main.c: 123: uart_write_str("VOLTAGE VALUE TOO HIGH\r\n");
      0081BF AE 8E 6B         [ 2]  387 	ldw	x, #___str_7+0
      0081C2 89               [ 2]  388 	pushw	x
      0081C3 CD 94 79         [ 4]  389 	call	_uart_write_str
      0081C6 85               [ 2]  390 	popw	x
                                    391 ;	main.c: 124: return;
      0081C7 20 31            [ 2]  392 	jra	00107$
      0081C9                        393 00104$:
                                    394 ;	main.c: 126: if (val < CAP_VMIN) {
      0081C9 1E 01            [ 2]  395 	ldw	x, (0x01, sp)
      0081CB A3 00 0A         [ 2]  396 	cpw	x, #0x000a
      0081CE 24 0A            [ 1]  397 	jrnc	00106$
                                    398 ;	main.c: 127: uart_write_str("VOLTAGE VALUE TOO LOW\r\n");
      0081D0 AE 8E 84         [ 2]  399 	ldw	x, #___str_8+0
      0081D3 89               [ 2]  400 	pushw	x
      0081D4 CD 94 79         [ 4]  401 	call	_uart_write_str
      0081D7 85               [ 2]  402 	popw	x
                                    403 ;	main.c: 128: return;
      0081D8 20 20            [ 2]  404 	jra	00107$
      0081DA                        405 00106$:
                                    406 ;	main.c: 131: uart_write_str("VOLTAGE: SET ");
      0081DA AE 8E 9C         [ 2]  407 	ldw	x, #___str_9+0
      0081DD 89               [ 2]  408 	pushw	x
      0081DE CD 94 79         [ 4]  409 	call	_uart_write_str
      0081E1 85               [ 2]  410 	popw	x
                                    411 ;	main.c: 132: uart_write_millivolt(val);
      0081E2 1E 01            [ 2]  412 	ldw	x, (0x01, sp)
      0081E4 89               [ 2]  413 	pushw	x
      0081E5 CD 96 24         [ 4]  414 	call	_uart_write_millivolt
      0081E8 85               [ 2]  415 	popw	x
                                    416 ;	main.c: 133: uart_write_str("\r\n");
      0081E9 AE 8D E7         [ 2]  417 	ldw	x, #___str_1+0
      0081EC 89               [ 2]  418 	pushw	x
      0081ED CD 94 79         [ 4]  419 	call	_uart_write_str
      0081F0 85               [ 2]  420 	popw	x
                                    421 ;	main.c: 134: cfg_output.vset = val;
      0081F1 AE 00 3F         [ 2]  422 	ldw	x, #_cfg_output+1
      0081F4 16 01            [ 2]  423 	ldw	y, (0x01, sp)
      0081F6 FF               [ 2]  424 	ldw	(x), y
                                    425 ;	main.c: 136: autocommit();
      0081F7 CD 81 16         [ 4]  426 	call	_autocommit
      0081FA                        427 00107$:
      0081FA 5B 06            [ 2]  428 	addw	sp, #6
      0081FC 81               [ 4]  429 	ret
                                    430 ;	main.c: 139: void set_current(uint8_t *s)
                                    431 ;	-----------------------------------------
                                    432 ;	 function set_current
                                    433 ;	-----------------------------------------
      0081FD                        434 _set_current:
                                    435 ;	main.c: 143: val = parse_millinum(s);
      0081FD 1E 03            [ 2]  436 	ldw	x, (0x03, sp)
      0081FF 89               [ 2]  437 	pushw	x
      008200 CD 9B 6F         [ 4]  438 	call	_parse_millinum
      008203 5B 02            [ 2]  439 	addw	sp, #2
                                    440 ;	main.c: 144: if (val == 0xFFFF)
      008205 A3 FF FF         [ 2]  441 	cpw	x, #0xffff
      008208 27 48            [ 1]  442 	jreq	00107$
                                    443 ;	main.c: 145: return;
      00820A 20 00            [ 2]  444 	jra	00102$
      00820C                        445 00102$:
                                    446 ;	main.c: 147: if (val > CAP_CMAX) {
      00820C A3 0B B8         [ 2]  447 	cpw	x, #0x0bb8
      00820F 23 0A            [ 2]  448 	jrule	00104$
                                    449 ;	main.c: 148: uart_write_str("CURRENT VALUE TOO HIGH\r\n");
      008211 AE 8E AA         [ 2]  450 	ldw	x, #___str_10+0
      008214 89               [ 2]  451 	pushw	x
      008215 CD 94 79         [ 4]  452 	call	_uart_write_str
      008218 85               [ 2]  453 	popw	x
                                    454 ;	main.c: 149: return;
      008219 20 37            [ 2]  455 	jra	00107$
      00821B                        456 00104$:
                                    457 ;	main.c: 151: if (val < CAP_CMIN) {
      00821B A3 00 01         [ 2]  458 	cpw	x, #0x0001
      00821E 24 0A            [ 1]  459 	jrnc	00106$
                                    460 ;	main.c: 152: uart_write_str("CURRENT VALUE TOO LOW\r\n");
      008220 AE 8E C3         [ 2]  461 	ldw	x, #___str_11+0
      008223 89               [ 2]  462 	pushw	x
      008224 CD 94 79         [ 4]  463 	call	_uart_write_str
      008227 85               [ 2]  464 	popw	x
                                    465 ;	main.c: 153: return;
      008228 20 28            [ 2]  466 	jra	00107$
      00822A                        467 00106$:
                                    468 ;	main.c: 156: uart_write_str("CURRENT: SET ");
      00822A 90 AE 8E DB      [ 2]  469 	ldw	y, #___str_12+0
      00822E 89               [ 2]  470 	pushw	x
      00822F 90 89            [ 2]  471 	pushw	y
      008231 CD 94 79         [ 4]  472 	call	_uart_write_str
      008234 85               [ 2]  473 	popw	x
      008235 85               [ 2]  474 	popw	x
                                    475 ;	main.c: 157: uart_write_milliamp(val);
      008236 89               [ 2]  476 	pushw	x
      008237 89               [ 2]  477 	pushw	x
      008238 CD 95 EF         [ 4]  478 	call	_uart_write_milliamp
      00823B 85               [ 2]  479 	popw	x
      00823C 85               [ 2]  480 	popw	x
                                    481 ;	main.c: 158: uart_write_str("\r\n");
      00823D 90 AE 8D E7      [ 2]  482 	ldw	y, #___str_1+0
      008241 89               [ 2]  483 	pushw	x
      008242 90 89            [ 2]  484 	pushw	y
      008244 CD 94 79         [ 4]  485 	call	_uart_write_str
      008247 85               [ 2]  486 	popw	x
      008248 85               [ 2]  487 	popw	x
                                    488 ;	main.c: 159: cfg_output.cset = val;
      008249 90 AE 00 41      [ 2]  489 	ldw	y, #_cfg_output+3
      00824D 90 FF            [ 2]  490 	ldw	(y), x
                                    491 ;	main.c: 161: autocommit();
      00824F CD 81 16         [ 4]  492 	call	_autocommit
      008252                        493 00107$:
      008252 81               [ 4]  494 	ret
                                    495 ;	main.c: 164: void set_autocommit(uint8_t *s)
                                    496 ;	-----------------------------------------
                                    497 ;	 function set_autocommit
                                    498 ;	-----------------------------------------
      008253                        499 _set_autocommit:
                                    500 ;	main.c: 166: if (strcmp(s, "1") == 0 || strcmp(s, "YES") == 0) {
      008253 AE 8E E9         [ 2]  501 	ldw	x, #___str_13+0
      008256 89               [ 2]  502 	pushw	x
      008257 1E 05            [ 2]  503 	ldw	x, (0x05, sp)
      008259 89               [ 2]  504 	pushw	x
      00825A CD 9E C2         [ 4]  505 	call	_strcmp
      00825D 5B 04            [ 2]  506 	addw	sp, #4
      00825F 5D               [ 2]  507 	tnzw	x
      008260 27 0F            [ 1]  508 	jreq	00105$
      008262 AE 8E EB         [ 2]  509 	ldw	x, #___str_14+0
      008265 89               [ 2]  510 	pushw	x
      008266 1E 05            [ 2]  511 	ldw	x, (0x05, sp)
      008268 89               [ 2]  512 	pushw	x
      008269 CD 9E C2         [ 4]  513 	call	_strcmp
      00826C 5B 04            [ 2]  514 	addw	sp, #4
      00826E 5D               [ 2]  515 	tnzw	x
      00826F 26 10            [ 1]  516 	jrne	00106$
      008271                        517 00105$:
                                    518 ;	main.c: 167: cfg_system.autocommit = 1;
      008271 AE 00 15         [ 2]  519 	ldw	x, #_cfg_system+20
      008274 A6 01            [ 1]  520 	ld	a, #0x01
      008276 F7               [ 1]  521 	ld	(x), a
                                    522 ;	main.c: 168: uart_write_str("AUTOCOMMIT: YES\r\n");
      008277 AE 8E EF         [ 2]  523 	ldw	x, #___str_15+0
      00827A 89               [ 2]  524 	pushw	x
      00827B CD 94 79         [ 4]  525 	call	_uart_write_str
      00827E 85               [ 2]  526 	popw	x
      00827F 20 43            [ 2]  527 	jra	00109$
      008281                        528 00106$:
                                    529 ;	main.c: 169: } else if (strcmp(s, "0") == 0 || strcmp(s, "NO") == 0) {
      008281 AE 8F 01         [ 2]  530 	ldw	x, #___str_16+0
      008284 89               [ 2]  531 	pushw	x
      008285 1E 05            [ 2]  532 	ldw	x, (0x05, sp)
      008287 89               [ 2]  533 	pushw	x
      008288 CD 9E C2         [ 4]  534 	call	_strcmp
      00828B 5B 04            [ 2]  535 	addw	sp, #4
      00828D 5D               [ 2]  536 	tnzw	x
      00828E 27 0F            [ 1]  537 	jreq	00101$
      008290 AE 8F 03         [ 2]  538 	ldw	x, #___str_17+0
      008293 89               [ 2]  539 	pushw	x
      008294 1E 05            [ 2]  540 	ldw	x, (0x05, sp)
      008296 89               [ 2]  541 	pushw	x
      008297 CD 9E C2         [ 4]  542 	call	_strcmp
      00829A 5B 04            [ 2]  543 	addw	sp, #4
      00829C 5D               [ 2]  544 	tnzw	x
      00829D 26 0E            [ 1]  545 	jrne	00102$
      00829F                        546 00101$:
                                    547 ;	main.c: 170: cfg_system.autocommit = 0;
      00829F AE 00 15         [ 2]  548 	ldw	x, #_cfg_system+20
      0082A2 7F               [ 1]  549 	clr	(x)
                                    550 ;	main.c: 171: uart_write_str("AUTOCOMMIT: NO\r\n");
      0082A3 AE 8F 06         [ 2]  551 	ldw	x, #___str_18+0
      0082A6 89               [ 2]  552 	pushw	x
      0082A7 CD 94 79         [ 4]  553 	call	_uart_write_str
      0082AA 85               [ 2]  554 	popw	x
      0082AB 20 17            [ 2]  555 	jra	00109$
      0082AD                        556 00102$:
                                    557 ;	main.c: 173: uart_write_str("UNKNOWN AUTOCOMMIT ARG: ");
      0082AD AE 8F 17         [ 2]  558 	ldw	x, #___str_19+0
      0082B0 89               [ 2]  559 	pushw	x
      0082B1 CD 94 79         [ 4]  560 	call	_uart_write_str
      0082B4 85               [ 2]  561 	popw	x
                                    562 ;	main.c: 174: uart_write_str(s);
      0082B5 1E 03            [ 2]  563 	ldw	x, (0x03, sp)
      0082B7 89               [ 2]  564 	pushw	x
      0082B8 CD 94 79         [ 4]  565 	call	_uart_write_str
      0082BB 85               [ 2]  566 	popw	x
                                    567 ;	main.c: 175: uart_write_str("\r\n");
      0082BC AE 8D E7         [ 2]  568 	ldw	x, #___str_1+0
      0082BF 89               [ 2]  569 	pushw	x
      0082C0 CD 94 79         [ 4]  570 	call	_uart_write_str
      0082C3 85               [ 2]  571 	popw	x
      0082C4                        572 00109$:
      0082C4 81               [ 4]  573 	ret
                                    574 ;	main.c: 179: void write_str(const char *prefix, const char *val)
                                    575 ;	-----------------------------------------
                                    576 ;	 function write_str
                                    577 ;	-----------------------------------------
      0082C5                        578 _write_str:
                                    579 ;	main.c: 181: uart_write_str(prefix);
      0082C5 1E 03            [ 2]  580 	ldw	x, (0x03, sp)
      0082C7 89               [ 2]  581 	pushw	x
      0082C8 CD 94 79         [ 4]  582 	call	_uart_write_str
      0082CB 85               [ 2]  583 	popw	x
                                    584 ;	main.c: 182: uart_write_str(val);
      0082CC 1E 05            [ 2]  585 	ldw	x, (0x05, sp)
      0082CE 89               [ 2]  586 	pushw	x
      0082CF CD 94 79         [ 4]  587 	call	_uart_write_str
      0082D2 85               [ 2]  588 	popw	x
                                    589 ;	main.c: 183: uart_write_str("\r\n");
      0082D3 AE 8D E7         [ 2]  590 	ldw	x, #___str_1+0
      0082D6 89               [ 2]  591 	pushw	x
      0082D7 CD 94 79         [ 4]  592 	call	_uart_write_str
      0082DA 85               [ 2]  593 	popw	x
      0082DB 81               [ 4]  594 	ret
                                    595 ;	main.c: 186: void write_onoff(const char *prefix, uint8_t on)
                                    596 ;	-----------------------------------------
                                    597 ;	 function write_onoff
                                    598 ;	-----------------------------------------
      0082DC                        599 _write_onoff:
                                    600 ;	main.c: 188: write_str(prefix, on ? "ON" : "OFF");
      0082DC 0D 05            [ 1]  601 	tnz	(0x05, sp)
      0082DE 27 05            [ 1]  602 	jreq	00103$
      0082E0 AE 8F 30         [ 2]  603 	ldw	x, #___str_20+0
      0082E3 20 03            [ 2]  604 	jra	00104$
      0082E5                        605 00103$:
      0082E5 AE 8F 33         [ 2]  606 	ldw	x, #___str_21+0
      0082E8                        607 00104$:
      0082E8 89               [ 2]  608 	pushw	x
      0082E9 1E 05            [ 2]  609 	ldw	x, (0x05, sp)
      0082EB 89               [ 2]  610 	pushw	x
      0082EC CD 82 C5         [ 4]  611 	call	_write_str
      0082EF 5B 04            [ 2]  612 	addw	sp, #4
      0082F1 81               [ 4]  613 	ret
                                    614 ;	main.c: 191: void write_millivolt(const char *prefix, uint16_t mv)
                                    615 ;	-----------------------------------------
                                    616 ;	 function write_millivolt
                                    617 ;	-----------------------------------------
      0082F2                        618 _write_millivolt:
                                    619 ;	main.c: 193: uart_write_str(prefix);
      0082F2 1E 03            [ 2]  620 	ldw	x, (0x03, sp)
      0082F4 89               [ 2]  621 	pushw	x
      0082F5 CD 94 79         [ 4]  622 	call	_uart_write_str
      0082F8 85               [ 2]  623 	popw	x
                                    624 ;	main.c: 194: uart_write_millivolt(mv);
      0082F9 1E 05            [ 2]  625 	ldw	x, (0x05, sp)
      0082FB 89               [ 2]  626 	pushw	x
      0082FC CD 96 24         [ 4]  627 	call	_uart_write_millivolt
      0082FF 85               [ 2]  628 	popw	x
                                    629 ;	main.c: 195: uart_write_str("\r\n");
      008300 AE 8D E7         [ 2]  630 	ldw	x, #___str_1+0
      008303 89               [ 2]  631 	pushw	x
      008304 CD 94 79         [ 4]  632 	call	_uart_write_str
      008307 85               [ 2]  633 	popw	x
      008308 81               [ 4]  634 	ret
                                    635 ;	main.c: 198: void write_milliamp(const char *prefix, uint16_t ma)
                                    636 ;	-----------------------------------------
                                    637 ;	 function write_milliamp
                                    638 ;	-----------------------------------------
      008309                        639 _write_milliamp:
                                    640 ;	main.c: 200: uart_write_str(prefix);
      008309 1E 03            [ 2]  641 	ldw	x, (0x03, sp)
      00830B 89               [ 2]  642 	pushw	x
      00830C CD 94 79         [ 4]  643 	call	_uart_write_str
      00830F 85               [ 2]  644 	popw	x
                                    645 ;	main.c: 201: uart_write_milliamp(ma);
      008310 1E 05            [ 2]  646 	ldw	x, (0x05, sp)
      008312 89               [ 2]  647 	pushw	x
      008313 CD 95 EF         [ 4]  648 	call	_uart_write_milliamp
      008316 85               [ 2]  649 	popw	x
                                    650 ;	main.c: 202: uart_write_str("\r\n");
      008317 AE 8D E7         [ 2]  651 	ldw	x, #___str_1+0
      00831A 89               [ 2]  652 	pushw	x
      00831B CD 94 79         [ 4]  653 	call	_uart_write_str
      00831E 85               [ 2]  654 	popw	x
      00831F 81               [ 4]  655 	ret
                                    656 ;	main.c: 205: void write_int(const char *prefix, uint16_t val)
                                    657 ;	-----------------------------------------
                                    658 ;	 function write_int
                                    659 ;	-----------------------------------------
      008320                        660 _write_int:
                                    661 ;	main.c: 207: uart_write_str(prefix);
      008320 1E 03            [ 2]  662 	ldw	x, (0x03, sp)
      008322 89               [ 2]  663 	pushw	x
      008323 CD 94 79         [ 4]  664 	call	_uart_write_str
      008326 85               [ 2]  665 	popw	x
                                    666 ;	main.c: 208: uart_write_int(val);
      008327 1E 05            [ 2]  667 	ldw	x, (0x05, sp)
      008329 89               [ 2]  668 	pushw	x
      00832A CD 95 2E         [ 4]  669 	call	_uart_write_int
      00832D 85               [ 2]  670 	popw	x
                                    671 ;	main.c: 209: uart_write_str("\r\n");
      00832E AE 8D E7         [ 2]  672 	ldw	x, #___str_1+0
      008331 89               [ 2]  673 	pushw	x
      008332 CD 94 79         [ 4]  674 	call	_uart_write_str
      008335 85               [ 2]  675 	popw	x
      008336 81               [ 4]  676 	ret
                                    677 ;	main.c: 212: uint32_t _parse_uint(uint8_t *s)
                                    678 ;	-----------------------------------------
                                    679 ;	 function _parse_uint
                                    680 ;	-----------------------------------------
      008337                        681 __parse_uint:
      008337 52 0A            [ 2]  682 	sub	sp, #10
                                    683 ;	main.c: 214: uint32_t val = 0;
      008339 5F               [ 1]  684 	clrw	x
      00833A 1F 03            [ 2]  685 	ldw	(0x03, sp), x
      00833C 90 5F            [ 1]  686 	clrw	y
                                    687 ;	main.c: 225: return val;
      00833E 1E 0D            [ 2]  688 	ldw	x, (0x0d, sp)
      008340 1F 05            [ 2]  689 	ldw	(0x05, sp), x
      008342                        690 00107$:
                                    691 ;	main.c: 216: for (; *s; s++) {
      008342 1E 05            [ 2]  692 	ldw	x, (0x05, sp)
      008344 F6               [ 1]  693 	ld	a, (x)
      008345 4D               [ 1]  694 	tnz	a
      008346 27 4D            [ 1]  695 	jreq	00105$
                                    696 ;	main.c: 217: uint8_t ch = *s;
                                    697 ;	main.c: 218: if (ch >= '0' && ch <= '9') {
      008348 A1 30            [ 1]  698 	cp	a, #0x30
      00834A 25 39            [ 1]  699 	jrc	00102$
      00834C A1 39            [ 1]  700 	cp	a, #0x39
      00834E 22 35            [ 1]  701 	jrugt	00102$
                                    702 ;	main.c: 219: val = val*10 + (ch-'0');
      008350 88               [ 1]  703 	push	a
      008351 1E 04            [ 2]  704 	ldw	x, (0x04, sp)
      008353 89               [ 2]  705 	pushw	x
      008354 90 89            [ 2]  706 	pushw	y
      008356 4B 0A            [ 1]  707 	push	#0x0a
      008358 5F               [ 1]  708 	clrw	x
      008359 89               [ 2]  709 	pushw	x
      00835A 4B 00            [ 1]  710 	push	#0x00
      00835C CD 9F 09         [ 4]  711 	call	__mullong
      00835F 5B 08            [ 2]  712 	addw	sp, #8
      008361 1F 0A            [ 2]  713 	ldw	(0x0a, sp), x
      008363 17 08            [ 2]  714 	ldw	(0x08, sp), y
      008365 84               [ 1]  715 	pop	a
      008366 5F               [ 1]  716 	clrw	x
      008367 97               [ 1]  717 	ld	xl, a
      008368 1D 00 30         [ 2]  718 	subw	x, #0x0030
      00836B 9E               [ 1]  719 	ld	a, xh
      00836C 90 5F            [ 1]  720 	clrw	y
      00836E 4D               [ 1]  721 	tnz	a
      00836F 2A 02            [ 1]  722 	jrpl	00130$
      008371 90 5A            [ 2]  723 	decw	y
      008373                        724 00130$:
      008373 95               [ 1]  725 	ld	xh, a
      008374 72 FB 09         [ 2]  726 	addw	x, (0x09, sp)
      008377 90 9F            [ 1]  727 	ld	a, yl
      008379 19 08            [ 1]  728 	adc	a, (0x08, sp)
      00837B 90 02            [ 1]  729 	rlwa	y
      00837D 19 07            [ 1]  730 	adc	a, (0x07, sp)
      00837F 90 95            [ 1]  731 	ld	yh, a
      008381 1F 03            [ 2]  732 	ldw	(0x03, sp), x
      008383 20 09            [ 2]  733 	jra	00108$
      008385                        734 00102$:
                                    735 ;	main.c: 221: return 0xFFFFFFFF;
      008385 AE FF FF         [ 2]  736 	ldw	x, #0xffff
      008388 90 AE FF FF      [ 2]  737 	ldw	y, #0xffff
      00838C 20 09            [ 2]  738 	jra	00109$
      00838E                        739 00108$:
                                    740 ;	main.c: 216: for (; *s; s++) {
      00838E 1E 05            [ 2]  741 	ldw	x, (0x05, sp)
      008390 5C               [ 2]  742 	incw	x
      008391 1F 05            [ 2]  743 	ldw	(0x05, sp), x
      008393 20 AD            [ 2]  744 	jra	00107$
      008395                        745 00105$:
                                    746 ;	main.c: 225: return val;
      008395 1E 03            [ 2]  747 	ldw	x, (0x03, sp)
      008397                        748 00109$:
      008397 5B 0A            [ 2]  749 	addw	sp, #10
      008399 81               [ 4]  750 	ret
                                    751 ;	main.c: 228: void parse_uint(const char *name, uint32_t *pval, uint8_t *s)
                                    752 ;	-----------------------------------------
                                    753 ;	 function parse_uint
                                    754 ;	-----------------------------------------
      00839A                        755 _parse_uint:
      00839A 52 04            [ 2]  756 	sub	sp, #4
                                    757 ;	main.c: 230: uint32_t val = _parse_uint(s);
      00839C 1E 0B            [ 2]  758 	ldw	x, (0x0b, sp)
      00839E 89               [ 2]  759 	pushw	x
      00839F CD 83 37         [ 4]  760 	call	__parse_uint
      0083A2 5B 02            [ 2]  761 	addw	sp, #2
      0083A4 1F 03            [ 2]  762 	ldw	(0x03, sp), x
                                    763 ;	main.c: 231: if (val == 0xFFFFFFFF) {
      0083A6 1E 03            [ 2]  764 	ldw	x, (0x03, sp)
      0083A8 A3 FF FF         [ 2]  765 	cpw	x, #0xffff
      0083AB 26 26            [ 1]  766 	jrne	00102$
      0083AD 90 A3 FF FF      [ 2]  767 	cpw	y, #0xffff
      0083B1 26 20            [ 1]  768 	jrne	00102$
                                    769 ;	main.c: 232: uart_write_str("FAILED TO PARSE ");
      0083B3 AE 8F 37         [ 2]  770 	ldw	x, #___str_22+0
      0083B6 89               [ 2]  771 	pushw	x
      0083B7 CD 94 79         [ 4]  772 	call	_uart_write_str
      0083BA 85               [ 2]  773 	popw	x
                                    774 ;	main.c: 233: uart_write_str(s);
      0083BB 1E 0B            [ 2]  775 	ldw	x, (0x0b, sp)
      0083BD 89               [ 2]  776 	pushw	x
      0083BE CD 94 79         [ 4]  777 	call	_uart_write_str
      0083C1 85               [ 2]  778 	popw	x
                                    779 ;	main.c: 234: uart_write_str(" FOR ");
      0083C2 AE 8F 48         [ 2]  780 	ldw	x, #___str_23+0
      0083C5 89               [ 2]  781 	pushw	x
      0083C6 CD 94 79         [ 4]  782 	call	_uart_write_str
      0083C9 85               [ 2]  783 	popw	x
                                    784 ;	main.c: 235: uart_write_str(name);
      0083CA 1E 07            [ 2]  785 	ldw	x, (0x07, sp)
      0083CC 89               [ 2]  786 	pushw	x
      0083CD CD 94 79         [ 4]  787 	call	_uart_write_str
      0083D0 85               [ 2]  788 	popw	x
      0083D1 20 1A            [ 2]  789 	jra	00103$
      0083D3                        790 00102$:
                                    791 ;	main.c: 237: *pval = val;
      0083D3 1E 09            [ 2]  792 	ldw	x, (0x09, sp)
      0083D5 7B 04            [ 1]  793 	ld	a, (0x04, sp)
      0083D7 E7 03            [ 1]  794 	ld	(0x3, x), a
      0083D9 7B 03            [ 1]  795 	ld	a, (0x03, sp)
      0083DB E7 02            [ 1]  796 	ld	(0x2, x), a
      0083DD FF               [ 2]  797 	ldw	(x), y
                                    798 ;	main.c: 238: uart_write_str("CALIBRATION SET ");
      0083DE AE 8F 4E         [ 2]  799 	ldw	x, #___str_24+0
      0083E1 89               [ 2]  800 	pushw	x
      0083E2 CD 94 79         [ 4]  801 	call	_uart_write_str
      0083E5 85               [ 2]  802 	popw	x
                                    803 ;	main.c: 239: uart_write_str(name);
      0083E6 1E 07            [ 2]  804 	ldw	x, (0x07, sp)
      0083E8 89               [ 2]  805 	pushw	x
      0083E9 CD 94 79         [ 4]  806 	call	_uart_write_str
      0083EC 85               [ 2]  807 	popw	x
      0083ED                        808 00103$:
                                    809 ;	main.c: 241: uart_write_str("\r\n");
      0083ED AE 8D E7         [ 2]  810 	ldw	x, #___str_1+0
      0083F0 89               [ 2]  811 	pushw	x
      0083F1 CD 94 79         [ 4]  812 	call	_uart_write_str
      0083F4 5B 06            [ 2]  813 	addw	sp, #6
      0083F6 81               [ 4]  814 	ret
                                    815 ;	main.c: 244: void process_input()
                                    816 ;	-----------------------------------------
                                    817 ;	 function process_input
                                    818 ;	-----------------------------------------
      0083F7                        819 _process_input:
      0083F7 52 1D            [ 2]  820 	sub	sp, #29
                                    821 ;	main.c: 247: uart_read_buf[uart_read_len-1] = 0;
      0083F9 AE 01 62         [ 2]  822 	ldw	x, #_uart_read_buf+0
      0083FC 1F 06            [ 2]  823 	ldw	(0x06, sp), x
      0083FE C6 01 A2         [ 1]  824 	ld	a, _uart_read_len+0
      008401 4A               [ 1]  825 	dec	a
      008402 5F               [ 1]  826 	clrw	x
      008403 97               [ 1]  827 	ld	xl, a
      008404 72 FB 06         [ 2]  828 	addw	x, (0x06, sp)
      008407 7F               [ 1]  829 	clr	(x)
                                    830 ;	main.c: 249: if (strcmp(uart_read_buf, "MODEL") == 0) {
      008408 AE 8F 5F         [ 2]  831 	ldw	x, #___str_25+0
      00840B 16 06            [ 2]  832 	ldw	y, (0x06, sp)
      00840D 89               [ 2]  833 	pushw	x
      00840E 90 89            [ 2]  834 	pushw	y
      008410 CD 9E C2         [ 4]  835 	call	_strcmp
      008413 5B 04            [ 2]  836 	addw	sp, #4
      008415 1F 0A            [ 2]  837 	ldw	(0x0a, sp), x
      008417 1E 0A            [ 2]  838 	ldw	x, (0x0a, sp)
      008419 26 0B            [ 1]  839 	jrne	00183$
                                    840 ;	main.c: 250: uart_write_str("MODEL: " MODEL "\r\n");
      00841B AE 8F 65         [ 2]  841 	ldw	x, #___str_26+0
      00841E 89               [ 2]  842 	pushw	x
      00841F CD 94 79         [ 4]  843 	call	_uart_write_str
      008422 85               [ 2]  844 	popw	x
      008423 CC 8B 8D         [ 2]  845 	jp	00184$
      008426                        846 00183$:
                                    847 ;	main.c: 251: } else if (strcmp(uart_read_buf, "VERSION") == 0) {
      008426 AE 8F 74         [ 2]  848 	ldw	x, #___str_27+0
      008429 16 06            [ 2]  849 	ldw	y, (0x06, sp)
      00842B 89               [ 2]  850 	pushw	x
      00842C 90 89            [ 2]  851 	pushw	y
      00842E CD 9E C2         [ 4]  852 	call	_strcmp
      008431 5B 04            [ 2]  853 	addw	sp, #4
      008433 5D               [ 2]  854 	tnzw	x
      008434 26 0B            [ 1]  855 	jrne	00180$
                                    856 ;	main.c: 252: uart_write_str("VERSION: " FW_VERSION "\r\n");
      008436 AE 8F 7C         [ 2]  857 	ldw	x, #___str_28+0
      008439 89               [ 2]  858 	pushw	x
      00843A CD 94 79         [ 4]  859 	call	_uart_write_str
      00843D 85               [ 2]  860 	popw	x
      00843E CC 8B 8D         [ 2]  861 	jp	00184$
      008441                        862 00180$:
                                    863 ;	main.c: 253: } else if (strcmp(uart_read_buf, "SYSTEM") == 0) {
      008441 AE 8F 8D         [ 2]  864 	ldw	x, #___str_29+0
      008444 16 06            [ 2]  865 	ldw	y, (0x06, sp)
      008446 89               [ 2]  866 	pushw	x
      008447 90 89            [ 2]  867 	pushw	y
      008449 CD 9E C2         [ 4]  868 	call	_strcmp
      00844C 5B 04            [ 2]  869 	addw	sp, #4
      00844E 5D               [ 2]  870 	tnzw	x
      00844F 26 3B            [ 1]  871 	jrne	00177$
                                    872 ;	main.c: 254: uart_write_str("MODEL: " MODEL "\r\n" "VERSION: " FW_VERSION "\r\n");
      008451 AE 8F 94         [ 2]  873 	ldw	x, #___str_30+0
      008454 89               [ 2]  874 	pushw	x
      008455 CD 94 79         [ 4]  875 	call	_uart_write_str
      008458 85               [ 2]  876 	popw	x
                                    877 ;	main.c: 256: write_str("NAME: ", cfg_system.name);
      008459 AE 00 01         [ 2]  878 	ldw	x, #_cfg_system+0
      00845C 1F 0C            [ 2]  879 	ldw	(0x0c, sp), x
      00845E 1E 0C            [ 2]  880 	ldw	x, (0x0c, sp)
      008460 5C               [ 2]  881 	incw	x
      008461 90 AE 8F B3      [ 2]  882 	ldw	y, #___str_31+0
      008465 89               [ 2]  883 	pushw	x
      008466 90 89            [ 2]  884 	pushw	y
      008468 CD 82 C5         [ 4]  885 	call	_write_str
      00846B 5B 04            [ 2]  886 	addw	sp, #4
                                    887 ;	main.c: 257: write_onoff("ONSTARTUP: ", cfg_system.default_on);
      00846D 1E 0C            [ 2]  888 	ldw	x, (0x0c, sp)
      00846F E6 12            [ 1]  889 	ld	a, (0x12, x)
      008471 AE 8F BA         [ 2]  890 	ldw	x, #___str_32+0
      008474 88               [ 1]  891 	push	a
      008475 89               [ 2]  892 	pushw	x
      008476 CD 82 DC         [ 4]  893 	call	_write_onoff
      008479 5B 03            [ 2]  894 	addw	sp, #3
                                    895 ;	main.c: 258: write_onoff("AUTOCOMMIT: ", cfg_system.autocommit);
      00847B 1E 0C            [ 2]  896 	ldw	x, (0x0c, sp)
      00847D E6 14            [ 1]  897 	ld	a, (0x14, x)
      00847F AE 8F C6         [ 2]  898 	ldw	x, #___str_33+0
      008482 88               [ 1]  899 	push	a
      008483 89               [ 2]  900 	pushw	x
      008484 CD 82 DC         [ 4]  901 	call	_write_onoff
      008487 5B 03            [ 2]  902 	addw	sp, #3
      008489 CC 8B 8D         [ 2]  903 	jp	00184$
      00848C                        904 00177$:
                                    905 ;	main.c: 259: } else if (strcmp(uart_read_buf, "CALIBRATION") == 0) {
      00848C AE 8F D3         [ 2]  906 	ldw	x, #___str_34+0
      00848F 16 06            [ 2]  907 	ldw	y, (0x06, sp)
      008491 89               [ 2]  908 	pushw	x
      008492 90 89            [ 2]  909 	pushw	y
      008494 CD 9E C2         [ 4]  910 	call	_strcmp
      008497 5B 04            [ 2]  911 	addw	sp, #4
      008499 5D               [ 2]  912 	tnzw	x
      00849A 27 03            [ 1]  913 	jreq	00325$
      00849C CC 85 BF         [ 2]  914 	jp	00174$
      00849F                        915 00325$:
                                    916 ;	main.c: 260: uart_write_str("CALIBRATE VIN ADC: ");
      00849F AE 8F DF         [ 2]  917 	ldw	x, #___str_35+0
      0084A2 89               [ 2]  918 	pushw	x
      0084A3 CD 94 79         [ 4]  919 	call	_uart_write_str
      0084A6 85               [ 2]  920 	popw	x
                                    921 ;	main.c: 261: uart_write_fixed_point(cfg_system.vin_adc.a);
      0084A7 AE 00 01         [ 2]  922 	ldw	x, #_cfg_system+0
      0084AA 1F 10            [ 2]  923 	ldw	(0x10, sp), x
      0084AC 1E 10            [ 2]  924 	ldw	x, (0x10, sp)
      0084AE 89               [ 2]  925 	pushw	x
      0084AF EE 17            [ 2]  926 	ldw	x, (0x17, x)
      0084B1 51               [ 1]  927 	exgw	x, y
      0084B2 85               [ 2]  928 	popw	x
      0084B3 EE 15            [ 2]  929 	ldw	x, (0x15, x)
      0084B5 90 89            [ 2]  930 	pushw	y
      0084B7 89               [ 2]  931 	pushw	x
      0084B8 CD 96 59         [ 4]  932 	call	_uart_write_fixed_point
      0084BB 5B 04            [ 2]  933 	addw	sp, #4
                                    934 ;	main.c: 262: uart_write_ch('/');
      0084BD 4B 2F            [ 1]  935 	push	#0x2f
      0084BF CD 94 5A         [ 4]  936 	call	_uart_write_ch
      0084C2 84               [ 1]  937 	pop	a
                                    938 ;	main.c: 263: uart_write_fixed_point(cfg_system.vin_adc.b);
      0084C3 1E 10            [ 2]  939 	ldw	x, (0x10, sp)
      0084C5 89               [ 2]  940 	pushw	x
      0084C6 EE 1B            [ 2]  941 	ldw	x, (0x1b, x)
      0084C8 51               [ 1]  942 	exgw	x, y
      0084C9 85               [ 2]  943 	popw	x
      0084CA EE 19            [ 2]  944 	ldw	x, (0x19, x)
      0084CC 90 89            [ 2]  945 	pushw	y
      0084CE 89               [ 2]  946 	pushw	x
      0084CF CD 96 59         [ 4]  947 	call	_uart_write_fixed_point
      0084D2 5B 04            [ 2]  948 	addw	sp, #4
                                    949 ;	main.c: 264: uart_write_str("\r\n");
      0084D4 AE 8D E7         [ 2]  950 	ldw	x, #___str_1+0
      0084D7 1F 18            [ 2]  951 	ldw	(0x18, sp), x
      0084D9 1E 18            [ 2]  952 	ldw	x, (0x18, sp)
      0084DB 89               [ 2]  953 	pushw	x
      0084DC CD 94 79         [ 4]  954 	call	_uart_write_str
      0084DF 85               [ 2]  955 	popw	x
                                    956 ;	main.c: 265: uart_write_str("CALIBRATE VOUT ADC: ");
      0084E0 AE 8F F3         [ 2]  957 	ldw	x, #___str_36+0
      0084E3 89               [ 2]  958 	pushw	x
      0084E4 CD 94 79         [ 4]  959 	call	_uart_write_str
      0084E7 85               [ 2]  960 	popw	x
                                    961 ;	main.c: 266: uart_write_fixed_point(cfg_system.vout_adc.a);
      0084E8 1E 10            [ 2]  962 	ldw	x, (0x10, sp)
      0084EA 89               [ 2]  963 	pushw	x
      0084EB EE 1F            [ 2]  964 	ldw	x, (0x1f, x)
      0084ED 51               [ 1]  965 	exgw	x, y
      0084EE 85               [ 2]  966 	popw	x
      0084EF EE 1D            [ 2]  967 	ldw	x, (0x1d, x)
      0084F1 90 89            [ 2]  968 	pushw	y
      0084F3 89               [ 2]  969 	pushw	x
      0084F4 CD 96 59         [ 4]  970 	call	_uart_write_fixed_point
      0084F7 5B 04            [ 2]  971 	addw	sp, #4
                                    972 ;	main.c: 267: uart_write_ch('/');
      0084F9 4B 2F            [ 1]  973 	push	#0x2f
      0084FB CD 94 5A         [ 4]  974 	call	_uart_write_ch
      0084FE 84               [ 1]  975 	pop	a
                                    976 ;	main.c: 268: uart_write_fixed_point(cfg_system.vout_adc.b);
      0084FF 1E 10            [ 2]  977 	ldw	x, (0x10, sp)
      008501 89               [ 2]  978 	pushw	x
      008502 EE 23            [ 2]  979 	ldw	x, (0x23, x)
      008504 51               [ 1]  980 	exgw	x, y
      008505 85               [ 2]  981 	popw	x
      008506 EE 21            [ 2]  982 	ldw	x, (0x21, x)
      008508 90 89            [ 2]  983 	pushw	y
      00850A 89               [ 2]  984 	pushw	x
      00850B CD 96 59         [ 4]  985 	call	_uart_write_fixed_point
      00850E 5B 04            [ 2]  986 	addw	sp, #4
                                    987 ;	main.c: 269: uart_write_str("\r\n");
      008510 1E 18            [ 2]  988 	ldw	x, (0x18, sp)
      008512 89               [ 2]  989 	pushw	x
      008513 CD 94 79         [ 4]  990 	call	_uart_write_str
      008516 85               [ 2]  991 	popw	x
                                    992 ;	main.c: 270: uart_write_str("CALIBRATE COUT ADC: ");
      008517 AE 90 08         [ 2]  993 	ldw	x, #___str_37+0
      00851A 89               [ 2]  994 	pushw	x
      00851B CD 94 79         [ 4]  995 	call	_uart_write_str
      00851E 85               [ 2]  996 	popw	x
                                    997 ;	main.c: 271: uart_write_fixed_point(cfg_system.cout_adc.a);
      00851F 1E 10            [ 2]  998 	ldw	x, (0x10, sp)
      008521 89               [ 2]  999 	pushw	x
      008522 EE 27            [ 2] 1000 	ldw	x, (0x27, x)
      008524 51               [ 1] 1001 	exgw	x, y
      008525 85               [ 2] 1002 	popw	x
      008526 EE 25            [ 2] 1003 	ldw	x, (0x25, x)
      008528 90 89            [ 2] 1004 	pushw	y
      00852A 89               [ 2] 1005 	pushw	x
      00852B CD 96 59         [ 4] 1006 	call	_uart_write_fixed_point
      00852E 5B 04            [ 2] 1007 	addw	sp, #4
                                   1008 ;	main.c: 272: uart_write_ch('/');
      008530 4B 2F            [ 1] 1009 	push	#0x2f
      008532 CD 94 5A         [ 4] 1010 	call	_uart_write_ch
      008535 84               [ 1] 1011 	pop	a
                                   1012 ;	main.c: 273: uart_write_fixed_point(cfg_system.cout_adc.b);
      008536 1E 10            [ 2] 1013 	ldw	x, (0x10, sp)
      008538 89               [ 2] 1014 	pushw	x
      008539 EE 2B            [ 2] 1015 	ldw	x, (0x2b, x)
      00853B 51               [ 1] 1016 	exgw	x, y
      00853C 85               [ 2] 1017 	popw	x
      00853D EE 29            [ 2] 1018 	ldw	x, (0x29, x)
      00853F 90 89            [ 2] 1019 	pushw	y
      008541 89               [ 2] 1020 	pushw	x
      008542 CD 96 59         [ 4] 1021 	call	_uart_write_fixed_point
      008545 5B 04            [ 2] 1022 	addw	sp, #4
                                   1023 ;	main.c: 274: uart_write_str("\r\n");
      008547 1E 18            [ 2] 1024 	ldw	x, (0x18, sp)
      008549 89               [ 2] 1025 	pushw	x
      00854A CD 94 79         [ 4] 1026 	call	_uart_write_str
      00854D 85               [ 2] 1027 	popw	x
                                   1028 ;	main.c: 275: uart_write_str("CALIBRATE VOUT PWM: ");
      00854E AE 90 1D         [ 2] 1029 	ldw	x, #___str_38+0
      008551 89               [ 2] 1030 	pushw	x
      008552 CD 94 79         [ 4] 1031 	call	_uart_write_str
      008555 85               [ 2] 1032 	popw	x
                                   1033 ;	main.c: 276: uart_write_fixed_point(cfg_system.vout_pwm.a);
      008556 1E 10            [ 2] 1034 	ldw	x, (0x10, sp)
      008558 89               [ 2] 1035 	pushw	x
      008559 EE 2F            [ 2] 1036 	ldw	x, (0x2f, x)
      00855B 51               [ 1] 1037 	exgw	x, y
      00855C 85               [ 2] 1038 	popw	x
      00855D EE 2D            [ 2] 1039 	ldw	x, (0x2d, x)
      00855F 90 89            [ 2] 1040 	pushw	y
      008561 89               [ 2] 1041 	pushw	x
      008562 CD 96 59         [ 4] 1042 	call	_uart_write_fixed_point
      008565 5B 04            [ 2] 1043 	addw	sp, #4
                                   1044 ;	main.c: 277: uart_write_ch('/');
      008567 4B 2F            [ 1] 1045 	push	#0x2f
      008569 CD 94 5A         [ 4] 1046 	call	_uart_write_ch
      00856C 84               [ 1] 1047 	pop	a
                                   1048 ;	main.c: 278: uart_write_fixed_point(cfg_system.vout_pwm.b);
      00856D 1E 10            [ 2] 1049 	ldw	x, (0x10, sp)
      00856F 89               [ 2] 1050 	pushw	x
      008570 EE 33            [ 2] 1051 	ldw	x, (0x33, x)
      008572 51               [ 1] 1052 	exgw	x, y
      008573 85               [ 2] 1053 	popw	x
      008574 EE 31            [ 2] 1054 	ldw	x, (0x31, x)
      008576 90 89            [ 2] 1055 	pushw	y
      008578 89               [ 2] 1056 	pushw	x
      008579 CD 96 59         [ 4] 1057 	call	_uart_write_fixed_point
      00857C 5B 04            [ 2] 1058 	addw	sp, #4
                                   1059 ;	main.c: 279: uart_write_str("\r\n");
      00857E 1E 18            [ 2] 1060 	ldw	x, (0x18, sp)
      008580 89               [ 2] 1061 	pushw	x
      008581 CD 94 79         [ 4] 1062 	call	_uart_write_str
      008584 85               [ 2] 1063 	popw	x
                                   1064 ;	main.c: 280: uart_write_str("CALIBRATE COUT PWM: ");
      008585 AE 90 32         [ 2] 1065 	ldw	x, #___str_39+0
      008588 89               [ 2] 1066 	pushw	x
      008589 CD 94 79         [ 4] 1067 	call	_uart_write_str
      00858C 85               [ 2] 1068 	popw	x
                                   1069 ;	main.c: 281: uart_write_fixed_point(cfg_system.cout_pwm.a);
      00858D 1E 10            [ 2] 1070 	ldw	x, (0x10, sp)
      00858F 89               [ 2] 1071 	pushw	x
      008590 EE 37            [ 2] 1072 	ldw	x, (0x37, x)
      008592 51               [ 1] 1073 	exgw	x, y
      008593 85               [ 2] 1074 	popw	x
      008594 EE 35            [ 2] 1075 	ldw	x, (0x35, x)
      008596 90 89            [ 2] 1076 	pushw	y
      008598 89               [ 2] 1077 	pushw	x
      008599 CD 96 59         [ 4] 1078 	call	_uart_write_fixed_point
      00859C 5B 04            [ 2] 1079 	addw	sp, #4
                                   1080 ;	main.c: 282: uart_write_ch('/');
      00859E 4B 2F            [ 1] 1081 	push	#0x2f
      0085A0 CD 94 5A         [ 4] 1082 	call	_uart_write_ch
      0085A3 84               [ 1] 1083 	pop	a
                                   1084 ;	main.c: 283: uart_write_fixed_point(cfg_system.cout_pwm.b);
      0085A4 1E 10            [ 2] 1085 	ldw	x, (0x10, sp)
      0085A6 89               [ 2] 1086 	pushw	x
      0085A7 EE 3B            [ 2] 1087 	ldw	x, (0x3b, x)
      0085A9 51               [ 1] 1088 	exgw	x, y
      0085AA 85               [ 2] 1089 	popw	x
      0085AB EE 39            [ 2] 1090 	ldw	x, (0x39, x)
      0085AD 90 89            [ 2] 1091 	pushw	y
      0085AF 89               [ 2] 1092 	pushw	x
      0085B0 CD 96 59         [ 4] 1093 	call	_uart_write_fixed_point
      0085B3 5B 04            [ 2] 1094 	addw	sp, #4
                                   1095 ;	main.c: 284: uart_write_str("\r\n");
      0085B5 1E 18            [ 2] 1096 	ldw	x, (0x18, sp)
      0085B7 89               [ 2] 1097 	pushw	x
      0085B8 CD 94 79         [ 4] 1098 	call	_uart_write_str
      0085BB 85               [ 2] 1099 	popw	x
      0085BC CC 8B 8D         [ 2] 1100 	jp	00184$
      0085BF                       1101 00174$:
                                   1102 ;	main.c: 285: } else if (strcmp(uart_read_buf, "RCALIBRATION") == 0) {
      0085BF AE 90 47         [ 2] 1103 	ldw	x, #___str_40+0
      0085C2 16 06            [ 2] 1104 	ldw	y, (0x06, sp)
      0085C4 89               [ 2] 1105 	pushw	x
      0085C5 90 89            [ 2] 1106 	pushw	y
      0085C7 CD 9E C2         [ 4] 1107 	call	_strcmp
      0085CA 5B 04            [ 2] 1108 	addw	sp, #4
      0085CC 5D               [ 2] 1109 	tnzw	x
      0085CD 27 03            [ 1] 1110 	jreq	00326$
      0085CF CC 86 F1         [ 2] 1111 	jp	00171$
      0085D2                       1112 00326$:
                                   1113 ;	main.c: 286: uart_write_str("CALIBRATE VIN ADC: ");
      0085D2 AE 8F DF         [ 2] 1114 	ldw	x, #___str_35+0
      0085D5 89               [ 2] 1115 	pushw	x
      0085D6 CD 94 79         [ 4] 1116 	call	_uart_write_str
      0085D9 85               [ 2] 1117 	popw	x
                                   1118 ;	main.c: 287: uart_write_int32(cfg_system.vin_adc.a);
      0085DA AE 00 01         [ 2] 1119 	ldw	x, #_cfg_system+0
      0085DD 1F 1C            [ 2] 1120 	ldw	(0x1c, sp), x
      0085DF 1E 1C            [ 2] 1121 	ldw	x, (0x1c, sp)
      0085E1 89               [ 2] 1122 	pushw	x
      0085E2 EE 17            [ 2] 1123 	ldw	x, (0x17, x)
      0085E4 51               [ 1] 1124 	exgw	x, y
      0085E5 85               [ 2] 1125 	popw	x
      0085E6 EE 15            [ 2] 1126 	ldw	x, (0x15, x)
      0085E8 90 89            [ 2] 1127 	pushw	y
      0085EA 89               [ 2] 1128 	pushw	x
      0085EB CD 95 C2         [ 4] 1129 	call	_uart_write_int32
      0085EE 5B 04            [ 2] 1130 	addw	sp, #4
                                   1131 ;	main.c: 288: uart_write_ch('/');
      0085F0 4B 2F            [ 1] 1132 	push	#0x2f
      0085F2 CD 94 5A         [ 4] 1133 	call	_uart_write_ch
      0085F5 84               [ 1] 1134 	pop	a
                                   1135 ;	main.c: 289: uart_write_int32(cfg_system.vin_adc.b);
      0085F6 1E 1C            [ 2] 1136 	ldw	x, (0x1c, sp)
      0085F8 89               [ 2] 1137 	pushw	x
      0085F9 EE 1B            [ 2] 1138 	ldw	x, (0x1b, x)
      0085FB 51               [ 1] 1139 	exgw	x, y
      0085FC 85               [ 2] 1140 	popw	x
      0085FD EE 19            [ 2] 1141 	ldw	x, (0x19, x)
      0085FF 90 89            [ 2] 1142 	pushw	y
      008601 89               [ 2] 1143 	pushw	x
      008602 CD 95 C2         [ 4] 1144 	call	_uart_write_int32
      008605 5B 04            [ 2] 1145 	addw	sp, #4
                                   1146 ;	main.c: 290: uart_write_str("\r\n");
      008607 AE 8D E7         [ 2] 1147 	ldw	x, #___str_1+0
      00860A 1F 08            [ 2] 1148 	ldw	(0x08, sp), x
      00860C 1E 08            [ 2] 1149 	ldw	x, (0x08, sp)
      00860E 89               [ 2] 1150 	pushw	x
      00860F CD 94 79         [ 4] 1151 	call	_uart_write_str
      008612 85               [ 2] 1152 	popw	x
                                   1153 ;	main.c: 291: uart_write_str("CALIBRATE VOUT ADC: ");
      008613 AE 8F F3         [ 2] 1154 	ldw	x, #___str_36+0
      008616 89               [ 2] 1155 	pushw	x
      008617 CD 94 79         [ 4] 1156 	call	_uart_write_str
      00861A 85               [ 2] 1157 	popw	x
                                   1158 ;	main.c: 292: uart_write_int32(cfg_system.vout_adc.a);
      00861B 1E 1C            [ 2] 1159 	ldw	x, (0x1c, sp)
      00861D 89               [ 2] 1160 	pushw	x
      00861E EE 1F            [ 2] 1161 	ldw	x, (0x1f, x)
      008620 51               [ 1] 1162 	exgw	x, y
      008621 85               [ 2] 1163 	popw	x
      008622 EE 1D            [ 2] 1164 	ldw	x, (0x1d, x)
      008624 90 89            [ 2] 1165 	pushw	y
      008626 89               [ 2] 1166 	pushw	x
      008627 CD 95 C2         [ 4] 1167 	call	_uart_write_int32
      00862A 5B 04            [ 2] 1168 	addw	sp, #4
                                   1169 ;	main.c: 293: uart_write_ch('/');
      00862C 4B 2F            [ 1] 1170 	push	#0x2f
      00862E CD 94 5A         [ 4] 1171 	call	_uart_write_ch
      008631 84               [ 1] 1172 	pop	a
                                   1173 ;	main.c: 294: uart_write_int32(cfg_system.vout_adc.b);
      008632 1E 1C            [ 2] 1174 	ldw	x, (0x1c, sp)
      008634 89               [ 2] 1175 	pushw	x
      008635 EE 23            [ 2] 1176 	ldw	x, (0x23, x)
      008637 51               [ 1] 1177 	exgw	x, y
      008638 85               [ 2] 1178 	popw	x
      008639 EE 21            [ 2] 1179 	ldw	x, (0x21, x)
      00863B 90 89            [ 2] 1180 	pushw	y
      00863D 89               [ 2] 1181 	pushw	x
      00863E CD 95 C2         [ 4] 1182 	call	_uart_write_int32
      008641 5B 04            [ 2] 1183 	addw	sp, #4
                                   1184 ;	main.c: 295: uart_write_str("\r\n");
      008643 1E 08            [ 2] 1185 	ldw	x, (0x08, sp)
      008645 89               [ 2] 1186 	pushw	x
      008646 CD 94 79         [ 4] 1187 	call	_uart_write_str
      008649 85               [ 2] 1188 	popw	x
                                   1189 ;	main.c: 296: uart_write_str("CALIBRATE COUT ADC: ");
      00864A AE 90 08         [ 2] 1190 	ldw	x, #___str_37+0
      00864D 89               [ 2] 1191 	pushw	x
      00864E CD 94 79         [ 4] 1192 	call	_uart_write_str
      008651 85               [ 2] 1193 	popw	x
                                   1194 ;	main.c: 297: uart_write_int32(cfg_system.cout_adc.a);
      008652 1E 1C            [ 2] 1195 	ldw	x, (0x1c, sp)
      008654 89               [ 2] 1196 	pushw	x
      008655 EE 27            [ 2] 1197 	ldw	x, (0x27, x)
      008657 51               [ 1] 1198 	exgw	x, y
      008658 85               [ 2] 1199 	popw	x
      008659 EE 25            [ 2] 1200 	ldw	x, (0x25, x)
      00865B 90 89            [ 2] 1201 	pushw	y
      00865D 89               [ 2] 1202 	pushw	x
      00865E CD 95 C2         [ 4] 1203 	call	_uart_write_int32
      008661 5B 04            [ 2] 1204 	addw	sp, #4
                                   1205 ;	main.c: 298: uart_write_ch('/');
      008663 4B 2F            [ 1] 1206 	push	#0x2f
      008665 CD 94 5A         [ 4] 1207 	call	_uart_write_ch
      008668 84               [ 1] 1208 	pop	a
                                   1209 ;	main.c: 299: uart_write_int32(cfg_system.cout_adc.b);
      008669 1E 1C            [ 2] 1210 	ldw	x, (0x1c, sp)
      00866B 89               [ 2] 1211 	pushw	x
      00866C EE 2B            [ 2] 1212 	ldw	x, (0x2b, x)
      00866E 51               [ 1] 1213 	exgw	x, y
      00866F 85               [ 2] 1214 	popw	x
      008670 EE 29            [ 2] 1215 	ldw	x, (0x29, x)
      008672 90 89            [ 2] 1216 	pushw	y
      008674 89               [ 2] 1217 	pushw	x
      008675 CD 95 C2         [ 4] 1218 	call	_uart_write_int32
      008678 5B 04            [ 2] 1219 	addw	sp, #4
                                   1220 ;	main.c: 300: uart_write_str("\r\n");
      00867A 1E 08            [ 2] 1221 	ldw	x, (0x08, sp)
      00867C 89               [ 2] 1222 	pushw	x
      00867D CD 94 79         [ 4] 1223 	call	_uart_write_str
      008680 85               [ 2] 1224 	popw	x
                                   1225 ;	main.c: 301: uart_write_str("CALIBRATE VOUT PWM: ");
      008681 AE 90 1D         [ 2] 1226 	ldw	x, #___str_38+0
      008684 89               [ 2] 1227 	pushw	x
      008685 CD 94 79         [ 4] 1228 	call	_uart_write_str
      008688 85               [ 2] 1229 	popw	x
                                   1230 ;	main.c: 302: uart_write_int32(cfg_system.vout_pwm.a);
      008689 1E 1C            [ 2] 1231 	ldw	x, (0x1c, sp)
      00868B 89               [ 2] 1232 	pushw	x
      00868C EE 2F            [ 2] 1233 	ldw	x, (0x2f, x)
      00868E 51               [ 1] 1234 	exgw	x, y
      00868F 85               [ 2] 1235 	popw	x
      008690 EE 2D            [ 2] 1236 	ldw	x, (0x2d, x)
      008692 90 89            [ 2] 1237 	pushw	y
      008694 89               [ 2] 1238 	pushw	x
      008695 CD 95 C2         [ 4] 1239 	call	_uart_write_int32
      008698 5B 04            [ 2] 1240 	addw	sp, #4
                                   1241 ;	main.c: 303: uart_write_ch('/');
      00869A 4B 2F            [ 1] 1242 	push	#0x2f
      00869C CD 94 5A         [ 4] 1243 	call	_uart_write_ch
      00869F 84               [ 1] 1244 	pop	a
                                   1245 ;	main.c: 304: uart_write_int32(cfg_system.vout_pwm.b);
      0086A0 1E 1C            [ 2] 1246 	ldw	x, (0x1c, sp)
      0086A2 89               [ 2] 1247 	pushw	x
      0086A3 EE 33            [ 2] 1248 	ldw	x, (0x33, x)
      0086A5 51               [ 1] 1249 	exgw	x, y
      0086A6 85               [ 2] 1250 	popw	x
      0086A7 EE 31            [ 2] 1251 	ldw	x, (0x31, x)
      0086A9 90 89            [ 2] 1252 	pushw	y
      0086AB 89               [ 2] 1253 	pushw	x
      0086AC CD 95 C2         [ 4] 1254 	call	_uart_write_int32
      0086AF 5B 04            [ 2] 1255 	addw	sp, #4
                                   1256 ;	main.c: 305: uart_write_str("\r\n");
      0086B1 1E 08            [ 2] 1257 	ldw	x, (0x08, sp)
      0086B3 89               [ 2] 1258 	pushw	x
      0086B4 CD 94 79         [ 4] 1259 	call	_uart_write_str
      0086B7 85               [ 2] 1260 	popw	x
                                   1261 ;	main.c: 306: uart_write_str("CALIBRATE COUT PWM: ");
      0086B8 AE 90 32         [ 2] 1262 	ldw	x, #___str_39+0
      0086BB 89               [ 2] 1263 	pushw	x
      0086BC CD 94 79         [ 4] 1264 	call	_uart_write_str
      0086BF 85               [ 2] 1265 	popw	x
                                   1266 ;	main.c: 307: uart_write_int32(cfg_system.cout_pwm.a);
      0086C0 1E 1C            [ 2] 1267 	ldw	x, (0x1c, sp)
      0086C2 89               [ 2] 1268 	pushw	x
      0086C3 EE 37            [ 2] 1269 	ldw	x, (0x37, x)
      0086C5 51               [ 1] 1270 	exgw	x, y
      0086C6 85               [ 2] 1271 	popw	x
      0086C7 EE 35            [ 2] 1272 	ldw	x, (0x35, x)
      0086C9 90 89            [ 2] 1273 	pushw	y
      0086CB 89               [ 2] 1274 	pushw	x
      0086CC CD 95 C2         [ 4] 1275 	call	_uart_write_int32
      0086CF 5B 04            [ 2] 1276 	addw	sp, #4
                                   1277 ;	main.c: 308: uart_write_ch('/');
      0086D1 4B 2F            [ 1] 1278 	push	#0x2f
      0086D3 CD 94 5A         [ 4] 1279 	call	_uart_write_ch
      0086D6 84               [ 1] 1280 	pop	a
                                   1281 ;	main.c: 309: uart_write_int32(cfg_system.cout_pwm.b);
      0086D7 1E 1C            [ 2] 1282 	ldw	x, (0x1c, sp)
      0086D9 89               [ 2] 1283 	pushw	x
      0086DA EE 3B            [ 2] 1284 	ldw	x, (0x3b, x)
      0086DC 51               [ 1] 1285 	exgw	x, y
      0086DD 85               [ 2] 1286 	popw	x
      0086DE EE 39            [ 2] 1287 	ldw	x, (0x39, x)
      0086E0 90 89            [ 2] 1288 	pushw	y
      0086E2 89               [ 2] 1289 	pushw	x
      0086E3 CD 95 C2         [ 4] 1290 	call	_uart_write_int32
      0086E6 5B 04            [ 2] 1291 	addw	sp, #4
                                   1292 ;	main.c: 310: uart_write_ch('\r');
      0086E8 4B 0D            [ 1] 1293 	push	#0x0d
      0086EA CD 94 5A         [ 4] 1294 	call	_uart_write_ch
      0086ED 84               [ 1] 1295 	pop	a
      0086EE CC 8B 8D         [ 2] 1296 	jp	00184$
      0086F1                       1297 00171$:
                                   1298 ;	main.c: 311: } else if (strcmp(uart_read_buf, "LIMITS") == 0) {
      0086F1 AE 90 54         [ 2] 1299 	ldw	x, #___str_41+0
      0086F4 16 06            [ 2] 1300 	ldw	y, (0x06, sp)
      0086F6 89               [ 2] 1301 	pushw	x
      0086F7 90 89            [ 2] 1302 	pushw	y
      0086F9 CD 9E C2         [ 4] 1303 	call	_strcmp
      0086FC 5B 04            [ 2] 1304 	addw	sp, #4
      0086FE 5D               [ 2] 1305 	tnzw	x
      0086FF 26 59            [ 1] 1306 	jrne	00168$
                                   1307 ;	main.c: 312: uart_write_str("LIMITS:\r\n");
      008701 AE 90 5B         [ 2] 1308 	ldw	x, #___str_42+0
      008704 89               [ 2] 1309 	pushw	x
      008705 CD 94 79         [ 4] 1310 	call	_uart_write_str
      008708 85               [ 2] 1311 	popw	x
                                   1312 ;	main.c: 313: write_millivolt("VMIN: ", CAP_VMIN);
      008709 AE 90 65         [ 2] 1313 	ldw	x, #___str_43+0
      00870C 4B 0A            [ 1] 1314 	push	#0x0a
      00870E 4B 00            [ 1] 1315 	push	#0x00
      008710 89               [ 2] 1316 	pushw	x
      008711 CD 82 F2         [ 4] 1317 	call	_write_millivolt
      008714 5B 04            [ 2] 1318 	addw	sp, #4
                                   1319 ;	main.c: 314: write_millivolt("VMAX: ", CAP_VMAX);
      008716 AE 90 6C         [ 2] 1320 	ldw	x, #___str_44+0
      008719 4B B8            [ 1] 1321 	push	#0xb8
      00871B 4B 88            [ 1] 1322 	push	#0x88
      00871D 89               [ 2] 1323 	pushw	x
      00871E CD 82 F2         [ 4] 1324 	call	_write_millivolt
      008721 5B 04            [ 2] 1325 	addw	sp, #4
                                   1326 ;	main.c: 315: write_millivolt("VSTEP: ", CAP_VSTEP);
      008723 AE 90 73         [ 2] 1327 	ldw	x, #___str_45+0
      008726 4B 0A            [ 1] 1328 	push	#0x0a
      008728 4B 00            [ 1] 1329 	push	#0x00
      00872A 89               [ 2] 1330 	pushw	x
      00872B CD 82 F2         [ 4] 1331 	call	_write_millivolt
      00872E 5B 04            [ 2] 1332 	addw	sp, #4
                                   1333 ;	main.c: 316: write_milliamp("CMIN: ", CAP_CMIN);
      008730 AE 90 7B         [ 2] 1334 	ldw	x, #___str_46+0
      008733 4B 01            [ 1] 1335 	push	#0x01
      008735 4B 00            [ 1] 1336 	push	#0x00
      008737 89               [ 2] 1337 	pushw	x
      008738 CD 83 09         [ 4] 1338 	call	_write_milliamp
      00873B 5B 04            [ 2] 1339 	addw	sp, #4
                                   1340 ;	main.c: 317: write_milliamp("CMAX: ", CAP_CMAX);
      00873D AE 90 82         [ 2] 1341 	ldw	x, #___str_47+0
      008740 4B B8            [ 1] 1342 	push	#0xb8
      008742 4B 0B            [ 1] 1343 	push	#0x0b
      008744 89               [ 2] 1344 	pushw	x
      008745 CD 83 09         [ 4] 1345 	call	_write_milliamp
      008748 5B 04            [ 2] 1346 	addw	sp, #4
                                   1347 ;	main.c: 318: write_milliamp("CSTEP: ", CAP_CSTEP);
      00874A AE 90 89         [ 2] 1348 	ldw	x, #___str_48+0
      00874D 4B 01            [ 1] 1349 	push	#0x01
      00874F 4B 00            [ 1] 1350 	push	#0x00
      008751 89               [ 2] 1351 	pushw	x
      008752 CD 83 09         [ 4] 1352 	call	_write_milliamp
      008755 5B 04            [ 2] 1353 	addw	sp, #4
      008757 CC 8B 8D         [ 2] 1354 	jp	00184$
      00875A                       1355 00168$:
                                   1356 ;	main.c: 319: } else if (strcmp(uart_read_buf, "CONFIG") == 0) {
      00875A AE 90 91         [ 2] 1357 	ldw	x, #___str_49+0
      00875D 16 06            [ 2] 1358 	ldw	y, (0x06, sp)
      00875F 89               [ 2] 1359 	pushw	x
      008760 90 89            [ 2] 1360 	pushw	y
      008762 CD 9E C2         [ 4] 1361 	call	_strcmp
      008765 5B 04            [ 2] 1362 	addw	sp, #4
      008767 5D               [ 2] 1363 	tnzw	x
      008768 26 5E            [ 1] 1364 	jrne	00165$
                                   1365 ;	main.c: 320: uart_write_str("CONFIG:\r\n");
      00876A AE 90 98         [ 2] 1366 	ldw	x, #___str_50+0
      00876D 89               [ 2] 1367 	pushw	x
      00876E CD 94 79         [ 4] 1368 	call	_uart_write_str
      008771 85               [ 2] 1369 	popw	x
                                   1370 ;	main.c: 321: write_onoff("OUTPUT: ", cfg_system.output);
      008772 AE 00 14         [ 2] 1371 	ldw	x, #_cfg_system+19
      008775 F6               [ 1] 1372 	ld	a, (x)
      008776 AE 90 A2         [ 2] 1373 	ldw	x, #___str_51+0
      008779 88               [ 1] 1374 	push	a
      00877A 89               [ 2] 1375 	pushw	x
      00877B CD 82 DC         [ 4] 1376 	call	_write_onoff
      00877E 5B 03            [ 2] 1377 	addw	sp, #3
                                   1378 ;	main.c: 322: write_millivolt("VSET: ", cfg_output.vset);
      008780 AE 00 3E         [ 2] 1379 	ldw	x, #_cfg_output+0
      008783 1F 16            [ 2] 1380 	ldw	(0x16, sp), x
      008785 1E 16            [ 2] 1381 	ldw	x, (0x16, sp)
      008787 EE 01            [ 2] 1382 	ldw	x, (0x1, x)
      008789 90 AE 90 AB      [ 2] 1383 	ldw	y, #___str_52+0
      00878D 89               [ 2] 1384 	pushw	x
      00878E 90 89            [ 2] 1385 	pushw	y
      008790 CD 82 F2         [ 4] 1386 	call	_write_millivolt
      008793 5B 04            [ 2] 1387 	addw	sp, #4
                                   1388 ;	main.c: 323: write_milliamp("CSET: ", cfg_output.cset);
      008795 1E 16            [ 2] 1389 	ldw	x, (0x16, sp)
      008797 EE 03            [ 2] 1390 	ldw	x, (0x3, x)
      008799 90 AE 90 B2      [ 2] 1391 	ldw	y, #___str_53+0
      00879D 89               [ 2] 1392 	pushw	x
      00879E 90 89            [ 2] 1393 	pushw	y
      0087A0 CD 83 09         [ 4] 1394 	call	_write_milliamp
      0087A3 5B 04            [ 2] 1395 	addw	sp, #4
                                   1396 ;	main.c: 324: write_millivolt("VSHUTDOWN: ", cfg_output.vshutdown);
      0087A5 1E 16            [ 2] 1397 	ldw	x, (0x16, sp)
      0087A7 EE 05            [ 2] 1398 	ldw	x, (0x5, x)
      0087A9 90 AE 90 B9      [ 2] 1399 	ldw	y, #___str_54+0
      0087AD 89               [ 2] 1400 	pushw	x
      0087AE 90 89            [ 2] 1401 	pushw	y
      0087B0 CD 82 F2         [ 4] 1402 	call	_write_millivolt
      0087B3 5B 04            [ 2] 1403 	addw	sp, #4
                                   1404 ;	main.c: 325: write_millivolt("CSHUTDOWN: ", cfg_output.cshutdown);
      0087B5 1E 16            [ 2] 1405 	ldw	x, (0x16, sp)
      0087B7 EE 07            [ 2] 1406 	ldw	x, (0x7, x)
      0087B9 90 AE 90 C5      [ 2] 1407 	ldw	y, #___str_55+0
      0087BD 89               [ 2] 1408 	pushw	x
      0087BE 90 89            [ 2] 1409 	pushw	y
      0087C0 CD 82 F2         [ 4] 1410 	call	_write_millivolt
      0087C3 5B 04            [ 2] 1411 	addw	sp, #4
      0087C5 CC 8B 8D         [ 2] 1412 	jp	00184$
      0087C8                       1413 00165$:
                                   1414 ;	main.c: 326: } else if (strcmp(uart_read_buf, "STATUS") == 0) {
      0087C8 AE 90 D1         [ 2] 1415 	ldw	x, #___str_56+0
      0087CB 16 06            [ 2] 1416 	ldw	y, (0x06, sp)
      0087CD 89               [ 2] 1417 	pushw	x
      0087CE 90 89            [ 2] 1418 	pushw	y
      0087D0 CD 9E C2         [ 4] 1419 	call	_strcmp
      0087D3 5B 04            [ 2] 1420 	addw	sp, #4
      0087D5 5D               [ 2] 1421 	tnzw	x
      0087D6 26 6C            [ 1] 1422 	jrne	00162$
                                   1423 ;	main.c: 327: uart_write_str("STATUS:\r\n");
      0087D8 AE 90 D8         [ 2] 1424 	ldw	x, #___str_57+0
      0087DB 89               [ 2] 1425 	pushw	x
      0087DC CD 94 79         [ 4] 1426 	call	_uart_write_str
      0087DF 85               [ 2] 1427 	popw	x
                                   1428 ;	main.c: 328: write_onoff("OUTPUT: ", cfg_system.output);
      0087E0 AE 00 14         [ 2] 1429 	ldw	x, #_cfg_system+19
      0087E3 F6               [ 1] 1430 	ld	a, (x)
      0087E4 AE 90 A2         [ 2] 1431 	ldw	x, #___str_51+0
      0087E7 88               [ 1] 1432 	push	a
      0087E8 89               [ 2] 1433 	pushw	x
      0087E9 CD 82 DC         [ 4] 1434 	call	_write_onoff
      0087EC 5B 03            [ 2] 1435 	addw	sp, #3
                                   1436 ;	main.c: 329: write_millivolt("VIN: ", state.vin);
      0087EE AE 00 47         [ 2] 1437 	ldw	x, #_state+0
      0087F1 1F 1A            [ 2] 1438 	ldw	(0x1a, sp), x
      0087F3 1E 1A            [ 2] 1439 	ldw	x, (0x1a, sp)
      0087F5 EE 06            [ 2] 1440 	ldw	x, (0x6, x)
      0087F7 90 AE 90 E2      [ 2] 1441 	ldw	y, #___str_58+0
      0087FB 89               [ 2] 1442 	pushw	x
      0087FC 90 89            [ 2] 1443 	pushw	y
      0087FE CD 82 F2         [ 4] 1444 	call	_write_millivolt
      008801 5B 04            [ 2] 1445 	addw	sp, #4
                                   1446 ;	main.c: 330: write_millivolt("VOUT: ", state.vout);
      008803 1E 1A            [ 2] 1447 	ldw	x, (0x1a, sp)
      008805 EE 08            [ 2] 1448 	ldw	x, (0x8, x)
      008807 90 AE 90 E8      [ 2] 1449 	ldw	y, #___str_59+0
      00880B 89               [ 2] 1450 	pushw	x
      00880C 90 89            [ 2] 1451 	pushw	y
      00880E CD 82 F2         [ 4] 1452 	call	_write_millivolt
      008811 5B 04            [ 2] 1453 	addw	sp, #4
                                   1454 ;	main.c: 331: write_milliamp("COUT: ", state.cout);
      008813 1E 1A            [ 2] 1455 	ldw	x, (0x1a, sp)
      008815 EE 0A            [ 2] 1456 	ldw	x, (0xa, x)
      008817 90 AE 90 EF      [ 2] 1457 	ldw	y, #___str_60+0
      00881B 89               [ 2] 1458 	pushw	x
      00881C 90 89            [ 2] 1459 	pushw	y
      00881E CD 83 09         [ 4] 1460 	call	_write_milliamp
      008821 5B 04            [ 2] 1461 	addw	sp, #4
                                   1462 ;	main.c: 332: write_str("CONSTANT: ", state.constant_current ? "CURRENT" : "VOLTAGE");
      008823 1E 1A            [ 2] 1463 	ldw	x, (0x1a, sp)
      008825 E6 0C            [ 1] 1464 	ld	a, (0xc, x)
      008827 6B 05            [ 1] 1465 	ld	(0x05, sp), a
      008829 0D 05            [ 1] 1466 	tnz	(0x05, sp)
      00882B 27 05            [ 1] 1467 	jreq	00190$
      00882D AE 91 01         [ 2] 1468 	ldw	x, #___str_62+0
      008830 20 03            [ 2] 1469 	jra	00191$
      008832                       1470 00190$:
      008832 AE 91 09         [ 2] 1471 	ldw	x, #___str_63+0
      008835                       1472 00191$:
      008835 90 AE 90 F6      [ 2] 1473 	ldw	y, #___str_61+0
      008839 89               [ 2] 1474 	pushw	x
      00883A 90 89            [ 2] 1475 	pushw	y
      00883C CD 82 C5         [ 4] 1476 	call	_write_str
      00883F 5B 04            [ 2] 1477 	addw	sp, #4
      008841 CC 8B 8D         [ 2] 1478 	jp	00184$
      008844                       1479 00162$:
                                   1480 ;	main.c: 333: } else if (strcmp(uart_read_buf, "RSTATUS") == 0) {
      008844 AE 91 11         [ 2] 1481 	ldw	x, #___str_64+0
      008847 16 06            [ 2] 1482 	ldw	y, (0x06, sp)
      008849 89               [ 2] 1483 	pushw	x
      00884A 90 89            [ 2] 1484 	pushw	y
      00884C CD 9E C2         [ 4] 1485 	call	_strcmp
      00884F 5B 04            [ 2] 1486 	addw	sp, #4
      008851 5D               [ 2] 1487 	tnzw	x
      008852 27 03            [ 1] 1488 	jreq	00331$
      008854 CC 88 F3         [ 2] 1489 	jp	00159$
      008857                       1490 00331$:
                                   1491 ;	main.c: 334: uart_write_str("RSTATUS:\r\n");
      008857 AE 91 19         [ 2] 1492 	ldw	x, #___str_65+0
      00885A 89               [ 2] 1493 	pushw	x
      00885B CD 94 79         [ 4] 1494 	call	_uart_write_str
      00885E 85               [ 2] 1495 	popw	x
                                   1496 ;	main.c: 335: write_onoff("OUTPUT: ", cfg_system.output);
      00885F AE 00 14         [ 2] 1497 	ldw	x, #_cfg_system+19
      008862 F6               [ 1] 1498 	ld	a, (x)
      008863 AE 90 A2         [ 2] 1499 	ldw	x, #___str_51+0
      008866 88               [ 1] 1500 	push	a
      008867 89               [ 2] 1501 	pushw	x
      008868 CD 82 DC         [ 4] 1502 	call	_write_onoff
      00886B 5B 03            [ 2] 1503 	addw	sp, #3
                                   1504 ;	main.c: 336: write_int("VIN ADC: ", state.vin_raw);
      00886D AE 00 47         [ 2] 1505 	ldw	x, #_state+0
      008870 FE               [ 2] 1506 	ldw	x, (x)
      008871 90 AE 91 24      [ 2] 1507 	ldw	y, #___str_66+0
      008875 89               [ 2] 1508 	pushw	x
      008876 90 89            [ 2] 1509 	pushw	y
      008878 CD 83 20         [ 4] 1510 	call	_write_int
      00887B 5B 04            [ 2] 1511 	addw	sp, #4
                                   1512 ;	main.c: 337: write_millivolt("VIN: ", state.vin);
      00887D AE 00 47         [ 2] 1513 	ldw	x, #_state+0
      008880 1F 03            [ 2] 1514 	ldw	(0x03, sp), x
      008882 1E 03            [ 2] 1515 	ldw	x, (0x03, sp)
      008884 EE 06            [ 2] 1516 	ldw	x, (0x6, x)
      008886 90 AE 90 E2      [ 2] 1517 	ldw	y, #___str_58+0
      00888A 89               [ 2] 1518 	pushw	x
      00888B 90 89            [ 2] 1519 	pushw	y
      00888D CD 82 F2         [ 4] 1520 	call	_write_millivolt
      008890 5B 04            [ 2] 1521 	addw	sp, #4
                                   1522 ;	main.c: 338: write_int("VOUT ADC: ", state.vout_raw);
      008892 1E 03            [ 2] 1523 	ldw	x, (0x03, sp)
      008894 EE 02            [ 2] 1524 	ldw	x, (0x2, x)
      008896 90 AE 91 2E      [ 2] 1525 	ldw	y, #___str_67+0
      00889A 89               [ 2] 1526 	pushw	x
      00889B 90 89            [ 2] 1527 	pushw	y
      00889D CD 83 20         [ 4] 1528 	call	_write_int
      0088A0 5B 04            [ 2] 1529 	addw	sp, #4
                                   1530 ;	main.c: 339: write_millivolt("VOUT: ", state.vout);
      0088A2 1E 03            [ 2] 1531 	ldw	x, (0x03, sp)
      0088A4 EE 08            [ 2] 1532 	ldw	x, (0x8, x)
      0088A6 90 AE 90 E8      [ 2] 1533 	ldw	y, #___str_59+0
      0088AA 89               [ 2] 1534 	pushw	x
      0088AB 90 89            [ 2] 1535 	pushw	y
      0088AD CD 82 F2         [ 4] 1536 	call	_write_millivolt
      0088B0 5B 04            [ 2] 1537 	addw	sp, #4
                                   1538 ;	main.c: 340: write_int("COUT ADC: ", state.cout_raw);
      0088B2 1E 03            [ 2] 1539 	ldw	x, (0x03, sp)
      0088B4 EE 04            [ 2] 1540 	ldw	x, (0x4, x)
      0088B6 90 AE 91 39      [ 2] 1541 	ldw	y, #___str_68+0
      0088BA 89               [ 2] 1542 	pushw	x
      0088BB 90 89            [ 2] 1543 	pushw	y
      0088BD CD 83 20         [ 4] 1544 	call	_write_int
      0088C0 5B 04            [ 2] 1545 	addw	sp, #4
                                   1546 ;	main.c: 341: write_milliamp("COUT: ", state.cout);
      0088C2 1E 03            [ 2] 1547 	ldw	x, (0x03, sp)
      0088C4 EE 0A            [ 2] 1548 	ldw	x, (0xa, x)
      0088C6 90 AE 90 EF      [ 2] 1549 	ldw	y, #___str_60+0
      0088CA 89               [ 2] 1550 	pushw	x
      0088CB 90 89            [ 2] 1551 	pushw	y
      0088CD CD 83 09         [ 4] 1552 	call	_write_milliamp
      0088D0 5B 04            [ 2] 1553 	addw	sp, #4
                                   1554 ;	main.c: 342: write_str("CONSTANT: ", state.constant_current ? "CURRENT" : "VOLTAGE");
      0088D2 1E 03            [ 2] 1555 	ldw	x, (0x03, sp)
      0088D4 E6 0C            [ 1] 1556 	ld	a, (0xc, x)
      0088D6 6B 0E            [ 1] 1557 	ld	(0x0e, sp), a
      0088D8 0D 0E            [ 1] 1558 	tnz	(0x0e, sp)
      0088DA 27 05            [ 1] 1559 	jreq	00192$
      0088DC AE 91 01         [ 2] 1560 	ldw	x, #___str_62+0
      0088DF 20 03            [ 2] 1561 	jra	00193$
      0088E1                       1562 00192$:
      0088E1 AE 91 09         [ 2] 1563 	ldw	x, #___str_63+0
      0088E4                       1564 00193$:
      0088E4 90 AE 90 F6      [ 2] 1565 	ldw	y, #___str_61+0
      0088E8 89               [ 2] 1566 	pushw	x
      0088E9 90 89            [ 2] 1567 	pushw	y
      0088EB CD 82 C5         [ 4] 1568 	call	_write_str
      0088EE 5B 04            [ 2] 1569 	addw	sp, #4
      0088F0 CC 8B 8D         [ 2] 1570 	jp	00184$
      0088F3                       1571 00159$:
                                   1572 ;	main.c: 343: } else if (strcmp(uart_read_buf, "COMMIT") == 0) {
      0088F3 AE 91 44         [ 2] 1573 	ldw	x, #___str_69+0
      0088F6 16 06            [ 2] 1574 	ldw	y, (0x06, sp)
      0088F8 89               [ 2] 1575 	pushw	x
      0088F9 90 89            [ 2] 1576 	pushw	y
      0088FB CD 9E C2         [ 4] 1577 	call	_strcmp
      0088FE 5B 04            [ 2] 1578 	addw	sp, #4
      008900 5D               [ 2] 1579 	tnzw	x
      008901 26 06            [ 1] 1580 	jrne	00156$
                                   1581 ;	main.c: 344: commit_output();
      008903 CD 80 A0         [ 4] 1582 	call	_commit_output
      008906 CC 8B 8D         [ 2] 1583 	jp	00184$
      008909                       1584 00156$:
                                   1585 ;	main.c: 345: } else if (strcmp(uart_read_buf, "SAVE") == 0) {
      008909 AE 91 4B         [ 2] 1586 	ldw	x, #___str_70+0
      00890C 16 06            [ 2] 1587 	ldw	y, (0x06, sp)
      00890E 89               [ 2] 1588 	pushw	x
      00890F 90 89            [ 2] 1589 	pushw	y
      008911 CD 9E C2         [ 4] 1590 	call	_strcmp
      008914 5B 04            [ 2] 1591 	addw	sp, #4
      008916 5D               [ 2] 1592 	tnzw	x
      008917 26 1B            [ 1] 1593 	jrne	00153$
                                   1594 ;	main.c: 346: config_save_system(&cfg_system);
      008919 AE 00 01         [ 2] 1595 	ldw	x, #_cfg_system+0
      00891C 89               [ 2] 1596 	pushw	x
      00891D CD 9A 88         [ 4] 1597 	call	_config_save_system
      008920 85               [ 2] 1598 	popw	x
                                   1599 ;	main.c: 347: config_save_output(&cfg_output);
      008921 AE 00 3E         [ 2] 1600 	ldw	x, #_cfg_output+0
      008924 89               [ 2] 1601 	pushw	x
      008925 CD 9A DE         [ 4] 1602 	call	_config_save_output
      008928 85               [ 2] 1603 	popw	x
                                   1604 ;	main.c: 348: uart_write_str("SAVED\r\n");
      008929 AE 91 50         [ 2] 1605 	ldw	x, #___str_71+0
      00892C 89               [ 2] 1606 	pushw	x
      00892D CD 94 79         [ 4] 1607 	call	_uart_write_str
      008930 85               [ 2] 1608 	popw	x
      008931 CC 8B 8D         [ 2] 1609 	jp	00184$
      008934                       1610 00153$:
                                   1611 ;	main.c: 349: } else if (strcmp(uart_read_buf, "LOAD") == 0) {
      008934 AE 91 58         [ 2] 1612 	ldw	x, #___str_72+0
      008937 16 06            [ 2] 1613 	ldw	y, (0x06, sp)
      008939 89               [ 2] 1614 	pushw	x
      00893A 90 89            [ 2] 1615 	pushw	y
      00893C CD 9E C2         [ 4] 1616 	call	_strcmp
      00893F 5B 04            [ 2] 1617 	addw	sp, #4
      008941 5D               [ 2] 1618 	tnzw	x
      008942 26 16            [ 1] 1619 	jrne	00150$
                                   1620 ;	main.c: 350: config_load_system(&cfg_system);
      008944 AE 00 01         [ 2] 1621 	ldw	x, #_cfg_system+0
      008947 89               [ 2] 1622 	pushw	x
      008948 CD 9A 06         [ 4] 1623 	call	_config_load_system
      00894B 85               [ 2] 1624 	popw	x
                                   1625 ;	main.c: 351: config_load_output(&cfg_output);
      00894C AE 00 3E         [ 2] 1626 	ldw	x, #_cfg_output+0
      00894F 89               [ 2] 1627 	pushw	x
      008950 CD 9A A9         [ 4] 1628 	call	_config_load_output
      008953 85               [ 2] 1629 	popw	x
                                   1630 ;	main.c: 352: autocommit();
      008954 CD 81 16         [ 4] 1631 	call	_autocommit
      008957 CC 8B 8D         [ 2] 1632 	jp	00184$
      00895A                       1633 00150$:
                                   1634 ;	main.c: 353: } else if (strcmp(uart_read_buf, "RESTORE") == 0) {
      00895A AE 91 5D         [ 2] 1635 	ldw	x, #___str_73+0
      00895D 16 06            [ 2] 1636 	ldw	y, (0x06, sp)
      00895F 89               [ 2] 1637 	pushw	x
      008960 90 89            [ 2] 1638 	pushw	y
      008962 CD 9E C2         [ 4] 1639 	call	_strcmp
      008965 5B 04            [ 2] 1640 	addw	sp, #4
      008967 5D               [ 2] 1641 	tnzw	x
      008968 26 16            [ 1] 1642 	jrne	00147$
                                   1643 ;	main.c: 354: config_default_system(&cfg_system);
      00896A AE 00 01         [ 2] 1644 	ldw	x, #_cfg_system+0
      00896D 89               [ 2] 1645 	pushw	x
      00896E CD 99 F4         [ 4] 1646 	call	_config_default_system
      008971 85               [ 2] 1647 	popw	x
                                   1648 ;	main.c: 355: config_default_output(&cfg_output);
      008972 AE 00 3E         [ 2] 1649 	ldw	x, #_cfg_output+0
      008975 89               [ 2] 1650 	pushw	x
      008976 CD 9A 97         [ 4] 1651 	call	_config_default_output
      008979 85               [ 2] 1652 	popw	x
                                   1653 ;	main.c: 356: autocommit();
      00897A CD 81 16         [ 4] 1654 	call	_autocommit
      00897D CC 8B 8D         [ 2] 1655 	jp	00184$
      008980                       1656 00147$:
                                   1657 ;	main.c: 367: uint8_t space_found = 0;
      008980 0F 01            [ 1] 1658 	clr	(0x01, sp)
                                   1659 ;	main.c: 369: for (idx = 0; idx < uart_read_len; idx++) {
      008982 0F 02            [ 1] 1660 	clr	(0x02, sp)
      008984 0F 0F            [ 1] 1661 	clr	(0x0f, sp)
      008986                       1662 00186$:
      008986 7B 0F            [ 1] 1663 	ld	a, (0x0f, sp)
      008988 C1 01 A2         [ 1] 1664 	cp	a, _uart_read_len+0
      00898B 24 1B            [ 1] 1665 	jrnc	00103$
                                   1666 ;	main.c: 370: if (uart_read_buf[idx] == ' ') {
      00898D 5F               [ 1] 1667 	clrw	x
      00898E 7B 0F            [ 1] 1668 	ld	a, (0x0f, sp)
      008990 97               [ 1] 1669 	ld	xl, a
      008991 72 FB 06         [ 2] 1670 	addw	x, (0x06, sp)
      008994 F6               [ 1] 1671 	ld	a, (x)
      008995 A1 20            [ 1] 1672 	cp	a, #0x20
      008997 26 07            [ 1] 1673 	jrne	00187$
                                   1674 ;	main.c: 371: uart_read_buf[idx] = 0;
      008999 7F               [ 1] 1675 	clr	(x)
                                   1676 ;	main.c: 372: space_found = 1;
      00899A A6 01            [ 1] 1677 	ld	a, #0x01
      00899C 6B 01            [ 1] 1678 	ld	(0x01, sp), a
                                   1679 ;	main.c: 373: break;
      00899E 20 08            [ 2] 1680 	jra	00103$
      0089A0                       1681 00187$:
                                   1682 ;	main.c: 369: for (idx = 0; idx < uart_read_len; idx++) {
      0089A0 0C 0F            [ 1] 1683 	inc	(0x0f, sp)
      0089A2 7B 0F            [ 1] 1684 	ld	a, (0x0f, sp)
      0089A4 6B 02            [ 1] 1685 	ld	(0x02, sp), a
      0089A6 20 DE            [ 2] 1686 	jra	00186$
      0089A8                       1687 00103$:
                                   1688 ;	main.c: 377: if (space_found) {
      0089A8 0D 01            [ 1] 1689 	tnz	(0x01, sp)
      0089AA 26 03            [ 1] 1690 	jrne	00341$
      0089AC CC 8B 85         [ 2] 1691 	jp	00144$
      0089AF                       1692 00341$:
                                   1693 ;	main.c: 378: if (strcmp(uart_read_buf, "SNAME") == 0) {
      0089AF AE 91 65         [ 2] 1694 	ldw	x, #___str_74+0
      0089B2 16 06            [ 2] 1695 	ldw	y, (0x06, sp)
      0089B4 89               [ 2] 1696 	pushw	x
      0089B5 90 89            [ 2] 1697 	pushw	y
      0089B7 CD 9E C2         [ 4] 1698 	call	_strcmp
      0089BA 5B 04            [ 2] 1699 	addw	sp, #4
      0089BC 1F 12            [ 2] 1700 	ldw	(0x12, sp), x
                                   1701 ;	main.c: 379: set_name(uart_read_buf + idx + 1);
      0089BE 5F               [ 1] 1702 	clrw	x
      0089BF 7B 02            [ 1] 1703 	ld	a, (0x02, sp)
      0089C1 97               [ 1] 1704 	ld	xl, a
      0089C2 72 FB 06         [ 2] 1705 	addw	x, (0x06, sp)
      0089C5 5C               [ 2] 1706 	incw	x
      0089C6 1F 14            [ 2] 1707 	ldw	(0x14, sp), x
                                   1708 ;	main.c: 378: if (strcmp(uart_read_buf, "SNAME") == 0) {
      0089C8 1E 12            [ 2] 1709 	ldw	x, (0x12, sp)
      0089CA 26 0A            [ 1] 1710 	jrne	00141$
                                   1711 ;	main.c: 379: set_name(uart_read_buf + idx + 1);
      0089CC 1E 14            [ 2] 1712 	ldw	x, (0x14, sp)
      0089CE 89               [ 2] 1713 	pushw	x
      0089CF CD 80 B5         [ 4] 1714 	call	_set_name
      0089D2 85               [ 2] 1715 	popw	x
      0089D3 CC 8B 8D         [ 2] 1716 	jp	00184$
      0089D6                       1717 00141$:
                                   1718 ;	main.c: 380: } else if (strcmp(uart_read_buf, "OUTPUT") == 0) {
      0089D6 AE 91 6B         [ 2] 1719 	ldw	x, #___str_75+0
      0089D9 16 06            [ 2] 1720 	ldw	y, (0x06, sp)
      0089DB 89               [ 2] 1721 	pushw	x
      0089DC 90 89            [ 2] 1722 	pushw	y
      0089DE CD 9E C2         [ 4] 1723 	call	_strcmp
      0089E1 5B 04            [ 2] 1724 	addw	sp, #4
      0089E3 5D               [ 2] 1725 	tnzw	x
      0089E4 26 0A            [ 1] 1726 	jrne	00138$
                                   1727 ;	main.c: 381: set_output(uart_read_buf + idx + 1);
      0089E6 1E 14            [ 2] 1728 	ldw	x, (0x14, sp)
      0089E8 89               [ 2] 1729 	pushw	x
      0089E9 CD 81 2B         [ 4] 1730 	call	_set_output
      0089EC 85               [ 2] 1731 	popw	x
      0089ED CC 8B 8D         [ 2] 1732 	jp	00184$
      0089F0                       1733 00138$:
                                   1734 ;	main.c: 382: } else if (strcmp(uart_read_buf, "VOLTAGE") == 0) {
      0089F0 AE 91 09         [ 2] 1735 	ldw	x, #___str_63+0
      0089F3 16 06            [ 2] 1736 	ldw	y, (0x06, sp)
      0089F5 89               [ 2] 1737 	pushw	x
      0089F6 90 89            [ 2] 1738 	pushw	y
      0089F8 CD 9E C2         [ 4] 1739 	call	_strcmp
      0089FB 5B 04            [ 2] 1740 	addw	sp, #4
      0089FD 5D               [ 2] 1741 	tnzw	x
      0089FE 26 0A            [ 1] 1742 	jrne	00135$
                                   1743 ;	main.c: 383: set_voltage(uart_read_buf + idx + 1);
      008A00 1E 14            [ 2] 1744 	ldw	x, (0x14, sp)
      008A02 89               [ 2] 1745 	pushw	x
      008A03 CD 81 95         [ 4] 1746 	call	_set_voltage
      008A06 85               [ 2] 1747 	popw	x
      008A07 CC 8B 8D         [ 2] 1748 	jp	00184$
      008A0A                       1749 00135$:
                                   1750 ;	main.c: 384: } else if (strcmp(uart_read_buf, "CURRENT") == 0) {
      008A0A AE 91 01         [ 2] 1751 	ldw	x, #___str_62+0
      008A0D 16 06            [ 2] 1752 	ldw	y, (0x06, sp)
      008A0F 89               [ 2] 1753 	pushw	x
      008A10 90 89            [ 2] 1754 	pushw	y
      008A12 CD 9E C2         [ 4] 1755 	call	_strcmp
      008A15 5B 04            [ 2] 1756 	addw	sp, #4
      008A17 5D               [ 2] 1757 	tnzw	x
      008A18 26 0A            [ 1] 1758 	jrne	00132$
                                   1759 ;	main.c: 385: set_current(uart_read_buf + idx + 1);
      008A1A 1E 14            [ 2] 1760 	ldw	x, (0x14, sp)
      008A1C 89               [ 2] 1761 	pushw	x
      008A1D CD 81 FD         [ 4] 1762 	call	_set_current
      008A20 85               [ 2] 1763 	popw	x
      008A21 CC 8B 8D         [ 2] 1764 	jp	00184$
      008A24                       1765 00132$:
                                   1766 ;	main.c: 386: } else if (strcmp(uart_read_buf, "AUTOCOMMIT") == 0) {
      008A24 AE 91 72         [ 2] 1767 	ldw	x, #___str_76+0
      008A27 16 06            [ 2] 1768 	ldw	y, (0x06, sp)
      008A29 89               [ 2] 1769 	pushw	x
      008A2A 90 89            [ 2] 1770 	pushw	y
      008A2C CD 9E C2         [ 4] 1771 	call	_strcmp
      008A2F 5B 04            [ 2] 1772 	addw	sp, #4
      008A31 5D               [ 2] 1773 	tnzw	x
      008A32 26 0A            [ 1] 1774 	jrne	00129$
                                   1775 ;	main.c: 387: set_autocommit(uart_read_buf + idx + 1);
      008A34 1E 14            [ 2] 1776 	ldw	x, (0x14, sp)
      008A36 89               [ 2] 1777 	pushw	x
      008A37 CD 82 53         [ 4] 1778 	call	_set_autocommit
      008A3A 85               [ 2] 1779 	popw	x
      008A3B CC 8B 8D         [ 2] 1780 	jp	00184$
      008A3E                       1781 00129$:
                                   1782 ;	main.c: 400: } else if (strcmp(uart_read_buf, "CALVOUTADCA") == 0) {
      008A3E AE 91 7D         [ 2] 1783 	ldw	x, #___str_77+0
      008A41 16 06            [ 2] 1784 	ldw	y, (0x06, sp)
      008A43 89               [ 2] 1785 	pushw	x
      008A44 90 89            [ 2] 1786 	pushw	y
      008A46 CD 9E C2         [ 4] 1787 	call	_strcmp
      008A49 5B 04            [ 2] 1788 	addw	sp, #4
      008A4B 5D               [ 2] 1789 	tnzw	x
      008A4C 26 18            [ 1] 1790 	jrne	00126$
                                   1791 ;	main.c: 401: parse_uint("ADC VOUT A", &cfg_system.vout_adc.a, uart_read_buf+idx+1);
      008A4E 90 AE 00 1E      [ 2] 1792 	ldw	y, #_cfg_system+29
      008A52 AE 91 89         [ 2] 1793 	ldw	x, #___str_78+0
      008A55 7B 15            [ 1] 1794 	ld	a, (0x15, sp)
      008A57 88               [ 1] 1795 	push	a
      008A58 7B 15            [ 1] 1796 	ld	a, (0x15, sp)
      008A5A 88               [ 1] 1797 	push	a
      008A5B 90 89            [ 2] 1798 	pushw	y
      008A5D 89               [ 2] 1799 	pushw	x
      008A5E CD 83 9A         [ 4] 1800 	call	_parse_uint
      008A61 5B 06            [ 2] 1801 	addw	sp, #6
      008A63 CC 8B 8D         [ 2] 1802 	jp	00184$
      008A66                       1803 00126$:
                                   1804 ;	main.c: 402: } else if (strcmp(uart_read_buf, "CALVOUTADCB") == 0) {
      008A66 AE 91 94         [ 2] 1805 	ldw	x, #___str_79+0
      008A69 16 06            [ 2] 1806 	ldw	y, (0x06, sp)
      008A6B 89               [ 2] 1807 	pushw	x
      008A6C 90 89            [ 2] 1808 	pushw	y
      008A6E CD 9E C2         [ 4] 1809 	call	_strcmp
      008A71 5B 04            [ 2] 1810 	addw	sp, #4
      008A73 5D               [ 2] 1811 	tnzw	x
      008A74 26 18            [ 1] 1812 	jrne	00123$
                                   1813 ;	main.c: 403: parse_uint("ADC VOUT B", &cfg_system.vout_adc.b, uart_read_buf+idx+1);
      008A76 90 AE 00 22      [ 2] 1814 	ldw	y, #_cfg_system+33
      008A7A AE 91 A0         [ 2] 1815 	ldw	x, #___str_80+0
      008A7D 7B 15            [ 1] 1816 	ld	a, (0x15, sp)
      008A7F 88               [ 1] 1817 	push	a
      008A80 7B 15            [ 1] 1818 	ld	a, (0x15, sp)
      008A82 88               [ 1] 1819 	push	a
      008A83 90 89            [ 2] 1820 	pushw	y
      008A85 89               [ 2] 1821 	pushw	x
      008A86 CD 83 9A         [ 4] 1822 	call	_parse_uint
      008A89 5B 06            [ 2] 1823 	addw	sp, #6
      008A8B CC 8B 8D         [ 2] 1824 	jp	00184$
      008A8E                       1825 00123$:
                                   1826 ;	main.c: 404: } else if (strcmp(uart_read_buf, "CALVOUTPWMA") == 0) {
      008A8E AE 91 AB         [ 2] 1827 	ldw	x, #___str_81+0
      008A91 16 06            [ 2] 1828 	ldw	y, (0x06, sp)
      008A93 89               [ 2] 1829 	pushw	x
      008A94 90 89            [ 2] 1830 	pushw	y
      008A96 CD 9E C2         [ 4] 1831 	call	_strcmp
      008A99 5B 04            [ 2] 1832 	addw	sp, #4
      008A9B 5D               [ 2] 1833 	tnzw	x
      008A9C 26 18            [ 1] 1834 	jrne	00120$
                                   1835 ;	main.c: 405: parse_uint("PWM VOUT A", &cfg_system.vout_pwm.a, uart_read_buf+idx+1);
      008A9E 90 AE 00 2E      [ 2] 1836 	ldw	y, #_cfg_system+45
      008AA2 AE 91 B7         [ 2] 1837 	ldw	x, #___str_82+0
      008AA5 7B 15            [ 1] 1838 	ld	a, (0x15, sp)
      008AA7 88               [ 1] 1839 	push	a
      008AA8 7B 15            [ 1] 1840 	ld	a, (0x15, sp)
      008AAA 88               [ 1] 1841 	push	a
      008AAB 90 89            [ 2] 1842 	pushw	y
      008AAD 89               [ 2] 1843 	pushw	x
      008AAE CD 83 9A         [ 4] 1844 	call	_parse_uint
      008AB1 5B 06            [ 2] 1845 	addw	sp, #6
      008AB3 CC 8B 8D         [ 2] 1846 	jp	00184$
      008AB6                       1847 00120$:
                                   1848 ;	main.c: 406: } else if (strcmp(uart_read_buf, "CALVOUTPWMB") == 0) {
      008AB6 AE 91 C2         [ 2] 1849 	ldw	x, #___str_83+0
      008AB9 16 06            [ 2] 1850 	ldw	y, (0x06, sp)
      008ABB 89               [ 2] 1851 	pushw	x
      008ABC 90 89            [ 2] 1852 	pushw	y
      008ABE CD 9E C2         [ 4] 1853 	call	_strcmp
      008AC1 5B 04            [ 2] 1854 	addw	sp, #4
      008AC3 5D               [ 2] 1855 	tnzw	x
      008AC4 26 18            [ 1] 1856 	jrne	00117$
                                   1857 ;	main.c: 407: parse_uint("PWM VOUT B", &cfg_system.vout_pwm.b, uart_read_buf+idx+1);
      008AC6 90 AE 00 32      [ 2] 1858 	ldw	y, #_cfg_system+49
      008ACA AE 91 CE         [ 2] 1859 	ldw	x, #___str_84+0
      008ACD 7B 15            [ 1] 1860 	ld	a, (0x15, sp)
      008ACF 88               [ 1] 1861 	push	a
      008AD0 7B 15            [ 1] 1862 	ld	a, (0x15, sp)
      008AD2 88               [ 1] 1863 	push	a
      008AD3 90 89            [ 2] 1864 	pushw	y
      008AD5 89               [ 2] 1865 	pushw	x
      008AD6 CD 83 9A         [ 4] 1866 	call	_parse_uint
      008AD9 5B 06            [ 2] 1867 	addw	sp, #6
      008ADB CC 8B 8D         [ 2] 1868 	jp	00184$
      008ADE                       1869 00117$:
                                   1870 ;	main.c: 408: } else if (strcmp(uart_read_buf, "CALCOUTADCA") == 0) {
      008ADE AE 91 D9         [ 2] 1871 	ldw	x, #___str_85+0
      008AE1 16 06            [ 2] 1872 	ldw	y, (0x06, sp)
      008AE3 89               [ 2] 1873 	pushw	x
      008AE4 90 89            [ 2] 1874 	pushw	y
      008AE6 CD 9E C2         [ 4] 1875 	call	_strcmp
      008AE9 5B 04            [ 2] 1876 	addw	sp, #4
      008AEB 5D               [ 2] 1877 	tnzw	x
      008AEC 26 18            [ 1] 1878 	jrne	00114$
                                   1879 ;	main.c: 409: parse_uint("ADC COUT A", &cfg_system.cout_adc.a, uart_read_buf+idx+1);
      008AEE 90 AE 00 26      [ 2] 1880 	ldw	y, #_cfg_system+37
      008AF2 AE 91 E5         [ 2] 1881 	ldw	x, #___str_86+0
      008AF5 7B 15            [ 1] 1882 	ld	a, (0x15, sp)
      008AF7 88               [ 1] 1883 	push	a
      008AF8 7B 15            [ 1] 1884 	ld	a, (0x15, sp)
      008AFA 88               [ 1] 1885 	push	a
      008AFB 90 89            [ 2] 1886 	pushw	y
      008AFD 89               [ 2] 1887 	pushw	x
      008AFE CD 83 9A         [ 4] 1888 	call	_parse_uint
      008B01 5B 06            [ 2] 1889 	addw	sp, #6
      008B03 CC 8B 8D         [ 2] 1890 	jp	00184$
      008B06                       1891 00114$:
                                   1892 ;	main.c: 410: } else if (strcmp(uart_read_buf, "CALCOUTADCB") == 0) {
      008B06 AE 91 F0         [ 2] 1893 	ldw	x, #___str_87+0
      008B09 16 06            [ 2] 1894 	ldw	y, (0x06, sp)
      008B0B 89               [ 2] 1895 	pushw	x
      008B0C 90 89            [ 2] 1896 	pushw	y
      008B0E CD 9E C2         [ 4] 1897 	call	_strcmp
      008B11 5B 04            [ 2] 1898 	addw	sp, #4
      008B13 5D               [ 2] 1899 	tnzw	x
      008B14 26 17            [ 1] 1900 	jrne	00111$
                                   1901 ;	main.c: 411: parse_uint("ADC COUT B", &cfg_system.cout_adc.b, uart_read_buf+idx+1);
      008B16 90 AE 00 2A      [ 2] 1902 	ldw	y, #_cfg_system+41
      008B1A AE 91 FC         [ 2] 1903 	ldw	x, #___str_88+0
      008B1D 7B 15            [ 1] 1904 	ld	a, (0x15, sp)
      008B1F 88               [ 1] 1905 	push	a
      008B20 7B 15            [ 1] 1906 	ld	a, (0x15, sp)
      008B22 88               [ 1] 1907 	push	a
      008B23 90 89            [ 2] 1908 	pushw	y
      008B25 89               [ 2] 1909 	pushw	x
      008B26 CD 83 9A         [ 4] 1910 	call	_parse_uint
      008B29 5B 06            [ 2] 1911 	addw	sp, #6
      008B2B 20 60            [ 2] 1912 	jra	00184$
      008B2D                       1913 00111$:
                                   1914 ;	main.c: 412: } else if (strcmp(uart_read_buf, "CALCOUTPWMA") == 0) {
      008B2D AE 92 07         [ 2] 1915 	ldw	x, #___str_89+0
      008B30 16 06            [ 2] 1916 	ldw	y, (0x06, sp)
      008B32 89               [ 2] 1917 	pushw	x
      008B33 90 89            [ 2] 1918 	pushw	y
      008B35 CD 9E C2         [ 4] 1919 	call	_strcmp
      008B38 5B 04            [ 2] 1920 	addw	sp, #4
      008B3A 5D               [ 2] 1921 	tnzw	x
      008B3B 26 17            [ 1] 1922 	jrne	00108$
                                   1923 ;	main.c: 413: parse_uint("PWM COUT A", &cfg_system.cout_pwm.a, uart_read_buf+idx+1);
      008B3D 90 AE 00 36      [ 2] 1924 	ldw	y, #_cfg_system+53
      008B41 AE 92 13         [ 2] 1925 	ldw	x, #___str_90+0
      008B44 7B 15            [ 1] 1926 	ld	a, (0x15, sp)
      008B46 88               [ 1] 1927 	push	a
      008B47 7B 15            [ 1] 1928 	ld	a, (0x15, sp)
      008B49 88               [ 1] 1929 	push	a
      008B4A 90 89            [ 2] 1930 	pushw	y
      008B4C 89               [ 2] 1931 	pushw	x
      008B4D CD 83 9A         [ 4] 1932 	call	_parse_uint
      008B50 5B 06            [ 2] 1933 	addw	sp, #6
      008B52 20 39            [ 2] 1934 	jra	00184$
      008B54                       1935 00108$:
                                   1936 ;	main.c: 414: } else if (strcmp(uart_read_buf, "CALCOUTPWMB") == 0) {
      008B54 AE 92 1E         [ 2] 1937 	ldw	x, #___str_91+0
      008B57 16 06            [ 2] 1938 	ldw	y, (0x06, sp)
      008B59 89               [ 2] 1939 	pushw	x
      008B5A 90 89            [ 2] 1940 	pushw	y
      008B5C CD 9E C2         [ 4] 1941 	call	_strcmp
      008B5F 5B 04            [ 2] 1942 	addw	sp, #4
      008B61 5D               [ 2] 1943 	tnzw	x
      008B62 26 17            [ 1] 1944 	jrne	00105$
                                   1945 ;	main.c: 415: parse_uint("PWM COUT B", &cfg_system.cout_pwm.b, uart_read_buf+idx+1);
      008B64 90 AE 00 3A      [ 2] 1946 	ldw	y, #_cfg_system+57
      008B68 AE 92 2A         [ 2] 1947 	ldw	x, #___str_92+0
      008B6B 7B 15            [ 1] 1948 	ld	a, (0x15, sp)
      008B6D 88               [ 1] 1949 	push	a
      008B6E 7B 15            [ 1] 1950 	ld	a, (0x15, sp)
      008B70 88               [ 1] 1951 	push	a
      008B71 90 89            [ 2] 1952 	pushw	y
      008B73 89               [ 2] 1953 	pushw	x
      008B74 CD 83 9A         [ 4] 1954 	call	_parse_uint
      008B77 5B 06            [ 2] 1955 	addw	sp, #6
      008B79 20 12            [ 2] 1956 	jra	00184$
      008B7B                       1957 00105$:
                                   1958 ;	main.c: 417: uart_write_str("UNKNOWN COMMAND!\r\n");
      008B7B AE 92 35         [ 2] 1959 	ldw	x, #___str_93+0
      008B7E 89               [ 2] 1960 	pushw	x
      008B7F CD 94 79         [ 4] 1961 	call	_uart_write_str
      008B82 85               [ 2] 1962 	popw	x
      008B83 20 08            [ 2] 1963 	jra	00184$
      008B85                       1964 00144$:
                                   1965 ;	main.c: 420: uart_write_str("UNKNOWN COMMAND\r\n");
      008B85 AE 92 48         [ 2] 1966 	ldw	x, #___str_94+0
      008B88 89               [ 2] 1967 	pushw	x
      008B89 CD 94 79         [ 4] 1968 	call	_uart_write_str
      008B8C 85               [ 2] 1969 	popw	x
      008B8D                       1970 00184$:
                                   1971 ;	main.c: 423: uart_write_str("DONE\r\n");
      008B8D AE 92 5A         [ 2] 1972 	ldw	x, #___str_95+0
      008B90 89               [ 2] 1973 	pushw	x
      008B91 CD 94 79         [ 4] 1974 	call	_uart_write_str
      008B94 85               [ 2] 1975 	popw	x
                                   1976 ;	main.c: 425: uart_read_len = 0;
      008B95 72 5F 01 A2      [ 1] 1977 	clr	_uart_read_len+0
                                   1978 ;	main.c: 426: read_newline = 0;
      008B99 72 5F 01 A3      [ 1] 1979 	clr	_read_newline+0
      008B9D 5B 1D            [ 2] 1980 	addw	sp, #29
      008B9F 81               [ 4] 1981 	ret
                                   1982 ;	main.c: 470: void config_load(void)
                                   1983 ;	-----------------------------------------
                                   1984 ;	 function config_load
                                   1985 ;	-----------------------------------------
      008BA0                       1986 _config_load:
      008BA0 52 03            [ 2] 1987 	sub	sp, #3
                                   1988 ;	main.c: 472: config_load_system(&cfg_system);
      008BA2 AE 00 01         [ 2] 1989 	ldw	x, #_cfg_system+0
      008BA5 1F 02            [ 2] 1990 	ldw	(0x02, sp), x
      008BA7 1E 02            [ 2] 1991 	ldw	x, (0x02, sp)
      008BA9 89               [ 2] 1992 	pushw	x
      008BAA CD 9A 06         [ 4] 1993 	call	_config_load_system
      008BAD 85               [ 2] 1994 	popw	x
                                   1995 ;	main.c: 473: config_load_output(&cfg_output);
      008BAE AE 00 3E         [ 2] 1996 	ldw	x, #_cfg_output+0
      008BB1 89               [ 2] 1997 	pushw	x
      008BB2 CD 9A A9         [ 4] 1998 	call	_config_load_output
      008BB5 85               [ 2] 1999 	popw	x
                                   2000 ;	main.c: 475: if (cfg_system.default_on)
      008BB6 1E 02            [ 2] 2001 	ldw	x, (0x02, sp)
      008BB8 E6 12            [ 1] 2002 	ld	a, (0x12, x)
      008BBA 6B 01            [ 1] 2003 	ld	(0x01, sp), a
                                   2004 ;	main.c: 476: cfg_system.output = 1;
      008BBC 1E 02            [ 2] 2005 	ldw	x, (0x02, sp)
      008BBE 1C 00 13         [ 2] 2006 	addw	x, #0x0013
                                   2007 ;	main.c: 475: if (cfg_system.default_on)
      008BC1 0D 01            [ 1] 2008 	tnz	(0x01, sp)
      008BC3 27 05            [ 1] 2009 	jreq	00102$
                                   2010 ;	main.c: 476: cfg_system.output = 1;
      008BC5 A6 01            [ 1] 2011 	ld	a, #0x01
      008BC7 F7               [ 1] 2012 	ld	(x), a
      008BC8 20 01            [ 2] 2013 	jra	00103$
      008BCA                       2014 00102$:
                                   2015 ;	main.c: 478: cfg_system.output = 0;
      008BCA 7F               [ 1] 2016 	clr	(x)
      008BCB                       2017 00103$:
                                   2018 ;	main.c: 480: state.pc3 = 1;
      008BCB AE 00 54         [ 2] 2019 	ldw	x, #_state+13
      008BCE A6 01            [ 1] 2020 	ld	a, #0x01
      008BD0 F7               [ 1] 2021 	ld	(x), a
      008BD1 5B 03            [ 2] 2022 	addw	sp, #3
      008BD3 81               [ 4] 2023 	ret
                                   2024 ;	main.c: 483: void read_state(void)
                                   2025 ;	-----------------------------------------
                                   2026 ;	 function read_state
                                   2027 ;	-----------------------------------------
      008BD4                       2028 _read_state:
      008BD4 52 13            [ 2] 2029 	sub	sp, #19
                                   2030 ;	main.c: 487: tmp = (PC_IDR & (1<<3)) ? 1 : 0;
      008BD6 AE 50 0B         [ 2] 2031 	ldw	x, #0x500b
      008BD9 F6               [ 1] 2032 	ld	a, (x)
      008BDA A5 08            [ 1] 2033 	bcp	a, #0x08
      008BDC 27 03            [ 1] 2034 	jreq	00113$
      008BDE A6 01            [ 1] 2035 	ld	a, #0x01
      008BE0 21                    2036 	.byte 0x21
      008BE1                       2037 00113$:
      008BE1 4F               [ 1] 2038 	clr	a
      008BE2                       2039 00114$:
      008BE2 6B 13            [ 1] 2040 	ld	(0x13, sp), a
                                   2041 ;	main.c: 488: if (state.pc3 != tmp) {
      008BE4 AE 00 47         [ 2] 2042 	ldw	x, #_state+0
      008BE7 1F 09            [ 2] 2043 	ldw	(0x09, sp), x
      008BE9 1E 09            [ 2] 2044 	ldw	x, (0x09, sp)
      008BEB 1C 00 0D         [ 2] 2045 	addw	x, #0x000d
      008BEE 1F 0D            [ 2] 2046 	ldw	(0x0d, sp), x
      008BF0 1E 0D            [ 2] 2047 	ldw	x, (0x0d, sp)
      008BF2 F6               [ 1] 2048 	ld	a, (x)
      008BF3 11 13            [ 1] 2049 	cp	a, (0x13, sp)
      008BF5 27 1E            [ 1] 2050 	jreq	00102$
                                   2051 ;	main.c: 489: uart_write_str("PC3 is now ");
      008BF7 AE 92 61         [ 2] 2052 	ldw	x, #___str_96+0
      008BFA 89               [ 2] 2053 	pushw	x
      008BFB CD 94 79         [ 4] 2054 	call	_uart_write_str
      008BFE 85               [ 2] 2055 	popw	x
                                   2056 ;	main.c: 490: uart_write_ch('0' + tmp);
      008BFF 7B 13            [ 1] 2057 	ld	a, (0x13, sp)
      008C01 AB 30            [ 1] 2058 	add	a, #0x30
      008C03 88               [ 1] 2059 	push	a
      008C04 CD 94 5A         [ 4] 2060 	call	_uart_write_ch
      008C07 84               [ 1] 2061 	pop	a
                                   2062 ;	main.c: 491: uart_write_str("\r\n");
      008C08 AE 8D E7         [ 2] 2063 	ldw	x, #___str_1+0
      008C0B 89               [ 2] 2064 	pushw	x
      008C0C CD 94 79         [ 4] 2065 	call	_uart_write_str
      008C0F 85               [ 2] 2066 	popw	x
                                   2067 ;	main.c: 492: state.pc3 = tmp;
      008C10 1E 0D            [ 2] 2068 	ldw	x, (0x0d, sp)
      008C12 7B 13            [ 1] 2069 	ld	a, (0x13, sp)
      008C14 F7               [ 1] 2070 	ld	(x), a
      008C15                       2071 00102$:
                                   2072 ;	main.c: 495: tmp = (PB_IDR & (1<<5)) ? 1 : 0;
      008C15 AE 50 06         [ 2] 2073 	ldw	x, #0x5006
      008C18 F6               [ 1] 2074 	ld	a, (x)
      008C19 A5 20            [ 1] 2075 	bcp	a, #0x20
      008C1B 27 03            [ 1] 2076 	jreq	00115$
      008C1D A6 01            [ 1] 2077 	ld	a, #0x01
      008C1F 21                    2078 	.byte 0x21
      008C20                       2079 00115$:
      008C20 4F               [ 1] 2080 	clr	a
      008C21                       2081 00116$:
      008C21 6B 06            [ 1] 2082 	ld	(0x06, sp), a
                                   2083 ;	main.c: 496: if (state.constant_current != tmp) {
      008C23 1E 09            [ 2] 2084 	ldw	x, (0x09, sp)
      008C25 1C 00 0C         [ 2] 2085 	addw	x, #0x000c
      008C28 F6               [ 1] 2086 	ld	a, (x)
      008C29 11 06            [ 1] 2087 	cp	a, (0x06, sp)
      008C2B 27 0F            [ 1] 2088 	jreq	00104$
                                   2089 ;	main.c: 497: state.constant_current = tmp;
      008C2D 7B 06            [ 1] 2090 	ld	a, (0x06, sp)
      008C2F F7               [ 1] 2091 	ld	(x), a
                                   2092 ;	main.c: 498: output_check_state(&cfg_system, state.constant_current);
      008C30 AE 00 01         [ 2] 2093 	ldw	x, #_cfg_system+0
      008C33 7B 06            [ 1] 2094 	ld	a, (0x06, sp)
      008C35 88               [ 1] 2095 	push	a
      008C36 89               [ 2] 2096 	pushw	x
      008C37 CD 99 AB         [ 4] 2097 	call	_output_check_state
      008C3A 5B 03            [ 2] 2098 	addw	sp, #3
      008C3C                       2099 00104$:
                                   2100 ;	main.c: 501: if (adc_ready()) {
      008C3C CD 9D 2F         [ 4] 2101 	call	_adc_ready
      008C3F 4D               [ 1] 2102 	tnz	a
      008C40 26 03            [ 1] 2103 	jrne	00157$
      008C42 CC 8D 35         [ 2] 2104 	jp	00111$
      008C45                       2105 00157$:
                                   2106 ;	main.c: 502: uint16_t val = adc_read();
      008C45 CD 9D 17         [ 4] 2107 	call	_adc_read
      008C48 1F 03            [ 2] 2108 	ldw	(0x03, sp), x
                                   2109 ;	main.c: 503: uint8_t ch = adc_channel();
      008C4A CD 9D 28         [ 4] 2110 	call	_adc_channel
      008C4D 6B 05            [ 1] 2111 	ld	(0x05, sp), a
                                   2112 ;	main.c: 505: switch (ch) {
      008C4F 7B 05            [ 1] 2113 	ld	a, (0x05, sp)
      008C51 A1 02            [ 1] 2114 	cp	a, #0x02
      008C53 27 0F            [ 1] 2115 	jreq	00105$
      008C55 7B 05            [ 1] 2116 	ld	a, (0x05, sp)
      008C57 A1 03            [ 1] 2117 	cp	a, #0x03
      008C59 27 2D            [ 1] 2118 	jreq	00106$
      008C5B 7B 05            [ 1] 2119 	ld	a, (0x05, sp)
      008C5D A1 04            [ 1] 2120 	cp	a, #0x04
      008C5F 27 4C            [ 1] 2121 	jreq	00107$
      008C61 CC 8D 2E         [ 2] 2122 	jp	00108$
                                   2123 ;	main.c: 506: case 2:
      008C64                       2124 00105$:
                                   2125 ;	main.c: 507: state.cout_raw = val;
      008C64 1E 09            [ 2] 2126 	ldw	x, (0x09, sp)
      008C66 16 03            [ 2] 2127 	ldw	y, (0x03, sp)
      008C68 EF 04            [ 2] 2128 	ldw	(0x0004, x), y
                                   2129 ;	main.c: 509: state.cout = adc_to_volt(val, &cfg_system.cout_adc);
      008C6A 1E 09            [ 2] 2130 	ldw	x, (0x09, sp)
      008C6C 1C 00 0A         [ 2] 2131 	addw	x, #0x000a
      008C6F 1F 07            [ 2] 2132 	ldw	(0x07, sp), x
      008C71 AE 00 26         [ 2] 2133 	ldw	x, #_cfg_system+37
      008C74 89               [ 2] 2134 	pushw	x
      008C75 1E 05            [ 2] 2135 	ldw	x, (0x05, sp)
      008C77 89               [ 2] 2136 	pushw	x
      008C78 CD 9C A4         [ 4] 2137 	call	_adc_to_volt
      008C7B 5B 04            [ 2] 2138 	addw	sp, #4
      008C7D 16 07            [ 2] 2139 	ldw	y, (0x07, sp)
      008C7F 90 FF            [ 2] 2140 	ldw	(y), x
                                   2141 ;	main.c: 510: ch = 3;
      008C81 A6 03            [ 1] 2142 	ld	a, #0x03
      008C83 6B 05            [ 1] 2143 	ld	(0x05, sp), a
                                   2144 ;	main.c: 511: break;
      008C85 CC 8D 2E         [ 2] 2145 	jp	00108$
                                   2146 ;	main.c: 512: case 3:
      008C88                       2147 00106$:
                                   2148 ;	main.c: 513: state.vout_raw = val;
      008C88 1E 09            [ 2] 2149 	ldw	x, (0x09, sp)
      008C8A 5C               [ 2] 2150 	incw	x
      008C8B 5C               [ 2] 2151 	incw	x
      008C8C 16 03            [ 2] 2152 	ldw	y, (0x03, sp)
      008C8E FF               [ 2] 2153 	ldw	(x), y
                                   2154 ;	main.c: 515: state.vout = adc_to_volt(val, &cfg_system.vout_adc);
      008C8F 1E 09            [ 2] 2155 	ldw	x, (0x09, sp)
      008C91 1C 00 08         [ 2] 2156 	addw	x, #0x0008
      008C94 1F 11            [ 2] 2157 	ldw	(0x11, sp), x
      008C96 AE 00 1E         [ 2] 2158 	ldw	x, #_cfg_system+29
      008C99 89               [ 2] 2159 	pushw	x
      008C9A 1E 05            [ 2] 2160 	ldw	x, (0x05, sp)
      008C9C 89               [ 2] 2161 	pushw	x
      008C9D CD 9C A4         [ 4] 2162 	call	_adc_to_volt
      008CA0 5B 04            [ 2] 2163 	addw	sp, #4
      008CA2 16 11            [ 2] 2164 	ldw	y, (0x11, sp)
      008CA4 90 FF            [ 2] 2165 	ldw	(y), x
                                   2166 ;	main.c: 516: ch = 4;
      008CA6 A6 04            [ 1] 2167 	ld	a, #0x04
      008CA8 6B 05            [ 1] 2168 	ld	(0x05, sp), a
                                   2169 ;	main.c: 517: break;
      008CAA CC 8D 2E         [ 2] 2170 	jp	00108$
                                   2171 ;	main.c: 518: case 4:
      008CAD                       2172 00107$:
                                   2173 ;	main.c: 519: state.vin_raw = val;
      008CAD 1E 09            [ 2] 2174 	ldw	x, (0x09, sp)
      008CAF 16 03            [ 2] 2175 	ldw	y, (0x03, sp)
      008CB1 FF               [ 2] 2176 	ldw	(x), y
                                   2177 ;	main.c: 521: state.vin = adc_to_volt(val, &cfg_system.vin_adc);
      008CB2 1E 09            [ 2] 2178 	ldw	x, (0x09, sp)
      008CB4 1C 00 06         [ 2] 2179 	addw	x, #0x0006
      008CB7 1F 0B            [ 2] 2180 	ldw	(0x0b, sp), x
      008CB9 AE 00 16         [ 2] 2181 	ldw	x, #_cfg_system+21
      008CBC 89               [ 2] 2182 	pushw	x
      008CBD 1E 05            [ 2] 2183 	ldw	x, (0x05, sp)
      008CBF 89               [ 2] 2184 	pushw	x
      008CC0 CD 9C A4         [ 4] 2185 	call	_adc_to_volt
      008CC3 5B 04            [ 2] 2186 	addw	sp, #4
      008CC5 16 0B            [ 2] 2187 	ldw	y, (0x0b, sp)
      008CC7 90 FF            [ 2] 2188 	ldw	(y), x
                                   2189 ;	main.c: 522: ch = 2;
      008CC9 A6 02            [ 1] 2190 	ld	a, #0x02
      008CCB 6B 05            [ 1] 2191 	ld	(0x05, sp), a
                                   2192 ;	main.c: 529: ch1 = '0' + (val / 10000) % 10;
      008CCD 1E 03            [ 2] 2193 	ldw	x, (0x03, sp)
      008CCF 90 AE 27 10      [ 2] 2194 	ldw	y, #0x2710
      008CD3 65               [ 2] 2195 	divw	x, y
      008CD4 90 AE 00 0A      [ 2] 2196 	ldw	y, #0x000a
      008CD8 65               [ 2] 2197 	divw	x, y
      008CD9 90 9F            [ 1] 2198 	ld	a, yl
      008CDB AB 30            [ 1] 2199 	add	a, #0x30
      008CDD 6B 02            [ 1] 2200 	ld	(0x02, sp), a
                                   2201 ;	main.c: 530: ch2 = '0' + (val / 1000) % 10;
      008CDF 1E 03            [ 2] 2202 	ldw	x, (0x03, sp)
      008CE1 90 AE 03 E8      [ 2] 2203 	ldw	y, #0x03e8
      008CE5 65               [ 2] 2204 	divw	x, y
      008CE6 90 AE 00 0A      [ 2] 2205 	ldw	y, #0x000a
      008CEA 65               [ 2] 2206 	divw	x, y
      008CEB 90 9F            [ 1] 2207 	ld	a, yl
      008CED AB 30            [ 1] 2208 	add	a, #0x30
      008CEF 6B 01            [ 1] 2209 	ld	(0x01, sp), a
                                   2210 ;	main.c: 531: ch3 = '0' + (val / 100) % 10;
      008CF1 1E 03            [ 2] 2211 	ldw	x, (0x03, sp)
      008CF3 90 AE 00 64      [ 2] 2212 	ldw	y, #0x0064
      008CF7 65               [ 2] 2213 	divw	x, y
      008CF8 90 AE 00 0A      [ 2] 2214 	ldw	y, #0x000a
      008CFC 65               [ 2] 2215 	divw	x, y
      008CFD 90 9F            [ 1] 2216 	ld	a, yl
      008CFF AB 30            [ 1] 2217 	add	a, #0x30
      008D01 95               [ 1] 2218 	ld	xh, a
                                   2219 ;	main.c: 532: ch4 = '0' + (val / 10 ) % 10;
      008D02 89               [ 2] 2220 	pushw	x
      008D03 1E 05            [ 2] 2221 	ldw	x, (0x05, sp)
      008D05 90 AE 00 0A      [ 2] 2222 	ldw	y, #0x000a
      008D09 65               [ 2] 2223 	divw	x, y
      008D0A 1F 11            [ 2] 2224 	ldw	(0x11, sp), x
      008D0C 1E 11            [ 2] 2225 	ldw	x, (0x11, sp)
      008D0E 90 AE 00 0A      [ 2] 2226 	ldw	y, #0x000a
      008D12 65               [ 2] 2227 	divw	x, y
      008D13 90 9F            [ 1] 2228 	ld	a, yl
      008D15 85               [ 2] 2229 	popw	x
      008D16 AB 30            [ 1] 2230 	add	a, #0x30
                                   2231 ;	main.c: 534: display_show(ch1, 0, ch2, 1, ch3, 0, ch4, 0);
      008D18 4B 00            [ 1] 2232 	push	#0x00
      008D1A 88               [ 1] 2233 	push	a
      008D1B 4B 00            [ 1] 2234 	push	#0x00
      008D1D 9E               [ 1] 2235 	ld	a, xh
      008D1E 88               [ 1] 2236 	push	a
      008D1F 4B 01            [ 1] 2237 	push	#0x01
      008D21 7B 06            [ 1] 2238 	ld	a, (0x06, sp)
      008D23 88               [ 1] 2239 	push	a
      008D24 4B 00            [ 1] 2240 	push	#0x00
      008D26 7B 09            [ 1] 2241 	ld	a, (0x09, sp)
      008D28 88               [ 1] 2242 	push	a
      008D29 CD 93 D1         [ 4] 2243 	call	_display_show
      008D2C 5B 08            [ 2] 2244 	addw	sp, #8
                                   2245 ;	main.c: 537: }
      008D2E                       2246 00108$:
                                   2247 ;	main.c: 539: adc_start(ch);
      008D2E 7B 05            [ 1] 2248 	ld	a, (0x05, sp)
      008D30 88               [ 1] 2249 	push	a
      008D31 CD 9C 88         [ 4] 2250 	call	_adc_start
      008D34 84               [ 1] 2251 	pop	a
      008D35                       2252 00111$:
      008D35 5B 13            [ 2] 2253 	addw	sp, #19
      008D37 81               [ 4] 2254 	ret
                                   2255 ;	main.c: 543: void ensure_afr0_set(void)
                                   2256 ;	-----------------------------------------
                                   2257 ;	 function ensure_afr0_set
                                   2258 ;	-----------------------------------------
      008D38                       2259 _ensure_afr0_set:
                                   2260 ;	main.c: 545: if ((OPT2 & 1) == 0) {
      008D38 AE 48 03         [ 2] 2261 	ldw	x, #0x4803
      008D3B F6               [ 1] 2262 	ld	a, (x)
      008D3C 44               [ 1] 2263 	srl	a
      008D3D 25 22            [ 1] 2264 	jrc	00110$
                                   2265 ;	main.c: 546: uart_flush_writes();
      008D3F CD 97 59         [ 4] 2266 	call	_uart_flush_writes
                                   2267 ;	main.c: 547: if (eeprom_set_afr0()) {
      008D42 CD 97 84         [ 4] 2268 	call	_eeprom_set_afr0
      008D45 4D               [ 1] 2269 	tnz	a
      008D46 27 11            [ 1] 2270 	jreq	00105$
                                   2271 ;	main.c: 548: uart_write_str("AFR0 set, reseting the unit\r\n");
      008D48 AE 92 6D         [ 2] 2272 	ldw	x, #___str_97+0
      008D4B 89               [ 2] 2273 	pushw	x
      008D4C CD 94 79         [ 4] 2274 	call	_uart_write_str
      008D4F 85               [ 2] 2275 	popw	x
                                   2276 ;	main.c: 549: uart_flush_writes();
      008D50 CD 97 59         [ 4] 2277 	call	_uart_flush_writes
                                   2278 ;	main.c: 50: IWDG_KR = 0xCC; // Enable IWDG
      008D53 35 CC 50 E0      [ 1] 2279 	mov	0x50e0+0, #0xcc
                                   2280 ;	main.c: 551: while (1); // Force a reset in a few msec
      008D57                       2281 00102$:
      008D57 20 FE            [ 2] 2282 	jra	00102$
      008D59                       2283 00105$:
                                   2284 ;	main.c: 554: uart_write_str("AFR0 not set and programming failed!\r\n");
      008D59 AE 92 8B         [ 2] 2285 	ldw	x, #___str_98+0
      008D5C 89               [ 2] 2286 	pushw	x
      008D5D CD 94 79         [ 4] 2287 	call	_uart_write_str
      008D60 85               [ 2] 2288 	popw	x
      008D61                       2289 00110$:
      008D61 81               [ 4] 2290 	ret
                                   2291 ;	main.c: 559: int main()
                                   2292 ;	-----------------------------------------
                                   2293 ;	 function main
                                   2294 ;	-----------------------------------------
      008D62                       2295 _main:
                                   2296 ;	main.c: 439: PA_ODR = 0;
      008D62 35 00 50 00      [ 1] 2297 	mov	0x5000+0, #0x00
                                   2298 ;	main.c: 440: PA_DDR = (1<<1) | (1<<2);
      008D66 35 06 50 02      [ 1] 2299 	mov	0x5002+0, #0x06
                                   2300 ;	main.c: 441: PA_CR1 = (1<<1) | (1<<2) | (1<<3);
      008D6A 35 0E 50 03      [ 1] 2301 	mov	0x5003+0, #0x0e
                                   2302 ;	main.c: 442: PA_CR2 = (1<<1) | (1<<2) | (1<<3);
      008D6E 35 0E 50 04      [ 1] 2303 	mov	0x5004+0, #0x0e
                                   2304 ;	main.c: 446: PB_ODR = (1<<4); // For safety we start with off-state
      008D72 35 10 50 05      [ 1] 2305 	mov	0x5005+0, #0x10
                                   2306 ;	main.c: 447: PB_DDR = (1<<4);
      008D76 35 10 50 07      [ 1] 2307 	mov	0x5007+0, #0x10
                                   2308 ;	main.c: 448: PB_CR1 = (1<<4);
      008D7A 35 10 50 08      [ 1] 2309 	mov	0x5008+0, #0x10
                                   2310 ;	main.c: 449: PB_CR2 = 0;
      008D7E 35 00 50 09      [ 1] 2311 	mov	0x5009+0, #0x00
                                   2312 ;	main.c: 456: PC_ODR = 0;
      008D82 35 00 50 0A      [ 1] 2313 	mov	0x500a+0, #0x00
                                   2314 ;	main.c: 457: PC_DDR = (1<<5) || (1<<6);
      008D86 35 01 50 0C      [ 1] 2315 	mov	0x500c+0, #0x01
                                   2316 ;	main.c: 458: PC_CR1 = (1<<7); // For the button
      008D8A 35 80 50 0D      [ 1] 2317 	mov	0x500d+0, #0x80
                                   2318 ;	main.c: 459: PC_CR2 = (1<<5) | (1<<6);
      008D8E 35 60 50 0E      [ 1] 2319 	mov	0x500e+0, #0x60
                                   2320 ;	main.c: 465: PD_DDR = (1<<4);
      008D92 35 10 50 11      [ 1] 2321 	mov	0x5011+0, #0x10
                                   2322 ;	main.c: 466: PD_CR1 = (1<<1) | (1<<4); // For the button
      008D96 35 12 50 12      [ 1] 2323 	mov	0x5012+0, #0x12
                                   2324 ;	main.c: 467: PD_CR2 = (1<<4);
      008D9A 35 10 50 13      [ 1] 2325 	mov	0x5013+0, #0x10
                                   2326 ;	main.c: 431: CLK_CKDIVR = 0x00; // Set the frequency to 16 MHz
      008D9E 35 00 50 C6      [ 1] 2327 	mov	0x50c6+0, #0x00
                                   2328 ;	main.c: 565: uart_init();
      008DA2 CD 94 31         [ 4] 2329 	call	_uart_init
                                   2330 ;	main.c: 566: pwm_init();
      008DA5 CD 98 3F         [ 4] 2331 	call	_pwm_init
                                   2332 ;	main.c: 567: adc_init();
      008DA8 CD 9C 6F         [ 4] 2333 	call	_adc_init
                                   2334 ;	main.c: 569: config_load();
      008DAB CD 8B A0         [ 4] 2335 	call	_config_load
                                   2336 ;	main.c: 571: uart_write_str("\r\n" MODEL " starting: Version " FW_VERSION "\r\n");
      008DAE AE 92 B2         [ 2] 2337 	ldw	x, #___str_99+0
      008DB1 89               [ 2] 2338 	pushw	x
      008DB2 CD 94 79         [ 4] 2339 	call	_uart_write_str
      008DB5 85               [ 2] 2340 	popw	x
                                   2341 ;	main.c: 573: ensure_afr0_set();
      008DB6 CD 8D 38         [ 4] 2342 	call	_ensure_afr0_set
                                   2343 ;	main.c: 50: IWDG_KR = 0xCC; // Enable IWDG
      008DB9 35 CC 50 E0      [ 1] 2344 	mov	0x50e0+0, #0xcc
                                   2345 ;	main.c: 576: adc_start(4);
      008DBD 4B 04            [ 1] 2346 	push	#0x04
      008DBF CD 9C 88         [ 4] 2347 	call	_adc_start
      008DC2 84               [ 1] 2348 	pop	a
                                   2349 ;	main.c: 577: commit_output();
      008DC3 CD 80 A0         [ 4] 2350 	call	_commit_output
                                   2351 ;	main.c: 579: do {
      008DC6                       2352 00103$:
                                   2353 ;	main.c: 56: IWDG_KR = 0xAA; // Reset the counter
      008DC6 35 AA 50 E0      [ 1] 2354 	mov	0x50e0+0, #0xaa
                                   2355 ;	main.c: 581: read_state();
      008DCA CD 8B D4         [ 4] 2356 	call	_read_state
                                   2357 ;	main.c: 582: display_refresh();
      008DCD CD 92 D4         [ 4] 2358 	call	_display_refresh
                                   2359 ;	main.c: 583: uart_drive();
      008DD0 CD 97 3F         [ 4] 2360 	call	_uart_drive
                                   2361 ;	main.c: 584: if (read_newline) {
      008DD3 72 5D 01 A3      [ 1] 2362 	tnz	_read_newline+0
      008DD7 27 ED            [ 1] 2363 	jreq	00103$
                                   2364 ;	main.c: 585: process_input();
      008DD9 CD 83 F7         [ 4] 2365 	call	_process_input
                                   2366 ;	main.c: 587: } while(1);
      008DDC 20 E8            [ 2] 2367 	jra	00103$
      008DDE 81               [ 4] 2368 	ret
                                   2369 	.area CODE
      008DDF                       2370 ___str_0:
      008DDF 53 4E 41 4D 45 3A 20  2371 	.ascii "SNAME: "
      008DE6 00                    2372 	.db 0x00
      008DE7                       2373 ___str_1:
      008DE7 0D                    2374 	.db 0x0D
      008DE8 0A                    2375 	.db 0x0A
      008DE9 00                    2376 	.db 0x00
      008DEA                       2377 ___str_2:
      008DEA 41 55 54 4F 43 4F 4D  2378 	.ascii "AUTOCOMMIT OFF: CHANGE PENDING ON COMMIT"
             4D 49 54 20 4F 46 46
             3A 20 43 48 41 4E 47
             45 20 50 45 4E 44 49
             4E 47 20 4F 4E 20 43
             4F 4D 4D 49 54
      008E12 0D                    2379 	.db 0x0D
      008E13 0A                    2380 	.db 0x0A
      008E14 00                    2381 	.db 0x00
      008E15                       2382 ___str_3:
      008E15 4F 55 54 50 55 54 20  2383 	.ascii "OUTPUT takes either 0 for OFF or 1 for ON, received: "
             74 61 6B 65 73 20 65
             69 74 68 65 72 20 30
             20 66 6F 72 20 4F 46
             46 20 6F 72 20 31 20
             66 6F 72 20 4F 4E 2C
             20 72 65 63 65 69 76
             65 64 3A 20
      008E4A 22                    2384 	.db 0x22
      008E4B 00                    2385 	.db 0x00
      008E4C                       2386 ___str_4:
      008E4C 22                    2387 	.db 0x22
      008E4D 0D                    2388 	.db 0x0D
      008E4E 0A                    2389 	.db 0x0A
      008E4F 00                    2390 	.db 0x00
      008E50                       2391 ___str_5:
      008E50 4F 55 54 50 55 54 3A  2392 	.ascii "OUTPUT: OFF"
             20 4F 46 46
      008E5B 0D                    2393 	.db 0x0D
      008E5C 0A                    2394 	.db 0x0A
      008E5D 00                    2395 	.db 0x00
      008E5E                       2396 ___str_6:
      008E5E 4F 55 54 50 55 54 3A  2397 	.ascii "OUTPUT: ON"
             20 4F 4E
      008E68 0D                    2398 	.db 0x0D
      008E69 0A                    2399 	.db 0x0A
      008E6A 00                    2400 	.db 0x00
      008E6B                       2401 ___str_7:
      008E6B 56 4F 4C 54 41 47 45  2402 	.ascii "VOLTAGE VALUE TOO HIGH"
             20 56 41 4C 55 45 20
             54 4F 4F 20 48 49 47
             48
      008E81 0D                    2403 	.db 0x0D
      008E82 0A                    2404 	.db 0x0A
      008E83 00                    2405 	.db 0x00
      008E84                       2406 ___str_8:
      008E84 56 4F 4C 54 41 47 45  2407 	.ascii "VOLTAGE VALUE TOO LOW"
             20 56 41 4C 55 45 20
             54 4F 4F 20 4C 4F 57
      008E99 0D                    2408 	.db 0x0D
      008E9A 0A                    2409 	.db 0x0A
      008E9B 00                    2410 	.db 0x00
      008E9C                       2411 ___str_9:
      008E9C 56 4F 4C 54 41 47 45  2412 	.ascii "VOLTAGE: SET "
             3A 20 53 45 54 20
      008EA9 00                    2413 	.db 0x00
      008EAA                       2414 ___str_10:
      008EAA 43 55 52 52 45 4E 54  2415 	.ascii "CURRENT VALUE TOO HIGH"
             20 56 41 4C 55 45 20
             54 4F 4F 20 48 49 47
             48
      008EC0 0D                    2416 	.db 0x0D
      008EC1 0A                    2417 	.db 0x0A
      008EC2 00                    2418 	.db 0x00
      008EC3                       2419 ___str_11:
      008EC3 43 55 52 52 45 4E 54  2420 	.ascii "CURRENT VALUE TOO LOW"
             20 56 41 4C 55 45 20
             54 4F 4F 20 4C 4F 57
      008ED8 0D                    2421 	.db 0x0D
      008ED9 0A                    2422 	.db 0x0A
      008EDA 00                    2423 	.db 0x00
      008EDB                       2424 ___str_12:
      008EDB 43 55 52 52 45 4E 54  2425 	.ascii "CURRENT: SET "
             3A 20 53 45 54 20
      008EE8 00                    2426 	.db 0x00
      008EE9                       2427 ___str_13:
      008EE9 31                    2428 	.ascii "1"
      008EEA 00                    2429 	.db 0x00
      008EEB                       2430 ___str_14:
      008EEB 59 45 53              2431 	.ascii "YES"
      008EEE 00                    2432 	.db 0x00
      008EEF                       2433 ___str_15:
      008EEF 41 55 54 4F 43 4F 4D  2434 	.ascii "AUTOCOMMIT: YES"
             4D 49 54 3A 20 59 45
             53
      008EFE 0D                    2435 	.db 0x0D
      008EFF 0A                    2436 	.db 0x0A
      008F00 00                    2437 	.db 0x00
      008F01                       2438 ___str_16:
      008F01 30                    2439 	.ascii "0"
      008F02 00                    2440 	.db 0x00
      008F03                       2441 ___str_17:
      008F03 4E 4F                 2442 	.ascii "NO"
      008F05 00                    2443 	.db 0x00
      008F06                       2444 ___str_18:
      008F06 41 55 54 4F 43 4F 4D  2445 	.ascii "AUTOCOMMIT: NO"
             4D 49 54 3A 20 4E 4F
      008F14 0D                    2446 	.db 0x0D
      008F15 0A                    2447 	.db 0x0A
      008F16 00                    2448 	.db 0x00
      008F17                       2449 ___str_19:
      008F17 55 4E 4B 4E 4F 57 4E  2450 	.ascii "UNKNOWN AUTOCOMMIT ARG: "
             20 41 55 54 4F 43 4F
             4D 4D 49 54 20 41 52
             47 3A 20
      008F2F 00                    2451 	.db 0x00
      008F30                       2452 ___str_20:
      008F30 4F 4E                 2453 	.ascii "ON"
      008F32 00                    2454 	.db 0x00
      008F33                       2455 ___str_21:
      008F33 4F 46 46              2456 	.ascii "OFF"
      008F36 00                    2457 	.db 0x00
      008F37                       2458 ___str_22:
      008F37 46 41 49 4C 45 44 20  2459 	.ascii "FAILED TO PARSE "
             54 4F 20 50 41 52 53
             45 20
      008F47 00                    2460 	.db 0x00
      008F48                       2461 ___str_23:
      008F48 20 46 4F 52 20        2462 	.ascii " FOR "
      008F4D 00                    2463 	.db 0x00
      008F4E                       2464 ___str_24:
      008F4E 43 41 4C 49 42 52 41  2465 	.ascii "CALIBRATION SET "
             54 49 4F 4E 20 53 45
             54 20
      008F5E 00                    2466 	.db 0x00
      008F5F                       2467 ___str_25:
      008F5F 4D 4F 44 45 4C        2468 	.ascii "MODEL"
      008F64 00                    2469 	.db 0x00
      008F65                       2470 ___str_26:
      008F65 4D 4F 44 45 4C 3A 20  2471 	.ascii "MODEL: B3603"
             42 33 36 30 33
      008F71 0D                    2472 	.db 0x0D
      008F72 0A                    2473 	.db 0x0A
      008F73 00                    2474 	.db 0x00
      008F74                       2475 ___str_27:
      008F74 56 45 52 53 49 4F 4E  2476 	.ascii "VERSION"
      008F7B 00                    2477 	.db 0x00
      008F7C                       2478 ___str_28:
      008F7C 56 45 52 53 49 4F 4E  2479 	.ascii "VERSION: 1.0.1"
             3A 20 31 2E 30 2E 31
      008F8A 0D                    2480 	.db 0x0D
      008F8B 0A                    2481 	.db 0x0A
      008F8C 00                    2482 	.db 0x00
      008F8D                       2483 ___str_29:
      008F8D 53 59 53 54 45 4D     2484 	.ascii "SYSTEM"
      008F93 00                    2485 	.db 0x00
      008F94                       2486 ___str_30:
      008F94 4D 4F 44 45 4C 3A 20  2487 	.ascii "MODEL: B3603"
             42 33 36 30 33
      008FA0 0D                    2488 	.db 0x0D
      008FA1 0A                    2489 	.db 0x0A
      008FA2 56 45 52 53 49 4F 4E  2490 	.ascii "VERSION: 1.0.1"
             3A 20 31 2E 30 2E 31
      008FB0 0D                    2491 	.db 0x0D
      008FB1 0A                    2492 	.db 0x0A
      008FB2 00                    2493 	.db 0x00
      008FB3                       2494 ___str_31:
      008FB3 4E 41 4D 45 3A 20     2495 	.ascii "NAME: "
      008FB9 00                    2496 	.db 0x00
      008FBA                       2497 ___str_32:
      008FBA 4F 4E 53 54 41 52 54  2498 	.ascii "ONSTARTUP: "
             55 50 3A 20
      008FC5 00                    2499 	.db 0x00
      008FC6                       2500 ___str_33:
      008FC6 41 55 54 4F 43 4F 4D  2501 	.ascii "AUTOCOMMIT: "
             4D 49 54 3A 20
      008FD2 00                    2502 	.db 0x00
      008FD3                       2503 ___str_34:
      008FD3 43 41 4C 49 42 52 41  2504 	.ascii "CALIBRATION"
             54 49 4F 4E
      008FDE 00                    2505 	.db 0x00
      008FDF                       2506 ___str_35:
      008FDF 43 41 4C 49 42 52 41  2507 	.ascii "CALIBRATE VIN ADC: "
             54 45 20 56 49 4E 20
             41 44 43 3A 20
      008FF2 00                    2508 	.db 0x00
      008FF3                       2509 ___str_36:
      008FF3 43 41 4C 49 42 52 41  2510 	.ascii "CALIBRATE VOUT ADC: "
             54 45 20 56 4F 55 54
             20 41 44 43 3A 20
      009007 00                    2511 	.db 0x00
      009008                       2512 ___str_37:
      009008 43 41 4C 49 42 52 41  2513 	.ascii "CALIBRATE COUT ADC: "
             54 45 20 43 4F 55 54
             20 41 44 43 3A 20
      00901C 00                    2514 	.db 0x00
      00901D                       2515 ___str_38:
      00901D 43 41 4C 49 42 52 41  2516 	.ascii "CALIBRATE VOUT PWM: "
             54 45 20 56 4F 55 54
             20 50 57 4D 3A 20
      009031 00                    2517 	.db 0x00
      009032                       2518 ___str_39:
      009032 43 41 4C 49 42 52 41  2519 	.ascii "CALIBRATE COUT PWM: "
             54 45 20 43 4F 55 54
             20 50 57 4D 3A 20
      009046 00                    2520 	.db 0x00
      009047                       2521 ___str_40:
      009047 52 43 41 4C 49 42 52  2522 	.ascii "RCALIBRATION"
             41 54 49 4F 4E
      009053 00                    2523 	.db 0x00
      009054                       2524 ___str_41:
      009054 4C 49 4D 49 54 53     2525 	.ascii "LIMITS"
      00905A 00                    2526 	.db 0x00
      00905B                       2527 ___str_42:
      00905B 4C 49 4D 49 54 53 3A  2528 	.ascii "LIMITS:"
      009062 0D                    2529 	.db 0x0D
      009063 0A                    2530 	.db 0x0A
      009064 00                    2531 	.db 0x00
      009065                       2532 ___str_43:
      009065 56 4D 49 4E 3A 20     2533 	.ascii "VMIN: "
      00906B 00                    2534 	.db 0x00
      00906C                       2535 ___str_44:
      00906C 56 4D 41 58 3A 20     2536 	.ascii "VMAX: "
      009072 00                    2537 	.db 0x00
      009073                       2538 ___str_45:
      009073 56 53 54 45 50 3A 20  2539 	.ascii "VSTEP: "
      00907A 00                    2540 	.db 0x00
      00907B                       2541 ___str_46:
      00907B 43 4D 49 4E 3A 20     2542 	.ascii "CMIN: "
      009081 00                    2543 	.db 0x00
      009082                       2544 ___str_47:
      009082 43 4D 41 58 3A 20     2545 	.ascii "CMAX: "
      009088 00                    2546 	.db 0x00
      009089                       2547 ___str_48:
      009089 43 53 54 45 50 3A 20  2548 	.ascii "CSTEP: "
      009090 00                    2549 	.db 0x00
      009091                       2550 ___str_49:
      009091 43 4F 4E 46 49 47     2551 	.ascii "CONFIG"
      009097 00                    2552 	.db 0x00
      009098                       2553 ___str_50:
      009098 43 4F 4E 46 49 47 3A  2554 	.ascii "CONFIG:"
      00909F 0D                    2555 	.db 0x0D
      0090A0 0A                    2556 	.db 0x0A
      0090A1 00                    2557 	.db 0x00
      0090A2                       2558 ___str_51:
      0090A2 4F 55 54 50 55 54 3A  2559 	.ascii "OUTPUT: "
             20
      0090AA 00                    2560 	.db 0x00
      0090AB                       2561 ___str_52:
      0090AB 56 53 45 54 3A 20     2562 	.ascii "VSET: "
      0090B1 00                    2563 	.db 0x00
      0090B2                       2564 ___str_53:
      0090B2 43 53 45 54 3A 20     2565 	.ascii "CSET: "
      0090B8 00                    2566 	.db 0x00
      0090B9                       2567 ___str_54:
      0090B9 56 53 48 55 54 44 4F  2568 	.ascii "VSHUTDOWN: "
             57 4E 3A 20
      0090C4 00                    2569 	.db 0x00
      0090C5                       2570 ___str_55:
      0090C5 43 53 48 55 54 44 4F  2571 	.ascii "CSHUTDOWN: "
             57 4E 3A 20
      0090D0 00                    2572 	.db 0x00
      0090D1                       2573 ___str_56:
      0090D1 53 54 41 54 55 53     2574 	.ascii "STATUS"
      0090D7 00                    2575 	.db 0x00
      0090D8                       2576 ___str_57:
      0090D8 53 54 41 54 55 53 3A  2577 	.ascii "STATUS:"
      0090DF 0D                    2578 	.db 0x0D
      0090E0 0A                    2579 	.db 0x0A
      0090E1 00                    2580 	.db 0x00
      0090E2                       2581 ___str_58:
      0090E2 56 49 4E 3A 20        2582 	.ascii "VIN: "
      0090E7 00                    2583 	.db 0x00
      0090E8                       2584 ___str_59:
      0090E8 56 4F 55 54 3A 20     2585 	.ascii "VOUT: "
      0090EE 00                    2586 	.db 0x00
      0090EF                       2587 ___str_60:
      0090EF 43 4F 55 54 3A 20     2588 	.ascii "COUT: "
      0090F5 00                    2589 	.db 0x00
      0090F6                       2590 ___str_61:
      0090F6 43 4F 4E 53 54 41 4E  2591 	.ascii "CONSTANT: "
             54 3A 20
      009100 00                    2592 	.db 0x00
      009101                       2593 ___str_62:
      009101 43 55 52 52 45 4E 54  2594 	.ascii "CURRENT"
      009108 00                    2595 	.db 0x00
      009109                       2596 ___str_63:
      009109 56 4F 4C 54 41 47 45  2597 	.ascii "VOLTAGE"
      009110 00                    2598 	.db 0x00
      009111                       2599 ___str_64:
      009111 52 53 54 41 54 55 53  2600 	.ascii "RSTATUS"
      009118 00                    2601 	.db 0x00
      009119                       2602 ___str_65:
      009119 52 53 54 41 54 55 53  2603 	.ascii "RSTATUS:"
             3A
      009121 0D                    2604 	.db 0x0D
      009122 0A                    2605 	.db 0x0A
      009123 00                    2606 	.db 0x00
      009124                       2607 ___str_66:
      009124 56 49 4E 20 41 44 43  2608 	.ascii "VIN ADC: "
             3A 20
      00912D 00                    2609 	.db 0x00
      00912E                       2610 ___str_67:
      00912E 56 4F 55 54 20 41 44  2611 	.ascii "VOUT ADC: "
             43 3A 20
      009138 00                    2612 	.db 0x00
      009139                       2613 ___str_68:
      009139 43 4F 55 54 20 41 44  2614 	.ascii "COUT ADC: "
             43 3A 20
      009143 00                    2615 	.db 0x00
      009144                       2616 ___str_69:
      009144 43 4F 4D 4D 49 54     2617 	.ascii "COMMIT"
      00914A 00                    2618 	.db 0x00
      00914B                       2619 ___str_70:
      00914B 53 41 56 45           2620 	.ascii "SAVE"
      00914F 00                    2621 	.db 0x00
      009150                       2622 ___str_71:
      009150 53 41 56 45 44        2623 	.ascii "SAVED"
      009155 0D                    2624 	.db 0x0D
      009156 0A                    2625 	.db 0x0A
      009157 00                    2626 	.db 0x00
      009158                       2627 ___str_72:
      009158 4C 4F 41 44           2628 	.ascii "LOAD"
      00915C 00                    2629 	.db 0x00
      00915D                       2630 ___str_73:
      00915D 52 45 53 54 4F 52 45  2631 	.ascii "RESTORE"
      009164 00                    2632 	.db 0x00
      009165                       2633 ___str_74:
      009165 53 4E 41 4D 45        2634 	.ascii "SNAME"
      00916A 00                    2635 	.db 0x00
      00916B                       2636 ___str_75:
      00916B 4F 55 54 50 55 54     2637 	.ascii "OUTPUT"
      009171 00                    2638 	.db 0x00
      009172                       2639 ___str_76:
      009172 41 55 54 4F 43 4F 4D  2640 	.ascii "AUTOCOMMIT"
             4D 49 54
      00917C 00                    2641 	.db 0x00
      00917D                       2642 ___str_77:
      00917D 43 41 4C 56 4F 55 54  2643 	.ascii "CALVOUTADCA"
             41 44 43 41
      009188 00                    2644 	.db 0x00
      009189                       2645 ___str_78:
      009189 41 44 43 20 56 4F 55  2646 	.ascii "ADC VOUT A"
             54 20 41
      009193 00                    2647 	.db 0x00
      009194                       2648 ___str_79:
      009194 43 41 4C 56 4F 55 54  2649 	.ascii "CALVOUTADCB"
             41 44 43 42
      00919F 00                    2650 	.db 0x00
      0091A0                       2651 ___str_80:
      0091A0 41 44 43 20 56 4F 55  2652 	.ascii "ADC VOUT B"
             54 20 42
      0091AA 00                    2653 	.db 0x00
      0091AB                       2654 ___str_81:
      0091AB 43 41 4C 56 4F 55 54  2655 	.ascii "CALVOUTPWMA"
             50 57 4D 41
      0091B6 00                    2656 	.db 0x00
      0091B7                       2657 ___str_82:
      0091B7 50 57 4D 20 56 4F 55  2658 	.ascii "PWM VOUT A"
             54 20 41
      0091C1 00                    2659 	.db 0x00
      0091C2                       2660 ___str_83:
      0091C2 43 41 4C 56 4F 55 54  2661 	.ascii "CALVOUTPWMB"
             50 57 4D 42
      0091CD 00                    2662 	.db 0x00
      0091CE                       2663 ___str_84:
      0091CE 50 57 4D 20 56 4F 55  2664 	.ascii "PWM VOUT B"
             54 20 42
      0091D8 00                    2665 	.db 0x00
      0091D9                       2666 ___str_85:
      0091D9 43 41 4C 43 4F 55 54  2667 	.ascii "CALCOUTADCA"
             41 44 43 41
      0091E4 00                    2668 	.db 0x00
      0091E5                       2669 ___str_86:
      0091E5 41 44 43 20 43 4F 55  2670 	.ascii "ADC COUT A"
             54 20 41
      0091EF 00                    2671 	.db 0x00
      0091F0                       2672 ___str_87:
      0091F0 43 41 4C 43 4F 55 54  2673 	.ascii "CALCOUTADCB"
             41 44 43 42
      0091FB 00                    2674 	.db 0x00
      0091FC                       2675 ___str_88:
      0091FC 41 44 43 20 43 4F 55  2676 	.ascii "ADC COUT B"
             54 20 42
      009206 00                    2677 	.db 0x00
      009207                       2678 ___str_89:
      009207 43 41 4C 43 4F 55 54  2679 	.ascii "CALCOUTPWMA"
             50 57 4D 41
      009212 00                    2680 	.db 0x00
      009213                       2681 ___str_90:
      009213 50 57 4D 20 43 4F 55  2682 	.ascii "PWM COUT A"
             54 20 41
      00921D 00                    2683 	.db 0x00
      00921E                       2684 ___str_91:
      00921E 43 41 4C 43 4F 55 54  2685 	.ascii "CALCOUTPWMB"
             50 57 4D 42
      009229 00                    2686 	.db 0x00
      00922A                       2687 ___str_92:
      00922A 50 57 4D 20 43 4F 55  2688 	.ascii "PWM COUT B"
             54 20 42
      009234 00                    2689 	.db 0x00
      009235                       2690 ___str_93:
      009235 55 4E 4B 4E 4F 57 4E  2691 	.ascii "UNKNOWN COMMAND!"
             20 43 4F 4D 4D 41 4E
             44 21
      009245 0D                    2692 	.db 0x0D
      009246 0A                    2693 	.db 0x0A
      009247 00                    2694 	.db 0x00
      009248                       2695 ___str_94:
      009248 55 4E 4B 4E 4F 57 4E  2696 	.ascii "UNKNOWN COMMAND"
             20 43 4F 4D 4D 41 4E
             44
      009257 0D                    2697 	.db 0x0D
      009258 0A                    2698 	.db 0x0A
      009259 00                    2699 	.db 0x00
      00925A                       2700 ___str_95:
      00925A 44 4F 4E 45           2701 	.ascii "DONE"
      00925E 0D                    2702 	.db 0x0D
      00925F 0A                    2703 	.db 0x0A
      009260 00                    2704 	.db 0x00
      009261                       2705 ___str_96:
      009261 50 43 33 20 69 73 20  2706 	.ascii "PC3 is now "
             6E 6F 77 20
      00926C 00                    2707 	.db 0x00
      00926D                       2708 ___str_97:
      00926D 41 46 52 30 20 73 65  2709 	.ascii "AFR0 set, reseting the unit"
             74 2C 20 72 65 73 65
             74 69 6E 67 20 74 68
             65 20 75 6E 69 74
      009288 0D                    2710 	.db 0x0D
      009289 0A                    2711 	.db 0x0A
      00928A 00                    2712 	.db 0x00
      00928B                       2713 ___str_98:
      00928B 41 46 52 30 20 6E 6F  2714 	.ascii "AFR0 not set and programming failed!"
             74 20 73 65 74 20 61
             6E 64 20 70 72 6F 67
             72 61 6D 6D 69 6E 67
             20 66 61 69 6C 65 64
             21
      0092AF 0D                    2715 	.db 0x0D
      0092B0 0A                    2716 	.db 0x0A
      0092B1 00                    2717 	.db 0x00
      0092B2                       2718 ___str_99:
      0092B2 0D                    2719 	.db 0x0D
      0092B3 0A                    2720 	.db 0x0A
      0092B4 42 33 36 30 33 20 73  2721 	.ascii "B3603 starting: Version 1.0.1"
             74 61 72 74 69 6E 67
             3A 20 56 65 72 73 69
             6F 6E 20 31 2E 30 2E
             31
      0092D1 0D                    2722 	.db 0x0D
      0092D2 0A                    2723 	.db 0x0A
      0092D3 00                    2724 	.db 0x00
                                   2725 	.area INITIALIZER
                                   2726 	.area CABS (ABS)
