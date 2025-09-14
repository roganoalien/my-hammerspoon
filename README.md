# Hammerspoon Configuration: Streamlined macOS Window Management and System Control

This Hammerspoon configuration provides an extensive set of tools for efficient window management, keyboard layout switching, and system control on macOS. It features customizable keyboard shortcuts, automatic window positioning, and convenient menubar controls for common system functions.

The configuration enhances productivity through automated window management, intelligent keyboard layout switching, and system state management. It includes features like window snapping, multi-screen support, and system sleep prevention controls. The implementation uses Lua scripting to create a seamless integration with macOS, providing visual feedback through customized alerts and menubar icons.

## Repository Structure
```
.
├── custom-fns/                   # Directory containing custom function modules
│   ├── appWindowCycler.lua       # DEPRECATED - Cycles through all opened windows from the same app
│   ├── autoKeyboardLayout.lua    # Automatic keyboard layout switching based on active application
│   ├── cafeinaMenubar.lua        # DEPRECATED - System sleep prevention control via menubar
│   ├── finderFns.lua             # DEPRECATED - Finder-specific window management functions
│   ├── moveToNextScreen.lua      # Moves to the next screen the current window
│   ├── remap.lua                 # DEPRECATED - Core window management keyboard shortcuts
│   ├── stateManagerMenu.lua      # System state management via menubar
│   └── window.lua                # DEPRECATED - Extended window manipulation functions
├── icons/                        # Directory storing all icons used for the spoons
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
git clone https://github.com/roganoalien/my-hammerspoon.git ~/.hammerspoon
```

3. Launch Hammerspoon and enable accessibility permissions when prompted

### Quick Start
1. Open Hammerspoon preferences and enable "Launch Hammerspoon at login"
2. Basic shortcuts:
   - `Ctrl + Cmd + Alt + k`: Toggles app change listener to change keyboar layout
   - `Ctrl + Shift + Alt + n`: Move active window to next screen

### Details

##### Auto Keyboard Layout

1. Icons:
- Has 6 icons, two for EN keyboard language (one for keyboard listener off and other for active), has the same behaviour for ES and JAP

2. Allowed Apps:
- Inside `autoKeyboardLayout.lua` file theres a function named `local function isAppAllowed(appName)` which validates if the passed through app is inside the whitelist of the app and if it does returns a `true` and if not returns a `false` which will trigger the layout change to EN or ES... JAP layout does not enter the dynamics, it only shows to display which language your keyboard is currently at. 

##### Move To Next Screen
1. Simple one function that gets the current active screen via `win:screen()` and gets the nextScreen via `win:screen():next()` and if there's no next screen it will end the function, otherwise will use `win:moveToScreen(nextScreen)` where nextScreen is the `win:screen():next()` stored in a var.

##### State Manager Menu
1. Handles Icons, and turns on and off the macOS state manager with a bar menu icon and menu. Runs through two shortcuts: 1-`Turn on State Manager` and 2-`Turn off State Manager`

##### INIT LUA
Just triggers the files and loads them. Inside has two global functions:
- `showFullScreenText(text)` - which shows a full window inside the active window to display a message... it bugs a lot, probably due to the hammerspoon API
- `showCenterWindow(text, duration, isAlert)` - which displays a fullscreen text message... it bugs a lot too.

Both are not used by default. 