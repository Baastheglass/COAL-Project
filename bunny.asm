[org 0x0100]

jmp preStart
;jmp start
; startscreensquare

ssrow: dw 8
sscol: dw 18
sscolor: dw 0x70
sslength: dw 26
ssheight: dw 10


; startscreensquareBACKGROUND

Bsrow: dw 7
Bscol: dw 16
Bscolor: dw 0x60
Bslength: dw 28
Bsheight: dw 12



BBsrow: dw 6
BBscol: dw 14
BBscolor: dw 0x3B
BBslength: dw 30
BBsheight: dw 14

BBBsrow: dw 5
BBBscol: dw 12
BBBscolor: dw 0x5A
BBBslength: dw 32
BBBsheight: dw 16


;EndScreen
Esrow: dw 10
Escol: dw 26
Escolor: dw 0x70
Eslength: dw 15
Esheight: dw 4




;car bottoms
row: dw 14
col: dw 33
color: dw 0x40
width: dw 6
height: dw 2

; car head
length: dw 3
carTopRow: dw 12
carTopCol: dw 36
carTopColor: dw 0x40
carTopHeight: dw 2

; car window
winlength: dw 2
carwRow: dw 13
carwCol: dw 37
carwColor: dw 0x0
carwHeight: dw 1

;parameters of tyre 1
t1length: dw 1
t1row: dw 16
t1col: dw 34
t1color: dw 0x70

;parameters of tyre 2
t2length: dw 1
t2row: dw 16
t2col: dw 42
t2color: dw 0x70

; road lines
roadlines1length: dw 6
roadlines1Row: dw 13
roadlines1Col: dw 10
roadlines1Color: dw 0xFF
roadlines1Height: dw 1

; road lines
roadlines2length: dw 6
roadlines2Row: dw 13
roadlines2Col: dw 60
roadlines2Color: dw 0xFF
roadlines2Height: dw 1

;Parameters of Building1
b1length: dw 5
b1height: dw 9
b1row: dw 1
b1col: dw 1
b1color: dw 0x70

;Parameters of Building2
b2length: dw 5
b2height: dw 7
b2row: dw 3
b2col: dw 12
b2color: dw 0x70

;Parameters of Building3
b3length: dw 4
b3height: dw 8
b3row: dw 2
b3col: dw 23
b3color: dw 0x70

;Parameters of Building4
b4length: dw 6
b4height: dw 6
b4row: dw 4
b4col: dw 32
b4color: dw 0x70

;Parameters of Building5
b5length: dw 6
b5height: dw 7
b5row: dw 3
b5col: dw 45
b5color: dw 0x70

;Parameters of Building6
b6length: dw 5
b6height: dw 8
b6row: dw 2
b6col: dw 58
b6color: dw 0x70

;Parameters of Building7
b7length: dw 5
b7height: dw 6
b7row: dw 4
b7col: dw 69
b7color: dw 0x70

;parameters of window
wlength: dw 1
wrow: dw 2
wcol: dw 2
wcolor: dw 0x5A

;parameters of window2
w2length: dw 1
w2row: dw 4
w2col: dw 13
w2color: dw 0x6A

;parameters of window3
w3length: dw 1
w3row: dw 3
w3col: dw 24
w3color: dw 0x2A

;parameters of window4
w4length: dw 1
w4row: dw 5
w4col: dw 33
w4color: dw 0x3B

;parameters of window5
w5length: dw 1
w5row: dw 4
w5col: dw 46
w5color: dw 0xDA

;parameters of window6
w6length: dw 1
w6row: dw 3
w6col: dw 59
w6color: dw 0x00

;parameters of window7
w7length: dw 1
w7row: dw 5
w7col: dw 70
w7color: dw 0x2A

;parameters of UFO Top
bflength: dw 1
bfrow: dw 22
bfcol: dw 37
bfcolor: dw 0x10
bfdir: dw 0

;parameters of UFO body
bblength: dw 2
bbheight: dw 1
bbrow: dw 23
bbcol: dw 36
bbcolor: dw 0x70

;parameters of brick1
brlength: dw 6
brheight: dw 1
brrow: dw 24
brcol: dw 32
brcolor: dw 0x40
brdir: dw 1

;parameters of brick2
br2length: dw 6
br2height: dw 1
br2row: dw 20
br2col: dw 32
br2color: dw 0x50
br2dir: dw 0

;parameters of carrot
c3length: dw 1
c3row: dw 19
c3col: dw 34
c3color: dw 0x20

;parameters of score
scoretext: db 'Score: '
scoretextlen : dw 7
score: db 0

;flags
scrollflag: dw 0
carrotflag: dw 0

;tickCount
tickCount: dw 0
 
clrscr:
	push ax
	push es
	push di
	mov ax, 0xb800
	mov es, ax
	mov di, 0
	clrloop:
		mov word[es:di], 0x0720
		add di, 2
		cmp di, 4000
		jne clrloop
	pop di
	pop es
	pop ax
	ret

delay:
	push cx
	
	mov cx, 0xFFFF
	delayloop1:
		loop delayloop1
	mov cx, 0xFFFF
	delayloop2:
		loop delayloop2
	pop cx
	ret

printstr:	
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di

	mov ax, 0xb800
	mov es, ax				; point es to video base

	mov di, 3024				; point di to required location
	mov si, [bp + 6]			; point si to string
	mov cx, [bp + 4]			; load length of string in cx
	mov ah, [bp + 8]			; load attribute in ah

nextchar:	
	mov al, [si]			; load next char of string
	mov [es:di], ax			; show this char on screen
	add di, 2				; move to next screen location
	add si, 1				; move to next char in string
	loop nextchar			; repeat the operation cx times

	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 6
	
screendivider1:
	push ax
	push es
	push di
	mov ax, 0xb800
	mov es, ax
	mov di, 1280
	loop:
		mov word[es:di], 0x075F
		add di, 2
		cmp di, 1440
		jne loop
	pop di
	pop es
	pop ax
	ret
screendivider2:
	push ax
	push es
	push di
	mov ax, 0xb800
	mov es, ax
	mov di, 2560
	loop1:
		mov word[es:di], 0x075F
		add di, 2
		cmp di, 2720
		jne loop1
	pop di
	pop es
	pop ax
	ret

printSky:
	push ax
	push es
	push di
	mov ax, 0xb800
	mov es, ax
	mov di, 0
	sloop:
		mov word[es:di], 0x1020
		add di, 2
		cmp di, 1600
		jne sloop
	pop di
	pop es
	pop ax
	ret

printroad:
	push ax
	push es
	push di
	mov ax, 0xb800
	mov es, ax
	mov di, 1600
	rloop:
		mov word[es:di], 0x0020
		add di, 2
		cmp di, 2720
		jne rloop
	bloop:
		mov word[es:di], 0x075F
		add di, 2
		cmp di, 2880
		jne bloop
	pop di
	pop es
	pop ax
	ret

Stars:
	push ax
	push es
	push di
	mov ax, 0xb800
	mov es, ax
	mov di, 0
	loope:
		mov word[es:di], 0x1E2A
		add di, 8
		cmp di, 160
		jne loope
	mov di, 320
	loop2:
		mov word[es:di], 0x1E2A
		add di, 8
		cmp di, 480
		jne loop2
	mov di, 640
	loop3:
		mov word[es:di], 0x1E2A
		add di, 8
		cmp di, 800
		jne loop3
	mov di, 960
	pop di
	pop es
	pop ax
	ret

printSquare:
	push bp
	mov bp, sp
	push ax
	push es
	push di
	push cx
	push dx
	push bx
	
	mov ax, 0xb800
	mov es, ax
	mov al, 80
	mul byte[bp + 8]
	add ax, [bp + 6]
	shl ax, 1
	mov di, ax
	mov cx, [bp + 4]
	mov dx, [bp + 4]
	mov bx, [bp + 4]
	shl bx, 2
	shl cx, 1
	mov ah, [bp + 10]
	mov al, 0x20
	outerloop:
		innerloop:
			mov word[es:di], ax
			add di, 2
			sub cx, 1
			jnz innerloop
			
		add di, 160
		mov cx, [bp + 4]
		shl cx, 1
		sub di, bx
		sub dx, 1
		jnz outerloop
		
	pop bx
	pop dx	
	pop cx
	pop di
	pop es
	pop ax
	pop bp
	ret 8

printRectangle:
	push bp
	mov bp, sp
	push ax
	push es
	push di
	push cx
	push dx
	push bx
	
	mov ax, 0xb800
	mov es, ax
	mov al, 80
	mul byte[bp + 8]
	add ax, [bp + 6]
	shl ax, 1
	mov di, ax
	mov cx, [bp + 4]
	mov dx, [bp + 12]
	mov bx, [bp + 4]
	shl bx, 2
	shl cx, 1
	mov ah, [bp + 10]
	mov al, 0x20
	outerlooprect:
		innerlooprect:
			mov word[es:di], ax
			add di, 2
			sub cx, 1
			jnz innerlooprect
			
		add di, 160
		mov cx, [bp + 4]
		shl cx, 1
		sub di, bx
		sub dx, 1
		jnz outerlooprect
	mov si, di
	
	pop bx
	pop dx	
	pop cx
	pop di
	pop es
	pop ax
	pop bp
	ret 10

printCAR:
	push ax
	mov ax, [carTopHeight]; bp + 12
	push ax
	mov ax, [carTopColor]; bp + 10
	push ax 
	mov ax, [carTopRow]; bp + 8
	push ax
	mov ax, [carTopCol]; bp + 6
	push ax
	push word[length]; bp + 4
	call printRectangle
	
	mov ax, [height]; bp + 12
	push ax
	mov ax, [color]; bp + 10
	push ax 
	mov ax, [row]; bp + 8
	push ax
	mov ax, [col]; bp + 6
	push ax
	push word[width]; bp + 4
	call printRectangle
	
	mov ax, [carwHeight]; bp + 12
	push ax
	mov ax, [carwColor]; bp + 10
	push ax 
	mov ax, [carwRow]; bp + 8
	push ax
	mov ax, [carwCol]; bp + 6
	push ax
	push word[winlength]; bp + 4
	call printRectangle
	
	
	mov ax, [t1color];bp + 10
	push ax 
  	mov ax, [t1row]; bp + 8
	push ax
	mov ax, [t1col]; bp + 6
	push ax
	mov ax, [t1length]
	push ax; bp + 4
	call printSquare
	

	mov ax, [t2color];bp + 10
	push ax 
  	mov ax, [t2row]; bp + 8
	push ax
	mov ax, [t2col]; bp + 6
	push ax
	mov ax, [t2length]
	push ax; bp + 4
	call printSquare
	
	pop ax
	ret

Roadlines1:
    push ax
	mov ax, [roadlines1Height]; bp + 12
	push ax
	mov ax, [roadlines1Color]; bp + 10
	push ax 
	mov ax, [roadlines1Row]; bp + 8
	push ax
	mov ax, [roadlines1Col]; bp + 6
	push ax
	push word[roadlines1length]; bp + 4
	call printRectangle
	
	pop ax
	ret
	 
Roadlines2:
       push ax
	mov ax, [roadlines2Height]; bp + 12
	push ax
	mov ax, [roadlines2Color]; bp + 10
	push ax 
	mov ax, [roadlines2Row]; bp + 8
	push ax
	mov ax, [roadlines2Col]; bp + 6
	push ax
	push word[roadlines2length]; bp + 4
	call printRectangle
	
	pop ax
	ret

Building1:
	push ax
	mov ax, [b1height]
	push ax
	mov ax, [b1color];bp + 10
	push ax 
    mov ax, [b1row]; bp + 8
	push ax
	mov ax, [b1col]; bp + 6
	push ax
	mov ax, [b1length]
	push ax; bp + 4
	call printRectangle
    
	;window1
	mov ax, [wcolor];bp + 10
	push ax 
  	mov ax, [wrow]; bp + 8
	push ax
	mov ax, [wcol]; bp + 6
	push ax
	mov ax, [wlength]
	push ax; bp + 4
	call printSquare
	
	;window2
	mov ax, [wcol]
	add ax, 6
	mov [wcol], ax
	mov ax, [wcolor];bp + 10
	push ax 
  	mov ax, [wrow]; bp + 8
	push ax
	mov ax, [wcol]; bp + 6
	push ax
	mov ax, [wlength]
	push ax; bp + 4
	call printSquare
	
	;window3
	mov ax, [wcol]
	sub ax, 6
	mov [wcol], ax
	mov ax, [wrow]
	add ax, 2
	mov [wrow], ax
	mov ax, [wcolor];bp + 10
	push ax 
  	mov ax, [wrow]; bp + 8
	push ax
	mov ax, [wcol]; bp + 6
	push ax
	mov ax, [wlength]
	push ax; bp + 4
	call printSquare
	
	;window4
	mov ax, [wcol]
	add ax, 6
	mov [wcol], ax
	mov ax, [wcolor];bp + 10
	push ax 
  	mov ax, [wrow]; bp + 8
	push ax
	mov ax, [wcol]; bp + 6
	push ax
	mov ax, [wlength]
	push ax; bp + 4
	call printSquare
	
	;window5
	mov ax, [wcol]
	sub ax, 6
	mov [wcol], ax
	mov ax, [wrow]
	add ax, 2
	mov [wrow], ax
	mov ax, [wcolor];bp + 10
	push ax 
  	mov ax, [wrow]; bp + 8
	push ax
	mov ax, [wcol]; bp + 6
	push ax
	mov ax, [wlength]
	push ax; bp + 4
	call printSquare
	
	;window6
	mov ax, [wcol]
	add ax, 6
	mov [wcol], ax
	mov ax, [wcolor];bp + 10
	push ax 
  	mov ax, [wrow]; bp + 8
	push ax
	mov ax, [wcol]; bp + 6
	push ax
	mov ax, [wlength]
	push ax; bp + 4
	call printSquare
	
	;window7
	mov ax, [wcol]
	sub ax, 6
	mov [wcol], ax
	mov ax, [wrow]
	add ax, 2
	mov [wrow], ax
	mov ax, [wcolor];bp + 10
	push ax 
  	mov ax, [wrow]; bp + 8
	push ax
	mov ax, [wcol]; bp + 6
	push ax
	mov ax, [wlength]
	push ax; bp + 4
	call printSquare
	
	;window8
	mov ax, [wcol]
	add ax, 6
	mov [wcol], ax
	mov ax, [wcolor];bp + 10
	push ax 
  	mov ax, [wrow]; bp + 8
	push ax
	mov ax, [wcol]; bp + 6
	push ax
	mov ax, [wlength]
	push ax; bp + 4
	call printSquare
	pop ax
	ret	

Building2:
	push ax
	mov ax, [b2height]
	push ax
	mov ax, [b2color];bp + 10
	push ax 
    mov ax, [b2row]; bp + 8
	push ax
	mov ax, [b2col]; bp + 6
	push ax
	mov ax, [b2length]
	push ax; bp + 4
	call printRectangle	
	
	;window1
	mov ax, [w2color];bp + 10
	push ax 
  	mov ax, [w2row]; bp + 8
	push ax
	mov ax, [w2col]; bp + 6
	push ax
	mov ax, [w2length]
	push ax; bp + 4
	call printSquare
	
	;window2
	mov ax, [w2col]
	add ax, 6
	mov [w2col], ax
	mov ax, [w2color];bp + 10
	push ax 
  	mov ax, [w2row]; bp + 8
	push ax
	mov ax, [w2col]; bp + 6
	push ax
	mov ax, [w2length]
	push ax; bp + 4
	call printSquare
	
	;window3
	mov ax, [w2col]
	sub ax, 6
	mov [w2col], ax
	mov ax, [w2row]
	add ax, 2
	mov [w2row], ax
	mov ax, [w2color];bp + 10
	push ax 
  	mov ax, [w2row]; bp + 8
	push ax
	mov ax, [w2col]; bp + 6
	push ax
	mov ax, [w2length]
	push ax; bp + 4
	call printSquare
	
	;window4
	mov ax, [w2col]
	add ax, 6
	mov [w2col], ax
	mov ax, [w2color];bp + 10
	push ax 
  	mov ax, [w2row]; bp + 8
	push ax
	mov ax, [w2col]; bp + 6
	push ax
	mov ax, [w2length]
	push ax; bp + 4
	call printSquare
	
	;window5
	mov ax, [w2col]
	sub ax, 6
	mov [w2col], ax
	mov ax, [w2row]
	add ax, 2
	mov [w2row], ax
	mov ax, [w2color];bp + 10
	push ax 
  	mov ax, [w2row]; bp + 8
	push ax
	mov ax, [w2col]; bp + 6
	push ax
	mov ax, [w2length]
	push ax; bp + 4
	call printSquare
	
	;window6
	mov ax, [w2col]
	add ax, 6
	mov [w2col], ax
	mov ax, [w2color];bp + 10
	push ax 
  	mov ax, [w2row]; bp + 8
	push ax
	mov ax, [w2col]; bp + 6
	push ax
	mov ax, [w2length]
	push ax; bp + 4
	call printSquare
	
	pop ax
	ret
	
Building3:
	push ax
	mov ax, [b3height]
	push ax
	mov ax, [b3color];bp + 10
	push ax 
    mov ax, [b3row]; bp + 8
	push ax
	mov ax, [b3col]; bp + 6
	push ax
	mov ax, [b3length]
	push ax; bp + 4
	call printRectangle
    
	;window1
	mov ax, [w3color];bp + 10
	push ax 
  	mov ax, [w3row]; bp + 8
	push ax
	mov ax, [w3col]; bp + 6
	push ax
	mov ax, [w3length]
	push ax; bp + 4
	call printSquare
	
	;window2
	mov ax, [w3col]
	add ax, 4
	mov [w3col], ax
	mov ax, [w3color];bp + 10
	push ax 
  	mov ax, [w3row]; bp + 8
	push ax
	mov ax, [w3col]; bp + 6
	push ax
	mov ax, [w3length]
	push ax; bp + 4
	call printSquare
	
	;window3
	mov ax, [w3col]
	sub ax, 4
	mov [w3col], ax
	mov ax, [w3row]
	add ax, 2
	mov [w3row], ax
	mov ax, [w3color];bp + 10
	push ax 
  	mov ax, [w3row]; bp + 8
	push ax
	mov ax, [w3col]; bp + 6
	push ax
	mov ax, [w3length]
	push ax; bp + 4
	call printSquare
	
	;window4
	mov ax, [w3col]
	add ax, 4
	mov [w3col], ax
	mov ax, [w3color];bp + 10
	push ax 
  	mov ax, [w3row]; bp + 8
	push ax
	mov ax, [w3col]; bp + 6
	push ax
	mov ax, [w3length]
	push ax; bp + 4
	call printSquare
	
	;window5
	mov ax, [w3col]
	sub ax, 4
	mov [w3col], ax
	mov ax, [w3row]
	add ax, 2
	mov [w3row], ax
	mov ax, [w3color];bp + 10
	push ax 
  	mov ax, [w3row]; bp + 8
	push ax
	mov ax, [w3col]; bp + 6
	push ax
	mov ax, [w3length]
	push ax; bp + 4
	call printSquare
	
	;window6
	mov ax, [w3col]
	add ax, 4
	mov [w3col], ax
	mov ax, [w3color];bp + 10
	push ax 
  	mov ax, [w3row]; bp + 8
	push ax
	mov ax, [w3col]; bp + 6
	push ax
	mov ax, [w3length]
	push ax; bp + 4
	call printSquare
	
	pop ax
	ret	

Building4:
	push ax
	mov ax, [b4height]
	push ax
	mov ax, [b4color];bp + 10
	push ax 
    mov ax, [b4row]; bp + 8
	push ax
	mov ax, [b4col]; bp + 6
	push ax
	mov ax, [b4length]
	push ax; bp + 4
	call printRectangle
    
	;window1
	mov ax, [w4color];bp + 10
	push ax 
  	mov ax, [w4row]; bp + 8
	push ax
	mov ax, [w4col]; bp + 6
	push ax
	mov ax, [w4length]
	push ax; bp + 4
	call printSquare
	
	;window2
	mov ax, [w4col]
	add ax, 4
	mov [w4col], ax
	mov ax, [w4color];bp + 10
	push ax 
  	mov ax, [w4row]; bp + 8
	push ax
	mov ax, [w4col]; bp + 6
	push ax
	mov ax, [w4length]
	push ax; bp + 4
	call printSquare
	
	;window3
	mov ax, [w4col]
	add ax, 4
	mov [w4col], ax
	mov ax, [w4color];bp + 10
	push ax 
  	mov ax, [w4row]; bp + 8
	push ax
	mov ax, [w4col]; bp + 6
	push ax
	mov ax, [w4length]
	push ax; bp + 4
	call printSquare
	
	;window4
	mov ax, [w4col]
	sub ax, 8
	mov [w4col], ax
	mov ax, [w4row]
	add ax, 2
	mov [w4row], ax
	mov ax, [w4color];bp + 10
	push ax 
  	mov ax, [w4row]; bp + 8
	push ax
	mov ax, [w4col]; bp + 6
	push ax
	mov ax, [w4length]
	push ax; bp + 4
	call printSquare
	
	;window5
	mov ax, [w4col]
	add ax, 4
	mov [w4col], ax
	mov ax, [w4color];bp + 10
	push ax 
  	mov ax, [w4row]; bp + 8
	push ax
	mov ax, [w4col]; bp + 6
	push ax
	mov ax, [w4length]
	push ax; bp + 4
	call printSquare
	
	;window6
	mov ax, [w4col]
	add ax, 4
	mov [w4col], ax
	mov ax, [w4color];bp + 10
	push ax 
  	mov ax, [w4row]; bp + 8
	push ax
	mov ax, [w4col]; bp + 6
	push ax
	mov ax, [w4length]
	push ax; bp + 4
	call printSquare
	
	pop ax
	ret

Building5:
	push ax
	mov ax, [b5height]
	push ax
	mov ax, [b5color];bp + 10
	push ax 
    mov ax, [b5row]; bp + 8
	push ax
	mov ax, [b5col]; bp + 6
	push ax
	mov ax, [b5length]
	push ax; bp + 4
	call printRectangle
    
	;window1
	mov ax, [w5color];bp + 10
	push ax 
  	mov ax, [w5row]; bp + 8
	push ax
	mov ax, [w5col]; bp + 6
	push ax
	mov ax, [w5length]
	push ax; bp + 4
	call printSquare
	
	;window2
	mov ax, [w5col]
	add ax, 4
	mov [w5col], ax
	mov ax, [w5color];bp + 10
	push ax 
  	mov ax, [w5row]; bp + 8
	push ax
	mov ax, [w5col]; bp + 6
	push ax
	mov ax, [w5length]
	push ax; bp + 4
	call printSquare
	
	;window3
	mov ax, [w5col]
	add ax, 4
	mov [w5col], ax
	mov ax, [w5color];bp + 10
	push ax 
  	mov ax, [w5row]; bp + 8
	push ax
	mov ax, [w5col]; bp + 6
	push ax
	mov ax, [w5length]
	push ax; bp + 4
	call printSquare
	
	;window4
	mov ax, [w5col]
	sub ax, 8
	mov [w5col], ax
	mov ax, [w5row]
	add ax, 2
	mov [w5row], ax
	mov ax, [w5color];bp + 10
	push ax 
  	mov ax, [w5row]; bp + 8
	push ax
	mov ax, [w5col]; bp + 6
	push ax
	mov ax, [w5length]
	push ax; bp + 4
	call printSquare
	
	;window5
	mov ax, [w5col]
	add ax, 4
	mov [w5col], ax
	mov ax, [w5color];bp + 10
	push ax 
  	mov ax, [w5row]; bp + 8
	push ax
	mov ax, [w5col]; bp + 6
	push ax
	mov ax, [w5length]
	push ax; bp + 4
	call printSquare
	
	;window6
	mov ax, [w5col]
	add ax, 4
	mov [w5col], ax
	mov ax, [w5color];bp + 10
	push ax 
  	mov ax, [w5row]; bp + 8
	push ax
	mov ax, [w5col]; bp + 6
	push ax
	mov ax, [w5length]
	push ax; bp + 4
	call printSquare
	
	;window7
	mov ax, [w5col]
	sub ax, 8
	mov [w5col], ax
	mov ax, [w5row]
	add ax, 2
	mov [w5row], ax
	mov ax, [w5color];bp + 10
	push ax 
  	mov ax, [w5row]; bp + 8
	push ax
	mov ax, [w5col]; bp + 6
	push ax
	mov ax, [w5length]
	push ax; bp + 4
	call printSquare
	
	;window8
	mov ax, [w5col]
	add ax, 4
	mov [w5col], ax
	mov ax, [w5color];bp + 10
	push ax 
  	mov ax, [w5row]; bp + 8
	push ax
	mov ax, [w5col]; bp + 6
	push ax
	mov ax, [w5length]
	push ax; bp + 4
	call printSquare
	
	;window9
	mov ax, [w5col]
	add ax, 4
	mov [w5col], ax
	mov ax, [w5color];bp + 10
	push ax 
  	mov ax, [w5row]; bp + 8
	push ax
	mov ax, [w5col]; bp + 6
	push ax
	mov ax, [w5length]
	push ax; bp + 4
	call printSquare
	
	pop ax
	ret

Building6:
	push ax
	mov ax, [b6height]
	push ax
	mov ax, [b6color];bp + 10
	push ax 
    mov ax, [b6row]; bp + 8
	push ax
	mov ax, [b6col]; bp + 6
	push ax
	mov ax, [b6length]
	push ax; bp + 4
	call printRectangle
    
	;window1
	mov ax, [w6color];bp + 10
	push ax 
  	mov ax, [w6row]; bp + 8
	push ax
	mov ax, [w6col]; bp + 6
	push ax
	mov ax, [w6length]
	push ax; bp + 4
	call printSquare
	
	;window2
	mov ax, [w6col]
	add ax, 6
	mov [w6col], ax
	mov ax, [w6color];bp + 10
	push ax 
  	mov ax, [w6row]; bp + 8
	push ax
	mov ax, [w6col]; bp + 6
	push ax
	mov ax, [w6length]
	push ax; bp + 4
	call printSquare
	
	;window3
	mov ax, [w6col]
	sub ax, 6
	mov [w6col], ax
	mov ax, [w6row]
	add ax, 2
	mov [w6row], ax
	mov ax, [w6color];bp + 10
	push ax 
  	mov ax, [w6row]; bp + 8
	push ax
	mov ax, [w6col]; bp + 6
	push ax
	mov ax, [w6length]
	push ax; bp + 4
	call printSquare
	
	;window4
	mov ax, [w6col]
	add ax, 6
	mov [w6col], ax
	mov ax, [w6color];bp + 10
	push ax 
  	mov ax, [w6row]; bp + 8
	push ax
	mov ax, [w6col]; bp + 6
	push ax
	mov ax, [w6length]
	push ax; bp + 4
	call printSquare
	
	;window5
	mov ax, [w6col]
	add ax, 6
	mov [w6col], ax
	mov ax, [w6color];bp + 10
	push ax 
  	mov ax, [w6row]; bp + 8
	push ax
	mov ax, [w6col]; bp + 6
	push ax
	mov ax, [w6length]
	push ax; bp + 4
	call printSquare
	
	;window6
	mov ax, [w6col]
	sub ax, 12
	mov [w6col], ax
	mov ax, [w6row]
	add ax, 2
	mov [w6row], ax
	mov ax, [w6color];bp + 10
	push ax 
  	mov ax, [w6row]; bp + 8
	push ax
	mov ax, [w6col]; bp + 6
	push ax
	mov ax, [w6length]
	push ax; bp + 4
	call printSquare
	
	;window7
	mov ax, [w6col]
	add ax, 6
	mov [w6col], ax
	mov ax, [w6color];bp + 10
	push ax 
  	mov ax, [w6row]; bp + 8
	push ax
	mov ax, [w6col]; bp + 6
	push ax
	mov ax, [w6length]
	push ax; bp + 4
	call printSquare
	
	pop ax
	ret

Building7:
	push ax
	mov ax, [b7height]
	push ax
	mov ax, [b7color];bp + 10
	push ax 
    mov ax, [b7row]; bp + 8
	push ax
	mov ax, [b7col]; bp + 6
	push ax
	mov ax, [b7length]
	push ax; bp + 4
	call printRectangle
    
	;window1
	mov ax, [w7color];bp + 10
	push ax 
  	mov ax, [w7row]; bp + 8
	push ax
	mov ax, [w7col]; bp + 6
	push ax
	mov ax, [w7length]
	push ax; bp + 4
	call printSquare
	
	;window2
	mov ax, [w7col]
	add ax, 6
	mov [w7col], ax
	mov ax, [w7color];bp + 10
	push ax 
  	mov ax, [w7row]; bp + 8
	push ax
	mov ax, [w7col]; bp + 6
	push ax
	mov ax, [w7length]
	push ax; bp + 4
	call printSquare
	
	;window3
	mov ax, [w7col]
	sub ax, 6
	mov [w7col], ax
	mov ax, [w7row]
	add ax, 2
	mov [w7row], ax
	mov ax, [w7color];bp + 10
	push ax 
  	mov ax, [w7row]; bp + 8
	push ax
	mov ax, [w7col]; bp + 6
	push ax
	mov ax, [w7length]
	push ax; bp + 4
	call printSquare
	
	;window4
	mov ax, [w7col]
	add ax, 6
	mov [w7col], ax
	mov ax, [w7color];bp + 10
	push ax 
  	mov ax, [w7row]; bp + 8
	push ax
	mov ax, [w7col]; bp + 6
	push ax
	mov ax, [w7length]
	push ax; bp + 4
	call printSquare
	
	pop ax
	ret
		
Buildings:
	call Building1
	call Building2
	call Building3
	call Building4
	call Building5
	call Building6
	call Building7
	ret

;--------------------------------------------------------------------------------------------------------------
StoresLastColumnInAnArray:
	push di
	push si
	push ax
	push es 
	
	mov ax, 0xb800 
	mov es , ax
	mov di, 158
	mov si , 0
	cloop:
	    mov ax , [es:di]
		mov [arr+si] , ax
		add di, 160
		add si , 2
		cmp di, ((80*10)+79)*2
		jne cloop
	
	pop es
	pop ax
	pop si
	pop di
	ret

MovesEveryColumnAagy:
	push ax
	push bx
	push cx
	push dx
	push di
	push si
	push es
	
	mov ax, 0xb800
	mov es, ax
	mov cx, 0
	mov di, ((80*10)*2)+2
	mov si, ((80*10)*2)
	mov cx, 80*10
	moveouterloop:
				sub di,2
				sub si,2
				cmp si,0
				je rette
				mov ax, [es:si]
				mov word[es:di], ax
				loop moveouterloop
	rette:
		pop es
		pop si
		pop di
		pop dx
		pop cx
		pop bx
		pop ax
		ret
		
SettingBackArrayAtCol1:
    push di
	push si
	push bx
	push es
	
	mov bx,0xb800
	mov es,bx
	mov di, 0
	mov si, 0
	kloop:
		mov bx, [arr+si] 
		mov [es:di], bx
		add di, 160
		add si, 2
		cmp di, (80*10)*2
		jne kloop
	
	pop es
	pop bx
	pop si
	pop di
	ret


Phase2:
	looooop:
		call checkScore
		call StoresLastColumnInAnArray
		call MovesEveryColumnAagy
		call SettingBackArrayAtCol1
		call StoreRoadColumnInAnArray
		call MoveRoadLeft
		call SettingBackRoad
		call P3background
		call P3carrot
		call P3UFO
		call P3bricks
		;call P3platform
		call P3plat1
		call P3plat2
		call P3ufoMovement
		call movCarrot
		call delay
		jmp looooop
	ret 
	
	
StoreRoadColumnInAnArray:
	push di
	push si
	push ax
	push es 
	
	mov ax, 0xb800 
	mov es , ax
	mov di, (80*11*2)
	mov si , 0
	lloop:
	    mov ax , [es:di]
		mov [arroad+si] , ax
		add di, 160
		add si , 2
		cmp di, (80*17*2)
		jne lloop
	
	pop es
	pop ax
	pop si
	pop di
	ret

MoveRoadLeft:
	push ax
	push bx
	push cx
	push dx
	push di
	push si
	push es
	
	mov ax, 0xb800
	mov es, ax
	mov di, (80*11*2)
	mov si, (80*11*2)+2
	mov cx, 80*6
	moveouterloopy:
				mov ax,[es:si]
				mov word[es:di],ax
				add di,2
				add si,2
				loop moveouterloopy
	rettee:
		pop es
		pop si
		pop di
		pop dx
		pop cx
		pop bx
		pop ax
		ret
		
	
SettingBackRoad:
    push di
	push si
	push bx
	push es
	
	mov bx,0xb800
	mov es,bx
	mov di, ((80*11)+79)*2
	xor si,si
	klloop:
		mov bx, [arroad+si] 
		mov word[es:di], bx
		add di, 160
		add si, 2
		cmp di, ((80*17)+79)*2
		jne klloop
	
	pop es
	pop bx
	pop si
	pop di
	ret
;--------------------------------------------------------------------------------------------------------------
Phase1:
	call clrscr
	call printSky
	call printroad
	call Roadlines1
	call Roadlines2
	call Stars
	call Buildings
	call printCAR
	ret
;----------------------------------------------------------------------------------------------------
P3background:
	push ax
	push bx
	push es
	push di
	
	mov ax, 0xb800
	mov es, ax
	mov di, 2880
	p3backgroundloop:
		mov word[es:di], 0x0020
		add di, 2
		cmp di, 4000
		jne p3backgroundloop
	
	mov di, 3038
	mov ah, 0x07
	mov al, '0'
	add al, [score]
	mov word[es:di], ax
	mov ax, 0x07			
	push ax				
	mov ax, scoretext
	push ax				
	push word[scoretextlen]	
	
	call printstr 

	pop di
	pop es
	pop bx
	pop ax
	ret

P3carrot:
	push ax
	
	mov ax, [c3color];bp + 10
	push ax 
  	mov ax, [c3row]; bp + 8
	push ax
	mov ax, [c3col]; bp + 6
	push ax
	mov ax, [c3length]
	push ax; bp + 4
	call printSquare
	
	pop ax
	ret
	
P3UFO:
	push ax
	push di
	push es
	
	mov ax, [bfcolor];bp + 10
	push ax 
  	mov ax, [bfrow]; bp + 8
	push ax
	mov ax, [bfcol]; bp + 6
	push ax
	mov ax, [bflength]
	push ax; bp + 4
	call printSquare
	
	mov ax, [bbheight]
	push ax
	mov ax, [bbcolor];bp + 10
	push ax 
    mov ax, [bbrow]; bp + 8
	push ax
	mov ax, [bbcol]; bp + 6
	push ax
	mov ax, [bblength]
	push ax; bp + 4
	call printRectangle
	
	pop es
	pop di
	pop ax
	ret

P3bricks:
	push ax
	
	mov ax, [brheight]
	push ax
	mov ax, [brcolor];bp + 10
	push ax 
    mov ax, [brrow]; bp + 8
	push ax
	mov ax, [brcol]; bp + 6
	push ax
	mov ax, [brlength]
	push ax; bp + 4
	call printRectangle
	
	mov ax, [br2height]
	push ax
	mov ax, [br2color];bp + 10
	push ax 
    mov ax, [br2row]; bp + 8
	push ax
	mov ax, [br2col]; bp + 6
	push ax
	mov ax, [br2length]
	push ax; bp + 4
	call printRectangle
	
	pop ax
	ret

setbfdir:
	cmp word[bfdir], 0
	je set1
	mov word[bfdir], 0
	jmp exit
	set1:
		mov word[bfdir], 1
		jmp exit
	
callfunc:
	mov ax, [brrow]
	cmp ax, word[br2row]
	jl diffcomp
	
	mov ax, 80
	mul word[br2row]
	add ax, [bbcol]
	shl ax, 1
	mov bx, 0xb800
	mov es, bx
	mov di, ax
	mov ax, word[es:di]
	cmp ax, 0x0020
	jne success
	;jmp endGame
	jmp exit
	diffcomp:
		mov ax, 80
		mul word[brrow]
		add ax, [bbcol]
		shl ax, 1
		mov bx, 0xb800
		mov es, bx
		mov di, ax
		mov ax, word[es:di]
		cmp ax, 0x0020
		jne success
		;jmp endGame
		jmp exit
	success:
		mov cx, 4
		sucloop:		
			mov ax, [bbrow]
			sub ax, 1
			mov [bbrow], ax
			mov ax, [bfrow]
			sub ax, 1
			mov [bfrow], ax
			call P3background
			call P3carrot
			call P3UFO
			call P3bricks			
			call delay
			loop sucloop
			
		call scrolldown
		call checkCarrot
		cmp word[bfdir], 0
		jmp setbfdir
		mov word[bfdir], 0
		jmp exit

scrolldown:
	pusha
	Push es
	Push ds
	push si
	
	xor dx, dx
	cmp word[scrollflag], 0
	je firstjump
	jmp secondjump
	
	firstjump:
		randloop2:
			rdtsc
			mov si, 70
			div si
			cmp dx, 10
			jle randloop2
		mov [brcol], dx
		rand1loop:
			xor dx, dx
			rdtsc
			mov si, 7
			div si	
			cmp dx, 0
			je rand1loop
		shl dx, 4
		mov word[brcolor], dx
		
		mov cx, 4
		ufojmploop1:			
			mov ax, [brrow]
			sub ax, 1
			mov [brrow], ax
			
			mov ax, [bfrow]
			add ax, 1
			mov [bfrow], ax
			
			mov ax, [bbrow]
			add ax, 1
			mov [bbrow], ax
			
			mov ax, [br2row]
			add ax, 1
			mov [br2row], ax
						
			mov ax, [c3row]
			add ax, 1
			mov [c3row], ax
			
			call delay
			call P3background
			call P3carrot
			call P3UFO
			call P3bricks
			loop ufojmploop1
			
		mov ax, [br2col]
		add ax, 2
		mov [c3col], ax
		mov ax, 1
		mov [scrollflag], ax
		
		jmp scrolldownexit
		
	secondjump:
		mov cx, 4
		ufojmploop2:			
			mov ax, [brrow]
			add ax, 1
			mov [brrow], ax
			
			mov ax, [bfrow]
			add ax, 1
			mov [bfrow], ax
			
			mov ax, [bbrow]
			add ax, 1
			mov [bbrow], ax
			
			mov ax, [br2row]
			sub ax, 1
			mov [br2row], ax
			
			call delay
			call P3background
			call P3carrot
			call P3UFO
			call P3bricks
			loop ufojmploop2
			
		randloop1:
			rdtsc
			mov si, 70
			div si	
			cmp dx, 10
			jle randloop1
		mov [br2col], dx
		randloop:
			xor dx, dx
			rdtsc
			mov si, 7
			div si	
			cmp dx, 0
			je randloop
		shl dx, 4
		mov word[br2color], dx
		
		mov ax, [c3row]
		sub ax, 4
		mov [c3row], ax
		mov ax, [br2col]
		add ax, 2
		mov [c3col], ax
		mov ax, 0
		mov [scrollflag], ax
		
		jmp scrolldownexit
		
	scrolldownexit:
		Pop dx
		Pop ds
		Pop es
		Popa
		Ret

P3kbisr:
	pusha
	push es
	
	in al, 0x60
	cmp al, 0x48
	je callfunc
	jmp nextcmp
	
	nextcmp:
		cmp al, 0x01
		jne exit
		call EscapeScreen
		jmp escapeLoop
	
	escapeLoop:
		;call EscapeScreen
		in al, 0x60
		cmp al, 0x12
		je endGame
		cmp al, 0x21
		jne escapeLoop
		call start
		
	exit:
		mov al, 0x20
		out 0x20, al
		pop es
		popa
		iret

endGame:
	xor ax, ax
	mov es, ax		
	mov ax, [oldisr]
	mov bx, [oldisr + 2]
	cli
	mov [es:9*4], ax ;enabling custom kbisr
	mov [es:9*4 + 2], bx
	mov ax, [oldtsr]
	mov bx, [oldtsr + 2]
	mov [es:8*4], ax
	mov [es:8*4 + 2], bx
	sti	
	call EndScreen
	mov ax, 0x4c00
	int 0x21
	
P3plat1:
	pusha
	
	mov ax, [brcol]
	cmp word[brdir], 0
	je plat1add
	sub ax, 1
	cmp ax, 20
	jle plat1setadd
	jmp p3plat1exit
	
	plat1add:
		add ax, 1
		cmp ax, 60
		jge plat1setsub
		jmp p3plat1exit
	
	plat1setadd:
		dec word[brdir]
		jmp p3plat1exit
	
	plat1setsub:
		inc word[brdir]
		jmp p3plat1exit
	
	p3plat1exit:
		mov [brcol], ax
		popa
		ret

P3plat2:
	pusha
	
	mov ax, [br2col]
	cmp word[br2dir], 0
	je p3plat2add
	sub ax, 1
	cmp ax, 20
	jle p3plat2setadd
	jmp p3plat2exit
	
	p3plat2add:
		add ax, 1
		cmp ax, 60
		jge p3plat2setsub
		jmp p3plat2exit
	
	
	p3plat2setsub:
		inc word[br2dir]
		jmp p3plat2exit
	
	p3plat2setadd:
		dec word[br2dir]
		jmp p3plat2exit
		
	p3plat2exit:
		mov [br2col], ax
		popa
		ret

P3ufoMovement:
	pusha
	
	mov ax, [bbrow]
	add ax, 1
	cmp ax, [br2row]
	je br2mov
	brmov:
		mov ax, [bbcol]
		mov bx, [bfcol]
		cmp word[brdir], 0
		je ufoadd
		sub ax, 1
		sub bx, 1
		cmp ax, 20
		jle ufo1setadd
		jmp p3ufoexit
		
		ufoadd:
			add ax, 1
			add bx, 1
			cmp ax, 60
			jge ufo1setsub
			jmp p3ufoexit
		
		ufo1setadd:
			dec word[brdir]
			jmp p3ufoexit
		
		ufo1setsub:
			inc word[brdir]
			jmp p3ufoexit
		
	br2mov:
		mov ax, [bbcol]
		mov bx, [bfcol]
		cmp word[br2dir], 0
		je p3ufoadd
		sub ax, 1
		sub bx, 1
		cmp ax, 20
		jle p3ufosetadd
		jmp p3ufoexit
		
		p3ufoadd:
			add ax, 1
			add bx, 1
			cmp ax, 60
			jge p3ufosetsub
			jmp p3ufoexit
		
		
		p3ufosetsub:
			inc word[br2dir]
			jmp p3ufoexit
		
		p3ufosetadd:
			dec word[br2dir]
			jmp p3plat2exit
			
	
	
	p3ufoexit:
		mov [bbcol], ax
		mov [bfcol], bx
		popa
		ret

movCarrot:
	pusha
	
	mov ax, [c3row]
	add ax, 1
	cmp ax, [br2row]
	je br2carrotmov
	brcarrotmov:
		mov ax, [c3col]
		cmp word[brdir], 0
		je carrot1add
		sub ax, 1
		cmp ax, 20
		jle carrot1setadd
		jmp carrotexit
		
		carrot1add:
			add ax, 1
			cmp ax, 60
			jge carrot1setsub
			jmp carrotexit
		
		carrot1setadd:
			dec word[brdir]
			jmp carrotexit
		
		carrot1setsub:
			inc word[brdir]
			jmp carrotexit
		
	br2carrotmov:
		mov ax, [c3col]
		cmp word[br2dir], 0
		je carrotadd
		sub ax, 1
		;cmp ax, 20
		;jle carrotsetadd
		jmp carrotexit
		
		carrotadd:
			add ax, 1
			;cmp ax, 60
			;jge carrotsetsub
			jmp carrotexit
		
		
		;carrotsetsub:
			;inc word[br2dir]
			;jmp carrotexit
		
		;carrotsetadd:
			;dec word[br2dir]
			;jmp carrotexit
			
	carrotexit:
		mov [c3col], ax
		popa
		ret

checkCarrot:
	pusha
	push di
	
	
	
	mov ax, [c3row]
	cmp word[bbrow], ax
	je nextcomparison
	jmp checkCarrotTerminate
	
	nextcomparison:
		mov ax, [c3col]
		cmp word[bbcol], ax
		jle thirdcomparison
		jmp checkCarrotTerminate
	
	thirdcomparison:
		mov ax, [bbcol]
		add ax, 3
		cmp ax, word[c3col]
		jge incScore
		jmp checkCarrotTerminate
	comp:
	    
	incScore:
		mov ax, [score]
		add ax, 1
		mov [score], ax
	
		rdtsc
		mov si, 6
		div si
		mov bx, [br2row]
		cmp [brrow], bx
		jg brgreater
		
		add dx, [br2col]
		mov [c3col], dx
		call P3carrot
		jmp checkCarrotTerminate
	
		brgreater:
			add dx, [brcol]
			mov [c3col], dx
			call P3carrot
			jmp checkCarrotTerminate
		
	checkCarrotTerminate:
		pop di
		popa
		ret
Phase3:
	push ax
	push es
	;push cs
	
	xor ax, ax
	mov es, ax
	mov ax, [es:9*4] ;storing default isr in oldisr
	mov [oldisr], ax
	mov ax, [es:9*4 + 2]
	mov [oldisr + 2], ax
	
	cli
	mov ax, P3kbisr
	mov [es:9*4], ax ;enabling custom kbisr
	mov [es:9*4 + 2], cs
	sti
	
	;pop cs
	pop es
	pop ax
	ret
;--------------------------------------------------------------------------------------------------
timer:
	pusha
	 
	mov ax, [brrow]
	cmp ax, [br2row]
	jl timerrowcomp1
	cmp word[brcolor], 0x10
	je inctick
	mov word[cs:tickCount], 0
	jmp timerout
	timerrowcomp1:
		cmp word[br2color], 0x40
		je inctick
		mov word[cs:tickCount], 0
		jmp timerout
	
	inctick:
		inc word[cs:tickCount]
		cmp word[cs:tickCount], 90
		jge disapp
		jmp timerout
	
	disapp:
		mov word[cs:tickCount], 0
		jmp goAway
		jmp timerout
		
	timerout:
		mov al, 0x20
		out 0x20, al
		
		popa
		iret

goAway:
	mov ax, [brrow]
	cmp ax, word[br2row]
	jl brclear
	mov word[brcolor], 0
	jmp endGoAway
	brclear:
		mov word[br2color], 0x00
		jmp endGoAway
	
	
	endGoAway:
		mov cx, 4
		ufoDownloop:		
			call delay
			call delay
			mov ax, [bbrow]
			add ax, 1
			mov [bbrow], ax
			mov ax, [bfrow]
			add ax, 1
			mov [bfrow], ax
			call P3background
			call P3carrot
			call P3UFO
			call P3bricks			
			call delay
			call delay
			loop ufoDownloop
		jmp endGame
Phase4:
	push ax
	push es
	
	xor ax, ax
	mov es, ax
	
	mov ax, [es:8*4]
	mov [oldtsr], ax
	mov ax, [es:8*4+2]
	mov [oldtsr+2], ax
	
	cli
	mov word[es:8*4], timer
	mov [es:8*4+2], cs
	sti
	
	pop es
	pop ax
	ret
;---------------------------------------------------------------------------------------------------
StartScreen:
	pusha
	
	call clrscr
	
	
	mov ax, [BBBsheight]
	push ax
	mov ax, [BBBscolor];bp + 10
	push ax 
    mov ax, [BBBsrow]; bp + 8
	push ax
	mov ax, [BBBscol]; bp + 6
	push ax
	mov ax, [BBBslength]
	push ax; bp + 4
	call printRectangle
	
	
	
	mov ax, [BBsheight]
	push ax
	mov ax, [BBscolor];bp + 10
	push ax 
    mov ax, [BBsrow]; bp + 8
	push ax
	mov ax, [BBscol]; bp + 6
	push ax
	mov ax, [BBslength]
	push ax; bp + 4
	call printRectangle
	
	mov ax, [Bsheight]
	push ax
	mov ax, [Bscolor];bp + 10
	push ax 
    mov ax, [Bsrow]; bp + 8
	push ax
	mov ax, [Bscol]; bp + 6
	push ax
	mov ax, [Bslength]
	push ax; bp + 4
	call printRectangle
	
	mov ax, [ssheight]
	push ax
	mov ax, [sscolor];bp + 10
	push ax 
    mov ax, [ssrow]; bp + 8
	push ax
	mov ax, [sscol]; bp + 6
	push ax
	mov ax, [sslength]
	push ax; bp + 4
	call printRectangle
	
	mov bh,0
	mov dh,9; row number
	mov dl,20
	mov ah,02h
	int 0x10
	
	mov dx, startingmessage
	mov ah, 9
	int 0x21
	
	mov bh,0
	mov dh,10; row number
	mov dl,20
	mov ah,02h
	int 0x10
	
	mov dx, yay
	mov ah, 9
	int 0x21
	
	
	mov bh,0
	mov dh,11; row number
	mov dl,20
	mov ah,02h
	int 0x10
	
	mov dx, baasilname
	mov ah, 9
	int 0x21
	
	mov bh,0
	mov dh,12; row number
	mov dl,20
	mov ah,02h
	int 0x10
	
	mov dx, baasilrno
	mov ah, 9
	int 0x21
	
	mov bh,0
	mov dh,13; row number
	mov dl,20
	mov ah,02h
	int 0x10
	
	mov dx, hafsaname
	mov ah, 9
	int 0x21

	mov bh,0
	mov dh,14; row number
	mov dl,20
	mov ah,02h
	int 0x10
	
	mov dx, hafsarno
	mov ah, 9
	int 0x21
	
	
	mov bh,0
	mov dh,15; row number
	mov dl,20
	mov ah,02h
	int 0x10
	
	mov dx, starttext
	mov ah, 9
	int 0x21
	
	popa
	ret

EscapeScreen:
	pusha
	
	call clrscr
	
	mov bh,0
	mov dh,0; row number
	mov dl,0
	mov ah,02h
	int 0x10
	
	mov dx, escapetext
	mov ah, 9
	int 0x21
	
	popa
	ret
	
EndScreen:
	pusha
	
	call clrscr
	
	mov ax, [Esheight]
	push ax
	mov ax, [Escolor];bp + 10
	push ax 
    mov ax, [Esrow]; bp + 8
	push ax
	mov ax, [Escol]; bp + 6
	push ax
	mov ax, [Eslength]
	push ax; bp + 4
	call printRectangle
	
	
	mov bh,0
	mov dh,12; row number
	mov dl,35
	mov ah,02h
	int 0x10
	
	mov dx, gameover
	mov ah, 9
	int 0x21
	
	
	
	mov bh,0
	mov dh,0; row number
	mov dl,0
	mov ah,02h
	int 0x10
	
	mov dx, scoreprint
	mov ah, 9
	int 0x21
	
	mov al, '0'
	add al, [score]
	mov [scoretext2], al
	
	mov ah, 02h
	mov dl, [scoretext2]
	int 21h
	
	popa
	ret

WinScreen:
	pusha
	
	call clrscr
	
	mov bh,0
	mov dh,0; row number
	mov dl,0
	mov ah,02h
	int 0x10
	
	mov dx, winnertext
	mov ah, 9
	int 0x21
	
	Popa
	ret
	
checkScore:
	pusha
	push es
	mov ax, [score]
	cmp ax, 9
	je winExit
	jmp winexit
	winExit:
		xor ax, ax
		mov es, ax		
		cli
		mov ax, [oldisr]
		mov bx, [oldisr + 2]
		mov [es:9*4], ax
		mov [es:9*4 + 2], bx
		mov ax, [oldtsr]
		mov bx, [oldtsr + 2]
		mov [es:8*4], ax
		mov [es:8*4 + 2], bx
		sti
		call WinScreen
		mov ax, 0x4c00
		int 0x21
	winexit:
		pop es
		popa
		ret
;---------------------------------------------------------------------------------------------------
preStart:
	call StartScreen
	mov ah, 00h
	int 0x16
	cmp al, 'e'
	je start
	jmp nextprecmp
	nextprecmp:
		cmp al, 'E'
		jne preStart
	jmp start
	
start:
	call Phase1
	call Phase3
	call Phase4
	call Phase2

scroll:
	push bp
	mov bp, sp
	pusha
	push es
	push di
	push ds
	mov ax, 0xb800
	mov es, ax
	mov ds, ax
	mov ax, 0x0020
	mov dx, 25
	mov cx, [bp + 4]
	mov si, 80
	mov di, 80
	sub di, cx
	sub di, cx
	scrloop:
		std
		rep MOVSW
		mov cx, [bp + 4]
		add si, [bp + 4]
		add si, [bp + 4]
		add di, [bp + 4]
		add di, [bp + 4]
		add di, [bp + 4]
		add di, [bp + 4]
		cld
		rep MOVSW
		mov cx, [bp + 4]
		sub di, [bp + 4]
		sub di, [bp + 4]
		sub di, [bp + 4]
		sub di, [bp + 4]
		rep STOSW
		sub di, [bp + 4]
		sub di, [bp + 4]
		add di, 160
		add si, 160
		mov cx, [bp + 4]
		sub dx, 1
		jnz scrloop
	pop ds
	pop di
	pop es
	popa
	pop bp
	ret 2
	
arr : dw 0,0,0,0,0,0,0,0,0,0
arroad:dw 0,0,0,0,0,0,0
;storage of old isr
realoldisr: dd 0
oldisr: dd 0 
oldtsr: dd 0
;texts
startingmessage: db 'Game Begins! $'
gameover: db 'GAME OVER :(  $'
yay: db 'YAYYYYY!!!  $'
hafsaname: db "Name of Cutuu partner: Hafsa Butt (Theodore) $"
hafsarno: db "Roll number of Cutu partner: 22L-6738 $"
baasilname: db 'Name of an amazing Insaan: Major Baasil ;)  $'
baasilrno: db 'Roll number of an amazing Insaan: 22L-6674 $'
scoreprint: db 'Score: $'
scoretext2: db 0
escapetext: db 'Press E to exit and Press F to go back to the game $'
starttext: db 'Press E to start $'
winnertext: db "You win, you're a garbage bin! $"