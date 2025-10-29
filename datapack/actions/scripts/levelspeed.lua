local config = {
	savePlayersOnAdvance = false
}

function onAdvance(cid, skill, oldLevel, newLevel)
	if(config.savePlayersOnAdvance) then
		doPlayerSave(cid, false)
	return TRUE
	end
	if getPlayerLevel(cid) <= 99 then
    
	doChangeSpeed (cid, -getCreatureSpeed(cid))
	doChangeSpeed(cid, 282)
	elseif getPlayerLevel(cid) <= 199 then
	doChangeSpeed (cid, -getCreatureSpeed(cid))
	doChangeSpeed(cid, 1000)
		elseif getPlayerLevel(cid) <= 299 then
	doChangeSpeed (cid, -getCreatureSpeed(cid))
	doChangeSpeed(cid, 1500)
	elseif getPlayerLevel(cid) <= 399 then
	doChangeSpeed (cid, -getCreatureSpeed(cid))
	doChangeSpeed(cid, 2000)
	elseif getPlayerLevel(cid) <= 499 then
	doChangeSpeed (cid, -getCreatureSpeed(cid))
	doChangeSpeed(cid, 2500)
	elseif getPlayerLevel(cid) <= 599 then
	doChangeSpeed (cid, -getCreatureSpeed(cid))
	doChangeSpeed(cid, 3000)
	elseif getPlayerLevel(cid) <= 699 then
	doChangeSpeed (cid, -getCreatureSpeed(cid))
	doChangeSpeed(cid, 3500)	
	elseif getPlayerLevel(cid) <= 799 then
	doChangeSpeed (cid, -getCreatureSpeed(cid))
	doChangeSpeed(cid, 4000)
	elseif getPlayerLevel(cid) <= 899 then
	doChangeSpeed (cid, -getCreatureSpeed(cid))
	doChangeSpeed(cid, 4500)
	
end
return TRUE
end
