local questRewards = {
    -- UID = {storage, minLevel, {itemid, count}, ...}
    [1013] = {storage = 190922, minLevel = 150, rewards = {{id = 11445, count = 25}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [3547] = {storage = 3547, minLevel = 0, rewards = {{id = 11445, count = 1}}, exp = 12000},
    [3546] = {storage = 3546, minLevel = 0, rewards = {{id = 11445, count = 3}}, exp = 8000},
    [1023] = {storage = 190932, minLevel = 150, rewards = {{id = 11444, count = 35}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [3545] = {storage = 3545, minLevel = 0, rewards = {{id = 11446, count = 2}, {id = 2152, count = 80}}, exp = 10000},
    [2038] = {storage = 190965, minLevel = 150, rewards = {{id = 11452, count = 30}, {id = 207, count = 1}}},
    [1022] = {storage = 190932, minLevel = 150, rewards = {{id = 11452, count = 25}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [30003] = {storage = 30003, minLevel = 0, rewards = {}, outfit = {id = 1163, addon = 3}},
    [2034] = {storage = 190964, minLevel = 150, rewards = {{id = 11451, count = 15}, {id = 210, count = 1}, {id = 11445, count = 10}}},
    [1011] = {storage = 190920, minLevel = 150, rewards = {{id = 11453, count = 30}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [1009] = {storage = 190919, minLevel = 150, rewards = {{id = 11441, count = 25}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [1010] = {storage = 190918, minLevel = 150, rewards = {{id = 11448, count = 25}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [2033] = {storage = 190963, minLevel = 150, rewards = {{id = 11450, count = 15}, {id = 204, count = 1}, {id = 11443, count = 15}}},
    [1030] = {storage = 190923, minLevel = 150, rewards = {{id = 2160, count = 100}, {id = 12618, count = 15}}},
    [6452] = {storage = 6452, minLevel = 0, rewards = {}, exp = 50000000},
    [2032] = {storage = 190962, minLevel = 150, rewards = {{id = 11448, count = 15}, {id = 212, count = 1}, {id = 11441, count = 15}}},
    [3543] = {storage = 3543, minLevel = 0, rewards = {{id = 2152, count = 50}, {id = 2392, count = 50}, {id = 12346, count = 30}}, exp = 1000},
    [3549] = {storage = 3549, minLevel = 0, rewards = {{id = 2152, count = 20}}, exp = 10000},
    [2031] = {storage = 190961, minLevel = 150, rewards = {{id = 11453, count = 15}, {id = 208, count = 1}, {id = 11446, count = 15}}},
    [1016] = {storage = 190925, minLevel = 150, rewards = {{id = 11449, count = 25}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [1015] = {storage = 190924, minLevel = 150, rewards = {{id = 11453, count = 25}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [1017] = {storage = 190926, minLevel = 150, rewards = {{id = 11446, count = 25}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [3539] = {storage = 190927, minLevel = 150, rewards = {{id = 11451, count = 25}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [1004] = {storage = 190913, minLevel = 40, rewards = {{id = 11452, count = 5}}},
    [3542] = {storage = 3542, minLevel = 0, rewards = {{id = 11445, count = 5}, {id = 11449, count = 1}, {id = 2160, count = 1}}, exp = 100000},
    [2035] = {storage = 190968, minLevel = 150, rewards = {{id = 11453, count = 15}, {id = 205, count = 1}, {id = 11449, count = 15}}},
    [3550] = {storage = 3550, minLevel = 0, rewards = {{id = 11449, count = 1}}, exp = 30000},
    [1008] = {storage = 190917, minLevel = 150, rewards = {{id = 11450, count = 25}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [1007] = {storage = 190916, minLevel = 150, rewards = {{id = 11443, count = 25}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [3551] = {storage = 3551, minLevel = 0, rewards = {{id = 11443, count = 5}, {id = 2160, count = 20}, {id = 11641, count = 1}}, exp = 8000},
    [1006] = {storage = 190915, minLevel = 80, rewards = {{id = 11447, count = 1}, {id = 2160, count = 10}}},
    [2037] = {storage = 190967, minLevel = 150, rewards = {{id = 11444, count = 30}, {id = 206, count = 1}}},
    [1021] = {storage = 190930, minLevel = 150, rewards = {{id = 11454, count = 25}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [1020] = {storage = 190929, minLevel = 150, rewards = {{id = 11442, count = 25}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [2036] = {storage = 190966, minLevel = 150, rewards = {{id = 11454, count = 15}, {id = 203, count = 1}, {id = 11442, count = 15}}},
    [1014] = {storage = 190923, minLevel = 150, rewards = {{id = 11451, count = 25}, {id = 12618, count = 5}, {id = 2160, count = 10}}},
    [1001] = {storage = 3552, minLevel = 0, rewards = {{id = 11441, count = 2}, {id = 2152, count = 50}}, exp = 10000},
    [1002] = {storage = 3552, minLevel = 0, rewards = {{id = 11442, count = 2}, {id = 2152, count = 50}}, exp = 10000},
    [1003] = {storage = 3552, minLevel = 0, rewards = {{id = 11447, count = 2}, {id = 2152, count = 50}}, exp = 10000},
    [2030] = {storage = 190960, minLevel = 150, rewards = {{id = 11447, count = 30}, {id = 11447, count = 5}}},
}

function onUse(cid, item, frompos, item2, topos)
    local config = questRewards[item.uid]
    if not config then
        doPlayerSendTextMessage(cid, 22, "Este baú não possui recompensa configurada.")
        return true
    end

    if getPlayerLevel(cid) < config.minLevel then
        doPlayerSendCancel(cid, "Você precisa de level " .. config.minLevel .. ".")
        return true
    end

    local queststatus = getPlayerStorageValue(cid, config.storage)
    if queststatus == 1 then
        doPlayerSendTextMessage(cid, 22, "Ta vazio.")
        return true
    end

    for _, reward in ipairs(config.rewards) do
        doPlayerAddItem(cid, reward.id, reward.count)
    end
    if config.exp then
        doPlayerAddExperience(cid, config.exp)
    end
    if config.outfit then
        doPlayerAddOutfit(cid, config.outfit.id, config.outfit.addon)
    end
    setPlayerStorageValue(cid, config.storage, 1)
    doPlayerSendTextMessage(cid, 22, "Parabéns! Você recebeu sua recompensa.")
    return true
end