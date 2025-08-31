function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local posC = spellData.posC

    -- Define efeito visual conforme a spell
    local eff
    if spell == "Magic Coat" then
        eff = 616 -- alternativa: 617
    elseif spell == "Reflect" then
        eff = 399 -- alternativa: 135
    else
        eff = 135 -- efeito padrão
    end

    -- Aplica efeito visual no caster
    doSendMagicEffect(posC, eff)

    -- Ativa proteção via storage
    setPlayerStorageValue(cid, 21099, 1)

    return true
end