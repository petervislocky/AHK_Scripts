; Run powershell, Ctrl + Alt + T
^!t::
    EnvGet, home, USERPROFILE
    Run, wt.exe -p "PowerShell 7" -d "%home%"
Return

; Run Fedora 42 in WinTerm; Ctrl + Alt + F
^!f::
Run, wt.exe -p "FedoraLinux-42"
