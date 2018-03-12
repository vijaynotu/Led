                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Mon Mar 12 12:44:09 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module eeprom
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _eeprom_set_afr0
                                     13 	.globl _eeprom_save_data
                                     14 ;--------------------------------------------------------
                                     15 ; ram data
                                     16 ;--------------------------------------------------------
                                     17 	.area DATA
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area INITIALIZED
                                     22 ;--------------------------------------------------------
                                     23 ; absolute external ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DABS (ABS)
                                     26 ;--------------------------------------------------------
                                     27 ; global & static initialisations
                                     28 ;--------------------------------------------------------
                                     29 	.area HOME
                                     30 	.area GSINIT
                                     31 	.area GSFINAL
                                     32 	.area GSINIT
                                     33 ;--------------------------------------------------------
                                     34 ; Home
                                     35 ;--------------------------------------------------------
                                     36 	.area HOME
                                     37 	.area HOME
                                     38 ;--------------------------------------------------------
                                     39 ; code
                                     40 ;--------------------------------------------------------
                                     41 	.area CODE
                                     42 ;	eeprom.c: 22: static uint8_t eeprom_unlock_data(void)
                                     43 ;	-----------------------------------------
                                     44 ;	 function eeprom_unlock_data
                                     45 ;	-----------------------------------------
      009775                         46 _eeprom_unlock_data:
                                     47 ;	eeprom.c: 24: FLASH_DUKR = 0xAE; // Enable the flash data writing
      009775 35 AE 50 64      [ 1]   48 	mov	0x5064+0, #0xae
                                     49 ;	eeprom.c: 25: FLASH_DUKR = 0x56;
      009779 35 56 50 64      [ 1]   50 	mov	0x5064+0, #0x56
                                     51 ;	eeprom.c: 27: return (FLASH_IAPSR & FLASH_IAPSR_DUL); // True if device unlocked
      00977D AE 50 5F         [ 2]   52 	ldw	x, #0x505f
      009780 F6               [ 1]   53 	ld	a, (x)
      009781 A4 08            [ 1]   54 	and	a, #0x08
      009783 81               [ 4]   55 	ret
                                     56 ;	eeprom.c: 35: uint8_t eeprom_set_afr0(void)
                                     57 ;	-----------------------------------------
                                     58 ;	 function eeprom_set_afr0
                                     59 ;	-----------------------------------------
      009784                         60 _eeprom_set_afr0:
      009784 89               [ 2]   61 	pushw	x
                                     62 ;	eeprom.c: 40: if (!eeprom_unlock_data())
      009785 CD 97 75         [ 4]   63 	call	_eeprom_unlock_data
      009788 4D               [ 1]   64 	tnz	a
      009789 26 03            [ 1]   65 	jrne	00102$
                                     66 ;	eeprom.c: 41: return 0;
      00978B 4F               [ 1]   67 	clr	a
      00978C 20 50            [ 2]   68 	jra	00111$
      00978E                         69 00102$:
                                     70 ;	eeprom.c: 43: FLASH_CR2 = FLASH_CR2_OPT;// Set the OPT bit
      00978E 35 80 50 5B      [ 1]   71 	mov	0x505b+0, #0x80
                                     72 ;	eeprom.c: 44: FLASH_NCR2 = ~FLASH_NCR2_NOPT; // Remove the NOPT bit
      009792 35 7F 50 5C      [ 1]   73 	mov	0x505c+0, #0x7f
                                     74 ;	eeprom.c: 46: OPT2 = 1;
      009796 35 01 48 03      [ 1]   75 	mov	0x4803+0, #0x01
                                     76 ;	eeprom.c: 47: NOPT2 = 0xFE;
      00979A 35 FE 48 04      [ 1]   77 	mov	0x4804+0, #0xfe
                                     78 ;	eeprom.c: 48: for (timeout = 0xFFFF; timeout > 0; timeout--) {
      00979E AE FF FF         [ 2]   79 	ldw	x, #0xffff
      0097A1 1F 01            [ 2]   80 	ldw	(0x01, sp), x
      0097A3 AE FF FF         [ 2]   81 	ldw	x, #0xffff
      0097A6                         82 00109$:
                                     83 ;	eeprom.c: 49: sr = FLASH_IAPSR;
      0097A6 90 AE 50 5F      [ 2]   84 	ldw	y, #0x505f
      0097AA 90 F6            [ 1]   85 	ld	a, (y)
                                     86 ;	eeprom.c: 50: if (sr & FLASH_IAPSR_EOP)
      0097AC A5 04            [ 1]   87 	bcp	a, #0x04
      0097AE 26 06            [ 1]   88 	jrne	00105$
                                     89 ;	eeprom.c: 48: for (timeout = 0xFFFF; timeout > 0; timeout--) {
      0097B0 5A               [ 2]   90 	decw	x
      0097B1 1F 01            [ 2]   91 	ldw	(0x01, sp), x
      0097B3 5D               [ 2]   92 	tnzw	x
      0097B4 26 F0            [ 1]   93 	jrne	00109$
      0097B6                         94 00105$:
                                     95 ;	eeprom.c: 54: if (sr & FLASH_IAPSR_WR_PG_DIS)
      0097B6 44               [ 1]   96 	srl	a
      0097B7 24 03            [ 1]   97 	jrnc	00107$
                                     98 ;	eeprom.c: 55: timeout = 0; // This will report failure
      0097B9 5F               [ 1]   99 	clrw	x
      0097BA 1F 01            [ 2]  100 	ldw	(0x01, sp), x
      0097BC                        101 00107$:
                                    102 ;	eeprom.c: 57: FLASH_CR2 &= FLASH_CR2_OPT;
      0097BC AE 50 5B         [ 2]  103 	ldw	x, #0x505b
      0097BF F6               [ 1]  104 	ld	a, (x)
      0097C0 A4 80            [ 1]  105 	and	a, #0x80
      0097C2 F7               [ 1]  106 	ld	(x), a
                                    107 ;	eeprom.c: 58: FLASH_NCR2 |= FLASH_NCR2_NOPT;
      0097C3 72 1E 50 5C      [ 1]  108 	bset	0x505c, #7
                                    109 ;	eeprom.c: 32: FLASH_IAPSR &= ~FLASH_IAPSR_DUL;
      0097C7 AE 50 5F         [ 2]  110 	ldw	x, #0x505f
      0097CA F6               [ 1]  111 	ld	a, (x)
      0097CB A4 F7            [ 1]  112 	and	a, #0xf7
      0097CD F7               [ 1]  113 	ld	(x), a
                                    114 ;	eeprom.c: 60: return (timeout > 0) && (OPT2 & 1);
      0097CE 1E 01            [ 2]  115 	ldw	x, (0x01, sp)
      0097D0 27 07            [ 1]  116 	jreq	00115$
      0097D2 AE 48 03         [ 2]  117 	ldw	x, #0x4803
      0097D5 F6               [ 1]  118 	ld	a, (x)
      0097D6 44               [ 1]  119 	srl	a
      0097D7 25 03            [ 1]  120 	jrc	00116$
      0097D9                        121 00115$:
      0097D9 4F               [ 1]  122 	clr	a
      0097DA 20 02            [ 2]  123 	jra	00117$
      0097DC                        124 00116$:
      0097DC A6 01            [ 1]  125 	ld	a, #0x01
      0097DE                        126 00117$:
      0097DE                        127 00111$:
      0097DE 85               [ 2]  128 	popw	x
      0097DF 81               [ 4]  129 	ret
                                    130 ;	eeprom.c: 63: uint8_t eeprom_save_data(uint8_t *dst, uint8_t *src, uint8_t len)
                                    131 ;	-----------------------------------------
                                    132 ;	 function eeprom_save_data
                                    133 ;	-----------------------------------------
      0097E0                        134 _eeprom_save_data:
      0097E0 52 04            [ 2]  135 	sub	sp, #4
                                    136 ;	eeprom.c: 68: if (!eeprom_unlock_data())
      0097E2 CD 97 75         [ 4]  137 	call	_eeprom_unlock_data
      0097E5 6B 04            [ 1]  138 	ld	(0x04, sp), a
      0097E7 0D 04            [ 1]  139 	tnz	(0x04, sp)
      0097E9 26 03            [ 1]  140 	jrne	00125$
                                    141 ;	eeprom.c: 69: return 0;
      0097EB 4F               [ 1]  142 	clr	a
      0097EC 20 4E            [ 2]  143 	jra	00115$
      0097EE                        144 00125$:
      0097EE 7B 0B            [ 1]  145 	ld	a, (0x0b, sp)
      0097F0 6B 01            [ 1]  146 	ld	(0x01, sp), a
      0097F2 16 07            [ 2]  147 	ldw	y, (0x07, sp)
      0097F4 1E 09            [ 2]  148 	ldw	x, (0x09, sp)
      0097F6                        149 00111$:
                                    150 ;	eeprom.c: 71: for (; len > 0; len--, dst++, src++) {
      0097F6 0D 01            [ 1]  151 	tnz	(0x01, sp)
      0097F8 27 0E            [ 1]  152 	jreq	00103$
                                    153 ;	eeprom.c: 72: *dst = *src;
      0097FA F6               [ 1]  154 	ld	a, (x)
      0097FB 90 F7            [ 1]  155 	ld	(y), a
                                    156 ;	eeprom.c: 73: IWDG_KR = 0xAA; // Reset the counter
      0097FD 35 AA 50 E0      [ 1]  157 	mov	0x50e0+0, #0xaa
                                    158 ;	eeprom.c: 71: for (; len > 0; len--, dst++, src++) {
      009801 0A 01            [ 1]  159 	dec	(0x01, sp)
      009803 90 5C            [ 2]  160 	incw	y
      009805 5C               [ 2]  161 	incw	x
      009806 20 EE            [ 2]  162 	jra	00111$
      009808                        163 00103$:
                                    164 ;	eeprom.c: 76: for (timeout = 0xFFFF; timeout > 0; timeout--) {
      009808 AE FF FF         [ 2]  165 	ldw	x, #0xffff
      00980B 1F 02            [ 2]  166 	ldw	(0x02, sp), x
      00980D 90 AE FF FF      [ 2]  167 	ldw	y, #0xffff
      009811                        168 00113$:
                                    169 ;	eeprom.c: 77: IWDG_KR = 0xAA; // Reset the counter
      009811 35 AA 50 E0      [ 1]  170 	mov	0x50e0+0, #0xaa
                                    171 ;	eeprom.c: 78: sr = FLASH_IAPSR;
      009815 AE 50 5F         [ 2]  172 	ldw	x, #0x505f
      009818 F6               [ 1]  173 	ld	a, (x)
      009819 95               [ 1]  174 	ld	xh, a
                                    175 ;	eeprom.c: 79: if (sr & FLASH_IAPSR_EOP)
      00981A A5 04            [ 1]  176 	bcp	a, #0x04
      00981C 26 08            [ 1]  177 	jrne	00106$
                                    178 ;	eeprom.c: 76: for (timeout = 0xFFFF; timeout > 0; timeout--) {
      00981E 90 5A            [ 2]  179 	decw	y
      009820 17 02            [ 2]  180 	ldw	(0x02, sp), y
      009822 90 5D            [ 2]  181 	tnzw	y
      009824 26 EB            [ 1]  182 	jrne	00113$
      009826                        183 00106$:
                                    184 ;	eeprom.c: 83: if (sr & FLASH_IAPSR_WR_PG_DIS)
      009826 44               [ 1]  185 	srl	a
      009827 24 04            [ 1]  186 	jrnc	00108$
                                    187 ;	eeprom.c: 84: timeout = 0; // This will report failure
      009829 0F 03            [ 1]  188 	clr	(0x03, sp)
      00982B 0F 02            [ 1]  189 	clr	(0x02, sp)
      00982D                        190 00108$:
                                    191 ;	eeprom.c: 32: FLASH_IAPSR &= ~FLASH_IAPSR_DUL;
      00982D 9E               [ 1]  192 	ld	a, xh
      00982E A4 F7            [ 1]  193 	and	a, #0xf7
      009830 AE 50 5F         [ 2]  194 	ldw	x, #0x505f
      009833 F7               [ 1]  195 	ld	(x), a
                                    196 ;	eeprom.c: 87: return (timeout > 0);
      009834 1E 02            [ 2]  197 	ldw	x, (0x02, sp)
      009836 27 03            [ 1]  198 	jreq	00121$
      009838 A6 01            [ 1]  199 	ld	a, #0x01
      00983A 21                     200 	.byte 0x21
      00983B                        201 00121$:
      00983B 4F               [ 1]  202 	clr	a
      00983C                        203 00122$:
      00983C                        204 00115$:
      00983C 5B 04            [ 2]  205 	addw	sp, #4
      00983E 81               [ 4]  206 	ret
                                    207 	.area CODE
                                    208 	.area INITIALIZER
                                    209 	.area CABS (ABS)
