#IfWinExists ahk_exe ffxiv_dx11.exe

$*LButton::
if (FFXIVswapMouse and MouseIsOver("ahk_exe ffxiv_dx11.exe")) {
		FFXIVcurrentSwap = 1
		Click, right, down
	}
else {
	Click, left, down
}
Return

$*RButton::
if (FFXIVswapMouse and MouseIsOver("ahk_exe ffxiv_dx11.exe")) {
		FFXIVcurrentSwap = 1
		Click, left, down
	}
else {
	Click, right, down
}
Return

$*LButton UP::
if (FFXIVcurrentSwap) {
		FFXIVcurrentSwap = 0
		Click, right, up
	}
else {
	Click, left, up
}
Return

$*RButton UP::
if (FFXIVcurrentSwap) {
		FFXIVcurrentSwap = 0
		Click, left, up
	}
else {
	Click, right, up
}
Return

#IfWinActive ahk_exe ffxiv_dx11.exe

FFXIVswapMouse = 0

$*XButton2::
Click, right, down
Return

$*XButton2 UP::
Click, right, up
Return

$*XButton1::
FFXIVswapMouse := !FFXIVswapMouse
Return


*$a::
	if (GetKeyState("XButton2", "P")) {
		Send {Blind}{Left down}
	}
	else {
		Send {Blind}{a down}
	}
Return

*$a UP::
	Send {Blind}{Left up}
	Send {Blind}{a up}
Return

*$d::
	if (GetKeyState("XButton2", "P")) {
		Send {Blind}{Right down}
	}
	else {
		Send {Blind}{d down}
	}
Return

*$d UP::
	Send {Blind}{Right up}
	Send {Blind}{d up}
Return

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