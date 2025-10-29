local cfg = {
	watergem = 12159,
	watergemqnt = 1000,	
	batwing = 11449,
	batwingqnt = 50,	
	applebite = 12276,
	applebiteqnt = 25,	
	reward1 = 14158,
	reward1qnt = 1,
	palavra = "feather",
	mensagem = "Você precisa ter os itens e quantidades corretos.",
	concluir = "Obrigado! Pegue essa pena que um Articuno deixou cair!"
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
if getPlayerItemCount(cid, cfg.watergem) >= 1000 and getPlayerItemCount(cid, cfg.batwing) >= 50 and getPlayerItemCount(cid, cfg.applebite) >= 25 then
doPlayerRemoveItem(cid, cfg.watergem, cfg.watergemqnt)
doPlayerRemoveItem(cid, cfg.batwing, cfg.batwingqnt)
doPlayerRemoveItem(cid, cfg.applebite, cfg.applebiteqnt)
doPlayerRemoveItem(cid, cfg.eggs, cfg.eggsqnt)
doPlayerAddItem(cid, cfg.reward1, cfg.reward1qnt)
selfSay(cfg.concluir)
else
selfSay(cfg.mensagem)
end
end 
return true
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())