#IfWinActive ahk_class Diablo II

*XButton2::
  While GetKeyState("XButton2", "P")
  
  {

     Send {Blind}{lbutton}
	 Sleep 50

  }
Return

*PgUp::
  While GetKeyState("PgUp", "P")
  
  {

     Send {Blind}{rbutton}
	 Sleep 50

  }
Return

#IfWinActive