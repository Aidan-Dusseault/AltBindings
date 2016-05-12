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
send ^{Backspace}
Return

+!Backspace::
send ^+L
Return

!`;::
send ^g
Return