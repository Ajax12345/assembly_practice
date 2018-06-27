
.data
  myarr:.int 10, 1, 3
  test_val:.int 10
.text
.globl _main
_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  lea myarr(%rip), %rdi;
  mov $2, %rsi;
  movl (%rdi, %rsi, 4), %eax;
  imul test_val(%rip), %eax;
  subl $4, %eax;
  leave
  ret
