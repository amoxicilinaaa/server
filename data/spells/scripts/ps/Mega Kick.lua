function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Projétil visual do caster até o alvo
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)

    -- Define efeitos visuais por espécie
    local subName = getSubName(cid, target)
    if isInArray({"Elite Hitmonlee", "Shiny Hitmonlee"}, subName) then
        addEvent(doDanoInTargetWithDelay, 25, cid, target, FIGHTINGDAMAGE, 0, 0, 651)
        doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 495)

    elseif isInArray({"Hitmonlee"}, subName) then
        addEvent(doDanoInTargetWithDelay, 25, cid, target, FIGHTINGDAMAGE, 0, 0, 652)
        doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 495)

    else
        doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, 0, 0, 113)
        doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 495)
    end

    return true
end