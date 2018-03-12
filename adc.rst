                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Mon Mar 12 12:44:11 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module adc
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _fixed_round
                                     13 	.globl _adc_init
                                     14 	.globl _adc_start
                                     15 	.globl _adc_to_volt
                                     16 	.globl _adc_read
                                     17 	.globl _adc_channel
                                     18 	.globl _adc_ready
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
      0001B0                         23 _sum:
      0001B0                         24 	.ds 4
      0001B4                         25 _count:
      0001B4                         26 	.ds 1
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area INITIALIZED
                                     31 ;--------------------------------------------------------
                                     32 ; absolute external ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DABS (ABS)
                                     35 ;--------------------------------------------------------
                                     36 ; global & static initialisations
                                     37 ;--------------------------------------------------------
                                     38 	.area HOME
                                     39 	.area GSINIT
                                     40 	.area GSFINAL
                                     41 	.area GSINIT
                                     42 ;--------------------------------------------------------
                                     43 ; Home
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
                                     46 	.area HOME
                                     47 ;--------------------------------------------------------
                                     48 ; code
                                     49 ;--------------------------------------------------------
                                     50 	.area CODE
                                     51 ;	adc.c: 25: void adc_init(void)
                                     52 ;	-----------------------------------------
                                     53 ;	 function adc_init
                                     54 ;	-----------------------------------------
      009C6F                         55 _adc_init:
                                     56 ;	adc.c: 27: ADC1_CR1 = 0x70; // Power down, clock/18
      009C6F 35 70 54 01      [ 1]   57 	mov	0x5401+0, #0x70
                                     58 ;	adc.c: 28: ADC1_CR2 = 0x08; // Right alignment
      009C73 35 08 54 02      [ 1]   59 	mov	0x5402+0, #0x08
                                     60 ;	adc.c: 29: ADC1_CR3 = 0x00;
      009C77 35 00 54 03      [ 1]   61 	mov	0x5403+0, #0x00
                                     62 ;	adc.c: 30: ADC1_CSR = 0x00;
      009C7B 35 00 54 00      [ 1]   63 	mov	0x5400+0, #0x00
                                     64 ;	adc.c: 32: ADC1_TDRL = 0x0F;
      009C7F 35 0F 54 07      [ 1]   65 	mov	0x5407+0, #0x0f
                                     66 ;	adc.c: 34: ADC1_CR1 |= 0x01; // Turn on the ADC
      009C83 72 10 54 01      [ 1]   67 	bset	0x5401, #0
      009C87 81               [ 4]   68 	ret
                                     69 ;	adc.c: 43: void adc_start(uint8_t channel)
                                     70 ;	-----------------------------------------
                                     71 ;	 function adc_start
                                     72 ;	-----------------------------------------
      009C88                         73 _adc_start:
                                     74 ;	adc.c: 45: uint8_t csr = ADC1_CSR;
      009C88 AE 54 00         [ 2]   75 	ldw	x, #0x5400
      009C8B F6               [ 1]   76 	ld	a, (x)
                                     77 ;	adc.c: 46: csr &= 0x70; // Turn off EOC, Clear Channel
      009C8C A4 70            [ 1]   78 	and	a, #0x70
                                     79 ;	adc.c: 47: csr |= channel; // Select channel
      009C8E 1A 03            [ 1]   80 	or	a, (0x03, sp)
                                     81 ;	adc.c: 48: ADC1_CSR = csr;
      009C90 AE 54 00         [ 2]   82 	ldw	x, #0x5400
      009C93 F7               [ 1]   83 	ld	(x), a
                                     84 ;	adc.c: 50: ADC1_CR1 |= 1; // Trigger conversion
      009C94 72 10 54 01      [ 1]   85 	bset	0x5401, #0
                                     86 ;	adc.c: 52: sum = 0;
      009C98 5F               [ 1]   87 	clrw	x
      009C99 CF 01 B2         [ 2]   88 	ldw	_sum+2, x
      009C9C CF 01 B0         [ 2]   89 	ldw	_sum+0, x
                                     90 ;	adc.c: 53: count = 0;
      009C9F 72 5F 01 B4      [ 1]   91 	clr	_count+0
      009CA3 81               [ 4]   92 	ret
                                     93 ;	adc.c: 56: fixed_t adc_to_volt(uint16_t adc, calibrate_t *cal)
                                     94 ;	-----------------------------------------
                                     95 ;	 function adc_to_volt
                                     96 ;	-----------------------------------------
      009CA4                         97 _adc_to_volt:
      009CA4 52 1A            [ 2]   98 	sub	sp, #26
                                     99 ;	adc.c: 60: tmp = adc * cal->a;
      009CA6 16 1F            [ 2]  100 	ldw	y, (0x1f, sp)
      009CA8 17 15            [ 2]  101 	ldw	(0x15, sp), y
      009CAA 1E 15            [ 2]  102 	ldw	x, (0x15, sp)
      009CAC 89               [ 2]  103 	pushw	x
      009CAD EE 02            [ 2]  104 	ldw	x, (0x2, x)
      009CAF 51               [ 1]  105 	exgw	x, y
      009CB0 85               [ 2]  106 	popw	x
      009CB1 FE               [ 2]  107 	ldw	x, (x)
      009CB2 1F 05            [ 2]  108 	ldw	(0x05, sp), x
      009CB4 1E 1D            [ 2]  109 	ldw	x, (0x1d, sp)
      009CB6 1F 0B            [ 2]  110 	ldw	(0x0b, sp), x
      009CB8 5F               [ 1]  111 	clrw	x
      009CB9 90 89            [ 2]  112 	pushw	y
      009CBB 16 07            [ 2]  113 	ldw	y, (0x07, sp)
      009CBD 90 89            [ 2]  114 	pushw	y
      009CBF 16 0F            [ 2]  115 	ldw	y, (0x0f, sp)
      009CC1 90 89            [ 2]  116 	pushw	y
      009CC3 89               [ 2]  117 	pushw	x
      009CC4 CD 9F 09         [ 4]  118 	call	__mullong
      009CC7 5B 08            [ 2]  119 	addw	sp, #8
      009CC9 1F 0F            [ 2]  120 	ldw	(0x0f, sp), x
      009CCB 17 0D            [ 2]  121 	ldw	(0x0d, sp), y
                                    122 ;	adc.c: 62: if (tmp > cal->b)
      009CCD 1E 15            [ 2]  123 	ldw	x, (0x15, sp)
      009CCF E6 07            [ 1]  124 	ld	a, (0x7, x)
      009CD1 6B 14            [ 1]  125 	ld	(0x14, sp), a
      009CD3 E6 06            [ 1]  126 	ld	a, (0x6, x)
      009CD5 6B 13            [ 1]  127 	ld	(0x13, sp), a
      009CD7 EE 04            [ 2]  128 	ldw	x, (0x4, x)
      009CD9 1F 11            [ 2]  129 	ldw	(0x11, sp), x
      009CDB 1E 13            [ 2]  130 	ldw	x, (0x13, sp)
      009CDD 13 0F            [ 2]  131 	cpw	x, (0x0f, sp)
      009CDF 7B 12            [ 1]  132 	ld	a, (0x12, sp)
      009CE1 12 0E            [ 1]  133 	sbc	a, (0x0e, sp)
      009CE3 7B 11            [ 1]  134 	ld	a, (0x11, sp)
      009CE5 12 0D            [ 1]  135 	sbc	a, (0x0d, sp)
      009CE7 24 1D            [ 1]  136 	jrnc	00102$
                                    137 ;	adc.c: 63: tmp -= cal->b;
      009CE9 1E 0F            [ 2]  138 	ldw	x, (0x0f, sp)
      009CEB 72 F0 13         [ 2]  139 	subw	x, (0x13, sp)
      009CEE 1F 19            [ 2]  140 	ldw	(0x19, sp), x
      009CF0 7B 0E            [ 1]  141 	ld	a, (0x0e, sp)
      009CF2 12 12            [ 1]  142 	sbc	a, (0x12, sp)
      009CF4 6B 18            [ 1]  143 	ld	(0x18, sp), a
      009CF6 7B 0D            [ 1]  144 	ld	a, (0x0d, sp)
      009CF8 12 11            [ 1]  145 	sbc	a, (0x11, sp)
      009CFA 6B 17            [ 1]  146 	ld	(0x17, sp), a
      009CFC 16 19            [ 2]  147 	ldw	y, (0x19, sp)
      009CFE 17 03            [ 2]  148 	ldw	(0x03, sp), y
      009D00 16 17            [ 2]  149 	ldw	y, (0x17, sp)
      009D02 17 01            [ 2]  150 	ldw	(0x01, sp), y
      009D04 20 05            [ 2]  151 	jra	00103$
      009D06                        152 00102$:
                                    153 ;	adc.c: 65: tmp = 0;
      009D06 5F               [ 1]  154 	clrw	x
      009D07 1F 03            [ 2]  155 	ldw	(0x03, sp), x
      009D09 1F 01            [ 2]  156 	ldw	(0x01, sp), x
      009D0B                        157 00103$:
                                    158 ;	adc.c: 67: return fixed_round(tmp);
      009D0B 1E 03            [ 2]  159 	ldw	x, (0x03, sp)
      009D0D 89               [ 2]  160 	pushw	x
      009D0E 1E 03            [ 2]  161 	ldw	x, (0x03, sp)
      009D10 89               [ 2]  162 	pushw	x
      009D11 CD 9A F5         [ 4]  163 	call	_fixed_round
      009D14 5B 1E            [ 2]  164 	addw	sp, #30
      009D16 81               [ 4]  165 	ret
                                    166 ;	adc.c: 78: uint16_t adc_read(void)
                                    167 ;	-----------------------------------------
                                    168 ;	 function adc_read
                                    169 ;	-----------------------------------------
      009D17                        170 _adc_read:
                                    171 ;	adc.c: 80: return sum/8;
      009D17 CE 01 B2         [ 2]  172 	ldw	x, _sum+2
      009D1A 90 CE 01 B0      [ 2]  173 	ldw	y, _sum+0
      009D1E 90 54            [ 2]  174 	srlw	y
      009D20 56               [ 2]  175 	rrcw	x
      009D21 90 54            [ 2]  176 	srlw	y
      009D23 56               [ 2]  177 	rrcw	x
      009D24 90 54            [ 2]  178 	srlw	y
      009D26 56               [ 2]  179 	rrcw	x
      009D27 81               [ 4]  180 	ret
                                    181 ;	adc.c: 83: uint8_t adc_channel(void)
                                    182 ;	-----------------------------------------
                                    183 ;	 function adc_channel
                                    184 ;	-----------------------------------------
      009D28                        185 _adc_channel:
                                    186 ;	adc.c: 85: return ADC1_CSR & 0x0F;
      009D28 AE 54 00         [ 2]  187 	ldw	x, #0x5400
      009D2B F6               [ 1]  188 	ld	a, (x)
      009D2C A4 0F            [ 1]  189 	and	a, #0x0f
      009D2E 81               [ 4]  190 	ret
                                    191 ;	adc.c: 88: uint8_t adc_ready(void)
                                    192 ;	-----------------------------------------
                                    193 ;	 function adc_ready
                                    194 ;	-----------------------------------------
      009D2F                        195 _adc_ready:
      009D2F 52 03            [ 2]  196 	sub	sp, #3
                                    197 ;	adc.c: 90: if (ADC1_CSR & 0x80) {
      009D31 AE 54 00         [ 2]  198 	ldw	x, #0x5400
      009D34 F6               [ 1]  199 	ld	a, (x)
      009D35 6B 03            [ 1]  200 	ld	(0x03, sp), a
      009D37 0D 03            [ 1]  201 	tnz	(0x03, sp)
      009D39 2A 4F            [ 1]  202 	jrpl	00105$
                                    203 ;	adc.c: 72: uint16_t val = ADC1_DRL;
      009D3B AE 54 05         [ 2]  204 	ldw	x, #0x5405
      009D3E F6               [ 1]  205 	ld	a, (x)
      009D3F 5F               [ 1]  206 	clrw	x
      009D40 97               [ 1]  207 	ld	xl, a
      009D41 1F 01            [ 2]  208 	ldw	(0x01, sp), x
                                    209 ;	adc.c: 73: uint16_t valh = ADC1_DRH;
      009D43 AE 54 04         [ 2]  210 	ldw	x, #0x5404
      009D46 F6               [ 1]  211 	ld	a, (x)
      009D47 95               [ 1]  212 	ld	xh, a
      009D48 4F               [ 1]  213 	clr	a
                                    214 ;	adc.c: 75: return val | (valh<<8);
      009D49 4F               [ 1]  215 	clr	a
      009D4A 1A 02            [ 1]  216 	or	a, (0x02, sp)
      009D4C 97               [ 1]  217 	ld	xl, a
      009D4D 9E               [ 1]  218 	ld	a, xh
      009D4E 1A 01            [ 1]  219 	or	a, (0x01, sp)
                                    220 ;	adc.c: 91: sum += _adc_read();
      009D50 90 95            [ 1]  221 	ld	yh, a
      009D52 9F               [ 1]  222 	ld	a, xl
      009D53 5F               [ 1]  223 	clrw	x
      009D54 90 97            [ 1]  224 	ld	yl, a
      009D56 72 B9 01 B2      [ 2]  225 	addw	y, _sum+2
      009D5A 9F               [ 1]  226 	ld	a, xl
      009D5B C9 01 B1         [ 1]  227 	adc	a, _sum+1
      009D5E 02               [ 1]  228 	rlwa	x
      009D5F C9 01 B0         [ 1]  229 	adc	a, _sum+0
      009D62 95               [ 1]  230 	ld	xh, a
      009D63 90 CF 01 B2      [ 2]  231 	ldw	_sum+2, y
      009D67 CF 01 B0         [ 2]  232 	ldw	_sum+0, x
                                    233 ;	adc.c: 92: count++;
      009D6A C6 01 B4         [ 1]  234 	ld	a, _count+0
      009D6D 4C               [ 1]  235 	inc	a
                                    236 ;	adc.c: 93: if (count < 64) {
      009D6E C7 01 B4         [ 1]  237 	ld	_count+0, a
      009D71 A1 40            [ 1]  238 	cp	a, #0x40
      009D73 24 12            [ 1]  239 	jrnc	00102$
                                    240 ;	adc.c: 39: ADC1_CSR &= 0x7F; // Turn off EOC
      009D75 7B 03            [ 1]  241 	ld	a, (0x03, sp)
      009D77 A4 7F            [ 1]  242 	and	a, #0x7f
      009D79 AE 54 00         [ 2]  243 	ldw	x, #0x5400
      009D7C F7               [ 1]  244 	ld	(x), a
                                    245 ;	adc.c: 40: ADC1_CR1 |= 1; // Trigger conversion
      009D7D AE 54 01         [ 2]  246 	ldw	x, #0x5401
      009D80 F6               [ 1]  247 	ld	a, (x)
      009D81 AA 01            [ 1]  248 	or	a, #0x01
      009D83 F7               [ 1]  249 	ld	(x), a
                                    250 ;	adc.c: 95: return 0;
      009D84 4F               [ 1]  251 	clr	a
      009D85 20 04            [ 2]  252 	jra	00108$
      009D87                        253 00102$:
                                    254 ;	adc.c: 97: return 1;
      009D87 A6 01            [ 1]  255 	ld	a, #0x01
                                    256 ;	adc.c: 100: return 0;
      009D89 21                     257 	.byte 0x21
      009D8A                        258 00105$:
      009D8A 4F               [ 1]  259 	clr	a
      009D8B                        260 00108$:
      009D8B 5B 03            [ 2]  261 	addw	sp, #3
      009D8D 81               [ 4]  262 	ret
                                    263 	.area CODE
                                    264 	.area INITIALIZER
                                    265 	.area CABS (ABS)
