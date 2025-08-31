function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Projétil visual do caster até o alvo
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 3)

    -- Dano tipo PSY com efeito visual 250 e delay
    doDanoInTargetWithDelay(cid, target, psyDmg, min, max, 250)

    return true
end