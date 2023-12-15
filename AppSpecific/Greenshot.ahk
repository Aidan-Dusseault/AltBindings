#IfWinActive Greenshot image editor

^c::
	ControlSend, ahk_parent, {Alt down}{Alt up}{Shift down}{Control down}c{Shift up}{Control up}, Greenshot image editor
	Sleep, 10
	WinClose, Greenshot image editor
Return
	
^!c::
	ControlSend, ahk_parent, {Shift down}{Control down}c{Shift up}{Control up}, Greenshot image editor
Return

^w::
	WinClose, Greenshot image editor
Return

#IfWinActive