@echo off
setlocal

cd /d "C:\Users\sande\Documents\PurchaseInvoiceImport\Importing\bin\Release\net8.0"

echo Checking Git repository...

git config --global --add safe.directory "C:/Users/sande/Documents/PurchaseInvoiceImport/Importing/bin/Release/net8.0"

git remote -v >nul 2>&1
if errorlevel 1 (
    git init
    git remote add origin https://github.com/s-sandeep-tech/appupdates.git
)

git branch -M main

echo Removing temporary backup folder if present...
if exist "backup-before-git-pull" (
    rmdir /s /q "backup-before-git-pull"
)

echo Pulling latest changes...
git pull origin main --allow-unrelated-histories
if errorlevel 1 (
    echo.
    echo Pull failed. Resolve conflicts manually, then run this batch again.
    pause
    exit /b 1
)

echo Adding files...
git add .

echo Committing changes...
git commit -m "Publish latest app update"
if errorlevel 1 (
    echo Nothing to commit or commit failed.
)

echo Pushing to GitHub...
git push -u origin main
if errorlevel 1 (
    echo.
    echo Push failed. Check GitHub login/permissions.
    pause
    exit /b 1
)

echo.
echo Update published successfully.
pause