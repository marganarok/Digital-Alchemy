@echo off
echo.
echo ========================================
echo    🚀 DIGITAL ALCHEMY SITE LAUNCHER 🚀
echo ========================================
echo.
echo [INFO] Starting Digital Alchemy Portal...
echo.

REM Change to the project directory
cd /d "%~dp0"

REM Check if we're in a git repository
if not exist ".git" (
    echo [ERROR] Not in a git repository!
    pause
    exit /b 1
)

echo [STATUS] Current directory: %cd%
echo [STATUS] Checking git status...
git status --porcelain

echo.
echo [ACTION] Pushing latest changes to GitHub...
git add -A
git commit -m "Auto-update from launcher - %date% %time%"
git push

echo.
echo [SUCCESS] Site updated and deployed!
echo.
echo 🌐 Your Digital Alchemy Portal is live at:
echo    https://digital-alchemy-puce.vercel.app/
echo.
echo 📊 GitHub Repository:
echo    https://github.com/marganarok/Digital-Alchemy
echo.

REM Open the live site in default browser
echo [ACTION] Opening live site in browser...
start https://digital-alchemy-puce.vercel.app/

REM Open GitHub repository
echo [ACTION] Opening GitHub repository...
start https://github.com/marganarok/Digital-Alchemy

echo.
echo ✨ Launch complete! Your digital empire awaits!
echo.
pause