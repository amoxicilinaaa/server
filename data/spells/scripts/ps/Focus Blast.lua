function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Define os parâmetros da condição "Confusion"
    local ret = {}
    ret.id = 0                  -- ID do alvo (0 = área)
    ret.cd = 9                  -- Duração da condição
    ret.eff = 136               -- Efeito visual da Confusion
    ret.check = 0               -- Controle interno
    ret.spell = spell           -- Nome da spell
    ret.cond = "Confusion"      -- Tipo de condição aplicada

    local pos = getThingPosWithDebug(cid)

    -- Sequência de áreas que serão atingidas
    local areas = {
        rock5, rock4, rock3, rock2, rock1,
        rock5, rock4, rock3, rock2, rock1,
        rock5, rock4, rock3, rock2, rock1
    }

    -- Executa os ataques em área com delays progressivos
    for i = 0, 14 do
        -- Dano real com condição
        addEvent(doMoveInArea2, i * 320, cid, 112, areas[i + 1], FIGHTINGDAMAGE, min, max, spell, ret)

        -- Efeito visual sem dano
        addEvent(doMoveInArea2, i * 330, cid, 112, areas[i + 1], FIGHTINGDAMAGE, 0, 0, spell)
    end

    --[[ 💡 Sugestão opcional: se o alvo estiver com status "Stun", aplicar dano extra
    local target = spellData.target
    if isCreature(target) and getPlayerStorageValue(target, conds["Stun"]) >= 0 then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInArea2, 5000, cid, 112, rock3, FIGHTINGDAMAGE, bonusMin, bonusMax, spell)
        doSendAnimatedText(getThingPosWithDebug(target), "Exploited!", 215)
    end
    --]]

    return true
end