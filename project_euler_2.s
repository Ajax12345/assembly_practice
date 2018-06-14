

.data
    stop:.int 4003
    counter:.int 0
    running_total:.int 0
    a:.int 1
    b:.int 1

.text
.globl _main
_main:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    jmp create_process
    leave
    ret

create_process:
    incl counter(%rip)
    movl stop(%rip), %eax;
    cmpl counter(%rip), %eax;
    je endif
    jmp check_a
    jmp create_process
    leave
    ret

check_a:
    movl a(%rip), %eax;
    movl $2, %ecx;
    movl $0, %edx;
    idivl %ecx;
    cmpl $0, %edx;
    jne check_b
    movl a(%rip), %eax;
    addl %eax, running_total(%rip);
    jmp check_b
    leave
    ret

check_b:
    movl b(%rip), %eax;
    movl $2, %ecx;
    movl $0, %edx;
    idivl %ecx;
    cmpl $0, %edx;
    jne set_a_and_b
    movl b(%rip), %eax;
    addl %eax, running_total(%rip);
    jmp set_a_and_b
    leave
    ret

set_a_and_b:
    movl a(%rip), %eax;
    movl a(%rip), %edx;
    add b(%rip), %eax;
    movl %eax, a(%rip);
    movl %edx, b(%rip)
    jmp create_process
    leave 
    ret

endif:
    movl running_total(%rip), %eax;
    leave
    ret