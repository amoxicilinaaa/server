function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max
    local posC1 = spellData.posC1

    -- Parâmetros da condição "Silence"
    local ret = {
        id = 0,
        cd = 9,
        check = 0,
        eff = 0,
        spell = spell,
        cond = "Silence"
    }

    -- Efeito visual de ativação
    doSendMagicEffect(posC1, 620)

    -- Execução da spell com dano e condição
    addEvent(doMoveInArea2, 1000, cid, 0, moonBlast, NORMALDAMAGE, min, max, spell, ret)

    -- Execução visual secundária sem dano nem condição
    local ret2 = {} -- vazio para efeito puro
    addEvent(doMoveInArea2, 1000, cid, 0, moonBlast, NORMALDAMAGE, 0, 0, spell, ret2)

    return true
end