#IfWinActive Greenshot image editor

~+^c::
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