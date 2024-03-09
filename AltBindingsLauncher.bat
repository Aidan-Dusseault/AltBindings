@@echo off
SET EXEName=AltBindings.exe
SET EXEFullPath=C:\Users\Aidan\Documents\AltBindings
call TASKLIST /fi "SESSIONNAME eq Console" | FINDSTR /I "%EXEName%" || call START "" "%EXEFullPath%""