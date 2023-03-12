.model flat, c
.code

.data
decrement DWORD 1
len DWORD ?


.code
ASMsort proc
	push ebp
	mov ebp, esp

	mov ecx, [ebp + 8]
	mov len, ecx

	mov edi, [ebp + 12]
	push edi

	L1:
		mov eax, [edi]
		mov esi, edi
		add esi, 4
		push ecx
		mov ecx, len
		sub ecx, decrement
		cmp ecx, 0
		je Exit
			mov ebp, edi
		L2:
			mov edx, [ebp]
			cmp [esi], edx
			jg ifGreater
				mov ebp, esi
			ifGreater:
				add esi, 4
		loop L2
	cmp eax, [ebp]
	je nothingHappened
		xchg eax, [ebp]
		mov [edi], eax
	nothingHappened:
		pop ecx
		add edi, 4
		inc decrement
	loop L1
	Exit:

	pop edi
	pop edi
	mov eax, edi
	
	pop ebp
	ret
ASMsort endp
end