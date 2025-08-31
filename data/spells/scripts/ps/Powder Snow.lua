function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    local snowP = getThingPosWithDebug(cid)

    -- Parâmetros da condição "Slow"
    local ret = {
        id = 0,
        cd = 10,
        check = 0,
        eff = 43,
        spell = spell,
        cond = "Slow"
    }

    -- Aplica dano tipo ICE em área com condição "Slow"
    doMoveInArea2(cid, 0, check, ICEDAMAGE, min, max, spell, ret)

    -- Efeito visual lateral (neve congelante)
    doSendMagicEffect({x = snowP.x + 1, y = snowP.y, z = snowP.z}, 206)

    return true
end