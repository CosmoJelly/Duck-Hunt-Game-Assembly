.model small
.stack 100h

.data
    title_msg   db 'DUCK HUNT$', 0

.code

    ; Main procedure to call other procedures
    main proc
        mov ax, @data
        mov ds, ax

        call title_screen
        call exit_program
    main endp

    ; Procedure to print strings
    print_string proc

    print_string endp

    ; Procedure to read a text file
    read_file proc

    read_file endp

    ; Procedure to write to a text file
    write_file proc

    write_file endp

    ; Procedure to display the title screen
    title_screen proc
        ; Clear the screen
        call clear_screen

        ; Calculate the starting position of the message
        mov ah, 0Fh         
        int 10h             
        mov bh, 0           
        mov cx, 80          
        mov dx, 35          
        sub cx, 10          
        sub dx, 2    
    
        ; Move the cursor to the calculated position
        mov ah, 02h         
        int 10h             
        
        ; Print the title message
        mov ah, 09h         
        lea dx, title_msg   
        int 21h             
        
        ret                 

    title_screen endp

    ; Procedure to display the main menu
    main_menu proc

    main_menu endp

    ; Procedure to clear the screen
    clear_screen proc
        mov ah, 06h      
        mov al, 0        
        mov bh, 07h      
        mov ch, 0        
        mov cl, 0        
        mov dh, 24       
        mov dl, 79       
        int 10h          
        ret              
    clear_screen endp

    ; Procedure to display the high scores
    high_scores proc

    high_scores endp

    ; Procedure to exit the program
    exit_program proc
        wait_for_key:
            mov ah, 01h         
            int 21h             

            jz wait_for_key

            mov ah, 4Ch         
            int 21h            
    exit_program endp

end main
