function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posC = spellData.posC
    local posT = spellData.posT
    local posC1 = spellData.posC1
    local posT1 = spellData.posT1

    -- Dano inicial tipo ICE com efeito visual 146
    doTargetCombatHealth(cid, target, ICEDAMAGE, 0, 0, 146)

    -- Dano adicional com delay e efeito visual 17
    addEvent(doDanoWithProtect, 250, cid, ICEDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 17)

    -- Efeito visual especial no alvo (ID 386)
    addEvent(doSendMagicEffect, 110, posT1, 386)

    return true
end