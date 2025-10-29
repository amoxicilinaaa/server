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

if getPlayerLevel(cid) >= 150 then
selfSay('Desculpa, apenas players level 150- podem ir no torneio de Johto!', cid)
return true
end

selfSay('Para entrar no torneio tem que pagar 20 hundred dollars, vai entrar?', cid)
talkState[talkUser] = 2

elseif talkState[talkUser] == 2 then

if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
if os.date("%X") < torneiolukas.startHour1lukas or os.date("%X") > torneiolukas.endHour1lukas then
if os.date("%X") < torneiolukas.startHour2lukas or os.date("%X") > torneiolukas.endHour2lukas then
if os.date("%X") < torneiolukas.startHour3lukas or os.date("%X") > torneiolukas.endHour3lukas then
if os.date("%X") < torneiolukas.startHour4lukas or os.date("%X") > torneiolukas.endHour4lukas then
selfSay('Não está na hora do torneio...', cid)
return true
         end
      end
   end
end
if doPlayerRemoveMoney(cid, torneiolukas.pricelukas) then
doTeleportThing(cid, torneiolukas.waitPlacelukas)
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