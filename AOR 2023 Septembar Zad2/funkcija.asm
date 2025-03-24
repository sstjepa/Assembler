.386
.model flat,c
public funkcija
.code

funkcija proc
	push ebp
	mov ebp, esp
	pushfd
	push esi
	push edi

	mov eax, [ebp+8]			;adresa prvog elementa niza a
	xor edx, edx

	mov esi, -1
	petlja:
		inc esi
		mov bl, 32
		cmp [eax+esi], bl
		jne petlja

	mov ch, 0					;null terminated karakter za proveru
	gore:
		petlja2:
			inc esi
			cmp [eax+esi], bl
			je petlja2
		
		mov edi, esi
		dec edi					;pamti pozicija gde se upisuje max karakter
		xor edx, edx
		mov dl, [eax+esi]		;prvi proglasavamo za max
		petlja3:
			inc esi
			mov cl, [eax+esi]
			cmp cl, dl
			jl preskoci
			mov dl, [eax+esi]
			preskoci:
			cmp [eax+esi], ch
			je kraj
			cmp [eax+esi], bl
			jne petlja3
		kraj:
		mov byte ptr [eax+edi], dl
		cmp byte ptr [eax+esi], ch
		jne gore

	pop edi
	pop esi
	popfd
	pop ebp

	ret
funkcija endp
end