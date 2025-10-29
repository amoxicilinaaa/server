function onKill(cid, target, lastHit)
if isPlayer(cid) and isMonster(target) then
    if isPlayer(getCreatureMaster(target)) then
        return true
    end
local name = getGlobalStorageValue(90904488)
    if tostring(string.lower(getCreatureName(target))) == tostring(string.lower(name)) then
        doPlayerSetStorageValue(cid, 90904487, getPlayerStorageValue(cid, 90904487) + 1)
        doPlayerSendTextMessage(cid, 19, "[Derrote o Pokémon]: Você já derrotou "..getPlayerStorageValue(cid, 90904487).." "..name.."s! Continue derrotando-os para ser o vencedor(a)!")
    else
	-- print('target: '..string.lower(getCreatureName(target))..'')
	-- print('name: '..string.lower(name)..'')
	end
end
    return true
end

function onLogin(cid)
if getGlobalStorageValue(90904488) == 0 then
doPlayerSetStorageValue(cid, 90904487, 0)
end
registerCreatureEvent(cid, "MonsterHunter")
return true
end