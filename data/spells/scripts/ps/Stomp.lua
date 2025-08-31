function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Parâmetros da condição "Stun"
    local ret = {
        id    = 0,
        cd    = 9,
        check = 0,
        eff   = 34,
        spell = spell,
        cond  = "Stun"
    }

    -- Aplica dano em área com efeito visual e condição
    doMoveInArea2(cid, 118, stomp, GROUNDDAMAGE, min, max, spell, ret)

    return true
end
