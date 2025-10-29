local config = {
	boss = "Dragonite Milenar",
	storage = 724800
}

function onKill(cid, target, damage, flags)
    if isMonster(target) then  
		if getCreatureName(target) == config.boss and getPlayerStorageValue(cid, config.storage) == -1 then
			setPlayerStorageValue(cid, config.storage, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parabens por matar o boss " .. config.boss .. ", pode pegar sua recompensa.")
			doSendMagicEffect(getCreaturePosition(cid), 66)
		end  
	end
	return true
end