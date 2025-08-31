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
        eff   = 0,
        spell = spell,
        cond  = "Stun"
    }

    -- Interrompe movimento por 2 segundos
    stopNow(cid, 2000)

    -- Aplica dano com efeito visual e condição
    doMoveInArea2(cid, 212, reto5, NORMALDAMAGE, min, max, spell, ret)

    return true
end
