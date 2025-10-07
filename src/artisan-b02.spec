# -*- mode: python ; coding: utf-8 -*-


a = Analysis(
    ['artisan.py'],
    pathex=[],
    binaries=[],
    datas=[('artisanlib', 'artisanlib'), ('icons', 'icons'), ('translations', 'translations'), ('ui', 'ui'), ('uic', 'uic'), ('help', 'help'), ('includes', 'includes'), ('misc', 'misc'), ('plus', 'plus'), ('proto', 'proto'), ('test', 'test'), ('debian', 'debian'), ('Wheels', 'Wheels')],
    hiddenimports=['numpy', 'scipy', 'matplotlib', 'PyQt6', 'PyQt6.QtCore', 'PyQt6.QtGui', 'PyQt6.QtWidgets', 'PyQt6.QtWebEngineWidgets', 'serial', 'usb', 'bleak', 'cryptography', 'lxml', 'openpyxl', 'websockets', 'prettytable', 'wcwidth', 'unidecode', 'babel', 'pytz', 'pydantic', 'pygments', 'charset_normalizer', 'dateutil', 'urllib3', 'certifi', 'requests', 'keyring', 'psutil', 'sqlite3', 'platformdirs', 'importlib_resources', 'setuptools', 'pkg_resources'],
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
    name='artisan-b02',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=['artisan.ico'],
)
