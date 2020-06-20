#IfWinActive Risk of Rain 2
LCtrl::
if (spacetoggle = 0) {
    spacetoggle = 1
	Send {Space Down}
}
else {
    spacetoggle = 0
	Send {Space Up}
}
Return

Space::
if (spacetoggle = 1) {
    spacetoggle = 0
}
Send {Space Down}
Return

Space UP::
Send {Space Up}
Return