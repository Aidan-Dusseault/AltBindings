#IfWinActive ahk_exe MassEffect3.exe

ME3WheelUpDelay = 0
ME3WheelDownDelay = 0

~*$WheelUp::
if (!ME3WheelUpDelay) {
	ME3WheelUpDelay = 1
	Send {Blind}{PgUp}
	SetTimer ME3WheelUpTimer, -100
}
Return
ME3WheelUpTimer:
	ME3WheelUpDelay = 0
Return

~*$WheelDown::
if (!ME3WheelDownDelay) {
	ME3WheelDownDelay = 1
	Send {Blind}{PgDn}
	SetTimer ME3WheelDownTimer, -100
}
Return
ME3WheelDownTimer:
		ME3WheelDownDelay = 0
Return

*$F14::
ME3AutoFire := !ME3AutoFire
SetTimer ME3AutoFire, Delete
SetTimer ME3AutoFireRelease, Delete
return

~*$LButton::
if (ME3AutoFire = 1) {
	SetTimer ME3AutoFire, -1
}
return
ME3AutoFire: 
	if (GetKeyState("LButton", "P")) {
		Send {Blind}{F2 Down}
		SetTimer ME3AutoFireRelease, -1
	}
return
ME3AutoFireRelease:
	Send {Blind}{F2 Up}
	if (GetKeyState("LButton", "P")) {
		SetTimer ME3AutoFire, -1
	}
return

#IfWinActive