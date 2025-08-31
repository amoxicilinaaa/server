function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Duração da confusão escalonada por nível
    local rounds = math.random(4, 7) + math.floor(getPokemonLevel(cid) / 35)

    -- Parâmetros da condição "Confusion"
    local ret = {
        id    = 0,
        check = 0,
        cd    = rounds,
        cond  = "Confusion",
        spell = spell
    }

    -- Aplica dano em área com condição
    doMoveInArea2(cid, 0, selfArea1, dano, 0, 0, spell, ret)

    -- Efeito visual na posição definida
    addEvent(doSendMagicEffect, 1, PosCid1, 580)

    return true
end
