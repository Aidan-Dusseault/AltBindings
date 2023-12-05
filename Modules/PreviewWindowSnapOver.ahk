;SetTimer CheckMousePos, 10
;.
;.

PreviewWindowSnapOverEnabled = 0
PreviewWindowSnapOverDebugTooltip = 0

^!#Tab::
	if (PreviewWindowSnapOverEnabled) {
		SetTimer CheckMousePos, Delete
	}
	if (PreviewWindowSnapOverEnabled=0) {
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
	}
	if ((PreviewWindowSnapOverMouseX < (PreviewWindowSnapOverWinX + PreviewWindowSnapOverWinWidth)) and PreviewWindowSnapOverMouseX > PreviewWindowSnapOverWinX + PreviewWindowSnapOverWinWidth*0.5) {
		MouseMove, PreviewWindowSnapOverWinX, PreviewWindowSnapOverMouseY, 0
	}
  }
Return