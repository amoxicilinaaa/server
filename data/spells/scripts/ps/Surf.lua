function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max
    local pos   = getThingPosWithDebug(cid)

    -- Primeira onda de dano em área
    doMoveInArea2(cid, 246, doSurf1, WATERDAMAGE, 0, 0, spell)

    -- Explosão secundária com dano real após delay aleatório
    addEvent(doDanoWithProtect, math.random(100, 400), cid, WATERDAMAGE, pos, doSurf2, -min, -max, 0)

    return true
end
