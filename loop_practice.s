
.globl _main
.data:
  x: .long 10
Message:
  .string "Hello James!\n"
  .text

_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movl $1, %eax;
  movl $10, %edx;
  movl $0, %ebx;
  jmp print10
  leave
  ret

print10:
  jmp loop
  movl %ebx, %eax;
  leave
  ret

loop:

  incl %eax;
  addl $5, %ebx;
  cmpl %edx, %eax;
  jl loop
  leave
  ret
