@echo off
:: Check if the script is running as administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrative privileges.
    echo Restarting as administrator...
    PowerShell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Run the PowerShell command as administrator
PowerShell -Command "Start-Process 'PowerShell' -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command ""irm christitus.com/win | iex""' -Verb RunAs"
