#IfWinActive ahk_exe HeroesOfTheStorm_x64.exe

~!q::
Return

~!e::
Return

~!r::
Return

;XButton2::
;Send {Click, down, right}
;Return

;XButton2 UP::
;Send {Click, up, right}
;Return

#IfWinActive Diablo II
*XButton2::
  While GetKeyState("XButton2", "P")
  
  {

     Send {Blind}{lbutton}
	 Sleep 50

  }
Return

*Home::
  While GetKeyState("Home", "P")
  
  {

     Send {Blind}{rbutton}
	 Sleep 50

  }
Return