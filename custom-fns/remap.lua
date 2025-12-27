-- REMAP to trigger loop shortcut if theres an external keyboard connected

-- ██╗  ██╗ █████╗ ██╗     ███████╗    ██╗     ███████╗███████╗████████╗
-- ██║  ██║██╔══██╗██║     ██╔════╝    ██║     ██╔════╝██╔════╝╚══██╔══╝
-- ███████║███████║██║     █████╗      ██║     █████╗  █████╗     ██║
-- ██╔══██║██╔══██║██║     ██╔══╝      ██║     ██╔══╝  ██╔══╝     ██║
-- ██║  ██║██║  ██║███████╗██║         ███████╗███████╗██║        ██║
-- ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝         ╚══════╝╚══════╝╚═╝        ╚═╝
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "left", function()
	local win = hs.window.focusedWindow()
	local screenFrame = win:screen():frame()
	if win then
		win:setFrame({
			x = screenFrame.x,
			y = screenFrame.y,
			w = screenFrame.w / 2,
			h = screenFrame.h
		})
	end
end)

-- ███╗   ███╗ █████╗ ██╗  ██╗██╗███╗   ███╗██╗███████╗███████╗
-- ████╗ ████║██╔══██╗╚██╗██╔╝██║████╗ ████║██║╚══███╔╝██╔════╝
-- ██╔████╔██║███████║ ╚███╔╝ ██║██╔████╔██║██║  ███╔╝ █████╗
-- ██║╚██╔╝██║██╔══██║ ██╔██╗ ██║██║╚██╔╝██║██║ ███╔╝  ██╔══╝
-- ██║ ╚═╝ ██║██║  ██║██╔╝ ██╗██║██║ ╚═╝ ██║██║███████╗███████╗
-- ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝     ╚═╝╚═╝╚══════╝╚══════╝
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "up", function()
	local win = hs.window.focusedWindow()
	local screenFrame = win:screen():frame()
	if win then
		win:setFrame({
			x = screenFrame.x,
			y = screenFrame.y,
			w = screenFrame.w,
			h = screenFrame.h
		})
	end
end)
-- ███╗   ██╗    ███████╗ ██████╗██████╗ ███████╗███████╗███╗   ██╗    ███╗   ███╗ █████╗ ██╗  ██╗
-- ████╗  ██║    ██╔════╝██╔════╝██╔══██╗██╔════╝██╔════╝████╗  ██║    ████╗ ████║██╔══██╗╚██╗██╔╝
-- ██╔██╗ ██║    ███████╗██║     ██████╔╝█████╗  █████╗  ██╔██╗ ██║    ██╔████╔██║███████║ ╚███╔╝
-- ██║╚██╗██║    ╚════██║██║     ██╔══██╗██╔══╝  ██╔══╝  ██║╚██╗██║    ██║╚██╔╝██║██╔══██║ ██╔██╗
-- ██║ ╚████║    ███████║╚██████╗██║  ██║███████╗███████╗██║ ╚████║    ██║ ╚═╝ ██║██║  ██║██╔╝ ██╗
-- ╚═╝  ╚═══╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
hs.hotkey.bind({ "ctrl", "alt", "cmd", "shift" }, "up", function()
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

-- ██╗  ██╗ █████╗ ██╗     ███████╗    ██████╗ ██╗ ██████╗ ██╗  ██╗████████╗
-- ██║  ██║██╔══██╗██║     ██╔════╝    ██╔══██╗██║██╔════╝ ██║  ██║╚══██╔══╝
-- ███████║███████║██║     █████╗      ██████╔╝██║██║  ███╗███████║   ██║
-- ██╔══██║██╔══██║██║     ██╔══╝      ██╔══██╗██║██║   ██║██╔══██║   ██║
-- ██║  ██║██║  ██║███████╗██║         ██║  ██║██║╚██████╔╝██║  ██║   ██║
-- ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝         ╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "right", function()
	local win = hs.window.focusedWindow()
	local screenFrame = win:screen():frame()
	if win then
		win:setFrame({
			x = screenFrame.x + screenFrame.w / 2,
			y = screenFrame.y,
			w = screenFrame.w / 2,
			h = screenFrame.h
		})
	end
end)

--  ██████╗███████╗███╗   ██╗████████╗███████╗██████╗
-- ██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔════╝██╔══██╗
-- ██║     █████╗  ██╔██╗ ██║   ██║   █████╗  ██████╔╝
-- ██║     ██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗
-- ╚██████╗███████╗██║ ╚████║   ██║   ███████╗██║  ██║
--  ╚═════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "down", function()
	local win = hs.window.focusedWindow()
	local screenFrame = win:screen():frame()
	if win then
		win:setFrame({
			x = screenFrame.x + screenFrame.w / 8,
			y = screenFrame.y + screenFrame.h / 8,
			w = screenFrame.w / 8 * 6,
			h = screenFrame.h / 8 * 6
		})
	end
end)
