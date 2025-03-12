.386
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

arr SDWORD 1, 1, 2, 2, 3, 3 ; Найти сумму тех элементов массива, которые встречаются по одному разу

sum SDWORD 0

.code
main proc

	mov edi, OFFSET arr
	mov ecx, LENGTHOF arr

	Loop1:
		mov eax, [edi]

		push ecx
		push edi
		
		mov edi, OFFSET arr
		mov ecx, LENGTHOF arr

		mov edx, 0
		Loop2:
			mov ebx, [edi]
			cmp eax, ebx
			jne CONDTITION1
				inc edx
			CONDTITION1:
			add edi, TYPE arr 
		;loop Loop2
		dec ecx
		cmp ecx, 0
		jne Loop2

		cmp edx, 1
		jne CONDITION2
			mov ebx, sum
			add ebx, eax
			mov sum, ebx
		CONDITION2:
			pop edi
			pop ecx
			add edi, TYPE arr
	loop Loop1

	invoke ExitProcess,0

main endp
end main
