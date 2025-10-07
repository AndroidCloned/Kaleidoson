# -*- mode: python ; coding: utf-8 -*-


a = Analysis(
    ['artisan.py'],
    pathex=[],
    binaries=[],
    datas=[('artisanlib', 'artisanlib'), ('icons', 'icons'), ('translations', 'translations'), ('ui', 'ui')],
    hiddenimports=['numpy', 'scipy', 'matplotlib', 'PyQt6.QtWidgets', 'PyQt6.QtGui', 'PyQt6.QtCore', 'PyQt6.QtWebEngineWidgets', 'PyQt6.QtWebEngineCore', 'serial', 'usb', 'bleak', 'cryptography', 'lxml', 'openpyxl', 'websockets', 'requests'],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name='artisan-b03-single',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=True,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
