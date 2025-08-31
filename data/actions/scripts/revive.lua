local storage = 121212 -- Storage da quest
local store = 54178    -- Storage que salva o delay
local delay = 4        -- Tempo em segundos de delay

function onUse(cid, item, frompos, item2, topos)
    local now = os.time()
    local reviveDelay = getPlayerStorageValue(cid, store)
    local questLimit = getPlayerStorageValue(cid, storage)

    if reviveDelay - now > 0 then
        local waitTime = reviveDelay - now
        doPlayerSendCancel(cid, "Você tem que esperar " .. waitTime .. " segundo(s) para usar novamente.")
        doSendMagicEffect(getPlayerPosition(cid), 2)
        return true
    end

    if questLimit == 0 then
        doPlayerSendCancel(cid, "Você já usou o limite de revives para esta missão.")
        return true
    end

    if getPlayerStorageValue(cid, 990) >= 1 then
        doPlayerSendCancel(cid, "Você não pode usar revive durante batalhas de ginásio.")
        return true
    end

    if getPlayerStorageValue(cid, 84929) >= 1 then
        doPlayerSendCancel(cid, "Você não pode usar revive durante o torneio pvp.")
        return true
    end

    if isPlayer(item2.uid) then
        doPlayerSendCancel(cid, "Por favor, use revive apenas em pokeballs.")
        return true
    end

    local btype = getPokeballType(item2.itemid)
    local ball = pokeballs[btype]

    if not ball then
        doPlayerSendCancel(cid, "Por favor, use reviver apenas em pokeballs.")
        return true
    end

    if item2.itemid == ball.use then
        doPlayerSendCancel(cid, "Por favor, volte seu pokemon para usar o revive.")
        return true
    end

    local slotItem = getPlayerSlotItem(cid, 8)
    if slotItem.uid == 0 then
        doPlayerSendCancel(cid, "Por favor, coloque um pokémon no slot principal.")
        return true
    end
    if getPlayerLevel(cid) > 150 and getPlayerGroupId(cid) ~= 6 then
        if item2.itemid == ball.on then
            doPlayerSendCancel(cid, "Seu pokémon está vivo, e não precisa ser revivido.")
            return true
        end
    end

    if item2.itemid ~= ball.use then
        doTransformItem(item2.uid, ball.on)
        doSetItemAttribute(item2.uid, "hp", 1)

        for c = 1, 15 do
            setCD(item2.uid, "move" .. c, 0)
        end

        setCD(item2.uid, "control", 0)
        setCD(item2.uid, "blink", 0)

        doSendMagicEffect(getThingPos(cid), 12)
        doSendAnimatedText(getThingPos(cid), "REVIVE!", COLOR_LIGHTBLUE)
        doRemoveItem(item.uid, 1)

        doCureBallStatus(slotItem.uid, "all")
        doCureStatus(cid, "all", true)
        cleanBuffs2(item2.uid)

        setPlayerStorageValue(cid, store, now + delay)

        if questLimit > 0 then
            setPlayerStorageValue(cid, storage, questLimit - 1)
        end
        if #getCreatureSummons(cid) >= 1 then
            local order = getItemAttribute(slotItem.uid, "ballorder") or 0
            doPlayerSendCancel(cid, "KGT," .. order .. "|0")
            doPlayerSendCancel(cid, "")
        end
        return true
    end
    return true
end