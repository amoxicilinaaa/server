local lugar = {x=603, y=972, z=8}

local item = 2152
local quantidade = 100

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function santaNPC(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end
if (parameters.present == true) then
if(doPlayerRemoveItem(cid,item,quantidade) == true) then
doTeleportThing(cid, lugar)
npcHandler:say('Voce foi teleportado.',cid)
else
npcHandler:say('Voce não tem o item para ser teleportado',cid)
end
npcHandler:resetNpc()
return true
end
end

npcHandler:setMessage(MESSAGE_GREET, "Olá|PLAYERNAME|. Posso te levar para um lugar misterioso em troca de 100 HDS. Caso queira ir até lá diga {taxi}.")

local noNode = KeywordNode:new({'no'}, santaNPC, {present = false})
local yesNode = KeywordNode:new({'yes'}, santaNPC, {present = true})

local node = keywordHandler:addKeyword({'taxi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Vou te levar para um lugar,digite {yes}'})
node:addChildKeywordNode(yesNode)
node:addChildKeywordNode(noNode)
npcHandler:addModule(FocusModule:new())