; COAL Project Spring-2024
; I21-2675
; COAL Semester Project
; Course Code: EL2003-Computer Organization and Assembly Language-Lab
; Game: Duck Hunt on MASM 8086

.model small
.stack 100h

;----- DATA SEGMENT -----

.data
title_name db "Duck Hunt", 13, 10, 13, 10, "Input your name and press Enter...", 13, 10, '$'

menu db "Please select a choice:",13,10
    db "1. 1P",13,10
    db "2. 2P",13,10
    db "3. Highscores",13,10
    db "4. Exit",13,10
    db '5. Return To Title Screen', 13, 10, '$'

game_over db "Game Over", 13, 10, "Press ESC to exit...", 13, 10, '$'

user_name db 21 dup('$')

filename db "user_name.txt", 0

highscore_file db "highscores.txt", 0

fhandle dw ?

;----- CODE SEGMENT -----

.code
    main proc
        mov ax, @data       ; Initialize data segment
        mov ds, ax

        call title_screen
        call exit_game
    main endp

    title_screen proc
        call clear_screen

        mov  dx, offset title_name    ; Load the offset of the title_name string into DX
        mov  ah, 9                    ; Set the function code for displaying a string
        int  21h                      ; Call the DOS interrupt to display the string

        ; Prompt the user to enter their name
        mov dx, offset user_name     ; Load the offset of user_name buffer into DX
        mov ah, 0Ah                  ; Function code for buffered input
        int 21h                      ; Call DOS interrupt for buffered input

        ; call open_file_for_writing   ; Open the file for writing user name
        ; jc file_error                ; Jump if there is an error
        ; mov fhandle, ax              ; Store file handle in variable

        ; call write_user_name_to_file ; Write user name to file
        ; jc file_error                ; Jump if there is an error

        call clear_screen            ; Call the clear_screen procedure to clear the screen
        call display_menu            ; Call the display_menu procedure to display the menu

        ret                           ; Return from the procedure
    title_screen endp

    clear_screen proc
        mov ah,00h                   ;set the configuration to video mode
        mov al,13h                   ;choose the video mode
        int 10h    					 ;execute the configuration 
        
        mov ah,0Bh 					 ;set the configuration
        mov bh,00h 					 ;to the background color
        mov bl,00h 					 ;choose black as background color
        int 10h    					 ;execute the configuration
        
        ret
    clear_screen endp

    exit_game proc
        call clear_screen       ; Call the clear_screen procedure to clear the screen

        wait_for_key:
            mov ah, 07h         ; Set the function code for checking keyboard status
            int 21h             ; Call the DOS interrupt to check keyboard status

            cmp al, 1Bh         ; Check if the key pressed is ESC (ASCII value 1Bh)
            jne wait_for_key    ; Jump back to wait_for_key if key pressed is not ESC

            mov  dx, offset game_over    ; Load the offset of the game_over string into DX
            mov  ah, 9                   ; Set the function code for displaying a string
            int  21h                     ; Call the DOS interrupt to display the string

            mov ah, 4Ch         ; Set the function code for program termination
            int 21h             ; Call the DOS interrupt to terminate the program
    exit_game endp

    display_menu proc
        mov  dx, offset menu    ; Load the offset of the menu string into DX

        mov  ah, 9              ; Set the function code for displaying a string
        int  21h                ; Call the DOS interrupt to display the string

        call check_input        ; Call the check_input procedure

        ret                     ; Return from the procedure
    display_menu endp

    check_input proc
        mov ah, 01h             ; Set the function code for checking keyboard status
        int 21h                 ; Call the DOS interrupt to check keyboard status

        cmp al, 31h             ; Check if the key pressed is '1'
        je exit_game            ; Jump to 1P if key pressed is '1'

        cmp al, 32h             ; Check if the key pressed is '2'
        je exit_game            ; Jump to 2P if key pressed is '2'

        cmp al, 33h             ; Check if the key pressed is '3'
        je display_highscores  ; Jump to highscores if key pressed is '3'

        cmp al, 34h             ; Check if the key pressed is '4'
        je exit_game            ; Jump to exit_game if key pressed is '4'

        cmp al, 35h             ; Check if the key pressed is '5'
        je title_screen         ; Jump to title screen if key pressed is '5'

        jmp check_input         ; Jump back to check_input if key pressed is not '1', '2', '3', or '4'

        ret                     ; Return from the procedure
    check_input endp

    display_highscores proc
        ; Implement later
        ret
    display_highscores endp

    read_highscores_from_file proc
        ; Implement later
        ret
    read_highscores_from_file endp

    open_file_for_writing proc
        ; Implement later
        ret
    open_file_for_writing endp

    file_error proc
        ; Implement later
        ret
    file_error endp

    write_user_name_to_file proc
        ; Implement later
        ret
    write_user_name_to_file endp

    write_highscore_to_file proc
        ; Implement later
        ret
    write_highscore_to_file endp

    read_user_name_from_file proc
        ; Implement later
        ret
    read_user_name_from_file endp

    Game_Play proc
        ; Implement later
        ret
    Game_Play endp

end main
