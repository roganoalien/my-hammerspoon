-- sets icon PNG inside variables
local keyChangeBlockedEN = hs.image.imageFromPath("/Users/roganoalien/.hammerspoon/icons/AutoKeyBLOCKEDEN.png")
local keyChangeBlockedES = hs.image.imageFromPath("/Users/roganoalien/.hammerspoon/icons/AutoKeyBLOCKEDES.png")
local keyChangeBlockedJAP = hs.image.imageFromPath("/Users/roganoalien/.hammerspoon/icons/AutoKeyBLOCKEDJAP.png")
local keyChangeEnglish = hs.image.imageFromPath("/Users/roganoalien/.hammerspoon/icons/AutoKeyEN.png")
local keyChangeSpanish = hs.image.imageFromPath("/Users/roganoalien/.hammerspoon/icons/AutoKeyES.png")
local keyChangeJapanese = hs.image.imageFromPath("/Users/roganoalien/.hammerspoon/icons/AutoKeyJAP.png")
-- global variable that allows/prevents auto layout change
local stopKeyboardChange = false
local currentIcon = nil
-- creates the global menubar menu
local keyboardChangerStatus = hs.menubar.new(true, "keyboardChangerStatus")

local function alertCenteredOnWindow(message, duration)
	local win = hs.window.frontmostWindow()
	if not win then return end

	hs.alert.show(message, {}, win:screen(), duration or 1.5)
end

-- fn that sets the menu icon, receives boolean to know if the icon should be a locked one or not
local function setsMenuIcon(isBlocked)
	local currentMethod = hs.keycodes.currentMethod()
	-- com.apple.keylayout.LatinAmerican
	-- com.apple.keylayout.ABC
	local currentLayout = hs.keycodes.currentLayout()
	-- alertCenteredOnWindow(currentMethod, 1)
	-- alertCenteredOnWindow(currentLayout, 1)
	if currentMethod ~= nil and currentLayout == "ABC" then
		if isBlocked then
			-- JAPANESE BLOCKED
			currentIcon = keyChangeBlockedJAP
		else
			-- JAPANESE
			currentIcon = keyChangeJapanese
		end
	elseif currentMethod == nil and currentLayout == "ABC" then
		if isBlocked then
			currentIcon = keyChangeBlockedEN
		else
			currentIcon = keyChangeEnglish
		end
	else
		if isBlocked then
			currentIcon = keyChangeBlockedES
		else
			currentIcon = keyChangeSpanish
		end
	end
	keyboardChangerStatus:setIcon(currentIcon, true)
end

-- fn that locks or unlocks the auto layout change
local function changeKeyboardLayout()
	if stopKeyboardChange then
		stopKeyboardChange = not stopKeyboardChange
		setsMenuIcon(false)
		hs.notify.new({ title = "Keyboard listener active!", informativeText = "unlocked" }):send()
		-- ShowCenterWindow("Kerboard listener unlocked!", 1, false)
	else
		stopKeyboardChange = not stopKeyboardChange
		setsMenuIcon(true)
		-- ShowCenterWindow("Kerboard listener locked!", 1, false)
		hs.notify.new({ title = "Keyboard listener locked!", informativeText = "unlocked" }):send()
	end
end

-- fn that calls the setsMenuIcon fn but knowing if it should be locked
local function callSetMenu()
	setsMenuIcon(stopKeyboardChange)
end

-- Listener for keyboard changes, changes after user stops pressing keys for the shortcut
hs.keycodes.inputSourceChanged(callSetMenu)

local function isAppAllowed(appName)
	-- Corrected app names based on common Hammerspoon issues
	local allowedApps = {
		"Code",              -- Visual Studio Code (official)
		"iTerm",             -- iTerm2
		"Warp",              -- Warp terminal
		"WezTerm",           -- WezTerm
		"Ghostty",           -- Assuming this is correct
		"Xcode",             -- Xcode
		"Zed",               -- Zed IDE
		"Visual Studio Code" -- VSCode (full name variant)
	}

	-- Check if the app is in the allowed list
	for _, app in ipairs(allowedApps) do
		if appName == app then
			return true
		end
	end

	return false
end

-- IF APP MATCHES CHANGES KEYBOARD LAYOUT TO ENGLISH AND IF NOT CHANGES TO SPANISH
hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window, appName)
	if not stopKeyboardChange then
		local current = hs.keycodes.currentLayout()

		if not isAppAllowed(appName) then
			if (current ~= "Latin American") then
				-- hs.alert.closeAll()
				-- hs.alert.show("Español", nil, hs.screen.allScreens(), 1)
				-- alertCenteredOnWindow("Español", 1)
				ShowCenterWindow("Español", 1, true)
				hs.keycodes.setLayout("Latin American")
			end
		else
			if (current ~= "ABC") then
				-- hs.alert.closeAll()
				-- hs.alert.show("English", nil, hs.screen.allScreens(), 1)
				-- alertCenteredOnWindow("English", 1)
				ShowCenterWindow("English", 1, true)
				hs.keycodes.setLayout("ABC")
			end
		end
	end
end)

-- sets keyboard shortcut to disabled auto layout
hs.hotkey.bind({ "ctrl", "cmd", "alt" }, 'k', changeKeyboardLayout)
-- sets menu icon
setsMenuIcon(false)
-- sets menu items
keyboardChangerStatus:setMenu({
	{ title = "Toggle listener", fn = changeKeyboardLayout },
	{ title = "-" },
})
