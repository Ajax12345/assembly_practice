
.data
  myarray:.int 1, 1, 1, 1, 1, 6

.text
.globl _main

_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  mov $0, %rsi;
  movl $0, %eax
  lea myarray(%rip), %rdi
  movl (%rdi, %rsi, 4), %ecx;
  jmp array_sum
  leave
  ret

array_sum:
  movl (%rdi, %rsi, 4), %ecx;
  addl %ecx, %eax
  inc %rsi
  cmp $6, %rsi
  jne array_sum
  leave
  ret
