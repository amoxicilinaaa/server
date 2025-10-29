local exp = getPlayerExperience(cid)
local storage = 4334

function onLogin(cid)
	if isPlayer(cid) == getPlayerStorageValue(cid, storage) then
		setPlayerExtraExpRate(cid, exp * 2)
		doPlayerBroadcastMessage(cid, "Recebeu Experiencia a mais!")
	end
  return true
end