

.data
    start1:.int 99
    start2:.int 99
    end:.int 1000
    current_project:.int 0
    check_count:.int 0
    reversed_result:.int 0
    current_project_stored:.int 0
    running_product:.int 0


.text
.globl _main

_main:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    jmp loop1
    leave
    ret

loop1:
    movl start1(%rip), %eax;
    cmpl %eax, end(%rip)
    je endif
    incl start1(%rip)
    jmp loop2
    leave
    ret
loop2:
    movl start2(%rip), %eax;
    cmpl %eax, end(%rip)
    je cleanup_1
    incl start2(%rip);
    movl start1(%rip), %edx;
    imul start2(%rip), %edx;
    movl %edx, current_project(%rip)
    movl %edx, current_project_stored(%rip)
    jmp calculate_reversed
    leave
    ret

calculate_reversed:
    cmpl $0, current_project(%rip);
    je update_conditional_reversed
    movl $10, %eax;
    movl reversed_result(%rip), %edx;
    imul %eax, %edx;
    movl %edx, reversed_result(%rip)
    movl current_project(%rip), %eax;
    movl $10, %ecx;
    movl $0, %edx;
    idivl %ecx;
    addl %edx, reversed_result(%rip);
    movl %eax, current_project(%rip);
    jmp calculate_reversed
    leave
    ret

update_conditional_reversed:
    movl current_project_stored(%rip), %eax;
    cmpl reversed_result(%rip), %eax;
    je unpdate_current_planandrome
    movl $0, reversed_result(%rip);
    jmp loop2
    leave
    ret

unpdate_current_planandrome:
    movl reversed_result(%rip), %eax;
    movl %eax, running_product(%rip)
    jmp loop2
    leave
    ret


endif:
    movl running_product(%rip), %eax;
    leave
    ret

cleanup_1:
    movl $99, start2(%rip)
    jmp loop1
    leave
    ret
