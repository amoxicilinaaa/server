function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local PosCid1 = spellData.posC1 or getThingPosWithDebug(cid) -- fallback se não vier posC1

    -- Efeitos visuais e texto flutuante por tipo de buff
    if spell == "Charge" then
        doSendAnimatedText(getThingPosWithDebug(cid), "CHARGE", 168)
        doSendMagicEffect(getThingPosWithDebug(cid), 177)

    elseif spell == "Swords Dance" then
        doSendMagicEffect(PosCid1, 408) -- efeito especial de dança de espadas

    elseif spell == "Bulk Up" then
        doSendMagicEffect(getThingPosWithDebug(cid), 91) -- efeito de fortalecimento

    else
        doSendAnimatedText(getThingPosWithDebug(cid), "FOCUS", 144)
        doSendMagicEffect(getThingPosWithDebug(cid), 132)
    end

    -- Ativa storage que pode ser usado para controle de estado
    setPlayerStorageValue(cid, 253, 1)

    --[[ 💡 Sugestão opcional: aplicar bônus de dano físico por 15 segundos
    if spell == "Swords Dance" then
        setPlayerStorageValue(cid, 99999, os.time() + 15) -- tempo de duração
        -- Esse storage pode ser verificado na função de dano para dobrar o valor
    elseif spell == "Bulk Up" then
        setPlayerStorageValue(cid, 99998, os.time() + 15) -- bônus de defesa
    end
    --]]
    return true
end