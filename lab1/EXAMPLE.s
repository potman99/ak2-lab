# Funkcje systemowe
SYSCALL = 0x80
SYSEXIT = 1
STDOUT = 1
SYSFORK = 2
READ = 3
SYSWRITE = 4

.data
msg: .string "Enter ASCII string\n"
msgLen= .-msg

threeBytes:
.ascii "   "          #rezerwuje pamięć na stringa

.lcomm oneByte, 1   #rezerwacja w pamięci miejsca na 1 bajt

#===========================================================================
#====================== FUNKCJE ============================================

# Wyświetl wiadomość powitalną
message:
  movl $SYSWRITE, %eax
  movl $STDOUT, %ebx
  movl $msg, %ecx
  movl $msgLen, %edx
  int $SYSCALL
  ret


# Wczytaj tekst podany przez użytkownika
read:
  movl $READ , %eax     #wywołanie wczytywania
  movl $0, %ebx
  movl $oneByte, %ecx   #wpisanie wczytanego symbolu do zmiennej
  movl $1, %edx         #długość wczytywanego łańcucha
  int $SYSCALL
  ret

# Nałożenie maski na 4 wyższe bity
switch4Upper:
  movl $0, %esi    #ustawienie wskaźnika dla 1 znaku
  movb %al,%bl
  shrb $4 , %bl   #przesunięcie liczby o 4 bity w prawo
  andb $0b00001111,%bl  #logiczny AND
  call adjustASCII
  ret

# Nałożenie maski na 4 niższe bity
switch4Lower:
  movl $1, %esi    #ustawienie wskaźnika dla 2 znaku
  movb %al,%bl
  andb $0b00001111,%bl  #logiczny AND
  call adjustASCII
  ret

# Sprawdzenie znaków i ustawienie odpowidnich kodów ASCII
adjustASCII:
  cmpb $9, %bl    #sprawdzenie czy otrzymane 4bity w rejestrze bl
  jg letter       #skok jeśli wartość >9

  # Operacje jeśli jest to cyfra

  addb $48,%bl     #dodajemy 48 aby uzyskać kod ASCII cyfr
  jmp result

  letter:
  addb $55,%bl     #dodajemy 55 aby uzyskać kod ASCII liter

  result:
  movb %bl, threeBytes(%esi)

  ret

# Wyświetl odpowiedź
display:
  movl $SYSWRITE, %eax
  movl $STDOUT, %ebx
  movl $threeBytes, %ecx    #przekazanie zmiennej do wyświetlenia
  movl $3, %edx             #długość wyświetlanej odpowidzi dla jednego kodu ASCII
  int $SYSCALL
  ret

#=============================================================================
#=============================================================================

.text
.global _start
_start:
      call message
    loop:
      call read           # wywołanie funkcji do wczytywania znakóœ
      movl %eax, %edi     #iterator pętli
      movb oneByte, %al   # skopiowanie wczytanej zawartości do rejestru al
      call switch4Upper   #zamiana 4 wyższych bitóœ
      call switch4Lower   #zamiana 4 niższych bitów
      call display        #wyświetlenie wyniku
      cmpl $1, %edi       #sprawdzenie warunku pętli
      je loop
      int $SYSCALL

movl $SYSEXIT,%eax
int $SYSCALL



# Check letter case
cmpl %eax, 96
jl lowercase


uppercase:
subl $32, %eax
jmp continue

lowercase: 
addl $32, %eax


continue:
