function existProfession(profName)
	cont = false
	for i = 1, #ProfessionId do
		if not cont then
			if ProfessionId[i].name == profName then
				cont = true
			end
		end
	end
	return cont
end

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
	if isInArray({"change", "Change", "profession", "Profession"}, msg) then
		if hasProfession(cid) then
			if canEnterInProfession(cid) then
				selfSay("So "..getProfessionName(cid)..", you want to become what profession?", cid)
				talkState[talkUser] = 1
			else
				selfSay("Only premium members can change the profession!", cid)
			end
		else
			selfSay("Sorry! You don't have a profession!", cid)
		end
	elseif talkState[talkUser] == 1 then
		profName = doCorrectString(msg)
		if existProfession(profName) then
			profId = getProfessionIdByName(profName)
			selfSay("Are you sure you want to be "..profName.."? It will cost ".. ProfessionLib.CostToChange .." "..getItemNameById(ProfessionLib.itemid).."!", cid)
			talkState[talkUser] = 2
		else
			selfSay("Sorry, this profession don't exist!", cid)
		end
	elseif talkState[talkUser] == 2 then
		if msgcontains(msg, "yes") then	
			if getPlayerItemCount(cid, ProfessionLib.itemid) >= ProfessionLib.CostToChange then
				selfSay("Congratulations! You are a "..profName.."!", cid)
				doChangeProfession(cid, profId, false)
				doSendMagicEffect(getThingPosition(cid), effect)
			else
				selfSay("You don't have the necessary items!", cid)
			end
		elseif msgcontains(msg, "no") then
			selfSay("Okay, Good bye!", cid)
			talkState[talkUser] = 0
		end
	end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())