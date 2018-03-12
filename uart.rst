                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Mon Mar 12 12:44:09 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module uart
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _uart_read_to_buf
                                     13 	.globl _uart_write_from_buf
                                     14 	.globl _fixed_round
                                     15 	.globl _digits_buf
                                     16 	.globl _read_newline
                                     17 	.globl _uart_read_len
                                     18 	.globl _uart_read_buf
                                     19 	.globl _uart_write_len
                                     20 	.globl _uart_write_start
                                     21 	.globl _uart_write_buf
                                     22 	.globl _uart_init
                                     23 	.globl _uart_write_ch
                                     24 	.globl _uart_write_str
                                     25 	.globl _uart_write_int
                                     26 	.globl _uart_write_int32
                                     27 	.globl _uart_write_milliamp
                                     28 	.globl _uart_write_millivolt
                                     29 	.globl _uart_write_fixed_point
                                     30 	.globl _uart_drive
                                     31 	.globl _uart_flush_writes
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DATA
      000061                         36 _uart_write_buf::
      000061                         37 	.ds 255
      000160                         38 _uart_write_start::
      000160                         39 	.ds 1
      000161                         40 _uart_write_len::
      000161                         41 	.ds 1
      000162                         42 _uart_read_buf::
      000162                         43 	.ds 64
      0001A2                         44 _uart_read_len::
      0001A2                         45 	.ds 1
      0001A3                         46 _read_newline::
      0001A3                         47 	.ds 1
      0001A4                         48 _digits_buf::
      0001A4                         49 	.ds 12
                                     50 ;--------------------------------------------------------
                                     51 ; ram data
                                     52 ;--------------------------------------------------------
                                     53 	.area INITIALIZED
                                     54 ;--------------------------------------------------------
                                     55 ; absolute external ram data
                                     56 ;--------------------------------------------------------
                                     57 	.area DABS (ABS)
                                     58 ;--------------------------------------------------------
                                     59 ; global & static initialisations
                                     60 ;--------------------------------------------------------
                                     61 	.area HOME
                                     62 	.area GSINIT
                                     63 	.area GSFINAL
                                     64 	.area GSINIT
                                     65 ;--------------------------------------------------------
                                     66 ; Home
                                     67 ;--------------------------------------------------------
                                     68 	.area HOME
                                     69 	.area HOME
                                     70 ;--------------------------------------------------------
                                     71 ; code
                                     72 ;--------------------------------------------------------
                                     73 	.area CODE
                                     74 ;	uart.c: 31: void uart_init()
                                     75 ;	-----------------------------------------
                                     76 ;	 function uart_init
                                     77 ;	-----------------------------------------
      009431                         78 _uart_init:
                                     79 ;	uart.c: 33: USART1_CR1 = 0; // 8 bits, no parity
      009431 35 00 52 34      [ 1]   80 	mov	0x5234+0, #0x00
                                     81 ;	uart.c: 34: USART1_CR2 = 0;
      009435 35 00 52 35      [ 1]   82 	mov	0x5235+0, #0x00
                                     83 ;	uart.c: 35: USART1_CR3 = 0;
      009439 35 00 52 36      [ 1]   84 	mov	0x5236+0, #0x00
                                     85 ;	uart.c: 37: USART1_BRR2 = 0x1;
      00943D 35 01 52 33      [ 1]   86 	mov	0x5233+0, #0x01
                                     87 ;	uart.c: 38: USART1_BRR1 = 0x1A; // 38400 baud, order important between BRRs, BRR1 must be last
      009441 35 1A 52 32      [ 1]   88 	mov	0x5232+0, #0x1a
                                     89 ;	uart.c: 40: USART1_CR2 = USART_CR2_TEN | USART_CR2_REN; // Allow TX & RX
      009445 35 0C 52 35      [ 1]   90 	mov	0x5235+0, #0x0c
                                     91 ;	uart.c: 42: uart_write_len = 0;
      009449 72 5F 01 61      [ 1]   92 	clr	_uart_write_len+0
                                     93 ;	uart.c: 43: uart_write_start = 0;
      00944D 72 5F 01 60      [ 1]   94 	clr	_uart_write_start+0
                                     95 ;	uart.c: 44: uart_read_len = 0;
      009451 72 5F 01 A2      [ 1]   96 	clr	_uart_read_len+0
                                     97 ;	uart.c: 45: read_newline = 0;
      009455 72 5F 01 A3      [ 1]   98 	clr	_read_newline+0
      009459 81               [ 4]   99 	ret
                                    100 ;	uart.c: 53: void uart_write_ch(const char ch)
                                    101 ;	-----------------------------------------
                                    102 ;	 function uart_write_ch
                                    103 ;	-----------------------------------------
      00945A                        104 _uart_write_ch:
      00945A 89               [ 2]  105 	pushw	x
                                    106 ;	uart.c: 55: if (uart_write_len < sizeof(uart_write_buf))
      00945B C6 01 61         [ 1]  107 	ld	a, _uart_write_len+0
      00945E A1 FF            [ 1]  108 	cp	a, #0xff
      009460 24 15            [ 1]  109 	jrnc	00103$
                                    110 ;	uart.c: 56: uart_write_buf[uart_write_len++] = ch;
      009462 AE 00 61         [ 2]  111 	ldw	x, #_uart_write_buf+0
      009465 1F 01            [ 2]  112 	ldw	(0x01, sp), x
      009467 C6 01 61         [ 1]  113 	ld	a, _uart_write_len+0
      00946A 97               [ 1]  114 	ld	xl, a
      00946B 72 5C 01 61      [ 1]  115 	inc	_uart_write_len+0
      00946F 4F               [ 1]  116 	clr	a
      009470 95               [ 1]  117 	ld	xh, a
      009471 72 FB 01         [ 2]  118 	addw	x, (0x01, sp)
      009474 7B 05            [ 1]  119 	ld	a, (0x05, sp)
      009476 F7               [ 1]  120 	ld	(x), a
      009477                        121 00103$:
      009477 85               [ 2]  122 	popw	x
      009478 81               [ 4]  123 	ret
                                    124 ;	uart.c: 59: void uart_write_str(const char *str)
                                    125 ;	-----------------------------------------
                                    126 ;	 function uart_write_str
                                    127 ;	-----------------------------------------
      009479                        128 _uart_write_str:
      009479 52 05            [ 2]  129 	sub	sp, #5
                                    130 ;	uart.c: 64: if (uart_write_start > 0) {
      00947B 72 5D 01 60      [ 1]  131 	tnz	_uart_write_start+0
      00947F 27 2C            [ 1]  132 	jreq	00119$
                                    133 ;	uart.c: 65: for (i = 0; i < uart_write_len; i++) {
      009481 AE 00 61         [ 2]  134 	ldw	x, #_uart_write_buf+0
      009484 1F 04            [ 2]  135 	ldw	(0x04, sp), x
      009486 0F 01            [ 1]  136 	clr	(0x01, sp)
      009488                        137 00106$:
      009488 7B 01            [ 1]  138 	ld	a, (0x01, sp)
      00948A C1 01 61         [ 1]  139 	cp	a, _uart_write_len+0
      00948D 24 1A            [ 1]  140 	jrnc	00101$
                                    141 ;	uart.c: 66: uart_write_buf[i] = uart_write_buf[i+uart_write_start];
      00948F 90 5F            [ 1]  142 	clrw	y
      009491 7B 01            [ 1]  143 	ld	a, (0x01, sp)
      009493 90 97            [ 1]  144 	ld	yl, a
      009495 72 F9 04         [ 2]  145 	addw	y, (0x04, sp)
      009498 7B 01            [ 1]  146 	ld	a, (0x01, sp)
      00949A CB 01 60         [ 1]  147 	add	a, _uart_write_start+0
      00949D 5F               [ 1]  148 	clrw	x
      00949E 97               [ 1]  149 	ld	xl, a
      00949F 72 FB 04         [ 2]  150 	addw	x, (0x04, sp)
      0094A2 F6               [ 1]  151 	ld	a, (x)
      0094A3 90 F7            [ 1]  152 	ld	(y), a
                                    153 ;	uart.c: 65: for (i = 0; i < uart_write_len; i++) {
      0094A5 0C 01            [ 1]  154 	inc	(0x01, sp)
      0094A7 20 DF            [ 2]  155 	jra	00106$
      0094A9                        156 00101$:
                                    157 ;	uart.c: 68: uart_write_start = 0;
      0094A9 72 5F 01 60      [ 1]  158 	clr	_uart_write_start+0
                                    159 ;	uart.c: 71: for(i = 0; str[i] != 0 && uart_write_len < sizeof(uart_write_buf); i++) {
      0094AD                        160 00119$:
      0094AD AE 00 61         [ 2]  161 	ldw	x, #_uart_write_buf+0
      0094B0 1F 02            [ 2]  162 	ldw	(0x02, sp), x
      0094B2 0F 01            [ 1]  163 	clr	(0x01, sp)
      0094B4                        164 00110$:
      0094B4 5F               [ 1]  165 	clrw	x
      0094B5 7B 01            [ 1]  166 	ld	a, (0x01, sp)
      0094B7 97               [ 1]  167 	ld	xl, a
      0094B8 72 FB 08         [ 2]  168 	addw	x, (0x08, sp)
      0094BB F6               [ 1]  169 	ld	a, (x)
      0094BC 90 95            [ 1]  170 	ld	yh, a
      0094BE A1 00            [ 1]  171 	cp	a, #0x00
      0094C0 27 1A            [ 1]  172 	jreq	00112$
      0094C2 C6 01 61         [ 1]  173 	ld	a, _uart_write_len+0
      0094C5 A1 FF            [ 1]  174 	cp	a, #0xff
      0094C7 24 13            [ 1]  175 	jrnc	00112$
                                    176 ;	uart.c: 72: uart_write_buf[uart_write_len] = str[i];
      0094C9 5F               [ 1]  177 	clrw	x
      0094CA C6 01 61         [ 1]  178 	ld	a, _uart_write_len+0
      0094CD 97               [ 1]  179 	ld	xl, a
      0094CE 72 FB 02         [ 2]  180 	addw	x, (0x02, sp)
      0094D1 90 9E            [ 1]  181 	ld	a, yh
      0094D3 F7               [ 1]  182 	ld	(x), a
                                    183 ;	uart.c: 73: uart_write_len++;
      0094D4 72 5C 01 61      [ 1]  184 	inc	_uart_write_len+0
                                    185 ;	uart.c: 71: for(i = 0; str[i] != 0 && uart_write_len < sizeof(uart_write_buf); i++) {
      0094D8 0C 01            [ 1]  186 	inc	(0x01, sp)
      0094DA 20 D8            [ 2]  187 	jra	00110$
      0094DC                        188 00112$:
      0094DC 5B 05            [ 2]  189 	addw	sp, #5
      0094DE 81               [ 4]  190 	ret
                                    191 ;	uart.c: 78: static uint8_t int_to_digits(uint16_t val)
                                    192 ;	-----------------------------------------
                                    193 ;	 function int_to_digits
                                    194 ;	-----------------------------------------
      0094DF                        195 _int_to_digits:
      0094DF 52 05            [ 2]  196 	sub	sp, #5
                                    197 ;	uart.c: 81: uint8_t num_digits = 0;
      0094E1 0F 05            [ 1]  198 	clr	(0x05, sp)
                                    199 ;	uart.c: 83: digits_buf[0] = '0';
      0094E3 AE 01 A4         [ 2]  200 	ldw	x, #_digits_buf+0
      0094E6 1F 03            [ 2]  201 	ldw	(0x03, sp), x
      0094E8 1E 03            [ 2]  202 	ldw	x, (0x03, sp)
      0094EA A6 30            [ 1]  203 	ld	a, #0x30
      0094EC F7               [ 1]  204 	ld	(x), a
                                    205 ;	uart.c: 85: for (i = 0; i < 6 && val != 0; i++) {
      0094ED 0F 02            [ 1]  206 	clr	(0x02, sp)
      0094EF                        207 00106$:
      0094EF 7B 02            [ 1]  208 	ld	a, (0x02, sp)
      0094F1 A1 06            [ 1]  209 	cp	a, #0x06
      0094F3 24 33            [ 1]  210 	jrnc	00103$
      0094F5 1E 08            [ 2]  211 	ldw	x, (0x08, sp)
      0094F7 A3 00 00         [ 2]  212 	cpw	x, #0x0000
      0094FA 27 2C            [ 1]  213 	jreq	00103$
                                    214 ;	uart.c: 86: uint8_t digit = val % 10;
      0094FC 1E 08            [ 2]  215 	ldw	x, (0x08, sp)
      0094FE 90 AE 00 0A      [ 2]  216 	ldw	y, #0x000a
      009502 65               [ 2]  217 	divw	x, y
      009503 61               [ 1]  218 	exg	a, yl
      009504 6B 01            [ 1]  219 	ld	(0x01, sp), a
      009506 61               [ 1]  220 	exg	a, yl
                                    221 ;	uart.c: 87: digits_buf[i] = '0' + digit;
      009507 5F               [ 1]  222 	clrw	x
      009508 7B 02            [ 1]  223 	ld	a, (0x02, sp)
      00950A 97               [ 1]  224 	ld	xl, a
      00950B 72 FB 03         [ 2]  225 	addw	x, (0x03, sp)
      00950E 7B 01            [ 1]  226 	ld	a, (0x01, sp)
      009510 AB 30            [ 1]  227 	add	a, #0x30
      009512 F7               [ 1]  228 	ld	(x), a
                                    229 ;	uart.c: 88: val /= 10;
      009513 1E 08            [ 2]  230 	ldw	x, (0x08, sp)
      009515 90 AE 00 0A      [ 2]  231 	ldw	y, #0x000a
      009519 65               [ 2]  232 	divw	x, y
      00951A 1F 08            [ 2]  233 	ldw	(0x08, sp), x
                                    234 ;	uart.c: 89: if (digit) // We only really want to know about non-zero digits
      00951C 0D 01            [ 1]  235 	tnz	(0x01, sp)
      00951E 27 04            [ 1]  236 	jreq	00107$
                                    237 ;	uart.c: 90: num_digits = i;
      009520 7B 02            [ 1]  238 	ld	a, (0x02, sp)
      009522 6B 05            [ 1]  239 	ld	(0x05, sp), a
      009524                        240 00107$:
                                    241 ;	uart.c: 85: for (i = 0; i < 6 && val != 0; i++) {
      009524 0C 02            [ 1]  242 	inc	(0x02, sp)
      009526 20 C7            [ 2]  243 	jra	00106$
      009528                        244 00103$:
                                    245 ;	uart.c: 93: return num_digits + 1;
      009528 7B 05            [ 1]  246 	ld	a, (0x05, sp)
      00952A 4C               [ 1]  247 	inc	a
      00952B 5B 05            [ 2]  248 	addw	sp, #5
      00952D 81               [ 4]  249 	ret
                                    250 ;	uart.c: 96: void uart_write_int(uint16_t val)
                                    251 ;	-----------------------------------------
                                    252 ;	 function uart_write_int
                                    253 ;	-----------------------------------------
      00952E                        254 _uart_write_int:
      00952E 52 03            [ 2]  255 	sub	sp, #3
                                    256 ;	uart.c: 101: highest_nonzero = int_to_digits(val);
      009530 1E 06            [ 2]  257 	ldw	x, (0x06, sp)
      009532 89               [ 2]  258 	pushw	x
      009533 CD 94 DF         [ 4]  259 	call	_int_to_digits
      009536 85               [ 2]  260 	popw	x
                                    261 ;	uart.c: 103: for (i = highest_nonzero-1; i >= 0; i--) {
      009537 4A               [ 1]  262 	dec	a
      009538 AE 01 A4         [ 2]  263 	ldw	x, #_digits_buf+0
      00953B 1F 02            [ 2]  264 	ldw	(0x02, sp), x
      00953D 6B 01            [ 1]  265 	ld	(0x01, sp), a
      00953F                        266 00103$:
      00953F 0D 01            [ 1]  267 	tnz	(0x01, sp)
      009541 2B 11            [ 1]  268 	jrmi	00105$
                                    269 ;	uart.c: 104: uart_write_ch(digits_buf[i]);
      009543 5F               [ 1]  270 	clrw	x
      009544 7B 01            [ 1]  271 	ld	a, (0x01, sp)
      009546 97               [ 1]  272 	ld	xl, a
      009547 72 FB 02         [ 2]  273 	addw	x, (0x02, sp)
      00954A F6               [ 1]  274 	ld	a, (x)
      00954B 88               [ 1]  275 	push	a
      00954C CD 94 5A         [ 4]  276 	call	_uart_write_ch
      00954F 84               [ 1]  277 	pop	a
                                    278 ;	uart.c: 103: for (i = highest_nonzero-1; i >= 0; i--) {
      009550 0A 01            [ 1]  279 	dec	(0x01, sp)
      009552 20 EB            [ 2]  280 	jra	00103$
      009554                        281 00105$:
      009554 5B 03            [ 2]  282 	addw	sp, #3
      009556 81               [ 4]  283 	ret
                                    284 ;	uart.c: 108: static uint8_t int32_to_digits(uint32_t val)
                                    285 ;	-----------------------------------------
                                    286 ;	 function int32_to_digits
                                    287 ;	-----------------------------------------
      009557                        288 _int32_to_digits:
      009557 52 05            [ 2]  289 	sub	sp, #5
                                    290 ;	uart.c: 111: uint8_t num_digits = 0;
      009559 0F 03            [ 1]  291 	clr	(0x03, sp)
                                    292 ;	uart.c: 113: digits_buf[0] = '0';
      00955B AE 01 A4         [ 2]  293 	ldw	x, #_digits_buf+0
      00955E 1F 04            [ 2]  294 	ldw	(0x04, sp), x
      009560 1E 04            [ 2]  295 	ldw	x, (0x04, sp)
      009562 A6 30            [ 1]  296 	ld	a, #0x30
      009564 F7               [ 1]  297 	ld	(x), a
                                    298 ;	uart.c: 115: for (i = 0; i < 12 && val != 0; i++) {
      009565 0F 02            [ 1]  299 	clr	(0x02, sp)
      009567                        300 00106$:
      009567 7B 02            [ 1]  301 	ld	a, (0x02, sp)
      009569 A1 0C            [ 1]  302 	cp	a, #0x0c
      00956B 24 4F            [ 1]  303 	jrnc	00103$
      00956D 1E 0A            [ 2]  304 	ldw	x, (0x0a, sp)
      00956F A3 00 00         [ 2]  305 	cpw	x, #0x0000
      009572 26 07            [ 1]  306 	jrne	00129$
      009574 1E 08            [ 2]  307 	ldw	x, (0x08, sp)
      009576 A3 00 00         [ 2]  308 	cpw	x, #0x0000
      009579 27 41            [ 1]  309 	jreq	00103$
      00957B                        310 00129$:
                                    311 ;	uart.c: 116: uint8_t digit = val % 10;
      00957B 4B 0A            [ 1]  312 	push	#0x0a
      00957D 5F               [ 1]  313 	clrw	x
      00957E 89               [ 2]  314 	pushw	x
      00957F 4B 00            [ 1]  315 	push	#0x00
      009581 1E 0E            [ 2]  316 	ldw	x, (0x0e, sp)
      009583 89               [ 2]  317 	pushw	x
      009584 1E 0E            [ 2]  318 	ldw	x, (0x0e, sp)
      009586 89               [ 2]  319 	pushw	x
      009587 CD 9D AF         [ 4]  320 	call	__modulong
      00958A 5B 08            [ 2]  321 	addw	sp, #8
      00958C 9F               [ 1]  322 	ld	a, xl
      00958D 6B 01            [ 1]  323 	ld	(0x01, sp), a
                                    324 ;	uart.c: 117: digits_buf[i] = '0' + digit;
      00958F 5F               [ 1]  325 	clrw	x
      009590 7B 02            [ 1]  326 	ld	a, (0x02, sp)
      009592 97               [ 1]  327 	ld	xl, a
      009593 72 FB 04         [ 2]  328 	addw	x, (0x04, sp)
      009596 7B 01            [ 1]  329 	ld	a, (0x01, sp)
      009598 AB 30            [ 1]  330 	add	a, #0x30
      00959A F7               [ 1]  331 	ld	(x), a
                                    332 ;	uart.c: 118: val /= 10;
      00959B 4B 0A            [ 1]  333 	push	#0x0a
      00959D 5F               [ 1]  334 	clrw	x
      00959E 89               [ 2]  335 	pushw	x
      00959F 4B 00            [ 1]  336 	push	#0x00
      0095A1 1E 0E            [ 2]  337 	ldw	x, (0x0e, sp)
      0095A3 89               [ 2]  338 	pushw	x
      0095A4 1E 0E            [ 2]  339 	ldw	x, (0x0e, sp)
      0095A6 89               [ 2]  340 	pushw	x
      0095A7 CD 9E 1F         [ 4]  341 	call	__divulong
      0095AA 5B 08            [ 2]  342 	addw	sp, #8
      0095AC 1F 0A            [ 2]  343 	ldw	(0x0a, sp), x
      0095AE 17 08            [ 2]  344 	ldw	(0x08, sp), y
                                    345 ;	uart.c: 119: if (digit) // We only really want to know about non-zero digits
      0095B0 0D 01            [ 1]  346 	tnz	(0x01, sp)
      0095B2 27 04            [ 1]  347 	jreq	00107$
                                    348 ;	uart.c: 120: num_digits = i;
      0095B4 7B 02            [ 1]  349 	ld	a, (0x02, sp)
      0095B6 6B 03            [ 1]  350 	ld	(0x03, sp), a
      0095B8                        351 00107$:
                                    352 ;	uart.c: 115: for (i = 0; i < 12 && val != 0; i++) {
      0095B8 0C 02            [ 1]  353 	inc	(0x02, sp)
      0095BA 20 AB            [ 2]  354 	jra	00106$
      0095BC                        355 00103$:
                                    356 ;	uart.c: 123: return num_digits + 1;
      0095BC 7B 03            [ 1]  357 	ld	a, (0x03, sp)
      0095BE 4C               [ 1]  358 	inc	a
      0095BF 5B 05            [ 2]  359 	addw	sp, #5
      0095C1 81               [ 4]  360 	ret
                                    361 ;	uart.c: 126: void uart_write_int32(uint32_t val)
                                    362 ;	-----------------------------------------
                                    363 ;	 function uart_write_int32
                                    364 ;	-----------------------------------------
      0095C2                        365 _uart_write_int32:
      0095C2 52 03            [ 2]  366 	sub	sp, #3
                                    367 ;	uart.c: 131: highest_nonzero = int32_to_digits(val);
      0095C4 1E 08            [ 2]  368 	ldw	x, (0x08, sp)
      0095C6 89               [ 2]  369 	pushw	x
      0095C7 1E 08            [ 2]  370 	ldw	x, (0x08, sp)
      0095C9 89               [ 2]  371 	pushw	x
      0095CA CD 95 57         [ 4]  372 	call	_int32_to_digits
      0095CD 5B 04            [ 2]  373 	addw	sp, #4
                                    374 ;	uart.c: 133: for (i = highest_nonzero-1; i >= 0; i--) {
      0095CF 4A               [ 1]  375 	dec	a
      0095D0 AE 01 A4         [ 2]  376 	ldw	x, #_digits_buf+0
      0095D3 1F 02            [ 2]  377 	ldw	(0x02, sp), x
      0095D5 6B 01            [ 1]  378 	ld	(0x01, sp), a
      0095D7                        379 00103$:
      0095D7 0D 01            [ 1]  380 	tnz	(0x01, sp)
      0095D9 2B 11            [ 1]  381 	jrmi	00105$
                                    382 ;	uart.c: 134: uart_write_ch(digits_buf[i]);
      0095DB 5F               [ 1]  383 	clrw	x
      0095DC 7B 01            [ 1]  384 	ld	a, (0x01, sp)
      0095DE 97               [ 1]  385 	ld	xl, a
      0095DF 72 FB 02         [ 2]  386 	addw	x, (0x02, sp)
      0095E2 F6               [ 1]  387 	ld	a, (x)
      0095E3 88               [ 1]  388 	push	a
      0095E4 CD 94 5A         [ 4]  389 	call	_uart_write_ch
      0095E7 84               [ 1]  390 	pop	a
                                    391 ;	uart.c: 133: for (i = highest_nonzero-1; i >= 0; i--) {
      0095E8 0A 01            [ 1]  392 	dec	(0x01, sp)
      0095EA 20 EB            [ 2]  393 	jra	00103$
      0095EC                        394 00105$:
      0095EC 5B 03            [ 2]  395 	addw	sp, #3
      0095EE 81               [ 4]  396 	ret
                                    397 ;	uart.c: 138: void uart_write_milliamp(uint16_t val)
                                    398 ;	-----------------------------------------
                                    399 ;	 function uart_write_milliamp
                                    400 ;	-----------------------------------------
      0095EF                        401 _uart_write_milliamp:
      0095EF 52 03            [ 2]  402 	sub	sp, #3
                                    403 ;	uart.c: 143: highest_nonzero = int_to_digits(val);
      0095F1 1E 06            [ 2]  404 	ldw	x, (0x06, sp)
      0095F3 89               [ 2]  405 	pushw	x
      0095F4 CD 94 DF         [ 4]  406 	call	_int_to_digits
      0095F7 85               [ 2]  407 	popw	x
                                    408 ;	uart.c: 145: for (i = highest_nonzero-1; i >= 0; i--) {
      0095F8 4A               [ 1]  409 	dec	a
      0095F9 AE 01 A4         [ 2]  410 	ldw	x, #_digits_buf+0
      0095FC 1F 01            [ 2]  411 	ldw	(0x01, sp), x
      0095FE 6B 03            [ 1]  412 	ld	(0x03, sp), a
      009600                        413 00105$:
      009600 0D 03            [ 1]  414 	tnz	(0x03, sp)
      009602 2B 1D            [ 1]  415 	jrmi	00107$
                                    416 ;	uart.c: 146: if (i == 2)
      009604 7B 03            [ 1]  417 	ld	a, (0x03, sp)
      009606 A1 02            [ 1]  418 	cp	a, #0x02
      009608 26 06            [ 1]  419 	jrne	00102$
                                    420 ;	uart.c: 147: uart_write_ch('.');
      00960A 4B 2E            [ 1]  421 	push	#0x2e
      00960C CD 94 5A         [ 4]  422 	call	_uart_write_ch
      00960F 84               [ 1]  423 	pop	a
      009610                        424 00102$:
                                    425 ;	uart.c: 148: uart_write_ch(digits_buf[i]);
      009610 5F               [ 1]  426 	clrw	x
      009611 7B 03            [ 1]  427 	ld	a, (0x03, sp)
      009613 97               [ 1]  428 	ld	xl, a
      009614 72 FB 01         [ 2]  429 	addw	x, (0x01, sp)
      009617 F6               [ 1]  430 	ld	a, (x)
      009618 88               [ 1]  431 	push	a
      009619 CD 94 5A         [ 4]  432 	call	_uart_write_ch
      00961C 84               [ 1]  433 	pop	a
                                    434 ;	uart.c: 145: for (i = highest_nonzero-1; i >= 0; i--) {
      00961D 0A 03            [ 1]  435 	dec	(0x03, sp)
      00961F 20 DF            [ 2]  436 	jra	00105$
      009621                        437 00107$:
      009621 5B 03            [ 2]  438 	addw	sp, #3
      009623 81               [ 4]  439 	ret
                                    440 ;	uart.c: 152: void uart_write_millivolt(uint16_t val)
                                    441 ;	-----------------------------------------
                                    442 ;	 function uart_write_millivolt
                                    443 ;	-----------------------------------------
      009624                        444 _uart_write_millivolt:
      009624 52 03            [ 2]  445 	sub	sp, #3
                                    446 ;	uart.c: 157: highest_nonzero = int_to_digits(val);
      009626 1E 06            [ 2]  447 	ldw	x, (0x06, sp)
      009628 89               [ 2]  448 	pushw	x
      009629 CD 94 DF         [ 4]  449 	call	_int_to_digits
      00962C 85               [ 2]  450 	popw	x
                                    451 ;	uart.c: 159: for (i = highest_nonzero-1; i >= 0; i--) {
      00962D 4A               [ 1]  452 	dec	a
      00962E AE 01 A4         [ 2]  453 	ldw	x, #_digits_buf+0
      009631 1F 02            [ 2]  454 	ldw	(0x02, sp), x
      009633 6B 01            [ 1]  455 	ld	(0x01, sp), a
      009635                        456 00105$:
      009635 0D 01            [ 1]  457 	tnz	(0x01, sp)
      009637 2B 1D            [ 1]  458 	jrmi	00107$
                                    459 ;	uart.c: 160: if (i == 2)
      009639 7B 01            [ 1]  460 	ld	a, (0x01, sp)
      00963B A1 02            [ 1]  461 	cp	a, #0x02
      00963D 26 06            [ 1]  462 	jrne	00102$
                                    463 ;	uart.c: 161: uart_write_ch('.');
      00963F 4B 2E            [ 1]  464 	push	#0x2e
      009641 CD 94 5A         [ 4]  465 	call	_uart_write_ch
      009644 84               [ 1]  466 	pop	a
      009645                        467 00102$:
                                    468 ;	uart.c: 162: uart_write_ch(digits_buf[i]);
      009645 5F               [ 1]  469 	clrw	x
      009646 7B 01            [ 1]  470 	ld	a, (0x01, sp)
      009648 97               [ 1]  471 	ld	xl, a
      009649 72 FB 02         [ 2]  472 	addw	x, (0x02, sp)
      00964C F6               [ 1]  473 	ld	a, (x)
      00964D 88               [ 1]  474 	push	a
      00964E CD 94 5A         [ 4]  475 	call	_uart_write_ch
      009651 84               [ 1]  476 	pop	a
                                    477 ;	uart.c: 159: for (i = highest_nonzero-1; i >= 0; i--) {
      009652 0A 01            [ 1]  478 	dec	(0x01, sp)
      009654 20 DF            [ 2]  479 	jra	00105$
      009656                        480 00107$:
      009656 5B 03            [ 2]  481 	addw	sp, #3
      009658 81               [ 4]  482 	ret
                                    483 ;	uart.c: 166: void uart_write_fixed_point(uint32_t val)
                                    484 ;	-----------------------------------------
                                    485 ;	 function uart_write_fixed_point
                                    486 ;	-----------------------------------------
      009659                        487 _uart_write_fixed_point:
      009659 52 04            [ 2]  488 	sub	sp, #4
                                    489 ;	uart.c: 171: tmp = val >> FIXED_SHIFT;
      00965B 16 07            [ 2]  490 	ldw	y, (0x07, sp)
      00965D 5F               [ 1]  491 	clrw	x
                                    492 ;	uart.c: 172: uart_write_int(tmp);
      00965E 90 89            [ 2]  493 	pushw	y
      009660 CD 95 2E         [ 4]  494 	call	_uart_write_int
      009663 85               [ 2]  495 	popw	x
                                    496 ;	uart.c: 173: uart_write_ch('.');
      009664 4B 2E            [ 1]  497 	push	#0x2e
      009666 CD 94 5A         [ 4]  498 	call	_uart_write_ch
      009669 84               [ 1]  499 	pop	a
                                    500 ;	uart.c: 176: tmp = val & FIXED_FRACTION_MASK;
      00966A 16 09            [ 2]  501 	ldw	y, (0x09, sp)
      00966C 5F               [ 1]  502 	clrw	x
                                    503 ;	uart.c: 179: tmp = fixed_round(tmp*10000);
      00966D 90 89            [ 2]  504 	pushw	y
      00966F 89               [ 2]  505 	pushw	x
      009670 4B 10            [ 1]  506 	push	#0x10
      009672 4B 27            [ 1]  507 	push	#0x27
      009674 5F               [ 1]  508 	clrw	x
      009675 89               [ 2]  509 	pushw	x
      009676 CD 9F 09         [ 4]  510 	call	__mullong
      009679 5B 08            [ 2]  511 	addw	sp, #8
      00967B 89               [ 2]  512 	pushw	x
      00967C 90 89            [ 2]  513 	pushw	y
      00967E CD 9A F5         [ 4]  514 	call	_fixed_round
      009681 5B 04            [ 2]  515 	addw	sp, #4
      009683 17 01            [ 2]  516 	ldw	(0x01, sp), y
                                    517 ;	uart.c: 182: if (tmp < 1000)
      009685 A3 03 E8         [ 2]  518 	cpw	x, #0x03e8
      009688 7B 02            [ 1]  519 	ld	a, (0x02, sp)
      00968A A2 00            [ 1]  520 	sbc	a, #0x00
      00968C 7B 01            [ 1]  521 	ld	a, (0x01, sp)
      00968E A2 00            [ 1]  522 	sbc	a, #0x00
      009690 24 08            [ 1]  523 	jrnc	00102$
                                    524 ;	uart.c: 183: uart_write_ch('0');
      009692 89               [ 2]  525 	pushw	x
      009693 4B 30            [ 1]  526 	push	#0x30
      009695 CD 94 5A         [ 4]  527 	call	_uart_write_ch
      009698 84               [ 1]  528 	pop	a
      009699 85               [ 2]  529 	popw	x
      00969A                        530 00102$:
                                    531 ;	uart.c: 184: if (tmp < 100)
      00969A A3 00 64         [ 2]  532 	cpw	x, #0x0064
      00969D 7B 02            [ 1]  533 	ld	a, (0x02, sp)
      00969F A2 00            [ 1]  534 	sbc	a, #0x00
      0096A1 7B 01            [ 1]  535 	ld	a, (0x01, sp)
      0096A3 A2 00            [ 1]  536 	sbc	a, #0x00
      0096A5 24 08            [ 1]  537 	jrnc	00104$
                                    538 ;	uart.c: 185: uart_write_ch('0');
      0096A7 89               [ 2]  539 	pushw	x
      0096A8 4B 30            [ 1]  540 	push	#0x30
      0096AA CD 94 5A         [ 4]  541 	call	_uart_write_ch
      0096AD 84               [ 1]  542 	pop	a
      0096AE 85               [ 2]  543 	popw	x
      0096AF                        544 00104$:
                                    545 ;	uart.c: 186: if (tmp < 10)
      0096AF A3 00 0A         [ 2]  546 	cpw	x, #0x000a
      0096B2 7B 02            [ 1]  547 	ld	a, (0x02, sp)
      0096B4 A2 00            [ 1]  548 	sbc	a, #0x00
      0096B6 7B 01            [ 1]  549 	ld	a, (0x01, sp)
      0096B8 A2 00            [ 1]  550 	sbc	a, #0x00
      0096BA 24 08            [ 1]  551 	jrnc	00106$
                                    552 ;	uart.c: 187: uart_write_ch('0');
      0096BC 89               [ 2]  553 	pushw	x
      0096BD 4B 30            [ 1]  554 	push	#0x30
      0096BF CD 94 5A         [ 4]  555 	call	_uart_write_ch
      0096C2 84               [ 1]  556 	pop	a
      0096C3 85               [ 2]  557 	popw	x
      0096C4                        558 00106$:
                                    559 ;	uart.c: 190: uart_write_int32(tmp);
      0096C4 89               [ 2]  560 	pushw	x
      0096C5 1E 03            [ 2]  561 	ldw	x, (0x03, sp)
      0096C7 89               [ 2]  562 	pushw	x
      0096C8 CD 95 C2         [ 4]  563 	call	_uart_write_int32
      0096CB 5B 08            [ 2]  564 	addw	sp, #8
      0096CD 81               [ 4]  565 	ret
                                    566 ;	uart.c: 193: void uart_write_from_buf(void)
                                    567 ;	-----------------------------------------
                                    568 ;	 function uart_write_from_buf
                                    569 ;	-----------------------------------------
      0096CE                        570 _uart_write_from_buf:
                                    571 ;	uart.c: 195: USART1_DR = uart_write_buf[uart_write_start];
      0096CE AE 00 61         [ 2]  572 	ldw	x, #_uart_write_buf+0
      0096D1 9F               [ 1]  573 	ld	a, xl
      0096D2 CB 01 60         [ 1]  574 	add	a, _uart_write_start+0
      0096D5 02               [ 1]  575 	rlwa	x
      0096D6 A9 00            [ 1]  576 	adc	a, #0x00
      0096D8 95               [ 1]  577 	ld	xh, a
      0096D9 F6               [ 1]  578 	ld	a, (x)
      0096DA AE 52 31         [ 2]  579 	ldw	x, #0x5231
      0096DD F7               [ 1]  580 	ld	(x), a
                                    581 ;	uart.c: 196: uart_write_start++;
      0096DE 72 5C 01 60      [ 1]  582 	inc	_uart_write_start+0
                                    583 ;	uart.c: 197: uart_write_len--;
      0096E2 72 5A 01 61      [ 1]  584 	dec	_uart_write_len+0
                                    585 ;	uart.c: 199: if (uart_write_len == 0)
      0096E6 72 5D 01 61      [ 1]  586 	tnz	_uart_write_len+0
      0096EA 26 04            [ 1]  587 	jrne	00103$
                                    588 ;	uart.c: 200: uart_write_start = 0;
      0096EC 72 5F 01 60      [ 1]  589 	clr	_uart_write_start+0
      0096F0                        590 00103$:
      0096F0 81               [ 4]  591 	ret
                                    592 ;	uart.c: 208: void uart_read_to_buf(void)
                                    593 ;	-----------------------------------------
                                    594 ;	 function uart_read_to_buf
                                    595 ;	-----------------------------------------
      0096F1                        596 _uart_read_to_buf:
                                    597 ;	uart.c: 211: uint8_t ch = uart_read_ch();
      0096F1 AE 52 31         [ 2]  598 	ldw	x, #0x5231
      0096F4 F6               [ 1]  599 	ld	a, (x)
      0096F5 90 95            [ 1]  600 	ld	yh, a
                                    601 ;	uart.c: 213: if (ch >= 'a' && ch <= 'z')
      0096F7 A1 61            [ 1]  602 	cp	a, #0x61
      0096F9 25 08            [ 1]  603 	jrc	00102$
      0096FB A1 7A            [ 1]  604 	cp	a, #0x7a
      0096FD 22 04            [ 1]  605 	jrugt	00102$
                                    606 ;	uart.c: 214: ch = ch - 'a' + 'A'; // Convert letters to uppercase
      0096FF AB E0            [ 1]  607 	add	a, #0xe0
      009701 90 95            [ 1]  608 	ld	yh, a
      009703                        609 00102$:
                                    610 ;	uart.c: 216: uart_read_buf[uart_read_len] = ch;
      009703 AE 01 62         [ 2]  611 	ldw	x, #_uart_read_buf+0
      009706 9F               [ 1]  612 	ld	a, xl
      009707 CB 01 A2         [ 1]  613 	add	a, _uart_read_len+0
      00970A 02               [ 1]  614 	rlwa	x
      00970B A9 00            [ 1]  615 	adc	a, #0x00
      00970D 95               [ 1]  616 	ld	xh, a
      00970E 90 9E            [ 1]  617 	ld	a, yh
      009710 F7               [ 1]  618 	ld	(x), a
                                    619 ;	uart.c: 217: uart_read_len++;
      009711 72 5C 01 A2      [ 1]  620 	inc	_uart_read_len+0
                                    621 ;	uart.c: 219: if (ch == '\r' || ch == '\n')
      009715 90 9E            [ 1]  622 	ld	a, yh
      009717 A1 0D            [ 1]  623 	cp	a, #0x0d
      009719 27 06            [ 1]  624 	jreq	00104$
      00971B 90 9E            [ 1]  625 	ld	a, yh
      00971D A1 0A            [ 1]  626 	cp	a, #0x0a
      00971F 26 04            [ 1]  627 	jrne	00105$
      009721                        628 00104$:
                                    629 ;	uart.c: 220: read_newline = 1;
      009721 35 01 01 A3      [ 1]  630 	mov	_read_newline+0, #0x01
      009725                        631 00105$:
                                    632 ;	uart.c: 223: if (uart_read_len == sizeof(uart_read_buf) && !read_newline) {
      009725 C6 01 A2         [ 1]  633 	ld	a, _uart_read_len+0
      009728 A1 40            [ 1]  634 	cp	a, #0x40
      00972A 26 12            [ 1]  635 	jrne	00111$
      00972C 72 5D 01 A3      [ 1]  636 	tnz	_read_newline+0
      009730 26 0C            [ 1]  637 	jrne	00111$
                                    638 ;	uart.c: 224: uart_read_len = 0;
      009732 72 5F 01 A2      [ 1]  639 	clr	_uart_read_len+0
                                    640 ;	uart.c: 225: uart_write_str("READ OVERFLOW\r\n");
      009736 AE 97 65         [ 2]  641 	ldw	x, #___str_0+0
      009739 89               [ 2]  642 	pushw	x
      00973A CD 94 79         [ 4]  643 	call	_uart_write_str
      00973D 85               [ 2]  644 	popw	x
      00973E                        645 00111$:
      00973E 81               [ 4]  646 	ret
                                    647 ;	uart.c: 229: void uart_drive(void)
                                    648 ;	-----------------------------------------
                                    649 ;	 function uart_drive
                                    650 ;	-----------------------------------------
      00973F                        651 _uart_drive:
                                    652 ;	uart.c: 231: uint8_t sr = USART1_SR;
      00973F AE 52 30         [ 2]  653 	ldw	x, #0x5230
      009742 F6               [ 1]  654 	ld	a, (x)
                                    655 ;	uart.c: 233: if (sr & USART_SR_RXNE) {
      009743 A5 20            [ 1]  656 	bcp	a, #0x20
      009745 27 05            [ 1]  657 	jreq	00102$
                                    658 ;	uart.c: 234: uart_read_to_buf();
      009747 88               [ 1]  659 	push	a
      009748 CD 96 F1         [ 4]  660 	call	_uart_read_to_buf
      00974B 84               [ 1]  661 	pop	a
      00974C                        662 00102$:
                                    663 ;	uart.c: 236: if ((sr & USART_SR_TXE) && uart_write_len) {
      00974C 4D               [ 1]  664 	tnz	a
      00974D 2A 09            [ 1]  665 	jrpl	00106$
      00974F 72 5D 01 61      [ 1]  666 	tnz	_uart_write_len+0
      009753 27 03            [ 1]  667 	jreq	00106$
                                    668 ;	uart.c: 237: uart_write_from_buf();
      009755 CD 96 CE         [ 4]  669 	call	_uart_write_from_buf
      009758                        670 00106$:
      009758 81               [ 4]  671 	ret
                                    672 ;	uart.c: 241: void uart_flush_writes(void)
                                    673 ;	-----------------------------------------
                                    674 ;	 function uart_flush_writes
                                    675 ;	-----------------------------------------
      009759                        676 _uart_flush_writes:
                                    677 ;	uart.c: 243: while (uart_write_len > 0)
      009759                        678 00101$:
      009759 72 5D 01 61      [ 1]  679 	tnz	_uart_write_len+0
      00975D 27 05            [ 1]  680 	jreq	00104$
                                    681 ;	uart.c: 244: uart_drive();
      00975F CD 97 3F         [ 4]  682 	call	_uart_drive
      009762 20 F5            [ 2]  683 	jra	00101$
      009764                        684 00104$:
      009764 81               [ 4]  685 	ret
                                    686 	.area CODE
      009765                        687 ___str_0:
      009765 52 45 41 44 20 4F 56   688 	.ascii "READ OVERFLOW"
             45 52 46 4C 4F 57
      009772 0D                     689 	.db 0x0D
      009773 0A                     690 	.db 0x0A
      009774 00                     691 	.db 0x00
                                    692 	.area INITIALIZER
                                    693 	.area CABS (ABS)
