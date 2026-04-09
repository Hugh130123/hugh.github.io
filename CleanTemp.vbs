' Silent launcher for CleanTemp.ps1
' Runs PowerShell script in background mode without displaying any window

Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell -ExecutionPolicy Bypass -WindowStyle Hidden -File ""C:\Users\lenovo\Desktop\CleanTemp\CleanTemp.ps1"" -Background", 0, False
