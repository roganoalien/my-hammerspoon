# Hammerspoon Configuration: Streamlined macOS Window Management and System Control

This Hammerspoon configuration provides an extensive set of tools for efficient window management, keyboard layout switching, and system control on macOS. It features customizable keyboard shortcuts, automatic window positioning, and convenient menubar controls for common system functions.

The configuration enhances productivity through automated window management, intelligent keyboard layout switching, and system state management. It includes features like window snapping, multi-screen support, and system sleep prevention controls. The implementation uses Lua scripting to create a seamless integration with macOS, providing visual feedback through customized alerts and menubar icons.

## Repository Structure
```
.
├── custom-fns/                    # Directory containing custom function modules
│   ├── autoKeyboardLayout.lua     # Automatic keyboard layout switching based on active application
│   ├── cafeinaMenubar.lua        # System sleep prevention control via menubar
│   ├── finderFns.lua             # Finder-specific window management functions
│   ├── remap.lua                 # Core window management keyboard shortcuts
│   ├── stateManagerMenu.lua      # System state management via menubar
│   └── window.lua                # Extended window manipulation functions
└── init.lua                      # Main configuration file and entry point
```

## Usage Instructions
### Prerequisites
- macOS 10.13 or later
- [Hammerspoon](https://www.hammerspoon.org/) installed
- Administrative privileges for system modifications

### Installation
1. Install Hammerspoon:
```bash
brew install --cask hammerspoon
```

2. Clone this configuration:
```bash
git clone https://github.com/yourusername/hammerspoon-config.git ~/.hammerspoon
```

3. Launch Hammerspoon and enable accessibility permissions when prompted

### Quick Start
1. Open Hammerspoon preferences and enable "Launch Hammerspoon at login"
2. Basic window management:
   - `Ctrl + Alt + Cmd + Left`: Move window to left half of screen
   - `Ctrl + Alt + Cmd + Right`: Move window to right half of screen
   - `Ctrl + Alt + Cmd + Up`: Maximize window
   - `Ctrl + Alt + Cmd + Down`: Center window at 75% size

### More Detailed Examples
1. Multi-screen window management:
```lua
-- Move window to next screen
hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "up", function() 
    local win = hs.window.focusedWindow()
    win:moveToScreen(win:screen():next())
end)
```

2. Keyboard Layout Switching:
- Automatically switches between layouts based on active application
- Menubar icon indicates current layout state
- Toggle automatic switching with keyboard shortcut

### Troubleshooting
Common Issues:
1. Keyboard shortcuts not working:
   - Check System Preferences > Security & Privacy > Privacy > Accessibility
   - Ensure Hammerspoon is allowed
   - Try restarting Hammerspoon

2. Menubar icons not appearing:
   - Verify icon paths in configuration
   - Check console for path-related errors
   - Restart Hammerspoon

Debug Mode:
- Open Hammerspoon console: `Help > Console`
- Enable debug logging:
```lua
hs.logger.defaultLogLevel = 'debug'
```

## Data Flow
The configuration processes user input through keyboard shortcuts and menubar interactions, triggering window management operations and system state changes.

```ascii
User Input (Keyboard/Mouse) --> Hammerspoon Event Handlers
            |
            v
    Input Processing Layer
            |
    +-------+-------+
    |               |
Window Manager  System Controls
    |               |
    v               v
macOS Window API  System APIs
```

Component Interactions:
1. Event handlers capture user input and route to appropriate modules
2. Window management functions interact with macOS window APIs
3. System control modules communicate with macOS system services
4. Menubar items provide visual feedback and state management
5. Keyboard layout manager monitors active applications
6. Alert system provides visual confirmation of actions
7. Configuration system maintains user preferences and shortcuts