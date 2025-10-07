# Changelog - Artisan Kaleido Keyboard Control Fork

## [b06-final] - 2025-01-05

### Added
- Custom keyboard shortcuts for Kaleido roaster control
- Smart heating system initialization logic
- Hidden console window support
- Enhanced font loading for matplotlib

### Changed
- Modified `src/artisanlib/main.py` to include keyboard shortcuts in `keyPressEvent` method
- Optimized heating system commands to only initialize when incrementing burner

### Technical Details
- **N key**: Direct `HP,DW` command for burner down
- **M key**: Smart `HS,1` + `HP,UP` for burner up (only initializes HS if needed)
- **K key**: `FC,DW` for air down
- **' key**: `FC,UP` for air up  
- **Comma (,)** key: `RC,DW` for drum down
- **Period (.)** key: `RC,UP` for drum up

### Build Information
- PyInstaller: 6.16.0
- Python: 3.12.9
- Target: Windows x64 and ARM64
- Executable size: ~295MB (single file)

## [b05-optimized] - 2025-01-05

### Fixed
- Removed unnecessary PID manipulation code
- Optimized heating system initialization to only occur when incrementing burner

## [b04-final] - 2025-01-05

### Added
- Heating system initialization (`HS,1`) for burner controls
- Proper slider/graph synchronization with `eventtype` parameters

## [b03-single] - 2025-01-05

### Added
- Single executable build (`--onefile`)
- Hidden console window (`--noconsole`)
- Font loading improvements

## [b02] - 2025-01-05

### Fixed
- Corrected `eventtype` values for proper slider updates
- Resolved syntax errors in keyboard shortcut implementation

## [b01] - 2025-01-05

### Added
- Initial keyboard shortcut implementation
- Basic Kaleido command integration

