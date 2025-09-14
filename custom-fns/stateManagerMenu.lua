-- sets icon PNG inside variables
local stateON = hs.image.imageFromPath("/Users/roganoalien/.hammerspoon/icons/stateON.png")
local stateOFF = hs.image.imageFromPath("/Users/roganoalien/.hammerspoon/icons/stateOFF.png")
-- local variables to get status and icon
local stateIsOff = true
local stateIcon = nil
-- creates the global menubar menu
stateManagerStatus = hs.menubar.new(true, "stateManagerStatus")

local function triggerState(theStatus)
	if theStatus then
		hs.task.new("/usr/bin/shortcuts", function(exitCode, stdOut, stdErr)
			if exitCode == 0 then
				-- hs.alert("State Manager is ON!! ✅")
				-- showFullScreenText("State Manager ON!!")
			else
				-- hs.alert("Could not turn on the state manager!! ❌")
				-- showFullScreenText("Error trying to turn ON state manager!!")
			end
		end, {"run", "Turn on State Manager"}):start()
	else
		hs.task.new("/usr/bin/shortcuts", function(exitCode, stdOut, stdErr)
			if exitCode == 0 then
				-- hs.alert("State Manager is OFF!! ✅")
				-- showFullScreenText("State Manager OFF!!")
			else
				-- hs.alert("Could not turn off the state manager!! ❌")
				-- showFullScreenText("Error trying to turn OFF state manager!!")
			end
		end, {"run", "Turn off State Manager"}):start()
	end
end

local function setsStateMenuIcon(isBlocked)
	if isBlocked then
		stateIcon = stateOFF
		stateIsOff = true
		triggerState(false)
	else
		stateIcon = stateON
		stateIsOff = false
		triggerState(true)
	end
	stateManagerStatus:setIcon(stateIcon, true)
end

local function preTrigger()
	setsStateMenuIcon(not stateIsOff)
end

setsStateMenuIcon(true)

stateManagerStatus:setMenu({
	{ title = "Toogle State Maneger", fn = preTrigger },
	{ title = "-" },
})