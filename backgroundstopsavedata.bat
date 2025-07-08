@echo off
echo.
echo Running as Administrator? Checking...
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Please run this file as Administrator. Right click > Run as administrator.
    pause
    exit /b
)

echo.
echo Stopping Delivery Optimization...
sc stop DoSvc
sc config DoSvc start= disabled

echo.
echo Stopping Windows Update...
net stop wuauserv
sc config wuauserv start= disabled

echo.
echo Stopping Background Intelligent Transfer Service...
net stop BITS
sc config BITS start= disabled

echo.
echo Done. Please restart your PC to apply changes fully.
pause
