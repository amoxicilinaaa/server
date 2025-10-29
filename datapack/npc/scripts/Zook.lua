local cfg = {
	watergem = 12193,
	watergemqnt = 37,	
	batwing = 12194,
	batwingqnt = 64,	
	applebite = 12179,
	applebiteqnt = 23,	
	eggs = 12155,
	eggsqnt = 155,
	reward2 = 11448,
	reward2qnt = 1,
	palavra = "ultimate",
	mensagem = "Você precisa ter os itens e quantidades corretos.",
	concluir = "Obrigado! Pegue essa roupa e essa pedra evolutiva como forma gratidão!"
}
 
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
function playerHaveItems(cid, itemid)
local items = type(itemid) == "table" and itemid or {itemid}
for i = 1, #items do
if getPlayerItemCount(cid, items) <= 0 then
return false
end
end
return true
end
 
function doPlayerRemoveItems(cid, itemid, count)
local items = type(itemid) == "table" and itemid or {itemid}
for i = 1, #items do
doPlayerRemoveItem(cid, items, count ~= nil and count or 1)
end
return nil
end
 
function creatureSayCallback(cid, type, msg)
 
if(not npcHandler:isFocused(cid)) then
return false
end
 
if msgcontains(msg, cfg.palavra) then
if getPlayerItemCount(cid, cfg.watergem) >= 37 and getPlayerItemCount(cid, cfg.batwing) >= 64 and getPlayerItemCount(cid, cfg.applebite) >= 23 and getPlayerItemCount(cid, cfg.eggs) >= 155 then
doPlayerRemoveItem(cid, cfg.watergem, cfg.watergemqnt)
doPlayerRemoveItem(cid, cfg.batwing, cfg.batwingqnt)
doPlayerRemoveItem(cid, cfg.applebite, cfg.applebiteqnt)
doPlayerRemoveItem(cid, cfg.eggs, cfg.eggsqnt)
doPlayerAddItem(cid, cfg.reward2, cfg.reward2qnt)
setPlayerStorageValue(cid, 2172456, 1)
selfSay(cfg.concluir)
else
selfSay(cfg.mensagem)
end
end 
return true
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())