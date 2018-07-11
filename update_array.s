.data
  x:.int 10, 3, 1, 3, 4
  index:.int 1
  val:.int 2
  end:.int 10
  running_total:.int 0

.text
.globl _main
_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  lea x(%rip), %rdi;
  movslq index(%rip), %rsi;
  movl (%rdi, %rsi, 4), %ecx;
  incl (%rdi, %rsi, 4);
  movl (%rdi, %rsi, 4), %eax;
  movl $1, -4(%rbp)
  movl -4(%rbp), %eax;
  movl $7, -8(%rbp)
  movl -8(%rbp), %eax;
  leave
  ret
