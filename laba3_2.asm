.386
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

array DWORD 9, 8, 7, 6, 5; Отсортировать массив методом выбора.
decrement DWORD 1

.code
main proc

	mov edi, OFFSET array
	mov ecx, LENGTHOF array

	L1:
		mov eax, [edi]
		mov esi, edi
		add esi, 4
		push ecx
		mov ecx, LENGTHOF array
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

	mov edi, OFFSET array
	mov ecx, LENGTHOF array

	L3:
		mov eax, [edi]
		add edi, 4
	loop L3

	invoke ExitProcess, 0

main endp
end main
