.global insertionsort
insertionsort:
    # %rdi -> n
    # %rsi -> &arr[0]
    
    # %r15 -> i
    movq $1, %r15

loop1:
    cmpq %r15, %rdi
    je inter
    # %rdx -> key = arr[i]
    movq (%rsi, %r15, 8), %rdx
    # %r14 -> j
    movq %r15, %r14
    decq %r14

loop2:
    cmpq $-1, %r14
    je condition1_not_satisfied
    # %r13 -> &arr[j]
    leaq (%rsi, %r14, 8), %r13
    cmpq (%r13), %rdx
    jg condition2_not_satisfied

    # %r13 -> &arr[j]
    # %r12 -> &arr[j + 1]
    movq %r13, %r12
    addq $8, %r12
    # %r11 -> arr[j]
    # %r10 -> arr[j + 1]
    movq (%r13), %r11
    movq (%r12), %r10
    movq %r11, (%r12)

    decq %r14
    jmp loop2

loop1_end:
    incq %r14
    # %r13 -> &arr[j + 1]
    leaq (%rsi, %r14, 8), %r13
    movq %rdx, (%r13)

    incq %r15
    jmp loop1


condition1_not_satisfied:
    jmp loop1_end
    
condition2_not_satisfied:
    jmp loop1_end

inter:
    ret


