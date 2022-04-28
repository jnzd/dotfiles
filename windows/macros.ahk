; move through virtual desktops
^#l::Send, ^#{Right}
^#h::Send, ^#{Left}
; snap windows
#+k::Send, #{Up}
#+l::Send, #{Right}
#+h::Send, #{Left}
#+j::Send, #{Down}
; open terminal
/*^Enter::Run, wt.exe*/
; remap capslock to escape and vice versa


SetCapsLockState, AlwaysOff

#If GetKeyState("CapsLock", "P")
h::Left
j::Down
k::Up
l::Right
u::Send, {PgUp}
d::Send, {PgDn}
i::Send, {Home}
a::Send, {End}
x::Send, {Del}
y::Send, ^c
p::Send, ^v
#If

*CapsLock::
KeyWait, CapsLock
if A_ThisHotkey = *CapsLock
  Send, {Esc}

SetCapsLockState, Off

/* $Esc:: */
/*   if (GetKeyState("CapsLock", "T")) { */
/*     SetCapsLockState, Off */
/*   } else { */
/*     SetCapsLockState, On */
/*   } */

return
