function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max
    local pos   = getThingPosWithDebug(cid)

    -- Impacto visual inicial em área
    doMoveInArea2(cid, 91, inferno1, FIREDAMAGE, 0, 0, spell)

    -- Dano real em área com delay aleatório
    addEvent(doDanoWithProtect, math.random(100, 400), cid, FIREDAMAGE, pos, inferno2, -min, -max, 0)

    return true
end
