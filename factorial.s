
.data
  x:.int 6

.text
.globl _main

_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movl $0, %edx;
  movl x(%rip), %edx;
  movl %edx, %ecx;
  cmpl $0, %edx;
  jne factorial
  movl $1, %eax;

  leave
  ret

factorial:
  decl %ecx;
  imul %ecx;
  cmpl $1, %ecx;
  jg factorial
  jmp endif


endif:
