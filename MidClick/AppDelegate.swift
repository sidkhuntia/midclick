import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var menuBarManager: MenuBarManager?
    private var permissionManager: PermissionManager?
    private var hotkeyManager: HotkeyManager?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Initialize managers
        permissionManager = PermissionManager()
        menuBarManager = MenuBarManager()
        hotkeyManager = HotkeyManager()
        
        // Set up menu bar
        menuBarManager?.setupMenuBar()
        
        // Check permissions on startup
        let hasPermissions = permissionManager?.checkAccessibilityPermissions() ?? false
        if !hasPermissions {
            print("Accessibility permissions required for full functionality")
        }
        
        // Start periodic permission monitoring
        permissionManager?.startPeriodicPermissionCheck()
        
        print("MidClick application started successfully")
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Clean up resources
        hotkeyManager?.cleanup()
        print("MidClick application terminated")
    }
    
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        // Don't reopen windows when clicking dock icon
        return false
    }
}
