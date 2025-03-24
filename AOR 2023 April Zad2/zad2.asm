.386
.model flat, c
.stack 4096
.data
	;matrica uneta po kolonama
	mat dw 1, 4, 7, 10, 2, 5, 1, 11, 3, 6, 9, 12
	n	dd 4
	m	dd 3

	;	matrica je matematicki:
	;	1 2 3
	;	4 5 6
	;	7 1 9		; ocekujemo samo 7 i 9 da se promene
	;	10 11 12

.code
prosek proc
	push ebp
	mov ebp, esp
	pushfd
	pushad

	mov esi, [ebp+12]	;adresa pocetka niza
	mov ecx, [ebp+8]	;broj elemenata - N

	xor eax,eax
	petlja1:
		movzx edx, word ptr [esi]
		add eax, edx
		add esi, 2		;dodajemo 2 jer nam je 16 bitno pa da preskacemo
	loop petlja1

	xor edx, edx
	mov ebx, n			
	div ebx				;delimo sumu sa n da bi dovili prosek

	mov [ebp+12], eax	;prebacujemo resenj na mesto adrese pocetka niza jer ne treba

	popad
	popfd
	pop ebp
	ret	4				;radimo ret 4 da bi oslobodili 4 bajta gde se nalazi n
prosek endp

main proc
	
	mov esi, 4		;zbog unosa po kolonama 3.vrsta je uvek esi=4
	xor ebx, ebx

	mov edx, n
	shl edx, 1		;skok je 2*n jer sa 2*n na ebx krece nova kolona

	mov ecx, m		;obilazimo ovo sve m puta jer imamo samo 3 kolone

	petlja:
		lea eax, mat[ebx]
		push eax
		push n

		call prosek

		pop eax		;zbog ret 4 mozemo sad slobodno da vratimo prosek sa pop

		cmp mat[esi+ebx], ax
		jng	dalje
		mov mat[esi+ebx], ax

		dalje:
			add ebx, edx	;dodajemo skok na ebx
	loop petlja

	nop
	ret
main endp
end main
