function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Condição "Sleep" com duração aleatória
    local ret = {
        id = 0,
        cd = math.random(3, 4),
        check = 0,
        first = true,
        cond = "Sleep"
    }

    -- Sequência de áreas animadas
    local areas = {rock1, rock2, rock3, rock4, rock5, rock4, rock3, rock2, rock1}

    for i = 0, 8 do
        -- Efeitos iniciais em área central
        doMoveInArea2(cid, 570, selfArea1, NORMALDAMAGE, 0, 0, spell, ret)
        doMoveInArea2(cid, 549, selfArea1, NORMALDAMAGE, 0, 0, spell)

        -- Efeitos em áreas animadas com delay
        addEvent(doMoveInArea2, i * 400, cid, 549, areas[i + 1], NORMALDAMAGE, 0, 0, spell, ret)
        addEvent(doMoveInArea2, i * 410, cid, 571, areas[i + 1], NORMALDAMAGE, 0, 0, spell)
    end

    return true
end