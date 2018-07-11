


.text
.globl _main
_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movl $16, -4(%rbp);
  movl $1, -8(%rbp);
  movl $0, -12(%rbp);
  jmp start_count
  leave
  ret

start_count:
  movl -8(%rbp), %eax;
  cmpl -4(%rbp), %eax;
  jg show_result
  movl -8(%rbp), %ecx;
  movl -4(%rbp), %eax;
  movl $0, %edx;
  idivl %ecx;
  cmpl $0, %edx;
  je found_divisor
  incl -8(%rbp);
  jmp start_count
  leave
  ret

found_divisor:
  movl -8(%rbp), %eax;
  addl %eax, -12(%rbp)
  incl -8(%rbp)
  jmp start_count
  leave
  ret

show_result:
  movl -12(%rbp), %eax;
  leave
  ret
