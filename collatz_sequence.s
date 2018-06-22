
.data
  start:.int 1
  running_length:.int 0
  _start:.int 1
  _process_counter:.int 0
.text
.globl _main
_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  jmp start_collatz
  leave
  ret

start_collatz:
  movl start(%rip), %eax
  cmpl $1000000, %eax;
  je end_process
  movl start(%rip), %eax;
  movl %eax, _start(%rip);
  jmp inner_loop
  leave
  ret

inner_loop:
  cmpl $1, _start(%rip);
  je end_inner_loop
  incl _process_counter(%rip);
  movl _start(%rip), %eax;
  movl $0, %edx;
  movl $2, %ecx;
  idivl %ecx;
  cmpl $0, %edx;
  je even_result
  movl $3, %eax
  movl _start(%rip), %edx;
  imull %eax, %edx;
  movl %edx, _start(%rip)
  incl _start(%rip);
  jmp inner_loop

end_inner_loop:
  movl _process_counter(%rip), %eax
  cmpl %eax, running_length(%rip);
  jl plain_wrapup
  movl %eax, running_length(%rip);
  jmp plain_wrapup
  leave
  ret

plain_wrapup:
  movl $0, _process_counter(%rip);
  jmp start_collatz
  leave
  ret



even_result:
  movl %eax, _start(%rip);
  jmp inner_loop
  leave
  ret

end_process:
  movl running_length(%rip), %eax;
  leave
  ret
