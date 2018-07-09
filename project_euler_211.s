


.data
  end:.int 64000000
  start:.int 0
  inner_divisor:.int 1
  running_sum:.int 0
  inner_o_2_sum:.int 0
  perfect_square_checker:.int 1

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
  movl start(%rip), %eax;
  cmpl end(%rip), %eax;
  jge end_outer_loop
  jmp get_divisors
  leave
  ret

get_divisors:
  movl inner_divisor(%rip), %eax;
  cmpl start(%rip), %eax;
  jge check_is_perfect_square
  movl start(%rip), %eax;
  movl inner_divisor(%rip), %ecx;
  movl $0, %edx
  idivl %ecx;
  cmpl $0, %edx;
  jne failed_divisor
  movl inner_divisor(%rip), %eax;
  imul inner_divisor(%rip), %eax;
  addl %eax, inner_o_2_sum(%rip);
  incl inner_divisor(%rip);
  jmp get_divisors
  leave
  ret

failed_divisor:
  incl inner_divisor(%rip)
  jmp get_divisors
  leave
  ret

check_is_perfect_square:
  movl perfect_square_checker(%rip), %eax;
  cmpl inner_o_2_sum(%rip), %eax;
  jge reset_inner_loop_vals
  imul perfect_square_checker(%rip), %eax;
  cmpl inner_o_2_sum(%rip), %eax;
  je found_perfect_square
  incl perfect_square_checker(%rip)
  jmp check_is_perfect_square
  leave
  ret

found_perfect_square:
  movl start(%rip), %eax;
  addl %eax, running_sum(%rip);
  jmp reset_inner_loop_vals
  leave
  ret

reset_inner_loop_vals:
  movl $1, inner_divisor(%rip)
  movl $0, inner_o_2_sum(%rip)
  movl $1, perfect_square_checker(%rip)
  incl start(%rip)
  jmp outer_loop
  leave
  ret

end_outer_loop:
  movl running_sum(%rip), %eax;
  leave
  ret
