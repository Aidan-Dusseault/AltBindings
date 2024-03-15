#IfWinActive, Windowed Projector (Preview)
$*Esc::
Suspend Permit
Return

$*Esc Up::
Suspend Permit
return

#IfWinActive

WindowedProjectorSnapOverEnabled = 0
WindowedProjectorSnapOverDebugTooltip = 0
WindowedProjectorSnapOverAlwaysOnTop = 0
WindowedProjectorSnapOverTaskbarToggle = 0

^!#F11::
	WindowedProjectorSnapOverDebugTooltip := !WindowedProjectorSnapOverDebugTooltip
	if (!WindowedProjectorSnapOverDebugTooltip) {
		ToolTip
	}
Return

^!#F2::
	Gosub, EngageSnapOver
Return

^!#F3::
	Gosub, EngageAlwaysOnTop
Return

^!#F1::
	Gosub, EngageAlwaysOnTop
	Gosub, EngageSnapOver
Return

EngageSnapOver:
	if (WindowedProjectorSnapOverEnabled) {
		SetTimer CheckMousePos, Delete
	}
	else {
		;DetectHiddenWindows, On
		SetTimer CheckMousePos, 10
	}
	WindowedProjectorSnapOverEnabled := !WindowedProjectorSnapOverEnabled
Return

EngageAlwaysOnTop:
	WindowedProjectorSnapOverAlwaysOnTop := !WindowedProjectorSnapOverAlwaysOnTop
	if (WindowedProjectorSnapOverAlwaysOnTop) {
		WinSet, AlwaysOnTop, On, Windowed Projector (Preview)
	}
	else {
		WinSet, AlwaysOnTop, Off, Windowed Projector (Preview)
	}
Return

;MoveWindows:
;	WinGet,Windows,List
;	Loop,%Windows%
;	{
;		this_id := "ahk_id " . Windows%A_Index%
;		WinGetTitle,this_title,%this_id%
;		WinGetPos, this_x,this_y,this_width,this_height, this_title
;		WinGetPos, WindowedProjectorSnapOverWinX,WindowedProjectorSnapOverWinY,WindowedProjectorSnapOverWinWidth,WindowedProjectorSnapOverWinHeight, Windowed Projector (Preview)
;		if (this_title != "Windowed Projector (Preview)") {
;			if (this_x >= WindowedProjectorSnapOverWinX and this_x <= WindowedProjectorSnapOverWinX+WindowedProjectorSnapOverWinWidth and this_y >= WindowedProjectorSnapOverWinY and this_y <= WindowedProjectorSnapOverWinY+WindowedProjectorSnapOverWinHeight) {
;				WinMove, this_title, WindowedProjectorSnapOverWinX+WindowedProjectorSnapOverWinWidth+7,this_y
;			}
;		}
;	}
;Return

CheckMousePos:
	CoordMode, Mouse, Screen
	MouseGetPos, WindowedProjectorSnapOverMouseX,WindowedProjectorSnapOverMouseY
	WinGetPos, WindowedProjectorSnapOverWinX,WindowedProjectorSnapOverWinY,WindowedProjectorSnapOverWinWidth,WindowedProjectorSnapOverWinHeight, Windowed Projector (Preview)
	WinGetPos, SnapOverTaskbarX,SnapOverTaskbarY,SnapOverTaskbarWidth,SnapOverTaskbarHeight, ahk_class Shell_TrayWnd
	if (WindowedProjectorSnapOverDebugTooltip) {
		ToolTip, MouseX %WindowedProjectorSnapOverMouseX%`nMouseY %WindowedProjectorSnapOverMouseY%`n WinX %WindowedProjectorSnapOverWinX%`n WinWidth %WindowedProjectorSnapOverWinWidth%`n WinY %WindowedProjectorSnapOverWinY%`n WinHeight %WindowedProjectorSnapOverWinHeight%
	}
	if ((WindowedProjectorSnapOverMouseX >= SnapOverTaskbarX) and (WindowedProjectorSnapOverMouseX <= (SnapOverTaskbarX + SnapOverTaskbarWidth)) and (WindowedProjectorSnapOverMouseY >= (SnapOverTaskbarY - 200)) and (WindowedProjectorSnapOverMouseY <= (SnapOverTaskbarY + SnapOverTaskbarHeight))) {
		if (MouseIsOver("ahk_class Shell_TrayWnd")) {
			if (!WindowedProjectorSnapOverTaskbarToggle) {
				WinActivate, ahk_class Shell_TrayWnd
				WindowedProjectorSnapOverTaskbarToggle = !WindowedProjectorSnapOverTaskbarToggle
			}
		}
	}
	else {
		WindowedProjectorSnapOverTaskbarToggle = 0
		if (MouseIsOver("Windowed Projector (Preview)")) {
			if ((WindowedProjectorSnapOverMouseX >= WindowedProjectorSnapOverWinX) and WindowedProjectorSnapOverMouseX <= (WindowedProjectorSnapOverWinX + WindowedProjectorSnapOverWinWidth*0.5)) {
				MouseMove, WindowedProjectorSnapOverWinX+WindowedProjectorSnapOverWinWidth, WindowedProjectorSnapOverMouseY, 0
				;WinActivate, ahk_class Shell_TrayWnd
			}
			if ((WindowedProjectorSnapOverMouseX <= (WindowedProjectorSnapOverWinX + WindowedProjectorSnapOverWinWidth)) and WindowedProjectorSnapOverMouseX >= WindowedProjectorSnapOverWinX + WindowedProjectorSnapOverWinWidth*0.5) {
				MouseMove, WindowedProjectorSnapOverWinX, WindowedProjectorSnapOverMouseY, 0
				;WinActivate, Windowed Projector (Preview)
				if (WindowedProjectorSnapOverAlwaysOnTop) {
					WinSet, AlwaysOnTop, On, Windowed Projector (Preview)
				}
			}
		}
	}
	
Return