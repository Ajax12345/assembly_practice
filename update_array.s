.data
  x:.fill 10, 4
  index:.int 0
  end:.int 10

.text
.globl _main
_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  jmp outer_loop
  leave
  ret

outer_loop:
  movl index(%rip), %eax;
  cmpl end(%rip), %eax
  jge end_loop
  lea x(%rip), %rdi;
  mov index(%rip), %rsi;
  movl index(%rip), %esi
  movl %esi, (%rdi, %rsi, 4)
  incl index(%rip)
  jmp outer_loop
  leave
  ret

end_loop:
  leave
  ret
