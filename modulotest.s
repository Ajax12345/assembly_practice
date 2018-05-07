
.data
  x:.int 5

.text
.globl _main

_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movl $0, %edx;
  movl $25, %eax;
  movl $5, %ecx;
  idivl %ecx;
  movl %edx, %eax;
  leave
  ret
