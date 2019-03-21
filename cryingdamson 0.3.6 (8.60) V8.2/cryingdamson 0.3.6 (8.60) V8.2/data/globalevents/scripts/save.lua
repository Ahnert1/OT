local config = {
	broadcast = {120, 30},
	shallow = "no",
	delay = 120,
	events = 30
}

config.shallow = getBooleanFromString(config.shallow)

local function executeSave(seconds)
	if(seconds > 0) then
		addEvent(executeSave, config.events * 1000, seconds - config.events)
	else
		doSaveServer(config.shallow)
	end
end

function onThink(interval, lastExecution, thinkInterval)
	if(table.maxn(config.broadcast) == 0) then
		doSaveServer(config.shallow)
	else
		executeSave(config.delay)
	end

	return true
end
