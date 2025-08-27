function onUse(cid, item, frompos, item2, topos)
    local UID_DO_BAU = 65030
    local STORAGE_KEY = 65030
    local COOLDOWN_HOURS = 20
    local COOLDOWN_SECONDS = COOLDOWN_HOURS * 3600

    local premios = {
        {reward = {17635}, countMin = {1}, countMax = {1}},     -- Shiny Gengar Amulet
        {reward = {2152}, countMin = {20}, countMax = {75}},    -- Dinheiro
        {reward = {2828}, countMin = {50}, countMax = {50}},    -- Premier Ball
        {reward = {2145}, countMin = {1}, countMax = {1}},      -- Diamond
        {reward = {12401}, countMin = {1}, countMax = {1}},     -- Shiny Stone
        {reward = {12618}, countMin = {1}, countMax = {3}}      -- Boost Stone
    }

    if item.uid ~= UID_DO_BAU then
        return true
    end

    local currentTime = os.time()
    local lastUse = tonumber(getPlayerStorageValue(cid, STORAGE_KEY))

    if lastUse and lastUse > 0 and currentTime - lastUse < COOLDOWN_SECONDS then
        local remaining = COOLDOWN_SECONDS - (currentTime - lastUse)

        local daysLeft = math.floor(remaining / 86400)
        local hoursLeft = math.floor((remaining % 86400) / 3600)
        local minutesLeft = math.floor((remaining % 3600) / 60)
        local secondsLeft = remaining % 60

        local msg = "O baú está vazio. Você poderá reivindicar seu prêmio novamente em "
        if daysLeft > 0 then
            msg = msg .. daysLeft .. " dia(s), "
        end
        msg = msg .. string.format("%02d:%02d:%02d (horas:minutos:segundos)", hoursLeft, minutesLeft, secondsLeft)

        doPlayerSendTextMessage(cid, 22, msg)
        return true
    end

    local premioIndex = math.random(#premios)
    local premio = premios[premioIndex]

    for i = 1, #premio.reward do
        local itemId = premio.reward[i]
        local quantidade = math.random(premio.countMin[i], premio.countMax[i])
        doPlayerAddItem(cid, itemId, quantidade)
    end

    doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
    setPlayerStorageValue(cid, STORAGE_KEY, currentTime)

    doPlayerSendTextMessage(cid, 22, "Parabéns! Você completou a dungeon e recebeu sua recompensa. Volte após " .. COOLDOWN_HOURS .. " horas para tentar novamente.")
    return true
end