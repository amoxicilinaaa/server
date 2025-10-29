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
	if isInArray({"Help", "Stylist"}, doCorrectString(msg)) then
		if getPlayerProfessionId(cid) == 1 then
			itemsName = {}
			for i = 1, #SellStylist do
				if getPlayerLevel(cid) >= SellAdventurer[i].level then
					table.insert(itemsName, i, "{"..doCorrectString(getItemNameById(SellStylist[i].id)).."}")
				end
			end
			selfSay("Eu posso te ajudar a fazer ".. doConcatTable(itemsName, ", ", " ou ") ..".", cid)
			talkState[talkUser] = 1
		else
			selfSay("Você não é estilista!", cid)
		end
	elseif talkState[talkUser] == 1 then
		mesg = "{"..doCorrectString(msg).."}"
		if isInArray(itemsName, mesg) then
			itemid = getItemIdByName(msg)
			id = 0
			for i = 1, #SellStylist do
				if itemid == SellStylist[i].id then
					id = i
				end
			end	
			if SellStylist[id] then
				tab = SellStylist[id]
				if getPlayerLevel(cid) >= tab.level then
					itemsToDo = {}
					for _, t in ipairs(tab.toDo) do
						table.insert(itemsToDo, t[2].."x "..getItemNameById(t[1]))
					end
					talkState[talkUser] = 2
					selfSay("Você precisa de ".. doConcatTable(itemsToDo, ", ", " e ")..", para fazer "..tab.quant.."x "..doCorrectString(msg).."!", cid)
				end
			end
		end
	elseif talkState[talkUser] == 2 then
		if isInArray({"yes", "sim", "si"}, msg) then
			cont = true
			for _, t in ipairs(tab.toDo) do
				if getPlayerItemCount(cid, t[1]) < t[2] then
					cont = false
				end
			end
			if cont then
				for _, t in ipairs(tab.toDo) do
					doPlayerRemoveItem(cid, t[1], t[2])
				end
				doPlayerAddItem(cid, tab.id, tab.quant, false)
				selfSay("Pronto, pegue aqui seu(s) item(s)!", cid)
			else
				selfSay("Você não tem os items nescessários.", cid)
			end
		elseif isInArray({"no", "nao", "não"}, msg) then
			selfSay("Ok, adeus.", cid)
		end
	else
		selfSay("Eu não sei fazer isso!", cid)
	end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())