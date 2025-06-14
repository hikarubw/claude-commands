# Claude Commands Installation Script for Windows
# This script installs the claude-commands to either user or project level

param(
    [switch]$User,
    [switch]$Project,
    [string]$ProjectPath = (Get-Location).Path,
    [switch]$Help
)

# Set error action preference
$ErrorActionPreference = "Stop"

# Colors for output
function Write-Info { Write-Host "[INFO] $args" -ForegroundColor Blue }
function Write-Success { Write-Host "[SUCCESS] $args" -ForegroundColor Green }
function Write-Warning { Write-Host "[WARNING] $args" -ForegroundColor Yellow }
function Write-Error { Write-Host "[ERROR] $args" -ForegroundColor Red }

# Show help
if ($Help) {
    Write-Host "Usage: .\install.ps1 [OPTIONS]"
    Write-Host ""
    Write-Host "Options:"
    Write-Host "  -User                Install globally for user (~\.claude\commands)"
    Write-Host "  -Project             Install for specific project"
    Write-Host "  -ProjectPath PATH    Project path (default: current directory)"
    Write-Host "  -Help                Show this help message"
    Write-Host ""
    Write-Host "Interactive mode: Run without arguments to choose interactively"
    exit 0
}

# Header
Write-Host "================================" -ForegroundColor Blue
Write-Host "Claude Commands Installation" -ForegroundColor Blue  
Write-Host "================================" -ForegroundColor Blue
Write-Host ""

# Check if script is run from the claude-commands directory
if (-not (Test-Path ".claude\commands")) {
    Write-Error "This script must be run from the claude-commands directory"
    Write-Info "Please cd into the claude-commands directory and run: .\install.ps1"
    exit 1
}

$sourceDir = ".claude\commands"
$installType = ""

# Determine installation type
if ($User) {
    $installType = "user"
} elseif ($Project) {
    $installType = "project"
} else {
    # Interactive mode
    Write-Host "Choose installation type:"
    Write-Host "1) User level (global) - Available in all projects with /user: prefix"
    Write-Host "2) Project level - Available in current project with /project: prefix"
    Write-Host ""
    
    $choice = Read-Host "Enter your choice (1 or 2)"
    
    switch ($choice) {
        "1" { $installType = "user" }
        "2" { 
            $installType = "project"
            $input = Read-Host "Enter project path (press Enter for current directory)"
            if ($input) { $ProjectPath = $input }
        }
        default {
            Write-Error "Invalid choice"
            exit 1
        }
    }
}

# Set target directory and prefix based on installation type
if ($installType -eq "user") {
    $targetDir = "$env:USERPROFILE\.claude\commands"
    $prefix = "/user:"
} else {
    $targetDir = "$ProjectPath\.claude\commands"
    $prefix = "/project:"
    
    # Verify project path exists
    if (-not (Test-Path $ProjectPath)) {
        Write-Error "Project path does not exist: $ProjectPath"
        exit 1
    }
}

# Check if target directory exists
if (Test-Path $targetDir) {
    Write-Warning "Directory $targetDir already exists"
    $backup = Read-Host "Do you want to backup existing commands? (y/n)"
    
    if ($backup -eq 'y') {
        $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
        $backupDir = "$env:USERPROFILE\.claude\commands.backup.$timestamp"
        Write-Info "Creating backup at $backupDir"
        Move-Item -Path $targetDir -Destination $backupDir
        Write-Success "Backup created"
    } else {
        Write-Warning "Existing commands will be overwritten"
        $continue = Read-Host "Are you sure you want to continue? (y/n)"
        if ($continue -ne 'y') {
            Write-Info "Installation cancelled"
            exit 0
        }
    }
}

# Create ~/.claude directory if it doesn't exist
$claudeDir = "$env:USERPROFILE\.claude"
if (-not (Test-Path $claudeDir)) {
    Write-Info "Creating $claudeDir directory"
    New-Item -ItemType Directory -Path $claudeDir | Out-Null
}

# Copy commands
Write-Info "Installing commands to $targetDir"
Copy-Item -Path $sourceDir -Destination $targetDir -Recurse -Force

# Count installed commands
$commandCount = (Get-ChildItem -Path $targetDir -Filter "*.md" -Recurse).Count

Write-Success "Installation complete!"
Write-Host ""
Write-Host "✅ Installed $commandCount commands to $targetDir" -ForegroundColor Green
Write-Host ""

# Display available commands
Write-Host "Available Commands:" -ForegroundColor Blue
Write-Host "  Core Commands:"
Write-Host "    • $prefix`core:init      - Initialize new project"
Write-Host "    • $prefix`core:dev       - Development helper"
Write-Host "    • $prefix`core:handover  - Session handover"
Write-Host ""
Write-Host "  Development Commands:"
Write-Host "    • $prefix`dev:test      - Testing tools"
Write-Host "    • $prefix`dev:debug     - Debug assistance"
Write-Host "    • $prefix`dev:review    - Code review"
Write-Host ""
Write-Host "  Project Commands:"
Write-Host "    • $prefix`project:plan      - Project planning"
Write-Host "    • $prefix`project:deploy    - Deployment"
Write-Host "    • $prefix`project:monitor   - Monitoring setup"
Write-Host ""
Write-Host "  Utility Commands:"
Write-Host "    • $prefix`utility:deps      - Dependency management"
Write-Host "    • $prefix`utility:research  - Technical research"
Write-Host ""

# Show how to use help command
Write-Host "To see all commands:" -ForegroundColor Blue
Write-Host "$prefix`help" -ForegroundColor Green
Write-Host ""

# Show installation options for other type
if ($installType -eq "user") {
    Write-Host "To install for a specific project:" -ForegroundColor Blue
    Write-Host ".\install.ps1 -Project -ProjectPath C:\path\to\project" -ForegroundColor Green
} else {
    Write-Host "To install globally for all projects:" -ForegroundColor Blue
    Write-Host ".\install.ps1 -User" -ForegroundColor Green
}
Write-Host ""

# Create appropriate uninstall script
if ($installType -eq "user") {
    $uninstallScript = @'
# Uninstall claude-commands

Write-Host "Uninstalling Claude Commands..."
$commandsPath = "$env:USERPROFILE\.claude\commands"

if (Test-Path $commandsPath) {
    Remove-Item -Path $commandsPath -Recurse -Force
    Write-Host "✅ Commands removed from user directory" -ForegroundColor Green
} else {
    Write-Host "❌ No commands found to remove" -ForegroundColor Red
}

# Remove this uninstall script
Remove-Item -Path "$env:USERPROFILE\.claude\uninstall-commands.ps1" -Force
'@
    
    $uninstallScript | Out-File -FilePath "$env:USERPROFILE\.claude\uninstall-commands.ps1" -Encoding UTF8
    Write-Info "To uninstall later, run: ~\.claude\uninstall-commands.ps1"
} else {
    $uninstallPath = "$ProjectPath\.claude\uninstall-commands.ps1"
    $uninstallScript = @"
# Uninstall claude-commands from project

Write-Host "Uninstalling Claude Commands from project..."
`$commandsPath = "$targetDir"

if (Test-Path `$commandsPath) {
    Remove-Item -Path `$commandsPath -Recurse -Force
    Write-Host "✅ Commands removed from project" -ForegroundColor Green
} else {
    Write-Host "❌ No commands found to remove" -ForegroundColor Red
}

# Remove this uninstall script
Remove-Item -Path "$uninstallPath" -Force
"@
    
    $uninstallScript | Out-File -FilePath $uninstallPath -Encoding UTF8
    Write-Info "To uninstall later, run: .\.claude\uninstall-commands.ps1"
}

Write-Host ""
Write-Success "Happy coding with Claude! 🚀"