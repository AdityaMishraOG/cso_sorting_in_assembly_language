.global selectionsort
selectionsort:
    # %rdi -> n
    # %rsi -> &arr[0]

    # %r15 -> i
    movq $0, %r15
    # %rdx -> n - 1
    movq %rdi, %rdx
    decq %rdx
    
loop1:
    cmpq %r15, %rdi
    je inter
    # %r14 -> j
    movq %r15, %r14
    incq %r14
    # %r13 -> min_index
    movq %r15, %r13

loop2:
    cmpq %r14, %rdi
    je loop1_end
    # %r12 -> &arr[j]
    leaq (%rsi, %r14, 8), %r12
    # %r11 -> &arr[min_index]
    leaq (%rsi, %r13, 8), %r11

    # %r10 -> arr[j]
    # %r9 -> arr[min_index]
    movq (%r12), %r10
    movq (%r11), %r9
    cmpq %r10, %r9
    jg update_min_index

loop2_end:
    incq %r14
    jmp loop2

loop1_end:

    cmpq %r15, %r13
    jne swap # min_index has changed
loop1_end2:
    incq %r15
    jmp loop1

update_min_index:
    movq %r14, %r13
    jmp loop2_end

swap:
    # %r12 -> &arr[i]
    # %r11 -> &arr[min_index]
    leaq (%rsi, %r15, 8), %r12
    leaq (%rsi, %r13, 8), %r11
    # %r8 -> arr[i]
    # %r9 -> arr[min_index]
    movq (%r12), %r8
    movq (%r11), %r9

    movq %r8, (%r11)
    movq %r9, (%r12)
    jmp loop1_end2

inter:
    ret







