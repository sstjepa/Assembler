.386
.model flat,c
.stack 4096
.data
	niz dd 10 dup(?)
	mat dd 5,7
		dd 3,1
		dd 9,4
		dd 2,5
	n dd 4

.code
max proc
	push ebp
	mov ebp,esp
	pushad
	pushfd

	cmp eax,edx
	jg dalje
	mov eax,edx
	dalje:
		mov edx,[ebp+8]
		mov [edx],eax

	popfd
	popad
	pop ebp
	ret 4

max endp
main proc
	lea esi,niz
	xor ebx,ebx
	mov ecx,n
	petlja:
		mov eax, mat[ebx]
		mov edx, mat[ebx][4]
		push esi

		call max

		add esi,4
		add ebx,8
		loop petlja


	nop
	ret
main endp
end main