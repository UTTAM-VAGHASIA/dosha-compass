[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Step {
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )
    Write-Host "==> $Message" -ForegroundColor Cyan
}

function Invoke-ElevatedCommand {
    param(
        [Parameter(Mandatory)]
        [string]$Command
    )

    $shell = if ($PSVersionTable.PSEdition -eq 'Core') { 'pwsh' } else { 'powershell' }
    $arguments = @(
        '-NoProfile',
        '-ExecutionPolicy', 'Bypass',
        '-Command',
        $Command
    )

    Write-Step "Requesting elevation: $Command"

    $process = Start-Process -FilePath $shell -ArgumentList $arguments -Verb RunAs -PassThru
    $process.WaitForExit()

    if ($process.ExitCode -ne 0) {
        throw "Elevated command failed with exit code $($process.ExitCode)."
    }
}

function Ensure-Chocolatey {
    if (Get-Command choco -ErrorAction SilentlyContinue) {
        Write-Step 'Chocolatey already installed.'
        return
    }

    Write-Step 'Chocolatey not found. Installing via elevated session...'
    $installCommand = "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
    Invoke-ElevatedCommand -Command $installCommand

    if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
        throw 'Chocolatey installation failed or PATH not refreshed.'
    }

    Write-Step 'Chocolatey installed successfully.'
}

function Refresh-Environment {
    $refreshScript = Join-Path $env:ChocolateyInstall 'bin\refreshenv.cmd'
    if (Test-Path $refreshScript) {
        Write-Step 'Refreshing environment variables from Chocolatey...'
        & $refreshScript | Out-Null
    }
}

function Ensure-Fvm {
    if (Get-Command fvm -ErrorAction SilentlyContinue) {
        Write-Step 'FVM already installed.'
        return
    }

    Ensure-Chocolatey

    Write-Step 'Installing FVM via Chocolatey (elevated)...'
    Invoke-ElevatedCommand -Command 'choco install fvm -y'

    Refresh-Environment

    if (-not (Get-Command fvm -ErrorAction SilentlyContinue)) {
        throw 'FVM installation failed or PATH not updated.'
    }

    Write-Step 'FVM installed successfully.'
}

function Ensure-FlutterVersion {
    param(
        [Parameter(Mandatory)]
        [string]$Version
    )

    Ensure-Fvm

    Write-Step "Ensuring Flutter $Version is installed via FVM..."
    fvm install $Version -s | Out-Null
    fvm use $Version | Out-Null
}

function Ensure-Dependencies {
    Write-Step 'Running flutter pub get via FVM...'
    fvm flutter pub get
}

function Run-App {
    Write-Step 'Launching Flutter application on Windows desktop...'
    fvm flutter run -d windows
}

# Basic platform guard (PowerShell 7 exposes RuntimeInformation, Windows PowerShell relies on Win32NT comparison)
$isWindowsRuntime = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)
if (-not $isWindowsRuntime) {
    throw 'This script is intended for Windows environments only.'
}

if (-not (Test-Path 'pubspec.yaml')) {
    throw 'pubspec.yaml not found. Please run this script from the repository root.'
}

$targetFlutterVersion = '3.35.7'

try {
    Ensure-FlutterVersion -Version $targetFlutterVersion
    Ensure-Dependencies
    Run-App
}
catch {
    Write-Error $_
    exit 1
}
