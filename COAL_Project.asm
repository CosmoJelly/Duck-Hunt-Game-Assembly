; COAL Project Spring-2024
; I21-2675
; COAL Semester Project
; Course Code: EL2003-Computer Organization and Assembly Language-Lab
; Game: Duck Hunt on MASM 8086

.model small
.stack 300h

; ----- DATA SEGMENT -----

data segment para 'data'

    title_name db "Duck Hunt", 13, 10, 13, 10, "Press any key to continue...", 13, 10, '$'
    
    menu db "Please select a choice:",13,10
        db "1. 1P",13,10
        db "2. 2P",13,10
        db "3. Highscores",13,10
        db "4. Exit",13,10,'$'

data ends

; ----- CODE SEGMENT -----

code segment para 'code'

    assume cs:code, ds:data
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

        mov ah, 07h                   ; Set the function code for checking keyboard status
        int 21h                       ; Call the DOS interrupt to check keyboard status

        call clear_screen            ; Call the clear_screen procedure to clear the screen

        call display_menu             ; Call the display_menu procedure to display the menu

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
        je exit_game            ; Jump to highscores if key pressed is '3'

        cmp al, 34h             ; Check if the key pressed is '4'
        je exit_game            ; Jump to exit_game if key pressed is '4'

        cmp al, 35h             ; Check if the key pressed is '5'
        je title_screen         ; Jump to title screen if key pressed is '5'

        jmp check_input         ; Jump back to check_input if key pressed is not '1', '2', '3', or '4'

    check_input endp

code ends
end
