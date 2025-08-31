function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local posC = spellData.posC

    -- Efeito visual no caster
    doSendMagicEffect(posC, 47)

    -- Ativa storage personalizado (pode representar buff, estado, etc.)
    setPlayerStorageValue(cid, 999457, 1)

    return true
end