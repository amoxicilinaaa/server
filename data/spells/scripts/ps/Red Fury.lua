function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local posT1 = getThingPosWithDebug(target)

    -- Efeito visual na posição do alvo
    doSendMagicEffect(posT1, 483)

    -- Dano tipo BUG com delay e sem efeito adicional
    doDanoInTargetWithDelay(cid, target, BUGDAMAGE, min, max, 0)

    return true
end