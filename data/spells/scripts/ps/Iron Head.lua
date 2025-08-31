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

    -- Projétil visual (ID 39) do caster até o alvo
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)

    -- Aplica dano tipo STEEL com efeito visual 77
    doDanoInTargetWithDelay(cid, target, STEELDAMAGE, -min, -max, 77)

    return true
end