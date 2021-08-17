; move through virtual desktops
^#l::Send, ^#{Right}
^#h::Send, ^#{Left}
; snap windows
#+k::Send, #{Up}
#+l::Send, #{Right}
#+h::Send, #{Left}
#+j::Send, #{Down}
; open terminal
^Enter::Run, wt.exe
; remap capslock to escape and vice versa
; ISSUE: capslock key still triggers capslock if a key not specified below is pressed while capslock is held
*CapsLock::Esc
$Esc::CapsLock

; vim motions everywhere
; ISSUE: capslock still lights up and is triggered while held
; TODO potentially add count to commands
CapsLock & h::Send, {Left}
CapsLock & j::Send, {Down}
CapsLock & k::Send, {Up}
CapsLock & l::Send, {Right}
CapsLock & u::Send, {PgUp}
CapsLock & d::Send, {PgDn}
CapsLock & i::Send, {Home}
CapsLock & a::Send, {End}
CapsLock & x::Send, {Del}
CapsLock & y::Send, ^c
CapsLock & p::Send, ^v

return
