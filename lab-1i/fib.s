	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr,r6}

	mov r3,#0	@r3=fib[i-2]
	mov r4,#0	@r4=fib[i-1]
	mov r5,#1	@r5=f[i]
	mov r6,r0	@r6=i

	@if i<=0,return 0
	cmp r6,#0
	ble .end0

	@goto forloop
	bl .forloop
.end0:
	mov r0,#0
	bl .endfib

.forloop:
	cmp r6,#1
	ble .endfor
	mov r3,r4
	mov r4,r5
	add r5,r3,r4
	sub r6,#1
	bl .forloop

.endfor:
	mov r0,r5
.endfib:
	pop {r3, r4, r5, pc,r6}		@EPILOG

	@ END

	.size fibonacci, .-fibonacci
	.end
