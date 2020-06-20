#IfWinActive Mass Effect 3

*$End::
autoFire := !autoFire
SetTimer AutoFire, Delete
SetTimer AutoFireRelease, Delete
return

~*$LButton::
if (autoFire = 1) {
	SetTimer AutoFire, -1
	
	AutoFire: 
		Send {Blind}{Home Down}
		SetTimer AutoFireRelease, -1
	return
	
	AutoFireRelease:
		Send {Blind}{Home Up}
		if (GetKeyState("LButton", "P")) {
			SetTimer AutoFire, -1
		}
	return
}
return
