function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local pos = getThingPosWithDebug(cid)

    -- Áreas de impacto em sequência
    local areas = {rock1, rock2, rock3, rock4, rock5}

    -- Parâmetros da condição Stun
    local ret = {
        id = 0,
        cd = 12,
        eff = 0,
        check = 0,
        spell = spell,
        cond = "Stun"
    }

    -- Função que remove o outfit especial após o fim da animação
    local function endMove(cid)
        if isCreature(cid) then
            doRemoveCondition(cid, CONDITION_OUTFIT)
        end
    end

    -- Aplica outfit especial e impede movimento
    doSetCreatureOutfit(cid, {lookType = 1449}, -1)
    stopNow(cid, 16 * 360)
    addEvent(endMove, 16 * 360, cid)

    -- Executa 20 ciclos de dano e efeito visual alternado
    for i = 0, 20 do
        local a = (i < 5 and i + 1) or ((i - 3) % 5 + 1)
        local delay = i * 350

        -- Dano real
        addEvent(doMoveInArea2, delay, cid, 100, areas[a], GROUNDDAMAGE, min, max, spell, ret)

        -- Efeito visual sem dano
        addEvent(doMoveInArea2, delay + 10, cid, 100, areas[a], GROUNDDAMAGE, 0, 0, spell, ret)
    end

    --[[ 🪨 Sugestão opcional: bônus contra tipo Fire ou Flying
    local target = spellData.target
    if isCreature(target) and (isPokeType(target, "Fire") or isPokeType(target, "Flying")) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInArea2, 8000, cid, 100, rock3, GROUNDDAMAGE, bonusMin, bonusMax, spell, ret)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end