function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Disparo visual inicial
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 18)

    -- Função que aplica dano com delay e verifica status
    local function doDamageWithDelay(cid, target)
        if not isCreature(cid) or not isCreature(target) then return true end
        if isSleeping(cid) then return false end
        if getPlayerStorageValue(cid, conds["Fear"]) >= 1 then return true end

        -- Aplica dano tipo Ghost
        doAreaCombatHealth(cid, ghostDmg, getThingPosWithDebug(target), 0, -min, -max, 255)

        -- Efeito visual adicional ao lado do alvo
        local pos = getThingPosWithDebug(target)
        pos.x = pos.x + 1
        addEvent(doSendMagicEffect, 50, pos, 140)
    end

    -- Executa dano com delay
    addEvent(doDamageWithDelay, 100, cid, target)

    return true
end