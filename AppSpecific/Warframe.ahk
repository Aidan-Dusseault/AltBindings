#IfWinActive ahk_exe Warframe.exe
*XButton1::
Send {LShift Down}
Send {LCtrl Down}
Send b
Return

*XButton1 UP::
Send {LShift Up}
Send {LCtrl Up}
Return