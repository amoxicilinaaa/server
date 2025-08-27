function onUse(cid, item, fromPosition, itemEx, toPosition)
    local STORAGE_KEY = 1865
    local REQUIRED_LEVEL = 30
    local EXPERIENCE_REWARD = 4000

    local rewardItems = {
        [2392] = 15,
        [2393] = 25
    }

    if getPlayerLevel(cid) < REQUIRED_LEVEL then
        sendMsgToPlayer(cid, 22, "Você precisa atingir o nível " .. REQUIRED_LEVEL .. " para desvendar os segredos deste baú.")
        return true
    end

    if getPlayerStorageValue(cid, STORAGE_KEY) >= 1 then
        sendMsgToPlayer(cid, 22, "Você já saqueou este baú. Não há mais nada aqui para você.")
        return true
    end

    local itemListText = "Você recebeu:\n"

    for itemId, quantity in pairs(rewardItems) do
        local reward = doCreateItemEx(itemId, quantity)
        doPlayerAddItemEx(cid, reward)

        local itemName = getItemNameById(itemId)
        itemListText = itemListText .. "- " .. quantity .. "x " .. itemName .. "\n"
    end

    doPlayerAddExperience(cid, EXPERIENCE_REWARD)
    local pos = getCreaturePosition(cid)
    doSendMagicEffect(pos, CONST_ME_FIREWORK_YELLOW)
    doSendMagicEffect(pos, CONST_ME_FIREWORK_RED)

    setPlayerStorageValue(cid, STORAGE_KEY, 1)

    itemListText = itemListText .. "\nE ganhou " .. EXPERIENCE_REWARD .. " de experiência!"
    sendMsgToPlayer(cid, 22, itemListText)

    return true
end