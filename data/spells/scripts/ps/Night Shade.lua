function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max
    local PosCid1 = spellData.posC1

    -- Define duração escalável com base no level
    local rounds = math.random(4, 7) + math.floor(getPokemonLevel(cid) / 35)

    -- Define tipo de dano e efeito visual conforme spell
    local dano = (spell == "Confusion") and psyDmg or ghostDmg
    local eff = (spell == "Confusion") and 430 or 136

    -- Parâmetros da condição "Confusion"
    local ret = {
        id = 0,
        check = 0,
        cd = rounds,
        cond = "Confusion"
    }

    -- Execução da spell com ou sem delay visual
    if spell == "Confusion" then
        doMoveInArea2(cid, eff, selfArea1, dano, min, max, spell, ret)
    else
        addEvent(doSendMagicEffect, 1, PosCid1, 395)
        addEvent(doMoveInArea2, 110, cid, eff, selfArea1, dano, min, max, spell, ret)
    end

    return true
end