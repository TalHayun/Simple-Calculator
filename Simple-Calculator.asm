.data

             message_a: .asciiz  "Start Calculator? (0:no, 1:yes): "
             message_b: .asciiz "\nBad Input"
             message_c: .asciiz "\nGood bye!"
             message_d: .asciiz  "Enter operation symbol (+,-,*) or '!' to quit: "
             message_e: .asciiz  "\nEnter first number (A): "
             message_f: .asciiz  "Enter first number (B): "
             message_h: .asciiz "The result is "
             new_line: .asciiz "\n"

.text
      main:   

             li $v0, 4 # read a start calculaor message
             la $a0, message_a 
             syscall 
             
             li $v0,5 #got a number from the user
             syscall
             
             move $t0, $v0 # the number == 0 ? ---> exit
             beq $t0, $zero, exit_without_goodbye			
        
            li $t3, 1	                    	                    
            bne $t0, $t3, badInpud # the number != 1 ? ---> bad input message and exit
           
        continue:   
             addi $sp, $sp, -4
             sw $ra, 0($sp)
               
             li $v0, 4
             la $a0, new_line # down line 
             syscall 
            
             li $v0, 4
             la $a0, message_d # print "Enter operation symbol (+,-,*) or '!' to quit: "
            syscall 
                 
             li $v0, 12 #input  the user opperation
            syscall 
           
            add $s0, $v0, $zero

             li $v0, 4 #input A
             la $a0, message_e  # print "Enter first number : "
             syscall 
             
             li $v0,5 # get the first number from the user
             syscall
             move $t0, $v0

             li $v0, 4 #input B
             la $a0, message_f
             syscall
             
             li $v0,5 # get the second number from the user
             syscall
             move $t1, $v0 
             
            li $a0, 0
            move $a0, $t0 # Copy the argument "A"  
            move $a1, $t1 # Copy the argument "B"
            
            li $t1, '!' 
            beq $t1, $s0, exit               
            li $t1, '+'
            beq $t1,$s0, addition # check if the operation is '+'
            li $t1, '-'          
            beq $t1,$s0, subtraction # check if the operation is '-'
            li $t1, '*'          
            beq $t1,$s0,multiplication # check if the operation is '-'
            li $v0, 4
            la $a0, message_b  # print "Enter first number (B): "
            syscall
            jal continue
                             
             addition:
             add $a0,$a0,$a1 # addition the parameters
             move $a1, $a0
             
             li $v0, 4
             la $a0, message_h  # print "the result is : " message   
             syscall
             
             li $v0, 1
             move $a0, $a1
             syscall
             jal continue
             
             subtraction:
             sub $a0,$a0,$a1
             move $a1, $a0
             
             li $v0, 4
             la $a0, message_h   # print the result is 
             syscall
             
             li $v0, 1 # print the result
             move $a0, $a1
             syscall
             jal continue
             
             multiplication:
             mul $a0, $a0, $a1 # mul the parameters
             move $a1, $a0
             
              li $v0, 4
             la $a0, message_h  # print " The result is "
             syscall
               
             li $v0, 1
             move $a0, $a1
             syscall
             jal continue
                  
           badInpud: # print bad input message
           li $v0, 4 
           la $a0, message_b 
           syscall
           jal exit 
           
           exit_without_goodbye: # finish the program
           li $v0, 10
           syscall

           exit:  # print goodbye message and exit the program
           li $v0, 4
           la $a0, message_c
           syscall 
           li $v0, 10
           syscall
             
