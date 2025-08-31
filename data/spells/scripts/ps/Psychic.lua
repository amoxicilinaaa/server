function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    local PosCid1 = getThingPosWithDebug(cid)

    -- Efeito visual inicial quase instantâneo
    addEvent(doSendMagicEffect, 1, PosCid1, 397)

    -- Dano tipo PSY em área com efeito visual 429
    addEvent(doDanoWithProtect, 110, cid, psyDmg, PosCid1, selfArea2, min, max, 429)

    return true
end