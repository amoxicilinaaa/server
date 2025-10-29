local keywordHandler = KeywordHandler:new()
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

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

if msgcontains(msg, 'torneio') then

if getPlayerItemCount(cid, torneio.revivePoke) >= 1 then
selfSay('Você não pode entrar no torneio portando revives.', cid)
return true
end

if getPlayerLevel(cid) <= 999 then
-- selfSay('Desculpa, apenas players level 150+ podem ir no torneio de Kanto!', cid)
return true
end

selfSay('Para entrar no torneio tem que pagar 20 hundred dollars, vai entrar?', cid)
talkState[talkUser] = 2

elseif talkState[talkUser] == 2 then

if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
if os.date("%X") < torneio.startHour1 or os.date("%X") > torneio.endHour1 then
if os.date("%X") < torneio.startHour2 or os.date("%X") > torneio.endHour2 then
if os.date("%X") < torneio.startHour3 or os.date("%X") > torneio.endHour3 then
if os.date("%X") < torneio.startHour4 or os.date("%X") > torneio.endHour4 then
selfSay('Não está na hora do torneio...', cid)
return true
         end
      end
   end
end
if doPlayerRemoveMoney(cid, torneio.price) then
doTeleportThing(cid, torneio.waitPlace)
else

selfSay('Você não tem dinheiro suficiente.', cid)
end
else
selfSay('Até mais.', cid)
talkState[talkUser] = 0
end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())