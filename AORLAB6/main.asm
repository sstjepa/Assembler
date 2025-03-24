.386
.model flat,c
.data
    mat word 5,2,8,9, 7,4,6,4, 9,7,3,7, 7,3,2,2 ,6,1,8,8
    n dd 4
    m dd 5
    
    ;5,7,5,7,5
    ;5,4,5,3,5
    ;5,6,5,2,5
    ;5,4,5,2,5

.code
main proc
    
    mov ax, mat[0]
    mov esi, 0
        
p1:
    mov ebx, 0
    mov ecx, m
    inc ecx
    shr ecx, 1

p2:
    mov mat[ebx][esi*TYPE mat], ax
    add ebx, n
    add ebx, n
    add ebx, n
    add ebx, n
    loop p2
    
    add esi, 1
    cmp esi, n
    jl p1

ret
main endp
end main