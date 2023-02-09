.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

_a BYTE 1
_b BYTE 0
_c BYTE 1
_d BYTE 0

first_eqe BYTE ?
S BYTE ?
T BYTE ?

.code
main proc

  mov al, _b
  xor al, 1
  or al, _a
  mov first_eqe, al

  mov al, _c
  xor al, 1
  or al, _a
  and al, first_eqe
  mov T, al

  mov al, _b
  and al, _c
  xor al, 1
  and al, _a
  mov S, al

  invoke ExitProcess,0

main endp
end main