.global bubblesort
bubblesort:
    # %rdi -> n
    # %rsi -> &a[0]

    # %r15 -> i
    # %r14 -> j
    movq %rdi, %r15
    subq $1, %r15

loop1:
    cmpq $-1, %r15
    je end
    movq $0, %r14
    
loop2:
    cmpq %r14, %r15
    je loop1_end
    # %r13 -> &a[j]
    # %r12 -> &a[j + 1]
    leaq (%rsi, %r14, 8), %r13
    movq %r13, %r12
    addq $8, %r12
    # %rdx -> a[j]
    # %rcx -> a[j + 1]
    movq (%r13), %rdx
    movq (%r12), %rcx
    cmpq %rdx, %rcx
    jl swap

loop2_end:
    incq %r14
    jmp loop2

loop1_end:
    decq %r15
    jmp loop1

swap:
    movq %rdx, (%r12)
    movq %rcx, (%r13)
    jmp loop2_end

end:
    movq %rsi, %rax
    ret




