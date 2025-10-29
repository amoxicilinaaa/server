local profId = 1
local profName = "stylist"
local effect = 30

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
	if isInArray({profName, doCorrectString(profName)}, msg) then
		if hasProfession(cid) then
			if getPlayerProfessionId(cid) == profId then
				selfSay("You is a "..profName.."!", cid)
			else
				selfSay("You can't be "..profName.."!", cid)
			end
		else
			if not canEnterInProfession(cid) then
				selfSay("Only premium members can be a "..profName.."!", cid)
			else
				selfSay("So, You are sure you want be a "..profName.."?", cid)
				talkState[talkUser] = 1
			end
		end
	elseif talkState[talkUser] == 1 then
		if msgcontains(msg, "yes") then
			selfSay("Congratulations! You are a "..profName.."!", cid)
			doChangeProfession(cid, profId, false)
			doSendMagicEffect(getThingPosition(cid), effect)
		elseif msgcontains(msg, "no") then
			selfSay("Okay, Good bye!", cid)
			talkState[talkUser] = 0
		end
	end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())