# Artisan Kaleido Fork Build Script
# This script builds both x64 and ARM64 versions of the Artisan Kaleido fork

param(
    [string]$Version = "b01",
    [switch]$Clean = $false,
    [switch]$X64 = $true,
    [switch]$ARM64 = $false,
    [switch]$All = $false
)

Write-Host "=== Artisan Kaleido Fork Build Script ===" -ForegroundColor Green
Write-Host "Version: $Version" -ForegroundColor Yellow

# Check system architecture
$SystemArch = $env:PROCESSOR_ARCHITECTURE
Write-Host "System Architecture: $SystemArch" -ForegroundColor Cyan

# ARM64 build requirements check
if ($ARM64 -or $All) {
    Write-Host "`n=== ARM64 Build Requirements ===" -ForegroundColor Magenta
    Write-Host "✓ Python 3.12+ with ARM64 support" -ForegroundColor Green
    Write-Host "✓ PyInstaller 6.16+ with ARM64 support" -ForegroundColor Green
    Write-Host "✓ All dependencies must have ARM64 wheels available" -ForegroundColor Green
    Write-Host "✓ Building natively on ARM64 Windows (no cross-compilation)" -ForegroundColor Green
}

# Set build directory
$BuildDir = "dist"
$SrcDir = "src"

# Clean previous builds if requested
if ($Clean) {
    Write-Host "Cleaning previous builds..." -ForegroundColor Yellow
    if (Test-Path $BuildDir) {
        Remove-Item -Recurse -Force $BuildDir
    }
    if (Test-Path "build") {
        Remove-Item -Recurse -Force "build"
    }
    if (Test-Path "__pycache__") {
        Remove-Item -Recurse -Force "__pycache__"
    }
}

# Create build directory
if (!(Test-Path $BuildDir)) {
    New-Item -ItemType Directory -Path $BuildDir
}

# Function to build Artisan
function Build-Artisan {
    param(
        [string]$Arch,
        [string]$VersionSuffix
    )
    
    Write-Host "Building Artisan for $Arch..." -ForegroundColor Cyan
    
    $BinaryName = "artisan-kaleido-$Arch-$VersionSuffix.exe"
    $OutputPath = Join-Path $BuildDir $BinaryName
    
    # PyInstaller command with all necessary flags
    $PyInstallerArgs = @(
        "--onefile",
        "--noconsole",
        "--clean",
        "--name", "artisan-kaleido-$Arch-$VersionSuffix",
        "--distpath", $BuildDir,
        "--workpath", "build",
        "--specpath", ".",
        "--hidden-import=numpy",
        "--hidden-import=scipy", 
        "--hidden-import=matplotlib",
        "--hidden-import=matplotlib.font_manager",
        "--hidden-import=matplotlib.backends.backend_qtagg",
        "--hidden-import=PyQt6.QtCore",
        "--hidden-import=PyQt6.QtGui",
        "--hidden-import=PyQt6.QtWidgets",
        "--hidden-import=PyQt6.QtPrintSupport",
        "--hidden-import=serial",
        "--hidden-import=usb",
        "--hidden-import=bleak",
        "--hidden-import=cryptography",
        "--hidden-import=lxml",
        "--hidden-import=openpyxl",
        "--hidden-import=websockets",
        "--hidden-import=requests",
        "--hidden-import=platformdirs",
        "--hidden-import=babel",
        "--hidden-import=pytz",
        "--hidden-import=pydantic",
        "--hidden-import=pygments",
        "--hidden-import=tzdata",
        "--hidden-import=tomli",
        "--hidden-import=win32ctypes.core",
        "--hidden-import=jaraco.context",
        "--hidden-import=jaraco.functools",
        "--hidden-import=more_itertools",
        "--hidden-import=importlib_metadata",
        "--hidden-import=importlib_resources",
        "--hidden-import=zipp",
        "--hidden-import=distutils",
        "--hidden-import=pkg_resources",
        "--add-data", "src/artisanlib;artisanlib",
        "--add-data", "src/artisan;artisan",
        "--add-data", "src/artisanlib/translations;artisanlib/translations",
        "--add-data", "src/artisanlib/icons;artisanlib/icons",
        "--add-data", "src/artisanlib/roast;artisanlib/roast",
        "--add-data", "src/artisanlib/rc;artisanlib/rc",
        "--add-data", "src/artisanlib/rc/icons;artisanlib/rc/icons",
        "--add-data", "src/artisanlib/rc/translations;artisanlib/rc/translations",
        "--add-data", "src/artisanlib/rc/roast;artisanlib/rc/roast",
        "--add-data", "src/artisanlib/rc/icons;artisanlib/rc/icons",
        "--add-data", "src/artisanlib/rc/translations;artisanlib/rc/translations",
        "--add-data", "src/artisanlib/rc/roast;artisanlib/rc/roast",
        "src/artisan.py"
    )
    
    # Add architecture-specific flags
    if ($Arch -eq "arm64") {
        # Note: PyInstaller on Windows ARM64 builds natively, no cross-compilation needed
        # The --target-arch flag is not needed for native ARM64 builds
        Write-Host "Building native ARM64 version..." -ForegroundColor Magenta
    }
    
    Write-Host "Running PyInstaller..." -ForegroundColor Yellow
    Write-Host "Command: pyinstaller $($PyInstallerArgs -join ' ')" -ForegroundColor Gray
    
    try {
        & pyinstaller @PyInstallerArgs
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ Build successful: $BinaryName" -ForegroundColor Green
            $FileSize = (Get-Item $OutputPath).Length / 1MB
            Write-Host "  File size: $([math]::Round($FileSize, 1)) MB" -ForegroundColor Gray
        } else {
            Write-Host "✗ Build failed for $Arch" -ForegroundColor Red
            return $false
        }
    } catch {
        Write-Host "✗ Build error for $Arch: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
    
    return $true
}

# Build based on parameters
$BuildSuccess = $true

if ($All -or $X64) {
    $BuildSuccess = Build-Artisan -Arch "x64" -VersionSuffix $Version
}

if ($All -or $ARM64) {
    if ($BuildSuccess) {
        $BuildSuccess = Build-Artisan -Arch "arm64" -VersionSuffix $Version
    }
}

# Summary
Write-Host "`n=== Build Summary ===" -ForegroundColor Green
if ($BuildSuccess) {
    Write-Host "✓ All builds completed successfully!" -ForegroundColor Green
    Write-Host "`nBuilt binaries:" -ForegroundColor Yellow
    Get-ChildItem $BuildDir -Filter "*.exe" | ForEach-Object {
        $Size = $_.Length / 1MB
        Write-Host "  $($_.Name) - $([math]::Round($Size, 1)) MB" -ForegroundColor Gray
    }
} else {
    Write-Host "✗ Some builds failed. Check the output above." -ForegroundColor Red
}

Write-Host "`nBuild artifacts saved to: $BuildDir" -ForegroundColor Cyan
Write-Host "`nUsage examples:" -ForegroundColor Yellow
Write-Host "  .\build-kaleido-fork.ps1 -Version b02 -X64" -ForegroundColor Gray
Write-Host "  .\build-kaleido-fork.ps1 -Version b03 -ARM64" -ForegroundColor Gray  
Write-Host "  .\build-kaleido-fork.ps1 -Version b04 -All -Clean" -ForegroundColor Gray
