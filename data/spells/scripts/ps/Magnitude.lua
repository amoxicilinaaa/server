function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    local pos = getThingPosWithDebug(cid)
    local areas = {rock1, rock2, rock3, rock4, rock5}

    -- Parâmetros da condição "Stun"
    local ret = {
        id = 0,
        cd = 12,
        eff = 0,
        check = 0,
        spell = spell,
        cond = "Stun"
    }

    -- Função para remover outfit temporário
    local function endMove(cid)
        if isCreature(cid) then
            doRemoveCondition(cid, CONDITION_OUTFIT)
        end
    end

    -- Aplica outfit especial e paralisa o caster
    doSetCreatureOutfit(cid, {lookType = 1449}, -1)
    stopNow(cid, 16 * 360)
    addEvent(endMove, 16 * 360, cid)

    -- Executa múltiplas ondas de dano em áreas sequenciais
    for i = 0, 4 do
        addEvent(doMoveInArea2, i * 350, cid, 100, areas[i + 1], GROUNDDAMAGE, min, max, spell, ret)
        addEvent(doMoveInArea2, i * 360, cid, 100, areas[i + 1], GROUNDDAMAGE, 0, 0, spell, ret)
    end
    for i = 4, 8 do
        local a = i - 3
        addEvent(doMoveInArea2, i * 350, cid, 100, areas[a], GROUNDDAMAGE, min, max, spell, ret)
        addEvent(doMoveInArea2, i * 360, cid, 100, areas[a], GROUNDDAMAGE, 0, 0, spell, ret)
    end
    for i = 8, 12 do
        local a = i - 7
        addEvent(doMoveInArea2, i * 350, cid, 100, areas[a], GROUNDDAMAGE, min, max, spell, ret)
        addEvent(doMoveInArea2, i * 360, cid, 100, areas[a], GROUNDDAMAGE, 0, 0, spell, ret)
    end
    for i = 12, 16 do
        local a = i - 11
        addEvent(doMoveInArea2, i * 350, cid, 100, areas[a], GROUNDDAMAGE, min, max, spell, ret)
        addEvent(doMoveInArea2, i * 360, cid, 100, areas[a], GROUNDDAMAGE, 0, 0, spell, ret)
    end
    for i = 16, 20 do
        local a = i - 15
        addEvent(doMoveInArea2, i * 350, cid, 100, areas[a], GROUNDDAMAGE, min, max, spell, ret)
        addEvent(doMoveInArea2, i * 360, cid, 100, areas[a], GROUNDDAMAGE, 0, 0, spell, ret)
    end

    return true
end