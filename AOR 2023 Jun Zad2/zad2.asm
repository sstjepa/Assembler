.386
.model flat,c
.stack 4096
.data
	mat dd 1, 1, 1, 9
		dd 1, 1, 5, 1
		dd 1, 7, 1, 1
		dd 10, 1, 1, 1

	n dd 4

.code
sort proc
	push ebp
	mov ebp, esp
	pushfd
	pushad

	mov ecx, [ebp+8]		;upisujem N
	spoljna:
		push ecx
		mov esi, [ebp+12]	;adresa prvog elementa niza
		mov ecx, [ebp+8]
		dec ecx
		unutrasnja:
			mov eax, [esi]
			mov ebx, [esi][4]
			cmp eax, ebx
			jng dalje
			mov [esi][4], eax
			mov [esi], ebx
			dalje:
			add esi, 4
		loop unutrasnja

		pop ecx
	loop spoljna

	popad
	popfd
	pop ebp
	ret 8				;ret 8 zbog oslobadjanja steka da uradimo pop eax
sort endp

main proc
	;stavljamo sporednu dijagonalu u prvu vrstu
	mov ebx, n
	shl ebx, 2
	sub ebx, 4			;u EBX skok koji je 4*n-4 za prolazak kroz sporednu dijag

	mov eax, n
	mul eax
	shl eax, 2
	sub eax, ebx
	sub eax, 4
	push eax			;push eax tu je element kojj je skroz dole levo 

	xor esi, esi
	mov ecx, n

	petlja:
		mov edx, mat[eax]	;uzimam vrednost sporedne dijag
		mov edi, mat[esi]	;uzimam vrednost prve vrste
		mov mat[eax], edi	
		mov mat[esi], edx	;rotiram im vrednost

		sub eax, ebx		;smanjujem lokaciju u dijagonali za skok
		add esi, 4			;povecavam adresu prve vrste
	loop petlja

	push offset mat
	push n

	call sort
		
	pop eax					;vracamo zbog elementa koji je prvi na dijagonali 
	xor esi, esi			;cistimo esi
	mov ecx, n				;
	;vracamo stvari iz prve vrste u sporednu dijagonalu
	petlja1:
		mov edx, mat[eax]
		mov edi, mat[esi]
		mov mat[eax], edi
		mov mat[esi], edx

		sub eax, ebx
		add esi, 4
	loop petlja1

	nop
	ret
main endp
end main
