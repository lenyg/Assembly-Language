;----------------------
;Lynnette Griffen       Lab 1
;
;Description: Tip Calculator that takes 
;user input and calculates the amount of 
;tip per person at 10% and 15% 
;-----------------------

;Library for I/O and other purposes
;--------------------------
include         c:\asmio\asm32.inc
includelib      c:\asmio\asm32.lib
includelib      c:\asmio\user32.lib
includelib      c:\asmio\kernel32.lib
;----------------------------------
.const
    NULL equ    0
;---------------------------
.data?                      ;Uninitalized data section
    Bill     dword   ?
    People   dword   ?
    Tip      dword   ?
    PerPerson dword ?
    
    
 .data                      ;Strings must be NULL terminated
    
    T10             dword   10
    T15             dword   15
    ToPercentage    dword   100
    inputBill       byte    "Enter the Bill Amount: $", NULL     ; User enter Bill
    inputPeople     byte    "Enter the number people eating: ", NULL    ; User enter People
    Total10         byte    "Total Tip at 10% Tip: $", NULL
    TotalPerPerson  byte    "Tip per person: $", NULL
    TotalBill       byte    "Total Bill: $", NULL
    Total15         byte    "Total at 15% Tip: $", NULL
    
    ;----------------------------
    .code
    ;start: 
    main proc       ;start of the main procedure

        ;Input Bill amount
        ;----------------
        mov     edx, OFFSET inputBill        ; String must be in edx
        call    WriteString             ; NOT CASE SENSITIVE
        call    ReadInt                 ;answer in EAX
        mov     Bill, eax                ; Store EAX in Bill
        
        ; Input Number of People
        ;-------------------------
        mov     edx, OFFSET inputPeople            ;String must be in edx
        call    WriteString                 ; Not CASE SENSITIVE
        call    ReadInt
        mov     People, eax                 ; Store EAX in People
        
        
        
        ; Calculate 10% tip
        ;---------------------          
        
        mov     eax, Bill
        imul    eax, T10                ; bill * 10
        cdq                         ;Convert Double to Quad: Extends EAX into EDX
        idiv    ToPercentage         ; divide by 100   
        mov     Tip, eax                ; 10% tip
        
        ;Print 10% Tip
        ;-------------------------
        call    Crlf                           ; Skip a line
        mov     eax, Tip
        mov     edx,    OFFSET  Total10            ; String must be in edx
        call    WriteString                     ; Not Case Sensitive
        call    WriteDec                        ; Prints contents of EAX
        
        ; Calculate Tip Per Person
        ;---------------------
        mov     eax, Tip
        cdq         
        idiv    People
        mov     Perperson, eax
        
        ; Print Per Person Tip
        ;---------------------
        call    Crlf                           ; Skip a line
        mov     eax, Perperson
        mov     edx,    OFFSET  TotalPerPerson            ; String must be in edx
        call    WriteString                     ; Not Case Sensitive
        call    WriteDec
        
        ; Calculate Total Bill
        ;---------------------
        mov     eax, Bill
        add     eax, Tip
        
        ; Print Total Bill
        ;---------------------
        call    Crlf                           ; Skip a line
        mov     edx,    OFFSET  TotalBill            ; String must be in edx
        call    WriteString                     ; Not Case Sensitive
        call    WriteDec 
        
        
        ; Calculate 15% tip
        ;--------------------- 
        mov     eax, Bill
        imul    eax, T15
        cdq
        idiv    ToPercentage
        mov     Tip, eax

        ;Print 15% Tip
        ;-------------------------
        call    Crlf                           ; Skip a line
        ;mov     eax, Tip
        mov     edx,    OFFSET  Total15            ; String must be in edx
        call    WriteString                     ; Not Case Sensitive
        call    WriteDec 
         
        ; Calculate Tip Per Person
        ;---------------------
      
        mov     eax, Tip
        cdq         
        idiv    People
        mov     Perperson, eax 
         
        ; Print Tip Per Person
        ;---------------------   
       ; mov     eax, Perperson
        call    Crlf                           ; Skip a line
        mov     edx,    OFFSET  TotalPerPerson            ; String must be in edx
        call    WriteString                     ; Not Case Sensitive
        call    WriteDec
        
        ; Calculate Total Bill
        ;---------------------
        mov     eax, Bill
        add     eax, Tip
        
        ; Print Total Bill
        ;---------------------
        call    Crlf                           ; Skip a line
        mov     edx,    OFFSET  TotalBill            ; String must be in edx
        call    WriteString                     ; Not Case Sensitive
        call    WriteDec
        
        
        
        call    readInt
        
        ret     0               ;Must always ret 0
 main   endp                    ;End of main procedure
        end    main             ;End of program
  ;end   start 