.data
    end:.long 600900
    counter:.int 1
    flag:.int 0
    current:.int 0
    current_count:.int 1
    current_prime:.int 0

.text
.globl _main

_main:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    jmp run_program
    leave
    ret

run_program:
    incl counter(%rip);
    movl counter(%rip), %eax;
    cmpl %eax, end(%rip)
    je endif
    movl counter(%rip), %eax;
    movl %eax, current(%rip);
    jmp check_prime
    leave
    ret

check_prime:
    incl current_count(%rip)
    movl current_count(%rip), %eax;
    cmpl %eax, current(%rip)
    jne get_divisor
    movl $1, flag(%rip)
    jmp update_current
    leave
    ret

get_divisor:
    movl current(%rip), %eax;
    movl current_count(%rip), %ecx;
    movl $0, %edx;
    idivl %ecx;
    cmpl $0, %edx;
    jne check_prime
    movl $0, flag(%rip);
    jmp update_current
    leave
    ret

update_current:
    movl current(%rip), %eax;
    movl %eax, current_prime(%rip);
    jmp cleanup
    leave
    ret

cleanup:
    movl $2, current_count(%rip);
    jmp run_program
endif:
    movl current(%rip), %eax;
    leave
    ret

