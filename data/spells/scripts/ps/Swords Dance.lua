function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local pos     = getThingPosWithDebug(cid)
    local posAlt  = PosCid1 or pos -- fallback se PosCid1 não estiver definido

    if spell == "Charge" then
        doSendAnimatedText(pos, "CHARGE", 168)
        doSendMagicEffect(pos, 177)

    elseif spell == "Swords Dance" then
        doSendMagicEffect(posAlt, 408) -- efeito especial para boost físico

    elseif spell == "Bulk Up" then
        doSendMagicEffect(pos, 91)

    else
        doSendAnimatedText(pos, "FOCUS", 144)
        doSendMagicEffect(pos, 132)
    end

    -- Ativa estado de foco
    setPlayerStorageValue(cid, 253, 1)

    return true
end
