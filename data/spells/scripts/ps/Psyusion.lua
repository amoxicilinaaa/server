function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max
    local posC1 = getThingPosWithDebug(cid)

    -- Define duração da condição com base no level
    local rounds = math.random(4, 7)
    rounds = rounds + math.floor(getPokemonLevel(cid) / 35)

    -- Efeitos visuais e áreas de impacto
    local eff = {429, 585, 133, 430, 133}
    local area = {psy1, psy2, psy3, psy4, psy5}

    -- Parâmetros da condição Confusion
    local ret = {
        id = 0,
        check = 0,
        cd = rounds,
        cond = "Confusion"
    }

    -- Ativa storage visual temporária
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 1600, cid, 3644587, -1)

    -- Efeito inicial de ativação
    addEvent(doSendMagicEffect, 20, posC1, 892)

    -- Execução sequencial das ondas psíquicas
    for i = 0, 4 do
        addEvent(doMoveInArea2, i * 400, cid, eff[i + 1], area[i + 1], psyDmg, min, max, spell, ret)
    end

    return true
end
