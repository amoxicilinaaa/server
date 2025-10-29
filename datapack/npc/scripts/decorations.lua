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
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local shopWindow = {}
local moeda = 9020 -- [iD DA MOEDA]
local t = {
	  [14065] = {price = 15},
	  [14056] = {price = 20}, 
	  [14057] = {price = 15}, 
	  [14058] = {price = 15}, 
	  [14059] = {price = 22}, 
	  [14060] = {price = 10}, 
	  [14045] = {price = 13}, 
	  [14114] = {price = 25}, 
	  [14143] = {price = 25}, 	 
	  }
local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
	if  t[item] and not doPlayerRemoveItem(cid, moeda, t[item].price) then
		  selfSay("você não tem "..t[item].price.." "..getItemNameById(moeda), cid)
			 else
		doPlayerAddItem(cid, item)
		selfSay("Aqui está seu item!", cid)
	   end
	return true
end
if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
			for var, ret in pairs(t) do
					table.insert(shopWindow, {id = var, subType = 0, buy = ret.price, sell = 0, name = getItemNameById(var)})
				end
			openShopWindow(cid, shopWindow, onBuy, onSell)
		end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())