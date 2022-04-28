#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxHotkeysPerInterval 999999
#InstallKeybdHook
#InstallMouseHook

global selectingMode = 0
global loopMacroNumberOfLoops = 0
global loopMax = 200

SetCapsLockState, AlwaysOff
SetNumLockState, AlwaysOn
SetScrollLockState, AlwaysOff
SetTitleMatchMode, 3

GroupAdd, EXCLUDE_APPS, ahk_exe HeroesOfTheStorm_x64.exe
GroupAdd, EXCLUDE_APPS, ahk_exe MassEffect3.exe
GroupAdd, EXCLUDE_APPS, ahk_exe Risk of Rain 2.exe
GroupAdd, EXCLUDE_APPS, ahk_exe Warframe.exe
GroupAdd, EXCLUDE_APPS, ahk_exe WoW.exe
GroupAdd, EXCLUDE_APPS, ahk_exe AoE2DE_s.exe
GroupAdd, EXCLUDE_APPS, ahk_exe Diablo II.exe
GroupAdd, EXCLUDE_APPS, ahk_exe ffxiv_dx11.exe
Return

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

!`::
Suspend
RStop := 1
LStop := 1
Click, right, up
Click, left, up
Return

*CapsLock::
Suspend Permit
send {Blind}{NumpadClear Down}
Return

*CapsLock UP::
Suspend Permit
send {Blind}{NumpadClear Up}
Return

;Windows Search
;!Space::
;CoordMode, Mouse, Screen
;MouseGetPos, MouseX, MouseY
;send {Click 0, %A_ScreenHeight%}
;send {Click %MouseX%, %MouseY%, 0}
;Return

LWin::
Suspend Permit
Return

;RWin::
;Suspend Permit
;Return

*!$XButton1::
Send {Blind}{PgDn}
Return

*!$XButton2::
Send {Blind}{PgUp}
Return

#IfWinNotActive ahk_group EXCLUDE_APPS

*!WheelDown::
Send {Blind}{WheelRight}
Return

*!WheelUp::
Send {Blind}{WheelLeft}
Return

*!e UP::
Send !{PgUp Up}
Return

!j::
if (selectingMode = 1) {
    send +{Left}
}
else {
    send {Left}
}
Return

+!j::
if (selectingMode = 1) {
    send +^{Left}
}
else {
    send ^{Left}
}
Return

!l::
if (selectingMode = 1) {
    send +{Right}
}
else {
    send {Right}
}
Return

+!l::
if (selectingMode = 1) {
    send +^{Right}
}
else {
    send ^{Right}
}
Return

!i::
if (selectingMode = 1) {
    send +{Up}
}
else {
    send {Up}
}
Return

+!i::
if (selectingMode = 1) {
    send +{PgUp}
}
else {
    send {PgUp}
}
Return

!k::
if (selectingMode = 1) {
    send +{Down}
}
else {
    send {Down}
}
Return

+!k::
if (selectingMode = 1) {
    send +{PgDn}
}
else {
    send {PgDn}
}
Return

!u::
if (selectingMode = 1) {
    send +{Home}
}
else {
    send {Home}
}
Return

+!u::
if (selectingMode = 1) {
    send +^{PgUp}
}
else {
    send ^{PgUp}
}
Return

!o::
if (selectingMode = 1) {
    send +{End}
}
else {
    send {End}
}
Return

+!o::
if (selectingMode = 1) {
    send +^{PgDn}
}
else {
    send ^{PgDn}
}
Return

!q::
send {Esc}
selectingMode = 0
Return

!w::
send {Tab}
Return

+!w::
send +{Tab}
Return

!p::
if (selectingMode = 0) {
    selectingMode = 1
}
else {
    selectingMode = 0
}
Return

!a::
send ^a
Return

!s::
send ^s
Return

+!s::
send ^!s
Return

!d::
send {Delete}
Return

+!d::
send ^{Delete}
Return

!f::
send ^f
Return

+!f::
send ^o
Return

!z::
send ^z
selectingMode = 0
Return

+!z::
send ^y
Return

!x::
send ^x
selectingMode = 0
Return

!c::
send ^c
Return

!v::
send ^v
selectingMode = 0
Return

!+v::
send ^+v
selectingMode = 0
Return

!b::
send ^{Tab}
Return

+!b::
send ^w
send ^{F4}
Return

!n::
send ^n
Return

!Backspace::
if (selectingMode = 1) {
    send {Backspace}
    selectingMode = 0
}
else {
    send ^{Backspace}
}
Return

+!Backspace::
if (selectingMode = 1) {
    send {Backspace}
    selectingMode = 0
}
else {
    send {End}+{Home}{Backspace}{Backspace}
}
Return

!Enter::
send {Enter}
Return

!`;::
send ^g
Return

;Dismiss selecting mode when acting on selected area
~`::
~+`::
~1::
~!::
~@::
~3::
~#::
~4::
~$::
~5::
~%::
~6::
~^::
~7::
~&::
~8::
~*::
~9::
~(::
~0::
~)::
~-::
~_::
~=::
~+::
~Backspace::
~Tab::
~q::
~+q::
~w::
~+w::
~e::
~+e::
~r::
~+r::
~t::
~+t::
~y::
~+y::
~u::
~+u::
~i::
~+i::
~o::
~+o::
~p::
~+p::
~[::
~+[::
~]::
~+]::
~Enter::
~a::
~+a::
~s::
~+s::
~d::
~+d::
~f::
~+f::
~g::
~+g::
~h::
~+h::
~j::
~+j::
~k::
~+k::
~l::
~+l::
~`;::
~+`;::
~'::
~+'::
~\::
~+\::
~z::
~+z::
~x::
~+x::
~c::
~+c::
~v::
~+v::
~b::
~+b::
~n::
~+n::
~m::
~+m::
~,::
~+,::
~.::
~+.::
~/::
~+/::
~Space::
~Delete::
~Numpad0::
~Numpad1::
~Numpad2::
~Numpad3::
~Numpad4::
~Numpad5::
~Numpad6::
~Numpad7::
~Numpad8::
~Numpad9::
~NumpadDot::
~NumpadDiv::
~NumpadMult::
~NumpadAdd::
~NumpadSub::
~NumpadEnter::
~NumpadDel::
selectingMode = 0
Return

#IfWinActive

#Include %A_ScriptDir%/AppSpecific/RiskOfRain2.ahk

#Include %A_ScriptDir%/AppSpecific/WoW.ahk

#Include %A_ScriptDir%/AppSpecific/HotS.ahk

#Include %A_ScriptDir%/AppSpecific/Warframe.ahk

#Include %A_ScriptDir%/AppSpecific/DwarfFortress.ahk

#Include %A_ScriptDir%/AppSpecific/ME3.ahk

#Include %A_ScriptDir%/AppSpecific/FFXIV.ahk

#Include %A_ScriptDir%/AppSpecific/DST.ahk

#Include %A_ScriptDir%/AppSpecific/TTS.ahk

#Include %A_ScriptDir%/AppSpecific/Greenshot.ahk