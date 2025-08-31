function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Parâmetros da condição "Miss"
    local ret = {
        id    = 0,
        cd    = 9,
        eff   = 770,
        check = 0,
        spell = spell,
        cond  = "Miss"
    }

    -- Dano base com efeito 784
    doMoveInArea2(cid, 784, muddy, POISONDAMAGE, 0, 0, spell, ret)

    -- Dano real com efeito 770
    doMoveInArea2(cid, 770, muddy, POISONDAMAGE, min, max, spell, ret)

    -- Efeito adicional na posição de pid
    doSendMagicEffect(getThingPosWithDebug(pid), 854)

    return true
end
