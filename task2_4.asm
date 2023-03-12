.model flat, c
.code

.data
_n SDWORD ?
tmp SDWORD ?
ten SDWORD 10
result BYTE 1

.code
task2_4 proc
	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]
	mov _n, eax
	mov tmp, eax
	
	BeginWhile1:
		mov eax, _n
		cmp eax, 0
		je EndWhile1

		mov edx, 0
		div ten
		mov ebx, edx
		mov _n, eax
		mov tmp, eax

		BeginWhile2:
			mov eax, tmp
			cmp eax, 0
			je EndWhile2

			mov edx, 0
			div ten
			mov ecx, edx
			mov tmp, eax

			cmp ebx, ecx
			jne CONDITION
				mov result, 0
				jmp EndWhile1
			CONDITION:
				jmp BeginWhile2
				
		EndWhile2:
			jmp BeginWhile1
	EndWhile1:

	mov al, result
	
	pop ebp
	ret
task2_4 endp
end