-- -- App Window Cycler
-- -- Cycles through all windows of the current application when pressing Option+Tab

-- local module = {}

-- -- Keep track of the current window index for each application
-- local appWindowIndices = {}

-- -- Function to cycle through windows of the current application
-- function module.cycleAppWindows()
-- 	local currentApp = hs.application.frontmostApplication()
-- 	if not currentApp then return end

-- 	local appBundleID = currentApp:bundleID()
-- 	local allWindows = currentApp:allWindows()

-- 	-- Filter out minimized windows but keep hidden ones
-- 	local windows = {}
-- 	for _, window in ipairs(allWindows) do
-- 		if window:isStandard() then
-- 			table.insert(windows, window)
-- 		end
-- 	end

-- 	-- If no windows found, do nothing
-- 	if #windows == 0 then
-- 		hs.alert.closeAll()
-- 		hs.alert.show("No windows found for " .. currentApp:name())
-- 		return
-- 	end

-- 	-- Initialize or increment the window index for this app
-- 	if not appWindowIndices[appBundleID] then
-- 		appWindowIndices[appBundleID] = 1
-- 	else
-- 		appWindowIndices[appBundleID] = appWindowIndices[appBundleID] + 1
-- 		-- Wrap around if we've gone past the end
-- 		if appWindowIndices[appBundleID] > #windows then
-- 			appWindowIndices[appBundleID] = 1
-- 		end
-- 	end

-- 	-- Get the next window to focus
-- 	local windowToFocus = windows[appWindowIndices[appBundleID]]

-- 	-- Focus the window and show a notification
-- 	if windowToFocus then
-- 		windowToFocus:focus()

-- 		-- Show an alert with the window title or index
-- 		local windowTitle = windowToFocus:title() or "Untitled"
-- 		local alertText = string.format("%s (%d/%d)", 
-- 			windowTitle, 
-- 			appWindowIndices[appBundleID], 
-- 			#windows
-- 		)
-- 		hs.alert.closeAll()
-- 		hs.alert.show(alertText)
-- 	end
-- end

-- -- Set up the hotkey
-- hs.hotkey.bind({"alt"}, "tab", module.cycleAppWindows)

-- return module

-- App Window Cycler
-- Cycles through all windows of the current application when pressing Option+Tab

local module = {}

-- Keep track of the current window index for each application
local appWindowIndices = {}

-- Function to cycle through windows of the current application
function module.cycleAppWindows()
	local currentApp = hs.application.frontmostApplication()
	if not currentApp then return end

	local appBundleID = currentApp:bundleID()
	local allWindows = currentApp:allWindows()

	-- Filter out minimized and non-standard windows
	local windows = {}
	for _, window in ipairs(allWindows) do
		if window:isStandard() then
			table.insert(windows, window)
		end
	end

	-- If no windows found, do nothing
	if #windows == 0 then
		-- hs.alert.closeAll()
		-- hs.alert.show("No windows found for " .. currentApp:name())
		showCenterWindow("No windows found for " .. currentApp:name(), 1)
		return
	end

	-- Sort windows to ensure consistent order
	table.sort(windows, function(a, b)
		return a:id() < b:id()
	end)

	-- Determine current window index
	local currentWindow = hs.window.focusedWindow()
	local currentIndex = 1
	for i, win in ipairs(windows) do
		if win:id() == currentWindow:id() then
			currentIndex = i
			break
		end
	end

	-- Set next index (wrap around)
	local nextIndex = currentIndex % #windows + 1

	-- Save for potential future use
	appWindowIndices[appBundleID] = nextIndex

	-- Focus the next window
	local windowToFocus = windows[nextIndex]
	if windowToFocus then
		windowToFocus:focus()

		-- Show an alert
		local windowTitle = windowToFocus:title() or "Untitled"
		-- local alertText = string.format("%s (%d/%d)",
		-- 	windowTitle,
		-- 	nextIndex,
		-- 	#windows
		-- )
		local alertText = string.format("%s (%d/%d)", 
			currentApp:name(),
			nextIndex,
			#windows
		)
		-- hs.alert.closeAll()
		-- hs.alert.show(alertText)
		showCenterWindow(alertText, 1)
	end
end

-- Set up the hotkey
hs.hotkey.bind({"alt"}, "tab", module.cycleAppWindows)

return module