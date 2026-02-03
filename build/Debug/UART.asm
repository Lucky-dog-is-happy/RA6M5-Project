
UART.elf:     file format elf32-littlearm


Disassembly of section __flash_readonly$$:

000000d8 <__do_global_dtors_aux>:
      d8:	b510      	push	{r4, lr}
      da:	4c05      	ldr	r4, [pc, #20]	@ (f0 <__do_global_dtors_aux+0x18>)
      dc:	7823      	ldrb	r3, [r4, #0]
      de:	b933      	cbnz	r3, ee <__do_global_dtors_aux+0x16>
      e0:	4b04      	ldr	r3, [pc, #16]	@ (f4 <__do_global_dtors_aux+0x1c>)
      e2:	b113      	cbz	r3, ea <__do_global_dtors_aux+0x12>
      e4:	4804      	ldr	r0, [pc, #16]	@ (f8 <__do_global_dtors_aux+0x20>)
      e6:	f3af 8000 	nop.w
      ea:	2301      	movs	r3, #1
      ec:	7023      	strb	r3, [r4, #0]
      ee:	bd10      	pop	{r4, pc}
      f0:	200004a0 	.word	0x200004a0
      f4:	00000000 	.word	0x00000000
      f8:	0100a284 	.word	0x0100a284

000000fc <frame_dummy>:
      fc:	b508      	push	{r3, lr}
      fe:	4b03      	ldr	r3, [pc, #12]	@ (10c <frame_dummy+0x10>)
     100:	b11b      	cbz	r3, 10a <frame_dummy+0xe>
     102:	4903      	ldr	r1, [pc, #12]	@ (110 <frame_dummy+0x14>)
     104:	4803      	ldr	r0, [pc, #12]	@ (114 <frame_dummy+0x18>)
     106:	f3af 8000 	nop.w
     10a:	bd08      	pop	{r3, pc}
     10c:	00000000 	.word	0x00000000
     110:	200004a4 	.word	0x200004a4
     114:	0100a284 	.word	0x0100a284

00000118 <Default_Handler>:
     118:	be00      	bkpt	0x0000
     11a:	4770      	bx	lr

0000011c <Reset_Handler>:
     11c:	b508      	push	{r3, lr}
     11e:	f000 f835 	bl	18c <SystemInit>
     122:	f001 fc0d 	bl	1940 <main>
     126:	e7fe      	b.n	126 <Reset_Handler+0xa>

00000128 <SystemRuntimeInit>:
     128:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     12a:	4f17      	ldr	r7, [pc, #92]	@ (188 <SystemRuntimeInit+0x60>)
     12c:	4605      	mov	r5, r0
     12e:	683e      	ldr	r6, [r7, #0]
     130:	b1a6      	cbz	r6, 15c <SystemRuntimeInit+0x34>
     132:	687c      	ldr	r4, [r7, #4]
     134:	eb06 0646 	add.w	r6, r6, r6, lsl #1
     138:	eb04 0686 	add.w	r6, r4, r6, lsl #2
     13c:	e002      	b.n	144 <SystemRuntimeInit+0x1c>
     13e:	340c      	adds	r4, #12
     140:	42b4      	cmp	r4, r6
     142:	d00b      	beq.n	15c <SystemRuntimeInit+0x34>
     144:	7a63      	ldrb	r3, [r4, #9]
     146:	42ab      	cmp	r3, r5
     148:	d1f9      	bne.n	13e <SystemRuntimeInit+0x16>
     14a:	e9d4 0200 	ldrd	r0, r2, [r4]
     14e:	2100      	movs	r1, #0
     150:	1a12      	subs	r2, r2, r0
     152:	340c      	adds	r4, #12
     154:	f002 f96e 	bl	2434 <memset>
     158:	42b4      	cmp	r4, r6
     15a:	d1f3      	bne.n	144 <SystemRuntimeInit+0x1c>
     15c:	68be      	ldr	r6, [r7, #8]
     15e:	b196      	cbz	r6, 186 <SystemRuntimeInit+0x5e>
     160:	68fc      	ldr	r4, [r7, #12]
     162:	eb04 1606 	add.w	r6, r4, r6, lsl #4
     166:	e002      	b.n	16e <SystemRuntimeInit+0x46>
     168:	3410      	adds	r4, #16
     16a:	42a6      	cmp	r6, r4
     16c:	d00b      	beq.n	186 <SystemRuntimeInit+0x5e>
     16e:	7b63      	ldrb	r3, [r4, #13]
     170:	42ab      	cmp	r3, r5
     172:	d1f9      	bne.n	168 <SystemRuntimeInit+0x40>
     174:	e9d4 0200 	ldrd	r0, r2, [r4]
     178:	68a1      	ldr	r1, [r4, #8]
     17a:	1a12      	subs	r2, r2, r0
     17c:	3410      	adds	r4, #16
     17e:	f002 f9b0 	bl	24e2 <memcpy>
     182:	42a6      	cmp	r6, r4
     184:	d1f3      	bne.n	16e <SystemRuntimeInit+0x46>
     186:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
     188:	00002f3c 	.word	0x00002f3c

0000018c <SystemInit>:
     18c:	f44f 0170 	mov.w	r1, #15728640	@ 0xf00000
     190:	4b27      	ldr	r3, [pc, #156]	@ (230 <SystemInit+0xa4>)
     192:	4a28      	ldr	r2, [pc, #160]	@ (234 <SystemInit+0xa8>)
     194:	b570      	push	{r4, r5, r6, lr}
     196:	2000      	movs	r0, #0
     198:	f8c3 1088 	str.w	r1, [r3, #136]	@ 0x88
     19c:	609a      	str	r2, [r3, #8]
     19e:	f001 fec7 	bl	1f30 <R_BSP_WarmStart>
     1a2:	f000 f869 	bl	278 <bsp_clock_init>
     1a6:	2001      	movs	r0, #1
     1a8:	f001 fec2 	bl	1f30 <R_BSP_WarmStart>
     1ac:	4b22      	ldr	r3, [pc, #136]	@ (238 <SystemInit+0xac>)
     1ae:	f383 880a 	msr	MSPLIM, r3
     1b2:	2000      	movs	r0, #0
     1b4:	f7ff ffb8 	bl	128 <SystemRuntimeInit>
     1b8:	f000 f848 	bl	24c <SystemCoreClockUpdate>
     1bc:	f000 f902 	bl	3c4 <R_BSP_Init_RTC>
     1c0:	2003      	movs	r0, #3
     1c2:	f000 fa3f 	bl	644 <R_BSP_RegisterProtectDisable>
     1c6:	2300      	movs	r3, #0
     1c8:	f64f 70ff 	movw	r0, #65535	@ 0xffff
     1cc:	491b      	ldr	r1, [pc, #108]	@ (23c <SystemInit+0xb0>)
     1ce:	f103 0208 	add.w	r2, r3, #8
     1d2:	3301      	adds	r3, #1
     1d4:	2b0c      	cmp	r3, #12
     1d6:	f821 0012 	strh.w	r0, [r1, r2, lsl #1]
     1da:	d1f8      	bne.n	1ce <SystemInit+0x42>
     1dc:	2400      	movs	r4, #0
     1de:	2003      	movs	r0, #3
     1e0:	f000 fa00 	bl	5e4 <R_BSP_RegisterProtectEnable>
     1e4:	2003      	movs	r0, #3
     1e6:	f000 fa2d 	bl	644 <R_BSP_RegisterProtectDisable>
     1ea:	4b15      	ldr	r3, [pc, #84]	@ (240 <SystemInit+0xb4>)
     1ec:	2003      	movs	r0, #3
     1ee:	605c      	str	r4, [r3, #4]
     1f0:	609c      	str	r4, [r3, #8]
     1f2:	60dc      	str	r4, [r3, #12]
     1f4:	611c      	str	r4, [r3, #16]
     1f6:	f000 f9f5 	bl	5e4 <R_BSP_RegisterProtectEnable>
     1fa:	2002      	movs	r0, #2
     1fc:	f001 fe98 	bl	1f30 <R_BSP_WarmStart>
     200:	2001      	movs	r0, #1
     202:	f7ff ff91 	bl	128 <SystemRuntimeInit>
     206:	4d0f      	ldr	r5, [pc, #60]	@ (244 <SystemInit+0xb8>)
     208:	4b0f      	ldr	r3, [pc, #60]	@ (248 <SystemInit+0xbc>)
     20a:	1b5b      	subs	r3, r3, r5
     20c:	42a3      	cmp	r3, r4
     20e:	ea4f 06a3 	mov.w	r6, r3, asr #2
     212:	dd05      	ble.n	220 <SystemInit+0x94>
     214:	f855 3b04 	ldr.w	r3, [r5], #4
     218:	3401      	adds	r4, #1
     21a:	4798      	blx	r3
     21c:	42a6      	cmp	r6, r4
     21e:	dcf9      	bgt.n	214 <SystemInit+0x88>
     220:	f000 f996 	bl	550 <bsp_irq_cfg>
     224:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
     228:	2000      	movs	r0, #0
     22a:	f000 b923 	b.w	474 <bsp_init_internal>
     22e:	bf00      	nop
     230:	e000ed00 	.word	0xe000ed00
     234:	00000000 	.word	0x00000000
     238:	20000080 	.word	0x20000080
     23c:	40080d00 	.word	0x40080d00
     240:	400e0000 	.word	0x400e0000
     244:	000033ec 	.word	0x000033ec
     248:	000033f0 	.word	0x000033f0

0000024c <SystemCoreClockUpdate>:
     24c:	4b06      	ldr	r3, [pc, #24]	@ (268 <SystemCoreClockUpdate+0x1c>)
     24e:	4907      	ldr	r1, [pc, #28]	@ (26c <SystemCoreClockUpdate+0x20>)
     250:	f893 0026 	ldrb.w	r0, [r3, #38]	@ 0x26
     254:	6a1a      	ldr	r2, [r3, #32]
     256:	f851 3020 	ldr.w	r3, [r1, r0, lsl #2]
     25a:	f3c2 6202 	ubfx	r2, r2, #24, #3
     25e:	4904      	ldr	r1, [pc, #16]	@ (270 <SystemCoreClockUpdate+0x24>)
     260:	40d3      	lsrs	r3, r2
     262:	600b      	str	r3, [r1, #0]
     264:	4770      	bx	lr
     266:	bf00      	nop
     268:	4001e000 	.word	0x4001e000
     26c:	20000480 	.word	0x20000480
     270:	200004bc 	.word	0x200004bc

00000274 <R_BSP_SubClockStabilizeWaitAfterReset>:
     274:	4770      	bx	lr
     276:	bf00      	nop

00000278 <bsp_clock_init>:
     278:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     27a:	f24a 5003 	movw	r0, #42243	@ 0xa503
     27e:	2301      	movs	r3, #1
     280:	4945      	ldr	r1, [pc, #276]	@ (398 <bsp_clock_init+0x120>)
     282:	4a46      	ldr	r2, [pc, #280]	@ (39c <bsp_clock_init+0x124>)
     284:	f8a1 03fe 	strh.w	r0, [r1, #1022]	@ 0x3fe
     288:	f8a2 3104 	strh.w	r3, [r2, #260]	@ 0x104
     28c:	f8b2 3104 	ldrh.w	r3, [r2, #260]	@ 0x104
     290:	b29b      	uxth	r3, r3
     292:	2b00      	cmp	r3, #0
     294:	d1fa      	bne.n	28c <bsp_clock_init+0x14>
     296:	2001      	movs	r0, #1
     298:	f44f 4500 	mov.w	r5, #32768	@ 0x8000
     29c:	f04f 0c09 	mov.w	ip, #9
     2a0:	4c3f      	ldr	r4, [pc, #252]	@ (3a0 <bsp_clock_init+0x128>)
     2a2:	f8df e118 	ldr.w	lr, [pc, #280]	@ 3bc <bsp_clock_init+0x144>
     2a6:	4e3f      	ldr	r6, [pc, #252]	@ (3a4 <bsp_clock_init+0x12c>)
     2a8:	f8c4 e004 	str.w	lr, [r4, #4]
     2ac:	f8df e110 	ldr.w	lr, [pc, #272]	@ 3c0 <bsp_clock_init+0x148>
     2b0:	4939      	ldr	r1, [pc, #228]	@ (398 <bsp_clock_init+0x120>)
     2b2:	f8c4 e00c 	str.w	lr, [r4, #12]
     2b6:	4f3c      	ldr	r7, [pc, #240]	@ (3a8 <bsp_clock_init+0x130>)
     2b8:	f8a2 0100 	strh.w	r0, [r2, #256]	@ 0x100
     2bc:	4a3b      	ldr	r2, [pc, #236]	@ (3ac <bsp_clock_init+0x134>)
     2be:	60b0      	str	r0, [r6, #8]
     2c0:	6030      	str	r0, [r6, #0]
     2c2:	6162      	str	r2, [r4, #20]
     2c4:	6027      	str	r7, [r4, #0]
     2c6:	f891 2026 	ldrb.w	r2, [r1, #38]	@ 0x26
     2ca:	60a5      	str	r5, [r4, #8]
     2cc:	6125      	str	r5, [r4, #16]
     2ce:	6a08      	ldr	r0, [r1, #32]
     2d0:	f854 2022 	ldr.w	r2, [r4, r2, lsl #2]
     2d4:	4e36      	ldr	r6, [pc, #216]	@ (3b0 <bsp_clock_init+0x138>)
     2d6:	f3c0 6002 	ubfx	r0, r0, #24, #3
     2da:	40c2      	lsrs	r2, r0
     2dc:	6032      	str	r2, [r6, #0]
     2de:	f881 3413 	strb.w	r3, [r1, #1043]	@ 0x413
     2e2:	f881 c0a2 	strb.w	ip, [r1, #162]	@ 0xa2
     2e6:	f891 3480 	ldrb.w	r3, [r1, #1152]	@ 0x480
     2ea:	b91b      	cbnz	r3, 2f4 <bsp_clock_init+0x7c>
     2ec:	f891 3481 	ldrb.w	r3, [r1, #1153]	@ 0x481
     2f0:	0799      	lsls	r1, r3, #30
     2f2:	d04c      	beq.n	38e <bsp_clock_init+0x116>
     2f4:	4d28      	ldr	r5, [pc, #160]	@ (398 <bsp_clock_init+0x120>)
     2f6:	f895 3480 	ldrb.w	r3, [r5, #1152]	@ 0x480
     2fa:	2b00      	cmp	r3, #0
     2fc:	d03c      	beq.n	378 <bsp_clock_init+0x100>
     2fe:	2200      	movs	r2, #0
     300:	4b25      	ldr	r3, [pc, #148]	@ (398 <bsp_clock_init+0x120>)
     302:	f883 2481 	strb.w	r2, [r3, #1153]	@ 0x481
     306:	f883 2480 	strb.w	r2, [r3, #1152]	@ 0x480
     30a:	2300      	movs	r3, #0
     30c:	4922      	ldr	r1, [pc, #136]	@ (398 <bsp_clock_init+0x120>)
     30e:	f881 3032 	strb.w	r3, [r1, #50]	@ 0x32
     312:	f891 303c 	ldrb.w	r3, [r1, #60]	@ 0x3c
     316:	071a      	lsls	r2, r3, #28
     318:	d5fb      	bpl.n	312 <bsp_clock_init+0x9a>
     31a:	f243 1002 	movw	r0, #12546	@ 0x3102
     31e:	2300      	movs	r3, #0
     320:	4a1d      	ldr	r2, [pc, #116]	@ (398 <bsp_clock_init+0x120>)
     322:	8508      	strh	r0, [r1, #40]	@ 0x28
     324:	f881 302a 	strb.w	r3, [r1, #42]	@ 0x2a
     328:	f892 303c 	ldrb.w	r3, [r2, #60]	@ 0x3c
     32c:	069b      	lsls	r3, r3, #26
     32e:	d5fb      	bpl.n	328 <bsp_clock_init+0xb0>
     330:	2003      	movs	r0, #3
     332:	2305      	movs	r3, #5
     334:	4919      	ldr	r1, [pc, #100]	@ (39c <bsp_clock_init+0x124>)
     336:	f04f 0cf1 	mov.w	ip, #241	@ 0xf1
     33a:	f881 011c 	strb.w	r0, [r1, #284]	@ 0x11c
     33e:	491d      	ldr	r1, [pc, #116]	@ (3b4 <bsp_clock_init+0x13c>)
     340:	6211      	str	r1, [r2, #32]
     342:	f882 3026 	strb.w	r3, [r2, #38]	@ 0x26
     346:	f892 3026 	ldrb.w	r3, [r2, #38]	@ 0x26
     34a:	6a15      	ldr	r5, [r2, #32]
     34c:	f854 0023 	ldr.w	r0, [r4, r3, lsl #2]
     350:	f3c5 6402 	ubfx	r4, r5, #24, #3
     354:	2301      	movs	r3, #1
     356:	40e0      	lsrs	r0, r4
     358:	6030      	str	r0, [r6, #0]
     35a:	24f0      	movs	r4, #240	@ 0xf0
     35c:	f44f 4025 	mov.w	r0, #42240	@ 0xa500
     360:	4915      	ldr	r1, [pc, #84]	@ (3b8 <bsp_clock_init+0x140>)
     362:	f881 c00c 	strb.w	ip, [r1, #12]
     366:	720b      	strb	r3, [r1, #8]
     368:	730c      	strb	r4, [r1, #12]
     36a:	f882 3030 	strb.w	r3, [r2, #48]	@ 0x30
     36e:	f882 3052 	strb.w	r3, [r2, #82]	@ 0x52
     372:	f8a2 03fe 	strh.w	r0, [r2, #1022]	@ 0x3fe
     376:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
     378:	2101      	movs	r1, #1
     37a:	20c8      	movs	r0, #200	@ 0xc8
     37c:	f885 1480 	strb.w	r1, [r5, #1152]	@ 0x480
     380:	f000 f882 	bl	488 <R_BSP_SoftwareDelay>
     384:	f895 3480 	ldrb.w	r3, [r5, #1152]	@ 0x480
     388:	2b01      	cmp	r3, #1
     38a:	d1fb      	bne.n	384 <bsp_clock_init+0x10c>
     38c:	e7b7      	b.n	2fe <bsp_clock_init+0x86>
     38e:	f44f 707a 	mov.w	r0, #1000	@ 0x3e8
     392:	f7ff ff6f 	bl	274 <R_BSP_SubClockStabilizeWaitAfterReset>
     396:	e7b8      	b.n	30a <bsp_clock_init+0x92>
     398:	4001e000 	.word	0x4001e000
     39c:	4001c000 	.word	0x4001c000
     3a0:	20000480 	.word	0x20000480
     3a4:	40007000 	.word	0x40007000
     3a8:	01312d00 	.word	0x01312d00
     3ac:	0bebc200 	.word	0x0bebc200
     3b0:	200004bc 	.word	0x200004bc
     3b4:	20011221 	.word	0x20011221
     3b8:	40002000 	.word	0x40002000
     3bc:	007a1200 	.word	0x007a1200
     3c0:	016e3600 	.word	0x016e3600

000003c4 <R_BSP_Init_RTC>:
     3c4:	b538      	push	{r3, r4, r5, lr}
     3c6:	2500      	movs	r5, #0
     3c8:	4c28      	ldr	r4, [pc, #160]	@ (46c <R_BSP_Init_RTC+0xa8>)
     3ca:	2101      	movs	r1, #1
     3cc:	20c8      	movs	r0, #200	@ 0xc8
     3ce:	f884 5028 	strb.w	r5, [r4, #40]	@ 0x28
     3d2:	f000 f859 	bl	488 <R_BSP_SoftwareDelay>
     3d6:	f884 5024 	strb.w	r5, [r4, #36]	@ 0x24
     3da:	f894 3024 	ldrb.w	r3, [r4, #36]	@ 0x24
     3de:	2b00      	cmp	r3, #0
     3e0:	d1fb      	bne.n	3da <R_BSP_Init_RTC+0x16>
     3e2:	f894 3024 	ldrb.w	r3, [r4, #36]	@ 0x24
     3e6:	4921      	ldr	r1, [pc, #132]	@ (46c <R_BSP_Init_RTC+0xa8>)
     3e8:	f043 0302 	orr.w	r3, r3, #2
     3ec:	f884 3024 	strb.w	r3, [r4, #36]	@ 0x24
     3f0:	f891 3024 	ldrb.w	r3, [r1, #36]	@ 0x24
     3f4:	f3c3 0040 	ubfx	r0, r3, #1, #1
     3f8:	079b      	lsls	r3, r3, #30
     3fa:	d4f9      	bmi.n	3f0 <R_BSP_Init_RTC+0x2c>
     3fc:	4a1b      	ldr	r2, [pc, #108]	@ (46c <R_BSP_Init_RTC+0xa8>)
     3fe:	f881 0022 	strb.w	r0, [r1, #34]	@ 0x22
     402:	f892 3022 	ldrb.w	r3, [r2, #34]	@ 0x22
     406:	f003 00ff 	and.w	r0, r3, #255	@ 0xff
     40a:	2b00      	cmp	r3, #0
     40c:	d1f9      	bne.n	402 <R_BSP_Init_RTC+0x3e>
     40e:	f892 3040 	ldrb.w	r3, [r2, #64]	@ 0x40
     412:	4916      	ldr	r1, [pc, #88]	@ (46c <R_BSP_Init_RTC+0xa8>)
     414:	f360 13c7 	bfi	r3, r0, #7, #1
     418:	f882 3040 	strb.w	r3, [r2, #64]	@ 0x40
     41c:	f891 3040 	ldrb.w	r3, [r1, #64]	@ 0x40
     420:	09db      	lsrs	r3, r3, #7
     422:	d1fb      	bne.n	41c <R_BSP_Init_RTC+0x58>
     424:	f891 0042 	ldrb.w	r0, [r1, #66]	@ 0x42
     428:	4a10      	ldr	r2, [pc, #64]	@ (46c <R_BSP_Init_RTC+0xa8>)
     42a:	f363 10c7 	bfi	r0, r3, #7, #1
     42e:	f881 0042 	strb.w	r0, [r1, #66]	@ 0x42
     432:	f892 3042 	ldrb.w	r3, [r2, #66]	@ 0x42
     436:	09db      	lsrs	r3, r3, #7
     438:	d1fb      	bne.n	432 <R_BSP_Init_RTC+0x6e>
     43a:	f892 0044 	ldrb.w	r0, [r2, #68]	@ 0x44
     43e:	490b      	ldr	r1, [pc, #44]	@ (46c <R_BSP_Init_RTC+0xa8>)
     440:	f363 10c7 	bfi	r0, r3, #7, #1
     444:	f882 0044 	strb.w	r0, [r2, #68]	@ 0x44
     448:	f891 3044 	ldrb.w	r3, [r1, #68]	@ 0x44
     44c:	f3c3 14c0 	ubfx	r4, r3, #7, #1
     450:	09db      	lsrs	r3, r3, #7
     452:	d1f9      	bne.n	448 <R_BSP_Init_RTC+0x84>
     454:	2001      	movs	r0, #1
     456:	f000 f8f5 	bl	644 <R_BSP_RegisterProtectDisable>
     45a:	4b05      	ldr	r3, [pc, #20]	@ (470 <R_BSP_Init_RTC+0xac>)
     45c:	2001      	movs	r0, #1
     45e:	f883 44bb 	strb.w	r4, [r3, #1211]	@ 0x4bb
     462:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
     466:	f000 b8bd 	b.w	5e4 <R_BSP_RegisterProtectEnable>
     46a:	bf00      	nop
     46c:	40083000 	.word	0x40083000
     470:	4001e000 	.word	0x4001e000

00000474 <bsp_init_internal>:
     474:	4770      	bx	lr
     476:	bf00      	nop

00000478 <__assert_func>:
     478:	be00      	bkpt	0x0000
     47a:	e7fe      	b.n	47a <__assert_func+0x2>

0000047c <bsp_prv_software_delay_loop>:
     47c:	f1a0 0001 	sub.w	r0, r0, #1
     480:	2800      	cmp	r0, #0
     482:	d1fb      	bne.n	47c <bsp_prv_software_delay_loop>
     484:	4770      	bx	lr
     486:	bf00      	nop

00000488 <R_BSP_SoftwareDelay>:
     488:	4b1f      	ldr	r3, [pc, #124]	@ (508 <R_BSP_SoftwareDelay+0x80>)
     48a:	4a20      	ldr	r2, [pc, #128]	@ (50c <R_BSP_SoftwareDelay+0x84>)
     48c:	681b      	ldr	r3, [r3, #0]
     48e:	fb00 f101 	mul.w	r1, r0, r1
     492:	4293      	cmp	r3, r2
     494:	d313      	bcc.n	4be <R_BSP_SoftwareDelay+0x36>
     496:	f102 4285 	add.w	r2, r2, #1115684864	@ 0x42800000
     49a:	f502 1207 	add.w	r2, r2, #2211840	@ 0x21c000
     49e:	f503 1374 	add.w	r3, r3, #3997696	@ 0x3d0000
     4a2:	f602 4283 	addw	r2, r2, #3203	@ 0xc83
     4a6:	f603 03ff 	addw	r3, r3, #2303	@ 0x8ff
     4aa:	fba2 2303 	umull	r2, r3, r2, r3
     4ae:	0d1b      	lsrs	r3, r3, #20
     4b0:	fba3 3101 	umull	r3, r1, r3, r1
     4b4:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
     4b8:	b1f9      	cbz	r1, 4fa <R_BSP_SoftwareDelay+0x72>
     4ba:	f7ff bfdf 	b.w	47c <bsp_prv_software_delay_loop>
     4be:	f44f 727a 	mov.w	r2, #1000	@ 0x3e8
     4c2:	b410      	push	{r4}
     4c4:	fba1 c402 	umull	ip, r4, r1, r2
     4c8:	4811      	ldr	r0, [pc, #68]	@ (510 <R_BSP_SoftwareDelay+0x88>)
     4ca:	fbb0 f3f3 	udiv	r3, r0, r3
     4ce:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
     4d2:	b944      	cbnz	r4, 4e6 <R_BSP_SoftwareDelay+0x5e>
     4d4:	fbbc fcf3 	udiv	ip, ip, r3
     4d8:	ea4f 009c 	mov.w	r0, ip, lsr #2
     4dc:	b188      	cbz	r0, 502 <R_BSP_SoftwareDelay+0x7a>
     4de:	f85d 4b04 	ldr.w	r4, [sp], #4
     4e2:	f7ff bfcb 	b.w	47c <bsp_prv_software_delay_loop>
     4e6:	009b      	lsls	r3, r3, #2
     4e8:	fbb1 f1f3 	udiv	r1, r1, r3
     4ec:	fba1 1202 	umull	r1, r2, r1, r2
     4f0:	2a00      	cmp	r2, #0
     4f2:	d1f4      	bne.n	4de <R_BSP_SoftwareDelay+0x56>
     4f4:	4608      	mov	r0, r1
     4f6:	b120      	cbz	r0, 502 <R_BSP_SoftwareDelay+0x7a>
     4f8:	e7f1      	b.n	4de <R_BSP_SoftwareDelay+0x56>
     4fa:	4618      	mov	r0, r3
     4fc:	2b00      	cmp	r3, #0
     4fe:	d1dc      	bne.n	4ba <R_BSP_SoftwareDelay+0x32>
     500:	4770      	bx	lr
     502:	f85d 4b04 	ldr.w	r4, [sp], #4
     506:	4770      	bx	lr
     508:	200004bc 	.word	0x200004bc
     50c:	007a1200 	.word	0x007a1200
     510:	3b9aca00 	.word	0x3b9aca00

00000514 <NMI_Handler>:
     514:	b570      	push	{r4, r5, r6, lr}
     516:	2400      	movs	r4, #0
     518:	4b0b      	ldr	r3, [pc, #44]	@ (548 <NMI_Handler+0x34>)
     51a:	4e0c      	ldr	r6, [pc, #48]	@ (54c <NMI_Handler+0x38>)
     51c:	f8b3 2120 	ldrh.w	r2, [r3, #288]	@ 0x120
     520:	f8b3 5140 	ldrh.w	r5, [r3, #320]	@ 0x140
     524:	b2ad      	uxth	r5, r5
     526:	4015      	ands	r5, r2
     528:	fa25 f304 	lsr.w	r3, r5, r4
     52c:	07db      	lsls	r3, r3, #31
     52e:	d504      	bpl.n	53a <NMI_Handler+0x26>
     530:	f856 3024 	ldr.w	r3, [r6, r4, lsl #2]
     534:	b2e0      	uxtb	r0, r4
     536:	b103      	cbz	r3, 53a <NMI_Handler+0x26>
     538:	4798      	blx	r3
     53a:	3401      	adds	r4, #1
     53c:	2c10      	cmp	r4, #16
     53e:	d1f3      	bne.n	528 <NMI_Handler+0x14>
     540:	4b01      	ldr	r3, [pc, #4]	@ (548 <NMI_Handler+0x34>)
     542:	f8a3 5130 	strh.w	r5, [r3, #304]	@ 0x130
     546:	bd70      	pop	{r4, r5, r6, pc}
     548:	40006000 	.word	0x40006000
     54c:	200004c0 	.word	0x200004c0

00000550 <bsp_irq_cfg>:
     550:	b530      	push	{r4, r5, lr}
     552:	2003      	movs	r0, #3
     554:	b085      	sub	sp, #20
     556:	f000 f875 	bl	644 <R_BSP_RegisterProtectDisable>
     55a:	2500      	movs	r5, #0
     55c:	f06f 01ff 	mvn.w	r1, #255	@ 0xff
     560:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
     564:	4b1b      	ldr	r3, [pc, #108]	@ (5d4 <bsp_irq_cfg+0x84>)
     566:	4c1c      	ldr	r4, [pc, #112]	@ (5d8 <bsp_irq_cfg+0x88>)
     568:	6499      	str	r1, [r3, #72]	@ 0x48
     56a:	4622      	mov	r2, r4
     56c:	462b      	mov	r3, r5
     56e:	f04f 0e01 	mov.w	lr, #1
     572:	e9cd 0001 	strd	r0, r0, [sp, #4]
     576:	9003      	str	r0, [sp, #12]
     578:	f832 1b02 	ldrh.w	r1, [r2], #2
     57c:	fa0e fc03 	lsl.w	ip, lr, r3
     580:	3301      	adds	r3, #1
     582:	b111      	cbz	r1, 58a <bsp_irq_cfg+0x3a>
     584:	2501      	movs	r5, #1
     586:	ea20 000c 	bic.w	r0, r0, ip
     58a:	2b0a      	cmp	r3, #10
     58c:	d1f4      	bne.n	578 <bsp_irq_cfg+0x28>
     58e:	b1f5      	cbz	r5, 5ce <bsp_irq_cfg+0x7e>
     590:	9001      	str	r0, [sp, #4]
     592:	4b12      	ldr	r3, [pc, #72]	@ (5dc <bsp_irq_cfg+0x8c>)
     594:	4a0f      	ldr	r2, [pc, #60]	@ (5d4 <bsp_irq_cfg+0x84>)
     596:	6710      	str	r0, [r2, #112]	@ 0x70
     598:	f8c3 0280 	str.w	r0, [r3, #640]	@ 0x280
     59c:	9902      	ldr	r1, [sp, #8]
     59e:	2003      	movs	r0, #3
     5a0:	6751      	str	r1, [r2, #116]	@ 0x74
     5a2:	f8c3 1284 	str.w	r1, [r3, #644]	@ 0x284
     5a6:	9903      	ldr	r1, [sp, #12]
     5a8:	6791      	str	r1, [r2, #120]	@ 0x78
     5aa:	f8c3 1288 	str.w	r1, [r3, #648]	@ 0x288
     5ae:	f000 f819 	bl	5e4 <R_BSP_RegisterProtectEnable>
     5b2:	2300      	movs	r3, #0
     5b4:	480a      	ldr	r0, [pc, #40]	@ (5e0 <bsp_irq_cfg+0x90>)
     5b6:	f834 2b02 	ldrh.w	r2, [r4], #2
     5ba:	f103 01c0 	add.w	r1, r3, #192	@ 0xc0
     5be:	3301      	adds	r3, #1
     5c0:	b10a      	cbz	r2, 5c6 <bsp_irq_cfg+0x76>
     5c2:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
     5c6:	2b0a      	cmp	r3, #10
     5c8:	d1f5      	bne.n	5b6 <bsp_irq_cfg+0x66>
     5ca:	b005      	add	sp, #20
     5cc:	bd30      	pop	{r4, r5, pc}
     5ce:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
     5d2:	e7de      	b.n	592 <bsp_irq_cfg+0x42>
     5d4:	40008000 	.word	0x40008000
     5d8:	00003180 	.word	0x00003180
     5dc:	e000e100 	.word	0xe000e100
     5e0:	40006000 	.word	0x40006000

000005e4 <R_BSP_RegisterProtectEnable>:
     5e4:	f3ef 8110 	mrs	r1, PRIMASK
     5e8:	2301      	movs	r3, #1
     5ea:	f383 8810 	msr	PRIMASK, r3
     5ee:	4b12      	ldr	r3, [pc, #72]	@ (638 <R_BSP_RegisterProtectEnable+0x54>)
     5f0:	f833 2010 	ldrh.w	r2, [r3, r0, lsl #1]
     5f4:	b292      	uxth	r2, r2
     5f6:	b12a      	cbz	r2, 604 <R_BSP_RegisterProtectEnable+0x20>
     5f8:	f833 2010 	ldrh.w	r2, [r3, r0, lsl #1]
     5fc:	3a01      	subs	r2, #1
     5fe:	b292      	uxth	r2, r2
     600:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
     604:	f833 3010 	ldrh.w	r3, [r3, r0, lsl #1]
     608:	b29b      	uxth	r3, r3
     60a:	b993      	cbnz	r3, 632 <R_BSP_RegisterProtectEnable+0x4e>
     60c:	4a0b      	ldr	r2, [pc, #44]	@ (63c <R_BSP_RegisterProtectEnable+0x58>)
     60e:	b410      	push	{r4}
     610:	f8b2 33fe 	ldrh.w	r3, [r2, #1022]	@ 0x3fe
     614:	4c0a      	ldr	r4, [pc, #40]	@ (640 <R_BSP_RegisterProtectEnable+0x5c>)
     616:	b29b      	uxth	r3, r3
     618:	f834 0010 	ldrh.w	r0, [r4, r0, lsl #1]
     61c:	f443 4325 	orr.w	r3, r3, #42240	@ 0xa500
     620:	ea23 0300 	bic.w	r3, r3, r0
     624:	f8a2 33fe 	strh.w	r3, [r2, #1022]	@ 0x3fe
     628:	f381 8810 	msr	PRIMASK, r1
     62c:	f85d 4b04 	ldr.w	r4, [sp], #4
     630:	4770      	bx	lr
     632:	f381 8810 	msr	PRIMASK, r1
     636:	4770      	bx	lr
     638:	2000052c 	.word	0x2000052c
     63c:	4001e000 	.word	0x4001e000
     640:	00002f30 	.word	0x00002f30

00000644 <R_BSP_RegisterProtectDisable>:
     644:	b430      	push	{r4, r5}
     646:	f3ef 8110 	mrs	r1, PRIMASK
     64a:	2301      	movs	r3, #1
     64c:	f383 8810 	msr	PRIMASK, r3
     650:	4a0e      	ldr	r2, [pc, #56]	@ (68c <R_BSP_RegisterProtectDisable+0x48>)
     652:	f832 3010 	ldrh.w	r3, [r2, r0, lsl #1]
     656:	b29b      	uxth	r3, r3
     658:	b96b      	cbnz	r3, 676 <R_BSP_RegisterProtectDisable+0x32>
     65a:	4c0d      	ldr	r4, [pc, #52]	@ (690 <R_BSP_RegisterProtectDisable+0x4c>)
     65c:	4d0d      	ldr	r5, [pc, #52]	@ (694 <R_BSP_RegisterProtectDisable+0x50>)
     65e:	f8b4 33fe 	ldrh.w	r3, [r4, #1022]	@ 0x3fe
     662:	f835 c010 	ldrh.w	ip, [r5, r0, lsl #1]
     666:	b29b      	uxth	r3, r3
     668:	ea43 030c 	orr.w	r3, r3, ip
     66c:	f443 4325 	orr.w	r3, r3, #42240	@ 0xa500
     670:	b29b      	uxth	r3, r3
     672:	f8a4 33fe 	strh.w	r3, [r4, #1022]	@ 0x3fe
     676:	f832 3010 	ldrh.w	r3, [r2, r0, lsl #1]
     67a:	3301      	adds	r3, #1
     67c:	b29b      	uxth	r3, r3
     67e:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
     682:	f381 8810 	msr	PRIMASK, r1
     686:	bc30      	pop	{r4, r5}
     688:	4770      	bx	lr
     68a:	bf00      	nop
     68c:	2000052c 	.word	0x2000052c
     690:	4001e000 	.word	0x4001e000
     694:	00002f30 	.word	0x00002f30

00000698 <_sbrk>:
     698:	b508      	push	{r3, lr}
     69a:	f001 ff19 	bl	24d0 <__errno>
     69e:	220c      	movs	r2, #12
     6a0:	4603      	mov	r3, r0
     6a2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
     6a6:	601a      	str	r2, [r3, #0]
     6a8:	bd08      	pop	{r3, pc}
     6aa:	bf00      	nop

000006ac <R_IOPORT_Close>:
     6ac:	2200      	movs	r2, #0
     6ae:	4603      	mov	r3, r0
     6b0:	4610      	mov	r0, r2
     6b2:	601a      	str	r2, [r3, #0]
     6b4:	4770      	bx	lr
     6b6:	bf00      	nop

000006b8 <R_IOPORT_PinRead>:
     6b8:	0a0b      	lsrs	r3, r1, #8
     6ba:	b410      	push	{r4}
     6bc:	011b      	lsls	r3, r3, #4
     6be:	4c06      	ldr	r4, [pc, #24]	@ (6d8 <R_IOPORT_PinRead+0x20>)
     6c0:	fa53 f181 	uxtab	r1, r3, r1
     6c4:	f854 3021 	ldr.w	r3, [r4, r1, lsl #2]
     6c8:	2000      	movs	r0, #0
     6ca:	f3c3 0340 	ubfx	r3, r3, #1, #1
     6ce:	f85d 4b04 	ldr.w	r4, [sp], #4
     6d2:	7013      	strb	r3, [r2, #0]
     6d4:	4770      	bx	lr
     6d6:	bf00      	nop
     6d8:	40080800 	.word	0x40080800

000006dc <R_IOPORT_PortRead>:
     6dc:	0a09      	lsrs	r1, r1, #8
     6de:	0149      	lsls	r1, r1, #5
     6e0:	f101 4180 	add.w	r1, r1, #1073741824	@ 0x40000000
     6e4:	f501 2100 	add.w	r1, r1, #524288	@ 0x80000
     6e8:	684b      	ldr	r3, [r1, #4]
     6ea:	2000      	movs	r0, #0
     6ec:	8013      	strh	r3, [r2, #0]
     6ee:	4770      	bx	lr

000006f0 <R_IOPORT_PortWrite>:
     6f0:	0a09      	lsrs	r1, r1, #8
     6f2:	0149      	lsls	r1, r1, #5
     6f4:	ea23 0c02 	bic.w	ip, r3, r2
     6f8:	f101 4180 	add.w	r1, r1, #1073741824	@ 0x40000000
     6fc:	401a      	ands	r2, r3
     6fe:	f501 2100 	add.w	r1, r1, #524288	@ 0x80000
     702:	ea42 420c 	orr.w	r2, r2, ip, lsl #16
     706:	2000      	movs	r0, #0
     708:	608a      	str	r2, [r1, #8]
     70a:	4770      	bx	lr

0000070c <R_IOPORT_PinWrite>:
     70c:	2001      	movs	r0, #1
     70e:	b2cb      	uxtb	r3, r1
     710:	4098      	lsls	r0, r3
     712:	b280      	uxth	r0, r0
     714:	b902      	cbnz	r2, 718 <R_IOPORT_PinWrite+0xc>
     716:	0400      	lsls	r0, r0, #16
     718:	0a0b      	lsrs	r3, r1, #8
     71a:	015b      	lsls	r3, r3, #5
     71c:	f103 4380 	add.w	r3, r3, #1073741824	@ 0x40000000
     720:	f503 2300 	add.w	r3, r3, #524288	@ 0x80000
     724:	6098      	str	r0, [r3, #8]
     726:	2000      	movs	r0, #0
     728:	4770      	bx	lr
     72a:	bf00      	nop

0000072c <R_IOPORT_PortDirectionSet>:
     72c:	0a09      	lsrs	r1, r1, #8
     72e:	0149      	lsls	r1, r1, #5
     730:	f101 4180 	add.w	r1, r1, #1073741824	@ 0x40000000
     734:	f501 2100 	add.w	r1, r1, #524288	@ 0x80000
     738:	b410      	push	{r4}
     73a:	680c      	ldr	r4, [r1, #0]
     73c:	ea02 0c03 	and.w	ip, r2, r3
     740:	ea4c 0c04 	orr.w	ip, ip, r4
     744:	ea62 0203 	orn	r2, r2, r3
     748:	ea02 020c 	and.w	r2, r2, ip
     74c:	2000      	movs	r0, #0
     74e:	f85d 4b04 	ldr.w	r4, [sp], #4
     752:	600a      	str	r2, [r1, #0]
     754:	4770      	bx	lr
     756:	bf00      	nop

00000758 <R_IOPORT_PortEventInputRead>:
     758:	0a09      	lsrs	r1, r1, #8
     75a:	0149      	lsls	r1, r1, #5
     75c:	f101 4180 	add.w	r1, r1, #1073741824	@ 0x40000000
     760:	f501 2100 	add.w	r1, r1, #524288	@ 0x80000
     764:	684b      	ldr	r3, [r1, #4]
     766:	2000      	movs	r0, #0
     768:	f3c3 430f 	ubfx	r3, r3, #16, #16
     76c:	8013      	strh	r3, [r2, #0]
     76e:	4770      	bx	lr

00000770 <R_IOPORT_PinEventInputRead>:
     770:	2301      	movs	r3, #1
     772:	b410      	push	{r4}
     774:	ea4f 2c11 	mov.w	ip, r1, lsr #8
     778:	ea4f 1c4c 	mov.w	ip, ip, lsl #5
     77c:	f10c 4c80 	add.w	ip, ip, #1073741824	@ 0x40000000
     780:	f50c 2c00 	add.w	ip, ip, #524288	@ 0x80000
     784:	f8dc 4004 	ldr.w	r4, [ip, #4]
     788:	b2c9      	uxtb	r1, r1
     78a:	408b      	lsls	r3, r1
     78c:	b299      	uxth	r1, r3
     78e:	ea03 4314 	and.w	r3, r3, r4, lsr #16
     792:	1a5b      	subs	r3, r3, r1
     794:	fab3 f383 	clz	r3, r3
     798:	095b      	lsrs	r3, r3, #5
     79a:	2000      	movs	r0, #0
     79c:	f85d 4b04 	ldr.w	r4, [sp], #4
     7a0:	7013      	strb	r3, [r2, #0]
     7a2:	4770      	bx	lr

000007a4 <R_IOPORT_PortEventOutputWrite>:
     7a4:	0a09      	lsrs	r1, r1, #8
     7a6:	0149      	lsls	r1, r1, #5
     7a8:	ea23 0c02 	bic.w	ip, r3, r2
     7ac:	f101 4180 	add.w	r1, r1, #1073741824	@ 0x40000000
     7b0:	401a      	ands	r2, r3
     7b2:	f501 2100 	add.w	r1, r1, #524288	@ 0x80000
     7b6:	ea42 420c 	orr.w	r2, r2, ip, lsl #16
     7ba:	2000      	movs	r0, #0
     7bc:	60ca      	str	r2, [r1, #12]
     7be:	4770      	bx	lr

000007c0 <R_IOPORT_PinEventOutputWrite>:
     7c0:	2001      	movs	r0, #1
     7c2:	0a0b      	lsrs	r3, r1, #8
     7c4:	015b      	lsls	r3, r3, #5
     7c6:	f103 4380 	add.w	r3, r3, #1073741824	@ 0x40000000
     7ca:	f503 2300 	add.w	r3, r3, #524288	@ 0x80000
     7ce:	b2c9      	uxtb	r1, r1
     7d0:	b410      	push	{r4}
     7d2:	fa00 f101 	lsl.w	r1, r0, r1
     7d6:	68dc      	ldr	r4, [r3, #12]
     7d8:	2a01      	cmp	r2, #1
     7da:	ea4f 4001 	mov.w	r0, r1, lsl #16
     7de:	bf0d      	iteet	eq
     7e0:	4384      	biceq	r4, r0
     7e2:	438c      	bicne	r4, r1
     7e4:	4304      	orrne	r4, r0
     7e6:	430c      	orreq	r4, r1
     7e8:	2000      	movs	r0, #0
     7ea:	60dc      	str	r4, [r3, #12]
     7ec:	f85d 4b04 	ldr.w	r4, [sp], #4
     7f0:	4770      	bx	lr
     7f2:	bf00      	nop

000007f4 <bsp_vbatt_init>:
     7f4:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
     7f8:	8803      	ldrh	r3, [r0, #0]
     7fa:	b1db      	cbz	r3, 834 <bsp_vbatt_init+0x40>
     7fc:	4682      	mov	sl, r0
     7fe:	f04f 0b00 	mov.w	fp, #0
     802:	f04f 0901 	mov.w	r9, #1
     806:	f8df 80d0 	ldr.w	r8, [pc, #208]	@ 8d8 <bsp_vbatt_init+0xe4>
     80a:	2400      	movs	r4, #0
     80c:	4d30      	ldr	r5, [pc, #192]	@ (8d0 <bsp_vbatt_init+0xdc>)
     80e:	ea4f 07cb 	mov.w	r7, fp, lsl #3
     812:	f8da 3004 	ldr.w	r3, [sl, #4]
     816:	f835 2b02 	ldrh.w	r2, [r5], #2
     81a:	19d9      	adds	r1, r3, r7
     81c:	8889      	ldrh	r1, [r1, #4]
     81e:	4291      	cmp	r1, r2
     820:	d00a      	beq.n	838 <bsp_vbatt_init+0x44>
     822:	3401      	adds	r4, #1
     824:	2c03      	cmp	r4, #3
     826:	d1f4      	bne.n	812 <bsp_vbatt_init+0x1e>
     828:	f8ba 3000 	ldrh.w	r3, [sl]
     82c:	f10b 0b01 	add.w	fp, fp, #1
     830:	455b      	cmp	r3, fp
     832:	d8ea      	bhi.n	80a <bsp_vbatt_init+0x16>
     834:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
     838:	59db      	ldr	r3, [r3, r7]
     83a:	fa09 f604 	lsl.w	r6, r9, r4
     83e:	f003 53b8 	and.w	r3, r3, #385875968	@ 0x17000000
     842:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
     846:	b2f6      	uxtb	r6, r6
     848:	f898 34bb 	ldrb.w	r3, [r8, #1211]	@ 0x4bb
     84c:	d013      	beq.n	876 <bsp_vbatt_init+0x82>
     84e:	4233      	tst	r3, r6
     850:	d131      	bne.n	8b6 <bsp_vbatt_init+0xc2>
     852:	4a20      	ldr	r2, [pc, #128]	@ (8d4 <bsp_vbatt_init+0xe0>)
     854:	f104 0620 	add.w	r6, r4, #32
     858:	f812 3016 	ldrb.w	r3, [r2, r6, lsl #1]
     85c:	09db      	lsrs	r3, r3, #7
     85e:	d0e0      	beq.n	822 <bsp_vbatt_init+0x2e>
     860:	f812 3016 	ldrb.w	r3, [r2, r6, lsl #1]
     864:	2101      	movs	r1, #1
     866:	f023 0380 	bic.w	r3, r3, #128	@ 0x80
     86a:	20c8      	movs	r0, #200	@ 0xc8
     86c:	f802 3016 	strb.w	r3, [r2, r6, lsl #1]
     870:	f7ff fe0a 	bl	488 <R_BSP_SoftwareDelay>
     874:	e7d5      	b.n	822 <bsp_vbatt_init+0x2e>
     876:	4233      	tst	r3, r6
     878:	d011      	beq.n	89e <bsp_vbatt_init+0xaa>
     87a:	4a16      	ldr	r2, [pc, #88]	@ (8d4 <bsp_vbatt_init+0xe0>)
     87c:	f104 0120 	add.w	r1, r4, #32
     880:	f812 3011 	ldrb.w	r3, [r2, r1, lsl #1]
     884:	09db      	lsrs	r3, r3, #7
     886:	d1cc      	bne.n	822 <bsp_vbatt_init+0x2e>
     888:	f812 3011 	ldrb.w	r3, [r2, r1, lsl #1]
     88c:	20c8      	movs	r0, #200	@ 0xc8
     88e:	f043 0380 	orr.w	r3, r3, #128	@ 0x80
     892:	f802 3011 	strb.w	r3, [r2, r1, lsl #1]
     896:	2101      	movs	r1, #1
     898:	f7ff fdf6 	bl	488 <R_BSP_SoftwareDelay>
     89c:	e7c1      	b.n	822 <bsp_vbatt_init+0x2e>
     89e:	2001      	movs	r0, #1
     8a0:	f7ff fed0 	bl	644 <R_BSP_RegisterProtectDisable>
     8a4:	f898 34bb 	ldrb.w	r3, [r8, #1211]	@ 0x4bb
     8a8:	2001      	movs	r0, #1
     8aa:	4333      	orrs	r3, r6
     8ac:	f888 34bb 	strb.w	r3, [r8, #1211]	@ 0x4bb
     8b0:	f7ff fe98 	bl	5e4 <R_BSP_RegisterProtectEnable>
     8b4:	e7e1      	b.n	87a <bsp_vbatt_init+0x86>
     8b6:	2001      	movs	r0, #1
     8b8:	f7ff fec4 	bl	644 <R_BSP_RegisterProtectDisable>
     8bc:	f898 34bb 	ldrb.w	r3, [r8, #1211]	@ 0x4bb
     8c0:	2001      	movs	r0, #1
     8c2:	ea23 0306 	bic.w	r3, r3, r6
     8c6:	f888 34bb 	strb.w	r3, [r8, #1211]	@ 0x4bb
     8ca:	f7ff fe8b 	bl	5e4 <R_BSP_RegisterProtectEnable>
     8ce:	e7c0      	b.n	852 <bsp_vbatt_init+0x5e>
     8d0:	00003014 	.word	0x00003014
     8d4:	40083000 	.word	0x40083000
     8d8:	4001e000 	.word	0x4001e000

000008dc <r_ioport_pins_config>:
     8dc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     8de:	4604      	mov	r4, r0
     8e0:	f7ff ff88 	bl	7f4 <bsp_vbatt_init>
     8e4:	f3ef 8210 	mrs	r2, PRIMASK
     8e8:	2301      	movs	r3, #1
     8ea:	f383 8810 	msr	PRIMASK, r3
     8ee:	4f23      	ldr	r7, [pc, #140]	@ (97c <r_ioport_pins_config+0xa0>)
     8f0:	683b      	ldr	r3, [r7, #0]
     8f2:	b91b      	cbnz	r3, 8fc <r_ioport_pins_config+0x20>
     8f4:	4922      	ldr	r1, [pc, #136]	@ (980 <r_ioport_pins_config+0xa4>)
     8f6:	70cb      	strb	r3, [r1, #3]
     8f8:	2340      	movs	r3, #64	@ 0x40
     8fa:	70cb      	strb	r3, [r1, #3]
     8fc:	683b      	ldr	r3, [r7, #0]
     8fe:	3301      	adds	r3, #1
     900:	603b      	str	r3, [r7, #0]
     902:	f382 8810 	msr	PRIMASK, r2
     906:	8823      	ldrh	r3, [r4, #0]
     908:	b32b      	cbz	r3, 956 <r_ioport_pins_config+0x7a>
     90a:	6861      	ldr	r1, [r4, #4]
     90c:	4c1d      	ldr	r4, [pc, #116]	@ (984 <r_ioport_pins_config+0xa8>)
     90e:	eb01 0ec3 	add.w	lr, r1, r3, lsl #3
     912:	e006      	b.n	922 <r_ioport_pins_config+0x46>
     914:	011b      	lsls	r3, r3, #4
     916:	3108      	adds	r1, #8
     918:	4413      	add	r3, r2
     91a:	458e      	cmp	lr, r1
     91c:	f844 0023 	str.w	r0, [r4, r3, lsl #2]
     920:	d019      	beq.n	956 <r_ioport_pins_config+0x7a>
     922:	6808      	ldr	r0, [r1, #0]
     924:	888a      	ldrh	r2, [r1, #4]
     926:	03c5      	lsls	r5, r0, #15
     928:	ea4f 2312 	mov.w	r3, r2, lsr #8
     92c:	b2d2      	uxtb	r2, r2
     92e:	d5f1      	bpl.n	914 <r_ioport_pins_config+0x38>
     930:	eb02 1c03 	add.w	ip, r2, r3, lsl #4
     934:	f854 602c 	ldr.w	r6, [r4, ip, lsl #2]
     938:	011b      	lsls	r3, r3, #4
     93a:	3108      	adds	r1, #8
     93c:	f420 3580 	bic.w	r5, r0, #65536	@ 0x10000
     940:	f426 3680 	bic.w	r6, r6, #65536	@ 0x10000
     944:	4413      	add	r3, r2
     946:	458e      	cmp	lr, r1
     948:	f844 602c 	str.w	r6, [r4, ip, lsl #2]
     94c:	f844 502c 	str.w	r5, [r4, ip, lsl #2]
     950:	f844 0023 	str.w	r0, [r4, r3, lsl #2]
     954:	d1e5      	bne.n	922 <r_ioport_pins_config+0x46>
     956:	f3ef 8210 	mrs	r2, PRIMASK
     95a:	2301      	movs	r3, #1
     95c:	f383 8810 	msr	PRIMASK, r3
     960:	683b      	ldr	r3, [r7, #0]
     962:	b113      	cbz	r3, 96a <r_ioport_pins_config+0x8e>
     964:	683b      	ldr	r3, [r7, #0]
     966:	3b01      	subs	r3, #1
     968:	603b      	str	r3, [r7, #0]
     96a:	683b      	ldr	r3, [r7, #0]
     96c:	b91b      	cbnz	r3, 976 <r_ioport_pins_config+0x9a>
     96e:	2080      	movs	r0, #128	@ 0x80
     970:	4903      	ldr	r1, [pc, #12]	@ (980 <r_ioport_pins_config+0xa4>)
     972:	70cb      	strb	r3, [r1, #3]
     974:	70c8      	strb	r0, [r1, #3]
     976:	f382 8810 	msr	PRIMASK, r2
     97a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
     97c:	20000500 	.word	0x20000500
     980:	40080d00 	.word	0x40080d00
     984:	40080800 	.word	0x40080800

00000988 <R_IOPORT_Open>:
     988:	b508      	push	{r3, lr}
     98a:	4b03      	ldr	r3, [pc, #12]	@ (998 <R_IOPORT_Open+0x10>)
     98c:	6003      	str	r3, [r0, #0]
     98e:	4608      	mov	r0, r1
     990:	f7ff ffa4 	bl	8dc <r_ioport_pins_config>
     994:	2000      	movs	r0, #0
     996:	bd08      	pop	{r3, pc}
     998:	504f5254 	.word	0x504f5254

0000099c <R_IOPORT_PinsCfg>:
     99c:	b508      	push	{r3, lr}
     99e:	4608      	mov	r0, r1
     9a0:	f7ff ff9c 	bl	8dc <r_ioport_pins_config>
     9a4:	2000      	movs	r0, #0
     9a6:	bd08      	pop	{r3, pc}

000009a8 <R_IOPORT_PinCfg>:
     9a8:	b570      	push	{r4, r5, r6, lr}
     9aa:	2601      	movs	r6, #1
     9ac:	b086      	sub	sp, #24
     9ae:	ab01      	add	r3, sp, #4
     9b0:	a803      	add	r0, sp, #12
     9b2:	460c      	mov	r4, r1
     9b4:	4615      	mov	r5, r2
     9b6:	9304      	str	r3, [sp, #16]
     9b8:	f8ad 600c 	strh.w	r6, [sp, #12]
     9bc:	f8ad 1008 	strh.w	r1, [sp, #8]
     9c0:	9201      	str	r2, [sp, #4]
     9c2:	f7ff ff17 	bl	7f4 <bsp_vbatt_init>
     9c6:	f3ef 8210 	mrs	r2, PRIMASK
     9ca:	f386 8810 	msr	PRIMASK, r6
     9ce:	491d      	ldr	r1, [pc, #116]	@ (a44 <R_IOPORT_PinCfg+0x9c>)
     9d0:	680b      	ldr	r3, [r1, #0]
     9d2:	b91b      	cbnz	r3, 9dc <R_IOPORT_PinCfg+0x34>
     9d4:	2640      	movs	r6, #64	@ 0x40
     9d6:	481c      	ldr	r0, [pc, #112]	@ (a48 <R_IOPORT_PinCfg+0xa0>)
     9d8:	70c3      	strb	r3, [r0, #3]
     9da:	70c6      	strb	r6, [r0, #3]
     9dc:	680b      	ldr	r3, [r1, #0]
     9de:	3301      	adds	r3, #1
     9e0:	600b      	str	r3, [r1, #0]
     9e2:	f382 8810 	msr	PRIMASK, r2
     9e6:	03ea      	lsls	r2, r5, #15
     9e8:	ea4f 2314 	mov.w	r3, r4, lsr #8
     9ec:	b2e4      	uxtb	r4, r4
     9ee:	d419      	bmi.n	a24 <R_IOPORT_PinCfg+0x7c>
     9f0:	011b      	lsls	r3, r3, #4
     9f2:	4a16      	ldr	r2, [pc, #88]	@ (a4c <R_IOPORT_PinCfg+0xa4>)
     9f4:	4423      	add	r3, r4
     9f6:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
     9fa:	f3ef 8210 	mrs	r2, PRIMASK
     9fe:	2301      	movs	r3, #1
     a00:	f383 8810 	msr	PRIMASK, r3
     a04:	680b      	ldr	r3, [r1, #0]
     a06:	b113      	cbz	r3, a0e <R_IOPORT_PinCfg+0x66>
     a08:	680b      	ldr	r3, [r1, #0]
     a0a:	3b01      	subs	r3, #1
     a0c:	600b      	str	r3, [r1, #0]
     a0e:	680b      	ldr	r3, [r1, #0]
     a10:	b91b      	cbnz	r3, a1a <R_IOPORT_PinCfg+0x72>
     a12:	2080      	movs	r0, #128	@ 0x80
     a14:	490c      	ldr	r1, [pc, #48]	@ (a48 <R_IOPORT_PinCfg+0xa0>)
     a16:	70cb      	strb	r3, [r1, #3]
     a18:	70c8      	strb	r0, [r1, #3]
     a1a:	f382 8810 	msr	PRIMASK, r2
     a1e:	2000      	movs	r0, #0
     a20:	b006      	add	sp, #24
     a22:	bd70      	pop	{r4, r5, r6, pc}
     a24:	4a09      	ldr	r2, [pc, #36]	@ (a4c <R_IOPORT_PinCfg+0xa4>)
     a26:	eb04 1003 	add.w	r0, r4, r3, lsl #4
     a2a:	f852 6020 	ldr.w	r6, [r2, r0, lsl #2]
     a2e:	011b      	lsls	r3, r3, #4
     a30:	f426 3680 	bic.w	r6, r6, #65536	@ 0x10000
     a34:	f842 6020 	str.w	r6, [r2, r0, lsl #2]
     a38:	f425 3680 	bic.w	r6, r5, #65536	@ 0x10000
     a3c:	f842 6020 	str.w	r6, [r2, r0, lsl #2]
     a40:	e7d7      	b.n	9f2 <R_IOPORT_PinCfg+0x4a>
     a42:	bf00      	nop
     a44:	20000500 	.word	0x20000500
     a48:	40080d00 	.word	0x40080d00
     a4c:	40080800 	.word	0x40080800

00000a50 <R_SCI_I2C_Abort>:
     a50:	4603      	mov	r3, r0
     a52:	2200      	movs	r2, #0
     a54:	f04f 0cf0 	mov.w	ip, #240	@ 0xf0
     a58:	6919      	ldr	r1, [r3, #16]
     a5a:	4610      	mov	r0, r2
     a5c:	708a      	strb	r2, [r1, #2]
     a5e:	f881 c00b 	strb.w	ip, [r1, #11]
     a62:	f893 c02a 	ldrb.w	ip, [r3, #42]	@ 0x2a
     a66:	69d9      	ldr	r1, [r3, #28]
     a68:	f883 2030 	strb.w	r2, [r3, #48]	@ 0x30
     a6c:	621a      	str	r2, [r3, #32]
     a6e:	f883 202e 	strb.w	r2, [r3, #46]	@ 0x2e
     a72:	f883 c02c 	strb.w	ip, [r3, #44]	@ 0x2c
     a76:	6259      	str	r1, [r3, #36]	@ 0x24
     a78:	4770      	bx	lr
     a7a:	bf00      	nop

00000a7c <R_SCI_I2C_SlaveAddressSet>:
     a7c:	4603      	mov	r3, r0
     a7e:	2000      	movs	r0, #0
     a80:	6059      	str	r1, [r3, #4]
     a82:	721a      	strb	r2, [r3, #8]
     a84:	4770      	bx	lr
     a86:	bf00      	nop

00000a88 <R_SCI_I2C_CallbackSet>:
     a88:	4684      	mov	ip, r0
     a8a:	2000      	movs	r0, #0
     a8c:	e9cc 320e 	strd	r3, r2, [ip, #56]	@ 0x38
     a90:	f8cc 1034 	str.w	r1, [ip, #52]	@ 0x34
     a94:	4770      	bx	lr
     a96:	bf00      	nop

00000a98 <R_SCI_I2C_StatusGet>:
     a98:	4603      	mov	r3, r0
     a9a:	4a04      	ldr	r2, [pc, #16]	@ (aac <R_SCI_I2C_StatusGet+0x14>)
     a9c:	68db      	ldr	r3, [r3, #12]
     a9e:	2000      	movs	r0, #0
     aa0:	1a9b      	subs	r3, r3, r2
     aa2:	fab3 f383 	clz	r3, r3
     aa6:	095b      	lsrs	r3, r3, #5
     aa8:	700b      	strb	r3, [r1, #0]
     aaa:	4770      	bx	lr
     aac:	53493243 	.word	0x53493243

00000ab0 <R_SCI_I2C_Close>:
     ab0:	4603      	mov	r3, r0
     ab2:	b410      	push	{r4}
     ab4:	2000      	movs	r0, #0
     ab6:	24f0      	movs	r4, #240	@ 0xf0
     ab8:	691a      	ldr	r2, [r3, #16]
     aba:	69d9      	ldr	r1, [r3, #28]
     abc:	7090      	strb	r0, [r2, #2]
     abe:	7090      	strb	r0, [r2, #2]
     ac0:	72d4      	strb	r4, [r2, #11]
     ac2:	f893 202a 	ldrb.w	r2, [r3, #42]	@ 0x2a
     ac6:	f883 0030 	strb.w	r0, [r3, #48]	@ 0x30
     aca:	6218      	str	r0, [r3, #32]
     acc:	f883 002e 	strb.w	r0, [r3, #46]	@ 0x2e
     ad0:	f883 202c 	strb.w	r2, [r3, #44]	@ 0x2c
     ad4:	6259      	str	r1, [r3, #36]	@ 0x24
     ad6:	60d8      	str	r0, [r3, #12]
     ad8:	f3ef 8110 	mrs	r1, PRIMASK
     adc:	2201      	movs	r2, #1
     ade:	f382 8810 	msr	PRIMASK, r2
     ae2:	681b      	ldr	r3, [r3, #0]
     ae4:	4a07      	ldr	r2, [pc, #28]	@ (b04 <R_SCI_I2C_Close+0x54>)
     ae6:	f893 c000 	ldrb.w	ip, [r3]
     aea:	f04f 4300 	mov.w	r3, #2147483648	@ 0x80000000
     aee:	6854      	ldr	r4, [r2, #4]
     af0:	fa23 f30c 	lsr.w	r3, r3, ip
     af4:	4323      	orrs	r3, r4
     af6:	6053      	str	r3, [r2, #4]
     af8:	6853      	ldr	r3, [r2, #4]
     afa:	f381 8810 	msr	PRIMASK, r1
     afe:	f85d 4b04 	ldr.w	r4, [sp], #4
     b02:	4770      	bx	lr
     b04:	40084000 	.word	0x40084000

00000b08 <R_SCI_I2C_Read>:
     b08:	f890 c008 	ldrb.w	ip, [r0, #8]
     b0c:	6181      	str	r1, [r0, #24]
     b0e:	f1bc 0f01 	cmp.w	ip, #1
     b12:	f880 302e 	strb.w	r3, [r0, #46]	@ 0x2e
     b16:	61c2      	str	r2, [r0, #28]
     b18:	d034      	beq.n	b84 <R_SCI_I2C_Read+0x7c>
     b1a:	f890 c02a 	ldrb.w	ip, [r0, #42]	@ 0x2a
     b1e:	2300      	movs	r3, #0
     b20:	2101      	movs	r1, #1
     b22:	f880 102d 	strb.w	r1, [r0, #45]	@ 0x2d
     b26:	f880 302f 	strb.w	r3, [r0, #47]	@ 0x2f
     b2a:	f880 3031 	strb.w	r3, [r0, #49]	@ 0x31
     b2e:	f880 3033 	strb.w	r3, [r0, #51]	@ 0x33
     b32:	6202      	str	r2, [r0, #32]
     b34:	f890 202d 	ldrb.w	r2, [r0, #45]	@ 0x2d
     b38:	f880 c02b 	strb.w	ip, [r0, #43]	@ 0x2b
     b3c:	f880 302c 	strb.w	r3, [r0, #44]	@ 0x2c
     b40:	6243      	str	r3, [r0, #36]	@ 0x24
     b42:	b10a      	cbz	r2, b48 <R_SCI_I2C_Read+0x40>
     b44:	f880 1031 	strb.w	r1, [r0, #49]	@ 0x31
     b48:	22b4      	movs	r2, #180	@ 0xb4
     b4a:	6903      	ldr	r3, [r0, #16]
     b4c:	709a      	strb	r2, [r3, #2]
     b4e:	f890 2030 	ldrb.w	r2, [r0, #48]	@ 0x30
     b52:	b91a      	cbnz	r2, b5c <R_SCI_I2C_Read+0x54>
     b54:	2251      	movs	r2, #81	@ 0x51
     b56:	2000      	movs	r0, #0
     b58:	72da      	strb	r2, [r3, #11]
     b5a:	4770      	bx	lr
     b5c:	2200      	movs	r2, #0
     b5e:	f880 2030 	strb.w	r2, [r0, #48]	@ 0x30
     b62:	2201      	movs	r2, #1
     b64:	f1bc 0f01 	cmp.w	ip, #1
     b68:	bf0c      	ite	eq
     b6a:	f890 1028 	ldrbeq.w	r1, [r0, #40]	@ 0x28
     b6e:	f890 1029 	ldrbne.w	r1, [r0, #41]	@ 0x29
     b72:	f10c 3cff 	add.w	ip, ip, #4294967295	@ 0xffffffff
     b76:	70d9      	strb	r1, [r3, #3]
     b78:	f880 c02b 	strb.w	ip, [r0, #43]	@ 0x2b
     b7c:	f880 202c 	strb.w	r2, [r0, #44]	@ 0x2c
     b80:	2000      	movs	r0, #0
     b82:	4770      	bx	lr
     b84:	2100      	movs	r1, #0
     b86:	6843      	ldr	r3, [r0, #4]
     b88:	f880 c02a 	strb.w	ip, [r0, #42]	@ 0x2a
     b8c:	005b      	lsls	r3, r3, #1
     b8e:	f043 0301 	orr.w	r3, r3, #1
     b92:	f880 3028 	strb.w	r3, [r0, #40]	@ 0x28
     b96:	f880 1029 	strb.w	r1, [r0, #41]	@ 0x29
     b9a:	e7c0      	b.n	b1e <R_SCI_I2C_Read+0x16>

00000b9c <R_SCI_I2C_Write>:
     b9c:	f890 c008 	ldrb.w	ip, [r0, #8]
     ba0:	6181      	str	r1, [r0, #24]
     ba2:	f1bc 0f01 	cmp.w	ip, #1
     ba6:	f880 302e 	strb.w	r3, [r0, #46]	@ 0x2e
     baa:	61c2      	str	r2, [r0, #28]
     bac:	d034      	beq.n	c18 <R_SCI_I2C_Write+0x7c>
     bae:	f890 c02a 	ldrb.w	ip, [r0, #42]	@ 0x2a
     bb2:	2300      	movs	r3, #0
     bb4:	f880 302d 	strb.w	r3, [r0, #45]	@ 0x2d
     bb8:	f880 302f 	strb.w	r3, [r0, #47]	@ 0x2f
     bbc:	f880 3031 	strb.w	r3, [r0, #49]	@ 0x31
     bc0:	f880 3033 	strb.w	r3, [r0, #51]	@ 0x33
     bc4:	6202      	str	r2, [r0, #32]
     bc6:	f890 202d 	ldrb.w	r2, [r0, #45]	@ 0x2d
     bca:	f880 c02b 	strb.w	ip, [r0, #43]	@ 0x2b
     bce:	f880 302c 	strb.w	r3, [r0, #44]	@ 0x2c
     bd2:	6243      	str	r3, [r0, #36]	@ 0x24
     bd4:	b112      	cbz	r2, bdc <R_SCI_I2C_Write+0x40>
     bd6:	2301      	movs	r3, #1
     bd8:	f880 3031 	strb.w	r3, [r0, #49]	@ 0x31
     bdc:	22b4      	movs	r2, #180	@ 0xb4
     bde:	6903      	ldr	r3, [r0, #16]
     be0:	709a      	strb	r2, [r3, #2]
     be2:	f890 2030 	ldrb.w	r2, [r0, #48]	@ 0x30
     be6:	b91a      	cbnz	r2, bf0 <R_SCI_I2C_Write+0x54>
     be8:	2251      	movs	r2, #81	@ 0x51
     bea:	2000      	movs	r0, #0
     bec:	72da      	strb	r2, [r3, #11]
     bee:	4770      	bx	lr
     bf0:	2200      	movs	r2, #0
     bf2:	f880 2030 	strb.w	r2, [r0, #48]	@ 0x30
     bf6:	2201      	movs	r2, #1
     bf8:	f1bc 0f01 	cmp.w	ip, #1
     bfc:	bf0c      	ite	eq
     bfe:	f890 1028 	ldrbeq.w	r1, [r0, #40]	@ 0x28
     c02:	f890 1029 	ldrbne.w	r1, [r0, #41]	@ 0x29
     c06:	f10c 3cff 	add.w	ip, ip, #4294967295	@ 0xffffffff
     c0a:	70d9      	strb	r1, [r3, #3]
     c0c:	f880 c02b 	strb.w	ip, [r0, #43]	@ 0x2b
     c10:	f880 202c 	strb.w	r2, [r0, #44]	@ 0x2c
     c14:	2000      	movs	r0, #0
     c16:	4770      	bx	lr
     c18:	2100      	movs	r1, #0
     c1a:	6843      	ldr	r3, [r0, #4]
     c1c:	f880 c02a 	strb.w	ip, [r0, #42]	@ 0x2a
     c20:	005b      	lsls	r3, r3, #1
     c22:	f880 3028 	strb.w	r3, [r0, #40]	@ 0x28
     c26:	f880 1029 	strb.w	r1, [r0, #41]	@ 0x29
     c2a:	e7c2      	b.n	bb2 <R_SCI_I2C_Write+0x16>

00000c2c <R_SCI_I2C_Open>:
     c2c:	4603      	mov	r3, r0
     c2e:	2200      	movs	r2, #0
     c30:	b5f0      	push	{r4, r5, r6, r7, lr}
     c32:	7808      	ldrb	r0, [r1, #0]
     c34:	688c      	ldr	r4, [r1, #8]
     c36:	f500 0080 	add.w	r0, r0, #4194304	@ 0x400000
     c3a:	e9c3 1400 	strd	r1, r4, [r3]
     c3e:	f500 508c 	add.w	r0, r0, #4480	@ 0x1180
     c42:	0200      	lsls	r0, r0, #8
     c44:	6118      	str	r0, [r3, #16]
     c46:	7b08      	ldrb	r0, [r1, #12]
     c48:	7218      	strb	r0, [r3, #8]
     c4a:	e9d1 4007 	ldrd	r4, r0, [r1, #28]
     c4e:	635c      	str	r4, [r3, #52]	@ 0x34
     c50:	e9c3 200e 	strd	r2, r0, [r3, #56]	@ 0x38
     c54:	f3ef 8610 	mrs	r6, PRIMASK
     c58:	f04f 0e01 	mov.w	lr, #1
     c5c:	f38e 8810 	msr	PRIMASK, lr
     c60:	f04f 4500 	mov.w	r5, #2147483648	@ 0x80000000
     c64:	780c      	ldrb	r4, [r1, #0]
     c66:	4844      	ldr	r0, [pc, #272]	@ (d78 <R_SCI_I2C_Open+0x14c>)
     c68:	40e5      	lsrs	r5, r4
     c6a:	6844      	ldr	r4, [r0, #4]
     c6c:	ea24 0405 	bic.w	r4, r4, r5
     c70:	6044      	str	r4, [r0, #4]
     c72:	6840      	ldr	r0, [r0, #4]
     c74:	f386 8810 	msr	PRIMASK, r6
     c78:	24f0      	movs	r4, #240	@ 0xf0
     c7a:	27fa      	movs	r7, #250	@ 0xfa
     c7c:	2523      	movs	r5, #35	@ 0x23
     c7e:	6818      	ldr	r0, [r3, #0]
     c80:	6a46      	ldr	r6, [r0, #36]	@ 0x24
     c82:	6918      	ldr	r0, [r3, #16]
     c84:	7082      	strb	r2, [r0, #2]
     c86:	72c4      	strb	r4, [r0, #11]
     c88:	78b4      	ldrb	r4, [r6, #2]
     c8a:	f004 0403 	and.w	r4, r4, #3
     c8e:	7004      	strb	r4, [r0, #0]
     c90:	7834      	ldrb	r4, [r6, #0]
     c92:	7187      	strb	r7, [r0, #6]
     c94:	00a4      	lsls	r4, r4, #2
     c96:	7877      	ldrb	r7, [r6, #1]
     c98:	f044 0420 	orr.w	r4, r4, #32
     c9c:	b2e4      	uxtb	r4, r4
     c9e:	7047      	strb	r7, [r0, #1]
     ca0:	71c4      	strb	r4, [r0, #7]
     ca2:	7974      	ldrb	r4, [r6, #5]
     ca4:	7204      	strb	r4, [r0, #8]
     ca6:	78f4      	ldrb	r4, [r6, #3]
     ca8:	7484      	strb	r4, [r0, #18]
     caa:	7934      	ldrb	r4, [r6, #4]
     cac:	4e33      	ldr	r6, [pc, #204]	@ (d7c <R_SCI_I2C_Open+0x150>)
     cae:	00e4      	lsls	r4, r4, #3
     cb0:	ea44 040e 	orr.w	r4, r4, lr
     cb4:	b2e4      	uxtb	r4, r4
     cb6:	7244      	strb	r4, [r0, #9]
     cb8:	7285      	strb	r5, [r0, #10]
     cba:	7342      	strb	r2, [r0, #13]
     cbc:	f891 c00d 	ldrb.w	ip, [r1, #13]
     cc0:	f991 000f 	ldrsb.w	r0, [r1, #15]
     cc4:	4c2e      	ldr	r4, [pc, #184]	@ (d80 <R_SCI_I2C_Open+0x154>)
     cc6:	ea4f 1c0c 	mov.w	ip, ip, lsl #4
     cca:	4d2e      	ldr	r5, [pc, #184]	@ (d84 <R_SCI_I2C_Open+0x158>)
     ccc:	1827      	adds	r7, r4, r0
     cce:	fa5f fc8c 	uxtb.w	ip, ip
     cd2:	f887 c300 	strb.w	ip, [r7, #768]	@ 0x300
     cd6:	f100 0cc0 	add.w	ip, r0, #192	@ 0xc0
     cda:	f846 3020 	str.w	r3, [r6, r0, lsl #2]
     cde:	f855 702c 	ldr.w	r7, [r5, ip, lsl #2]
     ce2:	f362 4710 	bfi	r7, r2, #16, #1
     ce6:	f845 702c 	str.w	r7, [r5, ip, lsl #2]
     cea:	f855 702c 	ldr.w	r7, [r5, ip, lsl #2]
     cee:	f3bf 8f5f 	dmb	sy
     cf2:	ea4f 1c50 	mov.w	ip, r0, lsr #5
     cf6:	ea4f 0c8c 	mov.w	ip, ip, lsl #2
     cfa:	f000 001f 	and.w	r0, r0, #31
     cfe:	f10c 4c60 	add.w	ip, ip, #3758096384	@ 0xe0000000
     d02:	fa0e f000 	lsl.w	r0, lr, r0
     d06:	f50c 4c61 	add.w	ip, ip, #57600	@ 0xe100
     d0a:	f8cc 0180 	str.w	r0, [ip, #384]	@ 0x180
     d0e:	f8cc 0000 	str.w	r0, [ip]
     d12:	7b48      	ldrb	r0, [r1, #13]
     d14:	f991 1010 	ldrsb.w	r1, [r1, #16]
     d18:	0100      	lsls	r0, r0, #4
     d1a:	440c      	add	r4, r1
     d1c:	b2c0      	uxtb	r0, r0
     d1e:	f884 0300 	strb.w	r0, [r4, #768]	@ 0x300
     d22:	f101 00c0 	add.w	r0, r1, #192	@ 0xc0
     d26:	f846 3021 	str.w	r3, [r6, r1, lsl #2]
     d2a:	f855 4020 	ldr.w	r4, [r5, r0, lsl #2]
     d2e:	f362 4410 	bfi	r4, r2, #16, #1
     d32:	f845 4020 	str.w	r4, [r5, r0, lsl #2]
     d36:	f855 0020 	ldr.w	r0, [r5, r0, lsl #2]
     d3a:	f3bf 8f5f 	dmb	sy
     d3e:	f001 001f 	and.w	r0, r1, #31
     d42:	0949      	lsrs	r1, r1, #5
     d44:	0089      	lsls	r1, r1, #2
     d46:	f101 4160 	add.w	r1, r1, #3758096384	@ 0xe0000000
     d4a:	fa0e f000 	lsl.w	r0, lr, r0
     d4e:	f501 4161 	add.w	r1, r1, #57600	@ 0xe100
     d52:	f8c1 0180 	str.w	r0, [r1, #384]	@ 0x180
     d56:	6008      	str	r0, [r1, #0]
     d58:	490b      	ldr	r1, [pc, #44]	@ (d88 <R_SCI_I2C_Open+0x15c>)
     d5a:	f883 202d 	strb.w	r2, [r3, #45]	@ 0x2d
     d5e:	4610      	mov	r0, r2
     d60:	f883 202e 	strb.w	r2, [r3, #46]	@ 0x2e
     d64:	e9c3 2208 	strd	r2, r2, [r3, #32]
     d68:	f883 202f 	strb.w	r2, [r3, #47]	@ 0x2f
     d6c:	619a      	str	r2, [r3, #24]
     d6e:	61da      	str	r2, [r3, #28]
     d70:	f883 2030 	strb.w	r2, [r3, #48]	@ 0x30
     d74:	60d9      	str	r1, [r3, #12]
     d76:	bdf0      	pop	{r4, r5, r6, r7, pc}
     d78:	40084000 	.word	0x40084000
     d7c:	20000504 	.word	0x20000504
     d80:	e000e100 	.word	0xe000e100
     d84:	40006000 	.word	0x40006000
     d88:	53493243 	.word	0x53493243

00000d8c <sci_i2c_notify>:
     d8c:	b530      	push	{r4, r5, lr}
     d8e:	6b83      	ldr	r3, [r0, #56]	@ 0x38
     d90:	b083      	sub	sp, #12
     d92:	4604      	mov	r4, r0
     d94:	460a      	mov	r2, r1
     d96:	466d      	mov	r5, sp
     d98:	b18b      	cbz	r3, dbe <sci_i2c_notify+0x32>
     d9a:	e893 0003 	ldmia.w	r3, {r0, r1}
     d9e:	e9cd 0100 	strd	r0, r1, [sp]
     da2:	6be1      	ldr	r1, [r4, #60]	@ 0x3c
     da4:	711a      	strb	r2, [r3, #4]
     da6:	4618      	mov	r0, r3
     da8:	6b62      	ldr	r2, [r4, #52]	@ 0x34
     daa:	6019      	str	r1, [r3, #0]
     dac:	4790      	blx	r2
     dae:	6ba3      	ldr	r3, [r4, #56]	@ 0x38
     db0:	b11b      	cbz	r3, dba <sci_i2c_notify+0x2e>
     db2:	e895 0003 	ldmia.w	r5, {r0, r1}
     db6:	e883 0003 	stmia.w	r3, {r0, r1}
     dba:	b003      	add	sp, #12
     dbc:	bd30      	pop	{r4, r5, pc}
     dbe:	466b      	mov	r3, sp
     dc0:	e7ef      	b.n	da2 <sci_i2c_notify+0x16>
     dc2:	bf00      	nop

00000dc4 <sci_i2c_txi_isr>:
     dc4:	b410      	push	{r4}
     dc6:	f3ef 8303 	mrs	r3, PSR
     dca:	3b10      	subs	r3, #16
     dcc:	4a4d      	ldr	r2, [pc, #308]	@ (f04 <sci_i2c_txi_isr+0x140>)
     dce:	b25b      	sxtb	r3, r3
     dd0:	33c0      	adds	r3, #192	@ 0xc0
     dd2:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
     dd6:	f421 3180 	bic.w	r1, r1, #65536	@ 0x10000
     dda:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
     dde:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
     de2:	f3ef 8303 	mrs	r3, PSR
     de6:	4a48      	ldr	r2, [pc, #288]	@ (f08 <sci_i2c_txi_isr+0x144>)
     de8:	3b10      	subs	r3, #16
     dea:	b25b      	sxtb	r3, r3
     dec:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
     df0:	691a      	ldr	r2, [r3, #16]
     df2:	7b11      	ldrb	r1, [r2, #12]
     df4:	f3c1 0c00 	ubfx	ip, r1, #0, #1
     df8:	07c9      	lsls	r1, r1, #31
     dfa:	d42a      	bmi.n	e52 <sci_i2c_txi_isr+0x8e>
     dfc:	f893 102c 	ldrb.w	r1, [r3, #44]	@ 0x2c
     e00:	f893 002a 	ldrb.w	r0, [r3, #42]	@ 0x2a
     e04:	4288      	cmp	r0, r1
     e06:	d012      	beq.n	e2e <sci_i2c_txi_isr+0x6a>
     e08:	f893 002d 	ldrb.w	r0, [r3, #45]	@ 0x2d
     e0c:	b108      	cbz	r0, e12 <sci_i2c_txi_isr+0x4e>
     e0e:	2902      	cmp	r1, #2
     e10:	d04d      	beq.n	eae <sci_i2c_txi_isr+0xea>
     e12:	f893 0028 	ldrb.w	r0, [r3, #40]	@ 0x28
     e16:	3101      	adds	r1, #1
     e18:	70d0      	strb	r0, [r2, #3]
     e1a:	f893 202b 	ldrb.w	r2, [r3, #43]	@ 0x2b
     e1e:	f883 102c 	strb.w	r1, [r3, #44]	@ 0x2c
     e22:	3a01      	subs	r2, #1
     e24:	f883 202b 	strb.w	r2, [r3, #43]	@ 0x2b
     e28:	f85d 4b04 	ldr.w	r4, [sp], #4
     e2c:	4770      	bx	lr
     e2e:	6a19      	ldr	r1, [r3, #32]
     e30:	2900      	cmp	r1, #0
     e32:	d033      	beq.n	e9c <sci_i2c_txi_isr+0xd8>
     e34:	f893 002d 	ldrb.w	r0, [r3, #45]	@ 0x2d
     e38:	2800      	cmp	r0, #0
     e3a:	d13e      	bne.n	eba <sci_i2c_txi_isr+0xf6>
     e3c:	6a58      	ldr	r0, [r3, #36]	@ 0x24
     e3e:	699c      	ldr	r4, [r3, #24]
     e40:	3901      	subs	r1, #1
     e42:	5c24      	ldrb	r4, [r4, r0]
     e44:	3001      	adds	r0, #1
     e46:	e9c3 1008 	strd	r1, r0, [r3, #32]
     e4a:	70d4      	strb	r4, [r2, #3]
     e4c:	f85d 4b04 	ldr.w	r4, [sp], #4
     e50:	4770      	bx	lr
     e52:	f893 102d 	ldrb.w	r1, [r3, #45]	@ 0x2d
     e56:	b1b9      	cbz	r1, e88 <sci_i2c_txi_isr+0xc4>
     e58:	f893 1031 	ldrb.w	r1, [r3, #49]	@ 0x31
     e5c:	b9a1      	cbnz	r1, e88 <sci_i2c_txi_isr+0xc4>
     e5e:	7950      	ldrb	r0, [r2, #5]
     e60:	6999      	ldr	r1, [r3, #24]
     e62:	6a5a      	ldr	r2, [r3, #36]	@ 0x24
     e64:	5488      	strb	r0, [r1, r2]
     e66:	f893 402e 	ldrb.w	r4, [r3, #46]	@ 0x2e
     e6a:	e9d3 1208 	ldrd	r1, r2, [r3, #32]
     e6e:	3901      	subs	r1, #1
     e70:	3201      	adds	r2, #1
     e72:	e9c3 1208 	strd	r1, r2, [r3, #32]
     e76:	6918      	ldr	r0, [r3, #16]
     e78:	2c00      	cmp	r4, #0
     e7a:	d03a      	beq.n	ef2 <sci_i2c_txi_isr+0x12e>
     e7c:	2152      	movs	r1, #82	@ 0x52
     e7e:	2201      	movs	r2, #1
     e80:	72c1      	strb	r1, [r0, #11]
     e82:	f883 2030 	strb.w	r2, [r3, #48]	@ 0x30
     e86:	e7cf      	b.n	e28 <sci_i2c_txi_isr+0x64>
     e88:	2400      	movs	r4, #0
     e8a:	2001      	movs	r0, #1
     e8c:	2154      	movs	r1, #84	@ 0x54
     e8e:	621c      	str	r4, [r3, #32]
     e90:	f883 002f 	strb.w	r0, [r3, #47]	@ 0x2f
     e94:	f85d 4b04 	ldr.w	r4, [sp], #4
     e98:	72d1      	strb	r1, [r2, #11]
     e9a:	4770      	bx	lr
     e9c:	f893 102e 	ldrb.w	r1, [r3, #46]	@ 0x2e
     ea0:	b141      	cbz	r1, eb4 <sci_i2c_txi_isr+0xf0>
     ea2:	2052      	movs	r0, #82	@ 0x52
     ea4:	2101      	movs	r1, #1
     ea6:	72d0      	strb	r0, [r2, #11]
     ea8:	f883 1030 	strb.w	r1, [r3, #48]	@ 0x30
     eac:	e7bc      	b.n	e28 <sci_i2c_txi_isr+0x64>
     eae:	2352      	movs	r3, #82	@ 0x52
     eb0:	72d3      	strb	r3, [r2, #11]
     eb2:	e7b9      	b.n	e28 <sci_i2c_txi_isr+0x64>
     eb4:	2354      	movs	r3, #84	@ 0x54
     eb6:	72d3      	strb	r3, [r2, #11]
     eb8:	e7b6      	b.n	e28 <sci_i2c_txi_isr+0x64>
     eba:	f893 0031 	ldrb.w	r0, [r3, #49]	@ 0x31
     ebe:	b140      	cbz	r0, ed2 <sci_i2c_txi_isr+0x10e>
     ec0:	2901      	cmp	r1, #1
     ec2:	f883 c031 	strb.w	ip, [r3, #49]	@ 0x31
     ec6:	d017      	beq.n	ef8 <sci_i2c_txi_isr+0x134>
     ec8:	24ff      	movs	r4, #255	@ 0xff
     eca:	f882 c00a 	strb.w	ip, [r2, #10]
     ece:	70d4      	strb	r4, [r2, #3]
     ed0:	e7bc      	b.n	e4c <sci_i2c_txi_isr+0x88>
     ed2:	7950      	ldrb	r0, [r2, #5]
     ed4:	6999      	ldr	r1, [r3, #24]
     ed6:	6a5a      	ldr	r2, [r3, #36]	@ 0x24
     ed8:	5488      	strb	r0, [r1, r2]
     eda:	e9d3 1208 	ldrd	r1, r2, [r3, #32]
     ede:	3901      	subs	r1, #1
     ee0:	3201      	adds	r2, #1
     ee2:	2901      	cmp	r1, #1
     ee4:	e9c3 1208 	strd	r1, r2, [r3, #32]
     ee8:	691a      	ldr	r2, [r3, #16]
     eea:	d005      	beq.n	ef8 <sci_i2c_txi_isr+0x134>
     eec:	24ff      	movs	r4, #255	@ 0xff
     eee:	70d4      	strb	r4, [r2, #3]
     ef0:	e7ac      	b.n	e4c <sci_i2c_txi_isr+0x88>
     ef2:	2354      	movs	r3, #84	@ 0x54
     ef4:	72c3      	strb	r3, [r0, #11]
     ef6:	e797      	b.n	e28 <sci_i2c_txi_isr+0x64>
     ef8:	2320      	movs	r3, #32
     efa:	24ff      	movs	r4, #255	@ 0xff
     efc:	7293      	strb	r3, [r2, #10]
     efe:	70d4      	strb	r4, [r2, #3]
     f00:	e7a4      	b.n	e4c <sci_i2c_txi_isr+0x88>
     f02:	bf00      	nop
     f04:	40006000 	.word	0x40006000
     f08:	20000504 	.word	0x20000504

00000f0c <sci_i2c_tei_isr>:
     f0c:	b510      	push	{r4, lr}
     f0e:	f3ef 8303 	mrs	r3, PSR
     f12:	4a30      	ldr	r2, [pc, #192]	@ (fd4 <sci_i2c_tei_isr+0xc8>)
     f14:	3b10      	subs	r3, #16
     f16:	b25b      	sxtb	r3, r3
     f18:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
     f1c:	6902      	ldr	r2, [r0, #16]
     f1e:	7ad3      	ldrb	r3, [r2, #11]
     f20:	f023 0308 	bic.w	r3, r3, #8
     f24:	72d3      	strb	r3, [r2, #11]
     f26:	f890 302f 	ldrb.w	r3, [r0, #47]	@ 0x2f
     f2a:	2b00      	cmp	r3, #0
     f2c:	d13e      	bne.n	fac <sci_i2c_tei_isr+0xa0>
     f2e:	f890 102a 	ldrb.w	r1, [r0, #42]	@ 0x2a
     f32:	f003 0cff 	and.w	ip, r3, #255	@ 0xff
     f36:	f890 302c 	ldrb.w	r3, [r0, #44]	@ 0x2c
     f3a:	4299      	cmp	r1, r3
     f3c:	d11b      	bne.n	f76 <sci_i2c_tei_isr+0x6a>
     f3e:	6a03      	ldr	r3, [r0, #32]
     f40:	b953      	cbnz	r3, f58 <sci_i2c_tei_isr+0x4c>
     f42:	f890 102d 	ldrb.w	r1, [r0, #45]	@ 0x2d
     f46:	f890 4030 	ldrb.w	r4, [r0, #48]	@ 0x30
     f4a:	f1c1 0103 	rsb	r1, r1, #3
     f4e:	b2c9      	uxtb	r1, r1
     f50:	b3cc      	cbz	r4, fc6 <sci_i2c_tei_isr+0xba>
     f52:	72d3      	strb	r3, [r2, #11]
     f54:	f7ff ff1a 	bl	d8c <sci_i2c_notify>
     f58:	f3ef 8303 	mrs	r3, PSR
     f5c:	3b10      	subs	r3, #16
     f5e:	4a1e      	ldr	r2, [pc, #120]	@ (fd8 <sci_i2c_tei_isr+0xcc>)
     f60:	b25b      	sxtb	r3, r3
     f62:	33c0      	adds	r3, #192	@ 0xc0
     f64:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
     f68:	f421 3180 	bic.w	r1, r1, #65536	@ 0x10000
     f6c:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
     f70:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
     f74:	bd10      	pop	{r4, pc}
     f76:	b1fb      	cbz	r3, fb8 <sci_i2c_tei_isr+0xac>
     f78:	f890 402d 	ldrb.w	r4, [r0, #45]	@ 0x2d
     f7c:	f004 01ff 	and.w	r1, r4, #255	@ 0xff
     f80:	b134      	cbz	r4, f90 <sci_i2c_tei_isr+0x84>
     f82:	2b02      	cmp	r3, #2
     f84:	bf12      	itee	ne
     f86:	4661      	movne	r1, ip
     f88:	f890 1029 	ldrbeq.w	r1, [r0, #41]	@ 0x29
     f8c:	f041 0101 	orreq.w	r1, r1, #1
     f90:	f04f 0c00 	mov.w	ip, #0
     f94:	f882 c00b 	strb.w	ip, [r2, #11]
     f98:	70d1      	strb	r1, [r2, #3]
     f9a:	f890 202b 	ldrb.w	r2, [r0, #43]	@ 0x2b
     f9e:	3301      	adds	r3, #1
     fa0:	f880 302c 	strb.w	r3, [r0, #44]	@ 0x2c
     fa4:	1e53      	subs	r3, r2, #1
     fa6:	f880 302b 	strb.w	r3, [r0, #43]	@ 0x2b
     faa:	e7d5      	b.n	f58 <sci_i2c_tei_isr+0x4c>
     fac:	23f0      	movs	r3, #240	@ 0xf0
     fae:	2101      	movs	r1, #1
     fb0:	72d3      	strb	r3, [r2, #11]
     fb2:	f7ff feeb 	bl	d8c <sci_i2c_notify>
     fb6:	e7cf      	b.n	f58 <sci_i2c_tei_isr+0x4c>
     fb8:	2901      	cmp	r1, #1
     fba:	bf0c      	ite	eq
     fbc:	f890 1028 	ldrbeq.w	r1, [r0, #40]	@ 0x28
     fc0:	f890 1029 	ldrbne.w	r1, [r0, #41]	@ 0x29
     fc4:	e7e4      	b.n	f90 <sci_i2c_tei_isr+0x84>
     fc6:	23f0      	movs	r3, #240	@ 0xf0
     fc8:	72d3      	strb	r3, [r2, #11]
     fca:	7893      	ldrb	r3, [r2, #2]
     fcc:	f003 03cf 	and.w	r3, r3, #207	@ 0xcf
     fd0:	7093      	strb	r3, [r2, #2]
     fd2:	e7bf      	b.n	f54 <sci_i2c_tei_isr+0x48>
     fd4:	20000504 	.word	0x20000504
     fd8:	40006000 	.word	0x40006000

00000fdc <r_sci_spi_call_callback>:
     fdc:	b530      	push	{r4, r5, lr}
     fde:	6a43      	ldr	r3, [r0, #36]	@ 0x24
     fe0:	b085      	sub	sp, #20
     fe2:	4604      	mov	r4, r0
     fe4:	468c      	mov	ip, r1
     fe6:	ad01      	add	r5, sp, #4
     fe8:	b1ab      	cbz	r3, 1016 <r_sci_spi_call_callback+0x3a>
     fea:	e893 0007 	ldmia.w	r3, {r0, r1, r2}
     fee:	e885 0007 	stmia.w	r5, {r0, r1, r2}
     ff2:	6862      	ldr	r2, [r4, #4]
     ff4:	4618      	mov	r0, r3
     ff6:	7811      	ldrb	r1, [r2, #0]
     ff8:	f883 c004 	strb.w	ip, [r3, #4]
     ffc:	6aa2      	ldr	r2, [r4, #40]	@ 0x28
     ffe:	6019      	str	r1, [r3, #0]
    1000:	609a      	str	r2, [r3, #8]
    1002:	6a23      	ldr	r3, [r4, #32]
    1004:	4798      	blx	r3
    1006:	6a63      	ldr	r3, [r4, #36]	@ 0x24
    1008:	b11b      	cbz	r3, 1012 <r_sci_spi_call_callback+0x36>
    100a:	e895 0007 	ldmia.w	r5, {r0, r1, r2}
    100e:	e883 0007 	stmia.w	r3, {r0, r1, r2}
    1012:	b005      	add	sp, #20
    1014:	bd30      	pop	{r4, r5, pc}
    1016:	462b      	mov	r3, r5
    1018:	e7eb      	b.n	ff2 <r_sci_spi_call_callback+0x16>
    101a:	bf00      	nop

0000101c <sci_spi_txi_isr>:
    101c:	b410      	push	{r4}
    101e:	f3ef 8303 	mrs	r3, PSR
    1022:	3b10      	subs	r3, #16
    1024:	4a16      	ldr	r2, [pc, #88]	@ (1080 <sci_spi_txi_isr+0x64>)
    1026:	b25b      	sxtb	r3, r3
    1028:	f103 01c0 	add.w	r1, r3, #192	@ 0xc0
    102c:	f852 0021 	ldr.w	r0, [r2, r1, lsl #2]
    1030:	f420 3080 	bic.w	r0, r0, #65536	@ 0x10000
    1034:	f842 0021 	str.w	r0, [r2, r1, lsl #2]
    1038:	f852 2021 	ldr.w	r2, [r2, r1, lsl #2]
    103c:	4a11      	ldr	r2, [pc, #68]	@ (1084 <sci_spi_txi_isr+0x68>)
    103e:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
    1042:	695a      	ldr	r2, [r3, #20]
    1044:	69d9      	ldr	r1, [r3, #28]
    1046:	428a      	cmp	r2, r1
    1048:	d206      	bcs.n	1058 <sci_spi_txi_isr+0x3c>
    104a:	e9d3 4002 	ldrd	r4, r0, [r3, #8]
    104e:	b1a8      	cbz	r0, 107c <sci_spi_txi_isr+0x60>
    1050:	5c80      	ldrb	r0, [r0, r2]
    1052:	70e0      	strb	r0, [r4, #3]
    1054:	3201      	adds	r2, #1
    1056:	615a      	str	r2, [r3, #20]
    1058:	428a      	cmp	r2, r1
    105a:	d002      	beq.n	1062 <sci_spi_txi_isr+0x46>
    105c:	f85d 4b04 	ldr.w	r4, [sp], #4
    1060:	4770      	bx	lr
    1062:	691a      	ldr	r2, [r3, #16]
    1064:	2a00      	cmp	r2, #0
    1066:	d1f9      	bne.n	105c <sci_spi_txi_isr+0x40>
    1068:	689a      	ldr	r2, [r3, #8]
    106a:	f85d 4b04 	ldr.w	r4, [sp], #4
    106e:	7893      	ldrb	r3, [r2, #2]
    1070:	f003 037b 	and.w	r3, r3, #123	@ 0x7b
    1074:	f043 0304 	orr.w	r3, r3, #4
    1078:	7093      	strb	r3, [r2, #2]
    107a:	4770      	bx	lr
    107c:	70e0      	strb	r0, [r4, #3]
    107e:	e7e9      	b.n	1054 <sci_spi_txi_isr+0x38>
    1080:	40006000 	.word	0x40006000
    1084:	20000504 	.word	0x20000504

00001088 <sci_spi_rxi_isr>:
    1088:	b410      	push	{r4}
    108a:	f3ef 8303 	mrs	r3, PSR
    108e:	3b10      	subs	r3, #16
    1090:	4a19      	ldr	r2, [pc, #100]	@ (10f8 <sci_spi_rxi_isr+0x70>)
    1092:	b25b      	sxtb	r3, r3
    1094:	f103 01c0 	add.w	r1, r3, #192	@ 0xc0
    1098:	f852 0021 	ldr.w	r0, [r2, r1, lsl #2]
    109c:	f420 3080 	bic.w	r0, r0, #65536	@ 0x10000
    10a0:	f842 0021 	str.w	r0, [r2, r1, lsl #2]
    10a4:	f852 2021 	ldr.w	r2, [r2, r1, lsl #2]
    10a8:	4a14      	ldr	r2, [pc, #80]	@ (10fc <sci_spi_rxi_isr+0x74>)
    10aa:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
    10ae:	6959      	ldr	r1, [r3, #20]
    10b0:	69da      	ldr	r2, [r3, #28]
    10b2:	4291      	cmp	r1, r2
    10b4:	d206      	bcs.n	10c4 <sci_spi_rxi_isr+0x3c>
    10b6:	e9d3 4002 	ldrd	r4, r0, [r3, #8]
    10ba:	b1d0      	cbz	r0, 10f2 <sci_spi_rxi_isr+0x6a>
    10bc:	5c40      	ldrb	r0, [r0, r1]
    10be:	70e0      	strb	r0, [r4, #3]
    10c0:	3101      	adds	r1, #1
    10c2:	6159      	str	r1, [r3, #20]
    10c4:	6999      	ldr	r1, [r3, #24]
    10c6:	4291      	cmp	r1, r2
    10c8:	d207      	bcs.n	10da <sci_spi_rxi_isr+0x52>
    10ca:	6898      	ldr	r0, [r3, #8]
    10cc:	691a      	ldr	r2, [r3, #16]
    10ce:	7940      	ldrb	r0, [r0, #5]
    10d0:	1c4c      	adds	r4, r1, #1
    10d2:	619c      	str	r4, [r3, #24]
    10d4:	5450      	strb	r0, [r2, r1]
    10d6:	e9d3 1206 	ldrd	r1, r2, [r3, #24]
    10da:	4291      	cmp	r1, r2
    10dc:	d106      	bne.n	10ec <sci_spi_rxi_isr+0x64>
    10de:	689a      	ldr	r2, [r3, #8]
    10e0:	7893      	ldrb	r3, [r2, #2]
    10e2:	f003 033b 	and.w	r3, r3, #59	@ 0x3b
    10e6:	f043 0304 	orr.w	r3, r3, #4
    10ea:	7093      	strb	r3, [r2, #2]
    10ec:	f85d 4b04 	ldr.w	r4, [sp], #4
    10f0:	4770      	bx	lr
    10f2:	70e0      	strb	r0, [r4, #3]
    10f4:	e7e4      	b.n	10c0 <sci_spi_rxi_isr+0x38>
    10f6:	bf00      	nop
    10f8:	40006000 	.word	0x40006000
    10fc:	20000504 	.word	0x20000504

00001100 <sci_spi_tei_isr>:
    1100:	b510      	push	{r4, lr}
    1102:	f3ef 8303 	mrs	r3, PSR
    1106:	4a0c      	ldr	r2, [pc, #48]	@ (1138 <sci_spi_tei_isr+0x38>)
    1108:	3b10      	subs	r3, #16
    110a:	b25c      	sxtb	r4, r3
    110c:	f852 0024 	ldr.w	r0, [r2, r4, lsl #2]
    1110:	2101      	movs	r1, #1
    1112:	6882      	ldr	r2, [r0, #8]
    1114:	7893      	ldrb	r3, [r2, #2]
    1116:	f003 0303 	and.w	r3, r3, #3
    111a:	7093      	strb	r3, [r2, #2]
    111c:	f7ff ff5e 	bl	fdc <r_sci_spi_call_callback>
    1120:	4a06      	ldr	r2, [pc, #24]	@ (113c <sci_spi_tei_isr+0x3c>)
    1122:	f104 03c0 	add.w	r3, r4, #192	@ 0xc0
    1126:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
    112a:	f421 3180 	bic.w	r1, r1, #65536	@ 0x10000
    112e:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
    1132:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
    1136:	bd10      	pop	{r4, pc}
    1138:	20000504 	.word	0x20000504
    113c:	40006000 	.word	0x40006000

00001140 <sci_spi_eri_isr>:
    1140:	b510      	push	{r4, lr}
    1142:	f3ef 8303 	mrs	r3, PSR
    1146:	f04f 0c84 	mov.w	ip, #132	@ 0x84
    114a:	4a0e      	ldr	r2, [pc, #56]	@ (1184 <sci_spi_eri_isr+0x44>)
    114c:	3b10      	subs	r3, #16
    114e:	b25c      	sxtb	r4, r3
    1150:	f852 0024 	ldr.w	r0, [r2, r4, lsl #2]
    1154:	2104      	movs	r1, #4
    1156:	6883      	ldr	r3, [r0, #8]
    1158:	789a      	ldrb	r2, [r3, #2]
    115a:	f002 0203 	and.w	r2, r2, #3
    115e:	709a      	strb	r2, [r3, #2]
    1160:	791a      	ldrb	r2, [r3, #4]
    1162:	f883 c004 	strb.w	ip, [r3, #4]
    1166:	f7ff ff39 	bl	fdc <r_sci_spi_call_callback>
    116a:	4a07      	ldr	r2, [pc, #28]	@ (1188 <sci_spi_eri_isr+0x48>)
    116c:	f104 03c0 	add.w	r3, r4, #192	@ 0xc0
    1170:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
    1174:	f421 3180 	bic.w	r1, r1, #65536	@ 0x10000
    1178:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
    117c:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
    1180:	bd10      	pop	{r4, pc}
    1182:	bf00      	nop
    1184:	20000504 	.word	0x20000504
    1188:	40006000 	.word	0x40006000

0000118c <R_SCI_UART_Close>:
    118c:	4603      	mov	r3, r0
    118e:	2000      	movs	r0, #0
    1190:	2101      	movs	r1, #1
    1192:	b410      	push	{r4}
    1194:	6a1a      	ldr	r2, [r3, #32]
    1196:	6058      	str	r0, [r3, #4]
    1198:	7090      	strb	r0, [r2, #2]
    119a:	69da      	ldr	r2, [r3, #28]
    119c:	4c2c      	ldr	r4, [pc, #176]	@ (1250 <R_SCI_UART_Close+0xc4>)
    119e:	f992 2005 	ldrsb.w	r2, [r2, #5]
    11a2:	ea4f 1c52 	mov.w	ip, r2, lsr #5
    11a6:	f002 021f 	and.w	r2, r2, #31
    11aa:	fa01 f202 	lsl.w	r2, r1, r2
    11ae:	f10c 0c20 	add.w	ip, ip, #32
    11b2:	f844 202c 	str.w	r2, [r4, ip, lsl #2]
    11b6:	f3bf 8f4f 	dsb	sy
    11ba:	f3bf 8f6f 	isb	sy
    11be:	69da      	ldr	r2, [r3, #28]
    11c0:	f992 200b 	ldrsb.w	r2, [r2, #11]
    11c4:	ea4f 1c52 	mov.w	ip, r2, lsr #5
    11c8:	f002 021f 	and.w	r2, r2, #31
    11cc:	fa01 f202 	lsl.w	r2, r1, r2
    11d0:	f10c 0c20 	add.w	ip, ip, #32
    11d4:	f844 202c 	str.w	r2, [r4, ip, lsl #2]
    11d8:	f3bf 8f4f 	dsb	sy
    11dc:	f3bf 8f6f 	isb	sy
    11e0:	69da      	ldr	r2, [r3, #28]
    11e2:	f992 2007 	ldrsb.w	r2, [r2, #7]
    11e6:	ea4f 1c52 	mov.w	ip, r2, lsr #5
    11ea:	f002 021f 	and.w	r2, r2, #31
    11ee:	fa01 f202 	lsl.w	r2, r1, r2
    11f2:	f10c 0c20 	add.w	ip, ip, #32
    11f6:	f844 202c 	str.w	r2, [r4, ip, lsl #2]
    11fa:	f3bf 8f4f 	dsb	sy
    11fe:	f3bf 8f6f 	isb	sy
    1202:	69da      	ldr	r2, [r3, #28]
    1204:	f992 2009 	ldrsb.w	r2, [r2, #9]
    1208:	ea4f 1c52 	mov.w	ip, r2, lsr #5
    120c:	f002 021f 	and.w	r2, r2, #31
    1210:	fa01 f202 	lsl.w	r2, r1, r2
    1214:	f10c 0c20 	add.w	ip, ip, #32
    1218:	f844 202c 	str.w	r2, [r4, ip, lsl #2]
    121c:	f3bf 8f4f 	dsb	sy
    1220:	f3bf 8f6f 	isb	sy
    1224:	f3ef 8410 	mrs	r4, PRIMASK
    1228:	f381 8810 	msr	PRIMASK, r1
    122c:	69db      	ldr	r3, [r3, #28]
    122e:	4a09      	ldr	r2, [pc, #36]	@ (1254 <R_SCI_UART_Close+0xc8>)
    1230:	f893 c000 	ldrb.w	ip, [r3]
    1234:	f04f 4300 	mov.w	r3, #2147483648	@ 0x80000000
    1238:	6851      	ldr	r1, [r2, #4]
    123a:	fa23 f30c 	lsr.w	r3, r3, ip
    123e:	430b      	orrs	r3, r1
    1240:	6053      	str	r3, [r2, #4]
    1242:	6853      	ldr	r3, [r2, #4]
    1244:	f384 8810 	msr	PRIMASK, r4
    1248:	f85d 4b04 	ldr.w	r4, [sp], #4
    124c:	4770      	bx	lr
    124e:	bf00      	nop
    1250:	e000e100 	.word	0xe000e100
    1254:	40084000 	.word	0x40084000

00001258 <R_SCI_UART_Read>:
    1258:	4603      	mov	r3, r0
    125a:	2000      	movs	r0, #0
    125c:	e9c3 1205 	strd	r1, r2, [r3, #20]
    1260:	4770      	bx	lr
    1262:	bf00      	nop

00001264 <R_SCI_UART_Write>:
    1264:	b410      	push	{r4}
    1266:	6a04      	ldr	r4, [r0, #32]
    1268:	78a3      	ldrb	r3, [r4, #2]
    126a:	f003 037b 	and.w	r3, r3, #123	@ 0x7b
    126e:	70a3      	strb	r3, [r4, #2]
    1270:	7883      	ldrb	r3, [r0, #2]
    1272:	f003 0303 	and.w	r3, r3, #3
    1276:	1ad2      	subs	r2, r2, r3
    1278:	440b      	add	r3, r1
    127a:	6102      	str	r2, [r0, #16]
    127c:	78a2      	ldrb	r2, [r4, #2]
    127e:	60c3      	str	r3, [r0, #12]
    1280:	7883      	ldrb	r3, [r0, #2]
    1282:	f042 0280 	orr.w	r2, r2, #128	@ 0x80
    1286:	f003 0303 	and.w	r3, r3, #3
    128a:	2b02      	cmp	r3, #2
    128c:	70a2      	strb	r2, [r4, #2]
    128e:	d005      	beq.n	129c <R_SCI_UART_Write+0x38>
    1290:	780b      	ldrb	r3, [r1, #0]
    1292:	2000      	movs	r0, #0
    1294:	70e3      	strb	r3, [r4, #3]
    1296:	f85d 4b04 	ldr.w	r4, [sp], #4
    129a:	4770      	bx	lr
    129c:	880b      	ldrh	r3, [r1, #0]
    129e:	2000      	movs	r0, #0
    12a0:	f443 437e 	orr.w	r3, r3, #65024	@ 0xfe00
    12a4:	81e3      	strh	r3, [r4, #14]
    12a6:	f85d 4b04 	ldr.w	r4, [sp], #4
    12aa:	4770      	bx	lr

000012ac <R_SCI_UART_CallbackSet>:
    12ac:	4684      	mov	ip, r0
    12ae:	2000      	movs	r0, #0
    12b0:	e9cc 320a 	strd	r3, r2, [ip, #40]	@ 0x28
    12b4:	f8cc 1024 	str.w	r1, [ip, #36]	@ 0x24
    12b8:	4770      	bx	lr
    12ba:	bf00      	nop

000012bc <R_SCI_UART_BaudSet>:
    12bc:	2301      	movs	r3, #1
    12be:	b510      	push	{r4, lr}
    12c0:	69c4      	ldr	r4, [r0, #28]
    12c2:	780a      	ldrb	r2, [r1, #0]
    12c4:	f894 c000 	ldrb.w	ip, [r4]
    12c8:	fa03 f30c 	lsl.w	r3, r3, ip
    12cc:	f013 0f06 	tst.w	r3, #6
    12d0:	d001      	beq.n	12d6 <R_SCI_UART_BaudSet+0x1a>
    12d2:	0713      	lsls	r3, r2, #28
    12d4:	d41e      	bmi.n	1314 <R_SCI_UART_BaudSet+0x58>
    12d6:	f002 0e5c 	and.w	lr, r2, #92	@ 0x5c
    12da:	2200      	movs	r2, #0
    12dc:	6a03      	ldr	r3, [r0, #32]
    12de:	f893 c002 	ldrb.w	ip, [r3, #2]
    12e2:	f00c 040b 	and.w	r4, ip, #11
    12e6:	709c      	strb	r4, [r3, #2]
    12e8:	60c2      	str	r2, [r0, #12]
    12ea:	4610      	mov	r0, r2
    12ec:	788a      	ldrb	r2, [r1, #2]
    12ee:	784c      	ldrb	r4, [r1, #1]
    12f0:	705a      	strb	r2, [r3, #1]
    12f2:	781a      	ldrb	r2, [r3, #0]
    12f4:	f00c 0c7b 	and.w	ip, ip, #123	@ 0x7b
    12f8:	f364 0201 	bfi	r2, r4, #0, #2
    12fc:	701a      	strb	r2, [r3, #0]
    12fe:	78ca      	ldrb	r2, [r1, #3]
    1300:	749a      	strb	r2, [r3, #18]
    1302:	79da      	ldrb	r2, [r3, #7]
    1304:	f002 02a3 	and.w	r2, r2, #163	@ 0xa3
    1308:	ea42 020e 	orr.w	r2, r2, lr
    130c:	71da      	strb	r2, [r3, #7]
    130e:	f883 c002 	strb.w	ip, [r3, #2]
    1312:	bd10      	pop	{r4, pc}
    1314:	2003      	movs	r0, #3
    1316:	bd10      	pop	{r4, pc}

00001318 <R_SCI_UART_InfoGet>:
    1318:	f04f 33ff 	mov.w	r3, #4294967295	@ 0xffffffff
    131c:	2000      	movs	r0, #0
    131e:	e9c1 3300 	strd	r3, r3, [r1]
    1322:	4770      	bx	lr

00001324 <R_SCI_UART_Abort>:
    1324:	4603      	mov	r3, r0
    1326:	0788      	lsls	r0, r1, #30
    1328:	d510      	bpl.n	134c <R_SCI_UART_Abort+0x28>
    132a:	b410      	push	{r4}
    132c:	2400      	movs	r4, #0
    132e:	6a18      	ldr	r0, [r3, #32]
    1330:	07c9      	lsls	r1, r1, #31
    1332:	7882      	ldrb	r2, [r0, #2]
    1334:	f002 027b 	and.w	r2, r2, #123	@ 0x7b
    1338:	7082      	strb	r2, [r0, #2]
    133a:	4620      	mov	r0, r4
    133c:	611c      	str	r4, [r3, #16]
    133e:	d502      	bpl.n	1346 <R_SCI_UART_Abort+0x22>
    1340:	2200      	movs	r2, #0
    1342:	4610      	mov	r0, r2
    1344:	619a      	str	r2, [r3, #24]
    1346:	f85d 4b04 	ldr.w	r4, [sp], #4
    134a:	4770      	bx	lr
    134c:	07ca      	lsls	r2, r1, #31
    134e:	bf48      	it	mi
    1350:	2200      	movmi	r2, #0
    1352:	f04f 0006 	mov.w	r0, #6
    1356:	bf44      	itt	mi
    1358:	619a      	strmi	r2, [r3, #24]
    135a:	4610      	movmi	r0, r2
    135c:	4770      	bx	lr
    135e:	bf00      	nop

00001360 <R_SCI_UART_ReadStop>:
    1360:	4603      	mov	r3, r0
    1362:	2200      	movs	r2, #0
    1364:	b410      	push	{r4}
    1366:	699c      	ldr	r4, [r3, #24]
    1368:	4610      	mov	r0, r2
    136a:	600c      	str	r4, [r1, #0]
    136c:	f85d 4b04 	ldr.w	r4, [sp], #4
    1370:	619a      	str	r2, [r3, #24]
    1372:	4770      	bx	lr

00001374 <R_SCI_UART_ReceiveSuspend>:
    1374:	2006      	movs	r0, #6
    1376:	4770      	bx	lr

00001378 <r_sci_uart_call_callback>:
    1378:	b5f0      	push	{r4, r5, r6, r7, lr}
    137a:	6a84      	ldr	r4, [r0, #40]	@ 0x28
    137c:	b085      	sub	sp, #20
    137e:	4605      	mov	r5, r0
    1380:	460f      	mov	r7, r1
    1382:	4694      	mov	ip, r2
    1384:	466e      	mov	r6, sp
    1386:	b1b4      	cbz	r4, 13b6 <r_sci_uart_call_callback+0x3e>
    1388:	e894 000f 	ldmia.w	r4, {r0, r1, r2, r3}
    138c:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
    1390:	69eb      	ldr	r3, [r5, #28]
    1392:	4620      	mov	r0, r4
    1394:	781b      	ldrb	r3, [r3, #0]
    1396:	f884 c004 	strb.w	ip, [r4, #4]
    139a:	6023      	str	r3, [r4, #0]
    139c:	6aeb      	ldr	r3, [r5, #44]	@ 0x2c
    139e:	e9c4 7302 	strd	r7, r3, [r4, #8]
    13a2:	6a6b      	ldr	r3, [r5, #36]	@ 0x24
    13a4:	4798      	blx	r3
    13a6:	6aac      	ldr	r4, [r5, #40]	@ 0x28
    13a8:	b11c      	cbz	r4, 13b2 <r_sci_uart_call_callback+0x3a>
    13aa:	e896 000f 	ldmia.w	r6, {r0, r1, r2, r3}
    13ae:	e884 000f 	stmia.w	r4, {r0, r1, r2, r3}
    13b2:	b005      	add	sp, #20
    13b4:	bdf0      	pop	{r4, r5, r6, r7, pc}
    13b6:	466c      	mov	r4, sp
    13b8:	e7ea      	b.n	1390 <r_sci_uart_call_callback+0x18>
    13ba:	bf00      	nop

000013bc <R_SCI_UART_ReceiveResume>:
    13bc:	2006      	movs	r0, #6
    13be:	4770      	bx	lr

000013c0 <R_SCI_UART_Open>:
    13c0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    13c4:	2401      	movs	r4, #1
    13c6:	780a      	ldrb	r2, [r1, #0]
    13c8:	4603      	mov	r3, r0
    13ca:	4094      	lsls	r4, r2
    13cc:	f014 0f06 	tst.w	r4, #6
    13d0:	d005      	beq.n	13de <R_SCI_UART_Open+0x1e>
    13d2:	69c8      	ldr	r0, [r1, #28]
    13d4:	6840      	ldr	r0, [r0, #4]
    13d6:	7800      	ldrb	r0, [r0, #0]
    13d8:	0700      	lsls	r0, r0, #28
    13da:	f100 81b0 	bmi.w	173e <R_SCI_UART_Open+0x37e>
    13de:	2000      	movs	r0, #0
    13e0:	f502 0280 	add.w	r2, r2, #4194304	@ 0x400000
    13e4:	f502 528c 	add.w	r2, r2, #4480	@ 0x1180
    13e8:	7018      	strb	r0, [r3, #0]
    13ea:	0212      	lsls	r2, r2, #8
    13ec:	e9c3 1207 	strd	r1, r2, [r3, #28]
    13f0:	694a      	ldr	r2, [r1, #20]
    13f2:	2501      	movs	r5, #1
    13f4:	625a      	str	r2, [r3, #36]	@ 0x24
    13f6:	698a      	ldr	r2, [r1, #24]
    13f8:	789e      	ldrb	r6, [r3, #2]
    13fa:	e9c3 020a 	strd	r0, r2, [r3, #40]	@ 0x28
    13fe:	784a      	ldrb	r2, [r1, #1]
    1400:	4cd0      	ldr	r4, [pc, #832]	@ (1744 <R_SCI_UART_Open+0x384>)
    1402:	fab2 f282 	clz	r2, r2
    1406:	0952      	lsrs	r2, r2, #5
    1408:	4252      	negs	r2, r2
    140a:	f002 0203 	and.w	r2, r2, #3
    140e:	406a      	eors	r2, r5
    1410:	f362 0601 	bfi	r6, r2, #0, #2
    1414:	709e      	strb	r6, [r3, #2]
    1416:	f991 600b 	ldrsb.w	r6, [r1, #11]
    141a:	f891 c00a 	ldrb.w	ip, [r1, #10]
    141e:	0972      	lsrs	r2, r6, #5
    1420:	f006 071f 	and.w	r7, r6, #31
    1424:	3220      	adds	r2, #32
    1426:	fa05 f707 	lsl.w	r7, r5, r7
    142a:	f844 7022 	str.w	r7, [r4, r2, lsl #2]
    142e:	f3bf 8f4f 	dsb	sy
    1432:	f3bf 8f6f 	isb	sy
    1436:	4ac4      	ldr	r2, [pc, #784]	@ (1748 <R_SCI_UART_Open+0x388>)
    1438:	f106 07c0 	add.w	r7, r6, #192	@ 0xc0
    143c:	f852 e027 	ldr.w	lr, [r2, r7, lsl #2]
    1440:	f360 4e10 	bfi	lr, r0, #16, #1
    1444:	f842 e027 	str.w	lr, [r2, r7, lsl #2]
    1448:	f852 7027 	ldr.w	r7, [r2, r7, lsl #2]
    144c:	4fbf      	ldr	r7, [pc, #764]	@ (174c <R_SCI_UART_Open+0x38c>)
    144e:	ea4f 1c0c 	mov.w	ip, ip, lsl #4
    1452:	eb04 0e06 	add.w	lr, r4, r6
    1456:	fa5f fc8c 	uxtb.w	ip, ip
    145a:	f88e c300 	strb.w	ip, [lr, #768]	@ 0x300
    145e:	f847 3026 	str.w	r3, [r7, r6, lsl #2]
    1462:	f991 6005 	ldrsb.w	r6, [r1, #5]
    1466:	f891 c004 	ldrb.w	ip, [r1, #4]
    146a:	ea4f 1e56 	mov.w	lr, r6, lsr #5
    146e:	f006 081f 	and.w	r8, r6, #31
    1472:	f10e 0e20 	add.w	lr, lr, #32
    1476:	fa05 f808 	lsl.w	r8, r5, r8
    147a:	f844 802e 	str.w	r8, [r4, lr, lsl #2]
    147e:	f3bf 8f4f 	dsb	sy
    1482:	f3bf 8f6f 	isb	sy
    1486:	f106 0ec0 	add.w	lr, r6, #192	@ 0xc0
    148a:	f852 802e 	ldr.w	r8, [r2, lr, lsl #2]
    148e:	f360 4810 	bfi	r8, r0, #16, #1
    1492:	f842 802e 	str.w	r8, [r2, lr, lsl #2]
    1496:	f852 e02e 	ldr.w	lr, [r2, lr, lsl #2]
    149a:	ea4f 1c0c 	mov.w	ip, ip, lsl #4
    149e:	eb04 0e06 	add.w	lr, r4, r6
    14a2:	fa5f fc8c 	uxtb.w	ip, ip
    14a6:	f88e c300 	strb.w	ip, [lr, #768]	@ 0x300
    14aa:	f847 3026 	str.w	r3, [r7, r6, lsl #2]
    14ae:	f991 6007 	ldrsb.w	r6, [r1, #7]
    14b2:	f891 c006 	ldrb.w	ip, [r1, #6]
    14b6:	ea4f 1e56 	mov.w	lr, r6, lsr #5
    14ba:	f006 081f 	and.w	r8, r6, #31
    14be:	f10e 0e20 	add.w	lr, lr, #32
    14c2:	fa05 f808 	lsl.w	r8, r5, r8
    14c6:	f844 802e 	str.w	r8, [r4, lr, lsl #2]
    14ca:	f3bf 8f4f 	dsb	sy
    14ce:	f3bf 8f6f 	isb	sy
    14d2:	f106 0ec0 	add.w	lr, r6, #192	@ 0xc0
    14d6:	f852 802e 	ldr.w	r8, [r2, lr, lsl #2]
    14da:	f360 4810 	bfi	r8, r0, #16, #1
    14de:	f842 802e 	str.w	r8, [r2, lr, lsl #2]
    14e2:	f852 e02e 	ldr.w	lr, [r2, lr, lsl #2]
    14e6:	ea4f 1c0c 	mov.w	ip, ip, lsl #4
    14ea:	eb04 0e06 	add.w	lr, r4, r6
    14ee:	fa5f fc8c 	uxtb.w	ip, ip
    14f2:	f88e c300 	strb.w	ip, [lr, #768]	@ 0x300
    14f6:	f847 3026 	str.w	r3, [r7, r6, lsl #2]
    14fa:	f991 6009 	ldrsb.w	r6, [r1, #9]
    14fe:	f891 c008 	ldrb.w	ip, [r1, #8]
    1502:	ea4f 1e56 	mov.w	lr, r6, lsr #5
    1506:	f006 081f 	and.w	r8, r6, #31
    150a:	f10e 0e20 	add.w	lr, lr, #32
    150e:	fa05 f808 	lsl.w	r8, r5, r8
    1512:	f844 802e 	str.w	r8, [r4, lr, lsl #2]
    1516:	f3bf 8f4f 	dsb	sy
    151a:	f3bf 8f6f 	isb	sy
    151e:	f106 0ec0 	add.w	lr, r6, #192	@ 0xc0
    1522:	f852 802e 	ldr.w	r8, [r2, lr, lsl #2]
    1526:	f360 4810 	bfi	r8, r0, #16, #1
    152a:	f842 802e 	str.w	r8, [r2, lr, lsl #2]
    152e:	f852 202e 	ldr.w	r2, [r2, lr, lsl #2]
    1532:	ea4f 120c 	mov.w	r2, ip, lsl #4
    1536:	b2d2      	uxtb	r2, r2
    1538:	4434      	add	r4, r6
    153a:	f884 2300 	strb.w	r2, [r4, #768]	@ 0x300
    153e:	f847 3026 	str.w	r3, [r7, r6, lsl #2]
    1542:	f3ef 8710 	mrs	r7, PRIMASK
    1546:	f385 8810 	msr	PRIMASK, r5
    154a:	f04f 4600 	mov.w	r6, #2147483648	@ 0x80000000
    154e:	780c      	ldrb	r4, [r1, #0]
    1550:	4a7f      	ldr	r2, [pc, #508]	@ (1750 <R_SCI_UART_Open+0x390>)
    1552:	40e6      	lsrs	r6, r4
    1554:	6854      	ldr	r4, [r2, #4]
    1556:	ea24 0406 	bic.w	r4, r4, r6
    155a:	6054      	str	r4, [r2, #4]
    155c:	6852      	ldr	r2, [r2, #4]
    155e:	f387 8810 	msr	PRIMASK, r7
    1562:	6a1a      	ldr	r2, [r3, #32]
    1564:	f240 37f9 	movw	r7, #1017	@ 0x3f9
    1568:	7090      	strb	r0, [r2, #2]
    156a:	7110      	strb	r0, [r2, #4]
    156c:	7250      	strb	r0, [r2, #9]
    156e:	7290      	strb	r0, [r2, #10]
    1570:	72d0      	strb	r0, [r2, #11]
    1572:	8350      	strh	r0, [r2, #26]
    1574:	7808      	ldrb	r0, [r1, #0]
    1576:	69cc      	ldr	r4, [r1, #28]
    1578:	4085      	lsls	r5, r0
    157a:	f240 30f9 	movw	r0, #1017	@ 0x3f9
    157e:	4205      	tst	r5, r0
    1580:	bf18      	it	ne
    1582:	2040      	movne	r0, #64	@ 0x40
    1584:	f04f 0506 	mov.w	r5, #6
    1588:	bf18      	it	ne
    158a:	74d0      	strbne	r0, [r2, #19]
    158c:	2001      	movs	r0, #1
    158e:	7715      	strb	r5, [r2, #28]
    1590:	780d      	ldrb	r5, [r1, #0]
    1592:	788e      	ldrb	r6, [r1, #2]
    1594:	40a8      	lsls	r0, r5
    1596:	4238      	tst	r0, r7
    1598:	bf18      	it	ne
    159a:	f44f 4078 	movne.w	r0, #63488	@ 0xf800
    159e:	784d      	ldrb	r5, [r1, #1]
    15a0:	78c9      	ldrb	r1, [r1, #3]
    15a2:	bf18      	it	ne
    15a4:	8290      	strhne	r0, [r2, #20]
    15a6:	00c9      	lsls	r1, r1, #3
    15a8:	2d03      	cmp	r5, #3
    15aa:	ea41 1106 	orr.w	r1, r1, r6, lsl #4
    15ae:	f000 80c2 	beq.w	1736 <R_SCI_UART_Open+0x376>
    15b2:	2d00      	cmp	r5, #0
    15b4:	bf0c      	ite	eq
    15b6:	20e2      	moveq	r0, #226	@ 0xe2
    15b8:	20f2      	movne	r0, #242	@ 0xf2
    15ba:	b2c9      	uxtb	r1, r1
    15bc:	7011      	strb	r1, [r2, #0]
    15be:	7190      	strb	r0, [r2, #6]
    15c0:	7b21      	ldrb	r1, [r4, #12]
    15c2:	2908      	cmp	r1, #8
    15c4:	bf0e      	itee	eq
    15c6:	210a      	moveq	r1, #10
    15c8:	0049      	lslne	r1, r1, #1
    15ca:	f001 0102 	andne.w	r1, r1, #2
    15ce:	7351      	strb	r1, [r2, #13]
    15d0:	7861      	ldrb	r1, [r4, #1]
    15d2:	78a0      	ldrb	r0, [r4, #2]
    15d4:	01c9      	lsls	r1, r1, #7
    15d6:	0140      	lsls	r0, r0, #5
    15d8:	f000 0020 	and.w	r0, r0, #32
    15dc:	b2c9      	uxtb	r1, r1
    15de:	4301      	orrs	r1, r0
    15e0:	2000      	movs	r0, #0
    15e2:	7210      	strb	r0, [r2, #8]
    15e4:	f894 c000 	ldrb.w	ip, [r4]
    15e8:	f1ac 0002 	sub.w	r0, ip, #2
    15ec:	2801      	cmp	r0, #1
    15ee:	f240 8098 	bls.w	1722 <R_SCI_UART_Open+0x362>
    15f2:	b2c9      	uxtb	r1, r1
    15f4:	71d1      	strb	r1, [r2, #7]
    15f6:	6861      	ldr	r1, [r4, #4]
    15f8:	7888      	ldrb	r0, [r1, #2]
    15fa:	784d      	ldrb	r5, [r1, #1]
    15fc:	7050      	strb	r0, [r2, #1]
    15fe:	7810      	ldrb	r0, [r2, #0]
    1600:	f365 0001 	bfi	r0, r5, #0, #2
    1604:	7010      	strb	r0, [r2, #0]
    1606:	78c8      	ldrb	r0, [r1, #3]
    1608:	7809      	ldrb	r1, [r1, #0]
    160a:	7490      	strb	r0, [r2, #18]
    160c:	79d0      	ldrb	r0, [r2, #7]
    160e:	f001 015c 	and.w	r1, r1, #92	@ 0x5c
    1612:	f000 00a3 	and.w	r0, r0, #163	@ 0xa3
    1616:	4301      	orrs	r1, r0
    1618:	71d1      	strb	r1, [r2, #7]
    161a:	2000      	movs	r0, #0
    161c:	69d9      	ldr	r1, [r3, #28]
    161e:	6118      	str	r0, [r3, #16]
    1620:	6198      	str	r0, [r3, #24]
    1622:	60d8      	str	r0, [r3, #12]
    1624:	6158      	str	r0, [r3, #20]
    1626:	f991 5005 	ldrsb.w	r5, [r1, #5]
    162a:	4a47      	ldr	r2, [pc, #284]	@ (1748 <R_SCI_UART_Open+0x388>)
    162c:	f105 01c0 	add.w	r1, r5, #192	@ 0xc0
    1630:	f852 6021 	ldr.w	r6, [r2, r1, lsl #2]
    1634:	f360 4610 	bfi	r6, r0, #16, #1
    1638:	f842 6021 	str.w	r6, [r2, r1, lsl #2]
    163c:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
    1640:	f3bf 8f5f 	dmb	sy
    1644:	2601      	movs	r6, #1
    1646:	0969      	lsrs	r1, r5, #5
    1648:	0089      	lsls	r1, r1, #2
    164a:	f005 051f 	and.w	r5, r5, #31
    164e:	f101 4160 	add.w	r1, r1, #3758096384	@ 0xe0000000
    1652:	f501 4161 	add.w	r1, r1, #57600	@ 0xe100
    1656:	fa06 f505 	lsl.w	r5, r6, r5
    165a:	f8c1 5180 	str.w	r5, [r1, #384]	@ 0x180
    165e:	600d      	str	r5, [r1, #0]
    1660:	69d9      	ldr	r1, [r3, #28]
    1662:	f991 500b 	ldrsb.w	r5, [r1, #11]
    1666:	f105 01c0 	add.w	r1, r5, #192	@ 0xc0
    166a:	f852 7021 	ldr.w	r7, [r2, r1, lsl #2]
    166e:	f360 4710 	bfi	r7, r0, #16, #1
    1672:	f842 7021 	str.w	r7, [r2, r1, lsl #2]
    1676:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
    167a:	f3bf 8f5f 	dmb	sy
    167e:	0969      	lsrs	r1, r5, #5
    1680:	0089      	lsls	r1, r1, #2
    1682:	f005 051f 	and.w	r5, r5, #31
    1686:	f101 4160 	add.w	r1, r1, #3758096384	@ 0xe0000000
    168a:	fa06 f505 	lsl.w	r5, r6, r5
    168e:	f501 4161 	add.w	r1, r1, #57600	@ 0xe100
    1692:	f8c1 5180 	str.w	r5, [r1, #384]	@ 0x180
    1696:	600d      	str	r5, [r1, #0]
    1698:	69d9      	ldr	r1, [r3, #28]
    169a:	f991 e007 	ldrsb.w	lr, [r1, #7]
    169e:	f10e 01c0 	add.w	r1, lr, #192	@ 0xc0
    16a2:	f852 5021 	ldr.w	r5, [r2, r1, lsl #2]
    16a6:	f360 4510 	bfi	r5, r0, #16, #1
    16aa:	f842 5021 	str.w	r5, [r2, r1, lsl #2]
    16ae:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
    16b2:	f3bf 8f5f 	dmb	sy
    16b6:	ea4f 115e 	mov.w	r1, lr, lsr #5
    16ba:	0089      	lsls	r1, r1, #2
    16bc:	f00e 0e1f 	and.w	lr, lr, #31
    16c0:	f101 4160 	add.w	r1, r1, #3758096384	@ 0xe0000000
    16c4:	fa06 f50e 	lsl.w	r5, r6, lr
    16c8:	f501 4161 	add.w	r1, r1, #57600	@ 0xe100
    16cc:	f8c1 5180 	str.w	r5, [r1, #384]	@ 0x180
    16d0:	600d      	str	r5, [r1, #0]
    16d2:	69d9      	ldr	r1, [r3, #28]
    16d4:	f991 1009 	ldrsb.w	r1, [r1, #9]
    16d8:	f101 05c0 	add.w	r5, r1, #192	@ 0xc0
    16dc:	f852 7025 	ldr.w	r7, [r2, r5, lsl #2]
    16e0:	f360 4710 	bfi	r7, r0, #16, #1
    16e4:	f842 7025 	str.w	r7, [r2, r5, lsl #2]
    16e8:	f852 2025 	ldr.w	r2, [r2, r5, lsl #2]
    16ec:	f3bf 8f5f 	dmb	sy
    16f0:	094a      	lsrs	r2, r1, #5
    16f2:	0092      	lsls	r2, r2, #2
    16f4:	f001 011f 	and.w	r1, r1, #31
    16f8:	f102 4260 	add.w	r2, r2, #3758096384	@ 0xe0000000
    16fc:	408e      	lsls	r6, r1
    16fe:	f502 4261 	add.w	r2, r2, #57600	@ 0xe100
    1702:	f8c2 6180 	str.w	r6, [r2, #384]	@ 0x180
    1706:	6016      	str	r6, [r2, #0]
    1708:	6a1a      	ldr	r2, [r3, #32]
    170a:	f00c 0c03 	and.w	ip, ip, #3
    170e:	f04c 0c70 	orr.w	ip, ip, #112	@ 0x70
    1712:	8961      	ldrh	r1, [r4, #10]
    1714:	f882 c002 	strb.w	ip, [r2, #2]
    1718:	4a0e      	ldr	r2, [pc, #56]	@ (1754 <R_SCI_UART_Open+0x394>)
    171a:	8119      	strh	r1, [r3, #8]
    171c:	605a      	str	r2, [r3, #4]
    171e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    1722:	20ff      	movs	r0, #255	@ 0xff
    1724:	f1bc 0f02 	cmp.w	ip, #2
    1728:	bf08      	it	eq
    172a:	f041 0110 	orreq.w	r1, r1, #16
    172e:	b2c9      	uxtb	r1, r1
    1730:	7050      	strb	r0, [r2, #1]
    1732:	71d1      	strb	r1, [r2, #7]
    1734:	e771      	b.n	161a <R_SCI_UART_Open+0x25a>
    1736:	20f2      	movs	r0, #242	@ 0xf2
    1738:	f041 0140 	orr.w	r1, r1, #64	@ 0x40
    173c:	e73d      	b.n	15ba <R_SCI_UART_Open+0x1fa>
    173e:	2003      	movs	r0, #3
    1740:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    1744:	e000e100 	.word	0xe000e100
    1748:	40006000 	.word	0x40006000
    174c:	20000504 	.word	0x20000504
    1750:	40084000 	.word	0x40084000
    1754:	53434955 	.word	0x53434955

00001758 <sci_uart_txi_isr>:
    1758:	b410      	push	{r4}
    175a:	f3ef 8303 	mrs	r3, PSR
    175e:	3b10      	subs	r3, #16
    1760:	4a21      	ldr	r2, [pc, #132]	@ (17e8 <sci_uart_txi_isr+0x90>)
    1762:	b25b      	sxtb	r3, r3
    1764:	f103 01c0 	add.w	r1, r3, #192	@ 0xc0
    1768:	f852 0021 	ldr.w	r0, [r2, r1, lsl #2]
    176c:	f420 3080 	bic.w	r0, r0, #65536	@ 0x10000
    1770:	f842 0021 	str.w	r0, [r2, r1, lsl #2]
    1774:	f852 2021 	ldr.w	r2, [r2, r1, lsl #2]
    1778:	4a1c      	ldr	r2, [pc, #112]	@ (17ec <sci_uart_txi_isr+0x94>)
    177a:	f852 0023 	ldr.w	r0, [r2, r3, lsl #2]
    177e:	69c2      	ldr	r2, [r0, #28]
    1780:	6903      	ldr	r3, [r0, #16]
    1782:	6912      	ldr	r2, [r2, #16]
    1784:	b11a      	cbz	r2, 178e <sci_uart_txi_isr+0x36>
    1786:	b11b      	cbz	r3, 1790 <sci_uart_txi_isr+0x38>
    1788:	f85d 4b04 	ldr.w	r4, [sp], #4
    178c:	4770      	bx	lr
    178e:	b983      	cbnz	r3, 17b2 <sci_uart_txi_isr+0x5a>
    1790:	e9d0 2408 	ldrd	r2, r4, [r0, #32]
    1794:	2100      	movs	r1, #0
    1796:	7893      	ldrb	r3, [r2, #2]
    1798:	f003 037f 	and.w	r3, r3, #127	@ 0x7f
    179c:	f043 0304 	orr.w	r3, r3, #4
    17a0:	7093      	strb	r3, [r2, #2]
    17a2:	60c1      	str	r1, [r0, #12]
    17a4:	2c00      	cmp	r4, #0
    17a6:	d0ef      	beq.n	1788 <sci_uart_txi_isr+0x30>
    17a8:	2280      	movs	r2, #128	@ 0x80
    17aa:	f85d 4b04 	ldr.w	r4, [sp], #4
    17ae:	f7ff bde3 	b.w	1378 <r_sci_uart_call_callback>
    17b2:	7882      	ldrb	r2, [r0, #2]
    17b4:	6a04      	ldr	r4, [r0, #32]
    17b6:	f002 0c03 	and.w	ip, r2, #3
    17ba:	f1bc 0f02 	cmp.w	ip, #2
    17be:	68c1      	ldr	r1, [r0, #12]
    17c0:	d00a      	beq.n	17d8 <sci_uart_txi_isr+0x80>
    17c2:	f891 c000 	ldrb.w	ip, [r1]
    17c6:	f884 c003 	strb.w	ip, [r4, #3]
    17ca:	f002 0203 	and.w	r2, r2, #3
    17ce:	1a9b      	subs	r3, r3, r2
    17d0:	4411      	add	r1, r2
    17d2:	e9c0 1303 	strd	r1, r3, [r0, #12]
    17d6:	e7d6      	b.n	1786 <sci_uart_txi_isr+0x2e>
    17d8:	f8b1 c000 	ldrh.w	ip, [r1]
    17dc:	f44c 4c7e 	orr.w	ip, ip, #65024	@ 0xfe00
    17e0:	f8a4 c00e 	strh.w	ip, [r4, #14]
    17e4:	e7f1      	b.n	17ca <sci_uart_txi_isr+0x72>
    17e6:	bf00      	nop
    17e8:	40006000 	.word	0x40006000
    17ec:	20000504 	.word	0x20000504

000017f0 <sci_uart_rxi_isr>:
    17f0:	b510      	push	{r4, lr}
    17f2:	b082      	sub	sp, #8
    17f4:	f3ef 8303 	mrs	r3, PSR
    17f8:	3b10      	subs	r3, #16
    17fa:	4a1f      	ldr	r2, [pc, #124]	@ (1878 <sci_uart_rxi_isr+0x88>)
    17fc:	b25b      	sxtb	r3, r3
    17fe:	f103 01c0 	add.w	r1, r3, #192	@ 0xc0
    1802:	f852 0021 	ldr.w	r0, [r2, r1, lsl #2]
    1806:	f420 3080 	bic.w	r0, r0, #65536	@ 0x10000
    180a:	f842 0021 	str.w	r0, [r2, r1, lsl #2]
    180e:	f852 2021 	ldr.w	r2, [r2, r1, lsl #2]
    1812:	4a1a      	ldr	r2, [pc, #104]	@ (187c <sci_uart_rxi_isr+0x8c>)
    1814:	f852 4023 	ldr.w	r4, [r2, r3, lsl #2]
    1818:	78a2      	ldrb	r2, [r4, #2]
    181a:	6a23      	ldr	r3, [r4, #32]
    181c:	f002 0103 	and.w	r1, r2, #3
    1820:	2902      	cmp	r1, #2
    1822:	bf0c      	ite	eq
    1824:	8a19      	ldrheq	r1, [r3, #16]
    1826:	7959      	ldrbne	r1, [r3, #5]
    1828:	69a3      	ldr	r3, [r4, #24]
    182a:	bf0c      	ite	eq
    182c:	f3c1 0108 	ubfxeq	r1, r1, #0, #9
    1830:	b2c9      	uxtbne	r1, r1
    1832:	9101      	str	r1, [sp, #4]
    1834:	b943      	cbnz	r3, 1848 <sci_uart_rxi_isr+0x58>
    1836:	6a63      	ldr	r3, [r4, #36]	@ 0x24
    1838:	b1b3      	cbz	r3, 1868 <sci_uart_rxi_isr+0x78>
    183a:	2204      	movs	r2, #4
    183c:	4620      	mov	r0, r4
    183e:	b002      	add	sp, #8
    1840:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    1844:	f7ff bd98 	b.w	1378 <r_sci_uart_call_callback>
    1848:	f002 0203 	and.w	r2, r2, #3
    184c:	a901      	add	r1, sp, #4
    184e:	6960      	ldr	r0, [r4, #20]
    1850:	f000 fe47 	bl	24e2 <memcpy>
    1854:	e9d4 2105 	ldrd	r2, r1, [r4, #20]
    1858:	78a3      	ldrb	r3, [r4, #2]
    185a:	f003 0303 	and.w	r3, r3, #3
    185e:	441a      	add	r2, r3
    1860:	1ac9      	subs	r1, r1, r3
    1862:	e9c4 2105 	strd	r2, r1, [r4, #20]
    1866:	b109      	cbz	r1, 186c <sci_uart_rxi_isr+0x7c>
    1868:	b002      	add	sp, #8
    186a:	bd10      	pop	{r4, pc}
    186c:	6a63      	ldr	r3, [r4, #36]	@ 0x24
    186e:	2b00      	cmp	r3, #0
    1870:	d0fa      	beq.n	1868 <sci_uart_rxi_isr+0x78>
    1872:	2201      	movs	r2, #1
    1874:	e7e2      	b.n	183c <sci_uart_rxi_isr+0x4c>
    1876:	bf00      	nop
    1878:	40006000 	.word	0x40006000
    187c:	20000504 	.word	0x20000504

00001880 <sci_uart_tei_isr>:
    1880:	b510      	push	{r4, lr}
    1882:	f3ef 8303 	mrs	r3, PSR
    1886:	4a0e      	ldr	r2, [pc, #56]	@ (18c0 <sci_uart_tei_isr+0x40>)
    1888:	3b10      	subs	r3, #16
    188a:	b25c      	sxtb	r4, r3
    188c:	f852 0024 	ldr.w	r0, [r2, r4, lsl #2]
    1890:	e9d0 2108 	ldrd	r2, r1, [r0, #32]
    1894:	7893      	ldrb	r3, [r2, #2]
    1896:	f003 037b 	and.w	r3, r3, #123	@ 0x7b
    189a:	7093      	strb	r3, [r2, #2]
    189c:	b119      	cbz	r1, 18a6 <sci_uart_tei_isr+0x26>
    189e:	2202      	movs	r2, #2
    18a0:	2100      	movs	r1, #0
    18a2:	f7ff fd69 	bl	1378 <r_sci_uart_call_callback>
    18a6:	4a07      	ldr	r2, [pc, #28]	@ (18c4 <sci_uart_tei_isr+0x44>)
    18a8:	f104 03c0 	add.w	r3, r4, #192	@ 0xc0
    18ac:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
    18b0:	f421 3180 	bic.w	r1, r1, #65536	@ 0x10000
    18b4:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
    18b8:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
    18bc:	bd10      	pop	{r4, pc}
    18be:	bf00      	nop
    18c0:	20000504 	.word	0x20000504
    18c4:	40006000 	.word	0x40006000

000018c8 <sci_uart_eri_isr>:
    18c8:	b510      	push	{r4, lr}
    18ca:	f3ef 8303 	mrs	r3, PSR
    18ce:	4a1a      	ldr	r2, [pc, #104]	@ (1938 <sci_uart_eri_isr+0x70>)
    18d0:	3b10      	subs	r3, #16
    18d2:	b25c      	sxtb	r4, r3
    18d4:	f852 0024 	ldr.w	r0, [r2, r4, lsl #2]
    18d8:	7882      	ldrb	r2, [r0, #2]
    18da:	6a03      	ldr	r3, [r0, #32]
    18dc:	f002 0203 	and.w	r2, r2, #3
    18e0:	2a02      	cmp	r2, #2
    18e2:	bf0c      	ite	eq
    18e4:	8a19      	ldrheq	r1, [r3, #16]
    18e6:	7959      	ldrbne	r1, [r3, #5]
    18e8:	f893 c004 	ldrb.w	ip, [r3, #4]
    18ec:	bf0c      	ite	eq
    18ee:	f3c1 0108 	ubfxeq	r1, r1, #0, #9
    18f2:	b2c9      	uxtbne	r1, r1
    18f4:	f01c 0f10 	tst.w	ip, #16
    18f8:	f00c 0238 	and.w	r2, ip, #56	@ 0x38
    18fc:	d006      	beq.n	190c <sci_uart_eri_isr+0x44>
    18fe:	f893 c01c 	ldrb.w	ip, [r3, #28]
    1902:	f01c 0f01 	tst.w	ip, #1
    1906:	bf08      	it	eq
    1908:	f042 0240 	orreq.w	r2, r2, #64	@ 0x40
    190c:	f893 c004 	ldrb.w	ip, [r3, #4]
    1910:	f00c 0cc7 	and.w	ip, ip, #199	@ 0xc7
    1914:	f883 c004 	strb.w	ip, [r3, #4]
    1918:	6a43      	ldr	r3, [r0, #36]	@ 0x24
    191a:	b10b      	cbz	r3, 1920 <sci_uart_eri_isr+0x58>
    191c:	f7ff fd2c 	bl	1378 <r_sci_uart_call_callback>
    1920:	4a06      	ldr	r2, [pc, #24]	@ (193c <sci_uart_eri_isr+0x74>)
    1922:	f104 03c0 	add.w	r3, r4, #192	@ 0xc0
    1926:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
    192a:	f421 3180 	bic.w	r1, r1, #65536	@ 0x10000
    192e:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
    1932:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
    1936:	bd10      	pop	{r4, pc}
    1938:	20000504 	.word	0x20000504
    193c:	40006000 	.word	0x40006000

00001940 <main>:
    1940:	b508      	push	{r3, lr}
    1942:	f000 fad5 	bl	1ef0 <hal_entry>
    1946:	2000      	movs	r0, #0
    1948:	bd08      	pop	{r3, pc}
    194a:	bf00      	nop

0000194c <circlebuf_put>:
    194c:	4603      	mov	r3, r0
    194e:	6840      	ldr	r0, [r0, #4]
    1950:	b410      	push	{r4}
    1952:	689c      	ldr	r4, [r3, #8]
    1954:	1c42      	adds	r2, r0, #1
    1956:	4294      	cmp	r4, r2
    1958:	bf08      	it	eq
    195a:	2200      	moveq	r2, #0
    195c:	681c      	ldr	r4, [r3, #0]
    195e:	4294      	cmp	r4, r2
    1960:	d006      	beq.n	1970 <circlebuf_put+0x24>
    1962:	68dc      	ldr	r4, [r3, #12]
    1964:	5421      	strb	r1, [r4, r0]
    1966:	2000      	movs	r0, #0
    1968:	605a      	str	r2, [r3, #4]
    196a:	f85d 4b04 	ldr.w	r4, [sp], #4
    196e:	4770      	bx	lr
    1970:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    1974:	e7f9      	b.n	196a <circlebuf_put+0x1e>
    1976:	bf00      	nop

00001978 <circlebuf_get>:
    1978:	e9d0 3200 	ldrd	r3, r2, [r0]
    197c:	429a      	cmp	r2, r3
    197e:	d00c      	beq.n	199a <circlebuf_get+0x22>
    1980:	68c2      	ldr	r2, [r0, #12]
    1982:	5cd3      	ldrb	r3, [r2, r3]
    1984:	700b      	strb	r3, [r1, #0]
    1986:	6803      	ldr	r3, [r0, #0]
    1988:	6882      	ldr	r2, [r0, #8]
    198a:	3301      	adds	r3, #1
    198c:	4293      	cmp	r3, r2
    198e:	6003      	str	r3, [r0, #0]
    1990:	bf04      	itt	eq
    1992:	2300      	moveq	r3, #0
    1994:	6003      	streq	r3, [r0, #0]
    1996:	2000      	movs	r0, #0
    1998:	4770      	bx	lr
    199a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    199e:	4770      	bx	lr

000019a0 <circlebuf_init>:
    19a0:	2000      	movs	r0, #0
    19a2:	2100      	movs	r1, #0
    19a4:	2240      	movs	r2, #64	@ 0x40
    19a6:	b410      	push	{r4}
    19a8:	4b06      	ldr	r3, [pc, #24]	@ (19c4 <circlebuf_init+0x24>)
    19aa:	4c07      	ldr	r4, [pc, #28]	@ (19c8 <circlebuf_init+0x28>)
    19ac:	e9c3 0100 	strd	r0, r1, [r3]
    19b0:	60dc      	str	r4, [r3, #12]
    19b2:	4c06      	ldr	r4, [pc, #24]	@ (19cc <circlebuf_init+0x2c>)
    19b4:	609a      	str	r2, [r3, #8]
    19b6:	611c      	str	r4, [r3, #16]
    19b8:	4c05      	ldr	r4, [pc, #20]	@ (19d0 <circlebuf_init+0x30>)
    19ba:	615c      	str	r4, [r3, #20]
    19bc:	f85d 4b04 	ldr.w	r4, [sp], #4
    19c0:	4770      	bx	lr
    19c2:	bf00      	nop
    19c4:	200005b0 	.word	0x200005b0
    19c8:	200005c8 	.word	0x200005c8
    19cc:	0000194d 	.word	0x0000194d
    19d0:	00001979 	.word	0x00001979

000019d4 <EEPROMDrvInit>:
    19d4:	6803      	ldr	r3, [r0, #0]
    19d6:	b19b      	cbz	r3, 1a00 <EEPROMDrvInit+0x2c>
    19d8:	4b0b      	ldr	r3, [pc, #44]	@ (1a08 <EEPROMDrvInit+0x34>)
    19da:	b510      	push	{r4, lr}
    19dc:	e9d3 1201 	ldrd	r1, r2, [r3, #4]
    19e0:	6818      	ldr	r0, [r3, #0]
    19e2:	6812      	ldr	r2, [r2, #0]
    19e4:	4790      	blx	r2
    19e6:	4604      	mov	r4, r0
    19e8:	b920      	cbnz	r0, 19f4 <EEPROMDrvInit+0x20>
    19ea:	4808      	ldr	r0, [pc, #32]	@ (1a0c <EEPROMDrvInit+0x38>)
    19ec:	f000 fc44 	bl	2278 <puts>
    19f0:	4620      	mov	r0, r4
    19f2:	bd10      	pop	{r4, pc}
    19f4:	4806      	ldr	r0, [pc, #24]	@ (1a10 <EEPROMDrvInit+0x3c>)
    19f6:	f000 fc3f 	bl	2278 <puts>
    19fa:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    19fe:	bd10      	pop	{r4, pc}
    1a00:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    1a04:	4770      	bx	lr
    1a06:	bf00      	nop
    1a08:	000030e8 	.word	0x000030e8
    1a0c:	00003194 	.word	0x00003194
    1a10:	000031b4 	.word	0x000031b4

00001a14 <EEPROMDrvWritePage.isra.0>:
    1a14:	2800      	cmp	r0, #0
    1a16:	d033      	beq.n	1a80 <EEPROMDrvWritePage.isra.0+0x6c>
    1a18:	b570      	push	{r4, r5, r6, lr}
    1a1a:	461e      	mov	r6, r3
    1a1c:	2300      	movs	r3, #0
    1a1e:	b084      	sub	sp, #16
    1a20:	e9cd 3301 	strd	r3, r3, [sp, #4]
    1a24:	f88d 300c 	strb.w	r3, [sp, #12]
    1a28:	f88d 1004 	strb.w	r1, [sp, #4]
    1a2c:	b12e      	cbz	r6, 1a3a <EEPROMDrvWritePage.isra.0+0x26>
    1a2e:	4611      	mov	r1, r2
    1a30:	f10d 0005 	add.w	r0, sp, #5
    1a34:	4632      	mov	r2, r6
    1a36:	f000 fd54 	bl	24e2 <memcpy>
    1a3a:	4a12      	ldr	r2, [pc, #72]	@ (1a84 <EEPROMDrvWritePage.isra.0+0x70>)
    1a3c:	4d12      	ldr	r5, [pc, #72]	@ (1a88 <EEPROMDrvWritePage.isra.0+0x74>)
    1a3e:	6890      	ldr	r0, [r2, #8]
    1a40:	3601      	adds	r6, #1
    1a42:	2300      	movs	r3, #0
    1a44:	6884      	ldr	r4, [r0, #8]
    1a46:	a901      	add	r1, sp, #4
    1a48:	6810      	ldr	r0, [r2, #0]
    1a4a:	4632      	mov	r2, r6
    1a4c:	47a0      	blx	r4
    1a4e:	782b      	ldrb	r3, [r5, #0]
    1a50:	b963      	cbnz	r3, 1a6c <EEPROMDrvWritePage.isra.0+0x58>
    1a52:	2432      	movs	r4, #50	@ 0x32
    1a54:	e000      	b.n	1a58 <EEPROMDrvWritePage.isra.0+0x44>
    1a56:	b14c      	cbz	r4, 1a6c <EEPROMDrvWritePage.isra.0+0x58>
    1a58:	f44f 717a 	mov.w	r1, #1000	@ 0x3e8
    1a5c:	2001      	movs	r0, #1
    1a5e:	f7fe fd13 	bl	488 <R_BSP_SoftwareDelay>
    1a62:	7829      	ldrb	r1, [r5, #0]
    1a64:	3c01      	subs	r4, #1
    1a66:	b2a4      	uxth	r4, r4
    1a68:	2900      	cmp	r1, #0
    1a6a:	d0f4      	beq.n	1a56 <EEPROMDrvWritePage.isra.0+0x42>
    1a6c:	2300      	movs	r3, #0
    1a6e:	f44f 717a 	mov.w	r1, #1000	@ 0x3e8
    1a72:	eb06 0086 	add.w	r0, r6, r6, lsl #2
    1a76:	702b      	strb	r3, [r5, #0]
    1a78:	f7fe fd06 	bl	488 <R_BSP_SoftwareDelay>
    1a7c:	b004      	add	sp, #16
    1a7e:	bd70      	pop	{r4, r5, r6, pc}
    1a80:	4770      	bx	lr
    1a82:	bf00      	nop
    1a84:	000030e8 	.word	0x000030e8
    1a88:	20000609 	.word	0x20000609

00001a8c <EEPROMDrvWriteBuff>:
    1a8c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    1a90:	4607      	mov	r7, r0
    1a92:	6800      	ldr	r0, [r0, #0]
    1a94:	b082      	sub	sp, #8
    1a96:	2800      	cmp	r0, #0
    1a98:	d04f      	beq.n	1b3a <EEPROMDrvWriteBuff+0xae>
    1a9a:	2b01      	cmp	r3, #1
    1a9c:	460c      	mov	r4, r1
    1a9e:	4690      	mov	r8, r2
    1aa0:	461d      	mov	r5, r3
    1aa2:	d029      	beq.n	1af8 <EEPROMDrvWriteBuff+0x6c>
    1aa4:	18cb      	adds	r3, r1, r3
    1aa6:	2bff      	cmp	r3, #255	@ 0xff
    1aa8:	d847      	bhi.n	1b3a <EEPROMDrvWriteBuff+0xae>
    1aaa:	f011 0607 	ands.w	r6, r1, #7
    1aae:	d01f      	beq.n	1af0 <EEPROMDrvWriteBuff+0x64>
    1ab0:	f1c6 0608 	rsb	r6, r6, #8
    1ab4:	b2f6      	uxtb	r6, r6
    1ab6:	4633      	mov	r3, r6
    1ab8:	4642      	mov	r2, r8
    1aba:	4621      	mov	r1, r4
    1abc:	f7ff ffaa 	bl	1a14 <EEPROMDrvWritePage.isra.0>
    1ac0:	4434      	add	r4, r6
    1ac2:	44b0      	add	r8, r6
    1ac4:	1bae      	subs	r6, r5, r6
    1ac6:	b2e4      	uxtb	r4, r4
    1ac8:	d00e      	beq.n	1ae8 <EEPROMDrvWriteBuff+0x5c>
    1aca:	2e08      	cmp	r6, #8
    1acc:	4635      	mov	r5, r6
    1ace:	bf28      	it	cs
    1ad0:	2508      	movcs	r5, #8
    1ad2:	4642      	mov	r2, r8
    1ad4:	4621      	mov	r1, r4
    1ad6:	462b      	mov	r3, r5
    1ad8:	6838      	ldr	r0, [r7, #0]
    1ada:	f7ff ff9b 	bl	1a14 <EEPROMDrvWritePage.isra.0>
    1ade:	442c      	add	r4, r5
    1ae0:	1b76      	subs	r6, r6, r5
    1ae2:	b2e4      	uxtb	r4, r4
    1ae4:	44a8      	add	r8, r5
    1ae6:	d1f0      	bne.n	1aca <EEPROMDrvWriteBuff+0x3e>
    1ae8:	2000      	movs	r0, #0
    1aea:	b002      	add	sp, #8
    1aec:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    1af0:	2d08      	cmp	r5, #8
    1af2:	d8dd      	bhi.n	1ab0 <EEPROMDrvWriteBuff+0x24>
    1af4:	b2ee      	uxtb	r6, r5
    1af6:	e7de      	b.n	1ab6 <EEPROMDrvWriteBuff+0x2a>
    1af8:	4811      	ldr	r0, [pc, #68]	@ (1b40 <EEPROMDrvWriteBuff+0xb4>)
    1afa:	7811      	ldrb	r1, [r2, #0]
    1afc:	6885      	ldr	r5, [r0, #8]
    1afe:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
    1b02:	68ac      	ldr	r4, [r5, #8]
    1b04:	4d0f      	ldr	r5, [pc, #60]	@ (1b44 <EEPROMDrvWriteBuff+0xb8>)
    1b06:	2300      	movs	r3, #0
    1b08:	f8ad 1006 	strh.w	r1, [sp, #6]
    1b0c:	2202      	movs	r2, #2
    1b0e:	6800      	ldr	r0, [r0, #0]
    1b10:	f10d 0106 	add.w	r1, sp, #6
    1b14:	47a0      	blx	r4
    1b16:	782b      	ldrb	r3, [r5, #0]
    1b18:	b963      	cbnz	r3, 1b34 <EEPROMDrvWriteBuff+0xa8>
    1b1a:	2432      	movs	r4, #50	@ 0x32
    1b1c:	e000      	b.n	1b20 <EEPROMDrvWriteBuff+0x94>
    1b1e:	b14c      	cbz	r4, 1b34 <EEPROMDrvWriteBuff+0xa8>
    1b20:	f44f 717a 	mov.w	r1, #1000	@ 0x3e8
    1b24:	2001      	movs	r0, #1
    1b26:	f7fe fcaf 	bl	488 <R_BSP_SoftwareDelay>
    1b2a:	782b      	ldrb	r3, [r5, #0]
    1b2c:	3c01      	subs	r4, #1
    1b2e:	b2a4      	uxth	r4, r4
    1b30:	2b00      	cmp	r3, #0
    1b32:	d0f4      	beq.n	1b1e <EEPROMDrvWriteBuff+0x92>
    1b34:	2300      	movs	r3, #0
    1b36:	702b      	strb	r3, [r5, #0]
    1b38:	e7d6      	b.n	1ae8 <EEPROMDrvWriteBuff+0x5c>
    1b3a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    1b3e:	e7d4      	b.n	1aea <EEPROMDrvWriteBuff+0x5e>
    1b40:	000030e8 	.word	0x000030e8
    1b44:	20000609 	.word	0x20000609

00001b48 <EEPROMDrvRead>:
    1b48:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    1b4c:	6800      	ldr	r0, [r0, #0]
    1b4e:	b083      	sub	sp, #12
    1b50:	f88d 1007 	strb.w	r1, [sp, #7]
    1b54:	2800      	cmp	r0, #0
    1b56:	d043      	beq.n	1be0 <EEPROMDrvRead+0x98>
    1b58:	461e      	mov	r6, r3
    1b5a:	4b23      	ldr	r3, [pc, #140]	@ (1be8 <EEPROMDrvRead+0xa0>)
    1b5c:	f8df 9090 	ldr.w	r9, [pc, #144]	@ 1bf0 <EEPROMDrvRead+0xa8>
    1b60:	689f      	ldr	r7, [r3, #8]
    1b62:	f8d3 8000 	ldr.w	r8, [r3]
    1b66:	2301      	movs	r3, #1
    1b68:	4615      	mov	r5, r2
    1b6a:	4640      	mov	r0, r8
    1b6c:	461a      	mov	r2, r3
    1b6e:	68bc      	ldr	r4, [r7, #8]
    1b70:	f10d 0107 	add.w	r1, sp, #7
    1b74:	47a0      	blx	r4
    1b76:	f899 3000 	ldrb.w	r3, [r9]
    1b7a:	b96b      	cbnz	r3, 1b98 <EEPROMDrvRead+0x50>
    1b7c:	2432      	movs	r4, #50	@ 0x32
    1b7e:	e000      	b.n	1b82 <EEPROMDrvRead+0x3a>
    1b80:	b154      	cbz	r4, 1b98 <EEPROMDrvRead+0x50>
    1b82:	2001      	movs	r0, #1
    1b84:	f44f 717a 	mov.w	r1, #1000	@ 0x3e8
    1b88:	f7fe fc7e 	bl	488 <R_BSP_SoftwareDelay>
    1b8c:	f899 0000 	ldrb.w	r0, [r9]
    1b90:	3c01      	subs	r4, #1
    1b92:	b2a4      	uxth	r4, r4
    1b94:	2800      	cmp	r0, #0
    1b96:	d0f3      	beq.n	1b80 <EEPROMDrvRead+0x38>
    1b98:	2400      	movs	r4, #0
    1b9a:	2101      	movs	r1, #1
    1b9c:	f44f 7096 	mov.w	r0, #300	@ 0x12c
    1ba0:	f889 4000 	strb.w	r4, [r9]
    1ba4:	f7fe fc70 	bl	488 <R_BSP_SoftwareDelay>
    1ba8:	4629      	mov	r1, r5
    1baa:	4d10      	ldr	r5, [pc, #64]	@ (1bec <EEPROMDrvRead+0xa4>)
    1bac:	4623      	mov	r3, r4
    1bae:	4632      	mov	r2, r6
    1bb0:	4640      	mov	r0, r8
    1bb2:	687c      	ldr	r4, [r7, #4]
    1bb4:	47a0      	blx	r4
    1bb6:	782b      	ldrb	r3, [r5, #0]
    1bb8:	b963      	cbnz	r3, 1bd4 <EEPROMDrvRead+0x8c>
    1bba:	2432      	movs	r4, #50	@ 0x32
    1bbc:	e000      	b.n	1bc0 <EEPROMDrvRead+0x78>
    1bbe:	b14c      	cbz	r4, 1bd4 <EEPROMDrvRead+0x8c>
    1bc0:	f44f 717a 	mov.w	r1, #1000	@ 0x3e8
    1bc4:	2001      	movs	r0, #1
    1bc6:	f7fe fc5f 	bl	488 <R_BSP_SoftwareDelay>
    1bca:	782b      	ldrb	r3, [r5, #0]
    1bcc:	3c01      	subs	r4, #1
    1bce:	b2a4      	uxth	r4, r4
    1bd0:	2b00      	cmp	r3, #0
    1bd2:	d0f4      	beq.n	1bbe <EEPROMDrvRead+0x76>
    1bd4:	2300      	movs	r3, #0
    1bd6:	4618      	mov	r0, r3
    1bd8:	702b      	strb	r3, [r5, #0]
    1bda:	b003      	add	sp, #12
    1bdc:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    1be0:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    1be4:	e7f9      	b.n	1bda <EEPROMDrvRead+0x92>
    1be6:	bf00      	nop
    1be8:	000030e8 	.word	0x000030e8
    1bec:	20000608 	.word	0x20000608
    1bf0:	20000609 	.word	0x20000609

00001bf4 <EEPROMGetDevice>:
    1bf4:	4800      	ldr	r0, [pc, #0]	@ (1bf8 <EEPROMGetDevice+0x4>)
    1bf6:	4770      	bx	lr
    1bf8:	20000004 	.word	0x20000004

00001bfc <sci_i2c4_master_callback>:
    1bfc:	7903      	ldrb	r3, [r0, #4]
    1bfe:	2b02      	cmp	r3, #2
    1c00:	d006      	beq.n	1c10 <sci_i2c4_master_callback+0x14>
    1c02:	2b03      	cmp	r3, #3
    1c04:	d000      	beq.n	1c08 <sci_i2c4_master_callback+0xc>
    1c06:	4770      	bx	lr
    1c08:	2201      	movs	r2, #1
    1c0a:	4b03      	ldr	r3, [pc, #12]	@ (1c18 <sci_i2c4_master_callback+0x1c>)
    1c0c:	701a      	strb	r2, [r3, #0]
    1c0e:	4770      	bx	lr
    1c10:	2201      	movs	r2, #1
    1c12:	4b02      	ldr	r3, [pc, #8]	@ (1c1c <sci_i2c4_master_callback+0x20>)
    1c14:	701a      	strb	r2, [r3, #0]
    1c16:	4770      	bx	lr
    1c18:	20000609 	.word	0x20000609
    1c1c:	20000608 	.word	0x20000608

00001c20 <uart2_callback>:
    1c20:	7903      	ldrb	r3, [r0, #4]
    1c22:	2b02      	cmp	r3, #2
    1c24:	d007      	beq.n	1c36 <uart2_callback+0x16>
    1c26:	2b04      	cmp	r3, #4
    1c28:	d000      	beq.n	1c2c <uart2_callback+0xc>
    1c2a:	4770      	bx	lr
    1c2c:	4b04      	ldr	r3, [pc, #16]	@ (1c40 <uart2_callback+0x20>)
    1c2e:	7a01      	ldrb	r1, [r0, #8]
    1c30:	4618      	mov	r0, r3
    1c32:	691b      	ldr	r3, [r3, #16]
    1c34:	4718      	bx	r3
    1c36:	2201      	movs	r2, #1
    1c38:	4b02      	ldr	r3, [pc, #8]	@ (1c44 <uart2_callback+0x24>)
    1c3a:	601a      	str	r2, [r3, #0]
    1c3c:	4770      	bx	lr
    1c3e:	bf00      	nop
    1c40:	200005b0 	.word	0x200005b0
    1c44:	2000060c 	.word	0x2000060c

00001c48 <_write>:
    1c48:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    1c4c:	f1b2 0900 	subs.w	r9, r2, #0
    1c50:	dd16      	ble.n	1c80 <_write+0x38>
    1c52:	468a      	mov	sl, r1
    1c54:	2600      	movs	r6, #0
    1c56:	4b0c      	ldr	r3, [pc, #48]	@ (1c88 <_write+0x40>)
    1c58:	4c0c      	ldr	r4, [pc, #48]	@ (1c8c <_write+0x44>)
    1c5a:	f8d3 8008 	ldr.w	r8, [r3, #8]
    1c5e:	681f      	ldr	r7, [r3, #0]
    1c60:	eb01 0509 	add.w	r5, r1, r9
    1c64:	2201      	movs	r2, #1
    1c66:	4651      	mov	r1, sl
    1c68:	4638      	mov	r0, r7
    1c6a:	f8d8 3008 	ldr.w	r3, [r8, #8]
    1c6e:	4798      	blx	r3
    1c70:	6823      	ldr	r3, [r4, #0]
    1c72:	2b00      	cmp	r3, #0
    1c74:	d0fc      	beq.n	1c70 <_write+0x28>
    1c76:	f10a 0a01 	add.w	sl, sl, #1
    1c7a:	45aa      	cmp	sl, r5
    1c7c:	6026      	str	r6, [r4, #0]
    1c7e:	d1f1      	bne.n	1c64 <_write+0x1c>
    1c80:	4648      	mov	r0, r9
    1c82:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    1c86:	bf00      	nop
    1c88:	000030a8 	.word	0x000030a8
    1c8c:	2000060c 	.word	0x2000060c

00001c90 <_read>:
    1c90:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    1c94:	f1b2 0b00 	subs.w	fp, r2, #0
    1c98:	b085      	sub	sp, #20
    1c9a:	dd28      	ble.n	1cee <_read+0x5e>
    1c9c:	460d      	mov	r5, r1
    1c9e:	2600      	movs	r6, #0
    1ca0:	4b1c      	ldr	r3, [pc, #112]	@ (1d14 <_read+0x84>)
    1ca2:	f8df a078 	ldr.w	sl, [pc, #120]	@ 1d1c <_read+0x8c>
    1ca6:	f8d3 8008 	ldr.w	r8, [r3, #8]
    1caa:	681f      	ldr	r7, [r3, #0]
    1cac:	4c1a      	ldr	r4, [pc, #104]	@ (1d18 <_read+0x88>)
    1cae:	eb01 090b 	add.w	r9, r1, fp
    1cb2:	4650      	mov	r0, sl
    1cb4:	f8da 3014 	ldr.w	r3, [sl, #20]
    1cb8:	f10d 010e 	add.w	r1, sp, #14
    1cbc:	4798      	blx	r3
    1cbe:	2800      	cmp	r0, #0
    1cc0:	d1f7      	bne.n	1cb2 <_read+0x22>
    1cc2:	f89d 300e 	ldrb.w	r3, [sp, #14]
    1cc6:	2201      	movs	r2, #1
    1cc8:	702b      	strb	r3, [r5, #0]
    1cca:	4629      	mov	r1, r5
    1ccc:	4638      	mov	r0, r7
    1cce:	f8d8 3008 	ldr.w	r3, [r8, #8]
    1cd2:	9501      	str	r5, [sp, #4]
    1cd4:	4798      	blx	r3
    1cd6:	6823      	ldr	r3, [r4, #0]
    1cd8:	2b00      	cmp	r3, #0
    1cda:	d0fc      	beq.n	1cd6 <_read+0x46>
    1cdc:	9b01      	ldr	r3, [sp, #4]
    1cde:	6026      	str	r6, [r4, #0]
    1ce0:	f993 3000 	ldrsb.w	r3, [r3]
    1ce4:	3501      	adds	r5, #1
    1ce6:	2b0d      	cmp	r3, #13
    1ce8:	d005      	beq.n	1cf6 <_read+0x66>
    1cea:	45a9      	cmp	r9, r5
    1cec:	d1e1      	bne.n	1cb2 <_read+0x22>
    1cee:	4658      	mov	r0, fp
    1cf0:	b005      	add	sp, #20
    1cf2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1cf6:	230a      	movs	r3, #10
    1cf8:	2201      	movs	r2, #1
    1cfa:	f88d 300f 	strb.w	r3, [sp, #15]
    1cfe:	4638      	mov	r0, r7
    1d00:	f8d8 3008 	ldr.w	r3, [r8, #8]
    1d04:	f10d 010f 	add.w	r1, sp, #15
    1d08:	4798      	blx	r3
    1d0a:	6823      	ldr	r3, [r4, #0]
    1d0c:	2b00      	cmp	r3, #0
    1d0e:	d0fc      	beq.n	1d0a <_read+0x7a>
    1d10:	6026      	str	r6, [r4, #0]
    1d12:	e7ea      	b.n	1cea <_read+0x5a>
    1d14:	000030a8 	.word	0x000030a8
    1d18:	2000060c 	.word	0x2000060c
    1d1c:	200005b0 	.word	0x200005b0

00001d20 <_close>:
    1d20:	b508      	push	{r3, lr}
    1d22:	f000 fbd5 	bl	24d0 <__errno>
    1d26:	2209      	movs	r2, #9
    1d28:	4603      	mov	r3, r0
    1d2a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    1d2e:	601a      	str	r2, [r3, #0]
    1d30:	bd08      	pop	{r3, pc}
    1d32:	bf00      	nop

00001d34 <_lseek>:
    1d34:	2000      	movs	r0, #0
    1d36:	4770      	bx	lr

00001d38 <_fstat>:
    1d38:	f44f 5300 	mov.w	r3, #8192	@ 0x2000
    1d3c:	2000      	movs	r0, #0
    1d3e:	604b      	str	r3, [r1, #4]
    1d40:	4770      	bx	lr
    1d42:	bf00      	nop

00001d44 <_isatty>:
    1d44:	2001      	movs	r0, #1
    1d46:	4770      	bx	lr

00001d48 <EEPROMAppTest>:
    1d48:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    1d4c:	b082      	sub	sp, #8
    1d4e:	f7ff ff51 	bl	1bf4 <EEPROMGetDevice>
    1d52:	b118      	cbz	r0, 1d5c <EEPROMAppTest+0x14>
    1d54:	6843      	ldr	r3, [r0, #4]
    1d56:	4605      	mov	r5, r0
    1d58:	4798      	blx	r3
    1d5a:	b110      	cbz	r0, 1d62 <EEPROMAppTest+0x1a>
    1d5c:	b002      	add	sp, #8
    1d5e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    1d62:	4856      	ldr	r0, [pc, #344]	@ (1ebc <EEPROMAppTest+0x174>)
    1d64:	f000 f8f0 	bl	1f48 <srand>
    1d68:	4855      	ldr	r0, [pc, #340]	@ (1ec0 <EEPROMAppTest+0x178>)
    1d6a:	f000 fa85 	bl	2278 <puts>
    1d6e:	4855      	ldr	r0, [pc, #340]	@ (1ec4 <EEPROMAppTest+0x17c>)
    1d70:	f000 fa82 	bl	2278 <puts>
    1d74:	240a      	movs	r4, #10
    1d76:	f04f 0c33 	mov.w	ip, #51	@ 0x33
    1d7a:	2700      	movs	r7, #0
    1d7c:	2301      	movs	r3, #1
    1d7e:	f10d 0206 	add.w	r2, sp, #6
    1d82:	2102      	movs	r1, #2
    1d84:	68ae      	ldr	r6, [r5, #8]
    1d86:	4628      	mov	r0, r5
    1d88:	f88d c006 	strb.w	ip, [sp, #6]
    1d8c:	f88d 7007 	strb.w	r7, [sp, #7]
    1d90:	47b0      	blx	r6
    1d92:	f44f 717a 	mov.w	r1, #1000	@ 0x3e8
    1d96:	200a      	movs	r0, #10
    1d98:	f7fe fb76 	bl	488 <R_BSP_SoftwareDelay>
    1d9c:	2301      	movs	r3, #1
    1d9e:	2102      	movs	r1, #2
    1da0:	f10d 0207 	add.w	r2, sp, #7
    1da4:	4628      	mov	r0, r5
    1da6:	68ee      	ldr	r6, [r5, #12]
    1da8:	47b0      	blx	r6
    1daa:	f89d 2007 	ldrb.w	r2, [sp, #7]
    1dae:	f89d 1006 	ldrb.w	r1, [sp, #6]
    1db2:	4845      	ldr	r0, [pc, #276]	@ (1ec8 <EEPROMAppTest+0x180>)
    1db4:	f000 f9f8 	bl	21a8 <iprintf>
    1db8:	f89d 2006 	ldrb.w	r2, [sp, #6]
    1dbc:	f89d 3007 	ldrb.w	r3, [sp, #7]
    1dc0:	4942      	ldr	r1, [pc, #264]	@ (1ecc <EEPROMAppTest+0x184>)
    1dc2:	429a      	cmp	r2, r3
    1dc4:	4842      	ldr	r0, [pc, #264]	@ (1ed0 <EEPROMAppTest+0x188>)
    1dc6:	4622      	mov	r2, r4
    1dc8:	bf04      	itt	eq
    1dca:	4942      	ldreq	r1, [pc, #264]	@ (1ed4 <EEPROMAppTest+0x18c>)
    1dcc:	4842      	ldreq	r0, [pc, #264]	@ (1ed8 <EEPROMAppTest+0x190>)
    1dce:	f000 f9eb 	bl	21a8 <iprintf>
    1dd2:	3c01      	subs	r4, #1
    1dd4:	d1cf      	bne.n	1d76 <EEPROMAppTest+0x2e>
    1dd6:	4841      	ldr	r0, [pc, #260]	@ (1edc <EEPROMAppTest+0x194>)
    1dd8:	f000 fa4e 	bl	2278 <puts>
    1ddc:	4840      	ldr	r0, [pc, #256]	@ (1ee0 <EEPROMAppTest+0x198>)
    1dde:	f000 fa4b 	bl	2278 <puts>
    1de2:	f04f 0809 	mov.w	r8, #9
    1de6:	f000 f8dd 	bl	1fa4 <rand>
    1dea:	b2c7      	uxtb	r7, r0
    1dec:	f000 f8da 	bl	1fa4 <rand>
    1df0:	2300      	movs	r3, #0
    1df2:	4a3c      	ldr	r2, [pc, #240]	@ (1ee4 <EEPROMAppTest+0x19c>)
    1df4:	f802 3f01 	strb.w	r3, [r2, #1]!
    1df8:	3301      	adds	r3, #1
    1dfa:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
    1dfe:	d1f9      	bne.n	1df4 <EEPROMAppTest+0xac>
    1e00:	b2c4      	uxtb	r4, r0
    1e02:	19e3      	adds	r3, r4, r7
    1e04:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
    1e08:	dc3f      	bgt.n	1e8a <EEPROMAppTest+0x142>
    1e0a:	4639      	mov	r1, r7
    1e0c:	4622      	mov	r2, r4
    1e0e:	482e      	ldr	r0, [pc, #184]	@ (1ec8 <EEPROMAppTest+0x180>)
    1e10:	f000 f9ca 	bl	21a8 <iprintf>
    1e14:	4623      	mov	r3, r4
    1e16:	4639      	mov	r1, r7
    1e18:	4a33      	ldr	r2, [pc, #204]	@ (1ee8 <EEPROMAppTest+0x1a0>)
    1e1a:	4628      	mov	r0, r5
    1e1c:	68ae      	ldr	r6, [r5, #8]
    1e1e:	47b0      	blx	r6
    1e20:	f44f 717a 	mov.w	r1, #1000	@ 0x3e8
    1e24:	2064      	movs	r0, #100	@ 0x64
    1e26:	f7fe fb2f 	bl	488 <R_BSP_SoftwareDelay>
    1e2a:	4639      	mov	r1, r7
    1e2c:	4623      	mov	r3, r4
    1e2e:	4628      	mov	r0, r5
    1e30:	4a2e      	ldr	r2, [pc, #184]	@ (1eec <EEPROMAppTest+0x1a4>)
    1e32:	68ef      	ldr	r7, [r5, #12]
    1e34:	47b8      	blx	r7
    1e36:	b314      	cbz	r4, 1e7e <EEPROMAppTest+0x136>
    1e38:	2200      	movs	r2, #0
    1e3a:	492c      	ldr	r1, [pc, #176]	@ (1eec <EEPROMAppTest+0x1a4>)
    1e3c:	3c01      	subs	r4, #1
    1e3e:	1c4b      	adds	r3, r1, #1
    1e40:	4829      	ldr	r0, [pc, #164]	@ (1ee8 <EEPROMAppTest+0x1a0>)
    1e42:	fa13 f384 	uxtah	r3, r3, r4
    1e46:	f811 4b01 	ldrb.w	r4, [r1], #1
    1e4a:	f810 7b01 	ldrb.w	r7, [r0], #1
    1e4e:	f102 0c01 	add.w	ip, r2, #1
    1e52:	42a7      	cmp	r7, r4
    1e54:	bf18      	it	ne
    1e56:	fa1f f28c 	uxthne.w	r2, ip
    1e5a:	4299      	cmp	r1, r3
    1e5c:	d1f3      	bne.n	1e46 <EEPROMAppTest+0xfe>
    1e5e:	b172      	cbz	r2, 1e7e <EEPROMAppTest+0x136>
    1e60:	491a      	ldr	r1, [pc, #104]	@ (1ecc <EEPROMAppTest+0x184>)
    1e62:	481b      	ldr	r0, [pc, #108]	@ (1ed0 <EEPROMAppTest+0x188>)
    1e64:	f000 f9a0 	bl	21a8 <iprintf>
    1e68:	f44f 717a 	mov.w	r1, #1000	@ 0x3e8
    1e6c:	2064      	movs	r0, #100	@ 0x64
    1e6e:	f7fe fb0b 	bl	488 <R_BSP_SoftwareDelay>
    1e72:	f1b8 0801 	subs.w	r8, r8, #1
    1e76:	d1b6      	bne.n	1de6 <EEPROMAppTest+0x9e>
    1e78:	b002      	add	sp, #8
    1e7a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    1e7e:	4642      	mov	r2, r8
    1e80:	4914      	ldr	r1, [pc, #80]	@ (1ed4 <EEPROMAppTest+0x18c>)
    1e82:	4815      	ldr	r0, [pc, #84]	@ (1ed8 <EEPROMAppTest+0x190>)
    1e84:	f000 f990 	bl	21a8 <iprintf>
    1e88:	e7ee      	b.n	1e68 <EEPROMAppTest+0x120>
    1e8a:	427c      	negs	r4, r7
    1e8c:	b2e4      	uxtb	r4, r4
    1e8e:	4622      	mov	r2, r4
    1e90:	4639      	mov	r1, r7
    1e92:	480d      	ldr	r0, [pc, #52]	@ (1ec8 <EEPROMAppTest+0x180>)
    1e94:	f000 f988 	bl	21a8 <iprintf>
    1e98:	4623      	mov	r3, r4
    1e9a:	4639      	mov	r1, r7
    1e9c:	4a12      	ldr	r2, [pc, #72]	@ (1ee8 <EEPROMAppTest+0x1a0>)
    1e9e:	4628      	mov	r0, r5
    1ea0:	68ae      	ldr	r6, [r5, #8]
    1ea2:	47b0      	blx	r6
    1ea4:	f44f 717a 	mov.w	r1, #1000	@ 0x3e8
    1ea8:	2064      	movs	r0, #100	@ 0x64
    1eaa:	f7fe faed 	bl	488 <R_BSP_SoftwareDelay>
    1eae:	4639      	mov	r1, r7
    1eb0:	4623      	mov	r3, r4
    1eb2:	4628      	mov	r0, r5
    1eb4:	4a0d      	ldr	r2, [pc, #52]	@ (1eec <EEPROMAppTest+0x1a4>)
    1eb6:	68ef      	ldr	r7, [r5, #12]
    1eb8:	47b8      	blx	r7
    1eba:	e7bd      	b.n	1e38 <EEPROMAppTest+0xf0>
    1ebc:	0001bf52 	.word	0x0001bf52
    1ec0:	000031dc 	.word	0x000031dc
    1ec4:	00003214 	.word	0x00003214
    1ec8:	00003240 	.word	0x00003240
    1ecc:	00003274 	.word	0x00003274
    1ed0:	0000327c 	.word	0x0000327c
    1ed4:	00003258 	.word	0x00003258
    1ed8:	00003260 	.word	0x00003260
    1edc:	00003290 	.word	0x00003290
    1ee0:	000032bc 	.word	0x000032bc
    1ee4:	2000070f 	.word	0x2000070f
    1ee8:	20000710 	.word	0x20000710
    1eec:	20000610 	.word	0x20000610

00001ef0 <hal_entry>:
    1ef0:	b508      	push	{r3, lr}
    1ef2:	f7ff fd55 	bl	19a0 <circlebuf_init>
    1ef6:	4b0a      	ldr	r3, [pc, #40]	@ (1f20 <hal_entry+0x30>)
    1ef8:	e9d3 1201 	ldrd	r1, r2, [r3, #4]
    1efc:	6818      	ldr	r0, [r3, #0]
    1efe:	6812      	ldr	r2, [r2, #0]
    1f00:	4790      	blx	r2
    1f02:	4808      	ldr	r0, [pc, #32]	@ (1f24 <hal_entry+0x34>)
    1f04:	f000 f9b8 	bl	2278 <puts>
    1f08:	4b07      	ldr	r3, [pc, #28]	@ (1f28 <hal_entry+0x38>)
    1f0a:	2200      	movs	r2, #0
    1f0c:	689b      	ldr	r3, [r3, #8]
    1f0e:	f44f 6180 	mov.w	r1, #1024	@ 0x400
    1f12:	69db      	ldr	r3, [r3, #28]
    1f14:	4805      	ldr	r0, [pc, #20]	@ (1f2c <hal_entry+0x3c>)
    1f16:	4798      	blx	r3
    1f18:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    1f1c:	f7ff bf14 	b.w	1d48 <EEPROMAppTest>
    1f20:	000030a8 	.word	0x000030a8
    1f24:	000032ec 	.word	0x000032ec
    1f28:	0000309c 	.word	0x0000309c
    1f2c:	20000538 	.word	0x20000538

00001f30 <R_BSP_WarmStart>:
    1f30:	2802      	cmp	r0, #2
    1f32:	d000      	beq.n	1f36 <R_BSP_WarmStart+0x6>
    1f34:	4770      	bx	lr
    1f36:	4902      	ldr	r1, [pc, #8]	@ (1f40 <R_BSP_WarmStart+0x10>)
    1f38:	4802      	ldr	r0, [pc, #8]	@ (1f44 <R_BSP_WarmStart+0x14>)
    1f3a:	f7fe bd25 	b.w	988 <R_IOPORT_Open>
    1f3e:	bf00      	nop
    1f40:	00003124 	.word	0x00003124
    1f44:	20000538 	.word	0x20000538

00001f48 <srand>:
    1f48:	b538      	push	{r3, r4, r5, lr}
    1f4a:	4b10      	ldr	r3, [pc, #64]	@ (1f8c <srand+0x44>)
    1f4c:	4604      	mov	r4, r0
    1f4e:	681d      	ldr	r5, [r3, #0]
    1f50:	6b2a      	ldr	r2, [r5, #48]	@ 0x30
    1f52:	b9b2      	cbnz	r2, 1f82 <srand+0x3a>
    1f54:	2018      	movs	r0, #24
    1f56:	f000 fb1b 	bl	2590 <malloc>
    1f5a:	4602      	mov	r2, r0
    1f5c:	6328      	str	r0, [r5, #48]	@ 0x30
    1f5e:	b920      	cbnz	r0, 1f6a <srand+0x22>
    1f60:	4b0b      	ldr	r3, [pc, #44]	@ (1f90 <srand+0x48>)
    1f62:	2146      	movs	r1, #70	@ 0x46
    1f64:	480b      	ldr	r0, [pc, #44]	@ (1f94 <srand+0x4c>)
    1f66:	f7fe fa87 	bl	478 <__assert_func>
    1f6a:	490b      	ldr	r1, [pc, #44]	@ (1f98 <srand+0x50>)
    1f6c:	4b0b      	ldr	r3, [pc, #44]	@ (1f9c <srand+0x54>)
    1f6e:	e9c0 1300 	strd	r1, r3, [r0]
    1f72:	4b0b      	ldr	r3, [pc, #44]	@ (1fa0 <srand+0x58>)
    1f74:	2100      	movs	r1, #0
    1f76:	6083      	str	r3, [r0, #8]
    1f78:	230b      	movs	r3, #11
    1f7a:	8183      	strh	r3, [r0, #12]
    1f7c:	2001      	movs	r0, #1
    1f7e:	e9c2 0104 	strd	r0, r1, [r2, #16]
    1f82:	2300      	movs	r3, #0
    1f84:	6114      	str	r4, [r2, #16]
    1f86:	6153      	str	r3, [r2, #20]
    1f88:	bd38      	pop	{r3, r4, r5, pc}
    1f8a:	bf00      	nop
    1f8c:	20000020 	.word	0x20000020
    1f90:	00003305 	.word	0x00003305
    1f94:	0000331c 	.word	0x0000331c
    1f98:	abcd330e 	.word	0xabcd330e
    1f9c:	e66d1234 	.word	0xe66d1234
    1fa0:	0005deec 	.word	0x0005deec

00001fa4 <rand>:
    1fa4:	4b16      	ldr	r3, [pc, #88]	@ (2000 <DATA_FLASH_LENGTH>)
    1fa6:	b510      	push	{r4, lr}
    1fa8:	681c      	ldr	r4, [r3, #0]
    1faa:	6b22      	ldr	r2, [r4, #48]	@ 0x30
    1fac:	b9b2      	cbnz	r2, 1fdc <rand+0x38>
    1fae:	2018      	movs	r0, #24
    1fb0:	f000 faee 	bl	2590 <malloc>
    1fb4:	4602      	mov	r2, r0
    1fb6:	6320      	str	r0, [r4, #48]	@ 0x30
    1fb8:	b920      	cbnz	r0, 1fc4 <rand+0x20>
    1fba:	4b12      	ldr	r3, [pc, #72]	@ (2004 <DATA_FLASH_LENGTH+0x4>)
    1fbc:	2152      	movs	r1, #82	@ 0x52
    1fbe:	4812      	ldr	r0, [pc, #72]	@ (2008 <DATA_FLASH_LENGTH+0x8>)
    1fc0:	f7fe fa5a 	bl	478 <__assert_func>
    1fc4:	4911      	ldr	r1, [pc, #68]	@ (200c <DATA_FLASH_LENGTH+0xc>)
    1fc6:	4b12      	ldr	r3, [pc, #72]	@ (2010 <DATA_FLASH_LENGTH+0x10>)
    1fc8:	e9c0 1300 	strd	r1, r3, [r0]
    1fcc:	4b11      	ldr	r3, [pc, #68]	@ (2014 <DATA_FLASH_LENGTH+0x14>)
    1fce:	2100      	movs	r1, #0
    1fd0:	6083      	str	r3, [r0, #8]
    1fd2:	230b      	movs	r3, #11
    1fd4:	8183      	strh	r3, [r0, #12]
    1fd6:	2001      	movs	r0, #1
    1fd8:	e9c2 0104 	strd	r0, r1, [r2, #16]
    1fdc:	6913      	ldr	r3, [r2, #16]
    1fde:	480e      	ldr	r0, [pc, #56]	@ (2018 <DATA_FLASH_LENGTH+0x18>)
    1fe0:	6954      	ldr	r4, [r2, #20]
    1fe2:	490e      	ldr	r1, [pc, #56]	@ (201c <DATA_FLASH_LENGTH+0x1c>)
    1fe4:	4358      	muls	r0, r3
    1fe6:	fb01 0004 	mla	r0, r1, r4, r0
    1fea:	fba3 3101 	umull	r3, r1, r3, r1
    1fee:	3301      	adds	r3, #1
    1ff0:	eb40 0001 	adc.w	r0, r0, r1
    1ff4:	e9c2 3004 	strd	r3, r0, [r2, #16]
    1ff8:	f020 4000 	bic.w	r0, r0, #2147483648	@ 0x80000000
    1ffc:	bd10      	pop	{r4, pc}
    1ffe:	bf00      	nop
    2000:	20000020 	.word	0x20000020
    2004:	00003305 	.word	0x00003305
    2008:	0000331c 	.word	0x0000331c
    200c:	abcd330e 	.word	0xabcd330e
    2010:	e66d1234 	.word	0xe66d1234
    2014:	0005deec 	.word	0x0005deec
    2018:	5851f42d 	.word	0x5851f42d
    201c:	4c957f2d 	.word	0x4c957f2d

00002020 <std>:
    2020:	2300      	movs	r3, #0
    2022:	b510      	push	{r4, lr}
    2024:	4604      	mov	r4, r0
    2026:	6083      	str	r3, [r0, #8]
    2028:	8181      	strh	r1, [r0, #12]
    202a:	4619      	mov	r1, r3
    202c:	6643      	str	r3, [r0, #100]	@ 0x64
    202e:	81c2      	strh	r2, [r0, #14]
    2030:	2208      	movs	r2, #8
    2032:	6183      	str	r3, [r0, #24]
    2034:	e9c0 3300 	strd	r3, r3, [r0]
    2038:	e9c0 3304 	strd	r3, r3, [r0, #16]
    203c:	305c      	adds	r0, #92	@ 0x5c
    203e:	f000 f9f9 	bl	2434 <memset>
    2042:	4b0d      	ldr	r3, [pc, #52]	@ (2078 <std+0x58>)
    2044:	6224      	str	r4, [r4, #32]
    2046:	6263      	str	r3, [r4, #36]	@ 0x24
    2048:	4b0c      	ldr	r3, [pc, #48]	@ (207c <std+0x5c>)
    204a:	62a3      	str	r3, [r4, #40]	@ 0x28
    204c:	4b0c      	ldr	r3, [pc, #48]	@ (2080 <std+0x60>)
    204e:	62e3      	str	r3, [r4, #44]	@ 0x2c
    2050:	4b0c      	ldr	r3, [pc, #48]	@ (2084 <std+0x64>)
    2052:	6323      	str	r3, [r4, #48]	@ 0x30
    2054:	4b0c      	ldr	r3, [pc, #48]	@ (2088 <std+0x68>)
    2056:	429c      	cmp	r4, r3
    2058:	d006      	beq.n	2068 <std+0x48>
    205a:	f103 0268 	add.w	r2, r3, #104	@ 0x68
    205e:	4294      	cmp	r4, r2
    2060:	d002      	beq.n	2068 <std+0x48>
    2062:	33d0      	adds	r3, #208	@ 0xd0
    2064:	429c      	cmp	r4, r3
    2066:	d105      	bne.n	2074 <std+0x54>
    2068:	f104 0058 	add.w	r0, r4, #88	@ 0x58
    206c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    2070:	f000 ba34 	b.w	24dc <__retarget_lock_init_recursive>
    2074:	bd10      	pop	{r4, pc}
    2076:	bf00      	nop
    2078:	00002289 	.word	0x00002289
    207c:	000022ab 	.word	0x000022ab
    2080:	000022e3 	.word	0x000022e3
    2084:	00002309 	.word	0x00002309
    2088:	20000810 	.word	0x20000810

0000208c <stdio_exit_handler>:
    208c:	4a02      	ldr	r2, [pc, #8]	@ (2098 <stdio_exit_handler+0xc>)
    208e:	4903      	ldr	r1, [pc, #12]	@ (209c <stdio_exit_handler+0x10>)
    2090:	4803      	ldr	r0, [pc, #12]	@ (20a0 <stdio_exit_handler+0x14>)
    2092:	f000 b86b 	b.w	216c <_fwalk_sglue>
    2096:	bf00      	nop
    2098:	20000014 	.word	0x20000014
    209c:	00002da5 	.word	0x00002da5
    20a0:	20000024 	.word	0x20000024

000020a4 <cleanup_stdio>:
    20a4:	6841      	ldr	r1, [r0, #4]
    20a6:	4b0c      	ldr	r3, [pc, #48]	@ (20d8 <cleanup_stdio+0x34>)
    20a8:	4299      	cmp	r1, r3
    20aa:	b510      	push	{r4, lr}
    20ac:	4604      	mov	r4, r0
    20ae:	d001      	beq.n	20b4 <cleanup_stdio+0x10>
    20b0:	f000 fe78 	bl	2da4 <_fflush_r>
    20b4:	68a1      	ldr	r1, [r4, #8]
    20b6:	4b09      	ldr	r3, [pc, #36]	@ (20dc <cleanup_stdio+0x38>)
    20b8:	4299      	cmp	r1, r3
    20ba:	d002      	beq.n	20c2 <cleanup_stdio+0x1e>
    20bc:	4620      	mov	r0, r4
    20be:	f000 fe71 	bl	2da4 <_fflush_r>
    20c2:	68e1      	ldr	r1, [r4, #12]
    20c4:	4b06      	ldr	r3, [pc, #24]	@ (20e0 <cleanup_stdio+0x3c>)
    20c6:	4299      	cmp	r1, r3
    20c8:	d004      	beq.n	20d4 <cleanup_stdio+0x30>
    20ca:	4620      	mov	r0, r4
    20cc:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    20d0:	f000 be68 	b.w	2da4 <_fflush_r>
    20d4:	bd10      	pop	{r4, pc}
    20d6:	bf00      	nop
    20d8:	20000810 	.word	0x20000810
    20dc:	20000878 	.word	0x20000878
    20e0:	200008e0 	.word	0x200008e0

000020e4 <global_stdio_init.part.0>:
    20e4:	4b0c      	ldr	r3, [pc, #48]	@ (2118 <global_stdio_init.part.0+0x34>)
    20e6:	2104      	movs	r1, #4
    20e8:	4a0c      	ldr	r2, [pc, #48]	@ (211c <global_stdio_init.part.0+0x38>)
    20ea:	480d      	ldr	r0, [pc, #52]	@ (2120 <global_stdio_init.part.0+0x3c>)
    20ec:	b510      	push	{r4, lr}
    20ee:	601a      	str	r2, [r3, #0]
    20f0:	2200      	movs	r2, #0
    20f2:	f7ff ff95 	bl	2020 <std>
    20f6:	4b0a      	ldr	r3, [pc, #40]	@ (2120 <global_stdio_init.part.0+0x3c>)
    20f8:	2201      	movs	r2, #1
    20fa:	2109      	movs	r1, #9
    20fc:	461c      	mov	r4, r3
    20fe:	f103 0068 	add.w	r0, r3, #104	@ 0x68
    2102:	f7ff ff8d 	bl	2020 <std>
    2106:	2202      	movs	r2, #2
    2108:	f104 00d0 	add.w	r0, r4, #208	@ 0xd0
    210c:	2112      	movs	r1, #18
    210e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    2112:	f7ff bf85 	b.w	2020 <std>
    2116:	bf00      	nop
    2118:	20000948 	.word	0x20000948
    211c:	0000208d 	.word	0x0000208d
    2120:	20000810 	.word	0x20000810

00002124 <__sfp_lock_acquire>:
    2124:	4801      	ldr	r0, [pc, #4]	@ (212c <__sfp_lock_acquire+0x8>)
    2126:	f000 b9da 	b.w	24de <__retarget_lock_acquire_recursive>
    212a:	bf00      	nop
    212c:	20000951 	.word	0x20000951

00002130 <__sfp_lock_release>:
    2130:	4801      	ldr	r0, [pc, #4]	@ (2138 <__sfp_lock_release+0x8>)
    2132:	f000 b9d5 	b.w	24e0 <__retarget_lock_release_recursive>
    2136:	bf00      	nop
    2138:	20000951 	.word	0x20000951

0000213c <__sinit>:
    213c:	b510      	push	{r4, lr}
    213e:	4604      	mov	r4, r0
    2140:	f7ff fff0 	bl	2124 <__sfp_lock_acquire>
    2144:	6a23      	ldr	r3, [r4, #32]
    2146:	b11b      	cbz	r3, 2150 <__sinit+0x14>
    2148:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    214c:	f7ff bff0 	b.w	2130 <__sfp_lock_release>
    2150:	4b04      	ldr	r3, [pc, #16]	@ (2164 <__sinit+0x28>)
    2152:	6223      	str	r3, [r4, #32]
    2154:	4b04      	ldr	r3, [pc, #16]	@ (2168 <__sinit+0x2c>)
    2156:	681b      	ldr	r3, [r3, #0]
    2158:	2b00      	cmp	r3, #0
    215a:	d1f5      	bne.n	2148 <__sinit+0xc>
    215c:	f7ff ffc2 	bl	20e4 <global_stdio_init.part.0>
    2160:	e7f2      	b.n	2148 <__sinit+0xc>
    2162:	bf00      	nop
    2164:	000020a5 	.word	0x000020a5
    2168:	20000948 	.word	0x20000948

0000216c <_fwalk_sglue>:
    216c:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    2170:	4607      	mov	r7, r0
    2172:	4688      	mov	r8, r1
    2174:	4614      	mov	r4, r2
    2176:	2600      	movs	r6, #0
    2178:	e9d4 9501 	ldrd	r9, r5, [r4, #4]
    217c:	f1b9 0901 	subs.w	r9, r9, #1
    2180:	d505      	bpl.n	218e <_fwalk_sglue+0x22>
    2182:	6824      	ldr	r4, [r4, #0]
    2184:	2c00      	cmp	r4, #0
    2186:	d1f7      	bne.n	2178 <_fwalk_sglue+0xc>
    2188:	4630      	mov	r0, r6
    218a:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    218e:	89ab      	ldrh	r3, [r5, #12]
    2190:	2b01      	cmp	r3, #1
    2192:	d907      	bls.n	21a4 <_fwalk_sglue+0x38>
    2194:	f9b5 300e 	ldrsh.w	r3, [r5, #14]
    2198:	3301      	adds	r3, #1
    219a:	d003      	beq.n	21a4 <_fwalk_sglue+0x38>
    219c:	4629      	mov	r1, r5
    219e:	4638      	mov	r0, r7
    21a0:	47c0      	blx	r8
    21a2:	4306      	orrs	r6, r0
    21a4:	3568      	adds	r5, #104	@ 0x68
    21a6:	e7e9      	b.n	217c <_fwalk_sglue+0x10>

000021a8 <iprintf>:
    21a8:	b40f      	push	{r0, r1, r2, r3}
    21aa:	b507      	push	{r0, r1, r2, lr}
    21ac:	4906      	ldr	r1, [pc, #24]	@ (21c8 <iprintf+0x20>)
    21ae:	ab04      	add	r3, sp, #16
    21b0:	6808      	ldr	r0, [r1, #0]
    21b2:	f853 2b04 	ldr.w	r2, [r3], #4
    21b6:	6881      	ldr	r1, [r0, #8]
    21b8:	9301      	str	r3, [sp, #4]
    21ba:	f000 fac9 	bl	2750 <_vfiprintf_r>
    21be:	b003      	add	sp, #12
    21c0:	f85d eb04 	ldr.w	lr, [sp], #4
    21c4:	b004      	add	sp, #16
    21c6:	4770      	bx	lr
    21c8:	20000020 	.word	0x20000020

000021cc <_puts_r>:
    21cc:	6a03      	ldr	r3, [r0, #32]
    21ce:	b570      	push	{r4, r5, r6, lr}
    21d0:	4605      	mov	r5, r0
    21d2:	460e      	mov	r6, r1
    21d4:	6884      	ldr	r4, [r0, #8]
    21d6:	b90b      	cbnz	r3, 21dc <_puts_r+0x10>
    21d8:	f7ff ffb0 	bl	213c <__sinit>
    21dc:	6e63      	ldr	r3, [r4, #100]	@ 0x64
    21de:	07db      	lsls	r3, r3, #31
    21e0:	d405      	bmi.n	21ee <_puts_r+0x22>
    21e2:	89a3      	ldrh	r3, [r4, #12]
    21e4:	0598      	lsls	r0, r3, #22
    21e6:	d402      	bmi.n	21ee <_puts_r+0x22>
    21e8:	6da0      	ldr	r0, [r4, #88]	@ 0x58
    21ea:	f000 f978 	bl	24de <__retarget_lock_acquire_recursive>
    21ee:	89a3      	ldrh	r3, [r4, #12]
    21f0:	0719      	lsls	r1, r3, #28
    21f2:	d502      	bpl.n	21fa <_puts_r+0x2e>
    21f4:	6923      	ldr	r3, [r4, #16]
    21f6:	2b00      	cmp	r3, #0
    21f8:	d135      	bne.n	2266 <_puts_r+0x9a>
    21fa:	4621      	mov	r1, r4
    21fc:	4628      	mov	r0, r5
    21fe:	f000 f8c5 	bl	238c <__swsetup_r>
    2202:	b380      	cbz	r0, 2266 <_puts_r+0x9a>
    2204:	f04f 35ff 	mov.w	r5, #4294967295	@ 0xffffffff
    2208:	6e63      	ldr	r3, [r4, #100]	@ 0x64
    220a:	07da      	lsls	r2, r3, #31
    220c:	d405      	bmi.n	221a <_puts_r+0x4e>
    220e:	89a3      	ldrh	r3, [r4, #12]
    2210:	059b      	lsls	r3, r3, #22
    2212:	d402      	bmi.n	221a <_puts_r+0x4e>
    2214:	6da0      	ldr	r0, [r4, #88]	@ 0x58
    2216:	f000 f963 	bl	24e0 <__retarget_lock_release_recursive>
    221a:	4628      	mov	r0, r5
    221c:	bd70      	pop	{r4, r5, r6, pc}
    221e:	2b00      	cmp	r3, #0
    2220:	da04      	bge.n	222c <_puts_r+0x60>
    2222:	69a2      	ldr	r2, [r4, #24]
    2224:	4293      	cmp	r3, r2
    2226:	db17      	blt.n	2258 <_puts_r+0x8c>
    2228:	290a      	cmp	r1, #10
    222a:	d015      	beq.n	2258 <_puts_r+0x8c>
    222c:	6823      	ldr	r3, [r4, #0]
    222e:	1c5a      	adds	r2, r3, #1
    2230:	6022      	str	r2, [r4, #0]
    2232:	7019      	strb	r1, [r3, #0]
    2234:	68a3      	ldr	r3, [r4, #8]
    2236:	f816 1f01 	ldrb.w	r1, [r6, #1]!
    223a:	3b01      	subs	r3, #1
    223c:	60a3      	str	r3, [r4, #8]
    223e:	2900      	cmp	r1, #0
    2240:	d1ed      	bne.n	221e <_puts_r+0x52>
    2242:	2b00      	cmp	r3, #0
    2244:	da11      	bge.n	226a <_puts_r+0x9e>
    2246:	4622      	mov	r2, r4
    2248:	210a      	movs	r1, #10
    224a:	4628      	mov	r0, r5
    224c:	f000 f860 	bl	2310 <__swbuf_r>
    2250:	3001      	adds	r0, #1
    2252:	d0d7      	beq.n	2204 <_puts_r+0x38>
    2254:	250a      	movs	r5, #10
    2256:	e7d7      	b.n	2208 <_puts_r+0x3c>
    2258:	4622      	mov	r2, r4
    225a:	4628      	mov	r0, r5
    225c:	f000 f858 	bl	2310 <__swbuf_r>
    2260:	3001      	adds	r0, #1
    2262:	d1e7      	bne.n	2234 <_puts_r+0x68>
    2264:	e7ce      	b.n	2204 <_puts_r+0x38>
    2266:	3e01      	subs	r6, #1
    2268:	e7e4      	b.n	2234 <_puts_r+0x68>
    226a:	6823      	ldr	r3, [r4, #0]
    226c:	1c5a      	adds	r2, r3, #1
    226e:	6022      	str	r2, [r4, #0]
    2270:	220a      	movs	r2, #10
    2272:	701a      	strb	r2, [r3, #0]
    2274:	e7ee      	b.n	2254 <_puts_r+0x88>
	...

00002278 <puts>:
    2278:	4b02      	ldr	r3, [pc, #8]	@ (2284 <puts+0xc>)
    227a:	4601      	mov	r1, r0
    227c:	6818      	ldr	r0, [r3, #0]
    227e:	f7ff bfa5 	b.w	21cc <_puts_r>
    2282:	bf00      	nop
    2284:	20000020 	.word	0x20000020

00002288 <__sread>:
    2288:	b510      	push	{r4, lr}
    228a:	460c      	mov	r4, r1
    228c:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    2290:	f000 f8fa 	bl	2488 <_read_r>
    2294:	2800      	cmp	r0, #0
    2296:	bfab      	itete	ge
    2298:	6d63      	ldrge	r3, [r4, #84]	@ 0x54
    229a:	89a3      	ldrhlt	r3, [r4, #12]
    229c:	181b      	addge	r3, r3, r0
    229e:	f423 5380 	biclt.w	r3, r3, #4096	@ 0x1000
    22a2:	bfac      	ite	ge
    22a4:	6563      	strge	r3, [r4, #84]	@ 0x54
    22a6:	81a3      	strhlt	r3, [r4, #12]
    22a8:	bd10      	pop	{r4, pc}

000022aa <__swrite>:
    22aa:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    22ae:	461f      	mov	r7, r3
    22b0:	898b      	ldrh	r3, [r1, #12]
    22b2:	4605      	mov	r5, r0
    22b4:	460c      	mov	r4, r1
    22b6:	05db      	lsls	r3, r3, #23
    22b8:	4616      	mov	r6, r2
    22ba:	d505      	bpl.n	22c8 <__swrite+0x1e>
    22bc:	2302      	movs	r3, #2
    22be:	2200      	movs	r2, #0
    22c0:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    22c4:	f000 f8ce 	bl	2464 <_lseek_r>
    22c8:	89a3      	ldrh	r3, [r4, #12]
    22ca:	4632      	mov	r2, r6
    22cc:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
    22d0:	4628      	mov	r0, r5
    22d2:	f423 5380 	bic.w	r3, r3, #4096	@ 0x1000
    22d6:	81a3      	strh	r3, [r4, #12]
    22d8:	463b      	mov	r3, r7
    22da:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    22de:	f000 b8e5 	b.w	24ac <_write_r>

000022e2 <__sseek>:
    22e2:	b510      	push	{r4, lr}
    22e4:	460c      	mov	r4, r1
    22e6:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    22ea:	f000 f8bb 	bl	2464 <_lseek_r>
    22ee:	1c42      	adds	r2, r0, #1
    22f0:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    22f4:	bf15      	itete	ne
    22f6:	6560      	strne	r0, [r4, #84]	@ 0x54
    22f8:	f423 5380 	biceq.w	r3, r3, #4096	@ 0x1000
    22fc:	f443 5380 	orrne.w	r3, r3, #4096	@ 0x1000
    2300:	81a3      	strheq	r3, [r4, #12]
    2302:	bf18      	it	ne
    2304:	81a3      	strhne	r3, [r4, #12]
    2306:	bd10      	pop	{r4, pc}

00002308 <__sclose>:
    2308:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    230c:	f000 b89a 	b.w	2444 <_close_r>

00002310 <__swbuf_r>:
    2310:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    2312:	460e      	mov	r6, r1
    2314:	4614      	mov	r4, r2
    2316:	4605      	mov	r5, r0
    2318:	b118      	cbz	r0, 2322 <__swbuf_r+0x12>
    231a:	6a03      	ldr	r3, [r0, #32]
    231c:	b90b      	cbnz	r3, 2322 <__swbuf_r+0x12>
    231e:	f7ff ff0d 	bl	213c <__sinit>
    2322:	69a3      	ldr	r3, [r4, #24]
    2324:	60a3      	str	r3, [r4, #8]
    2326:	89a3      	ldrh	r3, [r4, #12]
    2328:	071a      	lsls	r2, r3, #28
    232a:	d501      	bpl.n	2330 <__swbuf_r+0x20>
    232c:	6923      	ldr	r3, [r4, #16]
    232e:	b943      	cbnz	r3, 2342 <__swbuf_r+0x32>
    2330:	4621      	mov	r1, r4
    2332:	4628      	mov	r0, r5
    2334:	f000 f82a 	bl	238c <__swsetup_r>
    2338:	b118      	cbz	r0, 2342 <__swbuf_r+0x32>
    233a:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
    233e:	4638      	mov	r0, r7
    2340:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    2342:	6823      	ldr	r3, [r4, #0]
    2344:	b2f6      	uxtb	r6, r6
    2346:	6922      	ldr	r2, [r4, #16]
    2348:	4637      	mov	r7, r6
    234a:	1a98      	subs	r0, r3, r2
    234c:	6963      	ldr	r3, [r4, #20]
    234e:	4283      	cmp	r3, r0
    2350:	dc05      	bgt.n	235e <__swbuf_r+0x4e>
    2352:	4621      	mov	r1, r4
    2354:	4628      	mov	r0, r5
    2356:	f000 fd25 	bl	2da4 <_fflush_r>
    235a:	2800      	cmp	r0, #0
    235c:	d1ed      	bne.n	233a <__swbuf_r+0x2a>
    235e:	68a3      	ldr	r3, [r4, #8]
    2360:	3b01      	subs	r3, #1
    2362:	60a3      	str	r3, [r4, #8]
    2364:	6823      	ldr	r3, [r4, #0]
    2366:	1c5a      	adds	r2, r3, #1
    2368:	6022      	str	r2, [r4, #0]
    236a:	701e      	strb	r6, [r3, #0]
    236c:	1c43      	adds	r3, r0, #1
    236e:	6962      	ldr	r2, [r4, #20]
    2370:	429a      	cmp	r2, r3
    2372:	d004      	beq.n	237e <__swbuf_r+0x6e>
    2374:	89a3      	ldrh	r3, [r4, #12]
    2376:	07db      	lsls	r3, r3, #31
    2378:	d5e1      	bpl.n	233e <__swbuf_r+0x2e>
    237a:	2e0a      	cmp	r6, #10
    237c:	d1df      	bne.n	233e <__swbuf_r+0x2e>
    237e:	4621      	mov	r1, r4
    2380:	4628      	mov	r0, r5
    2382:	f000 fd0f 	bl	2da4 <_fflush_r>
    2386:	2800      	cmp	r0, #0
    2388:	d0d9      	beq.n	233e <__swbuf_r+0x2e>
    238a:	e7d6      	b.n	233a <__swbuf_r+0x2a>

0000238c <__swsetup_r>:
    238c:	b538      	push	{r3, r4, r5, lr}
    238e:	4b28      	ldr	r3, [pc, #160]	@ (2430 <__swsetup_r+0xa4>)
    2390:	4605      	mov	r5, r0
    2392:	460c      	mov	r4, r1
    2394:	6818      	ldr	r0, [r3, #0]
    2396:	b118      	cbz	r0, 23a0 <__swsetup_r+0x14>
    2398:	6a03      	ldr	r3, [r0, #32]
    239a:	b90b      	cbnz	r3, 23a0 <__swsetup_r+0x14>
    239c:	f7ff fece 	bl	213c <__sinit>
    23a0:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    23a4:	0719      	lsls	r1, r3, #28
    23a6:	d421      	bmi.n	23ec <__swsetup_r+0x60>
    23a8:	06da      	lsls	r2, r3, #27
    23aa:	d407      	bmi.n	23bc <__swsetup_r+0x30>
    23ac:	2209      	movs	r2, #9
    23ae:	602a      	str	r2, [r5, #0]
    23b0:	f043 0340 	orr.w	r3, r3, #64	@ 0x40
    23b4:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    23b8:	81a3      	strh	r3, [r4, #12]
    23ba:	e031      	b.n	2420 <__swsetup_r+0x94>
    23bc:	0758      	lsls	r0, r3, #29
    23be:	d512      	bpl.n	23e6 <__swsetup_r+0x5a>
    23c0:	6b61      	ldr	r1, [r4, #52]	@ 0x34
    23c2:	b141      	cbz	r1, 23d6 <__swsetup_r+0x4a>
    23c4:	f104 0344 	add.w	r3, r4, #68	@ 0x44
    23c8:	4299      	cmp	r1, r3
    23ca:	d002      	beq.n	23d2 <__swsetup_r+0x46>
    23cc:	4628      	mov	r0, r5
    23ce:	f000 f895 	bl	24fc <_free_r>
    23d2:	2300      	movs	r3, #0
    23d4:	6363      	str	r3, [r4, #52]	@ 0x34
    23d6:	2200      	movs	r2, #0
    23d8:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    23dc:	6062      	str	r2, [r4, #4]
    23de:	f023 0324 	bic.w	r3, r3, #36	@ 0x24
    23e2:	6922      	ldr	r2, [r4, #16]
    23e4:	6022      	str	r2, [r4, #0]
    23e6:	f043 0308 	orr.w	r3, r3, #8
    23ea:	81a3      	strh	r3, [r4, #12]
    23ec:	6922      	ldr	r2, [r4, #16]
    23ee:	b942      	cbnz	r2, 2402 <__swsetup_r+0x76>
    23f0:	f403 7320 	and.w	r3, r3, #640	@ 0x280
    23f4:	f5b3 7f00 	cmp.w	r3, #512	@ 0x200
    23f8:	d003      	beq.n	2402 <__swsetup_r+0x76>
    23fa:	4621      	mov	r1, r4
    23fc:	4628      	mov	r0, r5
    23fe:	f000 fd1d 	bl	2e3c <__smakebuf_r>
    2402:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    2406:	f013 0201 	ands.w	r2, r3, #1
    240a:	d00a      	beq.n	2422 <__swsetup_r+0x96>
    240c:	2200      	movs	r2, #0
    240e:	60a2      	str	r2, [r4, #8]
    2410:	6962      	ldr	r2, [r4, #20]
    2412:	4252      	negs	r2, r2
    2414:	61a2      	str	r2, [r4, #24]
    2416:	6922      	ldr	r2, [r4, #16]
    2418:	b942      	cbnz	r2, 242c <__swsetup_r+0xa0>
    241a:	f013 0080 	ands.w	r0, r3, #128	@ 0x80
    241e:	d1c7      	bne.n	23b0 <__swsetup_r+0x24>
    2420:	bd38      	pop	{r3, r4, r5, pc}
    2422:	0799      	lsls	r1, r3, #30
    2424:	bf58      	it	pl
    2426:	6962      	ldrpl	r2, [r4, #20]
    2428:	60a2      	str	r2, [r4, #8]
    242a:	e7f4      	b.n	2416 <__swsetup_r+0x8a>
    242c:	2000      	movs	r0, #0
    242e:	e7f7      	b.n	2420 <__swsetup_r+0x94>
    2430:	20000020 	.word	0x20000020

00002434 <memset>:
    2434:	4402      	add	r2, r0
    2436:	4603      	mov	r3, r0
    2438:	4293      	cmp	r3, r2
    243a:	d100      	bne.n	243e <memset+0xa>
    243c:	4770      	bx	lr
    243e:	f803 1b01 	strb.w	r1, [r3], #1
    2442:	e7f9      	b.n	2438 <memset+0x4>

00002444 <_close_r>:
    2444:	b538      	push	{r3, r4, r5, lr}
    2446:	2300      	movs	r3, #0
    2448:	4d05      	ldr	r5, [pc, #20]	@ (2460 <_close_r+0x1c>)
    244a:	4604      	mov	r4, r0
    244c:	4608      	mov	r0, r1
    244e:	602b      	str	r3, [r5, #0]
    2450:	f7ff fc66 	bl	1d20 <_close>
    2454:	1c43      	adds	r3, r0, #1
    2456:	d102      	bne.n	245e <_close_r+0x1a>
    2458:	682b      	ldr	r3, [r5, #0]
    245a:	b103      	cbz	r3, 245e <_close_r+0x1a>
    245c:	6023      	str	r3, [r4, #0]
    245e:	bd38      	pop	{r3, r4, r5, pc}
    2460:	2000094c 	.word	0x2000094c

00002464 <_lseek_r>:
    2464:	b538      	push	{r3, r4, r5, lr}
    2466:	4604      	mov	r4, r0
    2468:	4d06      	ldr	r5, [pc, #24]	@ (2484 <_lseek_r+0x20>)
    246a:	4608      	mov	r0, r1
    246c:	4611      	mov	r1, r2
    246e:	2200      	movs	r2, #0
    2470:	602a      	str	r2, [r5, #0]
    2472:	461a      	mov	r2, r3
    2474:	f7ff fc5e 	bl	1d34 <_lseek>
    2478:	1c43      	adds	r3, r0, #1
    247a:	d102      	bne.n	2482 <_lseek_r+0x1e>
    247c:	682b      	ldr	r3, [r5, #0]
    247e:	b103      	cbz	r3, 2482 <_lseek_r+0x1e>
    2480:	6023      	str	r3, [r4, #0]
    2482:	bd38      	pop	{r3, r4, r5, pc}
    2484:	2000094c 	.word	0x2000094c

00002488 <_read_r>:
    2488:	b538      	push	{r3, r4, r5, lr}
    248a:	4604      	mov	r4, r0
    248c:	4d06      	ldr	r5, [pc, #24]	@ (24a8 <_read_r+0x20>)
    248e:	4608      	mov	r0, r1
    2490:	4611      	mov	r1, r2
    2492:	2200      	movs	r2, #0
    2494:	602a      	str	r2, [r5, #0]
    2496:	461a      	mov	r2, r3
    2498:	f7ff fbfa 	bl	1c90 <_read>
    249c:	1c43      	adds	r3, r0, #1
    249e:	d102      	bne.n	24a6 <_read_r+0x1e>
    24a0:	682b      	ldr	r3, [r5, #0]
    24a2:	b103      	cbz	r3, 24a6 <_read_r+0x1e>
    24a4:	6023      	str	r3, [r4, #0]
    24a6:	bd38      	pop	{r3, r4, r5, pc}
    24a8:	2000094c 	.word	0x2000094c

000024ac <_write_r>:
    24ac:	b538      	push	{r3, r4, r5, lr}
    24ae:	4604      	mov	r4, r0
    24b0:	4d06      	ldr	r5, [pc, #24]	@ (24cc <_write_r+0x20>)
    24b2:	4608      	mov	r0, r1
    24b4:	4611      	mov	r1, r2
    24b6:	2200      	movs	r2, #0
    24b8:	602a      	str	r2, [r5, #0]
    24ba:	461a      	mov	r2, r3
    24bc:	f7ff fbc4 	bl	1c48 <_write>
    24c0:	1c43      	adds	r3, r0, #1
    24c2:	d102      	bne.n	24ca <_write_r+0x1e>
    24c4:	682b      	ldr	r3, [r5, #0]
    24c6:	b103      	cbz	r3, 24ca <_write_r+0x1e>
    24c8:	6023      	str	r3, [r4, #0]
    24ca:	bd38      	pop	{r3, r4, r5, pc}
    24cc:	2000094c 	.word	0x2000094c

000024d0 <__errno>:
    24d0:	4b01      	ldr	r3, [pc, #4]	@ (24d8 <__errno+0x8>)
    24d2:	6818      	ldr	r0, [r3, #0]
    24d4:	4770      	bx	lr
    24d6:	bf00      	nop
    24d8:	20000020 	.word	0x20000020

000024dc <__retarget_lock_init_recursive>:
    24dc:	4770      	bx	lr

000024de <__retarget_lock_acquire_recursive>:
    24de:	4770      	bx	lr

000024e0 <__retarget_lock_release_recursive>:
    24e0:	4770      	bx	lr

000024e2 <memcpy>:
    24e2:	440a      	add	r2, r1
    24e4:	1e43      	subs	r3, r0, #1
    24e6:	4291      	cmp	r1, r2
    24e8:	d100      	bne.n	24ec <memcpy+0xa>
    24ea:	4770      	bx	lr
    24ec:	b510      	push	{r4, lr}
    24ee:	f811 4b01 	ldrb.w	r4, [r1], #1
    24f2:	4291      	cmp	r1, r2
    24f4:	f803 4f01 	strb.w	r4, [r3, #1]!
    24f8:	d1f9      	bne.n	24ee <memcpy+0xc>
    24fa:	bd10      	pop	{r4, pc}

000024fc <_free_r>:
    24fc:	b538      	push	{r3, r4, r5, lr}
    24fe:	4605      	mov	r5, r0
    2500:	2900      	cmp	r1, #0
    2502:	d041      	beq.n	2588 <_free_r+0x8c>
    2504:	f851 3c04 	ldr.w	r3, [r1, #-4]
    2508:	1f0c      	subs	r4, r1, #4
    250a:	2b00      	cmp	r3, #0
    250c:	bfb8      	it	lt
    250e:	18e4      	addlt	r4, r4, r3
    2510:	f000 f8e8 	bl	26e4 <__malloc_lock>
    2514:	4a1d      	ldr	r2, [pc, #116]	@ (258c <_free_r+0x90>)
    2516:	6813      	ldr	r3, [r2, #0]
    2518:	b933      	cbnz	r3, 2528 <_free_r+0x2c>
    251a:	6063      	str	r3, [r4, #4]
    251c:	6014      	str	r4, [r2, #0]
    251e:	4628      	mov	r0, r5
    2520:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    2524:	f000 b8e4 	b.w	26f0 <__malloc_unlock>
    2528:	42a3      	cmp	r3, r4
    252a:	d908      	bls.n	253e <_free_r+0x42>
    252c:	6820      	ldr	r0, [r4, #0]
    252e:	1821      	adds	r1, r4, r0
    2530:	428b      	cmp	r3, r1
    2532:	bf01      	itttt	eq
    2534:	6819      	ldreq	r1, [r3, #0]
    2536:	685b      	ldreq	r3, [r3, #4]
    2538:	1809      	addeq	r1, r1, r0
    253a:	6021      	streq	r1, [r4, #0]
    253c:	e7ed      	b.n	251a <_free_r+0x1e>
    253e:	461a      	mov	r2, r3
    2540:	685b      	ldr	r3, [r3, #4]
    2542:	b10b      	cbz	r3, 2548 <_free_r+0x4c>
    2544:	42a3      	cmp	r3, r4
    2546:	d9fa      	bls.n	253e <_free_r+0x42>
    2548:	6811      	ldr	r1, [r2, #0]
    254a:	1850      	adds	r0, r2, r1
    254c:	42a0      	cmp	r0, r4
    254e:	d10b      	bne.n	2568 <_free_r+0x6c>
    2550:	6820      	ldr	r0, [r4, #0]
    2552:	4401      	add	r1, r0
    2554:	1850      	adds	r0, r2, r1
    2556:	6011      	str	r1, [r2, #0]
    2558:	4283      	cmp	r3, r0
    255a:	d1e0      	bne.n	251e <_free_r+0x22>
    255c:	6818      	ldr	r0, [r3, #0]
    255e:	685b      	ldr	r3, [r3, #4]
    2560:	4408      	add	r0, r1
    2562:	6053      	str	r3, [r2, #4]
    2564:	6010      	str	r0, [r2, #0]
    2566:	e7da      	b.n	251e <_free_r+0x22>
    2568:	d902      	bls.n	2570 <_free_r+0x74>
    256a:	230c      	movs	r3, #12
    256c:	602b      	str	r3, [r5, #0]
    256e:	e7d6      	b.n	251e <_free_r+0x22>
    2570:	6820      	ldr	r0, [r4, #0]
    2572:	1821      	adds	r1, r4, r0
    2574:	428b      	cmp	r3, r1
    2576:	bf02      	ittt	eq
    2578:	6819      	ldreq	r1, [r3, #0]
    257a:	685b      	ldreq	r3, [r3, #4]
    257c:	1809      	addeq	r1, r1, r0
    257e:	6063      	str	r3, [r4, #4]
    2580:	bf08      	it	eq
    2582:	6021      	streq	r1, [r4, #0]
    2584:	6054      	str	r4, [r2, #4]
    2586:	e7ca      	b.n	251e <_free_r+0x22>
    2588:	bd38      	pop	{r3, r4, r5, pc}
    258a:	bf00      	nop
    258c:	20000958 	.word	0x20000958

00002590 <malloc>:
    2590:	4b02      	ldr	r3, [pc, #8]	@ (259c <malloc+0xc>)
    2592:	4601      	mov	r1, r0
    2594:	6818      	ldr	r0, [r3, #0]
    2596:	f000 b825 	b.w	25e4 <_malloc_r>
    259a:	bf00      	nop
    259c:	20000020 	.word	0x20000020

000025a0 <sbrk_aligned>:
    25a0:	b570      	push	{r4, r5, r6, lr}
    25a2:	4e0f      	ldr	r6, [pc, #60]	@ (25e0 <sbrk_aligned+0x40>)
    25a4:	460c      	mov	r4, r1
    25a6:	4605      	mov	r5, r0
    25a8:	6831      	ldr	r1, [r6, #0]
    25aa:	b911      	cbnz	r1, 25b2 <sbrk_aligned+0x12>
    25ac:	f000 fca2 	bl	2ef4 <_sbrk_r>
    25b0:	6030      	str	r0, [r6, #0]
    25b2:	4621      	mov	r1, r4
    25b4:	4628      	mov	r0, r5
    25b6:	f000 fc9d 	bl	2ef4 <_sbrk_r>
    25ba:	1c43      	adds	r3, r0, #1
    25bc:	d103      	bne.n	25c6 <sbrk_aligned+0x26>
    25be:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
    25c2:	4620      	mov	r0, r4
    25c4:	bd70      	pop	{r4, r5, r6, pc}
    25c6:	1cc4      	adds	r4, r0, #3
    25c8:	f024 0403 	bic.w	r4, r4, #3
    25cc:	42a0      	cmp	r0, r4
    25ce:	d0f8      	beq.n	25c2 <sbrk_aligned+0x22>
    25d0:	1a21      	subs	r1, r4, r0
    25d2:	4628      	mov	r0, r5
    25d4:	f000 fc8e 	bl	2ef4 <_sbrk_r>
    25d8:	3001      	adds	r0, #1
    25da:	d1f2      	bne.n	25c2 <sbrk_aligned+0x22>
    25dc:	e7ef      	b.n	25be <sbrk_aligned+0x1e>
    25de:	bf00      	nop
    25e0:	20000954 	.word	0x20000954

000025e4 <_malloc_r>:
    25e4:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    25e8:	1ccd      	adds	r5, r1, #3
    25ea:	4606      	mov	r6, r0
    25ec:	f025 0503 	bic.w	r5, r5, #3
    25f0:	3508      	adds	r5, #8
    25f2:	2d0c      	cmp	r5, #12
    25f4:	bf38      	it	cc
    25f6:	250c      	movcc	r5, #12
    25f8:	2d00      	cmp	r5, #0
    25fa:	db01      	blt.n	2600 <_malloc_r+0x1c>
    25fc:	42a9      	cmp	r1, r5
    25fe:	d904      	bls.n	260a <_malloc_r+0x26>
    2600:	230c      	movs	r3, #12
    2602:	6033      	str	r3, [r6, #0]
    2604:	2000      	movs	r0, #0
    2606:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    260a:	f8df 80d4 	ldr.w	r8, [pc, #212]	@ 26e0 <_malloc_r+0xfc>
    260e:	f000 f869 	bl	26e4 <__malloc_lock>
    2612:	f8d8 3000 	ldr.w	r3, [r8]
    2616:	461c      	mov	r4, r3
    2618:	bb44      	cbnz	r4, 266c <_malloc_r+0x88>
    261a:	4629      	mov	r1, r5
    261c:	4630      	mov	r0, r6
    261e:	f7ff ffbf 	bl	25a0 <sbrk_aligned>
    2622:	1c43      	adds	r3, r0, #1
    2624:	4604      	mov	r4, r0
    2626:	d158      	bne.n	26da <_malloc_r+0xf6>
    2628:	f8d8 4000 	ldr.w	r4, [r8]
    262c:	4627      	mov	r7, r4
    262e:	2f00      	cmp	r7, #0
    2630:	d143      	bne.n	26ba <_malloc_r+0xd6>
    2632:	2c00      	cmp	r4, #0
    2634:	d04b      	beq.n	26ce <_malloc_r+0xea>
    2636:	6823      	ldr	r3, [r4, #0]
    2638:	4639      	mov	r1, r7
    263a:	4630      	mov	r0, r6
    263c:	eb04 0903 	add.w	r9, r4, r3
    2640:	f000 fc58 	bl	2ef4 <_sbrk_r>
    2644:	4581      	cmp	r9, r0
    2646:	d142      	bne.n	26ce <_malloc_r+0xea>
    2648:	6821      	ldr	r1, [r4, #0]
    264a:	4630      	mov	r0, r6
    264c:	1a6d      	subs	r5, r5, r1
    264e:	4629      	mov	r1, r5
    2650:	f7ff ffa6 	bl	25a0 <sbrk_aligned>
    2654:	3001      	adds	r0, #1
    2656:	d03a      	beq.n	26ce <_malloc_r+0xea>
    2658:	6823      	ldr	r3, [r4, #0]
    265a:	442b      	add	r3, r5
    265c:	6023      	str	r3, [r4, #0]
    265e:	f8d8 3000 	ldr.w	r3, [r8]
    2662:	685a      	ldr	r2, [r3, #4]
    2664:	bb62      	cbnz	r2, 26c0 <_malloc_r+0xdc>
    2666:	f8c8 7000 	str.w	r7, [r8]
    266a:	e00f      	b.n	268c <_malloc_r+0xa8>
    266c:	6822      	ldr	r2, [r4, #0]
    266e:	1b52      	subs	r2, r2, r5
    2670:	d420      	bmi.n	26b4 <_malloc_r+0xd0>
    2672:	2a0b      	cmp	r2, #11
    2674:	d917      	bls.n	26a6 <_malloc_r+0xc2>
    2676:	1961      	adds	r1, r4, r5
    2678:	42a3      	cmp	r3, r4
    267a:	6025      	str	r5, [r4, #0]
    267c:	bf18      	it	ne
    267e:	6059      	strne	r1, [r3, #4]
    2680:	6863      	ldr	r3, [r4, #4]
    2682:	bf08      	it	eq
    2684:	f8c8 1000 	streq.w	r1, [r8]
    2688:	5162      	str	r2, [r4, r5]
    268a:	604b      	str	r3, [r1, #4]
    268c:	4630      	mov	r0, r6
    268e:	f000 f82f 	bl	26f0 <__malloc_unlock>
    2692:	f104 000b 	add.w	r0, r4, #11
    2696:	1d23      	adds	r3, r4, #4
    2698:	f020 0007 	bic.w	r0, r0, #7
    269c:	1ac2      	subs	r2, r0, r3
    269e:	bf1c      	itt	ne
    26a0:	1a1b      	subne	r3, r3, r0
    26a2:	50a3      	strne	r3, [r4, r2]
    26a4:	e7af      	b.n	2606 <_malloc_r+0x22>
    26a6:	6862      	ldr	r2, [r4, #4]
    26a8:	42a3      	cmp	r3, r4
    26aa:	bf0c      	ite	eq
    26ac:	f8c8 2000 	streq.w	r2, [r8]
    26b0:	605a      	strne	r2, [r3, #4]
    26b2:	e7eb      	b.n	268c <_malloc_r+0xa8>
    26b4:	4623      	mov	r3, r4
    26b6:	6864      	ldr	r4, [r4, #4]
    26b8:	e7ae      	b.n	2618 <_malloc_r+0x34>
    26ba:	463c      	mov	r4, r7
    26bc:	687f      	ldr	r7, [r7, #4]
    26be:	e7b6      	b.n	262e <_malloc_r+0x4a>
    26c0:	461a      	mov	r2, r3
    26c2:	685b      	ldr	r3, [r3, #4]
    26c4:	42a3      	cmp	r3, r4
    26c6:	d1fb      	bne.n	26c0 <_malloc_r+0xdc>
    26c8:	2300      	movs	r3, #0
    26ca:	6053      	str	r3, [r2, #4]
    26cc:	e7de      	b.n	268c <_malloc_r+0xa8>
    26ce:	230c      	movs	r3, #12
    26d0:	4630      	mov	r0, r6
    26d2:	6033      	str	r3, [r6, #0]
    26d4:	f000 f80c 	bl	26f0 <__malloc_unlock>
    26d8:	e794      	b.n	2604 <_malloc_r+0x20>
    26da:	6005      	str	r5, [r0, #0]
    26dc:	e7d6      	b.n	268c <_malloc_r+0xa8>
    26de:	bf00      	nop
    26e0:	20000958 	.word	0x20000958

000026e4 <__malloc_lock>:
    26e4:	4801      	ldr	r0, [pc, #4]	@ (26ec <__malloc_lock+0x8>)
    26e6:	f7ff befa 	b.w	24de <__retarget_lock_acquire_recursive>
    26ea:	bf00      	nop
    26ec:	20000950 	.word	0x20000950

000026f0 <__malloc_unlock>:
    26f0:	4801      	ldr	r0, [pc, #4]	@ (26f8 <__malloc_unlock+0x8>)
    26f2:	f7ff bef5 	b.w	24e0 <__retarget_lock_release_recursive>
    26f6:	bf00      	nop
    26f8:	20000950 	.word	0x20000950

000026fc <__sfputc_r>:
    26fc:	6893      	ldr	r3, [r2, #8]
    26fe:	3b01      	subs	r3, #1
    2700:	2b00      	cmp	r3, #0
    2702:	b410      	push	{r4}
    2704:	6093      	str	r3, [r2, #8]
    2706:	da08      	bge.n	271a <__sfputc_r+0x1e>
    2708:	6994      	ldr	r4, [r2, #24]
    270a:	42a3      	cmp	r3, r4
    270c:	db01      	blt.n	2712 <__sfputc_r+0x16>
    270e:	290a      	cmp	r1, #10
    2710:	d103      	bne.n	271a <__sfputc_r+0x1e>
    2712:	f85d 4b04 	ldr.w	r4, [sp], #4
    2716:	f7ff bdfb 	b.w	2310 <__swbuf_r>
    271a:	6813      	ldr	r3, [r2, #0]
    271c:	1c58      	adds	r0, r3, #1
    271e:	6010      	str	r0, [r2, #0]
    2720:	4608      	mov	r0, r1
    2722:	7019      	strb	r1, [r3, #0]
    2724:	f85d 4b04 	ldr.w	r4, [sp], #4
    2728:	4770      	bx	lr

0000272a <__sfputs_r>:
    272a:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    272c:	4606      	mov	r6, r0
    272e:	460f      	mov	r7, r1
    2730:	4614      	mov	r4, r2
    2732:	18d5      	adds	r5, r2, r3
    2734:	42ac      	cmp	r4, r5
    2736:	d101      	bne.n	273c <__sfputs_r+0x12>
    2738:	2000      	movs	r0, #0
    273a:	e007      	b.n	274c <__sfputs_r+0x22>
    273c:	463a      	mov	r2, r7
    273e:	f814 1b01 	ldrb.w	r1, [r4], #1
    2742:	4630      	mov	r0, r6
    2744:	f7ff ffda 	bl	26fc <__sfputc_r>
    2748:	1c43      	adds	r3, r0, #1
    274a:	d1f3      	bne.n	2734 <__sfputs_r+0xa>
    274c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

00002750 <_vfiprintf_r>:
    2750:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2754:	460d      	mov	r5, r1
    2756:	b09d      	sub	sp, #116	@ 0x74
    2758:	4614      	mov	r4, r2
    275a:	4698      	mov	r8, r3
    275c:	4606      	mov	r6, r0
    275e:	b118      	cbz	r0, 2768 <_vfiprintf_r+0x18>
    2760:	6a03      	ldr	r3, [r0, #32]
    2762:	b90b      	cbnz	r3, 2768 <_vfiprintf_r+0x18>
    2764:	f7ff fcea 	bl	213c <__sinit>
    2768:	6e6b      	ldr	r3, [r5, #100]	@ 0x64
    276a:	07d9      	lsls	r1, r3, #31
    276c:	d405      	bmi.n	277a <_vfiprintf_r+0x2a>
    276e:	89ab      	ldrh	r3, [r5, #12]
    2770:	059a      	lsls	r2, r3, #22
    2772:	d402      	bmi.n	277a <_vfiprintf_r+0x2a>
    2774:	6da8      	ldr	r0, [r5, #88]	@ 0x58
    2776:	f7ff feb2 	bl	24de <__retarget_lock_acquire_recursive>
    277a:	89ab      	ldrh	r3, [r5, #12]
    277c:	071b      	lsls	r3, r3, #28
    277e:	d501      	bpl.n	2784 <_vfiprintf_r+0x34>
    2780:	692b      	ldr	r3, [r5, #16]
    2782:	b99b      	cbnz	r3, 27ac <_vfiprintf_r+0x5c>
    2784:	4629      	mov	r1, r5
    2786:	4630      	mov	r0, r6
    2788:	f7ff fe00 	bl	238c <__swsetup_r>
    278c:	b170      	cbz	r0, 27ac <_vfiprintf_r+0x5c>
    278e:	6e6b      	ldr	r3, [r5, #100]	@ 0x64
    2790:	07dc      	lsls	r4, r3, #31
    2792:	d504      	bpl.n	279e <_vfiprintf_r+0x4e>
    2794:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    2798:	b01d      	add	sp, #116	@ 0x74
    279a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    279e:	89ab      	ldrh	r3, [r5, #12]
    27a0:	0598      	lsls	r0, r3, #22
    27a2:	d4f7      	bmi.n	2794 <_vfiprintf_r+0x44>
    27a4:	6da8      	ldr	r0, [r5, #88]	@ 0x58
    27a6:	f7ff fe9b 	bl	24e0 <__retarget_lock_release_recursive>
    27aa:	e7f3      	b.n	2794 <_vfiprintf_r+0x44>
    27ac:	2300      	movs	r3, #0
    27ae:	f8cd 800c 	str.w	r8, [sp, #12]
    27b2:	f04f 0901 	mov.w	r9, #1
    27b6:	f8df 81b4 	ldr.w	r8, [pc, #436]	@ 296c <_vfiprintf_r+0x21c>
    27ba:	9309      	str	r3, [sp, #36]	@ 0x24
    27bc:	2320      	movs	r3, #32
    27be:	f88d 3029 	strb.w	r3, [sp, #41]	@ 0x29
    27c2:	2330      	movs	r3, #48	@ 0x30
    27c4:	f88d 302a 	strb.w	r3, [sp, #42]	@ 0x2a
    27c8:	4623      	mov	r3, r4
    27ca:	469a      	mov	sl, r3
    27cc:	f813 2b01 	ldrb.w	r2, [r3], #1
    27d0:	b10a      	cbz	r2, 27d6 <_vfiprintf_r+0x86>
    27d2:	2a25      	cmp	r2, #37	@ 0x25
    27d4:	d1f9      	bne.n	27ca <_vfiprintf_r+0x7a>
    27d6:	ebba 0b04 	subs.w	fp, sl, r4
    27da:	d00b      	beq.n	27f4 <_vfiprintf_r+0xa4>
    27dc:	465b      	mov	r3, fp
    27de:	4622      	mov	r2, r4
    27e0:	4629      	mov	r1, r5
    27e2:	4630      	mov	r0, r6
    27e4:	f7ff ffa1 	bl	272a <__sfputs_r>
    27e8:	3001      	adds	r0, #1
    27ea:	f000 80a7 	beq.w	293c <_vfiprintf_r+0x1ec>
    27ee:	9a09      	ldr	r2, [sp, #36]	@ 0x24
    27f0:	445a      	add	r2, fp
    27f2:	9209      	str	r2, [sp, #36]	@ 0x24
    27f4:	f89a 3000 	ldrb.w	r3, [sl]
    27f8:	2b00      	cmp	r3, #0
    27fa:	f000 809f 	beq.w	293c <_vfiprintf_r+0x1ec>
    27fe:	2300      	movs	r3, #0
    2800:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
    2804:	f10a 0a01 	add.w	sl, sl, #1
    2808:	9304      	str	r3, [sp, #16]
    280a:	9307      	str	r3, [sp, #28]
    280c:	f88d 3053 	strb.w	r3, [sp, #83]	@ 0x53
    2810:	931a      	str	r3, [sp, #104]	@ 0x68
    2812:	e9cd 2305 	strd	r2, r3, [sp, #20]
    2816:	4654      	mov	r4, sl
    2818:	2205      	movs	r2, #5
    281a:	4854      	ldr	r0, [pc, #336]	@ (296c <_vfiprintf_r+0x21c>)
    281c:	f814 1b01 	ldrb.w	r1, [r4], #1
    2820:	f000 fb78 	bl	2f14 <memchr>
    2824:	9a04      	ldr	r2, [sp, #16]
    2826:	b9d8      	cbnz	r0, 2860 <_vfiprintf_r+0x110>
    2828:	06d1      	lsls	r1, r2, #27
    282a:	bf44      	itt	mi
    282c:	2320      	movmi	r3, #32
    282e:	f88d 3053 	strbmi.w	r3, [sp, #83]	@ 0x53
    2832:	0713      	lsls	r3, r2, #28
    2834:	bf44      	itt	mi
    2836:	232b      	movmi	r3, #43	@ 0x2b
    2838:	f88d 3053 	strbmi.w	r3, [sp, #83]	@ 0x53
    283c:	f89a 3000 	ldrb.w	r3, [sl]
    2840:	2b2a      	cmp	r3, #42	@ 0x2a
    2842:	d015      	beq.n	2870 <_vfiprintf_r+0x120>
    2844:	9a07      	ldr	r2, [sp, #28]
    2846:	4654      	mov	r4, sl
    2848:	2000      	movs	r0, #0
    284a:	f04f 0c0a 	mov.w	ip, #10
    284e:	4621      	mov	r1, r4
    2850:	f811 3b01 	ldrb.w	r3, [r1], #1
    2854:	3b30      	subs	r3, #48	@ 0x30
    2856:	2b09      	cmp	r3, #9
    2858:	d94b      	bls.n	28f2 <_vfiprintf_r+0x1a2>
    285a:	b1b0      	cbz	r0, 288a <_vfiprintf_r+0x13a>
    285c:	9207      	str	r2, [sp, #28]
    285e:	e014      	b.n	288a <_vfiprintf_r+0x13a>
    2860:	eba0 0308 	sub.w	r3, r0, r8
    2864:	46a2      	mov	sl, r4
    2866:	fa09 f303 	lsl.w	r3, r9, r3
    286a:	4313      	orrs	r3, r2
    286c:	9304      	str	r3, [sp, #16]
    286e:	e7d2      	b.n	2816 <_vfiprintf_r+0xc6>
    2870:	9b03      	ldr	r3, [sp, #12]
    2872:	1d19      	adds	r1, r3, #4
    2874:	681b      	ldr	r3, [r3, #0]
    2876:	2b00      	cmp	r3, #0
    2878:	9103      	str	r1, [sp, #12]
    287a:	bfbb      	ittet	lt
    287c:	425b      	neglt	r3, r3
    287e:	f042 0202 	orrlt.w	r2, r2, #2
    2882:	9307      	strge	r3, [sp, #28]
    2884:	9307      	strlt	r3, [sp, #28]
    2886:	bfb8      	it	lt
    2888:	9204      	strlt	r2, [sp, #16]
    288a:	7823      	ldrb	r3, [r4, #0]
    288c:	2b2e      	cmp	r3, #46	@ 0x2e
    288e:	d10a      	bne.n	28a6 <_vfiprintf_r+0x156>
    2890:	7863      	ldrb	r3, [r4, #1]
    2892:	2b2a      	cmp	r3, #42	@ 0x2a
    2894:	d132      	bne.n	28fc <_vfiprintf_r+0x1ac>
    2896:	9b03      	ldr	r3, [sp, #12]
    2898:	3402      	adds	r4, #2
    289a:	1d1a      	adds	r2, r3, #4
    289c:	681b      	ldr	r3, [r3, #0]
    289e:	ea43 73e3 	orr.w	r3, r3, r3, asr #31
    28a2:	9203      	str	r2, [sp, #12]
    28a4:	9305      	str	r3, [sp, #20]
    28a6:	f8df a0d4 	ldr.w	sl, [pc, #212]	@ 297c <_vfiprintf_r+0x22c>
    28aa:	2203      	movs	r2, #3
    28ac:	7821      	ldrb	r1, [r4, #0]
    28ae:	4650      	mov	r0, sl
    28b0:	f000 fb30 	bl	2f14 <memchr>
    28b4:	b138      	cbz	r0, 28c6 <_vfiprintf_r+0x176>
    28b6:	eba0 000a 	sub.w	r0, r0, sl
    28ba:	2240      	movs	r2, #64	@ 0x40
    28bc:	9b04      	ldr	r3, [sp, #16]
    28be:	3401      	adds	r4, #1
    28c0:	4082      	lsls	r2, r0
    28c2:	4313      	orrs	r3, r2
    28c4:	9304      	str	r3, [sp, #16]
    28c6:	f814 1b01 	ldrb.w	r1, [r4], #1
    28ca:	2206      	movs	r2, #6
    28cc:	4828      	ldr	r0, [pc, #160]	@ (2970 <_vfiprintf_r+0x220>)
    28ce:	f88d 1028 	strb.w	r1, [sp, #40]	@ 0x28
    28d2:	f000 fb1f 	bl	2f14 <memchr>
    28d6:	2800      	cmp	r0, #0
    28d8:	d03f      	beq.n	295a <_vfiprintf_r+0x20a>
    28da:	4b26      	ldr	r3, [pc, #152]	@ (2974 <_vfiprintf_r+0x224>)
    28dc:	bb1b      	cbnz	r3, 2926 <_vfiprintf_r+0x1d6>
    28de:	9b03      	ldr	r3, [sp, #12]
    28e0:	3307      	adds	r3, #7
    28e2:	f023 0307 	bic.w	r3, r3, #7
    28e6:	3308      	adds	r3, #8
    28e8:	9303      	str	r3, [sp, #12]
    28ea:	9b09      	ldr	r3, [sp, #36]	@ 0x24
    28ec:	443b      	add	r3, r7
    28ee:	9309      	str	r3, [sp, #36]	@ 0x24
    28f0:	e76a      	b.n	27c8 <_vfiprintf_r+0x78>
    28f2:	fb0c 3202 	mla	r2, ip, r2, r3
    28f6:	460c      	mov	r4, r1
    28f8:	2001      	movs	r0, #1
    28fa:	e7a8      	b.n	284e <_vfiprintf_r+0xfe>
    28fc:	2300      	movs	r3, #0
    28fe:	3401      	adds	r4, #1
    2900:	f04f 0c0a 	mov.w	ip, #10
    2904:	4619      	mov	r1, r3
    2906:	9305      	str	r3, [sp, #20]
    2908:	4620      	mov	r0, r4
    290a:	f810 2b01 	ldrb.w	r2, [r0], #1
    290e:	3a30      	subs	r2, #48	@ 0x30
    2910:	2a09      	cmp	r2, #9
    2912:	d903      	bls.n	291c <_vfiprintf_r+0x1cc>
    2914:	2b00      	cmp	r3, #0
    2916:	d0c6      	beq.n	28a6 <_vfiprintf_r+0x156>
    2918:	9105      	str	r1, [sp, #20]
    291a:	e7c4      	b.n	28a6 <_vfiprintf_r+0x156>
    291c:	fb0c 2101 	mla	r1, ip, r1, r2
    2920:	4604      	mov	r4, r0
    2922:	2301      	movs	r3, #1
    2924:	e7f0      	b.n	2908 <_vfiprintf_r+0x1b8>
    2926:	ab03      	add	r3, sp, #12
    2928:	462a      	mov	r2, r5
    292a:	a904      	add	r1, sp, #16
    292c:	4630      	mov	r0, r6
    292e:	9300      	str	r3, [sp, #0]
    2930:	4b11      	ldr	r3, [pc, #68]	@ (2978 <_vfiprintf_r+0x228>)
    2932:	f3af 8000 	nop.w
    2936:	4607      	mov	r7, r0
    2938:	1c78      	adds	r0, r7, #1
    293a:	d1d6      	bne.n	28ea <_vfiprintf_r+0x19a>
    293c:	6e6b      	ldr	r3, [r5, #100]	@ 0x64
    293e:	07d9      	lsls	r1, r3, #31
    2940:	d405      	bmi.n	294e <_vfiprintf_r+0x1fe>
    2942:	89ab      	ldrh	r3, [r5, #12]
    2944:	059a      	lsls	r2, r3, #22
    2946:	d402      	bmi.n	294e <_vfiprintf_r+0x1fe>
    2948:	6da8      	ldr	r0, [r5, #88]	@ 0x58
    294a:	f7ff fdc9 	bl	24e0 <__retarget_lock_release_recursive>
    294e:	89ab      	ldrh	r3, [r5, #12]
    2950:	065b      	lsls	r3, r3, #25
    2952:	f53f af1f 	bmi.w	2794 <_vfiprintf_r+0x44>
    2956:	9809      	ldr	r0, [sp, #36]	@ 0x24
    2958:	e71e      	b.n	2798 <_vfiprintf_r+0x48>
    295a:	ab03      	add	r3, sp, #12
    295c:	462a      	mov	r2, r5
    295e:	a904      	add	r1, sp, #16
    2960:	4630      	mov	r0, r6
    2962:	9300      	str	r3, [sp, #0]
    2964:	4b04      	ldr	r3, [pc, #16]	@ (2978 <_vfiprintf_r+0x228>)
    2966:	f000 f87d 	bl	2a64 <_printf_i>
    296a:	e7e4      	b.n	2936 <_vfiprintf_r+0x1e6>
    296c:	0000335e 	.word	0x0000335e
    2970:	00003368 	.word	0x00003368
    2974:	00000000 	.word	0x00000000
    2978:	0000272b 	.word	0x0000272b
    297c:	00003364 	.word	0x00003364

00002980 <_printf_common>:
    2980:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    2984:	4616      	mov	r6, r2
    2986:	4698      	mov	r8, r3
    2988:	688a      	ldr	r2, [r1, #8]
    298a:	4607      	mov	r7, r0
    298c:	690b      	ldr	r3, [r1, #16]
    298e:	460c      	mov	r4, r1
    2990:	f8dd 9020 	ldr.w	r9, [sp, #32]
    2994:	4293      	cmp	r3, r2
    2996:	bfb8      	it	lt
    2998:	4613      	movlt	r3, r2
    299a:	6033      	str	r3, [r6, #0]
    299c:	f891 2043 	ldrb.w	r2, [r1, #67]	@ 0x43
    29a0:	b10a      	cbz	r2, 29a6 <_printf_common+0x26>
    29a2:	3301      	adds	r3, #1
    29a4:	6033      	str	r3, [r6, #0]
    29a6:	6823      	ldr	r3, [r4, #0]
    29a8:	0699      	lsls	r1, r3, #26
    29aa:	bf42      	ittt	mi
    29ac:	6833      	ldrmi	r3, [r6, #0]
    29ae:	3302      	addmi	r3, #2
    29b0:	6033      	strmi	r3, [r6, #0]
    29b2:	6825      	ldr	r5, [r4, #0]
    29b4:	f015 0506 	ands.w	r5, r5, #6
    29b8:	d106      	bne.n	29c8 <_printf_common+0x48>
    29ba:	f104 0a19 	add.w	sl, r4, #25
    29be:	68e3      	ldr	r3, [r4, #12]
    29c0:	6832      	ldr	r2, [r6, #0]
    29c2:	1a9b      	subs	r3, r3, r2
    29c4:	42ab      	cmp	r3, r5
    29c6:	dc2b      	bgt.n	2a20 <_printf_common+0xa0>
    29c8:	f894 3043 	ldrb.w	r3, [r4, #67]	@ 0x43
    29cc:	6822      	ldr	r2, [r4, #0]
    29ce:	3b00      	subs	r3, #0
    29d0:	bf18      	it	ne
    29d2:	2301      	movne	r3, #1
    29d4:	0692      	lsls	r2, r2, #26
    29d6:	d430      	bmi.n	2a3a <_printf_common+0xba>
    29d8:	f104 0243 	add.w	r2, r4, #67	@ 0x43
    29dc:	4641      	mov	r1, r8
    29de:	4638      	mov	r0, r7
    29e0:	47c8      	blx	r9
    29e2:	3001      	adds	r0, #1
    29e4:	d023      	beq.n	2a2e <_printf_common+0xae>
    29e6:	6823      	ldr	r3, [r4, #0]
    29e8:	341a      	adds	r4, #26
    29ea:	f854 2c0a 	ldr.w	r2, [r4, #-10]
    29ee:	f003 0306 	and.w	r3, r3, #6
    29f2:	2b04      	cmp	r3, #4
    29f4:	bf0a      	itet	eq
    29f6:	f854 5c0e 	ldreq.w	r5, [r4, #-14]
    29fa:	2500      	movne	r5, #0
    29fc:	6833      	ldreq	r3, [r6, #0]
    29fe:	f04f 0600 	mov.w	r6, #0
    2a02:	bf08      	it	eq
    2a04:	1aed      	subeq	r5, r5, r3
    2a06:	f854 3c12 	ldr.w	r3, [r4, #-18]
    2a0a:	bf08      	it	eq
    2a0c:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
    2a10:	4293      	cmp	r3, r2
    2a12:	bfc4      	itt	gt
    2a14:	1a9b      	subgt	r3, r3, r2
    2a16:	18ed      	addgt	r5, r5, r3
    2a18:	42b5      	cmp	r5, r6
    2a1a:	d11a      	bne.n	2a52 <_printf_common+0xd2>
    2a1c:	2000      	movs	r0, #0
    2a1e:	e008      	b.n	2a32 <_printf_common+0xb2>
    2a20:	2301      	movs	r3, #1
    2a22:	4652      	mov	r2, sl
    2a24:	4641      	mov	r1, r8
    2a26:	4638      	mov	r0, r7
    2a28:	47c8      	blx	r9
    2a2a:	3001      	adds	r0, #1
    2a2c:	d103      	bne.n	2a36 <_printf_common+0xb6>
    2a2e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    2a32:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    2a36:	3501      	adds	r5, #1
    2a38:	e7c1      	b.n	29be <_printf_common+0x3e>
    2a3a:	18e1      	adds	r1, r4, r3
    2a3c:	1c5a      	adds	r2, r3, #1
    2a3e:	2030      	movs	r0, #48	@ 0x30
    2a40:	3302      	adds	r3, #2
    2a42:	4422      	add	r2, r4
    2a44:	f881 0043 	strb.w	r0, [r1, #67]	@ 0x43
    2a48:	f894 1045 	ldrb.w	r1, [r4, #69]	@ 0x45
    2a4c:	f882 1043 	strb.w	r1, [r2, #67]	@ 0x43
    2a50:	e7c2      	b.n	29d8 <_printf_common+0x58>
    2a52:	2301      	movs	r3, #1
    2a54:	4622      	mov	r2, r4
    2a56:	4641      	mov	r1, r8
    2a58:	4638      	mov	r0, r7
    2a5a:	47c8      	blx	r9
    2a5c:	3001      	adds	r0, #1
    2a5e:	d0e6      	beq.n	2a2e <_printf_common+0xae>
    2a60:	3601      	adds	r6, #1
    2a62:	e7d9      	b.n	2a18 <_printf_common+0x98>

00002a64 <_printf_i>:
    2a64:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
    2a68:	7e0f      	ldrb	r7, [r1, #24]
    2a6a:	4691      	mov	r9, r2
    2a6c:	4680      	mov	r8, r0
    2a6e:	460c      	mov	r4, r1
    2a70:	2f78      	cmp	r7, #120	@ 0x78
    2a72:	469a      	mov	sl, r3
    2a74:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
    2a76:	f101 0243 	add.w	r2, r1, #67	@ 0x43
    2a7a:	d807      	bhi.n	2a8c <_printf_i+0x28>
    2a7c:	2f62      	cmp	r7, #98	@ 0x62
    2a7e:	d80a      	bhi.n	2a96 <_printf_i+0x32>
    2a80:	2f00      	cmp	r7, #0
    2a82:	f000 80d2 	beq.w	2c2a <_printf_i+0x1c6>
    2a86:	2f58      	cmp	r7, #88	@ 0x58
    2a88:	f000 80b7 	beq.w	2bfa <_printf_i+0x196>
    2a8c:	f104 0642 	add.w	r6, r4, #66	@ 0x42
    2a90:	f884 7042 	strb.w	r7, [r4, #66]	@ 0x42
    2a94:	e03a      	b.n	2b0c <_printf_i+0xa8>
    2a96:	f1a7 0363 	sub.w	r3, r7, #99	@ 0x63
    2a9a:	2b15      	cmp	r3, #21
    2a9c:	d8f6      	bhi.n	2a8c <_printf_i+0x28>
    2a9e:	a101      	add	r1, pc, #4	@ (adr r1, 2aa4 <_printf_i+0x40>)
    2aa0:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
    2aa4:	00002afd 	.word	0x00002afd
    2aa8:	00002b11 	.word	0x00002b11
    2aac:	00002a8d 	.word	0x00002a8d
    2ab0:	00002a8d 	.word	0x00002a8d
    2ab4:	00002a8d 	.word	0x00002a8d
    2ab8:	00002a8d 	.word	0x00002a8d
    2abc:	00002b11 	.word	0x00002b11
    2ac0:	00002a8d 	.word	0x00002a8d
    2ac4:	00002a8d 	.word	0x00002a8d
    2ac8:	00002a8d 	.word	0x00002a8d
    2acc:	00002a8d 	.word	0x00002a8d
    2ad0:	00002c11 	.word	0x00002c11
    2ad4:	00002b3b 	.word	0x00002b3b
    2ad8:	00002bc7 	.word	0x00002bc7
    2adc:	00002a8d 	.word	0x00002a8d
    2ae0:	00002a8d 	.word	0x00002a8d
    2ae4:	00002c33 	.word	0x00002c33
    2ae8:	00002a8d 	.word	0x00002a8d
    2aec:	00002b3b 	.word	0x00002b3b
    2af0:	00002a8d 	.word	0x00002a8d
    2af4:	00002a8d 	.word	0x00002a8d
    2af8:	00002bcf 	.word	0x00002bcf
    2afc:	6833      	ldr	r3, [r6, #0]
    2afe:	1d1a      	adds	r2, r3, #4
    2b00:	681b      	ldr	r3, [r3, #0]
    2b02:	6032      	str	r2, [r6, #0]
    2b04:	f104 0642 	add.w	r6, r4, #66	@ 0x42
    2b08:	f884 3042 	strb.w	r3, [r4, #66]	@ 0x42
    2b0c:	2301      	movs	r3, #1
    2b0e:	e09d      	b.n	2c4c <_printf_i+0x1e8>
    2b10:	6833      	ldr	r3, [r6, #0]
    2b12:	6820      	ldr	r0, [r4, #0]
    2b14:	1d19      	adds	r1, r3, #4
    2b16:	6031      	str	r1, [r6, #0]
    2b18:	0606      	lsls	r6, r0, #24
    2b1a:	d501      	bpl.n	2b20 <_printf_i+0xbc>
    2b1c:	681d      	ldr	r5, [r3, #0]
    2b1e:	e003      	b.n	2b28 <_printf_i+0xc4>
    2b20:	0645      	lsls	r5, r0, #25
    2b22:	d5fb      	bpl.n	2b1c <_printf_i+0xb8>
    2b24:	f9b3 5000 	ldrsh.w	r5, [r3]
    2b28:	2d00      	cmp	r5, #0
    2b2a:	da03      	bge.n	2b34 <_printf_i+0xd0>
    2b2c:	232d      	movs	r3, #45	@ 0x2d
    2b2e:	426d      	negs	r5, r5
    2b30:	f884 3043 	strb.w	r3, [r4, #67]	@ 0x43
    2b34:	4859      	ldr	r0, [pc, #356]	@ (2c9c <_printf_i+0x238>)
    2b36:	230a      	movs	r3, #10
    2b38:	e010      	b.n	2b5c <_printf_i+0xf8>
    2b3a:	6821      	ldr	r1, [r4, #0]
    2b3c:	6833      	ldr	r3, [r6, #0]
    2b3e:	0608      	lsls	r0, r1, #24
    2b40:	f853 5b04 	ldr.w	r5, [r3], #4
    2b44:	d402      	bmi.n	2b4c <_printf_i+0xe8>
    2b46:	0649      	lsls	r1, r1, #25
    2b48:	bf48      	it	mi
    2b4a:	b2ad      	uxthmi	r5, r5
    2b4c:	2f6f      	cmp	r7, #111	@ 0x6f
    2b4e:	4853      	ldr	r0, [pc, #332]	@ (2c9c <_printf_i+0x238>)
    2b50:	6033      	str	r3, [r6, #0]
    2b52:	d159      	bne.n	2c08 <_printf_i+0x1a4>
    2b54:	2308      	movs	r3, #8
    2b56:	2100      	movs	r1, #0
    2b58:	f884 1043 	strb.w	r1, [r4, #67]	@ 0x43
    2b5c:	6866      	ldr	r6, [r4, #4]
    2b5e:	2e00      	cmp	r6, #0
    2b60:	60a6      	str	r6, [r4, #8]
    2b62:	db05      	blt.n	2b70 <_printf_i+0x10c>
    2b64:	6821      	ldr	r1, [r4, #0]
    2b66:	432e      	orrs	r6, r5
    2b68:	f021 0104 	bic.w	r1, r1, #4
    2b6c:	6021      	str	r1, [r4, #0]
    2b6e:	d04d      	beq.n	2c0c <_printf_i+0x1a8>
    2b70:	4616      	mov	r6, r2
    2b72:	fbb5 f1f3 	udiv	r1, r5, r3
    2b76:	fb03 5711 	mls	r7, r3, r1, r5
    2b7a:	5dc7      	ldrb	r7, [r0, r7]
    2b7c:	f806 7d01 	strb.w	r7, [r6, #-1]!
    2b80:	462f      	mov	r7, r5
    2b82:	460d      	mov	r5, r1
    2b84:	42bb      	cmp	r3, r7
    2b86:	d9f4      	bls.n	2b72 <_printf_i+0x10e>
    2b88:	2b08      	cmp	r3, #8
    2b8a:	d10b      	bne.n	2ba4 <_printf_i+0x140>
    2b8c:	6823      	ldr	r3, [r4, #0]
    2b8e:	07df      	lsls	r7, r3, #31
    2b90:	d508      	bpl.n	2ba4 <_printf_i+0x140>
    2b92:	6923      	ldr	r3, [r4, #16]
    2b94:	6861      	ldr	r1, [r4, #4]
    2b96:	4299      	cmp	r1, r3
    2b98:	bfde      	ittt	le
    2b9a:	2330      	movle	r3, #48	@ 0x30
    2b9c:	f806 3c01 	strble.w	r3, [r6, #-1]
    2ba0:	f106 36ff 	addle.w	r6, r6, #4294967295	@ 0xffffffff
    2ba4:	1b92      	subs	r2, r2, r6
    2ba6:	6122      	str	r2, [r4, #16]
    2ba8:	464b      	mov	r3, r9
    2baa:	aa03      	add	r2, sp, #12
    2bac:	4621      	mov	r1, r4
    2bae:	4640      	mov	r0, r8
    2bb0:	f8cd a000 	str.w	sl, [sp]
    2bb4:	f7ff fee4 	bl	2980 <_printf_common>
    2bb8:	3001      	adds	r0, #1
    2bba:	d14c      	bne.n	2c56 <_printf_i+0x1f2>
    2bbc:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    2bc0:	b004      	add	sp, #16
    2bc2:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    2bc6:	6823      	ldr	r3, [r4, #0]
    2bc8:	f043 0320 	orr.w	r3, r3, #32
    2bcc:	6023      	str	r3, [r4, #0]
    2bce:	2778      	movs	r7, #120	@ 0x78
    2bd0:	4833      	ldr	r0, [pc, #204]	@ (2ca0 <_printf_i+0x23c>)
    2bd2:	6823      	ldr	r3, [r4, #0]
    2bd4:	f884 7045 	strb.w	r7, [r4, #69]	@ 0x45
    2bd8:	061f      	lsls	r7, r3, #24
    2bda:	6831      	ldr	r1, [r6, #0]
    2bdc:	f851 5b04 	ldr.w	r5, [r1], #4
    2be0:	d402      	bmi.n	2be8 <_printf_i+0x184>
    2be2:	065f      	lsls	r7, r3, #25
    2be4:	bf48      	it	mi
    2be6:	b2ad      	uxthmi	r5, r5
    2be8:	6031      	str	r1, [r6, #0]
    2bea:	07d9      	lsls	r1, r3, #31
    2bec:	bf44      	itt	mi
    2bee:	f043 0320 	orrmi.w	r3, r3, #32
    2bf2:	6023      	strmi	r3, [r4, #0]
    2bf4:	b11d      	cbz	r5, 2bfe <_printf_i+0x19a>
    2bf6:	2310      	movs	r3, #16
    2bf8:	e7ad      	b.n	2b56 <_printf_i+0xf2>
    2bfa:	4828      	ldr	r0, [pc, #160]	@ (2c9c <_printf_i+0x238>)
    2bfc:	e7e9      	b.n	2bd2 <_printf_i+0x16e>
    2bfe:	6823      	ldr	r3, [r4, #0]
    2c00:	f023 0320 	bic.w	r3, r3, #32
    2c04:	6023      	str	r3, [r4, #0]
    2c06:	e7f6      	b.n	2bf6 <_printf_i+0x192>
    2c08:	230a      	movs	r3, #10
    2c0a:	e7a4      	b.n	2b56 <_printf_i+0xf2>
    2c0c:	4616      	mov	r6, r2
    2c0e:	e7bb      	b.n	2b88 <_printf_i+0x124>
    2c10:	6833      	ldr	r3, [r6, #0]
    2c12:	6825      	ldr	r5, [r4, #0]
    2c14:	1d18      	adds	r0, r3, #4
    2c16:	6961      	ldr	r1, [r4, #20]
    2c18:	6030      	str	r0, [r6, #0]
    2c1a:	062e      	lsls	r6, r5, #24
    2c1c:	681b      	ldr	r3, [r3, #0]
    2c1e:	d501      	bpl.n	2c24 <_printf_i+0x1c0>
    2c20:	6019      	str	r1, [r3, #0]
    2c22:	e002      	b.n	2c2a <_printf_i+0x1c6>
    2c24:	0668      	lsls	r0, r5, #25
    2c26:	d5fb      	bpl.n	2c20 <_printf_i+0x1bc>
    2c28:	8019      	strh	r1, [r3, #0]
    2c2a:	2300      	movs	r3, #0
    2c2c:	4616      	mov	r6, r2
    2c2e:	6123      	str	r3, [r4, #16]
    2c30:	e7ba      	b.n	2ba8 <_printf_i+0x144>
    2c32:	6833      	ldr	r3, [r6, #0]
    2c34:	2100      	movs	r1, #0
    2c36:	1d1a      	adds	r2, r3, #4
    2c38:	6032      	str	r2, [r6, #0]
    2c3a:	681e      	ldr	r6, [r3, #0]
    2c3c:	6862      	ldr	r2, [r4, #4]
    2c3e:	4630      	mov	r0, r6
    2c40:	f000 f968 	bl	2f14 <memchr>
    2c44:	b108      	cbz	r0, 2c4a <_printf_i+0x1e6>
    2c46:	1b80      	subs	r0, r0, r6
    2c48:	6060      	str	r0, [r4, #4]
    2c4a:	6863      	ldr	r3, [r4, #4]
    2c4c:	6123      	str	r3, [r4, #16]
    2c4e:	2300      	movs	r3, #0
    2c50:	f884 3043 	strb.w	r3, [r4, #67]	@ 0x43
    2c54:	e7a8      	b.n	2ba8 <_printf_i+0x144>
    2c56:	6923      	ldr	r3, [r4, #16]
    2c58:	4632      	mov	r2, r6
    2c5a:	4649      	mov	r1, r9
    2c5c:	4640      	mov	r0, r8
    2c5e:	47d0      	blx	sl
    2c60:	3001      	adds	r0, #1
    2c62:	d0ab      	beq.n	2bbc <_printf_i+0x158>
    2c64:	6823      	ldr	r3, [r4, #0]
    2c66:	079b      	lsls	r3, r3, #30
    2c68:	d413      	bmi.n	2c92 <_printf_i+0x22e>
    2c6a:	68e0      	ldr	r0, [r4, #12]
    2c6c:	9b03      	ldr	r3, [sp, #12]
    2c6e:	4298      	cmp	r0, r3
    2c70:	bfb8      	it	lt
    2c72:	4618      	movlt	r0, r3
    2c74:	e7a4      	b.n	2bc0 <_printf_i+0x15c>
    2c76:	2301      	movs	r3, #1
    2c78:	4632      	mov	r2, r6
    2c7a:	4649      	mov	r1, r9
    2c7c:	4640      	mov	r0, r8
    2c7e:	47d0      	blx	sl
    2c80:	3001      	adds	r0, #1
    2c82:	d09b      	beq.n	2bbc <_printf_i+0x158>
    2c84:	3501      	adds	r5, #1
    2c86:	68e3      	ldr	r3, [r4, #12]
    2c88:	9903      	ldr	r1, [sp, #12]
    2c8a:	1a5b      	subs	r3, r3, r1
    2c8c:	42ab      	cmp	r3, r5
    2c8e:	dcf2      	bgt.n	2c76 <_printf_i+0x212>
    2c90:	e7eb      	b.n	2c6a <_printf_i+0x206>
    2c92:	2500      	movs	r5, #0
    2c94:	f104 0619 	add.w	r6, r4, #25
    2c98:	e7f5      	b.n	2c86 <_printf_i+0x222>
    2c9a:	bf00      	nop
    2c9c:	0000336f 	.word	0x0000336f
    2ca0:	00003380 	.word	0x00003380

00002ca4 <__sflush_r>:
    2ca4:	f9b1 200c 	ldrsh.w	r2, [r1, #12]
    2ca8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    2cac:	0716      	lsls	r6, r2, #28
    2cae:	4605      	mov	r5, r0
    2cb0:	460c      	mov	r4, r1
    2cb2:	d451      	bmi.n	2d58 <__sflush_r+0xb4>
    2cb4:	684b      	ldr	r3, [r1, #4]
    2cb6:	2b00      	cmp	r3, #0
    2cb8:	dc02      	bgt.n	2cc0 <__sflush_r+0x1c>
    2cba:	6c0b      	ldr	r3, [r1, #64]	@ 0x40
    2cbc:	2b00      	cmp	r3, #0
    2cbe:	dd49      	ble.n	2d54 <__sflush_r+0xb0>
    2cc0:	6ae6      	ldr	r6, [r4, #44]	@ 0x2c
    2cc2:	2e00      	cmp	r6, #0
    2cc4:	d046      	beq.n	2d54 <__sflush_r+0xb0>
    2cc6:	2300      	movs	r3, #0
    2cc8:	f412 5280 	ands.w	r2, r2, #4096	@ 0x1000
    2ccc:	682f      	ldr	r7, [r5, #0]
    2cce:	602b      	str	r3, [r5, #0]
    2cd0:	d031      	beq.n	2d36 <__sflush_r+0x92>
    2cd2:	6d62      	ldr	r2, [r4, #84]	@ 0x54
    2cd4:	89a3      	ldrh	r3, [r4, #12]
    2cd6:	0759      	lsls	r1, r3, #29
    2cd8:	d505      	bpl.n	2ce6 <__sflush_r+0x42>
    2cda:	6863      	ldr	r3, [r4, #4]
    2cdc:	1ad2      	subs	r2, r2, r3
    2cde:	6b63      	ldr	r3, [r4, #52]	@ 0x34
    2ce0:	b10b      	cbz	r3, 2ce6 <__sflush_r+0x42>
    2ce2:	6c23      	ldr	r3, [r4, #64]	@ 0x40
    2ce4:	1ad2      	subs	r2, r2, r3
    2ce6:	2300      	movs	r3, #0
    2ce8:	6ae6      	ldr	r6, [r4, #44]	@ 0x2c
    2cea:	6a21      	ldr	r1, [r4, #32]
    2cec:	4628      	mov	r0, r5
    2cee:	47b0      	blx	r6
    2cf0:	1c42      	adds	r2, r0, #1
    2cf2:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    2cf6:	d106      	bne.n	2d06 <__sflush_r+0x62>
    2cf8:	6829      	ldr	r1, [r5, #0]
    2cfa:	291d      	cmp	r1, #29
    2cfc:	d845      	bhi.n	2d8a <__sflush_r+0xe6>
    2cfe:	4a28      	ldr	r2, [pc, #160]	@ (2da0 <__sflush_r+0xfc>)
    2d00:	40ca      	lsrs	r2, r1
    2d02:	07d6      	lsls	r6, r2, #31
    2d04:	d541      	bpl.n	2d8a <__sflush_r+0xe6>
    2d06:	2200      	movs	r2, #0
    2d08:	04d9      	lsls	r1, r3, #19
    2d0a:	6062      	str	r2, [r4, #4]
    2d0c:	6922      	ldr	r2, [r4, #16]
    2d0e:	6022      	str	r2, [r4, #0]
    2d10:	d504      	bpl.n	2d1c <__sflush_r+0x78>
    2d12:	1c42      	adds	r2, r0, #1
    2d14:	d101      	bne.n	2d1a <__sflush_r+0x76>
    2d16:	682b      	ldr	r3, [r5, #0]
    2d18:	b903      	cbnz	r3, 2d1c <__sflush_r+0x78>
    2d1a:	6560      	str	r0, [r4, #84]	@ 0x54
    2d1c:	6b61      	ldr	r1, [r4, #52]	@ 0x34
    2d1e:	602f      	str	r7, [r5, #0]
    2d20:	b1c1      	cbz	r1, 2d54 <__sflush_r+0xb0>
    2d22:	f104 0344 	add.w	r3, r4, #68	@ 0x44
    2d26:	4299      	cmp	r1, r3
    2d28:	d002      	beq.n	2d30 <__sflush_r+0x8c>
    2d2a:	4628      	mov	r0, r5
    2d2c:	f7ff fbe6 	bl	24fc <_free_r>
    2d30:	2300      	movs	r3, #0
    2d32:	6363      	str	r3, [r4, #52]	@ 0x34
    2d34:	e00e      	b.n	2d54 <__sflush_r+0xb0>
    2d36:	2301      	movs	r3, #1
    2d38:	6a21      	ldr	r1, [r4, #32]
    2d3a:	4628      	mov	r0, r5
    2d3c:	47b0      	blx	r6
    2d3e:	4602      	mov	r2, r0
    2d40:	1c50      	adds	r0, r2, #1
    2d42:	d1c7      	bne.n	2cd4 <__sflush_r+0x30>
    2d44:	682b      	ldr	r3, [r5, #0]
    2d46:	2b00      	cmp	r3, #0
    2d48:	d0c4      	beq.n	2cd4 <__sflush_r+0x30>
    2d4a:	2b1d      	cmp	r3, #29
    2d4c:	d001      	beq.n	2d52 <__sflush_r+0xae>
    2d4e:	2b16      	cmp	r3, #22
    2d50:	d119      	bne.n	2d86 <__sflush_r+0xe2>
    2d52:	602f      	str	r7, [r5, #0]
    2d54:	2000      	movs	r0, #0
    2d56:	e01d      	b.n	2d94 <__sflush_r+0xf0>
    2d58:	690f      	ldr	r7, [r1, #16]
    2d5a:	2f00      	cmp	r7, #0
    2d5c:	d0fa      	beq.n	2d54 <__sflush_r+0xb0>
    2d5e:	0793      	lsls	r3, r2, #30
    2d60:	680e      	ldr	r6, [r1, #0]
    2d62:	600f      	str	r7, [r1, #0]
    2d64:	bf0c      	ite	eq
    2d66:	694b      	ldreq	r3, [r1, #20]
    2d68:	2300      	movne	r3, #0
    2d6a:	eba6 0807 	sub.w	r8, r6, r7
    2d6e:	608b      	str	r3, [r1, #8]
    2d70:	f1b8 0f00 	cmp.w	r8, #0
    2d74:	ddee      	ble.n	2d54 <__sflush_r+0xb0>
    2d76:	4643      	mov	r3, r8
    2d78:	463a      	mov	r2, r7
    2d7a:	6a21      	ldr	r1, [r4, #32]
    2d7c:	4628      	mov	r0, r5
    2d7e:	6aa6      	ldr	r6, [r4, #40]	@ 0x28
    2d80:	47b0      	blx	r6
    2d82:	2800      	cmp	r0, #0
    2d84:	dc08      	bgt.n	2d98 <__sflush_r+0xf4>
    2d86:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    2d8a:	f043 0340 	orr.w	r3, r3, #64	@ 0x40
    2d8e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
    2d92:	81a3      	strh	r3, [r4, #12]
    2d94:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    2d98:	4407      	add	r7, r0
    2d9a:	eba8 0800 	sub.w	r8, r8, r0
    2d9e:	e7e7      	b.n	2d70 <__sflush_r+0xcc>
    2da0:	20400001 	.word	0x20400001

00002da4 <_fflush_r>:
    2da4:	b538      	push	{r3, r4, r5, lr}
    2da6:	690b      	ldr	r3, [r1, #16]
    2da8:	4605      	mov	r5, r0
    2daa:	460c      	mov	r4, r1
    2dac:	b913      	cbnz	r3, 2db4 <_fflush_r+0x10>
    2dae:	2500      	movs	r5, #0
    2db0:	4628      	mov	r0, r5
    2db2:	bd38      	pop	{r3, r4, r5, pc}
    2db4:	b118      	cbz	r0, 2dbe <_fflush_r+0x1a>
    2db6:	6a03      	ldr	r3, [r0, #32]
    2db8:	b90b      	cbnz	r3, 2dbe <_fflush_r+0x1a>
    2dba:	f7ff f9bf 	bl	213c <__sinit>
    2dbe:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    2dc2:	2b00      	cmp	r3, #0
    2dc4:	d0f3      	beq.n	2dae <_fflush_r+0xa>
    2dc6:	6e62      	ldr	r2, [r4, #100]	@ 0x64
    2dc8:	07d0      	lsls	r0, r2, #31
    2dca:	d404      	bmi.n	2dd6 <_fflush_r+0x32>
    2dcc:	0599      	lsls	r1, r3, #22
    2dce:	d402      	bmi.n	2dd6 <_fflush_r+0x32>
    2dd0:	6da0      	ldr	r0, [r4, #88]	@ 0x58
    2dd2:	f7ff fb84 	bl	24de <__retarget_lock_acquire_recursive>
    2dd6:	4628      	mov	r0, r5
    2dd8:	4621      	mov	r1, r4
    2dda:	f7ff ff63 	bl	2ca4 <__sflush_r>
    2dde:	6e63      	ldr	r3, [r4, #100]	@ 0x64
    2de0:	4605      	mov	r5, r0
    2de2:	07da      	lsls	r2, r3, #31
    2de4:	d4e4      	bmi.n	2db0 <_fflush_r+0xc>
    2de6:	89a3      	ldrh	r3, [r4, #12]
    2de8:	059b      	lsls	r3, r3, #22
    2dea:	d4e1      	bmi.n	2db0 <_fflush_r+0xc>
    2dec:	6da0      	ldr	r0, [r4, #88]	@ 0x58
    2dee:	f7ff fb77 	bl	24e0 <__retarget_lock_release_recursive>
    2df2:	e7dd      	b.n	2db0 <_fflush_r+0xc>

00002df4 <__swhatbuf_r>:
    2df4:	b570      	push	{r4, r5, r6, lr}
    2df6:	460c      	mov	r4, r1
    2df8:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    2dfc:	b096      	sub	sp, #88	@ 0x58
    2dfe:	4615      	mov	r5, r2
    2e00:	2900      	cmp	r1, #0
    2e02:	461e      	mov	r6, r3
    2e04:	da0a      	bge.n	2e1c <__swhatbuf_r+0x28>
    2e06:	89a1      	ldrh	r1, [r4, #12]
    2e08:	f011 0180 	ands.w	r1, r1, #128	@ 0x80
    2e0c:	d113      	bne.n	2e36 <__swhatbuf_r+0x42>
    2e0e:	f44f 6280 	mov.w	r2, #1024	@ 0x400
    2e12:	2000      	movs	r0, #0
    2e14:	6031      	str	r1, [r6, #0]
    2e16:	602a      	str	r2, [r5, #0]
    2e18:	b016      	add	sp, #88	@ 0x58
    2e1a:	bd70      	pop	{r4, r5, r6, pc}
    2e1c:	466a      	mov	r2, sp
    2e1e:	f000 f847 	bl	2eb0 <_fstat_r>
    2e22:	2800      	cmp	r0, #0
    2e24:	dbef      	blt.n	2e06 <__swhatbuf_r+0x12>
    2e26:	9901      	ldr	r1, [sp, #4]
    2e28:	f401 4170 	and.w	r1, r1, #61440	@ 0xf000
    2e2c:	f5a1 5300 	sub.w	r3, r1, #8192	@ 0x2000
    2e30:	4259      	negs	r1, r3
    2e32:	4159      	adcs	r1, r3
    2e34:	e7eb      	b.n	2e0e <__swhatbuf_r+0x1a>
    2e36:	2100      	movs	r1, #0
    2e38:	2240      	movs	r2, #64	@ 0x40
    2e3a:	e7ea      	b.n	2e12 <__swhatbuf_r+0x1e>

00002e3c <__smakebuf_r>:
    2e3c:	898b      	ldrh	r3, [r1, #12]
    2e3e:	b573      	push	{r0, r1, r4, r5, r6, lr}
    2e40:	079e      	lsls	r6, r3, #30
    2e42:	4605      	mov	r5, r0
    2e44:	460c      	mov	r4, r1
    2e46:	d507      	bpl.n	2e58 <__smakebuf_r+0x1c>
    2e48:	f104 0347 	add.w	r3, r4, #71	@ 0x47
    2e4c:	6023      	str	r3, [r4, #0]
    2e4e:	6123      	str	r3, [r4, #16]
    2e50:	2301      	movs	r3, #1
    2e52:	6163      	str	r3, [r4, #20]
    2e54:	b002      	add	sp, #8
    2e56:	bd70      	pop	{r4, r5, r6, pc}
    2e58:	ab01      	add	r3, sp, #4
    2e5a:	466a      	mov	r2, sp
    2e5c:	f7ff ffca 	bl	2df4 <__swhatbuf_r>
    2e60:	9e00      	ldr	r6, [sp, #0]
    2e62:	4628      	mov	r0, r5
    2e64:	4631      	mov	r1, r6
    2e66:	f7ff fbbd 	bl	25e4 <_malloc_r>
    2e6a:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    2e6e:	b938      	cbnz	r0, 2e80 <__smakebuf_r+0x44>
    2e70:	059a      	lsls	r2, r3, #22
    2e72:	d4ef      	bmi.n	2e54 <__smakebuf_r+0x18>
    2e74:	f023 0303 	bic.w	r3, r3, #3
    2e78:	f043 0302 	orr.w	r3, r3, #2
    2e7c:	81a3      	strh	r3, [r4, #12]
    2e7e:	e7e3      	b.n	2e48 <__smakebuf_r+0xc>
    2e80:	f043 0380 	orr.w	r3, r3, #128	@ 0x80
    2e84:	6020      	str	r0, [r4, #0]
    2e86:	81a3      	strh	r3, [r4, #12]
    2e88:	9b01      	ldr	r3, [sp, #4]
    2e8a:	e9c4 0604 	strd	r0, r6, [r4, #16]
    2e8e:	2b00      	cmp	r3, #0
    2e90:	d0e0      	beq.n	2e54 <__smakebuf_r+0x18>
    2e92:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
    2e96:	4628      	mov	r0, r5
    2e98:	f000 f81c 	bl	2ed4 <_isatty_r>
    2e9c:	2800      	cmp	r0, #0
    2e9e:	d0d9      	beq.n	2e54 <__smakebuf_r+0x18>
    2ea0:	89a3      	ldrh	r3, [r4, #12]
    2ea2:	f023 0303 	bic.w	r3, r3, #3
    2ea6:	f043 0301 	orr.w	r3, r3, #1
    2eaa:	81a3      	strh	r3, [r4, #12]
    2eac:	e7d2      	b.n	2e54 <__smakebuf_r+0x18>
	...

00002eb0 <_fstat_r>:
    2eb0:	b538      	push	{r3, r4, r5, lr}
    2eb2:	2300      	movs	r3, #0
    2eb4:	4d06      	ldr	r5, [pc, #24]	@ (2ed0 <_fstat_r+0x20>)
    2eb6:	4604      	mov	r4, r0
    2eb8:	4608      	mov	r0, r1
    2eba:	4611      	mov	r1, r2
    2ebc:	602b      	str	r3, [r5, #0]
    2ebe:	f7fe ff3b 	bl	1d38 <_fstat>
    2ec2:	1c43      	adds	r3, r0, #1
    2ec4:	d102      	bne.n	2ecc <_fstat_r+0x1c>
    2ec6:	682b      	ldr	r3, [r5, #0]
    2ec8:	b103      	cbz	r3, 2ecc <_fstat_r+0x1c>
    2eca:	6023      	str	r3, [r4, #0]
    2ecc:	bd38      	pop	{r3, r4, r5, pc}
    2ece:	bf00      	nop
    2ed0:	2000094c 	.word	0x2000094c

00002ed4 <_isatty_r>:
    2ed4:	b538      	push	{r3, r4, r5, lr}
    2ed6:	2300      	movs	r3, #0
    2ed8:	4d05      	ldr	r5, [pc, #20]	@ (2ef0 <_isatty_r+0x1c>)
    2eda:	4604      	mov	r4, r0
    2edc:	4608      	mov	r0, r1
    2ede:	602b      	str	r3, [r5, #0]
    2ee0:	f7fe ff30 	bl	1d44 <_isatty>
    2ee4:	1c43      	adds	r3, r0, #1
    2ee6:	d102      	bne.n	2eee <_isatty_r+0x1a>
    2ee8:	682b      	ldr	r3, [r5, #0]
    2eea:	b103      	cbz	r3, 2eee <_isatty_r+0x1a>
    2eec:	6023      	str	r3, [r4, #0]
    2eee:	bd38      	pop	{r3, r4, r5, pc}
    2ef0:	2000094c 	.word	0x2000094c

00002ef4 <_sbrk_r>:
    2ef4:	b538      	push	{r3, r4, r5, lr}
    2ef6:	2300      	movs	r3, #0
    2ef8:	4d05      	ldr	r5, [pc, #20]	@ (2f10 <_sbrk_r+0x1c>)
    2efa:	4604      	mov	r4, r0
    2efc:	4608      	mov	r0, r1
    2efe:	602b      	str	r3, [r5, #0]
    2f00:	f7fd fbca 	bl	698 <_sbrk>
    2f04:	1c43      	adds	r3, r0, #1
    2f06:	d102      	bne.n	2f0e <_sbrk_r+0x1a>
    2f08:	682b      	ldr	r3, [r5, #0]
    2f0a:	b103      	cbz	r3, 2f0e <_sbrk_r+0x1a>
    2f0c:	6023      	str	r3, [r4, #0]
    2f0e:	bd38      	pop	{r3, r4, r5, pc}
    2f10:	2000094c 	.word	0x2000094c

00002f14 <memchr>:
    2f14:	b2c9      	uxtb	r1, r1
    2f16:	4603      	mov	r3, r0
    2f18:	4402      	add	r2, r0
    2f1a:	b510      	push	{r4, lr}
    2f1c:	4293      	cmp	r3, r2
    2f1e:	4618      	mov	r0, r3
    2f20:	d101      	bne.n	2f26 <memchr+0x12>
    2f22:	2000      	movs	r0, #0
    2f24:	e003      	b.n	2f2e <memchr+0x1a>
    2f26:	7804      	ldrb	r4, [r0, #0]
    2f28:	3301      	adds	r3, #1
    2f2a:	428c      	cmp	r4, r1
    2f2c:	d1f6      	bne.n	2f1c <memchr+0x8>
    2f2e:	bd10      	pop	{r4, pc}

00002f30 <g_prcr_masks>:
    2f30:	0001 0002 0008 0010 0020 0000               ........ ...

00002f3c <g_init_info>:
    2f3c:	0004 0000 2fe4 0000 0008 0000 2f64 0000     ...../......d/..
    2f4c:	0002 0000 2f54 0000                         ....T/..

00002f54 <nocache_list>:
    2f54:	0000 6800 0000 6800 0080 2000 0080 2000     ...h...h... ... 

00002f64 <copy_list>:
    2f64:	0000 6800 0000 6800 0000 6000 0100 080c     ...h...h...`....
    2f74:	0000 6800 0000 6800 0000 7000 0100 0809     ...h...h...p....
    2f84:	0000 6800 0000 6800 0000 0800 0100 0802     ...h...h........
    2f94:	0000 6800 0000 6800 0068 0000 0100 0801     ...h...hh.......
    2fa4:	0000 2000 0000 2000 0000 6000 0100 030c     ... ... ...`....
    2fb4:	0000 2000 0000 2000 0000 7000 0100 0309     ... ... ...p....
    2fc4:	0000 2000 0000 2000 0000 0800 0000 0302     ... ... ........
    2fd4:	0000 2000 0070 2000 0068 0000 0000 0301     ... p.. h.......

00002fe4 <zero_list>:
    2fe4:	0000 6800 0000 6800 0100 0800 0000 6800     ...h...h.......h
    2ff4:	0000 6800 0100 0800 0070 2000 0080 2000     ...h....p.. ... 
    3004:	0000 0300 04a0 2000 095c 2000 0000 0300     ....... \.. ....

00003014 <g_vbatt_pins_input>:
    3014:	0402 0403 0404 0000                         ........

0000301c <g_ioport_on_ioport>:
    301c:	0989 0000 06ad 0000 099d 0000 09a9 0000     ................
    302c:	0771 0000 07c1 0000 06b9 0000 070d 0000     q...............
    303c:	072d 0000 0759 0000 07a5 0000 06dd 0000     -...Y...........
    304c:	06f1 0000                                   ....

00003050 <g_i2c_master_on_sci>:
    3050:	0c2d 0000 0b09 0000 0b9d 0000 0a51 0000     -...........Q...
    3060:	0a7d 0000 0a89 0000 0a99 0000 0ab1 0000     }...............

00003070 <g_uart_on_sci>:
    3070:	13c1 0000 1259 0000 1265 0000 12bd 0000     ....Y...e.......
    3080:	1319 0000 1325 0000 12ad 0000 118d 0000     ....%...........
    3090:	1361 0000 1375 0000 13bd 0000               a...u.......

0000309c <g_ioport>:
    309c:	0538 2000 3124 0000 301c 0000               8.. $1...0..

000030a8 <g_uart2>:
    30a8:	0540 2000 30b4 0000 3070 0000               @.. .0..p0..

000030b4 <g_uart2_cfg>:
    30b4:	0202 0000 000c 010c 020c 030c 0000 0000     ................
    30c4:	0000 0000 1c21 0000 0000 0000 30d4 0000     ....!........0..

000030d4 <g_uart2_cfg_extend>:
    30d4:	0100 0000 0000 2000 000f ffff 0000 0000     ....... ........
    30e4:	ffff 0000                                   ....

000030e8 <g_i2c4>:
    30e8:	0570 2000 30f4 0000 3050 0000               p.. .0..P0..

000030f4 <g_i2c4_cfg>:
    30f4:	0004 0000 86a0 0001 0050 0000 0c01 08df     ........P.......
    3104:	0009 0000 0000 0000 0000 0000 1bfd 0000     ................
    3114:	0000 0000 311c 0000                         .....1..

0000311c <g_i2c4_cfg_extend>:
    311c:	1401 ac00 011e 0000                         ........

00003124 <g_bsp_pin_cfg>:
    3124:	000a 0000 3130 0000 0000 0000               ....01......

00003130 <g_bsp_pin_cfg_data>:
    3130:	0000 0001 0108 0000 0000 0401 010c 0000     ................
    3140:	0000 0401 010d 0000 0040 0401 0206 0000     ........@.......
    3150:	0040 0401 0207 0000 0000 0001 0300 0000     @...............
    3160:	0004 0000 0400 0000 0000 0501 040a 0000     ................
    3170:	0000 0501 0706 0000 0000 0501 0707 0000     ................

00003180 <g_interrupt_event_link_select>:
    3180:	018c 018d 018e 018f 0192 0193 0194 0195     ................
    3190:	0199 019a 7553 6363 7365 2073 6f74 6f20     ....Success to o
    31a0:	6570 206e 6564 6976 6563 203a 3269 3463     pen device: i2c4
    31b0:	0d21 0000 6146 6c69 6465 7420 206f 706f     !...Failed to op
    31c0:	6e65 6420 7665 6369 3a65 6920 6332 2134     en device: i2c4!
    31d0:	000d 0000 4545 5250 4d4f 0000 7453 7261     ....EEPROM..Star
    31e0:	2074 6554 7473 5320 6d69 6c70 2065 3249     t Test Simple I2
    31f0:	2043 7457 7269 2f65 6552 6461 6120 4220     C Wtire/Read a B
    3200:	7479 2065 7246 6d6f 4120 3254 4335 3230     yte From AT25C02
    3210:	000d 0000 7c09 2020 7257 7469 2065 7c20     .....|  Write  |
    3220:	2020 6552 6461 2020 207c 5220 7365 6c75       Read  |  Resul
    3230:	2074 7c20 2020 6f43 6e75 2074 7c20 000d     t  |  Count  |..
    3240:	7c09 2020 2e25 6433 2020 207c 2520 332e     .|  %.3d  |  %.3
    3250:	2064 7c20 0000 0000 7553 6363 7365 0073     d  |....Success.
    3260:	2520 2073 207c 2520 322e 2064 7c20 0a0d      %s |  %.2d  |..
    3270:	0000 0000 7245 6f72 0072 0000 2520 2073     ....Error... %s 
    3280:	207c 2520 332e 2064 7c20 0a0d 0000 0000     |  %.3d  |......
    3290:	7453 7261 2074 6554 7473 5320 6d69 6c70     Start Test Simpl
    32a0:	2065 3249 2043 7257 7469 2f65 6552 6461     e I2C Write/Read
    32b0:	6e20 4220 7479 0d65 0000 0000 7c09 2020      n Byte......|  
    32c0:	6441 7264 7365 2073 7c20 2020 6953 657a     Address  |  Size
    32d0:	2020 207c 5220 7365 6c75 2074 7c20 2020       |  Result  |  
    32e0:	6f43 6e75 2074 7c20 000d 0000 6568 6c6c     Count  |....hell
    32f0:	206f 6f77 6c72 2164 4620 6f72 206d 756c     o world! From lu
    3300:	6b63 0d79 5200 4545 544e 6d20 6c61 6f6c     cky..REENT mallo
    3310:	2063 7573 6363 6565 6564 0064 2e2e 2e2f     c succeeded.../.
    3320:	2f2e 2e2e 2e2f 2f2e 2e2e 2e2f 2f2e 656e     ./../../../../ne
    3330:	6c77 6269 342d 352e 302e 322e 3230 3134     wlib-4.5.0.20241
    3340:	3332 2f31 656e 6c77 6269 6c2f 6269 2f63     231/newlib/libc/
    3350:	7473 6c64 6269 722f 6e61 2e64 0063 2d23     stdlib/rand.c.#-
    3360:	2b30 0020 6c68 004c 6665 4567 4746 3000     0+ .hlL.efgEFG.0
    3370:	3231 3433 3635 3837 4139 4342 4544 0046     123456789ABCDEF.
    3380:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef
    3390:	0000 0000                                   ....

00003394 <g_fsp_version_build_string>:
    3394:	7542 6c69 2074 6977 6874 5220 6e65 7365     Built with Renes
    33a4:	7361 4120 7664 6e61 6563 2064 6c46 7865     as Advanced Flex
    33b4:	6269 656c 5320 666f 7774 7261 2065 6150     ible Software Pa
    33c4:	6b63 6761 2065 6576 7372 6f69 206e 2e36     ckage version 6.
    33d4:	2e33 0030                                   3.0.

000033d8 <g_fsp_version_string>:
    33d8:	2e36 2e33 0030 0000                         6.3.0...

000033e0 <g_fsp_version>:
    33e0:	0000 0603                                   ....

Disassembly of section .init:

000033e4 <_init>:
    33e4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    33e6:	bf00      	nop

Disassembly of section .fini:

000033e8 <_fini>:
    33e8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    33ea:	bf00      	nop
