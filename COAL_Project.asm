.model small
.stack 100h

.data


.code

    ; Main procedure to call other procedures
    main proc

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

    title_screen endp

    ; Procedure to display the main menu
    main_menu proc

    main_menu endp

    ; Procedure to clear the screen
    clear_screen proc

    clear_screen endp

    ; Procedure to display the high scores
    high_scores proc

    high_scores endp

    ; Procedure to exit the program
    exit_program proc
        mov ah, 4Ch     
        int 21h        
    exit_program endp

end main
