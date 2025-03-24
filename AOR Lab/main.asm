.386
.model flat,c
.data
	;n dw ?
	zbir dword ?
	niz byte 2,3,5,1,8,6,7,8,9,0
.code
	main proc
		
		;mov eax, [m]
		;test eax, 1
		;jz paran_broj
		;mov ecx, 22h
		;jmp kraj
		;paran_broj:
		;mov ebx, 69h
		;kraj:
		;ret


		mov ebx,0 ;koristimo ovo kao indeks i postavljamo ga na nulu
		xor eax,eax ;logicko postavljamo na nulu preko XOR

		petlja:
			cmp niz[ebx],0
			je kraj
			movsx ax, niz[ebx]
			test ax,1
			jz dole
			add zbir,ax
			add ebx, TYPE niz






		dole:
		ret
	main endp
	end main
