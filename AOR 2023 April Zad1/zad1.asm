.386
.model	flat,c
.data	
	n dw 10
	kol dd ?
	

.code
main proc

	movzx ecx, n
	mov esi, ecx
	xor ebp, ebp

petlja1:
	mov ebx,ecx			;prebacujemo n u ebx
	dec ebx				;n-1

	mov eax,esi			;prebacujemo n u eax
	sub eax,ebx			;n-(n-1)

	mul ecx				;n*(n-(n-1))

	mov esp,ecx			;pomeramo ecx na cuvanje
		
	dec ecx				;u ecx stavljamo n-1	
	mov ebx, 1			;stavljamo u ebx 1 da bi mogli da napravimo 2^(n-1)

	cmp ecx,0
	je kraj
calculate:
	shl ebx, 1			;dizemo 1 na 2, n-1 puta zato imamo ovde loop
	loop calculate

kraj:
	div ebx				;delimo n*(n-(n-1)) sa 2^(n-1) koji se nalazi u ebx

	mov ecx,esp			;vracamo originalno ecx za petlju
	add ebp,eax			;izracunati deo sabiramo u ebp da bi dobili rezultat

loop petlja1			;zavrsavanje petlje
	
	mov eax, ebp		;pomeramo rezultat u eax da bi ga spremili za deljenje
	div esi				;delimo rezultat sa n
	mov kol, eax		;stavljamo rezultat u KOL
nop
ret

main endp	
end main