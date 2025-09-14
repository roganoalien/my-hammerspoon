-- ██╗  ██╗ █████╗ ███╗   ███╗███╗   ███╗███████╗██████╗ ███████╗██████╗  ██████╗  ██████╗ ███╗   ██╗
-- ██║  ██║██╔══██╗████╗ ████║████╗ ████║██╔════╝██╔══██╗██╔════╝██╔══██╗██╔═══██╗██╔═══██╗████╗  ██║
-- ███████║███████║██╔████╔██║██╔████╔██║█████╗  ██████╔╝███████╗██████╔╝██║   ██║██║   ██║██╔██╗ ██║
-- ██╔══██║██╔══██║██║╚██╔╝██║██║╚██╔╝██║██╔══╝  ██╔══██╗╚════██║██╔═══╝ ██║   ██║██║   ██║██║╚██╗██║
-- ██║  ██║██║  ██║██║ ╚═╝ ██║██║ ╚═╝ ██║███████╗██║  ██║███████║██║     ╚██████╔╝╚██████╔╝██║ ╚████║
-- ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝      ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝
noHyper = { "ctrl", "cmd", "alt" }

-- STYLE OF ALERTS
hs.alert.defaultStyle = {
	atScreenEdge = 0, -- Prevent positioning at screen edges
	textSize  = 16, -- Readable text size
	strokeWidth  = 2, -- Border thickness
	radius = 8, -- slightly rounded corners
	fadeInDuration = 0.15,
	fadeOutDuration = 0.15,
	padding = nil,
	
	-- Tokyo Night colors
	fillColor = { red = 15/255, green = 20/255, blue = 40/255, alpha = 0.85 },  -- Deep navy background
	strokeColor = { red = 68/255, green = 71/255, blue = 90/255, alpha = 0.9 }, -- Soft gray-blue border
	textColor = { red = 199/255, green = 146/255, blue = 234/255, alpha = 1 },  -- Lavender text
}

-- CONFIG FOR WINDOW MANIPULATION
hs.window.animationDuration = 0
hs.window.setFrameCorrectness = false

-- file config for external files configs
package.path = hs.configdir .. "/custom-fns/?.lua;" .. package.path

function showFullScreenText(text)
	-- Creates a full-screen window
	local screen = hs.mouse.getCurrentScreen()
	local screenFrame = screen:frame()

	-- Creates the canvas
	local canvas = hs.canvas.new(screenFrame)
	canvas:appendElements({
		-- Background
		type = "rectangle",
		absolutePosition = true,
		absoluteSize = true,
		action = "fill",
		fillColor = { hex = "#000000", alpha = 0.75 },
		frame = { x = 0, y = 0, w = "100%", h = "100%" }
	})

	-- Centered Text
	canvas:appendElements({
		absolutePosition = true,
		absoluteSize = true,
		type = "text",
		action = "clip",
		text = text,
		textSize = 54,
		textColor = { hex = "#16161E", alpha = 0.75 },
		center = { x = "50%", y = "50%" },
		padding = 15,
		textAlignment = "right",
		frame = { x = 0, y = "95%", w = "100%", h = "100%" }
	})

	-- Show the canvas
	canvas:bringToFront(true)
	canvas:show()

	hs.timer.doAfter(2, function()
		canvas:hide()
	end)
end

function showCenterWindow(text, duration, isAlert)
	if not isAlert then
		local screen = hs.window.frontmostWindow()
		local screenFrame = screen:frame()

		local canvas = hs.canvas.new(screenFrame):appendElements({
			-- Dark semi-transparent background
			type = "rectangle",
			action = "fill",
			fillColor = {hex="#000000", alpha=0.25},
			frame = {x=screenFrame.x, y=screenFrame.y, w=screenFrame.w, h=screenFrame.h}
		}, {
			-- Centered white text
			type = "text",
			text = text,
			textSize = 35,
			textColor = {hex="#FFFFFF"},
			textAlignment = "center",
			frame = {x=0, y="45%", w="100%", h=100}
		})

		-- Bring it to the front and remove it after `duration` seconds
		canvas:level(hs.canvas.windowLevels.overlay)
		canvas:show()
		hs.timer.doAfter(0.5, function()
			canvas:hide()
		end)
	else
		hs.notify.show(text, "", "")
	end
end

-- LOAD EXTERNAL FILES
require("autoKeyboardLayout")
-- require("finderFns")
require("stateManagerMenu")
require("moveToNextScreen")
-- require("remap")
-- require("appWindowCycler")
-- require("window")
-- require("window")

-- Create a function to show the active app name
-- function showActiveAppName()
--     local frontApp = hs.application.frontmostApplication()
--     local appName = frontApp:name()
--     hs.alert.show("Active App: " .. appName, 1)
-- end

-- -- Set up the watcher for active app changes
-- appWatcher = hs.application.watcher.new(function(appName, eventType, appObject)
--     if eventType == hs.application.watcher.activated then
--         showActiveAppName()
--     end
-- end)

-- Start the watcher
-- appWatcher:start()

-- NOTIFICATION THAT SHOWS WHEN HAMMERSPOON STARTS IF EVERYTHING IS OK
-- showFullScreenText("Hammerspoon Started!!")
hs.notify.show("Hammerspoon Started!", "", "")