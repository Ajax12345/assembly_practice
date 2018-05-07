
.data
  x:.int 10

.text
.globl _main

_main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movl $10, %eax;
  cmpl x(%rip), %eax;
  jne else . #the opposite of what we really want to do
  addl $3, %eax; #body of if statement
  jmp endif
  leave
  ret

else:
  subl $5, %eax;
  leave
  ret

endif:
  leave
  ret
  

#equivalent to:
#int x = 10;
#int a = 10;
#if(x == a){
#	a += 3;
#}
#else{
#	a -= 5;
#}
