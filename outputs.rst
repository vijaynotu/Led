                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Mon Mar 12 12:44:10 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module outputs
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _pwm_from_set
                                     13 	.globl _uart_write_int
                                     14 	.globl _uart_write_str
                                     15 	.globl _fixed_round
                                     16 	.globl _pwm_init
                                     17 	.globl _output_commit
                                     18 	.globl _output_check_state
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area INITIALIZED
                                     27 ;--------------------------------------------------------
                                     28 ; absolute external ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DABS (ABS)
                                     31 ;--------------------------------------------------------
                                     32 ; global & static initialisations
                                     33 ;--------------------------------------------------------
                                     34 	.area HOME
                                     35 	.area GSINIT
                                     36 	.area GSFINAL
                                     37 	.area GSINIT
                                     38 ;--------------------------------------------------------
                                     39 ; Home
                                     40 ;--------------------------------------------------------
                                     41 	.area HOME
                                     42 	.area HOME
                                     43 ;--------------------------------------------------------
                                     44 ; code
                                     45 ;--------------------------------------------------------
                                     46 	.area CODE
                                     47 ;	outputs.c: 29: void pwm_init(void)
                                     48 ;	-----------------------------------------
                                     49 ;	 function pwm_init
                                     50 ;	-----------------------------------------
      00983F                         51 _pwm_init:
                                     52 ;	outputs.c: 32: TIM1_CR1 = 0x10; // Down direction
      00983F 35 10 52 50      [ 1]   53 	mov	0x5250+0, #0x10
                                     54 ;	outputs.c: 33: TIM1_ARRH = PWM_HIGH; // Reload counter = 16384
      009843 35 20 52 62      [ 1]   55 	mov	0x5262+0, #0x20
                                     56 ;	outputs.c: 34: TIM1_ARRL = PWM_LOW;
      009847 35 00 52 63      [ 1]   57 	mov	0x5263+0, #0x00
                                     58 ;	outputs.c: 35: TIM1_PSCRH = 0; // Prescaler 0 means division by 1
      00984B 35 00 52 60      [ 1]   59 	mov	0x5260+0, #0x00
                                     60 ;	outputs.c: 36: TIM1_PSCRL = 0;
      00984F 35 00 52 61      [ 1]   61 	mov	0x5261+0, #0x00
                                     62 ;	outputs.c: 37: TIM1_RCR = 0; // Continuous
      009853 35 00 52 64      [ 1]   63 	mov	0x5264+0, #0x00
                                     64 ;	outputs.c: 39: TIM1_CCMR1 = 0x70;    //  Set up to use PWM mode 2.
      009857 35 70 52 58      [ 1]   65 	mov	0x5258+0, #0x70
                                     66 ;	outputs.c: 40: TIM1_CCER1 = 0x03;    //  Output is enabled for channel 1, active low
      00985B 35 03 52 5C      [ 1]   67 	mov	0x525c+0, #0x03
                                     68 ;	outputs.c: 41: TIM1_CCR1H = 0x00;      //  Start with the PWM signal off
      00985F 35 00 52 65      [ 1]   69 	mov	0x5265+0, #0x00
                                     70 ;	outputs.c: 42: TIM1_CCR1L = 0x00;
      009863 35 00 52 66      [ 1]   71 	mov	0x5266+0, #0x00
                                     72 ;	outputs.c: 44: TIM1_BKR = 0x80;       //  Enable the main output.
      009867 35 80 52 6D      [ 1]   73 	mov	0x526d+0, #0x80
                                     74 ;	outputs.c: 47: TIM2_ARRH = PWM_HIGH; // Reload counter = 16384
      00986B 35 20 53 0F      [ 1]   75 	mov	0x530f+0, #0x20
                                     76 ;	outputs.c: 48: TIM2_ARRL = PWM_LOW;
      00986F 35 00 53 10      [ 1]   77 	mov	0x5310+0, #0x00
                                     78 ;	outputs.c: 49: TIM2_PSCR = 0; // Prescaler 0 means division by 1
      009873 35 00 53 0E      [ 1]   79 	mov	0x530e+0, #0x00
                                     80 ;	outputs.c: 50: TIM2_CR1 = 0x00;
      009877 35 00 53 00      [ 1]   81 	mov	0x5300+0, #0x00
                                     82 ;	outputs.c: 52: TIM2_CCMR1 = 0x70;    //  Set up to use PWM mode 2.
      00987B 35 70 53 07      [ 1]   83 	mov	0x5307+0, #0x70
                                     84 ;	outputs.c: 53: TIM2_CCER1 = 0x03;    //  Output is enabled for channel 1, active low
      00987F 35 03 53 0A      [ 1]   85 	mov	0x530a+0, #0x03
                                     86 ;	outputs.c: 54: TIM2_CCR1H = 0x00;      //  Start with the PWM signal off
      009883 35 00 53 11      [ 1]   87 	mov	0x5311+0, #0x00
                                     88 ;	outputs.c: 55: TIM2_CCR1L = 0x00;
      009887 35 00 53 12      [ 1]   89 	mov	0x5312+0, #0x00
      00988B 81               [ 4]   90 	ret
                                     91 ;	outputs.c: 77: uint16_t pwm_from_set(fixed_t set, calibrate_t *cal)
                                     92 ;	-----------------------------------------
                                     93 ;	 function pwm_from_set
                                     94 ;	-----------------------------------------
      00988C                         95 _pwm_from_set:
      00988C 52 0E            [ 2]   96 	sub	sp, #14
                                     97 ;	outputs.c: 82: tmp = set * cal->a;
      00988E 16 13            [ 2]   98 	ldw	y, (0x13, sp)
      009890 17 0D            [ 2]   99 	ldw	(0x0d, sp), y
      009892 1E 0D            [ 2]  100 	ldw	x, (0x0d, sp)
      009894 89               [ 2]  101 	pushw	x
      009895 EE 02            [ 2]  102 	ldw	x, (0x2, x)
      009897 51               [ 1]  103 	exgw	x, y
      009898 85               [ 2]  104 	popw	x
      009899 FE               [ 2]  105 	ldw	x, (x)
      00989A 1F 01            [ 2]  106 	ldw	(0x01, sp), x
      00989C 1E 11            [ 2]  107 	ldw	x, (0x11, sp)
      00989E 1F 07            [ 2]  108 	ldw	(0x07, sp), x
      0098A0 5F               [ 1]  109 	clrw	x
      0098A1 90 89            [ 2]  110 	pushw	y
      0098A3 16 03            [ 2]  111 	ldw	y, (0x03, sp)
      0098A5 90 89            [ 2]  112 	pushw	y
      0098A7 16 0B            [ 2]  113 	ldw	y, (0x0b, sp)
      0098A9 90 89            [ 2]  114 	pushw	y
      0098AB 89               [ 2]  115 	pushw	x
      0098AC CD 9F 09         [ 4]  116 	call	__mullong
      0098AF 5B 08            [ 2]  117 	addw	sp, #8
      0098B1 1F 0B            [ 2]  118 	ldw	(0x0b, sp), x
      0098B3 17 09            [ 2]  119 	ldw	(0x09, sp), y
                                    120 ;	outputs.c: 85: tmp += cal->b;
      0098B5 1E 0D            [ 2]  121 	ldw	x, (0x0d, sp)
      0098B7 89               [ 2]  122 	pushw	x
      0098B8 EE 06            [ 2]  123 	ldw	x, (0x6, x)
      0098BA 51               [ 1]  124 	exgw	x, y
      0098BB 85               [ 2]  125 	popw	x
      0098BC EE 04            [ 2]  126 	ldw	x, (0x4, x)
      0098BE 72 F9 0B         [ 2]  127 	addw	y, (0x0b, sp)
      0098C1 9F               [ 1]  128 	ld	a, xl
      0098C2 19 0A            [ 1]  129 	adc	a, (0x0a, sp)
      0098C4 02               [ 1]  130 	rlwa	x
      0098C5 19 09            [ 1]  131 	adc	a, (0x09, sp)
      0098C7 95               [ 1]  132 	ld	xh, a
                                    133 ;	outputs.c: 91: return fixed_round(tmp);
      0098C8 90 89            [ 2]  134 	pushw	y
      0098CA 89               [ 2]  135 	pushw	x
      0098CB CD 9A F5         [ 4]  136 	call	_fixed_round
      0098CE 5B 12            [ 2]  137 	addw	sp, #18
      0098D0 81               [ 4]  138 	ret
                                    139 ;	outputs.c: 118: void output_commit(cfg_output_t *cfg, cfg_system_t *sys, uint8_t state_constant_current)
                                    140 ;	-----------------------------------------
                                    141 ;	 function output_commit
                                    142 ;	-----------------------------------------
      0098D1                        143 _output_commit:
      0098D1 52 0D            [ 2]  144 	sub	sp, #13
                                    145 ;	outputs.c: 121: if (sys->output) {
      0098D3 16 12            [ 2]  146 	ldw	y, (0x12, sp)
      0098D5 17 03            [ 2]  147 	ldw	(0x03, sp), y
      0098D7 1E 03            [ 2]  148 	ldw	x, (0x03, sp)
      0098D9 E6 13            [ 1]  149 	ld	a, (0x13, x)
      0098DB 6B 0B            [ 1]  150 	ld	(0x0b, sp), a
      0098DD 0D 0B            [ 1]  151 	tnz	(0x0b, sp)
      0098DF 26 03            [ 1]  152 	jrne	00113$
      0098E1 CC 99 82         [ 2]  153 	jp	00102$
      0098E4                        154 00113$:
                                    155 ;	outputs.c: 122: control_voltage(cfg, sys);
      0098E4 1E 03            [ 2]  156 	ldw	x, (0x03, sp)
      0098E6 16 10            [ 2]  157 	ldw	y, (0x10, sp)
      0098E8 17 05            [ 2]  158 	ldw	(0x05, sp), y
                                    159 ;	outputs.c: 96: uint16_t ctr = pwm_from_set(cfg->vset, &sys->vout_pwm);
      0098EA 1C 00 2D         [ 2]  160 	addw	x, #0x002d
      0098ED 16 05            [ 2]  161 	ldw	y, (0x05, sp)
      0098EF 90 EE 01         [ 2]  162 	ldw	y, (0x1, y)
      0098F2 89               [ 2]  163 	pushw	x
      0098F3 90 89            [ 2]  164 	pushw	y
      0098F5 CD 98 8C         [ 4]  165 	call	_pwm_from_set
      0098F8 5B 04            [ 2]  166 	addw	sp, #4
      0098FA 1F 01            [ 2]  167 	ldw	(0x01, sp), x
                                    168 ;	outputs.c: 97: uart_write_str("PWM VOLTAGE ");
      0098FC AE 99 D7         [ 2]  169 	ldw	x, #___str_0+0
      0098FF 89               [ 2]  170 	pushw	x
      009900 CD 94 79         [ 4]  171 	call	_uart_write_str
      009903 85               [ 2]  172 	popw	x
                                    173 ;	outputs.c: 98: uart_write_int(ctr);
      009904 1E 01            [ 2]  174 	ldw	x, (0x01, sp)
      009906 89               [ 2]  175 	pushw	x
      009907 CD 95 2E         [ 4]  176 	call	_uart_write_int
      00990A 85               [ 2]  177 	popw	x
                                    178 ;	outputs.c: 99: uart_write_str("\r\n");
      00990B AE 99 E4         [ 2]  179 	ldw	x, #___str_1+0
      00990E 1F 09            [ 2]  180 	ldw	(0x09, sp), x
      009910 1E 09            [ 2]  181 	ldw	x, (0x09, sp)
      009912 89               [ 2]  182 	pushw	x
      009913 CD 94 79         [ 4]  183 	call	_uart_write_str
      009916 85               [ 2]  184 	popw	x
                                    185 ;	outputs.c: 101: TIM2_CCR1H = ctr >> 8;
      009917 7B 01            [ 1]  186 	ld	a, (0x01, sp)
      009919 0F 07            [ 1]  187 	clr	(0x07, sp)
      00991B AE 53 11         [ 2]  188 	ldw	x, #0x5311
      00991E F7               [ 1]  189 	ld	(x), a
                                    190 ;	outputs.c: 102: TIM2_CCR1L = ctr & 0xFF;
      00991F 7B 02            [ 1]  191 	ld	a, (0x02, sp)
      009921 95               [ 1]  192 	ld	xh, a
      009922 4F               [ 1]  193 	clr	a
      009923 9E               [ 1]  194 	ld	a, xh
      009924 AE 53 12         [ 2]  195 	ldw	x, #0x5312
      009927 F7               [ 1]  196 	ld	(x), a
                                    197 ;	outputs.c: 103: TIM2_CR1 |= 0x01; // Enable timer
      009928 AE 53 00         [ 2]  198 	ldw	x, #0x5300
      00992B F6               [ 1]  199 	ld	a, (x)
      00992C AA 01            [ 1]  200 	or	a, #0x01
      00992E F7               [ 1]  201 	ld	(x), a
                                    202 ;	outputs.c: 108: uint16_t ctr = pwm_from_set(cfg->cset, &sys->cout_pwm);
      00992F 1E 03            [ 2]  203 	ldw	x, (0x03, sp)
      009931 1C 00 35         [ 2]  204 	addw	x, #0x0035
      009934 16 05            [ 2]  205 	ldw	y, (0x05, sp)
      009936 90 EE 03         [ 2]  206 	ldw	y, (0x3, y)
      009939 89               [ 2]  207 	pushw	x
      00993A 90 89            [ 2]  208 	pushw	y
      00993C CD 98 8C         [ 4]  209 	call	_pwm_from_set
      00993F 5B 04            [ 2]  210 	addw	sp, #4
      009941 1F 05            [ 2]  211 	ldw	(0x05, sp), x
                                    212 ;	outputs.c: 109: uart_write_str("PWM CURRENT ");
      009943 AE 99 E7         [ 2]  213 	ldw	x, #___str_2+0
      009946 89               [ 2]  214 	pushw	x
      009947 CD 94 79         [ 4]  215 	call	_uart_write_str
      00994A 85               [ 2]  216 	popw	x
                                    217 ;	outputs.c: 110: uart_write_int(ctr);
      00994B 1E 05            [ 2]  218 	ldw	x, (0x05, sp)
      00994D 89               [ 2]  219 	pushw	x
      00994E CD 95 2E         [ 4]  220 	call	_uart_write_int
      009951 85               [ 2]  221 	popw	x
                                    222 ;	outputs.c: 111: uart_write_str("\r\n");
      009952 1E 09            [ 2]  223 	ldw	x, (0x09, sp)
      009954 89               [ 2]  224 	pushw	x
      009955 CD 94 79         [ 4]  225 	call	_uart_write_str
      009958 85               [ 2]  226 	popw	x
                                    227 ;	outputs.c: 113: TIM1_CCR1H = ctr >> 8;
      009959 7B 05            [ 1]  228 	ld	a, (0x05, sp)
      00995B 0F 0C            [ 1]  229 	clr	(0x0c, sp)
      00995D AE 52 65         [ 2]  230 	ldw	x, #0x5265
      009960 F7               [ 1]  231 	ld	(x), a
                                    232 ;	outputs.c: 114: TIM1_CCR1L = ctr & 0xFF;
      009961 7B 06            [ 1]  233 	ld	a, (0x06, sp)
      009963 95               [ 1]  234 	ld	xh, a
      009964 4F               [ 1]  235 	clr	a
      009965 9E               [ 1]  236 	ld	a, xh
      009966 AE 52 66         [ 2]  237 	ldw	x, #0x5266
      009969 F7               [ 1]  238 	ld	(x), a
                                    239 ;	outputs.c: 115: TIM1_CR1 |= 0x01; // Enable timer
      00996A 72 10 52 50      [ 1]  240 	bset	0x5250, #0
                                    241 ;	outputs.c: 126: PB_ODR &= ~(1<<4);
      00996E AE 50 05         [ 2]  242 	ldw	x, #0x5005
      009971 F6               [ 1]  243 	ld	a, (x)
      009972 A4 EF            [ 1]  244 	and	a, #0xef
      009974 F7               [ 1]  245 	ld	(x), a
                                    246 ;	outputs.c: 127: output_check_state(sys, state_constant_current);
      009975 7B 14            [ 1]  247 	ld	a, (0x14, sp)
      009977 88               [ 1]  248 	push	a
      009978 1E 04            [ 2]  249 	ldw	x, (0x04, sp)
      00997A 89               [ 2]  250 	pushw	x
      00997B CD 99 AB         [ 4]  251 	call	_output_check_state
      00997E 5B 03            [ 2]  252 	addw	sp, #3
      009980 20 26            [ 2]  253 	jra	00107$
      009982                        254 00102$:
                                    255 ;	outputs.c: 130: PB_ODR |= (1<<4);
      009982 AE 50 05         [ 2]  256 	ldw	x, #0x5005
      009985 F6               [ 1]  257 	ld	a, (x)
      009986 AA 10            [ 1]  258 	or	a, #0x10
      009988 F7               [ 1]  259 	ld	(x), a
                                    260 ;	outputs.c: 133: TIM1_CCR1H = 0;
      009989 35 00 52 65      [ 1]  261 	mov	0x5265+0, #0x00
                                    262 ;	outputs.c: 134: TIM1_CCR1L = 0;
      00998D 35 00 52 66      [ 1]  263 	mov	0x5266+0, #0x00
                                    264 ;	outputs.c: 135: TIM1_CR1 &= 0xFE; // Disable timer
      009991 72 11 52 50      [ 1]  265 	bres	0x5250, #0
                                    266 ;	outputs.c: 138: TIM2_CCR1H = 0;
      009995 35 00 53 11      [ 1]  267 	mov	0x5311+0, #0x00
                                    268 ;	outputs.c: 139: TIM2_CCR1L = 0;
      009999 35 00 53 12      [ 1]  269 	mov	0x5312+0, #0x00
                                    270 ;	outputs.c: 140: TIM2_CR1 &= 0xFE; // Disable timer
      00999D 72 11 53 00      [ 1]  271 	bres	0x5300, #0
                                    272 ;	outputs.c: 74: PA_DDR &= ~(1<<3);
      0099A1 AE 50 02         [ 2]  273 	ldw	x, #0x5002
      0099A4 F6               [ 1]  274 	ld	a, (x)
      0099A5 A4 F7            [ 1]  275 	and	a, #0xf7
      0099A7 F7               [ 1]  276 	ld	(x), a
                                    277 ;	outputs.c: 143: cvcc_led_off();
      0099A8                        278 00107$:
      0099A8 5B 0D            [ 2]  279 	addw	sp, #13
      0099AA 81               [ 4]  280 	ret
                                    281 ;	outputs.c: 147: void output_check_state(cfg_system_t *sys, uint8_t state_constant_current)
                                    282 ;	-----------------------------------------
                                    283 ;	 function output_check_state
                                    284 ;	-----------------------------------------
      0099AB                        285 _output_check_state:
                                    286 ;	outputs.c: 149: if (sys->output) {
      0099AB 1E 03            [ 2]  287 	ldw	x, (0x03, sp)
      0099AD E6 13            [ 1]  288 	ld	a, (0x13, x)
      0099AF 4D               [ 1]  289 	tnz	a
      0099B0 27 24            [ 1]  290 	jreq	00108$
                                    291 ;	outputs.c: 62: PA_ODR |= (1<<3);
      0099B2 AE 50 00         [ 2]  292 	ldw	x, #0x5000
      0099B5 F6               [ 1]  293 	ld	a, (x)
                                    294 ;	outputs.c: 150: if (state_constant_current)
      0099B6 0D 05            [ 1]  295 	tnz	(0x05, sp)
      0099B8 27 0F            [ 1]  296 	jreq	00102$
                                    297 ;	outputs.c: 62: PA_ODR |= (1<<3);
      0099BA AA 08            [ 1]  298 	or	a, #0x08
      0099BC AE 50 00         [ 2]  299 	ldw	x, #0x5000
      0099BF F7               [ 1]  300 	ld	(x), a
                                    301 ;	outputs.c: 63: PA_DDR |= (1<<3);
      0099C0 AE 50 02         [ 2]  302 	ldw	x, #0x5002
      0099C3 F6               [ 1]  303 	ld	a, (x)
      0099C4 AA 08            [ 1]  304 	or	a, #0x08
      0099C6 F7               [ 1]  305 	ld	(x), a
                                    306 ;	outputs.c: 151: cvcc_led_cc();
      0099C7 20 0D            [ 2]  307 	jra	00108$
      0099C9                        308 00102$:
                                    309 ;	outputs.c: 68: PA_ODR &= ~(1<<3);
      0099C9 A4 F7            [ 1]  310 	and	a, #0xf7
      0099CB AE 50 00         [ 2]  311 	ldw	x, #0x5000
      0099CE F7               [ 1]  312 	ld	(x), a
                                    313 ;	outputs.c: 69: PA_DDR |= (1<<3);
      0099CF AE 50 02         [ 2]  314 	ldw	x, #0x5002
      0099D2 F6               [ 1]  315 	ld	a, (x)
      0099D3 AA 08            [ 1]  316 	or	a, #0x08
      0099D5 F7               [ 1]  317 	ld	(x), a
                                    318 ;	outputs.c: 153: cvcc_led_cv();
      0099D6                        319 00108$:
      0099D6 81               [ 4]  320 	ret
                                    321 	.area CODE
      0099D7                        322 ___str_0:
      0099D7 50 57 4D 20 56 4F 4C   323 	.ascii "PWM VOLTAGE "
             54 41 47 45 20
      0099E3 00                     324 	.db 0x00
      0099E4                        325 ___str_1:
      0099E4 0D                     326 	.db 0x0D
      0099E5 0A                     327 	.db 0x0A
      0099E6 00                     328 	.db 0x00
      0099E7                        329 ___str_2:
      0099E7 50 57 4D 20 43 55 52   330 	.ascii "PWM CURRENT "
             52 45 4E 54 20
      0099F3 00                     331 	.db 0x00
                                    332 	.area INITIALIZER
                                    333 	.area CABS (ABS)
