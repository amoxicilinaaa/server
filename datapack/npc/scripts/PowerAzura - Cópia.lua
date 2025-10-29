local cfg = {
	watergem = 14036,
	watergemqnt = 71,	
	batwing = 14037,
	batwingqnt = 65,	
	applebite = 14038,
	applebiteqnt = 68,	
	eggs = 14039,
	eggsqnt = 75,
	reward2 = 6569,
	reward2qnt = 1,
	palavra = "power",
	mensagem = "Você precisa ter os cristais e quantidade corretos.",
	concluir = "Obrigado pelos cristais! Agora você pode passar. Aproveite e pegue esse doce raro!"
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
if getPlayerItemCount(cid, cfg.watergem) >= 71 and getPlayerItemCount(cid, cfg.batwing) >= 65 and getPlayerItemCount(cid, cfg.applebite) >= 68 and getPlayerItemCount(cid, cfg.eggs) >= 75 then
doPlayerRemoveItem(cid, cfg.watergem, cfg.watergemqnt)
doPlayerRemoveItem(cid, cfg.batwing, cfg.batwingqnt)
doPlayerRemoveItem(cid, cfg.applebite, cfg.applebiteqnt)
doPlayerRemoveItem(cid, cfg.eggs, cfg.eggsqnt)
doPlayerAddItem(cid, cfg.reward2, cfg.reward2qnt)
pos = {x=1038, y=1027, z=8}
doTeleportThing(cid,pos)
doSendMagicEffect(getCreaturePosition(cid),21)
selfSay(cfg.concluir)
else
selfSay(cfg.mensagem)
end
end 
return true
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())