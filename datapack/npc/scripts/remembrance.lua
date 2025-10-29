local tab = {
    pos = {x = 298, y = 955, z = 7}, -- posição x, y, z do local a teleportar o player
    item = {5943,10}, -- {itemID, count}
    price = 500
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                      npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
    if (not npcHandler:isFocused(cid)) then
        return false
    end
    
    local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
    if (msgcontains(msg, 'akatsuki')) then
        talkState[talkUser] = 1
        selfSay('tem certeza que quer entrar?', cid)
        selfSay('Lembre-se.. voce precisa de '..tab.item[2]..' '..getItemNameById(tab.item[1])..' e '..tab.price..' gold bar e level {600} para poder entrar diga {yes}.', cid)
    elseif (msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
        if (getPlayerItemCount(cid, tab.item[1]) >= tab.item[2] and doPlayerRemoveMoney(cid, tab.price * 10000)) then 
            doTeleportThing(cid, tab.pos)
             doPlayerRemoveItem(cid, tab.item[1], tab.item[2])
            doPlayerRemoveMoney(cid, tab.price * 10000)    
            doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
            selfSay('Boa Sorte!.', cid)
        else
            talkState[talkUser] = 0
            selfSay('Voce ainda nao tem os 10 coraçoes ou 500 gold bar, volte quando tiver.', cid)
        end
    elseif (msgcontains(msg, 'no') and talkState[talkUser] == 1) then
        talkState[talkUser] = 0
        selfSay('Okay, maybe another time.', cid)
    end
    
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())