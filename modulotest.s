
.data
  x:.int 5

.text
.globl _main

_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movl $0, %edx;
  movl $25, %eax; #dividend stored in eax,
  movl $5, %ecx; #divisor stored in ecx
  idivl %ecx; 
  movl %edx, %eax; #remainder stored in edx, (modulo result), result stored in eax
  leave
  ret
