PROCESSOR 16F887 
    #include <xc.inc>  
    
    CONFIG FOSC= INTRC_NOCLKOUT 
    CONFIG WDTE= OFF
    CONFIG PWRTE=ON
    CONFIG MCLRE=OFF
    CONFIG CP=   OFF
    CONFIG CPD=  OFF
    CONFIG BOREN= OFF
    CONFIG IESO=  OFF
    CONFIG FCMEN= OFF
    CONFIG LVP=   OFF
    CONFIG DEBUG= ON
    
    CONFIG BOR4V=BOR40V
    CONFIG WRT=OFF
     
PSECT udata
mask:
    DS 1
cont:
    ds 1
    
PSECT resetVEC,class=CODE, delta=2
resetvec:
    PAGESEL main
    goto main
    
    PSECT code
 cero:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11111100
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
uno:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b01100000
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
dos:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11011010 
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
tres:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11110010 
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
cuatro:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b01100110 
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
 cinco:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b10110110 
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
 seis:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b10111110 
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
 siete:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11100000 
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
 ocho:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11111110 
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
 nueve:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11110110 
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
 retardo:
    bcf STATUS,6
    bcf STATUS,5
    movlw 0b00000001
    movwf 0x20
 
    P1:
    incfsz 0x20,f
    goto P1
    bcf STATUS,6
    bcf STATUS,5
    movlw 0b00000001
    movwf 0x21
 
    P2:
    incfsz 0x21,f
    goto P2
    bcf STATUS,6
    bcf STATUS,5
    movlw 0b00000001
    movwf 0x22
 
    P3:
    incfsz 0x22,f
    btfss 0x22,3
    goto P3
    return
        
    PSECT code
    main:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    BANKSEL OSCCON
    movlw   0x71    
    movwf   OSCCON
    movlw 0b00000000
    movwf PORTA
 
    loop:
    PAGESEL cero
    call cero
    call retardo
    call uno
    call retardo
    call dos
    call retardo
    call tres
    call retardo
    call cuatro
    call retardo
    call cinco
    call retardo
    call seis
    call retardo
    call siete
    call retardo
    call ocho
    call retardo
    call nueve
    call retardo
    goto loop
    END