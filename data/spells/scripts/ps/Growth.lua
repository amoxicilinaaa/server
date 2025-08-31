function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Verifica se a spell é "Growth"
    if spell == "Growth" then
        -- Exibe texto flutuante com cor 168
        doSendAnimatedText(getThingPosWithDebug(cid), "Growth", 168)

        -- Aplica efeito visual (ID 177)
        doSendMagicEffect(getThingPosWithDebug(cid), 177)
    end

    -- Ativa storage 253 (pode ser usado para controle de estado ou buff)
    setPlayerStorageValue(cid, 253, 1)

    return true
end