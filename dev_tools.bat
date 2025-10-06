@echo off
echo.
echo ==========================================
echo    🔧 DIGITAL ALCHEMY DEV TOOLS 🔧
echo ==========================================
echo.

:menu
echo Choose an option:
echo.
echo 1. 🚀 Launch Live Site
echo 2. 📊 Open GitHub Repository  
echo 3. 💻 Open Project in VS Code
echo 4. 🔄 Git Status & Sync
echo 5. 📁 Open Project Folder
echo 6. 🌐 Start Local Server (Python)
echo 7. 📝 Quick Commit & Push
echo 8. 🎯 Open Master Dashboard Locally
echo 9. ❌ Exit
echo.
set /p choice="Enter your choice (1-9): "

if "%choice%"=="1" goto launch_site
if "%choice%"=="2" goto open_github
if "%choice%"=="3" goto open_vscode
if "%choice%"=="4" goto git_status
if "%choice%"=="5" goto open_folder
if "%choice%"=="6" goto start_server
if "%choice%"=="7" goto quick_commit
if "%choice%"=="8" goto open_dashboard
if "%choice%"=="9" goto exit
goto menu

:launch_site
echo.
echo [🚀] Launching Digital Alchemy Portal...
start https://digital-alchemy-puce.vercel.app/
goto menu

:open_github
echo.
echo [📊] Opening GitHub Repository...
start https://github.com/marganarok/Digital-Alchemy
goto menu

:open_vscode
echo.
echo [💻] Opening project in VS Code...
code .
goto menu

:git_status
echo.
echo [🔄] Git Status:
git status
echo.
echo [🔄] Pulling latest changes...
git pull
echo.
pause
goto menu

:open_folder
echo.
echo [📁] Opening project folder...
start .
goto menu

:start_server
echo.
echo [🌐] Starting local Python server on port 8000...
echo [INFO] Your local site will be available at: http://localhost:8000
echo [INFO] Press Ctrl+C to stop the server
echo.
python -m http.server 8000
goto menu

:quick_commit
echo.
set /p message="Enter commit message: "
echo.
echo [📝] Adding all changes...
git add -A
echo [📝] Committing changes...
git commit -m "%message%"
echo [📝] Pushing to GitHub...
git push
echo.
echo [✅] Changes committed and pushed!
pause
goto menu

:open_dashboard
echo.
echo [🎯] Opening Master Dashboard locally...
start index.html
goto menu

:exit
echo.
echo [✨] Thanks for using Digital Alchemy Dev Tools!
echo [🚀] May your digital empire prosper!
exit