-- TO REPLACE RECTANGLE
-- half of screen
-- {frame.x, frame.y, window.w, window.h}
-- First two elements: we decide the position of frame
-- Last two elements: we decide the size of frame
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "left", function() hs.window.focusedWindow():moveToUnit({0.0, 0.0, 0.5, 1.0}) end)
-- hs.hotkey.bind({"ctrl", "alt", "cmd"}, "right", function() hs.window.focusedWindow():moveToUnit({0.5, 0.0, 0.5, 1.0}) end)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "right", function() hs.window.focusedWindow():moveToUnit({0.5, 0.0, 0.5, 1.0}) end)
-- hs.hotkey.bind({"ctrl", "cmd"}, "o", function() hs.window.focusedWindow():moveToUnit({0.0, 0.0, 1.0, 0.5}) end)
-- hs.hotkey.bind({"ctrl", "cmd"}, "p", function() hs.window.focusedWindow():moveToUnit({0.0, 0.5, 1.0, 0.5}) end)

-- quarter of screen
--[[
    u i
    j k
--]]
hs.hotkey.bind({"ctrl", "cmd"}, "u", function() hs.window.focusedWindow():moveToUnit({0.0, 0.0, 0.5, 0.5}) end)
hs.hotkey.bind({"ctrl", "cmd"}, "k", function() hs.window.focusedWindow():moveToUnit({0.5, 0.5, 0.5, 0.5}) end)
hs.hotkey.bind({"ctrl", "cmd"}, "i", function() hs.window.focusedWindow():moveToUnit({0.5, 0.0, 0.5, 0.5}) end)
hs.hotkey.bind({"ctrl", "cmd"}, "j", function() hs.window.focusedWindow():moveToUnit({0.0, 0.5, 0.5, 0.5}) end)

-- full screen
-- hs.hotkey.bind({"ctrl", "alt", "cmd"}, "up", function() hs.window.focusedWindow():moveToUnit({0, 0, 1, 1}) end)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "up", function() hs.window.focusedWindow():maximize() end)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "8", function() hs.window.focusedWindow():toggleFullScreen() end)
-- MOVES FOCUSED WINDOW TO THE LEFT SCREEN
-- hs.hotkey.bind({"ctrl", "alt", "cmd"}, "9", function() hs.window.focusedWindow():moveOneScreenWest():moveToUnit({0.25, 0.25, 0.75, 0.75}):centerOnScreen() end)
-- MOVES FOCUSED WINDOW TO THE RIGHT SCREEN
-- hs.hotkey.bind({"ctrl", "alt", "cmd"}, "0", function() hs.window.focusedWindow():moveOneScreenEast():moveToUnit({0.25, 0.25, 0.75, 0.75}):centerOnScreen() end)
-- GETS ALL SCREENS AND MOVES TO THE NEXT ONE
-- hs.hotkey.bind({"ctrl", "alt", "cmd"}, "0", function()
-- 	local currentScreen = hs.mouse.getCurrentScreen()
-- 	print("current screen is " .. currentScreen:name())
-- 	local allScreens = hs.screen.allScreens()
-- 	print("all screens are: " .. hs.inspect(allScreens))
-- 	local filteredScreens = {}

-- 	for _, screen in ipairs(allScreens) do
-- 		if screen:name() ~= currentScreen:name() then
-- 			table.insert(filteredScreens, screen)
-- 		end
-- 	end

-- 	print(filteredScreens[1]:name())

-- 	if #filteredScreens > 0 then
-- 		hs.window.focusedWindow():moveToScreen(filteredScreens[1], false, false)
-- 	else
-- 		hs.alert.show("There's no other screen!")
-- 	end
-- 	-- hs.window.focusedWindow():moveOneScreenEast():moveToUnit({0.25, 0.25, 0.75, 0.75}):centerOnScreen() 
-- end)

-- center screen
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "down", function() hs.window.focusedWindow():moveToUnit({0.25, 0.25, 0.75, 0.75}):centerOnScreen() end)

-- local modal = hs.hotkey.modal.new({"ctrl", "alt", "cmd"}, "m")

-- modal:bind({}, "f", function()
-- 	hs.alert.show("MODAL ENTERED AND EXITED after listening for f keystroke")
-- 	modal:exit()
-- end)