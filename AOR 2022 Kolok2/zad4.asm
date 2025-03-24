.386
.model flat,c
.stack 4096
.data
	niz dd 1,7,3,2,12,0,3,5,7,2
	n dd 10
	br dd ?

.code
main proc
;	xor eax,eax		;rezultat
;	xor ebx,ebx		;
;	lea edx, niz
;	mov ecx,n
;	dec ecx			;i<n-1
;
;	
;	petlja:
;		mov ebx,[edx]	;element od pocetka adrese pa se dodaje 4 za svaki sledeci
;		cmp ebx,0		;proveravamo da li je ebx 0
;		jne dalje
;
;		suma:
;			add edx, 4
;			add eax,[edx]
;			loop suma
;			mov br, eax
;			mov ecx,1 
			;
;	dalje:
;		add edx, 4
;		loop petlja

	xor eax,eax
	xor ebx,ebx
	xor ecx,ecx
	mov ecx, n
	dec ecx

	petlja:
		cmp niz[ebx],0
		jne dalje

		mov edx,ebx
		add edx,4
	
		sabiranje:
			add eax,niz[edx]
			add edx,4
			loop sabiranje
			mov ecx,1

		dalje:
			add ebx,4
			loop petlja
		
		kraj:
			mov br,eax
	ret

main endp
end main