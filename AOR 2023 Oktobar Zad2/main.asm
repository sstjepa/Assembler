.386
.model flat, c
.stack 4096
.data
	mat db "      addd"
	    db " aland    "
	    db "  najduza "				; indeks je 2
	    db "    rec   "
	n dd 4
	m dd 10
	rez dd ?

.code
najduza proc
	push ebp
	mov ebp, esp
	pushfd
	pushad

	mov ebx, [ebp+16]				;adresa pocetka niza
	mov ecx, [ebp+12]				;N
	
	xor dl, dl						;u DL maxduzina reci
	xor dh, dh						;u Dh indeks tren vrste
	xor edi, edi					;konacni rezutat

	slVrsta:
		xor esi,esi					;ide po kolonama j
		dec esi
			;preskoci blanko na pocetku
		idaljeBlanko:
			inc esi
			mov al, [ebx][esi]
			cmp al, 32
			je idaljeBlanko

		dec esi
		xor ah,ah
		idaljeSlova:
			inc esi
			mov al, [ebx][esi]
			inc ah
			cmp al, 32
			jne idaljeSlova

		dec ah					;da vrati u libelu jer petlja iznad doda jedan preko

		cmp ah, dl				;ako je duzina duza od najjduze 
		jle dalje
		mov dl, ah
		movzx edi, dh
		dalje:

		inc dh
		add ebx, [ebp+8]		;skok za M
		loop slVrsta

	mov [ebp+16], edi

	popad
	popfd
	pop ebp
	ret 8
najduza endp

main proc

	push offset mat
	push n
	push m

	call najduza

	pop eax
	mov rez, eax

	nop
	ret
main endp
end main