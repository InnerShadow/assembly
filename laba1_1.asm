
.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

_a SDWORD 4
_b SDWORD 2
_c SDWORD 1

first_sub_plus_pow SDWORD ?
lat_part SDWORD ?
final_value SDWORD ?

.code
main proc

	mov eax, _a
	sub eax, _c
	mul eax
	mov first_sub_plus_pow, eax

	mov eax, 2
	mul _a
	mul _c
	mov edx, 0
	div _b
	mov lat_part, eax

	mov eax, first_sub_plus_pow
	add eax, lat_part
	mov final_value, eax


	invoke ExitProcess,0

main endp
end main