.386
.model flat,c
.stack 4096
public zameni
.code
zameni proc
	push ebp
	mov ebp,esp
	pushfd
	push ecx

	mov ebx, [ebp+12]	; u EBX adresa niza
	mov ecx, [ebp+8]	; vrednost N

	mov edi, [ebp+16]	; adresa pocetnog 
	mov edx, [edi]		;x
	mov esi, [ebp+20]	; adresa kraja
	mov eax, [esi]		;y

	mov edi, [ebp+24]	;adresa zamenski

	xor esi,esi
	petlja:
		cmp edx,[ebx][esi]
		jge dalje
		cmp eax,[ebx][esi]
		jle dalje
		push eax
		mov eax,[edi]
		mov	[ebx][esi],eax
		pop eax
	dalje:
		add esi,4
	loop petlja
		
	pop ecx
	popfd
	pop ebp

	ret
zameni endp
end