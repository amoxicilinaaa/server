function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local posT1 = getThingPosWithDebug(target)

    -- Efeito visual na posição do alvo
    doSendMagicEffect(posT1, 478)

    -- Aplica dano tipo Ghost diretamente no alvo
    doDanoInTarget(cid, target, GHOSTDAMAGE, min, max, 0)

    return true
end
