@echo off
echo ============================================
echo  Solana iOS Setup Script
echo ============================================
echo.

:: Check if we're in the right directory
if not exist "..\Forks\Nicegram-iOS-master" (
    echo ERROR: Nicegram-iOS-master folder not found!
    echo Make sure you have the Forks folder with Nicegram-iOS-master
    pause
    exit /b 1
)

echo Step 1: Copying files from Nicegram-iOS...
echo This may take a few minutes...

:: Copy main directories
xcopy /E /I /Y "..\Forks\Nicegram-iOS-master\Telegram" ".\Telegram"
xcopy /E /I /Y "..\Forks\Nicegram-iOS-master\submodules" ".\submodules"
xcopy /E /I /Y "..\Forks\Nicegram-iOS-master\build-system" ".\build-system"
xcopy /E /I /Y "..\Forks\Nicegram-iOS-master\third-party" ".\third-party"

:: Copy root files
copy /Y "..\Forks\Nicegram-iOS-master\WORKSPACE" ".\WORKSPACE"
copy /Y "..\Forks\Nicegram-iOS-master\BUILD" ".\BUILD"
copy /Y "..\Forks\Nicegram-iOS-master\versions.json" ".\versions.json"
copy /Y "..\Forks\Nicegram-iOS-master\.bazelrc" ".\.bazelrc"
copy /Y "..\Forks\Nicegram-iOS-master\.bazelversion" ".\.bazelversion"

echo.
echo Step 2: Creating Solana module directory...
mkdir ".\Telegram\Solana" 2>nul

echo.
echo ============================================
echo  Setup complete!
echo ============================================
echo.
echo Next steps:
echo 1. Push this repository to GitHub
echo 2. Add your Telegram API credentials to GitHub Secrets
echo 3. The GitHub Action will build the IPA for you
echo.
pause