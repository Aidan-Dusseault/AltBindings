PreviewWindowSnapOverEnabled = 0
PreviewWindowSnapOverDebugTooltip = 0
PreviewWindowSnapOverAlwaysOnTop = 0

^!#Tab::
	if (PreviewWindowSnapOverEnabled) {
		SetTimer CheckMousePos, Delete
	}
	else {
		;DetectHiddenWindows, On
		SetTimer CheckMousePos, 10
	}
	PreviewWindowSnapOverEnabled := !PreviewWindowSnapOverEnabled
Return

^!#F12::
	PreviewWindowSnapOverDebugTooltip := !PreviewWindowSnapOverDebugTooltip
	if (!PreviewWindowSnapOverDebugTooltip) {
	  ToolTip
	}
Return

^!#F1::
  PreviewWindowSnapOverAlwaysOnTop := !PreviewWindowSnapOverAlwaysOnTop
  if (PreviewWindowSnapOverAlwaysOnTop) {
    WinSet, AlwaysOnTop, On, Windowed Projector (Preview)
  }
  else {
    WinSet, AlwaysOnTop, Off, Windowed Projector (Preview)
  }
Return

CheckMousePos:
  CoordMode, Mouse, Screen
  MouseGetPos, PreviewWindowSnapOverMouseX,PreviewWindowSnapOverMouseY
  WinGetPos, PreviewWindowSnapOverWinX,PreviewWindowSnapOverWinY,PreviewWindowSnapOverWinWidth,PreviewWindowSnapOverWinHeight, Windowed Projector (Preview)
  if (PreviewWindowSnapOverDebugTooltip) {
    ToolTip, MouseX %PreviewWindowSnapOverMouseX%`nMouseY %PreviewWindowSnapOverMouseY%`n WinX %PreviewWindowSnapOverWinX%`n WinWidth %PreviewWindowSnapOverWinWidth%`n WinY %PreviewWindowSnapOverWinY%`n WinHeight %PreviewWindowSnapOverWinHeight%
  }
  if ((PreviewWindowSnapOverMouseY > PreviewWindowSnapOverWinY) and PreviewWindowSnapOverMouseY < (PreviewWindowSnapOverWinY+PreviewWindowSnapOverWinHeight)) {
	if ((PreviewWindowSnapOverMouseX > PreviewWindowSnapOverWinX) and PreviewWindowSnapOverMouseX < (PreviewWindowSnapOverWinX + PreviewWindowSnapOverWinWidth*0.5)) {
		MouseMove, PreviewWindowSnapOverWinX+PreviewWindowSnapOverWinWidth, PreviewWindowSnapOverMouseY, 0
		;WinActivate, ahk_class Shell_TrayWnd
	}
	if ((PreviewWindowSnapOverMouseX < (PreviewWindowSnapOverWinX + PreviewWindowSnapOverWinWidth)) and PreviewWindowSnapOverMouseX > PreviewWindowSnapOverWinX + PreviewWindowSnapOverWinWidth*0.5) {
		MouseMove, PreviewWindowSnapOverWinX, PreviewWindowSnapOverMouseY, 0
		WinActivate, Windowed Projector (Preview)
		if (PreviewWindowSnapOverAlwaysOnTop) {
		  WinSet, AlwaysOnTop, On, Windowed Projector (Preview)
		}
	}
  }
Return