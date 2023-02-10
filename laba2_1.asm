.386
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

_x1 SDWORD 2 ;5
_x2 SDWORD 5 ;6
_x3 SDWORD 8 ;4
_x4 SDWORD 12 ;2

it SDWORD 0

.code
main proc

	mov eax, it
	BeginWile:
		mov eax, it
		cmp eax, 3
		jnl EndWhile

		mov eax, _x1
		cmp eax, _x2
		jg Less1
		mov ebx, _x1
		mov ecx, _x2
		mov _x1, ecx
		mov _x2, ebx
		Less1:
		jmp EndOfIf1
		EndOfIf1:

		mov eax, _x2
		cmp eax, _x3
		jg Less2
		mov ebx, _x2
		mov ecx, _x3
		mov _x2, ecx
		mov _x3, ebx
		Less2:
		jmp EndOfIf2
		EndOfIf2:

		mov eax, _x3
		cmp eax, _x4
		jg Less3
		mov ebx, _x3
		mov ecx, _x4
		mov _x3, ecx
		mov _x4, ebx
		Less3:
		jmp EndOfIf3
		EndOfIf3:
		inc it
		jmp BeginWile
	EndWhile:
		mov it, eax


	mov eax, _x1
	mov eax, _x2
	mov eax, _x3
	mov eax, _x4

	invoke ExitProcess,0

main endp
end main
