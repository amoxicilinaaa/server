local rewardsConfig = {
    [2221] = {storage = 2221, rewards = {{id = 11454, count = 1}}},
    [2222] = {storage = 2222, rewards = {{id = 11449, count = 1}}},
    [2223] = {storage = 2223, rewards = {{id = 11444, count = 1}}},
    [2224] = {storage = 2224, rewards = {{id = 11451, count = 1}}},
    [2225] = {storage = 2225, rewards = {{id = 11450, count = 1}}},
    [2226] = {storage = 2226, rewards = {{id = 11442, count = 1}}},
    [2227] = {storage = 2227, rewards = {{id = 11443, count = 1}}},
    [2228] = {storage = 2228, rewards = {{id = 11448, count = 1}}},
    [2229] = {storage = 2229, rewards = {{id = 11442, count = 1}}},
    [2230] = {storage = 2230, rewards = {{id = 11451, count = 1}}},
    [2231] = {storage = 2231, rewards = {{id = 11446, count = 1}}},
    [2232] = {storage = 2232, rewards = {{id = 11452, count = 1}}},
    [2233] = {storage = 2233, rewards = {{id = 11453, count = 1}}},
    [2234] = {storage = 2234, rewards = {{id = 12232, count = 1}}},
    [2235] = {storage = 2235, rewards = {{id = 11448, count = 1}}},
    [2236] = {storage = 2236, rewards = {{id = 11443, count = 3}, {id = 11640, count = 1}, {id = 2392, count = 50}}, extraStorage = 201910},
    [2237] = {storage = 2237, rewards = {{id = 11447, count = 1}}},
    [2238] = {storage = 2238, rewards = {{id = 11442, count = 3}}, exp = 10000},
    [2239] = {storage = 2239, rewards = {{id = 11450, count = 1}}},
    [2240] = {storage = 2240, rewards = {{id = 17629, count = 1}}},
    [2241] = {storage = 2241, rewards = {{id = 17871, count = 1}}},
    [2242] = {storage = 2242, rewards = {{id = 2828, count = 80}}},
    [2243] = {storage = 2243, rewards = {{id = 12401, count = 1}}},
}

function onUse(cid, item, frompos, item2, topos)
    local config = rewardsConfig[item.uid]
    if not config then
        doPlayerSendTextMessage(cid, 22, "Este baú não possui recompensa configurada.")
        return true
    end

    local queststatus = getPlayerStorageValue(cid, config.storage)
    if queststatus == -1 then
        for _, reward in ipairs(config.rewards) do
            doPlayerAddItem(cid, reward.id, reward.count)
        end
        if config.exp then
            doPlayerAddExperience(cid, config.exp)
        end
        if config.extraStorage then
            setPlayerStorageValue(cid, config.extraStorage, 1)
        end
        doPlayerSendTextMessage(cid, 22, "Parabéns! Você recebeu sua recompensa.")
        setPlayerStorageValue(cid, config.storage, 1)
    else
        doPlayerSendTextMessage(cid, 22, "Ta vazio.")
    end
    return true
end