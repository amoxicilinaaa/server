local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local config = {storage = 13540, pos = {x = 699, y = 1654, z = 7}}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	msg = msg:lower()


	if msgcontains(msg, "yes") then
        if getPlayerStorageValue(cid, config.storage) >= 1 then
            doTeleportThing(cid, config.pos) 
        else
            npcHandler:say("Você não é VIP!", cid)
        end
    elseif msgcontains(msg, "no") then
       npcHandler:say("Ok, até a próxima.", cid)
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())