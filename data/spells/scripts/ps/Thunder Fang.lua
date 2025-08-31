function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell      = spellData.spell
    local target     = spellData.target
    local min        = spellData.min
    local max        = spellData.max

    -- Efeito visual inicial no alvo
    doSendMagicEffect(getThingPosWithDebug(target), 146)

    -- Dano elétrico com efeito visual 48
    doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 48)

    -- Efeito adicional com delay
    addEvent(doSendMagicEffect, 100, PosTarget1, 410)

    return true
end
