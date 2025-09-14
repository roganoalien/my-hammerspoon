-- ---------------------------------------
-- --		CAFFEINATE IN MENUBAR		--
-- ---------------------------------------
-- SPOON LOADER
local Caffeine = hs.loadSpoon("Caffeine")
-- ON ICON
local cActive = hs.image.imageFromPath("/Users/roganoalien/.hammerspoon/icons/coffeeOn.png")
-- OFF ICON
local cInactive = hs.image.imageFromPath("/Users/roganoalien/.hammerspoon/icons/coffeeOff.png")
caffeinateMenuBar = hs.menubar.new(true, "caffeinateMenuBar")
caffeinateMenuBar:setIcon(cInactive, true)

local function caffeineON()
	hs.notify.new({title="Caffeine Status ON!", informativeText="System should not sleep nor power down nor restart"}):send()
	caffeinateMenuBar:setIcon(cActive, true)
	Caffeine:start()
end

local function caffeineOFF()
	hs.notify.new({title="Caffeine Status OFF!", informativeText="System will sleep, power down or restart"}):send()
	caffeinateMenuBar:setIcon(cInactive, true)
	Caffeine:stop()
end

caffeinateMenuBar:setMenu({
	{ title = "Turn on", fn = caffeineON },
	{ title = "Turn off", fn = caffeineOFF },
	{ title = "-" },
})