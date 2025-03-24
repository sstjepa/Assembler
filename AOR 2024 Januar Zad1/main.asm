.386
.model flat,c
.data
	E dd 20
	D dd 50
	A dw 3


.code 
main proc

	mov ecx, 16			;postavljamo maks obilazenja petlje
	xor eax, eax		;cistimo eax
	xor ebx, ebx		;cistimo ebx
	xor edx, edx		;cistimo edx

petlja1:
	
	mov eax, E
	mov edx, D
	cmp eax,edx			;poredim E sa D
	jg kraj				;ako je E vece od D skaci na kraj koda

	xor eax, eax
	movzx eax, A
	mov esi, 5
	mul esi				;to nam je E=5*A
	mov E, eax			;vracamo E u memoriju

	xor eax, eax
	xor esi, esi
	movzx eax, A
	shr eax,2			;delimo A sa 4
	mov ebx, E			;prebacujemo E u ebx
	shr ebx,3			;delimo E sa 8
	sub eax,ebx			;oduzimamo drugi od prvog
	mov ebx, D			;prebacujemo tu vrednost D-a u ebx
	sub ebx, eax		;oduzimamo te vrednosti i cuvamo D
	mov D, ebx			;vracamo D u memoriju

	mov eax, E
	inc eax				;uvecavamo ga za 1
	mov E, eax
	
	mov edi, 3
	div edi				;delimo iz eax sa 3
	inc eax				;zaokruzujemo na veci
	add eax,2			;dodajemo 2 na rezultat
	mov A, ax			;saljemo rezultat na memoriju A

loop petlja1

kraj:

ret

main endp
end main