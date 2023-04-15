#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force

drag_enabled := false

; Key combo for 4 finger tap:  #^+F24
#^+F22:: ; 3 finger tap
    if (drag_enabled) 
        Click, Up
    else
        Click, Down
    drag_enabled := !drag_enabled
return

#If drag_enabled
LButton::
    Click, Up
    drag_enabled := false
return
#If