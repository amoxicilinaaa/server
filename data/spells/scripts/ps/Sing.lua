function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Parâmetros da condição "Sleep"
    local ret = {
        id = 0,
        cd = math.random(5, 10),
        check = 0,
        first = true,
        cond = "Sleep"
    }

    -- Aplica dano tipo Normal com chance de Sleep em área
    doMoveInArea2(cid, 33, selfArea1, NORMALDAMAGE, 0, 0, spell, ret)

    return true
end
