#IfWinActive ahk_exe Risk of Rain 2.exe

*$F14::
RoR2AutoEquipment := !RoR2AutoEquipment
if (RoR2AutoEquipment and !GetKeyState("Tab", "P")) {
	Send {Blind}{LAlt}
	SetTimer RoR2AutoEquipment, 100
}
if (!RoR2AutoEquipment) {
	SetTimer RoR2AutoEquipment, Delete
}
return
RoR2AutoEquipment:
	if (WinActive("ahk_exe Risk of Rain 2.exe")  and !GetKeyState("Tab", "P")) {
		Send {Blind}{LAlt}
	}
Return

RoR2SpaceToggle = 0

*LCtrl::
if (RoR2SpaceToggle = 0) {
    RoR2SpaceToggle = 1
	Send {Blind}{Space Down}
}
else {
    RoR2SpaceToggle = 0
}
Return

*LCtrl UP::
if (RoR2SpaceToggle = 0) {
	Send {Blind}{Space Up}
}
Return

Space::
if (RoR2SpaceToggle = 1) {
    RoR2SpaceToggle = 0
	Send {Space Up}
	Sleep, 30
}
Send {Space Down}
Return

Space UP::
Send {Space Up}
Return

#IfWinActive