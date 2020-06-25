#IfWinActive ahk_exe MassEffect3.exe

wheelUpDelay = 0
wheelDownDelay = 0

~*$WheelUp::
if (!wheelUpDelay) {
	wheelUpDelay = 1
	Send {Blind}{PgUp}
	SetTimer WheelUpTimer, -100
}
Return
WheelUpTimer:
	wheelUpDelay = 0
Return

~*$WheelDown::
if (!wheelDownDelay) {
	wheelDownDelay = 1
	Send {Blind}{PgDn}
	SetTimer WheelDownTimer, -100
}
Return
WheelDownTimer:
		wheelDownDelay = 0
Return

*$End::
autoFire := !autoFire
SetTimer AutoFire, Delete
SetTimer AutoFireRelease, Delete
return

~*$LButton::
if (autoFire = 1) {
	SetTimer AutoFire, -1
}
return
AutoFire: 
	if (GetKeyState("LButton", "P")) {
		Send {Blind}{F2 Down}
		SetTimer AutoFireRelease, -1
	}
return
AutoFireRelease:
	Send {Blind}{F2 Up}
	if (GetKeyState("LButton", "P")) {
		SetTimer AutoFire, -1
	}
return

#IfWinActive