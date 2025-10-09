# Artisan Kaleido Keyboard Shortcuts - Code Differences

## 📍 File Location
**File**: `src/artisanlib/main.py`  
**Function**: `keyPressEvent` method  
**Lines**: Insert after line 12390 (after the existing quick event shortcuts)

## 🔧 Code to Add

Insert the following code block after the existing quick event shortcuts (around line 12390):

```python
                # Kaleido keyboard shortcuts for burner, air, and drum control
                elif k == Qt.Key.Key_N: # N (burner down)
                    if self.qmc.device == 138 and self.kaleido is not None:
                        self.kaleidoSendMessageAwaitSignal.emit('HP', 'DW', 3, -1)  # eventtype=3 for slider/graph sync
                        self.sendmessage('Burner: DOWN', append=False)
                elif k == Qt.Key.Key_M: # M (burner up)
                    if self.qmc.device == 138 and self.kaleido is not None:
                        # Only initialize heating system if not already active (allows burner to go past 5%)
                        if not hasattr(self.kaleido, 'HS') or self.kaleido.HS != 1:
                            self.kaleidoSendMessageSignal.emit('HS', '1')  # Start heating system only if needed
                        self.kaleidoSendMessageAwaitSignal.emit('HP', 'UP', 3, -1)  # eventtype=3 for slider/graph sync
                        self.sendmessage('Burner: UP', append=False)
                elif k == Qt.Key.Key_Comma: # , (drum down)
                    if self.qmc.device == 138 and self.kaleido is not None:
                        self.kaleidoSendMessageAwaitSignal.emit('RC', 'DW', 1, -1)
                        self.sendmessage('Drum: DOWN', append=False)
                elif k == Qt.Key.Key_Period: # . (drum up)
                    if self.qmc.device == 138 and self.kaleido is not None:
                        self.kaleidoSendMessageAwaitSignal.emit('RC', 'UP', 1, -1)
                        self.sendmessage('Drum: UP', append=False)
                elif k == Qt.Key.Key_K: # K (air down)
                    if self.qmc.device == 138 and self.kaleido is not None:
                        self.kaleidoSendMessageAwaitSignal.emit('FC', 'DW', 0, -1)
                        self.sendmessage('Air: DOWN', append=False)
                elif k == Qt.Key.Key_Apostrophe: # ' (air up)
                    if self.qmc.device == 138 and self.kaleido is not None:
                        self.kaleidoSendMessageAwaitSignal.emit('FC', 'UP', 0, -1)
                        self.sendmessage('Air: UP', append=False)
```

## 🎯 Key Mappings

| Key | Function | Command | Event Type | Description |
|-----|----------|---------|------------|-------------|
| **N** | Burner Down | `HP,DW` | 3 | Decrease burner power |
| **M** | Burner Up | `HS,1` + `HP,UP` | 3 | Increase burner power (smart HS init) |
| **K** | Air Down | `FC,DW` | 0 | Decrease air flow |
| **'** | Air Up | `FC,UP` | 0 | Increase air flow |
| **,** | Drum Down | `RC,DW` | 1 | Decrease drum speed |
| **.** | Drum Up | `RC,UP` | 1 | Increase drum speed |

## 🔍 Technical Details

### Device Check
- `self.qmc.device == 138`: Ensures shortcuts only work with Kaleido roaster
- `self.kaleido is not None`: Verifies Kaleido connection is active

### Signal Types
- `kaleidoSendMessageAwaitSignal.emit()`: Sends command and waits for response
- `kaleidoSendMessageSignal.emit()`: Sends command without waiting (used for HS,1)

### Event Types
- **HP (Burner)**: `eventtype=3` - Updates burner slider and graph
- **FC (Air)**: `eventtype=0` - Updates air slider and graph  
- **RC (Drum)**: `eventtype=1` - Updates drum slider and graph
- **Last parameter `-1`**: Prevents creating duplicate events

### Smart HS Logic
The burner up shortcut includes intelligent heating system initialization:
```python
if not hasattr(self.kaleido, 'HS') or self.kaleido.HS != 1:
    self.kaleidoSendMessageSignal.emit('HS', '1')
```
This only sends `HS,1` when:
- The heating system attribute doesn't exist, OR
- The heating system is not already active (HS != 1)

## 📋 Implementation Steps

1. **Locate the file**: `src/artisanlib/main.py`
2. **Find the function**: `keyPressEvent` method
3. **Find insertion point**: After the existing quick event shortcuts (around line 12390)
4. **Insert the code**: Add the entire code block above
5. **Test**: Verify shortcuts work with Kaleido roaster connected

## ⚠️ Important Notes

- **Device ID**: Ensure `self.qmc.device == 138` matches your Kaleido device ID
- **Key Conflicts**: Check that N, M, K, ', ,, . keys don't conflict with existing shortcuts
- **Dependencies**: Requires Kaleido communication module (`self.kaleido`)
- **Event Types**: Event type values (0,1,3) must match your Artisan's slider configuration

## 🎯 Expected Behavior

After implementation:
- **N/M**: Control burner with smart heating system initialization
- **K/'**: Control air flow with real-time slider updates
- **,/.**: Control drum speed with real-time slider updates
- **GUI Sync**: All sliders update in real-time
- **Graph Recording**: All changes are recorded in the roast graph
- **Status Messages**: "Burner: UP/DOWN", "Air: UP/DOWN", "Drum: UP/DOWN" appear in status

This implementation provides full Kaleido roaster control via keyboard shortcuts with proper GUI synchronization and smart heating system management.
