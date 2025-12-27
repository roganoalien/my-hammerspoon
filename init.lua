NoHyper = { "ctrl", "cmd", "alt" }

-- STYLE OF ALERTS
hs.alert.defaultStyle = {
	atScreenEdge    = 0, -- Prevent positioning at screen edges
	textSize        = 16, -- Readable text size
	strokeWidth     = 2, -- Border thickness
	radius          = 8, -- slightly rounded corners
	fadeInDuration  = 0.15,
	fadeOutDuration = 0.15,
	padding         = nil,
	-- Tokyo Night colors
	fillColor       = { red = 15 / 255, green = 20 / 255, blue = 40 / 255, alpha = 0.85 }, -- Deep navy background
	strokeColor     = { red = 68 / 255, green = 71 / 255, blue = 90 / 255, alpha = 0.9 }, -- Soft gray-blue border
	textColor       = { red = 199 / 255, green = 146 / 255, blue = 234 / 255, alpha = 1 }, -- Lavender text
}

-- CONFIG FOR WINDOW MANIPULATION
hs.window.animationDuration = 0
hs.window.setFrameCorrectness = false

-- file config for external files configs
package.path = hs.configdir .. "/custom-fns/?.lua;" .. package.path

-- LOAD EXTERNAL FILES
require("autoKeyboardLayout")
-- require("micVolume")
require("lidSleep")

-- move window to next screen
hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, "space", function()
	local win = hs.window.focusedWindow()
	if win then
		local currentScreen = win:screen()
		local nextScreen = currentScreen:next()

		if nextScreen then
			local nextScreenFrame = nextScreen:frame()
			win:setFrame({
				x = nextScreenFrame.x,
				y = nextScreenFrame.y,
				w = nextScreenFrame.w,
				h = nextScreenFrame.h
			})
		end
	end
end)


-- NOTIFICATION THAT SHOWS WHEN HAMMERSPOON STARTS IF EVERYTHING IS OK
-- ShowFullScreenText("Hammerspoon Started!!")
hs.notify.show("Hammerspoon Started!", "", "")
