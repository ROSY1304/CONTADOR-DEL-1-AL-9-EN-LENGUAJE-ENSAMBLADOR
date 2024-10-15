.model small
.stack 100h
.data
    msg db 'Conteo ascendente: $'
    number db 1   ; Comenzar desde 1

.code
main:
    ; Inicializaci?n
    mov ax, @data
    mov ds, ax

    ; Mostrar el mensaje de conteo
    mov dx, offset msg
    mov ah, 09h
    int 21h

    ; Ciclo de conteo ascendente
countup:
    ; Convertir el n?mero a ASCII para mostrar
    add number, '0'
    mov dl, number
    mov ah, 02h    ; Funci?n para imprimir un car?cter
    int 21h
    sub number, '0' ; Restaurar el valor original

    ; Incrementar el n?mero
    inc number

    ; Comprobar si el conteo ha llegado a 10
    cmp number, 10
    jl countup      ; Saltar si el n?mero es menor que 10

    ; Finalizar el programa
    mov ax, 4C00h
    int 21h
end main
