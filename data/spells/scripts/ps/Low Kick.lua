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

    -- Projétil visual do caster até o alvo (ID 39)
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)

    -- Aplica dano tipo FIGHTING com efeito visual 113
    doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 113)

    return true
end