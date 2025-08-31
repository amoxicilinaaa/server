function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    -- Evita repetição se já estiver ativo
    if getPlayerStorageValue(cid, 253) >= 1 then
        return true
    end

    -- Ativa storage de controle
    setPlayerStorageValue(cid, 253, 1)

    -- Efeito visual e texto animado
    local pos = getThingPosWithDebug(cid)
    doSendMagicEffect(pos, 207)
    doSendAnimatedText(pos, "FOCUS", 144)

    return true
end
