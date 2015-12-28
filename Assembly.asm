.code

head MACRO 
		push			rbx
		push			rsi
		push			rdi

		mov				r8, rcx
		movaps			[r8 + 00h], xmm6
		movaps			[r8 + 10h], xmm7
		movaps			[r8 + 20h], xmm8
		movaps			[r8 + 30h], xmm9
		movaps			[r8 + 40h], xmm10
		movaps			[r8 + 50h], xmm11
		movaps			[r8 + 60h], xmm12
		movaps			[r8 + 70h], xmm13
		movaps			[r8 + 80h], xmm14
		movaps			[r8 + 90h], xmm15

		vzeroall

		xor				eax, eax
		cpuid
		rdtsc
		mov				edi, eax
		mov				esi, edx
		xor				eax, eax
		cpuid

		mov				rcx, 1000 * 1000
		align 16
ENDM

tail MACRO
		xor				eax, eax
		cpuid
		rdtsc
		sub				edi, eax
		sbb				esi, edx
		xor				eax, eax
		cpuid
		shl				rsi, 20h
		or				rdi, rsi
		mov				rax, rdi
		neg				rax

		vzeroall

		movaps			xmm6, [r8 + 00h]
		movaps			xmm7, [r8 + 10h]
		movaps			xmm8, [r8 + 20h]
		movaps			xmm9, [r8 + 30h]
		movaps			xmm10, [r8 + 40h]
		movaps			xmm11, [r8 + 50h]
		movaps			xmm12, [r8 + 60h]
		movaps			xmm13, [r8 + 70h]
		movaps			xmm14, [r8 + 80h]
		movaps			xmm15, [r8 + 90h]

		pop				rdi
		pop				rsi
		pop				rbx
		ret
ENDM


Code1_FMAPS_YMM_VPADDD	proc
		head

startLabel_Code1_FMAPS_YMM_VPADDD:
		vfmadd231ps		ymm0, ymm0, ymm0
		vfmadd231ps		ymm1, ymm1, ymm1
		vfmadd231ps		ymm2, ymm2, ymm2
		vfmadd231ps		ymm3, ymm3, ymm3
		vfmadd231ps		ymm4, ymm4, ymm4
		vfmadd231ps		ymm5, ymm5, ymm5
		vfmadd231ps		ymm6, ymm6, ymm6
		vfmadd231ps		ymm7, ymm7, ymm7
		vfmadd231ps		ymm8, ymm8, ymm8
		vfmadd231ps		ymm9, ymm9, ymm9
		vpaddd			ymm10, ymm10, ymm10
		vpaddd			ymm11, ymm11, ymm11
		vpaddd			ymm12, ymm12, ymm12
		vpaddd			ymm13, ymm13, ymm13
		vpaddd			ymm14, ymm14, ymm14
		dec				rcx
		jnz				startLabel_Code1_FMAPS_YMM_VPADDD

		tail
Code1_FMAPS_YMM_VPADDD endp

Code2_MULPS_YMM_C5	proc
		head

startLabel_Code2_MULPS_YMM_C5:
		vmulps			ymm0, ymm0, ymm0
		vmulps			ymm1, ymm1, ymm1
		vmulps			ymm2, ymm2, ymm2
		vmulps			ymm3, ymm3, ymm3
		vmulps			ymm4, ymm4, ymm4
		vmulps			ymm5, ymm5, ymm5
		vmulps			ymm6, ymm6, ymm6
		vmulps			ymm7, ymm7, ymm7
		vmulps			ymm8, ymm8, ymm8
		vmulps			ymm9, ymm9, ymm9
		vpaddd			ymm10, ymm10, ymm10
		vpaddd			ymm11, ymm11, ymm11
		vpaddd			ymm12, ymm12, ymm12
		vpaddd			ymm13, ymm13, ymm13
		vpaddd			ymm14, ymm14, ymm14
		dec				rcx
		jnz				startLabel_Code2_MULPS_YMM_C5

		tail
Code2_MULPS_YMM_C5 endp

Code3_MULPS_YMM_C4	proc
		head

startLabel_Code3_MULPS_YMM_C4:
		byte			0c4h, 0c1h, 07ch, 059h, 0c0h ;long VEX form vmulps ymm0, ymm0, ymm0
		byte			0c4h, 0c1h, 074h, 059h, 0c9h ;long VEX form vmulps ymm1, ymm1, ymm1
		byte			0c4h, 0c1h, 06ch, 059h, 0d2h ;long VEX form vmulps ymm2, ymm2, ymm2
		byte			0c4h, 0c1h, 06ch, 059h, 0dbh ;long VEX form vmulps ymm3, ymm3, ymm3
		byte			0c4h, 0c1h, 05ch, 059h, 0e4h ;long VEX form vmulps ymm4, ymm4, ymm4
		byte			0c4h, 0c1h, 054h, 059h, 0edh ;long VEX form vmulps ymm5, ymm5, ymm5
		byte			0c4h, 0c1h, 04ch, 059h, 0f6h ;long VEX form vmulps ymm6, ymm6, ymm6
		byte			0c4h, 0c1h, 044h, 059h, 0ffh ;long VEX form vmulps ymm7, ymm7, ymm7
		vmulps			ymm8, ymm8, ymm8
		vmulps			ymm9, ymm9, ymm9
		vpaddd			ymm10, ymm10, ymm10
		vpaddd			ymm11, ymm11, ymm11
		vpaddd			ymm12, ymm12, ymm12
		vpaddd			ymm13, ymm13, ymm13
		vpaddd			ymm14, ymm14, ymm14
		dec				rcx
		jnz				startLabel_Code3_MULPS_YMM_C4

		tail
Code3_MULPS_YMM_C4 endp

Code4_FMAPS_XMM_VPADDD	proc
		head

startLabel_Code4_FMAPS_XMM_VPADDD:
		vfmadd231ps		xmm0, xmm0, xmm0
		vfmadd231ps		xmm1, xmm1, xmm1
		vfmadd231ps		xmm2, xmm2, xmm2
		vfmadd231ps		xmm3, xmm3, xmm3
		vfmadd231ps		xmm4, xmm4, xmm4
		vfmadd231ps		xmm5, xmm5, xmm5
		vfmadd231ps		xmm6, xmm6, xmm6
		vfmadd231ps		xmm7, xmm7, xmm7
		vfmadd231ps		xmm8, xmm8, xmm8
		vfmadd231ps		xmm9, xmm9, xmm9
		vpaddd			xmm10, xmm10, xmm10
		vpaddd			xmm11, xmm11, xmm11
		vpaddd			xmm12, xmm12, xmm12
		vpaddd			xmm13, xmm13, xmm13
		vpaddd			xmm14, xmm14, xmm14
		dec				rcx
		jnz				startLabel_Code4_FMAPS_XMM_VPADDD

		tail
Code4_FMAPS_XMM_VPADDD endp

Code5_FMAPS_YMM_VPSUBD	proc
		head
startLabel_Code5_FMAPS_YMM_VPSUBD:
		vfmadd231ps		ymm0, ymm0, ymm0
		vfmadd231ps		ymm1, ymm1, ymm1
		vfmadd231ps		ymm2, ymm2, ymm2
		vfmadd231ps		ymm3, ymm3, ymm3
		vfmadd231ps		ymm4, ymm4, ymm4
		vfmadd231ps		ymm5, ymm5, ymm5
		vfmadd231ps		ymm6, ymm6, ymm6
		vfmadd231ps		ymm7, ymm7, ymm7
		vfmadd231ps		ymm8, ymm8, ymm8
		vfmadd231ps		ymm9, ymm9, ymm9
		vpsubd			ymm10, ymm10, ymm10
		vpsubd			ymm11, ymm11, ymm11
		vpsubd			ymm12, ymm12, ymm12
		vpsubd			ymm13, ymm13, ymm13
		vpsubd			ymm14, ymm14, ymm14
		dec				rcx
		jnz				startLabel_Code5_FMAPS_YMM_VPSUBD

		tail
Code5_FMAPS_YMM_VPSUBD endp


end