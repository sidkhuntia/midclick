import Cocoa

class MenuBarManager: NSObject {
    
    private var statusItem: NSStatusItem?
    private var isEnabled = true
    
    func setupMenuBar() {
        // Create status item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        // Set icon and title
        if let statusButton = statusItem?.button {
            // Try system symbol first, fallback to text
            if let image = NSImage(systemSymbolName: "cursorarrow.click.2", accessibilityDescription: "MidClick") {
                statusButton.image = image
            } else {
                // Fallback to text-based icon
                statusButton.title = "⌘🖱"
            }
            statusButton.toolTip = "MidClick - Middle Click Simulator"
        }
        
        // Create menu
        setupMenu()
        
        print("Menu bar item created successfully")
    }
    
    private func setupMenu() {
        let menu = NSMenu()
        
        // Enable/Disable toggle
        let toggleItem = NSMenuItem(
            title: isEnabled ? "Disable MidClick" : "Enable MidClick",
            action: #selector(toggleMidClick),
            keyEquivalent: ""
        )
        toggleItem.target = self
        menu.addItem(toggleItem)
        
        menu.addItem(NSMenuItem.separator())
        
        // Settings
        let settingsItem = NSMenuItem(
            title: "Settings...",
            action: #selector(openSettings),
            keyEquivalent: ","
        )
        settingsItem.target = self
        menu.addItem(settingsItem)
        
        menu.addItem(NSMenuItem.separator())
        
        // Quit
        let quitItem = NSMenuItem(
            title: "Quit MidClick",
            action: #selector(NSApplication.terminate(_:)),
            keyEquivalent: "q"
        )
        menu.addItem(quitItem)
        
        statusItem?.menu = menu
    }
    
    @objc private func toggleMidClick() {
        isEnabled.toggle()
        updateMenuTitle()
        
        // TODO: Implement actual enable/disable functionality
        print("MidClick \(isEnabled ? "enabled" : "disabled")")
    }
    
    @objc private func openSettings() {
        // TODO: Implement settings window
        print("Opening settings...")
    }
    
    private func updateMenuTitle() {
        if let menu = statusItem?.menu,
           let toggleItem = menu.item(at: 0) {
            toggleItem.title = isEnabled ? "Disable MidClick" : "Enable MidClick"
        }
    }
    
    func updateStatus(enabled: Bool) {
        isEnabled = enabled
        updateMenuTitle()
    }
}
