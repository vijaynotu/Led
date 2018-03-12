                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Mon Mar 12 12:44:09 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module display
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _display_char
                                     13 	.globl _memcpy
                                     14 	.globl _timer
                                     15 	.globl _pending_update
                                     16 	.globl _pending_display_data
                                     17 	.globl _display_data
                                     18 	.globl _display_idx
                                     19 	.globl _display_refresh
                                     20 	.globl _display_show
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DATA
      000055                         25 _display_idx::
      000055                         26 	.ds 1
      000056                         27 _display_data::
      000056                         28 	.ds 4
      00005A                         29 _pending_display_data::
      00005A                         30 	.ds 4
      00005E                         31 _pending_update::
      00005E                         32 	.ds 1
      00005F                         33 _timer::
      00005F                         34 	.ds 2
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
                                     39 ;--------------------------------------------------------
                                     40 ; absolute external ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DABS (ABS)
                                     43 ;--------------------------------------------------------
                                     44 ; global & static initialisations
                                     45 ;--------------------------------------------------------
                                     46 	.area HOME
                                     47 	.area GSINIT
                                     48 	.area GSFINAL
                                     49 	.area GSINIT
                                     50 ;--------------------------------------------------------
                                     51 ; Home
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
                                     54 	.area HOME
                                     55 ;--------------------------------------------------------
                                     56 ; code
                                     57 ;--------------------------------------------------------
                                     58 	.area CODE
                                     59 ;	display.c: 60: void display_refresh(void)
                                     60 ;	-----------------------------------------
                                     61 ;	 function display_refresh
                                     62 ;	-----------------------------------------
      0092D4                         63 _display_refresh:
      0092D4 52 07            [ 2]   64 	sub	sp, #7
                                     65 ;	display.c: 62: int i = display_idx++;
      0092D6 C6 00 55         [ 1]   66 	ld	a, _display_idx+0
      0092D9 97               [ 1]   67 	ld	xl, a
      0092DA 72 5C 00 55      [ 1]   68 	inc	_display_idx+0
      0092DE 4F               [ 1]   69 	clr	a
      0092DF 95               [ 1]   70 	ld	xh, a
      0092E0 1F 06            [ 2]   71 	ldw	(0x06, sp), x
                                     72 ;	display.c: 63: uint8_t bit = 8+(i*2);
      0092E2 7B 07            [ 1]   73 	ld	a, (0x07, sp)
      0092E4 48               [ 1]   74 	sll	a
      0092E5 AB 08            [ 1]   75 	add	a, #0x08
                                     76 ;	display.c: 64: uint16_t digit = 0xFF00 ^ (3<<bit);
      0092E7 AE 00 03         [ 2]   77 	ldw	x, #0x0003
      0092EA 4D               [ 1]   78 	tnz	a
      0092EB 27 04            [ 1]   79 	jreq	00156$
      0092ED                         80 00155$:
      0092ED 58               [ 2]   81 	sllw	x
      0092EE 4A               [ 1]   82 	dec	a
      0092EF 26 FC            [ 1]   83 	jrne	00155$
      0092F1                         84 00156$:
      0092F1 9E               [ 1]   85 	ld	a, xh
      0092F2 43               [ 1]   86 	cpl	a
      0092F3 95               [ 1]   87 	ld	xh, a
      0092F4 1F 04            [ 2]   88 	ldw	(0x04, sp), x
                                     89 ;	display.c: 66: if (timer > 0)
      0092F6 CE 00 5F         [ 2]   90 	ldw	x, _timer+0
      0092F9 27 07            [ 1]   91 	jreq	00102$
                                     92 ;	display.c: 67: timer--;
      0092FB CE 00 5F         [ 2]   93 	ldw	x, _timer+0
      0092FE 5A               [ 2]   94 	decw	x
      0092FF CF 00 5F         [ 2]   95 	ldw	_timer+0, x
      009302                         96 00102$:
                                     97 ;	display.c: 68: if (pending_update && timer == 0) {
      009302 72 5D 00 5E      [ 1]   98 	tnz	_pending_update+0
      009306 27 22            [ 1]   99 	jreq	00104$
      009308 CE 00 5F         [ 2]  100 	ldw	x, _timer+0
      00930B 26 1D            [ 1]  101 	jrne	00104$
                                    102 ;	display.c: 69: memcpy(display_data, pending_display_data, sizeof(display_data));
      00930D AE 00 5A         [ 2]  103 	ldw	x, #_pending_display_data+0
      009310 90 AE 00 56      [ 2]  104 	ldw	y, #_display_data+0
      009314 4B 04            [ 1]  105 	push	#0x04
      009316 4B 00            [ 1]  106 	push	#0x00
      009318 89               [ 2]  107 	pushw	x
      009319 90 89            [ 2]  108 	pushw	y
      00931B CD 9E 93         [ 4]  109 	call	_memcpy
      00931E 5B 06            [ 2]  110 	addw	sp, #6
                                    111 ;	display.c: 70: pending_update = 0;
      009320 72 5F 00 5E      [ 1]  112 	clr	_pending_update+0
                                    113 ;	display.c: 71: timer = 1500; // 1/2 of a second, approximately
      009324 AE 05 DC         [ 2]  114 	ldw	x, #0x05dc
      009327 CF 00 5F         [ 2]  115 	ldw	_timer+0, x
      00932A                        116 00104$:
                                    117 ;	display.c: 74: display_word(digit | display_data[i]);
      00932A AE 00 56         [ 2]  118 	ldw	x, #_display_data+0
      00932D 72 FB 06         [ 2]  119 	addw	x, (0x06, sp)
      009330 F6               [ 1]  120 	ld	a, (x)
      009331 5F               [ 1]  121 	clrw	x
      009332 97               [ 1]  122 	ld	xl, a
      009333 1A 05            [ 1]  123 	or	a, (0x05, sp)
      009335 02               [ 1]  124 	rlwa	x
      009336 1A 04            [ 1]  125 	or	a, (0x04, sp)
      009338 95               [ 1]  126 	ld	xh, a
      009339 1F 02            [ 2]  127 	ldw	(0x02, sp), x
                                    128 ;	display.c: 51: for (i = 0; i < 16; i++) {
      00933B 0F 01            [ 1]  129 	clr	(0x01, sp)
      00933D                        130 00122$:
                                    131 ;	display.c: 52: uint8_t bit = word & 1;
      00933D 7B 03            [ 1]  132 	ld	a, (0x03, sp)
      00933F A4 01            [ 1]  133 	and	a, #0x01
      009341 90 97            [ 1]  134 	ld	yl, a
      009343 4F               [ 1]  135 	clr	a
                                    136 ;	display.c: 53: word >>= 1;
      009344 1E 02            [ 2]  137 	ldw	x, (0x02, sp)
      009346 54               [ 2]  138 	srlw	x
      009347 1F 02            [ 2]  139 	ldw	(0x02, sp), x
                                    140 ;	display.c: 54: SET_DATA(bit);
      009349 AE 50 0F         [ 2]  141 	ldw	x, #0x500f
      00934C F6               [ 1]  142 	ld	a, (x)
      00934D 61               [ 1]  143 	exg	a, yl
      00934E 4D               [ 1]  144 	tnz	a
      00934F 61               [ 1]  145 	exg	a, yl
      009350 27 08            [ 1]  146 	jreq	00109$
      009352 AA 10            [ 1]  147 	or	a, #0x10
      009354 AE 50 0F         [ 2]  148 	ldw	x, #0x500f
      009357 F7               [ 1]  149 	ld	(x), a
      009358 20 06            [ 2]  150 	jra	00112$
      00935A                        151 00109$:
      00935A A4 EF            [ 1]  152 	and	a, #0xef
      00935C AE 50 0F         [ 2]  153 	ldw	x, #0x500f
      00935F F7               [ 1]  154 	ld	(x), a
      009360                        155 00112$:
                                    156 ;	display.c: 55: PULSE_CLOCK();
      009360 AE 50 00         [ 2]  157 	ldw	x, #0x5000
      009363 F6               [ 1]  158 	ld	a, (x)
      009364 AA 02            [ 1]  159 	or	a, #0x02
      009366 F7               [ 1]  160 	ld	(x), a
      009367 AE 50 00         [ 2]  161 	ldw	x, #0x5000
      00936A F6               [ 1]  162 	ld	a, (x)
      00936B A4 FD            [ 1]  163 	and	a, #0xfd
      00936D F7               [ 1]  164 	ld	(x), a
                                    165 ;	display.c: 51: for (i = 0; i < 16; i++) {
      00936E 0C 01            [ 1]  166 	inc	(0x01, sp)
      009370 7B 01            [ 1]  167 	ld	a, (0x01, sp)
      009372 A1 10            [ 1]  168 	cp	a, #0x10
      009374 25 C7            [ 1]  169 	jrc	00122$
                                    170 ;	display.c: 57: SAVE_DATA();
      009376 AE 50 00         [ 2]  171 	ldw	x, #0x5000
      009379 F6               [ 1]  172 	ld	a, (x)
      00937A A4 FB            [ 1]  173 	and	a, #0xfb
      00937C F7               [ 1]  174 	ld	(x), a
      00937D AE 50 00         [ 2]  175 	ldw	x, #0x5000
      009380 F6               [ 1]  176 	ld	a, (x)
      009381 AA 04            [ 1]  177 	or	a, #0x04
      009383 F7               [ 1]  178 	ld	(x), a
                                    179 ;	display.c: 76: if (display_idx == 4)
      009384 C6 00 55         [ 1]  180 	ld	a, _display_idx+0
      009387 A1 04            [ 1]  181 	cp	a, #0x04
      009389 26 04            [ 1]  182 	jrne	00124$
                                    183 ;	display.c: 77: display_idx = 0;
      00938B 72 5F 00 55      [ 1]  184 	clr	_display_idx+0
      00938F                        185 00124$:
      00938F 5B 07            [ 2]  186 	addw	sp, #7
      009391 81               [ 4]  187 	ret
                                    188 ;	display.c: 80: uint8_t display_char(uint8_t ch, uint8_t dot)
                                    189 ;	-----------------------------------------
                                    190 ;	 function display_char
                                    191 ;	-----------------------------------------
      009392                        192 _display_char:
      009392 52 04            [ 2]  193 	sub	sp, #4
                                    194 ;	display.c: 82: if (dot)
      009394 0D 08            [ 1]  195 	tnz	(0x08, sp)
      009396 27 04            [ 1]  196 	jreq	00102$
                                    197 ;	display.c: 83: dot = 1;
      009398 A6 01            [ 1]  198 	ld	a, #0x01
      00939A 6B 08            [ 1]  199 	ld	(0x08, sp), a
      00939C                        200 00102$:
                                    201 ;	display.c: 84: if (ch >= '0' && ch <= '9')
      00939C 7B 07            [ 1]  202 	ld	a, (0x07, sp)
      00939E A1 30            [ 1]  203 	cp	a, #0x30
      0093A0 25 2A            [ 1]  204 	jrc	00104$
      0093A2 7B 07            [ 1]  205 	ld	a, (0x07, sp)
      0093A4 A1 39            [ 1]  206 	cp	a, #0x39
      0093A6 22 24            [ 1]  207 	jrugt	00104$
                                    208 ;	display.c: 85: return display_number[ch-'0'] | dot;
      0093A8 AE 94 1D         [ 2]  209 	ldw	x, #_display_number+0
      0093AB 1F 03            [ 2]  210 	ldw	(0x03, sp), x
      0093AD 7B 07            [ 1]  211 	ld	a, (0x07, sp)
      0093AF A0 30            [ 1]  212 	sub	a, #0x30
      0093B1 97               [ 1]  213 	ld	xl, a
      0093B2 49               [ 1]  214 	rlc	a
      0093B3 4F               [ 1]  215 	clr	a
      0093B4 A2 00            [ 1]  216 	sbc	a, #0x00
      0093B6 95               [ 1]  217 	ld	xh, a
      0093B7 58               [ 2]  218 	sllw	x
      0093B8 72 FB 03         [ 2]  219 	addw	x, (0x03, sp)
      0093BB FE               [ 2]  220 	ldw	x, (x)
      0093BC 7B 08            [ 1]  221 	ld	a, (0x08, sp)
      0093BE 0F 01            [ 1]  222 	clr	(0x01, sp)
      0093C0 89               [ 2]  223 	pushw	x
      0093C1 1A 02            [ 1]  224 	or	a, (2, sp)
      0093C3 85               [ 2]  225 	popw	x
      0093C4 88               [ 1]  226 	push	a
      0093C5 9E               [ 1]  227 	ld	a, xh
      0093C6 1A 02            [ 1]  228 	or	a, (0x02, sp)
      0093C8 95               [ 1]  229 	ld	xh, a
      0093C9 84               [ 1]  230 	pop	a
      0093CA 20 02            [ 2]  231 	jra	00106$
      0093CC                        232 00104$:
                                    233 ;	display.c: 86: return dot;
      0093CC 7B 08            [ 1]  234 	ld	a, (0x08, sp)
      0093CE                        235 00106$:
      0093CE 5B 04            [ 2]  236 	addw	sp, #4
      0093D0 81               [ 4]  237 	ret
                                    238 ;	display.c: 89: void display_show(uint8_t ch1, uint8_t dot1, uint8_t ch2, uint8_t dot2, uint8_t ch3, uint8_t dot3, uint8_t ch4, uint8_t dot4)
                                    239 ;	-----------------------------------------
                                    240 ;	 function display_show
                                    241 ;	-----------------------------------------
      0093D1                        242 _display_show:
      0093D1 89               [ 2]  243 	pushw	x
                                    244 ;	display.c: 91: pending_display_data[3] = display_char(ch1, dot1);
      0093D2 AE 00 5A         [ 2]  245 	ldw	x, #_pending_display_data+0
      0093D5 1F 01            [ 2]  246 	ldw	(0x01, sp), x
      0093D7 1E 01            [ 2]  247 	ldw	x, (0x01, sp)
      0093D9 1C 00 03         [ 2]  248 	addw	x, #0x0003
      0093DC 89               [ 2]  249 	pushw	x
      0093DD 7B 08            [ 1]  250 	ld	a, (0x08, sp)
      0093DF 88               [ 1]  251 	push	a
      0093E0 7B 08            [ 1]  252 	ld	a, (0x08, sp)
      0093E2 88               [ 1]  253 	push	a
      0093E3 CD 93 92         [ 4]  254 	call	_display_char
      0093E6 5B 04            [ 2]  255 	addw	sp, #4
      0093E8 F7               [ 1]  256 	ld	(x), a
                                    257 ;	display.c: 92: pending_display_data[2] = display_char(ch2, dot2);
      0093E9 1E 01            [ 2]  258 	ldw	x, (0x01, sp)
      0093EB 5C               [ 2]  259 	incw	x
      0093EC 5C               [ 2]  260 	incw	x
      0093ED 89               [ 2]  261 	pushw	x
      0093EE 7B 0A            [ 1]  262 	ld	a, (0x0a, sp)
      0093F0 88               [ 1]  263 	push	a
      0093F1 7B 0A            [ 1]  264 	ld	a, (0x0a, sp)
      0093F3 88               [ 1]  265 	push	a
      0093F4 CD 93 92         [ 4]  266 	call	_display_char
      0093F7 5B 04            [ 2]  267 	addw	sp, #4
      0093F9 F7               [ 1]  268 	ld	(x), a
                                    269 ;	display.c: 93: pending_display_data[1] = display_char(ch3, dot3);
      0093FA 1E 01            [ 2]  270 	ldw	x, (0x01, sp)
      0093FC 5C               [ 2]  271 	incw	x
      0093FD 89               [ 2]  272 	pushw	x
      0093FE 7B 0C            [ 1]  273 	ld	a, (0x0c, sp)
      009400 88               [ 1]  274 	push	a
      009401 7B 0C            [ 1]  275 	ld	a, (0x0c, sp)
      009403 88               [ 1]  276 	push	a
      009404 CD 93 92         [ 4]  277 	call	_display_char
      009407 5B 04            [ 2]  278 	addw	sp, #4
      009409 F7               [ 1]  279 	ld	(x), a
                                    280 ;	display.c: 94: pending_display_data[0] = display_char(ch4, dot4);
      00940A 7B 0C            [ 1]  281 	ld	a, (0x0c, sp)
      00940C 88               [ 1]  282 	push	a
      00940D 7B 0C            [ 1]  283 	ld	a, (0x0c, sp)
      00940F 88               [ 1]  284 	push	a
      009410 CD 93 92         [ 4]  285 	call	_display_char
      009413 85               [ 2]  286 	popw	x
      009414 1E 01            [ 2]  287 	ldw	x, (0x01, sp)
      009416 F7               [ 1]  288 	ld	(x), a
                                    289 ;	display.c: 95: pending_update = 1;
      009417 35 01 00 5E      [ 1]  290 	mov	_pending_update+0, #0x01
      00941B 85               [ 2]  291 	popw	x
      00941C 81               [ 4]  292 	ret
                                    293 	.area CODE
      00941D                        294 _display_number:
      00941D 00 FC                  295 	.dw #0x00FC
      00941F 00 60                  296 	.dw #0x0060
      009421 00 DA                  297 	.dw #0x00DA
      009423 00 F2                  298 	.dw #0x00F2
      009425 00 66                  299 	.dw #0x0066
      009427 00 B6                  300 	.dw #0x00B6
      009429 00 BE                  301 	.dw #0x00BE
      00942B 00 E0                  302 	.dw #0x00E0
      00942D 00 FE                  303 	.dw #0x00FE
      00942F 00 F6                  304 	.dw #0x00F6
                                    305 	.area INITIALIZER
                                    306 	.area CABS (ABS)
