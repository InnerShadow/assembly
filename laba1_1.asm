
.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

_a SDWORD 6
_b SDWORD 4
_c SDWORD 2
four SDWORD 4

first_bracket SDWORD ?
last_bracket SDWORD ?
final_value SDWORD ?

.code
main proc

	mov eax, _c
	sub eax, 1
	mov last_bracket, eax

	mov eax, _b
	mov edx, 0
	div four
	add eax, _a
	mov edx, 0
	div last_bracket
	mul _a
	mov final_value, eax


	invoke ExitProcess,0

main endp
end main