.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

_a BYTE 1
_b BYTE 0
_c BYTE 1
_d BYTE 0

S BYTE ?
T BYTE ?

.code
main proc

  mov bl, _b
  xor bl, 1
  or bl, _a

  mov al, _c
  xor al, 1
  or al, _a
  and al, bl
  mov T, al

  mov al, _b
  and al, _c
  xor al, 1
  and al, _a
  mov S, al

  invoke ExitProcess,0

main endp
end main