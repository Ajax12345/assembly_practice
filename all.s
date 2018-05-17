

.data
  myarray:.int 1, 1, 1, 1, 1, 1
  current:.int 1
  flag:.int 1

.text
.globl _main

_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  mov $0, %rsi;
  movl $0, %eax
  movl $0, %ebx;
  lea myarray(%rip), %rdi
  movl (%rdi, %rsi, 4), %ecx;
  cmpl %ecx, current(%rip)
  je all
  movl $0, flag(%rip)
  jmp endif
  leave
  ret

all:
  inc %rsi
  movl (%rdi, %rsi, 4), %ecx;
  cmp $6, %rsi
  je endif
  cmpl %ecx, current(%rip)
  je all
  movl $0, flag(%rip)
  jmp endif
  leave
  ret



min:
  movl (%rdi, %rsi, 4), %ecx;
  inc %rsi
  cmpl %ecx, current(%rip);
  jl reassign
  cmp $6, %rsi
  jne min
  jmp min
  jmp endif
  leave
  ret

reassign:
  movl %ecx, current(%rip);
  cmp $6, %rsi
  jne min
  leave
  ret

endif:
  movl flag(%rip), %eax;
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
