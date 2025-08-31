function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    local pos = getThingPosWithDebug(cid)
    local areas = {rock1, rock2, rock3, rock4, rock5}

    -- Condição "Paralyze"
    local ret = {
        id = 0,
        cd = 9,
        eff = 103,
        check = 0,
        first = true,
        cond = "Paralyze"
    }

    -- Função que executa os ataques em sequência
    local function sendAtk(cid)
        if not isCreature(cid) then return end

        -- Remove outfit temporária e storage visual
        doRemoveCondition(cid, CONDITION_OUTFIT)
        setPlayerStorageValue(cid, 9658783, -1)

        -- Executa dano em ondas com delay
        for i = 0, 4 do
            addEvent(doMoveInArea2, i * 400, cid, 103, areas[i + 1], psyDmg, min, max, spell, ret)
            addEvent(doMoveInArea2, i * 410, cid, 103, areas[i + 1], psyDmg, 0, 0, spell)
        end
    end

    -- Aplica outfit especial e ativa storage visual
    doSetCreatureOutfit(cid, {lookType = 1001}, -1)
    setPlayerStorageValue(cid, 9658783, 1)

    -- Executa ataque após delay
    addEvent(sendAtk, 2000, cid)

    return true
end