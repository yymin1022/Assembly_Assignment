INCLUDE Irvine32.inc
.data

.code

main PROC
		push 4               ; Calculate 5 Factorial
		call Factorial       ; Calculate Factorial(eax)
		call WriteDec       ; Show Result
		call Crlf
		exit

main ENDP

Factorial PROC
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]  ; Get n
	cmp eax, 0              ; is n < 0 ?
 	ja L1                       ; true -> Continue
	mov eax, 1              ; false -> return 1
	jmp L2

L1:
	dec eax
	push eax                 ; Factorial(n - 1)
	call Factorial

ReturnFact:
	mov ebx, [ebp + 8]  ; get n
	mul ebx                   ; ax = ax * bx

L2:
	pop ebp                  ; return EAX
	ret 4                        ; Clean up Stack

Factorial ENDP

END main