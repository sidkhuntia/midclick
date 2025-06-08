import Cocoa

class PermissionManager: NSObject {
    
    /// Check if accessibility permissions are granted
    func checkAccessibilityPermissions() -> Bool {
        let trusted = AXIsProcessTrusted()
        
        if !trusted {
            print("Accessibility permissions not granted")
            requestAccessibilityPermissions()
        } else {
            print("Accessibility permissions granted")
        }
        
        return trusted
    }
    
    /// Request accessibility permissions from the user
    private func requestAccessibilityPermissions() {
        let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue(): true]
        let trusted = AXIsProcessTrustedWithOptions(options as CFDictionary)
        
        if !trusted {
            showPermissionAlert()
        }
    }
    
    /// Show alert explaining why permissions are needed
    private func showPermissionAlert() {
        DispatchQueue.main.async {
            let alert = NSAlert()
            alert.messageText = "Accessibility Permissions Required"
            alert.informativeText = """
            MidClick needs accessibility permissions to simulate mouse clicks.
            
            Please:
            1. Go to System Preferences > Security & Privacy > Privacy
            2. Select "Accessibility" from the left sidebar
            3. Click the lock to make changes
            4. Check the box next to "MidClick"
            
            You may need to restart the app after granting permissions.
            """
            alert.alertStyle = .warning
            alert.addButton(withTitle: "Open System Preferences")
            alert.addButton(withTitle: "Cancel")
            
            let response = alert.runModal()
            
            if response == .alertFirstButtonReturn {
                self.openSystemPreferences()
            }
        }
    }
    
    /// Open System Preferences to the Accessibility section
    private func openSystemPreferences() {
        let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility")!
        NSWorkspace.shared.open(url)
    }
    
    /// Check permissions periodically and update app state
    func startPeriodicPermissionCheck() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            let hasPermissions = self.checkAccessibilityPermissions()
            
            // TODO: Update app state based on permissions
            // This could disable/enable functionality or update UI
            NotificationCenter.default.post(
                name: .accessibilityPermissionsChanged,
                object: nil,
                userInfo: ["hasPermissions": hasPermissions]
            )
        }
    }
}

// MARK: - Notification Names
extension Notification.Name {
    static let accessibilityPermissionsChanged = Notification.Name("accessibilityPermissionsChanged")
}
