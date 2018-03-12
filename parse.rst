                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Mon Mar 12 12:44:10 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module parse
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _parse_num
                                     13 	.globl _uart_write_str
                                     14 	.globl _uart_write_ch
                                     15 	.globl _parse_millinum
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area INITIALIZED
                                     24 ;--------------------------------------------------------
                                     25 ; absolute external ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DABS (ABS)
                                     28 ;--------------------------------------------------------
                                     29 ; global & static initialisations
                                     30 ;--------------------------------------------------------
                                     31 	.area HOME
                                     32 	.area GSINIT
                                     33 	.area GSFINAL
                                     34 	.area GSINIT
                                     35 ;--------------------------------------------------------
                                     36 ; Home
                                     37 ;--------------------------------------------------------
                                     38 	.area HOME
                                     39 	.area HOME
                                     40 ;--------------------------------------------------------
                                     41 ; code
                                     42 ;--------------------------------------------------------
                                     43 	.area CODE
                                     44 ;	parse.c: 22: uint16_t parse_num(uint8_t *s, uint8_t **stop, uint8_t *digits_seen)
                                     45 ;	-----------------------------------------
                                     46 ;	 function parse_num
                                     47 ;	-----------------------------------------
      009B2B                         48 _parse_num:
      009B2B 52 06            [ 2]   49 	sub	sp, #6
                                     50 ;	parse.c: 25: uint16_t num = 0;
      009B2D 5F               [ 1]   51 	clrw	x
      009B2E 1F 03            [ 2]   52 	ldw	(0x03, sp), x
                                     53 ;	parse.c: 27: *digits_seen = 0;
      009B30 16 0D            [ 2]   54 	ldw	y, (0x0d, sp)
      009B32 17 05            [ 2]   55 	ldw	(0x05, sp), y
      009B34 1E 05            [ 2]   56 	ldw	x, (0x05, sp)
      009B36 7F               [ 1]   57 	clr	(x)
      009B37 16 09            [ 2]   58 	ldw	y, (0x09, sp)
      009B39                         59 00104$:
                                     60 ;	parse.c: 29: for (; *s >= '0' && *s <= '9'; s++) {
      009B39 90 F6            [ 1]   61 	ld	a, (y)
      009B3B A1 30            [ 1]   62 	cp	a, #0x30
      009B3D 25 28            [ 1]   63 	jrc	00101$
      009B3F A1 39            [ 1]   64 	cp	a, #0x39
      009B41 22 24            [ 1]   65 	jrugt	00101$
                                     66 ;	parse.c: 30: digit = *s - '0';
      009B43 A0 30            [ 1]   67 	sub	a, #0x30
                                     68 ;	parse.c: 31: num *= 10;
      009B45 88               [ 1]   69 	push	a
      009B46 90 89            [ 2]   70 	pushw	y
      009B48 1E 06            [ 2]   71 	ldw	x, (0x06, sp)
      009B4A 89               [ 2]   72 	pushw	x
      009B4B 4B 0A            [ 1]   73 	push	#0x0a
      009B4D 4B 00            [ 1]   74 	push	#0x00
      009B4F CD 9D 8E         [ 4]   75 	call	__mulint
      009B52 5B 04            [ 2]   76 	addw	sp, #4
      009B54 90 85            [ 2]   77 	popw	y
      009B56 84               [ 1]   78 	pop	a
      009B57 1F 01            [ 2]   79 	ldw	(0x01, sp), x
                                     80 ;	parse.c: 32: num += digit;
      009B59 5F               [ 1]   81 	clrw	x
      009B5A 97               [ 1]   82 	ld	xl, a
      009B5B 72 FB 01         [ 2]   83 	addw	x, (0x01, sp)
      009B5E 1F 03            [ 2]   84 	ldw	(0x03, sp), x
                                     85 ;	parse.c: 33: (*digits_seen)++;
      009B60 1E 05            [ 2]   86 	ldw	x, (0x05, sp)
      009B62 7C               [ 1]   87 	inc	(x)
                                     88 ;	parse.c: 29: for (; *s >= '0' && *s <= '9'; s++) {
      009B63 90 5C            [ 2]   89 	incw	y
      009B65 20 D2            [ 2]   90 	jra	00104$
      009B67                         91 00101$:
                                     92 ;	parse.c: 36: *stop = s;
      009B67 1E 0B            [ 2]   93 	ldw	x, (0x0b, sp)
      009B69 FF               [ 2]   94 	ldw	(x), y
                                     95 ;	parse.c: 37: return num;
      009B6A 1E 03            [ 2]   96 	ldw	x, (0x03, sp)
      009B6C 5B 06            [ 2]   97 	addw	sp, #6
      009B6E 81               [ 4]   98 	ret
                                     99 ;	parse.c: 40: uint16_t parse_millinum(uint8_t *s)
                                    100 ;	-----------------------------------------
                                    101 ;	 function parse_millinum
                                    102 ;	-----------------------------------------
      009B6F                        103 _parse_millinum:
      009B6F 52 1B            [ 2]  104 	sub	sp, #27
                                    105 ;	parse.c: 42: uint8_t *t = s;
      009B71 16 1E            [ 2]  106 	ldw	y, (0x1e, sp)
      009B73 17 0A            [ 2]  107 	ldw	(0x0a, sp), y
                                    108 ;	parse.c: 48: whole_digits = parse_num(s, &stop, &digits_seen);
      009B75 96               [ 1]  109 	ldw	x, sp
      009B76 5C               [ 2]  110 	incw	x
      009B77 1F 1A            [ 2]  111 	ldw	(0x1a, sp), x
      009B79 16 1A            [ 2]  112 	ldw	y, (0x1a, sp)
      009B7B 96               [ 1]  113 	ldw	x, sp
      009B7C 1C 00 08         [ 2]  114 	addw	x, #8
      009B7F 1F 18            [ 2]  115 	ldw	(0x18, sp), x
      009B81 1E 18            [ 2]  116 	ldw	x, (0x18, sp)
      009B83 90 89            [ 2]  117 	pushw	y
      009B85 89               [ 2]  118 	pushw	x
      009B86 1E 0E            [ 2]  119 	ldw	x, (0x0e, sp)
      009B88 89               [ 2]  120 	pushw	x
      009B89 CD 9B 2B         [ 4]  121 	call	_parse_num
      009B8C 5B 06            [ 2]  122 	addw	sp, #6
      009B8E 1F 16            [ 2]  123 	ldw	(0x16, sp), x
                                    124 ;	parse.c: 49: if (whole_digits > 62 || digits_seen > 2)
      009B90 1E 16            [ 2]  125 	ldw	x, (0x16, sp)
      009B92 A3 00 3E         [ 2]  126 	cpw	x, #0x003e
      009B95 23 03            [ 2]  127 	jrule	00151$
      009B97 CC 9C 38         [ 2]  128 	jp	00116$
      009B9A                        129 00151$:
      009B9A 7B 01            [ 1]  130 	ld	a, (0x01, sp)
      009B9C A1 02            [ 1]  131 	cp	a, #0x02
      009B9E 23 03            [ 2]  132 	jrule	00152$
      009BA0 CC 9C 38         [ 2]  133 	jp	00116$
      009BA3                        134 00152$:
                                    135 ;	parse.c: 52: whole_digits *= 1000;
      009BA3 1E 16            [ 2]  136 	ldw	x, (0x16, sp)
      009BA5 89               [ 2]  137 	pushw	x
      009BA6 4B E8            [ 1]  138 	push	#0xe8
      009BA8 4B 03            [ 1]  139 	push	#0x03
      009BAA CD 9D 8E         [ 4]  140 	call	__mulint
      009BAD 5B 04            [ 2]  141 	addw	sp, #4
      009BAF 1F 02            [ 2]  142 	ldw	(0x02, sp), x
                                    143 ;	parse.c: 54: if (*stop == '\0')
      009BB1 1E 08            [ 2]  144 	ldw	x, (0x08, sp)
      009BB3 F6               [ 1]  145 	ld	a, (x)
      009BB4 4D               [ 1]  146 	tnz	a
      009BB5 26 05            [ 1]  147 	jrne	00105$
                                    148 ;	parse.c: 55: return whole_digits;
      009BB7 1E 02            [ 2]  149 	ldw	x, (0x02, sp)
      009BB9 CC 9C 58         [ 2]  150 	jp	00117$
      009BBC                        151 00105$:
                                    152 ;	parse.c: 57: if (*stop != '.')
      009BBC A1 2E            [ 1]  153 	cp	a, #0x2e
      009BBE 26 78            [ 1]  154 	jrne	00116$
                                    155 ;	parse.c: 60: fraction_digits = parse_num(stop+1, &stop, &digits_seen);
      009BC0 16 1A            [ 2]  156 	ldw	y, (0x1a, sp)
      009BC2 17 14            [ 2]  157 	ldw	(0x14, sp), y
      009BC4 16 18            [ 2]  158 	ldw	y, (0x18, sp)
      009BC6 5C               [ 2]  159 	incw	x
      009BC7 7B 15            [ 1]  160 	ld	a, (0x15, sp)
      009BC9 88               [ 1]  161 	push	a
      009BCA 7B 15            [ 1]  162 	ld	a, (0x15, sp)
      009BCC 88               [ 1]  163 	push	a
      009BCD 90 89            [ 2]  164 	pushw	y
      009BCF 89               [ 2]  165 	pushw	x
      009BD0 CD 9B 2B         [ 4]  166 	call	_parse_num
      009BD3 5B 06            [ 2]  167 	addw	sp, #6
      009BD5 90 5F            [ 1]  168 	clrw	y
      009BD7 1F 06            [ 2]  169 	ldw	(0x06, sp), x
      009BD9 17 04            [ 2]  170 	ldw	(0x04, sp), y
                                    171 ;	parse.c: 61: if (fraction_digits > 999 || digits_seen > 3)
      009BDB AE 03 E7         [ 2]  172 	ldw	x, #0x03e7
      009BDE 13 06            [ 2]  173 	cpw	x, (0x06, sp)
      009BE0 4F               [ 1]  174 	clr	a
      009BE1 12 05            [ 1]  175 	sbc	a, (0x05, sp)
      009BE3 4F               [ 1]  176 	clr	a
      009BE4 12 04            [ 1]  177 	sbc	a, (0x04, sp)
      009BE6 25 50            [ 1]  178 	jrc	00116$
      009BE8 7B 01            [ 1]  179 	ld	a, (0x01, sp)
      009BEA A1 03            [ 1]  180 	cp	a, #0x03
      009BEC 22 4A            [ 1]  181 	jrugt	00116$
                                    182 ;	parse.c: 64: if (digits_seen == 1)
      009BEE 7B 01            [ 1]  183 	ld	a, (0x01, sp)
      009BF0 A1 01            [ 1]  184 	cp	a, #0x01
      009BF2 26 17            [ 1]  185 	jrne	00114$
                                    186 ;	parse.c: 65: fraction_digits *= 100;
      009BF4 1E 06            [ 2]  187 	ldw	x, (0x06, sp)
      009BF6 89               [ 2]  188 	pushw	x
      009BF7 1E 06            [ 2]  189 	ldw	x, (0x06, sp)
      009BF9 89               [ 2]  190 	pushw	x
      009BFA 4B 64            [ 1]  191 	push	#0x64
      009BFC 5F               [ 1]  192 	clrw	x
      009BFD 89               [ 2]  193 	pushw	x
      009BFE 4B 00            [ 1]  194 	push	#0x00
      009C00 CD 9F 09         [ 4]  195 	call	__mullong
      009C03 5B 08            [ 2]  196 	addw	sp, #8
      009C05 1F 06            [ 2]  197 	ldw	(0x06, sp), x
      009C07 17 04            [ 2]  198 	ldw	(0x04, sp), y
      009C09 20 1B            [ 2]  199 	jra	00115$
      009C0B                        200 00114$:
                                    201 ;	parse.c: 66: else if (digits_seen == 2)
      009C0B 7B 01            [ 1]  202 	ld	a, (0x01, sp)
      009C0D A1 02            [ 1]  203 	cp	a, #0x02
      009C0F 26 15            [ 1]  204 	jrne	00115$
                                    205 ;	parse.c: 67: fraction_digits *= 10;
      009C11 1E 06            [ 2]  206 	ldw	x, (0x06, sp)
      009C13 89               [ 2]  207 	pushw	x
      009C14 1E 06            [ 2]  208 	ldw	x, (0x06, sp)
      009C16 89               [ 2]  209 	pushw	x
      009C17 4B 0A            [ 1]  210 	push	#0x0a
      009C19 5F               [ 1]  211 	clrw	x
      009C1A 89               [ 2]  212 	pushw	x
      009C1B 4B 00            [ 1]  213 	push	#0x00
      009C1D CD 9F 09         [ 4]  214 	call	__mullong
      009C20 5B 08            [ 2]  215 	addw	sp, #8
      009C22 1F 06            [ 2]  216 	ldw	(0x06, sp), x
      009C24 17 04            [ 2]  217 	ldw	(0x04, sp), y
      009C26                        218 00115$:
                                    219 ;	parse.c: 69: return whole_digits + fraction_digits;
      009C26 1E 02            [ 2]  220 	ldw	x, (0x02, sp)
      009C28 4F               [ 1]  221 	clr	a
      009C29 0F 10            [ 1]  222 	clr	(0x10, sp)
      009C2B 72 FB 06         [ 2]  223 	addw	x, (0x06, sp)
      009C2E 19 05            [ 1]  224 	adc	a, (0x05, sp)
      009C30 6B 0D            [ 1]  225 	ld	(0x0d, sp), a
      009C32 7B 10            [ 1]  226 	ld	a, (0x10, sp)
      009C34 19 04            [ 1]  227 	adc	a, (0x04, sp)
      009C36 20 20            [ 2]  228 	jra	00117$
                                    229 ;	parse.c: 71: invalid_number:
      009C38                        230 00116$:
                                    231 ;	parse.c: 72: uart_write_str("INVALID NUMBER '");
      009C38 AE 9C 5B         [ 2]  232 	ldw	x, #___str_0+0
      009C3B 89               [ 2]  233 	pushw	x
      009C3C CD 94 79         [ 4]  234 	call	_uart_write_str
      009C3F 85               [ 2]  235 	popw	x
                                    236 ;	parse.c: 73: uart_write_str(t);
      009C40 1E 0A            [ 2]  237 	ldw	x, (0x0a, sp)
      009C42 89               [ 2]  238 	pushw	x
      009C43 CD 94 79         [ 4]  239 	call	_uart_write_str
      009C46 85               [ 2]  240 	popw	x
                                    241 ;	parse.c: 74: uart_write_ch('\'');
      009C47 4B 27            [ 1]  242 	push	#0x27
      009C49 CD 94 5A         [ 4]  243 	call	_uart_write_ch
      009C4C 84               [ 1]  244 	pop	a
                                    245 ;	parse.c: 75: uart_write_str("\r\n");
      009C4D AE 9C 6C         [ 2]  246 	ldw	x, #___str_1+0
      009C50 89               [ 2]  247 	pushw	x
      009C51 CD 94 79         [ 4]  248 	call	_uart_write_str
      009C54 85               [ 2]  249 	popw	x
                                    250 ;	parse.c: 76: return 0xFFFF;
      009C55 AE FF FF         [ 2]  251 	ldw	x, #0xffff
      009C58                        252 00117$:
      009C58 5B 1B            [ 2]  253 	addw	sp, #27
      009C5A 81               [ 4]  254 	ret
                                    255 	.area CODE
      009C5B                        256 ___str_0:
      009C5B 49 4E 56 41 4C 49 44   257 	.ascii "INVALID NUMBER '"
             20 4E 55 4D 42 45 52
             20 27
      009C6B 00                     258 	.db 0x00
      009C6C                        259 ___str_1:
      009C6C 0D                     260 	.db 0x0D
      009C6D 0A                     261 	.db 0x0A
      009C6E 00                     262 	.db 0x00
                                    263 	.area INITIALIZER
                                    264 	.area CABS (ABS)
