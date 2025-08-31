function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Projétil visual do caster até o alvo
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 15)

    -- Dano tipo POISON com efeito visual 8 e delay
    doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 8)

    return true
end