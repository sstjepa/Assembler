.386
.model flat,c
.data
	;n dw ?
	zbir dw ?
	niz db 0,2,3,5,1,8,6,7,8,9,0 ;brojimo samo neparne brojeve po vrednosti
.code
main proc
	lea esi, niz	;ucitavamo adresu niza
	xor eax, eax	;logicko postavljamo na nulu preko XOR

	petlja:
			lodsb			;logičkom operacijom smestamo clan u ax
			cmp ax,0		;proveravamo da li je prvi element nula
			je kraj				;ako jeste skacemo na kraj
			movsx ax, al
			test ax, 1			;proveravamo da li je broj paran
			jz dalje			;ako jeste preskacemo sledeci korak 
			add zbir,ax			;ako je neparan dodajemo ga zbiru
	dalje:	
			jmp petlja
	kraj:
	ret
main endp
end main