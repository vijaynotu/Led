                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Mon Mar 12 12:44:10 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module config
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _memcpy
                                     13 	.globl _eeprom_save_data
                                     14 	.globl _default_cfg_output
                                     15 	.globl _default_cfg_system
                                     16 	.globl _config_default_system
                                     17 	.globl _config_load_system
                                     18 	.globl _config_save_system
                                     19 	.globl _config_default_output
                                     20 	.globl _config_load_output
                                     21 	.globl _config_save_output
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
      0001B5                         30 _default_cfg_system::
      0001B5                         31 	.ds 61
      0001F2                         32 _default_cfg_output::
      0001F2                         33 	.ds 9
                                     34 ;--------------------------------------------------------
                                     35 ; absolute external ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area DABS (ABS)
                                     38 ;--------------------------------------------------------
                                     39 ; global & static initialisations
                                     40 ;--------------------------------------------------------
                                     41 	.area HOME
                                     42 	.area GSINIT
                                     43 	.area GSFINAL
                                     44 	.area GSINIT
                                     45 ;--------------------------------------------------------
                                     46 ; Home
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
                                     49 	.area HOME
                                     50 ;--------------------------------------------------------
                                     51 ; code
                                     52 ;--------------------------------------------------------
                                     53 	.area CODE
                                     54 ;	config.c: 55: void config_default_system(cfg_system_t *sys)
                                     55 ;	-----------------------------------------
                                     56 ;	 function config_default_system
                                     57 ;	-----------------------------------------
      0099F4                         58 _config_default_system:
                                     59 ;	config.c: 57: memcpy(sys, &default_cfg_system, sizeof(default_cfg_system));
      0099F4 AE 01 B5         [ 2]   60 	ldw	x, #_default_cfg_system+0
      0099F7 16 03            [ 2]   61 	ldw	y, (0x03, sp)
      0099F9 4B 3D            [ 1]   62 	push	#0x3d
      0099FB 4B 00            [ 1]   63 	push	#0x00
      0099FD 89               [ 2]   64 	pushw	x
      0099FE 90 89            [ 2]   65 	pushw	y
      009A00 CD 9E 93         [ 4]   66 	call	_memcpy
      009A03 5B 06            [ 2]   67 	addw	sp, #6
      009A05 81               [ 4]   68 	ret
                                     69 ;	config.c: 77: void config_load_system(cfg_system_t *sys)
                                     70 ;	-----------------------------------------
                                     71 ;	 function config_load_system
                                     72 ;	-----------------------------------------
      009A06                         73 _config_load_system:
      009A06 52 04            [ 2]   74 	sub	sp, #4
                                     75 ;	config.c: 82: memcpy(sys, SYSTEM_CONFIG, sizeof(*sys));
      009A08 1E 07            [ 2]   76 	ldw	x, (0x07, sp)
      009A0A 4B 3D            [ 1]   77 	push	#0x3d
      009A0C 4B 00            [ 1]   78 	push	#0x00
      009A0E 4B 00            [ 1]   79 	push	#0x00
      009A10 4B 40            [ 1]   80 	push	#0x40
      009A12 89               [ 2]   81 	pushw	x
      009A13 CD 9E 93         [ 4]   82 	call	_memcpy
      009A16 5B 06            [ 2]   83 	addw	sp, #6
                                     84 ;	config.c: 84: validate_system_config(sys);
      009A18 16 07            [ 2]   85 	ldw	y, (0x07, sp)
      009A1A 17 03            [ 2]   86 	ldw	(0x03, sp), y
      009A1C 16 03            [ 2]   87 	ldw	y, (0x03, sp)
      009A1E 17 01            [ 2]   88 	ldw	(0x01, sp), y
                                     89 ;	config.c: 62: if (sys->version != SYSTEM_CFG_VERSION ||
      009A20 1E 03            [ 2]   90 	ldw	x, (0x03, sp)
      009A22 F6               [ 1]   91 	ld	a, (x)
      009A23 A1 02            [ 1]   92 	cp	a, #0x02
      009A25 26 57            [ 1]   93 	jrne	00107$
                                     94 ;	config.c: 63: sys->name[0]  ||
      009A27 1E 03            [ 2]   95 	ldw	x, (0x03, sp)
      009A29 E6 01            [ 1]   96 	ld	a, (0x1, x)
      009A2B 4D               [ 1]   97 	tnz	a
      009A2C 26 50            [ 1]   98 	jrne	00107$
                                     99 ;	config.c: 64: sys->vin_adc.a  ||
      009A2E 1E 03            [ 2]  100 	ldw	x, (0x03, sp)
      009A30 89               [ 2]  101 	pushw	x
      009A31 EE 17            [ 2]  102 	ldw	x, (0x17, x)
      009A33 51               [ 1]  103 	exgw	x, y
      009A34 85               [ 2]  104 	popw	x
      009A35 EE 15            [ 2]  105 	ldw	x, (0x15, x)
      009A37 90 5D            [ 2]  106 	tnzw	y
      009A39 26 43            [ 1]  107 	jrne	00107$
      009A3B 5D               [ 2]  108 	tnzw	x
      009A3C 26 40            [ 1]  109 	jrne	00107$
                                    110 ;	config.c: 65: sys->vout_adc.a  ||
      009A3E 1E 03            [ 2]  111 	ldw	x, (0x03, sp)
      009A40 89               [ 2]  112 	pushw	x
      009A41 EE 1F            [ 2]  113 	ldw	x, (0x1f, x)
      009A43 51               [ 1]  114 	exgw	x, y
      009A44 85               [ 2]  115 	popw	x
      009A45 EE 1D            [ 2]  116 	ldw	x, (0x1d, x)
      009A47 90 5D            [ 2]  117 	tnzw	y
      009A49 26 33            [ 1]  118 	jrne	00107$
      009A4B 5D               [ 2]  119 	tnzw	x
      009A4C 26 30            [ 1]  120 	jrne	00107$
                                    121 ;	config.c: 66: sys->cout_adc.a  ||
      009A4E 1E 03            [ 2]  122 	ldw	x, (0x03, sp)
      009A50 89               [ 2]  123 	pushw	x
      009A51 EE 27            [ 2]  124 	ldw	x, (0x27, x)
      009A53 51               [ 1]  125 	exgw	x, y
      009A54 85               [ 2]  126 	popw	x
      009A55 EE 25            [ 2]  127 	ldw	x, (0x25, x)
      009A57 90 5D            [ 2]  128 	tnzw	y
      009A59 26 23            [ 1]  129 	jrne	00107$
      009A5B 5D               [ 2]  130 	tnzw	x
      009A5C 26 20            [ 1]  131 	jrne	00107$
                                    132 ;	config.c: 67: sys->vout_pwm.a  ||
      009A5E 1E 03            [ 2]  133 	ldw	x, (0x03, sp)
      009A60 89               [ 2]  134 	pushw	x
      009A61 EE 2F            [ 2]  135 	ldw	x, (0x2f, x)
      009A63 51               [ 1]  136 	exgw	x, y
      009A64 85               [ 2]  137 	popw	x
      009A65 EE 2D            [ 2]  138 	ldw	x, (0x2d, x)
      009A67 90 5D            [ 2]  139 	tnzw	y
      009A69 26 13            [ 1]  140 	jrne	00107$
      009A6B 5D               [ 2]  141 	tnzw	x
      009A6C 26 10            [ 1]  142 	jrne	00107$
                                    143 ;	config.c: 68: sys->cout_pwm.a
      009A6E 1E 03            [ 2]  144 	ldw	x, (0x03, sp)
      009A70 89               [ 2]  145 	pushw	x
      009A71 EE 37            [ 2]  146 	ldw	x, (0x37, x)
      009A73 51               [ 1]  147 	exgw	x, y
      009A74 85               [ 2]  148 	popw	x
      009A75 EE 35            [ 2]  149 	ldw	x, (0x35, x)
      009A77 90 5D            [ 2]  150 	tnzw	y
      009A79 26 03            [ 1]  151 	jrne	00148$
      009A7B 5D               [ 2]  152 	tnzw	x
      009A7C 27 07            [ 1]  153 	jreq	00110$
      009A7E                        154 00148$:
      009A7E                        155 00107$:
                                    156 ;	config.c: 71: config_default_system(sys);
      009A7E 1E 01            [ 2]  157 	ldw	x, (0x01, sp)
      009A80 89               [ 2]  158 	pushw	x
      009A81 CD 99 F4         [ 4]  159 	call	_config_default_system
      009A84 85               [ 2]  160 	popw	x
                                    161 ;	config.c: 84: validate_system_config(sys);
      009A85                        162 00110$:
      009A85 5B 04            [ 2]  163 	addw	sp, #4
      009A87 81               [ 4]  164 	ret
                                    165 ;	config.c: 87: void config_save_system(cfg_system_t *sys)
                                    166 ;	-----------------------------------------
                                    167 ;	 function config_save_system
                                    168 ;	-----------------------------------------
      009A88                        169 _config_save_system:
                                    170 ;	config.c: 89: eeprom_save_data((uint8_t*)SYSTEM_CONFIG, (uint8_t*)sys, sizeof(*sys));
      009A88 1E 03            [ 2]  171 	ldw	x, (0x03, sp)
      009A8A 4B 3D            [ 1]  172 	push	#0x3d
      009A8C 89               [ 2]  173 	pushw	x
      009A8D 4B 00            [ 1]  174 	push	#0x00
      009A8F 4B 40            [ 1]  175 	push	#0x40
      009A91 CD 97 E0         [ 4]  176 	call	_eeprom_save_data
      009A94 5B 05            [ 2]  177 	addw	sp, #5
      009A96 81               [ 4]  178 	ret
                                    179 ;	config.c: 92: void config_default_output(cfg_output_t *cfg)
                                    180 ;	-----------------------------------------
                                    181 ;	 function config_default_output
                                    182 ;	-----------------------------------------
      009A97                        183 _config_default_output:
                                    184 ;	config.c: 94: memcpy(cfg, &default_cfg_output, sizeof(default_cfg_output));
      009A97 AE 01 F2         [ 2]  185 	ldw	x, #_default_cfg_output+0
      009A9A 16 03            [ 2]  186 	ldw	y, (0x03, sp)
      009A9C 4B 09            [ 1]  187 	push	#0x09
      009A9E 4B 00            [ 1]  188 	push	#0x00
      009AA0 89               [ 2]  189 	pushw	x
      009AA1 90 89            [ 2]  190 	pushw	y
      009AA3 CD 9E 93         [ 4]  191 	call	_memcpy
      009AA6 5B 06            [ 2]  192 	addw	sp, #6
      009AA8 81               [ 4]  193 	ret
                                    194 ;	config.c: 104: void config_load_output(cfg_output_t *cfg)
                                    195 ;	-----------------------------------------
                                    196 ;	 function config_load_output
                                    197 ;	-----------------------------------------
      009AA9                        198 _config_load_output:
      009AA9 52 04            [ 2]  199 	sub	sp, #4
                                    200 ;	config.c: 109: memcpy(cfg, OUTPUT_CONFIG, sizeof(*cfg));
      009AAB 1E 07            [ 2]  201 	ldw	x, (0x07, sp)
      009AAD 4B 09            [ 1]  202 	push	#0x09
      009AAF 4B 00            [ 1]  203 	push	#0x00
      009AB1 4B 40            [ 1]  204 	push	#0x40
      009AB3 4B 40            [ 1]  205 	push	#0x40
      009AB5 89               [ 2]  206 	pushw	x
      009AB6 CD 9E 93         [ 4]  207 	call	_memcpy
      009AB9 5B 06            [ 2]  208 	addw	sp, #6
                                    209 ;	config.c: 111: validate_output_config(cfg);
      009ABB 1E 07            [ 2]  210 	ldw	x, (0x07, sp)
      009ABD 1F 01            [ 2]  211 	ldw	(0x01, sp), x
                                    212 ;	config.c: 99: if (cfg->version != OUTPUT_CFG_VERSION || cfg->vset == 0 || cfg->cset == 0) {
      009ABF F6               [ 1]  213 	ld	a, (x)
      009AC0 A1 01            [ 1]  214 	cp	a, #0x01
      009AC2 26 10            [ 1]  215 	jrne	00103$
      009AC4 1F 03            [ 2]  216 	ldw	(0x03, sp), x
      009AC6 16 03            [ 2]  217 	ldw	y, (0x03, sp)
      009AC8 90 EE 01         [ 2]  218 	ldw	y, (0x1, y)
      009ACB 90 5D            [ 2]  219 	tnzw	y
      009ACD 27 05            [ 1]  220 	jreq	00103$
      009ACF EE 03            [ 2]  221 	ldw	x, (0x3, x)
      009AD1 5D               [ 2]  222 	tnzw	x
      009AD2 26 07            [ 1]  223 	jrne	00106$
      009AD4                        224 00103$:
                                    225 ;	config.c: 100: config_default_output(cfg);
      009AD4 1E 01            [ 2]  226 	ldw	x, (0x01, sp)
      009AD6 89               [ 2]  227 	pushw	x
      009AD7 CD 9A 97         [ 4]  228 	call	_config_default_output
      009ADA 85               [ 2]  229 	popw	x
                                    230 ;	config.c: 111: validate_output_config(cfg);
      009ADB                        231 00106$:
      009ADB 5B 04            [ 2]  232 	addw	sp, #4
      009ADD 81               [ 4]  233 	ret
                                    234 ;	config.c: 114: void config_save_output(cfg_output_t *cfg)
                                    235 ;	-----------------------------------------
                                    236 ;	 function config_save_output
                                    237 ;	-----------------------------------------
      009ADE                        238 _config_save_output:
                                    239 ;	config.c: 116: eeprom_save_data((uint8_t*)OUTPUT_CONFIG, (uint8_t*)cfg, sizeof(*cfg));
      009ADE 1E 03            [ 2]  240 	ldw	x, (0x03, sp)
      009AE0 4B 09            [ 1]  241 	push	#0x09
      009AE2 89               [ 2]  242 	pushw	x
      009AE3 4B 40            [ 1]  243 	push	#0x40
      009AE5 4B 40            [ 1]  244 	push	#0x40
      009AE7 CD 97 E0         [ 4]  245 	call	_eeprom_save_data
      009AEA 5B 05            [ 2]  246 	addw	sp, #5
      009AEC 81               [ 4]  247 	ret
                                    248 	.area CODE
      009AED                        249 ___str_0:
      009AED 55 6E 6E 61 6D 65 64   250 	.ascii "Unnamed"
      009AF4 00                     251 	.db 0x00
                                    252 	.area INITIALIZER
      009F85                        253 __xinit__default_cfg_system:
      009F85 02                     254 	.db #0x02	; 2
      009F86 55 6E 6E 61 6D 65 64   255 	.ascii "Unnamed"
      009F8D 00                     256 	.db 0x00
      009F8E 00                     257 	.db 0x00
      009F8F 00                     258 	.db 0x00
      009F90 00                     259 	.db 0x00
      009F91 00                     260 	.db 0x00
      009F92 00                     261 	.db 0x00
      009F93 00                     262 	.db 0x00
      009F94 00                     263 	.db 0x00
      009F95 00                     264 	.db 0x00
      009F96 00                     265 	.db 0x00
      009F97 00                     266 	.db #0x00	; 0
      009F98 00                     267 	.db #0x00	; 0
      009F99 01                     268 	.db #0x01	; 1
      009F9A 00 06 99 9A            269 	.byte #0x00,#0x06,#0x99,#0x9A	; 432538
      009F9E 00 00 00 00            270 	.byte #0x00,#0x00,#0x00,#0x00	; 0
      009FA2 00 05 A6 93            271 	.byte #0x00,#0x05,#0xA6,#0x93	; 370323
      009FA6 01 C4 00 00            272 	.byte #0x01,#0xC4,#0x00,#0x00	; 29622272
      009FAA 00 00 84 00            273 	.byte #0x00,#0x00,#0x84,#0x00	; 33792
      009FAE 00 C8 00 00            274 	.byte #0x00,#0xC8,#0x00,#0x00	; 13107200
      009FB2 00 00 2D 4E            275 	.byte #0x00,#0x00,#0x2D,#0x4E	; 11598
      009FB6 00 21 00 00            276 	.byte #0x00,#0x21,#0x00,#0x00	; 2162688
      009FBA 00 01 F0 7C            277 	.byte #0x00,#0x01,#0xF0,#0x7C	; 127100
      009FBE 00 A0 00 00            278 	.byte #0x00,#0xA0,#0x00,#0x00	; 10485760
      009FC2                        279 __xinit__default_cfg_output:
      009FC2 01                     280 	.db #0x01	; 1
      009FC3 13 88                  281 	.dw #0x1388
      009FC5 01 F4                  282 	.dw #0x01F4
      009FC7 00 00                  283 	.dw #0x0000
      009FC9 00 00                  284 	.dw #0x0000
                                    285 	.area CABS (ABS)
