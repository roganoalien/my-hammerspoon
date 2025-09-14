local function moveWindowToNextScreen()
	local win = hs.window.focusedWindow()
	if not win then return end

	local currentScreen = win:screen()
	local nextScreen = currentScreen:next()
	if not nextScreen then return end

	win:moveToScreen(nextScreen)
end

hs.hotkey.bind({"ctrl", "shift", "cmd"}, "n", moveWindowToNextScreen)