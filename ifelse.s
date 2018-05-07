
.data
  x:.int 10

.text
.globl _main

_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movl $10, %eax;
  cmpl x(%rip), %eax;
  jne else . #the opposite of what we really want to do
  addl $3, %eax;
  jmp endif
  leave
  ret

else:
  subl $5, %eax;
  leave
  ret

endif:
  leave
  ret
