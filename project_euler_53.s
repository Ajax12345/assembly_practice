.data
  benchmark:.int 1000000
  end:.int 100
  current:.int 0
  countdown_1:.int 0
  n_factorial:.int 1
  countdown_2:.int 0
  r_factorial:.int 1
  countdown_3:.int 0
  c_factorial:.int 1
  counter:.int 0
  
.text
.globl _main
_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  jmp start_main_loop
  leave
  ret

start_main_loop:
  movl current(%rip), %eax;
  cmpl %eax, end(%rip);
  je end_loop
  incl current(%rip);
  movl current(%rip), %eax;
  movl %eax, countdown_1(%rip);
  jmp calc_n_factorial
  leave
  ret

calc_n_factorial:
  movl countdown_1(%rip), %eax;
  cmpl $0, %eax;
  je start_r_factorial
  movl countdown_1(%rip), %eax;
  movl n_factorial(%rip), %edx;
  imul %eax, %edx;
  movl %edx, n_factorial(%rip);
  decl countdown_1(%rip);
  jmp calc_n_factorial
  leave
  ret

start_r_factorial:
  movl $10, countdown_2(%rip);
  jmp calc_r_factorial
  leave
  ret

calc_r_factorial:
  movl countdown_2(%rip), %eax;
  cmpl $0, %eax;
  je start_last_factorial
  movl r_factorial(%rip), %eax;
  movl countdown_2(%rip), %edx;
  imul %edx, %eax;
  movl %eax, r_factorial(%rip);
  decl countdown_2(%rip);
  jmp calc_r_factorial
  leave
  ret

start_last_factorial:
  movl current(%rip), %eax;
  movl $10, %edx;
  subl %edx, %eax;
  movl %eax, countdown_3(%rip);
  jmp calc_last_factorial
  leave
  ret

calc_last_factorial:
  movl countdown_3(%rip), %eax;
  cmpl $0, %eax;
  je last_operations
  movl countdown_3(%rip), %eax;
  movl c_factorial(%rip), %edx;
  imul %eax, %edx;
  incl countdown_3(%rip);
  movl %edx, c_factorial(%rip);
  jmp calc_last_factorial
  leave
  ret

last_operations:
  movl r_factorial(%rip), %eax;
  movl c_factorial(%rip), %edx;
  imul %edx, %eax;
  movl %eax, %ecx;
  movl n_factorial(%rip), %eax;
  movl $0, %edx;
  idivl %ecx;
  movl benchmark(%rip), %ecx;
  cmpl %ecx, %eax;
  jg update_counter
  jmp finish_full_operations
  leave
  ret

update_counter:
  incl counter(%rip);
  jmp finish_full_operations;
  leave
  ret

finish_full_operations:
  movl $0, countdown_1(%rip)
  movl $1, n_factorial(%rip)
  movl $0, countdown_2(%rip)
  movl $1, r_factorial(%rip)
  movl $0, countdown_3(%rip)
  movl $1, c_factorial(%rip)
  jmp start_main_loop
  leave
  ret


end_loop:
  movl counter(%rip), %eax;
  leave
  ret
