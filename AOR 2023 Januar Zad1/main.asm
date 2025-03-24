.386 
.model flat,c
.data

	X dd 20
	N dw 10
	K db 4


.code
main proc

	movzx ecx, N
	movzx esi, K
	sub ecx, esi	;broj prolazaka kroz petlju (N-K=10-4=6)

	mov ebp, 00001111b	;prebacujemo broj za anuliranje
	mov esp, 11110000b	;prebacujemo za komplementiranje

	xor edi, edi	;praznimo edi za cuvanje rezultata

petlja:
	
	mov edx, esi	;prebacujem k iz esi u edx

	and edx,ebp		;operacija nad k izvrsena i ostaje u edx
	shl edx,1		;mnozenje k sa 2

	mov eax, X
	sub eax, edx	;gornji deo izraza

	mov edx, esi	;ponovo pocetno k
	xor edx, esp	;operacija xor bajo 
	shl edx,1		;mnozenje sa 2

	mov ebx, X
	add ebx, edx	;donji deo izraza imamo sacuvan u ebx

	div ebx			;delimo gornji i donji deo izraza
	
	add edi,eax
	
	inc esi
loop petlja
	

kraj:


ret
main endp
end main