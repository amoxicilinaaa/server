function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local posC  = getThingPosWithDebug(cid)

    -- Define efeito visual por nome da spell
    local eff
    if spell == "Magic Coat" then
        eff = 616
    elseif spell == "Reflect" then
        eff = 399
    else
        eff = 135
    end

    -- Aplica efeito visual e storage de estado
    doSendMagicEffect(posC, eff)
    setPlayerStorageValue(cid, 21099, 1)

    return true
end