local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)	    end
function onCreatureDisappear(cid)	    npcHandler:onCreatureDisappear(cid)	    end
function onCreatureSay(cid, type, msg)	    npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()		    npcHandler:onThink()		    end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
	return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    
    if(msgcontains(msg, 'ticket')) then
	    if getPlayerMoney(cid) >= 500 then
		selfSay('You want to buy 1 travel ticket?, it cost 5 dollars', cid)
		talkState[talkUser] = 1
	    else
		selfSay('You don\'t have enough money, it cost 5 dollars.', cid)
	    end
    elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
	if doPlayerRemoveMoney(cid, 500) == TRUE then
                   setPlayerStorageValue(cid, 4590, 1)
	    selfSay('Here is your ticket, it can not be transfere, when you have used the ticket at the train, it can not be used again, go to the train to use it.', cid)
	end
    end
return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())