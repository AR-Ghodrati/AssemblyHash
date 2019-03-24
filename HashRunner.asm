
        ;%include "io.inc"
        
        section .macro
        
        
        ; Eevry Push dec 4 times from esp
        ; Eevry Pop inc 4 times from esp
        
        
        
        
        ; arg1: src , arg2 : dis , arg3 : Counter
        %macro copy_string 3
        ; Push To Save Value In Regs
        push eax
        push ebx
        push ecx
        
        
        
        ; Xor To Rest Regs
        xor eax , eax
        xor ebx , ebx
        xor ecx , ecx
        
        
        
        
        mov eax , %1
        mov ebx , %2
        
        
        ; Copy input Arg To _Str
        Copy_%3:
        mov cl , [eax] ; Copy To 1bit reg?
        cmp cl , 0
        jz Copy_Finish_%3
        mov [ebx] ,cl
        inc ebx
        inc eax
        jmp Copy_%3
        Copy_Finish_%3:
        ; Pop To Revent Regs Values
        pop ecx
        pop ebx
        pop eax
        %endmacro
        
                   ; arg1: src , arg2 : dis , 
            ; Must Save _returnWord in edx
            %macro append_char_To_Result 1
            ; Push To Save Value In Regs
            push eax
            push ebx
            push ecx
            
            
            
            ; Xor To Rest Regs
            xor eax , eax
            xor ebx , edx
            xor ecx , ecx 
            
            
            
            mov eax , %1
            mov ebx , _returnWord
            add ebx , edx
            
            
            
            
            mov cl , [eax] ; Copy To 1bit reg?
            mov [ebx] ,cl
            inc edx

            
                   
            ; Pop To Revent Regs Values
            pop ecx
            pop ebx
            pop eax
            %endmacro
            
            
                   ; arg1: src , arg2 : dis , 
            ; Must Save _returnWord in edx
            %macro append_long_To_Result 1
            ; Push To Save Value In Regs
            push eax
            push ebx
            push ecx
            
            
            
            ; Xor To Rest Regs
            xor eax , eax
            xor ebx , edx
            xor ecx , ecx 
            
            
            
            mov eax , %1
            mov ebx , _returnWord
            add ebx , edx
            
            
            
              
            ; Copy input Arg To _Str
        mov ecx , [eax] ; Copy To 1bit reg?
        mov [ebx] ,ecx
        
        add edx ,4d
        
                   
            ; Pop To Revent Regs Values
            pop ecx
            pop ebx
            pop eax
            %endmacro
            
                    
        
        
        ;Append To STR 
        ;arg1: src , arg2 : disToAppend , arg3 : Counter
        %macro append_Str_from_pos 1
        ; Push To Save Value In Regs
        push eax
        push ebx
        push ecx
        push edx
        
        
        
        
        ; Xor To Rest Regs
        xor eax , eax
        xor ebx , ebx
        xor ecx , ecx
        xor edx , edx
        
        
        
        
        mov eax , %1
        mov ebx , _str
        
        mov edx ,[current_length]
        add ebx , edx ; Move To Pos To Append
        
        
        
        
        mov cl , [eax] ; Copy To 1bit reg?
        mov [ebx] ,cl
        inc edx
        
        
        
        mov [current_length] , edx ; To Save To current_length
        
        
        ; Pop To Revent Regs Values
        pop edx
        pop ecx
        pop ebx
        pop eax
        %endmacro
        
        
        ;Append To STR 
        ;arg1: src , arg2 : disToAppend , arg3 : Counter
        %macro append_Dec_Str_from_pos 1
        ; Push To Save Value In Regs
        push eax
        push ebx
        push ecx
        push edx
        
        
        
        
        ; Xor To Rest Regs
        xor eax , eax
        xor ebx , ebx
        xor ecx , ecx
        xor edx , edx
        
        
        
        
        mov eax , %1
        mov ebx , _str
        
        mov edx ,[current_length]
        add ebx , edx ; Move To Pos To Append
        
        
        
        ; Copy input Arg To _Str
        mov cl , [eax] ; Copy To 1bit reg?
        mov [ebx] ,cl
        inc edx
        
        
        
        mov [current_length] , edx ; To Save To current_length
        
        
        ; Pop To Revent Regs Values
        pop edx
        pop ecx
        pop ebx
        pop eax
        %endmacro
        
        ; set_word_char_at 
        ;arg1: src , arg2 : disToSet , arg3 : Pos
        %macro print_str_char_at 1
        ; Push To Save Value In Regs
        
        push ebx
        push edx
        
        
        
        
        ; Xor To Rest Regs
        
        xor ebx , ebx
        xor edx , edx
        
        
        
        
        mov ebx , _str
        
        
        
        mov edx ,%1
        
        add ebx , edx ; Move To Pos To Append
        mov bl , [ebx]
        
        
        
        
        PRINT_STRING Str_Char_At
        PRINT_HEX 1 , bl
        NEWLINE
        
        
        
        
        
        ; Pop To Revent Regs Values
        pop edx
        pop ebx
        %endmacro
        
        
        ;Last Char Set STR 
        ;arg1: src , arg2 : disToSetLast , arg3 : Counter
        %macro set_str_last_char 1
        ; Push To Save Value In Regs
        push eax
        push ebx
        push ecx
        push edx
        
        
        
        
        ; Xor To Rest Regs
        xor eax , eax
        xor ebx , ebx
        xor ecx , ecx
        xor edx , edx
        
        
        
        
        mov eax , %1
        mov ebx , _str
        
        mov edx ,[current_length]
        add ebx , edx ; Move To Pos To Append
        
        
        
        ; Copy input Arg To _Str
        mov cl , [eax] ; Copy To 1bit reg?
        mov [ebx] ,cl
        
        
        
        ; Pop To Revent Regs Values
        pop edx
        pop ecx
        pop ebx
        pop eax
        %endmacro
        
        
        ; set_word_char_at 
        ;arg1: src , arg2 : disToSet , arg3 : Pos
        %macro set_word_char_at 2
        ; Push To Save Value In Regs
        push eax
        push ebx
        push ecx
        push edx
        
        
        
        
        ; Xor To Rest Regs
        xor eax , eax
        xor ebx , ebx
        xor ecx , ecx
        xor edx , edx
        
        
        
        
        mov eax , [%1] 
        mov ebx , _word
        
        
        
        push eax
        
        
        mov eax , 4d
        mov edx ,%2
        mul edx
        mov edx , eax
        
        
        pop eax
        
        
        
        
        add ebx , edx ; Move To Pos To Append
        
        
        
        
        ; Copy input Arg To _Str
        mov [ebx] , eax
        
        ;PRINT_HEX 4,_word
        ;NEWLINE
        
        
        
        ; Pop To Revent Regs Values
        pop edx
        pop ecx
        pop ebx
        pop eax
        %endmacro
        
        
        
        ; set_word_char_at 
        ;arg1: src , arg2 : disToSet , arg3 : Pos
        %macro print_word_char_at 1
        ; Push To Save Value In Regs
        
        push eax
        push ebx
        push edx
        
        
        
        
        ; Xor To Rest Regs
        
        xor eax , eax
        xor ebx , ebx
        xor edx , edx
        
        
        
        
        mov ebx , _word
        
        
        
        mov eax , 4d
        mov edx ,%1
        mul edx
        
        add ebx , eax ; Move To Pos To Append
        
        
        
        
        PRINT_STRING Word_Char_At
        PRINT_HEX 4 , [ebx]
        NEWLINE
        
        
        
        
        
        ; Pop To Revent Regs Values
        pop edx
        pop ebx
        pop eax
        %endmacro
        
        
        
        ; get_word_char_at 
        ; return in ecx
        %macro get_word_char_at 0
        ; Push To Save Value In Regs
        
        push eax
        push ebx
        
        
        
        
        ; Xor To Rest Regs
        
        xor eax , eax
        xor ebx , ebx
        xor ecx , ecx
        
        
        
        
        mov eax , [index_get_word_char_at]
        
        mov ebx , 4d
        mul ebx
        
        
        mov ebx , _word 
        add ebx , eax ; Move To Pos To Append
        
        
        mov ecx ,[ebx]
        
        
        
        ; Pop To Revent Regs Values
        pop ebx
        pop eax
        %endmacro
        
        
        
        
        
        
        
        ; return In ecx Reg
        %macro count_string_length 2
        
        
        ; Push To Save Value In Regs
        push eax
        push ebx
        
        
        ; Xor To Rest Regs
        xor eax , eax
        xor ebx , ebx
        xor ecx , ecx
        
        
        
        
        mov eax, %1 ; Move txt To eax
        
        
        ;Count _Str length
        StrLen_%2:
        mov ebx, [eax]
        cmp ebx, 0
        jz StrLen_Finish_%2
        inc ecx ; _Str length ++
        inc eax ; next Char Iterator
        jmp StrLen_%2
        
        
        StrLen_Finish_%2:
        mov [current_length] , ecx ; To Save To current_length
        
        
        
        
        ; Pop To Revent Regs Values
        pop ebx
        pop eax
        
        
        %endmacro
        
        ; inc_current_length and Put It in eax
        %macro inc_current_length 0
        ; Push To Save Value In Regs
        xor eax , eax
        mov eax , [current_length]
        inc eax
        mov [current_length] , eax
        %endmacro
        
        ; dec_current_length and Put It in eax
        %macro dec_current_length 0
        ; Push To Save Value In Regs
        xor eax , eax
        mov eax , [current_length]
        dec eax
        mov [current_length] , eax
        %endmacro
        
        
        ; inc_current_length and Put It in eax
        %macro inc_current_length_BySize 1
        ; Push To Save Value In Regs
        xor eax , eax
        mov eax , [current_length]
        add eax , %1
        mov [current_length] , eax
        %endmacro
        
        ; inc_current_length and Put It in eax
        %macro dec_current_length_BySize 1
        ; Push To Save Value In Regs
        xor eax , eax
        mov eax , [current_length]
        sub eax , %1
        mov [current_length] , eax
        %endmacro
        
        ; inc_word_length
        %macro inc_word_length 0
        ; Push To Save Value In Regs
        push eax
        xor eax , eax
        mov eax , [word_length]
        inc eax
        mov [word_length] , eax
        pop eax
        %endmacro
        
        
        
        ; Rotate_Left return in ecx
        %macro Rotate_Left_ONE 1
        ; Push To Save Value In Regs
        push eax
        push ebx
        
        xor eax , eax
        xor ebx , ebx
        
        mov eax , %1
        shl eax , 1d
        
        mov ebx , %1
        shr ebx , 31d
        
        or ebx , eax
        mov [Rotate_Left_Result] , ebx ; Return In Rotate_Left_Result
        
        ; Pop To Revent Regs Values
        pop ebx
        pop eax
        %endmacro
        
        
        ; Rotate_Left return in ecx
        %macro Rotate_Left_FIVE 1
        ; Push To Save Value In Regs
        push eax
        push ebx
        
        xor eax , eax
        xor ebx , ebx
        
        mov eax , %1
        shl eax , 5d
        
        mov ebx , %1
        shr ebx , 27d
        
        or ebx , eax
        mov ecx , ebx ; Return In ecx
        
        ; Pop To Revent Regs Values
        pop ebx
        pop eax
        %endmacro
        
        ; Rotate_Left return in ecx
        %macro Rotate_Left_THIRTY 1
        ; Push To Save Value In Regs
        push eax
        push ebx
        
        xor eax , eax
        xor ebx , ebx
        
        mov eax , %1
        shl eax , 30d
        
        mov ebx , %1
        shr ebx , 2d
        
        or ebx , eax
        mov [Rotate_Left_Result] , ebx ; Return In Rotate_Left_Result
        
        ; Pop To Revent Regs Values
        pop ebx
        pop eax
        %endmacro
        
        
        
        
        
        
        
        
        
        section .data
        
        
        ; dd Is 4 bytes

        
        _str times 10000000 db 0b ; Str Char*
        _word times 80 dd 0d; long int Word [80]
        _returnWord times 100 db 0b ; Char* Return OBj
        
        
        
        
        current_length dd 0d
        word_length dd 0d
        
        
        original_length dd 0d
        number_of_chunks dd 0d
        
        
        
        
        
        
        ;copy_string_Counter dd 0
        ;count_string_length_Counter dd 0
        ;append_string_from_pos_Counter dd 0
        
        
        
        
        temp_128 dd 0x80
        temp_0 dd 0x00
        null_Terminator dd '\0'
        Space dd " "
        Hash dd "HASH : "
        Str_number_of_chunks dd "number_of_chunks : "
        Str_current_length dd "current_length_"
        Str_Char_At dd "Char At Is :"
        Word_Char_At dd "Word_char_at :"
        seprator dd " : "
        
        
        temp_Word dd 0d
        temp_Word_index dd 0d
        
        
        
        
        temp_str_1 dd 0d
        temp_str_2 dd 0d
        temp_str_3 dd 0d
        temp_str_4 dd 0d
        
        
        
        
        temp_word_1 dd 0d
        temp_word_2 dd 0d
        temp_word_3 dd 0d
        temp_word_4 dd 0d
        
        
        index_Str_Loop3 dd 0d
        index_get_word_char_at dd 0d
        index_print_word_char_at dd 0d
        
        
        Rotate_Left_Result dd 0d
        
        
        temp_one dd 0d
        temp_two dd 0d
        
        
        
        
        
        
        a dd 0x67452301
        b dd 0xEFCDAB89
        c dd 0x98BADCFE
        d dd 0x10325476
        e dd 0xC3D2E1F0
        f dd 0d
        k dd 0d
        temp dd 0d
        
        
        
        
        h0 dd 0x67452301
        h1 dd 0xEFCDAB89
        h2 dd 0x98BADCFE
        h3 dd 0x10325476
        h4 dd 0xC3D2E1F0
        
        
        
        
        
        
        

        section .text
        global _ASM_HASH
        _ASM_HASH:
        ;global CMAIN
        ;CMAIN:
          push    ebp             ; create stack frame
          mov     ebp, esp
        
         cmp     edi, 0          ; Check if base is negative
         mov     eax, 0          ; and return 0 if so
         jl      end
        
        
        
          copy_string [ebp+8] , _str , 0
          count_string_length _str ,0 ; Copy Return In ecx Reg
             
         mov [original_length] , ecx ; To Save To original_length
        
         append_Str_from_pos temp_128 
             
             
        inc ecx ; For temp_128
        and ecx , 3fh ; Mod 64 = 2^6
        cmp ecx , 56d ;if (ib < 56)
        jl sate1
        ;ib = 120 - ib;
        mov edx , 120d
        sub edx , ecx
        mov ecx , edx
        jmp End_State
        
        
        sate1:
        ;ib = 56 - ib;
        mov edx , 56d
        sub edx , ecx
        mov ecx , edx
        jmp End_State
        End_State:; lib === ecx
        push eax
        xor eax , eax
        ;for (i = 0; i < lb; i++)
        Loop1:
        inc eax
        append_Str_from_pos temp_0 
        loop Loop1
        pop eax
        
        
        ;PRINT_STRING Str_current_length
        ;PRINT_DEC 1 , 2
        ;PRINT_STRING seprator
        ;PRINT_DEC 4 , [current_length]
        ;NEWLINE
        
        
        inc edx
        
        
        
        ;str[current_length + 1] = '\0';
        inc_current_length
        set_str_last_char null_Terminator 
        dec_current_length
        
        
        
        
        ;for (i = 0; i < 6; i++)
        mov ecx , 6d
        Loop2:
        append_Str_from_pos temp_0 
        loop Loop2
        
        ;PRINT_STRING Str_current_length
        ;PRINT_DEC 1 , 3
       ; PRINT_STRING seprator
       ; PRINT_DEC 4 , [current_length]
       ; NEWLINE
        
        
        
        
        mov eax , 8d
        mov ebx , [original_length]
        mul ebx ; eax = eax * ebx -> original_length * 8
        mov ebx , 0x100
        div ebx ; eax =(original_length * 8) / ebx
        
        
        mov dword[temp_one] , eax
        ; str[current_length] = (original_length * 8) / 0x100;
        append_Dec_Str_from_pos temp_one 
        
        
        mov eax , 8d
        mov ebx ,[original_length]
        mul ebx ; eax = eax * ebx -> original_length * 8
        
        
        and eax , 11111111b ; Mod 256 = 2^8 -> ffh Wrong??
        
        mov dword[temp_one] , eax
        ;str[current_length] = (original_length * 8) % 0x100;
        append_Dec_Str_from_pos temp_one 
        
        ;mov eax , [current_length]
        ;dec eax
        ;PRINT_DEC 4 , eax
        ;NEWLINE
        ;print_str_char_at eax
        
        
        ;OK
        
        
        
        
        
        
        ;str[current_length + i] = '\0';
        inc_current_length_BySize 6
        set_str_last_char null_Terminator 
        dec_current_length_BySize 6
        
       ; PRINT_STRING Str_current_length
       ; PRINT_DEC 1 , 4
       ; PRINT_STRING seprator
       ; PRINT_DEC 4 , [current_length]
       ; NEWLINE
       ; NEWLINE
        
        
        mov ebx , 64d
        div ebx
        
        
        mov [number_of_chunks] , eax
        
        ;PRINT_STRING Str_number_of_chunks
        ;PRINT_DEC 4 , number_of_chunks
        ;NEWLINE
       ; NEWLINE
        
        ;OK
        
        
        ; Check IF number_of_chunks Is not Zero
        cmp eax , 0d
        jz EndLoop3
        mov ebx , 0 
        
        Loop3:
        cmp ebx , eax
        je EndLoop3
        
        
        ;for (j = 0; j < 16; j++)
        mov ecx , 0d
        push eax
        Loop3_1:
        cmp ecx , 16d
        je EndLoop3_1
        
        
        
        ;===========================
        
        ;i * 64
        mov eax , 64d
        mul ebx
        ; Buffer eax
        mov edx , eax
        
        
        ;j * 4
        mov eax , 4d
        mul ecx
        
        
        
        add eax , edx ; Now eax = [i * 64 + j * 4]
        mov [index_Str_Loop3] , eax
        
        ;OK
        
        ;al = str[i * 64 + j * 4]
        mov edx , _str
        add edx , eax
        
        xor eax , eax
        
        mov al , [edx] 
        movzx eax , al ;Extend To 32bit reg
        
        push ecx
        
        ; eax = str[i * 64 + j * 4] * 0x1000000
        mov ecx , 0x1000000
        mul ecx 
        
        mov [temp_str_1] , eax
        
        
        pop ecx
        
        
        ;=========================== OK
        
        ; [i * 64 + j * 4 + 1]
        mov eax ,[index_Str_Loop3]
        inc eax
        
        
        ;al = str[i * 64 + j * 4 + 1]
        mov edx , _str
        add edx , eax
        
        xor eax , eax
        
        mov al , [edx] 
        movzx eax , al ;Extend To 32bit reg
        
        
        push ecx
        
        ; eax = str[i * 64 + j * 4] * 0x10000
        mov ecx , 0x10000
        mul ecx 
        
        mov [temp_str_2] , eax
        
        
        pop ecx
        
        ;=========================== OK
        
        ; [i * 64 + j * 4 + 2]
        mov eax ,[index_Str_Loop3]
        add eax , 2d
        
        
        ; al =[i * 64 + j * 4 + 2]
        mov edx , _str
        add edx , eax
        
        xor eax , eax
        
        mov al , [edx] 
        movzx eax , al ;Extend To 32bit reg
        
        push ecx
        
        ; eax = str[i * 64 + j * 4] * 0x100
        mov ecx , 0x100
        mul ecx 
        
        mov [temp_str_3] , eax 
        
        
        
        
        pop ecx
        
        ;=========================== OK
        
        ; [i * 64 + j * 4 + 3]
        mov eax ,[index_Str_Loop3]
        add eax , 3d
        
        
        
        
        
        
        ; al =[i * 64 + j * 4 + 3]
        mov edx , _str
        add edx , eax
        
        xor eax , eax
        
        mov al , [edx] 
        movzx eax , al ;Extend To 32bit reg
        
        
        mov [temp_str_4] , eax
        
        
        
        ;PRINT_HEX 4 , eax
        ;NEWLINE
        
        
        ;=========================== OK
        
        push eax
        push ebx
        
        ;eax= str[i * 64 + j * 4] * 0x1000000
        ; +
        ; str[i * 64 + j * 4 + 1] * 0x10000
        ; +
        ; str[i * 64 + j * 4 + 2] * 0x100
        ; +
        ; str[i * 64 + j * 4 + 3];
        
        
        mov eax , [temp_str_1]
        mov ebx , [temp_str_2]
        add eax , ebx
        mov ebx , [temp_str_3]
        add eax , ebx
        mov ebx , [temp_str_4]
        add eax , ebx
        
        
        
        
        
        
        ; SET FOR J
        ; Word[j] = eax
        mov dword[temp_Word] , eax
        mov dword[temp_Word_index] , ecx
        
        
        set_word_char_at temp_Word , [temp_Word_index]
        
        
        
        pop ebx
        pop eax
        
        
        inc ecx
        jmp Loop3_1
        EndLoop3_1:
        ;print_word_char_at 15
        ;OK OK
        ;PRINT_STRING _word
        ;NEWLINE
        
        ;for (j = 16; j < 80; j++)
        mov ecx , 16d
        Loop3_2:
        cmp ecx , 80d
        je EndLoop3_2
        
        
        push eax
        
        ;===========================
        
        ;j - 3
        mov eax , ecx
        sub eax , 3d
        
        
        push ecx
        mov [index_get_word_char_at] , eax
        get_word_char_at ;Put Pos From index_get_word_char_at
        ; Return in ecx -> so Push it
        mov dword[temp_word_1] , ecx
        
        
        pop ecx
        
        
        
        ;===========================
        
        ;j - 8
        mov eax , ecx
        sub eax , 8d
        
        push ecx
        mov [index_get_word_char_at] , eax
        get_word_char_at ;Put Pos From index_get_word_char_at
        ; Return in ecx -> so Push it
        mov dword[temp_word_2] , ecx
        pop ecx
        
        
        
        
        ;===========================
        ;j - 14
        mov eax , ecx
        sub eax , 14d
        
        ;al = word[j - 14]
        push ecx
        mov [index_get_word_char_at] , eax
        get_word_char_at ;Put Pos From index_get_word_char_at
        ; Return in ecx -> so Push it 
        ; print_word_char_at eax
        mov dword[temp_word_3] , ecx
        pop ecx
        
        
        ;===========================
        
        ;j - 16
        mov eax , ecx
        sub eax , 16d
        
        ;al = word[j - 16]
        push ecx
        mov [index_get_word_char_at] , eax
        get_word_char_at ;Put Pos From index_get_word_char_at
        ; Return in ecx -> so Push it
        ; print_word_char_at eax
        mov dword[temp_word_4] , ecx
        pop ecx
        
        
        ;===========================
        
        push edx
        
        
        xor edx , edx
        xor eax , eax
        
        ;word[j - 3]
        ;^
        ;word[j - 8]
        ;^
        ;word[j - 14]
        ;^
        ;word[j - 16]
        
        mov edx , [temp_word_1]
        xor edx , [temp_word_2]
        xor edx , [temp_word_3]
        xor edx , [temp_word_4]
        
        
        ;rotateleft -> No Need ->replace With rol
        ;Rotate_Left_ONE edx ; return in Rotate_Left_Result
        ;word[j] = rotateleft(....)
        rol edx , 1d
        
        
        
        mov dword[temp_Word] , edx
        mov dword[temp_Word_index] , ecx
        set_word_char_at temp_Word , [temp_Word_index]
        
        ;print_word_char_at ecx
        
        
        
        ;PRINT_HEX 4 , _word
        ;NEWLINE
        
        
        
        
        pop edx
        
        
        pop eax
        inc ecx
        jmp Loop3_2
        EndLoop3_2:
        ;PRINT_STRING _word
        ;NEWLINE
        ;OK
        
        push eax
        push ebx
        push ecx
        push edx
        
        
        
        xor eax ,eax
        xor ebx ,ebx 
        xor ecx ,ecx
        xor edx ,edx
        
        mov ecx , 0d
        Loop3_3:
        cmp ecx , 80d
        je EndLoop3_3
        
        
        mov eax , 19d
        cmp eax , ecx
        jl Else_IF_1 ; if (m < 20) or if (m <= 19)
        
        ;(b & c)
        mov ebx , [b]
        mov edx , [c]
        
        and ebx , edx
        push ebx ; push (b & c)
        
        ;(~b) & d
        mov ebx , [b]
        mov edx , [d]
        
        not ebx 
        and ebx , edx
        
        pop edx ; pop (b & c)
        or edx , ebx ;edx = (b & c) | ((~b) & d);
        
        mov dword[f] , edx ;f = (b & c) | ((~b) & d);
        mov dword[k] , 0x5A827999
        
        jmp Break
        Else_IF_1:
        mov eax , 39d
        cmp eax , ecx
        jl Else_IF_2 ; else if (m < 40) or if (m <= 39)
        
        ;b ^ c ^ d;
        mov ebx , [b]
        xor ebx , [c]
        xor ebx , [d]
        
        
        mov dword[f] , ebx ;f = b ^ c ^ d;
        mov dword[k] , 0x6ED9EBA1
        jmp Break
        Else_IF_2:
        
        mov eax , 59d
        cmp eax , ecx
        jl Else_IF_3 ; else if (m < 60) or if (m <= 59)
        
        
        ;(b & c)
        mov ebx , [b]
        and ebx , [c]
        
        push ebx ;push (b & c)
        
        mov ebx ,[b]
        and ebx ,[d]
        
        push ebx ;push (b & d)
        
        mov ebx ,[c]
        and ebx ,[d] ;(c & d)
        
        pop edx ; pop (b & d)
        or ebx ,edx
        pop edx ; pop (b & c)
        or ebx , edx ;(b & c) | (b & d) | (c & d);
        
        
        mov dword[f] , ebx ;f = (b & c) | (b & d) | (c & d);
        mov dword[k] , 0x8F1BBCDC
        jmp Break
        Else_IF_3:
        
        ;b ^ c ^ d;
        mov ebx , [b]
        xor ebx , [c]
        xor ebx , [d]
        
        
        mov dword[f] , ebx ;f = b ^ c ^ d;
        mov dword[k] , 0xCA62C1D6
        
        Break:
        
        
        
        
        ;(rotateleft(a, 5) + f + e + k + word[m])
        xor ebx , ebx
        xor eax , eax
        xor edx , edx
        ;rotateleft(a, 5)
        mov eax , [a]
        rol eax , 5
        
        add eax , [f]
        add eax , [e] 
        add eax , [k]
        
        
        push ecx
        mov [index_get_word_char_at] , ecx
        get_word_char_at ;Put Pos From index_get_word_char_at
        ; Return in ecx -> so Push it
        ;PRINT_HEX 4 , ecx
        ;NEWLINE
        mov ebx , ecx
        pop ecx
        
        
        add eax , ebx ;eax=(rotateleft(a, 5) + f + e + k + word[m])
        and eax , 0xFFFFFFFF ;(rotateleft(a, 5) + f + e + k + word[m]) & 0xFFFFFFFF;
        
        ;temp = (rotateleft(a, 5) + f + e + k + word[m]) & 0xFFFFFFFF;
        mov dword[temp] , eax
        
        
        
        
        ;e = d;
        xor ebx , ebx
        mov ebx , [d]
        mov dword[e] , ebx
        
        
        ;d = c;
        xor ebx , ebx
        mov ebx , [c]
        mov dword[d] , ebx
        
        
        ; c = rotateleft(b, 30);
        xor ebx , ebx
        mov ebx , [b]
        
        rol ebx , 30d
        mov dword[c] , ebx
        
        
        ;b = a;
        xor ebx , ebx
        mov ebx , [a]
        mov [b] , ebx
        
        
        ;a = temp;
        xor ebx , ebx
        mov ebx , [temp]
        mov [a] , ebx
        
        
        
        inc ecx
        jmp Loop3_3
        EndLoop3_3:
        pop edx
        pop ecx
        pop ebx
        pop eax
        
        
        
        push eax
        push ebx
        
        xor eax ,eax
        xor ebx ,ebx 
        
        
        
        ;h0 = h0 + a;
        mov eax , [h0] 
        add eax , [a]
        mov dword[h0] , eax
        
        ;h1 = h1 + b;
        xor eax ,eax
        
        mov eax , [h1] 
        add eax , [b]
        mov dword[h1] , eax
        
        ;h2 = h2 + c;
        xor eax ,eax
        
        mov eax , [h2] 
        add eax , [c]
        mov dword[h2] , eax
        
        ;h3 = h3 + d;
        xor eax ,eax
        
        mov eax , [h3] 
        add eax , [d]
        mov dword[h3] , eax
        
        
        ;h4 = h4 + e;
        xor eax ,eax
        
        mov eax , [h4]
        add eax , [e]
        mov dword[h4] , eax
        
        
        pop ebx
        pop eax
        
        
        pop eax
        
        inc ebx
        jmp Loop3
        
        EndLoop3:
        
        ;PRINT_DEC 4 , eax
        ;NEWLINE
        
        ;PRINT_STRING Hash
        ;PRINT_HEX 4,[h0]
        ;PRINT_STRING Space
       ; PRINT_HEX 4,[h1]
       ; PRINT_STRING Space
        ;PRINT_HEX 4,[h2]
        ;PRINT_STRING Space
        ;PRINT_HEX 4,[h3]
        ;PRINT_STRING Space
        ;PRINT_HEX 4,[h4]
        ;PRINT_STRING Space
        
        
       xor edx , edx ; To Rest ecx for save _returnWord lenght
       mov edx , 0d
        ;append_To_Result Space  
        append_long_To_Result h4
        ;append_char_To_Result Space  
        append_long_To_Result h3
        ;append_char_To_Result Space 
        append_long_To_Result h2
        ;append_char_To_Result Space 
        append_long_To_Result h1 
        ;append_char_To_Result Space 
        append_long_To_Result h0 
        
                
      
      mov  eax,  _returnWord    ; Return _Word
            
        
        
        
        
end:
      pop     ebp             ; restore the base pointer
      ret   
            
