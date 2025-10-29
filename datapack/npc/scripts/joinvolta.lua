keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end


local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

if (msgcontains(msg, 'cidade') or msgcontains(msg, 'city')) then

npcHandler:say("Deseja ir para a cidade ?", cid)
talkState[talkUser] = 1


elseif msgcontains(msg, 'yes') or msgcontains(msg, 'sim') and talkState[talkUser] == 1 then

if isPlayer(cid) then 
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
doSendMagicEffect(getPlayerPosition(cid), 21)
return true
end

elseif msg == "no" or "não" then
npcHandler:say("ok, entendo!", cid) 
talkState[talkUser] = 0 
npcHandler:releaseFocus(cid)
end


return TRUE
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())