.386
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

_x1 SDWORD 1 ; 6
_x2 SDWORD 60 ; 5
_x3 SDWORD 70 ; 12
_x4 SDWORD 100 ; x1 > x2 > x3 > x4 ; 2

it SDWORD 0

.code
main proc

	mov eax, _x1
	cmp eax, _x2
	jg More1
		mov ebx, _x1
		xchg ebx, _x2
		mov _x1, ebx
	More1:

	mov eax, _x2
	cmp eax, _x3
	jg More2
		mov ebx, _x2
		xchg ebx, _x3
		mov _x2, ebx
	More2:

	mov eax, _x3
	cmp eax, _x4
	jg More3
		mov ebx, _x3
		xchg ebx, _x4
		mov _x3, ebx
	More3:
		jmp EndOfIf3
	EndOfIf3:
		
	mov eax, _x1
	cmp eax, _x2
	jg More4
		mov ebx, _x1
		xchg ebx, _x2
		mov _x1, ebx
	More4:

	mov eax, _x2
	cmp eax, _x3
	jg More5
		mov ebx, _x2
		xchg ebx, _x3
		mov _x2, ebx
	More5:

	mov eax, _x1
	cmp eax, _x2
	jg More6
		mov ebx, _x1
		xchg ebx, _x2
		mov _x1, ebx
	More6:


	

	invoke ExitProcess,0

main endp
end main
