.386
.model flat,c
.data
	mat dw 5,7,9
		dw 3,2,5
		dw 1,3,1
		dw 4,8,1
	n dw 3
	m dw 4
	rez dd ?
.code
main proc

	movzx esi,n
	shl esi,1
	sub esi,4 ; 2n-4
	movzx ebx,n
	shl ebx,1 ; 2n

	movzx edi, word ptr mat[ebx][esi]

	;postmatramo matricu kao niz sad
	movzx eax,n
	movzx ecx,m
	mul ecx
	mov ecx,eax

	xor ebx,ebx
	xor esi,esi
	petlja:
		movzx eax,word ptr mat[esi]
		cmp eax,edi
		jle dalje
		inc ebx
		dalje:
		add esi,2
		loop petlja

	mov rez,ebx

	nop
	ret
main endp
end main