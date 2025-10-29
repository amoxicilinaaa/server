STORAGE = 946587 -- Não Mecha
ITEM = 13582 -- Item a ser adicionado para completar a quest
QUANT = 1 -- Quantidade de items a ser adicionado


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
if (getPlayerStorageValue(cid, STORAGE) < 1) then
doPlayerAddItem(cid, ITEM, QUANT)
setPlayerStorageValue(cid, STORAGE, 1)
npcHandler:say('Aqui está sua mochila do Facebook! Convide seus amigos para jogar, assim terá mais chance de haver novos eventos!', cid)
else
npcHandler:say('Já te entreguei a mochila.', cid)
end
end
npcHandler:resetNpc()
return true
end

npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME|, Como forma de comemoração pelos 100 LIKES em nossa página, o administrador decidiu entregar uma mochila para cada treinador que utilizar o código de resgate liberado na página do jogo. (Digite o código de resgate e te entregarei a mochila.)")

local noNode = KeywordNode:new({'no'}, santaNPC, {present = false})
local yesNode = KeywordNode:new({'yes'}, santaNPC, {present = true})

local node = keywordHandler:addKeyword({'imo100likes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Para receber a mochila diga YES.'})
node:addChildKeywordNode(yesNode)
node:addChildKeywordNode(noNode)
npcHandler:addModule(FocusModule:new())