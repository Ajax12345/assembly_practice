
.data
  end:.int 10000
  current:.int 1
  running_count:.int 0
  inner_iterations:.int 0
  current_reversed_result:.int 0
  copy_inner_iterations:.int 0
  _current:.int 0
.text
.globl _main
_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  jmp find_lychrel
  leave
  ret

find_lychrel:
  movl current(%rip), %eax;
  cmpl %eax, end(%rip);
  je end_find_lychrel
  incl current(%rip);
  movl current(%rip), %eax;
  movl %eax, _current(%rip);
  jmp start_reverse_add
  leave
  ret


start_reverse_add:
  movl inner_iterations(%rip), %eax;
  cmpl $50, %eax;
  je end_reverse_add
  movl _current(%rip), %edx;
  movl %edx, copy_inner_iterations(%rip);
  jmp reverse_current_val
  leave
  ret

reverse_current_val:
  movl copy_inner_iterations(%rip), %eax;
  cmpl $0, %eax;
  jle end_reverse
  movl $0, %edx;
  movl copy_inner_iterations(%rip), %eax;
  movl $10, %ecx;
  idivl %ecx;
  movl %eax, copy_inner_iterations(%rip);
  movl %edx, current_reversed_result(%rip);
  movl current_reversed_result(%rip), %edx;
  movl $10, %eax;
  imul %eax, %edx;
  addl %edx, current_reversed_result(%rip);
  jmp reverse_current_val
  leave
  ret


end_reverse:
  movl current_reversed_result(%rip), %eax;
  cmpl %eax, _current(%rip);
  je sucessful_result_found
  movl _current(%rip), %eax;
  movl current_reversed_result(%rip), %edx;
  addl %eax, %edx;
  movl %edx, _current(%rip);
  incl inner_iterations(%rip);
  jmp start_reverse_add;
  leave
  ret

sucessful_result_found:
  incl running_count(%rip);
  jmp end_reverse_add
  leave
  ret

end_reverse_add:
  movl $0, current_reversed_result(%rip);
  movl $0, copy_inner_iterations(%rip);
  movl $0, inner_iterations(%rip);
  movl $0, _current(%rip);
  jmp find_lychrel
  leave
  ret
end_find_lychrel:
  movl running_count(%rip), %eax;
  leave
  ret
