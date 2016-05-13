#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxHotkeysPerInterval 999999

global selectingMode = 0
global loopMacroNumberOfLoops = 0

Alt::
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
Return

!w::
send {Tab}
Return

+!w::
send +{Tab}
Return

!e::
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
Return

+!z::
send ^y
Return

!x::
send ^x
Return

!c::
send ^c
Return

!v::
send ^v
Return

!b::
send ^{Tab}
Return

+!b::
send ^w
send ^{F4}
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
send ^+L
Return

!Enter::
send {Enter}
Return

!`;::
send ^g
Return

;Loop macro
!0::
loopMacroNumberOfLoops := loopMacroNumberOfLoops*10
DetermineIfTriggeringCharacterMustBeLooped()
Return

!1::
loopMacroNumberOfLoops := loopMacroNumberOfLoops*10 + 1
DetermineIfTriggeringCharacterMustBeLooped()
Return

!2::
loopMacroNumberOfLoops := loopMacroNumberOfLoops*10 + 2
DetermineIfTriggeringCharacterMustBeLooped()
Return

!3::
loopMacroNumberOfLoops := loopMacroNumberOfLoops*10 + 3
DetermineIfTriggeringCharacterMustBeLooped()
Return

!4::
loopMacroNumberOfLoops := loopMacroNumberOfLoops*10 + 4
DetermineIfTriggeringCharacterMustBeLooped()
Return

!5::
loopMacroNumberOfLoops := loopMacroNumberOfLoops*10 + 5
DetermineIfTriggeringCharacterMustBeLooped()
Return

!6::
loopMacroNumberOfLoops := loopMacroNumberOfLoops*10 + 6
DetermineIfTriggeringCharacterMustBeLooped()
Return

!7::
loopMacroNumberOfLoops := loopMacroNumberOfLoops*10 + 7
DetermineIfTriggeringCharacterMustBeLooped()
Return

!8::
loopMacroNumberOfLoops := loopMacroNumberOfLoops*10 + 8
DetermineIfTriggeringCharacterMustBeLooped()
Return

!9::
loopMacroNumberOfLoops := loopMacroNumberOfLoops*10 + 9
DetermineIfTriggeringCharacterMustBeLooped()
Return

DetermineIfTriggeringCharacterMustBeLooped() {
    send {Alt}
    if (loopMacroNumberOfLoops > 1) {
        Input, loopMacroTriggeringCharacter, L1 M, {Backspace}{Delete}{Escape}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}
        GetKeyState, AltKeyState, Alt
        GetKeyState, ShiftKeyState, Shift
        if ((loopMacroTriggeringCharacter = 0 or loopMacroTriggeringCharacter = 1 or loopMacroTriggeringCharacter = 2 or loopMacroTriggeringCharacter = 3 or loopMacroTriggeringCharacter = 4 or loopMacroTriggeringCharacter = 5 or loopMacroTriggeringCharacter = 6 or loopMacroTriggeringCharacter = 7 or loopMacroTriggeringCharacter = 8 or loopMacroTriggeringCharacter = 9) and AltKeyState = "D") {
            send !%loopMacroTriggeringCharacter%
        }
        else {
            if (ErrorLevel = "EndKey:Escape") {
            }
            else if (ErrorLevel = "EndKey:Backspace") {
                if (AltKeyState = "D" and ShiftKeyState = "U") {
                    Loop, %loopMacroNumberOfLoops% {
                        Sleep 1
                        send !{Backspace}
                    }
                }
                else if (AltKeyState = "U" and ShiftKeyState = "D") {
                    Loop, %loopMacroNumberOfLoops% {
                        Sleep 1
                        send +{Backspace}
                    }
                }
                else if (AltKeyState = "D" and ShiftKeyState = "D") {
                    Loop, %loopMacroNumberOfLoops% {
                        Sleep 1
                        send +!{Backspace}
                    }
                }
                else {
                    Loop, %loopMacroNumberOfLoops% {
                        Sleep 1
                        send {Backspace}
                    }
                }
            }
            else {
                if (AltKeyState = "D" and ShiftKeyState = "U") {
                    Loop, %loopMacroNumberOfLoops% {
                        Sleep 1
                        send !%loopMacroTriggeringCharacter%
                    }
                }
                else if (AltKeyState = "U" and ShiftKeyState = "D") {
                    Loop, %loopMacroNumberOfLoops% {
                        Sleep 1
                        send +%loopMacroTriggeringCharacter%
                    }
                }
                else if (AltKeyState = "D" and ShiftKeyState = "D") {
                    Loop, %loopMacroNumberOfLoops% {
                        Sleep 1
                        send +!%loopMacroTriggeringCharacter%
                    }
                }
                else {
                    Loop, %loopMacroNumberOfLoops% {
                        Sleep 1
                        send %loopMacroTriggeringCharacter%
                    }
                }
            }
            loopMacroNumberOfLoops := 0
            loopMacroTriggeringCharacter =
        }
    }
}