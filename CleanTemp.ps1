# CleanTemp Script
# Silently cleans temporary folders
# Runs at startup and every hour in background mode

param(
    [switch]$Background
)

$ErrorActionPreference = "SilentlyContinue"

function Clear-TempFolder {
    param(
        [string]$Path
    )

    if (Test-Path $Path) {
        $items = Get-ChildItem -Path $Path -Force -Recurse -ErrorAction SilentlyContinue
        foreach ($item in $items) {
            try {
                Remove-Item -Path $item.FullName -Force -Recurse -ErrorAction SilentlyContinue
            }
            catch {
                # Skip files in use
            }
        }
    }
}

function Invoke-CleanTemp {
    Clear-TempFolder -Path "C:\Users\lenovo\AppData\Local\Temp"
    Clear-TempFolder -Path "C:\Windows\Temp"
}

if ($Background) {
    # Background mode: run at startup, then every hour
    Invoke-CleanTemp
    while ($true) {
        Start-Sleep -Seconds 3600
        Invoke-CleanTemp
    }
}
else {
    Invoke-CleanTemp
}
