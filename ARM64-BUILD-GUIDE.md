# ARM64 Build Setup Guide

## 🚀 Ready for ARM64 Build!

Your build script is **ready for ARM64** builds! Here's what you need to know:

## ✅ Build Script Status

The `build-kaleido-fork.ps1` script includes:
- ✅ **ARM64 parameter support**: `-ARM64` flag
- ✅ **Native ARM64 building**: No cross-compilation needed
- ✅ **All dependencies included**: Complete PyInstaller configuration
- ✅ **Architecture detection**: Shows system architecture
- ✅ **Requirements validation**: Checks ARM64 build requirements

## 🛠️ ARM64 Machine Setup

### 1. Prerequisites
```powershell
# Check your ARM64 machine has:
python --version          # Should show Python 3.12+
pip --version            # Should show pip 23.0+
pyinstaller --version    # Should show PyInstaller 6.16+
```

### 2. Clone Repository
```powershell
git clone https://github.com/AndroidCloned/Kaleidoson.git
cd Kaleidoson
```

### 3. Install Dependencies
```powershell
# Install Python dependencies
pip install -r src/requirements.txt

# Verify PyInstaller ARM64 support
pyinstaller --help | findstr "target-arch"
```

### 4. Build ARM64 Version
```powershell
# Build ARM64 version only
.\build-kaleido-fork.ps1 -Version b07 -ARM64

# Or build both architectures
.\build-kaleido-fork.ps1 -Version b07 -All -Clean
```

## 🔧 Build Commands

### ARM64 Only
```powershell
.\build-kaleido-fork.ps1 -Version b07 -ARM64
```

### Both Architectures
```powershell
.\build-kaleido-fork.ps1 -Version b07 -All -Clean
```

### Clean Build
```powershell
.\build-kaleido-fork.ps1 -Version b07 -ARM64 -Clean
```

## 📦 Expected Output

After successful build, you'll find:
```
dist/
├── artisan-kaleido-arm64-b07.exe    # ARM64 native binary
└── artisan-kaleido-x64-b07.exe      # x64 binary (if -All used)
```

## ⚠️ Important Notes

### ARM64 Specific Considerations
1. **Native Building**: PyInstaller builds natively on ARM64 Windows
2. **No Cross-Compilation**: Must run on actual ARM64 hardware
3. **Dependency Wheels**: All Python packages must have ARM64 wheels
4. **Performance**: ARM64 builds may be slightly slower than x64

### Common Issues & Solutions
1. **Missing ARM64 wheels**: Some packages may not have ARM64 support
2. **PyInstaller version**: Ensure PyInstaller 6.16+ for ARM64 support
3. **Python version**: Use Python 3.12+ for best ARM64 compatibility

## 🎯 Build Script Features

The script automatically:
- ✅ Detects system architecture
- ✅ Shows ARM64 build requirements
- ✅ Includes all necessary dependencies
- ✅ Handles data files and resources
- ✅ Creates versioned binary names
- ✅ Provides detailed build output

## 🚀 Ready to Build!

Your ARM64 machine is ready to build! The script will:
1. Check system architecture
2. Validate ARM64 requirements
3. Build native ARM64 executable
4. Show file size and success status

**Command to run on your ARM64 machine:**
```powershell
.\build-kaleido-fork.ps1 -Version b07 -ARM64 -Clean
```

The build should complete successfully and create `artisan-kaleido-arm64-b07.exe` in the `dist/` folder!
