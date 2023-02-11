
.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

_a SDWORD 6
_b SDWORD 4
_c SDWORD 2

final_value SDWORD ?

.code
main proc

	mov ebx, _c
	sub ebx, 1

	mov ecx, 4
	mov eax, _b
	mov edx, 0
	div ecx
	add eax, _a
	mov edx, 0
	div ebx
	mul _a

	mov final_value, eax


	invoke ExitProcess,0

main endp
end main