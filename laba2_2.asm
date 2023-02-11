.386
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

k SDWORD 4
l SDWORD 4
m SDWORD 5
n SDWORD 2
resualt BYTE 0

result SWORD ?

.code
main proc

	mov eax, k
	add eax, 2
	cmp eax, m
	jne NOT1
		mov eax, l
		add eax, 1
		cmp eax, n
		jne NOT2
		mov resualt, 1
		NOT2:
	NOT1:

	mov eax, k
	add eax, 1
	cmp eax, m
	jne NOT3
		mov eax, l
		add eax, 2
		cmp eax, n
		jne NOT4
		mov resualt, 1
		NOT4:
	NOT3:

	mov eax, k
	sub eax, 1
	cmp eax, m
	jne NOT5
		mov eax, l
		add eax, 2
		cmp eax, n
		jne NOT6
		mov resualt, 1
		NOT6:
	NOT5:

	mov eax, k
	sub eax, 2
	cmp eax, m
	jne NOT7
		mov eax, l
		add eax, 1
		cmp eax, n
		jne NOT8
		mov resualt, 1
		NOT8:
	NOT7:

	mov eax, k
	sub eax, 2
	cmp eax, m
	jne NOT9
		mov eax, l
		sub eax, 1
		cmp eax, n
		jne NOTA
		mov resualt, 1
		NOTA:
	NOT9:

	mov eax, k
	sub eax, 1
	cmp eax, m
	jne NOTB
		mov eax, l
		sub eax, 2
		cmp eax, n
		jne NOTC
		mov resualt, 1
		NOTC:
	NOTB:

	mov eax, k
	add eax, 1
	cmp eax, m
	jne NOTD
		mov eax, l
		sub eax, 2
		cmp eax, n
		jne NOTE
		mov resualt, 1
		NOTE:
	NOTD:

	mov al, resualt

	invoke ExitProcess,0

main endp
end main
