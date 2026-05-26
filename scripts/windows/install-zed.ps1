# Sync Zed config (settings.json / keymap.json) from this nix-config repo
# to the local Windows Zed config directory: %APPDATA%\Zed\
#
# Usage (from repo root, in PowerShell):
#   pwsh ./scripts/windows/install-zed.ps1
#
# Notes:
# - Only configuration files are synced. Extensions must be installed
#   manually in Zed UI (catppuccin / catppuccin-icons / gdscript / html).
# - Existing files at the destination are overwritten without backup.

$ErrorActionPreference = "Stop"

$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$SrcDir   = Join-Path $RepoRoot "home\base\desktop\conf\zed"
$DstDir   = Join-Path $env:APPDATA "Zed"

if (-not (Test-Path $SrcDir)) {
    Write-Error "Source dir not found: $SrcDir"
}

if (-not (Test-Path $DstDir)) {
    New-Item -ItemType Directory -Path $DstDir | Out-Null
}

Copy-Item -Force (Join-Path $SrcDir "settings.json") (Join-Path $DstDir "settings.json")
Copy-Item -Force (Join-Path $SrcDir "keymap.json")   (Join-Path $DstDir "keymap.json")

Write-Host "Zed config installed to $DstDir"
