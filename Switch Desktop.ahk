#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

DetectHiddenWindows, On
PostMessage, 0x5555, 1,1,,SWITCH
DetectHiddenWindows, Off
ExitApp