function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Define efeito visual e tipo de disparo conforme forma do alvo
    local subName = getSubName(cid, target)
    local shooT, eff

    if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, subName) then
        shooT = 121
        eff   = 641
    elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, subName) then
        shooT = 171
        eff   = 979
    else
        shooT = 40
        eff   = 48
    end

    -- Disparo visual e dano elétrico com efeito correspondente
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), shooT)
    doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, eff)

    return true
end
