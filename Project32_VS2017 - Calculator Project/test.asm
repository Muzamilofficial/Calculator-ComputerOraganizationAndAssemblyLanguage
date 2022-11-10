INCLUDE Irvine32.inc
INCLUDE macros.inc
.386
.stack 4096
.data

array1 sbyte 9 Dup (0)   

array2 sbyte 9 Dup (0)  

array3 sbyte 9 Dup (0)
array4 sbyte 9 Dup (0)
array5 sbyte 9 Dup (0)
array6 sbyte 9 Dup (0)
array7 sbyte 9 Dup (0)
num sbyte 0
msg1 byte "Enter Matrix one(2x2)",0ah,0dh,0
msg2 byte "Enter Matrix Second(2x2)",0ah,0dh,0
msg4 byte "Matrix Multiplication",0ah,0dh,0
msg5 byte "Matrix Addition",0ah,0dh,0
msg6 byte "Matrix Subtraction",0ah,0dh,0

myMessage0 BYTE "Matrix A 3x3 ",0dh,0ah,0
myMessage1 BYTE "Matrix B 3x3 ",0dh,0ah,0

num00 sbyte 0
num001 sbyte 0
num002 sbyte 0
.code



input0 proc

	mov ecx,0

	.while ecx<9

		call readint
		mov array1[ecx],al
		inc ecx

	.endw

	ret

input0 endp





input1 proc

	mov ecx,0

	.while ecx<9

		call readint
		mov array2[ecx],al
		inc ecx

	.endw

	ret

input1 endp





print proc

	mov ecx,0

	.while ecx<9

		mov al,array1[ecx]

		call writedec
		mwrite(" ")

		.if ecx == 2
			call crlf
		.endif
		.if ecx == 5
			call crlf
		.endif
		.if ecx == 8
			call crlf
		.endif

		inc ecx

	.endw

	

print endp





print1 proc

	mov ecx,0

	.while ecx<9

		mov al,array2[ecx]

		call writedec
		mwrite(" ")

		.if ecx == 2
			call crlf
		.endif
		.if ecx == 5
			call crlf
		.endif
		.if ecx == 8
			call crlf
		.endif

		inc ecx

	.endw

	ret

print1 endp






matrixmul1 proc		;multiplication

	mov eax,0
	mov ebx,0
	mov ecx,0

	.while ecx<9

		.if ecx == 0

			mov eax,0
			mov ebx,0
			mov al,array1[ecx]
			mul array2[ecx]
			mov num00,al
			mov al,array1[ecx+1]
			mul array2[ecx+3]
			mov num001,al
			mov al,array1[ecx+2]
			mul array2[ecx+6]
			add al,num001
			add al,num00
			mov array3[ecx],al

		.endif


		.if ecx == 1

			mov eax,0
			mov ebx,0
			mov al,array1[ecx-1]
			mul array2[ecx]
			mov num00,al
			mov al,array1[ecx]
			mul array2[ecx+3]
			mov num001,al
			mov al,array1[ecx+1]
			mul array2[ecx+6]
			add al,num001
			add al,num00
			mov array3[ecx],al
	
		.endif


		.if ecx == 2

			mov eax,0
			mov ebx,0
			mov al,array1[ecx-2]
			mul array2[ecx]
			mov num00,al
			mov al,array1[ecx-1]
			mul array2[ecx+3]
			mov num001,al
			mov al,array1[ecx]
			mul array2[ecx+6]
			add al,num001
			add al,num00
			mov array3[ecx],al
	
		.endif


		.if ecx == 3

			mov eax,0
			mov ebx,0
			mov al,array1[ecx]
			mul array2[ecx-3]
			mov num00,al
			mov al,array1[ecx+1]
			mul array2[ecx]
			mov num001,al
			mov al,array1[ecx+2]
			mul array2[ecx+3]
			add al,num001
			add al,num00
			mov array3[ecx],al
	
		.endif


		.if ecx == 4

			mov eax,0
			mov ebx,0
			mov al,array1[ecx-1]
			mul array2[ecx-3]
			mov num00,al
			mov al,array1[ecx]
			mul array2[ecx]
			mov num001,al
			mov al,array1[ecx+1]
			mul array2[ecx+3]
			add al,num001
			add al,num00
			mov array3[ecx],al
	
		.endif


		.if ecx == 5

			mov eax,0
			mov ebx,0
			mov al,array1[ecx-2]
			mul array2[ecx-3]
			mov num00,al
			mov al,array1[ecx-1]
			mul array2[ecx]
			mov num001,al
			mov al,array1[ecx]
			mul array2[ecx+3]
			add al,num001
			add al,num00
			mov array3[ecx],al
	
		.endif


		.if ecx == 6

			mov eax,0
			mov ebx,0
			mov al,array1[ecx]
			mul array2[ecx-6]
			mov num00,al
			mov al,array1[ecx+1]
			mul array2[ecx-3]
			mov num001,al
			mov al,array1[ecx+2]
			mul array2[ecx]
			add al,num001
			add al,num00
			mov array3[ecx],al
	
		.endif


		.if ecx == 7

			mov eax,0
			mov ebx,0
			mov al,array1[ecx-1]
			mul array2[ecx-6]
			mov num00,al
			mov al,array1[ecx]
			mul array2[ecx-3]
			mov num001,al
			mov al,array1[ecx+1]
			mul array2[ecx]
			add al,num001
			add al,num00
			mov array3[ecx],al

		.endif


		.if ecx == 8

			mov eax,0
			mov ebx,0
			mov al,array1[ecx-2]
			mul array2[ecx-6]
			mov num00,al
			mov al,array1[ecx-1]
			mul array2[ecx-3]
			mov num001,al
			mov al,array1[ecx]
			mul array2[ecx]
			add al,num001
			add al,num00
			mov array3[ecx],al

		.endif

		inc ecx

	.endw

	ret 

matrixmul1 endp








printmul1 proc

	mov ecx,0

	.while ecx<9

		mov al,array3[ecx]

		call writedec
		mwrite(" ")

		.if ecx == 2
			call crlf
		.endif
		.if ecx == 5
			call crlf
		.endif
		.if ecx == 8
			call crlf
		.endif

		inc ecx

	.endw

	ret

printmul1 endp






addmatrix1 proc

	mov ecx,0
	mov eax,0

	.while cl<9

		mov al,array1[ecx]
		add al,array2[ecx]
		mov array4[ecx],al

		inc ecx

	.endw

	ret

addmatrix1 endp







printadd1 proc

	mov ecx,0

	.while ecx<9

		mov al,array4[ecx]

		call writedec
		mwrite(" ")

		.if ecx == 2
			call crlf
		.endif
		.if ecx == 5
			call crlf
		.endif
		.if ecx == 8
			call crlf
		.endif

		inc ecx

	.endw

	ret

printadd1 endp





submatrix1 proc

mov ecx,0
mov eax,0

	.while cl<9

		mov al,array2[ecx]
		mov bl,array1[ecx]
	
		.if (al > bl) 
		
			sub al,array1[ecx]
			mov array5[ecx],al
			mov al,array5[ecx]

			mwrite "-"
			call writedec

			jmp p1

		.endif
	
		.if (al < bl) 

			mov al,array1[ecx]
			sub al,array2[ecx]
			mov array5[ecx],al
			mov al,array5[ecx]

			call writedec

			jmp p1

		.endif


		p1:
			.if array5[ecx] == 0
				mwrite("0")
			.endif
				mwrite(" ")
			.if ecx == 2
				call crlf
			.endif
			.if ecx == 5
				call crlf
			.endif
			.if ecx == 8
				call crlf
			.endif

			inc ecx
	.endw

	ret

submatrix1 endp







PrintAll3x3Matrix proc

	jmp start

		start:	
		mwrite "Select 1 for Multipication"
		call crlf
		mwrite "Select 2 for Addition"
		call crlf
		mwrite "Select 3 for Subtraction"
		call crlf


	call readint

	.if eax == 1 
		mwrite "Matrix Multiplication"
		call crlf
		call matrixmul1
		call printmul1
		call crlf
		jmp contd
	.endif

	.if eax == 2
		mwrite "Matrix Addition"
		call crlf
		call addmatrix1
		call printadd1
		call crlf
		jmp contd
	.endif
	
	.if eax == 3
		mwrite "Matrix Subtraction"
		call crlf
		call submatrix1
		call crlf
		jmp contd
	.endif

		contd:
				mov eax,0
				mwrite "Enter 1 if you want to continue or 2 to exit:"
				call readint
				.if eax == 1
					call clrscr
					jmp start
				.endif
				.if eax == 2
					call clrscr
					jmp stop2
				.endif

	ret

PrintAll3x3Matrix endp







Input3x3 proc

	mov edx,OFFSET myMessage0
	call writestring
	call input0

	mov edx,OFFSET myMessage1
	call writestring
	call input1

	ret

Input3x3 endp





input2 proc

	mov ecx,0

	.while ecx<4

		call readint

		mov array1[ecx],al

		inc ecx

	.endw

	ret

input2 endp





input3 proc


	mov ecx,0

	.while ecx<4

		call readint

		mov array2[ecx],al

		inc ecx

	.endw

	ret

input3 endp







matrixmul proc 

	mov ecx,0
	mov eax,0
	mov ebx,0

	.while ecx<4

		.if ecx == 0

			mov eax,0
			mov ebx,0	
			mov al,array1[ecx]
			mul array2[ecx]
			mov num,al
			mov al,array1[ecx+1]
			mul array2[ecx+2]
			add al,num
			mov array5[ecx],al
		
		.endif

		.if ecx == 1

			mov eax,0
			mov ebx,0	
			mov al,array1[ecx-1]
			mul array2[ecx]
			mov num,al
			mov al,array1[ecx]
			mul array2[ecx+2]
			add al,num
			mov array5[ecx],al
		
		.endif

		.if ecx == 2

			mov eax,0
			mov ebx,0	
			mov al,array1[ecx]
			mul array2[ecx-2]
			mov num,al
			mov al,array1[ecx+1]
			mul array2[ecx]
			add al,num
			mov array5[ecx],al

		.endif

		.if ecx == 3

			mov eax,0
			mov ebx,0	
			mov al,array1[ecx-1]
			mul array2[ecx-2]
			mov num,al
			mov al,array1[ecx]
			mul array2[ecx]
			add al,num
			mov array5[ecx],al
		
		.endif

		inc ecx
	
	.endw

	ret 

matrixmul endp






printmul proc

	mov ecx,0

	.while ecx<4

		mov al,array5[ecx]

		call writedec
		mwrite(" ")

		.if ecx == 1
			call crlf
		.endif
		.if ecx == 3
			call crlf
		.endif

		inc ecx

	.endw

	ret

printmul endp







addmatrix proc

	mov ecx,0
	mov eax,0

	.while cl < 4

		mov al,array1[ecx]
		add al,array2[ecx]
		mov array3[ecx],al

		inc ecx

	.endw

	ret

addmatrix endp








printadd proc


	mov ecx,0

	.while ecx<4

		mov al,array3[ecx]

		call writedec
		mwrite(" ")

		.if ecx == 1
			call crlf
		.endif
		.if ecx == 3
			call crlf
		.endif
		inc ecx

	.endw

	ret

printadd endp







matrixsub proc

	mov ecx,0
	mov eax,0

	.while cl<4

		mov al,array2[ecx]
		mov bl,array1[ecx]
	
		.if (al > bl) 
	
		sub al,array1[ecx]
		mov array5[ecx],al
		mov al,array5[ecx]

		mwrite "-"
		call writedec

		jmp p2

		.endif
	
		.if (al < bl) 

		mov al,array1[ecx]
		sub al,array2[ecx]
		mov array5[ecx],al
		mov al,array5[ecx]

		call writedec

		jmp p2

		.endif


	p2:

		.if array5[ecx] == 0
			mwrite(" ")
		.endif

			mwrite(" ")

		.if ecx == 1
			call crlf
		.endif

		.if ecx == 3
			call crlf
		.endif

		inc ecx

		.endw

	ret

	ret

matrixsub endp








input22x2 proc

	mov edx,OFFSET msg1
	call writestring
	call input2

	mov edx,OFFSET msg2
	call writestring
	call input3

	ret

input22x2 endp






PrintAll2x2Matrix proc
	
	jmp start

		start:	

		mwrite "Select 1 for Multipication"
		call crlf
		mwrite "Select 2 for Addition"
		call crlf
		mwrite "Select 3 for Subtraction"
		call crlf

		call readint

		.if eax == 1
			mov edx,OFFSET msg4
			call writestring
			call crlf
			call matrixmul
			call printmul
			call contd
		.endif
	
		.if eax == 2
			call crlf
			mov edx,OFFSET msg5
			call writestring
			call crlf
			call addmatrix
			call printadd
			call contd
		.endif

		.if eax == 3
			call crlf
			mov edx,OFFSET msg6
			call writestring
			call crlf
			call matrixsub
			call contd
		.endif


		contd:
				mov eax,0
				mwrite "Enter 1 if you want to continue or 2 to exit:"

				call readint

				.if eax == 1
					call clrscr
					jmp start
				.endif

				.if eax == 2
					call clrscr
					jmp stop
				.endif

	ret
	stop:

PrintAll2x2Matrix endp






main proc
		
	jmp start

	start:	
		mwrite "          This Program is a menu driven program which allows you to get below calculation of 3x3 and 2x2 Matrices"	
		mwrite "                               1)Multiplication 2)Addition 3)Subtraction"
		
		mov eax,0
		call crlf

		mwrite "Select 1 for 2x2"
		call crlf
		mwrite "Select 2 for 3x3"
		call crlf
		mwrite "Select 3 for exit"
		call crlf

		call readint

		
		.if eax == 1
		call input22x2
		call PrintAll2x2Matrix
		jmp contd
		.endif


		.if eax == 2
		call Input3x3
		call PrintAll3x3Matrix
		jmp contd
		.endif


		.if eax == 3
		 jmp stop
		.endif

	contd:

			stop2::
			mov eax,0
			mwrite "Enter 1 if you want to continue or 2 to exit:"
			call readint
			.if eax == 1
				call clrscr
				jmp start
			.endif
			.if eax == 2
				call clrscr
				jmp stop
			.endif

stop:
	exit
	main   endp
end main