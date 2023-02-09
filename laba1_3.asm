.386
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

_n SWORD 511
result SWORD ?

.code
main proc

	mov ax, _n

	mov bx, 1
	shl bx, 1
	not bx

	and ax, bx
	
	mov bx, 1
	shl bx, 7
	not bx

	and ax, bx
	
	mov result, ax

	invoke ExitProcess,0

main endp
end main
