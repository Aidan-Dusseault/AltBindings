WPMTMonitorSelect := 2

WPMTEnabled = 0
WPMTDebugTooltip = 0
WPMTAlwaysOnTop = 0
WPMTMouseOffsetY := 0

^!#F12::
	WPMTDebugTooltip := !WPMTDebugTooltip
	if (!WPMTDebugTooltip) {
		ToolTip
	}
Return

^!#F11::
	SysGet, MonitorCount, MonitorCount
	SysGet, MonitorPrimary, MonitorPrimary
	MsgBox, Monitor Count:`t%MonitorCount%`nPrimary Monitor:`t%MonitorPrimary%
	Loop, %MonitorCount%
	{
		SysGet, MonitorName, MonitorName, %A_Index%
		SysGet, Monitor, Monitor, %A_Index%
		SysGet, MonitorWorkArea, MonitorWorkArea, %A_Index%
		MsgBox, Monitor:`t#%A_Index%`nName:`t%MonitorName%`nLeft:`t%MonitorLeft% (%MonitorWorkAreaLeft% work)`nTop:`t%MonitorTop% (%MonitorWorkAreaTop% work)`nRight:`t%MonitorRight% (%MonitorWorkAreaRight% work)`nBottom:`t%MonitorBottom% (%MonitorWorkAreaBottom% work)
	}
Return

^!#F1::
	Gosub, WPMTEngage
Return

^!#F2::
	Gosub, WPMTEngageAlwaysOnTop
Return

^!#Tab::
	Gosub, WPMTEngageAlwaysOnTop
	Gosub, WPMTEngage
Return

WPMTEngage:
	if (WPMTEnabled) {
		SetTimer CheckMousePos, Delete
	}
	else {
		;DetectHiddenWindows, On
		SetTimer CheckMousePos, 10
	}
	WPMTEnabled := !WPMTEnabled
Return

WPMTEngageAlwaysOnTop:
	WPMTAlwaysOnTop := !WPMTAlwaysOnTop
	if (WPMTAlwaysOnTop) {
		WinSet, AlwaysOnTop, On, Windowed Projector (Preview)
	}
	else {
		WinSet, AlwaysOnTop, Off, Windowed Projector (Preview)
	}
Return

CheckMousePos:
	CoordMode, Mouse, Screen
	MouseGetPos, WPMTMouseX,WPMTMouseY
	WinGetPos, WPMTWinX,WPMTWinY,WPMTWinWidth,WPMTWinHeight, Windowed Projector (Preview)
	WPMTWinX2 := WPMTWinX+WPMTWinWidth
	WPMTWinY2 := WPMTWinY+WPMTWinHeight
	WinGetPos, MouseTranslateTaskbarX,MouseTranslateTaskbarY,MouseTranslateTaskbarWidth,MouseTranslateTaskbarHeight, ahk_class Shell_TrayWnd
	MouseTranslateTaskbarX2 := MouseTranslateTaskbarX+MouseTranslateTaskbarWidth
	MouseTranslateTaskbarY2 := MouseTranslateTaskbarY+MouseTranslateTaskbarHeight
	if ((WPMTMouseY >= MouseTranslateTaskbarY) and WPMTMouseY <= (MouseTranslateTaskbarY2)) and ((WPMTMouseX >= MouseTranslateTaskbarX) and WPMTMouseX <= (MouseTranslateTaskbarX2)) {
		WinActivate, ahk_class Shell_TrayWnd
	}
	if !(((WPMTMouseY >= MouseTranslateTaskbarY) and WPMTMouseY <= (MouseTranslateTaskbarY2)) and ((WPMTMouseX >= MouseTranslateTaskbarX) and WPMTMouseX <= (MouseTranslateTaskbarX2))) {
		if ((WPMTMouseY >= WPMTWinY) and WPMTMouseY <= (WPMTWinY2) and (WPMTMouseX >= WPMTWinX) and WPMTMouseX <= (WPMTWinX2)) {
			WPMTMouseOffsetX := WPMTMouseX-WPMTWinX
			WPMTMouseOffsetY := WPMTMouseY-WPMTWinY
			WPMTMouseOffsetPercentX := WPMTMouseOffsetX/WPMTWinWidth
			WPMTMouseOffsetPercentY := WPMTMouseOffsetY/WPMTWinHeight
			SysGet, WPMTMonitor, Monitor, 2
			WPMTMonitorWidth := WPMTMonitorRight-WPMTMonitorLeft
			WPMTMonitorHeight := WPMTMonitorBottom-WPMTMonitorTop
			WPMTMonitorX := WPMTMonitorLeft+(WPMTMonitorWidth*WPMTMouseOffsetPercentX)
			WPMTMonitorY := WPMTMonitorTop+(WPMTMonitorHeight*WPMTMouseOffsetPercentY)
			MouseMove, WPMTMonitorX, WPMTMonitorY, 0
			WinActivate, Windowed Projector (Preview)
			if (WPMTAlwaysOnTop) {
				WinSet, AlwaysOnTop, On, Windowed Projector (Preview)
			}
		}
	}
		if (WPMTDebugTooltip) {
		ToolTip, MouseX %WPMTMouseX%`nMouseY %WPMTMouseY%`nWinX %WPMTWinX%`nWinWidth %WPMTWinWidth%`nWinY %WPMTWinY%`nWinHeight %WPMTWinHeight%`nWPMTMouseOffsetX %WPMTMouseOffsetX%`nWPMTMouseOffsetY %WPMTMouseOffsetY%`nWPMTMouseOffsetPercentX %WPMTMouseOffsetPercentX%`nWPMTMouseOffsetPercentY %WPMTMouseOffsetPercentY%`nWPMTMonitorLeft %nWPMTMonitorLeft%`nWPMTMonitorRight %nWPMTMonitorRight%`nWPMTMonitorTop %nWPMTMonitorTop%`nWPMTMonitorBottom %nWPMTMonitorBottom%`nWPMTMonitorWidth %WPMTMonitorWidth%`nWPMTMonitorHeight %WPMTMonitorHeight%`nWPMTMonitorX %WPMTMonitorX%`nWPMTMonitorY %WPMTMonitorY%
	}
Return