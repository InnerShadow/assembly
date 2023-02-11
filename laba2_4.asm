.386
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

_n SDWORD 966 ; 1 - has no same numbers, 0 - has same numbers
tmp SDWORD ?
ten SDWORD 10
result SDWORD 1


.code
main proc

	mov eax, _n
	mov tmp, eax

	mov eax, _n
	BeginWhile1:
		mov eax, _n
		cmp eax, 0
		je EndWhile1

		mov eax, _n
		mov edx, 0
		div ten
		mov ebx, edx
		mov _n, eax
		mov tmp, eax

		BeginWhile2:
			mov eax, tmp
			cmp eax, 0
			je EndWhile2

			mov eax, tmp
			mov edx, 0
			div ten
			mov ecx, edx
			mov tmp, eax

			mov eax, ebx
			cmp eax, ecx
			jne cond
				mov result, 0
				jmp EndWhile1
			cond:
				jmp BeginWhile2
				
		EndWhile2:
			mov tmp, eax
		jmp BeginWhile1
	EndWhile1:
		mov tmp, eax

	mov eax, result

	invoke ExitProcess,0

main endp
end main
