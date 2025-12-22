# Solana iOS Setup Script
# Run this script to copy code from Nicegram-iOS and prepare for GitHub

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Solana iOS Setup Script" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$sourceDir = "..\Forks\Nicegram-iOS-master"
$currentDir = Get-Location

# Check if source exists
if (-not (Test-Path $sourceDir)) {
    Write-Host "ERROR: Nicegram-iOS-master folder not found!" -ForegroundColor Red
    Write-Host "Make sure you have the Forks folder with Nicegram-iOS-master"
    exit 1
}

Write-Host "Step 1: Copying files from Nicegram-iOS..." -ForegroundColor Yellow
Write-Host "This may take a few minutes..."

# Directories to copy
$directories = @("Telegram", "submodules", "build-system", "third-party", "Nicegram")

foreach ($dir in $directories) {
    $source = Join-Path $sourceDir $dir
    if (Test-Path $source) {
        Write-Host "  Copying $dir..." -ForegroundColor Gray
        Copy-Item -Path $source -Destination $currentDir -Recurse -Force
    }
}

# Root files to copy
$files = @("WORKSPACE", "BUILD", "versions.json", ".bazelrc", ".bazelversion")

foreach ($file in $files) {
    $source = Join-Path $sourceDir $file
    if (Test-Path $source) {
        Write-Host "  Copying $file..." -ForegroundColor Gray
        Copy-Item -Path $source -Destination $currentDir -Force
    }
}

Write-Host ""
Write-Host "Step 2: Creating Solana module directory..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path ".\Telegram\Solana" -Force | Out-Null
New-Item -ItemType Directory -Path ".\Telegram\Solana\Sources" -Force | Out-Null
New-Item -ItemType Directory -Path ".\Telegram\Solana\Resources" -Force | Out-Null

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "  Setup complete!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Initialize git repository: git init"
Write-Host "2. Add all files: git add ."
Write-Host "3. Commit: git commit -m 'Initial commit'"
Write-Host "4. Add remote: git remote add origin https://github.com/YOUR_USERNAME/Solana-iOS.git"
Write-Host "5. Push: git push -u origin main"
Write-Host ""
Write-Host "Then add your Telegram API credentials to GitHub Secrets:"
Write-Host "  - TELEGRAM_API_ID"
Write-Host "  - TELEGRAM_API_HASH"
Write-Host ""