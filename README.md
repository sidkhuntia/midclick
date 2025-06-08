# MidClick - macOS Middle Click Simulator

A macOS menu bar application that simulates middle mouse clicks using keyboard shortcuts.

## Features

- ✅ Global keyboard shortcut (Cmd+Shift+M) to simulate middle click
- ✅ Menu bar interface for easy access and control  
- ✅ Accessibility permissions handling
- ⏳ Designed for Safari, Chrome, and Firefox browsers (in development)
- ❌ 3-finger tap simulation (not yet implemented)

## Requirements

- macOS 12.0 or later
- Xcode 15.0 or later (for building)
- Accessibility permissions (app will prompt for these)

## Building and Running

### From Xcode
1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd midclick
   ```

2. Open the project in Xcode:
   ```bash
   open MidClick.xcodeproj
   ```

3. Select your development team in the project settings (if needed for code signing)

4. Build and run:
   - Press `Cmd+R` or click the "Run" button
   - Or build only: `Cmd+B`

### From Command Line
```bash
# Build the project
xcodebuild -project MidClick.xcodeproj -scheme MidClick -configuration Debug build

# Run the built app
open build/Debug/MidClick.app
```

## Checking if the App is Running

### Menu Bar Icon
- Look for a "⌘🖱" icon in your menu bar (top-right of screen)
- If you don't see it, check the "Control Center" section of menu bar items
- The icon might be hidden - try expanding the menu bar or checking in the overflow area

### Activity Monitor
1. Open Activity Monitor (`Applications > Utilities > Activity Monitor`)
2. Search for "MidClick" in the process list
3. If running, you'll see the MidClick process

### Console Logs
1. Open Console app (`Applications > Utilities > Console`)
2. In the search bar, type "MidClick"
3. Run the app and look for these messages:
   ```
   MidClick application started successfully
   Menu bar item created successfully
   Accessibility permissions granted/required
   ```

### Terminal Check
```bash
# Check if the app process is running
ps aux | grep MidClick

# Check for the app bundle
ls -la /Applications/MidClick.app  # if installed
ls -la build/Debug/MidClick.app    # if built locally
```

## Troubleshooting

### Menu Bar Icon Not Visible
1. **Check menu bar space**: macOS hides menu bar items when space is limited
2. **Try full screen exit**: Exit full-screen mode to see full menu bar
3. **Restart the app**: Quit and relaunch MidClick
4. **Check Console logs**: Look for "Menu bar item created successfully"

### App Won't Launch
1. **Check permissions**: Make sure you have accessibility permissions
2. **Code signing**: Verify your development team is set in Xcode project settings
3. **Clean build**: In Xcode, use `Product > Clean Build Folder` then rebuild

### Hotkey Not Working
1. **Accessibility permissions**: Must be granted for global hotkeys to work
2. **Conflicting shortcuts**: Check if Cmd+Shift+M is used by another app
3. **Check Console**: Look for "Hotkey monitor registered successfully"

## Current Functionality

### ✅ Implemented
- Menu bar application setup
- Global hotkey detection (Cmd+Shift+M)
- Accessibility permissions management
- Basic menu interface (Enable/Disable, Settings, Quit)

### ⏳ In Development
- Cursor position detection
- Actual middle click simulation
- Browser-specific link detection

### ❌ Not Yet Implemented
- **3-finger tap detection**: This requires trackpad gesture recognition
- Settings window for hotkey customization
- Browser integration for link opening
- System-wide middle click simulation

## Distribution

### For Development/Testing
- Build and run directly from Xcode
- Share the built `.app` bundle from `build/Debug/MidClick.app`

### For Production Distribution
1. **Code Signing**: Set up proper code signing certificate
2. **Notarization**: Required for macOS Gatekeeper
3. **App Store**: Submit through App Store Connect (optional)
4. **Direct Distribution**: 
   ```bash
   # Create a distributable build
   xcodebuild -project MidClick.xcodeproj -scheme MidClick -configuration Release archive
   ```

### Creating a DMG
```bash
# After building Release version
hdiutil create -volname "MidClick" -srcfolder build/Release/MidClick.app -ov -format UDZO MidClick.dmg
```

## Development Status

See [plan.md](plan.md) for the complete development roadmap.

### Completed Tasks
- ✅ Task 1.1: Project architecture and menu bar setup
- ✅ Task 1.2: Permissions framework implementation  
- ✅ Task 2.1: Global hotkey system

### Currently Working On
- 🔄 Task 2.2: Cursor position detection
- 🔄 Task 2.3: Middle click simulation with CGEvent

### Upcoming Features
- Browser integration
- 3-finger tap detection
- Settings interface
- Link processing

## FAQ

**Q: Why don't I see the menu bar icon?**
A: Check the troubleshooting section above. Most common issue is limited menu bar space.

**Q: Is 3-finger tap supported?**
A: Not yet. Currently only keyboard shortcuts (Cmd+Shift+M) are implemented.

**Q: Which browsers are supported?**
A: Browser integration is still in development. Basic functionality works system-wide.

**Q: Can I change the hotkey?**
A: Settings interface is planned but not yet implemented. Default is Cmd+Shift+M.

## Architecture

The application follows a modular design:

- [`AppDelegate.swift`](MidClick/AppDelegate.swift): Main application coordinator
- [`MenuBarManager.swift`](MidClick/MenuBarManager.swift): Handles status bar icon and menu
- [`HotkeyManager.swift`](MidClick/HotkeyManager.swift): Manages global keyboard shortcuts
- [`PermissionManager.swift`](MidClick/PermissionManager.swift): Handles accessibility permissions

## Contributing

This is a personal project following the development plan in [plan.md](plan.md).

## License

MIT License - see [LICENSE](LICENSE) for details.
