# Artisan Roasting Software - Kaleido Keyboard Control Fork

This is a custom fork of [Artisan Roasting Software](https://github.com/artisan-roaster-scope/artisan) with enhanced keyboard shortcuts for Kaleido roaster control.

## 🎯 Features Added

### Custom Keyboard Shortcuts for Kaleido Roaster Control

- **N**: Burner down (direct `HP,DW`)
- **M**: Burner up (smart `HS,1` + `HP,UP` if needed)
- **K**: Air down (FC, DW)
- **'**: Air up (FC, UP)
- **Comma (,)**: Drum down (RC, DW)
- **Period (.)**: Drum up (RC, UP)

### Key Improvements

- ✅ **Smart heating system initialization**: Only sends `HS,1` when incrementing burner (not when decrementing)
- ✅ **Full GUI synchronization**: Real-time slider updates and graph recording
- ✅ **Hidden console window**: No black PowerShell window during startup
- ✅ **Font support**: Proper matplotlib font loading included
- ✅ **Single executable**: Self-contained with all dependencies
- ✅ **Optimized code**: Clean, efficient implementation

## 🚀 Quick Start

### Prerequisites
- Windows 10/11 (x64)
- Kaleido roaster connected via serial/USB

### Installation
1. Download the latest release: `artisan-b06-final-x64.exe`
2. Run the executable
3. Configure your Kaleido roaster connection in Artisan
4. Use the keyboard shortcuts to control your roaster!

## ⌨️ Keyboard Shortcuts Usage

### Burner Control
- **M key**: Increment burner power (automatically initializes heating system if needed)
- **N key**: Decrement burner power (direct command, no initialization needed)

### Air Control  
- **' key**: Increase air flow
- **K key**: Decrease air flow

### Drum Control
- **Period (.)**: Increase drum speed
- **Comma (,)**: Decrease drum speed

## 🔧 Technical Details

### Smart Heating System Logic
The fork includes intelligent heating system management:
- When pressing **M** (burner up): Checks if heating system is active (`HS != 1`), initializes if needed, then increments burner
- When pressing **N** (burner down): Directly decrements burner without heating system checks
- This prevents the common 5% burner limitation issue while maintaining efficiency

### Code Location
The keyboard shortcuts are implemented in:
```
src/artisanlib/main.py (lines 12391-12415)
```

### Build Information
- **Base**: Artisan Roasting Software v2.12.0+
- **Python**: 3.12.9
- **PyQt**: 6.x
- **Build Tool**: PyInstaller 6.16.0

## 📦 Downloads

### Latest Release
- **artisan-b06-final-x64.exe** (294.9 MB) - Recommended for most Windows systems
- **artisan-b06-final-arm64.exe** (294.9 MB) - For ARM64 Windows devices (runs via emulation)

## 🤝 Contributing

This fork maintains compatibility with the original Artisan codebase. Contributions are welcome!

### Development Setup
1. Clone this repository
2. Install Python 3.12+ and dependencies from `src/requirements.txt`
3. Run `python src/artisan.py` for development
4. Use `pyinstaller` to build executables

## 📄 License

This project maintains the same license as the original Artisan Roasting Software. See [LICENSE](LICENSE) for details.

## 🙏 Acknowledgments

- Original [Artisan Roasting Software](https://github.com/artisan-roaster-scope/artisan) project
- Kaleido roaster community for testing and feedback

## 📞 Support

For issues specific to this fork's keyboard shortcuts, please open an issue in this repository.
For general Artisan support, refer to the [original project](https://github.com/artisan-roaster-scope/artisan).

---

**Note**: This is an unofficial fork created for enhanced Kaleido roaster control. Always refer to the original Artisan project for official updates and support.

