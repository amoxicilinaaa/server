local questConfig = {
    [1850] = {storage = 1850, minLevel = 30, exp = 4000, items = {[23418]=5}},
    [1851] = {storage = 1851, minLevel = 30, exp = 4000, items = {[2391]=25}},
    [1852] = {storage = 1852, minLevel = 30, exp = 4000, items = {[2391]=18}},
    [1853] = {storage = 1853, minLevel = 30, exp = 4000, items = {[2393]=15}},
    [1854] = {storage = 1854, minLevel = 30, exp = 4000, items = {[12344]=15, [2392]=15}},
    [1855] = {storage = 1855, minLevel = 30, exp = 4000, items = {[12344]=15, [2392]=15}},
    [1856] = {storage = 1856, minLevel = 30, exp = 4000, items = {[11453]=1}},
    [1857] = {storage = 1857, minLevel = 30, exp = 4000, items = {[12412]=1}},
    [1858] = {storage = 1858, minLevel = 30, exp = 4000, items = {[12412]=1}},
    [1859] = {storage = 1859, minLevel = 30, exp = 4000, items = {[12339]=1}},
    [1860] = {storage = 1860, minLevel = 30, exp = 4000, items = {[2392]=25, [12344]=15}},
    [1861] = {storage = 1861, minLevel = 30, exp = 4000, items = {[2393]=20, [2391]=30}},
    [1862] = {storage = 1862, minLevel = 30, exp = 4000, items = {[12339]=1}},
    [1863] = {storage = 1863, minLevel = 30, exp = 4000, items = {[12339]=1}},
    [1864] = {storage = 1864, minLevel = 30, exp = 4000, items = {[11443]=1}},
    [1865] = {storage = 1865, minLevel = 30, exp = 4000, items = {[2392]=15, [2393]=25}},
    [1866] = {storage = 1866, minLevel = 20, exp = 4000, items = {[12346]=15, [2393]=20}},
    [1867] = {storage = 1867, minLevel = 20, exp = 4000, items = {[12344]=25, [2392]=30}},
    [1868] = {storage = 1868, minLevel = 20, exp = 4000, items = {[12348]=30, [2391]=25}},
    [1869] = {storage = 1869, minLevel = 20, exp = 4000, items = {[12349]=10, [12346]=10, [2393]=25}},
    [1870] = {storage = 1870, minLevel = 20, exp = 4000, items = {[12344]=5, [2393]=15}},
    [1871] = {storage = 1871, minLevel = 20, exp = 4000, items = {[25208]=1}},
    [1872] = {storage = 1872, minLevel = 20, exp = 4000, items = {[11444]=1}},
    [28010] = {storage = 28010, maxLevel = 50, exp = 4000, items = {[11445]=1}},
    [28011] = {storage = 28011, minLevel = 30, exp = 4000, items = {[11443]=1}, effect = 586},
    [21014] = {storage = 21014, minLevel = 25, exp = 4000, items = {[11445]=1}, effect = 586},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local config = questConfig[item.uid]
    if not config then
        sendMsgToPlayer(cid, 22, "Este baú não possui recompensa configurada.")
        return true
    end

    local playerLevel = getPlayerLevel(cid)
    if config.maxLevel and playerLevel > config.maxLevel then
        sendMsgToPlayer(cid, 22, "Você não tem level suficiente para descobrir o que tem aqui.")
        return true
    end
    if config.minLevel and playerLevel < config.minLevel then
        sendMsgToPlayer(cid, 22, "Você não tem level suficiente para descobrir o que tem aqui ("..config.minLevel..").")
        return true
    end

    if getPlayerStorageValue(cid, config.storage) >= 1 then
        sendMsgToPlayer(cid, 22, "Você já pegou o que tinha aqui.")
        return true
    end

    for itemid, count in pairs(config.items) do
        local newItem = doCreateItemEx(itemid, count)
        doPlayerAddItemEx(cid, newItem)
    end
    if config.exp then
        doPlayerAddExperience(cid, config.exp)
    end
    if config.effect then
        doSendMagicEffect(getPlayerPosition(cid), config.effect)
    else
        doSendMagicEffect(getCreaturePosition(cid), 28)
        doSendMagicEffect(getCreaturePosition(cid), 27)
    end
    setPlayerStorageValue(cid, config.storage, 1)
    sendMsgToPlayer(cid, 22, "Parabéns! Você recebeu sua recompensa.")
    return true
end