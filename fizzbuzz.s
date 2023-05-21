/* Homework 2 - Assembly Fizzbuzz
 Your program must print the numbers from 1 to 100, except when:
 1) If the number is divisible by 15, print FizzBuzz instead, if not:
   2) If the number is divisible by 3, print Fizz instead
   3) If the number is divisible by 5, print Buzz instead
 I have provided you functions that will do the printing, you just need
 to do the control logic.

 Don't use R0 through R3 in this function (except in the one example below)
 They get overwritten every time you call a function.
 So use R4 through R10 for your logic

Any line marked with DM ("Don't Modify") should probably be left alone.
*/

.global fizzbuzz 	     @DM - Don't modify
fizzbuzz:                @DM - Don't modify
	PUSH {LR}            @DM: Preserve LR for the calling function
	PUSH {R4-R11}        @DM: This preserves the R4 through R12 from the calling function

	MOV R4, #0
	MOV R6, #0
	top:
	ADD R6, #1
	//exit
	CMP R6, #101
	BEQ return
	ADD R4, #1
	MOV R0, R4			 @Copy value of R4 into R0
	
	//fizz
	CMP R0, #3
	BLEQ fizz
	CMP R0, #6
	BLEQ fizz
	CMP R0, #9
	BLEQ fizz
	CMP R0, #12
	BLEQ fizz

	//buzz
	CMP R0, #5
	BLEQ buzz
	CMP R0, #10
	BLEQ buzz

	//fizzbuzz
	CMP R0, #15
	BLEQ fizzbuzz2

	MOV R0, R6
	BL print_number      @How to print "3" or whatevs
	CMP R4, #15
	BLT top 
	
	MOV R4, #1
	B top				 @Return back to main()

fizz:
	BL print_fizz
	B top
buzz:
	BL print_buzz
	B top
fizzbuzz2:
	BL print_fizzbuzz
	B top
return:
	POP {R4-R11}         @DM: Restore R4 through R12 for the calling function
	POP {PC}             @DM: Return from a function
