function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Disparo visual do projétil elétrico
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)

    -- Define efeito visual conforme forma do alvo
    local subName = getSubName(cid, target)
    local posT1   = PosTarget1 or getThingPosWithDebug(target)

    if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, subName) then
        doSendMagicEffect(posT1, 709)
        doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 641)

    elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, subName) then
        doSendMagicEffect(posT1, 976)
        doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 979)

    else
        doSendMagicEffect(posT1, 626)
        doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 48)
    end

    return true
end
