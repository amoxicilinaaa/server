function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local posC = spellData.posC

    -- Define efeito visual conforme a spell
    local eff = (spell == "Magic Coat") and 11 or 135

    -- Aplica efeito visual no caster
    doSendMagicEffect(posC, eff)

    -- Ativa storage de reflexão e controle
    setPlayerStorageValue(cid, storages.reflect, 2)
    setPlayerStorageValue(cid, 98654, 1)

    return true
end