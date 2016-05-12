#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

selectingMode = 0

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
    Loop, 5 {
        send +
        send {Left}
    }
}
else {
    Loop, 5 {
        send {Left}
    }
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
    Loop, 5 {
        send +
        send {Right}
    }
}
else {
    Loop, 5 {
        send {Right}
    }
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
    Loop, 5 {
        send +
        send {Up}
    }
}
else {
    Loop, 5 {
        send {Up}
    }
}
Return

!k::
if (selectingMode = 1) {
    send !{Down}
}
else {
    send {Down}
}
Return

+!k::
if (selectingMode = 1) {
    Loop, 5 {
        send +
        send {Down}
    }
}
else {
    Loop, 5 {
        send {Down}
    }
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
    send +{PgUp}
}
else {
    send {PgUp}
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
    send +{PgDown}
}
else {
    send {PgDown}
}
Return

!a::
if (selectingMode = 0) {
    selectingMode = 1
}
else {
    selectingMode = 0
}
Return