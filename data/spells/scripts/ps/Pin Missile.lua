function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    -- Execução de múltiplos impactos tipo BUG com efeitos visuais 13 e 7
    doMoveInAreaMulti(cid, 13, 7, bullet, bulletDano, BUGDAMAGE, min, max)

    -- Dano adicional tipo POISON em área com delay
    addEvent(doDanoWithProtect, 150, cid, POISONDAMAGE, getThingPosWithDebug(cid), grassarea, -min, -max, 0)

    return true
end