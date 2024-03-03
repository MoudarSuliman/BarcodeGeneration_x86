section .data

array:
 dd 212222
 dd 222122
 dd 222221
 dd 121223
 dd 121322 
 dd 131222
 dd 122213
 dd 122312
 dd 132212
 dd 221213
 dd 221312
 dd 231212
 dd 112232
 dd 122132
 dd 122231
 dd 113222 
 dd 123122
 dd 123221 
 dd 223211
 dd 221132
 dd 221231
 dd 213212
 dd 223112
 dd 312131
 dd 311222
 dd 321122
 dd 321221 
 dd 312212
 dd 322112
 dd 322211
 dd 212123
 dd 212321
 dd 232121
 dd 111323
 dd 131123
 dd 131321 
 dd 112313
 dd 132113
 dd 132311
 dd 211313
 dd 231113
 dd 231311
 dd 112133
 dd 112331
 dd 132131 
 dd 113123
 dd 113321
 dd 133121
 dd 313121
 dd 211331
 dd 231131
 dd 213113
 dd 213311
 dd 213131 
 dd 311123
 dd 311321
 dd 331121
 dd 312113
 dd 312311
 dd 332111
 dd 314111
 dd 221411
 dd 431111 
 dd 111224
 dd 111422
 dd 121124
 dd 121421
 dd 141122
 dd 141221
 dd 112214
 dd 112412
 dd 122114 
 dd 122411
 dd 142112
 dd 142211
 dd 241211
 dd 221114
 dd 413111
 dd 241112
 dd 134111
 dd 111242 
 dd 121142
 dd 121241
 dd 114212
 dd 124112
 dd 124211
 dd 411212
 dd 421112
 dd 421211
 dd 212141 
 dd 214121
 dd 412121
 dd 111143
 dd 111341
 dd 131141
 dd 114113
 dd 114311
 dd 411113
 dd 411311 
 dd 113141
 dd 114131
 dd 311141
 dd 411131
 dd 211412
 dd 211214
 dd 211232
 dd 233111

array2:
db ' '
db '!'
db '"'
db '#'
db '$'
db '%'
db '&'
db '''
db '('
db ')'
db '*'
db '+'
db ','
db '-'
db '.'
db '/'
db '0'
db '1'
db '2'
db '3'
db '4'
db '5'
db '6'
db '7'
db '8'
db '9'
db ':'
db ';'
db '<'
db '='
db '>'
db '?'
db '@'
db 'A'
db 'B',
db 'C'
db 'D'
db 'E'
db 'F'
db 'G'
db 'H'
db 'I'
db ' '
db 'K' 
db 'L'
db 'M'
db 'N'
db 'O'
db 'P'
db 'Q'
db 'R'
db 'S'
db 'T' 
db 'U'
db 'V'
db 'W'
db 'X'
db 'Y'
db 'Z'
db '['
db '\'
db ']'
db '^', 
db '_'
db ' '
db 'a'
db 'b'
db 'c'
db 'd'
db 'e'
db 'f'
db 'g', 
db 'h'
db 'i'
db 'j'
db 'k'
db 'l'
db 'm'
db 'n'
db 'o'
db 'p'
db 'q'
db 'r'
db 's'
db 't'
db 'u'
db 'v'
db 'w'
db 'x'
db 'y' 
db 'z'
db '{'
db '|'
db '}'
db '~'
db ' '
db ' '
db ' '
db ' '
db ' '
db ' '
db ' '
db ' '
db ' '
db ' '
db ' '
db ' '
db ' '

%define image 	 [ebp+8]     ; Pointer to a image (1st argument)
%define line	 [ebp+12]    ; Pointer to a line (2nd argument)
%define input	 [ebp+16]    ; Pointer to the input (3rd argument)
%define width	 1800        ; Number of pixels * 3bytes (RGB)
%define width_pixels 600      ; Number of pixels
%define array_size 107          ; Size of the array 
%define bar_width [ebp-4]
	
section .text
	global encode128
	extern printf
encode128:	
        push    ebp
        mov     ebp, esp
        sub     esp, 52
            
        push    ecx
        push    ebx
        push    esi
        push    edi
        
	mov    eax, image
	mov    ecx, width
	imul   ecx, line
	add    eax, ecx      ; Here we move EAX to the begining of the scane place. 
        ; After above operations:
        ; EAX  -> image ( first pixel in scanned line)
        ; Cleaning registers:
	xor    ecx, ecx	     ; ECX = 0
	xor    edi, edi       ; EDI = 0
	xor    ebx, ebx       ; EBX = 0
	xor    bh, bh         ; BH = 0
	mov    esi, input    ; Array of chars to the ESI register

iterate:
	mov ebx, [array2+4*ecx]
	cmp esi, ebx
	je encode
	inc ecx
	cmp ecx , array_size
	je exit
	jmp iterate

encode:
	
	mov    bl, [array+ecx]
	mov    BYTE[edx], bl
	inc    edx
	inc esi
	cmp BYTE[esi] , 0
	je exit
	jmp iterate



exit:
        ;Return value 1 
        mov     eax, edx
        pop    edi
        pop    esi
        pop    ebx
        pop    ecx
		pop 	edx

        mov    esp, ebp
        pop    ebp
        ret
   	
  
