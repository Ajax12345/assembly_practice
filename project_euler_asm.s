

.data
    x:.int 100
    sum:.int 0
    counter:.int 0
    total:.int 0

.text
.globl _main

_main:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    jmp calc_sum
    leave
    ret

calc_sum:
    incl counter(%rip);
    movl x(%rip), %eax;
    cmpl counter(%rip), %eax;
    je endif1
    jmp check1
    jmp calc_sum
    leave
    ret
check1:
    movl counter(%rip), %eax;
    movl $0, %edx;
    movl $5, %ecx;
    idivl %ecx;
    cmpl $0, %edx;
    jne check2
    movl counter(%rip), %eax;
    addl %eax, total(%rip);
    jmp check2
    leave
    ret
 
check2:
    movl counter(%rip), %eax;
    movl $0, %edx;
    movl $3, %ecx;
    idivl %ecx;
    cmpl $0, %edx;
    jne calc_sum
    movl counter(%rip), %eax;
    addl %eax, total(%rip);
    jmp calc_sum
    leave
    ret

endif:
    movl total(%rip), %eax;   

    leave
    ret

endif1:
    movl total(%rip), %eax;
    leave
    ret