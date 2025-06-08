import Cocoa

/// Configuration for a global hotkey
struct HotkeyConfiguration {
    var keyCode: UInt16
    var modifierFlags: NSEvent.ModifierFlags
    var isEnabled: Bool
    
    init(keyCode: UInt16, modifierFlags: NSEvent.ModifierFlags, isEnabled: Bool = true) {
        self.keyCode = keyCode
        self.modifierFlags = modifierFlags
        self.isEnabled = isEnabled
    }
}

class HotkeyManager: NSObject {
    
    private var hotkeyConfiguration: HotkeyConfiguration
    private var globalMonitor: Any?
    
    override init() {
        // Default hotkey: Cmd+Shift+M
        self.hotkeyConfiguration = HotkeyConfiguration(
            keyCode: 46, // 'M' key
            modifierFlags: [.command, .shift]
        )
        super.init()
        setupHotkey()
    }
    
    private func setupHotkey() {
        guard hotkeyConfiguration.isEnabled else { return }
        
        cleanup() // Remove any existing monitor
        
        globalMonitor = NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { [weak self] event in
            self?.handleKeyEvent(event)
        }
        
        if globalMonitor != nil {
            print("Hotkey monitor registered successfully: Cmd+Shift+M")
        } else {
            print("Failed to register hotkey monitor")
        }
    }
    
    private func handleKeyEvent(_ event: NSEvent) {
        // Check if the event matches our hotkey configuration
        guard event.keyCode == hotkeyConfiguration.keyCode,
              event.modifierFlags.intersection(.deviceIndependentFlagsMask) == hotkeyConfiguration.modifierFlags else {
            return
        }
        
        handleHotkey()
    }
    
    private func handleHotkey() {
        print("Hotkey triggered! Simulating middle click...")
        // TODO: Implement actual middle click simulation
        simulateMiddleClick()
    }
    
    private func simulateMiddleClick() {
        // Get current mouse position
        let currentLocation = NSEvent.mouseLocation
        let screenHeight = NSScreen.main?.frame.height ?? 0
        
        // Convert to CGPoint (flip Y coordinate)
        let clickPoint = CGPoint(
            x: currentLocation.x,
            y: screenHeight - currentLocation.y
        )
        
        print("Simulating middle click at: \(clickPoint)")
        
        // TODO: Implement actual CGEvent simulation
        // This is a placeholder - will be implemented in Task 2.3
    }
    
    func updateConfiguration(_ config: HotkeyConfiguration) {
        cleanup()
        hotkeyConfiguration = config
        setupHotkey()
    }
    
    func cleanup() {
        if let monitor = globalMonitor {
            NSEvent.removeMonitor(monitor)
            globalMonitor = nil
        }
    }
    
    deinit {
        cleanup()
    }
}
