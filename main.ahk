; ============================== Auto-elevating to admin priveleges ==============================
if not A_IsAdmin {
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

;------------------------------------------------------------------------------------------------
;Empty recycle bin, Ctrl + F1
^f1::
FileRecycleEmpty
Return

;------------------------------------------------------------------------------------------------
; Mimics hyprland window close with Alt + Q
#If MouseIsOver()
!q::
    MouseGetPos, , , hoveredWindow
    ; Send close message without focusing the window
    if (IsSafeWindow(hoveredWindow)) {
        PostMessage, 0x112, 0xF060,,, ahk_id %hoveredWindow% ; according to chatgpt those hex values are WM_SYSCOMMAND and SC_CLOSE
    }
Return
#If

;Function: Chick if mouse is over a window
MouseIsOver() {
    MouseGetPos, , , windowUnderMouse
    Return windowUnderMouse ? True : False
}

; Function: validate window before closing
IsSafeWindow(winID) {
    WinGetClass, winClass, ahk_id %winID%
    ; Filter out system windows
    if (winClass = "Progman" || winClass = "WorkerW" || winClass = "Shell_TrayWnd") {
        return False
    }
    return True
}
;------------------------------------------------------------------------------------------------
; Search selected, Ctrl + Shift + G
^+g::
{
clipboard=
Send, ^c
Sleep 0025
Run, https://www.google.com/search?q=%clipboard%
Return
}

;------------------------------------------------------------------------------------------------
; Always on top toggle, Alt + T
!t::
WinSet, AlwaysOnTop, Toggle, A
Return
