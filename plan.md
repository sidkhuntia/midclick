Role:
- You are a senior software engineer.
- You are a senior developer.
- You are a senior programmer.
- You are a senior developer.


You are an expert Chrome extension developer, proficient in JavaScript/TypeScript, browser extension APIs, and web development.

Code Style and Structure
- Write clear, modular TypeScript code with proper type definitions
- Follow functional programming patterns; avoid classes
- Use descriptive variable names (e.g., isLoading, hasPermission)
- Structure files logically: popup, background, content scripts, utils
- Implement proper error handling and logging
- Document code with JSDoc comments

Architecture and Best Practices
- Strictly follow Manifest V3 specifications
- Divide responsibilities between background, content scripts and popup
- Configure permissions following the principle of least privilege
- Use modern build tools (webpack/vite) for development
- Implement proper version control and change management

Chrome API Usage
- Use chrome.* APIs correctly (storage, tabs, runtime, etc.)
- Handle asynchronous operations with Promises
- Use Service Worker for background scripts (MV3 requirement)
- Implement chrome.alarms for scheduled tasks
- Use chrome.action API for browser actions
- Handle offline functionality gracefully

Security and Privacy
- Implement Content Security Policy (CSP)
- Handle user data securely
- Prevent XSS and injection attacks
- Use secure messaging between components
- Handle cross-origin requests safely
- Implement secure data encryption
- Follow web_accessible_resources best practices

Performance and Optimization
- Minimize resource usage and avoid memory leaks
- Optimize background script performance
- Implement proper caching mechanisms
- Handle asynchronous operations efficiently
- Monitor and optimize CPU/memory usage

UI and User Experience
- Follow Material Design guidelines
- Implement responsive popup windows
- Provide clear user feedback
- Support keyboard navigation
- Ensure proper loading states
- Add appropriate animations

Internationalization
- Use chrome.i18n API for translations
- Follow _locales structure
- Support RTL languages
- Handle regional formats

Accessibility
- Implement ARIA labels
- Ensure sufficient color contrast
- Support screen readers
- Add keyboard shortcuts

Testing and Debugging
- Use Chrome DevTools effectively
- Write unit and integration tests
- Test cross-browser compatibility
- Monitor performance metrics
- Handle error scenarios

Publishing and Maintenance
- Prepare store listings and screenshots
- Write clear privacy policies
- Implement update mechanisms
- Handle user feedback
- Maintain documentation

Follow Official Documentation
- Refer to Chrome Extension documentation
- Stay updated with Manifest V3 changes
- Follow Chrome Web Store guidelines
- Monitor Chrome platform updates

Output Expectations
- Provide clear, working code examples
- Include necessary error handling
- Follow security best practices
- Ensure cross-browser compatibility
- Write maintainable and scalable code

# macOS Middle Click Simulator - Development Guide

## Project Overview
Build a macOS menu bar application that simulates middle mouse clicks using keyboard shortcuts. The app should detect cursor position and trigger middle click events on focusable elements.

## Core Requirements
- **Target Platform**: macOS (Swift/SwiftUI)
- **App Type**: Menu bar application
- **Primary Function**: Simulate middle click at cursor position using custom keyboard shortcuts
- **Initial Scope**: Web browsers (Safari, Chrome, Firefox)
- **Future Scope**: System-wide functionality

## Development Tasks (Execute in Order)

### Phase 1: Project Setup & Foundation
**Task 1.1: Project Architecture**
- Create new macOS project in Xcode
- Set up menu bar app structure (NSStatusItem)
- Configure app to run as background agent (LSUIElement = YES)
- Set minimum macOS version (recommend 12.0+)
- **Deliverable**: Basic menu bar app that shows icon and can be quit

**Task 1.2: Permissions Framework**
- Implement accessibility permissions request
- Add required entitlements and Info.plist keys
- Create permission status checking functions
- Handle permission denial gracefully
- **Deliverable**: App requests and verifies accessibility permissions

### Phase 2: Core Functionality
**Task 2.1: Global Hotkey System**
- Implement global hotkey registration using Carbon or modern alternatives
- Create hotkey configuration data structure
- Handle hotkey conflicts and registration failures
- Add hotkey enable/disable functionality
- **Deliverable**: System that can register and respond to global keyboard shortcuts

**Task 2.2: Cursor Position Detection**
- Implement mouse cursor position tracking
- Create system to detect element under cursor
- Add support for different element types (links, buttons, etc.)
- Handle edge cases (cursor outside screen, no focusable element)
- **Deliverable**: Function that returns current cursor position and element type

**Task 2.3: Middle Click Simulation**
- Research and implement CGEvent mouse simulation
- Create middle click event generation at specific coordinates
- Add event posting to target applications
- Handle timing and event ordering
- **Deliverable**: Function that simulates middle click at given coordinates

### Phase 3: Browser Integration
**Task 3.1: Browser Detection**
- Implement active browser detection (Safari, Chrome, Firefox)
- Create browser-specific event handling
- Add URL extraction from browser elements
- Handle different browser architectures
- **Deliverable**: System that identifies active browser and extracts link URLs

**Task 3.2: Link Processing**
- Implement link detection under cursor
- Add URL validation and cleaning
- Create new tab opening logic for each browser
- Handle special link types (javascript:, mailto:, etc.)
- **Deliverable**: Function that opens links in new tabs across major browsers

### Phase 4: User Interface
**Task 4.1: Menu Bar Interface**
- Design and implement status bar menu
- Add enable/disable toggle
- Create settings/preferences option
- Add quit functionality
- **Deliverable**: Complete menu bar interface with basic controls

**Task 4.2: Settings Window**
- Create preferences window for hotkey configuration
- Implement hotkey recorder component
- Add application-specific settings
- Include reset to defaults option
- **Deliverable**: Settings interface for customizing app behavior

### Phase 5: Error Handling & Polish
**Task 5.1: Error Management**
- Implement comprehensive error handling
- Add user-friendly error messages
- Create fallback behaviors for failed operations
- Add logging system for debugging
- **Deliverable**: Robust error handling throughout the application

**Task 5.2: Testing & Validation**
- Test across different macOS versions
- Validate functionality in various browsers
- Test edge cases and error conditions
- Performance testing and optimization
- **Deliverable**: Thoroughly tested and validated application

## Technical Specifications

### Required Technologies
- **Language**: Swift
- **Framework**: SwiftUI + AppKit for menu bar
- **APIs**: 
  - Accessibility APIs for permissions
  - Carbon or modern hotkey APIs
  - Core Graphics for mouse simulation
  - NSWorkspace for application detection

### Key Components to Implement
1. **HotkeyManager**: Global hotkey registration and handling
2. **CursorTracker**: Mouse position and element detection
3. **EventSimulator**: Middle click event generation
4. **BrowserInterface**: Browser-specific integration
5. **SettingsManager**: User preferences and configuration
6. **PermissionManager**: Accessibility permission handling

### Data Structures Needed
```swift
struct HotkeyConfiguration {
    var keyCode: UInt16
    var modifierFlags: NSEvent.ModifierFlags
    var isEnabled: Bool
}

struct CursorInfo {
    var position: CGPoint
    var elementType: ElementType
    var url: String?
    var isClickable: Bool
}

enum ElementType {
    case link, button, text, other
}
```

## Memory & Progress Tracking Requirements

### Development Log Format
For each completed task, maintain a log entry with:
```
Task: [Task Number and Name]
Status: [Completed/In Progress/Blocked]
Date: [Completion Date]
Files Modified: [List of files]
Key Functions Added: [Function names]
Known Issues: [Any bugs or limitations]
Next Steps: [What depends on this task]
```

### Bug Tracking
Maintain a running list of:
- **Critical Bugs**: Prevent core functionality
- **Minor Bugs**: Cosmetic or edge case issues
- **Enhancement Requests**: Future improvements
- **Technical Debt**: Code that needs refactoring

### Testing Checklist
For each phase, verify:
- [ ] Functionality works as expected
- [ ] Error cases are handled gracefully
- [ ] Performance is acceptable
- [ ] Memory usage is reasonable
- [ ] UI is responsive and intuitive

## Success Criteria
- App successfully simulates middle click on links in major browsers
- Custom keyboard shortcuts work reliably
- Menu bar interface is intuitive and responsive
- App handles permissions and errors gracefully
- Performance impact is minimal

## Notes for Implementation
- Prioritize reliability over features
- Test frequently on actual hardware
- Handle macOS security restrictions properly
- Keep UI minimal and focused
- Document any workarounds for system limitations

Start with Task 1.1 and work sequentially through each phase. Update your progress log after completing each task and note any issues encountered. and start in this directory.