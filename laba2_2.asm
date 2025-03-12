.386
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

k SDWORD 4 ; knight on cell (k;l) is posible to move on cell (m,n)?
l SDWORD 4
m SDWORD 5
n SDWORD 3
resualt BYTE 0


.code
main proc

	mov eax, k
	sub eax, m
	imul eax
	mov ebx, eax

	mov eax, l
	sub eax, n
	imul eax

	cmp ebx, 4
	jne NOT1
		cmp eax, 1
		jne NOT2
			mov resualt, 1
		NOT2:
	NOT1:

	cmp ebx, 1
	jne NOT3
		cmp eax, 4
		jne NOT4
			mov resualt, 1
		NOT4:
	NOT3:
	


	invoke ExitProcess,0

main endp
end main
