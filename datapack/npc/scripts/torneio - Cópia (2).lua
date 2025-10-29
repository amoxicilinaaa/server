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

if msgcontains(msg, 'torneio') or msgcontains(msg, 'enter') then

if getPlayerItemCount(cid, torneio.revivePoke) >= 1 then
selfSay('Você não pode entrar no torneio com {revives}, por favor guarde eles e volte a falar comigo novamente.', cid)
return true
end

selfSay('Para entrar no torneio tem que pagar 20 hundred dollar, vai entrar?', cid)
talkState[talkUser] = 2

elseif talkState[talkUser] == 2 then

if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
if os.date("%X") < torneio.startHour1 or os.date("%X") > torneio.endHour1 then
if os.date("%X") < torneio.startHour2 or os.date("%X") > torneio.endHour2 then
if os.date("%X") < torneio.startHour3 or os.date("%X") > torneio.endHour3 then
if os.date("%X") < torneio.startHour4 or os.date("%X") > torneio.endHour4 then
selfSay('As inscrições para o torneio ainda não foram abertas, volte ás 08:45 am, 12:15 am, 18:45 pm ou ás 22:45 pm todo os dias.', cid)
return true
         end
      end
   end
end
if doPlayerRemoveMoney(cid, torneio.price) then
doTeleportThing(cid, torneio.waitPlace)
doPlayerSendTextMessage(cid, 21, "Bem vindo(a), esta é a sala de espera, você vai ficar esperando aqui enquanto o torneio não começa.")
else

selfSay('você não tem ('..torneio.price..') hundred dollar.', cid)
end
else
selfSay('Tem certeza de que não vai participar? Ok, até a próxima!', cid)
talkState[talkUser] = 0
end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())