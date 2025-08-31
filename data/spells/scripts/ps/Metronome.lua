function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max
    local pos = getThingPosWithDebug(cid)
    pos.y = pos.y - 1

    -- Lista de spells possíveis
    local spells = {
        "Shadow Storm",
        "Electric Storm",
        "Magma Storm",
        "Blizzard",
        "Leaf Storm",
        "Hydropump",
        "Sludge Rain",
        "Falling Rocks"
    }

    -- Seleciona uma spell aleatória
    local randommove = spells[math.random(1, #spells)]

    -- Efeito visual de invocação
    doSendMagicEffect(pos, 161)

    -- Executa spell aleatória com pequeno delay
    addEvent(docastspell, 200, cid, randommove)

    -- Aplica dano tipo NORMAL em área após invocação
    addEvent(doMoveInArea2, 215, cid, 0, BigArea2, NORMALDAMAGE, min, max, spell, ret)

    return true
end