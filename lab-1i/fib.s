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
	push {r3, r4, r5, lr,r6,r7}

	mov r3,#0	@r3=fib[i-2]
	mov r4,#1	@r4=fib[i-1]
	mov r5,#1	@r5=f[i]
	mov r6,r0	@r6=i
	mov r7,#2	@r7=counter

	@if i<=0,return 0;
	cmp r6,#0
	ble .end0

	@i fi=1 or i=2,return 1;
	cmp r6,#1
	beq .end1
	cmp r6,#2
	beq .end1

	@goto forloop
	bl .forloop
.end0:
	mov r0,#0
	bl .endfib
.end1:
	mov r0,#1
	bl .endfib

.forloop:
	mov r3,r4
	mov r4,r5
	add r5,r3,r4
	add r7,r7,#1
	cmp r7,r6
	blt .forloop
	bl .endfor

.endfor:
	mov r0,r5
.endfib:
	pop {r3, r4, r5, pc,r6,r7}		@EPILOG

	@ END

	.size fibonacci, .-fibonacci
	.end
