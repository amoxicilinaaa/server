local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)
    npcHandler:onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
    npcHandler:onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)
    npcHandler:onCreatureSay(cid, type, msg)
end

function onThink()
    npcHandler:onThink()
end

function creatureSayCallback(cid, type, msg)
    if (not npcHandler:isFocused(cid)) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    msg = string.lower(msg)

    local need = {
        {id = 12148, qt = 100}, -- Gyarados Tail
        {id = 12161, qt = 250}, -- Water Gem
        {id = 12283, qt = 50} -- Water Orb
    }

    local stoFinish = 150000

    local str = ""
    for i = 1, #need do
        if i > 1 and i < #need then
            str = str .. ", "
        elseif i == #need then
            str = str .. " e "
        end

        str = str .. getItemNameById(need[i].id)
    end

    if msgcontains(msg, 'hi') then
        if getPlayerStorageValue(cid, stoFinish) >= 1 then
            selfSay("Desculpe, Bravo Aventureiro, você já completou essa missão.", cid)
            talkState[talkUser] = 0
            return false
        end

        selfSay("Olá, Bravo Aventureiro! Poderia trazer para mim: " .. str .. "? Eu irei recompensá-lo generosamente!", cid)
        talkState[talkUser] = 1
        return true
    elseif msgcontains(msg, 'ajuda') or msgcontains(msg, 'help') then
        if getPlayerStorageValue(cid, stoFinish) >= 1 then
            selfSay("Desculpe, Bravo Aventureiro, você já completou essa missão.", cid)
            talkState[talkUser] = 0
            return false
        end

        selfSay("Olá, Bravo Aventureiro! Poderia trazer para mim: " .. str .. "? Eu irei recompensá-lo generosamente!", cid)
        talkState[talkUser] = 1
        return true
    elseif msgcontains(msg, 'sim') and talkState[talkUser] == 1 then
        if getPlayerStorageValue(cid, stoFinish) >= 1 then
            selfSay("Desculpe, Bravo Aventureiro, você já completou essa missão.", cid)
            talkState[talkUser] = 0
            return true
        end

        local hasAllItems = true

        for i = 1, #need do
            if getPlayerItemCount(cid, need[i].id) < need[i].qt then
                hasAllItems = false
                break
            end
        end

        if hasAllItems then
            for i = 1, #need do
                doPlayerRemoveItem(cid, need[i].id, need[i].qt)
            end

            selfSay("Muito obrigado, Bravo Aventureiro! Aqui está a sua recompensa.", cid)
            -- Adicione aqui as recompensas para o jogador

            setPlayerStorageValue(cid, stoFinish, 1)
            talkState[talkUser] = 0
            return true
        else
            selfSay("Parece que você não trouxe todos os itens que pedi, Bravo Aventureiro.", cid)
            selfSay("Lembre-se, você precisa trazer: " .. need[1].qt .. " " .. getItemNameById(need[1].id) .. ", " .. need[2].qt .. " " .. getItemNameById(need[2].id) .. " e " .. need[3].qt .. " " .. getItemNameById(need[3].id) .. ".", cid)
            return true
        end
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
