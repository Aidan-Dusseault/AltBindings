FFXIVCameraLock = 0
FFXIVCameraLockPause = 0

#If (FFXIVCameraLock) and WinActive("ahk_exe ffxiv_dx11.exe")

*$LButton::
	Send {Blind}{[ down}
	Sleep 10
	Send {Blind}{[ up}
Return

*$RButton::
	Send {Blind}{] down}
	Sleep 10
	Send {Blind}{] up}
Return

*$WheelUp::
	Send {Blind}{, down}
	Sleep 10
	Send {Blind}{, up}
Return

*$WheelDown::
	Send {Blind}{. down}
	Sleep 10
	Send {Blind}{. up}
Return

#If ((!FFXIVCameraLock) and (!FFXIVCameraLockPause)) and WinActive("ahk_exe ffxiv_dx11.exe")

*$a::
	Send {Blind}{Left down}
Return

*$a UP::
	Send {Blind}{Left up}
	Send {Blind}{a up}
Return

*$d::
	Send {Blind}{Right down}
Return

*$d UP::
	Send {Blind}{Right up}
	Send {Blind}{d up}
Return

#IfWinActive ahk_exe ffxiv_dx11.exe

$*~!Tab::
FFXIVCameraLock = 0
FFXIVCameraLockPause = 0
Click, right, up
Send {Blind}{Left up}
Send {Blind}{Right up}
Send {Blind}{a up}
Send {Blind}{d up}
Return

*$~a::
Return

*$~d::
Return

*$~a UP::
	Send {Blind}{Left up}
Return

*$~d UP::
	Send {Blind}{Right up}
Return

$*XButton1::
if (FFXIVCameraLock) {
	FFXIVCameraLock := !FFXIVCameraLock
	CoordMode, Mouse, Screen
	YCoord := A_ScreenHeight/2.5
	XCoord := A_ScreenWidth/2
	Click, right, up, %XCoord%, %YCoord%
	if (GetKeyState("A", "P")) {
		Send {Blind}{a down}
	}
	if (GetKeyState("D", "P")) {
		Send {Blind}{d down}
	}
}
else if (!FFXIVCameraLock) {
	FFXIVCameraLock := !FFXIVCameraLock
	CoordMode, Mouse, Screen
	YCoord := A_ScreenHeight/2.5
	XCoord := A_ScreenWidth/2
	Click, right, down,  %XCoord%, %YCoord%
	if (GetKeyState("A", "P")) {
		Send {Blind}{Left down}
	}
	if (GetKeyState("D", "P")) {
		Send {Blind}{Right down}
	}
}
Return

$*XButton2::
if (FFXIVCameraLock) {
	FFXIVCameraLock := 0
	FFXIVCameraLockPause := 1
	CoordMode, Mouse, Screen
	YCoord := A_ScreenHeight/2.5
	XCoord := A_ScreenWidth/2
	Click, right, up,  %XCoord%, %YCoord%
}
Return

$*XButton2 UP::
if (FFXIVCameraLockPause) {
	FFXIVCameraLock := 1
	FFXIVCameraLockPause := 0
	CoordMode, Mouse, Screen
	YCoord := A_ScreenHeight/2.5
	XCoord := A_ScreenWidth/2
	Click, right, down, %XCoord%, %YCoord%
}
Return

;$*LButton::
;if (FFXIVCameraLock) {
	;CoordMode, Mouse, Screen
	;YCoord := A_ScreenHeight/2.5
	;XCoord := A_ScreenWidth/2
	;Click, right, up,  %XCoord%, %YCoord%
;}
;else {
	;Click, left, down
;}
;Return

;$*LButton UP::
;if (FFXIVCameraLock) {
	;CoordMode, Mouse, Screen
	;YCoord := A_ScreenHeight/2.5
	;XCoord := A_ScreenWidth/2
	;Click, left, down
	;Sleep 20
	;Click, left, up
	;Sleep 80
	;Click, right, down, %XCoord%, %YCoord%
;}
;else {
	;Click, left, up
;}
;Return

;$*RButton::
;if (FFXIVCameraLock) {
	;CoordMode, Mouse, Screen
	;YCoord := A_ScreenHeight/2.5
	;XCoord := A_ScreenWidth/2
	;Click, right, up,  %XCoord%, %YCoord%
;}
;else {
	;Click, right, down
;}
;Return

;$*RButton UP::
;if (FFXIVCameraLock) {
	;CoordMode, Mouse, Screen
	;YCoord := A_ScreenHeight/2.5
	;XCoord := A_ScreenWidth/2
	;Click, right, down
	;Sleep 20
	;Click, right, up
	;Sleep 80
	;Click, right, down, %XCoord%, %YCoord%
;}
;else {
	;Click, right, up
;}
;Return

~!q::
Return

~!e::
Return

~!r::
Return

~!t::
Return

~!f::
Return

~!g::
Return

~!1::
Return

~!2::
Return

~!3::
Return

~!4::
Return

~!5::
Return

~!6::
Return

~!7::
Return

~!8::
Return

~!9::
Return

~!0::
Return

~!z::
Return

~!x::
Return

~!c::
Return

#IfWinActive