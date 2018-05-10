

.data
  target:.int 2
  flag:.int 1
  start:.int 1
  end:.int 2

.text
.globl _main

_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movl $0, %eax;
  jmp isprime
  movl flag(%rip), %eax;
  leave
  ret

isprime:
  incl start(%rip);
  movl end(%rip), %ebx;
  cmpl start(%rip), %ebx;
  je endif
  movl $0, %edx;
  movl target(%rip), %eax;
  movl start(%rip), %ecx;
  idivl %ecx;
  cmpl $0, %edx;
  jne isprime
  decl flag(%rip);
  leave
  ret



endif:
  leave
  ret
