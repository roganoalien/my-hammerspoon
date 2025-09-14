--------------------------------------
--		MERGE ALL FINDER TABS		--
--------------------------------------
local hyperKeys = { "ctrl", "cmd", "alt" }

hs.hotkey.bind(hyperKeys, "m", function()
	local currentApp = hs.window.focusedWindow()
	local theApp = currentApp:application()
	local currentName = theApp:name()
	if(currentName == "Finder") then
		theApp:selectMenuItem({"Window", "Merge All Windows"})
	end
end)
--------------------------------------
--		/MERGE ALL FINDER TABS		--
--------------------------------------

--------------------------------------------------
--		BRING ALL FINDER TABS TO FRONTMOST		--
--------------------------------------------------
-- local lastFrontmostApp = nil

-- hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window, appName)
-- 	if appName == "Finder" then
-- 		if appName ~=  lastFrontmostApp then
-- 			local app = hs.application.frontmostApplication()
-- 			local windows = app:allWindows()
-- 			for _, window in ipairs(windows) do
-- 				window:raise()
-- 			end
-- 			lastFrontmostApp = appName
-- 		end
-- 	else
-- 		lastFrontmostApp = appName
-- 	end
-- end)

--------------------------------------------------
--		/BRING ALL FINDER TABS TO FRONTMOST		--
--------------------------------------------------