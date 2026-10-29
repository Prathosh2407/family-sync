$ErrorActionPreference = "Stop"
$repoUrl = "https://github.com/Prathosh2407/family-sync.git"
$sourceRoot = $PSScriptRoot
$workRoot = Join-Path $env:TEMP ("family-sync-upload-" + [guid]::NewGuid().ToString("N"))

Write-Host "Checking Git..." -ForegroundColor Cyan
git --version | Out-Null
if ($LASTEXITCODE -ne 0) { throw "Install Git for Windows from https://git-scm.com/download/win, then reopen PowerShell." }
Write-Host "Cloning repository..." -ForegroundColor Cyan
git clone $repoUrl $workRoot
if ($LASTEXITCODE -ne 0) { throw "Clone failed. Check connectivity and GitHub sign-in." }
Write-Host "Copying the cleaned project..." -ForegroundColor Cyan
Get-ChildItem -LiteralPath $sourceRoot -Force | Where-Object { $_.Name -ne "push_to_github.ps1" -and $_.Name -ne ".git" } | ForEach-Object { Copy-Item -LiteralPath $_.FullName -Destination $workRoot -Recurse -Force }
$unsafePaths = @("android/local.properties", "android/app/google-services.json", "ios/Flutter/Generated.xcconfig", "ios/Flutter/flutter_export_environment.sh")
foreach ($relative in $unsafePaths) { $p = Join-Path $workRoot $relative; if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
Get-ChildItem -LiteralPath $workRoot -Recurse -Force -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -eq ".env" -or $_.Name -like ".env.*" } | Remove-Item -Force
Set-Location $workRoot
git add -A
if ($LASTEXITCODE -ne 0) { throw "Could not stage project files." }
git diff --cached --quiet
if ($LASTEXITCODE -eq 0) { Write-Host "No changes to push." -ForegroundColor Yellow; exit 0 }
git commit -m "feat: upload Family Sync Flutter application"
if ($LASTEXITCODE -ne 0) { throw "Commit failed. Configure git user.name and user.email." }
git push origin HEAD:main
if ($LASTEXITCODE -ne 0) { throw "Push failed. Complete GitHub sign-in and rerun the script." }
Write-Host "Family Sync uploaded: https://github.com/Prathosh2407/family-sync" -ForegroundColor Green
