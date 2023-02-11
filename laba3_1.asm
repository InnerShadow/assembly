.386
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

arr SDWORD 1, 2, 3, 4, 1, 5, 6, 3, 1, 10, 341, 341

saveEDI SDWORD 0
globalLoopIt SDWORD 0

sum SDWORD 0

.code
main proc

	mov edi, OFFSET arr
	mov ecx, LENGTHOF arr

	Loop1:
		mov eax, [edi]

		mov globalLoopIt, ecx
		mov saveEDI, edi
		
		mov edi, OFFSET arr
		mov ecx, LENGTHOF arr

		mov edx, 0
		Loop2:
			mov ebx, [edi]
			cmp eax, ebx
			jne cond
				inc edx
			cond:
			add edi, TYPE arr 
		loop Loop2

		cmp edx, 1
		jne cond1
			mov ebx, sum
			add ebx, eax
			mov sum, ebx
		cond1:
			mov edi, saveEDI
			mov ecx, globalLoopIt
			add edi, TYPE arr
	loop Loop1

	mov eax, sum

	invoke ExitProcess,0

main endp
end main
