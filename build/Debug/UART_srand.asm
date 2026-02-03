
UART.elf:     file format elf32-littlearm


Disassembly of section __flash_readonly$$:

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

Disassembly of section .init:

Disassembly of section .fini:
