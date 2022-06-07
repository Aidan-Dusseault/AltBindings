FFXIVClickLock = 0
FFXIVClick = 0

#If (FFXIVClick) or WinActive("ahk_exe ffxiv_dx11.exe")

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

~*$MButton::
	if (GetKeyState("RButton", "P")) {
		FFXIVClickLock = 1
	}
	Click, right, down
	;Send {Blind}{Down down}
	FFXIVClick = 1
Return

~*$MButton UP::
	;Send {Blind}{Down up}
Return

~*$XButton1::
	if (GetKeyState("RButton", "P")) {
		FFXIVClickLock = 1
	}
	Click, right, down
	;Send {Blind}{Left down}
	FFXIVClick = 1
Return

~*$XButton1 UP::
	;Send {Blind}{Left up}
Return

~*$XButton2::
	if (GetKeyState("RButton", "P")) {
		FFXIVClickLock = 1
	}
	Click, right, down
	;Send {Blind}{Right down}
	FFXIVClick = 1
Return

~*$XButton2 UP::
	;Send {Blind}{Right up}
Return

~*$LButton::
	;Click, left, down
	FFXIVClick = 1
	if (GetKeyState("RButton", "P")) {
		FFXIVClickLock = 1
	}
Return

~*$LButton UP::
	;Click, left, up
	FFXIVClick = 0
Return

*$RButton::
	Click, right, down
	FFXIVClick = 1
	if (GetKeyState("LButton", "P")) {
		FFXIVClickLock = 1
	}
Return

*$RButton UP::
	if (!WinActive("ahk_exe ffxiv_dx11.exe")) {
		Click, right, up
	}
	else if (FFXIVClickLock = 1) {
		FFXIVClickLock = 0
	}
	else {
		Click, right, up
	}
	FFXIVClick = 0
Return

;*$WheelUp::
;	Send {Blind}{[ down}
;	Sleep 250
;	Send {Blind}{[ up}
;Return
;
;*$WheelDown::
;	Send {Blind}{] down}
;	Sleep 250
;	Send {Blind}{] up}
;Return

;*$WheelUp::
;	if (GetKeyState("RButton")) {
;		Send {Blind}{[ down}
;		Sleep 10
;		Send {Blind}{[ up}
;		Sleep 10
;		Send {Blind}{Numpad0 down}
;		Sleep 10
;		Send {Blind}{Numpad0 up}
;	}
;	else {
;		Send {Blind}{WheelUp}
;	}
;Return

;*$WheelDown::
;	if (GetKeyState("RButton")) {
;		Send {Blind}{] down}
;		Sleep 10
;		Send {Blind}{] up}
;		Sleep 10
;		Send {Blind}{Numpad0 down}
;		Sleep 10
;		Send {Blind}{Numpad0 up}
;	}
;	else {
;		Send {Blind}{WheelDown}
;	}
;Return

^$WheelUp::
	Send {Blind}{[ down}
	Sleep 10
	Send {Blind}{[ up}
Return

^$WheelDown::
	Send {Blind}{] down}
	Sleep 10
	Send {Blind}{] up}
Return

~^i::
Sleep 10
Send {k down}
Sleep 10
Send {k up}
Sleep 10
Send {g down}
Sleep 10
Send {g up}
Return

#IfWinActive