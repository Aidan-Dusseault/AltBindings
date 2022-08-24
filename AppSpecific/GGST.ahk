#IfWinActive ahk_exe GGST-Win64-Shipping.exe

$*~Space::
if(GetKeyState("s", "p"))
    SendInput {Blind}{s up}
Return

$*~Space UP::
if(GetKeyState("s", "p"))
    SendInput {Blind}{s down}{Space up}
Return

#IfWinActive