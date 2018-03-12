                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
                                      4 ; This file was generated Mon Mar 12 12:44:10 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module fixedpoint
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _fixed_round
                                     13 ;--------------------------------------------------------
                                     14 ; ram data
                                     15 ;--------------------------------------------------------
                                     16 	.area DATA
                                     17 ;--------------------------------------------------------
                                     18 ; ram data
                                     19 ;--------------------------------------------------------
                                     20 	.area INITIALIZED
                                     21 ;--------------------------------------------------------
                                     22 ; absolute external ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DABS (ABS)
                                     25 ;--------------------------------------------------------
                                     26 ; global & static initialisations
                                     27 ;--------------------------------------------------------
                                     28 	.area HOME
                                     29 	.area GSINIT
                                     30 	.area GSFINAL
                                     31 	.area GSINIT
                                     32 ;--------------------------------------------------------
                                     33 ; Home
                                     34 ;--------------------------------------------------------
                                     35 	.area HOME
                                     36 	.area HOME
                                     37 ;--------------------------------------------------------
                                     38 ; code
                                     39 ;--------------------------------------------------------
                                     40 	.area CODE
                                     41 ;	fixedpoint.c: 25: uint32_t fixed_round(uint32_t x)
                                     42 ;	-----------------------------------------
                                     43 ;	 function fixed_round
                                     44 ;	-----------------------------------------
      009AF5                         45 _fixed_round:
                                     46 ;	fixedpoint.c: 29: x >>= FIXED_SHIFT-1;
      009AF5 16 05            [ 2]   47 	ldw	y, (0x05, sp)
      009AF7 1E 03            [ 2]   48 	ldw	x, (0x03, sp)
      009AF9 A6 0F            [ 1]   49 	ld	a, #0x0f
      009AFB                         50 00103$:
      009AFB 54               [ 2]   51 	srlw	x
      009AFC 90 56            [ 2]   52 	rrcw	y
      009AFE 4A               [ 1]   53 	dec	a
      009AFF 26 FA            [ 1]   54 	jrne	00103$
      009B01 17 05            [ 2]   55 	ldw	(0x05, sp), y
      009B03 1F 03            [ 2]   56 	ldw	(0x03, sp), x
                                     57 ;	fixedpoint.c: 31: round = x&1;
      009B05 7B 06            [ 1]   58 	ld	a, (0x06, sp)
      009B07 A4 01            [ 1]   59 	and	a, #0x01
      009B09 95               [ 1]   60 	ld	xh, a
      009B0A 90 5F            [ 1]   61 	clrw	y
      009B0C 4F               [ 1]   62 	clr	a
      009B0D 9E               [ 1]   63 	ld	a, xh
                                     64 ;	fixedpoint.c: 32: x >>= 1;
      009B0E 16 05            [ 2]   65 	ldw	y, (0x05, sp)
      009B10 1E 03            [ 2]   66 	ldw	x, (0x03, sp)
      009B12 54               [ 2]   67 	srlw	x
      009B13 90 56            [ 2]   68 	rrcw	y
      009B15 17 05            [ 2]   69 	ldw	(0x05, sp), y
      009B17 1F 03            [ 2]   70 	ldw	(0x03, sp), x
                                     71 ;	fixedpoint.c: 34: return x+round;
      009B19 90 97            [ 1]   72 	ld	yl, a
      009B1B 4F               [ 1]   73 	clr	a
      009B1C 5F               [ 1]   74 	clrw	x
      009B1D 90 95            [ 1]   75 	ld	yh, a
      009B1F 72 F9 05         [ 2]   76 	addw	y, (0x05, sp)
      009B22 9F               [ 1]   77 	ld	a, xl
      009B23 19 04            [ 1]   78 	adc	a, (0x04, sp)
      009B25 02               [ 1]   79 	rlwa	x
      009B26 19 03            [ 1]   80 	adc	a, (0x03, sp)
      009B28 95               [ 1]   81 	ld	xh, a
      009B29 51               [ 1]   82 	exgw	x, y
      009B2A 81               [ 4]   83 	ret
                                     84 	.area CODE
                                     85 	.area INITIALIZER
                                     86 	.area CABS (ABS)
