dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Efeito inicial de preparação
    sendEffWithProtect(cid, getThingPosWithDebug(cid), 211)

    -- Função que executa o ataque com teleporte e dano
    local function doSkyUpper(cid, target)
        if not isCreature(cid) or not isCreature(target) then return false end

        local targetPos = getThingPosWithDebug(target)
        local teleportPos = getClosestFreeTile(cid, targetPos)
        local finalPos = getPosByDir(teleportPos, math.random(0, 12))

        doTeleportThing(cid, finalPos, false)
        doSendDistanceShoot(getThingPosWithDebug(cid), targetPos, 5)
        doDanoInTargetWithDelay(cid, target, DRAGONDAMAGE, min, max, 141)

        return true
    end

    -- Sequência de eventos com efeitos e ataques escalonados
    local timings = {
        {200, doSkyUpper},
        {300, sendEffWithProtect},
        {500, doSkyUpper},
        {700, sendEffWithProtect},
        {1000, doSkyUpper},
        {1050, sendEffWithProtect},
        {1400, doSkyUpper}
    }

    for _, event in ipairs(timings) do
        local delay, func = unpack(event)
        if func == doSkyUpper then
            addEvent(func, delay, cid, target)
        else
            addEvent(func, delay, cid, getThingPosWithDebug(cid), 211)
        end
    end

    return true
end