function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local PosCid1 = spellData.posC1 or getThingPosWithDebug(cid)

    -- Efeitos visuais e texto flutuante por tipo de buff
    if spell == "Charge" then
        doSendAnimatedText(getThingPosWithDebug(cid), "CHARGE", 168)
        doSendMagicEffect(getThingPosWithDebug(cid), 177)

    elseif spell == "Swords Dance" then
        doSendMagicEffect(PosCid1, 408) -- efeito especial da dança de espadas

    elseif spell == "Bulk Up" then
        doSendMagicEffect(getThingPosWithDebug(cid), 91) -- efeito de fortalecimento físico

    else
        doSendAnimatedText(getThingPosWithDebug(cid), "FOCUS", 144)
        doSendMagicEffect(getThingPosWithDebug(cid), 132) -- efeito padrão de concentração
    end

    -- Ativa storage que pode ser usado para controle de estado
    setPlayerStorageValue(cid, 253, 1)

    --[[ 💡 Sugestão opcional: aplicar efeitos adicionais por buff
    if spell == "Swords Dance" then
        -- Dobra o dano físico por 15 segundos
        setPlayerStorageValue(cid, 99991, os.time() + 15)
        -- Esse storage pode ser verificado na função de dano físico

    elseif spell == "Bulk Up" then
        -- Aumenta defesa física por 15 segundos
        setPlayerStorageValue(cid, 99992, os.time() + 15)
        -- Pode ser usado para reduzir dano recebido

    elseif spell == "Charge" then
        -- Aumenta dano elétrico por 10 segundos
        setPlayerStorageValue(cid, 99993, os.time() + 10)
    end
    --]]

    return true
end