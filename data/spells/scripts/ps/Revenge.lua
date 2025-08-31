function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local min    = spellData.min
    local max    = spellData.max
    local posC1  = {x = getThingPosWithDebug(cid).x + 1, y = getThingPosWithDebug(cid).y, z = getThingPosWithDebug(cid).z}

    -- Paralisa o caster temporariamente
    stopNow(cid, 700)
    doCreatureSetNoMove(cid, true)
    setPlayerStorageValue(cid, 32698, 1)
    addEvent(setPlayerStorageValue, 700, cid, 32698, -1)
    addEvent(doCreatureSetNoMove, 920, cid, false)

    -- Efeitos visuais sincronizados
    addEvent(doSendMagicEffect, 80, posC1, 92)
    addEvent(doSendMagicEffect, 400, posC1, 93)
    addEvent(doSendMagicEffect, 775, posC1, 573) -- soco
    addEvent(doSendMagicEffect, 1150, posC1, 94)
    addEvent(doSendMagicEffect, 1420, posC1, 95)

    -- Impactos tipo FIGHTING em área bomb
    local delays = {60, 380, 720, 1000, 1300}
    for _, t in ipairs(delays) do
        addEvent(doMoveInArea2, t, cid, 0, bomb, FIGHTINGDAMAGE, min, max, spell)
    end

    return true
end
