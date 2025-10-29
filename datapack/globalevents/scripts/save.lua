local config = {
	broadcast = {120, 30},
	shallow = "no",
	delay = 3600,
	events = 30
}

config.shallow = getBooleanFromString(config.shallow)

local function executeSave(seconds)
	if(isInArray(config.broadcast, seconds)) then
		local text = ""
		if(not config.shallow) then
			text = Completo"
		else
			text = "S"
		end

		text = text .. "sempre salvar dentro " .. seconds .. " segundos, lembre-se que pode congelar!"
		doBroadcastMessage(text)
	end

	if(seconds > 0) then
		addEvent(executeSave, config.events * 1000, seconds - config.events)
	else
		doSaveServer(config.shallow)
	end
end

function onThink(interval)
	if(table.maxn(config.broadcast) == 0) then
		doSaveServer(config.shallow)
	else
		executeSave(config.delay)
	end

	return true
end
