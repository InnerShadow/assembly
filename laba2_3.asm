.386
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

_n SDWORD 5
it SDWORD 1
resualt SDWORD 0

.code
main proc

	mov eax, it
	BeginWhile:
		mov eax, it
		cmp eax, _n
		jg EndWhile

		mov eax, it
		mul eax

		mov ebx, resualt
		add ebx, eax
		mov resualt, ebx
		inc it
		jmp BeginWhile
	EndWhile:
		mov it, eax

	mov eax, resualt

	invoke ExitProcess,0

main endp
end main
