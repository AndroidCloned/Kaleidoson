# Artisan Kaleido Fork - Release Notes

## Version b06 (Latest) - Final Release

### 🎯 New Features
- **Custom Keyboard Shortcuts**: Direct control of Kaleido roaster parameters
- **Smart Heating System Management**: Automatic HS,1 initialization when needed
- **Single Executable Build**: Self-contained application with all dependencies
- **Hidden Console Window**: Clean startup without PowerShell window
- **Font Support**: Proper matplotlib font loading included

### ⌨️ Keyboard Shortcuts
| Key | Function | Command | Description |
|-----|----------|---------|-------------|
| **N** | Burner Down | `HP,DW` | Decrease burner power |
| **M** | Burner Up | `HS,1` + `HP,UP` | Increase burner power (smart initialization) |
| **K** | Air Down | `FC,DW` | Decrease air flow |
| **'** | Air Up | `FC,UP` | Increase air flow |
| **,** | Drum Down | `RC,DW` | Decrease drum speed |
| **.** | Drum Up | `RC,UP` | Increase drum speed |

### 🔧 Technical Improvements
- **Optimized Code**: Clean, efficient implementation without bloat
- **GUI Synchronization**: Real-time slider updates and graph recording
- **Event Type Mapping**: Proper event types for slider/graph sync
  - HP (Burner): eventtype=3
  - FC (Air): eventtype=0  
  - RC (Drum): eventtype=1
- **Smart HS Logic**: Only sends HS,1 when incrementing burner and system not active

### 🐛 Bug Fixes
- Fixed burner 5% limitation issue
- Resolved erratic slider updates
- Fixed PowerShell window appearing during startup
- Resolved font loading issues
- Fixed key conflicts with existing Artisan shortcuts

### 📦 Build Information
- **Base**: Artisan Roasting Software v2.12.0+
- **Python**: 3.12.9
- **PyQt**: 6.x
- **PyInstaller**: 6.16.0
- **Architecture**: x64 and ARM64 support
- **Size**: ~295 MB (includes all dependencies)

### 🚀 Installation
1. Download `artisan-b06-final-x64.exe` (recommended)
2. Run the executable
3. Configure Kaleido roaster connection in Artisan
4. Start roasting with keyboard shortcuts!

### 📋 System Requirements
- Windows 10/11 (x64 or ARM64)
- Kaleido roaster with serial/USB connection
- Minimum 4GB RAM
- 500MB free disk space

### 🔄 Migration from Previous Versions
- No migration needed - this is a standalone executable
- Previous Artisan installations remain unaffected
- Can run alongside original Artisan software

### 🎯 Known Limitations
- ARM64 version runs via emulation on x64 systems
- Keyboard shortcuts only work when Kaleido roaster is connected
- Requires Artisan to be in focus for shortcuts to work

### 📞 Support
- Issues: Open an issue in this repository
- General Artisan support: [Original project](https://github.com/artisan-roaster-scope/artisan)

---

## Previous Versions

### Version b05
- Initial ARM64 build attempt
- Fixed PowerShell window issue
- Added font support

### Version b04  
- Optimized HS,1 sending logic
- Fixed key conflicts
- Improved code efficiency

### Version b03
- Added smart heating system initialization
- Fixed burner 5% limitation
- Improved GUI synchronization

### Version b02
- Fixed event type mapping
- Resolved slider update issues
- Added proper command values

### Version b01
- Initial keyboard shortcut implementation
- Basic Kaleido control functionality
- Single executable build

---

**Note**: This is an unofficial fork created for enhanced Kaleido roaster control. Always refer to the original Artisan project for official updates and support.
