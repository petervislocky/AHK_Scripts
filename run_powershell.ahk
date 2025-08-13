; Run powershell, Ctrl + Alt + T
^!t::
Run, powershell.exe -NoExit -Command "Set-Location -Path $HOME"
Return

; Run Fedora 42 in WinTerm; Ctrl + Alt + F
^!f::
Run, wt.exe -p "FedoraLinux-42"
