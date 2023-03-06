.386
.model flat,stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

tableD DWORD 1, 2, 3
RowSize = ($ - tableD)
DWORD 6, 7, 8
DWORD 4, 5, 10

it DWORD 0
jt DWORD 0

nrow DWORD 3
ncol DWORD 3

.code
main proc

	L1:
		mov edi, OFFSET tableD
		mov eax, RowSize
		mul it
		add edi, eax
		mov edi, [edi]

		push it

		L2:
			mov ecx, OFFSET tableD
			mov eax, RowSize
			mul it 
			add ecx, eax
			mov eax, [ecx]

			cmp edi, eax
			jge NOT1
				mov ebp, it			; ebp contans max 1'st col index
				mov edi, eax		; edi - contains max 1'st col element
			NOT1:

			inc it
			mov eax, it
			cmp eax, nrow
			je END2
				jmp L2
		END2:

		pop it
		mov ebx, 0
		mov jt, ebx

		L3:
			mov ecx, OFFSET tableD
			mov eax, RowSize
			mul it 
			add ecx, eax

			mov ebx, OFFSET tableD
			mov eax, RowSize
			mul ebp
			add ebx, eax
			
			mov esi, jt

			mov eax, [ecx + esi * TYPE tableD]
			xchg eax, [ebx + esi * TYPE tableD]
			mov [ecx + esi * TYPE tableD], eax

			inc jt
			mov eax, jt
			cmp eax, ncol
			je END3
				jmp L3
		END3:

		inc it
		mov eax, it
		cmp eax, nrow

		je ENDWHILE
			jmp L1
	ENDWHILE:

	;check matrix

	mov eax, 0
	mov it, eax
	mov jt, eax
	L4:
	mov eax, 0
	mov jt, eax
		L5:
			mov ebx, OFFSET tableD
			mov eax, RowSize
			mul it
			add ebx, eax
			mov esi, jt
			mov eax, [ebx + esi * TYPE tableD]			;primordial matrix : [[1, 2, 3]; [6, 7, 8], [4, 5, 10]]

			inc jt
			mov eax, jt
			cmp eax, ncol
			je END5
				jmp L5
		END5:

		inc it
		mov eax, it
		cmp eax, nrow
		je END4
			jmp L4
	End4:
		

	invoke ExitProcess,0

main endp
end main
