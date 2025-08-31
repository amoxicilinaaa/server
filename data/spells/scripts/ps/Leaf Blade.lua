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

    -- PosiÃ§Ã£o de impacto visual
    local a = getThingPosWithDebug(target)
    local posi = {x = a.x + 1, y = a.y + 1, z = a.z}

    -- ProjÃ©til visual (ID 39) do caster atÃ© o alvo
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)

    -- Efeito visual no ponto de impacto (ID 240)
    addEvent(doSendMagicEffect, 200, posi, 240)

    -- Aplica dano tipo GRASS com referÃªncia Ã  LeafBlade
    doDanoWithProtectWithDelay(cid, target, GRASSDAMAGE, -min, -max, 0, LeafBlade)

    return true
end