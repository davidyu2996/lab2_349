
kernel/kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <__start>:
    8000:	e10f0000 	mrs	r0, CPSR
    8004:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    8008:	e59fd034 	ldr	sp, [pc, #52]	; 8044 <hang+0x8>
    800c:	e121f000 	msr	CPSR_c, r0
    8010:	e59fd030 	ldr	sp, [pc, #48]	; 8048 <hang+0xc>
    8014:	e59f0030 	ldr	r0, [pc, #48]	; 804c <hang+0x10>
    8018:	e59f1030 	ldr	r1, [pc, #48]	; 8050 <hang+0x14>
    801c:	e3a02000 	mov	r2, #0
    8020:	e3a03000 	mov	r3, #0
    8024:	e3a04000 	mov	r4, #0
    8028:	e3a05000 	mov	r5, #0

0000802c <bss_loop>:
    802c:	e8a0003c 	stmia	r0!, {r2, r3, r4, r5}
    8030:	e1500001 	cmp	r0, r1
    8034:	3afffffc 	bcc	802c <bss_loop>
    8038:	eb000103 	bl	844c <kernel_main>

0000803c <hang>:
    803c:	e320f003 	wfi
    8040:	eafffffd 	b	803c <hang>
    8044:	0012c000 	andseq	ip, r2, r0
    8048:	0011b000 	andseq	fp, r1, r0
    804c:	0000a000 	andeq	sl, r0, r0
    8050:	0000b000 	andeq	fp, r0, r0

00008054 <gpio_config>:
    8054:	e3510007 	cmp	r1, #7
    8058:	93500035 	cmpls	r0, #53	; 0x35
    805c:	812fff1e 	bxhi	lr
    8060:	e30c2ccd 	movw	r2, #52429	; 0xcccd
    8064:	e34c2ccc 	movt	r2, #52428	; 0xcccc
    8068:	e0832290 	umull	r2, r3, r0, r2
    806c:	e1a0c1a3 	lsr	ip, r3, #3
    8070:	e6ef307c 	uxtb	r3, ip
    8074:	e1a03103 	lsl	r3, r3, #2
    8078:	e283343f 	add	r3, r3, #1056964608	; 0x3f000000
    807c:	e2833602 	add	r3, r3, #2097152	; 0x200000
    8080:	e5932000 	ldr	r2, [r3]
    8084:	e08cc10c 	add	ip, ip, ip, lsl #2
    8088:	e040008c 	sub	r0, r0, ip, lsl #1
    808c:	e6ef0070 	uxtb	r0, r0
    8090:	e0800080 	add	r0, r0, r0, lsl #1
    8094:	e3a0c007 	mov	ip, #7
    8098:	e1c2201c 	bic	r2, r2, ip, lsl r0
    809c:	e1820011 	orr	r0, r2, r1, lsl r0
    80a0:	e5830000 	str	r0, [r3]
    80a4:	e12fff1e 	bx	lr

000080a8 <gpio_set>:
    80a8:	e3500035 	cmp	r0, #53	; 0x35
    80ac:	812fff1e 	bxhi	lr
    80b0:	e350001f 	cmp	r0, #31
    80b4:	9a000006 	bls	80d4 <gpio_set+0x2c>
    80b8:	e2400020 	sub	r0, r0, #32
    80bc:	e3a03001 	mov	r3, #1
    80c0:	e1a00013 	lsl	r0, r3, r0
    80c4:	e3a03000 	mov	r3, #0
    80c8:	e3433f20 	movt	r3, #16160	; 0x3f20
    80cc:	e5830020 	str	r0, [r3, #32]
    80d0:	e12fff1e 	bx	lr
    80d4:	e3a03001 	mov	r3, #1
    80d8:	e1a00013 	lsl	r0, r3, r0
    80dc:	e3a03000 	mov	r3, #0
    80e0:	e3433f20 	movt	r3, #16160	; 0x3f20
    80e4:	e583001c 	str	r0, [r3, #28]
    80e8:	e12fff1e 	bx	lr

000080ec <gpio_clr>:
    80ec:	e3500035 	cmp	r0, #53	; 0x35
    80f0:	812fff1e 	bxhi	lr
    80f4:	e350001f 	cmp	r0, #31
    80f8:	9a000006 	bls	8118 <gpio_clr+0x2c>
    80fc:	e2400020 	sub	r0, r0, #32
    8100:	e3a03001 	mov	r3, #1
    8104:	e1a00013 	lsl	r0, r3, r0
    8108:	e3a03000 	mov	r3, #0
    810c:	e3433f20 	movt	r3, #16160	; 0x3f20
    8110:	e583002c 	str	r0, [r3, #44]	; 0x2c
    8114:	e12fff1e 	bx	lr
    8118:	e3a03001 	mov	r3, #1
    811c:	e1a00013 	lsl	r0, r3, r0
    8120:	e3a03000 	mov	r3, #0
    8124:	e3433f20 	movt	r3, #16160	; 0x3f20
    8128:	e5830028 	str	r0, [r3, #40]	; 0x28
    812c:	e12fff1e 	bx	lr

00008130 <gpio_set_pull>:
    8130:	e3510002 	cmp	r1, #2
    8134:	93500035 	cmpls	r0, #53	; 0x35
    8138:	812fff1e 	bxhi	lr
    813c:	e92d4038 	push	{r3, r4, r5, lr}
    8140:	e1a04000 	mov	r4, r0
    8144:	e3a03000 	mov	r3, #0
    8148:	e3433f20 	movt	r3, #16160	; 0x3f20
    814c:	e5831094 	str	r1, [r3, #148]	; 0x94
    8150:	e3a00096 	mov	r0, #150	; 0x96
    8154:	eb0001bb 	bl	8848 <delay_cycles>
    8158:	e354001f 	cmp	r4, #31
    815c:	9a00000a 	bls	818c <gpio_set_pull+0x5c>
    8160:	e2440020 	sub	r0, r4, #32
    8164:	e3a04001 	mov	r4, #1
    8168:	e1a00014 	lsl	r0, r4, r0
    816c:	e3a05000 	mov	r5, #0
    8170:	e3435f20 	movt	r5, #16160	; 0x3f20
    8174:	e585009c 	str	r0, [r5, #156]	; 0x9c
    8178:	e3a00096 	mov	r0, #150	; 0x96
    817c:	eb0001b1 	bl	8848 <delay_cycles>
    8180:	e3a03000 	mov	r3, #0
    8184:	e585309c 	str	r3, [r5, #156]	; 0x9c
    8188:	e8bd8038 	pop	{r3, r4, r5, pc}
    818c:	e3a00001 	mov	r0, #1
    8190:	e1a00410 	lsl	r0, r0, r4
    8194:	e3a05000 	mov	r5, #0
    8198:	e3435f20 	movt	r5, #16160	; 0x3f20
    819c:	e5850098 	str	r0, [r5, #152]	; 0x98
    81a0:	e3a00096 	mov	r0, #150	; 0x96
    81a4:	eb0001a7 	bl	8848 <delay_cycles>
    81a8:	e3a03000 	mov	r3, #0
    81ac:	e5853098 	str	r3, [r5, #152]	; 0x98
    81b0:	e8bd8038 	pop	{r3, r4, r5, pc}

000081b4 <printnumk>:
    81b4:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    81b8:	e24dd008 	sub	sp, sp, #8
    81bc:	e1a06002 	mov	r6, r2
    81c0:	e1a07003 	mov	r7, r3
    81c4:	e3500008 	cmp	r0, #8
    81c8:	0a000004 	beq	81e0 <printnumk+0x2c>
    81cc:	e3098018 	movw	r8, #36888	; 0x9018
    81d0:	e3408000 	movt	r8, #0
    81d4:	e3500010 	cmp	r0, #16
    81d8:	13a08000 	movne	r8, #0
    81dc:	ea000001 	b	81e8 <printnumk+0x34>
    81e0:	e3098014 	movw	r8, #36884	; 0x9014
    81e4:	e3408000 	movt	r8, #0
    81e8:	e28d4007 	add	r4, sp, #7
    81ec:	e1a05000 	mov	r5, r0
    81f0:	e3a09000 	mov	r9, #0
    81f4:	e309a000 	movw	sl, #36864	; 0x9000
    81f8:	e340a000 	movt	sl, #0
    81fc:	e1a00006 	mov	r0, r6
    8200:	e1a01007 	mov	r1, r7
    8204:	e1a02005 	mov	r2, r5
    8208:	e1a03009 	mov	r3, r9
    820c:	eb0001d4 	bl	8964 <__aeabi_uldivmod>
    8210:	e7da3002 	ldrb	r3, [sl, r2]
    8214:	e4443001 	strb	r3, [r4], #-1
    8218:	e1a00006 	mov	r0, r6
    821c:	e1a01007 	mov	r1, r7
    8220:	e1a02005 	mov	r2, r5
    8224:	e1a03009 	mov	r3, r9
    8228:	eb0001cd 	bl	8964 <__aeabi_uldivmod>
    822c:	e1a06000 	mov	r6, r0
    8230:	e1a07001 	mov	r7, r1
    8234:	e1963007 	orrs	r3, r6, r7
    8238:	1affffef 	bne	81fc <printnumk+0x48>
    823c:	e3580000 	cmp	r8, #0
    8240:	0a000002 	beq	8250 <printnumk+0x9c>
    8244:	e5d80000 	ldrb	r0, [r8]
    8248:	e3500000 	cmp	r0, #0
    824c:	1a000004 	bne	8264 <printnumk+0xb0>
    8250:	e2844001 	add	r4, r4, #1
    8254:	e28d3008 	add	r3, sp, #8
    8258:	e1540003 	cmp	r4, r3
    825c:	1a000005 	bne	8278 <printnumk+0xc4>
    8260:	ea000009 	b	828c <printnumk+0xd8>
    8264:	eb0000da 	bl	85d4 <uart_put_byte>
    8268:	e5f80001 	ldrb	r0, [r8, #1]!
    826c:	e3500000 	cmp	r0, #0
    8270:	1afffffb 	bne	8264 <printnumk+0xb0>
    8274:	eafffff5 	b	8250 <printnumk+0x9c>
    8278:	e4d40001 	ldrb	r0, [r4], #1
    827c:	eb0000d4 	bl	85d4 <uart_put_byte>
    8280:	e28d3008 	add	r3, sp, #8
    8284:	e1540003 	cmp	r4, r3
    8288:	1afffffa 	bne	8278 <printnumk+0xc4>
    828c:	e28dd008 	add	sp, sp, #8
    8290:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}

00008294 <printk>:
    8294:	e92d000f 	push	{r0, r1, r2, r3}
    8298:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    829c:	e24dd008 	sub	sp, sp, #8
    82a0:	e59d4020 	ldr	r4, [sp, #32]
    82a4:	e28d3024 	add	r3, sp, #36	; 0x24
    82a8:	e58d3004 	str	r3, [sp, #4]
    82ac:	e3a06000 	mov	r6, #0
    82b0:	e3a08008 	mov	r8, #8
    82b4:	e3a07010 	mov	r7, #16
    82b8:	ea00005c 	b	8430 <printk+0x19c>
    82bc:	e3500025 	cmp	r0, #37	; 0x25
    82c0:	0a000002 	beq	82d0 <printk+0x3c>
    82c4:	e2844001 	add	r4, r4, #1
    82c8:	eb0000c1 	bl	85d4 <uart_put_byte>
    82cc:	ea000057 	b	8430 <printk+0x19c>
    82d0:	e5d43001 	ldrb	r3, [r4, #1]
    82d4:	e353006f 	cmp	r3, #111	; 0x6f
    82d8:	0a00002c 	beq	8390 <printk+0xfc>
    82dc:	8a000006 	bhi	82fc <printk+0x68>
    82e0:	e3530063 	cmp	r3, #99	; 0x63
    82e4:	0a000045 	beq	8400 <printk+0x16c>
    82e8:	e3530064 	cmp	r3, #100	; 0x64
    82ec:	0a00000d 	beq	8328 <printk+0x94>
    82f0:	e3530025 	cmp	r3, #37	; 0x25
    82f4:	1a00004a 	bne	8424 <printk+0x190>
    82f8:	ea000046 	b	8418 <printk+0x184>
    82fc:	e3530073 	cmp	r3, #115	; 0x73
    8300:	0a000032 	beq	83d0 <printk+0x13c>
    8304:	8a000002 	bhi	8314 <printk+0x80>
    8308:	e3530070 	cmp	r3, #112	; 0x70
    830c:	0a000027 	beq	83b0 <printk+0x11c>
    8310:	ea000043 	b	8424 <printk+0x190>
    8314:	e3530075 	cmp	r3, #117	; 0x75
    8318:	0a000014 	beq	8370 <printk+0xdc>
    831c:	e3530078 	cmp	r3, #120	; 0x78
    8320:	0a000022 	beq	83b0 <printk+0x11c>
    8324:	ea00003e 	b	8424 <printk+0x190>
    8328:	e59d3004 	ldr	r3, [sp, #4]
    832c:	e2832004 	add	r2, r3, #4
    8330:	e58d2004 	str	r2, [sp, #4]
    8334:	e5935000 	ldr	r5, [r3]
    8338:	e3550000 	cmp	r5, #0
    833c:	aa000006 	bge	835c <printk+0xc8>
    8340:	e3a0002d 	mov	r0, #45	; 0x2d
    8344:	eb0000a2 	bl	85d4 <uart_put_byte>
    8348:	e2652000 	rsb	r2, r5, #0
    834c:	e3a0000a 	mov	r0, #10
    8350:	e1a03fc2 	asr	r3, r2, #31
    8354:	ebffff96 	bl	81b4 <printnumk>
    8358:	ea000033 	b	842c <printk+0x198>
    835c:	e3a0000a 	mov	r0, #10
    8360:	e1a02005 	mov	r2, r5
    8364:	e1a03fc5 	asr	r3, r5, #31
    8368:	ebffff91 	bl	81b4 <printnumk>
    836c:	ea00002e 	b	842c <printk+0x198>
    8370:	e59d3004 	ldr	r3, [sp, #4]
    8374:	e2832004 	add	r2, r3, #4
    8378:	e58d2004 	str	r2, [sp, #4]
    837c:	e3a0000a 	mov	r0, #10
    8380:	e5932000 	ldr	r2, [r3]
    8384:	e1a03006 	mov	r3, r6
    8388:	ebffff89 	bl	81b4 <printnumk>
    838c:	ea000026 	b	842c <printk+0x198>
    8390:	e59d3004 	ldr	r3, [sp, #4]
    8394:	e2832004 	add	r2, r3, #4
    8398:	e58d2004 	str	r2, [sp, #4]
    839c:	e1a00008 	mov	r0, r8
    83a0:	e5932000 	ldr	r2, [r3]
    83a4:	e1a03006 	mov	r3, r6
    83a8:	ebffff81 	bl	81b4 <printnumk>
    83ac:	ea00001e 	b	842c <printk+0x198>
    83b0:	e59d3004 	ldr	r3, [sp, #4]
    83b4:	e2832004 	add	r2, r3, #4
    83b8:	e58d2004 	str	r2, [sp, #4]
    83bc:	e1a00007 	mov	r0, r7
    83c0:	e5932000 	ldr	r2, [r3]
    83c4:	e1a03006 	mov	r3, r6
    83c8:	ebffff79 	bl	81b4 <printnumk>
    83cc:	ea000016 	b	842c <printk+0x198>
    83d0:	e59d3004 	ldr	r3, [sp, #4]
    83d4:	e2832004 	add	r2, r3, #4
    83d8:	e58d2004 	str	r2, [sp, #4]
    83dc:	e5935000 	ldr	r5, [r3]
    83e0:	e5d50000 	ldrb	r0, [r5]
    83e4:	e3500000 	cmp	r0, #0
    83e8:	0a00000f 	beq	842c <printk+0x198>
    83ec:	eb000078 	bl	85d4 <uart_put_byte>
    83f0:	e5f50001 	ldrb	r0, [r5, #1]!
    83f4:	e3500000 	cmp	r0, #0
    83f8:	1afffffb 	bne	83ec <printk+0x158>
    83fc:	ea00000a 	b	842c <printk+0x198>
    8400:	e59d3004 	ldr	r3, [sp, #4]
    8404:	e2832004 	add	r2, r3, #4
    8408:	e58d2004 	str	r2, [sp, #4]
    840c:	e5d30000 	ldrb	r0, [r3]
    8410:	eb00006f 	bl	85d4 <uart_put_byte>
    8414:	ea000004 	b	842c <printk+0x198>
    8418:	e3a00025 	mov	r0, #37	; 0x25
    841c:	eb00006c 	bl	85d4 <uart_put_byte>
    8420:	ea000001 	b	842c <printk+0x198>
    8424:	e3e00000 	mvn	r0, #0
    8428:	ea000003 	b	843c <printk+0x1a8>
    842c:	e2844002 	add	r4, r4, #2
    8430:	e5d40000 	ldrb	r0, [r4]
    8434:	e3500000 	cmp	r0, #0
    8438:	1affff9f 	bne	82bc <printk+0x28>
    843c:	e28dd008 	add	sp, sp, #8
    8440:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8444:	e28dd010 	add	sp, sp, #16
    8448:	e12fff1e 	bx	lr

0000844c <kernel_main>:
    844c:	e92d4008 	push	{r3, lr}
    8450:	eb00003e 	bl	8550 <uart_init>
    8454:	eb00011b 	bl	88c8 <install_interrupt_table>
    8458:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    845c:	eb000071 	bl	8628 <timer_start>
    8460:	eb000104 	bl	8878 <enable_interrupts>
    8464:	e3a03a0b 	mov	r3, #45056	; 0xb000
    8468:	e3433f00 	movt	r3, #16128	; 0x3f00
    846c:	e3a02001 	mov	r2, #1
    8470:	e5832218 	str	r2, [r3, #536]	; 0x218
    8474:	eb000132 	bl	8944 <enter_user_mode>
    8478:	eafffffe 	b	8478 <kernel_main+0x2c>

0000847c <irq_c_handler>:
    847c:	e92d4008 	push	{r3, lr}
    8480:	eb000078 	bl	8668 <timer_is_pending>
    8484:	e3500000 	cmp	r0, #0
    8488:	08bd8008 	popeq	{r3, pc}
    848c:	eb00007c 	bl	8684 <timer_clear_pending>
    8490:	e8bd8008 	pop	{r3, pc}

00008494 <swi_c_handler>:
    8494:	e92d4008 	push	{r3, lr}
    8498:	e1a03001 	mov	r3, r1
    849c:	e3500007 	cmp	r0, #7
    84a0:	979ff100 	ldrls	pc, [pc, r0, lsl #2]
    84a4:	ea000027 	b	8548 <swi_c_handler+0xb4>
    84a8:	000084c8 	andeq	r8, r0, r8, asr #9
    84ac:	000084d4 	ldrdeq	r8, [r0], -r4
    84b0:	000084e8 	andeq	r8, r0, r8, ror #9
    84b4:	000084f4 	strdeq	r8, [r0], -r4
    84b8:	00008504 	andeq	r8, r0, r4, lsl #10
    84bc:	00008510 	andeq	r8, r0, r0, lsl r5
    84c0:	00008524 	andeq	r8, r0, r4, lsr #10
    84c4:	00008538 	andeq	r8, r0, r8, lsr r5
    84c8:	e5910000 	ldr	r0, [r1]
    84cc:	eb0000bc 	bl	87c4 <syscall_sbrk>
    84d0:	e8bd8008 	pop	{r3, pc}
    84d4:	e5910000 	ldr	r0, [r1]
    84d8:	e5911004 	ldr	r1, [r1, #4]
    84dc:	e5932008 	ldr	r2, [r3, #8]
    84e0:	eb000073 	bl	86b4 <syscall_write>
    84e4:	e8bd8008 	pop	{r3, pc}
    84e8:	e5910000 	ldr	r0, [r1]
    84ec:	eb0000ca 	bl	881c <syscall_close>
    84f0:	e8bd8008 	pop	{r3, pc}
    84f4:	e5910000 	ldr	r0, [r1]
    84f8:	e5911004 	ldr	r1, [r1, #4]
    84fc:	eb0000c8 	bl	8824 <syscall_fstat>
    8500:	e8bd8008 	pop	{r3, pc}
    8504:	e5910000 	ldr	r0, [r1]
    8508:	eb0000c7 	bl	882c <syscall_isatty>
    850c:	e8bd8008 	pop	{r3, pc}
    8510:	e5910000 	ldr	r0, [r1]
    8514:	e5911004 	ldr	r1, [r1, #4]
    8518:	e5932008 	ldr	r2, [r3, #8]
    851c:	eb0000c4 	bl	8834 <syscall_lseek>
    8520:	e8bd8008 	pop	{r3, pc}
    8524:	e5910000 	ldr	r0, [r1]
    8528:	e5911004 	ldr	r1, [r1, #4]
    852c:	e5932008 	ldr	r2, [r3, #8]
    8530:	eb000071 	bl	86fc <syscall_read>
    8534:	e8bd8008 	pop	{r3, pc}
    8538:	e5910000 	ldr	r0, [r1]
    853c:	eb000055 	bl	8698 <syscall_exit>
    8540:	e3a00000 	mov	r0, #0
    8544:	e8bd8008 	pop	{r3, pc}
    8548:	e3a00000 	mov	r0, #0
    854c:	e8bd8008 	pop	{r3, pc}

00008550 <uart_init>:
    8550:	e92d4008 	push	{r3, lr}
    8554:	e3a0000f 	mov	r0, #15
    8558:	e3a01000 	mov	r1, #0
    855c:	ebfffef3 	bl	8130 <gpio_set_pull>
    8560:	e3a0000e 	mov	r0, #14
    8564:	e3a01000 	mov	r1, #0
    8568:	ebfffef0 	bl	8130 <gpio_set_pull>
    856c:	e3a0000f 	mov	r0, #15
    8570:	e3a01002 	mov	r1, #2
    8574:	ebfffeb6 	bl	8054 <gpio_config>
    8578:	e3a0000e 	mov	r0, #14
    857c:	e3a01002 	mov	r1, #2
    8580:	ebfffeb3 	bl	8054 <gpio_config>
    8584:	e3a03a05 	mov	r3, #20480	; 0x5000
    8588:	e3433f21 	movt	r3, #16161	; 0x3f21
    858c:	e3a02001 	mov	r2, #1
    8590:	e5832004 	str	r2, [r3, #4]
    8594:	e3a02000 	mov	r2, #0
    8598:	e5832044 	str	r2, [r3, #68]	; 0x44
    859c:	e5932048 	ldr	r2, [r3, #72]	; 0x48
    85a0:	e3822006 	orr	r2, r2, #6
    85a4:	e5832048 	str	r2, [r3, #72]	; 0x48
    85a8:	e3a02003 	mov	r2, #3
    85ac:	e583204c 	str	r2, [r3, #76]	; 0x4c
    85b0:	e5832060 	str	r2, [r3, #96]	; 0x60
    85b4:	e300210e 	movw	r2, #270	; 0x10e
    85b8:	e5832068 	str	r2, [r3, #104]	; 0x68
    85bc:	e8bd8008 	pop	{r3, pc}

000085c0 <uart_close>:
    85c0:	e3a03a05 	mov	r3, #20480	; 0x5000
    85c4:	e3433f21 	movt	r3, #16161	; 0x3f21
    85c8:	e3a02000 	mov	r2, #0
    85cc:	e5832004 	str	r2, [r3, #4]
    85d0:	e12fff1e 	bx	lr

000085d4 <uart_put_byte>:
    85d4:	e3a02a05 	mov	r2, #20480	; 0x5000
    85d8:	e3432f21 	movt	r2, #16161	; 0x3f21
    85dc:	e5923048 	ldr	r3, [r2, #72]	; 0x48
    85e0:	e2033006 	and	r3, r3, #6
    85e4:	e3530002 	cmp	r3, #2
    85e8:	1afffffb 	bne	85dc <uart_put_byte+0x8>
    85ec:	e3a03a05 	mov	r3, #20480	; 0x5000
    85f0:	e3433f21 	movt	r3, #16161	; 0x3f21
    85f4:	e5830040 	str	r0, [r3, #64]	; 0x40
    85f8:	e12fff1e 	bx	lr

000085fc <uart_get_byte>:
    85fc:	e3a02a05 	mov	r2, #20480	; 0x5000
    8600:	e3432f21 	movt	r2, #16161	; 0x3f21
    8604:	e5923048 	ldr	r3, [r2, #72]	; 0x48
    8608:	e2033006 	and	r3, r3, #6
    860c:	e3530004 	cmp	r3, #4
    8610:	1afffffb 	bne	8604 <uart_get_byte+0x8>
    8614:	e3a03a05 	mov	r3, #20480	; 0x5000
    8618:	e3433f21 	movt	r3, #16161	; 0x3f21
    861c:	e5930040 	ldr	r0, [r3, #64]	; 0x40
    8620:	e6ef0070 	uxtb	r0, r0
    8624:	e12fff1e 	bx	lr

00008628 <timer_start>:
    8628:	e3a02a0b 	mov	r2, #45056	; 0xb000
    862c:	e3432f00 	movt	r2, #16128	; 0x3f00
    8630:	e3a030a2 	mov	r3, #162	; 0xa2
    8634:	e5823408 	str	r3, [r2, #1032]	; 0x408
    8638:	e0603280 	rsb	r3, r0, r0, lsl #5
    863c:	e0800103 	add	r0, r0, r3, lsl #2
    8640:	e1a00180 	lsl	r0, r0, #3
    8644:	e5820400 	str	r0, [r2, #1024]	; 0x400
    8648:	e3a030f9 	mov	r3, #249	; 0xf9
    864c:	e582341c 	str	r3, [r2, #1052]	; 0x41c
    8650:	e12fff1e 	bx	lr

00008654 <timer_stop>:
    8654:	e3a03a0b 	mov	r3, #45056	; 0xb000
    8658:	e3433f00 	movt	r3, #16128	; 0x3f00
    865c:	e3a02002 	mov	r2, #2
    8660:	e5832408 	str	r2, [r3, #1032]	; 0x408
    8664:	e12fff1e 	bx	lr

00008668 <timer_is_pending>:
    8668:	e3a03a0b 	mov	r3, #45056	; 0xb000
    866c:	e3433f00 	movt	r3, #16128	; 0x3f00
    8670:	e5930410 	ldr	r0, [r3, #1040]	; 0x410
    8674:	e3500001 	cmp	r0, #1
    8678:	13a00000 	movne	r0, #0
    867c:	03a00001 	moveq	r0, #1
    8680:	e12fff1e 	bx	lr

00008684 <timer_clear_pending>:
    8684:	e3a03a0b 	mov	r3, #45056	; 0xb000
    8688:	e3433f00 	movt	r3, #16128	; 0x3f00
    868c:	e3a02001 	mov	r2, #1
    8690:	e583240c 	str	r2, [r3, #1036]	; 0x40c
    8694:	e12fff1e 	bx	lr

00008698 <syscall_exit>:
    8698:	e92d4008 	push	{r3, lr}
    869c:	e1a01000 	mov	r1, r0
    86a0:	e309001c 	movw	r0, #36892	; 0x901c
    86a4:	e3400000 	movt	r0, #0
    86a8:	ebfffef9 	bl	8294 <printk>
    86ac:	eb00006c 	bl	8864 <disable_interrupts>
    86b0:	eafffffe 	b	86b0 <syscall_exit+0x18>

000086b4 <syscall_write>:
    86b4:	e3500001 	cmp	r0, #1
    86b8:	1a00000d 	bne	86f4 <syscall_write+0x40>
    86bc:	e92d4070 	push	{r4, r5, r6, lr}
    86c0:	e1a06002 	mov	r6, r2
    86c4:	e3520000 	cmp	r2, #0
    86c8:	da000006 	ble	86e8 <syscall_write+0x34>
    86cc:	e1a04001 	mov	r4, r1
    86d0:	e0815002 	add	r5, r1, r2
    86d4:	e4d40001 	ldrb	r0, [r4], #1
    86d8:	ebffffbd 	bl	85d4 <uart_put_byte>
    86dc:	e1540005 	cmp	r4, r5
    86e0:	1afffffb 	bne	86d4 <syscall_write+0x20>
    86e4:	ea000000 	b	86ec <syscall_write+0x38>
    86e8:	e3a06000 	mov	r6, #0
    86ec:	e1a00006 	mov	r0, r6
    86f0:	e8bd8070 	pop	{r4, r5, r6, pc}
    86f4:	e3e00000 	mvn	r0, #0
    86f8:	e12fff1e 	bx	lr

000086fc <syscall_read>:
    86fc:	e3500000 	cmp	r0, #0
    8700:	1a000027 	bne	87a4 <syscall_read+0xa8>
    8704:	e92d43f8 	push	{r3, r4, r5, r6, r7, r8, r9, lr}
    8708:	e3520000 	cmp	r2, #0
    870c:	da000021 	ble	8798 <syscall_read+0x9c>
    8710:	e1a06002 	mov	r6, r2
    8714:	e1a07001 	mov	r7, r1
    8718:	e3a05000 	mov	r5, #0
    871c:	e3a08008 	mov	r8, #8
    8720:	e3a09020 	mov	r9, #32
    8724:	ebffffb4 	bl	85fc <uart_get_byte>
    8728:	e1a04000 	mov	r4, r0
    872c:	e3500004 	cmp	r0, #4
    8730:	0a00001d 	beq	87ac <syscall_read+0xb0>
    8734:	e3500008 	cmp	r0, #8
    8738:	1350007f 	cmpne	r0, #127	; 0x7f
    873c:	1a000007 	bne	8760 <syscall_read+0x64>
    8740:	e1a00008 	mov	r0, r8
    8744:	ebffffa2 	bl	85d4 <uart_put_byte>
    8748:	e1a00009 	mov	r0, r9
    874c:	ebffffa0 	bl	85d4 <uart_put_byte>
    8750:	e1a00008 	mov	r0, r8
    8754:	ebffff9e 	bl	85d4 <uart_put_byte>
    8758:	e2455001 	sub	r5, r5, #1
    875c:	ea00000a 	b	878c <syscall_read+0x90>
    8760:	e350000a 	cmp	r0, #10
    8764:	1350000d 	cmpne	r0, #13
    8768:	1a000004 	bne	8780 <syscall_read+0x84>
    876c:	e3a0000a 	mov	r0, #10
    8770:	e7c70005 	strb	r0, [r7, r5]
    8774:	ebffff96 	bl	85d4 <uart_put_byte>
    8778:	e2850001 	add	r0, r5, #1
    877c:	e8bd83f8 	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
    8780:	ebffff93 	bl	85d4 <uart_put_byte>
    8784:	e7c74005 	strb	r4, [r7, r5]
    8788:	e2855001 	add	r5, r5, #1
    878c:	e1560005 	cmp	r6, r5
    8790:	caffffe3 	bgt	8724 <syscall_read+0x28>
    8794:	ea000000 	b	879c <syscall_read+0xa0>
    8798:	e3a05000 	mov	r5, #0
    879c:	e1a00005 	mov	r0, r5
    87a0:	e8bd83f8 	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
    87a4:	e3e00000 	mvn	r0, #0
    87a8:	e12fff1e 	bx	lr
    87ac:	e1a00005 	mov	r0, r5
    87b0:	e8bd83f8 	pop	{r3, r4, r5, r6, r7, r8, r9, pc}

000087b4 <syscall_servo_enable>:
    87b4:	e3a00000 	mov	r0, #0
    87b8:	e12fff1e 	bx	lr

000087bc <syscall_servo_set>:
    87bc:	e3a00000 	mov	r0, #0
    87c0:	e12fff1e 	bx	lr

000087c4 <syscall_sbrk>:
    87c4:	e30a3000 	movw	r3, #40960	; 0xa000
    87c8:	e3403000 	movt	r3, #0
    87cc:	e5933000 	ldr	r3, [r3]
    87d0:	e3530000 	cmp	r3, #0
    87d4:	030a3000 	movweq	r3, #40960	; 0xa000
    87d8:	03403000 	movteq	r3, #0
    87dc:	030b2000 	movweq	r2, #45056	; 0xb000
    87e0:	03402000 	movteq	r2, #0
    87e4:	05832000 	streq	r2, [r3]
    87e8:	e30a3000 	movw	r3, #40960	; 0xa000
    87ec:	e3403000 	movt	r3, #0
    87f0:	e5933000 	ldr	r3, [r3]
    87f4:	e0830000 	add	r0, r3, r0
    87f8:	e30b2000 	movw	r2, #45056	; 0xb000
    87fc:	e3402010 	movt	r2, #16
    8800:	e1500002 	cmp	r0, r2
    8804:	930a2000 	movwls	r2, #40960	; 0xa000
    8808:	93402000 	movtls	r2, #0
    880c:	95820000 	strls	r0, [r2]
    8810:	91a00003 	movls	r0, r3
    8814:	83e00000 	mvnhi	r0, #0
    8818:	e12fff1e 	bx	lr

0000881c <syscall_close>:
    881c:	e3e00000 	mvn	r0, #0
    8820:	e12fff1e 	bx	lr

00008824 <syscall_fstat>:
    8824:	e3a00000 	mov	r0, #0
    8828:	e12fff1e 	bx	lr

0000882c <syscall_isatty>:
    882c:	e3a00001 	mov	r0, #1
    8830:	e12fff1e 	bx	lr

00008834 <syscall_lseek>:
    8834:	e3a00000 	mov	r0, #0
    8838:	e12fff1e 	bx	lr

0000883c <servo_init>:
    883c:	e12fff1e 	bx	lr

00008840 <servo_enable>:
    8840:	e12fff1e 	bx	lr

00008844 <servo_set>:
    8844:	e12fff1e 	bx	lr

00008848 <delay_cycles>:
    8848:	e2500001 	subs	r0, r0, #1
    884c:	1afffffd 	bne	8848 <delay_cycles>
    8850:	e1a0f00e 	mov	pc, lr

00008854 <read_cpsr>:
    8854:	e10f0000 	mrs	r0, CPSR
    8858:	e1a0f00e 	mov	pc, lr

0000885c <write_cpsr>:
    885c:	e129f000 	msr	CPSR_fc, r0
    8860:	e1a0f00e 	mov	pc, lr

00008864 <disable_interrupts>:
    8864:	e10f0000 	mrs	r0, CPSR
    8868:	e3a01d07 	mov	r1, #448	; 0x1c0
    886c:	e1800001 	orr	r0, r0, r1
    8870:	e129f000 	msr	CPSR_fc, r0
    8874:	e1a0f00e 	mov	pc, lr

00008878 <enable_interrupts>:
    8878:	e10f0000 	mrs	r0, CPSR
    887c:	e3a01d07 	mov	r1, #448	; 0x1c0
    8880:	e1c00001 	bic	r0, r0, r1
    8884:	e129f000 	msr	CPSR_fc, r0
    8888:	e1a0f00e 	mov	pc, lr

0000888c <interrupt_vector_table>:
    888c:	e59ff018 	ldr	pc, [pc, #24]	; 88ac <_reset_asm_handler>
    8890:	e59ff018 	ldr	pc, [pc, #24]	; 88b0 <_undefined_instruction_asm_handler>
    8894:	e59ff018 	ldr	pc, [pc, #24]	; 88b4 <_swi_asm_handler>
    8898:	e59ff018 	ldr	pc, [pc, #24]	; 88b8 <_prefetch_abort_asm_handler>
    889c:	e59ff018 	ldr	pc, [pc, #24]	; 88bc <_data_abort_asm_handler>
    88a0:	e59ff004 	ldr	pc, [pc, #4]	; 88ac <_reset_asm_handler>
    88a4:	e59ff014 	ldr	pc, [pc, #20]	; 88c0 <_irq_asm_handler>
    88a8:	e59ff014 	ldr	pc, [pc, #20]	; 88c4 <_fiq_asm_handler>

000088ac <_reset_asm_handler>:
    88ac:	00008930 	andeq	r8, r0, r0, lsr r9

000088b0 <_undefined_instruction_asm_handler>:
    88b0:	00008934 	andeq	r8, r0, r4, lsr r9

000088b4 <_swi_asm_handler>:
    88b4:	000088e4 	andeq	r8, r0, r4, ror #17

000088b8 <_prefetch_abort_asm_handler>:
    88b8:	00008938 	andeq	r8, r0, r8, lsr r9

000088bc <_data_abort_asm_handler>:
    88bc:	0000893c 	andeq	r8, r0, ip, lsr r9

000088c0 <_irq_asm_handler>:
    88c0:	0000891c 	andeq	r8, r0, ip, lsl r9

000088c4 <_fiq_asm_handler>:
    88c4:	00008940 	andeq	r8, r0, r0, asr #18

000088c8 <install_interrupt_table>:
    88c8:	e59f8084 	ldr	r8, [pc, #132]	; 8954 <enter_user_mode+0x10>
    88cc:	e3a09000 	mov	r9, #0
    88d0:	e8b800ff 	ldm	r8!, {r0, r1, r2, r3, r4, r5, r6, r7}
    88d4:	e8a900ff 	stmia	r9!, {r0, r1, r2, r3, r4, r5, r6, r7}
    88d8:	e8b8007f 	ldm	r8!, {r0, r1, r2, r3, r4, r5, r6}
    88dc:	e8a9007f 	stmia	r9!, {r0, r1, r2, r3, r4, r5, r6}
    88e0:	e1a0f00e 	mov	pc, lr

000088e4 <swi_asm_handler>:
    88e4:	e24dd004 	sub	sp, sp, #4
    88e8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    88ec:	e14f2000 	mrs	r2, SPSR
    88f0:	e58d2038 	str	r2, [sp, #56]	; 0x38
    88f4:	e1a0100d 	mov	r1, sp
    88f8:	e51e0004 	ldr	r0, [lr, #-4]
    88fc:	e3c004ff 	bic	r0, r0, #-16777216	; 0xff000000
    8900:	ebfffee3 	bl	8494 <swi_c_handler>
    8904:	e59d2038 	ldr	r2, [sp, #56]	; 0x38
    8908:	e169f002 	msr	SPSR_fc, r2
    890c:	e28dd004 	add	sp, sp, #4
    8910:	e8bd5ffe 	pop	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    8914:	e28dd004 	add	sp, sp, #4
    8918:	e1b0f00e 	movs	pc, lr

0000891c <irq_asm_handler>:
    891c:	e59fd034 	ldr	sp, [pc, #52]	; 8958 <enter_user_mode+0x14>
    8920:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    8924:	ebfffed4 	bl	847c <irq_c_handler>
    8928:	e8bd5fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    892c:	e25ef004 	subs	pc, lr, #4

00008930 <reset_asm_handler>:
    8930:	eafffdb2 	b	8000 <__start>

00008934 <undefined_instruction_asm_handler>:
    8934:	e1200070 	bkpt	0x0000

00008938 <prefetch_abort_asm_handler>:
    8938:	e1200070 	bkpt	0x0000

0000893c <data_abort_asm_handler>:
    893c:	e1200070 	bkpt	0x0000

00008940 <fiq_asm_handler>:
    8940:	e1200070 	bkpt	0x0000

00008944 <enter_user_mode>:
    8944:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    8948:	f10a0090 	cpsie	i,#16
    894c:	e59fd008 	ldr	sp, [pc, #8]	; 895c <enter_user_mode+0x18>
    8950:	e59ff008 	ldr	pc, [pc, #8]	; 8960 <enter_user_mode+0x1c>
    8954:	0000888c 	andeq	r8, r0, ip, lsl #17
    8958:	0012c000 	andseq	ip, r2, r0
    895c:	0012b000 	andseq	fp, r2, r0
    8960:	00300000 	eorseq	r0, r0, r0

00008964 <__aeabi_uldivmod>:
    8964:	e3530000 	cmp	r3, #0
    8968:	03520000 	cmpeq	r2, #0
    896c:	1a000004 	bne	8984 <__aeabi_uldivmod+0x20>
    8970:	e3510000 	cmp	r1, #0
    8974:	03500000 	cmpeq	r0, #0
    8978:	13e01000 	mvnne	r1, #0
    897c:	13e00000 	mvnne	r0, #0
    8980:	ea000027 	b	8a24 <__aeabi_idiv0>
    8984:	e24dd008 	sub	sp, sp, #8
    8988:	e92d6000 	push	{sp, lr}
    898c:	eb000014 	bl	89e4 <__gnu_uldivmod_helper>
    8990:	e59de004 	ldr	lr, [sp, #4]
    8994:	e28dd008 	add	sp, sp, #8
    8998:	e8bd000c 	pop	{r2, r3}
    899c:	e12fff1e 	bx	lr

000089a0 <__gnu_ldivmod_helper>:
    89a0:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    89a4:	e59d6020 	ldr	r6, [sp, #32]
    89a8:	e1a07002 	mov	r7, r2
    89ac:	e1a0a003 	mov	sl, r3
    89b0:	e1a04000 	mov	r4, r0
    89b4:	e1a05001 	mov	r5, r1
    89b8:	eb00001a 	bl	8a28 <__divdi3>
    89bc:	e1a03000 	mov	r3, r0
    89c0:	e0020197 	mul	r2, r7, r1
    89c4:	e0898097 	umull	r8, r9, r7, r0
    89c8:	e023239a 	mla	r3, sl, r3, r2
    89cc:	e0544008 	subs	r4, r4, r8
    89d0:	e0839009 	add	r9, r3, r9
    89d4:	e0c55009 	sbc	r5, r5, r9
    89d8:	e8860030 	stm	r6, {r4, r5}
    89dc:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    89e0:	e12fff1e 	bx	lr

000089e4 <__gnu_uldivmod_helper>:
    89e4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    89e8:	e59d5018 	ldr	r5, [sp, #24]
    89ec:	e1a04002 	mov	r4, r2
    89f0:	e1a08003 	mov	r8, r3
    89f4:	e1a06000 	mov	r6, r0
    89f8:	e1a07001 	mov	r7, r1
    89fc:	eb000067 	bl	8ba0 <__udivdi3>
    8a00:	e0080890 	mul	r8, r0, r8
    8a04:	e0832490 	umull	r2, r3, r0, r4
    8a08:	e0248491 	mla	r4, r1, r4, r8
    8a0c:	e0566002 	subs	r6, r6, r2
    8a10:	e0843003 	add	r3, r4, r3
    8a14:	e0c77003 	sbc	r7, r7, r3
    8a18:	e88500c0 	stm	r5, {r6, r7}
    8a1c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8a20:	e12fff1e 	bx	lr

00008a24 <__aeabi_idiv0>:
    8a24:	e12fff1e 	bx	lr

00008a28 <__divdi3>:
    8a28:	e3510000 	cmp	r1, #0
    8a2c:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8a30:	a1a04000 	movge	r4, r0
    8a34:	a1a05001 	movge	r5, r1
    8a38:	a3a0a000 	movge	sl, #0
    8a3c:	ba000053 	blt	8b90 <__divdi3+0x168>
    8a40:	e3530000 	cmp	r3, #0
    8a44:	a1a08002 	movge	r8, r2
    8a48:	a1a09003 	movge	r9, r3
    8a4c:	ba00004b 	blt	8b80 <__divdi3+0x158>
    8a50:	e1550009 	cmp	r5, r9
    8a54:	01540008 	cmpeq	r4, r8
    8a58:	33a02000 	movcc	r2, #0
    8a5c:	33a03000 	movcc	r3, #0
    8a60:	3a00003b 	bcc	8b54 <__divdi3+0x12c>
    8a64:	e1a01009 	mov	r1, r9
    8a68:	e1a00008 	mov	r0, r8
    8a6c:	eb000093 	bl	8cc0 <__clzdi2>
    8a70:	e1a01005 	mov	r1, r5
    8a74:	e1a0b000 	mov	fp, r0
    8a78:	e1a00004 	mov	r0, r4
    8a7c:	eb00008f 	bl	8cc0 <__clzdi2>
    8a80:	e060000b 	rsb	r0, r0, fp
    8a84:	e240e020 	sub	lr, r0, #32
    8a88:	e1a07019 	lsl	r7, r9, r0
    8a8c:	e1877e18 	orr	r7, r7, r8, lsl lr
    8a90:	e260c020 	rsb	ip, r0, #32
    8a94:	e1877c38 	orr	r7, r7, r8, lsr ip
    8a98:	e1550007 	cmp	r5, r7
    8a9c:	e1a06018 	lsl	r6, r8, r0
    8aa0:	01540006 	cmpeq	r4, r6
    8aa4:	e1a01000 	mov	r1, r0
    8aa8:	33a02000 	movcc	r2, #0
    8aac:	33a03000 	movcc	r3, #0
    8ab0:	3a000005 	bcc	8acc <__divdi3+0xa4>
    8ab4:	e3a08001 	mov	r8, #1
    8ab8:	e0544006 	subs	r4, r4, r6
    8abc:	e1a03e18 	lsl	r3, r8, lr
    8ac0:	e1833c38 	orr	r3, r3, r8, lsr ip
    8ac4:	e0c55007 	sbc	r5, r5, r7
    8ac8:	e1a02018 	lsl	r2, r8, r0
    8acc:	e3500000 	cmp	r0, #0
    8ad0:	0a00001f 	beq	8b54 <__divdi3+0x12c>
    8ad4:	e1b070a7 	lsrs	r7, r7, #1
    8ad8:	e1a06066 	rrx	r6, r6
    8adc:	ea000007 	b	8b00 <__divdi3+0xd8>
    8ae0:	e0544006 	subs	r4, r4, r6
    8ae4:	e0c55007 	sbc	r5, r5, r7
    8ae8:	e0944004 	adds	r4, r4, r4
    8aec:	e0a55005 	adc	r5, r5, r5
    8af0:	e2944001 	adds	r4, r4, #1
    8af4:	e2a55000 	adc	r5, r5, #0
    8af8:	e2500001 	subs	r0, r0, #1
    8afc:	0a000006 	beq	8b1c <__divdi3+0xf4>
    8b00:	e1570005 	cmp	r7, r5
    8b04:	01560004 	cmpeq	r6, r4
    8b08:	9afffff4 	bls	8ae0 <__divdi3+0xb8>
    8b0c:	e0944004 	adds	r4, r4, r4
    8b10:	e0a55005 	adc	r5, r5, r5
    8b14:	e2500001 	subs	r0, r0, #1
    8b18:	1afffff8 	bne	8b00 <__divdi3+0xd8>
    8b1c:	e261c020 	rsb	ip, r1, #32
    8b20:	e1a00134 	lsr	r0, r4, r1
    8b24:	e0922004 	adds	r2, r2, r4
    8b28:	e241e020 	sub	lr, r1, #32
    8b2c:	e1800c15 	orr	r0, r0, r5, lsl ip
    8b30:	e1a04135 	lsr	r4, r5, r1
    8b34:	e1800e35 	orr	r0, r0, r5, lsr lr
    8b38:	e1a07114 	lsl	r7, r4, r1
    8b3c:	e1877e10 	orr	r7, r7, r0, lsl lr
    8b40:	e1a06110 	lsl	r6, r0, r1
    8b44:	e0a33005 	adc	r3, r3, r5
    8b48:	e1877c30 	orr	r7, r7, r0, lsr ip
    8b4c:	e0522006 	subs	r2, r2, r6
    8b50:	e0c33007 	sbc	r3, r3, r7
    8b54:	e29a0000 	adds	r0, sl, #0
    8b58:	13a00001 	movne	r0, #1
    8b5c:	e3a01000 	mov	r1, #0
    8b60:	e2704000 	rsbs	r4, r0, #0
    8b64:	e2e15000 	rsc	r5, r1, #0
    8b68:	e0222004 	eor	r2, r2, r4
    8b6c:	e0233005 	eor	r3, r3, r5
    8b70:	e0900002 	adds	r0, r0, r2
    8b74:	e0a11003 	adc	r1, r1, r3
    8b78:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8b7c:	e12fff1e 	bx	lr
    8b80:	e2728000 	rsbs	r8, r2, #0
    8b84:	e1e0a00a 	mvn	sl, sl
    8b88:	e2e39000 	rsc	r9, r3, #0
    8b8c:	eaffffaf 	b	8a50 <__divdi3+0x28>
    8b90:	e2704000 	rsbs	r4, r0, #0
    8b94:	e2e15000 	rsc	r5, r1, #0
    8b98:	e3e0a000 	mvn	sl, #0
    8b9c:	eaffffa7 	b	8a40 <__divdi3+0x18>

00008ba0 <__udivdi3>:
    8ba0:	e1510003 	cmp	r1, r3
    8ba4:	01500002 	cmpeq	r0, r2
    8ba8:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8bac:	e1a04000 	mov	r4, r0
    8bb0:	e1a05001 	mov	r5, r1
    8bb4:	e1a08002 	mov	r8, r2
    8bb8:	e1a09003 	mov	r9, r3
    8bbc:	33a00000 	movcc	r0, #0
    8bc0:	33a01000 	movcc	r1, #0
    8bc4:	3a00003b 	bcc	8cb8 <__udivdi3+0x118>
    8bc8:	e1a01003 	mov	r1, r3
    8bcc:	e1a00002 	mov	r0, r2
    8bd0:	eb00003a 	bl	8cc0 <__clzdi2>
    8bd4:	e1a01005 	mov	r1, r5
    8bd8:	e1a0a000 	mov	sl, r0
    8bdc:	e1a00004 	mov	r0, r4
    8be0:	eb000036 	bl	8cc0 <__clzdi2>
    8be4:	e060300a 	rsb	r3, r0, sl
    8be8:	e243e020 	sub	lr, r3, #32
    8bec:	e1a07319 	lsl	r7, r9, r3
    8bf0:	e1877e18 	orr	r7, r7, r8, lsl lr
    8bf4:	e263c020 	rsb	ip, r3, #32
    8bf8:	e1877c38 	orr	r7, r7, r8, lsr ip
    8bfc:	e1550007 	cmp	r5, r7
    8c00:	e1a06318 	lsl	r6, r8, r3
    8c04:	01540006 	cmpeq	r4, r6
    8c08:	e1a02003 	mov	r2, r3
    8c0c:	33a00000 	movcc	r0, #0
    8c10:	33a01000 	movcc	r1, #0
    8c14:	3a000005 	bcc	8c30 <__udivdi3+0x90>
    8c18:	e3a08001 	mov	r8, #1
    8c1c:	e0544006 	subs	r4, r4, r6
    8c20:	e1a01e18 	lsl	r1, r8, lr
    8c24:	e1811c38 	orr	r1, r1, r8, lsr ip
    8c28:	e0c55007 	sbc	r5, r5, r7
    8c2c:	e1a00318 	lsl	r0, r8, r3
    8c30:	e3530000 	cmp	r3, #0
    8c34:	0a00001f 	beq	8cb8 <__udivdi3+0x118>
    8c38:	e1b070a7 	lsrs	r7, r7, #1
    8c3c:	e1a06066 	rrx	r6, r6
    8c40:	ea000007 	b	8c64 <__udivdi3+0xc4>
    8c44:	e0544006 	subs	r4, r4, r6
    8c48:	e0c55007 	sbc	r5, r5, r7
    8c4c:	e0944004 	adds	r4, r4, r4
    8c50:	e0a55005 	adc	r5, r5, r5
    8c54:	e2944001 	adds	r4, r4, #1
    8c58:	e2a55000 	adc	r5, r5, #0
    8c5c:	e2533001 	subs	r3, r3, #1
    8c60:	0a000006 	beq	8c80 <__udivdi3+0xe0>
    8c64:	e1570005 	cmp	r7, r5
    8c68:	01560004 	cmpeq	r6, r4
    8c6c:	9afffff4 	bls	8c44 <__udivdi3+0xa4>
    8c70:	e0944004 	adds	r4, r4, r4
    8c74:	e0a55005 	adc	r5, r5, r5
    8c78:	e2533001 	subs	r3, r3, #1
    8c7c:	1afffff8 	bne	8c64 <__udivdi3+0xc4>
    8c80:	e0948000 	adds	r8, r4, r0
    8c84:	e0a59001 	adc	r9, r5, r1
    8c88:	e1a03234 	lsr	r3, r4, r2
    8c8c:	e2621020 	rsb	r1, r2, #32
    8c90:	e2420020 	sub	r0, r2, #32
    8c94:	e1833115 	orr	r3, r3, r5, lsl r1
    8c98:	e1a0c235 	lsr	ip, r5, r2
    8c9c:	e1833035 	orr	r3, r3, r5, lsr r0
    8ca0:	e1a0721c 	lsl	r7, ip, r2
    8ca4:	e1877013 	orr	r7, r7, r3, lsl r0
    8ca8:	e1a06213 	lsl	r6, r3, r2
    8cac:	e1877133 	orr	r7, r7, r3, lsr r1
    8cb0:	e0580006 	subs	r0, r8, r6
    8cb4:	e0c91007 	sbc	r1, r9, r7
    8cb8:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8cbc:	e12fff1e 	bx	lr

00008cc0 <__clzdi2>:
    8cc0:	e92d4010 	push	{r4, lr}
    8cc4:	e3510000 	cmp	r1, #0
    8cc8:	1a000002 	bne	8cd8 <__clzdi2+0x18>
    8ccc:	eb000005 	bl	8ce8 <__clzsi2>
    8cd0:	e2800020 	add	r0, r0, #32
    8cd4:	ea000001 	b	8ce0 <__clzdi2+0x20>
    8cd8:	e1a00001 	mov	r0, r1
    8cdc:	eb000001 	bl	8ce8 <__clzsi2>
    8ce0:	e8bd4010 	pop	{r4, lr}
    8ce4:	e12fff1e 	bx	lr

00008ce8 <__clzsi2>:
    8ce8:	e3a0101c 	mov	r1, #28
    8cec:	e3500801 	cmp	r0, #65536	; 0x10000
    8cf0:	21a00820 	lsrcs	r0, r0, #16
    8cf4:	22411010 	subcs	r1, r1, #16
    8cf8:	e3500c01 	cmp	r0, #256	; 0x100
    8cfc:	21a00420 	lsrcs	r0, r0, #8
    8d00:	22411008 	subcs	r1, r1, #8
    8d04:	e3500010 	cmp	r0, #16
    8d08:	21a00220 	lsrcs	r0, r0, #4
    8d0c:	22411004 	subcs	r1, r1, #4
    8d10:	e28f2008 	add	r2, pc, #8
    8d14:	e7d20000 	ldrb	r0, [r2, r0]
    8d18:	e0800001 	add	r0, r0, r1
    8d1c:	e12fff1e 	bx	lr
    8d20:	02020304 	andeq	r0, r2, #4, 6	; 0x10000000
    8d24:	01010101 	tsteq	r1, r1, lsl #2
	...

Disassembly of section .rodata:

00009000 <__rodata_start>:
    9000:	33323130 	teqcc	r2, #48, 2
    9004:	37363534 			; <UNDEFINED> instruction: 0x37363534
    9008:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    900c:	66656463 	strbtvs	r6, [r5], -r3, ror #8
	...

Disassembly of section .rodata.str1.4:

00009014 <.rodata.str1.4>:
    9014:	00000030 	andeq	r0, r0, r0, lsr r0
    9018:	00007830 	andeq	r7, r0, r0, lsr r8
    901c:	00006425 	andeq	r6, r0, r5, lsr #8

Disassembly of section .ARM.exidx:

00009020 <.ARM.exidx>:
    9020:	7ffffa08 	svcvc	0x00fffa08
    9024:	00000001 	andeq	r0, r0, r1

Disassembly of section .bss:

0000a000 <__bss_start>:
    a000:	00000000 	andeq	r0, r0, r0

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	000001b1 			; <UNDEFINED> instruction: 0x000001b1
   4:	00000004 	andeq	r0, r0, r4
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	00000073 	andeq	r0, r0, r3, ror r0
  10:	00015401 	andeq	r5, r1, r1, lsl #8
  14:	00001c00 	andeq	r1, r0, r0, lsl #24
  18:	00805400 	addeq	r5, r0, r0, lsl #8
  1c:	00016000 	andeq	r6, r1, r0
  20:	00000000 	andeq	r0, r0, r0
  24:	08010200 	stmdaeq	r1, {r9}
  28:	000000fa 	strdeq	r0, [r0], -sl
  2c:	03080102 	movweq	r0, #33026	; 0x8102
  30:	02000001 	andeq	r0, r0, #1
  34:	01430502 	cmpeq	r3, r2, lsl #10
  38:	04030000 	streq	r0, [r3], #-0
  3c:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
  40:	05080200 	streq	r0, [r8, #-512]	; 0x200
  44:	00000000 	andeq	r0, r0, r0
  48:	0000f204 	andeq	pc, r0, r4, lsl #4
  4c:	25160200 	ldrcs	r0, [r6, #-512]	; 0x200
  50:	02000000 	andeq	r0, r0, #0
  54:	011e0702 	tsteq	lr, r2, lsl #14
  58:	08040000 	stmdaeq	r4, {}	; <UNPREDICTABLE>
  5c:	02000001 	andeq	r0, r0, #1
  60:	0000651a 	andeq	r6, r0, sl, lsl r5
  64:	07040200 	streq	r0, [r4, -r0, lsl #4]
  68:	0000005d 	andeq	r0, r0, sp, asr r0
  6c:	53070802 	movwpl	r0, #30722	; 0x7802
  70:	05000000 	streq	r0, [r0, #-0]
  74:	00000137 	andeq	r0, r0, r7, lsr r1
  78:	80545401 	subshi	r5, r4, r1, lsl #8
  7c:	00540000 	subseq	r0, r4, r0
  80:	9c010000 	stcls	0, cr0, [r1], {-0}
  84:	000000d2 	ldrdeq	r0, [r0], -r2
  88:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
  8c:	48540100 	ldmdami	r4, {r8}^
  90:	00000000 	andeq	r0, r0, r0
  94:	07000000 	streq	r0, [r0, -r0]
  98:	006e7566 	rsbeq	r7, lr, r6, ror #10
  9c:	00485401 	subeq	r5, r8, r1, lsl #8
  a0:	51010000 	mrspl	r0, (UNDEF: 1)
  a4:	67657208 	strbvs	r7, [r5, -r8, lsl #4]!
  a8:	5a590100 	bpl	16404b0 <__user_program+0x13404b0>
  ac:	21000000 	mrscs	r0, (UNDEF: 0)
  b0:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
  b4:	0000013c 	andeq	r0, r0, ip, lsr r1
  b8:	005a5b01 	subseq	r5, sl, r1, lsl #22
  bc:	005a0000 	subseq	r0, sl, r0
  c0:	4d090000 	stcmi	0, cr0, [r9, #-0]
  c4:	01000001 	tsteq	r0, r1
  c8:	00005a5d 	andeq	r5, r0, sp, asr sl
  cc:	00007800 	andeq	r7, r0, r0, lsl #16
  d0:	4a050000 	bmi	1400d8 <__end+0x140d8>
  d4:	01000000 	mrseq	r0, (UNDEF: 0)
  d8:	0080a864 	addeq	sl, r0, r4, ror #16
  dc:	00004400 	andeq	r4, r0, r0, lsl #8
  e0:	f79c0100 			; <UNDEFINED> instruction: 0xf79c0100
  e4:	06000000 	streq	r0, [r0], -r0
  e8:	006e6970 	rsbeq	r6, lr, r0, ror r9
  ec:	00486401 	subeq	r6, r8, r1, lsl #8
  f0:	008b0000 	addeq	r0, fp, r0
  f4:	05000000 	streq	r0, [r0, #-0]
  f8:	0000006a 	andeq	r0, r0, sl, rrx
  fc:	80ec7001 	rschi	r7, ip, r1
 100:	00440000 	subeq	r0, r4, r0
 104:	9c010000 	stcls	0, cr0, [r1], {-0}
 108:	0000011c 	andeq	r0, r0, ip, lsl r1
 10c:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
 110:	48700100 	ldmdami	r0!, {r8}^
 114:	c5000000 	strgt	r0, [r0, #-0]
 118:	00000000 	andeq	r0, r0, r0
 11c:	00000e05 	andeq	r0, r0, r5, lsl #28
 120:	307c0100 	rsbscc	r0, ip, r0, lsl #2
 124:	84000081 	strhi	r0, [r0], #-129	; 0x81
 128:	01000000 	mrseq	r0, (UNDEF: 0)
 12c:	0001889c 	muleq	r1, ip, r8
 130:	69700600 	ldmdbvs	r0!, {r9, sl}^
 134:	7c01006e 	stcvc	0, cr0, [r1], {110}	; 0x6e
 138:	00000048 	andeq	r0, r0, r8, asr #32
 13c:	000000ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
 140:	0001310a 	andeq	r3, r1, sl, lsl #2
 144:	487c0100 	ldmdami	ip!, {r8}^
 148:	20000000 	andcs	r0, r0, r0
 14c:	0b000001 	bleq	158 <__start-0x7ea8>
 150:	00008158 	andeq	r8, r0, r8, asr r1
 154:	000001a7 	andeq	r0, r0, r7, lsr #3
 158:	00000163 	andeq	r0, r0, r3, ror #2
 15c:	0250010c 	subseq	r0, r0, #12, 2
 160:	0b009608 	bleq	25988 <__bss_end+0x1a988>
 164:	00008180 	andeq	r8, r0, r0, lsl #3
 168:	000001a7 	andeq	r0, r0, r7, lsr #3
 16c:	00000177 	andeq	r0, r0, r7, ror r1
 170:	0250010c 	subseq	r0, r0, #12, 2
 174:	0d009608 	stceq	6, cr9, [r0, #-32]	; 0xffffffe0
 178:	000081a8 	andeq	r8, r0, r8, lsr #3
 17c:	000001a7 	andeq	r0, r0, r7, lsr #3
 180:	0250010c 	subseq	r0, r0, #12, 2
 184:	00009608 	andeq	r9, r0, r8, lsl #12
 188:	0001670e 	andeq	r6, r1, lr, lsl #14
 18c:	97510100 	ldrbls	r0, [r1, -r0, lsl #2]
 190:	00000001 	andeq	r0, r0, r1
 194:	0f3f2000 	svceq	0x003f2000
 198:	0000019c 	muleq	r0, ip, r1
 19c:	01a20410 			; <UNDEFINED> instruction: 0x01a20410
 1a0:	5a110000 	bpl	4401a8 <__user_program+0x1401a8>
 1a4:	12000000 	andne	r0, r0, #0
 1a8:	00000111 	andeq	r0, r0, r1, lsl r1
 1ac:	5a131903 	bpl	4c65c0 <__user_program+0x1c65c0>
 1b0:	00000000 	andeq	r0, r0, r0
 1b4:	0002f000 	andeq	pc, r2, r0
 1b8:	fe000400 	cdp2	4, 0, cr0, cr0, cr0, {0}
 1bc:	04000000 	streq	r0, [r0], #-0
 1c0:	00007301 	andeq	r7, r0, r1, lsl #6
 1c4:	01750100 	cmneq	r5, r0, lsl #2
 1c8:	001c0000 	andseq	r0, ip, r0
 1cc:	81b40000 			; <UNDEFINED> instruction: 0x81b40000
 1d0:	02980000 	addseq	r0, r8, #0
 1d4:	00860000 	addeq	r0, r6, r0
 1d8:	f3020000 	vhadd.u8	d0, d2, d0
 1dc:	02000000 	andeq	r0, r0, #0
 1e0:	0000300e 	andeq	r3, r0, lr
 1e4:	08010300 	stmdaeq	r1, {r8, r9}
 1e8:	00000103 	andeq	r0, r0, r3, lsl #2
 1ec:	43050203 	movwmi	r0, #20995	; 0x5203
 1f0:	02000001 	andeq	r0, r0, #1
 1f4:	00000109 	andeq	r0, r0, r9, lsl #2
 1f8:	00491202 	subeq	r1, r9, r2, lsl #4
 1fc:	04040000 	streq	r0, [r4], #-0
 200:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
 204:	05080300 	streq	r0, [r8, #-768]	; 0x300
 208:	00000000 	andeq	r0, r0, r0
 20c:	0000f202 	andeq	pc, r0, r2, lsl #4
 210:	62160200 	andsvs	r0, r6, #0, 4
 214:	03000000 	movweq	r0, #0
 218:	00fa0801 	rscseq	r0, sl, r1, lsl #16
 21c:	02030000 	andeq	r0, r3, #0
 220:	00011e07 	andeq	r1, r1, r7, lsl #28
 224:	01080200 	mrseq	r0, R8_fiq
 228:	1a020000 	bne	80230 <__bss_end+0x75230>
 22c:	0000007b 	andeq	r0, r0, fp, ror r0
 230:	5d070403 	cfstrspl	mvf0, [r7, #-12]
 234:	02000000 	andeq	r0, r0, #0
 238:	0000016c 	andeq	r0, r0, ip, ror #2
 23c:	008d1c02 	addeq	r1, sp, r2, lsl #24
 240:	08030000 	stmdaeq	r3, {}	; <UNPREDICTABLE>
 244:	00005307 	andeq	r5, r0, r7, lsl #6
 248:	018b0200 	orreq	r0, fp, r0, lsl #4
 24c:	13030000 	movwne	r0, #12288	; 0x3000
 250:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 254:	00018905 	andeq	r8, r1, r5, lsl #18
 258:	00040400 	andeq	r0, r4, r0, lsl #8
 25c:	000000b6 	strheq	r0, [r0], -r6
 260:	0001dc06 	andeq	sp, r1, r6, lsl #24
 264:	0000b600 	andeq	fp, r0, r0, lsl #12
 268:	07000000 	streq	r0, [r0, -r0]
 26c:	01a10804 			; <UNDEFINED> instruction: 0x01a10804
 270:	21010000 	mrscs	r0, (UNDEF: 1)
 274:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
 278:	000000e0 	andeq	r0, r0, r0, ror #1
 27c:	012a9c01 	teqeq	sl, r1, lsl #24
 280:	b9090000 	stmdblt	r9, {}	; <UNPREDICTABLE>
 284:	01000001 	tsteq	r0, r1
 288:	00005721 	andeq	r5, r0, r1, lsr #14
 28c:	00014100 	andeq	r4, r1, r0, lsl #2
 290:	756e0a00 	strbvc	r0, [lr, #-2560]!	; 0xa00
 294:	2101006d 	tstcs	r1, sp, rrx
 298:	00000082 	andeq	r0, r0, r2, lsl #1
 29c:	00000162 	andeq	r0, r0, r2, ror #2
 2a0:	0001b20b 	andeq	fp, r1, fp, lsl #4
 2a4:	2a220100 	bcs	8806ac <__user_program+0x5806ac>
 2a8:	9a000001 	bls	2b4 <__start-0x7d4c>
 2ac:	0c000001 	stceq	0, cr0, [r0], {1}
 2b0:	00667562 	rsbeq	r7, r6, r2, ror #10
 2b4:	01302301 	teqeq	r0, r1, lsl #6
 2b8:	91020000 	mrsls	r0, (UNDEF: 2)
 2bc:	74700d58 	ldrbtvc	r0, [r0], #-3416	; 0xd58
 2c0:	24010072 	strcs	r0, [r1], #-114	; 0x72
 2c4:	0000012a 	andeq	r0, r0, sl, lsr #2
 2c8:	000001d1 	ldrdeq	r0, [r0], -r1
 2cc:	0082680e 	addeq	r6, r2, lr, lsl #16
 2d0:	0002e600 	andeq	lr, r2, r0, lsl #12
 2d4:	82800e00 	addhi	r0, r0, #0, 28
 2d8:	02e60000 	rsceq	r0, r6, #0
 2dc:	0f000000 	svceq	0x00000000
 2e0:	00002504 	andeq	r2, r0, r4, lsl #10
 2e4:	00251000 	eoreq	r1, r5, r0
 2e8:	01400000 	mrseq	r0, (UNDEF: 64)
 2ec:	40110000 	andsmi	r0, r1, r0
 2f0:	07000001 	streq	r0, [r0, -r1]
 2f4:	07040300 	streq	r0, [r4, -r0, lsl #6]
 2f8:	000001d3 	ldrdeq	r0, [r0], -r3
 2fc:	0001be12 	andeq	fp, r1, r2, lsl lr
 300:	493f0100 	ldmdbmi	pc!, {r8}	; <UNPREDICTABLE>
 304:	94000000 	strls	r0, [r0], #-0
 308:	b8000082 	stmdalt	r0, {r1, r7}
 30c:	01000001 	tsteq	r0, r1
 310:	0002b59c 	muleq	r2, ip, r5
 314:	6d660a00 	vstmdbvs	r6!, {s1-s0}
 318:	3f010074 	svccc	0x00010074
 31c:	000002b5 			; <UNDEFINED> instruction: 0x000002b5
 320:	00000239 	andeq	r0, r0, r9, lsr r2
 324:	01ce1413 	biceq	r1, lr, r3, lsl r4
 328:	40010000 	andmi	r0, r1, r0
 32c:	00000094 	muleq	r0, r4, r0
 330:	15549102 	ldrbne	r9, [r4, #-258]	; 0x102
 334:	00000000 	andeq	r0, r0, r0
 338:	000001a7 	andeq	r0, r0, r7, lsr #3
 33c:	6d756e0d 	ldclvs	14, cr6, [r5, #-52]!	; 0xffffffcc
 340:	70610100 	rsbvc	r0, r1, r0, lsl #2
 344:	70000000 	andvc	r0, r0, r0
 348:	16000002 	strne	r0, [r0], -r2
 34c:	000083ac 	andeq	r8, r0, ip, lsr #7
 350:	000000b8 	strheq	r0, [r0], -r8
 354:	02500117 	subseq	r0, r0, #-1073741819	; 0xc0000005
 358:	00000078 	andeq	r0, r0, r8, ror r0
 35c:	00001815 	andeq	r1, r0, r5, lsl r8
 360:	0001d000 	andeq	sp, r1, r0
 364:	756e0d00 	strbvc	r0, [lr, #-3328]!	; 0xd00
 368:	6801006d 	stmdavs	r1, {r0, r2, r3, r5, r6}
 36c:	00000070 	andeq	r0, r0, r0, ror r0
 370:	0000028f 	andeq	r0, r0, pc, lsl #5
 374:	0083cc16 	addeq	ip, r3, r6, lsl ip
 378:	0000b800 	andeq	fp, r0, r0, lsl #16
 37c:	50011700 	andpl	r1, r1, r0, lsl #14
 380:	00007702 	andeq	r7, r0, r2, lsl #14
 384:	83281800 	teqhi	r8, #0, 16
 388:	00480000 	subeq	r0, r8, r0
 38c:	02230000 	eoreq	r0, r3, #0
 390:	6e0d0000 	cdpvs	0, 0, cr0, cr13, cr0, {0}
 394:	01006d75 	tsteq	r0, r5, ror sp
 398:	00003e50 	andeq	r3, r0, r0, asr lr
 39c:	0002ae00 	andeq	sl, r2, r0, lsl #28
 3a0:	83481900 	movthi	r1, #35072	; 0x8900
 3a4:	02e60000 	rsceq	r0, r6, #0
 3a8:	02000000 	andeq	r0, r0, #0
 3ac:	01170000 	tsteq	r7, r0
 3b0:	2d080250 	sfmcs	f0, 4, [r8, #-320]	; 0xfffffec0
 3b4:	83581900 	cmphi	r8, #0, 18
 3b8:	00b80000 	adcseq	r0, r8, r0
 3bc:	02130000 	andseq	r0, r3, #0
 3c0:	01170000 	tsteq	r7, r0
 3c4:	003a0150 	eorseq	r0, sl, r0, asr r1
 3c8:	00836c16 	addeq	r6, r3, r6, lsl ip
 3cc:	0000b800 	andeq	fp, r0, r0, lsl #16
 3d0:	50011700 	andpl	r1, r1, r0, lsl #14
 3d4:	00003a01 	andeq	r3, r0, r1, lsl #20
 3d8:	00837018 	addeq	r7, r3, r8, lsl r0
 3dc:	00002000 	andeq	r2, r0, r0
 3e0:	00024f00 	andeq	r4, r2, r0, lsl #30
 3e4:	756e0d00 	strbvc	r0, [lr, #-3328]!	; 0xd00
 3e8:	5b01006d 	blpl	405a4 <__bss_end+0x355a4>
 3ec:	00000070 	andeq	r0, r0, r0, ror r0
 3f0:	000002c1 	andeq	r0, r0, r1, asr #5
 3f4:	00838c16 	addeq	r8, r3, r6, lsl ip
 3f8:	0000b800 	andeq	fp, r0, r0, lsl #16
 3fc:	50011700 	andpl	r1, r1, r0, lsl #14
 400:	00003a01 	andeq	r3, r0, r1, lsl #20
 404:	0083d018 	addeq	sp, r3, r8, lsl r0
 408:	00003000 	andeq	r3, r0, r0
 40c:	00027500 	andeq	r7, r2, r0, lsl #10
 410:	01c50b00 	biceq	r0, r5, r0, lsl #22
 414:	6e010000 	cdpvs	0, 0, cr0, cr1, cr0, {0}
 418:	0000012a 	andeq	r0, r0, sl, lsr #2
 41c:	000002e0 	andeq	r0, r0, r0, ror #5
 420:	0083f00e 	addeq	pc, r3, lr
 424:	0002e600 	andeq	lr, r2, r0, lsl #12
 428:	00180000 	andseq	r0, r8, r0
 42c:	18000084 	stmdane	r0, {r2, r7}
 430:	9b000000 	blls	438 <__start-0x7bc8>
 434:	0b000002 	bleq	444 <__start-0x7bbc>
 438:	00000311 	andeq	r0, r0, r1, lsl r3
 43c:	003e7701 	eorseq	r7, lr, r1, lsl #14
 440:	03000000 	movweq	r0, #0
 444:	140e0000 	strne	r0, [lr], #-0
 448:	e6000084 	str	r0, [r0], -r4, lsl #1
 44c:	00000002 	andeq	r0, r0, r2
 450:	0082cc0e 	addeq	ip, r2, lr, lsl #24
 454:	0002e600 	andeq	lr, r2, r0, lsl #12
 458:	84201600 	strthi	r1, [r0], #-1536	; 0x600
 45c:	02e60000 	rsceq	r0, r6, #0
 460:	01170000 	tsteq	r7, r0
 464:	25080250 	strcs	r0, [r8, #-592]	; 0x250
 468:	040f0000 	streq	r0, [pc], #-0	; 470 <__start-0x7b90>
 46c:	000002bb 			; <UNDEFINED> instruction: 0x000002bb
 470:	0000301a 	andeq	r3, r0, sl, lsl r0
 474:	00301000 	eorseq	r1, r0, r0
 478:	02d00000 	sbcseq	r0, r0, #0
 47c:	40110000 	andsmi	r0, r1, r0
 480:	10000001 	andne	r0, r0, r1
 484:	01ab1400 			; <UNDEFINED> instruction: 0x01ab1400
 488:	18010000 	stmdane	r1, {}	; <UNPREDICTABLE>
 48c:	000002e1 	andeq	r0, r0, r1, ror #5
 490:	90000305 	andls	r0, r0, r5, lsl #6
 494:	c01a0000 	andsgt	r0, sl, r0
 498:	1b000002 	blne	4a8 <__start-0x7b58>
 49c:	00000193 	muleq	r0, r3, r1
 4a0:	571c2305 	ldrpl	r2, [ip, -r5, lsl #6]
 4a4:	00000000 	andeq	r0, r0, r0
 4a8:	00027c00 	andeq	r7, r2, r0, lsl #24
 4ac:	68000400 	stmdavs	r0, {sl}
 4b0:	04000002 	streq	r0, [r0], #-2
 4b4:	00007301 	andeq	r7, r0, r1, lsl #6
 4b8:	02010100 	andeq	r0, r1, #0, 2
 4bc:	001c0000 	andseq	r0, ip, r0
 4c0:	844c0000 	strbhi	r0, [ip], #-0
 4c4:	01040000 	mrseq	r0, (UNDEF: 4)
 4c8:	016a0000 	cmneq	sl, r0
 4cc:	01020000 	mrseq	r0, (UNDEF: 2)
 4d0:	00010308 	andeq	r0, r1, r8, lsl #6
 4d4:	05020200 	streq	r0, [r2, #-512]	; 0x200
 4d8:	00000143 	andeq	r0, r0, r3, asr #2
 4dc:	69050403 	stmdbvs	r5, {r0, r1, sl}
 4e0:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
 4e4:	00000508 	andeq	r0, r0, r8, lsl #10
 4e8:	01020000 	mrseq	r0, (UNDEF: 2)
 4ec:	0000fa08 	andeq	pc, r0, r8, lsl #20
 4f0:	07020200 	streq	r0, [r2, -r0, lsl #4]
 4f4:	0000011e 	andeq	r0, r0, lr, lsl r1
 4f8:	00010804 	andeq	r0, r1, r4, lsl #16
 4fc:	5a1a0700 	bpl	682104 <__user_program+0x382104>
 500:	02000000 	andeq	r0, r0, #0
 504:	005d0704 	subseq	r0, sp, r4, lsl #14
 508:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
 50c:	00005307 	andeq	r5, r0, r7, lsl #6
 510:	02c20500 	sbceq	r0, r2, #0, 10
 514:	20010000 	andcs	r0, r1, r0
 518:	0000844c 	andeq	r8, r0, ip, asr #8
 51c:	00000030 	andeq	r0, r0, r0, lsr r0
 520:	00b79c01 	adcseq	r9, r7, r1, lsl #24
 524:	54060000 	strpl	r0, [r6], #-0
 528:	67000084 	strvs	r0, [r0, -r4, lsl #1]
 52c:	06000001 	streq	r0, [r0], -r1
 530:	00008458 	andeq	r8, r0, r8, asr r4
 534:	0000016e 	andeq	r0, r0, lr, ror #2
 538:	00846007 	addeq	r6, r4, r7
 53c:	00017b00 	andeq	r7, r1, r0, lsl #22
 540:	0000a400 	andeq	sl, r0, r0, lsl #8
 544:	50010800 	andpl	r0, r1, r0, lsl #16
 548:	03e80a03 	mvneq	r0, #12288	; 0x3000
 54c:	84640600 	strbthi	r0, [r4], #-1536	; 0x600
 550:	018c0000 	orreq	r0, ip, r0
 554:	78060000 	stmdavc	r6, {}	; <UNPREDICTABLE>
 558:	93000084 	movwls	r0, #132	; 0x84
 55c:	00000001 	andeq	r0, r0, r1
 560:	00026505 	andeq	r6, r2, r5, lsl #10
 564:	7c300100 	ldfvcs	f0, [r0], #-0
 568:	18000084 	stmdane	r0, {r2, r7}
 56c:	01000000 	mrseq	r0, (UNDEF: 0)
 570:	0000df9c 	muleq	r0, ip, pc	; <UNPREDICTABLE>
 574:	84840600 	strhi	r0, [r4], #1536	; 0x600
 578:	01a40000 			; <UNDEFINED> instruction: 0x01a40000
 57c:	90060000 	andls	r0, r6, r0
 580:	af000084 	svcge	0x00000084
 584:	00000001 	andeq	r0, r0, r1
 588:	00023e09 	andeq	r3, r2, r9, lsl #28
 58c:	5f410100 	svcpl	0x00410100
 590:	94000001 	strls	r0, [r0], #-1
 594:	bc000084 	stclt	0, cr0, [r0], {132}	; 0x84
 598:	01000000 	mrseq	r0, (UNDEF: 0)
 59c:	00015f9c 	muleq	r1, ip, pc	; <UNPREDICTABLE>
 5a0:	02360a00 	eorseq	r0, r6, #0, 20
 5a4:	41010000 	mrsmi	r0, (UNDEF: 1)
 5a8:	00000033 	andeq	r0, r0, r3, lsr r0
 5ac:	00000314 	andeq	r0, r0, r4, lsl r3
 5b0:	0001ce0a 	andeq	ip, r1, sl, lsl #28
 5b4:	61410100 	mrsvs	r0, (UNDEF: 81)
 5b8:	fd000001 	stc2	0, cr0, [r0, #-4]
 5bc:	06000003 	streq	r0, [r0], -r3
 5c0:	000084d0 	ldrdeq	r8, [r0], -r0
 5c4:	000001b6 			; <UNDEFINED> instruction: 0x000001b6
 5c8:	0084e406 	addeq	lr, r4, r6, lsl #8
 5cc:	0001cb00 	andeq	ip, r1, r0, lsl #22
 5d0:	84f00600 	ldrbthi	r0, [r0], #1536	; 0x600
 5d4:	01f00000 	mvnseq	r0, r0
 5d8:	00060000 	andeq	r0, r6, r0
 5dc:	05000085 	streq	r0, [r0, #-133]	; 0x85
 5e0:	06000002 	streq	r0, [r0], -r2
 5e4:	0000850c 	andeq	r8, r0, ip, lsl #10
 5e8:	0000021f 	andeq	r0, r0, pc, lsl r2
 5ec:	00852006 	addeq	r2, r5, r6
 5f0:	00023400 	andeq	r3, r2, r0, lsl #8
 5f4:	85340600 	ldrhi	r0, [r4, #-1536]!	; 0x600
 5f8:	02530000 	subseq	r0, r3, #0
 5fc:	40060000 	andmi	r0, r6, r0
 600:	72000085 	andvc	r0, r0, #133	; 0x85
 604:	00000002 	andeq	r0, r0, r2
 608:	040c040b 	streq	r0, [ip], #-1035	; 0x40b
 60c:	00000033 	andeq	r0, r0, r3, lsr r0
 610:	0002830d 	andeq	r8, r2, sp, lsl #6
 614:	0e170200 	cdpeq	2, 1, cr0, cr7, cr0, {0}
 618:	0000029b 	muleq	r0, fp, r2
 61c:	017b1005 	cmneq	fp, r5
 620:	000f0000 	andeq	r0, pc, r0
 624:	00025910 	andeq	r5, r2, r0, lsl r9
 628:	8c130400 	cfldrshi	mvf0, [r3], {-0}
 62c:	11000001 	tstne	r0, r1
 630:	00000033 	andeq	r0, r0, r3, lsr r0
 634:	01ef0d00 	mvneq	r0, r0, lsl #26
 638:	2b030000 	blcs	c0640 <__bss_end+0xb5640>
 63c:	00027312 	andeq	r7, r2, r2, lsl r3
 640:	33170500 	tstcc	r7, #0, 10
 644:	a4000000 	strge	r0, [r0], #-0
 648:	0f000001 	svceq	0x00000001
 64c:	02e91300 	rsceq	r1, r9, #0, 6
 650:	1f040000 	svcne	0x00040000
 654:	00000033 	andeq	r0, r0, r3, lsr r0
 658:	0002150d 	andeq	r1, r2, sp, lsl #10
 65c:	14250400 	strtne	r0, [r5], #-1024	; 0x400
 660:	000002dc 	ldrdeq	r0, [r0], -ip
 664:	015f1506 	cmpeq	pc, r6, lsl #10
 668:	01cb0000 	biceq	r0, fp, r0
 66c:	33110000 	tstcc	r1, #0
 670:	00000000 	andeq	r0, r0, r0
 674:	0002ce14 	andeq	ip, r2, r4, lsl lr
 678:	331f0600 	tstcc	pc, #0, 12
 67c:	ea000000 	b	684 <__start-0x797c>
 680:	11000001 	tstne	r0, r1
 684:	00000033 	andeq	r0, r0, r3, lsr r0
 688:	0001ea11 	andeq	lr, r1, r1, lsl sl
 68c:	00331100 	eorseq	r1, r3, r0, lsl #2
 690:	0c000000 	stceq	0, cr0, [r0], {-0}
 694:	00002504 	andeq	r2, r0, r4, lsl #10
 698:	01e11400 	mvneq	r1, r0, lsl #8
 69c:	28060000 	stmdacs	r6, {}	; <UNPREDICTABLE>
 6a0:	00000033 	andeq	r0, r0, r3, lsr r0
 6a4:	00000205 	andeq	r0, r0, r5, lsl #4
 6a8:	00003311 	andeq	r3, r0, r1, lsl r3
 6ac:	8d140000 	ldchi	0, cr0, [r4, #-0]
 6b0:	06000002 	streq	r0, [r0], -r2
 6b4:	00003332 	andeq	r3, r0, r2, lsr r3
 6b8:	00021f00 	andeq	r1, r2, r0, lsl #30
 6bc:	00331100 	eorseq	r1, r3, r0, lsl #2
 6c0:	5f110000 	svcpl	0x00110000
 6c4:	00000001 	andeq	r0, r0, r1
 6c8:	0002b314 	andeq	fp, r2, r4, lsl r3
 6cc:	333b0600 	teqcc	fp, #0, 12
 6d0:	34000000 	strcc	r0, [r0], #-0
 6d4:	11000002 	tstne	r0, r2
 6d8:	00000033 	andeq	r0, r0, r3, lsr r0
 6dc:	02fa1400 	rscseq	r1, sl, #0, 8
 6e0:	46060000 	strmi	r0, [r6], -r0
 6e4:	00000033 	andeq	r0, r0, r3, lsr r0
 6e8:	00000253 	andeq	r0, r0, r3, asr r2
 6ec:	00003311 	andeq	r3, r0, r1, lsl r3
 6f0:	00331100 	eorseq	r1, r3, r0, lsl #2
 6f4:	33110000 	tstcc	r1, #0
 6f8:	00000000 	andeq	r0, r0, r0
 6fc:	00022914 	andeq	r2, r2, r4, lsl r9
 700:	33500600 	cmpcc	r0, #0, 12
 704:	72000000 	andvc	r0, r0, #0
 708:	11000002 	tstne	r0, r2
 70c:	00000033 	andeq	r0, r0, r3, lsr r0
 710:	0001ea11 	andeq	lr, r1, r1, lsl sl
 714:	00331100 	eorseq	r1, r3, r0, lsl #2
 718:	15000000 	strne	r0, [r0, #-0]
 71c:	0000024c 	andeq	r0, r0, ip, asr #4
 720:	33115806 	tstcc	r1, #393216	; 0x60000
 724:	00000000 	andeq	r0, r0, r0
 728:	00015300 	andeq	r5, r1, r0, lsl #6
 72c:	a5000400 	strge	r0, [r0, #-1024]	; 0x400
 730:	04000003 	streq	r0, [r0], #-3
 734:	00007301 	andeq	r7, r0, r1, lsl #6
 738:	03160100 	tsteq	r6, #0, 2
 73c:	001c0000 	andseq	r0, ip, r0
 740:	85500000 	ldrbhi	r0, [r0, #-0]
 744:	00d80000 	sbcseq	r0, r8, r0
 748:	02350000 	eorseq	r0, r5, #0
 74c:	01020000 	mrseq	r0, (UNDEF: 2)
 750:	00010308 	andeq	r0, r1, r8, lsl #6
 754:	05020200 	streq	r0, [r2, #-512]	; 0x200
 758:	00000143 	andeq	r0, r0, r3, asr #2
 75c:	69050403 	stmdbvs	r5, {r0, r1, sl}
 760:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
 764:	00000508 	andeq	r0, r0, r8, lsl #10
 768:	f2040000 	vhadd.s8	d0, d4, d0
 76c:	02000000 	andeq	r0, r0, #0
 770:	00004c16 	andeq	r4, r0, r6, lsl ip
 774:	08010200 	stmdaeq	r1, {r9}
 778:	000000fa 	strdeq	r0, [r0], -sl
 77c:	1e070202 	cdpne	2, 0, cr0, cr7, cr2, {0}
 780:	04000001 	streq	r0, [r0], #-1
 784:	00000108 	andeq	r0, r0, r8, lsl #2
 788:	00651a02 	rsbeq	r1, r5, r2, lsl #20
 78c:	04020000 	streq	r0, [r2], #-0
 790:	00005d07 	andeq	r5, r0, r7, lsl #26
 794:	07080200 	streq	r0, [r8, -r0, lsl #4]
 798:	00000053 	andeq	r0, r0, r3, asr r0
 79c:	00028305 	andeq	r8, r2, r5, lsl #6
 7a0:	50250100 	eorpl	r0, r5, r0, lsl #2
 7a4:	70000085 	andvc	r0, r0, r5, lsl #1
 7a8:	01000000 	mrseq	r0, (UNDEF: 0)
 7ac:	0000e59c 	muleq	r0, ip, r5
 7b0:	85600600 	strbhi	r0, [r0, #-1536]!	; 0x600
 7b4:	012e0000 	teqeq	lr, r0
 7b8:	00a00000 	adceq	r0, r0, r0
 7bc:	01070000 	mrseq	r0, (UNDEF: 7)
 7c0:	07300151 			; <UNDEFINED> instruction: 0x07300151
 7c4:	3f015001 	svccc	0x00015001
 7c8:	856c0600 	strbhi	r0, [ip, #-1536]!	; 0x600
 7cc:	012e0000 	teqeq	lr, r0
 7d0:	00b80000 	adcseq	r0, r8, r0
 7d4:	01070000 	mrseq	r0, (UNDEF: 7)
 7d8:	07300151 			; <UNDEFINED> instruction: 0x07300151
 7dc:	3e015001 	cdpcc	0, 0, cr5, cr1, cr1, {0}
 7e0:	85780600 	ldrbhi	r0, [r8, #-1536]!	; 0x600
 7e4:	01440000 	mrseq	r0, (UNDEF: 68)
 7e8:	00d00000 	sbcseq	r0, r0, r0
 7ec:	01070000 	mrseq	r0, (UNDEF: 7)
 7f0:	07320151 			; <UNDEFINED> instruction: 0x07320151
 7f4:	3f015001 	svccc	0x00015001
 7f8:	85840800 	strhi	r0, [r4, #2048]	; 0x800
 7fc:	01440000 	mrseq	r0, (UNDEF: 68)
 800:	01070000 	mrseq	r0, (UNDEF: 7)
 804:	07320151 			; <UNDEFINED> instruction: 0x07320151
 808:	3e015001 	cdpcc	0, 0, cr5, cr1, cr1, {0}
 80c:	28090000 	stmdacs	r9, {}	; <UNPREDICTABLE>
 810:	01000003 	tsteq	r0, r3
 814:	0085c037 	addeq	ip, r5, r7, lsr r0
 818:	00001400 	andeq	r1, r0, r0, lsl #8
 81c:	059c0100 	ldreq	r0, [ip, #256]	; 0x100
 820:	00000193 	muleq	r0, r3, r1
 824:	85d43c01 	ldrbhi	r3, [r4, #3073]	; 0xc01
 828:	00280000 	eoreq	r0, r8, r0
 82c:	9c010000 	stcls	0, cr0, [r1], {-0}
 830:	00000119 	andeq	r0, r0, r9, lsl r1
 834:	0003110a 	andeq	r1, r3, sl, lsl #2
 838:	413c0100 	teqmi	ip, r0, lsl #2
 83c:	01000000 	mrseq	r0, (UNDEF: 0)
 840:	080b0050 	stmdaeq	fp, {r4, r6}
 844:	01000003 	tsteq	r0, r3
 848:	00004146 	andeq	r4, r0, r6, asr #2
 84c:	0085fc00 	addeq	pc, r5, r0, lsl #24
 850:	00002c00 	andeq	r2, r0, r0, lsl #24
 854:	0c9c0100 	ldfeqs	f0, [ip], {0}
 858:	0000000e 	andeq	r0, r0, lr
 85c:	01444b03 	cmpeq	r4, r3, lsl #22
 860:	410d0000 	mrsmi	r0, (UNDEF: 13)
 864:	0d000000 	stceq	0, cr0, [r0, #-0]
 868:	00000041 	andeq	r0, r0, r1, asr #32
 86c:	01370e00 	teqeq	r7, r0, lsl #28
 870:	37030000 	strcc	r0, [r3, -r0]
 874:	0000410d 	andeq	r4, r0, sp, lsl #2
 878:	00410d00 	subeq	r0, r1, r0, lsl #26
 87c:	00000000 	andeq	r0, r0, r0
 880:	000000c1 	andeq	r0, r0, r1, asr #1
 884:	04860004 	streq	r0, [r6], #4
 888:	01040000 	mrseq	r0, (UNDEF: 4)
 88c:	00000073 	andeq	r0, r0, r3, ror r0
 890:	00033301 	andeq	r3, r3, r1, lsl #6
 894:	00001c00 	andeq	r1, r0, r0, lsl #24
 898:	00862800 	addeq	r2, r6, r0, lsl #16
 89c:	00007000 	andeq	r7, r0, r0
 8a0:	0002b000 	andeq	fp, r2, r0
 8a4:	08010200 	stmdaeq	r1, {r9}
 8a8:	00000103 	andeq	r0, r0, r3, lsl #2
 8ac:	43050202 	movwmi	r0, #20994	; 0x5202
 8b0:	03000001 	movweq	r0, #1
 8b4:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 8b8:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
 8bc:	00000005 	andeq	r0, r0, r5
 8c0:	08010200 	stmdaeq	r1, {r9}
 8c4:	000000fa 	strdeq	r0, [r0], -sl
 8c8:	1e070202 	cdpne	2, 0, cr0, cr7, cr2, {0}
 8cc:	04000001 	streq	r0, [r0], #-1
 8d0:	00000108 	andeq	r0, r0, r8, lsl #2
 8d4:	005a1a02 	subseq	r1, sl, r2, lsl #20
 8d8:	04020000 	streq	r0, [r2], #-0
 8dc:	00005d07 	andeq	r5, r0, r7, lsl #26
 8e0:	07080200 	streq	r0, [r8, -r0, lsl #4]
 8e4:	00000053 	andeq	r0, r0, r3, asr r0
 8e8:	00025905 	andeq	r5, r2, r5, lsl #18
 8ec:	28220100 	stmdacs	r2!, {r8}
 8f0:	2c000086 	stccs	0, cr0, [r0], {134}	; 0x86
 8f4:	01000000 	mrseq	r0, (UNDEF: 0)
 8f8:	00008d9c 	muleq	r0, ip, sp
 8fc:	03460600 	movteq	r0, #26112	; 0x6600
 900:	22010000 	andcs	r0, r1, #0
 904:	00000033 	andeq	r0, r0, r3, lsr r0
 908:	00000504 	andeq	r0, r0, r4, lsl #10
 90c:	034b0700 	movteq	r0, #46848	; 0xb700
 910:	2b010000 	blcs	40918 <__bss_end+0x35918>
 914:	00008654 	andeq	r8, r0, r4, asr r6
 918:	00000014 	andeq	r0, r0, r4, lsl r0
 91c:	e9089c01 	stmdb	r8, {r0, sl, fp, ip, pc}
 920:	01000002 	tsteq	r0, r2
 924:	00003332 	andeq	r3, r0, r2, lsr r3
 928:	00866800 	addeq	r6, r6, r0, lsl #16
 92c:	00001c00 	andeq	r1, r0, r0, lsl #24
 930:	079c0100 	ldreq	r0, [ip, r0, lsl #2]
 934:	00000215 	andeq	r0, r0, r5, lsl r2
 938:	86843701 	strhi	r3, [r4], r1, lsl #14
 93c:	00140000 	andseq	r0, r4, r0
 940:	9c010000 	stcls	0, cr0, [r1], {-0}
 944:	0003cf00 	andeq	ip, r3, r0, lsl #30
 948:	18000400 	stmdane	r0, {sl}
 94c:	04000005 	streq	r0, [r0], #-5
 950:	00007301 	andeq	r7, r0, r1, lsl #6
 954:	03560100 	cmpeq	r6, #0, 2
 958:	001c0000 	andseq	r0, ip, r0
 95c:	86980000 	ldrhi	r0, [r8], r0
 960:	01a40000 			; <UNDEFINED> instruction: 0x01a40000
 964:	03190000 	tsteq	r9, #0
 968:	01020000 	mrseq	r0, (UNDEF: 2)
 96c:	00010308 	andeq	r0, r1, r8, lsl #6
 970:	05020200 	streq	r0, [r2, #-512]	; 0x200
 974:	00000143 	andeq	r0, r0, r3, asr #2
 978:	69050403 	stmdbvs	r5, {r0, r1, sl}
 97c:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
 980:	00000508 	andeq	r0, r0, r8, lsl #10
 984:	f2040000 	vhadd.s8	d0, d4, d0
 988:	02000000 	andeq	r0, r0, #0
 98c:	00004c16 	andeq	r4, r0, r6, lsl ip
 990:	08010200 	stmdaeq	r1, {r9}
 994:	000000fa 	strdeq	r0, [r0], -sl
 998:	1e070202 	cdpne	2, 0, cr0, cr7, cr2, {0}
 99c:	02000001 	andeq	r0, r0, #1
 9a0:	005d0704 	subseq	r0, sp, r4, lsl #14
 9a4:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
 9a8:	00005307 	andeq	r5, r0, r7, lsl #6
 9ac:	024c0500 	subeq	r0, ip, #0, 10
 9b0:	14010000 	strne	r0, [r1], #-0
 9b4:	00008698 	muleq	r0, r8, r6
 9b8:	0000001c 	andeq	r0, r0, ip, lsl r0
 9bc:	00b49c01 	adcseq	r9, r4, r1, lsl #24
 9c0:	95060000 	strls	r0, [r6, #-0]
 9c4:	01000003 	tsteq	r0, r3
 9c8:	00003314 	andeq	r3, r0, r4, lsl r3
 9cc:	00052500 	andeq	r2, r5, r0, lsl #10
 9d0:	86ac0700 	strthi	r0, [ip], r0, lsl #14
 9d4:	038e0000 	orreq	r0, lr, #0
 9d8:	00aa0000 	adceq	r0, sl, r0
 9dc:	01080000 	mrseq	r0, (UNDEF: 8)
 9e0:	01f30351 	mvnseq	r0, r1, asr r3
 9e4:	50010850 	andpl	r0, r1, r0, asr r8
 9e8:	901c0305 	andsls	r0, ip, r5, lsl #6
 9ec:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
 9f0:	000086b0 			; <UNDEFINED> instruction: 0x000086b0
 9f4:	000003af 	andeq	r0, r0, pc, lsr #7
 9f8:	02ce0a00 	sbceq	r0, lr, #0, 20
 9fc:	1c010000 	stcne	0, cr0, [r1], {-0}
 a00:	00000033 	andeq	r0, r0, r3, lsr r0
 a04:	000086b4 			; <UNDEFINED> instruction: 0x000086b4
 a08:	00000048 	andeq	r0, r0, r8, asr #32
 a0c:	01119c01 	tsteq	r1, r1, lsl #24
 a10:	bd060000 	stclt	0, cr0, [r6, #-0]
 a14:	01000003 	tsteq	r0, r3
 a18:	0000331c 	andeq	r3, r0, ip, lsl r3
 a1c:	00055100 	andeq	r5, r5, r0, lsl #2
 a20:	74700b00 	ldrbtvc	r0, [r0], #-2816	; 0xb00
 a24:	1c010072 	stcne	0, cr0, [r1], {114}	; 0x72
 a28:	00000111 	andeq	r0, r0, r1, lsl r1
 a2c:	000005a4 	andeq	r0, r0, r4, lsr #11
 a30:	6e656c0b 	cdpvs	12, 6, cr6, cr5, cr11, {0}
 a34:	331c0100 	tstcc	ip, #0, 2
 a38:	e9000000 	stmdb	r0, {}	; <UNPREDICTABLE>
 a3c:	0c000005 	stceq	0, cr0, [r0], {5}
 a40:	20010069 	andcs	r0, r1, r9, rrx
 a44:	00000033 	andeq	r0, r0, r3, lsr r0
 a48:	0000062b 	andeq	r0, r0, fp, lsr #12
 a4c:	0086dc09 	addeq	sp, r6, r9, lsl #24
 a50:	0003b600 	andeq	fp, r3, r0, lsl #12
 a54:	040d0000 	streq	r0, [sp], #-0
 a58:	00000025 	andeq	r0, r0, r5, lsr #32
 a5c:	0002290a 	andeq	r2, r2, sl, lsl #18
 a60:	332f0100 	teqcc	pc, #0, 2
 a64:	fc000000 	stc2	0, cr0, [r0], {-0}
 a68:	b8000086 	stmdalt	r0, {r1, r2, r7}
 a6c:	01000000 	mrseq	r0, (UNDEF: 0)
 a70:	0001e39c 	muleq	r1, ip, r3
 a74:	03bd0600 			; <UNDEFINED> instruction: 0x03bd0600
 a78:	2f010000 	svccs	0x00010000
 a7c:	00000033 	andeq	r0, r0, r3, lsr r0
 a80:	0000067f 	andeq	r0, r0, pc, ror r6
 a84:	7274700b 	rsbsvc	r7, r4, #11
 a88:	112f0100 	teqne	pc, r0, lsl #2
 a8c:	d2000001 	andle	r0, r0, #1
 a90:	0b000006 	bleq	ab0 <__start-0x7550>
 a94:	006e656c 	rsbeq	r6, lr, ip, ror #10
 a98:	00332f01 	eorseq	r2, r3, r1, lsl #30
 a9c:	071f0000 	ldreq	r0, [pc, -r0]
 aa0:	790e0000 	stmdbvc	lr, {}	; <UNPREDICTABLE>
 aa4:	01000003 	tsteq	r0, r3
 aa8:	00003333 	andeq	r3, r0, r3, lsr r3
 aac:	00076c00 	andeq	r6, r7, r0, lsl #24
 ab0:	00300f00 	eorseq	r0, r0, r0, lsl #30
 ab4:	760c0000 	strvc	r0, [ip], -r0
 ab8:	01006c61 	tsteq	r0, r1, ror #24
 abc:	00002535 	andeq	r2, r0, r5, lsr r5
 ac0:	0007a200 	andeq	sl, r7, r0, lsl #4
 ac4:	87280900 	strhi	r0, [r8, -r0, lsl #18]!
 ac8:	03c70000 	biceq	r0, r7, #0
 acc:	48070000 	stmdami	r7, {}	; <UNPREDICTABLE>
 ad0:	b6000087 	strlt	r0, [r0], -r7, lsl #1
 ad4:	9d000003 	stcls	0, cr0, [r0, #-12]
 ad8:	08000001 	stmdaeq	r0, {r0}
 adc:	78025001 	stmdavc	r2, {r0, ip, lr}
 ae0:	50070000 	andpl	r0, r7, r0
 ae4:	b6000087 	strlt	r0, [r0], -r7, lsl #1
 ae8:	b1000003 	tstlt	r0, r3
 aec:	08000001 	stmdaeq	r0, {r0}
 af0:	79025001 	stmdbvc	r2, {r0, ip, lr}
 af4:	58070000 	stmdapl	r7, {}	; <UNPREDICTABLE>
 af8:	b6000087 	strlt	r0, [r0], -r7, lsl #1
 afc:	c5000003 	strgt	r0, [r0, #-3]
 b00:	08000001 	stmdaeq	r0, {r0}
 b04:	78025001 	stmdavc	r2, {r0, ip, lr}
 b08:	78070000 	stmdavc	r7, {}	; <UNPREDICTABLE>
 b0c:	b6000087 	strlt	r0, [r0], -r7, lsl #1
 b10:	d8000003 	stmdale	r0, {r0, r1}
 b14:	08000001 	stmdaeq	r0, {r0}
 b18:	3a015001 	bcc	54b24 <__bss_end+0x49b24>
 b1c:	87840900 	strhi	r0, [r4, r0, lsl #18]
 b20:	03b60000 			; <UNDEFINED> instruction: 0x03b60000
 b24:	00000000 	andeq	r0, r0, r0
 b28:	0003d00a 	andeq	sp, r3, sl
 b2c:	334e0100 	movtcc	r0, #57600	; 0xe100
 b30:	b4000000 	strlt	r0, [r0], #-0
 b34:	08000087 	stmdaeq	r0, {r0, r1, r2, r7}
 b38:	01000000 	mrseq	r0, (UNDEF: 0)
 b3c:	0002199c 	muleq	r2, ip, r9
 b40:	03710600 	cmneq	r1, #0, 12
 b44:	4e010000 	cdpmi	0, 0, cr0, cr1, cr0, {0}
 b48:	00000041 	andeq	r0, r0, r1, asr #32
 b4c:	000007d6 	ldrdeq	r0, [r0], -r6
 b50:	0003af10 	andeq	sl, r3, r0, lsl pc
 b54:	414e0100 	mrsmi	r0, (UNDEF: 94)
 b58:	01000000 	mrseq	r0, (UNDEF: 0)
 b5c:	e50a0051 	str	r0, [sl, #-81]	; 0x51
 b60:	01000003 	tsteq	r0, r3
 b64:	00003352 	andeq	r3, r0, r2, asr r3
 b68:	0087bc00 	addeq	fp, r7, r0, lsl #24
 b6c:	00000800 	andeq	r0, r0, r0, lsl #16
 b70:	4f9c0100 	svcmi	0x009c0100
 b74:	06000002 	streq	r0, [r0], -r2
 b78:	00000371 	andeq	r0, r0, r1, ror r3
 b7c:	00415201 	subeq	r5, r1, r1, lsl #4
 b80:	07f70000 	ldrbeq	r0, [r7, r0]!
 b84:	b7100000 	ldrlt	r0, [r0, -r0]
 b88:	01000003 	tsteq	r0, r3
 b8c:	00004152 	andeq	r4, r0, r2, asr r1
 b90:	00510100 	subseq	r0, r1, r0, lsl #2
 b94:	0002dc0a 	andeq	sp, r2, sl, lsl #24
 b98:	9b5a0100 	blls	1680fa0 <__user_program+0x1380fa0>
 b9c:	c4000002 	strgt	r0, [r0], #-2
 ba0:	58000087 	stmdapl	r0, {r0, r1, r2, r7}
 ba4:	01000000 	mrseq	r0, (UNDEF: 0)
 ba8:	00029b9c 	muleq	r2, ip, fp
 bac:	036c0600 	cmneq	ip, #0, 12
 bb0:	5a010000 	bpl	40bb8 <__bss_end+0x35bb8>
 bb4:	00000033 	andeq	r0, r0, r3, lsr r0
 bb8:	00000818 	andeq	r0, r0, r8, lsl r8
 bbc:	00037f11 	andeq	r7, r3, r1, lsl pc
 bc0:	255b0100 	ldrbcs	r0, [fp, #-256]	; 0x100
 bc4:	11000000 	mrsne	r0, (UNDEF: 0)
 bc8:	0000038a 	andeq	r0, r0, sl, lsl #7
 bcc:	00255c01 	eoreq	r5, r5, r1, lsl #24
 bd0:	c2120000 	andsgt	r0, r2, #0
 bd4:	01000003 	tsteq	r0, r3
 bd8:	0001115d 	andeq	r1, r1, sp, asr r1
 bdc:	00530100 	subseq	r0, r3, r0, lsl #2
 be0:	e10a0413 	tst	sl, r3, lsl r4
 be4:	01000001 	tsteq	r0, r1
 be8:	0000336f 	andeq	r3, r0, pc, ror #6
 bec:	00881c00 	addeq	r1, r8, r0, lsl #24
 bf0:	00000800 	andeq	r0, r0, r0, lsl #16
 bf4:	c69c0100 	ldrgt	r0, [ip], r0, lsl #2
 bf8:	06000002 	streq	r0, [r0], -r2
 bfc:	000003bd 			; <UNDEFINED> instruction: 0x000003bd
 c00:	00336f01 	eorseq	r6, r3, r1, lsl #30
 c04:	08390000 	ldmdaeq	r9!, {}	; <UNPREDICTABLE>
 c08:	0a000000 	beq	c10 <__start-0x73f0>
 c0c:	0000028d 	andeq	r0, r0, sp, lsl #5
 c10:	00337301 	eorseq	r7, r3, r1, lsl #6
 c14:	88240000 	stmdahi	r4!, {}	; <UNPREDICTABLE>
 c18:	00080000 	andeq	r0, r8, r0
 c1c:	9c010000 	stcls	0, cr0, [r1], {-0}
 c20:	000002fb 	strdeq	r0, [r0], -fp
 c24:	0003bd06 	andeq	fp, r3, r6, lsl #26
 c28:	33730100 	cmncc	r3, #0, 2
 c2c:	5a000000 	bpl	c34 <__start-0x73cc>
 c30:	14000008 	strne	r0, [r0], #-8
 c34:	01007473 	tsteq	r0, r3, ror r4
 c38:	00029b73 	andeq	r9, r2, r3, ror fp
 c3c:	00510100 	subseq	r0, r1, r0, lsl #2
 c40:	0002b30a 	andeq	fp, r2, sl, lsl #6
 c44:	33770100 	cmncc	r7, #0, 2
 c48:	2c000000 	stccs	0, cr0, [r0], {-0}
 c4c:	08000088 	stmdaeq	r0, {r3, r7}
 c50:	01000000 	mrseq	r0, (UNDEF: 0)
 c54:	0003249c 	muleq	r3, ip, r4
 c58:	03bd0600 			; <UNDEFINED> instruction: 0x03bd0600
 c5c:	77010000 	strvc	r0, [r1, -r0]
 c60:	00000033 	andeq	r0, r0, r3, lsr r0
 c64:	0000087b 	andeq	r0, r0, fp, ror r8
 c68:	02fa0a00 	rscseq	r0, sl, #0, 20
 c6c:	7b010000 	blvc	40c74 <__bss_end+0x35c74>
 c70:	00000033 	andeq	r0, r0, r3, lsr r0
 c74:	00008834 	andeq	r8, r0, r4, lsr r8
 c78:	00000008 	andeq	r0, r0, r8
 c7c:	03679c01 	cmneq	r7, #256	; 0x100
 c80:	bd060000 	stclt	0, cr0, [r6, #-0]
 c84:	01000003 	tsteq	r0, r3
 c88:	0000337b 	andeq	r3, r0, fp, ror r3
 c8c:	00089c00 	andeq	r9, r8, r0, lsl #24
 c90:	74701400 	ldrbtvc	r1, [r0], #-1024	; 0x400
 c94:	7b010072 	blvc	40e64 <__bss_end+0x35e64>
 c98:	00000033 	andeq	r0, r0, r3, lsr r0
 c9c:	64145101 	ldrvs	r5, [r4], #-257	; 0x101
 ca0:	01007269 	tsteq	r0, r9, ror #4
 ca4:	0000337b 	andeq	r3, r0, fp, ror r3
 ca8:	00520100 	subseq	r0, r2, r0, lsl #2
 cac:	0003c715 	andeq	ip, r3, r5, lsl r7
 cb0:	11120100 	tstne	r2, r0, lsl #2
 cb4:	05000001 	streq	r0, [r0, #-1]
 cb8:	00a00003 	adceq	r0, r0, r3
 cbc:	037f1100 	cmneq	pc, #0, 2
 cc0:	5b010000 	blpl	40cc8 <__bss_end+0x35cc8>
 cc4:	00000025 	andeq	r0, r0, r5, lsr #32
 cc8:	00038a11 	andeq	r8, r3, r1, lsl sl
 ccc:	255c0100 	ldrbcs	r0, [ip, #-256]	; 0x100
 cd0:	16000000 	strne	r0, [r0], -r0
 cd4:	000001be 			; <UNDEFINED> instruction: 0x000001be
 cd8:	00331303 	eorseq	r1, r3, r3, lsl #6
 cdc:	03a40000 			; <UNDEFINED> instruction: 0x03a40000
 ce0:	a4170000 	ldrge	r0, [r7], #-0
 ce4:	18000003 	stmdane	r0, {r0, r1}
 ce8:	aa040d00 	bge	1040f0 <__bss_end+0xf90f0>
 cec:	19000003 	stmdbne	r0, {r0, r1}
 cf0:	00000025 	andeq	r0, r0, r5, lsr #32
 cf4:	00039c1a 	andeq	r9, r3, sl, lsl ip
 cf8:	1b300400 	blne	c01d00 <__user_program+0x901d00>
 cfc:	00000193 	muleq	r0, r3, r1
 d00:	03c72305 	biceq	r2, r7, #335544320	; 0x14000000
 d04:	41170000 	tstmi	r7, r0
 d08:	00000000 	andeq	r0, r0, r0
 d0c:	0003081c 	andeq	r0, r3, ip, lsl r8
 d10:	412a0500 	teqmi	sl, r0, lsl #10
 d14:	00000000 	andeq	r0, r0, r0
 d18:	000000d2 	ldrdeq	r0, [r0], -r2
 d1c:	06aa0004 	strteq	r0, [sl], r4
 d20:	01040000 	mrseq	r0, (UNDEF: 4)
 d24:	00000073 	andeq	r0, r0, r3, ror r0
 d28:	00040201 	andeq	r0, r4, r1, lsl #4
 d2c:	00001c00 	andeq	r1, r0, r0, lsl #24
 d30:	00883c00 	addeq	r3, r8, r0, lsl #24
 d34:	00000c00 	andeq	r0, r0, r0, lsl #24
 d38:	00040600 	andeq	r0, r4, r0, lsl #12
 d3c:	08010200 	stmdaeq	r1, {r9}
 d40:	00000103 	andeq	r0, r0, r3, lsl #2
 d44:	43050202 	movwmi	r0, #20994	; 0x5202
 d48:	03000001 	movweq	r0, #1
 d4c:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 d50:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
 d54:	00000005 	andeq	r0, r0, r5
 d58:	00f20400 	rscseq	r0, r2, r0, lsl #8
 d5c:	16020000 	strne	r0, [r2], -r0
 d60:	0000004c 	andeq	r0, r0, ip, asr #32
 d64:	fa080102 	blx	201174 <__end+0xd5174>
 d68:	02000000 	andeq	r0, r0, #0
 d6c:	011e0702 	tsteq	lr, r2, lsl #14
 d70:	04020000 	streq	r0, [r2], #-0
 d74:	00005d07 	andeq	r5, r0, r7, lsl #26
 d78:	07080200 	streq	r0, [r8, -r0, lsl #4]
 d7c:	00000053 	andeq	r0, r0, r3, asr r0
 d80:	0003f705 	andeq	pc, r3, r5, lsl #14
 d84:	3c0d0100 	stfccs	f0, [sp], {-0}
 d88:	04000088 	streq	r0, [r0], #-136	; 0x88
 d8c:	01000000 	mrseq	r0, (UNDEF: 0)
 d90:	03d8069c 	bicseq	r0, r8, #156, 12	; 0x9c00000
 d94:	11010000 	mrsne	r0, (UNDEF: 1)
 d98:	00008840 	andeq	r8, r0, r0, asr #16
 d9c:	00000004 	andeq	r0, r0, r4
 da0:	00a99c01 	adceq	r9, r9, r1, lsl #24
 da4:	71070000 	mrsvc	r0, (UNDEF: 7)
 da8:	01000003 	tsteq	r0, r3
 dac:	00004111 	andeq	r4, r0, r1, lsl r1
 db0:	07500100 	ldrbeq	r0, [r0, -r0, lsl #2]
 db4:	000003af 	andeq	r0, r0, pc, lsr #7
 db8:	00411101 	subeq	r1, r1, r1, lsl #2
 dbc:	51010000 	mrspl	r0, (UNDEF: 1)
 dc0:	03ed0800 	mvneq	r0, #0, 16
 dc4:	15010000 	strne	r0, [r1, #-0]
 dc8:	00008844 	andeq	r8, r0, r4, asr #16
 dcc:	00000004 	andeq	r0, r0, r4
 dd0:	71079c01 	tstvc	r7, r1, lsl #24
 dd4:	01000003 	tsteq	r0, r3
 dd8:	00004115 	andeq	r4, r0, r5, lsl r1
 ddc:	07500100 	ldrbeq	r0, [r0, -r0, lsl #2]
 de0:	000003b7 			; <UNDEFINED> instruction: 0x000003b7
 de4:	00411501 	subeq	r1, r1, r1, lsl #10
 de8:	51010000 	mrspl	r0, (UNDEF: 1)
 dec:	00650000 	rsbeq	r0, r5, r0
 df0:	00020000 	andeq	r0, r2, r0
 df4:	00000738 	andeq	r0, r0, r8, lsr r7
 df8:	04670104 	strbteq	r0, [r7], #-260	; 0x104
 dfc:	80000000 	andhi	r0, r0, r0
 e00:	80540000 	subshi	r0, r4, r0
 e04:	34330000 	ldrtcc	r0, [r3], #-0
 e08:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 e0c:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
 e10:	6f622f63 	svcvs	0x00622f63
 e14:	532e746f 	teqpl	lr, #1862270976	; 0x6f000000
 e18:	6f682f00 	svcvs	0x00682f00
 e1c:	652f656d 	strvs	r6, [pc, #-1389]!	; 8b7 <__start-0x7749>
 e20:	34336563 	ldrtcc	r6, [r3], #-1379	; 0x563
 e24:	34332f39 	ldrtcc	r2, [r3], #-3897	; 0xf39
 e28:	616c2f39 	cmnvs	ip, r9, lsr pc
 e2c:	662f3262 	strtvs	r3, [pc], -r2, ror #4
 e30:	6c2d3731 	stcvs	7, cr3, [sp], #-196	; 0xffffff3c
 e34:	2d326261 	lfmcs	f6, 4, [r2, #-388]!	; 0xfffffe7c
 e38:	69766164 	ldmdbvs	r6!, {r2, r5, r6, r8, sp, lr}^
 e3c:	32757964 	rsbscc	r7, r5, #100, 18	; 0x190000
 e40:	6f632f39 	svcvs	0x00632f39
 e44:	47006564 	strmi	r6, [r0, -r4, ror #10]
 e48:	4120554e 	teqmi	r0, lr, asr #10
 e4c:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
 e50:	302e3432 	eorcc	r3, lr, r2, lsr r4
 e54:	64800100 	strvs	r0, [r0], #256	; 0x100
 e58:	02000000 	andeq	r0, r0, #0
 e5c:	00074c00 	andeq	r4, r7, r0, lsl #24
 e60:	bf010400 	svclt	0x00010400
 e64:	48000004 	stmdami	r0, {r2}
 e68:	8c000088 	stchi	0, cr0, [r0], {136}	; 0x88
 e6c:	33000088 	movwcc	r0, #136	; 0x88
 e70:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 e74:	732f6b62 	teqvc	pc, #100352	; 0x18800
 e78:	612f6372 	teqvs	pc, r2, ror r3	; <UNPREDICTABLE>
 e7c:	532e6d72 	teqpl	lr, #7296	; 0x1c80
 e80:	6f682f00 	svcvs	0x00682f00
 e84:	652f656d 	strvs	r6, [pc, #-1389]!	; 91f <__start-0x76e1>
 e88:	34336563 	ldrtcc	r6, [r3], #-1379	; 0x563
 e8c:	34332f39 	ldrtcc	r2, [r3], #-3897	; 0xf39
 e90:	616c2f39 	cmnvs	ip, r9, lsr pc
 e94:	662f3262 	strtvs	r3, [pc], -r2, ror #4
 e98:	6c2d3731 	stcvs	7, cr3, [sp], #-196	; 0xffffff3c
 e9c:	2d326261 	lfmcs	f6, 4, [r2, #-388]!	; 0xfffffe7c
 ea0:	69766164 	ldmdbvs	r6!, {r2, r5, r6, r8, sp, lr}^
 ea4:	32757964 	rsbscc	r7, r5, #100, 18	; 0x190000
 ea8:	6f632f39 	svcvs	0x00632f39
 eac:	47006564 	strmi	r6, [r0, -r4, ror #10]
 eb0:	4120554e 	teqmi	r0, lr, asr #10
 eb4:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
 eb8:	302e3432 	eorcc	r3, lr, r2, lsr r4
 ebc:	6a800100 	bvs	fe0012c4 <__user_program+0xfdd012c4>
 ec0:	02000000 	andeq	r0, r0, #0
 ec4:	00076000 	andeq	r6, r7, r0
 ec8:	10010400 	andne	r0, r1, r0, lsl #8
 ecc:	8c000005 	stchi	0, cr0, [r0], {5}
 ed0:	64000088 	strvs	r0, [r0], #-136	; 0x88
 ed4:	6b000089 	blvs	1100 <__start-0x6f00>
 ed8:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 edc:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 ee0:	75732f63 	ldrbvc	r2, [r3, #-3939]!	; 0xf63
 ee4:	76726570 			; <UNDEFINED> instruction: 0x76726570
 ee8:	726f7369 	rsbvc	r7, pc, #-1543503871	; 0xa4000001
 eec:	2f00532e 	svccs	0x0000532e
 ef0:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xf68
 ef4:	6563652f 	strbvs	r6, [r3, #-1327]!	; 0x52f
 ef8:	2f393433 	svccs	0x00393433
 efc:	2f393433 	svccs	0x00393433
 f00:	3262616c 	rsbcc	r6, r2, #108, 2
 f04:	3731662f 	ldrcc	r6, [r1, -pc, lsr #12]!
 f08:	62616c2d 	rsbvs	r6, r1, #11520	; 0x2d00
 f0c:	61642d32 	cmnvs	r4, r2, lsr sp
 f10:	79646976 	stmdbvc	r4!, {r1, r2, r4, r5, r6, r8, fp, sp, lr}^
 f14:	2f393275 	svccs	0x00393275
 f18:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 f1c:	554e4700 	strbpl	r4, [lr, #-1792]	; 0x700
 f20:	20534120 	subscs	r4, r3, r0, lsr #2
 f24:	34322e32 	ldrtcc	r2, [r2], #-3634	; 0xe32
 f28:	0100302e 	tsteq	r0, lr, lsr #32
 f2c:	Address 0x00000f2c is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	110e1b0e 	tstne	lr, lr, lsl #22
   c:	10061201 	andne	r1, r6, r1, lsl #4
  10:	02000017 	andeq	r0, r0, #23
  14:	0b0b0024 	bleq	2c00ac <__end+0x1940ac>
  18:	0e030b3e 	vmoveq.16	d3[0], r0
  1c:	24030000 	strcs	r0, [r3], #-0
  20:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  24:	0008030b 	andeq	r0, r8, fp, lsl #6
  28:	00160400 	andseq	r0, r6, r0, lsl #8
  2c:	0b3a0e03 	bleq	e83840 <__user_program+0xb83840>
  30:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  34:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
  38:	03193f01 	tsteq	r9, #1, 30
  3c:	3b0b3a0e 	blcc	2ce87c <__end+0x1a287c>
  40:	1119270b 	tstne	r9, fp, lsl #14
  44:	40061201 	andmi	r1, r6, r1, lsl #4
  48:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
  4c:	00001301 	andeq	r1, r0, r1, lsl #6
  50:	03000506 	movweq	r0, #1286	; 0x506
  54:	3b0b3a08 	blcc	2ce87c <__end+0x1a287c>
  58:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  5c:	07000017 	smladeq	r0, r7, r0, r0
  60:	08030005 	stmdaeq	r3, {r0, r2}
  64:	0b3b0b3a 	bleq	ec2d54 <__user_program+0xbc2d54>
  68:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  6c:	34080000 	strcc	r0, [r8], #-0
  70:	3a080300 	bcc	200c78 <__end+0xd4c78>
  74:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  78:	00170213 	andseq	r0, r7, r3, lsl r2
  7c:	00340900 	eorseq	r0, r4, r0, lsl #18
  80:	0b3a0e03 	bleq	e83894 <__user_program+0xb83894>
  84:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  88:	00001702 	andeq	r1, r0, r2, lsl #14
  8c:	0300050a 	movweq	r0, #1290	; 0x50a
  90:	3b0b3a0e 	blcc	2ce8d0 <__end+0x1a28d0>
  94:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  98:	0b000017 	bleq	fc <__start-0x7f04>
  9c:	01018289 	smlabbeq	r1, r9, r2, r8
  a0:	13310111 	teqne	r1, #1073741828	; 0x40000004
  a4:	00001301 	andeq	r1, r0, r1, lsl #6
  a8:	01828a0c 	orreq	r8, r2, ip, lsl #20
  ac:	91180200 	tstls	r8, r0, lsl #4
  b0:	00001842 	andeq	r1, r0, r2, asr #16
  b4:	0182890d 	orreq	r8, r2, sp, lsl #18
  b8:	31011101 	tstcc	r1, r1, lsl #2
  bc:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
  c0:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
  c4:	0b3b0b3a 	bleq	ec2db4 <__user_program+0xbc2db4>
  c8:	061c1349 	ldreq	r1, [ip], -r9, asr #6
  cc:	260f0000 	strcs	r0, [pc], -r0
  d0:	00134900 	andseq	r4, r3, r0, lsl #18
  d4:	000f1000 	andeq	r1, pc, r0
  d8:	13490b0b 	movtne	r0, #39691	; 0x9b0b
  dc:	35110000 	ldrcc	r0, [r1, #-0]
  e0:	00134900 	andseq	r4, r3, r0, lsl #18
  e4:	012e1200 	teqeq	lr, r0, lsl #4
  e8:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
  ec:	0b3b0b3a 	bleq	ec2ddc <__user_program+0xbc2ddc>
  f0:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
  f4:	05130000 	ldreq	r0, [r3, #-0]
  f8:	00134900 	andseq	r4, r3, r0, lsl #18
  fc:	11010000 	mrsne	r0, (UNDEF: 1)
 100:	130e2501 	movwne	r2, #58625	; 0xe501
 104:	1b0e030b 	blne	380d38 <__user_program+0x80d38>
 108:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 10c:	00171006 	andseq	r1, r7, r6
 110:	00160200 	andseq	r0, r6, r0, lsl #4
 114:	0b3a0e03 	bleq	e83928 <__user_program+0xb83928>
 118:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 11c:	24030000 	strcs	r0, [r3], #-0
 120:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 124:	000e030b 	andeq	r0, lr, fp, lsl #6
 128:	00240400 	eoreq	r0, r4, r0, lsl #8
 12c:	0b3e0b0b 	bleq	f82d60 <__user_program+0xc82d60>
 130:	00000803 	andeq	r0, r0, r3, lsl #16
 134:	03011305 	movweq	r1, #4869	; 0x1305
 138:	3a0b0b0e 	bcc	2c2d78 <__end+0x196d78>
 13c:	010b3b0b 	tsteq	fp, fp, lsl #22
 140:	06000013 			; <UNDEFINED> instruction: 0x06000013
 144:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 148:	0b381349 	bleq	e04e74 <__user_program+0xb04e74>
 14c:	00001934 	andeq	r1, r0, r4, lsr r9
 150:	0b000f07 	bleq	3d74 <__start-0x428c>
 154:	0800000b 	stmdaeq	r0, {r0, r1, r3}
 158:	0e03012e 	adfeqsp	f0, f3, #0.5
 15c:	0b3b0b3a 	bleq	ec2e4c <__user_program+0xbc2e4c>
 160:	01111927 	tsteq	r1, r7, lsr #18
 164:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 168:	01194296 			; <UNDEFINED> instruction: 0x01194296
 16c:	09000013 	stmdbeq	r0, {r0, r1, r4}
 170:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 174:	0b3b0b3a 	bleq	ec2e64 <__user_program+0xbc2e64>
 178:	17021349 	strne	r1, [r2, -r9, asr #6]
 17c:	050a0000 	streq	r0, [sl, #-0]
 180:	3a080300 	bcc	200d88 <__end+0xd4d88>
 184:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 188:	00170213 	andseq	r0, r7, r3, lsl r2
 18c:	00340b00 	eorseq	r0, r4, r0, lsl #22
 190:	0b3a0e03 	bleq	e839a4 <__user_program+0xb839a4>
 194:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 198:	00001702 	andeq	r1, r0, r2, lsl #14
 19c:	0300340c 	movweq	r3, #1036	; 0x40c
 1a0:	3b0b3a08 	blcc	2ce9c8 <__end+0x1a29c8>
 1a4:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 1a8:	0d000018 	stceq	0, cr0, [r0, #-96]	; 0xffffffa0
 1ac:	08030034 	stmdaeq	r3, {r2, r4, r5}
 1b0:	0b3b0b3a 	bleq	ec2ea0 <__user_program+0xbc2ea0>
 1b4:	17021349 	strne	r1, [r2, -r9, asr #6]
 1b8:	890e0000 	stmdbhi	lr, {}	; <UNPREDICTABLE>
 1bc:	11000182 	smlabbne	r0, r2, r1, r0
 1c0:	00133101 	andseq	r3, r3, r1, lsl #2
 1c4:	000f0f00 	andeq	r0, pc, r0, lsl #30
 1c8:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 1cc:	01100000 	tsteq	r0, r0
 1d0:	01134901 	tsteq	r3, r1, lsl #18
 1d4:	11000013 	tstne	r0, r3, lsl r0
 1d8:	13490021 	movtne	r0, #36897	; 0x9021
 1dc:	00000b2f 	andeq	r0, r0, pc, lsr #22
 1e0:	3f012e12 	svccc	0x00012e12
 1e4:	3a0e0319 	bcc	380e50 <__user_program+0x80e50>
 1e8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 1ec:	11134919 	tstne	r3, r9, lsl r9
 1f0:	40061201 	andmi	r1, r6, r1, lsl #4
 1f4:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 1f8:	00001301 	andeq	r1, r0, r1, lsl #6
 1fc:	00001813 	andeq	r1, r0, r3, lsl r8
 200:	00341400 	eorseq	r1, r4, r0, lsl #8
 204:	0b3a0e03 	bleq	e83a18 <__user_program+0xb83a18>
 208:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 20c:	00001802 	andeq	r1, r0, r2, lsl #16
 210:	55010b15 	strpl	r0, [r1, #-2837]	; 0xb15
 214:	00130117 	andseq	r0, r3, r7, lsl r1
 218:	82891600 	addhi	r1, r9, #0, 12
 21c:	01110101 	tsteq	r1, r1, lsl #2
 220:	00001331 	andeq	r1, r0, r1, lsr r3
 224:	01828a17 	orreq	r8, r2, r7, lsl sl
 228:	91180200 	tstls	r8, r0, lsl #4
 22c:	00001842 	andeq	r1, r0, r2, asr #16
 230:	11010b18 	tstne	r1, r8, lsl fp
 234:	01061201 	tsteq	r6, r1, lsl #4
 238:	19000013 	stmdbne	r0, {r0, r1, r4}
 23c:	01018289 	smlabbeq	r1, r9, r2, r8
 240:	13310111 	teqne	r1, #1073741828	; 0x40000004
 244:	00001301 	andeq	r1, r0, r1, lsl #6
 248:	4900261a 	stmdbmi	r0, {r1, r3, r4, r9, sl, sp}
 24c:	1b000013 	blne	2a0 <__start-0x7d60>
 250:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 254:	0b3a0e03 	bleq	e83a68 <__user_program+0xb83a68>
 258:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 25c:	0000193c 	andeq	r1, r0, ip, lsr r9
 260:	4900051c 	stmdbmi	r0, {r2, r3, r4, r8, sl}
 264:	00000013 	andeq	r0, r0, r3, lsl r0
 268:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 26c:	030b130e 	movweq	r1, #45838	; 0xb30e
 270:	110e1b0e 	tstne	lr, lr, lsl #22
 274:	10061201 	andne	r1, r6, r1, lsl #4
 278:	02000017 	andeq	r0, r0, #23
 27c:	0b0b0024 	bleq	2c0314 <__end+0x194314>
 280:	0e030b3e 	vmoveq.16	d3[0], r0
 284:	24030000 	strcs	r0, [r3], #-0
 288:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 28c:	0008030b 	andeq	r0, r8, fp, lsl #6
 290:	00160400 	andseq	r0, r6, r0, lsl #8
 294:	0b3a0e03 	bleq	e83aa8 <__user_program+0xb83aa8>
 298:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 29c:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
 2a0:	03193f01 	tsteq	r9, #1, 30
 2a4:	3b0b3a0e 	blcc	2ceae4 <__end+0x1a2ae4>
 2a8:	1119270b 	tstne	r9, fp, lsl #14
 2ac:	40061201 	andmi	r1, r6, r1, lsl #4
 2b0:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 2b4:	00001301 	andeq	r1, r0, r1, lsl #6
 2b8:	01828906 	orreq	r8, r2, r6, lsl #18
 2bc:	31011100 	mrscc	r1, (UNDEF: 17)
 2c0:	07000013 	smladeq	r0, r3, r0, r0
 2c4:	01018289 	smlabbeq	r1, r9, r2, r8
 2c8:	13310111 	teqne	r1, #1073741828	; 0x40000004
 2cc:	00001301 	andeq	r1, r0, r1, lsl #6
 2d0:	01828a08 	orreq	r8, r2, r8, lsl #20
 2d4:	91180200 	tstls	r8, r0, lsl #4
 2d8:	00001842 	andeq	r1, r0, r2, asr #16
 2dc:	3f012e09 	svccc	0x00012e09
 2e0:	3a0e0319 	bcc	380f4c <__user_program+0x80f4c>
 2e4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 2e8:	11134919 	tstne	r3, r9, lsl r9
 2ec:	40061201 	andmi	r1, r6, r1, lsl #4
 2f0:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 2f4:	00001301 	andeq	r1, r0, r1, lsl #6
 2f8:	0300050a 	movweq	r0, #1290	; 0x50a
 2fc:	3b0b3a0e 	blcc	2ceb3c <__end+0x1a2b3c>
 300:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 304:	0b000017 	bleq	368 <__start-0x7c98>
 308:	0b0b000f 	bleq	2c034c <__end+0x19434c>
 30c:	0f0c0000 	svceq	0x000c0000
 310:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 314:	0d000013 	stceq	0, cr0, [r0, #-76]	; 0xffffffb4
 318:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 31c:	0b3a0e03 	bleq	e83b30 <__user_program+0xb83b30>
 320:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 324:	0000193c 	andeq	r1, r0, ip, lsr r9
 328:	3f012e0e 	svccc	0x00012e0e
 32c:	3a0e0319 	bcc	380f98 <__user_program+0x80f98>
 330:	3c0b3b0b 	stccc	11, cr3, [fp], {11}
 334:	00130119 	andseq	r0, r3, r9, lsl r1
 338:	00180f00 	andseq	r0, r8, r0, lsl #30
 33c:	2e100000 	cdpcs	0, 1, cr0, cr0, cr0, {0}
 340:	03193f01 	tsteq	r9, #1, 30
 344:	3b0b3a0e 	blcc	2ceb84 <__end+0x1a2b84>
 348:	3c19270b 	ldccc	7, cr2, [r9], {11}
 34c:	00130119 	andseq	r0, r3, r9, lsl r1
 350:	00051100 	andeq	r1, r5, r0, lsl #2
 354:	00001349 	andeq	r1, r0, r9, asr #6
 358:	3f012e12 	svccc	0x00012e12
 35c:	3a0e0319 	bcc	380fc8 <__user_program+0x80fc8>
 360:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 364:	01193c13 	tsteq	r9, r3, lsl ip
 368:	13000013 	movwne	r0, #19
 36c:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 370:	0b3a0e03 	bleq	e83b84 <__user_program+0xb83b84>
 374:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 378:	193c1349 	ldmdbne	ip!, {r0, r3, r6, r8, r9, ip}
 37c:	2e140000 	cdpcs	0, 1, cr0, cr4, cr0, {0}
 380:	03193f01 	tsteq	r9, #1, 30
 384:	3b0b3a0e 	blcc	2cebc4 <__end+0x1a2bc4>
 388:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 38c:	01193c13 	tsteq	r9, r3, lsl ip
 390:	15000013 	strne	r0, [r0, #-19]
 394:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 398:	0b3a0e03 	bleq	e83bac <__user_program+0xb83bac>
 39c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 3a0:	0000193c 	andeq	r1, r0, ip, lsr r9
 3a4:	01110100 	tsteq	r1, r0, lsl #2
 3a8:	0b130e25 	bleq	4c3c44 <__user_program+0x1c3c44>
 3ac:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 3b0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 3b4:	00001710 	andeq	r1, r0, r0, lsl r7
 3b8:	0b002402 	bleq	93c8 <__rodata_start+0x3c8>
 3bc:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 3c0:	0300000e 	movweq	r0, #14
 3c4:	0b0b0024 	bleq	2c045c <__end+0x19445c>
 3c8:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 3cc:	16040000 	strne	r0, [r4], -r0
 3d0:	3a0e0300 	bcc	380fd8 <__user_program+0x80fd8>
 3d4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 3d8:	05000013 	streq	r0, [r0, #-19]
 3dc:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 3e0:	0b3a0e03 	bleq	e83bf4 <__user_program+0xb83bf4>
 3e4:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 3e8:	06120111 			; <UNDEFINED> instruction: 0x06120111
 3ec:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 3f0:	00130119 	andseq	r0, r3, r9, lsl r1
 3f4:	82890600 	addhi	r0, r9, #0, 12
 3f8:	01110101 	tsteq	r1, r1, lsl #2
 3fc:	13011331 	movwne	r1, #4913	; 0x1331
 400:	8a070000 	bhi	1c0408 <__end+0x94408>
 404:	02000182 	andeq	r0, r0, #-2147483616	; 0x80000020
 408:	18429118 	stmdane	r2, {r3, r4, r8, ip, pc}^
 40c:	89080000 	stmdbhi	r8, {}	; <UNPREDICTABLE>
 410:	11010182 	smlabbne	r1, r2, r1, r0
 414:	00133101 	andseq	r3, r3, r1, lsl #2
 418:	002e0900 	eoreq	r0, lr, r0, lsl #18
 41c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 420:	0b3b0b3a 	bleq	ec3110 <__user_program+0xbc3110>
 424:	01111927 	tsteq	r1, r7, lsr #18
 428:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 42c:	00194297 	mulseq	r9, r7, r2
 430:	00050a00 	andeq	r0, r5, r0, lsl #20
 434:	0b3a0e03 	bleq	e83c48 <__user_program+0xb83c48>
 438:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 43c:	00001802 	andeq	r1, r0, r2, lsl #16
 440:	3f002e0b 	svccc	0x00002e0b
 444:	3a0e0319 	bcc	3810b0 <__user_program+0x810b0>
 448:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 44c:	11134919 	tstne	r3, r9, lsl r9
 450:	40061201 	andmi	r1, r6, r1, lsl #4
 454:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 458:	2e0c0000 	cdpcs	0, 0, cr0, cr12, cr0, {0}
 45c:	03193f01 	tsteq	r9, #1, 30
 460:	3b0b3a0e 	blcc	2ceca0 <__end+0x1a2ca0>
 464:	3c19270b 	ldccc	7, cr2, [r9], {11}
 468:	00130119 	andseq	r0, r3, r9, lsl r1
 46c:	00050d00 	andeq	r0, r5, r0, lsl #26
 470:	00001349 	andeq	r1, r0, r9, asr #6
 474:	3f012e0e 	svccc	0x00012e0e
 478:	3a0e0319 	bcc	3810e4 <__user_program+0x810e4>
 47c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 480:	00193c19 	andseq	r3, r9, r9, lsl ip
 484:	11010000 	mrsne	r0, (UNDEF: 1)
 488:	130e2501 	movwne	r2, #58625	; 0xe501
 48c:	1b0e030b 	blne	3810c0 <__user_program+0x810c0>
 490:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 494:	00171006 	andseq	r1, r7, r6
 498:	00240200 	eoreq	r0, r4, r0, lsl #4
 49c:	0b3e0b0b 	bleq	f830d0 <__user_program+0xc830d0>
 4a0:	00000e03 	andeq	r0, r0, r3, lsl #28
 4a4:	0b002403 	bleq	94b8 <__rodata_start+0x4b8>
 4a8:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 4ac:	04000008 	streq	r0, [r0], #-8
 4b0:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 4b4:	0b3b0b3a 	bleq	ec31a4 <__user_program+0xbc31a4>
 4b8:	00001349 	andeq	r1, r0, r9, asr #6
 4bc:	3f012e05 	svccc	0x00012e05
 4c0:	3a0e0319 	bcc	38112c <__user_program+0x8112c>
 4c4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 4c8:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 4cc:	97184006 	ldrls	r4, [r8, -r6]
 4d0:	13011942 	movwne	r1, #6466	; 0x1942
 4d4:	05060000 	streq	r0, [r6, #-0]
 4d8:	3a0e0300 	bcc	3810e0 <__user_program+0x810e0>
 4dc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 4e0:	00170213 	andseq	r0, r7, r3, lsl r2
 4e4:	002e0700 	eoreq	r0, lr, r0, lsl #14
 4e8:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 4ec:	0b3b0b3a 	bleq	ec31dc <__user_program+0xbc31dc>
 4f0:	01111927 	tsteq	r1, r7, lsr #18
 4f4:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 4f8:	00194297 	mulseq	r9, r7, r2
 4fc:	002e0800 	eoreq	r0, lr, r0, lsl #16
 500:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 504:	0b3b0b3a 	bleq	ec31f4 <__user_program+0xbc31f4>
 508:	13491927 	movtne	r1, #39207	; 0x9927
 50c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 510:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 514:	00000019 	andeq	r0, r0, r9, lsl r0
 518:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 51c:	030b130e 	movweq	r1, #45838	; 0xb30e
 520:	110e1b0e 	tstne	lr, lr, lsl #22
 524:	10061201 	andne	r1, r6, r1, lsl #4
 528:	02000017 	andeq	r0, r0, #23
 52c:	0b0b0024 	bleq	2c05c4 <__end+0x1945c4>
 530:	0e030b3e 	vmoveq.16	d3[0], r0
 534:	24030000 	strcs	r0, [r3], #-0
 538:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 53c:	0008030b 	andeq	r0, r8, fp, lsl #6
 540:	00160400 	andseq	r0, r6, r0, lsl #8
 544:	0b3a0e03 	bleq	e83d58 <__user_program+0xb83d58>
 548:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 54c:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
 550:	03193f01 	tsteq	r9, #1, 30
 554:	3b0b3a0e 	blcc	2ced94 <__end+0x1a2d94>
 558:	1119270b 	tstne	r9, fp, lsl #14
 55c:	40061201 	andmi	r1, r6, r1, lsl #4
 560:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 564:	00001301 	andeq	r1, r0, r1, lsl #6
 568:	03000506 	movweq	r0, #1286	; 0x506
 56c:	3b0b3a0e 	blcc	2cedac <__end+0x1a2dac>
 570:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 574:	07000017 	smladeq	r0, r7, r0, r0
 578:	01018289 	smlabbeq	r1, r9, r2, r8
 57c:	13310111 	teqne	r1, #1073741828	; 0x40000004
 580:	00001301 	andeq	r1, r0, r1, lsl #6
 584:	01828a08 	orreq	r8, r2, r8, lsl #20
 588:	91180200 	tstls	r8, r0, lsl #4
 58c:	00001842 	andeq	r1, r0, r2, asr #16
 590:	01828909 	orreq	r8, r2, r9, lsl #18
 594:	31011100 	mrscc	r1, (UNDEF: 17)
 598:	0a000013 	beq	5ec <__start-0x7a14>
 59c:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 5a0:	0b3a0e03 	bleq	e83db4 <__user_program+0xb83db4>
 5a4:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 5a8:	01111349 	tsteq	r1, r9, asr #6
 5ac:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 5b0:	01194297 			; <UNDEFINED> instruction: 0x01194297
 5b4:	0b000013 	bleq	608 <__start-0x79f8>
 5b8:	08030005 	stmdaeq	r3, {r0, r2}
 5bc:	0b3b0b3a 	bleq	ec32ac <__user_program+0xbc32ac>
 5c0:	17021349 	strne	r1, [r2, -r9, asr #6]
 5c4:	340c0000 	strcc	r0, [ip], #-0
 5c8:	3a080300 	bcc	2011d0 <__end+0xd51d0>
 5cc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 5d0:	00170213 	andseq	r0, r7, r3, lsl r2
 5d4:	000f0d00 	andeq	r0, pc, r0, lsl #26
 5d8:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 5dc:	340e0000 	strcc	r0, [lr], #-0
 5e0:	3a0e0300 	bcc	3811e8 <__user_program+0x811e8>
 5e4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 5e8:	00170213 	andseq	r0, r7, r3, lsl r2
 5ec:	010b0f00 	tsteq	fp, r0, lsl #30
 5f0:	00001755 	andeq	r1, r0, r5, asr r7
 5f4:	03000510 	movweq	r0, #1296	; 0x510
 5f8:	3b0b3a0e 	blcc	2cee38 <__end+0x1a2e38>
 5fc:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 600:	11000018 	tstne	r0, r8, lsl r0
 604:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 608:	0b3b0b3a 	bleq	ec32f8 <__user_program+0xbc32f8>
 60c:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 610:	0000193c 	andeq	r1, r0, ip, lsr r9
 614:	03003412 	movweq	r3, #1042	; 0x412
 618:	3b0b3a0e 	blcc	2cee58 <__end+0x1a2e58>
 61c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 620:	13000018 	movwne	r0, #24
 624:	0b0b000f 	bleq	2c0668 <__end+0x194668>
 628:	05140000 	ldreq	r0, [r4, #-0]
 62c:	3a080300 	bcc	201234 <__end+0xd5234>
 630:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 634:	00180213 	andseq	r0, r8, r3, lsl r2
 638:	00341500 	eorseq	r1, r4, r0, lsl #10
 63c:	0b3a0e03 	bleq	e83e50 <__user_program+0xb83e50>
 640:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 644:	1802193f 	stmdane	r2, {r0, r1, r2, r3, r4, r5, r8, fp, ip}
 648:	2e160000 	cdpcs	0, 1, cr0, cr6, cr0, {0}
 64c:	03193f01 	tsteq	r9, #1, 30
 650:	3b0b3a0e 	blcc	2cee90 <__end+0x1a2e90>
 654:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 658:	01193c13 	tsteq	r9, r3, lsl ip
 65c:	17000013 	smladne	r0, r3, r0, r0
 660:	13490005 	movtne	r0, #36869	; 0x9005
 664:	18180000 	ldmdane	r8, {}	; <UNPREDICTABLE>
 668:	19000000 	stmdbne	r0, {}	; <UNPREDICTABLE>
 66c:	13490026 	movtne	r0, #36902	; 0x9026
 670:	2e1a0000 	cdpcs	0, 1, cr0, cr10, cr0, {0}
 674:	03193f00 	tsteq	r9, #0, 30
 678:	3b0b3a0e 	blcc	2ceeb8 <__end+0x1a2eb8>
 67c:	3c19270b 	ldccc	7, cr2, [r9], {11}
 680:	1b000019 	blne	6ec <__start-0x7914>
 684:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 688:	0b3a0e03 	bleq	e83e9c <__user_program+0xb83e9c>
 68c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 690:	1301193c 	movwne	r1, #6460	; 0x193c
 694:	2e1c0000 	cdpcs	0, 1, cr0, cr12, cr0, {0}
 698:	03193f00 	tsteq	r9, #0, 30
 69c:	3b0b3a0e 	blcc	2ceedc <__end+0x1a2edc>
 6a0:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 6a4:	00193c13 	andseq	r3, r9, r3, lsl ip
 6a8:	11010000 	mrsne	r0, (UNDEF: 1)
 6ac:	130e2501 	movwne	r2, #58625	; 0xe501
 6b0:	1b0e030b 	blne	3812e4 <__user_program+0x812e4>
 6b4:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 6b8:	00171006 	andseq	r1, r7, r6
 6bc:	00240200 	eoreq	r0, r4, r0, lsl #4
 6c0:	0b3e0b0b 	bleq	f832f4 <__user_program+0xc832f4>
 6c4:	00000e03 	andeq	r0, r0, r3, lsl #28
 6c8:	0b002403 	bleq	96dc <__rodata_start+0x6dc>
 6cc:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 6d0:	04000008 	streq	r0, [r0], #-8
 6d4:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 6d8:	0b3b0b3a 	bleq	ec33c8 <__user_program+0xbc33c8>
 6dc:	00001349 	andeq	r1, r0, r9, asr #6
 6e0:	3f002e05 	svccc	0x00002e05
 6e4:	3a0e0319 	bcc	381350 <__user_program+0x81350>
 6e8:	110b3b0b 	tstne	fp, fp, lsl #22
 6ec:	40061201 	andmi	r1, r6, r1, lsl #4
 6f0:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 6f4:	2e060000 	cdpcs	0, 0, cr0, cr6, cr0, {0}
 6f8:	03193f01 	tsteq	r9, #1, 30
 6fc:	3b0b3a0e 	blcc	2cef3c <__end+0x1a2f3c>
 700:	1119270b 	tstne	r9, fp, lsl #14
 704:	40061201 	andmi	r1, r6, r1, lsl #4
 708:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 70c:	00001301 	andeq	r1, r0, r1, lsl #6
 710:	03000507 	movweq	r0, #1287	; 0x507
 714:	3b0b3a0e 	blcc	2cef54 <__end+0x1a2f54>
 718:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 71c:	08000018 	stmdaeq	r0, {r3, r4}
 720:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 724:	0b3a0e03 	bleq	e83f38 <__user_program+0xb83f38>
 728:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 72c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 730:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 734:	00000019 	andeq	r0, r0, r9, lsl r0
 738:	10001101 	andne	r1, r0, r1, lsl #2
 73c:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 740:	1b080301 	blne	20134c <__end+0xd534c>
 744:	13082508 	movwne	r2, #34056	; 0x8508
 748:	00000005 	andeq	r0, r0, r5
 74c:	10001101 	andne	r1, r0, r1, lsl #2
 750:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 754:	1b080301 	blne	201360 <__end+0xd5360>
 758:	13082508 	movwne	r2, #34056	; 0x8508
 75c:	00000005 	andeq	r0, r0, r5
 760:	10001101 	andne	r1, r0, r1, lsl #2
 764:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 768:	1b080301 	blne	201374 <__end+0xd5374>
 76c:	13082508 	movwne	r2, #34056	; 0x8508
 770:	00000005 	andeq	r0, r0, r5

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000038 	andeq	r0, r0, r8, lsr r0
   8:	38500001 	ldmdacc	r0, {r0}^
   c:	54000000 	strpl	r0, [r0], #-0
  10:	04000000 	streq	r0, [r0], #-0
  14:	5001f300 	andpl	pc, r1, r0, lsl #6
  18:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
  1c:	00000000 	andeq	r0, r0, r0
  20:	00000c00 	andeq	r0, r0, r0, lsl #24
  24:	00003800 	andeq	r3, r0, r0, lsl #16
  28:	70000e00 	andvc	r0, r0, r0, lsl #28
  2c:	3a25f700 	bcc	97dc34 <__user_program+0x67dc34>
  30:	f71b25f7 			; <UNDEFINED> instruction: 0xf71b25f7
  34:	1aff0800 	bne	fffc203c <__user_program+0xffcc203c>
  38:	0000389f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
  3c:	00005400 	andeq	r5, r0, r0, lsl #8
  40:	f3000f00 	vpmax.f32	d0, d0, d0
  44:	25f75001 	ldrbcs	r5, [r7, #1]!
  48:	1b25f73a 	blne	97dd38 <__user_program+0x67dd38>
  4c:	ff0800f7 			; <UNDEFINED> instruction: 0xff0800f7
  50:	00009f1a 	andeq	r9, r0, sl, lsl pc
  54:	00000000 	andeq	r0, r0, r0
  58:	00300000 	eorseq	r0, r0, r0
  5c:	004c0000 	subeq	r0, ip, r0
  60:	00010000 	andeq	r0, r1, r0
  64:	00004c52 	andeq	r4, r0, r2, asr ip
  68:	00005400 	andeq	r5, r0, r0, lsl #8
  6c:	50000100 	andpl	r0, r0, r0, lsl #2
	...
  78:	00000040 	andeq	r0, r0, r0, asr #32
  7c:	0000004c 	andeq	r0, r0, ip, asr #32
  80:	00500001 	subseq	r0, r0, r1
  84:	00000000 	andeq	r0, r0, r0
  88:	54000000 	strpl	r0, [r0], #-0
  8c:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
  90:	01000000 	mrseq	r0, (UNDEF: 0)
  94:	00685000 	rsbeq	r5, r8, r0
  98:	00800000 	addeq	r0, r0, r0
  9c:	00040000 	andeq	r0, r4, r0
  a0:	9f5001f3 	svcls	0x005001f3
  a4:	00000080 	andeq	r0, r0, r0, lsl #1
  a8:	00000088 	andeq	r0, r0, r8, lsl #1
  ac:	88500001 	ldmdahi	r0, {r0}^
  b0:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
  b4:	04000000 	streq	r0, [r0], #-0
  b8:	5001f300 	andpl	pc, r1, r0, lsl #6
  bc:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
  c0:	00000000 	andeq	r0, r0, r0
  c4:	00009800 	andeq	r9, r0, r0, lsl #16
  c8:	0000ac00 	andeq	sl, r0, r0, lsl #24
  cc:	50000100 	andpl	r0, r0, r0, lsl #2
  d0:	000000ac 	andeq	r0, r0, ip, lsr #1
  d4:	000000c4 	andeq	r0, r0, r4, asr #1
  d8:	01f30004 	mvnseq	r0, r4
  dc:	00c49f50 	sbceq	r9, r4, r0, asr pc
  e0:	00cc0000 	sbceq	r0, ip, r0
  e4:	00010000 	andeq	r0, r1, r0
  e8:	0000cc50 	andeq	ip, r0, r0, asr ip
  ec:	0000dc00 	andeq	sp, r0, r0, lsl #24
  f0:	f3000400 	vshl.u8	d0, d0, d0
  f4:	009f5001 	addseq	r5, pc, r1
  f8:	00000000 	andeq	r0, r0, r0
  fc:	dc000000 	stcle	0, cr0, [r0], {-0}
 100:	00000000 	andeq	r0, r0, r0
 104:	01000001 	tsteq	r0, r1
 108:	01005000 	mrseq	r5, (UNDEF: 0)
 10c:	01600000 	cmneq	r0, r0
 110:	00040000 	andeq	r0, r4, r0
 114:	9f5001f3 	svcls	0x005001f3
	...
 120:	000000dc 	ldrdeq	r0, [r0], -ip
 124:	00000103 	andeq	r0, r0, r3, lsl #2
 128:	03510001 	cmpeq	r1, #1
 12c:	60000001 	andvs	r0, r0, r1
 130:	04000001 	streq	r0, [r0], #-1
 134:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
 138:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
	...
 144:	00004800 	andeq	r4, r0, r0, lsl #16
 148:	50000100 	andpl	r0, r0, r0, lsl #2
 14c:	00000048 	andeq	r0, r0, r8, asr #32
 150:	000000e0 	andeq	r0, r0, r0, ror #1
 154:	01f30004 	mvnseq	r0, r4
 158:	00009f50 	andeq	r9, r0, r0, asr pc
	...
 164:	00480000 	subeq	r0, r8, r0
 168:	00060000 	andeq	r0, r6, r0
 16c:	53049352 	movwpl	r9, #17234	; 0x4352
 170:	00480493 	umaaleq	r0, r8, r3, r4
 174:	007c0000 	rsbseq	r0, ip, r0
 178:	00060000 	andeq	r0, r6, r0
 17c:	57049356 	smlsdpl	r4, r6, r3, r9
 180:	00800493 	umulleq	r0, r0, r3, r4	; <UNPREDICTABLE>
 184:	00e00000 	rsceq	r0, r0, r0
 188:	00060000 	andeq	r0, r6, r0
 18c:	57049356 	smlsdpl	r4, r6, r3, r9
 190:	00000493 	muleq	r0, r3, r4
 194:	00000000 	andeq	r0, r0, r0
 198:	00100000 	andseq	r0, r0, r0
 19c:	00480000 	subeq	r0, r8, r0
 1a0:	00020000 	andeq	r0, r2, r0
 1a4:	00909f30 	addseq	r9, r0, r0, lsr pc
 1a8:	009c0000 	addseq	r0, ip, r0
 1ac:	00010000 	andeq	r0, r1, r0
 1b0:	0000b058 	andeq	fp, r0, r8, asr r0
 1b4:	0000b800 	andeq	fp, r0, r0, lsl #16
 1b8:	58000100 	stmdapl	r0, {r8}
 1bc:	000000b8 	strheq	r0, [r0], -r8
 1c0:	000000c4 	andeq	r0, r0, r4, asr #1
 1c4:	7f780003 	svcvc	0x00780003
 1c8:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 1cc:	00000000 	andeq	r0, r0, r0
 1d0:	00001000 	andeq	r1, r0, r0
 1d4:	00003800 	andeq	r3, r0, r0, lsl #16
 1d8:	91000300 	mrsls	r0, LR_irq
 1dc:	00389f57 	eorseq	r9, r8, r7, asr pc
 1e0:	00640000 	rsbeq	r0, r4, r0
 1e4:	00010000 	andeq	r0, r1, r0
 1e8:	00006454 	andeq	r6, r0, r4, asr r4
 1ec:	00009c00 	andeq	r9, r0, r0, lsl #24
 1f0:	74000300 	strvc	r0, [r0], #-768	; 0x300
 1f4:	009c9f01 	addseq	r9, ip, r1, lsl #30
 1f8:	00b00000 	adcseq	r0, r0, r0
 1fc:	00010000 	andeq	r0, r1, r0
 200:	0000b054 	andeq	fp, r0, r4, asr r0
 204:	0000c400 	andeq	ip, r0, r0, lsl #8
 208:	74000300 	strvc	r0, [r0], #-768	; 0x300
 20c:	00c49f01 	sbceq	r9, r4, r1, lsl #30
 210:	00c80000 	sbceq	r0, r8, r0
 214:	00010000 	andeq	r0, r1, r0
 218:	0000c854 	andeq	ip, r0, r4, asr r8
 21c:	0000cc00 	andeq	ip, r0, r0, lsl #24
 220:	74000300 	strvc	r0, [r0], #-768	; 0x300
 224:	00cc9f7f 	sbceq	r9, ip, pc, ror pc
 228:	00e00000 	rsceq	r0, r0, r0
 22c:	00010000 	andeq	r0, r1, r0
 230:	00000054 	andeq	r0, r0, r4, asr r0
 234:	00000000 	andeq	r0, r0, r0
 238:	0000e000 	andeq	lr, r0, r0
 23c:	00010800 	andeq	r0, r1, r0, lsl #16
 240:	91000200 	mrsls	r0, R8_usr
 244:	00010870 	andeq	r0, r1, r0, ror r8
 248:	00011c00 	andeq	r1, r1, r0, lsl #24
 24c:	54000100 	strpl	r0, [r0], #-256	; 0x100
 250:	0000011c 	andeq	r0, r0, ip, lsl r1
 254:	0000027c 	andeq	r0, r0, ip, ror r2
 258:	01740003 	cmneq	r4, r3
 25c:	00027c9f 	muleq	r2, pc, ip	; <UNPREDICTABLE>
 260:	00028800 	andeq	r8, r2, r0, lsl #16
 264:	54000100 	strpl	r0, [r0], #-256	; 0x100
	...
 270:	000001e8 	andeq	r0, r0, r8, ror #3
 274:	000001f4 	strdeq	r0, [r0], -r4
 278:	00730002 	rsbseq	r0, r3, r2
 27c:	000001f4 	strdeq	r0, [r0], -r4
 280:	000001f7 	strdeq	r0, [r0], -r7
 284:	00520001 	subseq	r0, r2, r1
 288:	00000000 	andeq	r0, r0, r0
 28c:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
 290:	14000002 	strne	r0, [r0], #-2
 294:	02000002 	andeq	r0, r0, #2
 298:	14007300 	strne	r7, [r0], #-768	; 0x300
 29c:	17000002 	strne	r0, [r0, -r2]
 2a0:	01000002 	tsteq	r0, r2
 2a4:	00005200 	andeq	r5, r0, r0, lsl #4
 2a8:	00000000 	andeq	r0, r0, r0
 2ac:	01840000 	orreq	r0, r4, r0
 2b0:	01bc0000 			; <UNDEFINED> instruction: 0x01bc0000
 2b4:	00010000 	andeq	r0, r1, r0
 2b8:	00000055 	andeq	r0, r0, r5, asr r0
 2bc:	00000000 	andeq	r0, r0, r0
 2c0:	0001c800 	andeq	ip, r1, r0, lsl #16
 2c4:	0001d400 	andeq	sp, r1, r0, lsl #8
 2c8:	73000200 	movwvc	r0, #512	; 0x200
 2cc:	0001d400 	andeq	sp, r1, r0, lsl #8
 2d0:	0001d700 	andeq	sp, r1, r0, lsl #14
 2d4:	52000100 	andpl	r0, r0, #0, 2
	...
 2e0:	0000022c 	andeq	r0, r0, ip, lsr #4
 2e4:	00000240 	andeq	r0, r0, r0, asr #4
 2e8:	40550001 	subsmi	r0, r5, r1
 2ec:	4c000002 	stcmi	0, cr0, [r0], {2}
 2f0:	03000002 	movweq	r0, #2
 2f4:	9f7f7500 	svcls	0x007f7500
	...
 300:	00000258 	andeq	r0, r0, r8, asr r2
 304:	0000025f 	andeq	r0, r0, pc, asr r2
 308:	00730002 	rsbseq	r0, r3, r2
	...
 314:	00000048 	andeq	r0, r0, r8, asr #32
 318:	00000080 	andeq	r0, r0, r0, lsl #1
 31c:	80500001 	subshi	r0, r0, r1
 320:	88000000 	stmdahi	r0, {}	; <UNPREDICTABLE>
 324:	04000000 	streq	r0, [r0], #-0
 328:	5001f300 	andpl	pc, r1, r0, lsl #6
 32c:	0000889f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
 330:	00008c00 	andeq	r8, r0, r0, lsl #24
 334:	50000100 	andpl	r0, r0, r0, lsl #2
 338:	0000008c 	andeq	r0, r0, ip, lsl #1
 33c:	0000009c 	muleq	r0, ip, r0
 340:	01f30004 	mvnseq	r0, r4
 344:	009c9f50 	addseq	r9, ip, r0, asr pc
 348:	00a00000 	adceq	r0, r0, r0
 34c:	00010000 	andeq	r0, r1, r0
 350:	0000a050 	andeq	sl, r0, r0, asr r0
 354:	0000a800 	andeq	sl, r0, r0, lsl #16
 358:	f3000400 	vshl.u8	d0, d0, d0
 35c:	a89f5001 	ldmge	pc, {r0, ip, lr}	; <UNPREDICTABLE>
 360:	ac000000 	stcge	0, cr0, [r0], {-0}
 364:	01000000 	mrseq	r0, (UNDEF: 0)
 368:	00ac5000 	adceq	r5, ip, r0
 36c:	00b80000 	adcseq	r0, r8, r0
 370:	00040000 	andeq	r0, r4, r0
 374:	9f5001f3 	svcls	0x005001f3
 378:	000000b8 	strheq	r0, [r0], -r8
 37c:	000000bc 	strheq	r0, [r0], -ip
 380:	bc500001 	mrrclt	0, 0, r0, r0, cr1	; <UNPREDICTABLE>
 384:	c4000000 	strgt	r0, [r0], #-0
 388:	04000000 	streq	r0, [r0], #-0
 38c:	5001f300 	andpl	pc, r1, r0, lsl #6
 390:	0000c49f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
 394:	0000c800 	andeq	ip, r0, r0, lsl #16
 398:	50000100 	andpl	r0, r0, r0, lsl #2
 39c:	000000c8 	andeq	r0, r0, r8, asr #1
 3a0:	000000d8 	ldrdeq	r0, [r0], -r8
 3a4:	01f30004 	mvnseq	r0, r4
 3a8:	00d89f50 	sbcseq	r9, r8, r0, asr pc
 3ac:	00dc0000 	sbcseq	r0, ip, r0
 3b0:	00010000 	andeq	r0, r1, r0
 3b4:	0000dc50 	andeq	sp, r0, r0, asr ip
 3b8:	0000ec00 	andeq	lr, r0, r0, lsl #24
 3bc:	f3000400 	vshl.u8	d0, d0, d0
 3c0:	ec9f5001 	ldc	0, cr5, [pc], {1}
 3c4:	f0000000 			; <UNDEFINED> instruction: 0xf0000000
 3c8:	01000000 	mrseq	r0, (UNDEF: 0)
 3cc:	00f05000 	rscseq	r5, r0, r0
 3d0:	00fc0000 	rscseq	r0, ip, r0
 3d4:	00040000 	andeq	r0, r4, r0
 3d8:	9f5001f3 	svcls	0x005001f3
 3dc:	000000fc 	strdeq	r0, [r0], -ip
 3e0:	00000100 	andeq	r0, r0, r0, lsl #2
 3e4:	00500001 	subseq	r0, r0, r1
 3e8:	04000001 	streq	r0, [r0], #-1
 3ec:	04000001 	streq	r0, [r0], #-1
 3f0:	5001f300 	andpl	pc, r1, r0, lsl #6
 3f4:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 3f8:	00000000 	andeq	r0, r0, r0
 3fc:	00004800 	andeq	r4, r0, r0, lsl #16
 400:	00008300 	andeq	r8, r0, r0, lsl #6
 404:	51000100 	mrspl	r0, (UNDEF: 16)
 408:	00000083 	andeq	r0, r0, r3, lsl #1
 40c:	00000088 	andeq	r0, r0, r8, lsl #1
 410:	01f30004 	mvnseq	r0, r4
 414:	00889f51 	addeq	r9, r8, r1, asr pc
 418:	00900000 	addseq	r0, r0, r0
 41c:	00010000 	andeq	r0, r1, r0
 420:	00009051 	andeq	r9, r0, r1, asr r0
 424:	00009700 	andeq	r9, r0, r0, lsl #14
 428:	53000100 	movwpl	r0, #256	; 0x100
 42c:	00000097 	muleq	r0, r7, r0
 430:	0000009c 	muleq	r0, ip, r0
 434:	01f30004 	mvnseq	r0, r4
 438:	009c9f51 	addseq	r9, ip, r1, asr pc
 43c:	00a30000 	adceq	r0, r3, r0
 440:	00010000 	andeq	r0, r1, r0
 444:	0000a351 	andeq	sl, r0, r1, asr r3
 448:	0000a800 	andeq	sl, r0, r0, lsl #16
 44c:	f3000400 	vshl.u8	d0, d0, d0
 450:	a89f5101 	ldmge	pc, {r0, r8, ip, lr}	; <UNPREDICTABLE>
 454:	b0000000 	andlt	r0, r0, r0
 458:	01000000 	mrseq	r0, (UNDEF: 0)
 45c:	00b05100 	adcseq	r5, r0, r0, lsl #2
 460:	00b30000 	adcseq	r0, r3, r0
 464:	00010000 	andeq	r0, r1, r0
 468:	0000b353 	andeq	fp, r0, r3, asr r3
 46c:	0000b800 	andeq	fp, r0, r0, lsl #16
 470:	f3000400 	vshl.u8	d0, d0, d0
 474:	b89f5101 	ldmlt	pc, {r0, r8, ip, lr}	; <UNPREDICTABLE>
 478:	bf000000 	svclt	0x00000000
 47c:	01000000 	mrseq	r0, (UNDEF: 0)
 480:	00bf5100 	adcseq	r5, pc, r0, lsl #2
 484:	00c40000 	sbceq	r0, r4, r0
 488:	00040000 	andeq	r0, r4, r0
 48c:	9f5101f3 	svcls	0x005101f3
 490:	000000c4 	andeq	r0, r0, r4, asr #1
 494:	000000cc 	andeq	r0, r0, ip, asr #1
 498:	cc510001 	mrrcgt	0, 0, r0, r1, cr1
 49c:	d3000000 	movwle	r0, #0
 4a0:	01000000 	mrseq	r0, (UNDEF: 0)
 4a4:	00d35300 	sbcseq	r5, r3, r0, lsl #6
 4a8:	00d80000 	sbcseq	r0, r8, r0
 4ac:	00040000 	andeq	r0, r4, r0
 4b0:	9f5101f3 	svcls	0x005101f3
 4b4:	000000d8 	ldrdeq	r0, [r0], -r8
 4b8:	000000e0 	andeq	r0, r0, r0, ror #1
 4bc:	e0510001 	subs	r0, r1, r1
 4c0:	e7000000 	str	r0, [r0, -r0]
 4c4:	01000000 	mrseq	r0, (UNDEF: 0)
 4c8:	00e75300 	rsceq	r5, r7, r0, lsl #6
 4cc:	00ec0000 	rsceq	r0, ip, r0
 4d0:	00040000 	andeq	r0, r4, r0
 4d4:	9f5101f3 	svcls	0x005101f3
 4d8:	000000ec 	andeq	r0, r0, ip, ror #1
 4dc:	000000f3 	strdeq	r0, [r0], -r3
 4e0:	f3510001 	vhadd.u16	d16, d1, d1
 4e4:	fc000000 	stc2	0, cr0, [r0], {-0}
 4e8:	04000000 	streq	r0, [r0], #-0
 4ec:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
 4f0:	0000fc9f 	muleq	r0, pc, ip	; <UNPREDICTABLE>
 4f4:	00010400 	andeq	r0, r1, r0, lsl #8
 4f8:	51000100 	mrspl	r0, (UNDEF: 16)
	...
 508:	00000018 	andeq	r0, r0, r8, lsl r0
 50c:	18500001 	ldmdane	r0, {r0}^
 510:	2c000000 	stccs	0, cr0, [r0], {-0}
 514:	04000000 	streq	r0, [r0], #-0
 518:	5001f300 	andpl	pc, r1, r0, lsl #6
 51c:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
	...
 528:	00000c00 	andeq	r0, r0, r0, lsl #24
 52c:	50000100 	andpl	r0, r0, r0, lsl #2
 530:	0000000c 	andeq	r0, r0, ip
 534:	00000013 	andeq	r0, r0, r3, lsl r0
 538:	13510001 	cmpne	r1, #1
 53c:	1c000000 	stcne	0, cr0, [r0], {-0}
 540:	04000000 	streq	r0, [r0], #-0
 544:	5001f300 	andpl	pc, r1, r0, lsl #6
 548:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 54c:	00000000 	andeq	r0, r0, r0
 550:	00001c00 	andeq	r1, r0, r0, lsl #24
 554:	00003c00 	andeq	r3, r0, r0, lsl #24
 558:	50000100 	andpl	r0, r0, r0, lsl #2
 55c:	0000003c 	andeq	r0, r0, ip, lsr r0
 560:	00000050 	andeq	r0, r0, r0, asr r0
 564:	01f30004 	mvnseq	r0, r4
 568:	00509f50 	subseq	r9, r0, r0, asr pc
 56c:	00540000 	subseq	r0, r4, r0
 570:	00010000 	andeq	r0, r1, r0
 574:	00005450 	andeq	r5, r0, r0, asr r4
 578:	00005c00 	andeq	r5, r0, r0, lsl #24
 57c:	f3000400 	vshl.u8	d0, d0, d0
 580:	5c9f5001 	ldcpl	0, cr5, [pc], {1}
 584:	60000000 	andvs	r0, r0, r0
 588:	01000000 	mrseq	r0, (UNDEF: 0)
 58c:	00605000 	rsbeq	r5, r0, r0
 590:	00640000 	rsbeq	r0, r4, r0
 594:	00040000 	andeq	r0, r4, r0
 598:	9f5001f3 	svcls	0x005001f3
	...
 5a4:	0000001c 	andeq	r0, r0, ip, lsl r0
 5a8:	0000003c 	andeq	r0, r0, ip, lsr r0
 5ac:	3c510001 	mrrccc	0, 0, r0, r1, cr1
 5b0:	50000000 	andpl	r0, r0, r0
 5b4:	04000000 	streq	r0, [r0], #-0
 5b8:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
 5bc:	0000509f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 5c0:	00005400 	andeq	r5, r0, r0, lsl #8
 5c4:	51000100 	mrspl	r0, (UNDEF: 16)
 5c8:	00000054 	andeq	r0, r0, r4, asr r0
 5cc:	0000005c 	andeq	r0, r0, ip, asr r0
 5d0:	01f30004 	mvnseq	r0, r4
 5d4:	005c9f51 	subseq	r9, ip, r1, asr pc
 5d8:	00640000 	rsbeq	r0, r4, r0
 5dc:	00010000 	andeq	r0, r1, r0
 5e0:	00000051 	andeq	r0, r0, r1, asr r0
 5e4:	00000000 	andeq	r0, r0, r0
 5e8:	00001c00 	andeq	r1, r0, r0, lsl #24
 5ec:	00003c00 	andeq	r3, r0, r0, lsl #24
 5f0:	52000100 	andpl	r0, r0, #0, 2
 5f4:	0000003c 	andeq	r0, r0, ip, lsr r0
 5f8:	00000050 	andeq	r0, r0, r0, asr r0
 5fc:	50560001 	subspl	r0, r6, r1
 600:	54000000 	strpl	r0, [r0], #-0
 604:	01000000 	mrseq	r0, (UNDEF: 0)
 608:	00545200 	subseq	r5, r4, r0, lsl #4
 60c:	005c0000 	subseq	r0, ip, r0
 610:	00040000 	andeq	r0, r4, r0
 614:	9f5201f3 	svcls	0x005201f3
 618:	0000005c 	andeq	r0, r0, ip, asr r0
 61c:	00000064 	andeq	r0, r0, r4, rrx
 620:	00520001 	subseq	r0, r2, r1
 624:	00000000 	andeq	r0, r0, r0
 628:	2c000000 	stccs	0, cr0, [r0], {-0}
 62c:	3c000000 	stccc	0, cr0, [r0], {-0}
 630:	02000000 	andeq	r0, r0, #0
 634:	3c9f3000 	ldccc	0, cr3, [pc], {0}
 638:	40000000 	andmi	r0, r0, r0
 63c:	07000000 	streq	r0, [r0, -r0]
 640:	f3007400 	vshl.u8	d7, d0, d0
 644:	9f1c5101 	svcls	0x001c5101
 648:	00000040 	andeq	r0, r0, r0, asr #32
 64c:	00000044 	andeq	r0, r0, r4, asr #32
 650:	01f30008 	mvnseq	r0, r8
 654:	00742051 	rsbseq	r2, r4, r1, asr r0
 658:	00449f22 	subeq	r9, r4, r2, lsr #30
 65c:	00500000 	subseq	r0, r0, r0
 660:	00070000 	andeq	r0, r7, r0
 664:	01f30074 	mvnseq	r0, r4, ror r0
 668:	509f1c51 	addspl	r1, pc, r1, asr ip	; <UNPREDICTABLE>
 66c:	54000000 	strpl	r0, [r0], #-0
 670:	02000000 	andeq	r0, r0, #0
 674:	009f3000 	addseq	r3, pc, r0
 678:	00000000 	andeq	r0, r0, r0
 67c:	64000000 	strvs	r0, [r0], #-0
 680:	8c000000 	stchi	0, cr0, [r0], {-0}
 684:	01000000 	mrseq	r0, (UNDEF: 0)
 688:	008c5000 	addeq	r5, ip, r0
 68c:	01000000 	mrseq	r0, (UNDEF: 0)
 690:	00040000 	andeq	r0, r4, r0
 694:	9f5001f3 	svcls	0x005001f3
 698:	00000100 	andeq	r0, r0, r0, lsl #2
 69c:	00000104 	andeq	r0, r0, r4, lsl #2
 6a0:	04500001 	ldrbeq	r0, [r0], #-1
 6a4:	0c000001 	stceq	0, cr0, [r0], {1}
 6a8:	04000001 	streq	r0, [r0], #-1
 6ac:	5001f300 	andpl	pc, r1, r0, lsl #6
 6b0:	00010c9f 	muleq	r1, pc, ip	; <UNPREDICTABLE>
 6b4:	00011000 	andeq	r1, r1, r0
 6b8:	50000100 	andpl	r0, r0, r0, lsl #2
 6bc:	00000110 	andeq	r0, r0, r0, lsl r1
 6c0:	0000011c 	andeq	r0, r0, ip, lsl r1
 6c4:	01f30004 	mvnseq	r0, r4
 6c8:	00009f50 	andeq	r9, r0, r0, asr pc
 6cc:	00000000 	andeq	r0, r0, r0
 6d0:	00640000 	rsbeq	r0, r4, r0
 6d4:	008c0000 	addeq	r0, ip, r0
 6d8:	00010000 	andeq	r0, r1, r0
 6dc:	00008c51 	andeq	r8, r0, r1, asr ip
 6e0:	00010000 	andeq	r0, r1, r0
 6e4:	57000100 	strpl	r0, [r0, -r0, lsl #2]
 6e8:	00000100 	andeq	r0, r0, r0, lsl #2
 6ec:	00000104 	andeq	r0, r0, r4, lsl #2
 6f0:	04510001 	ldrbeq	r0, [r1], #-1
 6f4:	0c000001 	stceq	0, cr0, [r0], {1}
 6f8:	04000001 	streq	r0, [r0], #-1
 6fc:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
 700:	00010c9f 	muleq	r1, pc, ip	; <UNPREDICTABLE>
 704:	00011400 	andeq	r1, r1, r0, lsl #8
 708:	51000100 	mrspl	r0, (UNDEF: 16)
 70c:	00000114 	andeq	r0, r0, r4, lsl r1
 710:	0000011c 	andeq	r0, r0, ip, lsl r1
 714:	00570001 	subseq	r0, r7, r1
 718:	00000000 	andeq	r0, r0, r0
 71c:	64000000 	strvs	r0, [r0], #-0
 720:	8c000000 	stchi	0, cr0, [r0], {-0}
 724:	01000000 	mrseq	r0, (UNDEF: 0)
 728:	008c5200 	addeq	r5, ip, r0, lsl #4
 72c:	01000000 	mrseq	r0, (UNDEF: 0)
 730:	00010000 	andeq	r0, r1, r0
 734:	00010056 	andeq	r0, r1, r6, asr r0
 738:	00010400 	andeq	r0, r1, r0, lsl #8
 73c:	52000100 	andpl	r0, r0, #0, 2
 740:	00000104 	andeq	r0, r0, r4, lsl #2
 744:	0000010c 	andeq	r0, r0, ip, lsl #2
 748:	01f30004 	mvnseq	r0, r4
 74c:	010c9f52 	tsteq	ip, r2, asr pc
 750:	01140000 	tsteq	r4, r0
 754:	00010000 	andeq	r0, r1, r0
 758:	00011452 	andeq	r1, r1, r2, asr r4
 75c:	00011c00 	andeq	r1, r1, r0, lsl #24
 760:	56000100 	strpl	r0, [r0], -r0, lsl #2
	...
 76c:	00000070 	andeq	r0, r0, r0, ror r0
 770:	0000008c 	andeq	r0, r0, ip, lsl #1
 774:	9f300002 	svcls	0x00300002
 778:	0000008c 	andeq	r0, r0, ip, lsl #1
 77c:	00000100 	andeq	r0, r0, r0, lsl #2
 780:	00550001 	subseq	r0, r5, r1
 784:	04000001 	streq	r0, [r0], #-1
 788:	02000001 	andeq	r0, r0, #1
 78c:	149f3000 	ldrne	r3, [pc], #0	; 794 <__start-0x786c>
 790:	1c000001 	stcne	0, cr0, [r0], {1}
 794:	01000001 	tsteq	r0, r1
 798:	00005500 	andeq	r5, r0, r0, lsl #10
 79c:	00000000 	andeq	r0, r0, r0
 7a0:	00940000 	addseq	r0, r4, r0
 7a4:	00ac0000 	adceq	r0, ip, r0
 7a8:	00010000 	andeq	r0, r1, r0
 7ac:	0000c850 	andeq	ip, r0, r0, asr r8
 7b0:	0000d800 	andeq	sp, r0, r0, lsl #16
 7b4:	50000100 	andpl	r0, r0, r0, lsl #2
 7b8:	000000e8 	andeq	r0, r0, r8, ror #1
 7bc:	000000eb 	andeq	r0, r0, fp, ror #1
 7c0:	14500001 	ldrbne	r0, [r0], #-1
 7c4:	18000001 	stmdane	r0, {r0}
 7c8:	01000001 	tsteq	r0, r1
 7cc:	00005000 	andeq	r5, r0, r0
 7d0:	00000000 	andeq	r0, r0, r0
 7d4:	011c0000 	tsteq	ip, r0
 7d8:	01200000 	teqeq	r0, r0
 7dc:	00010000 	andeq	r0, r1, r0
 7e0:	00012050 	andeq	r2, r1, r0, asr r0
 7e4:	00012400 	andeq	r2, r1, r0, lsl #8
 7e8:	f3000400 	vshl.u8	d0, d0, d0
 7ec:	009f5001 	addseq	r5, pc, r1
 7f0:	00000000 	andeq	r0, r0, r0
 7f4:	24000000 	strcs	r0, [r0], #-0
 7f8:	28000001 	stmdacs	r0, {r0}
 7fc:	01000001 	tsteq	r0, r1
 800:	01285000 	teqeq	r8, r0
 804:	012c0000 	teqeq	ip, r0
 808:	00040000 	andeq	r0, r4, r0
 80c:	9f5001f3 	svcls	0x005001f3
	...
 818:	0000012c 	andeq	r0, r0, ip, lsr #2
 81c:	00000160 	andeq	r0, r0, r0, ror #2
 820:	60500001 	subsvs	r0, r0, r1
 824:	84000001 	strhi	r0, [r0], #-1
 828:	04000001 	streq	r0, [r0], #-1
 82c:	5001f300 	andpl	pc, r1, r0, lsl #6
 830:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 834:	00000000 	andeq	r0, r0, r0
 838:	00018400 	andeq	r8, r1, r0, lsl #8
 83c:	00018800 	andeq	r8, r1, r0, lsl #16
 840:	50000100 	andpl	r0, r0, r0, lsl #2
 844:	00000188 	andeq	r0, r0, r8, lsl #3
 848:	0000018c 	andeq	r0, r0, ip, lsl #3
 84c:	01f30004 	mvnseq	r0, r4
 850:	00009f50 	andeq	r9, r0, r0, asr pc
 854:	00000000 	andeq	r0, r0, r0
 858:	018c0000 	orreq	r0, ip, r0
 85c:	01900000 	orrseq	r0, r0, r0
 860:	00010000 	andeq	r0, r1, r0
 864:	00019050 	andeq	r9, r1, r0, asr r0
 868:	00019400 	andeq	r9, r1, r0, lsl #8
 86c:	f3000400 	vshl.u8	d0, d0, d0
 870:	009f5001 	addseq	r5, pc, r1
 874:	00000000 	andeq	r0, r0, r0
 878:	94000000 	strls	r0, [r0], #-0
 87c:	98000001 	stmdals	r0, {r0}
 880:	01000001 	tsteq	r0, r1
 884:	01985000 	orrseq	r5, r8, r0
 888:	019c0000 	orrseq	r0, ip, r0
 88c:	00040000 	andeq	r0, r4, r0
 890:	9f5001f3 	svcls	0x005001f3
	...
 89c:	0000019c 	muleq	r0, ip, r1
 8a0:	000001a0 	andeq	r0, r0, r0, lsr #3
 8a4:	a0500001 	subsge	r0, r0, r1
 8a8:	a4000001 	strge	r0, [r0], #-1
 8ac:	04000001 	streq	r0, [r0], #-1
 8b0:	5001f300 	andpl	pc, r1, r0, lsl #6
 8b4:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 8b8:	00000000 	andeq	r0, r0, r0
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008054 	andeq	r8, r0, r4, asr r0
  14:	00000160 	andeq	r0, r0, r0, ror #2
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	01b50002 			; <UNDEFINED> instruction: 0x01b50002
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
  34:	00000298 	muleq	r0, r8, r2
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	04a90002 	strteq	r0, [r9], #2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	0000844c 	andeq	r8, r0, ip, asr #8
  54:	00000104 	andeq	r0, r0, r4, lsl #2
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	07290002 	streq	r0, [r9, -r2]!
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008550 	andeq	r8, r0, r0, asr r5
  74:	000000d8 	ldrdeq	r0, [r0], -r8
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	08800002 	stmeq	r0, {r1}
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	00008628 	andeq	r8, r0, r8, lsr #12
  94:	00000070 	andeq	r0, r0, r0, ror r0
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	09450002 	stmdbeq	r5, {r1}^
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00008698 	muleq	r0, r8, r6
  b4:	000001a4 	andeq	r0, r0, r4, lsr #3
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	0d180002 	ldceq	0, cr0, [r8, #-8]
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	0000883c 	andeq	r8, r0, ip, lsr r8
  d4:	0000000c 	andeq	r0, r0, ip
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	0dee0002 	stcleq	0, cr0, [lr, #8]!
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	00008000 	andeq	r8, r0, r0
  f4:	00000054 	andeq	r0, r0, r4, asr r0
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	0e570002 	cdpeq	0, 5, cr0, cr7, cr2, {0}
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	00008848 	andeq	r8, r0, r8, asr #16
 114:	00000044 	andeq	r0, r0, r4, asr #32
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	0ebf0002 	cdpeq	0, 11, cr0, cr15, cr2, {0}
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	0000888c 	andeq	r8, r0, ip, lsl #17
 134:	000000d8 	ldrdeq	r0, [r0], -r8
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000082 	andeq	r0, r0, r2, lsl #1
   4:	004f0002 	subeq	r0, pc, r2
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	33010000 	movwcc	r0, #4096	; 0x1000
  1c:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
  20:	732f6b62 	teqvc	pc, #100352	; 0x18800
  24:	33006372 	movwcc	r6, #882	; 0x372
  28:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
  2c:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
  30:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
  34:	00006564 	andeq	r6, r0, r4, ror #10
  38:	6f697067 	svcvs	0x00697067
  3c:	0100632e 	tsteq	r0, lr, lsr #6
  40:	736b0000 	cmnvc	fp, #0
  44:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
  48:	00682e74 	rsbeq	r2, r8, r4, ror lr
  4c:	61000002 	tstvs	r0, r2
  50:	682e6d72 	stmdavs	lr!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}
  54:	00000200 	andeq	r0, r0, r0, lsl #4
  58:	02050000 	andeq	r0, r5, #0
  5c:	00008054 	andeq	r8, r0, r4, asr r0
  60:	0100d303 	tsteq	r0, r3, lsl #6
  64:	84a06a13 	strthi	r6, [r0], #2579	; 0xa13
  68:	4e2f4b83 	vmulmi.f64	d4, d31, d3
  6c:	d84b4d13 	stmdale	fp, {r0, r1, r4, r8, sl, fp, lr}^
  70:	4b4d13bf 	blmi	1344f74 <__user_program+0x1044f74>
  74:	6513bfd8 	ldrvs	fp, [r3, #-4056]	; 0xfd8
  78:	4b4b674f 	blmi	12d9dbc <__user_program+0xfd9dbc>
  7c:	9f684bbb 	svcls	0x00684bbb
  80:	0006024b 	andeq	r0, r6, fp, asr #4
  84:	00e00101 	rsceq	r0, r0, r1, lsl #2
  88:	00020000 	andeq	r0, r2, r0
  8c:	0000007b 	andeq	r0, r0, fp, ror r0
  90:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
  94:	0101000d 	tsteq	r1, sp
  98:	00000101 	andeq	r0, r0, r1, lsl #2
  9c:	00000100 	andeq	r0, r0, r0, lsl #2
  a0:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
  a4:	2f6c656e 	svccs	0x006c656e
  a8:	00637273 	rsbeq	r7, r3, r3, ror r2
  ac:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
  b0:	2f6b6269 	svccs	0x006b6269
  b4:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
  b8:	00656475 	rsbeq	r6, r5, r5, ror r4
  bc:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
  c0:	692f6c65 	stmdbvs	pc!, {r0, r2, r5, r6, sl, fp, sp, lr}	; <UNPREDICTABLE>
  c4:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
  c8:	00006564 	andeq	r6, r0, r4, ror #10
  cc:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
  d0:	632e6b74 	teqvs	lr, #116, 22	; 0x1d000
  d4:	00000100 	andeq	r0, r0, r0, lsl #2
  d8:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
  dc:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
  e0:	00020068 	andeq	r0, r2, r8, rrx
  e4:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
  e8:	67726164 	ldrbvs	r6, [r2, -r4, ror #2]!
  ec:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
  f0:	623c0000 	eorsvs	r0, ip, #0
  f4:	746c6975 	strbtvc	r6, [ip], #-2421	; 0x975
  f8:	3e6e692d 	cdpcc	9, 6, cr6, cr14, cr13, {1}
  fc:	00000000 	andeq	r0, r0, r0
 100:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 104:	0300682e 	movweq	r6, #2094	; 0x82e
 108:	00000000 	andeq	r0, r0, r0
 10c:	81b40205 			; <UNDEFINED> instruction: 0x81b40205
 110:	20030000 	andcs	r0, r3, r0
 114:	9c4d8801 	mcrrls	8, 0, r8, sp, cr1
 118:	01040200 	mrseq	r0, R12_usr
 11c:	0402004c 	streq	r0, [r2], #-76	; 0x4c
 120:	02003301 	andeq	r3, r0, #67108864	; 0x4000000
 124:	59080104 	stmdbpl	r8, {r2, r8}
 128:	01040200 	mrseq	r0, R12_usr
 12c:	6a4b4dd7 	bvs	12d3890 <__user_program+0xfd3890>
 130:	49872d9b 	stmibmi	r7, {r0, r1, r3, r4, r7, r8, sl, fp, sp}
 134:	03854d69 	orreq	r4, r5, #6720	; 0x1a40
 138:	03514a20 	cmpeq	r1, #32, 20	; 0x20000
 13c:	4b302e5c 	blmi	c0bab4 <__user_program+0x90bab4>
 140:	2c02324b 	sfmcs	f3, 4, [r2], {75}	; 0x4b
 144:	4b4b8315 	blmi	12e0da0 <__user_program+0xfe0da0>
 148:	8367a4a0 	cmnhi	r7, #160, 8	; 0xa0000000
 14c:	33836732 	orrcc	r6, r3, #13107200	; 0xc80000
 150:	83328367 	teqhi	r2, #-1677721599	; 0x9c000001
 154:	678a2d67 	strvs	r2, [sl, r7, ror #26]
 158:	334b324b 	movtcc	r3, #45643	; 0xb24b
 15c:	7fbf034d 	svcvc	0x00bf034d
 160:	00c6032e 	sbceq	r0, r6, lr, lsr #6
 164:	00080266 	andeq	r0, r8, r6, ror #4
 168:	00c70101 	sbceq	r0, r7, r1, lsl #2
 16c:	00020000 	andeq	r0, r2, r0
 170:	00000092 	muleq	r0, r2, r0
 174:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 178:	0101000d 	tsteq	r1, sp
 17c:	00000101 	andeq	r0, r0, r1, lsl #2
 180:	00000100 	andeq	r0, r0, r0, lsl #2
 184:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 188:	2f6c656e 	svccs	0x006c656e
 18c:	00637273 	rsbeq	r7, r3, r3, ror r2
 190:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 194:	692f6c65 	stmdbvs	pc!, {r0, r2, r5, r6, sl, fp, sp, lr}	; <UNPREDICTABLE>
 198:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 19c:	33006564 	movwcc	r6, #1380	; 0x564
 1a0:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 1a4:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 1a8:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 1ac:	00006564 	andeq	r6, r0, r4, ror #10
 1b0:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 1b4:	632e6c65 	teqvs	lr, #25856	; 0x6500
 1b8:	00000100 	andeq	r0, r0, r0, lsl #2
 1bc:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 1c0:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 1c4:	72610000 	rsbvc	r0, r1, #0
 1c8:	00682e6d 	rsbeq	r2, r8, sp, ror #28
 1cc:	74000003 	strvc	r0, [r0], #-3
 1d0:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 1d4:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 1d8:	75730000 	ldrbvc	r0, [r3, #-0]!
 1dc:	76726570 			; <UNDEFINED> instruction: 0x76726570
 1e0:	726f7369 	rsbvc	r7, pc, #-1543503871	; 0xa4000001
 1e4:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 1e8:	79730000 	ldmdbvc	r3!, {}^	; <UNPREDICTABLE>
 1ec:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 1f0:	682e736c 	stmdavs	lr!, {r2, r3, r5, r6, r8, r9, ip, sp, lr}
 1f4:	00000200 	andeq	r0, r0, r0, lsl #4
 1f8:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 1fc:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 200:	00030068 	andeq	r0, r3, r8, rrx
 204:	05000000 	streq	r0, [r0, #-0]
 208:	00844c02 	addeq	r4, r4, r2, lsl #24
 20c:	011f0300 	tsteq	pc, r0, lsl #6
 210:	4b2f2f2f 	blmi	bcbed4 <__user_program+0x8cbed4>
 214:	0200832f 	andeq	r8, r0, #-1140850688	; 0xbc000000
 218:	35310104 	ldrcc	r0, [r1, #-260]!	; 0x104
 21c:	0e036730 	mcreq	7, 0, r6, cr3, cr0, {1}
 220:	5a084b4a 	bpl	212f50 <__end+0xe6f50>
 224:	8468a068 	strbthi	sl, [r8], #-104	; 0x68
 228:	4ba0a068 	blmi	fe8283d0 <__user_program+0xfe5283d0>
 22c:	2f4a0903 	svccs	0x004a0903
 230:	01000202 	tsteq	r0, r2, lsl #4
 234:	00007701 	andeq	r7, r0, r1, lsl #14
 238:	4f000200 	svcmi	0x00000200
 23c:	02000000 	andeq	r0, r0, #0
 240:	0d0efb01 	vstreq	d15, [lr, #-4]
 244:	01010100 	mrseq	r0, (UNDEF: 17)
 248:	00000001 	andeq	r0, r0, r1
 24c:	01000001 	tsteq	r0, r1
 250:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 254:	732f6c65 	teqvc	pc, #25856	; 0x6500
 258:	33006372 	movwcc	r6, #882	; 0x372
 25c:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 260:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 264:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 268:	00006564 	andeq	r6, r0, r4, ror #10
 26c:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 270:	0100632e 	tsteq	r0, lr, lsr #6
 274:	736b0000 	cmnvc	fp, #0
 278:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 27c:	00682e74 	rsbeq	r2, r8, r4, ror lr
 280:	67000002 	strvs	r0, [r0, -r2]
 284:	2e6f6970 	mcrcs	9, 3, r6, cr15, cr0, {3}
 288:	00020068 	andeq	r0, r2, r8, rrx
 28c:	05000000 	streq	r0, [r0, #-0]
 290:	00855002 	addeq	r5, r5, r2
 294:	01240300 	teqeq	r4, r0, lsl #6
 298:	67686730 			; <UNDEFINED> instruction: 0x67686730
 29c:	674b8368 	strbvs	r8, [fp, -r8, ror #6]
 2a0:	136b2f4b 	cmnne	fp, #300	; 0x12c
 2a4:	86be14a2 	ldrthi	r1, [lr], r2, lsr #9
 2a8:	0267be14 	rsbeq	fp, r7, #20, 28	; 0x140
 2ac:	01010004 	tsteq	r1, r4
 2b0:	00000065 	andeq	r0, r0, r5, rrx
 2b4:	00460002 	subeq	r0, r6, r2
 2b8:	01020000 	mrseq	r0, (UNDEF: 2)
 2bc:	000d0efb 	strdeq	r0, [sp], -fp
 2c0:	01010101 	tsteq	r1, r1, lsl #2
 2c4:	01000000 	mrseq	r0, (UNDEF: 0)
 2c8:	6b010000 	blvs	402d0 <__bss_end+0x352d0>
 2cc:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 2d0:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 2d4:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 2d8:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 2dc:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 2e0:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 2e4:	74000065 	strvc	r0, [r0], #-101	; 0x65
 2e8:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 2ec:	0100632e 	tsteq	r0, lr, lsr #6
 2f0:	736b0000 	cmnvc	fp, #0
 2f4:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 2f8:	00682e74 	rsbeq	r2, r8, r4, ror lr
 2fc:	00000002 	andeq	r0, r0, r2
 300:	28020500 	stmdacs	r2, {r8, sl}
 304:	03000086 	movweq	r0, #134	; 0x86
 308:	83140121 	tsthi	r4, #1073741832	; 0x40000008
 30c:	a4136b83 	ldrge	r6, [r3], #-2947	; 0xb83
 310:	13856713 	orrne	r6, r5, #4980736	; 0x4c0000
 314:	01000a02 	tsteq	r0, r2, lsl #20
 318:	0000e901 	andeq	lr, r0, r1, lsl #18
 31c:	77000200 	strvc	r0, [r0, -r0, lsl #4]
 320:	02000000 	andeq	r0, r0, #0
 324:	0d0efb01 	vstreq	d15, [lr, #-4]
 328:	01010100 	mrseq	r0, (UNDEF: 17)
 32c:	00000001 	andeq	r0, r0, r1
 330:	01000001 	tsteq	r0, r1
 334:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 338:	732f6c65 	teqvc	pc, #25856	; 0x6500
 33c:	33006372 	movwcc	r6, #882	; 0x372
 340:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 344:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 348:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 34c:	6b006564 	blvs	198e4 <__bss_end+0xe8e4>
 350:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 354:	6e692f6c 	cdpvs	15, 6, cr2, cr9, cr12, {3}
 358:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 35c:	73000065 	movwvc	r0, #101	; 0x65
 360:	61637379 	smcvs	14137	; 0x3739
 364:	2e736c6c 	cdpcs	12, 7, cr6, cr3, cr12, {3}
 368:	00010063 	andeq	r0, r1, r3, rrx
 36c:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 370:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
 374:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 378:	72700000 	rsbsvc	r0, r0, #0
 37c:	6b746e69 	blvs	1d1bd28 <__user_program+0x1a1bd28>
 380:	0300682e 	movweq	r6, #2094	; 0x82e
 384:	72610000 	rsbvc	r0, r1, #0
 388:	00682e6d 	rsbeq	r2, r8, sp, ror #28
 38c:	75000002 	strvc	r0, [r0, #-2]
 390:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 394:	00030068 	andeq	r0, r3, r8, rrx
 398:	05000000 	streq	r0, [r0, #-0]
 39c:	00869802 	addeq	r9, r6, r2, lsl #16
 3a0:	01130300 	tsteq	r3, r0, lsl #6
 3a4:	0200674b 	andeq	r6, r0, #19660800	; 0x12c0000
 3a8:	332f0104 	teqcc	pc, #4, 2
 3ac:	04020013 	streq	r0, [r2], #-19
 3b0:	02004901 	andeq	r4, r0, #16384	; 0x4000
 3b4:	004f0104 	subeq	r0, pc, r4, lsl #2
 3b8:	83030402 	movwhi	r0, #13314	; 0x3402
 3bc:	03040200 	movweq	r0, #16896	; 0x4200
 3c0:	06660649 	strbteq	r0, [r6], -r9, asr #12
 3c4:	4a7a0331 	bmi	1e81090 <__user_program+0x1b81090>
 3c8:	134a1103 	movtne	r1, #41219	; 0xa103
 3cc:	2fa53349 	svccs	0x00a53349
 3d0:	4b2e7903 	blmi	b9e7e4 <__user_program+0x89e7e4>
 3d4:	4b4b684d 	blmi	12da510 <__user_program+0xfda510>
 3d8:	4b674c4b 	blmi	19d350c <__user_program+0x16d350c>
 3dc:	2f2f4d2f 	svccs	0x002f4d2f
 3e0:	032e6c03 	teqeq	lr, #768	; 0x300
 3e4:	66038217 			; <UNDEFINED> instruction: 0x66038217
 3e8:	2e1b034a 	cdpcs	3, 1, cr0, cr11, cr10, {2}
 3ec:	144c1468 	strbne	r1, [ip], #-1128	; 0x468
 3f0:	a1841750 	orrge	r1, r4, r0, asr r7
 3f4:	29678867 	stmdbcs	r7!, {r0, r1, r2, r5, r6, fp, pc}^
 3f8:	4c143034 	ldcmi	0, cr3, [r4], {52}	; 0x34
 3fc:	4c144c14 	ldcmi	12, cr4, [r4], {20}
 400:	00040214 	andeq	r0, r4, r4, lsl r2
 404:	005d0101 	subseq	r0, sp, r1, lsl #2
 408:	00020000 	andeq	r0, r2, r0
 40c:	00000046 	andeq	r0, r0, r6, asr #32
 410:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 414:	0101000d 	tsteq	r1, sp
 418:	00000101 	andeq	r0, r0, r1, lsl #2
 41c:	00000100 	andeq	r0, r0, r0, lsl #2
 420:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 424:	2f6c656e 	svccs	0x006c656e
 428:	00637273 	rsbeq	r7, r3, r3, ror r2
 42c:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 430:	2f6b6269 	svccs	0x006b6269
 434:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 438:	00656475 	rsbeq	r6, r5, r5, ror r4
 43c:	72657300 	rsbvc	r7, r5, #0, 6
 440:	632e6f76 	teqvs	lr, #472	; 0x1d8
 444:	00000100 	andeq	r0, r0, r0, lsl #2
 448:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 44c:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 450:	00020068 	andeq	r0, r2, r8, rrx
 454:	05000000 	streq	r0, [r0, #-0]
 458:	00883c02 	addeq	r3, r8, r2, lsl #24
 45c:	010c0300 	mrseq	r0, LR_mon
 460:	02023232 	andeq	r3, r2, #536870915	; 0x20000003
 464:	54010100 	strpl	r0, [r1], #-256	; 0x100
 468:	02000000 	andeq	r0, r0, #0
 46c:	00002900 	andeq	r2, r0, r0, lsl #18
 470:	fb010200 	blx	40c7a <__bss_end+0x35c7a>
 474:	01000d0e 	tsteq	r0, lr, lsl #26
 478:	00010101 	andeq	r0, r1, r1, lsl #2
 47c:	00010000 	andeq	r0, r1, r0
 480:	34330100 	ldrtcc	r0, [r3], #-256	; 0x100
 484:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 488:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
 48c:	62000063 	andvs	r0, r0, #99	; 0x63
 490:	2e746f6f 	cdpcs	15, 7, cr6, cr4, cr15, {3}
 494:	00010053 	andeq	r0, r1, r3, asr r0
 498:	05000000 	streq	r0, [r0, #-0]
 49c:	00800002 	addeq	r0, r0, r2
 4a0:	011b0300 	tsteq	fp, r0, lsl #6
 4a4:	302f2f2f 	eorcc	r2, pc, pc, lsr #30
 4a8:	2f2f2f2f 	svccs	0x002f2f2f
 4ac:	2f312f2f 	svccs	0x00312f2f
 4b0:	2f33312f 	svccs	0x0033312f
 4b4:	312e6903 	teqcc	lr, r3, lsl #18
 4b8:	02022f2f 	andeq	r2, r2, #47, 30	; 0xbc
 4bc:	4d010100 	stfmis	f0, [r1, #-0]
 4c0:	02000000 	andeq	r0, r0, #0
 4c4:	00002800 	andeq	r2, r0, r0, lsl #16
 4c8:	fb010200 	blx	40cd2 <__bss_end+0x35cd2>
 4cc:	01000d0e 	tsteq	r0, lr, lsl #26
 4d0:	00010101 	andeq	r0, r1, r1, lsl #2
 4d4:	00010000 	andeq	r0, r1, r0
 4d8:	34330100 	ldrtcc	r0, [r3], #-256	; 0x100
 4dc:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 4e0:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
 4e4:	61000063 	tstvs	r0, r3, rrx
 4e8:	532e6d72 	teqpl	lr, #7296	; 0x1c80
 4ec:	00000100 	andeq	r0, r0, r0, lsl #2
 4f0:	02050000 	andeq	r0, r5, #0
 4f4:	00008848 	andeq	r8, r0, r8, asr #16
 4f8:	2f011003 	svccs	0x00011003
 4fc:	332f332f 	teqcc	pc, #-1140850688	; 0xbc000000
 500:	2f2f332f 	svccs	0x002f332f
 504:	2f332f2f 	svccs	0x00332f2f
 508:	022f2f2f 	eoreq	r2, pc, #47, 30	; 0xbc
 50c:	01010002 	tsteq	r1, r2
 510:	0000007c 	andeq	r0, r0, ip, ror r0
 514:	002e0002 	eoreq	r0, lr, r2
 518:	01020000 	mrseq	r0, (UNDEF: 2)
 51c:	000d0efb 	strdeq	r0, [sp], -fp
 520:	01010101 	tsteq	r1, r1, lsl #2
 524:	01000000 	mrseq	r0, (UNDEF: 0)
 528:	6b010000 	blvs	40530 <__bss_end+0x35530>
 52c:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 530:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 534:	73000063 	movwvc	r0, #99	; 0x63
 538:	72657075 	rsbvc	r7, r5, #117	; 0x75
 53c:	6f736976 	svcvs	0x00736976
 540:	00532e72 	subseq	r2, r3, r2, ror lr
 544:	00000001 	andeq	r0, r0, r1
 548:	8c020500 	cfstr32hi	mvfx0, [r2], {-0}
 54c:	03000088 	movweq	r0, #136	; 0x88
 550:	2f2f0115 	svccs	0x002f0115
 554:	2f2f2f2f 	svccs	0x002f2f2f
 558:	f216032f 	vcgt.s16	d0, d6, d31
 55c:	2f2f2f2f 	svccs	0x002f2f2f
 560:	0a03302f 	beq	cc624 <__bss_end+0xc1624>
 564:	2f2f2f2e 	svccs	0x002f2f2e
 568:	2f2f2f2f 	svccs	0x002f2f2f
 56c:	2f2f2f2f 	svccs	0x002f2f2f
 570:	30312f2f 	eorscc	r2, r1, pc, lsr #30
 574:	332f2f2f 	teqcc	pc, #47, 30	; 0xbc
 578:	31313136 	teqcc	r1, r6, lsr r1
 57c:	2f2f2f36 	svccs	0x002f2f36
 580:	2e7fb903 	cdpcs	9, 7, cr11, cr15, cr3, {0}
 584:	032e2103 	teqeq	lr, #-1073741824	; 0xc0000000
 588:	022f2e25 	eoreq	r2, pc, #592	; 0x250
 58c:	01010002 	tsteq	r1, r2

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
   4:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
   8:	6e692067 	cdpvs	0, 6, cr2, cr9, cr7, {3}
   c:	70670074 	rsbvc	r0, r7, r4, ror r0
  10:	735f6f69 	cmpvc	pc, #420	; 0x1a4
  14:	705f7465 	subsvc	r7, pc, r5, ror #8
  18:	006c6c75 	rsbeq	r6, ip, r5, ror ip
  1c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; ffffff68 <__user_program+0xffcfff68>
  20:	63652f65 	cmnvs	r5, #404	; 0x194
  24:	39343365 	ldmdbcc	r4!, {r0, r2, r5, r6, r8, r9, ip, sp}
  28:	3934332f 	ldmdbcc	r4!, {r0, r1, r2, r3, r5, r8, r9, ip, sp}
  2c:	62616c2f 	rsbvs	r6, r1, #12032	; 0x2f00
  30:	31662f32 	cmncc	r6, r2, lsr pc
  34:	616c2d37 	cmnvs	ip, r7, lsr sp
  38:	642d3262 	strtvs	r3, [sp], #-610	; 0x262
  3c:	64697661 	strbtvs	r7, [r9], #-1633	; 0x661
  40:	39327579 	ldmdbcc	r2!, {r0, r3, r4, r5, r6, r8, sl, ip, sp, lr}
  44:	646f632f 	strbtvs	r6, [pc], #-815	; 4c <__start-0x7fb4>
  48:	70670065 	rsbvc	r0, r7, r5, rrx
  4c:	735f6f69 	cmpvc	pc, #420	; 0x1a4
  50:	6c007465 	cfstrsvs	mvf7, [r0], {101}	; 0x65
  54:	20676e6f 	rsbcs	r6, r7, pc, ror #28
  58:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
  5c:	736e7520 	cmnvc	lr, #32, 10	; 0x8000000
  60:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0x769
  64:	6e692064 	cdpvs	0, 6, cr2, cr9, cr4, {3}
  68:	70670074 	rsbvc	r0, r7, r4, ror r0
  6c:	635f6f69 	cmpvs	pc, #420	; 0x1a4
  70:	4700726c 	strmi	r7, [r0, -ip, ror #4]
  74:	4320554e 	teqmi	r0, #327155712	; 0x13800000
  78:	392e3420 	stmdbcc	lr!, {r5, sl, ip, sp}
  7c:	3220332e 	eorcc	r3, r0, #-1207959552	; 0xb8000000
  80:	30353130 	eorscc	r3, r5, r0, lsr r1
  84:	20393235 	eorscs	r3, r9, r5, lsr r2
  88:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  8c:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0x165
  90:	415b2029 	cmpmi	fp, r9, lsr #32
  94:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff34a <__user_program+0xffcff34a>
  98:	6465626d 	strbtvs	r6, [r5], #-621	; 0x26d
  9c:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
  a0:	2d395f34 	ldccs	15, cr5, [r9, #-208]!	; 0xffffff30
  a4:	6e617262 	cdpvs	2, 6, cr7, cr1, cr2, {3}
  a8:	72206863 	eorvc	r6, r0, #6488064	; 0x630000
  ac:	73697665 	cmnvc	r9, #105906176	; 0x6500000
  b0:	206e6f69 	rsbcs	r6, lr, r9, ror #30
  b4:	32343232 	eorscc	r3, r4, #536870915	; 0x20000003
  b8:	205d3838 	subscs	r3, sp, r8, lsr r8
  bc:	6c666d2d 	stclvs	13, cr6, [r6], #-180	; 0xffffff4c
  c0:	2d74616f 	ldfcse	f6, [r4, #-444]!	; 0xfffffe44
  c4:	3d696261 	sfmcc	f6, 2, [r9, #-388]!	; 0xfffffe7c
  c8:	74666f73 	strbtvc	r6, [r6], #-3955	; 0xf73
  cc:	616d2d20 	cmnvs	sp, r0, lsr #26
  d0:	3d686372 	stclcc	3, cr6, [r8, #-456]!	; 0xfffffe38
  d4:	766d7261 	strbtvc	r7, [sp], -r1, ror #4
  d8:	20612d37 	rsbcs	r2, r1, r7, lsr sp
  dc:	2d20672d 	stccs	7, cr6, [r0, #-180]!	; 0xffffff4c
  e0:	2d20314f 	stfcss	f3, [r0, #-316]!	; 0xfffffec4
  e4:	65726666 	ldrbvs	r6, [r2, #-1638]!	; 0x666
  e8:	61747365 	cmnvs	r4, r5, ror #6
  ec:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
  f0:	69750067 	ldmdbvs	r5!, {r0, r1, r2, r5, r6}^
  f4:	5f38746e 	svcpl	0x0038746e
  f8:	6e750074 	mrcvs	0, 3, r0, cr5, cr4, {3}
  fc:	6e676973 	mcrvs	9, 3, r6, cr7, cr3, {3}
 100:	63206465 	teqvs	r0, #1694498816	; 0x65000000
 104:	00726168 	rsbseq	r6, r2, r8, ror #2
 108:	746e6975 	strbtvc	r6, [lr], #-2421	; 0x975
 10c:	745f3233 	ldrbvc	r3, [pc], #-563	; 114 <__start-0x7eec>
 110:	6c656400 	cfstrdvs	mvd6, [r5], #-0
 114:	635f7961 	cmpvs	pc, #1589248	; 0x184000
 118:	656c6379 	strbvs	r6, [ip, #-889]!	; 0x379
 11c:	68730073 	ldmdavs	r3!, {r0, r1, r4, r5, r6}^
 120:	2074726f 	rsbscs	r7, r4, pc, ror #4
 124:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
 128:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xe67
 12c:	746e6920 	strbtvc	r6, [lr], #-2336	; 0x920
 130:	61747300 	cmnvs	r4, r0, lsl #6
 134:	67006574 	smlsdxvs	r0, r4, r5, r6
 138:	5f6f6970 	svcpl	0x006f6970
 13c:	666e6f63 	strbtvs	r6, [lr], -r3, ror #30
 140:	73006769 	movwvc	r6, #1897	; 0x769
 144:	74726f68 	ldrbtvc	r6, [r2], #-3944	; 0xf68
 148:	746e6920 	strbtvc	r6, [lr], #-2336	; 0x920
 14c:	66666f00 	strbtvs	r6, [r6], -r0, lsl #30
 150:	00746573 	rsbseq	r6, r4, r3, ror r5
 154:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 158:	2f6b6269 	svccs	0x006b6269
 15c:	2f637273 	svccs	0x00637273
 160:	6f697067 	svcvs	0x00697067
 164:	6700632e 	strvs	r6, [r0, -lr, lsr #6]
 168:	006f6970 	rsbeq	r6, pc, r0, ror r9	; <UNPREDICTABLE>
 16c:	746e6975 	strbtvc	r6, [lr], #-2421	; 0x975
 170:	745f3436 	ldrbvc	r3, [pc], #-1078	; 178 <__start-0x7e88>
 174:	72656b00 	rsbvc	r6, r5, #0, 22
 178:	2f6c656e 	svccs	0x006c656e
 17c:	2f637273 	svccs	0x00637273
 180:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 184:	632e6b74 	teqvs	lr, #116, 22	; 0x1d000
 188:	765f5f00 	ldrbvc	r5, [pc], -r0, lsl #30
 18c:	696c5f61 	stmdbvs	ip!, {r0, r5, r6, r8, r9, sl, fp, ip, lr}^
 190:	75007473 	strvc	r7, [r0, #-1139]	; 0x473
 194:	5f747261 	svcpl	0x00747261
 198:	5f747570 	svcpl	0x00747570
 19c:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0x962
 1a0:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 1a4:	756e746e 	strbvc	r7, [lr, #-1134]!	; 0x46e
 1a8:	64006b6d 	strvs	r6, [r0], #-2925	; 0xb6d
 1ac:	74696769 	strbtvc	r6, [r9], #-1897	; 0x769
 1b0:	72700073 	rsbsvc	r0, r0, #115	; 0x73
 1b4:	78696665 	stmdavc	r9!, {r0, r2, r5, r6, r9, sl, sp, lr}^
 1b8:	73616200 	cmnvc	r1, #0, 4
 1bc:	72700065 	rsbsvc	r0, r0, #101	; 0x65
 1c0:	6b746e69 	blvs	1d1bb6c <__user_program+0x1a1bb6c>
 1c4:	74796200 	ldrbtvc	r6, [r9], #-512	; 0x200
 1c8:	74705f65 	ldrbtvc	r5, [r0], #-3941	; 0xf65
 1cc:	72610072 	rsbvc	r0, r1, #114	; 0x72
 1d0:	73007367 	movwvc	r7, #871	; 0x367
 1d4:	74657a69 	strbtvc	r7, [r5], #-2665	; 0xa69
 1d8:	00657079 	rsbeq	r7, r5, r9, ror r0
 1dc:	70615f5f 	rsbvc	r5, r1, pc, asr pc
 1e0:	73797300 	cmnvc	r9, #0, 6
 1e4:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 1e8:	6f6c635f 	svcvs	0x006c635f
 1ec:	65006573 	strvs	r6, [r0, #-1395]	; 0x573
 1f0:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
 1f4:	6e695f65 	cdpvs	15, 6, cr5, cr9, cr5, {3}
 1f8:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
 1fc:	73747075 	cmnvc	r4, #117	; 0x75
 200:	72656b00 	rsbvc	r6, r5, #0, 22
 204:	2f6c656e 	svccs	0x006c656e
 208:	2f637273 	svccs	0x00637273
 20c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 210:	632e6c65 	teqvs	lr, #25856	; 0x6500
 214:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 218:	635f7265 	cmpvs	pc, #1342177286	; 0x50000006
 21c:	7261656c 	rsbvc	r6, r1, #108, 10	; 0x1b000000
 220:	6e65705f 	mcrvs	0, 3, r7, cr5, cr15, {2}
 224:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
 228:	73797300 	cmnvc	r9, #0, 6
 22c:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 230:	6165725f 	cmnvs	r5, pc, asr r2
 234:	77730064 	ldrbvc	r0, [r3, -r4, rrx]!
 238:	756e5f69 	strbvc	r5, [lr, #-3945]!	; 0xf69
 23c:	7773006d 	ldrbvc	r0, [r3, -sp, rrx]!
 240:	5f635f69 	svcpl	0x00635f69
 244:	646e6168 	strbtvs	r6, [lr], #-360	; 0x168
 248:	0072656c 	rsbseq	r6, r2, ip, ror #10
 24c:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 250:	5f6c6c61 	svcpl	0x006c6c61
 254:	74697865 	strbtvc	r7, [r9], #-2149	; 0x865
 258:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 25c:	735f7265 	cmpvc	pc, #1342177286	; 0x50000006
 260:	74726174 	ldrbtvc	r6, [r2], #-372	; 0x174
 264:	71726900 	cmnvc	r2, r0, lsl #18
 268:	685f635f 	ldmdavs	pc, {r0, r1, r2, r3, r4, r6, r8, r9, sp, lr}^	; <UNPREDICTABLE>
 26c:	6c646e61 	stclvs	14, cr6, [r4], #-388	; 0xfffffe7c
 270:	65007265 	strvs	r7, [r0, #-613]	; 0x265
 274:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 278:	6573755f 	ldrbvs	r7, [r3, #-1375]!	; 0x55f
 27c:	6f6d5f72 	svcvs	0x006d5f72
 280:	75006564 	strvc	r6, [r0, #-1380]	; 0x564
 284:	5f747261 	svcpl	0x00747261
 288:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 28c:	73797300 	cmnvc	r9, #0, 6
 290:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 294:	7473665f 	ldrbtvc	r6, [r3], #-1631	; 0x65f
 298:	69007461 	stmdbvs	r0, {r0, r5, r6, sl, ip, sp, lr}
 29c:	6174736e 	cmnvs	r4, lr, ror #6
 2a0:	695f6c6c 	ldmdbvs	pc, {r2, r3, r5, r6, sl, fp, sp, lr}^	; <UNPREDICTABLE>
 2a4:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 2a8:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0x572
 2ac:	6261745f 	rsbvs	r7, r1, #1593835520	; 0x5f000000
 2b0:	7300656c 	movwvc	r6, #1388	; 0x56c
 2b4:	61637379 	smcvs	14137	; 0x3739
 2b8:	695f6c6c 	ldmdbvs	pc, {r2, r3, r5, r6, sl, fp, sp, lr}^	; <UNPREDICTABLE>
 2bc:	74746173 	ldrbtvc	r6, [r4], #-371	; 0x173
 2c0:	656b0079 	strbvs	r0, [fp, #-121]!	; 0x79
 2c4:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 2c8:	69616d5f 	stmdbvs	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
 2cc:	7973006e 	ldmdbvc	r3!, {r1, r2, r3, r5, r6}^
 2d0:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 2d4:	72775f6c 	rsbsvc	r5, r7, #108, 30	; 0x1b0
 2d8:	00657469 	rsbeq	r7, r5, r9, ror #8
 2dc:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 2e0:	5f6c6c61 	svcpl	0x006c6c61
 2e4:	6b726273 	blvs	1c98cb8 <__user_program+0x1998cb8>
 2e8:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 2ec:	695f7265 	ldmdbvs	pc, {r0, r2, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
 2f0:	65705f73 	ldrbvs	r5, [r0, #-3955]!	; 0xf73
 2f4:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 2f8:	79730067 	ldmdbvc	r3!, {r0, r1, r2, r5, r6}^
 2fc:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
 300:	736c5f6c 	cmnvc	ip, #108, 30	; 0x1b0
 304:	006b6565 	rsbeq	r6, fp, r5, ror #10
 308:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 30c:	7465675f 	strbtvc	r6, [r5], #-1887	; 0x75f
 310:	7479625f 	ldrbtvc	r6, [r9], #-607	; 0x25f
 314:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 318:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 31c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 320:	7261752f 	rsbvc	r7, r1, #197132288	; 0xbc00000
 324:	00632e74 	rsbeq	r2, r3, r4, ror lr
 328:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 32c:	6f6c635f 	svcvs	0x006c635f
 330:	6b006573 	blvs	19904 <__bss_end+0xe904>
 334:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 338:	72732f6c 	rsbsvc	r2, r3, #108, 30	; 0x1b0
 33c:	69742f63 	ldmdbvs	r4!, {r0, r1, r5, r6, r8, r9, sl, fp, sp}^
 340:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
 344:	72660063 	rsbvc	r0, r6, #99	; 0x63
 348:	74007165 	strvc	r7, [r0], #-357	; 0x165
 34c:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 350:	6f74735f 	svcvs	0x0074735f
 354:	656b0070 	strbvs	r0, [fp, #-112]!	; 0x70
 358:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 35c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 360:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 364:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 368:	00632e73 	rsbeq	r2, r3, r3, ror lr
 36c:	72636e69 	rsbvc	r6, r3, #1680	; 0x690
 370:	61686300 	cmnvs	r8, r0, lsl #6
 374:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
 378:	756f6300 	strbvc	r6, [pc, #-768]!	; 80 <__start-0x7f80>
 37c:	5f00746e 	svcpl	0x0000746e
 380:	6165685f 	cmnvs	r5, pc, asr r8
 384:	6f6c5f70 	svcvs	0x006c5f70
 388:	5f5f0077 	svcpl	0x005f0077
 38c:	70616568 	rsbvc	r6, r1, r8, ror #10
 390:	706f745f 	rsbvc	r7, pc, pc, asr r4	; <UNPREDICTABLE>
 394:	61747300 	cmnvs	r4, r0, lsl #6
 398:	00737574 	rsbseq	r7, r3, r4, ror r5
 39c:	61736964 	cmnvs	r3, r4, ror #18
 3a0:	5f656c62 	svcpl	0x00656c62
 3a4:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xe69
 3a8:	70757272 	rsbsvc	r7, r5, r2, ror r2
 3ac:	65007374 	strvs	r7, [r0, #-884]	; 0x374
 3b0:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
 3b4:	61006465 	tstvs	r0, r5, ror #8
 3b8:	656c676e 	strbvs	r6, [ip, #-1902]!	; 0x76e
 3bc:	6c696600 	stclvs	6, cr6, [r9], #-0
 3c0:	72700065 	rsbsvc	r0, r0, #101	; 0x65
 3c4:	685f7665 	ldmdavs	pc, {r0, r2, r5, r6, r9, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 3c8:	5f706165 	svcpl	0x00706165
 3cc:	00646e65 	rsbeq	r6, r4, r5, ror #28
 3d0:	63737973 	cmnvs	r3, #1884160	; 0x1cc000
 3d4:	5f6c6c61 	svcpl	0x006c6c61
 3d8:	76726573 			; <UNDEFINED> instruction: 0x76726573
 3dc:	6e655f6f 	cdpvs	15, 6, cr5, cr5, cr15, {3}
 3e0:	656c6261 	strbvs	r6, [ip, #-609]!	; 0x261
 3e4:	73797300 	cmnvc	r9, #0, 6
 3e8:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 3ec:	7265735f 	rsbvc	r7, r5, #2080374785	; 0x7c000001
 3f0:	735f6f76 	cmpvc	pc, #472	; 0x1d8
 3f4:	73007465 	movwvc	r7, #1125	; 0x465
 3f8:	6f767265 	svcvs	0x00767265
 3fc:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 400:	656b0074 	strbvs	r0, [fp, #-116]!	; 0x74
 404:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 408:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 40c:	7265732f 	rsbvc	r7, r5, #-1140850688	; 0xbc000000
 410:	632e6f76 	teqvs	lr, #472	; 0x1d8
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <__user_program+0xdd0d24>
   4:	4e472820 	cdpmi	8, 4, cr2, cr7, cr0, {1}
   8:	6f542055 	svcvs	0x00542055
   c:	20736c6f 	rsbscs	r6, r3, pc, ror #24
  10:	20726f66 	rsbscs	r6, r2, r6, ror #30
  14:	204d5241 	subcs	r5, sp, r1, asr #4
  18:	65626d45 	strbvs	r6, [r2, #-3397]!	; 0xd45
  1c:	64656464 	strbtvs	r6, [r5], #-1124	; 0x464
  20:	6f725020 	svcvs	0x00725020
  24:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
  28:	2973726f 	ldmdbcs	r3!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}^
  2c:	392e3420 	stmdbcc	lr!, {r5, sl, ip, sp}
  30:	3220332e 	eorcc	r3, r0, #-1207959552	; 0xb8000000
  34:	30353130 	eorscc	r3, r5, r0, lsr r1
  38:	20393235 	eorscs	r3, r9, r5, lsr r2
  3c:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  40:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0x165
  44:	415b2029 	cmpmi	fp, r9, lsr #32
  48:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff2fe <__user_program+0xffcff2fe>
  4c:	6465626d 	strbtvs	r6, [r5], #-621	; 0x26d
  50:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
  54:	2d395f34 	ldccs	15, cr5, [r9, #-208]!	; 0xffffff30
  58:	6e617262 	cdpvs	2, 6, cr7, cr1, cr2, {3}
  5c:	72206863 	eorvc	r6, r0, #6488064	; 0x630000
  60:	73697665 	cmnvc	r9, #105906176	; 0x6500000
  64:	206e6f69 	rsbcs	r6, lr, r9, ror #30
  68:	32343232 	eorscc	r3, r4, #536870915	; 0x20000003
  6c:	005d3838 	subseq	r3, sp, r8, lsr r8

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002c41 	andeq	r2, r0, r1, asr #24
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000022 	andeq	r0, r0, r2, lsr #32
  10:	412d3705 	teqmi	sp, r5, lsl #14
  14:	070a0600 	streq	r0, [sl, -r0, lsl #12]
  18:	09010841 	stmdbeq	r1, {r0, r6, fp}
  1c:	14041202 	strne	r1, [r4], #-514	; 0x202
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end+0x3b038>
  28:	22011e01 	andcs	r1, r1, #1, 28
  2c:	Address 0x0000002c is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	0000000c 	andeq	r0, r0, ip
  14:	00000000 	andeq	r0, r0, r0
  18:	00008054 	andeq	r8, r0, r4, asr r0
  1c:	00000054 	andeq	r0, r0, r4, asr r0
  20:	0000000c 	andeq	r0, r0, ip
  24:	00000000 	andeq	r0, r0, r0
  28:	000080a8 	andeq	r8, r0, r8, lsr #1
  2c:	00000044 	andeq	r0, r0, r4, asr #32
  30:	0000000c 	andeq	r0, r0, ip
  34:	00000000 	andeq	r0, r0, r0
  38:	000080ec 	andeq	r8, r0, ip, ror #1
  3c:	00000044 	andeq	r0, r0, r4, asr #32
  40:	00000018 	andeq	r0, r0, r8, lsl r0
  44:	00000000 	andeq	r0, r0, r0
  48:	00008130 	andeq	r8, r0, r0, lsr r1
  4c:	00000084 	andeq	r0, r0, r4, lsl #1
  50:	83100e48 	tsthi	r0, #72, 28	; 0x480
  54:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
  58:	00018e02 	andeq	r8, r1, r2, lsl #28
  5c:	0000000c 	andeq	r0, r0, ip
  60:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  64:	7c020001 	stcvc	0, cr0, [r2], {1}
  68:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  6c:	00000028 	andeq	r0, r0, r8, lsr #32
  70:	0000005c 	andeq	r0, r0, ip, asr r0
  74:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
  78:	000000e0 	andeq	r0, r0, r0, ror #1
  7c:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
  80:	86078508 	strhi	r8, [r7], -r8, lsl #10
  84:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
  88:	8a038904 	bhi	e24a0 <__bss_end+0xd74a0>
  8c:	42018e02 	andmi	r8, r1, #2, 28
  90:	6a02280e 	bvs	8a0d0 <__bss_end+0x7f0d0>
  94:	0000200e 	andeq	r2, r0, lr
  98:	00000040 	andeq	r0, r0, r0, asr #32
  9c:	0000005c 	andeq	r0, r0, ip, asr r0
  a0:	00008294 	muleq	r0, r4, r2
  a4:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
  a8:	80100e42 	andshi	r0, r0, r2, asr #28
  ac:	82038104 	andhi	r8, r3, #4, 2
  b0:	42018302 	andmi	r8, r1, #134217728	; 0x8000000
  b4:	0a84280e 	beq	fe10a0f4 <__user_program+0xfde0a0f4>
  b8:	08860985 	stmeq	r6, {r0, r2, r7, r8, fp}
  bc:	06880787 	streq	r0, [r8], r7, lsl #15
  c0:	0e42058e 	cdpeq	5, 4, cr0, cr2, cr14, {4}
  c4:	0ed00230 	mrceq	2, 6, r0, cr0, cr0, {1}
  c8:	c8ce4228 	stmiagt	lr, {r3, r5, r9, lr}^
  cc:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
  d0:	c342100e 	movtgt	r1, #8206	; 0x200e
  d4:	0ec0c1c2 	acseqdm	f4, f2
  d8:	00000000 	andeq	r0, r0, r0
  dc:	0000000c 	andeq	r0, r0, ip
  e0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  e4:	7c020001 	stcvc	0, cr0, [r2], {1}
  e8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  ec:	00000014 	andeq	r0, r0, r4, lsl r0
  f0:	000000dc 	ldrdeq	r0, [r0], -ip
  f4:	0000844c 	andeq	r8, r0, ip, asr #8
  f8:	00000030 	andeq	r0, r0, r0, lsr r0
  fc:	83080e42 	movwhi	r0, #36418	; 0x8e42
 100:	00018e02 	andeq	r8, r1, r2, lsl #28
 104:	00000014 	andeq	r0, r0, r4, lsl r0
 108:	000000dc 	ldrdeq	r0, [r0], -ip
 10c:	0000847c 	andeq	r8, r0, ip, ror r4
 110:	00000018 	andeq	r0, r0, r8, lsl r0
 114:	83080e42 	movwhi	r0, #36418	; 0x8e42
 118:	00018e02 	andeq	r8, r1, r2, lsl #28
 11c:	00000014 	andeq	r0, r0, r4, lsl r0
 120:	000000dc 	ldrdeq	r0, [r0], -ip
 124:	00008494 	muleq	r0, r4, r4
 128:	000000bc 	strheq	r0, [r0], -ip
 12c:	83080e42 	movwhi	r0, #36418	; 0x8e42
 130:	00018e02 	andeq	r8, r1, r2, lsl #28
 134:	0000000c 	andeq	r0, r0, ip
 138:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 13c:	7c020001 	stcvc	0, cr0, [r2], {1}
 140:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 144:	00000014 	andeq	r0, r0, r4, lsl r0
 148:	00000134 	andeq	r0, r0, r4, lsr r1
 14c:	00008550 	andeq	r8, r0, r0, asr r5
 150:	00000070 	andeq	r0, r0, r0, ror r0
 154:	83080e42 	movwhi	r0, #36418	; 0x8e42
 158:	00018e02 	andeq	r8, r1, r2, lsl #28
 15c:	0000000c 	andeq	r0, r0, ip
 160:	00000134 	andeq	r0, r0, r4, lsr r1
 164:	000085c0 	andeq	r8, r0, r0, asr #11
 168:	00000014 	andeq	r0, r0, r4, lsl r0
 16c:	0000000c 	andeq	r0, r0, ip
 170:	00000134 	andeq	r0, r0, r4, lsr r1
 174:	000085d4 	ldrdeq	r8, [r0], -r4
 178:	00000028 	andeq	r0, r0, r8, lsr #32
 17c:	0000000c 	andeq	r0, r0, ip
 180:	00000134 	andeq	r0, r0, r4, lsr r1
 184:	000085fc 	strdeq	r8, [r0], -ip
 188:	0000002c 	andeq	r0, r0, ip, lsr #32
 18c:	0000000c 	andeq	r0, r0, ip
 190:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 194:	7c020001 	stcvc	0, cr0, [r2], {1}
 198:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 19c:	0000000c 	andeq	r0, r0, ip
 1a0:	0000018c 	andeq	r0, r0, ip, lsl #3
 1a4:	00008628 	andeq	r8, r0, r8, lsr #12
 1a8:	0000002c 	andeq	r0, r0, ip, lsr #32
 1ac:	0000000c 	andeq	r0, r0, ip
 1b0:	0000018c 	andeq	r0, r0, ip, lsl #3
 1b4:	00008654 	andeq	r8, r0, r4, asr r6
 1b8:	00000014 	andeq	r0, r0, r4, lsl r0
 1bc:	0000000c 	andeq	r0, r0, ip
 1c0:	0000018c 	andeq	r0, r0, ip, lsl #3
 1c4:	00008668 	andeq	r8, r0, r8, ror #12
 1c8:	0000001c 	andeq	r0, r0, ip, lsl r0
 1cc:	0000000c 	andeq	r0, r0, ip
 1d0:	0000018c 	andeq	r0, r0, ip, lsl #3
 1d4:	00008684 	andeq	r8, r0, r4, lsl #13
 1d8:	00000014 	andeq	r0, r0, r4, lsl r0
 1dc:	0000000c 	andeq	r0, r0, ip
 1e0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1e4:	7c020001 	stcvc	0, cr0, [r2], {1}
 1e8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1ec:	00000014 	andeq	r0, r0, r4, lsl r0
 1f0:	000001dc 	ldrdeq	r0, [r0], -ip
 1f4:	00008698 	muleq	r0, r8, r6
 1f8:	0000001c 	andeq	r0, r0, ip, lsl r0
 1fc:	83080e42 	movwhi	r0, #36418	; 0x8e42
 200:	00018e02 	andeq	r8, r1, r2, lsl #28
 204:	00000020 	andeq	r0, r0, r0, lsr #32
 208:	000001dc 	ldrdeq	r0, [r0], -ip
 20c:	000086b4 			; <UNDEFINED> instruction: 0x000086b4
 210:	00000048 	andeq	r0, r0, r8, asr #32
 214:	84100e46 	ldrhi	r0, [r0], #-3654	; 0xe46
 218:	86038504 	strhi	r8, [r3], -r4, lsl #10
 21c:	5a018e02 	bpl	63a2c <__bss_end+0x58a2c>
 220:	c5c4000e 	strbgt	r0, [r4, #14]
 224:	0000cec6 	andeq	ip, r0, r6, asr #29
 228:	00000040 	andeq	r0, r0, r0, asr #32
 22c:	000001dc 	ldrdeq	r0, [r0], -ip
 230:	000086fc 	strdeq	r8, [r0], -ip
 234:	000000b8 	strheq	r0, [r0], -r8
 238:	83200e46 	teqhi	r0, #1120	; 0x460
 23c:	85078408 	strhi	r8, [r7, #-1032]	; 0x408
 240:	87058606 	strhi	r8, [r5, -r6, lsl #12]
 244:	89038804 	stmdbhi	r3, {r2, fp, pc}
 248:	02018e02 	andeq	r8, r1, #2, 28
 24c:	c3000e4e 	movwgt	r0, #3662	; 0xe4e
 250:	c7c6c5c4 	strbgt	ip, [r6, r4, asr #11]
 254:	44cec9c8 	strbmi	ip, [lr], #2504	; 0x9c8
 258:	0883200e 	stmeq	r3, {r1, r2, r3, sp}
 25c:	06850784 	streq	r0, [r5], r4, lsl #15
 260:	04870586 	streq	r0, [r7], #1414	; 0x586
 264:	02890388 	addeq	r0, r9, #136, 6	; 0x20000002
 268:	0000018e 	andeq	r0, r0, lr, lsl #3
 26c:	0000000c 	andeq	r0, r0, ip
 270:	000001dc 	ldrdeq	r0, [r0], -ip
 274:	000087b4 			; <UNDEFINED> instruction: 0x000087b4
 278:	00000008 	andeq	r0, r0, r8
 27c:	0000000c 	andeq	r0, r0, ip
 280:	000001dc 	ldrdeq	r0, [r0], -ip
 284:	000087bc 			; <UNDEFINED> instruction: 0x000087bc
 288:	00000008 	andeq	r0, r0, r8
 28c:	0000000c 	andeq	r0, r0, ip
 290:	000001dc 	ldrdeq	r0, [r0], -ip
 294:	000087c4 	andeq	r8, r0, r4, asr #15
 298:	00000058 	andeq	r0, r0, r8, asr r0
 29c:	0000000c 	andeq	r0, r0, ip
 2a0:	000001dc 	ldrdeq	r0, [r0], -ip
 2a4:	0000881c 	andeq	r8, r0, ip, lsl r8
 2a8:	00000008 	andeq	r0, r0, r8
 2ac:	0000000c 	andeq	r0, r0, ip
 2b0:	000001dc 	ldrdeq	r0, [r0], -ip
 2b4:	00008824 	andeq	r8, r0, r4, lsr #16
 2b8:	00000008 	andeq	r0, r0, r8
 2bc:	0000000c 	andeq	r0, r0, ip
 2c0:	000001dc 	ldrdeq	r0, [r0], -ip
 2c4:	0000882c 	andeq	r8, r0, ip, lsr #16
 2c8:	00000008 	andeq	r0, r0, r8
 2cc:	0000000c 	andeq	r0, r0, ip
 2d0:	000001dc 	ldrdeq	r0, [r0], -ip
 2d4:	00008834 	andeq	r8, r0, r4, lsr r8
 2d8:	00000008 	andeq	r0, r0, r8
 2dc:	0000000c 	andeq	r0, r0, ip
 2e0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2e4:	7c020001 	stcvc	0, cr0, [r2], {1}
 2e8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2ec:	0000000c 	andeq	r0, r0, ip
 2f0:	000002dc 	ldrdeq	r0, [r0], -ip
 2f4:	0000883c 	andeq	r8, r0, ip, lsr r8
 2f8:	00000004 	andeq	r0, r0, r4
 2fc:	0000000c 	andeq	r0, r0, ip
 300:	000002dc 	ldrdeq	r0, [r0], -ip
 304:	00008840 	andeq	r8, r0, r0, asr #16
 308:	00000004 	andeq	r0, r0, r4
 30c:	0000000c 	andeq	r0, r0, ip
 310:	000002dc 	ldrdeq	r0, [r0], -ip
 314:	00008844 	andeq	r8, r0, r4, asr #16
 318:	00000004 	andeq	r0, r0, r4
 31c:	0000000c 	andeq	r0, r0, ip
 320:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 324:	7c010001 	stcvc	0, cr0, [r1], {1}
 328:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 32c:	00000014 	andeq	r0, r0, r4, lsl r0
 330:	0000031c 	andeq	r0, r0, ip, lsl r3
 334:	00008964 	andeq	r8, r0, r4, ror #18
 338:	0000003c 	andeq	r0, r0, ip, lsr r0
 33c:	0e038e68 	cdpeq	14, 0, cr8, cr3, cr8, {3}
 340:	00000010 	andeq	r0, r0, r0, lsl r0
 344:	0000000c 	andeq	r0, r0, ip
 348:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 34c:	7c020001 	stcvc	0, cr0, [r2], {1}
 350:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 354:	0000002c 	andeq	r0, r0, ip, lsr #32
 358:	00000344 	andeq	r0, r0, r4, asr #6
 35c:	000089a0 	andeq	r8, r0, r0, lsr #19
 360:	00000044 	andeq	r0, r0, r4, asr #32
 364:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 368:	86078508 	strhi	r8, [r7], -r8, lsl #10
 36c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 370:	8a038904 	bhi	e2788 <__bss_end+0xd7788>
 374:	5e018e02 	cdppl	14, 0, cr8, cr1, cr2, {0}
 378:	c8c9cace 	stmiagt	r9, {r1, r2, r3, r6, r7, r9, fp, lr, pc}^
 37c:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 380:	0000000e 	andeq	r0, r0, lr
 384:	00000024 	andeq	r0, r0, r4, lsr #32
 388:	00000344 	andeq	r0, r0, r4, asr #6
 38c:	000089e4 	andeq	r8, r0, r4, ror #19
 390:	00000040 	andeq	r0, r0, r0, asr #32
 394:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xe42
 398:	86058506 	strhi	r8, [r5], -r6, lsl #10
 39c:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 3a0:	5c018e02 	stcpl	14, cr8, [r1], {2}
 3a4:	c6c7c8ce 	strbgt	ip, [r7], lr, asr #17
 3a8:	000ec4c5 	andeq	ip, lr, r5, asr #9
 3ac:	0000000c 	andeq	r0, r0, ip
 3b0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 3b4:	7c020001 	stcvc	0, cr0, [r2], {1}
 3b8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 3bc:	00000034 	andeq	r0, r0, r4, lsr r0
 3c0:	000003ac 	andeq	r0, r0, ip, lsr #7
 3c4:	00008a28 	andeq	r8, r0, r8, lsr #20
 3c8:	00000178 	andeq	r0, r0, r8, ror r1
 3cc:	83280e44 	teqhi	r8, #68, 28	; 0x440
 3d0:	8509840a 	strhi	r8, [r9, #-1034]	; 0x40a
 3d4:	87078608 	strhi	r8, [r7, -r8, lsl #12]
 3d8:	89058806 	stmdbhi	r5, {r1, r2, fp, pc}
 3dc:	8b038a04 	blhi	e2bf4 <__bss_end+0xd7bf4>
 3e0:	02018e02 	andeq	r8, r1, #2, 28
 3e4:	cbce0aa6 	blgt	ff382e84 <__user_program+0xff082e84>
 3e8:	c7c8c9ca 	strbgt	ip, [r8, sl, asr #19]
 3ec:	c3c4c5c6 	bicgt	ip, r4, #830472192	; 0x31800000
 3f0:	0b42000e 	bleq	1080430 <__user_program+0xd80430>
 3f4:	0000000c 	andeq	r0, r0, ip
 3f8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 3fc:	7c020001 	stcvc	0, cr0, [r2], {1}
 400:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 404:	0000002c 	andeq	r0, r0, ip, lsr #32
 408:	000003f4 	strdeq	r0, [r0], -r4
 40c:	00008ba0 	andeq	r8, r0, r0, lsr #23
 410:	00000120 	andeq	r0, r0, r0, lsr #2
 414:	84200e46 	strthi	r0, [r0], #-3654	; 0xe46
 418:	86078508 	strhi	r8, [r7], -r8, lsl #10
 41c:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 420:	8a038904 	bhi	e2838 <__bss_end+0xd7838>
 424:	02018e02 	andeq	r8, r1, #2, 28
 428:	c9cace88 	stmibgt	sl, {r3, r7, r9, sl, fp, lr, pc}^
 42c:	c5c6c7c8 	strbgt	ip, [r6, #1992]	; 0x7c8
 430:	00000ec4 	andeq	r0, r0, r4, asr #29

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	000000f8 	strdeq	r0, [r0], -r8
   4:	00000100 	andeq	r0, r0, r0, lsl #2
   8:	000001dc 	ldrdeq	r0, [r0], -ip
   c:	000001fc 	strdeq	r0, [r0], -ip
	...
  18:	00000100 	andeq	r0, r0, r0, lsl #2
  1c:	00000104 	andeq	r0, r0, r4, lsl #2
  20:	000001fc 	strdeq	r0, [r0], -ip
  24:	0000021c 	andeq	r0, r0, ip, lsl r2
	...
  30:	00000084 	andeq	r0, r0, r4, lsl #1
  34:	000000f4 	strdeq	r0, [r0], -r4
  38:	00000114 	andeq	r0, r0, r4, lsl r1
  3c:	00000118 	andeq	r0, r0, r8, lsl r1
	...
