local caffeine = hs.caffeinate.watcher

local ghosttyOpened = false

local function handleCloseLid(eventType)
	if (eventType == caffeine.screensDidLock) then
		local app = hs.application.get("Ghostty")
		if app then
			ghosttyOpened = true
			app:kill()
		else
			ghosttyOpened = false
		end
		hs.caffeinate.systemSleep()
	elseif (eventType == caffeine.screensDidUnlock) and (ghosttyOpened) then
		ghosttyOpened = false
		hs.execute("open -a Ghostty")
	end
end

local watcher = caffeine.new(handleCloseLid)
watcher:start()
